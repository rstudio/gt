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


# Create a `units_definition` object
define_units <- function(units_notation, is_chemical_formula = FALSE) {

  # Trim any incoming `{{`/`}}`
  input <- gsub("^\\{\\{\\s*|\\s*\\}\\}$", "", units_notation)

  #
  # Extract chemical notation text if present and process that
  # as redefined chem tokens
  #

  if (grepl("\\%.*\\%", input) || is_chemical_formula) {

    chem_text <- gsub(".*(\\%.*\\%).*", "\\1", input)
    chem_input <- gsub("^%|%$", "", chem_text)
    chem_input <- gsub("\\(\\^([^\\)])", "( ^\\1", chem_input)

    # Replace single bonds
    for (i in seq(1, 10)) {
      chem_input_int <- chem_input
      chem_input <- gsub("^(.*)([^ _\\{\\<]+)-([^ \\}\\>]+)(.*)$", "\\1\\2 {nsp} - {nsp} \\3\\4", chem_input)
      if (chem_input_int == chem_input) break
    }

    # Replace double bonds
    chem_input <- gsub("^([^\\<]+)=([^\\>]+)$", "\\1 {nsp}={nsp} \\2", chem_input)

    # Get a vector of chem tokens
    chem_tokens_vec <- unlist(strsplit(chem_input, split = "\\s+"))

    #
    # Process all chem tokens
    #

    # Resolve any subscripts and superscripts
    chem_tokens_vec <-
      vapply(
        chem_tokens_vec,
        FUN.VALUE = character(1L),
        USE.NAMES = FALSE,
        FUN = function(x) {

          # Processing for simple chemical formulas (e.g., 'C7H7NO4')
          if (grepl("^[a-zA-Z0-9]+$", x) && grepl("^[A-Z]", x)) {

            # Internal subscripts
            for (i in seq(1, 10)) {
              x_str_int <- x
              x <- gsub("^(.*)([a-zA-Z])([0-9]+)([a-zA-Z])(.*)$", "\\1\\2_\\3 {nsp}\\4\\5", x)
              if (x_str_int == x) break
            }

            # Final subscript
            x <- gsub("^(.*)([a-zA-Z])([0-9]+)$", "\\1\\2_\\3", x)

            return(x)
          }

          if (grepl("[0-9]", x) && nchar(x) > 1) {

            # Preceding stoichiometric number
            x <- gsub("^([0-9]+)([a-zA-Z])(.*)$", "\\1:thinspace:\\2\\3", x)

            # Internal subscripts
            for (i in seq(1, 10)) {
              x_str_int <- x
              x <- gsub("^(.*)([a-zA-Z])([0-9]+)([a-zA-Z\\^])(.*)$", "\\1\\2_\\3 {nsp}\\4\\5", x)
              if (x_str_int == x) break
            }

            # Final subscript
            x <- gsub("^(.*)([a-zA-Z])([0-9]+)$", "\\1\\2_\\3", x)
          }

          if (grepl("\\)|\\(|\\]", x)) {

            # Subscript following ')' or ']'
            for (i in seq(1, 5)) {
              x_str_int <- x
              x <- gsub("^(.+)(\\)|\\])([0-9]+)(.*)$", "\\1\\2_\\3 {nsp}\\4", x)
              if (x_str_int == x) break
            }

            # Subscript preceding ')', '(', or ']'
            for (i in seq(1, 5)) {
              x_str_int <- x
              x <- gsub("^(.+)([0-9]+)(\\)|\\(|\\])(.*)$", "\\1_\\2 {nsp}\\3\\4", x)
              if (x_str_int == x) break
            }
          }

          # Terminating '+' or '-' denoting charge
          if (grepl("^.+([+-])$", x) && !grepl("\\^[n+-]+$", x)) {
            x <- gsub("^(.*)([a-zA-Z])([+-])$", "\\1\\2^\\3", x)
          }

          # Superscript following closing ']'
          if (grepl("]", x, fixed = TRUE) && grepl("[0-9+-]", x) && nchar(x) > 1) {
            x <- gsub("^(.*)(\\])([0-9+-]*)$", "\\1\\2^\\3", x)
          }

          # Removal of curly braces around charge value
          if (grepl("[a-zA-Z]\\^\\{.+?\\}$", x)) {
            x <- gsub("^(.*)([a-zA-Z])\\^\\{(.+?)\\}$", "\\1\\2^\\3", x)
          }

          # Conversion to subscripted, italicized 'x'
          if (endsWith(x, "_x")) {
            x <- gsub("^(.*)([a-zA-Z])_x$", "\\1\\2_*x*", x)
          }

          # Standalone 'x' becomes italicized, convention for stoichiometry
          if (x == "x") {
            x <- "*x*"
          }

          # Up arrow for gas
          if (x %in% c("^", "(^)")) {
            x <- "{nsp}:uarr:"
          }

          # Down arrow for precipitate
          if (x %in% c("v", "(v)")) {
            x <- "{nsp}:darr:"
          }

          # Center dot for addition compounds (from standalone '*' or '.')
          if (x %in% c("*", ".")) {
            x <- "{nsp}:dot:{nsp}"
          }

          # The 'n' in a superscript is italicized by convention
          if (grepl("^(.*)\\^n\\+$", x)) {
            x <- sub("^(.*)\\^n\\+$", "\\1^*n*+", x)
          }

          # Isotope handling on LHS (w/ curly braces) -- '^{227}_{90}Th+'
          if (grepl("^\\^\\{([0-9+-]+)\\}_\\{([0-9+-]+)\\}.*$", x)) {
            x <- sub("^\\^\\{([0-9+-]+)\\}_\\{([0-9+-]+)\\}(.*)$", "{nsp}[_\\2^\\1] {nsp}\\3", x)
          }

          # Isotope handling on LHS (w/o curly braces) -- '^227_90Th+'
          if (grepl("^\\^([0-9+-]+)_([0-9+-]+).*$", x)) {
            x <- sub("^\\^([0-9+-]+)_([0-9+-]+)(.*)$", "{nsp}[_\\2^\\1] {nsp}\\3", x)
          }

          # Isotope handling on LHS (w/ curly braces) -- '^{227}Th+'
          if (grepl("^\\^\\{([0-9+-]+)\\}.*$", x)) {
            x <- sub("^\\^\\{([0-9+-]+)\\}(.*)$", "{nsp}[_:space:^\\1] {nsp}\\2", x)
          }

          # Isotope handling on LHS (w/0 curly braces) -- '^{227}Th+'
          if (grepl("^\\^([0-9+-]+).*$", x)) {
            x <- sub("^\\^([0-9+-]+)(.*)$", "{nsp}[_:space:^\\1] {nsp}\\2", x)
          }

          x
        }
      )

    # Resolve any reaction arrows
    chem_tokens_vec <-
      vapply(
        chem_tokens_vec,
        FUN.VALUE = character(1L),
        USE.NAMES = FALSE,
        FUN = function(x) {
          if (grepl("<|>", x) && nchar(x) > 1) {
            x <- sub("<-->", ":lrseparr:", x, fixed = TRUE)
            x <- sub("<->", ":lrarr:", x, fixed = TRUE)
            x <- sub("->", ":rarr:", x, fixed = TRUE)
            x <- sub("<-", ":larr:", x, fixed = TRUE)
            x <- sub("<=>>", ":eqmrarr:", x, fixed = TRUE)
            x <- sub("<<=>", ":eqmlarr:", x, fixed = TRUE)
            x <- sub("<=>", ":eqmarr:", x, fixed = TRUE)
          }

          x
        }
      )

    # TODO: add text above and/or below reaction arrows through addition
    # of suitable <text> element(s)
    # <-->
    # <text x="39.5" y="-15%" style="font-size: 10; text-anchor: middle;">[TEXT_ABOVE]</text>

    # Insert chem tokens back into input
    chem_tokens_str <- paste(chem_tokens_vec, collapse = " ")

    input <- sub(chem_text, chem_tokens_str, input, fixed = TRUE)

    return(define_units(units_notation = input))
  }

  # Get a vector of raw tokens
  tokens_vec <- unlist(strsplit(input, split = " "))

  # Remove any empty tokens
  tokens_vec <- tokens_vec[tokens_vec != ""]

  # Replace any instances of `/<text>` with `<text>^-1`
  tokens_vec <-
    vapply(
      tokens_vec,
      FUN.VALUE = character(1L),
      USE.NAMES = FALSE,
      FUN = function(x) {
        if (grepl("^/.", x)) {
          x <- gsub("^/", "", x)
          x <- paste0(x, "^-1")
        }
        x
      }
    )

  units_list <- list()

  for (i in seq_along(tokens_vec)) {

    tokens_vec_i <- tokens_vec[i]

    unit_subscript <- NA_character_
    sub_super_overstrike <- FALSE
    chemical_formula <- FALSE
    exponent <- NULL

    if (is_chemical_formula || grepl("^%.+%$", tokens_vec_i)) {
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
      unit <- gsub("^(.+?)_.+?\\^.+?$", "\\1", tokens_vec_i)

      # Obtain only the subscript/exponent portion of the string
      sub_exponent <- gsub("^.+?(_.+?\\^.+?)$", "\\1", tokens_vec_i)

      # Extract the content after the underscore but terminate
      # before any `^`; this is the subscript
      unit_subscript <- gsub("^_(.+?)\\^.+?$", "\\1", sub_exponent)

      # Extract the content after the caret but terminate before
      # any `_`; this is the exponent
      exponent <- gsub("^_.+?\\^(.+?)$", "\\1", sub_exponent)

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

    units_list[[length(units_list) + 1]] <-
      units_list_item(
        token = tokens_vec_i,
        unit = unit,
        unit_subscript = unit_subscript,
        exponent = exponent,
        chemical_formula = chemical_formula,
        sub_super_overstrike = sub_super_overstrike
      )
  }

  names(units_list) <- tokens_vec
  class(units_list) <- "units_definition"

  units_list
}

right_arrow_svg <- "<svg viewBox=\"0 0 86 11\" style=\"overflow:visible;width:2.5em;margin-bottom:0.15em;\"><g stroke=\"none\" stroke-width=\"1\" fill=\"none\" fill-rule=\"evenodd\"><g transform=\"translate(43.004359, 5.903074) rotate(-180.000000) translate(-43.004359, -5.903074) translate(3.611719, 1.837074)\" fill=\"#010101\"><rect x=\"13.6378344\" y=\"3.381\" width=\"65.147447\" height=\"1.37\"></rect><path d=\"M16.772,4.066 L6.26228535e-14,0 C1.2,1.009 1.896,2.496 1.896,4.066 C1.896,5.634 1.201,7.125 6.26228535e-14,8.132 L16.772,4.066 Z\" fill-rule=\"nonzero\" transform=\"translate(8.386000, 4.066000) scale(-1, 1) translate(-8.386000, -4.066000)\"></path></g></g></svg>"
left_arrow_svg  <- "<svg viewBox=\"0 0 86 11\" style=\"overflow:visible;width:2.5em;margin-bottom:0.15em;\"><g stroke=\"none\" stroke-width=\"1\" fill=\"none\" fill-rule=\"evenodd\"><g transform=\"translate(3.000000, 1.903074)\" fill=\"#010101\"><rect x=\"13.2427961\" y=\"3.381\" width=\"65.6275819\" height=\"1.37\"></rect><path d=\"M16.772,4.066 L0,0 C1.2,1.009 1.896,2.496 1.896,4.066 C1.896,5.634 1.201,7.125 0,8.132 L16.772,4.066 Z\" fill-rule=\"nonzero\" transform=\"translate(8.386000, 4.066000) scale(-1, 1) translate(-8.386000, -4.066000)\"></path></g></g></svg>"
lr_arrow_svg <- "<svg viewBox=\"0 0 86 11\" style=\"overflow:visible;width:2.5em;margin-bottom:0.15em;\"><g stroke=\"none\" stroke-width=\"1\" fill=\"none\" fill-rule=\"evenodd\"><rect fill=\"#010101\" x=\"16.2427961\" y=\"5.28407392\" width=\"53\" height=\"1.37\"></rect><path d=\"M82.397,5.96907392 L65.625,1.90307392 C66.825,2.91207392 67.521,4.39907392 67.521,5.96907392 C67.521,7.53707392 66.826,9.02807392 65.625,10.0350739 L82.397,5.96907392 Z\" id=\"right_arrow\" fill=\"#010101\" fill-rule=\"nonzero\"></path><path d=\"M19.772,5.96907392 L3,1.90307392 C4.2,2.91207392 4.896,4.39907392 4.896,5.96907392 C4.896,7.53707392 4.201,9.02807392 3,10.0350739 L19.772,5.96907392 Z\" fill=\"#010101\" fill-rule=\"nonzero\" transform=\"translate(11.386000, 5.969074) scale(-1, 1) translate(-11.386000, -5.969074)\"></path></g></svg>"
lr_sep_arrow_svg <- "<svg viewBox=\"0 0 86 20\" style=\"overflow:visible;width:2.5em;margin-bottom:0.02em;\"><g stroke=\"none\" stroke-width=\"1\" fill=\"none\" fill-rule=\"evenodd\"><g transform=\"translate(3.000000, 2.487191)\" fill=\"#010101\"><rect id=\"line\" x=\"13.2427961\" y=\"10.381\" width=\"63\" height=\"1.37\"></rect><path d=\"M16.772,11.066 L0,7 C1.2,8.009 1.896,9.496 1.896,11.066 C1.896,12.634 1.201,14.125 0,15.132 L16.772,11.066 Z\" fill-rule=\"nonzero\" transform=\"translate(8.386000, 11.066000) scale(-1, 1) translate(-8.386000, -11.066000)\"></path><rect x=\"3.24279614\" y=\"3.381\" width=\"63\" height=\"1.37\"></rect><path d=\"M79.397,4.066 L62.625,0 C63.825,1.009 64.521,2.496 64.521,4.066 C64.521,5.634 63.826,7.125 62.625,8.132 L79.397,4.066 Z\" fill-rule=\"nonzero\"></path></g></g></svg>"
eqm_arrows_svg <- "<svg viewBox=\"0 0 86 15\" style=\"overflow:visible;width:2.5em;margin-bottom:0.1em;\"><g stroke=\"none\" stroke-width=\"1\" fill=\"none\" fill-rule=\"evenodd\"><g transform=\"translate(6.242796, 1.870000)\" fill=\"#010101\"><rect x=\"0.501391193\" y=\"3.63\" width=\"62.4986088\" height=\"1.37\"></rect><path d=\"M72.8288191,5 L56.0567904,0 C57.2567904,1.24077718 57.9527904,3.06935563 57.9527904,5 L72.8288191,5 Z\" fill-rule=\"nonzero\"></path><rect x=\"10\" y=\"6.64830768\" width=\"62.5\" height=\"1.37\"></rect><path d=\"M16.7720287,11.6483077 L0,6.64830768 C1.2,7.88908486 1.896,9.71766331 1.896,11.6483077 L16.7720287,11.6483077 Z\" fill-rule=\"nonzero\" transform=\"translate(8.386014, 9.148308) scale(-1, -1) translate(-8.386014, -9.148308)\"></path></g></g></svg>"
eqm_arrows_right_svg <- "<svg viewBox=\"0 0 86 15\" style=\"overflow:visible;width:2.5em;margin-bottom:0.1em;\"><g stroke=\"none\" stroke-width=\"1\" fill=\"none\" fill-rule=\"evenodd\"><g transform=\"translate(6.744187, 1.454117)\" fill=\"#010101\"><rect x=\"0\" y=\"3.63\" width=\"62.4986088\" height=\"1.37\"></rect><path d=\"M72.3274279,5 L55.5553992,-1.13686838e-13 C56.7553992,1.24077718 57.4513992,3.06935563 57.4513992,5 L72.3274279,5 Z\" fill-rule=\"nonzero\"></path><rect x=\"16.4986088\" y=\"6.64830768\" width=\"44.5\" height=\"1.37\"></rect><path d=\"M23.2706375,11.6483077 L6.49860881,6.64830768 C7.69860881,7.88908486 8.39460881,9.71766331 8.39460881,11.6483077 L23.2706375,11.6483077 Z\" fill-rule=\"nonzero\" transform=\"translate(14.884623, 9.148308) scale(-1, -1) translate(-14.884623, -9.148308)\"></path></g></g></svg>"
eqm_arrows_left_svg <- "<svg viewBox=\"0 0 86 15\" style=\"overflow:visible;width:2.5em;margin-bottom:0.1em;\"><g stroke=\"none\" stroke-width=\"1\" fill=\"none\" fill-rule=\"evenodd\"><g transform=\"translate(6.242796, 1.972234)\" fill=\"#010101\"><rect x=\"11.5026504\" y=\"3.63\" width=\"44.4973496\" height=\"1.37\"></rect><path d=\"M65.8288191,5 L49.0567904,-1.13686838e-13 C50.2567904,1.24077718 50.9527904,3.06935563 50.9527904,5 L65.8288191,5 Z\" fill-rule=\"nonzero\"></path><rect x=\"10\" y=\"6.64830768\" width=\"62.5\" height=\"1.37\"></rect><path d=\"M16.7720287,11.6483077 L0,6.64830768 C1.2,7.88908486 1.896,9.71766331 1.896,11.6483077 L16.7720287,11.6483077 Z\" fill-rule=\"nonzero\" transform=\"translate(8.386014, 9.148308) scale(-1, -1) translate(-8.386014, -9.148308)\"></path></g></g></svg>"

units_list_item <- function(
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


# Render a `units_definition` object to string
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
      unit <- gsub("x", "&times;", unit, fixed = TRUE)
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

      unit_subscript <- units_symbol_replacements(text = unit_subscript, context = context)

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

      exponent <- units_symbol_replacements(text = exponent, context = context)

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

      text_align <- if (units_str_i == "{nsp}") "right" else "left"

      units_str_i <-
        paste0(
          units_str_i,
          units_html_sub_super(
            content_sub = unit_subscript,
            content_sup = exponent,
            text_align = text_align
          )
        )

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
  units_str <- gsub("\\s*\\{nsp\\}\\s*", "", units_str)
  units_str <- gsub(":rarr:", right_arrow_svg, units_str)
  units_str <- gsub(":larr:", left_arrow_svg, units_str)
  units_str <- gsub(":lrarr:", lr_arrow_svg, units_str)
  units_str <- gsub(":lrseparr:", lr_sep_arrow_svg, units_str)
  units_str <- gsub(":eqmarr:", eqm_arrows_svg, units_str)
  units_str <- gsub(":eqmrarr:", eqm_arrows_right_svg, units_str)
  units_str <- gsub(":eqmlarr:", eqm_arrows_left_svg, units_str)

  units_str
}

units_to_superscript <- function(content, context = "html") {

  if (context == "html") {

    out <-
      paste0(
        "<span style=\"white-space:nowrap;\">",
        "<sup style=\"line-height:0;\">", content, "</sup>",
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
        "<sub style=\"line-height:0;\">", content, "</sub>",
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

units_html_sub_super <- function(
    content_sub,
    content_sup,
    text_align = "left"
) {

  paste0(
    "<span style=\"",
    "display:inline-block;",
    "line-height:1em;",
    "text-align:", text_align, ";",
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

  if (context %in% c("html", "rtf", "latex")) {

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
    text <- replace_units_symbol(text, ":thinspace:", ":thinspace:", "&#8201;")
    text <- replace_units_symbol(text, ":dot:", ":dot:", "&sdot;")
    text <- replace_units_symbol(text, ":darr:", ":darr:", "&darr;")
    text <- replace_units_symbol(text, ":uarr:", ":uarr:", "&uarr;")
    text <- replace_units_symbol(text, ":Alpha:", ":Alpha:", "&Alpha;")
    text <- replace_units_symbol(text, ":alpha:", ":alpha:", "&alpha;")
    text <- replace_units_symbol(text, ":Beta:", ":Beta:", "&Beta;")
    text <- replace_units_symbol(text, ":beta:", ":beta:", "&beta;")
    text <- replace_units_symbol(text, ":Gamma:", ":Gamma:", "&Gamma;")
    text <- replace_units_symbol(text, ":gamma:", ":gamma:", "&gamma;")
    text <- replace_units_symbol(text, ":Delta:", ":Delta:", "&Delta;")
    text <- replace_units_symbol(text, ":delta:", ":delta:", "&delta;")
    text <- replace_units_symbol(text, ":Epsilon:", ":Epsilon:", "&Epsilon;")
    text <- replace_units_symbol(text, ":epsilon:", ":epsilon:", "&epsilon;")
    text <- replace_units_symbol(text, ":Zeta:", ":Zeta:", "&Zeta;")
    text <- replace_units_symbol(text, ":zeta:", ":zeta:", "&zeta;")
    text <- replace_units_symbol(text, ":Eta:", ":Eta:", "&Eta;")
    text <- replace_units_symbol(text, ":eta:", ":eta:", "&eta;")
    text <- replace_units_symbol(text, ":Theta:", ":Theta:", "&Theta;")
    text <- replace_units_symbol(text, ":theta:", ":theta:", "&theta;")
    text <- replace_units_symbol(text, ":Iota:", ":Iota:", "&Iota;")
    text <- replace_units_symbol(text, ":iota:", ":iota:", "&iota;")
    text <- replace_units_symbol(text, ":Kappa:", ":Kappa:", "&Kappa;")
    text <- replace_units_symbol(text, ":kappa:", ":kappa:", "&kappa;")
    text <- replace_units_symbol(text, ":Lambda:", ":Lambda:", "&Lambda;")
    text <- replace_units_symbol(text, ":lambda:", ":lambda:", "&lambda;")
    text <- replace_units_symbol(text, ":Mu:", ":Mu:", "&Mu;")
    text <- replace_units_symbol(text, ":mu:", ":mu:", "&mu;")
    text <- replace_units_symbol(text, ":Nu:", ":Nu:", "&Nu;")
    text <- replace_units_symbol(text, ":nu:", ":nu:", "&nu;")
    text <- replace_units_symbol(text, ":Xi:", ":Xi:", "&Xi;")
    text <- replace_units_symbol(text, ":xi:", ":xi:", "&xi;")
    text <- replace_units_symbol(text, ":Omicron:", ":Omicron:", "&Omicron;")
    text <- replace_units_symbol(text, ":omicron:", ":omicron:", "&omicron;")
    text <- replace_units_symbol(text, ":Pi:", ":Pi:", "&Pi;")
    text <- replace_units_symbol(text, ":pi:", ":pi:", "&pi;")
    text <- replace_units_symbol(text, ":Rho:", ":Rho:", "&Rho;")
    text <- replace_units_symbol(text, ":rho:", ":rho:", "&rho;")
    text <- replace_units_symbol(text, ":Sigma:", ":Sigma:", "&Sigma;")
    text <- replace_units_symbol(text, ":sigma:", ":sigma:", "&sigma;")
    text <- replace_units_symbol(text, ":sigmaf:", ":sigmaf:", "&sigmaf;")
    text <- replace_units_symbol(text, ":Tau:", ":Tau:", "&Tau;")
    text <- replace_units_symbol(text, ":tau:", ":tau:", "&tau;")
    text <- replace_units_symbol(text, ":Upsilon:", ":Upsilon:", "&Upsilon;")
    text <- replace_units_symbol(text, ":upsilon:", ":upsilon:", "&upsilon;")
    text <- replace_units_symbol(text, ":Phi:", ":Phi:", "&Phi;")
    text <- replace_units_symbol(text, ":phi:", ":phi:", "&phi;")
    text <- replace_units_symbol(text, ":Chi:", ":Chi:", "&Chi;")
    text <- replace_units_symbol(text, ":chi:", ":chi:", "&chi;")
    text <- replace_units_symbol(text, ":Psi:", ":Psi:", "&Psi;")
    text <- replace_units_symbol(text, ":psi:", ":psi:", "&psi;")
    text <- replace_units_symbol(text, ":Omega:", ":Omega:", "&Omega;")
    text <- replace_units_symbol(text, ":omega:", ":omega:", "&omega;")
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
    text <- replace_units_symbol(text, ":thinspace:", ":thinspace:", "\U2009")
    text <- replace_units_symbol(text, ":Alpha:", ":Alpha:", "\U0391")
    text <- replace_units_symbol(text, ":alpha:", ":alpha:", "\U03B1")
    text <- replace_units_symbol(text, ":Beta:", ":Beta:", "\U0392")
    text <- replace_units_symbol(text, ":beta:", ":beta:", "\U03B2")
    text <- replace_units_symbol(text, ":Gamma:", ":Gamma:", "\U0393")
    text <- replace_units_symbol(text, ":gamma:", ":gamma:", "\U03B3")
    text <- replace_units_symbol(text, ":Delta:", ":Delta:", "\U0394")
    text <- replace_units_symbol(text, ":delta:", ":delta:", "\U03B4")
    text <- replace_units_symbol(text, ":Epsilon:", ":Epsilon:", "\U0395")
    text <- replace_units_symbol(text, ":epsilon:", ":epsilon:", "\U03B5")
    text <- replace_units_symbol(text, ":Zeta:", ":Zeta:", "\U0396")
    text <- replace_units_symbol(text, ":zeta:", ":zeta:", "\U03B6")
    text <- replace_units_symbol(text, ":Eta:", ":Eta:", "\U0397")
    text <- replace_units_symbol(text, ":eta:", ":eta:", "\U03B7")
    text <- replace_units_symbol(text, ":Theta:", ":Theta:", "\U0398")
    text <- replace_units_symbol(text, ":theta:", ":theta:", "\U03B8")
    text <- replace_units_symbol(text, ":Iota:", ":Iota:", "\U0399")
    text <- replace_units_symbol(text, ":iota:", ":iota:", "\U03B9")
    text <- replace_units_symbol(text, ":Kappa:", ":Kappa:", "\U039A")
    text <- replace_units_symbol(text, ":kappa:", ":kappa:", "\U03BA")
    text <- replace_units_symbol(text, ":Lambda:", ":Lambda:", "\U039B")
    text <- replace_units_symbol(text, ":lambda:", ":lambda:", "\U03BB")
    text <- replace_units_symbol(text, ":Mu:", ":Mu:", "\U039C")
    text <- replace_units_symbol(text, ":mu:", ":mu:", "\U03BC")
    text <- replace_units_symbol(text, ":Nu:", ":Nu:", "\U039D")
    text <- replace_units_symbol(text, ":nu:", ":nu:", "\U03BD")
    text <- replace_units_symbol(text, ":Xi:", ":Xi:", "\U039E")
    text <- replace_units_symbol(text, ":xi:", ":xi:", "\U03BE")
    text <- replace_units_symbol(text, ":Omicron:", ":Omicron:", "\U039F")
    text <- replace_units_symbol(text, ":omicron:", ":omicron:", "\U03BF")
    text <- replace_units_symbol(text, ":Pi:", ":Pi:", "\U03A0")
    text <- replace_units_symbol(text, ":pi:", ":pi:", "\U03C0")
    text <- replace_units_symbol(text, ":Rho:", ":Rho:", "\U03A1")
    text <- replace_units_symbol(text, ":rho:", ":rho:", "\U03C1")
    text <- replace_units_symbol(text, ":Sigma:", ":Sigma:", "\U03A3")
    text <- replace_units_symbol(text, ":sigma:", ":sigma:", "\U03C3")
    text <- replace_units_symbol(text, ":sigmaf:", ":sigmaf:", "\U03C2")
    text <- replace_units_symbol(text, ":Tau:", ":Tau:", "\U03A4")
    text <- replace_units_symbol(text, ":tau:", ":tau:", "\U03C4")
    text <- replace_units_symbol(text, ":Upsilon:", ":Upsilon:", "\U03A5")
    text <- replace_units_symbol(text, ":upsilon:", ":upsilon:", "\U03C5")
    text <- replace_units_symbol(text, ":Phi:", ":Phi:", "\U03A6")
    text <- replace_units_symbol(text, ":phi:", ":phi:", "\U03C6")
    text <- replace_units_symbol(text, ":Chi:", ":Chi:", "\U03A7")
    text <- replace_units_symbol(text, ":chi:", ":chi:", "\U03C7")
    text <- replace_units_symbol(text, ":Psi:", ":Psi:", "\U03A8")
    text <- replace_units_symbol(text, ":psi:", ":psi:", "\U03C8")
    text <- replace_units_symbol(text, ":Omega:", ":Omega:", "\U03A9")
    text <- replace_units_symbol(text, ":omega:", ":omega:", "\U03C9")
  }

  text
}

replace_units_symbol <- function(text, detect, pattern, replace) {
  if (grepl(detect, text)) text <- gsub(pattern, replace, text)
  text
}
