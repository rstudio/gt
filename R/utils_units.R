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


token_list_item <- function(
    token,
    unit,
    unit_subscript = NULL,
    exponent = NULL,
    sub_super_overstrike = FALSE,
    chemical_formula = FALSE
) {

  list_item <-
    list(
      token = token,
      unit = unit,
      unit_subscript = NA_character_,
      exponent = NA_character_,
      sub_super_overstrike = FALSE,
      chemical_formula = FALSE
    )

  if (!is.null(exponent)) {
    list_item[["exponent"]] <- exponent
  }

  if (!is.null(unit_subscript)) {
    list_item[["unit_subscript"]] <- unit_subscript
  }

  list_item[["sub_super_overstrike"]] <- sub_super_overstrike
  list_item[["chemical_formula"]] <- chemical_formula

  list_item
}

# Create a list of tokens with metadata
generate_token_list <- function(input) {

  # Trim any incoming `{{`/`}}`
  input <- gsub("^\\{\\{\\s*|\\s*\\}\\}$", "", input)

  # Get a vector of raw tokens
  tokens_vec <- unlist(strsplit(input, split = " "))

  # Remove any empty tokens
  tokens_vec <- tokens_vec[tokens_vec != ""]

  # Replace any instances of `/<text>` with `<text>^-1`
  tokens_vec <-
    vapply(
      tokens_vec,
      FUN.VALUE = character(1),
      USE.NAMES = FALSE,
      FUN = function(x) {
        if (grepl("^/", x) && nchar(x) > 1) {
          x <- gsub("^/", "", x)
          x <- paste0(x, "^-1")
        }
        x
      }
    )

  token_list <- list()

  for (i in seq_along(tokens_vec)) {

    tokens_vec_i <- tokens_vec[i]

    unit_subscript <- NA_character_
    sub_super_overstrike <- FALSE
    chemical_formula <- FALSE
    exponent <- NULL

    if (
      grepl("^%", tokens_vec_i) &&
      grepl("%$", tokens_vec_i) &&
      nchar(tokens_vec_i) > 2
    ) {
      # Case where the unit is marked as a chemical formula

      chemical_formula <- TRUE

      # Extract the formula w/o the surrounding `%` signs
      unit <- gsub("^%|%$", "", tokens_vec_i)

    } else if (grepl(".+?\\[_.+?\\^.+?\\]", tokens_vec_i)) {
      # Case where both a subscript and exponent are present and
      # an overstrike arrangement is necessary

      sub_super_overstrike <- TRUE

      # Extract the unit w/o subscript from the string
      unit <- gsub("(.+?)\\[_.+?\\^.+?\\]", "\\1", tokens_vec_i)

      # Obtain only the subscript/exponent of the string
      sub_exponent <- gsub(".+?\\[(_.+?\\^.+?)\\]", "\\1", tokens_vec_i)

      # Extract the content after the underscore but terminate
      # before any `^`; this is the subscript
      unit_subscript <- gsub("^_(.+?)(\\^.+?)$", "\\1", sub_exponent)

      # Extract the content after the caret but terminate before
      # any `_`; this is the exponent
      exponent <- gsub("_.+?\\^(.+?)", "\\1", sub_exponent)

    } else if (grepl(".+?_.+?\\^.+?", tokens_vec_i)) {
      # Case where both a subscript and exponent are present and
      # the subscript is set before the exponent

      # Extract the unit w/o subscript from the string
      unit <- gsub("(.+?)_.+?\\^.+?", "\\1", tokens_vec_i)

      # Obtain only the subscript/exponent portion of the string
      sub_exponent <- gsub(".+?(_.+?\\^.+?)", "\\1", tokens_vec_i)

      # Extract the content after the underscore but terminate
      # before any `^`; this is the subscript
      unit_subscript <- gsub("_(.+?)\\^.+?", "\\1", sub_exponent)

      # Extract the content after the caret but terminate before
      # any `_`; this is the exponent
      exponent <- gsub("_.+?\\^(.+?)", "\\1", sub_exponent)

    } else if (grepl("^", tokens_vec_i, fixed = TRUE)) {
      # Case where only an exponent is present

      tokens_vec_i_split <- unlist(strsplit(tokens_vec_i, "^", fixed = TRUE))

      unit <- tokens_vec_i_split[1]
      exponent <- tokens_vec_i_split[2]

    } else if (grepl("_", tokens_vec_i, fixed = TRUE)) {
      # Case where only a subscript is present

      tokens_vec_i_split <- unlist(strsplit(tokens_vec_i, "_", fixed = TRUE))

      unit <- tokens_vec_i_split[1]
      unit_subscript <- tokens_vec_i_split[2]

    } else {
      unit <- tokens_vec_i
    }

    token_list[[length(token_list) + 1]] <-
      token_list_item(
        token = tokens_vec_i,
        unit = unit,
        unit_subscript = unit_subscript,
        exponent = exponent,
        chemical_formula = chemical_formula,
        sub_super_overstrike = sub_super_overstrike
      )
  }

  names(token_list) <- tokens_vec
  class(token_list) <- "unit_tokens"

  token_list
}

# Render units to HTML
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

    if (grepl(":degree:", unit)) unit <- gsub(":degree:", "&degree;", unit)
    if (grepl("degC", unit)) unit <- gsub("degC", "&degree;C", unit)
    if (grepl("degF", unit)) unit <- gsub("degF", "&degree;F", unit)


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
