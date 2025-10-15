# tab_footnote() errors if `locations = cells_source_notes()`

    Code
      tab_footnote(tab_source_note(gt(mtcars_short), source_note = "This is a source note"),
      footnote = "Illegal footnote", locations = cells_source_notes())
    Condition
      Error in `tab_footnote()`:
      ! Can't add footnote "Illegal footnote".
      Caused by error in `cells_source_notes()`:
      ! Footnotes cannot be applied to source notes.

# tab_footnote() errors if `locations = cells_footnotes()`

    Code
      tab_footnote(tab_source_note(gt(mtcars_short), source_note = "This is a source note"),
      footnote = "Illegal footnote", locations = cells_footnotes())
    Condition
      Error in `tab_footnote()`:
      ! Can't add footnote "Illegal footnote".
      Caused by error in `cells_footnotes()`:
      ! Footnotes cannot be applied to other footnotes.

