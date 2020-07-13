#' Add a table header
#'
#' We can add a table header to the **gt** table with a title and even a
#' subtitle. A table header is an optional table part that is positioned above
#' the column labels. We have the flexibility to use Markdown formatting for the
#' header's title and subtitle. Furthermore, if the table is intended for HTML
#' output, we can use HTML in either of the title or subtitle.
#'
#' @inheritParams fmt_number
#' @param title,subtitle Text to be used in the table title and, optionally, for
#'   the table subtitle. We can elect to use the [md()] and [html()] helper
#'   functions to style the text as Markdown or to retain HTML elements in the
#'   text.
#'
#' @return An object of class `gt_tbl`.
#'
#' @examples
#' # Use `gtcars` to create a gt table;
#' # add a header part to contain a title
#' # and subtitle
#' tab_1 <-
#'   gtcars %>%
#'   dplyr::select(mfr, model, msrp) %>%
#'   dplyr::slice(1:5) %>%
#'   gt() %>%
#'   tab_header(
#'     title = md("Data listing from **gtcars**"),
#'     subtitle = md("`gtcars` is an R dataset")
#'   )
#'
#' @section Figures:
#' \if{html}{\figure{man_tab_header_1.png}{options: width=100\%}}
#'
#' @family Create or Modify Parts
#' @section Function ID:
#' 2-1
#'
#' @export
tab_header <- function(data,
                       title,
                       subtitle = NULL) {

  # Perform input object validation
  stop_if_not_gt(data = data)

  data %>% dt_heading_title_subtitle(title = title, subtitle = subtitle)
}

#' Add a spanner column label
#'
#' Set a spanner column label by mapping it to columns already in the table.
#' This label is placed above one or more column labels, spanning the width of
#' those columns and column labels.
#'
#' @inheritParams fmt_number
#' @param label The text to use for the spanner column label.
#' @param columns The columns to be components of the spanner heading.
#' @param gather An option to move the specified `columns` such that they are
#'   unified under the spanner column label. Ordering of the moved-into-place
#'   columns will be preserved in all cases.
#'
#' @return An object of class `gt_tbl`.
#'
#' @examples
#' # Use `gtcars` to create a gt table;
#' # Group several columns related to car
#' # performance under a spanner column
#' # with the label `performance`
#' tab_1 <-
#'   gtcars %>%
#'   dplyr::select(
#'     -mfr, -trim, bdy_style, drivetrain,
#'     -drivetrain, -trsmn, -ctry_origin
#'   ) %>%
#'   dplyr::slice(1:8) %>%
#'   gt(rowname_col = "model") %>%
#'   tab_spanner(
#'     label = "performance",
#'     columns = vars(
#'       hp, hp_rpm, trq, trq_rpm,
#'       mpg_c, mpg_h)
#'   )
#'
#' @section Figures:
#' \if{html}{\figure{man_tab_spanner_1.png}{options: width=100\%}}
#'
#' @family Create or Modify Parts
#' @section Function ID:
#' 2-2
#'
#' @export
tab_spanner <- function(data,
                        label,
                        columns,
                        gather = TRUE) {

  # Perform input object validation
  stop_if_not_gt(data = data)

  checkmate::assert_character(
    label, len = 1, any.missing = FALSE, null.ok = FALSE)

  columns <- enquo(columns)

  # Get the columns supplied in `columns` as a character vector
  column_names <- resolve_vars(var_expr = !!columns, data = data)

  data <-
    dt_spanners_add(
      data = data,
      vars = column_names,
      spanner_label = label,
      gather = gather
    )

  if (isTRUE(gather) && length(column_names) >= 1) {

    # Move columns into place
    data <-
      data %>%
      cols_move(
        columns = column_names,
        after = column_names[1]
      )
  }

  data
}

#' Create column labels and spanners via delimited names
#'
#' This function will split selected delimited column names such that the first
#' components (LHS) are promoted to being spanner column labels, and the
#' secondary components (RHS) will become the column labels. Please note that
#' reference to individual columns must continue to be the column names from the
#' input table data (which are unique by necessity).
#'
#' If we look to the column names in the `iris` dataset as an example of how
#' `tab_spanner_delim()` might be useful, we find the names `Sepal.Length`,
#' `Sepal.Width`, `Petal.Length`, `Petal.Width`. From this naming system, it's
#' easy to see that the `Sepal` and `Petal` can group together the repeated
#' common `Length` and `Width` values. In your own datasets, we can avoid a
#' lengthy relabeling with [cols_label()] if column names can be fashioned
#' beforehand to contain both the spanner column label and the column label. An
#' additional advantage is that the column names in the input table data remain
#' unique even though there may eventually be repeated column labels in the
#' rendered output table).
#'
#' @inheritParams cols_align
#' @inheritParams tab_spanner
#' @param delim The delimiter to use to split an input column name. The
#'   delimiter supplied will be autoescaped for the internal splitting
#'   procedure. The first component of the split will become the group name and
#'   the second component will be the column label.
#' @param columns An optional vector of column names that this operation should
#'   be limited to. The default is to consider all columns in the table.
#'
#' @return An object of class `gt_tbl`.
#'
#' @examples
#' # Use `iris` to create a gt table; split
#' # any columns that are dot-separated
#' # between column spanner labels (first
#' # part) and column labels (second part)
#' tab_1 <-
#'   iris %>%
#'   dplyr::group_by(Species) %>%
#'   dplyr::slice(1:4) %>%
#'   gt() %>%
#'   tab_spanner_delim(delim = ".")
#'
#' @section Figures:
#' \if{html}{\figure{man_tab_spanner_delim_1.png}{options: width=100\%}}
#'
#' @family Create or Modify Parts
#' @section Function ID:
#' 2-3
#'
#' @export
tab_spanner_delim <- function(data,
                              delim,
                              columns = NULL,
                              gather = TRUE) {

  # Perform input object validation
  stop_if_not_gt(data = data)

  columns <- enquo(columns)

  # Get all of the columns in the dataset
  all_cols <- data %>% dt_boxhead_get_vars()

  # Get the columns supplied in `columns` as a character vector
  columns <- resolve_vars(var_expr = !!columns, data = data)

  if (!is.null(columns)) {
    colnames <- base::intersect(all_cols, columns)
  } else {
    colnames <- all_cols
  }

  if (length(colnames) == 0) {
    return(data)
  }

  colnames_has_delim <- grepl(pattern = delim, x = colnames, fixed = TRUE)

  if (any(colnames_has_delim)) {

    colnames_with_delim <- colnames[colnames_has_delim]

    split_colnames <- strsplit(colnames_with_delim, delim, fixed = TRUE)

    spanners <- vapply(split_colnames, `[[`, character(1), 1)

    new_labels <-
      lapply(split_colnames, `[[`, -1) %>%
      vapply(paste0, FUN.VALUE = character(1), collapse = delim)

    for (i in seq_along(split_colnames)) {

      spanners_i <- spanners[i]
      new_labels_i <- new_labels[i]
      var_i <- colnames_with_delim[i]

      data <-
        data %>%
        dt_boxhead_edit(var = var_i, column_label = new_labels_i)
    }

    spanner_var_list <- split(colnames_with_delim, spanners)

    for (spanner_label in names(spanner_var_list)) {

      data <-
        data %>%
        dt_spanners_add(
          vars = spanner_var_list[[spanner_label]],
          spanner_label = spanner_label,
          gather = gather
        )
    }
  }

  data
}

