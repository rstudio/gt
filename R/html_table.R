#' Create an HTML table object that can be styled
#'
#' Create an HTML table object such that we can
#' perform styling transformations before transforming
#' the entire object to an HTML fragment (for
#' inclusion into the email message body). This is
#' the first step in the \code{build_html_table()} ->
#' \code{add_column_style()} -> \code{emit_html()}
#' pattern.
#' @param tbl a \code{data.frame} object or a
#' tibble.
#' @return an HTML table object.
#' @importFrom purrr map_chr map_df
#' @importFrom dplyr as_tibble tibble select rename rename_at mutate
#' @importFrom dplyr bind_rows inner_join
#' @importFrom tibble rownames_to_column
#' @export
build_html_table <- function(tbl) {

  # If column names contain data (i.e. not numbered),
  # then incorporate the rownames as a column (called
  # `rowname`)
  if (!(all(row.names(tbl) == 1:nrow(tbl) %>% as.character()))) {

    tbl <-
      tbl %>%
      tibble::rownames_to_column()
  }

  # Automatically select columns that are not
  # `list` columns
  tbl <-
    tbl %>%
    select_if(
      .predicate = function(x) class(x) != "list")

  # Obtain a vector of column types from `tbl`
  tbl_classes <-
    seq(ncol(tbl)) %>%
    purrr::map_chr(
      .f = function(x) tbl[[x]] %>% class())

  # Create a tibble that contains basic metadata
  # for the `table` component of the table
  table_table <-
    dplyr::tibble(
      content = NA_character_,
      type = "character",
      row = -3L,
      column = 0L,
      column_name = "_table_")

  # Create a tibble that contains basic metadata
  # for the `thead` component of the table
  table_thead <-
    dplyr::tibble(
      content = NA_character_,
      type = "character",
      row = -2L,
      column = 0L,
      column_name = "_thead_")

  # Create a tibble that contains basic metadata
  # for the `tbody` component of the table
  table_tbody <-
    dplyr::tibble(
      content = NA_character_,
      type = "character",
      row = -1L,
      column = 0L,
      column_name = "_tbody_")

  # Create a tibble that contains basic metadata
  # for the table header component of the table
  table_heading <-
    tbl %>%
    names() %>%
    dplyr::as_tibble() %>%
    dplyr::rename(content = value) %>%
    dplyr::mutate(type = "character") %>%
    dplyr::mutate(row = 0L) %>%
    dplyr::mutate(column = 1:nrow(.)) %>%
    dplyr::mutate(column_name = content)

  # Create a tibble that contains basic metadata
  # for the table body component of the table
  table_body <-
    seq(nrow(tbl)) %>% as.integer() %>%
    purrr::map_df(
      .f = function(x) {
        tbl[x, ] %>% t() %>%
          dplyr::as_tibble() %>%
          dplyr::rename_at(.vars = 1, .funs = function(x) "content") %>%
          dplyr::mutate(type = tbl_classes) %>%
          dplyr::mutate(row = x) %>%
          dplyr::mutate(column = 1:nrow(.))})

  # Join in the column names into the `table_body`
  # tibble from `table_heading`
  table_body <-
    table_body %>%
    dplyr::inner_join(
      table_heading %>% select(column, column_name),
      by = "column")

  # Bind rows from `table_heading` and `table_body`
  dplyr::bind_rows(
    table_table,
    table_thead,
    table_tbody,
    table_heading,
    table_body)
}

