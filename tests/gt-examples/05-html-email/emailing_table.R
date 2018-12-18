library(gt)
library(tidyverse)
library(blastula)

initial_months <-
  c("D",
    "J", "F", "M", "A", "M", "J",
    "J", "A", "S", "O", "N", "D",
    "J")

# Create HTML tables that are suitable for
# emailing; this requires `as_raw_html()` to
# generate inline CSS styles, which are essential
# (i.e., they won't be stripped away)
pizza_plot <-
  pizzaplace %>%
  mutate(type = str_to_title(type)) %>%
  mutate(date = as.Date(date)) %>%
  group_by(date, type) %>%
  summarize(Pizzas = n(), Income = sum(price)) %>%
  ungroup() %>%
  ggplot() +
  geom_point(aes(x = date, y = Income), color = "steelblue") +
  facet_wrap(~type) +
  scale_x_date(date_breaks = "1 month", date_labels = initial_months) +
  scale_y_continuous(labels = scales::comma) +
  labs(
    title = "pizzaplace: Daily Pizza Sales in 2015",
    subtitle = "Faceted by the type of pizza",
    x = NULL,
    y = "Number of Pizzas Sold") +
  theme_minimal() +
  theme(
    axis.text = element_text(color = "grey25"),
    axis.text.x = element_text(size = 6),
    axis.text.y = element_text(size = 8),
    strip.text.x = element_text(size = 9),
    axis.title = element_text(color = "grey25"),
    legend.title = element_text(color = "grey25"),
    legend.text = element_text(color = "grey25"),
    panel.grid.major = element_line(color = "grey75"),
    plot.title = element_text(color = "grey25"),
    plot.caption = element_text(color = "grey25"),
    plot.subtitle = element_text(color = "grey25"),
    plot.margin = unit(c(20, 20, 20, 20), "points"),
    legend.box.spacing = unit(2, "points"),
    legend.position = "bottom")

pizza_plot_email <-
  pizza_plot %>%
  blastula::add_ggplot()

size_levels <- c("S", "M", "L", "XL", "XXL")
type_levels <- c("Classic", "Chicken", "Supreme", "Veggie")

pizza_tab <-
  pizzaplace %>%
  mutate(type = str_to_title(type)) %>%
  mutate(size = factor(size, levels = size_levels)) %>%
  mutate(type = factor(type, levels = type_levels)) %>%
  group_by(type, size) %>%
  summarize(
    pies = n(),
    income = sum(price)
    ) %>%
  arrange(type, size) %>%
  gt(rowname_col = "size") %>%
  fmt_currency(
    columns = vars(income),
    currency = "USD") %>%
  fmt_number(
    columns = vars(pies),
    use_seps = TRUE,
    decimals = 0
    ) %>%
  summary_rows(
    groups = TRUE,
    columns = "pies",
    fns = list(TOTAL = "sum"),
    formatter = fmt_number,
    use_seps = TRUE,
    decimals = 0
    ) %>%
  summary_rows(
    groups = TRUE,
    columns = "income",
    fns = list(TOTAL = "sum"),
    formatter = fmt_currency,
    currency = "USD"
    ) %>%
  tab_options(
    summary_row.background.color = "#FFFEEE",
    stub_group.background.color = "#E6EFFC",
    table.font.size = "small",
    heading.title.font.size = "small",
    heading.subtitle.font.size = "smaller",
    stub_group.font.size = "small",
    column_labels.font.size = "small",
    row.padding = "5px"
    ) %>%
  cols_label(
    pies = "Pizzas",
    income = "Income"
    ) %>%
  tab_header(
    title = paste0("My ", emo::ji("pizza"), " sales in 2015"),
    subtitle = "Split by the type of pizza and the size"
    ) %>%
  tab_footnote(
    footnote = md("Only **The Greek** pizza comes in this size."),
    locations = cells_stub(rows = 4:5)
    ) %>%
  tab_footnote(
    footnote = "The small-sized classic pizzas sold the most.",
    locations = cells_data(columns = 1, rows = 1)
    ) %>%
  as_raw_html()


# Create an email message using the
# `compose_email()` function from the
# blastula package
email <-
  blastula::compose_email(
    body = "
  Hello,

  Just wanted to let you know that pizza \\
  sales were pretty strong in 2015. When \\
  I look back at the numbers, it's **$817,860** \\
  in sales. Not too bad. All things considered.

  Here's a plot of the daily pizza sales. I \\
  faceted by the type of pizza because I know \\
  that's your preference:

  {pizza_plot_email}

  Here is a table that shows a breakdown \\
  of the 2015 results by pizza size, split into \\
  *Pizza Type* groups:

  {pizza_tab}

  I also put all the 2015 numbers into an R \\
  dataset called `pizzaplace`. Not sure why \\
  I did that, but I did. It's in the `gt` \\
  package.

  Talk to you later,

  Alfonso
  "
)

# Preview the email in the RStudio Viewer
email %>% blastula::preview_email()

# Create a credentials file for sending
# this message through Gmail
blastula::create_email_creds_file(
  user = "********@gmail.com",
  password = "**************",
  provider = "gmail",
  sender = "Sender Name",
  creds_file_name = "gmail_creds")

# Send the email message out with
# `send_email_out()`
send_email_out(
  message = email,
  from = "******@gmail.com",
  to = "********@gmail.me",
  subject = "A look back at the pizzaplace 2015 sales",
  creds_file = "gmail_creds")
