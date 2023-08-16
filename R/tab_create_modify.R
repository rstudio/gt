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
#  Copyright (c) 2018-2023 gt authors
#
#  For full copyright and license information, please look at
#  https://gt.rstudio.com/LICENSE.html
#
#------------------------------------------------------------------------------#


#' Add a table header
#'
#' @description
#'
#' We can add a table header to the **gt** table with a title and even a
#' subtitle using the `tab_header()` function. A table header is an optional
#' table part that is positioned just above the column labels table part. We
#' have the flexibility to use Markdown or HTML formatting for the header's
#' title and subtitle with the [md()] and [html()] helper functions.
#'
#' @inheritParams fmt_number
#'
#' @param title *Header title*
#'
#'   `scalar<character>` // **required**
#'
#'   Text to be used in the table title. We can elect to use the [md()] and
#'   [html()] helper functions to style the text as Markdown or to retain HTML
#'   elements in the text.
#'
#' @param subtitle *Header subtitle*
#'
#'   `scalar<character>` // *default:* `NULL` (`optional`)
#'
#'   Text to be used in the table subtitle. We can elect to use the [md()] and
#'   [html()] helper functions to style the text as Markdown or to retain HTML
#'   elements in the text.
#'
#' @param preheader *RTF preheader text*
#'
#'   `vector<character>` // *default:* `NULL` (`optional`)
#'
#'   Optional preheader content that is rendered above the table for RTF output.
#'   Can be supplied as a vector of text.
#'
#' @return An object of class `gt_tbl`.
#'
#' @section Examples:
#'
#' Let's use a small portion of the [`gtcars`] dataset to create a **gt** table.
#' A header part can be added to the table with the `tab_header()` function.
#' We'll add a title and the optional subtitle as well. With the [md()] helper
#' function, we can make sure the Markdown formatting is interpreted and
#' transformed.
#'
#' ```r
#' gtcars |>
#'   dplyr::select(mfr, model, msrp) |>
#'   dplyr::slice(1:5) |>
#'   gt() |>
#'   tab_header(
#'     title = md("Data listing from **gtcars**"),
#'     subtitle = md("`gtcars` is an R dataset")
#'   )
#' ```
#'
#' \if{html}{\out{
#' `r man_get_image_tag(file = "man_tab_header_1.png")`
#' }}
#'
#' If the table is intended solely as an HTML table, you could introduce your
#' own HTML elements into the header. You can even use the **htmltools** package
#' to help arrange and generate the HTML. Here's an example of that, where two
#' `<div>` elements are placed in a `htmltools::tagList()`.
#'
#' ```r
#' gtcars |>
#'   dplyr::select(mfr, model, msrp) |>
#'   dplyr::slice(1:5) |>
#'   gt() |>
#'   tab_header(
#'     title =
#'       htmltools::tagList(
#'         htmltools::tags$div(
#'           style = htmltools::css(
#'             `text-align` = "center"
#'           ),
#'           htmltools::HTML(
#'             web_image("https://www.r-project.org/logo/Rlogo.png")
#'           )
#'         ),
#'         htmltools::tags$div(
#'           "Data listing from ",
#'           htmltools::tags$strong("gtcars")
#'         )
#'       )
#'   )
#' ```
#'
#' \if{html}{\out{
#' `r man_get_image_tag(file = "man_tab_header_2.png")`
#' }}
#'
#' If using HTML but doing something far simpler, we can use the [html()] helper
#' function to declare that the text provided is HTML.
#'
#' ```r
#' gtcars |>
#'   dplyr::select(mfr, model, msrp) |>
#'   dplyr::slice(1:5) |>
#'   gt() |>
#'   tab_header(
#'     title = html("Data listing from <strong>gtcars</strong>"),
#'     subtitle = html("From <span style='color:red;'>gtcars</span>")
#'   )
#' ```
#'
#' \if{html}{\out{
#' `r man_get_image_tag(file = "man_tab_header_3.png")`
#' }}
#'
#' @family part creation/modification functions
#' @section Function ID:
#' 2-1
#'
#' @section Function Introduced:
#' `v0.2.0.5` (March 31, 2020)
#'
#' @export
tab_header <- function(
    data,
    title,
    subtitle = NULL,
    preheader = NULL
) {

  # Perform input object validation
  stop_if_not_gt_tbl(data = data)

  dt_set_heading_components(
    data = data,
    title = title,
    subtitle = subtitle,
    preheader = preheader
  )
}

#' Add a spanner label
#'
#' @description
#'
#' With the `tab_spanner()` function, you can insert a spanner in the column
#' labels part of a **gt** table. This part of the table contains, at a minimum,
#' column labels and, optionally, an unlimited number of levels for spanners. A
#' spanner will occupy space over any number of contiguous column labels and it
#' will have an associated label and ID value. This function allows for mapping
#' to be defined by column names, existing spanner ID values, or a mixture of
#' both. The spanners are placed in the order of calling `tab_spanner()` so if a
#' later call uses the same columns in its definition (or even a subset) as the
#' first invocation, the second spanner will be overlaid atop the first. Options
#' exist for forcibly inserting a spanner underneath other (with `level` as
#' space permits) and with `replace`, which allows for full or partial spanner
#' replacement.
#'
#' @inheritParams fmt_number
#'
#' @param label *Spanner label text*
#'
#'   `scalar<character>` // **required**
#'
#'   The text to use for the spanner label. We can optionally use the [md()] and
#'   [html()] functions to style the text as Markdown or to retain HTML elements
#'   in the text.
#'
#' @param columns *Columns to target*
#'
#'   `<column-targeting expression>` // *default:* `NULL` (`optional`)
#'
#'   The columns to serve as components of the spanner. Can either be a series
#'   of column names provided in [c()], a vector of column indices, or a select
#'   helper function. Examples of select helper functions include
#'   [starts_with()], [ends_with()], [contains()], [matches()], [one_of()],
#'   [num_range()], and [everything()]. This argument works in tandem with the
#'   `spanners` argument.
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
#'   across all ID values set for column spanner labels (the function will stop
#'   if `id` isn't unique).
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
#'   dplyr::arrange(desc(population_2021)) |>
#'   dplyr::slice_head(n = 5) |>
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
#' look at a few examples at how this works, and we'll also explore a few
#' lesser-known placement tricks. Let's use a cut down version of [`exibble`]
#' for this, set up a few level-one spanners, and then place a level two spanner
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
#' behaviors are indicative of Tetris-like rules though they tend to work well
#' for the application of spanners.
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
#' @import rlang
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
        paste(
          base::setdiff(spanner_id_idx, present_spanner_ids),
          collapse = ", "
        )

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

  # Add the spanner to the `_spanners` table
  data <-
    dt_spanners_add(
      data = data,
      vars = column_names,
      spanner_label = label,
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
        columns = column_names,
        after = column_names[1]
      )
  }

  data
}

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

  spanners_tbl <- dplyr::select(spanners_tbl, spanner_id, vars, spanner_level)

  highest_level <-
    dplyr::filter(
      spanners_tbl,
      vapply(
        vars,
        FUN.VALUE = logical(1),
        FUN = function(x) any(column_names %in% x)
      )
    ) %>%
    dplyr::pull("spanner_level") %>%
    max(0) # Max of ^ and 0

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

#' Create column labels and spanners via delimited column names
#'
#' @description
#'
#' The `cols_spanner_delim()` function can take specially-crafted column names
#' and generate one or more spanners (along with relabeling the
#' column labels). This is done by splitting the column name by a specified
#' delimiter character (this is the `delim`) and placing the fragments from top
#' to bottom (i.e., higher-level spanners to the column labels). Furthermore,
#' the neighboring text fragments on different spanner levels will be coalesced
#' together to put the span back into spanner. For instance, having the three
#' side-by-side column names `rating_1`, `rating_2`, and `rating_3` will (in the
#' default case at least) result in a spanner with the label `"rating"` above
#' columns with the labels `"1"`, `"2"`, and `"3"`. There are many options in
#' `cols_spanner_delim()` to slice and dice delimited column names in different
#' ways:
#'
#' - the delimiter: choose which delimiter to use for the fragmentation of
#' column names into spanners with the `delim` argument
#' - direction and amount of splitting: we can choose to split *n* times
#' according to a `limit` argument, and, we get to specify from which side of
#' the column name the splitting should occur
#' - reversal of fragments: we can reverse the order the fragments we get from
#' the splitting procedure
#' - column constraints: define which columns in a **gt** table that should
#' participate in spanner creation using vectors or **tidyselect**-style
#' expressions
#'
#' @inheritParams tab_spanner
#'
#' @param delim *Delimiter for splitting*
#'
#'   `scalar<character>` // **required**
#'
#'   The delimiter to use to split an input column name. This should be a single
#'   character (e.g., `"_"`, `"."`, etc.).
#'
#' @param columns *Columns to target*
#'
#'   `<column-targeting expression>` // *default:* `everything()`
#'
#'   The columns to consider for the splitting, relabeling, and spanner setting
#'   operations. Can either be a series of column names provided in [c()], a
#'   vector of column indices, or a select helper function. Examples of select
#'   helper functions include [starts_with()], [ends_with()], [contains()],
#'   [matches()], [one_of()], [num_range()], and [everything()]. This argument
#'   works in tandem with the `spanners` argument.
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
#' use the `tab_spanner_delim()` function to automatically generate column
#' spanner labels. In this case we have some column names in the form
#' `population_<year>`. The underscore character is the delimiter that separates
#' a common word `"population"` and a year value. In this default way of
#' splitting, fragments to the right are lowest (really they become new column
#' labels) and moving left we get spanners. Let's have a look at how
#' `tab_spanner_delim()` handles these column names:
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
#' Let's use [tab_style()] to add some styles to the `towny_subset_gt` table.
#'
#' ```r
#' towny |>
#'   dplyr::select(name, starts_with("population")) |>
#'   dplyr::filter(grepl("^F", name)) |>
#'   gt() |>
#'   tab_spanner_delim(delim = "_") |>
#'   fmt_integer() |>
#'   tab_style(
#'     style = cell_fill(color = "aquamarine"),
#'     locations = cells_body(columns = population_2021)
#'   ) |>
#'   tab_style(
#'     style = cell_text(transform = "capitalize"),
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
#'   dplyr::arrange(desc(population_2021)) |>
#'   dplyr::slice_head(n = 5) |>
#'   dplyr::select(name, ends_with("pct")) |>
#'   dplyr::rename_with(
#'     .fn = function(x) {
#'       x |>
#'         gsub("(.*?)_(\\d{4})", "\\1.\\2", x = _) |>
#'         gsub("pop_change", "Population Change", x = _)
#'     }
#'   ) |>
#'   gt(rowname_col = "name") |>
#'   tab_spanner_delim(delim = "_") |>
#'   fmt_number(decimals = 1, scale_by = 100) |>
#'   cols_label_with(
#'     fn = function(x) gsub("pct", "%", x)
#'   ) |>
#'   text_transform(
#'     fn = function(x) gsub("\\.", " - ", x),
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
#' dataset, we can create another **gt** table and then use the
#' `tab_spanner_delim()` function with the same delimiter/separator that was
#' used in the **tidyr** `pivot_wider()` call. We can also process the generated
#' column labels with [cols_label_with()].
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
#' @import rlang
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
  if (!is.null(limit)) {

    if (length(limit) != 1) {
      cli::cli_abort("If provided, `limit` must be a single value.")
    }

    if (!rlang::is_integerish(limit)) {
      cli::cli_abort("An integer value should be supplied for `limit`.")
    }

    if (limit < 1) {
      cli::cli_abort("The value supplied for `limit` should be `1` or greater.")
    }
  }

  # Perform checks on `delim`
  if (!rlang::is_character(delim)) {
    cli::cli_abort("The value supplied for `delim` must be of type `character`.")
  }

  if (length(delim) != 1) {
    cli::cli_abort("`delim` must be a single value.")
  }

  if (nchar(delim) != 1) {
    cli::cli_abort("The value supplied for `delim` must be a single character.")
  }

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
      x_split_2 <- substr(x_split_i, start = split_delim + 1, x_split_n)

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
      x_split_2 <- substr(x_split_i, start = split_delim + 1, x_split_n)

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


