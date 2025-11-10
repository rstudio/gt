# Function to skip tests if Suggested packages not available on system
check_suggests <- function() {
  skip_if_not_installed("rvest")
}

test_that("text_transform() works correctly", {

  # Check that specific suggested packages are available
  check_suggests()

  # Create a `tbl_html` object with `gt()` and transform
  # all values in the `mpg` column
  tbl_html <-
    mtcars_short |>
    gt() |>
    text_transform(
      locations = cells_body(columns = mpg),
      fn = function(x) paste0(x, " mpg")
    )

  # Expect that all data values in the `mpg` column have 'mpg'
  # at the end
  tbl_html |>
    render_as_html() |>
    xml2::read_html() |>
    selection_text("tr td:first-child") |>
    expect_match(".* mpg$")

  # Create a `tbl_html` object with `gt()` and transform
  # all values in the `mpg` column with a slightly more
  # complex function
  tbl_html <-
    mtcars_short |>
    gt() |>
    text_transform(
      locations = cells_body(columns = mpg),
      fn = function(x) {
        paste0(x, " ", ifelse(x >= 20, "(good)", "(bad)"))
      }
    )

  # Expect that all data values in the `mpg` column
  # have either '(good)' or '(bad)' at the end
  tbl_html |>
    render_as_html() |>
    xml2::read_html() |>
    selection_text("tr td:first-child") |>
    expect_match(".*(\\(good\\)|\\(bad\\))$")

  # Create a `tbl_html` object with `gt()` and transform
  # all values in the `mpg` column with a function that
  # returns a single numeric value
  tbl_html <-
    mtcars_short |>
    gt() |>
    text_transform(
      locations = cells_body(columns = mpg),
      fn = function(x) {
        ifelse(x >= 20, 25, 15)
      }
    )

  # Expect that all data values in the `mpg` column
  # are either '15' or '25'
  tbl_html |>
    render_as_html() |>
    xml2::read_html() |>
    selection_text("tr td:first-child") |>
    unique() |>
    expect_equal(c("25", "15"))

  # Create a `tbl_html` object with `gt()`, format `mpg` values
  # with `fmt_number()` (using a pattern) and further transform
  # all values in the `mpg` column; this shows that `text_transform()`
  # takes `x` that has gone through all formatting functions first
  tbl_html <-
    mtcars_short |>
    gt() |>
    fmt_number(
      columns = mpg,
      decimals = 4,
      pattern = "{x} miles") |>
    text_transform(
      locations = cells_body(columns = mpg),
      fn = function(x) {
        paste(x, "per gallon")
      }
    )

  # Expect that all data values in the `mpg` column have 'mpg'
  # at the end
  tbl_html |>
    render_as_html() |>
    xml2::read_html() |>
    selection_text("tr td:first-child") |>
    expect_match(".*miles per gallon$")

  # Call two `text_transform()`s and expect them to be later
  # executed in the correct order
  tbl_html <-
    mtcars_short |>
    gt() |>
    text_transform(
      locations = cells_body(columns = mpg),
      fn = function(x) {
        paste(x, "miles")
      }
    ) |>
    text_transform(
      locations = cells_body(columns = mpg),
      fn = function(x) {
        paste(x, "per gallon")
      }
    )

  # Expect that all data values in the `mpg` column have 'mpg'
  # at the end
  tbl_html |>
    render_as_html() |>
    xml2::read_html() |>
    selection_text("tr td:first-child") |>
    expect_match(".*miles per gallon$")

  # Extract the internal `transforms` attr
  transforms <- dt_transforms_get(data = tbl_html)

  # Expect two components to be held within `transforms`
  expect_length(transforms, 2)

  # Expect that each component of `transforms` has the names
  # `resolved` and `fn`
  expect_named(transforms[[1]], c("resolved", "fn"))
  expect_named(transforms[[2]], c("resolved", "fn"))

  # Expect that `resolved` subcomponent of `transforms` has the names
  # `columns` and `rows`
  expect_named(transforms[[1]]$resolved, c("columns", "rows", "colnames"))
  expect_named(transforms[[2]]$resolved, c("columns", "rows", "colnames"))

  # Expect that `resolved` subcomponent of `transforms` has the class
  # names and `resolved`, `cells_body`, `location_cells`
  resolved_class <- c("resolved", "cells_body", "location_cells")
  expect_s3_class(transforms[[1]]$resolved, resolved_class)
  expect_s3_class(transforms[[2]]$resolved, resolved_class)

  # Expect that `fn` subcomponent of `transforms` is a function
  expect_true(is.function(transforms[[1]]$fn))
  expect_true(is.function(transforms[[2]]$fn))

  # Define a function that converts vector of `x` to numeric
  # and rounds values to a specific multiple
  round_mult <- function(x, multiple = 0.25) {
    x <- as.numeric(x)
    format(multiple * round(x / multiple))
  }

  # Call `text_transform()` with the custom function `round_mult()`
  # as input to `fn`
  tbl_html <-
    mtcars_short |>
    gt() |>
    text_transform(
      locations = cells_body(columns = mpg),
      fn = round_mult
    )

  # Expect values rounded to the default `0.25` interval
  tbl_html |>
    render_as_html() |>
    xml2::read_html() |>
    selection_text("tr td:first-child") |>
    expect_match(".*\\.(00|25|50|75)$")
})

