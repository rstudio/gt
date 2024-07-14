# tab_spanner() ----------------------------------------------------------------
#' Add a spanner label
#'
#' @description
#'
#' With `tab_spanner()`, you can insert a spanner in the column labels part of a
#' **gt** table. This part of the table contains, at a minimum, column labels
#' and, optionally, an unlimited number of levels for spanners. A spanner will
#' occupy space over any number of contiguous column labels and it will have an
#' associated label and ID value. This function allows for mapping to be defined
#' by column names, existing spanner ID values, or a mixture of both. The
#' spanners are placed in the order of calling `tab_spanner()` so if a later call
#' uses the same columns in its definition (or even a subset) as the first
#' invocation, the second spanner will be overlaid atop the first. Options exist
#' for forcibly inserting a spanner underneath other (with `level` as space
#' permits) and with `replace`, which allows for full or partial spanner replacement.
#'
#' @inheritParams fmt_number
#'
#' @param label *Spanner label text*
#'
#'   `scalar<character>` // **required**
#'
#'   The text to use for the spanner label. We can optionally use [md()] or
#'   [html()] to style the text as Markdown or to retain HTML elements
#'   in the text.
#'
#' @param columns *Columns to target*
#'
#'   `<column-targeting expression>` // *default:* `NULL` (`optional`)
#'
#'   The columns to serve as components of the spanner. Can either be a series
#'   of column names provided in `c()`, a vector of column indices, or a select
#'   helper function (e.g. [starts_with()], [ends_with()], [contains()],
#'   [matches()], [num_range()], and [everything()]. This argument works in
#'   tandem with the `spanners` argument.
#'
#' @param spanners *Spanners to target*
#'
#'   `vector<character>` // *default:* `NULL` (`optional`)
#'
#'   The spanners that should be spanned over, should they already be defined.
#'   One or more spanner ID values (in quotes) can be supplied here. This
#'   argument works in tandem with the `columns` argument.
#'
#' @param level *Spanner level for insertion*
#'
#'   `scalar<numeric|integer>` // *default:* `NULL` (`optional`)
#'
#'   An explicit level to which the spanner should be placed. If not provided,
#'   **gt** will choose the level based on the inputs provided within `columns`
#'   and `spanners`, placing the spanner label where it will fit. The first
#'   spanner level (right above the column labels) is `1`.
#'
#'   In combination with [opt_interactive()] or `ihtml.active = TRUE` in
#'   [tab_options()] only level `1` is supported, additional levels would be
#'   discarded.
#'
#' @param id *Spanner ID*
#'
#'   `scalar<character>` // *default:* `label`
#'
#'   The ID for the spanner. When accessing a spanner through the `spanners`
#'   argument of `tab_spanner()` or [cells_column_spanners()] (when using
#'   [tab_style()] or [tab_footnote()]) the `id` value is used as the reference
#'   (and not the `label`). If an `id` is not explicitly provided here, it will
#'   be taken from the `label` value. It is advisable to set an explicit `id`
#'   value if you plan to access this cell in a later function call and the
#'   label text is complicated (e.g., contains markup, is lengthy, or both).
#'   Finally, when providing an `id` value you must ensure that it is unique
#'   across all ID values set for spanner labels (the function will stop if `id`
#'   isn't unique).
#'
#' @param gather *Gather columns together*
#'
#'   `scalar<logical>` // *default:* `TRUE`
#'
#'   An option to move the specified `columns` such that they are unified under
#'   the spanner. Ordering of the moved-into-place columns will be preserved in
#'   all cases. By default, this is set to `TRUE`.
#'
#' @param replace *Replace existing spanners*
#'
#'   `scalar<logical>` // *default:* `FALSE`
#'
#'   Should new spanners be allowed to partially or fully replace existing
#'   spanners? (This is a possibility if setting spanners at an already
#'   populated `level`.) By default, this is set to `FALSE` and an error will
#'   occur if some replacement is attempted.
#'
#' @return An object of class `gt_tbl`.
#'
#' @section Targeting columns with the `columns` argument:
#'
#' The `columns` argument allows us to target a subset of columns contained in
#' the table. We can declare column names in `c()` (with bare column names or
#' names in quotes) or we can use **tidyselect**-style expressions. This can be
#' as basic as supplying a select helper like `starts_with()`, or, providing a
#' more complex incantation like
#'
#' `where(~ is.numeric(.x) && max(.x, na.rm = TRUE) > 1E6)`
#'
#' which targets numeric columns that have a maximum value greater than
#' 1,000,000 (excluding any `NA`s from consideration).
#'
#' @section Details on spanner placement:
#'
#' Let's take a hypothetical table that includes the following column names in
#' order from left to right: `year`, `len.pop`, `m.pop`, `len.dens`, and
#' `m.dens`. We'd like to have some useful spanners, but don't want to have any
#' over the `year` column (so we'll avoid using that column when defining
#' spanners). Let's start by creating a schematic representation of what is
#' wanted in terms of spanners:
#'
#' ```{verbatim}
#'        | ------- `"Two Provinces of Ireland"` ------ <- level 2 spanner
#'        | ---- `"Leinster"` ---- | --- `"Munster"` -- <- level 1 spanners
#' `year` | `len.pop` | `len.dens` | `m.pop` | `m.dens` <- column names
#' ----------------------------------------------------
#' ```
#' To make this arrangement happen, we need three separate calls of
#' `tab_spanner()`:
#'
#' - `tab_spanner(., label = "Leinster", columns = starts_with("len"))`
#' - `tab_spanner(., label = "Munster", columns = starts_with("m"))`
#' - `tab_spanner(., label = "Two Provinces of Ireland", columns = -year)`
#'
#' This will give us the spanners we need with the appropriate labels. The ID
#' values will be derived from the labels in this case, but they can directly
#' supplied via the `id` argument.
#'
#' An important thing to keep aware of is that the order of calls matters. The
#' first two can be in any order but the third one *must* happen last since we
#' build spanners from the bottom up. Also note that the first calls will
#' rearrange columns! This is by design as the `gather = TRUE` default will
#' purposefully gather columns together so that the columns will be united under
#' a single spanner. More complex definitions of spanners can be performed and
#' the *Examples* section demonstrates some of the more advanced calls of
#' `tab_spanner()`.
#'
#' As a final note, the column labels (by default deriving from the column
#' names) will likely need to change and that's especially true in the above
#' case. This can be done with either of [cols_label()] or [cols_label_with()].
#'
#' @section Incorporating units with **gt**'s units notation:
#'
#' Measurement units are often seen as part of spanner labels and indeed it can
#' be much more straightforward to include them here rather than using other
#' devices to make readers aware of units for specific columns. Any text
#' pertaining units is to be defined alongside the spanner label. To do this, we
#' have to surround the portion of text in the label that corresponds to the
#' units definition with `"{{"`/`"}}"`.
#'
#' Now that we know how to mark text for units definition, we know need to know
#' how to write proper units with the notation. Such notation uses a succinct
#' method of writing units and it should feel somewhat familiar though it is
#' particular to the task at hand. Each unit is treated as a separate entity
#' (parentheses and other symbols included) and the addition of subscript text
#' and exponents is flexible and relatively easy to formulate. This is all best
#' shown with a few examples:
#'
#' - `"m/s"` and `"m / s"` both render as `"m/s"`
#' - `"m s^-1"` will appear with the `"-1"` exponent intact
#' - `"m /s"` gives the the same result, as `"/<unit>"` is equivalent to
#'   `"<unit>^-1"`
#' - `"E_h"` will render an `"E"` with the `"h"` subscript
#' - `"t_i^2.5"` provides a `t` with an `"i"` subscript and a `"2.5"` exponent
#' - `"m[_0^2]"` will use overstriking to set both scripts vertically
#' - `"g/L %C6H12O6%"` uses a chemical formula (enclosed in a pair of `"%"`
#'   characters) as a unit partial, and the formula will render correctly with
#'   subscripted numbers
#' - Common units that are difficult to write using ASCII text may be implicitly
#'   converted to the correct characters (e.g., the `"u"` in `"ug"`, `"um"`,
#'   `"uL"`, and `"umol"` will be converted to the Greek *mu* symbol; `"degC"`
#'   and `"degF"` will render a degree sign before the temperature unit)
#' - We can transform shorthand symbol/unit names enclosed in `":"` (e.g.,
#'   `":angstrom:"`, `":ohm:"`, etc.) into proper symbols
#' - Greek letters can added by enclosing the letter name in `":"`; you can
#'   use lowercase letters (e.g., `":beta:"`, `":sigma:"`, etc.) and uppercase
#'   letters too (e.g., `":Alpha:"`, `":Zeta:"`, etc.)
#' - The components of a unit (unit name, subscript, and exponent) can be
#'   fully or partially italicized/emboldened by surrounding text with `"*"` or
#'   `"**"`
#'
#' @section Examples:
#'
#' Let's create a **gt** table using a small portion of the [`gtcars`] dataset.
#' Over several columns (`hp`, `hp_rpm`, `trq`, `trq_rpm`, `mpg_c`, `mpg_h`)
#' we'll use `tab_spanner()` to add a spanner with the label `"performance"`.
#' This effectively groups together several columns related to car performance
#' under a unifying label.
#'
#' ```r
#' gtcars |>
#'   dplyr::select(
#'     -mfr, -trim, bdy_style,
#'     -drivetrain, -trsmn, -ctry_origin
#'   ) |>
#'   dplyr::slice(1:8) |>
#'   gt(rowname_col = "model") |>
#'   tab_spanner(
#'     label = "performance",
#'     columns = c(
#'       hp, hp_rpm, trq, trq_rpm, mpg_c, mpg_h
#'     )
#'   )
#' ```
#'
#' \if{html}{\out{
#' `r man_get_image_tag(file = "man_tab_spanner_1.png")`
#' }}
#'
#' With the default `gather = TRUE` option, columns selected for a particular
#' spanner will be moved so that there is no separation between them. This can
#' be seen with the example below that uses a subset of the [`towny`] dataset.
#' The starting column order is `name`, `latitude`, `longitude`,
#' `population_2016`, `density_2016`, `population_2021`, and `density_2021`. The
#' first two uses of `tab_spanner()` deal with making separate spanners for the
#' two population and two density columns. After their use, the columns are
#' moved to this new ordering: `name`, `latitude`, `longitude`,
#' `population_2016`, `population_2021`, `density_2016`, and `density_2021`. The
#' third and final call of `tab_spanner()` doesn't further affect the ordering
#' of columns.
#'
#' ```r
#' towny |>
#'   dplyr::slice_max(population_2021, n = 5) |>
#'   dplyr::select(
#'     name, latitude, longitude,
#'     ends_with("2016"), ends_with("2021")
#'   ) |>
#'   gt() |>
#'   tab_spanner(
#'     label = "Population",
#'     columns = starts_with("pop")
#'   ) |>
#'   tab_spanner(
#'     label = "Density",
#'     columns = starts_with("den")
#'   ) |>
#'   tab_spanner(
#'     label = md("*Location*"),
#'     columns = ends_with("itude"),
#'     id = "loc"
#'   )
#' ```
#'
#' \if{html}{\out{
#' `r man_get_image_tag(file = "man_tab_spanner_2.png")`
#' }}
#'
#' While columns are moved, it is only the minimal amount of moving required
#' (pulling in columns from the right) to ensure that columns are gathered under
#' the appropriate spanners. With the last call, there are two more things to
#' note: (1) `label` values can use the [md()] (or [html()]) helper functions to
#' help create styled text, and (2) an `id` value may be supplied for reference
#' later (e.g., for styling with [tab_style()] or applying footnotes with
#' [tab_footnote()]).
#'
#' It's possible to stack multiple spanners atop each other with consecutive
#' calls of `tab_spanner()`. It's a bit like playing Tetris: putting a spanner
#' down anywhere there is another spanner (i.e., there are one or more shared
#' columns) means that second spanner will reside a level above the prior. Let's
#' look at a few examples to see how this works, and we'll also explore a few
#' lesser-known placement tricks. We'll use a cut down version of [`exibble`]
#' for this, set up a few level-`1` spanners, and then place a level-`2` spanner
#' over two other spanners.
#'
#' ```r
#' exibble_narrow <- exibble |> dplyr::slice_head(n = 3)
#'
#' exibble_narrow |>
#'   gt() |>
#'   tab_spanner(
#'     label = "Row Information",
#'     columns = c(row, group)
#'   ) |>
#'   tab_spanner(
#'     label = "Numeric Values",
#'     columns = where(is.numeric),
#'     id = "num_spanner"
#'   ) |>
#'   tab_spanner(
#'     label = "Text Values",
#'     columns = c(char, fctr),
#'     id = "text_spanner"
#'   ) |>
#'   tab_spanner(
#'     label = "Numbers and Text",
#'     spanners = c("num_spanner", "text_spanner")
#'   )
#' ```
#'
#' \if{html}{\out{
#' `r man_get_image_tag(file = "man_tab_spanner_3.png")`
#' }}
#'
#' In the above example, we used the `spanners` argument to define where the
#' `"Numbers and Text"`-labeled spanner should reside. For that, we supplied the
#' `"num_spanner"` and `"text_spanner"` ID values for the two spanners
#' associated with the `num`, `currency`, `char`, and `fctr` columns.
#' Alternatively, we could have given those column names to the `columns`
#' argument and achieved the same result. You could actually use a combination
#' of `spanners` and `columns` to define where the spanner should be placed.
#' Here is an example of just that:
#'
#' ```r
#' exibble_narrow_gt <-
#'   exibble_narrow |>
#'   gt() |>
#'   tab_spanner(
#'     label = "Numeric Values",
#'     columns = where(is.numeric),
#'     id = "num_spanner"
#'   ) |>
#'   tab_spanner(
#'     label = "Text Values",
#'     columns = c(char, fctr),
#'     id = "text_spanner"
#'   ) |>
#'   tab_spanner(
#'     label = "Text, Dates, Times, Datetimes",
#'     columns = contains(c("date", "time")),
#'     spanners = "text_spanner"
#'   )
#'
#' exibble_narrow_gt
#' ```
#'
#' \if{html}{\out{
#' `r man_get_image_tag(file = "man_tab_spanner_4.png")`
#' }}
#'
#' And, again, we could have solely supplied all of the column names to
#' `columns` instead of using this hybrid approach, but it is interesting to
#' express the definition of spanners with this flexible combination.
#'
#' What if you wanted to extend the above example and place a spanner above the
#' `date`, `time`, and `datetime` columns? If you tried that in the manner as
#' exemplified above, the spanner will be placed in the third level of spanners:
#'
#' ```r
#' exibble_narrow_gt |>
#'   tab_spanner(
#'     label = "Date and Time Columns",
#'     columns = contains(c("date", "time")),
#'     id = "date_time_spanner"
#'   )
#' ```
#'
#' \if{html}{\out{
#' `r man_get_image_tag(file = "man_tab_spanner_5.png")`
#' }}
#'
#' Remember that the approach taken by `tab_spanner()` is to keep stacking atop
#' existing spanners. But, there is space next to the `"Text Values"` spanner on
#' the first level. You can either revise the order of `tab_spanner()` calls,
#' or, use the `level` argument to force the spanner into that level (so long
#' as there is space).
#'
#' ```r
#' exibble_narrow_gt |>
#'   tab_spanner(
#'     label = "Date and Time Columns",
#'     columns = contains(c("date", "time")),
#'     level = 1,
#'     id = "date_time_spanner"
#'   )
#' ```
#'
#' \if{html}{\out{
#' `r man_get_image_tag(file = "man_tab_spanner_6.png")`
#' }}
#'
#' That puts the spanner in the intended level. If there aren't free locations
#' available in the `level` specified you'll get an error stating which columns
#' cannot be used for the new spanner (this can be circumvented, if necessary,
#' with the `replace = TRUE` option). If you choose a level higher than the
#' maximum occupied, then the spanner will be dropped down. Again, these
#' behaviors are indicative of Tetris-like rules which tend to work well for the
#' application of spanners.
#'
#' Using a subset of the [`towny`] dataset, we can create an interesting **gt**
#' table. First, only certain columns are selected from the dataset, some
#' filtering of rows is done, rows are sorted, and then only the first 10 rows
#' are kept. After the data is introduced to [gt()], we then apply some spanner
#' labels using two calls of [tab_spanner()]. In the second of those, we
#' incorporate unit notation text (within `"{{"`/`"}}"`) in the `label` to get a
#' display of nicely-formatted units.
#'
#' ```r
#' towny |>
#'   dplyr::select(
#'     name, ends_with(c("2001", "2006")), matches("2001_2006")
#'   ) |>
#'   dplyr::filter(population_2001 > 100000) |>
#'   dplyr::slice_max(pop_change_2001_2006_pct, n = 10) |>
#'   gt() |>
#'   fmt_integer() |>
#'   fmt_percent(columns = matches("change"), decimals = 1) |>
#'   tab_spanner(
#'     label = "Population",
#'     columns = starts_with("population")
#'   ) |>
#'   tab_spanner(
#'     label = "Density, {{*persons* km^-2}}",
#'     columns = starts_with("density")
#'   ) |>
#'   cols_label(
#'     ends_with("01") ~ "2001",
#'     ends_with("06") ~ "2006",
#'     matches("change") ~ md("Population Change,<br>2001 to 2006")
#'   ) |>
#'   cols_width(everything() ~ px(120))
#' ```
#'
#' \if{html}{\out{
#' `r man_get_image_tag(file = "man_tab_spanner_7.png")`
#' }}
#'
#' @family part creation/modification functions
#' @section Function ID:
#' 2-2
#'
#' @section Function Introduced:
#' `v0.2.0.5` (March 31, 2020)
#'
#' @seealso [tab_spanner_delim()] to create spanners and new column labels with
#'   delimited column names.
#'
#' @export
tab_spanner <- function(
    data,
    label,
    columns = NULL,
    spanners = NULL,
    level = NULL,
    id = label,
    gather = TRUE,
    replace = FALSE
) {

  # Perform input object validation
  stop_if_not_gt_tbl(data = data)

  present_spanner_ids <- dt_spanners_get_ids(data = data)

  # Get the columns supplied in `columns` as a character vector
  column_names <-
    resolve_cols_c(
      expr = {{ columns }},
      data = data,
      null_means = "nothing"
    )

  # Get the spanner IDs supplied in `spanners` as a character vector
  spanner_id_idx <-
    tidyselect::with_vars(
      vars = present_spanner_ids,
      expr = spanners
    )

  # Stop function if `level` is provided and is less than `1`
  if (!is.null(level) && level < 1) {
    cli::cli_abort(c(
      "A spanner level of {level} cannot be set.",
      "*" = "Please choose a `level` value greater than or equal to `1`."
    ))
  }

  if (is.numeric(spanner_id_idx)) {

    spanner_ids <- present_spanner_ids[spanner_id_idx]

  } else {

    if (
      !is.null(spanner_id_idx) &&
      !all(spanner_id_idx %in% present_spanner_ids)
    ) {

      error_vars <-
        base::setdiff(spanner_id_idx, present_spanner_ids)

      cli::cli_abort(
        "One or more spanner ID(s) supplied in `spanners` ({error_vars}),
        for the new spanner with the ID `{id}` doesn't belong to any
        existing spanners."
      )
    }

    spanner_ids <- spanner_id_idx
  }

  # If `column_names` and `spanner_ids` have zero lengths then
  # return the data unchanged
  if (length(column_names) < 1 && length(spanner_ids) < 1) {
    return(data)
  }

  # Check new `id` against existing `id` values across column labels
  # and spanner labels and stop if necessary
  check_spanner_id_unique(data = data, spanner_id = id)

  # Resolve the `column_names` that new spanner will span over
  column_names <-
    resolve_spanned_column_names(
      data = data,
      column_names = column_names,
      spanner_ids = spanner_ids
    )

  # Resolve the `level` of the new spanner
  level <-
    resolve_spanner_level(
      data = data,
      column_names = column_names,
      level = level
    )

  if (grepl("\\{\\{.*?\\}\\}", label)) {

    spanner_units <- gsub("^.*?(\\{\\{.*?\\}\\}).*?$", "\\1", label)
    spanner_pattern <- ""

  } else {

    spanner_units <- NA_character_
    spanner_pattern <- NA_character_
  }

  # Add the spanner to the `_spanners` table
  data <-
    dt_spanners_add(
      data = data,
      vars = column_names,
      spanner_label = label,
      spanner_units = spanner_units,
      spanner_pattern = spanner_pattern,
      spanner_id = id,
      spanner_level = level,
      gather = gather,
      replace = replace
    )

  # Move columns into place with `cols_move()` only if specific
  # conditions are met:
  # - `gather` should be TRUE
  # - `spanner_ids` should be empty
  # - `level` is NULL or `1`
  if (
    gather &&
    length(spanner_ids) < 1 &&
    (is.null(level) || level == 1)
  ) {

    data <-
      cols_move(
        data = data,
        columns = dplyr::all_of(column_names),
        after = column_names[1]
      )
  }

  data
}


