#' @import sassr
compile_css <- function(data) {

  # Obtain the options table from `data`
  gt_options_tbl <- attr(data, "opts_df", exact = TRUE)

  # Perform NA replacements for background colors
  if (is.na(opts_df_get(gt_options_tbl, "heading_background_color"))) {

    gt_options_tbl <-
      opts_df_set(
        gt_options_tbl,
        option = "heading_background_color",
        value = opts_df_get(gt_options_tbl, "table_background_color"))
  }

  if (is.na(opts_df_get(gt_options_tbl, "boxhead_background_color"))) {

    gt_options_tbl <-
      opts_df_set(
        gt_options_tbl,
        option = "boxhead_background_color",
        value = opts_df_get(gt_options_tbl, "table_background_color"))
  }

  if (is.na(opts_df_get(gt_options_tbl, "stub_group_background_color"))) {

    gt_options_tbl <-
      opts_df_set(
        gt_options_tbl,
        option = "stub_group_background_color",
        value = opts_df_get(gt_options_tbl, "table_background_color"))
  }

  if (is.na(opts_df_get(gt_options_tbl, "stub_group_field_background_color"))) {

    gt_options_tbl <-
      opts_df_set(
        gt_options_tbl,
        option = "stub_group_field_background_color",
        value = opts_df_get(gt_options_tbl, "table_background_color"))
  }

  if (is.na(opts_df_get(gt_options_tbl, "summary_row_background_color"))) {

    gt_options_tbl <-
      opts_df_set(
        gt_options_tbl,
        option = "summary_row_background_color",
        value = opts_df_get(gt_options_tbl, "table_background_color"))
  }

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
