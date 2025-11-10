# multiple levels of `tab_spanner()` are not compatible with interactive tables [plain]

    Code
      local({
        tmp <- opt_interactive(tab_spanner(tab_spanner(tab_spanner(gt(exibble[, 1:4]),
        label = "spanner_numdat", columns = c(num, date)), label = "spanner_char",
        columns = c(char)), label = "spanner_numdatchar", columns = c(num, date, char)))
      })

