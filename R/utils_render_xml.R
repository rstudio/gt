# XML tag functions


xml_tag_type <- function(tag_name, app) {
  paste0(substring(app, 1, 1), ":", tag_name)
}

xml_tbl <- function(..., app = "word") {
  htmltools::tag(`_tag_name` = xml_tag_type("tbl", app), varArgs = list(htmltools::HTML(paste0(...))))
}

xml_tblPr <- function(..., app = "word") {
  htmltools::tag(`_tag_name` = xml_tag_type("tblPr", app), varArgs = list(htmltools::HTML(paste0(...))))
}

xml_tblStyle <- function(..., val = "Table", app = "word") {
  tag <- htmltools::tag(`_tag_name` = xml_tag_type("tblStyle", app), varArgs = list(htmltools::HTML(paste0(...))))
  tag <- htmltools::tagAppendAttributes(tag, `w:val` = val)
  tag
}

xml_tblW <- function(..., type = "pct", w = "0.0", app = "word") {
  tag <- htmltools::tag(`_tag_name` = xml_tag_type("tblW", app), varArgs = list(htmltools::HTML(paste0(...))))
  tag <- htmltools::tagAppendAttributes(tag, type = type)
  tag <- htmltools::tagAppendAttributes(tag, w = w)
  tag
}

xml_tblLook <- function(...,
                        first_row = "1",
                        last_row = "0",
                        first_column = "0",
                        last_column = "0",
                        no_h_band = "0",
                        no_v_band = "0",
                        val = "0020",
                        app = "word") {

  tag <- htmltools::tag(`_tag_name` = xml_tag_type("tblLook", app), varArgs = list(htmltools::HTML(paste0(...))))
  tag <-
    htmltools::tagAppendAttributes(
      tag,
      `w:firstRow` = first_row,
      `w:lastRow` = last_row,
      `w:firstColumn` = first_column,
      `w:lastColumn` = last_column,
      `w:noHBand` = no_h_band,
      `w:noVBand` = no_v_band,
      `w:val` = val
    )
  tag
}

# TODO: should be self-closing
xml_tblGrid <- function(..., app = "word") {
  htmltools::tag(`_tag_name` = xml_tag_type("tblGrid", app), varArgs = list(htmltools::HTML(paste0(...))))
}

xml_tr <- function(..., app = "word") {
  htmltools::tag(`_tag_name` = xml_tag_type("tr", app), varArgs = list(htmltools::HTML(paste0(...))))
}

xml_tc <- function(..., app = "word") {
  htmltools::tag(`_tag_name` = xml_tag_type("tc", app), varArgs = list(htmltools::HTML(paste0(...))))
}

xml_p <- function(..., app = "word") {
  htmltools::tag(`_tag_name` = xml_tag_type("p", app), varArgs = list(htmltools::HTML(paste0(...))))
}

xml_pPr <- function(..., app = "word") {
  htmltools::tag(`_tag_name` = xml_tag_type("pPr", app), varArgs = list(htmltools::HTML(paste0(...))))
}

xml_gridSpan <- function(..., val = "1", app = "word") {
  tag <- htmltools::tag(`_tag_name` = xml_tag_type("gridSpan", app), varArgs = list(htmltools::HTML(paste0(...))))
  tag <- htmltools::tagAppendAttributes(tag, `w:val` = val)
  tag
}

# TODO: should be self-closing
xml_pStyle <- function(..., app = "word", val = "Compact") {
  tag <- htmltools::tag(`_tag_name` = xml_tag_type("pStyle", app), varArgs = list(htmltools::HTML(paste0(...))))
  tag <- htmltools::tagAppendAttributes(tag, `w:val` = val)
  tag
}

# TODO: should be self-closing
xml_jc <- function(..., app = "word", val = c("left", "center", "right")) {
  val <- match.arg(val)
  tag <- htmltools::tag(`_tag_name` = xml_tag_type("jc", app), varArgs = list(htmltools::HTML(paste0(...))))
  tag <- htmltools::tagAppendAttributes(tag, `w:val` = val)
  tag
}

xml_r <- function(..., app = "word") {
  htmltools::tag(`_tag_name` = xml_tag_type("r", app), varArgs = list(htmltools::HTML(paste0(...))))
}

