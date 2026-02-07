#------------------------------------------------------------------------------#
#
#                /$$
#               | $$
#     /$$$$$$  /$$$$$$
#    /$$__  $$|_  $$_/
#   | $$  \ $$  | $$
#   | $$  | $$  | $$ /$$
#   |  $$$$$$$  |  $$$$/
#    \____  $$   \___/
#    /$$  \ $$
#   |  $$$$$$/
#    \______/
#
#  This file is part of the 'rstudio/gt' project.
#
#  Copyright (c) 2018-2026 gt authors
#
#  For full copyright and license information, please look at
#  https://gt.rstudio.com/LICENSE.html
#
#------------------------------------------------------------------------------#


#nocov start

fetch_rd_db <- utils::getFromNamespace("fetchRdDB", "tools")

# Function to get the package docs RdDB for any package
get_package_docs <- function() {
  help_dir <- system.file("help", package = "gt")
  db_path <- file.path(help_dir, "gt")
  fetch_rd_db(db_path)
}

get_topic_names <- function() {

  topic_names <- names(get_package_docs())

  # Exclude any topics that have `.` or `-` characters within their names,
  # and, exclude the 'pipe' and 'reexports' topic
  topic_names[
    !grepl(".", topic_names, fixed = TRUE) &
      !grepl("-", topic_names, fixed = TRUE) &
      !topic_names %in% c("pipe", "reexports")
  ]
}

get_example_text <- function(topic) {

  topic_names <- names(get_package_docs())

  examples_out <- NULL # same as c

  for (i in seq_along(topic)) {

    if (!(topic[i] %in% topic_names)) {
      stop("The provided `topic` is not available in `pkg`.", call. = FALSE)
    }

    topic_idx <- which(topic_names == topic[i])
    topic_docs <- get_package_docs()[[topic_idx]]
    help_file_lines <- as.character(attr(topic_docs, which = "srcref"))

    if (any(grepl("Function ID", help_file_lines))) {
      topic_type <- "function"
    } else if (any(grepl("Dataset ID ", help_file_lines))) {
      topic_type <- "dataset"
    }

    if (!any(grepl("\\section{Examples}{", help_file_lines, fixed = TRUE))) {
      return(NA_character_)
    }

    examples_start_idx <-
      grep("\\section{Examples}{", help_file_lines, fixed = TRUE) + 1L

    examples_end_idx <-
      grep(
        paste0(
          "\\section{",
          ifelse(topic_type == "function", "Function ID", "Dataset ID and Badge"),
          "}{"
          ),
        help_file_lines,
        fixed = TRUE
        ) - 1L

    example_lines <-
      help_file_lines[examples_start_idx[1]:examples_end_idx[1]]

    example_lines <- gsub(".*preformatted.(.*)", "```{r}\n\\1", example_lines)
    example_lines <- gsub("}\\if{html}{\\out{</div>}}", "```", example_lines, fixed = TRUE)
    example_lines <- grep("^}|<img", example_lines, value = TRUE, invert = TRUE)
    example_lines <- grep("\\if\\{html\\}", example_lines, value = TRUE, invert = TRUE)
    example_lines <- grep("^#>", example_lines, value = TRUE, invert = TRUE)

    example_lines <- gsub("\\%", "%", example_lines, fixed = TRUE)
    example_lines <- gsub("\\{", "{", example_lines, fixed = TRUE)
    example_lines <- gsub("\\}", "}", example_lines, fixed = TRUE)

    example_lines <- gsub("\\\\link\\{(.*?)\\}", "\\1", example_lines)
    example_lines <- gsub("\\\\link\\[.*?\\]\\{(.*?)\\}", "\\1", example_lines)
    example_lines <- gsub("\\\\strong\\{(.*?)\\}", "**\\1**", example_lines)
    example_lines <- gsub("\\\\emph\\{(.*?)\\}", "*\\1*", example_lines)
    example_lines <- gsub("\\\\code\\{(.*?)\\}", "`\\1`", example_lines)
    example_lines <- gsub("\\\\verb\\{(.*?)\\}", "`\\1`", example_lines)

    example_lines <- paste(example_lines, collapse = "\n")

    # Remove leading and trailing whitespace
    example_lines <- gsub("^\n\n", "", example_lines)
    example_lines <- gsub("\n\n$", "", example_lines)
    example_lines <- gsub("\n\n\n", "\n\n", example_lines)

    # Replace `\\\\\\\\` with `\\`
    example_lines <- gsub("\\\\\\\\", "\\", example_lines, fixed = TRUE)

    # Replacements in `text_replace()` example
    if (topic %in% c("text_replace", "fmt_image")) {
      example_lines <-
        gsub("\\((.*?)\\)", "\\\\((.*?)\\\\)", example_lines, fixed = TRUE)
      example_lines <-
        gsub("<em>\\1</em>", "<em>\\\\1</em>", example_lines, fixed = TRUE)
    }

    # Replacements in `fmt_email()` example
    if (topic == "fmt_email") {
      example_lines <-
        gsub("\\(0|\\)", "\\\\(0|\\\\)", example_lines, fixed = TRUE)
    }

    examples_out <- c(examples_out, example_lines)
  }

  examples_out
}

