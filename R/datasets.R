#------------------------------------------------------------------------------#
#
#                /$$
#               | $$
#     /$$$$$$  /$$$$$$
#    /$$__  $$|_  $$_/
#   | $$  \ $$  | $$
#   | $$  | $$  | $$ /$$
#   |  $$$$$$$  |  $$$$/
#    \____  $$   \___/
#    /$$  \ $$
#   |  $$$$$$/
#    \______/
#
#  This file is part of the 'rstudio/gt' project.
#
#  Copyright (c) 2018-2025 gt authors
#
#  For full copyright and license information, please look at
#  https://gt.rstudio.com/LICENSE.html
#
#------------------------------------------------------------------------------#


#' Yearly populations of countries from 1960 to 2024
#'
#' @description
#'
#' A dataset that presents yearly, total populations of countries. Total
#' population is based on counts of all residents regardless of legal status or
#' citizenship. Country identifiers include the English-language country names,
#' and the 2- and 3-letter ISO 3166-1 country codes. Each row contains a
#' `population` value for a given `year` (from 1960 to 2024). Any `NA` values
#' within `population` indicate the non-existence of the entity during that
#' year.
#'
#' @format A tibble with 13,975 rows and 5 variables:
#' \describe{
#' \item{country_name}{The name of the country.}
#' \item{country_code_2, country_code_3}{The 2- and 3-letter ISO 3166-1 country
#' codes.}
#' \item{year}{The year for the population estimate.}
#' \item{population}{The population estimate, midway through the year.}
#' }
#'
#' @source <https://data.worldbank.org/indicator/SP.POP.TOTL>
#'
#' @family datasets
#' @section Dataset ID and Badge:
#' DATA-1
#'
#' \if{html}{\out{
#' `r data_get_image_tag(file = "dataset_countrypops.png")`
#' }}
#'
#' @section Dataset Introduced:
#' `v0.2.0.5` (March 31, 2020)
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
#' \item{latitude}{The latitude in decimal degrees for the observations.}
#' \item{month}{The measurement month. All calculations where conducted for the
#' first day of each month.}
#' \item{tst}{The true solar time at the given `latitude` and date (first of
#' `month`) for which the solar zenith angle is calculated.}
#' \item{sza}{The solar zenith angle in degrees, where `NA`s indicate that
#' sunrise hadn't yet occurred by the `tst` value.}
#' }
#'
#' @source Calculated Actinic Fluxes (290 - 700 nm) for Air Pollution
#' Photochemistry Applications (Peterson, 1976), available at:
#' <https://nepis.epa.gov/Exe/ZyPURL.cgi?Dockey=9100JA26.txt>.
#'
#' @family datasets
#' @section Dataset ID and Badge:
#' DATA-2
#'
#' \if{html}{\out{
#' `r data_get_image_tag(file = "dataset_sza.png")`
#' }}
#'
#' @section Dataset Introduced:
#' `v0.2.0.5` (March 31, 2020)
#'
#' @examples
#' dplyr::glimpse(sza)
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
#' \item{mfr}{The name of the car manufacturer.}
#' \item{model}{The car's model name.}
#' \item{year}{The car's model year.}
#' \item{trim}{A short description of the car model's trim.}
#' \item{bdy_style}{An identifier of the car's body style, which is either
#' `"coupe"`, `"convertible"`, `"sedan"`, or `"hatchback"`.}
#' \item{hp, hp_rpm}{The car's horsepower and the associated RPM level.}
#' \item{trq, trq_rpm}{The car's torque and the associated RPM level.}
#' \item{mpg_c, mpg_h}{The miles per gallon fuel efficiency rating for city
#' and highway driving.}
#' \item{drivetrain}{The car's drivetrain which, for this dataset, is either
#' `"rwd"` (Rear Wheel Drive) or `"awd"` (All Wheel Drive).}
#' \item{trsmn}{An encoding of the transmission type, where the number part is
#' the number of gears. The car could have automatic transmission (`"a"`),
#' manual transmission (`"m"`), an option to switch between both types
#' (`"am"`), or, direct drive (`"dd"`)}
#' \item{ctry_origin}{The country name for where the vehicle manufacturer
#' is headquartered.}
#' \item{msrp}{Manufacturer's suggested retail price in U.S. dollars (USD).}
#' }
#'
#' @family datasets
#' @section Dataset ID and Badge:
#' DATA-3
#'
#' \if{html}{\out{
#' `r data_get_image_tag(file = "dataset_gtcars.png")`
#' }}
#'
#' @section Dataset Introduced:
#' `v0.2.0.5` (March 31, 2020)
#'
#' @examples
#' dplyr::glimpse(gtcars)
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
#' @family datasets
#' @section Dataset ID and Badge:
#' DATA-4
#'
#' \if{html}{\out{
#' `r data_get_image_tag(file = "dataset_sp500.png")`
#' }}
#'
#' @section Dataset Introduced:
#' `v0.2.0.5` (March 31, 2020)
#'
#' @examples
#' dplyr::glimpse(sp500)
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
#' \item `"calabrese"`: The Calabrese Pizza ('Nduja Salami, Pancetta,
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
#' \item{id}{The ID for the order, which consists of one or more pizzas at a
#' given `date` and `time`.}
#' \item{date}{A character representation of the order date, expressed in the
#' ISO 8601 date format (`YYYY-MM-DD`).}
#' \item{time}{A character representation of the order time, expressed as a
#' 24-hour time the ISO 8601 extended time format (`HH:MM:SS`).}
#' \item{name}{The short name for the pizza.}
#' \item{size}{The size of the pizza, which can either be `"S"`, `"M"`, `"L"`,
#' `"XL"` (rare!), or `"XXL"` (even rarer!); most pizzas are available in the
#' `"S"`, `"M"`, and `"L"` sizes but exceptions apply.}
#' \item{type}{The category or type of pizza, which can either be `"classic"`,
#' `"chicken"`, `"supreme"`, or `"veggie"`.}
#' \item{price}{The price of the pizza and the amount that it sold for (in
#' USD).}
#' }
#'
#' @family datasets
#' @section Dataset ID and Badge:
#' DATA-5
#'
#' \if{html}{\out{
#' `r data_get_image_tag(file = "dataset_pizzaplace.png")`
#' }}
#'
#' @section Dataset Introduced:
#' `v0.2.0.5` (March 31, 2020)
#'
#' @examples
#' dplyr::glimpse(pizzaplace)
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
#' \item{num}{A numeric column ordered with increasingly larger values.}
#' \item{char}{A character column composed of names of fruits from `a` to `h`.}
#' \item{fctr}{A factor column with numbers from `1` to `8`, written out.}
#' \item{date, time, datetime}{Character columns with dates, times, and
#' datetimes.}
#' \item{currency}{A numeric column that is useful for testing currency-based
#' formatting.}
#' \item{row}{A character column in the format `row_X` which can be useful for
#' testing with row labels in a table stub.}
#' \item{group}{A character column with four `grp_a` values and four `grp_b`
#' values which can be useful for testing tables that contain row groups.}
#' }
#'
#' @family datasets
#' @section Dataset ID and Badge:
#' DATA-6
#'
#' \if{html}{\out{
#' `r data_get_image_tag(file = "dataset_exibble.png")`
#' }}
#'
#' @section Dataset Introduced:
#' `v0.2.0.5` (March 31, 2020)
#'
#' @examples
#' exibble
"exibble"

