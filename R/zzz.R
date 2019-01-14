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

#' @importFrom utils globalVariables
globalVariables(
  c(
    ".",
    "are_groups_present",
    "arrange_dfs",
    "blue",
    "colname",
    "colnames_start",
    "colnum",
    "colnum_final",
    "colors",
    "curr_code",
    "curr_name",
    "data_attr",
    "footnotes_to_list",
    "fs_id",
    "fs_id_coalesced",
    "get_groups_rows",
    "green",
    "group_label",
    "grpname",
    "integrate_summary_lines",
    "locname",
    "locnum",
    "missing_text",
    "n",
    "n_cols",
    "obtain_group_ordering",
    "package",
    "palette",
    "red",
    "row_end",
    "rownum",
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
    "rowname",
    "scss",
    "selector",
    "text_col",
    "time",
    "type",
    "value",
    "yiq"
    )
  )

#' \pkg{gt} package options
#'
#' @section Package options:
#'
#' \pkg{gt} uses the following \code{\link{options}} to configure behavior:
#'
#' \itemize{
#'   \item \code{gt.stub_group.sep}: a separator between groups for the
#'   stub group label.
#'
#' }
#' @name gt-options
NULL

gt_default_options <- list(
  gt.stub_group.sep = " - ",
  gt.html_tag_check = TRUE
)

.onLoad <- function(libname, pkgname, ...) {

  register_s3_method("knitr", "knit_print", "gt_tbl")

  op <- options()
  toset <- !(names(gt_default_options) %in% names(op))
  if (any(toset)) options(gt_default_options[toset])

  invisible()
}
#nocov end
