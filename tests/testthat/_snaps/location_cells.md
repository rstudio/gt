# Styles are correctly applied to HTML output with location functions

    Code
      tbl %>% gt() %>% tab_footnote(footnote = "This is a footnote", locations = cells_body(
        1, 1)) %>% tab_footnote(footnote = "Illegal footnote", locations = cells_footnotes())
    Condition
      Error in `tab_footnote()`:
      ! Can't add footnote "Illegal footnote".
      Caused by error in `set_footnote()`:
      ! Footnotes cannot be applied to other footnotes.

---

    Code
      tbl %>% gt() %>% tab_source_note(source_note = "This is a source note") %>%
        tab_footnote(footnote = "Illegal footnote", locations = cells_source_notes())
    Condition
      Error in `tab_footnote()`:
      ! Can't add footnote "Illegal footnote".
      Caused by error in `set_footnote()`:
      ! Footnotes cannot be applied to source notes.

