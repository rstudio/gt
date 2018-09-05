#' Helper for targeting a series of row labels or columns
#'
#' See \code{dplyr::\link[dplyr]{vars}} for details.
#'
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


#' Helpers for resolving column names or row labels
#'
#' We can resolve one or multiple column names or row labels by using a select
#'   helper function like \code{starts_with}, \code{contains}, etc., with an
#'   argument like \code{columns}, \code{rows}, or \code{groups}. This works
#'   inside the the \code{\link{location_cells}} helper functions, which, in
#'   turn, are to be used within \code{\link{tab_footnote}()} or
#'   \code{\link{tab_footnote}()} (both at the \code{locations} argument).
#'
#' The helper functions are:
#'
#' \itemize{
#'   \item \code{starts_with()}: targets the table title or the table headnote
#'     depending on the value given to the \code{groups} argument
#'     (\code{"title"} or \code{"headnote"}).
#'   \item \code{ends_with()}: targets captions for the column headers (the
#'     \code{columns} argument) or group spanners (the \code{groups} argument)
#'     in the table boxhead.
#'   \item \code{contains()}: targets the group headings in the stub blocks
#'     using the \code{groups} argument.
#'   \item \code{matches()}: targets row captions in the table stub using the
#'     \code{rows} argument.
#'   \item \code{one_of()}: targets data cells in the table field using
#'     intersections of \code{columns} and \code{rows}.
#'   \item \code{everything()}: targets data cells in the table field using
#'     intersections of \code{columns} and \code{rows}.
#' }
#'
#' @param match a string.
#' @param ignore.case if \code{TRUE}, the default, case is ignored when
#'   matching names.
#' @name resolving_helpers
NULL

#' @rdname resolving_helpers
#' @importFrom tidyselect starts_with
#' @export
tidyselect::starts_with

#' @rdname resolving_helpers
#' @importFrom tidyselect ends_with
#' @export
tidyselect::ends_with

#' @rdname resolving_helpers
#' @importFrom tidyselect contains
#' @export
tidyselect::contains

#' @rdname resolving_helpers
#' @importFrom tidyselect matches
#' @export
tidyselect::matches

#' @rdname resolving_helpers
#' @importFrom tidyselect one_of
#' @export
tidyselect::one_of

#' @rdname resolving_helpers
#' @importFrom tidyselect everything
#' @export
tidyselect::everything
