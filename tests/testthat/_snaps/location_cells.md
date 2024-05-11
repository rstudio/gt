# The `cells_title()` function works correctly

    Code
      cells_title(groups = NULL)
    Condition
      Error in `cells_title()`:
      ! `groups` must be either "title", "subtitle", or both.

---

    Code
      cells_title(groups = 1:2)
    Condition
      Error in `cells_title()`:
      ! `groups` must be either "title", "subtitle", or both.

---

    Code
      cells_title(groups = vars(title))
    Condition
      Error in `cells_title()`:
      ! `groups` must be either "title", "subtitle", or both.

---

    Code
      cells_title(groups = "titles")
    Condition
      Error in `cells_title()`:
      ! `groups` must be either "title", "subtitle", or both.

---

    Code
      cells_title(groups = c("title", "stubtitle"))
    Condition
      Error in `cells_title()`:
      ! `groups` must be either "title", "subtitle", or both.

---

    Code
      cells_title(groups = c("title", "subtitle", "title"))
    Condition
      Error in `cells_title()`:
      ! `groups` must be either "title", "subtitle", or both.

---

    Code
      cells_title(groups = c("title", "subtitle", "subtitle"))
    Condition
      Error in `cells_title()`:
      ! `groups` must be either "title", "subtitle", or both.

---

    Code
      cells_title(groups = c("title", "title"))
    Condition
      Error in `cells_title()`:
      ! `groups` must be either "title", "subtitle", or both.

---

    Code
      cells_title(groups = c("subtitle", "subtitle"))
    Condition
      Error in `cells_title()`:
      ! `groups` must be either "title", "subtitle", or both.

---

    Code
      cells_title(groups = rep("title", 3))
    Condition
      Error in `cells_title()`:
      ! `groups` must be either "title", "subtitle", or both.

---

    Code
      cells_title(groups = "")
    Condition
      Error in `cells_title()`:
      ! `groups` must be either "title", "subtitle", or both.

---

    Code
      cells_title(groups = character(0))
    Condition
      Error in `cells_title()`:
      ! `groups` must be either "title", "subtitle", or both.

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