test_that("text_transform() works in the body even when rows/columns are reordered", {

  # Use `tab_row_group()` to create new row groups (this reorders
  # the data table) and use `text_transform()` in two separate calls
  # to modify various cells in the `mpg` column
  tbl_html <-
    mtcars_short |>
    gt(rownames_to_stub = TRUE) |>
    tab_row_group(
      label = md("**Mazda**"),
      rows = starts_with("Maz"),
      id = "Mazda"
    ) |>
    tab_row_group(
      label = md("**2 Hornets + a Datsun**"),
      rows = matches("Datsun|Hornet"),
      id = "DatsunHornet"
    ) |>
    text_transform(
      locations = cells_body(columns = mpg, rows = "Datsun 710"),
      fn = function(x) paste0(x, "!")
    ) |>
    text_transform(
      locations = cells_body(columns = mpg, rows = starts_with("Mazda")),
      fn = function(x) round(as.numeric(x), 0)
    )

  # Expect that certain cells are transformed in the `mpg` column
  tbl_html |>
    render_as_html() |>
    xml2::read_html() |>
    selection_text("tr td:nth-child(2)") |>
    expect_equal(c("22.8!", "21.4", "18.7", "21", "21"))

  # Reorder the groups with `row_group_order()`
  tbl_html <-
    tbl_html |>
    row_group_order(groups = c("Mazda", "DatsunHornet"))

  # Expect that the transformed cells in the `mpg` column are
  # reordered to match the new group order
  tbl_html |>
    render_as_html() |>
    xml2::read_html() |>
    selection_text("tr th:nth-child(1)") |>
    expect_equal(
      c(
        "", "Mazda", "Mazda RX4", "Mazda RX4 Wag", "2 Hornets + a Datsun",
        "Datsun 710", "Hornet 4 Drive", "Hornet Sportabout"
      )
    )

  tbl_html |>
    render_as_html() |>
    xml2::read_html() |>
    selection_text("tr td:nth-child(2)") |>
    expect_equal(c("21", "21", "22.8!", "21.4", "18.7"))

  # Move the `mpg` column to the right of `cyl`
  tbl_html <-
    tbl_html |>
    cols_move(columns = mpg, after = cyl)

  # Expect that the transformed cells in the `mpg` column in its
  # new position are still transformed properly
  tbl_html |>
    render_as_html() |>
    xml2::read_html() |>
    selection_text("tr td:nth-child(3)") |>
    expect_equal(c("21", "21", "22.8!", "21.4", "18.7"))
})

test_that("text_transform() works in column labels", {

  # Create a gt table and modify
  # two different column names with `text_transform()`
  tbl_html <-
    mtcars_short |>
    gt(rownames_to_stub = TRUE) |>
    tab_row_group(
      label = md("**Mazda**"),
      rows = starts_with("Maz"),
      id = "Mazda"
    ) |>
    tab_row_group(
      label = md("**2 Hornets + a Datsun**"),
      rows = matches("Datsun|Hornet"),
      id = "DatsunHornet"
    ) |>
    cols_move_to_end(columns = cyl) |>
    text_transform(
      locations = cells_column_labels(columns = c(mpg, cyl)),
      fn = toupper
    )

  # Expect column labels to be transformed correctly
  tbl_html |>
    render_as_html() |>
    xml2::read_html() |>
    selection_text("tr:first-child th") |>
    expect_equal(
      c(
        "", "MPG", "disp", "hp", "drat", "wt", "qsec", "vs", "am",
        "gear", "carb", "CYL", "2 Hornets + a Datsun"
      )
    )
})

test_that("text_replace() works when called more than once (#1824)", {
  # No problem with cells_body() / cells_column_spanners()
  tbl_html <- exibble |>
    dplyr::select(1:3) |>
    gt() |>
    text_replace(
      "fctr",
      "aa",
      locations = cells_column_labels()
    ) |>
    text_replace(
      "aa",
      "aaaMD",
      locations = cells_column_labels()
    )
  tbl_html |>
    render_as_html() |>
    xml2::read_html() |>
    selection_text("tr:first-child th") |>
    expect_equal(
      c(
        "num", "char", "aaaMD"
      )
    )
})

