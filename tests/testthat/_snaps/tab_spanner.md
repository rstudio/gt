# A gt table contains the expected spanner column labels

    Code
      gt(rock) %>% tab_spanner(label = "perimeter", columns = c(peris, shapes))
    Condition
      Error in `tab_spanner()`:
      ! Can't select columns that don't exist.
      x Column `peris` doesn't exist.

---

    Code
      gt(exibble) %>% tab_spanner(label = "a", columns = num) %>% tab_spanner(label = "b",
        id = "a", columns = char)
    Condition
      Error in `check_spanner_id_unique()`:
      ! The spanner `id` provided ("a") is not unique.
      * The `id` must be unique across existing spanner and column IDs.
      * Provide a unique ID value for this spanner.

# multiple levels of `tab_spanner()` are not compatible with interactive tables [plain]

    Code
      local({
        tmp <- exibble[, 1:4] %>% gt() %>% tab_spanner(label = "spanner_numdat",
          columns = c(num, date)) %>% tab_spanner(label = "spanner_char", columns = c(
          char)) %>% tab_spanner(label = "spanner_numdatchar", columns = c(num, date,
          char)) %>% opt_interactive()
      })

