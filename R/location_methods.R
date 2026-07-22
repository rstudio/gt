#------------------------------------------------------------------------------#
#
#                /$$
#               | $$
#     /$$$$$$  /$$$$$$
#    /$$__  $$|_  $$_/
#   | $$  \ $$  | $$
#   | $$  | $$  | $$ /$$
#   |  $$$$$$$  |  $$$$/
#    \____  $$   \___/
#    /$$  \ $$
#   |  $$$$$$/
#    \______/
#
#  This file is part of the 'rstudio/gt' project.
#
#  Copyright (c) 2018-2026 gt authors
#
#  For full copyright and license information, please look at
#  https://gt.rstudio.com/LICENSE.html
#
#------------------------------------------------------------------------------#


#' Upgrader function for `cells_*` objects
#'
#' Upgrade a `cells_*` object to a `list()` if only a single instance is
#' provided.
#'
#' @param locations Any `cells_*` object.
#' @noRd
as_locations <- function(locations) {

  if (!inherits(locations, "location_cells")) {

    if (!is.list(locations) &&
        !all(vapply(locations, inherits, logical(1L), "location_cells"))) {

      cli::cli_abort(
        "{.arg locations} should be a list of {.topic [`cells_*()`](location-helper)} calls."
      )
    }
  } else {
    locations <- list(locations)
  }

  locations
}

add_summary_location_row <- function(
    loc,
    data,
    style,
    placement = NULL,
    df_type = "styles_df"
) {

  call <- call(class(loc)[[1]])
  stub_df <- dt_stub_df_get(data = data)
  row_groups <- unique(stub_df$group_id)

  summary_data <- dt_summary_get(data = data)

  # Redundant if #1608 is fixed.
  msg_no_summary <- c(
    "!" = "Can't find summary data.",
    "i" = "Call {.fn summary_rows} before {.fn tab_footnote}/{.fn tab_style}."
  )
  if (length(summary_data) == 0) {
    # Error early if can't find summary data. and try to add
    cli::cli_abort(msg_no_summary, call = call)
  } else {
    # try to identify if only grand summary rows are present
    # by checking if all grps are grand summary.
    grps <- unlist(lapply(summary_data, function(x) x$groups))

    if (identical(unique(grps), ":GRAND_SUMMARY:")) {
      cli::cli_abort(msg_no_summary, call = call)
    }
  }

  summary_data_summaries <-
    vapply(
      seq(summary_data),
      FUN.VALUE = logical(1),
      FUN = function(x) !is.null(summary_data[[x]]$groups)
    )

  summary_data <- summary_data[summary_data_summaries]

  resolved_row_groups_idx <-
    resolve_vector_i(
      expr = !!loc$groups,
      vector = row_groups,
      item_label = "row group",
      call = call
    )

  groups <- row_groups[resolved_row_groups_idx]

  # Adding styles to intersections of group, row, and column; any
  # that are missing at render time will be ignored
  for (group in groups) {

    id_vals <-
      unique(
        unlist(
          lapply(
            summary_data,
            FUN = function(summary_data_item) {

              id_vals <- names(summary_data_item$fns)

              if (isTRUE(summary_data_item$groups)) {
                id_vals
              } else if (group %in% summary_data_item$groups) {
                id_vals
              }
            }
          )
        )
      )

    if (!inherits(loc, "cells_stub_summary")) {

      columns <-
        resolve_cols_c(
          expr = !!loc$columns,
          data = data,
          call = call
        )

      if (length(columns) == 0L) {
        cli::cli_abort(c(
          "The location requested could not be resolved.",
          "*" = "Review the expression provided as `columns`."
          ),
          call = call
      )
      }
    } else {
      columns <- NA_character_
    }

    rows <-
      resolve_vector_i(
        expr = !!loc$rows,
        vector = id_vals,
        item_label = "summary row",
        call = call
      )

    if (length(rows) == 0L) {
      cli::cli_abort(c(
        "The location requested could not be resolved.",
        "*" = "Review the expression provided as `rows`."
        ),
        call = call
      )
    }

    if (df_type == "footnotes_df") {

      data <-
        dt_footnotes_add(
          data = data,
          locname = "summary_cells",
          grpname = group,
          colname = columns,
          locnum = 5,
          rownum = rows,
          footnotes = style,
          placement = placement
        )

    } else {

      data <-
        dt_styles_add(
          data = data,
          locname = "summary_cells",
          grpname = group,
          colname = columns,
          locnum = 5,
          rownum = rows,
          styles = style
        )
    }
  }

  data
}

