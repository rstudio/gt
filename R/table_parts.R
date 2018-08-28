#' Add a table heading
#'
#' Add a title and optional headnote to the heading part of the table.
#' @inheritParams fmt_number
#' @param title text to be used in the table title.
#' @param headnote optional text to be used as the table's headnote.
#' @return an object of class \code{gt_tbl}.
#' @examples
#' # Create a table object using the
#' # `mtcars` dataset and add a heading
#' # to describe the table
#' gt_tbl <-
#'   gt(mtcars, rownames_to_stub = TRUE) %>%
#'     tab_heading(
#'       title = md("Data listing from **mtcars**"),
#'       headnote = md("`mtcars` is an R dataset"))
#' @family table-part creation/modification functions
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
    list(
      title = title,
      headnote = headnote)

  data
}

#' Add caption text to the stubhead
#'
#' Add a caption to the stubhead of a table. If a stub does not exist, no
#'   change will be made.
#' @inheritParams fmt_number
#' @param caption the text to be used as the stubhead caption.
#' @return an object of class \code{gt_tbl}.
#' @examples
#' # Create a table object using the
#' # `mtcars` dataset and add a caption
#' # to describe what is in the stub
#' gt_tbl <-
#'   gt(mtcars, rownames_to_stub = TRUE) %>%
#'     tab_stubhead_caption(
#'       caption = md("car *make* and *model*"))
#' @family table-part creation/modification functions
#' @export
tab_stubhead_caption <- function(data,
                                 caption) {

  attr(data, "stubhead_caption") <-
    list(stubhead_caption = process_text(caption))

  data
}

