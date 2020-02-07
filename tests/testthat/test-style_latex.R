context("LaTeX -- Ensuring that LaTeX styling works as expected")

# Create a shorter version of `mtcars`
mtcars_short <- mtcars[1:2, ]

test_that("latex bold text styling", {

  # Create a `tbl_latex` object with `gt()`; this table
  # all column labels are bolded
  tbl_gt <-
    gt(data = mtcars_short) %>%
    tab_header(title = "test title") %>%
    tab_style(style = list(cell_text(weight = 'bold')),
                                               locations = cells_column_labels(columns = everything())) %>%
    as_latex() %>%
    as.character()

  # Create a `tbl_latex` object with `gt()`; this table
  # bold the value in column 'wt', row 2
  tbl_gt <-
    gt(data = mtcars_short) %>%
    tab_header(title = "test title") %>%
    tab_style(style = list(cell_text(weight = 'bold')),
              locations = cells_body(columns = c('wt'), rows = c(2))) %>%
    as_latex() %>%
    as.character()

  #Expect a fixed pattern
  #value in column 'wt', row 2 should be bolded
  expect_true(grepl('\\textbf{2.875}', tbl_gt, fixed = TRUE))

  #Expect a fixed pattern
  #value in column 'wt', row 1 should not be bolded
  expect_false(grepl('\\textbf{2.620}', tbl_gt, fixed = TRUE))

  #Create a `tbl_latex` object with `gt()`; this table
  #all rownames are bolded
  mtcars_short$rownm <- c('Mazda RX4', 'Mazda RX4 Wag')
  tbl_gt <-
    gt(data = mtcars_short,
       rowname_col = 'rownm') %>%
    tab_header(title = "test title") %>%
    tab_style(style = list(cell_text(weight = 'bold')),
              locations = cells_stub(rows = everything())) %>%
    as_latex() %>%
    as.character()

  #Expect a fixed pattern
  #rows named 'Mazda RX4' and 'Mazda RX4 Wag' should be bolded
  expect_true(grepl('\\textbf{Mazda RX4 Wag}', tbl_gt, fixed = TRUE) && grepl('\\textbf{Mazda RX4}', tbl_gt, fixed = TRUE))

  #Create a `tbl_latex` object with `gt()`; this table
  #stubhead is bolded
  mtcars_short$rownm <- c('Mazda RX4', 'Mazda RX4 Wag')
  tbl_gt <-
    gt(data = mtcars_short,
       rowname_col = 'rownm') %>%
    tab_header(title = "test title") %>%
    tab_stubhead(label = 'cars') %>%
    tab_style(style = list(cell_text(weight = 'bold')),
              locations = cells_stubhead()) %>%
    as_latex() %>%
    as.character()

  #Expect a fixed pattern
  #stubhead 'cars' should be bolded
  expect_true(grepl('\\textbf{cars}', tbl_gt, fixed = TRUE))

  #Expect a fixed pattern
  #other row labels should not be bolded
  expect_false(grepl('\\textbf{Mazda RX4 Wag}', tbl_gt, fixed = TRUE) && grepl('\\textbf{Mazda RX4}', tbl_gt, fixed = TRUE))

}
)

test_that("latex math styling", {

  #!@ -> cell math environment ->  $ cell text $
  #<> -> escape math -> \\text{}
  #* -> \
  #CHECKMARK is a predefined symbol (does not need math environment)

  #!@ something_{<something>} - > $something_{\\text{something}}$

  # Create a `tbl_latex` object with `gt()`; this table
  # math formatting
  tbl_math <- dplyr::tribble( ~grpname,
                                   '!@ something_{<something>}')
  tbl_gt <-
    gt(data = tbl_math) %>%
    as_latex() %>%
    as.character()

  #Expect a fixed pattern
  expect_true(grepl('$ something_{\\text{something}}$', tbl_gt, fixed = TRUE))

  # Create a `tbl_latex` object with `gt()`; this table
  # math formatting
  tbl_math <- dplyr::tribble( ~grpname,
                              'CHECKMARK')
  tbl_gt <-
    gt(data = tbl_math) %>%
    as_latex() %>%
    as.character()

  #Expect a fixed pattern
  expect_true(grepl('\\checkmark', tbl_gt, fixed = TRUE))

  tbl_math <- dplyr::tribble( ~grpname,
                              '!@ *beta_{<abc>}')
  tbl_gt <-
    gt(data = tbl_math) %>%
    as_latex() %>%
    as.character()

  #Expect a fixed pattern
  expect_true(grepl('$ \\beta_{\\text{abc}}$', tbl_gt, fixed = TRUE))
}
)

