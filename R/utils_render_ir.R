
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
    return(NULL)
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

  if (!subtitle_defined) {

    title_component <-
      htmltools::tagList(
        htmltools::tags$div(
          loc = "title",
          style = if (!is.na(title_styles)) title_styles else NULL,
          htmltools::HTML(paste0(heading$title, footnote_title_marks))
        )
      )

  } else {

    title_component <-
      htmltools::tagList(
        htmltools::tags$div(
          loc = "title",
          style = if (!is.na(title_styles)) title_styles else NULL,
          htmltools::HTML(paste0(heading$title, footnote_title_marks))
        ),
        htmltools::tags$div(
          loc = "subtitle",
          style = if (!is.na(subtitle_styles)) subtitle_styles else NULL,
          htmltools::HTML(paste0(heading$subtitle, footnote_subtitle_marks))
        )
      )
  }

  title_component
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

  # Initialize empty tagList for the column label <th> elements
  column_labels_tagList <- htmltools::tagList()

  for (i in seq_along(headings_vars)) {

    if (stub_available && i == 1) {

      styles_column_labels <- stubhead_style_attrs

    } else {

      styles_column <- subset(column_style_attrs, colnum == i)

      styles_column_labels <-
        dplyr::filter(
          column_style_attrs,
          locname == "columns_columns",
          colnum == i
        )
    }

    column_label_style <-
      if (nrow(styles_column_labels) > 0) {
        styles_column_labels$html_style
      } else {
        NULL
      }

    column_labels_th_element <-
      htmltools::tags$div(
        loc = if (i == 1 && stub_available) "stub" else NULL,
        style = if (is.null(column_label_style)) NULL else column_label_style,
        headings_labels[i]
      )

    # Append the `column_labels_th_element` to the end of the `column_labels_tagList`
    column_labels_tagList[[i]] <- column_labels_th_element
  }

  # Create <tr> element for the column labels
  column_labels_tr_element <-
    htmltools::tags$tr(loc = "column-labels", column_labels_tagList)

  if (spanners_present) {

    # Initialize empty tagList for the spanner <th> elements
    spanners_tagList <- htmltools::tagList()

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

    for (i in seq_along(spanners_rle$labels)) {

      styles_spanners <-
        dplyr::filter(
          spanner_style_attrs,
          locname == "columns_groups",
          grpname == spanners_rle$values[i]
        )

      spanner_style <-
        if (nrow(styles_spanners) > 0) {
          styles_spanners$html_style
        } else {
          NULL
        }

      spanners_th_element <-
        htmltools::tags$div(
          loc = if (i == 1 && stub_available) "stub" else NULL,
          colspan = if (spanners_rle$lengths[i] > 1) spanners_rle$lengths[i] else NULL,
          style = if (is.null(spanner_style)) NULL else spanner_style,
          if (!is.na(spanners_rle$labels[i])) spanners_rle$labels[i] else NULL
        )

      # Append the `spanners_th_element` to the end of the `spanners_tagList`
      spanners_tagList[[i]] <- spanners_th_element
    }

    # Create <tr> element for spanner
    spanners_tr_element <-
      htmltools::tags$tr(loc = "spanners", spanners_tagList)

  } else {
    spanners_tr_element <- NULL
  }

  htmltools::tagList(spanners_tr_element, column_labels_tr_element)
}

