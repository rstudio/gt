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


token_list_item <- function(token, unit, exponent = NULL) {

  list_item <-
    list(
      token = token,
      unit = unit,
      exponent = NA_real_
    )

  if (!is.null(exponent)) {
    list_item[["exponent"]] <- exponent
  }

  list_item
}

# Create a list of tokens with metadata
generate_token_list <- function(input) {

  # Trim any incoming `{{`/`}}`
  input <- gsub("^\\{\\{\\s+|\\s+\\}\\}$", "", input)

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

    # Extract exponent, if present
    if (grepl("^", tokens_vec_i, fixed = TRUE)) {

      tokens_vec_i_split <- unlist(strsplit(tokens_vec_i, "^", fixed = TRUE))

      unit <- tokens_vec_i_split[1]
      exponent <- tokens_vec_i_split[2]

    } else {
      unit <- tokens_vec_i
      exponent <- NULL
    }

    token_list[[length(token_list) + 1]] <-
      token_list_item(
        token = tokens_vec_i,
        unit = unit,
        exponent = exponent
      )
  }

  names(token_list) <- tokens_vec
  class(token_list) <- "unit_tokens"

  token_list
}

# Render to HTML with a one line, all exponential format
units_to_html <- function(units_object) {

  for (i in seq_along(units_object)) {

    units_str_i <- ""

    units_object_i <- units_object[[i]]

    units_item <- units_object_i[["unit"]]

    if (grepl("_", units_item, fixed = TRUE)) {

      units_item_split <- unlist(strsplit(units_item, split = "_"))

      units_item <-
        paste0(units_item_split[1], units_html_subscript(units_item_split[2]))
    }

    units_str_i <- paste0(units_str_i, units_item)

    if (!is.na(units_object_i[["exponent"]])) {

      exponent_i <- gsub("-", "&minus;", units_object_i[["exponent"]])

      exponent_i <- units_html_superscript(content = exponent_i)

      units_str_i <- paste0(units_str_i, exponent_i)
    }

    units_object[[i]][["built"]] <- units_str_i
  }

  units_str <- ""

  for (i in seq_along(units_object)) {
    units_str <- paste(units_str, units_object[[i]][["built"]])
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