#' Add a row group to a **gt** table
#'
#' @description
#'
#' We can create a row group from a collection of rows with the
#' `tab_row_group()` function. This requires specification of the rows to be
#' included, either by supplying row labels, row indices, or through use of a
#' select helper function like [starts_with()]. To modify the order of row
#' groups, use the [row_group_order()] function.
#'
#' To set a default row group label for any rows not formally placed in a row
#' group, we can use a separate call to `tab_options(row_group.default_label =
#' <label>)`. If this is not done and there are rows that haven't been placed
#' into a row group (where one or more row groups already exist), those rows
#' will be automatically placed into a row group without a label. To restore
#' labels for row groups not explicitly assigned a group,
#' `tab_options(row_group.default_label = "")` can be used.
#'
#' @inheritParams fmt_number
#'
#' @param label *Row group label text*
#'
#'   `scalar<character>` // **required**
#'
#'   The text to use for the row group label. We can optionally use the [md()]
#'   and [html()] functions to style the text as Markdown or to retain HTML
#'   elements in the text.
#'
#' @param rows *Rows to target*
#'
#'   `<row-targeting expression>` // **required**
#'
#'   The rows to be made components of the row group. The default [everything()]
#'   results in all rows in `columns` being formatted. Alternatively, we can
#'   supply a vector of row captions within [c()], a vector of row indices, or a
#'   select helper function. Examples of select helper functions include
#'   [starts_with()], [ends_with()], [contains()], [matches()], [one_of()],
#'   [num_range()], and [everything()]. We can also use expressions to filter
#'   down to the rows we need (e.g., `[colname_1] > 100 & [colname_2] < 50`).
#'
#' @param id *Row group ID*
#'
#'   `scalar<character>` // *default:* `label`
#'
#'   The ID for the row group. When accessing a row group through
#'   [cells_row_groups()] (when using [tab_style()] or [tab_footnote()]) the
#'   `id` value is used as the reference (and not the `label`). If an `id` is
#'   not explicitly provided here, it will be taken from the `label` value. It
#'   is advisable to set an explicit `id` value if you plan to access this cell
#'   in a later function call and the label text is complicated (e.g., contains
#'   markup, is lengthy, or both). Finally, when providing an `id` value you
#'   must ensure that it is unique across all ID values set for row groups (the
#'   function will stop if `id` isn't unique).
#'
#' @param others_label *[Deprecated] Label for default row group*
#'
#'   `scalar<character>` // *default:* `NULL` (`optional`)
#'
#'   This argument is deprecated. Instead use
#'   `tab_options(row_group.default_label = <label>)`.
#'
#' @param group *[Deprecated] The group label*
#'
#'   `scalar<character>` // *default:* `NULL` (`optional`)
#'
#'   This argument is deprecated. Instead use `label`.
#'
#' @return An object of class `gt_tbl`.
#'
#' @section Examples:
#'
#' Using a subset of the [`gtcars`] dataset, let's create a simple **gt** table
#' with row labels (from the `model` column) inside of a stub. This eight-row
#' table begins with no row groups at all but with a single use of the
#' `tab_row_group()` function, we can specify a row group that will contain any
#' rows where the car model begins with a number.
#'
#' ```r
#' gtcars |>
#'   dplyr::select(model, year, hp, trq) |>
#'   dplyr::slice(1:8) |>
#'   gt(rowname_col = "model") |>
#'   tab_row_group(
#'     label = "numbered",
#'     rows = matches("^[0-9]")
#'   )
#' ```
#'
#' \if{html}{\out{
#' `r man_get_image_tag(file = "man_tab_row_group_1.png")`
#' }}
#'
#' This actually makes two row groups since there are row labels that don't
#' begin with a number. That second row group is a catch-all `NA` group, and it
#' doesn't display a label at all. Rather, it is set off from the other group
#' with a double line. This may be a preferable way to display the arrangement
#' of one distinct group and an 'others' or default group. If that's the case
#' but you'd like the order reversed, the [row_group_order()] function can be
#' used for that.
#'
#' ```r
#' gtcars |>
#'   dplyr::select(model, year, hp, trq) |>
#'   dplyr::slice(1:8) |>
#'   gt(rowname_col = "model") |>
#'   tab_row_group(
#'     label = "numbered",
#'     rows = matches("^[0-9]")
#'   ) |>
#'   row_group_order(groups = c(NA, "numbered"))
#' ```
#'
#' \if{html}{\out{
#' `r man_get_image_tag(file = "man_tab_row_group_2.png")`
#' }}
#'
#' Two more options include: (1) setting a default label for the 'others' group
#' (done through [tab_options()]), and (2) creating row groups until there are
#' no more unaccounted for rows. Let's try the first option in the next example:
#'
#' ```r
#' gtcars |>
#'   dplyr::select(model, year, hp, trq) |>
#'   dplyr::slice(1:8) |>
#'   gt(rowname_col = "model") |>
#'   tab_row_group(
#'     label = "numbered",
#'     rows = matches("^[0-9]")
#'   ) |>
#'   row_group_order(groups = c(NA, "numbered")) |>
#'   tab_options(row_group.default_label = "others")
#' ```
#'
#' \if{html}{\out{
#' `r man_get_image_tag(file = "man_tab_row_group_3.png")`
#' }}
#'
#' The above use of the `row_group.default_label` in [tab_options()] gets the
#' job done and provides a default label. One drawback is that the default/`NA`
#' group doesn't have an ID, so it can't as easily be styled with [tab_style()];
#' however, row groups have indices and the index for the `"others"` group here
#' is `1`.
#'
#' ```r
#' gtcars |>
#'   dplyr::select(model, year, hp, trq) |>
#'   dplyr::slice(1:8) |>
#'   gt(rowname_col = "model") |>
#'   tab_row_group(
#'     label = "numbered",
#'     rows = matches("^[0-9]")
#'   ) |>
#'   row_group_order(groups = c(NA, "numbered")) |>
#'   tab_options(row_group.default_label = "others") |>
#'   tab_style(
#'     style = cell_fill(color = "bisque"),
#'     locations = cells_row_groups(groups = 1)
#'   ) |>
#'   tab_style(
#'     style = cell_fill(color = "lightgreen"),
#'     locations = cells_row_groups(groups = "numbered")
#'   )
#' ```
#'
#' \if{html}{\out{
#' `r man_get_image_tag(file = "man_tab_row_group_4.png")`
#' }}
#'
#' Now let's try using `tab_row_group()` with our [`gtcars`]-based table such
#' that all rows are formally assigned to different row groups. We'll define two
#' row groups with the (Markdown-infused) labels `"**Powerful Cars**"` and
#' `"**Super Powerful Cars**"`. The distinction between the groups is whether
#' `hp` is lesser or greater than `600` (and this is governed by the expressions
#' provided to the `rows` argument).
#'
#' ```r
#' gtcars |>
#'   dplyr::select(model, year, hp, trq) |>
#'   dplyr::slice(1:8) |>
#'   gt(rowname_col = "model") |>
#'   tab_row_group(
#'     label = md("**Powerful Cars**"),
#'     rows = hp < 600,
#'     id = "powerful"
#'   ) |>
#'   tab_row_group(
#'     label = md("**Super Powerful Cars**"),
#'     rows = hp >= 600,
#'     id = "v_powerful"
#'   ) |>
#'   tab_style(
#'     style = cell_fill(color = "gray85"),
#'     locations = cells_row_groups(groups = "powerful")
#'   ) |>
#'   tab_style(
#'     style = list(
#'       cell_fill(color = "gray95"),
#'       cell_text(size = "larger")
#'     ),
#'     locations = cells_row_groups(groups = "v_powerful")
#'   )
#' ```
#'
#' \if{html}{\out{
#' `r man_get_image_tag(file = "man_tab_row_group_5.png")`
#' }}
#'
#' Setting the `id` values for each of the row groups makes things easier since
#' you will have clean, markup-free ID values to reference in later calls (as
#' was done with the [tab_style()] invocations in the example above). The use of
#' the [md()] helper function makes it so that any Markdown provided for the
#' `label` of a row group is faithfully rendered.
#'
#' @family part creation/modification functions
#' @section Function ID:
#' 2-4
#'
#' @section Function Introduced:
#' `v0.2.0.5` (March 31, 2020)
#'
#' @import rlang
#' @export
tab_row_group <- function(
    data,
    label,
    rows,
    id = label,
    others_label = NULL,
    group = NULL
) {

  # Perform input object validation
  stop_if_not_gt_tbl(data = data)

  arrange_groups_vars <- dt_row_groups_get(data = data)

  if (!missing(group)) {

    if (missing(label)) {
      label <- group
    }

    cli::cli_warn(c(
      "Since gt v0.3.0 the `group` argument has been deprecated.",
      "*" = "Use the `label` argument to specify the group label."
    ),
    .frequency = "regularly",
    .frequency_id = "tab_row_group_group_arg_deprecated"
    )
  }

  # Warn user about `others_label` deprecation
  if (!is.null(others_label)) {

    data <-
      tab_options(
        data = data,
        row_group.default_label = others_label
      )

    cli::cli_warn(c(
      "Since gt v0.3.0 the `others_label` argument has been deprecated.",
      "*" = "Use `tab_options(row_group.default_label = <label>)` to set
      this label."
    ),
    .frequency = "regularly",
    .frequency_id = "tab_row_group_others_label_arg_deprecated"
    )

    if (missing(label) && missing(rows) && missing(id)) {
      return(data)
    }
  }

  # Check `id` against existing `id` values and stop if necessary
  check_row_group_id_unique(data = data, row_group_id = id)

  # Capture the `rows` expression
  row_expr <- rlang::enquo(rows)

  # Get the `stub_df` data frame from `data`
  stub_df <- dt_stub_df_get(data = data)

  # Resolve the row numbers using the `resolve_vars` function
  resolved_rows_idx <-
    resolve_rows_i(
      expr = !!row_expr,
      data = data
    )

  stub_df <- dt_stub_df_get(data = data)

  # Place the `label` in the `groupname` column `stub_df`
  stub_df[resolved_rows_idx, "group_label"] <- list(list(label))
  stub_df[resolved_rows_idx, "group_id"] <- as.character(id)

  data <- dt_stub_df_set(data = data, stub_df = stub_df)

  # Set the `_row_groups` vector here with the group id; new groups will
  # be placed at the front, pushing down `NA` (the 'Others' group)
  arrange_groups_vars <- c(id, stats::na.omit(arrange_groups_vars))
  arrange_groups_vars <- unique(arrange_groups_vars)
  arrange_groups_vars <- arrange_groups_vars[arrange_groups_vars %in% stub_df$group_id]

  if (dt_stub_groupname_has_na(data = data)) {
    arrange_groups_vars <- c(arrange_groups_vars, NA_character_)
  }

  if (length(arrange_groups_vars) == 1 && is.na(arrange_groups_vars)) {
    arrange_groups_vars <- character(0)
  }

  dt_row_groups_set(
    data = data,
    row_groups = arrange_groups_vars
  )
}

