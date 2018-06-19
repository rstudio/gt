#' Use left alignment
#'
#' Use left alignment on one or more table
#' columns. Options exist to selectively apply the
#' alignment to specified column names or to
#' columns of certain types.
#' @param html_tbl an HTML table object that is
#' created using the \code{tab_create()} function.
#' @param columns an optional vector of column names
#' for which the left alignment should be applied.
#' @param types an optional vector of column types
#' for which the left alignment should be applied.
#' @return an object of class \code{html_table}.
#' @examples
#' # Create a table object using the
#' # `mtcars` dataset and align all
#' # columns to the left
#' tab_create(tbl = mtcars) %>%
#'   theme_striped() %>%
#'   cols_align_left()
#' @importFrom tibble add_row
#' @export
cols_align_left <- function(html_tbl,
                            columns = NULL,
                            types = NULL) {

  if (!is.null(columns)) {

    options <-
      columns %>%
      paste(collapse = ";") %>%
      paste0("columns:", .)
  }

  if (!is.null(types)) {

    options <-
      types %>%
      paste(collapse = ";") %>%
      paste0("types:", .)
  }

  if (is.null(columns) & is.null(types)) {
    options <- NA_character_
  }

  html_tbl[["aesthetics"]] <-
    html_tbl[["aesthetics"]] %>%
    tibble::add_row(
      type = "alignment_left",
      options = options)

  html_tbl
}

#' Use center alignment
#'
#' Use center alignment on one or more table
#' columns. Options exist to selectively apply the
#' alignment to specified column names or to
#' columns of certain types.
#' @param html_tbl an HTML table object that is
#' created using the \code{tab_create()} function.
#' @param columns an optional vector of column names
#' for which the center alignment should be applied.
#' @param types an optional vector of column types
#' for which the center alignment should be applied.
#' @return an object of class \code{html_table}.
#' @examples
#' # Create a table object using the
#' # `mtcars` dataset and center align
#' # all columns
#' tab_create(tbl = mtcars) %>%
#'   theme_striped() %>%
#'   cols_align_center()
#' @importFrom tibble add_row
#' @export
cols_align_center <- function(html_tbl,
                              columns = NULL,
                              types = NULL) {

  if (!is.null(columns)) {

    options <-
      columns %>%
      paste(collapse = ";") %>%
      paste0("columns:", .)
  }

  if (!is.null(types)) {

    options <-
      types %>%
      paste(collapse = ";") %>%
      paste0("types:", .)
  }

  if (is.null(columns) & is.null(types)) {
    options <- NA_character_
  }

  html_tbl[["aesthetics"]] <-
    html_tbl[["aesthetics"]] %>%
    tibble::add_row(
      type = "alignment_center",
      options = options)

  html_tbl
}

#' Use right alignment
#'
#' Use right alignment on one or more table
#' columns. Options exist to selectively apply the
#' alignment to specified column names or to
#' columns of certain types.
#' @param html_tbl an HTML table object that is
#' created using the \code{tab_create()} function.
#' @param columns an optional vector of column names
#' for which the right alignment should be applied.
#' @param types an optional vector of column types
#' for which the right alignment should be applied.
#' @return an object of class \code{html_table}.
#' @examples
#' # Create a table object using the
#' # `mtcars` dataset and align all
#' # columns to the right
#' tab_create(tbl = mtcars) %>%
#'   theme_striped() %>%
#'   cols_align_right()
#' @importFrom tibble add_row
#' @export
cols_align_right <- function(html_tbl,
                             columns = NULL,
                             types = NULL) {

  if (!is.null(columns)) {

    options <-
      columns %>%
      paste(collapse = ";") %>%
      paste0("columns:", .)
  }

  if (!is.null(types)) {

    options <-
      types %>%
      paste(collapse = ";") %>%
      paste0("types:", .)
  }

  if (is.null(columns) & is.null(types)) {
    options <- NA_character_
  }

  html_tbl[["aesthetics"]] <-
    html_tbl[["aesthetics"]] %>%
    tibble::add_row(
      type = "alignment_right",
      options = options)

  html_tbl
}

#' Format fonts used for values
#' @param html_tbl an HTML table object that is
#' created using the \code{tab_create()} function.
#' @param columns an optional vector of column names
#' for which the font should be applied.
#' @param types an optional vector of column types
#' for which the font should be applied.
#' @param font the name of the font to use for
#' the specified columns. This could be provided
#' as a vector of fonts where subsequent font names
#' provide fallbacks in the case that fonts are
#' not available.
#' @return an object of class \code{html_table}.
#' @examples
#' # Create a table object using the
#' # `mtcars` dataset and set all of
#' # the values in the Courier font
#' tab_create(tbl = mtcars) %>%
#'   theme_striped() %>%
#'   fmt_font(font = "Courier")
#' @importFrom dplyr bind_rows tibble
#' @export
fmt_font <- function(html_tbl,
                     columns = NULL,
                     types = NULL,
                     font) {

  if (is.null(columns)) {
    columns <- NA_character_
  }

  if (is.null(types)) {
    types <- NA_character_
  }

  font <-
    font %>%
    paste(collapse = ", ")

  html_tbl[["aesthetics"]] <-
    html_tbl[["aesthetics"]] %>%
    dplyr::bind_rows(
      dplyr::tibble(
        type = "fmt_font",
        columns = columns,
        types = types,
        font = font))

  html_tbl
}

