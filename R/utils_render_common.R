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
#  Copyright (c) 2018-2024 gt authors
#
#  For full copyright and license information, please look at
#  https://gt.rstudio.com/LICENSE.html
#
#------------------------------------------------------------------------------#


# Define the contexts
all_contexts <- c("html", "grid", "latex", "rtf", "word", "default")

missing_val_token <- "::missing_val::"

validate_contexts <- function(contexts) {

  if (!all(contexts %in% all_contexts)) {

    invalid_contexts <- base::setdiff(contexts, all_contexts)

    cli::cli_abort(c(
      "All output contexts must be in the set of supported contexts.",
      "*" = "Supported: {all_contexts}",
      "*" = "Invalid: {invalid_contexts}"
    ))
  }
}

# Utility function to generate column numbers from column names;
# used in: `resolve_footnotes_styles()`
colname_to_colnum <- function(
    data,
    colname,
    missing_is_zero = FALSE
) {

  vars_default <- dt_boxhead_get_vars_default(data = data)

  result <- match(colname, vars_default)

  if (missing_is_zero) {
    result[is.na(result)] <- 0L
  }

  result
}

# Utility function to generate finalized row numbers;
# used in: `resolve_footnotes_styles()`
rownum_translation <- function(body, rownum_start) {

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
render_formats <- function(data, context) {

  body <- dt_body_get(data = data)
  data_tbl <- dt_data_get(data = data)
  formats <- dt_formats_get(data = data)

  # Render input data to output data where formatting is specified
  for (fmt in formats)  {

    # Determine if the formatting function has a function relevant to
    # the context; if not, use the `default` function (which should
    # always be present)
    if (context %in% names(fmt$func)) {
      eval_func <- context
    } else {
      eval_func <- "default"
    }

    # Obtain compatibility information for the formatting function
    compat <- fmt$compat

    # Get the rows to which the formatting should be constrained
    rows <- fmt$rows

    for (col in fmt[["cols"]]) {

      # Perform rendering but only do so if the column is present
      if (
        col %in% colnames(data_tbl) &&
        is_compatible_formatter(
          table = data_tbl,
          column = col,
          rows = rows,
          compat = compat
        )
      ) {

        # Omit rows that are not present in the `data_tbl` object
        rows <- base::intersect(seq_len(nrow(data_tbl)), rows)

        result <- fmt$func[[eval_func]](data_tbl[[col]][rows])

        # If any of the resulting output is `NA`, that means we want
        # to NOT make changes to those particular cells' output
        # (i.e. inherit the results of the previous formatter).
        body[[col]][rows][!is.na(result)] <- stats::na.omit(result)
      }
    }
  }

  dt_body_set(data = data, body = body)
}

is_compatible_formatter <- function(table, column, rows, compat) {

  if (is.null(compat)) {
    return(TRUE)
  }

  inherits(table[[column]][rows], compat)
}

#' Render any formatting directives available in the `substitutions` list
#'
#' @noRd
render_substitutions <- function(
    data,
    context
) {

  body <- dt_body_get(data = data)
  data_tbl <- dt_data_get(data = data)
  substitutions <- dt_substitutions_get(data = data)

  # Render input data to output data where formatting
  # is specified
  for (subst in substitutions)  {

    # Determine if the formatter has a function relevant
    # to the context; if not, use the `default` function
    # (which should always be present)
    if (context %in% names(subst$func)) {
      eval_func <- context
    } else {
      eval_func <- "default"
    }

    for (col in subst[["cols"]]) {

      # Perform rendering but only do so if the column is present
      if (col %in% colnames(data_tbl)) {

        result <- subst$func[[eval_func]](data_tbl[[col]][subst$rows])

        # If any of the resulting output is `NA`, that
        # means we want to NOT make changes to those
        # particular cells' output (i.e. inherit the
        # results of the previous substitution).
        body[[col]][subst$rows][!is.na(result)] <- stats::na.omit(result)
      }
    }
  }

  data <- dt_body_set(data = data, body = body)

  data
}

# Move input data cells to `body` that didn't have any rendering applied
# during the `render_formats()` call
migrate_unformatted_to_output <- function(data, context) {

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

            x <- trimws(x, "right", " ")
            x <- process_text(x, context = context)
            x <- paste(x, collapse = ", ")
            x
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

      if (is.factor(vals)) {
        vals <- as.character(vals)
      }

      body[[colname]][row_index] <- process_text(text = vals, context = context)
    }
  }

  dt_body_set(data = data, body = body)
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
get_row_reorder_df <- function(groups, stub_df) {

  # If there are no group, there there is no reordering
  # so just return a data frame where the starting row
  # indices match the final row indices
  if (length(groups) == 0) {

    indices <- seq_len(nrow(stub_df))

    return(
      data.frame(
        rownum_start = indices,
        rownum_final = indices,
        stringsAsFactors = FALSE
      )
    )
  }

  indices <- lapply(stub_df$group_id, `%in%`, x = groups)
  indices <- lapply(indices, which)
  indices <- unlist(indices)
  indices <- order(indices)

  data.frame(
    rownum_start = seq_along(indices),
    rownum_final = indices,
    stringsAsFactors = FALSE
  )
}

