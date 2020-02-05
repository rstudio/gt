remove_checkmark <- function(element){
  if(grepl('CHECKMARK', element, fixed = TRUE)){
    element <- gsub('CHECKMARK', 'c', element, fixed = TRUE)
  }
  element
}

remove_predefined_tex_calls <- function(element, math_detect = TRUE) {

  if (grepl('textsuperscript', element, fixed = TRUE)) {

    if (math_detect == TRUE) {
      element <- gsub('\\textsuperscript', '', element, fixed = TRUE)

    } else {
      element <- gsub('\\textsuperscript{', '', element, fixed = TRUE)
      element <- gsub('}', '', element, fixed = TRUE)
    }

  }
  remove_checkmark(element)
}

strip_math <- function(element){
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

  if(grepl('!@', element, fixed = TRUE)){

    for(x in names(characters)){
      element <- gsub(x, characters[[x]], element, fixed = TRUE)
    }
    element <- remove_predefined_tex_calls(element)

  } else {
    element <- remove_predefined_tex_calls(element, math_detect = FALSE)
  }
  element
}

z_score <- function(x, group){
  if(sd(group) == 0 | is.na(sd(group))){
    return(0)
  }
  (x - mean(group)) / sd(group)
}


recalculate_outlier_widths <- function(required_widths_df) {
  adjusted_max_widths <- c()
  unadjusted_max_widths <- c()
  diff_required_adjusted_maxes <- c()
  n_cols <- dim(required_widths_df)[2]

  for (col in seq(1, n_cols)) {
    indiv_col <- required_widths_df[, col]
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
      new_max <- sd(indiv_col)*4 + mean(indiv_col)
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



tbl_components_for_sizing <- function(data) {
  body <- dt_body_get(data = data)
  default_vars <- dt_boxhead_get_vars_default(data = data)

  collabels <- dt_boxhead_get_vars_labels_default(data = data)
  stubh <- dt_stubhead_get(data = data)
  stub_components <- dt_stub_components(data = data)
  stub_available <- dt_stub_components_has_rowname(stub_components)
  n_cols <- length(collabels)

  if ("rowname" %in% names(body)) {
    default_vars <- c("rowname", default_vars)
  }

  if (stub_available) {
    n_cols <- n_cols + 1
    default_vars <- c("::rowname", default_vars)

    body <-
      stubh %>%
      dplyr::select(rowname) %>%
      dplyr::rename(`::rowname` = rowname) %>%
      cbind(body)

    if(length(stubh$label) > 0){
      collabels <- append(stubh$label, collabels)
    } else {
      collabels <- append('', collabels)
    }
  }

  body_content <- as.vector(t(body[, default_vars]))
  row_splits <-
    split(body_content, ceiling(seq_along(body_content) / n_cols))
  data_rows <-
    do.call(rbind, lapply(row_splits, function(x)
      as.data.frame(t(x))))

  data_rows <- apply(data_rows, c(1, 2), strip_math)
  collabels <- purrr::map_chr(collabels, function(.){strip_math(.)})

  list(data_rows = data_rows,
       collabels = collabels,
       full_tbl = rbind(collabels, data_rows))
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
    required_widths_df <-
      apply(tbl_component, c(1, 2), find_chr_length, fontsize)

    if (drop_outliers) {
      maxwidth <- remove_outliers(required_widths_df = required_widths_df)
    } else {
      maxwidth <- apply(required_widths_df, 2, max)
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
      valid <- list(type_size = type_setting(fs), colwidths = maxwidth)
    }
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
  drop_outliers <- sizing_params$drop_outliers
  list_labels <- sizing_params$labels

  sizing_options <- list()
  for (i in seq(1, length(components))) {
    tbl_sizing_data <- list(tbl_component = components[[i]],
                            drop_outliers = drop_outliers[i])
    sizing_options[[list_labels[i]]] <-
      find_valid_fontsizing(tbl_sizing_data = tbl_sizing_data)
  }
  sizing_options
}

calculate_typesetting_options <- function(data) {
  tbl_components_data <- tbl_components_for_sizing(data = data)
  with(tbl_components_data, {

    list(
        components = list(data_rows, collabels, full_tbl),
        drop_outliers = c(TRUE, FALSE, TRUE),
        labels = c('data_rows', 'collabels', 'full_tbl')
      )
  })
}

calculate_typesetting_options <- function(data){
  sizing_params <- construct_sizing_params(data = data)
  type_setting <- get_type_settings(sizing_params = sizing_params)
}


default_setting <- function(data){
  #possibilities:
  # small labels, small data
  # small labels, normal data
  # normal labels, small data
  # normal labels, normal data

  #width based on data
  valid <- best_type_setting_datarows_l(data = data)

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


    header <- fmt_header_latex(sizing_columns = sizing_columns)

  } else {
    stop('no typeset available')
    header <- NULL
    type_size <- NULL

  }

  list(header = header,
       type_size = type_size)

}

no_line_breaks <- function(data){
  settings <- best_type_setting_all_l(data = data, remove_outliers = FALSE)
  list(header = fmt_header_latex(sizing_columns = settings$header),
       type_size = settings$type_size)
}

calc_column_width_l <- function(data) {

  if (latex_cache$line.breaks){
    default_setting(data = data)
  } else {
    no_line_breaks(data = data)
  }

}
