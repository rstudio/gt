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
#  Copyright (c) 2018-2023 gt authors
#
#  For full copyright and license information, please look at
#  https://gt.rstudio.com/LICENSE.html
#
#------------------------------------------------------------------------------#


#' Set the alignment of columns
#'
#' @description
#'
#' The individual alignments of columns (which includes the column labels and
#' all of their data cells) can be modified. We have the option to align text to
#' the `left`, the `center`, and the `right`. In a less explicit manner, we can
#' allow **gt** to automatically choose the alignment of each column based on
#' the data type (with the `auto` option).
#'
#' @param data *The gt table data object*
#'
#'   `obj:<gt_tbl>` // **required**
#'
#'   This is the **gt** table object that is commonly created through use of the
#'   [gt()] function.
#'
#' @param align *Alignment type*
#'
#'   `singl-kw:[auto|left|center|right]` // *default:* `"auto"`
#'
#'   This can be any of `"center"`, `"left"`, or `"right"` for center-, left-,
#'   or right-alignment. Alternatively, the `"auto"` option (the default), will
#'   automatically align values in columns according to the data type (see the
#'   Details section for specifics on which alignments are applied).
#'
#' @param columns *Columns to target*
#'
#'   `<column-targeting expression>` // *default:* `everything()`
#'
#'   The columns for which the alignment should be applied. Can either be a
#'   series of column names provided in [c()], a vector of column indices, or a
#'   select helper function. Examples of select helper functions include
#'   [starts_with()], [ends_with()], [contains()], [matches()], [one_of()],
#'   [num_range()], and [everything()]. By default this is set to [everything()]
#'   which means that the chosen alignment affects all columns.
#'
#' @return An object of class `gt_tbl`.
#'
#' @details
#'
#' When you create a **gt** table object using [gt()], automatic alignment of
#' column labels and their data cells is performed. By default, left-alignment
#' is applied to columns of class `character`, `Date`, or `POSIXct`;
#' center-alignment is for columns of class `logical`, `factor`, or `list`; and
#' right-alignment is used for the `numeric` and `integer` columns.
#'
#' @section Examples:
#'
#' Let's use [`countrypops`] to create a small **gt** table. We can change the
#' alignment of the `population` column with `cols_align()`. In this example,
#' the label and body cells of `population` will be aligned to the left.
#'
#' ```r
#' countrypops |>
#'   dplyr::select(-contains("code")) |>
#'   dplyr::filter(country_name == "San Marino") |>
#'   dplyr::slice_tail(n = 5) |>
#'   gt(rowname_col = "year", groupname_col = "country_name") |>
#'   cols_align(
#'     align = "left",
#'     columns = population
#'   )
#' ```
#'
#' \if{html}{\out{
#' `r man_get_image_tag(file = "man_cols_align_1.png")`
#' }}
#'
#' @family column modification functions
#' @section Function ID:
#' 5-1
#'
#' @section Function Introduced:
#' `v0.2.0.5` (March 31, 2020)
#'
#' @export
cols_align <- function(
    data,
    align = c("auto", "left", "center", "right"),
    columns = everything()
) {

  # Perform input object validation
  stop_if_not_gt_tbl(data = data)

  # Get the `align` value, this stops the function if there is no match
  align <- rlang::arg_match(align)

  # Get the columns supplied in `columns` as a character vector
  column_names <-
    resolve_cols_c(
      expr = {{ columns }},
      data = data,
      excl_stub = FALSE
    )

  if (align == "auto") {

    # Get the internal data table
    data_tbl <- dt_data_get(data = data)

    # Obtain a vector of column classes for each of the column names
    col_classes <- unlist(lapply(lapply(data_tbl[column_names], class), `[[`, 1))

    # Check whether all values in 'character' columns are
    # predominantly 'number-like' and modify `col_classes` accordingly
    col_classes <-
      determine_which_character_number(
        data_tbl = data_tbl,
        col_classes = col_classes
      )

    # Get a vector of `align` values based on the column classes
    align <-
      unname(
        sapply(
          col_classes, switch,
          "character-numeric" = "right",
          "character" = "left",
          "Date" = "right",
          "POSIXct" = "right",
          "logical" = "center",
          "factor" = "center",
          "list" = "center",
          "numeric" = "right",
          "integer" = "right",
          "center"
        )
      )

  } else {
    align <- rep(align, length(column_names))
  }

  for (i in seq(column_names)) {

    data <-
      dt_boxhead_edit(
        data = data,
        var = column_names[i],
        column_align = align[i]
      )
  }

  data
}

determine_which_character_number <- function(
  data_tbl = data_tbl,
  col_classes = col_classes
) {

  cols_character <- names(col_classes[col_classes == "character"])

  for (col in cols_character) {

    col_vals <- data_tbl[[col]]

    res <- grepl("^[0-9 -/:\\.]*$", col_vals[!is.na(col_vals)])

    if (length(res) > 0 && all(res)) {
      col_classes[names(col_classes) == col] <- "character-numeric"
    }
  }

  col_classes
}

#' Align all numeric values in a column along the decimal mark
#'
#' @description
#'
#' For numeric columns that contain values with decimal portions, it is
#' sometimes useful to have them lined up along the decimal mark for easier
#' readability. We can do this with `cols_align_decimal()` and provide any
#' number of columns (the function will skip over columns that don't require
#' this type of alignment).
#'
#' @param data *The gt table data object*
#'
#'   `obj:<gt_tbl>` // **required**
#'
#'   This is the **gt** table object that is commonly created through use of the
#'   [gt()] function.
#'
#' @param columns *Columns to target*
#'
#'   `<column-targeting expression>` // *default:* `everything()`
#'
#'   The columns for which decimal alignment should be applied. Can either be a
#'   series of column names provided in [c()], a vector of column indices, or a
#'   select helper function. Examples of select helper functions include
#'   [starts_with()], [ends_with()], [contains()], [matches()], [one_of()],
#'   [num_range()], and [everything()]. By default this is set to [everything()]
#'   which means that decimal alignment will be attempted on all columns.
#'
#' @param dec_mark *Decimal mark*
#'
#'   `scalar<character>` // *default:* `"."`
#'
#'   The character used as a decimal mark in the numeric values to be aligned.
#'   If a locale value was used when formatting the numeric values then `locale`
#'   is better to use and it will override any value here in `dec_mark`.
#'
#' @param locale *Locale identifier*
#'
#'   `scalar<character>` // *default:* `NULL` (`optional`)
#'
#'   An optional locale identifier that can be used to obtain the type of
#'   decimal mark used in the numeric values to be aligned (according to the
#'   locale's formatting rules). Examples include `"en"` for English (United
#'   States) and `"fr"` for French (France). We can use the [info_locales()]
#'   function as a useful reference for all of the locales that are supported. A
#'   locale ID can be also set in the initial [gt()] function call (where it
#'   would be used automatically by any function with a `locale` argument) but a
#'   `locale` value provided here will override that global locale.
#'
#' @return An object of class `gt_tbl`.
#'
#' @section Examples:
#'
#' Let's put together a two-column table to create a **gt** table. The first
#' column `char` just contains letters whereas the second column, `num`, has a
#' collection of numbers and `NA` values. We could format the numbers with
#' [fmt_number()] and elect to drop the trailing zeros past the decimal mark
#' with `drop_trailing_zeros = TRUE`. This can leave formatted numbers that are
#' hard to scan through because the decimal mark isn't fixed horizontally. We
#' could remedy this and align the numbers by the decimal mark with
#' `cols_align_decimal()`.
#'
#' ```r
#' dplyr::tibble(
#'   char = LETTERS[1:9],
#'   num = c(1.2, -33.52, 9023.2, -283.527, NA, 0.401, -123.1, NA, 41)
#' ) |>
#'   gt() |>
#'   fmt_number(
#'     columns = num,
#'     decimals = 3,
#'     drop_trailing_zeros = TRUE
#'   ) |>
#'   cols_align_decimal()
#' ```
#'
#' \if{html}{\out{
#' `r man_get_image_tag(file = "man_cols_align_decimal_1.png")`
#' }}
#'
#' @family column modification functions
#' @section Function ID:
#' 5-2
#'
#' @section Function Introduced:
#' `v0.8.0` (November 16, 2022)
#'
#' @import rlang
#' @export
cols_align_decimal <- function(
    data,
    columns = everything(),
    dec_mark = ".",
    locale = NULL
) {

  # Perform input object validation
  stop_if_not_gt_tbl(data = data)

  # Resolve the `locale` value here with the global locale value
  locale <- resolve_locale(data = data, locale = locale)

  # Obtain the decimal mark if a locale ID is provided
  dec_mark <- get_locale_dec_mark(locale, dec_mark)

  # Get the columns supplied in `columns` as a character vector
  resolved <-
    resolve_cols_c(
      expr = {{ columns }},
      data = data,
      excl_stub = FALSE
    )

  # Only numeric columns should be transformed through
  # `cols_align_decimal()` so `column_names` should be filtered
  # to those types of columns
  table_data <- dt_data_get(data = data)
  table_data <- dplyr::select(table_data, dplyr::all_of(resolved))

  cols_are_numeric <-
    vapply(
      table_data,
      FUN.VALUE = logical(1),
      USE.NAMES = FALSE,
      FUN = function(x) inherits(x, "numeric") || inherits(x, "integer")
    )

  # Subset columns to those that are numeric in the input table data
  columns <- colnames(table_data)[cols_are_numeric]

  # If the subsetting of columns finally results in no columns, return
  # the data unchanged
  if (length(columns) < 1) {
    return(data)
  }

  # Ensure that right alignment is set for all columns undergoing
  # the decimal alignment transformation
  data <- cols_align(data = data, columns = columns, align = "right")

  # Pass `data`, `columns`, `rows`, and the formatting
  # functions (as a function list) to `subst()`
  text_transform(
    data = data,
    locations = cells_body(
      columns = columns,
      rows = everything()
    ),
    fn = function(x) {
      align_to_char(x, align_at = dec_mark)
    }
  )
}

align_to_char <- function(x, align_at = ".") {

  na_x_vals <- grepl("^NA$", x)
  no_a_char <- !grepl(align_at, x, fixed = TRUE) & !grepl("[0-9]", x)
  has_t_dec <- grepl("[0-9]\\.$", x)

  x_no_align <- na_x_vals | no_a_char

  x_str <- as.character(x)

  split_x <- strsplit(x[!x_no_align], align_at, fixed = TRUE)

  x_lhs <-
    unlist(
      lapply(
        split_x,
        FUN = function(x) x[1]
      )
    )

  x_rhs <-
    unlist(
      lapply(
        split_x,
        FUN = function(x) paste0(x[-1], collapse = align_at)
      )
    )

  x_piece_lhs <-
    paste0(
      strrep("\U02007", max(nchar(x_lhs)) - nchar(x_lhs)),
      x_lhs
    )

  x_piece_rhs <-
    paste0(
      x_rhs,
      strrep("\U02007", max(nchar(x_rhs)) - nchar(x_rhs))
    )

  for (i in seq_along(x_piece_lhs)) {

    if (grepl("[^0-9]$", x_piece_lhs[i])) {

      extracted <- str_single_extract(x_piece_lhs[i], "[^0-9]+$")

      n_char_extracted <- nchar(extracted)

      x_piece_lhs[i] <- gsub(extracted, "", x_piece_lhs[i], fixed = TRUE)

      x_piece_rhs[i] <- paste0(extracted, x_piece_rhs[i])

      x_piece_rhs[i] <-
        gsub(
          paste0(paste(rep("\U02007", n_char_extracted), collapse = ""), "$"),
          "",
          x_piece_rhs[i]
      )
    }
  }

  x_align <- paste(x_piece_lhs, x_piece_rhs, sep = align_at)

  x_align_parens <- grepl("\\(.+?\\)", x_align)

  if (grepl(align_at, paste(x[!x_no_align], collapse = "|"), fixed = TRUE)) {

    x_align[!nchar(x_rhs) > 0 & !grepl(align_at, x[!x_no_align], fixed = TRUE)] <-
      sub(align_at, " ", x_align[!nchar(x_rhs) > 0], fixed = TRUE)

    x_align[x_align_parens] <- paste0(x_align[x_align_parens], "\U000A0")

  } else {

    x_align[!nchar(x_rhs) > 0 & !grepl(align_at, x[!x_no_align], fixed = TRUE)] <-
      sub(align_at, "", x_align[!nchar(x_rhs) > 0], fixed = TRUE)

    x_align[!x_align_parens] <- paste0(x_align[!x_align_parens], "\U000A0")
  }

  x_str[!x_no_align] <- x_align

  x_str
}

