#' Modify the ordering of the stub block groups
#' @inheritParams cols_align
#' @param groups a vector of group names, or, a numeric
#'   vector of indices corresponding to the new ordering. Either vector must
#'   correspond to assigned group names or the index positions. Also, either
#'   vector isn't required to have all group names or index positions within it;
#'   any omitted values will be added to the end while preserving the original
#'   ordering.
#' @return an object of class \code{gt_tbl}.
#' @family row modification functions
#' @export
blocks_arrange <- function(data,
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

  # Create and store a list of stub block
  #   groups in the intended ordering
  attr(data, "arrange_groups") <- list(groups = groups)

  data
}
