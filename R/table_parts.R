#' Add a table header
#'
#' Add a table header part with a table title and optional subtitle.
#' @inheritParams fmt_number
#' @param title,subtitle text to be used in the table title and, optionally, for
#'   the table subtitle. We can optionally use the \code{\link{md}()} and
#'   \code{\link{html}()} functions to style the text as Markdown or to retain
#'   HTML elements in the text.
#' @return an object of class \code{gt_tbl}.
#' @examples
#' # Create a table object using the
#' # `mtcars` dataset and add a header
#' # part to contain a title and subtitle
#' gt_tbl <-
#'   gt(mtcars, rownames_to_stub = TRUE) %>%
#'     tab_header(
#'       title = md("Data listing from **mtcars**"),
#'       subtitle = md("`mtcars` is an R dataset"))
#' @family table-part creation/modification functions
#' @export
tab_header <- function(data,
                       title,
                       subtitle = NULL) {

  # Handle the optional `subtitle` text
  if (is.null(subtitle)) {
    subtitle <- ""
  }

  attr(data, "heading") <-
    list(
      title = title,
      subtitle = subtitle)

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

#' Create a row group
#'
#' Create a row group with a collection of rows. This requires specification of
#' the rows to be included, either by supplying row labels, row indices, or
#' through use of a select helper function like \code{starts_with()}.
#' @inheritParams fmt_number
#' @param group the name of the row group. This text will also serve as the row
#'   group label.
#' @param rows the rows to be made components of the row group. Can either be a
#'   vector of row captions provided \code{c()}, a vector of row indices, or a
#'   helper function focused on selections. The select helper functions are:
#'   \code{\link{starts_with}()}, \code{\link{ends_with}()},
#'   \code{\link{contains}()}, \code{\link{matches}()}, \code{\link{one_of}()},
#'   and \code{\link{everything}()}.
#' @param others an option to set a default row group label for any rows not
#'   formally placed in a row group named by \code{group} in any call of
#'   \code{tab_row_group()}. A separate call to \code{tab_row_group()} with only
#'   a value to \code{others} is possible and makes explicit that the call is
#'   meant to provide a default row group label. If this is not set and
#'   there are rows that haven't been placed into a row group (where one or
#'   more row groups already exist), those rows will be automatically placed into
#'   a row group without a label.
#' @return an object of class \code{gt_tbl}.
#' @examples
#' # Create a table based on `mtcars` and
#' # add two row groups with the labels:
#' # `Mazda` and `NA` (group without a title)
#' gt_tbl <-
#'   gt(mtcars, rownames_to_stub = TRUE) %>%
#'     tab_row_group(
#'       group = "Mazda",
#'       rows = c("Mazda RX4", "Mazda RX4 Wag"))
#' @family table-part creation/modification functions
#' @import rlang
#' @export
tab_row_group <- function(data,
                          group = NULL,
                          rows = NULL,
                          others = NULL) {

  # Capture the `rows` expression
  row_expr <- rlang::enquo(rows)

  # Create a row group if a `group` is provided
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

#' Add a spanner column label
#'
#' Set a spanner column label by mapping it to columns already in the table.
#' This label that is placed above one or more column labels, spanning the width
#' of those columns.
#' @inheritParams fmt_number
#' @param group the name to assign to the spanner heading.
#' @param columns the columns to be components of the spanner heading.
#' @return an object of class \code{gt_tbl}.
#' @examples
#' # Create a table based on `rock` where
#' # there are column headings grouped
#' # under a spanner column label
#' gt_tbl <-
#'   gt(data = rock) %>%
#'     tab_spanner(
#'       group = "perimeter",
#'       columns = c("peri", "shape"))
#' @family table-part creation/modification functions
#' @export
tab_spanner <- function(data,
                        label,
                        columns) {
  checkmate::assert_character(
    label, len = 1, any.missing = FALSE, null.ok = FALSE)

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
    grp_labels[[columns[i]]] <- label
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
