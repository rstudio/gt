#' Add a row group
#'
#' Create a row group with a collection of rows. This requires specification of
#' the rows to be included, either by supplying row labels, row indices, or
#' through use of a select helper function like `starts_with()`.
#' @inheritParams fmt_number
#' @param group The name of the row group. This text will also serve as the row
#'   group label.
#' @param rows The rows to be made components of the row group. Can either be a
#'   vector of row captions provided in `c()`, a vector of row indices, or a
#'   helper function focused on selections. The select helper functions are:
#'   [starts_with()], [ends_with()], [contains()], [matches()], [one_of()], and
#'   [everything()].
#' @param others An option to set a default row group label for any rows not
#'   formally placed in a row group named by `group` in any call of
#'   `tab_row_group()`. A separate call to `tab_row_group()` with only a value
#'   to `others` is possible and makes explicit that the call is meant to
#'   provide a default row group label. If this is not set and there are rows
#'   that haven't been placed into a row group (where one or more row groups
#'   already exist), those rows will be automatically placed into a row group
#'   without a label.
#' @return An object of class `gt_tbl`.
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

  arrange_groups_vars <- dt_stub_groups_get(data = data)

  # Capture the `rows` expression
  row_expr <- rlang::enquo(rows)

  # Create a row group if a `group` is provided
  if (!is.null(group)) {

    # Get the `stub_df` data frame from `data`
    stub_df <- dt_stub_df_get(data = data)

    # Resolve the row numbers using the `resolve_vars` function
    resolved_rows_idx <-
      resolve_data_vals_idx(
        var_expr = !!row_expr,
        data = data,
        vals = stub_df$rowname
      )

    # Place the `group` label in the `groupname` column `stub_df`
    stub_df <- dt_stub_df_get(data = data)

    stub_df[resolved_rows_idx, "groupname"] <- process_text(group[1])

    data <- dt_stub_df_set(data = data, stub_df = stub_df)

    if (dt_stub_groupname_has_na(data = data)) {

      data <-
        dt_stub_groups_set(
          data = data,
          stub_groups = c(
            arrange_groups_vars, process_text(group[1]), NA_character_
          ) %>%
            unique()
        )

    } else {

      data <-
        dt_stub_groups_set(
          data = data,
          stub_groups = c(
            arrange_groups_vars,
            process_text(group[1])
          ) %>%
            unique()
        )
    }
  }

  # Set a name for the `others` group if a
  # name is provided
  if (!is.null(others)) {
    data <-
      dt_stub_others_set(
        data = data,
        stub_others = others[1] %>% process_text()
        )
  }

  data
}
