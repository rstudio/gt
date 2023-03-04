#' Perform text transformations with a custom function
#'
#' @param data A table object that is created using the [gt()] function.
#' @param fn The function to use for text transformation.
#' @param locations The cell or set of cells to be associated with the text
#'   transformation. Only the [cells_body()], [cells_stub()],
#'   [cells_column_labels()], and [cells_row_groups()] helper functions can be
#'   used here. We can enclose several of these calls within a `list()` if we
#'   wish to make the transformation happen at different locations.
#'
#' @return An object of class `gt_tbl`.
#'
#' @section Examples:
#'
#' Use [`exibble`] to create a **gt** table. Transform the formatted text in the
#' `num` column using a function supplied to `text_transform()` (via the `fn`
#' argument). Note that the `x` in the `fn = function (x)` part is an already
#' formatted vector of column values from the `num` column.
#'
#' ```r
#' exibble |>
#'   dplyr::select(num, char, currency) |>
#'   dplyr::slice(1:4) |>
#'   gt() |>
#'   fmt_number(columns = num) |>
#'   fmt_currency(columns = currency) |>
#'   text_transform(
#'     fn = function(x) {
#'       paste0(
#'         x, " (",
#'         dplyr::case_when(
#'           x > 20  ~ "large",
#'           x <= 20 ~ "small"),
#'         ")"
#'         )
#'     },
#'     locations = cells_body(columns = num)
#'   )
#' ```
#'
#' \if{html}{\out{
#' `r man_get_image_tag(file = "man_text_transform_1.png")`
#' }}
#'
#' @family text transforming functions
#' @section Function ID:
#' 4-1
#'
#' @section Function Introduced:
#' `v0.2.0.5` (March 31, 2020)
#'
#' @export
text_transform <- function(
    data,
    fn,
    locations = cells_body()
) {

  # Perform input object validation
  stop_if_not_gt_tbl(data = data)

  # Resolve into a list of locations
  locations <- as_locations(locations = locations)

  # For all of the resolved locations, store the transforms
  # for later execution
  for (loc in locations) {
    data <- dt_transforms_add(data = data, loc = loc, fn = fn)
  }

  data
}

#' Perform highly targeted text replacement with a regex pattern
#'
#' @param data A table object that is created using the [gt()] function.
#' @param pattern A regex pattern used to target text fragments in the cells
#'   resolved in locations.
#' @param replacement The replacement text for any matched text fragments.
#' @param locations The cell or set of cells to be associated with the text
#'   transformation. Only the [cells_body()], [cells_stub()],
#'   [cells_column_labels()], and [cells_row_groups()] helper functions can be
#'   used here. We can enclose several of these calls within a `list()` if we
#'   wish to make the transformation happen at different locations.
#'
#' @family text transforming functions
#' @section Function ID:
#' 4-2
#'
#' @section Function Introduced:
#' *In Development*
#'
#' @export
text_replace <- function(
    data,
    pattern,
    replacement,
    locations = cells_body()
) {

  # Perform input object validation
  stop_if_not_gt_tbl(data = data)

  text_transform(
    data = data,
    locations = locations,
    fn = function(x) {
      str_complete_replace(x, pattern = pattern, replacement = replacement)
    }
  )
}

