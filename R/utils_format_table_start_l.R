strip_math <- function(.){
  characters <- list(
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
    'cdot' = '.'
  )
  if(grepl('!@', ., fixed = TRUE)){
    for(x in names(characters)){
      . <- gsub(x, characters[[x]], ., fixed = TRUE)
    }
  }
  if(grepl('CHECKMARK', ., fixed = TRUE)){
    . <- gsub('CHECKMARK', 'c', ., fixed = TRUE)
  }
  .
}

z_score <- function(x, group){
  if(sd(group) == 0){
    return(0)
  }
  (x - mean(group)) / sd(group)
}

remove_outliers <- function(maxwidth, df) {
  excess <- list()
  recipients_excess <- list()

  for (i in seq(1, length(maxwidth))) {
    col <- df[, i]
    max_width_col <- maxwidth[[i]]

    if (length(col[col == max_width_col]) == 1) {
      col <- col[!col %in% c(max_width_col)]

    }

    z <- z_score(max_width_col, col)

    if (z > 5) {
      diff <- maxwidth[[i]] - maxwidth[[i]] * 0.65
      maxwidth[[i]] <- maxwidth[[i]] * 0.65
      excess <- append(excess, diff)

    } else {
      recipients_excess <- append(recipients_excess, i)

    }
  }

  if (length(excess != 0)) {
    total <- sum(unlist(excess))

    if (length(recipients_excess) != 0) {
      recieve <- unlist(recipients_excess)
      distribute <- total / length(unique(recieve))

      for (i in unique(recieve)) {
        maxwidth[[i]] <- maxwidth[[i]] + distribute

      }

    } else {
      distribute <- total / length(maxwidth)
      maxwidth <-
        purrr::map_dbl(maxwidth, function(.) {
          . + distribute
        })

    }

  }

  maxwidth
}

find_chr_length <- function(., size) {
  round(grid::convertWidth(grid::grobWidth(grid::textGrob(
    ., gp = grid::gpar(fontsize = size)
  )), 'cm'), 2)
}

type_setting <- function(largest_type_size) {
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


create_body_rows_l <- function(data) {
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



calc_best_column_width_l <- function(data) {
  body_rows <- create_body_rows_l(data = data)

  valid <- list()

  for (i in seq(5, 12)) {
    new_df <- apply(body_rows, c(1, 2), find_chr_length, i)
    maxwidth <- apply(new_df, 2, max)
    maxwidth <- remove_outliers(maxwidth, new_df)
    if (sum(maxwidth) < 17.6) {
      diff <- 17.6 - sum(maxwidth)
      distribute <- diff / length(maxwidth)
      maxwidth <-
        purrr::map_dbl(maxwidth, function(.) {
          . + distribute
        })
      valid[[as.character(i)]] <- maxwidth
    }
  }
  valid
}

get_col_labels_l <- function(data) {
  stubh <- dt_stubhead_get(data = data)
  stub_available <- dt_stub_df_exists(data = data)
  collabels <- dt_boxhead_get_vars_labels_default(data = data)

  if (isTRUE(stub_available) && length(stubh$label) > 0) {
    collabels <- append(stubh$label, collabels)
  } else if (isTRUE(stub_available)) {
    collabels <- append('', collabels)
  }
  collabels
}

best_type_setting_collabels_l <- function(data) {
  collabels <- get_col_labels_l(data = data)
  valid <- list()
  for (i in seq(5, 12)) {
    lengths <- purrr::map_dbl(collabels, find_chr_length, i)
    if (sum(lengths) < 17.6) {
      valid[[as.character(i)]] <- lengths
    }
  }

  largest_type_size <- max(as.integer(names(valid)))

  if (largest_type_size > 6) {
    type_size <- as.character(largest_type_size)
    best <- list(type_size = type_setting(type_size),
                 header = valid[[type_size]])
  } else {
    best <- NA
  }
  best
}


best_type_setting_all_l <- function(data) {
  collabels <- get_col_labels_l(data = data)
  body_rows <- create_body_rows_l(data = data)
  full_tab <- rbind(collabels, body_rows)
  valid <- list()
  for (i in seq(5, 12)) {
    new_df <- apply(full_tab, c(1, 2), find_chr_length, i)
    maxwidth <- apply(new_df, 2, max)
    maxwidth <- remove_outliers(maxwidth, new_df)
    if (sum(maxwidth) < 17.6) {
      diff <- 17.6 - sum(maxwidth)
      distribute <- diff / length(maxwidth)
      maxwidth <-
        purrr::map_dbl(maxwidth, function(.) {
          . + distribute
        })
      valid[[as.character(i)]] <- maxwidth
    }
  }

  largest_type_size <- max(as.integer(names(valid)))

  if (largest_type_size > 6) {
    type_size <- as.character(largest_type_size)
    best <- list(type_size = type_setting(type_size),
                 header = valid[[type_size]])
  } else {
    best <- NA
  }
  best
}

calc_column_width_l <- function(data) {

  #possibilities:


    # small labels, small data
    # small labels, normal data

    # normal labels, small data
    # normal labels, normal data

  #width based on data
  valid <- calc_best_column_width_l(data = data)

  #get the largest size option available
  if (length(valid) != 0) {
    largest_type_size <- as.character(max(as.integer(names(valid))))
    type_size <- type_setting(largest_type_size)
    sizing_columns <- valid[[largest_type_size]]

    #normal data
    if (is.na(type_size)) {

      #width based on labels
      heading_row <- best_type_setting_collabels_l(data = data)

      #normal labels
      if (is.na(heading_row$type_size)) {

        #bind labels+data and recalculate max width needed at normal pt
        col_size_labels <- heading_row$header
        together <- rbind(sizing_columns, col_size_labels)
        sizing_columns <- apply(together, 2, max)

        #if width needed greater than page width, go back recalculate for smaller font
        if(sum(sizing_columns) > 17.6){
          heading_row <- best_type_setting_all_l(data = data)
          sizing_columns <- heading_row$header
          type_size <- heading_row$type_size
        }

        #if width needed less than page width, find diff and distribute evenly
        if(sum(sizing_columns) < 17.6){
          diff <- 17.6 - sum(sizing_columns)
          distribute <- diff/length(sizing_columns)
          sizing_columns <- purrr::map_dbl(sizing_columns, function(.){.+distribute})
        }

        #if equal, just use the max width needed by each column for sizing

      #if normal data and small labels
      } else {
        sizing_columns <- heading_row$header
        type_size <- heading_row$type_size

      }
    }

    #TODO:
    #If best size for collabels < 12 pt and best size for data rows = 12 pt:


    header <-
      paste0('\\begin{longtable}{',
             paste(sprintf(
               "p{%scm}", as.character(sizing_columns)
             ), collapse = ''),
             '} \n')

  } else {
    stop('no typeset available')
    header <- NULL
    type_size <- NULL

  }

  list(header = header,
       type_size = type_size)
}