#' Populations of all municipalities in Ontario from 1996 to 2021
#'
#' @description
#'
#' A dataset containing census population data from six census years (1996 to
#' 2021) for all 414 of Ontario's local municipalities. The Municipal Act of
#' Ontario (2001) defines a local municipality as "a single-tier municipality or
#' a lower-tier municipality". There are 173 single-tier municipalities and 241
#' lower-tier municipalities representing 99 percent of Ontario's population
#' and 17 percent of its land use.
#'
#' In the `towny` dataset we include information specific to each municipality
#' such as location (in the `latitude` and `longitude` columns), their website
#' URLs, their classifications, and land area sizes according to 2021
#' boundaries. Additionally, there are computed columns containing population
#' density values for each census year and population change values from
#' adjacent census years.
#'
#' @format A tibble with 414 rows and 25 variables:
#' \describe{
#' \item{name}{The name of the municipality.}
#' \item{website}{The website for the municipality. This is `NA` if there isn't
#' an official site.}
#' \item{status}{The status of the municipality. This is either `"lower-tier"`
#' or `"single-tier"`. A single-tier municipality, which takes on all municipal
#' duties outlined in the Municipal Act and other Provincial laws, is
#' independent of an upper-tier municipality. Part of an upper-tier municipality
#' is a lower-tier municipality. The upper-tier and lower-tier municipalities
#' are responsible for carrying out the duties laid out in the Municipal Act and
#' other provincial laws.}
#' \item{csd_type}{The Census Subdivision Type. This can be one of `"village"`,
#' `"town"`, `"township"`, `"municipality"`, or `"city"`.}
#' \item{census_div}{The Census division, of which there are 49. This is made up
#' of single-tier municipalities, regional municipalities, counties, and
#' districts.}
#' \item{latitude, longitude}{The location of the municipality, given as
#' latitude and longitude values in decimal degrees.}
#' \item{land_area_km2}{The total area of the local municipality in square
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
#' Population changes between adjacent pairs of census years, from 1996 to
#' 2021.}
#' }
#'
#' @family datasets
#' @section Dataset ID and Badge:
#' DATA-7
#'
#' \if{html}{\out{
#' `r data_get_image_tag(file = "dataset_towny.png")`
#' }}
#'
#' @section Dataset Introduced:
#' `v0.9.0` (Mar 31, 2023)
#'
#' @examples
#' dplyr::glimpse(towny)
"towny"