# tab_spanner_delim() ----------------------------------------------------------
#' Create column labels and spanners via delimited column names
#'
#' @description
#'
#' `tab_spanner_delim()` can take specially-crafted column names and generate
#' one or more spanners (and revise column labels at the same time). This is
#' done by splitting the column name by the specified delimiter text (`delim`)
#' and placing the fragments from top to bottom (i.e., higher-level spanners to
#' the column labels) or vice versa. Furthermore, neighboring text fragments on
#' different spanner levels that have the same text will be coalesced together.
#' For instance, having the three side-by-side column names `rating_1`,
#' `rating_2`, and `rating_3` will (in the default case at least) result in a
#' spanner with the label `"rating"` above columns with the labels `"1"`, `"2"`,
#' and `"3"`. There are many options in `cols_spanner_delim()` to slice and dice
#' delimited column names in different ways:
#'
#' - delimiter text: choose the delimiter text to use for the fragmentation of
#' column names into spanners with the `delim` argument
#' - direction and amount of splitting: we can choose to split *n* times
#' according to a `limit` argument, and, we get to specify from which side of
#' the column name the splitting should commence
#' - reversal of fragments: we can reverse the order the fragments we get from
#' the splitting procedure with the `reverse` argument
#' - column constraints: it's possible to constrain which columns in a **gt**
#' table should participate in spanner creation using vectors or
#' **tidyselect**-style expressions
#'
#' @inheritParams tab_spanner
#'
#' @param delim *Delimiter for splitting*
#'
#'   `scalar<character>` // **required**
#'
#'   The delimiter text to use to split one of more column names (i.e., those
#'   that are targeted via the `columns` argument).
#'
#' @param columns *Columns to target*
#'
#'   `<column-targeting expression>` // *default:* `everything()`
#'
#'   The columns to consider for the splitting, relabeling, and spanner setting
#'   operations. Can either be a series of column names provided in `c()`, a
#'   vector of column indices, or a select helper function (e.g. [starts_with()],
#'   [ends_with()], [contains()], [matches()], [num_range()], and [everything()]).
#'
#' @param split *Splitting side*
#'
#'   `singl-kw:[last|first]` // *default:* `"last"`
#'
#'   Should the delimiter splitting occur from the `"last"` instance of the
#'   `delim` character or from the `"first"`? The default here uses the `"last"`
#'   keyword, and splitting begins at the last instance of the delimiter in the
#'   column name. This option only has some consequence when there is a `limit`
#'   value applied that is lesser than the number of delimiter characters for a
#'   given column name (i.e., number of splits is not the maximum possible
#'   number).
#'
#' @param limit *Limit for splitting*
#'
#'   `scalar<numeric|integer|character>` // *default:* `NULL` (`optional`)
#'
#'   An optional limit to place on the splitting procedure. The default `NULL`
#'   means that a column name will be split as many times are there are
#'   delimiter characters. In other words, the default means there is no limit.
#'   If an integer value is given to `limit` then splitting will cease at the
#'   iteration given by `limit`. This works in tandem with `split` since we can
#'   adjust the number of splits from either the right side (`split = "last"`)
#'   or left side (`split = "first"`) of the column name.
#'
#' @param reverse *Reverse vector of split names*
#'
#'   `scalar<logical>` // *default:* `FALSE`
#'
#'   Should the order of split names be reversed? By default, this is `FALSE`.
#'
#' @return An object of class `gt_tbl`.
#'
#' @section Details on column splitting:
#'
#' If we take a hypothetical table that includes the column names
#' `province.NL_ZH.pop`, `province.NL_ZH.gdp`, `province.NL_NH.pop`, and
#' `province.NL_NH.gdp`, we can see that we have a naming system that has a
#' well-defined structure. We start with the more general to the left
#' (`"province"`) and move to the more specific on the right (`"pop"`). If the
#' columns are in the table in this exact order, then things are in an ideal
#' state as the eventual spanner labels will form from this neighboring.
#' When using `tab_spanner_delim()` here with `delim` set as `"."` we get the
#' following text fragments:
#'
#' - `province.NL_ZH.pop` -> `"province"`, `"NL_ZH"`, `"pop"`
#' - `province.NL_ZH.gdp` -> `"province"`, `"NL_ZH"`, `"gdp"`
#' - `province.NL_NH.pop` -> `"province"`, `"NL_NH"`, `"pop"`
#' - `province.NL_NH.gdp` -> `"province"`, `"NL_NH"`, `"gdp"`
#'
#' This gives us the following arrangement of column labels and spanner labels:
#'
#' ```{verbatim}
#' --------- `"province"` ---------- <- level 2 spanner
#' ---`"NL_ZH"`--- | ---`"NL_NH"`--- <- level 1 spanners
#' `"pop"`|`"gdp"` | `"pop"`|`"gdp"` <- column labels
#' ---------------------------------
#' ```
#'
#' There might be situations where the same delimiter is used throughout but
#' only the last instance requires a splitting. With a pair of column names like
#' `north_holland_pop` and `north_holland_area` you would only want `"pop"` and
#' `"area"` to be column labels underneath a single spanner (`"north_holland"`).
#' To achieve this, the `split` and `limit` arguments are used and the values
#' for each need to be `split = "last"` and `limit = 1`. This will give us
#' the following arrangement:
#'
#' ```{verbatim}
#' --`"north_holland"`-- <- level 1 spanner
#'  `"pop"`  |  `"area"` <- column labels
#' ---------------------
#' ```
#'
#' @section Examples:
#'
#' With a subset of the [`towny`] dataset, we can create a **gt** table and then
#' use `tab_spanner_delim()` to automatically generate column spanner labels.
#' In this case we have some column names in the form `population_<year>`.
#' The underscore character is the delimiter that separates a common word
#' `"population"` and a year value. In this default way of splitting, fragments
#' to the right are lowest (really they become new column labels) and moving
#' left we get spanners. Let's have a look at how `tab_spanner_delim()` handles
#' these column names:
#'
#' ```r
#' towny_subset_gt <-
#'   towny |>
#'   dplyr::select(name, starts_with("population")) |>
#'   dplyr::filter(grepl("^F", name)) |>
#'   gt() |>
#'   tab_spanner_delim(delim = "_") |>
#'   fmt_integer()
#'
#' towny_subset_gt
#' ```
#'
#' \if{html}{\out{
#' `r man_get_image_tag(file = "man_tab_spanner_delim_1.png")`
#' }}
#'
#' The spanner created through this use of `tab_spanner_delim()` is
#' automatically given an ID value by **gt**. Because it's hard to know what the
#' ID value is, we can use [tab_info()] to inspect the table's indices and ID
#' values.
#'
#' ```r
#' towny_subset_gt |> tab_info()
#' ```
#'
#' \if{html}{\out{
#' `r man_get_image_tag(file = "man_tab_spanner_delim_2.png")`
#' }}
#'
#' From this informational table, we see that the ID for the spanner is
#' `"spanner-population_1996"`. Also, the columns are still accessible by the
#' original column names (`tab_spanner_delim()` did change their labels though).
#' Let's use [tab_style()] along with [cells_column_spanners()] to add some
#' styling to the spanner label of the `towny_subset_gt` table.
#'
#' ```r
#' towny_subset_gt |>
#'   tab_style(
#'     style = cell_text(weight = "bold", transform = "capitalize"),
#'     locations = cells_column_spanners(spanners = "spanner-population_1996")
#'   )
#' ```
#'
#' \if{html}{\out{
#' `r man_get_image_tag(file = "man_tab_spanner_delim_3.png")`
#' }}
#'
#' We can plan ahead a bit and refashion the column names with **dplyr** before
#' introducing the table to [gt()] and `tab_spanner_delim()`. Here the column
#' labels have underscore delimiters where splitting is not wanted (so a period
#' or space character is used instead). The usage of `tab_spanner_delim()` gives
#' two levels of spanners. We can further touch up the labels after that with
#' [cols_label_with()] and [text_transform()].
#'
#' ```r
#' towny |>
#'   dplyr::slice_max(population_2021, n = 5) |>
#'   dplyr::select(name, ends_with("pct")) |>
#'   dplyr::rename_with(
#'     .fn = function(x) {
#'       x |>
#'         sub("pop_change_", "Population Change.", x = _) |>
#'         sub("_pct", ".pct", x = _)
#'     }
#'   ) |>
#'   gt(rowname_col = "name") |>
#'   tab_spanner_delim(delim = ".") |>
#'   fmt_number(decimals = 1, scale_by = 100) |>
#'   cols_label_with(
#'     fn = function(x) gsub("pct", "%", x)
#'   ) |>
#'   text_transform(
#'     fn = function(x) gsub("_", " - ", x, fixed = TRUE),
#'     locations = cells_column_spanners()
#'   ) |>
#'   tab_style(
#'     style = cell_text(align = "center"),
#'     locations = cells_column_labels()
#'   ) |>
#'   tab_style(
#'     style = "padding-right: 36px;",
#'     locations = cells_body()
#'   )
#' ```
#'
#' \if{html}{\out{
#' `r man_get_image_tag(file = "man_tab_spanner_delim_4.png")`
#' }}
#'
#' With a summarized, filtered, and pivoted version of the [`pizzaplace`]
#' dataset, we can create another **gt** table and then use `tab_spanner_delim()`
#' with the delimiter/separator also used in `tidyr::pivot_wider()`. We can also
#' process the generated column labels with [cols_label_with()].
#'
#' ```r
#' pizzaplace |>
#'   dplyr::select(name, date, type, price) |>
#'   dplyr::group_by(name, date, type) |>
#'   dplyr::summarize(
#'     revenue = sum(price),
#'     sold = dplyr::n(),
#'     .groups = "drop"
#'   ) |>
#'   dplyr::filter(date %in% c("2015-01-01", "2015-01-02", "2015-01-03")) |>
#'   dplyr::filter(type %in% c("classic", "veggie")) |>
#'   tidyr::pivot_wider(
#'     names_from = date,
#'     names_sep = ".",
#'     values_from = c(revenue, sold),
#'     values_fn = sum,
#'     names_sort = TRUE
#'   ) |>
#'   gt(rowname_col = "name", groupname_col = "type") |>
#'   tab_spanner_delim(delim = ".") |>
#'   sub_missing(missing_text = "") |>
#'   fmt_currency(columns = starts_with("revenue")) |>
#'   data_color(
#'     columns = starts_with("revenue"),
#'     method = "numeric",
#'     palette = c("white", "lightgreen")
#'   ) |>
#'   cols_label_with(
#'     fn = function(x) {
#'       paste0(x, " (", vec_fmt_datetime(x, format = "E"), ")")
#'     }
#'   )
#' ```
#'
#' \if{html}{\out{
#' `r man_get_image_tag(file = "man_tab_spanner_delim_5.png")`
#' }}
#'
#' @family part creation/modification functions
#' @section Function ID:
#' 2-3
#'
#' @section Function Introduced:
#' `v0.2.0.5` (March 31, 2020)
#'
#' @seealso [tab_spanner()] to manually create spanners with more control over
#'   spanner labels.
#'
#' @export
tab_spanner_delim <- function(
    data,
    delim,
    columns = everything(),
    split = c("last", "first"),
    limit = NULL,
    reverse = FALSE
) {

  # Perform input object validation
  stop_if_not_gt_tbl(data = data)

  # Ensure that arguments are matched
  split <- rlang::arg_match(split)

  # Perform various input checks for `limit` if it is provided
  check_number_whole(limit, min = 1, allow_null = TRUE, allow_infinite = FALSE)

  # Perform checks on `delim`
  check_string(delim, allow_empty = FALSE)

  # Get all of the columns in the dataset
  all_cols <- dt_boxhead_get_vars(data = data)

  # Get the columns supplied in `columns` as a character vector
  columns <-
    suppressWarnings(
      resolve_cols_c(
        expr = {{ columns }},
        data = data
      )
    )

  if (!is.null(columns)) {
    colnames_spanners <- base::intersect(all_cols, columns)
  } else {
    colnames_spanners <- all_cols
  }

  if (length(colnames_spanners) == 0) {
    return(data)
  }

  colnames_spanners_ordered <- colnames_spanners

  #
  # Determine the highest spanner level from these column names
  #

  max_level <-
    max(
      vapply(
        colnames_spanners_ordered,
        FUN.VALUE = integer(1), FUN = function(x) {
          length(
            str_split_across(
              x,
              delim = delim,
              n = limit,
              split = split,
              reverse = reverse
            )
          )
        }
      ),
      na.rm = TRUE
    )

  #
  # Create a matrix representation of the spanners
  #

  spanner_matrix <- matrix(data = NA_character_, nrow = max_level, ncol = 0)

  for (col in all_cols) {

    if (col %in% colnames_spanners) {

      col_name <- colnames_spanners_ordered[colnames_spanners %in% col]

      elements <-
        str_split_across(
          x = col_name,
          delim = delim,
          n = limit,
          split = split,
          reverse = reverse
        )

      elements_n <- length(elements)

      matrix_col_i <-
        matrix(
          c(rep(NA_character_, max_level - elements_n), elements),
          ncol = 1
        )

    } else {

      matrix_col_i <- matrix(c(rep(NA_character_, max_level - 1), col))
    }

    spanner_matrix <- cbind(spanner_matrix, matrix_col_i)
  }

  # If the height of the spanner matrix isn't greater than
  # one then return the data untouched
  if (nrow(spanner_matrix) == 1) {
    return(data)
  }

  for (i in rev(seq_len(nrow(spanner_matrix)))) {

    if (i == nrow(spanner_matrix)) next

    level <- nrow(spanner_matrix) - i

    rle_spanners_i <- rle(spanner_matrix[i, ])
    spanners_i_lengths <- rle_spanners_i$lengths
    spanners_i_values <- rle_spanners_i$values
    spanners_i_col_i <- utils::head(cumsum(c(1, spanners_i_lengths)), -1)

    spanner_id_vals <- c()

    for (j in seq_along(spanners_i_lengths)) {

      if (!is.na(spanners_i_values[j])) {

        # Construct the ID for the spanner from the spanner matrix
        spanner_id <-
          paste0(
            "spanner-",
            paste(
              spanner_matrix[seq(i, nrow(spanner_matrix)), spanners_i_col_i[j]],
              collapse = delim
            )
          )

        # Modify `spanner_id` to not collide with any other values
        if (spanner_id %in% spanner_id_vals) {

          if (grepl("^spanner-", spanner_id)) {

            # Add number to spanner ID values on first duplication
            spanner_id <- gsub("^spanner-", "spanner:1-", spanner_id)
          }

          while (spanner_id %in% spanner_id_vals) {

            # Increment number to spanner ID values on subsequent duplications
            idx_str <- gsub("^spanner:([0-9]+)-.*", "\\1", spanner_id)
            idx_int <- as.integer(idx_str)
            spanner_id <- gsub("^(spanner:)[0-9]+(-.*)", paste0("\\1", idx_int + 1, "\\2"), spanner_id)
          }
        }

        spanner_id_vals <- unique(c(spanner_id_vals, spanner_id))

        spanner_columns <-
          seq(
            spanners_i_col_i[j],
            spanners_i_col_i[j] + spanners_i_lengths[j] - 1
          )

        # Set the spanner with a call to `tab_spanner()`
        data <-
          tab_spanner(
            data = data,
            label = spanners_i_values[j],
            columns = spanner_columns,
            spanners = NULL,
            level = level,
            id = spanner_id,
            gather = FALSE
          )
      }
    }
  }

  #
  # Re-label column labels included in `colnames_spanners`
  #

  new_labels <- spanner_matrix[nrow(spanner_matrix), ]
  new_label_list <- stats::setNames(as.list(new_labels), all_cols)

  #
  # Merge any column labels previously set by `cols_label()`
  #

  boxh <- dt_boxhead_get(data = data)

  old_label_list <- as.list(boxh$column_label)
  names(old_label_list) <- boxh$var

  for (name in names(new_label_list)) {

    if (!(name %in% names(old_label_list))) next

    if (
      !is.character(old_label_list[[name]]) ||
      (
        is.character(old_label_list[[name]]) &&
        old_label_list[[name]] != name
      )
    ) {
      new_label_list[[name]] <- old_label_list[[name]]
    }
  }

  # Conclude by invoking `cols_label()` on the data
  cols_label(data, .list = new_label_list)
}

