# Changelog

## gt (development version)

- Update how long text that has a line break or is horizontally aligned
  in a cell (stubs, labels, table body).
  ([@thebioengineer](https://github.com/thebioengineer))

- Added `stub.separate` option to control if vertical bars/borders are
  added for stubs ([\#2096](https://github.com/rstudio/gt/issues/2096)).
  ([@thebioengineer](https://github.com/thebioengineer))

## gt 1.2.0

CRAN release: 2025-12-16

- The new
  [`fmt_number_si()`](https://gt.rstudio.com/reference/fmt_number_si.md)
  function format numeric values with SI prefixes and an optional unit
  (which could be also be obtained from a separate column),
  automatically selecting the appropriate prefix to keep the mantissa in
  a readable range
  ([\#1999](https://github.com/rstudio/gt/issues/1999)).
  ([\#2060](https://github.com/rstudio/gt/issues/2060))

- Added the
  [`summary_columns()`](https://gt.rstudio.com/reference/summary_columns.md)
  function to enable horizontal, row-wise aggregation
  ([\#382](https://github.com/rstudio/gt/issues/382)).
  ([\#2067](https://github.com/rstudio/gt/issues/2067))

- Added the `min_sep_threshold` argument to numeric formatting
  functions; this controls the minimum number of digits required in the
  integer part of a number for grouping separators to be applied
  ([\#908](https://github.com/rstudio/gt/issues/908)).
  ([\#2064](https://github.com/rstudio/gt/issues/2064))

- Added the `omit_na_group` argument to the
  [`gt()`](https://gt.rstudio.com/reference/gt.md) function; when
  `TRUE`, rows with `NA` values in the `groupname_col` be excluded from
  row group assignment (the default of `FALSE` preserves the old
  behavior) ([\#1215](https://github.com/rstudio/gt/issues/1215)).
  ([\#2062](https://github.com/rstudio/gt/issues/2062))

- The [`stub()`](https://gt.rstudio.com/reference/stub.md) helper now
  works with tables having a multi-column stub
  ([\#2066](https://github.com/rstudio/gt/issues/2066)).
  ([\#2069](https://github.com/rstudio/gt/issues/2069))

- Fixed issue where loading in the Unicode conversion file (for LaTeX
  output tables) fails
  ([\#2048](https://github.com/rstudio/gt/issues/2048)).
  ([\#2049](https://github.com/rstudio/gt/issues/2049))

- Added fix to make LaTeX Unicode conversion operations optional (as
  well as make them work in-line)
  ([\#2037](https://github.com/rstudio/gt/issues/2037),
  [\#2041](https://github.com/rstudio/gt/issues/2041)).
  ([@thebioengineer](https://github.com/thebioengineer),
  [\#2042](https://github.com/rstudio/gt/issues/2042))

- Fixed a bug where LaTeX spanner widths were based on incorrect column
  widths ([\#1922](https://github.com/rstudio/gt/issues/1922),
  [\#2016](https://github.com/rstudio/gt/issues/2016)).
  ([@shannonhaughton](https://github.com/shannonhaughton),
  [\#2079](https://github.com/rstudio/gt/issues/2079))

- The
  [`fmt_scientific()`](https://gt.rstudio.com/reference/fmt_scientific.md)
  function should no longer error when formatting `Inf`/`-Inf` values in
  a table column ([\#1516](https://github.com/rstudio/gt/issues/1516)).
  ([\#2058](https://github.com/rstudio/gt/issues/2058))

- Allow for horizontal alignment within cells of LaTeX output tables
  ([\#2001](https://github.com/rstudio/gt/issues/2001)).
  ([@thebioengineer](https://github.com/thebioengineer),
  [\#2075](https://github.com/rstudio/gt/issues/2075))

- Added functionality for handling tables with a multicolumn stub in the
  Word output format.
  ([@romainfrancois](https://github.com/romainfrancois),
  [\#2074](https://github.com/rstudio/gt/issues/2074),
  [\#2086](https://github.com/rstudio/gt/issues/2086))

- We now correctly handle tables with a multicolumn stub in the RTF
  output format ([\#2045](https://github.com/rstudio/gt/issues/2045)).
  ([\#2061](https://github.com/rstudio/gt/issues/2061))

- Added better support for LaTeX tables with a multicolumn stub
  ([\#2044](https://github.com/rstudio/gt/issues/2044)).
  ([\#2051](https://github.com/rstudio/gt/issues/2051))

- The `countrypops` dataset has been updated to include population
  values up to 2024.
  ([\#2057](https://github.com/rstudio/gt/issues/2057))

- GitHub Actions workflows were updated.
  ([@olivroy](https://github.com/olivroy),
  [\#2077](https://github.com/rstudio/gt/issues/2077))

- Refactored pipe use, moving many pipes in the codebase from `%>%` to
  `|>`. ([\#2056](https://github.com/rstudio/gt/issues/2056))

## gt 1.1.0

CRAN release: 2025-09-23

### New features

- We can now have multiple columns be a part of the stub by using the
  enhanced `rowname_col` argument in
  [`gt()`](https://gt.rstudio.com/reference/gt.md); it can take a vector
  of one or more column names
  ([\#601](https://github.com/rstudio/gt/issues/601),
  [\#918](https://github.com/rstudio/gt/issues/918),
  [\#1406](https://github.com/rstudio/gt/issues/1406),
  [\#1408](https://github.com/rstudio/gt/issues/1408)).
  ([\#2008](https://github.com/rstudio/gt/issues/2008))

- [`data_color()`](https://gt.rstudio.com/reference/data_color.md) now
  allows for specification which light/dark colors to use when
  `autocolor_text = TRUE`. ([@xx02al](https://github.com/xx02al),
  [\#1930](https://github.com/rstudio/gt/issues/1930))

- Added the [`latex()`](https://gt.rstudio.com/reference/latex.md)
  helper function to allow the insertion of raw LaTeX strings.
  ([@thebioengineer](https://github.com/thebioengineer),
  [\#1912](https://github.com/rstudio/gt/issues/1912))

- You can now use several `cols_*()` functions with `gt_group` objects
  ([\#2005](https://github.com/rstudio/gt/issues/2005),
  [\#2012](https://github.com/rstudio/gt/issues/2012)).
  ([@shannonhaughton](https://github.com/shannonhaughton),
  [\#2010](https://github.com/rstudio/gt/issues/2010),
  [\#2013](https://github.com/rstudio/gt/issues/2013))

### Minor improvements and bug fixes

- Improvements to options for LaTeX including repeating headers, removal
  of top and bottom lines, font sizes, and line breaks
  ([\#1630](https://github.com/rstudio/gt/issues/1630),
  [\#1061](https://github.com/rstudio/gt/issues/1061),
  [\#1767](https://github.com/rstudio/gt/issues/1767),
  [\#1912](https://github.com/rstudio/gt/issues/1912)).
  ([@thebioengineer](https://github.com/thebioengineer),
  [\#1995](https://github.com/rstudio/gt/issues/1995))

- Added support for some Unicode characters when writing tables as
  LaTeX. ([@thebioengineer](https://github.com/thebioengineer),
  [\#1996](https://github.com/rstudio/gt/issues/1996))

- [`as_word()`](https://gt.rstudio.com/reference/as_word.md) now handles
  `"<br>"` line breaks for
  [`md()`](https://gt.rstudio.com/reference/md.md) and
  [`html()`](https://gt.rstudio.com/reference/html.md), and no longer
  automatically adds `"Table N"` ahead of the caption
  ([\#1966](https://github.com/rstudio/gt/issues/1966)).
  ([@thebioengineer](https://github.com/thebioengineer),
  [\#1983](https://github.com/rstudio/gt/issues/1983))

- Corrected text processing in instances where
  [`md()`](https://gt.rstudio.com/reference/md.md) is used with
  [`tab_footnote()`](https://gt.rstudio.com/reference/tab_footnote.md)
  for Word output tables
  ([\#1892](https://github.com/rstudio/gt/issues/1892),
  [\#1983](https://github.com/rstudio/gt/issues/1983)).
  ([@olivroy](https://github.com/olivroy),
  [\#1892](https://github.com/rstudio/gt/issues/1892))

- Fixed an issue where grand summary rows would not work properly with
  Word output tables
  ([\#2000](https://github.com/rstudio/gt/issues/2000)).
  ([@olivroy](https://github.com/olivroy),
  [\#2007](https://github.com/rstudio/gt/issues/2007))

- Fixed an encoding issue with Word output tables when using the
  [`sub_small_vals()`](https://gt.rstudio.com/reference/sub_small_vals.md)
  and
  [`sub_large_vals()`](https://gt.rstudio.com/reference/sub_large_vals.md)
  functions ([\#1997](https://github.com/rstudio/gt/issues/1997)).
  ([@olivroy](https://github.com/olivroy),
  [\#2014](https://github.com/rstudio/gt/issues/2014))

- Stub alignment values for RTF output tables are now honored
  ([\#2019](https://github.com/rstudio/gt/issues/2019)).
  ([@shannonhaughton](https://github.com/shannonhaughton),
  [\#2021](https://github.com/rstudio/gt/issues/2021))

- Added support for use of
  [`fmt_image()`](https://gt.rstudio.com/reference/fmt_image.md) with
  RTF output tables
  ([\#2029](https://github.com/rstudio/gt/issues/2029)).
  ([@shannonhaughton](https://github.com/shannonhaughton),
  [\#2030](https://github.com/rstudio/gt/issues/2030))

- HTML output tables no longer have multiple instances of `<tfoot>` tags
  ([\#1296](https://github.com/rstudio/gt/issues/1296)).
  ([\#2025](https://github.com/rstudio/gt/issues/2025))

- Fixed a length recycling issue when using gt with Quarto
  ([\#1985](https://github.com/rstudio/gt/issues/1985)).
  ([@olivroy](https://github.com/olivroy),
  [\#1986](https://github.com/rstudio/gt/issues/1986))

- The `metro` and `films` datasets have been updated.
  ([\#2026](https://github.com/rstudio/gt/issues/2026),
  [\#2027](https://github.com/rstudio/gt/issues/2027))

- Add option to control the order of footnotes
  ([\#2023](https://github.com/rstudio/gt/issues/2023)).
  ([@shannonhaughton](https://github.com/shannonhaughton),
  [\#2036](https://github.com/rstudio/gt/issues/2036))

## gt 1.0.0

CRAN release: 2025-04-05

### Minor improvements and bug fixes

- Tables embedded in Shiny apps with
  [`gt_output()`](https://gt.rstudio.com/reference/gt_output.md) and
  [`render_gt()`](https://gt.rstudio.com/reference/render_gt.md) with
  `ihtml.selection_mode` enabled also act as inputs, reporting the row
  numbers that are selected
  ([\#354](https://github.com/rstudio/gt/issues/354),
  [\#1368](https://github.com/rstudio/gt/issues/1368)).
  ([@jonthegeek](https://github.com/jonthegeek),
  [\#1909](https://github.com/rstudio/gt/issues/1909))

- Significantly faster rendering of certain large tables, by optimizing
  the internal `rownum_translation()` utility
  ([\#1924](https://github.com/rstudio/gt/issues/1924)).
  ([@magnusdv](https://github.com/magnusdv),
  [\#1925](https://github.com/rstudio/gt/issues/1925))

- Fixed an issue in
  [`fmt_number()`](https://gt.rstudio.com/reference/fmt_number.md) where
  `drop_trailing_dec_mark` would be ignored if `use_seps = FALSE`
  ([\#1961](https://github.com/rstudio/gt/issues/1961)).
  ([@olivroy](https://github.com/olivroy),
  [\#1962](https://github.com/rstudio/gt/issues/1962)).

- Fixed an issue where
  [`fmt_markdown()`](https://gt.rstudio.com/reference/fmt_markdown.md)
  could create strange output in Quarto (html and Typst formats)
  ([\#1957](https://github.com/rstudio/gt/issues/1957)).
  ([@olivroy](https://github.com/olivroy),
  [\#1958](https://github.com/rstudio/gt/issues/1958),
  [quarto-dev/quarto-cli#11932](https://github.com/quarto-dev/quarto-cli/issues/11932),
  [quarto-dev/quarto-cli#11610](https://github.com/quarto-dev/quarto-cli/issues/11610)).

- The default table position in LaTeX is now “t” instead of “!t”
  ([@AaronGullickson](https://github.com/AaronGullickson),
  [\#1935](https://github.com/rstudio/gt/issues/1935)).

- Fixed an issue where cross-references would fail in
  bookdown::html_document2 ([@olivroy](https://github.com/olivroy),
  [\#1948](https://github.com/rstudio/gt/issues/1948))

- Improved width calculations in
  [`as_gtable()`](https://gt.rstudio.com/reference/as_gtable.md)
  ([@teunbrand](https://github.com/teunbrand),
  [\#1923](https://github.com/rstudio/gt/issues/1923))

- `gt(row_group_as_column = TRUE)` now works if multiple groups are
  supplied ([\#1552](https://github.com/rstudio/gt/issues/1552)).
  ([@olivroy](https://github.com/olivroy),
  [\#1801](https://github.com/rstudio/gt/issues/1801)).

- Fixed many typos in the documentation.
  ([\#1910](https://github.com/rstudio/gt/issues/1910), thanks
  [@MichaelChirico](https://github.com/MichaelChirico)!)

## gt 0.11.1

CRAN release: 2024-10-04

### Breaking changes

- The
  [`extract_body()`](https://gt.rstudio.com/reference/extract_body.md)
  function now, by default, will not display columns that have been
  hidden (e.g., by
  [`cols_hide()`](https://gt.rstudio.com/reference/cols_hide.md) or
  `cols_merge*()`); the previous behavior can be restored by using
  `incl_hidden_cols = TRUE`.

### Improvements to the LaTeX output format

- PDF output now defaults to a full-width floating environment using
  `tabular*`. Float position can be controlled by the `latex.tbl.pos`
  argument in `tab_options`. Quarto users can alternatively use the
  `tbl-pos` argument to control positioning. To use a `longtable`
  environment instead, use `tab_options(latex.use_longtable = TRUE)`.
  ([@AronGullickson](https://github.com/AronGullickson),
  [\#1588](https://github.com/rstudio/gt/issues/1588))

- Creating a caption with
  [`tab_caption()`](https://gt.rstudio.com/reference/tab_caption.md)
  will now be preserved in LaTeX output with
  [`as_latex()`](https://gt.rstudio.com/reference/as_latex.md).
  Cross-referencing a table using the internal cross-referencing system
  of **bookdown** is now enabled for PDF and HTML outputs (for HTML, set
  `options("htmltools.preserve.raw" = FALSE)`). Quarto users should use
  the `tbl-cap` and `label` cell options.
  ([@nielsbock](https://github.com/nielsbock),
  [\#1800](https://github.com/rstudio/gt/issues/1800))

- Improved the centering of the stubhead label in Latex when
  `row_group_as_column = TRUE` and the width of the row name column is
  specified. ([@kbrevoort](https://github.com/kbrevoort),
  [\#1804](https://github.com/rstudio/gt/issues/1804))

- LaTeX now correctly renders if text size is changed
  ([\#1885](https://github.com/rstudio/gt/issues/1885)).
  ([@olivroy](https://github.com/olivroy),
  [\#1899](https://github.com/rstudio/gt/issues/1899))

- Fixed a bug that caused an error in LaTeX when (1)
  `row_group_as_column = TRUE`, (2) the row groups were specified using
  [`tab_row_group()`](https://gt.rstudio.com/reference/tab_row_group.md),
  and (3) the user specified a width for the row label column.
  ([@kbrevoort](https://github.com/kbrevoort),
  [\#1804](https://github.com/rstudio/gt/issues/1804))

- Fixed an issue where column widths weren’t set properly using
  `col_widths()` for LaTeX output
  ([\#1837](https://github.com/rstudio/gt/issues/1837)).
  ([@snhansen](https://github.com/snhansen),
  [\#1867](https://github.com/rstudio/gt/issues/1867))

### Interactive table support

- Interactive tables will show no border if
  `opt_table_lines(extent = "none")` is specified
  ([\#1307](https://github.com/rstudio/gt/issues/1307)).

- Interactive tables now respect more styling options, namely:
  `column_labels.background.color`, `row_group.background.color`,
  `row_group.font.weight`, `table_body.hlines.style`,
  `table.font.weight`, `table.font.size`, and `stub.font.weight`.
  ([\#1693](https://github.com/rstudio/gt/issues/1693))

- [`opt_interactive()`](https://gt.rstudio.com/reference/opt_interactive.md)
  now works when columns are merged with
  [`cols_merge()`](https://gt.rstudio.com/reference/cols_merge.md).
  ([@olivroy](https://github.com/olivroy),
  [\#1785](https://github.com/rstudio/gt/issues/1785))

- [`opt_interactive()`](https://gt.rstudio.com/reference/opt_interactive.md)
  now works when columns are substituted with `sub_*()`.
  ([@olivroy](https://github.com/olivroy),
  [\#1759](https://github.com/rstudio/gt/issues/1759))

- More support for
  [`cells_stubhead()`](https://gt.rstudio.com/reference/cells_stubhead.md)
  styling and footnotes in interactive tables.

### Minor improvements and bug fixes

- New arguments have been added to
  [`extract_body()`](https://gt.rstudio.com/reference/extract_body.md)
  to better control which columns will be present in the returned data
  ([\#1875](https://github.com/rstudio/gt/issues/1875)).
  ([\#1889](https://github.com/rstudio/gt/issues/1889))

- The `locale` argument of
  [`gt()`](https://gt.rstudio.com/reference/gt.md) now defaults to
  `getOption("gt.locale")` if set.
  ([\#1894](https://github.com/rstudio/gt/issues/1894))

- The optional argument `levels` was added to
  [`cells_column_spanners()`](https://gt.rstudio.com/reference/cells_column_spanners.md)
  to constrain targeting of column spanners by their level.
  ([@obsaditelnost](https://github.com/obsaditelnost),
  [\#1858](https://github.com/rstudio/gt/issues/1858))

- Fixed a bug in using
  [`pct()`](https://gt.rstudio.com/reference/pct.md) column widths with
  [`as_gtable()`](https://gt.rstudio.com/reference/as_gtable.md)
  ([\#1771](https://github.com/rstudio/gt/issues/1771)).
  ([@teunbrand](https://github.com/teunbrand),
  [\#1776](https://github.com/rstudio/gt/issues/1776))

- Fixed a bug where `gt(row_group_as_column = TRUE)` would create the
  wrong layout with
  [`as_gtable()`](https://gt.rstudio.com/reference/as_gtable.md) when
  all groups are unique. ([@olivroy](https://github.com/olivroy),
  [\#1803](https://github.com/rstudio/gt/issues/1803))

- Showing currency symbols in grid output now works.
  ([@olivroy](https://github.com/olivroy),
  [\#1788](https://github.com/rstudio/gt/issues/1788))

- [`data_color()`](https://gt.rstudio.com/reference/data_color.md) no
  longer errors when a tidyselect selection is empty (like `fmt_*()`
  functions) ([\#1665](https://github.com/rstudio/gt/issues/1665)).
  ([@olivroy](https://github.com/olivroy),
  [\#1795](https://github.com/rstudio/gt/issues/1795))

- Fixed an issue when using
  `text_case_match(.replace = "all", .locations = cells_column_spanners())`.
  ([@olivroy](https://github.com/olivroy),
  [\#1823](https://github.com/rstudio/gt/issues/1823))

- Improved performance during footnote rendering.
  ([@olivroy](https://github.com/olivroy),
  [\#1818](https://github.com/rstudio/gt/issues/1818))

- Improved footnote rendering in Quarto with
  [`fmt_markdown()`](https://gt.rstudio.com/reference/fmt_markdown.md)
  ([\#1773](https://github.com/rstudio/gt/issues/1773)).
  ([@olivroy](https://github.com/olivroy),
  [\#1860](https://github.com/rstudio/gt/issues/1860))

- Fixed an issue where `md("")` would fail in Quarto
  ([\#1769](https://github.com/rstudio/gt/issues/1769)).
  ([@olivroy](https://github.com/olivroy),
  [\#1772](https://github.com/rstudio/gt/issues/1772))

- Fixed a bug where spanners didn’t render correctly in Quarto
  ([\#1839](https://github.com/rstudio/gt/issues/1839)).
  ([\#1856](https://github.com/rstudio/gt/issues/1856))

- [`vec_fmt_markdown()`](https://gt.rstudio.com/reference/vec_fmt_markdown.md)
  works correctly inside Quarto again
  ([\#1840](https://github.com/rstudio/gt/issues/1840)).
  ([@olivroy](https://github.com/olivroy),
  [\#1841](https://github.com/rstudio/gt/issues/1841))

- Fixed an issue where
  [`tab_spanner_delim()`](https://gt.rstudio.com/reference/tab_spanner_delim.md)
  would fail to resolve a duplicate ID value.
  ([@olivroy](https://github.com/olivroy),
  [\#1821](https://github.com/rstudio/gt/issues/1821))

- Fixed an issue with multiple
  [`text_replace()`](https://gt.rstudio.com/reference/text_replace.md)
  calls would produce bad results with
  [`cells_column_labels()`](https://gt.rstudio.com/reference/cells_column_labels.md).
  ([@olivroy](https://github.com/olivroy),
  [\#1824](https://github.com/rstudio/gt/issues/1824))

- [`cols_add()`](https://gt.rstudio.com/reference/cols_add.md) works
  correctly in more cases.
  ([\#1893](https://github.com/rstudio/gt/issues/1893))

- [`tab_footnote()`](https://gt.rstudio.com/reference/tab_footnote.md)
  now correctly adds footnote marks in the
  [`cells_stub_summary()`](https://gt.rstudio.com/reference/cells_stub_summary.md)
  and
  [`cells_stub_grand_summary()`](https://gt.rstudio.com/reference/cells_stub_grand_summary.md)
  locations ([\#1832](https://github.com/rstudio/gt/issues/1832)).
  ([@olivroy](https://github.com/olivroy),
  [\#1833](https://github.com/rstudio/gt/issues/1833))

- [`tidyselect::where()`](https://tidyselect.r-lib.org/reference/where.html),
  [`tidyselect::all_of()`](https://tidyselect.r-lib.org/reference/all_of.html),
  and
  [`tidyselect::any_of()`](https://tidyselect.r-lib.org/reference/all_of.html)
  are now re-exported by gt.
  ([\#1830](https://github.com/rstudio/gt/issues/1830))

- Fixed an issue where [`md()`](https://gt.rstudio.com/reference/md.md)
  and
  [`fmt_markdown()`](https://gt.rstudio.com/reference/fmt_markdown.md)
  would render factors as their numeric levels rather than their text
  labels ([\#1882](https://github.com/rstudio/gt/issues/1882)).
  ([@rossellhayes](https://github.com/rossellhayes),
  [\#1883](https://github.com/rstudio/gt/issues/1883))

- `vec_fmt_*()` (and incidentally
  [`cols_nanoplot()`](https://gt.rstudio.com/reference/cols_nanoplot.md))
  should be faster now. ([@olivroy](https://github.com/olivroy),
  [\#1888](https://github.com/rstudio/gt/issues/1888),
  [\#1891](https://github.com/rstudio/gt/issues/1891),
  [\#1896](https://github.com/rstudio/gt/issues/1896),
  [\#1901](https://github.com/rstudio/gt/issues/1901))

- Improved error messages for the
  [`text_transform()`](https://gt.rstudio.com/reference/text_transform.md)
  function if `locations` couldn’t be resolved.
  ([@olivroy](https://github.com/olivroy),
  [\#1774](https://github.com/rstudio/gt/issues/1774))

- [`tab_row_group()`](https://gt.rstudio.com/reference/tab_row_group.md)
  gives a more precise error message when `rows` can’t be resolved
  correctly ([\#1535](https://github.com/rstudio/gt/issues/1535)).
  ([@olivroy](https://github.com/olivroy),
  [\#1770](https://github.com/rstudio/gt/issues/1770))

## gt 0.11.0

CRAN release: 2024-07-09

### New features

- **gt** tables can now be rendered in the grid graphics system with the
  new [`as_gtable()`](https://gt.rstudio.com/reference/as_gtable.md)
  function ([\#180](https://github.com/rstudio/gt/issues/180),
  [\#420](https://github.com/rstudio/gt/issues/420),
  [\#509](https://github.com/rstudio/gt/issues/509),
  [\#961](https://github.com/rstudio/gt/issues/961),
  [\#1652](https://github.com/rstudio/gt/issues/1652),
  [\#1701](https://github.com/rstudio/gt/issues/1701)). Thank you
  [@teunbrand](https://github.com/teunbrand) for this valuable
  contribution! ([\#1563](https://github.com/rstudio/gt/issues/1563),
  [\#1648](https://github.com/rstudio/gt/issues/1648),
  [\#1655](https://github.com/rstudio/gt/issues/1655),
  [\#1727](https://github.com/rstudio/gt/issues/1727))

- With the new
  [`fmt_chem()`](https://gt.rstudio.com/reference/fmt_chem.md) function,
  it’s possible to format chemical formulas and chemical equations in
  the table body. ([\#1636](https://github.com/rstudio/gt/issues/1636))

- We added
  [`fmt_email()`](https://gt.rstudio.com/reference/fmt_email.md) we can
  transform email addresses in table cells into usable ‘mailto:’ links.
  This operates similarly to
  [`fmt_url()`](https://gt.rstudio.com/reference/fmt_url.md) but removes
  some unneeded anchor tag attributes
  ([\#1616](https://github.com/rstudio/gt/issues/1616)).
  ([\#1649](https://github.com/rstudio/gt/issues/1649))

- The new [`fmt_tf()`](https://gt.rstudio.com/reference/fmt_tf.md)
  function lets you format logical values in a **gt** table. You could
  express these as a ‘yes’ or ‘no’, a ‘true’ or ‘false’, or, perhaps use
  pairings of complementary symbols that make sense in a table
  ([\#1650](https://github.com/rstudio/gt/issues/1650)).
  ([\#1654](https://github.com/rstudio/gt/issues/1654))

- The new
  [`fmt_country()`](https://gt.rstudio.com/reference/fmt_country.md) was
  added to help with making country names consistent and localizable.
  The input text can either consist of 2- or 3-letter ISO 3166-1 country
  codes. ([\#1645](https://github.com/rstudio/gt/issues/1645),
  [\#1696](https://github.com/rstudio/gt/issues/1696))

- Math formulas (written in LaTeX) can now be rendered to HTML through
  [`md()`](https://gt.rstudio.com/reference/md.md) and
  [`fmt_markdown()`](https://gt.rstudio.com/reference/fmt_markdown.md).
  The LaTeX formulas can be set between `$` or `$$` delimiters for
  inline and block rendering styles. While this requires the **katex**
  package to work (it’s an optional dependency), the rendering of
  formulas is dependency-free in the output
  ([\#375](https://github.com/rstudio/gt/issues/375),
  [\#616](https://github.com/rstudio/gt/issues/616),
  [\#1163](https://github.com/rstudio/gt/issues/1163)).
  ([\#1578](https://github.com/rstudio/gt/issues/1578))

- We added the
  [`unit_conversion()`](https://gt.rstudio.com/reference/unit_conversion.md)
  helper function to help you perform unit conversions. This function
  returns a conversion factor for transforming a value from one form of
  measurement units to a target form. This works wonderfully in the
  `scale_by` argument that is present in many number-based `fmt_*()`
  functions. ([\#1704](https://github.com/rstudio/gt/issues/1704),
  [\#1709](https://github.com/rstudio/gt/issues/1709),
  [\#1710](https://github.com/rstudio/gt/issues/1710),
  [\#1729](https://github.com/rstudio/gt/issues/1729))

- The [`plot()`](https://rdrr.io/r/graphics/plot.default.html) method
  was added for `gt_tbl` so that one can quickly create a reprex visual
  example (e.g., `exibble |> gt() |> plot()`).
  ([\#1742](https://github.com/rstudio/gt/issues/1742))

- [`info_time_style()`](https://gt.rstudio.com/reference/info_time_style.md)
  and
  [`info_date_style()`](https://gt.rstudio.com/reference/info_date_style.md)
  gain a `locale` argument to preview time and date formatting in a
  specific locale. ([\#1747](https://github.com/rstudio/gt/issues/1747))

- Several datasets were added to the package: `reactions`, `photolysis`,
  `peeps`, `nuclides`, `gibraltar`, and `films`.
  ([\#1619](https://github.com/rstudio/gt/issues/1619),
  [\#1641](https://github.com/rstudio/gt/issues/1641),
  [\#1664](https://github.com/rstudio/gt/issues/1664),
  [\#1668](https://github.com/rstudio/gt/issues/1668),
  [\#1686](https://github.com/rstudio/gt/issues/1686),
  [\#1695](https://github.com/rstudio/gt/issues/1695))

### Improvements to the LaTeX output format

- A host of improvements were made to LaTeX output such that styling
  made through
  [`tab_options()`](https://gt.rstudio.com/reference/tab_options.md) and
  [`tab_style()`](https://gt.rstudio.com/reference/tab_style.md) is now
  honored. The styling implemented now includes: (1) font size,
  underlining, italicizing, bolding, indenting text, coloring text,
  filling cell backgrounds, and modifying text case (i.e., uppercase,
  lowercase, sentence case)
  ([\#1472](https://github.com/rstudio/gt/issues/1472)).
  ([\#1594](https://github.com/rstudio/gt/issues/1594),
  [\#1603](https://github.com/rstudio/gt/issues/1603),
  [\#1746](https://github.com/rstudio/gt/issues/1746), thanks so much
  [@kbrevoort](https://github.com/kbrevoort))

- Text in spanner labels is now nicely wrapped in LaTeX output, where
  before there would be no wrapping at all
  ([\#1656](https://github.com/rstudio/gt/issues/1656)).
  ([\#1716](https://github.com/rstudio/gt/issues/1716),
  [\#1746](https://github.com/rstudio/gt/issues/1746))

- The [`gt()`](https://gt.rstudio.com/reference/gt.md) setting of
  `row_group_as_column == TRUE` is now implemented in LaTeX output.
  ([\#1716](https://github.com/rstudio/gt/issues/1716))

- LaTeX output now understands and can convert from lengths expressed in
  pixels (an internal conversion to pt units is performed)
  ([\#1582](https://github.com/rstudio/gt/issues/1582)).
  ([\#1595](https://github.com/rstudio/gt/issues/1595))

- A fix was made to correct an error related to converting px units to
  pt units for LaTeX output.
  ([\#1591](https://github.com/rstudio/gt/issues/1591), thank you
  [@AaronGullickson](https://github.com/AaronGullickson))

### Improvements to interactive HTML tables via `opt_interactive()`

- The performance of interactive table rendering through
  [`opt_interactive()`](https://gt.rstudio.com/reference/opt_interactive.md)
  has been improved
  ([\#1289](https://github.com/rstudio/gt/issues/1289)).
  ([\#1735](https://github.com/rstudio/gt/issues/1735))

- [`opt_interactive()`](https://gt.rstudio.com/reference/opt_interactive.md)
  now shows row names if `rownames_to_stub = TRUE`
  ([\#1702](https://github.com/rstudio/gt/issues/1702)).
  ([@olivroy](https://github.com/olivroy),
  [\#1706](https://github.com/rstudio/gt/issues/1706))

- There’s now better support for displaying group columns, if present,
  in interactive tables
  ([\#1705](https://github.com/rstudio/gt/issues/1705)).
  ([@olivroy](https://github.com/olivroy),
  [\#1725](https://github.com/rstudio/gt/issues/1725),
  [\#1758](https://github.com/rstudio/gt/issues/1758),
  [\#1760](https://github.com/rstudio/gt/issues/1760))

- Interactive tables can now display the stub header label created with
  [`tab_stubhead()`](https://gt.rstudio.com/reference/tab_stubhead.md).
  ([@olivroy](https://github.com/olivroy),
  [\#1758](https://github.com/rstudio/gt/issues/1758)).

- There is no longer an error when having a hidden column under a
  spanner label in an interactive HTML table (i.e.,
  [`opt_interactive()`](https://gt.rstudio.com/reference/opt_interactive.md))
  context. ([\#1629](https://github.com/rstudio/gt/issues/1629))

- Interactive tables now render the first level of column groups added
  by [`tab_spanner()`](https://gt.rstudio.com/reference/tab_spanner.md)
  ([\#1618](https://github.com/rstudio/gt/issues/1618)). Thanks
  [@obsaditelnost](https://github.com/obsaditelnost) for your work on
  this! ([\#1623](https://github.com/rstudio/gt/issues/1623))

- The
  [`opt_interactive()`](https://gt.rstudio.com/reference/opt_interactive.md)
  function now has the `height` argument to help specify the height of
  an interactive table
  ([\#1544](https://github.com/rstudio/gt/issues/1544)).
  ([@olivroy](https://github.com/olivroy),
  [\#1723](https://github.com/rstudio/gt/issues/1723)).

- When using `opt_interactive(use_pagination = FALSE)` the pagination
  controls are now entirely removed instead of merely being
  non-functional ([\#1542](https://github.com/rstudio/gt/issues/1542)).
  ([\#1642](https://github.com/rstudio/gt/issues/1642))

- When supplying a locale value to an interactive table, we now ensure
  that the supplied locale is normalized (so `"fr_CH"` will be
  internally corrected to `"fr-CH"`)
  ([\#1637](https://github.com/rstudio/gt/issues/1637)).
  ([\#1643](https://github.com/rstudio/gt/issues/1643))

### Minor improvements and bug fixes

- The `fill_color` argument in
  [`fmt_icon()`](https://gt.rstudio.com/reference/fmt_icon.md) now
  allows the use of named vector/list to apply different colors to
  different icons ([\#1560](https://github.com/rstudio/gt/issues/1560)).
  ([\#1647](https://github.com/rstudio/gt/issues/1647))

- [`fmt_flag()`](https://gt.rstudio.com/reference/fmt_flag.md) gains a
  `locale` argument so that SVG title text displays country names in any
  locale language. ([\#1645](https://github.com/rstudio/gt/issues/1645))

- To better represent missing values in nanoplots, the `"marker"` option
  has been added in
  [`cols_nanoplot()`](https://gt.rstudio.com/reference/cols_nanoplot.md)
  ([\#1567](https://github.com/rstudio/gt/issues/1567)).
  ([\#1587](https://github.com/rstudio/gt/issues/1587))

- Many of the `info_*()` functions were upgraded with better
  functionality and a refreshed look.
  ([\#1720](https://github.com/rstudio/gt/issues/1720),
  [\#1748](https://github.com/rstudio/gt/issues/1748),
  [\#1754](https://github.com/rstudio/gt/issues/1754))

- The `metro` dataset has been updated with six new Line 11 stations
  that opened on 2024-06-13.
  ([\#1708](https://github.com/rstudio/gt/issues/1708))

- For HTML tables produced in Quarto, we now use the `data-qmd-base64`
  attribute along with base64 text when passing Markdown text to Quarto
  (which handles the Markdown conversion)
  ([\#1487](https://github.com/rstudio/gt/issues/1487),
  [\#1488](https://github.com/rstudio/gt/issues/1488)).
  ([\#1688](https://github.com/rstudio/gt/issues/1688),
  [\#1690](https://github.com/rstudio/gt/issues/1690),
  [\#1734](https://github.com/rstudio/gt/issues/1734))

- Scientific and engineering notation will no longer unexpectedly wrap
  lines in HTML for smaller column widths.
  ([\#1621](https://github.com/rstudio/gt/issues/1621))

- Footnote marks in HTML table outputs no longer unexpectedly increase
  the text line height
  ([\#1556](https://github.com/rstudio/gt/issues/1556)).
  ([\#1644](https://github.com/rstudio/gt/issues/1644))

- We now ensure tables print correctly when called from inline code in
  `.qmd` or `.Rmd` documents
  ([\#1055](https://github.com/rstudio/gt/issues/1055)).
  ([\#1689](https://github.com/rstudio/gt/issues/1689))

- [`data_color()`](https://gt.rstudio.com/reference/data_color.md)
  throws a more informative error if an internal calculation failed
  (e.g., presence of infinite values)
  ([\#1373](https://github.com/rstudio/gt/issues/1373)).
  ([@olivroy](https://github.com/olivroy),
  [\#1585](https://github.com/rstudio/gt/issues/1585))

- [`data_color()`](https://gt.rstudio.com/reference/data_color.md)
  provides an informative error message if `rows` doesn’t resolve to
  anything. ([@olivroy](https://github.com/olivroy),
  [\#1659](https://github.com/rstudio/gt/issues/1659))

- [`data_color()`](https://gt.rstudio.com/reference/data_color.md)
  provides an error message if `rows` doesn’t resolve to anything
  ([\#1659](https://github.com/rstudio/gt/issues/1659)).
  ([@olivroy](https://github.com/olivroy),
  [\#1660](https://github.com/rstudio/gt/issues/1660)).

- [`summary_rows()`](https://gt.rstudio.com/reference/summary_rows.md)
  now throws a more informative error message that you should use
  [`grand_summary_rows()`](https://gt.rstudio.com/reference/grand_summary_rows.md)
  if no row groups are detected
  ([\#1292](https://github.com/rstudio/gt/issues/1292)).
  ([@olivroy](https://github.com/olivroy),
  [\#1752](https://github.com/rstudio/gt/issues/1752))

- Boxplot-based nanoplots now correctly determine which data points are
  outliers. ([\#1756](https://github.com/rstudio/gt/issues/1756))

- The issue where having a row group set as a column in the stub,
  corrupting the setting of column widths in HTML output tables, has
  been fixed ([\#1253](https://github.com/rstudio/gt/issues/1253),
  [\#1510](https://github.com/rstudio/gt/issues/1510)).
  ([\#1744](https://github.com/rstudio/gt/issues/1744))

- The rendering of footnotes and source notes received fixes to ensure
  that all requested notes are inserted and also that the typesetting
  options in
  [`tab_options()`](https://gt.rstudio.com/reference/tab_options.md) is
  implemented ([\#1505](https://github.com/rstudio/gt/issues/1505),
  [\#1615](https://github.com/rstudio/gt/issues/1615)).
  ([\#1620](https://github.com/rstudio/gt/issues/1620),
  [\#1751](https://github.com/rstudio/gt/issues/1751))

- Using a `fmt_*()` function while the stub is composed of Markdown or
  HTML no longer results in an error
  ([\#1600](https://github.com/rstudio/gt/issues/1600)).
  ([\#1627](https://github.com/rstudio/gt/issues/1627))

- The combination of using
  [`cols_label()`](https://gt.rstudio.com/reference/cols_label.md) +
  [`summary_rows()`](https://gt.rstudio.com/reference/summary_rows.md) /
  [`grand_summary_rows()`](https://gt.rstudio.com/reference/grand_summary_rows.md)
  no longer causes an error for RTF output through
  [`gtsave()`](https://gt.rstudio.com/reference/gtsave.md)
  ([\#1233](https://github.com/rstudio/gt/issues/1233)).
  ([\#1596](https://github.com/rstudio/gt/issues/1596))

- We now ensure that `id` values are stripped of HTML tags when using
  [`tab_row_group()`](https://gt.rstudio.com/reference/tab_row_group.md).
  Previously this condition would create corrupted row group labels
  ([\#1143](https://github.com/rstudio/gt/issues/1143)).
  ([\#1750](https://github.com/rstudio/gt/issues/1750))

- [`cols_hide()`](https://gt.rstudio.com/reference/cols_hide.md) no
  longer errors if a column wasn’t supplied. Error messages are also
  clearer when supplying a column that doesn’t exist
  ([\#1631](https://github.com/rstudio/gt/issues/1631)).
  ([\#1632](https://github.com/rstudio/gt/issues/1632))

- [`cols_units()`](https://gt.rstudio.com/reference/cols_units.md),
  [`tab_footnote()`](https://gt.rstudio.com/reference/tab_footnote.md)
  and [`tab_style()`](https://gt.rstudio.com/reference/tab_style.md) now
  give better error messages when `locations` is not correctly specified
  ([\#475](https://github.com/rstudio/gt/issues/475)).
  ([@olivroy](https://github.com/olivroy),
  [\#1638](https://github.com/rstudio/gt/issues/1638),
  [\#1640](https://github.com/rstudio/gt/issues/1640),
  [\#1733](https://github.com/rstudio/gt/issues/1733))

- Error messages are now improved for
  [`rm_spanners()`](https://gt.rstudio.com/reference/rm_spanners.md),
  [`rm_footnotes()`](https://gt.rstudio.com/reference/rm_footnotes.md),
  and
  [`rm_source_notes()`](https://gt.rstudio.com/reference/rm_source_notes.md)
  ([\#1638](https://github.com/rstudio/gt/issues/1638)).
  ([\#1661](https://github.com/rstudio/gt/issues/1661))

- Error messages for the `vec_*()` functions are now standardized with
  `check_vector_valid()`.
  ([\#1662](https://github.com/rstudio/gt/issues/1662))

- Running **testthat** tests no longer fails on Windows due to
  [`gtsave()`](https://gt.rstudio.com/reference/gtsave.md) path
  incompatibilities
  ([\#1626](https://github.com/rstudio/gt/issues/1626)).
  ([\#1627](https://github.com/rstudio/gt/issues/1627))

- Tests run on Windows are less noisy now (no more render related
  warnings). ([\#1634](https://github.com/rstudio/gt/issues/1634))

- Much code refactoring, linting, and test improvements were performed
  by [@olivroy](https://github.com/olivroy), resulting in many
  performance gains.
  ([\#1666](https://github.com/rstudio/gt/issues/1666),
  [\#1683](https://github.com/rstudio/gt/issues/1683),
  [\#1694](https://github.com/rstudio/gt/issues/1694),
  [\#1699](https://github.com/rstudio/gt/issues/1699),
  [\#1715](https://github.com/rstudio/gt/issues/1715),
  [\#1718](https://github.com/rstudio/gt/issues/1718),
  [\#1728](https://github.com/rstudio/gt/issues/1728),
  [\#1730](https://github.com/rstudio/gt/issues/1730),
  [\#1731](https://github.com/rstudio/gt/issues/1731),
  [\#1732](https://github.com/rstudio/gt/issues/1732),
  [\#1733](https://github.com/rstudio/gt/issues/1733),
  [\#1753](https://github.com/rstudio/gt/issues/1753))

- **gt** now depends on R 3.6.
  ([\#1599](https://github.com/rstudio/gt/issues/1599),
  [\#1731](https://github.com/rstudio/gt/issues/1731)).

### Documentation enhancements

- Many small documentation fixes were performed.
  ([\#1555](https://github.com/rstudio/gt/issues/1555),
  [\#1598](https://github.com/rstudio/gt/issues/1598),
  [\#1633](https://github.com/rstudio/gt/issues/1633),
  [\#1658](https://github.com/rstudio/gt/issues/1658),
  [\#1663](https://github.com/rstudio/gt/issues/1663),
  [\#1676](https://github.com/rstudio/gt/issues/1676),
  [\#1685](https://github.com/rstudio/gt/issues/1685),
  [\#1700](https://github.com/rstudio/gt/issues/1700),
  [\#1703](https://github.com/rstudio/gt/issues/1703),
  [\#1717](https://github.com/rstudio/gt/issues/1717),
  [\#1719](https://github.com/rstudio/gt/issues/1719),
  [\#1721](https://github.com/rstudio/gt/issues/1721))

- More examples were added to further demonstrate how various functions
  can be used. ([\#1646](https://github.com/rstudio/gt/issues/1646),
  [\#1667](https://github.com/rstudio/gt/issues/1667),
  [\#1677](https://github.com/rstudio/gt/issues/1677),
  [\#1698](https://github.com/rstudio/gt/issues/1698),
  [\#1724](https://github.com/rstudio/gt/issues/1724),
  [\#1737](https://github.com/rstudio/gt/issues/1737))

## gt 0.10.1

CRAN release: 2024-01-17

### Improvements to nanoplots

- Box plots can now be generated via
  [`cols_nanoplot()`](https://gt.rstudio.com/reference/cols_nanoplot.md)
  by using `plot_type = "boxplot"`. These plots are laid out
  horizontally and will, by default, share the same plot axis across
  rows. ([\#1527](https://github.com/rstudio/gt/issues/1527))

- We can now have single line bar plots generated through
  [`cols_nanoplot()`](https://gt.rstudio.com/reference/cols_nanoplot.md).
  If the plot_type is set to `"bar"` and single values are found, then
  horizontal bars will be generated and will be comparable across rows.
  ([\#1514](https://github.com/rstudio/gt/issues/1514),
  [\#1515](https://github.com/rstudio/gt/issues/1515),
  [\#1519](https://github.com/rstudio/gt/issues/1519))

- The `autohide` argument was added to the
  [`cols_nanoplot()`](https://gt.rstudio.com/reference/cols_nanoplot.md)
  function so that columns containing input data for nanoplots could be
  conveniently hidden from final presentation.
  ([\#1533](https://github.com/rstudio/gt/issues/1533))

- Added option (the `data_area_fill_color` arg in
  [`nanoplot_options()`](https://gt.rstudio.com/reference/nanoplot_options.md))
  to change fill color of nanoplot data area for line-type plots
  ([\#1521](https://github.com/rstudio/gt/issues/1521)).
  ([\#1534](https://github.com/rstudio/gt/issues/1534))

### Minor improvements and bug fixes

- The performance of rendering bigger tables as HTML has been improved
  and is now up to three times faster than before.
  ([\#1470](https://github.com/rstudio/gt/issues/1470), thanks
  [@mgirlich](https://github.com/mgirlich))

- Introduced a small performance improvement by no longer calling
  [`utils::packageVersion()`](https://rdrr.io/r/utils/packageDescription.html)
  internally ([\#1524](https://github.com/rstudio/gt/issues/1524)).
  ([\#1525](https://github.com/rstudio/gt/issues/1525), thank you
  [@slodge](https://github.com/slodge))

- Code and test refactoring was performed to generally improve
  performance and code readability.
  ([\#1480](https://github.com/rstudio/gt/issues/1480))

- The [`gtsave()`](https://gt.rstudio.com/reference/gtsave.md) function
  now returns the file path invisibly instead of `TRUE`.
  ([\#1478](https://github.com/rstudio/gt/issues/1478))

- Most functions now produce better error messages if not provided with
  a `gt_tbl` object.
  ([\#1504](https://github.com/rstudio/gt/issues/1504),
  [\#1624](https://github.com/rstudio/gt/issues/1624))

- The URL formatting through
  [`fmt_url()`](https://gt.rstudio.com/reference/fmt_url.md) has been
  improved by preventing link text breaking across lines
  ([\#1509](https://github.com/rstudio/gt/issues/1509)).
  ([\#1537](https://github.com/rstudio/gt/issues/1537))

- We now remove some unnecessary newlines in the HTML text produced by
  [`as_raw_html()`](https://gt.rstudio.com/reference/as_raw_html.md),
  which caused an issue when integrating **gt** tables into **blastula**
  email messages ([\#1506](https://github.com/rstudio/gt/issues/1506)).
  ([\#1520](https://github.com/rstudio/gt/issues/1520))

- The
  [`tab_spanner_delim()`](https://gt.rstudio.com/reference/tab_spanner_delim.md)
  now lets you use `delim` strings longer than a single character
  ([\#1469](https://github.com/rstudio/gt/issues/1469)).
  ([\#1513](https://github.com/rstudio/gt/issues/1513))

- Fix for footnotes in LaTeX tables where no footnote marks are to be
  added; this previously showed `"NA"` as the mark in the footer area
  but this is no longer displayed
  ([\#1416](https://github.com/rstudio/gt/issues/1416)).
  ([\#1512](https://github.com/rstudio/gt/issues/1512), thanks
  [@kbrevoort](https://github.com/kbrevoort))

- LaTeX tables can now have their overall width specified
  ([\#119](https://github.com/rstudio/gt/issues/119),
  [\#329](https://github.com/rstudio/gt/issues/329)).
  ([\#1495](https://github.com/rstudio/gt/issues/1495), thank you
  [@kbrevoort](https://github.com/kbrevoort))

- Fix issue where a
  [`cols_width()`](https://gt.rstudio.com/reference/cols_width.md)
  specification involving percentage values fails for LaTeX tables
  ([\#1465](https://github.com/rstudio/gt/issues/1465)).
  ([\#1495](https://github.com/rstudio/gt/issues/1495), thanks again
  [@kbrevoort](https://github.com/kbrevoort)!)

- Several documentation fixes were made to address inconsistencies and
  improve clarity. ([\#1491](https://github.com/rstudio/gt/issues/1491))

## gt 0.10.0

CRAN release: 2023-10-07

### Nanoplots

- We can now add in little plots called *nanoplots* to a **gt** table
  ([\#299](https://github.com/rstudio/gt/issues/299),
  [\#515](https://github.com/rstudio/gt/issues/515)).
  ([\#1431](https://github.com/rstudio/gt/issues/1431),
  [\#1439](https://github.com/rstudio/gt/issues/1439),
  [\#1445](https://github.com/rstudio/gt/issues/1445),
  [\#1453](https://github.com/rstudio/gt/issues/1453),
  [\#1458](https://github.com/rstudio/gt/issues/1458),
  [\#1459](https://github.com/rstudio/gt/issues/1459),
  [\#1461](https://github.com/rstudio/gt/issues/1461),
  [\#1462](https://github.com/rstudio/gt/issues/1462))

- The function
  [`cols_nanoplot()`](https://gt.rstudio.com/reference/cols_nanoplot.md)
  adds a new column that contains the plots. The data can be obtained
  from one or more columns in the table. A helper function called
  [`nanoplot_options()`](https://gt.rstudio.com/reference/nanoplot_options.md)
  allows for altering the composition and styling of the nanoplots in
  the new column.

- There are two basic types of nanoplots available: `"line"` and
  `"bar"`. A line plot shows individual data points and has smooth
  connecting lines between them to allow for easier scanning of values.
  You can opt for straight-line connections between data points, or, no
  connections at all (it’s up to you). The data you feed into a line
  plot can consist of a single vector of values (resulting in
  equally-spaced *y* values), or, you can supply two vectors
  representative of *x* and *y*.

- A bar plot is built a little bit differently. The focus is on
  evenly-spaced bars (requiring a single vector of values) that project
  from a zero line, clearly showing the difference between positive and
  negative values.

- By default, any type of nanoplot will have basic interactivity. One
  can hover over the data points and vertical guides will display values
  ascribed to each. A guide on the left-hand side of the plot area will
  display the minimal and maximal *y* values on hover.

### Other great new features

- Brand new rows can be added to a **gt** table with the new
  [`rows_add()`](https://gt.rstudio.com/reference/rows_add.md) function.
  The user can supply the new row data through name value pairs. You
  have control over where they are placed by way of the `.before` and
  `.after` arguments (new rows are added to the bottom of the table by
  default). You can also add empty (i.e., all `NA`) rows with the
  `.n_empty` option ([\#698](https://github.com/rstudio/gt/issues/698)).
  ([\#1323](https://github.com/rstudio/gt/issues/1323))

- To complement
  [`rows_add()`](https://gt.rstudio.com/reference/rows_add.md), the
  [`cols_add()`](https://gt.rstudio.com/reference/cols_add.md) function
  was added. New columns can indeed be added to a **gt** table with this
  function, which has an interface close to that of
  [`dplyr::mutate()`](https://dplyr.tidyverse.org/reference/mutate.html).
  ([\#1367](https://github.com/rstudio/gt/issues/1367))

- You can now use an empty table as the starting point for a **gt**
  table. This can be used in conjunction with
  [`cols_add()`](https://gt.rstudio.com/reference/cols_add.md) and
  [`rows_add()`](https://gt.rstudio.com/reference/rows_add.md) to build
  a table piece-by-piece in specific workflows/settings. What
  constitutes empty tables can be any of: `0 x 0` tables, `0 x n` tables
  (no rows, some columns), or `n x 0` tables (some rows, no columns;
  treated the same as `0 x 0` tables).
  ([\#1376](https://github.com/rstudio/gt/issues/1376))

- There is now a way to better express measurement units and we do this
  in **gt** with something called units notation. With an intuitive and
  easy-to-learn syntax, **gt** will ensure that any measurement units
  are formatted correctly no matter what the output type is. We can
  format units in the table body with
  [`fmt_units()`](https://gt.rstudio.com/reference/fmt_units.md), we can
  attach units to column labels with
  [`cols_units()`](https://gt.rstudio.com/reference/cols_units.md), and
  we can integrate units notation in the already-available
  [`cols_label()`](https://gt.rstudio.com/reference/cols_label.md) and
  [`tab_spanner()`](https://gt.rstudio.com/reference/tab_spanner.md)
  functions ([\#417](https://github.com/rstudio/gt/issues/417),
  [\#533](https://github.com/rstudio/gt/issues/533)).
  ([\#1357](https://github.com/rstudio/gt/issues/1357),
  [\#1426](https://github.com/rstudio/gt/issues/1426),
  [\#1446](https://github.com/rstudio/gt/issues/1446))

- A very useful new helper function,
  [`from_column()`](https://gt.rstudio.com/reference/from_column.md),
  has been added so you can fetch values (for compatible arguments) from
  a column in the input table. For example, if you are using
  [`fmt_scientific()`](https://gt.rstudio.com/reference/fmt_scientific.md)
  and the number of significant figures should vary across the values to
  be formatted, a column containing those values for the `n_sigfig`
  argument can be referenced by
  [`from_column()`](https://gt.rstudio.com/reference/from_column.md).
  ([\#1392](https://github.com/rstudio/gt/issues/1392),
  [\#1393](https://github.com/rstudio/gt/issues/1393),
  [\#1395](https://github.com/rstudio/gt/issues/1395),
  [\#1396](https://github.com/rstudio/gt/issues/1396),
  [\#1399](https://github.com/rstudio/gt/issues/1399),
  [\#1403](https://github.com/rstudio/gt/issues/1403))

- With the new
  [`fmt_icon()`](https://gt.rstudio.com/reference/fmt_icon.md) function
  we are able to add icons from the Font Awesome icon library. It works
  in a way that’s similar to
  [`fmt_flag()`](https://gt.rstudio.com/reference/fmt_flag.md), in that
  identifiers in the formatted cells are transformed in-place to
  SVG-based icons. ([\#1413](https://github.com/rstudio/gt/issues/1413))

- The [`info_icons()`](https://gt.rstudio.com/reference/info_icons.md)
  and [`info_flags()`](https://gt.rstudio.com/reference/info_flags.md)
  functions have been added to help people know about the valid codes
  for flags and for icons (when using
  [`fmt_icon()`](https://gt.rstudio.com/reference/fmt_icon.md) and
  [`fmt_flag()`](https://gt.rstudio.com/reference/fmt_flag.md)).
  ([\#1421](https://github.com/rstudio/gt/issues/1421))

- We added the
  [`extract_body()`](https://gt.rstudio.com/reference/extract_body.md)
  function, which lets you pull out a data frame associated with the
  body cells. Importantly, this extraction can happen at different
  stages of the table build (e.g., `"init"`, `"text_transformed"`,
  etc.), allowing a user to have access to a table of formatted body
  cells for different applications (such as verification of formatting,
  debugging new formatting functions, etc.)
  ([\#1441](https://github.com/rstudio/gt/issues/1441)).
  ([\#1449](https://github.com/rstudio/gt/issues/1449))

- Interactive HTML tables (usually generated through use of
  [`opt_interactive()`](https://gt.rstudio.com/reference/opt_interactive.md))
  can now use localized labels/controls. So when using any of the 574
  supported locales in **gt**, an interactive table will be fully
  translated to the language of the locale
  ([\#1308](https://github.com/rstudio/gt/issues/1308)).
  ([\#1389](https://github.com/rstudio/gt/issues/1389))

- The `illness` and `constants` datasets were added. Both datasets have
  a `units` column and this is useful for making examples with the
  [`fmt_units()`](https://gt.rstudio.com/reference/fmt_units.md)
  function. ([\#1357](https://github.com/rstudio/gt/issues/1357))

### Improvements to the Word output format

- Processing to Word output now escapes HTML in more places
  ([\#1378](https://github.com/rstudio/gt/issues/1378)).
  ([\#1303](https://github.com/rstudio/gt/issues/1303))

- The Word output format now uses the `side` argument present in
  [`summary_rows()`](https://gt.rstudio.com/reference/summary_rows.md)
  and
  [`grand_summary_rows()`](https://gt.rstudio.com/reference/grand_summary_rows.md)
  to place the new summary rows either the top or bottom of the row
  group (with
  [`summary_rows()`](https://gt.rstudio.com/reference/summary_rows.md))
  or table as a whole (with
  [`grand_summary_rows()`](https://gt.rstudio.com/reference/grand_summary_rows.md)).
  ([\#1325](https://github.com/rstudio/gt/issues/1325))

- Tables rendered as Word output can now handle the specific case where
  a table with summary rows doesn’t have row names.
  ([\#1325](https://github.com/rstudio/gt/issues/1325))

- Summary rows in Word output tables can now be placed at the top or
  bottom of a group (or at the top or bottom of the table).
  ([\#1402](https://github.com/rstudio/gt/issues/1402))

- Word output tables can now contain images. This entails compatibility
  with the
  [`fmt_image()`](https://gt.rstudio.com/reference/fmt_image.md)
  function, and, images (local and remote) can be inserted through
  Markdown ([\#1272](https://github.com/rstudio/gt/issues/1272)).
  ([\#1273](https://github.com/rstudio/gt/issues/1273))

### Documentation enhancements

- The **gt** website has been updated with a slightly different look;
  section names have been updated for consistency
  ([\#1419](https://github.com/rstudio/gt/issues/1419)).
  ([\#1287](https://github.com/rstudio/gt/issues/1287),
  [\#1340](https://github.com/rstudio/gt/issues/1340),
  [\#1341](https://github.com/rstudio/gt/issues/1341),
  [\#1444](https://github.com/rstudio/gt/issues/1444))

- We’ve improved the formatting of arguments in the documentation so
  that they all have short titles and descriptions regarding expected
  inputs and default values. This looks great both in the internal R
  help pages and in the **pkgdown**-generated website
  ([\#1290](https://github.com/rstudio/gt/issues/1290)).
  ([\#1338](https://github.com/rstudio/gt/issues/1338))

- Several small documentation updates were made, with an emphasis on
  improving examples
  ([\#1304](https://github.com/rstudio/gt/issues/1304),
  [\#1349](https://github.com/rstudio/gt/issues/1349),
  [\#1369](https://github.com/rstudio/gt/issues/1369)).
  ([\#1293](https://github.com/rstudio/gt/issues/1293),
  [\#1316](https://github.com/rstudio/gt/issues/1316),
  [\#1324](https://github.com/rstudio/gt/issues/1324),
  [\#1329](https://github.com/rstudio/gt/issues/1329),
  [\#1330](https://github.com/rstudio/gt/issues/1330),
  [\#1331](https://github.com/rstudio/gt/issues/1331),
  [\#1334](https://github.com/rstudio/gt/issues/1334),
  [\#1381](https://github.com/rstudio/gt/issues/1381),
  [\#1383](https://github.com/rstudio/gt/issues/1383),
  [\#1395](https://github.com/rstudio/gt/issues/1395),
  [\#1404](https://github.com/rstudio/gt/issues/1404),
  [\#1442](https://github.com/rstudio/gt/issues/1442),
  [\#1454](https://github.com/rstudio/gt/issues/1454))

### Minor improvements and bug fixes

- The
  [`tab_spanner_delim()`](https://gt.rstudio.com/reference/tab_spanner_delim.md)
  function was given a `limit` argument so that splitting from a
  particular side can stop early and precisely.
  ([\#1328](https://github.com/rstudio/gt/issues/1328))

- The `width` argument was added to
  [`fmt_image()`](https://gt.rstudio.com/reference/fmt_image.md). With
  this change you can variously set the width, the height, or both.

- Significant figures support has been added to the
  [`fmt_scientific()`](https://gt.rstudio.com/reference/fmt_scientific.md)
  and
  [`vec_fmt_scientific()`](https://gt.rstudio.com/reference/vec_fmt_scientific.md)
  functions; there is a new `n_sigfig` argument in both.
  ([\#1411](https://github.com/rstudio/gt/issues/1411))

- The
  [`cols_merge_range()`](https://gt.rstudio.com/reference/cols_merge_range.md)
  function now has a `locale` argument. Range patterns across locales
  are different (can involve the use of a single hyphen, en dash, em
  dash, tilde, etc.) and so it does make sense to follow the convention
  of a locale if provided
  ([\#158](https://github.com/rstudio/gt/issues/158)).
  ([\#1423](https://github.com/rstudio/gt/issues/1423))

- The [`fmt_url()`](https://gt.rstudio.com/reference/fmt_url.md)
  function now has a few more options for adding anchor tag attributes
  (`"target"`, `"rel"`, `"referrerpolicy"`, and `"hreflang"`). Thanks
  [@elipousson](https://github.com/elipousson) for the work on this!
  ([\#1428](https://github.com/rstudio/gt/issues/1428)).
  ([\#1452](https://github.com/rstudio/gt/issues/1452))

- We now have rudimentary support for defining column widths for LaTeX
  output tables (with
  [`cols_width()`](https://gt.rstudio.com/reference/cols_width.md)).
  This accepts length values in ‘px’ which and automatic conversion to
  ‘pt’ values is performed to maximize compatibility with different
  LaTeX flavors ([\#634](https://github.com/rstudio/gt/issues/634),
  [\#851](https://github.com/rstudio/gt/issues/851),
  [\#1417](https://github.com/rstudio/gt/issues/1417)).
  ([\#1371](https://github.com/rstudio/gt/issues/1371),
  [\#1450](https://github.com/rstudio/gt/issues/1450))

- It’s now possible to use background fill colors and perform text
  coloring and emboldened/italicized text within the body cells of LaTeX
  tables. This is commonly performed through the use of
  [`tab_style()`](https://gt.rstudio.com/reference/tab_style.md) and
  [`data_color()`](https://gt.rstudio.com/reference/data_color.md)
  ([\#84](https://github.com/rstudio/gt/issues/84),
  [\#869](https://github.com/rstudio/gt/issues/869)).
  ([\#1352](https://github.com/rstudio/gt/issues/1352))

- The [`gtsave()`](https://gt.rstudio.com/reference/gtsave.md) function
  now works with `gt_group` objects (usually generated through
  [`gt_split()`](https://gt.rstudio.com/reference/gt_split.md) or
  [`gt_group()`](https://gt.rstudio.com/reference/gt_group.md))
  ([\#1354](https://github.com/rstudio/gt/issues/1354)).
  ([\#1365](https://github.com/rstudio/gt/issues/1365))

- All `gt_group` objects can now be printed using R Markdown or Quarto
  ([\#1286](https://github.com/rstudio/gt/issues/1286)).
  ([\#1332](https://github.com/rstudio/gt/issues/1332))

- When using
  [`fmt_currency()`](https://gt.rstudio.com/reference/fmt_currency.md)
  with a locale value set, **gt** will now use that to automatically
  select the locale’s default currency. While some countries can have
  multiple currencies, we opt for the most-widely used currency (users
  could alternatively specify the currency code and
  [`info_currencies()`](https://gt.rstudio.com/reference/info_currencies.md)
  contains all supported currencies used in the package)
  ([\#1346](https://github.com/rstudio/gt/issues/1346)).
  ([\#1347](https://github.com/rstudio/gt/issues/1347))

- The `columns` argument in
  [`cols_hide()`](https://gt.rstudio.com/reference/cols_hide.md) and
  [`cols_unhide()`](https://gt.rstudio.com/reference/cols_unhide.md) can
  now accept `NULL` (i.e., no columns resolved). These functions will no
  longer error in such a case
  ([\#1342](https://github.com/rstudio/gt/issues/1342)).
  ([\#1343](https://github.com/rstudio/gt/issues/1343))

- The `countrypops` dataset was updated with recent (as of August 2023)
  World Bank data that revises population estimates and brings the final
  year up to 2022. All examples, tests, and articles using the dataset
  were also updated.
  ([\#1410](https://github.com/rstudio/gt/issues/1410))

- A few refinements were made to some of the system font stacks defined
  in
  [`system_fonts()`](https://gt.rstudio.com/reference/system_fonts.md).
  ([\#1447](https://github.com/rstudio/gt/issues/1447))

- The Databricks notebook environment is now detected by **gt**, so
  tables will now be automatically displayed without having to call
  extra printing functions.
  ([\#1427](https://github.com/rstudio/gt/issues/1427))

- Display issues with scientific and engineering notation formatting
  (lack of dropping trailing zeros, as promised with the
  `drop_trailing_zeros` argument) were fixed. Part of the fix involves
  adding the `drop_trailing_dec_mark` argument to the four functions
  [`fmt_scientific()`](https://gt.rstudio.com/reference/fmt_scientific.md),
  [`fmt_engineering()`](https://gt.rstudio.com/reference/fmt_engineering.md),
  [`vec_fmt_scientific()`](https://gt.rstudio.com/reference/vec_fmt_scientific.md)
  and
  [`vec_fmt_engineering()`](https://gt.rstudio.com/reference/vec_fmt_engineering.md).
  ([\#1380](https://github.com/rstudio/gt/issues/1380))

- Fixed an incorrect country code reference for the Netherlands that
  would cause an incorrect flag to appear when using
  [`fmt_flag()`](https://gt.rstudio.com/reference/fmt_flag.md).
  ([\#1319](https://github.com/rstudio/gt/issues/1319))

- Many new flags were added to
  [`fmt_flag()`](https://gt.rstudio.com/reference/fmt_flag.md)
  ([\#1333](https://github.com/rstudio/gt/issues/1333),
  [\#1335](https://github.com/rstudio/gt/issues/1335)).
  ([\#1336](https://github.com/rstudio/gt/issues/1336))

- In some cases, there was incorrect rounding of duration values when
  using
  [`fmt_duration()`](https://gt.rstudio.com/reference/fmt_duration.md).
  This is now fixed, thanks to [@rcannood](https://github.com/rcannood)
  ([\#1374](https://github.com/rstudio/gt/issues/1374)).
  ([\#1375](https://github.com/rstudio/gt/issues/1375))

- Fixed an issue with
  [`cols_label_with()`](https://gt.rstudio.com/reference/cols_label_with.md)
  where column names wouldn’t be relabeled if the resolved columns were
  only a subset of the total columns available.
  ([\#1326](https://github.com/rstudio/gt/issues/1326))

- Fixed a LaTeX bug where some characters following a `\midrule` would
  corrupt the table ([\#145](https://github.com/rstudio/gt/issues/145),
  [\#391](https://github.com/rstudio/gt/issues/391),
  [\#1107](https://github.com/rstudio/gt/issues/1107),
  [\#1182](https://github.com/rstudio/gt/issues/1182)).
  ([\#1390](https://github.com/rstudio/gt/issues/1390))

- Provided a rendering fallback for HTML tables rendered in Quarto where
  the combination of
  [`fmt_markdown()`](https://gt.rstudio.com/reference/fmt_markdown.md)
  and `tab_options(quarto.disable_processing = TRUE)` would incorrectly
  result in empty cells.
  ([\#1455](https://github.com/rstudio/gt/issues/1455))

- A issue associated with a lack of HTML formatting within interactive
  tables has been fixed
  ([\#1299](https://github.com/rstudio/gt/issues/1299),
  [\#1370](https://github.com/rstudio/gt/issues/1370),
  [\#1384](https://github.com/rstudio/gt/issues/1384),
  [\#1443](https://github.com/rstudio/gt/issues/1443)).
  ([\#1388](https://github.com/rstudio/gt/issues/1388))

- Many user-facing error messages have been enhanced using the latest
  features from the **cli** package.
  ([\#1337](https://github.com/rstudio/gt/issues/1337), thanks
  [@olivroy](https://github.com/olivroy)!)

- Unit tests can now be successfully run on Linux flavors that don’t
  have the `locale` utility
  ([\#1214](https://github.com/rstudio/gt/issues/1214)).
  ([\#1350](https://github.com/rstudio/gt/issues/1350), thanks
  [@bastistician](https://github.com/bastistician)!)

- If ever the ‘undetermined’ (`"und"`) locale is used, it is
  automatically mapped to the `"en"` locale.
  ([\#1394](https://github.com/rstudio/gt/issues/1394))

- Many unit tests were added for much increased test coverage and many
  more were modified to increase the speed of running the test suite.
  ([\#1291](https://github.com/rstudio/gt/issues/1291),
  [\#1294](https://github.com/rstudio/gt/issues/1294),
  [\#1298](https://github.com/rstudio/gt/issues/1298),
  [\#1350](https://github.com/rstudio/gt/issues/1350),
  [\#1412](https://github.com/rstudio/gt/issues/1412))

- Added utility functions to extract all examples for regularly building
  a Quarto website (to do integration testing).
  ([\#1344](https://github.com/rstudio/gt/issues/1344))

## gt 0.9.0

CRAN release: 2023-03-31

### New features

- The
  [`summary_rows()`](https://gt.rstudio.com/reference/summary_rows.md)
  and
  [`grand_summary_rows()`](https://gt.rstudio.com/reference/grand_summary_rows.md)
  functions have been rewritten extensively to allow more flexibility in
  providing aggregation information to `fns`. The documentation for both
  functions will walk you through all the new ways you can express your
  aggregations. The formatting of cells in new summary rows is now
  easier thanks to the new `fmt` argument. We can provide a single
  formatting expression or a number of them in a list. The dedicated
  documentation section for formatting can walk you through all of this.
  Furthermore, we now have the option to place summary rows at top or
  bottom of a group (in
  [`summary_rows()`](https://gt.rstudio.com/reference/summary_rows.md))
  or table (in
  [`grand_summary_rows()`](https://gt.rstudio.com/reference/grand_summary_rows.md))
  with the new `side` argument
  ([\#177](https://github.com/rstudio/gt/issues/177),
  [\#270](https://github.com/rstudio/gt/issues/270),
  [\#292](https://github.com/rstudio/gt/issues/292),
  [\#545](https://github.com/rstudio/gt/issues/545),
  [\#581](https://github.com/rstudio/gt/issues/581),
  [\#784](https://github.com/rstudio/gt/issues/784),
  [\#785](https://github.com/rstudio/gt/issues/785),
  [\#840](https://github.com/rstudio/gt/issues/840)).
  ([\#1159](https://github.com/rstudio/gt/issues/1159),
  [\#1171](https://github.com/rstudio/gt/issues/1171))

- The [`data_color()`](https://gt.rstudio.com/reference/data_color.md)
  function has been completely overhauled to make it easier to use and
  also more powerful. It gains a `rows` argument to better constrain
  where the colorization should take place. Instead of having to use
  functions from **scales** to define the coloring scheme, you can now
  use the `method` argument to handle most cases (otherwise, the new
  `fn` argument allows for a color-mapping function to be used). The new
  `palette` argument allows for flexible input of color palettes. One or
  more adjacent columns can receive the coloring treatment by way of the
  new `target_columns` argument. Coloring can now also be applied in a
  row-wise fashion by using `direction = "row"`. Despite all of these
  changes, older code should still work with the revamped function
  ([\#116](https://github.com/rstudio/gt/issues/116),
  [\#633](https://github.com/rstudio/gt/issues/633),
  [\#637](https://github.com/rstudio/gt/issues/637),
  [\#1103](https://github.com/rstudio/gt/issues/1103),
  [\#1119](https://github.com/rstudio/gt/issues/1119)).
  ([\#1147](https://github.com/rstudio/gt/issues/1147))

- We now have a much improved
  [`cols_merge()`](https://gt.rstudio.com/reference/cols_merge.md)
  function! It has gained a `rows` argument for limiting which body
  cells get merged together. The `pattern` argument now has a more
  advanced syntax. It now has the following delimiters and rules: (1)
  [`{ }`](https://rdrr.io/r/base/Paren.html) for arranging single column
  values in a row-wise fashion, and (2) the `<< >>` to surround spans of
  text that will be removed if any of the contained
  [`{ }`](https://rdrr.io/r/base/Paren.html) yields a missing value. The
  new `<< >>` delimiters will help in cases where `NA` values are
  present and should be omitted during the merging process
  ([\#1167](https://github.com/rstudio/gt/issues/1167)).
  ([\#1144](https://github.com/rstudio/gt/issues/1144),
  [\#1168](https://github.com/rstudio/gt/issues/1168))

- The [`cols_label()`](https://gt.rstudio.com/reference/cols_label.md)
  function has been improved by allowing formula expressions to be given
  to `...`. With two-sided formulas (e.g., `<LHS> ~ <RHS>`), the
  left-hand side corresponds to selections of columns and the right-hand
  side evaluates to single-length values for the label to apply. Named
  arguments in the format of `<column name> = <label>` are still also
  valid as input for simple mappings of column name to label text. Also,
  there’s a `.fn` argument, which takes a function to be applied to all
  provided label values
  ([\#1146](https://github.com/rstudio/gt/issues/1146)).
  ([\#1255](https://github.com/rstudio/gt/issues/1255),
  [\#1256](https://github.com/rstudio/gt/issues/1256),
  [\#1265](https://github.com/rstudio/gt/issues/1265))

- Interactive HTML tables can now be generated in **gt**. Options for
  enabling interactive table rendering are available in
  [`tab_options()`](https://gt.rstudio.com/reference/tab_options.md) and
  also in
  [`opt_interactive()`](https://gt.rstudio.com/reference/opt_interactive.md).
  The collection of `use_*` arguments in
  [`opt_interactive()`](https://gt.rstudio.com/reference/opt_interactive.md)
  allow for control of pagination, global search, filtering, sorting,
  and more. The documentation within
  [`opt_interactive()`](https://gt.rstudio.com/reference/opt_interactive.md)
  demonstrates how to generate HTML tables with interactive elements
  ([\#207](https://github.com/rstudio/gt/issues/207)).
  ([\#902](https://github.com/rstudio/gt/issues/902),
  [\#1252](https://github.com/rstudio/gt/issues/1252),
  [\#1261](https://github.com/rstudio/gt/issues/1261),
  [\#1278](https://github.com/rstudio/gt/issues/1278),
  [\#1280](https://github.com/rstudio/gt/issues/1280))

- A new function,
  [`cols_label_with()`](https://gt.rstudio.com/reference/cols_label_with.md),
  has been added for relabeling columns via functions. It allows for
  such functions to be applied to arbitrary sets of columns, taking
  advantage of **tidyselect**. It’s like
  [`dplyr::rename_with()`](https://dplyr.tidyverse.org/reference/rename.html)
  for your **gt** table, but it doesn’t need unique names for labeling
  ([\#701](https://github.com/rstudio/gt/issues/701)).
  ([\#1158](https://github.com/rstudio/gt/issues/1158), thank you
  [@christopherkenny](https://github.com/christopherkenny)!)

- We added
  [`fmt_spelled_num()`](https://gt.rstudio.com/reference/fmt_spelled_num.md)
  and
  [`vec_fmt_spelled_num()`](https://gt.rstudio.com/reference/vec_fmt_spelled_num.md)
  so that numeric values could be transformed to spelled out numbers.
  Any values from `0` to `100` can be spelled out according to a given
  `locale` value. For example, the value `23` will be rendered as
  `"twenty-three"` if the locale is an English-language one (or, not
  provided at all); should a Swedish locale be provided (e.g., `"sv"`),
  the output will instead be `"tjugotre"`.
  ([\#1198](https://github.com/rstudio/gt/issues/1198))

- The [`fmt_index()`](https://gt.rstudio.com/reference/fmt_index.md) and
  [`vec_fmt_index()`](https://gt.rstudio.com/reference/vec_fmt_index.md)
  functions were added in so that numeric values could undergo
  transformation to index values, which are usually based on letters
  (depending on the `locale` chosen). For example, the value `5` will be
  rendered as `"E"` if the locale is an English-language one. The
  characters chosen for indexing here are based on character sets
  intended for ordering (often leaving out characters with diacritical
  marks). ([\#1189](https://github.com/rstudio/gt/issues/1189))

- Should body cells contain URLs, the new
  [`fmt_url()`](https://gt.rstudio.com/reference/fmt_url.md) function
  can be used to make them navigable links. There are several options
  provided that control how the links should be styled (conventional
  underline style or button-like text)
  ([\#609](https://github.com/rstudio/gt/issues/609)).
  ([\#1205](https://github.com/rstudio/gt/issues/1205),
  [\#1220](https://github.com/rstudio/gt/issues/1220),
  [\#1221](https://github.com/rstudio/gt/issues/1221))

- To more easily insert graphics into body cells, we have added the
  [`fmt_image()`](https://gt.rstudio.com/reference/fmt_image.md)
  function. This allows for one or more images to be placed in the
  targeted cells. The cells need to contain some reference to an image
  file, either: (1) complete http/https or local paths to the files; (2)
  the file names, where a common path can be provided via `path`; or (3)
  a fragment of the file name, where the `file_pattern` argument helps
  to compose the entire file name and the `path` argument provides the
  path information.
  ([\#1240](https://github.com/rstudio/gt/issues/1240))

- The new [`fmt_flag()`](https://gt.rstudio.com/reference/fmt_flag.md)
  function helps with inserting a flag icon (or multiple) in body cells.
  The input cells need to contain 2-letter ISO 3166-1 country codes
  (e.g., Mauritius with the `"MU"` country code). This function will
  parse the targeted body cells insert the appropriate flag icon.
  Multiple flags can be included per body cell by separating country
  codes with commas.
  ([\#1241](https://github.com/rstudio/gt/issues/1241),
  [\#1244](https://github.com/rstudio/gt/issues/1244),
  [\#1251](https://github.com/rstudio/gt/issues/1251))

- With [`fmt_bins()`](https://gt.rstudio.com/reference/fmt_bins.md), you
  can format bin or interval syntax (returned from
  [`cut()`](https://rdrr.io/r/base/cut.html)) to a form that presents
  better in a display table. It’s possible to format the values of the
  intervals with the `fmt` argument, and, the separator can be modified
  with the `sep` argument.
  ([\#1250](https://github.com/rstudio/gt/issues/1250))

- The new [`fmt_auto()`](https://gt.rstudio.com/reference/fmt_auto.md)
  function has been added to automatically apply formatting of various
  types in a way that best suits the data table provided. For example,
  the function will attempt to format numbers such that they are
  condensed to an optimal width, and, currency values can be detected
  (by currency codes embedded in the column name) and formatted in the
  correct way ([\#248](https://github.com/rstudio/gt/issues/248)).
  ([\#1176](https://github.com/rstudio/gt/issues/1176))

- Three `text_*()` functions were added to better enable transformations
  of formatted text in various table locations:
  [`text_replace()`](https://gt.rstudio.com/reference/text_replace.md),
  [`text_case_when()`](https://gt.rstudio.com/reference/text_case_when.md),
  and
  [`text_case_match()`](https://gt.rstudio.com/reference/text_case_match.md).
  ([\#1238](https://github.com/rstudio/gt/issues/1238))

- We can use any of 15 system font stacks available in **gt**! These are
  families of themed system fonts that are widely available in different
  computer systems. Examples include ‘System UI’ (the default font
  stack), ‘Humanist’, and ‘Neo-Grotesque’. The new helper function
  [`system_fonts()`](https://gt.rstudio.com/reference/system_fonts.md)
  can be used to access the various font stack and is useful when
  specifying `font` values in the
  [`cell_text()`](https://gt.rstudio.com/reference/cell_text.md)
  function. The
  [`opt_table_font()`](https://gt.rstudio.com/reference/opt_table_font.md)
  function has been upgraded to include a `stack` argument (which
  accepts keywords for the different font stacks).
  ([\#1275](https://github.com/rstudio/gt/issues/1275))

- We now have a new family of functions that let you deal with a
  multitude of **gt** tables, all at once. You can create a `gt_group`
  object with multiple tables via the
  [`gt_group()`](https://gt.rstudio.com/reference/gt_group.md) function,
  or, split a single table into multiple with
  [`gt_split()`](https://gt.rstudio.com/reference/gt_split.md). There
  are some advantages to having a group of tables bundled together like
  this. You could apply options that pertain to all tables yet still
  access the individual tables to give them their own specialized
  modifications. They all print together at once too! For HTML, each
  table will be separated by a line break whereas in paginated formats
  (e.g., RTF, Word, etc.) the tables are separated by page breaks.
  ([\#1216](https://github.com/rstudio/gt/issues/1216),
  [\#1219](https://github.com/rstudio/gt/issues/1219),
  [\#1226](https://github.com/rstudio/gt/issues/1226),
  [\#1248](https://github.com/rstudio/gt/issues/1248),
  [\#1249](https://github.com/rstudio/gt/issues/1249),
  [\#1262](https://github.com/rstudio/gt/issues/1262),
  [\#1264](https://github.com/rstudio/gt/issues/1264))

- There is now a choice of which Markdown engine to use for Markdown
  rendering (in
  [`fmt_markdown()`](https://gt.rstudio.com/reference/fmt_markdown.md)
  and
  [`vec_fmt_markdown()`](https://gt.rstudio.com/reference/vec_fmt_markdown.md))
  and a default default choice. The **markdown** package can be chosen
  instead of **commonmark** to perform conversions of Markdown to HTML
  and LaTeX (and it’s now the default). One of many benefits to this
  change is the parsing of subscripts (using `~x~`) and superscripts
  (using `^x^`) ([\#725](https://github.com/rstudio/gt/issues/725)).
  ([\#1254](https://github.com/rstudio/gt/issues/1254))

- Added the footnote formatting options `footnotes.spec_ref` and
  `footnotes.spec_ftr` in
  [`tab_options()`](https://gt.rstudio.com/reference/tab_options.md) and
  exposed these options further in a new function called
  [`opt_footnote_spec()`](https://gt.rstudio.com/reference/opt_footnote_spec.md).
  Specifications for footnote formatting can be produced for the
  footnote marks that alight to the targeted text within cells from
  various locations in the table, or, for the footnote marks that appear
  in the table footer.
  ([\#1268](https://github.com/rstudio/gt/issues/1268),
  [\#1271](https://github.com/rstudio/gt/issues/1271))

- The `towny` dataset was added. It provides a fun, population-based
  dataset with place names, URLs, coordinate information, and population
  figures with repetition (values for different census years).
  ([\#1184](https://github.com/rstudio/gt/issues/1184),
  [\#1199](https://github.com/rstudio/gt/issues/1199))

- The `metro` dataset is new. It has 308 rows, where each corresponds to
  a different Paris Metro station
  ([\#1231](https://github.com/rstudio/gt/issues/1231)).

- The `rx_adsl` and `rx_addv` datasets have been added. These clinical
  trial toy datasets are both featured in a new vignette that explains
  how **gt** can be used for table generation in the Pharma space
  ([\#1145](https://github.com/rstudio/gt/issues/1145),
  [\#1200](https://github.com/rstudio/gt/issues/1200); thank you
  [@alex-lauer](https://github.com/alex-lauer)!).

### Documentation enhancements

- Addition of a new vignette (*gt Clinical Tables*) that uses the
  `rx_adsl` and `rx_addv` datasets.
  ([\#1145](https://github.com/rstudio/gt/issues/1145),
  [\#1217](https://github.com/rstudio/gt/issues/1217),
  [\#1224](https://github.com/rstudio/gt/issues/1224); all contributed
  by [@alex-lauer](https://github.com/alex-lauer))

- All examples in the documentation were modernized by using the `|>`
  instead of the `%>%`. A lot of explanatory text was improved through
  rewriting. The ordering of documentation sections was improved. And
  functions that had very little documentation (like
  [`text_transform()`](https://gt.rstudio.com/reference/text_transform.md))
  were greatly improved
  ([\#1087](https://github.com/rstudio/gt/issues/1087)).
  ([\#1166](https://github.com/rstudio/gt/issues/1166),
  [\#1185](https://github.com/rstudio/gt/issues/1185),
  [\#1192](https://github.com/rstudio/gt/issues/1192))

- Several small documentation and housekeeping updates.
  ([\#1133](https://github.com/rstudio/gt/issues/1133),
  [\#1134](https://github.com/rstudio/gt/issues/1134),
  [\#1135](https://github.com/rstudio/gt/issues/1135),
  [\#1136](https://github.com/rstudio/gt/issues/1136),
  [\#1190](https://github.com/rstudio/gt/issues/1190),
  [\#1206](https://github.com/rstudio/gt/issues/1206),
  [\#1218](https://github.com/rstudio/gt/issues/1218),
  [\#1242](https://github.com/rstudio/gt/issues/1242),
  [\#1246](https://github.com/rstudio/gt/issues/1246),
  [\#1258](https://github.com/rstudio/gt/issues/1258),
  [\#1260](https://github.com/rstudio/gt/issues/1260),
  [\#1266](https://github.com/rstudio/gt/issues/1266),
  [\#1270](https://github.com/rstudio/gt/issues/1270),
  [\#1276](https://github.com/rstudio/gt/issues/1276),
  [\#1281](https://github.com/rstudio/gt/issues/1281))

- Added a citation file for the package.
  ([\#1128](https://github.com/rstudio/gt/issues/1128),
  [\#1277](https://github.com/rstudio/gt/issues/1277))

### Minor improvements and bug fixes

- The
  [`fmt_scientific()`](https://gt.rstudio.com/reference/fmt_scientific.md)
  and
  [`fmt_engineering()`](https://gt.rstudio.com/reference/fmt_engineering.md)
  (and their `vec_fmt_*()` analogues) now have a `exp_style` argument
  for defining the exponent notation. By default this is `"x10n"` but
  other options include using a single letter (e.g., “e”, “E”, etc.), a
  letter followed by a “1” to signal a minimum digit width of one, or
  “low-ten” for using a stylized “10” marker. These functions now also
  have the `force_sign_m` and `force_sign_n` arguments for forcing `+`
  signs in the mantissa or the exponent.
  ([\#1178](https://github.com/rstudio/gt/issues/1178))

- We now have right-to-left (RTL) text handling and **gt** will
  automatically set the appropriate alignment for RTL text in HTML
  output. This is done through detection of RTL script characters.
  ([\#697](https://github.com/rstudio/gt/issues/697)).
  ([\#1202](https://github.com/rstudio/gt/issues/1202))

- For any columns that are labeled (i.e., have a `label` attribute),
  **gt** will automatically use those labels as column labels
  ([\#656](https://github.com/rstudio/gt/issues/656)).
  ([\#1230](https://github.com/rstudio/gt/issues/1230))

- Tables in the Word output format now have much better Markdown support
  ([\#1057](https://github.com/rstudio/gt/issues/1057),
  [\#1067](https://github.com/rstudio/gt/issues/1067),
  [\#1204](https://github.com/rstudio/gt/issues/1204)).
  ([\#1142](https://github.com/rstudio/gt/issues/1142),
  [\#1263](https://github.com/rstudio/gt/issues/1263),
  [\#1274](https://github.com/rstudio/gt/issues/1274))

- Added the `"double"` option for a border style in
  [`cell_borders()`](https://gt.rstudio.com/reference/cell_borders.md)
  ([\#1132](https://github.com/rstudio/gt/issues/1132)).
  ([\#1137](https://github.com/rstudio/gt/issues/1137))

- The `countrypops` dataset was updated with recent (as of January 2023)
  World Bank data that revises population estimates and brings the final
  year up to 2021. All examples, tests, and articles using the dataset
  were also updated.
  ([\#1191](https://github.com/rstudio/gt/issues/1191))

- Fixed a conflict between
  [`tab_spanner_delim()`](https://gt.rstudio.com/reference/tab_spanner_delim.md)
  and [`cols_label()`](https://gt.rstudio.com/reference/cols_label.md)
  ([\#1130](https://github.com/rstudio/gt/issues/1130)).
  ([\#1173](https://github.com/rstudio/gt/issues/1173))

- Added a fix for a
  [`summary_rows()`](https://gt.rstudio.com/reference/summary_rows.md)
  problem where summary rows that were generated with only a single
  group would not display the summary rows at all.
  ([\#1188](https://github.com/rstudio/gt/issues/1188))

- HTML output tables no longer have contain two `<thead>` elements they
  display a header and column labels
  ([\#1235](https://github.com/rstudio/gt/issues/1235)).
  ([\#1237](https://github.com/rstudio/gt/issues/1237))

- Incorporated a CSS fix for superscripted footnote marks. Prior to the
  change, footnote marks were never styled within **gt** tables rendered
  in Quarto documents.
  ([\#1210](https://github.com/rstudio/gt/issues/1210))

- We now remove **knitr** flags when saving an RTF file through the
  [`gtsave()`](https://gt.rstudio.com/reference/gtsave.md) function
  ([\#674](https://github.com/rstudio/gt/issues/674)).
  ([\#1153](https://github.com/rstudio/gt/issues/1153))

- Fixed LaTeX rendering of tables using the `xelatex` engine by removing
  the unneeded `"amsmath"` LaTeX package from the default set of LaTeX
  dependencies. This set is now modifiable through the
  `gt.latex_packages` option
  ([\#751](https://github.com/rstudio/gt/issues/751)).
  ([\#1279](https://github.com/rstudio/gt/issues/1279))

- Fixed some border-related issues for **gt** tables published in R
  Markdown and Quarto documents
  ([\#1120](https://github.com/rstudio/gt/issues/1120)).
  ([\#1234](https://github.com/rstudio/gt/issues/1234))

- Added the `quarto.use_bootstrap` and `quarto.disable_processing`
  options in
  [`tab_options()`](https://gt.rstudio.com/reference/tab_options.md) to
  control whether Quarto will add Bootstrap classes to a **gt** table or
  ignore a **gt** table.
  ([\#1222](https://github.com/rstudio/gt/issues/1222),
  [\#1227](https://github.com/rstudio/gt/issues/1227))

- Fixed the unintended appearance of a bottom border in the column
  spanner row for some CSS environments.
  ([\#1209](https://github.com/rstudio/gt/issues/1209))

- Fixed the SCSS class `.gt_footnote_marks` to ensure that the footnote
  mark is at a consistent height from the baseline in different CSS
  environments. ([\#1187](https://github.com/rstudio/gt/issues/1187))

- Fixed an error in the SCSS class `.gt_footnote` where the wrong types
  of padding were specified.
  ([\#1236](https://github.com/rstudio/gt/issues/1236))

- Added frequency levels to `cli_abort()` warnings throughout package
  ([\#1160](https://github.com/rstudio/gt/issues/1160)).
  ([\#1169](https://github.com/rstudio/gt/issues/1169))

## gt 0.8.0

CRAN release: 2022-11-16

### New features

- The new function
  [`sub_values()`](https://gt.rstudio.com/reference/sub_values.md) is
  here for subbing in arbitrary text in body cells, based on value, a
  regex, or a specialized function. It’s like a supercharged
  find-and-replace for your **gt** table
  ([\#703](https://github.com/rstudio/gt/issues/703)).
  ([\#1066](https://github.com/rstudio/gt/issues/1066))

- We want the setting of styles to be as easy as possible so, to that
  end, we’ve added a helpful new function:
  [`tab_style_body()`](https://gt.rstudio.com/reference/tab_style_body.md).
  This function is a bit like
  [`sub_values()`](https://gt.rstudio.com/reference/sub_values.md) and a
  bit like
  [`tab_style()`](https://gt.rstudio.com/reference/tab_style.md). The
  idea is that basic style attributes can be set based on values in the
  table body. We can target body cells though value, regex, and custom
  matching rules, and, apply styles to them and their surrounding
  context (e.g., styling an entire row or column wherein the match is
  found). The help file at
  [`?tab_style_body`](https://gt.rstudio.com/reference/tab_style_body.md)
  provides copious examples w/ eye catching visuals
  ([\#863](https://github.com/rstudio/gt/issues/863)).
  ([\#1108](https://github.com/rstudio/gt/issues/1108))

- The [`fmt_date()`](https://gt.rstudio.com/reference/fmt_date.md),
  [`fmt_time()`](https://gt.rstudio.com/reference/fmt_time.md), and
  [`fmt_datetime()`](https://gt.rstudio.com/reference/fmt_datetime.md)
  functions have been improved so much, I don’t even know where to
  begin. The
  [`fmt_datetime()`](https://gt.rstudio.com/reference/fmt_datetime.md)
  function has an enhanced `format` argument that accepts *CLDR*-style
  formatting patterns (much more powerful and flexible than the
  [`strptime()`](https://rdrr.io/r/base/strptime.html) patterns). The
  [`fmt_datetime()`](https://gt.rstudio.com/reference/fmt_datetime.md)
  function will detect the pattern type given in `format`. The
  `date_style` and `time_style` arguments still exist but have been
  extended to accept more style keywords. There is now the concept of
  flexible date and time formats that are locale-aware (the `locale`
  argument is new to these functions). The
  [`info_date_style()`](https://gt.rstudio.com/reference/info_date_style.md)
  and
  [`info_time_style()`](https://gt.rstudio.com/reference/info_time_style.md)
  functions have been enhanced to give you display tables will all the
  style possibilities. All of this goodness extends to the `vec_fmt_*()`
  variants
  ([`vec_fmt_date()`](https://gt.rstudio.com/reference/vec_fmt_date.md),
  [`vec_fmt_time()`](https://gt.rstudio.com/reference/vec_fmt_time.md),
  and
  [`vec_fmt_datetime()`](https://gt.rstudio.com/reference/vec_fmt_datetime.md)).
  The documentation for all of this has been overhauled and provides
  many explanations and examples for your edification
  ([\#531](https://github.com/rstudio/gt/issues/531),
  [\#1052](https://github.com/rstudio/gt/issues/1052)).
  ([\#1053](https://github.com/rstudio/gt/issues/1053))

- We can now have decimal alignment for numeric values and this made
  possible with the new
  [`cols_align_decimal()`](https://gt.rstudio.com/reference/cols_align_decimal.md)
  function. The function ensures that columns targeted are
  right-aligned, that accounting notation is supported, and that
  footnote marks don’t interfere
  ([\#139](https://github.com/rstudio/gt/issues/139),
  [\#144](https://github.com/rstudio/gt/issues/144),
  [\#560](https://github.com/rstudio/gt/issues/560),
  [\#673](https://github.com/rstudio/gt/issues/673)).
  ([\#1058](https://github.com/rstudio/gt/issues/1058),
  [\#1092](https://github.com/rstudio/gt/issues/1092); assist by the
  inimitable [@steveputman](https://github.com/steveputman)!)

- We can easily add a caption to a **gt** table (or replace an existing
  one) with the new and convenient
  [`tab_caption()`](https://gt.rstudio.com/reference/tab_caption.md)
  function ([\#1048](https://github.com/rstudio/gt/issues/1048)).
  ([\#1051](https://github.com/rstudio/gt/issues/1051), thank you
  [@billdenney](https://github.com/billdenney)!)

- So you’ve got a **gt** table and you want a value or two from that
  table to appear elsewhere in your R Markdown or Quarto document.
  Previously, you had to recreate it in some way but now you can use
  [`extract_cells()`](https://gt.rstudio.com/reference/extract_cells.md)!
  That function will extract a vector of cell data from a `gt_tbl`
  object. The output vector will have the cell data formatted in the
  same way as the table.
  ([\#1045](https://github.com/rstudio/gt/issues/1045),
  [\#1047](https://github.com/rstudio/gt/issues/1047))

- The [`as_raw_html()`](https://gt.rstudio.com/reference/as_raw_html.md)
  function is useful for generating an HTML string for
  table-in-HTML-email situations and for HTML embedding purposes (with
  that `inline_css = TRUE` option). While the CSS-inlining has been
  mostly fine, it had two major problems: (1) it was *slow*, and (2) the
  underlying R code was so underpowered that it just couldn’t keep up
  with changes to our SCSS styles. This is now solved by integrating a
  package that uses the *juice* JS library (we call it **juicyjuice**!).
  This solution is far more performant and correct
  ([\#455](https://github.com/rstudio/gt/issues/455),
  [\#540](https://github.com/rstudio/gt/issues/540),
  [\#837](https://github.com/rstudio/gt/issues/837),
  [\#858](https://github.com/rstudio/gt/issues/858),
  [\#915](https://github.com/rstudio/gt/issues/915),
  [\#1093](https://github.com/rstudio/gt/issues/1093)).
  ([\#1114](https://github.com/rstudio/gt/issues/1114))

- There’s now padding around an HTML table! And you can even control the
  left/right (`container.padding.x`) and top/bottom
  (`container.padding.y`) padding values through
  [`tab_options()`](https://gt.rstudio.com/reference/tab_options.md)!
  This is very helpful since tables were way too close to paragraphs of
  text in rendered HTML documents produced by R Markdown and Quarto
  ([\#590](https://github.com/rstudio/gt/issues/590),
  [\#1105](https://github.com/rstudio/gt/issues/1105)).
  ([\#1116](https://github.com/rstudio/gt/issues/1116))

- The table stub can now freely merge with other columns using any of
  the `cols_merge*()` collection of functions. This is great if you want
  to independently format the stub and other columns and then bring them
  together in interesting ways.
  ([\#1122](https://github.com/rstudio/gt/issues/1122))

- We’ve added the ability to treat columns containing row names or group
  names as Markdown text. This provides the `process_md` argument in the
  [`gt()`](https://gt.rstudio.com/reference/gt.md) function. If this
  option is taken (example below) then the supplied names will be
  treated to ensure that there are unique IDs for later targeting (for
  [`tab_style()`](https://gt.rstudio.com/reference/tab_style.md),
  [`tab_footnote()`](https://gt.rstudio.com/reference/tab_footnote.md),
  etc.) ([\#694](https://github.com/rstudio/gt/issues/694)).
  ([\#1097](https://github.com/rstudio/gt/issues/1097))

  ``` r
  dplyr::tibble(x = c("**a**", "b", "*c*"), y = c("*A*", "*B*", "*B*"), z = 1:3) %>%
    gt(rowname_col = "x", groupname_col = "y", process_md = TRUE)
  ```

- If you find yourself not knowing the ID values of certain cells in the
  table (sometimes necessary for adding footnotes, styles, etc.) the new
  [`tab_info()`](https://gt.rstudio.com/reference/tab_info.md) function
  can help! Use that with a **gt** object and you’ll get an informative
  table that summarizes all of the table’s ID values and their
  associated labels
  ([\#1102](https://github.com/rstudio/gt/issues/1102)).
  ([\#1104](https://github.com/rstudio/gt/issues/1104))

- Much of **gt** is about adding things to a table but what about doing
  the opposite (taking things away)? The new family of `rm_*()`
  functions
  ([`rm_header()`](https://gt.rstudio.com/reference/rm_header.md),
  [`rm_stubhead()`](https://gt.rstudio.com/reference/rm_stubhead.md),
  [`rm_spanners()`](https://gt.rstudio.com/reference/rm_spanners.md),
  [`rm_footnotes()`](https://gt.rstudio.com/reference/rm_footnotes.md),
  [`rm_source_notes()`](https://gt.rstudio.com/reference/rm_source_notes.md),
  and [`rm_caption()`](https://gt.rstudio.com/reference/rm_caption.md))
  let us safely remove parts of a **gt** table. This can be advantageous
  in those instances where one might obtain a **gt** table though other
  means (like from another pkg) but prefer to excise some parts of it
  ([\#790](https://github.com/rstudio/gt/issues/790),
  [\#1005](https://github.com/rstudio/gt/issues/1005)).
  ([\#1073](https://github.com/rstudio/gt/issues/1073))

- The table stub column can now have its contents formatted with any of
  the `fmt_*()` functions. We also added the
  [`stub()`](https://gt.rstudio.com/reference/stub.md) helper function
  to help select the stub column
  ([\#747](https://github.com/rstudio/gt/issues/747)).
  ([\#1038](https://github.com/rstudio/gt/issues/1038))

- The new formatter function
  [`fmt_roman()`](https://gt.rstudio.com/reference/fmt_roman.md) lets us
  easily format numbers to Roman numerals (either as uppercase or
  lowercase letters). The
  [`vec_fmt_roman()`](https://gt.rstudio.com/reference/vec_fmt_roman.md)
  vector-formatting function was also introduced here.
  ([\#1035](https://github.com/rstudio/gt/issues/1035))

- The [`data_color()`](https://gt.rstudio.com/reference/data_color.md)
  function allows us to color the background of cells based on data, and
  **gt** smartly chooses a text color that provides the most contrast
  between text and background. We wanted to improve that feature so now
  [`data_color()`](https://gt.rstudio.com/reference/data_color.md) has a
  `contrast_algo` argument that allows us to choose between two color
  contrast algorithms: `"apca"` (*Accessible Perceptual Contrast
  Algorithm*; new, and the default now) and `"wcag"` (*Web Content
  Accessibility Guidelines*).
  ([\#1062](https://github.com/rstudio/gt/issues/1062))

- The accessibility of structurally-complicated **gt** tables (i.e.,
  multi-level headings, irregular headers, row groups, etc.) was
  addressed by work that follows the W3C WAI (*Web Accessibility
  Initiative*) guidance. Now, screen readers can better describe **gt**
  tables with such complex structures
  ([\#926](https://github.com/rstudio/gt/issues/926)).
  ([\#988](https://github.com/rstudio/gt/issues/988), thanks
  [@jooyoungseo](https://github.com/jooyoungseo)!)

### Minor improvements and bug fixes

- The `docx` output format is now better detected in R Markdown and
  Quarto ([\#1040](https://github.com/rstudio/gt/issues/1040)).
  ([\#1084](https://github.com/rstudio/gt/issues/1084), thanks
  [@cderv](https://github.com/cderv)!)

- Replaced all [`match.arg()`](https://rdrr.io/r/base/match.arg.html)
  calls with
  [`rlang::arg_match()`](https://rlang.r-lib.org/reference/arg_match.html)
  for better error output
  ([\#672](https://github.com/rstudio/gt/issues/672)).
  ([\#1099](https://github.com/rstudio/gt/issues/1099), thanks
  [@mojister](https://github.com/mojister)!)

- Project website improvements; we now have a doublet of sites: (1)
  <https://gt.rstudio.com> and (2) <https://gt.rstudio.com/dev>
  ([\#1074](https://github.com/rstudio/gt/issues/1074), thanks
  [@ddsjoberg](https://github.com/ddsjoberg)!)

- The dependency on the **stringr** package has been removed by
  replacing the remaining **stringr**-based function calls in the
  package with base-R equivalents.
  ([\#1043](https://github.com/rstudio/gt/issues/1043))

## gt 0.7.0

CRAN release: 2022-08-25

### New features

- We can now export **gt** tables as Word documents. This is thanks to
  [@thebioengineer](https://github.com/thebioengineer) (Ellis Hughes!)
  who not only made this type of output work through
  [`gtsave()`](https://gt.rstudio.com/reference/gtsave.md) (writes the
  .docx file) but also through
  [`as_word()`](https://gt.rstudio.com/reference/as_word.md) (gives you
  an OOXML string) ([\#121](https://github.com/rstudio/gt/issues/121),
  [\#929](https://github.com/rstudio/gt/issues/929)).
  ([\#962](https://github.com/rstudio/gt/issues/962),
  [\#986](https://github.com/rstudio/gt/issues/986),
  [\#1016](https://github.com/rstudio/gt/issues/1016))

- A whole new family of vector formatting functions (of the form
  `vec_fmt_*()`) has entered the package! After all, why should columns
  have all the formatting fun? If you have vectors in need of
  formatting, we have 14 of these functions, adapted from their
  corresponding `fmt_*()` functions. You can control the output style of
  the resulting character vector with the `output` argument. This can
  either be `"auto"` (the default), `"plain"`, `"html"`, `"latex"`,
  `"rtf"`, or `"word"`. In **knitr** rendering (i.e., Quarto or R
  Markdown), the `"auto"` option will choose the correct output value;
  this is great for incorporating formatted values in inline text.
  ([\#899](https://github.com/rstudio/gt/issues/899),
  [\#995](https://github.com/rstudio/gt/issues/995))

- It’s now incredibly easy to have colorful and stylish tables thanks to
  the new
  [`opt_stylize()`](https://gt.rstudio.com/reference/opt_stylize.md)
  function. We provide you with a carefully curated set of background
  colors, line colors, and line styles. There are six styles and six
  color variations, giving you 36 combinations of style and color to
  choose from ([\#238](https://github.com/rstudio/gt/issues/238)).
  ([\#987](https://github.com/rstudio/gt/issues/987))

- The
  [`tab_stub_indent()`](https://gt.rstudio.com/reference/tab_stub_indent.md)
  function was added to allow for fine control over row label
  indentation. ([\#999](https://github.com/rstudio/gt/issues/999),
  [\#1002](https://github.com/rstudio/gt/issues/1002))

- The
  [`fmt_duration()`](https://gt.rstudio.com/reference/fmt_duration.md)
  function is now available for formatting values to time duration
  values whether those input values are numbers or of the `difftime`
  class. It provides a wide array of options so you can get the
  formatting of time duration values just right
  ([\#403](https://github.com/rstudio/gt/issues/403)).
  ([\#916](https://github.com/rstudio/gt/issues/916))

- Generating PNG files from **gt** tables using
  [`gtsave()`](https://gt.rstudio.com/reference/gtsave.md) is now way
  better due to the move away from **webshot** to its sequel package
  **webshot2** ([\#621](https://github.com/rstudio/gt/issues/621),
  [\#885](https://github.com/rstudio/gt/issues/885)).
  ([\#985](https://github.com/rstudio/gt/issues/985))

- A number of accessibility enhancements for HTML table outputs were
  undertaken to make **gt** one of the most accessible table packages
  around ([\#678](https://github.com/rstudio/gt/issues/678),
  [\#679](https://github.com/rstudio/gt/issues/679),
  [\#680](https://github.com/rstudio/gt/issues/680)).
  ([\#977](https://github.com/rstudio/gt/issues/977),
  [\#978](https://github.com/rstudio/gt/issues/978),
  [\#979](https://github.com/rstudio/gt/issues/979),
  [\#981](https://github.com/rstudio/gt/issues/981); thank you,
  [@jooyoungseo](https://github.com/jooyoungseo), for all of this)

- Errors and warnings, though we don’t often like to receive them, look
  much better now since we’ve integrated the **cli** package into
  **gt**! ([\#963](https://github.com/rstudio/gt/issues/963))

### Minor improvements and bug fixes

- We can now supply data from adjacent columns to user-supplied
  aggregation functions in
  [`summary_rows()`](https://gt.rstudio.com/reference/summary_rows.md)
  and
  [`grand_summary_rows()`](https://gt.rstudio.com/reference/grand_summary_rows.md)
  ([\#383](https://github.com/rstudio/gt/issues/383),
  [\#690](https://github.com/rstudio/gt/issues/690),
  [\#952](https://github.com/rstudio/gt/issues/952)).
  ([\#1018](https://github.com/rstudio/gt/issues/1018))

- Initial alignments in the table stub are now more intelligently
  determined in [`gt()`](https://gt.rstudio.com/reference/gt.md) by
  examining the content of the column (the `"rowname_col"`) that will
  comprise the stub. If values are predominantly number-like then a
  right alignment will be chosen, otherwise row labels will be left
  aligned. ([\#999](https://github.com/rstudio/gt/issues/999))

- Enhanced automatic column alignment (set to `"auto"` by default in the
  [`gt()`](https://gt.rstudio.com/reference/gt.md) function) by probing
  the contents of the columns. This ensures that string-based
  dates/times/datetimes receive a better appearance before formatting.
  ([\#997](https://github.com/rstudio/gt/issues/997))

- **gt** tables no longer break table numbering in R Markdown and Quarto
  documents. ([\#1003](https://github.com/rstudio/gt/issues/1003),
  thanks [@cscheid](https://github.com/cscheid)!)

- The [`as_latex()`](https://gt.rstudio.com/reference/as_latex.md)
  documentation was updated to provide guidance on necessary LaTeX
  dependencies. ([\#1022](https://github.com/rstudio/gt/issues/1022),
  thanks [@coatless](https://github.com/coatless)!)

- Fixed a bug where footnote marks would not be rendered in the stub
  column representing row groups
  ([\#1001](https://github.com/rstudio/gt/issues/1001)).
  ([\#1014](https://github.com/rstudio/gt/issues/1014))

- Using [`gtsave()`](https://gt.rstudio.com/reference/gtsave.md) in a
  Quarto or R Markdown code chunk will no longer generate any output,
  which is good since we don’t want any
  ([\#974](https://github.com/rstudio/gt/issues/974)).
  ([\#1011](https://github.com/rstudio/gt/issues/1011))

- Fixed an issue where footnote marks would not be set directly to cell
  text generated from
  [`fmt_markdown()`](https://gt.rstudio.com/reference/fmt_markdown.md)
  ([\#893](https://github.com/rstudio/gt/issues/893),
  [\#993](https://github.com/rstudio/gt/issues/993)).
  ([\#1013](https://github.com/rstudio/gt/issues/1013))

- All **testthat** tests have been migrated to the 3rd Edition of
  **testthat**. Also, the tests run much faster now.
  ([\#959](https://github.com/rstudio/gt/issues/959))

## gt 0.6.0

CRAN release: 2022-05-24

### New features

- RTF output support more suitable for Pharma users: (1) table styling
  now defaults to a look with far less table borders, which is more
  common for Pharma-based applications; (2) RTF table generation can
  make use of the new page-layout options (`page.*`) added to the
  [`tab_options()`](https://gt.rstudio.com/reference/tab_options.md)
  function (e.g., `page.orientation`, `page.numbering`, etc.)
  ([\#311](https://github.com/rstudio/gt/issues/311),
  [\#653](https://github.com/rstudio/gt/issues/653)).
  ([\#927](https://github.com/rstudio/gt/issues/927))

- The
  [`tab_footnote()`](https://gt.rstudio.com/reference/tab_footnote.md)
  function now allows for non-location footnote by making the
  `locations` argument optional; Any footnotes declared in this way will
  have their notes precede any location-based notes in the footer area
  ([\#879](https://github.com/rstudio/gt/issues/879)).
  ([\#925](https://github.com/rstudio/gt/issues/925))

- The
  [`fmt_partsper()`](https://gt.rstudio.com/reference/fmt_partsper.md)
  function was added so that we can format values as high-ratio,
  dimensionless quantities (e.g., `"per-mille"`, `"ppm"`, etc.). These
  are less common that percentage values but no less important
  ([\#608](https://github.com/rstudio/gt/issues/608)).
  ([\#914](https://github.com/rstudio/gt/issues/914))

- The `sub_*()` group of functions were added to make simple and common
  substitutions of data in a gt table with not-too-much effort. The
  functions added are:
  [`sub_missing()`](https://gt.rstudio.com/reference/sub_missing.md),
  [`sub_zero()`](https://gt.rstudio.com/reference/sub_zero.md),
  [`sub_small_vals()`](https://gt.rstudio.com/reference/sub_small_vals.md),
  and
  [`sub_large_vals()`](https://gt.rstudio.com/reference/sub_large_vals.md).
  The [`sub_missing()`](https://gt.rstudio.com/reference/sub_missing.md)
  function replaces
  [`fmt_missing()`](https://gt.rstudio.com/reference/fmt_missing.md)
  (and this deprecates the latter)
  ([\#904](https://github.com/rstudio/gt/issues/904),
  [\#910](https://github.com/rstudio/gt/issues/910),
  [\#911](https://github.com/rstudio/gt/issues/911)).
  ([\#912](https://github.com/rstudio/gt/issues/912))

## gt 0.5.0

CRAN release: 2022-04-21

### New features

- The [`tab_spanner()`](https://gt.rstudio.com/reference/tab_spanner.md)
  and
  [`tab_spanner_delim()`](https://gt.rstudio.com/reference/tab_spanner_delim.md)
  functions now support the addition of column spanners with unlimited
  levels (previously, only a single level of spanner column labels was
  possible to add) ([\#746](https://github.com/rstudio/gt/issues/746)).
  ([\#905](https://github.com/rstudio/gt/issues/905))

- There is now support for the Indian numbering system, making the
  placement of digit-grouping separators correspond to thousand, lakh,
  crore, and higher quantities. This is available for several `fmt_*()`
  functions
  ([`fmt_number()`](https://gt.rstudio.com/reference/fmt_number.md),
  [`fmt_integer()`](https://gt.rstudio.com/reference/fmt_integer.md),
  [`fmt_currency()`](https://gt.rstudio.com/reference/fmt_currency.md),
  [`fmt_percent()`](https://gt.rstudio.com/reference/fmt_percent.md),
  and
  [`fmt_fraction()`](https://gt.rstudio.com/reference/fmt_fraction.md))
  and is exposed as the `system` argument with two options `"intl"`
  (international, the default) and `"ind"` (Indian).

### Minor improvements and bug fixes

- Enhanced the
  [`cols_merge_uncert()`](https://gt.rstudio.com/reference/cols_merge_uncert.md)
  function such that different lower and upper uncertainty values could
  be used (by specifying two columns in the `col_uncert` argument)
  ([\#884](https://github.com/rstudio/gt/issues/884)).
  ([\#888](https://github.com/rstudio/gt/issues/888))

- Honor the `locale` setting from the initial
  [`gt()`](https://gt.rstudio.com/reference/gt.md) call when rendering
  summary rows ([\#906](https://github.com/rstudio/gt/issues/906)).
  ([\#907](https://github.com/rstudio/gt/issues/907))

- Fixed an issue where styles that spanned multiple columns and rows in
  a summary block were not fully rendered
  ([\#859](https://github.com/rstudio/gt/issues/859)).
  ([\#924](https://github.com/rstudio/gt/issues/924))

- Improved LaTeX rendering of certain characters (e.g, `\`, `~`, `&`,
  etc.). ([\#903](https://github.com/rstudio/gt/issues/903))

- Aggregations with
  [`summary_rows()`](https://gt.rstudio.com/reference/summary_rows.md)
  and
  [`grand_summary_rows()`](https://gt.rstudio.com/reference/grand_summary_rows.md)
  that might return an `NaN` (common case is using
  `mean(., na.rm = TRUE)` on an all-`NA` column) now return `NA`. This
  removes the evaluation error that would otherwise occur and provides
  an opportunity to replace the `NA` with an explanatory replacement
  string ([\#471](https://github.com/rstudio/gt/issues/471),
  [\#827](https://github.com/rstudio/gt/issues/827)).
  ([\#887](https://github.com/rstudio/gt/issues/887))

## gt 0.4.0

CRAN release: 2022-02-15

### New features

- We now have the ability to display row group labels as a column in the
  stub (as an alternative to these grouping labels appearing as header
  rows). This is made possible with the new option `row_group.as_column`
  in [`tab_options()`](https://gt.rstudio.com/reference/tab_options.md)
  (the default keeps the preexisting behavior)
  ([\#291](https://github.com/rstudio/gt/issues/291)).
  ([\#855](https://github.com/rstudio/gt/issues/855))

- The table footer (which can contain footnotes and source notes) now
  has numerous layout options in
  [`tab_options()`](https://gt.rstudio.com/reference/tab_options.md):
  `footnotes.multiline`, `footnotes.sep`, `source_notes.multiline`, and
  `source_notes.sep`. With the `*.multline` options, we can control
  whether notes span across separate lines (`TRUE`, the default) or are
  kept together as a paragraph (`FALSE`). For the latter layout option,
  we can control the separation between consecutive notes with the
  `*.sep` options (the default is `" "`). The work done here also fixes
  long-standing issues with footer output in the LaTeX and RTF formats
  ([\#593](https://github.com/rstudio/gt/issues/593),
  [\#833](https://github.com/rstudio/gt/issues/833)).
  ([\#864](https://github.com/rstudio/gt/issues/864))

- The
  [`fmt_fraction()`](https://gt.rstudio.com/reference/fmt_fraction.md)
  formatter was added, allowing for flexible formatting of numerical
  values to mixed fractions of configurable accuracy
  ([\#402](https://github.com/rstudio/gt/issues/402)).
  ([\#753](https://github.com/rstudio/gt/issues/753))

- Added the
  [`opt_horizontal_padding()`](https://gt.rstudio.com/reference/opt_horizontal_padding.md)
  and
  [`opt_vertical_padding()`](https://gt.rstudio.com/reference/opt_vertical_padding.md)
  functions to easily expand or contract an HTML table in the horizontal
  and vertical directions
  ([\#868](https://github.com/rstudio/gt/issues/868)).
  ([\#882](https://github.com/rstudio/gt/issues/882))

- There is now a `locale` argument in the
  [`gt()`](https://gt.rstudio.com/reference/gt.md) function. If set,
  formatter functions like
  [`fmt_number()`](https://gt.rstudio.com/reference/fmt_number.md) will
  automatically use this global locale while formatting. There also
  remains the option to override the global locale with any non-`NULL`
  value set for `locale` within a `fmt_*()` call
  ([\#682](https://github.com/rstudio/gt/issues/682)).
  ([\#866](https://github.com/rstudio/gt/issues/866))

### Minor improvements and bug fixes

- There is now more flexibility, improved documentation, and more
  testing/reliability for the date/time formatting functions
  ([`fmt_date()`](https://gt.rstudio.com/reference/fmt_date.md),
  [`fmt_time()`](https://gt.rstudio.com/reference/fmt_time.md), and
  [`fmt_datetime()`](https://gt.rstudio.com/reference/fmt_datetime.md)).
  Now, `Date` and `POSIXct` columns are allowed to be formatted with
  these functions. With
  [`fmt_datetime()`](https://gt.rstudio.com/reference/fmt_datetime.md),
  we can even supply a format code for generation of custom dates/times
  ([\#612](https://github.com/rstudio/gt/issues/612),
  [\#775](https://github.com/rstudio/gt/issues/775),
  [\#800](https://github.com/rstudio/gt/issues/800)).
  ([\#801](https://github.com/rstudio/gt/issues/801))

- Footnote marks for HTML tables now have an improved appearance. They
  are slightly larger, set better against the text they follow, and,
  asterisks are specially handled such that their sizing is consistent
  with other marks ([\#511](https://github.com/rstudio/gt/issues/511)).
  ([\#876](https://github.com/rstudio/gt/issues/876))

- Further improving support for color value inputs, **gt** now allows
  shorthand hexadecimal color values (like `#333`) and the use of the
  `transparent` CSS color keyword
  ([\#839](https://github.com/rstudio/gt/issues/839),
  [\#856](https://github.com/rstudio/gt/issues/856)).
  ([\#870](https://github.com/rstudio/gt/issues/870))

- The rendering of percent signs in HTML output was changed from the
  problematic HTML entity `&percnt;` to simply `%`. This solves issues
  with tables incorrectly rendering percent signs in some situations
  ([\#657](https://github.com/rstudio/gt/issues/657),
  [\#686](https://github.com/rstudio/gt/issues/686)).
  ([\#871](https://github.com/rstudio/gt/issues/871))

- All values supplied within
  [`cells_title()`](https://gt.rstudio.com/reference/cells_title.md) are
  now checked more rigorously, erroring and providing actionable
  messaging when stopping does occur
  ([\#424](https://github.com/rstudio/gt/issues/424)).
  ([\#783](https://github.com/rstudio/gt/issues/783))

- Added a missing column entry in the documentation for the `gtcars`
  dataset. Thanks, [@luisDVA](https://github.com/luisDVA) for providing
  this fix! ([\#883](https://github.com/rstudio/gt/issues/883))

## gt 0.3.1

CRAN release: 2021-08-07

### New features

- We now have the `force_sign` argument in several numeric formatting
  functions
  ([`fmt_number()`](https://gt.rstudio.com/reference/fmt_number.md),
  [`fmt_integer()`](https://gt.rstudio.com/reference/fmt_integer.md),
  [`fmt_scientific()`](https://gt.rstudio.com/reference/fmt_scientific.md),
  [`fmt_engineering()`](https://gt.rstudio.com/reference/fmt_engineering.md),
  [`fmt_percent()`](https://gt.rstudio.com/reference/fmt_percent.md),
  [`fmt_currency()`](https://gt.rstudio.com/reference/fmt_currency.md),
  and [`fmt_bytes()`](https://gt.rstudio.com/reference/fmt_bytes.md)).
  This makes it possible to force the appearance of the positive sign
  for positive values
  ([\#773](https://github.com/rstudio/gt/issues/773)).
  ([\#793](https://github.com/rstudio/gt/issues/793))

- It’s now possible to add padding to the column labels and heading
  locations in HTML tables with two new arguments added to
  [`tab_options()`](https://gt.rstudio.com/reference/tab_options.md):
  `column_labels.padding` and `heading.padding`. Several options already
  exist for easily changing the vertical padding of certain locations,
  so, these additions make it possible to fully alter the padding from
  top to bottom (without resorting to using CSS)
  ([\#770](https://github.com/rstudio/gt/issues/770)).
  ([\#795](https://github.com/rstudio/gt/issues/795))

- The `whitespace` argument has been added to
  [`cell_text()`](https://gt.rstudio.com/reference/cell_text.md) and
  this provides many options for making whitespace easier to handle in
  HTML output tables
  ([\#714](https://github.com/rstudio/gt/issues/714)).
  ([\#797](https://github.com/rstudio/gt/issues/797))

### Minor improvements and bug fixes

- Fixed LaTeX rendering for tables that have a stub; now data row cells
  are correctly laid out.

- LaTeX output tables now properly render summary rows. In addition,
  grand summary rows are now rendered in LaTeX outputs (previously,
  grand summary rows were ignored). This clears the long-standing issue
  in [\#625](https://github.com/rstudio/gt/issues/625).
  ([\#768](https://github.com/rstudio/gt/issues/768))

- Titles and optional subtitles in LaTeX output tables have an improved
  appearance, and the underlying code was rewritten to guard against
  more edge cases that might lead to failing LaTeX output.
  ([\#779](https://github.com/rstudio/gt/issues/779))

- The `data` argument in the
  [`cols_label()`](https://gt.rstudio.com/reference/cols_label.md) and
  [`cols_width()`](https://gt.rstudio.com/reference/cols_width.md)
  functions was renamed to `.data` to avoid a partial matching issue
  (raised in [\#715](https://github.com/rstudio/gt/issues/715)).
  ([\#772](https://github.com/rstudio/gt/issues/772))

- Fixed a bug where styles may not be applied correctly to summary row
  cells in HTML output tables
  ([\#752](https://github.com/rstudio/gt/issues/752)).
  ([\#782](https://github.com/rstudio/gt/issues/782))

- Incorporated the full use of X11 color names for styling HTML tables.
  Now, named colors like `gray50` won’t throw an error. Additionally,
  CSS3 colors that have no equivalent in X11 (like `Crimson` and
  `RebeccaPurple`) will now also just work
  ([\#712](https://github.com/rstudio/gt/issues/712)).
  ([\#787](https://github.com/rstudio/gt/issues/787))

- Fixed a bug that occurs in the following rare circumstance: when using
  [`summary_rows()`](https://gt.rstudio.com/reference/summary_rows.md)
  with no stub, a new column is generated internally and given the name
  rowname; but this can conflict with a column that has the same name,
  generating duplicate column names and not erroring at that instant
  ([\#749](https://github.com/rstudio/gt/issues/749)).
  ([\#792](https://github.com/rstudio/gt/issues/792))

- The image generation functions
  [`local_image()`](https://gt.rstudio.com/reference/local_image.md) and
  [`web_image()`](https://gt.rstudio.com/reference/web_image.md) are
  enhanced such that multiple image paths/URLs can now be handled
  without errors. Thanks, [@primaj](https://github.com/primaj) for the
  initial work on this in
  [\#738](https://github.com/rstudio/gt/issues/738). Fixes
  [\#510](https://github.com/rstudio/gt/issues/510).
  ([\#803](https://github.com/rstudio/gt/issues/803))

- Fixed a bug that occurs when using a `font` with the
  [`cell_text()`](https://gt.rstudio.com/reference/cell_text.md) along
  with other styles. Fixes
  [\#661](https://github.com/rstudio/gt/issues/661) and
  [\#802](https://github.com/rstudio/gt/issues/802).
  ([\#805](https://github.com/rstudio/gt/issues/805))

- Implemented a fix for the situation where
  [`tab_style()`](https://gt.rstudio.com/reference/tab_style.md) is used
  along with
  [`cells_summary()`](https://gt.rstudio.com/reference/cells_summary.md)
  as a location and, also,
  [`row_group_order()`](https://gt.rstudio.com/reference/row_group_order.md)
  is used to reorder row groups. This resulted in a non-application of
  the style to the targeted summary cells
  ([\#812](https://github.com/rstudio/gt/issues/812)).
  ([\#814](https://github.com/rstudio/gt/issues/814))

## gt 0.3.0

CRAN release: 2021-05-12

This release focuses on improvements to two main areas:

1.  Better RTF output support:
    - RTF table generation is now fit for use following an extensive
      rewrite of internal RTF rendering functions.
    - RTF table output with `gtsave(..., "<file>.rtf")` and
      [`as_rtf()`](https://gt.rstudio.com/reference/as_rtf.md) now has
      much more feature parity compared to HTML tables; we can now add
      summary rows, format table text with Markdown via
      [`fmt_markdown()`](https://gt.rstudio.com/reference/fmt_markdown.md),
      and expect tables that look acceptable in Word and text editors
      that are RTF-compatible.
2.  Implementation of **tidyselect** semantics:
    - References to columns (by way of the `columns` argument in many
      **gt** functions) now better adhere to **tidyselect** semantics.
    - Instead of using `columns = vars(a, b)`, we now use
      `columns = c(a, b)` (`columns = c("a", "b")` also works, and this
      type of expression always has been an option in **gt**).
    - Other **tidyselect** idioms should also work; things like using
      [`where()`](https://tidyselect.r-lib.org/reference/where.html) to
      target columns (e.g.,
      `gt(exibble) %>% cols_hide(columns = where(is.numeric))` will hide
      all numeric columns) and negation (e.g., `columns = -c(a, b)`)
      function as expected.

### Breaking changes and deprecations

- Column labels subordinate to column spanner labels had their alignment
  forced to be `"center"` but now there is no specialized alignment of
  column labels under spanners. Should you need the old behavior,
  [`tab_style()`](https://gt.rstudio.com/reference/tab_style.md) can be
  used along with `cell_text(align = "center")` for all columns that
  live under spanners.
  ([\#662](https://github.com/rstudio/gt/issues/662))

- The automatic alignment of integer values has been changed from
  `"center"` to `"right"`. To correct for this, use
  [`tab_style()`](https://gt.rstudio.com/reference/tab_style.md) with
  `cell_text(align = "center")` for all affected columns.
  ([\#662](https://github.com/rstudio/gt/issues/662))

- As part of the **tidyselect** changes made in this release, using
  `columns = TRUE` (to mean that all columns should be considered) has
  now been replaced with `columns = everything()`. Using the former will
  result in a warning message.
  ([\#718](https://github.com/rstudio/gt/issues/718))

- While [`vars()`](https://dplyr.tidyverse.org/reference/vars.html) is
  still reexported in **gt**, its use with the `columns` argument
  (present in a large number of functions) is deprecated and a warning
  message will appear if it is used. In a later release, it can be
  expected that
  [`vars()`](https://dplyr.tidyverse.org/reference/vars.html) will no
  longer be reexported.
  ([\#718](https://github.com/rstudio/gt/issues/718))

- The `others_label` argument of
  [`tab_row_group()`](https://gt.rstudio.com/reference/tab_row_group.md)
  is deprecated since it was confusing to use. To specify a default
  label for row groups, the course of action is now to use
  `tab_options(row_group.default_label = <label>)`.
  ([\#699](https://github.com/rstudio/gt/issues/699))

### New features

- RTF table output via `gtsave(..., "<file>.rtf")` and
  [`as_rtf()`](https://gt.rstudio.com/reference/as_rtf.md) should
  produce more robust tables (allowing use of
  [`summary_rows()`](https://gt.rstudio.com/reference/summary_rows.md),
  [`fmt_markdown()`](https://gt.rstudio.com/reference/fmt_markdown.md),
  etc.). And tables generated as RTF can now take advantage of
  [`cols_width()`](https://gt.rstudio.com/reference/cols_width.md) for
  flexible modifications of column widths.
  ([\#638](https://github.com/rstudio/gt/issues/638) and
  [\#696](https://github.com/rstudio/gt/issues/696))

- All functions with a `columns` argument can now take advantage of
  **gt**’s full adherence to **tidyselect** semantics (use
  `columns = c(a, b)` or `columns = c("a", "b")` instead of
  `columns = vars(a, b)`).
  ([\#718](https://github.com/rstudio/gt/issues/718))

- New location helper functions have been added to make it possible to
  style more locations and add footnotes to once inaccessible locations;
  these are
  [`cells_stub_summary()`](https://gt.rstudio.com/reference/cells_stub_summary.md),
  [`cells_stub_grand_summary()`](https://gt.rstudio.com/reference/cells_stub_grand_summary.md),
  [`cells_footnotes()`](https://gt.rstudio.com/reference/cells_footnotes.md),
  and
  [`cells_source_notes()`](https://gt.rstudio.com/reference/cells_source_notes.md).
  Note that footnotes cannot be declared with the latter two functions.
  ([\#737](https://github.com/rstudio/gt/issues/737))

- The [`cols_unhide()`](https://gt.rstudio.com/reference/cols_unhide.md)
  function has been added as a complement to the
  [`cols_hide()`](https://gt.rstudio.com/reference/cols_hide.md)
  function. This is useful when provided the `gt_tbl` object without the
  source data and code to recreate it *and* there are hidden columns
  that should be made visible.
  ([\#710](https://github.com/rstudio/gt/issues/710))

- The new formatting function
  [`fmt_bytes()`](https://gt.rstudio.com/reference/fmt_bytes.md) helps
  you to transform numerical values to byte sizes with human readable
  units. ([\#750](https://github.com/rstudio/gt/issues/750))

- A new column merging function,
  [`cols_merge_n_pct()`](https://gt.rstudio.com/reference/cols_merge_n_pct.md),
  works to merge a count column and a percentage column together. This
  function will automatically hide the `col_pct` column by default (but
  that can be changed by setting `autohide = FALSE`).
  ([\#683](https://github.com/rstudio/gt/issues/683))

- Added the `caption` argument to
  [`gt()`](https://gt.rstudio.com/reference/gt.md). This brings caption
  support to **gt** tables in R Markdown and **bookdown** documents.
  ([\#689](https://github.com/rstudio/gt/issues/689))

### Minor improvements

- The `accounting` option is now available in the
  [`fmt_percent()`](https://gt.rstudio.com/reference/fmt_percent.md) and
  [`fmt_number()`](https://gt.rstudio.com/reference/fmt_number.md)
  formatting functions (previously it was only present in
  [`fmt_currency()`](https://gt.rstudio.com/reference/fmt_currency.md)).
  ([\#756](https://github.com/rstudio/gt/issues/756))

- In RTF documents generated through
  [`as_rtf()`](https://gt.rstudio.com/reference/as_rtf.md) and
  `gtsave(..., filename = "<file>.rtf")`, there is now a
  `page_numbering` option for adding page numbers to either the
  `"footer"` or the `"header"` areas (the default is `"none"`).
  ([\#755](https://github.com/rstudio/gt/issues/755))

- [`tab_spanner_delim()`](https://gt.rstudio.com/reference/tab_spanner_delim.md)
  gained a `split` argument to govern whether delimiter splitting should
  occur at the `"first"` or `"last"` instance of `delim`. For example,
  if the column name `"a.b.c"` is present and `split = "first"` then the
  spanner column label is `"a"` and the associated column label will be
  `"b.c"`; should `split = "last"` then the spanner and column will have
  `"a.b"` and `"c"` labels.
  ([\#699](https://github.com/rstudio/gt/issues/699))

- Added `id` as an argument to
  [`tab_spanner()`](https://gt.rstudio.com/reference/tab_spanner.md) and
  [`tab_row_group()`](https://gt.rstudio.com/reference/tab_row_group.md),
  which is useful for later access to these locations (especially when
  spanner or row group labels are complicated).
  ([\#665](https://github.com/rstudio/gt/issues/665),
  [\#699](https://github.com/rstudio/gt/issues/699))

- HTML table generation is much faster due to efforts to optimize HTML
  code generation in the building/rendering phase.
  ([\#664](https://github.com/rstudio/gt/issues/664))

### Bug fixes

- When getting the HTML text for **gt** table with
  `as_raw_html(..., inline_css = FALSE)`, the `<style>` tag content is
  no longer omitted. ([\#718](https://github.com/rstudio/gt/issues/718))

- Fixed two bugs in
  [`tab_row_group()`](https://gt.rstudio.com/reference/tab_row_group.md): (1)
  incorrect reordering of rows (Issue
  [\#717](https://github.com/rstudio/gt/issues/717)), and (2) spurious
  warnings with multiple calls (Issue
  [\#675](https://github.com/rstudio/gt/issues/675)).
  ([\#699](https://github.com/rstudio/gt/issues/699))

- The
  [`tab_spanner_delim()`](https://gt.rstudio.com/reference/tab_spanner_delim.md)
  with `gather = TRUE` did not work reliably (Issue
  [\#626](https://github.com/rstudio/gt/issues/626)) but was fixed along
  with other work done to overhaul the function.
  ([\#665](https://github.com/rstudio/gt/issues/665))

- Correction made to the representation of the `PEN` (Peruvian Nuevo
  Sol) currency. ([\#663](https://github.com/rstudio/gt/issues/663))

- Fix for [`gtsave()`](https://gt.rstudio.com/reference/gtsave.md) when
  saving an image and specifying a `path` value.
  ([\#592](https://github.com/rstudio/gt/issues/592))

## gt 0.2.2

CRAN release: 2020-08-05

### New features

- The new
  [`opt_table_font()`](https://gt.rstudio.com/reference/opt_table_font.md)
  function makes it possible to define a custom font for the entire
  **gt** table. The standard fallback fonts are still set by default but
  the font defined here will take precedence. You could still have
  different fonts in select locations in the table, and for that you
  would need to use
  [`tab_style()`](https://gt.rstudio.com/reference/tab_style.md) in
  conjunction with the
  [`cell_text()`](https://gt.rstudio.com/reference/cell_text.md) helper
  function. The new
  [`google_font()`](https://gt.rstudio.com/reference/google_font.md)
  helper function provides an option for supplying a font available at
  the Google Fonts service (this is in addition to using system fonts in
  the `font` argument). Using the
  [`info_google_fonts()`](https://gt.rstudio.com/reference/info_google_fonts.md)
  function will provide a table with a set of helpful font
  recommendations from the *Google Fonts* catalog. The new
  [`default_fonts()`](https://gt.rstudio.com/reference/default_fonts.md)
  functions provides a helpful vector of system fallback fonts which
  works well when defining a vector of fonts.
  ([\#591](https://github.com/rstudio/gt/issues/591))

- The new [`opt_css()`](https://gt.rstudio.com/reference/opt_css.md)
  function makes allows for the addition of custom CSS to a **gt**
  table. This CSS will be added after the compiled CSS that **gt**
  generates automatically when the `gt_tbl` object is transformed to an
  HTML output table. You can supply `css` as a vector of lines or as a
  single string. The
  [`css()`](https://rstudio.github.io/htmltools/reference/css.html)
  function has been re-exported from **htmltools** to make it easier to
  build CSS style declarations. (Also
  [\#591](https://github.com/rstudio/gt/issues/591))

- Setting the widths of table columns is now easier and more dependable
  with [`cols_width()`](https://gt.rstudio.com/reference/cols_width.md).
  Widths can be expressed in units of pixels (easily set by use of the
  [`px()`](https://gt.rstudio.com/reference/px.md) helper function), as
  percentages (where the
  [`pct()`](https://gt.rstudio.com/reference/pct.md) helper function is
  useful), or a mixture of the two. The function takes into
  consideration whether an overall table width has been provided with
  `tab_options(table.width = ...)`. Providing pixel widths for all
  columns serves to override any table width defined (yielding columns
  with the exact widths specified).
  ([\#561](https://github.com/rstudio/gt/issues/561))

- There are new options for numeric formatting: (1) using significant
  figures (with `n_sigfig` in `fmt_number`), and (2) the ability to
  retain/drop trailing decimal marks (with `drop_trailing_dec_mark` in
  [`fmt_number()`](https://gt.rstudio.com/reference/fmt_number.md),
  [`fmt_percent()`](https://gt.rstudio.com/reference/fmt_percent.md),
  and
  [`fmt_currency()`](https://gt.rstudio.com/reference/fmt_currency.md)).
  Thank you [@drolejoel](https://github.com/drolejoel) for the
  suggestion in [\#535](https://github.com/rstudio/gt/issues/535)!
  ([\#546](https://github.com/rstudio/gt/issues/546)).

- The new `scale_values` argument for
  [`fmt_percent()`](https://gt.rstudio.com/reference/fmt_percent.md)
  makes it easy to use values that are already scaled (and just require
  the percent mark). Thank you [@djohn215](https://github.com/djohn215)
  for the suggestion in
  [\#559](https://github.com/rstudio/gt/issues/559).
  ([\#565](https://github.com/rstudio/gt/issues/565))

- Font weights expressed as numeric values (e.g., `400`, `600`, etc.) in
  [`cell_text()`](https://gt.rstudio.com/reference/cell_text.md)’s
  `weight` argument now works properly.
  ([\#591](https://github.com/rstudio/gt/issues/591))

### Minor improvements and bug fixes

- The [`data_color()`](https://gt.rstudio.com/reference/data_color.md)
  function has been rewritten to improve performance
  ([\#543](https://github.com/rstudio/gt/issues/543)).
  ([\#576](https://github.com/rstudio/gt/issues/576))

- Restore the ability to have row striping in stub cells (with
  `tab_option()`’s `row.striping.include_stub = TRUE`). Thanks
  [@gergness](https://github.com/gergness) for creating PR
  [\#537](https://github.com/rstudio/gt/issues/537), which prompted this
  final fix. ([\#564](https://github.com/rstudio/gt/issues/564))

## gt 0.2.1

CRAN release: 2020-05-23

- [`summary_rows()`](https://gt.rstudio.com/reference/summary_rows.md)
  and
  [`grand_summary_rows()`](https://gt.rstudio.com/reference/grand_summary_rows.md)
  no longer incorrectly calculate summary values in cases where rows
  aren’t already sorted by group
  ([\#556](https://github.com/rstudio/gt/issues/556)).

- Ensure compatibility with **tibble** 3.0.0.
  ([\#557](https://github.com/rstudio/gt/issues/557))

- Adapt tests to changes in dependent packages.
  ([\#575](https://github.com/rstudio/gt/issues/575))

## gt 0.2.0.5

CRAN release: 2020-03-31

- New package with 80 exported functions for building display tables

## gt 0.1.0 (unreleased)
