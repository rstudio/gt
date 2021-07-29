
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
      htmltools::tag(
        `_tag_name` = "coldefs",
        varArgs =
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
      htmltools::tag(
        `_tag_name` = "coldefs",
        varArgs =
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
        htmltools::tag(
          `_tag_name` = "heading",
          varArgs =
            htmltools::tagList(
              htmltools::tag(
                `_tag_name` = "cell",
                varArgs =
                  htmltools::HTML(paste0(heading$title, footnote_title_marks))
              )
            )
        )
      )

  } else {

    caption_element <-
      htmltools::tagList(
        htmltools::tag(
          `_tag_name` = "heading",
          varArgs =
            htmltools::tagList(
              htmltools::tag(
                `_tag_name` = "cell",
                varArgs = htmltools::HTML(paste0(heading$title, footnote_title_marks))
              ),
              htmltools::tag(
                `_tag_name` = "cell",
                varArgs = htmltools::HTML(paste0(heading$subtitle, footnote_subtitle_marks))
              )
            )
        )
      )

  }

  caption_element
}

create_columns_ir <- function(data) {

  boxh <- dt_boxhead_get(data = data)
  stubh <- dt_stubhead_get(data = data)

  styles_tbl <- dt_styles_get(data = data)
  stub_available <- dt_stub_df_exists(data = data)
  spanners_present <- dt_spanners_exists(data = data)

  # Get the column alignments for all visible columns
  col_alignment <- dplyr::pull(subset(boxh, type == "default"), column_align)

  # Get the column headings
  headings_vars <- dplyr::pull(subset(boxh, type == "default"), var)
  headings_labels <- dt_boxhead_get_vars_labels_default(data = data)

  # Should the column labels be hidden?
  column_labels_hidden <-
    dt_options_get_value(
      data = data,
      option = "column_labels_hidden"
    )

  if (column_labels_hidden) {
    return(htmltools::tagList())
  }

  columns_tr_element <-
    htmltools::tags$tr(
      lapply(
        headings_labels,
        FUN = function(x) {
          htmltools::tags$th(x)
        }
      )
    )

  # If `stub_available` == TRUE, then replace with a set stubhead
  # label or nothing
  if (isTRUE(stub_available) && length(stubh$label) > 0) {

    headings_labels <- prepend_vec(headings_labels, stubh$label)
    headings_vars <- prepend_vec(headings_vars, "::stub")

  } else if (isTRUE(stub_available)) {

    headings_labels <- prepend_vec(headings_labels, "")
    headings_vars <- prepend_vec(headings_vars, "::stub")
  }

  if (spanners_present) {

    # Get vector of group labels (spanners)
    spanners <- dt_spanners_print(data = data, include_hidden = FALSE)
    spanner_ids <- dt_spanners_print(data = data, include_hidden = FALSE, ids = TRUE)

    if (stub_available) {
      spanners <- c(NA_character_, spanners)
      spanner_ids <- c(NA_character_, spanner_ids)
    }

    spanners_rle <- unclass(rle(spanner_ids))

    # We need a parallel vector of spanner labels and this could
    # be part of the `spanners_rle` list
    spanners_rle$labels <- spanners[cumsum(spanners_rle$lengths)]

    spanners_tr_element <-
      htmltools::tags$tr(
        mapply(
          SIMPLIFY = FALSE,
          USE.NAMES = FALSE,
          spanners_rle$labels,
          spanners_rle$lengths,
          FUN = function(x, length) {
            htmltools::tags$th(
              colspan = if (length > 1) length else NULL,
              style = htmltools::css(
                `text-align` = if (is.na(x)) NULL else "center"
              ),
              if (!is.na(x)) x else NULL
            )
          }
        )
      )

  } else {
    spanners_tr_element <- NULL
  }

  htmltools::tagList(spanners_tr_element, columns_tr_element)
}