#' Add inline CSS styles to columns in an HTML table object
#'
#' Modify column styles for a table within an HTML
#' table object. This is part of an intermediate set
#' of step in the \code{build_html_table()} ->
#' \code{add_..._style()} -> \code{emit_html()}
#' pattern.
#' @param html_tbl an HTML table object that is
#' created using the \code{build_html_table()}
#' function.
#' @param columns an optional vector of column index
#' numbers or column names (available in the
#' \code{html_tbl}'s \code{column} and
#' \code{column_name} variables, respectively) that
#' are to be targeted for transformation. If nothing
#' is provided here then the style will be applied
#' to all columns.
#' @param property the CSS style property that is
#' to the added.
#' @param values values for the CSS style property.
#' This could be provided as a single-length
#' character string representing to exact string
#' to be inserted, or, as a vector of values where
#' the individual values for the property will
#' be transformed to a space-separated string.
#' @return an HTML table object.
#' @importFrom dplyr pull bind_rows filter mutate arrange
#' @importFrom rlang UQ
#' @export
add_column_style <- function(html_tbl,
                             columns = NULL,
                             property,
                             values) {

  # For any `values`, ensure that they are
  # transformed to character objects and that
  # vector components are collapsed to a single
  # string
  values <-
    paste(values, collapse = " ") %>%
    as.character()

  # If nothing is provided to `columns` then apply
  # the style property to all columns in the table
  if (is.null(columns)) {
    columns <-
      html_tbl %>%
      dplyr::pull(column) %>%
      unique() %>%
      base::setdiff(0L)
  }

  # If the values provided in columns are stings,
  # we assume that column names are provided; in
  # this case, transform the column names to column
  # numbers for later transformation
  if (all(is.character(columns))) {
    columns <-
      html_tbl %>%
      dplyr::filter(column_name %in% columns) %>%
      dplyr::pull(column) %>%
      unique()
  }

  # If the property is not yet in the `html_tbl`
  # object, then, (1) create the column, (2) add in
  # the values selectively to the targeted columns,
  # (3) use `NA_character_` for non-targeted columns
  if (!(property %in% colnames(html_tbl))) {

    html_tbl_style <-
      dplyr::bind_rows(
        html_tbl %>%
          dplyr::filter(column %in% columns) %>%
          dplyr::mutate(rlang::UQ(property) := values),
        html_tbl %>%
          dplyr::filter(!(column %in% columns)) %>%
          dplyr::mutate(rlang::UQ(property) := NA_character_)) %>%
      dplyr::arrange(row, column)
  }

  # If the property is already in the `html_tbl`
  # object, then, (1) add in the values selectively to
  # the targeted columns, and (2) ensure that the
  # non-targeted columns are untouched
  if (property %in% colnames(html_tbl)) {

    html_tbl_style <-
      dplyr::bind_rows(
        html_tbl %>%
          dplyr::filter(column %in% columns) %>%
          dplyr::mutate(rlang::UQ(property) := values),
        html_tbl %>%
          dplyr::filter(!(column %in% columns))) %>%
      dplyr::arrange(row, column)
  }

  html_tbl_style
}



#' Add inline CSS styles to the HTML table object
#'
#' Modify the overall table style for a table
#' within an HTML table object. This is part of
#' an intermediate set of step in the
#' \code{build_html_table()} ->
#' \code{add_..._style()} -> \code{emit_html()}
#' pattern.
#' @param html_tbl an HTML table object that is
#' created using the \code{build_html_table()}
#' function.
#' @param property the CSS style property that is
#' to the added.
#' @param values values for the CSS style property.
#' This could be provided as a single-length
#' character string representing to exact string
#' to be inserted, or, as a vector of values where
#' the individual values for the property will
#' be transformed to a space-separated string.
#' @return an HTML table object.
#' @importFrom dplyr pull bind_rows filter mutate arrange
#' @importFrom rlang UQ
#' @export
add_table_style <- function(html_tbl,
                            property,
                            values) {

  # For any `values`, ensure that they are
  # transformed to character objects and that
  # vector components are collapsed to a single
  # string
  values <-
    paste(values, collapse = " ") %>%
    as.character()

  # If the property is not yet in the `html_tbl`
  # object, then, (1) create the column, (2) add in
  # the values selectively to the <table> element,
  # (3) use `NA_character_` for non-targeted elements
  if (!(property %in% colnames(html_tbl))) {

    html_tbl_style <-
      dplyr::bind_rows(
        html_tbl %>%
          dplyr::filter(row == -3L) %>%
          dplyr::mutate(rlang::UQ(property) := values),
        html_tbl %>%
          dplyr::filter(row != -3L) %>%
          dplyr::mutate(rlang::UQ(property) := NA_character_)) %>%
      dplyr::arrange(row, column)
  }

  # If the property is already in the `html_tbl`
  # object, then, (1) add in the values selectively to
  # the <table> element, and (2) ensure that the
  # non-targeted elements are untouched
  if (property %in% colnames(html_tbl)) {

    html_tbl_style <-
      dplyr::bind_rows(
        html_tbl %>%
          dplyr::filter(row == -3L) %>%
          dplyr::mutate(rlang::UQ(property) := values),
        html_tbl %>%
          dplyr::filter(row != -3L)) %>%
      dplyr::arrange(row, column)
  }

  html_tbl_style
}



