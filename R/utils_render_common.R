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
  match(rownum_start, as.numeric(rownames(body)))
}

#' Render any formatting directives available in the `formats` list
#'
#' @noRd
render_formats <- function(data, skip_compat_check = FALSE, context) {

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
      # Or if we are confident that we have a compatible formatter and no rows /cols are hidden
      if (
        skip_compat_check ||
        (
          col %in% colnames(data_tbl) &&
          is_compatible_formatter(
            table = data_tbl,
            column = col,
            rows = rows,
            compat = compat
          )
        )
      ) {

        # Omit rows that are not present in the `data_tbl` object
        rows <- base::intersect(seq_len(nrow(data_tbl)), rows)

        result <- fmt$func[[eval_func]](data_tbl[[col]][rows])

        # If any of the resulting output is `NA`, that means we want
        # to NOT make changes to those particular cells' output
        # (i.e. inherit the results of the previous formatter).
        body[[col]][rows][!is.na(result)] <- omit_na(result)
      }
    }
  }

  dt_body_set(data = data, body = body)
}

is_compatible_formatter <- function(table, column, rows, compat) {

  if (is.null(compat)) {
    return(TRUE)
  }

  column_data <- table[[column]][rows]
  
  # Check for standard class inheritance
  if (inherits(column_data, compat)) {
    return(TRUE)
  }
  
  # If compat includes numeric or integer types, also check for bit64::integer64
  if (any(c("numeric", "integer") %in% compat) && inherits(column_data, "integer64")) {
    return(TRUE)
  }
  
  FALSE
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
        body[[col]][subst$rows][!is.na(result)] <- omit_na(result)
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

  # Track which footnotes should be kept (not targeting hidden rows)
  keep_footnote <- rep(TRUE, nrow(footnotes_tbl))

  for (i in seq_len(nrow(footnotes_tbl))) {

    if (
      !is.na(footnotes_tbl[i, ][["rownum"]]) &&
      footnotes_tbl[i, ][["locname"]] %in% c("data", "stub")
    ) {

      new_rownum <- which(rownum_final == footnotes_tbl[i, ][["rownum"]])

      if (length(new_rownum) == 0) {
        # Row is hidden, mark footnote for removal
        keep_footnote[i] <- FALSE
      } else {
        footnotes_tbl[i, ][["rownum"]] <- new_rownum
      }
    }
  }

  # Filter out footnotes targeting hidden rows
  footnotes_tbl <- footnotes_tbl[keep_footnote, , drop = FALSE]

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
  keep_style <- rep(TRUE, sz)  # Track which styles to keep

  for (i in seq_len(sz)) {
    if (
      !is.na(styles_tbl$rownum[i]) &&
      !grepl("summary_cells", styles_tbl$locname[i], fixed = TRUE)
    ) {
      new_rownum <- which(rownum_final == styles_tbl$rownum[i])

      if (length(new_rownum) == 0) {
        # Row is hidden, mark style for removal
        keep_style[i] <- FALSE
      } else {
        tmp_mask[i] <- TRUE
        tmp_rownum[i] <- new_rownum
      }
    }
  }

  final_rownum <- styles_tbl$rownum
  final_rownum[tmp_mask] <- tmp_rownum[tmp_mask]
  styles_tbl$rownum <- final_rownum

  # Filter out styles targeting hidden rows
  styles_tbl <- styles_tbl[keep_style, , drop = FALSE]

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

      glue_src_data <- stats::setNames(glue_src_data, seq_along(glue_src_data))

      which_cols <- unique(unlist(str_complete_extract(pattern, "\\{\\d+\\}")))
      which_cols <- gsub("\\{|\\}", "", which_cols)
      if (!all(which_cols %in% names(glue_src_data))) {
        missing <- base::setdiff(which_cols, names(glue_src_data))
        cli::cli_abort(c(
          "Can't perform column merging",
          "Can't find reference {missing}.",
          "i" = "Review {.arg pattern} provided to {.fn cols_merge}."
        ))
      }
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
  n_data_cols + get_stub_column_count(data)
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

# Get the number of columns in the stub for layout purposes
get_stub_column_count <- function(data) {

  stub_layout <- get_stub_layout(data = data)

  if (is.null(stub_layout)) {
    return(0)
  }

  # Check if we have "rowname" in the layout
  if ("rowname" %in% stub_layout) {
    # Check if there are multiple stub columns
    stub_vars <- dt_boxhead_get_var_stub(data = data)
    if (length(stub_vars) > 1 && !any(is.na(stub_vars))) {
      # Multiple stub columns
      group_count <- if ("group_label" %in% stub_layout) 1 else 0
      return(length(stub_vars) + group_count)
    }
  }

  # Default: return the length of the layout (original behavior)
  return(length(stub_layout))
}
