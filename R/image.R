#' Helper function for adding a local image
#'
#' Add a local image inside a table with this helper function.
#' @param file a path to an image file.
#' @param height the absolute height (px) of the image in the table cell.
#' @return a character object with an HTML fragment that can be placed inside of
#'   a cell.
#' @examples
#' \dontrun{
#' # Create an HTML fragment that
#' # contains an image
#' img_file_html <-
#'   local_image(
#'     file = "path/to/image.png")
#' }
#' @importFrom glue glue
#' @export
local_image <- function(file,
                        height = 30) {

  if (is.numeric(height)) {
    height <- paste0(height, "px")
  }

  # Construct a CID based on the filename
  # with a random string prepended to it
  cid <-
    paste0(
      sample(letters, 12) %>% paste(collapse = ""), "__",
      basename(file))

  # Create the image URI
  uri <- get_image_uri(file)

  # Generate the Base64-encoded image and place it
  # within <img> tags
  glue::glue("<img cid=\"{cid}\" src=\"{uri}\" style=\"height:{height};\">") %>%
    as.character()
}

#' Helper function for adding an image from the web
#'
#' Add a web image inside a table with this helper function.
#' @param url a url that resolves to an image file.
#' @param height the absolute height (px) of the image in the table cell.
#' @return a character object with an HTML fragment that can be placed inside of
#'   a cell.
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

  if (is.numeric(height)) {
    height <- paste0(height, "px")
  }

  glue::glue("<img src=\"{url}\" style=\"height:{height};\">") %>%
    as.character()
}

#' Helper function for adding a FontAwesome icon
#'
#' Add a FontAwesome icon inside a table with this helper function.
#' @param name the name of the FontAwesome icon.
#' @param height the absolute height (px) of the icon in the table cell.
#' @param fill an option to change the fill color of the icon.
#' @return a character object with an HTML fragment that can be placed inside of
#'   a cell.
#' @examples
#' # Create an HTML fragment that
#' # contains an FA icon
#' fa_icon_html <-
#'   fa_icon(
#'     name = "r-project")
#' @import rlang
#' @importFrom glue glue
#' @importFrom dplyr filter pull rename
#' @importFrom stringr str_replace
#' @export
fa_icon <- function(name,
                    height = 30,
                    fill = NULL) {

  if (is.numeric(height)) {
    height <- paste0(height, "px")
  }

  # Create bindings for specific variables
  full_name <- NULL

  fa_tbl <- fa_tbl

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

  style <- glue::glue("style=\"height:{height};")

  if (!is.null(fill)) {
    style <- glue::glue("{style}fill:{fill};")
  }

  style <- glue::glue("{style}\"")

  stringr::str_replace(
    string = svg,
    pattern = "^<svg",
    replacement = glue::glue("<svg {style}")) %>%
    as.character()
}

#' Helper function for adding a local image
#'
#' Add an image from a local SVG file inside a table with this helper function.
#' @param file a path to an SVG file.
#' @param height the absolute height (px) of the image in the table cell.
#' @return a character object with an HTML fragment that can be placed inside of
#'   a cell.
#' @examples
#' \dontrun{
#' # Create an HTML fragment that
#' # contains the SVG
#' img_file_html <-
#'   local_svg(
#'     file = "path/to/file.svg")
#' }
#' @importFrom glue glue
#' @importFrom stringr str_replace str_squish
#' @export
local_svg <- function(file,
                      height = 30) {

  if (is.numeric(height)) {
    height <- paste0(height, "px")
  }

  style <- glue::glue("style=\"height:{height};\"")

  svg <-
    suppressWarnings(
      readLines(file) %>%
        paste(collapse = " ") %>%
        stringr::str_squish())

  if (svg %>% stringr::str_detect(pattern = "^<\\?xml.*?\\?>")) {

    svg <- svg %>%
      stringr::str_replace(
        pattern = "^<\\?xml.*?\\?>",
        replacement = "") %>%
      stringr::str_squish()
  }

  svg %>%
    stringr::str_replace(
      pattern = "^<svg",
      replacement = glue::glue("<svg {style}")) %>%
    as.character()
}

#' Helper function for adding a ggplot
#'
#' Add a ggplot plot inside a table with this helper function.
#' @param plot_object the ggplot plot object.
#' @param height the absolute height (px) of the image in the table cell.
#' @param aspect_ratio the plot's final aspect ratio.
#' @return a character object with an HTML fragment that can be placed inside of
#'   a cell.
#' @examples
#' \dontrun{
#' library(ggplot2)
#'
#' # Create a ggplot plot
#' plot_object <-
#'   ggplot(
#'     data = mtcars,
#'     aes(x = disp, y = hp,
#'         color = wt, size = mpg)) +
#'   geom_point()
#'
#' # Create an HTML fragment that
#' # contains an the ggplot as an
#' # embedded plot that's 100px high
#' plot_html <-
#'   plot_object %>%
#'   ggplot_image(
#'     height = 200)
#'
#' # Create a table that contains the
#' # the html fragment with the plot
#' # then pass it to `gt()`
#' tribble(
#'   ~row, ~plot,
#'   1,  plot_html) %>%
#'   gt()
#' }
#' @importFrom ggplot2 ggsave
#' @export
ggplot_image <- function(plot_object,
                         height = 100,
                         aspect_ratio = 1.0) {

  if (is.numeric(height)) {
    height <- paste0(height, "px")
  }

  ggplot2::ggsave(
    device = "png",
    plot = plot_object,
    filename = "temp_ggplot.png",
    dpi = 100,
    width = 5 * aspect_ratio,
    height = 5)

  Sys.sleep(1)

  image_html <-
    local_image(
      file = "temp_ggplot.png",
      height = height)

  file.remove("temp_ggplot.png")

  image_html
}
