#' Add group-wise summary rows using aggregation functions
#'
#' @description
#' Add summary rows to one or more row groups by using the table data and any
#' suitable aggregation functions. You choose how to format the values in the
#' resulting summary cells by use of a `formatter` function (e.g, `fmt_number`,
#' etc.) and any relevant options.
#'
#' @details
#' Should we need to obtain the summary data for external purposes, the
#' [extract_summary()] function can be used with a `gt_tbl` object where summary
#' rows were added via `summary_rows()`.
#'
#' @inheritParams fmt_number
#' @param groups The groups to consider for generation of group-wise summary
#'   rows. By default this is set to `everything()`, which means that all
#'   available groups will obtain summary rows. Providing the names of row
#'   groups in `c()` will create a group-wise summary and generate summary rows
#'   for the specified groups. Setting this to `TRUE` indicates that all
#'   available groups will receive group-wise summary rows.
#' @param columns The columns for which the summaries should be calculated. By
#'   default, this is every column that has data cells (given by
#'   `everything()`).
#' @param fns Functions used for aggregations. This can include base functions
#'   like `mean`, `min`, `max`, `median`, `sd`, or `sum` or any other
#'   user-defined aggregation function. The function(s) should be supplied
#'   within a `list()`. Within that list, we can specify the functions by use of
#'   function names in quotes (e.g., `"sum"`), as bare functions (e.g., `sum`),
#'   or as one-sided R formulas using a leading `~`. In the formula
#'   representation, a `.` serves as the data to be summarized (e.g., `sum(.,
#'   na.rm = TRUE)`). The use of named arguments is recommended as the names
#'   will serve as summary row labels for the corresponding summary rows data
#'   (the labels can derived from the function names but only when not providing
#'   bare function names).
#' @param fmt Formatting directives as one-sided R formulas using a leading `~`
#'   (e.g., `~ fmt_number(., decimals = 3, use_seps = FALSE`).
#' @param missing_text The text to be used in place of `NA` values in summary
#'   cells with no data outputs.
#' @param formatter A formatter function name. These can be any of the `fmt_*()`
#'   functions available in the package (e.g., [fmt_number()], [fmt_percent()],
#'   etc.), or a custom function using [fmt()]. The options of a formatter can
#'   be accessed through `...`.
#' @param ... Values passed to the `formatter` function, where the provided
#'   values are to be in the form of named vectors. For example, when using the
#'   default `formatter` function, [fmt_number()], options such as `decimals`,
#'   `use_seps`, and `locale` can be used.
#'
#' @return An object of class `gt_tbl`.
#'
#' @section Examples:
#'
#' Use [`sp500`] to create a **gt** table with row groups. Create the summary
#' rows labeled `min`, `max`, and `avg` by row group (where each each row group
#' is a week number) with the `summary_rows()` function.
#'
#' ```r
#' sp500 %>%
#'   dplyr::filter(date >= "2015-01-05" & date <="2015-01-16") %>%
#'   dplyr::arrange(date) %>%
#'   dplyr::mutate(week = paste0("W", strftime(date, format = "%V"))) %>%
#'   dplyr::select(-adj_close, -volume) %>%
#'   gt(
#'     rowname_col = "date",
#'     groupname_col = "week"
#'   ) %>%
#'   summary_rows(
#'     fns = list(
#'       "min",
#'       "max",
#'       list(label = "avg", fn = "mean")
#'     ),
#'     formatter = fmt_number,
#'     use_seps = FALSE
#'   )
#' ```
#'
#' \if{html}{\out{
#' `r man_get_image_tag(file = "man_summary_rows_1.png")`
#' }}
#'
#' @family row addition/modification functions
#' @section Function ID:
#' 5-1
#'
#' @export
summary_rows <- function(
    data,
    groups = everything(),
    columns = everything(),
    fns = NULL,
    fmt = NULL,
    missing_text = "---",
    formatter = NULL,
    ...
) {

  # Perform input object validation
  stop_if_not_gt(data = data)

  # Collect all provided formatting options in a list
  formatter_options <- list(...)

  # Perform a partial build of the table to obtain the current
  # state of `group_id` values in the table; we should not assign this
  # to `data` but to a new object (`data_built`) so that we do not
  # affect the return value of `data`
  data_built <- dt_body_build_init(data = data)
  data_built <- dt_groups_rows_build(data = data_built, context = "html")
  groups_rows_tbl <- dt_groups_rows_get(data = data_built)

  # Pull a character vector of available groups from `groups_rows_tbl`
  available_groups <- dplyr::pull(groups_rows_tbl, group_id)

  # Return data unchanged if there are no groups and this summary is not
  # a grand summary
  if (length(available_groups) < 1) {
    if (!(
      is.character(groups) &&
      length(groups) == 1 &&
      groups == ":GRAND_SUMMARY:"
    )) {
      return(data)
    }
  }

  # Resolve the group names
  groups <-
    resolve_groups(
      expr = {{ groups }},
      vector = available_groups
    )

  # Return data unchanged if no groups were resolved
  if (is.null(groups)) {
    return(data)
  }

  # Resolve the column names
  columns <-
    resolve_cols_c(
      expr = {{ columns }},
      data = data
    )

  stub_available <- dt_stub_df_exists(data = data)

  # If there isn't a stub available, create an
  # 'empty' stub (populated with empty strings);
  # the stub is necessary for summary row labels
  if (!stub_available) {

    data <-
      dt_boxhead_add_var(
        data = data,
        var = rowname_col_private,
        type = "stub",
        column_label = list(rowname_col_private),
        column_align = "left",
        column_width = list(NULL),
        hidden_px = list(NULL),
        add_where = "bottom"
      )

    # Add the `"::rowname::"` column into `_data`
    data$`_data` <-
      data$`_data` %>%
      dplyr::mutate(!!rowname_col_private := rep("", nrow(data$`_data`))) %>%
      dplyr::select(dplyr::everything(), dplyr::all_of(rowname_col_private))

    # Get the `stub_df` object from `data`
    stub_df <- dt_stub_df_get(data = data)

    # Place the `::rowname::` values into `stub_df$row_id`; these are
    # empty strings which will provide an empty stub for locations
    # adjacent to the body rows
    stub_df[["row_id"]] <- ""

    data <-
      dt_stub_df_set(
        data = data,
        stub_df = stub_df
      )
  }

  # With `fns` input, normalize to list of summary functions
  summary_fns <- normalize_summary_fns(fns = fns)

  # If `formatter` has a value but `fmt` does not, adapt the value provided
  # in `formatter` and `...` and warn about their deprecation
  if (is.null(fmt) && !is.null(formatter) && is.function(formatter)) {

    fmt_args <-
      vapply(
        seq_along(formatter_options),
        FUN.VALUE = character(1),
        USE.NAMES = FALSE,
        FUN = function(x) {
          paste0(names(formatter_options[x]), " = ", formatter_options[x])
        }
      )

    fmt_args <-
      paste0(
        ".",
        if (length(fmt_args) > 0) ", " else NULL,
        paste(
          fmt_args, collapse = ", "
        )
      )

    formatter_name <- deparse(substitute(formatter))

    formatter_formula <- paste0("~ ", formatter_name, "(", fmt_args, ")")

    fmt <- list(as.formula(formatter_formula))

    # Provide deprecation warning
    cli::cli_warn(c(
      "Since gt v0.9.0, the `formatter` argument (and associated `...`) has been deprecated.",
      "*" = "Please use the `fmt` argument to provide formatting directives."
    ))
  }

  # With `fmt` input, normalize to list of formatting functions
  fmt_fns <- normalize_fmt_fns(fmt = fmt)

  summary_list <-
    list(
      groups = groups,
      columns = columns,
      fns = summary_fns,
      fmt = fmt_fns,
      missing_text = missing_text,
      formatter = formatter,
      formatter_options = formatter_options
    )

  dt_summary_add(
    data = data,
    summary = summary_list
  )
}