#' Arrange a stub into blocks
#'
#' Set a group with a name and mappings to rows extant in the table. This
#'   creates a stub block with group headings and row captions.
#' @inheritParams fmt_number
#' @param group the stub block group heading name.
#' @param rows the rows to be made components of the stub block.
#' @param others an optional group heading to use for any rows not part of a
#'   stub block.
#' @return an object of class \code{gt_tbl}.
#' @examples
#' # Create a table based on `mtcars` where
#' # there are group headings grouped inside
#' # stub blocks
#' gt_tbl <-
#'   gt(mtcars, rownames_to_stub = TRUE) %>%
#'     tab_stub_block(
#'       group = "perimeter",
#'       rows = c("Mazda RX4", "Mazda RX4 Wag"))
#' @family table-part creation/modification functions
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

  if (rows[1] == "rownames_with" && length(rows) == 2) {
    rows <-
      attr(data, "stub_df")$rowname[
        which(grepl(rows[2], attr(data, "stub_df")$rowname))]
    if (length(rows) == 0) {
      return(data)
    }
  }

  attr(data, "stub_df")[
    which(attr(data, "stub_df")$rowname %in% rows), 1] <- group

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
#' Set a spanner with a name and mappings to columns extant in the table. This
#'   creates a boxhead panel with spanner headings and column headings.
#' @inheritParams fmt_number
#' @param group the name to assign to the spanner heading.
#' @param columns the columns to be components of the spanner heading.
#' @return an object of class \code{gt_tbl}.
#' @examples
#' # Create a table based on `rock` where
#' # there are column headings grouped
#' # under spanner headings
#' gt_tbl <-
#'   gt(data = rock) %>%
#'     tab_boxhead_panel(
#'       group = "perimeter",
#'       columns = c("peri", "shape"))
#' @family table-part creation/modification functions
#' @export
tab_boxhead_panel <- function(data,
                              group,
                              columns) {

  # If using the `vars()` helper, get the columns as a character vector
  if (inherits(columns, "quosures")) {
    columns <- columns %>% lapply(`[[`, 2) %>% as.character()
  }

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
#' Add a footnote with a glyph attached to the targeted cells, rows, or columns.
#' @inheritParams fmt_number
#' @param footnote text to be used in the footnote.
#' @param location the cell or set of cells to be associated with the footnote.
#'   Supplying an object with the \code{\link{data_cells}()} helper function is
#'   a useful way to specify the cell that is associated with the footnote.
#' @return an object of class \code{gt_tbl}.
#' @examples
#' # Add a footnote that is in
#' # reference to a single table cell
#' gt_tbl <-
#'   gt(mtcars, rownames_to_stub = TRUE) %>%
#'     tab_footnote(
#'       footnote = "Massive hp.",
#'       location = data_cells(
#'         row = "Maserati Bora",
#'         column = "hp"))
#' @family table-part creation/modification functions
#' @seealso [data_cells()] as a useful helper function for targeting the cell
#' associated with the footnote.
#' @importFrom stats setNames
#' @export
tab_footnote <- function(data,
                         footnote,
                         location) {

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

  # If location is provided in a `data_cells` object
  # we need to resolve the locations of the targeted data cells
  if (inherits(location, "data_cells")) {

    resolved <- resolve_data_cells(data = data, object = location)

    data_rows <- resolved$row
    data_cols <- resolved$column

    for (i in 1:length(data_rows)) {

      # Append the footnote
      if (is.na(attr(data, "foot_df")[data_rows[i], data_cols[i]])) {
        attr(data, "foot_df")[data_rows[i], data_cols[i]] <-
          paste0("::foot_", index)

      } else {

        attr(data, "foot_df")[data_rows[i], data_cols[i]] <-
          paste0(
            attr(data, "foot_df")[data_rows[i], data_cols[i]],
            "::foot_", index)
      }
    }
  }

  data
}

#' Add a source note citation
#'
#' Add a source note citation to the source note part of the table.
#' @inheritParams fmt_number
#' @param source_note text to be used in the source note.
#' @return an object of class \code{gt_tbl}.
#' @examples
#' # Add a source note that provides
#' # a citation for the tabular data
#' gt_tbl <-
#'   gt(mtcars, rownames_to_stub = TRUE) %>%
#'     tab_source_note(
#'       source_note = md("*Henderson and Velleman* (1981)."))
#' @family table-part creation/modification functions
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

#' Add custom styles to one or more cells
#' @inheritParams fmt_number
#' @param style a vector of styles to use. The \code{\link{apply_styles}()}
#'   helper function can be used here to more easily generate valid styles.
#' @param location the cell or set of cells to be styled. Supplying an object
#'   with the \code{\link{data_cells}()} helper function is a useful way to
#'   specify the cell that is to be styled.
#' @return an object of class \code{gt_tbl}.
#' @examples
#' # Add a style that is to be applied
#' # to a single table cell
#' gt_tbl <-
#'   gt(mtcars, rownames_to_stub = TRUE) %>%
#'     tab_style(
#'       style = apply_styles(bkgd_color = "steelblue"),
#'       location = data_cells(
#'         columns = vars(hp),
#'         rows = c("Datsun 710", "Valiant")))
#' @family table-part creation/modification functions
#' @seealso [apply_styles()] as a helper for defining custom styles and
#'   [data_cells()] as a useful helper function for targeting the data cells to
#'   be styled.
#' @importFrom stats setNames
#' @export
tab_style <- function(data,
                      style,
                      location) {

  # # Check if the target location is actually in the table
  # if (inherits(location, "data_cells") &&
  #     !is_target_in_table(data = data, location = location)) {
  #   return(data)
  # }

  # If location is provided in a `data_cells` object
  # we need to resolve the locations of the targeted data cells
  if (inherits(location, "data_cells")) {

    resolved <- resolve_data_cells(data = data, object = location)

    data_rows <- resolved$row
    data_cols <- resolved$column
  }

  # Append the style
  for (i in 1:length(data_rows)) {

    if (is.na(attr(data, "fmts_df")[data_rows[i], data_cols[i]])) {

      attr(data, "fmts_df")[data_rows[i], data_cols[i]] <-
        paste0("::style_", style, collapse = "")

    } else {

      attr(data, "fmts_df")[data_rows[i], data_cols[i]] <-
        paste0(
          attr(data, "fmts_df")[data_rows[i], data_cols[i]],
          "::style_", style, collapse = "")
    }
  }

  data
}
