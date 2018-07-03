#' @importFrom purrr map_chr
#' @importFrom dplyr mutate select everything bind_rows tibble
#' @noRd
encase_tbl <- function(data,
                       data_types = NULL) {

  n_col <- ncol(data)

  if (is.null(data_types)) {
    data_types <-
      seq(ncol(data)) %>%
      purrr::map_chr(.f = function(x) class(data[[x]]))
  }

  data <- data %>%
    dplyr::mutate(`:row_number:` = 1:nrow(data)) %>%
    dplyr::mutate(`:group_name:` = NA_character_) %>%
    dplyr::mutate(`:row_name:` = NA_character_) %>%
    dplyr::select(`:row_number:`, `:group_name:`, `:row_name:`, everything())

  if ("rowname" %in% colnames(data)) {

    rowname_col <- which(colnames(data[, c(-1, -2, -3)]) == "rowname")
    data_types <- data_types[-rowname_col]
    n_col <- n_col - 1

    data <- data %>%
      dplyr::mutate(`:row_name:` = rowname) %>%
      dplyr::select(-rowname)
  }

  data <-
    dplyr::bind_rows(
      dplyr::tibble(
        `:row_number:` = NA_integer_,
        `:group_name:` = "column_number",
        `:row_name:` = NA_character_),
      dplyr::tibble(
        `:row_number:` = NA_integer_,
        `:group_name:` = "column_type"),
      dplyr::tibble(
        `:row_number:` = NA_integer_,
        `:group_name:` = "column_align"),
      dplyr::tibble(
        `:row_number:` = NA_integer_,
        `:group_name:` = "spanner_name"),
      data) %>%
    as.data.frame(stringsAsFactors = FALSE)

  data[, 1:length(names(data))] <-
    as.character(unlist(data[, 1:length(names(data))]))

  for (i in 4:(3 + n_col)) {
    data[1, i] <- i - 3
    data[2, i] <- data_types[i - 3]
    data[3, i] <- "center"
  }

  data[1, 3] <- "0"
  data[2, 3] <- "character"
  data[3, 3] <- "right"
  data[4, 3] <- NA_character_

  data
}

#' Apply data types to data frame columns
#' @noRd
apply_data_types <- function(data, types){

  for (i in 1:length(data)){
    FUN <-
      switch(
        types[i],
        character = as.character,
        numeric = as.numeric)

    data[,i] <- FUN(data[,i])
  }
  data
}

#' Extract an encased data table
#' @noRd
get_working_tbl <- function(data,
                            apply_original_types = FALSE,
                            data_types = NULL) {

  if (apply_original_types) {
    original_types <-
      data[2, c(-1, -2, -3)] %>%
      t() %>%
      as.character()
  }

  # The data is in the unencased portion of
  # the table; here, the casement is removed
  data <- data[c(-1, -2, -3, -4), c(-1, -2, -3)]

  # if (apply_original_types) {
  #   data <- apply_data_types(data = data, types = original_types)
  # } else if (!is.null(data_types)) {
  #   data <- apply_data_types(data = data, types = data_types)
  # }

  # Reset the official rownames for the table
  rownames(data) <- NULL

  data
}

#' Get the original data types
#' @noRd
get_orig_types <- function(data) {
  data[2, c(-1, -2, -3)] %>% t() %>% as.character()
}

#' Reverse percentages back to the original value
#' @noRd
reverse_percent <- function(x) {
  if (!is.numeric(x) && any(grepl("::percent", x))) {

    # Set aside extra formats
    formats <- gsub("([0-9,-\\.]*?::percent)(.*)", "\\2", x)
    base <- gsub("([0-9,-\\.]*?::percent)(.*)", "\\1", x)

    return(paste0(as.numeric(gsub("(::percent|,)", "", base)) / 100, formats))
  } else {
    return(x)
  }
}

#' Extract a value from a cell that is free
#' of any attached formatting directives
#' @noRd
extract_value <- function(x) {
  # Extract value from a string that may
  # contain format directives
  values <- c()
  for (i in seq(x)) {
    if (grepl("::percent", x[i])) {
      values <- c(values, gsub("(.*?)(::.*)", "\\1", x[i]))
      values[i] <- paste0(values[i], "::percent")
    } else {
      values <- c(values, gsub("(.*?)(::.*)", "\\1", x[i]))
    }
  }
  values
}

