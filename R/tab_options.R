#------------------------------------------------------------------------------#
#
#                /$$
#               | $$
#     /$$$$$$  /$$$$$$
#    /$$__  $$|_  $$_/
#   | $$  \ $$  | $$
#   | $$  | $$  | $$ /$$
#   |  $$$$$$$  |  $$$$/
#    \____  $$   \___/
#    /$$  \ $$
#   |  $$$$$$/
#    \______/
#
#  This file is part of the 'rstudio/gt' project.
#
#  Copyright (c) 2018-2026 gt authors
#
#  For full copyright and license information, please look at
#  https://gt.rstudio.com/LICENSE.html
#
#------------------------------------------------------------------------------#


# tab_options() ----------------------------------------------------------------
#' Modify the table output options
#'
#' @description
#'
#' Modify the options available in a table. These options are named by the
#' components, the subcomponents, and the element that can adjusted.
#'
#' @inheritParams fmt_number
#'
#' @param table.width *Table width*
#'
#'   The table width can be specified as a single-length character with units of
#'   pixels or as a percentage. If provided as a single-length numeric vector,
#'   it is assumed that the value is given in units of pixels. The [px()] and
#'   [pct()] helper functions can also be used to pass in numeric values and
#'   obtain values as pixel or percent units.
#'
#' @param table.layout *The table-layout property*
#'
#'   This is the value for the `table-layout` CSS style in the HTML output
#'   context. By default, this is `"fixed"` but another valid option is
#'   `"auto"`.
#'
#' @param table.align *Horizontal alignment of table*
#'
#'   The `table.align` option lets us set the horizontal alignment of the table
#'   in its container. By default, this is `"center"`. Other options are
#'   `"left"` and `"right"`. This will automatically set `table.margin.left` and
#'   `table.margin.right` to the appropriate values.
#'
#' @param table.margin.left,table.margin.right *Left and right table margins*
#'
#'   The size of the margins on the left and right of the table within the
#'   container can be set with `table.margin.left` and `table.margin.right`. Can
#'   be specified as a single-length character with units of pixels or as a
#'   percentage. If provided as a single-length numeric vector, it is assumed
#'   that the value is given in units of pixels. The [px()] and [pct()] helper
#'   functions can also be used to pass in numeric values and obtain values as
#'   pixel or percent units. Using `table.margin.left` or `table.margin.right`
#'   will overwrite any values set by `table.align`.
#'
#' @param table.background.color,heading.background.color,column_labels.background.color,row_group.background.color,stub.background.color,summary_row.background.color,grand_summary_row.background.color,footnotes.background.color,source_notes.background.color
#'   *Background colors*
#'
#'   These options govern background colors for the parent element `table` and
#'   the following child elements: `heading`, `column_labels`, `row_group`,
#'   `stub`, `summary_row`, `grand_summary_row`, `footnotes`, and
#'   `source_notes`. A color name or a hexadecimal color code should be
#'   provided.
#'
#' @param table.additional_css *Additional CSS*
#'
#'   The `table.additional_css` option can be used to supply an additional block
#'   of CSS rules to be applied after the automatically generated table CSS.
#'
#' @param table.font.names *Default table fonts*
#'
#'   The names of the fonts used for the table can be supplied through
#'   `table.font.names`. This is a vector of several font names. If the first
#'   font isn't available, then the next font is tried (and so on).
#'
#' @param table.font.style *Default table font style*
#'
#'   This is the default font style for the table. Can be one of either
#'   `"normal"`, `"italic"`, or `"oblique"`.
#'
#' @param table.font.color,table.font.color.light
#'   *Default dark and light text for the table*
#'
#'   These options define text colors used throughout the table. There are two
#'   variants: `table.font.color` is for text overlaid on lighter background
#'   colors, and `table.font.color.light` is automatically used when text needs
#'   to be overlaid on darker background colors. A color name or a hexadecimal
#'   color code should be provided.
#'
#' @param table.font.size,heading.title.font.size,heading.subtitle.font.size,column_labels.font.size,row_group.font.size,stub.font.size,footnotes.font.size,source_notes.font.size
#'   *Table font sizes*
#'
#'   The font sizes for the parent text element `table` and the following child
#'   elements: `heading.title`, `heading.subtitle`, `column_labels`,
#'   `row_group`, `footnotes`, and `source_notes`. Can be specified as a
#'   single-length character vector with units of pixels (e.g., `12px`) or as a
#'   percentage (e.g., `80%`). If provided as a single-length numeric vector,
#'   it is assumed that the value is given in units of pixels. The [px()] and
#'   [pct()] helper functions can also be used to pass in numeric values and
#'   obtain values as pixel or percentage units.
#'
#' @param heading.align *Horizontal alignment in the table header*
#'
#'   Controls the horizontal alignment of the heading title and subtitle. We can
#'   either use `"center"`, `"left"`, or `"right"`.
#'
#' @param table.font.weight,heading.title.font.weight,heading.subtitle.font.weight,column_labels.font.weight,row_group.font.weight,stub.font.weight
#'   *Table font weights*
#'
#'   The font weights of the table, `heading.title`, `heading.subtitle`,
#'   `column_labels`, `row_group`, and `stub` text elements. Can be a text-based
#'   keyword such as `"normal"`, `"bold"`, `"lighter"`, `"bolder"`, or, a
#'   numeric value between `1` and `1000`, inclusive. Note that only variable
#'   fonts may support the numeric mapping of weight.
#'
#' @param column_labels.text_transform,row_group.text_transform,stub.text_transform,summary_row.text_transform,grand_summary_row.text_transform
#'   *Text transforms throughout the table*
#'
#'   Options to apply text transformations to the `column_labels`, `row_group`,
#'   `stub`, `summary_row`, and `grand_summary_row` text elements. Either of the
#'   `"uppercase"`, `"lowercase"`, or `"capitalize"` keywords can be used.
#'
#' @param heading.padding,column_labels.padding,data_row.padding,row_group.padding,summary_row.padding,grand_summary_row.padding,footnotes.padding,source_notes.padding
#'   *Vertical padding throughout the table*
#'
#'   The amount of vertical padding to incorporate in the `heading` (title and
#'   subtitle), the `column_labels` (this includes the column spanners), the row
#'   group labels (`row_group.padding`), in the body/stub rows
#'   (`data_row.padding`), in summary rows (`summary_row.padding` or
#'   `grand_summary_row.padding`), or in the footnotes and source notes
#'   (`footnotes.padding` and `source_notes.padding`).
#'
#' @param heading.padding.horizontal,column_labels.padding.horizontal,data_row.padding.horizontal,row_group.padding.horizontal,summary_row.padding.horizontal,grand_summary_row.padding.horizontal,footnotes.padding.horizontal,source_notes.padding.horizontal
#'   *Horizontal padding throughout the table*
#'
#'   The amount of horizontal padding to incorporate in the `heading` (title and
#'   subtitle), the `column_labels` (this includes the column spanners), the row
#'   group labels (`row_group.padding.horizontal`), in the body/stub rows
#'   (`data_row.padding`), in summary rows (`summary_row.padding.horizontal` or
#'   `grand_summary_row.padding.horizontal`), or in the footnotes and source
#'   notes (`footnotes.padding.horizontal` and
#'   `source_notes.padding.horizontal`).
#'
#' @param table.border.top.style,table.border.top.width,table.border.top.color,table.border.right.style,table.border.right.width,table.border.right.color,table.border.bottom.style,table.border.bottom.width,table.border.bottom.color,table.border.left.style,table.border.left.width,table.border.left.color
#'   *Top border properties*
#'
#'   The style, width, and color properties of the table's absolute top and
#'   absolute bottom borders.
#'
#' @param heading.border.bottom.style,heading.border.bottom.width,heading.border.bottom.color
#'   *Properties of the header's bottom border*
#'
#'   The style, width, and color properties of the header's bottom border. This
#'   border shares space with that of the `column_labels` location. If the
#'   `width` of this border is larger, then it will be the visible border.
#'
#' @param heading.border.lr.style,heading.border.lr.width,heading.border.lr.color
#'   *Properties of the header's left and right borders*
#'
#'   The style, width, and color properties for the left and right borders of
#'   the `heading` location.
#'
#' @param column_labels.vlines.style,column_labels.vlines.width,column_labels.vlines.color
#'   *Properties of all vertical lines by the column labels*
#'
#'   The style, width, and color properties for all vertical lines ('vlines')
#'   of the `column_labels`.
#'
#' @param column_labels.border.top.style,column_labels.border.top.width,column_labels.border.top.color
#'   *Properties of the border above the column labels*
#'
#'   The style, width, and color properties for the top border of the
#'   `column_labels` location. This border shares space with that of the
#'   `heading` location. If the `width` of this border is larger, then it will
#'   be the visible border.
#'
#' @param column_labels.border.bottom.style,column_labels.border.bottom.width,column_labels.border.bottom.color
#'   *Properties of the border below the column labels*
#'
#'   The style, width, and color properties for the bottom border of the
#'   `column_labels` location.
#'
#' @param column_labels.border.lr.style,column_labels.border.lr.width,column_labels.border.lr.color
#'   *Properties of the left and right borders next to the column labels*
#'
#'   The style, width, and color properties for the left and right borders of
#'   the `column_labels` location.
#'
#' @param column_labels.hidden *Hiding all column labels*
#'
#'   An option to hide the column labels. If providing `TRUE` then the entire
#'   `column_labels` location won't be seen and the table header (if present)
#'   will collapse downward.
#'
#' @param column_labels.units_pattern *Pattern to combine column labels and units*
#'
#'   The default pattern for combining column labels with any defined units for
#'   column labels. The pattern is initialized as `"{1}, {2}"`, where `"{1}"`
#'   refers to the column label text and `"{2}"` is the text related to the
#'   associated units. When using [cols_units()], there is the opportunity to
#'   provide a specific pattern that overrides the units pattern unit. Further
#'   to this, if specifying units directly in [cols_label()] (through the units
#'   syntax surrounded by `"{{"`/`"}}"`) there is no need for a units pattern
#'   and any value here will be disregarded.
#'
#' @param row_group.border.top.style,row_group.border.top.width,row_group.border.top.color,row_group.border.bottom.style,row_group.border.bottom.width,row_group.border.bottom.color,row_group.border.left.style,row_group.border.left.width,row_group.border.left.color,row_group.border.right.style,row_group.border.right.width,row_group.border.right.color
#'   *Border properties associated with the `row_group` location*
#'
#'   The style, width, and color properties for all top, bottom, left, and right
#'   borders of the `row_group` location.
#'
#' @param table_body.hlines.style,table_body.hlines.width,table_body.hlines.color,table_body.vlines.style,table_body.vlines.width,table_body.vlines.color
#'   *Properties of all horizontal and vertical lines in the table body*
#'
#'   The style, width, and color properties for all horizontal lines ('hlines')
#'   and vertical lines ('vlines') in the `table_body`.
#'
#' @param table_body.border.top.style,table_body.border.top.width,table_body.border.top.color,table_body.border.bottom.style,table_body.border.bottom.width,table_body.border.bottom.color
#'   *Properties of top and bottom borders in the table body*
#'
#'   The style, width, and color properties for all top and bottom borders of
#'   the `table_body` location.
#'
#' @param stub.border.style,stub.border.width,stub.border.color
#'   *Properties of the vertical border of the table stub*
#'
#'   The style, width, and color properties for the vertical border of the table
#'   stub.
#'
#' @param stub_row_group.font.size,stub_row_group.font.weight,stub_row_group.text_transform,stub_row_group.border.style,stub_row_group.border.width,stub_row_group.border.color
#'   *Properties of the row group column in the table stub*
#'
#'   Options for the row group column in the table stub (made possible when
#'   using `row_group.as_column = TRUE`). The defaults for these options mirror
#'   that of the `stub.*` variants (except for `stub_row_group.border.width`,
#'   which is `"1px"` instead of `"2px"`).
#'
#' @param row_group.default_label *The default row group label*
#'
#'   An option to set a default row group label for any rows not formally placed
#'   in a row group named by `group` in any call of [tab_row_group()]. If this
#'   is set as `NA_character_` and there are rows that haven't been placed into a
#'   row group (where one or more row groups already exist), those rows will be
#'   automatically placed into a row group without a label.
#'
#' @param row_group.as_column *Structure row groups with a column*
#'
#'   How should row groups be structured? By default, they are separate rows
#'   that lie above the each of the groups. Setting this to `TRUE` will
#'   structure row group labels as a separate column in the table stub.
#'
#' @param stub.indent_length *Width of each indentation*
#'
#'   The width of each indentation level for row labels in the stub. The
#'   indentation can be set by using [tab_stub_indent()]. By default this is
#'   `"5px"`.
#'
#' @param summary_row.border.style,summary_row.border.width,summary_row.border.color
#'   *Properties of horizontal borders belonging to summary rows*
#'
#'   The style, width, and color properties for all horizontal borders of the
#'   `summary_row` location.
#'
#' @param grand_summary_row.border.style,grand_summary_row.border.width,grand_summary_row.border.color
#'   *Properties of horizontal borders belonging to grand summary rows*
#'
#'   The style, width, and color properties for the top borders of the
#'   `grand_summary_row` location.
#'
#' @param footnotes.border.bottom.style,footnotes.border.bottom.width,footnotes.border.bottom.color
#'   *Properties of the bottom border belonging to the footnotes*
#'
#'   The style, width, and color properties for the bottom border of the
#'   `footnotes` location.
#'
#' @param footnotes.border.lr.style,footnotes.border.lr.width,footnotes.border.lr.color
#'   *Properties of left and right borders belonging to the footnotes*
#'
#'   The style, width, and color properties for the left and right borders of
#'   the `footnotes` location.
#'
#' @param footnotes.marks *Sequence of footnote marks*
#'
#'   The set of sequential marks used to reference and identify each of the
#'   footnotes (same input as [opt_footnote_marks()]). We can
#'   supply a vector that represents the series of footnote marks. This vector
#'   is recycled when its usage goes beyond the length of the set. At each
#'   cycle, the marks are simply combined (e.g., `*` -> `**` -> `***`). The
#'   option exists for providing keywords for certain types of footnote marks.
#'   The keyword `"numbers"` (the default, indicating that we want to use
#'   numeric marks). We can use lowercase `"letters"` or uppercase `"LETTERS"`.
#'   There is the option for using a traditional symbol set where `"standard"`
#'   provides four symbols, and, `"extended"` adds two more symbols, making six.
#'
#' @param footnotes.spec_ref,footnotes.spec_ftr
#'   *Specifications for formatting of footnote marks*
#'
#'   Optional specifications for formatting of footnote references
#'   (`footnotes.spec_ref`) and their associated marks the footer section
#'   (`footnotes.spec_ftr`) (same input as [opt_footnote_spec()]).
#'   This is a string containing specification control characters. The default
#'   is the spec string `"^i"`, which is superscript text set in italics. Other
#'   control characters that can be used are: (1) `"b"` for bold text, and (2)
#'   `"("` / `")"` for the enclosure of footnote marks in parentheses.
#'
#' @param footnotes.multiline,source_notes.multiline
#'   *Typesetting of multiple footnotes and source notes*
#'
#'   An option to either put footnotes and source notes in separate lines (the
#'   default, or `TRUE`) or render them as a continuous line of text with
#'   `footnotes.sep` providing the separator (by default `" "`) between notes.
#'
#' @param footnotes.sep,source_notes.sep
#'   *Separator characters between adjacent footnotes and source notes*
#'
#'   The separating characters between adjacent footnotes and source notes in
#'   their respective footer sections when rendered as a continuous line of text
#'   (when `footnotes.multiline == FALSE`). The default value is a single space
#'   character (`" "`).
#'
#' @param footnotes.order
#'   *Order footnotes are displayed in output*
#'
#'   The order in which footnotes are displayed in the output. By default
#'   `"marks_last"` with marked footnotes below unmarked ones, or alternatively
#'   `"marks_first"`. To preserve the order supplied by tab_footnote,
#'   `"preserve_order"` can be used.
#'
#' @param source_notes.border.bottom.style,source_notes.border.bottom.width,source_notes.border.bottom.color
#'   *Properties of the bottom border belonging to the source notes*
#'
#'   The style, width, and color properties for the bottom border of the
#'   `source_notes` location.
#'
#' @param source_notes.border.lr.style,source_notes.border.lr.width,source_notes.border.lr.color
#'   *Properties of left and right borders belonging to the source notes*
#'
#'   The style, width, and color properties for the left and right borders of
#'   the `source_notes` location.
#'
#' @param row.striping.background_color *Background color for row stripes*
#'
#'   The background color for striped table body rows. A color name or a
#'   hexadecimal color code should be provided.
#'
#' @param row.striping.include_stub
#'   *Inclusion of the table stub for row stripes*
#'
#'   An option for whether to include the stub when striping rows.
#'
#' @param row.striping.include_table_body
#'   *Inclusion of the table body for row stripes*
#'
#'   An option for whether to include the table body when striping rows.
#'
#' @param container.width,container.height,container.padding.x,container.padding.y
#'   *Table container dimensions and padding*
#'
#'   The width and height of the table's container, and, the vertical and
#'   horizontal padding of the table's container. The container width and height
#'   can be specified with units of pixels or as a percentage. The padding is to
#'   be specified as a length with units of pixels. If provided as a numeric
#'   value, it is assumed that the value is given in units of pixels. The [px()]
#'   and [pct()] helper functions can also be used to pass in numeric values and
#'   obtain values as pixel or percent units.
#'
#' @param container.overflow.x,container.overflow.y *Table container overflow*
#'
#'   Options to enable scrolling in the horizontal and vertical directions when
#'   the table content overflows the container dimensions. Using `TRUE` (the
#'   default for both) means that horizontal or vertical scrolling is enabled to
#'   view the entire table in those directions. With `FALSE`, the table may be
#'   clipped if the table width or height exceeds the `container.width` or
#'   `container.height`.
#'
#' @param ihtml.active *Display interactive HTML table*
#'
#'   The option for displaying an interactive version of an HTML table (rather
#'   than an otherwise 'static' table). This enables the use of controls for
#'   pagination, global search, filtering, and sorting. The individual features
#'   are controlled by the other `table.*` options. By default, the pagination
#'   (`ihtml.use_pagination`) and sorting (`ihtml.use_sorting`) features are
#'   enabled. The `ihtml.active` option, however, is `FALSE` by default.
#'
#' @param ihtml.use_pagination,ihtml.use_pagination_info *Use pagination*
#'
#'   For interactive HTML output, the option for using pagination controls
#'   (below the table body) can be controlled with `ihtml.use_pagination`. By
#'   default, this is `TRUE` and it will allow the use to page through table
#'   content. The informational display text regarding the current page can be
#'   set with `ihtml.use_pagination_info` (which is `TRUE` by default).
#'
#' @param ihtml.use_sorting *Provide column sorting controls*
#'
#'   For interactive HTML output, the option to provide controls for sorting
#'   column values. By default, this is `TRUE`.
#'
#' @param ihtml.use_search *Provide a global search field*
#'
#'   For interactive HTML output, an option that places a search field for
#'   globally filtering rows to the requested content. By default, this is
#'   `FALSE`.
#'
#' @param ihtml.use_filters *Display filtering fields*
#'
#'   For interactive HTML output, this places search fields below each column
#'   header and allows for filtering by column. By default, this is `FALSE`.
#'
#' @param ihtml.use_resizers *Allow column resizing*
#'
#'   For interactive HTML output, this allows for interactive resizing of
#'   columns. By default, this is `FALSE`.
#'
#' @param ihtml.use_highlight *Enable row highlighting on hover*
#'
#'   For interactive HTML output, this highlights individual rows upon hover. By
#'   default, this is `FALSE`.
#'
#' @param ihtml.use_compact_mode *Use compact mode*
#'
#'   For interactive HTML output, an option to reduce vertical padding and thus
#'   make the table consume less vertical space. By default, this is `FALSE`.
#'
#' @param ihtml.use_text_wrapping *Use text wrapping*
#'
#'   For interactive HTML output, an option to control text wrapping. By default
#'   (`TRUE`), text will be wrapped to multiple lines; if `FALSE`, text will be
#'   truncated to a single line.
#'
#' @param ihtml.use_page_size_select,ihtml.page_size_default,ihtml.page_size_values
#'   *Change page size properties*
#'
#'   For interactive HTML output, `ihtml.use_page_size_select` provides the
#'   option to display a dropdown menu for the number of rows to show per page
#'   of data. By default, this is the vector `c(10, 25, 50, 100)` which
#'   corresponds to options for `10`, `25`, `50`, and `100` rows of data per
#'   page. To modify these page-size options, provide a numeric vector to
#'   `ihtml.page_size_values`. The default page size (initially set as `10`) can
#'   be modified with `ihtml.page_size_default` and this works whether or not
#'   `ihtml.use_page_size_select` is set to `TRUE`.
#'
#' @param ihtml.pagination_type *Change pagination mode*
#'
#'   For interactive HTML output and when using pagination, one of three options
#'   for presentation pagination controls. The default is `"numbers"`, where a
#'   series of page-number buttons is presented along with 'previous' and 'next'
#'   buttons. The `"jump"` option provides an input field with a stepper for the
#'   page number. With `"simple"`, only the 'previous' and 'next' buttons are
#'   displayed.
#'
#' @param ihtml.height *Height of interactive HTML table*
#'
#'   Height of the table in pixels. Defaults to `"auto"` for automatic sizing.
#'
#' @param ihtml.selection_mode *Allow row selection*
#'
#'   For interactive HTML output, this allows users to select rows by clicking
#'   them. When this option is `"single"`, clicking another value toggles
#'   selection of the previously selected row off. When this option is
#'   `"multiple"`, multiple rows can be selected at once. Selected values are
#'   available in Shiny apps when `ihtml.selection_mode` is not `NULL` and the
#'   table is used in [render_gt()].
#'
#' @param page.orientation *Set RTF page orientation*
#'
#'   For RTF output, this provides two options for page
#'   orientation: `"portrait"` (the default) and `"landscape"`.
#'
#' @param page.numbering *Enable RTF page numbering*
#'
#'   Within RTF output, should page numbering be displayed? By default, this is
#'   set to `FALSE` but if `TRUE` then page numbering text will be added to the
#'   document header.
#'
#' @param page.header.use_tbl_headings
#'
#'   *Place table headings in RTF page header*
#'
#'   If `TRUE` then RTF output tables will migrate all table headings (including
#'   the table title and all column labels) to the page header. This page header
#'   content will repeat across pages. By default, this is `FALSE`.
#'
#' @param page.footer.use_tbl_notes
#'
#'   *Place table footer in RTF page footer*
#'
#'   If `TRUE` then RTF output tables will migrate all table footer content
#'   (this includes footnotes and source notes) to the page footer. This page
#'   footer content will repeat across pages. By default, this is `FALSE`.
#'
#' @param page.width,page.height
#'
#'   *Set RTF page dimensions*
#'
#'   The page width and height in the standard portrait orientation. This is for
#'   RTF table output and the default values (in inches) are `8.5in` and
#'   `11.0in`.
#'
#' @param page.margin.left,page.margin.right,page.margin.top,page.margin.bottom
#'
#'   *Set RTF page margins*
#'
#'   For RTF table output, these options correspond to the left, right, top, and
#'   bottom page margins. The default values for each of these is `1.0in`.
#'
#' @param page.header.height,page.footer.height
#'
#'   *Set RTF page header and footer distances*
#'
#'   The heights of the page header and footer for RTF table outputs. Default
#'   values for both are `0.5in`.
#'
#' @param quarto.use_bootstrap,quarto.disable_processing
#'
#'   *Modify Quarto properties*
#'
#'   When rendering a **gt** table with Quarto, the table can undergo
#'   transformations to support advanced Quarto features. Setting
#'   `quarto.use_bootstrap` to `TRUE` (`FALSE` by default) will allow Quarto to
#'   add Bootstrap classes to the table, allowing those styles to permeate the
#'   table. Quarto performs other alterations as well but they can all be
#'   deactivated with `quarto.disable_processing = TRUE` (this option is `FALSE`
#'   by default).
#'
#' @param latex.use_longtable
#'
#'   *Use longtable latex environment*
#'
#'   By default, tables produced using latex code will be embedded in the
#'   `table` floating environment. Setting this parameter to `TRUE` will instead
#'   use the `longtable` environment which will not float and may span multiple
#'   pages.
#'
#'
#' @param latex.header_repeat
#'
#'   * Specify if the header should repeat or not across pages*
#'
#'   For Long tables, it may be desirable to have the column headers repeat on
#'   every page. Setting this parameter to `TRUE` will add a `\endhead` command
#'   after the table headers so LaTeX knows where the headers end and will
#'   repeat them on every page.
#'
#' @param latex.toprule,latex.bottomrule
#'
#'   * Specify if an hrule should be put in the table at the top (latex.toprule) or bottom (latex.bottomrule)*
#'
#'   By default the tables produced using latex code will include top and bottom
#'   lines in the table via `\toprule` and `\bottomrule`. Setting these
#'   parameters to `FALSE` will instead not have these commands added, which
#'   lets the tables be produced without the top and bottom lines.
#'
#'
#' @param latex.tbl.pos
#'
#'   *Specify latex floating position*
#'
#'   The latex position indicator for a floating environment (e.g., `"tb"`,
#'   `"h"`). If not specified, latex position will default to `"t"`. It should be
#'   specified without square brackets. Quarto users should instead set the
#'   floating position within the code chunk argument `tbl-pos`. The output
#'   table will only float if `latex.use_longtable = FALSE`.
#'
#' @param latex.unicode_conversion
#'
#'   *Specify where possible convert unicode to latex*
#'
#'   Not all latex converters can handle unicode. or there may be a unicode
#'   value in the text that cannot be handled by the latex engine. In this case
#'   turn on this option by setting `latex.unicode_conversion = TRUE` and it
#'   will replace all unicode it can with equivalent latex calls.
#'
#' @return An object of class `gt_tbl`.
#'
#' @section Examples:
#'
#' Use select columns from the [`exibble`] dataset to create a **gt** table with
#' a number of table parts added (using functions like [summary_rows()],
#' [grand_summary_rows()], and more). We can use this **gt** object going
#' forward to demo some of `tab_options()` features.
#'
#' ```r
#' tab_1 <-
#'   exibble |>
#'   dplyr::select(-c(fctr, date, time, datetime)) |>
#'   gt(
#'     rowname_col = "row",
#'     groupname_col = "group"
#'   ) |>
#'   tab_header(
#'     title = md("Data listing from **exibble**"),
#'     subtitle = md("`exibble` is an R dataset")
#'   ) |>
#'   fmt_number(columns = num) |>
#'   fmt_currency(columns = currency) |>
#'   tab_footnote(
#'     footnote = "Using commas for separators.",
#'     locations = cells_body(
#'       columns = num,
#'       rows = num > 1000
#'     )
#'   ) |>
#'   tab_footnote(
#'     footnote = "Using commas for separators.",
#'     locations = cells_body(
#'       columns = currency,
#'       rows = currency > 1000
#'     )
#'   ) |>
#'   tab_footnote(
#'     footnote = "Alphabetical fruit.",
#'     locations = cells_column_labels(columns = char)
#'   )
#'
#' tab_1
#' ```
#'
#' \if{html}{\out{
#' `r man_get_image_tag(file = "man_tab_options_1.png")`
#' }}
#'
#' We can modify the table width to be set as '100%'. In effect, this spans the
#' table to entirely fill the content width area. This is done with the
#' `table.width` option and we take advantage of the [pct()] helper function.
#'
#' ```r
#' tab_1 |> tab_options(table.width = pct(100))
#' ```
#' \if{html}{\out{
#' `r man_get_image_tag(file = "man_tab_options_2.png")`
#' }}
#'
#' With the `table.background.color` option, we can modify the table's
#' background color. Here, we want that to be `"lightcyan"`.
#'
#' ```r
#' tab_1 |> tab_options(table.background.color = "lightcyan")
#' ```
#'
#' \if{html}{\out{
#' `r man_get_image_tag(file = "man_tab_options_3.png")`
#' }}
#'
#' We have footnotes residing in the footer section of `tab_1`. By default, each
#' footnote takes up a new line of text. This can be changed with the
#' `footnotes.multiline` option. Using `FALSE` with that means that all
#' footnotes will be placed into one continuous span of text. Speaking of
#' footnotes, we can change the 'marks' used to identify them. Here, we'll use
#' letters as the marks for footnote references (instead of the default, which
#' is numbers). This is accomplished with the `footnotes.marks` option, and we
#' are going to supply the `letters` vector to that.
#'
#' ```r
#' tab_1 |>
#'   tab_options(
#'     footnotes.multiline = FALSE,
#'     footnotes.marks = letters
#'   )
#' ```
#'
#' \if{html}{\out{
#' `r man_get_image_tag(file = "man_tab_options_4.png")`
#' }}
#'
#' The data rows of a table typically take up the most physical space but we
#' have some control over the extent of that. With the `data_row.padding`
#' option, it's possible to modify the top and bottom padding of data rows.
#' We'll do just that in the following example, reducing the padding to a value
#' of 5 px (note that we are using the [px()] helper function here).
#'
#' ```r
#' tab_1 |> tab_options(data_row.padding = px(5))
#' ```
#'
#' \if{html}{\out{
#' `r man_get_image_tag(file = "man_tab_options_5.png")`
#' }}
#'
#' The size of the title and the subtitle text in the header of the table can be
#' altered with the `heading.title.font.size` and `heading.subtitle.font.size`
#' options. Here, we'll use the `"small"` keyword as a value for both options.
#'
#' ```r
#' tab_1 |>
#'   tab_options(
#'     heading.title.font.size = "small",
#'     heading.subtitle.font.size = "small"
#'   )
#' ```
#'
#' \if{html}{\out{
#' `r man_get_image_tag(file = "man_tab_options_6.png")`
#' }}
#'
#' @family part creation/modification functions
#' @section Function ID:
#' 2-12
#'
#' @section Function Introduced:
#' `v0.2.0.5` (March 31, 2020)
#'
#' @export
tab_options <- function(
    data,
    table.width = NULL,
    table.layout = NULL,
    table.align = NULL,
    table.margin.left = NULL,
    table.margin.right = NULL,
    table.background.color = NULL,
    table.additional_css = NULL,
    table.font.names = NULL,
    table.font.size = NULL,
    table.font.weight = NULL,
    table.font.style = NULL,
    table.font.color = NULL,
    table.font.color.light = NULL,
    table.border.top.style = NULL,
    table.border.top.width = NULL,
    table.border.top.color = NULL,
    table.border.right.style = NULL,
    table.border.right.width = NULL,
    table.border.right.color = NULL,
    table.border.bottom.style = NULL,
    table.border.bottom.width = NULL,
    table.border.bottom.color = NULL,
    table.border.left.style = NULL,
    table.border.left.width = NULL,
    table.border.left.color = NULL,
    heading.background.color = NULL,
    heading.align = NULL,
    heading.title.font.size = NULL,
    heading.title.font.weight = NULL,
    heading.subtitle.font.size = NULL,
    heading.subtitle.font.weight = NULL,
    heading.padding = NULL,
    heading.padding.horizontal = NULL,
    heading.border.bottom.style = NULL,
    heading.border.bottom.width = NULL,
    heading.border.bottom.color = NULL,
    heading.border.lr.style = NULL,
    heading.border.lr.width = NULL,
    heading.border.lr.color = NULL,
    column_labels.background.color = NULL,
    column_labels.font.size = NULL,
    column_labels.font.weight = NULL,
    column_labels.text_transform = NULL,
    column_labels.padding = NULL,
    column_labels.padding.horizontal = NULL,
    column_labels.vlines.style = NULL,
    column_labels.vlines.width = NULL,
    column_labels.vlines.color = NULL,
    column_labels.border.top.style = NULL,
    column_labels.border.top.width = NULL,
    column_labels.border.top.color = NULL,
    column_labels.border.bottom.style = NULL,
    column_labels.border.bottom.width = NULL,
    column_labels.border.bottom.color = NULL,
    column_labels.border.lr.style = NULL,
    column_labels.border.lr.width = NULL,
    column_labels.border.lr.color = NULL,
    column_labels.hidden = NULL,
    column_labels.units_pattern = NULL,
    row_group.background.color = NULL,
    row_group.font.size = NULL,
    row_group.font.weight = NULL,
    row_group.text_transform = NULL,
    row_group.padding = NULL,
    row_group.padding.horizontal = NULL,
    row_group.border.top.style = NULL,
    row_group.border.top.width = NULL,
    row_group.border.top.color = NULL,
    row_group.border.bottom.style = NULL,
    row_group.border.bottom.width = NULL,
    row_group.border.bottom.color = NULL,
    row_group.border.left.style = NULL,
    row_group.border.left.width = NULL,
    row_group.border.left.color = NULL,
    row_group.border.right.style = NULL,
    row_group.border.right.width = NULL,
    row_group.border.right.color = NULL,
    row_group.default_label = NULL,
    row_group.as_column = NULL,
    table_body.hlines.style = NULL,
    table_body.hlines.width = NULL,
    table_body.hlines.color = NULL,
    table_body.vlines.style = NULL,
    table_body.vlines.width = NULL,
    table_body.vlines.color = NULL,
    table_body.border.top.style = NULL,
    table_body.border.top.width = NULL,
    table_body.border.top.color = NULL,
    table_body.border.bottom.style = NULL,
    table_body.border.bottom.width = NULL,
    table_body.border.bottom.color = NULL,
    stub.background.color = NULL,
    stub.font.size = NULL,
    stub.font.weight = NULL,
    stub.text_transform = NULL,
    stub.border.style = NULL,
    stub.border.width = NULL,
    stub.border.color = NULL,
    stub.indent_length = NULL,
    stub_row_group.font.size = NULL,
    stub_row_group.font.weight = NULL,
    stub_row_group.text_transform = NULL,
    stub_row_group.border.style = NULL,
    stub_row_group.border.width = NULL,
    stub_row_group.border.color = NULL,
    data_row.padding = NULL,
    data_row.padding.horizontal = NULL,
    summary_row.background.color = NULL,
    summary_row.text_transform = NULL,
    summary_row.padding = NULL,
    summary_row.padding.horizontal = NULL,
    summary_row.border.style = NULL,
    summary_row.border.width = NULL,
    summary_row.border.color = NULL,
    grand_summary_row.background.color = NULL,
    grand_summary_row.text_transform = NULL,
    grand_summary_row.padding = NULL,
    grand_summary_row.padding.horizontal = NULL,
    grand_summary_row.border.style = NULL,
    grand_summary_row.border.width = NULL,
    grand_summary_row.border.color = NULL,
    footnotes.background.color = NULL,
    footnotes.font.size = NULL,
    footnotes.padding = NULL,
    footnotes.padding.horizontal = NULL,
    footnotes.border.bottom.style = NULL,
    footnotes.border.bottom.width = NULL,
    footnotes.border.bottom.color = NULL,
    footnotes.border.lr.style = NULL,
    footnotes.border.lr.width = NULL,
    footnotes.border.lr.color = NULL,
    footnotes.marks = NULL,
    footnotes.spec_ref = NULL,
    footnotes.spec_ftr = NULL,
    footnotes.multiline = NULL,
    footnotes.sep = NULL,
    footnotes.order = NULL,
    source_notes.background.color = NULL,
    source_notes.font.size = NULL,
    source_notes.padding = NULL,
    source_notes.padding.horizontal = NULL,
    source_notes.border.bottom.style = NULL,
    source_notes.border.bottom.width = NULL,
    source_notes.border.bottom.color = NULL,
    source_notes.border.lr.style = NULL,
    source_notes.border.lr.width = NULL,
    source_notes.border.lr.color = NULL,
    source_notes.multiline = NULL,
    source_notes.sep = NULL,
    row.striping.background_color = NULL,
    row.striping.include_stub = NULL,
    row.striping.include_table_body = NULL,
    container.width = NULL,
    container.height = NULL,
    container.padding.x = NULL,
    container.padding.y = NULL,
    container.overflow.x = NULL,
    container.overflow.y = NULL,
    ihtml.active = NULL,
    ihtml.use_pagination = NULL,
    ihtml.use_pagination_info = NULL,
    ihtml.use_sorting = NULL,
    ihtml.use_search = NULL,
    ihtml.use_filters = NULL,
    ihtml.use_resizers = NULL,
    ihtml.use_highlight = NULL,
    ihtml.use_compact_mode = NULL,
    ihtml.use_text_wrapping = NULL,
    ihtml.use_page_size_select = NULL,
    ihtml.page_size_default = NULL,
    ihtml.page_size_values = NULL,
    ihtml.pagination_type = NULL,
    ihtml.height = NULL,
    ihtml.selection_mode = NULL,
    page.orientation = NULL,
    page.numbering = NULL,
    page.header.use_tbl_headings = NULL,
    page.footer.use_tbl_notes = NULL,
    page.width = NULL,
    page.height = NULL,
    page.margin.left = NULL,
    page.margin.right = NULL,
    page.margin.top = NULL,
    page.margin.bottom = NULL,
    page.header.height = NULL,
    page.footer.height = NULL,
    quarto.use_bootstrap = NULL,
    quarto.disable_processing = NULL,
    latex.use_longtable = NULL,
    latex.header_repeat = NULL,
    latex.stub_separate = NULL,
    latex.toprule = NULL,
    latex.bottomrule = NULL,
    latex.tbl.pos = NULL,
    latex.unicode_conversion = NULL
) {

  # Perform input object validation
  stop_if_not_gt_tbl(data = data)

  # Extract the options table from `data`
  opts_df <- dt_options_get(data = data)

  arg_names <-
    base::setdiff(
      names(formals(tab_options)),
      c("data", "ihtml.page_size_values", "ihtml.page_size_default")
    )

  arg_vals <- mget(arg_names)
  arg_vals <- arg_vals[!vapply(arg_vals, FUN = is.null, FUN.VALUE = logical(1))]
  arg_vals <- set_super_options(arg_vals = arg_vals)

  new_df <-
    vctrs::data_frame(
      parameter = gsub(".", "_", names(arg_vals), fixed = TRUE),
      value = unname(arg_vals)
    )
  new_df <-
    dplyr::left_join(
      new_df,
      dplyr::select(opts_df, "parameter", "type"),
      by = "parameter"
    )
  new_df$value <- mapply(
    preprocess_tab_option,
    option = new_df$value, var_name = new_df$parameter, type = new_df$type,
    SIMPLIFY = FALSE
  )
  new_df$type <- NULL

  # This rearranges the rows in the `opts_df` table, but this
  # shouldn't be a problem
  opts_df <-
    dplyr::bind_rows(
      dplyr::inner_join(
        new_df,
        dplyr::select(opts_df, -"value"),
        by = "parameter"
      ),
      dplyr::anti_join(opts_df, new_df, by = "parameter")
    )

  # Write the modified options table back to `data`
  data <- dt_options_set(data = data, options = opts_df)

  #
  # Handle special cases where option values are vectors
  #

  ihtml_page_size_values <- mget("ihtml.page_size_values")
  if (!is.null(ihtml_page_size_values[[1]])) {
    data <-
      dt_options_set_value(
        data = data,
        option = "ihtml_page_size_values",
        value = unname(unlist(ihtml_page_size_values))
      )
  }

  ihtml_page_size_default <- mget("ihtml.page_size_default")
  if (!is.null(ihtml_page_size_default[[1]])) {
    data <-
      dt_options_set_value(
        data = data,
        option = "ihtml_page_size_default",
        value = unname(unlist(ihtml_page_size_default))
      )
  }

  data
}

