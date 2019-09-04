.dt_boxhead_key <- "_boxhead"

dt_boxhead_get <- function(data) {

  attr(data, .dt_boxhead_key, exact = TRUE)
}

dt_boxhead_set <- function(data, boxh) {

  attr(data, .dt_boxhead_key) <- boxh
  data
}

dt_boxhead_init <- function(data) {

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
    column_label = as.list(names(data)),
    # The alignment of the column ("left", "right", "center")
    column_align = "center",
    # The width of the column in `px`
    column_width = empty_list,
    # The widths at which the column disappears from view (this is
    # HTML specific)
    hidden_px = empty_list
  ) %>%
    dt_boxhead_set(boxh = ., data = data)
}

dt_boxhead_edit <- function(data, var, ...) {

  dt_boxhead <-
    data %>%
    dt_boxhead_get()

  var_name <- var

  val_list <- list(...)

  check_names_dt_boxhead_expr(val_list)

  check_vars_dt_boxhead(var, dt_boxhead)

  dt_boxhead[which(dt_boxhead$var == var_name), names(val_list)] <-
    dplyr::as_tibble(val_list)

  dt_boxhead %>%
    dt_boxhead_set(boxh = ., data = data)
}

dt_boxhead_edit_column_label <- function(data, var, column_label) {

  dt_boxhead_edit(data, var, column_label = list(column_label))
}

dt_boxhead_get_vars <- function(data) {

  data %>%
    dt_boxhead_get() %>%
    magrittr::extract2("var")
}

dt_boxhead_get_vars_default <- function(data) {

  data %>%
    dt_boxhead_get() %>%
    dplyr::filter(type == "default") %>%
    magrittr::extract2("var")
}

dt_boxhead_get_vars_labels_default <- function(data) {

  data %>%
    dt_boxhead_get() %>%
    dplyr::filter(type == "default") %>%
    magrittr::extract2("column_label") %>%
    unlist()
}

check_names_dt_boxhead_expr <- function(expr) {

  if (!all(names(expr) %in% c(
    "type", "column_label", "column_align", "column_width", "hidden_px"
  ))) {
    stop("Expressions must use names available in `dt_boxhead`.",
         call. = FALSE)
  }
}

check_vars_dt_boxhead <- function(var, dt_boxhead) {

  if (!(var %in% dt_boxhead$var)) {
    stop("The `var` value must be value in `dt_boxhead$var`.",
         call. = FALSE)
  }
}

dt_boxhead_build <- function(data, context) {

  boxh <- dt_boxhead_get(data)

  boxh$column_label <-
    lapply(boxh$column_label, function(label) process_text(label, context))

  data <- dt_boxhead_set(data = data, boxh = boxh)

  data
}

dt_boxhead_set_var_order <- function(data, vars) {

  boxh <- dt_boxhead_get(data)

  if (length(vars) != nrow(boxh) ||
      length(unique(vars)) != nrow(boxh) ||
      !all(vars %in% boxh$var)
      ) {
    stop("The length of `vars` must be the same the number of rows in `_boxh.")
  }

  order_vars <- vapply(vars, function(x) {which(boxh$var == x)}, numeric(1))

  boxh <- boxh[order_vars, ]

  data <- dt_boxhead_set(data = data, boxh = boxh)

  data
}
