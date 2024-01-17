# gt 0.10.1

## Improvements to nanoplots

* Box plots can now be generated via `cols_nanoplot()` by using `plot_type = "boxplot"`. These plots are laid out horizontally and will, by default, share the same plot axis across rows. (#1527)

* We can now have single line bar plots generated through `cols_nanoplot()`. If the plot_type is set to `"bar"` and single values are found, then horizontal bars will be generated and will be comparable across rows. (#1514, #1515, #1519)

* The `autohide` argument was added to the `cols_nanoplot()` function so that columns containing input data for nanoplots could be conveniently hidden from final presentation. (#1533)

* Added option (the `data_area_fill_color` arg in `nanoplot_options()`) to change fill color of nanoplot data area for line-type plots (#1521). (#1534)

## Minor improvements and bug fixes

* The performance of rendering bigger tables as HTML has been improved and is now up to three times faster than before. (#1470, thanks @mgirlich)

* Introduced a small performance improvement by no longer calling `utils::packageVersion()` internally (#1524). (#1525, thank you @slodge)

* Code and test refactoring was performed to generally improve performance and code readability. (#1480, thanks @olivroy) 
* The `gtsave()` function now returns the file path invisibly instead of `TRUE`. (#1478, thank you @olivroy)

* Most functions now produce better error messages if not provided with a `gt_tbl` object. (#1504, c/o @olivroy)

* The URL formatting through `fmt_url()` has been improved by preventing link text breaking across lines (#1509). (#1537) 
* We now remove some unnecessary newlines in the HTML text produced by `as_raw_html()`, which caused an issue when integrating **gt** tables into **blastula** email messages (#1506). (#1520)

* The `tab_spanner_delim()` now lets you use `delim` strings longer than a single character (#1469). (#1513)

* Fix for footnotes in LaTeX tables where no footnote marks are to be added; this previously showed `"NA"` as the mark in the footer area but this is no longer displayed (#1416). (#1512, thanks @kbrevoort)

* LaTeX tables can now have their overall width specified (#119, #329). (#1495, thank you @kbrevoort)

* Fix issue where a `cols_width()` specification involving percentage values fails for LaTeX tables (#1465). (#1495, thanks again @kbrevoort!)

* Several documentation fixes were made to address inconsistencies and improve clarity. (#1491)

# gt 0.10.0

## Nanoplots

* We can now add in little plots called *nanoplots* to a **gt** table (#299, #515). (#1431, #1439, #1445, #1453, #1458, #1459, #1461, #1462)

* The function `cols_nanoplot()` adds a new column that contains the plots. The data can be obtained from one or more columns in the table. A helper function called `nanoplot_options()` allows for altering the composition and styling of the nanoplots in the new column.

* There are two basic types of nanoplots available: `"line"` and `"bar"`. A line plot shows individual data points and has smooth connecting lines between them to allow for easier scanning of values. You can opt for straight-line connections between data points, or, no connections at all (it's up to you). The data you feed into a line plot can consist of a single vector of values (resulting in equally-spaced *y* values), or, you can supply two vectors representative of *x* and *y*.

* A bar plot is built a little bit differently. The focus is on evenly-spaced bars (requiring a single vector of values) that project from a zero line, clearly showing the difference between positive and negative values. 

* By default, any type of nanoplot will have basic interactivity. One can hover over the data points and vertical guides will display values ascribed to each. A guide on the left-hand side of the plot area will display the minimal and maximal *y* values on hover.

## Other great new features

* Brand new rows can be added to a **gt** table with the new `rows_add()` function. The user can supply the new row data through name value pairs. You have control over where they are placed by way of the `.before` and `.after` arguments (new rows are added to the bottom of the table by default). You can also add empty (i.e., all `NA`) rows with the `.n_empty` option (#698). (#1323)

* To complement `rows_add()`, the `cols_add()` function was added. New columns can indeed be added to a **gt** table with this function, which has an interface close to that of `dplyr::mutate()`. (#1367)

* You can now use an empty table as the starting point for a **gt** table. This can be used in conjunction with `cols_add()` and `rows_add()` to build a table piece-by-piece in specific workflows/settings. What constitutes empty tables can be any of: `0 x 0` tables, `0 x n` tables (no rows, some columns), or `n x 0` tables (some rows, no columns; treated the same as `0 x 0` tables). (#1376)

* There is now a way to better express measurement units and we do this in **gt** with something called units notation. With an intuitive and easy-to-learn syntax, **gt** will ensure that any measurement units are formatted correctly no matter what the output type is. We can format units in the table body with `fmt_units()`, we can attach units to column labels with `cols_units()`, and we can integrate units notation in the already-available `cols_label()` and `tab_spanner()` functions (#417, #533). (#1357, #1426, #1446)

* A very useful new helper function, `from_column()`, has been added so you can fetch values (for compatible arguments) from a column in the input table. For example, if you are using `fmt_scientific()` and the number of significant figures should vary across the values to be formatted, a column containing those values for the `n_sigfig` argument can be referenced by `from_column()`. (#1392, #1393, #1395, #1396, #1399, #1403)

* With the new `fmt_icon()` function we are able to add icons from the Font Awesome icon library. It works in a way that's similar to `fmt_flag()`, in that identifiers in the formatted cells are transformed in-place to SVG-based icons. (#1413)

* The `info_icons()` and `info_flags()` functions have been added to help people know about the valid codes for flags and for icons (when using `fmt_icon()` and `fmt_flag()`). (#1421)

* We added the `extract_body()` function, which lets you pull out a data frame associated with the body cells. Importantly, this extraction can happen at different stages of the table build (e.g., `"init"`, `"text_transformed"`, etc.), allowing a user to have access to a table of formatted body cells for different applications (such as verification of formatting, debugging new formatting functions, etc.) (#1441). (#1449)

* Interactive HTML tables (usually generated through use of `opt_interactive()`) can now use localized labels/controls. So when using any of the 574 supported locales in **gt**, an interactive table will be fully translated to the language of the locale (#1308). (#1389)

* The `illness` and `constants` datasets were added. Both datasets have a `units` column and this is useful for making examples with the `fmt_units()` function. (#1357)

## Improvements to the Word output format

* Processing to Word output now escapes HTML in more places (#1378). (#1303)

* The Word output format now uses the `side` argument present in `summary_rows()` and `grand_summary_rows()` to place the new summary rows either the top or bottom of the row group (with `summary_rows()`) or table as a whole (with `grand_summary_rows()`). (#1325)

* Tables rendered as Word output can now handle the specific case where a table with summary rows doesn't have row names. (#1325)

* Summary rows in Word output tables can now be placed at the top or bottom of a group (or at the top or bottom of the table). (#1402)

* Word output tables can now contain images. This entails compatibility with the `fmt_image()` function, and, images (local and remote) can be inserted through Markdown (#1272). (#1273)

## Documentation enhancements

* The **gt** website has been updated with a slightly different look; section names have been updated for consistency (#1419). (#1287, #1340, #1341, #1444)

* We've improved the formatting of arguments in the documentation so that they all have short titles and descriptions regarding expected inputs and default values. This looks great both in the internal R help pages and in the **pkgdown**-generated website (#1290). (#1338)

* Several small documentation updates were made, with an emphasis on improving examples (#1304, #1349, #1369). (#1293, #1316, #1324, #1329, #1330, #1331, #1334, #1381, #1383, #1395, #1404, #1442, #1454)

## Minor improvements and bug fixes

* The `tab_spanner_delim()` function was given a `limit` argument so that splitting from a particular side can stop early and precisely. (#1328)

* The `width` argument was added to `fmt_image()`. With this change you can variously set the width, the height, or both.

* Significant figures support has been added to the `fmt_scientific()` and `vec_fmt_scientific()` functions; there is a new `n_sigfig` argument in both. (#1411)

* The `cols_merge_range()` function now has a `locale` argument. Range patterns across locales are different (can involve the use of a single hyphen, en dash, em dash, tilde, etc.) and so it does make sense to follow the convention of a locale if provided (#158). (#1423)

* The `fmt_url()` function now has a few more options for adding anchor tag attributes (`"target"`, `"rel"`, `"referrerpolicy"`, and `"hreflang"`). Thanks @elipousson for the work on this! (#1428). (#1452)

* We now have rudimentary support for defining column widths for LaTeX output tables (with `cols_width()`). This accepts length values in 'px' which and automatic conversion to 'pt' values is performed to maximize compatibility with different LaTeX flavors (#634, #851, #1417). (#1371, #1450)

* It's now possible to use background fill colors and perform text coloring and emboldened/italicized text within the body cells of LaTeX tables. This is commonly performed through the use of `tab_style()` and `data_color()` (#84, #869). (#1352)

* The `gtsave()` function now works with `gt_group` objects (usually generated through `gt_split()` or `gt_group()`) (#1354). (#1365)

* All `gt_group` objects can now be printed using R Markdown or Quarto (#1286). (#1332)  

* When using `fmt_currency()` with a locale value set, **gt** will now use that to automatically select the locale's default currency. While some countries can have multiple currencies, we opt for the most-widely used currency (users could alternatively specify the currency code and `info_currencies()` contains all supported currencies used in the package) (#1346). (#1347)

* The `columns` argument in `cols_hide()` and `cols_unhide()` can now accept `NULL` (i.e., no columns resolved). These functions will no longer error in such a case (#1342). (#1343)

* The `countrypops` dataset was updated with recent (as of August 2023) World Bank data that revises population estimates and brings the final year up to 2022. All examples, tests, and articles using the dataset were also updated. (#1410)

* A few refinements were made to some of the system font stacks defined in `system_fonts()`. (#1447)

* The Databricks notebook environment is now detected by **gt**, so tables will now be automatically displayed without having to call extra printing functions. (#1427)

* Display issues with scientific and engineering notation formatting (lack of dropping trailing zeros, as promised with the `drop_trailing_zeros` argument) were fixed. Part of the fix involves adding the `drop_trailing_dec_mark` argument to the four functions `fmt_scientific()`, `fmt_engineering()`, `vec_fmt_scientific()` and `vec_fmt_engineering()`. (#1380)

* Fixed an incorrect country code reference for the Netherlands that would cause an incorrect flag to appear when using `fmt_flag()`. (#1319)

* Many new flags were added to `fmt_flag()` (#1333, #1335). (#1336)

* In some cases, there was incorrect rounding of duration values when using `fmt_duration()`. This is now fixed, thanks to @rcannood (#1374). (#1375)

* Fixed an issue with `cols_label_with()` where column names wouldn't be relabeled if the resolved columns were only a subset of the total columns available. (#1326)

* Fixed a LaTeX bug where some characters following a `\midrule` would corrupt the table (#145, #391, #1107, #1182). (#1390)

* Provided a rendering fallback for HTML tables rendered in Quarto where the combination of `fmt_markdown()` and `tab_options(quarto.disable_processing = TRUE)` would incorrectly result in empty cells. (#1455)

* A issue associated with a lack of HTML formatting within interactive tables has been fixed (#1299, #1370, #1384, #1443). (#1388)

* Many user-facing error messages have been enhanced using the latest features from the **cli** package. (#1337, thanks @olivroy!)

* Unit tests can now be successfully run on Linux flavors that don't have the `locale` utility (#1214). (#1350, thanks @bastistician!)

* If ever the 'undetermined' (`"und"`) locale is used, it is automatically mapped to the `"en"` locale. (#1394)

* Many unit tests were added for much increased test coverage and many more were modified to increase the speed of running the test suite. (#1291, #1294, #1298, #1350, #1412)

* Added utility functions to extract all examples for regularly building a Quarto website (to do integration testing). (#1344)

# gt 0.9.0

## New features

* The `summary_rows()` and `grand_summary_rows()` functions have been rewritten extensively to allow more flexibility in providing aggregation information to `fns`. The documentation for both functions will walk you through all the new ways you can express your aggregations. The formatting of cells in new summary rows is now easier thanks to the new `fmt` argument. We can provide a single formatting expression or a number of them in a list. The dedicated documentation section for formatting can walk you through all of this. Furthermore, we now have the option to place summary rows at top or bottom of a group (in `summary_rows()`) or table (in `grand_summary_rows()`) with the new `side` argument (#177, #270, #292, #545, #581, #784, #785, #840). (#1159, #1171)

* The `data_color()` function has been completely overhauled to make it easier to use and also more powerful. It gains a `rows` argument to better constrain where the colorization should take place. Instead of having to use functions from **scales** to define the coloring scheme, you can now use the `method` argument to handle most cases (otherwise, the new `fn` argument allows for a color-mapping function to be used). The new `palette` argument allows for flexible input of color palettes. One or more adjacent columns can receive the coloring treatment by way of the new `target_columns` argument. Coloring can now also be applied in a row-wise fashion by using `direction = "row"`. Despite all of these changes, older code should still work with the revamped function (#116, #633, #637, #1103, #1119). (#1147)

* We now have a much improved `cols_merge()` function! It has gained a `rows` argument for limiting which body cells get merged together. The `pattern` argument now has a more advanced syntax. It now has the following delimiters and rules: (1) `{ }` for arranging single column values in a row-wise fashion, and (2) the `<< >>` to surround spans of text that will be removed if any of the contained `{ }` yields a missing value. The new `<< >>` delimiters will help in cases where `NA` values are present and should be omitted during the merging process (#1167). (#1144, #1168)

* The `cols_label()` function has been improved by allowing formula expressions to be given to `...`. With two-sided formulas (e.g., `<LHS> ~ <RHS>`), the left-hand side corresponds to selections of columns and the right-hand side evaluates to single-length values for the label to apply. Named arguments in the format of `<column name> = <label>` are still also valid as input for simple mappings of column name to label text. Also, there's a `.fn` argument, which takes a function to be applied to all provided label values (#1146). (#1255, #1256, #1265)

* Interactive HTML tables can now be generated in **gt**. Options for enabling interactive table rendering are available in `tab_options()` and also in `opt_interactive()`. The collection of `use_*` arguments in `opt_interactive()` allow for control of pagination, global search, filtering, sorting, and more. The documentation within `opt_interactive()` demonstrates how to generate HTML tables with interactive elements (#207). (#902, #1252, #1261, #1278, #1280)

* A new function, `cols_label_with()`, has been added for relabeling columns via functions. It allows for such functions to be applied to arbitrary sets of columns, taking advantage of **tidyselect**. It's like `dplyr::rename_with()` for your **gt** table, but it doesn't need unique names for labeling (#701). (#1158, thank you @christopherkenny!)

* We added `fmt_spelled_num()` and `vec_fmt_spelled_num()` so that numeric values could be transformed to spelled out numbers. Any values from `0` to `100` can be spelled out according to a given `locale` value. For example, the value `23` will be rendered as `"twenty-three"` if the locale is an English-language one (or, not provided at all); should a Swedish locale be provided (e.g., `"sv"`), the output will instead be `"tjugotre"`. (#1198)

* The `fmt_index()` and `vec_fmt_index()` functions were added in so that numeric values could undergo transformation to index values, which are usually based on letters (depending on the `locale` chosen). For example, the value `5` will be rendered as `"E"` if the locale is an English-language one. The characters chosen for indexing here are based on character sets intended for ordering (often leaving out characters with diacritical marks). (#1189)

* Should body cells contain URLs, the new `fmt_url()` function can be used to make them navigable links. There are several options provided that control how the links should be styled (conventional underline style or button-like text) (#609). (#1205, #1220, #1221)

* To more easily insert graphics into body cells, we have added the `fmt_image()` function. This allows for one or more images to be placed in the targeted cells. The cells need to contain some reference to an image file, either: (1) complete http/https or local paths to the files; (2) the file names, where a common path can be provided via `path`; or (3) a fragment of the file name, where the `file_pattern` argument helps to compose the entire file name and the `path` argument provides the path information. (#1240)

* The new `fmt_flag()` function helps with inserting a flag icon (or multiple) in body cells. The input cells need to contain 2-letter ISO 3166-1 country codes (e.g., Mauritius with the `"MU"` country code). This function will parse the targeted body cells insert the appropriate flag icon. Multiple flags can be included per body cell by separating country codes with commas. (#1241, #1244, #1251)

* With `fmt_bins()`, you can format bin or interval syntax (returned from `cut()`) to a form that presents better in a display table. It's possible to format the values of the intervals with the `fmt` argument, and, the separator can be modified with the `sep` argument. (#1250)

* The new `fmt_auto()` function has been added to automatically apply formatting of various types in a way that best suits the data table provided. For example, the function will attempt to format numbers such that they are condensed to an optimal width, and, currency values can be detected (by currency codes embedded in the column name) and formatted in the correct way (#248). (#1176)

* Three `text_*()` functions were added to better enable transformations of formatted text in various table locations: `text_replace()`, `text_case_when()`, and `text_case_match()`. (#1238)

* We can use any of 15 system font stacks available in **gt**! These are families of themed system fonts that are widely available in different computer systems. Examples include 'System UI' (the default font stack), 'Humanist', and 'Neo-Grotesque'. The new helper function `system_fonts()` can be used to access the various font stack and is useful when specifying `font` values in the `cell_text()` function. The `opt_table_font()` function has been upgraded to include a `stack` argument (which accepts keywords for the different font stacks). (#1275)

* We now have a new family of functions that let you deal with a multitude of **gt** tables, all at once. You can create a `gt_group` object with multiple tables via the `gt_group()` function, or, split a single table into multiple with `gt_split()`. There are some advantages to having a group of tables bundled together like this. You could apply options that pertain to all tables yet still access the individual tables to give them their own specialized modifications. They all print together at once too! For HTML, each table will be separated by a line break whereas in paginated formats (e.g., RTF, Word, etc.) the tables are separated by page breaks. (#1216, #1219, #1226, #1248, #1249, #1262, #1264)

* There is now a choice of which Markdown engine to use for Markdown rendering (in `fmt_markdown()` and `vec_fmt_markdown()`) and a default default choice. The **markdown** package can be chosen instead of **commonmark** to perform conversions of Markdown to HTML and LaTeX (and it's now the default). One of many benefits to this change is the parsing of subscripts (using `~x~`) and superscripts (using `^x^`) (#725). (#1254)

* Added the footnote formatting options `footnotes.spec_ref` and `footnotes.spec_ftr` in `tab_options()` and exposed these options further in a new function called `opt_footnote_spec()`. Specifications for footnote formatting can be produced for the footnote marks that alight to the targeted text within cells from various locations in the table, or, for the footnote marks that appear in the table footer. (#1268, #1271)

* The `towny` dataset was added. It provides a fun, population-based dataset with place names, URLs, coordinate information, and population figures with repetition (values for different census years). (#1184, #1199)

* The `metro` dataset is new. It has 308 rows, where each corresponds to a different Paris Metro station (#1231).

* The `rx_adsl` and `rx_addv` datasets have been added. These clinical trial toy datasets are both featured in a new vignette that explains how **gt** can be used for table generation in the Pharma space (#1145, #1200; thank you @alex-lauer!).

## Documentation enhancements

* Addition of a new vignette (*gt Clinical Tables*) that uses the `rx_adsl` and `rx_addv` datasets. (#1145, #1217, #1224; all contributed by @alex-lauer)

* All examples in the documentation were modernized by using the `|>` instead of the `%>%`. A lot of explanatory text was improved through rewriting. The ordering of documentation sections was improved. And functions that had very little documentation (like `text_transform()`) were greatly improved (#1087). (#1166, #1185, #1192)

* Several small documentation and housekeeping updates. (#1133, #1134, #1135, #1136, #1190, #1206, #1218, #1242, #1246, #1258, #1260, #1266, #1270, #1276, #1281)

* Added a citation file for the package. (#1128, #1277)

## Minor improvements and bug fixes

* The `fmt_scientific()` and `fmt_engineering()` (and their `vec_fmt_*()` analogues) now have a `exp_style` argument for defining the exponent notation. By default this is `"x10n"` but other options include using a single letter (e.g., "e", "E", etc.), a letter followed by a "1" to signal a minimum digit width of one, or "low-ten" for using a stylized "10" marker. These functions now also have the `force_sign_m` and `force_sign_n` arguments for forcing `+` signs in the mantissa or the exponent. (#1178)

* We now have right-to-left (RTL) text handling and **gt** will automatically set the appropriate alignment for RTL text in HTML output. This is done through detection of RTL script characters. (#697). (#1202)

* For any columns that are labeled (i.e., have a `label` attribute), **gt** will automatically use those labels as column labels (#656). (#1230)

* Tables in the Word output format now have much better Markdown support (#1057, #1067, #1204). (#1142, #1263, #1274)

* Added the `"double"` option for a border style in `cell_borders()` (#1132). (#1137)

* The `countrypops` dataset was updated with recent (as of January 2023) World Bank data that revises population estimates and brings the final year up to 2021. All examples, tests, and articles using the dataset were also updated. (#1191)

* Fixed a conflict between `tab_spanner_delim()` and `cols_label()` (#1130). (#1173)

* Added a fix for a `summary_rows()` problem where summary rows that were generated with only a single group would not display the summary rows at all. (#1188)

* HTML output tables no longer have contain two `<thead>` elements they display a header and column labels (#1235). (#1237)

* Incorporated a CSS fix for superscripted footnote marks. Prior to the change, footnote marks were never styled within **gt** tables rendered in Quarto documents. (#1210)

* We now remove **knitr** flags when saving an RTF file through the `gtsave()` function (#674). (#1153)

* Fixed LaTeX rendering of tables using the `xelatex` engine by removing the unneeded `"amsmath"` LaTeX package from the default set of LaTeX dependencies. This set is now modifiable through the `gt.latex_packages` option (#751). (#1279)

* Fixed some border-related issues for **gt** tables published in R Markdown and Quarto documents (#1120). (#1234)

* Added the `quarto.use_bootstrap` and `quarto.disable_processing` options in `tab_options()` to control whether Quarto will add Bootstrap classes to a **gt** table or ignore a **gt** table. (#1222, #1227)

* Fixed the unintended appearance of a bottom border in the column spanner row for some CSS environments. (#1209)

* Fixed the SCSS class `.gt_footnote_marks` to ensure that the footnote mark is at a consistent height from the baseline in different CSS environments. (#1187)

* Fixed an error in the SCSS class `.gt_footnote` where the wrong types of padding were specified. (#1236)

* Added frequency levels to `cli_abort()` warnings throughout package (#1160). (#1169)

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

* Replaced all `match.arg()` calls with **rlang**'s `match_arg()` for better error output (#672). (#1099, thanks @mojister!)

* Project website improvements; we now have a doublet of sites: (1) https://gt.rstudio.com and (2) https://gt.rstudio.com/dev (#1074, thanks @ddsjoberg!)

* The dependency on the **stringr** package has been removed by replacing the remaining **stringr**-based function calls in the package with base-R equivalents. (#1043)

# gt 0.7.0

## New features

* We can now export **gt** tables as Word documents. This is thanks to @thebioengineer (Ellis Hughes!) who not only made this type of output work through `gtsave()` (writes the .docx file) but also through `as_word()` (gives you an OOXML string) (#121, #929). (#962, #986, #1016)

* A whole new family of vector formatting functions (of the form `vec_fmt_*()`) has entered the package! After all, why should columns have all the formatting fun? If you have vectors in need of formatting, we have 14 of these functions, adapted from their corresponding `fmt_*()` functions. You can control the output style of the resulting character vector with the `output` argument. This can either be `"auto"` (the default), `"plain"`, `"html"`, `"latex"`, `"rtf"`, or `"word"`. In **knitr** rendering (i.e., Quarto or R Markdown), the `"auto"` option will choose the correct output value; this is great for incorporating formatted values in inline text. (#899, #995)

* It's now incredibly easy to have colorful and stylish tables thanks to the new `opt_stylize()` function. We provide you with a carefully curated set of background colors, line colors, and line styles. There are six styles and six color variations, giving you 36 combinations of style and color to choose from (#238). (#987)

* The `tab_stub_indent()` function was added to allow for fine control over row label indentation. (#999, #1002)

* The `fmt_duration()` function is now available for formatting values to time duration values whether those input values are numbers or of the `difftime` class. It provides a wide array of options so you can get the formatting of time duration values just right (#403). (#916)

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

* Correction made to the representation of the `PEN` (Peruvian Nuevo Sol) currency. (#663)

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