#' A table of personal information for people all over the world
#'
#' @description
#'
#' The `peeps` dataset contains records for one hundred people residing in ten
#' different countries. Each person in the table has address information along
#' with their email address and phone number. There are also personal
#' characteristics like date of birth, height, and weight. This data has been
#' synthesized, and so the names within the table have not been taken or based
#' on individuals in real life. The street addresses were generated from actual
#' street names within real geographic localities, however, the street numbers
#' were assigned randomly from a constrained number set. While these records do
#' not relate to real people, efforts were made to make the data as realistic as
#' possible.
#'
#' @format A tibble with 100 rows and 14 variables:
#' \describe{
#' \item{name_given, name_family}{The given and family name of individual.}
#' \item{address}{The street address of the individual.}
#' \item{city}{The name of the city or locality in which the individual
#' resides.}
#' \item{state_prov}{The state or province associated with the `city` and
#' `address`. This is `NA` for individuals residing in countries where
#' subdivision data is not needed for generating a valid mailing address.}
#' \item{postcode}{The post code associated with the `city` and `address`.}
#' \item{country}{The 3-letter ISO 3166-1 country code representative of the
#' individual's country.}
#' \item{email_addr}{The individual's email address.}
#' \item{phone_number, country_code}{The individual's phone number and the
#' country code associated with the phone number.}
#' \item{gender}{The gender of the individual.}
#' \item{dob}{The individual's date of birth (DOB) in the ISO 8601 form of
#' `YYYY-MM-DD`.}
#' \item{height_cm, weight_kg}{The height and weight of the individual in
#' centimeters (cm) and kilograms (kg), respectively.}
#' }
#'
#' @family datasets
#' @section Dataset ID and Badge:
#' DATA-8
#'
#' \if{html}{\out{
#' `r data_get_image_tag(file = "dataset_peeps.png")`
#' }}
#'
#' @section Dataset Introduced:
#' `v0.11.0` (July 9, 2024)
#'
#' @examples
#' dplyr::glimpse(peeps)
"peeps"


#' Feature films in competition at the Cannes Film Festival
#'
#' @description
#'
#' Each entry in the `films` is a feature film that appeared in the official
#' selection during a festival year (starting in 1946 and active to the present
#' day). The `year` column refers to the year of the festival and this figure
#' doesn't always coincide with the release year of the film. The film's title
#' reflects the most common title of the film in English, where the
#' `original_title` column provides the title of the film in its spoken language
#' (transliterated to Roman script where necessary).
#'
#' @format A tibble with 1,873 rows and 8 variables:
#' \describe{
#' \item{year}{The year of the festival in which the film was in competition.}
#' \item{title,original_title}{The `title` field provides the film title used
#' for English-speaking audiences. The `original_title` field is populated when
#' `title` differs greatly from the non-English original.}
#' \item{director}{The director or set of co-directors for the film. Multiple
#' directors are separated by a comma.}
#' \item{languages}{The languages spoken in the film in the order of appearance.
#' This consists of ISO 639 language codes (primarily as two-letter codes, but
#' using three-letter codes where necessary).}
#' \item{countries_of_origin}{The country or countries of origin for the
#' production. Here, 2-letter ISO 3166-1 country codes (set in uppercase) are
#' used.}
#' \item{run_time}{The run time of the film in hours and minutes. This is given
#' as a string in the format `[x]h [y]m`.}
#' \item{imdb_url}{The URL of the film's information page in the Internet Movie
#' Database (IMDB).}
#' }
#'
#' @family datasets
#' @section Dataset ID and Badge:
#' DATA-9
#'
#' \if{html}{\out{
#' `r data_get_image_tag(file = "dataset_films.png")`
#' }}
#'
#' @section Dataset Introduced:
#' `v0.11.0` (July 9, 2024)
#'
#' @examples
#' dplyr::glimpse(films)
"films"

#' The stations of the Paris Metro
#'
#' @description
#'
#' A dataset with information on all 321 Paris Metro stations as of August 2025.
#' Each record represents a station, describing which Metro lines are serviced
#' by the station, which other connections are available, and annual passenger
#' volumes. Basic location information is provided for each station in terms
#' of where they reside on a municipal level, and, through latitude/longitude
#' coordinate values.
#'
#' The system has 16 lines (numbered from 1 to 14, with two additional lines:
#' 3bis and 7bis) and covers over 200 kilometers of track. The Metro runs on
#' standard gauge tracks (1,435 mm) and operates using a variety of rolling
#' stock, including rubber-tired trains and steel-wheeled trains (which are far
#' more common).
#'
#' The Metro is operated by the RATP, which also operates other transit systems
#' in the region, including buses, trams, and the RER. The RER is an important
#' component of the region's transit infrastructure, and several RER stations
#' have connectivity with the Metro. This integration allows passengers to
#' transfer between those two systems seamlessly. The Metro also has connections
#' to the Transilien rail network, tramway stations, several major train
#' stations (e.g., Gare du Nord, Gare de l'Est, etc.), and many bus lines.
#'
#' @format A tibble with 321 rows and 11 variables:
#' \describe{
#' \item{name}{The name of the station.}
#' \item{caption}{In some cases, a station will have a caption that might
#' describe a nearby place of interest. This is `NA` if there isn't a caption
#' for the station name.}
#' \item{lines}{All Metro lines associated with the station. This is a
#' `character`-based, comma-separated series of line names.}
#' \item{connect_rer}{Station connections with the RER. The RER system has
#' five lines (A, B, C, D, and E) with 257 stations and several interchanges
#' with the Metro.}
#' \item{connect_tram}{Connections with tramway lines. This system has twelve
#' lines in operation (T1, T2, T3a, T3b, T4, T5, T6, T7, T8, T9, T11, and T13)
#' with 235 stations.}
#' \item{connect_transilien}{Connections with Transilien lines. This system has
#' eight lines in operation (H, J, K, L, N, P, R, and U).}
#' \item{connect_other}{Other connections with transportation infrastructure
#' such as regional, intercity, night, and high-speed trains (typically at
#' railway stations).}
#' \item{latitude, longitude}{The location of the station, given as
#' latitude and longitude values in decimal degrees.}
#' \item{location}{The arrondissement of Paris or municipality in which the
#' station resides. For some stations located at borders, the grouping of
#' locations will be presented as a comma-separated series}
#' \item{passengers}{The total number of Metro station entries during 2021. Some
#' of the newest stations in the Metro system do not have this data, thus they
#' show `NA` values.}
#' }
#'
#' @family datasets
#' @section Dataset ID and Badge:
#' DATA-10
#'
#' \if{html}{\out{
#' `r data_get_image_tag(file = "dataset_metro.png")`
#' }}
#'
#' @section Dataset Introduced:
#' `v0.9.0` (Mar 31, 2023)
#'
#' @examples
#' dplyr::glimpse(metro)
"metro"