#' Add grand summary rows using aggregation functions
#'
#' @description
#' Add grand summary rows to the **gt** table by using applying aggregation
#' functions to the table data. The summary rows incorporate all of the
#' available data, regardless of whether some of the data are part of row
#' groups. You choose how to format the values in the resulting summary cells by
#' use of a `formatter` function (e.g, `fmt_number`) and any relevant options.
#'
#' @details
#' Should we need to obtain the summary data for external purposes, the
#' [extract_summary()] function can be used with a `gt_tbl` object where grand
#' summary rows were added via `grand_summary_rows()`.
#'
#' @inheritParams summary_rows
#'
#' @return An object of class `gt_tbl`.
#'
#' @section Examples:
#'
#' Use [`sp500`] to create a **gt** table with row groups. Create the grand
#' summary rows `min`, `max`, and `avg` for the table with the
#' `grand_summary_rows()` function.
#'
#' ```r
#' sp500 %>%
#'   dplyr::filter(date >= "2015-01-05" & date <= "2015-01-16") %>%
#'   dplyr::arrange(date) %>%
#'   dplyr::mutate(week = paste0("W", strftime(date, format = "%V"))) %>%
#'   dplyr::select(-adj_close, -volume) %>%
#'   gt(
#'     rowname_col = "date",
#'     groupname_col = "week"
#'   ) %>%
#'   grand_summary_rows(
#'     columns = c(open, high, low, close),
#'     fns = list(
#'       min = ~min(.),
#'       max = ~max(.),
#'       avg = ~mean(.)
#'     ),
#'     formatter = fmt_number,
#'     use_seps = FALSE
#'   )
#' ```
#'
#' \if{html}{\out{
#' `r man_get_image_tag(file = "man_grand_summary_rows_1.png")`
#' }}
#'
#' @family row addition/modification functions
#' @section Function ID:
#' 5-2
#'
#' @export
grand_summary_rows <- function(
    data,
    columns = everything(),
    fns = NULL,
    missing_text = "---",
    formatter = NULL,
    ...
) {

  # Perform input object validation
  stop_if_not_gt(data = data)

  summary_rows(
    data = data,
    groups = ":GRAND_SUMMARY:",
    columns = {{ columns }},
    fns = fns,
    missing_text = missing_text,
    formatter = formatter,
    ...
  )
}

