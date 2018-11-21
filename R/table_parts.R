#' Add a table heading
#'
#' Add a title and optional headnote to the heading part of the table.
#' @inheritParams fmt_number
#' @param title,headnote text to be used in the table title and, optionally, for
#'   the table headnote (a line of text below the table title which is somewhat
#'   smaller in size). We can optionally use the \code{\link{md}()} and
#'   \code{\link{html}()} functions to style the text as Markdown or to retain
#'   HTML elements in the text.
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

  # Handle the optional `headnote` text
  if (is.null(headnote)) {
    headnote <- ""
  }

  attr(data, "heading") <-
    list(
      title = title,
      headnote = headnote)

  data
}

#' Add label text to the stubhead
#'
#' Add a label to the stubhead of a table. If a stub does not exist, no change
#' will be made.
#' @inheritParams fmt_number
#' @param label the text to be used as the stubhead label We can optionally
#'   use the \code{\link{md}()} and \code{\link{html}()} functions to style the
#'   text as Markdown or to retain HTML elements in the text.
#' @return an object of class \code{gt_tbl}.
#' @examples
#' # Create a table object using the
#' # `mtcars` dataset and add a stubhead
#' # label to describe what is in the stub
#' gt_tbl <-
#'   gt(mtcars, rownames_to_stub = TRUE) %>%
#'     tab_stubhead_label(
#'       label = md("car *make* and *model*"))
#' @family table-part creation/modification functions
#' @export
tab_stubhead_label <- function(data,
                               label) {

  attr(data, "stubhead_label") <-
    list(stubhead_label = label)

  data
}

#' Arrange a stub into blocks
#'
#' Set a group with a name and mappings to rows extant in the table. This
#' creates a stub block with group headings and row captions.
#' @inheritParams fmt_number
#' @param group the stub block group heading name.
#' @param rows the rows to be made components of the stub block. Can either be a
#'   vector of row captions provided \code{c()}, a vector of row indices, or a
#'   helper function focused on selections. The select helper functions are:
#'   \code{\link{starts_with}()}, \code{\link{ends_with}()},
#'   \code{\link{contains}()}, \code{\link{matches}()}, \code{\link{one_of}()},
#'   and \code{\link{everything}()}.
#' @param others an option to set a default group heading for any rows not
#'   formally placed in a stub block named by \code{group} in any call of
#'   \code{tab_stub_block()}. A separate call to \code{tab_stub_block()} with
#'   only a value to \code{others} is possible and makes explicit that the call
#'   is meant to provide a default group heading value. If this is not set and
#'   there are rows that haven't been placed into a stub block (where one or
#'   more stub blocks exist), then those rows will be automatically placed into
#'   a stub block without a title.
#' @return an object of class \code{gt_tbl}.
#' @examples
#' # Create a table based on `mtcars` where
#' # there are group headings grouped inside
#' # stub blocks; two groups are generated
#' # here: `Mazda` and `NA` (a group without)
#' # a title
#' gt_tbl <-
#'   gt(mtcars, rownames_to_stub = TRUE) %>%
#'     tab_stub_block(
#'       group = "Mazda",
#'       rows = c("Mazda RX4", "Mazda RX4 Wag"))
#' @family table-part creation/modification functions
#' @import rlang
#' @export
tab_stub_block <- function(data,
                           group = NULL,
                           rows = NULL,
                           others = NULL) {

  # Capture the `rows` expression
  row_expr <- rlang::enquo(rows)

  # Create a stub block if a `group` is provided
  if (!is.null(group)) {

    # Get the `data_df` data frame from `data`
    data_df <- as.data.frame(data)

    # Get the `stub_df` data frame from `data`
    stub_df <- attr(data, "stub_df", exact = TRUE)

    # Collect the rownames from `stub_df`
    rownames <- stub_df$rowname

    # Resolve the row numbers using the `resolve_vars` function
    resolved_rows <-
      resolve_vars(var_expr = row_expr, var_names = rownames, data_df = data_df)

    # Place the `group` label in the `groupname` column
    # `stub_df`
    attr(data, "stub_df")[resolved_rows, "groupname"] <- process_text(group[1])

    # Insert the group into the `arrange_groups` component
    if (!("arrange_groups" %in% names(attributes(data)))) {

      if (any(is.na(attr(data, "stub_df", exact = TRUE)$groupname))) {

        attr(data, "arrange_groups") <-
          list(groups = c(process_text(group[1]), NA_character_))

      } else {
        attr(data, "arrange_groups") <-
          list(groups = process_text(group[1]))
      }

    } else {

      if (any(is.na(attr(data, "stub_df")$groupname))) {

        attr(data, "arrange_groups")[["groups"]] <-
          c(attr(data, "arrange_groups", exact = TRUE)[["groups"]],
            process_text(group[1]), NA_character_) %>%
          unique()

      } else {
        attr(data, "arrange_groups")[["groups"]] <-
          c(attr(data, "arrange_groups", exact = TRUE)[["groups"]],
            process_text(group[1]))
      }
    }
  }

  # Set a name for the `others` group if a
  # name is provided
  if (!is.null(others)) {
    attr(data, "others_group") <- list(others = process_text(others[1]))
  }

  data
}

#' Arrange a boxhead into panels
#'
#' Set a spanner with a name and mappings to columns extant in the table. This
#' creates a boxhead panel with spanner headings and column headings.
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
  checkmate::assert_character(
    group, len = 1, any.missing = FALSE, null.ok = FALSE)

  # If using the `vars()` helper, get the columns as a character vector
  if (inherits(columns, "quosures")) {
    columns <- columns %>% lapply(`[[`, 2) %>% as.character()
  }

  # Filter the vector of column names by the
  # column names actually in `input_df`
  columns <- columns[which(columns %in% colnames(data))]

  if (length(columns) == 0) {
    return(data)
  }

  grp_labels <- attr(data, "grp_labels", exact = TRUE)

  for (i in seq(columns)) {
    grp_labels[[columns[i]]] <- group
  }

  # Set the `grp_labels` attr with the `grp_labels` object
  attr(data, "grp_labels") <- grp_labels

  data
}

#' Add a source note citation
#'
#' Add a source note citation to the source note part of the table.
#' @inheritParams fmt_number
#' @param source_note text to be used in the source note. We can optionally use
#'   the \code{\link{md}()} and \code{\link{html}()} functions to style the text
#'   as Markdown or to retain HTML elements in the text.
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

  if ("source_note" %in% names(attributes(data))) {

    attr(data, "source_note") <-
      c(attr(data, "source_note", exact = TRUE),
        list(source_note))

  } else {

    attr(data, "source_note") <-
      list(source_note)
  }

  data
}