#' Add inline CSS styles to the header of an HTML table object
#'
#' Modify the style of the header for a table
#' within an HTML table object. This is part of
#' an intermediate set of step in the
#' \code{build_html_table()} ->
#' \code{add_..._style()} -> \code{emit_html()}
#' pattern.
#' @param html_tbl an HTML table object that is
#' created using the \code{build_html_table()}
#' function.
#' @param property the CSS style property that is
#' to the added.
#' @param values values for the CSS style property.
#' This could be provided as a single-length
#' character string representing to exact string
#' to be inserted, or, as a vector of values where
#' the individual values for the property will
#' be transformed to a space-separated string.
#' @return an HTML table object.
#' @importFrom dplyr pull bind_rows filter mutate arrange
#' @importFrom rlang UQ
#' @export
add_header_style <- function(html_tbl,
                             property,
                             values) {

  # For any `values`, ensure that they are
  # transformed to character objects and that
  # vector components are collapsed to a single
  # string
  values <-
    paste(values, collapse = " ") %>%
    as.character()

  # If the property is not yet in the `html_tbl`
  # object, then, (1) create the column, (2) add in
  # the values selectively to the <thead> element,
  # (3) use `NA_character_` for non-targeted elements
  if (!(property %in% colnames(html_tbl))) {

    html_tbl_style <-
      dplyr::bind_rows(
        html_tbl %>%
          dplyr::filter(row == -2L) %>%
          dplyr::mutate(rlang::UQ(property) := values),
        html_tbl %>%
          dplyr::filter(row != -2L) %>%
          dplyr::mutate(rlang::UQ(property) := NA_character_)) %>%
      dplyr::arrange(row, column)
  }

  # If the property is already in the `html_tbl`
  # object, then, (1) add in the values selectively to
  # the <thead> element, and (2) ensure that the
  # non-targeted elements are untouched
  if (property %in% colnames(html_tbl)) {

    html_tbl_style <-
      dplyr::bind_rows(
        html_tbl %>%
          dplyr::filter(row == -2L) %>%
          dplyr::mutate(rlang::UQ(property) := values),
        html_tbl %>%
          dplyr::filter(row != -2L)) %>%
      dplyr::arrange(row, column)
  }

  html_tbl_style
}



#' Add inline CSS styles to the body of an HTML table object
#'
#' Modify the style of the body for a table
#' within an HTML table object. This is part of
#' an intermediate set of step in the
#' \code{build_html_table()} ->
#' \code{add_..._style()} -> \code{emit_html()}
#' pattern.
#' @param html_tbl an HTML table object that is
#' created using the \code{build_html_table()}
#' function.
#' @param property the CSS style property that is
#' to the added.
#' @param values values for the CSS style property.
#' This could be provided as a single-length
#' character string representing to exact string
#' to be inserted, or, as a vector of values where
#' the individual values for the property will
#' be transformed to a space-separated string.
#' @return an HTML table object.
#' @importFrom dplyr pull bind_rows filter mutate arrange
#' @importFrom rlang UQ
#' @export
add_body_style <- function(html_tbl,
                           property,
                           values) {

  # For any `values`, ensure that they are
  # transformed to character objects and that
  # vector components are collapsed to a single
  # string
  values <-
    paste(values, collapse = " ") %>%
    as.character()

  # If the property is not yet in the `html_tbl`
  # object, then, (1) create the column, (2) add in
  # the values selectively to the <tbody> element,
  # (3) use `NA_character_` for non-targeted elements
  if (!(property %in% colnames(html_tbl))) {

    html_tbl_style <-
      dplyr::bind_rows(
        html_tbl %>%
          dplyr::filter(row == -1L) %>%
          dplyr::mutate(rlang::UQ(property) := values),
        html_tbl %>%
          dplyr::filter(row != -1L) %>%
          dplyr::mutate(rlang::UQ(property) := NA_character_)) %>%
      dplyr::arrange(row, column)
  }

  # If the property is already in the `html_tbl`
  # object, then, (1) add in the values selectively to
  # the <tbody> element, and (2) ensure that the
  # non-targeted elements are untouched
  if (property %in% colnames(html_tbl)) {

    html_tbl_style <-
      dplyr::bind_rows(
        html_tbl %>%
          dplyr::filter(row == -1L) %>%
          dplyr::mutate(rlang::UQ(property) := values),
        html_tbl %>%
          dplyr::filter(row != -1L)) %>%
      dplyr::arrange(row, column)
  }

  html_tbl_style
}