#' Weather conditions in Gibraltar, May 2023
#'
#' @description
#'
#' The `gibraltar` dataset has meteorological data for the Gibraltar Airport
#' Station from May 1 to May 31, 2023. Gibraltar is a British Overseas Territory
#' and city located at the southern end of the Iberian Peninsula, on the Bay of
#' Gibraltar. This weather station is located at the airport (GIB), where it's
#' at an elevation of 5 meters above mean sea level (AMSL).
#'
#' @format A tibble with 1,431 rows and 10 variables:
#' \describe{
#' \item{date, time}{The date and time of the observation.}
#' \item{temp, dew_point}{The air temperature and dew point values, both in
#' degrees Celsius.}
#' \item{humidity}{The relative humidity as a value between `0` and `1`}
#' \item{wind_dir, wind_speed, wind_gust}{Observations related to wind. The wind
#' direction is given as the typical 'blowing from' value, simplified to one of
#' 16 compass directions. The wind speed is provided in units of meters per
#' second. If there was a measurable wind gust, the maximum gust speed is
#' recorded as m/s values (otherwise the value is `0`).}
#' \item{pressure}{The atmospheric pressure in hectopascals (hPa).}
#' \item{condition}{The weather condition.}
#' }
#'
#' @family datasets
#' @section Dataset ID and Badge:
#' DATA-11
#'
#' \if{html}{\out{
#' `r data_get_image_tag(file = "dataset_gibraltar.png")`
#' }}
#'
#' @section Dataset Introduced:
#' `v0.11.0` (July 9, 2024)
#'
#' @examples
#' dplyr::glimpse(gibraltar)
"gibraltar"

#' The fundamental physical constants
#'
#' @description
#'
#' This dataset contains values for over 300 basic fundamental constants in
#' nature. The values originate from the 2018 adjustment which is based on the
#' latest relevant precision measurements and improvements of theoretical
#' calculations. Such work has been carried out under the authority of the
#' *Task Group on Fundamental Constants* (TGFC) of the
#' *Committee on Data of the International Science Council* (CODATA). These
#' updated values became available on May 20, 2019. They are published at
#' <https://physics.nist.gov/cuu/Constants/index.html>, a website of the
#' *Fundamental Constants Data Center* of the
#' *National Institute of Standards and Technology* (NIST), Gaithersburg,
#' Maryland, USA.
#'
#' @format A tibble with 354 rows and 4 variables:
#' \describe{
#' \item{name}{The name of the constant.}
#' \item{value}{The value of the constant.}
#' \item{uncert}{The uncertainty associated with the value. If `NA` then the
#' value is seen as an 'exact' value (e.g., an electron volt has the exact value
#' of 1.602 176 634 e-19 J).}
#' \item{sf_value,sf_uncert}{The number of significant figures associated with
#' the value and any uncertainty value.}
#' \item{units}{The units associated with the constant.}
#' }
#'
#' @family datasets
#' @section Dataset ID and Badge:
#' DATA-12
#'
#' \if{html}{\out{
#' `r data_get_image_tag(file = "dataset_constants.png")`
#' }}
#'
#' @section Dataset Introduced:
#' `v0.10.0` (October 7, 2023)
#'
#' @examples
#' dplyr::glimpse(constants)
"constants"