# Helpers --------------------------------
dt_options_get_default_value <- function(option) {

  # Validate the provided `option` value
  check_string(option)
  if (!(option %in% dt_options_tbl$parameter)) {
    cli::cli_abort("The `option` provided is invalid.")
  }

  dt_options_tbl$value[[which(dt_options_tbl$parameter == option)]]
}

# Get vector of argument names (excluding `data`) from `tab_options`
tab_options_arg_names <- base::setdiff(names(formals(tab_options)), "data")

# Create vector of all args from `tab_options()` by
# use of a regex pattern
get_tab_options_arg_vec <- function(pattern) {
  grep(pattern = pattern, tab_options_arg_names, value = TRUE)
}

# `call` is set to `caller_env(2)` to skip the `mapply()` call in
# `tab_options()` and in `grp_options()`
preprocess_tab_option <- function(
    option,
    var_name,
    type,
    call = rlang::caller_env(2)
) {

  # Perform pre-processing on the option depending on `type`
  option <-
    switch(
      type,
      overflow = {
        if (isTRUE(option)) {
          "auto"
        } else if (isFALSE(option)) {
          "hidden"
        } else {
          option
        }
      },
      px = {
        if (is.numeric(option)) {
          px(option)
        } else {
          option
        }
      },
      option
    )

  # Perform `check_*()` checks by `type`
  switch(
    type,
    logical = check_bool(option, arg = var_name, call = call),
    overflow = ,
    px = ,
    value = check_string(option, arg = var_name, allow_na = FALSE, call = call),
    values = check_chr_has_length(option, arg = var_name, call = call)
  )

  option
}

