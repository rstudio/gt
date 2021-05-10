# gt (development version)

## New features

* References to columns (by way of the `columns` argument in many **gt** functions) now better adheres to **tidyselect** semantics; instead of using `columns = vars(a, b)`, we can now use `columns = c(a, b)` (`columns = c("a", "b")` also works, and this type of expression always has been an option in **gt**). (#718)

* As part of the **tidyselect** changes made in #718, using `columns = TRUE` (to mean that all columns should be considered) has now been replaced with `columns = everything()`.

* Added the `caption` argument to `gt()`. This brings caption support to **gt** tables. (#689)

* RTF table generation is now fit for use following an extensive rewrite of RTF building functions and `as_rtf()`. (#638)

* Tables generated in the RTF output format can now take advantage of `cols_width()` for flexible modifications of column widths. (#696)

* HTML table generation is much faster due to efforts to optimize HTML code generation in the building phase. (#664) 

* New location helper functions have been added to make it possible to style more locations and add footnotes to once inaccessible summary labels; these are `cells_stub_summary()`, `cells_stub_grand_summary()`, `cells_footnotes()`, and `cells_source_notes()`. (#737)

* The `cols_unhide()` function has been added as a complement to the `cols_hide()` function. This is useful when provided the `gt_tbl` object without the source data and code to recreate it *and* there are hidden columns that should be visible. (#710)

* The new formatting function `fmt_bytes()` helps you to transform numerical values to byte sizes with human readable units. (#750)

* A new column merging function, `cols_merge_n_pct()`, works to merge a count column and a percentage column together. This function will automatically hide the `col_pct` column by default (but that can be changed by setting `autohide = FALSE`). (#683)

* Added `id` as an argument to `tab_spanner()` and `tab_row_group()`, which is useful for later access to these locations (especially when spanner or row group labels are complicated). (#665, #699)

## Minor improvements and bug fixes

* The `accounting` option is now available in the `fmt_percent()` and `fmt_number()` formatting functions (previously it was only present in `fmt_currency()`). (#756)

* In RTF documents generated through `as_rtf()` and `gtsave(..., filename = "<file>.rtf")`, there is now a `page_numbering` option for adding page numbers to either the `"footer"` or the `"header"` areas (the default is `"none"`). (#755)

* `tab_spanner_delim()` gained a `split` argument to govern whether delimiter splitting should occur at the `"first"` or `"last"` instance of `delim`. (#699)

* When getting the HTML text for **gt** table with `as_raw_html(..., inline_css = FALSE)`, the `<style>` tag content is no longer omitted. (#718)

* The `others_label` argument of `tab_row_group()` was removed because it was confusing to use; to specify a default label for row groups, the thing to do now is to use `tab_options(row_group.default_label = <label>)`. (#699)

* Column labels subordinate to column spanner labels had their alignment forced to be `"center"` but now there is no forced alignment of column labels under spanners. (#662)

* Fixed two bugs in `tab_row_group()`: (1) incorrect reordering of rows (Issue #717), and (2) spurious warnings with multiple calls (Issue #675). (#699)

* The `tab_spanner_delim()` with `gather = TRUE` did not work reliably (Issue #626) but was fixed with other work done to overhaul the function. (#665)

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
