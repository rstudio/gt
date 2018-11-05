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