#' Set the widths of columns
#'
#' @description
#'
#' Manual specifications of column widths can be performed using the
#' `cols_width()` function. We choose which columns get specific widths. This
#' can be in units of pixels (easily set by use of the [px()] helper function),
#' or, as percentages (where the [pct()] helper function is useful). Width
#' assignments are supplied in `...` through two-sided formulas, where the
#' left-hand side defines the target columns and the right-hand side is a single
#' dimension.
#'
#' @param .data *The gt table data object*
#'
#'   `obj:<gt_tbl>` // **required**
#'
#'   This is the **gt** table object that is commonly created through use of the
#'   [gt()] function.
#'
#' @param ... *Column width assignments*
#'
#'   `<multiple expressions>` // **required** (or, use `.list`)
#'
#'   Expressions for the assignment of column widths for the table columns in
#'   `.data`. Two-sided formulas (e.g, `<LHS> ~ <RHS>`) can be used, where the
#'   left-hand side corresponds to selections of columns and the right-hand side
#'   evaluates to single-length character values in the form `{##}px` (i.e.,
#'   pixel dimensions); the [px()] helper function is best used for this
#'   purpose. Column names should be enclosed in [c()]. The column-based select
#'   helpers [starts_with()], [ends_with()], [contains()], [matches()],
#'   [one_of()], and [everything()] can be used in the LHS. Subsequent
#'   expressions that operate on the columns assigned previously will result in
#'   overwriting column width values (both in the same `cols_width()` call and
#'   across separate calls). All other columns can be assigned a default width
#'   value by using `everything()` on the left-hand side.
#'
#' @param .list *Alternative to `...`*
#'
#'   `<list of multiple expressions>` // **required** (or, use `...`)
#'
#'   Allows for the use of a list as an input alternative to `...`.
#'
#' @return An object of class `gt_tbl`.
#'
#' @details
#'
#' Column widths can be set as absolute or relative values (with px and
#' percentage values). Those columns not specified are treated as having
#' variable width. The sizing behavior for column widths depends on the
#' combination of value types, and, whether a table width has been set (which
#' could, itself, be expressed as an absolute or relative value). Widths for the
#' table and its container can be individually modified with the `table.width`
#' and `container.width` arguments within [tab_options()]).
#'
#' @section Examples:
#'
#' Use select columns from the [`exibble`] dataset to create a **gt** table. We
#' can specify the widths of columns with `cols_width()`. This is done with
#' named arguments in `...`, specifying the exact widths for table columns
#' (using `everything()` at the end will capture all remaining columns).
#'
#' ```r
#' exibble |>
#'   dplyr::select(
#'     num, char, date,
#'     datetime, row
#'   ) |>
#'   gt() |>
#'   cols_width(
#'     num ~ px(150),
#'     ends_with("r") ~ px(100),
#'     starts_with("date") ~ px(200),
#'     everything() ~ px(60)
#'   )
#' ```
#'
#' \if{html}{\out{
#' `r man_get_image_tag(file = "man_cols_width_1.png")`
#' }}
#'
#' @family column modification functions
#' @section Function ID:
#' 5-3
#'
#' @section Function Introduced:
#' `v0.2.0.5` (March 31, 2020)
#'
#' @export
cols_width <- function(
    .data,
    ...,
    .list = list2(...)
) {

  # Perform input object validation
  stop_if_not_gt_tbl(data = .data)

  # Collect a named list of column widths
  widths_list <- .list

  # If nothing is provided, return `.data` unchanged
  if (length(widths_list) == 0) {
    cli::cli_abort(c(
      "Nothing was provided to `...`.",
      "*" = "Use formula expressions to define custom column widths."
    ))
  }

  all_formulas <-
    all(
      vapply(
        widths_list,
        FUN = function(width) rlang::is_formula(width),
        FUN.VALUE = logical(1)
      )
    )

  if (!all_formulas) {
    cli::cli_abort(
      "Only two-sided formulas should be provided to `...`."
    )
  }

  columns_used <- NULL

  for (width_item in widths_list) {

    cols <- rlang::f_lhs(width_item)

    # The default use of `resolve_cols_c()` won't work here if there
    # is a table stub column (because we need to be able to set the
    # stub column width and, by default, `resolve_cols_c()` excludes
    # the stub); to prevent this exclusion, we set `excl_stub` to FALSE
    columns <-
      resolve_cols_c(
        expr = !!cols,
        data = .data,
        excl_stub = FALSE
      )

    columns <- base::setdiff(columns, columns_used)

    columns_used <- c(columns_used, columns)

    width <- rlang::eval_tidy(rlang::f_rhs(width_item))

    # If a bare numeric value is provided, give that the `px` dimension
    if (is.numeric(width)) width <- paste_right(as.character(width), "px")

    for (column in columns) {

      .data <-
        dt_boxhead_edit(
          data = .data,
          var = column,
          column_width = list(width)
        )
    }
  }

  boxh <- dt_boxhead_get(data = .data)

  unset_widths <- unlist(lapply(boxh$column_width, FUN = is.null))

  if (any(unset_widths)) {

    columns_unset <- dt_boxhead_get_vars(data = .data)[unset_widths]

    for (column in columns_unset) {

      .data <-
        dt_boxhead_edit(
          data = .data,
          var = column,
          column_width = list("")
        )
    }
  }

  .data
}

#' Relabel one or more columns
#'
#' @description
#'
#' Column labels can be modified from their default values (the names of the
#' columns from the input table data). When you create a **gt** table object
#' using [gt()], column names effectively become the column labels. While this
#' serves as a good first approximation, column names as label defaults aren't
#' often as appealing in a **gt** table as the option for custom column labels.
#' The `cols_label()` function provides the flexibility to relabel one or more
#' columns and we even have the option to use the [md()] or [html()] helper
#' functions for rendering column labels from Markdown or using HTML.
#'
#' @param .data *The gt table data object*
#'
#'   `obj:<gt_tbl>` // **required**
#'
#'   This is the **gt** table object that is commonly created through use of the
#'   [gt()] function.
#'
#' @param ... *Column label assignments*
#'
#'   `<multiple expressions>` // **required** (or, use `.list`)
#'
#'   Expressions for the assignment of column labels for the table columns in
#'   `.data`. Two-sided formulas (e.g., `<LHS> ~ <RHS>`) can be used, where the
#'   left-hand side corresponds to selections of columns and the right-hand side
#'   evaluates to single-length values for the label to apply. Column names
#'   should be enclosed in [c()]. Select helpers like [starts_with()],
#'   [ends_with()], [contains()], [matches()], [one_of()], and [everything()]
#'   can be used in the LHS. Named arguments are also valid as input for simple
#'   mappings of column name to label text; they should be of the form `<column
#'   name> = <label>`. Subsequent expressions that operate on the columns
#'   assigned previously will result in overwriting column label values.
#'
#' @param .list *Alternative to `...`*
#'
#'   `<list of multiple expressions>` // **required** (or, use `...`)
#'
#'   Allows for the use of a list as an input alternative to `...`.
#'
#' @param .fn *Function to apply*
#'
#'   `function` // *default:* `NULL` (`optional`)
#'
#'   An option to specify a function that will be applied to all of the provided
#'   label values.
#'
#' @param .process_units *Option to process any available units throughout*
#'
#'   `scalar<logical>` // *default:* `NULL` (`optional`)
#'
#'   Should your column text contain text that is already in **gt**'s units
#'   notation (and, importantly, is surrounded by `"{{"`/`"}}"`), using `TRUE`
#'   here reprocesses all column such that the units are properly registered for
#'   each of the column labels. This ignores any column label assignments in
#'   `...` or `.list`.
#'
#' @return An object of class `gt_tbl`.
#'
#' @section A note on column names and column labels:
#'
#' It's important to note that while columns can be freely relabeled, we
#' continue to refer to columns by their original column names. Column names in
#' a tibble or data frame must be unique whereas column labels in **gt** have
#' no requirement for uniqueness (which is useful for labeling columns as, say,
#' measurement units that may be repeated several times---usually under
#' different spanner labels). Thus, we can still easily distinguish
#' between columns in other **gt** function calls (e.g., in all of the
#' `fmt*()` functions) even though we may lose distinguishability between column
#' labels once they have undergone relabeling.
#'
#' @section Incorporating units with **gt**'s units notation:
#'
#' Measurement units are often seen as part of column labels and indeed it can
#' be much more straightforward to include them here rather than using other
#' devices to make readers aware of units for specific columns. The **gt**
#' package offers the function [cols_units()] to apply units to various columns
#' with an interface that's similar to that of this function. However, it is
#' also possible to define units here along with the column label, obviating the
#' need for pattern syntax that joins the two text components. To do this, we
#' have to surround the portion of text in the label that corresponds to the
#' units definition with `"{{"`/`"}}"`.
#'
#' Now that we know how to mark text for units definition, we know need to know
#' how to write proper units with the notation. Such notation uses a succinct
#' method of writing units and it should feel somewhat familiar though it is
#' particular to the task at hand. Each unit is treated as a separate entity
#' (parentheses and other symbols included) and the addition of subscript text
#' and exponents is flexible and relatively easy to formulate. This is all best
#' shown with a few examples:
#'
#' - `"m/s"` and `"m / s"` both render as `"m/s"`
#' - `"m s^-1"` will appear with the `"-1"` exponent intact
#' - `"m \s"` gives the the same result, as `"\<unit>"` is equivalent to
#'   `"<unit>^-1"`
#' - `"E_h"` will render an `"E"` with the `"h"` subscript
#' - `"t_i^2.5"` provides a `t` with an `"i"` subscript and a `"2.5"` exponent
#' - `"m[_0^2]"` will use overstriking to set both scripts vertically
#' - `"g/L %C6H12O6%"` uses a chemical formula (enclosed in a pair of `"%"`
#'   characters) as a unit partial, and the formula will render correctly with
#'   subscripted numbers
#' - Common units that are difficult to write using ASCII text may be implicitly
#'   converted to the correct characters (e.g., the `"u"` in `"ug"`, `"um"`,
#'   `"uL"`, and `"umol"` will be converted to the Greek *mu* symbol; `"degC"`
#'   and `"degF"` will render a degree sign before the temperature unit)
#' - We can transform shorthand symbol/unit names enclosed in `":"` (e.g.,
#'   `":angstrom:"`, `":ohm:"`, etc.) into proper symbols
#' - The components of a unit (unit name, subscript, and exponent) can be
#'   fully or partially italicized/emboldened by surrounding text with `"*"` or
#'   `"**"`
#'
#' @section Examples:
#'
#' Let's use a portion of the [`countrypops`] dataset to create a **gt** table.
#' We can relabel all the table's columns with the `cols_label()` function to
#' improve its presentation. In this simple case we are supplying the name of
#' the column on the left-hand side, and the label text on the right-hand side.
#'
#' ```r
#' countrypops |>
#'   dplyr::select(-contains("code")) |>
#'   dplyr::filter(country_name == "Uganda") |>
#'   dplyr::slice_tail(n = 5) |>
#'   gt() |>
#'   cols_label(
#'     country_name = "Name",
#'     year = "Year",
#'     population = "Population"
#'   )
#' ```
#'
#' \if{html}{\out{
#' `r man_get_image_tag(file = "man_cols_label_1.png")`
#' }}
#'
#' Using the [`countrypops`] dataset again, we label columns similarly to before
#' but this time making the column labels be bold through Markdown formatting
#' (with the [md()] helper function). It's possible here to use either a `=` or
#' a `~` between the column name and the label text.
#'
#' ```r
#' countrypops |>
#'   dplyr::select(-contains("code")) |>
#'   dplyr::filter(country_name == "Uganda") |>
#'   dplyr::slice_tail(n = 5) |>
#'   gt() |>
#'   cols_label(
#'     country_name = md("**Name**"),
#'     year = md("**Year**"),
#'     population ~ md("**Population**")
#'   )
#' ```
#'
#' \if{html}{\out{
#' `r man_get_image_tag(file = "man_cols_label_2.png")`
#' }}
#'
#' With a select portion of the [`metro`] dataset, let's create a small **gt**
#' table with three columns. Within `cols_label()` we'd like to provide column
#' labels that contain line breaks. For that, we can use `<br>` to indicate
#' where the line breaks should be. We also need to use the [md()] helper
#' function to signal to **gt** that this text should be interpreted as
#' Markdown. Instead of calling [md()] on each of labels as before, we can more
#' conveniently use the `.fn` argument and provide the bare function there (it
#' will be applied to each label defined in the `cols_label()` call).
#'
#' ```r
#' metro |>
#'   dplyr::select(name, lines, passengers, connect_other) |>
#'   dplyr::arrange(desc(passengers)) |>
#'   dplyr::slice_head(n = 10) |>
#'   gt() |>
#'   cols_hide(columns = passengers) |>
#'   cols_label(
#'     name = "Name of<br>Metro Station",
#'     lines = "Metro<br>Lines",
#'     connect_other = "Train<br>Services",
#'     .fn = md
#'   )
#' ```
#'
#' \if{html}{\out{
#' `r man_get_image_tag(file = "man_cols_label_3.png")`
#' }}
#'
#' Using a subset of the [`towny`] dataset, we can create an interesting **gt**
#' table. First, only certain columns are selected from the dataset, some
#' filtering of rows is done, rows are sorted, and then only the first 10 rows
#' are kept. When introduced to [gt()], we apply some spanner labels through two
#' calls of [tab_spanner()] all the table's columns. Below those spanners, we
#' want to label the columns by the years of interest. Using `cols_label()` and
#' select expressions on the left side of the formulas, we can easily relabel
#' multiple columns with common label text. Note that we cannot use an `=` sign
#' in any of the expressions within `cols_label()`; because the left-hand side
#' is not a single column name, we must use formula syntax (i.e., with the `~`).
#'
#' ```r
#' towny |>
#'   dplyr::select(
#'     name, ends_with("2001"), ends_with("2006"), matches("2001_2006")
#'   ) |>
#'   dplyr::filter(population_2001 > 100000) |>
#'   dplyr::arrange(desc(pop_change_2001_2006_pct)) |>
#'   dplyr::slice_head(n = 10) |>
#'   gt() |>
#'   fmt_integer() |>
#'   fmt_percent(columns = matches("change"), decimals = 1) |>
#'   tab_spanner(label = "Population", columns = starts_with("population")) |>
#'   tab_spanner(label = "Density", columns = starts_with("density")) |>
#'   cols_label(
#'     ends_with("01") ~ "2001",
#'     ends_with("06") ~ "2006",
#'     matches("change") ~ md("Population Change,<br>2001 to 2006")
#'   ) |>
#'   cols_width(everything() ~ px(120))
#' ```
#'
#' \if{html}{\out{
#' `r man_get_image_tag(file = "man_cols_label_4.png")`
#' }}
#'
#' Here's another table that uses the [`towny`] dataset. The big difference
#' compared to the previous *gt* table is that `cols_label()` as used here
#' incorporates unit notation text (within `"{{"`/`"}}"`).
#'
#' ```r
#' towny |>
#'   dplyr::select(
#'     name, population_2021, density_2021, land_area_km2, latitude, longitude
#'   ) |>
#'   dplyr::filter(population_2021 > 100000) |>
#'   dplyr::arrange(desc(population_2021)) |>
#'   dplyr::slice_head(n = 10) |>
#'   gt() |>
#'   fmt_integer(columns = population_2021) |>
#'   fmt_number(
#'     columns = c(density_2021, land_area_km2),
#'     decimals = 1
#'   ) |>
#'   fmt_number(columns = latitude, decimals = 2) |>
#'   fmt_number(columns = longitude, decimals = 2, scale_by = -1) |>
#'   cols_label(
#'     starts_with("population") ~ "Population",
#'     starts_with("density") ~ "Density, {{*persons* km^-2}}",
#'     land_area_km2 ~ "Area, {{km^2}}",
#'     latitude ~ "Latitude, {{:degrees:N}}",
#'     longitude ~ "Longitude, {{:degrees:W}}"
#'   ) |>
#'   cols_width(everything() ~ px(120))
#' ```
#'
#' \if{html}{\out{
#' `r man_get_image_tag(file = "man_cols_label_5.png")`
#' }}
#'
#' The [`illness`] dataset has units within the `units` column. They're
#' formatted in just the right way for **gt** too. Let's do some text
#' manipulation through `dplyr::mutate()` and some pivoting with
#' **tidyr**'s `pivot_longer()` and `pivot_wider()` in order to include the
#' units as part of the column names in the reworked table. These column names
#' are in a format where the units are included within `"{{"`/`"}}"`, so, we can
#' use `cols_label()` with the `.process_units = TRUE` option to register the
#' measurement units. In addition to this, because there is a `<br>` included
#' (for a line break), we should use the `.fn` option and provide the [md()]
#' helper function (as a bare function name). This ensures that any line breaks
#' will materialize.
#'
#' ```r
#' illness |>
#'   dplyr::mutate(test = paste0(test, ",<br>{{", units, "}}")) |>
#'   dplyr::slice_head(n = 8) |>
#'   dplyr::select(-c(starts_with("norm"), units)) |>
#'   tidyr::pivot_longer(
#'     cols = starts_with("day"),
#'     names_to = "day",
#'     names_prefix = "day_",
#'     values_to = "value"
#'   ) |>
#'   tidyr::pivot_wider(
#'     names_from = test,
#'     values_from = value
#'   ) |>
#'   gt(rowname_col = "day") |>
#'   tab_stubhead(label = "Day") |>
#'   cols_label(
#'     .fn = md,
#'     .process_units = TRUE
#'   ) |>
#'   cols_width(
#'     stub() ~ px(50),
#'     everything() ~ px(120)
#'   )
#' ```
#'
#' \if{html}{\out{
#' `r man_get_image_tag(file = "man_cols_label_6.png")`
#' }}
#'
#' @family column modification functions
#' @section Function ID:
#' 5-4
#'
#' @section Function Introduced:
#' `v0.2.0.5` (March 31, 2020)
#'
#' @import rlang
#' @export
cols_label <- function(
    .data,
    ...,
    .list = list2(...),
    .fn = NULL,
    .process_units = NULL
) {

  # Perform input object validation
  stop_if_not_gt_tbl(data = .data)

  if (!is.null(.process_units) && .process_units) {

    # Obtain all extant labels as a list
    vars_default <- dt_boxhead_get_vars_default(data = .data)
    vars_labels_default <- dt_boxhead_get_vars_labels_default(data = .data)

    labels_list <- as.list(vars_labels_default)
    names(labels_list) <- vars_default

  } else if (!is.null(.process_units) && !.process_units) {

    # Collect a list of column labels
    labels_list <- .list

  } else {

    # Collect a list of column labels
    labels_list <- .list
  }

  column_vars <- dt_boxhead_get_vars(data = .data)

  # If nothing is provided, return `data` unchanged
  if (length(labels_list) == 0) {
    return(.data)
  }

  for (i in seq_along(labels_list)) {

    label_i <- labels_list[i]

    # When input is provided as a list in `.list`, we obtain named vectors;
    # upgrade this to a list to match the input collected from `...`
    if (rlang::is_named(label_i) && rlang::is_scalar_vector(label_i)) {
      label_i <- as.list(label_i)
    }

    if (
      is.list(label_i) &&
      rlang::is_named(label_i) &&
      rlang::is_scalar_vector(label_i[[1]])
    ) {

      # Get column and value
      columns <- names(label_i)
      new_label <- label_i[[1]]

      if (!(columns %in% column_vars)) {
        cli::cli_abort(c(
          "The column name supplied to `cols_label()` (`{columns}`) is not valid.",
          "*" = "Include column names or a tidyselect statement on the LHS."
        ))
      }

    } else if (
      is.list(label_i) &&
      rlang::is_formula(label_i[[1]])
    ) {

      label_i <- label_i[[1]]

      cols <- rlang::f_lhs(label_i)

      if (is.null(cols)) {
        cli::cli_abort(c(
          "A formula supplied to `cols_label()` must be two-sided.",
          "*" = "Include column names or a tidyselect statement on the LHS."
        ))
      }

      # The default use of `resolve_cols_c()` won't work here if there
      # is a table stub column (because we need to be able to set the
      # stub column width and, by default, `resolve_cols_c()` excludes
      # the stub); to prevent this exclusion, we set `excl_stub` to FALSE
      columns <-
        resolve_cols_c(
          expr = !!cols,
          data = .data
        )

      new_label <- rlang::eval_tidy(rlang::f_rhs(label_i))
    }

    if (!is.null(.fn)) {

      # Invoke the supplied function on the `new_label` vector
      new_label <- .fn(new_label)
    }

    for (j in seq_along(columns)) {

      # For each of the resolved columns, process the label text and
      # insert the new label and any discovered units in the boxhead

      # Determine is there is any text pertaining to units; if there is,
      # then (1) extract that text, (2) add it to the `column_units` entry,
      # and (3) set a `column_pattern` override value of `""` (because the
      # use of units here is already part of the column label string, so no
      # pattern needed)

      if (grepl("\\{\\{.*?\\}\\}", new_label)) {

        column_units <- gsub("^.*?(\\{\\{.*?\\}\\}).*?$", "\\1", new_label)

        .data <-
          dt_boxhead_edit_column_units(
            data = .data,
            var = columns[j],
            column_units = column_units
          )

        .data <-
          dt_boxhead_edit_column_pattern(
            data = .data,
            var = columns[j],
            column_pattern = ""
          )
      }

      .data <-
        dt_boxhead_edit_column_label(
          data = .data,
          var = columns[j],
          column_label = new_label
        )
    }
  }

  .data
}

