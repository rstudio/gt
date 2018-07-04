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

    rowname_col <- which(colnames(data[, -1:-3]) == "rowname")
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
      data[2, -1:-3] %>%
      t() %>%
      as.character()
  }

  # The data is in the unencased portion of
  # the table; here, the casement is removed
  data <- data[-1:-4, -1:-3]

  # Reset the official rownames for the table
  rownames(data) <- NULL

  data
}

#' Get the original data types
#' @noRd
get_orig_types <- function(data) {
  data[2, -1:-3] %>% t() %>% as.character()
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
#' @noRd
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
#' Set a spanner with a name and mappings to columns extant
#' in the table. This creates a boxhead panel with spanner
#' headings and column headings.
#' @param data a table object that is created using the
#' \code{gt()} function.
#' @param spanner the spanner heading name.
#' @param columns the columns to be components of the
#' spanner heading.
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
    columns[which(columns %in% colnames(data$data[, -1:-3]))]

  data_lhs <- data$data[, 1:3]
  data_rhs <- data$data[, -1:-3]

  data_rhs[4, data_columns] <- spanner

  data$data <- dplyr::bind_cols(data_lhs, data_rhs)
  data
}

#' Arrange a stub into blocks
#'
#' Set a group with a name and mappings to rows extant
#' in the table. This creates a stub block with group
#' headings and row captions.
#' @param data a table object that is created using the
#' \code{gt()} function.
#' @param group the stub block group heading name.
#' @param rows the rows to be made components of the stub block.
#' @param others an optional group heading to use for any rows
#' not part of a stub block.
#' @return an object of class \code{gt_tbl}.
#' @examples
#' # Create a table based on `mtcars` where
#' # there are group headings grouped inside
#' # stub blocks
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
#' @param data a table object that is created using the
#' \code{gt()} function.
#' @param groups a vector of stub block group heading names.
#' @return an object of class \code{gt_tbl}.
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
#' @param data a table object that is created using the
#' \code{gt()} function.
#' @param align the alignment direction. This can either
#' be \code{"center"}, \code{"left"}, or \code{"right"}.
#' @param columns an optional vector of column names
#' for which the alignment should be applied.
#' @param types an optional vector of column types
#' for which the alignment should be applied.
#' @return an object of class \code{gt_tbl}.
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
      columns[which(columns %in% colnames(data$data[, -1:-3]))]
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

#' Set columns to be aligned left
#' @param data a table object that is created using the
#' \code{gt()} function.
#' @param columns an optional vector of column names
#' for which the left alignment should be applied.
#' @param types an optional vector of column types
#' for which the left alignment should be applied.
#' \code{gt()} function.
#' @return an object of class \code{gt_tbl}.
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

#' Set columns to be aligned to the center
#' @param data a table object that is created using the
#' \code{gt()} function.
#' @param columns an optional vector of column names
#' for which the center alignment should be applied.
#' @param types an optional vector of column types
#' for which the center alignment should be applied.
#' @return an object of class \code{gt_tbl}.
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

#' Set columns to be aligned right
#' @param data a table object that is created using the
#' \code{gt()} function.
#' @param columns an optional vector of column names
#' for which the right alignment should be applied.
#' @param types an optional vector of column types
#' for which the right alignment should be applied.
#' @return an object of class \code{gt_tbl}.
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

