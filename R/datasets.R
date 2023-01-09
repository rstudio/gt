#' Yearly populations of countries from 1960 to 2017
#'
#' @description
#'
#' A dataset that presents yearly, total populations of countries. Total
#' population is based on counts of all residents regardless of legal status or
#' citizenship. Country identifiers include the English-language country names,
#' and the 2- and 3-letter ISO 3166-1 country codes. Each row contains a
#' `population` value for a given `year` (from 1960 to 2017). Any `NA` values
#' for `populations` indicate the non-existence of the country during that year.
#'
#' @format A tibble with 12,470 rows and 5 variables:
#' \describe{
#' \item{country_name}{The name of the country.}
#' \item{country_code_2}{The 2-letter ISO 3166-1 country code.}
#' \item{country_code_3}{The 3-letter ISO 3166-1 country code.}
#' \item{year}{The year for the population estimate.}
#' \item{population}{The population estimate, midway through the year.}
#' }
#'
#' @source <https://data.worldbank.org/indicator/SP.POP.TOTL>
#'
#' @section Examples:
#'
#' Here is a glimpse at the data available in `countrypops`.
#'
#' ```{r}
#' dplyr::glimpse(countrypops)
#' ```
#'
#' @family datasets
#' @section Function ID:
#' 11-1
#'
"countrypops"

#' Twice hourly solar zenith angles by month & latitude
#'
#' @description
#'
#' This dataset contains solar zenith angles (in degrees, with the range of
#' 0-90) every half hour from 04:00 to 12:00, true solar time. This set of
#' values is calculated on the first of every month for 4 different northern
#' hemisphere latitudes. For determination of afternoon values, the presented
#' tabulated values are symmetric about noon.
#'
#' @details
#'
#' The solar zenith angle (SZA) is one measure that helps to describe the sun's
#' path across the sky. It's defined as the angle of the sun relative to a line
#' perpendicular to the earth's surface. It is useful to calculate the SZA in
#' relation to the true solar time. True solar time relates to the position of
#' the sun with respect to the observer, which is different depending on the
#' exact longitude. For example, two hours before the sun crosses the meridian
#' (the highest point it would reach that day) corresponds to a true solar time
#' of 10 a.m. The SZA has a strong dependence on the observer's latitude. For
#' example, at a latitude of 50 degrees N at the start of January, the noontime
#' SZA is 73.0 but a different observer at 20 degrees N would measure the
#' noontime SZA to be 43.0 degrees.
#'
#' @format A tibble with 816 rows and 4 variables:
#' \describe{
#'   \item{latitude}{The latitude in decimal degrees for the observations.}
#'   \item{month}{The measurement month. All calculations where conducted
#'   for the first day of each month.}
#'   \item{tst}{The true solar time at the given `latitude` and date
#'   (first of `month`) for which the solar zenith angle is calculated.}
#'   \item{sza}{The solar zenith angle in degrees, where `NA`s indicate that
#'   sunrise hadn't yet occurred by the `tst` value.}
#' }
#'
#' @source Calculated Actinic Fluxes (290 - 700 nm) for Air Pollution
#' Photochemistry Applications (Peterson, 1976), available at:
#' <https://nepis.epa.gov/Exe/ZyPURL.cgi?Dockey=9100JA26.txt>.
#'
#' @section Examples:
#'
#' Here is a glimpse at the data available in `sza`.
#'
#' ```{r}
#' dplyr::glimpse(sza)
#' ```
#'
#' @family datasets
#' @section Function ID:
#' 11-2
#'
"sza"