#' Relabel columns with a function
#'
#' @description
#'
#' Column labels can be modified from their default values (the names of the
#' columns from the input table data). When you create a **gt** table object
#' using [gt()], column names effectively become the column labels. While this
#' serves as a good first approximation, you may want to make adjustments so
#' that the columns names present better in the **gt** output table. The
#' `cols_label_with()` function allows for modification of column labels through
#' a supplied function. By default, the function will be invoked on all column
#' labels but this can be limited to a subset via the `columns` argument. With
#' the `fn` argument, we provide either a bare function name, a RHS formula
#' (with `.` representing the vector of column labels), or, an anonymous
#' function (e.g., `function(x) tools::toTitleCase(x)`).
#'
#' @inheritParams fmt_number
#'
#' @param columns *Columns to target*
#'
#'   `<column-targeting expression>` // *default:* `everything()`
#'
#'   The columns for which the column-labeling operations should be applied. Can
#'   either be a series of column names provided in [c()], a vector of column
#'   indices, or a select helper function. Examples of select helper functions
#'   include [starts_with()], [ends_with()], [contains()], [matches()],
#'   [one_of()], [num_range()], and [everything()].
#'
#' @param fn *Function to apply*
#'
#'   `function|formula` // **required**
#'
#'   The function or function call to be applied to the column labels. This can
#'   take the form of a bare function (e.g., `tools::toTitleCase`), a function
#'   call as a RHS formula (e.g., `~ tools::toTitleCase(.)`), or an anonymous
#'   function as in `function(x) tools::toTitleCase(x)`.
#'
#' @return An object of class `gt_tbl`.
#'
#' @section A note on column names and column labels:
#'
#' It's important to note that while columns can be freely relabeled, we
#' continue to refer to columns by their original column names. Column names in
#' a tibble or data frame must be unique whereas column labels in **gt** have no
#' requirement for uniqueness (which is useful for labeling columns as, say,
#' measurement units that may be repeated several times---usually under
#' different spanner labels). Thus, we can still easily distinguish between
#' columns in other **gt** function calls (e.g., in all of the `fmt*()`
#' functions) even though we may lose distinguishability in column labels once
#' they have been relabeled.
#'
#' @section Examples:
#'
#' Use a subset of the [`sp500`] dataset to create a **gt** table. We want all
#' the column labels to be entirely capitalized versions of the default labels
#' but, instead of using [cols_label()] and rewriting each label manually in
#' capital letters we can use `cols_label_with()` and instruct it to apply the
#' `toupper()` function to all column labels.
#'
#' ```r
#' sp500 |>
#'   dplyr::filter(
#'     date >= "2015-12-01" &
#'       date <= "2015-12-15"
#'   ) |>
#'   dplyr::select(-c(adj_close, volume)) |>
#'   gt() |>
#'   cols_label_with(fn = toupper)
#' ```
#'
#' \if{html}{\out{
#' `r man_get_image_tag(file = "man_cols_label_with_1.png")`
#' }}
#'
#' Use the [`countrypops`] dataset to create a **gt** table. To improve the
#' presentation of the table, we are again going to change the default column
#' labels via function calls supplied within `cols_label_with()`. We can, if we
#' prefer, apply multiple types of column label changes in sequence with
#' multiple calls of `cols_label_with()`. Here, we use the `make_clean_names()`
#' functions from the **janitor** package and follow up with the removal of a
#' numeral with `gsub()`.
#'
#' ```r
#' countrypops |>
#'   dplyr::filter(year == 2021) |>
#'   dplyr::filter(grepl("^C", country_code_3)) |>
#'   dplyr::select(-country_code_2, -year) |>
#'   head(8) |>
#'   gt() |>
#'   cols_move_to_start(columns = country_code_3) |>
#'   fmt_integer(columns = population) |>
#'   cols_label_with(
#'     fn = ~ janitor::make_clean_names(., case = "title")
#'   ) |>
#'   cols_label_with(
#'     fn = ~ gsub("[0-9]", "", .)
#'   )
#' ```
#'
#' \if{html}{\out{
#' `r man_get_image_tag(file = "man_cols_label_with_2.png")`
#' }}
#'
#' We can make a svelte **gt** table with the [`pizzaplace`] dataset. There are
#' ways to use one instance of `cols_label_with()` with multiple functions
#' called on the column labels. In the example, we use an anonymous function
#' call (with the `function(x) { ... }` construction) to perform multiple
#' mutations of `x` (the vector of column labels). We can even use the [md()]
#' helper function with that to signal to **gt** that the column label should be
#' interpreted as Markdown text.
#'
#' ```r
#' pizzaplace |>
#'   dplyr::mutate(month = substr(date, 6, 7)) |>
#'   dplyr::group_by(month) |>
#'   dplyr::summarize(pizze_vendute = dplyr::n()) |>
#'   dplyr::ungroup() |>
#'   dplyr::mutate(frazione_della_quota = pizze_vendute / 4000) |>
#'   dplyr::mutate(date = paste0("2015/", month, "/01")) |>
#'   dplyr::select(-month) |>
#'   gt(rowname_col = "date") |>
#'   fmt_date(date, date_style = "month", locale = "it") |>
#'   fmt_percent(columns = frazione_della_quota) |>
#'   fmt_integer(columns = pizze_vendute) |>
#'   cols_width(everything() ~ px(100)) |>
#'   cols_label_with(
#'     fn = function(x) {
#'       janitor::make_clean_names(x, case = "title") |>
#'         toupper() |>
#'         stringr::str_replace_all("^|$", "**") |>
#'         md()
#'     }
#'   )
#' ```
#'
#' \if{html}{\out{
#' `r man_get_image_tag(file = "man_cols_label_with_3.png")`
#' }}
#'
#' @family column modification functions
#' @section Function ID:
#' 5-5
#'
#' @section Function Introduced:
#' `v0.9.0` (March 31, 2023)
#'
#' @import rlang
#' @export
cols_label_with <- function(
    data,
    columns = everything(),
    fn
) {

  # Perform input object validation
  stop_if_not_gt_tbl(data = data)

  fn <- rlang::as_function(fn)

  resolved_columns <-
    resolve_cols_c(
      expr = {{ columns }},
      data = data,
      excl_stub = TRUE
    )

  # If no columns are resolved, return the data unchanged
  if (length(resolved_columns) < 1) {
    return(data)
  }

  # Obtain `boxh_df` table and filter to the rows with resolved column names
  boxh_df <- dt_boxhead_get(data = data)
  boxh_df <- boxh_df[boxh_df[["var"]] %in% resolved_columns, ]

  # Obtain a list of current labels for the resolved columns and ensure
  # that the var names are included as names for each of the list components
  old_label_list <- boxh_df[["column_label"]]
  names(old_label_list) <- boxh_df[["var"]]

  # Apply the function call to each element of `old_label_list`
  new_label_list <- lapply(old_label_list, FUN = fn)

  if (!all(vapply(new_label_list, FUN.VALUE = logical(1), FUN = is_character))) {
    cli::cli_abort("{.arg fn} must return a character vector.")
  }

  if (
    length(new_label_list) != length(resolved_columns) ||
    any(unlist(lapply(new_label_list, FUN = length)) != 1)
    ) {
    cli::cli_abort(
      "Each invocation of {.arg fn} on a column label must return a vector of
      length 1."
    )
  }

  # If no labels remain after filtering, return the data
  if (length(new_label_list) < 1) {
    return(data)
  }

  for (i in seq_along(new_label_list)) {

    data <-
      dt_boxhead_edit_column_label(
        data = data,
        var = names(new_label_list)[i],
        column_label = new_label_list[[i]]
      )
  }

  data
}

