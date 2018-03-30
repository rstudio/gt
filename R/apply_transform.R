#' Apply left alignment to column data
#'
#' Apply the left alignment rule to data cells within
#' table columns. Options exist to selectively
#' apply the alignment to specified column names or
#' to columns of certain types.
#' @param html_tbl an HTML table object that is
#' created using the \code{gt()} function.
#' @param columns an optional vector of column names
#' for which the left alignment should be applied.
#' @param types an optional vector of column types
#' for which the left alignment should be applied.
#' @return an object of class \code{html_table}.
#' @importFrom dplyr pull mutate case_when
#' @export
apply_alignment_left <- function(html_tbl,
                                 columns = NULL,
                                 types = NULL) {

  if (!is.null(columns)) {

    transform <-
      columns %>%
      paste(collapse = ";") %>%
      paste0("columns:", .)
  }

  if (!is.null(types)) {

    transform <-
      types %>%
      paste(collapse = ";") %>%
      paste0("types:", .)
  }

  if (is.null(columns) & is.null(types)) {
    transform <- NA_character_
  }

  html_tbl[["transform_opts"]] <-
    html_tbl[["transform_opts"]] %>%
    tibble::add_row(
      type = "alignment_left",
      transform = transform,
      enabled = TRUE)

  html_tbl
}


#' Apply center alignment to column data
#'
#' Apply the center alignment rule to data cells within
#' table columns. Options exist to selectively
#' apply the alignment to specified column names or
#' to columns of certain types.
#' @param html_tbl an HTML table object that is
#' created using the \code{gt()} function.
#' @param columns an optional vector of column names
#' for which the center alignment should be applied.
#' @param types an optional vector of column types
#' for which the center alignment should be applied.
#' @return an object of class \code{html_table}.
#' @importFrom dplyr pull mutate case_when
#' @export
apply_alignment_center <- function(html_tbl,
                                   columns = NULL,
                                   types = NULL) {

  if (!is.null(columns)) {

    transform <-
      columns %>%
      paste(collapse = ";") %>%
      paste0("columns:", .)
  }

  if (!is.null(types)) {

    transform <-
      types %>%
      paste(collapse = ";") %>%
      paste0("types:", .)
  }

  if (is.null(columns) & is.null(types)) {
    transform <- NA_character_
  }

  html_tbl[["transform_opts"]] <-
    html_tbl[["transform_opts"]] %>%
    tibble::add_row(
      type = "alignment_center",
      transform = transform,
      enabled = TRUE)

  html_tbl
}

#' Apply right alignment to column data
#'
#' Apply the right alignment rule to data cells within
#' table columns. Options exist to selectively
#' apply the alignment to specified column names or
#' to columns of certain types.
#' @param html_tbl an HTML table object that is
#' created using the \code{gt()} function.
#' @param columns an optional vector of column names
#' for which the right alignment should be applied.
#' @param types an optional vector of column types
#' for which the right alignment should be applied.
#' @return an object of class \code{html_table}.
#' @importFrom dplyr pull mutate case_when
#' @export
apply_alignment_right <- function(html_tbl,
                                   columns = NULL,
                                   types = NULL) {

  if (!is.null(columns)) {

    transform <-
      columns %>%
      paste(collapse = ";") %>%
      paste0("columns:", .)
  }

  if (!is.null(types)) {

    transform <-
      types %>%
      paste(collapse = ";") %>%
      paste0("types:", .)
  }

  if (is.null(columns) & is.null(types)) {
    transform <- NA_character_
  }

  html_tbl[["transform_opts"]] <-
    html_tbl[["transform_opts"]] %>%
    tibble::add_row(
      type = "alignment_right",
      transform = transform,
      enabled = TRUE)

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
#' created using the \code{gt()} function.
#' @return an object of class \code{html_table}.
#' @importFrom dplyr pull mutate case_when
#' @export
apply_theme_striped <- function(html_tbl) {

  html_tbl[["transform_opts"]] <-
    html_tbl[["transform_opts"]] %>%
    tibble::add_row(
      type = "theme",
      transform = "striped",
      enabled = TRUE)

  html_tbl
}


#' Apply spanner headings
#'
#' If column names in the \code{tbl} supplied
#' use the naming convention of
#' \code{[spanner_heading].[column_heading]},
#' we can invoke \code{apply_spanner_headings()}
#' to allow for parsing and expansion of column
#' headings into one or more boxhead panels
#' with spanner headings and column headings.
#' @param html_tbl an HTML table object that is
#' created using the \code{gt()} function.
#' @return an object of class \code{html_table}.
#' @importFrom dplyr tibble
#' @importFrom stringr str_detect str_replace
#' @export
apply_spanner_headings <- function(html_tbl) {

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
        str_replace(
          pattern = "(.*?)\\.(.*)",
          replacement = "\\1"),
      column_heading = (html_tbl[["source_tbl"]] %>%
                          colnames())[group_cols] %>%
        str_replace(
          pattern = "(.*?)\\.(.*)",
          replacement = "\\2"))

  # Replace `boxhead_panel` component with
  # `boxhead_panel_tbl` table
  html_tbl[["boxhead_panel"]] <- boxhead_panel_tbl

  html_tbl
}
