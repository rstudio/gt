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

.onLoad <- function(...) {
  register_s3_method("knitr", "knit_print", "gt_tbl")
}

#' @importFrom utils globalVariables
globalVariables(
  c(
    ":row_number:",
    ":group_name:",
    ":row_name:",
    ":row_number:",
    "rowname",
    "groupname",
    "base_locale_id",
    "group_sep",
    "dec_sep",
    "monetary_dec_sep",
    "locale",
    "median",
    "n",
    "property",
    "property_value",
    "sd",
    "selector",
    "time",
    "type",
    "value"
    )
  )
#nocov end