create_body_ir <- function(data) {

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

  body_section <- htmltools::tagList()

  for (i in seq_len(n_rows)) {

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

      group_heading_row <-
        htmltools::tagList(
          htmltools::tags$tr(
            loc = "row-group-label",
            htmltools::tagList(
              htmltools::tags$div(
                style = row_style,
                htmltools::HTML(group_label)
              )
            )
          )
        )

      body_section <- htmltools::tagList(body_section, group_heading_row)
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

    body_row <-
      htmltools::tagList(
        htmltools::tags$tr(
          htmltools::HTML(
            paste0(
              collapse = "",
              mapply(
                SIMPLIFY = FALSE,
                USE.NAMES = FALSE,
                seq_along(output_df_row_as_vec(i)),
                row_styles,
                FUN = function(x, cell_style) {

                  sprintf(
                    if (x == 1 && stub_available) {
                      "\n      <div loc=\"stub\"%s>%s</div>"
                    } else {
                      "\n      <div%s>%s</div>"
                    },
                    if (is.null(cell_style)) {
                      ""
                    } else {
                      paste0(" style=\"", cell_style, "\"")
                    },
                    as.character(output_df_row_as_vec(i)[x])
                  )
                }
              )
            )
          )
        )
      )

    body_section <- htmltools::tagList(body_section, body_row)

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
        summary_row_tags_ir(
          list_of_summaries = list_of_summaries,
          boxh = boxh,
          group_id = group_id,
          styles_resolved = styles_tbl,
          locname = "summary_cells"
        )

      body_section <- htmltools::tagList(body_section, summary_section)
    }
  }

  #
  # Add grand summary rows
  #

  if (summaries_present &&
      grand_summary_col %in% names(list_of_summaries$summary_df_display_list)) {

    grand_summary_section <-
      summary_row_tags_ir(
        list_of_summaries = list_of_summaries,
        boxh = boxh,
        group_id = grand_summary_col,
        styles_resolved = styles_tbl,
        locname = "grand_summary_cells"
      )

    body_section <- htmltools::tagList(body_section, grand_summary_section)
  }


  body_section
}

summary_row_tags_ir <- function(list_of_summaries,
                                boxh,
                                group_id,
                                styles_resolved,
                                locname) {

  # Obtain all of the visible (`"default"`), non-stub column names
  # for the table from the `boxh` object
  default_vars <- boxh[boxh$type == "default", "var", drop = TRUE]

  summary_row_lines <- htmltools::tagList()

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

        loc <- "grand-summary"

      } else {

        styles_resolved_row <-
          styles_resolved_group[styles_resolved_group$grprow == j, , drop = FALSE]

        loc <- "group-summary"
      }

      row_styles <-
        build_row_styles(
          styles_resolved_row = styles_resolved_row,
          stub_available = TRUE,
          n_cols = n_cols
        )

      summary_row <-
        htmltools::tagList(
          htmltools::tags$tr(
            loc = loc,
            mapply(
              SIMPLIFY = FALSE,
              USE.NAMES = FALSE,
              seq_along(summary_df_row(j)),
              row_styles,
              FUN = function(x, cell_style) {
                htmltools::tags$div(
                  loc = if (x == 1) "stub" else NULL,
                  style = cell_style,
                  htmltools::HTML(summary_df_row(j)[x])
                )
              }
            )
          )
        )

      summary_row_lines <- htmltools::tagList(summary_row_lines, summary_row)
    }
  }

  summary_row_lines
}

#' Create the source notes component
#'
#' @noRd
create_source_notes_ir <- function(data) {

  source_notes <- dt_source_notes_get(data = data)

  # If the `source_notes` object is empty, then return an empty tagList
  if (is.null(source_notes)) {
    return(NULL)
  }

  styles_tbl <- dt_styles_get(data = data)

  # Get the style attrs for the source notes
  if ("source_notes" %in% styles_tbl$locname) {

    source_notes_styles <- dplyr::filter(styles_tbl, locname == "source_notes")

    source_notes_styles <-
      if (nrow(source_notes_styles) > 0) {
        paste(source_notes_styles$html_style, collapse = " ")
      } else {
        NULL
      }

  } else {
    source_notes_styles <- NULL
  }

  # Create the source notes component
  htmltools::tagList(
    lapply(
      source_notes,
      function(x) {
        htmltools::tags$div(
          style = source_notes_styles,
          htmltools::HTML(x)
        )
      }
    )
  )
}