xml_rPr <- function(..., app = "word") {
  htmltools::tag(`_tag_name` = xml_tag_type("rPr", app), varArgs = list(htmltools::HTML(paste0(...))))
}

xml_t <- function(..., app = "word", xml_space = "preserve") {
  tag <- htmltools::tag(`_tag_name` = xml_tag_type("t", app), varArgs = list(htmltools::HTML(paste0(...))))
  tag <- htmltools::tagAppendAttributes(tag, `xml:space` = xml_space)
  tag
}

xml_vert_align <- function(..., app = "word", val = c("superscript", "subscript", "baseline")) {
  val <- match.arg(val)
  tag <- htmltools::tag(`_tag_name` = xml_tag_type("vertAlign", app), varArgs = list(htmltools::HTML(paste0(...))))
  tag <- htmltools::tagAppendAttributes(tag, `w:val` = val)
  tag
}

#' Transform a footnote mark to an XML representation
#'
#' @noRd
footnote_mark_to_xml <- function(mark) {

  as.character(
    htmltools::tagList(
      xml_rPr(
        xml_vert_align(val = "superscript"),
        xml_t(mark)
      )
    )
  )
}

# styles_to_html <- function(styles) {
#
#   vapply(
#     styles,
#     FUN.VALUE = character(1), USE.NAMES = FALSE,
#     FUN = function(x) {
#
#       if (any(is.null(names(x)))) {
#
#         style <- gsub(":", ": ", x, fixed = TRUE)
#
#       } else if (all(names(x) != "")) {
#
#         x <- cell_style_to_html(x)
#
#         style <-
#           paste0(names(x), ": ", x, ";", collapse = " ") %>%
#           tidy_gsub(";;", ";")
#
#       } else {
#         style <- as.character(x)
#       }
#
#       style
#     }
#   ) %>%
#     paste(collapse = " ") %>%
#     tidy_gsub("\n", " ")
# }

# cell_style_to_html <- function(style) {
#   UseMethod("cell_style_to_html")
# }

# cell_style_to_html.default <- function(style) {
#
#   utils::str(style)
#
#   stop("Implement `cell_style_to_html()` for the object above.", call. = FALSE)
# }

# # Upgrade `_styles` to gain a `html_style` column with CSS style rules
# add_css_styles <- function(data) {
#
#   styles_tbl <- dt_styles_get(data = data)
#
#   if (nrow(styles_tbl) > 0) {
#     styles_tbl <-
#       dplyr::mutate(
#         styles_tbl,
#         html_style = vapply(
#           styles, function(x) styles_to_html(x), character(1))
#       )
#   }
#
#   dt_styles_set(data = data, styles = styles_tbl)
# }

# #' For a given location, reduce the footnote marks to a single string
# #'
# #' @param fn_tbl The table containing all of the resolved footnote information.
# #' @param locname The location name for the footnotes.
# #' @param delimiter The delimiter to use for the coalesced footnote marks.
# #' @noRd
# coalesce_marks <- function(fn_tbl,
#                            locname,
#                            delimiter = ",") {
#
#   locname_enquo <- rlang::enquo(locname)
#
#   fn_tbl %>%
#     dplyr::filter(locname == !!locname) %>%
#     dplyr::summarize(fs_id_c = paste(fs_id, collapse = delimiter))
# }


