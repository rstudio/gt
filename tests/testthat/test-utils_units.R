generate_html_units <- function(input) {
  input %>% generate_token_list() %>% units_to_html()
}

test_that("Units are rendered properly", {

  expect_equal(
    generate_html_units("{{ kg }}"),
    "kg"
  )
  expect_equal(
    generate_html_units("kg"),
    "kg"
  )
  expect_equal(
    generate_html_units("kg m"),
    "kg m"
  )
  expect_equal(
    generate_html_units("kg m^2"),
    "kg m<span style=\"white-space:nowrap;\"><sup>2</sup></span>"
  )
  expect_equal(
    generate_html_units("m^2 kg"),
    "m<span style=\"white-space:nowrap;\"><sup>2</sup></span> kg"
  )
  expect_equal(
    generate_html_units("m^-2 kg"),
    "m<span style=\"white-space:nowrap;\"><sup>&minus;2</sup></span> kg"
  )
  expect_equal(
    generate_html_units("/m kg"),
    "m<span style=\"white-space:nowrap;\"><sup>&minus;1</sup></span> kg"
  )
  expect_equal(
    generate_html_units("m / kg"),
    "m / kg"
  )
  expect_equal(
    generate_html_units("m/kg"),
    "m/kg"
  )
  expect_equal(
    generate_html_units("m/ kg"),
    "m/ kg"
  )
  expect_equal(
    generate_html_units("m + kg"),
    "m + kg"
  )
  expect_equal(
    generate_html_units("m^2.3563"),
    "m<span style=\"white-space:nowrap;\"><sup>2.3563</sup></span>"
  )
  expect_equal(
    generate_html_units("m^8.23a"),
    "m<span style=\"white-space:nowrap;\"><sup>8.23a</sup></span>"
  )
  expect_equal(
    generate_html_units("{{ N m /kg m^-2 }}"),
    "N m kg<span style=\"white-space:nowrap;\"><sup>&minus;1</sup></span> m<span style=\"white-space:nowrap;\"><sup>&minus;2</sup></span>"
  )
})
