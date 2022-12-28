# Create a simple LaTeX group by surrounding a statement with curly braces
latex_group <- function(...) {
  paste0("{", ..., "}")
}

# Create a vector of LaTeX packages to use as table dependencies
latex_packages <- function() {
  c("amsmath", "booktabs", "caption", "longtable")
}

# Transform a footnote mark to a LaTeX representation as a superscript
footnote_mark_to_latex <- function(mark) {
  ifelse(is.na(mark), "", paste0("\\textsuperscript{", mark, "}"))
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
    "\\midrule\n",
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
    ifelse(top_border, "\\midrule\n", ""),
    "\\multicolumn{", n_cols, "}{l}{", group_name,
    "} \\\\ \n",
    ifelse(bottom_border, "\\midrule\n", ""),
    collapse = ""
  )
}

#' @noRd
create_table_start_l <- function(data) {

  # Get vector representation of stub layout
  stub_layout <- get_stub_layout(data = data)

  # Get default alignments for body columns
  col_alignment <- dt_boxhead_get_vars_align_default(data = data)

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

  # Generate setup statements for table including default right
  # alignments and vertical lines for any stub columns
  paste0(
    longtable_post_length,
    "\\begin{longtable}{",
    if (length(stub_layout) > 0) {
      paste0(rep("l|", length(stub_layout)), collapse = "")
    },
    col_alignment %>% substr(1, 1) %>% paste(collapse = ""),
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
      footnote_mark_to_latex(mark = footnote_title_marks$fs_id_c)

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
      footnote_mark_to_latex(mark = footnote_subtitle_marks$fs_id_c)

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

  body <- dt_body_get(data = data)
  groups_rows_df <- dt_groups_rows_get(data = data)
  stub_df <- dt_stub_df_get(data = data)

  n_rows <- nrow(body)

  # Get vector representation of stub layout
  stub_layout <- get_stub_layout(data = data)
  has_stub_column <- "rowname" %in% stub_layout

  n_cols <- get_effective_number_of_columns(data = data)

  # Get a matrix of body cells to render, split into a list of
  # character vectors by row, and create a vector of LaTeX body rows
  cell_matrix <- get_body_component_cell_matrix(data = data)
  row_splits_body <- split_row_content(cell_matrix)

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

    row_label_col <- which(stub_layout == "rowname")

    lapply(
      seq_len(n_rows),
      FUN = function(x) {

        indent <- as.integer(stub_df[x, ][["indent"]])

        if (!is.na(indent)) {
          row_splits_body[[x]][row_label_col] <<-
            paste0(
              "\\hspace*{", indent_length_px * indent, "px} ",
              row_splits_body[[x]][row_label_col]
            )
        }
      }
    )
  }

  body_rows <- create_body_rows_l(row_splits_body = row_splits_body)

  # Replace an NA group with an empty string
  if (any(is.na(groups_rows_df$group_label))) {

    groups_rows_df <-
      dplyr::mutate(
        groups_rows_df,
        group_label = ifelse(
          is.na(group_label), "\\vspace*{-5mm}", group_label
        )
      )
  }

  summary_rows <-
    create_summary_rows_l(
      data = data,
      groups_rows_df = groups_rows_df,
      n_rows = n_rows
    )

  grand_summary_side <- summary_row_side(data = data, group_id = grand_summary_col)

  grand_summary_rows <- create_grand_summary_rows_l(data = data, side = grand_summary_side)

  paste0(
    if (!is.null(grand_summary_side) && grand_summary_side == "top") grand_summary_rows,
    paste0(
      if (!("group_label" %in% stub_layout)) {

        group_rows <-
          create_group_rows_l(
            groups_rows_df = groups_rows_df,
            n_rows = n_rows,
            n_cols = n_cols
          )

        paste0(group_rows, body_rows, summary_rows)

      } else {

        group_dividers <-
          create_group_dividers_l(
            groups_rows_df = groups_rows_df,
            n_rows = n_rows
          )

        paste0(group_dividers, body_rows, summary_rows)
      },
      collapse = ""
    ),
    if (!is.null(grand_summary_side) && grand_summary_side == "bottom") grand_summary_rows,
    collapse = ""
  )
}

