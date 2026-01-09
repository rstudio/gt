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


# text_replace() ---------------------------------------------------------------
#' Perform highly targeted text replacement with a regex pattern
#'
#' @description
#'
#' `text_replace()` provides a specialized interface for replacing text
#' fragments in table cells with literal text. You need to ensure that you're
#' targeting the appropriate cells with the `locations` argument. Once that is
#' done, the remaining two values to supply are the regex pattern (`pattern`)
#' and the replacement for all matched text (`replacement`).
#'
#' @param pattern *Regex pattern to match with*
#'
#'   `scalar<character>` // **required**
#'
#'   A regex pattern used to target text fragments in the cells resolved in
#'   locations.
#'
#' @param replacement *Replacement text*
#'
#'   `scalar<character>` // **required**
#'
#'   The replacement text for any matched text fragments.
#'
#' @inheritParams text_transform
#'
#' @return An object of class `gt_tbl`.
#'
#' @section Examples:
#'
#' Use the [`metro`] dataset to create a **gt** table. With [cols_merge()],
#' we'll merge the `name` and `caption` columns together but only if `caption`
#' doesn't have an `NA` value (the special `pattern` syntax of `"{1}<<({2})>>"`
#' takes care of this). This merged content is now part of the `name` column.
#' We'd like to modify this further wherever there is text in parentheses:
#' (1) make that text italicized, and (2) introduce a line break before the text
#' in parentheses. We can do this with `text_replace()`. The `pattern` value of
#' `"\\((.*?)\\)"` will match on text between parentheses, and the inner
#' `"(.*?)"` is a capture group. The `replacement` value of
#' `"<br>(<em>\\1</em>)"` puts the capture group text `"\\1"` within `<em>`
#' tags, wraps literal parentheses around it, and prepends a line break tag.
#'
#' ```r
#' metro |>
#'   dplyr::select(name, caption, lines) |>
#'   dplyr::slice(110:120) |>
#'   gt() |>
#'   cols_merge(
#'     columns = c(name, caption),
#'     pattern = "{1}<< ({2})>>"
#'   ) |>
#'   text_replace(
#'     locations = cells_body(columns = name),
#'     pattern = "\\((.*?)\\)",
#'     replacement = "<br>(<em>\\1</em>)"
#'   )
#' ```
#'
#' \if{html}{\out{
#' `r man_get_image_tag(file = "man_text_replace_1.png")`
#' }}
#'
#' @family text transforming functions
#' @section Function ID:
#' 4-1
#'
#' @section Function Introduced:
#' `v0.9.0` (Mar 31, 2023)
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

  # Validate input
  check_string(pattern, allow_empty = FALSE, allow_na = TRUE)
  check_string(replacement, allow_empty = TRUE, allow_na = FALSE)

  text_transform_impl(
    data = data,
    locations = locations,
    fn = function(x) {
      gsub(pattern = pattern, replacement = replacement, x, perl = TRUE)
    }
  )
}