#' Lab tests for one suffering from an illness
#'
#' @description
#'
#' A dataset with artificial daily lab data for a patient with Yellow Fever
#' (YF). The table comprises laboratory findings for the patient from day 3 of
#' illness onset until day 9 (after which the patient died). YF viral DNA was
#' found in serum samples from day 3, where the viral load reached 14,000 copies
#' per mL. Several medical interventions were taken to help the patient,
#' including the administration of fresh frozen plasma, platelets, red cells,
#' and coagulation factor VIII. The patient also received advanced support
#' treatment in the form of mechanical ventilation and plasmapheresis. Though
#' the patient's temperature remained stable during their illness,
#' unfortunately, the patient's condition did not improve. On days 7 and 8, the
#' patient's health declined further, with symptoms such as nosebleeds,
#' gastrointestinal bleeding, and hematoma.
#'
#' @details
#'
#' The various tests are identified in the `test` column. The following listing
#' provides the full names of any abbreviations seen in that column.
#'
#' \itemize{
#' \item `"WBC"`: white blood cells.
#' \item `"RBC"`: red blood cells.
#' \item `"Hb"`: hemoglobin.
#' \item `"PLT"`: platelets.
#' \item `"ALT"`: alanine aminotransferase.
#' \item `"AST"`: aspartate aminotransferase.
#' \item `"TBIL"`: total bilirubin.
#' \item `"DBIL"`: direct bilirubin.
#' \item `"NH3"`: hydrogen nitride.
#' \item `"PT"`: prothrombin time.
#' \item `"APTT"`: activated partial thromboplastin time.
#' \item `"PTA"`: prothrombin time activity.
#' \item `"DD"`: D-dimer.
#' \item `"FDP"`: fibrinogen degradation products.
#' \item `"LDH"`: lactate dehydrogenase.
#' \item `"HBDH"`: hydroxybutyrate dehydrogenase.
#' \item `"CK"`: creatine kinase.
#' \item `"CKMB"`: the MB fraction of creatine kinase.
#' \item `"BNP"`: B-type natriuretic peptide.
#' \item `"MYO"`: myohemoglobin.
#' \item `"TnI"`: troponin inhibitory.
#' \item `"CREA"`: creatinine.
#' \item `"BUN"`: blood urea nitrogen.
#' \item `"AMY"`: amylase.
#' \item `"LPS"`: lipase.
#' \item `"K"`: kalium.
#' \item `"Na"`: sodium.
#' \item `"Cl"`: chlorine.
#' \item `"Ca"`: calcium.
#' \item `"P"`: phosphorus.
#' \item `"Lac"`: lactate, blood.
#' \item `"CRP"`: c-reactive protein.
#' \item `"PCT"`: procalcitonin.
#' \item `"IL-6"`: interleukin-6.
#' \item `"CD3+CD4+"`: CD4+T lymphocytes.
#' \item `"CD3+CD8+"`: CD8+T lymphocytes.
#' }
#'
#' @format A tibble with 39 rows and 11 variables:
#' \describe{
#' \item{test}{The name of the test.}
#' \item{units}{The measurement units for the test.}
#' \item{day_3,day_4,day_5,day_6,day_7,day_8,day_9}{Measurement values
#' associated with each test administered from days 3 to 9. An `NA` value
#' indicates that the test could not be performed that day.}
#' \item{norm_l,norm_u}{Lower and upper bounds for the normal range associated
#' with the test.}
#' }
#'
#' @family datasets
#' @section Dataset ID and Badge:
#' DATA-13
#'
#' \if{html}{\out{
#' `r data_get_image_tag(file = "dataset_illness.png")`
#' }}
#'
#' @section Dataset Introduced:
#' `v0.10.0` (October 7, 2023)
#'
#' @examples
#' dplyr::glimpse(illness)
"illness"

