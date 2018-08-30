#' Helper for targeting a series of row labels or columns
#'
#' See \code{dplyr::\link[dplyr]{vars}} for details.
#' @name vars
#' @importFrom dplyr vars
#' @usage vars(...)
#' @param ... one or more column names or row labels, depending on the enclosing
#'   function. This can be provided as bare column names or row labels.
#' @family helper functions
#' @export
NULL

#' Helper for creating a list of functions
#'
#' See \code{dplyr::\link[dplyr]{funs}} for details.
#' @name funs
#' @importFrom dplyr funs
#' @usage funs(...)
#' @param ... one or more functions that can be either a function name (e.g.,
#'   \code{"mean"}), the function itself (e.g., \code{mean}), or calls to
#'   functions with \code{.} as a dummy argument (e.g.,
#'   \code{mean(., na.rm = TRUE)}).
#' @family helper functions
#' @export
NULL

#' Helper for resolving colnames or rownames that start with a prefix
#'
#' @name starts_with
#' @importFrom tidyselect starts_with
#' @usage starts_with(match, ignore.case = TRUE)
#' @param match a string.
#' @param ignore.case if \code{TRUE}, the default, case is ignored when
#'   matching names.
#' @family helper functions
#' @export
NULL

#' Helper for resolving colnames or rownames that end with a suffix
#'
#' @name ends_with
#' @importFrom tidyselect ends_with
#' @usage ends_with(match, ignore.case = TRUE)
#' @param match a string.
#' @param ignore.case if \code{TRUE}, the default, case is ignored when
#'   matching names.
#' @family helper functions
#' @export
NULL

#' Helper for resolving colnames or rownames that contain a literal string
#'
#' @name contains
#' @importFrom tidyselect contains
#' @usage contains(match, ignore.case = TRUE)
#' @param match a string.
#' @param ignore.case if \code{TRUE}, the default, case is ignored when
#'   matching names.
#' @family helper functions
#' @export
NULL

#' Helper for resolving colnames or rownames that match a regular expression
#'
#' @name matches
#' @importFrom tidyselect matches
#' @usage matches(match, ignore.case = TRUE)
#' @param match a string.
#' @param ignore.case if \code{TRUE}, the default, case is ignored when
#'   matching names.
#' @family helper functions
#' @export
NULL

#' Helper for resolving colnames or rownames that are part of a set
#'
#' @name one_of
#' @importFrom tidyselect one_of
#' @usage one_of(..., ignore.case = TRUE)
#' @param ... one or more character vectors.
#' @family helper functions
#' @export
NULL

#' Helper for selecting all colnames or rownames
#'
#' @name everything
#' @importFrom tidyselect everything
#' @usage everything()
#' @family helper functions
#' @export
NULL
