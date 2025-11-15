test_that("LaTeX escaping with `escape_latex()` works well", {

  expect_equal(escape_latex("\\"), "\\textbackslash{}")
  expect_equal(escape_latex("^"), "\\textasciicircum{}")
  expect_equal(escape_latex("~"), "\\textasciitilde{}")
  expect_equal(escape_latex("&"), "\\&")
  expect_equal(escape_latex("%"), "\\%")
  expect_equal(escape_latex("$"), "\\$")
  expect_equal(escape_latex("#"), "\\#")
  expect_equal(escape_latex("_"), "\\_")
  expect_equal(escape_latex("{"), "\\{")
  expect_equal(escape_latex("}"), "\\}")

  expect_equal(
    escape_latex("\\^~&%$#_{}", unicode_conversion = TRUE),
    "\\textbackslash{}\\textasciicircum{}\\textasciitilde{}\\&\\%\\$\\#\\_\\{\\}"
  )
  expect_equal(
    escape_latex(" \\ ^ ~ & % $ # _ { } ", unicode_conversion = TRUE),
    " \\textbackslash{} \\textasciicircum{} \\textasciitilde{} \\& \\% \\$ \\# \\_ \\{ \\} "
  )
  expect_equal(
    escape_latex("A\\B^C~D&E%F$G#H_I{J}K", unicode_conversion = TRUE),
    "A\\textbackslash{}B\\textasciicircum{}C\\textasciitilde{}D\\&E\\%F\\$G\\#H\\_I\\{J\\}K"
  )

  expect_equal(
    escape_latex(c("\\", "^", "~", "&", "%", "$", "#", "_", "{", "}"),unicode_conversion = TRUE),
    c(
      "\\textbackslash{}", "\\textasciicircum{}", "\\textasciitilde{}",
      "\\&", "\\%", "\\$", "\\#", "\\_", "\\{", "\\}"
    )
  )

})

test_that("LaTeX escaping with `escape_latex()` works, optionally setting unicode_conversion", {

  expect_equal(
    c(escape_latex("≥"),escape_latex("≥",unicode_conversion = TRUE)),
    c("≥", "{\\ensuremath{\\geq}}")
  )

  expect_equal(
    c(escape_latex("Chloé Laplantine"),escape_latex("Chloé Laplantine",unicode_conversion = TRUE)),
    c("Chloé Laplantine", "Chlo{\\'e} Laplantine")
  )
})
