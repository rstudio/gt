#nocov start
register_s3_method <- function(pkg, generic, class, fun = NULL) {
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

globalVariables(
  c(
    ".",
    "are_groups_present",
    "arrange_dfs",
    "b",
    "blue",
    "boxhead",
    "category",
    "colname",
    "colnames_start",
    "colnum",
    "colnum_final",
    "column_align",
    "column_label",
    "colors",
    "copyright",
    "curr_code",
    "curr_name",
    "data_attr",
    "date_added",
    "designer",
    "display_name",
    "footnotes",
    "footnotes_to_list",
    "fs_id",
    "fs_id_coalesced",
    "get_groups_rows",
    "g",
    "green",
    "group_label",
    "grpname",
    "grprow",
    "integrate_summary_lines",
    "locname",
    "locnum",
    "missing_text",
    "n",
    "n_cols",
    "name",
    "name_copy",
    "obtain_group_ordering",
    "package",
    "palette",
    "red",
    "row_end",
    "rownum",
    "rownum_i",
    "styles",
    "styles_appended",
    "symbol",
    "text",
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
#' \itemize{
#'   \item `gt.row_group.sep`: a separator between groups for the row group
#'   label.
#' }
#' @name gt-options
NULL

gt_default_options <- list(
  gt.row_group.sep = " - ",
  gt.html_tag_check = TRUE
)

# R 3.5 and earlier have a bug on Windows where if x is latin1 or unknown and
# replacement is UTF-8, the UTF-8 bytes are inserted into the result but the
# result is not marked as UTF-8.
# Example: gsub("a", "\u00B1", "a", fixed = TRUE)
utf8_aware_sub <- NULL

.onLoad <- function(libname, pkgname, ...) {

  register_s3_method("knitr", "knit_print", "gt_tbl")
  register_s3_method("htmltools", "as.tags", "gt_tbl")

  op <- options()
  toset <- !(names(gt_default_options) %in% names(op))
  if (any(toset)) options(gt_default_options[toset])

  utf8_aware_sub <<- identical("UTF-8", Encoding(sub(".", "\u00B1", ".", fixed = TRUE)))

  invisible()
}
#nocov end
