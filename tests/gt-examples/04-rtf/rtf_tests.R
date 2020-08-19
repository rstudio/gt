library(gt)

# Create a display table based on `iris`
iris_tbl <-
  gt(data = iris) %>%
  tab_spanner_delim(delim = ".") %>%
  cols_move_to_start(columns = vars(Species)) %>%
  fmt_number(
    columns = vars(Sepal.Length, Sepal.Width, Petal.Length, Petal.Width),
    decimals = 1
  ) %>%
  tab_header(
    title = md("The **iris** dataset"),
    subtitle = md("[All about *Iris setosa*, *versicolor*, and *virginica*]")
  ) %>%
  tab_source_note(
    source_note = md("The data were collected by *Anderson* (1935).")
  )

iris_tbl %>% gtsave("tests/gt-examples/rtf_output/iris.rtf")

# Create a display table based on `morley`
morley_tbl <-
  gt(data = morley) %>%
  fmt_number(
    columns = vars(Speed),
    decimals = 0,
    sep_mark = ",") %>%
  cols_align(align = "left", columns = vars(Run, Speed))

morley_tbl %>% gtsave("tests/gt-examples/rtf_output/morley.rtf")

# Create a display table based on `pressure`
pressure_tbl <-
  gt(data = pressure) %>%
  fmt_scientific(
    columns = vars(pressure),
    decimals = 2
  ) # Fix the scientific notation superscripts for RTF

pressure_tbl %>% gtsave("tests/gt-examples/rtf_output/pressure.rtf")

# Create a display table based on `sleep`
sleep_tbl <-
  gt(data = sleep) %>%
  fmt_scientific(columns = vars(extra)) %>%
  tab_footnote(
    footnote = "This is a footnote",
    locations = cells_body(columns = 1, rows = c(2, 3, 4))
  ) # Fix the scientific notation superscripts for RTF

sleep_tbl %>% gtsave("tests/gt-examples/rtf_output/sleep.rtf")

# Create a display table based on `airquality`
airquality_tbl <-
  gt(data = airquality) %>%
  cols_move_to_start(columns = vars(Month, Day)) %>%
  cols_label(Solar.R = html("Solar<br>Radiation")) %>% # Need to substitute <br> for RTF newline
  fmt_number(
    columns = vars(Wind),
    decimals = 2
  ) %>%
  tab_spanner(
    label = "Measurement Period",
    columns = vars(Month, Day)
  ) %>%
  fmt_missing(columns = vars(Ozone, Solar.R, Wind, Temp)) # Need to use an em dash for missing values

airquality_tbl %>% gtsave("tests/gt-examples/rtf_output/airquality.rtf")

sp500_tbl <-
  readr::read_csv(
    system.file("extdata", "sp500.csv", package = "gt"),
    col_types = "cddddd"
  ) %>%
  gt() %>%
  fmt_date(
    columns = vars(Date),
    date_style = 6
  ) %>%
  fmt_currency(
    columns = vars(High, Open, Low, Close),
    currency = "USD",
    scale_by = 1/1000,
    pattern = "{x}K"
  ) %>%
  fmt_number(
    columns = vars(Volume),
    decimals = 3,
    scale_by = 1E-9,
    pattern = "{x}B"
  )

sp500_tbl %>% gtsave("tests/gt-examples/rtf_output/sp500.rtf")



# Create a table that creates a stub and
# row groups based on magic column names

# Input table
tbl <-
  dplyr::tribble(
    ~groups,  ~rowname, ~value,  ~value_2,
    "A",      "1",      NA,      260.1,
    "A",      "2",      184.3,   84.4,
    "A",      "3",      342.3,   126.3,
    "A",      "4",      234.9,   NA,
    "B",      "1",      190.9,   832.5,
    "B",      "2",      743.3,   281.2,
    "B",      "3",      252.3,   732.5,
    "B",      "4",      344.7,   NA,
    "C",      "1",      197.2,   818.0,
    "C",      "2",      284.3,   394.4
  )

# Create a display table with summary rows
summary_tbl <-
  tbl %>%
  gt(groupname_col = "groups") %>%
  summary_rows(
    groups = c("A", "C"),
    columns = vars(value),
    fns = list(
      ~mean(., na.rm = TRUE),
      ~sum(., na.rm = TRUE),
      ~sd(., na.rm = TRUE)
    )
  ) %>%
  tab_footnote(
    footnote = "Note for Summary A.",
    locations = cells_summary(
      groups = "A", columns = 1, rows = 1)
  ) %>%
  tab_footnote(
    footnote = "Note for Summary C.",
    locations = cells_summary(
      groups = "C", columns = 1, rows = 1)
  ) %>%
  fmt_missing(columns = vars(value, value_2)) %>%
  tab_options(
    summary_row.background.color = "#FFFEEE",
    row_group.background.color = "lightblue"
  )

summary_tbl %>% gtsave("tests/gt-examples/rtf_output/summary.rtf")