#' Define units for one or more columns
#'
#' @description
#'
#' Column labels can sometimes contain measurement units, and these might range
#' from easy to define and typeset (e.g., `"m/s"`) to very difficult. Such
#' difficulty can arise from the need to include subscripts or superscripts,
#' non-ASCII symbols, etc. The `cols_units()` function tries to make this task
#' easier by letting you apply text pertaining to units to various columns. This
#' takes advantage of **gt**'s specialized units notation (e.g.,
#' `"J Hz^-1 mol^-1"` can be used to generate units for the
#' *molar Planck constant*). The notation here provides several conveniences for
#' defining units, letting you produce the correct formatting no matter what the
#' table output format might be (i.e., HTML, LaTeX, RTF, etc.). Details
#' pertaining to the units notation can be found in the section entitled
#' *How to use **gt**'s units notation*.
#'
#' @param .data *The gt table data object*
#'
#'   `obj:<gt_tbl>` // **required**
#'
#'   This is the **gt** table object that is commonly created through use of the
#'   [gt()] function.
#'
#' @param ... *Column units definitions*
#'
#'   `<multiple expressions>` // **required** (or, use `.list`)
#'
#'   Expressions for the assignment of column units for the table columns in
#'   `.data`. Two-sided formulas (e.g., `<LHS> ~ <RHS>`) can be used, where the
#'   left-hand side corresponds to selections of columns and the right-hand side
#'   evaluates to single-length values for the units to apply. Column names
#'   should be enclosed in [c()]. Select helpers like [starts_with()],
#'   [ends_with()], [contains()], [matches()], [one_of()], and [everything()]
#'   can be used in the LHS. Named arguments are also valid as input for simple
#'   mappings of column name to the **gt** units syntax; they should be of the
#'   form `<column name> = <units text>`. Subsequent expressions that operate on
#'   the columns assigned previously will result in overwriting column units
#'   defintion values.
#'
#' @param .list *Alternative to `...`*
#'
#'   `<list of multiple expressions>` // **required** (or, use `...`)
#'
#'   Allows for the use of a list as an input alternative to `...`.
#'
#' @param .units_pattern *Pattern to combine column labels and units*
#'
#'   `scalar<character>` // *default:* `NULL` (`optional`)
#'
#'   An optional pattern to be used for combining column labels with the defined
#'   units. The default pattern is `"{1}, {2}"`, where `"{1}"` refers to the
#'   column label text and `"{2}"` is the text related to the associated units.
#'   This default can be modified through the `column_labels.units_pattern`
#'   option found in [tab_options()]. Setting a value here will provide an
#'   override to the `column_labels.units_pattern` default (only for the
#'   resolved columns in the invocation of `cols_units()`).
#'
#' @return An object of class `gt_tbl`.
#'
#' @section How to use **gt**'s units notation:
#'
#' The units notation involves a shorthand of writing units that feels familiar
#' and is fine-tuned for the task at hand. Each unit is treated as a separate
#' entity (parentheses and other symbols included) and the addition of subscript
#' text and exponents is flexible and relatively easy to formulate. This is all
#' best shown with examples:
#'
#' - `"m/s"` and `"m / s"` both render as `"m/s"`
#' - `"m s^-1"` will appear with the `"-1"` exponent intact
#' - `"m \s"` gives the the same result, as `"\<unit>"` is equivalent to
#'   `"<unit>^-1"`
#' - `"E_h"` will render an `"E"` with the `"h"` subscript
#' - `"t_i^2.5"` provides a `t` with an `"i"` subscript and a `"2.5"` exponent
#' - `"m[_0^2]"` will use overstriking to set both scripts vertically
#' - `"g/L %C6H12O6%"` uses a chemical formula (enclosed in a pair of `"%"`
#'   characters) as a unit partial, and the formula will render correctly with
#'   subscripted numbers
#' - Common units that are difficult to write using ASCII text may be implicitly
#'   converted to the correct characters (e.g., the `"u"` in `"ug"`, `"um"`,
#'   `"uL"`, and `"umol"` will be converted to the Greek *mu* symbol; `"degC"`
#'   and `"degF"` will render a degree sign before the temperature unit)
#' - We can transform shorthand symbol/unit names enclosed in `":"` (e.g.,
#'   `":angstrom:"`, `":ohm:"`, etc.) into proper symbols
#' - The components of a unit (unit name, subscript, and exponent) can be
#'   fully or partially italicized/emboldened by surrounding text with `"*"` or
#'   `"**"`
#'
#' @section Examples:
#'
#' Let's analyze some [`pizzaplace`] data with **dplyr** and then make a **gt**
#' table. Here we are separately defining new column labels with [cols_label()]
#' and then defining the units (to combine to those labels) through
#' `cols_units()`. The default pattern for combination is `"{1}, {2}"` which
#' is acceptable here.
#'
#' ```r
#' pizzaplace |>
#'   dplyr::mutate(month = lubridate::month(date, label = TRUE, abbr = TRUE)) |>
#'   dplyr::group_by(month) |>
#'   dplyr::summarize(
#'     n_sold = dplyr::n(),
#'     rev = sum(price)
#'   ) |>
#'   dplyr::mutate(chg = (rev - dplyr::lag(rev)) / dplyr::lag(rev)) |>
#'   dplyr::mutate(month = as.character(month)) |>
#'   gt(rowname_col = "month") |>
#'   fmt_integer(columns = n_sold) |>
#'   fmt_currency(columns = rev, use_subunits = FALSE) |>
#'   fmt_percent(columns = chg) |>
#'   sub_missing() |>
#'   cols_label(
#'     n_sold = "Number of Pizzas Sold",
#'     rev = "Revenue Generated",
#'     chg = "Monthly Changes in Revenue"
#'   ) |>
#'   cols_units(
#'     n_sold = "units month^-1",
#'     rev = "USD month^-1",
#'     chg = "% change *m*/*m*"
#'   ) |>
#'   cols_width(
#'     stub() ~ px(40),
#'     everything() ~ px(200)
#'   )
#' ```
#'
#' \if{html}{\out{
#' `r man_get_image_tag(file = "man_cols_units_1.png")`
#' }}
#'
#' The [`sza`] dataset has a wealth of information and here we'll generate
#' a smaller table that contains the average solar zenith angles at noon for
#' different months and at different northern latitudes. The column labels are
#' numbers representing the latitudes and it's convenient to apply units
#' of 'degrees north' to each of them with `cols_units()`. The extra thing we
#' wanted to do here was to ensure that the units are placed directly after
#' the column labels, and we do that with `.units_pattern = "{1}{2}"`. This
#' append the units (`"{2}"`) right to the column label (`"{1}"`).
#'
#' ```r
#' sza |>
#'   dplyr::filter(tst == "1200") |>
#'   dplyr::select(-tst) |>
#'   dplyr::arrange(desc(latitude)) |>
#'   tidyr::pivot_wider(
#'     names_from = latitude,
#'     values_from = sza
#'   ) |>
#'   gt(rowname_col = "month") |>
#'   cols_units(
#'     everything() ~ ":degree:N",
#'     .units_pattern = "{1}{2}"
#'   ) |>
#'   tab_spanner(
#'     label = "Solar Zenith Angle",
#'     columns = everything()
#'   ) |>
#'   text_transform(
#'     fn = toupper,
#'     locations = cells_stub()
#'   ) |>
#'   tab_style(
#'     style = cell_text(align = "right"),
#'     locations = cells_stub()
#'   )
#' ```
#'
#' \if{html}{\out{
#' `r man_get_image_tag(file = "man_cols_units_2.png")`
#' }}
#'
#' Taking a portion of the [`towny`] dataset, let's use spanners to describe
#' what's in the columns and use only measurement units for the column labels.
#' The columns labels that have to do with population and density information
#' will be replaced with units defined in `cols_units()`. We'll use a
#' `.units_pattern` value of `"{2}"`, which means that only the units will
#' be present (the `"{1}"`, representing the column label text, is omitted).
#' Spanners added through several invocations of [tab_spanner()] will declare
#' what the last four columns contain.
#'
#' ```r
#' towny |>
#'   dplyr::select(
#'     name, land_area_km2,
#'     ends_with("2016"), ends_with("2021")
#'   ) |>
#'   dplyr::arrange(desc(population_2021)) |>
#'   dplyr::slice_head(n = 10) |>
#'   gt(rowname_col = "name") |>
#'   tab_stubhead(label = "City") |>
#'   fmt_integer() |>
#'   cols_label(
#'     land_area_km2 ~ "Area, {{km^2}}",
#'     starts_with("population") ~ "",
#'     starts_with("density") ~ ""
#'   ) |>
#'   cols_units(
#'     starts_with("population") ~ "*ppl*",
#'     starts_with("density") ~ "*ppl* km^-2",
#'     .units_pattern = "{2}"
#'   ) |>
#'   tab_spanner(
#'     label = "Population",
#'     columns = starts_with("population"),
#'     gather = FALSE
#'   ) |>
#'   tab_spanner(
#'     label = "Density",
#'     columns = starts_with("density"),
#'     gather = FALSE
#'   ) |>
#'   tab_spanner(
#'     label = "2016",
#'     columns = ends_with("2016"),
#'     gather = FALSE
#'   ) |>
#'   tab_spanner(
#'     label = "2021",
#'     columns = ends_with("2021"),
#'     gather = FALSE
#'   ) |>
#'   tab_style(
#'     style = cell_text(align = "center"),
#'     locations = cells_column_labels(
#'       c(starts_with("population"), starts_with("density"))
#'     )
#'   ) |>
#'   cols_width(everything() ~ px(120)) |>
#'   opt_horizontal_padding(scale = 3)
#' ```
#'
#' \if{html}{\out{
#' `r man_get_image_tag(file = "man_cols_units_3.png")`
#' }}
#'
#' @family column modification functions
#' @section Function ID:
#' 5-6
#'
#' @section Function Introduced:
#' *In Development*
#'
#' @import rlang
#' @export
cols_units <- function(
    .data,
    ...,
    .list = list2(...),
    .units_pattern = NULL
) {

  # Perform input object validation
  stop_if_not_gt_tbl(data = .data)

  # Collect a list of column units
  units_list <- .list

  column_vars <- dt_boxhead_get_vars(data = .data)

  # If nothing is provided, return `data` unchanged
  if (length(units_list) == 0) {
    return(.data)
  }

  for (i in seq_along(units_list)) {

    units_i <- units_list[i]

    # When input is provided as a list in `.list`, we obtain named vectors;
    # upgrade this to a list to match the input collected from `...`
    if (rlang::is_named(units_i) && rlang::is_scalar_vector(units_i)) {
      units_i <- as.list(units_i)
    }

    if (
      is.list(units_i) &&
      rlang::is_named(units_i) &&
      rlang::is_scalar_vector(units_i[[1]])
    ) {

      # Get column and value
      columns <- names(units_i)
      new_units <- units_i[[1]]

      if (!(columns %in% column_vars)) {
        cli::cli_abort(c(
          "The column name supplied to `cols_units()` (`{columns}`) is not valid.",
          "*" = "Include column names or a tidyselect statement on the LHS."
        ))
      }

    } else if (
      is.list(units_i) &&
      rlang::is_formula(units_i[[1]])
    ) {

      units_i <- units_i[[1]]

      cols <- rlang::f_lhs(units_i)

      if (is.null(cols)) {
        cli::cli_abort(c(
          "A formula supplied to `cols_units()` must be two-sided.",
          "*" = "Include column names or a tidyselect statement on the LHS."
        ))
      }

      # The default use of `resolve_cols_c()` won't work here if there
      # is a table stub column (because we need to be able to set the
      # stub column width and, by default, `resolve_cols_c()` excludes
      # the stub); to prevent this exclusion, we set `excl_stub` to FALSE
      columns <-
        resolve_cols_c(
          expr = !!cols,
          data = .data
        )

      new_units <- rlang::eval_tidy(rlang::f_rhs(units_i))
    }

    for (j in seq_along(columns)) {

      # For each of the resolved columns, add the units text to the boxhead
      .data <-
        dt_boxhead_edit_column_units(
          data = .data,
          var = columns[j],
          column_units = new_units
        )

      if (!is.null(.units_pattern) && !is.na(.units_pattern)) {

        .data <-
          dt_boxhead_edit_column_pattern(
            data = .data,
            var = columns[j],
            column_pattern = .units_pattern
          )
      }
    }
  }

  .data
}