#' Reaction rates for gas-phase atmospheric reactions of organic compounds
#'
#' @description
#'
#' The `reactions` dataset contains kinetic data for second-order (two body)
#' gas-phase chemical reactions for 1,683 organic compounds. The reaction-rate
#' values and parameters within this dataset are useful for studies of the
#' atmospheric environment. Organic pollutants, which are present in trace
#' amounts in the atmosphere, have been extensively studied by research groups
#' since their persistence in the atmosphere requires specific attention. Many
#' researchers have reported kinetic data on specific gas-phase reactions and
#' these mainly involve oxidation reactions with OH, nitrate radicals, ozone,
#' and chlorine atoms.
#'
#' This compilation of rate constant (*k*) data as contains the values for rate
#' constants at 298 K (in units of `cm^3 molecules^-1 s^-1`) as well as
#' parameters that allow for the calculation of rate constants at different
#' temperatures (the temperature dependence parameters: `A`, `B`, and `n`).
#' Uncertainty values/factors and temperature limits are also provided here
#' where information is available.
#'
#' @format A tibble with 1,683 rows and 39 variables:
#' \describe{
#' \item{compd_name}{The name of the primary compound undergoing
#' reaction with OH, ozone, NO3, or Cl.}
#' \item{cmpd_mwt}{The molecular weight of the compound in units of g/mol.}
#' \item{cmpd_formula}{The chemical formula of the compound.}
#' \item{cmpd_type}{The category of compounds that the `compd_name` falls
#' under.}
#' \item{cmpd_smiles}{The SMILES (simplified molecular-input line-entry system)
#' representation for the compound.}
#' \item{cmpd_inchi}{The InChI (International Chemical Identifier)
#' representation for the compound.}
#' \item{cmpd_inchikey}{The InChIKey, which is a hashed InChI value, has a fixed
#' length of 27 characters. These values can be used to more easily perform
#' database searches of chemical compounds.}
#' \item{OH_k298}{Rate constant at 298 K for OH reactions.}
#' \item{OH_uncert}{Uncertainty as a percentage for certain OH reactions.}
#' \item{OH_u_fac}{Uncertainty as a plus/minus difference for certain OH
#' reactions.}
#' \item{OH_a, OH_b, OH_n}{Extended temperature dependence parameters for
#' bimolecular OH reactions, to be used in the Arrhenius expression:
#' `k(T)=A exp(-B/T) (T/300)^n`. In that, `A` is expressed as
#' cm^3 molecules^-1 s^-1, `B` is in units of K, and `n` is dimensionless. Any
#' `NA` values indicate that data is not available.}
#' \item{OH_t_low, OH_t_high}{The low and high temperature boundaries (in units
#' of K) for which the `OH_a`, `OH_b`, and `OH_n` parameters are valid.}
#' \item{O3_k298}{Rate constant at 298 K for ozone reactions.}
#' \item{O3_uncert}{Uncertainty as a percentage for certain ozone reactions.}
#' \item{O3_u_fac}{Uncertainty as a plus/minus difference for certain ozone
#' reactions.}
#' \item{O3_a, O3_b, O3_n}{Extended temperature dependence parameters for
#' bimolecular ozone reactions, to be used in the Arrhenius expression:
#' `k(T)=A exp(-B/T) (T/300)^n`. In that, `A` is expressed as
#' cm^3 molecules^-1 s^-1, `B` is in units of K, and `n` is dimensionless. Any
#' `NA` values indicate that data is not available.}
#' \item{O3_t_low, O3_t_high}{The low and high temperature boundaries (in units
#' of K) for which the `O3_a`, `O3_b`, and `O3_n` parameters are valid.}
#' \item{NO3_k298}{Rate constant at 298 K for NO3 reactions.}
#' \item{NO3_uncert}{Uncertainty as a percentage for certain NO3 reactions.}
#' \item{NO3_u_fac}{Uncertainty as a plus/minus difference for certain NO3
#' reactions.}
#' \item{NO3_a, NO3_b, NO3_n}{Extended temperature dependence parameters for
#' bimolecular NO3 reactions, to be used in the Arrhenius expression:
#' `k(T)=A exp(-B/T) (T/300)^n`. In that, `A` is expressed as
#' cm^3 molecules^-1 s^-1, `B` is in units of K, and `n` is dimensionless. Any
#' `NA` values indicate that data is not available.}
#' \item{NO3_t_low, NO3_t_high}{The low and high temperature boundaries (in
#' units of K) for which the `NO3_a`, `NO3_b`, and `NO3_n` parameters are
#' valid.}
#' \item{Cl_k298}{Rate constant at 298 K for Cl reactions.}
#' \item{Cl_uncert}{Uncertainty as a percentage for certain Cl reactions.}
#' \item{Cl_u_fac}{Uncertainty as a plus/minus difference for certain Cl
#' reactions.}
#' \item{Cl_a, Cl_b, Cl_n}{Extended temperature dependence parameters for
#' bimolecular Cl reactions, to be used in the Arrhenius expression:
#' `k(T)=A exp(-B/T) (T/300)^n`. In that, `A` is expressed as
#' cm^3 molecules^-1 s^-1, `B` is in units of K, and `n` is dimensionless. Any
#' `NA` values indicate that data is not available.}
#' \item{Cl_t_low, Cl_t_high}{The low and high temperature boundaries (in units
#' of K) for which the `Cl_a`, `Cl_b`, and `Cl_n` parameters are valid.}
#' }
#'
#' @family datasets
#' @section Dataset ID and Badge:
#' DATA-14
#'
#' \if{html}{\out{
#' `r data_get_image_tag(file = "dataset_reactions.png")`
#' }}
#'
#' @section Dataset Introduced:
#' `v0.11.0` (July 9, 2024)
#'
#' @examples
#' dplyr::glimpse(reactions)
"reactions"