str_split_across <- function(
    x,
    delim,
    n = NULL,
    split = "last",
    reverse = FALSE
) {

  delim_width <- nchar(delim)

  if (is.null(n)) {

    x_split <- unlist(strsplit(x, split = delim, fixed = TRUE))

    if (reverse) {
      x_split <- rev(x_split)
    }

    # Remove empty strings
    x_split <- x_split[x_split != ""]

    if (length(x_split) < 1) {
      x_split <- x
    }

    return(x_split)
  }

  x_delim_chars <-
    as.integer(
      unlist(gregexpr(pattern = delim, text = x, fixed = TRUE)[[1]])
    )

  if (length(x_delim_chars) == 1 && x_delim_chars == -1) {
    return(x)
  }

  x_split <- x

  for (i in seq_len(n)) {
    if (split == "last") {

      x_split_i <- x_split[1]
      x_split <- x_split[-1]

      delim_chars <-
        as.integer(
          unlist(gregexpr(pattern = delim, text = x_split_i, fixed = TRUE)[[1]])
        )

      if (length(delim_chars) == 1 && delim_chars == -1) break

      split_delim <- max(delim_chars)

      x_split_n <- nchar(x_split_i)
      x_split_1 <- substr(x_split_i, start = 1, stop = split_delim - 1)
      x_split_2 <- substr(x_split_i, start = split_delim + delim_width, x_split_n)

      x_split <- c(x_split_1, x_split_2, x_split)

    } else {

      x_split_i <- x_split[length(x_split)]
      x_split <- x_split[-length(x_split)]

      delim_chars <-
        as.integer(
          unlist(gregexpr(pattern = delim, text = x_split_i, fixed = TRUE)[[1]])
        )

      if (length(delim_chars) == 1 && delim_chars == -1) break

      split_delim <- min(delim_chars)

      x_split_n <- nchar(x_split_i)
      x_split_1 <- substr(x_split_i, start = 1, stop = split_delim - 1)
      x_split_2 <- substr(x_split_i, start = split_delim + delim_width, x_split_n)

      x_split <- c(x_split, x_split_1, x_split_2)
    }

    if (length(delim_chars) == 1) break
  }

  if (reverse) {
    x_split <- rev(x_split)
  }

  # Remove empty strings
  x_split <- x_split[x_split != ""]

  if (length(x_split) < 1) {
    x_split <- x
  }

  x_split
}

