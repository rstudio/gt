# Define the contexts
all_contexts <- c("html", "latex", "rtf", "default")

validate_contexts <- function(contexts) {

  if (!all(contexts %in% all_contexts)) {

    invalid_contexts <- base::setdiff(contexts, all_contexts)

    stop("All output contexts must be in the set of supported contexts\n",
         " * Supported: ", paste0(all_contexts, collapse = ", "), "\n",
         " * Invalid: ", paste0(invalid_contexts, collapse = ", "),
         call. = FALSE)
  }
}

# Utility function to generate column numbers from column names;
# used in: `resolve_footnotes_styles()`
colname_to_colnum <- function(data,
                              colname,
                              missing_is_zero = FALSE) {

  col_nums <- c()

  for (col in colname) {
    if (is.na(col)) {
      if (missing_is_zero) {
        col_nums <- c(col_nums, 0L)
      } else {
        col_nums <- c(col_nums, NA_integer_)
      }
    } else {
      col_nums <-
        c(
          col_nums,
          which(dt_boxhead_get_vars_default(data = data) == col)
        )
    }
  }

  col_nums
}

# Utility function to generate finalized row numbers;
# used in: `resolve_footnotes_styles()`
rownum_translation <- function(body,
                               rownum_start) {

  rownum_final <- c()
  for (rownum_s in rownum_start) {
    rownum_final <-
      c(
        rownum_final,
        which(as.numeric(rownames(body)) == rownum_s)
      )
  }

  rownum_final
}

#' Render any formatting directives available in the `formats` list
#'
#' @noRd
render_formats <- function(data,
                           context) {

  body <- dt_body_get(data = data)
  data_tbl <- dt_data_get(data = data)
  formats <- dt_formats_get(data = data)

  # Render input data to output data where formatting
  # is specified
  for (fmt in formats)  {

    # Determine if the formatter has a function relevant
    # to the context; if not, use the `default` function
    # (which should always be present)
    if (context %in% names(fmt$func)) {
      eval_func <- context
    } else {
      eval_func <- "default"
    }

    for (col in fmt[["cols"]]) {

      # Perform rendering but only do so if the column is present
      if (col %in% colnames(data_tbl)) {

        result <- fmt$func[[eval_func]](data_tbl[[col]][fmt$rows])

        # If any of the resulting output is `NA`, that
        # means we want to NOT make changes to those
        # particular cells' output (i.e. inherit the
        # results of the previous formatter).
        body[[col]][fmt$rows][!is.na(result)] <- stats::na.omit(result)
      }
    }
  }

  data <- dt_body_set(data = data, body = body)

  data
}

# Move input data cells to `body` that didn't have any rendering applied
# during the `render_formats()` call
migrate_unformatted_to_output <- function(data,
                                          context) {

  body <- dt_body_get(data = data)
  data_tbl <- dt_data_get(data = data)

  for (colname in colnames(body)) {

    row_index <- is.na(body[[colname]])

    if (inherits(data_tbl[[colname]], "list")) {

      # Use `lapply()` so that all values could be treated independently
      body[[colname]][row_index] <-
        lapply(
          data_tbl[[colname]][row_index],
          FUN = function(x) {

            if (is.numeric(x)) {
              x <-
                format(
                  x,
                  drop0trailing = FALSE,
                  trim = TRUE,
                  justify = "none"
                )
            }

            x %>%
              tidy_gsub("\\s+$", "") %>%
              process_text(context = context) %>%
              paste(collapse = ", ")
          }
        )

    } else {

      # No `lapply()` used: all values will be treated cohesively
      vals <- data_tbl[[colname]][row_index]

      if (is.numeric(vals)) {
        vals <-
          format(
            vals,
            drop0trailing = FALSE,
            trim = TRUE,
            justify = "none"
          )
      }

      body[[colname]][row_index] <- process_text(text = vals, context = context)
    }
  }

  data <- dt_body_set(data = data, body = body)

  data
}

#' Perform any text transformations
#'
#' @noRd
perform_text_transforms <- function(data) {

  transforms <- dt_transforms_get(data = data)

  for (transform in transforms) {

    data <-
      text_transform_at_location(
        loc = transform$resolved,
        data = data,
        fn = transform$fn
      )
  }

  data
}

#' Obtain a reordering df for the data rows
#'
#' @noRd
get_row_reorder_df <- function(groups,
                               stub_df) {

  # If there are no group, there there is no reordering
  # so just return a data frame where the starting row
  # indices match the final row indices
  if (length(groups) == 0) {

    indices <- seq_len(nrow(stub_df))

    return(
      dplyr::tibble(
        rownum_start = indices,
        rownum_final = indices
      )
    )
  }

  indices <-
    lapply(stub_df$group_id, `%in%`, x = groups) %>%
    lapply(which) %>%
    unlist() %>%
    order()

  dplyr::tibble(
    rownum_start = seq_along(indices),
    rownum_final = indices
  )
}