#' Transform a HTML table object to an HTML fragment
#'
#' Take a suitably styled HTML table object and
#' transform it to an HTML fragment. This is the
#' final step in the \code{build_html_table()} ->
#' \code{add_..._style()} -> \code{emit_html()}
#' pattern.
#' @param html_tbl an HTML table object that is
#' created using the \code{build_html_table()}
#' function.
#' @return an HTML table object.
#' @importFrom dplyr pull mutate filter
#' @importFrom glue glue
#' @importFrom tidyr unite
#' @importFrom purrr map
#' @importFrom rlang squash_chr
#' @importFrom knitr asis_output
#' @export
emit_html <- function(html_tbl) {

  if (ncol(html_tbl) >= 6) {

    for (i in 6:ncol(html_tbl)) {

      if (i == 6) style_names <- colnames(html_tbl)[6:ncol(html_tbl)]

      for (j in 1:nrow(html_tbl)) {

        if (is.na(html_tbl[j, i])) {

          html_tbl[j, i] <- ""

        } else {

          html_tbl[j, i] <-
            paste0(colnames(html_tbl)[i], ":", html_tbl[j, i] %>% dplyr::pull(), ";")
        }
      }
    }
  }

  if (ncol(html_tbl) >= 6) {

    table_content_styles <-
      html_tbl %>%
      tidyr::unite(col = style_attrs, 6:ncol(html_tbl), sep = "")

  } else {

    table_content_styles <-
      html_tbl %>%
      dplyr::mutate(style_attrs = "")
  }

  table_content_styles <-
    table_content_styles %>%
    dplyr::mutate(style_attrs = case_when(
      row %in% c(-1, -2, -3) & style_attrs != "" ~ style_attrs,
      row %in% c(-1, -2, -3) & style_attrs == "" ~ "",
      row ==  0 & style_attrs != "" ~ glue::glue("<th style=\"{style_attrs}\">{content}</th>") %>% as.character(),
      row ==  0 & style_attrs == "" ~ glue::glue("<th>{content}</th>") %>% as.character(),
      row  >  0 & style_attrs != "" ~ glue::glue("<td style=\"{style_attrs}\">{content}</td>") %>% as.character(),
      row  >  0 & style_attrs == "" ~ glue::glue("<td>{content}</td>") %>% as.character()))

  style_attrs_table <-
    table_content_styles %>%
    dplyr::filter(row == -3L) %>%
    dplyr::select(style_attrs) %>%
    dplyr::pull()

  style_attrs_thead <-
    table_content_styles %>%
    dplyr::filter(row == -2L) %>%
    dplyr::select(style_attrs) %>%
    dplyr::pull()

  style_attrs_tbody <-
    table_content_styles %>%
    dplyr::filter(row == -1L) %>%
    dplyr::select(style_attrs) %>%
    dplyr::pull()

  # Construct the `<table>` tag
  table_component <-
    ifelse(style_attrs_table == "", "<table>\n",
           glue::glue("<table style=\"{style_attrs_table}\">\n") %>%
             as.character())

  # Construct the `<thead>` tag
  thead_component <-
    ifelse(style_attrs_thead == "", " <thead>\n   <tr>\n",
           glue::glue("<thead style=\"{style_attrs_thead}\">\n   <tr>\n") %>%
             as.character())

  # Build the table heading component
  table_heading_component <-
    table_content_styles %>%
    dplyr::filter(row == 0) %>%
    dplyr::pull(style_attrs) %>%
    paste("   ", ., "\n", collapse = "")

  # Define the thead closing component
  thead_closing_component <- " </thead>\n"

  tbody_component <-
    ifelse(style_attrs_tbody == "", " <tbody>\n",
           glue::glue(" <tbody style=\"{style_attrs_tbody}\">\n") %>%
             as.character())

  # Build the table body component
  table_body_component <-
    table_content_styles %>%
    dplyr::filter(row > 0) %>%
    dplyr::pull(row) %>%
    unique() %>%
    purrr::map(.f = function(x) {

      table_content_styles %>%
        dplyr::filter(row == x) %>%
        dplyr::pull(style_attrs) %>%
        paste("   ", ., collapse = "\n") %>%
        paste0("  <tr>\n", ., "\n  </tr>\n")
    }) %>%
    rlang::squash_chr() %>%
    paste(collapse = "")

  # Define the table closing component
  table_closing_component <- "</tbody>\n</table>\n"

  paste(
    "<!--html_preserve-->\n",
    table_component,
    thead_component,
    table_heading_component,
    thead_closing_component,
    tbody_component,
    table_body_component,
    table_closing_component, "<br />",
    "<!--/html_preserve-->\n",
    collapse = "") %>%
    knitr::asis_output()
}


