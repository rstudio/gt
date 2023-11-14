skip_on_cran()
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
    escape_latex("\\^~&%$#_{}"),
    "\\textbackslash{}\\textasciicircum{}\\textasciitilde{}\\&\\%\\$\\#\\_\\{\\}"
  )
  expect_equal(
    escape_latex(" \\ ^ ~ & % $ # _ { } "),
    " \\textbackslash{} \\textasciicircum{} \\textasciitilde{} \\& \\% \\$ \\# \\_ \\{ \\} "
  )
  expect_equal(
    escape_latex("A\\B^C~D&E%F$G#H_I{J}K"),
    "A\\textbackslash{}B\\textasciicircum{}C\\textasciitilde{}D\\&E\\%F\\$G\\#H\\_I\\{J\\}K"
  )

  expect_equal(
    escape_latex(c("\\", "^", "~", "&", "%", "$", "#", "_", "{", "}")),
    c(
      "\\textbackslash{}", "\\textasciicircum{}", "\\textasciitilde{}",
      "\\&", "\\%", "\\$", "\\#", "\\_", "\\{", "\\}"
    )
  )
})
