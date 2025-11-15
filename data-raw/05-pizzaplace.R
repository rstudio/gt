library(tidyverse)
library(progress)

# Define the pizza names, types, available sizes, and prices for each;
# For each pizza, there a probabilities for ordering each size;
# The `popularity` is a 1:5 scale of overall preference for ordering the pizza
pizzas <-
  dplyr::tribble(
    ~name,          ~type,       ~size,       ~price, ~size_p, ~popularity,
    "bbq_ckn",      "chicken",   "S",         12.75,  0.200,   5L,
    "bbq_ckn",      "chicken",   "M",         16.75,  0.400,   5L,
    "bbq_ckn",      "chicken",   "L",         20.75,  0.400,   5L,
    "big_meat",     "classic",   "S",         12.00,  1.000,   4L,
    "brie_carre",   "supreme",   "S",         23.65,  1.000,   1L,
    "calabrese",    "supreme",   "S",         12.25,  0.100,   2L,
    "calabrese",    "supreme",   "M",         16.25,  0.600,   2L,
    "calabrese",    "supreme",   "L",         20.25,  0.300,   2L,
    "cali_ckn",     "chicken",   "S",         12.75,  0.200,   5L,
    "cali_ckn",     "chicken",   "M",         16.75,  0.400,   5L,
    "cali_ckn",     "chicken",   "L",         20.75,  0.400,   5L,
    "ckn_alfredo",  "chicken",   "S",         12.75,  0.100,   2L,
    "ckn_alfredo",  "chicken",   "M",         16.75,  0.700,   2L,
    "ckn_alfredo",  "chicken",   "L",         20.75,  0.200,   2L,
    "ckn_pesto",    "chicken",   "S",         12.75,  0.300,   2L,
    "ckn_pesto",    "chicken",   "M",         16.75,  0.300,   2L,
    "ckn_pesto",    "chicken",   "L",         20.75,  0.400,   2L,
    "classic_dlx",  "classic",   "S",         12.00,  0.300,   5L,
    "classic_dlx",  "classic",   "M",         16.00,  0.500,   5L,
    "classic_dlx",  "classic",   "L",         20.50,  0.200,   5L,
    "five_cheese",  "veggie",    "L",         18.50,  1.000,   3L,
    "four_cheese",  "veggie",    "M",         14.75,  0.300,   4L,
    "four_cheese",  "veggie",    "L",         17.95,  0.700,   4L,
    "green_garden", "veggie",    "S",         12.00,  0.600,   2L,
    "green_garden", "veggie",    "M",         16.00,  0.300,   2L,
    "green_garden", "veggie",    "L",         20.25,  0.100,   2L,
    "hawaiian",     "classic",   "S",         10.50,  0.400,   5L,
    "hawaiian",     "classic",   "M",         13.25,  0.200,   5L,
    "hawaiian",     "classic",   "L",         16.50,  0.400,   5L,
    "ital_cpcllo",  "classic",   "S",         12.00,  0.200,   3L,
    "ital_cpcllo",  "classic",   "M",         16.00,  0.300,   3L,
    "ital_cpcllo",  "classic",   "L",         20.50,  0.500,   3L,
    "ital_supr",    "supreme",   "S",         12.50,  0.100,   4L,
    "ital_supr",    "supreme",   "M",         16.50,  0.500,   4L,
    "ital_supr",    "supreme",   "L",         20.75,  0.400,   4L,
    "ital_veggie",  "veggie",    "S",         12.75,  0.300,   2L,
    "ital_veggie",  "veggie",    "M",         16.75,  0.500,   2L,
    "ital_veggie",  "veggie",    "L",         21.00,  0.200,   2L,
    "mediterraneo", "veggie",    "S",         12.00,  0.300,   2L,
    "mediterraneo", "veggie",    "M",         16.00,  0.300,   2L,
    "mediterraneo", "veggie",    "L",         20.25,  0.400,   2L,
    "mexicana",     "veggie",    "S",         12.00,  0.100,   3L,
    "mexicana",     "veggie",    "M",         16.00,  0.300,   3L,
    "mexicana",     "veggie",    "L",         20.25,  0.600,   3L,
    "napolitana",   "classic",   "S",         12.00,  0.300,   3L,
    "napolitana",   "classic",   "M",         16.00,  0.300,   3L,
    "napolitana",   "classic",   "L",         20.50,  0.400,   3L,
    "pep_msh_pep",  "classic",   "S",         11.00,  0.400,   3L,
    "pep_msh_pep",  "classic",   "M",         14.50,  0.300,   3L,
    "pep_msh_pep",  "classic",   "L",         17.50,  0.300,   3L,
    "pepperoni",    "classic",   "S",         9.75,   0.300,   5L,
    "pepperoni",    "classic",   "M",         12.50,  0.400,   5L,
    "pepperoni",    "classic",   "L",         15.25,  0.300,   5L,
    "peppr_salami", "supreme",   "S",         12.50,  0.200,   3L,
    "peppr_salami", "supreme",   "M",         16.50,  0.300,   3L,
    "peppr_salami", "supreme",   "L",         20.75,  0.500,   3L,
    "prsc_argla",   "supreme",   "S",         12.50,  0.300,   3L,
    "prsc_argla",   "supreme",   "M",         16.50,  0.400,   3L,
    "prsc_argla",   "supreme",   "L",         20.75,  0.300,   3L,
    "sicilian",     "supreme",   "S",         12.25,  0.400,   4L,
    "sicilian",     "supreme",   "M",         16.25,  0.300,   4L,
    "sicilian",     "supreme",   "L",         20.25,  0.300,   4L,
    "soppressata",  "supreme",   "S",         12.50,  0.300,   2L,
    "soppressata",  "supreme",   "M",         16.50,  0.300,   2L,
    "soppressata",  "supreme",   "L",         20.75,  0.400,   2L,
    "southw_ckn",   "chicken",   "S",         12.75,  0.200,   4L,
    "southw_ckn",   "chicken",   "M",         16.75,  0.300,   4L,
    "southw_ckn",   "chicken",   "L",         20.75,  0.500,   4L,
    "spicy_ital",   "supreme",   "S",         12.50,  0.200,   4L,
    "spicy_ital",   "supreme",   "M",         16.50,  0.200,   4L,
    "spicy_ital",   "supreme",   "L",         20.75,  0.600,   4L,
    "spin_pesto",   "veggie",    "S",         12.50,  0.400,   2L,
    "spin_pesto",   "veggie",    "M",         16.50,  0.300,   2L,
    "spin_pesto",   "veggie",    "L",         20.75,  0.300,   2L,
    "spinach_fet",  "veggie",    "S",         12.00,  0.300,   3L,
    "spinach_fet",  "veggie",    "M",         16.00,  0.400,   3L,
    "spinach_fet",  "veggie",    "L",         20.25,  0.300,   3L,
    "spinach_supr", "supreme",   "S",         12.50,  0.400,   2L,
    "spinach_supr", "supreme",   "M",         16.50,  0.300,   2L,
    "spinach_supr", "supreme",   "L",         20.75,  0.300,   2L,
    "thai_ckn",     "chicken",   "S",         12.75,  0.200,   5L,
    "thai_ckn",     "chicken",   "M",         16.75,  0.200,   5L,
    "thai_ckn",     "chicken",   "L",         20.75,  0.600,   5L,
    "the_greek",    "classic",   "S",         12.00,  0.200,   3L,
    "the_greek",    "classic",   "M",         16.00,  0.200,   3L,
    "the_greek",    "classic",   "L",         20.50,  0.200,   3L,
    "the_greek",    "classic",   "XL",        25.50,  0.380,   3L,
    "the_greek",    "classic",   "XXL",       35.95,  0.020,   3L,
    "veggie_veg",   "veggie",    "S",         12.00,  0.300,   3L,
    "veggie_veg",   "veggie",    "M",         16.00,  0.400,   3L,
    "veggie_veg",   "veggie",    "L",         20.25,  0.300,   3L
  )