#' Add label text to the stubhead
#'
#' @description
#'
#' We can add a label to the stubhead of a **gt** table with the
#' `tab_stubhead()` function. The stubhead is the lone part of the table that is
#' positioned left of the column labels, and above the stub. If a stub does not
#' exist, then there is no stubhead (so no visible change will be made when
#' using this function in that case). We have the flexibility to use Markdown
#' formatting for the stubhead label via the [md()] helper function.
#' Furthermore, if the table is intended for HTML output, we can use HTML inside
#' of [html()] for the stubhead label.
#'
#' @inheritParams fmt_number
#'
#' @param label *Stubhead label text*
#'
#'   `scalar<character>` // **required**
#'
#'   The text to be used as the stubhead label. We can optionally use the [md()]
#'   and [html()] functions to style the text as Markdown or to retain HTML
#'   elements in the text.
#'
#' @return An object of class `gt_tbl`.
#'
#' @section Examples:
#'
#' Using a small subset of the [`gtcars`] dataset, we can create a **gt** table
#' with row labels. Since we have row labels in the stub (via use of
#' `rowname_col = "model"` in the [gt()] function call) we have a stubhead, so,
#' let's add a stubhead label (`"car"`) with the `tab_stubhead()` function to
#' describe what's in the stub.
#'
#' ```r
#' gtcars |>
#'   dplyr::select(model, year, hp, trq) |>
#'   dplyr::slice(1:5) |>
#'   gt(rowname_col = "model") |>
#'   tab_stubhead(label = "car")
#' ```
#'
#' \if{html}{\out{
#' `r man_get_image_tag(file = "man_tab_stubhead_1.png")`
#' }}
#'
#' The stuhead can contain all sorts of interesting content. How about an icon
#' for a car? We can make this happen with help from the **fontawesome**
#' package.
#'
#' ```r
#' gtcars |>
#'   dplyr::select(model, year, hp, trq) |>
#'   dplyr::slice(1:5) |>
#'   gt(rowname_col = "model") |>
#'   tab_stubhead(label = fontawesome::fa("car"))
#' ```
#'
#' \if{html}{\out{
#' `r man_get_image_tag(file = "man_tab_stubhead_2.png")`
#' }}
#'
#' @family part creation/modification functions
#' @section Function ID:
#' 2-5
#'
#' @section Function Introduced:
#' `v0.2.0.5` (March 31, 2020)
#'
#' @export
tab_stubhead <- function(
    data,
    label
) {

  # Perform input object validation
  stop_if_not_gt_tbl(data = data)

  dt_stubhead_label(data = data, label = label)
}

#' Control indentation of row labels in the stub
#'
#' @description
#'
#' Indentation of row labels is an effective way for establishing structure in a
#' table stub. The `tab_stub_indent()` function allows for fine control over
#' row label indentation in the stub. We can use an explicit definition of an
#' indentation level, or, employ an indentation directive using keywords.
#'
#' @inheritParams fmt_number
#'
#' @param rows *Rows to target*
#'
#'   `<row-targeting expression>` // **required**
#'
#'   The rows to consider for the indentation change. The default [everything()]
#'   results in all rows being targeted. Alternatively, we can supply a vector
#'   of row captions within [c()], a vector of row indices, or a select helper
#'   function. Examples of select helper functions include [starts_with()],
#'   [ends_with()], [contains()], [matches()], [one_of()], [num_range()], and
#'   [everything()]. We can also use expressions to filter down to the rows we
#'   need (e.g., `[colname_1] > 100 & [colname_2] < 50`).
#'
#' @param indent *Indentation directive*
#'
#'   `scalar<character|numeric|integer>` // *default:* `"increase"`
#'
#'   An indentation directive either as a keyword describing the indentation
#'   change or as an explicit integer value for directly setting the indentation
#'   level. The keyword `"increase"` (the default) will increase the indentation
#'   level by one; `"decrease"` will do the same in the reverse direction. The
#'   starting indentation level of `0` means no indentation and this values
#'   serves as a lower bound. The upper bound for indentation is at level `5`.
#'
#' @return An object of class `gt_tbl`.
#'
#' @section Compatibility of arguments with the `from_column()` helper function:
#'
#' The [from_column()] helper function can be used with the `indent` argument
#' of `tab_stub_indent()` to obtain varying parameter values from a specified
#' column within the table. This means that each row label could be indented a
#' little bit differently.
#'
#' Please note that for this argument (`indent`), a [from_column()] call needs
#' to reference a column that has data of the `numeric` or `integer` type.
#' Additional columns for parameter values can be generated with the
#' [cols_add()] function (if not already present). Columns that contain
#' parameter data can also be hidden from final display with [cols_hide()].
#'
#' @section Examples:
#'
#' Let's use a summarized version of the [`pizzaplace`] dataset to create a
#' **gt** table with row groups and row labels. With the [summary_rows()]
#' function, we'll generate summary rows at the top of each row group. With
#' `tab_stub_indent()` we can add indentation to the row labels in the stub.
#'
#' ```r
#' pizzaplace |>
#'   dplyr::group_by(type, size) |>
#'   dplyr::summarize(
#'     sold = dplyr::n(),
#'     income = sum(price),
#'     .groups = "drop"
#'   ) |>
#'   gt(rowname_col = "size", groupname_col = "type") |>
#'   tab_header(title = "Pizzas Sold in 2015") |>
#'   fmt_integer(columns = sold) |>
#'   fmt_currency(columns = income) |>
#'   summary_rows(
#'     fns = list(label = "All Sizes", fn = "sum"),
#'     side = "top",
#'     fmt = list(
#'       ~ fmt_integer(., columns = sold),
#'       ~ fmt_currency(., columns = income)
#'     )
#'   ) |>
#'   tab_options(
#'     summary_row.background.color = "gray95",
#'     row_group.background.color = "#FFEFDB",
#'     row_group.as_column = TRUE
#'   ) |>
#'   tab_stub_indent(
#'     rows = everything(),
#'     indent = 2
#'   )
#' ```
#'
#' \if{html}{\out{
#' `r man_get_image_tag(file = "man_tab_stub_indent_1.png")`
#' }}
#'
#' @family part creation/modification functions
#' @section Function ID:
#' 2-6
#'
#' @section Function Introduced:
#' `v0.7.0` (Aug 25, 2022)
#'
#' @import rlang
#' @export
tab_stub_indent <- function(
    data,
    rows,
    indent = "increase"
) {

  # Perform input object validation
  stop_if_not_gt_tbl(data = data)

  # Capture the `rows` expression
  row_expr <- rlang::enquo(rows)

  # Get the `stub_df` data frame from `data`
  stub_df <- dt_stub_df_get(data = data)

  # Resolve the row numbers using the `resolve_vars` function
  resolved_rows_idx <-
    resolve_rows_i(
      expr = !!row_expr,
      data = data
    )

  # Get existing indentation values
  indent_vals <- stub_df[stub_df$rownum_i %in% resolved_rows_idx, ][["indent"]]

  # Implement support for the `from_column()` helper function; when
  # used for the `indent` arg, a `gt_column` object is provided
  if (inherits(indent, "gt_column")) {

    # Obtain the underlying data table
    data_df <- dt_data_get(data = data)

    # Obtain a `resolved_column` from a column name in the table
    resolved_column <- resolve_cols_c(expr = indent[["column"]], data = data)

    indent_vals <- data_df[resolved_rows_idx, ][[resolved_column]]

    # Stop function if indentation values aren't numeric
    if (!is.numeric(indent_vals)) {
      cli::cli_abort("Values taken from a column must be numeric.")
    }

    # If a function supplied with `fn` in the `from_column()` output,
    # apply that function to any `indent_vals`
    if (!is.null(indent[["fn"]])) {

      fn <- indent[["fn"]]
      indent_vals <- fn(indent_vals)
    }

    # If there is an `na_value` provided along with `from_column()`, apply
    # that to the `indent_vals` vector
    if (!is.null(indent[["na_value"]])) {

      na_value <- indent[["na_value"]]

      # Stop function if the `na_value` isn't numeric
      if (!is.numeric(na_value)) {
        cli::cli_abort("The `na_value` provided must be numeric.")
      }

      indent_vals[is.na(indent_vals)] <- na_value
    }

    indent_vals <- abs(as.integer(indent_vals))

    indent_vals[indent_vals > 5] <- 5L

    indent_vals <- as.character(indent_vals)

  } else {

    for (i in seq_along(indent_vals)) {

      if (is.na(indent_vals[i])) {
        indent_val_i <- 0L
      } else if (grepl("^[0-9]$", indent_vals[i])) {
        indent_val_i <- as.integer(indent_vals[i])
      } else {
        indent_val_i <- indent_vals[i]
      }

      # Modify `indent_val_i` based on keyword directives
      if (is.character(indent)) {

        # Move `indent_val_i` up or down by one
        if (indent == "increase") {
          indent_val_i <- indent_val_i + 1L
        } else if (indent == "decrease") {
          indent_val_i <- indent_val_i - 1L
        }

        # Set hard boundaries on the indentation value (LB is `0`, UB is `5`)
        if (indent_val_i > 5) indent_val_i <- 5L
        if (indent_val_i < 0) indent_val_i <- 0L
      }

      # Modify `indent_val_i` using a fixed value
      if (
        is.numeric(indent) &&
        !is.na(indent) &&
        !is.infinite(indent)
      ) {

        # Stop function if `indent` value doesn't fall into the acceptable range
        if (indent < 0 | indent > 5) {
          cli::cli_abort(c(
            "If given as a numeric value, `indent` should be one of the following:",
            "*" = "0, 1, 2, 3, 4, or 5"
          ))
        }

        # Coerce `indent` to an integer value
        indent_val_i <- as.integer(indent)
      }

      # Ensure that `indent_val_i` is assigned to `indent_vals` as
      # a character value
      indent_vals[i] <- as.character(indent_val_i)
    }
  }

  stub_df[stub_df$rownum_i %in% resolved_rows_idx, ][["indent"]] <- indent_vals

  dt_stub_df_set(data = data, stub_df = stub_df)
}

