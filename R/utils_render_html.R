#' Transform a footnote mark to an HTML representation
#'
#' @noRd
footnote_mark_to_html <- function(mark) {

  htmltools::tagList(htmltools::tags$sup(class = "gt_footnote_marks", mark)) %>%
    as.character()
}

styles_to_html <- function(styles) {

  vapply(
    styles,
    FUN.VALUE = character(1), USE.NAMES = FALSE,
    FUN = function(x) {

      if (any(is.null(names(x)))) {

        style <- gsub(":", ": ", x, fixed = TRUE)

      } else if (all(names(x) != "")) {

        x <- cell_style_to_html(x)

        style <-
          paste0(names(x), ": ", x, ";", collapse = " ") %>%
          tidy_gsub(";;", ";")

      } else {
        style <- as.character(x)
      }

      style
    }
  ) %>%
    paste(collapse = " ") %>%
    tidy_gsub("\n", " ")
}

cell_style_to_html <- function(style) {
  UseMethod("cell_style_to_html")
}

cell_style_to_html.default <- function(style) {

  utils::str(style)

  stop("Implement `cell_style_to_html()` for the object above.", call. = FALSE)
}

# Upgrade `_styles` to gain a `html_style` column with CSS style rules
add_css_styles <- function(data) {

  styles_tbl <- dt_styles_get(data = data)

  if (nrow(styles_tbl) > 0) {
    styles_tbl <-
      styles_tbl %>%
      dplyr::mutate(
        html_style = vapply(
          styles, function(x) styles_to_html(x), character(1))
      )
  }

  dt_styles_set(data = data, styles = styles_tbl)
}

#' For a given location, reduce the footnote marks to a single string
#'
#' @param fn_tbl The table containing all of the resolved footnote information.
#' @param locname The location name for the footnotes.
#' @param delimiter The delimiter to use for the coalesced footnote marks.
#' @noRd
coalesce_marks <- function(fn_tbl,
                           locname,
                           delimiter = ",") {

  locname_enquo <- rlang::enquo(locname)

  fn_tbl %>%
    dplyr::filter(locname == !!locname) %>%
    dplyr::summarize(fs_id_c = paste(fs_id, collapse = delimiter))
}

# Get the attributes for the table tag
get_table_defs <- function(data) {

  boxh <- dt_boxhead_get(data = data)

  # Get the `table-layout` value, which is set in `_options`
  table_style <-
    paste0("table-layout: ", dt_options_get_value(data, option = "table_layout"), ";")

  # In the case that column widths are not set for any columns,
  # there should not be a `<colgroup>` tag requirement
  if (boxh$column_width %>% unlist() %>% length() < 1) {
    return(list(table_style = NULL, table_colgroups = NULL))
  }

  # Get the table's width (which or may not have been set)
  table_width <- dt_options_get_value(data, option = "table_width")

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
      lapply(widths, function(width) {
        htmltools::tags$col(style = htmltools::css(width = width))
      })
    )

  list(
    table_style = table_style,
    table_colgroups = table_colgroups
  )
}

