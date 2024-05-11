# The `fmt_integer()` function works correctly in the HTML context

    Code
      tab %>% fmt_integer(columns = num_3)
    Condition
      Error in `column_classes_are_valid()`:
      ! Can't select columns that don't exist.
      x Column `num_3` doesn't exist.

---

    Code
      tab %>% fmt_integer(columns = num_2, locale = "aa_bb")
    Condition
      Error in `validate_locale()`:
      ! The supplied `locale` is not available in the list of supported locales.
      * Use `info_locales()` (`?gt::info_locales()`) to see which locales can be used.

# The `fmt_integer()` fn can render in the Indian numbering system

    Code
      expected_tab <- tab %>% fmt_integer(columns = num, suffixing = TRUE, scale_by = 200,
        system = "ind")
    Condition
      Warning:
      The value for `scale_by` cannot be changed if `suffixing` is anything other than `FALSE`.
      * The value provided to `scale_by` will be ignored.

