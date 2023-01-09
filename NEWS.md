# gt (development version)

* A new function, `cols_label_with()`, is added for relabeling columns with functions. It allows for renaming functions to applied to arbitrary sets of columns, using `tidyselect`. It's like `rename_with()` for your **gt** table, but doesn't need unique names for labeling.

# gt 0.8.0

## New features

* The new function `sub_values()` is here for subbing in arbitrary text in body cells, based on value, a regex, or a specialized function. It's like a supercharged find-and-replace for your **gt** table (#703). (#1066)

* We want the setting of styles to be as easy as possible so, to that end, we've added a helpful new function: `tab_style_body()`. This function is a bit like `sub_values()` and a bit like `tab_style()`. The idea is that basic style attributes can be set based on values in the table body. We can target body cells though value, regex, and custom matching rules, and, apply styles to them and their surrounding context (e.g., styling an entire row or column wherein the match is found). The help file at `?tab_style_body` provides copious examples w/ eye catching visuals (#863). (#1108)

* The `fmt_date()`, `fmt_time()`, and `fmt_datetime()` functions have been improved so much, I don't even know where to begin. The `fmt_datetime()` function has an enhanced `format` argument that accepts *CLDR*-style formatting patterns (much more powerful and flexible than the `strptime()` patterns). The `fmt_datetime()` function will detect the pattern type given in `format`. The `date_style` and `time_style` arguments still exist but have been extended to accept more style keywords. There is now the concept of flexible date and time formats that are locale-aware (the `locale` argument is new to these functions). The `info_date_style()` and `info_time_style()` functions have been enhanced to give you display tables will all the style possibilities. All of this goodness extends to the `vec_fmt_*()` variants (`vec_fmt_date()`, `vec_fmt_time()`, and `vec_fmt_datetime()`). The documentation for all of this has been overhauled and provides many explanations and examples for your edification (#531, #1052). (#1053)

* We can now have decimal alignment for numeric values and this made possible with the new `cols_align_decimal()` function. The function ensures that columns targeted are right-aligned, that accounting notation is supported, and that footnote marks don't interfere (#139, #144, #560, #673). (#1058, #1092; assist by the inimitable @steveputman!)

