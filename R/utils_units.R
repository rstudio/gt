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


# Render a `units_definition` object to an HTML string
render_units <- function(units_object, context = "html") {

  for (i in seq_along(units_object)) {

    units_str_i <- ""

    units_object_i <- units_object[[i]]
    unit <- units_object_i[["unit"]]
    unit_subscript <- units_object_i[["unit_subscript"]]
    exponent <- units_object_i[["exponent"]]
    sub_super_overstrike <- units_object_i[["sub_super_overstrike"]]
    chemical_formula <- units_object_i[["chemical_formula"]]

    if (context == "latex") {
      unit <- escape_latex(unit)
      unit_subscript <- escape_latex(unit_subscript)
      exponent <- escape_latex(exponent)
    }

    if (
      context %in% c("html", "latex") &&
      grepl("x10", unit) &&
      !chemical_formula
    ) {
      unit <- gsub("x", "&times;", unit)
    }

    unit <- units_symbol_replacements(text = unit, context = context)

    # Process Markdown for different components
    if (!is.na(unit) && nchar(unit) > 2 && grepl("*", unit)) {

      if (context == "html") {
        unit <- commonmark::markdown_html(text = unit)
        unit <- gsub("^<p>|</p>\n$", "", unit)
      } else if (context == "latex") {
        unit <- commonmark::markdown_latex(text = unit)
        unit <- gsub("\n$", "", unit)
      } else if (context == "rtf") {
        unit <- markdown_to_rtf(text = unit)
      }
    }

    if (!is.na(unit_subscript) && nchar(unit_subscript) > 2 && grepl("*", unit_subscript)) {

      if (context == "html") {
        unit_subscript <- commonmark::markdown_html(text = unit_subscript)
        unit_subscript <- gsub("^<p>|</p>\n$", "", unit_subscript)
      } else if (context == "latex") {
        unit_subscript <- commonmark::markdown_latex(text = unit_subscript)
        unit_subscript <- gsub("\n$", "", unit_subscript)
      } else if (context == "rtf") {
        unit_subscript <- markdown_to_rtf(text = unit_subscript)
      }
    }

    if (!is.na(exponent) && nchar(exponent) > 2 && grepl("*", exponent)) {

      if (context == "html") {
        exponent <- commonmark::markdown_html(text = exponent)
        exponent <- gsub("^<p>|</p>\n$", "", exponent)
      } else if (context == "latex") {
        exponent <- commonmark::markdown_latex(text = exponent)
        exponent <- gsub("\n$", "", exponent)
      } else if (context == "rtf") {
        exponent <- markdown_to_rtf(text = exponent)
      }
    }

    units_str_i <- paste0(units_str_i, unit)

    # Overstriking of subscripts and superscripts is only possible
    # for the `"html"` context; deactivate this for any other context
    if (sub_super_overstrike && context != "html") {
      sub_super_overstrike <- FALSE
    }

    if (
      sub_super_overstrike &&
      !is.na(unit_subscript) &&
      !is.na(exponent)
    ) {

      if (context == "html") {
        exponent <- gsub("-", "&minus;", exponent)
      } else if (context == "latex") {
        exponent <- gsub("-", "--", exponent)
      }

      units_str_i <-
        paste0(
          units_str_i,
          units_html_sub_super(
            content_sub = unit_subscript,
            content_sup = exponent
          )
        )

    } else if (chemical_formula) {

      if (context == "html") {

        units_str_i <-
          gsub(
            "(\\d+)",
            "<span style=\"white-space:nowrap;\"><sub>\\1</sub></span>",
            units_str_i
          )

      } else if (context == "latex") {
        units_str_i <- gsub("(\\d+)", "\\\\textsubscript\\{\\1\\}", units_str_i)
      }

    } else {

      if (!is.na(unit_subscript)) {

        unit_subscript <-
          units_to_subscript(content = unit_subscript, context = context)

        units_str_i <- paste0(units_str_i, unit_subscript)
      }

      if (!is.na(exponent)) {

        if (context == "html") {
          exponent <- gsub("-", "&minus;", exponent)
        } else if (context == "latex") {
          exponent <- gsub("-", "--", exponent)
        }

        exponent <- units_to_superscript(content = exponent, context = context)

        units_str_i <- paste0(units_str_i, exponent)
      }
    }

    units_object[[i]][["built"]] <- units_str_i
  }

  units_str <- ""

  for (i in seq_along(units_object)) {

    unit_add <- units_object[[i]][["built"]]

    if (grepl("\\($|\\[$", units_str) || grepl("^\\)|^\\]", unit_add)) {
      spacer <- ""
    } else {
      spacer <- " "
    }

    # Treat special case where two simple units on both sides of a solidus
    # should have no extra spacing (e.g., 'm / s' -> 'm/s')
    if (length(units_object) == 3 && units_object[[2]][["unit"]] == "/") {
      spacer <- ""
    }

    units_str <- paste0(units_str, spacer, unit_add)
  }

  units_str <- gsub("^\\s+|\\s+$", "", units_str)

  units_str
}