#' Deluxe automobiles from the 2014-2017 period
#'
#' @description
#'
#' Expensive and fast cars. Not your father's `mtcars`. Each row describes a car
#' of a certain make, model, year, and trim. Basic specifications such as
#' horsepower, torque, EPA MPG ratings, type of drivetrain, and transmission
#' characteristics are provided. The country of origin for the car manufacturer
#' is also given.
#'
#' @details
#'
#' All of the `gtcars` have something else in common (aside from the high asking
#' prices): they are all grand tourer vehicles. These are proper GT cars that
#' blend pure driving thrills with a level of comfort that is more expected from
#' a fine limousine (e.g., a Rolls-Royce Phantom EWB). You'll find that, with
#' these cars, comfort is emphasized over all-out performance. Nevertheless, the
#' driving experience should also mean motoring at speed, doing so in style and
#' safety.
#'
#' @format A tibble with 47 rows and 15 variables:
#' \describe{
#'   \item{mfr}{The name of the car manufacturer.}
#'   \item{model}{The car's model name.}
#'   \item{year}{The car's model year.}
#'   \item{trim}{A short description of the car model's trim.}
#'   \item{bdy_style}{An identifier of the car's body style, which is either
#'   `"coupe"`, `"convertible"`, `"sedan"`, or `"hatchback"`.}
#'   \item{hp, hp_rpm}{The car's horsepower and the associated RPM level.}
#'   \item{trq, trq_rpm}{The car's torque and the associated RPM level.}
#'   \item{mpg_c, mpg_h}{The miles per gallon fuel efficiency rating for city
#'   and highway driving.}
#'   \item{drivetrain}{The car's drivetrain which, for this dataset, is either
#'   `"rwd"` (Rear Wheel Drive) or `"awd"` (All Wheel Drive).}
#'   \item{trsmn}{An encoding of the transmission type, where the number part is
#'   the number of gears. The car could have automatic transmission (`"a"`),
#'   manual transmission (`"m"`), an option to switch between both types
#'   (`"am"`), or, direct drive (`"dd"`)}
#'   \item{ctry_origin}{The country name for where the vehicle manufacturer
#'   is headquartered.}
#'   \item{msrp}{Manufacturer's suggested retail price in U.S. dollars (USD).}
#' }
#'
#' @section Examples:
#'
#' Here is a glimpse at the data available in `gtcars`.
#'
#' ```{r}
#' dplyr::glimpse(gtcars)
#' ```
#'
#' @family datasets
#' @section Function ID:
#' 11-3
#'
"gtcars"

#' Daily S&P 500 Index data from 1950 to 2015
#'
#' @description
#'
#' This dataset provides daily price indicators for the S&P 500 index from the
#' beginning of 1950 to the end of 2015. The index includes 500 leading
#' companies and captures about 80 percent coverage of available market
#' capitalization.
#'
#' @format A tibble with 16,607 rows and 7 variables:
#' \describe{
#' \item{date}{The date expressed as `Date` values.}
#' \item{open, high, low, close}{The day's opening, high, low, and closing
#' prices in USD. The `close` price is adjusted for splits.}
#' \item{volume}{The number of trades for the given `date`.}
#' \item{adj_close}{The close price adjusted for both dividends and splits.}
#' }
#'
#' @section Examples:
#'
#' Here is a glimpse at the data available in `sp500`.
#'
#' ```{r}
#' dplyr::glimpse(sp500)
#' ```
#'
#' @family datasets
#' @section Function ID:
#' 11-4
#'
"sp500"