# text_case_when() -------------------------------------------------------------
#' Perform whole text replacements using a 'case-when'-expression approach
#'
#' @description
#'
#' `text_case_when()` provides a useful interface for a case-by-case approach to
#' replacing entire table cells. First off, you have to make sure you're
#' targeting the appropriate cells with the `.locations` argument. Following
#' that, you supply a sequence of two-sided formulas matching of the general
#' form: `<logical_stmt> ~ <new_text>`. In the left hand side (LHS) there should
#' be a predicate statement that evaluates to a logical vector of length one
#' (i.e., either `TRUE` or `FALSE`). To refer to the values undergoing
#' transformation, you need to use the `x` variable.
#'
#' @param ... *Matching expressions*
#'
#'   `<multiple expressions>` // **required**
#'
#'   A sequence of two-sided formulas. The left hand side (LHS)
#'   determines which values match this case. The right hand side (RHS) provides
#'   the replacement text (it must resolve to a value of the `character` class).
#'   The LHS inputs must evaluate to logical vectors.
#'
#' @param .default *Default replacement text*
#'
#'   `scalar<character>` // *default:* `NULL` (`optional`)
#'
#'   The replacement text to use when cell values aren't matched by any of the
#'   LHS inputs. If `NULL`, the default, no replacement text will be used.
#'
#' @inheritParams text_transform
#'
#' @return An object of class `gt_tbl`.
#'
#' @section Examples:
#'
#' Use a portion of the [`metro`] dataset to create a **gt** table. We'll use
#' `text_case_when()` to supply pairs of predicate statements and replacement
#' text. For the `connect_rer` column, we will perform a count of pattern
#' matches with `stringr::str_count()` and determine which cells have 1, 2, or 3
#' matched patterns. For each of these cases, descriptive replacement text is
#' provided. Here, we use a `.default` value to replace the non-matched
#' cases with an empty string (`""`). Finally, we use [cols_label()] to modify
#' the labels of the three columns.
#'
#' ```r
#' metro |>
#'   dplyr::slice_max(passengers, n = 10) |>
#'   dplyr::select(name, lines, connect_rer) |>
#'   gt() |>
#'   text_case_when(
#'     stringr::str_count(x, pattern = "[ABCDE]") == 1 ~ "One connection.",
#'     stringr::str_count(x, pattern = "[ABCDE]") == 2 ~ "Two connections.",
#'     stringr::str_count(x, pattern = "[ABCDE]") == 3 ~ "Three connections.",
#'     .default = "", .locations = cells_body(columns = connect_rer)
#'   ) |>
#'   cols_label(
#'     name = "Station",
#'     lines = "Lines Serviced",
#'     connect_rer = "RER Connections"
#'   )
#' ```
#'
#' \if{html}{\out{
#' `r man_get_image_tag(file = "man_text_case_when_1.png")`
#' }}
#'
#' @family text transforming functions
#' @section Function ID:
#' 4-2
#'
#' @section Function Introduced:
#' `v0.9.0` (Mar 31, 2023)
#'
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

  text_transform_impl(
    data = .data,
    locations = .locations,
    fn = function(x) {

      # Don't accept that `.default = NULL` should mean `NA`,
      # it should simply return the original data
      .default <- .default %||% x

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

# text_case_match() ------------------------------------------------------------
#' Perform whole or partial text replacements with a 'switch'-like approach
#'
#' @description
#'
#' `text_case_match()` provides a useful interface for a approach to replacing
#' table cells that behaves much like a switch statement. The targeting of cell
#' for transformation happens with the `.locations` argument. Once overall
#' targeting is handled, you need to supply a sequence of two-sided formulas
#' matching of the general form: `<vector_old_text> ~ <new_text>`. In the left
#' hand side (LHS) there should be a character vector containing strings to
#' match on. The right hand side (RHS) should contain a single string (or
#' something coercible to a length one character vector). There's also the
#' `.replace` argument that changes the matching and replacing behavior. By
#' default, `text_case_match()` will try to match on entire strings and replace
#' those strings. This can be changed to a partial matching and replacement
#' strategy with the alternate option.
#'
#' @inheritParams text_transform
#'
#' @param ... *Matching expressions*
#'
#'   `<multiple expressions>` // **required**
#'
#'   A sequence of two-sided formulas matching this general construction:
#'   `<old_text> ~ <new_text>`. The left hand side (LHS) determines which values
#'   to match on and it can be any length (allowing for `new_text` to replace
#'   different values of `old_text`). The right hand side (RHS) provides the
#'   replacement text (it must resolve to a single value of the `character`
#'   class).
#'
#' @inheritParams text_case_when
#'
#' @param .replace *Method for text replacement*
#'
#'   `singl-kw:[all|partial]` // *default:* `"all"`
#'
#'   A choice in how the matching is to be done. The default `"all"` means that
#'   the `old_text` (on the LHS of formulas given in `...`) must match the cell
#'   text *completely*. With that option, the replacement will completely
#'   replace that matched text. With `"partial"`, the match will occur in all
#'   substrings of `old_text`. In this way, the replacements will act on those
#'   matched substrings.
#'
#'
#' @return An object of class `gt_tbl`.
#'
#' @section Examples:
#'
#' Let's use the [`exibble`] dataset to create a simple, two-column **gt** table
#' (keeping only the `char` and `fctr` columns). In the `char` column, we'll
#' transform the `NA` value to `"elderberry"` using the `text_case_match()`
#' function. Over in the `fctr` column, some more sophisticated matches will be
#' performed using `text_case_match()`. That column has spelled out numbers and
#' we can produce these on the LHS with help from [vec_fmt_spelled_num()].
#' The replacements will contain descriptive text. In this last call of
#' `text_case_match()`, we use a `.default` to replace text for any of those
#' non-matched cases.
#'
#' ```r
#' exibble |>
#'   dplyr::select(char, fctr) |>
#'   gt() |>
#'   text_case_match(
#'     NA ~ "elderberry",
#'     .locations = cells_body(columns = char)
#'   ) |>
#'   text_case_match(
#'     vec_fmt_spelled_num(1:4) ~ "one to four",
#'     vec_fmt_spelled_num(5:6) ~ "five or six",
#'     .default = "seven or more",
#'     .locations = cells_body(columns = fctr)
#'   )
#' ```
#'
#' \if{html}{\out{
#' `r man_get_image_tag(file = "man_text_case_match_1.png")`
#' }}
#'
#' Next, let's use a transformed version of the [`towny`] dataset to create a
#' **gt** table. Transform the text in the `csd_type` column using two-sided
#' formulas supplied to `text_case_match()`. We can replace matches on the LHS
#' with Fontawesome icons furnished by the **fontawesome** R package.
#'
#' ```r
#' towny |>
#'   dplyr::select(name, csd_type, population_2021) |>
#'   dplyr::filter(csd_type %in% c("city", "town")) |>
#'   dplyr::slice_max(population_2021, n = 5, by = csd_type) |>
#'   dplyr::arrange(csd_type) |>
#'   gt() |>
#'   fmt_integer() |>
#'   text_case_match(
#'     "city" ~ fontawesome::fa("city"),
#'     "town" ~ fontawesome::fa("house-chimney")
#'   ) |>
#'   cols_label(
#'     name = "City/Town",
#'     csd_type = "",
#'     population_2021 = "Population"
#'   )
#' ```
#'
#' \if{html}{\out{
#' `r man_get_image_tag(file = "man_text_case_match_2.png")`
#' }}
#'
#' @family text transforming functions
#' @section Function ID:
#' 4-3
#'
#' @section Function Introduced:
#' `v0.9.0` (Mar 31, 2023)
#'
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
  .replace <- rlang::arg_match0(.replace, values = c("all", "partial"))

  x_list <- list(...)

  # TODO: perform some basic checking of `...` and stop function
  # should issues arise

  # We rely on dplyr 1.1 (where `case_match()` was introduced)

  text_transform_impl(
    data = .data,
    locations = .locations,
    fn = function(x) {

      # Don't accept that `.default = NULL` should mean `NA`,
      # it should simply return the original data
      .default <- .default %||% x

      # Need to coerce all RHS formula parts to character;
      # this ensure that objects that have classes that include
      # a character base class (like fontawesome icons) become
      # stripped of other classes and acceptable input for
      # the `case_match()` function
      # See https://github.com/r-lib/vctrs/issues/1622 for vctrs::vec_case_match
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

        x <- dplyr::case_match(.x = unlist(x), !!!x_list, .default = unlist(.default))

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

# text_transform() -------------------------------------------------------------
#' Perform text transformations with a custom function
#'
#' @description
#'
#' Text transforming in **gt** is the act of modifying formatted strings in
#' targeted cells. `text_transform()` provides the most flexibility of all the
#' `text_*()` functions in their family of functions. With it, you target the
#' cells to undergo modification in the `locations` argument while also
#' supplying a function to the `fn` argument. The function given to `fn` should
#' ideally at the very least take `x` as an input (it stands for the character
#' vector that is essentially the targeted cells) and return a character vector
#' of the same length as the input. Using the construction `function(x) { .. }`
#' for the function is recommended.
#'
#' @inheritParams fmt_number
#'
#' @param fn *Function for text transformation*
#'
#'   `<function>` // **required**
#'
#'   The function to use for text transformation. It should include `x` as an
#'   argument and return a character vector of the same length as the input `x`.
#'
#' @param locations *Locations to target*
#'
#'   [`<locations expressions>`][location-helper] // *default:* `cells_body()`
#'
#'   The cell or set of cells to be associated with the text transformation.
#'   Only [cells_column_spanners()], [cells_column_labels()],
#'    [cells_row_groups()], [cells_stub()], and [cells_body()] can
#'   be used here. We can enclose several of these calls within a `list()` if we
#'   wish to make the transformation happen at different locations.
#'
#' @return An object of class `gt_tbl`.
#'
#' @section Examples:
#'
#' Use a subset of the [`sp500`] dataset to create a **gt** table. Transform the
#' text in the `date` column using a function supplied to `text_transform()`
#' (via the `fn` argument). Note that the `x` in the `fn = function (x)` part
#' consists entirely of ISO 8601 date strings (which are acceptable as input to
#' [vec_fmt_date()] and [vec_fmt_datetime()]).
#'
#' ```r
#' sp500 |>
#'   dplyr::slice_head(n = 10) |>
#'   dplyr::select(date, open, close) |>
#'   dplyr::arrange(-dplyr::row_number()) |>
#'   gt() |>
#'   fmt_currency() |>
#'   text_transform(
#'     fn = function(x) {
#'       paste0(
#'         "<strong>",
#'         vec_fmt_date(x, date_style = "m_day_year"),
#'         "</strong>",
#'         "&mdash;W",
#'         vec_fmt_datetime(x, format = "w")
#'       )
#'     },
#'     locations = cells_body(columns = date)
#'   ) |>
#'   cols_label(
#'     date = "Date and Week",
#'     open = "Opening Price",
#'     close = "Closing Price"
#'   )
#' ```
#'
#' \if{html}{\out{
#' `r man_get_image_tag(file = "man_text_transform_1.png")`
#' }}
#'
#' Let's use a summarized version of the [`gtcars`] dataset to create a **gt**
#' table. First, the numeric values in the `n` column are formatted as
#' spelled-out numbers with [fmt_spelled_num()]. The output values are indeed
#' spelled out but exclusively with lowercase letters. We actually want these
#' words to begin with a capital letter and end with a period. To make this
#' possible, `text_transform()` will be used since it can modify
#' already-formatted text. Through the `fn` argument, we provide a custom
#' function that uses R's `toTitleCase()` operating on `x` (the numbers-as-text
#' strings) within `paste0()` so that a period can be properly placed.
#'
#' ```r
#' gtcars |>
#'   dplyr::filter(ctry_origin %in% c("Germany", "Italy", "Japan")) |>
#'   dplyr::count(mfr, ctry_origin, sort = TRUE) |>
#'   dplyr::arrange(ctry_origin) |>
#'   gt(rowname_col = "mfr", groupname_col = "ctry_origin") |>
#'   cols_label(n = "No. of Entries") |>
#'   tab_stub_indent(rows = everything(), indent = 2) |>
#'   cols_align(align = "center", columns = n) |>
#'   fmt_spelled_num() |>
#'   text_transform(
#'     fn = function(x) {
#'       paste0(tools::toTitleCase(x), ".")
#'     },
#'     locations = cells_body(columns = n)
#'   )
#' ```
#'
#' \if{html}{\out{
#' `r man_get_image_tag(file = "man_text_transform_2.png")`
#' }}
#'
#' There may be occasions where you'd want to remove all text. Here in this
#' example based on the [`pizzaplace`] dataset, we generate a **gt** table that
#' summarizes an entire year of data by colorizing the daily sales revenue.
#' Individual cell values are not needed here (since the encoding by color
#' suffices), so, `text_transform()` is used to turn every value to an empty
#' string: `""`.
#'
#' ```r
#' pizzaplace |>
#'   dplyr::group_by(date) |>
#'   dplyr::summarize(rev = sum(price)) |>
#'   dplyr::ungroup() |>
#'   dplyr::mutate(
#'     month = lubridate::month(date, label = TRUE),
#'     day_num = lubridate::mday(date)
#'   ) |>
#'   dplyr::select(-date) |>
#'   tidyr::pivot_wider(names_from = month, values_from = rev) |>
#'   gt(rowname_col = "day_num") |>
#'   data_color(
#'     method = "numeric",
#'     palette = "wesanderson::Zissou1",
#'     na_color = "white"
#'   ) |>
#'   text_transform(
#'     fn = function(x) "",
#'     locations = cells_body()
#'   ) |>
#'   opt_table_lines(extent = "none") |>
#'   opt_all_caps() |>
#'   cols_width(everything() ~ px(35)) |>
#'   cols_align(align = "center")
#' ```
#'
#' \if{html}{\out{
#' `r man_get_image_tag(file = "man_text_transform_3.png")`
#' }}
#'
#' @family text transforming functions
#' @section Function ID:
#' 4-4
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
  rlang::check_required(fn)

  text_transform_impl(
    data,
    fn,
    locations
  )
}

# Helper function to create text_*()
text_transform_impl <- function(data, fn, locations, call = rlang::caller_env()) {

  # Resolve into a list of locations
  locations <- as_locations(locations = locations)

  # For all of the resolved locations, store the transforms
  # for later execution
  for (loc in locations) {
    withCallingHandlers(
      # Personalize call if text_case_match() or other.
      data <- dt_transforms_add(data = data, loc = loc, fn = fn),
      error = function(e) {
        cli::cli_abort("Failed to resolve location.", parent = e, call = call)
      })
  }

  data
}


# Given a location, gt attr object, and mapping function (one chr vector as
# input, chr vector of same length as output), replace the contents in the
# specified location with fn(contents). The `fn` may be invoked several times,
# as the location may not be naturally vectorizable as a single call. The return
# value is the transformed `data`
text_transform_at_location <- function(loc, data, fn = identity) {
  UseMethod("text_transform_at_location")
}

# Text transformation using `cells_body()` ---
#' @export
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

# Text transformation using `cells_stub()` ---
#' @export
text_transform_at_location.cells_stub <- function(
    loc,
    data,
    fn = identity
) {

  body <- dt_body_get(data = data)

  loc <- to_output_location(loc = loc, data = data)

  stub_df <- dt_stub_df_get(data = data)

  stub_vars <- dt_boxhead_get_var_stub(data = data)

  # Handle case where no stub exists
  if (all(is.na(stub_vars))) {
    return(data)
  }

  # Get resolved columns (if any were specified)
  target_columns <- if (length(loc$columns) > 0) {
    intersect(loc$columns, stub_vars)
  } else {
    stub_vars  # Apply to all stub columns if none specified
  }

  # Apply transformation to each specified stub column
  for (stub_var in target_columns) {
    if (stub_var %in% colnames(body)) {
      body[[stub_var]][stub_df$rownum_i %in% loc$rows] <-
        fn(body[[stub_var]][stub_df$rownum_i %in% loc$rows])
    }
  }

  dt_body_set(data = data, body = body)
}

# Text transformation using `cells_column_labels()` ---
#' @export
text_transform_at_location.cells_column_labels <- function(
    loc,
    data,
    fn = identity
) {

  boxh <- dt_boxhead_get(data = data)

  loc <- to_output_location(loc = loc, data = data)

  for (col in loc$colnames) {

    if (col %in% boxh$var) {
      # Retrieve the original column label
      original_col_label <-
        vctrs::vec_slice(boxh$column_label, boxh$var == col)[[1]]
      column_label_edited <- fn(original_col_label)

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

# Text transformation using `cells_column_spanners()` ---
#' @export
text_transform_at_location.cells_column_spanners <- function(
    loc,
    data,
    fn = identity
) {

  spanners_df <- dt_spanners_get(data = data)

  spanner_id_vec <- spanners_df[["spanner_id"]]

  loc <- to_output_location(loc = loc, data = data)

  for (spanner in loc$spanners) {

    if (spanner %in% spanner_id_vec) {

      spanners_df[spanners_df[["spanner_id"]] == spanner, ][["spanner_label"]] <-
        as.list(fn(spanners_df[spanners_df[["spanner_id"]] == spanner, ][["spanner_label"]]))

      data <- dt_spanners_set(data = data, spanners = spanners_df)
    }
  }

  data
}

# Text transformation using `cells_row_groups()`
#' @export
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