#' Extract formatting directives from a cell
#' value so that we may recombine them later
#' @noRd
extract_formats <- function(x) {
  # Extract formats from a string
  formats <- c()
  for (i in seq(x)) {
    if (grepl("::", x[i])) {
      formats <- c(formats, gsub("(.*?)(::.*)", "\\2", x[i]))
      formats[i] <- gsub("::percent", "", formats[i])
    } else {
      formats <- c(formats, "")
    }
  }
  formats
}

#' Recombine the value (`x`) and the formats;
#' this is usually after some operation has
#' been done to `x` and we'd like to restore
#' the association between value and the
#' previously-set formatting directives
recombine_formats <- function(x, formats) {
  # Combine the format-free value with
  # the `formats` string
  paste0(x, formats)
}

#' Create gt table object
#'
#' Create a gt table object so that we can perform
#' styling transformations before transforming
#' the entire object to a display table. Using this
#' function is the first step in that process.
#' @param data a \code{data.frame} object or a
#' tibble.
#' @return an object of class \code{gt_tbl}.
#' @examples
#' # Create a table object using the
#' # `mtcars` dataset
#' tab <-
#'   gt(data = mtcars)
#'
#' # The resulting object can be used
#' # in transformations
#' tab_2 <-
#'   tab %>%
#'   set_cols_align_right() %>%
#'   set_fmt_numeric(
#'     columns = c("drat", "wt", "qsec"),
#'     decimals = 1
#'     )
#'
#' # The object of this type can be
#' # displayed in the Viewer
#' tab_2
#' @export
gt <- function(data) {

  encased_tbl <- encase_tbl(data = data)

  structure(
    list(
      data = encased_tbl,
      formats = list()),
    class = "gt_tbl"
  )
}

#' Arrange a boxhead into panels
#'
#' Set a spanner with a name and mappings
#' to columns extant in the table. This
#' creates a boxhead panel with spanner
#' headings and column headings.
#' @param html_tbl a table object that is
#' created using the \code{gt()} function.
#' @param spanner the spanner heading name.
#' @param columns the columns to be components of
#' the spanner heading.
#' @return an object of class \code{gt_tbl}.
#' @examples
#' # Create a table based on `rock` where
#' # there are column headings grouped under
#' # spanner headings
#' gt(data = rock) %>%
#'   set_spanner(
#'     spanner = "perimeter",
#'     columns = c("peri", "shape"))
#' @importFrom dplyr bind_cols
#' @export
set_spanner <- function(data,
                        spanner,
                        columns) {

  data_columns <-
    columns[which(columns %in% colnames(data$data[, c(-1, -2, -3)]))]

  data_lhs <- data$data[, c(1, 2, 3)]
  data_rhs <- data$data[, -c(1, 2, 3)]

  data_rhs[4, data_columns] <- spanner

  data$data <- dplyr::bind_cols(data_lhs, data_rhs)
  data
}


#' Arrange a stub into blocks
#'
#' Set a group with a name and mappings to rows extant
#' in the table. This creates a stub block with group
#' headings and row captions.
#' @param html_tbl a table object that is created using
#' the \code{gt()} function.
#' @param spanner the spanner heading name.
#' @param columns the columns to be components of
#' the spanner heading.
#' @return an object of class \code{gt_tbl}.
#' @examples
#' # Create a table based on `rock` where
#' # there are column headings grouped under
#' # spanner headings
#' gt(data = mtcars %>% tibble::rownames_to_column()) %>%
#'   set_group(
#'     group = "perimeter",
#'     rows = c("Mazda RX4", "Mazda RX4 Wag"))
#' @importFrom dplyr bind_cols bind_rows arrange
#' @export
set_group <- function(data,
                      group,
                      rows,
                      others = NULL) {

  # Set a name for the `others` group if a
  # name is provided
  if (!is.null(others)) {
    data[["others_group"]] <-
      list(others = others)
  }

  # Look at the rows to determine if helpers used
  if (inherits(rows, "not_in_group")) {
    data_rows <- which(is.na(data$data[-1:-4, 2])) + 4
  } else {
    data_rows <- which(data$data[-1:-4, 3] %in% rows) + 4
  }

  data_lhs <- data$data[, c(1, 2)]
  data_rhs <- data$data[, -c(1, 2)]

  data_lhs[data_rows, 2] <- group

  data$data <- dplyr::bind_cols(data_lhs, data_rhs)

  data_top <- data$data[1:4, ]
  data_bottom <- data$data[-1:-4, ]

  data_bottom <- data_bottom %>% dplyr::arrange(`:group_name:`)
  data_bottom[, 1] <- as.character(1:nrow(data_bottom))

  data$data <- dplyr::bind_rows(data_top, data_bottom)
  data
}

