library(gt)

# Create a display table based on `iris`
iris_tbl <-
  gt(iris) |>
  tab_spanner_delim(delim = ".") |>
  cols_move_to_start(columns = Species) |>
  fmt_number(
    columns = c(Sepal.Length, Sepal.Width, Petal.Length, Petal.Width),
    decimals = 1
  ) |>
  tab_header(
    title = md("The **iris** dataset"),
    subtitle = md("[All about *Iris setosa*, *versicolor*, and *virginica*]")
  ) |>
  tab_source_note(
    source_note = md("The data were collected by *Anderson* (1935).")
  )

iris_tbl
