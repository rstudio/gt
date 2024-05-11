# The `fmt_number()` function works correctly in the HTML context

    Code
      tab %>% fmt_number(columns = num_3, decimals = 2)
    Condition
      Error in `column_classes_are_valid()`:
      ! Can't select columns that don't exist.
      x Column `num_3` doesn't exist.

---

    Code
      tab %>% fmt_number(columns = num_2, decimals = 2, locale = "aa_bb")
    Condition
      Error in `validate_locale()`:
      ! The supplied `locale` is not available in the list of supported locales.
      * Use `info_locales()` (`?gt::info_locales()`) to see which locales can be used.

# fmt_number() checks for n_sigfig input

    Code
      tab %>% fmt_number(columns = num, n_sigfig = c(1, 2))
    Condition
      Error in `fmt_number()`:
      ! `n_sigfig` must be a whole number, not a double vector.
    Code
      tab %>% fmt_number(columns = num, n_sigfig = TRUE)
    Condition
      Error in `fmt_number()`:
      ! `n_sigfig` must be a whole number, not `TRUE`.
    Code
      tab %>% fmt_number(tab, columns = num, n_sigfig = c(1, 2))
    Condition
      Error in `fmt_number()`:
      ! `n_sigfig` must be a whole number, not a double vector.
    Code
      tab %>% fmt_number(columns = num, n_sigfig = "3")
    Condition
      Error in `fmt_number()`:
      ! `n_sigfig` must be a whole number, not the string "3".
    Code
      tab %>% fmt_number(columns = num, n_sigfig = factor(3))
    Condition
      Error in `fmt_number()`:
      ! `n_sigfig` must be a whole number, not a <factor> object.
    Code
      tab %>% fmt_number(columns = num, n_sigfig = 0L)
    Condition
      Error in `fmt_number()`:
      ! `n_sigfig` must be a whole number larger than or equal to 1, not the number 0.
    Code
      tab %>% fmt_number(columns = num, n_sigfig = -1L)
    Condition
      Error in `fmt_number()`:
      ! `n_sigfig` must be a whole number larger than or equal to 1, not the number -1.
    Code
      tab %>% fmt_number(columns = num, n_sigfig = 1.5)
    Condition
      Error in `fmt_number()`:
      ! `n_sigfig` must be a whole number, not the number 1.5.

# The `fmt_number()` fn can render values in the Indian numbering system

    Code
      expected_tab <- tab %>% fmt_number(columns = num, suffixing = TRUE, scale_by = 200,
        system = "ind")
    Condition
      Warning:
      The value for `scale_by` cannot be changed if `suffixing` is anything other than `FALSE`.
      * The value provided to `scale_by` will be ignored.

