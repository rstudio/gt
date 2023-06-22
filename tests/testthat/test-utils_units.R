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
    generate_html_units("m a.s.l."),
    "m a.s.l."
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
    generate_html_units("ng m^−3 Na^+"),
    "ng m<span style=\"white-space:nowrap;\"><sup>−3</sup></span> Na<span style=\"white-space:nowrap;\"><sup>+</sup></span>"
  )
  expect_equal(
    generate_html_units("ng m^−3 *total salt*"),
    "ng m<span style=\"white-space:nowrap;\"><sup>−3</sup></span> *total salt*"
  )
  expect_equal(
    generate_html_units("5.5 :plusminus: 7.2 ng m^−3"),
    "5.5 &plusmn; 7.2 ng m<span style=\"white-space:nowrap;\"><sup>−3</sup></span>"
  )
  expect_equal(
    generate_html_units("10^−12 cm^3 molecule^−1 s^−1"),
    "10<span style=\"white-space:nowrap;\"><sup>−12</sup></span> cm<span style=\"white-space:nowrap;\"><sup>3</sup></span> molecule<span style=\"white-space:nowrap;\"><sup>−1</sup></span> s<span style=\"white-space:nowrap;\"><sup>−1</sup></span>"
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
  expect_equal(
    generate_html_units("SO[_4^2-] **h** 3"),
    "SO<span style=\"display:inline-block;line-height:1em;text-align:left;font-size:60%;vertical-align:-0.25em;margin-left:0.1em;\">2&minus;<br>4</span> **h** 3"
  )
  expect_equal(
    generate_html_units("-2a"),
    "&minus;2a"
  )
  expect_equal(
    generate_html_units("um / s"),
    "&micro;m / s"
  )
  expect_equal(
    generate_html_units("um^2 /s"),
    "&micro;m<span style=\"white-space:nowrap;\"><sup>2</sup></span> s<span style=\"white-space:nowrap;\"><sup>&minus;1</sup></span>"
  )
  expect_equal(
    generate_html_units(":micro:N"),
    "&micro;N"
  )
  expect_equal(
    generate_html_units(":mu:J /min"),
    "&micro;J min<span style=\"white-space:nowrap;\"><sup>&minus;1</sup></span>"
  )
  expect_equal(
    generate_html_units(":micro:g m^−3 NO_*x*"),
    "&micro;g m<span style=\"white-space:nowrap;\"><sup>−3</sup></span> NO<span style=\"white-space:nowrap;\"><sub>*x*</sub></span>"
  )
  expect_equal(
    generate_html_units(":micro:gC /g /h"),
    "&micro;gC g<span style=\"white-space:nowrap;\"><sup>&minus;1</sup></span> h<span style=\"white-space:nowrap;\"><sup>&minus;1</sup></span>"
  )
  expect_equal(
    generate_html_units("ug C /g /h"),
    "&micro;g C g<span style=\"white-space:nowrap;\"><sup>&minus;1</sup></span> h<span style=\"white-space:nowrap;\"><sup>&minus;1</sup></span>"
  )
  expect_equal(
    generate_html_units("J / degC"),
    "J / &degree;C"
  )
  expect_equal(
    generate_html_units("1 / degF"),
    "1 / &degree;F"
  )
  expect_equal(
    generate_html_units("25:degree:C"),
    "25&degree;C"
  )
  expect_equal(
    generate_html_units(":degree:N"),
    "&degree;N"
  )
  expect_equal(
    generate_html_units(":angstrom: / s"),
    "&#8491; / s"
  )
  expect_equal(
    generate_html_units(":permil:"),
    "&permil;"
  )
  expect_equal(
    generate_html_units(":permille:"),
    "&permil;"
  )
  expect_equal(
    generate_html_units("*:permil:*"),
    "*&permil;*"
  )
  expect_equal(
    generate_html_units("3:times:3"),
    "3&times;3"
  )
  expect_equal(
    generate_html_units("1:5"),
    "1:5"
  )
  expect_equal(
    generate_html_units("{{ [ kg kg^-1 ] }}"),
    "[kg kg<span style=\"white-space:nowrap;\"><sup>&minus;1</sup></span>]"
  )
  expect_equal(
    generate_html_units("{{[ kg kg^-1 ]}}"),
    "[kg kg<span style=\"white-space:nowrap;\"><sup>&minus;1</sup></span>]"
  )
  expect_equal(
    generate_html_units(":mu:mol %C25H52% / :micro:L"),
    "&micro;mol C<span style=\"white-space:nowrap;\"><sub>25</sub></span>H<span style=\"white-space:nowrap;\"><sub>52</sub></span> / &micro;L"
  )
  expect_equal(
    generate_html_units("mol %Ca3(PO4)2%"),
    "mol Ca<span style=\"white-space:nowrap;\"><sub>3</sub></span>(PO<span style=\"white-space:nowrap;\"><sub>4</sub></span>)<span style=\"white-space:nowrap;\"><sub>2</sub></span>"
  )
})
