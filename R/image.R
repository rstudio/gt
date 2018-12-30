#' Helper function for adding a local image
#'
#' We can flexibly add a local image (i.e., an image residing on disk) inside of
#' a table with \code{local_image()} function. The function provides a
#' convenient way to generate an HTML fragment using an on-disk PNG or SVG.
#' Because this function is currently HTML-based, it is only useful for HTML
#' table output. To use this function inside of data cells, it is recommended
#' that the \code{\link{text_transform}()} function is used. With that function,
#' we can specify which data cells to target and then include a
#' \code{local_image()} call within the required user-defined function (for the
#' \code{fn} argument). If we want to include an image in other places (e.g., in
#' the header, within footnote text, etc.) we need to use \code{local_image()}
#' within the \code{\link{html}()} helper function.
#'
#' By itself, the function creates an HTML image tag with an image URI embedded
#' within. We can easily experiment with a local PNG or SVG image that's
#' available in the \pkg{gt} package using the \code{\link{test_image}()}
#' function. Using that, the call \code{local_image(file = test_image(type =
#' "png"))} evaluates to:
#'
#' \code{<img cid=<random CID> src=<data URI> style=\"height:30px;\">}
#'
#' where a height of \code{30px} is a default height chosen to work well within
#' the heights of most table rows.
#'
#' @param file a path to an image file.
#' @param height the absolute height (px) of the image in the table cell.
#' @return a character object with an HTML fragment that can be placed inside of
#'   a cell.
#' @examples
#' # Create a tibble that contains heights
#' # of an image in pixels (one column as a
#' # string, the other as numerical values),
#' # then, create a gt table; use the
#' # `text_transform()` function to insert
#' # a local test image (PNG) image with the
#' # various sizes
#' tab_1 <-
#'   dplyr::tibble(
#'     pixels = px(seq(10, 35, 5)),
#'     image = seq(10, 35, 5)
#'   ) %>%
#'   gt() %>%
#'   text_transform(
#'     locations = cells_data(vars(image)),
#'     fn = function(x) {
#'       local_image(
#'         file = test_image(type = "png"),
#'         height = as.numeric(x)
#'       )
#'     }
#'   )
#'
#' @section Figures:
#' \if{html}{\figure{man_local_image_1.svg}{options: width=100\%}}
#'
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
#' We can flexibly add a web image inside of a table with \code{web_image()}
#' function. The function provides a convenient way to generate an HTML fragment
#' with an image URL. Because this function is currently HTML-based, it is only
#' useful for HTML table output. To use this function inside of data cells, it
#' is recommended that the \code{\link{text_transform}()} function is used. With
#' that function, we can specify which data cells to target and then include a
#' \code{web_image()} call within the required user-defined function (for the
#' \code{fn} argument). If we want to include an image in other places (e.g.,
#' in the header, within footnote text, etc.) we need to use \code{web_image()} within
#' the \code{\link{html}()} helper function.
#'
#' By itself, the function creates an HTML image tag, so, the call
#' \code{web_image("http://some.web.site/image.png")} evaluates to:
#'
#' \code{<img src=\"http://some.web.site/image.png\" style=\"height:30px;\">}
#'
#' where a height of \code{30px} is a default height chosen to work well within
#' the heights of most table rows.
#'
#' @param url a url that resolves to an image file.
#' @param height the absolute height (px) of the image in the table cell.
#' @return a character object with an HTML fragment that can be placed inside of
#'   a cell.
#' @examples
#' # Get the PNG-based logo for the R
#' # Project from an image URL
#' r_png_url <-
#'   "https://www.r-project.org/logo/Rlogo.png"
#'
#' # Create a tibble that contains heights
#' # of an image in pixels (one column as a
#' # string, the other as numerical values),
#' # then, create a gt table; use the
#' # `text_transform()` function to insert
#' # the R logo PNG image with the various sizes
#' tab_1 <-
#'   dplyr::tibble(
#'     pixels = px(seq(10, 35, 5)),
#'     image = seq(10, 35, 5)
#'   ) %>%
#'   gt() %>%
#'   text_transform(
#'     locations = cells_data(vars(image)),
#'     fn = function(x) {
#'       web_image(
#'         url = r_png_url,
#'         height = as.numeric(x)
#'       )
#'     }
#'   )
#'
#' # Get the SVG-based logo for the R
#' # Project from an image URL
#' r_svg_url <-
#'   "https://www.r-project.org/logo/Rlogo.svg"
#'
#' # Create a tibble that contains heights
#' # of an image in pixels (one column as a
#' # string, the other as numerical values),
#' # then, create a gt table; use the
#' # `tab_header()` function to insert
#' # the R logo SVG image once in the title
#' # and five times in the subtitle
#' tab_2 <-
#'   dplyr::tibble(
#'     pixels = px(seq(10, 35, 5)),
#'     image = seq(10, 35, 5)
#'   ) %>%
#'   gt() %>%
#'   tab_header(
#'     title = html(
#'       web_image(
#'         url = r_svg_url,
#'         height = px(50)
#'       )
#'     ),
#'     subtitle = html(
#'       web_image(
#'         url = r_svg_url,
#'         height = px(12)
#'       ) %>%
#'         rep(5)
#'     )
#'   )
#'
#' @section Figures:
#' \if{html}{\figure{man_web_image_1.svg}{options: width=100\%}}
#'
#' \if{html}{\figure{man_web_image_2.svg}{options: width=100\%}}
#'
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

  # Waiting for file to be written on async filesystems
  Sys.sleep(1)

  image_html <-
    local_image(
      file = "temp_ggplot.png",
      height = height)

  file.remove("temp_ggplot.png")

  image_html
}

#' Generate a path to a test image
#'
#' Two test images are available within the \pkg{gt} package. Both contain the
#' same imagery (sized at 200px by 200px) but one is a PNG file while the other
#' is an SVG file.
#' @param type the type of the image. Can either be \code{png} (the default) or
#'   \code{svg}.
#' @export
test_image <- function(type = c("png", "svg")) {

  type <- match.arg(type)

  if (type == "png") {
    system_file(file = "graphics/test_image.png")
  } else {
    system_file(file = "graphics/test_image.svg")
  }
}