#' Perform whole text replacements using a case-when expression approach
#'
#' @param .data A table object that is created using the [gt()] function.
#' @param ... A sequence of two-sided formulas. The left hand side (LHS)
#'   determines which values match this case. The right hand side (RHS) provides
#'   the replacement text (it must resolve to a value of the `character` class).
#'   The LHS inputs must evaluate to logical vectors.
#' @param .default The replacement text to use when cell values aren't matched
#'   by any of the LHS inputs. If `NULL`, the default, no replacement text will
#'   be used.
#' @param .locations The cell or set of cells to be associated with the text
#'   transformation. Only the [cells_body()], [cells_stub()],
#'   [cells_column_labels()], and [cells_row_groups()] helper functions can be
#'   used here. We can enclose several of these calls within a `list()` if we
#'   wish to make the transformation happen at different locations.
#'
#' @family text transforming functions
#' @section Function ID:
#' 4-3
#'
#' @section Function Introduced:
#' *In Development*
#'
#' @import rlang
#' @export
text_case_when <- function(
    .data,
    ...,
    .default = NULL,
    .locations = cells_body()
) {

  # Perform input object validation
  stop_if_not_gt_tbl(data = .data)

  x_list <- list(...)

  # TODO: perform some basic checking of `x_list` and stop function
  # should issues arise; the RHS should always be `character`-based

  # TODO: check that the modernized version of the `case_when()`
  # function is available in the user's version of dplyr

  text_transform(
    data = .data,
    locations = .locations,
    fn = function(x) {

      # Don't accept that `.default = NULL` should mean `NA`,
      # it should simply return the original data
      if (is.null(.default)) {
        .default <- x
      }

      # Need to coerce all RHS formula parts to character;
      # this ensure that objects that have classes that include
      # a character base class (like fontawesome icons) become
      # stripped of other classes and acceptable input for
      # the `case_match()` function
      for (i in seq_along(x_list)) {

        x_list[[i]] <- rlang::set_env(x_list[[i]])

        rhs <- rlang::f_rhs(x_list[[i]])

        rhs_char <- as.character(rlang::eval_tidy(rhs))

        x_list[[i]] <-
          rlang::new_formula(
            lhs = rlang::f_lhs(x_list[[i]]),
            rhs = rhs_char
          )
      }

      dplyr::case_when(!!!x_list, .default = .default)
    }
  )
}

#' Perform whole text replacements which complete matches
#'
#' @param .data A table object that is created using the [gt()] function.
#' @param ... A sequence of two-sided formulas matching this general
#'   construction: `old_text` ~ `new_text`. The left hand side (LHS) determines
#'   which values to match on and it can be any length (allowing for `new_text`
#'   to replace different values of `old_text`). The right hand side (RHS)
#'   provides the replacement text (it must resolve to a single value of the
#'   `character` class).
#' @param .default The replacement text to use when cell values aren't matched
#'   by any of the LHS inputs. If `NULL`, the default, no replacement text will
#'   be used.
#' @param .replace A choice in how the matching is to be done. The default
#'   `"all"` means that the `old_text` (on the LHS of formulas given in `...`)
#'   must match the cell text *completely*. With that option, the replacement
#'   will completely replace that matched text. With `"partial"`, the match will
#'   occur in all substrings of `old_text`. In this way, the replacements will
#'   act on those matched substrings.
#' @param .locations The cell or set of cells to be associated with the text
#'   transformation. Only the [cells_body()], [cells_stub()],
#'   [cells_column_labels()], and [cells_row_groups()] helper functions can be
#'   used here. We can enclose several of these calls within a `list()` if we
#'   wish to make the transformation happen at different locations.
#'
#' @family text transforming functions
#' @section Function ID:
#' 4-4
#'
#' @section Function Introduced:
#' *In Development*
#'
#' @import rlang
#' @export
text_case_match <- function(
    .data,
    ...,
    .default = NULL,
    .replace = c("all", "partial"),
    .locations = cells_body()
) {

  # Perform input object validation
  stop_if_not_gt_tbl(data = .data)

  # Ensure that arguments are matched
  .replace <- rlang::arg_match(.replace)

  x_list <- list(...)

  # TODO: perform some basic checking of `...` and stop function
  # should issues arise

  # TODO: check that the `case_match()` function is available in
  # the user's version of dplyr

  text_transform(
    data = .data,
    locations = .locations,
    fn = function(x) {

      # Don't accept that `.default = NULL` should mean `NA`,
      # it should simply return the original data
      if (is.null(.default)) {
        .default <- x
      }

      # Need to coerce all RHS formula parts to character;
      # this ensure that objects that have classes that include
      # a character base class (like fontawesome icons) become
      # stripped of other classes and acceptable input for
      # the `case_match()` function
      for (i in seq_along(x_list)) {

        x_list[[i]] <- rlang::set_env(x_list[[i]])

        rhs <- rlang::f_rhs(x_list[[i]])

        rhs_char <- as.character(rlang::eval_tidy(rhs))

        x_list[[i]] <-
          rlang::new_formula(
            lhs = rlang::f_lhs(x_list[[i]]),
            rhs = rhs_char
          )
      }

      if (.replace == "all") {

        x <- dplyr::case_match(.x = x, !!!x_list, .default = .default)

      } else {

        for (i in seq_along(x_list)) {

          pattern <- rlang::eval_tidy(rlang::f_lhs(x_list[[i]]))

          for (j in seq_along(pattern)) {

            x <-
              gsub(
                pattern[j],
                rlang::f_rhs(x_list[[i]]),
                x,
                fixed = TRUE
              )
          }
        }
      }

      x
    }
  )
}