# rm_spanners() ----------------------------------------------------------------

#' Remove column spanner labels
#'
#' @description
#'
#' If you would like to remove column spanner labels then the `rm_spanners()`
#' function can make this possible. Column spanner labels appear above the
#' column labels and can occupy several levels via stacking either through
#' [tab_spanner()] or [tab_spanner_delim()]. Spanner column labels are
#' distinguishable and accessible by their ID values.
#'
#' This function for removal is useful if you have received a **gt** table
#' (perhaps through an API that returns **gt** objects) but would prefer that
#' some or all of the column spanner labels be removed. This function is safe to
#' use even if there are no column spanner labels in the input `gt_tbl` object
#' so long as select helpers (such as the default `everything()`) are used
#' instead of explicit ID values.
#'
#' @inheritParams rm_header
#'
#' @param spanners *Spanners to remove*
#'
#'   `<spanner-targeting expression>` // *default:* `everything()`
#'
#'   A specification of which spanner column labels should be removed. Those to
#'   be removed can be given as a vector of spanner ID values (every spanner
#'   column label has one, either set by the user or by **gt** when using
#'   [tab_spanner_delim()]). A select helper can also be used and, by default,
#'   this is `everything()` (whereby all spanner column labels will be removed).
#'
#' @param levels *Spanner levels to remove*
#'
#'   `scalar<numeric|integer>` // *default:* `NULL` (`optional`)
#'
#'   Instead of removing spanner column labels by ID values, entire levels of
#'   spanners can instead be removed. Supply a numeric vector of level values
#'   (the first level is `1`) and, if they are present, they will be removed.
#'   Any input given to `level` will mean that `spanners` is ignored.
#'
#' @return An object of class `gt_tbl`.
#'
#' @section Examples:
#'
#' Use a portion of the [`gtcars`] dataset to create a **gt** table. With
#' [tab_spanner()], we can group several related columns together under a
#' spanner column. In this example, that is done with several [tab_spanner()]
#' calls in order to create two levels of spanner column labels.
#'
#' ```r
#' gt_tbl <-
#'   gtcars |>
#'   dplyr::select(
#'     -mfr, -trim, bdy_style, drivetrain,
#'     -drivetrain, -trsmn, -ctry_origin
#'   ) |>
#'   dplyr::slice(1:8) |>
#'   gt(rowname_col = "model") |>
#'   tab_spanner(label = "HP", columns = c(hp, hp_rpm)) |>
#'   tab_spanner(label = "Torque", columns = c(trq, trq_rpm)) |>
#'   tab_spanner(label = "MPG", columns = c(mpg_c, mpg_h)) |>
#'   tab_spanner(
#'     label = "Performance",
#'     columns = c(
#'       hp, hp_rpm, trq, trq_rpm,
#'       mpg_c, mpg_h
#'     )
#'   )
#'
#' gt_tbl
#' ```
#'
#' \if{html}{\out{
#' `r man_get_image_tag(file = "man_rm_spanners_1.png")`
#' }}
#'
#' If you decide that you don't want any of the spanners in the `gt_tbl` object,
#' they can all be removed with `rm_spanners()`.
#'
#' ```r
#' rm_spanners(data = gt_tbl)
#' ```
#'
#' \if{html}{\out{
#' `r man_get_image_tag(file = "man_rm_spanners_2.png")`
#' }}
#'
#' Individual spanner column labels can be removed by ID value. In all the above
#' uses of [tab_spanner()], the `label` value *is* the ID value (you can
#' alternately set a different ID value though the `id` argument). Let's remove
#' the `"HP"` and `"MPG"` spanner column labels with `rm_spanners()`.
#'
#' ```r
#' rm_spanners(data = gt_tbl, spanners = c("HP", "MPG"))
#' ```
#'
#' \if{html}{\out{
#' `r man_get_image_tag(file = "man_rm_spanners_3.png")`
#' }}
#'
#' We can also remove spanner column labels by level with `rm_spanners()`.
#' Provide a vector of one or more values greater than or equal to `1` (the
#' first level starts there). In the next example, we'll remove the first level
#' of spanner column labels. Any levels not being removed will collapse down
#' accordingly.
#'
#' ```r
#' rm_spanners(data = gt_tbl, levels = 1)
#' ```
#'
#' \if{html}{\out{
#' `r man_get_image_tag(file = "man_rm_spanners_4.png")`
#' }}
#'
#' @family part removal functions
#' @section Function ID:
#' 7-3
#'
#' @section Function Introduced:
#' `v0.8.0` (November 16, 2022)
#'
#' @export
rm_spanners <- function(
    data,
    spanners = everything(),
    levels = NULL
) {

  # Perform input object validation
  stop_if_not_gt_tbl(data = data)

  # Obtain the spanners table (may be an empty table if no spanners
  # have been produced by `tab_spanner()` or `tab_spanner_delim`)
  spanners_tbl <- dt_spanners_get(data = data)

  # Obtain the number of rows within the spanners table; this may be
  # zero but the number indicates the number of distinct spanners
  spanners_count <- nrow(spanners_tbl)

  # If there are no spanners, return the gt object unchanged
  if (spanners_count < 1) {
    return(data)
  }

  # Get a vector of integer values that indicates which spanners
  # in the `spanners_tbl` are to be targeted for removal; this
  # uses tidyselect and will error if character values are provided
  # and they don't all correspond to `spanner_id` values of
  # the `spanners_tbl`
  if (is.null(levels)) {

    spanners_i <-
      as.integer(
        resolve_vector_i(
          expr = {{ spanners }},
          vector = spanners_tbl[["spanner_id"]],
          "spanner"
        )
      )

    remove_by <- "id"

  } else {

    # Ensure that `levels` is numeric vector
    if (!is.numeric(levels)) {
      cli::cli_abort(
        "If using {.arg levels} to remove spanners, it must be a numeric vector."
      )
    }

    # Transform the `levels` vector to an integer vector
    spanners_i <- as.integer(levels)

    remove_by <- "level"
  }

  # In cases where a select helper is used and there are no
  # integer values in the resultant vector, return the gt
  # object unchanged
  if (length(spanners_i) < 1) {
    return(data)
  }

  # Given that the `spanners_i` vector is not empty and
  # corresponds to row indices in `spanners_tbl`, use that
  # integer vector to remove components (i.e., spanners)
  # from `spanners_tbl`
  if (remove_by == "id") {
    spanners_tbl <- spanners_tbl[-spanners_i, ]
  }

  # If `levels` was used then the `spanner_tbl` will undergo
  # a filtering via those values in the `spanner_level` column
  if (remove_by == "level") {
    spanners_tbl <- spanners_tbl[!(spanners_tbl$spanner_level %in% spanners_i), ]
  }

  # We may either obtain an empty or non-empty `spanners_tbl`;
  # in the first case, re-initialize the spanners table component and,
  # in the latter case, set the changed `spanners_tbl` within
  # the gt object
  if (nrow(spanners_tbl) < 1) {
    data <- dt_spanners_init(data = data)
  } else {
    data <- dt_spanners_set(data = data, spanners = spanners_tbl)
  }

  data
}