# Normalize `fns` input in `summary_rows` and `grand_summary_rows`
#
# Returns a normalized list of summary functions
# list(
#   <id> = list(label = "the **label**", fn = ~mean(., na.rm = TRUE)),
#   <id> = list(label = "another label", fn = ~sum(.))
# )
normalize_summary_fns <- function(fns) {

  if (length(fns) < 1) {
    return(list())
  }

  summary_fns <- list()

  if (rlang::is_formula(fns)) {
    fns <- list(rlang::new_formula(lhs = rlang::f_lhs(fns), rhs = rlang::f_rhs(fns)))
  }

  # Upgrade `fns` to a list if it's a vector
  if (!is.list(fns)) {
    fns <- as.list(fns)
  }

  if (
    is.list(fns) &&
    rlang::is_named(fns) &&
    all(names(fns) %in% c("id", "label", "fn"))
  ) {
    fns <- list(fns)
  }

  for (i in seq_along(fns)) {

    id <- NULL
    label <- NULL

    # Get `id` values if we have a named list
    if (rlang::is_named(fns[i])) {
      id <- names(fns[i])
    }

    # Extract the value of the first list component
    value <- fns[i][[1]]

    # If component is a named list, extract those elements by
    # any recognizable names
    if (
      is.list(value) &&
      rlang::is_named(value) &&
      all(names(value) %in% c("id", "label", "fn"))
    ) {

      id <- value$id
      label <- value$label
      value <- value$fn
    }

    if (is.character(value)) {

      #
      # Handle character vector cases
      #

      if (value %in% c("min", "max", "mean", "median", "sd", "sum")) {
        fn <- stats::as.formula(paste0("~", value, "(., na.rm = TRUE)"))
      } else {
        fn <- stats::as.formula(paste0("~", value, "(.)"))
      }

      if (is.null(id)) {
        id <- value
      }

      if (is.null(label)) {
        label <- value
      }

    } else if (rlang::is_formula(value)) {

      #
      # Handle formula cases
      #

      # Handles the syntax `label ~ fn(.)`

      formula_lhs <- rlang::f_lhs(value)
      formula_rhs <- rlang::f_rhs(value)

      fn <- rlang::new_formula(lhs = NULL, rhs = formula_rhs)

      # Determine if the LHS contains a two-element vector with a label and
      # an ID value; the order if not named is label then ID
      if (
        !is.name(formula_lhs) &&
        is.character(rlang::eval_bare(formula_lhs)) &&
        length(rlang::eval_bare(formula_lhs)) == 2
      ) {

        lhs_vector <- rlang::eval_bare(formula_lhs)

        # Get the names of the vector
        lhs_vector_names <- rlang::names2(lhs_vector)

        # If the vector is partially named, fill in the missing name (but
        # only if it has one recognized name)
        if (
          "" %in% lhs_vector_names &&
          any(lhs_vector_names %in% c("id", "label"))
        ) {
          if ("id" %in% lhs_vector_names) {
            names(lhs_vector)[names(lhs_vector) == ""] <- "label"
          } else {
            names(lhs_vector)[names(lhs_vector) == ""] <- "id"
          }
        }

        if (rlang::is_named(lhs_vector)) {

          vector_names <- names(lhs_vector)

          if (!all(vector_names %in% c("id", "label"))) {

            rlang::abort(c(
              "If using a named vector on the lhs of a formula for a summary
              function label and ID, it must have the correct names:",
              "*" = "The \"label\" and \"id\" names must be used."
            ))
          }

          if (length(unique(vector_names)) == 1) {

            which_duplicate_name <- unique(vector_names)

            rlang::abort(c(
              "If using a named vector on the lhs of a formula for a summary",
              "function label and ID, it must have two distinct names:",
              "*" = paste0("The \"", which_duplicate_name, "\" name was used twice.")
            ))
          }

          label <- unname(lhs_vector["label"])
          id <- unname(lhs_vector["id"])

        } else {

          label <- lhs_vector[1]
          id <- lhs_vector[2]
        }

      } else if (
        is.name(formula_lhs) ||
        !is.list(rlang::eval_bare(formula_lhs))
      ) {

        lhs_chr <- as.character(formula_lhs)

        if (is.null(id)) {
          id <- lhs_chr

          if (length(id) < 1) {

            formula_label <- rlang::as_label(formula_rhs)
            formula_label <- gsub("\\(.*", "", formula_label)
            id <- formula_label
          }
        }

        if (length(lhs_chr) < 1) {
          label <- id
        } else {
          label <- lhs_chr
        }

      } else if (is.list(rlang::eval_bare(formula_lhs))) {

        lhs_list <- rlang::eval_bare(formula_lhs)

        if (length(lhs_list) == 2) {

          if (rlang::is_named(lhs_list)) {

            component_names <- names(lhs_list)

            if (!all(component_names %in% c("id", "label"))) {

              rlang::abort(c(
                "If using a named list on the lhs of a formula for a summary",
                "function label and ID, it must have the correct names:",
                "*" = "The \"label\" and \"id\" names must be used"
              ))
            }

            label <- lhs_list[["label"]]
            id <- lhs_list[["id"]]

          } else {

            label <- lhs_list[[1]]
            id <- lhs_list[[2]]
          }
        }

        if (length(lhs_list) == 1) {

          if (is.null(id)) {

            id <- label <- lhs_list[[1]]

            if (
              inherits(id, "from_markdown") ||
              inherits(id, "html")
            ) {

              id <- create_unique_id_vals(id, simplify = TRUE)

            } else {
              label <- id
            }
          }
        }
      }
    }

    list_i <- list(list(label = label, fn = fn))

    names(list_i) <- id

    summary_fns <- c(summary_fns, list_i)
  }

  summary_fns
}

normalize_fmt_fns <- function(fmt) {

  if (is.null(fmt) || length(fmt) < 1) {
    return(NULL)
  }

  if (rlang::is_formula(fmt)) {
    fmt <- list(rlang::new_formula(lhs = rlang::f_lhs(fmt), rhs = rlang::f_rhs(fmt)))
  }

  fmt
}