#' Add a row group to a **gt** table
#'
#' Create a row group with a collection of rows. This requires specification of
#' the rows to be included, either by supplying row labels, row indices, or
#' through use of a select helper function like `starts_with()`.
#'
#' @inheritParams fmt_number
#' @param group The name of the row group. This text will also serve as the row
#'   group label.
#' @param rows The rows to be made components of the row group. Can either be a
#'   vector of row captions provided in `c()`, a vector of row indices, or a
#'   helper function focused on selections. The select helper functions are:
#'   [starts_with()], [ends_with()], [contains()], [matches()], [one_of()], and
#'   [everything()].
#' @param others An option to set a default row group label for any rows not
#'   formally placed in a row group named by `group` in any call of
#'   `tab_row_group()`. A separate call to `tab_row_group()` with only a value
#'   to `others` is possible and makes explicit that the call is meant to
#'   provide a default row group label. If this is not set and there are rows
#'   that haven't been placed into a row group (where one or more row groups
#'   already exist), those rows will be automatically placed into a row group
#'   without a label.
#'
#' @return An object of class `gt_tbl`.
#'
#' @examples
#' # Use `gtcars` to create a gt table and
#' # add two row groups with the labels:
#' # `numbered` and `NA` (a group without
#' # a title, or, the rest)
#' tab_1 <-
#'   gtcars %>%
#'   dplyr::select(model, year, hp, trq) %>%
#'   dplyr::slice(1:8) %>%
#'   gt(rowname_col = "model") %>%
#'   tab_row_group(
#'     group = "numbered",
#'     rows = matches("^[0-9]")
#'   )
#'
#' # Use `gtcars` to create a gt table;
#' # add two row groups with the labels
#' # `powerful` and `super powerful`: the
#' # distinction being `hp` lesser or
#' # greater than `600`
#' tab_2 <-
#'   gtcars %>%
#'   dplyr::select(model, year, hp, trq) %>%
#'   dplyr::slice(1:8) %>%
#'   gt(rowname_col = "model") %>%
#'   tab_row_group(
#'     group = "powerful",
#'     rows = hp <= 600
#'   ) %>%
#'   tab_row_group(
#'     group = "super powerful",
#'     rows = hp > 600
#'   )
#'
#' @section Figures:
#' \if{html}{\figure{man_tab_row_group_1.png}{options: width=100\%}}
#'
#' \if{html}{\figure{man_tab_row_group_2.png}{options: width=100\%}}
#'
#' @family Create or Modify Parts
#' @section Function ID:
#' 2-4
#'
#' @import rlang
#' @export
tab_row_group <- function(data,
                          group = NULL,
                          rows = NULL,
                          others = NULL) {

  # Perform input object validation
  stop_if_not_gt(data = data)

  arrange_groups_vars <- dt_row_groups_get(data = data)

  # Capture the `rows` expression
  row_expr <- rlang::enquo(rows)

  # Create a row group if a `group` is provided
  if (!is.null(group)) {

    # Get the `stub_df` data frame from `data`
    stub_df <- dt_stub_df_get(data = data)
    data_tbl <- dt_data_get(data = data)

    # Resolve the row numbers using the `resolve_vars` function
    resolved_rows_idx <-
      resolve_data_vals_idx(
        var_expr = !!row_expr,
        data_tbl = data_tbl,
        vals = stub_df$rowname
      )

    # Place the `group` label in the `groupname` column `stub_df`
    stub_df <- dt_stub_df_get(data = data)

    stub_df[resolved_rows_idx, "groupname"] <- process_text(group[1])

    data <- dt_stub_df_set(data = data, stub_df = stub_df)

    if (dt_stub_groupname_has_na(data = data)) {

      data <-
        dt_row_groups_set(
          data = data,
          row_groups = c(
            process_text(group[1]),
            arrange_groups_vars,
            NA_character_
          ) %>%
            unique()
        )

    } else {

      data <-
        dt_row_groups_set(
          data = data,
          row_groups = c(
            process_text(group[1]),
            arrange_groups_vars
          ) %>%
            unique()
        )
    }
  }

  # Set a name for the `others` group if a
  # name is provided
  if (!is.null(others)) {
    data <-
      dt_stub_others_set(
        data = data,
        stub_others = others[1] %>% process_text()
      )
  }

  data
}

