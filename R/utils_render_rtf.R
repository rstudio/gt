# Transform a footnote mark to an RTF representation as a superscript
footnote_mark_to_rtf <- function(mark) {

  paste0("{\\super \\i ", mark, "}")
}

create_body_component_r <- function(data) {

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
  default_vars <- dt_boxhead_get_vars_default(data = data)

  if ("rowname" %in% names(body)) {
    default_vars <- c("rowname", default_vars)
  }

  # Determine whether the stub is available through analysis
  # of the `stub_components`
  if (is.null(stub_components)) {
    stub_available <- FALSE
  } else if (stub_component_is_groupname(stub_components)) {
    stub_available <- FALSE
  } else {
    stub_available <- TRUE
  }

  if (stub_available) {
    n_cols <- n_data_cols + 1
  } else {
    n_cols <- n_data_cols
  }

  # Split `body_content` by slices of rows and create data rows
  body_content <- as.vector(t(body[, default_vars]))
  row_splits <- split(body_content, ceiling(seq_along(body_content) / n_cols))

  body_rows <- c()
  for (i in seq_len(n_rows)) {

    # Process group rows
    if (!is.null(groups_rows_df) &&
        i %in% groups_rows_df$row) {

      body_rows <-
        c(body_rows,
          rtf_body_row(
            c(
              groups_rows_df[which(groups_rows_df$row %in% i), 1][[1]],
              rep("", n_cols - 1)), type = "group"))
    }

    # Process "data" rows
    if (i != length(row_splits)) {
      body_rows <-
        c(body_rows, rtf_body_row(row_splits[[i]], type = "row"))
    } else {
      body_rows <-
        c(body_rows, rtf_last_body_row(content = row_splits[[i]]))
    }

    # Process summary rows
    if (stub_available && summaries_present &&
        i %in% groups_rows_df$row_end) {

      group <-
        groups_rows_df %>%
        dplyr::filter(row_end == i) %>%
        dplyr::pull(group)

      if (group %in% names(list_of_summaries$summary_df_display_list)) {

        summary_df <-
          list_of_summaries$summary_df_display_list[[
            which(names(list_of_summaries$summary_df_display_list) == group)]] %>%
          as.data.frame(stringsAsFactors = FALSE)

        body_content_summary <-
          as.vector(t(summary_df)) %>%
          tidy_gsub("\u2014", "-")

        row_splits_summary <-
          split_body_content(
            body_content = body_content_summary,
            n_cols = n_cols)

        for (j in seq(length(row_splits_summary))) {

          body_rows <-
            c(body_rows, rtf_body_row(row_splits_summary[[j]], type = "row"))
        }
      }
    }
  }

  paste0(body_rows, collapse = "")
}

create_source_notes_component_r <- function(data) {

  source_notes <- dt_source_notes_get(data = data)

  # Create the source note rows and handle any available footnotes
  if (length(source_notes) != 0) {

    # Create a source note
    source_note_rows <-
      paste0(
        "\\pard\\pardeftab720\\sl288\\slmult1\\partightenfactor0\n",
        paste0(
          "\\cf0 \\strokec2 ", remove_html(text = source_notes), "\\\n",
          collapse = ""),
        collapse = "")
  } else {
    source_note_rows <- ""
  }

  source_note_rows
}

#' @noRd
create_footnotes_component_r <- function(data) {

  body <- dt_body_get(data = data)
  opts_df <- dt_options_get(data = data)
  footnotes_tbl <- dt_footnotes_get(data = data)

  # Get the column headings for the visible (e.g., `default`) columns
  default_vars <- dt_boxhead_get_vars_default(data = data)

  if ("rowname" %in% names(body)) {
    default_vars <- c("rowname", default_vars)
  }

  body_content <- as.vector(t(body[, default_vars]))

  # If the `footnotes_tbl` object has no
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
    dplyr::filter(parameter == "footnote_sep") %>%
    dplyr::pull(value)

  # Convert common HTML tags/entities to plaintext
  separator <-
    separator %>%
    tidy_gsub("<br\\s*?(/|)>", "\n") %>%
    tidy_gsub("&nbsp;", " ")

  # Create the footnotes block
  footnotes_component <-
    paste0(
      "\\pard\\pardeftab720\\sl288\\slmult1\\partightenfactor0\n",
      paste0(
        # "\\f2\\i\\fs14\\fsmilli7333 \\super \\strokec2 ", footnotes_tbl[["fs_id"]],
        # "\\f0\\i0\\fs22 \\nosupersub \\strokec2 ",
        footnote_mark_to_rtf(footnotes_tbl[["fs_id"]]),
        footnotes_tbl[["footnotes"]] %>% remove_html(), "\\",
        collapse = separator), "\n"
    )

  footnotes_component
}

