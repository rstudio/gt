generate_html_units <- function(input) {
  input %>% define_units() %>% render_units(context = "html")
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
    "m/kg"
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
    generate_html_units("*m*_0 s"),
    "<em>m</em><span style=\"white-space:nowrap;\"><sub>0</sub></span> s"
  )
  expect_equal(
    generate_html_units("*m*_*0* s"),
    "<em>m</em><span style=\"white-space:nowrap;\"><sub><em>0</em></sub></span> s"
  )
  expect_equal(
    generate_html_units("*m*_*0*^2.3 s"),
    "<em>m</em><span style=\"white-space:nowrap;\"><sub><em>0</em></sub></span><span style=\"white-space:nowrap;\"><sup>2.3</sup></span> s"
  )
  expect_equal(
    generate_html_units("*m*_*0*^*n+2* s"),
    "<em>m</em><span style=\"white-space:nowrap;\"><sub><em>0</em></sub></span><span style=\"white-space:nowrap;\"><sup><em>n+2</em></sup></span> s"
  )
  expect_equal(
    generate_html_units("m a.s.l."),
    "m a.s.l."
  )
  expect_equal(
    generate_html_units("degC"),
    "°C"
  )
  expect_equal(
    generate_html_units("degF"),
    "°F"
  )
  expect_equal(
    generate_html_units(":degree:F"),
    "°F"
  )
  expect_equal(
    generate_html_units(":degrees:F"),
    "°F"
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
  expect_true(
    grepl(
      "ng m<span style=\"white-space:nowrap;\"><sup>.3</sup></span>.*?<em>total.*?salt</em>",
      generate_html_units("ng m^−3 *total:space:salt*")
    )
  )
  expect_equal(
    generate_html_units("5.5 :plusminus: 7.2 ng m^−3"),
    "5.5 ± 7.2 ng m<span style=\"white-space:nowrap;\"><sup>−3</sup></span>"
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
    "×10<span style=\"white-space:nowrap;\"><sup>&minus;3</sup></span>"
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
    "SO<span style=\"display:inline-block;line-height:1em;text-align:left;font-size:60%;vertical-align:-0.25em;margin-left:0.1em;\">2&minus;<br>4</span> <strong>h</strong> 3"
  )
  expect_equal(
    generate_html_units("-2a"),
    "−2a"
  )
  expect_equal(
    generate_html_units("um / s"),
    "µm/s"
  )
  expect_equal(
    generate_html_units("um^2 /s"),
    "µm<span style=\"white-space:nowrap;\"><sup>2</sup></span> s<span style=\"white-space:nowrap;\"><sup>&minus;1</sup></span>"
  )
  expect_equal(
    generate_html_units(":micro:N"),
    "µN"
  )
  expect_equal(
    generate_html_units(":mu:J /min"),
    "µJ min<span style=\"white-space:nowrap;\"><sup>&minus;1</sup></span>"
  )
  expect_equal(
    generate_html_units(":micro:g m^−3 NO_*x*"),
    "µg m<span style=\"white-space:nowrap;\"><sup>−3</sup></span> NO<span style=\"white-space:nowrap;\"><sub><em>x</em></sub></span>"
  )
  expect_equal(
    generate_html_units(":micro:gC /g /h"),
    "µgC g<span style=\"white-space:nowrap;\"><sup>&minus;1</sup></span> h<span style=\"white-space:nowrap;\"><sup>&minus;1</sup></span>"
  )
  expect_equal(
    generate_html_units("ug C /g /h"),
    "µg C g<span style=\"white-space:nowrap;\"><sup>&minus;1</sup></span> h<span style=\"white-space:nowrap;\"><sup>&minus;1</sup></span>"
  )
  expect_equal(
    generate_html_units("ohm_i^2"),
    "Ω<span style=\"white-space:nowrap;\"><sub>i</sub></span><span style=\"white-space:nowrap;\"><sup>2</sup></span>"
  )
  expect_equal(
    generate_html_units(":ohm:_i^2"),
    "Ω<span style=\"white-space:nowrap;\"><sub>i</sub></span><span style=\"white-space:nowrap;\"><sup>2</sup></span>"
  )
  expect_equal(
    generate_html_units("m:ohm:_i^2"),
    "mΩ<span style=\"white-space:nowrap;\"><sub>i</sub></span><span style=\"white-space:nowrap;\"><sup>2</sup></span>"
  )
  expect_equal(
    generate_html_units("( GeV^2 / ( c^2 + 6) )^-2"),
    "(GeV<span style=\"white-space:nowrap;\"><sup>2</sup></span> / (c<span style=\"white-space:nowrap;\"><sup>2</sup></span> + 6))<span style=\"white-space:nowrap;\"><sup>&minus;2</sup></span>"
  )
  expect_equal(
    generate_html_units("J / degC"),
    "J/°C"
  )
  expect_equal(
    generate_html_units("1 / degF"),
    "1/°F"
  )
  expect_equal(
    generate_html_units("m / s"),
    "m/s"
  )
  expect_equal(
    generate_html_units("25:degree:C"),
    "25°C"
  )
  expect_equal(
    generate_html_units(":degree:N"),
    "°N"
  )
  expect_equal(
    generate_html_units(":angstrom: / s"),
    "Å/s"
  )
  expect_equal(
    generate_html_units(":permil:"),
    "‰"
  )
  expect_equal(
    generate_html_units(":permille:"),
    "‰"
  )
  expect_equal(
    generate_html_units("*:permil:*"),
    "<em>‰</em>"
  )
  expect_equal(
    generate_html_units("3:times:3"),
    "3×3"
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
    generate_html_units("umol %C25H52% / uL"),
    "µmol C<span style=\"white-space:nowrap;\"><sub>25</sub></span>H<span style=\"white-space:nowrap;\"><sub>52</sub></span> / µL"
  )
  expect_equal(
    generate_html_units(":mu:mol %C25H52% / :micro:L"),
    "µmol C<span style=\"white-space:nowrap;\"><sub>25</sub></span>H<span style=\"white-space:nowrap;\"><sub>52</sub></span> / µL"
  )
  expect_equal(
    generate_html_units("mol %Ca3(PO4)2%"),
    "mol Ca<span style=\"white-space:nowrap;\"><sub>3</sub></span>(PO<span style=\"white-space:nowrap;\"><sub>4</sub></span>)<span style=\"white-space:nowrap;\"><sub>2</sub></span>"
  )
  expect_equal(
    generate_html_units("mol %Ca3(PO4)2%"),
    "mol Ca<span style=\"white-space:nowrap;\"><sub>3</sub></span>(PO<span style=\"white-space:nowrap;\"><sub>4</sub></span>)<span style=\"white-space:nowrap;\"><sub>2</sub></span>"
  )
})