# TODO: make this work for XML
# Get the attributes for the table tag
get_table_defs_xml <- function(data) {

  boxh <- dt_boxhead_get(data = data)

  # Get the `table-layout` value, which is set in `_options`
  table_style <-
    paste0(
      "table-layout: ",
      dt_options_get_value(
        data = data,
        option = "table_layout"
      ),
      ";"
    )

  # In the case that column widths are not set for any columns,
  # there should not be a `<colgroup>` tag requirement
  if (length(unlist(boxh$column_width)) < 1) {
    return(list(table_style = NULL, table_colgroups = NULL))
  }

  # Get the table's width (which or may not have been set)
  table_width <-
    dt_options_get_value(
      data = data,
      option = "table_width"
    )

  widths <-
    boxh %>%
    dplyr::filter(type %in% c("default", "stub")) %>%
    dplyr::arrange(dplyr::desc(type)) %>% # This ensures that the `stub` is first
    .$column_width %>%
    unlist()

  # Stop function if all length dimensions (where provided)
  # don't conform to accepted CSS length definitions
  validate_css_lengths(widths)

  # If all of the widths are defined as px values for all columns,
  # then ensure that the width values are strictly respected as
  # absolute width values (even if a table width has already been set)
  if (all(grepl("px", widths)) && table_width == "auto") {
    table_width <- "0px"
  }

  if (all(grepl("%", widths)) && table_width == "auto") {
    table_width <- "100%"
  }

  if (table_width != "auto") {
    table_style <- paste(table_style, paste0("width: ", table_width), sep = "; ")
  }

  # Create the `<colgroup>` tag
  table_colgroups <-
    htmltools::tags$colgroup(
      lapply(
        widths,
        FUN = function(width) {
          htmltools::tags$col(style = htmltools::css(width = width))
        })
    )

  list(
    table_style = table_style,
    table_colgroups = table_colgroups
  )
}

#' Create the heading component of a table (OOXML)
#'
#' The table heading component contains the title and possibly a subtitle; if
#' there are no heading components defined this function will return an empty
#' string.
#'
#' @noRd
create_heading_component_xml <- function(data) {

  # If there is no title or heading component, then return an empty string
  if (!dt_heading_has_title(data = data)) {
    return("")
  }

  heading <- dt_heading_get(data = data)
  footnotes_tbl <- dt_footnotes_get(data = data)
  styles_tbl <- dt_styles_get(data = data)
  stub_components <- dt_stub_components(data = data)
  subtitle_defined <- dt_heading_has_subtitle(data = data)

  # Obtain the number of visible columns in the built table
  n_data_cols <- length(dt_boxhead_get_vars_default(data = data))

  # Determine whether the stub is available
  stub_available <- dt_stub_components_has_rowname(stub_components)

  # If a stub is present then the effective number of columns increases by 1
  if (stub_available) {
    n_cols <- n_data_cols + 1
  } else {
    n_cols <- n_data_cols
  }

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

  title_classes <- c("gt_heading", "gt_title", "gt_font_normal")

  subtitle_classes <- title_classes %>% tidy_sub("title", "subtitle")

  if (!subtitle_defined) {
    title_classes <- c(title_classes, "gt_bottom_border")
  } else {
    subtitle_classes <- c(subtitle_classes, "gt_bottom_border")
  }

  title_row <-
    htmltools::tags$tr(
      htmltools::tags$th(
        colspan = n_cols,
        class = paste(title_classes, collapse = " "),
        style = title_styles,
        htmltools::HTML(
          paste0(heading$title, footnote_title_marks)
        )
      )
    )

  if (subtitle_defined) {

    subtitle_row <-
      htmltools::tags$tr(
        htmltools::tags$th(
          colspan = n_cols,
          class = paste(subtitle_classes, collapse = " "),
          style = subtitle_styles,
          htmltools::HTML(
            paste0(heading$subtitle, footnote_subtitle_marks)
          )
        )
      )

  } else {
    subtitle_row <- ""
  }

  htmltools::tags$thead(
    class = "gt_header",
    title_row,
    subtitle_row
  )
}