#' Add a table footnote
#'
#' @description
#'
#' The `tab_footnote()` function can make it a painless process to add a
#' footnote to a **gt** table. There are commonly two components to a footnote:
#' (1) a footnote mark that is attached to the targeted cell content, and (2)
#' the footnote text itself that is placed in the table's footer area. Each unit
#' of footnote text in the footer is linked to an element of text or otherwise
#' through the footnote mark. The footnote system in **gt** presents footnotes
#' in a way that matches the usual expectations, where:
#'
#' 1. footnote marks have a sequence, whether they are symbols, numbers, or
#' letters
#' 2. multiple footnotes can be applied to the same content (and marks are
#' always presented in an ordered fashion)
#' 2. footnote text in the footer is never exactly repeated, **gt** reuses
#' footnote marks where needed throughout the table
#' 3. footnote marks are ordered across the table in a consistent manner (left
#' to right, top to bottom)
#'
#' Each call of `tab_footnote()` will either add a different footnote or reuse
#' existing footnote text. One or more cells are targeted using the `cells_*()`
#' helper functions (e.g., [cells_body()], [cells_column_labels()], etc.). You
#' can choose to not attach a footnote mark not specifying a location at all. By
#' default, **gt** will choose which side of the text to place the footnote mark
#' (with the `placement = "auto"` option) but you can always choose the
#' placement of the footnote mark.
#'
#' @inheritParams fmt_number
#'
#' @param footnote *Footnote text*
#'
#'   `scalar<character>` // **required**
#'
#'   The text to be used in the footnote. We can optionally use the [md()] and
#'   [html()] functions to style the text as Markdown or to retain HTML elements
#'   in the footnote text.
#'
#' @param locations *Locations to target*
#'
#'   `<locations expressions>` // *default:* `NULL` (`optional`)
#'
#'   The cell or set of cells to be associated with the footnote. Supplying any
#'   of the `cells_*()` helper functions is a useful way to target the location
#'   cells that are associated with the footnote text. These helper functions
#'   are: [cells_title()], [cells_stubhead()], [cells_column_spanners()],
#'   [cells_column_labels()], [cells_row_groups()], [cells_stub()],
#'   [cells_body()], [cells_summary()], [cells_grand_summary()],
#'   [cells_stub_summary()], and [cells_stub_grand_summary()]. Additionally, we
#'   can enclose several `cells_*()` calls within a `list()` if we wish to link
#'   the footnote text to different types of locations (e.g., body cells, row
#'   group labels, the table title, etc.).
#'
#' @param placement *Placement of footnote mark*
#'
#'   `singl-kw:[auto|right|left]` // *default:* `"auto"`
#'
#'   Where to affix footnote marks to the table content. Two options for this
#'   are `"left` or `"right"`, where the placement is either to the absolute
#'   left or right of the cell content. By default, however, this option is set
#'   to `"auto"` whereby **gt** will choose a preferred left-or-right placement
#'   depending on the alignment of the cell content.
#'
#' @return An object of class `gt_tbl`.
#'
#' @section Formatting of footnote text and marks:
#'
#' There are several options for controlling the formatting of the footnotes,
#' their marks, and typesetting in the footer. All of these options are
#' available within the [tab_options()] function and a subset of these are
#' exposed in their own `opt_*()` functions.
#'
#' ## Choosing the footnote marks
#'
#' We can modify the set of footnote marks with
#' `tab_options(..., footnotes.marks)` or `opt_footnote_marks(..., )`. What that
#' argument needs is a vector that will represent the series of marks. The
#' series of footnote marks is recycled when its usage goes beyond the length of
#' the set. At each cycle, the marks are simply doubled, tripled, and so on
#' (e.g., `*` -> `**` -> `***`). The option exists for providing keywords for
#' certain types of footnote marks. The keywords are:
#'
#' - `"numbers"`: numeric marks, they begin from `1` and these marks are not
#' subject to recycling behavior (this is the default)
#' - `"letters"`: minuscule alphabetic marks, internally uses the `letters`
#' vector which contains 26 lowercase letters of the Roman alphabet
#' - `"LETTERS"`: majuscule alphabetic marks, using the `LETTERS` vector
#' which has 26 uppercase letters of the Roman alphabet
#' - `"standard"`: symbolic marks, four symbols in total
#' - `"extended"`: symbolic marks, extends the standard set by adding two
#' more symbols, making six
#'
#' The symbolic marks are the: (1) Asterisk, (2) Dagger, (3) Double Dagger,
#' (4) Section Sign, (5) Double Vertical Line, and (6) Paragraph Sign; the
#' `"standard"` set has the first four, `"extended"` contains all.
#'
#' ## Defining footnote specs
#'
#' A footnote spec consists of a string containing control characters for
#' formatting. They are separately defined for footnote marks beside footnote
#' text in the table footer (the `'spec_ftr'`) and for marks beside the targeted
#' cell content (the `'spec_ref'`).
#'
#' Not every type of formatting makes sense for footnote marks so the
#' specification is purposefully constrained to the following:
#'
#' - as superscript text (with the `"^"` control character) or regular-sized
#' text residing on the baseline
#' - bold text (with `"b"`), italicized text (with `"i"`), or unstyled text
#' (don't use either of the `"b"` or `"i"` control characters)
#' - enclosure in parentheses (use `"("` / `")"`) or square brackets (with
#' `"["` / `"]"`)
#' - a period following the mark (using `"."`); this is most commonly used in
#' the table footer
#'
#' With the aforementioned control characters we could, for instance, format
#' the footnote marks to be superscript text in bold type with `"^b"`. We might
#' want the marks in the footer to be regular-sized text in parentheses, so the
#' spec could be either `"()"` or `"(x)"` (you can optionally use `"x"` as a
#' helpful placeholder for the marks).
#'
#' These options can be set either in a [tab_options()] call (with the
#' `footnotes.spec_ref` and `footnotes.spec_ftr` arguments) or with
#' [opt_footnote_spec()] (using `spec_ref` or `spec_ftr`).
#'
#' ## Typesetting of footnotes in the footer
#'
#' Within [tab_options()] there are two arguments that control the typesetting
#' of footnotes. With `footnotes.multiline`, we have a setting that determines
#' whether each footnote will start on a new line, or, whether they are combined
#' into a single block of text. The default for this is `TRUE`, but, if `FALSE`
#' we can control the separator between consecutive footnotes with the
#' `footnotes.sep` argument. By default, this is set to a single space character
#' (`" "`).
#'
#' @section Examples:
#'
#' Using a subset of the [`sza`] dataset, let's create a new **gt** table. The
#' body cells in the `sza` column will receive background color fills according
#' to their data values (with the [data_color()] function). After that, the use
#' of `tab_footnote()` lets us add a footnote to the `sza` column label
#' (explaining what the color gradient signifies).
#'
#' ```r
#' sza |>
#'   dplyr::filter(
#'     latitude == 20 &
#'       month == "jan" &
#'       !is.na(sza)
#'   ) |>
#'   dplyr::select(-latitude, -month) |>
#'   gt() |>
#'   data_color(
#'     columns = sza,
#'     palette = c("white", "yellow", "navyblue"),
#'     domain = c(0, 90)
#'   ) |>
#'   tab_footnote(
#'     footnote = "Color indicates the solar zenith angle.",
#'     locations = cells_column_labels(columns = sza)
#'   )
#' ```
#'
#' \if{html}{\out{
#' `r man_get_image_tag(file = "man_tab_footnote_1.png")`
#' }}
#'
#' Of course, we can add more than one footnote to the table, but, we have to
#' use several calls of `tab_footnote()`. This variation of the [`sza`] table
#' has three footnotes: one on the `"TST"` column label and two on the `"SZA"`
#' column label (these were capitalized with [opt_all_caps()]). We have three
#' calls of `tab_footnote()` and while the order of calls usually doesn't
#' matter, it does have a subtle effect here since two footnotes are associated
#' with the same text content (try reversing the second and third calls and
#' observe the effect in the footer).
#'
#' ```r
#' sza |>
#'   dplyr::filter(
#'     latitude == 20 &
#'       month == "jan" &
#'       !is.na(sza)
#'   ) |>
#'   dplyr::select(-latitude, -month) |>
#'   gt() |>
#'   opt_all_caps() |>
#'   cols_align(align = "center") |>
#'   cols_width(everything() ~ px(200)) |>
#'   tab_footnote(
#'     footnote = md("TST stands for *True Solar Time*."),
#'     locations = cells_column_labels(columns = tst)
#'   ) |>
#'   tab_footnote(
#'     footnote = md("SZA stands for *Solar Zenith Angle*."),
#'     locations = cells_column_labels(columns = sza)
#'   ) |>
#'   tab_footnote(
#'     footnote = "Higher Values indicate sun closer to horizon.",
#'     locations = cells_column_labels(columns = sza)
#'   ) |>
#'   tab_options(footnotes.multiline = FALSE)
#' ```
#'
#' \if{html}{\out{
#' `r man_get_image_tag(file = "man_tab_footnote_2.png")`
#' }}
#'
#' Text in the footer (both from footnotes and also from source notes) tends to
#' widen the table and, by extension, all the columns within it. We can limit
#' that by explicitly setting column width values, which is what was done above
#' with [cols_width()]. There can also be a correspondingly large amount of
#' vertical space taken up by the footer since footnotes will, by default, each
#' start on a new line. In the above example, we used
#' `tab_options(footnotes.multiline = FALSE)` to make it so that all footer text
#' is contained in a single block of text.
#'
#' Let's move on to another footnote-laden table, this one based on the
#' [`towny`] dataset. We have a header part, with a title and a subtitle. We
#' can choose which of these could be associated with a footnote and in this
#' case it is the `"subtitle"` (one of two options in the [cells_title()] helper
#' function). This table has a stub with row labels and some of those labels are
#' associated with a footnote. So long as row labels are unique, they can be
#' easily used as row identifiers in [cells_stub()]. The third footnote is
#' placed on the `"Density"` column label. Here, changing the order of the
#' `tab_footnote()` calls has no effect on the final table rendering.
#'
#' ```r
#' towny |>
#'   dplyr::filter(csd_type == "city") |>
#'   dplyr::arrange(desc(population_2021)) |>
#'   dplyr::select(name, density_2021, population_2021) |>
#'   dplyr::slice_head(n = 10) |>
#'   gt(rowname_col = "name") |>
#'   tab_header(
#'     title = md("The 10 Largest Municipalities in `towny`"),
#'     subtitle = "Population values taken from the 2021 census."
#'   ) |>
#'   fmt_integer() |>
#'   cols_label(
#'     density_2021 = "Density",
#'     population_2021 = "Population"
#'   ) |>
#'   tab_footnote(
#'     footnote = "Part of the Greater Toronto Area.",
#'     locations = cells_stub(rows = c(
#'       "Toronto", "Mississauga", "Brampton", "Markham", "Vaughan"
#'     ))
#'   ) |>
#'   tab_footnote(
#'     footnote = md("Density is in terms of persons per km^2^."),
#'     locations = cells_column_labels(columns = density_2021)
#'   ) |>
#'   tab_footnote(
#'     footnote = "Census results made public on February 9, 2022.",
#'     locations = cells_title(groups = "subtitle")
#'   ) |>
#'   tab_source_note(source_note = md(
#'     "Data taken from the `towny` dataset (in the **gt** package)."
#'   )) |>
#'   opt_footnote_marks(marks = "letters")
#' ```
#'
#' \if{html}{\out{
#' `r man_get_image_tag(file = "man_tab_footnote_3.png")`
#' }}
#'
#' In the above table, we elected to change the footnote marks to letters
#' instead of the default numbers (done through [opt_footnote_marks()]). A
#' source note was also added; this was mainly to demonstrate that source notes
#' will be positioned beneath footnotes in the footer section.
#'
#' For our final example, let's make a relatively small table deriving from the
#' [`sp500`] dataset. The set of `tab_footnote()` calls used here (four of them)
#' have minor variations that allow for interesting expressions of footnotes.
#' Two of the footnotes target values in the body of the table (using the
#' [cells_body()] helper function to achieve this). On numeric values that
#' right-aligned, **gt** will opt to place the footnote on the left of the
#' content so as to not disrupt the alignment. However, the `placement` argument
#' can be used to force the positioning of the footnote mark after the content.
#' We can also opt to include footnotes that have no associated footnote marks
#' whatsoever. This is done by not providing anything to `locations`. These
#' 'markless' footnotes will precede the other footnotes in the footer section.
#'
#' ```r
#' sp500 |>
#'   dplyr::filter(date >= "2015-01-05" & date <="2015-01-10") |>
#'   dplyr::select(-c(adj_close, volume, high, low)) |>
#'   dplyr::mutate(change = close - open) |>
#'   dplyr::arrange(date) |>
#'   gt() |>
#'   tab_header(title = "S&P 500") |>
#'   fmt_date(date_style = "m_day_year") |>
#'   fmt_currency() |>
#'   cols_width(everything() ~ px(150)) |>
#'   tab_footnote(
#'     footnote = "More red days than green in this period.",
#'     locations = cells_column_labels(columns = change)
#'   ) |>
#'   tab_footnote(
#'     footnote = "Lowest opening value.",
#'     locations = cells_body(columns = open, rows = 3),
#'   ) |>
#'   tab_footnote(
#'     footnote = "Devastating losses on this day.",
#'     locations = cells_body(columns = change, rows = 1),
#'     placement = "right"
#'   ) |>
#'   tab_footnote(footnote = "All values in USD.") |>
#'   opt_footnote_marks(marks = "LETTERS") |>
#'   opt_footnote_spec(spec_ref = "i[x]", spec_ftr = "x.")
#' ```
#'
#' \if{html}{\out{
#' `r man_get_image_tag(file = "man_tab_footnote_4.png")`
#' }}
#'
#' Aside from changing the footnote marks to be `"LETTERS"`, we've also changed
#' the way the marks are formatted. In [opt_footnote_spec()], the `spec_ref`
#' option governs the footnote marks across the table. Here, we describe marks
#' that are italicized and set between square brackets (with `"i[x]"`). The
#' `spec_ftr` argument is used for the footer representation of the footnote
#' marks. As described in the example with `"x."`, it will be rendered as the
#' footnote mark followed by a period.
#'
#' @family part creation/modification functions
#' @section Function ID:
#' 2-7
#'
#' @section Function Introduced:
#' `v0.2.0.5` (March 31, 2020)
#'
#' @export
tab_footnote <- function(
    data,
    footnote,
    locations = NULL,
    placement = c("auto", "right", "left")
) {

  placement <- rlang::arg_match(placement)

  # Perform input object validation
  stop_if_not_gt_tbl(data = data)

  if (is.null(locations)) {

    # We need to invoke `dt_footnotes_add()` here (and not use
    # `as_locations()`/`set_footnote()`) because there is no
    # method for NULL

    data <-
      dt_footnotes_add(
        data = data,
        locname = "none",
        grpname = NA_character_,
        colname = NA_character_,
        locnum = 0,
        rownum = NA_integer_,
        footnotes = footnote,
        placement = placement
      )

    return(data)
  }

  # Resolve into a list of locations
  locations <- as_locations(locations)

  # Resolve the locations of the targeted data cells and append
  # the footnotes
  for (loc in locations) {

    data <-
      set_footnote(
        loc = loc,
        data = data,
        footnote = footnote,
        placement = placement
      )
  }

  data
}

