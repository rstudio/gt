# The `col_width_resolver_rtf()` function works correctly

    Code
      col_width_resolver_rtf(page_body_width = page_body_width_portrait, table_width = "-1tw",
        col_widths = "1tw", n_cols = 1)
    Condition
      Error in `parse_length_str()`:
      ! Negative values supplied to widths cannot be used.

---

    Code
      col_width_resolver_rtf(page_body_width = page_body_width_portrait, table_width = "1tw",
        col_widths = "-1tw", n_cols = 1)
    Condition
      Error in `parse_length_str()`:
      ! Negative values supplied to widths cannot be used.

# The `parse_length_str()` function works correctly

    Code
      parse_length_str(lengths_vec = "-6px", allow_negative = FALSE)
    Condition
      Error in `parse_length_str()`:
      ! Negative values supplied to widths cannot be used.

---

    Code
      parse_length_str(lengths_vec = NA_character_, allow_negative = TRUE)
    Condition
      Error in `parse_length_str()`:
      ! Some of the values supplied cannot be interpreted.
      * Problem values are: "NA".
      * Use either of: `px`, `pt`, `in`, `cm`, `mm`, or `tw` (e.g., "12px")

