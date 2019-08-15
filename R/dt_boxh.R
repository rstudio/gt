.dt_boxh_key <- "_boxh"

dt_boxh_get <- function(data) {

  attr(data, .dt_boxh_key, exact = TRUE)
}

dt_boxh_set <- function(data, boxh) {

  attr(data, .dt_boxh_key) <- boxh
  data
}

dt_boxh_init <- function(data) {

  empty_list <- lapply(seq_along(names(data)), function(x) NULL)

  dplyr::tibble(
    # Matches to the name of the `data` column
    var = names(data),
    # The mode of the column in the rendered table
    # - `default` appears as a column with values below
    # - `stub` appears as part of a table stub, set to the left
    #   and styled differently
    # - `row_group` uses values as categoricals and groups rows
    #   under row group headings
    # - `hidden` hides this column from the final table render
    #   but retains values to use in expressions
    # - `hidden_at_px` similar to hidden but takes a list of
    #   screen widths (in px) whereby the column would be hidden
    type = "default",
    # # The shared spanner label between columns, where column names
    # # act as the keys
    # spanner_label = empty_list,
    # # The label for row groups, which is maintained as a list of
    # # labels by render context (e.g., HTML, LaTeX, etc.)
    # row_group_label = lapply(seq_along(names(data)), function(x) NULL),
    # The presentation label, which is a list of labels by
    # render context (e.g., HTML, LaTeX, etc.)
    column_label = empty_list,
    # The alignment of the column ("left", "right", "center")
    column_align = NA_character_,
    # The width of the column in `px`
    column_width = empty_list,
    # The widths at which the column disappears from view (this is
    # HTML specific)
    hidden_px = empty_list
  ) %>%
    dt_boxh_set(boxh = ., data = data)
}

dt_boxh_edit <- function(data, var, ...) {

  dt_boxh <-
    data %>%
    dt_boxh_get()

  var_name <- var

  val_list <- list(...)

  check_names_dt_boxh_expr(val_list)

  check_vars_dt_boxh(var, dt_boxh)

  dt_boxh[which(dt_boxh$var == var_name), names(val_list)] <-
    dplyr::as_tibble(val_list)

  dt_boxh %>%
    dt_boxh_set(boxh = ., data = data)
}

check_names_dt_boxh_expr <- function(expr) {

  if (!all(names(expr) %in% c(
    "type", "column_label", "column_align", "column_width", "hidden_px"
  ))) {
    stop("Expressions must use names available in `dt_boxh`.",
         call. = FALSE)
  }
}

check_vars_dt_boxh <- function(var, dt_boxh) {

  if (!(var %in% dt_boxh$var)) {
    stop("The `var` value must be value in `dt_boxh$var`.",
         call. = FALSE)
  }
}
