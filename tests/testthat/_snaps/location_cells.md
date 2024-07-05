# tab_footnote() errors if `locations = cells_source_notes()`

    Code
      gt(mtcars_short) %>% tab_source_note(source_note = "This is a source note") %>%
        tab_footnote(footnote = "Illegal footnote", locations = cells_source_notes())
    Condition
      Error in `tab_footnote()`:
      ! Can't add footnote "Illegal footnote".
      Caused by error in `cells_source_notes()`:
      ! Footnotes cannot be applied to source notes.

# tab_footnote() errors if `locations = cells_footnotes()`

    Code
      gt(mtcars_short) %>% tab_source_note(source_note = "This is a source note") %>%
        tab_footnote(footnote = "Illegal footnote", locations = cells_footnotes())
    Condition
      Error in `tab_footnote()`:
      ! Can't add footnote "Illegal footnote".
      Caused by error in `cells_footnotes()`:
      ! Footnotes cannot be applied to other footnotes.

