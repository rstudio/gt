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


kable_caption <- function(label, caption, format) {

  if (is.null(label)) {
    label <- knitr::opts_current$get("label")
  }

  if (!is.null(caption) && !is.na(caption)) {

    caption <-
      paste0(
        create_label('tab:', label, latex = (format == "latex")), caption
      )
  }

  caption
}

create_label <- function(..., latex = FALSE) {

  if (isTRUE(knitr::opts_knit$get('bookdown.internal.label'))) {

    lab1 <- "(#"
    lab2 <- ")"

  } else if (latex) {

    lab1 <- "\\label{"
    lab2 <- "}"

  } else {
    return("")
  }

  paste(c(lab1, ..., lab2), collapse = "")
}
