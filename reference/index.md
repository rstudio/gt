# Package index

## Table creation

All **gt** tables begin with a call to
[`gt()`](https://gt.rstudio.com/reference/gt.md), where we would supply
the input data table (data frame or tibble) and some basic options for
creating a stub (`rowname_col`) and row groups (`groupname_col`). We can
also introduce a grouped tibble (via
[`dplyr::group_by()`](https://dplyr.tidyverse.org/reference/group_by.html))
for more precise divisions of rows into row groups.
[`gt_preview()`](https://gt.rstudio.com/reference/gt_preview.md) is
great for getting a nicely-formatted preview of a data table (defaulting
to the first 5 rows and the last row).

- [`gt()`](https://gt.rstudio.com/reference/gt.md) :

  Create a **gt** table object

- [`gt_preview()`](https://gt.rstudio.com/reference/gt_preview.md) :

  Generate a special **gt** table for previewing a dataset

## Creating or modifying parts of a table

A **gt** table can contain a few useful parts for conveying additional
information. These include a header (with a titles and subtitle), a
footer (with footnotes and source notes), and additional areas for
labels (row group labels, column spanner labels, the stubhead label). We
can modify the look of table parts more generally with
[`tab_options()`](https://gt.rstudio.com/reference/tab_options.md) and
perform styling on targeted table locations with
[`tab_style()`](https://gt.rstudio.com/reference/tab_style.md).

- [`tab_header()`](https://gt.rstudio.com/reference/tab_header.md) : Add
  a table header

- [`tab_spanner()`](https://gt.rstudio.com/reference/tab_spanner.md) :
  Add a spanner label

- [`tab_spanner_delim()`](https://gt.rstudio.com/reference/tab_spanner_delim.md)
  : Create column labels and spanners via delimited column names

- [`tab_row_group()`](https://gt.rstudio.com/reference/tab_row_group.md)
  :

  Add a row group to a **gt** table

- [`tab_stubhead()`](https://gt.rstudio.com/reference/tab_stubhead.md) :
  Add label text to the stubhead

- [`tab_stub_indent()`](https://gt.rstudio.com/reference/tab_stub_indent.md)
  : Control indentation of row labels in the stub

- [`tab_footnote()`](https://gt.rstudio.com/reference/tab_footnote.md) :
  Add a table footnote

- [`tab_source_note()`](https://gt.rstudio.com/reference/tab_source_note.md)
  : Add a source note citation

- [`tab_caption()`](https://gt.rstudio.com/reference/tab_caption.md) :
  Add a table caption

- [`tab_style()`](https://gt.rstudio.com/reference/tab_style.md) : Add
  custom styles to one or more cells

- [`tab_style_body()`](https://gt.rstudio.com/reference/tab_style_body.md)
  : Target cells in the table body and style accordingly

- [`tab_options()`](https://gt.rstudio.com/reference/tab_options.md) :
  Modify the table output options

- [`tab_info()`](https://gt.rstudio.com/reference/tab_info.md) :

  Understand what's been set inside of a **gt** table object

## Formatting column data

Columns of data can be formatted with the `fmt_*()` functions. We can
specify the rows of these columns quite precisely with the `rows`
argument. We get to apply these functions exactly once to each data cell
(last call wins). Need to do custom formatting? Use the
[`fmt()`](https://gt.rstudio.com/reference/fmt.md) function and define
your own formatter within (or, create a wrapper with
[`fmt()`](https://gt.rstudio.com/reference/fmt.md) if you prefer). The
`sub_*()` functions allow you to perform substitution operations and
[`data_color()`](https://gt.rstudio.com/reference/data_color.md)
provides a lot of power for colorizing body cells based on their data
values.

- [`fmt_number()`](https://gt.rstudio.com/reference/fmt_number.md) :
  Format numeric values

- [`fmt_integer()`](https://gt.rstudio.com/reference/fmt_integer.md) :
  Format values as integers

- [`fmt_scientific()`](https://gt.rstudio.com/reference/fmt_scientific.md)
  : Format values to scientific notation

- [`fmt_engineering()`](https://gt.rstudio.com/reference/fmt_engineering.md)
  : Format values to engineering notation

- [`fmt_number_si()`](https://gt.rstudio.com/reference/fmt_number_si.md)
  : Format numbers with SI prefixes

- [`fmt_percent()`](https://gt.rstudio.com/reference/fmt_percent.md) :
  Format values as a percentage

- [`fmt_partsper()`](https://gt.rstudio.com/reference/fmt_partsper.md) :
  Format values as parts-per quantities

- [`fmt_fraction()`](https://gt.rstudio.com/reference/fmt_fraction.md) :
  Format values as mixed fractions

- [`fmt_currency()`](https://gt.rstudio.com/reference/fmt_currency.md) :
  Format values as currencies

- [`fmt_roman()`](https://gt.rstudio.com/reference/fmt_roman.md) :
  Format values as Roman numerals

- [`fmt_index()`](https://gt.rstudio.com/reference/fmt_index.md) :
  Format values to indexed characters

- [`fmt_spelled_num()`](https://gt.rstudio.com/reference/fmt_spelled_num.md)
  : Format values to spelled-out numbers

- [`fmt_bytes()`](https://gt.rstudio.com/reference/fmt_bytes.md) :
  Format values as bytes

- [`fmt_date()`](https://gt.rstudio.com/reference/fmt_date.md) : Format
  values as dates

- [`fmt_time()`](https://gt.rstudio.com/reference/fmt_time.md) : Format
  values as times

- [`fmt_datetime()`](https://gt.rstudio.com/reference/fmt_datetime.md) :
  Format values as datetimes

- [`fmt_duration()`](https://gt.rstudio.com/reference/fmt_duration.md) :
  Format numeric or duration values as styled time duration strings

- [`fmt_bins()`](https://gt.rstudio.com/reference/fmt_bins.md) : Format
  column data containing bin/interval information

- [`fmt_tf()`](https://gt.rstudio.com/reference/fmt_tf.md) :

  Format `TRUE` and `FALSE` values

- [`fmt_markdown()`](https://gt.rstudio.com/reference/fmt_markdown.md) :
  Format Markdown text

- [`fmt_units()`](https://gt.rstudio.com/reference/fmt_units.md) :
  Format measurement units

- [`fmt_chem()`](https://gt.rstudio.com/reference/fmt_chem.md) : Format
  chemical formulas

- [`fmt_url()`](https://gt.rstudio.com/reference/fmt_url.md) : Format
  URLs to generate links

- [`fmt_email()`](https://gt.rstudio.com/reference/fmt_email.md) :
  Format email addresses to generate 'mailto:' links

- [`fmt_image()`](https://gt.rstudio.com/reference/fmt_image.md) :
  Format image paths to generate images in cells

- [`fmt_flag()`](https://gt.rstudio.com/reference/fmt_flag.md) :
  Generate flag icons for countries from their country codes

- [`fmt_country()`](https://gt.rstudio.com/reference/fmt_country.md) :
  Generate country names from their corresponding country codes

- [`fmt_icon()`](https://gt.rstudio.com/reference/fmt_icon.md) : Use
  icons within a table's body cells

- [`fmt_passthrough()`](https://gt.rstudio.com/reference/fmt_passthrough.md)
  : Format by simply passing data through

- [`fmt_auto()`](https://gt.rstudio.com/reference/fmt_auto.md) :
  Automatically format column data according to their values

- [`fmt()`](https://gt.rstudio.com/reference/fmt.md) : Set a column
  format with a formatter function

- [`sub_missing()`](https://gt.rstudio.com/reference/sub_missing.md) :
  Substitute missing values in the table body

- [`sub_zero()`](https://gt.rstudio.com/reference/sub_zero.md) :
  Substitute zero values in the table body

- [`sub_small_vals()`](https://gt.rstudio.com/reference/sub_small_vals.md)
  : Substitute small values in the table body

- [`sub_large_vals()`](https://gt.rstudio.com/reference/sub_large_vals.md)
  : Substitute large values in the table body

- [`sub_values()`](https://gt.rstudio.com/reference/sub_values.md) :
  Substitute targeted values in the table body

- [`data_color()`](https://gt.rstudio.com/reference/data_color.md) :
  Perform data cell colorization

## Text transformation

The `text_*()` functions take cell data that are solidified into strings
and allow for flexible transformations of those string values. Whereas
the `fmt_*()` and `sub_*()` are phases 1 and 2 of cell data
metamorphoses, the text transformation functions are the final phase,
acting on strings generated by formatting and substitution functions
with no reference to the source values.

- [`text_replace()`](https://gt.rstudio.com/reference/text_replace.md) :
  Perform highly targeted text replacement with a regex pattern
- [`text_case_when()`](https://gt.rstudio.com/reference/text_case_when.md)
  : Perform whole text replacements using a 'case-when'-expression
  approach
- [`text_case_match()`](https://gt.rstudio.com/reference/text_case_match.md)
  : Perform whole or partial text replacements with a 'switch'-like
  approach
- [`text_transform()`](https://gt.rstudio.com/reference/text_transform.md)
  : Perform text transformations with a custom function

## Modifying columns

The `cols_*()` functions allow for modifications that act on entire
columns. This includes alignment of the data in columns
([`cols_align()`](https://gt.rstudio.com/reference/cols_align.md)),
hiding columns from view
([`cols_hide()`](https://gt.rstudio.com/reference/cols_hide.md)),
re-labeling the column labels
([`cols_label()`](https://gt.rstudio.com/reference/cols_label.md)),
merging two columns together (the `cols_merge*()` functions), and moving
columns around (the `cols_move*()` functions).

- [`cols_align()`](https://gt.rstudio.com/reference/cols_align.md) : Set
  the alignment of columns

- [`cols_align_decimal()`](https://gt.rstudio.com/reference/cols_align_decimal.md)
  : Align all numeric values in a column along the decimal mark

- [`cols_width()`](https://gt.rstudio.com/reference/cols_width.md) : Set
  the widths of columns

- [`cols_label()`](https://gt.rstudio.com/reference/cols_label.md) :
  Relabel one or more columns

- [`cols_label_with()`](https://gt.rstudio.com/reference/cols_label_with.md)
  : Relabel columns with a function

- [`cols_units()`](https://gt.rstudio.com/reference/cols_units.md) :
  Define units for one or more columns

- [`cols_add()`](https://gt.rstudio.com/reference/cols_add.md) :

  Add one or more columns to a **gt** table

- [`cols_nanoplot()`](https://gt.rstudio.com/reference/cols_nanoplot.md)
  : Add a new column of nanoplots, taking input data from selected
  columns

- [`cols_move()`](https://gt.rstudio.com/reference/cols_move.md) : Move
  one or more columns

- [`cols_move_to_start()`](https://gt.rstudio.com/reference/cols_move_to_start.md)
  : Move one or more columns to the start

- [`cols_move_to_end()`](https://gt.rstudio.com/reference/cols_move_to_end.md)
  : Move one or more columns to the end

- [`cols_hide()`](https://gt.rstudio.com/reference/cols_hide.md) : Hide
  one or more columns

- [`cols_unhide()`](https://gt.rstudio.com/reference/cols_unhide.md) :
  Unhide one or more columns

- [`cols_merge()`](https://gt.rstudio.com/reference/cols_merge.md) :
  Merge data from two or more columns to a single column

- [`cols_merge_uncert()`](https://gt.rstudio.com/reference/cols_merge_uncert.md)
  : Merge columns to a value-with-uncertainty column

- [`cols_merge_range()`](https://gt.rstudio.com/reference/cols_merge_range.md)
  : Merge two columns to a value range column

- [`cols_merge_n_pct()`](https://gt.rstudio.com/reference/cols_merge_n_pct.md)
  : Merge two columns to combine counts and percentages

## Adding or modifying rows

There are several functions for working with rows in a **gt** table.
[`summary_rows()`](https://gt.rstudio.com/reference/summary_rows.md) and
[`grand_summary_rows()`](https://gt.rstudio.com/reference/grand_summary_rows.md)
add summary rows (groupwise or as grand summaries). The
[`rows_add()`](https://gt.rstudio.com/reference/rows_add.md) function
lets us add data rows. We can hide rows from view with
[`rows_hide()`](https://gt.rstudio.com/reference/rows_hide.md) and
reveal them with
[`rows_unhide()`](https://gt.rstudio.com/reference/rows_unhide.md). The
[`row_group_order()`](https://gt.rstudio.com/reference/row_group_order.md)
and [`row_order()`](https://gt.rstudio.com/reference/row_order.md)
functions let us modify the ordering of row groups and rows.

- [`summary_rows()`](https://gt.rstudio.com/reference/summary_rows.md) :
  Add group-wise summary rows using aggregation functions

- [`grand_summary_rows()`](https://gt.rstudio.com/reference/grand_summary_rows.md)
  : Add grand summary rows using aggregation functions

- [`row_group_order()`](https://gt.rstudio.com/reference/row_group_order.md)
  : Modify the ordering of any row groups

- [`row_order()`](https://gt.rstudio.com/reference/row_order.md) :
  Modify the order of rows within groups

- [`rows_add()`](https://gt.rstudio.com/reference/rows_add.md) :

  Add one or more rows to a **gt** table

- [`rows_hide()`](https://gt.rstudio.com/reference/rows_hide.md) : Hide
  one or more rows

- [`rows_unhide()`](https://gt.rstudio.com/reference/rows_unhide.md) :
  Unhide one or more rows

- [`summary_columns()`](https://gt.rstudio.com/reference/summary_columns.md)
  : Add summary columns using aggregation functions

## Removing parts of a table

The `rm_*()` functions let us safely remove parts of a **gt** table.
This can be advantageous in those instances where you would obtain a
**gt** table but prefer to excise some parts of it.

- [`rm_header()`](https://gt.rstudio.com/reference/rm_header.md) :
  Remove the table header
- [`rm_stubhead()`](https://gt.rstudio.com/reference/rm_stubhead.md) :
  Remove the stubhead label
- [`rm_spanners()`](https://gt.rstudio.com/reference/rm_spanners.md) :
  Remove column spanner labels
- [`rm_footnotes()`](https://gt.rstudio.com/reference/rm_footnotes.md) :
  Remove table footnotes
- [`rm_source_notes()`](https://gt.rstudio.com/reference/rm_source_notes.md)
  : Remove table source notes
- [`rm_caption()`](https://gt.rstudio.com/reference/rm_caption.md) :
  Remove the table caption

## FAQ

Many gt functions share parameters that behave more or less the same
way. These topics explain the design principles of some of them.

- [`rows-columns`](https://gt.rstudio.com/reference/rows-columns.md) :

  Apply conditional formatting to cells with `rows` and `columns`

- [`locale`](https://gt.rstudio.com/reference/locale.md) : Localize
  formatting and symbols

- [`location-helper`](https://gt.rstudio.com/reference/location-helper.md)
  :

  Helper to target cells at `locations`

- [`fmts`](https://gt.rstudio.com/reference/fmts.md) : Formatting
  functions

## Helper functions

An assortment of helper functions is available in the **gt** package.
The various `cells_*()` functions are used for targeting cells with the
`locations` argument of
[`tab_footnote()`](https://gt.rstudio.com/reference/tab_footnote.md),
[`tab_style()`](https://gt.rstudio.com/reference/tab_style.md), and
[`text_transform()`](https://gt.rstudio.com/reference/text_transform.md),
[`text_case_match()`](https://gt.rstudio.com/reference/text_case_match.md),
and
[`text_case_when()`](https://gt.rstudio.com/reference/text_case_when.md).
The `cell_*()` functions are used exclusively with
[`tab_style()`](https://gt.rstudio.com/reference/tab_style.md)’s `style`
argument. [`px()`](https://gt.rstudio.com/reference/px.md) &
[`pct()`](https://gt.rstudio.com/reference/pct.md) are useful there for
specifying units in pixels or percentages. The
[`md()`](https://gt.rstudio.com/reference/md.md) and
[`html()`](https://gt.rstudio.com/reference/html.md) helpers can used be
during label creation with
[`tab_header()`](https://gt.rstudio.com/reference/tab_header.md),
[`tab_footnote()`](https://gt.rstudio.com/reference/tab_footnote.md),
[`tab_spanner()`](https://gt.rstudio.com/reference/tab_spanner.md),
[`tab_stubhead()`](https://gt.rstudio.com/reference/tab_stubhead.md),
and
[`tab_source_note()`](https://gt.rstudio.com/reference/tab_source_note.md).

- [`md()`](https://gt.rstudio.com/reference/md.md) : Interpret input
  text as Markdown-formatted text

- [`html()`](https://gt.rstudio.com/reference/html.md) : Interpret input
  text as HTML-formatted text

- [`latex()`](https://gt.rstudio.com/reference/latex.md) : Interpret
  input text as LaTeX-formatted text

- [`px()`](https://gt.rstudio.com/reference/px.md) : Helper for
  providing a numeric value as pixels value

- [`pct()`](https://gt.rstudio.com/reference/pct.md) : Helper for
  providing a numeric value as percentage

- [`from_column()`](https://gt.rstudio.com/reference/from_column.md) :
  Reference a column of values for certain parameters

- [`currency()`](https://gt.rstudio.com/reference/currency.md) :

  Supply a custom currency symbol to
  [`fmt_currency()`](https://gt.rstudio.com/reference/fmt_currency.md)

- [`unit_conversion()`](https://gt.rstudio.com/reference/unit_conversion.md)
  : Get a conversion factor across two measurement units of a given
  class

- [`nanoplot_options()`](https://gt.rstudio.com/reference/nanoplot_options.md)
  :

  Supply nanoplot options to
  [`cols_nanoplot()`](https://gt.rstudio.com/reference/cols_nanoplot.md)

- [`adjust_luminance()`](https://gt.rstudio.com/reference/adjust_luminance.md)
  : Adjust the luminance for a palette of colors

- [`stub()`](https://gt.rstudio.com/reference/stub.md) : Select helper
  for targeting the stub column

- [`row_group()`](https://gt.rstudio.com/reference/row_group.md) :
  Select helper for targeting the row group column

- [`cells_body()`](https://gt.rstudio.com/reference/cells_body.md) :
  Location helper for targeting data cells in the table body

- [`cells_column_labels()`](https://gt.rstudio.com/reference/cells_column_labels.md)
  : Location helper for targeting the column labels

- [`cells_column_spanners()`](https://gt.rstudio.com/reference/cells_column_spanners.md)
  : Location helper for targeting the column spanners

- [`cells_footnotes()`](https://gt.rstudio.com/reference/cells_footnotes.md)
  : Location helper for targeting the footnotes

- [`cells_grand_summary()`](https://gt.rstudio.com/reference/cells_grand_summary.md)
  : Location helper for targeting cells in a grand summary

- [`cells_row_groups()`](https://gt.rstudio.com/reference/cells_row_groups.md)
  : Location helper for targeting row groups

- [`cells_source_notes()`](https://gt.rstudio.com/reference/cells_source_notes.md)
  : Location helper for targeting the source notes

- [`cells_stub()`](https://gt.rstudio.com/reference/cells_stub.md) :
  Location helper for targeting cells in the table stub

- [`cells_stub_grand_summary()`](https://gt.rstudio.com/reference/cells_stub_grand_summary.md)
  : Location helper for targeting the stub cells in a grand summary

- [`cells_stub_summary()`](https://gt.rstudio.com/reference/cells_stub_summary.md)
  : Location helper for targeting the stub cells in a summary

- [`cells_stubhead()`](https://gt.rstudio.com/reference/cells_stubhead.md)
  : Location helper for targeting the table stubhead cell

- [`cells_summary()`](https://gt.rstudio.com/reference/cells_summary.md)
  : Location helper for targeting group summary cells

- [`cells_title()`](https://gt.rstudio.com/reference/cells_title.md) :
  Location helper for targeting the table title and subtitle

- [`cell_text()`](https://gt.rstudio.com/reference/cell_text.md) :
  Helper for defining custom text styles for table cells

- [`cell_fill()`](https://gt.rstudio.com/reference/cell_fill.md) :
  Helper for defining custom fills for table cells

- [`cell_borders()`](https://gt.rstudio.com/reference/cell_borders.md) :
  Helper for defining custom borders for table cells

- [`random_id()`](https://gt.rstudio.com/reference/random_id.md) :

  Helper for creating a random `id` for a **gt** table

- [`escape_latex()`](https://gt.rstudio.com/reference/escape_latex.md) :
  Perform LaTeX escaping

- [`gt_latex_dependencies()`](https://gt.rstudio.com/reference/gt_latex_dependencies.md)
  :

  Get the LaTeX dependencies required for a **gt** table

- [`google_font()`](https://gt.rstudio.com/reference/google_font.md) :

  Helper function for specifying a font from the *Google Fonts* service

- [`default_fonts()`](https://gt.rstudio.com/reference/default_fonts.md)
  :

  Provide a vector of sensible system fonts for use with **gt** tables

- [`system_fonts()`](https://gt.rstudio.com/reference/system_fonts.md) :
  Get a themed font stack that works well across systems

## Image addition utilities

We can add images into a **gt** table with the help of the `*_image()`
functions. Two common ways to do this: (1) use
[`text_transform()`](https://gt.rstudio.com/reference/text_transform.md)
to insert images into data cells, (2) use any function that creates new
labels (e.g.,
[`tab_header()`](https://gt.rstudio.com/reference/tab_header.md)) and
use a `*_image()` function within the
[`html()`](https://gt.rstudio.com/reference/html.md) helper.

- [`web_image()`](https://gt.rstudio.com/reference/web_image.md) :
  Helper function for adding an image from the web
- [`local_image()`](https://gt.rstudio.com/reference/local_image.md) :
  Helper function for adding a local image
- [`ggplot_image()`](https://gt.rstudio.com/reference/ggplot_image.md) :
  Helper function for adding a ggplot
- [`test_image()`](https://gt.rstudio.com/reference/test_image.md) :
  Generate a path to a test image

## Table options

With the `opt_*()` functions, we have an easy way to set commonly-used
table options without having to use
[`tab_options()`](https://gt.rstudio.com/reference/tab_options.md)
directly. Like, we can quickly add a stylizing theme with
[`opt_stylize()`](https://gt.rstudio.com/reference/opt_stylize.md), get
an interactive HTML table with
[`opt_interactive()`](https://gt.rstudio.com/reference/opt_interactive.md),
modify the appearance of footnote marks with
[`opt_footnote_marks()`](https://gt.rstudio.com/reference/opt_footnote_marks.md)
and
[`opt_footnote_spec()`](https://gt.rstudio.com/reference/opt_footnote_spec.md),
turn on row striping, change the alignment of the table header, and so
much more.

- [`opt_stylize()`](https://gt.rstudio.com/reference/opt_stylize.md) :
  Stylize your table with a colorful look
- [`opt_interactive()`](https://gt.rstudio.com/reference/opt_interactive.md)
  : Option to put interactive elements in an HTML table
- [`opt_footnote_marks()`](https://gt.rstudio.com/reference/opt_footnote_marks.md)
  : Option to modify the set of footnote marks
- [`opt_footnote_spec()`](https://gt.rstudio.com/reference/opt_footnote_spec.md)
  : Option to specify the formatting of footnote marks
- [`opt_footnote_order()`](https://gt.rstudio.com/reference/opt_footnote_order.md)
  : Option to modify the order of footnotes
- [`opt_row_striping()`](https://gt.rstudio.com/reference/opt_row_striping.md)
  : Option to add or remove row striping
- [`opt_align_table_header()`](https://gt.rstudio.com/reference/opt_align_table_header.md)
  : Option to align the table header
- [`opt_vertical_padding()`](https://gt.rstudio.com/reference/opt_vertical_padding.md)
  : Option to expand or contract vertical padding
- [`opt_horizontal_padding()`](https://gt.rstudio.com/reference/opt_horizontal_padding.md)
  : Option to expand or contract horizontal padding
- [`opt_all_caps()`](https://gt.rstudio.com/reference/opt_all_caps.md) :
  Option to use all caps in select table locations
- [`opt_table_lines()`](https://gt.rstudio.com/reference/opt_table_lines.md)
  : Option to set table lines to different extents
- [`opt_table_outline()`](https://gt.rstudio.com/reference/opt_table_outline.md)
  : Option to wrap an outline around the entire table
- [`opt_table_font()`](https://gt.rstudio.com/reference/opt_table_font.md)
  : Options to define font choices for the entire table
- [`opt_css()`](https://gt.rstudio.com/reference/opt_css.md) : Option to
  add custom CSS for the table

## Informational tables for reference

These `info_*()` functions present us with **gt** tables containing
useful information. So far, we can get reference information on date
styles
([`info_date_style()`](https://gt.rstudio.com/reference/info_date_style.md)),
on time styles
([`info_time_style()`](https://gt.rstudio.com/reference/info_time_style.md)),
on a huge number of color palettes
([`info_paletteer()`](https://gt.rstudio.com/reference/info_paletteer.md)),
on currencies
([`info_currencies()`](https://gt.rstudio.com/reference/info_currencies.md)),
on all of the different locales supported in the formatter functions
([`info_locales()`](https://gt.rstudio.com/reference/info_locales.md)),
and on our recommendations for which Google Fonts to try in your tables
([`info_google_fonts()`](https://gt.rstudio.com/reference/info_google_fonts.md)).

- [`info_date_style()`](https://gt.rstudio.com/reference/info_date_style.md)
  : View a table with info on date styles

- [`info_time_style()`](https://gt.rstudio.com/reference/info_time_style.md)
  : View a table with info on time styles

- [`info_currencies()`](https://gt.rstudio.com/reference/info_currencies.md)
  : View a table with info on supported currencies

- [`info_locales()`](https://gt.rstudio.com/reference/info_locales.md) :
  View a table with info on supported locales

- [`info_paletteer()`](https://gt.rstudio.com/reference/info_paletteer.md)
  : View a table with info on color palettes

- [`info_google_fonts()`](https://gt.rstudio.com/reference/info_google_fonts.md)
  : View a table on recommended Google Fonts

- [`info_tf_style()`](https://gt.rstudio.com/reference/info_tf_style.md)
  : View a table with info on TRUE/FALSE formatting styles

- [`info_flags()`](https://gt.rstudio.com/reference/info_flags.md) :

  View a table with all available flags for
  [`fmt_flag()`](https://gt.rstudio.com/reference/fmt_flag.md)

- [`info_icons()`](https://gt.rstudio.com/reference/info_icons.md) :

  View a table with all available Font Awesome icons for
  [`fmt_icon()`](https://gt.rstudio.com/reference/fmt_icon.md)

- [`info_unit_conversions()`](https://gt.rstudio.com/reference/info_unit_conversions.md)
  :

  View a table with all units that can be converted by
  [`unit_conversion()`](https://gt.rstudio.com/reference/unit_conversion.md)

## Shiny

Shiny is great for building interactive web apps with R. There’s really
nothing quite like it. The **gt** package includes two functions that
work nicely with Shiny: a table render function
[`render_gt()`](https://gt.rstudio.com/reference/render_gt.md) (for the
`server`) and a table output element
[`gt_output()`](https://gt.rstudio.com/reference/gt_output.md) (for the
`ui`).

- [`render_gt()`](https://gt.rstudio.com/reference/render_gt.md) :

  A **gt** display table render function for use in Shiny

- [`gt_output()`](https://gt.rstudio.com/reference/gt_output.md) :

  Create a **gt** display table output element for Shiny

- [`gt_update_select()`](https://gt.rstudio.com/reference/gt_update_select.md)
  :

  Update a **gt** selection in Shiny

## Export and extraction functions

There may come a day when you need to export a **gt** table to some
specific format. A great function for that is
[`gtsave()`](https://gt.rstudio.com/reference/gtsave.md), which allows
us to save the table as a standalone HTML, LaTeX, RTF, .docx, or even an
image file. Some other functions give us table code as a character
vector (e.g.,
[`as_raw_html()`](https://gt.rstudio.com/reference/as_raw_html.md) and
more). Did you use the
[`summary_rows()`](https://gt.rstudio.com/reference/summary_rows.md)
function and wish you had that summary data in a tibble? You can get it
out with
[`extract_summary()`](https://gt.rstudio.com/reference/extract_summary.md).
Want to extract already-formatted cells from the table into a vector? Do
it with
[`extract_cells()`](https://gt.rstudio.com/reference/extract_cells.md)!
It’s even possible to extract the body of a table as a data frame during
various ‘build’ stages (do this with
[`extract_body()`](https://gt.rstudio.com/reference/extract_body.md)).

- [`gtsave()`](https://gt.rstudio.com/reference/gtsave.md) :

  Save a **gt** table as a file

- [`as_raw_html()`](https://gt.rstudio.com/reference/as_raw_html.md) :

  Get the HTML content of a **gt** table

- [`as_latex()`](https://gt.rstudio.com/reference/as_latex.md) :

  Output a **gt** object as LaTeX

- [`as_rtf()`](https://gt.rstudio.com/reference/as_rtf.md) :

  Output a **gt** object as RTF

- [`as_word()`](https://gt.rstudio.com/reference/as_word.md) :

  Output a **gt** object as Word

- [`as_gtable()`](https://gt.rstudio.com/reference/as_gtable.md) :

  Transform a **gt** table to a `gtable` object

- [`extract_body()`](https://gt.rstudio.com/reference/extract_body.md) :

  Extract the table body from a **gt** object

- [`extract_summary()`](https://gt.rstudio.com/reference/extract_summary.md)
  :

  Extract a summary list from a **gt** object

- [`extract_cells()`](https://gt.rstudio.com/reference/extract_cells.md)
  :

  Extract a vector of formatted cells from a **gt** object

## Working with table groups

Sometimes you want to deal with a multitude of **gt** tables, all at
once. There are some advantages to having a group of tables bundled
together in a `gt_group` object. You could apply options that pertain to
all tables yet still access the individual tables to give them their own
specialized modifications. They all print altogether at once too! For
HTML, each table will be separated by a line break whereas in paginated
formats the tables are separated by page breaks.

- [`gt_group()`](https://gt.rstudio.com/reference/gt_group.md) :

  Create a `gt_group` container for holding multiple **gt** table
  objects

- [`gt_split()`](https://gt.rstudio.com/reference/gt_split.md) :

  Split a table into a group of tables (a `gt_group`)

- [`grp_pull()`](https://gt.rstudio.com/reference/grp_pull.md) :

  Pull out a **gt** table from a `gt_group` container object

- [`grp_add()`](https://gt.rstudio.com/reference/grp_add.md) :

  Add one or more **gt** tables to a `gt_group` container object

- [`grp_clone()`](https://gt.rstudio.com/reference/grp_clone.md) :

  Clone one or more **gt** tables in a `gt_group` container object

- [`grp_replace()`](https://gt.rstudio.com/reference/grp_replace.md) :

  Replace one or more **gt** tables in a `gt_group` container object

- [`grp_rm()`](https://gt.rstudio.com/reference/grp_rm.md) :

  Remove one or more **gt** tables from a `gt_group` container object

- [`grp_options()`](https://gt.rstudio.com/reference/grp_options.md) :

  Modify table options for all tables within a `gt_group` object

## Vector formatting

Why should columns have all the formatting fun? If you have vectors in
need of formatting, we have a set of `vec_fmt_*()` functions that have
been adapted from the corresponding `fmt_*()` functions.

- [`vec_fmt_number()`](https://gt.rstudio.com/reference/vec_fmt_number.md)
  : Format a vector as numeric values
- [`vec_fmt_integer()`](https://gt.rstudio.com/reference/vec_fmt_integer.md)
  : Format a vector as integer values
- [`vec_fmt_scientific()`](https://gt.rstudio.com/reference/vec_fmt_scientific.md)
  : Format a vector as values in scientific notation
- [`vec_fmt_engineering()`](https://gt.rstudio.com/reference/vec_fmt_engineering.md)
  : Format a vector as values in engineering notation
- [`vec_fmt_number_si()`](https://gt.rstudio.com/reference/vec_fmt_number_si.md)
  : Format a vector as numbers with SI prefixes
- [`vec_fmt_percent()`](https://gt.rstudio.com/reference/vec_fmt_percent.md)
  : Format a vector as percentage values
- [`vec_fmt_partsper()`](https://gt.rstudio.com/reference/vec_fmt_partsper.md)
  : Format a vector as parts-per quantities
- [`vec_fmt_fraction()`](https://gt.rstudio.com/reference/vec_fmt_fraction.md)
  : Format a vector as mixed fractions
- [`vec_fmt_currency()`](https://gt.rstudio.com/reference/vec_fmt_currency.md)
  : Format a vector as currency values
- [`vec_fmt_roman()`](https://gt.rstudio.com/reference/vec_fmt_roman.md)
  : Format a vector as Roman numerals
- [`vec_fmt_index()`](https://gt.rstudio.com/reference/vec_fmt_index.md)
  : Format a vector as indexed characters
- [`vec_fmt_spelled_num()`](https://gt.rstudio.com/reference/vec_fmt_spelled_num.md)
  : Format a vector as spelled-out numbers
- [`vec_fmt_bytes()`](https://gt.rstudio.com/reference/vec_fmt_bytes.md)
  : Format a vector as values in terms of bytes
- [`vec_fmt_date()`](https://gt.rstudio.com/reference/vec_fmt_date.md) :
  Format a vector as date values
- [`vec_fmt_time()`](https://gt.rstudio.com/reference/vec_fmt_time.md) :
  Format a vector as time values
- [`vec_fmt_datetime()`](https://gt.rstudio.com/reference/vec_fmt_datetime.md)
  : Format a vector as datetime values
- [`vec_fmt_duration()`](https://gt.rstudio.com/reference/vec_fmt_duration.md)
  : Format a vector of numeric or duration values as styled time
  duration strings
- [`vec_fmt_markdown()`](https://gt.rstudio.com/reference/vec_fmt_markdown.md)
  : Format a vector containing Markdown text

## Built in datasets

The **gt** package is equipped with 18 datasets that come in all shapes
and sizes. Use them to experiment with the package! Many examples in the
documentation use these datasets to demonstrate the awesome features of
**gt**.

- [`countrypops`](https://gt.rstudio.com/reference/countrypops.md) :
  Yearly populations of countries from 1960 to 2024
- [`sza`](https://gt.rstudio.com/reference/sza.md) : Twice hourly solar
  zenith angles by month & latitude
- [`gtcars`](https://gt.rstudio.com/reference/gtcars.md) : Deluxe
  automobiles from the 2014-2017 period
- [`sp500`](https://gt.rstudio.com/reference/sp500.md) : Daily S&P 500
  Index data from 1950 to 2015
- [`pizzaplace`](https://gt.rstudio.com/reference/pizzaplace.md) : A
  year of pizza sales from a pizza place
- [`exibble`](https://gt.rstudio.com/reference/exibble.md) : A toy
  example tibble for testing with gt: exibble
- [`towny`](https://gt.rstudio.com/reference/towny.md) : Populations of
  all municipalities in Ontario from 1996 to 2021
- [`peeps`](https://gt.rstudio.com/reference/peeps.md) : A table of
  personal information for people all over the world
- [`films`](https://gt.rstudio.com/reference/films.md) : Feature films
  in competition at the Cannes Film Festival
- [`metro`](https://gt.rstudio.com/reference/metro.md) : The stations of
  the Paris Metro
- [`gibraltar`](https://gt.rstudio.com/reference/gibraltar.md) : Weather
  conditions in Gibraltar, May 2023
- [`constants`](https://gt.rstudio.com/reference/constants.md) : The
  fundamental physical constants
- [`illness`](https://gt.rstudio.com/reference/illness.md) : Lab tests
  for one suffering from an illness
- [`reactions`](https://gt.rstudio.com/reference/reactions.md) :
  Reaction rates for gas-phase atmospheric reactions of organic
  compounds
- [`photolysis`](https://gt.rstudio.com/reference/photolysis.md) : Data
  on photolysis rates for gas-phase organic compounds
- [`nuclides`](https://gt.rstudio.com/reference/nuclides.md) : Nuclide
  data
- [`rx_adsl`](https://gt.rstudio.com/reference/rx_adsl.md) : An
  ADSL-flavored clinical trial toy dataset
- [`rx_addv`](https://gt.rstudio.com/reference/rx_addv.md) : An
  ADDV-flavored clinical trial toy dataset