#' Create the heading component of a table
#'
#' The table heading component contains the title and possibly a subtitle; if
#' there are no heading components defined this function will return an empty
#' string.
#'
#' @noRd
create_heading_component <- function(data,
                                     context = "html") {

  # TODO: This should probably become `create_heading_component_h()`;
  # The other 'part creation' functions follow this convention and this
  # one is the last holdout (there is now a `create_heading_component_rtf()`)

  heading <- dt_heading_get(data = data)

  # If there is no heading component, then return an empty string
  if (length(heading$title) == 0) {
    return("")
  }

  footnotes_tbl <- dt_footnotes_get(data = data)
  styles_tbl <- dt_styles_get(data = data)
  stub_components <- dt_stub_components(data = data)
  subtitle_defined <- dt_heading_has_subtitle(data = data)

  n_data_cols <- dt_boxhead_get_vars_default(data = data) %>% length()

  # Determine whether the stub is available through analysis
  # of the `stub_components`
  stub_available <- dt_stub_components_has_rowname(stub_components)

  if (stub_available) {
    n_cols <- n_data_cols + 1
  } else {
    n_cols <- n_data_cols
  }

  # Get the footnote marks for the title
  if ("title" %in% footnotes_tbl$locname) {

    footnote_title_marks <-
      footnotes_tbl %>%
      coalesce_marks(locname = "title")

    footnote_title_marks <-
      switch(context,
             html = footnote_mark_to_html(footnote_title_marks$fs_id_c),
             latex = footnote_mark_to_latex(footnote_title_marks$fs_id_c),
             rtf = footnote_mark_to_rtf(footnote_title_marks$fs_id_c),
             stop("The context (`", context, "`) is invalid"))

  } else {
    footnote_title_marks <- ""
  }

  # Get the style attrs for the title
  if (context == "html" && "title" %in% styles_tbl$locname) {

    title_style_rows <-
      styles_tbl %>%
      dplyr::filter(locname == "title")

    title_styles <-
      if (nrow(title_style_rows) > 0) {
        title_style_rows$html_style
      } else {
        NULL
      }

  } else {
    title_styles <- NA_character_
  }

  # Get the footnote marks for the subtitle
  if (subtitle_defined & "subtitle" %in% footnotes_tbl$locname) {

    footnote_subtitle_marks <-
      footnotes_tbl %>%
      coalesce_marks(locname = "subtitle")

    footnote_subtitle_marks <-
      switch(context,
             html = footnote_mark_to_html(footnote_subtitle_marks$fs_id_c),
             latex = footnote_mark_to_latex(footnote_subtitle_marks$fs_id_c),
             rtf = footnote_mark_to_rtf(footnote_subtitle_marks$fs_id_c),
             stop("The context (`", context, "`) is invalid"))

  } else {
    footnote_subtitle_marks <- ""
  }

  # Get the style attrs for the subtitle
  if (context == "html" &&
      "subtitle" %in% styles_tbl$locname) {

    subtitle_style_rows <-
      styles_tbl %>%
      dplyr::filter(locname == "subtitle")

    subtitle_styles <-
      if (nrow(subtitle_style_rows) > 0) {
        subtitle_style_rows$html_style
      } else {
        NULL
      }

  } else {
    subtitle_styles <- NA_character_
  }

  if (context == "html") {

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
            heading$title %>% paste_right(footnote_title_marks)
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
              heading$subtitle %>% paste_right(footnote_subtitle_marks)
            )
          )
        )

    } else {
      subtitle_row <- ""
    }

    heading_component <-
      htmltools::tags$thead(
        class = "gt_header",
        title_row,
        subtitle_row
      )
  }

  if (context == "latex") {

    title_row <-
      paste0(heading$title, footnote_title_marks) %>%
      paste_left("\\large ") %>%
      paste_right("\\\\ \n")

    if (subtitle_defined) {

      subtitle_row <-
        paste0(heading$subtitle, footnote_subtitle_marks) %>%
        paste_left("\\small ") %>%
        paste_right("\\\\ \n")

    } else {
      subtitle_row <- ""
    }

    heading_component <-
      paste0(title_row, subtitle_row) %>%
      paste_between(x_2 = c("\\caption*{\n", "} \\\\ \n"))
  }

  # if (context == "rtf") {
  #
  #   if (subtitle_defined) {
  #
  #     heading_component <-
  #       rtf_title_subtitle(
  #         title = paste0(remove_html(heading$title), footnote_title_marks),
  #         subtitle = paste0(remove_html(heading$subtitle), footnote_subtitle_marks),
  #         n_cols = n_cols
  #       )
  #
  #   } else {
  #
  #     heading_component <-
  #       rtf_title(
  #         title = paste0(remove_html(heading$heading), footnote_title_marks),
  #         n_cols = n_cols
  #       )
  #   }
  # }

  heading_component
}