#' A year of pizza sales from a pizza place
#'
#' @description
#'
#' A synthetic dataset that describes pizza sales for a pizza place somewhere in
#' the US. While the contents are artificial, the ingredients used to make the
#' pizzas are far from it. There are 32 different pizzas that fall into 4
#' different categories: `"classic"` (classic pizzas: 'You probably had one like
#' it before, but never like this!'), `"chicken"` (pizzas with chicken as a
#' major ingredient: 'Try the Southwest Chicken Pizza! You'll love it!'),
#' `"supreme"` (pizzas that try a little harder: 'My Soppressata pizza uses only
#' the finest salami from my personal salumist!'), and, `"veggie"` (pizzas
#' without any meats whatsoever: 'My Five Cheese pizza has so many cheeses, I
#' can only offer it in Large Size!').
#'
#' @details
#'
#' Each pizza in the dataset is identified by a short `name`. The following
#' listings provide the full names of each pizza and their main ingredients.
#'
#' Classic Pizzas:
#' \itemize{
#' \item `"classic_dlx"`: The Classic Deluxe Pizza (Pepperoni, Mushrooms, Red
#' Onions, Red Peppers, Bacon)
#' \item `"big_meat"`: The Big Meat Pizza (Bacon, Pepperoni, Italian Sausage,
#' Chorizo Sausage)
#' \item `"pepperoni"`: The Pepperoni Pizza (Mozzarella Cheese, Pepperoni)
#' \item `"hawaiian"`: The Hawaiian Pizza (Sliced Ham, Pineapple, Mozzarella
#' Cheese)
#' \item `"pep_msh_pep"`: The Pepperoni, Mushroom, and Peppers Pizza
#' (Pepperoni, Mushrooms, and Green Peppers)
#' \item `"ital_cpcllo"`: The Italian Capocollo Pizza (Capocollo, Red
#' Peppers, Tomatoes, Goat Cheese, Garlic, Oregano)
#' \item `"napolitana"`: The Napolitana Pizza (Tomatoes, Anchovies, Green
#' Olives, Red Onions, Garlic)
#' \item `"the_greek"`: The Greek Pizza (Kalamata Olives, Feta Cheese,
#' Tomatoes, Garlic, Beef Chuck Roast, Red Onions)
#' }
#'
#' Chicken Pizzas:
#' \itemize{
#' \item `"thai_ckn"`: The Thai Chicken Pizza (Chicken, Pineapple, Tomatoes,
#' Red Peppers, Thai Sweet Chilli Sauce)
#' \item `"bbq_ckn"`: The Barbecue Chicken Pizza (Barbecued Chicken, Red
#' Peppers, Green Peppers, Tomatoes, Red Onions, Barbecue Sauce)
#' \item `"southw_ckn"`: The Southwest Chicken Pizza (Chicken, Tomatoes, Red
#' Peppers, Red Onions, Jalapeno Peppers, Corn, Cilantro, Chipotle Sauce)
#' \item `"cali_ckn"`: The California Chicken Pizza (Chicken, Artichoke,
#' Spinach, Garlic, Jalapeno Peppers, Fontina Cheese, Gouda Cheese)
#' \item `"ckn_pesto"`: The Chicken Pesto Pizza (Chicken, Tomatoes, Red
#' Peppers, Spinach, Garlic, Pesto Sauce)
#' \item `"ckn_alfredo"`: The Chicken Alfredo Pizza (Chicken, Red Onions,
#' Red Peppers, Mushrooms, Asiago Cheese, Alfredo Sauce)
#' }
#'
#' Supreme Pizzas:
#' \itemize{
#' \item `"brie_carre"`: The Brie Carre Pizza (Brie Carre Cheese, Prosciutto,
#'  Caramelized Onions, Pears, Thyme, Garlic)
#' \item `"calabrese"`: The Calabrese Pizza (‘Nduja Salami, Pancetta,
#' Tomatoes, Red Onions, Friggitello Peppers, Garlic)
#' \item `"soppressata"`: The Soppressata Pizza (Soppressata Salami, Fontina
#' Cheese, Mozzarella Cheese, Mushrooms, Garlic)
#' \item `"sicilian"`: The Sicilian Pizza (Coarse Sicilian Salami, Tomatoes,
#' Green Olives, Luganega Sausage, Onions, Garlic)
#' \item `"ital_supr"`: The Italian Supreme Pizza (Calabrese Salami,
#' Capocollo, Tomatoes, Red Onions, Green Olives, Garlic)
#' \item `"peppr_salami"`: The Pepper Salami Pizza (Genoa Salami, Capocollo,
#' Pepperoni, Tomatoes, Asiago Cheese, Garlic)
#' \item `"prsc_argla"`: The Prosciutto and Arugula Pizza (Prosciutto di San
#' Daniele, Arugula, Mozzarella Cheese)
#' \item `"spinach_supr"`: The Spinach Supreme Pizza (Spinach, Red Onions,
#' Pepperoni, Tomatoes, Artichokes, Kalamata Olives, Garlic, Asiago Cheese)
#' \item `"spicy_ital"`: The Spicy Italian Pizza (Capocollo, Tomatoes, Goat
#' Cheese, Artichokes, Peperoncini verdi, Garlic)
#' }
#'
#' Vegetable Pizzas
#' \itemize{
#' \item `"mexicana"`: The Mexicana Pizza (Tomatoes, Red Peppers, Jalapeno
#' Peppers, Red Onions, Cilantro, Corn, Chipotle Sauce, Garlic)
#' \item `"four_cheese"`: The Four Cheese Pizza (Ricotta Cheese, Gorgonzola
#' Piccante Cheese, Mozzarella Cheese, Parmigiano Reggiano Cheese, Garlic)
#' \item `"five_cheese"`: The Five Cheese Pizza (Mozzarella Cheese, Provolone
#' Cheese, Smoked Gouda Cheese, Romano Cheese, Blue Cheese, Garlic)
#' \item `"spin_pesto"`: The Spinach Pesto Pizza (Spinach, Artichokes,
#' Tomatoes, Sun-dried Tomatoes, Garlic, Pesto Sauce)
#' \item `"veggie_veg"`: The Vegetables + Vegetables Pizza (Mushrooms,
#' Tomatoes, Red Peppers, Green Peppers, Red Onions, Zucchini, Spinach, Garlic)
#' \item `"green_garden"`: The Green Garden Pizza (Spinach, Mushrooms,
#' Tomatoes, Green Olives, Feta Cheese)
#' \item `"mediterraneo"`: The Mediterranean Pizza (Spinach, Artichokes,
#' Kalamata Olives, Sun-dried Tomatoes, Feta Cheese, Plum Tomatoes, Red Onions)
#' \item `"spinach_fet"`: The Spinach and Feta Pizza (Spinach, Mushrooms,
#' Red Onions, Feta Cheese, Garlic)
#' \item `"ital_veggie"`: The Italian Vegetables Pizza (Eggplant, Artichokes,
#' Tomatoes, Zucchini, Red Peppers, Garlic, Pesto Sauce)
#' }
#'
#' @format A tibble with 49,574 rows and 7 variables:
#' \describe{
#'   \item{id}{The ID for the order, which consists of one or more pizzas
#'   at a given `date` and `time`.}
#'   \item{date}{A character representation of the `order` date,
#'   expressed in the ISO 8601 date format (YYYY-MM-DD).}
#'   \item{time}{A character representation of the `order` time,
#'   expressed as a 24-hour time the ISO 8601 extended time format
#'   (hh:mm:ss).}
#'   \item{name}{The short name for the pizza.}
#'   \item{size}{The size of the pizza, which can either be `"S"`,
#'   `"M"`, `"L"`, `"XL"` (rare!), or `"XXL"` (even rarer!);
#'   most pizzas are available in the `"S"`, `"M"`, and `"L"` sizes
#'   but exceptions apply.}
#'   \item{type}{The category or type of pizza, which can either be
#'   `"classic"`, `"chicken"`, `"supreme"`, or `"veggie"`.}
#'   \item{price}{The price of the pizza and the amount that it sold for
#'   (in USD).}
#' }
#'
#' @section Examples:
#'
#' Here is a glimpse at the pizza data available in `pizzaplace`.
#'
#' ```{r}
#' dplyr::glimpse(pizzaplace)
#' ```
#'
#' @family datasets
#' @section Function ID:
#' 11-5
#'
"pizzaplace"