# Exceptional days with rate multipliers
exceptional_tbl <-
  dplyr::tribble(
    ~date,        ~l_idx, ~d_idx, ~r_idx,
    "2015-01-01", 1.1,    1.3,    1.3, # New Year's day
    "2015-01-15", 1.2,    1.2,    1.1, # mid-month
    "2015-02-01", 1.5,    2.1,    1.2, # Super Bowl XLIX
    "2015-02-14", 0.9,    1.2,    1.0, # Valentine's Day
    "2015-02-15", 1.2,    1.2,    1.1, # mid-month
    "2015-03-17", 0.8,    1.8,    1.3, # St. Patricks's Day
    "2015-04-01", 1.0,    1.2,    1.2, # first day of month
    "2015-05-15", 1.2,    1.3,    1.1, # mid-month
    "2015-06-01", 1.0,    1.3,    1.0, # first day of month
    "2015-06-15", 1.0,    1.4,    1.0, # mid-month
    "2015-07-01", 1.1,    1.3,    1.2, # first day of month
    "2015-07-03", 1.1,    1.5,    1.1, # Independence Day (observed)
    "2015-07-04", 1.2,    2.0,    1.4, # Independence Day
    "2015-07-15", 1.0,    1.4,    1.0, # mid-month
    "2015-08-01", 1.1,    1.3,    1.1, # first day of month
    "2015-08-15", 1.1,    1.3,    1.3, # mid-month
    "2015-09-01", 1.1,    1.2,    1.1, # first day of month
    "2015-09-15", 1.1,    1.2,    1.3, # mid-month
    "2015-09-16", 1.1,    1.1,    1.2, # mid-month
    "2015-10-01", 1.3,    1.4,    1.3, # first day of month
    "2015-10-15", 1.4,    1.3,    1.3, # mid-month
    "2015-10-31", 1.0,    1.2,    1.0, # Halloween
    "2015-11-26", 1.6,    2.5,    1.5, # Thanksgiving
    "2015-11-27", 1.2,    2.2,    1.4, # Black Friday
    "2015-12-01", 1.2,    1.2,    1.4, # first day of month
    "2015-10-15", 1.4,    1.5,    1.2, # mid-month
    "2015-12-24", 0.7,    1.2,    0.7, # Christmas Eve
    "2015-12-26", 0.5,    0.7,    0.5, # Day after Christmas
    "2015-12-27", 0.6,    0.7,    0.6, # Christmas Break
    "2015-12-28", 0.7,    0.7,    0.5, # Christmas Break
    "2015-12-29", 0.4,    0.5,    0.4, # Christmas Break
    "2015-12-30", 0.5,    0.5,    0.5, # Christmas Break
    "2015-12-31", 0.6,    2.0,    0.7, # New Year's Eve
  )