#' Add label text to the stubhead
#'
#' Add a label to the stubhead of a **gt** table. The stubhead is the lone
#' element that is positioned left of the column labels, and above the stub. If
#' a stub does not exist, then there is no stubhead (so no change will be made
#' when using this function in that case). We have the flexibility to use
#' Markdown formatting for the stubhead label. Furthermore, if the table is
#' intended for HTML output, we can use HTML for the stubhead label.
#'
#' @inheritParams fmt_number
#' @param label The text to be used as the stubhead label We can optionally use
#'   the [md()] and [html()] functions to style the text as Markdown or to
#'   retain HTML elements in the text.
#'
#' @return An object of class `gt_tbl`.
#'
#' @examples
#' # Use `gtcars` to create a gt table; add
#' # a stubhead label to describe what is
#' # in the stub
#' tab_1 <-
#'   gtcars %>%
#'   dplyr::select(model, year, hp, trq) %>%
#'   dplyr::slice(1:5) %>%
#'   gt(rowname_col = "model") %>%
#'   tab_stubhead(label = "car")
#'
#' @section Figures:
#' \if{html}{\figure{man_tab_stubhead_1.png}{options: width=100\%}}
#'
#' @family Create or Modify Parts
#' @section Function ID:
#' 2-5
#'
#' @export
tab_stubhead <- function(data,
                         label) {

  # Perform input object validation
  stop_if_not_gt(data = data)

  data %>% dt_stubhead_label(label = label)
}

#' Add a table footnote
#'
#' The `tab_footnote()` function can make it a painless process to add a
#' footnote to a **gt** table. There are two components to a footnote: (1) a
#' footnote mark that is attached to the targeted cell text, and (2) the
#' footnote text (that starts with the corresponding footnote mark) that is
#' placed in the table's footer area. Each call of `tab_footnote()` will add a
#' different note, and one or more cells can be targeted via the location helper
#' functions (e.g., [cells_body()], [cells_column_labels()], etc.).
#'
#' The formatting of the footnotes can be controlled through the use of various
#' parameters in the [tab_options()] function:
#'
#' \itemize{
#'   \item `footnotes.sep`: allows for a choice of the separator between
#' consecutive footnotes in the table footer. By default, this is set to a
#' linebreak.
#'   \item `footnotes.marks`: the set of sequential characters or numbers used
#' to identify the footnotes.
#'   \item `footnotes.font.size`: the size of the font used in the footnote
#' section.
#'   \item `footnotes.padding`: the amount of padding to apply between the
#' footnote and source note sections in the table footer.
#' }
#'
#' @inheritParams fmt_number
#' @param footnote The text to be used in the footnote. We can optionally use
#'   the [md()] and [html()] functions to style the text as Markdown or to
#'   retain HTML elements in the footnote text.
#' @param locations The cell or set of cells to be associated with the footnote.
#'   Supplying any of the `cells_*()` helper functions is a useful way to target
#'   the location cells that are associated with the footnote text. These helper
#'   functions are: [cells_title()], [cells_stubhead()],
#'   [cells_column_spanners()], [cells_column_labels()], [cells_row_groups()],
#'   [cells_stub()], [cells_body()], [cells_summary()], and
#'   [cells_grand_summary()]. Additionally, we can enclose several `cells_*()`
#'   calls within a `list()` if we wish to link the footnote text to different
#'   types of locations (e.g., body cells, row group labels, the table title,
#'   etc.).
#'
#' @return An object of class `gt_tbl`.
#'
#' @examples
#' # Use `sza` to create a gt table; color
#' # the `sza` column using the `data_color()`
#' # function, then, add a footnote to the
#' # `sza` column label explaining what the
#' # color scale signifies
#' tab_1 <-
#'   sza %>%
#'   dplyr::filter(
#'     latitude == 20 &
#'       month == "jan" &
#'       !is.na(sza)
#'   ) %>%
#'   dplyr::select(-latitude, -month) %>%
#'   gt() %>%
#'   data_color(
#'     columns = vars(sza),
#'     colors = scales::col_numeric(
#'       palette = c("white", "yellow", "navyblue"),
#'       domain = c(0, 90))
#'   ) %>%
#'   tab_footnote(
#'     footnote = "Color indicates height of sun.",
#'     locations = cells_column_labels(
#'       columns = vars(sza))
#'   )
#'
#' @section Figures:
#' \if{html}{\figure{man_tab_footnote_1.png}{options: width=100\%}}
#'
#' @family Create or Modify Parts
#' @section Function ID:
#' 2-6
#'
#' @export
tab_footnote <- function(data,
                         footnote,
                         locations) {

  # Perform input object validation
  stop_if_not_gt(data = data)

  # Resolve into a list of locations
  locations <- as_locations(locations)

  # Resolve the locations of the targeted data cells and append
  # the footnotes
  for (loc in locations) {
    data <- set_footnote(loc = loc, data = data, footnote = process_text(footnote))
  }

  data
}

set_footnote <- function(loc, data, footnote) {
  UseMethod("set_footnote")
}

set_footnote.cells_title <- function(loc, data, footnote) {

  if ((loc$groups %>% rlang::eval_tidy()) == "title") {

    data <-
      dt_footnotes_add(
        data = data,
        locname = "title",
        grpname = NA_character_,
        colname = NA_character_,
        locnum = 1,
        rownum = NA_integer_,
        footnotes = footnote
      )

  } else if ((loc$groups %>% rlang::eval_tidy()) == "subtitle") {

    data <-
      dt_footnotes_add(
        data = data,
        locname = "subtitle",
        grpname = NA_character_,
        colname = NA_character_,
        locnum = 2,
        rownum = NA_integer_,
        footnotes = footnote
      )
  }

  data
}

