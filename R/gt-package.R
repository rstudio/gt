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


#' @keywords internal
"_PACKAGE"

## usethis namespace: start
#' @import rlang
#' @importFrom xml2 as_xml_document read_xml xml_contents xml_name xml_type
#'   xml_text xml_attr `xml_attr<-` `xml_text<-` xml_find_all xml_find_first
#'   xml_children xml_child xml_add_child xml_add_sibling xml_ns xml_remove
## usethis namespace: end
NULL

release_bullets <- function() {
  c(
    "Check that [visual tests](https://gt.rstudio.com/articles/gt-visual.html) are conclusive",
    "Add more visual tests of new features in `vignettes/gt-visual.qmd``",
    "Run `source('scripts/visual-tests-latex.R')` and verify that [LaTeX output](https://gt.rstudio.com/gt-latex.pdf) looks good."
  )
}
