# This script can be run for alternative visual tests for LaTeX output.


# generate the yaml front matter for the pdf / LaTeX Quarto test
header_latex <- c(
  "---",
  'title: "LaTeX Quarto test"',
  "date: today",
  "editor: source",
  "format:",
  "  pdf:",
  "    colorlinks: true ",
  "    geometry:",
  "      - top=10mm",
  "      - left=10mm",
  "      - bottom=10mm",
  "    hyperrefoptions:",
  "      - linktoc=all",
  "toc: false",
  "tbl-cap-location: bottom",
  "lot: true",
  "keep-tex: true",
  "html-table-processing: none",
  "---",
  "",
  "<!--- This file is generated from sourcing scripts/visual-tests-latex.R You can add more tests to vignettes/gt-visual.qmd -->"
)

# Removes empty chunks.
.strip_knitr_empty <- function(lines) {
  chunk_start_location <- grep("## ----", lines, fixed = TRUE)
  empty_locations <- !nzchar(lines)

  remove <- vector(mode = "integer")

  for (i in seq_along(chunk_start_location)) {
    if (empty_locations[chunk_start_location[i] + 1]) {
      remove <- c(remove, chunk_start_location[i], chunk_start_location[i] + 1)
    }
  }
  if (rlang::has_length(remove)) {
    if (anyNA(remove)) {
      cli::cli_abort("Internal error. remove shouldn't contain NA.")
    }
    lines <- lines[-remove]
  }
  lines
}

# Get table name and chunk label.
.get_example_metadata <- function(lines) {
  # Ensure consistent formatting
  chunk_labels <- stringr::str_subset(lines, "#\\| label\\:")
  n_chunks <- length(chunk_labels)

  # having a table title tell us what to look for when comparing tests.
  table_titles <- stringr::str_subset(lines, "tab_header\\(title")

  if (length(table_titles) != n_chunks) {
    cli::cli_abort(c(
      "The structure is not respected. We have {n_chunks} examples, but {length(table_titles)}.",
      "Each table should be labelled with #| label: and have a tab_header(title = \"\") title"
    ))
  }

  chunk_labels <- gsub(".+\\:\\s?(.+)", "\\1", chunk_labels)
  table_titles <- gsub(".*tab_header\\(title\\s?=\\s?\"(.+)\"\\).*", "\\1", table_titles)

  list(
    label = chunk_labels,
    title = table_titles
  )
}

.get_replacement_lines <- function(metadata) {
  length.out <- unique(lengths(metadata))
  if (length(length.out) != 1) {
    cli::cli_abort("issue")
  }
  new_lines <- vector("list", length = length.out)
  for (i in seq_along(new_lines)) {
    new_lines[[i]] <- c(
      paste0("#| label: tbl-", metadata$label[[i]]),
      paste0("#| tbl-cap: \"", metadata$title[[i]], "\""),
      "#| echo: false",
      "tab"
    )
  }
  new_lines
}

#
# create lines needed for LaTeX file
# Basically, takes the qmd file in vignettes/gt-visual.qmd
# and outputs the lines to be able to render pkgdown/assets/gt-latex.R
# in order to get pkgdown/assets/gt-latex.pdf
#
.tex_lines_for_visual_examples <- function() {
  tmp <- withr::local_tempfile()
  # create output file
  # we will be able to render this later with knitr::spin!
  knitr::purl("vignettes/gt-visual.qmd", output = tmp, quiet = TRUE)

  lines <- readLines(tmp, encoding = "UTF-8", warn = FALSE)

  lines <- stringr::str_subset(
    lines,
    "#\\| echo\\: false|opt_interactive|plot\\(tab\\)",
    negate = TRUE
  )
  # find the first test (then assume to keep 3 extra lines)
  first_test_identifier <- grep("tab <- ", lines, fixed = TRUE)[1] - 3L
  lines <- lines[-seq_len(first_test_identifier)]

  # remove empty chunks
  lines <- .strip_knitr_empty(lines)

  # Get the list of chunk labels

  metadata <- .get_example_metadata(lines)
  # store the new chunk code for each table for LaTeX.
  replacement_lines <- .get_replacement_lines(metadata)

  # make the lines a list
  list_lines <- as.list(lines)

  # prepare for empty chunks replacements with the new latex chunk code
  # contained in replacement_lines

  # counter for looping in replacement lines
  n_replacements <- 1
  for (i in seq_along(list_lines)) {
    if (list_lines[[i]] == "tab") {
      # When it is time to replace "tab", by c("label: tbl-{chunk-label}", tbl-cap: "tab_header"))
      list_lines[[i]] <- replacement_lines[[n_replacements]]
      # increment n_replacement
      n_replacements <- n_replacements + 1
    }
  }

  # make sure the number of replacements done is okay.
  n_replacements - 1 == length(replacement_lines)

  # put back output as character vector.
  lines <- unlist(list_lines)
}

# get the knitr::spin LaTeX lines needed from gt-visual.qmd.
final_lines <- .tex_lines_for_visual_examples()

# Using output similar to knitr::spin
# https://bookdown.org/yihui/rmarkdown-cookbook/spin.html
c(
  # roxygen comments in .R knitr files indicate text
  paste0("#' ", header_latex),
  "## --------",
  # Comment / uncomment here to compare between released version and current.
  # "library(gt)",
  "pkgload::load_all(\".\")",
  "packageVersion('gt')",
  "quarto::quarto_version()",
  "",
  "#'",
  "#' {{< pagebreak >}}",
  "#'",
  final_lines
) |>
  writeLines("pkgdown/assets/gt-latex.R")
# Since Quarto 1.5, quarto can render a script
quarto::quarto_render("pkgdown/assets/gt-latex.R")
unlink("pkgdown/assets/gt-latex.R")

# preview the document before comitting
# fs::file_show("pkgdown/assets/gt-latex.pdf)
# Could even create visual tests for typst tables.