set_footnote.cells_stubhead <- function(loc, data, footnote) {

  data <-
    dt_footnotes_add(
      data = data,
      locname = loc$groups,
      grpname = NA_character_,
      colname = NA_character_,
      locnum = 2.5,
      rownum = NA_integer_,
      footnotes = footnote
    )

  data
}

set_footnote.cells_column_labels <- function(loc, data, footnote) {

  resolved <- resolve_cells_column_labels(data = data, object = loc)

  cols <- resolved$columns

  colnames <- dt_boxhead_get_vars_default(data = data)[cols]

  data <-
    dt_footnotes_add(
      data = data,
      locname = "columns_columns",
      grpname = NA_character_,
      colname = colnames,
      locnum = 4,
      rownum = NA_integer_,
      footnotes = footnote
    )

  data
}

set_footnote.cells_column_spanners <- function(loc, data, footnote) {

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
      footnotes = footnote
    )

  data
}

set_footnote.cells_row_groups <- function(loc, data, footnote) {

  row_groups <- dt_row_groups_get(data = data)

  # Resolve row groups
  resolved_row_groups_idx <-
    resolve_data_vals_idx(
      var_expr = !!loc$groups,
      data_tbl = NULL,
      vals = row_groups
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
      footnotes = footnote
    )

  data
}

set_footnote.cells_body <- function(loc, data, footnote) {

  resolved <- resolve_cells_body(data = data, object = loc)

  cols <- resolved$columns
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
      footnotes = footnote
    )

  data
}

set_footnote.cells_stub <- function(loc, data, footnote) {

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
      footnotes = footnote
    )

  data
}

set_footnote.cells_summary <- function(loc, data, footnote) {

  add_summary_location_row(
    loc = loc,
    data = data,
    style = footnote,
    df_type = "footnotes_df"
  )
}

set_footnote.cells_grand_summary <- function(loc, data, footnote) {

  add_grand_summary_location_row(
    loc = loc,
    data = data,
    style = footnote,
    df_type = "footnotes_df"
  )
}

#' Add a source note citation
#'
#' Add a source note to the footer part of the **gt** table. A source note is
#' useful for citing the data included in the table. Several can be added to the
#' footer, simply use multiple calls of `tab_source_note()` and they will be
#' inserted in the order provided. We can use Markdown formatting for the note,
#' or, if the table is intended for HTML output, we can include HTML formatting.
#'
#' @inheritParams fmt_number
#' @param source_note Text to be used in the source note. We can optionally use
#'   the [md()] and [html()] functions to style the text as Markdown or to
#'   retain HTML elements in the text.
#'
#' @return An object of class `gt_tbl`.
#'
#' @examples
#' # Use `gtcars` to create a gt table;
#' # add a source note to the table
#' # footer that cites the data source
#' tab_1 <-
#'   gtcars %>%
#'   dplyr::select(mfr, model, msrp) %>%
#'   dplyr::slice(1:5) %>%
#'   gt() %>%
#'   tab_source_note(
#'     source_note = "From edmunds.com"
#'   )
#'
#' @section Figures:
#' \if{html}{\figure{man_tab_source_note_1.png}{options: width=100\%}}
#'
#' @family Create or Modify Parts
#' @section Function ID:
#' 2-7
#'
#' @export
tab_source_note <- function(data,
                            source_note) {

  # Perform input object validation
  stop_if_not_gt(data = data)

  data %>% dt_source_notes_add(source_note = source_note)
}