# Helpers spanners -------------------------------------------------------------
resolve_spanner_level <- function(
    data,
    column_names,
    level
) {

  # If explicitly providing a `level` simply return that value
  if (!is.null(level)) {
    return(as.integer(level))
  }

  # Determine if there are any existing spanners
  any_existing_spanners <- dt_spanners_exists(data = data)

  # If there aren't any existing spanners, then the new spanner
  # level will always be `1`
  if (!any_existing_spanners) {
    return(1L)
  }

  # Get the present `spanners_tbl`
  spanners_tbl <- dt_spanners_get(data = data)

  highest_level <- 0L
  spanner_cols <- c("spanner_id", "vars", "spanner_level")
  spanners_tbl <- spanners_tbl[ , spanner_cols, drop = FALSE]

  cnd_highest_level <-
    vapply(
      spanners_tbl$vars,
      FUN.VALUE = logical(1L),
      FUN = function(x) any(column_names %in% x)
    )
  highest_level <- spanners_tbl[cnd_highest_level, "spanner_level", drop = TRUE]
  # Max of ^ and 0
  highest_level <- max(c(0, highest_level))
  highest_level + 1L
}

resolve_spanned_column_names <- function(
    data,
    column_names,
    spanner_ids
) {

  if (length(spanner_ids) > 0) {

    spanners_existing <- dt_spanners_get(data = data)

    column_names_associated <-
      unlist(
        spanners_existing[["vars"]][
          spanners_existing[["spanner_id"]] %in% spanner_ids
        ]
      )

    column_names <- c(column_names, column_names_associated)
  }

  unique(column_names)
}

check_spanner_id_unique <- function(data, spanner_id, call = rlang::caller_env()) {

  existing_column_ids <- dt_boxhead_get_vars(data = data)
  existing_spanner_ids <- dt_spanners_get_ids(data = data)

  all_existing_ids <- c(existing_column_ids, existing_spanner_ids)

  if (spanner_id %in% all_existing_ids) {

    cli::cli_abort(c(
      "The spanner {.arg id} provided ({.val {spanner_id}}) is not unique.",
      "*" = "The `id` must be unique across existing spanner and column IDs.",
      "*" = "Provide a unique ID value for this spanner."
    ),
    call = call)
  }
}
