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


# cols_align_decimal() ---------------------------------------------------------
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
#' @inheritParams cols_align
#'
#' @param columns *Columns to target*
#'
#'   `<column-targeting expression>` // *default:* `everything()`
#'
#'   The columns for which decimal alignment should be applied. Can either be a
#'   series of column names provided in `c()`, a vector of column indices, or a
#'   select helper function (e.g. [starts_with()], [ends_with()], [contains()],
#'   [matches()], [num_range()], and [everything()]). By default this is set to
#'   [everything()] which means that the decimal alignment affects all columns.
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
#'   States) and `"fr"` for French (France). We can call [info_locales()] for a
#'   useful reference for all of the locales that are supported. A locale ID can
#'   be also set in the initial [gt()] function call (where it would be used
#'   automatically by any function with a `locale` argument) but a
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
#' @export
cols_align_decimal <- function(
    data,
    columns = everything(),
    dec_mark = ".",
    locale = NULL
) {

  # Perform input object validation
  stop_if_not_gt_tbl_or_group(data = data)

  # Handle gt_group
  if(inherits(data, "gt_group")){
    arg_list <- as.list(match.call())
    return(apply_to_grp(data, arg_list))
  }

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
  table_data <- table_data[resolved]

  cols_are_numeric <-
    vapply(
      table_data,
      FUN.VALUE = logical(1L),
      USE.NAMES = FALSE,
      FUN = function(x) is.numeric(x)
    )

  # Subset columns to those that are numeric in the input table data
  columns <- colnames(table_data)[cols_are_numeric]

  # If the subsetting of columns finally results in no columns, return
  # the data unchanged
  if (length(columns) == 0L) {
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

# helper -----------------------------------
align_to_char <- function(x, align_at = ".") {

  na_x_vals <- x == "NA"
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
          paste0(strrep("\U02007", n_char_extracted), "$"),
          "",
          x_piece_rhs[i]
        )
    }
  }

  x_align <- paste(x_piece_lhs, x_piece_rhs, sep = align_at)

  x_align_parens <- grepl("\\(.+?\\)", x_align)

  if (grepl(align_at, paste(x[!x_no_align], collapse = "|"), fixed = TRUE)) {

    x_align[nchar(x_rhs) == 0 & !grepl(align_at, x[!x_no_align], fixed = TRUE)] <-
      sub(align_at, " ", x_align[nchar(x_rhs) == 0], fixed = TRUE)

    x_align[x_align_parens] <- paste0(x_align[x_align_parens], "\U000A0")

  } else {

    x_align[nchar(x_rhs) == 0 & !grepl(align_at, x[!x_no_align], fixed = TRUE)] <-
      sub(align_at, "", x_align[nchar(x_rhs) == 0], fixed = TRUE)

    x_align[!x_align_parens] <- paste0(x_align[!x_align_parens], "\U000A0")
  }

  x_str[!x_no_align] <- x_align

  x_str
}