# Given a location, gt attr object, and mapping function (one chr vector as
# input, chr vector of same length as output), replace the contents in the
# specified location with fn(contents). The `fn` may be invoked several times,
# as the location may not be naturally vectorizable as a single call. The return
# value is the transformed `data`
text_transform_at_location <- function(loc, data, fn = identity) {
  UseMethod("text_transform_at_location")
}

text_transform_at_location.cells_body <- function(
    loc,
    data,
    fn = identity
) {

  body <- dt_body_get(data = data)

  loc <- to_output_location(loc = loc, data = data)

  stub_df <- dt_stub_df_get(data = data)

  # Do one vectorized operation per column
  for (col in loc$colnames) {

    if (col %in% colnames(body)) {

      body[[col]][stub_df$rownum_i %in% loc$rows] <-
        fn(body[[col]][stub_df$rownum_i %in% loc$rows])
    }
  }

  dt_body_set(data = data, body = body)
}

text_transform_at_location.cells_stub <- function(
    loc,
    data,
    fn = identity
) {

  body <- dt_body_get(data = data)

  loc <- to_output_location(loc = loc, data = data)

  stub_df <- dt_stub_df_get(data = data)

  stub_var <- dt_boxhead_get_var_stub(data = data)

  # FIXME: Check for zero-length stub_var before continuing.
  body[[stub_var]][stub_df$rownum_i %in% loc$rows] <-
    fn(body[[stub_var]][stub_df$rownum_i %in% loc$rows])

  dt_body_set(data = data, body = body)
}

text_transform_at_location.cells_column_labels <- function(
    loc,
    data,
    fn = identity
) {

  boxh <- dt_boxhead_get(data = data)

  loc <- to_output_location(loc = loc, data = data)

  for (col in loc$colnames) {

    if (col %in% boxh$var) {

      column_label_edited <-
        fn(dplyr::filter(boxh, var == .env$col)[1, "column_label", drop = TRUE])

      data <-
        dt_boxhead_edit(
          data = data,
          var = col,
          column_label = list(column_label_edited)
        )
    }
  }

  data
}

text_transform_at_location.cells_row_groups <- function(
    loc,
    data,
    fn = identity
) {

  row_group_vec <- dt_row_groups_get(data = data)

  loc <- to_output_location(loc = loc, data = data)

  for (group in loc$groups) {

    stub_df <- dt_stub_df_get(data = data)

    if (group %in% row_group_vec) {

      if (is.na(group)) next

      stub_df[!is.na(stub_df$group_id) & stub_df$group_id == group, ][["group_label"]] <-
        as.list(fn(stub_df[!is.na(stub_df$group_id) & stub_df$group_id == group, ][["group_label"]]))

      data <- dt_stub_df_set(data = data, stub_df = stub_df)
    }
  }

  data
}
