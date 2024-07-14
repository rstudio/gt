# multiple levels of `tab_spanner()` are not compatible with interactive tables [plain]

    Code
      local({
        tmp <- exibble[, 1:4] %>% gt() %>% tab_spanner(label = "spanner_numdat",
          columns = c(num, date)) %>% tab_spanner(label = "spanner_char", columns = c(
          char)) %>% tab_spanner(label = "spanner_numdatchar", columns = c(num, date,
          char)) %>% opt_interactive()
      })