#' Add one or more columns to a **gt** table
#'
#' @description
#'
#' We can add new columns to a table with the `cols_add()` function and it works
#' quite a bit like the **dplyr** `mutate()` function. The idea is that you
#' supply name-value pairs where the name is the new column name and the value
#' part describes the data that will go into the column. The latter can:
#' (1) be a vector where the length of the number of rows in the data table,
#' (2) be a single value (which will be repeated all the way down), or (3)
#' involve other columns in the table (as they represent vectors of the correct
#' length). The new columns are added to the end of the column series by default
#' but can instead be added internally by using either the `.before` or `.after`
#' arguments. If entirely empty (i.e., all `NA`) columns need to be added, you
#' can use any of the `NA` types (e.g., `NA`, `NA_character_`, `NA_real_`, etc.)
#' for such columns.
#'
#' @param .data *The gt table data object*
#'
#'   `obj:<gt_tbl>` // **required**
#'
#'   This is the **gt** table object that is commonly created through use of the
#'   [gt()] function.
#'
#' @param ... *Cell data assignments*
#'
#'   `<multiple expressions>` // (or, use `.list`)
#'
#'   Expressions for the assignment of cell values to the new columns.
#'   Name-value pairs, in the form of `<column> = <value vector>` will work, so
#'   long as any `<column>` value does not already exist in the table. The
#'   `<value vector>` may be an expression that uses one or more column names in
#'   the table to generate a vector of values. Single values in `<value vector>`
#'   will be repeated down the new column. A vector where the length is exactly
#'   the number of rows in the table can also be used.
#'
#' @param .before,.after *Column used as anchor*
#'
#'   `<column-targeting expression>` // *default:* `NULL` (`optional`)
#'
#'   A single column-resolving expression or column index an be given to either
#'   `.before` or `.after`. The column specifies where the new columns should be
#'   positioned among the existing columns in the input data table. While select
#'   helper functions such as [starts_with()] and [ends_with()] can be used for
#'   column targeting, it's recommended that a single column name or index be
#'   used. This is to ensure that exactly one column is provided to either of
#'   these arguments (otherwise, the function will be stopped). If nothing is
#'   provided for either argument then any new column will be placed at the end
#'   of the column series.
#'
#' @return An object of class `gt_tbl`.
#'
#' @section Targeting the column for insertion with `.before` or `.after`:
#'
#' The targeting of a column for insertion is done through the `.before` or
#' `.after` arguments (only one of these options should be be used). While
#' **tidyselect**-style expressions or indices can used to target a column, it's
#' advised that a single column name be used. This is to avoid the possibility
#' of inadvertently resolving multiple columns (since the requirement is for a
#' single column).
#'
#' @section Examples:
#'
#' Let's take a subset of the [`exibble`] dataset and make a simple **gt** table
#' with it (using the `row` column for labels in the stub). We'll add a single
#' column to the right of all the existing columns and call it `country`. This
#' new column needs eight values and these will be supplied when using
#' `cols_add()`.
#'
#' ```r
#' exibble |>
#'   dplyr::select(num, char, datetime, currency, group) |>
#'   gt(rowname_col = "row") |>
#'   cols_add(
#'     country = c("TL", "PY", "GL", "PA", "MO", "EE", "CO", "AU")
#'   )
#' ```
#'
#' \if{html}{\out{
#' `r man_get_image_tag(file = "man_cols_add_1.png")`
#' }}
#'
#' We can add multiple columns with a single use of `cols_add()`. The columns
#' generated can be formatted and otherwise manipulated just as any column could
#' be in a **gt** table. The following example extends the first one by adding
#' more columns and immediately using them in various function calls like
#' [fmt_flag()] and [fmt_units()].
#'
#' ```r
#' exibble |>
#'   dplyr::select(num, char, datetime, currency, group) |>
#'   gt(rowname_col = "row") |>
#'   cols_add(
#'     country = c("TL", "PY", "GL", "PA", "MO", "EE", "CO", "AU"),
#'     empty = NA_character_,
#'     units = c(
#'       "k m s^-2", "N m^-2", "degC", "m^2 kg s^-2",
#'       "m^2 kg s^-3", "/s", "A s", "m^2 kg s^-3 A^-1"
#'     ),
#'     big_num = num ^ 3
#'   ) |>
#'   fmt_flag(columns = country) |>
#'   sub_missing(columns = empty, missing_text = "") |>
#'   fmt_units(columns = units) |>
#'   fmt_scientific(columns = big_num)
#' ```
#'
#' \if{html}{\out{
#' `r man_get_image_tag(file = "man_cols_add_2.png")`
#' }}
#'
#' In this table generated from a portion of the [`towny`] dataset, we add two
#' new columns (`land_area` and `density`) through a single use of `cols_add()`.
#' The new `land_area` column is a conversion of land area from square
#' kilometers to square miles and the `density` column is calculated by through
#' division of `population_2021` by that new `land_area` column. We hide the
#' now unneeded `land_area_km2` with [cols_hide()] and also perform some column
#' labeling and adjustments to column widths with [cols_label()] and
#' [cols_width()].
#'
#' ```r
#' towny |>
#'   dplyr::select(name, population_2021, land_area_km2) |>
#'   dplyr::filter(population_2021 > 100000) |>
#'   dplyr::arrange(desc(population_2021)) |>
#'   dplyr::slice_head(n = 10) |>
#'   gt() |>
#'   cols_add(
#'     land_area = land_area_km2 / 2.58998811,
#'     density = population_2021 / land_area
#'   ) |>
#'   fmt_integer() |>
#'   cols_hide(columns = land_area_km2) |>
#'   cols_label(
#'     population_2021 = "Population",
#'     density = "Density, {{*persons* / sq mi}}",
#'     land_area ~ "Area, {{mi^2}}"
#'   ) |>
#'   cols_width(everything() ~ px(120))
#' ```
#'
#' \if{html}{\out{
#' `r man_get_image_tag(file = "man_cols_add_3.png")`
#' }}
#'
#' It's possible to start with an empty table (i.e., no columns and no rows) and
#' add one or more columns to that. You can, for example, use `dplyr::tibble()`
#' or `data.frame()` to create a completely empty table. The first `cols_add()`
#' call for an empty table can have columns of arbitrary length but subsequent
#' uses of `cols_add()` must adhere to the rule of new columns being the same
#' length as existing.
#'
#' ```r
#' dplyr::tibble() |>
#'   gt() |>
#'   cols_add(
#'     num = 1:5,
#'     chr = vec_fmt_spelled_num(1:5)
#'   )
#' ```
#'
#' \if{html}{\out{
#' `r man_get_image_tag(file = "man_cols_add_4.png")`
#' }}
#'
#' Tables can contain no rows, yet have columns. In the following example, we'll
#' create a zero-row table with three columns (`num`, `chr`, and `ext`) and
#' perform the same `cols_add()`-based addition of two columns of data. This is
#' another case where the function allows for arbitrary-length columns (since
#' always adding zero-length columns is impractical). Furthermore, here we can
#' reference columns that already exist (`num` and `chr`) and add values to
#' them.
#'
#' ```r
#' dplyr::tibble(
#'   num = numeric(0),
#'   chr = character(0),
#'   ext = character(0)
#' ) |>
#'   gt() |>
#'   cols_add(
#'     num = 1:5,
#'     chr = vec_fmt_spelled_num(1:5)
#'   )
#' ```
#'
#' \if{html}{\out{
#' `r man_get_image_tag(file = "man_cols_add_5.png")`
#' }}
#'
#' We should note that the `ext` column did not receive any values from
#' `cols_add()` but the table was expanded to having five rows nonetheless. So,
#' each cell of `ext` was by necessity filled with an `NA` value.
#'
#' @family column modification functions
#' @section Function ID:
#' 5-7
#'
#' @section Function Introduced:
#' *In Development*
#'
#' @import rlang
#' @export
cols_add <- function(
    .data,
    ...,
    .before = NULL,
    .after = NULL
) {

  # Perform input object validation
  stop_if_not_gt_tbl(data = .data)

  # Get the table's boxhead
  boxh_df <- dt_boxhead_get(data = .data)

  # Get the internal dataset and a vector of its column names
  data_tbl <- dt_data_get(data = .data)
  data_tbl_columns <- colnames(data_tbl)

  #
  # Special case where data table has no columns (and perhaps no rows); here,
  # we allow for one or more columns to be added with an arbitrary number of
  # rows, however, the number of rows should be consistent across the supplied
  # columns
  #

  if (nrow(data_tbl) < 1 && ncol(data_tbl) < 1) {

    # Generate boxhead rows that correspond to the new columns
    updated_boxh_df <-
      dt_boxhead_get(data = gt(dplyr::as_tibble(as.data.frame(list(...)))))

    # Modify the internal boxhead data frame
    .data <- dt_boxhead_set(data = .data, boxh = updated_boxh_df)

    # Manually add rows to the empty data table (if there are indeed some rows)
    if (nrow(dplyr::as_tibble(as.data.frame(list(...)))) > 0) {

      .data <-
        dt_data_add_rows(
          data = .data,
          row_data_list = list(...),
          before = NULL,
          after = NULL
        )
    }

    # Update the internal data table object
    .data <-
      dt_data_set(
        data = .data,
        data_tbl = dplyr::as_tibble(as.data.frame(list(...)))
      )

    return(.data)
  }

  #
  # Special case where data table has some columns (but no rows); here, we allow
  # for one or more columns to be added with an arbitrary number of rows,
  # however, the number of rows should be consistent across the supplied columns
  #

  if (nrow(data_tbl) < 1 && ncol(data_tbl) > 0) {

    # Generate boxhead rows that correspond to the new columns
    updated_boxh_df <-
      dt_boxhead_get(data = gt(dplyr::as_tibble(as.data.frame(list(...)))))

    updated_boxh_df <-
      dplyr::bind_rows(
        dt_boxhead_get(data = .data),
        updated_boxh_df[
          !(updated_boxh_df$var %in% dt_boxhead_get(data = .data)[["var"]]),
        ]
      )

    # Modify the internal boxhead data frame
    .data <- dt_boxhead_set(data = .data, boxh = updated_boxh_df)

    # Determine whether the supplied set of values is zero length
    row_data_list_empty <-
      all(
        vapply(
          seq_along(list(...)),
          FUN.VALUE = logical(1),
          USE.NAMES = FALSE,
          FUN = function(x) {
            length(list(...)[[x]]) < 1
          }
        )
      )

    if (row_data_list_empty) {

      # Bind the zero-row tables together
      updated_data_tbl <-
        dplyr::bind_cols(
          dt_data_get(data = .data),
          dplyr::as_tibble(as.data.frame(list(...)))
        )

      # Update the internal data table object
      .data <-
        dt_data_set(
          data = .data,
          data_tbl = updated_data_tbl
        )

      return(.data)
    }

    # Manually add rows to the empty data table (if there are indeed some rows)
    if (nrow(dplyr::as_tibble(as.data.frame(list(...)))) > 0) {

      .data <-
        dt_data_add_rows(
          data = .data,
          row_data_list = list(...),
          before = NULL,
          after = NULL
        )
    }

    return(.data)
  }

  # Mutate the internal data table and get a vector of its column names
  data_tbl_mutated <- dplyr::mutate(data_tbl, ...)
  data_tbl_mutated_columns <- colnames(data_tbl_mutated)

  #
  # If the number of columns in the mutated table is not at least one
  # larger than the non-mutated table then return the data unchanged
  #

  column_count_diff <-
    length(data_tbl_mutated_columns) - length(data_tbl_columns)

  if (column_count_diff < 1) {
    return(.data)
  }

  # Determine which columns are new in the mutated table
  columns_new <- base::setdiff(data_tbl_mutated_columns, data_tbl_columns)

  # Generate a table that has only the new columns
  data_tbl_new_cols <-
    dplyr::select(data_tbl_mutated, dplyr::all_of(columns_new))

  # Generate boxhead rows that correspond to the new columns
  boxh_df_new_cols <- dt_boxhead_get(data = gt(data_tbl_new_cols))

  #
  # Resolve any `.before` or `.after` column and stop function upon
  # observing any inconsistencies
  #

  resolved_column_before <-
    resolve_cols_c(
      expr = {{ .before }},
      data = .data,
      null_means = "nothing"
    )

  if (length(resolved_column_before) < 1) {
    resolved_column_before <- NULL
  }

  if (
    !is.null(resolved_column_before) &&
    length(resolved_column_before) != 1
  ) {

    if (length(resolved_column_before) < 1) {
      cli::cli_abort("The expression used for `.before` did not resolve a column.")
    }

    if (length(resolved_column_before) > 1) {
      cli::cli_abort("The expression used for `.before` resolved multiple columns.")
    }
  }

  resolved_column_after <-
    resolve_cols_c(
      expr = {{ .after }},
      data = .data,
      null_means = "nothing"
    )

  if (length(resolved_column_after) < 1) {
    resolved_column_after <- NULL
  }

  if (
    !is.null(resolved_column_after) &&
    length(resolved_column_after) != 1
  ) {

    if (length(resolved_column_after) < 1) {
      cli::cli_abort("The expression used for `.after` did not resolve a column.")
    }

    if (length(resolved_column_after) > 1) {
      cli::cli_abort("The expression used for `.after` resolved multiple columns.")
    }
  }

  # Stop function if expressions are given to both `.before` and `.after`
  if (!is.null(resolved_column_before) && !is.null(resolved_column_after)) {
    cli::cli_abort("Expressions cannot be given to both `.before` and `.after`.")
  }

  #
  # Prepend, insert, or append the new data columns (`data_tbl_new_cols`)
  # to those existing in `data_tbl`
  #

  # Get the first and last column names from `data_tbl`
  first_colname <- colnames(data_tbl)[1]
  last_colname <- colnames(data_tbl)[ncol(data_tbl)]

  if (is.null(resolved_column_before) && is.null(resolved_column_after)) {

    updated_data_tbl <-
      dplyr::bind_cols(
        data_tbl,
        data_tbl_new_cols
      )

    updated_boxh_df <-
      dplyr::bind_rows(
        boxh_df,
        boxh_df_new_cols
      )

  } else if (!is.null(resolved_column_before) && is.null(resolved_column_after)) {

    before_colnum <- which(colnames(data_tbl) == resolved_column_before)

    updated_data_tbl <-
      dplyr::bind_cols(
        dplyr::select(data_tbl, 1:(before_colnum - 1)),
        data_tbl_new_cols,
        dplyr::select(data_tbl, before_colnum:ncol(data_tbl))
      )

    before_colnum <- which(boxh_df[["var"]] == resolved_column_before)

    updated_boxh_df <-
      dplyr::bind_rows(
        boxh_df[(1:before_colnum) - 1, ],
        boxh_df_new_cols,
        boxh_df[before_colnum:nrow(boxh_df), ]
      )

  } else if (is.null(resolved_column_before) && !is.null(resolved_column_after)) {

    if (resolved_column_after == nrow(data_tbl)) {

      updated_data_tbl <-
        dplyr::bind_cols(
          data_tbl,
          data_tbl_new_cols
        )

      updated_boxh_df <-
        dplyr::bind_rows(
          boxh_df,
          boxh_df_new_cols
        )

    } else {

      after_colnum <- which(colnames(data_tbl) == resolved_column_after)

      updated_data_tbl <-
        dplyr::bind_cols(
          dplyr::select(data_tbl, 1:after_colnum),
          data_tbl_new_cols,
          dplyr::select(data_tbl, (after_colnum + 1):ncol(data_tbl))
        )

      after_colnum <- which(boxh_df[["var"]] == resolved_column_after)

      updated_boxh_df <-
        dplyr::bind_rows(
          boxh_df[1:after_colnum, ],
          boxh_df_new_cols,
          boxh_df[(after_colnum + 1):nrow(boxh_df), ]
        )
    }
  }

  # Modify the internal datasets
  .data <- dt_data_set(data = .data, data_tbl = updated_data_tbl)
  .data <- dt_boxhead_set(data = .data, boxh = updated_boxh_df)

  .data
}

#' Move one or more columns
#'
#' @description
#'
#' On those occasions where you need to move columns this way or that way, we
#' can make use of the `cols_move()` function. While it's true that the movement
#' of columns can be done upstream of **gt**, it is much easier and less error
#' prone to use the function provided here. The movement procedure here takes
#' one or more specified columns (in the `columns` argument) and places them to
#' the right of a different column (the `after` argument). The ordering of the
#' `columns` to be moved is preserved, as is the ordering of all other columns
#' in the table.
#'
#' @inheritParams cols_align
#'
#' @param columns *Columns to target*
#'
#'   `<column-targeting expression>` // *default:* `everything()`
#'
#'   The columns for which the moving operations should be applied. Can either
#'   be a series of column names provided in [c()], a vector of column indices,
#'   or a select helper function. Examples of select helper functions include
#'   [starts_with()], [ends_with()], [contains()], [matches()], [one_of()],
#'   [num_range()], and [everything()]. The columns move as a group to a
#'   different position. The order of the remaining columns will be preserved.
#'
#' @param after *Column used as anchor*
#'
#'   `<column-targeting expression>` // **required**
#'
#'   The column used to anchor the insertion of the moved columns. All of the
#'   moved columns will be placed to the right of this column. While select
#'   helper functions such as [starts_with()] and [ends_with()] can be used for
#'   column targeting, it's recommended that a single column name be used. This
#'   is to ensure that exactly one column is provided here.
#'
#' @return An object of class `gt_tbl`.
#'
#' @details
#'
#' The columns supplied in `columns` must all exist in the table and none of
#' them can be in the `after` argument. The `after` column must also exist and
#' only one column should be provided here. If you need to place one or columns
#' at the beginning of the column series, the [cols_move_to_start()] function
#' should be used. Similarly, if those columns to move should be placed at the
#' end of the column series then use [cols_move_to_end()].
#'
#' @section Examples:
#'
#' Use the [`countrypops`] dataset to create a **gt** table. We'll choose to
#' position the `population` column after the `country_name` column by using the
#' `cols_move()` function.
#'
#' ```r
#' countrypops |>
#'   dplyr::select(-contains("code")) |>
#'   dplyr::filter(country_name == "Japan") |>
#'   dplyr::slice_tail(n = 10) |>
#'   gt() |>
#'   cols_move(
#'     columns = population,
#'     after = country_name
#'   ) |>
#'   fmt_integer(columns = population)
#' ```
#'
#' \if{html}{\out{
#' `r man_get_image_tag(file = "man_cols_move_1.png")`
#' }}
#'
#' @family column modification functions
#' @section Function ID:
#' 5-8
#'
#' @section Function Introduced:
#' `v0.2.0.5` (March 31, 2020)
#'
#' @import rlang
#' @export
cols_move <- function(
    data,
    columns,
    after
) {

  # Perform input object validation
  stop_if_not_gt_tbl(data = data)

  # Get the columns supplied in `columns` as a character vector
  columns <-
    resolve_cols_c(
      expr = {{ columns }},
      data = data
    )

  # Get the `after` columns as a character vector
  after <-
    resolve_cols_c(
      expr = {{ after }},
      data = data
    )

  vars <- dt_boxhead_get_vars(data = data)

  # Stop function if `after` contains multiple columns
  if (length(after) > 1) {
    cli::cli_abort("Only one column name should be supplied to `after`.")
  }

  # Stop function if `after` doesn't exist in `vars`
  if (!(after %in% vars)) {
    cli::cli_abort(
      "The column supplied to `after` doesn't exist in the input `data` table."
    )
  }

  # Stop function if no `columns` are provided
  if (length(columns) == 0) {
    cli::cli_abort("Columns must be provided.")
  }

  # Stop function if any of the `columns` don't exist in `vars`
  if (!all(columns %in% vars)) {
    cli::cli_abort(
      "All `columns` must exist and be visible in the input `data` table."
    )
  }

  # Get the remaining column names in the table
  moving_columns <- setdiff(columns, after)
  other_columns <- base::setdiff(vars, moving_columns)

  # Get the column index for where the set
  # of `columns` should be inserted after
  after_index <- which(other_columns == after)

  new_vars <- append(other_columns, moving_columns, after = after_index)

  dt_boxhead_set_var_order(
    data = data,
    vars = new_vars
  )
}