#' Helper function for adding a data table
#'
#' Add a data table inside the body of the
#' email with this helper function. Simply
#' provide a \code{data.frame} or tibble
#' object and the function will sensibly
#' style the table during insertion.
#'
#' If more control over the table styling is
#' required, then an alternative is to use the
#' \code{build_html_table()} ->
#' \code{add_column_style()} -> \code{emit_html()}
#' pattern for building and inserting a table.
#' @param tbl a \code{data.frame} object or a
#' tibble.
#' @return a character object with an HTML
#' fragment that can be placed inside the
#' message body wherever the table should
#' appear.
#' @importFrom dplyr filter pull mutate
#' @importFrom stringr str_replace_all str_to_title
#' @export
add_table <- function(tbl) {

  html_table <-
    build_html_table(tbl = tbl)

  # Perform NA replacement with em dashes
  html_table <-
    html_table %>%
    dplyr::mutate(content = ifelse(is.na(content) & row > 0, "&#8212", content))

  # Perform column name transformation
  html_table <-
    html_table %>%
    dplyr::mutate(
      content = ifelse(
        row == 0,
        content %>% stringr::str_replace_all("_", " ") %>% stringr::str_to_title(), content))

  # Get column indices for numeric columns
  numeric_columns <-
    html_table %>%
    dplyr::filter(row > 0) %>%
    dplyr::filter(type %in% c("integer", "numeric")) %>%
    dplyr::pull(column) %>%
    unique()

  # Get column indices for character-based columns
  character_columns <-
    html_table %>%
    dplyr::filter(row > 0) %>%
    dplyr::filter(type == "character") %>%
    dplyr::pull(column) %>%
    unique()

  # Align text for any numeric columns to the right
  if (length(numeric_columns) > 0) {

    html_table <-
      html_table %>%
      add_column_style(
        columns = numeric_columns,
        property = "text-align",
        values = "right")
  }

  # Align text for any character-based columns to the left
  if (length(character_columns) > 0) {

    html_table <-
      html_table %>%
      add_column_style(
        columns = character_columns,
        property = "text-align",
        values = "left")
  }

  html_table <-
    html_table %>%
    add_column_style(
      property = "padding",
      values = "5px") %>%
    add_header_style(
      property = "border-top",
      values = "2px solid #ddd") %>%
    add_header_style(
      property = "border-bottom",
      values = "2px solid #ddd") %>%
    add_column_style(
      property = "border-bottom",
      values = "1px solid #ddd") %>%
    add_table_style(
      property = "width",
      values = "100%")

  emit_html(html_tbl = html_table)
}