#' Format to use HTML
#' @param html_tbl an HTML table object that is
#' created using the \code{tab_create()} function.
#' @param columns a vector of column names
#' for which the HTML formatting should be applied.
#' @return an object of class \code{html_table}.
#' @importFrom dplyr bind_rows tibble
#' @export
fmt_html <- function(html_tbl,
                     columns = NULL) {

  if (is.null(columns)) {
    columns <- NA_character_
  }

  html_tbl[["aesthetics"]] <-
    html_tbl[["aesthetics"]] %>%
    dplyr::bind_rows(
      dplyr::tibble(
        type = "fmt_html",
        columns = columns))

  html_tbl
}

#' Use the 'striped' table theme
#'
#' Apply the 'striped' theme to the table. This
#' adds striped rows, reasonably thick horizontal
#' rules enclosing the boxhead and stubhead and
#' a similar horizontal rule below the field and
#' stub.
#' @param html_tbl an HTML table object that is
#' created using the \code{tab_create()} function.
#' @return an object of class \code{html_table}.
#' @examples
#' # Create a table object using the
#' # `mtcars` dataset and use the
#' # 'striped' theme
#' tab_create(tbl = mtcars) %>%
#'   theme_striped()
#' @importFrom tibble add_row
#' @export
theme_striped <- function(html_tbl) {

  html_tbl[["aesthetics"]] <-
    html_tbl[["aesthetics"]] %>%
    tibble::add_row(
      type = "theme",
      options = "striped")

  html_tbl
}

#' Use the 'horizontal' table theme
#'
#' Apply the 'horizontal' theme to the table. This
#' employs line styles with a minimal set of
#' horizontal rules for demarcation of the
#' boxhead and the field. This adds reasonably
#' thick horizontal rules enclosing the boxhead
#' and stubhead and a similar horizontal rule
#' below the field and stub.
#' @param html_tbl an HTML table object that is
#' created using the \code{tab_create()} function.
#' @return an object of class \code{html_table}.
#' @examples
#' # Create a table object using the
#' # `mtcars` dataset and use the
#' # 'horizontal' theme
#' tab_create(tbl = mtcars) %>%
#'   theme_horizontal()
#' @importFrom tibble add_row
#' @export
theme_horizontal <- function(html_tbl) {

  html_tbl[["aesthetics"]] <-
    html_tbl[["aesthetics"]] %>%
    tibble::add_row(
      type = "theme",
      options = "horizontal")

  html_tbl
}

#' Use the 'classical' table theme
#'
#' Apply the 'classical' theme to the table.
#' Horizontal and vertical line styles
#' visually separate the columns and rows. This
#' adds reasonably thick horizontal and vertical
#' rules.
#' @param html_tbl an HTML table object that is
#' created using the \code{tab_create()} function.
#' @return an object of class \code{html_table}.
#' @examples
#' # Create a table object using the
#' # `mtcars` dataset and use the
#' # 'classical' theme
#' tab_create(tbl = mtcars) %>%
#'   theme_classical()
#' @importFrom tibble add_row
#' @export
theme_classical <- function(html_tbl) {

  html_tbl[["aesthetics"]] <-
    html_tbl[["aesthetics"]] %>%
    tibble::add_row(
      type = "theme",
      options = "classical")

  html_tbl
}

