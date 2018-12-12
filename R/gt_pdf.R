#' Export the gt table as a PDF file
#' @param data a table object that is created using the \code{\link{gt}()}
#' function.
#' @param file_name the output file name of the PDF file.
#' @examples
#' \dontrun{
#' # Use `countrypops` to create a gt table;
#' # export the table as a PDF file
#' countrypops %>%
#'   dplyr::select(-contains("code")) %>%
#'   dplyr::filter(country_name == "Mongolia") %>%
#'   tail(5) %>%
#'   gt() %>%
#'   cols_align(
#'     align = "left",
#'     columns = vars(population)
#'   ) %>%
#'   gt_pdf(file_name = "countrypops.pdf")
#' }
#' @family table export functions
#' @export
gt_pdf <- function(data,
                   file_name = NULL) {

  # Export the gt object to a PDF file
  gt_export_image_pdf(
    data = data,
    output_type = "pdf",
    file_name = file_name)
}

#' Export the gt table as a PNG file
#' @param data a table object that is created using the \code{\link{gt}()}
#'   function.
#' @param file_name the output file name of the PNG file.
#' @param quality the quality level of the rendered image file. Can be any
#'   integer in the range of \code{0} to \code{100}, where higher numbers result
#'   in higher quality graphics. The default quality level is \code{95}, which
#'   produces high quality graphics at modest file sizes.
#' @param trim_lr an option to trim horizontal whitespace of the resulting
#'   graphic. By default, this whitespace is removed, resulting in a graphic
#'   that is tightly cropped to the table content.
#' @examples
#' \dontrun{
#' # Use `countrypops` to create a gt table;
#' # export the table as a PNG file
#' countrypops %>%
#'   dplyr::select(-contains("code")) %>%
#'   dplyr::filter(country_name == "Mongolia") %>%
#'   tail(5) %>%
#'   gt() %>%
#'   cols_align(
#'     align = "left",
#'     columns = vars(population)
#'   ) %>%
#'   gt_png(file_name = "countrypops.png")
#' }
#' @family table export functions
#' @export
gt_png <- function(data,
                   file_name = NULL,
                   quality = 95,
                   trim_lr = TRUE) {

  # Export the gt object to a PDF file
  gt_export_image_pdf(
    data = data,
    output_type = "png",
    file_name = file_name,
    quality = quality,
    trim_lr = trim_lr)
}

#' Export the gt table as a JPG file
#' @param data a table object that is created using the \code{\link{gt}()}
#' function.
#' @param file_name the output file name of the JPG file.
#' @inheritParams gt_png
#' @examples
#' \dontrun{
#' # Use `countrypops` to create a gt table;
#' # export the table as a JPG file
#' countrypops %>%
#'   dplyr::select(-contains("code")) %>%
#'   dplyr::filter(country_name == "Mongolia") %>%
#'   tail(5) %>%
#'   gt() %>%
#'   cols_align(
#'     align = "left",
#'     columns = vars(population)
#'   ) %>%
#'   gt_jpg(file_name = "countrypops.jpg")
#' }
#' @family table export functions
#' @importFrom png readPNG
#' @export
gt_jpg <- function(data,
                   file_name = NULL,
                   quality = 95,
                   trim_lr = TRUE) {

  # Export the gt object to a PDF file
  gt_export_image_pdf(
    data = data,
    output_type = "jpg",
    file_name = file_name,
    quality = quality,
    trim_lr = trim_lr)
}

# Main image export function for use via the
# `wkhtmltopdf` and `wkhtmltoimage` binaries
gt_export_image_pdf <- function(data,
                                output_type = NULL,
                                file_name = NULL,
                                quality = 95,
                                trim_lr = TRUE) {

  # Create a path to a temporary directory
  tempdir <- tempdir()

  # Write the table HTML to a temporary file
  data %>%
    as_raw_html(inline_css = TRUE) %>%
    cat(file = paste0(tempdir, "/gt_table.html"))

  # Create a path for temporary storage of the HTML file
  gt_table_path <- path.expand(paste0(tempdir, "/gt_table.html"))

  # Generate the full output file path
  output_path <- path.expand(paste0(getwd(), "/", file_name))

  if (output_type == "pdf") {

    png_args <- "--quiet --format png --width 0 --enable-smart-width"

    # Get the dimensions of the table by converting to PNG first
    system(
      paste(
        find_wkhtml_binary(type = "image"),
        format_args,
        gt_table_path,
        path.expand(paste0(tempdir, "/gt_table.png"))))

    png_info <- png::readPNG(path.expand(paste0(tempdir, "/gt_table.png")), info = TRUE)

    png_dim <- attributes(png_info)$info$dim

    # Determine if the `wkhtmltopdf` binary is in the path
    wkhtml_bin <- find_wkhtml_binary(type = "pdf")

    # Set margins
    margins_args <- "--margin-top 2 --margin-bottom 2 --margin-left 2 --margin-right 2"

    # Use the `wkhtmltopdf` binary to generate a PDF file
    # in the working directory
    system(paste(wkhtml_bin, margins_args, gt_table_path, output_path))
  }

  if (trim_lr) {
    trim_lr_args <- "--width 0 --enable-smart-width"
  } else {
    trim_lr_args <- ""
  }

  if (output_type %in% c("png", "jpg", "bmp")) {

    # Determine if the `wkhtmltoimage` binary is in the path
    wkhtml_bin <- find_wkhtml_binary(type = "image")

    format_arg <- paste0("--format ", output_type)

    quality_arg <- paste0("--quality ", quality)

    # Use the `wkhtmltoimage` binary to generate a PDF file
    # in the working directory
    system(
      paste(
        wkhtml_bin,
        format_arg, quality_arg, trim_lr_args,
        gt_table_path, output_path)
    )
  }
}

find_wkhtml_binary <- function(type = c("pdf", "image")) {

  # Get the path of the appropriate binary executable file
  if (type == "pdf") {
    path <- Sys.which("wkhtmltopdf")
  } else if (type == "image") {
    path <- Sys.which("wkhtmltoimage")
  }

  if (path != "") {
    return(path)
  }

  if (path == "") {

    # A `stop()` statement would make sense here, however, that approach would be
    # problematic with CRAN. The CRAN checking systems will likely not have the
    # `wkhtmltopdf` binary, resulting in an R CMD check ERROR. To get around this,
    # we'll provide an informative message and return NULL
    message(
      "To enable exporting to image formats or PDF, you need to have the ",
      "appropriate binary executable files available on your PATH. They can ",
      "be easily added by getting the installation file for your system at ",
      "`https://wkhtmltopdf.org/downloads.html`. Once installed, please retry ",
      "exporting the gt table."
    )
    return(NULL)
  }

  path.expand(path)
}