#' Modify the ordering of the stub block groups
#' @export
arrange_groups <- function(data,
                           groups) {

  # Set a name for the `others` group if a
  # name is provided
  data[["arrange_groups"]] <-
    list(groups = groups)

  data
}

#' Set the alignment of columns
#' @importFrom dplyr bind_cols
#' @export
set_cols_align <- function(data,
                           align = "center",
                           columns = NULL,
                           types = NULL) {

  if (!(align %in% c("left", "center", "right"))) {
    return(data)
  }

  data_lhs <- data$data[, c(1, 2)]
  data_rhs <- data$data[, -c(1, 2)]

  if (!is.null(columns)) {
    data_columns <-
      columns[which(columns %in% colnames(data$data[, c(-1, -2, -3)]))]
    if ("stub" %in% columns) {
      data_columns <- c(":row_name:", data_columns)
    }

    data_rhs[3, data_columns] <- align

  } else if (!is.null(types)) {

    data_rhs[3, which(data_rhs[2, ] %in% types)] <- align
  }

  data$data <- dplyr::bind_cols(data_lhs, data_rhs)
  data
}


#' @export
set_cols_align_left <- function(data,
                                columns = NULL,
                                types = NULL) {

  set_cols_align(
    data = data,
    align = "left",
    columns = columns,
    types = types)
}

#' @export
set_cols_align_center <- function(data,
                                  columns = NULL,
                                  types = NULL) {

  set_cols_align(
    data = data,
    align = "center",
    columns = columns,
    types = types)
}


#' @export
set_cols_align_right <- function(data,
                                 columns = NULL,
                                 types = NULL) {

  set_cols_align(
    data = data,
    align = "right",
    columns = columns,
    types = types)
}


#' @importFrom dplyr select everything bind_cols
#' @export
set_cols_move_to_start <- function(data,
                                   columns) {

  # Filter the vector of column names by the
  # column names actually in `data$data`
  columns <-
    columns[which(columns %in% colnames(data$data[, c(-1, -2, -3)]))]

  data_lhs <- data$data[, c(1, 2, 3)]
  data_rhs <- data$data[, -c(1, 2, 3)]

  if (length(columns) > 0) {
    data_rhs <- data_rhs %>% dplyr::select(columns, everything())

    # Reindex the column numbers
    for (i in seq(ncol(data_rhs))) {
      data_rhs[1, i] <- i
    }
  }

  data$data <- dplyr::bind_cols(data_lhs, data_rhs)
  data
}

#' @importFrom dplyr select bind_cols
#' @export
set_cols_move_to_end <- function(data,
                                 columns) {

  # Filter the vector of column names by the
  # column names actually in `data$data`
  columns <-
    columns[which(columns %in% colnames(data$data[, c(-1, -2, -3)]))]

  data_lhs <- data$data[, c(1, 2, 3)]
  data_rhs <- data$data[, -c(1, 2, 3)]

  if (length(columns) > 0) {

    # Place the column names at the end
    columns <- c(base::setdiff(colnames(data_rhs), columns), columns)

    data_rhs <- data_rhs %>% dplyr::select(columns)

    # Reindex the column numbers
    for (i in seq(ncol(data_rhs))) {
      data_rhs[1, i] <- i
    }
  }

  data$data <- dplyr::bind_cols(data_lhs, data_rhs)
  data
}

