#------------------------------------------------------------------------------#
#
#                /$$
#               | $$
#     /$$$$$$  /$$$$$$
#    /$$__  $$|_  $$_/
#   | $$  \ $$  | $$
#   | $$  | $$  | $$ /$$
#   |  $$$$$$$  |  $$$$/
#    \____  $$   \___/
#    /$$  \ $$
#   |  $$$$$$/
#    \______/
#
#  This file is part of the 'rstudio/gt' project.
#
#  Copyright (c) 2018-2023 gt authors
#
#  For full copyright and license information, please look at
#  https://gt.rstudio.com/LICENSE.html
#
#------------------------------------------------------------------------------#


#' Transform a footnote mark to an HTML representation
#'
#' @noRd
footnote_mark_to_html <- function(
    data,
    mark,
    location = c("ref", "ftr")
) {

  location <- match.arg(location)

  if (is.na(mark)) {
    return("")
  }

  spec <- get_footnote_spec_by_location(data = data, location = location)

  if (is.null(spec)) {
    spec <- "^i"
  }

  # Generate the CSS classes needed on the basis of whether the
  # mark is one or more asterisk characters or anything else
  if (!grepl("^[\\*]+?$", mark)) {
    sup_class <- "gt_footnote_marks"
  } else {
    sup_class <- "gt_footnote_marks gt_asterisk"
  }

  is_sup <- grepl("\\^", spec)

  if (grepl("\\.", spec)) mark <- paste0(mark, ".")
  if (grepl("\\(", spec)) mark <- paste0("(", mark)
  if (grepl("\\[", spec)) mark <- paste0("[", mark)
  if (grepl("\\)", spec)) mark <- paste0(mark, ")")
  if (grepl("\\]", spec)) mark <- paste0(mark, "]")

  if (grepl("i", spec)) {
    font_style <- "italic"
  } else {
    font_style <- "normal"
  }

  if (grepl("b", spec)) {
    font_weight <- "bold"
  } else {
    font_weight <- "normal"
  }

  paste0(
    "<span ",
    if (is_sup) {
      paste0("class=\"", sup_class, "\" ")
    } else {
      NULL
    },
    "style=\"",
    "white-space:nowrap;",
    "font-style:", font_style, ";",
    "font-weight:", font_weight, ";",
    "\">",
    if (is_sup) {
      paste0("<sup>", mark, "</sup>")
    } else {
      mark
    },
    "</span>"
  )
}

get_font_stack <- function(
    name = c(
      "system-ui", "transitional", "old-style", "humanist",
      "geometric-humanist", "classical-humanist", "neo-grotesque",
      "monospace-slab-serif", "monospace-code", "industrial",
      "rounded-sans", "slab-serif", "antique", "didone", "handwritten"
    ),
    add_emoji = TRUE
) {

  name <- match.arg(name)

  font_stack <-
    switch(
      name,
      "system-ui" = c(
        "system-ui", "Segoe UI", "Roboto", "Helvetica", "Arial", "sans-serif"
      ),
      "transitional" = c(
        "Charter", "Bitstream Charter", "Sitka Text", "Cambria", "serif"
      ),
      "old-style" = c(
        "Iowan Old Style", "Palatino Linotype", "URW Palladio L", "P052", "serif"
      ),
      "humanist" = c(
        "Seravek", "Gill Sans Nova", "Ubuntu", "Calibri", "DejaVu Sans",
        "source-sans-pro", "sans-serif"
      ),
      "geometric-humanist" = c(
        "Avenir", "Avenir Next LT Pro", "Montserrat", "Corbel", "URW Gothic",
        "source-sans-pro", "sans-serif"
      ),
      "classical-humanist" = c(
        "Optima", "Candara", "Noto Sans", "source-sans-pro", "sans-serif"
      ),
      "neo-grotesque" = c(
        "Inter", "Roboto", "Helvetica Neue", "Arial Nova", "Nimbus Sans",
        "Arial", "sans-serif"
      ),
      "monospace-slab-serif" = c(
        "Nimbus Mono PS", "Courier New", "Cutive Mono", "monospace"
      ),
      "monospace-code" = c(
        "ui-monospace", "Cascadia Code", "Source Code Pro", "Menlo", "Consolas",
        "DejaVu Sans Mono", "monospace"
      ),
      "industrial" = c(
        "Bahnschrift", "DIN Alternate", "Franklin Gothic Medium",
        "Nimbus Sans Narrow", "sans-serif-condensed", "sans-serif"
      ),
      "rounded-sans" = c(
        "ui-rounded", "Hiragino Maru Gothic ProN", "Quicksand", "Comfortaa",
        "Manjari", "Arial Rounded MT Bold", "Calibri", "source-sans-pro",
        "sans-serif"
      ),
      "slab-serif" = c(
        "Rockwell", "Rockwell Nova", "Roboto Slab", "DejaVu Serif",
        "Sitka Small", "serif"
      ),
      "antique" = c(
        "Superclarendon", "Bookman Old Style", "URW Bookman", "URW Bookman L",
        "Georgia Pro", "Georgia", "serif"
      ),
      "didone" = c(
        "Didot", "Bodoni MT", "Noto Serif Display", "URW Palladio L", "P052",
        "Sylfaen", "serif"
      ),
      "handwritten" = c(
        "Segoe Print", "Bradley Hand", "Chilanka", "TSCu_Comic",
        "casual", "cursive"
      )
    )

  if (add_emoji) {
    font_stack <-
      c(
        font_stack,
        "Apple Color Emoji", "Segoe UI Emoji",
        "Segoe UI Symbol", "Noto Color Emoji"
      )
  }

  font_stack
}

