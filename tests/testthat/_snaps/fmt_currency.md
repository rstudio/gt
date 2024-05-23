# The `fmt_currency()` function works correctly

    Code
      tab %>% fmt_currency(columns = "num_3", currency = "USD")
    Condition
      Error in `fmt_currency()`:
      ! Can't select columns that don't exist.
      x Column `num_3` doesn't exist.

---

    Code
      tab %>% fmt_currency(columns = "num_2", decimals = 2, locale = "aa_bb")
    Condition
      Error in `validate_locale()`:
      ! The supplied `locale` is not available in the list of supported locales.
      * Use `info_locales()` (`?gt::info_locales()`) to see which locales can be used.

# The `currency()` helper function works correctly

    Code
      currency()
    Condition
      Error in `currency()`:
      ! The `currency()` function must be provided with currency symbols.

---

    Code
      currency(html = "&#8383;", none = "BTC")
    Condition
      Error in `validate_contexts()`:
      ! All output contexts must be in the set of supported contexts.
      * Supported: html, latex, rtf, word, and default
      * Invalid: none

---

    Code
      currency("&#8383;", "BTC")
    Condition
      Error in `currency()`:
      ! Names must be provided for all output contexts.

---

    Code
      currency(html = "&#8383;", "BTC")
    Condition
      Error in `currency()`:
      ! Names must be provided for all output contexts.

---

    Code
      currency(html = "&#8383;", default = "BTC", default = "BT")
    Condition
      Error in `currency()`:
      ! There cannot be any duplicate names for output contexts.

# The `fmt_currency()` fn can render in the Indian numbering system

    Code
      expected_tab <- tab %>% fmt_currency(columns = num, suffixing = TRUE, scale_by = 200,
        system = "ind")
    Condition
      Warning:
      The value for `scale_by` cannot be changed if `suffixing` is anything other than `FALSE`.
      * The value provided to `scale_by` will be ignored.

