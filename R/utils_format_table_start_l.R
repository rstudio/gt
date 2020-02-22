strip_nonmath <- function(.){
  if(grepl('textsuperscript{', ., fixed = TRUE)){
    . <- gsub('\\textsuperscript{', '', ., fixed = TRUE)
    . <- gsub('}', '', ., fixed = TRUE)
  }
  if(grepl('CHECKMARK', ., fixed = TRUE)){
    . <- gsub('CHECKMARK', 'c', ., fixed = TRUE)
  }
  .
}

#math notation with subscripts makes subscripted text smaller
#reduces subscripted text to 55% of original width for more accurate col sizing
subscript_special <- function(.) {
  vect <- unlist(qdapRegex::rm_between(., '_{', '}', extract = TRUE))
  if (length(vect[!is.na(vect)]) > 0) {
    text_vect <-
      purrr::map_chr(vect, function(.) {
        substr(., 1, round(nchar(.) * .55, 0))
      })
    with_indicator <-
      purrr::map_chr(vect, function(.) {
        paste0('_{', ., '}')
      })
    names(text_vect) <- with_indicator
    for (x in names(text_vect)) {
      . <- gsub(x, text_vect[[x]], ., fixed = TRUE)
    }
  }
  .
}

strip_math <- function(.){
  characters_math <- list(
    '!@' = '',
    '*' = '',
    '{' = '',
    '}' = '',
    '<' = '',
    '>' = '',
    '_' = '',
    'exp' = 'e',
    'sqrt' = '2',
    'beta' = 'B',
    'mu' = 'u',
    'tau' = 't',
    'cdot' = '.',
    '\\' = '',
    'textsuperscript' = '',
    'CHECKMARK' = 'c'
  )

  if(grepl('!@', ., fixed = TRUE)){
    . <- subscript_special(.)
    for(x in names(characters_math)){
      . <- gsub(x, characters_math[[x]], ., fixed = TRUE)
    }
  } else {
    . <- strip_nonmath(.)
  }
  . <- trimws(.)
}

z_score <- function(x, group){
  if(stats::sd(group) == 0 | is.na(stats::sd(group))){
    return(0)
  }
  (x - mean(group)) / sd(group)
}

is_dimensional <- function(test_element){
  if(is.null(dim(test_element))){
    return(FALSE)
  }
  TRUE
}

recalculate_outlier_widths <- function(required_widths_df) {
  adjusted_max_widths <- c()
  unadjusted_max_widths <- c()
  diff_required_adjusted_maxes <- c()
  n_cols <- length(required_widths_df)
  if(is_dimensional(required_widths_df)){
    n_cols <- dim(required_widths_df)[2]
  }

  for (col in seq(1, n_cols)) {
    indiv_col <- required_widths_df[[col]]

    if(is_dimensional(required_widths_df)){
      indiv_col <- required_widths_df[, col]
    }

    maxw_indiv_col <- max(indiv_col)

    if(typeof(indiv_col) == 'list'){
      indiv_col <- unlist(indiv_col)
    }

    occurrence <- matrixStats::count(indiv_col, value = maxw_indiv_col)

    if (occurrence == 1) {
      indiv_col <- indiv_col[!indiv_col %in% c(maxw_indiv_col)]
    }

    z <- z_score(maxw_indiv_col, indiv_col)

    if (z > 4) {
      new_max <- stats::sd(indiv_col)*4 + mean(indiv_col)
      diff <- maxw_indiv_col - new_max
      adjusted_max_widths <- append(adjusted_max_widths, new_max)
      diff_required_adjusted_maxes <- append(diff_required_adjusted_maxes, diff)
      unadjusted_max_widths <- append(unadjusted_max_widths, NA)

    } else {
      unadjusted_max_widths <- append(unadjusted_max_widths, maxw_indiv_col)
      adjusted_max_widths <- append(adjusted_max_widths, NA)
    }
  }

  list(adjusted_max_widths = adjusted_max_widths,
       unadjusted_max_widths = unadjusted_max_widths,
       diff_required_adjusted_maxes = diff_required_adjusted_maxes)
}