styles_to_html <- function(styles) {

  styles_out <-
    vapply(
      styles,
      FUN.VALUE = character(1), USE.NAMES = FALSE,
      FUN = function(x) {
        if (any(is.null(names(x)))) {
          style <- as.character(x)
        } else if (all(names(x) != "")) {
          x <- cell_style_to_html(x)
          style <- tidy_gsub(paste0(names(x), ": ", x, ";", collapse = " "), ";;", ";")
        } else {
          style <- as.character(x)
        }
        style
      }
    )

  styles_out <- paste(styles_out, collapse = " ")
  styles_out <- tidy_gsub(styles_out, "\n", " ")

  styles_out
}

cell_style_to_html <- function(style) {
  UseMethod("cell_style_to_html")
}

cell_style_to_html.default <- function(style) {
  utils::str(style)

  cli::cli_abort("Implement `cell_style_to_html()` for the object above.")
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
coalesce_marks <- function(
    fn_tbl,
    locname,
    delimiter = ","
) {
  filtered_tbl <- dplyr::filter(fn_tbl, locname == !!locname)
  dplyr::summarize(filtered_tbl, fs_id_c = paste(fs_id, collapse = delimiter))
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
        }
      )
    )

  list(
    table_style = table_style,
    table_colgroups = table_colgroups
  )
}