#' @noRd
col_width_twips <- function() {
  935L
}

#' @noRd
rtf_head <- function() {

  paste0(
    "{\\rtf1\\ansi\\ansicpg1252\\cocoartf1561\\cocoasubrtf400\n",
    "{\\fonttbl\\f0\\fswiss\\fcharset0 Helvetica;}\n",
    "{\\colortbl;\\red255\\green255\\blue255;\n",
    "}\n",
    "{\\*\\expandedcolortbl;;\\cssrgb\\c0\\c0\\c0;\\cssrgb\\c37036\\c37036\\c37036;\\csgray\\c0\\c0;\n",
    "}\n",
    "\\deftab20\n",
    "\\cf0\n", collapse = "")
}

#' @noRd
rtf_title_subtitle <- function(title, subtitle, n_cols) {

  twips <- 1:n_cols * col_width_twips()

  paste0(
    "\\itap1\\trowd \\taflags1 \\trgaph108\\trleft-108 \\trbrdrt\\brdrnil \\trbrdrl\\brdrnil \\trbrdrr\\brdrnil\n",
    paste0("\\clmgf \\clvertalb \\clshdrawnil \\clheight340 \\clbrdrt\\brdrs\\brdrw40\\brdrcf3 \\clbrdrl\\brdrnil \\clbrdrb\\brdrnil \\clbrdrr\\brdrnil \\clpadl100 \\clpadr100 \\clpadt100 \\gaph\\cellx", twips[1], "\n"),
    paste0("\\clmrg \\clvertalb \\clshdrawnil \\clheight340 \\clbrdrt\\brdrs\\brdrw40\\brdrcf3 \\clbrdrl\\brdrnil \\clbrdrb\\brdrnil \\clbrdrr\\brdrnil \\clpadl100 \\clpadr100 \\clpadt100 \\gaph\\cellx", twips[2:length(twips)], "\n", collapse = ""),
    "\\pard\\intbl\\itap1\\pardeftab20\\qc\\partightenfactor0\n",
    "\\f0\\fs36 \\expnd0\\expndtw0\\kerning0\n",
    paste0("\\up0 \\nosupersub \\ulnone \\outl0\\strokewidth0 \\strokec2 ", title, "\n"),
    "\\fs24  \\kerning1\\expnd0\\expndtw0 \\up0 \\nosupersub \\ulnone \\outl0\\strokewidth0 \\cell\n",
    paste0(rep("\\pard\\intbl\\itap1\\cell\n", n_cols - 1), collapse = ""),
    "\\row\n\n",
    "\\itap1\\trowd \\taflags1 \\trgaph108\\trleft-108 \\trbrdrl\\brdrnil \\trbrdrr\\brdrnil\n",
    paste0("\\clmgf \\clvertalc \\clshdrawnil \\clheight240 \\clbrdrt\\brdrnil \\clbrdrl\\brdrnil \\clbrdrb\\brdrs\\brdrw40\\brdrcf3 \\clbrdrr\\brdrnil \\clpadl100 \\clpadr100 \\clpadb100 \\gaph\\cellx", twips[1], "\n"),
    paste0("\\clmrg \\clvertalc \\clshdrawnil \\clheight240 \\clbrdrt\\brdrnil \\clbrdrl\\brdrnil \\clbrdrb\\brdrs\\brdrw40\\brdrcf3 \\clbrdrr\\brdrnil \\clpadl100 \\clpadr100 \\clpadb100 \\gaph\\cellx", twips[2:length(twips)], "\n", collapse = ""),
    "\\pard\\intbl\\itap1\\pardeftab20\\qc\\partightenfactor0\n\n",
    "\\fs20 \\expnd0\\expndtw0\\kerning0",
    paste0("\\up0 \\nosupersub \\ulnone \\outl0\\strokewidth0 \\strokec2 ", subtitle, "\n"),
    "\\fs28  \\kerning1\\expnd0\\expndtw0 \\up0 \\nosupersub \\ulnone \\outl0\\strokewidth0 \\cell",
    paste0(rep("\\pard\\intbl\\itap1\\cell\n", n_cols - 1), collapse = ""),
    "\\row")
}