units_to_superscript <- function(content, context = "html") {

  if (context == "html") {

    out <-
      paste0(
        "<span style=\"white-space:nowrap;\">",
        "<sup>", content, "</sup>",
        "</span>"
      )
  }

  if (context == "latex") {
    out <- paste0("\\textsuperscript{", content, "}")
  }

  if (context == "rtf") {
    out <- paste0("\\super ", content, " \\nosupersub")
  }

  if (context == "word") {

    out <-
      as.character(
        xml_r(
          xml_rPr(
            xml_baseline_adj(
              v_align = "superscript"
            )
          ),
          xml_t(content)
        )
      )
  }

  out
}

units_to_subscript <- function(content, context = "html") {

  if (context == "html") {

    out <-
      paste0(
        "<span style=\"white-space:nowrap;\">",
        "<sub>", content, "</sub>",
        "</span>"
      )
  }

  if (context == "latex") {
    out <- paste0("\\textsubscript{", content, "}")
  }

  if (context == "rtf") {
    out <- paste0("\\sub ", content, " \\nosupersub")
  }

  if (context == "word") {

    out <-
      as.character(
        xml_r(
          xml_rPr(
            xml_baseline_adj(
              v_align = "subscript"
            )
          ),
          xml_t(content)
        )
      )
  }

  out
}

units_html_sub_super <- function(content_sub, content_sup) {

  paste0(
    "<span style=\"",
    "display:inline-block;",
    "line-height:1em;",
    "text-align:left;",
    "font-size:60%;",
    "vertical-align:-0.25em;",
    "margin-left:0.1em;",
    "\">",
    content_sup,
    "<br>",
    content_sub,
    "</span>"
  )
}