# Function to recode the `rownum` value in the footnotes table
reorder_footnotes <- function(data) {

  stub_df <- dt_stub_df_get(data = data)
  footnotes_tbl <- dt_footnotes_get(data = data)

  rownum_final <- stub_df$rownum_i %>% as.numeric()

  for (i in seq_len(nrow(footnotes_tbl))) {

    if (!is.na(footnotes_tbl[i, ][["rownum"]]) &&
        footnotes_tbl[i, ][["locname"]] %in% c("data", "stub")) {

      footnotes_tbl[i, ][["rownum"]] <-
        which(rownum_final == footnotes_tbl[i, ][["rownum"]])
    }
  }

  dt_footnotes_set(data = data, footnotes = footnotes_tbl)
}

# Function to recode the `rownum` value in the styles table
reorder_styles <- function(data) {

  stub_df <- dt_stub_df_get(data = data)
  styles_tbl <- dt_styles_get(data = data)

  rownum_final <- as.numeric(stub_df[, "rownum_i", drop = TRUE])

  for (i in seq_len(nrow(styles_tbl))) {

    if (
      !is.na(styles_tbl[i, ][["rownum"]]) &&
      !grepl("summary_cells", styles_tbl[i, ][["locname"]])
    ) {

      styles_tbl[i, ][["rownum"]] <-
        which(rownum_final == styles_tbl[i, ][["rownum"]])
    }
  }

  dt_styles_set(data = data, styles = styles_tbl)
}

#' Perform merging of column contents
#'
#' This merges column content together with a pattern and possibly with a `type`
#' that specifies additional operations
#'
#' @noRd
perform_col_merge <- function(data,
                              context) {

  col_merge <- dt_col_merge_get(data = data)
  body <- dt_body_get(data = data)
  data_tbl <- dt_data_get(data = data)

  if (length(col_merge) == 0) {
    return(data)
  }

  for (i in seq_along(col_merge)) {

    type <- col_merge[[i]]$type

    if (!(type %in% c("merge", "merge_range", "merge_uncert", "merge_n_pct"))) {
      stop("Unknown `type` supplied.")
    }

    if (type == "merge") {

      mutated_column <- col_merge[[i]]$vars[1]
      mutated_column_sym <- sym(mutated_column)

      columns <- col_merge[[i]]$vars
      pattern <- col_merge[[i]]$pattern

      glue_src_data <- as.list(body[, columns])
      glue_src_data <- stats::setNames(glue_src_data, seq_len(length(glue_src_data)))

      body <-
        dplyr::mutate(
          body,
          !!mutated_column_sym := as.character(glue_gt(glue_src_data, pattern))
        )

    } else if (type == "merge_n_pct") {

      mutated_column <- col_merge[[i]]$vars[1]
      second_column <- col_merge[[i]]$vars[2]

      # This is a fixed pattern
      pattern <- "{1} ({2})"

      # Determine rows where NA values exist, and, those rows where
      # `0` is the value in the `mutated_column` (we don't want to
      # include a zero percentage value in parentheses)
      na_1_rows <- is.na(data_tbl[[mutated_column]])
      na_2_rows <- is.na(data_tbl[[second_column]])
      zero_rows <- data_tbl[[mutated_column]] == 0
      zero_rows[is.na(zero_rows)] <- FALSE
      zero_rows_idx <- which(zero_rows)

      # An `NA` value in either column should exclude that row from
      # processing via `glue_gt()`
      rows_to_format_idx <- which(!(na_1_rows | na_2_rows))
      rows_to_format_idx <- setdiff(rows_to_format_idx, zero_rows_idx)

      body[rows_to_format_idx, mutated_column] <-
        as.character(
          glue_gt(
            list(
              "1" = body[[mutated_column]][rows_to_format_idx],
              "2" = body[[second_column]][rows_to_format_idx]
            ),
            pattern
          )
        )

    } else if (type == "merge_uncert" && length(col_merge[[i]]$vars) == 3) {

      mutated_column <- col_merge[[i]]$vars[1]
      lu_column <- col_merge[[i]]$vars[2]
      uu_column <- col_merge[[i]]$vars[3]

      pattern_equal <- col_merge[[i]]$pattern
      sep <- col_merge[[i]]$sep

      # Transform the separator text depending on specific
      # inputs and the `context`
      sep <-
        sep %>%
        context_dash_mark(context = context) %>%
        context_plusminus_mark(context = context)

      if (context == "html") {

        pattern_unequal <-
          paste0(
            "<span>{1}",
            "<span style=\"margin-left: 0.1em;\">",
            "<span style=\"display: inline-block; ",
            "vertical-align: -0.3em; font-size: 60%; line-height: 1em; ",
            "text-align: right;\">",
            "+{3}<br>",
            context_minus_mark(context = context), "{2}</span></span></span>"
          )
      }

      # Determine rows where NA values exist
      na_1_rows <- is.na(data_tbl[[mutated_column]])
      na_lu_rows <- is.na(data_tbl[[lu_column]])
      na_uu_rows <- is.na(data_tbl[[uu_column]])
      na_lu_or_uu <- na_lu_rows | na_uu_rows
      lu_equals_uu <- data_tbl[[lu_column]] == data_tbl[[uu_column]] & !na_lu_or_uu

      rows_to_format_equal <- which(!na_1_rows & lu_equals_uu)
      rows_to_format_unequal <- which(!na_1_rows & !na_lu_or_uu & !lu_equals_uu)

      body[rows_to_format_equal, mutated_column] <-
        as.character(
          glue_gt(
            list(
              "1" = body[[mutated_column]][rows_to_format_equal],
              "2" = body[[lu_column]][rows_to_format_equal],
              "sep" = sep
            ),
            pattern_equal
          )
        )

      body[rows_to_format_unequal, mutated_column] <-
        as.character(
          glue_gt(
            list(
              "1" = body[[mutated_column]][rows_to_format_unequal],
              "2" = body[[lu_column]][rows_to_format_unequal],
              "3" = body[[uu_column]][rows_to_format_unequal]
            ),
            pattern_unequal
          )
        )

    } else {

      mutated_column <- col_merge[[i]]$vars[1]
      second_column <- col_merge[[i]]$vars[2]

      pattern <- col_merge[[i]]$pattern
      sep <- col_merge[[i]]$sep

      # Transform the separator text depending on specific
      # inputs and the `context`
      sep <-
        sep %>%
        context_dash_mark(context = context) %>%
        context_plusminus_mark(context = context)

      # Determine rows where NA values exist
      na_1_rows <- is.na(data_tbl[[mutated_column]])
      na_2_rows <- is.na(data_tbl[[second_column]])

      rows_to_format <-
        if (type == "merge_range") {
          which(!(na_1_rows & na_2_rows))
        } else if (type == "merge_uncert") {
          which(!(na_1_rows | na_2_rows))
        }

      body[rows_to_format, mutated_column] <-
        as.character(
          glue_gt(
            list(
              "1" = body[[mutated_column]][rows_to_format],
              "2" = body[[second_column]][rows_to_format],
              "sep" = sep
            ),
            pattern
          )
        )
    }
  }

  dt_body_set(data = data, body = body)
}