#' Move one or more columns to the start
#'
#' @description
#'
#' We can easily move set of columns to the beginning of the column series and
#' we only need to specify which `columns`. It's possible to do this upstream of
#' **gt**, however, it is easier with this function and it presents less
#' possibility for error. The ordering of the `columns` that are moved to the
#' start is preserved (same with the ordering of all other columns in the
#' table).
#'
#' @inheritParams cols_align
#'
#' @param columns *Columns to target*
#'
#'   `<column-targeting expression>` // *default:* `everything()`
#'
#'   The columns for which the moving operations should be applied. Can either
#'   be a series of column names provided in [c()], a vector of column indices,
#'   or a select helper function. Examples of select helper functions include
#'   [starts_with()], [ends_with()], [contains()], [matches()], [one_of()],
#'   [num_range()], and [everything()]. The columns move as a group to the
#'   left-most side of the table. The order of the remaining columns will be
#'   preserved.
#'
#' @return An object of class `gt_tbl`.
#'
#' @details
#'
#' The columns supplied in `columns` must all exist in the table. If you need to
#' place one or columns at the end of the column series, the
#' [cols_move_to_end()] function should be used. More control is offered with
#' the [cols_move()] function, where columns could be placed after a specific
#' column.
#'
#' @section Examples:
#'
#' For this example, we'll use a portion of the [`countrypops`] dataset to
#' create a simple **gt** table. Let's move the `year` column, which is the
#' middle column, to the start of the column series with the
#' `cols_move_to_start()` function.
#'
#' ```r
#' countrypops |>
#'   dplyr::select(-contains("code")) |>
#'   dplyr::filter(country_name == "Fiji") |>
#'   dplyr::slice_tail(n = 5) |>
#'   gt() |>
#'   cols_move_to_start(columns = year)
#' ```
#'
#' \if{html}{\out{
#' `r man_get_image_tag(file = "man_cols_move_to_start_1.png")`
#' }}
#'
#' We can also move multiple columns at a time. With the same
#' [`countrypops`]-based table, let's move both the `year` and `population`
#' columns to the start of the column series.
#'
#' ```r
#' countrypops |>
#'   dplyr::select(-contains("code")) |>
#'   dplyr::filter(country_name == "Fiji") |>
#'   dplyr::slice_tail(n = 5) |>
#'   gt() |>
#'   cols_move_to_start(columns = c(year, population))
#' ```
#'
#' \if{html}{\out{
#' `r man_get_image_tag(file = "man_cols_move_to_start_2.png")`
#' }}
#'
#' @family column modification functions
#' @section Function ID:
#' 5-9
#'
#' @section Function Introduced:
#' `v0.2.0.5` (March 31, 2020)
#'
#' @import rlang
#' @export
cols_move_to_start <- function(
    data,
    columns
) {

  # Perform input object validation
  stop_if_not_gt_tbl(data = data)

  vars <- dt_boxhead_get_vars(data = data)

  # Get the columns supplied in `columns` as a character vector
  columns <-
    resolve_cols_c(
      expr = {{ columns }},
      data = data
    )

  # Stop function if no `columns` are provided
  if (length(columns) == 0) {
    cli::cli_abort("Columns must be provided.")
  }

  # Stop function if any of the `columns` don't exist in `vars`
  if (!all(columns %in% vars)) {
    cli::cli_abort(
      "All `columns` must exist and be visible in the input `data` table."
    )
  }

  # Get the remaining column names in the table
  other_columns <- base::setdiff(vars, columns)

  new_vars <- append(other_columns, columns, after = 0)

  dt_boxhead_set_var_order(
    data = data,
    vars = new_vars
  )
}

#' Move one or more columns to the end
#'
#' @description
#'
#' It's possible to move a set of columns to the end of the column series, we
#' only need to specify which `columns` are to be moved. While this can be done
#' upstream of **gt**, this function makes to process much easier and it's less
#' error prone. The ordering of the `columns` that are moved to the end is
#' preserved (same with the ordering of all other columns in the table).
#'
#' @inheritParams cols_align
#'
#' @param columns *Columns to target*
#'
#'   `<column-targeting expression>` // *default:* `everything()`
#'
#'   The columns for which the moving operations should be applied. Can either
#'   be a series of column names provided in [c()], a vector of column indices,
#'   or a select helper function. Examples of select helper functions include
#'   [starts_with()], [ends_with()], [contains()], [matches()], [one_of()],
#'   [num_range()], and [everything()]. The columns move as a group to the
#'   right-most side of the table. The order of the remaining columns will be
#'   preserved.
#'
#' @return An object of class `gt_tbl`.
#'
#' @details
#'
#' The columns supplied in `columns` must all exist in the table. If you need to
#' place one or columns at the start of the column series, the
#' [cols_move_to_start()] function should be used. More control is offered with
#' the [cols_move()] function, where columns could be placed after a specific
#' column.
#'
#' @section Examples:
#'
#' For this example, we'll use a portion of the [`countrypops`] dataset to
#' create a simple **gt** table. Let's move the `year` column, which is the
#' middle column, to the end of the column series with the
#' `cols_move_to_end()` function.
#'
#' ```r
#' countrypops |>
#'   dplyr::select(-contains("code")) |>
#'   dplyr::filter(country_name == "Benin") |>
#'   dplyr::slice_tail(n = 5) |>
#'   gt() |>
#'   cols_move_to_end(columns = year)
#' ```
#'
#' \if{html}{\out{
#' `r man_get_image_tag(file = "man_cols_move_to_end_1.png")`
#' }}
#'
#' We can also move multiple columns at a time. With the same
#' [`countrypops`]-based table, let's move both the `year` and `population`
#' columns to the end of the column series.
#'
#' ```r
#' countrypops |>
#'   dplyr::select(-contains("code")) |>
#'   dplyr::filter(country_name == "Benin") |>
#'   dplyr::slice_tail(n = 5) |>
#'   gt() |>
#'   cols_move_to_end(columns = c(year, country_name))
#' ```
#'
#' \if{html}{\out{
#' `r man_get_image_tag(file = "man_cols_move_to_end_2.png")`
#' }}
#'
#' @family column modification functions
#' @section Function ID:
#' 5-10
#'
#' @section Function Introduced:
#' `v0.2.0.5` (March 31, 2020)
#'
#' @import rlang
#' @export
cols_move_to_end <- function(
    data,
    columns
) {

  # Perform input object validation
  stop_if_not_gt_tbl(data = data)

  vars <- dt_boxhead_get_vars(data = data)

  # Get the columns supplied in `columns` as a character vector
  columns <-
    resolve_cols_c(
      expr = {{ columns }},
      data = data
    )

  # Stop function if no `columns` are provided
  if (length(columns) == 0) {
    cli::cli_abort("Columns must be provided.")
  }

  # Stop function if any of the `columns` don't exist in `vars`
  if (!all(columns %in% vars)) {
    cli::cli_abort(
      "All `columns` must exist and be visible in the input `data` table."
    )
  }

  # Get the remaining column names in the table
  other_columns <- base::setdiff(vars, columns)

  new_vars <- append(other_columns, columns)

  dt_boxhead_set_var_order(
    data = data,
    vars = new_vars
  )
}

#' Hide one or more columns
#'
#' @description
#'
#' The `cols_hide()` function allows us to hide one or more columns from
#' appearing in the final output table. While it's possible and often desirable
#' to omit columns from the input table data before introduction to the [gt()]
#' function, there can be cases where the data in certain columns is useful (as
#' a column reference during formatting of other columns) but the final display
#' of those columns is not necessary.
#'
#' @inheritParams cols_align
#'
#' @param columns *Columns to target*
#'
#'   `<column-targeting expression>` // *default:* `everything()`
#'
#'   The columns to hide in the output display table. Can either be a series of
#'   column names provided in [c()], a vector of column indices, or a select
#'   helper function. Examples of select helper functions include
#'   [starts_with()], [ends_with()], [contains()], [matches()], [one_of()],
#'   [num_range()], and [everything()].
#'
#' @return An object of class `gt_tbl`.
#'
#' @details
#'
#' The hiding of columns is internally a rendering directive, so, all columns
#' that are 'hidden' are still accessible and useful in any expression provided
#' to a `rows` argument. Furthermore, the `cols_hide()` function (as with many
#' **gt** functions) can be placed anywhere in a pipeline of **gt** function
#' calls (acting as a promise to hide columns when the timing is right). However
#' there's perhaps greater readability when placing this call closer to the end
#' of such a pipeline. The `cols_hide()` function quietly changes the visible
#' state of a column (much like the [cols_unhide()] function) and doesn't yield
#' warnings or messages when changing the state of already-invisible columns.
#'
#' @section Examples:
#'
#' Let's use a small portion of the [`countrypops`] dataset to create a **gt**
#' table. We can hide the `country_code_2` and `country_code_3` columns with the
#' `cols_hide()` function.
#'
#' ```r
#' countrypops |>
#'   dplyr::filter(country_name == "Egypt") |>
#'   dplyr::slice_tail(n = 5) |>
#'   gt() |>
#'   cols_hide(columns = c(country_code_2, country_code_3))
#' ```
#'
#' \if{html}{\out{
#' `r man_get_image_tag(file = "man_cols_hide_1.png")`
#' }}
#'
#' Using another [`countrypops`]-based **gt** table, we can use the `population`
#' column to provide the conditional placement of footnotes. Then, we'll hide
#' that column along with the `country_code_3` column. Note that the order of
#' the `cols_hide()` and [tab_footnote()] statements has no effect on the final
#' display of the table.
#'
#' ```r
#' countrypops |>
#'   dplyr::filter(country_name == "Pakistan") |>
#'   dplyr::slice_tail(n = 5) |>
#'   gt() |>
#'   cols_hide(columns = c(country_code_3, population)) |>
#'   tab_footnote(
#'     footnote = "Population above 220,000,000.",
#'     locations = cells_body(
#'       columns = year,
#'       rows = population > 220E6
#'     )
#'   )
#' ```
#'
#' \if{html}{\out{
#' `r man_get_image_tag(file = "man_cols_hide_2.png")`
#' }}
#'
#' @family column modification functions
#' @section Function ID:
#' 5-11
#'
#' @section Function Introduced:
#' `v0.2.0.5` (March 31, 2020)
#'
#' @seealso [cols_unhide()] to perform the inverse operation.
#'
#' @import rlang
#' @export
cols_hide <- function(
    data,
    columns
) {

  # Perform input object validation
  stop_if_not_gt_tbl(data = data)

  # Get the columns supplied in `columns` as a character vector
  columns <-
    resolve_cols_c(
      expr = {{ columns }},
      data = data,
      excl_stub = FALSE
    )

  vars <- dt_boxhead_get_vars(data = data)

  # if no `columns` are provided, return data unaltered
  if (length(columns) == 0) {
    return(data)
  }

  # Stop function if any of the `columns` don't exist in `vars`
  if (!all(columns %in% vars)) {
    cli::cli_abort("All `columns` must exist in the input `data` table.")
  }

  # Set the `"hidden"` type for the `columns` in `_dt_boxhead`
  dt_boxhead_set_hidden(
    data = data,
    vars = columns
  )
}

#' Unhide one or more columns
#'
#' @description
#'
#' The `cols_unhide()` function allows us to take one or more hidden columns
#' (usually made so via the [cols_hide()] function) and make them visible
#' in the final output table. This may be important in cases where the user
#' obtains a `gt_tbl` object with hidden columns and there is motivation to
#' reveal one or more of those.
#'
#' @inheritParams cols_align
#'
#' @param columns *Columns to target*
#'
#'   `<column-targeting expression>` // *default:* `everything()`
#'
#'   The columns to unhide in the output display table. Can either be a series
#'   of column names provided in [c()], a vector of column indices, or a select
#'   helper function. Examples of select helper functions include
#'   [starts_with()], [ends_with()], [contains()], [matches()], [one_of()],
#'   [num_range()], and [everything()].
#'
#' @return An object of class `gt_tbl`.
#'
#' @details
#'
#' The hiding and unhiding of columns is internally a rendering directive, so,
#' all columns that are 'hidden' are still accessible and useful in any
#' expression provided to a `rows` argument. The `cols_unhide()` function
#' quietly changes the visible state of a column (much like the [cols_hide()]
#' function) and doesn't yield warnings or messages when changing the state of
#' already-visible columns.
#'
#' @section Examples:
#'
#' Let's use a small portion of the [`countrypops`] dataset to create a **gt**
#' table. We'll hide the `country_code_2` and `country_code_3` columns with the
#' [cols_hide()] function.
#'
#' ```r
#' tab_1 <-
#'   countrypops |>
#'   dplyr::filter(country_name == "Singapore") |>
#'   dplyr::slice_tail(n = 5) |>
#'   gt() |>
#'   cols_hide(columns = c(country_code_2, country_code_3))
#'
#' tab_1
#' ```
#'
#' \if{html}{\out{
#' `r man_get_image_tag(file = "man_cols_unhide_1.png")`
#' }}
#'
#' If the `tab_1` object is provided without the code or source data to
#' regenerate it, and, the user wants to reveal otherwise hidden columns then
#' the `cols_unhide()` function becomes useful.
#'
#' ```r
#' tab_1 |> cols_unhide(columns = country_code_2)
#' ```
#'
#' \if{html}{\out{
#' `r man_get_image_tag(file = "man_cols_unhide_2.png")`
#' }}
#'
#' @family column modification functions
#' @section Function ID:
#' 5-12
#'
#' @section Function Introduced:
#' `v0.3.0` (May 12, 2021)
#'
#' @seealso [cols_hide()] to perform the inverse operation.
#'
#' @import rlang
#' @export
cols_unhide <- function(
    data,
    columns
) {

  # Perform input object validation
  stop_if_not_gt_tbl(data = data)

  # Get the columns supplied in `columns` as a character vector
  columns <-
    resolve_cols_c(
      expr = {{ columns }},
      data = data
    )

  vars <- dt_boxhead_get_vars(data = data)

  # if no `columns` are provided, return data unaltered
  if (length(columns) == 0) {
    return(data)
  }

  # Stop function if any of the `columns` don't exist in `vars`
  if (!all(columns %in% vars)) {
    cli::cli_abort("All `columns` must exist in the input `data` table.")
  }

  # Set the `"visible"` type for the `columns` in `_dt_boxhead`
  dt_boxhead_set_not_hidden(
    data = data,
    vars = columns
  )
}