create_caption_component_h <- function(data) {

  # Create the table caption if available
  table_caption <- dt_options_get_value(data = data, option = "table_caption")

  if (!all(is.na(table_caption))) {

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
        "<!--/html_preserve--><caption class='gt_caption'>",
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
      footnote_mark_to_html(
        data = data,
        mark = footnote_title_marks$fs_id_c
      )

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
      footnote_mark_to_html(
        data = data,
        mark = footnote_subtitle_marks$fs_id_c
      )

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

  subtitle_classes <- tidy_sub(title_classes, "title", "subtitle")

  if (!subtitle_defined) {
    title_classes <- c(title_classes, "gt_bottom_border")
  } else {
    subtitle_classes <- c(subtitle_classes, "gt_bottom_border")
  }

  title_row <-
    htmltools::tags$tr(
      class = "gt_heading",
      htmltools::tags$td(
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
        class = "gt_heading",
        htmltools::tags$td(
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

  htmltools::tagList(
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
  body <- dt_body_get(data = data)

  # Get vector representation of stub layout
  stub_layout <- get_stub_layout(data = data)

  # Determine the finalized number of spanner rows
  spanner_row_count <-
    dt_spanners_matrix_height(
      data = data,
      omit_columns_row = TRUE
    )

  # Get the column alignments and also the alignment class names
  col_alignment <- dt_boxhead_get_vars_align_default(data = data)

  # Detect any RTL script characters within the visible columns;
  # this creates a vector the same length as `col_alignment`
  rtl_detect <-
    vapply(
      dt_boxhead_get_vars_default(data = data),
      FUN.VALUE = logical(1),
      USE.NAMES = FALSE,
      FUN = function(x) {
        any(grepl(rtl_modern_unicode_charset, body[[x]]))
      }
    )

  # For any columns containing characters from RTL scripts; we
  # will transform a 'left' alignment to a 'right' alignment
  for (i in seq_along(rtl_detect)) {
    if (rtl_detect[i] && col_alignment[i] != "center") {
      col_alignment[i] <- "right"
    }
  }

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

  if (spanner_row_count < 1) {

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
            c(
              "gt_col_heading", "gt_columns_bottom_border",
              paste0("gt_", stubhead_label_alignment)
            ),
            collapse = " "
          ),
          rowspan = 1,
          colspan = length(stub_layout),
          style = stubhead_style,
          scope = ifelse(length(stub_layout) > 1, "colgroup", "col"),
          id = headings_labels[1],
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
            c(
              "gt_col_heading", "gt_columns_bottom_border",
              paste0("gt_", col_alignment[i])
            ),
            collapse = " "
          ),
          rowspan = 1,
          colspan = 1,
          style = column_style,
          scope = "col",
          id = headings_labels[i],
          htmltools::HTML(headings_labels[i])
        )
    }

    table_col_headings <- htmltools::tags$tr(class = "gt_col_headings", table_col_headings)
  }

  if (spanner_row_count > 0) {
    spanners <-
      dt_spanners_print_matrix(
        data = data,
        include_hidden = FALSE
      )

    spanner_ids <-
      dt_spanners_print_matrix(
        data = data,
        include_hidden = FALSE,
        ids = TRUE
      )

    level_1_index <- nrow(spanners) - 1L

    # A list of <th> elements that will go in the first level; this
    # includes spanner labels and column labels for solo columns (don't
    # have spanner labels above them)
    level_1_spanners <- list()

    # A list of <th> elements that will go in the second row. This is
    # all column labels that DO have spanners above them.
    spanned_column_labels <- list()

    # Create the cell for the stubhead label
    if (length(stub_layout) > 0) {
      stubhead_style <-
        if (nrow(stubhead_style_attrs) > 0) {
          stubhead_style_attrs$html_style
        } else {
          NULL
        }

      level_1_spanners[[length(level_1_spanners) + 1]] <-
        htmltools::tags$th(
          class = paste(
            c(
              "gt_col_heading", "gt_columns_bottom_border",
              paste0("gt_", stubhead_label_alignment)
            ),
            collapse = " "
          ),
          rowspan = 2,
          colspan = length(stub_layout),
          style = stubhead_style,
          scope = ifelse(length(stub_layout) > 1, "colgroup", "col"),
          id = headings_labels[1],
          htmltools::HTML(headings_labels[1])
        )

      headings_vars <- headings_vars[-1]
      headings_labels <- headings_labels[-1]
    }

    # NOTE: `rle()` treats NA values as distinct from each other;
    # in other words, each NA value starts a new run of length 1
    spanners_rle <- rle(spanner_ids[level_1_index, ])

    # The `sig_cells` vector contains the indices of spanners' elements
    # where the value is either NA, or, is different than the previous value;
    # because NAs are distinct, every NA element will be present sig_cells
    sig_cells <- c(1, utils::head(cumsum(spanners_rle$lengths) + 1, -1))

    # `colspans` matches `spanners` in length; each element is the
    # number of columns that the <th> at that position should span; if 0,
    # then skip the <th> at that position
    colspans <-
      ifelse(
        seq_along(spanners[level_1_index, ]) %in% sig_cells,
        # Index back into the rle result, working backward through sig_cells
        spanners_rle$lengths[match(seq_along(spanner_ids[level_1_index, ]), sig_cells)],
        0
      )

    for (i in seq_along(headings_vars)) {

      if (is.na(spanner_ids[level_1_index, ][i])) {
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

        level_1_spanners[[length(level_1_spanners) + 1]] <-
          htmltools::tags$th(
            class = paste(
              c(
                "gt_col_heading",
                "gt_columns_bottom_border",
                paste0("gt_", first_set_alignment)
              ),
              collapse = " "
            ),
            rowspan = 2,
            colspan = 1,
            style = heading_style,
            scope = "col",
            id = headings_labels[i],
            htmltools::HTML(headings_labels[i])
          )

      } else if (!is.na(spanner_ids[level_1_index, ][i])) {

        # If colspans[i] == 0, it means that a previous cell's
        # `colspan` will cover us
        if (colspans[i] > 0) {
          styles_spanners <-
            dplyr::filter(
              spanner_style_attrs,
              locname == "columns_groups",
              grpname == spanner_ids[level_1_index, ][i]
            )

          spanner_style <-
            if (nrow(styles_spanners) > 0) {
              styles_spanners$html_style
            } else {
              NULL
            }

          level_1_spanners[[length(level_1_spanners) + 1]] <-
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
              scope = ifelse(colspans[i] > 1, "colgroup", "col"),
              id = spanners[level_1_index, ][i],
              htmltools::tags$span(
                class = "gt_column_spanner",
                htmltools::HTML(spanners[level_1_index, ][i])
              )
            )
        }
      }
    }

    solo_headings <- headings_vars[is.na(spanner_ids[level_1_index, ])]
    remaining_headings <- headings_vars[!(headings_vars %in% solo_headings)]

    remaining_headings_labels <- dt_boxhead_get(data = data)
    remaining_headings_labels <-
      dplyr::filter(remaining_headings_labels, var %in% remaining_headings)
    remaining_headings_labels <-
      unlist(dplyr::pull(remaining_headings_labels, column_label))

    col_alignment <- col_alignment[-1][!(headings_vars %in% solo_headings)]

    if (length(remaining_headings) > 0) {

      spanned_column_labels <- c()

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

        spanned_column_labels[[length(spanned_column_labels) + 1]] <-
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
            scope = "col",
            id = remaining_headings_labels[j],
            htmltools::HTML(remaining_headings_labels[j])
          )
      }

      table_col_headings <-
        htmltools::tagList(
          htmltools::tags$tr(
            class = "gt_col_headings gt_spanner_row",
            level_1_spanners
          ),
          htmltools::tags$tr(
            class = "gt_col_headings",
            spanned_column_labels
          )
        )

    } else {

      # Create the `table_col_headings` HTML component
      table_col_headings <-
        htmltools::tags$tr(
          class = "gt_col_headings gt_spanner_row",
          level_1_spanners
        )
    }
  }

  if (dt_spanners_matrix_height(data = data) > 2) {

    higher_spanner_rows_idx <- seq_len(nrow(spanner_ids) - 2)

    higher_spanner_rows <- htmltools::tagList()

    for (i in higher_spanner_rows_idx) {

      spanner_ids_row <- spanner_ids[i, ]
      spanners_row <- spanners[i, ]
      spanners_vars <- unique(spanner_ids_row[!is.na(spanner_ids_row)])

      # Replace NA values with an empty string ID
      spanner_ids_row[is.na(spanner_ids_row)] <- ""

      spanners_rle <- rle(spanner_ids_row)

      sig_cells <- c(1, utils::head(cumsum(spanners_rle$lengths) + 1, -1))

      colspans <-
        ifelse(
          seq_along(spanner_ids_row) %in% sig_cells,
          # Index back into the rle result, working backward through sig_cells
          spanners_rle$lengths[match(seq_along(spanner_ids_row), sig_cells)],
          0
        )

      level_i_spanners <- list()

      for (j in seq_along(colspans)) {

        if (colspans[j] > 0) {

          styles_spanners <-
            dplyr::filter(
              styles_tbl,
              locname == "columns_groups",
              grpname %in% spanners_vars
            )

          spanner_style <-
            if (nrow(styles_spanners) > 0) {
              styles_spanners$html_style
            } else {
              NULL
            }

          level_i_spanners[[length(level_i_spanners) + 1]] <-
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
              colspan = colspans[j],
              style = spanner_style,
              scope = ifelse(colspans[j] > 1, "colgroup", "col"),
              id = spanners_row[j],
              if (spanner_ids_row[j] != "") {
                htmltools::tags$span(
                  class = "gt_column_spanner",
                  htmltools::HTML(spanners_row[j])
                )
              }
            )
        }
      }

      if (length(stub_layout) > 0 && i == 1) {

        level_i_spanners <-
          htmltools::tagList(
            htmltools::tags$th(
              rowspan = max(higher_spanner_rows_idx),
              colspan = length(stub_layout),
              scope = ifelse(length(stub_layout) > 1, "colgroup", "col")
            ),
            level_i_spanners
          )
      }

      higher_spanner_rows <-
        htmltools::tagList(
          higher_spanner_rows,
          htmltools::tagList(
            htmltools::tags$tr(
              class = "gt_col_headings gt_spanner_row",
              level_i_spanners)
          )
        )
    }

    table_col_headings <-
      htmltools::tagList(
        higher_spanner_rows,
        table_col_headings,
      )
  }

  table_col_headings
}