#' @noRd
rtf_title <- function(title, n_cols) {

  twips <- 1:n_cols * col_width_twips()

  paste0(
    "\\itap1\\trowd \\taflags1 \\trgaph108\\trleft-108 \\trbrdrt\\brdrnil \\trbrdrl\\brdrnil \\trbrdrr\\brdrnil\n",
    paste0("\\clmgf \\clvertalb \\clshdrawnil \\clheight340 \\clbrdrt\\brdrs\\brdrw40\\brdrcf3 \\clbrdrl\\brdrnil \\clbrdrb\\brdrs\\brdrw40\\brdrcf3 \\clbrdrr\\brdrnil \\clpadl100 \\clpadr100 \\clpadt100 \\clpadb100 \\gaph\\cellx", twips[1], "\n"),
    paste0("\\clmrg \\clvertalb \\clshdrawnil \\clheight340 \\clbrdrt\\brdrs\\brdrw40\\brdrcf3 \\clbrdrl\\brdrnil \\clbrdrb\\brdrs\\brdrw40\\brdrcf3 \\clbrdrr\\brdrnil \\clpadl100 \\clpadr100 \\clpadt100 \\clpadb100 \\gaph\\cellx", twips[2:length(twips)], "\n", collapse = ""),
    "\\pard\\intbl\\itap1\\pardeftab20\\qc\\partightenfactor0\n",
    "\\f0\\fs36 \\expnd0\\expndtw0\\kerning0\n",
    paste0("\\up0 \\nosupersub \\ulnone \\outl0\\strokewidth0 \\strokec2 ", title, "\n"),
    "\\fs24  \\kerning1\\expnd0\\expndtw0 \\up0 \\nosupersub \\ulnone \\outl0\\strokewidth0 \\cell\n",
    paste0(rep("\\pard\\intbl\\itap1\\cell\n", n_cols - 1), collapse = ""),
    "\\row\n\n")
}