#' Suitably replace `NA` values in the `groups_df` data frame
#'
#' @param groups_df The `groups_df` data frame.
#' @param others_group The `others_group` vector.
#' @noRd
replace_na_groups_df <- function(groups_df,
                                 others_group) {

  if (nrow(groups_df) > 0) {
    groups_df[is.na(groups_df[, "group_id"]), "group_id"] <- others_group
  }

  groups_df
}

#' Suitably replace `NA` values in the `groups_rows_df` data frame
#'
#' @param groups_rows_df The `groups_rows_df` data frame.
#' @param others_group The `others_group` vector.
#' @noRd
replace_na_groups_rows_df <- function(groups_rows_df,
                                      others_group) {

  if (nrow(groups_rows_df) > 0) {
    groups_rows_df[
      is.na(groups_rows_df[, "group"]),
      c("group", "group_label")] <- others_group
  }

  groups_rows_df
}

last_non_na <- function(vect) {

  # Retrieve last non-NA value
  positions <- which(!is.na(vect))

  if (length(positions) == 0) {
    return(NA_character_)
  } else {
    return(vect[max(positions)])
  }
}

# Determine whether the table should have row labels
# set within a column in the stub
stub_rownames_has_column <- function(data) {

  isTRUE("rowname" %in% dt_stub_components(data = data))
}

# Determine whether the table should have row group labels
# set within a column in the stub
stub_group_names_has_column <- function(data) {

  # If there aren't any row groups then the result is always FALSE
  if (nrow(dt_groups_rows_get(data = data)) < 1) {
    return(FALSE)
  }

  # Given that there are row groups, we need to look at the option
  # `row_group_as_column` to determine whether they populate a column
  # located in the stub; if set as TRUE then that's the return value
  dt_options_get_value(data = data, option = "row_group_as_column")
}


# Get the number of columns for the visible (not hidden) data; this
# excludes the number of columns required for the table stub
get_number_of_visible_data_columns <- function(data) {
  length(dt_boxhead_get_vars_default(data = data))
}

get_effective_number_of_columns <- function(data) {

  # Check if the table has been built, return an error if that's not the case
  if (!dt_has_built(data)) {
    stop(
      "The `get_effective_number_of_columns()` function can only be used on ",
      "gt objects that have tables 'built'."
    )
  }

  # Obtain the number of visible columns in the built table
  n_data_cols <- get_number_of_visible_data_columns(data = data)
  n_data_cols + length(get_stub_layout(data))
}

get_stub_layout <- function(data) {

  # Determine which stub components are potentially present as columns
  stub_rownames_is_column <- stub_rownames_has_column(data = data)
  stub_groupnames_is_column <- stub_group_names_has_column(data = data)

  # Get the potential total number of columns in the table stub
  n_stub_cols <- stub_rownames_is_column + stub_groupnames_is_column

  # Resolve the layout of the stub (i.e., the roles of columns if present)
  if (n_stub_cols == 0) {
    # If summary rows are present, we will use the `rowname` column
    # for the summary row labels
    if (dt_summary_exists(data = data)) {
      return("rowname")
    } else {
      return(NULL)
    }
  } else {
    c(
      if (stub_groupnames_is_column) "group_label",
      if (stub_rownames_is_column) "rowname"
    )
  }
}