#' Create the columns component of a table (OOXML)
#'
#' @noRd
create_columns_component_xml <- function(data) {

  boxh <- dt_boxhead_get(data = data)
  stubh <- dt_stubhead_get(data = data)
  body <- dt_body_get(data = data)
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
    return("")
  }

  # Get the style attrs for the stubhead label
  stubhead_style_attrs <- subset(styles_tbl, locname == "stubhead")

  # Get the style attrs for the spanner column headings
  spanner_style_attrs <- subset(styles_tbl, locname == "columns_groups")

  # Get the style attrs for the spanner column headings
  column_style_attrs <- subset(styles_tbl, locname == "columns_columns")

  # If `stub_available` == TRUE, then replace with a set stubhead
  # label or nothing
  if (isTRUE(stub_available) && length(stubh$label) > 0) {

    headings_labels <- prepend_vec(headings_labels, stubh$label)
    headings_vars <- prepend_vec(headings_vars, "::stub")

  } else if (isTRUE(stub_available)) {

    headings_labels <- prepend_vec(headings_labels, "")
    headings_vars <- prepend_vec(headings_vars, "::stub")
  }

  stubhead_label_alignment <- "left"

  table_col_headings <- list()

  if (!spanners_present) {

    # Create the cell for the stubhead label
    if (isTRUE(stub_available)) {

      stubhead_style <-
        if (nrow(stubhead_style_attrs) > 0) {
          stubhead_style_attrs$html_style
        } else {
          NULL
        }

      table_col_headings[[length(table_col_headings) + 1]] <-
        xml_tc(
          xml_p(
            xml_pPr(),
            xml_r(
              xml_t(
                headings_labels[1]
              )
            )
          )
        )

      headings_vars <- headings_vars[-1]
      headings_labels <- headings_labels[-1]
    }

    for (i in seq(headings_vars)) {

      styles_column <- subset(column_style_attrs, colnum == i)

      column_style <-
        if (nrow(styles_column) > 0) {
          styles_column$html_style
        } else {
          NULL
        }

      table_col_headings[[length(table_col_headings) + 1]] <-
        xml_tc(
          xml_p(
            xml_pPr(),
            xml_r(
              xml_t(
                headings_labels[i]
              )
            )
          )
        )
    }

    table_col_headings <-
      xml_tr(
        paste(
          vapply(
            table_col_headings,
            FUN.VALUE = character(1),
            FUN = paste
          ),
          collapse = ""
        )
      )
  }

  if (spanners_present) {

    spanners <- dt_spanners_print(data = data, include_hidden = FALSE)
    spanner_ids <- dt_spanners_print(data = data, include_hidden = FALSE, ids = TRUE)

    # A list of <th> elements that will go in the top row. This includes
    # spanner labels and column labels for solo columns (don't have spanner
    # labels); in the latter case, rowspan=2 will be used.
    first_set <- list()
    # A list of <th> elements that will go in the second row. This is all column
    # labels that DO have spanners above them.
    second_set <- list()

    # Create the cell for the stubhead label
    if (stub_available) {

      stubhead_style <-
        if (nrow(stubhead_style_attrs) > 0) {
          stubhead_style_attrs$html_style
        } else {
          NULL
        }

      first_set[[length(first_set) + 1]] <-
        htmltools::tags$th(
          class = paste(
            c(
              "gt_col_heading",
              "gt_columns_bottom_border",
              paste0("gt_", stubhead_label_alignment)
            ),
            collapse = " "),
          rowspan = 2,
          colspan = 1,
          style = stubhead_style,
          htmltools::HTML(headings_labels[1])
        )

      headings_vars <- headings_vars[-1]
      headings_labels <- headings_labels[-1]
    }

    # NOTE: rle treats NA values as distinct from each other; in other words,
    # each NA value starts a new run of length 1.
    spanners_rle <- rle(spanner_ids)
    # sig_cells contains the indices of spanners' elements where the value is
    # either NA, or, is different than the previous value. (Because NAs are
    # distinct, every NA element will be present sig_cells.)
    sig_cells <- c(1, utils::head(cumsum(spanners_rle$lengths) + 1, -1))
    # colspans matches spanners in length; each element is the number of
    # columns that the <th> at that position should span. If 0, then skip the
    # <th> at that position.
    colspans <- ifelse(
      seq_along(spanners) %in% sig_cells,
      # Index back into the rle result, working backward through sig_cells
      spanners_rle$lengths[match(seq_along(spanner_ids), sig_cells)],
      0
    )

    for (i in seq(headings_vars)) {

      if (is.na(spanner_ids[i])) {

        styles_heading <-
          dplyr::filter(
            styles_tbl,
            locname == "columns_columns",
            colname == headings_vars[i]
          )

        heading_style <-
          if (nrow(styles_heading) > 0) {
            styles_heading$html_style
          } else {
            NULL
          }

        first_set_alignment <-
          dt_boxhead_get_alignment_by_var(data = data, headings_vars[i])

        first_set[[length(first_set) + 1]] <-
          htmltools::tags$th(
            class = paste(
              c(
                "gt_col_heading",
                "gt_columns_bottom_border",
                paste0("gt_", first_set_alignment)
              ),
              collapse = " "),
            rowspan = 2,
            colspan = 1,
            style = heading_style,
            htmltools::HTML(headings_labels[i])
          )

      } else if (!is.na(spanner_ids[i])) {

        # If colspans[i] == 0, it means that a previous cell's colspan
        # will cover us.
        if (colspans[i] > 0) {
          class <- "gt_column_spanner"

          styles_spanners <-
            dplyr::filter(
              spanner_style_attrs,
              locname == "columns_groups",
              grpname == spanner_ids[i]
            )

          spanner_style <-
            if (nrow(styles_spanners) > 0) {
              styles_spanners$html_style
            } else {
              NULL
            }

          first_set[[length(first_set) + 1]] <-
            htmltools::tags$th(
              class = paste(
                c(
                  "gt_center",
                  "gt_columns_top_border",
                  "gt_column_spanner_outer"
                ),
                collapse = " "
              ),
              rowspan = 1,
              colspan = colspans[i],
              style = spanner_style,
              htmltools::tags$span(
                class = "gt_column_spanner",
                htmltools::HTML(spanners[i])
              )
            )
        }
      }
    }

    solo_headings <- headings_vars[is.na(spanner_ids)]
    remaining_headings <- headings_vars[!(headings_vars %in% solo_headings)]

    remaining_headings_indices <- which(remaining_headings %in% headings_vars)

    remaining_headings_labels <-
      boxh %>%
      dplyr::filter(var %in% remaining_headings) %>%
      dplyr::pull(column_label) %>%
      unlist()

    col_alignment <-
      col_alignment[-1][!(headings_vars %in% solo_headings)]

    if (length(remaining_headings) > 0) {

      second_set <- c()

      for (j in seq(remaining_headings)) {

        styles_remaining <-
          dplyr::filter(
            styles_tbl,
            locname == "columns_columns",
            colname == remaining_headings[j]
          )

        remaining_style <-
          if (nrow(styles_remaining) > 0) {
            styles_remaining$html_style
          } else {
            NULL
          }

        remaining_alignment <-
          dt_boxhead_get_alignment_by_var(data = data, remaining_headings[j])

        second_set[[length(second_set) + 1]] <-
          htmltools::tags$th(
            class = paste(
              c(
                "gt_col_heading",
                "gt_columns_bottom_border",
                paste0("gt_", remaining_alignment)
              ),
              collapse = " "
            ),
            rowspan = 1, colspan = 1,
            style = remaining_style,
            htmltools::HTML(remaining_headings_labels[j])
          )
      }

      table_col_headings <-
        htmltools::tagList(
          htmltools::tags$tr(first_set),
          htmltools::tags$tr(second_set)
        )

    } else {

      # Create the `table_col_headings` HTML component
      table_col_headings <- htmltools::tags$tr(first_set)
    }
  }

  htmltools::tagList(table_col_headings)
}

