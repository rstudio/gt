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
#  Copyright (c) 2018-2024 gt authors
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

  if (is.null(spec)) {
    spec <- "^i"
  }

  if (grepl("\\.", spec)) mark <- sprintf_unless_na("%s.", mark)
  if (grepl("b", spec)) mark <- sprintf_unless_na("\\textbf{%s}", mark)
  if (grepl("i", spec)) mark <- sprintf_unless_na("\\textit{%s}", mark)
  if (grepl("\\(|\\[", spec)) mark <- sprintf_unless_na("(%s", mark)
  if (grepl("\\)|\\]", spec)) mark <- sprintf_unless_na("%s)", mark)

  if (grepl("\\^", spec)) {
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
    sprintf(fmt, as.character(x))
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
latex_heading_row <- function(content) {

  paste0(
    paste(paste(content, collapse = " & "), "\\\\ \n"),
    "\\midrule\\addlinespace[2.5pt]\n",
    collapse = ""
  )
}

#' @noRd
latex_group_row <- function(
    group_name,
    n_cols,
    top_border = TRUE,
    bottom_border = TRUE
) {

  paste0(
    ifelse(top_border, "\\midrule\\addlinespace[2.5pt]\n", ""),
    "\\multicolumn{", n_cols, "}{l}{", group_name,
    "} \\\\ \n",
    ifelse(bottom_border, "\\midrule\\addlinespace[2.5pt]\n", ""),
    collapse = ""
  )
}

#' @noRd
create_table_start_l <- function(data) {

  # Get vector representation of stub layout
  stub_layout <- get_stub_layout(data = data)

  boxh_df <- dt_boxhead_get(data = data)

  # Get default alignments for body columns
  col_alignment <- dt_boxhead_get_vars_align_default(data = data)

  if (length(stub_layout) > 0) {
    col_alignment <- c(rep("left", length(stub_layout)), col_alignment)
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

  # Obtain widths for each visible column label
  col_widths <-
    unlist(
      dplyr::pull(
        dplyr::arrange(
          dplyr::filter(boxh_df, type %in% c("default", "stub")),
          dplyr::desc(type)
        ),
        column_width
      )
    )

  # Generate the column definitions for visible columns
  # these can either be simple `l`, `c`, `r` directive if a width isn't set
  # for a column, or, use `p{<width>}` statements with leading `>{...}`
  # specifiers that should have one of the following:
  # - `>{\raggedright\arraybackslash}` <- left alignment
  # - `>{\raggedleft\arraybackslash}` <- right alignment
  # - `>{\centering\arraybackslash}` <- center alignment
  # the `\arraybackslash` command is used to restore the behavior of the
  # `\\` command in the table (all of this uses the CTAN `array` package)

  if (!is.null(col_widths)) {

    col_defs <- c()

    # TODO: check that length of `col_widths` is equal to that
    # of `col_alignment`

    if ("group_label" %in% stub_layout) {

      group_label_width <-
        unlist(
          dplyr::pull(dplyr::filter(boxh_df, type == "row_group"), column_width)
        )

      col_widths <- c(group_label_width, col_widths)
    }

    for (i in seq_along(col_widths)) {

      if (col_widths[i] != "") {

        align <-
          switch(
            col_alignment[i],
            left = ">{\\raggedright\\arraybackslash}",
            right = ">{\\raggedleft\\arraybackslash}",
            center = ">{\\centering\\arraybackslash}",
            ">{\\raggedright\\arraybackslash}"
          )

        # Check if column width was set using gt::pct and
        # convert to Latex friendly terminology (i.e.,
        # '14.7%' becomes '0.147\\linewidth')
        if (grepl('^[[:digit:].]+%$', col_widths[i])) {

          table_width <- dt_options_get_value(data = data, option = 'table_width')

          col_pct <- as.numeric(gsub('%$', '', col_widths[i])) / 100

          if (table_width == 'auto') {

            # Table width not specified, use all available space
            col_scalar <- col_pct
            tab_unit <- '\\linewidth'

          } else if (endsWith(table_width, suffix = '%')) {

            # If table width is expressed as a percentage, adjust the scaler
            col_scalar <- col_pct * as.numeric(gsub('%', '', table_width)) / 100
            tab_unit <- '\\linewidth'

          } else {

            # When table width is expressed in units, convert to points
            col_scalar <- col_pct * convert_to_px(table_width) * 0.75 # 0.75 converts pixels to points
            tab_unit <- 'pt'

          }

          col_widths[i] <-
            paste0(
              "\\dimexpr ",
              col_scalar,
              tab_unit,
              "-2\\tabcolsep-1.5\\arrayrulewidth"
            )

        }

        col_defs_i <- paste0(align, "p{", col_widths[i], "}")

      } else {

        col_defs_i <- substr(col_alignment[i], 1, 1)
      }

      col_defs <- c(col_defs, col_defs_i)
    }

  } else {

    col_defs <- substr(col_alignment, 1, 1)
  }

  # Add borders to the right of any columns in the stub
  if (length(stub_layout) > 0) {

    col_defs[seq_along(stub_layout)] <-
      paste0(col_defs[seq_along(stub_layout)], "|")
  }

  # If a table width is specified, add an extra column
  # space to fill in enough space to match the width
  extra_sep <- ''
  if (dt_options_get_value(data = data, option = 'table_width') != 'auto')
    extra_sep <- '@{\\extracolsep{\\fill}}'

  # Generate setup statements for table including default left
  # alignments and vertical lines for any stub columns

  # FIXME: just putting in temporary boolean, need to pull this from data
  longtable <- FALSE

  paste0(
    ifelse(longtable, longtable_post_length, "\\begin{table}\n"),
    ifelse(longtable, "\\begin{longtable}{", "\\begin{tabular}{"),
    extra_sep,
    paste(col_defs, collapse = ""),
    "}\n",
    collapse = ""
  )
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
        mark = footnote_title_marks$fs_id_c
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
        mark = footnote_subtitle_marks$fs_id_c
      )

  } else {
    footnote_subtitle_marks <- ""
  }

  title_row <- latex_group("\\large ", heading$title, footnote_title_marks)

  if (subtitle_defined) {

    subtitle_row <-
      paste0(
        " \\\\ \n",
        latex_group("\\small ", heading$subtitle, footnote_subtitle_marks)
      )

  } else {
    subtitle_row <- ""
  }

  paste_between(
    paste0(title_row, subtitle_row),
    x_2 = c("\\caption*{\n", "\n} \\\\ \n")
  )
}