#' @importFrom dplyr select bind_cols
#' @export
set_cols_remove <- function(data,
                            columns) {

  # Filter the vector of column names by the
  # column names actually in `data$data`
  columns <-
    columns[which(columns %in% colnames(data$data[, c(-1, -2, -3)]))]

  data_lhs <- data$data[, c(1, 2, 3)]
  data_rhs <- data$data[, -c(1, 2, 3)]

  # Perform removal of columns using `dplyr::select()`
  if (length(columns) > 0) {

    # Remove the column names from the column list
    columns <- c(base::setdiff(colnames(data_rhs), columns))

    data_rhs <- data_rhs %>% dplyr::select(columns)

    # Reindex the column numbers
    for (i in seq(ncol(data_rhs))) {
      data_rhs[1, i] <- i
    }
  }

  data$data <- dplyr::bind_cols(data_lhs, data_rhs)
  data
}

#' @importFrom dplyr select bind_cols
#' @export
set_cols_move <- function(tbl,
                          columns,
                          after) {

  # Filter the vector of column names by the
  # column names actually in `data$data`
  columns <-
    columns[which(columns %in% colnames(data$data[, c(-1, -2, -3)]))]

  data_lhs <- data$data[, c(1, 2, 3)]
  data_rhs <- data$data[, -c(1, 2, 3)]

  # Get the remaining column names in the table
  column_names <- base::setdiff(colnames(data_rhs), columns)

  # Get the column index for where the set
  # of `columns` should be inserted after
  column_index <- which(column_names == after)

  if (length(columns) > 0 & column_index != length(column_names)) {

    data_rhs <-
      data_rhs %>%
      dplyr::select(
        column_names[1:column_index],
        columns,
        column_names[(column_index + 1):length(column_names)])

  } else if (length(columns) > 0 & column_index == length(column_names)) {

    data_rhs <-
      data_rhs %>%
      dplyr::select(
        column_names[1:column_index],
        columns)
  }

  # Reindex the column numbers
  for (i in seq(ncol(data_rhs))) {
    data_rhs[1, i] <- i
  }

  data$data <- dplyr::bind_cols(data_lhs, data_rhs)
  data
}


#' @export
set_heading <- function(data,
                        title,
                        headnote = NULL) {

  # Process the `title` text
  title <- process_text(title)

  # Process the `headnote` text
  if (is.null(headnote)) {
    headnote <- ""
  } else {
    headnote <- process_text(headnote)
  }

  data[["heading"]] <-
    list(title = title,
         headnote = headnote)

  data
}

#' @export
set_stubhead_caption <- function(data,
                                 caption) {

  data[["stubhead_caption"]] <-
    list(stubhead_caption = caption)

  data
}

#' @export
set_source_note <- function(data,
                            source_note) {

  source_note <- process_text(source_note)

  if ("source_note" %in% names(data)) {

    data[["source_note"]]$source_note <-
      c(data[["source_note"]]$source_note, source_note)

  } else {

    data[["source_note"]] <-
      list(source_note = source_note)
  }

  data
}

#' @export
target_cell <- function(row = NULL,
                        column = NULL) {

  # Create the list object
  cell_targeted <- list(row = row, column = column)

  # Apply the `helper_cells` class
  attr(cell_targeted, "class") <- "single_cell_target"

  cell_targeted
}


#' @export
set_footnote <- function(data,
                         footnote,
                         location = NULL) {

  # Determine if the footnote already exists;
  # if it does, get the index
  if ("footnote" %in% names(data) &&
      process_text(footnote) %in%
      (data$footnote[[1]] %>% as.character())) {

    # Obtain the index of the already present
    # footnote (it will be applied as markup to
    # the appropriate cell)
    index <-
      data$footnote[[1]][
        which(data$footnote[[1]] == process_text(footnote))] %>%
      names() %>% as.integer()

  } else if ("footnote" %in% names(data)) {

    # Store the footnote text and index in the `footnote`
    # list component (case where `footnote` exists)
    index <- max(as.numeric(names(data[["footnote"]][[1]]))) + 1L

    footnote <- setNames(process_text(footnote), nm = index)

    data[["footnote"]][[1]] <-
      c(data[["footnote"]][[1]], footnote)

  } else {

    # Store the footnote text and index in the `footnote`
    # list component (case where `footnote` does not yet
    # exist)
    index <- 1L

    footnote <- setNames(process_text(footnote), nm = index)

    data[["footnote"]] <-
      list(
        footnote = footnote)
  }

  # Add markup to the targeted cell(s)
  if (inherits(location, "single_cell_target")) {

    row <- location$row
    column <- location$column

    if (is.numeric(column)) {
      data_col <- which(data$data[1, ] == column)
    }

    if (is.numeric(row)) {
      data_row <- which(data$data[, 1] == row)
    }

    if (is.character(column)) {
      data_col <- which(names(data$data) == column)[1]
    }

    if (is.character(row)) {
      data_row <- which(data$data[, 3] == row)[1]
    }

    # Apply markup to targeted cell
    data$data[data_row, data_col] <-
      paste0(data$data[data_row, data_col], "::foot_", index)
  }

  data
}