#' Create the table body component (OOXML)
#'
#' @noRd
create_body_component_xml <- function(data) {

  boxh <- dt_boxhead_get(data = data)
  body <- dt_body_get(data = data)

  summaries_present <- dt_summary_exists(data = data)
  list_of_summaries <- dt_summary_df_get(data = data)
  groups_rows_df <- dt_groups_rows_get(data = data)
  stub_components <- dt_stub_components(data = data)

  styles_tbl <- dt_styles_get(data = data)

  n_data_cols <- length(dt_boxhead_get_vars_default(data = data))
  n_rows <- nrow(body)

  # Get the column alignments for the data columns (this
  # doesn't include the stub alignment)
  col_alignment <- boxh[boxh$type == "default", ][["column_align"]]

  # Determine whether the stub is available through analysis
  # of the `stub_components`
  stub_available <- dt_stub_components_has_rowname(stub_components)

  # Obtain all of the visible (`"default"`), non-stub
  # column names for the table
  default_vars <- dt_boxhead_get_vars_default(data = data)

  all_default_vals <- unname(as.matrix(body[, default_vars]))

  alignment_classes <- paste0("gt_", col_alignment)

  if (stub_available) {

    n_cols <- n_data_cols + 1

    alignment_classes <- c("gt_left", alignment_classes)

    stub_var <- dt_boxhead_get_var_stub(data = data)
    all_stub_vals <- as.matrix(body[, stub_var])

  } else {
    n_cols <- n_data_cols
  }

  # Define function to get a character vector of formatted cell
  # data (this includes the stub, if it is present)
  output_df_row_as_vec <- function(i) {

    default_vals <- all_default_vals[i, ]

    if (stub_available) {
      default_vals <- c(all_stub_vals[i], default_vals)
    }

    default_vals
  }

  # Get the sequence of column numbers in the table body (these
  # are the visible columns in the table exclusive of the stub)
  column_series <- seq(n_cols)

  # Replace an NA group with an empty string
  if (any(is.na(groups_rows_df$group_label))) {

    groups_rows_df <-
      groups_rows_df %>%
      dplyr::mutate(group_label = ifelse(is.na(group_label), "", group_label)) %>%
      dplyr::mutate(group_label = gsub("^NA", "\u2014", group_label))
  }

  # Is the stub to be striped?
  table_stub_striped <-
    dt_options_get_value(
      data = data,
      option = "row_striping_include_stub"
    )

  # Are the rows in the table body to be striped?
  table_body_striped <-
    dt_options_get_value(
      data = data,
      option = "row_striping_include_table_body"
    )

  extra_classes_1 <- rep_len(list(NULL), n_cols)

  extra_classes_2 <-
    rep_len(list(if (table_body_striped) "gt_striped" else NULL), n_cols)

  if (stub_available) {

    extra_classes_1[[1]] <- "gt_stub"

    extra_classes_2[[1]] <-
      c("gt_stub", if (table_stub_striped) "gt_striped" else NULL)
  }

  has_tbl_body_styles <- any(c("stub", "data") %in% styles_tbl$locname)
  has_row_group_styles <- "row_groups" %in% styles_tbl$locname

  if (has_tbl_body_styles) {
    styles_tbl_body <- subset(styles_tbl, locname %in% c("stub", "data"))
  } else {
    row_styles <- rep_len(list(NULL), n_cols)
  }

  if (has_row_group_styles) {
    styles_tbl_row_groups <- subset(styles_tbl, locname == "row_groups")
  }

  body_rows <-
    lapply(
      seq_len(n_rows),
      function(i) {

        body_section <- list()

        #
        # Create a group heading row
        #
        if (!is.null(groups_rows_df) && i %in% groups_rows_df$row_start) {

          group_id <-
            groups_rows_df[
              which(groups_rows_df$row_start %in% i), "group_id"
            ][[1]]

          group_label <-
            groups_rows_df[
              which(groups_rows_df$row_start %in% i), "group_label"
            ][[1]]

          if (has_row_group_styles) {

            styles_row <-
              styles_tbl_row_groups[styles_tbl_row_groups$grpname == group_id, ]

            row_style <-
              if (nrow(styles_row) > 0) {
                styles_row$html_style
              } else {
                NULL
              }

          } else {
            row_style <- NULL
          }

          group_class <-
            if (group_label == "") {
              "gt_empty_group_heading"
            } else {
              "gt_group_heading"
            }

          group_heading_row <-
            htmltools::tags$tr(
              class = "gt_group_heading_row",
              htmltools::tags$td(
                colspan = n_cols,
                class = group_class,
                style = row_style,
                htmltools::HTML(group_label)
              )
            )

          body_section <- append(body_section, list(group_heading_row))
        }

        #
        # Create a body row
        #

        extra_classes <- if (i %% 2 == 0) extra_classes_2 else extra_classes_1

        if (has_tbl_body_styles) {

          styles_row <-
            styles_tbl_body[styles_tbl_body$rownum == i, ]

          row_styles <-
            build_row_styles(
              styles_resolved_row = styles_row,
              stub_available = stub_available,
              n_cols = n_cols
            )
        }

        row_cells <- list()

        for (y in seq_along(output_df_row_as_vec(i))) {

          row_cells[[length(row_cells) + 1]] <-
            xml_tc(
              xml_p(
                xml_pPr(),
                xml_r(
                  xml_t(
                    output_df_row_as_vec(i)[y]
                  )
                )
              )
            )
        }

        body_row <-
          xml_tr(
            paste(
              vapply(
                row_cells,
                FUN.VALUE = character(1),
                FUN = paste
              ), collapse = ""
            )
          )

        body_section <- append(body_section, list(body_row))

        #
        # Add groupwise summary rows
        #

        if (summaries_present &&
            i %in% groups_rows_df$row_end) {

          group_id <-
            groups_rows_df[
              stats::na.omit(groups_rows_df$row_end == i),
              "group_id", drop = TRUE
            ]

          summary_section <-
            summary_row_tags(
              list_of_summaries = list_of_summaries,
              boxh = boxh,
              group_id = group_id,
              styles_resolved = styles_tbl,
              locname = "summary_cells",
              first_row_class = "gt_first_summary_row",
              summary_row_class = "gt_summary_row",
              col_alignment = col_alignment
            )

          body_section <- append(body_section, summary_section)
        }

        body_section
      }
    )

  body_rows <- flatten_list(body_rows)

  #
  # Add grand summary rows
  #

  if (summaries_present &&
      grand_summary_col %in% names(list_of_summaries$summary_df_display_list)) {

    grand_summary_section <-
      summary_row_tags(
        list_of_summaries = list_of_summaries,
        boxh = boxh,
        group_id = grand_summary_col,
        styles_resolved = styles_tbl,
        locname = "grand_summary_cells",
        first_row_class = "gt_first_grand_summary_row",
        summary_row_class = "gt_grand_summary_row",
        col_alignment = col_alignment
      )

    body_rows <- c(body_rows, grand_summary_section)
  }

  htmltools::tagList(
    body_rows
  )
}

