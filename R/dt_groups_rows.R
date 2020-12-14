.dt_groups_rows_key <- "_groups_rows"

dt_groups_rows_get <- function(data) {

  ret <- dt__get(data, .dt_groups_rows_key)

  if (is.null(ret)) {
    stop("Must call `dt_groups_rows_build()` first.")
  }

  ret
}

dt_groups_rows_set <- function(data, groups_rows) {

  dt__set(data, .dt_groups_rows_key, groups_rows)
}

dt_groups_rows_build <- function(data, context) {

  stub_df <- dt_stub_df_get(data = data)
  ordering <- dt_row_groups_get(data = data)

  others_group <- dt_stub_others_get(data = data)

  groups_rows <-
    data.frame(
      group_id = rep(NA_character_, length(ordering)),
      row_start = rep(NA_integer_, length(ordering)),
      row_end = rep(NA_integer_, length(ordering)),
      stringsAsFactors = FALSE
    )

  # Using the `ordering` vector (which contains `group_id`
  # values), build the `groups_rows` table
  for (i in seq_along(ordering)) {

    if (!all(is.na(ordering[i]))) {
      rows_matched <- which(stub_df$group_id == ordering[i])
    } else {
      rows_matched <- which(is.na(stub_df$group_id))
    }

    # If `rows_matched` is NA then go to next iteration
    if (length(ordering[i]) < 1 ||
        length(rows_matched) < 1) next

    groups_rows[i, "group_id"] <- ordering[i]
    groups_rows[i, "row_start"] <- min(rows_matched)
    groups_rows[i, "row_end"] <- max(rows_matched)
  }

  # Join `group_label` values to the `groups_rows` table and ensure that
  # the `group_label` text is processed with `process_text()` in the
  # current output `context`

  if (nrow(groups_rows) > 0) {

    groups_rows <-
      groups_rows %>%
      dplyr::left_join(
        stub_df %>%
          dplyr::select(group_label, group_id) %>%
          dplyr::distinct(),
        by = "group_id"
      ) %>%
      dplyr::select(group_id, group_label, dplyr::everything()) %>%
      dplyr::mutate(group_label = process_text(group_label, context))

    others_group <- dt_stub_others_get(data = data) %||% NA_character_

    groups_rows[
      is.na(groups_rows[, "group_id"]),
      c("group_id", "group_label")] <- others_group
  }

  data <- dt_groups_rows_set(data = data, groups_rows = groups_rows)

  data
}
