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
#  Copyright (c) 2018-2026 gt authors
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

  is_sup <- grepl("^", spec, fixed = TRUE)

  if (grepl(".", spec, fixed = TRUE)) mark <- paste0(mark, ".")
  if (grepl("(", spec, fixed = TRUE)) mark <- paste0("(", mark)
  if (grepl("[", spec, fixed = TRUE)) mark <- paste0("[", mark)
  if (grepl(")", spec, fixed = TRUE)) mark <- paste0(mark, ")")
  if (grepl("]", spec, fixed = TRUE)) mark <- paste0(mark, "]")

  if (grepl("i", spec, fixed = TRUE)) {
    font_style <- "italic"
  } else {
    font_style <- "normal"
  }

  if (grepl("b", spec, fixed = TRUE)) {
    font_weight <- "bold"
  } else {
    font_weight <- "normal"
  }

  htmltools::tags$span(
    if (is_sup) {
      htmltools::tags$sup(mark, .noWS = "before")
    } else {
      mark
    },
    class = if (is_sup) {
      sup_class
    } else {
      NULL
    },
    style = htmltools::css(
      `white-space` = "nowrap",
      `font-style` = font_style,
      `font-weight` = font_weight,
      `line-height` = 0
    ),
    .noWS = "before-end"
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
        "system-ui", "sans-serif"
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
        "Avenir", "Montserrat", "Corbel", "URW Gothic", "source-sans-pro",
        "sans-serif"
      ),
      "classical-humanist" = c(
        "Optima", "Candara", "Noto Sans", "source-sans-pro", "sans-serif"
      ),
      "neo-grotesque" = c(
        "Inter", "Roboto", "Helvetica Neue", "Arial Nova", "Nimbus Sans",
        "Arial", "sans-serif"
      ),
      "monospace-slab-serif" = c(
        "Nimbus Mono PS", "Courier New", "monospace"
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
        "Manjari", "Arial Rounded MT", "Arial Rounded MT Bold", "Calibri",
        "source-sans-pro", "sans-serif"
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
        "Segoe Print", "Bradley Hand", "Chilanka", "TSCu_Comic", "casual",
        "cursive"
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
      FUN.VALUE = character(1L), USE.NAMES = FALSE,
      FUN = function(x) {
        # TODO Maybe these checks are to be reviewed?
        # names(c(1, 2, 3)) = NULL names(c(1, 2, "x" = 3)) = "", "", "x"
        if (any(is.null(names(x)))) {
          style <- as.character(x)
        } else if (all(names(x) != "")) {
          x <- cell_style_to_html(x)
          style <- gsub(";;", ";", paste0(names(x), ": ", x, ";", collapse = " "), fixed = TRUE)
        } else {
          style <- as.character(x)
        }
        style
      }
    )

  styles_out <- paste(styles_out, collapse = " ")
  styles_out <- gsub("\n", " ", styles_out)

  styles_out
}

cell_style_to_html <- function(style) {
  UseMethod("cell_style_to_html")
}

#' @export
cell_style_to_html.default <- function(style) {
  utils::str(style)

  cli::cli_abort("Implement `cell_style_to_html()` for the object above.")
}

# Upgrade `_styles` to gain a `html_style` column with CSS style rules
add_css_styles <- function(data) {

  styles_tbl <- dt_styles_get(data = data)

  styles_tbl$html_style <- vapply(styles_tbl$styles, styles_to_html, character(1L))

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
  fs_ids <- vctrs::vec_slice(fn_tbl$fs_id, fn_tbl$locname == locname)
  paste(sort(fs_ids), collapse = delimiter)
}