#' @noRd
rtf_heading_group_row <- function(spanners_lengths,
                                  headings,
                                  spanners) {

  values <- spanners_lengths$values
  lengths <- spanners_lengths$lengths

  twips <- 1:sum(lengths) * col_width_twips()

  # Creation of Top Row

  output <- "\\itap1\\trowd \\taflags1 \\trgaph108\\trleft-108 \\trbrdrt\\brdrnil \\trbrdrl\\brdrnil \\trbrdrr\\brdrnil\n"

  for (i in seq(lengths)) {

    if (lengths[i] == 1 && values[i] %in% headings) {

      output <- c(output, "\\clvmgf \\clvertalc \\clshdrawnil \\clheight1100 \\clbrdrt\\brdrs\\brdrw40\\brdrcf3 \\clbrdrl\\brdrnil \\clbrdrb\\brdrs\\brdrw40\\brdrcf3 \\clbrdrr\\brdrs\\brdrw20\\brdrcf3 \\clpadl100 \\clpadr100 \\gaph\\cellx")

    } else if (lengths[i] > 1 && !(values[i] %in% headings)) {

      for (j in 1:lengths[i]) {

        if (j == 1) {
          output <- c(output, "\\clmgf \\clvertalc \\clshdrawnil \\clheight540 \\clbrdrt\\brdrs\\brdrw40\\brdrcf3 \\clbrdrl\\brdrs\\brdrw20\\brdrcf3 \\clbrdrb\\brdrs\\brdrw20\\brdrcf3 \\clbrdrr\\brdrs\\brdrw20\\brdrcf3 \\clpadl100 \\clpadr100 \\gaph\\cellx")
        }

        if (j != 1) {
          output <- c(output, "\\clmrg \\clvertalc \\clshdrawnil \\clheight540 \\clbrdrt\\brdrs\\brdrw40\\brdrcf3 \\clbrdrl\\brdrs\\brdrw20\\brdrcf3 \\clbrdrb\\brdrs\\brdrw20\\brdrcf3 \\clbrdrr\\brdrs\\brdrw20\\brdrcf3 \\clpadl100 \\clpadr100 \\gaph\\cellx")
        }
      }

    } else if (lengths[i] == 1 && !(values[i] %in% headings)) {

      output <- c(output, "\\clvertalc \\clshdrawnil \\clheight540 \\clbrdrt\\brdrs\\brdrw40\\brdrcf3 \\clbrdrl\\brdrs\\brdrw20\\brdrcf3 \\clbrdrb\\brdrs\\brdrw20\\brdrcf3 \\clbrdrr\\brdrs\\brdrw20\\brdrcf3 \\clpadl100 \\clpadr100 \\gaph\\cellx")
    }
  }

  for (i in 2:length(output)) {
    output[i] <- paste0(output[i], twips[i - 1], "\n")
  }

  for (i in seq(lengths)) {

    if (lengths[i] == 1 && values[i] %in% headings) {

      output <-
        c(output,
          "\\pard\\intbl\\itap1\\pardeftab20\\qc\\partightenfactor0\n",
          ifelse(i == 1, "\\f0\\fs24\n", ""),
          "\\expnd0\\expndtw0\\kerning0\n",
          "\\up0 \\nosupersub \\ulnone \\outl0\\strokewidth0 \\strokec2 \\b ", values[i], "\\b0  \\kerning1\\expnd0\\expndtw0 \\up0 \\nosupersub \\ulnone \\outl0\\strokewidth0 \\cell\n")

    } else if (lengths[i] > 1 && !(values[i] %in% headings)) {

      for (j in 1:lengths[i]) {

        if (j == 1) {
          output <-
            c(output,
              "\\pard\\intbl\\itap1\\pardeftab20\\qc\\partightenfactor0\n",
              ifelse(i == 1, "\\f0\\fs24\n", ""),
              "\\expnd0\\expndtw0\\kerning0\n",
              "\\up0 \\nosupersub \\ulnone \\outl0\\strokewidth0 \\strokec2 \\b ", values[i], "\\b0  \\kerning1\\expnd0\\expndtw0 \\up0 \\nosupersub \\ulnone \\outl0\\strokewidth0 \\cell\n")
        }

        if (j != 1) {
          output <- c(output, "\\pard\\intbl\\itap1\\cell\n")
        }
      }

    } else if (lengths[i] == 1 && !(values[i] %in% headings)) {

      output <-
        c(output,
          "\\pard\\intbl\\itap1\\pardeftab20\\qc\\partightenfactor0\n",
          ifelse(i == 1, "\\f0\\fs24\n", ""),
          "\\expnd0\\expndtw0\\kerning0\n",
          "\\up0 \\nosupersub \\ulnone \\outl0\\strokewidth0 \\strokec2 \\b ", values[i], "\\b0  \\kerning1\\expnd0\\expndtw0 \\up0 \\nosupersub \\ulnone \\outl0\\strokewidth0 \\cell\n")
    }
  }

  output <- c(output, "\\row\n")

  output <- paste0(output, collapse = "")

  # Creation of Bottom Row
  output_b <- "\\itap1\\trowd \\taflags1 \\trgaph108\\trleft-108 \\trbrdrl\\brdrnil \\trbrdrt\\brdrnil \\trbrdrr\\brdrnil\n"

  for (i in seq(lengths)) {

    if (lengths[i] == 1 && values[i] %in% headings) {

      output_b <- c(output_b, "\\clvmrg \\clvertalc \\clshdrawnil \\clheight1100 \\clbrdrt\\brdrs\\brdrw40\\brdrcf3 \\clbrdrl\\brdrnil \\clbrdrb\\brdrs\\brdrw40\\brdrcf3 \\clbrdrr\\brdrnil \\clpadl100 \\clpadr100 \\gaph\\cellx")

    } else if (lengths[i] > 1 && !(values[i] %in% headings)) {

      for (j in 1:lengths[i]) {

        if (j == 1) {
          output_b <- c(output_b, "\\clvertalc \\clshdrawnil \\clheight540 \\clbrdrt\\brdrs\\brdrw20\\brdrcf3 \\clbrdrl\\brdrs\\brdrw20\\brdrcf3 \\clbrdrb\\brdrs\\brdrw40\\brdrcf3 \\clbrdrr\\brdrnil \\clpadl100 \\clpadr100 \\gaph\\cellx")
        }

        if (j > 1 & j < lengths[i]) {
          output_b <- c(output_b, "\\clvertalc \\clshdrawnil \\clheight540 \\clbrdrt\\brdrs\\brdrw20\\brdrcf3 \\clbrdrl\\brdrnil \\clbrdrb\\brdrs\\brdrw40\\brdrcf3 \\clbrdrr\\brdrnil \\clpadl100 \\clpadr100 \\gaph\\cellx")
        }

        if (j == lengths[i]) {
          output_b <- c(output_b, "\\clvertalc \\clshdrawnil \\clheight540 \\clbrdrt\\brdrs\\brdrw20\\brdrcf3 \\clbrdrl\\brdrnil \\clbrdrb\\brdrs\\brdrw40\\brdrcf3 \\clbrdrr\\brdrs\\brdrw20\\brdrcf3 \\clpadl100 \\clpadr100 \\gaph\\cellx")
        }
      }

    } else if (lengths[i] == 1 && !(values[i] %in% headings)) {

      output_b <- c(output_b, "\\clvertalc \\clshdrawnil \\clheight540 \\clbrdrt\\brdrs\\brdrw20\\brdrcf3 \\clbrdrl\\brdrs\\brdrw20\\brdrcf3 \\clbrdrb\\brdrs\\brdrw40\\brdrcf3 \\clbrdrr\\brdrs\\brdrw20\\brdrcf3 \\clpadl100 \\clpadr100 \\gaph\\cellx")
    }
  }

  for (i in 2:length(output_b)) {
    output_b[i] <- paste0(output_b[i], twips[i - 1], "\n")
  }

  for (i in seq(headings)) {

    if (headings[i] == spanners[i]) {

      output_b <- c(output_b, "\\pard\\intbl\\itap1\\cell\n")

    } else if (headings[i] != spanners[i] && sum(spanners == spanners[i]) > 1) {

      output_b <-
        c(output_b,
          "\\pard\\intbl\\itap1\\pardeftab20\\qc\\partightenfactor0\n",
          "\\expnd0\\expndtw0\\kerning0\n",
          "\\up0 \\nosupersub \\ulnone \\outl0\\strokewidth0 \\strokec2 \\b ", headings[i], "\\b0  \\kerning1\\expnd0\\expndtw0 \\up0 \\nosupersub \\ulnone \\outl0\\strokewidth0 \\cell\n")

    } else if (headings[i] != spanners[i] && sum(spanners == spanners[i]) == 1) {

      output_b <-
        c(output_b,
          "\\pard\\intbl\\itap1\\pardeftab20\\qc\\partightenfactor0\n",
          "\\expnd0\\expndtw0\\kerning0\n",
          "\\up0 \\nosupersub \\ulnone \\outl0\\strokewidth0 \\strokec2 \\b ", headings[i], "\\b0  \\kerning1\\expnd0\\expndtw0 \\up0 \\nosupersub \\ulnone \\outl0\\strokewidth0 \\expnd0\\expndtw0\\kerning0\n",
          "\\up0 \\nosupersub \\ulnone \\outl0\\strokewidth0 \\strokec2 \\cell\n")
    }
  }

  output_b <- c(output_b, "\\row\n")
  output_b <- paste0(output_b, collapse = "")

  paste0(output, output_b, collapse = "")
}

