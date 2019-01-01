#' View a table with info on date styles
#' @importFrom dplyr tibble
#' @family information functions
#' @export
info_date_style <- function() {

  dplyr::tibble(
    Number = 1:14,
    Name = c(
      "iso", "wday_month_day_year", "wd_m_day_year", "wday_day_month_year",
      "month_day_year", "m_day_year", "day_m_year", "day_month_year",
      "day_month", "year", "month", "day", "year.mn.day", "y.mn.day"),
    date = "2000-02-29") %>%
    gt() %>%
    fmt_date(columns = vars(date), rows = 1, date_style = 1) %>%
    fmt_date(columns = vars(date), rows = 2, date_style = 2) %>%
    fmt_date(columns = vars(date), rows = 3, date_style = 3) %>%
    fmt_date(columns = vars(date), rows = 4, date_style = 4) %>%
    fmt_date(columns = vars(date), rows = 5, date_style = 5) %>%
    fmt_date(columns = vars(date), rows = 6, date_style = 6) %>%
    fmt_date(columns = vars(date), rows = 7, date_style = 7) %>%
    fmt_date(columns = vars(date), rows = 8, date_style = 8) %>%
    fmt_date(columns = vars(date), rows = 9, date_style = 9) %>%
    fmt_date(columns = vars(date), rows = 10, date_style = 10) %>%
    fmt_date(columns = vars(date), rows = 11, date_style = 11) %>%
    fmt_date(columns = vars(date), rows = 12, date_style = 12) %>%
    fmt_date(columns = vars(date), rows = 13, date_style = 13) %>%
    fmt_date(columns = vars(date), rows = 14, date_style = 14) %>%
    tab_spanner(label = "Date Formats", columns = c("Number", "Name")) %>%
    cols_label(date = "Formatted Date") %>%
    tab_header(
      title = "Preset Date Formats",
      subtitle = md("Usable in the `fmt_date()` and `fmt_datetime()` functions"))
}

#' View a table with info on time styles
#' @importFrom dplyr tibble
#' @family information functions
#' @export
info_time_style <- function() {

  dplyr::tibble(
    Number = 1:5,
    Name = c("hms", "hm", "hms_p", "hm_p", "h_p"),
    time = "14:35") %>%
    gt() %>%
    fmt_time(columns = vars(time), rows = 1, time_style = 1) %>%
    fmt_time(columns = vars(time), rows = 2, time_style = 2) %>%
    fmt_time(columns = vars(time), rows = 3, time_style = 3) %>%
    fmt_time(columns = vars(time), rows = 4, time_style = 4) %>%
    fmt_time(columns = vars(time), rows = 5, time_style = 5) %>%
    tab_spanner(label = "Time Formats", columns = c("Number", "Name")) %>%
    cols_label(time = "Formatted Time") %>%
    tab_header(
      title = "Preset Time Formats",
      subtitle = md("Usable in the `fmt_time()` and `fmt_datetime()` functions"))
}

#' View a table with info on many different color palettes
#' @param color_pkgs a vector of color packages that determines which sets of
#'   palettes should be displayed in the information table. If this is
#'   \code{NULL} (the default) then all of the discrete palettes from all of the
#'   color packages represented in \pkg{paletteer} will be displayed.
#' @examples
#' # Get a table of info on the `ggthemes`
#' # color palettes (which are easily
#' # accessible from the paletteer package)
#' tab_1 <-
#'   info_paletteer(
#'     color_pkgs = "ggthemes")
#'
#' @section Figures:
#' \if{html}{\figure{man_info_paletteer_1.svg}{options: width=100\%}}
#'
#' @importFrom dplyr filter pull select mutate
#' @family information functions
#' @export
info_paletteer <- function(color_pkgs = NULL) {

  if (is.null(color_pkgs)) {

    color_pkgs <-
      c(
        "awtools", "dichromat", "dutchmasters", "ggsci", "ggpomological",
        "ggthemes", "ghibli", "grDevices", "jcolors", "LaCroixColoR",
        "NineteenEightyR", "nord", "ochRe", "palettetown", "pals",
        "Polychrome", "quickpalette", "rcartocolor", "RColorBrewer",
        "Redmonder", "wesanderson", "yarrr")
  }

  palettes_strips_df <-
    palettes_strips %>%
    dplyr::filter(package %in% color_pkgs)

  palettes_strips <-
    palettes_strips_df %>%
    dplyr::pull(colors)

  palettes_strips_df %>%
    dplyr::select(package, palette, length) %>%
    dplyr::mutate(`Color Count and Palette` = NA) %>%
    gt(groupname_col = "package", rowname_col = "palette") %>%
    text_transform(
      locations = cells_data("Color Count and Palette"),
      fn = function(x) {
        palettes_strips
      }
    ) %>%
    cols_label(
      length = ""
    ) %>%
    tab_stubhead_label(label = "Package and Palette Name") %>%
    tab_header(
      title = md("Palettes Made Easily Available with **paletteer**"),
      subtitle = md("Palettes like these are useful with the `data_color()` **gt** function")
    ) %>%
    tab_style(
      style = cells_styles(text_align = "left"),
      locations = list(
        cells_title(groups = "title"),
        cells_title(groups = "subtitle")
      )
    ) %>%
    tab_style(
      style = cells_styles(
        bkgd_color = "#E3E3E3",
        text_font = "Courier",
        text_size = "smaller",
        text_weight = "bold"),
      locations = cells_stub(rows = TRUE)
    ) %>%
    tab_style(
      style = cells_styles(text_font = "Courier"),
      locations = cells_data(columns = vars(length))
    ) %>%
    tab_options(
      stub_group.background.color = "#FFFFF0",
      column_labels.background.color = "#666660",
      stub_group.font.weight = "600", stub_group.font.size = "smaller") %>%
    tab_source_note(source_note = md(
      paste("The **paletteer** package is maintained by Emil Hvitfeldt. More information can be",
            "found on [the **paletteer** site](https://emilhvitfeldt.github.io/paletteer/) and",
            "on the [**CRAN** info page](https://cran.r-project.org/web/packages/paletteer/index.html).")
    ))
}
