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