#' Create the columns component of a table
#'
#' @noRd
create_columns_component_l <- function(data) {

  # Get vector representation of stub layout
  stub_layout <- get_stub_layout(data = data)

  # Determine the finalized number of spanner rows
  spanner_row_count <-
    dt_spanners_matrix_height(
      data = data,
      omit_columns_row = TRUE
    )

  # Get the column headings
  headings_vars <- dt_boxhead_get_vars_default(data = data)
  headings_labels <- dt_boxhead_get_vars_labels_default(data = data)

  # If there is a stub then modify the `headings_vars` and `headings_labels`
  if (length(stub_layout) > 0) {

    stubh <- dt_stubhead_get(data = data)

    headings_vars <- prepend_vec(headings_vars, "::stub")

    stub_label <- ifelse(length(stubh$label) > 0, stubh$label, "")

    if (length(stub_layout) > 0) {

      stub_label <-
        paste0("\\multicolumn{", length(stub_layout), "}{l}{", stub_label, "}")
    }

    headings_labels <- prepend_vec(headings_labels, stub_label)
  }

  table_col_headings <-
    paste0(latex_heading_row(content = headings_labels), collapse = "")

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

      stub_matrix <- matrix(nrow = nrow(spanners), ncol = length(stub_layout))

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

      begins <- (cumsum(utils::head(c(0, spanners_rle$lengths), -1)) + 1)[!is.na(spanners_rle$values)]
      ends <- cumsum(spanners_rle$lengths)[!is.na(spanners_rle$values)]
      cmidrule <- paste0("\\cmidrule(lr){", begins, "-", ends, "}")

      is_spanner_na <- is.na(spanners_rle$values)
      is_spanner_single <- spanners_rle$lengths == 1

      multicol <-
        ifelse(
          is_spanner_na, "",
          ifelse(
            is_spanner_single, spanners_rle$labels,
            sprintf(
              "\\multicolumn{%d}{c}{%s}", spanners_rle$lengths, spanners_rle$labels
            )
          )
        )

      # If there is a stub we need to tweak the spanners row with a blank
      # multicolumn statement that's the same width as that in the columns
      # row; this is to prevent the automatic vertical line that would otherwise
      # appear here
      if (length(stub_layout) > 0) {

        multicol <-
          c(
            paste0("\\multicolumn{", length(stub_layout), "}{l}{}"),
            multicol[-seq_along(stub_layout)]
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

  paste0(
    "\\toprule\n",
    paste0(table_col_spanners, collapse = ""),
    table_col_headings
  )
}

#' @noRd
create_body_component_l <- function(data) {

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

  if ("group_label" %in% stub_layout) {

    for (i in seq_len(nrow(groups_rows_df))) {
      row_splits_body[[groups_rows_df$row_start[i]]][1] <-
        groups_rows_df$group_label[i]
    }
  }

  # Insert indentation where necessary
  if (has_stub_column && any(!is.na(stub_df$indent))) {

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
              "\\hspace*{", indent_length_pt * indent, "px} ",
              row_splits_body[[x]][row_label_col]
            )
        }
      }
    )
  }

  body_rows <-
    create_body_rows_l(
      data = data,
      row_splits_body = row_splits_body
    )

  # Replace an NA group with a small amount of vertical space
  if (any(is.na(groups_rows_df$group_label))) {

    groups_rows_df <-
      dplyr::mutate(
        groups_rows_df,
        group_label = ifelse(
          is.na(group_label), "\\vspace*{-5mm}", group_label
        )
      )
  }

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
              bottom_border = TRUE
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
      dplyr::all_of(rowname_col_private),
      dplyr::all_of(default_vars)
    )

  row_splits_summary <- split_row_content(summary_df)

  if (stub_is_2) {

    row_splits_summary <-
      lapply(
        row_splits_summary,
        function(x) {
          x <- c("", x)
          x[1:2] <- paste0("\\multicolumn{1}{l|}{", x[1:2], "}")
          x
        }
      )
  }

  summary_rows <-
    paste0(
      vapply(
        row_splits_summary,
        FUN.VALUE = character(1),
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
create_table_end_l <- function() {

  # FIXME: just putting in temporary boolean, need to pull this from data
  longtable <- FALSE

  paste0(
    "\\bottomrule\n",
    ifelse(longtable, "\\end{longtable}\n", "\\end{tabular}\n"),
    collapse = ""
  )
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

  # Create a formatted footnotes string
  if (nrow(footnotes_tbl) > 0) {

    footnotes_tbl <-
      dplyr::distinct(dplyr::select(footnotes_tbl, fs_id, footnotes))

    # Create a vector of formatted footnotes
    footnotes <-
      paste0(
        footnote_mark_to_latex(
          data = data,
          mark = footnotes_tbl[["fs_id"]],
          location = "ftr"
        ),
        vapply(
          footnotes_tbl[["footnotes"]],
          FUN.VALUE = character(1),
          FUN = process_text,
          context = "latex"
        )
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
  if (length(source_notes_vec) > 0) {

    if (source_notes_multiline) {
      source_notes <- paste_right(paste(source_notes_vec, collapse = "\\\\\n"), "\\\\\n")
    } else {
      source_notes <- paste_right(paste(source_notes_vec, collapse = source_notes_sep), "\\\\\n")
    }

  } else {
    source_notes <- ""
  }

  # FIXME: just putting in temporary boolean, need to pull this from data
  longtable <- FALSE

  # Create the footer block
  paste0(
    "\\begin{minipage}{\\linewidth}\n",
    paste0(footnotes, source_notes),
    "\\end{minipage}\n",
    ifelse(longtable, "", "\\end{table}\n"),
    collapse = ""
  )
}

# Function to build a vector of `body` rows
create_body_rows_l <- function(
    data,
    row_splits_body
) {

  styles_tbl <- dt_styles_get(data = data)
  styles_tbl <- dplyr::filter(styles_tbl, locname %in% c("stub", "data", "row_groups"))

  # Obtain all of the visible (`"default"`), non-stub column names
  # for the table from the `boxh` object
  default_vars <- dt_boxhead_get_vars_default(data = data)

  stub_layout <- get_stub_layout(data = data)

  stub_is_2 <- length(stub_layout) > 1

  if (is.null(stub_layout)) {
    vars <- default_vars
  } else if (!is.null(stub_layout) && !stub_is_2 && stub_layout == "rowname") {
    vars <- c("::stub::", default_vars)
  } else if (!is.null(stub_layout) && !stub_is_2 && stub_layout == "group_label") {
    vars <- c("::group::", default_vars)
  } else if (!is.null(stub_layout) && stub_is_2) {
    vars <- c("::group::", "::stub::", default_vars)
  }

  if ("::group::" %in% vars) {
    styles_tbl <- dplyr::mutate(styles_tbl, rownum = round(rownum))
  }

  body_rows <-
    unname(
      unlist(
        lapply(
          seq_len(length(row_splits_body)),
          FUN = function(x) {

            content <- row_splits_body[[x]]
            content_length <- length(content)

            styles_tbl_i <- dplyr::filter(styles_tbl, rownum == x)

            if (nrow(styles_tbl_i) < 1) {
              return(paste(paste(content, collapse = " & "), "\\\\ \n"))
            }

            for (i in seq_len(content_length)) {

              colname_i <- vars[i]

              if (
                colname_i == "::group::" &&
                "row_groups" %in% styles_tbl_i[["locname"]]
              ) {

                styles_tbl_i_col <- dplyr::filter(styles_tbl_i, locname == "row_groups")
                styles_i_col <- styles_tbl_i_col[["styles"]]

              } else if (
                colname_i == "::stub::" &&
                "stub" %in% styles_tbl_i[["locname"]]
              ) {

                styles_tbl_i_col <- dplyr::filter(styles_tbl_i, locname == "stub")
                styles_i_col <- styles_tbl_i_col[["styles"]]

              } else if (
                "data" %in% styles_tbl_i[["locname"]] &&
                colname_i %in% styles_tbl_i[["colname"]]
              ) {

                styles_tbl_i_col <- dplyr::filter(styles_tbl_i, colname == colname_i)
                styles_i_col <- styles_tbl_i_col[["styles"]]

              } else {
                styles_i_col <- NULL
              }

              if (!is.null(styles_i_col)) {

                # TODO: this only considers the first entry; we need to iterate
                # through them since there may be multiple styles set for each
                # body cell and that might result in several rows in `styles_tbl_i_col`
                # (i.e., length greater than 1 in `styles_i_col`)
                styles_i_col_text_color <- styles_i_col[[1]][["cell_text"]][["color"]]
                styles_i_col_cell_color <- styles_i_col[[1]][["cell_fill"]][["color"]]

                if (
                  !is.null(styles_i_col[[1]][["cell_text"]][["weight"]]) &&
                  styles_i_col[[1]][["cell_text"]][["weight"]] == "bold"
                ) {
                  content[i] <- paste0("\\textbf{", content[i], "}")
                }

                if (!is.null(styles_i_col_text_color)) {
                  content[i] <-
                    paste0(
                      "\\textcolor[HTML]{",
                      gsub("#", "", styles_i_col_text_color, fixed = TRUE),
                      "}{", content[i], "}"
                    )
                }

                if (!is.null(styles_i_col_cell_color)) {
                  content[i] <-
                    paste0(
                      "\\cellcolor[HTML]{",
                      gsub("#", "", styles_i_col_cell_color, fixed = TRUE),
                      "}{", content[i], "}"
                    )
                }
              }
            }

            paste(paste(content, collapse = " & "), "\\\\ \n")
          }
        )
      )
    )

  body_rows
}

# Function to build a vector of `summary` rows in the table body
create_summary_rows_l <- function(
    data,
    groups_rows_df,
    n_rows
) {

  list_of_summaries <- dt_summary_df_get(data = data)

  if (length(list_of_summaries) < 1) {
    return(rep_len("", n_rows))
  }

  # Get vector representation of stub layout
  stub_layout <- get_stub_layout(data = data)
  stub_width <- length(stub_layout)

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
              dplyr::all_of(rowname_col_private),
              dplyr::all_of(default_vars)
            )

          row_splits_summary <- split_row_content(summary_df)

          if (stub_width > 1) {

            row_splits_summary <-
              lapply(
                row_splits_summary,
                function(x) {

                  x <- c(rep("", stub_width - 1), x)

                  x[seq_len(stub_width)] <-
                    paste0("\\multicolumn{1}{l|}{", x[seq_len(stub_width)], "}")

                  x
                }
              )
          }

          summary_rows <-
            paste0(
              vapply(
                row_splits_summary,
                FUN.VALUE = character(1),
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

derive_table_width_bookends <- function(data) {

  table_width <- dt_options_get_value(data = data, 'table_width')

  # Bookends are not required if a table width is not specified
  if (table_width == 'auto') {

    bookends <- c('', '')

  } else if (endsWith(table_width, "%")) {

    tw <- as.numeric(gsub('%', '', table_width))

    side_width <-
      ((100 - tw) / 200) %>%
      format(scientific = FALSE, trim = TRUE)

    bookends <-
      c(
        paste0(
          "\\newlength\\holdLTleft",
          "\\newlength\\holdLTright",
          "\\setlength\\holdLTleft{\\LTleft}\\relax",
          "\\setlength\\holdLTright{\\LTright}\\relax",
          sprintf(
            '\\setlength\\LTleft{%s\\linewidth}\n\\setlength\\LTright{%s\\linewidth}',
            side_width,
            side_width
          ),
          collapse = "\n"
        ),
        "\\setlength\\LTleft{\\holdLTleft}\n\\setlength\\LTright{\\holdLTright}"
      )

  } else {

    width_in_pt <- 0.75 * convert_to_px(table_width)

    halfwidth_in_pt <- format(width_in_pt / 2, scientific = FALSE, trim = TRUE)

    bookends <-
      c(
        paste0(
          "\\newlength\\holdLTleft",
          "\\newlength\\holdLTright",
          "\\setlength\\holdLTleft{\\LTleft}\\relax",
          "\\setlength\\holdLTright{\\LTright}\\relax",
          sprintf(
            "\\setlength\\LTleft{\\dimexpr(0.5\\linewidth - %spt)}\n\\setlength\\LTright{\\dimexpr(0.5\\linewidth - %spt)}",
            halfwidth_in_pt,
            halfwidth_in_pt
          ),
          collapse = '\n'
        ),
        paste0(
          "\\setlength\\LTleft{\\holdLTleft}",
          "\\setlength\\LTright{\\holdLTright}",
          collapse = "\n"
        )
      )

  }

  bookends

}