#' A toy example tibble for testing with gt: exibble
#'
#' @description
#'
#' This tibble contains data of a few different classes, which makes it
#' well-suited for quick experimentation with the functions in this package. It
#' contains only eight rows with numeric, character, and factor columns. The
#' last 4 rows contain `NA` values in the majority of this tibble's columns (1
#' missing value per column). The `date`, `time`, and `datetime` columns are
#' character-based dates/times in the familiar ISO 8601 format. The `row` and
#' `group` columns provide for unique rownames and two groups (`grp_a` and
#' `grp_b`) for experimenting with the [gt()] function's `rowname_col` and
#' `groupname_col` arguments.
#'
#' @format A tibble with 8 rows and 9 variables:
#' \describe{
#'   \item{num}{A numeric column ordered with increasingly larger values.}
#'   \item{char}{A character column composed of names of fruits from `a` to
#'   `h`.}
#'   \item{fctr}{A factor column with numbers from `1` to `8`, written out.}
#'   \item{date, time, datetime}{Character columns with dates, times, and
#'   datetimes.}
#'   \item{currency}{A numeric column that is useful for testing currency-based
#'   formatting.}
#'   \item{row}{A character column in the format `row_X` which can be
#'   useful for testing with row captions in a table stub.}
#'   \item{group}{A character column with four `grp_a` values and four
#'   `grp_b` values which can be useful for testing tables that contain
#'   row groups.}
#' }
#'
#' @section Examples:
#'
#' Here is the `exibble`.
#'
#' ```{r}
#' exibble
#' ```
#'
#' @family datasets
#' @section Function ID:
#' 11-6
#'
"exibble"

