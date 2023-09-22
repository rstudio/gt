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
#  Copyright (c) 2018-2023 gt authors
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
    !grepl("\\.", topic_names) &
      !grepl("-", topic_names) &
      !grepl("^pipe$", topic_names) &
      !grepl("^reexports$", topic_names)
  ]
}

get_example_text <- function(topic) {

  topic_names <- names(get_package_docs())

  examples_out <- c()

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
      which(grepl("\\section{Examples}{", help_file_lines, fixed = TRUE)) + 1

    examples_end_idx <-
      which(
        grepl(
          paste0(
            "\\section{",
            ifelse(topic_type == "function", "Function ID", "Dataset ID and Badge"),
            "}{"
          ),
          help_file_lines,
          fixed = TRUE
        )
      ) - 1

    example_lines <-
      help_file_lines[examples_start_idx[1]:examples_end_idx[1]]

    example_lines <- gsub(".*preformatted.(.*)", "```{r}\n\\1", example_lines)
    example_lines <- gsub("}\\if{html}{\\out{</div>}}", "```", example_lines, fixed = TRUE)
    example_lines <- example_lines[!grepl("^}|<img", example_lines)]
    example_lines <- example_lines[!grepl("\\if\\{html\\}", example_lines)]
    example_lines <- example_lines[!grepl("^#>", example_lines)]

    example_lines <- gsub("\\%", "%", example_lines, fixed = TRUE)
    example_lines <- gsub("\\{", "{", example_lines, fixed = TRUE)
    example_lines <- gsub("\\}", "}", example_lines, fixed = TRUE)

    example_lines <- gsub("\\\\link\\{(.*?)\\}", "\\1", example_lines)
    example_lines <- gsub("\\\\link\\[.*?\\]\\{(.*?)\\}", "\\1", example_lines)
    example_lines <- gsub("\\\\strong\\{(.*?)\\}", "**\\1**", example_lines)
    example_lines <- gsub("\\\\emph\\{(.*?)\\}", "*\\1*", example_lines)
    example_lines <- gsub("\\\\code\\{(.*?)\\}", "`\\1`", example_lines)
    example_lines <- gsub("\\\\verb\\{(.*?)\\}", "`\\1`", example_lines)

    example_lines <- example_lines %>% paste(collapse = "\n")

    # Remove leading and trailing whitespace
    example_lines <- example_lines %>% gsub("^\n\n", "", .)
    example_lines <- example_lines %>% gsub("\n\n$", "", .)
    example_lines <- example_lines %>% gsub("\n\n\n", "\n\n", .)

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
  ) %>%
    dplyr::mutate(name = paste0("`", name, "()`")) %>%
    gt(id = "gt-examples") %>%
    fmt_markdown() %>%
    text_transform(
      fn = function(x) paste0("<details><summary>EXAMPLES</summary><br>", x, "</details"),
      locations = cells_body(columns = examples)
    ) %>%
    cols_width(name ~ px(275), examples ~ px(800)) %>%
    tab_style(
      style = cell_text(v_align = "top"),
      locations = cells_body(columns = name)
    ) %>%
    tab_options(column_labels.hidden = TRUE) %>%
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

    topics <-
      base::setdiff(
        get_topic_names(),
        c(
          "countrypops",
          "sza",
          "gtcars",
          "sp500",
          "pizzaplace",
          "exibble",
          "towny",
          "metro",
          "constants",
          "illness",
          "rx_adsl",
          "rx_addv"
        )
      )
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
        name = character(0),
        title = character(0),
        type = character(0),
        family = integer(0),
        number = integer(0)
      )

    pkg_docs <- get_package_docs()

    for (topic in topics) {

      help_file_lines <- as.character(attr(pkg_docs[[topic]], which = "srcref"))

      if (any(grepl("Function ID", help_file_lines))) {

        type <- "function"
        id_idx <- which(grepl("\\section{Function ID}{", help_file_lines, fixed = TRUE)) + 2
        id_val <- help_file_lines[id_idx]
        title_idx <- which(grepl("\\title{", help_file_lines, fixed = TRUE))
        title <- gsub("\\title{", "", help_file_lines[title_idx], fixed = TRUE)
        title <- gsub("\\}$", "", title)
        family <- as.integer(unlist(strsplit(id_val, split = "-"))[[1]])
        number <- as.integer(unlist(strsplit(id_val, split = "-"))[[2]])

      } else if (any(grepl("Dataset ID ", help_file_lines))) {

        type <- "dataset"
        id_idx <- which(grepl("\\section{Dataset ID and Badge}{", help_file_lines, fixed = TRUE)) + 2
        id_val <- help_file_lines[id_idx]
        title_idx <- which(grepl("\\title{", help_file_lines, fixed = TRUE))
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

    index_tbl <-
      index_tbl %>%
      dplyr::arrange(family, number) %>%
      dplyr::mutate(
        name = dplyr::case_when(
          type == "function" ~ paste0(
            "[`", name, "()`](gt-", name , ".qmd)"
          ),
          .default = name
        )
      ) %>%
      dplyr::mutate(
        group = dplyr::case_when(
          family == 1 ~ "Table creation",
          family == 2 ~ "Creating or modifying parts of a table",
          family == 3 ~ "Formatting column data",
          family == 4 ~ "Text transformation",
          family == 5 ~ "Modifying columns",
          family == 6 ~ "Adding or modifying rows",
          family == 7 ~ "Removing parts of a table",
          family == 8 ~ "Helper functions",
          family == 9 ~ "Image addition utilities",
          family == 10 ~ "Table options",
          family == 11 ~ "Informational tables for reference",
          family == 12 ~ "Shiny",
          family == 13 ~ "Export and extraction functions",
          family == 14 ~ "Working with table groups",
          family == 15 ~ "Vector formatting",
          family == 99 ~ "Built in datasets"
        )
      ) %>%
      gt(groupname_col = "group", process_md = TRUE) %>%
      fmt_markdown() %>%
      cols_hide(columns = c(type, family, number)) %>%
      tab_options(column_labels.hidden = TRUE)

    writeLines(
      text = c(
        "---",
        "format: html",
        "---",
        "",
        "```{=html}",
        as_raw_html(index_tbl),
        "```",
        ""
      ),
      con = paste0(output_dir, "/index.qmd")
    )

    writeLines(
      text = c(
        "project:",
        "  type: website",
        "render:",
        "  - \"*.qmd\"",
        "",
        "website:",
        "  title: \"The gt package\"",
        "navbar:",
        "  left:",
        "  - href: index.qmd",
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
}

#nocov end
