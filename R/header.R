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


# tab_header() -----------------------------------------------------------------
#' Add a table header
#'
#' @description
#'
#' We can add a table header to the **gt** table with a title and even a
#' subtitle using `tab_header()`. A table header is an optional
#' table part that is positioned just above the column labels table part. We
#' have the flexibility to use Markdown or HTML formatting for the header's
#' title and subtitle with the [md()] and [html()] helper functions.
#'
#' @inheritParams fmt_number
#'
#' @param title *Header title*
#'
#'   `scalar<character>` // **required**
#'
#'   Text to be used in the table title. We can elect to use the [md()] and
#'   [html()] helper functions to style the text as Markdown or to retain HTML
#'   elements in the text.
#'
#' @param subtitle *Header subtitle*
#'
#'   `scalar<character>` // *default:* `NULL` (`optional`)
#'
#'   Text to be used in the table subtitle. We can elect to use [md()] or
#'    [html()] helper functions to style the text as Markdown or to retain HTML
#'   elements in the text.
#'
#' @param preheader *RTF preheader text*
#'
#'   `vector<character>` // *default:* `NULL` (`optional`)
#'
#'   Optional preheader content that is rendered above the table for RTF output.
#'   Can be supplied as a vector of text.
#'
#' @return An object of class `gt_tbl`.
#'
#' @section Examples:
#'
#' Let's use a small portion of the [`gtcars`] dataset to create a **gt** table.
#' A header part can be added to the table with the `tab_header()` function.
#' We'll add a title and the optional subtitle as well. With [md()], we can
#' make sure the Markdown formatting is interpreted and transformed.
#'
#' ```r
#' gtcars |>
#'   dplyr::select(mfr, model, msrp) |>
#'   dplyr::slice(1:5) |>
#'   gt() |>
#'   tab_header(
#'     title = md("Data listing from **gtcars**"),
#'     subtitle = md("`gtcars` is an R dataset")
#'   )
#' ```
#'
#' \if{html}{\out{
#' `r man_get_image_tag(file = "man_tab_header_1.png")`
#' }}
#'
#' If the table is intended solely as an HTML table, you could introduce your
#' own HTML elements into the header. You can even use the **htmltools** package
#' to help arrange and generate the HTML. Here's an example of that, where two
#' `<div>` elements are placed in a `htmltools::tagList()`.
#'
#' ```r
#' gtcars |>
#'   dplyr::select(mfr, model, msrp) |>
#'   dplyr::slice(1:5) |>
#'   gt() |>
#'   tab_header(
#'     title =
#'       htmltools::tagList(
#'         htmltools::tags$div(
#'           htmltools::HTML(
#'             web_image("https://www.r-project.org/logo/Rlogo.png")
#'           ),
#'           style = htmltools::css(`text-align` = "center")
#'         ),
#'         htmltools::tags$div(
#'           "Data listing from ", htmltools::tags$strong("gtcars")
#'         )
#'       )
#'   )
#' ```
#'
#' \if{html}{\out{
#' `r man_get_image_tag(file = "man_tab_header_2.png")`
#' }}
#'
#' If using HTML but doing something far simpler, we can wrap our title or
#' subtitle inside [html()] to declare that the text provided is HTML.
#'
#' ```r
#' gtcars |>
#'   dplyr::select(mfr, model, msrp) |>
#'   dplyr::slice(1:5) |>
#'   gt() |>
#'   tab_header(
#'     title = html("Data listing from <strong>gtcars</strong>"),
#'     subtitle = html("From <span style='color:red;'>gtcars</span>")
#'   )
#' ```
#'
#' \if{html}{\out{
#' `r man_get_image_tag(file = "man_tab_header_3.png")`
#' }}
#'
#' Sometimes, aligning the heading elements to the left can improve the
#' presentation of a table. Here, we use the [`nuclides`] dataset to generate a
#' display of natural abundance values for several stable isotopes.
#' [opt_align_table_header()] is used with `align = "left"` to make it so the
#' title and subtitle are left aligned in the header area.
#'
#' ```r
#' nuclides |>
#'   dplyr::filter(!is.na(abundance)) |>
#'   dplyr::filter(abundance != 1) |>
#'   dplyr::filter(z >= 1 & z <= 8) |>
#'   dplyr::mutate(element = paste0(element, ", **z = ", z, "**")) |>
#'   dplyr::mutate(nuclide = gsub("[0-9]+$", "", nuclide)) |>
#'   dplyr::select(nuclide, element, atomic_mass, abundance, abundance_uncert) |>
#'   gt(
#'     rowname_col = "nuclide",
#'     groupname_col = "element",
#'     process_md = TRUE
#'   ) |>
#'   tab_header(
#'     title = "Natural Abundance Values",
#'     subtitle = md("For elements having atomic numbers from `1` to `8`.")
#'   ) |>
#'   tab_stubhead(label = "Isotope") |>
#'   tab_stub_indent(
#'     rows = everything(),
#'     indent = 1
#'   ) |>
#'   fmt_chem(columns = stub()) |>
#'   fmt_number(
#'     columns = atomic_mass,
#'     decimals = 4,
#'     scale_by = 1 / 1e6
#'   ) |>
#'   fmt_percent(
#'     columns = contains("abundance"),
#'     decimals = 4
#'   ) |>
#'   cols_merge_uncert(
#'     col_val = abundance,
#'     col_uncert = abundance_uncert
#'   ) |>
#'   cols_label_with(fn = function(x) tools::toTitleCase(gsub("_", " ", x))) |>
#'   cols_width(
#'     stub() ~ px(70),
#'     atomic_mass ~ px(120),
#'     abundance ~ px(200)
#'   ) |>
#'   opt_align_table_header(align = "left") |>
#'   opt_vertical_padding(scale = 0.5)
#' ```
#'
#' \if{html}{\out{
#' `r man_get_image_tag(file = "man_tab_header_4.png")`
#' }}
#'
#' @family part creation/modification functions
#' @section Function ID:
#' 2-1
#'
#' @section Function Introduced:
#' `v0.2.0.5` (March 31, 2020)
#'
#' @export
tab_header <- function(
    data,
    title,
    subtitle = NULL,
    preheader = NULL
) {

  # Perform input object validation
  stop_if_not_gt_tbl(data = data)

  dt_set_heading_components(
    data = data,
    title = title,
    subtitle = subtitle,
    preheader = preheader
  )
}


