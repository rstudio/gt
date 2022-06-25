library(knitr)

run_it <- function() {
  knitr::knit("dplyr.qmd", "dplyr.md")
}

Rprof(interval = 0.01)
run_it()
Rprof(NULL)