# Days where the pizzaplace was fully closed (i.e., no sales)
full_closures <-
  as.Date(
    c(
      "2015-09-24", "2015-09-25", # electrical fire causing equipment malfunctions! 2-day closure.
      "2015-10-05", # --- trying out closing on Mondays for October (could use the break, :\)
      "2015-10-12", # -|
      "2015-10-19", # -|
      "2015-10-26", # -|
      "2015-12-25"  # closed on Christmas Day
    )
  )

# Function to make changes to days based on exceptional circumstances
apply_exceptional_days <- function(orders_year_df, exceptional_df) {

  for (i in seq_len(nrow(exceptional_df))) {

    day_changes <-
      as.list(exceptional_df[i, ])

    orders_year_df <-
      orders_year_df |>
      dplyr::mutate(n = ifelse(
        date == day_changes$date &
          order_type == "daily_lunch_orders",
        floor(n * day_changes$l_idx),
        n),
        n = ifelse(
        date == day_changes$date &
          order_type == "daily_dinner_orders",
        floor(n * day_changes$d_idx),
        n),
        n = ifelse(
        date == day_changes$date &
          order_type == "daily_random_orders",
        floor(n * day_changes$r_idx),
        n)
      )
  }

  orders_year_df
}

# Function to randomly choose `n` pizzas and a
# size for a given date and time
randomly_choose_pizzas <- function(
    date,
    time,
    n = 1
) {

  pizza_list <-
    pizzas |>
    dplyr::arrange(type) |>
    dplyr::select(name, popularity) |>
    dplyr::distinct()

  seq(n) |>
    purrr::map_df(.f = function(x) {

      pizza_gotten <-
        sample(
          pizza_list$name,
          size = 1,
          prob = pizza_list$popularity
        )

      size_list <-
        pizzas |>
        dplyr::filter(name == pizza_gotten) |>
        dplyr::select(size, size_p)

      size_gotten <-
        sample(
          size_list$size,
          size = 1,
          prob = size_list$size_p
        )

      tibble(
        date = date,
        time = time,
        name = pizza_gotten,
        size = size_gotten
      )
    })
}