test_that("latex colored box styling", {

  tbl_colored <- dplyr::tribble( ~grpname, ~count, ~color,
                              'apple', 1, 'red',
                              'banana', 2, 'yellow')
  tbl_gt <-
    gt(data = tbl_colored) %>%
    tab_style(
      style = cell_fill(color = "#d3d3d3"),
      locations = cells_body(
        columns = everything(),
        rows = startsWith(grpname, 'a')
      )
    ) %>%
    as_latex() %>%
    as.character()

  #Expect a fixed pattern
  #color definition must be included in code
  expect_true(grepl('\\definecolor{D3D3D3}', tbl_gt, fixed = TRUE))

  #Expect a fixed pattern
  #coloring around values in the apple row
  expect_true(grepl('\\cellcolor{D3D3D3}{apple}', tbl_gt, fixed = TRUE) && grepl('\\cellcolor{D3D3D3}{1}', tbl_gt, fixed = TRUE) && grepl('\\cellcolor{D3D3D3}{red}', tbl_gt, fixed = TRUE))

  #Expect a fixed pattern
  #no coloring on around values in the banana row
  expect_false(grepl('\\cellcolor{D3D3D3}{banana}', tbl_gt, fixed = TRUE))
  expect_false(grepl('\\cellcolor{D3D3D3}{2}', tbl_gt, fixed = TRUE))
  expect_false(grepl('\\cellcolor{D3D3D3}{yellow}', tbl_gt, fixed = TRUE))
}
)

