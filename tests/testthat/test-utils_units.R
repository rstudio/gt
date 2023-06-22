generate_html_units <- function(input) {
  input %>% generate_token_list() %>% units_to_html()
}

test_that("Units are rendered properly in HTML", {

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
  expect_equal(
    generate_html_units("m_0 s"),
    "m<span style=\"white-space:nowrap;\"><sub>0</sub></span> s"
  )
  expect_equal(
    generate_html_units("m_0 s_1"),
    "m<span style=\"white-space:nowrap;\"><sub>0</sub></span> s<span style=\"white-space:nowrap;\"><sub>1</sub></span>"
  )
  expect_equal(
    generate_html_units("m_0^2 s_1"),
    "m<span style=\"white-space:nowrap;\"><sub>0</sub></span><span style=\"white-space:nowrap;\"><sup>2</sup></span> s<span style=\"white-space:nowrap;\"><sub>1</sub></span>"
  )
  expect_equal(
    generate_html_units("m[_0^2]"),
    "m<span style=\"display:inline-block;line-height:1em;text-align:left;font-size:60%;vertical-align:-0.25em;margin-left:0.1em;\">2<br>0</span>"
  )
  expect_equal(
    generate_html_units("x10^-3"),
    "&times;10<span style=\"white-space:nowrap;\"><sup>&minus;3</sup></span>"
  )
  expect_equal(
    generate_html_units("( W / m^2 )"),
    "(W / m<span style=\"white-space:nowrap;\"><sup>2</sup></span>)"
  )
  expect_equal(
    generate_html_units("[ W / m^2 ]"),
    "[W / m<span style=\"white-space:nowrap;\"><sup>2</sup></span>]"
  )
})
