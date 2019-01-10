#' Add a table header
#'
#' We can add a table header to the \pkg{gt} table with a title and even a
#' subtitle. A table header is an optional table part that is positioned above
#' the column labels. We have the flexibility to use Markdown formatting for the
#' header's title and subtitle. Furthermore, if the table is intended for HTML
#' output, we can use HTML in either of the title or subtitle.
#' @inheritParams fmt_number
#' @param title,subtitle text to be used in the table title and, optionally, for
#'   the table subtitle. We can elect to use the \code{\link{md}()} and
#'   \code{\link{html}()} helper functions to style the text as Markdown or to
#'   retain HTML elements in the text.
#' @return an object of class \code{gt_tbl}.
#' @examples
#' # Use `gtcars` to create a gt table;
#' # add a header part to contain a title
#' # and subtitle
#' tab_1 <-
#'   gtcars %>%
#'   dplyr::select(mfr, model, msrp) %>%
#'   dplyr::slice(1:5) %>%
#'   gt() %>%
#'   tab_header(
#'     title = md("Data listing from **gtcars**"),
#'     subtitle = md("`gtcars` is an R dataset")
#'   )
#'
#' @section Figures:
#' \if{html}{\figure{man_tab_header_1.svg}{options: width=100\%}}
#'
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
#' Add a label to the stubhead of a \pkg{gt} table. The stubhead is the lone
#' element that is positioned left of the column labels, and above the stub. If
#' a stub does not exist, then there is no stubhead (so no change will be made
#' when using this function in that case). We have the flexibility to use
#' Markdown formatting for the stubhead label. Furthermore, if the table is
#' intended for HTML output, we can use HTML for the stubhead label.
#' @inheritParams fmt_number
#' @param label the text to be used as the stubhead label We can optionally
#'   use the \code{\link{md}()} and \code{\link{html}()} functions to style the
#'   text as Markdown or to retain HTML elements in the text.
#' @return an object of class \code{gt_tbl}.
#' @examples
#' # Use `gtcars` to create a gt table; add
#' # a stubhead label to describe what is
#' # in the stub
#' tab_1 <-
#'   gtcars %>%
#'   dplyr::select(model, year, hp, trq) %>%
#'   dplyr::slice(1:5) %>%
#'   gt(rowname_col = "model") %>%
#'   tab_stubhead_label(label = "car")
#'
#' @section Figures:
#' \if{html}{\figure{man_tab_stubhead_label_1.svg}{options: width=100\%}}
#'
#' @family table-part creation/modification functions
#' @export
tab_stubhead_label <- function(data,
                               label) {

  attr(data, "stubhead_label") <-
    list(stubhead_label = label)

  data
}

#' Add a row group
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
#' # Use `gtcars` to create a gt table and
#' # add two row groups with the labels:
#' # `numbered` and `NA` (a group without
#' # a title, or, the rest)
#' tab_1 <-
#'   gtcars %>%
#'   dplyr::select(model, year, hp, trq) %>%
#'   dplyr::slice(1:8) %>%
#'   gt(rowname_col = "model") %>%
#'   tab_row_group(
#'     group = "numbered",
#'     rows = matches("^[0-9]")
#'   )
#'
#' # Use `gtcars` to create a gt table;
#' # add two row groups with the labels
#' # `powerful` and `super powerful`: the
#' # distinction being `hp` lesser or
#' # greater than `600`
#' tab_2 <-
#'   gtcars %>%
#'   dplyr::select(model, year, hp, trq) %>%
#'   dplyr::slice(1:8) %>%
#'   gt(rowname_col = "model") %>%
#'   tab_row_group(
#'     group = "powerful",
#'     rows = hp <= 600
#'   ) %>%
#'   tab_row_group(
#'     group = "super powerful",
#'     rows = hp > 600
#'   )
#'
#' @section Figures:
#' \if{html}{\figure{man_tab_row_group_1.svg}{options: width=100\%}}
#'
#' \if{html}{\figure{man_tab_row_group_2.svg}{options: width=100\%}}
#'
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
#' This label is placed above one or more column labels, spanning the width of
#' those columns and column labels.
#' @inheritParams fmt_number
#' @param label the text to use for the spanner column label.
#' @param columns the columns to be components of the spanner heading.
#' @return an object of class \code{gt_tbl}.
#' @examples
#' # Use `gtcars` to create a gt table;
#' # Group several columns related to car
#' # performance under a spanner column
#' # with the label `performance`
#' tab_1 <-
#'   gtcars %>%
#'   dplyr::select(
#'     -mfr, -trim, bdy_style, drivetrain,
#'     -drivetrain, -trsmn, -ctry_origin
#'   ) %>%
#'   dplyr::slice(1:8) %>%
#'   gt(rowname_col = "model") %>%
#'   tab_spanner(
#'     label = "performance",
#'     columns = vars(
#'       hp, hp_rpm, trq, trq_rpm,
#'       mpg_c, mpg_h)
#'   )
#'
#' @section Figures:
#' \if{html}{\figure{man_tab_spanner_1.svg}{options: width=100\%}}
#'
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
#' Add a source note to the footer part of the \pkg{gt} table. A source note is
#' useful for citing the data included in the table. Several can be added to the
#' footer, simply use multiple calls of \code{tab_source_note()} and they will
#' be inserted in the order provided. We can use Markdown formatting for the
#' note, or, if the table is intended for HTML output, we can include HTML
#' formatting.
#' @inheritParams fmt_number
#' @param source_note text to be used in the source note. We can optionally use
#'   the \code{\link{md}()} and \code{\link{html}()} functions to style the text
#'   as Markdown or to retain HTML elements in the text.
#' @return an object of class \code{gt_tbl}.
#' @examples
#' # Use `gtcars` to create a gt table;
#' # add a source note to the table
#' # footer that cites the data source
#' tab_1 <-
#'   gtcars %>%
#'   dplyr::select(mfr, model, msrp) %>%
#'   dplyr::slice(1:5) %>%
#'   gt() %>%
#'   tab_source_note(
#'     source_note = "From edmunds.com"
#'   )
#'
#' @section Figures:
#' \if{html}{\figure{man_tab_source_note_1.svg}{options: width=100\%}}
#'
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
