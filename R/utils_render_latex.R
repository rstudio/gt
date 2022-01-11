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
  paste0("\\textsuperscript{", mark, "}")
}

#' @noRd
latex_body_row <- function(content,
                           type) {

  if (type == "row") {

    return(
      paste(paste(content, collapse = " & "), "\\\\ \n"))

  } else if (type == "group") {

    return(
      paste(paste(content, collapse = " & "), "\\\\ \n"))
  }
}

#' @noRd
latex_heading_row <- function(content) {

  paste0(
    paste(paste(content, collapse = " & "), "\\\\ \n"),
    "\\midrule\n",
    collapse = "")
}

#' @noRd
latex_group_row <- function(group_name,
                            top_border = TRUE,
                            bottom_border = TRUE) {

  paste0(
    ifelse(top_border, "\\midrule\n", ""),
    "\\multicolumn{1}{l}{", group_name,
    "} \\\\ \n",
    ifelse(bottom_border, "\\midrule\n", ""),
    collapse = "")
}

#' @noRd
create_table_start_l <- function(data) {

  # Get vector representation of stub layout
  stub_layout <- get_stub_layout(data = data)

  # Get default alignments for body columns
  col_alignment <- dt_boxhead_get_vars_align_default(data = data)

  # Generate setup statements for table including default right
  # alignments and vertical lines for any stub columns
  paste0(
    "\\captionsetup[table]{labelformat=empty,skip=1pt}\n",
    "\\begin{longtable}{",
    if (length(stub_layout) > 0) {
      paste0(rep("r|", length(stub_layout)), collapse = "")
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

  title_row <-
    latex_group("\\large ", heading$title, footnote_title_marks)

  if (subtitle_defined) {

    subtitle_row <-
      paste0(
        " \\\\ \n",
        latex_group("\\small ", heading$subtitle, footnote_subtitle_marks)
      )

  } else {
    subtitle_row <- ""
  }

  paste0(title_row, subtitle_row) %>%
    paste_between(x_2 = c("\\caption*{\n", "\n} \\\\ \n"))
}

#' Create the columns component of a table
#'
#' @noRd
create_columns_component_l <- function(data) {

  boxh <- dt_boxhead_get(data = data)
  stubh <- dt_stubhead_get(data = data)

  # Get vector representation of stub layout
  stub_layout <- get_stub_layout(data = data)

  # Determine if there are any spanners present
  spanners_present <- dt_spanners_exists(data = data)

  # Get the column headings
  headings_vars <- dt_boxhead_get_vars_default(data = data)
  headings_labels <- dt_boxhead_get_vars_labels_default(data = data)

  # If there is a stub then modify the `headings_vars` and `headings_labels`
  if (length(stub_layout) > 0) {

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

  if (spanners_present) {

    # Get vector of group labels (spanners)
    spanners <- dt_spanners_print(data = data, include_hidden = FALSE)
    spanner_ids <- dt_spanners_print(data = data, include_hidden = FALSE, ids = TRUE)

    if (length(stub_layout) > 0) {
      spanners <- c(rep(NA_character_, length(stub_layout)), spanners)
      spanner_ids <- c(rep(NA_character_, length(stub_layout)), spanner_ids)
    }

    spanners_rle <- unclass(rle(spanner_ids))

    # We need a parallel vector of spanner labels and this could
    # be part of the `spanners_rle` list
    spanners_rle$labels <- spanners[cumsum(spanners_rle$lengths)]

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

    table_col_spanners <- paste0(multicol, cmidrule, collapse = "")


  } else {
    table_col_spanners <- ""
  }

  paste0("\\toprule\n", table_col_spanners, table_col_headings)
}

#' @noRd
create_body_component_l <- function(data) {

  body <- dt_body_get(data = data)
  boxh <- dt_boxhead_get(data = data)

  groups_rows_df <- dt_groups_rows_get(data = data)

  n_rows <- nrow(body)

  # Get vector representation of stub layout
  stub_layout <- get_stub_layout(data = data)

  # Obtain all of the visible (`"default"`), non-stub
  # column names for the table
  default_vars <- dt_boxhead_get_vars_default(data = data)

  # Get a matrix of body cells to render, split into a list of
  # character vectors by row, and create a vector of LaTeX body rows
  cell_matrix <- get_body_component_cell_matrix(data = data)
  row_splits_body <- split_row_content(cell_matrix)
  body_rows <- create_body_rows_l(row_splits_body = row_splits_body)

  # Replace an NA group with an empty string
  if (any(is.na(groups_rows_df$group_label))) {

    groups_rows_df <-
      groups_rows_df %>%
      dplyr::mutate(
        group_label = ifelse(
          is.na(group_label), "\\vspace*{-5mm}", group_label
        )
      ) %>%
      dplyr::mutate(
        group_label = gsub("^NA", "\\textemdash", group_label)
      )
  }

  summary_rows <-
    create_summary_rows_l(
      data = data,
      groups_rows_df = groups_rows_df,
      n_rows = n_rows
    )

  grand_summary_rows <- create_grand_summary_rows_l(data = data)

  paste0(
    paste0(
      if (!("group_label" %in% stub_layout)) {

        group_rows <-
          create_group_rows_l(
            groups_rows_df = groups_rows_df,
            n_rows = n_rows
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
    grand_summary_rows,
    collapse = ""
  )
}

#' @noRd
create_table_end_l <- function() {

  paste0(
    "\\bottomrule\n",
    "\\end{longtable}\n",
    collapse = "")
}

#' @noRd
create_footnotes_component_l <- function(data) {

  footnotes_tbl <- dt_footnotes_get(data = data)
  opts_df <- dt_options_get(data = data)

  # If the `footnotes_resolved` object has no
  # rows, then return an empty footnotes component
  if (nrow(footnotes_tbl) == 0) {
    return("")
  }

  footnotes_tbl <-
    footnotes_tbl %>%
    dplyr::select(fs_id, footnotes) %>%
    dplyr::distinct()

  # Get the separator option from `opts_df`
  separator <-
    opts_df %>%
    dplyr::filter(parameter == "footnotes_sep") %>%
    dplyr::pull(value)

  # Convert an HTML break tag to a Latex line break
  separator <-
    separator %>%
    tidy_gsub("<br\\s*?(/|)>", "\\newline") %>%
    tidy_gsub("&nbsp;", " ")

  # Create the footnotes block
  paste0(
    "\\vspace{-5mm}\n",
    "\\begin{minipage}{\\linewidth}\n",
    paste0(
      footnote_mark_to_latex(footnotes_tbl[["fs_id"]]),
      footnotes_tbl[["footnotes"]] %>%
        unescape_html() %>%
        markdown_to_latex(), " \\\\ \n", collapse = ""),
    "\\end{minipage}\n",
    collapse = ""
  )
}

#' @noRd
create_source_note_component_l <- function(data) {

  source_note <- dt_source_notes_get(data = data)

  # If the `footnotes_resolved` object has no
  # rows, then return an empty footnotes component
  if (length(source_note) == 0) {
    return("")
  }

  source_note <- source_note[[1]]

  # Create the source notes block
  source_note_component <-
    paste0(
      "\\begin{minipage}{\\linewidth}\n",
      paste0(
        source_note %>% as.character(), "\\\\ \n", collapse = ""),
      "\\end{minipage}\n", collapse = "")

  source_note_component
}

# Function to build a vector of `group` rows in the table body
create_group_rows_l <- function(groups_rows_df,
                                n_rows) {

  unname(
    unlist(
      lapply(
        seq_len(n_rows),
        FUN = function(x) {
          if (!(x %in% groups_rows_df$row_start)) {
            return("")
          }

          latex_group_row(
            group_name = groups_rows_df[
              groups_rows_df$row_start == x, "group_label"][[1]],
            top_border = x != 1,
            bottom_border = x != n_rows
          )
        }
      )
    )
  )
}

create_group_dividers_l <- function(groups_rows_df,
                                    n_rows) {

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
create_summary_rows_l <- function(data,
                                  groups_rows_df,
                                  n_rows) {

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
            list_of_summaries$summary_df_display_list[[group_id]] %>%
            dplyr::select(.env$rowname_col_private, .env$default_vars)

          row_splits_summary <- split_row_content(summary_df)

          if (stub_width > 1) {

            row_splits_summary <-
              lapply(
                row_splits_summary,
                function(x) {

                  x <- c(rep("", stub_width - 1), x)

                  x[seq_len(stub_width)] <-
                    paste0("\\multicolumn{1}{r|}{", x[seq_len(stub_width)], "}")

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
            if (!("group_label" %in% stub_layout)) {
              summary_h_border
            } else {
              ""
            },
            summary_rows
          )
        }
      )
    )
  )
}

create_grand_summary_rows_l <- function(data) {

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
    list_of_summaries$summary_df_display_list[[grand_summary_col]] %>%
    dplyr::select(.env$rowname_col_private, .env$default_vars)

  row_splits_summary <- split_row_content(grand_summary_df)

  if (stub_width > 1) {

    row_splits_summary <-
      lapply(
        row_splits_summary,
        function(x) {
          x[[1]] <- paste0("\\multicolumn{", stub_width, "}{r|}{", x[1], "}")
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

  paste0(grand_summary_h_border, grand_summary_rows)
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
