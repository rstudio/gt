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


.dt_groups_rows_key <- "_groups_rows"

dt_groups_rows_get <- function(data) {

  ret <- dt__get(data, .dt_groups_rows_key)

  if (is.null(ret)) {
    cli::cli_abort("Must call `dt_groups_rows_build()` first.")
  }

  ret
}

dt_groups_rows_set <- function(data, groups_rows) {
  dt__set(data, .dt_groups_rows_key, groups_rows)
}

dt_groups_rows_build <- function(data, context) {

  data <- dt_stub_df_build(data = data, context = context)

  stub_df <- dt_stub_df_get(data = data)
  ordering <- dt_row_groups_get(data = data)

  others_group <-
    dt_options_get_value(data = data, option = "row_group_default_label")

  # Move formatted row values `stub_df`
  if (dt_stub_df_exists(data = data)) {

    stub_var <- dt_boxhead_get_var_stub(data = data)
    table_body <- dt_data_get(data = data)
    # For multiple stub columns, use the rightmost (primary) column for rowname
    primary_stub_var <- stub_var[length(stub_var)]
    stub_df[["rowname"]] <- as.character(table_body[[primary_stub_var]])
  }
  # what happens if dt_stub_df doesn't exist?

  l <- length(ordering)
  groups_rows <-
    data.frame(
      group_id = rep_len(NA_character_, l),
      row_start = rep_len(NA_integer_, l),
      row_end = rep_len(NA_integer_, l),
      stringsAsFactors = FALSE
    )

  # Using the `ordering` vector (which contains `group_id`
  # values), build the `groups_rows` table
  for (i in seq_along(ordering)) {

    if (all(is.na(ordering[i]))) {
      rows_matched <- which(is.na(stub_df$group_id))
    } else {
      rows_matched <- which(stub_df$group_id == ordering[i])
    }

    # If `rows_matched` is NA then go to next iteration
    if (length(ordering[i]) < 1 || length(rows_matched) < 1) next

    groups_rows[i, "group_id"] <- ordering[i]
    groups_rows[i, "row_start"] <- min(rows_matched)
    groups_rows[i, "row_end"] <- max(rows_matched)
  }

  # Join `built_group_label` values to the `groups_rows` table
  if (nrow(groups_rows) > 0) {

    group_label_df <-
      dplyr::distinct(stub_df[, c("built_group_label", "group_id")])

    groups_rows <-
      dplyr::left_join(groups_rows, group_label_df, by = "group_id")

    groups_rows <-
      dplyr::relocate(groups_rows, "group_id", group_label = "built_group_label", .before = 0)

    others_group <-
      dt_options_get_value(
        data = data,
        option = "row_group_default_label"
      )

    groups_rows[is.na(groups_rows[, "group_id"]), "group_label"] <-
      others_group
    if (!is.null(stub_df$group_label)) {
     # stub_df$group_label[is.null(stub_df$group_label[[1]])] <- others_group
      #data <- dt_stub_df_set(data, stub_df)

    }

  } else {

    # The resulting data frame must always have the same columns
    groups_rows <- cbind(groups_rows, group_label = character(0L))
  }

  if (nrow(groups_rows) > 0) {

    groups_rows[["has_summary_rows"]] <- rep_len(FALSE, nrow(groups_rows))
    groups_rows[["summary_row_side"]] <- rep_len(NA_character_, nrow(groups_rows))

    list_of_summaries <- dt_summary_df_get(data = data)

    for (i in seq_len(nrow(groups_rows))) {

      group_id <- groups_rows[["group_id"]][i]

      summary_rows_group_df_i <- list_of_summaries[["summary_df_display_list"]][[group_id]]

      if (!is.null(summary_rows_group_df_i)) {
        groups_rows[["has_summary_rows"]][i] <- TRUE
        groups_rows[["summary_row_side"]][i] <- summary_row_side(data = data, group_id = group_id)
      }
    }
  }

  # print(groups_rows)
  dt_groups_rows_set(data = data, groups_rows = groups_rows)
}
