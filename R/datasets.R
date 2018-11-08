#' Yearly populations of countries from 1960 to 2017
#'
#' A dataset that presents yearly, total populations of countries. Total
#' population is based on counts of all residents regardless of legal status or
#' citizenship. Country identifiers include the English-language country names,
#' and the 2- and 3-letter ISO 3166-1 country codes. Each row contains a
#' \code{population} value for a given \code{year} (from 1960 to 2017). Any
#' \code{NA} values for \code{populations} indicate the non-existence of the
#' country during that year.
#'
#' @format A tibble with 12470 rows and 5 variables:
#' \describe{
#'   \item{country_name}{Name of the country}
#'   \item{country_code_2}{The 2-letter ISO 3166-1 country code}
#'   \item{country_code_3}{The 3-letter ISO 3166-1 country code}
#'   \item{year}{The year for the population estimate}
#'   \item{population}{The population estimate, midway through the year}
#' }
#'
#' @source \url{https://data.worldbank.org/indicator/SP.POP.TOTL}
"countrypops"

#' Deluxe automobiles from the 2014-2017 period
#'
#' Expensive and fast cars. Not your father's \code{mtcars}. Each row describes
#' a car of a certain make, model, year, and trim. Basic specifications such as
#' horsepower, torque, EPA MPG ratings, type of drivetrain, and transmission
#' characteristics are provided. The country of origin for the car manufacturer
#' is also given.
#'
#' @format A tibble with 47 rows and 15 variables:
#' \describe{
#'   \item{mfr}{The name of the car manufacturer}
#'   \item{model}{The car's model name}
#'   \item{year}{The car's model year}
#'   \item{trim}{A short description of the car model's trim}
#'   \item{bdy_style}{An identifier of the car's body style, which is either
#'   \code{coupe}, \code{convertible}, \code{sedan}, or \code{hatchback}}
#'   \item{hp,hp_rpm}{The car's horsepower and the associated RPM level}
#'   \item{trq,trq_rpm}{The car's torque and the associated RPM level}
#'   \item{mpg_c,mpg_h}{The miles per gallon fuel efficiency rating for city
#'   and highway driving}
#'   \item{drivetrain}{The car's drivetrain which, for this dataset is either
#'   \code{rwd} (Rear Wheel Drive) or \code{awd} (All Wheel Drive)}
#'   \item{trsmn}{The codified transmission type, where the number part is
#'   the number of gears; the car could have automatic transmission
#'   (\code{a}), manual transmission (\code{m}), an option to switch between
#'   both types (\code{am}), or, direct drive (\code{dd})}
#'   \item{ctry_origin}{The country name for where the vehicle manufacturer
#'   is headquartered}
#' }
#'
#' @source Various pages within \url{https://www.edmunds.com}.
"gtcars"

#' A year of pizza sales from a pizza place
#'
#' A synthetic dataset that describes pizza sales for a pizza place
#' somewhere in the US. While the contents are artificial, the
#' ingredients used to make the pizzas are far from it. There are 32
#' different pizzas that fall into 4 different categories: \code{classic}
#' (classic pizzas: 'You probably had one like it before, but never like
#' this!'), \code{chicken} (pizzas with chicken as a major ingredient: 'Try
#' the Southwest Chicken Pizza! You'll love it!'), \code{supreme} (pizzas
#' that try a little harder: 'My Soppressata pizza uses only the finest
#' salami from my personal salumist!'), and, \code{veggie} (pizzas without
#' any meats whatsoever: 'My Five Cheese pizza has so many cheeses, I can
#' only offer it in Large Size!').
#'
#' @format A tibble with 49574 rows and 7 variables:
#' \describe{
#'   \item{id}{The ID for the order, which consists of one or more pizzas
#'   at a give \code{date} and \code{time}}
#'   \item{date}{A character representation of the \code{order} date,
#'   expressed in the ISO 8601 date format (YYYY-MM-DD)}
#'   \item{date}{A character representation of the \code{order} time,
#'   expressed as a 24-hour time the ISO 8601 extended time format
#'   (hh:mm:ss)}
#'   \item{name}{The short name for the pizza}
#'   \item{size}{The size of the pizza, which can either be \code{S},
#'   \code{M}, \code{L}, \code{XL} (rare!), or \code{XXL} (even rarer!);
#'   most pizzas are available in the \code{S}, \code{M}, and \code{L} sizes
#'   but exceptions apply}
#'   \item{type}{The category or type of pizza, which can either be
#'   \code{classic}, \code{chicken}, \code{supreme}, or \code{veggie}}
#'   \item{price}{The price of the pizza and the amount that it sold for
#'   (in USD)}
#' }
"pizzaplace"
