#' Create a `gt_multi` container for multiple **gt** table objects
#'
#' @description
#'
#' The `gt_multi()` function creates a container for storage of multiple **gt**
#' tables. This type of object allows for flexibility in printing multiple
#' tables in different output formats. For example, if printing multiple tables
#' in a paginated output environment (e.g., RTF, Word, etc.), each **gt** table
#' can be printed independently and table separation (usually a page break)
#' occurs between each of those.
#'
#' @param ... One or more **gt** table (`gt_tbl`) objects, typically generated
#'   via the [gt()] function.
#' @param .list Allows for the use of a list as an input alternative to `...`.
#' @param .use_parent_opts Should options specified in the `gt_multi` object be
#'   applied to all contained **gt** tables? By default this is `FALSE`.
#'
#' @return An object of class `gt_multi`.
#'
#' @import rlang
#' @export
gt_multi <- function(
    ...,
    .list = list2(...),
    .use_parent_opts = FALSE
) {

  # Collect a list of objects
  gt_tbl_list <- .list

  # If no data is provided, return an empty `gt_multi` object
  if (length(gt_tbl_list) < 1) {
    return(init_gt_multi_list())
  }

  # Initialize the `gt_multi` object and create
  # an empty `gt_tbl_tbl` object
  gt_multi <- init_gt_multi_list()
  gt_tbl_tbl <- generate_gt_tbl_tbl_0()

  #
  # Process gt tables and add records to the `gt_tbl_tbl` object
  #

  for (i in seq_len(length(gt_tbl_list))) {

    gt_tbl_tbl_i <- generate_gt_tbl_tbl_i(i = i, gt_tbl = gt_tbl_list[[i]])
    gt_tbl_tbl <- dplyr::bind_rows(gt_tbl_tbl, gt_tbl_tbl_i)
  }

  # Add fully-processed `gt_tbl_tbl` object into `gt_multi`
  gt_multi[["gt_tbls"]] <- gt_tbl_tbl
  gt_multi[["use_parent_opts"]] <- .use_parent_opts

  gt_multi
}

#' Pull out a **gt** table from a `gt_multi` container object
#'
#' @description
#'
#' Should you have a `gt_multi` object, created through use of the [gt_multi()]
#' function, you may have a need to extract a **gt** table from that container.
#' The `pull_gt_tbls()` function makes this possible, returning a `gt_tbl`
#' object. The only thing you need to provide is the index value for the **gt**
#' table within the `gt_multi` object.
#'
#' @param data A `gt_multi` container object, typically generated through use of
#'   the [gt_multi()] function along with one or more `gt_tbl` objects.
#' @param which An index value denoting which `gt_tbl` table should be obtained
#'   from the `gt_multi` object.
#'
#' @return An object of class `gt_tbl`.
#'
#' @export
pull_gt_tbls <- function(
    data,
    which
) {

  # TODO: this only handles the extraction of a single table currently;
  # need to implement extraction of multiple `gt_tbl`s to a bare list

  gt_tbl <- extract_gt_tbl_from_gt_multi(data = data, which = which)

  use_parent_opts <- get_use_parent_opts_param(data = data)

  if (use_parent_opts) {
    # Extract options from `data` (which is a `gt_multi` object)
    gt_tbl[["_options"]] <- data[["gt_tbl_options"]]
  }

  gt_tbl
}

