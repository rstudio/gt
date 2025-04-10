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
#  Copyright (c) 2018-2025 gt authors
#
#  For full copyright and license information, please look at
#  https://gt.rstudio.com/LICENSE.html
#
#------------------------------------------------------------------------------#


kable_caption <- function(label, caption, format) {
  # create a label for bookdown if applicable
  if (is.null(label)) label <- knitr::opts_current$get("label")
  if (is.null(label)) label <- NA
  if (!is.null(caption) && !anyNA(caption) && !anyNA(label)) {
    caption <- paste0(
      create_label(
        knitr::opts_knit$get("label.prefix")[["table"]],
        label,
        latex = (format == "latex")
      ), caption
    )
  }
  caption
}

create_label <- function(..., latex = FALSE) {
  if (isTRUE(knitr::opts_knit$get("bookdown.internal.label"))) {
    if (latex) {
      lab1 <- "(\\#"
    } else {
      lab1 <- "(#"
    }
    lab2 <- ")"
  } else if (latex) {
    lab1 <- "\\label{"
    lab2 <- "}"
  } else {
    return("") # we don't want the label at all
  }
  paste(c(lab1, ..., lab2), collapse = "")
}