# Function to determine how many extra pizzas are part of the
# same order depending on `when`
extra_pizzas <- function(when = "lunch") {

  if (when == "lunch" || when == "whenever") {
    prob <- c(0.6, 0.2, 0.1, 0.1)
  } else if (when == "dinner") {
    prob <- c(0.2, 0.4, 0.2, 0.2)
  }

  sample(0:3, size = 1, prob = prob)
}

# Function to convert fractional 24-h time to proper
# 24-h time strings
convert_time <- function(frac_time) {

  hours <- floor(frac_time)
  min_frac <- (frac_time %% 1) * 60
  minutes <- floor(min_frac)
  sec_frac <- (min_frac %% 1) * 60
  seconds <- floor(sec_frac)

  hours <- ifelse(hours < 10, paste0("0", hours), as.character(hours))
  minutes <- ifelse(minutes < 10, paste0("0", minutes), as.character(minutes))
  seconds <- ifelse(seconds < 10, paste0("0", round(seconds, 0)), as.character(round(seconds, 0)))

  paste(hours, minutes, seconds, sep = ":")
}

next_random_factory <- function(closing_time, mean, sd) {

  function() {
    while (TRUE) {
      ret <- rnorm(1, mean = mean, sd = sd)
      if (ret < closing_time) {
        return(ret)
      }
    }
  }
}

# Function to generate a tibble of `n` pizza orders for the dinner period
dinner_orders <- function(
    date,
    busy_night = TRUE,
    n
) {

  if (busy_night) {
    next_random <- next_random_factory(23.1, 19, 2.5)
  } else {
    next_random <- next_random_factory(23.1, 18, 2)
  }

  seq(n) |>
    purrr::map_df(.f = function(x) {

      time <-
        next_random() |>
        convert_time()

      p_count <- 1 + extra_pizzas(when = "dinner")

      randomly_choose_pizzas(
        date = date,
        time = time,
        n = p_count
      )
    })
}

# Function to generate a tibble of `n` pizza orders for the lunchtime period
lunch_orders <- function(
    date,
    busy_day = TRUE,
    n
) {

  if (busy_day) {
    hours <- rnorm(100, mean = 12.5, sd = 1)
    hours <- hours[hours > 11.25]
  } else {
    hours <- rnorm(100, mean = 12.5, sd = 1.5)
    hours <- hours[hours > 11.5]
  }

  seq(n) |>
    purrr::map_df(.f = function(x) {

      time <-
        sample(hours, 1) |>
        convert_time()

      p_count <- 1 + extra_pizzas(when = "lunch")

      randomly_choose_pizzas(
        date = date,
        time = time,
        n = p_count
      )
    })
}

# Function to generate a tibble of `n` pizza orders randomly
# throughout the day
daily_random_orders <- function(date, n) {

  seq(n) |>
    purrr::map_df(.f = function(x) {

      time <-
        runif(1, min = 13, max = 22.5) |>
        convert_time()

      p_count <- 1 + extra_pizzas(when = "whenever")

      randomly_choose_pizzas(
        date = date,
        time = time,
        n = p_count
      )
    })
}

# Function to generate a tibble of `n` pizza orders for
# group functions (these are intermittant, large orders)
group_orders <- function(date, n) {

  hours <- rnorm(100, mean = 13.0, sd = 1.0)
  hours <- hours[hours > 11.75]

  seq(n) |>
    purrr::map_df(.f = function(x) {

      time <-
        sample(hours, 1) |>
        convert_time()

      p_count <- sample(5:15, 1)

      randomly_choose_pizzas(
        date = date,
        time = time,
        n = p_count
      )
    })
}

