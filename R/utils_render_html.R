#' Transform a footnote glyph to an HTML representation
#'
#' @noRd
footnote_glyph_to_html <- function(footnote_glyph) {

  htmltools::tagList(
    htmltools::tags$sup(
      class = "gt_footnote_glyph",
      footnote_glyph
    )
  ) %>%
    as.character()
}

#' Split the body content vector into a list structure
#'
#' Taking the `body_content` vector, split into list components with one item
#' per row in the output table
#' @noRd
split_body_content <- function(body_content,
                               n_cols) {

  split(body_content, ceiling(seq_along(body_content) / n_cols))
}

styles_to_html <- function(styles) {

  style_list <-
    lapply(styles, function(x) cell_style_to_html(x)) %>%
    unname() %>%
    unlist(recursive = FALSE)

  paste0(names(style_list), ": ", style_list, ";", collapse = " ")
}

cell_style_to_html <- function(style) {
  UseMethod("cell_style_to_html")
}

cell_style_to_html.default <- function(style) {

  utils::str(style)

  stop("Implement `cell_style_to_html()` for the object above.", call. = FALSE)
}

#' For a given location, reduce the footnote glyphs to a single string
#'
#' @param fn_tbl The table containing all of the resolved footnote information.
#' @param locname The location name for the footnotes.
#' @param delimiter The delimiter to use for the coalesced footnote glyphs.
#' @noRd
coalesce_glyphs <- function(fn_tbl,
                            locname,
                            delimiter = ",") {

  locname_enquo <- rlang::enquo(locname)

  fn_tbl %>%
    dplyr::filter(locname == !!locname) %>%
    dplyr::summarize(fs_id_c = paste(fs_id, collapse = delimiter))
}

#' Create the heading component of a table
#'
#' The table heading component contains the title and possibly a subtitle; if
#' there are no heading components defined this function will return an empty
#' string.
#'
#' @noRd
create_heading_component <- function(heading,
                                     footnotes_resolved,
                                     styles_resolved = NULL,
                                     n_cols,
                                     subtitle_defined,
                                     output = "html") {

  # If there is no heading component, then return
  # an empty string
  if (length(heading) == 0) {
    return("")
  }

  # Get the footnote glyphs for the title
  if ("title" %in% footnotes_resolved$locname) {

    footnote_title_glyphs <-
      footnotes_resolved %>%
      coalesce_glyphs(locname = "title")

    footnote_title_glyphs <-
      switch(output,
             html = footnote_glyph_to_html(footnote_title_glyphs$fs_id_c),
             latex = footnote_glyph_to_latex(footnote_title_glyphs$fs_id_c),
             rtf = footnote_glyph_to_rtf(footnote_title_glyphs$fs_id_c),
             stop("The context (`", output, "`) is invalid"))

  } else {
    footnote_title_glyphs <- ""
  }

  # Get the style attrs for the title
  if (output == "html" &&
      "title" %in% styles_resolved$locname) {

    title_style_rows <-
      styles_resolved %>%
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

  # Get the footnote glyphs for the subtitle
  if (subtitle_defined & "title" %in% footnotes_resolved$locname) {

    footnote_subtitle_glyphs <-
      footnotes_resolved %>%
      coalesce_glyphs(locname = "subtitle")

    footnote_subtitle_glyphs <-
      switch(output,
             html = footnote_glyph_to_html(footnote_subtitle_glyphs$fs_id_c),
             latex = footnote_glyph_to_latex(footnote_subtitle_glyphs$fs_id_c),
             rtf = footnote_glyph_to_rtf(footnote_subtitle_glyphs$fs_id_c),
             stop("The context (`", output, "`) is invalid"))

  } else {
    footnote_subtitle_glyphs <- ""
  }

  # Get the style attrs for the subtitle
  if (output == "html" &&
      "subtitle" %in% styles_resolved$locname) {

    subtitle_style_rows <-
      styles_resolved %>%
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

  if (output == "html") {

    title_classes <- c("gt_heading", "gt_title", "gt_font_normal", "gt_center")

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
          htmltools::HTML(heading$title)
        )
      )

    if (subtitle_defined) {

      subtitle_row <-
        htmltools::tags$tr(
          htmltools::tags$th(
            colspan = n_cols,
            class = paste(subtitle_classes, collapse = " "),
            style = subtitle_styles,
            htmltools::HTML(heading$subtitle)
          )
        )

    } else {
      subtitle_row <- ""
    }

    heading_component <-
      htmltools::tags$thead(
        title_row,
        subtitle_row
      )
  }

  if (output == "latex") {

    title_row <-
      paste0(heading$title, footnote_title_glyphs) %>%
      paste_left("\\large ") %>%
      paste_right("\\\\ \n")

    if (subtitle_defined) {

      subtitle_row <-
        paste0(heading$subtitle, footnote_subtitle_glyphs) %>%
        paste_left("\\small ") %>%
        paste_right("\\\\ \n")

    } else {
      subtitle_row <- ""
    }

    heading_component <-
      paste0(title_row, subtitle_row) %>%
      paste_between(x_2 = c("\\caption*{\n", "} \\\\ \n"))
  }

  if (output == "rtf") {

    if (subtitle_defined) {

      heading_component <-
        rtf_title_subtitle(
          title = paste0(remove_html(heading$title), footnote_title_glyphs),
          subtitle = paste0(remove_html(heading$subtitle), footnote_subtitle_glyphs),
          n_cols = n_cols)

    } else {

      heading_component <-
        rtf_title(
          title = paste0(remove_html(heading$heading), footnote_title_glyphs),
          n_cols = n_cols)
    }
  }

  heading_component
}

