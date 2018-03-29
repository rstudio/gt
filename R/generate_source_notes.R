#' Generate a HTML fragment for the source note part
#' @param source_note_tbl the table that contains
#' the source note data.
#' @param font_size the font size to use for the
#' source notes.
#' @param align the alignment of text to use for the
#' source notes.
#' @param padding the amount of padding to use for
#' the source notes.
#' @importFrom dplyr arrange mutate pull
#' @importFrom stringr str_squish
#' @importFrom glue glue
generate_source_notes <- function(source_note_tbl,
                                  span_amount,
                                  font_size = "115%",
                                  align = "center",
                                  padding = "3px") {

  source_note_tbl <-
    source_note_tbl %>% dplyr::arrange(index)


  content_str <-
    source_note_tbl %>%
    dplyr::mutate(
      content = glue::glue("{lead_in}{source_note}") %>%
        as.character() %>% stringr::str_squish()) %>%
    dplyr::pull(content)

  source_notes <-
    glue::glue(
      "<tr>\n    <td colspan=\"{span_amount}\">{content}</td>\n  </tr>\n",
      content = content_str) %>%
    as.character() %>%
    paste(collapse = "\n") %>%
    paste0("<tfoot>\n", ., "\n</tfoot>\n")

  source_notes
}