#' Move one or more columns to the start
#' @param data a table object that is created using the
#' \code{gt()} function.
#' @param columns the column names to move to
#' the left-most side of the table. The order in
#' which columns are provided will be preserved
#' (as is the case with the remaining columns).
#' Values provided that do not correspond to
#' column names will be disregarded.
#' @return an object of class \code{gt_tbl}.
#' @importFrom dplyr select everything bind_cols
#' @export
set_cols_move_to_start <- function(data,
                                   columns) {

  # Filter the vector of column names by the
  # column names actually in `data$data`
  columns <-
    columns[which(columns %in% colnames(data$data[, -1:-3]))]

  data_lhs <- data$data[, 1:3]
  data_rhs <- data$data[, -1:-3]

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

#' Move one or more columns to the end
#' @param data a table object that is created using the
#' \code{gt()} function.
#' @param columns the column names to move to
#' the right-most side of the table. The order in
#' which columns are provided will be preserved
#' (as is the case with the remaining columns).
#' Values provided that do not correspond to
#' column names will be disregarded.
#' @return an object of class \code{gt_tbl}.
#' @importFrom dplyr select bind_cols
#' @export
set_cols_move_to_end <- function(data,
                                 columns) {

  # Filter the vector of column names by the
  # column names actually in `data$data`
  columns <-
    columns[which(columns %in% colnames(data$data[, -1:-3]))]

  data_lhs <- data$data[, 1:3]
  data_rhs <- data$data[, -1:-3]

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

#' Remove one or more columns
#' @param data a table object that is created using the
#' \code{gt()} function.
#' @param columns the column names to remove from the table.
#' The order of the remaining columns will be preserved. Values
#' provided that do not correspond to column names will be disregarded.
#' @return an object of class \code{gt_tbl}.
#' @importFrom dplyr select bind_cols
#' @export
set_cols_remove <- function(data,
                            columns) {

  # Filter the vector of column names by the
  # column names actually in `data$data`
  columns <-
    columns[which(columns %in% colnames(data$data[, -1:-3]))]

  data_lhs <- data$data[, 1:3]
  data_rhs <- data$data[, -1:-3]

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

#' Move one or more columns
#' @param data a table object that is created using the
#' \code{gt()} function.
#' @param columns the column names to move to as a group to
#' a different position. The order of the remaining columns
#' will be preserved. Values provided that do not correspond
#' to column names will be disregarded.
#' @param after a column name used to anchor the insertion of
#' the moved columns. All of the moved columns will be placed
#' to the right of this column.
#' @return an object of class \code{gt_tbl}.
#' @importFrom dplyr select bind_cols
#' @export
set_cols_move <- function(data,
                          columns,
                          after) {

  # Filter the vector of column names by the
  # column names actually in `data$data`
  columns <-
    columns[which(columns %in% colnames(data$data[, -1:-3]))]

  data_lhs <- data$data[, 1:3]
  data_rhs <- data$data[, -1:-3]

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

#' Add a table heading
#'
#' Add a title and optional headnote to the heading
#' part of the table.
#' @param data a table object that is created using the
#' \code{gt()} function.
#' @param title text to be used in the table title.
#' @param headnote optional text to be used as the table's
#' headnote.
#' @return an object of class \code{gt_tbl}.
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

#' Add caption text to the stubhead
#'
#' Add a caption to the stubhead of a table. If a stub does
#' not exist, no change will be made.
#' @param data a table object that is created using the
#' \code{gt()} function.
#' @param caption the text to be used as the stubhead caption.
#' @return an object of class \code{gt_tbl}.
#' @export
set_stubhead_caption <- function(data,
                                 caption) {

  data[["stubhead_caption"]] <-
    list(stubhead_caption = caption)

  data
}

#' Add a source note citation
#'
#' Add a source note citation to the source note
#' part of the table.
#' @param data a table object that is created using the
#' \code{gt()} function.
#' @param source_note text to be used in the source note.
#' @return an object of class \code{gt_tbl}.
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

#' Helper to target a single table cell
#' @param row a single row to target.
#' @param column a single column to target.
#' @return a list object of class \code{single_cell_target}.
#' @export
target_cell <- function(row = NULL,
                        column = NULL) {

  # Create the list object
  cell_targeted <- list(row = row, column = column)

  # Apply the `helper_cells` class
  attr(cell_targeted, "class") <- "single_cell_target"

  cell_targeted
}

#' Helper for collecting ungrouped rows or columns
#' @export
not_in_group <- function() {
  x <- ":not_in_group"
  class(x) <- "not_in_group"
  x
}

#' Add a table footnote
#'
#' Add a footnote with a glyph attached to the
#' targeted cells, rows, or columns.
#' @param data a table object that is created using the
#' \code{gt()} function.
#' @param footnote text to be used in the footnote.
#' @param location the cell or set of cells to be
#' associated with the footnote.
#' @return an object of class \code{gt_tbl}.
#' @export
set_footnote <- function(data,
                         footnote,
                         location) {

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

#' Set a column format with a formatter function
#' @param data a table object that is created using the
#' \code{gt()} function.
#' @param columns an option specify which columns are to be
#' formatted.
#' @param formatter a formatting function.
#' @return an object of class \code{gt_tbl}.
#' @export
set_fmt <- function(data,
                    columns,
                    formatter) {

  for (i in columns) {
    data$formats[[i]] <- formatter
  }

  data %>% render_format()
}

#' Format values as date-times
#' @param data a table object that is created using the
#' \code{gt()} function.
#' @param columns an option specify which columns are to be
#' formatted.
#' @param date_style the date style to use.
#' @param time_style the time style to use.
#' @return an object of class \code{gt_tbl}.
#' @export
set_fmt_datetime <- function(data,
                             columns = NULL,
                             date_style = NULL,
                             time_style = NULL) {

  data %>%
    set_fmt(
      columns = columns,
      formatter = function(x) {

        # Uncouple formats from the base value
        formats <- x %>% extract_formats()
        x <- x %>%
          extract_value() %>%
          reverse_percent()

        # Transform `date_style` to `date_format`
        date_format <- get_date_format(date_style = date_style)

        # Transform `time_style` to `time_format`
        time_format <- get_time_format(time_style = time_style)

        # Combine into a single datetime format string
        date_time_format_str <-
          paste0(date_format, " ", time_format)

        x <-
          ifelse(grepl("^[0-9]*?\\:[0-9]*?", x), paste("1970-01-01", x), x) %>%
          strftime(format = date_time_format_str) %>%
          stringr::str_replace_all("^0", "") %>%
          stringr::str_replace_all(" 0([0-9])", " \\1") %>%
          stringr::str_replace_all("pm$", "PM") %>%
          stringr::str_replace_all("am$", "AM")

        x <- recombine_formats(x = x, formats = formats)
        x
      }
    )
}

#' Format values as dates
#' @param data a table object that is created using the
#' \code{gt()} function.
#' @param columns an option specify which columns are to be
#' formatted.
#' @param date_style the date style to use.
#' @return an object of class \code{gt_tbl}.
#' @export
set_fmt_date <- function(data,
                         columns = NULL,
                         date_style = NULL) {

  data %>%
    set_fmt(
      columns = columns,
      formatter = function(x) {

        # Uncouple formats from the base value
        formats <- x %>% extract_formats()
        x <- x %>%
          extract_value() %>%
          reverse_percent()

        # Transform `date_style` to `date_format_str`
        date_format_str <- get_date_format(date_style = date_style)

        x <-
          ifelse(grepl("^[0-9]*?\\:[0-9]*?", x), paste("1970-01-01", x), x) %>%
          strftime(format = date_format_str) %>%
          stringr::str_replace_all("^0", "") %>%
          stringr::str_replace_all(" 0([0-9])", " \\1") %>%
          stringr::str_replace_all("pm$", "PM") %>%
          stringr::str_replace_all("am$", "AM")

        x <- recombine_formats(x = x, formats = formats)
        x
      }
    )
}

#' Format values as times
#' @param data a table object that is created using the
#' \code{gt()} function.
#' @param columns an option specify which columns are to be
#' formatted.
#' @param time_style the time style to use.
#' @export
set_fmt_time <- function(data,
                         columns = NULL,
                         time_style = NULL) {

  data %>%
    set_fmt(
      columns = columns,
      formatter = function(x) {

        # Uncouple formats from the base value
        formats <- x %>% extract_formats()
        x <- x %>%
          extract_value() %>%
          reverse_percent()

        # Transform `time_style` to `time_format_str`
        time_format_str <- get_time_format(time_style = time_style)

        x <-
          ifelse(grepl("^[0-9]*?\\:[0-9]*?", x), paste("1970-01-01", x), x) %>%
          strftime(format = time_format_str) %>%
          stringr::str_replace_all("^0", "") %>%
          stringr::str_replace_all(" 0([0-9])", " \\1") %>%
          stringr::str_replace_all("pm$", "PM") %>%
          stringr::str_replace_all("am$", "AM")

        x <- recombine_formats(x = x, formats = formats)
        x
      }
    )
}

#' Format values as a percentage
#' @param data a table object that is created using the
#' \code{gt()} function.
#' @param columns an option specify which columns are to be
#' formatted.
#' @param decimals an option to specify exactly the number
#' of decimal places to use.
#' @param sep_mark the mark to use as a separator between
#' groups of digits.
#' @param dec_mark the character to use as a decimal mark.
#' @param drop0trailing a logical value that allows for
#' removal of trailing zeros (those redundant zeros after
#' the decimal mark).
#' @param negative_style the formatting to use
#' for negative numbers. With \code{signed} (the default),
#' negative numbers will be shown with a negative sign.
#' Using \code{parens} will show the negative value in
#' parentheses. The \code{red} option will display the
#' number in red. Finally, \code{parens-red} will display
#' negative numbers as red and enclosed in parentheses.
#' @return an object of class \code{gt_tbl}.
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
        formats <- x %>% extract_formats()
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

#' Format values to scientific notation
#' @param data a table object that is created using the
#' \code{gt()} function.
#' @param columns an option specify which columns are to be
#' formatted.
#' @param decimals an option to specify exactly the number
#' of decimal places to use.
#' @param sep_mark the mark to use as a separator between
#' groups of digits.
#' @param dec_mark the character to use as a decimal mark.
#' @param drop0trailing a logical value that allows for
#' removal of trailing zeros (those redundant zeros after
#' the decimal mark).
#' @param negative_style the formatting to use
#' for negative numbers. With \code{signed} (the default),
#' negative numbers will be shown with a negative sign.
#' Using \code{parens} will show the negative value in
#' parentheses. The \code{red} option will display the
#' number in red. Finally, \code{parens-red} will display
#' negative numbers as red and enclosed in parentheses.
#' @return an object of class \code{gt_tbl}.
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
        formats <- x %>% extract_formats()
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

#' Format numeric values
#' @param data a table object that is created using the
#' \code{gt()} function.
#' @param columns an option specify which columns are to be
#' formatted.
#' @param decimals an option to specify exactly the number
#' of decimal places to use.
#' @param sep_mark the mark to use as a separator between
#' groups of digits.
#' @param dec_mark the character to use as a decimal mark.
#' @param drop0trailing a logical value that allows for
#' removal of trailing zeros (those redundant zeros after
#' the decimal mark).
#' @param negative_style the formatting to use
#' for negative numbers. With \code{signed} (the default),
#' negative numbers will be shown with a negative sign.
#' Using \code{parens} will show the negative value in
#' parentheses. The \code{red} option will display the
#' number in red. Finally, \code{parens-red} will display
#' negative numbers as red and enclosed in parentheses.
#' @return an object of class \code{gt_tbl}.
#' @examples
#' # Create a table object using the
#' # `mtcars` dataset and format specified
#' # numeric columns to display values to
#' # two decimal places
#' gt(tbl = mtcars) %>%
#'   set_fmt_number(
#'     columns = c("drat", "wt", "qsec"),
#'     decimals = 2)
#' @export
set_fmt_number <- function(data,
                           columns,
                           decimals,
                           sep_mark = "",
                           dec_mark = ".",
                           drop0trailing = TRUE,
                           negative_style = "signed") {

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

#' Format values as currencies
#' @param data a table object that is created using the
#' \code{gt()} function.
#' @param columns the column names to format.
#' @param currency the currency to use for the numeric value.
#' @param use_subunits an option for whether the subunits
#' portion of a currency value should be displayed.
#' @param decimals an option to specify the exact number
#' of decimal places to use.
#' @param sep_mark the mark to use as a separator between
#' groups of digits.
#' @param dec_mark the character to use as a decimal mark.
#' @param placement the placement of the currency symbol.
#' This can be either be \code{left} (the default) or
#' \code{right}.
#' @param negative_style the formatting to use
#' for negative numbers. With \code{signed} (the default),
#' negative numbers will be shown with a negative sign.
#' Using \code{parens} will show the negative value in
#' parentheses. The \code{red} option will display the
#' number in red. Finally, \code{parens-red} will display
#' negative numbers as red and enclosed in parentheses.
#' @return an object of class \code{gt_tbl}.
#' @export
set_fmt_currency <- function(data,
                             columns,
                             currency,
                             use_subunits = TRUE,
                             decimals = NULL,
                             sep_mark = "",
                             dec_mark = ".",
                             placement = "left",
                             negative_style = "signed") {

  if (is.null(decimals)) decimals <- 2

  if (placement == "left") {
    placement <- "l"
  } else if (placement == "right") {
    placement <- "r"
  } else {
    placement <- "l"
  }

  # Return early if `currency` does not have a valid value
  if (!is_currency_valid(currency = currency)) {

    message("The value supplied for `currency` is not valid.")
    return(data)
  }

  # Get the currency string
  currency_str <- get_currency_str(currency = currency)

  # Get the number of decimal places
  if (is.null(decimals) & use_subunits) {

    # Get decimal places using `get_currency_exponent()` fcn
    if (currency %in% currency_symbols$curr_symbol) {
      decimals <- 2L
    } else {
      decimals <- get_currency_exponent(currency = currency)
    }

  } else if (is.null(decimals) & use_subunits == FALSE) {
    decimals <- NA_integer_
  }

  data %>%
    set_fmt(
      columns = columns,
      formatter = function(x) {

        # Uncouple formats from the base value
        formats <- x %>% extract_formats()
        x <- x %>%
          extract_value() %>%
          reverse_percent()

        x <- as.numeric(x)

        x <-
          paste0(
            formatC(
              x = x,
              digits = decimals,
              mode = "double",
              big.mark = sep_mark,
              decimal.mark = dec_mark,
              format = "f",
              drop0trailing = FALSE),
            paste0(
              "::curr_", placement, "_", currency_str))

        x <- recombine_formats(x = x, formats = formats)
        x
      }
    )
}

#' Render the table using the formatting options
#' @noRd
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