units_symbol_replacements <- function(
    text,
    context = "html"
) {

  if (context == "html") {
    text <- replace_units_symbol(text, "^-", "^-", "&minus;")
  }

  if (context == "latex") {
    text <- replace_units_symbol(text, "^-", "^-", "--")
  }

  if (context %in% c("html", "rtf")) {

    text <- replace_units_symbol(text, "^um$", "um", "&micro;m")
    text <- replace_units_symbol(text, "^uL$", "uL", "&micro;L")
    text <- replace_units_symbol(text, "^umol", "^umol", "&micro;mol")
    text <- replace_units_symbol(text, "^ug$", "ug", "&micro;g")
    text <- replace_units_symbol(text, ":micro:", ":micro:", "&micro;")
    text <- replace_units_symbol(text, ":mu:", ":mu:", "&micro;")
    text <- replace_units_symbol(text, "^ohm$", "ohm", "&#8486;")
    text <- replace_units_symbol(text, ":ohm:", ":ohm:", "&#8486;")
    text <- replace_units_symbol(text, ":angstrom:", ":angstrom:", "&#8491;")
    text <- replace_units_symbol(text, ":times:", ":times:", "&times;")
    text <- replace_units_symbol(text, ":plusminus:", ":plusminus:", "&plusmn;")
    text <- replace_units_symbol(text, ":permil:", ":permil:", "&permil;")
    text <- replace_units_symbol(text, ":permille:", ":permille:", "&permil;")
    text <- replace_units_symbol(text, ":degree:", ":degree:", "&deg;")
    text <- replace_units_symbol(text, ":degrees:", ":degrees:", "&deg;")
    text <- replace_units_symbol(text, "degC", "degC", "&deg;C")
    text <- replace_units_symbol(text, "degF", "degF", "&deg;F")
    text <- replace_units_symbol(text, ":space:", ":space:", "&nbsp;")
  }

  if (context == "latex") {

    text <- replace_units_symbol(text, "^um$", "um", "&micro;m")
    text <- replace_units_symbol(text, "^uL$", "uL", "&micro;L")
    text <- replace_units_symbol(text, "^umol", "^umol", "&micro;mol")
    text <- replace_units_symbol(text, "^ug$", "ug", "&micro;g")
    text <- replace_units_symbol(text, ":micro:", ":micro:", "&micro;")
    text <- replace_units_symbol(text, ":mu:", ":mu:", "&micro;")
    text <- replace_units_symbol(text, "^ohm$", "ohm", "&#8486;")
    text <- replace_units_symbol(text, ":ohm:", ":ohm:", "&#8486;")
    text <- replace_units_symbol(text, ":times:", ":times:", "&times;")
    text <- replace_units_symbol(text, ":plusminus:", ":plusminus:", "&plusmn;")
    text <- replace_units_symbol(text, ":permil:", ":permil:", "&permil;")
    text <- replace_units_symbol(text, ":permille:", ":permille:", "&permil;")
    text <- replace_units_symbol(text, ":degree:", ":degree:", "&deg;")
    text <- replace_units_symbol(text, ":degrees:", ":degrees:", "&deg;")
    text <- replace_units_symbol(text, "degC", "degC", "&deg;C")
    text <- replace_units_symbol(text, "degF", "degF", "&deg;F")
    text <- replace_units_symbol(text, ":space:", ":space:", "&nbsp;")
  }

  if (context == "word") {

    text <- replace_units_symbol(text, "^um$", "um", paste0("\U003BC", "m"))
    text <- replace_units_symbol(text, "^uL$", "uL", paste0("\U003BC", "L"))
    text <- replace_units_symbol(text, "^umol", "^umol", paste0("\U003BC", "mol"))
    text <- replace_units_symbol(text, "^ug$", "ug", paste0("\U003BC", "g"))
    text <- replace_units_symbol(text, ":micro:", ":micro:", "\U003BC")
    text <- replace_units_symbol(text, ":mu:", ":mu:", "\U003BC")
    text <- replace_units_symbol(text, "^ohm$", "ohm", "\U02126")
    text <- replace_units_symbol(text, ":ohm:", ":ohm:", "\U02126")
    text <- replace_units_symbol(text, ":times:", ":times:", "\U000D7")
    text <- replace_units_symbol(text, ":plusminus:", ":plusminus:", "\U000B1")
    text <- replace_units_symbol(text, ":permil:", ":permil:", "\U00089")
    text <- replace_units_symbol(text, ":permille:", ":permille:", "\U00089")
    text <- replace_units_symbol(text, ":degree:", ":degree:", "\U000B0")
    text <- replace_units_symbol(text, ":degrees:", ":degrees:", "\U000B0")
    text <- replace_units_symbol(text, "degC", "degC", paste0("\U000B0", "C"))
    text <- replace_units_symbol(text, "degF", "degF", paste0("\U000B0", "F"))
    text <- replace_units_symbol(text, ":space:", ":space:", " ")
  }

  text
}

replace_units_symbol <- function(text, detect, pattern, replace) {
  if (grepl(detect, text)) text <- gsub(pattern, replace, text)
  text
}
