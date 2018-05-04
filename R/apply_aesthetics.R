#' Apply left alignment to column data
#'
#' Apply the left alignment rule to data cells within
#' table columns. Options exist to selectively
#' apply the alignment to specified column names or
#' to columns of certain types.
#' @param html_tbl an HTML table object that is
#' created using the \code{tab_create()} function.
#' @param columns an optional vector of column names
#' for which the left alignment should be applied.
#' @param types an optional vector of column types
#' for which the left alignment should be applied.
#' @return an object of class \code{html_table}.
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


#' Apply center alignment to column data
#'
#' Apply the center alignment rule to data cells within
#' table columns. Options exist to selectively
#' apply the alignment to specified column names or
#' to columns of certain types.
#' @param html_tbl an HTML table object that is
#' created using the \code{tab_create()} function.
#' @param columns an optional vector of column names
#' for which the center alignment should be applied.
#' @param types an optional vector of column types
#' for which the center alignment should be applied.
#' @return an object of class \code{html_table}.
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

#' Apply right alignment to column data
#'
#' Apply the right alignment rule to data cells within
#' table columns. Options exist to selectively
#' apply the alignment to specified column names or
#' to columns of certain types.
#' @param html_tbl an HTML table object that is
#' created using the \code{tab_create()} function.
#' @param columns an optional vector of column names
#' for which the right alignment should be applied.
#' @param types an optional vector of column types
#' for which the right alignment should be applied.
#' @return an object of class \code{html_table}.
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


#' Format fonts used in column data
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


#' Apply the striped theme to the table
#'
#' Apply the striped theme to the table. This
#' adds striped rows, reasonably thick horizontal
#' rules enclosing the boxhead and stubhead and
#' a similar horizontal rule below the field and
#' stub.
#' @param html_tbl an HTML table object that is
#' created using the \code{tab_create()} function.
#' @return an object of class \code{html_table}.
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


#' Apply a minimal set of line styles to the table
#'
#' Apply line styles with a minimal set of
#' horizontal rules for demarcation of the
#' boxhead and the field. This adds reasonably
#' thick horizontal rules enclosing the boxhead
#' and stubhead and a similar horizontal rule
#' below the field and stub.
#' @param html_tbl an HTML table object that is
#' created using the \code{tab_create()} function.
#' @return an object of class \code{html_table}.
#' @importFrom tibble add_row
#' @export
theme_minimal <- function(html_tbl) {

  html_tbl[["aesthetics"]] <-
    html_tbl[["aesthetics"]] %>%
    tibble::add_row(
      type = "theme",
      options = "minimal")

  html_tbl
}


#' Apply line styles that give a table a classic look
#'
#' Apply horizontal and vertical line styles that
#' visually separate the columns and rows. This
#' adds reasonably thick horizontal and vertical
#' rules.
#' @param html_tbl an HTML table object that is
#' created using the \code{tab_create()} function.
#' @return an object of class \code{html_table}.
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


#' Apply spanner headings
#'
#' If column names in the \code{tbl} supplied
#' use the naming convention of
#' \code{[spanner_heading].[column_heading]},
#' we can invoke \code{tab_spanner_headings()}
#' with the \code{use_names} option set to
#' \code{TRUE}. This allows for parsing and
#' expansion of column headings into one or
#' more boxhead panels with spanner headings
#' and column headings.
#' @param html_tbl an HTML table object that is
#' created using the \code{tab_create()} function.
#' @param use_names an options to use the the
#' naming convention of \code{[spanner_heading].[column_heading]}
#' to generate spanner headings that correctly
#' enclose column headings.
#' @return an object of class \code{html_table}.
#' @importFrom dplyr tibble
#' @importFrom stringr str_detect str_replace
#' @export
tab_spanner_headings <- function(html_tbl,
                                 use_names = FALSE) {

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
