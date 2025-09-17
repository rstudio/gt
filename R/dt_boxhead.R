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
#  Copyright (c) 2018-2025 gt authors
#
#  For full copyright and license information, please look at
#  https://gt.rstudio.com/LICENSE.html
#
#------------------------------------------------------------------------------#


.dt_boxhead_key <- "_boxhead"

dt_boxhead_get <- function(data) {
  dt__get(data, .dt_boxhead_key)
}

dt_boxhead_set <- function(data, boxh) {
  dt__set(data, .dt_boxhead_key, boxh)
}

dt_boxhead_init <- function(data) {

  # Get the column names from the data table
  vars <- colnames(dt_data_get(data = data))

  # If there are any 'labeled' columns in the data table, use those labels
  # wherever possible; otherwise, use column names as the column labels
  if (any_labeled_columns_in_data_tbl(data = data)) {
    column_labels <- get_columns_labels_from_attrs(data = data)
  } else {
    column_labels <- vars
  }

  empty_list <- lapply(seq_along(vars), function(x) NULL)

  boxh_df <-
    vctrs::data_frame(
      # Matches to the name of the `data` column
      var = vars,
      # The mode of the column in the rendered table
      # - `default` appears as a column with values below
      # - `stub` appears as part of a table stub, set to the left
      #   and styled differently
      # - `row_group` uses categorical values and groups rows
      #   under row group headings
      # - `hidden` hides this column from the final table render
      #   but retains values to use in expressions
      # - `hidden_at_px` similar to hidden but takes a list of
      #   screen widths (in px) whereby the column would be hidden
      type = "default",
      # The presentation label, which is a list of labels by
      # render context (e.g., HTML, LaTeX, etc.)
      column_label = as.list(column_labels),
      # Units for the column label, written in a shorthand notation
      column_units = NA_character_,
      # A pattern to use when arranging the `column_label` and the
      # `column_units`
      column_pattern = NA_character_,
      # The alignment of the column ("left", "right", "center")
      column_align = "center",
      # The width of the column in `px`
      column_width = empty_list,
      # The widths at which the column disappears from view (this is
      # HTML specific)
      hidden_px = empty_list
    )

  dt_boxhead_set(boxh = boxh_df, data = data)
}

dt_boxhead_edit <- function(data, var, ...) {

  dt_boxhead <- dt_boxhead_get(data = data)

  var_name <- var

  val_list <- list(...)

  if (length(val_list) != 1) {
    cli::cli_abort("{.fn dt_boxhead_edit} expects a single value at `{cli::symbol$ellipsis}`.")
  }

  check_names_dt_boxhead_expr(expr = val_list)

  check_vars_dt_boxhead(var = var, dt_boxhead = dt_boxhead)

  col_row_num <- which(dt_boxhead$var == var_name)

  if (is.list(dt_boxhead[[names(val_list)]])) {
    dt_boxhead[[col_row_num, names(val_list)]] <- unname(val_list)
    # Fixup md() in column_label column
    # if a problem occurs. (preserve "from_markdown" class)
    if ("column_label" %in% names(val_list) &&
        is.list(dt_boxhead$column_label[[col_row_num]])) {
      # Remove one level of nesting
      dt_boxhead$column_label[[col_row_num]] <- dt_boxhead$column_label[[col_row_num]][[1]]
    }

  } else {
    dt_boxhead[[col_row_num, names(val_list)]] <- unlist(val_list)
  }

  dt_boxhead_set(data = data, boxh = dt_boxhead)
}