#' Add custom styles to one or more cells
#'
#' With the `tab_style()` function we can target specific cells and apply styles
#' to them. This is best done in conjunction with the helper functions
#' [cell_text()], [cell_fill()], and [cell_borders()]. At present this function
#' is focused on the application of styles for HTML output only (as such, other
#' output formats will ignore all `tab_style()` calls). Using the aforementioned
#' helper functions, here are some of the styles we can apply:
#' \itemize{
#' \item the background color of the cell ([cell_fill()]: `color`)
#' \item the cell's text color, font, and size ([cell_text()]: `color`, `font`,
#' `size`)
#' \item the text style ([cell_text()]: `style`), enabling the use of italics or
#' oblique text.
#' \item the text weight ([cell_text()]: `weight`), allowing the use of thin to
#' bold text (the degree of choice is greater with variable fonts)
#' \item the alignment and indentation of text ([cell_text()]: `align` and
#' `indent`)
#' \item the cell borders ([cell_borders()])
#' }
#'
#' @inheritParams fmt_number
#' @param style a vector of styles to use. The [cell_text()], [cell_fill()], and
#'   [cell_borders()] helper functions can be used here to more easily generate
#'   valid styles.  If using more than one helper function to define styles, all
#'   calls must be enclosed in a [list()]. Custom CSS declarations can be used
#'   for HTML output by including a [css()]-based statement as a list item.
#' @param locations the cell or set of cells to be associated with the style.
#'   Supplying any of the `cells_*()` helper functions is a useful way to target
#'   the location cells that are associated with the styling. These helper
#'   functions are: [cells_title()], [cells_stubhead()],
#'   [cells_column_spanners()], [cells_column_labels()], [cells_row_groups()],
#'   [cells_stub()], [cells_body()], [cells_summary()], and
#'   [cells_grand_summary()]. Additionally, we can enclose several `cells_*()`
#'   calls within a `list()` if we wish to apply styling to different types of
#'   locations (e.g., body cells, row group labels, the table title, etc.).
#'
#' @return An object of class `gt_tbl`.
#'
#' @examples
#' # Use `exibble` to create a gt table;
#' # add styles that are to be applied
#' # to data cells that satisfy a
#' # condition (using `tab_style()`)
#' tab_1 <-
#'   exibble %>%
#'   dplyr::select(num, currency) %>%
#'   gt() %>%
#'   fmt_number(
#'     columns = vars(num, currency),
#'     decimals = 1
#'   ) %>%
#'   tab_style(
#'     style = list(
#'       cell_fill(color = "lightcyan"),
#'       cell_text(weight = "bold")
#'       ),
#'     locations = cells_body(
#'       columns = vars(num),
#'       rows = num >= 5000)
#'   ) %>%
#'   tab_style(
#'     style = list(
#'       cell_fill(color = "#F9E3D6"),
#'       cell_text(style = "italic")
#'       ),
#'     locations = cells_body(
#'       columns = vars(currency),
#'       rows = currency < 100)
#'   )
#'
#' # Use `sp500` to create a gt table;
#' # color entire rows of cells based
#' # on values in a particular column
#' tab_2 <-
#'   sp500 %>%
#'   dplyr::filter(
#'     date >= "2015-12-01" &
#'     date <= "2015-12-15"
#'   ) %>%
#'   dplyr::select(-c(adj_close, volume)) %>%
#'   gt() %>%
#'   tab_style(
#'     style = cell_fill(color = "lightgreen"),
#'     locations = cells_body(
#'       rows = close > open)
#'   ) %>%
#'   tab_style(
#'     style = list(
#'       cell_fill(color = "red"),
#'       cell_text(color = "white")
#'       ),
#'     locations = cells_body(
#'       rows = open > close)
#'   )
#'
#' # Use `exibble` to create a gt table;
#' # replace missing values with the
#' # `fmt_missing()` function and then
#' # add styling to the `char` column
#' # with `cell_fill()` and with a
#' # CSS style declaration
#' tab_3 <-
#'   exibble %>%
#'   dplyr::select(char, fctr) %>%
#'   gt() %>%
#'   fmt_missing(everything()) %>%
#'   tab_style(
#'     style = list(
#'       cell_fill(color = "lightcyan"),
#'       "font-variant: small-caps;"
#'     ),
#'     locations = cells_body(columns = vars(char))
#'   )
#'
#' @section Figures:
#' \if{html}{\figure{man_tab_style_1.png}{options: width=100\%}}
#'
#' \if{html}{\figure{man_tab_style_2.png}{options: width=100\%}}
#'
#' \if{html}{\figure{man_tab_style_3.png}{options: width=100\%}}
#'
#' @family Create or Modify Parts
#' @section Function ID:
#' 2-8
#'
#' @seealso [cell_text()], [cell_fill()], and [cell_borders()] as helpers for
#'   defining custom styles and [cells_body()] as one of many useful helper
#'   functions for targeting the locations to be styled.
#'
#' @export
tab_style <- function(data,
                      style,
                      locations) {

  # Perform input object validation
  stop_if_not_gt(data = data)

  # Intercept font styles that require registration
  if ("cell_text" %in% names(style)) {

    if ("font" %in% names(style[["cell_text"]])) {

      font <- style[["cell_text"]][["font"]]
      font <- normalize_font_input(font_input = font)

      existing_additional_css <- dt_options_get_value(data = data, option = "table_additional_css")
      additional_css <- c(font$import_stmt, existing_additional_css)

      data <- tab_options(data = data, table.additional_css = additional_css)

      font_names <- font$name

      style[["cell_text"]][["font"]] <-
        as_css_font_family_attr(font_vec = font_names, value_only = TRUE)
    }
  }

  # Resolve into a list of locations
  locations <- as_locations(locations)

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

    # if (!inherits(style, "list")) {
    #   stop("Styles should be provided exclusively by the stylizing ",
    #        "helper functions:\n",
    #        " * `cell_text()\n",
    #        " * `cell_fill()\n",
    #        " * `cell_borders()`",
    #        call. = FALSE)
    # }

    # Initialize an empty list that will be
    # populated with normalized style declarations
    final_style <- list()

    for (i in seq(style)) {

      style_item <- style[[i]]

      if (inherits(style_item, "character")) {

        style_item <- list(cell_style = style_item)

      } else if (!inherits(style_item, "cell_styles")) {

        stop("All provided styles should be generated by stylizing ",
             "helper functions. Style with index `", i, "` is invalid.",
             call. = FALSE)
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

  if ((loc$groups %>% rlang::eval_tidy()) == "title") {

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

  } else if ((loc$groups %>% rlang::eval_tidy()) == "subtitle") {

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

  colnames <- dt_boxhead_get_vars_default(data = data)[cols]

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
    resolve_data_vals_idx(
      var_expr = !!loc$groups,
      data_tbl = NULL,
      vals = row_groups
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

  cols <- resolved$columns
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

#' Modify the table output options
#'
#' Modify the options available in a table. These options are named by the
#' components, the subcomponents, and the element that can adjusted.
#'
#' @inheritParams fmt_number
#' @param container.width,container.height The width and height of the table's
#'   container. Can be specified as a single-length character with units of
#'   pixels or as a percentage. If provided as a single-length numeric vector,
#'   it is assumed that the value is given in units of pixels. The [px()] and
#'   [pct()] helper functions can also be used to pass in numeric values and
#'   obtain values as pixel or percent units.
#' @param container.overflow.x,container.overflow.y Options to enable scrolling
#'   in the horizontal and vertical directions when the table content overflows
#'   the container dimensions. Using `TRUE` (the default for both) means that
#'   horizontal or vertical scrolling is enabled to view the entire table in
#'   those directions. With `FALSE`, the table may be clipped if the table width
#'   or height exceeds the `container.width` or `container.height`.
#' @param table.width The width of the table. Can be specified as a
#'   single-length character with units of pixels or as a percentage. If
#'   provided as a single-length numeric vector, it is assumed that the value is
#'   given in units of pixels. The [px()] and [pct()] helper functions can also
#'   be used to pass in numeric values and obtain values as pixel or percent
#'   units.
#' @param table.layout The value for the `table-layout` CSS style in the HTML
#'   output context. By default, this is `"fixed"` but another valid option is
#'   `"auto"`.
#' @param table.align The horizontal alignment of the table in its container. By
#'   default, this is `"center"`. Other options are `"left"` and `"right"`. This
#'   will automatically set `table.margin.left` and `table.margin.right` to the
#'   appropriate values.
#' @param table.margin.left,table.margin.right The size of the margins on the
#'   left and right of the table within the container. Can be specified as a
#'   single-length character with units of pixels or as a percentage. If
#'   provided as a single-length numeric vector, it is assumed that the value is
#'   given in units of pixels. The [px()] and [pct()] helper functions can also
#'   be used to pass in numeric values and obtain values as pixel or percent
#'   units. Using `table.margin.left` or `table.margin.right` will overwrite any
#'   values set by `table.align`.
#' @param table.background.color,heading.background.color,column_labels.background.color,row_group.background.color,stub.background.color,summary_row.background.color,grand_summary_row.background.color,footnotes.background.color,source_notes.background.color
#'   Background colors for the parent element `table` and the following child
#'   elements: `heading`, `column_labels`, `row_group`, `stub`, `summary_row`,
#'   `grand_summary_row`, `footnotes`, and `source_notes`. A color name or a
#'   hexadecimal color code should be provided.
#' @param table.additional_css This option can be used to supply an additional
#'   block of CSS rules to be applied after the automatically generated table
#'   CSS.
#' @param table.font.names The names of the fonts used for the table. This is
#'   a vector of several font names. If the first font isn't available, then
#'   the next font is tried (and so on).
#' @param table.font.style The font style for the table. Can be one of either
#'   `"normal"`, `"italic"`, or `"oblique"`.
#' @param table.font.color,table.font.color.light
#'   The text color used throughout the table. There are two variants:
#'   `table.font.color` is for text overlaid on lighter background colors, and
#'   `table.font.color.light` is automatically used when text needs to be
#'   overlaid on darker background colors. A color name or a hexadecimal color
#'   code should be provided.
#' @param table.font.size,heading.title.font.size,heading.subtitle.font.size,column_labels.font.size,row_group.font.size,stub.font.size,footnotes.font.size,source_notes.font.size
#'   The font sizes for the parent text element `table` and the following child
#'   elements: `heading.title`, `heading.subtitle`, `column_labels`,
#'   `row_group`, `footnotes`, and `source_notes`. Can be specified as a
#'   single-length character vector with units of pixels (e.g., `12px`) or as a
#'   percentage (e.g., `80\%`). If provided as a single-length numeric vector,
#'   it is assumed that the value is given in units of pixels. The [px()] and
#'   [pct()] helper functions can also be used to pass in numeric values and
#'   obtain values as pixel or percentage units.
#' @param heading.align Controls the horizontal alignment of the heading title
#'   and subtitle. We can either use `"center"`, `"left"`, or `"right"`.
#' @param table.font.weight,heading.title.font.weight,heading.subtitle.font.weight,column_labels.font.weight,row_group.font.weight,stub.font.weight
#'   The font weights of the table, `heading.title`, `heading.subtitle`,
#'   `column_labels`, `row_group`, and `stub` text elements. Can be a text-based
#'   keyword such as `"normal"`, `"bold"`, `"lighter"`, `"bolder"`, or, a
#'   numeric value between `1` and `1000`, inclusive. Note that only variable
#'   fonts may support the numeric mapping of weight.
#' @param column_labels.text_transform,row_group.text_transform,stub.text_transform,summary_row.text_transform,grand_summary_row.text_transform
#'   Options to apply text transformations to the `column_labels`, `row_group`,
#'   `stub`, `summary_row`, and `grand_summary_row` text elements. Either of the
#'   `"uppercase"`, `"lowercase"`, or `"capitalize"` keywords can be used.
#' @param data_row.padding,row_group.padding,summary_row.padding,grand_summary_row.padding,footnotes.padding,source_notes.padding
#'   The amount of vertical padding to incorporate in the `data_row`,
#'   `row_group`, `summary_row`, `grand_summary_row`, `footnotes`, and
#'   `source_notes` locations.
#' @param table.border.top.style,table.border.top.width,table.border.top.color,table.border.right.style,table.border.right.width,table.border.right.color,table.border.bottom.style,table.border.bottom.width,table.border.bottom.color,table.border.left.style,table.border.left.width,table.border.left.color
#'   The style, width, and color properties of the table's absolute top and
#'   absolute bottom borders.
#' @param heading.border.bottom.style,heading.border.bottom.width,heading.border.bottom.color
#'   The style, width, and color properties of the header's bottom border. This
#'   border shares space with that of the `column_labels` location. If the
#'   `width` of this border is larger, then it will be the visible border.
#' @param heading.border.lr.style,heading.border.lr.width,heading.border.lr.color
#'   The style, width, and color properties for the left and right borders of
#'   the `heading` location.
#' @param column_labels.vlines.style,column_labels.vlines.width,column_labels.vlines.color
#'   The style, width, and color properties for all vertical lines ('vlines')
#'   of the the `column_labels`.
#' @param column_labels.border.top.style,column_labels.border.top.width,column_labels.border.top.color
#'   The style, width, and color properties for the top border of the
#'   `column_labels` location. This border shares space with that of the
#'   `heading` location. If dthe `width` of this border is larger, then it will
#'   be the visible border.
#' @param column_labels.border.bottom.style,column_labels.border.bottom.width,column_labels.border.bottom.color
#'   The style, width, and color properties for the bottom border of the
#'   `column_labels` location.
#' @param column_labels.border.lr.style,column_labels.border.lr.width,column_labels.border.lr.color
#'   The style, width, and color properties for the left and right borders of
#'   the `column_labels` location.
#' @param column_labels.hidden An option to hide the column labels. If providing
#'   `TRUE` then the entire `column_labels` location won't be seen and the table
#'   header (if present) will collapse downward.
#' @param row_group.border.top.style,row_group.border.top.width,row_group.border.top.color,row_group.border.bottom.style,row_group.border.bottom.width,row_group.border.bottom.color,row_group.border.left.style,row_group.border.left.width,row_group.border.left.color,row_group.border.right.style,row_group.border.right.width,row_group.border.right.color
#'   The style, width, and color properties for all top, bottom, left, and right
#'   borders of the `row_group` location.
#' @param table_body.hlines.style,table_body.hlines.width,table_body.hlines.color,table_body.vlines.style,table_body.vlines.width,table_body.vlines.color
#'   The style, width, and color properties for all horizontal lines ('hlines')
#'   and vertical lines ('vlines') in the `table_body`.
#' @param table_body.border.top.style,table_body.border.top.width,table_body.border.top.color,table_body.border.bottom.style,table_body.border.bottom.width,table_body.border.bottom.color
#'   The style, width, and color properties for all top and bottom borders of
#'   the `table_body` location.
#' @param stub.border.style,stub.border.width,stub.border.color
#'   The style, width, and color properties for the vertical border of the table
#'   stub.
#' @param summary_row.border.style,summary_row.border.width,summary_row.border.color
#'   The style, width, and color properties for all horizontal borders of the
#'   `summary_row` location.
#' @param grand_summary_row.border.style,grand_summary_row.border.width,grand_summary_row.border.color
#'   The style, width, and color properties for the top borders of the
#'   `grand_summary_row` location.
#' @param footnotes.border.bottom.style,footnotes.border.bottom.width,footnotes.border.bottom.color
#'   The style, width, and color properties for the bottom border of the
#'   `footnotes` location.
#' @param footnotes.border.lr.style,footnotes.border.lr.width,footnotes.border.lr.color
#'   The style, width, and color properties for the left and right borders of
#'   the `footnotes` location.
#' @param footnotes.sep The separating characters between adjacent footnotes in
#'   the footnotes section. The default value produces a linebreak.
#' @param footnotes.marks The set of sequential marks used to reference and
#'   identify each of the footnotes (same input as the [opt_footnote_marks()]
#'   function. We can supply a vector that represents the series of footnote
#'   marks. This vector is recycled when its usage goes beyond the length of the
#'   set. At each cycle, the marks are simply combined (e.g., `*` -> `**` ->
#'   `***`). The option exists for providing keywords for certain types of
#'   footnote marks. The keyword `"numbers"` (the default, indicating that we
#'   want to use numeric marks). We can use lowercase `"letters"` or uppercase
#'   `"LETTERS"`. There is the option for using a traditional symbol set where
#'   `"standard"` provides four symbols, and, `"extended"` adds two more
#'   symbols, making six.
#' @param source_notes.border.bottom.style,source_notes.border.bottom.width,source_notes.border.bottom.color
#'   The style, width, and color properties for the bottom border of the
#'   `source_notes` location.
#' @param source_notes.border.lr.style,source_notes.border.lr.width,source_notes.border.lr.color
#'   The style, width, and color properties for the left and right borders of
#'   the `source_notes` location.
#' @param row.striping.background_color The background color for striped table
#'   body rows. A color name or a hexadecimal color code should be provided.
#' @param row.striping.include_stub An option for whether to include the stub
#'   when striping rows.
#' @param row.striping.include_table_body An option for whether to include the
#'   table body when striping rows.
#'
#' @return An object of class `gt_tbl`.
#'
#' @examples
#' # Use `exibble` to create a gt table with
#' # all the main parts added; we can use this
#' # going forward to demo some `tab_options()`
#' tab_1 <-
#'   exibble %>%
#'   dplyr::select(
#'     -c(fctr, date, time, datetime)
#'   ) %>%
#'   gt(
#'     rowname_col = "row",
#'     groupname_col = "group"
#'   ) %>%
#'   tab_header(
#'     title = md("Data listing from **exibble**"),
#'     subtitle = md("`exibble` is an R dataset")
#'   ) %>%
#'   fmt_number(columns = vars(num)) %>%
#'   fmt_currency(columns = vars(currency)) %>%
#'   tab_footnote(
#'     footnote = "Using commas for separators.",
#'     locations = cells_body(
#'       columns = vars(num),
#'       rows = num > 1000)
#'   ) %>%
#'   tab_footnote(
#'     footnote = "Using commas for separators.",
#'     locations = cells_body(
#'       columns = vars(currency),
#'       rows = currency > 1000)
#'   ) %>%
#'   tab_footnote(
#'     footnote = "Alphabetical fruit.",
#'     locations = cells_column_labels(
#'       columns = vars(char))
#'   )
#'
#' # Modify the table width to 100% (which
#' # spans the entire content width area)
#' tab_2 <-
#'   tab_1 %>%
#'   tab_options(
#'     table.width = pct(100)
#'   )
#'
#' # Modify the table's background color
#' # to be "lightcyan"
#' tab_3 <-
#'   tab_1 %>%
#'   tab_options(
#'     table.background.color = "lightcyan"
#'   )
#'
#' # Use letters as the marks for footnote
#' # references; also, separate footnotes in
#' # the footer by spaces instead of newlines
#' tab_4 <-
#'   tab_1 %>%
#'   tab_options(
#'     footnotes.sep = " ",
#'     footnotes.marks = letters
#'   )
#'
#' # Change the padding of data rows to 5px
#' tab_5 <-
#'   tab_1 %>%
#'   tab_options(
#'     data_row.padding = px(5)
#'   )
#'
#' # Reduce the size of the title and the
#' # subtitle text
#' tab_6 <-
#'   tab_1 %>%
#'   tab_options(
#'     heading.title.font.size = "small",
#'     heading.subtitle.font.size = "small"
#'   )
#'
#' @section Figures:
#' \if{html}{\figure{man_tab_options_1.png}{options: width=100\%}}
#'
#' \if{html}{\figure{man_tab_options_2.png}{options: width=100\%}}
#'
#' \if{html}{\figure{man_tab_options_3.png}{options: width=100\%}}
#'
#' \if{html}{\figure{man_tab_options_4.png}{options: width=100\%}}
#'
#' \if{html}{\figure{man_tab_options_5.png}{options: width=100\%}}
#'
#' \if{html}{\figure{man_tab_options_6.png}{options: width=100\%}}
#'
#' @family Create or Modify Parts
#' @section Function ID:
#' 2-9
#'
#' @export
tab_options <- function(data,
                        container.width = NULL,
                        container.height = NULL,
                        container.overflow.x = NULL,
                        container.overflow.y = NULL,
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
                        row_group.background.color = NULL,
                        row_group.font.size = NULL,
                        row_group.font.weight = NULL,
                        row_group.text_transform = NULL,
                        row_group.padding = NULL,
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
                        data_row.padding = NULL,
                        summary_row.background.color = NULL,
                        summary_row.text_transform = NULL,
                        summary_row.padding = NULL,
                        summary_row.border.style = NULL,
                        summary_row.border.width = NULL,
                        summary_row.border.color = NULL,
                        grand_summary_row.background.color = NULL,
                        grand_summary_row.text_transform = NULL,
                        grand_summary_row.padding = NULL,
                        grand_summary_row.border.style = NULL,
                        grand_summary_row.border.width = NULL,
                        grand_summary_row.border.color = NULL,
                        footnotes.background.color = NULL,
                        footnotes.font.size = NULL,
                        footnotes.padding = NULL,
                        footnotes.border.bottom.style = NULL,
                        footnotes.border.bottom.width = NULL,
                        footnotes.border.bottom.color = NULL,
                        footnotes.border.lr.style = NULL,
                        footnotes.border.lr.width = NULL,
                        footnotes.border.lr.color = NULL,
                        footnotes.sep = NULL,
                        footnotes.marks = NULL,
                        source_notes.background.color = NULL,
                        source_notes.font.size = NULL,
                        source_notes.padding = NULL,
                        source_notes.border.bottom.style = NULL,
                        source_notes.border.bottom.width = NULL,
                        source_notes.border.bottom.color = NULL,
                        source_notes.border.lr.style = NULL,
                        source_notes.border.lr.width = NULL,
                        source_notes.border.lr.color = NULL,
                        row.striping.background_color = NULL,
                        row.striping.include_stub = NULL,
                        row.striping.include_table_body = NULL) {

  # TODO: add helper functions to divide the options into those by location
  # TODO: add helper functions to divide the options into those by parameter

  # Perform input object validation
  stop_if_not_gt(data = data)

  # Extract the options table from `data`
  opts_df <- dt_options_get(data = data)

  arg_names <- formals(tab_options) %>% names() %>% base::setdiff("data")
  arg_vals <- mget(arg_names)
  arg_vals <- arg_vals[!vapply(arg_vals, FUN = is.null, FUN.VALUE = logical(1))]
  arg_vals <- arg_vals %>% set_super_options()

  new_df <-
    dplyr::tibble(
      parameter = names(arg_vals) %>% tidy_gsub(".", "_", fixed = TRUE),
      value = unname(arg_vals)) %>%
    dplyr::left_join(
      opts_df %>% dplyr::select(parameter, type),
      by = "parameter"
    ) %>%
    dplyr::mutate(
      value = mapply(
        preprocess_tab_option,
        option = value, var_name = parameter, type = type,
        SIMPLIFY = FALSE)
    ) %>%
    dplyr::select(-type)

  # This rearranges the rows in the `opts_df` table, but this
  # shouldn't be a problem
  opts_df <-
    dplyr::bind_rows(
      new_df %>%
        dplyr::inner_join(
          opts_df %>% dplyr::select(-value),
          by = "parameter"
        ),
      opts_df %>%
        dplyr::anti_join(new_df, by = "parameter")
    )

  # Write the modified options table back to `data`
  data <- dt_options_set(data = data, options = opts_df)

  data
}

preprocess_tab_option <- function(option, var_name, type) {

  # Perform pre-processing on the option depending on `type`
  option <-
    switch(type,
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

  # Perform checkmate assertions by `type`
  switch(type,
         logical = checkmate::assert_logical(
           option, len = 1, any.missing = FALSE, .var.name = var_name),
         overflow =,
         px =,
         value = checkmate::assert_character(
           option, len = 1, any.missing = FALSE, .var.name = var_name),
         values = checkmate::assert_character(
           option, min.len = 1, any.missing = FALSE, .var.name = var_name)
  )

  option
}

set_super_options <- function(arg_vals) {

  if ("table.align" %in% names(arg_vals)) {

    table_align_val <- arg_vals$table.align

    arg_vals$table.align <- NULL

    if (!(table_align_val %in% c("left", "center", "right"))) {
      stop("The chosen option for `table.align` (`", table_align_val, "`) is invalid\n",
           " * We can use either of `left`, `center`, or `right`.",
           call. = FALSE)
    }

    arg_vals$table.margin.left <- arg_vals$table.margin.left %||%
      switch(table_align_val,
             center = "auto",
             left = "0",
             right = "auto")

    arg_vals$table.margin.right <- arg_vals$table.margin.right %||%
      switch(table_align_val,
             center = "auto",
             left = "auto",
             right = "0")
  }

  arg_vals
}
