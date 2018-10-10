#' @importFrom stats setNames
#' @noRd
create_footnote_component_rtf <- function(footnotes_resolved,
                                          opts_df,
                                          body_content) {

  # If the `footnotes_resolved` object has no
  # rows, then return an empty footnotes component
  if (nrow(footnotes_resolved) == 0) {
    return("")
  }

  glyphs_footnotes <- c()

  for (i in seq(list_footnotes$footnotes)) {

    if (any(!is.na(list_footnotes$footnotes[[i]]))) {

      footnote_glyph <- c()
      footnote_indices <- list_footnotes$footnotes[[i]]

      for (j in seq(footnote_indices)) {

        footnote_text <-
          data_attr$footnote[[1]][
            which(names(data_attr$footnote[[1]]) == footnote_indices[j])] %>%
          unname()

        # Check if the footnote text has been seen before
        if (!(footnote_text %in% glyphs_footnotes)) {
          glyphs_footnotes <-
            c(glyphs_footnotes, stats::setNames(footnote_text, footnote_indices[j]))
        }

        footnote_glyph <-
          c(footnote_glyph, unname(which(glyphs_footnotes == footnote_text)))
      }

      body_content[i] <-
        paste0(body_content[i], " (", paste(footnote_glyph, collapse = ","), ")")
    }
  }

  # Create the footnotes block
  footnote_component <-
    paste0(
      "\\pard\\pardeftab720\\sl288\\slmult1\\partightenfactor0\n",
      paste0(
        "\\f2\\i\\fs14\\fsmilli7333 \\cf2 \\super \\strokec2 ", seq(glyphs_footnotes),
        "\\f0\\i0\\fs22 \\cf2 \\nosupersub \\strokec2  ",
        unname(glyphs_footnotes) %>% remove_html(), "\\",
        collapse = "\n"), "\n")

  list(footnote_component = footnote_component,
       body_content = body_content)
}

#' @noRd
col_width_twips <- function() {
  1080L
}

#' @noRd
rtf_head <- function() {

  paste0(
    "{\\rtf1\\ansi\\ansicpg1252\\cocoartf1561\\cocoasubrtf400\n",
    "{\\fonttbl\\f0\\fswiss\\fcharset0 Helvetica;}\n",
    "{\\colortbl;\\red255\\green255\\blue255;\\red0\\green0\\blue0;\\red76\\green76\\blue76;\\red0\\green0\\blue0;\n",
    "}\n",
    "{\\*\\expandedcolortbl;;\\cssrgb\\c0\\c0\\c0;\\cssrgb\\c37036\\c37036\\c37036;\\csgray\\c0\\c0;\n",
    "}\n",
    "\\deftab20\n\n", collapse = "")
}