#' An ADaM-flavored clinical trial toy dataset
#'
#' @description
#'
#' This tibble contains artificial data for 182 subjects of the `GT01` study.
#' Each row corresponds to demographic characteristics of a single trial
#' participant. Two out of 182 study participants were screen failures and
#' thus not treated, the rest of the study population was randomized with a
#' 1:1 ratio to receive either `Placebo` (as comparator) or `Drug 1`. The
#' dataset entails subject level demographics such as age, age group, sex,
#' ethnicity and body mass index (BMI) at baseline, as well as an event
#' flag, indicating whether the subject experienced a specific event
#' throughout the course of the study or not.
#'
#' Although the data was intentionally created to mimic a typical clinical
#' trial dataset following the CDISC format, it might not strictly comply
#' with CDISC ADaM rules. The intent is to showcase the workflow for clinical
#' table creation rather than creating a fully CDISC-compliant ADaM dataset.
#'
#' @format A tibble with 182 rows and 14 variables:
#' \describe{
#'   \item{STUDYID, STUDYIDN}{The unique study identifier and its numeric
#'   version.}
#'   \item{USUBJID}{The unique subject identifier.}
#'   \item{TRTA, TRTAN}{The study intervention and its numeric version, which
#'   is either `"Placebo"` (`1`), `"Drug 1"` (`2`) or `NA` (`3`), missing for
#'   screen failures).}
#'   \item{ITTFL}{Intent-to-Treat (ITT) population flag, where `"Y"` indicates
#'   a subject belongs to the ITT population and `"N"` indicates a subject
#'   is not in the ITT population.}
#'   \item{RANDFL}{Randomization flag, where `"Y"` indicates a subject was
#'   randomized to receive either `"Placebo"` or `"Drug 1"` and `"N"` indicates
#'   a subject was not randomized at all.}
#'   \item{SCRFREAS}{The reason for screen failure. This is either missing
#'   (`""`) for non-screen failure subjects or indicates the reason for screen
#'   failure}
#'   \item{AGE}{The age of a subject at baseline in years.}
#'   \item{AAGEGR1}{The analysis age group, indicating if a subject was strictly
#'   younger than 40 years at baseline or older.}
#'   \item{SEX}{Sex of a subject. Can be either `"Male"`, `"Female"` or
#'   `"Undifferentiated"`.}
#'   \item{ETHNIC}{Ethnicity of a subject. Can be either `"Hispanic or Latino"`,
#'   `"Not Hispanic or Latino"` or missing (`""`).}
#'   \item{BLBMI}{Body Mass Index (BMI) of a subject at baseline in kg/m2.}
#'   \item{EVNTFL}{Event Flag. Indicates whether the subject experienced a
#'   specific event during the course of the study or not. Can be either `"Y"`,
#'   if the subject had the event, or `"N"`}
#' }
#'
#' @section Examples:
#'
#' Here is the `gt_adsl`.
#'
#' ```{r}
#' gt_adsl
#' ```
#'
#' @family datasets
#' @section Function ID:
#' 11-7
#'
"gt_adsl"

#' Populations of all municipalities in Ontario from 1996 to 2021
#'
#' @description
#'
#' A dataset containing census population data from six census years (1996 to
#' 2021) for all 414 municipalities in Ontario. Contains land area values
#' according to 2021 boundaries and computed density values for each census
#' year. Each row represents a single municipality country codes and the
#' different figures by census year are distributed across columns.
#'
#' @format A tibble with 414 rows and 25 variables:
#' \describe{
#' \item{name}{The name of the municipality.}
#' \item{website}{The website for the municipality. This is `NA` if there isn't
#' an official site.}
#' \item{status}{The status of the municipality. This is either `"Lower-tier"`
#' or `"Single-tier"`.}
#' \item{csd_type}{The Census Subdivision Type. This can be one of `"Village"`,
#' `"Town"`, `"Township"`, `"Municipality"`, or `"City"`.}
#' \item{census_div}{The Census division, of which there are 49.}
#' \item{latitude, longitude}{The location of the municipality, given as
#' latitude and longitude values in decimal degrees.}
#' \item{land_area_km2}{The total area of the municipality in square
#' kilometers.}
#' \item{population_1996, population_2001, population_2006, population_2011,
#' population_2016, population_2021}{
#' Population values for each municipality from the 1996 to 2021 census years.}
#' \item{density_1996, density_2001, density_2006, density_2011, density_2016,
#' density_2021}{
#' Population density values, calculated as persons per square kilometer, for
#' each municipality from the 1996 to 2021 census years.}
#' \item{pop_change_1996_2001_pct, pop_change_2001_2006_pct,
#' pop_change_2006_2011_pct, pop_change_2011_2016_pct,
#' pop_change_2016_2021_pct}{
#' Fractional population changes between the census years from 1996 to 2021.}
#' }
#'
#' @section Examples:
#'
#' Here is a glimpse at the data available in `towny`.
#'
#' ```{r}
#' dplyr::glimpse(towny)
#' ```
#'
#' @family datasets
#' @section Function ID:
#' 11-8
#'
"towny"