distribute_values_evenly <- function(amt_distribute, distribute_to) {
  distribute_increments <- sum(amt_distribute) / length(distribute_to[!is.na(distribute_to)])
  purrr::map_dbl(distribute_to, function(.x) {
    if(!is.na(.x)){
    .x <- .x + distribute_increments
    }
    .x
  })
}

remove_outliers <- function(required_widths_df){
  width_adjustment_data <- recalculate_outlier_widths(required_widths_df = required_widths_df)

  with(width_adjustment_data, {

    if (length(diff_required_adjusted_maxes) != 0 && length(unadjusted_max_widths) != 0) {

      if(length(unadjusted_max_widths) != 0){

        unadjusted_max_widths <- distribute_values_evenly(amt_distribute = diff_required_adjusted_maxes,
                                                          distribute_to = unadjusted_max_widths)
      } else {
        adjusted_max_widths<- distribute_values_evenly(amt_distribute = diff_required_adjusted_maxes,
                                                       distribute_to = adjusted_max_widths)
      }
    }

    adjusted_max_widths[is.na(adjusted_max_widths)] <- unadjusted_max_widths[!is.na(unadjusted_max_widths)]
    adjusted_max_widths
  })
}



find_chr_length <- function(., size) {
  round(grid::convertWidth(grid::grobWidth(grid::textGrob(
    ., gp = grid::gpar(fontsize = size)
  )), 'cm'), 2)
}

type_setting <- function(type_size) {
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
  sizing_options[[as.character(type_size)]]
}

get_data_rows_l <- function(data) {
  body <- dt_body_get(data = data)
  default_vars <- dt_boxhead_get_vars_default(data = data)
  n_data_cols <-
    dt_boxhead_get_vars_default(data = data) %>% length()
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
  row_splits <-
    split(body_content, ceiling(seq_along(body_content) / n_cols))
  data_rows <-
    do.call(rbind, lapply(row_splits, function(x)
      as.data.frame(t(x))))
  data_rows <- apply(data_rows, c(1, 2), strip_math)
  data_rows
}

get_collabels_l <- function(data) {
  stubh <- dt_stubhead_get(data = data)
  stub_available <- dt_stub_df_exists(data = data)
  collabels <- dt_boxhead_get_vars_labels_default(data = data)

  if (isTRUE(stub_available) && length(stubh$label) > 0) {
    collabels <- append(stubh$label, collabels)
  } else if (isTRUE(stub_available)) {
    collabels <- append('', collabels)
  }
  purrr::map_chr(collabels, function(.){strip_math(.)})
}


construct_sizing_params <- function(data) {
  collabels <- get_collabels_l(data = data)
  data_rows <- get_data_rows_l(data = data)
  full_tbl <- rbind(collabels, data_rows)

  list(
    components = list(data_rows, collabels, full_tbl),
    labels = c('data_rows', 'collabels', 'full_tbl')
  )
}


validate_maxwidth_per_column <- function(max_required_widths) {
  tbl_width <- sum(max_required_widths)

  #if calculated width less than width of page (approx. 17.6 cm)
  if (tbl_width <= 17.6) {
    final_tbl_width <-
      purrr::map_dbl(max_required_widths, function(.x) {
        .x + (17.6 - tbl_width) / length(max_required_widths)
      })
    return(final_tbl_width)
  }

  return(NULL)
}



max_width_required_per_column <- function(tbl_sizing_data) {
  with(tbl_sizing_data, {
    if(is_dimensional(tbl_component)){
      required_widths_df <- apply(tbl_component, c(1, 2), find_chr_length, fontsize)
      maxwidth <- remove_outliers(required_widths_df = required_widths_df)
    } else {
      maxwidth <- purrr::map_dbl(tbl_component, find_chr_length, fontsize)
    }

    validate_maxwidth_per_column(max_required_widths = maxwidth)
  })
}


find_valid_fontsizing <- function(tbl_sizing_data) {
  valid <- NULL
  range_fontsize_pt <- seq(5, 12)

  for (fs in range_fontsize_pt) {
    tbl_sizing_data$fontsize <- fs
    maxwidth <- max_width_required_per_column(tbl_sizing_data)

    if (!is.null(maxwidth)) {
      valid <- list(type_size = fs, colwidths = maxwidth)
    }
  }
  if(is.null(valid)){
    valid <- list(type_size = NULL, colwidths = NULL)
  }
  valid
}

