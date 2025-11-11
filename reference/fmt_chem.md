# Format chemical formulas

`fmt_chem()` lets you format chemical formulas or even chemical
reactions in the table body. Often the input text will be in a common
form representing single compounds (like `"C2H4O"`, for acetaldehyde)
but chemical reactions can be used (e.g., `2CH3OH -> CH3OCH3 + H2O"`).
So long as the text within the targeted cells conforms to **gt**'s
specialized chemistry notation, the appropriate conversions will occur.
Details pertaining to chemistry notation can be found in the section
entitled *How to use **gt**'s chemistry notation*.

## Usage

``` r
fmt_chem(data, columns = everything(), rows = everything())
```

## Arguments

- data:

  *The gt table data object*

  `obj:<gt_tbl>` // **required**

  This is the **gt** table object that is commonly created through use
  of the [`gt()`](https://gt.rstudio.com/reference/gt.md) function.

- columns:

  *Columns to target*

  [`<column-targeting expression>`](https://gt.rstudio.com/reference/rows-columns.md)
  // *default:*
  [`everything()`](https://tidyselect.r-lib.org/reference/everything.html)

  Can either be a series of column names provided in
  [`c()`](https://rdrr.io/r/base/c.html), a vector of column indices, or
  a select helper function (e.g.
  [`starts_with()`](https://tidyselect.r-lib.org/reference/starts_with.html),
  [`ends_with()`](https://tidyselect.r-lib.org/reference/starts_with.html),
  [`contains()`](https://tidyselect.r-lib.org/reference/starts_with.html),
  [`matches()`](https://tidyselect.r-lib.org/reference/starts_with.html),
  [`num_range()`](https://tidyselect.r-lib.org/reference/starts_with.html)
  and
  [`everything()`](https://tidyselect.r-lib.org/reference/everything.html)).

- rows:

  *Rows to target*

  [`<row-targeting expression>`](https://gt.rstudio.com/reference/rows-columns.md)
  // *default:*
  [`everything()`](https://tidyselect.r-lib.org/reference/everything.html)

  In conjunction with `columns`, we can specify which of their rows
  should undergo formatting. The default
  [`everything()`](https://tidyselect.r-lib.org/reference/everything.html)
  results in all rows in `columns` being formatted. Alternatively, we
  can supply a vector of row captions within
  [`c()`](https://rdrr.io/r/base/c.html), a vector of row indices, or a
  select helper function (e.g.
  [`starts_with()`](https://tidyselect.r-lib.org/reference/starts_with.html),
  [`ends_with()`](https://tidyselect.r-lib.org/reference/starts_with.html),
  [`contains()`](https://tidyselect.r-lib.org/reference/starts_with.html),
  [`matches()`](https://tidyselect.r-lib.org/reference/starts_with.html),
  [`num_range()`](https://tidyselect.r-lib.org/reference/starts_with.html),
  and
  [`everything()`](https://tidyselect.r-lib.org/reference/everything.html)).
  We can also use expressions to filter down to the rows we need (e.g.,
  `[colname_1] > 100 & [colname_2] < 50`).

## Value

An object of class `gt_tbl`.

## How to use **gt**'s chemistry notation

The chemistry notation involves a shorthand of writing chemical formulas
and chemical reactions, if needed. It should feel familiar in its basic
usage and the more advanced typesetting tries to limit the amount of
syntax needed. It's always best to show examples on usage:

- `"CH3O2"` and `"(NH4)2S"` will render with subscripted numerals

- Charges can be expressed with terminating `"+"` or `"-"`, as in `"H+"`
  and `"[AgCl2]-"`; if any charges involve the use of a number, the
  following incantations could be used: `"CrO4^2-"`, `"Fe^n+"`,
  `"Y^99+"`, `"Y^{99+}"` (the final two forms produce equivalent output)

- Stoichiometric values can be included with whole values prepending
  formulas (e.g., `"2H2O2"`) or by setting them off with a space, like
  this: `"2 H2O2"`, `"0.5 H2O"`, `"1/2 H2O"`, `"(1/2) H2O"`

- Certain standalone, lowercase letters or combinations thereof will be
  automatically stylized to fit conventions; `"NO_x"` and
  `"x Na(NH4)HPO4"` will have italicized 'x' characters and you can
  always italicize letters by surrounding with `"*"` (as in `"*n* H2O"`
  or `"*n*-C5H12"`)

- Chemical isotopes can be rendered using either of these two
  constructions preceding an element: `"^{227}_{90}Th"` or
  `"^227_90Th"`; nuclides can be represented in a similar manner, here
  are two examples: `"^{0}_{-1}n^{-}"`, `"^0_-1n-"`

- Chemical reactions can use `"+"` signs and a variety of reaction
  arrows: (1) `"A -> B"`, (2) `"A <- B"`, (3) `"A <-> B"`, (4)
  `"A <--> B"`, (5) `"A <=> B"`, (6) `"A <=>> B"`, or (7) `"A <<=> B"`

- Center dots (useful in addition compounds) can be added by using a
  single `"."` or `"*"` character, surrounded by spaces; here are two
  equivalent examples `"KCr(SO4)2 . 12 H2O"` and `"KCr(SO4)2 * 12 H2O"`

- Single and double bonds can be shown by inserting a `"-"` or `"="`
  between adjacent characters (i.e., these shouldn't be at the beginning
  or end of the markup); two examples: `"C6H5-CHO"`, `"CH3CH=CH2"`

- as with units notation, Greek letters can be inserted by surrounding
  the letter name with `":"`; here's an example that describes the delta
  value of carbon-13: `":delta: ^13C"`

## Examples

Let's use the
[`reactions`](https://gt.rstudio.com/reference/reactions.md) dataset and
create a new **gt** table. The table will be filtered down to only a few
rows and columns. The column `cmpd_formula` contains chemical formulas
and the formatting of those will be performed by `fmt_chem()`. Certain
column labels with chemical names (`o3_k298` and `no3_k298`) can be
handled within
[`cols_label()`](https://gt.rstudio.com/reference/cols_label.md) by
using surrounding the text with `"{{%"`/`"%}}"`.

    reactions |>
      dplyr::filter(cmpd_type == "terminal monoalkene") |>
      dplyr::filter(grepl("^1-", cmpd_name)) |>
      dplyr::select(cmpd_name, cmpd_formula, ends_with("k298")) |>
      gt() |>
      tab_header(title = "Gas-phase reactions of selected terminal alkenes") |>
      tab_spanner(
        label = "Reaction Rate Constant at 298 K",
        columns = ends_with("k298")
      ) |>
      fmt_chem(columns = cmpd_formula) |>
      fmt_scientific() |>
      sub_missing() |>
      cols_label(
        cmpd_name = "Alkene",
        cmpd_formula = "Formula",
        OH_k298 = "OH",
        O3_k298 = "{{%O3%}}",
        NO3_k298 = "{{%NO3%}}",
        Cl_k298 = "Cl"
      ) |>
      opt_align_table_header(align = "left")

![This image of a table was generated from the first code example in the
\`fmt_chem()\` help
file.](https://raw.githubusercontent.com/rstudio/gt/master/images/man_fmt_chem_1.png)

Taking just a few rows from the
[`photolysis`](https://gt.rstudio.com/reference/photolysis.md) dataset,
let's create a new **gt** table. The `cmpd_formula` and `products`
columns both contain text in chemistry notation (the first has
compounds, and the second column has the products of photolysis
reactions). These columns will be formatted by `fmt_chem()`. The
compound formulas will be merged with the compound names with
[`cols_merge()`](https://gt.rstudio.com/reference/cols_merge.md).

    photolysis |>
      dplyr::filter(cmpd_name %in% c(
        "hydrogen peroxide", "nitrous acid",
        "nitric acid", "acetaldehyde",
        "methyl peroxide", "methyl nitrate",
        "ethyl nitrate", "isopropyl nitrate"
      )) |>
      dplyr::select(-c(l, m, n, quantum_yield, type)) |>
      gt() |>
      tab_header(title = "Photolysis pathways of selected VOCs") |>
      fmt_chem(columns = c(cmpd_formula, products)) |>
      cols_nanoplot(
        columns = sigma_298_cm2,
        columns_x_vals = wavelength_nm,
        expand_x = c(200, 400),
        new_col_name = "cross_section",
        new_col_label = "Absorption Cross Section",
        options = nanoplot_options(
          show_data_points = FALSE,
          data_line_stroke_width = 4,
          data_line_stroke_color = "black",
          show_data_area = FALSE
        )
      ) |>
      cols_merge(
        columns = c(cmpd_name, cmpd_formula),
        pattern = "{1}, {2}"
      ) |>
      cols_label(
        cmpd_name = "Compound",
        products = "Products"
      ) |>
      opt_align_table_header(align = "left")

![This image of a table was generated from the second code example in
the \`fmt_chem()\` help
file.](https://raw.githubusercontent.com/rstudio/gt/master/images/man_fmt_chem_2.png)

`fmt_chem()` can handle the typesetting of nuclide notation. Let's take
a subset of columns and rows from the
[`nuclides`](https://gt.rstudio.com/reference/nuclides.md) dataset and
make a new **gt** table. The contents of the `nuclide` column contains
isotopes of hydrogen and carbon and this is placed in the table stub.
Using `fmt_chem()` makes it so that the subscripted and superscripted
values are properly formatted to the convention of formatting nuclides.

    nuclides |>
      dplyr::filter(element %in% c("H", "C")) |>
      dplyr::mutate(nuclide = gsub("[0-9]+$", "", nuclide)) |>
      dplyr::select(nuclide, atomic_mass, half_life, decay_1, is_stable) |>
      gt(rowname_col = "nuclide") |>
      tab_header(title = "Isotopes of Hydrogen and Carbon") |>
      tab_stubhead(label = "Isotope") |>
      fmt_chem(columns = nuclide) |>
      fmt_scientific(columns = half_life) |>
      fmt_number(
        columns = atomic_mass,
        decimals = 4,
        scale_by = 1 / 1e6
      ) |>
      sub_missing(
        columns = half_life,
        rows = is_stable,
        missing_text = md("**STABLE**")
      ) |>
      sub_missing(columns = half_life, rows = !is_stable) |>
      sub_missing(columns = decay_1) |>
      data_color(
        columns = decay_1,
        target_columns = c(atomic_mass, half_life, decay_1),
        palette = "LaCroixColoR::PassionFruit",
        na_color = "white"
      ) |>
      cols_label_with(fn = function(x) tools::toTitleCase(gsub("_", " ", x))) |>
      cols_label(decay_1 = "Decay Mode") |>
      cols_width(
        stub() ~ px(70),
        c(atomic_mass, half_life, decay_1) ~ px(120)
      ) |>
      cols_hide(columns = c(is_stable)) |>
      cols_align(align = "center", columns = decay_1) |>
      opt_align_table_header(align = "left") |>
      opt_vertical_padding(scale = 0.5)

![This image of a table was generated from the third code example in the
\`fmt_chem()\` help
file.](https://raw.githubusercontent.com/rstudio/gt/master/images/man_fmt_chem_3.png)

## Function ID

3-21

## Function Introduced

`v0.11.0` (July 9, 2024)

## See also

Other data formatting functions:
[`data_color()`](https://gt.rstudio.com/reference/data_color.md),
[`fmt()`](https://gt.rstudio.com/reference/fmt.md),
[`fmt_auto()`](https://gt.rstudio.com/reference/fmt_auto.md),
[`fmt_bins()`](https://gt.rstudio.com/reference/fmt_bins.md),
[`fmt_bytes()`](https://gt.rstudio.com/reference/fmt_bytes.md),
[`fmt_country()`](https://gt.rstudio.com/reference/fmt_country.md),
[`fmt_currency()`](https://gt.rstudio.com/reference/fmt_currency.md),
[`fmt_date()`](https://gt.rstudio.com/reference/fmt_date.md),
[`fmt_datetime()`](https://gt.rstudio.com/reference/fmt_datetime.md),
[`fmt_duration()`](https://gt.rstudio.com/reference/fmt_duration.md),
[`fmt_email()`](https://gt.rstudio.com/reference/fmt_email.md),
[`fmt_engineering()`](https://gt.rstudio.com/reference/fmt_engineering.md),
[`fmt_flag()`](https://gt.rstudio.com/reference/fmt_flag.md),
[`fmt_fraction()`](https://gt.rstudio.com/reference/fmt_fraction.md),
[`fmt_icon()`](https://gt.rstudio.com/reference/fmt_icon.md),
[`fmt_image()`](https://gt.rstudio.com/reference/fmt_image.md),
[`fmt_index()`](https://gt.rstudio.com/reference/fmt_index.md),
[`fmt_integer()`](https://gt.rstudio.com/reference/fmt_integer.md),
[`fmt_markdown()`](https://gt.rstudio.com/reference/fmt_markdown.md),
[`fmt_number()`](https://gt.rstudio.com/reference/fmt_number.md),
[`fmt_number_si()`](https://gt.rstudio.com/reference/fmt_number_si.md),
[`fmt_partsper()`](https://gt.rstudio.com/reference/fmt_partsper.md),
[`fmt_passthrough()`](https://gt.rstudio.com/reference/fmt_passthrough.md),
[`fmt_percent()`](https://gt.rstudio.com/reference/fmt_percent.md),
[`fmt_roman()`](https://gt.rstudio.com/reference/fmt_roman.md),
[`fmt_scientific()`](https://gt.rstudio.com/reference/fmt_scientific.md),
[`fmt_spelled_num()`](https://gt.rstudio.com/reference/fmt_spelled_num.md),
[`fmt_tf()`](https://gt.rstudio.com/reference/fmt_tf.md),
[`fmt_time()`](https://gt.rstudio.com/reference/fmt_time.md),
[`fmt_units()`](https://gt.rstudio.com/reference/fmt_units.md),
[`fmt_url()`](https://gt.rstudio.com/reference/fmt_url.md),
[`sub_large_vals()`](https://gt.rstudio.com/reference/sub_large_vals.md),
[`sub_missing()`](https://gt.rstudio.com/reference/sub_missing.md),
[`sub_small_vals()`](https://gt.rstudio.com/reference/sub_small_vals.md),
[`sub_values()`](https://gt.rstudio.com/reference/sub_values.md),
[`sub_zero()`](https://gt.rstudio.com/reference/sub_zero.md)