#' @noRd
rtf_heading_row <- function(content) {

  twips <- 1:length(content) * col_width_twips()

  paste0(
    paste0(
      "\\itap1\\trowd \\taflags1 \\trgaph108\\trleft-108 \\trbrdrl\\brdrnil \\trbrdrr\\brdrnil\n",
      paste0("\\clvertalc \\clshdrawnil \\clheight520 \\clbrdrt\\brdrs\\brdrw40\\brdrcf3 \\clbrdrl\\brdrnil \\clbrdrb\\brdrs\\brdrw40\\brdrcf3 \\clbrdrr\\brdrnil \\clpadl100 \\clpadr100 \\gaph\\cellx", twips, "\n", collapse = ""),
      paste0(
        "\\pard\\intbl\\itap1\\pardeftab20\\qc\\partightenfactor0\n",
        "\\expnd0\\expndtw0\\kerning0\n",
        "\\up0 \\nosupersub \\ulnone \\outl0\\strokewidth0 \\strokec2 ", content, " \\kerning1\\expnd0\\expndtw0 \\up0 \\nosupersub \\ulnone \\outl0\\strokewidth0 \\cell\n", collapse = ""),
      collapse = ""),
    " \\row")
}

#' @noRd
rtf_body_row <- function(content,
                         type) {

  twips <- 1:length(content) * col_width_twips()

  if (type == "row") {

    return(
      paste0(
        paste0(
          "\\itap1\\trowd \\taflags1 \\trgaph108\\trleft-108 \\trbrdrl\\brdrnil \\trbrdrr\\brdrnil\n",
          paste0("\\clvertalc \\clshdrawnil \\clbrdrt\\brdrnil \\clbrdrl\\brdrnil \\clbrdrb\\brdrnil \\clbrdrr\\brdrnil \\clpadl100 \\clpadr100 \\clpadt50 \\clpadb50 \\gaph\\cellx", twips, "\n", collapse = ""),
          paste0(
            "\\pard\\intbl\\itap1\\pardeftab20\\qc\\partightenfactor0\n",
            "\\expnd0\\expndtw0\\kerning0\n",
            "\\up0 \\nosupersub \\ulnone \\outl0\\strokewidth0 \\strokec2 ", content, " \\kerning1\\expnd0\\expndtw0 \\up0 \\nosupersub \\ulnone \\outl0\\strokewidth0 \\cell\n", collapse = ""),
          collapse = ""),
        " \\row"))

  } else if (type == "group") {

    return(
      paste0(
        paste0(
          "\\itap1\\trowd \\taflags1 \\trgaph108\\trleft-108 \\trbrdrl\\brdrnil \\trbrdrr\\brdrnil\n",
          paste0("\\clvertalc \\clshdrawnil \\clbrdrt\\brdrs\\brdrw40\\brdrcf3 \\clbrdrl\\brdrnil \\clbrdrb\\brdrs\\brdrw10\\brdrcf3 \\clbrdrr\\brdrnil \\clpadl100 \\clpadr100 \\clpadt50 \\clpadb50 \\gaph\\cellx", twips, "\n", collapse = ""),
          paste0(
            "\\pard\\intbl\\itap1\\pardeftab20\\ql\\partightenfactor0\n",
            "\\expnd0\\expndtw0\\kerning0\n",
            "\\up0 \\nosupersub \\ulnone \\outl0\\strokewidth0 \\strokec2 \\b ", content, "\\b0  \\kerning1\\expnd0\\expndtw0 \\up0 \\nosupersub \\ulnone \\outl0\\strokewidth0 \\cell\n", collapse = ""),
          collapse = ""),
        " \\row"))
  }
}

