# gt 0.6.0

## New features

* RTF output support more suitable for Pharma users: (1) table styling now defaults to a look with far less table borders, which is more common for Pharma-based applications; (2) RTF table generation can make use of the new page-layout options (`page.*`) added to the `tab_options()` function (e.g., `page.orientation`, `page.numbering`, etc.) (#311, #653). (#927)

* The `tab_footnote()` function now allows for non-location footnote by making the `locations` argument optional; Any footnotes declared in this way will have their notes precede any location-based notes in the footer area (#879). (#925)

* The `fmt_partsper()` function was added so that we can format values as high-ratio, dimensionless quantities (e.g., `"per-mille"`, `"ppm"`, etc.). These are less common that percentage values but no less important (#608). (#914)

* The `sub_*()` group of functions were added to make simple and common substitutions of data in a gt table with not-too-much effort. The functions added are: `sub_missing()`, `sub_zero()`, `sub_small_vals()`, and `sub_large_vals()`. The `sub_missing()` function replaces `fmt_missing()` (and this deprecates the latter) (#904, #910, #911). (#912)

# gt 0.5.0

## New features

* The `tab_spanner()` and `tab_spanner_delim()` functions now support the addition of column spanners with unlimited levels (previously, only a single level of spanner column labels was possible to add) (#746). (#905)

* There is now support for the Indian numbering system, making the placement of digit-grouping separators correspond to thousand, lakh, crore, and higher quantities. This is available for several `fmt_*()` functions (`fmt_number()`, `fmt_integer()`, `fmt_currency()`, `fmt_percent()`, and `fmt_fraction()`) and is exposed as the `system` argument with two options `"intl"` (international, the default) and `"ind"` (Indian).

## Minor improvements and bug fixes

* Enhanced the `cols_merge_uncert()` function such that different lower and upper uncertainty values could be used (by specifying two columns in the `col_uncert` argument) (#884). (#888)

* Honor the `locale` setting from the initial `gt()` call when rendering summary rows (#906). (#907)

* Fixed an issue where styles that spanned multiple columns and rows in a summary block were not fully rendered (#859). (#924)

* Improved LaTeX rendering of certain characters (e.g, `\`, `~`, `&`, etc.). (#903)

* Aggregations with `summary_rows()` and `grand_summary_rows()` that might return an `NaN` (common case is using `mean(., na.rm = TRUE)` on an all-`NA` column) now return `NA`. This removes the evaluation error that would otherwise occur and provides an opportunity to replace the `NA` with an explanatory replacement string (#471, #827). (#887)

# gt 0.4.0

## New features

* We now have the ability to display row group labels as a column in the stub (as an alternative to these grouping labels appearing as header rows). This is made possible with the new option `row_group.as_column` in `tab_options()` (the default keeps the preexisting behavior) (#291). (#855)

* The table footer (which can contain footnotes and source notes) now has numerous layout options in `tab_options()`: `footnotes.multiline`, `footnotes.sep`, `source_notes.multiline`, and `source_notes.sep`. With the `*.multline` options, we can control whether notes span across separate lines (`TRUE`, the default) or are kept together as a paragraph (`FALSE`). For the latter layout option, we can control the separation between consecutive notes with the `*.sep` options (the default is `" "`). The work done here also fixes long-standing issues with footer output in the LaTeX and RTF formats (#593, #833). (#864)

* The `fmt_fraction()` formatter was added, allowing for flexible formatting of numerical values to mixed fractions of configurable accuracy (#402). (#753)

* Added the `opt_horizontal_padding()` and `opt_vertical_padding()` functions to easily expand or contract an HTML table in the horizontal and vertical directions (#868). (#882) 

* There is now a `locale` argument in the `gt()` function. If set, formatter functions like `fmt_number()` will automatically use this global locale while formatting. There also remains the the option to override the global locale with any non-`NULL` value set for `locale` within a `fmt_*()` call (#682). (#866)

## Minor improvements and bug fixes

* There is now more flexibility, improved documentation, and more testing/reliability for the date/time formatting functions (`fmt_date()`, `fmt_time()`, and `fmt_datetime()`). Now, `Date` and `POSIXct` columns are allowed to be formatted with these functions. With `fmt_datetime()`, we can even supply a format code for generation of custom dates/times (#612, #775, #800). (#801)

* Footnote marks for HTML tables now have an improved appearance. They are slightly larger, set better against the text they follow, and, asterisks are specially handled such that their sizing is consistent with other marks (#511). (#876) 

* Further improving support for color value inputs, **gt** now allows shorthand hexadecimal color values (like `#333`) and the use of the `transparent` CSS color keyword (#839, #856). (#870)

* The rendering of percent signs in HTML output was changed from the problematic HTML entity `&percnt;` to simply `%`. This solves issues with tables incorrectly rendering percent signs in some situations (#657, #686). (#871)

* All values supplied within `cells_title()` are now checked more rigorously, erroring and providing actionable messaging when stopping does occur (#424). (#783)

* Added a missing column entry in the documentation for the `gtcars` dataset. Thanks, @luisDVA for providing this fix! (#883)

# gt 0.3.1

## New features

* We now have the `force_sign` argument in several numeric formatting functions (`fmt_number()`, `fmt_integer()`, `fmt_scientific()`, `fmt_engineering()`, `fmt_percent()`, `fmt_currency()`, and `fmt_bytes()`). This makes it possible to force the appearance of the positive sign for positive values (#773). (#793)

* It's now possible to add padding to the column labels and heading locations in HTML tables with two new arguments added to `tab_options()`: `column_labels.padding` and `heading.padding`. Several options already exist for easily changing the vertical padding of certain locations, so, these additions make it possible to fully alter the padding from top to bottom (without resorting to using CSS) (#770). (#795)

* The `whitespace` argument has been added to `cell_text()` and this provides many options for making whitespace easier to handle in HTML output tables (#714). (#797)

## Minor improvements and bug fixes

* Fixed LaTeX rendering for tables that have a stub; now data row cells are correctly laid out.

* LaTeX output tables now properly render summary rows. In addition, grand summary rows are now rendered in LaTeX outputs (previously, grand summary rows were ignored). This clears the long-standing issue in #625. (#768)

* Titles and optional subtitles in LaTeX output tables have an improved appearance, and the underlying code was rewritten to guard against more edge cases that might lead to failing LaTeX output. (#779)

* The `data` argument in the `cols_label()` and `cols_width()` functions was renamed to `.data` to avoid a partial matching issue (raised in #715). (#772)

* Fixed a bug where styles may not be applied correctly to summary row cells in HTML output tables (#752). (#782)

* Incorporated the full use of X11 color names for styling HTML tables. Now, named colors like `gray50` won't throw an error. Additionally, CSS3 colors that have no equivalent in X11 (like `Crimson` and `RebeccaPurple`) will now also just work (#712). (#787)

* Fixed a bug that occurs in the following rare circumstance: when using `summary_rows()` with no stub, a new column is generated internally and given the name rowname; but this can conflict with a column that has the same name, generating duplicate column names and not erroring at that instant (#749). (#792)

* The image generation functions `local_image()` and `web_image()` are enhanced such that multiple image paths/URLs can now be handled without errors. Thanks, @primaj for the initial work on this in #738. Fixes #510. (#803)

* Fixed a bug that occurs when using a `font` with the `cell_text()` along with other styles. Fixes #661 and #802. (#805)

* Implemented a fix for the situation where `tab_style()` is used along with `cells_summary()` as a location and, also, `row_group_order()` is used to reorder row groups. This resulted in a non-application of the style to the targeted summary cells (#812). (#814)

# gt 0.3.0

This release focuses on improvements to two main areas:

1. Better RTF output support:
    * RTF table generation is now fit for use following an extensive rewrite of internal RTF rendering functions.
    * RTF table output with `gtsave(..., "<file>.rtf")` and `as_rtf()` now has much more feature parity compared to HTML tables; we can now add summary rows, format table text with Markdown via `fmt_markdown()`, and expect tables that look acceptable in Word and text editors that are RTF-compatible.

2. Implementation of **tidyselect** semantics:
    * References to columns (by way of the `columns` argument in many **gt** functions) now better adhere to **tidyselect** semantics.
    * Instead of using `columns = vars(a, b)`, we now use `columns = c(a, b)` (`columns = c("a", "b")` also works, and this type of expression always has been an option in **gt**).
    * Other **tidyselect** idioms should also work; things like using `where()` to target columns (e.g., `gt(exibble) %>% cols_hide(columns = where(is.numeric))` will hide all numeric columns) and negation (e.g., `columns = -c(a, b)`) function as expected.
  
## Breaking changes and deprecations

* Column labels subordinate to column spanner labels had their alignment forced to be `"center"` but now there is no specialized alignment of column labels under spanners. Should you need the old behavior, `tab_style()` can be used along with `cell_text(align = "center")` for all columns that live under spanners. (#662)

* The automatic alignment of integer values has been changed from `"center"` to `"right"`. To correct for this, use `tab_style()` with `cell_text(align = "center")` for all affected columns. (#662)

* As part of the **tidyselect** changes made in this release, using `columns = TRUE` (to mean that all columns should be considered) has now been replaced with `columns = everything()`. Using the former will result in a warning message. (#718)

* While `vars()` is still reexported in **gt**, its use with the `columns` argument (present in a large number of functions) is deprecated and a warning message will appear if it is used. In a later release, it can be expected that `vars()` will no longer be reexported. (#718)

* The `others_label` argument of `tab_row_group()` is deprecated since it was confusing to use. To specify a default label for row groups, the course of action is now to use `tab_options(row_group.default_label = <label>)`. (#699)

## New features

* RTF table output via `gtsave(..., "<file>.rtf")` and `as_rtf()` should produce more robust tables (allowing use of `summary_rows()`, `fmt_markdown()`, etc.). And tables generated as RTF can now take advantage of `cols_width()` for flexible modifications of column widths. (#638 and #696)

* All functions with a `columns` argument can now take advantage of **gt**'s full adherence to **tidyselect** semantics (use `columns = c(a, b)` or `columns = c("a", "b")` instead of `columns = vars(a, b)`). (#718)

* New location helper functions have been added to make it possible to style more locations and add footnotes to once inaccessible locations; these are `cells_stub_summary()`, `cells_stub_grand_summary()`, `cells_footnotes()`, and `cells_source_notes()`. Note that footnotes cannot be declared with the latter two functions. (#737)

* The `cols_unhide()` function has been added as a complement to the `cols_hide()` function. This is useful when provided the `gt_tbl` object without the source data and code to recreate it *and* there are hidden columns that should be made visible. (#710)

* The new formatting function `fmt_bytes()` helps you to transform numerical values to byte sizes with human readable units. (#750)

* A new column merging function, `cols_merge_n_pct()`, works to merge a count column and a percentage column together. This function will automatically hide the `col_pct` column by default (but that can be changed by setting `autohide = FALSE`). (#683)

* Added the `caption` argument to `gt()`. This brings caption support to **gt** tables in R Markdown and **bookdown** documents. (#689)

## Minor improvements

* The `accounting` option is now available in the `fmt_percent()` and `fmt_number()` formatting functions (previously it was only present in `fmt_currency()`). (#756)

* In RTF documents generated through `as_rtf()` and `gtsave(..., filename = "<file>.rtf")`, there is now a `page_numbering` option for adding page numbers to either the `"footer"` or the `"header"` areas (the default is `"none"`). (#755)

* `tab_spanner_delim()` gained a `split` argument to govern whether delimiter splitting should occur at the `"first"` or `"last"` instance of `delim`. For example, if the column name `"a.b.c"` is present and `split = "first"` then the spanner column label is `"a"` and the associated column label will be `"b.c"`; should `split = "last"` then the spanner and column will have `"a.b"` and `"c"` labels. (#699)

* Added `id` as an argument to `tab_spanner()` and `tab_row_group()`, which is useful for later access to these locations (especially when spanner or row group labels are complicated). (#665, #699)

* HTML table generation is much faster due to efforts to optimize HTML code generation in the building/rendering phase. (#664)

## Bug fixes

* When getting the HTML text for **gt** table with `as_raw_html(..., inline_css = FALSE)`, the `<style>` tag content is no longer omitted. (#718)

* Fixed two bugs in `tab_row_group()`: (1) incorrect reordering of rows (Issue #717), and (2) spurious warnings with multiple calls (Issue #675). (#699)

* The `tab_spanner_delim()` with `gather = TRUE` did not work reliably (Issue #626) but was fixed along with other work done to overhaul the function. (#665)

* Correction made to the representation of the `PEN` (Peruvian Neuvo Sol) currency. (#663)

* Fix for `gtsave()` when saving an image and specifying a `path` value. (#592)

# gt 0.2.2

## New features

* The new `opt_table_font()` function makes it possible to define a custom font for the entire **gt** table. The standard fallback fonts are still set by default but the font defined here will take precedence. You could still have different fonts in select locations in the table, and for that you would need to use `tab_style()` in conjunction with the `cell_text()` helper function. The new `google_font()` helper function provides an option for supplying a font available at the Google Fonts service (this is in addition to using system fonts in the `font` argument). Using the `info_google_fonts()` function will provide a table with a set of helpful font recommendations from the *Google Fonts* catalog. The new `default_fonts()` functions provides a helpful vector of system fallback fonts which works well when defining a vector of fonts. (#591)

* The new `opt_css()` function makes allows for the addition of custom CSS to a **gt** table. This CSS will be added after the compiled CSS that **gt** generates automatically when the `gt_tbl` object is transformed to an HTML output table. You can supply `css` as a vector of lines or as a single string. The `css()` function has been re-exported from **htmltools** to make it easier to build CSS style declarations. (Also #591)

* Setting the widths of table columns is now easier and more dependable with `cols_width()`. Widths can be expressed in units of pixels (easily set by use of the `px()` helper function), as percentages (where the `pct()` helper function is useful), or a mixture of the two. The function takes into consideration whether an overall table width has been provided with `tab_options(table.width = ...)`. Providing pixel widths for all columns serves to override any table width defined (yielding columns with the exact widths specified). (#561)

* There are new options for numeric formatting: (1) using significant figures (with `n_sigfig` in `fmt_number`), and (2) the ability to retain/drop trailing decimal marks (with `drop_trailing_dec_mark` in `fmt_number()`, `fmt_percent()`, and `fmt_currency()`). Thank you @drolejoel for the suggestion in #535! (#546).

* The new `scale_values` argument for `fmt_percent()` makes it easy to use values that are already scaled (and just require the percent mark). Thank you @djohn215 for the suggestion in #559. (#565)

* Font weights expressed as numeric values (e.g., `400`, `600`, etc.) in `cell_text()`'s `weight` argument now works properly. (#591)

## Minor improvements and bug fixes

* The `data_color()` function has been rewritten to improve performance (#543). (#576)

* Restore the ability to have row striping in stub cells (with `tab_option()`'s `row.striping.include_stub = TRUE`). Thanks @gergness for creating PR #537, which prompted this final fix. (#564)

# gt 0.2.1

* `summary_rows()` and `grand_summary_rows()` no longer incorrectly calculate summary values in cases where rows aren't already sorted by group (#556).

* Ensure compatibility with **tibble** 3.0.0. (#557)

* Adapt tests to changes in dependent packages. (#575)

# gt 0.2.0.5

* New package with 80 exported functions for building display tables

# gt 0.1.0 (unreleased)