# rm_header() ------------------------------------------------------------------
#' Remove the table header
#'
#' @description
#'
#' We can remove the table header from a **gt** table quite easily with
#' `rm_header()`. The table header is an optional table part (positioned above
#' the column labels) that can be added through [tab_header()].
#'
#' This function for removal is useful if you have received a **gt** table
#' (perhaps through an API that returns **gt** objects) but would prefer that
#' the table not contain a header. This function is safe to use even if there is
#' no header part in the input `gt_tbl` object.
#'
#' @param data *The gt table data object*
#'
#'   `obj:<gt_tbl>` // **required**
#'
#'   This is the **gt** table object that is commonly created through use of the
#'   [gt()] function.
#'
#' @return An object of class `gt_tbl`.
#'
#' @section Examples:
#'
#' Let's use a subset of the [`gtcars`] dataset to create a **gt** table. A
#' header part can be added with [tab_header()]; with that, we get
#' a title and a subtitle for the table.
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
#'   )
#'
#' gt_tbl
#' ```
#'
#' \if{html}{\out{
#' `r man_get_image_tag(file = "man_rm_header_1.png")`
#' }}
#'
#' If you decide that you don't want the header in the `gt_tbl` object, it can
#' be removed with `rm_header()`.
#'
#' ```r
#' rm_header(data = gt_tbl)
#' ```
#'
#' \if{html}{\out{
#' `r man_get_image_tag(file = "man_rm_header_2.png")`
#' }}
#'
#' @family part removal functions
#' @section Function ID:
#' 7-1
#'
#' @section Function Introduced:
#' `v0.8.0` (November 16, 2022)
#'
#' @export
rm_header <- function(data) {

  # Perform input object validation
  stop_if_not_gt_tbl(data = data)

  # Reinitialize the heading component of the `gt_tbl` object
  dt_heading_init(data = data)
}
