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
units_to_html <- function(units_object) {

  for (i in seq_along(units_object)) {

    units_str_i <- ""

    units_object_i <- units_object[[i]]
    unit <- units_object_i[["unit"]]
    unit_subscript <- units_object_i[["unit_subscript"]]
    exponent <- units_object_i[["exponent"]]
    sub_super_overstrike <- units_object_i[["sub_super_overstrike"]]
    chemical_formula <- units_object_i[["chemical_formula"]]

    if (grepl("x10", unit) && !chemical_formula) {
      unit <- gsub("x", "&times;", unit)
    }

    if (grepl("^-", unit)) {
      unit <- gsub("^-", "&minus;", unit)
    }

    if (grepl("^um$", unit)) {
      unit <- gsub("um", "&micro;m", unit)
    }
    if (grepl("^uL$", unit)) {
      unit <- gsub("uL", "&micro;L", unit)
    }
    if (grepl("^umol$", unit)) {
      unit <- gsub("umol", "&micro;mol", unit)
    }
    if (grepl("^ug$", unit)) {
      unit <- gsub("ug", "&micro;g", unit)
    }
    if (grepl(":micro:", unit)) {
      unit <- gsub(":micro:", "&micro;", unit)
    }
    if (grepl(":mu:", unit)) {
      unit <- gsub(":mu:", "&micro;", unit)
    }

    if (grepl("^ohm$", unit)) {
      unit <- gsub("ohm", "&#8486;", unit)
    }
    if (grepl(":ohm:", unit)) {
      unit <- gsub(":ohm:", "&#8486;", unit)
    }

    if (grepl(":angstrom:", unit)) {
      unit <- gsub(":angstrom:", "&#8491;", unit)
    }

    if (grepl(":times:", unit)) {
      unit <- gsub(":times:", "&times;", unit)
    }

    if (grepl(":plusminus:", unit)) {
      unit <- gsub(":plusminus:", "&plusmn;", unit)
    }

    if (grepl(":permil:", unit)) {
      unit <- gsub(":permil:", "&permil;", unit)
    }
    if (grepl(":permille:", unit)) {
      unit <- gsub(":permille:", "&permil;", unit)
    }

    if (grepl(":degree:", unit)) unit <- gsub(":degree:", "&deg;", unit)
    if (grepl(":degrees:", unit)) unit <- gsub(":degrees:", "&deg;", unit)
    if (grepl("degC", unit)) unit <- gsub("degC", "&deg;C", unit)
    if (grepl("degF", unit)) unit <- gsub("degF", "&deg;F", unit)

    if (grepl(":space:", unit)) unit <- gsub(":space:", "&nbsp;", unit)

    # Process Markdown for different components
    if (!is.na(unit) && nchar(unit) > 2 && grepl("*", unit)) {
      unit <- commonmark::markdown_html(text = unit)
      unit <- gsub("^<p>|</p>\n$", "", unit)
    }
    if (!is.na(unit_subscript) && nchar(unit_subscript) > 2 && grepl("*", unit_subscript)) {
      unit_subscript <- commonmark::markdown_html(text = unit_subscript)
      unit_subscript <- gsub("^<p>|</p>\n$", "", unit_subscript)
    }
    if (!is.na(exponent) && nchar(exponent) > 2 && grepl("*", exponent)) {
      exponent <- commonmark::markdown_html(text = exponent)
      exponent <- gsub("^<p>|</p>\n$", "", exponent)
    }

    units_str_i <- paste0(units_str_i, unit)

    if (
      sub_super_overstrike &&
      !is.na(unit_subscript) &&
      !is.na(exponent)
    ) {

      exponent <- gsub("-", "&minus;", exponent)

      units_str_i <-
        paste0(
          units_str_i,
          units_html_sub_super(
            content_sub = unit_subscript,
            content_sup = exponent
          )
        )

    } else if (chemical_formula) {

      units_str_i <-
        gsub(
          "(\\d+)",
          "<span style=\"white-space:nowrap;\"><sub>\\1</sub></span>",
          units_str_i
        )

    } else {

      if (!is.na(unit_subscript)) {

        unit_subscript <- units_html_subscript(content = unit_subscript)

        units_str_i <- paste0(units_str_i, unit_subscript)
      }

      if (!is.na(exponent)) {

        exponent <- gsub("-", "&minus;", exponent)
        exponent <- units_html_superscript(content = exponent)

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

units_html_superscript <- function(content) {

  paste0(
    "<span style=\"white-space:nowrap;\">",
    "<sup>", content, "</sup>",
    "</span>"
  )
}

units_html_subscript <- function(content) {

  paste0(
    "<span style=\"white-space:nowrap;\">",
    "<sub>", content, "</sub>",
    "</span>"
  )
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