#' Add one or more **gt** tables to a `gt_multi` container object
#'
#' @description
#'
#' Should you have a `gt_multi` object, created through use of the [gt_multi()]
#' function, you might want to add more **gt** tables to that container. While
#' it's common to generate a `gt_multi` object with a collection of `gt_tbl`
#' objects, one can also create an 'empty' `gt_multi` object. Whatever your
#' workflow might be, the `add_gt_tbls()` function makes it possible to flexibly
#' add one or more new
#' **gt** tables, returning a refreshed `gt_multi`
#' object.
#'
#' @param .data A `gt_multi` container object, typically generated through use
#'   of the [gt_multi()] function along with one or more `gt_tbl` objects.
#' @param ... One or more **gt** table (`gt_tbl`) objects, typically generated
#'   via the [gt()] function.
#' @param .list Allows for the use of a list as an input alternative to `...`.
#' @param .before,.after A single index for either `.before` or `.after`,
#'   specifying where the supplied `gt_tbl` objects should be placed amongst the
#'   existing collection of **gt** tables. If nothing is provided for either
#'   argument the incoming `gt_tbl` objects will be appended.
#'
#' @return An object of class `gt_multi`.
#'
#' @import rlang
#' @export
add_gt_tbls <- function(
    .data,
    ...,
    .list = list2(...),
    .before = NULL,
    .after = NULL
) {

  # Collect a list of objects
  gt_tbl_list <- .list

  # If no data is provided, return the `gt_multi` unchanged
  if (length(gt_tbl_list) < 1) {
    return(.data)
  }

  gt_multi <- .data

  #
  # Stop function if `.before` and `.after` options are invalid
  #

  if (!is.null(.before) && !is.null(.after)) {
    cli::cli_abort("Values cannot be supplied for both `.before` and `.after`.")
  }

  valid_idx <- seq_len(nrow(gt_multi[["gt_tbls"]]))

  if (is.null(.before) && is.null(.after)) {

    insertion_mode <- "append"

  } else if (!is.null(.after)) {

    if (!rlang::is_integerish(.after)) {
      cli::cli_abort("An integer value should be supplied for `.after`.")
    }

    if (!(.after %in% valid_idx)) {
      cli::cli_abort("The value supplied for `.after` should be a valid index.")
    }

    if (.after == max(valid_idx)) {
      insertion_mode <- "append"
    } else {
      insertion_mode <- "insert"
    }

  } else if (!is.null(.before)) {

    if (!rlang::is_integerish(.before)) {
      cli::cli_abort("An integer value should be supplied for `.before`.")
    }

    if (!(.before %in% valid_idx)) {
      cli::cli_abort("The value supplied for `.before` should be a valid index.")
    }

    if (.before == min(valid_idx)) {
      insertion_mode <- "prepend"
    } else {
      insertion_mode <- "insert"
      .after <- .before - 1
    }
  }

  # Create an empty `gt_tbl_tbl` object
  gt_tbl_tbl <- generate_gt_tbl_tbl_0()

  #
  # Process gt tables and add records to the `gt_tbl_tbl` object
  #

  for (i in seq_len(length(gt_tbl_list))) {

    gt_tbl_tbl_i <- generate_gt_tbl_tbl_i(i = i, gt_tbl = gt_tbl_list[[i]])
    gt_tbl_tbl <- dplyr::bind_rows(gt_tbl_tbl, gt_tbl_tbl_i)
  }

  #
  # Add fully-processed `gt_tbl_tbl` object into `gt_multi`
  #

  if (insertion_mode == "insert") {

    gt_multi[["gt_tbls"]] <-
      dplyr::bind_rows(
        gt_multi[["gt_tbls"]][1:.after, ],
        gt_tbl_tbl,
        gt_multi[["gt_tbls"]][(.after + 1):max(valid_idx), ]
      )

  } else if (insertion_mode == "append") {

    gt_multi[["gt_tbls"]] <- dplyr::bind_rows(gt_multi[["gt_tbls"]], gt_tbl_tbl)

  } else {

    gt_multi[["gt_tbls"]] <- dplyr::bind_rows(gt_tbl_tbl, gt_multi[["gt_tbls"]])
  }

  gt_multi <- reindex_gt_tbls(data = gt_multi)

  gt_multi
}

#' Remove one or more **gt** tables from a `gt_multi` container object
#'
#' @description
#'
#' A `gt_multi` object, created through use of the [gt_multi()] function, can
#' hold a multiple of **gt** tables. However, you might want to delete one or
#' more `gt_tbl` objects table from that container. With `rm_gt_tbls()`, this
#' possible and safe to perform. What's returned is a `gt_multi` object with the
#' specified `gt_tbl` objects gone. The only thing you need to provide is the
#' index value for the **gt** table within the `gt_multi` object.
#'
#' @param data A `gt_multi` container object, typically generated through use of
#'   the [gt_multi()] function along with one or more `gt_tbl` objects.
#' @param which An index value denoting which `gt_tbl` table should be removed
#'   from the `gt_multi` object.
#'
#' @return An object of class `gt_multi`.
#'
#' @export
rm_gt_tbls <- function(
    data,
    which
) {

  # TODO: this only handles the removal of a single table currently;
  # need to implement removal of multiple `gt_tbl`s to a bare list

  remove_gt_tbl_from_gt_multi(data = data, which = which)
}