#' Data on photolysis rates for gas-phase organic compounds
#'
#' @description
#'
#' The `photolysis` dataset contains numerical values for describing the
#' photolytic degradation pathways of 25 compounds of relevance in atmospheric
#' chemistry. Many volatile organic compounds (VOCs) are emitted in substantial
#' quantities from both biogenic and anthropogenic sources, and they can have a
#' major influence on the chemistry of the lower atmosphere. A portion of these
#' can be transformed into other VOCs via the energy provided from light.
#'
#' In order to realistically predict the composition of the atmosphere and how
#' it evolves over time, we need accurate estimates of photolysis rates. The
#' data provided here in `photolysis` allows for computations of photolysis
#' rates (*J*, having units of `s^-1`) as a function of the solar zenith angle
#' (SZA). Having such values is essential when deploying atmospheric chemistry
#' models.
#'
#' @format A tibble with 34 rows and 10 variables:
#' \describe{
#' \item{compd_name}{The name of the primary compound undergoing photolysis.}
#' \item{cmpd_formula}{The chemical formula of the compound.}
#' \item{products}{A product pathway for the photolysis of the compound.}
#' \item{type}{The type of organic compound undergoing photolysis.}
#' \item{l, m, n}{The parameter values given in the `l`, `m`, and `n` columns
#' can be used to calculate the photolysis rate (*J*) as a function of the
#' solar zenith angle (*X*, in radians) through the expression:
#' `J = l * cos(X)^m * exp(-n * sec(X))`.}
#' \item{quantum_yield}{In the context of photolysis reactions, this is the
#' efficiency of a given photolytic reaction. In other words, it's the number of
#' product molecules formed over the number of photons absorbed.}
#' \item{wavelength_nm, sigma_298_cm2}{The `wavelength_nm` and `sigma_298_cm2`
#' columns provide photoabsorption data for the compound undergoing photolysis.
#' The values in `wavelength_nm` provide the wavelength of light in nanometer
#' units; the `sigma_298_cm2` values are paired with the `wavelength_nm` values
#' and they are in units of `cm^2 molecule^-1`.}
#' }
#'
#' @family datasets
#' @section Dataset ID and Badge:
#' DATA-15
#'
#' \if{html}{\out{
#' `r data_get_image_tag(file = "dataset_photolysis.png")`
#' }}
#'
#' @section Dataset Introduced:
#' `v0.11.0` (July 9, 2024)
#'
#' @examples
#' dplyr::glimpse(photolysis)
"photolysis"

#' Nuclide data
#'
#' @description
#'
#' The `nuclides` dataset contains information on all known nuclides, providing
#' data on nuclear structure and decay modes across 118 elements. There is data
#' here on natural abundances, atomic mass, spin, half-life, and more. The
#' typical users for such a dataset include researchers in fields such as
#' nuclear physics, radiochemistry, and nuclear medicine.
#'
#' @format A tibble with 3,383 rows and 29 variables:
#' \describe{
#' \item{nuclide}{The symbol for the nuclide.}
#' \item{z, n}{The number of protons and neutrons.}
#' \item{element}{The element symbol.}
#' \item{radius, radius_uncert}{The charge radius and its associated
#' uncertainty. In units of fm.}
#' \item{abundance, abundance_uncert}{The abundance of the stable isotope as
#' a mole fraction (in relation to other stable isotopes of the same element).
#' Values are provided for the nuclide only if `is_stable` is `TRUE`.}
#' \item{is_stable}{Is the nuclide a stable isotope?}
#' \item{half_life, half_life_uncert}{The nuclide's half life represented as
#' seconds.}
#' \item{isospin}{The isospin, or the quantum number related to the up and down
#' quark content of the particle.}
#' \item{decay_1, decay_2, decay_3}{The 1st, 2nd, and 3rd decay modes.}
#' \item{decay_1_pct, decay_1_pct_uncert, decay_2_pct, decay_2_pct_uncert,
#' decay_3_pct, decay_3_pct_uncert}{The branching proportions for the 1st, 2nd,
#' and 3rd decays (along with uncertainty values).}
#' \item{magnetic_dipole, magnetic_dipole_uncert}{The magnetic dipole and its
#' associated uncertainty. Expressed in units of micro N, or nuclear
#' magneton values.}
#' \item{electric_quadrupole, electric_quadrupole_uncert}{The electric
#' quadrupole and its associated uncertainty. In units of barn (b).}
#' \item{atomic_mass, atomic_mass_uncert}{The atomic mass and its associated
#' uncertainty. In units of micro AMU.}
#' \item{mass_excess, mass_excess_uncert}{The mass excess and its associated
#' uncertainty. In units of keV.}
#' }
#'
#' @family datasets
#' @section Dataset ID and Badge:
#' DATA-16
#'
#' \if{html}{\out{
#' `r data_get_image_tag(file = "dataset_nuclides.png")`
#' }}
#'
#' @section Dataset Introduced:
#' `v0.11.0` (July 9, 2024)
#'
#' @examples
#' dplyr::glimpse(nuclides)
"nuclides"