add_grand_summary_location_row <- function(
    loc,
    data,
    style,
    placement = NULL,
    df_type = "styles_df"
) {
  call <- call(class(loc)[[1L]])
  summary_data <- dt_summary_get(data = data)

  # Redundant if #1608 is fixed.
  msg_no_grand_summary <- c(
    "!" = "Can't find grand summary data.",
    "i" = "Call {.fn grand_summary_rows} before {.fn tab_footnote}/{.fn tab_style}."
  )
  if (length(summary_data) == 0) {
    # Error early if can't find summary data. and try to add
    cli::cli_abort(msg_no_grand_summary, call = call)
  } else {
    # try to identify if only summary rows are present
    # by checking if any grps are grand summary.
    grps <- unlist(lapply(summary_data, function(x) x$groups))

    if (!":GRAND_SUMMARY:" %in% grps) {
      cli::cli_abort(msg_no_grand_summary, call = call)
    }
  }

  id_vals <-
    unique(
      unlist(
        lapply(
          summary_data,
          FUN = function(summary_data_item) {

            id_vals <- names(summary_data_item$fns)

            if (":GRAND_SUMMARY:" %in% summary_data_item$groups) {
              return(id_vals)
            }
            NULL
          }
        )
      )
    )

  if (!inherits(loc, "cells_stub_grand_summary")) {

    columns <-
      resolve_cols_c(
        expr = !!loc$columns,
        data = data,
        call = call
      )

    if (length(columns) == 0) {
      cli::cli_abort(c(
        "The location requested could not be resolved.",
        "*" = "Review the expression provided as `columns`."
        ),
        call = call
      )
    }
  } else {
    columns <- NA_character_
  }

  rows <-
    resolve_vector_i(
      expr = !!loc$rows,
      vector = id_vals,
      item_label = "grand summary row",
      call = call
    )

  if (length(rows) == 0) {
    cli::cli_abort(c(
      "The location requested could not be resolved.",
      "*" = "Review the expression provided as `rows`."
       ),
      call = call
     )
  }

  if (df_type == "footnotes_df") {

    data <-
      dt_footnotes_add(
        data = data,
        locname = "grand_summary_cells",
        grpname = grand_summary_col,
        colname = columns,
        locnum = 6,
        rownum = rows,
        footnotes = style,
        placement = placement
      )

  } else {

    data <-
      dt_styles_add(
        data = data,
        locname = "grand_summary_cells",
        grpname = grand_summary_col,
        colname = columns,
        locnum = 6,
        rownum = rows,
        styles = style
      )
  }

  data
}

# Given a location (i.e. cells_*() function result), evaluate captured quosures
# in the context of `data` and return an object with the `resolved` class added
# to the front of the class list.
resolve_location <- function(loc, data) {
  UseMethod("resolve_location")
}

#' @export
resolve_location.resolved <- function(loc, data) {
  # The object is already resolved
  loc
}

#' @export
resolve_location.cells_body <- function(loc, data) {

  call <- call("cells_body")
  loc$colnames <-
    resolve_cols_c(
      expr = !!loc[["columns"]],
      data = data,
      call = call
    )

  loc$rows <-
    resolve_rows_i(
      expr = !!loc[["rows"]],
      data = data,
      call = call
    )

  class(loc) <- c("resolved", class(loc))
  loc
}

#' @export
resolve_location.cells_column_labels <- function(loc, data) {

  call <- call("cells_column_labels")
  if (!is.null(loc$columns)) {

    loc$colnames <-
      resolve_cols_c(
        expr = !!loc[["columns"]],
        data = data,
        call = call
      )
  }

  # TODO: for now, when groups is set to TRUE, the behavior is not to
  #       select all groups; this should be changed to select all groups

  # TODO: abort() if groups provided not in the available set of groups
  class(loc) <- c("resolved", class(loc))

  loc
}

#' @export
resolve_location.cells_column_spanners <- function(loc, data) {

  call <- call("cells_column_spanners")
  resolved <- resolve_cells_column_spanners(data = data, object = loc, call = call)

  loc$spanners <- resolved$spanners

  class(loc) <- c("resolved", class(loc))

  loc
}

#' @export
resolve_location.cells_stub <- function(loc, data) {

  call <- call("cells_stub")
  resolved <- resolve_cells_stub(data = data, object = loc, call = call)

  loc$columns <- resolved$columns
  loc$rows <- resolved$rows

  class(loc) <- c("resolved", class(loc))

  loc
}

#' @export
resolve_location.cells_row_groups <- function(loc, data) {

  call <- call("cells_row_groups")
  resolved <- resolve_cells_row_groups(data = data, object = loc, call = call)

  loc$groups <- resolved$groups

  class(loc) <- c("resolved", class(loc))

  loc
}

# Given a location, reassign column/row numbers from data-relative to
# output-relative, and return an object with the `output_relative` class added.
to_output_location <- function(loc, data) {
  UseMethod("to_output_location")
}

#' @export
to_output_location.default <- function(loc, data) {

  loc <- resolve_location(loc = loc, data = data)

  class(loc) <- c("output_relative", class(loc))
  loc
}

#' @export
to_output_location.output_relative <- function(loc, data) {
  # The object is already output-relative
  loc
}

#' @export
to_output_location.cells_body <- function(loc, data) {

  stub_df <- dt_stub_df_get(data = data)
  groups <- dt_row_groups_get(data = data)

  loc <- resolve_location(loc = loc, data = data)

  rows_df <- get_row_reorder_df(groups = groups, stub_df = stub_df)

  # We shouldn't need to do this, but `body` doesn't match up exactly to
  # the colnum_final values due to groupnames/rownames
  #loc$colnames <- loc$colnames
  loc$rows <- rows_df$rownum_final[loc$rows]

  class(loc) <- c("output_relative", class(loc))
  loc
}

#' @export
to_output_location.cells_stub <- function(loc, data) {

  stub_df <- dt_stub_df_get(data = data)
  groups <- dt_row_groups_get(data = data)

  loc <- resolve_location(loc = loc, data = data)

  rows_df <- get_row_reorder_df(groups = groups, stub_df = stub_df)

  loc$rows <- rows_df$rownum_final[loc$rows]

  class(loc) <- c("output_relative", class(loc))
  loc
}
