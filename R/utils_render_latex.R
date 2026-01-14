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


# Create a simple LaTeX group by surrounding a statement with curly braces
latex_group <- function(...) {
  paste0("{", ..., "}")
}

# Get a vector of LaTeX packages to use as table dependencies
latex_packages <- function() {
  getOption("gt.latex_packages")
}

# Transform a footnote mark to a LaTeX representation as a superscript
footnote_mark_to_latex <- function(
    data,
    mark,
    location = c("ref", "ftr")
) {

  location <- match.arg(location)

  if (length(mark) == 1 && is.na(mark)) {
    return("")
  }

  spec <- get_footnote_spec_by_location(data = data, location = location)
  spec <- spec %||% "^i"

  if (grepl(".", spec, fixed = TRUE)) mark <- sprintf_unless_na("%s.", mark)
  if (grepl("b", spec, fixed = TRUE)) mark <- sprintf_unless_na("\\textbf{%s}", mark)
  if (grepl("i", spec, fixed = TRUE)) mark <- sprintf_unless_na("\\textit{%s}", mark)
  if (grepl("\\(|\\[", spec)) mark <- sprintf_unless_na("(%s", mark)
  if (grepl("\\)|\\]", spec)) mark <- sprintf_unless_na("%s)", mark)

  if (grepl("^", spec, fixed = TRUE)) {
    mark <- sprintf_unless_na("\\textsuperscript{%s}", mark)
  }

  mark[is.na(mark)] <- ""

  mark
}

#' @noRd
sprintf_unless_na <- function(fmt, x) {

  ifelse(
    is.na(x),
    NA_character_,
    sprintf(fmt, x)
  )

}

#' @noRd
latex_body_row <- function(content, type) {

  if (type == "row") {

    return(paste(paste(content, collapse = " & "), "\\\\ \n"))

  } else if (type == "group") {

    return(paste(paste(content, collapse = " & "), "\\\\ \n"))
  }
}

#' @noRd
latex_heading_row <- function(content, header_repeat = FALSE) {


  paste0(
    paste(paste(content, collapse = " & "), "\\\\ \n"),
    "\\midrule",
    if (header_repeat) {"\\endhead"},
    "\\addlinespace[2.5pt]\n",
    collapse = ""
  )
}

#' @noRd
latex_group_row <- function(
    group_name,
    n_cols,
    top_border = TRUE,
    bottom_border = TRUE,
    colwidth_df
) {

  # The width of the group row should be that of the entire table
  tab_width <- colwidth_df$tbl_width[1L]
  use_width <- ifelse(is.na(tab_width), "l", sprintf(">{\\raggedright\\arraybackslash}m{%s}", tab_width))

  if (is.na(group_name)) {
    row_txt <- paste0(latex_multicolumn_cell("\\rule{0pt}{0pt}", alignment = use_width, ncols = n_cols, override_alignment = FALSE)," \\\\[-3.2ex] \n")
  } else {
    row_txt <- paste0(latex_multicolumn_cell(group_name, alignment = use_width, ncols = n_cols, override_alignment = FALSE)," \\\\[2.5pt] \n")
  }

  paste0(
    ifelse(top_border, "\\midrule\\addlinespace[2.5pt]\n", ""),
    row_txt,
    ifelse(bottom_border, "\\midrule\\addlinespace[2.5pt]\n", ""),
    collapse = ""
  )
}

#' @noRd
create_wrap_start_l <- function(data) {
  tbl_pos_val <- dt_options_get_value(data = data, option = "latex_tbl_pos")
  if (check_quarto() || is.na(tbl_pos_val)) {
    tbl_pos <- ""
  } else {
    tbl_pos <- paste0("[", tbl_pos_val, "]")
  }

  ifelse(
    dt_options_get_value(data = data, option = "latex_use_longtable"),
    "\\begingroup\n",
    paste0("\\begin{table}", tbl_pos, "\n")
  )
}

#' @noRd
create_table_start_l <- function(data, colwidth_df) {

  # Get vector representation of stub layout
  stub_layout <- get_stub_layout(data = data)

  # Extract only visible columns of `colwidth_df` based on stub_layout.
  types <- c("default")
  if ("rowname" %in% stub_layout) {
    types <- c(types, "stub")
  }
  if ("group_label" %in% stub_layout) {
    types <- c(types, "row_group")
  }

  colwidth_df_visible <- colwidth_df[colwidth_df$type %in% types, ]

  # Ensure that the `colwidth_df_visible` df rows are sorted such that the
  # `"row_group"` row is first (only if it's located in the stub), then `"stub"`,
  # and then everything else
  if ("stub" %in% colwidth_df_visible[["type"]]) {
    stub_idx <- which(colwidth_df_visible$type == "stub")
    othr_idx <- base::setdiff(seq_len(nrow(colwidth_df_visible)), stub_idx)
    colwidth_df_visible <- vctrs::vec_slice(colwidth_df_visible, c(stub_idx, othr_idx))
  }

  if ("row_group" %in% colwidth_df_visible[["type"]]) {
    row_group_idx <- which(colwidth_df_visible$type == "row_group")
    othr_idx <- base::setdiff(seq_len(nrow(colwidth_df_visible)), row_group_idx)
    colwidth_df_visible <- vctrs::vec_slice(colwidth_df_visible, c(row_group_idx, othr_idx))
  }

  # Determine if there are any footnotes or source notes; if any,
  # add a `\setlength` command that will pull up the minipage environment
  # for the footnotes block
  if (
    nrow(dt_footnotes_get(data = data)) > 0 ||
    length(dt_source_notes_get(data = data)) > 0
  ) {
    longtable_post_length <- "\\setlength{\\LTpost}{0mm}\n"
  } else {
    longtable_post_length <- ""
  }

  # Generate the column definitions for visible columns
  # these can either be simple `l`, `c`, `r` directive if a width isn't set
  # for a column, or, use `p{<width>}` statements with leading `>{...}`
  # specifiers that should have one of the following:
  # - `>{\raggedright\arraybackslash}` <- left alignment
  # - `>{\raggedleft\arraybackslash}` <- right alignment
  # - `>{\centering\arraybackslash}` <- center alignment
  # the `\arraybackslash` command is used to restore the behavior of the
  # `\\` command in the table (all of this uses the CTAN `array` package)

  if (any(colwidth_df_visible$unspec < 1L)) {

    col_defs <- NULL

    for (i in seq_len(nrow(colwidth_df_visible))) {

      if (colwidth_df_visible$unspec[i] == 1L) {
        col_defs_i <- substr(colwidth_df_visible$column_align[i], 1, 1)
      } else {

        align <-
          switch(
            colwidth_df_visible$column_align[i],
            left = ">{\\raggedright\\arraybackslash}",
            right = ">{\\raggedleft\\arraybackslash}",
            center = ">{\\centering\\arraybackslash}",
            ">{\\raggedright\\arraybackslash}"
          )

        col_defs_i <-
          paste0(
            align,
            "p{",
            create_singlecolumn_width_text_l(pt = colwidth_df_visible$pt[i], lw = colwidth_df_visible$lw[i]),
            "}"
          )

      }

      col_defs <- c(col_defs, col_defs_i)
    }

  } else {

    col_defs <- substr(colwidth_df_visible$column_align, 1, 1)
  }

  # # Add borders to the right of any columns in the stub
  if (length(stub_layout) > 0 & dt_options_get_value(data, "latex_stub_separate")) {

    # Count the actual number of stub columns
    # When we have both group_label and rowname, we have 2 columns
    # When we have multiple rowname columns but no group_label, count all stub columns
    if ("group_label" %in% stub_layout && "rowname" %in% stub_layout) {
      n_stub_cols <- 2  # group_label + one rowname column
    } else if ("rowname" %in% stub_layout) {
      n_stub_cols <- sum(colwidth_df_visible$type == "stub")
    } else if ("group_label" %in% stub_layout) {
      n_stub_cols <- 1
    } else {
      n_stub_cols <- length(stub_layout)
    }

    col_defs[seq_len(n_stub_cols)] <-
      paste0(col_defs[seq_len(n_stub_cols)], "|")
  }

  # If a table width is specified, add an extra column
  # space to fill in enough space to match the width
  extra_sep <- ""
  if (dt_options_get_value(data = data, option = "table_width") != "auto")
    extra_sep <- "@{\\extracolsep{\\fill}}"

  # determine string for table width if using tabular* environment
  hdr_tabular <- ""
  if(!dt_options_get_value(data = data, option = "latex_use_longtable")) {

    # we need to use the extracolsep here for tabular* regardless of width
    extra_sep <- "@{\\extracolsep{\\fill}}"
    table_width <- dt_options_get_value(data = data, "table_width")

    if (endsWith(table_width, "%")) {

      tw <- as.numeric(gsub("%", "", table_width, fixed = TRUE))
      hdr_tabular <- paste0("\\begin{tabular*}{", tw/100, "\\linewidth}{")

    } else if (endsWith(table_width, "px")) {

      width_in_pt <- 0.75 * convert_to_px(table_width)
      hdr_tabular <- paste0("\\begin{tabular*}{", width_in_pt, "pt}{")

    } else {

      hdr_tabular <- "\\begin{tabular*}{\\linewidth}{"

    }

  }

  # Generate setup statements for table including default left
  # alignments and vertical lines for any stub columns
  uses_longtable <- dt_options_get_value(data = data, option = "latex_use_longtable")

  paste0(
    ifelse(uses_longtable,
           longtable_post_length,
           ""),
    ifelse(uses_longtable,
           "\\begin{longtable}{",
           hdr_tabular),
    extra_sep,
    paste(col_defs, collapse = ""),
    "}\n",
    collapse = ""
  )
}