dt_boxhead_add_var <- function(
    data,
    var,
    type,
    column_label = list(var),
    column_units = NA_character_,
    column_pattern = NA_character_,
    column_align = "left",
    column_width = list(NULL),
    hidden_px = list(NULL),
    add_where = "top"
) {

  dt_boxhead <- dt_boxhead_get(data = data)

  dt_boxhead_row <-
    vctrs::data_frame(
      var = var,
      type = type,
      column_label = column_label,
      column_units = column_units,
      column_pattern = column_pattern,
      column_align = column_align,
      column_width = column_width,
      hidden_px = hidden_px
    )
  add_where <- rlang::arg_match0(add_where, c("top", "bottom"))

  if (add_where == "top") {
    dt_boxhead <- vctrs::vec_rbind(dt_boxhead_row, dt_boxhead)
  } else if (add_where == "bottom") {
    dt_boxhead <- vctrs::vec_rbind(dt_boxhead, dt_boxhead_row)
  }

  dt_boxhead_set(data = data, boxh = dt_boxhead)
}

dt_boxhead_set_hidden <- function(data, vars) {

  dt_boxhead <- dt_boxhead_get(data = data)

  dt_boxhead[which(dt_boxhead$var %in% vars & dt_boxhead$type != "stub"), "type"] <- "hidden"

  dt_boxhead_set(data = data, boxh = dt_boxhead)
}

dt_boxhead_set_not_hidden <- function(data, vars) {

  dt_boxhead <- dt_boxhead_get(data = data)

  dt_boxhead[which(dt_boxhead$var %in% vars & dt_boxhead$type != "stub"), "type"] <- "default"

  dt_boxhead_set(data = data, boxh = dt_boxhead)
}

dt_boxhead_set_stub <- function(data, var) {

  dt_boxhead <- dt_boxhead_get(data = data)

  dt_boxhead[which(dt_boxhead$var == var), "type"] <- "stub"
  dt_boxhead[which(dt_boxhead$var == var), "column_align"] <- "left"

  dt_boxhead_set(data = data, boxh = dt_boxhead)
}

dt_boxhead_set_row_group <- function(data, vars) {

  dt_boxhead <- dt_boxhead_get(data = data)

  dt_boxhead[which(dt_boxhead$var %in% vars), "type"] <- "row_group"
  dt_boxhead[which(dt_boxhead$var %in% vars), "column_align"] <- "left"

  dt_boxhead_set(data = data, boxh = dt_boxhead)
}

dt_boxhead_edit_column_label <- function(data, var, column_label) {

  dt_boxhead_edit(
    data = data,
    var = var,
    column_label = column_label
  )
}

dt_boxhead_edit_column_units <- function(data, var, column_units) {

  dt_boxhead_edit(
    data = data,
    var = var,
    column_units = column_units
  )
}

dt_boxhead_edit_column_pattern <- function(data, var, column_pattern) {

  dt_boxhead_edit(
    data = data,
    var = var,
    column_pattern = column_pattern
  )
}

dt_boxhead_get_vars <- function(data) {
  dt_boxhead_get(data = data)$var
}

dt_boxhead_get_vars_default <- function(data) {
  dat <- dt_boxhead_get(data = data)
  dat$var[dat$type == "default"]
}

dt_boxhead_get_var_stub <- function(data) {

  res <- dt_boxhead_get_var_by_type(data = data, type = "stub")
  # FIXME: don't return NA_character_ here, just return res or NULL
  if (length(res) == 0) {
    NA_character_
  } else {
    res
  }
}

dt_boxhead_get_vars_groups <- function(data) {

  res <- dt_boxhead_get_var_by_type(data = data, type = "row_group")
  # FIXME: don't return NA_character_ here, just return res or NULL
  if (length(res) == 0) {
    NA_character_
  } else {
    res
  }
}

dt_boxhead_get_alignments_in_stub <- function(data) {

  stub_layout <- get_stub_layout(data = data)
  alignments <- NULL

  if ("group_label" %in% stub_layout) {
    grp_vars <- dt_boxhead_get_vars_groups(data = data)
    # non-initialized grp_vars
      grp_alignment <-
        dt_boxhead_get_alignment_by_var(
          data = data,
          var = grp_vars
        )

    if (length(grp_vars) > 1) {
      grp_alignment <- grp_alignment[1]
    }

    alignments <- c(alignments, grp_alignment)
  }

  if ("rowname" %in% stub_layout) {
    row_alignment <- dt_boxhead_get_alignment_by_var(
      data = data,
      dt_boxhead_get_var_stub(data = data)
    )
    alignments <- c(alignments, row_alignment)
  }
  alignments
}