#' Create the columns component of a table (HTML)
#'
#' @noRd
create_columns_component_h <- function(boxh_df,
                                       output_df,
                                       stub_available,
                                       spanners_present,
                                       styles_resolved,
                                       stubhead_label,
                                       col_alignment,
                                       opts_df) {

  # Should the column labels be hidden?
  column_labels_hidden <-
    opts_df %>%
    opts_df_get(option = "column_labels_hidden") %>%
    as.logical()

  if (column_labels_hidden) {
    return("")
  }

  # Get the style attrs for the spanner column headings
  spanner_style_attrs <-
    styles_resolved %>%
    dplyr::filter(locname == "columns_groups")

  # Get the style attrs for the spanner column headings
  column_style_attrs <-
    styles_resolved %>%
    dplyr::filter(locname == "columns_columns")

  # Get the headings
  headings <- boxh_df["column_label", ] %>% unlist() %>% unname()

  # If `stub_available` == TRUE, then replace with a set stubhead
  # caption or nothing
  if (stub_available &&
      length(stubhead_label) > 0) {
    headings <- rlang::prepend(headings, stubhead_label$stubhead_label)
  } else if (stub_available) {
    headings <- rlang::prepend(headings, "")
  }

  # Ensure that column headings for right-aligned content
  # are centered
  col_alignment[col_alignment == "right"] <- "center"

  column_alignments <- paste0("gt_", col_alignment)
  table_col_headings <- list()

  if (!spanners_present) {

    # Create the cell for the stubhead label
    if (stub_available) {

      table_col_headings[[length(table_col_headings) + 1]] <-
        htmltools::tags$th(
          class = paste(
            c("gt_col_heading", "gt_columns_bottom_border", "gt_columns_top_border",
              paste0("gt_", col_alignment[1])),
            collapse = " "),
          rowspan = 1,
          colspan = 1,
          htmltools::HTML(headings[1])
        )

      headings <- headings[-1]
    }

    for (i in seq(headings)) {

      styles_resolved_column <-
        column_style_attrs %>%
        dplyr::filter(colnum == i)

      column_style <-
        if (nrow(styles_resolved_column) > 0) {
          styles_resolved_column$html_style
        } else {
          NULL
        }

      table_col_headings[[length(table_col_headings) + 1]] <-
        htmltools::tags$th(
          class = paste(
            c("gt_col_heading", "gt_columns_bottom_border", "gt_columns_top_border", column_alignments[i]),
            collapse = " "),
          rowspan = 1, colspan = 1,
          style = column_style,
          htmltools::HTML(headings[i])
        )
    }

    table_col_headings <- htmltools::tags$tr(table_col_headings)
  }

  if (spanners_present) {

    spanners <-
      boxh_df["group_label", ] %>%
      unlist() %>%
      unname()

    headings_stack <- c()
    first_set <- second_set <- list()

    # Create the cell for the stubhead label
    if (stub_available) {

      first_set[[length(first_set) + 1]] <-
        htmltools::tags$th(
          class = paste(
            c("gt_col_heading", "gt_columns_bottom_border", "gt_columns_top_border",
              paste0("gt_", col_alignment[1])),
            collapse = " "),
          rowspan = 2,
          colspan = 1,
          htmltools::HTML(headings[1])
        )

      headings <- headings[-1]
    }

    for (i in seq(headings)) {

      if (is.na(spanners[i])) {

        styles_resolved_heading <-
          styles_resolved %>%
          dplyr::filter(
            locname == "columns_columns",
            colname == headings[i]
          )

        heading_style <-
          if (nrow(styles_resolved_heading) > 0) {
            styles_resolved_heading$html_style
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
            htmltools::HTML(headings[i])
          )

        headings_stack <- c(headings_stack, headings[i])

      } else if (!is.na(spanners[i])) {

        if (i > 1) {
          if (is.na(spanners[i - 1])) {
            same_spanner <- FALSE
          } else if (spanners[i] == spanners[i - 1]) {
            same_spanner <- TRUE
          } else {
            same_spanner <- FALSE
          }
        } else {
          same_spanner <- FALSE
        }

        if (!same_spanner) {

          class <- "gt_column_spanner"
          colspan <- 1

          for (j in 1:length(spanners)) {

            if (is.na(spanners[i + j])) {
              spanner_adjacent <- FALSE
              break
            } else if (duplicated(spanners)[i + j]) {
              colspan <- colspan + 1L
            } else {
              spanner_adjacent <- ifelse(!is.na(spanners[i + j]), TRUE, FALSE)
              break
            }
          }

          if (spanner_adjacent) {
            class <- paste0(class, " gt_sep_right")
          }

          styles_resolved_spanners <-
            spanner_style_attrs %>%
            dplyr::filter(locname == "columns_groups", grpname == spanners[i])

          spanner_style <-
            if (nrow(styles_resolved_spanners) > 0) {
              styles_resolved_spanners$html_style
            } else {
              NULL
            }

          first_set[[length(first_set) + 1]] <-
            htmltools::tags$th(
              class = paste(
                c("gt_col_heading", "gt_center", "gt_columns_top_border", class),
                collapse = " "
              ),
              rowspan = 1,
              colspan = colspan,
              style = spanner_style,
              htmltools::HTML(spanners[i])
            )
        }
      }
    }

    remaining_headings <- headings[!(headings %in% headings_stack)]

    remaining_headings_indices <- which(remaining_headings %in% headings)

    col_alignment <- col_alignment[-1][!(headings %in% headings_stack)]

    if (length(remaining_headings) > 0) {

      second_set <- c()

      for (j in seq(remaining_headings)) {

        styles_resolved_remaining <-
          styles_resolved %>%
          dplyr::filter(
            locname == "columns_columns",
            colname == remaining_headings[j]
          )

        remaining_style <-
          if (nrow(styles_resolved_remaining) > 0) {
            styles_resolved_remaining$html_style
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
            htmltools::HTML(remaining_headings[j])
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

  # Return the shiny tag object
  table_col_headings
}

#' Create the table body component (HTML)
#'
#' @noRd
create_body_component_h <- function(output_df,
                                    styles_resolved,
                                    groups_rows_df,
                                    col_alignment,
                                    stub_components,
                                    summaries_present,
                                    list_of_summaries,
                                    n_rows,
                                    n_cols,
                                    opts_df) {

  output_df_row <- function(i) {
    output_df[i, ] %>% unlist() %>% unname()
  }

  if (is.null(stub_components)) {
    stub_available <- FALSE
  } else if (stub_component_is_groupname(stub_components)) {
    stub_available <- FALSE
  } else {
    stub_available <- TRUE
  }

  # Get the sequence of column numbers in the table body
  column_series <- seq(n_cols)

  # If there is a stub, remove the last element in the series
  if (stub_available) {
    column_series <- column_series[-length(column_series)]
  }

  # Replace an NA group with an empty string
  if (any(is.na(groups_rows_df$group))) {

    groups_rows_df <-
      groups_rows_df %>%
      dplyr::mutate(group_label = ifelse(is.na(group_label), "", group_label)) %>%
      dplyr::mutate(group_label = gsub("^NA", "\u2014", group_label))
  }

  # Is the stub to be striped?
  table_stub_striped <-
    opts_df %>%
    opts_df_get(option = "row_striping_include_stub") %>%
    as.logical()

  # Are the rows in the table body to be striped?
  table_body_striped <-
    opts_df %>%
    opts_df_get(option = "row_striping_include_table_body") %>%
    as.logical()

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

          styles_resolved_row <-
            styles_resolved %>%
            dplyr::filter(locname == "stub_groups", grpname == group_label)

          row_style <-
            if (nrow(styles_resolved_row) > 0) {
              styles_resolved_row$html_style
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

        extra_classes <- rep_len(list(striped_class_val), n_cols)

        if (stub_available) {

          if (table_stub_striped) {
            extra_classes[[1]] <- c("gt_stub", extra_classes[[1]])
          } else {
            extra_classes[[1]] <- "gt_stub"
          }
        }

        styles_resolved_row <-
          styles_resolved %>%
          dplyr::filter(rownum == i, locname == "data")

        row_styles <-
          build_row_styles(
            styles_resolved_row = styles_resolved_row,
            stub_available = stub_available,
            n_cols = n_cols
          )

        body_row <-
          htmltools::tags$tr(
            mapply(
              SIMPLIFY = FALSE,
              USE.NAMES = FALSE,
              output_df_row(i),
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
              col_alignment = col_alignment, n_cols = n_cols,
              stub_available = stub_available, styles_resolved = styles_resolved
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
        col_alignment = col_alignment, n_cols = n_cols,
        stub_available = stub_available, styles_resolved = styles_resolved
      )

    body_rows <- c(body_rows, grand_summary_section)
  }

  htmltools::tags$body(
    class = "gt_table_body",
    body_rows
  )
}

#' Create the table source note component (HTML)
#'
#' @noRd
create_source_note_component_h <- function(source_note,
                                           n_cols) {

  if (length(source_note) == 0) {
    return("")
  }

  htmltools::tags$tfoot(
    class = "gt_sourcenotes",
    lapply(
      source_note$source_note,
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
create_footnote_component_h <- function(footnotes_resolved,
                                        opts_df,
                                        n_cols) {

  # If the `footnotes_resolved` object has no
  # rows, then return an empty footnotes component
  if (nrow(footnotes_resolved) == 0) {
    return("")
  }

  footnotes_tbl <-
    footnotes_resolved %>%
    dplyr::select(fs_id, text) %>%
    dplyr::distinct()

  # Get the separator option from `opts_df`
  separator <-
    opts_df %>%
#<<<<<<< HEAD
    opts_df_get(option = "footnote_sep")
# =======
#     dplyr::filter(parameter == "footnote_sep") %>%
#     dplyr::pull(value)
# >>>>>>> master

  footnote_ids <- footnotes_tbl[["fs_id"]]
  footnote_text <- footnotes_tbl[["text"]]

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
                class = "gt_footnote_glyph",
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
                             n_cols,
                             stub_available,
                             styles_resolved) {

  summary_row_lines <- list()

  locname_val <- locname

  if (group_id %in% names(list_of_summaries$summary_df_display_list)) {

    summary_df <-
      list_of_summaries$summary_df_display_list[[group_id]] %>%
      as.data.frame(stringsAsFactors = FALSE)

    summary_df_row <- function(j) {
      summary_df[j, ] %>% unlist() %>% unname()
    }

    alignment_classes <- paste0("gt_", col_alignment)

    stub_classes <- rep_len(list(NULL), n_cols)

    if (stub_available) {
      stub_classes[[1]] <- "gt_stub"
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
