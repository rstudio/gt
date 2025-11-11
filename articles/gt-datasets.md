# gt Datasets

The **gt** package comes with six built-in datasets for experimenting
with the **gt** API: `countrypops`, `sza`, `gtcars`, `sp500`,
`pizzaplace`, and `exibble`. While each dataset has different subject
matter, all of them will be used to develop **gt** examples with
consistent syntax.

![](../reference/figures/countrypops.png)![](../reference/figures/sza.svg)![](../reference/figures/gtcars.svg)

![](../reference/figures/sp500.svg)![](../reference/figures/pizzaplace.svg)![](../reference/figures/exibble.svg)

Each dataset is stored as a tibble, ranging from very small (like
`exibble`, an example tibble of 8 rows) to quite large in size (e.g., at
nearly 50,000 rows: `pizzaplace`). Larger datasets are typically
impractical as **gt output tables** but they provide opportunities for
demonstrating preprocessing using tidyverse tools like **dplyr** and
**tidyr** (upstream of **gt**’s
[`gt()`](https://gt.rstudio.com/reference/gt.md) entry point).

In many **gt** workflows, there will often be prep work like this where
the creation of the input table and any salient information (e.g.,
metadata for footnotes) will be done alongside the preparation of the
display table.

In the next few examples, we’ll show how tables can be created with each
of these datasets. Each example will be preceded with a set of
requirements that serve as a design brief. This planning stage can be
very useful in your own work for the purpose of organization. The hope
is that this collection of simple examples will inspire the creation of
much more interesting display tables with **gt**.

### `countrypops`

This dataset provides the total populations of 215 countries on a yearly
basis, from 1960 to 2021. The source data comes from the [World
Bank](https://data.worldbank.org/indicator/SP.POP.TOTL), where it has
been cleaned and tidied up for inclusion into this package. Each row
contains a population value for a country in a given year, where `NA`
values for `population` indicate that the country did not exist in that
particular year.

The `countrypops` dataset is a tibble with 13,330 rows and 5 variables.
Here are explanations for each of the variables:

| Column         | Type | Description                                      |
|----------------|------|--------------------------------------------------|
| country_name   | chr  | Name of the country                              |
| country_code_2 | chr  | The 2-letter ISO 3166-1 country code             |
| country_code_3 | chr  | The 3-letter ISO 3166-1 country code             |
| year           | int  | The year for the population estimate             |
| population     | int  | The population estimate, midway through the year |

#### A `countrypops` Example

The table that we’ll create from `countrypops` will meet these
requirements:

1.  use countries from Oceania
2.  countries in different regions of Oceania will be grouped together
3.  provide populations for the 2000, 2010, and 2020 years only; they
    should appear as separate columns with a spanner group column
    stating that these columns refer to population values
4.  format population figures to contain commas
5.  provide a descriptive title

``` r
# Get vectors of 2-letter country codes for each region of Oceania
Australasia <- c("AU", "NZ")
Melanesia <- c("NC", "PG", "SB", "VU")
Micronesia <- c("FM", "GU", "KI", "MH", "MP", "NR", "PW")
Polynesia <- c("PF", "WS", "TO", "TV")

# Create a gt table based on a preprocessed `countrypops`
countrypops |>
  filter(country_code_2 %in% c(
    Australasia, Melanesia, Micronesia, Polynesia)
  ) |>
  filter(year %in% c(2000, 2010, 2020)) |>
  mutate(region = case_when(
    country_code_2 %in% Australasia ~ "Australasia",
    country_code_2 %in% Melanesia ~ "Melanesia",
    country_code_2 %in% Micronesia ~ "Micronesia",
    country_code_2 %in% Polynesia ~ "Polynesia",
  )) |>
  pivot_wider(names_from = year, values_from = population) |>
  arrange(region, desc(`2020`)) |>
  select(-starts_with("country_code")) |>
  gt(
    rowname_col = "country_name",
    groupname_col = "region"
  ) |>
  tab_header(title = "Populations of Oceania's Countries in 2000, 2010, and 2020") |>
  tab_spanner(
    label = "Total Population",
    columns = everything()
  ) |>
  fmt_integer()
```

[TABLE]

### `sza`

The solar zenith angle is one measure of the solar position. It can be
thought of as ‘height’ of the sun in relation to an observer. A solar
zenith angle of 0° indicates that the sun is directly overhead (a
different solar angle, the *solar altitude angle*, is 90° in this
instance). With the sun at the horizontal (e.g., during sunrise/sunset)
we observe the solar zenith angle to be around 90° (there is the matter
of atmospheric refraction). During nighttime, solar zenith angles in the
range of 90–180 are possible (again, depending on the location of the
observer).

The `sza` dataset has calculated values for the solar zenith angles
every 30 minutes from 04:00 to 12:00 (true solar time). Temporally,
these calculations are for the 1st of every month of the year.
Spatially, the observer is located at somewhere along latitudes 20°N,
30°N, 40°N, and 50°N (because we are using true solar time, the
longitude is unimportant). This is quite an extensive topic, and more
information can be found by using
[`?sza`](https://gt.rstudio.com/reference/sza.md) in the R console or by
visiting [this page](https://en.wikipedia.org/wiki/Solar_zenith_angle).

The `sza` dataset is a tibble with 816 rows and 4 variables. Here are
explanations for each of the variables:

| Column   | Type | Description                                                                                                        |
|----------|------|--------------------------------------------------------------------------------------------------------------------|
| latitude | dbl  | The latitude in decimal degrees for the observations                                                               |
| month    | fct  | The measurement month; all calculations where conducted for the first day of each month                            |
| tst      | chr  | The true solar time at the given latitude and date (first of month) for which the solar zenith angle is calculated |
| sza      | dbl  | The solar zenith angle in degrees, where NAs indicate that sunrise hadn't yet occurred by the tst value            |

#### An `sza` Example

The table that we’ll create from `sza` will meet these requirements:

1.  filter the data to just use the 20°N data and remove the `latitude`
    column
2.  `NA` values from `sza` column are to be removed
3.  reshape the table so that columns of `tst` (true solar time) contain
    angles in degrees (from the `sza` column)
4.  the **gt output table** will have the `month`s as row labels in the
    stub
5.  missing values will be replaced with an empty string (so that those
    cells are blank)
6.  a stubhead label will state what’s inside the stubs (months, at
    20°N)
7.  the table will have a heading decorated with the HTML *Black Sun
    with Rays* (`&#x2600;`) symbol
8.  to fit the large amount of data in a small area, use some table
    options to reduce text size and row padding

``` r
# Create a gt table based on a preprocessed `sza`
sza |>
  filter(latitude == 20) |>
  select(-latitude) |>
  filter(!is.na(sza)) |>
  pivot_wider(names_from = "tst", values_from = sza) |>
  gt(rowname_col = "month") |>
  sub_missing(missing_text = "") |>
  tab_stubhead(label = md("month<br>(20&deg;N)")) |>
  tab_header(title = md("&#x2600; Solar Zenith Angles &#x2600;")) |>
  tab_options(
    column_labels.font.size = "smaller",
    table.font.size = "smaller",
    data_row.padding = px(3)
  )
```

[TABLE]

### `gtcars`

The `gtcars` dataset takes off where `mtcars` left off. It contains 47
cars from the 2014-2017 model years. Many of the `gtcars` vehicles are
grand tourers. Indeed, many of these provide the ability to cross an
entire continent at speed and in comfort yet, when it’s called for, they
will allow you to experience driving thrills. The chassis and suspension
are in most cases top-notch and supply superb handling and roadholding
on all routes one would conceivably encounter during the grand touring
experience. The two plus two (2 + 2) seating configuration is smartly
designed to deliver comfort for a driver and passenger, adequate space
for luggage, and have room to spare.

The `gtcars` dataset is a tibble with 47 rows and 15 variables. Here are
explanations for each of the variables:

| Column       | Type | Description                                                                                                                                                                                                              |
|--------------|------|--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| mfr          | chr  | The name of the car manufacturer                                                                                                                                                                                         |
| model        | chr  | The car's model name                                                                                                                                                                                                     |
| year         | int  | The car's model year                                                                                                                                                                                                     |
| trim         | chr  | A short description of the car model's trim                                                                                                                                                                              |
| bdy_style    | chr  | An identifier of the car's body style, which is either coupe, convertible, sedan, or hatchback                                                                                                                           |
| hp, hp_rpm   | int  | The car's horsepower and the associated RPM level                                                                                                                                                                        |
| trq, trq_rpm | int  | The car's torque and the associated RPM level                                                                                                                                                                            |
| mpg_c, mpg_h | int  | The miles per gallon fuel efficiency rating for city and highway driving                                                                                                                                                 |
| drivetrain   | chr  | The car's drivetrain which, for this dataset is either rwd (Rear Wheel Drive) or awd (All Wheel Drive)                                                                                                                   |
| trsmn        | chr  | The codified transmission type, where the number part is the number of gears; the car could have automatic transmission (a), manual transmission (m), an option to switch between both types (am), or, direct drive (dd) |
| ctry_origin  | chr  | The country name for where the vehicle manufacturer is headquartered                                                                                                                                                     |

#### A `gtcars` Example

The table that we’ll create from `gtcars` will meet these requirements:

1.  only include German cars
2.  limit the dataset to the top two most expensive offerings from each
    German manufacturer
3.  the information included will be the manufacturer (`mfr`), the car
    model (`model`), the `drivetrain`, and the price (`msrp`)
4.  add a table title
5.  combine the car make and model into a single column
6.  capitalize the `drivetrain` text
7.  format the prices as USD currency with commas and no decimal places
    shown
8.  relabel the column headings to provide nicer labels
9.  add two footnotes to explain the `drivetrain` abbreviations and to
    specify the currency of the `msrp` prices; ensure that the footnote
    marks are lowercase letters

``` r
# Create a gt table based on a preprocessed `gtcars`
gtcars |>
  filter(ctry_origin == "Germany") |>
  slice_max(n = 2, msrp, by = mfr) |>
  select(mfr, model, drivetrain, msrp) |>
  gt() |>
  tab_header(title = "Select German Automobiles") |>
  cols_merge(columns = c(mfr, model)) |>
  text_transform(
    locations = cells_body(columns = drivetrain),
    fn = function(x) toupper(x)
  ) |>
  fmt_currency(decimals = 0) |>
  cols_label(
    mfr = "Car",
    drivetrain = "Drivetrain",
    msrp = "MSRP"
  ) |>
  tab_footnote(
    footnote = "Prices in USD.",
    locations = cells_column_labels(columns = msrp)
  ) |>
  tab_footnote(
    footnote = "AWD = All Wheel Drive, RWD = Rear Wheel Drive.",
    locations = cells_column_labels(columns = drivetrain)
  ) |>
  opt_footnote_marks(marks = "letters")
```

| Select German Automobiles                           |                |           |
|-----------------------------------------------------|----------------|-----------|
| Car                                                 | Drivetrain^(a) | MSRP^(b)  |
| BMW i8                                              | AWD            | \$140,700 |
| BMW M6                                              | RWD            | \$113,400 |
| Audi R8                                             | AWD            | \$115,900 |
| Audi S8                                             | AWD            | \$114,900 |
| Mercedes-Benz AMG GT                                | RWD            | \$129,900 |
| Mercedes-Benz SL-Class                              | RWD            | \$85,050  |
| Porsche 911                                         | RWD            | \$84,300  |
| Porsche Panamera                                    | RWD            | \$78,100  |
| ^(a) AWD = All Wheel Drive, RWD = Rear Wheel Drive. |                |           |
| ^(b) Prices in USD.                                 |                |           |

### `sp500`

The S&P 500 is a capitalization-weighted index of about 500 leading
companies (where bigger companies have more influence within the index)
that have common stock listed in either the NYSE or NASDAQ markets. The
companies chosen are intended to provide representation of the U.S.
economy. This index is a managed list (managed by S&P Dow Jones Indices
LLC) with occasional changes of the constituent companies based on their
performance and changes in the economy.

There is daily S&P 500 data available in the `sp500` dataset, with daily
indicators (price statistics, `volume`, etc.) from 1950 to 2015,
inclusive. There are 16,607 rows in the dataset, and 7 variables:

| Column                 | Type | Description                                                                                     |
|------------------------|------|-------------------------------------------------------------------------------------------------|
| date                   | date | The date expressed as \`Date\` values                                                           |
| open, high, low, close | dbl  | The day's opening, high, low, and closing prices in USD; the close price is adjusted for splits |
| volume                 | dbl  | The number of trades for the given \`date\`                                                     |
| adj_close              | dbl  | The close price adjusted for both dividends and splits                                          |

#### An `sp500` Example

The table that we’ll create from `sp500` will meet these requirements:

1.  use only data from the period `2010-06-02` to `2010-06-15`
2.  the adjusted close `adj_close` column won’t be included
3.  a title and subtitle will be added to describe the contents of the
    table
4.  put the column labels in title case
5.  format the `date` column to appear as ‘2 Jun 2010’
6.  have the price columns (`open`, `high`, `low`, `close`) appear in
    USD
7.  the large numbers in `volume` should be shown as billions (with the
    `B` suffix)
8.  up- and down-pointing triangles (in green and red) will be added
    alongside the `close` price as appropriate

``` r
# Define the start and end dates for the data range
start_date <- "2010-06-02"
end_date <- "2010-06-15"

# The HTML decimal references for the black
# up- and down-pointing triangles are: #9650 and #9660;
# use an in-line style to apply color
up_arrow <- "<span style=\"color:green\">&#9650;</span>"
down_arrow <- "<span style=\"color:red\">&#9660;</span>"

# Create a gt table based on a preprocessed `sp500`
sp500 |>
  filter(date >= start_date, date <= end_date) |>
  select(-adj_close) |>
  gt() |>
  tab_header(
    title = "S&P 500",
    subtitle = glue::glue("{start_date} to {end_date}")
  ) |>
  fmt_date(
    columns = date,
    date_style = "day_m_year"
  ) |>
  fmt_currency(columns = c(open, high, low, close)) |>
  fmt_number(columns = volume, suffixing = TRUE) |>
  text_transform(
    locations = cells_body(
      columns = close,
      rows = close > open
    ),
    fn = function(x) paste(x, up_arrow)
  ) |>
  text_transform(
    locations = cells_body(
      columns = close,
      rows = close < open
    ),
    fn = function(x) paste(x, down_arrow)
  ) |>
  cols_label_with(
    columns = everything(),
    fn = ~ paste0(toupper(substr(., 1, 1)), substr(., 2, nchar(.)))
  )
```

| S&P 500                  |            |            |            |              |        |
|--------------------------|------------|------------|------------|--------------|--------|
| 2010-06-02 to 2010-06-15 |            |            |            |              |        |
| Date                     | Open       | High       | Low        | Close        | Volume |
| 15 Jun 2010              | \$1,091.21 | \$1,115.59 | \$1,091.21 | \$1,115.23 ▲ | 4.64B  |
| 14 Jun 2010              | \$1,095.00 | \$1,105.91 | \$1,089.03 | \$1,089.63 ▼ | 4.43B  |
| 11 Jun 2010              | \$1,082.65 | \$1,092.25 | \$1,077.12 | \$1,091.60 ▲ | 4.06B  |
| 10 Jun 2010              | \$1,058.77 | \$1,087.85 | \$1,058.77 | \$1,086.84 ▲ | 5.14B  |
| 9 Jun 2010               | \$1,062.75 | \$1,077.74 | \$1,052.25 | \$1,055.69 ▼ | 5.98B  |
| 8 Jun 2010               | \$1,050.81 | \$1,063.15 | \$1,042.17 | \$1,062.00 ▲ | 6.19B  |
| 7 Jun 2010               | \$1,065.84 | \$1,071.36 | \$1,049.86 | \$1,050.47 ▼ | 5.47B  |
| 4 Jun 2010               | \$1,098.43 | \$1,098.43 | \$1,060.50 | \$1,064.88 ▼ | 6.18B  |
| 3 Jun 2010               | \$1,098.82 | \$1,105.67 | \$1,091.81 | \$1,102.83 ▲ | 5.00B  |
| 2 Jun 2010               | \$1,073.01 | \$1,098.56 | \$1,072.03 | \$1,098.38 ▲ | 5.03B  |

### `pizzaplace`

The `pizzaplace` dataset is unusual to say the least. It brings up more
questions than answers. Why is it that the ‘The Greek’ pizza
(`the_greek`) comes in `XL` and `XXL` sizes whilst (almost) all the
other pizzas adhere to the `S`-`M`-`L` paradigm? Why is the ‘Brie Carre’
pizza (`brie_carre`) only small? Also, is any of this real (?), and,
what is the nature of reality? (All of these questions are quite
complicated… however, while I can doubt the existence of the material
world, I cannot doubt the existence of myself as someone thinking about
all the delicious pizzas on offer at `pizzaplace`.)

We have somehow obtained the 2015 sales from the pizzaplace, where each
row is a pizza sold. There are 32 different types of pizza in 4
different categories: `classic`, `chicken`, `supreme`, and `veggie`. It
was a great year of sales, personal problems notwithstanding. A kitchen
fire in late September did not help with the morale situation.
Nevertheless, \$817,860 in sales for the year! That was indeed something
to be cheerful about.

Let’s learn more about how this fascinating dataset is structured:

| Column | Type | Description                                                                                                                                                   |
|--------|------|---------------------------------------------------------------------------------------------------------------------------------------------------------------|
| id     | chr  | The ID for the order, which consists of one or more pizzas at a given \`date\` and \`time\`                                                                   |
| date   | chr  | A character representation of the order \`date\`, expressed in the ISO 8601 date format (YYYY-MM-DD)                                                          |
| time   | chr  | A character representation of the order time, expressed as a 24-hour time the ISO 8601 extended time format (hh:mm:ss)                                        |
| name   | chr  | The short name for the pizza                                                                                                                                  |
| size   | chr  | The size of the pizza, which can either be S, M, L, XL (rare!), or XXL (even rarer!); most pizzas are available in the S, M, and L sizes but exceptions apply |
| type   | chr  | The category or type of pizza, which can either be \`classic\`, \`chicken\`, \`supreme\`, or \`veggie\`                                                       |
| price  | dbl  | The price of the pizza and the amount that it sold for (in USD)                                                                                               |

#### A `pizzaplace` Example

Let’s make a reporting table from the `pizzaplace` dataset with these
requirements:

1.  obtain the total sale numbers and revenue from each `size` of pizza
    from each category (`type`)
2.  create a gt table where each row represents a combination of
    `size`-`type` (`size` provides the row labels and `type` forms the
    row groups)
3.  add a title to explain the contents of the table
4.  format the numeric `sold` column to use commas and no decimal places
5.  format the currency values (`income`) to be in `USD` currency
6.  add a summary for each grouping that provides total sell counts and
    revenue amounts
7.  color the row groups and summary cells to add a little pizzazz

``` r
# Create a gt table based on a preprocessed `pizzaplace`
pizzaplace |>
  dplyr::group_by(type, size) |>
  dplyr::summarize(
    sold = n(),
    income = sum(price),
    .groups = "drop_last"
  ) |>
  gt(rowname_col = "size") |>
  tab_header(title = "Pizzas Sold in 2015") |>
  fmt_integer(columns = sold) |>
  fmt_currency(columns = income) |>
  summary_rows(
    columns = sold,
    fns = list(TOTAL = "sum"),
    fmt = list(~ fmt_integer(.))
  ) |>
  summary_rows(
    columns = income,
    fns = list(TOTAL = "sum"),
    fmt = list(~ fmt_currency(.))
  ) |>
  tab_options(
    summary_row.background.color = "#ACEACE",
    row_group.background.color = "#FFEFDB"
  )
```

| Pizzas Sold in 2015 |        |              |
|---------------------|--------|--------------|
|                     | sold   | income       |
| chicken             |        |              |
| L                   | 4,932  | \$102,339.00 |
| M                   | 3,894  | \$65,224.50  |
| S                   | 2,224  | \$28,356.00  |
| sum                 | 11,050 | \$195,919.50 |
| classic             |        |              |
| L                   | 4,057  | \$74,518.50  |
| M                   | 4,112  | \$60,581.75  |
| S                   | 6,139  | \$69,870.25  |
| XL                  | 552    | \$14,076.00  |
| XXL                 | 28     | \$1,006.60   |
| sum                 | 14,888 | \$220,053.10 |
| supreme             |        |              |
| L                   | 4,564  | \$94,258.50  |
| M                   | 4,046  | \$66,475.00  |
| S                   | 3,377  | \$47,463.50  |
| sum                 | 11,987 | \$208,197.00 |
| veggie              |        |              |
| L                   | 5,403  | \$104,202.70 |
| M                   | 3,583  | \$57,101.00  |
| S                   | 2,663  | \$32,386.75  |
| sum                 | 11,649 | \$193,690.45 |

### `exibble`

The example tibble that’s useful for **gt** is called `exibble`. It’s 8
rows, has clear ordering of data, and the columns contain data that can
be tested with the various **gt** formatter functions (`fmt*()`). Here
is a table describing the columns of `exibble`:

| Column               | Type | Description                                                                                                                            |
|----------------------|------|----------------------------------------------------------------------------------------------------------------------------------------|
| num                  | dbl  | A numeric column ordered with increasingly larger values                                                                               |
| char                 | chr  | A character column composed of names of fruits from a to h                                                                             |
| fctr                 | fct  | A factor column with numbers from 1 to 8, written out                                                                                  |
| date, time, datetime | chr  | Character columns with dates, times, and datetimes                                                                                     |
| currency             | dbl  | A numeric column that is useful for testing currency-based formatting                                                                  |
| row                  | chr  | A character column in the format \`row_X\` which can be useful for testing with row label in a table stub                              |
| group                | chr  | A character column with four \`grp_a\` values and four \`grp_b\` values which can be useful for testing tables that contain row groups |

#### An `exibble` Example

Let’s test as many formatter functions as possible with `exibble` while
also using row labels and row groups (furnished by the `row` and `group`
columns). We’ll format `num` to display numbers with 2 decimal places.
The dates in `date` will be formatted with `date_style` `6` (the
`m_day_year` style, use
[`info_date_style()`](https://gt.rstudio.com/reference/info_date_style.md)
to learn about all of them). The 24-h time values in `time` will use
`time_style` `4` (`hm_p`, more info at
[`info_time_style()`](https://gt.rstudio.com/reference/info_time_style.md)).
Datetimes as in `datetime` column can be formatted with the
[`fmt_datetime()`](https://gt.rstudio.com/reference/fmt_datetime.md)
function (which uses the `date_style` and `time_style` arguments). The
column `currency` will be formatted as a currency with `fmt_currency`
and we’ll consider these values to be euros (`currency = "EUR"`).

``` r
# Create a gt table based on `exibble`
exibble |>
  gt(
    rowname_col = "row",
    groupname_col = "group"
  ) |>
  fmt_number(
    columns = num,
    decimals = 2
  ) |>
  fmt_date(
    columns = date,
    date_style = "m_day_year"
  ) |>
  fmt_time(
    columns = time,
    time_style = "h_m_p"
  ) |>
  fmt_datetime(
    columns = datetime,
    date_style = "m_day_year",
    time_style = "h_m_p"
  ) |>
  fmt_currency(
    columns = currency,
    currency = "EUR"
  ) |>
  tab_options(
    column_labels.font.size = "small",
    table.font.size = "small",
    row_group.font.size = "small",
    data_row.padding = px(3)
  )
```

|       | num          | char       | fctr  | date         | time    | datetime            | currency   |
|-------|--------------|------------|-------|--------------|---------|---------------------|------------|
| grp_a |              |            |       |              |         |                     |            |
| row_1 | 0.11         | apricot    | one   | Jan 15, 2015 | 1:35 PM | Jan 1, 2018 2:22 AM | €49.95     |
| row_2 | 2.22         | banana     | two   | Feb 15, 2015 | 2:40 PM | Feb 2, 2018 2:33 PM | €17.95     |
| row_3 | 33.33        | coconut    | three | Mar 15, 2015 | 3:45 PM | Mar 3, 2018 3:44 AM | €1.39      |
| row_4 | 444.40       | durian     | four  | Apr 15, 2015 | 4:50 PM | Apr 4, 2018 3:55 PM | €65,100.00 |
| grp_b |              |            |       |              |         |                     |            |
| row_5 | 5,550.00     | NA         | five  | May 15, 2015 | 5:55 PM | May 5, 2018 4:00 AM | €1,325.81  |
| row_6 | NA           | fig        | six   | Jun 15, 2015 | NA      | Jun 6, 2018 4:11 PM | €13.26     |
| row_7 | 777,000.00   | grapefruit | seven | NA           | 7:10 PM | Jul 7, 2018 5:22 AM | NA         |
| row_8 | 8,880,000.00 | honeydew   | eight | Aug 15, 2015 | 8:20 PM | NA                  | €0.44      |