fmt_header_latex <- function(sizing_columns){
  paste0('\\begin{longtable}{',
         paste(sprintf(
           "p{%scm}", as.character(sizing_columns)
         ), collapse = ''),
         '} \n')
}


get_type_settings <- function(sizing_params) {
  components <- sizing_params$components
  list_labels <- sizing_params$labels

  sizing_options <- list()
  for (i in seq(1, length(components))) {

    sizing_options[[list_labels[i]]] <-
      find_valid_fontsizing(tbl_sizing_data = list(tbl_component = components[[i]]))

  }
  sizing_options
}

no_settings_found <- function(sizing_params, best_type_settings){
  with(best_type_settings, {

    if(is.null(collabels$type_size) && is.null(data_rows$type_size)){
      type_size <- type_setting(5)
      sizing_columns <- rep(17.6/length(sizing_params$components[[2]]), length(sizing_params$components[[2]]))

    } else{

      #if the collabels are really big, but the data fits avg smallest size with the size that data will fit
      #avoids shrinking data really small to accommodate very long collabels
      if(is.null(collabels$type_size)){
        type_size <- round(mean(c(data_rows$type_size, 5)), 0)
        tbl_component <- sizing_params$components[[1]]
        sizing_columns <- max_width_required_per_column(tbl_sizing_data = list(tbl_component = tbl_component,
                                                                             fontsize = type_size))
        type_size <- type_setting(type_size)

        #if the data is big and collabels are small, just make it smallest font with even spaced columns
      } else {
        type_size <- type_setting(5)
        sizing_columns <- rep(17.6/length(sizing_params$components[[2]]), length(sizing_params$components[[2]]))
      }
    }
    list(type_size = type_size,
         header = fmt_header_latex(sizing_columns = sizing_columns))
  })
}

default_typesetting_option <- function(data){
  sizing_params <- construct_sizing_params(data = data)
  best_type_settings <- get_type_settings(sizing_params = sizing_params)

  with(best_type_settings, {

    if(is.null(collabels$type_size) | is.null(data_rows$type_size)){

      table_fmt <- no_settings_found(sizing_params = sizing_params,
                                     best_type_settings = best_type_settings)
    } else {

    type_sizing <- c(full_tbl$type_size, collabels$type_size, data_rows$type_size)

    #if they are all the same, use the colwidth calculated from full table
    if(length(unique(type_sizing) == 1)){
      type_size <- type_setting(full_tbl$type_size)
      sizing_columns <- full_tbl$colwidths

    } else {

      #long column labels, small data
      if(data_rows$type_size > collabels$type_size){

        #if they are very different sizes, avg them
        #avoids shrinking data really tiny to accomodate long labels- ok if labels line break a little
        if(data_rows$type_size - collabels$type_size > 1){

          type_size <- round(mean(c(data_rows$type_size, collabels$type_size)), 0)
          tbl_component <- sizing_params$components[[1]]
          sizing_columns <- max_width_required_per_column(tbl_sizing_data = list(tbl_component = tbl_component,
                                                               fontsize = type_size))
          type_size <- type_setting(type_size)

          #if they are about the same just use the collabel size
        } else {

          type_size <- type_setting(collabels$type_size)
          sizing_columns <- collabels$colwidths

        }

      #small column labels, long data
      } else {
        #always avoid line breaks in the data frame because that creates messy tables.
        type_size <- type_setting(data_rows$type_size)
        sizing_columns <- data_rows$colwidths

      }

    }
    table_fmt <-list(type_size = type_size,
       header = fmt_header_latex(sizing_columns = sizing_columns))
    }
    table_fmt
  })
}


no_line_breaks <- function(data){
  sizing_params <- construct_sizing_params(data = data)
  settings <- get_type_settings(sizing_params = sizing_params)
  type_size <- type_setting(settings$full_tbl$type_size)
  sizing_columns <- settings$full_tbl$colwidths
  list(header = fmt_header_latex(sizing_columns = sizing_columns),
       type_size = type_size)
}

calc_column_width_l <- function(data) {

  if (latex_cache$line.breaks){
    default_typesetting_option(data = data)
  } else {
    no_line_breaks(data = data)
  }

}
