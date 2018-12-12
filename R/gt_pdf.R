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
#' function.
#' @param file_name the output file name of the PNG file.
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
                   file_name = NULL) {

  # Export the gt object to a PDF file
  gt_export_image_pdf(
    data = data,
    output_type = "png",
    file_name = file_name)
}


gt_export_image_pdf <- function(data,
                                output_type = NULL,
                                file_name = NULL) {

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

    format_args <- "--format png"

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

  if (output_type == "png") {

    # Determine if the `wkhtmltopdf` binary is in the path
    wkhtml_bin <- find_wkhtml_binary(type = "image")

    format_arg <- "--format png --width 0 --enable-smart-width"

    quality_arg <- "--quality 80"

    # Use the `wkhtmltopdf` binary to generate a PDF file
    # in the working directory
    system(
      paste(wkhtml_bin, format_arg, quality_arg, gt_table_path, output_path)
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

# Possible locations of the `wkhtmltopdf` executable
# wkhtmltopdf_paths <- function() {
#   if (is_windows()) {
#     path <- Sys.getenv('APPDATA', '')
#     path <- if (dir_exists(path)) {
#       file.path(path, 'wkhtmltopdf')
#     }
#   } else if (is_osx()) {
#     path <- '~/Library/Application Support'
#     path <- if (dir.exists(path)) {
#       file.path(path, 'wkhtmltopdf')
#     }
#   } else {
#     path <- '~/bin'
#   }
# }

# is_windows <- function() {
#   .Platform$OS.type == "windows"
# }
#
# is_osx <- function() {
#   Sys.info()[['sysname']] == 'Darwin'
# }
#
# is_linux <- function() {
#   Sys.info()[['sysname']] == 'Linux'
# }
#
# is_solaris <- function() {
#   Sys.info()[['sysname']] == 'SunOS'
# }

