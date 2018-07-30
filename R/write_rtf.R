#' Save a gt table object as an RTF file
#'
#' Take a \code{gt_tbl} table object and render it to an RTF file with the
#' extension \code{.rtf}.
#' @param data a table object that is created using the \code{gt()} function.
#' @param file a filename to use for writing out the RTF file.
#' @importFrom dplyr mutate group_by summarize ungroup rename arrange
#' @importFrom stringr str_extract_all str_replace
#' @importFrom stats setNames
#' @examples
#' \dontrun{
#' # Create a `gt` table using the `sleep`
#' # dataset and then write the table to
#' # an RTF file
#' gt(data = sleep) %>%
#'   write_rtf(file = "sleep.rtf")
#' }
#' @family table export functions
#' @export
write_rtf <- function(data, file) {

  # Extract internal data frames
  fmts_df <- attr(data, "fmts_df")
  boxh_df <- attr(data, "boxh_df")
  stub_df <- attr(data, "stub_df")
  foot_df <- attr(data, "foot_df")

  # Get the available property names
  property_names <-
    base::setdiff(
      names(attributes(data)),
      c("row.names", "class", "names", "boxh_df", "stub_df",
        "fmts_df", "foot_df", "output_df", "formats"))

  # Create `output_df` with rendered values
  output_df <- render_formats(data = data, context = "rtf")

  # Move input data cells to `output_df` that didn't have
  # any rendering applied during `render_formats()`
  output_df <-
    migrate_unformatted_to_output(
      data = data,
      output_df = output_df)

  # Apply column names to column labels for any of
  # those column labels not explicitly set
  boxh_df <-
    migrate_colnames_to_labels(
      boxh_df = boxh_df)

  # Assign center alignment for all columns
  # that haven't had alignment explicitly set
  boxh_df <-
    set_default_alignments(
      boxh_df = boxh_df)

  # Determine if there is a populated stub
  stub_available <- is_stub_available(stub_df = stub_df)

  # Determine if there are any groups present
  groups_present <- are_groups_present(stub_df = stub_df)

  # Determine if there are any spanners present
  spanners_present <- are_spanners_present(boxh_df = boxh_df)

  # Get the available stub components, if any
  stub_components <- get_stub_components(stub_df = stub_df)

  # Perform any necessary column merge operations
  if ("col_merge" %in% property_names) {

    perform_col_merge <- function(data,
                                  output_df,
                                  boxh_df,
                                  fmts_df,
                                  foot_df) {

      for (i in seq(attr(data, "col_merge")[[1]])) {

        type <- attr(data, "col_merge")[["type"]][i]
        value_1_col <- attr(data, "col_merge")[["col_1"]][i] %>% unname()
        value_2_col <- attr(data, "col_merge")[["col_1"]][i] %>% names()

        values_1 <- output_df[, which(colnames(output_df) == value_1_col)]
        values_2 <- output_df[, which(colnames(output_df) == value_2_col)]

        values_1_data <- data[, which(colnames(data) == value_1_col)]
        values_2_data <- data[, which(colnames(data) == value_2_col)]

        for (j in seq(values_1)) {

          if (!is.na(values_1[j]) && !grepl("NA", values_1[j]) &&
              !is.na(values_2[j]) && !grepl("NA", values_2[j]) &&
              !is.na(values_1_data[j]) && !is.na(values_2_data[j])) {

            values_1[j] <-
              format %>%
              stringr::str_replace(fixed("{1}"), values_1[j]) %>%
              stringr::str_replace(fixed("{2}"), values_2[j])
          }
        }

        output_df[, which(colnames(output_df) == value_1_col)] <- values_1

        # Remove the second column across key dfs
        boxh_df <- boxh_df[, -which(colnames(output_df) == value_2_col)]
        fmts_df <- fmts_df[, -which(colnames(output_df) == value_2_col)]
        foot_df <- foot_df[, -which(colnames(output_df) == value_2_col)]
        output_df <- output_df[, -which(colnames(output_df) == value_2_col)]

        boxh_df <<- boxh_df
        fmts_df <<- fmts_df
        foot_df <<- foot_df
        output_df <<- output_df
      }
    }

    perform_col_merge(
      data = data,
      output_df = output_df,
      boxh_df = boxh_df,
      fmts_df = fmts_df,
      foot_df = foot_df)
  }

  # Extract the table (case of table with no stub)
  if (is.null(stub_components)) {

    extracted <- output_df
    col_alignment <- boxh_df[3, ] %>% t() %>% as.vector()
    groups_rows <- NULL
  }

  # Extract the table (case of table with a stub w/ only row names)
  if (!is.null(stub_components) && all(stub_components == "row_name")) {

    colnames(stub_df)[2] <- ":row_name:"
    extracted <- cbind(stub_df, output_df)[, -1]
    col_alignment <- c("right", boxh_df[3, ] %>% t() %>% as.vector())
    groups_rows <- NULL
  }

  # Extract the table (case of table with a stub w/ only group names)
  if (!is.null(stub_components) && all(stub_components == "group_name")) {

    colnames(stub_df)[1] <- ":group_name:"
    extracted <- cbind(stub_df, output_df)[, -2]
    col_alignment <- c("right", boxh_df[3, ] %>% t() %>% as.vector())
    groups_rows <- NULL
  }

  # Extract the table (case of table with a stub of row and group names)
  if (!is.null(stub_components) && all(stub_components == c("row_name", "group_name"))) {

    colnames(stub_df) <- c(":group_name:", ":row_name:")

    # Combine stub with output table to form `extracted`
    extracted <- cbind(stub_df, output_df)

    # Replace NA values in the `:group_name:` column
    if ("others_group" %in% property_names) {
      extracted[which(is.na(extracted[, 1])), 1] <- attr(data, "others_group")[[1]]
    } else {
      extracted[which(is.na(extracted[, 1])), 1] <- "Others"
    }

    if ("arrange_groups" %in% property_names) {

      ordering <- attr(data, "arrange_groups")$groups

      all_groups <- unique(extracted[, 1])

      ordering <- c(ordering, base::setdiff(all_groups, ordering))

      fmts_df <- cbind(extracted[, 1:2], fmts_df)
      foot_df <- cbind(extracted[, 1:2], foot_df)

      extracted_reorder <- fmts_df_reorder <- foot_df_reorder <- extracted[0, ]

      for (i in seq(ordering)) {

        extracted_reorder <-
          rbind(
            extracted_reorder,
            subset(extracted, `:group_name:` == ordering[i]))

        fmts_df_reorder <-
          rbind(
            fmts_df_reorder,
            subset(fmts_df, `:group_name:` == ordering[i]))

        foot_df_reorder <-
          rbind(
            foot_df_reorder,
            subset(foot_df, `:group_name:` == ordering[i]))
      }

      rownames(extracted_reorder) <- NULL
      rownames(fmts_df_reorder) <- NULL
      rownames(foot_df_reorder) <- NULL

      fmts_df <- fmts_df_reorder[, -c(1:2)]
      foot_df <- foot_df_reorder[, -c(1:2)]
      extracted <- extracted_reorder
    }

    groups_rows <-
      extracted %>%
      dplyr::mutate(`:row_number:` = 1:nrow(extracted)) %>%
      dplyr::group_by(`:group_name:`) %>%
      dplyr::summarize(row = min(`:row_number:`)) %>%
      dplyr::ungroup() %>%
      dplyr::rename(group = `:group_name:`) %>%
      dplyr::arrange(row)

    extracted <- extracted[, -1]
    col_alignment <- c("right", boxh_df[3, ] %>% t() %>% as.vector())
  }

  # Reset the rownames for the extracted content
  rownames(extracted) <- NULL

  # Get the number of rows and columns in `extracted`
  n_rows <- nrow(extracted)
  n_cols <- ncol(extracted)

  # Extract footnote references and place into a separate list
  list_footnotes <-
    stringr::str_extract_all(
      string = as.vector(t(cbind(stub_df, foot_df)[, -1])),
      pattern = "::foot_\\d+?")

  for (i in seq(list_footnotes)) {
    if (length(list_footnotes[[i]]) == 0) {
      list_footnotes[[i]] <- NA
    } else {
      list_footnotes[[i]] <- gsub("::foot_", "", list_footnotes[[i]])
    }
  }

  # Extract the body content as a vector
  body_content <- as.vector(t(extracted))

  # Replace any NA values
  if ("missing_mark" %in% property_names) {

    for (i in seq(body_content)) {
      if (is.na(body_content[i]) | grepl("^\\s*?NA\\s*?$", body_content[i])) {
        body_content[i] <- attr(data, "missing_mark")[[1]]
      }
    }
  }

  # Handle any available footnotes
  if ("footnote" %in% property_names) {

    glyphs_footnotes <- c()

    for (i in seq(list_footnotes)) {

      if (any(!is.na(list_footnotes[[i]]))) {

        footnote_glyph <- c()
        footnote_indices <- list_footnotes[[i]]

        for (j in seq(footnote_indices)) {

          footnote_text <-
            attr(data, "footnote")[[1]][
              which(names(attr(data, "footnote")[[1]]) == footnote_indices[j])] %>%
            unname() %>%
            remove_html()

          # Check if the footnote text has been seen before
          if (!(footnote_text %in% glyphs_footnotes)) {
            glyphs_footnotes <-
              c(glyphs_footnotes, stats::setNames(footnote_text, footnote_indices[j]))
          }

          footnote_glyph <-
            c(footnote_glyph, unname(which(glyphs_footnotes == footnote_text)))
        }

        body_content[i] <-
          paste0(body_content[i], " (", paste(footnote_glyph, collapse = ","), ")")
      }
    }

    # Create the footnotes block
    footnote_component <-
      paste0(
        "\\pard\\pardeftab720\\sl288\\slmult1\\partightenfactor0\n",
        paste0(
          "\\f2\\i\\fs14\\fsmilli7333 \\cf2 \\super \\strokec2 ", seq(glyphs_footnotes),
          "\\f0\\i0\\fs22 \\cf2 \\nosupersub \\strokec2  ", unname(glyphs_footnotes), "\\",
          collapse = "\n"), "\n")

  } else {
    footnote_component <- ""
  }

  # Create a heading
  if ("heading" %in% property_names) {

    if (attr(data, "heading")[["headnote"]] != "") {

      heading_component <-
        rtf_title_headnote(
          title = attr(data, "heading")[["title"]] %>% remove_html(),
          headnote = attr(data, "heading")[["headnote"]] %>% remove_html(),
          n_cols = n_cols)

    } else {

      heading_component <-
        rtf_title(
          title = attr(data, "heading")[["title"]] %>% remove_html(),
          n_cols = n_cols)
    }
  } else {
    heading_component <- ""
  }

  if ("source_note" %in% property_names) {

    # Create a source note
    source_note_rows <-
      paste0(
        "\\pard\\pardeftab720\\sl288\\slmult1\\partightenfactor0\n",
        paste0(
          "\\cf2 \\strokec2 ", remove_html(attr(data, "source_note")[[1]]), "\\\n",
          collapse = ""),
        collapse = "")
  } else {
    source_note_rows <- ""
  }

  # Split the body_content by slices of rows
  row_splits <-
    split(body_content, ceiling(seq_along(body_content)/n_cols))

  body_rows <- c()
  for (i in 1:n_rows) {

    if (!is.null(groups_rows) && i %in% groups_rows$row) {

      body_rows <-
        c(body_rows,
          rtf_body_row(
            c(
              groups_rows[which(groups_rows$row %in% i), 1][[1]],
              rep("", n_cols - 1)), type = "group"))
    }

    if (i != length(row_splits)) {
      body_rows <-
        c(body_rows, rtf_body_row(row_splits[[i]], type = "row"))
    } else {
      body_rows <-
        c(body_rows, rtf_last_body_row(content = row_splits[[i]]))
    }
  }

  body_rows <- paste0(body_rows, collapse = "")

  table_start <- rtf_head()

  table_end <- "}\n"

  # Get the headings
  headings <- names(extracted)

  # Merge the heading labels
  headings_rev <- headings %>% rev()
  labels_rev <- boxh_df[2, ] %>% unname() %>% t() %>% as.vector() %>% rev()

  for (i in seq(labels_rev)) {
    headings_rev[i] <- labels_rev[i]
  }
  headings <- rev(headings_rev)

  # If `stub_available` == TRUE, then replace with a set stubhead
  # caption or nothing
  if (stub_available &&
      "stubhead_caption" %in% property_names &&
      ":row_name:" %in% headings) {
    headings[which(headings == ":row_name:")] <-
      attr(data, "stubhead_caption")[[1]]
  } else if (":row_name:" %in% headings) {
    headings[which(headings == ":row_name:")] <- ""
  }

  # Remove any HTML tags from `headings`
  headings <- remove_html(headings)

  if (spanners_present == FALSE) {

    table_col_headings <-
      paste0(rtf_heading_row(content = headings), collapse = "")

  } else {

    # spanners
    spanners <- boxh_df[1, ] %>% t() %>% as.vector()

    # Remove any HTML tags from `spanners`
    spanners <- remove_html(spanners)

    if (stub_available) {
      spanners <- c(NA_character_, spanners)
    }

    for (i in seq(spanners)) {
      if (is.na(spanners[i])) {
        spanners[i] <- headings[i]
      }
    }

    spanners_lengths <- rle(spanners)

    table_col_headings <-
      rtf_heading_group_row(
        spanners_lengths = spanners_lengths,
        headings = headings,
        spanners = spanners)
  }

  # Compose the RTF table
  rtf_table <-
    paste0(
      table_start,
      heading_component,
      table_col_headings,
      body_rows,
      source_note_rows,
      footnote_component,
      table_end,
      collapse = "")

  # Ensure that the filename has the extension `.rtf`
  if (!grepl("\\.rtf", file)) {
    file <- paste0(file, ".rtf")
  }

  # Write the RTF lines to a file
  rtf_table %>% writeLines(file)
}
