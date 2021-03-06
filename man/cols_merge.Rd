% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/modify_columns.R
\name{cols_merge}
\alias{cols_merge}
\title{Merge data from two or more columns to a single column}
\usage{
cols_merge(
  data,
  columns,
  hide_columns = columns[-1],
  pattern = paste0("{", seq_along(columns), "}", collapse = " ")
)
}
\arguments{
\item{data}{A table object that is created using the \code{\link[=gt]{gt()}} function.}

\item{columns}{The columns that will participate in the merging process. The
first column name provided will be the target column (i.e., undergo
mutation) and the other columns will serve to provide input.}

\item{hide_columns}{Any column names provided here will have their state
changed to \code{hidden} (via internal use of \code{\link[=cols_hide]{cols_hide()}} if they aren't
already hidden. This is convenient if the shared purpose of these specified
columns is only to provide string input to the target column. To suppress
any hiding of columns, \code{FALSE} can be used here.}

\item{pattern}{A formatting pattern that specifies the arrangement of the
\code{column} values and any string literals. We need to use column numbers
(corresponding to the position of columns provided in \code{columns}) within the
pattern. These indices are to be placed in curly braces (e.g., \code{{1}}). All
characters outside of braces are taken to be string literals.}
}
\value{
An object of class \code{gt_tbl}.
}
\description{
This function takes input from two or more columns and allows the contents to
be merged them into a single column, using a pattern that specifies the
formatting. We can specify which columns to merge together in the \code{columns}
argument. The string-combining pattern is given in the \code{pattern} argument.
The first column in the \code{columns} series operates as the target column (i.e.,
will undergo mutation) whereas all following \code{columns} will be untouched.
There is the option to hide the non-target columns (i.e., second and
subsequent columns given in \code{columns}).
}
\details{
There are three other column-merging functions that offer specialized
behavior that is optimized for common table tasks: \code{\link[=cols_merge_range]{cols_merge_range()}},
\code{\link[=cols_merge_uncert]{cols_merge_uncert()}}, and \code{\link[=cols_merge_n_pct]{cols_merge_n_pct()}}. These functions operate
similarly, where the non-target columns can be optionally hidden from the
output table through the \code{autohide} option.
}
\section{Figures}{

\if{html}{\figure{man_cols_merge_1.png}{options: width=100\%}}
}

\section{Function ID}{

4-12
}

\examples{
# Use `sp500` to create a gt table;
# merge the `open` & `close` columns
# together, and, the `low` & `high`
# columns (putting an em dash between
# both); rename the columns
tab_1 <-
  sp500 \%>\%
  dplyr::slice(50:55) \%>\%
  dplyr::select(-volume, -adj_close) \%>\%
  gt() \%>\%
  cols_merge(
    columns = c(open, close),
    pattern = "{1}&mdash;{2}"
  ) \%>\%
  cols_merge(
    columns = c(low, high),
    pattern = "{1}&mdash;{2}"
  ) \%>\%
  cols_label(
    open = "open/close",
    low = "low/high"
  )

}
\seealso{
Other Modify Columns: 
\code{\link{cols_align}()},
\code{\link{cols_hide}()},
\code{\link{cols_label}()},
\code{\link{cols_merge_n_pct}()},
\code{\link{cols_merge_range}()},
\code{\link{cols_merge_uncert}()},
\code{\link{cols_move_to_end}()},
\code{\link{cols_move_to_start}()},
\code{\link{cols_move}()},
\code{\link{cols_unhide}()},
\code{\link{cols_width}()}
}
\concept{Modify Columns}
