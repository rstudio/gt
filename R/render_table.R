build_cell <- function(cell,
                       type = "final",
                       context = "html") {


  if (is.list(cell) && inherits(cell[[1]], "gt_cell")) {
    cell <- cell[[1]]
  }

  value <- cell[["value"]][[paste0("val_", type)]]
  location <- cell[["location"]]
  align <- cell[["cell_align"]]
  css_styles <- cell[["styles"]][["html"]]

  if (location == "body") {

    # TODO: create helper function for gathering classes
    css_classes <- c()
    css_classes <- c(css_classes, paste0("gt_", align))
    css_classes <- c(css_classes, "gt_row")
    css_classes <- paste(css_classes, collapse = " ")
    if (css_classes == "") css_classes <- character(0)

    tag <-
      htmltools::tags$td(
        class = css_classes,
        style = css_styles,
        htmltools::HTML(value)
      )

  } else if (location == "column_labels") {

    css_classes <- c()
    css_classes <- c(css_classes, paste0("gt_", align))
    css_classes <- c(css_classes, "gt_col_heading", "gt_bottom_border")
    css_classes <- paste(css_classes, collapse = " ")
    if (css_classes == "") css_classes <- character(0)

    tag <-
      htmltools::tags$th(
        class = css_classes,
        style = css_styles,
        htmltools::HTML(value)
      )
  } else if (location == "column_spanners") {

    css_classes <- c()
    css_classes <- c(css_classes, paste0("gt_", align))
    css_classes <- c(css_classes, "gt_columns_top_border", "gt_bottom_border", "gt_column_spanner_outer")
    css_classes <- paste(css_classes, collapse = " ")
    if (css_classes == "") css_classes <- character(0)

    tag <-
      htmltools::tags$th(
        class = css_classes,
        style = css_styles,
        htmltools::tags$span(
          class = "gt_column_spanner",
          htmltools::HTML(value)
        )
      )
  }

  tag
}

build_row <- function(tbl_gt, row, type = "final", context = "html") {

  htmltools::tagList(
    htmltools::tags$tr(
      tbl_gt[row, ] %>%
        dplyr::select(is.list) %>%
        as.list() %>%
        unname() %>%
        lapply(build_cell, type = type)
    )
  )
}

build_body <- function(tbl_gt, type = "final", context = "html") {

  rows <- seq(nrow(tbl_gt))

  htmltools::tags$tbody(
    class = "gt_table_body",
    rows %>%
      lapply(function(x) build_row(tbl_gt = tbl_gt, row = x, type = type))
  )
}

build_table <- function(tbl_gt, type = "final", context = "html") {

  table_body <- build_body(tbl_gt, type = type, context = context)

  htmltools::tags$table(
    class = "gt_table",
    table_body
  )
}


