#' Modify the ordering of any row groups
#'
#' We can modify the display order of any row groups in a \pkg{gt} object with
#' the \code{row_group_order()} function. The \code{groups} argument can either
#' take a vector of row group names or a numeric vector of row group indices;
#' whichever is provided, the row groups will adhere to this revised ordering.
#' It isn't necessary to provide all row group names in \code{groups}, rather,
#' what is provided will assume the specified ordering at the top of the table
#' and the remaining row groups will follow in their original ordering.
#' @inheritParams cols_align
#' @param groups a vector of row group names, or, a numeric vector of indices
#'   corresponding to the new ordering. Either vector must correspond to
#'   assigned group names or the index positions. Also, either type of vector is
#'   not required to have all of the row group names or available index
#'   positions within it; any omitted values will be added to the end while
#'   preserving the original ordering.
#' @return an object of class \code{gt_tbl}.
#' @examples
#' # Use `exibble` to create a gt table
#' # with a stub and with row groups;
#' # modify the order of the row groups
#' # with `row_group_order()`, specifying
#' # the new ordering in `groups`
#' tab_1 <-
#'   exibble %>%
#'   dplyr::select(char, currency, row, group) %>%
#'     gt(
#'       rowname_col = "row",
#'       groupname_col = "group"
#'     ) %>%
#'     row_group_order(
#'       groups = c("grp_b", "grp_a")
#'     )
#'
#' @section Figures:
#' \if{html}{\figure{man_row_group_order_1.svg}{options: width=100\%}}
#'
#' @family row modification functions
#' @export
row_group_order <- function(data,
                            groups) {

  # Stop function if `groups` is not a `character` or
  #   `numeric` object
  if (!inherits(groups, c("character", "numeric"))) {

    stop("The values provided for `groups` must correspond to group names or index positions.",
         call. = FALSE)
  }

  # Get the current arrangement of `groups`
  arrange_groups <-
    attr(data, "arrange_groups", exact = TRUE) %>%
    unlist() %>%
    unname()

  if (inherits(groups, "character")) {

    # Stop function if any value in `groups` doesn't
    #   match a group name
    if (any(!groups %in% arrange_groups)) {

      stop("All values provided in `groups` must correspond to group indices.",
           call. = FALSE)
    }

    # Arrange groups in the new order
    groups <- c(unique(groups), base::setdiff(arrange_groups, unique(groups)))
  }

  if (inherits(groups, "numeric")) {

    # Stop function if any value in `groups` doesn't
    #   match a group name
    if (any(!groups %in% seq_along(arrange_groups))) {

      stop("All values provided in `groups` must correspond to group names.",
           call. = FALSE)
    }

    # Arrange groups in the new order using the indices
    group_indices <-
      c(unique(groups), base::setdiff(seq_along(arrange_groups), unique(groups)))

    groups <- arrange_groups[group_indices]
  }

  # Create and store a list of row groups in the intended ordering
  attr(data, "arrange_groups") <- list(groups = groups)

  data
}
