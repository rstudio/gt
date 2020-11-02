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
      group = rep(NA_character_, length(ordering)),
      group_label = rep(NA_character_, length(ordering)),
      row = rep(NA_integer_, length(ordering)),
      row_end = rep(NA_integer_, length(ordering)),
      stringsAsFactors = FALSE
    )

  for (i in seq(ordering)) {

    if (!is.na(ordering[i])) {
      rows_matched <- which(stub_df$groupname == ordering[i])
    } else {
      rows_matched <- which(is.na(stub_df$groupname))
    }

    groups_rows[i, "group"] <- ordering[i]
    groups_rows[i, "group_label"] <- ordering[i]

    groups_rows[i, "row"] <- min(rows_matched)
    groups_rows[i, "row_end"] <- max(rows_matched)
  }

  groups_rows <-
    dplyr::mutate(groups_rows, group_label = process_text(group_label, context))

  if (nrow(groups_rows) > 0) {

    others_group <- dt_stub_others_get(data = data) %||% NA_character_

    groups_rows[
      is.na(groups_rows[, "group"]),
      c("group", "group_label")] <- others_group
  }

  data <- dt_groups_rows_set(data = data, groups_rows = groups_rows)

  data
}