set_footnote <- function(loc, data, footnote, placement) {
  UseMethod("set_footnote")
}

set_footnote.cells_title <- function(
    loc,
    data,
    footnote,
    placement
) {

  title_components <- rlang::eval_tidy(loc$groups)

  if ("title" %in% title_components) {

    data <-
      dt_footnotes_add(
        data = data,
        locname = "title",
        grpname = NA_character_,
        colname = NA_character_,
        locnum = 1,
        rownum = NA_integer_,
        footnotes = footnote,
        placement = placement
      )
  }

  if ("subtitle" %in% title_components) {

    data <-
      dt_footnotes_add(
        data = data,
        locname = "subtitle",
        grpname = NA_character_,
        colname = NA_character_,
        locnum = 2,
        rownum = NA_integer_,
        footnotes = footnote,
        placement = placement
      )
  }

  data
}

set_footnote.cells_stubhead <- function(
    loc,
    data,
    footnote,
    placement
) {

  data <-
    dt_footnotes_add(
      data = data,
      locname = loc$groups,
      grpname = NA_character_,
      colname = NA_character_,
      locnum = 2.5,
      rownum = NA_integer_,
      footnotes = footnote,
      placement = placement
    )

  data
}

set_footnote.cells_column_labels <- function(
    loc,
    data,
    footnote,
    placement
) {

  resolved <- resolve_cells_column_labels(data = data, object = loc)

  cols <- resolved$columns

  colnames <- names(cols)

  data <-
    dt_footnotes_add(
      data = data,
      locname = "columns_columns",
      grpname = NA_character_,
      colname = colnames,
      locnum = 4,
      rownum = NA_integer_,
      footnotes = footnote,
      placement = placement
    )

  data
}

set_footnote.cells_column_spanners <- function(
    loc,
    data,
    footnote,
    placement
) {

  resolved <- resolve_cells_column_spanners(data = data, object = loc)

  groups <- resolved$spanners

  data <-
    dt_footnotes_add(
      data = data,
      locname = "columns_groups",
      grpname = groups,
      colname = NA_character_,
      locnum = 3,
      rownum = NA_integer_,
      footnotes = footnote,
      placement = placement
    )

  data
}

set_footnote.cells_row_groups <- function(
    loc,
    data,
    footnote,
    placement
) {

  row_groups <- dt_row_groups_get(data = data)

  # Resolve row groups
  resolved_row_groups_idx <-
    resolve_vector_i(
      expr = !!loc$groups,
      vector = row_groups,
      item_label = "row group"
    )

  groups <- row_groups[resolved_row_groups_idx]

  data <-
    dt_footnotes_add(
      data = data,
      locname = "row_groups",
      grpname = groups,
      colname = NA_character_,
      locnum = 5,
      rownum = NA_integer_,
      footnotes = footnote,
      placement = placement
    )

  data
}

set_footnote.cells_body <- function(
    loc,
    data,
    footnote,
    placement
) {

  resolved <- resolve_cells_body(data = data, object = loc)

  rows <- resolved$rows

  colnames <- resolved$colnames

  data <-
    dt_footnotes_add(
      data = data,
      locname = "data",
      grpname = NA_character_,
      colname = colnames,
      locnum = 5,
      rownum = rows,
      footnotes = footnote,
      placement = placement
    )

  data
}

set_footnote.cells_stub <- function(
    loc,
    data,
    footnote,
    placement
) {

  resolved <- resolve_cells_stub(data = data, object = loc)

  rows <- resolved$rows

  data <-
    dt_footnotes_add(
      data = data,
      locname = "stub",
      grpname = NA_character_,
      colname = NA_character_,
      locnum = 5,
      rownum = rows,
      footnotes = footnote,
      placement = placement
    )

  data
}

set_footnote.cells_summary <- function(
    loc,
    data,
    footnote,
    placement
) {

  add_summary_location_row(
    loc = loc,
    data = data,
    style = footnote,
    placement = placement,
    df_type = "footnotes_df"
  )
}

