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


#nocov start

register_s3_method <- function(
    pkg,
    generic,
    class,
    fun = NULL
) {

  stopifnot(is.character(pkg), length(pkg) == 1)
  stopifnot(is.character(generic), length(generic) == 1)
  stopifnot(is.character(class), length(class) == 1)

  if (is.null(fun)) {
    fun <- get(paste0(generic, ".", class), envir = parent.frame())
  } else {
    stopifnot(is.function(fun))
  }

  if (pkg %in% loadedNamespaces()) {
    registerS3method(generic, class, fun, envir = asNamespace(pkg))
  }

  # Always register hook in case package is later unloaded & reloaded
  setHook(
    packageEvent(pkg, "onLoad"),
    function(...) {
      registerS3method(generic, class, fun, envir = asNamespace(pkg))
    }
  )
}

utils::globalVariables(
  c(
    ".",
    "are_groups_present",
    "arrange_dfs",
    "b",
    "blue",
    "built",
    "built_group_label",
    "boxhead",
    "category",
    "colname",
    "colnames_start",
    "colnum",
    "colnum_final",
    "column_align",
    "column_label",
    "column_width",
    "colors",
    "conv",
    "copyright",
    "curr_code",
    "curr_name",
    "data_attr",
    "date_added",
    "decimal",
    "designer",
    "display_name",
    "examples",
    "flexible",
    "footnotes",
    "footnotes_to_list",
    "formatted",
    "format_code",
    "fs_id",
    "fs_id_coalesced",
    "get_groups_rows",
    "g",
    "green",
    "group",
    "group_id",
    "group_label",
    "groups",
    "grpname",
    "grprow",
    "html_style",
    "i",
    "id",
    "integrate_summary_lines",
    "label",
    "locname",
    "locnum",
    "missing_text",
    "n",
    "n_cols",
    "name",
    "name_copy",
    "no_data",
    "no_table_data_text",
    "obtain_group_ordering",
    "package",
    "palette",
    "red",
    "row_id",
    "row_end",
    "row_start",
    "rownum",
    "rownum_i",
    "spanner_id",
    "spanner_label",
    "spanner_level",
    "styles",
    "styles_appended",
    "symbol",
    "text",
    "time_part",
    "time_type",
    "Var1",
    "base_locale_id",
    "dec_sep",
    "group_sep",
    "groupname",
    "parameter",
    "property",
    "property_value",
    "r",
    "rgba",
    "rowname",
    "samp",
    "scss",
    "selector",
    "style",
    "text_col",
    "time",
    "type",
    "unit",
    "value",
    "var",
    "weight",
    "weight_range",
    "weight_ranges",
    "yiq"
    )
  )

#' **gt** package options
#'
#' @section Package options:
#'
#' **gt** uses the following [options()] to configure behavior:
#'
#' - `gt.row_group.sep`: A separator between groups for the row group label. By
#' default this is `" - "`.
#' - `gt.html_tag_check`: A logical scalar indicating whether or not to print a
#' warning when HTML tags are found in a table that is being rendered to LaTeX.
#' The default for this is `TRUE`.
#' - `gt.strict_column_fmt`: A logical scalar that controls whether formatting
#' via the `fmt_*()` functions should fail if attempting to format data that is
#' incompatible with the function. This is `FALSE` by default.
#' - `gt.latex_packages`: A vector of LaTeX package names to use when generating
#' tables in the LaTeX output context. The set of packages loaded is controlled
#' by this default vector:
#' `c("booktabs", "caption", "longtable", "colortbl", "array")`.
#'
#' @keywords internal
#' @name gt-options
NULL

gt_default_options <-
  list(
    gt.row_group.sep = " - ",
    gt.html_tag_check = TRUE,
    gt.strict_column_fmt = FALSE,
    gt.latex_packages = c("booktabs", "caption", "longtable", "colortbl", "array")
  )

# R 3.5 and earlier have a bug on Windows where if x is latin1 or unknown and
# replacement is UTF-8, the UTF-8 bytes are inserted into the result but the
# result is not marked as UTF-8.
# Example: gsub("a", "\u00B1", "a", fixed = TRUE)
utf8_aware_sub <- NULL

.onLoad <- function(libname, pkgname, ...) {

  register_s3_method("knitr", "knit_print", "gt_tbl")
  register_s3_method("knitr", "knit_print", "gt_group")
  register_s3_method("htmltools", "as.tags", "gt_tbl")

  op <- options()
  toset <- !(names(gt_default_options) %in% names(op))
  if (any(toset)) options(gt_default_options[toset])

  utf8_aware_sub <<-
    identical(
      "UTF-8",
      Encoding(sub(".", "\u00B1", ".", fixed = TRUE))
    )

  invisible()
}

#nocov end
