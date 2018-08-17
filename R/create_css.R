#' @importFrom sassr compile_sass
create_css <- function(data) {

  # Obtain the options table from `data`
  gt_options_tbl <- attr(data, "opts_df", exact = TRUE)

  # Create the SCSS file
  scss_lines <-
    paste(
      c("/* gt compiled CSS file */", "",
        paste0(
          "$", tidy_gsub(gt_options_tbl$parameter, "\\.", "_"), ": ",
          gt_options_tbl$value, ";"),
        readLines(system_file(file = "css/gt_default.scss"))),
      collapse = "\n")

  # Write the compiled CSS to disk
  writeLines(sassr::compile_sass(text = scss_lines), "compiled.css")
}