#' Replace one or more **gt** tables in a `gt_multi` container object
#'
#' @description
#'
#' The [gt_multi()] function can be used to create a container for multiple
#' **gt** tables. In some circumstances, you might want to replace a specific
#' `gt_tbl` object (or multiple) with a different one. This can be done with the
#' `replace_gt_tbls()` function. The important thing is that the number of
#' **gt** tables provided must equal the number of indices for tables present
#' in the `gt_multi` object.
#'
#' @param .data A `gt_multi` container object, typically generated through use
#'   of the [gt_multi()] function along with one or more `gt_tbl` objects.
#' @param ... One or more **gt** table (`gt_tbl`) objects, typically generated
#'   via the [gt()] function.
#' @param .list Allows for the use of a list as an input alternative to `...`.
#' @param .which Index values denoting which `gt_tbl` tables should be replaced
#'   in the `gt_multi` object.
#'
#' @return An object of class `gt_multi`.
#'
#' @export
replace_gt_tbls <- function(
    .data,
    ...,
    .list = list2(...),
    .which
) {

  # Collect a list of objects
  gt_tbl_list <- .list

  # Stop function if no data is provided
  if (length(gt_tbl_list) < 1) {
    cli::cli_abort("At least one gt table must be provided.")
  }

  gt_multi <- .data

  valid_idx <- seq_len(nrow(gt_multi[["gt_tbls"]]))

  if (!all(.which %in% valid_idx)) {
    cli::cli_abort("All values provided in `.which` must be valid indices.")
  }

  if (length(gt_tbl_list) != length(unique(.which))) {
    cli::cli_abort(
      "The number of indices in `.which` must match the number of `gt_tbl` objects."
    )
  }

  #
  # Process gt tables and add records to the `gt_tbl_tbl` object
  #

  for (i in seq_len(length(.which))) {

    gt_tbl_tbl_i <- generate_gt_tbl_tbl_i(i = i, gt_tbl = gt_tbl_list[[i]])

    gt_multi[["gt_tbls"]][.which[i], ] <- gt_tbl_tbl_i
  }

  gt_multi <- reindex_gt_tbls(data = gt_multi)

  gt_multi
}