#' Arrange a boxhead into panels
#'
#' If column names in the \code{tbl} supplied
#' use the naming convention of
#' \code{[spanner_heading].[column_heading]},
#' we can invoke \code{tab_boxhead_panel()}
#' with the \code{use_names} option set to
#' \code{TRUE}. This allows for parsing and
#' expansion of column headings into one or
#' more boxhead panels with spanner headings
#' and column headings.
#' @param html_tbl an HTML table object that is
#' created using the \code{tab_create()} function.
#' @param ... an optional series of named vectors
#' for specifying the mappings between column names
#' to spanner headings.
#' @param use_names an options to use the the
#' naming convention of \code{[spanner_heading].[column_heading]}
#' to generate spanner headings that correctly
#' enclose column headings.
#' @return an object of class \code{html_table}.
#' @examples
#' # Create a table based on `rock` where
#' # there are column headings grouped under
#' # spanner headings
#' tab_create(tbl = rock) %>%
#'   tab_boxhead_panel(
#'     "perimeter" = c("peri", "shape")
#'     ) %>%
#'   cols_reorder(
#'     columns = c("area", "perm", "peri", "shape")
#'     ) %>%
#'   theme_striped()
#' @importFrom dplyr tibble rename mutate
#' @importFrom stringr str_detect str_replace
#' @importFrom purrr map_df
#' @import rlang
#' @export
tab_boxhead_panel <- function(html_tbl,
                              ...,
                              use_names = FALSE) {

  # Obtain any column-to-spanner mappings
  mappings <- list(...)

  # Get the mappings of heading names to spanner headings
  if (length(mappings) > 0) {

    # Create `boxhead_panel_tbl` object
    boxhead_panel_tbl <-
      seq(length(mappings)) %>%
      purrr::map_df(.f = function(x) {

        # Create bindings for specific variables
        column_name <- NULL

        spanner_heading <- mappings[x] %>% names()

        as_tibble(mappings[x]) %>%
          dplyr::rename("column_name" = rlang::UQ(rlang::sym(spanner_heading))) %>%
          dplyr::mutate(spanner_heading = spanner_heading) %>%
          dplyr::mutate(column_heading = column_name)
      })

    # Replace `boxhead_panel` component with
    # `boxhead_panel_tbl` table
    html_tbl[["boxhead_panel"]] <- boxhead_panel_tbl
  }

  if (use_names == TRUE) {

    # Get column names and determine groupings
    # via format of `[group].[column_name]`
    group_cols <-
      html_tbl[["source_tbl"]] %>%
      colnames() %>%
      stringr::str_detect(pattern = ".*?\\..*?") %>%
      which()

    # Create `boxhead_panel_tbl` object
    boxhead_panel_tbl <-
      dplyr::tibble(
        column_name = (html_tbl[["source_tbl"]] %>%
                         colnames())[group_cols],
        spanner_heading = (html_tbl[["source_tbl"]] %>%
                             colnames())[group_cols] %>%
          stringr::str_replace(
            pattern = "(.*?)\\.(.*)",
            replacement = "\\1"),
        column_heading = (html_tbl[["source_tbl"]] %>%
                            colnames())[group_cols] %>%
          stringr::str_replace(
            pattern = "(.*?)\\.(.*)",
            replacement = "\\2"))


    # Replace `boxhead_panel` component with
    # `boxhead_panel_tbl` table
    html_tbl[["boxhead_panel"]] <- boxhead_panel_tbl
  }

  html_tbl
}

#' Replace missing values
#'
#' Replace any missing values in specified columns
#' or columns of a given type.
#' @param html_tbl an HTML table object that is
#' created using the \code{tab_create()} function.
#' @param columns an optional vector of column names
#' for which the left alignment should be applied.
#' @param types an optional vector of column types
#' for which the left alignment should be applied.
#' @param replacement the value or string that
#' should be used to replace the missing values.
#' @return an object of class \code{html_table}.
#' @examples
#' # Create a table based on `airquality` where
#' # the `NA` values are replaced with the
#' # text `missing`
#' tab_create(tbl = airquality) %>%
#'   theme_striped() %>%
#'   replace_missing(replacement = "missing")
#' @importFrom dplyr bind_rows tibble
#' @export
replace_missing <- function(html_tbl,
                            columns = NULL,
                            types = NULL,
                            replacement) {

  if (is.null(columns)) {
    columns <- NA_character_
  }

  if (is.null(types)) {
    types <- NA_character_
  }

  html_tbl[["aesthetics"]] <-
    html_tbl[["aesthetics"]] %>%
    dplyr::bind_rows(
      dplyr::tibble(
        type = "replace_missing",
        columns = columns,
        types = types,
        replacement = replacement))

  html_tbl
}

#' Rename one or more columns
#' @param html_tbl an HTML table object that is
#' created using the \code{tab_create()} function.
#' @param ... a series of named vectors for
#' specifying the mappings between new column
#' names and existing column names.
#' @return an object of class \code{html_table}.
#' @examples
#' # Create a table based on `airquality` where
#' # some of the columns are renamed
#' tab_create(tbl = airquality) %>%
#'   theme_striped() %>%
#'   cols_rename(
#'     "Solar Radiation" = "Solar.R",
#'     "Wind (mph)" = "Wind",
#'     "Ozone (ppbV)" = "Ozone",
#'     "T (degrees F)" = "Temp"
#'     )
#' @importFrom dplyr tibble bind_rows filter
#' @importFrom commonmark markdown_html
#' @importFrom purrr map_df
#' @importFrom stringr str_replace_all
#' @export
cols_rename <- function(html_tbl,
                        ...) {

  # Create bindings for specific variables
  columns <- NULL

  # Obtain any existing-column-to-new-name mappings
  x <- list(...)

  # Generate table of column names and
  # renamed column heading names
  cols_rename_tbl <-
    seq(length(x)) %>%
    purrr::map_df(.f = function(y) {

      dplyr::tibble(
        type = "cols_rename",
        renamed = (x[y] %>%
                     names() %>%
                     process_text()),
        columns = x[[y]])
    })

  # Filter by column names in `modified_tbl`
  cols_rename_tbl <-
    cols_rename_tbl %>%
    dplyr::filter(columns %in% colnames(html_tbl[["modified_tbl"]]))

  # Add to `transforms` tbl
  html_tbl[["aesthetics"]] <-
    dplyr::bind_rows(
      html_tbl[["aesthetics"]],
      cols_rename_tbl)

  html_tbl
}