# Get the attributes for the table tag
get_table_defs <- function(data) {

  boxh <- dt_boxhead_get(data = data)

  # In the case that column widths are not set for any columns,
  # there should not be a `<colgroup>` tag requirement
  if (length(unlist(boxh$column_width)) < 1) {
    return(list(table_style = NULL, table_colgroups = NULL))
  }

  # Get the `table-layout` value, which is set in `_options`
  table_layout <- dt_options_get_value(data = data, option = "table_layout")

  # Get the table's width (which or may not have been set)
  table_width <- dt_options_get_value(data = data, option = "table_width")

  # Determine whether the row group is placed in the stub
  row_group_as_column <- dt_options_get_value(data = data, option = "row_group_as_column")

  types <- c("default", "stub", if (row_group_as_column) "row_group" else NULL)

  widths <- boxh[boxh$type %in% types, , drop = FALSE]

  # Ensure that the `widths` df rows are sorted such that the `"row_group"` row
  # is first (only if it's located in the stub), then `"stub"`, and then
  # everything else
  if ("stub" %in% widths[["type"]]) {
    stub_idx <- which(widths$type == "stub")
    othr_idx <- base::setdiff(seq_len(nrow(widths)), stub_idx)
    widths <- vctrs::vec_slice(widths, c(stub_idx, othr_idx))
  }

  if ("row_group" %in% widths[["type"]] && row_group_as_column) {
    row_group_idx <- which(widths$type == "row_group")
    othr_idx <- base::setdiff(seq_len(nrow(widths)), row_group_idx)
    widths <- vctrs::vec_slice(widths, c(row_group_idx, othr_idx))
  }

  widths <- widths[seq_len(nrow(widths)), "column_width", drop = TRUE]
  widths <- unlist(widths)

  # Stop function if all length dimensions (where provided)
  # don't conform to accepted CSS length definitions
  validate_css_lengths(widths)

  # If all of the widths are defined as px values for all columns,
  # then ensure that the width values are strictly respected as
  # absolute width values (even if a table width has already been set)
  if (table_width == "auto") {

    if (all(grepl("px", widths, fixed = TRUE))) {
      # FIXME sometimes ends up being 0? #1532 and quarto-dev/quarto-cli#8233
      table_width <- "0px"
    } else if (all(grepl("%", widths, fixed = TRUE))) {
      table_width <- "100%"
    }
  }

  if (table_width != "auto") {
    table_style <- htmltools::css(
      `table-layout` = table_layout,
      width = table_width
    )
  } else {
    table_style <-
      htmltools::css(
        `table-layout` = table_layout
      )
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
        mark = footnote_title_marks
      )

  } else {
    footnote_title_marks <- ""
  }

  # Get the style attrs for the title
  if ("title" %in% styles_tbl$locname) {

    title_styles <- vctrs::vec_slice(
      styles_tbl$html_style,
      styles_tbl$locname == "title"
    )
    if (length(title_styles) == 0) {
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
        mark = footnote_subtitle_marks
      )

  } else {
    footnote_subtitle_marks <- ""
  }

  # Get the style attrs for the subtitle
  if (subtitle_defined && "subtitle" %in% styles_tbl$locname) {
    subtitle_styles <- vctrs::vec_slice(
      styles_tbl$html_style,
      styles_tbl$locname == "subtitle"
    )

    if (length(subtitle_styles) == 0) {
      subtitle_styles <- NULL
    }

  } else {
    subtitle_styles <- NA_character_
  }

  title_classes <- c("gt_heading", "gt_title", "gt_font_normal")

  subtitle_classes <- sub("title", "subtitle", title_classes, fixed = TRUE)

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
    # Check if we have multiple labels for multi-column stub
    stub_vars <- dt_boxhead_get_var_stub(data = data)
    has_multi_column_stub <- length(stub_vars) > 1 && !any(is.na(stub_vars))

    if (has_multi_column_stub && length(stubh$label) > 1) {
      # Multiple labels for multi-column stub - add each label individually
      headings_labels <- c(stubh$label, headings_labels)
      headings_vars <- c(paste0("::stub", seq_along(stubh$label)), headings_vars)
    } else {
      # Single label (may span multiple columns) - use current behavior
      headings_labels <- prepend_vec(headings_labels, stubh$label)
      headings_vars <- prepend_vec(headings_vars, "::stub")
    }
  } else if (length(stub_layout) > 0) {
    headings_labels <- prepend_vec(headings_labels, "")
    headings_vars <- prepend_vec(headings_vars, "::stub")
  }

  headings_ids <- valid_html_id(headings_vars)

  stubhead_label_alignment <- "left"

  table_col_headings <- list()

  if (spanner_row_count < 1) {

    # Create the cell(s) for the stubhead label(s)
    if (length(stub_layout) > 0) {

      stubhead_style <-
        if (nrow(stubhead_style_attrs) > 0) {
          stubhead_style_attrs$html_style
        } else {
          NULL
        }

      # Check if we have multiple stubhead labels for multi-column stub
      stub_vars <- dt_boxhead_get_var_stub(data = data)
      has_multi_column_stub <- length(stub_vars) > 1 && !any(is.na(stub_vars))
      has_multiple_labels <- has_multi_column_stub && length(stubh$label) > 1

      if (has_multiple_labels) {
        # Create individual <th> elements for each stubhead label
        for (i in seq_along(stubh$label)) {
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
              colspan = 1,
              style = stubhead_style,
              scope = "col",
              id = headings_ids[i],
              htmltools::HTML(headings_labels[i])
            )
        }
        # Remove the stubhead labels from the lists
        headings_vars <- headings_vars[-seq_along(stubh$label)]
        headings_ids <- headings_ids[-seq_along(stubh$label)]
        headings_labels <- headings_labels[-seq_along(stubh$label)]
      } else {
        # Single label spanning all stub columns (current behavior)
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
            colspan = get_stub_column_count(data),
            style = stubhead_style,
            scope = ifelse(get_stub_column_count(data) > 1, "colgroup", "col"),
            id = headings_ids[1],
            htmltools::HTML(headings_labels[1])
          )

        # Remove the single stubhead from the lists
        headings_vars <- headings_vars[-1]
        headings_ids <- headings_ids[-1]
        headings_labels <- headings_labels[-1]
      }
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
          id = headings_ids[i],
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

    # Create the cell(s) for the stubhead label(s)
    if (length(stub_layout) > 0) {
      stubhead_style <-
        if (nrow(stubhead_style_attrs) > 0) {
          stubhead_style_attrs$html_style
        } else {
          NULL
        }

      # Check if we have multiple stubhead labels for multi-column stub
      stub_vars <- dt_boxhead_get_var_stub(data = data)
      has_multi_column_stub <- length(stub_vars) > 1 && !any(is.na(stub_vars))
      has_multiple_labels <- has_multi_column_stub && length(stubh$label) > 1

      if (has_multiple_labels) {
        # Create individual <th> elements for each stubhead label
        for (i in seq_along(stubh$label)) {
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
              colspan = 1,
              style = stubhead_style,
              scope = "col",
              id = headings_ids[i],
              htmltools::HTML(headings_labels[i])
            )
        }
        # Remove the stubhead labels from the lists
        headings_ids <- headings_ids[-seq_along(stubh$label)]
        headings_vars <- headings_vars[-seq_along(stubh$label)]
        headings_labels <- headings_labels[-seq_along(stubh$label)]
      } else {
        # Single label spanning all stub columns (current behavior)
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
            colspan = get_stub_column_count(data),
            style = stubhead_style,
            scope = ifelse(get_stub_column_count(data) > 1, "colgroup", "col"),
            id = headings_ids[1],
            htmltools::HTML(headings_labels[1])
          )

        # Remove the single stubhead from the lists
        headings_ids <- headings_ids[-1]
        headings_vars <- headings_vars[-1]
        headings_labels <- headings_labels[-1]
      }
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
            id = headings_ids[i],
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
              id = spanner_ids[level_1_index, ][i],
              htmltools::tags$div(
                class = "gt_column_spanner",
                htmltools::HTML(spanners[level_1_index, ][i])
              )
            )
        }
      }
    }

    solo_headings <- headings_vars[is.na(spanner_ids[level_1_index, ])]
    remaining_headings_vars <- headings_vars[!(headings_vars %in% solo_headings)]
    remaining_headings_labels <- dt_boxhead_get(data = data)
    remaining_headings_labels <-
      vctrs::vec_slice(
        remaining_headings_labels$column_label,
        remaining_headings_labels$var %in% remaining_headings_vars
      )
    remaining_headings_labels <-
      unlist(remaining_headings_labels)
    remaining_headings_ids <- valid_html_id(remaining_headings_vars)

    col_alignment <- col_alignment[-1][!(headings_vars %in% solo_headings)]

    if (length(remaining_headings_vars) > 0) {

      spanned_column_labels <- c()

      for (j in seq(remaining_headings_vars)) {
        styles_remaining <-
          dplyr::filter(
            styles_tbl,
            locname == "columns_columns",
            colname == remaining_headings_vars[j]
          )

        remaining_style <-
          if (nrow(styles_remaining) > 0) {
            styles_remaining$html_style
          } else {
            NULL
          }

        remaining_alignment <-
          dt_boxhead_get_alignment_by_var(data = data, remaining_headings_vars[j])

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
            id = remaining_headings_ids[j],
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

          spanner_style <-
            vctrs::vec_slice(
              styles_tbl$html_style,
              styles_tbl$locname == "columns_groups" &
                styles_tbl$grpname %in% spanners_vars
            )


          if (length(spanner_style) == 0) {
            spanner_style <- NULL
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
              id = spanner_ids_row[j],
              if (spanner_ids_row[j] != "") {
                htmltools::tags$div(
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
        table_col_headings
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
  footnotes_tbl <- dt_footnotes_get(data = data)

  # Get effective number of columns
  n_cols_total <- get_effective_number_of_columns(data = data)

  # Get the number of columns for the body cells only
  n_data_cols <- get_number_of_visible_data_columns(data = data)

  # Get vector representation of stub layout
  stub_layout <- get_stub_layout(data = data)

  # Determine if there is a stub column in `stub_layout` and whether we
  # have a two-column stub (with the group label on the left side)
  has_stub_column <- "rowname" %in% stub_layout
  has_two_col_stub <- "group_label" %in% stub_layout

  # Create ID components for every column that will be rendered
  col_names_id <-
    c(
      if ((n_cols_total - n_data_cols) > 0) {
        # For all stub columns, use generic stub IDs for backward compatibility
        paste0("stub_", seq_len(n_cols_total - n_data_cols))
      },
      dt_boxhead_get_vars_default(data = data)
    )

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
  if (anyNA(groups_rows_df$group_label)) {
    groups_rows_df$group_label[is.na(groups_rows_df$group_label)] <- ""
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

      # For multi-column stubs, apply the thick border to all stub columns
      # This creates a nice visual hierarchy with "boxes" for each level
      stub_vars <- dt_boxhead_get_var_stub(data = data)

      if (length(stub_vars) > 1 && !any(is.na(stub_vars))) {
        # Multi-column stub: apply gt_stub class to all stub columns
        for (i in seq_len(length(stub_vars))) {
          extra_classes_1[[i]] <- "gt_stub"
          extra_classes_2[[i]] <-
            c("gt_stub", if (table_stub_striped) "gt_striped" else NULL)
        }
      } else {
        # Single column stub: apply gt_stub class to the rowname column (existing behavior)
        extra_classes_1[[row_label_col]] <- "gt_stub"
        extra_classes_2[[row_label_col]] <-
          c("gt_stub", if (table_stub_striped) "gt_striped" else NULL)
      }
    }
  }

  # Create a default vector of row span values for group labels as a column
  row_span_vals <- rep_len(NA_integer_, n_cols_total)

  current_group_id <- character(0L)

  n_groups <- nrow(groups_rows_df)

  group_headings <- lapply(
    seq_len(n_groups),
    function(i) {
      group_id <- groups_rows_df[["group_id"]][[i]]
      group_label <- groups_rows_df[["group_label"]][[i]]

      if (is.null(group_id) || has_two_col_stub) {
        return(NULL)
      }

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

      htmltools::tags$tr(
        class = "gt_group_heading_row",
        htmltools::tags$th(
          colspan = n_cols_total,
          class = group_class,
          style = row_style_group_heading_row,
          scope = if (n_cols_total > 1) "colgroup" else "col",
          id = group_label,
          htmltools::HTML(group_label)
        )
      )
    }
  )

  group_summaries <- lapply(
    seq_len(n_groups),
    function(i) {
      group_id <- groups_rows_df[["group_id"]][[i]]
      group_label <- groups_rows_df[["group_label"]][[i]]
      group_has_summary_rows <- groups_rows_df[["has_summary_rows"]][[i]]
      group_summary_row_side <- groups_rows_df[["summary_row_side"]][[i]]

      needs_summary <-
        summaries_present &&
        !is.null(group_has_summary_rows) &&
        group_has_summary_rows &&
        !is.null(group_summary_row_side) &&
        !is.na(group_summary_row_side) &&
        group_summary_row_side %in% c("top", "bottom")

      if (!needs_summary) {
        return(NULL)
      }

      summary <- summary_rows_for_group_h(
        data = data,
        group_id = group_id
      )

      if (has_two_col_stub && identical(group_summary_row_side, "top")) {
        summary_rows_group_df <-
          list_of_summaries[["summary_df_display_list"]][[group_id]]

        if (!is.null(summary_rows_group_df) && "rowname" %in% stub_layout) {
          summary_row_count <- nrow(summary_rows_group_df)
        } else {
          summary_row_count <- 0L
        }

        rowspan_val <-
          groups_rows_df$row_end[[i]] - groups_rows_df$row_start[[i]] + 1 + summary_row_count

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

        summary[[1]] <-
          htmltools::HTML(sub("^<tr>", paste0("<tr>", group_col_td), as.character(summary[[1]])))
      }

      summary
    }
  )

  summary_locations <- lapply(
    seq_len(n_groups),
    function(i) {
      if (is.null(group_summaries[[i]])) {
        return(NULL)
      }

      group_summary_row_side <- groups_rows_df[["summary_row_side"]][[i]]
      if (group_summary_row_side == "top") {
        groups_rows_df[["row_start"]][[i]]
      } else if (group_summary_row_side == "bottom") {
        groups_rows_df[["row_end"]][[i]]
      }
    }
  )
  summary_locations <- unlist(summary_locations)

  # Store when rtl is detected so that later left alignment can be transformed to
  # right alignment
  has_rtl <- matrix(grepl(rtl_modern_unicode_charset, cell_matrix), ncol = ncol(cell_matrix))
  cell_matrix[has_rtl] <- paste0("<p dir=\"rtl\">", cell_matrix[has_rtl], "</p>")

  non_center_alignments <- alignment_classes != "gt_center"

  # Calculate hierarchical stub rowspan information for multi-column stubs
  # TODO: Re-enable this after fixing vector length issues
  # hierarchical_stub_info <- calculate_hierarchical_stub_rowspans(data)
  hierarchical_stub_info <- calculate_hierarchical_stub_rowspans(data)

  body_rows_data <- list()
  body_rows_data$row_df <- vector("list", n_rows)
  body_rows_data$col_id_i <- vector("list", n_rows)
  body_rows_data$row_id_i <- vector("list", n_rows)
  body_rows_data$row_span_vals <- vector("list", n_rows)
  body_rows_data$alignment_classes <- vector("list", n_rows)
  body_rows_data$extra_classes <- vector("list", n_rows)
  body_rows_data$row_styles <- vector("list", n_rows)
  group_ids <- rep_len(NA_character_, n_rows)
  row_classes <- rep_len(NA_character_, n_rows)

  # FIXME: workaround for incorrect behaviour of `rows_add()`
  # only added to make tests pass
  # #1471
  idx <- is.na(groups_rows_df$group_id)
  groups_rows_df$group_id[idx] <- "NA"
  groups_rows_df$group_label[idx] <- "NA"
  # end fixme

  group_idx <- rep(list(NULL), n_rows)
  for (i in seq_len(n_groups)) {
    start <- groups_rows_df$row_start[[i]]
    end <- groups_rows_df$row_end[[i]]
    group_idx[seq(start, end)] <- i
    group_ids[seq(start, end)] <- groups_rows_df$group_id[[i]]
  }
  groups_list <- as.list(groups_rows_df)

  for (i in seq_len(n_rows)) {
    alignment_classes_i <- alignment_classes
    row_span_vals_i <- row_span_vals

    # Apply hierarchical stub rowspan logic if available
    if (!is.null(hierarchical_stub_info)) {
      # Get stub variables and layout
      stub_vars <- dt_boxhead_get_var_stub(data = data)

      if (!(length(stub_vars) == 1 && is.na(stub_vars))) {
        hierarchy_vars <- stub_vars[-length(stub_vars)]  # Exclude rightmost stub column

        # Apply rowspan values for hierarchical stub columns
        for (var_idx in seq_along(hierarchy_vars)) {
          var_name <- hierarchy_vars[var_idx]
          if (var_name %in% names(hierarchical_stub_info)) {
            stub_info <- hierarchical_stub_info[[var_name]]

            # Set rowspan for this column if > 1
            if (stub_info$rowspans[i] > 1) {
              row_span_vals_i[[var_idx]] <- stub_info$rowspans[i]
            }
          }
        }
      }
    }

    g <- group_idx[[i]]
    group_id <- groups_list$group_id[g]
    group_row_start <- groups_list$row_start[g]
    group_row_end <- groups_list$row_end[g]
    group_has_summary_rows <- groups_list$has_summary_rows[g]
    group_summary_row_side <- groups_list$summary_row_side[g]

    # Is this the first row of a group?
    group_start <- !is.null(g) && group_row_start == i

    #
    # Create a body row
    #

    # If any characters come from a RTL script, ensure that a
    # left alignment is transformed to a right alignment
    has_rtl_i <- has_rtl[i, ]
    if (any(has_rtl_i)) {
      alignment_classes_i[has_rtl_i & non_center_alignments] <- "gt_right"
    }

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

    # Get stub column styles separately
    stub_column_styles <-
      dt_styles_pluck(
        styles_tbl = styles_tbl,
        locname = "stub_column",
        rownum = i
      )

    row_styles <-
      build_row_styles_with_stub_columns(
        styles_resolved_row = styles_row,
        stub_column_styles = stub_column_styles,
        include_stub = has_stub_column,
        n_cols = n_data_cols,
        data = data
      )

    # Handle the layout case where there is a 'two-column stub', which
    # is the row group label occupying a separate column to the LHS of
    # the row labels (this column needs to have a correct rowspan value
    # on the group)
    #
    # The first subcase of this is where `i` is the first row of
    # this grouping of rows
    if (has_two_col_stub && group_start) {

      # Modify the `extra_classes` list to include a class for
      # the row group column
      extra_classes[[1]] <- "gt_stub_row_group"

      summary_rows_group_df <-
        list_of_summaries[["summary_df_display_list"]][[group_id]]

      if (!is.null(summary_rows_group_df) && "rowname" %in% stub_layout) {
        summary_row_count <- nrow(summary_rows_group_df)
      } else {
        summary_row_count <- 0L
      }

      # If the summary rows are to be located at the bottom of the group
      # modify the `row_span_vals` list such that the first element
      # contains the number of rows to span
      # TODO: replace with condition for summary rows at bottom

      if (!(i %in% summary_locations && group_summary_row_side == "top")) {
        row_span_vals_i[[1]] <-
          group_row_end - group_row_start + 1 + summary_row_count
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
      if (is_empty(row_style_group_heading_row)) {
        row_style_group_heading_row <- NA_character_
      }

      # Add style of row group cell to vector
      row_styles <- c(row_style_group_heading_row, row_styles)
    }

    # The second subcase of this is where `i` is *not* the first row
    # of this grouping of rows and we'd want the leftmost column with
    # the group label to not have a rowspan attr or any special classes
    if (has_two_col_stub && !group_start) {

      # Remove first element of `alignment_classes` vector
      alignment_classes_i <- alignment_classes_i[-1]
      row_span_vals_i <- row_span_vals_i[-1]
      extra_classes <- extra_classes[-1]
    }

    row_df <-
      output_df_row_as_vec(
        i = i,
        cell_matrix = cell_matrix,
        groups_rows_df = groups_rows_df,
        has_two_col_stub = has_two_col_stub,
        hierarchical_stub_info = hierarchical_stub_info
      )

    # Apply hierarchical stub logic to filter out elements that should be hidden
    cols_to_remove <- c()
    if (!is.null(hierarchical_stub_info)) {
      stub_vars <- dt_boxhead_get_var_stub(data = data)
      if (!(length(stub_vars) == 1 && is.na(stub_vars))) {
        hierarchy_vars <- stub_vars[-length(stub_vars)]  # Exclude rightmost stub column

        for (var_idx in seq_along(hierarchy_vars)) {
          var_name <- hierarchy_vars[var_idx]
          if (var_name %in% names(hierarchical_stub_info)) {
            stub_info <- hierarchical_stub_info[[var_name]]

            # If this row should not display this column's value (it's part of a merge)
            if (!stub_info$display_mask[i]) {
              cols_to_remove <- c(cols_to_remove, var_idx)
            }
          }
        }
      }
    }

    # Remove the columns/elements that should be hidden
    if (length(cols_to_remove) > 0) {
      # Adjust indices if they are beyond the current vector length
      cols_to_remove <- cols_to_remove[cols_to_remove <= length(row_df)]

      if (length(cols_to_remove) > 0) {
        row_df <- row_df[-cols_to_remove]
        # Also remove from other vectors to maintain synchronization
        if (length(col_id_i) >= max(cols_to_remove)) {
          col_id_i <- col_id_i[-cols_to_remove]
        }
        if (length(row_id_i) >= max(cols_to_remove)) {
          row_id_i <- row_id_i[-cols_to_remove]
        }
        if (length(row_span_vals_i) >= max(cols_to_remove)) {
          row_span_vals_i <- row_span_vals_i[-cols_to_remove]
        }
        if (length(alignment_classes_i) >= max(cols_to_remove)) {
          alignment_classes_i <- alignment_classes_i[-cols_to_remove]
        }
        if (length(has_rtl_i) >= max(cols_to_remove)) {
          has_rtl_i <- has_rtl_i[-cols_to_remove]
        }
        if (length(extra_classes) >= max(cols_to_remove)) {
          extra_classes <- extra_classes[-cols_to_remove]
        }
        if (length(row_styles) >= max(cols_to_remove)) {
          row_styles <- row_styles[-cols_to_remove]
        }
      }
    }

    # Situation where we have multiple columns in the stub and the row label
    # isn't the first (the `row_df` vector will have one less element)
    if (length(col_names_id) > length(row_df)) {
      if (has_two_col_stub && !group_start) {
        # For 2-column stub non-first rows, skip the group column (first element)
        # and take the remaining elements that match row_df length
        col_id_i <- col_names_id[-1][seq_len(length(row_df))]
      } else {
        # Take the first n elements where n = length(row_df)
        col_id_i <- col_names_id[seq_len(length(row_df))]
      }
    } else {
      col_id_i <- col_names_id
    }

    stub_width <- length(stub_layout)

    if (stub_width == 0) {
      row_id_i <- character(length(col_id_i))
    } else if (has_two_col_stub) {
      # For group labels as columns (2-column stub), we always use stub_2_X pattern
      row_id_i <- rep(paste0("stub_2_", i), length(col_id_i))
    } else if (stub_width == 1) {
      # Always use stub_1_X pattern for row IDs when there's a stub
      row_id_i <- rep(paste0("stub_1_", i), length(col_id_i))
    } else {
      # For multi-column stubs (>= 2), use stub_X_Y pattern
      last_stub_idx <- min(stub_width, length(col_id_i))
      if (last_stub_idx > 0) {
        row_id_i <- rep(paste0("stub_", last_stub_idx, "_", i), length(col_id_i))
      } else {
        row_id_i <- character(length(col_id_i))
      }
    }

    # In the situation where there is:
    # (1) a group summary to be situated at the top of the group, and,
    # (2) a two-column stub
    # we have to excise the redundant group label
    if (
      summaries_present &&
      !is.null(group_has_summary_rows) &&
      group_has_summary_rows &&
      has_two_col_stub &&
      group_start &&
      !is.null(group_summary_row_side) &&
      !is.na(group_summary_row_side) &&
      group_summary_row_side == "top"
    ) {

      row_df <- row_df[-1]
      col_id_i <- col_id_i[-1]
      row_id_i <- row_id_i[-1]
      row_span_vals_i <- row_span_vals_i[-1]
      alignment_classes_i <- alignment_classes_i[-1]
      has_rtl_i <- has_rtl_i[-1]
      extra_classes <- extra_classes[-1]
      row_styles <- row_styles[-1]
    }

    # Ensure all vectors have the same length before adding to body_rows_data
    target_length <- length(row_df)

    # Truncate or pad vectors to match row_df length
    col_id_i <- col_id_i[seq_len(min(length(col_id_i), target_length))]
    if (length(col_id_i) < target_length) {
      col_id_i <- c(col_id_i, rep(NA_character_, target_length - length(col_id_i)))
    }

    row_id_i <- row_id_i[seq_len(min(length(row_id_i), target_length))]
    if (length(row_id_i) < target_length) {
      row_id_i <- c(row_id_i, rep(NA_character_, target_length - length(row_id_i)))
    }

    row_span_vals_i <- row_span_vals_i[seq_len(min(length(row_span_vals_i), target_length))]
    if (length(row_span_vals_i) < target_length) {
      row_span_vals_i <- c(row_span_vals_i, rep(NA_integer_, target_length - length(row_span_vals_i)))
    }

    alignment_classes_i <- alignment_classes_i[seq_len(min(length(alignment_classes_i), target_length))]
    if (length(alignment_classes_i) < target_length) {
      alignment_classes_i <- c(alignment_classes_i, rep("gt_left", target_length - length(alignment_classes_i)))
    }

    has_rtl_i <- has_rtl_i[seq_len(min(length(has_rtl_i), target_length))]
    if (length(has_rtl_i) < target_length) {
      has_rtl_i <- c(has_rtl_i, rep(FALSE, target_length - length(has_rtl_i)))
    }

    if (length(extra_classes) != target_length) {
      if (length(extra_classes) > target_length) {
        extra_classes <- extra_classes[seq_len(target_length)]
      } else {
        # Pad with empty lists
        extra_classes <- c(extra_classes, replicate(target_length - length(extra_classes), list(character(0)), simplify = FALSE))
      }
    }

    row_styles <- row_styles[seq_len(min(length(row_styles), target_length))]
    if (length(row_styles) < target_length) {
      row_styles <- c(row_styles, rep(NA_character_, target_length - length(row_styles)))
    }

    body_rows_data$row_df[[i]] <- row_df
    body_rows_data$col_id_i[[i]] <- col_id_i
    body_rows_data$row_id_i[[i]] <- row_id_i
    body_rows_data$row_span_vals[[i]] <- row_span_vals_i
    body_rows_data$alignment_classes[[i]] <- alignment_classes_i
    body_rows_data$extra_classes[[i]] <- extra_classes
    body_rows_data$row_styles[[i]] <- row_styles
    if (group_start) {
      row_classes[i] <- "gt_row_group_first"
    }
  }

  if (n_rows == 0) {
    body_rows <- list()
  } else {
    ns <- lengths(body_rows_data$row_df)
    body_rows_data_flat <- lapply(body_rows_data, function(x) unlist(x, recursive = FALSE))
    # Unlike the other fields `group_ids` is of size 1 per row. So it
    # needs to be repeated to match the size of the other fields
    group_ids <- vctrs::vec_rep_each(group_ids, times = ns)
    body_rows_data_flat$current_group_id <- group_ids
    ## here we have to make sur the lengths can be recycled to each others.
    # vctrs::vec_recycle_common()
    body_rows_uncollapsed <- vctrs::vec_chop(
      do.call(render_row_data, body_rows_data_flat),
      sizes = ns
    )
    body_rows_vec <- lapply(body_rows_uncollapsed, function(x) paste0(x, collapse = "\n"))

    body_rows <- lapply(
      seq_along(body_rows_vec),
      function(i) {
        list(htmltools::tag(
          "tr",
          varArgs = list(
            class = if (!is.na(row_classes[[i]])) row_classes[[i]],
            htmltools::HTML(body_rows_vec[[i]])
          )
        ))
      }
    )
  }

  for (i in seq_len(n_groups)) {
    group_row_start <- groups_rows_df$row_start[[i]]
    group_row_end <- groups_rows_df$row_end[[i]]
    group_summary_row_side <- groups_rows_df$summary_row_side[[i]]

    if (identical(group_summary_row_side, "top")) {
      body_rows[[group_row_start]] <- append(group_summaries[i], body_rows[[group_row_start]])
    }

    # A group heading row occurs before a formal row `i` in that it really
    # doesn't have an index number but we do anchor it to an `i` index and
    # place it just before row `i`
    body_rows[[group_row_start]] <- append(group_headings[i], body_rows[[group_row_start]])

    if (identical(group_summary_row_side, "bottom")) {
      body_rows[[group_row_end]] <- append(body_rows[[group_row_end]], group_summaries[i])
    }
  }

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

render_row_data <- function(
    row_df,
    current_group_id,
    col_id_i,
    row_id_i,
    row_span_vals,
    alignment_classes,
    extra_classes,
    row_styles
) {
  n <- length(row_df)

  has_stub_class <- vapply(
    extra_classes,
    function(extra_class) "gt_stub" %in% extra_class,
    logical(1)
  )

  # below we use a fast version of `ifelse()` where `test` is a logical vector
  # without NA
  elements <- rep.int("td", n)
  elements[has_stub_class] <- "th"

  scope <- rep.int("row", n)
  scope[!is.na(row_span_vals) & row_span_vals > 1] <- "rowgroup"

  has_group <- !is.na(current_group_id)
  header <- paste0(
    ifelse(has_group, current_group_id, ""), ifelse(has_group, " ", ""),
    row_id_i, ifelse(has_group | nzchar(row_id_i), " ", ""),
    col_id_i
  )

  base_attributes <- ifelse(
    has_stub_class,
    paste0("id=\"", row_id_i, "\" ", "scope=\"", scope, "\" "),
    paste0("headers=\"", header, "\" ")
  )

  row_span_attributes <- character(n)
  row_span_attributes[!is.na(row_span_vals)] <- paste0("rowspan=\"", row_span_vals[!is.na(row_span_vals)], "\" ")
  styles <- character(n)
  styles[!is.na(row_styles)] <- paste0(" style=\"", row_styles[!is.na(row_styles)], "\"")

  extra_classes_chr <- rep("", n)
  extra_classes_idx <- lengths(extra_classes) > 0
  extra_classes_chr[extra_classes_idx] <- vapply(
    extra_classes[extra_classes_idx],
    function(extra_class) {
      paste0(" ", extra_class, collapse = " ")
    },
    character(1L)
  )

  sprintf(
    "<%s %s%sclass=\"gt_row %s%s\"%s>%s</%s>",
    elements,
    base_attributes,
    row_span_attributes,
    alignment_classes,
    extra_classes_chr,
    styles,
    as.character(row_df),
    elements
  )
}

# Define function to get a character vector of formatted cell
# data (this includes the stub, if it is present)
output_df_row_as_vec <- function(
    i,
    cell_matrix,
    groups_rows_df,
    has_two_col_stub,
    hierarchical_stub_info = NULL
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

#' Create the combined table footer component
#'
#' @noRd
create_footer_component_h <- function(data) {

  source_notes <- dt_source_notes_get(data = data)
  footnotes_tbl <- dt_footnotes_get(data = data)

  # If there are no source notes and no footnotes, return empty string
  if (is.null(source_notes) && nrow(footnotes_tbl) == 0) {
    return("")
  }

  styles_tbl <- dt_styles_get(data = data)
  n_cols_total <- get_effective_number_of_columns(data = data)

  # Collect all footer rows
  footer_rows <- list()

  # Add footnote rows first (footnotes should appear above source notes)
  if (nrow(footnotes_tbl) > 0) {

    # Ensure `fs_id` column exists (it should have been added by
    # `resolve_footnotes_styles()`)
    if (!"fs_id" %in% names(footnotes_tbl)) {
      # Add a temporary fs_id based on row numbers as fallback
      footnotes_tbl$fs_id <- as.character(seq_len(nrow(footnotes_tbl)))
    }

    # Get the distinct set of `fs_id` & `footnotes` values
    # in the `footnotes_tbl`
    footnotes_tbl <- dplyr::distinct(footnotes_tbl, fs_id, footnotes)

    # Get the style attrs for the footnotes
    footnotes_styles <- NULL
    if ("footnotes" %in% styles_tbl$locname) {
      footnotes_style <- styles_tbl[styles_tbl$locname == "footnotes", ]

      footnotes_styles <-
        if (nrow(footnotes_style) > 0) {
          paste(footnotes_style$html_style, collapse = " ")
        } else {
          NULL
        }
    }

    # Get the footnote multiline option
    footnotes_multiline <-
      dt_options_get_value(data = data, option = "footnotes_multiline")

    # Get the footnote separator option
    footnotes_separator <-
      dt_options_get_value(data = data, option = "footnotes_sep")

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

    if (footnotes_multiline) {
      # Create one row per footnote
      for (footnote in footnotes) {
        footer_rows <- append(footer_rows, list(
          htmltools::tags$tr(
            class = "gt_footnotes",
            htmltools::tags$td(
              class = "gt_footnote",
              style = footnotes_styles,
              colspan = n_cols_total,
              htmltools::HTML(footnote)
            )
          )
        ))
      }
    } else {
      # Perform HTML escaping on the separator text and transform space
      # characters to non-breaking spaces
      footnotes_separator <-
        gsub(" (?= )", "&nbsp;", footnotes_separator, perl = TRUE)

      # Create a single row with all footnotes
      footer_rows <- append(footer_rows, list(
        htmltools::tags$tr(
          class = "gt_footnotes",
          htmltools::tags$td(
            class = "gt_footnote",
            style = footnotes_styles,
            colspan = n_cols_total,
            htmltools::tags$div(
              style = htmltools::css(`padding-bottom` = "2px"),
              htmltools::HTML(paste(footnotes, collapse = footnotes_separator))
            )
          )
        )
      ))
    }
  }

  # Add source note rows after footnotes
  if (!is.null(source_notes)) {

    # Get the style attrs for the source notes
    source_notes_styles <- NULL
    if ("source_notes" %in% styles_tbl$locname) {
      source_notes_style <-
        vctrs::vec_slice(
          styles_tbl$html_style,
          !is.na(styles_tbl$locname) & styles_tbl$locname == "source_notes"
        )

      source_notes_styles <-
        if (length(source_notes_style) > 0) {
          paste(source_notes_style, collapse = " ")
        } else {
          NULL
        }
    }

    # Get the source note multiline option
    source_notes_multiline <-
      dt_options_get_value(data = data, option = "source_notes_multiline")

    # Get the source note separator option
    source_notes_separator <-
      dt_options_get_value(data = data, option = "source_notes_sep")

    if (source_notes_multiline) {
      # Create one row per source note
      for (source_note in source_notes) {
        footer_rows <- append(footer_rows, list(
          htmltools::tags$tr(
            class = "gt_sourcenotes",
            htmltools::tags$td(
              class = "gt_sourcenote",
              style = source_notes_styles,
              colspan = n_cols_total,
              htmltools::HTML(source_note)
            )
          )
        ))
      }
    } else {
      # Perform HTML escaping on the separator text and transform space
      # characters to non-breaking spaces
      source_notes_separator <-
        gsub(" (?= )", "&nbsp;", source_notes_separator, perl = TRUE)

      # Create a single row with all source notes
      footer_rows <- append(footer_rows, list(
        htmltools::tags$tr(
          class = "gt_sourcenotes",
          htmltools::tags$td(
            class = "gt_sourcenote",
            style = source_notes_styles,
            colspan = n_cols_total,
            htmltools::tags$div(
              style = htmltools::css(`padding-bottom` = "2px"),
              htmltools::HTML(
                paste(source_notes, collapse = source_notes_separator)
              )
            )
          )
        )
      ))
    }
  }

  # Return a single tfoot with all rows
  if (length(footer_rows) > 0) {
    htmltools::tags$tfoot(footer_rows)
  } else {
    ""
  }
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
      dplyr::all_of(c(rowname_col_private, default_vars))
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
                  if (is.na(cell_style)) {
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
  # output table; the first data column is number 1. No colnum should appear in
  # styles_resolved_row, and it's OK for a column not to appear in
  # styles_resolved_row, and it's OK for styles_resolved_row to have 0 rows.
  #
  # If `include_stub` is TRUE, then a row with column==0 will be used as the
  # stub style.

  # This function's implementation can't tolerate colnum of NA, or illegal
  # colnum values. Check and throw early.
  if (
    !isTRUE(all(styles_resolved_row$colnum %in% c(0, seq_len(n_cols)))) ||
    anyDuplicated(styles_resolved_row$colnum) > 0L
  ) {
    cli::cli_abort(
      "`build_row_styles()` was called with invalid `colnum` values."
    )
  }

  n_cols <- n_cols + include_stub
  result <- rep_len(NA_character_, n_cols)

  # The subset of styles_resolved_row that applies to data
  idx <- styles_resolved_row$colnum > 0
  result[styles_resolved_row$colnum[idx] + include_stub] <- styles_resolved_row$html_style[idx]

  # If a stub exists, we need to prepend a style (or NULL) to the result.
  if (include_stub) {
    idx_0 <- styles_resolved_row$colnum == 0
    stub_style <- styles_resolved_row$html_style[idx_0]
    if (!is_empty(stub_style)) {
      result[1] <- stub_style
    }
  }

  result
}

build_row_styles_with_stub_columns <- function(
    styles_resolved_row,
    stub_column_styles,
    include_stub,
    n_cols,
    data
) {

  # First, build normal row styles
  row_styles <- build_row_styles(
    styles_resolved_row = styles_resolved_row,
    include_stub = include_stub,
    n_cols = n_cols
  )

  # If we have stub column styles and a stub exists, modify the stub styles
  if (include_stub && nrow(stub_column_styles) > 0) {

    # Get stub variables to map column names to positions
    stub_vars <- dt_boxhead_get_var_stub(data = data)

    if (!all(is.na(stub_vars))) {
      # Create mapping from column names to stub positions
      stub_positions <- seq_along(stub_vars)
      names(stub_positions) <- stub_vars

      # Apply per-column stub styles
      for (j in seq_len(nrow(stub_column_styles))) {
        col_name <- stub_column_styles$colname[j]
        if (col_name %in% names(stub_positions)) {
          stub_pos <- stub_positions[col_name]
          # Apply style to the correct stub position
          # Each stub column has its own position in the row_styles array
          if (stub_pos <= length(row_styles)) {
            # MERGE styles instead of overwriting
            existing_style <- row_styles[stub_pos]
            new_style <- stub_column_styles$html_style[j]

            if (is.na(existing_style) || existing_style == "") {
              row_styles[stub_pos] <- new_style
            } else if (!is.na(new_style) && new_style != "") {
              # Merge CSS styles by combining them
              row_styles[stub_pos] <- paste(existing_style, new_style, sep = "; ")
            }
          }
        }
      }
    }
  }

  # For multi-column stubs, modify border widths for internal columns
  if (include_stub) {
    stub_vars <- dt_boxhead_get_var_stub(data = data)

    if (length(stub_vars) > 1 && !all(is.na(stub_vars))) {
      # Multi-column stub: apply half-thickness borders to internal columns
      for (i in seq_along(stub_vars)) {
        if (i < length(stub_vars)) {
          # Internal stub columns: use half-thickness border (1px instead of 2px)
          border_override <- "border-right-width: 1px"

          if (is.na(row_styles[i]) || row_styles[i] == "") {
            row_styles[i] <- border_override
          } else {
            # Check if border-right-width is already set and replace it
            if (grepl("border-right-width:", row_styles[i])) {
              row_styles[i] <- gsub("border-right-width:[^;]*", "border-right-width: 1px", row_styles[i])
            } else {
              row_styles[i] <- paste(row_styles[i], border_override, sep = "; ")
            }
          }
        }
        # Last column keeps default border-right-width (2px from CSS)
      }
    }
  }

  row_styles
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

valid_html_id <- function(x) {
  # Make sure it starts with a letter.
  valid_ids <- grepl("^[A-z]", x)
  x[!valid_ids] <- paste0("a", x[!valid_ids])
  gsub("\\s+", "-", x)
}

# Function to calculate rowspan values for hierarchical stub columns
calculate_hierarchical_stub_rowspans <- function(data) {

  # Get stub layout and information
  stub_layout <- get_stub_layout(data = data)
  boxh <- dt_boxhead_get(data = data)

  # Check if we have multiple stub columns
  stub_vars <- dt_boxhead_get_var_stub(data = data)

  if (length(stub_vars) == 1 && is.na(stub_vars)) {
    # No stub columns
    return(NULL)
  }

  if (length(stub_vars) <= 1) {
    # Single stub column or no stub - no hierarchical merging needed
    return(NULL)
  }

  # Get the body data for stub columns using the original data (before footnotes)
  # This is crucial to avoid footnote markup interfering with hierarchical grouping
  original_body <- dt_data_get(data = data)
  n_rows <- nrow(original_body)

  if (n_rows == 0) {
    return(NULL)
  }

  # Create a matrix of stub values (excluding the rightmost column which is the row identifier)
  hierarchy_vars <- stub_vars[-length(stub_vars)]  # Remove rightmost stub column
  stub_matrix <- as.matrix(original_body[, hierarchy_vars, drop = FALSE])

  # Initialize rowspan information
  rowspan_info <- list()

  # For each hierarchical stub column (left to right, excluding rightmost)
  for (col_idx in seq_along(hierarchy_vars)) {
    var_name <- hierarchy_vars[col_idx]
    col_values <- stub_matrix[, col_idx]

    # Calculate rowspans for this column based on consecutive identical values
    # and values in columns to the left
    rowspans <- rep(1L, n_rows)
    display_mask <- rep(TRUE, n_rows)  # TRUE = display value, FALSE = merge/hide

    current_span_start <- 1

    for (row_idx in 2:n_rows) {
      # Check if current row should continue the span from previous row
      should_continue_span <- TRUE

      # Must match current column value (handle NAs properly)
      curr_val <- col_values[row_idx]
      prev_val <- col_values[row_idx - 1]

      # Two values match if they're both identical or both NA
      if (!identical(curr_val, prev_val)) {
        should_continue_span <- FALSE
      }

      # Must match all values in columns to the left
      if (col_idx > 1) {
        for (left_col_idx in 1:(col_idx - 1)) {
          curr_left <- stub_matrix[row_idx, left_col_idx]
          prev_left <- stub_matrix[row_idx - 1, left_col_idx]
          if (!identical(curr_left, prev_left)) {
            should_continue_span <- FALSE
            break
          }
        }
      }

      if (should_continue_span) {
        # Continue the current span
        display_mask[row_idx] <- FALSE
      } else {
        # End current span and start a new one
        span_length <- row_idx - current_span_start
        if (span_length > 1) {
          rowspans[current_span_start] <- span_length
        }
        current_span_start <- row_idx
      }
    }

    # Handle the last span
    span_length <- n_rows - current_span_start + 1
    if (span_length > 1) {
      rowspans[current_span_start] <- span_length
    }

    rowspan_info[[var_name]] <- list(
      rowspans = rowspans,
      display_mask = display_mask
    )
  }

  rowspan_info
}