#' Create the caption component of a table
#'
#' The table caption component contains the caption; if
#' there are no caption components defined this function will return an empty
#' string.
#'
#' @noRd
create_caption_component_l <- function(data) {

  # Create the table caption if available
  table_caption <- dt_options_get_value(data = data, option = "table_caption")

  if (!all(is.na(table_caption))) {

    table_caption <- process_text(table_caption, context = "latex")

    if (isTRUE(getOption("knitr.in.progress"))) {

      table_caption <- kable_caption(label = NULL, table_caption, "latex")
      ifelse(check_quarto(),
             "",
             paste0("\\caption",
                    latex_group(table_caption),
                    ifelse(dt_options_get_value(data = data, option = "latex_use_longtable"),
                           " \\\\ \n",
                           " \n")
             )
      )
    } else {
      paste0("\\caption",
             latex_group(table_caption),
             ifelse(dt_options_get_value(data = data, option = "latex_use_longtable"),
                    " \\\\ \n",
                    " \n")
      )
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
create_heading_component_l <- function(data) {

  # If there is no title or heading component, then return an empty string
  if (!dt_heading_has_title(data = data)) {
    return("")
  }

  heading <- dt_heading_get(data = data)
  footnotes_tbl <- dt_footnotes_get(data = data)
  subtitle_defined <- dt_heading_has_subtitle(data = data)

  # Get the footnote marks for the title
  if ("title" %in% footnotes_tbl$locname) {

    footnote_title_marks <-
      coalesce_marks(
        fn_tbl = footnotes_tbl,
        locname = "title"
      )

    footnote_title_marks <-
      footnote_mark_to_latex(
        data = data,
        mark = footnote_title_marks
      )

  } else {
    footnote_title_marks <- ""
  }

  # Get the footnote marks for the subtitle
  if (subtitle_defined && "subtitle" %in% footnotes_tbl$locname) {

    footnote_subtitle_marks <-
      coalesce_marks(
        fn_tbl = footnotes_tbl,
        locname = "subtitle"
      )

    footnote_subtitle_marks <-
      footnote_mark_to_latex(
        data = data,
        mark = footnote_subtitle_marks
      )

  } else {
    footnote_subtitle_marks <- ""
  }

  title_font_size <- dt_options_get_value(data, "heading_title_font_size")
  table_font_size <- dt_options_get_value(data, "table_font_size")

  if(identical(title_font_size,"default")){
    title_font_size <- table_font_size
  }

  title_row <- latex_group(
    convert_font_size_l(title_font_size),
    " ",
    heading$title,
    footnote_title_marks,
    convert_font_size_l(table_font_size)
    )

  if (subtitle_defined) {

    subtitle_font_size <- dt_options_get_value(data, "heading_subtitle_font_size")

    if(identical(subtitle_font_size,"default")){
      subtitle_font_size <- table_font_size
    }

    subtitle_row <-
      paste0(
        " \\\\ \n",
        latex_group(
          convert_font_size_l(subtitle_font_size),
          " ",
          heading$subtitle,
          footnote_subtitle_marks,
          convert_font_size_l(table_font_size))
      )

  } else {
    subtitle_row <- ""
  }

  paste0(
    paste_between(
      paste0(title_row, subtitle_row),
      x_2 = c("\\caption*{\n", "\n}")
    ),
    ifelse(dt_options_get_value(data = data, option = "latex_use_longtable"),
           " \\\\ \n",
           " \n")
  )
}

#' Create the columns component of a table
#'
#' @noRd
create_columns_component_l <- function(data, colwidth_df) {


  # Get vector representation of stub layout
  stub_layout <- get_stub_layout(data = data)
  n_stub_cols <- 0

  # if exists, get the length of the stub
  if(length(stub_layout)>0){
    stub_vars <- dt_boxhead_get_var_stub(data = data)
    # Get the actual number of stub columns for the header
    # This determines how many columns the stub header should span
    if ("group_label" %in% stub_layout && "rowname" %in% stub_layout) {
      n_stub_cols <- length(stub_vars) + 1  # group_label + all rowname columns
      # Get stub_df for width calculations
      stub_df <- dplyr::filter(colwidth_df, type %in% c("row_group","stub")) %>%
        dplyr::arrange(type)
    } else if ("rowname" %in% stub_layout) {
      stub_df <- dplyr::filter(colwidth_df, type == "stub")
      n_stub_cols <- nrow(stub_df)
    } else if ("group_label" %in% stub_layout) { # stub columns can exist in the dataset with only groups in the stub-layout.
      n_stub_cols <- 1
      stub_df <- dplyr::filter(colwidth_df, type == "row_group")
    } else {
      n_stub_cols <- length(stub_layout)
      stub_df <- dplyr::filter(colwidth_df, type %in% c("stub", "row_group"))
    }
  }

  styles_tbl <- dt_styles_get(data = data)

  # Determine the finalized number of spanner rows
  spanner_row_count <-
    dt_spanners_matrix_height(
      data = data,
      omit_columns_row = TRUE
    )
  # Get the column headings
  headings_vars <- dt_boxhead_get_vars_default(data = data)
  headings_labels <- dt_boxhead_get_vars_labels_default(data = data)

  for (i in seq_along(headings_labels)) {

    styles_heading_i <-
      consolidate_cell_styles_l(
        dplyr::filter(
          styles_tbl,
          locname == "columns_columns",
          colname == headings_vars[i]
        )
      )

    colwidth_heading_i <- dplyr::filter(
      colwidth_df,
      var == headings_vars[i]
    )

    if(sum(colwidth_heading_i$unspec > 0)){
      width <- ""
    }else{
      width <- create_singlecolumn_width_text_l(pt = colwidth_heading_i$pt, lw = colwidth_heading_i$lw)
    }

    headings_labels[i] <- apply_cell_styles_l(
      headings_labels[i],
      styles_heading_i,
      width = width
      )

  }

  # If there is a stub then modify the `headings_vars` and `headings_labels`
  if (length(stub_layout) > 0) {

    stubh <- dt_stubhead_get(data = data)

    styles_stubhead <-
      consolidate_cell_styles_l(
        vctrs::vec_slice(styles_tbl, styles_tbl$locname == "stubhead")
      )

    # Get the actual number of stub columns for the header
    # This determines how many columns the stub header should span
    if ("group_label" %in% stub_layout && "rowname" %in% stub_layout) {
      n_stub_cols <- 2  # group_label + rowname
      # Get stub_df for width calculations
      stub_df <- dplyr::filter(colwidth_df, type %in% c("stub", "row_group"))
    } else if ("rowname" %in% stub_layout) {
      stub_df <- dplyr::filter(colwidth_df, type == "stub")
      n_stub_cols <- nrow(stub_df)
    } else if ("group_label" %in% stub_layout) {
      n_stub_cols <- 1
      stub_df <- dplyr::filter(colwidth_df, type == "row_group")
    } else {
      n_stub_cols <- length(stub_layout)
      stub_df <- dplyr::filter(colwidth_df, type %in% c("stub", "row_group"))
    }

    # Check if we have multiple stubhead labels for multi-column stub
    stub_vars <- dt_boxhead_get_var_stub(data = data)
    has_multi_column_stub <- length(stub_vars) > 1 && !any(is.na(stub_vars))
    has_multiple_labels <- has_multi_column_stub && length(stubh$label) > 1

    if (has_multiple_labels) {
      # Create individual headers for each stub column
      # Process in reverse order since prepend_vec adds to the front

      if (any(stub_df$unspec == 1L)) {
        width_txt <- "c"
      } else {
        width_txt <-
          sprintf(
            ">{\\centering\\arraybackslash}m{%s}",
            create_singlecolumn_width_text_l(
              pt = sum(stub_df$pt),
              lw = sum(stub_df$lw)
            )
          )
      }

      for (i in rev(seq_along(stubh$label))) {
        stub_label <- ifelse(
          length(stubh$label[i]) > 0 && stubh$label[i] != "",
          apply_cell_styles_l(
            stubh$label[i],
            styles_stubhead,
            width = width_txt[i]
            ),
          ""
        )
        headings_vars <- prepend_vec(headings_vars, sprintf("::stub%d", i))
        headings_labels <- prepend_vec(headings_labels, stub_label)
      }
    } else {
      # Single label spanning all stub columns (current behavior)
      headings_vars <- prepend_vec(headings_vars, "::stub")

      if (any(stub_df$unspec == 1L)) {
        width_txt <- "c"
      } else {
        width_txt <-
          sprintf(
            ">{\\centering\\arraybackslash}m{%s}",
            create_singlecolumn_width_text_l(
              pt = sum(stub_df$pt),
              lw = sum(stub_df$lw)
            )
          )
      }

      stub_label <- ifelse(
        length(stubh$label) > 0,
        apply_cell_styles_l(
          stubh$label[1],
          styles_stubhead,
          width = width_txt[1]
          ),
        ""
      )

      if (n_stub_cols > 1L) {
        # Use multicolumn to span all stub columns
        if (any(stub_df$unspec == 1L)) {
          width_txt <- "c"
        } else {
          width_txt <-
            sprintf(
              ">{\\centering\\arraybackslash}m{%s}",
              create_singlecolumn_width_text_l(
                pt = sum(stub_df$pt),
                lw = sum(stub_df$lw)
              )
            )
        }

        stub_label <-
          latex_multicolumn_cell(
            stub_label,
            alignment = width_txt,
            ncols = n_stub_cols,
            override_alignment = FALSE
          )
      }

      headings_labels <- prepend_vec(headings_labels, stub_label)

    }
  }

  header_repeat <- dt_options_get_value(data, "latex_header_repeat")

  table_col_headings <-
    paste0(latex_heading_row(content = headings_labels, header_repeat = header_repeat), collapse = "")

  if (spanner_row_count > 0) {

    table_col_spanners <- c()

    spanners <-
      dt_spanners_print_matrix(
        data = data,
        include_hidden = FALSE,
        omit_columns_row = TRUE
      )

    spanner_ids <-
      dt_spanners_print_matrix(
        data = data,
        include_hidden = FALSE,
        ids = TRUE,
        omit_columns_row = TRUE
      )

    if (length(stub_layout) > 0) {
      # Get the actual number of stub columns for spanners
      if ("group_label" %in% stub_layout && "rowname" %in% stub_layout) {

        # group_label + rowname
        n_stub_cols <- 2

      } else if ("rowname" %in% stub_layout) {

        stub_df_cols <- dplyr::filter(colwidth_df, type == "stub")
        n_stub_cols <- nrow(stub_df_cols)

      } else if ("group_label" %in% stub_layout) {

        n_stub_cols <- 1

      } else {

        n_stub_cols <- length(stub_layout)
      }

      stub_matrix <- matrix(nrow = nrow(spanners), ncol = n_stub_cols)
      # retain stub names
      colnames(stub_matrix) <- stub_df$var

      spanners <- cbind(stub_matrix, spanners)
      spanner_ids <- cbind(stub_matrix, spanner_ids)
    }

    for (i in seq_len(nrow(spanners))) {

      spanners_i <- spanners[i, ]
      spanner_ids_i <- spanner_ids[i, ]

      spanners_rle <- unclass(rle(spanner_ids_i))

      # We need a parallel vector of spanner labels and this could
      # be part of the `spanners_rle` list
      spanners_rle$labels <- spanners_i[cumsum(spanners_rle$lengths)]
      col_order  <- data.frame(var = colnames(spanner_ids))

      is_spanner_na <- is.na(spanners_rle$values)
      is_spanner_single <- spanners_rle$lengths == 1
      firsts <- utils::head(cumsum(c(1L, spanners_rle$lengths)), -1L)
      lasts <- cumsum(spanners_rle$lengths)
      begins <- (cumsum(utils::head(c(0, spanners_rle$lengths), -1)) + 1)[!is.na(spanners_rle$values)]
      ends <- cumsum(spanners_rle$lengths)[!is.na(spanners_rle$values)]
      cmidrule <- paste0("\\cmidrule(lr){", begins, "-", ends, "}")

      span_widths <- calculate_multicolumn_width_text_l(begins = firsts, ends = lasts, col_order = col_order ,colwidth_df = colwidth_df)
      tex_widths <-
        ifelse(
          nzchar(span_widths),
          paste0(">{\\centering\\arraybackslash}m{", span_widths, "}"),
          "c"
        )
      spanners_rle <- apply_spanner_styles_l(spanners_rle, styles_tbl, widths = span_widths)


      multicol <- sapply(seq_along(spanners_rle$values),function(spanner_idx){


        if(is.na(spanners_rle$values[[spanner_idx]])){
          ""
        }else{

          span_label <- spanners_rle$labels[[spanner_idx]]
          span_length <- spanners_rle$lengths[[spanner_idx]]

          if(grepl("\\shortstack",span_label, fixed = TRUE)){
            if( tex_widths[[spanner_idx]] == "c"){
              span_label <- shortstack_alignment(span_label, alignment = "center")
            }
          }

          latex_multicolumn_cell(
            x = span_label,
            alignment = tex_widths[[spanner_idx]],
            ncols = span_length,
            override_ncols = TRUE,
            override_alignment = FALSE
          )
        }
      })


      # If there is a stub we need to tweak the spanners row with a blank multicolumn
      # statement that's the same width as that in the columns row; this is to
      # prevent the automatic vertical line that would otherwise appear here

      # Get the actual number of stub columns
      if ("group_label" %in% stub_layout && "rowname" %in% stub_layout) {

        # group_label + rowname
        n_stub_cols <- 2

      } else if ("rowname" %in% stub_layout) {

        stub_df_cols <- dplyr::filter(colwidth_df, type == "stub")
        n_stub_cols <- nrow(stub_df_cols)

      } else if ("group_label" %in% stub_layout) {

        n_stub_cols <- 1

      } else {

        n_stub_cols <- length(stub_layout)
      }

      if (n_stub_cols > 1L) {

        tex_stub_width <- calculate_multicolumn_width_text_l(begins = 1, ends = n_stub_cols,  col_order = col_order, colwidth_df = colwidth_df)
        if (tex_stub_width == "") {
          mc_stub <- "l"
        } else {
          mc_stub <- sprintf(">{\\raggedright\\arraybackslash}m{%s}", tex_stub_width)
        }

        multicol <-
          c(
            sprintf("\\multicolumn{%d}{%s}{}", n_stub_cols, mc_stub),
            multicol[-seq_len(n_stub_cols)]
          )
      }

      multicol <- paste0(paste(multicol, collapse = " & "), " \\\\ \n")
      cmidrule <- paste0(paste(cmidrule, collapse = " "), "\n")

      col_spanners_i <- paste0(multicol, cmidrule, collapse = "")

      table_col_spanners <- c(table_col_spanners, col_spanners_i)
    }

  } else {
    table_col_spanners <- ""
  }

  include_toprule <- dt_options_get_value(data, "latex_toprule")

  paste0(
    if (include_toprule) {"\\toprule\n"},
    paste0(table_col_spanners, collapse = ""),
    table_col_headings
  )
}

#' @noRd
create_body_component_l <- function(data, colwidth_df) {

  summaries_present <- dt_summary_exists(data = data)
  list_of_summaries <- dt_summary_df_get(data = data)
  groups_rows_df <- dt_groups_rows_get(data = data)
  stub_df <- dt_stub_df_get(data = data)

  # Get vector representation of stub layout
  stub_layout <- get_stub_layout(data = data)

  # Determine if there is a stub column in `stub_layout` and whether we
  # have a two-column stub (with the group label on the left side)
  has_stub_column <- "rowname" %in% stub_layout
  has_two_col_stub <- "group_label" %in% stub_layout

  n_cols <- get_effective_number_of_columns(data = data)

  # Get a matrix of body cells to render, split into a list of
  # character vectors by row, and create a vector of LaTeX body rows
  cell_matrix <- get_body_component_cell_matrix(data = data)

  row_splits_body <- split_row_content(cell_matrix)

  # Get the number of rows in the body
  n_rows <- nrow(cell_matrix)

  # Apply hierarchical stub merging for multiple stub columns
  # (hide repeated values in all columns except the rightmost)
  if (has_stub_column) {
    stub_vars <- dt_boxhead_get_var_stub(data = data)

    if (length(stub_vars) > 1 && !any(is.na(stub_vars))) {

      # Get original body data to check for consecutive repeating values
      original_body <- dt_data_get(data = data)

      # Process all stub columns except the rightmost one
      hierarchy_vars <- stub_vars[-length(stub_vars)]
      stub_matrix <- as.matrix(original_body[, hierarchy_vars, drop = FALSE])

      # Determine which columns to hide based on hierarchical grouping
      for (col_idx in seq_along(hierarchy_vars)) {

        # Position in cell_matrix (accounting for group_label column if present)
        matrix_col_idx <- col_idx
        if ("group_label" %in% stub_layout) {
          matrix_col_idx <- col_idx + 1
        }

        for (row_idx in 2:n_rows) {
          should_hide <- TRUE

          # Check if current value matches previous value (handle NAs properly)
          curr_val <- stub_matrix[row_idx, col_idx]
          prev_val <- stub_matrix[row_idx - 1, col_idx]

          if (!identical(curr_val, prev_val)) {
            should_hide <- FALSE
          }

          # Also check that all columns to the left match
          if (should_hide && col_idx > 1) {
            for (left_col_idx in 1:(col_idx - 1)) {
              curr_left <- stub_matrix[row_idx, left_col_idx]
              prev_left <- stub_matrix[row_idx - 1, left_col_idx]
              if (!identical(curr_left, prev_left)) {
                should_hide <- FALSE
                break
              }
            }
          }

          # Hide the value by making it empty if conditions are met
          if (should_hide) {
            row_splits_body[[row_idx]][matrix_col_idx] <- ""
          }
        }
      }
    }
  }

  if ("group_label" %in% stub_layout) {

    for (i in seq_len(nrow(groups_rows_df))) {
      n_rows_in_group <- groups_rows_df$row_end[i] - groups_rows_df$row_start[i] + 1L
      if (groups_rows_df$has_summary_rows[i]) {
        n_rows_in_group <- n_rows_in_group + dim(list_of_summaries$summary_df_data_list[[i]])[1L]
      }
      row_splits_body[[groups_rows_df$row_start[i]]][1] <-
        sprintf("\\multirow[t]{%d}{%s}{%s}",
                n_rows_in_group,
                if (colwidth_df$unspec[1L] == 1L) "*" else "=",
                groups_rows_df$group_label[i])
        #groups_rows_df$group_label[i]
    }
  }

  # Insert indentation where necessary
  if (has_stub_column && !all(is.na(stub_df$indent))) {

    stub_indent_length <-
      dt_options_get_value(
        data = data,
        option = "stub_indent_length"
      )

    indent_length_px <- as.integer(gsub("px", "", stub_indent_length))
    indent_length_pt <- indent_length_px * 0.75

    row_label_col <- which(stub_layout == "rowname")

    lapply(
      seq_len(n_rows),
      FUN = function(x) {

        indent <- as.integer(stub_df[x, ][["indent"]])

        if (!is.na(indent)) {
          row_splits_body[[x]][row_label_col] <<-
            paste0(
              "\\hspace*{", indent_length_pt * indent, "pt} ",
              row_splits_body[[x]][row_label_col]
            )
        }
      }
    )
  }

  body_rows <-
    create_body_rows_l(
      data = data,
      row_splits_body = row_splits_body,
      colwidth_df = colwidth_df
    )

  # Apply formatting to group labels
  if (dim(groups_rows_df)[1L] > 0 && !all(is.na(groups_rows_df$group_label))) {

    styles_tbl <- dt_styles_get(data)
    width <- calculate_multicolumn_width_text_l(1, n_cols, col_order = data.frame(var = dt_boxhead_get_vars(data)), colwidth_df = colwidth_df)
    if(identical(width,"")){
      width <- ""
    }

    for (i in seq_along(groups_rows_df$group_label)) {

      if (!is.na(groups_rows_df$group_label[i])) {

        styles_groups <-
          consolidate_cell_styles_l(
            vctrs::vec_slice(
              styles_tbl,
              styles_tbl$locname == "row_groups" &
                styles_tbl$grpname == groups_rows_df$group_id[i]
            )
          )

        groups_rows_df$group_label[i] <- apply_cell_styles_l(groups_rows_df$group_label[i], styles_groups, width = width)
      }
    }

  }

  # # Replace an NA group with a small amount of vertical space
  # if (any(is.na(groups_rows_df$group_label))) {
  #
  #   groups_rows_df <-
  #     dplyr::mutate(
  #       groups_rows_df,
  #       group_label = ifelse(
  #         is.na(group_label), "\\vspace*{-5mm}", group_label
  #       )
  #     )
  # }

  current_group_id <- character(0L)

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

        # Insert a horizontal line if this is the beginning of a new row
        # group and there is a two-column stub
        if (group_start && has_two_col_stub && i != 1) {
          body_section <-
            append(body_section, "\\midrule\\addlinespace[2.5pt]\n")
        }

        #
        # Create a group heading row
        #

        if (group_heading_row_at_i) {

          group_heading_row <-
            latex_group_row(
              group_name = group_label,
              n_cols = n_cols,
              top_border = i != 1,
              bottom_border = TRUE,
              colwidth_df = colwidth_df
            )

          body_section <- append(body_section, list(group_heading_row))
        }

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
            summary_rows_for_group_l(
              data = data,
              group_id = group_id,
              side_group_summary = group_summary_row_side
            )

        } else {
          summary_section <- NULL
        }

        body_row <- body_rows[i]

        if (!is.null(summary_section) && group_summary_row_side == "top") {

          if (!has_two_col_stub) {
            summary_section <- paste0(summary_section, summary_h_border)
          }

          body_section <- append(body_section, summary_section)
        }

        body_section <- append(body_section, list(body_row))

        if (!is.null(summary_section) && group_summary_row_side == "bottom") {

          if (!(has_stub_column && has_two_col_stub)) {
            summary_section <- paste0(summary_h_border, summary_section)
          }

          body_section <- append(body_section, summary_section)
        }

        # In a very particular case, we need to hoist the group label to the
        # first row of summary labels (at the top of a row group where there
        # is a two-column stub)
        if (
          has_stub_column &&
          has_two_col_stub &&
          group_row_start == i &&
          !is.null(summary_section) &&
          group_summary_row_side == "top" &&
          length(body_section) > 1
        ) {

          body_row_idx <- length(body_section)
          summary_idx <- body_row_idx - 1

          group_name_fragment <- gsub("(^.*? & ).*", "\\1", body_section[[body_row_idx]])
          body_section[[summary_idx]] <- sub("^.*? & ", "", body_section[[summary_idx]])
          body_section[[summary_idx]] <- paste0(group_name_fragment, body_section[[summary_idx]])
          body_section[[body_row_idx]] <- sub("^.*? & ", " & ", body_section[[body_row_idx]])
        }

        body_section
      }
    )

  body_rows <- unlist(body_rows)

  #
  # Add grand summary rows
  #

  if (
    summaries_present &&
    grand_summary_col %in% names(list_of_summaries$summary_df_display_list)
  ) {

    side <- summary_row_side(data = data, group_id = grand_summary_col)

    grand_summary_section <-
      summary_rows_for_group_l(
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

  paste(body_rows, collapse = "")
}

summary_rows_for_group_l <- function(
    data,
    group_id,
    side_group_summary = "bottom",
    side_grand_summary = "bottom"
) {

  # Check that `group_id` isn't NULL and that length is exactly 1
  if (is.null(group_id) || length(group_id) != 1) {
    cli::cli_abort("`group_id` cannot be `NULL` and must be of length 1.")
  }

  list_of_summaries <- dt_summary_df_get(data = data)

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

  for (col_name in names(summary_df)) {

    loc_type <- if(summary_row_type == "grand") "grand_summary_cells" else "summary_cells"

    styles_df <- dt_styles_get(data)
    styles_df <- styles_df[styles_df$locname == loc_type & styles_df$grpname == group_id, , drop = FALSE]
    # set colname to ::rowname:: if colname is present and colnum = 0
    styles_df$colname[is.na(styles_df$colname) & styles_df$colnum == 0] <- rowname_col_private

    styles_summary <- styles_df[styles_df$colname == col_name, , drop = FALSE]

    if (dim(styles_summary)[1L] > 0L) {

      for (row_num in sort(unique(styles_summary$rownum))) {
        # The value of colnum in styles_summary differs for
        # group and grand summaries
        if (summary_row_type == "group") {
          row_pos <- (row_num - floor(row_num)) * 100L
        } else {
          row_pos <- row_num
        }

        # style each row
        row_style <- styles_summary[styles_summary$rownum == row_num, , drop = FALSE]
        row_style <- consolidate_cell_styles_l(row_style)

        summary_df[[col_name]][row_pos] <- apply_cell_styles_l(summary_df[[col_name]][row_pos], row_style)
      }

    }

  }

  row_splits_summary <- split_row_content(summary_df)

  ##? TODO: GET COLUMN WIDTH TO ADD TO ALIGNMENT

  if (stub_is_2) {

    rowsplit_alignment <- "l"

    if(dt_options_get_value(data, "latex_stub_separate")){
      rowsplit_alignment <- paste0(rowsplit_alignment,"|")
    }

    row_splits_summary <-
      lapply(
        row_splits_summary,
        function(x) {
          x <- c("", x)
          x[1] <- latex_multicolumn_cell(
            x = x[1],
            alignment = rowsplit_alignment,
            ncols = 1,
            override_ncols = TRUE,
            override_alignment = FALSE
          )
          x[2] <- latex_multicolumn_cell(
            x = x[2],
            alignment = rowsplit_alignment,
            ncols = 1,
            override_ncols = TRUE,
            override_alignment = FALSE
          )
          x
        }
      )
  }

  summary_rows <-
    paste0(
      vapply(
        row_splits_summary,
        FUN.VALUE = character(1L),
        latex_body_row,
        type = "row"
      ),
      collapse = ""
    )

  if (summary_row_type != "grand") {

    summary_rows <-
      paste0(
        if (side_group_summary == "top") summary_rows,
        if ("group_label" %in% stub_layout && stub_is_2) {
          paste0(
            "\\cmidrule(l{-0.05em}r){2-",
            ncol(summary_df) + 1,
            "}\n"
          )
        },
        if (side_group_summary == "bottom") summary_rows
      )
  }

  if (summary_row_type == "grand") {

    if (side_grand_summary == "top") {
      summary_rows <- paste0(summary_rows, grand_summary_h_border)
    } else {
      summary_rows <- paste0(grand_summary_h_border, summary_rows)
    }
  }

  summary_rows
}

#' @noRd
create_table_end_l <- function(data) {

  include_bottomrule <- dt_options_get_value(data, "latex_bottomrule")


  paste0(
    if(include_bottomrule){"\\bottomrule\n"},
    ifelse(dt_options_get_value(data = data, option = "latex_use_longtable"),
           "\\end{longtable}\n",
           "\\end{tabular*}\n"),
    collapse = ""
  )
}

#' @noRd
create_wrap_end_l <- function(data) {
  ifelse(dt_options_get_value(data = data, option = "latex_use_longtable"),
         "\\endgroup\n",
         "\\end{table}\n")
}

#' @noRd
create_footer_component_l <- function(data) {

  footnotes_tbl <- dt_footnotes_get(data = data)
  source_notes_vec <- dt_source_notes_get(data = data)

  # If there are no footnotes or source notes, return an empty string
  if (nrow(footnotes_tbl) == 0 && length(source_notes_vec) == 0) {
    return("")
  }

  # Get the multiline and separator options for footnotes and source notes
  footnotes_multiline <- dt_options_get_value(data = data, option = "footnotes_multiline")
  footnotes_sep <- dt_options_get_value(data = data, option = "footnotes_sep")
  source_notes_multiline <- dt_options_get_value(data = data, option = "source_notes_multiline")
  source_notes_sep <- dt_options_get_value(data = data, option = "source_notes_sep")

  styles_footnote <-
    consolidate_cell_styles_l(
      dplyr::filter(dt_styles_get(data), locname == "footnotes")
    )


  # Create a formatted footnotes string
  if (nrow(footnotes_tbl) > 0) {

    footnotes_tbl <- dplyr::distinct(footnotes_tbl, fs_id, footnotes)

    footnote_marks <- footnote_mark_to_latex(
      data = data,
      mark = footnotes_tbl[["fs_id"]],
      location = "ftr"
    )

    # Create a vector of formatted footnotes
    footnotes <-
      vapply(
        seq_along(footnotes_tbl[["footnotes"]]),
        FUN.VALUE = character(1L),
        #FUN = process_text,
        FUN = function(idx,
                       footnotes,
                       footnote_marks,
                       context,
                       styles_obj) {

          footmark <- footnote_marks[[idx]]
          footnote_latex <- process_text(footnotes[[idx]], context = context)

          # if in a shortstack, footmark should be within the shortstack
          if(grepl("\\\\shortstack", footnote_latex)){

            ## remove linewidth parbox within a shortstack for footnotes, already within a parbox
            footnote_latex <- gsub("(?<=\\\\shortstack\\[.\\]\\{)\\\\parbox\\{.+?\\}\\{(.+?)\\}","\\1",footnote_latex, perl = TRUE)

            ## add footmark within shortstack
            if(nzchar(footmark)){
              footnote_latex <- gsub("(\\\\shortstack\\[.\\]\\{)(.+?\\})",paste0("\\1",gsub("\\","\\\\",footmark, fixed=TRUE),"\\2"), footnote_latex, perl = TRUE)
            }

          }else{
            ## add footmark
            footnote_latex <- paste0(footmark, footnote_latex)
          }

          apply_cell_styles_l(
            footnote_latex,
            styles_obj,
            type = "footnote"
            )
        },
        footnotes = footnotes_tbl[["footnotes"]],
        footnote_marks = footnote_marks,
        context = "latex",
        styles_obj = styles_footnote
      )

    if (footnotes_multiline) {
      footnotes <- paste_right(paste(footnotes, collapse = "\\\\\n"), "\\\\\n")
    } else {
      footnotes <- paste_right(paste(footnotes, collapse = footnotes_sep), "\\\\\n")
    }

  } else {
    footnotes <- ""
  }

  # Create a formatted source notes string
  if (length(source_notes_vec) > 0L) {

    if (source_notes_multiline) {
      source_notes <- paste_right(paste(source_notes_vec, collapse = "\\\\\n"), "\\\\\n")
    } else {
      source_notes <- paste_right(paste(source_notes_vec, collapse = source_notes_sep), "\\\\\n")
    }

    styles_source <-
      consolidate_cell_styles_l(
        dplyr::filter(dt_styles_get(data), locname == "source_notes")
      )

    source_notes <- apply_cell_styles_l(source_notes, styles_source, type = "footnote")

  } else {
    source_notes <- ""
  }

  # Create the footer block
  paste0(
    "\\begin{minipage}{\\linewidth}\n\\vspace{.05em}\n",
    paste0(footnotes, source_notes),
    "\\end{minipage}\n",
    collapse = ""
  )
}

# Function to build a vector of `body` rows
create_body_rows_l <- function(
    data,
    row_splits_body,
    colwidth_df
) {

  styles_tbl <- dt_styles_get(data = data)
  styles_tbl <- vctrs::vec_slice(styles_tbl, styles_tbl$locname %in% c("stub", "data", "row_groups"))

  # Obtain all of the visible (`"default"`), non-stub column names
  # for the table from the `boxh` object
  default_vars <- dt_boxhead_get_vars_default(data = data)


  stub_layout <- get_stub_layout(data = data)

  stub_is_2 <- length(stub_layout) > 1L

  # Get the actual stub column variables to determine how many stub columns we have
  stub_vars <- dt_boxhead_get_var_stub(data = data)
  n_stub_cols <- if (length(stub_vars) == 1 && is.na(stub_vars)) 0 else length(stub_vars)

  if (is.null(stub_layout)) {
    vars <- default_vars
  } else if (!is.null(stub_layout) && !stub_is_2 && stub_layout == "rowname") {
    # Create a ::stub:: placeholder for each stub column
    vars <- c(rep("::stub::", n_stub_cols), default_vars)
  } else if (!is.null(stub_layout) && !stub_is_2 && stub_layout == "group_label") {
    vars <- c("::group::", default_vars)
  } else if (!is.null(stub_layout) && stub_is_2) {
    # When we have both group_label and rowname columns
    # Create a ::stub:: placeholder for each stub column, plus the group column
    vars <- c("::group::", rep("::stub::", n_stub_cols), default_vars)
  }

  if ("::group::" %in% vars) {
    styles_tbl$rownum <- round(styles_tbl$rownum)
  }

  body_rows <-
    unname(
      unlist(
        lapply(
          seq_along(row_splits_body),
          FUN = function(x) {

            content <- row_splits_body[[x]]
            content_length <- length(content)

            styles_tbl_i <- vctrs::vec_slice(styles_tbl, styles_tbl$rownum == x)

            ## no styling, no column widths set
            if (nrow(styles_tbl_i) < 1L & nrow(colwidth_df) == sum(colwidth_df$unspec > 0)) {

              ## if styling set, remove the parbox if it is set to line width
              content <- gsub("\\\\parbox\\{\\\\linewidth\\}\\{(.+?)\\}","\\1",content)

              # Remove any latex footnote encoding
              content <- remove_footnote_encoding(content)
              return(paste(paste(content, collapse = " & "), "\\\\ \n"))
            }

            for (i in seq_len(content_length)) {

              colname_i <- vars[i]

              content_i <- content[i]

              if (
                !is.na(colname_i) &&
                colname_i == "::group::" &&
                "row_groups" %in% styles_tbl_i[["locname"]]
              ) {

                styles_tbl_i_col <- vctrs::vec_slice(styles_tbl_i, styles_tbl_i$locname == "row_groups")
                #styles_i_col <- styles_tbl_i_col[["styles"]]

              } else if (
                !is.na(colname_i) &&
                colname_i == "::stub::" &&
                "stub" %in% styles_tbl_i[["locname"]]
              ) {

                styles_tbl_i_col <- vctrs::vec_slice(styles_tbl_i, styles_tbl_i$locname == "stub")
                #styles_i_col <- styles_tbl_i_col[["styles"]]

              } else if (
                "data" %in% styles_tbl_i[["locname"]] &&
                !is.na(colname_i) &&
                colname_i %in% styles_tbl_i[["colname"]]
              ) {

                styles_tbl_i_col <- vctrs::vec_slice(styles_tbl_i, styles_tbl_i$colname == colname_i)
                #styles_i_col <- styles_tbl_i_col[["styles"]]

              } else {
                styles_tbl_i_col <- NULL
              }

              if (!is.null(styles_tbl_i_col)) {

                styles_body <- consolidate_cell_styles_l(styles_tbl_i_col)

                if(identical(colname_i,"::stub::")){
                  colwidth_i <- dplyr::filter(
                    colwidth_df,
                    type == "stub",
                  )[i, ]

                }else{
                  colwidth_i <- dplyr::filter(
                    colwidth_df,
                    var == colname_i
                    )
                }

                if(sum(colwidth_i$unspec < 1) > 0){
                  cell_width <- create_singlecolumn_width_text_l(pt = colwidth_i$pt, lw = colwidth_i$lw)
                }else{
                  cell_width <- ""
                }

                content[i] <- apply_cell_styles_l(
                  content_i,
                  styles_body,
                  width = cell_width
                  ) |>
                  remove_footnote_encoding()

              } else {

                if(identical(colname_i,"::stub::")){
                  colwidth_i <- dplyr::filter(
                    colwidth_df,
                    type == "stub",
                  )[i, ]

                }else{
                  colwidth_i <- dplyr::filter(
                    colwidth_df,
                    var == colname_i
                  )
                }

                if(isFALSE(sum(colwidth_i$unspec < 1) > 0)){
                  content_i <- gsub("\\\\parbox\\{\\\\linewidth\\}\\{(.+?)\\}","\\1",content_i)
                }

                ## if styling set, remove the parbox if it is set to line width

                content[i] <- remove_footnote_encoding(content_i)

              }

            }

            paste(paste(content, collapse = " & "), "\\\\ \n")
          }
        )
      )
    )

  body_rows
}

# Function removes footnote encoding introduced by paste_footnote_latex for
# cells not modified by tab_style calls.
remove_footnote_encoding <- function(x) {

  ## if no footnotes, move along
  if((sum(grepl("%%%(right|left):",x)) == 0)){
    return(x)
  }

  ## if there are footnotes, loop through

  for( i in seq_along(x)){

    x_i <- x[i]

    if(grepl("\\\\(shortstack|parbox)",x_i)){

      if(grepl("%%%right:",x_i)){
        footmark_text <- regmatches(x_i, regexec("(?<=%%%right:).+$", x_i, perl = TRUE))[[1]]
        if(grepl("%%%left:", footmark_text)){
          footmark_text <- regmatches(footmark_text, regexec(".+?(?=%%%left:)", footmark_text, perl = TRUE))[[1]]
        }
        content_x <- regmatches(x_i, regexec(".+?(?=%%%right:)", x_i, perl = TRUE))[[1]]

        if(grepl("\\\\shortstack", content_x)){
          x_i <- gsub("(\\\\shortstack\\[.\\]\\{(\\\\parbox\\{.+?\\}\\{)*.+?)((\\}\\s*)+$)",paste0("\\1",gsub("\\","\\\\",footmark_text, fixed=TRUE)," \\3"), content_x, perl = TRUE)
        }else{
          x_i <- gsub("((\\\\parbox\\{.+?\\}\\{).+?)((\\}\\s*)+$)",paste0("\\1",gsub("\\","\\\\",footmark_text, fixed=TRUE)," \\3"), content_x, perl = TRUE)
        }
      } else if(grepl("%%%left:",x_i)){
        footmark_text <- regmatches(x_i, regexec("(?<=%%%left:).+?$", x_i, perl = TRUE))[[1]]
        content_x <- regmatches(x_i, regexec(".+?(?=%%%left:)", x_i, perl = TRUE))[[1]]
        ## add footmark within shortstack
        if(grepl("\\\\shortstack", content_x)){
          x_i <- gsub("(\\\\shortstack\\[.\\]\\{(\\\\parbox\\{.+?\\}\\{)*)(.+?\\})",paste0("\\1",gsub("\\","\\\\",footmark_text, fixed=TRUE)," \\3"), content_x, perl = TRUE)
        }else{
          x_i <- gsub("((\\\\parbox\\{.+?\\}\\{).+?)\\s(.+?((\\}\\s*)+$))",paste0("\\1",gsub("\\","\\\\",footmark_text, fixed=TRUE)," \\3"), content_x, perl = TRUE)
        }

      }

    }else{
      if(grepl("%%%right:",x_i)){
        x_i <- gsub("%%%(right):", "", x_i)
      }
      if(grepl("%%%left:", x_i)){

        footmark_text <- regmatches(x_i, regexec("(?<=%%%left:).+?$", x_i, perl = TRUE))[[1]]
        content_x <- regmatches(x_i, regexec(".+?(?=%%%left:)", x_i, perl = TRUE))[[1]]
        x_i <- paste0(footmark_text, content_x)
      }
    }

    x[[i]] <- x_i
  }
  x
}

# Function that converts gt font sizes to LaTeX equivalents
convert_font_size_l <- function(x) {

  size_map <- c(
    `xx-small` = "\\tiny ",
    `x-small` = "\\scriptsize ",
    small = "\\small ",
    medium = "\\normalsize ",
    large = "\\large ",
    `x-large` = "\\Large ",
    `xx-large` = "\\LARGE ",
    `xxx-large` = "\\huge ",
    `default` = ""
  )


  if (as.character(x) %in% names(size_map)){
    return(size_map[[x]])
  }else if(grepl("(pt|%|px|in|cm|emu|em)",x)){
    return(.apply_style_fontsize_l(list('cell_text' = list('size' = round(parse_font_size_l(x))))))
  }

  NULL
}

# Function to build a vector of `summary` rows in the table body
create_summary_rows_l <- function(
    data,
    groups_rows_df,
    n_rows
) {

  list_of_summaries <- dt_summary_df_get(data = data)

  if (length(list_of_summaries) < 1L) {
    return(rep_len("", n_rows))
  }

  # Get vector representation of stub layout
  stub_layout <- get_stub_layout(data = data)

  # Get the actual number of stub columns (including multiple rowname columns)
  stub_vars <- dt_boxhead_get_var_stub(data = data)
  stub_width <- if (length(stub_vars) == 1 && is.na(stub_vars)) 0 else length(stub_vars)
  if ("group_label" %in% stub_layout) {
    stub_width <- stub_width + 1
  }

  # Obtain all of the visible (`"default"`), non-stub
  # column names for the table
  default_vars <- dt_boxhead_get_vars_default(data = data)

  unname(
    unlist(
      lapply(
        seq_len(n_rows),
        FUN = function(x) {

          # Determine if body row `x` has a group summary placed after
          # it; if not, return an empty string
          if (!(x %in% groups_rows_df$row_end)) {
            return("")
          }

          # Obtain the group ID for the group of rows that ends at row `x`;
          group_id <-
            groups_rows_df[groups_rows_df$row_end == x, "group_id", drop = TRUE]

          # Check whether this group has a corresponding entry in
          # `list_of_summaries$summary_df_display_list` (i.e., are there
          # summary rows for this group?); if not, return an empty string
          if (!(group_id %in% names(list_of_summaries$summary_df_display_list))) {
            return("")
          }

          # Obtain the summary data table specific to the group ID and
          # select the column named `::rowname::` and all of the visible columns
          summary_df <-
            dplyr::select(
              list_of_summaries$summary_df_display_list[[group_id]],
              dplyr::all_of(c(rowname_col_private, default_vars))
            )

          row_splits_summary <- split_row_content(summary_df)

          if (stub_width > 1) {

            rowsplit_alignment <- "l"
            if(dt_options_get_value(data, "latex_stub_separate")){
              rowsplit_alignment <- paste0(rowsplit_alignment,"|")
            }

            row_splits_summary <-
              lapply(
                row_splits_summary,
                function(x) {

                  x <- c(rep("", stub_width - 1), x)

                  x[seq_len(stub_width)] <- sapply(x[seq_len(stub_width)], function(x) {
                    latex_multicolumn_cell(x, ncols = 1, alignment = rowsplit_alignment, override_alignment = FALSE)
                    })

                  x
                }
              )
          }

          summary_rows <-
            paste0(
              vapply(
                row_splits_summary,
                FUN.VALUE = character(1L),
                latex_body_row,
                type = "row"
              ),
              collapse = ""
            )

          paste0(
            if ("group_label" %in% stub_layout && stub_width > 1) {
              paste0(
                "\\cmidrule(l{-0.05em}r){2-",
                ncol(summary_df) + stub_width - 1,
                "}"
              )
            } else {
              summary_h_border
            },
            summary_rows
          )
        }
      )
    )
  )
}

# Define horizontal border line types for
# summary rows and for grand summary rows
summary_h_border <- "\\midrule \n"
grand_summary_h_border <- "\\midrule \n\\midrule \n"

#' Split data frame or matrix row content into a list structure
#'
#' This function takes any data frame or matrix and creates a list
#' with every component representing a row, each containing a vector
#' with length corresponding to the total number of columns in the
#' finalized table
#'
#' @noRd
split_row_content <- function(x) {

  row_content <- as.vector(t(x))

  split(row_content, ceiling(seq_along(row_content) / ncol(x)))
}

derive_table_width_statement_l <- function(data) {

  table_width <- dt_options_get_value(data = data, "table_width")

  # Bookends are not required if a table width is not specified
  # of if using floating table
  if (table_width == "auto" ||
      !dt_options_get_value(data = data, option = "latex_use_longtable")) {

    statement <- ''

  } else if (endsWith(table_width, "%")) {

    tw <- as.numeric(gsub("%", "", table_width, fixed = TRUE))

    side_width <- (100 - tw) / 200
    side_width <- format(side_width, scientific = FALSE, trim = TRUE)

    statement <- paste0(
      "\\setlength\\",
      c("LTleft", "LTright"),
      "{",
      side_width,
      "\\linewidth}",
      collapse = "\n"
    )

  } else {

    width_in_pt <- 0.75 * convert_to_px(table_width)

    halfwidth_in_pt <- format(width_in_pt / 2, scientific = FALSE, trim = TRUE)

    statement <- paste0(
      "\\setlength\\",
      c("LTleft", "LTright"),
      "{\\dimexpr(0.5\\linewidth - ",
      halfwidth_in_pt,
      "pt)}",
      collapse = "\n"
    )

  }

  statement

}

#' Consolidate Cell Styles
#'
#' Function addresses a TODO item in the previous code and handles situations
#' where a filtered data.frame of styles has multiple rows that apply to the
#' cell. The function places all of these into a single list of lists.
#'
#' @noRd
consolidate_cell_styles_l <- function(styles_df) {

  styles_col <- styles_df[["styles"]]

  # If only one set of styles is supplied the function isn't necessary
  if (length(styles_col) == 1L) return(styles_col[[1L]])

  out_style <- list()
  for (i in seq_along(styles_col)) {

    for (j in names(styles_col[[i]])) {

      if (!j %in% names(out_style)) out_style[[j]] <- list()

      for (k in names(styles_col[[i]][[j]])) {

        out_style[[j]] <- append(out_style[[j]], styles_col[[i]][[j]][k])

      }
    }
  }

  out_style
}

#' Apply Cell Styles in LaTeX
#'
#' Applies the formats specified in applicable tab_style commands to
#' a cell of text to be output in LaTeX.
#'
#' @noRd
apply_cell_styles_l <- function(content, style_obj, type = "cell", width = "\\linewidth") {

  # Set default values for no footnote present
  just_content <- content
  mark_side <- rep("right", times = length(just_content))
  mark <- rep("", times = length(just_content))

  # Check to see if the content includes a footnote
  if (any(ind <- grepl("%%%(right|left):", content))) {
    mark_side[ind] <- gsub(".*%%%(right|left):.*", "\\1", content[ind])
    just_content[ind] <- gsub("%%%(right|left):.*$", "", content[ind])
    mark[ind] <- gsub(".*%%%(right|left):(.*)$", "\\2", content[ind])
  }

  if (length(style_obj) > 0L) {
    # Apply changes that have to be made to the content
    x <- .apply_style_color_l(just_content, style_obj)
    x <- .apply_style_fill_l(x, style_obj)
    x <- .apply_style_transform_l(x, style_obj)
    x <- .apply_style_decorate_l(x, style_obj)
    x <- .apply_style_alignment_shortstack(x, style_obj)

    # Apply changes that can be made to the bracketed environment
    out_text <- .apply_style_cell_alignment(
        paste0(
          "{",
          .apply_style_style_l(style_obj),
          .apply_style_weight_l(style_obj),
          # Can generate "\small for example
          .apply_style_fontsize_l(style_obj),
          .apply_style_indentation_l(style_obj),
          x,
          "}"
        ),
        style_obj,
        type = type,
        width = width
      )
  } else {
    out_text <- just_content
  }


  if(isTRUE(mark != "")){
    out_text <- ifelse(mark_side == "right" ,
         paste0(out_text, "%%%right:",mark),
         paste0(out_text, "%%%left:",mark)
         )

    out_text <- remove_footnote_encoding(out_text)

  }

  out_text

}

.apply_style_style_l <- function(style_obj) {

  if (is.null(style_obj[["cell_text"]][["style"]])) return(NULL)

  switch(
    style_obj[["cell_text"]][["style"]],
    italic = "\\itshape ",
    oblique = "\\slshape ",
    normal = "\\upshape ",
    ""
  )

}

.apply_style_transform_l <- function(x, style_obj) {

  if (is.null(style_obj[["cell_text"]][["transform"]])) return(x)

  switch(
    style_obj[["cell_text"]][["transform"]],
    uppercase = toupper(as.character(x)),
    lowercase = tolower(as.character(x)),
    capitalize = str_title_case(as.character(x)),
    x
  )
}

.apply_style_weight_l <- function(style_obj) {

  if (is.null(style_obj[["cell_text"]][["weight"]])) return("")

  # TODO:  Figure out how to implement weights expressed as numbers.
  if (is.numeric(style_obj[["cell_text"]][["weight"]])) return("")

  switch(
    style_obj[["cell_text"]][["weight"]],
    normal = "\\mdseries ",
    bold = "\\bfseries ",
    bolder = "\\bfseries ",  # Not implemented
    lighter = "\\mdseries ", # lfseries is not fully supported in Latex - caused errors with some fonts
    ''
  )

}

.apply_style_decorate_l <- function(x, style_obj) {

  if (is.null(style_obj[['cell_text']][['decorate']])) return(x)

  switch(
    style_obj[['cell_text']][['decorate']],
    underline = paste0('\\underline{', x, '}'),
    overline = paste0("$\\overline{\\mbox{", x, "}}$"),
    strikeout = x,  # Not implemented
    x
  )

}

.apply_style_alignment_shortstack <- function(x, style_obj) {

  if(!grepl("\\shortstack[l]", x, fixed = TRUE)){return(x)}

  alignment <- style_obj[["cell_text"]][["align"]]

  if(is.null(alignment) | identical(alignment, "left")){
    return(x)
  }

  shortstack_alignment(x, alignment = alignment)
}

shortstack_alignment <- function(x, alignment){

  shortstackalignment <- c(
    "center" = "[c]",
    "justify" = "[c]",
    "left" = "[l]",
    "right" = "[r]"
  )[alignment]

  gsub("\\shortstack[l]",paste0("\\shortstack",shortstackalignment), x, fixed = TRUE)
}

parbox_wrapper <- function(x, width = "\\linewidth", force_wrap = FALSE){

  ## if a parbox is already set, dont add more
  if(grepl("parbox\\{.+?\\}", x) & !force_wrap){
    return(x)
  }

  if(sum(c("pt","lw") %in% colnames(width)) > 0){
    width <- create_singlecolumn_width_text_l(width$pt, width$lw)
  }
  paste0("\\parbox{",width,"}{",x,"}")
}


.apply_style_cell_alignment <- function(x, style_obj, type = "cell", width = "\\linewidth") {

  if (is.null(style_obj[["cell_text"]][["align"]])) return(x)

  alignment <- style_obj[["cell_text"]][["align"]]

  if(type == "cell"){

    if(!identical(width, "")){
      tex_alignment <- c(
        "center" = ">{\\centering\\arraybackslash}",
        "justify" = ">{\\centering\\arraybackslash}",
        "left" = ">{\\raggedright\\arraybackslash}",
        "right" = ">{\\raggedleft\\arraybackslash}"
      )[alignment]

      tex_alignment <- paste0(tex_alignment,"m{",width,"}")

      ## needs additional alignment control when using a set width/parbox
      x <- latex_align_text(x, alignment = alignment)

    }else{
      tex_alignment <- c(
        "center" = "c",
        "justify" = "c",
        "left" = "l",
        "right" = "r"
      )[alignment]
    }

    latex_multicolumn_cell(x, alignment = tex_alignment, ncols = 1)

  }else if(type == "footnote"){

    latex_align_text(x, alignment = alignment, force_wrap = TRUE)
  }
}

latex_multicolumn_cell <- function(x,  ncols = NULL, alignment = NULL, override_ncols = TRUE, override_alignment = TRUE){

  if (grepl("\\multicolumn", x, fixed = TRUE)) {
    pre_existing <- TRUE
    existing_ncols <- gsub(".*(\\multicolumn)\\{(\\d+)\\}\\{(.*?)\\}\\{.+\\}", "\\2", x)
    if(existing_ncols == ""){
      existing_ncols <- NULL
    }
    existing_alignment <- gsub(".*(\\multicolumn)\\{(\\d+)\\}\\{(.*?)\\}\\{.+\\}", "\\3", x)
    if(existing_alignment == ""){
      existing_alignment <- NULL
    }
  } else{
    pre_existing <- FALSE
    existing_width <- NULL
    existing_alignment <- NULL
  }

  if(override_ncols){
    ncols <- ncols %||% existing_width
  }else{
    ncols <- existing_width %||% ncols
  }

  if(override_alignment){
    alignment <- alignment %||% existing_alignment
  }else{
    alignment <- existing_alignment %||% alignment
  }



  new_multicolumn_statement <- paste0("\\multicolumn{",ncols,"}{",alignment,"}")

  if(pre_existing){
    gsub(paste0("\\multicolumn{",existing_ncols,"}{",existing_alignment,"}"), new_multicolumn_statement, x, fixed = TRUE)
  }else{

    if(grepl("m\\{.+\\}",alignment)){
      x <- parbox_wrapper(x)
    }else{
      ## if no width set, remove the parbox if it is set to line width
      x <- gsub("\\\\parbox\\{\\\\linewidth\\}\\{(.+?)\\}","\\1",x)
    }

    paste0(new_multicolumn_statement,"{",x,"}")
  }
}

latex_cleanup_multicolumn <- function(x){

  ## Fix missing alignment
  x <- gsub("(\\multicolumn\\{(\\d+)\\})\\{\\}(\\{.+?\\})", "\\1{l}\\2", x)
  ## Fix missing column width
  x <- gsub("(\\multicolumn)\\{\\}(\\{.+?\\}\\{.+?\\})", "\\1{1}\\2", x)
  x
}

latex_align_text <- function(x, alignment, force_wrap = FALSE){

  tex_alignment <- c(
    "center" = "\\centering",
    "justify" = "\\sloppy\\setlength\\parfillskip{0pt}",
    "left" = "\\raggedright",
    "right" = "\\raggedleft"
  )[alignment]

  ## if there is already a parbox, set alignment within that
  if(grepl("\\parbox", x)){
    x <- gsub("\\\\parbox\\{(.+?)\\}{", paste0("\\\\parbox{\\1}{",gsub("\\","\\\\", tex_alignment, fixed = TRUE)," "), x, perl = TRUE)
  }else{
    parbox_wrapper(paste0(tex_alignment," ",x), "\\linewidth", force_wrap = force_wrap)
  }

}

.apply_style_fontsize_l <- function(style_obj) {

  if (is.null(style_obj[["cell_text"]][["size"]])) return("")

  if (is.numeric(style_obj[["cell_text"]][["size"]])) {
    # According to the documentation for the cell_text function,
    # numeric values are assumed to be in pixels.  Latex requires
    # points

    return(
      paste0(
        "\\fontsize{",
        round(style_obj[['cell_text']][['size']] * 0.75),
        "}{",
        round(style_obj[['cell_text']][['size']] * 0.75 * 1.25),
        "}\\selectfont "
      )
    )

  }

  convert_font_size_l(style_obj[["cell_text"]][["size"]])

}

.apply_style_color_l <- function(x, style_obj) {

  if (is.null(style_obj[["cell_text"]][["color"]])) return(x)

  paste0(
    "\\textcolor[HTML]{",
    gsub("#", "", style_obj[["cell_text"]][["color"]], fixed = TRUE),
    "}{", x, "}"
  )
}

.apply_style_fill_l <- function(x, style_obj) {

  if (is.null(style_obj[["cell_fill"]][["color"]])) return(x)

  paste0(
    "\\cellcolor[HTML]{",
    gsub("#", "", style_obj[['cell_fill']][['color']], fixed = TRUE),
    "}{", x, "}"
  )

}

.apply_style_indentation_l <- function(style_obj) {

  use_indent <- style_obj[["cell_text"]][["indent"]]

  if (is.null(use_indent)) return(NULL)

  # Documentation says numbers without units default to px
  if (is.numeric(use_indent)) use_indent <- paste0(use_indent, "px")

  paste0(
    "\\hspace{",
    convert_to_px(use_indent) * 0.75,  # converts to points for Latex
    "pt}"
  )

}

#' Apply Spanner Styles
#'
#' Applying the formats specified in tab_style requires slighly different
#' handling for the spanners than the other table elements. Spanners are
#' formatted using this function while everything else uses
#' `apply_cell_styles_l()`.
#'
#' @noRd
apply_spanner_styles_l <- function(spanners_rle, styles_tbl, widths) {

  for (i in seq_along(spanners_rle$labels)) {

    if (!is.na(spanners_rle$labels[i])) {
      var_name <- names(spanners_rle$labels)[i]
      grp_name <- spanners_rle$values[var_name]

      styles_spanner <-
        consolidate_cell_styles_l(
          dplyr::filter(styles_tbl, locname == 'columns_groups', grpname == grp_name)
        )

      if(rlang::is_empty(styles_spanner)){
        styles_spanner <- list(cell_text = list(align = "center"))
      }

      width <- widths[i]

      spanners_rle$labels[i] <- apply_cell_styles_l(spanners_rle$labels[i], styles_spanner, width = width)
    }

  }

  spanners_rle
}

create_fontsize_statement_l <- function(data) {

  size <- dt_options_get_value(data, "table_font_size")

  fs_fmt <- "\\fontsize{%3.1fpt}{%3.1fpt}\\selectfont\n"
  if (grepl(pattern = "^[[:digit:]]+(\\%|in|cm|emu|em|pt|px)$", size)) {
    font_size <- parse_font_size_l(size)
    ## parse_font_size_l returns font size in p
    fs_statement <- sprintf(fs_fmt, round(font_size*.75), round(font_size* 1.2 * .75))
  } else {
    return("")
  }

  fs_statement

}

parse_font_size_l <- function(x){
  if (endsWith(x, "%")) {

    size <- (as.numeric(gsub("%", "", x, fixed = TRUE)) / 100) * 16 * (4/3) ## 12pt is default font size, 4/3 to convert to px

  } else {

    size <- convert_to_px(x)
  }

  size
}

create_colwidth_df_l <- function(data) {

  boxhead <- dt_boxhead_get(data)
  tbl_width <- dt_options_get_value(data = data, option = "table_width")
  stub_layout <- get_stub_layout(data = data)

  n <- dim(boxhead)[1L]
  width_df <- data.frame(
    var = boxhead$var,
    type = boxhead$type,
    unspec = rep.int(0L, n),
    lw = rep.int(0L, n),
    pt = rep.int(0L, n),
    column_align = boxhead$column_align
  )

  width_df$column_align[width_df$type %in% c("stub", "row_group")] <- "left"

  for (i in 1:n) {
    raw <- unlist(boxhead$column_width[i])[1L]

    if (is.null(raw) || raw == "") {
      width_df$unspec[i] <- 1L
      next
    } else if (endsWith(raw, "%")) {
      pct <- as.numeric(gsub("%", "", raw, fixed = TRUE))

      if (tbl_width == "auto") {
        width_df$lw[i] <- pct / 100
      } else if (endsWith(tbl_width, "%")) {
        width_df$lw[i] <- pct * as.numeric(gsub("%", "", tbl_width, fixed = TRUE)) / 1e4
      } else {
        width_df$pt[i] <- pct / 100 * convert_to_pt(tbl_width)
      }
    } else {
      width_df$pt[i] <- convert_to_pt(raw)
    }
  }

  if (length(stub_layout) > sum(c('stub', 'row_group') %in% width_df$type)) {
    if ('stub' %in% width_df$type) {
      stub_row_group <- dplyr::filter(width_df, type == "stub")

      stub_row_group$type <- "stub_row_group"
      stub_row_group$lw <- stub_row_group$lw / 2
      stub_row_group$pt <- stub_row_group$pt / 2

      width_df$pt[width_df$type == 'stub'] <- width_df$pt[width_df$type == 'stub'] / 2
      width_df$lw[width_df$type == 'stub'] <- width_df$lw[width_df$type == 'stub'] / 2
    } else {
      stub_row_group <- data.frame(type = "stub_row_group", lw = 0, pt = 0)
    }

    width_df <- vctrs::vec_rbind(stub_row_group, width_df)
  }

  if (tbl_width == 'auto') {
    if (any(width_df$unspec > 0)) {
      # If any of the column widths are unspecified, a table width can't be inferred
      width_df$tbl_width <- NA_real_
    } else {
      pt_total <- sum(width_df$pt)
      lw_total <- sum(width_df$lw)

      if (pt_total <= 0) {
        width_df$tbl_width <- glue::glue("{lw_total}\\linewidth")
      } else if (lw_total <= 0) {
        width_df$tbl_width <- glue::glue("{pt_total}pt")
      } else {
        width_df$tbl_width <- glue::glue("{pt_total}pt+{lw_total}\\linewidth")
      }
    }
  } else if (endsWith(tbl_width, "%")) {
    lw_multiple <- as.numeric(gsub("%", "", tbl_width, fixed = TRUE)) / 100
    width_df$tbl_width <- glue::glue("{lw_multiple}\\linewidth")
  } else {
    width_df$tbl_width <- paste0(convert_to_pt(tbl_width), "pt")
  }

  width_df
}

calculate_multicolumn_width_text_l <- function(begins, ends, col_order, colwidth_df) {
  out_text <- rep("", times = length(begins))

  # order by column order to ensure correct columns are used
  # this is important if data order has changed, or there are hidden columns etc
  colwidth_df <- col_order %>%
    dplyr::left_join(colwidth_df, by = "var") %>%
    dplyr::filter(type != "hidden" )



  for (i in seq_along(begins)) {
    ind <- seq(from = begins[i], to = ends[i])

    # If any of the combined columns has an unspecified width, it can't be determined
    # so it is left blank
    if (any(colwidth_df$unspec[ind] > 0)) next

    pt_total <- sum(colwidth_df$pt[ind], na.rm = TRUE)
    lw_total <- sum(colwidth_df$lw[ind], na.rm = TRUE)

    if (pt_total <= 0 && lw_total <= 0) {
      next
    } else {
      out_text[i] <- create_singlecolumn_width_text_l(pt = pt_total, lw = lw_total)
    }
  }

  out_text
}

create_singlecolumn_width_text_l <- function(pt, lw) {

  if (pt <= 0L && lw <= 0L) {
    out_txt <- "0pt"
  } else if (pt <= 0L) {
    out_txt <- sprintf("\\dimexpr %.2f\\linewidth -2\\tabcolsep-1.5\\arrayrulewidth", lw)
  } else if (lw <= 0L) {
    out_txt <- sprintf("\\dimexpr %.2fpt -2\\tabcolsep-1.5\\arrayrulewidth", pt)
  } else {
    out_txt <- sprintf("\\dimexpr %.2fpt + %.2f\\linewidth -2\\tabcolsep-1.5\\arrayrulewidth", pt, lw)
  }

  out_txt

}