# Function to recode the `rownum` value in the footnotes table
reorder_footnotes <- function(data) {

  stub_df <- dt_stub_df_get(data = data)
  footnotes_tbl <- dt_footnotes_get(data = data)

  rownum_final <- as.numeric(stub_df$rownum_i)

  for (i in seq_len(nrow(footnotes_tbl))) {

    if (
      !is.na(footnotes_tbl[i, ][["rownum"]]) &&
      footnotes_tbl[i, ][["locname"]] %in% c("data", "stub")
    ) {

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

  sz <- nrow(styles_tbl)
  tmp_rownum <- vector("integer", sz)
  tmp_mask <- vector("logical", sz)

  for (i in seq_len(sz)) {
    if (
      !is.na(styles_tbl$rownum[i]) &&
      !grepl("summary_cells", styles_tbl$locname[i], fixed = TRUE)
    ) {
      tmp_mask[i] <- TRUE
      tmp_rownum[i] <- which(rownum_final == styles_tbl$rownum[i])
    }
  }

  final_rownum <- styles_tbl$rownum
  final_rownum[tmp_mask] <- tmp_rownum[tmp_mask]
  styles_tbl$rownum <- final_rownum

  dt_styles_set(data = data, styles = styles_tbl)
}

resolve_secondary_pattern <- function(x) {

  #
  # Preprocessing
  #

  x <- gsub("<br>", "[[br]]", x, fixed = TRUE)

  while (grepl("<<.*?>>", x)) {

    m <- gregexpr("<<[^<]*?>>", x, perl = TRUE)

    matched <- unlist(regmatches(x, m))[1]

    m_start <- as.integer(m[[1]])
    m_length <- attr(m[[1]], "match.length")

    if (grepl(missing_val_token, matched)) {

      # Remove `matched` text from `x`
      x <-
        paste0(
          substr(x, 0, m_start - 1L),
          substr(x, m_start + m_length, 100000)
        )

    } else {

      # Remove `<<` and `>>` from `matched` and insert back into `x`
      matched_trimmed <- gsub("^<<|>>$", "", matched)

      x <-
        paste0(
          substr(x, 0, m_start - 1L),
          matched_trimmed,
          substr(x, m_start + m_length, 100000)
        )
    }
  }

  #
  # Postprocessing
  #

  x <- gsub("[[br]]", "<br>", x, fixed = TRUE)

  x
}

#' Perform merging of column contents
#'
#' This merges column content together with a pattern and possibly with a `type`
#' that specifies additional operations
#'
#' @noRd
perform_col_merge <- function(data, context) {

  col_merge <- dt_col_merge_get(data = data)

  if (length(col_merge) == 0) {
    return(data)
  }

  mutated_cols <- dt_col_merge_get_vars(data = data)
  body <- dt_body_get(data = data)
  data_tbl <- dt_data_get(data = data)

  for (i in seq_along(col_merge)) {

    type <- col_merge[[i]]$type

    type <- rlang::arg_match0(
      type,
      c("merge", "merge_range", "merge_uncert", "merge_n_pct")
    )

    if (type == "merge") {

      #
      # The `cols_merge()` formatting case
      #

      mutated_column <- mutated_cols[[i]]

      columns <- col_merge[[i]][["vars"]]
      rows <- col_merge[[i]][["rows"]]
      pattern <- col_merge[[i]][["pattern"]]

      glue_src_na_data <- lapply(as.list(data_tbl[rows, columns]), FUN = is.na)

      glue_src_data <- as.list(body[rows, columns])

      glue_src_data <-
        lapply(
          seq_along(glue_src_data),
          FUN = function(x) {

            # The source data (and 'source data' here means data that's already
            # been formatted and converted to `character`) having a character
            # `"NA"` value signals that the value should *probably* be treated
            # as missing (we are relatively certain it wasn't modified by
            # `sub_missing()`, a case where we consider the value *not* to be
            # missing because it was handled later) but we also want to
            # corroborate that with the original data values (checking for true
            # missing data there)

            missing_cond <- glue_src_data[[x]] == "NA" & glue_src_na_data[[x]]
            missing_cond[is.na(missing_cond)] <- TRUE

            glue_src_data[[x]][missing_cond] <- missing_val_token
            glue_src_data[[x]]
          }
        )

      glue_src_data <- stats::setNames(glue_src_data, seq_len(length(glue_src_data)))

      glued_cols <- as.character(glue_gt(glue_src_data, pattern))

      if (grepl("<<.*?>>", pattern)) {

        glued_cols <-
          vapply(
            glued_cols,
            FUN.VALUE = character(1L),
            USE.NAMES = FALSE,
            FUN = resolve_secondary_pattern
          )

        glued_cols <- gsub("<<|>>", "", glued_cols)
      }

      glued_cols <- gsub(missing_val_token, "NA", glued_cols, fixed = TRUE)

      body[rows, mutated_column] <- glued_cols

    } else if (type == "merge_n_pct") {

      #
      # The `cols_merge_n_pct()` formatting case
      #

      mutated_column <- mutated_cols[[i]]
      second_column <- col_merge[[i]][["vars"]][2]
      rows <- col_merge[[i]][["rows"]]

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
      rows_to_format_idx <- base::setdiff(rows_to_format_idx, zero_rows_idx)
      rows_to_format_idx <- base::intersect(rows_to_format_idx, rows)

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

      #
      # The `cols_merge_uncert()` case where lower and upper certainties
      # were provided as input columns
      #

      mutated_column <- mutated_cols[[i]]
      lu_column <- col_merge[[i]][["vars"]][2]
      uu_column <- col_merge[[i]][["vars"]][3]
      rows <- col_merge[[i]][["rows"]]

      pattern_equal <- col_merge[[i]][["pattern"]]
      sep <- col_merge[[i]][["sep"]]

      # Transform the separator text depending on specific
      # inputs and the `context`
      sep <- context_dash_mark(sep, context = context)
      sep <- context_plusminus_mark(sep, context = context)

      if (context == "html") {

        pattern_unequal <-
          paste0(
            "<<1>><span style=\"",
            "display:inline-block;",
            "line-height:1em;",
            "text-align:right;",
            "font-size:60%;",
            "vertical-align:-0.25em;",
            "margin-left:0.1em;",
            "\">",
            "+<<3>><br>",
            context_minus_mark(context = context), "<<2>>",
            "</span>"
          )

      } else if (context == "latex") {

        pattern_unequal <- "$<<1>>^{+<<3>>}_{-<<2>>}$"

      } else if (context == "rtf") {

        pattern_unequal <- "<<1>>(+<<3>>, -<<2>>)"
      }

      # Determine rows where NA values exist
      na_1_rows <- is.na(data_tbl[[mutated_column]])
      na_lu_rows <- is.na(data_tbl[[lu_column]])
      na_uu_rows <- is.na(data_tbl[[uu_column]])
      na_lu_or_uu <- na_lu_rows | na_uu_rows
      na_lu_and_uu <- na_lu_rows & na_uu_rows
      lu_equals_uu <- data_tbl[[lu_column]] == data_tbl[[uu_column]] & !na_lu_or_uu

      rows_to_format_equal <- base::intersect(which(!na_1_rows & lu_equals_uu), rows)
      rows_to_format_unequal <- base::intersect(which(!na_1_rows & !na_lu_and_uu & !lu_equals_uu), rows)

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
            pattern_unequal,
            .open = "<<",
            .close = ">>"
          )
        )

    } else {

      #
      # The `cols_merge_range()` and `cols_merge_uncert()` (standard
      # uncertainties) formatting cases
      #

      mutated_column <- mutated_cols[[i]]
      second_column <- col_merge[[i]][["vars"]][2]
      rows <- col_merge[[i]][["rows"]]

      pattern <- col_merge[[i]][["pattern"]]
      sep <- col_merge[[i]][["sep"]]

      # Replace any fullwidth tilde characters (the range separator in
      # the 'ja' locale) with standard `~` in the LaTeX rendering context
      if (grepl("\UFF5E", sep) && context == "latex") {
        sep <- gsub("\UFF5E", "~", sep)
      }

      # Transform the separator text depending on specific
      # inputs and the `context`
      sep <- context_dash_mark(sep, context = context)
      sep <- context_plusminus_mark(sep, context = context)

      # Determine rows where NA values exist
      na_1_rows <- is.na(data_tbl[[mutated_column]])
      na_2_rows <- is.na(data_tbl[[second_column]])

      if (type == "merge_range") {
        rows_to_format <- base::intersect(which(!(na_1_rows & na_2_rows)), rows)
      } else if (type == "merge_uncert") {
        rows_to_format <- base::intersect(which(!(na_1_rows | na_2_rows)), rows)
      }

      body_1_vals <- body[[mutated_column]][rows_to_format]
      body_1_vals[body_1_vals == "<br />"] <- ""

      body_2_vals <- body[[second_column]][rows_to_format]
      body_2_vals[body_2_vals == "<br />"] <- ""

      body[rows_to_format, mutated_column] <-
        as.character(
          glue_gt(
            list(
              "1" = body_1_vals,
              "2" = body_2_vals,
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
replace_na_groups_df <- function(groups_df, others_group) {

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
replace_na_groups_rows_df <- function(groups_rows_df, others_group) {

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
    return(as.character(vect[max(positions)]))
  }
}

# Determine whether the table should have row labels
# set within a column in the stub
stub_rownames_has_column <- function(data) {
  isTRUE("row_id" %in% dt_stub_components(data = data))
}

# Determine whether the table should have row group labels
# set within a column in the stub
stub_group_names_has_column <- function(data) {

  # If there aren't any row groups then the result is always FALSE
  if (nrow(dt_groups_rows_get(data = data)) < 1L) {
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
  dt_has_built_assert(data = data)

  # Obtain the number of visible columns in the built table
  n_data_cols <- get_number_of_visible_data_columns(data = data)
  n_data_cols + length(get_stub_layout(data = data))
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

# Get a matrix of all body cells
get_body_component_cell_matrix <- function(data) {

  body <- dt_body_get(data = data)
  stub_layout <- get_stub_layout(data = data)
  default_vars <- dt_boxhead_get_vars_default(data = data)

  body_matrix <- unname(as.matrix(body[, default_vars]))

  if (length(stub_layout) == 0) {
    return(body_matrix)
  }

  if ("rowname" %in% stub_layout) {

    body_matrix <-
      cbind(
        unname(as.matrix(body[, dt_boxhead_get_var_stub(data = data)])),
        body_matrix
      )
  }

  if ("group_label" %in% stub_layout) {

    groups_rows_df <- dt_groups_rows_get(data = data)
    groups_rows_df <- groups_rows_df[, c("group_id", "group_label", "row_start"), drop = FALSE]

    stub_df <- dt_stub_df_get(data = data)
    stub_df$row_id <- NULL
    stub_df$group_label <- NULL
    stub_df <- dplyr::inner_join(stub_df, groups_rows_df, by = "group_id")
    stub_df$row <- seq_len(nrow(stub_df))
    stub_df$built <- ""
    cnd <- stub_df$row_start == stub_df$row
    # Use built_group_label for row = row start
    stub_df$built[cnd] <- stub_df$built_group_label[cnd]
    group_label_matrix <- as.matrix(stub_df$built)

    body_matrix <- cbind(group_label_matrix, body_matrix)
  }

  body_matrix
}

summary_row_side <- function(data, group_id) {

  # Check that `group_id` isn't NULL and that length is exactly 1
  if (is.null(group_id) || length(group_id) != 1) {
    cli::cli_abort("`group_id` cannot be `NULL` and must be of length 1.")
  }

  list_of_summaries <- dt_summary_df_get(data = data)

  # Obtain the summary data table specific to the group ID and
  # then get the "side" attribute value
  summary_df <- list_of_summaries$summary_df_display_list[[group_id]]

  unique(summary_df[["::side::"]])
}

#' Resolve footnotes or styles
#'
#' @noRd
resolve_footnotes_styles <- function(data, tbl_type) {

  spanners <- dt_spanners_get(data = data)
  body <- dt_body_get(data = data)
  groups_rows_df <- dt_groups_rows_get(data = data)

  # Get the `footnote_marks` option from the options table
  footnote_marks <- dt_options_get_value(data = data, option = "footnotes_marks")

  rlang::arg_match0(tbl_type, c("footnotes", "styles"))

  if (tbl_type == "footnotes") {
    tbl <- dt_footnotes_get(data = data)
  } else {
    tbl <- dt_styles_get(data = data)
  }

  # Return `data` unchanged if there are no rows in `tbl`
  if (nrow(tbl) == 0L) {
    return(data)
  }

  # Obtain all of the visible (`"default"`), non-stub
  # column names for the table
  default_vars <- dt_boxhead_get_vars_default(data = data)

  cond <-
    (tbl$locname != "data" & tbl$locname != "columns_columns") |
    (tbl$colname %in% default_vars)

  tbl <- tbl[cond, ]

  # Return `data` unchanged if there are no rows in `tbl`
  if (nrow(tbl) == 0L) {
    return(data)
  }

  #
  # Pare down the rows in `tbl` to only those with active locations
  #

  # Filter `tbl` by elements preceding the data rows
  # (i.e., if element is not present but a reference is,
  # remove the footnote reference since it is not relevant)

  # Filter by `title`
  if (!dt_heading_has_title(data = data)) {
    tbl <- tbl[tbl$locname != "title", ]
  }

  # Filter by `subtitle`
  if (!dt_heading_has_subtitle(data = data)) {
    tbl <- tbl[tbl$locname != "subtitle", ]
  }

  # Filter by `grpname` in columns groups
  if ("columns_groups" %in% tbl[["locname"]]) { # remove conditional

    spanner_ids <- unique(unlist(spanners$spanner_id))

    tbl <- tbl[tbl$locname != "column_groups" | tbl$grpname %in% spanner_ids, , drop = FALSE]
  }

  # Filter by `grpname` in row groups
  if ("row_groups" %in% tbl[["locname"]]) {

    tbl <-
      vctrs::vec_rbind(
        tbl[tbl$locname != "row_groups", , drop = FALSE],
        tbl[tbl$locname == "row_groups" & tbl$grpname %in% groups_rows_df$group_id, , drop = FALSE]
      )
  }

  # Filter `tbl` by the remaining columns in `body`
  tbl <- tbl[is.na(tbl$colname) | tbl$colname %in%  dt_boxhead_get_vars_default(data = data), , drop = FALSE]

  # Return `data` unchanged if there are no rows in `tbl`
  if (nrow(tbl) == 0L) {
    return(data)
  }

  # Reorganize records that target the data rows
  if (any(tbl[["locname"]] %in% c("data", "stub"))) {

    data_cond <- tbl$locname %in% c("data", "stub")
    tbl_not_data <- tbl[!data_cond, ]

    tbl_data <- tbl[data_cond, ]

    if (nrow(tbl_data) > 0L) {

      # Re-map the `rownum` to the new row numbers for the
      # data rows
      tbl_data$rownum <- rownum_translation(
        body = body,
        rownum_start = tbl_data$rownum)

      # Add a `colnum` column that's required for
      # arranging `tbl` in such a way that the order
      # of records moves from top-to-bottom, left-to-right
      tbl_data$colnum <- ifelse(
        tbl_data$locname == "stub",
        0L, colname_to_colnum(
          data = data, colname = tbl_data$colname))
    }

    # Re-combine `tbl_data` with `tbl`
    tbl <- vctrs::vec_rbind(tbl_not_data, tbl_data)

  } else {
    tbl$colnum <- NA_integer_
  }

  # For the row groups, insert a `rownum` based on `groups_rows_df`
  if ("row_groups" %in% tbl[["locname"]]) {

    cond <- tbl$locname != "row_groups"
    tbl_not_row_groups <- tbl[cond, ]

    tbl_row_groups <-
      dplyr::inner_join(
        tbl[!cond, ],
        groups_rows_df,
        by = c("grpname" = "group_id")
      )

    tbl_row_groups$rownum <- tbl_row_groups$row_start - 0.1
    tbl_row_groups$colnum <- 1
    tbl_row_groups$row_start <- NULL
    tbl_row_groups$row_end <- NULL
    tbl_row_groups$group_label <- NULL

    # Re-combine `tbl_not_row_groups` with `tbl_row_groups`
    tbl <- vctrs::vec_rbind(tbl_not_row_groups, tbl_row_groups)
  }

  # For the summary cells, insert a `rownum` based
  # on `groups_rows_df`
  if ("summary_cells" %in% tbl[["locname"]]) {

    cond <- tbl$locname != "summary_cells"
    tbl_not_summary_cells <- tbl[cond,]

    tbl_summary_cells <-
      dplyr::inner_join(
        tbl[!cond & tbl$locname == "summary_cells", , drop = FALSE],
        groups_rows_df,
        by = c("grpname" = "group_id")
      )

    tbl_summary_cells$rownum <-
      tbl_summary_cells$rownum / 100 + tbl_summary_cells$row_end

    tbl_summary_cells$row_start <- NULL
    tbl_summary_cells$row_end <- NULL
    tbl_summary_cells$group_label <- NULL

    tbl_summary_cells$colnum <-
      colname_to_colnum(
        data,
        tbl_summary_cells$colname,
        missing_is_zero = TRUE
      )

    # Re-combine `tbl_not_summary_cells` with `tbl_summary_cells`
    tbl <- dplyr::bind_rows(tbl_not_summary_cells, tbl_summary_cells)
  }

  # For the grand summary cells, insert a `colnum` based
  # on `groups_rows_df`
  if (6 %in% tbl[["locnum"]]) {

    cond <- tbl$locnum != 6
    tbl_not_g_summary_cells <- tbl[cond, ]

    tbl_g_summary_cells <- tbl[!cond, ]
    tbl_g_summary_cells$colnum <- colname_to_colnum(
      data = data,
      colname = tbl_g_summary_cells$colname,
      missing_is_zero = TRUE
    )

    # Re-combine `tbl_not_g_summary_cells`
    # with `tbl_g_summary_cells`
    tbl <-
      dplyr::bind_rows(
        tbl_not_g_summary_cells, tbl_g_summary_cells
      )
  }

  # For the column label cells, insert a `colnum`
  # based on `boxh_df`
  if ("columns_columns" %in% tbl[["locname"]]) {

    cond <- tbl$locname != "columns_columns"
    tbl_not_column_cells <- tbl[cond, ]

    tmp <- tbl[!cond, ]
    tmp$colnum <- NULL
    tmp$rownum <- NULL

    default_variables <- dplyr::tibble(
      colnum = seq(default_vars),
      colname = default_vars,
      rownum = -1L
    )
    tbl_column_cells <- dplyr::inner_join(tmp, default_variables, by = "colname")

    # Re-combine `tbl_not_column_cells`
    # with `tbl_column_cells`
    tbl <-
      dplyr::bind_rows(
        tbl_not_column_cells,
        tbl_column_cells
      )
  }

  # For the column spanner label cells, insert a
  # `colnum` based on `boxh_df`
  if ("columns_groups" %in% tbl[["locname"]]) {

    tbl_not_col_spanner_cells <- tbl[tbl$locname != "columns_groups", ]

    spanner_id_names <- dt_spanners_get_ids(data = data)

    spanners_matrix_ids <-
      dt_spanners_print_matrix(
        data = data,
        include_hidden = FALSE,
        ids = TRUE,
        omit_columns_row = TRUE
      )

    spanner_id <- spanner_start_colname <- spanner_start_colnum <- level <- NULL # same as c()

    for (i in seq_along(spanner_id_names)) {

      if (spanner_id_names[i] %in% spanners_matrix_ids) {

        for (j in seq_len(nrow(spanners_matrix_ids))) {

          if (spanner_id_names[i] %in% spanners_matrix_ids[j, ]) {

            spanner_start_colname_i <-
              names(
                sort(
                  spanners_matrix_ids[j, ] == spanner_id_names[i],
                  decreasing = TRUE
                )[1]
              )

            spanner_start_colname <- c(spanner_start_colname, spanner_start_colname_i)

            spanner_start_colnum <-
              c(
                spanner_start_colnum,
                which(default_vars == spanner_start_colname_i)
              )

            level <-
              c(
                level,
                ((rev(seq_len(nrow(spanners_matrix_ids))) + 1) * (-1))[j]
              )

            spanner_id <- c(spanner_id, spanner_id_names[i])
          }
        }
      }
    }

    spanner_label_df <-
      data.frame(
        grpname = spanner_id,
        colname = spanner_start_colname,
        colnum = spanner_start_colnum,
        rownum = level,
        stringsAsFactors = FALSE
      )

    if (nrow(spanner_label_df) > 0L) {

      tmp <- tbl
      tmp[ c("colnum", "colname", "rownum")] <- NULL
      tmp <- tmp[tmp$locname == "columns_groups", ]

      tbl_column_spanner_cells <-
        dplyr::inner_join(tmp, spanner_label_df, by = "grpname")

      # Re-combine `tbl_not_col_spanner_cells` with `tbl_not_col_spanner_cells`
      tbl <-
        vctrs::vec_rbind(
          tbl_not_col_spanner_cells,
          tbl_column_spanner_cells
        )

    } else {
      tbl <- tbl_not_col_spanner_cells
    }
  }

  # Sort the table rows
  order_of_tbl <- order(tbl$locnum, tbl$rownum, tbl$colnum)
  tbl <- tbl[order_of_tbl, , drop = FALSE]

  # In the case of footnotes, populate table
  # column with footnote marks
  if (tbl_type == "footnotes") {

    # Generate a lookup table with ID'd footnote
    # text elements (that are distinct)
    # tmp <- unique(tbl$footnotes[tbl$locname != "none"])
    # lookup_tbl <- dplyr::tibble(footnotes = tmp, fs_id = rownames(tmp))
    lookup_tbl <- tbl[tbl$locname != "none", "footnotes", drop = FALSE]
    # Make lookup_tbl be a table with a single column "footnotes" with distinct values
    lookup_tbl <- dplyr::distinct(lookup_tbl)

    # Create fs_id as rownames, delete row names and relocate at first position
    if (!is.null(rownames(lookup_tbl))) {
      lookup_tbl$fs_id <- rownames(lookup_tbl)
      rownames(lookup_tbl) <- NULL
      fs_id_pos <- ncol(lookup_tbl) # last column
      lookup_tbl <- lookup_tbl[ , c(fs_id_pos, seq_len(fs_id_pos - 1L)), drop = FALSE]
    }

    # Join the lookup table to `tbl`
    tbl <- dplyr::left_join(tbl, lookup_tbl, by = "footnotes")
    tbl$fs_id <- ifelse(tbl$locname == "none", NA_character_, tbl$fs_id)

    if (nrow(tbl) > 0L) {

      # Retain the row that only contain `locname == "none"`
      tbl_no_loc <- tbl[tbl$locname == "none", , drop = FALSE]

      # Modify `fs_id` to contain the footnote marks we need
      tbl <- tbl[tbl$locname != "none", , drop = FALSE]

      if (nrow(tbl) > 0L) {

        tbl$fs_id <- as.integer(tbl$fs_id)
        tbl$fs_id <- process_footnote_marks(tbl$fs_id, marks = footnote_marks)
      }

      tbl <- vctrs::vec_rbind(tbl_no_loc, tbl)
    }
  }

  if (tbl_type == "styles" && nrow(tbl) > 0L) {
    tbl <-
      dplyr::summarize(
        tbl,
        styles = list(as_style(styles)),
        .by =  c("locname", "grpname", "colname", "locnum", "rownum", "colnum")
      )
  }

  if (tbl_type == "footnotes") {
    data <- dt_footnotes_set(data = data, footnotes = tbl)
  } else {
    data <- dt_styles_set(data = data, styles = tbl)
  }

  data
}