test_that("latex preset font sizing", {

  tbl_fruit <- dplyr::tribble( ~grpname, ~count, ~color,
                                              'apple', 1, 'red',
                                              'banana', 2, 'yellow',
                                              'grape', 3, 'purple',
                                              'pear', 4, 'green',
                                              'orange', 5, 'orange')
  tbl_gt <-
    gt(data = tbl_fruit) %>%
    tab_style(
      style = cell_text(size = "xx-small"),
      locations = cells_body(
        columns = vars(color),
        rows = startsWith(grpname, 'a')
      )
    ) %>%
    as_latex() %>%
    as.character()

  #Expect a fixed pattern
  #row apple and column color is now xxsmall (scriptsize in latex)
  expect_true(grepl('{\\scriptsize red}', tbl_gt, fixed = TRUE))

  #Expect a fixed pattern
  #other column columns are still normal size
  expect_equal(length(unlist(gregexpr('\\scriptsize', tbl_gt, fixed = TRUE))), 1)


  tbl_gt <-
    gt(data = tbl_fruit) %>%
    tab_style(
      style = cell_text(size = "x-small"),
      locations = cells_body(
        columns = everything(),
        rows = startsWith(grpname, 'b')
      )
    ) %>%
    as_latex() %>%
    as.character()

  #Expect a fixed pattern
  #row banana and columns color, count, and grpname are now xsmall (footnotesize in latex)
  expect_true(grepl('{\\footnotesize yellow}', tbl_gt, fixed = TRUE))
  expect_true(grepl('{\\footnotesize banana}', tbl_gt, fixed = TRUE))
  expect_true(grepl('{\\footnotesize 2}', tbl_gt, fixed = TRUE))

  #Expect a fixed pattern
  #only fontsize in banana row has been changed
  expect_equal(length(unlist(gregexpr('\\footnotesize', tbl_gt, fixed = TRUE))), 3)


  tbl_gt <-
    gt(data = tbl_fruit) %>%
    tab_style(
      style = cell_text(size = "small"),
      locations = cells_body(
        columns = everything(),
        rows = startsWith(grpname, 'g')
      )
    ) %>%
    as_latex() %>%
    as.character()

  #Expect a fixed pattern
  #row grape and columns color, count, and grpname are now small (small in latex)
  expect_true(grepl('{\\small purple}', tbl_gt, fixed = TRUE))
  expect_true(grepl('{\\small grape}', tbl_gt, fixed = TRUE))
  expect_true(grepl('{\\small 3}', tbl_gt, fixed = TRUE))

  #Expect a fixed pattern
  #only fontsize in grape row has been changed
  expect_equal(length(unlist(gregexpr('\\small', tbl_gt, fixed = TRUE))), 3)

  tbl_gt <-
    gt(data = tbl_fruit) %>%
    tab_style(
      style = cell_text(size = "medium"),
      locations = cells_body(
        columns = everything(),
        rows = startsWith(grpname, 'p')
      )
    ) %>%
    as_latex() %>%
    as.character()

  #Expect a fixed pattern
  #row pear and columns color, count, and grpname are now medium (large in latex)
  expect_true(grepl('{\\large green}', tbl_gt, fixed = TRUE))
  expect_true(grepl('{\\large pear}', tbl_gt, fixed = TRUE))
  expect_true(grepl('{\\large 4}', tbl_gt, fixed = TRUE))

  #Expect a fixed pattern
  #only fontsize in pear row has been changed
  expect_equal(length(unlist(gregexpr('\\large', tbl_gt, fixed = TRUE))), 3)


  tbl_gt <-
    gt(data = tbl_fruit) %>%
    tab_style(
      style = cell_text(size = "large"),
      locations = cells_body(
        columns = everything(),
        rows = startsWith(grpname, 'o')
      )
    ) %>%
    as_latex() %>%
    as.character()

  #Expect a fixed pattern
  #row orange and columns color, count, and grpname are now large (large in latex)
  expect_true(grepl('{\\large orange}', tbl_gt, fixed = TRUE))
  expect_true(grepl('{\\large 5}', tbl_gt, fixed = TRUE))

  #Expect a fixed pattern
  #only fontsize in orange row has been changed
  expect_equal(length(unlist(gregexpr('\\large', tbl_gt, fixed = TRUE))), 3)

  tbl_gt <-
    gt(data = tbl_fruit) %>%
    tab_style(
      style = cell_text(size = "x-large"),
      locations = cells_body(
        columns = everything(),
        rows = startsWith(grpname, 'a')
      )
    ) %>%
    as_latex() %>%
    as.character()

  #Expect a fixed pattern
  #row apple and columns color, count, and grpname are now x-large (LARGE in latex)
  expect_true(grepl('{\\LARGE red}', tbl_gt, fixed = TRUE))
  expect_true(grepl('{\\LARGE apple}', tbl_gt, fixed = TRUE))
  expect_true(grepl('{\\LARGE 1}', tbl_gt, fixed = TRUE))

  #Expect a fixed pattern
  #only fontsize in apple row has been changed
  expect_equal(length(unlist(gregexpr('\\LARGE', tbl_gt, fixed = TRUE))), 3)


  tbl_gt <-
    gt(data = tbl_fruit) %>%
    tab_style(
      style = cell_text(size = "xx-large"),
      locations = cells_body(
        columns = everything(),
        rows = startsWith(grpname, 'b')
      )
    ) %>%
    as_latex() %>%
    as.character()

  #Expect a fixed pattern
  #row banana and columns color, count, and grpname are now xx-large (huge in latex)
  expect_true(grepl('{\\huge banana}', tbl_gt, fixed = TRUE))
  expect_true(grepl('{\\huge yellow}', tbl_gt, fixed = TRUE))
  expect_true(grepl('{\\huge 2}', tbl_gt, fixed = TRUE))

  #Expect a fixed pattern
  #only fontsize in banana row has been changed
  expect_equal(length(unlist(gregexpr('\\huge', tbl_gt, fixed = TRUE))), 3)
}
)