dt_boxhead_get_var_by_type <- function(data, type) {
  boxhead <- dt_boxhead_get(data = data)
  boxhead$var[boxhead$type == type]
}

dt_boxhead_get_vars_labels_default <- function(data) {
  boxhead <- dt_boxhead_get(data = data)
  unlist(boxhead$column_label[boxhead$type == "default"])
}

dt_boxhead_get_vars_align_default <- function(data) {
  boxhead <- dt_boxhead_get(data = data)
  boxhead$column_align[boxhead$type == "default"]
}

dt_boxhead_get_alignment_by_var <- function(data, var) {
  boxhead <- dt_boxhead_get(data = data)
  if (length(var) > 1L) {
    # return multiple alignments in case of multiple variables
    # requested. #1552
    return(
      boxhead$column_align[boxhead$var %in% var]
    )
  }
  boxhead$column_align[boxhead$var == var]
}

check_names_dt_boxhead_expr <- function(expr) {

  if (!all(names(expr) %in% c(
    "type", "column_label", "column_units", "column_pattern",
    "column_align", "column_width", "hidden_px"
  ))) {
    cli::cli_abort("Expressions must use names available in `dt_boxhead`.")
  }
}

check_vars_dt_boxhead <- function(var, dt_boxhead) {

  if (!(var %in% dt_boxhead$var)) {
    cli::cli_abort("The `var` value must be value in `dt_boxhead$var`.")
  }
}

dt_boxhead_build <- function(data, context) {

  boxh <- dt_boxhead_get(data = data)

  boxh$column_label <-
    lapply(boxh$column_label, function(label) process_text(label, context))

  # Merge column units into column labels
  if (!all(is.na(boxh$column_units))) {

    for (i in seq_along(boxh$column_label)) {

      if (is.na(boxh[["column_units"]][i])) next

      column_label <- unlist(boxh[["column_label"]][i])

      units <- boxh[["column_units"]][i]
      column_pattern <- boxh[["column_pattern"]][i]

      units_built <-
        render_units(
          define_units(units_notation = units),
          context = context
        )

      # rstudio/gt#1733
      if (
        !is.na(column_pattern) &&
        column_pattern == "" &&
        grepl(units, column_label, fixed = TRUE)
        ) {

        # With `column_pattern` equal to `""`, we can surmise that this was
        # set automatically by `cols_label()`; the mechanism now is to replace
        # the units text in the label with the 'built' units text

        column_label <- gsub(units, units_built, column_label, fixed = TRUE)

      } else {

        if (is.na(column_pattern)) {

          # Obtain the default `column_pattern` (which that is settable in the
          # `column_labels.units_pattern` option of `tab_options()`
          column_pattern <-
            dt_options_get_value(
              data = data,
              option = "column_labels_units_pattern"
            )
        }

        column_pattern <- gsub("{1}", column_label, column_pattern, fixed = TRUE)
        column_pattern <- gsub("{2}", units_built, column_pattern, fixed = TRUE)
        column_label <- column_pattern
      }

      boxh$column_label[i] <- list(column_label)
    }
  }

  dt_boxhead_set(data = data, boxh = boxh)
}

dt_boxhead_set_var_order <- function(data, vars) {

  boxh <- dt_boxhead_get(data = data)

  if (
    length(vars) != nrow(boxh) ||
    length(unique(vars)) != nrow(boxh) ||
    !all(vars %in% boxh$var)
  ) {
    cli::cli_abort("The length of `vars` must equal the row count of `_boxh`.")
  }

  order_vars <- vapply(vars, function(x) {which(boxh$var == x)}, numeric(1))

  boxh <- boxh[order_vars, ]

  dt_boxhead_set(data = data, boxh = boxh)
}
