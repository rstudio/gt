test_that("fmt_markdown() works correctly", {

  # Create a few Markdown-based text snippets
  text_1a <- "
This is Markdown *text*.

Markdown’s syntax is comprised entirely of
punctuation characters, which punctuation
characters have been carefully chosen so as
to look like what they mean...  assuming
you’ve ever used email.
"

  text_1b <- "
Info on Markdown syntax can be found
[here](https://daringfireball.net/projects/markdown/).
"

  text_2a <- "
The **gt** package has these datasets:

 - `countrypops`
 - `sza`
 - `gtcars`
 - `sp500`
 - `pizzaplace`
 - `exibble`
"

  text_2b <- "
There's a quick reference [here](https://commonmark.org/help/).
"
  # Create a `gt_tbl` object with `gt()`
  # and a tibble; format all columns with
  # `fmt_markdown()`
  tab <-
    dplyr::tribble(
      ~column_1, ~column_2,
      text_1a,   text_2a,
      text_1b,   text_2b
    ) |>
    gt() |>
    fmt_markdown(columns = everything())

  # Expect that the object has the correct classes
  expect_s3_class(tab, c("gt_tbl", "data.frame"))

  # Expect an error when attempting to format a column
  # that does not exist
  expect_error(tab |> fmt_markdown(columns = "column_3"))

  #
  # Compare output of each table cell to the expected
  # HTML output strings
  #
  expect_equal(
    (tab |>
       render_formats_test(context = "html"))[["column_1"]][[1]],
    paste0(
      "<span class='gt_from_md'>This is Markdown <em>text</em>",
      ".</p>\n<p>Markdown’s syntax is comprised entirely of\npunctuation ",
      "characters, which punctuation\ncharacters have been carefully chosen ",
      "so as\nto look like what they mean…  assuming\nyou’ve ever ",
      "used email.</span>"
    )
  )

  expect_equal(
    (tab |>
       render_formats_test(context = "html"))[["column_1"]][[2]],
    paste0(
      "<span class='gt_from_md'>Info on Markdown syntax can be ",
      "found\n<a href=\"https://daringfireball.net/projects/markdown/\">",
      "here</a>.</span>"
    )
  )

  expect_equal(
    (tab |>
       render_formats_test(context = "html"))[["column_2"]][[1]],
    paste0(
      "<span class='gt_from_md'>The <strong>gt</strong> package has ",
      "these datasets:</p>\n<ul>\n<li><code>countrypops</code></li>\n<li>",
      "<code>sza</code></li>\n<li><code>gtcars</code></li>\n<li><code>sp500",
      "</code></li>\n<li><code>pizzaplace</code></li>\n<li><code>exibble",
      "</code></li>\n</ul>\n</span>"
    )
  )

  expect_equal(
    (tab |>
       render_formats_test(context = "html"))[["column_2"]][[2]],
      "<span class='gt_from_md'>There’s a quick reference <a href=\"https://commonmark.org/help/\">here</a>.</span>"
  )
})

test_that("LaTeX formulas render correctly in HTML", {

  gt_tbl <-
    dplyr::tibble(
      idx = 1:37,
      l_time_domain =
        c(
          "$1$",
          "${{\\bf{e}}^{a\\,t}}$",
          "${t^n},\\,\\,\\,\\,\\,n = 1,2,3, \\ldots$",
          "${t^p}, p > -1$",
          "$\\sqrt t$",
          "${t^{n - \\frac{1}{2}}},\\,\\,\\,\\,\\,n = 1,2,3, \\ldots$",
          "$\\sin \\left( {at} \\right)$",
          "$\\cos \\left( {at} \\right)$",
          "$t\\sin \\left( {at} \\right)$",
          "$t\\cos \\left( {at} \\right)$",
          "$\\sin \\left( {at} \\right) - at\\cos \\left( {at} \\right)$",
          "$\\sin \\left( {at} \\right) + at\\cos \\left( {at} \\right)$",
          "$\\cos \\left( {at} \\right) - at\\sin \\left( {at} \\right)$",
          "$\\cos \\left( {at} \\right) + at\\sin \\left( {at} \\right)$",
          "$\\sin \\left( {at + b} \\right)$",
          "$\\cos \\left( {at + b} \\right)$",
          "$\\sinh \\left( {at} \\right)$",
          "$\\cosh \\left( {at} \\right)$",
          "${{\\bf{e}}^{at}}\\sin \\left( {bt} \\right)$",
          "${{\\bf{e}}^{at}}\\cos \\left( {bt} \\right)$",
          "${{\\bf{e}}^{at}}\\sinh \\left( {bt} \\right)$",
          "${{\\bf{e}}^{at}}\\cosh \\left( {bt} \\right)$",
          "${t^n}{{\\bf{e}}^{at}},\\,\\,\\,\\,\\,n = 1,2,3, \\ldots$",
          "$f\\left( {ct} \\right)$",
          "${u_c}\\left( t \\right) = u\\left( {t - c} \\right)$",
          "$\\delta \\left( {t - c} \\right)$",
          "${u_c}\\left( t \\right)f\\left( {t - c} \\right)$",
          "${u_c}\\left( t \\right)g\\left( t \\right)$",
          "${{\\bf{e}}^{ct}}f\\left( t \\right)$",
          "${t^n}f\\left( t \\right),\\,\\,\\,\\,\\,n = 1,2,3, \\ldots$",
          "$\\displaystyle \\frac{1}{t}f\\left( t \\right)$",
          "$\\displaystyle \\int_{{\\,0}}^{{\\,t}}{{\\,f\\left( v \\right)\\,dv}}$",
          "$\\displaystyle \\int_{{\\,0}}^{{\\,t}}{{f\\left( {t - \\tau } \\right)g\\left( \\tau  \\right)\\,d\\tau }}$",
          "$f\\left( {t + T} \\right) = f\\left( t \\right)$",
          "$f'\\left( t \\right)$",
          "$f''\\left( t \\right)$",
          "${f^{\\left( n \\right)}}\\left( t \\right)$"
        ),
      l_laplace_s_domain =
        c(
          "$$\\frac{1}{s}$$",
          "$$\\frac{1}{{s - a}}$$",
          "$$\\frac{{n!}}{{{s^{n + 1}}}}$$",
          "$$\\frac{{\\Gamma \\left( {p + 1} \\right)}}{{{s^{p + 1}}}}$$",
          "$$\\frac{{\\sqrt \\pi }}{{2{s^{\\frac{3}{2}}}}}$$",
          "$$\\frac{{1 \\cdot 3 \\cdot 5 \\cdots \\left( {2n - 1} \\right)\\sqrt \\pi }}{{{2^n}{s^{n + \\frac{1}{2}}}}}$$",
          "$$\\frac{a}{{{s^2} + {a^2}}}$$",
          "$$\\frac{s}{{{s^2} + {a^2}}}$$",
          "$$\\frac{{2as}}{{{{\\left( {{s^2} + {a^2}} \\right)}^2}}}$$",
          "$$\\frac{{{s^2} - {a^2}}}{{{{\\left( {{s^2} + {a^2}} \\right)}^2}}}$$",
          "$$\\frac{{2{a^3}}}{{{{\\left( {{s^2} + {a^2}} \\right)}^2}}}$$",
          "$$\\frac{{2a{s^2}}}{{{{\\left( {{s^2} + {a^2}} \\right)}^2}}}$$",
          "$$\\frac{{s\\left( {{s^2} - {a^2}} \\right)}}{{{{\\left( {{s^2} + {a^2}} \\right)}^2}}}$$",
          "$$\\frac{{s\\left( {{s^2} + 3{a^2}} \\right)}}{{{{\\left( {{s^2} + {a^2}} \\right)}^2}}}$$",
          "$$\\frac{{s\\sin \\left( b \\right) + a\\cos \\left( b \\right)}}{{{s^2} + {a^2}}}$$",
          "$$\\frac{{s\\cos \\left( b \\right) - a\\sin \\left( b \\right)}}{{{s^2} + {a^2}}}$$",
          "$$\\frac{a}{{{s^2} - {a^2}}}$$",
          "$$\\frac{s}{{{s^2} - {a^2}}}$$",
          "$$\\frac{b}{{{{\\left( {s - a} \\right)}^2} + {b^2}}}$$",
          "$$\\frac{{s - a}}{{{{\\left( {s - a} \\right)}^2} + {b^2}}}$$",
          "$$\\frac{b}{{{{\\left( {s - a} \\right)}^2} - {b^2}}}$$",
          "$$\\frac{{s - a}}{{{{\\left( {s - a} \\right)}^2} - {b^2}}}$$",
          "$$\\frac{{n!}}{{{{\\left( {s - a} \\right)}^{n + 1}}}}$$",
          "$$\\frac{1}{c}F\\left( {\\frac{s}{c}} \\right)$$",
          "$$\\frac{{{{\\bf{e}}^{ - cs}}}}{s}$$",
          "${{\\bf{e}}^{ - cs}}$",
          "${{\\bf{e}}^{ - cs}}F\\left( s \\right)$",
          "${{\\bf{e}}^{ - cs}}{\\mathcal{L}}\\left\\{ {g\\left( {t + c} \\right)} \\right\\}$",
          "$F\\left( {s - c} \\right)$",
          "${\\left( { - 1} \\right)^n}{F^{\\left( n \\right)}}\\left( s \\right)$",
          "$\\int_{{\\,s}}^{{\\,\\infty }}{{F\\left( u \\right)\\,du}}$",
          "$\\displaystyle \\frac{{F\\left( s \\right)}}{s}$",
          "$F\\left( s \\right)G\\left( s \\right)$",
          "$\\displaystyle \\frac{{\\displaystyle \\int_{{\\,0}}^{{\\,T}}{{{{\\bf{e}}^{ - st}}f\\left( t \\right)\\,dt}}}}{{1 - {{\\bf{e}}^{ - sT}}}}$",
          "$sF\\left( s \\right) - f\\left( 0 \\right)$",
          "${s^2}F\\left( s \\right) - sf\\left( 0 \\right) - f'\\left( 0 \\right)$",
          "${s^n}F\\left( s \\right) - {s^{n - 1}}f\\left( 0 \\right) - {s^{n - 2}}f'\\left( 0 \\right) \\cdots - s{f^{\\left( {n - 2} \\right)}}\\left( 0 \\right) - {f^{\\left( {n - 1} \\right)}}\\left( 0 \\right)$"
        )
    ) |>
    gt(rowname_col = "idx") |>
    fmt_markdown() |>
    cols_label(
      l_time_domain = md("Time Domain<br/>$\\small{f\\left( t \\right) = {\\mathcal{L}^{\\,\\, - 1}}\\left\\{ {F\\left( s \\right)} \\right\\}}$"),
      l_laplace_s_domain = md("$s$ Domain<br/>$\\small{F\\left( s \\right) = \\mathcal{L}\\left\\{ {f\\left( t \\right)} \\right\\}}$")
    ) |>
    tab_header(
      title = md("A Table of Laplace Transforms &mdash; $\\small{{\\mathcal{L}}}$"),
      subtitle = md("The most commonly used Laplace transforms and formulas.<br/><br/>")
    ) |>
    tab_source_note(
      source_note = md("The hyperbolic functions: $\\cosh \\left( t \\right) = \\frac{{{{\\bf{e}}^t} + {{\\bf{e}}^{ - t}}}}{2}$ , $\\sinh \\left( t \\right) = \\frac{{{{\\bf{e}}^t} - {{\\bf{e}}^{ - t}}}}{2}$")
    ) |>
    cols_align(align = "center") |>
    opt_align_table_header(align = "left") |>
    tab_footnote(
      footnote = "The Heaviside Function.",
      locations = cells_body(
        columns = l_time_domain, rows = 25
      )
    ) |>
    tab_footnote(
      footnote = "The Dirac Delta Function.",
      locations = cells_body(
        columns = l_time_domain, rows = 26
      )
    ) |>
    opt_footnote_spec(spec_ref = "b[x]") |>
    cols_width(
      idx ~ px(50),
      l_time_domain ~ px(300),
      l_laplace_s_domain ~ px(600)
    ) |>
    opt_stylize(
      style = 2,
      color = "gray",
      add_row_striping = FALSE
    ) |>
    opt_table_outline(style = "invisible") |>
    tab_style(
      style = cell_fill(color = "gray95"),
      locations = cells_body(columns = l_time_domain)
    ) |>
    tab_options(
      heading.title.font.size = px(32),
      heading.subtitle.font.size = px(18),
      heading.padding = px(0),
      footnotes.multiline = FALSE,
      column_labels.border.lr.style = "solid",
      column_labels.border.lr.width = px(1)
    )

  expect_snapshot(gt_tbl$`_boxhead`$column_label)

  skip_if_not_installed("katex", "1.4.1")

  strip_katex_version <- function(x) {
    gsub("katex\\@[\\.\\d]+", "katex@<latest>", x, perl = TRUE)
  }

  # Take a snapshot of `gt_tbl`
  expect_snapshot_html(gt_tbl, transform = strip_katex_version)
})

test_that("fmt_markdown() works correctly with factors", {

  text <- "This is Markdown *text*."

  # Create a `gt_tbl` object with `gt()`
  # and a tibble; format all columns with
  # `fmt_markdown()`
  tab <-
    dplyr::tibble(column_1 = factor(text)) |>
    gt() |>
    fmt_markdown(columns = everything())

  # Compare output of cell to the expected HTML output strings
  expect_equal(
    (tab |> render_formats_test(context = "html"))[["column_1"]][[1]],
    "<span class='gt_from_md'>This is Markdown <em>text</em>.</span>"
  )
})