#' Create the table source note component (OOXML)
#'
#' @noRd
create_source_notes_component_xml <- function(data) {

  source_note <- dt_source_notes_get(data = data)

  if (is.null(source_note)) {
    return("")
  }

  stub_components <- dt_stub_components(data = data)

  styles_tbl <- dt_styles_get(data = data)

  n_data_cols <- length(dt_boxhead_get_vars_default(data = data))

  # Determine whether the stub is available
  stub_available <- dt_stub_components_has_rowname(stub_components = stub_components)

  if (stub_available) {
    n_cols <- n_data_cols + 1
  } else {
    n_cols <- n_data_cols
  }

  # Get the style attrs for the source notes
  if ("source_notes" %in% styles_tbl$locname) {

    source_notes_style <- dplyr::filter(styles_tbl, locname == "source_notes")

    source_notes_styles <-
      if (nrow(source_notes_style) > 0) {
        paste(source_notes_style$html_style, collapse = " ")
      } else {
        NULL
      }

  } else {
    source_notes_styles <- NULL
  }

  htmltools::tags$tfoot(
    class = "gt_sourcenotes",
    lapply(
      source_note,
      function(x) {
        htmltools::tags$tr(
          htmltools::tags$td(
            class = "gt_sourcenote",
            style = source_notes_styles,
            colspan = n_cols,
            htmltools::HTML(x)
          )
        )
      }
    )
  )
}

