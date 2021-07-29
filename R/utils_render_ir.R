
create_col_group_ir <- function(data) {

  # Get the table `_boxhead` object, filter the table to
  # only the visible columns, and then arrange such that
  # the `stub` (if present) is first in the column series
  boxh <-
    dt_boxhead_get(data = data) %>%
    dplyr::filter(type %in% c("default", "stub")) %>%
    dplyr::arrange(dplyr::desc(type))

  # Get defult column alignments and column widths (if any)
  # from the `boxh` table
  col_alignments <- boxh[["column_align"]]
  col_widths <- unlist(boxh[["column_width"]])

  # Generate a <colgroup> element containing <col>s for each column
  if (is.null(col_widths)) {

    # Case where column widths aren't expressed: each <col>
    # element contains the default alignment for each column

    colgroup_element <-
      htmltools::tags$colgroup(
        lapply(
          col_alignments,
          FUN = function(align) {
            htmltools::tags$col(
              align = align
            )
          }
        )
      )

  } else {

    # Case where column widths *are* expressed: each <col>
    # element contains the default alignment for each column
    # and the width as well

    colgroup_element <-
      htmltools::tags$colgroup(
        mapply(
          SIMPLIFY = FALSE,
          USE.NAMES = FALSE,
          col_alignments,
          col_widths,
          FUN = function(x, width) {
            htmltools::tags$col(
              align = x,
              width = width
            )
          }
        )
      )
  }

  htmltools::tagList(colgroup_element)
}
}