#' An ADSL-flavored clinical trial toy dataset
#'
#' @description
#'
#' This tibble contains artificial data for 182 subjects of the `GT01` study.
#' Each row corresponds to demographic characteristics of a single trial
#' participant. Two out of 182 study participants were screen failures and
#' thus not treated, the rest of the study population was randomized with a
#' 1:1 ratio to receive either `"Placebo"` (as comparator) or `"Drug 1"`. The
#' dataset entails subject level demographics such as age, age group, sex,
#' ethnicity, and body mass index (BMI) at baseline, as well as an event
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
#' \item{STUDYID, STUDYIDN}{The unique study identifier and its numeric
#' version.}
#' \item{USUBJID}{The unique subject identifier.}
#' \item{TRTA, TRTAN}{The study intervention and its numeric version, which is
#' either `"Placebo"` (`1`), `"Drug 1"` (`2`) or `NA` (`3`), missing for
#' screen failures).}
#' \item{ITTFL}{Intent-to-Treat (ITT) population flag, where `"Y"` indicates
#' a subject belongs to the ITT population and `"N"` indicates a subject is not
#' in the ITT population.}
#' \item{RANDFL}{Randomization flag, where `"Y"` indicates a subject was
#' randomized to receive either `"Placebo"` or `"Drug 1"` and `"N"` indicates
#' a subject was not randomized at all.}
#' \item{SCRFREAS}{The reason for screen failure. This is either missing
#' (`""`) for non-screen failure subjects or indicates the reason for screen
#' failure}
#' \item{AGE}{The age of a subject at baseline in years.}
#' \item{AAGEGR1}{The analysis age group, indicating if a subject was strictly
#' younger than 40 years at baseline or older.}
#' \item{SEX}{Sex of a subject. Can be either `"Male"`, `"Female"` or
#' `"Undifferentiated"`.}
#' \item{ETHNIC}{Ethnicity of a subject. Can be either `"Hispanic or Latino"`,
#' `"Not Hispanic or Latino"` or missing (`""`).}
#' \item{BLBMI}{Body Mass Index (BMI) of a subject at baseline in kg/m2.}
#' \item{EVNTFL}{Event Flag. Indicates whether the subject experienced a
#' specific event during the course of the study or not. Can be either `"Y"` (if
#' if the subject had the event) or `"N"`.}
#' }
#'
#' @family datasets
#' @section Dataset ID and Badge:
#' DATA-17
#'
#' \if{html}{\out{
#' `r data_get_image_tag(file = "dataset_rx_adsl.png")`
#' }}
#'
#' @section Dataset Introduced:
#' `v0.9.0` (Mar 31, 2023)
#'
#' @examples
#' dplyr::glimpse(rx_adsl)
"rx_adsl"

#' An ADDV-flavored clinical trial toy dataset
#'
#' @description
#'
#' This tibble contains artificial protocol deviation data for 180 subjects
#' in the Intent-to-Treat (ITT) population of the `GT01` study. The dataset
#' contains the usual parameters (`PARAM`, `PARAMCD`) for an addv. There is
#' summary parameter (`PARCAT1 == "OVERALL"`) for each subject of the `GT01`
#' ITT-population, indicating whether or not at least one major protocol
#' deviation (PD) occurred throughout the course of the study for the respective
#' subject. Individual records for protocol deviations per subject exist,
#' indicating which specific type of PD occurred. The additional flag `CRIT1FL`,
#' shows whether a PD was related to COVID-19 or not.
#'
#' Although the data was intentionally created to mimic a typical clinical
#' trial dataset following the CDISC format, it might not strictly comply
#' with CDISC ADaM rules. The intent is to showcase the workflow for clinical
#' table creation rather than creating a fully CDISC-compliant ADaM dataset.
#'
#' @format A tibble with 291 rows and 20 variables:
#' \describe{
#' \item{STUDYID, STUDYIDN}{The unique study identifier and its numeric
#' version.}
#' \item{USUBJID}{The unique subject identifier.}
#' \item{TRTA, TRTAN}{The study intervention and its numeric version, which is
#' either `"Placebo"` (`1`), `"Drug 1"` (`2`), or `NA` (`3`), missing for
#' screen failures).}
#' \item{ITTFL}{Intent-to-Treat (ITT) population flag, where `"Y"` indicates
#' a subject belongs to the ITT population and `"N"` indicates a subject is not
#' in the ITT population.}
#' \item{AGE}{The age of a subject at baseline in years.}
#' \item{AAGEGR1}{The analysis age group, indicating if a subject was strictly
#' younger than 40 years at baseline or older.}
#' \item{SEX}{Sex of a subject. Can be either `"Male"`, `"Female"` or
#' `"Undifferentiated"`.}
#' \item{ETHNIC}{Ethnicity of a subject. Can be either `"Hispanic or Latino"`,
#' `"Not Hispanic or Latino"` or missing (`""`).}
#' \item{BLBMI}{Body Mass Index (BMI) of a subject at baseline in kg/m2.}
#' \item{DVTERM}{The Protocol Deviation Term.}
#' \item{PARAMCD, PARAM}{The Parameter Code and decoded parameter description
#' for the protocol deviation.}
#' \item{PARCAT1}{Parameter category. Can be `"OVERALL"` for derived PD
#' summaries or `"PROTOCOL DEVIATION"` for individual PDs.}
#' \item{DVCAT}{Category for PD, indicating whether the PD is a major one or
#' not.}
#' \item{ACAT1}{Analysis category 1. Only populated for individual PDs, not for
#' summary scores. High level category for PDs.}
#' \item{AVAL}{Analysis Value. Either `0` or `1`.}
#' \item{CRIT1, CRIT1FL}{Analysis Criterion 1 and analysis criterion 1 flag,
#' indicating whether PD is related to COVID-19 or not.}
#' }
#'
#' @family datasets
#' @section Dataset ID and Badge:
#' DATA-18
#'
#' \if{html}{\out{
#' `r data_get_image_tag(file = "dataset_rx_addv.png")`
#' }}
#'
#' @section Dataset Introduced:
#' `v0.9.0` (Mar 31, 2023)
#'
#' @examples
#' dplyr::glimpse(rx_addv)
"rx_addv"
