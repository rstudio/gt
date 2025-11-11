# Modify table options for all tables within a `gt_group` object

Modify the options for a collection of **gt** tables in a `gt_group`
object. These options are named by the components, the subcomponents,
and the element that can adjusted.

## Usage

``` r
grp_options(
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
  page.footer.height = NULL
)
```

## Arguments

- data:

  *The gt table group object*

  `obj:<gt_group>` // **required**

  This is a `gt_group` container object. It is typically generated
  through use of
  [`gt_group()`](https://gt.rstudio.com/reference/gt_group.md) along
  with one or more `gt_tbl` objects, or, made by splitting a **gt**
  table with
  [`gt_split()`](https://gt.rstudio.com/reference/gt_split.md).

- table.width:

  *Table width*

  The table width can be specified as a single-length character with
  units of pixels or as a percentage. If provided as a single-length
  numeric vector, it is assumed that the value is given in units of
  pixels. The [`px()`](https://gt.rstudio.com/reference/px.md) and
  [`pct()`](https://gt.rstudio.com/reference/pct.md) helper functions
  can also be used to pass in numeric values and obtain values as pixel
  or percent units.

- table.layout:

  *The table-layout property*

  This is the value for the `table-layout` CSS style in the HTML output
  context. By default, this is `"fixed"` but another valid option is
  `"auto"`.

- table.align:

  *Horizontal alignment of table*

  The `table.align` option lets us set the horizontal alignment of the
  table in its container. By default, this is `"center"`. Other options
  are `"left"` and `"right"`. This will automatically set
  `table.margin.left` and `table.margin.right` to the appropriate
  values.

- table.margin.left, table.margin.right:

  *Left and right table margins*

  The size of the margins on the left and right of the table within the
  container can be set with `table.margin.left` and
  `table.margin.right`. Can be specified as a single-length character
  with units of pixels or as a percentage. If provided as a
  single-length numeric vector, it is assumed that the value is given in
  units of pixels. The [`px()`](https://gt.rstudio.com/reference/px.md)
  and [`pct()`](https://gt.rstudio.com/reference/pct.md) helper
  functions can also be used to pass in numeric values and obtain values
  as pixel or percent units. Using `table.margin.left` or
  `table.margin.right` will overwrite any values set by `table.align`.

- table.background.color, heading.background.color,
  column_labels.background.color, row_group.background.color,
  stub.background.color, summary_row.background.color,
  grand_summary_row.background.color, footnotes.background.color,
  source_notes.background.color:

  *Background colors*

  These options govern background colors for the parent element `table`
  and the following child elements: `heading`, `column_labels`,
  `row_group`, `stub`, `summary_row`, `grand_summary_row`, `footnotes`,
  and `source_notes`. A color name or a hexadecimal color code should be
  provided.

- table.additional_css:

  *Additional CSS*

  The `table.additional_css` option can be used to supply an additional
  block of CSS rules to be applied after the automatically generated
  table CSS.

- table.font.names:

  *Default table fonts*

  The names of the fonts used for the table can be supplied through
  `table.font.names`. This is a vector of several font names. If the
  first font isn't available, then the next font is tried (and so on).

- table.font.size, heading.title.font.size, heading.subtitle.font.size,
  column_labels.font.size, row_group.font.size, stub.font.size,
  footnotes.font.size, source_notes.font.size:

  *Table font sizes*

  The font sizes for the parent text element `table` and the following
  child elements: `heading.title`, `heading.subtitle`, `column_labels`,
  `row_group`, `footnotes`, and `source_notes`. Can be specified as a
  single-length character vector with units of pixels (e.g., `12px`) or
  as a percentage (e.g., `80%`). If provided as a single-length numeric
  vector, it is assumed that the value is given in units of pixels. The
  [`px()`](https://gt.rstudio.com/reference/px.md) and
  [`pct()`](https://gt.rstudio.com/reference/pct.md) helper functions
  can also be used to pass in numeric values and obtain values as pixel
  or percentage units.

- table.font.weight, heading.title.font.weight,
  heading.subtitle.font.weight, column_labels.font.weight,
  row_group.font.weight, stub.font.weight:

  *Table font weights*

  The font weights of the table, `heading.title`, `heading.subtitle`,
  `column_labels`, `row_group`, and `stub` text elements. Can be a
  text-based keyword such as `"normal"`, `"bold"`, `"lighter"`,
  `"bolder"`, or, a numeric value between `1` and `1000`, inclusive.
  Note that only variable fonts may support the numeric mapping of
  weight.

- table.font.style:

  *Default table font style*

  This is the default font style for the table. Can be one of either
  `"normal"`, `"italic"`, or `"oblique"`.

- table.font.color, table.font.color.light:

  *Default dark and light text for the table*

  These options define text colors used throughout the table. There are
  two variants: `table.font.color` is for text overlaid on lighter
  background colors, and `table.font.color.light` is automatically used
  when text needs to be overlaid on darker background colors. A color
  name or a hexadecimal color code should be provided.

- table.border.top.style, table.border.top.width,
  table.border.top.color, table.border.right.style,
  table.border.right.width, table.border.right.color,
  table.border.bottom.style, table.border.bottom.width,
  table.border.bottom.color, table.border.left.style,
  table.border.left.width, table.border.left.color:

  *Top border properties*

  The style, width, and color properties of the table's absolute top and
  absolute bottom borders.

- heading.align:

  *Horizontal alignment in the table header*

  Controls the horizontal alignment of the heading title and subtitle.
  We can either use `"center"`, `"left"`, or `"right"`.

- heading.padding, column_labels.padding, data_row.padding,
  row_group.padding, summary_row.padding, grand_summary_row.padding,
  footnotes.padding, source_notes.padding:

  *Vertical padding throughout the table*

  The amount of vertical padding to incorporate in the `heading` (title
  and subtitle), the `column_labels` (this includes the column
  spanners), the row group labels (`row_group.padding`), in the
  body/stub rows (`data_row.padding`), in summary rows
  (`summary_row.padding` or `grand_summary_row.padding`), or in the
  footnotes and source notes (`footnotes.padding` and
  `source_notes.padding`).

- heading.padding.horizontal, column_labels.padding.horizontal,
  data_row.padding.horizontal, row_group.padding.horizontal,
  summary_row.padding.horizontal, grand_summary_row.padding.horizontal,
  footnotes.padding.horizontal, source_notes.padding.horizontal:

  *Horizontal padding throughout the table*

  The amount of horizontal padding to incorporate in the `heading`
  (title and subtitle), the `column_labels` (this includes the column
  spanners), the row group labels (`row_group.padding.horizontal`), in
  the body/stub rows (`data_row.padding`), in summary rows
  (`summary_row.padding.horizontal` or
  `grand_summary_row.padding.horizontal`), or in the footnotes and
  source notes (`footnotes.padding.horizontal` and
  `source_notes.padding.horizontal`).

- heading.border.bottom.style, heading.border.bottom.width,
  heading.border.bottom.color:

  *Properties of the header's bottom border*

  The style, width, and color properties of the header's bottom border.
  This border shares space with that of the `column_labels` location. If
  the `width` of this border is larger, then it will be the visible
  border.

- heading.border.lr.style, heading.border.lr.width,
  heading.border.lr.color:

  *Properties of the header's left and right borders*

  The style, width, and color properties for the left and right borders
  of the `heading` location.

- column_labels.text_transform, row_group.text_transform,
  stub.text_transform, summary_row.text_transform,
  grand_summary_row.text_transform:

  *Text transforms throughout the table*

  Options to apply text transformations to the `column_labels`,
  `row_group`, `stub`, `summary_row`, and `grand_summary_row` text
  elements. Either of the `"uppercase"`, `"lowercase"`, or
  `"capitalize"` keywords can be used.

- column_labels.vlines.style, column_labels.vlines.width,
  column_labels.vlines.color:

  *Properties of all vertical lines by the column labels*

  The style, width, and color properties for all vertical lines
  ('vlines') of the `column_labels`.

- column_labels.border.top.style, column_labels.border.top.width,
  column_labels.border.top.color:

  *Properties of the border above the column labels*

  The style, width, and color properties for the top border of the
  `column_labels` location. This border shares space with that of the
  `heading` location. If the `width` of this border is larger, then it
  will be the visible border.

- column_labels.border.bottom.style, column_labels.border.bottom.width,
  column_labels.border.bottom.color:

  *Properties of the border below the column labels*

  The style, width, and color properties for the bottom border of the
  `column_labels` location.

- column_labels.border.lr.style, column_labels.border.lr.width,
  column_labels.border.lr.color:

  *Properties of the left and right borders next to the column labels*

  The style, width, and color properties for the left and right borders
  of the `column_labels` location.

- column_labels.hidden:

  *Hiding all column labels*

  An option to hide the column labels. If providing `TRUE` then the
  entire `column_labels` location won't be seen and the table header (if
  present) will collapse downward.

- column_labels.units_pattern:

  *Pattern to combine column labels and units*

  The default pattern for combining column labels with any defined units
  for column labels. The pattern is initialized as `"{1}, {2}"`, where
  `"{1}"` refers to the column label text and `"{2}"` is the text
  related to the associated units. When using
  [`cols_units()`](https://gt.rstudio.com/reference/cols_units.md),
  there is the opportunity to provide a specific pattern that overrides
  the units pattern unit. Further to this, if specifying units directly
  in [`cols_label()`](https://gt.rstudio.com/reference/cols_label.md)
  (through the units syntax surrounded by `"{{"`/`"}}"`) there is no
  need for a units pattern and any value here will be disregarded.

- row_group.border.top.style, row_group.border.top.width,
  row_group.border.top.color, row_group.border.bottom.style,
  row_group.border.bottom.width, row_group.border.bottom.color,
  row_group.border.left.style, row_group.border.left.width,
  row_group.border.left.color, row_group.border.right.style,
  row_group.border.right.width, row_group.border.right.color:

  *Border properties associated with the `row_group` location*

  The style, width, and color properties for all top, bottom, left, and
  right borders of the `row_group` location.

- row_group.default_label:

  *The default row group label*

  An option to set a default row group label for any rows not formally
  placed in a row group named by `group` in any call of
  [`tab_row_group()`](https://gt.rstudio.com/reference/tab_row_group.md).
  If this is set as `NA_character_` and there are rows that haven't been
  placed into a row group (where one or more row groups already exist),
  those rows will be automatically placed into a row group without a
  label.

- row_group.as_column:

  *Structure row groups with a column*

  How should row groups be structured? By default, they are separate
  rows that lie above the each of the groups. Setting this to `TRUE`
  will structure row group labels as a separate column in the table
  stub.

- table_body.hlines.style, table_body.hlines.width,
  table_body.hlines.color, table_body.vlines.style,
  table_body.vlines.width, table_body.vlines.color:

  *Properties of all horizontal and vertical lines in the table body*

  The style, width, and color properties for all horizontal lines
  ('hlines') and vertical lines ('vlines') in the `table_body`.

- table_body.border.top.style, table_body.border.top.width,
  table_body.border.top.color, table_body.border.bottom.style,
  table_body.border.bottom.width, table_body.border.bottom.color:

  *Properties of top and bottom borders in the table body*

  The style, width, and color properties for all top and bottom borders
  of the `table_body` location.

- stub.border.style, stub.border.width, stub.border.color:

  *Properties of the vertical border of the table stub*

  The style, width, and color properties for the vertical border of the
  table stub.

- stub.indent_length:

  *Width of each indentation*

  The width of each indentation level for row labels in the stub. The
  indentation can be set by using
  [`tab_stub_indent()`](https://gt.rstudio.com/reference/tab_stub_indent.md).
  By default this is `"5px"`.

- stub_row_group.font.size, stub_row_group.font.weight,
  stub_row_group.text_transform, stub_row_group.border.style,
  stub_row_group.border.width, stub_row_group.border.color:

  *Properties of the row group column in the table stub*

  Options for the row group column in the table stub (made possible when
  using `row_group.as_column = TRUE`). The defaults for these options
  mirror that of the `stub.*` variants (except for
  `stub_row_group.border.width`, which is `"1px"` instead of `"2px"`).

- summary_row.border.style, summary_row.border.width,
  summary_row.border.color:

  *Properties of horizontal borders belonging to summary rows*

  The style, width, and color properties for all horizontal borders of
  the `summary_row` location.

- grand_summary_row.border.style, grand_summary_row.border.width,
  grand_summary_row.border.color:

  *Properties of horizontal borders belonging to grand summary rows*

  The style, width, and color properties for the top borders of the
  `grand_summary_row` location.

- footnotes.border.bottom.style, footnotes.border.bottom.width,
  footnotes.border.bottom.color:

  *Properties of the bottom border belonging to the footnotes*

  The style, width, and color properties for the bottom border of the
  `footnotes` location.

- footnotes.border.lr.style, footnotes.border.lr.width,
  footnotes.border.lr.color:

  *Properties of left and right borders belonging to the footnotes*

  The style, width, and color properties for the left and right borders
  of the `footnotes` location.

- footnotes.marks:

  *Sequence of footnote marks*

  The set of sequential marks used to reference and identify each of the
  footnotes (same input as
  [`opt_footnote_marks()`](https://gt.rstudio.com/reference/opt_footnote_marks.md)).
  We can supply a vector that represents the series of footnote marks.
  This vector is recycled when its usage goes beyond the length of the
  set. At each cycle, the marks are simply combined (e.g., `*` -\> `**`
  -\> `***`). The option exists for providing keywords for certain types
  of footnote marks. The keyword `"numbers"` (the default, indicating
  that we want to use numeric marks). We can use lowercase `"letters"`
  or uppercase `"LETTERS"`. There is the option for using a traditional
  symbol set where `"standard"` provides four symbols, and, `"extended"`
  adds two more symbols, making six.

- footnotes.spec_ref, footnotes.spec_ftr:

  *Specifications for formatting of footnote marks*

  Optional specifications for formatting of footnote references
  (`footnotes.spec_ref`) and their associated marks the footer section
  (`footnotes.spec_ftr`) (same input as
  [`opt_footnote_spec()`](https://gt.rstudio.com/reference/opt_footnote_spec.md)).
  This is a string containing specification control characters. The
  default is the spec string `"^i"`, which is superscript text set in
  italics. Other control characters that can be used are: (1) `"b"` for
  bold text, and (2) `"("` / `")"` for the enclosure of footnote marks
  in parentheses.

- footnotes.multiline, source_notes.multiline:

  *Typesetting of multiple footnotes and source notes*

  An option to either put footnotes and source notes in separate lines
  (the default, or `TRUE`) or render them as a continuous line of text
  with `footnotes.sep` providing the separator (by default `" "`)
  between notes.

- footnotes.sep, source_notes.sep:

  *Separator characters between adjacent footnotes and source notes*

  The separating characters between adjacent footnotes and source notes
  in their respective footer sections when rendered as a continuous line
  of text (when `footnotes.multiline == FALSE`). The default value is a
  single space character (`" "`).

- source_notes.border.bottom.style, source_notes.border.bottom.width,
  source_notes.border.bottom.color:

  *Properties of the bottom border belonging to the source notes*

  The style, width, and color properties for the bottom border of the
  `source_notes` location.

- source_notes.border.lr.style, source_notes.border.lr.width,
  source_notes.border.lr.color:

  *Properties of left and right borders belonging to the source notes*

  The style, width, and color properties for the left and right borders
  of the `source_notes` location.

- row.striping.background_color:

  *Background color for row stripes*

  The background color for striped table body rows. A color name or a
  hexadecimal color code should be provided.

- row.striping.include_stub:

  *Inclusion of the table stub for row stripes*

  An option for whether to include the stub when striping rows.

- row.striping.include_table_body:

  *Inclusion of the table body for row stripes*

  An option for whether to include the table body when striping rows.

- container.width, container.height, container.padding.x,
  container.padding.y:

  *Table container dimensions and padding*

  The width and height of the table's container, and, the vertical and
  horizontal padding of the table's container. The container width and
  height can be specified with units of pixels or as a percentage. The
  padding is to be specified as a length with units of pixels. If
  provided as a numeric value, it is assumed that the value is given in
  units of pixels. The [`px()`](https://gt.rstudio.com/reference/px.md)
  and [`pct()`](https://gt.rstudio.com/reference/pct.md) helper
  functions can also be used to pass in numeric values and obtain values
  as pixel or percent units.

- container.overflow.x, container.overflow.y:

  *Table container overflow*

  Options to enable scrolling in the horizontal and vertical directions
  when the table content overflows the container dimensions. Using
  `TRUE` (the default for both) means that horizontal or vertical
  scrolling is enabled to view the entire table in those directions.
  With `FALSE`, the table may be clipped if the table width or height
  exceeds the `container.width` or `container.height`.

- ihtml.active:

  *Display interactive HTML table*

  The option for displaying an interactive version of an HTML table
  (rather than an otherwise 'static' table). This enables the use of
  controls for pagination, global search, filtering, and sorting. The
  individual features are controlled by the other `table.*` options. By
  default, the pagination (`ihtml.use_pagination`) and sorting
  (`ihtml.use_sorting`) features are enabled. The `ihtml.active` option,
  however, is `FALSE` by default.

- ihtml.use_pagination, ihtml.use_pagination_info:

  *Use pagination*

  For interactive HTML output, the option for using pagination controls
  (below the table body) can be controlled with `ihtml.use_pagination`.
  By default, this is `TRUE` and it will allow the use to page through
  table content. The informational display text regarding the current
  page can be set with `ihtml.use_pagination_info` (which is `TRUE` by
  default).

- ihtml.use_sorting:

  *Provide column sorting controls*

  For interactive HTML output, the option to provide controls for
  sorting column values. By default, this is `TRUE`.

- ihtml.use_search:

  *Provide a global search field*

  For interactive HTML output, an option that places a search field for
  globally filtering rows to the requested content. By default, this is
  `FALSE`.

- ihtml.use_filters:

  *Display filtering fields*

  For interactive HTML output, this places search fields below each
  column header and allows for filtering by column. By default, this is
  `FALSE`.

- ihtml.use_resizers:

  *Allow column resizing*

  For interactive HTML output, this allows for interactive resizing of
  columns. By default, this is `FALSE`.

- ihtml.use_highlight:

  *Enable row highlighting on hover*

  For interactive HTML output, this highlights individual rows upon
  hover. By default, this is `FALSE`.

- ihtml.use_compact_mode:

  *Use compact mode*

  For interactive HTML output, an option to reduce vertical padding and
  thus make the table consume less vertical space. By default, this is
  `FALSE`.

- ihtml.use_text_wrapping:

  *Use text wrapping*

  For interactive HTML output, an option to control text wrapping. By
  default (`TRUE`), text will be wrapped to multiple lines; if `FALSE`,
  text will be truncated to a single line.

- ihtml.use_page_size_select, ihtml.page_size_default,
  ihtml.page_size_values:

  *Change page size properties*

  For interactive HTML output, `ihtml.use_page_size_select` provides the
  option to display a dropdown menu for the number of rows to show per
  page of data. By default, this is the vector `c(10, 25, 50, 100)`
  which corresponds to options for `10`, `25`, `50`, and `100` rows of
  data per page. To modify these page-size options, provide a numeric
  vector to `ihtml.page_size_values`. The default page size (initially
  set as `10`) can be modified with `ihtml.page_size_default` and this
  works whether or not `ihtml.use_page_size_select` is set to `TRUE`.

- ihtml.pagination_type:

  *Change pagination mode*

  For interactive HTML output and when using pagination, one of three
  options for presentation pagination controls. The default is
  `"numbers"`, where a series of page-number buttons is presented along
  with 'previous' and 'next' buttons. The `"jump"` option provides an
  input field with a stepper for the page number. With `"simple"`, only
  the 'previous' and 'next' buttons are displayed.

- page.orientation:

  *Set RTF page orientation*

  For RTF output, this provides two options for page orientation:
  `"portrait"` (the default) and `"landscape"`.

- page.numbering:

  *Enable RTF page numbering*

  Within RTF output, should page numbering be displayed? By default,
  this is set to `FALSE` but if `TRUE` then page numbering text will be
  added to the document header.

- page.header.use_tbl_headings:

  *Place table headings in RTF page header*

  If `TRUE` then RTF output tables will migrate all table headings
  (including the table title and all column labels) to the page header.
  This page header content will repeat across pages. By default, this is
  `FALSE`.

- page.footer.use_tbl_notes:

  *Place table footer in RTF page footer*

  If `TRUE` then RTF output tables will migrate all table footer content
  (this includes footnotes and source notes) to the page footer. This
  page footer content will repeat across pages. By default, this is
  `FALSE`.

- page.width, page.height:

  *Set RTF page dimensions*

  The page width and height in the standard portrait orientation. This
  is for RTF table output and the default values (in inches) are `8.5in`
  and `11.0in`.

- page.margin.left, page.margin.right, page.margin.top,
  page.margin.bottom:

  *Set RTF page margins*

  For RTF table output, these options correspond to the left, right,
  top, and bottom page margins. The default values for each of these is
  `1.0in`.

- page.header.height, page.footer.height:

  *Set RTF page header and footer distances*

  The heights of the page header and footer for RTF table outputs.
  Default values for both are `0.5in`.

## Value

An object of class `gt_group`.

## Function ID

14-8

## Function Introduced

`v0.9.0` (Mar 31, 2023)

## See also

Other table group functions:
[`grp_add()`](https://gt.rstudio.com/reference/grp_add.md),
[`grp_clone()`](https://gt.rstudio.com/reference/grp_clone.md),
[`grp_pull()`](https://gt.rstudio.com/reference/grp_pull.md),
[`grp_replace()`](https://gt.rstudio.com/reference/grp_replace.md),
[`grp_rm()`](https://gt.rstudio.com/reference/grp_rm.md),
[`gt_group()`](https://gt.rstudio.com/reference/gt_group.md),
[`gt_split()`](https://gt.rstudio.com/reference/gt_split.md)
