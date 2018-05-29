#' Helper function for adding a local image
#'
#' Add a local image inside a table with this
#' helper function.
#' @param file a path to an image file.
#' @param height the absolute height (px)
#' of the image in the table cell.
#' @return a character object with an HTML
#' fragment that can be placed inside a cell.
#' @examples
#' \dontrun{
#' # Create an HTML fragment that
#' # contains an image
#' img_file_html <-
#'   local_image(
#'     file = "path/to/image.png")
#' }
#' @importFrom glue glue
#' @importFrom knitr image_uri
#' @export
local_image <- function(file,
                        height = 30) {

  uri <- knitr::image_uri(f = file)

  glue::glue("<img src=\"{uri}\" style=\"height: {height};\">") %>%
    as.character()
}


#' Helper function for adding an image from the web
#'
#' Add a web image inside a table with this
#' helper function.
#' @param url a url that resolves to an image file.
#' @param height the absolute height (px)
#' of the image in the table cell.
#' @return a character object with an HTML
#' fragment that can be placed inside a cell.
#' @examples
#' \dontrun{
#' # Create an HTML fragment that
#' # contains an image
#' img_file_html <-
#'   web_image(
#'     file = "https://.../web_image.png")
#' }
#' @importFrom glue glue
#' @export
web_image <- function(url,
                      height = 30) {

  glue::glue("<img src=\"{url}\" style=\"height: {height};\">") %>%
    as.character()
}

#' Helper function for adding a FontAwesome icon
#'
#' Add a FontAwesome icon inside a table with
#' this helper function.
#' @param name the name of the FontAwesome icon.
#' @param height the absolute height (px)
#' of the image in the table cell.
#' @param fill an option to change the fill
#' color of the icon.
#' @return a character object with an HTML
#' fragment that can be placed inside a cell.
#' @examples
#' # Create an HTML fragment that
#' # contains an FA icon
#' fa_icon_html <-
#'   fa_icon(
#'     name = "r-project")
#' @importFrom glue glue
#' @importFrom dplyr filter pull rename
#' @importFrom stringr str_replace
#' @export
fa_icon <- function(name,
                    height = 30,
                    fill = NULL) {

  fa_tbl <- gt:::fa_tbl

  if (name %in% (fa_tbl %>% dplyr::pull(full_name))) {

    svg <-
      (fa_tbl %>%
         dplyr::filter(full_name %in% rlang::UQ(rlang::enquo(name))) %>%
         dplyr::pull(svg))[1]

  } else if (name %in% (fa_tbl %>% dplyr::pull(name))) {

    svg <-
      (fa_tbl %>%
         dplyr::filter(name %in% rlang::UQ(rlang::enquo(name))) %>%
         dplyr::pull(svg))[1]
  }

  style <- glue::glue("style=\"height: {height};")

  if (!is.null(fill)) {
    style <- glue::glue("{style}fill: {fill};")
  }

  style <- glue::glue("{style}\"")

  stringr::str_replace(
    string = svg,
    pattern = "^<svg",
    replacement = glue::glue("<svg {style}")) %>%
    as.character()
}

#' Helper function for adding a ggplot
#'
#' Add a ggplot plot inside a table with this
#' helper function.
#' @param plot_object the ggplot plot object.
#' @param height the absolute height (px)
#' of the image in the table cell.
#' @param x the x component of the plot's
#' final aspect ratio.
#' @param y the y component of the plot's
#' final aspect ratio.
#' @return a character object with an HTML
#' fragment that can be placed inside a cell.
#' @examples
#' \dontrun{
#' library(ggplot2)
#'
#' # Create a ggplot plot
#' plot <-
#'   ggplot(
#'     data = mtcars,
#'     aes(x = disp, y = hp,
#'         color = wt, size = mpg)) +
#'   geom_point()
#'
#' # Create an HTML fragment that
#' # contains an the ggplot as an
#' # embedded plot
#' plot_html <-
#'   ggplot_image(
#'     plot_object = plot)
#' }
#' @importFrom ggplot2 ggsave
#' @export
ggplot_image <- function(plot_object,
                         height = 30,
                         x = 7,
                         y = 5) {

  ggplot2::ggsave(
    device = "png",
    plot = plot_object,
    filename = "temp_ggplot.png",
    width = x,
    height = y)

  Sys.sleep(1)

  image_html <-
    local_image(
      file = "temp_ggplot.png",
      height = height)

  file.remove("temp_ggplot.png")

  image_html
}