#' Merge data from two or more columns to a single column
#'
#' @description
#'
#' This function takes input from two or more columns and allows the contents to
#' be merged into a single column by using a pattern that specifies the
#' arrangement. We can specify which columns to merge together in the `columns`
#' argument. The string-combining pattern is to be provided in the `pattern`
#' argument. The first column in the `columns` series operates as the target
#' column (i.e., the column that will undergo mutation) whereas all following
#' `columns` will be untouched. There is the option to hide the non-target
#' columns (i.e., second and subsequent columns given in `columns`). The
#' formatting of values in different columns will be preserved upon merging.
#'
#' @inheritParams cols_align
#'
#' @param columns *Columns to target*
#'
#'   `<column-targeting expression>` // **required**
#'
#'   The columns for which the merging operations should be applied. The first
#'   column resolved will be the target column (i.e., undergo mutation) and the
#'   other columns will serve to provide input. Can either be a series of column
#'   names provided in [c()], a vector of column indices, or a select helper
#'   function. Examples of select helper functions include [starts_with()],
#'   [ends_with()], [contains()], [matches()], [one_of()], [num_range()], and
#'   [everything()]. A vector is recommended because in that case we are
#'   absolutely certain about the order of columns, and, that order information
#'   is needed for this and other arguments.
#'
#' @param hide_columns *Subset of `columns` to hide*
#'
#'   `<column-targeting expression>|FALSE` // *default:* `columns[-1]`
#'
#'   Any column names provided here will have their state changed to `hidden`
#'   (via internal use of [cols_hide()]) if they aren't already hidden. This is
#'   convenient if the shared purpose of these specified columns is only to
#'   provide string input to the target column. To suppress any hiding of
#'   columns, `FALSE` can be used here.
#'
#' @param rows *Rows to target*
#'
#'   `<row-targeting expression>` // *default:* `everything()`
#'
#'   In conjunction with `columns`, we can specify which of their rows should
#'   participate in the merging process. The default [everything()] results in
#'   all rows in `columns` being formatted. Alternatively, we can supply a
#'   vector of row captions within [c()], a vector of row indices, or a select
#'   helper function. Examples of select helper functions include
#'   [starts_with()], [ends_with()], [contains()], [matches()], [one_of()],
#'   [num_range()], and [everything()]. We can also use expressions to filter
#'   down to the rows we need (e.g., `[colname_1] > 100 & [colname_2] < 50`).
#'
#' @param pattern *Formatting pattern*
#'
#'   `scalar<character>` // *default:* `NULL` (`optional`)
#'
#'   A formatting pattern that specifies the arrangement of the `columns` values
#'   and any string literals. The pattern uses numbers (within `{ }`) that
#'   correspond to the indices of columns provided in `columns`. If two columns
#'   are provided in `columns` and we would like to combine the cell data onto
#'   the first column, `"{1} {2}"` could be used. If a pattern isn't provided
#'   then a space-separated pattern that includes all `columns` will be
#'   generated automatically. Further details are provided in the *How the
#'   `pattern` works* section.
#'
#' @return An object of class `gt_tbl`.
#'
#' @section How the `pattern` works:
#'
#' There are two types of templating for the `pattern` string:
#'
#' 1. `{ }` for arranging single column values in a row-wise fashion
#' 2. `<< >>` to surround spans of text that will be removed if any of the
#' contained `{ }` yields a missing value
#'
#' Integer values are placed in `{ }` and those values correspond to the columns
#' involved in the merge, in the order they are provided in the `columns`
#' argument. So the pattern `"{1} ({2}-{3})"` corresponds to the target column
#' value listed first in `columns` and the second and third columns cited
#' (formatted as a range in parentheses). With hypothetical values, this might
#' result as the merged string `"38.2 (3-8)"`.
#'
#' Because some values involved in merging may be missing, it is likely that
#' something like `"38.2 (3-NA)"` would be undesirable. For such cases, placing
#' sections of text in `<< >>` results in the entire span being eliminated if
#' there were to be an `NA` value (arising from `{ }` values). We could instead
#' opt for a pattern like `"{1}<< ({2}-{3})>>"`, which results in `"38.2"` if
#' either columns `{2}` or `{3}` have an `NA` value. We can even use a more
#' complex nesting pattern like `"{1}<< ({2}-<<{3}>>)>>"` to retain a lower
#' limit in parentheses (where `{3}` is `NA`) but remove the range altogether
#' if `{2}` is `NA`.
#'
#' One more thing to note here is that if [sub_missing()] is used on values in
#' a column, those specific values affected won't be considered truly missing by
#' `cols_merge()` (since it's been handled with substitute text). So, the
#' complex pattern `"{1}<< ({2}-<<{3}>>)>>"` might result in something like
#' `"38.2 (3-limit)"` if `sub_missing(..., missing_text = "limit")` were used
#' on the third column supplied in `columns`.
#'
#' @section Comparison with other column-merging functions:
#'
#' There are three other column-merging functions that offer specialized
#' behavior that is optimized for common table tasks: [cols_merge_range()],
#' [cols_merge_uncert()], and [cols_merge_n_pct()]. These functions operate
#' similarly, where the non-target columns can be optionally hidden from the
#' output table through the `autohide` option.
#'
#' @section Examples:
#'
#' Use a subset of the [`sp500`] dataset to create a **gt** table. Use the
#' `cols_merge()` function to merge the `open` & `close` columns together, and,
#' the `low` & `high` columns (putting an em dash between both). Relabel the
#' columns with [cols_label()].
#'
#' ```r
#' sp500 |>
#'   dplyr::slice(50:55) |>
#'   dplyr::select(-volume, -adj_close) |>
#'   gt() |>
#'   cols_merge(
#'     columns = c(open, close),
#'     pattern = "{1}&mdash;{2}"
#'   ) |>
#'   cols_merge(
#'     columns = c(low, high),
#'     pattern = "{1}&mdash;{2}"
#'   ) |>
#'   cols_label(
#'     open = "open/close",
#'     low = "low/high"
#'   )
#' ```
#'
#' \if{html}{\out{
#' `r man_get_image_tag(file = "man_cols_merge_1.png")`
#' }}
#'
#' Use a portion of [`gtcars`] to create a **gt** table. Use the `cols_merge()`
#' function to merge the `trq` & `trq_rpm` columns together, and, the `mpg_c` &
#' `mpg_h` columns. Given the presence of `NA` values, we can use patterns that
#' drop parts of the output text whenever missing values are encountered.
#'
#' ```r
#' gtcars |>
#'   dplyr::filter(year == 2017) |>
#'   dplyr::select(mfr, model, starts_with(c("trq", "mpg"))) |>
#'   gt() |>
#'   fmt_integer(columns = trq_rpm) |>
#'   cols_merge(
#'     columns = starts_with("trq"),
#'     pattern = "{1}<< ({2} rpm)>>"
#'   ) |>
#'   cols_merge(
#'     columns = starts_with("mpg"),
#'     pattern = "<<{1} city<</{2} hwy>>>>"
#'   ) |>
#'   cols_label(
#'     mfr = "Manufacturer",
#'     model = "Car Model",
#'     trq = "Torque",
#'     mpg_c = "MPG"
#'   )
#' ```
#'
#' \if{html}{\out{
#' `r man_get_image_tag(file = "man_cols_merge_2.png")`
#' }}
#'
#' @family column modification functions
#' @section Function ID:
#' 5-13
#'
#' @section Function Introduced:
#' `v0.2.0.5` (March 31, 2020)
#'
#' @import rlang
#' @export
cols_merge <- function(
    data,
    columns,
    hide_columns = columns[-1],
    rows = everything(),
    pattern = NULL
) {

  # Perform input object validation
  stop_if_not_gt_tbl(data = data)

  # Get the columns supplied in `columns` as a character vector
  columns <-
    resolve_cols_c(
      expr = {{ columns }},
      data = data,
      excl_stub = FALSE
    )

  if (is.null(pattern)) {
    pattern <- paste0("{", seq_along(columns), "}", collapse = " ")
  }

  # Resolve the rows supplied in the `rows` argument
  resolved_rows_idx <-
    resolve_rows_i(
      expr = {{ rows }},
      data = data
    )

  # NOTE: It's important that `hide_columns` NOT be evaluated until after the
  # previous line has run. Otherwise, the default `hide_columns` value of
  # columns[-1] may not evaluate to a sensible result. It's also important
  # that `pattern` not be evaluated, for much the same reason as above.

  # Get the columns supplied in `hide_columns` as a character vector
  suppressWarnings(
    hide_columns <-
      resolve_cols_c(
        expr = {{ hide_columns }},
        data = data
      )
  )

  if (length(hide_columns) > 0) {

    hide_columns_from_supplied <- base::intersect(hide_columns, columns)

    if (length(base::setdiff(hide_columns, columns) > 0)) {
      cli::cli_warn(c(
        "Only a subset of columns supplied in `columns` will be hidden.",
        "*" = "Use an additional `cols_hide()` expression to hide any
        out-of-scope columns."
      ),
      .frequency = "regularly",
      .frequency_id = "cols_merge_hide_columns_scope"
      )
    }

    if (length(hide_columns_from_supplied) > 0) {

      data <-
        cols_hide(
          data = data,
          columns = hide_columns_from_supplied
        )
    }
  }

  # Create an entry and add it to the `_col_merge` attribute
  dt_col_merge_add(
    data = data,
    col_merge = dt_col_merge_entry(
      vars = columns,
      rows = resolved_rows_idx,
      type = "merge",
      pattern = pattern
    )
  )
}

#' Merge columns to a value-with-uncertainty column
#'
#' @description
#'
#' The `cols_merge_uncert()` function is a specialized variant of the
#' [cols_merge()] function. It takes as input a base value column (`col_val`)
#' and either: (1) a single uncertainty column, or (2) two columns representing
#' lower and upper uncertainty bounds. These columns will be essentially merged
#' in a single column (that of `col_val`). What results is a column with values
#' and associated uncertainties (e.g., `12.0 ± 0.1`), and any columns specified
#' in `col_uncert` are hidden from appearing the output table.
#'
#' @inheritParams cols_align
#'
#' @param col_val *Column to target for base values*
#'
#'   `<column-targeting expression>` // **required**
#'
#'   The column that contains values for the start of the range. While select
#'   helper functions such as [starts_with()] and [ends_with()] can be used for
#'   column targeting, it's recommended that a single column name be used. This
#'   is to ensure that exactly one column is provided here.
#'
#' @param col_uncert *Column or columns to target for uncertainty values*
#'
#'   `<column-targeting expression>` // **required**
#'
#'   The most common case involves supplying a single column with uncertainties;
#'   these values will be combined with those in `col_val`. Less commonly, the
#'   lower and upper uncertainty bounds may be different. For that case, two
#'   columns representing the lower and upper uncertainty values away from
#'   `col_val`, respectively, should be provided. While select helper functions
#'   such as [starts_with()] and [ends_with()] can be used for column targeting,
#'   it's recommended that one or two column names be explicitly provided in a
#'   vector.
#'
#' @param rows *Rows to target*
#'
#'   `<row-targeting expression>` // *default:* `everything()`
#'
#'   In conjunction with `columns`, we can specify which of their rows should
#'   participate in the merging process. The default [everything()] results in
#'   all rows in `columns` being formatted. Alternatively, we can supply a
#'   vector of row captions within [c()], a vector of row indices, or a select
#'   helper function. Examples of select helper functions include
#'   [starts_with()], [ends_with()], [contains()], [matches()], [one_of()],
#'   [num_range()], and [everything()]. We can also use expressions to filter
#'   down to the rows we need (e.g., `[colname_1] > 100 & [colname_2] < 50`).
#'
#' @param sep *Separator text for uncertainties*
#'
#'   `scalar<character>` // *default:* `" +/- "`
#'
#'   The separator text that contains the uncertainty mark for a single
#'   uncertainty value. The default value of `" +/- "` indicates that an
#'   appropriate plus/minus mark will be used depending on the output context.
#'   Should you want this special symbol to be taken literally, it can be
#'   supplied within the [I()] function.
#'
#' @param autohide *Automatic hiding of the `col_uncert` column(s)*
#'
#'   `scalar<logical>` // *default:* `TRUE`
#'
#'   An option to automatically hide any columns specified in `col_uncert`. Any
#'   columns with their state changed to 'hidden' will behave the same as
#'   before, they just won't be displayed in the finalized table.
#'
#' @return An object of class `gt_tbl`.
#'
#' @section Comparison with other column-merging functions:
#'
#' This function could be somewhat replicated using [cols_merge()] in the case
#' where a single column is supplied for `col_uncert`, however,
#' `cols_merge_uncert()` employs the following specialized semantics for `NA`
#' handling:
#'
#' 1. `NA`s in `col_val` result in missing values for the merged column (e.g.,
#' `NA` + `0.1` = `NA`)
#' 2. `NA`s in `col_uncert` (but not `col_val`) result in base values only for
#' the merged column (e.g., `12.0` + `NA` = `12.0`)
#' 3. `NA`s both `col_val` and `col_uncert` result in missing values for the
#' merged column (e.g., `NA` + `NA` = `NA`)
#'
#' Any resulting `NA` values in the `col_val` column following the merge
#' operation can be easily formatted using the [sub_missing()] function.
#'
#' This function is part of a set of four column-merging functions. The other
#' three are the general [cols_merge()] function and the specialized
#' [cols_merge_range()] and [cols_merge_n_pct()] functions. These functions
#' operate similarly, where the non-target columns can be optionally hidden from
#' the output table through the `hide_columns` or `autohide` options.
#'
#' @section Examples:
#'
#' Let's use the [`exibble`] dataset to create a simple, two-column **gt** table
#' (keeping only the `num` and `currency` columns). We'll format the `num`
#' column with the [fmt_number()] function. Next we merge the `currency` and
#' `num` columns into the `currency` column; this will contain a base value and
#' an uncertainty and it's all done using the `cols_merge_uncert()` function.
#' After the merging process, the column label for the `currency` column is
#' updated with [cols_label()] to better describe the content.
#'
#' ```r
#' exibble |>
#'   dplyr::select(num, currency) |>
#'   dplyr::slice(1:7) |>
#'   gt() |>
#'   fmt_number(
#'     columns = num,
#'     decimals = 3,
#'     use_seps = FALSE
#'   ) |>
#'   cols_merge_uncert(
#'     col_val = currency,
#'     col_uncert = num
#'   ) |>
#'   cols_label(currency = "value + uncert.")
#' ```
#'
#' \if{html}{\out{
#' `r man_get_image_tag(file = "man_cols_merge_uncert_1.png")`
#' }}
#'
#' @family column modification functions
#' @section Function ID:
#' 5-14
#'
#' @section Function Introduced:
#' `v0.2.0.5` (March 31, 2020)
#'
#' @import rlang
#' @export
cols_merge_uncert <- function(
    data,
    col_val,
    col_uncert,
    rows = everything(),
    sep = " +/- ",
    autohide = TRUE
) {

  # Perform input object validation
  stop_if_not_gt_tbl(data = data)

  resolved <-
    cols_merge_resolver(
      data = data,
      col_begin = {{ col_val }},
      col_end = {{ col_uncert }},
      sep = sep
    )

  # Resolve the rows supplied in the `rows` argument
  resolved_rows_idx <-
    resolve_rows_i(
      expr = {{ rows }},
      data = data
    )

  # Create an entry and add it to the `_col_merge` attribute
  data <-
    dt_col_merge_add(
      data = data,
      col_merge = dt_col_merge_entry(
        vars = resolved$columns,
        rows = resolved_rows_idx,
        type = "merge_uncert",
        pattern = resolved$pattern,
        sep = sep
      )
    )

  if (isTRUE(autohide)) {

    col_uncert <-
      resolve_cols_c(
        expr = {{ col_uncert }},
        data = data
      )

    data <-
      cols_hide(
        data = data,
        columns = col_uncert
      )
  }

  data
}