#' @noRd
rtf_last_body_row <- function(content) {

  twips <- 1:length(content) * col_width_twips()

  output <-
    paste0(
      "\\itap1\\trowd \\taflags1 \\trgaph108\\trleft-108 \\trbrdrl\\brdrnil \\trbrdrr\\brdrnil\n",
      paste0("\\clvertalc \\clshdrawnil \\clbrdrt\\brdrnil \\clbrdrl\\brdrnil \\clbrdrb\\brdrs\\brdrw40\\brdrcf3 \\clbrdrr\\brdrnil \\clpadl100 \\clpadr100 \\clpadt50 \\clpadb50 \\gaph\\cellx", twips, "\n", collapse = ""))

  for (i in seq(content)) {

    if (i != length(content)) {
      output <-
        c(output,
          paste0(
            "\\pard\\intbl\\itap1\\pardeftab20\\qc\\partightenfactor0\n",
            "\\expnd0\\expndtw0\\kerning0\n",
            "\\up0 \\nosupersub \\ulnone \\outl0\\strokewidth0 \\strokec2 ", content[i], " \\kerning1\\expnd0\\expndtw0 \\up0 \\nosupersub \\ulnone \\outl0\\strokewidth0 \\cell\n"))

    } else {
      output <-
        c(output,
          paste0(
            "\\pard\\intbl\\itap1\\pardeftab20\\qc\\partightenfactor0\n",
            "\\expnd0\\expndtw0\\kerning0\n",
            "\\up0 \\nosupersub \\ulnone \\outl0\\strokewidth0 \\strokec2 ", content[i], " \\kerning1\\expnd0\\expndtw0 \\up0 \\nosupersub \\ulnone \\outl0\\strokewidth0\\expnd0\\expndtw0\\kerning0\n",
            "\\up0 \\nosupersub \\ulnone \\outl0\\strokewidth0 \\strokec2 \\cell \\lastrow\\row"))
    }
  }

  output <- paste(output, collapse = "")

  output
}