#' Create the table footnote component (OOXML)
#'
#' @noRd
create_footnotes_component_xml <- function(data) {

  footnotes_tbl <- dt_footnotes_get(data = data)

  # If the `footnotes_resolved` object has no
  # rows, then return an empty footnotes component
  if (nrow(footnotes_tbl) == 0) {
    return("")
  }

  stub_components <- dt_stub_components(data = data)

  styles_tbl <- dt_styles_get(data = data)

  n_data_cols <- length(dt_boxhead_get_vars_default(data = data))

  # Determine whether the stub is available
  stub_available <- dt_stub_components_has_rowname(stub_components = stub_components)

  if (stub_available) {
    n_cols <- n_data_cols + 1
  } else {
    n_cols <- n_data_cols
  }

  footnotes_tbl <-
    footnotes_tbl %>%
    dplyr::select(fs_id, footnotes) %>%
    dplyr::distinct()

  # Get the style attrs for the footnotes
  if ("footnotes" %in% styles_tbl$locname) {
    footnotes_style <- dplyr::filter(styles_tbl, locname == "footnotes")

    footnotes_styles <-
      if (nrow(footnotes_style) > 0) {
        paste(footnotes_style$html_style, collapse = " ")
      } else {
        NULL
      }

  } else {
    footnotes_styles <- NULL
  }

  # Get the footnote separator option
  separator <- dt_options_get_value(data = data, option = "footnotes_sep")

  footnote_ids <- footnotes_tbl[["fs_id"]]
  footnote_text <- footnotes_tbl[["footnotes"]]

  # Create the footnotes component
  htmltools::tags$tfoot(
    htmltools::tags$tr(
      class = "gt_footnotes",
      style = footnotes_styles,
      htmltools::tags$td(
        colspan = n_cols,
        mapply(
          SIMPLIFY = FALSE,
          USE.NAMES = FALSE,
          footnote_ids,
          footnote_text,
          FUN = function(x, footnote_text) {

            htmltools::tags$p(
              class = "gt_footnote",
              htmltools::tags$sup(
                class = "gt_footnote_marks",
                htmltools::tags$em(
                  x
                )
              ),
              " ",
              htmltools::HTML(footnote_text),
              htmltools::HTML(separator)
            )
          }
        )
      )
    )
  )
}