#' Merge two columns to a value range column
#'
#' @description
#'
#' The `cols_merge_range()` function is a specialized variant of the
#' [cols_merge()] function. It operates by taking a two columns that constitute
#' a range of values (`col_begin` and `col_end`) and merges them into a single
#' column. What results is a column containing both values separated by a long
#' dash (e.g., `12.0 — 20.0`). The column specified in `col_end` is dropped from
#' the output table.
#'
#' @inheritParams cols_align
#'
#' @param col_begin *Column to target for beginning of range*
#'
#'   `<column-targeting expression>` // **required**
#'
#'   The column that contains values for the start of the range. While select
#'   helper functions such as [starts_with()] and [ends_with()] can be used for
#'   column targeting, it's recommended that a single column name be used. This
#'   is to ensure that exactly one column is provided here.
#'
#' @param col_end *Column to target for end of range*
#'
#'   `<column-targeting expression>` // **required**
#'
#'   The column that contains values for the end of the range. While select
#'   helper functions such as [starts_with()] and [ends_with()] can be used for
#'   column targeting, it's recommended that a single column name be used. This
#'   is to ensure that exactly one column is provided here.
#'
#' @param rows *Rows to target*
#'
#'   `<row-targeting expression>` // *default:* `everything()`
#'
#'   In conjunction with `columns`, we can specify which of their rows should
#'   participate in the merging process. The default [everything()] results in
#'   all rows in `columns` being formatted. Alternatively, we can supply a
#'   vector of row captions within [c()], a vector of row indices, or a select
#'   helper function. Examples of select helper functions include
#'   [starts_with()], [ends_with()], [contains()], [matches()], [one_of()],
#'   [num_range()], and [everything()]. We can also use expressions to filter
#'   down to the rows we need (e.g., `[colname_1] > 100 & [colname_2] < 50`).
#'
#' @param sep *Separator text for ranges*
#'
#'   `scalar<character>` // *default:* `"--"`
#'
#'   The separator text that indicates the values are ranged. The default value
#'   of `"--"` will be transformed to an en dash for the range separator. Using
#'   `"---"` will be taken to mean that an em dash should be used. Should you
#'   want these special symbols to be taken literally, they can be supplied
#'   within the base [I()] function.
#'
#' @param autohide *Automatic hiding of the `col_end` column*
#'
#'   `scalar<logical>` // *default:* `TRUE`
#'
#'   An option to automatically hide the column specified as
#'   `col_end`. Any columns with their state changed to hidden will behave
#'   the same as before, they just won't be displayed in the finalized table.
#'
#' @return An object of class `gt_tbl`.
#'
#' @section Comparison with other column-merging functions:
#'
#' This function could be somewhat replicated using [cols_merge()], however,
#' `cols_merge_range()` employs the following specialized operations for `NA`
#' handling:
#'
#' 1. `NA`s in `col_begin` (but not `col_end`) result in a display of only
#  the `col_end` values only for the merged column
#' 2. `NA`s in `col_end` (but not `col_begin`) result in a display of only
#' the `col_begin` values only for the merged column (this is the converse of
#' the previous)
#' 3. `NA`s both in `col_begin` and `col_end` result in missing values for
#' the merged column
#'
#' Any resulting `NA` values in the `col_begin` column following the merge
#' operation can be easily formatted using the [sub_missing()] function.
#' Separate calls of [sub_missing()] can be used for the `col_begin` and
#' `col_end` columns for finer control of the replacement values.
#'
#' This function is part of a set of four column-merging functions. The other
#' three are the general [cols_merge()] function and the specialized
#' [cols_merge_uncert()] and [cols_merge_n_pct()] functions. These functions
#' operate similarly, where the non-target columns can be optionally hidden from
#' the output table through the `hide_columns` or `autohide` options.
#'
#' @section Examples:
#'
#' Let's use a subset of the [`gtcars`] dataset to create a **gt** table,
#' keeping only the `model`, `mpg_c`, and `mpg_h` columns. Merge the `"mpg*"`
#' columns together as a single range column (which is labeled as MPG, in
#' italics) using the `cols_merge_range()` function. After the merging process,
#' the column label for the `mpg_c` column is updated with [cols_label()] to
#' better describe the content.
#'
#' ```r
#' gtcars |>
#'   dplyr::select(model, starts_with("mpg")) |>
#'   dplyr::slice(1:8) |>
#'   gt() |>
#'   cols_merge_range(
#'     col_begin = mpg_c,
#'     col_end = mpg_h
#'   ) |>
#'   cols_label(mpg_c = md("*MPG*"))
#' ```
#'
#' \if{html}{\out{
#' `r man_get_image_tag(file = "man_cols_merge_range_1.png")`
#' }}
#'
#' @family column modification functions
#' @section Function ID:
#' 5-15
#'
#' @section Function Introduced:
#' `v0.2.0.5` (March 31, 2020)
#'
#' @import rlang
#' @export
cols_merge_range <- function(
    data,
    col_begin,
    col_end,
    rows = everything(),
    sep = "--",
    autohide = TRUE
) {

  # Perform input object validation
  stop_if_not_gt_tbl(data = data)

  resolved <-
    cols_merge_resolver(
      data = data,
      col_begin = {{ col_begin }},
      col_end = {{ col_end }},
      sep = sep
    )

  # Resolve the rows supplied in the `rows` argument
  resolved_rows_idx <-
    resolve_rows_i(
      expr = {{ rows }},
      data = data
    )

  # Create an entry and add it to the `_col_merge` attribute
  data <-
    dt_col_merge_add(
      data = data,
      col_merge = dt_col_merge_entry(
        vars = resolved$columns,
        rows = resolved_rows_idx,
        type = "merge_range",
        pattern = resolved$pattern,
        sep = sep
      )
    )

  if (isTRUE(autohide)) {

    col_end <-
      resolve_cols_c(
        expr = {{ col_end }},
        data = data,
        excl_stub = FALSE
      )

    data <-
      cols_hide(
        data = data,
        columns = col_end
      )
  }

  data
}

cols_merge_resolver <- function(data, col_begin, col_end, sep) {

  # Get the columns supplied in `col_begin` as a character vector
  col_begin <-
    resolve_cols_c(
      expr = {{ col_begin }},
      data = data,
      excl_stub = FALSE
    )

  # Get the columns supplied in `col_end` as a character vector
  col_end <-
    resolve_cols_c(
      expr = {{ col_end }},
      data = data,
      excl_stub = FALSE
    )

  columns <- c(col_begin, col_end)

  list(
    columns = columns,
    pattern = "{1}{sep}{2}"
  )
}

#' Merge two columns to combine counts and percentages
#'
#' @description
#'
#' The `cols_merge_n_pct()` function is a specialized variant of the
#' [cols_merge()] function. It operates by taking two columns that constitute
#' both a count (`col_n`) and a fraction of the total population (`col_pct`) and
#' merges them into a single column. What results is a column containing both
#' counts and their associated percentages (e.g., `12 (23.2%)`). The column
#' specified in `col_pct` is dropped from the output table.
#'
#' @inheritParams cols_align
#'
#' @param col_n *Column to target for counts*
#'
#'   `<column-targeting expression>` // **required**
#'
#'   The column that contains values for the count component. While select
#'   helper functions such as [starts_with()] and [ends_with()] can be used for
#'   column targeting, it's recommended that a single column name be used. This
#'   is to ensure that exactly one column is provided here.
#'
#' @param col_pct *Column to target for percentages*
#'
#'   `<column-targeting expression>` // **required**
#'
#'   The column that contains values for the percentage component. While select
#'   helper functions such as [starts_with()] and [ends_with()] can be used for
#'   column targeting, it's recommended that a single column name be used. This
#'   is to ensure that exactly one column is provided here. This column should
#'   be formatted such that percentages are displayed (e.g., with
#'   `fmt_percent()`).
#'
#' @param rows *Rows to target*
#'
#'   `<row-targeting expression>` // *default:* `everything()`
#'
#'   In conjunction with `columns`, we can specify which of their rows should
#'   participate in the merging process. The default [everything()] results in
#'   all rows in `columns` being formatted. Alternatively, we can supply a
#'   vector of row captions within [c()], a vector of row indices, or a select
#'   helper function. Examples of select helper functions include
#'   [starts_with()], [ends_with()], [contains()], [matches()], [one_of()],
#'   [num_range()], and [everything()]. We can also use expressions to filter
#'   down to the rows we need (e.g., `[colname_1] > 100 & [colname_2] < 50`).
#'
#' @param autohide *Automatic hiding of the `col_pct` column*
#'
#'   `scalar<logical>` // *default:* `TRUE`
#'
#'   An option to automatically hide the column specified as `col_pct`. Any
#'   columns with their state changed to hidden will behave the same as before,
#'   they just won't be displayed in the finalized table.
#'
#' @return An object of class `gt_tbl`.
#'
#' @section Comparison with other column-merging functions:
#'
#' This function could be somewhat replicated using [cols_merge()], however,
#' `cols_merge_n_pct()` employs the following specialized semantics for `NA`
#' and zero-value handling:
#'
#' 1. `NA`s in `col_n` result in missing values for the merged
#' column (e.g., `NA` + `10.2%` = `NA`)
#' 2. `NA`s in `col_pct` (but not `col_n`) result in
#' base values only for the merged column (e.g., `13` + `NA` = `13`)
#' 3. `NA`s both `col_n` and `col_pct` result in
#' missing values for the merged column (e.g., `NA` + `NA` = `NA`)
#' 4. If a zero (`0`) value is in `col_n` then the formatted output will be
#' `"0"` (i.e., no percentage will be shown)
#'
#' Any resulting `NA` values in the `col_n` column following the merge
#' operation can be easily formatted using the [sub_missing()] function.
#' Separate calls of [sub_missing()] can be used for the `col_n` and
#' `col_pct` columns for finer control of the replacement values. It is the
#' responsibility of the user to ensure that values are correct in both the
#' `col_n` and `col_pct` columns (this function neither generates nor
#' recalculates values in either). Formatting of each column can be done
#' independently in separate [fmt_number()] and [fmt_percent()] calls.
#'
#' This function is part of a set of four column-merging functions. The other
#' three are the general [cols_merge()] function and the specialized
#' [cols_merge_uncert()] and [cols_merge_range()] functions. These functions
#' operate similarly, where the non-target columns can be optionally hidden from
#' the output table through the `hide_columns` or `autohide` options.
#'
#' @section Examples:
#'
#' Using a summarized version of the [`pizzaplace`] dataset, let's create a
#' **gt** table that displays the counts and percentages of the top 3 pizzas
#' sold by pizza category in 2015. The `cols_merge_n_pct()` function is used to
#' merge the `n` and `frac` columns (and the `frac` column is formatted using
#' [fmt_percent()]).
#'
#' ```r
#' pizzaplace |>
#'   dplyr::group_by(name, type, price) |>
#'   dplyr::summarize(
#'     n = dplyr::n(),
#'     frac = n/nrow(pizzaplace),
#'     .groups = "drop"
#'   ) |>
#'   dplyr::arrange(type, dplyr::desc(n)) |>
#'   dplyr::group_by(type) |>
#'   dplyr::slice_head(n = 3) |>
#'   gt(
#'     rowname_col = "name",
#'     groupname_col = "type"
#'   ) |>
#'   fmt_currency(price) |>
#'   fmt_percent(frac) |>
#'   cols_merge_n_pct(
#'     col_n = n,
#'     col_pct = frac
#'   ) |>
#'   cols_label(
#'     n = md("*N* (%)"),
#'     price = "Price"
#'   ) |>
#'   tab_style(
#'     style = cell_text(font = "monospace"),
#'     locations = cells_stub()
#'   ) |>
#'   tab_stubhead(md("Cat. and  \nPizza Code")) |>
#'   tab_header(title = "Top 3 Pizzas Sold by Category in 2015") |>
#'   tab_options(table.width = px(512))
#' ```
#'
#' \if{html}{\out{
#' `r man_get_image_tag(file = "man_cols_merge_n_pct_1.png")`
#' }}
#'
#' @family column modification functions
#' @section Function ID:
#' 5-16
#'
#' @section Function Introduced:
#' `v0.3.0` (May 12, 2021)
#'
#' @import rlang
#' @export
cols_merge_n_pct <- function(
    data,
    col_n,
    col_pct,
    rows = everything(),
    autohide = TRUE
) {

  # Perform input object validation
  stop_if_not_gt_tbl(data = data)

  resolved <-
    cols_merge_resolver(
      data = data,
      col_begin = {{ col_n }},
      col_end = {{ col_pct }},
      sep = ""
    )

  # Resolve the rows supplied in the `rows` argument
  resolved_rows_idx <-
    resolve_rows_i(
      expr = {{ rows }},
      data = data
    )

  # Create an entry and add it to the `_col_merge` attribute
  data <-
    dt_col_merge_add(
      data = data,
      col_merge = dt_col_merge_entry(
        vars = resolved$columns,
        rows = resolved_rows_idx,
        type = "merge_n_pct",
        pattern = resolved$pattern,
        sep = ""
      )
    )

  if (isTRUE(autohide)) {

    col_pct <-
      resolve_cols_c(
        expr = {{ col_pct }},
        data = data
      )

    data <-
      cols_hide(
        data = data,
        columns = col_pct
      )
  }

  data
}