# Function to get a tibble of pizza orders for a given date,
# based on daily numbers for each period and whether the periods
# are considered busy or not
orders_for_day <- function(
    date,
    n_dinner,
    n_lunch,
    n_group,
    n_random,
    busy_day,
    busy_night
) {

  dplyr::bind_rows(
    dinner_orders(
      date = date,
      busy_night = busy_night,
      n = n_dinner
    ),
    lunch_orders(
      date = date,
      busy_day = busy_day,
      n = n_lunch
    ),
    group_orders(
      date = date,
      n = n_group
    ),
    daily_random_orders(
      date = date,
      n = n_random
    )
  )
}

# Function to get a tibble of pizza orders for the entire year;
# this uses the `orders_year_df` to provide data for repeated calls
# of `orders_for_day()`
orders_for_year <- function(orders_year_df) {

  dates <- unique(orders_year_df$date)

  orders_year_df <-
    orders_year_df |>
    dplyr::arrange(date, order_type)

  pr <- progress::progress_bar$new(
    format = "[:bar] :percent eta::eta :spin",
    total = length(dates)
  )

  dates |>
    purrr::map_df(.f = function(x) {
      pr$tick()

      filtered_df <-
        orders_year_df |>
        dplyr::filter(date == x)

      busy_day <-
        filtered_df |>
        dplyr::pull(busy_day) |>
        unique()

      busy_night <-
        filtered_df |>
        dplyr::pull(busy_night) |>
        unique()

      n_counts <-
        filtered_df |>
        dplyr::pull(n)

      orders_for_day(
        date = x,
        n_dinner = n_counts[1],
        n_lunch = n_counts[2],
        n_random = n_counts[3],
        n_group = n_counts[4],
        busy_day = busy_day,
        busy_night = busy_night
      ) |>
        dplyr::arrange(time)
    })
}

# Set a seed
set.seed(23)

# Set a time origin
origin <- as.Date(paste0(2015, "-01-01"), tz = "UTC") - lubridate::days(1)

# Create a table with order numbers for the entire 2015 year
orders_year <-
  dplyr::tibble(date = as.Date(1:365, origin = origin, tz = "UTC")) |>
  dplyr::mutate(
    dow = wday(date, label = TRUE),
    busy_day = ifelse(!(dow %in% c("Sat", "Sun")), TRUE, FALSE),
    busy_night = ifelse(dow %in% c("Fri", "Sat"), TRUE, FALSE),
    grp_ord_n =
      sample(c(0, 1, 2), n(), prob = c(0.8, 0.3, 0.1), replace = TRUE),
    daily_lunch_orders =
      ifelse(
        busy_day,
        sample(floor(rnorm(100, mean = 20, sd = 3)), n(), replace = TRUE),
        sample(floor(rnorm(100, mean = 10, sd = 2)), n(), replace = TRUE)
      ),
    daily_dinner_orders =
      ifelse(
        busy_night,
        sample(floor(rnorm(100, mean = 35, sd = 3)), n(), replace = TRUE),
        sample(floor(rnorm(100, mean = 25, sd = 2)), n(), replace = TRUE)
      ),
    daily_random_orders =
      sample(floor(rnorm(100, mean = 15, sd = 4)), n(), replace = TRUE)
  ) |>
  tidyr::pivot_longer(
    cols = grp_ord_n:daily_random_orders,
    names_to = "order_type",
    values_to = "n"
  ) |>
  dplyr::arrange(date, order_type) |>
  dplyr::filter(!(date %in% full_closures)) |>
  apply_exceptional_days(exceptional_df = exceptional_tbl)

# Get a tibble of orders for the entire 2015 year
pizzaplace <- orders_for_year(orders_year_df = orders_year)

# Join in the `type` and `price` data
pizzaplace <-
  dplyr::inner_join(
    pizzaplace,
    pizzas |> dplyr::select(name, size, type, price),
    by = c("name", "size")
  )

# Add in an `id` field (`YYYY-XXXXXX`)
pizzaplace <-
  pizzaplace |>
  group_by(date, time) |>
  tidyr::nest() |>
  mutate(id = seq_len(n())) |>
  tidyr::unnest() |>
  select(id, date, time, everything()) |>
  mutate(id = paste0(
    substr(date, 1, 4), "-",
    formatC(id, width = 6, format = "d", flag = "0"))
  )

# Convert `date` back to character
pizzaplace <- dplyr::mutate(pizzaplace, date = as.character(date))
