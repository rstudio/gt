find_chr_length <- function(., size){
  round(grid::convertWidth(grid::grobWidth(grid::textGrob(., gp=grid::gpar(fontsize=size))), 'cm'),2)
}

type_setting <- function(largest_type_size){
  sizing_options <- list(
    '5' = '\\tiny \n',
    '6' = '\\tiny \n',
    '7' = '\\tiny \n',
    '8' = '\\scriptsize \n',
    '9' = '\\scriptsize \n',
    '10' = '\\footnotesize \n',
    '11' = '\\small \n',
    '12' = NA
  )
  sizing_options[[largest_type_size]]
}


create_body_rows_l <- function(data){

  body <- dt_body_get(data = data)
  default_vars <- dt_boxhead_get_vars_default(data = data)
  n_data_cols <- dt_boxhead_get_vars_default(data = data) %>% length()
  stub_components <- dt_stub_components(data = data)
  stub_available <- dt_stub_components_has_rowname(stub_components)

  if (stub_available) {
    n_cols <- n_data_cols + 1
  } else {
    n_cols <- n_data_cols
  }

  if ("rowname" %in% names(body)) {
    default_vars <- c("rowname", default_vars)
  }

  if (stub_available) {
    default_vars <- c("::rowname", default_vars)

    body <-
      dt_stub_df_get(data = data) %>%
      dplyr::select(rowname) %>%
      dplyr::rename(`::rowname` = rowname) %>%
      cbind(body)
  }

  body_content <- as.vector(t(body[, default_vars]))
  row_splits <- split(body_content, ceiling(seq_along(body_content) / n_cols))
  data_rows <- do.call(rbind, lapply(row_splits, function(x) as.data.frame(t(x))))
  data_rows
}

calc_best_column_width_l <- function(data){
  body_rows <- create_body_rows_l(data = data)

  valid <- list()

  for(i in seq(5, 12)){
    new_df <- apply(body_rows, c(1,2), find_chr_length, i)
    maxwidth <- apply(new_df,2,max)
    if(sum(maxwidth) < 17.6){
      valid[[as.character(i)]] <- maxwidth
    }
  }

  valid
}

best_type_setting_collabels_l <- function(data){
  stubh <- dt_stubhead_get(data = data)
  stub_available <- dt_stub_df_exists(data = data)
  labels <- dt_boxhead_get_vars_labels_default(data = data)

  if (isTRUE(stub_available) && length(stubh$label) > 0){
    labels <- append(stubh$label, labels)
  } else if (isTRUE(stub_available)) {
    labels <- append('', labels)
  }

  valid <- list()
  for(i in seq(5, 12)){
    lengths <- purrr::map_dbl(labels, find_chr_length, i)
    if(sum(lengths) < 17.6){
      valid[[as.character(i)]] <- lengths
    }
  }

  largest_type_size <- max(as.integer(names(valid)))

  if(largest_type_size > 6){
    type_size <- as.character(largest_type_size)
    best <- list(type_size = type_setting(type_size),
                 header = valid[[type_size]])
  } else {
    best <- NA
  }
  best
}


calc_column_width_l <- function(data){

  #First calculate based on data - priority on not having line breaks in data section
  #If the normal size font (12pt) can be used by the data, test to see what font should be used based on collabels to prevent linebreaks
  #If largest font that can be used by collabels to prevent stacking is less than 6pt, use normal size and allow linebreaks in the collabels
  #If largest font is greater than 6pt, use that font size to prevent all linebreaks in table

  #calculate best width based on data, exclude collabels
  valid <- calc_best_column_width_l(data = data)

  #if there are multiple size options that can fit page width, use the largest size font option
  if(length(valid) != 0){

    largest_type_size <- as.character(max(as.integer(names(valid))))
    type_size <- type_setting(largest_type_size)
    sizing_columns <- valid[[largest_type_size]]

    #if the best type size determined by data is set to normal (12 pt font), test the best size determined by column labels
    if(is.na(type_size)){

      #calculate the best type size including the labels, if the best determined by collabel is na (meaning less than 6pt font):
      if(is.na(best_type_setting_collabels_l(data = data))){

      #use type setting determined by data, evenly space columns along the page width,
      sizing_columns <- purrr::map_chr(sizing_columns, function(.){as.character(round(17.6/length(sizing_columns) - 0.0352778, 2))})

      #if best size is greater than 6pt font, use type setting determined by collabels, space based on that
      } else {

      col_labels_sizing <- best_type_setting_collabels_l(data = data)
      sizing_columns <- col_labels_sizing$header
      type_size <- col_labels_sizing$type_size

      }
    }

    header <- paste0('\\begin{longtable}{', paste(sprintf("p{%scm}", as.character(sizing_columns)), collapse = ''), '} \n')

  } else {

    stop('no typeset available')
    header <- NULL
    type_size <- NULL

  }

  list(header = header,
       type_size = type_size)
}