#' Create the table body component (HTML)
#'
#' @noRd
create_body_component_h <- function(data) {

  summaries_present <- dt_summary_exists(data = data)
  list_of_summaries <- dt_summary_df_get(data = data)
  groups_rows_df <- dt_groups_rows_get(data = data)
  styles_tbl <- dt_styles_get(data = data)

  # Get effective number of columns
  n_cols_total <- get_effective_number_of_columns(data = data)

  # Get the number of columns for the body cells only
  n_data_cols <- get_number_of_visible_data_columns(data = data)

  # Create ID components for every column that will be rendered
  col_names_id <-
    c(
      if ((n_cols_total - n_data_cols) > 0) {
        paste0("stub_", seq_len(n_cols_total - n_data_cols))
      },
      dt_boxhead_get_vars_default(data = data)
    )

  # Get vector representation of stub layout
  stub_layout <- get_stub_layout(data = data)

  # Determine if there is a stub column in `stub_layout` and whether we
  # have a two-column stub (with the group label on the left side)
  has_stub_column <- "rowname" %in% stub_layout
  has_two_col_stub <- "group_label" %in% stub_layout

  # Get a matrix of all cells in the body (not including summary cells)
  cell_matrix <- get_body_component_cell_matrix(data = data)

  # Get the number of rows in the body
  n_rows <- nrow(cell_matrix)

  # Get the column alignments and also the alignment class names
  col_alignment <-
    c(
      dt_boxhead_get_alignments_in_stub(data = data),
      dt_boxhead_get_vars_align_default(data = data)
    )

  alignment_classes <- paste0("gt_", col_alignment)

  # Replace an NA group with an empty string
  if (any(is.na(groups_rows_df$group_label))) {

    groups_rows_df <-
      dplyr::mutate(
        groups_rows_df,
        group_label = ifelse(is.na(group_label), "", group_label)
      )
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

  current_group_id <- character(0)

  body_rows <-
    lapply(
      seq_len(n_rows),
      function(i) {

        body_section <- list()

        group_info <-
          groups_rows_df[i >= groups_rows_df$row_start & i <= groups_rows_df$row_end, ]

        if (nrow(group_info) == 0) {
          group_info <- NULL
        }

        group_id <- group_info[["group_id"]]
        group_label <- group_info[["group_label"]]
        group_row_start <- group_info[["row_start"]]
        group_row_end <- group_info[["row_end"]]
        group_has_summary_rows <- group_info[["has_summary_rows"]]
        group_summary_row_side <- group_info[["summary_row_side"]]

        if (!is.null(group_id)) current_group_id <<- group_id

        # Is there a group heading row (dedicated row w/ group label) at `i`?
        group_heading_row_at_i <-
          !is.null(group_id) &&
          !has_two_col_stub &&
          group_row_start == i

        # Is this the first row of a group?
        group_start <- !is.null(group_info) && group_row_start == i

        # Is this the first row of a group where there is a two-column stub?
        group_start_two_col_stub <-
          has_two_col_stub && !is.null(group_info) && group_row_start == i

        #
        # Create a group heading row
        #

        # A group heading row occurs before a formal row `i` in that it really
        # doesn't have an index number but we do anchor it to an `i` index and
        # place it just before row `i`

        if (group_heading_row_at_i) {

          row_style_row_groups_tbl <-
            dt_styles_pluck(
              styles_tbl = styles_tbl,
              locname = "row_groups",
              grpname = group_id
            )

          row_style_group_heading_row <- row_style_row_groups_tbl[["html_style"]]

          group_class <-
            if (group_label == "") {
              "gt_empty_group_heading"
            } else {
              "gt_group_heading"
            }

          group_heading_row <-
            htmltools::tags$tr(
              class = "gt_group_heading_row",
              htmltools::tags$th(
                colspan = n_cols_total,
                class = group_class,
                style = row_style_group_heading_row,
                scope = ifelse(n_cols_total > 1, "colgroup", "col"),
                id = group_label,
                htmltools::HTML(group_label)
              )
            )

          body_section <- append(body_section, list(group_heading_row))
        }

        if (has_two_col_stub) {

          summary_rows_group_df <-
            list_of_summaries[["summary_df_display_list"]][[group_id]]

          if (!is.null(summary_rows_group_df) && "rowname" %in% stub_layout) {
            summary_row_count <- nrow(summary_rows_group_df)
          } else {
            summary_row_count <- 0L
          }

          rowspan_val <-
            group_info$row_end - group_info$row_start + 1 + summary_row_count

          row_style_row_groups_tbl <-
            dt_styles_pluck(
              styles_tbl = styles_tbl,
              locname = "row_groups",
              grpname = group_id
            )

          row_style_group_heading_row <- row_style_row_groups_tbl[["html_style"]]

          group_col_td <-
            htmltools::tags$td(
              headers = group_id,
              rowspan = rowspan_val,
              class = "gt_row gt_left gt_stub_row_group",
              style = row_style_group_heading_row,
              id = group_id,
              htmltools::HTML(group_label)
            )
        }

        #
        # Create a body row
        #

        # This condition determines whether we are on an every 'second' body
        # row and, if so, we use `extra_classes_2` instead of `extra_classes_1`
        # (the former may have the `"gt_striped"` CSS class, depending on
        # whether the option for row striping was taken)
        extra_classes <- if (i %% 2 == 0) extra_classes_2 else extra_classes_1

        indentation_stub <-
          dt_stub_indentation_at_position(
            data = data,
            i = i
          )

        if (!is.null(indentation_stub) && indentation_stub != 0) {

          extra_classes[[row_label_col]] <-
            paste(
              extra_classes[[row_label_col]],
              paste0("gt_indent_", indentation_stub)
            )
        }

        styles_row <-
          dt_styles_pluck(
            styles_tbl = styles_tbl,
            locname = c("data", "stub"),
            rownum = i
          )

        row_styles <-
          build_row_styles(
            styles_resolved_row = styles_row,
            include_stub = has_stub_column,
            n_cols = n_data_cols
          )

        #
        # Get groupwise summary rows (for either top or bottom of group)
        #

        if (
          summaries_present &&
          !is.null(group_has_summary_rows) &&
          group_has_summary_rows &&
          (
            i %in% groups_rows_df$row_start &&
            !is.null(group_summary_row_side) &&
            !is.na(group_summary_row_side) &&
            group_summary_row_side == "top"
          ) ||
          (
            i %in% groups_rows_df$row_end &&
            !is.null(group_summary_row_side) &&
            !is.na(group_summary_row_side) &&
            group_summary_row_side == "bottom"
          )
        ) {

          summary_section <-
            summary_rows_for_group_h(
              data = data,
              group_id = group_id
            )

        } else {
          summary_section <- NULL
        }

        # Handle the layout case where there is a 'two-column stub', which
        # is the row group label occupying a separate column to the LHS of
        # the row labels (this column needs to have a correct rowspan value
        # on the group)
        #
        # The first subcase of this is where `i` is the first row of
        # this grouping of rows
        if (has_two_col_stub && i %in% groups_rows_df$row_start) {

          # Modify the `extra_classes` list to include a class for
          # the row group column
          extra_classes[[1]] <- "gt_stub_row_group"

          # Obtain a one-row table that contains the beginning and
          # ending row index for the row group
          row_limits <-
            dplyr::select(
              dplyr::filter(
                groups_rows_df, row_start == i
              ),
              group_id, row_start, row_end
            )

          summary_rows_group_df <-
            list_of_summaries[["summary_df_display_list"]][[row_limits$group_id]]

          if (!is.null(summary_rows_group_df) && "rowname" %in% stub_layout) {
            summary_row_count <- nrow(summary_rows_group_df)
          } else {
            summary_row_count <- 0L
          }

          # If the summary rows are to be located at the bottom of the group
          # modify the `row_span_vals` list such that the first element
          # contains the number of rows to span
          # TODO: replace with condition for summary rows at bottom

          if (!(!is.null(summary_section) && group_summary_row_side == "top")) {
            row_span_vals[[1]] <-
              row_limits$row_end - row_limits$row_start + 1 + summary_row_count
          }

          # Process row group styles if there is an indication that any
          # are present
          row_style_row_groups_tbl <-
            dt_styles_pluck(
              styles_tbl = styles_tbl,
              locname = "row_groups",
              grpname = group_id
            )

          row_style_group_heading_row <- row_style_row_groups_tbl[["html_style"]]

          # Add style of row group cell to vector
          row_styles <- c(list(row_style_group_heading_row), row_styles)
        }

        # The second subcase of this is where `i` is *not* the first row
        # of this grouping of rows and we'd want the leftmost column with
        # the group label to not have a rowspan attr or any special classes
        if (has_two_col_stub && !(i %in% groups_rows_df$row_start)) {

          # Remove first element of `alignment_classes` vector
          alignment_classes <- alignment_classes[-1]
          row_span_vals[[1]] <- NULL
          extra_classes[[1]] <- NULL
        }

        row_df <-
          output_df_row_as_vec(
            i = i,
            cell_matrix = cell_matrix,
            groups_rows_df = groups_rows_df,
            has_two_col_stub = has_two_col_stub
          )

        # Situation where we have two columns in the stub and the row label
        # isn't the first (the `row_df` vector will have one less element)
        if (length(col_names_id) > length(row_df)) {
          col_id_i <- col_names_id[-(length(col_names_id) - length(row_df))]
        } else {
          col_id_i <- col_names_id
        }

        stub_width <- length(stub_layout)

        if (stub_width == 0) {
          row_id_i <- rep("", length(col_id_i))
        } else if (stub_width == 1) {
          row_id_i <- rep(paste0(col_id_i[1], "_", i), length(col_id_i))
        } else if (stub_width == 2) {
          row_id_i <- rep(paste0(col_id_i[2], "_", i), length(col_id_i))
        }

        # In the situation where there is:
        # (1) a group summary to be situated at the top of the group, and,
        # (2) a two-column stub
        # we have to excise the redundant group label
        if (
          summaries_present &&
          !is.null(group_has_summary_rows) &&
          group_has_summary_rows &&
          group_start_two_col_stub &&
          !is.null(group_summary_row_side) &&
          !is.na(group_summary_row_side) &&
          group_summary_row_side == "top"
        ) {

          row_df <- row_df[-1]
          col_id_i <- col_id_i[-1]
          row_id_i <- row_id_i[-1]
          row_span_vals <- row_span_vals[-1]
          alignment_classes <- alignment_classes[-1]
          extra_classes <- extra_classes[-1]
          row_styles <- row_styles[-1]
        }

        body_row <-
          htmltools::tags$tr(
            class = if (group_start) "gt_row_group_first",
            htmltools::HTML(
              paste0(
                mapply(
                  SIMPLIFY = FALSE,
                  USE.NAMES = FALSE,
                  row_df,
                  col_id_i,
                  row_id_i,
                  row_span_vals,
                  alignment_classes,
                  extra_classes,
                  row_styles,
                  FUN = function(x, col_id, row_id, row_span, alignment_class, extra_class, cell_style) {

                    # If any characters come from a RTL script, ensure that a
                    # left alignment is transformed to a right alignment
                    if (grepl(rtl_modern_unicode_charset, x)) {
                      if (alignment_class != "gt_center") {
                        alignment_class <- "gt_right"
                      }
                      x <- paste0("<p dir=\"rtl\">", x, "</p>")
                    }

                    sprintf(
                      "<%s %sclass=\"%s\"%s>%s</%s>",
                      if ("gt_stub" %in% extra_class) {
                        paste0(
                          "th ",
                          "id=\"",
                          row_id,
                          "\" ",
                          "scope=\"",
                          ifelse(!is.null(row_span) && row_span > 1, "rowgroup", "row"),
                          "\""
                        )
                      } else {
                        paste0(
                          "td ",
                          "headers=\"",
                          gsub(
                            "(^[[:space:]]*)|([[:space:]]*$)", "",
                            paste(current_group_id, row_id, col_id)
                          ),
                          "\""
                        )
                      },
                      if (is.null(row_span)) {
                        ""
                      } else {
                        paste0(
                          "rowspan=\"",
                          htmltools::htmlEscape(row_span, attribute = TRUE),
                          "\" "
                        )
                      },
                      paste(
                        c(
                          "gt_row",
                          htmltools::htmlEscape(alignment_class, attribute = TRUE),
                          htmltools::htmlEscape(extra_class, attribute = TRUE)
                        ),
                        collapse = " "
                      ),
                      if (!any(nzchar(cell_style))) {
                        ""
                      } else {
                        paste0(
                          " style=\"",
                          htmltools::htmlEscape(cell_style, attribute = FALSE),
                          "\""
                        )
                      },
                      as.character(x),
                      if ("gt_stub" %in% extra_class) {
                        "th"
                      } else {
                        "td"
                      }
                    )
                  }
                ),
                collapse = "\n"
              )
            )
          )


        if (!is.null(summary_section) && group_summary_row_side == "top") {

          if (has_two_col_stub) {

            summary_section[[1]] <-
              htmltools::HTML(gsub("^<tr>", paste0("<tr>", group_col_td), as.character(summary_section[[1]])))
          }
          body_section <- append(body_section, summary_section)
        }

        body_section <- append(body_section, list(body_row))

        if (!is.null(summary_section) && group_summary_row_side == "bottom") {
          body_section <- append(body_section, summary_section)
        }

        body_section
      }
    )

  body_rows <- flatten_list(body_rows)

  #
  # Add grand summary rows
  #

  if (
    summaries_present &&
    grand_summary_col %in% names(list_of_summaries$summary_df_display_list)
  ) {

    side <- summary_row_side(data = data, group_id = grand_summary_col)

    grand_summary_section <-
      summary_rows_for_group_h(
        data = data,
        group_id = grand_summary_col,
        side_grand_summary = side
      )

    if (side == "top") {
      body_rows <- c(grand_summary_section, body_rows)
    } else {
      body_rows <- c(body_rows, grand_summary_section)
    }
  }

  htmltools::tags$tbody(
    class = "gt_table_body",
    body_rows
  )
}

# Define function to get a character vector of formatted cell
# data (this includes the stub, if it is present)
output_df_row_as_vec <- function(
    i,
    cell_matrix,
    groups_rows_df,
    has_two_col_stub
) {

  cell_matrix <- cell_matrix[i, ]

  if (has_two_col_stub) {

    if (!(i %in% groups_rows_df$row_start)) {
      cell_matrix <- cell_matrix[-1]
    }
    if (i %in% groups_rows_df$row_start) {
      cell_matrix[1] <- groups_rows_df$group_label[groups_rows_df$row_start == i]
    }
  }

  cell_matrix
}

#' Create the table source note component (HTML)
#'
#' @noRd
create_source_notes_component_h <- function(data) {

  source_notes <- dt_source_notes_get(data = data)

  if (is.null(source_notes)) {
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

  # Get the source note multiline option
  multiline <- dt_options_get_value(data = data, option = "source_notes_multiline")

  # Get the source note separator option
  separator <- dt_options_get_value(data = data, option = "source_notes_sep")

  # Handle the multiline source notes case (each footnote takes up one line)
  if (multiline) {
    # Create the source notes component as a series of `<tr><td>` (one per
    # source note) inside of a `<tfoot>`
    return(
      htmltools::tags$tfoot(
        class = "gt_sourcenotes",
        lapply(
          source_notes,
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
    )
  }

  # Perform HTML escaping on the separator text and transform space
  # characters to non-breaking spaces
  separator <- gsub(" (?= )", "&nbsp;", separator, perl = TRUE)

  # Create the source notes component as a single `<tr><td>` inside
  # of a `<tfoot>`
  htmltools::tags$tfoot(
    htmltools::tags$tr(
      class = "gt_sourcenotes",
      style = source_notes_styles,
      htmltools::tags$td(
        class = "gt_sourcenote",
        colspan = n_cols_total,
        htmltools::tags$div(
          style = htmltools::css(`padding-bottom` = "2px"),
          htmltools::HTML(paste(source_notes, collapse = separator))
        )
      )
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

  # Get the effective number of columns
  n_cols_total <- get_effective_number_of_columns(data = data)

  # Get the distinct set of `fs_id` & `footnotes` values in the `footnotes_tbl`
  footnotes_tbl <- dplyr::distinct(dplyr::select(footnotes_tbl, fs_id, footnotes))

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

  # Get the footnote multiline option
  multiline <- dt_options_get_value(data = data, option = "footnotes_multiline")

  # Get the footnote separator option
  separator <- dt_options_get_value(data = data, option = "footnotes_sep")

  # Obtain vectors of footnote ID values (prerendered glyphs) and
  # the associated text
  footnote_ids <- footnotes_tbl[["fs_id"]]
  footnote_text <- footnotes_tbl[["footnotes"]]

  # Create a vector of HTML footnotes
  footnotes <-
    unlist(
      mapply(
        SIMPLIFY = FALSE,
        USE.NAMES = FALSE,
        footnote_ids,
        footnote_text,
        FUN = function(x, footnote_text) {
          as.character(
            htmltools::tagList(
              htmltools::HTML(
                paste0(
                  footnote_mark_to_html(
                    data = data,
                    mark = x,
                    location = "ftr"
                  ),
                  " ",
                  process_text(footnote_text, context = "html")
                ),
                .noWS = c("after", "before")
              )
            )
          )
        }
      )
    )

  # Handle the multiline footnotes case (each footnote takes up one line)
  if (multiline) {

    # Create the footnotes component as a series of `<tr><td>` (one per
    # footnote) inside of a `<tfoot>`
    return(
      htmltools::tags$tfoot(
        class = "gt_footnotes",
        lapply(
          footnotes,
          function(x) {
            htmltools::tags$tr(
              htmltools::tags$td(
                class = "gt_footnote",
                style = footnotes_styles,
                colspan = n_cols_total,
                htmltools::HTML(x)
              )
            )
          }
        )
      )
    )
  }

  # Perform HTML escaping on the separator text and transform space
  # characters to non-breaking spaces
  separator <- gsub(" (?= )", "&nbsp;", separator, perl = TRUE)

  # Create the footnotes component as a single `<tr><td>` inside
  # of a `<tfoot>`
  htmltools::tags$tfoot(
    htmltools::tags$tr(
      class = "gt_footnotes",
      style = footnotes_styles,
      htmltools::tags$td(
        class = "gt_footnote",
        colspan = n_cols_total,
        htmltools::tags$div(
          style = htmltools::css(`padding-bottom` = "2px"),
          htmltools::HTML(paste(footnotes, collapse = separator))
        )
      )
    )
  )
}

summary_rows_for_group_h <- function(
    data,
    group_id,
    side_grand_summary = "bottom"
) {

  # Check that `group_id` isn't NULL and that length is exactly 1
  if (is.null(group_id) || length(group_id) != 1) {
    cli::cli_abort("`group_id` cannot be `NULL` and must be of length 1.")
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
    dplyr::select(
      list_of_summaries$summary_df_display_list[[group_id]],
      dplyr::all_of(rowname_col_private),
      dplyr::all_of(default_vars)
    )

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

  if (stub_is_2 && summary_row_type == "grand") {
    col_span_vals[[1]] <- 2L
  }

  # Default to a left alignment for the summary row labels and obtain the
  # alignments corresponding to the summary row cells (from the body rows)
  col_alignment <- c("left", dt_boxhead_get_vars_align_default(data = data))

  # Construct the alignment class names
  alignment_classes <- paste0("gt_", col_alignment)

  for (j in seq_len(nrow(summary_df))) {

    last_row_class <- "gt_last_summary_row"

    if (summary_row_type == "grand") {

      styles_resolved_row <-
        dt_styles_pluck(
          styles_tbl = styles_tbl,
          locname = "grand_summary_cells",
          grpname = group_id,
          rownum = j
        )

      summary_row_class <- "gt_grand_summary_row"
      first_row_class <- "gt_first_grand_summary_row"

      if (side_grand_summary == "top") {
        first_row_class <- "gt_grand_summary_row"
        last_row_class <- "gt_last_grand_summary_row_top"
      }

    } else {

      styles_resolved_row <-
        dt_styles_pluck(
          styles_tbl = styles_tbl,
          locname = "summary_cells",
          grpname = group_id,
          grprow = j
        )

      summary_row_class <- "gt_summary_row"

      first_row_class <-
        if ("rowname" %in% stub_layout) {
          "gt_first_summary_row thick"
        } else {
          "gt_first_summary_row"
        }
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
              summary_df[j, ],
              col_span_vals,
              alignment_classes,
              extra_classes,
              row_styles,
              names(summary_df),
              FUN = function(x, col_span, alignment_class, extra_class, cell_style, col_name) {
                extra_class <- c(extra_class, summary_row_class)

                if (j == 1) {
                  extra_class <- c(extra_class, first_row_class)
                }

                if (j == nrow(summary_df)) {
                  extra_class <- c(extra_class, last_row_class)
                }

                x <- x[[1]]

                if (inherits(x, "from_markdown")) {
                  x <- process_text(x, context = "html")
                }

                sprintf(
                  "<%s %sclass=\"%s\"%s>%s</%s>",
                  if ("gt_stub" %in% extra_class) {
                    # 1. opening tag
                    paste0(
                      "th ",
                      "id=\"",
                      if (summary_row_type == "grand") {
                        paste0("grand_summary_stub_", j, "\" ")
                      } else {
                        paste0("summary_stub_", group_id, "_", j, "\" ")
                      },
                      "scope=\"row\""
                    )
                  } else {
                    # headers = "group_row_id row_header_id col_header_id"
                    paste0(
                      "td ",
                      "headers=\"",
                      if (summary_row_type == "grand") {
                        paste0(
                          "grand_summary_stub_",
                          j, " ", col_name, "\""
                        )
                      } else {
                        paste0(
                          group_id, " summary_stub_",
                          group_id, "_", j, " ", col_name, "\""
                        )
                      }
                    )
                  },
                  if (is.null(col_span)) {
                    # 2. colspan
                    ""
                  } else {
                    paste0(
                      "colspan=\"",
                      htmltools::htmlEscape(col_span, attribute = TRUE),
                      "\" "
                    )
                  },
                  htmltools::htmlEscape( # 3. tag classes
                    paste(
                      c("gt_row", alignment_class, extra_class),
                      collapse = " "
                    ),
                    attribute = TRUE
                  ),
                  if (!any(nzchar(cell_style))) {
                    # 4. tag styles
                    ""
                  } else {
                    paste0(
                      " style=\"",
                      htmltools::htmlEscape(cell_style, attribute = TRUE),
                      "\""
                    )
                  },
                  as.character(x), # 5. HTML content
                  if ("gt_stub" %in% extra_class) {
                    # 6. closing tag
                    "th"
                  } else {
                    "td"
                  }
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

build_row_styles <- function(
    styles_resolved_row,
    include_stub,
    n_cols
) {

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
  if (
    !isTRUE(all(styles_resolved_row$colnum %in% c(0, seq_len(n_cols)))) ||
    any(duplicated(styles_resolved_row$colnum))
  ) {
    cli::cli_abort(
      "`build_row_styles()` was called with invalid `colnum` values."
    )
  }

  # This will hold the resulting styles
  result <- rep_len(list(NULL), n_cols)

  # The subset of styles_resolved_row that applies to data
  data_styles <- styles_resolved_row[styles_resolved_row$colnum > 0, ]
  result[data_styles$colnum] <- data_styles$html_style

  # If a stub exists, we need to prepend a style (or NULL) to the result.
  if (include_stub) {
    stub_style <- styles_resolved_row[styles_resolved_row$colnum == 0, ]
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

  if (value_only) {
    return(value)
  }

  paste_between(value, x_2 = c("font-family: ", ";"))
}