#' @export
set_fmt <- function(data,
                    columns,
                    formatter) {

  for (i in columns) {
    data$formats[[i]] <- formatter
  }

  data %>% render_format()
}

#' @export
set_fmt_percent <- function(data,
                            columns,
                            decimals = NULL,
                            sep_mark = "",
                            dec_mark = ".",
                            negative_style = "signed",
                            drop0trailing = TRUE) {

  if (is.null(decimals)) decimals <- 4

  data %>%
    set_fmt(
      columns = columns,
      formatter = function(x) {

        # Uncouple formats from the base value
        formats <- x %>% gt:::extract_formats()
        x <- x %>%
          extract_value() %>%
          reverse_percent()

        # Transform the number by multiplying
        # it by 100
        x <- as.numeric(x) * 100

        x <-
          paste0(
            formatC(
              x = x,
              digits = decimals,
              mode = "double",
              big.mark = sep_mark,
              decimal.mark = dec_mark,
              format = "f",
              drop0trailing = drop0trailing), "::percent")

        x <- recombine_formats(x = x, formats = formats)
        x
      }
    )
}

#' @export
set_fmt_scientific <- function(data,
                               columns,
                               decimals,
                               sep_mark = "",
                               dec_mark = ".",
                               negative_style = "signed",
                               drop0trailing = TRUE) {

  if (is.null(decimals)) decimals <- 4

  data %>%
    set_fmt(
      columns = columns,
      formatter = function(x) {

        # Uncouple formats from the base value
        formats <- x %>% gt:::extract_formats()
        x <- x %>%
          extract_value() %>%
          reverse_percent()

        x <- as.numeric(x)

        x <- formatC(
          x = x,
          digits = decimals,
          mode = "double",
          big.mark = sep_mark,
          decimal.mark = dec_mark,
          format = "e",
          drop0trailing = drop0trailing)

        x <- recombine_formats(x = x, formats = formats)
        x
      })
}

#' @export
set_fmt_numeric <- function(data,
                            columns,
                            decimals,
                            sep_mark = "",
                            dec_mark = ".",
                            negative_style = "signed",
                            drop0trailing = TRUE) {

  if (is.null(decimals)) decimals <- 4

  data %>%
    set_fmt(
      columns = columns,
      formatter = function(x) {

        # Uncouple formats from the base value
        formats <- x %>% gt:::extract_formats()
        x <- x %>%
          extract_value() %>%
          reverse_percent()

        x <- as.numeric(x)

        x <- formatC(
          x = x,
          digits = decimals,
          mode = "double",
          big.mark = sep_mark,
          decimal.mark = dec_mark,
          format = "f",
          drop0trailing = drop0trailing)

        x <- recombine_formats(x = x, formats = formats)
        x
      }
    )
}

# Render the table using the formatting options
render_format <- function(data) {

  orig_types <- get_orig_types(data$data)

  row_names <- data$data$`:row_name:`
  group_names <- data$data$`:group_name:`
  column_align <- data$data[3, ]
  spanner_name <- data$data[4, ]

  formatted_tbl <- data$data %>% get_working_tbl(apply_original_types = TRUE)

  for (colname in names(data$formats)) {
    formatted_tbl[, colname] <- data$formats[[colname]](formatted_tbl[[colname]])
  }

  data$data <- formatted_tbl %>% encase_tbl(data_types = orig_types)
  data$data$`:row_name:` <- row_names
  data$data$`:group_name:` <- group_names
  data$data[3, ] <- column_align
  data$data[4, ] <- spanner_name
  data$formats <- list()
  data
}