#' @noRd
rtf_title_headnote <- function(title, headnote, n_cols) {

  twips <- 1:n_cols * col_width_twips()

  paste0(
    "\\itap1\\trowd \\taflags1 \\trgaph108\\trleft-108 \\trbrdrt\\brdrnil \\trbrdrl\\brdrnil \\trbrdrr\\brdrnil\n",
    paste0("\\clmgf \\clvertalb \\clshdrawnil \\clheight340 \\clbrdrt\\brdrs\\brdrw40\\brdrcf3 \\clbrdrl\\brdrnil \\clbrdrb\\brdrnil \\clbrdrr\\brdrnil \\clpadl100 \\clpadr100 \\clpadt100 \\gaph\\cellx", twips[1], "\n"),
    paste0("\\clmrg \\clvertalb \\clshdrawnil \\clheight340 \\clbrdrt\\brdrs\\brdrw40\\brdrcf3 \\clbrdrl\\brdrnil \\clbrdrb\\brdrnil \\clbrdrr\\brdrnil \\clpadl100 \\clpadr100 \\clpadt100 \\gaph\\cellx", twips[2:length(twips)], "\n", collapse = ""),
    "\\pard\\intbl\\itap1\\pardeftab20\\qc\\partightenfactor0\n",
    "\\f0\\fs36 \\cf2 \\expnd0\\expndtw0\\kerning0\n",
    paste0("\\up0 \\nosupersub \\ulnone \\outl0\\strokewidth0 \\strokec2 ", title, "\n"),
    "\\fs24 \\cf0 \\kerning1\\expnd0\\expndtw0 \\up0 \\nosupersub \\ulnone \\outl0\\strokewidth0 \\cell\n",
    paste0(rep("\\pard\\intbl\\itap1\\cell\n", n_cols - 1), collapse = ""),
    "\\row\n\n",
    "\\itap1\\trowd \\taflags1 \\trgaph108\\trleft-108 \\trbrdrl\\brdrnil \\trbrdrr\\brdrnil\n",
    paste0("\\clmgf \\clvertalc \\clshdrawnil \\clheight240 \\clbrdrt\\brdrnil \\clbrdrl\\brdrnil \\clbrdrb\\brdrs\\brdrw40\\brdrcf3 \\clbrdrr\\brdrnil \\clpadl100 \\clpadr100 \\clpadb100 \\gaph\\cellx", twips[1], "\n"),
    paste0("\\clmrg \\clvertalc \\clshdrawnil \\clheight240 \\clbrdrt\\brdrnil \\clbrdrl\\brdrnil \\clbrdrb\\brdrs\\brdrw40\\brdrcf3 \\clbrdrr\\brdrnil \\clpadl100 \\clpadr100 \\clpadb100 \\gaph\\cellx", twips[2:length(twips)], "\n", collapse = ""),
    "\\pard\\intbl\\itap1\\pardeftab20\\qc\\partightenfactor0\n\n",
    "\\fs20 \\cf2 \\expnd0\\expndtw0\\kerning0",
    paste0("\\up0 \\nosupersub \\ulnone \\outl0\\strokewidth0 \\strokec2 ", headnote, "\n"),
    "\\fs28 \\cf0 \\kerning1\\expnd0\\expndtw0 \\up0 \\nosupersub \\ulnone \\outl0\\strokewidth0 \\cell",
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
    "\\f0\\fs36 \\cf2 \\expnd0\\expndtw0\\kerning0\n",
    paste0("\\up0 \\nosupersub \\ulnone \\outl0\\strokewidth0 \\strokec2 ", title, "\n"),
    "\\fs24 \\cf0 \\kerning1\\expnd0\\expndtw0 \\up0 \\nosupersub \\ulnone \\outl0\\strokewidth0 \\cell\n",
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
          "\\cf2 \\expnd0\\expndtw0\\kerning0\n",
          "\\up0 \\nosupersub \\ulnone \\outl0\\strokewidth0 \\strokec2 \\b ", values[i], "\\b0 \\cf0 \\kerning1\\expnd0\\expndtw0 \\up0 \\nosupersub \\ulnone \\outl0\\strokewidth0 \\cell\n")

    } else if (lengths[i] > 1 && !(values[i] %in% headings)) {

      for (j in 1:lengths[i]) {

        if (j == 1) {
          output <-
            c(output,
              "\\pard\\intbl\\itap1\\pardeftab20\\qc\\partightenfactor0\n",
              ifelse(i == 1, "\\f0\\fs24\n", ""),
              "\\cf2 \\expnd0\\expndtw0\\kerning0\n",
              "\\up0 \\nosupersub \\ulnone \\outl0\\strokewidth0 \\strokec2 \\b ", values[i], "\\b0 \\cf0 \\kerning1\\expnd0\\expndtw0 \\up0 \\nosupersub \\ulnone \\outl0\\strokewidth0 \\cell\n")
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
          "\\cf2 \\expnd0\\expndtw0\\kerning0\n",
          "\\up0 \\nosupersub \\ulnone \\outl0\\strokewidth0 \\strokec2 \\b ", values[i], "\\b0 \\cf0 \\kerning1\\expnd0\\expndtw0 \\up0 \\nosupersub \\ulnone \\outl0\\strokewidth0 \\cell\n")
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
          "\\cf2 \\expnd0\\expndtw0\\kerning0\n",
          "\\up0 \\nosupersub \\ulnone \\outl0\\strokewidth0 \\strokec2 \\b ", headings[i], "\\b0 \\cf0 \\kerning1\\expnd0\\expndtw0 \\up0 \\nosupersub \\ulnone \\outl0\\strokewidth0 \\cell\n")

    } else if (headings[i] != spanners[i] && sum(spanners == spanners[i]) == 1) {

      output_b <-
        c(output_b,
          "\\pard\\intbl\\itap1\\pardeftab20\\qc\\partightenfactor0\n",
          "\\cf2 \\expnd0\\expndtw0\\kerning0\n",
          "\\up0 \\nosupersub \\ulnone \\outl0\\strokewidth0 \\strokec2 \\b ", headings[i], "\\b0 \\cf0 \\kerning1\\expnd0\\expndtw0 \\up0 \\nosupersub \\ulnone \\outl0\\strokewidth0 \\cf2 \\expnd0\\expndtw0\\kerning0\n",
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
        "\\cf2 \\expnd0\\expndtw0\\kerning0\n",
        "\\up0 \\nosupersub \\ulnone \\outl0\\strokewidth0 \\strokec2 ", content, "\\cf0 \\kerning1\\expnd0\\expndtw0 \\up0 \\nosupersub \\ulnone \\outl0\\strokewidth0 \\cell\n", collapse = ""),
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
            "\\cf2 \\expnd0\\expndtw0\\kerning0\n",
            "\\up0 \\nosupersub \\ulnone \\outl0\\strokewidth0 \\strokec2 ", content, "\\cf0 \\kerning1\\expnd0\\expndtw0 \\up0 \\nosupersub \\ulnone \\outl0\\strokewidth0 \\cell\n", collapse = ""),
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
            "\\cf2 \\expnd0\\expndtw0\\kerning0\n",
            "\\up0 \\nosupersub \\ulnone \\outl0\\strokewidth0 \\strokec2 \\b ", content, "\\b0 \\cf0 \\kerning1\\expnd0\\expndtw0 \\up0 \\nosupersub \\ulnone \\outl0\\strokewidth0 \\cell\n", collapse = ""),
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
            "\\cf2 \\expnd0\\expndtw0\\kerning0\n",
            "\\up0 \\nosupersub \\ulnone \\outl0\\strokewidth0 \\strokec2 ", content[i], "\\cf0 \\kerning1\\expnd0\\expndtw0 \\up0 \\nosupersub \\ulnone \\outl0\\strokewidth0 \\cell\n"))

    } else {
      output <-
        c(output,
          paste0(
            "\\pard\\intbl\\itap1\\pardeftab20\\qc\\partightenfactor0\n",
            "\\cf2 \\expnd0\\expndtw0\\kerning0\n",
            "\\up0 \\nosupersub \\ulnone \\outl0\\strokewidth0 \\strokec2 ", content[i], "\\cf0 \\kerning1\\expnd0\\expndtw0 \\up0 \\nosupersub \\ulnone \\outl0\\strokewidth0\\cf2 \\expnd0\\expndtw0\\kerning0\n",
            "\\up0 \\nosupersub \\ulnone \\outl0\\strokewidth0 \\strokec2 \\cell \\lastrow\\row"))
    }
  }

  output <- paste(output, collapse = "")

  output
}