generate_gt_examples_tbl <- function() {

  topic_names <- get_topic_names()

  topic_examples <- c()

  for (i in seq_along(topic_names)) {

    topic_examples <-
      c(
        topic_examples,
        get_example_text(topic = topic_names[i])
      )
  }

  dplyr::tibble(
    name = topic_names,
    examples = topic_examples
  ) |>
    dplyr::mutate(name = paste0("`", name, "()`")) |>
    gt(id = "gt-examples") |>
    fmt_markdown() |>
    text_transform(
      fn = function(x) paste0("<details><summary>EXAMPLES</summary><br>", x, "</details"),
      locations = cells_body(columns = examples)
    ) |>
    cols_width(name ~ px(275), examples ~ px(800)) |>
    tab_style(
      style = cell_text(v_align = "top"),
      locations = cells_body(columns = name)
    ) |>
    tab_options(column_labels.hidden = TRUE) |>
    opt_css(
      "
    #gt-examples details > div {
      background: aliceblue;
      border: lightblue;
      border-radius: 8px;
      border-style: solid;
      padding: 8px 8px 8px 8px;
    }

    #gt-examples details > div > pre {
      background: white;
      padding: 8px 8px 8px 8px;
      border-radius: 8px;
    }
    "
    )
}

write_gt_examples_qmd_files <- function(
    topics = NULL,
    generate_index_page = TRUE,
    output_dir = "gt_qmd_examples"
) {

  if (is.null(topics)) {
    gt_datasets_and_shiny_fns <-
      c("countrypops", "sza", "gtcars", "sp500", "pizzaplace", "exibble",
        "towny", "peeps", "films", "metro", "gibraltar", "constants",
        "illness", "reactions", "photolysis", "nuclides", "rx_adsl",
        "rx_addv", "render_gt", "gt_output", "fmt_markdown")

    topics <- base::setdiff(get_topic_names(), gt_datasets_and_shiny_fns)
  }

  if (!dir.exists(paths = output_dir)) {

    dir.create(path = output_dir, showWarnings = FALSE)

    if (!dir.exists(paths = output_dir)) {
      stop("The directory `", output_dir, "` could not be created.")
    }
  }

  if (generate_index_page) {

    index_tbl <-
      dplyr::tibble(
        name = character(0L),
        title = character(0L),
        type = character(0L),
        family = integer(0L),
        number = integer(0L)
      )

    pkg_docs <- get_package_docs()

    for (topic in topics) {

      help_file_lines <- as.character(attr(pkg_docs[[topic]], which = "srcref"))

      if (any(grepl("Function ID", help_file_lines))) {

        type <- "function"
        id_idx <- grep("\\section{Function ID}{", help_file_lines, fixed = TRUE) + 2
        id_val <- help_file_lines[id_idx]
        title_idx <- grep("\\title{", help_file_lines, fixed = TRUE)
        title <- gsub("\\title{", "", help_file_lines[title_idx], fixed = TRUE)
        title <- gsub("\\}$", "", title)
        family <- as.integer(unlist(strsplit(id_val, split = "-"))[[1]])
        number <- as.integer(unlist(strsplit(id_val, split = "-"))[[2]])

      } else if (any(grepl("Dataset ID ", help_file_lines, fixed = TRUE))) {

        type <- "dataset"
        id_idx <- grep("\\section{Dataset ID and Badge}{", help_file_lines, fixed = TRUE) + 2
        id_val <- help_file_lines[id_idx]
        title_idx <- grep("\\title{", help_file_lines, fixed = TRUE)
        title <- gsub("\\title{", "", help_file_lines[title_idx], fixed = TRUE)
        title <- gsub("\\}$", "", title)
        family <- 99L
        number <- as.integer(unlist(strsplit(id_val, split = "-"))[[2]])
      }

      title <- gsub("\\\\link\\{(.*?)\\}", "\\1", title)
      title <- gsub("\\\\link\\[.*?\\]\\{(.*?)\\}", "\\1", title)
      title <- gsub("\\\\strong\\{(.*?)\\}", "**\\1**", title)
      title <- gsub("\\\\emph\\{(.*?)\\}", "*\\1*", title)
      title <- gsub("\\\\code\\{(.*?)\\}", "`\\1`", title)
      title <- gsub("\\\\verb\\{(.*?)\\}", "`\\1`", title)

      index_tbl_i <-
        dplyr::tibble(
          name = topic,
          title = title,
          type = type,
          family = family,
          number = number
        )

      index_tbl <- dplyr::bind_rows(index_tbl, index_tbl_i)
    }

    index_tbl_gt <-
      index_tbl |>
      dplyr::arrange(family, number) |>
      dplyr::mutate(
        name = dplyr::case_when(
          type == "function" ~ paste0(
            "[", name, "()](gt-", name, ".qmd)"
          ),
          .default = name
        )
      ) |>
      dplyr::mutate(
        group = dplyr::recode_values(family,
          1 ~ "Table creation",
          2 ~ "Creating or modifying parts of a table",
          3 ~ "Formatting column data",
          4 ~ "Text transformation",
          5 ~ "Modifying columns",
          6 ~ "Adding or modifying rows",
          7 ~ "Removing parts of a table",
          8 ~ "Helper functions",
          9 ~ "Image addition utilities",
          10 ~ "Table options",
          11 ~ "Informational tables for reference",
          12 ~ "Shiny",
          13 ~ "Export and extraction functions",
          14 ~ "Working with table groups",
          15 ~ "Vector formatting",
          99 ~ "Built in datasets"
        )
      ) |>
      gt(groupname_col = "group", process_md = TRUE) |>
      fmt_markdown() |>
      fmt_url(columns = name, color = "#045AA2", target = "_self") |>
      cols_hide(columns = c(type, family, number)) |>
      tab_style(
        style = cell_text(
          font = system_fonts("monospace-code"),
          weight = 500
        ),
        locations = cells_body(columns = name)
      ) |>
      tab_options(column_labels.hidden = TRUE)

    writeLines(
      text = c(
        "---",
        "format: html",
        "html-table-processing: none",
        "---",
        "",
        paste("The **gt** package has", nrow(index_tbl), "functions."),
        "Each of these functions has documentation filled with examples.",
        "The table below organizes all of the functions into families and ",
        "links to separate pages of **gt** table examples by function.",
        "",
        "```{=html}",
        as_raw_html(index_tbl_gt),
        "```",
        ""
      ),
      con = paste0(output_dir, "/index.qmd")
    )

    writeLines(
      text = c(
        "project:",
        "  type: website",
        "",
        "render:",
        "  - \"*.qmd\"",
        "",
        "website:",
        "  title: \"The gt package\"",
        "  navbar:",
        "    left:",
        "    - text: \"home\"",
        "      file: index.qmd",
        "",
        "format:",
        "  html:",
        "    theme: cosmo",
        ""
      ),
      con = paste0(output_dir, "/_quarto.yml")
    )
  }

  for (topic in topics) {

    writeLines(
      text = c(
        "---",
        "format: html",
        "html-table-processing: none",
        "toc: false",
        "---",
        "",
        "```{r include=FALSE}",
        "library(gt)",
        "```",
        "",
        paste0("## The `", topic, "()` function"),
        "",
        get_example_text(topic = topic)
      ),
      con = paste0(output_dir, "/gt-", topic, ".qmd")
    )
  }

  writeLines(
    text = c(
      "- source: project",
      "  connect:",
      "    - id: b5709bdb-5712-42db-b265-2bfa02b5ffb6"#,
      #"    - url: https://colorado.posit.co/rsc/content/b5709bdb-5712-42db-b265-2bfa02b5ffb6/"
    ),
    con = paste0(output_dir, "/_publish.yml")
  )
}

#nocov end