test_that("text_transform() works on row labels in the stub", {

  # Create a gt table and modify
  # two different column names with `text_transform()`
  tbl_html <-
    mtcars_short |>
    gt(rownames_to_stub = TRUE) |>
    tab_row_group(
      label = md("**Mazda**"),
      rows = starts_with("Maz"),
      id = "Mazda"
    ) |>
    tab_row_group(
      label = md("**2 Hornets + a Datsun**"),
      rows = matches("Datsun|Hornet"),
      id = "DatsunHornet"
    ) |>
    cols_move_to_end(columns = cyl) |>
    text_transform(
      locations = cells_stub(rows = c("Mazda RX4 Wag", "Hornet Sportabout")),
      fn = toupper
    )

  # Expect column labels to be transformed correctly
  tbl_html |>
    render_as_html() |>
    xml2::read_html() |>
    selection_text("[class='gt_row gt_left gt_stub']") |>
    expect_equal(
      c(
        "Datsun 710", "Hornet 4 Drive", "HORNET SPORTABOUT",
        "Mazda RX4", "MAZDA RX4 WAG"
      )
    )
})

test_that("text_case_match() works on the tab_spanner()", {

  gt_tbl <-
    exibble |>
    gt() |>
    tab_spanner("the boring spanner", columns = c(num, date))

  expect_snapshot(error = TRUE, {
    gt_tbl |>
      text_case_match(
        "boring " ~ "awesome ",
        .replace = "partial",
        .locations = cells_column_spanners(2)
      )
  })

  expect_no_error(new_tb <- gt_tbl |>
    text_case_match(
      "boring " ~ "awesome ",
      .replace = "partial",
      .locations = cells_column_spanners()
    ))

  expect_match_html(new_tb, "awesome spanner")

  expect_no_error(new_tb2 <- gt_tbl |>
    text_case_match(
      "the boring spanner" ~ "awesome spanner2",
      .replace = "all",
      .locations = cells_column_spanners()
  ))

  expect_match_html(new_tb2, "awesome spanner2")
})

test_that("text_transform() works on row group labels", {

  # Create a gt table and modify the two different
  # row group labels with `text_transform()`
  tbl_html <-
    exibble |>
    gt(rowname_col = "row", groupname_col = "group") |>
    text_transform(
      locations = cells_row_groups(),
      fn = toupper
    )

  # Expect row group labels to be transformed correctly
  tbl_html |>
    render_as_html() |>
    xml2::read_html() |>
    selection_text("[class='gt_group_heading']") |>
    expect_equal(c("GRP_A", "GRP_B"))

  # Create a gt table and modify the
  # first row group label with `text_transform()`
  tbl_html <-
    exibble |>
    gt(rowname_col = "row", groupname_col = "group") |>
    text_transform(
      locations = cells_row_groups(groups = "grp_a"),
      fn = toupper
    )

  # Expect row group labels to be transformed correctly
  tbl_html |>
    render_as_html() |>
    xml2::read_html() |>
    selection_text("[class='gt_group_heading']") |>
    expect_equal(c("GRP_A", "grp_b"))

  # Create a new gt table for further testing
  tbl_gt <-
    gtcars |>
    dplyr::select(model, year, hp, trq) |>
    gt(rowname_col = "model") |>
    tab_row_group(
      label = "powerful",
      rows = hp >= 400 & hp < 600
    ) |>
    tab_row_group(
      label = "super powerful",
      rows = hp > 600
    )

  # Modify the first row group label with `text_transform()`
  tbl_html <-
    tbl_gt |>
    text_transform(
      locations = cells_row_groups(groups = "powerful"),
      fn = toupper
    )

  # Expect row group labels to be transformed correctly
  tbl_html |>
    render_as_html() |>
    xml2::read_html() |>
    selection_text("[class='gt_group_heading']") |>
    expect_equal(c("super powerful", "POWERFUL"))

  # Modify all group labels with `text_transform()`
  tbl_html <-
    tbl_gt |>
    text_transform(
      locations = cells_row_groups(),
      fn = function(x) ""
    )

  # Expect row group labels to be transformed correctly
  tbl_html |>
    render_as_html() |>
    xml2::read_html() |>
    selection_text("[class='gt_group_heading']") |>
    expect_equal(character(0L))

  # Modify all group labels with `text_transform()`
  tbl_html <-
    tbl_gt |>
    text_transform(
      locations = cells_row_groups(),
      fn = toupper
    )

  # Expect row group labels to be transformed correctly
  tbl_html |>
    render_as_html() |>
    xml2::read_html() |>
    selection_text("[class='gt_group_heading']") |>
    expect_equal(c("SUPER POWERFUL", "POWERFUL"))
})

# text_*() other functions -----------------------------------------------------

test_that("text_case_when() + text_case_match() work", {

  expect_no_error(cw <- gt(exibble) |> text_case_when(is.na(x) ~ "---"))

  # md is not really respected even if we use md("---")
  expect_no_error(cm <- gt(exibble) |> text_case_match(NA ~ "---"))

  # they are not changing numeric NA
  expect_equal_gt(cw, cm)
})

test_that("text_replace() works", {

  expect_no_error(tr <- gt(exibble) |> text_replace("NA", "---"))

  expect_match_html(tr, "---")
})
