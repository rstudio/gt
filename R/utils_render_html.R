#' Transform a footnote mark to an HTML representation
#'
#' @noRd
footnote_mark_to_html <- function(mark) {

  as.character(
    htmltools::tagList(htmltools::tags$sup(class = "gt_footnote_marks", mark))
  )
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

  styles_tbl$html_style <- vapply(styles_tbl$styles, styles_to_html, character(1))

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

create_caption_component_h <- function(data) {

  # Create the table caption if available
  table_caption <- dt_options_get_value(data = data, option = "table_caption")

  if (!is.null(table_caption)) {
    table_caption <- process_text(table_caption, context = "html")
    if (isTRUE(getOption("knitr.in.progress"))) {
      table_caption <- kable_caption(label = NULL, table_caption, "html")
    }
    if (!getOption("htmltools.preserve.raw", FALSE)) {
      # <!--/html_preserve--> ... <!--html_preserve--> is because bookdown scans
      # the .md file, looking for references in the form of:
      # <caption>(#tab:mytable)
      # Ref:
      # https://github.com/rstudio/bookdown/blob/00987215b7572def2f5cd73a623efc38f4f30ab7/R/html.R#L629
      # https://github.com/rstudio/bookdown/blob/00987215b7572def2f5cd73a623efc38f4f30ab7/R/html.R#L667
      #
      # Normally, the gt table in its entirety is excluded from the .md, to
      # prevent it from being corrupted by pandoc's md-to-html rendering. We do
      # this by wrapping the whole table in htmltools::htmlPreserve (I think this
      # actually happens in htmlwidgets). So the extra markup here is used to
      # temporarily suspend that protection, emit the caption (including the HTML
      # <caption> tag, which bookdown searches for), and then resume protection.
      htmltools::HTML(paste0(
        "<!--/html_preserve--><caption>",
        table_caption,
        "</caption><!--html_preserve-->"
      ))
    } else {
      htmltools::HTML(paste0("<caption>", table_caption, "</caption>"))
    }
  } else {
    NULL
  }
}

#' Create the heading component of a table
#'
#' The table heading component contains the title and possibly a subtitle; if
#' there are no heading components defined this function will return an empty
#' string.
#'
#' @noRd
create_heading_component_h <- function(data) {

  # If there is no title or heading component, then return an empty string
  if (!dt_heading_has_title(data = data)) {
    return("")
  }

  heading <- dt_heading_get(data = data)
  footnotes_tbl <- dt_footnotes_get(data = data)
  styles_tbl <- dt_styles_get(data = data)
  subtitle_defined <- dt_heading_has_subtitle(data = data)

  # Get effective number of columns
  n_cols_total <- get_effective_number_of_columns(data = data)

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
        colspan = n_cols_total,
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
          colspan = n_cols_total,
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

#' Create the columns component of a table (HTML)
#'
#' @noRd
create_columns_component_h <- function(data) {

  # Should the column labels be hidden?
  column_labels_hidden <-
    dt_options_get_value(
      data = data,
      option = "column_labels_hidden"
    )

  if (column_labels_hidden) {
    return("")
  }

  stubh <- dt_stubhead_get(data = data)
  styles_tbl <- dt_styles_get(data = data)

  # Get vector representation of stub layout
  stub_layout <- get_stub_layout(data = data)

  # Determine if there are any spanners present
  spanners_present <- dt_spanners_exists(data = data)

  # Get the column alignments and also the alignment class names
  col_alignment <- dt_boxhead_get_vars_align_default(data = data)

  # Get the column headings
  headings_vars <- dt_boxhead_get_vars_default(data = data)
  headings_labels <- dt_boxhead_get_vars_labels_default(data = data)

  # Get the style attrs for the stubhead label
  stubhead_style_attrs <- subset(styles_tbl, locname == "stubhead")

  # Get the style attrs for the spanner column headings
  spanner_style_attrs <- subset(styles_tbl, locname == "columns_groups")

  # Get the style attrs for the spanner column headings
  column_style_attrs <- subset(styles_tbl, locname == "columns_columns")

  # If columns are present in the stub, then replace with a set stubhead
  # label or nothing
  if (length(stub_layout) > 0 && length(stubh$label) > 0) {

    headings_labels <- prepend_vec(headings_labels, stubh$label)
    headings_vars <- prepend_vec(headings_vars, "::stub")

  } else if (length(stub_layout) > 0) {

    headings_labels <- prepend_vec(headings_labels, "")
    headings_vars <- prepend_vec(headings_vars, "::stub")
  }

  stubhead_label_alignment <- "left"

  table_col_headings <- list()

  if (!spanners_present) {

    # Create the cell for the stubhead label
    if (length(stub_layout) > 0) {

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
          colspan = length(stub_layout),
          style = stubhead_style,
          htmltools::HTML(headings_labels[1])
        )

      headings_vars <- headings_vars[-1]
      headings_labels <- headings_labels[-1]
    }

    for (i in seq_along(headings_vars)) {

      styles_column <- subset(column_style_attrs, colnum == i)

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
    if (length(stub_layout) > 0) {

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
          colspan = length(stub_layout),
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

    for (i in seq_along(headings_vars)) {

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

    remaining_headings_labels <-
      dt_boxhead_get(data = data) %>%
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
  body <- dt_body_get(data = data)

  summaries_present <- dt_summary_exists(data = data)
  list_of_summaries <- dt_summary_df_get(data = data)
  groups_rows_df <- dt_groups_rows_get(data = data)

  styles_tbl <- dt_styles_get(data = data)

  # Get effective number of columns
  n_cols_total <- get_effective_number_of_columns(data = data)

  # Get the number of columns for the body cells only
  n_data_cols <- get_number_of_visible_data_columns(data = data)

  # Get the resolved number of columns required for the stub
  n_stub_cols <- n_cols_total - n_data_cols

  # Get vector representation of stub layout
  stub_layout <- get_stub_layout(data = data)

  has_row_group_column <- "group_id" %in% stub_layout
  has_stub_column <- "rowname" %in% stub_layout

  # Get a matrix of all cells in the body (not including summary cells)
  cell_matrix <- get_body_component_cell_matrix(data = data)

  # Get the number of rows in the body
  n_rows <- nrow(cell_matrix)

  # Get the column alignments and also the alignment class names
  col_alignment <-
    c(rep("left", n_stub_cols), dt_boxhead_get_vars_align_default(data = data))
  alignment_classes <- paste0("gt_", col_alignment)

  # Define function to get a character vector of formatted cell
  # data (this includes the stub, if it is present)
  output_df_row_as_vec <- function(i) {

    cell_matrix <- cell_matrix[i, ]

    if (
      "group_label" %in% stub_layout &&
      !(i %in% groups_rows_df$row_start)
      ) {
        cell_matrix <- cell_matrix[-1]
    }

    cell_matrix
  }

  # Get the sequence of column numbers in the table body (these
  # are the visible columns in the table exclusive of the stub)
  column_series <- seq(n_cols_total)

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

  extra_classes_1 <- rep_len(list(NULL), n_cols_total)

  # TODO: Ensure that only the table body is striped here
  # FIXME: Is it possible the group label ends up striped?
  extra_classes_2 <-
    rep_len(list(if (table_body_striped) "gt_striped" else NULL), n_cols_total)

  if (length(stub_layout) > 0) {

    if ("rowname" %in% stub_layout) {
      row_label_col <- which(stub_layout == "rowname")

      extra_classes_1[[row_label_col]] <- "gt_stub"
      extra_classes_2[[row_label_col]] <-
        c("gt_stub", if (table_stub_striped) "gt_striped" else NULL)
    }
  }

  # Create a default vector of row span values for group labels as a column
  row_span_vals <- rep_len(list(NULL), n_cols_total)

  body_rows <-
    lapply(
      seq_len(n_rows),
      function(i) {

        body_section <- list()

        group_info <- groups_rows_df[groups_rows_df$row_start == i, c("group_id", "group_label")]
        if (nrow(group_info) == 0) {
          group_info <- NULL
        }
        group_id <- group_info[["group_id"]]
        group_label <- group_info[["group_label"]]

        #
        # Create a group heading row
        #
        if (
          !is.null(group_id) &&
          !("group_label" %in% stub_layout)
        ) {
          row_style <- dt_styles_pluck(styles_tbl, locname = "row_groups", grpname = group_id)$html_style

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
                colspan = n_cols_total,
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

        styles_row <- dt_styles_pluck(styles_tbl, locname = c("data", "stub"), rownum = i)

        row_styles <-
          build_row_styles(
            styles_resolved_row = styles_row,
            include_stub = has_stub_column,
            n_cols = n_data_cols
          )

        if ("group_label" %in% stub_layout) {

          if (i %in% groups_rows_df$row_start) {

            # Modify the `extra_classes` list to include a class for
            # the row group column
            extra_classes[[1]] <- "gt_stub_row_group"

            # Obtain a one-row table that contains the beginning and
            # ending row index for the row group
            row_limits <-
              groups_rows_df %>%
              dplyr::filter(row_start == i) %>%
              dplyr::select(row_start, row_end)

            # Modify the `row_span_vals` list such that the first
            # element (the row group column) contains the number of rows to span
            row_span_vals[[1]] <- row_limits$row_end - row_limits$row_start + 1

            # Process row group styles if there is an indication that some
            # are present
            row_group_style <- dt_styles_pluck(styles_tbl, locname = "row_groups", grpname = group_id)$html_style
            # Add style of row group cell to vector
            row_styles <- c(list(row_group_style), row_styles)
          } else {

            # Remove first element of `alignment_classes` vector
            alignment_classes <- alignment_classes[-1]
            row_span_vals[[1]] <- NULL
            extra_classes[[1]] <- NULL

            # FIXME: Can this really happen?
            if (length(row_styles) > length(extra_classes)) {
              row_styles[[1]] <- NULL
            }
          }
        }

        body_row <-
          htmltools::tags$tr(
            htmltools::HTML(
              paste0(
                mapply(
                  SIMPLIFY = FALSE,
                  USE.NAMES = FALSE,
                  output_df_row_as_vec(i = i),
                  row_span_vals,
                  alignment_classes,
                  extra_classes,
                  row_styles,
                  FUN = function(x, row_span, alignment_class, extra_class, cell_style) {

                    sprintf(
                      "<td %sclass=\"%s\"%s>%s</td>",
                      if (is.null(row_span)) {
                        ""
                      } else {
                        paste0("rowspan=\"", row_span, "\" ")
                      },
                      paste(
                        c("gt_row", alignment_class, extra_class),
                        collapse = " "
                      ),
                      if (!any(nzchar(cell_style))) {
                        ""
                      } else {
                        paste0(" style=\"", cell_style, "\"")
                      },
                      as.character(x)
                    )
                  }
                ),
                collapse = "\n"
              )
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
            summary_row_tags_i(
              data = data,
              group_id = group_id
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
      summary_row_tags_i(
        data = data,
        group_id = grand_summary_col
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

  styles_tbl <- dt_styles_get(data = data)

  # Get effective number of columns
  n_cols_total <- get_effective_number_of_columns(data = data)

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
            colspan = n_cols_total,
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

  styles_tbl <- dt_styles_get(data = data)

  # Get effective number of columns
  n_cols_total <- get_effective_number_of_columns(data = data)

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
        colspan = n_cols_total,
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

# Get a matrix of all body cells
get_body_component_cell_matrix <- function(data) {

  body <- dt_body_get(data = data)
  stub_layout <- get_stub_layout(data = data)
  default_vars <- dt_boxhead_get_vars_default(data = data)

  body_matrix <- unname(as.matrix(body[, default_vars]))

  if (length(stub_layout) == 0) {
    return(body_matrix)
  }

  if ("rowname" %in% stub_layout) {

    body_matrix <-
      cbind(
        unname(as.matrix(body[, dt_boxhead_get_var_stub(data = data)])),
        body_matrix
      )
  }

  if ("group_label" %in% stub_layout) {

    group_label_matrix <-
      body[, dt_boxhead_get_vars_groups(data = data)] %>%
      dplyr::rename(group_label = 1) %>%
      dplyr::inner_join(data$`_groups_rows`, by = "group_label") %>%
      dplyr::select(group_label) %>%
      as.matrix %>%
      unname()

    body_matrix <- cbind(group_label_matrix, body_matrix)
  }

  body_matrix
}

summary_row_tags_i <- function(data,
                               group_id) {

  # Check that `group_id` isn't NULL and that length is exactly 1
  if (is.null(group_id) || length(group_id) != 1) {
    stop("`group_id` cannot be NULL and must be of length 1.")
  }

  list_of_summaries <- dt_summary_df_get(data = data)
  styles_tbl <- dt_styles_get(data = data)

  # Obtain all of the visible (`"default"`), non-stub column names
  # for the table from the `boxh` object
  default_vars <- dt_boxhead_get_vars_default(data = data)

  stub_layout <- get_stub_layout(data = data)

  stub_is_2 <- length(stub_layout) > 1

  summary_row_lines <- list()

  # In the below conditions
  # - `grand_summary_col` is a global variable (`"::GRAND_SUMMARY"`, assigned
  #   in `dt_summary.R`)
  # - `group_id` might be passed in as NA when there are unnamed groups (this
  #   can happen usually when using `tab_row_group()` to build these row groups)
  #   and you cannot create summary rows for unnamed groups
  if (is.na(group_id)) {
    return(summary_row_lines)
  } else if (
      group_id %in% names(list_of_summaries$summary_df_display_list) &&
      group_id != grand_summary_col
  ) {
    summary_row_type <- "group"
  } else if (group_id == grand_summary_col) {
    summary_row_type <- "grand"
  } else {
    return(summary_row_lines)
  }

  # Obtain the summary data table specific to the group ID and
  # select the column named `rowname` and all of the visible columns
  summary_df <-
    list_of_summaries$summary_df_display_list[[group_id]] %>%
    dplyr::select(.env$rowname_col_private, .env$default_vars)

  # Get effective number of columns
  n_cols_total <- get_effective_number_of_columns(data = data)

  # Get the number of columns for the body cells only
  n_data_cols <- get_number_of_visible_data_columns(data = data)

  if (stub_is_2) {
    n_cols_total <- n_cols_total - 1
  }

  extra_classes <- rep_len(list(NULL), n_cols_total)
  extra_classes[[1]] <- "gt_stub"

  # Create a default list of colspan values for the summary row
  col_span_vals <- rep_len(list(NULL), n_cols_total)

  if (stub_is_2) {
    col_span_vals[[1]] <- 2L
  }

  # Get the column alignments and also the alignment class names
  col_alignment <-
    c("right", dt_boxhead_get_vars_align_default(data = data))
  alignment_classes <- paste0("gt_", col_alignment)

  for (j in seq_len(nrow(summary_df))) {

    last_row_class <- "gt_last_summary_row"

    if (summary_row_type == "grand") {
      styles_resolved_row <- dt_styles_pluck(styles_tbl, locname = "grand_summary_cells", grpname = group_id, rownum = j)
      summary_row_class <- "gt_grand_summary_row"
      first_row_class <- "gt_first_grand_summary_row"

    } else {
      styles_resolved_row <- dt_styles_pluck(styles_tbl, locname = "summary_cells", grpname = group_id, grprow = j)
      summary_row_class <- "gt_summary_row"
      first_row_class <- "gt_first_summary_row"
    }

    row_styles <-
      build_row_styles(
        styles_resolved_row = styles_resolved_row,
        include_stub = TRUE,
        n_cols = n_data_cols
      )

    summary_row_lines[[length(summary_row_lines) + 1]] <-
      htmltools::tags$tr(
        htmltools::HTML(
          paste0(
            mapply(
              SIMPLIFY = FALSE,
              USE.NAMES = FALSE,
              unname(unlist(summary_df[j, ])),
              col_span_vals,
              alignment_classes,
              extra_classes,
              row_styles,
              FUN = function(x, col_span, alignment_class, extra_class, cell_style) {

                extra_class <- c(extra_class, summary_row_class)

                if (j == 1) {
                  extra_class <- c(extra_class, first_row_class)
                }

                if (j == nrow(summary_df)) {
                  extra_class <- c(extra_class, last_row_class)
                }

                sprintf(
                  "<td %sclass=\"%s\"%s>%s</td>",
                  if (is.null(col_span)) {
                    ""
                  } else {
                    paste0("colspan=\"", col_span, "\" ")
                  },
                  paste(
                    c("gt_row", alignment_class, extra_class),
                    collapse = " "
                  ),
                  if (!any(nzchar(cell_style))) {
                    ""
                  } else {
                    paste0(" style=\"", cell_style, "\"")
                  },
                  as.character(x)
                )
              }
            ),
            collapse = "\n"
          )
        )
      )
  }

  summary_row_lines
}

build_row_styles <- function(styles_resolved_row,
                             include_stub,
                             n_cols) {
  # The styles_resolved_row data frame should contain the columns `colnum` and
  # `html_style`. Each colnum should match the number of a data column in the
  # output table; the first data column is number 1. No colnum should appear
  # more than once in styles_resolved_row. It's OK for a column not to appear in
  # styles_resolved_row, and it's OK for styles_resolved_row to have 0 rows.
  #
  # If `include_stub` is TRUE, then a row with column==0 will be used as the
  # stub style.

  # This function's implementation can't tolerate colnum of NA, or illegal
  # colnum values. Check and throw early.
  if (!isTRUE(all(styles_resolved_row$colnum %in% c(0, seq_len(n_cols)))) ||
      any(duplicated(styles_resolved_row$colnum))) {
    stop("build_row_styles was called with invalid colnum values")
  }

  # This will hold the resulting styles
  result <- rep_len(list(NULL), n_cols)

  # The subset of styles_resolved_row that applies to data
  data_styles <- styles_resolved_row[styles_resolved_row$colnum > 0,]
  result[data_styles$colnum] <- data_styles$html_style

  # If a stub exists, we need to prepend a style (or NULL) to the result.
  if (include_stub) {
    stub_style <- styles_resolved_row[styles_resolved_row$colnum == 0,]
    result <- c(list(stub_style$html_style), result)
  }

  result
}

as_css_font_family_attr <- function(font_vec, value_only = FALSE) {

  fonts_spaces <- grepl(" ", font_vec)

  font_vec[fonts_spaces] <-
    paste_between(
      x = font_vec[fonts_spaces],
      x_2 = c("'", "'")
    )

  value <- paste(font_vec, collapse = ", ")

  if (value_only) return(value)

  paste_between(value, x_2 = c("font-family: ", ";"))
}