set_super_options <- function(arg_vals) {

  if ("table.align" %in% names(arg_vals)) {

    table_align_val <- arg_vals$table.align

    arg_vals$table.align <- NULL

    if (!(table_align_val %in% c("left", "center", "right"))) {
      cli::cli_abort(c(
        "The chosen option for `table.align` (`{table_align_val}`) is invalid.",
        "*" = "We can use either of \"left\", \"center\", or \"right\"."
      ))
    }

    arg_vals$table.margin.left <-
      arg_vals$table.margin.left %||%
      switch(
        table_align_val,
        center = "auto",
        left = "0",
        right = "auto"
      )

    arg_vals$table.margin.right <-
      arg_vals$table.margin.right %||%
      switch(
        table_align_val,
        center = "auto",
        left = "auto",
        right = "0"
      )
  }

  if ("ihtml.selection_mode" %in% names(arg_vals)) {
    ihtml_selection_mode_val <- arg_vals$ihtml.selection_mode
    if (!rlang::is_string(ihtml_selection_mode_val, c("single", "multiple"))) {
      cli::cli_abort(c(
        "The chosen option for `ihtml.selection_mode` (`{ihtml_selection_mode_val}`) is invalid.",
        "*" = "We can use either \"single\" or \"multiple\"."
      ))
    }
  }
  arg_vals
}

