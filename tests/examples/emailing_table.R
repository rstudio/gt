library(gt)
library(blastula)
library(tidyverse)


# Create a ggplot plot
plot <-
  ggplot(
    data = mtcars,
    aes(x = disp, y = hp,
        color = wt, size = mpg)) +
  geom_point()

plot_html <-
  add_ggplot(
    plot,
    height = 5, width = 7)

html_tbl <-
  tab_create(tbl = mtcars) %>%  # 1
  theme_horizontal() %>%  # 2
  fmt_number(
    columns = c("mpg", "disp", "drat", "qsec"),
    decimals = 1
  ) %>%  # 3
  fmt_number(
    columns = "wt",
    decimals = 3
  ) %>%  # 4
  cols_align_left(types = "character") %>%  # 6
  tab_stub_block(
    "Mazdas" = rownames_with("Mazda"),
    "Mercs" = rownames_with("Merc"),
    "Hornets" = rownames_with("Hornet"),
    "Toyotas" = rownames_with("Toyota"),
    "Supercars" = c(
      "Ferrari Dino","Maserati Bora",
      "Porsche 914-2", "Ford Pantera L",
      "Camaro Z28")
  ) %>% # 7
  tab_stubhead_caption(caption = md("*car* model")) %>%  # 8
  tab_heading(
    title = md("Excerpt from the **mtcars** dataset"),
    headnote = md("[A rather famous *Motor Trend* table]")
  ) %>%  # 9
  tab_source_note(
    source_note = md("Main Source of Data: *Henderson and Velleman* (1981)."),
  ) %>%  # 10
  tab_source_note(
    source_note = md("Original Data: *Motor Trend Magazine* (1974)."),
  ) %>%  # 10
  tab_footnote(
    "Examples of poor gas mileage." =
      cells(row = c(22, 23), column = 2)
  ) %>%  # 11
  tab_footnote(
    "Really fast quarter mile" =
      c(18, 8)
  ) %>%  # 11
  tab_footnote(
    "Excellent gas mileage." =
      cells(row = 12, column = 2)
  ) %>%  # 11
  tab_footnote(
    "Worst speed ever." =
      cells(row = 4, column = 8)
  ) %>%  # 11
  tab_footnote(
    "Massive hp." =
      cells(row = 18, column = 5)
  ) %>% # 11
  cols_rename(
    "MPG" = "mpg",
    "C" = "cyl",
    "D" = "disp",
    "HP" = "hp",
    "DR" = "drat",
    "Wt." = "wt",
    "QMT" = "qsec",
    "VS" = "vs",
    "AM" = "am",
    "Gears" = "gear",
    "Cs" = "carb") # 12

email <-
  compose_email(
    body = "
  Hello,

  We can use Markdown formatting \\
  to **embolden** text or to add \\
  *emphasis*.

  Here is a plot:

  {plot_html}

  Here is a table:

  {html_tbl %>% get_html()}
  ")

preview_email(email = email)