#' Split the body content vector into a list structure
#'
#' Taking the `body_content` vector, split into list components with one item
#' per row in the output table
#' @noRd
split_body_content <- function(body_content,
                               n_cols) {

  if (length(body_content) == 0) {
    return(list(rep("", n_cols)))
  }

  split(body_content, ceiling(seq_along(body_content) / n_cols))
}


create_columns_component_r <- function(data) {

  boxh <- dt_boxhead_get(data = data)
  stubh <- dt_stubhead_get(data = data)
  stub_available <- dt_stub_df_exists(data = data)
  spanners_present <- dt_spanners_exists(data = data)

  headings_vars <- boxh %>% dplyr::filter(type == "default") %>% dplyr::pull(var)
  headings_labels <- dt_boxhead_get_vars_labels_default(data = data)

  # If `stub_available` == TRUE, then replace with a set stubhead
  # label or nothing
  if (isTRUE(stub_available) && length(stubh$label) > 0) {

    headings_labels <- prepend_vec(headings_labels, stubh$label)
    headings_vars <- prepend_vec(headings_vars, "::stub")

  } else if (isTRUE(stub_available)) {

    headings_labels <- prepend_vec(headings_labels, "")
    headings_vars <- prepend_vec(headings_vars, "::stub")
  }

  # Remove any HTML tags from `headings`
  headings_labels <- remove_html(headings_labels)

  if (spanners_present == FALSE) {

    columns_component <-
      paste0(rtf_heading_row(content = headings_labels), collapse = "")

  } else {

    # spanners
    spanners <- dt_spanners_print(data = data, include_hidden = FALSE)

    # Promote column labels to the group level wherever the
    # spanner label is NA
    spanners[is.na(spanners)] <- headings_vars[is.na(spanners)]

    # Remove any HTML tags from `spanners`
    spanners <- remove_html(spanners)

    if (stub_available) {
      spanners <- c(NA_character_, spanners)
    }

    # for (i in seq(spanners)) {
    #   if (is.na(spanners[i])) {
    #     spanners[i] <- headings[i]
    #   }
    # }

    spanners_lengths <- rle(spanners)

    columns_component <-
      rtf_heading_group_row(
        spanners_lengths = spanners_lengths,
        headings = headings_labels,
        spanners = spanners
      )
  }

  columns_component
}
