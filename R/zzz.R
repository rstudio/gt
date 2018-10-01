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
    "colname",
    "colnames_start",
    "colnum",
    "colnum_final",
    "footnotes_to_list",
    "fs_id",
    "fs_id_coalesced",
    "get_groups_rows",
    "group_label",
    "grpname",
    "integrate_summary_lines",
    "locname",
    "locnum",
    "missing_text",
    "obtain_group_ordering",
    "row_end",
    "rownum",
    "styles_appended",
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
    "time",
    "type",
    "value"
    )
  )

#' The gt package options.
#'
#' @section Package options:
#'
#' gt uses the following \code{\link{options}} to configure behaviour:
#'
#' \itemize{
#'   \item \code{gt.stub_group.sep}: a separator
#'
#' }
#' @name gt-options
NULL

gt_default_options <- list(
  gt.stub_group.sep = " - "
)

.onLoad <- function(libname, pkgname, ...) {

  register_s3_method("knitr", "knit_print", "gt_tbl")

  op <- options()
  toset <- !(names(gt_default_options) %in% names(op))
  if (any(toset)) options(gt_default_options[toset])

  invisible()
}
#nocov end