#' Create the footnotes component
#'
#' @noRd
create_footnotes_ir <- function(data) {

  footnotes_tbl <- dt_footnotes_get(data = data)

  # If the `footnotes_resolved` object has no
  # rows, then return an empty tagList
  if (nrow(footnotes_tbl) == 0) {
    return(NULL)
  }

  styles_tbl <- dt_styles_get(data = data)

  footnotes_tbl <-
    footnotes_tbl %>%
    dplyr::select(fs_id, footnotes) %>%
    dplyr::distinct()

  # Get the style attrs for the footnotes
  if ("footnotes" %in% styles_tbl$locname) {

    footnotes_styles <- dplyr::filter(styles_tbl, locname == "footnotes")

    footnotes_styles <-
      if (nrow(footnotes_styles) > 0) {
        paste(footnotes_styles$html_style, collapse = " ")
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
  htmltools::tagList(
    mapply(
      SIMPLIFY = FALSE,
      USE.NAMES = FALSE,
      footnote_ids,
      footnote_text,
      FUN = function(x, footnote_text) {

        htmltools::tags$div(
          style = footnotes_styles,
          htmltools::HTML(
            paste0(
              htmltools::tags$sup(x),
              htmltools::HTML(footnote_text)
            )
          )
        )
      }
    )
  )
}

combine_as_ir <- function(data,
                          table_defs,
                          colgroup_component,
                          heading_component,
                          columns_component,
                          body_component,
                          source_notes_component,
                          footnotes_component) {

  options_list <- get_optional_config_elements_for_target(data = data)

  options_list <-
    c(list(
      target = table_defs$target,
      `table-cols` = table_defs$table_cols,
      `header-rows` = table_defs$header_rows,
      `body-rows` = table_defs$body_rows
    ),
    options_list)

  config_element <-
    paste0(
      "<config\n",
      vapply(
        seq_along(options_list),
        FUN.VALUE = character(1),
        FUN = function(x) {
          paste0("  ", names(options_list[x]), "=\"", options_list[x], "\"")
        }) %>%
        paste(collapse = "\n"),
      "\n/></config>"
    ) %>%
    htmltools::HTML()

  if (!is.null(heading_component)) {

    header_element <-
      htmltools::tagList(
        htmltools::tags$header(
          heading_component
        )
      )

  } else {
    header_element <- NULL
  }

  table_element <-
    htmltools::tagList(
      htmltools::tags$table(
        htmltools::tags$thead(colgroup_component, columns_component),
        htmltools::tags$tbody(body_component)
      )
    )

  if (!is.null(source_notes_component) || !is.null(footnotes_component)) {

    footer_element <-
      htmltools::tagList(
        htmltools::tags$footer(
          source_notes_component,
          footnotes_component
        )
      )

  } else {
    footer_element <- NULL
  }

  as.character(
    htmltools::tagList(
      config_element, header_element, table_element, footer_element
    )
  )
}

append_option_to_list <- function(data, option, options_list) {

  option_val <- dt_options_get_value(data = data, option = option)
  option_default <- dt_options_get_default_value(option = option)

  if (!identical(option_val, option_default)) {

    if (is.logical(option_val)) {
      option_val <- tolower(as.character(option_val))
    }

    list_item <- list(option = option_val)
    names(list_item) <- gsub("_", "-", option)
    options_list <- c(options_list, list_item)
  }

  return(options_list)
}

get_optional_config_elements_for_target <- function(data) {

  option_names <-
    c(
      "container_width",
      "container_height",
      "container_overflow_x",
      "container_overflow_y",
      "table_id",
      "table_caption",
      "table_font_names",
      "table_additional_css",
      "table_border_top_include",
      "table_border_bottom_include",
      "column_labels_hidden",
      "row_striping_include_stub",
      "row_striping_include_table_body",
      "footnotes_sep"
    )

  options_list <- list()

  for (opt_name in option_names) {

    options_list <-
      append_option_to_list(
        data = data,
        option = opt_name,
        options_list = options_list
      )
  }

  options_list
}
