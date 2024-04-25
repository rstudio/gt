# The `fmt_integer()` fn can render in the Indian numbering system

    Code
      expected_tab <- tab %>% fmt_integer(columns = num, suffixing = TRUE, scale_by = 200,
        system = "ind")
    Condition
      Warning:
      The value for `scale_by` cannot be changed if `suffixing` is anything other than `FALSE`.
      * The value provided to `scale_by` will be ignored.