#' Modify table options for all tables within a `gt_multi` object
#'
#' @description
#'
#' Modify the options for a collection of **gt** tables in a `gt_multi` object.
#' These options are named by the components, the subcomponents, and the
#' element that can adjusted.
#'
#' @inheritParams tab_options
#'
#' @export
opts_gt_tbls <- function(
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
) {

  # Perform input object validation for the `gt_multi` object
  # stop_if_not_gt(data = data)

  # Extract options from `data` (which is a `gt_multi` object)
  opts_df <- data[["gt_tbl_options"]]

  arg_names <-
    base::setdiff(
      names(formals(opts_gt_tbls)),
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
  data[["gt_tbl_options"]] <- opts_df

  #
  # TODO: Handle special cases where option values are vectors
  #
  #
  # ihtml_page_size_values <- mget("ihtml.page_size_values")
  # if (!is.null(ihtml_page_size_values[[1]])) {
  #   data <-
  #     dt_options_set_value(
  #       data = data,
  #       option = "ihtml_page_size_values",
  #       value = unname(unlist(ihtml_page_size_values))
  #     )
  # }
  #
  # ihtml_page_size_default <- mget("ihtml.page_size_default")
  # if (!is.null(ihtml_page_size_default[[1]])) {
  #   data <-
  #     dt_options_set_value(
  #       data = data,
  #       option = "ihtml_page_size_default",
  #       value = unname(unlist(ihtml_page_size_default))
  #     )
  # }

  data
}

init_gt_multi_list <- function() {

  # Initialize the `gt_multi` object
  gt_multi <- list()

  gt_multi[["gt_tbls"]] <- generate_gt_tbl_tbl_0()
  gt_multi[["gt_tbl_options"]] <- dt_options_tbl
  gt_multi[["use_parent_opts"]] <- FALSE

  class(gt_multi) <- "gt_multi"
  gt_multi
}

generate_gt_tbl_tbl_0 <- function() {

  dplyr::tibble(
    i = NA_integer_,
    gt_tbl = list(),
    column_names = list(),
    n_columns_total = NA_integer_,
    n_columns_data = NA_integer_,
    n_columns_stub = NA_integer_,
    n_rows_data = NA_integer_,
    n_summary_rows_total = NA_integer_,
    n_summary_rows_group = NA_integer_,
    n_summary_rows_grand = NA_integer_,
    n_groups_summary_rows_total = NA_integer_,
    n_groups_summary_rows_group = NA_integer_,
    n_groups_summary_rows_grand = NA_integer_,
    n_groups = NA_integer_,
    active = NA
  )[0, ]
}

generate_gt_tbl_tbl_i <- function(i, gt_tbl, active = TRUE) {

  gt_tbl_info_list <- generate_gt_tbl_info_list(gt_tbl = gt_tbl)

  dplyr::tibble(
    i = i,
    gt_tbl = list(gt_tbl),
    column_names = list(gt_tbl_info_list$column_names),
    n_columns_total = gt_tbl_info_list$n_columns_total,
    n_columns_data = gt_tbl_info_list$n_columns_data,
    n_columns_stub = gt_tbl_info_list$n_columns_stub,
    n_rows_data = gt_tbl_info_list$n_rows_data,
    n_summary_rows_total = gt_tbl_info_list$n_summary_rows_total,
    n_summary_rows_group = gt_tbl_info_list$n_summary_rows_group,
    n_summary_rows_grand = gt_tbl_info_list$n_summary_rows_grand,
    n_groups_summary_rows_total = gt_tbl_info_list$n_groups_summary_rows_total,
    n_groups_summary_rows_group = gt_tbl_info_list$n_groups_summary_rows_group,
    n_groups_summary_rows_grand = gt_tbl_info_list$n_groups_summary_rows_grand,
    n_groups = gt_tbl_info_list$n_groups,
    active = active
  )
}

generate_gt_tbl_info_list <- function(gt_tbl) {

  stop_if_not_gt(data = gt_tbl)

  gt_tbl_built <- build_data(data = gt_tbl, context = "html")

  column_names <- dt_boxhead_get_vars_default(data = gt_tbl_built)

  # Get various column number counts
  n_columns_total <- get_effective_number_of_columns(data = gt_tbl_built)
  n_columns_data <- get_number_of_visible_data_columns(data = gt_tbl_built)
  n_columns_stub <- n_columns_total - n_columns_data

  # Get various row number counts
  n_rows_data <- nrow(gt_tbl_built[["_stub_df"]])

  if (dt_summary_exists(data = gt_tbl_built)) {

    summary_list <- gt_tbl_built[["_summary_build"]][["summary_df_display_list"]]

    n_groups_summary_rows_total <- length(summary_list)

    n_summary_rows_total <-
      sum(
        vapply(
          summary_list,
          FUN.VALUE = integer(1),
          FUN = function(x) nrow(x))
      )

    if (!is.null(summary_list[["::GRAND_SUMMARY"]])) {
      n_summary_rows_grand <- nrow(summary_list[["::GRAND_SUMMARY"]])
      n_groups_summary_rows_grand <- 1L
    } else {
      n_summary_rows_grand <- 0L
      n_groups_summary_rows_grand <- 0L
    }

    n_summary_rows_group <- n_summary_rows_total - n_summary_rows_grand
    n_groups_summary_rows_group <-
      n_groups_summary_rows_total - n_groups_summary_rows_grand

  } else {
    n_summary_rows_total <- 0L
    n_summary_rows_group <- 0L
    n_summary_rows_grand <- 0L
    n_groups_summary_rows_total <- 0L
    n_groups_summary_rows_group <- 0L
    n_groups_summary_rows_grand <- 0L
  }

  # TODO: Get total count of groups
  n_groups <- 0L

  list(
    column_names = column_names,
    n_columns_total = n_columns_total,
    n_columns_data = n_columns_data,
    n_columns_stub = n_columns_stub,
    n_rows_data = n_rows_data,
    n_summary_rows_total = n_summary_rows_total,
    n_summary_rows_group = n_summary_rows_group,
    n_summary_rows_grand = n_summary_rows_grand,
    n_groups_summary_rows_total = n_groups_summary_rows_total,
    n_groups_summary_rows_group = n_groups_summary_rows_group,
    n_groups_summary_rows_grand = n_groups_summary_rows_grand,
    n_groups = n_groups
  )
}

extract_gt_tbl_from_gt_multi <- function(data, which) {

  valid_idx <- seq_len(nrow(data[["gt_tbls"]]))

  if (!(which %in% valid_idx)) {
    cli::cli_abort("The value for `which` is not a valid index.")
  }

  gt_tbl <- data[["gt_tbls"]][["gt_tbl"]][[which]]

  gt_tbl
}

remove_gt_tbl_from_gt_multi <- function(data, which) {

  valid_idx <- seq_len(nrow(data[["gt_tbls"]]))

  if (!(which %in% valid_idx)) {
    cli::cli_abort("The value for `which` is not a valid index.")
  }

  data[["gt_tbls"]] <- data[["gt_tbls"]][-which, ]

  data <- reindex_gt_tbls(data = data)

  data
}

reindex_gt_tbls <- function(data) {
  new_idx <- seq_len(nrow(data[["gt_tbls"]]))
  data[["gt_tbls"]][["i"]] <- new_idx
  data
}

get_use_parent_opts_param <- function(data) {
  data[["use_parent_opts"]]
}