set_footnote.cells_grand_summary <- function(
    loc,
    data,
    footnote,
    placement
) {

  add_grand_summary_location_row(
    loc = loc,
    data = data,
    style = footnote,
    placement = placement,
    df_type = "footnotes_df"
  )
}

set_footnote.cells_stub_summary <- function(
    loc,
    data,
    footnote,
    placement
) {

  add_summary_location_row(
    loc = loc,
    data = data,
    style = footnote,
    placement = placement,
    df_type = "footnotes_df"
  )
}

set_footnote.cells_stub_grand_summary <- function(
    loc,
    data,
    footnote,
    placement
) {

  add_grand_summary_location_row(
    loc = loc,
    data = data,
    style = footnote,
    placement = placement,
    df_type = "footnotes_df"
  )
}

set_footnote.cells_source_notes <- function(
    loc,
    data,
    footnote,
    placement
) {
  cli::cli_abort("Footnotes cannot be applied to source notes.")
}

set_footnote.cells_footnotes <- function(
    loc,
    data,
    footnote,
    placement
) {
  cli::cli_abort("Footnotes cannot be applied to other footnotes.")
}

#' Add a source note citation
#'
#' @description
#'
#' Add a source note to the footer part of the **gt** table. A source note is
#' useful for citing the data included in the table. Several can be added to the
#' footer, simply use multiple calls of `tab_source_note()` and they will be
#' inserted in the order provided. We can use Markdown formatting for the note,
#' or, if the table is intended for HTML output, we can include HTML formatting.
#'
#' @inheritParams fmt_number
#'
#' @param source_note *Source note text*
#'
#'   `scalar<character>` // **required**
#'
#'   Text to be used in the source note. We can optionally use the [md()] and
#'   [html()] functions to style the text as Markdown or to retain HTML elements
#'   in the text.
#'
#' @return An object of class `gt_tbl`.
#'
#' @section Examples:
#'
#' With three columns from the [`gtcars`] dataset, let's create a **gt** table.
#' We can use the `tab_source_note()` function to add a source note to the table
#' footer. Here we are citing the data source but this function can be used for
#' any text you'd prefer to display in the footer section.
#'
#' ```r
#' gtcars |>
#'   dplyr::select(mfr, model, msrp) |>
#'   dplyr::slice(1:5) |>
#'   gt() |>
#'   tab_source_note(source_note = "From edmunds.com")
#' ```
#'
#' \if{html}{\out{
#' `r man_get_image_tag(file = "man_tab_source_note_1.png")`
#' }}
#'
#' @family part creation/modification functions
#' @section Function ID:
#' 2-8
#'
#' @section Function Introduced:
#' `v0.2.0.5` (March 31, 2020)
#'
#' @export
tab_source_note <- function(
    data,
    source_note
) {

  # Perform input object validation
  stop_if_not_gt_tbl(data = data)

  dt_source_notes_add(
    data = data,
    source_note = source_note
  )
}

#' Add a table caption
#'
#' @description
#'
#' Add a caption to a **gt** table, which is handled specially for a table
#' within an R Markdown, Quarto, or **bookdown** context. The addition of
#' captions makes tables cross-referencing across the containing document. The
#' caption location (i.e., top, bottom, margin) is handled at the document level
#' in each of these system.
#'
#' @inheritParams fmt_number
#'
#' @param caption *Table caption text*
#'
#'   `scalar<character>` // **required**
#'
#'   The table caption to use for cross-referencing in R Markdown, Quarto, or
#'   **bookdown**.
#'
#' @return An object of class `gt_tbl`.
#'
#' @section Examples:
#'
#' With three columns from the [`gtcars`] dataset, let's create a **gt** table.
#' First, we'll add a header part with the [tab_header()] function. After that,
#' a caption is added through use of `tab_caption()`.
#'
#' ```r
#' gtcars |>
#'   dplyr::select(mfr, model, msrp) |>
#'   dplyr::slice(1:5) |>
#'   gt() |>
#'   tab_header(
#'     title = md("Data listing from **gtcars**"),
#'     subtitle = md("`gtcars` is an R dataset")
#'   ) |>
#'   tab_caption(caption = md("**gt** table example."))
#' ```
#'
#' \if{html}{\out{
#' `r man_get_image_tag(file = "man_tab_caption_1.png")`
#' }}
#'
#' @family part creation/modification functions
#' @section Function ID:
#' 2-9
#'
#' @section Function Introduced:
#' `v0.8.0` (November 16, 2022)
#'
#' @export
tab_caption <- function(
    data,
    caption
) {

  # Perform input object validation
  stop_if_not_gt_tbl(data = data)

  dt_options_set_value(
    data = data,
    option = "table_caption",
    value = caption
  )
}

