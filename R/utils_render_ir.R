
create_col_group_ir <- function(data) {

  # Get the table `_boxhead` object, filter the table to
  # only the visible columns, and then arrange such that
  # the `stub` (if present) is first in the column series
  boxh <-
    dt_boxhead_get(data = data) %>%
    dplyr::filter(type %in% c("default", "stub")) %>%
    dplyr::arrange(dplyr::desc(type))

  # Get defult column alignments and column widths (if any)
  # from the `boxh` table
  col_alignments <- boxh[["column_align"]]
  col_widths <- unlist(boxh[["column_width"]])

  # Generate a <colgroup> element containing <col>s for each column
  if (is.null(col_widths)) {

    # Case where column widths aren't expressed: each <col>
    # element contains the default alignment for each column

    colgroup_element <-
      htmltools::tags$colgroup(
        lapply(
          col_alignments,
          FUN = function(align) {
            htmltools::tags$col(
              align = align
            )
          }
        )
      )

  } else {

    # Case where column widths *are* expressed: each <col>
    # element contains the default alignment for each column
    # and the width as well

    colgroup_element <-
      htmltools::tags$colgroup(
        mapply(
          SIMPLIFY = FALSE,
          USE.NAMES = FALSE,
          col_alignments,
          col_widths,
          FUN = function(x, width) {
            htmltools::tags$col(
              align = x,
              width = width
            )
          }
        )
      )
  }

  htmltools::tagList(colgroup_element)
}

create_heading_ir <- function(data) {

  # If there is no title or heading component, then return an empty string
  if (!dt_heading_has_title(data = data)) {
    return(htmltools::tagList())
  }
  heading <- dt_heading_get(data = data)
  footnotes_tbl <- dt_footnotes_get(data = data)
  styles_tbl <- dt_styles_get(data = data)
  stub_components <- dt_stub_components(data = data)
  subtitle_defined <- dt_heading_has_subtitle(data = data)

  # Get the footnote marks for the title
  if ("title" %in% footnotes_tbl$locname) {

    footnote_title_marks <-
      coalesce_marks(
        fn_tbl = footnotes_tbl,
        locname = "title"
      )

    footnote_title_marks <-
      footnote_mark_to_html(mark = footnote_title_marks$fs_id_c)

  } else {
    footnote_title_marks <- ""
  }

  # Get the style attrs for the title
  if ("title" %in% styles_tbl$locname) {

    title_style_rows <- dplyr::filter(styles_tbl, locname == "title")

    if (nrow(title_style_rows) > 0) {
      title_styles <- title_style_rows$html_style
    } else {
      title_styles <- NULL
    }

  } else {
    title_styles <- NA_character_
  }

  # Get the footnote marks for the subtitle
  if (subtitle_defined && "subtitle" %in% footnotes_tbl$locname) {

    footnote_subtitle_marks <-
      coalesce_marks(
        fn_tbl = footnotes_tbl,
        locname = "subtitle"
      )

    footnote_subtitle_marks <-
      footnote_mark_to_html(mark = footnote_subtitle_marks$fs_id_c)

  } else {
    footnote_subtitle_marks <- ""
  }

  # Get the style attrs for the subtitle
  if (subtitle_defined && "subtitle" %in% styles_tbl$locname) {

    subtitle_style_rows <- dplyr::filter(styles_tbl, locname == "subtitle")

    if (nrow(subtitle_style_rows) > 0) {
      subtitle_styles <- subtitle_style_rows$html_style
    } else {
      subtitle_styles <- NULL
    }

  } else {
    subtitle_styles <- NA_character_
  }

  # title_classes <- c("gt_heading", "gt_title", "gt_font_normal")
  #
  # subtitle_classes <- title_classes %>% tidy_sub("title", "subtitle")
  #
  # if (!subtitle_defined) {
  #   title_classes <- c(title_classes, "gt_bottom_border")
  # } else {
  #   subtitle_classes <- c(subtitle_classes, "gt_bottom_border")
  # }

  if (!subtitle_defined) {

    caption_element <-
      htmltools::tagList(
        htmltools::tags$caption(
          htmltools::tags$p(
            style = if (!is.na(title_styles)) title_styles else NULL,
            htmltools::HTML(paste0(heading$title, footnote_title_marks))
          )
        )
      )

  } else {

    caption_element <-
      htmltools::tagList(
        htmltools::tags$caption(
          htmltools::tags$p(
            htmltools::HTML(paste0(heading$title, footnote_title_marks))
          ),
          htmltools::tags$p(
            htmltools::HTML(paste0(heading$subtitle, footnote_subtitle_marks))
          )
        )
      )

  }

  caption_element
}
}