normalize_font_input <- function(font_input, call = rlang::caller_env()) {

  if (!inherits(font_input, c("character", "list", "font_css"))) {
    cli::cli_abort(
      "{.arg font} must be a list or a character vector, not {.obj_type_friendly {font_input}}.",
      call = call
    )
  }

  if (inherits(font_input, "character")) {
    font_input <- list(font_input)
  }

  # Unlist a list of lists; this normalizes the value for `font_input`
  # in the cases where multiple fonts were provided in `c()` and `list()`
  if (any(vapply(font_input, is.list, FUN.VALUE = logical(1)))) {
    font_input <- unlist(font_input, recursive = FALSE)
  }

  if (is.null(names(font_input))) {
    font_names <- unlist(font_input)
    import_stmts <- ""
  } else {
    font_names <- unique(unname(unlist(font_input[names(font_input) %in% c("name", "")])))
    import_stmts <- unique(unname(unlist(font_input[names(font_input) %in% "import_stmt"])))
  }

  font_list <-
    list(
      name = font_names,
      import_stmt = import_stmts
    )

  class(font_list) <- "font_css"
  font_list
}

# Create an option-value list with a vector of arg names from the
# `tab_options()` function and either one value or n-length values
# corresponding to those options
create_option_value_list <- function(tab_options_args, values) {

  # Validate the length of the `values` vector
  if (length(values) == 1) {

    values <- rep_len(values, length(tab_options_args))

  } else if (length(values) != length(tab_options_args)) {

    cli::cli_abort(
      "The length of the `values` vector must be `1` or the length of
      `tab_options_args`."
    )
  }

  as.list(stats::setNames(object = values, tab_options_args))
}

create_default_option_value_list <- function(tab_options_args) {

  lapply(
    rlang::set_names(tab_options_args),
    FUN = function(x) {
      dt_options_get_default_value(gsub(".", "_", x, fixed = TRUE))
    }
  )
}

# Validate any vector of `tab_options()` argument names
validate_tab_options_args <- function(tab_options_args) {

  if (!all(tab_options_args %in% tab_options_arg_names)) {
    cli::cli_abort("All `tab_options_args` must be valid names.")
  }
}

# Do multiple calls of `tab_options()` with an option-value list (`options`)
tab_options_multi <- function(data, options) {

  # Validate the names of the `options`
  validate_tab_options_args(names(options))

  do.call(tab_options, c(list(data = data), options))
}
