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
#' @examples
#' # Create a table object using the
#' # `mtcars` dataset and add a heading
#' # to describe the table
#' gt(mtcars, rownames_to_stub = TRUE) %>%
#'   tab_heading(
#'     title = md("Data listing from **mtcars**"),
#'     headnote = md("`mtcars` is an R dataset"))
#' @export
tab_heading <- function(data,
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

  attr(data, "heading") <-
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
#' @examples
#' # Create a table object using the
#' # `mtcars` dataset and add a caption
#' # to describe what is in the stub
#' gt(mtcars, rownames_to_stub = TRUE) %>%
#'   tab_stubhead_caption(
#'     caption = md("car *make* and *model*"))
#' @export
tab_stubhead_caption <- function(data,
                                 caption) {

  attr(data, "stubhead_caption") <-
    list(stubhead_caption = process_text(caption))

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
#' gt(mtcars, rownames_to_stub = TRUE) %>%
#'   tab_stub_block(
#'     group = "perimeter",
#'     rows = c("Mazda RX4", "Mazda RX4 Wag"))
#' @importFrom rlang enquo get_expr flatten_chr
#' @importFrom stringr str_trim str_remove_all
#' @export
tab_stub_block <- function(data,
                           group,
                           rows,
                           others = NULL) {

  # Set a name for the `others` group if a
  # name is provided
  if (!is.null(others)) {
    attr(data, "others_group") <-
      list(others = others)
  }

  # Get the requested `rows`
  rows <-
    rlang::enquo(rows) %>%
    rlang::get_expr() %>%
    as.character() %>%
    strsplit(split = " & ") %>%
    rlang::flatten_chr() %>%
    stringr::str_trim()

  rows <- rows[rows != "&"] %>% stringr::str_remove_all("`")

  if (rows[1] == "rownames_with" && length(rows) == 2) {
    rows <- attr(data, "stub_df")$rowname[which(grepl(rows[2], attr(data, "stub_df")$rowname))]
    if (length(rows) == 0) {
      return(data)
    }
  }

  attr(data, "stub_df")[which(attr(data, "stub_df")$rowname %in% rows), 1] <- group

  # Insert the group into the `blocks_arrange` component
  if (!("arrange_groups" %in% names(attributes(data)))) {
    data <- blocks_arrange(data = data, groups = group)
  } else {

    attr(data, "arrange_groups")[["groups"]] <-
      c(attr(data, "arrange_groups")[["groups"]], group)
  }

  data
}

#' Arrange a boxhead into panels
#'
#' Set a spanner with a name and mappings to columns extant
#' in the table. This creates a boxhead panel with spanner
#' headings and column headings.
#' @param data a table object that is created using the
#' \code{gt()} function.
#' @param group the name to assign to the spanner heading.
#' @param columns the columns to be components of the
#' spanner heading.
#' @return an object of class \code{gt_tbl}.
#' @examples
#' # Create a table based on `rock` where
#' # there are column headings grouped under
#' # spanner headings
#' gt(data = rock) %>%
#'   tab_boxhead_panel(
#'     group = "perimeter",
#'     columns = c("peri", "shape"))
#' @importFrom rlang enquo get_expr
#' @export
tab_boxhead_panel <- function(data,
                              group,
                              columns) {

  # Get the requested `columns`
  columns <-
    rlang::enquo(columns) %>% rlang::get_expr() %>% as.character()

  # Filter the vector of column names by the
  # column names actually in `input_df`
  columns <-
    columns[which(columns %in% colnames(data))]

  if (length(columns) == 0) {
    return(data)
  }


  attr(data, "boxh_df")[1, columns] <- process_text(group)
  data
}

#' Add a table footnote
#'
#' Add a footnote with a glyph attached to the
#' targeted cells, rows, or columns.
#' @param data a table object that is created using the
#' \code{gt()} function.
#' @param footnote text to be used in the footnote.
#' @param location the cell or set of cells to be
#' associated with the footnote. Supplying an object
#' with the \code{target_cell()} helper function is
#' a useful way to specify the cell that is associated
#' with the footnote.
#' @return an object of class \code{gt_tbl}.
#' @examples
#' # Add a footnote that is in reference to
#' # a specified table cell
#' gt(mtcars, rownames_to_stub = TRUE) %>%
#'   tab_footnote(
#'     footnote = "Massive hp.",
#'     location = target_cell(
#'       row = "Maserati Bora",
#'       column = "hp"))
#' @importFrom stats setNames
#' @export
tab_footnote <- function(data,
                         footnote,
                         location) {

  # Check if the target location is actually in the table
  if (inherits(location, "single_cell_target") &&
      !is_target_in_table(data = data, location = location)) {
    return(data)
  }

  # Determine if the footnote already exists;
  # if it does, get the index
  if ("footnote" %in% names(attributes(data)) &&
      process_text(footnote) %in%
      (attr(data, "footnote")[[1]] %>% as.character())) {

    # Obtain the index of the already present
    # footnote (it will be applied as markup to
    # the appropriate cell)
    index <-
      attr(data, "footnote")[[1]][
        which(attr(data, "footnote")[[1]] == process_text(footnote))] %>%
      names() %>% as.integer()

  } else if ("footnote" %in% names(attributes(data))) {

    # Store the footnote text and index in the `footnote`
    # list component (case where `footnote` exists)
    index <- max(as.numeric(names(attr(data, "footnote")[[1]]))) + 1L

    footnote <- stats::setNames(process_text(footnote), nm = index)

    attr(data, "footnote")[[1]] <-
      c(attr(data, "footnote")[[1]], footnote)

  } else {

    # Store the footnote text and index in the `footnote`
    # list component (case where `footnote` does not yet exist)
    index <- 1L

    footnote <- stats::setNames(process_text(footnote), nm = index)

    attr(data, "footnote") <- list(footnote = footnote)
  }

  # Add markup to the targeted cell(s)
  if (inherits(location, "single_cell_target")) {

    row <- location$row
    column <- location$column

    if (is.numeric(column)) {
      data_col <- colnames(data)[column]
    }

    if (is.numeric(row)) {
      data_row <- row
    }

    if (is.character(column)) {
      data_col <- column
    }

    if (is.character(row)) {
      data_row <- which(attr(data, "stub_df")[["rowname"]] == row)[1]
    }

    # Append the footnote
    if (is.na(attr(data, "foot_df")[data_row, data_col])) {
      attr(data, "foot_df")[data_row, data_col] <-
        paste0("::foot_", index)
    } else {
      attr(data, "foot_df")[data_row, data_col] <-
        paste0(
          attr(data, "foot_df")[data_row, data_col],
          "::foot_", index)
    }
  }

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
#' @examples
#' gt(mtcars, rownames_to_stub = TRUE) %>%
#'   tab_source_note(
#'     source_note = md("*Henderson and Velleman* (1981)."))
#' @export
tab_source_note <- function(data,
                            source_note) {

  source_note <- process_text(source_note)

  if ("source_note" %in% names(attributes(data))) {

    attr(data, "source_note")[["source_note"]] <-
      c(attr(data, "source_note")[["source_note"]], source_note)

  } else {

    attr(data, "source_note") <-
      list(source_note = source_note)
  }

  data
}
