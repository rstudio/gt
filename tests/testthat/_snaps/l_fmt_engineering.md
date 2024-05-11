# The `fmt_engineering()` function works correctly in the LaTeX context

    Code
      tab %>% fmt_engineering(columns = "num_3", decimals = 2)
    Condition
      Error in `column_classes_are_valid()`:
      ! Can't select columns that don't exist.
      x Column `num_3` doesn't exist.

---

    Code
      tab %>% fmt_engineering(columns = "num", decimals = 2, locale = "aa_bb")
    Condition
      Error in `validate_locale()`:
      ! The supplied `locale` is not available in the list of supported locales.
      * Use `info_locales()` (`?gt::info_locales()`) to see which locales can be used.

