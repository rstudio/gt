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


# tab_caption() ----------------------------------------------------------------
#' Add a table caption
#'
#' @description
#'
#' Add a caption to a **gt** table, which is handled specially for a table
#' within an R Markdown, Quarto, or **bookdown** context. The addition of
#' captions makes tables cross-referencing across the containing document. The
#' caption location (i.e., top, bottom, margin) is handled at the document level
#' in each of these system.
#'
#' @inheritParams fmt_number
#'
#' @param caption *Table caption text*
#'
#'   `scalar<character>` // **required**
#'
#'   The table caption to use for cross-referencing in R Markdown, Quarto, or
#'   **bookdown**.
#'
#' @return An object of class `gt_tbl`.
#'
#' @section Examples:
#'
#' With three columns from the [`gtcars`] dataset, let's create a **gt** table.
#' First, we'll add a header part with [tab_header()]. After that, a caption is
#' added with `tab_caption()`.
#'
#' ```r
#' gtcars |>
#'   dplyr::select(mfr, model, msrp) |>
#'   dplyr::slice(1:5) |>
#'   gt() |>
#'   tab_header(
#'     title = md("Data listing from **gtcars**"),
#'     subtitle = md("`gtcars` is an R dataset")
#'   ) |>
#'   tab_caption(caption = md("**gt** table example."))
#' ```
#'
#' \if{html}{\out{
#' `r man_get_image_tag(file = "man_tab_caption_1.png")`
#' }}
#'
#' @family part creation/modification functions
#' @section Function ID:
#' 2-9
#'
#' @section Function Introduced:
#' `v0.8.0` (November 16, 2022)
#'
#' @export
tab_caption <- function(
    data,
    caption
) {

  # Perform input object validation
  stop_if_not_gt_tbl(data = data)

  dt_options_set_value(
    data = data,
    option = "table_caption",
    value = caption
  )
}

# rm_caption() -----------------------------------------------------------------
#' Remove the table caption
#'
#' @description
#'
#' We can easily remove the caption text from a **gt** table with
#' `rm_caption()`. The caption may exist if it were set through the [gt()]
#' `caption` argument or via [tab_caption()].
#'
#' This function for removal is useful if you have received a **gt** table
#' (perhaps through an API that returns **gt** objects) but would prefer that
#' the table not have a caption at all. This function is safe to use even if
#' there is no table caption set in the input `gt_tbl` object.
#'
#' @inheritParams rm_header
#'
#' @return An object of class `gt_tbl`.
#'
#' @section Examples:
#'
#' Use a portion of the [`gtcars`] dataset to create a **gt** table. We'll add a
#' header part with [tab_header()], and, a caption will also be added via
#' [tab_caption()].
#'
#' ```r
#' gt_tbl <-
#'   gtcars |>
#'   dplyr::select(mfr, model, msrp) |>
#'   dplyr::slice(1:5) |>
#'   gt() |>
#'   tab_header(
#'     title = md("Data listing from **gtcars**"),
#'     subtitle = md("`gtcars` is an R dataset")
#'   ) |>
#'   tab_caption(caption = md("**gt** table example."))
#'
#' gt_tbl
#' ```
#'
#' \if{html}{\out{
#' `r man_get_image_tag(file = "man_rm_caption_1.png")`
#' }}
#'
#' If you decide that you don't want the caption in the `gt_tbl` object, it can
#' be removed with `rm_caption()`.
#'
#' ```r
#' rm_caption(data = gt_tbl)
#' ```
#'
#' \if{html}{\out{
#' `r man_get_image_tag(file = "man_rm_caption_2.png")`
#' }}
#'
#' @family part removal functions
#' @section Function ID:
#' 7-6
#'
#' @section Function Introduced:
#' `v0.8.0` (November 16, 2022)
#'
#' @export
rm_caption <- function(data) {

  # Perform input object validation
  stop_if_not_gt_tbl(data = data)

  # Reset the `table_caption` parameter value to an NA value inside
  # the `_options` component of the `gt_tbl` object
  dt_options_set_value(
    data = data,
    option = "table_caption",
    value = NA_character_
  )
}