#' @noRd
create_table_end_l <- function() {

  paste0(
    "\\bottomrule\n",
    "\\end{longtable}\n",
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
        footnote_mark_to_latex(footnotes_tbl[["fs_id"]]),
        vapply(
          footnotes_tbl[["footnotes"]],
          FUN.VALUE = character(1),
          FUN = process_text,
          context = "latex"
        )
      )

    if (footnotes_multiline) {
      footnotes <- paste(footnotes, collapse = "\\\\\n") %>% paste_right("\\\\\n")
    } else {
      footnotes <- paste(footnotes, collapse = footnotes_sep) %>% paste_right("\\\\\n")
    }
  } else {
    footnotes <- ""
  }

  # Create a formatted source notes string
  if (length(source_notes_vec) > 0) {

    if (source_notes_multiline) {
      source_notes <- paste(source_notes_vec, collapse = "\\\\\n") %>% paste_right("\\\\\n")
    } else {
      source_notes <- paste(source_notes_vec, collapse = source_notes_sep) %>% paste_right("\\\\\n")
    }

  } else {
    source_notes <- ""
  }

  # Create the footer block
  paste0(
    "\\begin{minipage}{\\linewidth}\n",
    paste0(footnotes, source_notes),
    "\\end{minipage}\n",
    collapse = ""
  )
}

# Function to build a vector of `group` rows in the table body
create_group_rows_l <- function(
    groups_rows_df,
    n_rows,
    n_cols
) {

  unname(
    unlist(
      lapply(
        seq_len(n_rows),
        FUN = function(x) {
          if (!(x %in% groups_rows_df$row_start)) {
            return("")
          }

          latex_group_row(
            group_name = groups_rows_df[groups_rows_df$row_start == x, "group_label"][[1]],
            n_cols = n_cols,
            top_border = x != 1,
            bottom_border = x != n_rows
          )
        }
      )
    )
  )
}

create_group_dividers_l <- function(groups_rows_df, n_rows) {

  dividers <- rep_len("", n_rows)

  # Dividing line is inserted *after* last row of each group
  # so add 1 to `groups_rows_df$row_end`; bottom of series (outside
  # row range) shouldn't have a dividing line
  divider_idx <- groups_rows_df$row_end + 1
  divider_idx <- divider_idx[divider_idx <= n_rows]

  dividers[divider_idx] <- "\\midrule\n"

  dividers
}

# Function to build a vector of `body` rows
create_body_rows_l <- function(row_splits_body) {

  unname(
    unlist(
      lapply(
        seq_len(length(row_splits_body)),
        FUN = function(x) {
          latex_body_row(content = row_splits_body[[x]], type = "row")
        }
      )
    )
  )
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

create_grand_summary_rows_l <- function(data, side) {

  list_of_summaries <- dt_summary_df_get(data = data)

  if (
    length(list_of_summaries) < 1 ||
    is.null(list_of_summaries$summary_df_display_list[[grand_summary_col]]) ||
    nrow(list_of_summaries$summary_df_display_list[[grand_summary_col]]) < 1
  ) {
    return("")
  }

  # Get vector representation of stub layout
  stub_layout <- get_stub_layout(data = data)
  stub_width <- length(stub_layout)

  # Obtain all of the visible (`"default"`), non-stub
  # column names for the table
  default_vars <- dt_boxhead_get_vars_default(data = data)

  grand_summary_df <-
    dplyr::select(
      list_of_summaries$summary_df_display_list[[grand_summary_col]],
      dplyr::all_of(rowname_col_private),
      dplyr::all_of(default_vars)
    )

  row_splits_summary <- split_row_content(grand_summary_df)

  if (stub_width > 1) {

    row_splits_summary <-
      lapply(
        row_splits_summary,
        function(x) {
          x[[1]] <- paste0("\\multicolumn{", stub_width, "}{l|}{", x[1], "}")
          x
        }
      )
  }

  grand_summary_rows <-
    paste(
      vapply(
        row_splits_summary,
        FUN.VALUE = character(1),
        latex_body_row,
        type = "row"
      ),
      collapse = ""
    )

  if (side == "bottom") {
    grand_summary_rows <- paste0(grand_summary_h_border, grand_summary_rows)
  } else {
    grand_summary_rows <- paste0(grand_summary_rows, grand_summary_h_border)
  }

  grand_summary_rows
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
