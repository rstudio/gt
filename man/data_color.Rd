% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/data_color.R
\name{data_color}
\alias{data_color}
\title{Set data cell colors using a palette or a color function}
\usage{
data_color(
  data,
  columns,
  colors,
  alpha = NULL,
  apply_to = c("fill", "text"),
  autocolor_text = TRUE
)
}
\arguments{
\item{data}{A table object that is created using the \code{\link[=gt]{gt()}} function.}

\item{columns}{The columns wherein changes to cell data colors should occur.}

\item{colors}{Either a color mapping function from the \strong{scales} package or
a vector of colors to use for each distinct value or level in each of the
provided \code{columns}. The color mapping functions are:
\code{\link[scales:col_numeric]{scales::col_quantile()}}, \code{\link[scales:col_numeric]{scales::col_bin()}}, \code{\link[scales:col_numeric]{scales::col_numeric()}}, and
\code{\link[scales:col_numeric]{scales::col_factor()}}. If providing a vector of colors as a palette, each
color value provided must either be a color name (in the set of colors
provided by \code{\link[grDevices:colors]{grDevices::colors()}}) or a hexadecimal string in the form of
"#RRGGBB" or "#RRGGBBAA".}

\item{alpha}{An optional, fixed alpha transparency value that will be applied
to all of the \code{colors} provided (regardless of whether a color palette was
directly supplied or generated through a color mapping function).}

\item{apply_to}{Which style element should the colors be applied to? Options
include the cell background (the default, given as \code{"fill"}) or the cell
text (\code{"text"}).}

\item{autocolor_text}{An option to let \strong{gt} modify the coloring of text
within cells undergoing background coloring. This will in some cases yield
more optimal text-to-background color contrast. By default, this is set to
\code{TRUE}.}
}
\value{
An object of class \code{gt_tbl}.
}
\description{
It's possible to add color to data cells according to their values. The
\code{data_color()} function colors all rows of any \code{columns} supplied. There are
two ways to define how cells are colored: (1) through the use of a supplied
color palette, and (2) through use of a color mapping function available from
the \strong{scales} package. The first method colorizes cell data according to
whether values are character or numeric. The second method provides more
control over how cells are colored since we provide an explicit color
function and thus other requirements such as bin counts, cut points, or a
numeric domain. Finally, we can choose whether to apply the cell-specific
colors to either the cell background or the cell text.
}
\details{
The \verb{col_*()} color mapping functions from the scales package can be used in
the \code{colors} argument. These functions map data values (\code{numeric} or
\code{factor}/\code{character}) to colors according to the provided palette.

\itemize{
\item \code{\link[scales:col_numeric]{scales::col_numeric()}}: provides a simple linear mapping from
continuous numeric data to an interpolated palette.
\item \code{\link[scales:col_numeric]{scales::col_bin()}}: provides a mapping of continuous numeric data to
value-based bins. This internally uses the \code{\link[base:cut]{base::cut()}} function.
\item \code{\link[scales:col_numeric]{scales::col_quantile()}}: provides a mapping of continuous
numeric data to quantiles. This internally uses the
\code{\link[stats:quantile]{stats::quantile()}} function.
\item \code{\link[scales:col_numeric]{scales::col_factor()}}: provides a mapping of factors to colors. If the
palette is discrete and has a different number of colors than the number of
factors, interpolation is used.
}

By default, \strong{gt} will choose the ideal text color (for maximal contrast)
when colorizing the background of data cells. This option can be disabled by
setting \code{autocolor_text} to \code{FALSE}.

Choosing the right color palette can often be difficult because it's both
hard to discover suitable palettes and then obtain the vector of colors. To
make this process easier we can elect to use the \strong{paletteer} package,
which makes a wide range of palettes from various R packages readily
available. The \code{\link[=info_paletteer]{info_paletteer()}} information table allows us to easily
inspect all of the discrete color palettes available in \strong{paletteer}. We
only then need to specify the \code{package} and \code{palette} when calling the
\code{\link[paletteer:paletteer_d]{paletteer::paletteer_d()}} function, and, we get the palette as a vector of
hexadecimal colors.
}
\section{Figures}{

\if{html}{\figure{man_data_color_1.png}{options: width=100\%}}

\if{html}{\figure{man_data_color_2.png}{options: width=100\%}}
}

\section{Function ID}{

3-15
}

\examples{
# library(paletteer)

# Use `countrypops` to create a gt table;
# Apply a color scale to the `population`
# column with `scales::col_numeric`,
# four supplied colors, and a domain
tab_1 <-
  countrypops \%>\%
  dplyr::filter(country_name == "Mongolia") \%>\%
  dplyr::select(-contains("code")) \%>\%
  tail(10) \%>\%
  gt() \%>\%
  data_color(
    columns = population,
    colors = scales::col_numeric(
      palette = c(
        "red", "orange", "green", "blue"),
      domain = c(0.2E7, 0.4E7))
  )

# Use `pizzaplace` to create a gt table;
# Apply colors from the `red_material`
# palette (in the `ggsci` pkg but
# more easily gotten from the `paletteer`
# package, info at `info_paletteer()`) to
# to `sold` and `income` columns; setting
# the `domain` of `scales::col_numeric()`
# to `NULL` will use the bounds of the
# available data as the domain
tab_2 <-
  pizzaplace \%>\%
  dplyr::filter(
    type \%in\% c("chicken", "supreme")) \%>\%
  dplyr::group_by(type, size) \%>\%
  dplyr::summarize(
    sold = dplyr::n(),
    income = sum(price)
  ) \%>\%
  gt(rowname_col = "size") \%>\%
  data_color(
    columns = c(sold, income),
    colors = scales::col_numeric(
      palette = paletteer::paletteer_d(
        palette = "ggsci::red_material"
        ) \%>\% as.character(),
      domain = NULL
      )
  )

}
\seealso{
Other Format Data: 
\code{\link{fmt_bytes}()},
\code{\link{fmt_currency}()},
\code{\link{fmt_datetime}()},
\code{\link{fmt_date}()},
\code{\link{fmt_engineering}()},
\code{\link{fmt_integer}()},
\code{\link{fmt_markdown}()},
\code{\link{fmt_missing}()},
\code{\link{fmt_number}()},
\code{\link{fmt_passthrough}()},
\code{\link{fmt_percent}()},
\code{\link{fmt_scientific}()},
\code{\link{fmt_time}()},
\code{\link{fmt}()},
\code{\link{text_transform}()}
}
\concept{Format Data}