summary_row_tags <- function(list_of_summaries,
                             boxh,
                             group_id,
                             styles_resolved,
                             locname,
                             first_row_class,
                             summary_row_class,
                             col_alignment) {

  # Obtain all of the visible (`"default"`), non-stub column names
  # for the table from the `boxh` object
  default_vars <- boxh[boxh$type == "default", "var", drop = TRUE]

  summary_row_lines <- list()

  if (group_id %in% names(list_of_summaries$summary_df_display_list)) {

    # Obtain the summary data table specific to the group ID and
    # select the column named `rowname` and all of the visible columns
    summary_df <-
      list_of_summaries$summary_df_display_list[[group_id]] %>%
      dplyr::select(.env$rowname_col_private, .env$default_vars)

    n_cols <- ncol(summary_df)

    summary_df_row <- function(j) {
      unname(unlist(summary_df[j, ]))
    }

    stub_classes <- rep_len(list(NULL), n_cols)
    stub_classes[[1]] <- "gt_stub"

    alignment_classes <- c("gt_right", paste0("gt_", col_alignment))

    styles_resolved_group <-
      dplyr::filter(
        styles_resolved,
        grpname == .env$group_id,
        locname == .env$locname
      ) %>%
      dplyr::mutate(grprow = round((rownum %% 1) * 100))

    for (j in seq_len(nrow(summary_df))) {

      if (group_id == grand_summary_col) {

        # In the above condition, `grand_summary_col` is a global variable
        # (`"::GRAND_SUMMARY"`) assigned in `dt_summary.R`)

        styles_resolved_row <-
          styles_resolved_group[styles_resolved_group$rownum == j, , drop = FALSE]

      } else {

        styles_resolved_row <-
          styles_resolved_group[styles_resolved_group$grprow == j, , drop = FALSE]
      }

      # row_styles <-
      #   build_row_styles(
      #     styles_resolved_row = styles_resolved_row,
      #     stub_available = TRUE,
      #     n_cols = n_cols
      #   )

      summary_row_lines[[length(summary_row_lines) + 1]] <-
        htmltools::tags$tr()
        # htmltools::tags$tr(
        #   mapply(
        #     SIMPLIFY = FALSE,
        #     USE.NAMES = FALSE,
        #     summary_df_row(j),
        #     stub_classes,
        #     alignment_classes,
        #     row_styles,
        #     FUN = function(x, stub_class, alignment_class, cell_style) {
        #
        #       if (j == 1) {
        #         summary_row_class <- c(summary_row_class, first_row_class)
        #       }
        #
        #       htmltools::tags$td(
        #         class = paste(
        #           c("gt_row", stub_class, alignment_class, summary_row_class),
        #           collapse = " "
        #         ),
        #         style = cell_style,
        #         htmltools::HTML(x)
        #       )
        #     }
        #   )
        # )
    }
  }

  summary_row_lines
}

# build_row_styles <- function(styles_resolved_row,
#                              stub_available,
#                              n_cols) {
#
#   row_styles <- rep_len(list(NULL), n_cols)
#
#   if (nrow(styles_resolved_row) > 0) {
#     if (!stub_available) {
#       row_styles[styles_resolved_row$colnum] <-
#         styles_resolved_row$html_style
#     } else {
#       row_styles[styles_resolved_row$colnum + 1] <-
#         styles_resolved_row$html_style
#     }
#   }
#
#   row_styles
# }
