# Function to get the package docs RdDB for any package
get_package_docs <- function(pkg) {
  help_dir <- system.file("help", package = pkg)
  db_path <- file.path(help_dir, pkg)
  tools:::fetchRdDB(db_path)
}

get_topic_names <- function(pkg) {

  topic_names <- names(get_package_docs(pkg = "gt"))

  # Exclude any topics that have `.` or `-` characters within their names,
  # and, exclude the 'pipe' and 'reexports' topic
  topic_names[
    !grepl("\\.", topic_names) &
      !grepl("-", topic_names) &
      !grepl("^pipe$", topic_names) &
      !grepl("^reexports$", topic_names)
  ]
}

get_example_text <- function(pkg, topic) {

  topic_names <- names(get_package_docs(pkg = "gt"))

  examples_out <- c()

  for (i in seq_along(topic)) {

    if (!(topic[i] %in% topic_names)) {
      stop("The provided `topic` is not available in `pkg`.", call. = FALSE)
    }

    topic_idx <- which(topic_names == topic[i])
    topic_docs <- get_package_docs(pkg = "gt")[[topic_idx]]
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

  topic_names <- get_topic_names(pkg = "gt")

  topic_examples <- c()

  for (i in seq_along(topic_names)) {

    topic_examples <-
      c(
        topic_examples,
        get_example_text(pkg = "gt", topic = topic_names[i])
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
    output_dir = "gt_qmd_examples"
) {

  if (is.null(topics)) {

    topics <-
      base::setdiff(
        get_topic_names(pkg = "gt"),
        c(
          "countrypops",
          "sza",
          "gtcars",
          "sp500",
          "pizzaplace",
          "exibble",
          "towny",
          "metro",
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
        "library(tidyverse)",
        "```",
        "",
        paste0("## The `", topic, "()` function"),
        "",
        get_example_text(pkg = "gt", topic = topic)
      ),
      con = paste0(output_dir, "/gt-", topic, ".qmd")
    )
  }
}