#' Add custom styles to one or more cells
#'
#' @description
#'
#' With the `tab_style()` function we can target specific cells and apply styles
#' to them. This is best done in conjunction with the helper functions
#' [cell_text()], [cell_fill()], and [cell_borders()]. At present this function
#' is focused on the application of styles for HTML output only (as such, other
#' output formats will ignore all `tab_style()` calls). Using the aforementioned
#' helper functions, here are some of the styles we can apply:
#'
#' - the background color of the cell ([cell_fill()]: `color`)
#' - the cell's text color, font, and size ([cell_text()]: `color`, `font`,
#' `size`)
#' - the text style ([cell_text()]: `style`), enabling the use of italics or
#' oblique text.
#' - the text weight ([cell_text()]: `weight`), allowing the use of thin to
#' bold text (the degree of choice is greater with variable fonts)
#' - the alignment and indentation of text ([cell_text()]: `align` and
#' `indent`)
#' - the cell borders ([cell_borders()])
#'
#' @inheritParams fmt_number
#'
#' @param style *Style declarations*
#'
#'   `<style expressions>` // **required**
#'
#'   The styles to use for the cells at the targeted `locations`. The
#'   [cell_text()], [cell_fill()], and [cell_borders()] helper functions can be
#'   used here to more easily generate valid styles. If using more than one
#'   helper function to define styles, all calls must be enclosed in a [list()].
#'   Custom CSS declarations can be used for HTML output by including a
#'   [css()]-based statement as a list item.
#'
#' @param locations *Locations to target*
#'
#'   `<locations expressions>` // **required**
#'
#'   The cell or set of cells to be associated with the style. Supplying any of
#'   the `cells_*()` helper functions is a useful way to target the location
#'   cells that are associated with the styling. These helper functions are:
#'   [cells_title()], [cells_stubhead()], [cells_column_spanners()],
#'   [cells_column_labels()], [cells_row_groups()], [cells_stub()],
#'   [cells_body()], [cells_summary()], [cells_grand_summary()],
#'   [cells_stub_summary()], [cells_stub_grand_summary()], [cells_footnotes()],
#'   and [cells_source_notes()]. Additionally, we can enclose several
#'   `cells_*()` calls within a `list()` if we wish to apply styling to
#'   different types of locations (e.g., body cells, row group labels, the table
#'   title, etc.).
#'
#' @return An object of class `gt_tbl`.
#'
#' @section Using `from_column()` with `cell_*()` styling functions:
#'
#' The [from_column()] helper function can be used with certain arguments of
#' [cell_fill()] and [cell_text()]; this allows you to get parameter values from
#' a specified column within the table. This means that body cells targeted for
#' styling could be formatted a little bit differently, using options taken from
#' a column. For [cell_fill()], we can use [from_column()] for its `color`
#' argument. The [cell_text()] function allows the use of [from_column()] in the
#' following arguments:
#'
#' - `color`
#' - `size`
#' - `align`
#' - `v_align`
#' - `style`
#' - `weight`
#' - `stretch`
#' - `decorate`
#' - `transform`
#' - `whitespace`
#' - `indent`
#'
#' Please note that for all of the aforementioned arguments, a [from_column()]
#' call needs to reference a column that has data of the correct type (this is
#' different for each argument). Additional columns for parameter values can be
#' generated with the [cols_add()] function (if not already present). Columns
#' that contain parameter data can also be hidden from final display with
#' [cols_hide()].
#'
#' Importantly, a call of `tab_style()` with any use of [from_column()] within
#' styling expressions must only use [cells_body()] within `locations`. This is
#' because we cannot map multiple options taken from a column onto other
#' locations.
#'
#' @section Examples:
#'
#' Let's use the [`exibble`] dataset to create a simple, two-column **gt** table
#' (keeping only the `num` and `currency` columns). With the [tab_style()]
#' function (called twice), we'll selectively add style to the values formatted
#' by [fmt_number()]. In the `style` argument of each `tab_style()` call, we
#' can define multiple types of styling with the [cell_fill()] and [cell_text()]
#' helper functions (enclosed in a list). The cells to be targeted for styling
#' require the use of helper functions like [cells_body()], which is used here
#' with different columns and rows being targeted.
#'
#' ```r
#' exibble |>
#'   dplyr::select(num, currency) |>
#'   gt() |>
#'   fmt_number(decimals = 1) |>
#'   tab_style(
#'     style = list(
#'       cell_fill(color = "lightcyan"),
#'       cell_text(weight = "bold")
#'       ),
#'     locations = cells_body(
#'       columns = num,
#'       rows = num >= 5000
#'     )
#'   ) |>
#'   tab_style(
#'     style = list(
#'       cell_fill(color = "#F9E3D6"),
#'       cell_text(style = "italic")
#'       ),
#'     locations = cells_body(
#'       columns = currency,
#'       rows = currency < 100
#'     )
#'   )
#' ```
#'
#' \if{html}{\out{
#' `r man_get_image_tag(file = "man_tab_style_1.png")`
#' }}
#'
#' With a subset of the [`sp500`] dataset, we'll create a different **gt**
#' table. Here, we'll color the background of entire rows of body cells and do
#' so on the basis of value expressions involving the `open` and `close`
#' columns.
#'
#' ```r
#' sp500 |>
#'   dplyr::filter(
#'     date >= "2015-12-01" &
#'     date <= "2015-12-15"
#'   ) |>
#'   dplyr::select(-c(adj_close, volume)) |>
#'   gt() |>
#'   tab_style(
#'     style = cell_fill(color = "lightgreen"),
#'     locations = cells_body(rows = close > open)
#'   ) |>
#'   tab_style(
#'     style = list(
#'       cell_fill(color = "red"),
#'       cell_text(color = "white")
#'       ),
#'     locations = cells_body(rows = open > close)
#'   )
#' ```
#'
#' \if{html}{\out{
#' `r man_get_image_tag(file = "man_tab_style_2.png")`
#' }}
#'
#' With another two-column table based on the [`exibble`] dataset, let's create
#' a **gt** table. First, we'll replace missing values with the [sub_missing()]
#' function. Next, we'll add styling to the `char` column. This styling will be
#' HTML-specific and it will involve (all within a list): (1) a [cell_fill()]
#' call (to set a `"lightcyan"` background), and (2) a string containing a CSS
#' style declaration (`"font-variant: small-caps;"`).
#'
#' ```r
#' exibble |>
#'   dplyr::select(char, fctr) |>
#'   gt() |>
#'   sub_missing() |>
#'   tab_style(
#'     style = list(
#'       cell_fill(color = "lightcyan"),
#'       "font-variant: small-caps;"
#'     ),
#'     locations = cells_body(columns = char)
#'   )
#' ```
#'
#' \if{html}{\out{
#' `r man_get_image_tag(file = "man_tab_style_3.png")`
#' }}
#'
#' In the following table based on the [`towny`] dataset, we'll use a larger
#' number of `tab_style()` calls with the aim of styling each location available
#' in the table. Over six separate uses of `tab_style()`, different body cells
#' are styled with background colors, the header and the footer also receive
#' background color fills, borders are applied to a column of body cells and
#' also to the column labels, and, the row labels in the stub receive a custom
#' text treatment.
#'
#' ```r
#' towny |>
#'   dplyr::filter(csd_type == "city") |>
#'   dplyr::arrange(desc(population_2021)) |>
#'   dplyr::select(
#'     name, land_area_km2, density_2016, density_2021,
#'     population_2016, population_2021
#'   ) |>
#'   dplyr::slice_head(n = 5) |>
#'   gt(rowname_col = "name") |>
#'   tab_header(
#'     title = md(paste("Largest Five", fontawesome::fa("city") , "in `towny`")),
#'     subtitle = "Changes in vital numbers from 2016 to 2021."
#'   ) |>
#'   fmt_number(
#'     columns = starts_with("population"),
#'     n_sigfig = 3,
#'     suffixing = TRUE
#'   ) |>
#'   fmt_integer(columns = starts_with("density")) |>
#'   fmt_number(columns = land_area_km2, decimals = 1) |>
#'   cols_merge(
#'     columns = starts_with("density"),
#'     pattern = paste("{1}", fontawesome::fa("arrow-right"), "{2}")
#'   ) |>
#'   cols_merge(
#'     columns = starts_with("population"),
#'     pattern = paste("{1}", fontawesome::fa("arrow-right"), "{2}")
#'   ) |>
#'   cols_label(
#'     land_area_km2 = md("Area, km^2^"),
#'     starts_with("density") ~ md("Density, ppl/km^2^"),
#'     starts_with("population") ~ "Population"
#'   ) |>
#'   cols_align(align = "center", columns = -name) |>
#'   cols_width(
#'     stub() ~ px(125),
#'     everything() ~ px(150)
#'   ) |>
#'   tab_footnote(
#'     footnote = "Data was used from their respective census-year publications.",
#'     locations = cells_title(groups = "subtitle")
#'   ) |>
#'   tab_source_note(source_note = md(
#'     "All figures are compiled in the `towny` dataset (in the **gt** package)."
#'   )) |>
#'   opt_footnote_marks(marks = "letters") |>
#'   tab_style(
#'     style = list(
#'       cell_fill(color = "gray95"),
#'       cell_borders(sides = c("l", "r"), color = "gray50", weight = px(3))
#'     ),
#'     locations = cells_body(columns = land_area_km2)
#'   ) |>
#'   tab_style(
#'     style = cell_fill(color = "lightblue" |> adjust_luminance(steps = 2)),
#'     locations = cells_body(columns = -land_area_km2)
#'   ) |>
#'   tab_style(
#'     style = list(cell_fill(color = "gray35"), cell_text(color = "white")),
#'     locations = list(cells_footnotes(), cells_source_notes())
#'   ) |>
#'   tab_style(
#'     style = cell_fill(color = "gray98"),
#'     locations = cells_title()
#'   ) |>
#'   tab_style(
#'     style = cell_text(
#'       size = "smaller",
#'       weight = "bold",
#'       transform = "uppercase"
#'     ),
#'     locations = cells_stub()
#'   ) |>
#'   tab_style(
#'     style = cell_borders(
#'       sides = c("t", "b"),
#'       color = "powderblue",
#'       weight = px(3)
#'     ),
#'     locations = list(cells_column_labels(), cells_stubhead())
#'   )
#' ```
#'
#' \if{html}{\out{
#' `r man_get_image_tag(file = "man_tab_style_4.png")`
#' }}
#'
#' The [from_column()] helper function can be used to get values from a column.
#' We'll use it in the next example, which begins with a table having a color
#' name column and a column with the associated hexadecimal color code. To show
#' the color in a separate column, we first create one with [cols_add()] (
#' ensuring that missing values are replaced with `""` via [sub_missing()]).
#' Then, `tab_style()` is used to style that column, calling [from_column()] in
#' the `color` argument of the [cell_fill()] function.
#'
#' ```r
#' dplyr::tibble(
#'   name = c(
#'     "red", "green", "blue", "yellow", "orange",
#'     "cyan", "purple", "magenta", "lime", "pink"
#'   ),
#'   hex = c(
#'     "#E6194B", "#3CB44B", "#4363D8", "#FFE119", "#F58231",
#'     "#42D4F4", "#911EB4", "#F032E6", "#BFEF45", "#FABED4"
#'   )
#' ) |>
#'   gt(rowname_col = "name") |>
#'   cols_add(color = rep(NA_character_, 10)) |>
#'   sub_missing(missing_text = "") |>
#'   tab_style(
#'     style = cell_fill(color = from_column(column = "hex")),
#'     locations = cells_body(columns = color)
#'   ) |>
#'   tab_style(
#'     style = cell_text(font = system_fonts(name = "monospace-code")),
#'     locations = cells_body()
#'   ) |>
#'   opt_all_caps() |>
#'   cols_width(everything() ~ px(100)) |>
#'   tab_options(table_body.hlines.style = "none")
#' ```
#'
#' \if{html}{\out{
#' `r man_get_image_tag(file = "man_tab_style_5.png")`
#' }}
#'
#' The [cell_text()] function also allows the use of [from_column()] for many of
#' its arguments. Let's take a small portion of data from [`sp500`] and add an
#' up or down arrow based on the values in the `open` and `close` columns.
#' Within [cols_add()] we can create a new column (`dir`) with an expression to
#' get either `"red"` or `"green"` text from a comparison of the `open` and
#' `close` values. These values are transformed to up or down arrows with the
#' [text_case_match()] function, using **fontawesome** icons in the end.
#' However, the text values are still present and can be used by [cell_text()]
#' within `tab_style()`. The [from_column()] helper function makes it possible
#' to use the text in the cells of the `dir` column as `color` input values.
#'
#' ```r
#' sp500 |>
#'   dplyr::filter(date > "2015-01-01") |>
#'   dplyr::arrange(date) |>
#'   dplyr::slice_head(n = 5) |>
#'   dplyr::select(date, open, close) |>
#'   gt(rowname_col = "date") |>
#'   fmt_currency(columns = c(open, close)) |>
#'   cols_add(dir = ifelse(close < open, "red", "forestgreen")) |>
#'   cols_label(dir = "") |>
#'   text_case_match(
#'     "red" ~ fontawesome::fa("arrow-down"),
#'     "forestgreen" ~ fontawesome::fa("arrow-up")
#'   ) |>
#'   tab_style(
#'     style = cell_text(color = from_column("dir")),
#'     locations = cells_body(columns = dir)
#'   )
#' ```
#'
#' \if{html}{\out{
#' `r man_get_image_tag(file = "man_tab_style_6.png")`
#' }}
#'
#' @family part creation/modification functions
#' @section Function ID:
#' 2-10
#'
#' @section Function Introduced:
#' `v0.2.0.5` (March 31, 2020)
#'
#' @seealso [cell_text()], [cell_fill()], and [cell_borders()] as helpers for
#'   defining custom styles and [cells_body()] as one of many useful helper
#'   functions for targeting the locations to be styled.
#'
#' @export
tab_style <- function(
    data,
    style,
    locations
) {

  # Perform input object validation
  stop_if_not_gt_tbl(data = data)

  # Resolve into a list of locations
  locations <- as_locations(locations)

  # Upgrade `style` to be within a list if not provided as such
  if (inherits(style, "cell_styles")) {
    style <- list(style)
  }

  #
  # Begin support for `from_column()`
  #

  cell_helpers <-
    vapply(
      style,
      FUN.VALUE = character(1),
      USE.NAMES = FALSE,
      FUN = function(x) {
        x <- names(x)
        if (is.null(x)) {
          x <- "bare"
        }
        if (any(grepl("cell_border", x))) {
          x <- "cell_border"
        }
        x
      }
    )

  # Set `has_gt_column` as FALSE initially and toggle to TRUE if there is
  # any instance of `from_column()` used (a `gt_column` object will be present)
  has_gt_column <- FALSE

  for (i in seq_along(cell_helpers)) {

    if (!is.character(style) && is.list(style)) {
      style_i <- unlist(style, recursive = FALSE)
    } else {
      style_i <- style
    }

    if (cell_helpers[i] == "bare") {
      any_gt_column <- FALSE
    } else {
      any_gt_column <-
        any(
          vapply(
            style_i[[cell_helpers[i]]],
            FUN.VALUE = logical(1),
            USE.NAMES = FALSE,
            FUN = function(x) {
              inherits(x, "gt_column")
            }
          )
        )
    }

    if (any_gt_column) {
      has_gt_column <- TRUE
    }
  }

  if (has_gt_column) {

    # Stop if `locations` only refers to locations other than `cells_body()`
    for (i in seq_along(locations)) {

      any_non_body_location <-
        any(
          vapply(
            locations,
            FUN.VALUE = logical(1),
            USE.NAMES = FALSE,
            FUN = function(x) {
              !inherits(x, "cells_body")
            }
          )
        )

      if (any_non_body_location) {
        cli::cli_abort(c(
          "If using `from_column()` in a `cell_*()` function, the location helper
          used must be `cells_body().",
          "*" = "Please remove any other location helpers."
        ))
      }
    }

    # TODO: Extract only the body location from the `locations` object
    body_location <- locations[[1]]

    # Remove the outer list from the `style` object
    style <- unlist(style, recursive = FALSE)

    # Resolve the row numbers using the `resolve_rows_i` function
    resolved_rows_idx <-
      resolve_rows_i(
        expr = !!body_location$rows,
        data = data
      )

    for (i in seq_along(style)) {

      arg_vals <- unclass(style[[i]])

      param_tbl <-
        generate_param_tbl(
          data = data,
          arg_vals = arg_vals,
          resolved_rows_idx = resolved_rows_idx
        )

      if (names(style[i]) == "cell_fill") {

        for (j in seq_len(nrow(param_tbl))) {

          p_j <- as.list(param_tbl[j, ])

          data <-
            tab_style(
              data = data,
              style = cell_fill(
                color = p_j$color
              ),
              locations = cells_body(
                columns = !!body_location$columns,
                rows = resolved_rows_idx[j]
              )
            )
        }
      }

      if (names(style[i]) == "cell_text") {

        for (j in seq_len(nrow(param_tbl))) {

          p_j <- as.list(param_tbl[j, ])

          data <-
            tab_style(
              data = data,
              style = cell_text(
                color = p_j$color,
                font = p_j$font,
                size = p_j$size,
                align = p_j$align,
                v_align = p_j$v_align,
                style = p_j$style,
                weight = p_j$weight,
                stretch = p_j$stretch,
                decorate = p_j$decorate,
                transform = p_j$transform,
                whitespace = p_j$whitespace,
                indent = p_j$indent
              ),
              locations = cells_body(
                columns = !!body_location$columns,
                rows = resolved_rows_idx[j]
              )
            )
        }
      }

    }

    return(data)
  }

  #
  # End support for `gt_column()`
  #

  # Determine if there is a `cell_text` list within the main list;
  # because we need to intercept any provided `font` inputs in `cell_text`
  # this is the first thing we need to know
  has_cell_text <- "cell_text" %in% names(unlist(style, recursive = FALSE))

  # If the `cell_text` list is present we now need to determine if there
  # is indeed a `font` input within that list
  if (has_cell_text) {

    # The `style` list will itself contain several lists and it's
    # important to identify which one represents `cell_text`
    for (i in seq_along(style)) {
      if ("cell_text" %in% names(style[[i]])) {
        cell_text_idx <- i
      }
    }

    # If the `cell_text` list contains a `font` input then intercept
    # the font styles that require registration
    if ("font" %in% names(style[[cell_text_idx]][["cell_text"]])) {

      font <- style[[cell_text_idx]][["cell_text"]][["font"]]
      font <- normalize_font_input(font_input = font)

      existing_additional_css <-
        dt_options_get_value(
          data = data,
          option = "table_additional_css"
        )

      additional_css <- c(font$import_stmt, existing_additional_css)

      data <-
        tab_options(
          data = data,
          table.additional_css = additional_css
        )

      style[[cell_text_idx]][["cell_text"]][["font"]] <-
        as_css_font_family_attr(
          font_vec = font$name,
          value_only = TRUE
        )
    }
  }

  style <- as_style(style = style)

  # Resolve the locations of the targeted data cells and append
  # the format directives
  for (loc in locations) {

    data <-
      set_style(
        loc = loc,
        data = data,
        style = style
      )
  }

  data
}

as_style <- function(style) {

  # If style rules are part of a list, paste each of the list
  # components together
  if (!inherits(style, "cell_styles")) {

    # Initialize an empty list that will be
    # populated with normalized style declarations
    final_style <- list()

    for (i in seq(style)) {

      style_item <- style[[i]]

      if (inherits(style_item, "character")) {

        style_item <- list(cell_style = style_item)

      } else if (!inherits(style_item, "cell_styles")) {

        cli::cli_abort(c(
          "All provided styles should be generated by stylizing
          helper functions.",
          "*" = "Style with index `{i}` is invalid."
        ))
      }

      final_style <- utils::modifyList(final_style, style_item)
    }

    class(final_style) <- "cell_styles"

    style <- final_style
  }

  style
}

set_style <- function(loc, data, style) {
  UseMethod("set_style")
}

set_style.cells_title <- function(loc, data, style) {

  title_components <- rlang::eval_tidy(loc$groups)

  if ("title" %in% title_components) {

    data <-
      dt_styles_add(
        data = data,
        locname = "title",
        grpname = NA_character_,
        colname = NA_character_,
        locnum = 1,
        rownum = NA_integer_,
        styles = style
      )
  }

  if ("subtitle" %in% title_components) {

    data <-
      dt_styles_add(
        data = data,
        locname = "subtitle",
        grpname = NA_character_,
        colname = NA_character_,
        locnum = 2,
        rownum = NA_integer_,
        styles = style
      )
  }

  data
}

set_style.cells_stubhead <- function(loc, data, style) {

  data <-
    dt_styles_add(
      data = data,
      locname = loc$groups,
      grpname = NA_character_,
      colname = NA_character_,
      locnum = 2.5,
      rownum = NA_integer_,
      styles = style
    )

  data
}

set_style.cells_column_labels <- function(loc, data, style) {

  resolved <- resolve_cells_column_labels(data = data, object = loc)

  cols <- resolved$columns

  colnames <- names(cols)

  data <-
    dt_styles_add(
      data = data,
      locname = "columns_columns",
      grpname = NA_character_,
      colname = colnames,
      locnum = 4,
      rownum = NA_integer_,
      styles = style
    )

  data
}

set_style.cells_column_spanners <- function(loc, data, style) {

  resolved <- resolve_cells_column_spanners(data = data, object = loc)

  groups <- resolved$spanners

  data <-
    dt_styles_add(
      data = data,
      locname = "columns_groups",
      grpname = groups,
      colname = NA_character_,
      locnum = 3,
      rownum = NA_integer_,
      styles = style
    )

  data
}

set_style.cells_row_groups <- function(loc, data, style) {

  row_groups <- dt_row_groups_get(data = data)

  # Resolve row groups
  resolved_row_groups_idx <-
    resolve_vector_i(
      expr = !!loc$groups,
      vector = row_groups,
      item_label = "row group"
    )

  groups <- row_groups[resolved_row_groups_idx]

  data <-
    dt_styles_add(
      data = data,
      locname = "row_groups",
      grpname = groups,
      colname = NA_character_,
      locnum = 5,
      rownum = NA_integer_,
      styles = style
    )

  data
}

set_style.cells_body <- function(loc, data, style) {

  resolved <- resolve_cells_body(data = data, object = loc)

  rows <- resolved$rows

  colnames <- resolved$colnames

  data <-
    dt_styles_add(
      data = data,
      locname = "data",
      grpname = NA_character_,
      colname = colnames,
      locnum = 5,
      rownum = rows,
      styles = style
    )

  data
}

set_style.cells_stub <- function(loc, data, style) {

  resolved <- resolve_cells_stub(data = data, object = loc)

  rows <- resolved$rows

  data <-
    dt_styles_add(
      data = data,
      locname = "stub",
      grpname = NA_character_,
      colname = NA_character_,
      locnum = 5,
      rownum = rows,
      styles = style
    )

  data
}

set_style.cells_summary <- function(loc, data, style) {

  add_summary_location_row(
    loc = loc,
    data = data,
    style = style,
    df_type = "styles_df"
  )
}

set_style.cells_grand_summary <- function(loc, data, style) {

  add_grand_summary_location_row(
    loc = loc,
    data = data,
    style = style,
    df_type = "styles_df"
  )
}

set_style.cells_stub_summary <- function(loc, data, style) {

  add_summary_location_row(
    loc = loc,
    data = data,
    style = style,
    df_type = "styles_df"
  )
}

set_style.cells_stub_grand_summary <- function(loc, data, style) {

  add_grand_summary_location_row(
    loc = loc,
    data = data,
    style = style,
    df_type = "styles_df"
  )
}

set_style.cells_footnotes <- function(loc, data, style) {

  data <-
    dt_styles_add(
      data = data,
      locname = "footnotes",
      grpname = NA_character_,
      colname = NA_character_,
      locnum = 7,
      rownum = NA_integer_,
      styles = style
    )
}

set_style.cells_source_notes <- function(loc, data, style) {

  data <-
    dt_styles_add(
      data = data,
      locname = "source_notes",
      grpname = NA_character_,
      colname = NA_character_,
      locnum = 8,
      rownum = NA_integer_,
      styles = style
    )
}

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
#'   percentage (e.g., `80\%`). If provided as a single-length numeric vector,
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
#'   of the the `column_labels`.
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
#'   footnotes (same input as the [opt_footnote_marks()] function). We can
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
#'   (`footnotes.spec_ftr`) (same input as the [opt_footnote_spec()] function).
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
#' @param page.orientation *Set RTF page orientation*
#'
#'   For RTF output, this provides an two options for page
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
#' @return An object of class `gt_tbl`.
#'
#' @section Examples:
#'
#' Use select columns from the [`exibble`] dataset to create a **gt** table with
#' a number of table parts added (using functions like [summary_rows()],
#' [grand_summary_rows()], and more). We can use this **gt** object going
#' forward to demo some of the features available in the `tab_options()`
#' function.
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
    page.footer.height = NULL,
    quarto.use_bootstrap = NULL,
    quarto.disable_processing = NULL
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
    dplyr::tibble(
      parameter = tidy_gsub(names(arg_vals), ".", "_", fixed = TRUE),
      value = unname(arg_vals)
    )
  new_df <-
    dplyr::left_join(
      new_df,
      dplyr::select(opts_df, parameter, type),
      by = "parameter"
    )
  new_df <-
    dplyr::mutate(
      new_df,
      value = mapply(
        preprocess_tab_option,
        option = value, var_name = parameter, type = type,
        SIMPLIFY = FALSE
      )
    )
  new_df <- dplyr::select(new_df, -type)

  # This rearranges the rows in the `opts_df` table, but this
  # shouldn't be a problem
  opts_df <-
    dplyr::bind_rows(
      dplyr::inner_join(
        new_df,
        dplyr::select(opts_df, -value),
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

preprocess_tab_option <- function(option, var_name, type) {

  # Perform pre-processing on the option depending on `type`
  option <-
    switch(
      type,
      overflow = {
        if (isTRUE(option)) {
          "auto"
        } else if (is_false(option)) {
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

  # Perform `stopifnot()` checks by `type`
  switch(
    type,
    logical = stopifnot(rlang::is_scalar_logical(option), !any(is.na(option))),
    overflow = ,
    px = ,
    value = stopifnot(rlang::is_scalar_character(option), !any(is.na(option))),
    values = stopifnot(rlang::is_character(option), length(option) >= 1, !any(is.na(option)))
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

  arg_vals
}
