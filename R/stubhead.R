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


# tab_stubhead() ---------------------------------------------------------------
#' Add label text to the stubhead
#'
#' @description
#'
#' We can add a label to the stubhead of a **gt** table with `tab_stubhead()`.
#' The stubhead is the lone part of the table that is positioned left of the
#' column labels, and above the stub. If a stub does not exist, then there is no
#' stubhead (so no visible change will be made when using this function in that
#' case). We have the flexibility to use Markdown formatting for the stubhead
#' label via the [md()] helper function. Furthermore, if the table is intended
#' for HTML output, we can use HTML inside of [html()] for the stubhead label.
#'
#' @inheritParams fmt_number
#'
#' @param label *Stubhead label text*
#'
#'   `scalar<character>` // **required**
#'
#'   The text to be used as the stubhead label. We can optionally use [md()] or
#'   [html()] to style the text as Markdown or to retain HTML elements in the text.
#'
#' @return An object of class `gt_tbl`.
#'
#' @section Examples:
#'
#' Using a small subset of the [`gtcars`] dataset, we can create a **gt** table
#' with row labels. Since we have row labels in the stub (via use of
#' `rowname_col = "model"` in the [gt()] function call) we have a stubhead, so,
#' let's add a stubhead label (`"car"`) with `tab_stubhead()` to
#' describe what's in the stub.
#'
#' ```r
#' gtcars |>
#'   dplyr::select(model, year, hp, trq) |>
#'   dplyr::slice(1:5) |>
#'   gt(rowname_col = "model") |>
#'   tab_stubhead(label = "car")
#' ```
#'
#' \if{html}{\out{
#' `r man_get_image_tag(file = "man_tab_stubhead_1.png")`
#' }}
#'
#' The stuhead can contain all sorts of interesting content. How about an icon
#' for a car? We can make this happen with help from the **fontawesome**
#' package.
#'
#' ```r
#' gtcars |>
#'   dplyr::select(model, year, hp, trq) |>
#'   dplyr::slice(1:5) |>
#'   gt(rowname_col = "model") |>
#'   tab_stubhead(label = fontawesome::fa("car"))
#' ```
#'
#' \if{html}{\out{
#' `r man_get_image_tag(file = "man_tab_stubhead_2.png")`
#' }}
#'
#' If the stub is two columns wide (made possible by using
#' `row_group_as_column = TRUE` in the [gt()] statement), the stubhead will be a
#' merged cell atop those two stub columns representing the row group and the
#' row label. Here's an example of that type of situation in a table that uses
#' the [`peeps`] dataset.
#'
#' ```r
#' peeps |>
#'   dplyr::filter(country %in% c("POL", "DEU")) |>
#'   dplyr::group_by(country) |>
#'   dplyr::filter(dplyr::row_number() %in% 1:5) |>
#'   dplyr::ungroup() |>
#'   dplyr::mutate(name = paste0(toupper(name_family), ", ", name_given)) |>
#'   dplyr::select(name, address, city, postcode, country) |>
#'   gt(
#'     rowname_col = "name",
#'     groupname_col = "country",
#'     row_group_as_column = TRUE
#'   ) |>
#'   tab_stubhead(label = "Country Code / Person") |>
#'   tab_style(
#'     style = cell_text(transform = "capitalize"),
#'     locations = cells_column_labels()
#'   )
#' ```
#'
#' \if{html}{\out{
#' `r man_get_image_tag(file = "man_tab_stubhead_3.png")`
#' }}
#'
#' The stubhead cell and its text can be styled using [tab_style()] with
#' [cells_stubhead()]. In this example, using the [`reactions`] dataset, we
#' style the stubhead label so that it is vertically centered with text that is
#' highly emboldened.
#'
#' ```r
#' reactions |>
#'   dplyr::filter(cmpd_type == "nitrophenol") |>
#'   dplyr::select(cmpd_name, OH_k298, Cl_k298) |>
#'   dplyr::filter(!(is.na(OH_k298) & is.na(Cl_k298))) |>
#'   gt(rowname_col = "cmpd_name") |>
#'   tab_spanner(
#'     label = "Rate constant at 298 K, in {{cm^3 molecules^-1 s^-1}}",
#'     columns = ends_with("k298")
#'   ) |>
#'   tab_stubhead(label = "Nitrophenol Compound") |>
#'   fmt_scientific() |>
#'   sub_missing() |>
#'   cols_label_with(fn = function(x) sub("_k298", "", x)) |>
#'   cols_width(everything() ~ px(200)) |>
#'   tab_style(
#'     style = cell_text(v_align = "middle", weight = "800"),
#'     locations = cells_stubhead()
#'   )
#' ```
#'
#' \if{html}{\out{
#' `r man_get_image_tag(file = "man_tab_stubhead_4.png")`
#' }}
#'
#' @family part creation/modification functions
#' @section Function ID:
#' 2-5
#'
#' @section Function Introduced:
#' `v0.2.0.5` (March 31, 2020)
#'
#' @export
tab_stubhead <- function(
    data,
    label
) {

  # Perform input object validation
  stop_if_not_gt_tbl(data = data)

  dt_stubhead_label(data = data, label = label)
}

# rm_stubhead() ----------------------------------------------------------------
#' Remove the stubhead label
#'
#' @description
#'
#' We can easily remove the stubhead label from a **gt** table with
#' `rm_stubhead()`. The stubhead location only exists if there is a table stub
#' and the text in that cell is added with [tab_stubhead()].
#'
#' This function for removal is useful if you have received a **gt** table
#' (perhaps through an API that returns **gt** objects) but would prefer that
#' the table not contain any content in the stubhead. This function is safe to
#' use even if there is no stubhead label in the input `gt_tbl` object.
#'
#' @inheritParams rm_header
#'
#' @return An object of class `gt_tbl`.
#'
#' @section Examples:
#'
#' Using the [`gtcars`] dataset, we'll create a **gt** table. With
#' [tab_stubhead()], it's possible to add a stubhead label. This appears in the
#' top-left and can be used to describe what is in the stub.
#'
#' ```r
#' gt_tbl <-
#'   gtcars |>
#'   dplyr::select(model, year, hp, trq) |>
#'   dplyr::slice(1:5) |>
#'   gt(rowname_col = "model") |>
#'   tab_stubhead(label = "car")
#'
#' gt_tbl
#' ```
#'
#' \if{html}{\out{
#' `r man_get_image_tag(file = "man_rm_stubhead_1.png")`
#' }}
#'
#' If you decide that you don't want the stubhead label in the `gt_tbl` object,
#' it can be removed with `rm_stubhead()`.
#'
#' ```r
#' rm_stubhead(data = gt_tbl)
#' ```
#'
#' \if{html}{\out{
#' `r man_get_image_tag(file = "man_rm_stubhead_2.png")`
#' }}
#'
#' @family part removal functions
#' @section Function ID:
#' 7-2
#'
#' @section Function Introduced:
#' `v0.8.0` (November 16, 2022)
#'
#' @export
rm_stubhead <- function(data) {

  # Perform input object validation
  stop_if_not_gt_tbl(data = data)

  # Reinitialize the stubhead component of the `gt_tbl` object
  dt_stubhead_init(data = data)
}