#' Create the columns component of a table (HTML)
#'
#' @noRd
create_columns_component_h <- function(data) {

  boxh <- dt_boxhead_get(data = data)
  stubh <- dt_stubhead_get(data = data)
  body <- dt_body_get(data = data)
  styles_tbl <- dt_styles_get(data = data)
  stub_available <- dt_stub_df_exists(data = data)
  spanners_present <- dt_spanners_exists(data = data)

  col_alignment <-
    boxh %>%
    dplyr::filter(type == "default") %>%
    dplyr::pull(column_align)

  # Get the column headings
  headings_vars <- boxh %>% dplyr::filter(type == "default") %>% dplyr::pull(var)
  headings_labels <- dt_boxhead_get_vars_labels_default(data = data)

  # Should the column labels be hidden?
  column_labels_hidden <-
    dt_options_get_value(data = data, option = "column_labels_hidden")

  if (column_labels_hidden) {
    return("")
  }

  # Get the style attrs for the stubhead label
  stubhead_style_attrs <-
    styles_tbl %>%
    dplyr::filter(locname == "stubhead")

  # Get the style attrs for the spanner column headings
  spanner_style_attrs <-
    styles_tbl %>%
    dplyr::filter(locname == "columns_groups")

  # Get the style attrs for the spanner column headings
  column_style_attrs <-
    styles_tbl %>%
    dplyr::filter(locname == "columns_columns")

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
        htmltools::tags$th(
          class = paste(
            c("gt_col_heading", "gt_columns_bottom_border",
              paste0("gt_", stubhead_label_alignment)),
            collapse = " "),
          rowspan = 1,
          colspan = 1,
          style = stubhead_style,
          htmltools::HTML(headings_labels[1])
        )

      headings_vars <- headings_vars[-1]
      headings_labels <- headings_labels[-1]
    }

    for (i in seq(headings_vars)) {

      styles_column <-
        column_style_attrs %>%
        dplyr::filter(colnum == i)

      column_style <-
        if (nrow(styles_column) > 0) {
          styles_column$html_style
        } else {
          NULL
        }

      table_col_headings[[length(table_col_headings) + 1]] <-
        htmltools::tags$th(
          class = paste(
            c("gt_col_heading", "gt_columns_bottom_border",
              paste0("gt_", col_alignment[i])),
            collapse = " "),
          rowspan = 1,
          colspan = 1,
          style = column_style,
          htmltools::HTML(headings_labels[i])
        )
    }

    table_col_headings <- htmltools::tags$tr(table_col_headings)
  }

  if (isTRUE(spanners_present)) {

    spanners <- dt_spanners_print(data = data, include_hidden = FALSE)

    # A list of <th> elements that will go in the top row. This includes
    # spanner labels and column labels for solo columns (don't have spanner
    # labels); in the latter case, rowspan=2 will be used.
    first_set <- list()
    # A list of <th> elements that will go in the second row. This is all column
    # labels that DO have spanners above them.
    second_set <- list()

    # Create the cell for the stubhead label
    if (isTRUE(stub_available)) {

      stubhead_style <-
        if (nrow(stubhead_style_attrs) > 0) {
          stubhead_style_attrs$html_style
        } else {
          NULL
        }

      first_set[[length(first_set) + 1]] <-
        htmltools::tags$th(
          class = paste(
            c("gt_col_heading", "gt_columns_bottom_border",
              paste0("gt_", stubhead_label_alignment)),
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
    spanners_rle <- rle(spanners)
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
      spanners_rle$lengths[match(seq_along(spanners), sig_cells)],
      0
    )

    for (i in seq(headings_vars)) {

      if (is.na(spanners[i])) {

        styles_heading <-
          styles_tbl %>%
          dplyr::filter(
            locname == "columns_columns",
            colname == headings_vars[i]
          )

        heading_style <-
          if (nrow(styles_heading) > 0) {
            styles_heading$html_style
          } else {
            NULL
          }

        first_set[[length(first_set) + 1]] <-
          htmltools::tags$th(
            class = paste(
              c("gt_col_heading", "gt_center", "gt_columns_bottom_border"),
              collapse = " "),
            rowspan = 2,
            colspan = 1,
            style = heading_style,
            htmltools::HTML(headings_labels[i])
          )

      } else if (!is.na(spanners[i])) {

        # If colspans[i] == 0, it means that a previous cell's colspan
        # will cover us.
        if (colspans[i] > 0) {
          class <- "gt_column_spanner"

          styles_spanners <-
            spanner_style_attrs %>%
            dplyr::filter(locname == "columns_groups", grpname == spanners[i])

          spanner_style <-
            if (nrow(styles_spanners) > 0) {
              styles_spanners$html_style
            } else {
              NULL
            }

          first_set[[length(first_set) + 1]] <-
            htmltools::tags$th(
              class = paste(
                c("gt_center", "gt_columns_top_border", "gt_column_spanner_outer"),
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

    solo_headings <- headings_vars[is.na(spanners)]
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
          styles_tbl %>%
          dplyr::filter(
            locname == "columns_columns",
            colname == remaining_headings[j]
          )

        remaining_style <-
          if (nrow(styles_remaining) > 0) {
            styles_remaining$html_style
          } else {
            NULL
          }

        second_set[[length(second_set) + 1]] <-
          htmltools::tags$th(
            class = paste(
              c("gt_col_heading", "gt_columns_bottom_border", "gt_center"),
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

  htmltools::tags$thead(
    class = "gt_col_headings",
    table_col_headings
  )
}

#' Create the table body component (HTML)
#'
#' @noRd
create_body_component_h <- function(data) {

  boxh <- dt_boxhead_get(data = data)
  styles_tbl <- dt_styles_get(data = data)
  body <- dt_body_get(data = data)
  summaries_present <- dt_summary_exists(data = data)
  list_of_summaries <- dt_summary_df_get(data = data)
  groups_rows_df <- dt_groups_rows_get(data = data)
  stub_components <- dt_stub_components(data = data)

  n_data_cols <- dt_boxhead_get_vars_default(data = data) %>% length()
  n_rows <- nrow(body)

  # Get the column alignments for the data columns (this
  # doesn't include the stub alignment)
  col_alignment <-
    boxh %>%
    dplyr::filter(type == "default") %>%
    dplyr::pull(column_align)

  # Get the column headings for the visible (e.g., `default`) columns
  headings <- dt_boxhead_get_vars_default(data = data)

  # Determine whether the stub is available through analysis
  # of the `stub_components`
  stub_available <- dt_stub_components_has_rowname(stub_components)

  # Define function to get a character vector of formatted cell
  # data (this includes the stub, if it is present)
  output_df_row_as_vec <- function(i) {

    default_vars <- dt_boxhead_get_vars_default(data = data)

    default_vals <- body[i, default_vars] %>% unlist() %>% unname()

    if (stub_available) {

      stub_var <- dt_boxhead_get_var_stub(data = data)

      default_vals <- c(body[[i, stub_var]], default_vals)
    }

    default_vals
  }

  if (stub_available) {
    n_cols <- n_data_cols + 1
  } else {
    n_cols <- n_data_cols
  }

  # Get the sequence of column numbers in the table body (these
  # are the visible columns in the table exclusive of the stub)
  column_series <- seq(n_cols)

  # Replace an NA group with an empty string
  if (any(is.na(groups_rows_df$group))) {

    groups_rows_df <-
      groups_rows_df %>%
      dplyr::mutate(group_label = ifelse(is.na(group_label), "", group_label)) %>%
      dplyr::mutate(group_label = gsub("^NA", "\u2014", group_label))
  }

  # Is the stub to be striped?
  table_stub_striped <-
    dt_options_get_value(data = data, option = "row_striping_include_stub")

  # Are the rows in the table body to be striped?
  table_body_striped <-
    dt_options_get_value(data = data, option = "row_striping_include_table_body")

  body_rows <-
    lapply(
      seq_len(n_rows),
      function(i) {

        body_section <- list()

        #
        # Create a group heading row
        #

        if (!is.null(groups_rows_df) &&
            i %in% groups_rows_df$row) {

          group_label <-
            groups_rows_df[which(groups_rows_df$row %in% i), "group_label"][[1]]

          styles_row <-
            styles_tbl %>%
            dplyr::filter(locname == "row_groups", grpname == group_label)

          row_style <-
            if (nrow(styles_row) > 0) {
              styles_row$html_style
            } else {
              NULL
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

        alignment_classes <- paste0("gt_", col_alignment)

        # Handle striping in rows in both the stub and the body
        striped_class_val <-
          if (table_body_striped && (i %% 2 == 0)) {
            "gt_striped"
          } else {
            NULL
          }

        if (stub_available) {

          alignment_classes <- c("gt_left", alignment_classes)
          extra_classes <- rep_len(list(striped_class_val), n_cols)

          if (table_stub_striped) {
            extra_classes[[1]] <- c("gt_stub", extra_classes[[1]])
          } else {
            extra_classes[[1]] <- "gt_stub"
          }
        } else {
          extra_classes <- rep_len(list(striped_class_val), n_data_cols)
        }

        styles_row <-
          styles_tbl %>%
          dplyr::filter(rownum == i, locname %in% c("stub", "data"))

        row_styles <-
          build_row_styles(
            styles_resolved_row = styles_row,
            stub_available = stub_available,
            n_cols = n_cols
          )

        body_row <-
          htmltools::tags$tr(
            mapply(
              SIMPLIFY = FALSE,
              USE.NAMES = FALSE,
              output_df_row_as_vec(i),
              alignment_classes,
              extra_classes,
              row_styles,
              FUN = function(x, alignment_class, extra_class, cell_style) {

                htmltools::tags$td(
                  class = paste(
                    c("gt_row", alignment_class, extra_class),
                    collapse = " "),
                  style = cell_style,
                  htmltools::HTML(x)
                )
              }
            )
          )

        body_section <- append(body_section, list(body_row))

        #
        # Add groupwise summary rows
        #

        if (stub_available && summaries_present &&
            i %in% groups_rows_df$row_end) {

          group_i <-
            groups_rows_df %>%
            dplyr::filter(row_end == i)

          group_id <- group_i$group

          summary_section <-
            summary_row_tags(
              group_id = group_id,
              first_row_class = "gt_first_summary_row",
              summary_row_class = "gt_summary_row",
              locname = "summary_cells",
              list_of_summaries = list_of_summaries,
              col_alignment = col_alignment,
              boxh = boxh,
              stub_available = stub_available,
              styles_resolved = styles_tbl
            )

          body_section <- append(body_section, summary_section)
        }

        body_section
      }
    ) %>% flatten_list()

  #
  # Add grand summary rows
  #

  if (summaries_present &&
      grand_summary_col %in% names(list_of_summaries$summary_df_display_list)) {

    grand_summary_section <-
      summary_row_tags(
        group_id = grand_summary_col,
        first_row_class = "gt_first_grand_summary_row",
        summary_row_class = "gt_grand_summary_row",
        locname = "grand_summary_cells",
        list_of_summaries = list_of_summaries,
        col_alignment = col_alignment,
        boxh = boxh,
        stub_available = stub_available,
        styles_resolved = styles_tbl
      )

    body_rows <- c(body_rows, grand_summary_section)
  }

  htmltools::tags$tbody(
    class = "gt_table_body",
    body_rows
  )
}

#' Create the table source note component (HTML)
#'
#' @noRd
create_source_notes_component_h <- function(data) {

  source_note <- dt_source_notes_get(data = data)

  if (is.null(source_note)) {
    return("")
  }

  stub_components <- dt_stub_components(data = data)

  n_data_cols <- dt_boxhead_get_vars_default(data = data) %>% length()

  # Determine whether the stub is available through analysis
  # of the `stub_components`
  stub_available <- dt_stub_components_has_rowname(stub_components)

  if (stub_available) {
    n_cols <- n_data_cols + 1
  } else {
    n_cols <- n_data_cols
  }

  htmltools::tags$tfoot(
    class = "gt_sourcenotes",
    lapply(
      source_note,
      function(x) {
        htmltools::tags$tr(
          htmltools::tags$td(
            class = "gt_sourcenote",
            colspan = n_cols,
            htmltools::HTML(x)
          )
        )
      }
    )
  )
}

#' Create the table footnote component (HTML)
#'
#' @noRd
create_footnotes_component_h <- function(data) {

  footnotes_tbl <- dt_footnotes_get(data = data)

  # If the `footnotes_resolved` object has no
  # rows, then return an empty footnotes component
  if (nrow(footnotes_tbl) == 0) {
    return("")
  }

  stub_components <- dt_stub_components(data = data)

  n_data_cols <- dt_boxhead_get_vars_default(data = data) %>% length()

  # Determine whether the stub is available through analysis
  # of the `stub_components`
  stub_available <- dt_stub_components_has_rowname(stub_components)

  if (stub_available) {
    n_cols <- n_data_cols + 1
  } else {
    n_cols <- n_data_cols
  }

  footnotes_tbl <-
    footnotes_tbl %>%
    dplyr::select(fs_id, footnotes) %>%
    dplyr::distinct()

  # Get the footnote separator option
  separator <- dt_options_get_value(data = data, option = "footnotes_sep")

  footnote_ids <- footnotes_tbl[["fs_id"]]
  footnote_text <- footnotes_tbl[["footnotes"]]

  # Create the footnotes component
  htmltools::tags$tfoot(
    htmltools::tags$tr(
      class = "gt_footnotes",
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

summary_row_tags <- function(group_id,
                             first_row_class,
                             summary_row_class,
                             locname,
                             list_of_summaries,
                             col_alignment,
                             boxh,
                             stub_available,
                             styles_resolved) {

  default_vars <-
    boxh %>%
    dplyr::filter(type == "default") %>%
    dplyr::pull(var)

  summary_row_lines <- list()

  locname_val <- locname

  if (group_id %in% names(list_of_summaries$summary_df_display_list)) {

    summary_df <-
      list_of_summaries$summary_df_display_list[[group_id]] %>%
      dplyr::select(rowname, default_vars) %>%
      as.data.frame(stringsAsFactors = FALSE)

    n_cols <- ncol(summary_df)

    summary_df_row <- function(j) {
      summary_df[j, ] %>% unlist() %>% unname()
    }

    stub_classes <- rep_len(list(NULL), n_cols)

    if (isTRUE(stub_available)) {

      alignment_classes <- c("gt_right", paste0("gt_", col_alignment))
      stub_classes[[1]] <- "gt_stub"
    } else {
      alignment_classes <- paste0("gt_", col_alignment)
    }

    styles_resolved_group <-
      styles_resolved %>%
      dplyr::filter(grpname == group_id, locname == locname_val) %>%
      dplyr::mutate(grprow = ceiling((rownum %% 1) * 100))

    for (j in seq_len(nrow(summary_df))) {

      if (group_id == grand_summary_col) {

        styles_resolved_row <-
          styles_resolved_group %>%
          dplyr::filter(rownum == j)

      } else {

        styles_resolved_row <-
          styles_resolved_group %>%
          dplyr::filter(grprow == j)
      }

      row_styles <-
        build_row_styles(
          styles_resolved_row = styles_resolved_row,
          stub_available = stub_available,
          n_cols = n_cols
        )

      summary_row_lines[[length(summary_row_lines) + 1]] <-
        htmltools::tags$tr(
          mapply(
            SIMPLIFY = FALSE,
            USE.NAMES = FALSE,
            summary_df_row(j),
            stub_classes,
            alignment_classes,
            row_styles,
            FUN = function(x, stub_class, alignment_class, cell_style) {

              if (j == 1) {
                summary_row_class <-
                  c(summary_row_class, first_row_class)
              }

              htmltools::tags$td(
                class = paste(
                  c("gt_row", stub_class, alignment_class, summary_row_class),
                  collapse = " "),
                style = cell_style,
                htmltools::HTML(x)
              )
            }
          )
        )
    }
  }

  summary_row_lines
}

build_row_styles <- function(styles_resolved_row,
                             stub_available,
                             n_cols) {

  row_styles <- rep_len(list(NULL), n_cols)

  if (nrow(styles_resolved_row) > 0) {
    if (!stub_available) {
      row_styles[styles_resolved_row$colnum] <-
        styles_resolved_row$html_style
    } else {
      row_styles[styles_resolved_row$colnum + 1] <-
        styles_resolved_row$html_style
    }
  }

  row_styles
}

as_css_font_family_attr <- function(font_vec, value_only = FALSE) {

  fonts_spaces <- grepl(" ", font_vec)
  font_vec[fonts_spaces] <- paste_between(x = font_vec[fonts_spaces], x_2 = c("'", "'"))

  value <- paste(font_vec, collapse = ", ")

  if (value_only) return(value)

  paste_between(value, x_2 = c("font-family: ", ";"))
}