* We can easily add a caption to a **gt** table (or replace an existing one) with the new and convenient `tab_caption()` function (#1048). (#1051, thank you @billdenney!)

* So you've got a **gt** table and you want a value or two from that table to appear elsewhere in your R Markdown or Quarto document. Previously, you had to recreate it in some way but now you can use `extract_cells()`! That function will extract a vector of cell data from a `gt_tbl` object. The output vector will have the cell data formatted in the same way as the table. (#1045, #1047)

* The `as_raw_html()` function is useful for generating an HTML string for table-in-HTML-email situations and for HTML embedding purposes (with that `inline_css = TRUE` option). While the CSS-inlining has been mostly fine, it had two major problems: (1) it was *slow*, and (2) the underlying R code was so underpowered that it just couldn't keep up with changes to our SCSS styles. This is now solved by integrating a package that uses the *juice* JS library (we call it **juicyjuice**!). This solution is far more performant and correct (#455, #540, #837, #858, #915, #1093). (#1114)

* There's now padding around an HTML table! And you can even control the left/right (`container.padding.x`) and top/bottom (`container.padding.y`) padding values through `tab_options()`! This is very helpful since tables were way too close to paragraphs of text in rendered HTML documents produced by R Markdown and Quarto (#590, #1105). (#1116) 

* The table stub can now freely merge with other columns using any of the `cols_merge*()` collection of functions. This is great if you want to independently format the stub and other columns and then bring them together in interesting ways. (#1122)

* We've added the ability to treat columns containing row names or group names as Markdown text. This provides the `process_md` argument in the `gt()` function. If this option is taken (example below) then the supplied names will be treated to ensure that there are unique IDs for later targeting (for `tab_style()`, `tab_footnote()`, etc.) (#694). (#1097)

  ```r
  dplyr::tibble(x = c("**a**", "b", "*c*"), y = c("*A*", "*B*", "*B*"), z = 1:3) %>%
    gt(rowname_col = "x", groupname_col = "y", process_md = TRUE)
  ```

* If you find yourself not knowing the ID values of certain cells in the table (sometimes necessary for adding footnotes, styles, etc.) the new `tab_info()` function can help! Use that with a **gt** object and you'll get an informative table that summarizes all of the table's ID values and their associated labels (#1102). (#1104)

* Much of **gt** is about adding things to a table but what about doing the opposite (taking things away)? The new family of `rm_*()` functions (`rm_header()`, `rm_stubhead()`, `rm_spanners()`, `rm_footnotes()`, `rm_source_notes()`, and `rm_caption()`) let us safely remove parts of a **gt** table. This can be advantageous in those instances where one might obtain a **gt** table though other means (like from another pkg) but prefer to excise some parts of it (#790, #1005). (#1073)

* The table stub column can now have its contents formatted with any of the `fmt_*()` functions. We also added the `stub()` helper function to help select the stub column (#747). (#1038)

* The new formatter function `fmt_roman()` lets us easily format numbers to Roman numerals (either as uppercase or lowercase letters). The `vec_fmt_roman()` vector-formatting function was also introduced here. (#1035)

* The `data_color()` function allows us to color the background of cells based on data, and **gt** smartly chooses a text color that provides the most contrast between text and background. We wanted to improve that feature so now `data_color()` has a `contrast_algo` argument that allows us to choose between two color contrast algorithms: `"apca"` (*Accessible Perceptual Contrast Algorithm*; new, and the default now) and `"wcag"` (*Web Content Accessibility Guidelines*). (#1062)

* The accessibility of structurally-complicated **gt** tables (i.e., multi-level headings, irregular headers, row groups, etc.) was addressed by work that follows the W3C WAI (*Web Accessibility Initiative*) guidance. Now, screen readers can better describe **gt** tables with such complex structures (#926). (#988, thanks @jooyoungseo!)

## Minor improvements and bug fixes

* The `docx` output format is now better detected in R Markdown and Quarto (#1040). (#1084, thanks @cderv!)

* Replaced all `match.arg()` calls with **rlang*'s `match_arg()` for better error output (#672). (#1099, thanks @mojister!)

* Project website improvements; we now have a doublet of sites: (1) https://gt.rstudio.com and (2) https://gt.rstudio.com/dev (#1074, thanks @ddsjoberg!)

* The dependency on the **stringr** package has been removed by replacing the remaining **stringr**-based function calls in the package with base-R equivalents. (#1043)

# gt 0.7.0

## New features

* We can now export **gt** tables as Word documents. This is thanks to @thebioengineer (Ellis Hughes!) who not only made this type of output work through `gtsave()` (writes the .docx file) but also through `as_word()` (gives you an OOXML string) (#121, #929). (#962, #986, #1016)

* A whole new family of vector formatting functions (of the form `vec_fmt_*()`) has entered the package! After all, why should columns have all the formatting fun? If you have vectors in need of formatting, we have 14 of these functions, adapted from their corresponding `fmt_*()` functions. You can control the output style of the resulting character vector with the `output` argument. This can either be `"auto"` (the default), `"plain"`, `"html"`, `"latex"`, `"rtf"`, or `"word"`. In **knitr** rendering (i.e., Quarto or R Markdown), the `"auto"` option will choose the correct output value; this is great for incorporating formatted values in inline text. (#899, #995)

* It's now incredibly easy to have colorful and stylish tables thanks to the new `opt_stylize()` function. We provide you with a carefully curated set of background colors, line colors, and line styles. There are six styles and six color variations, giving you 36 combinations of style and color to choose from (#238). (#987)

* The `tab_stub_indent()` function was added to allow for fine control over row label indentation. (#999, #1002)

* The `fmt_duration()` function is now available for formatting values to time durations whether those input values are numbers or of the `difftime` class. It provides a wide array of options so you can get the formatting of time duration values just right (#403). (#916)

* Generating PNG files from **gt** tables using `gtsave()` is now way better due to the move away from **webshot** to its sequel package **webshot2** (#621, #885). (#985)

* A number of accessibility enhancements for HTML table outputs were undertaken to make **gt** one of the most accessible table packages around (#678, #679, #680). (#977, #978, #979, #981; thank you, @jooyoungseo, for all of this)

* Errors and warnings, though we don't often like to receive them, look much better now since we've integrated the **cli** package into **gt**! (#963)

## Minor improvements and bug fixes

* We can now supply data from adjacent columns to user-supplied aggregation functions in `summary_rows()` and `grand_summary_rows()` (#383, #690, #952). (#1018)

* Initial alignments in the table stub are now more intelligently determined in `gt()` by examining the content of the column (the `"rowname_col"`) that will comprise the stub. If values are predominantly number-like then a right alignment will be chosen, otherwise row labels will be left aligned. (#999)

* Enhanced automatic column alignment (set to `"auto"` by default in the `gt()` function) by probing the contents of the columns. This ensures that string-based dates/times/datetimes receive a better appearance before formatting. (#997)

* **gt** tables no longer break table numbering in R Markdown and Quarto documents. (#1003, thanks @cscheid!)

* The `as_latex()` documentation was updated to provide guidance on necessary LaTeX dependencies. (#1022, thanks @coatless!)

* Fixed a bug where footnote marks would not be rendered in the stub column representing row groups (#1001). (#1014)

* Using `gtsave()` in a Quarto or R Markdown code chunk will no longer generate any output, which is good since we don't want any (#974). (#1011)

* Fixed an issue where footnote marks would not be set directly to cell text generated from `fmt_markdown()` (#893, #993). (#1013)

* All **testthat** tests have been migrated to the 3rd Edition of **testthat**. Also, the tests run much faster now. (#959)

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
