
#' Transform a footnote glyph to an HTML representation
#'
#' @noRd
footnote_glyph_to_html <- function(footnote_glyph) {

  paste0("<sup class='gt_footnote_glyph'>", footnote_glyph, "</sup>")
}

#' Get the spanner column label style from an attribute table
#'
#' @importFrom dplyr filter pull
#' @noRd
get_spanner_style <- function(spanner_style_attrs,
                              group_name) {

  if (group_name %in% spanner_style_attrs$grpname) {

    return(
      paste0(
        " style=\"",
        spanner_style_attrs %>%
          dplyr::filter(grpname == group_name) %>%
          dplyr::pull(styles_appended), "\"")
    )
  } else {
    return("")
  }
}

#' Get the column label style from an attribute table
#'
#' @importFrom dplyr filter pull
#' @noRd
get_column_style <- function(column_style_attrs,
                             column_name) {

  if (column_name %in% column_style_attrs$colname) {

    return(
      paste0(
        " style=\"",
        column_style_attrs %>%
          dplyr::filter(colname == column_name) %>%
          dplyr::pull(styles_appended), "\"")
    )
  } else {
    return("")
  }
}

#' Create a set of inline style attributes
#'
#' @noRd
create_style_attrs <- function(style_values) {

  style_rules <- c()

  for (style in style_values) {

    if (is.na(style)) {
      style_rules <- c(style_rules, "")
    } else {
      style_rules <- c(style_rules, paste0(" style=\"", style, "\""))
    }
  }

  style_rules
}

#' Split the body content vector into a list structure
#'
#' Taking the `body_content` vector, split into list components with one item
#' per row in the output table
#' @noRd
split_body_content <- function(body_content,
                               n_cols) {

  split(body_content, ceiling(seq_along(body_content) / n_cols))
}

#' Apply footnotes to the data rows
#'
#' @importFrom dplyr filter group_by mutate ungroup select distinct
#' @noRd
apply_styles_to_output <- function(output_df,
                                   styles_resolved,
                                   n_cols) {

  styles_output_df <- output_df
  styles_output_df[] <- NA_character_

  # `data` location
  styles_tbl_data <-
    styles_resolved %>%
    dplyr::filter(locname %in% c("data", "stub"))

  if (nrow(styles_tbl_data) > 0) {

    if ("stub" %in% styles_tbl_data$locname &&
        "rowname" %in% colnames(output_df)) {

      styles_tbl_data[
        which(is.na(styles_tbl_data$colname)), "colname"] <- "rowname"
    }

    styles_data <-
      styles_tbl_data %>%
      dplyr::group_by(rownum, colnum) %>%
      dplyr::mutate(styles_appended = paste(text, collapse = "")) %>%
      dplyr::ungroup() %>%
      dplyr::select(colname, rownum, styles_appended) %>%
      dplyr::distinct()

    for (i in seq(nrow(styles_data))) {

      styles_output_df[
        styles_data$rownum[i], styles_data$colname[i]] <-
        styles_data$styles_appended[i]
    }
  }

  # Extract `body_styles` as a vector
  body_styles <- as.vector(t(styles_output_df))

  # Split `body_styles` by slices of rows
  split_body_content(body_content = body_styles, n_cols)
}

#' Apply footnotes to the summary data cells
#'
#' @importFrom dplyr filter group_by mutate ungroup select distinct
#' @noRd
apply_styles_to_summary_output <- function(summary_df,
                                           styles_resolved,
                                           group,
                                           n_cols) {

  styles_summary_df <- summary_df
  styles_summary_df[] <- NA_character_

  styles_tbl_summary <-
    styles_resolved %>%
    dplyr::filter(locname %in% "summary_cells") %>%
    dplyr::filter(grpname == group)

  if (nrow(styles_tbl_summary) > 0) {

    styles_summary <-
      styles_tbl_summary %>%
      dplyr::group_by(grpname, colname, rownum) %>%
      dplyr::mutate(styles_appended = paste(text, collapse = "")) %>%
      dplyr::ungroup() %>%
      dplyr::select(colname, rownum, styles_appended) %>%
      dplyr::distinct() %>%
      dplyr::mutate(row = as.integer(round((rownum - floor(rownum)) * 100, 0))) %>%
      dplyr::select(colname, row, styles_appended)


    for (i in seq(nrow(styles_summary))) {

      styles_summary_df[
        styles_summary$row[i], styles_summary$colname[i]] <-
        styles_summary$styles_appended[i]
    }
  }

  # Extract `summary_styles` as a vector
  summary_styles <- as.vector(t(styles_summary_df))

  # Split `summary_styles` by slices of rows
  split_body_content(body_content = summary_styles, n_cols)
}


#' For a given location, reduce the footnote glyphs to a single string
#'
#' @param fn_tbl The table containing all of the resolved footnote information.
#' @param locname The location name for the footnotes.
#' @param delimiter The delimiter to use for the coalesced footnote glyphs.
#' @importFrom dplyr filter group_by mutate ungroup select distinct
#' @noRd
coalesce_glyphs <- function(fn_tbl,
                            locname,
                            delimiter = ",") {

  locname_enquo <- rlang::enquo(locname)

  fn_tbl %>%
    dplyr::filter(locname == !!locname) %>%
    dplyr::group_by() %>%
    dplyr::mutate(fs_id_c = paste(fs_id, collapse = delimiter)) %>%
    dplyr::ungroup() %>%
    dplyr::select(fs_id_c) %>%
    dplyr::distinct()
}

#' For a given location, reduce the HTML styles to a single string
#'
#' @param style_tbl The table containing all of the resolved HTML style
#'   information.
#' @param locname The location name for the HTML styles
#' @param delimiter The delimiter to use for the coalesced HTML style rules.
#' @importFrom dplyr filter group_by mutate ungroup select distinct
#' @noRd
coalesce_styles <- function(style_tbl,
                            locname,
                            delimiter = "") {

  locname_enquo <- rlang::enquo(locname)

  style_tbl %>%
    dplyr::filter(locname == !!locname) %>%
    dplyr::group_by() %>%
    dplyr::mutate(styles = paste(text, collapse = delimiter)) %>%
    dplyr::ungroup() %>%
    dplyr::select(colname, rownum, styles) %>%
    dplyr::distinct()
}

#' Create the opening HTML element of a table
#'
#' @noRd
apply_styles_to_grand_summary_output <- function(summary_df,
                                                 styles_resolved,
                                                 n_cols) {

  styles_summary_df <- summary_df
  styles_summary_df[] <- NA_character_

  styles_tbl_summary <-
    styles_resolved %>%
    dplyr::filter(locname %in% "grand_summary_cells")

  if (nrow(styles_tbl_summary) > 0) {

    styles_summary <-
      styles_tbl_summary %>%
      dplyr::group_by(colname, rownum) %>%
      dplyr::mutate(styles_appended = paste(text, collapse = "")) %>%
      dplyr::ungroup() %>%
      dplyr::select(colname, rownum, styles_appended) %>%
      dplyr::distinct()


    for (i in seq(nrow(styles_summary))) {

      styles_summary_df[
        styles_summary$rownum[i], styles_summary$colname[i]] <-
        styles_summary$styles_appended[i]
    }
  }

  # Extract `summary_styles` as a vector
  summary_styles <- as.vector(t(styles_summary_df))

  # Split `summary_styles` by slices of rows
  split_body_content(body_content = summary_styles, n_cols)
}

# Create the opening HTML element of a table
create_table_start_h <- function(groups_rows_df) {

  "<!--gt table start-->\n<table class='gt_table'>\n"
}

#' Create the heading component of a table
#'
#' The table heading component contains the title and possibly a subtitle; if
#' there are no heading components defined this function will return an empty
#' string.
#' @importFrom glue glue
#' @importFrom dplyr pull
#' @noRd
create_heading_component <- function(heading,
                                     footnotes_resolved,
                                     styles_resolved = NULL,
                                     n_cols,
                                     subtitle_defined,
                                     output = "html") {

  # If there is no heading component, then return
  # an empty string
  if (length(heading) == 0) {
    return("")
  }

  # Get the footnote glyphs for the title
  if ("title" %in% footnotes_resolved$locname) {

    footnote_title_glyphs <-
      footnotes_resolved %>%
      coalesce_glyphs(locname = "title")

    footnote_title_glyphs <-
      switch(output,
             html = footnote_glyph_to_html(footnote_title_glyphs$fs_id_c),
             latex = footnote_glyph_to_latex(footnote_title_glyphs$fs_id_c),
             rtf = footnote_glyph_to_rtf(footnote_title_glyphs$fs_id_c),
             stop("The context (`", output, "`) is invalid"))

  } else {
    footnote_title_glyphs <- ""
  }

  # Get the style attrs for the title
  if (output == "html" &&
      "title" %in% styles_resolved$locname) {

    title_style_attrs <-
      styles_resolved %>%
      coalesce_styles(locname = "title") %>%
      dplyr::pull(styles)

  } else {
    title_style_attrs <- NA_character_
  }

  # Get the footnote glyphs for the subtitle
  if (subtitle_defined) {

    footnote_subtitle_glyphs <-
      footnotes_resolved %>%
      coalesce_glyphs(locname = "subtitle")

    footnote_subtitle_glyphs <-
      switch(output,
             html = footnote_glyph_to_html(footnote_subtitle_glyphs$fs_id_c),
             latex = footnote_glyph_to_latex(footnote_subtitle_glyphs$fs_id_c),
             rtf = footnote_glyph_to_rtf(footnote_subtitle_glyphs$fs_id_c),
             stop("The context (`", output, "`) is invalid"))

  } else {
    footnote_subtitle_glyphs <- ""
  }

  # Get the style attrs for the subtitle
  if (output == "html" &&
      "subtitle" %in% styles_resolved$locname) {

    subtitle_style_attrs <-
      styles_resolved %>%
      coalesce_styles(locname = "subtitle") %>%
      dplyr::pull(styles)

  } else {
    subtitle_style_attrs <- NA_character_
  }

  if (output == "html") {

    title_classes <- "gt_heading gt_title gt_font_normal gt_center"
    subtitle_classes <- "gt_heading gt_subtitle gt_font_normal gt_center"

    if (!subtitle_defined) {
      title_classes <- title_classes %>% paste_right(" gt_bottom_border")
    } else {
      subtitle_classes <- subtitle_classes %>% paste_right(" gt_bottom_border")
    }

    # TODO: make `glue_char(...)` that automatically drops the `glue` class
    # with `as.character()`
    title_row <-
      glue::glue(
        "<tr>\n<th colspan='{n_cols}' class='{title_classes}'",
        "{create_style_attrs(title_style_attrs)}>{heading$title}",
        "{footnote_title_glyphs}</th>\n</tr>\n\n"
      ) %>% as.character()

    if (subtitle_defined) {

      subtitle_row <-
        glue::glue(
          "<tr>\n<th colspan='{n_cols}' class='{subtitle_classes}'",
          "{create_style_attrs(subtitle_style_attrs)}>{heading$subtitle}",
          "{footnote_subtitle_glyphs}</th>\n</tr>\n\n"
        ) %>% as.character()

    } else {
      subtitle_row <- ""
    }

    heading_component <-
      glue::glue(
        "{title_row}{subtitle_row}"
      ) %>% as.character() %>%
      paste_between(x_2 = c("<thead>\n", "</thead>\n"))
  }

  if (output == "latex") {

    title_row <-
      glue::glue(
        "\\large <<heading$title>><<footnote_title_glyphs>>\\\\ \n\n",
        .open = "<<", .close = ">>"
      ) %>% as.character()

    if (subtitle_defined) {

      subtitle_row <-
        glue::glue(
          "\\small <<heading$subtitle>><<footnote_subtitle_glyphs>>\\\\ \n\n",
          .open = "<<", .close = ">>"
        ) %>% as.character()

    } else {
      subtitle_row <- ""
    }

    heading_component <-
      glue::glue(
        "{title_row}{subtitle_row}"
      ) %>% as.character() %>%
      paste_between(x_2 = c("\\caption*{\n", "} \\\\ \n"))
  }

  if (output == "rtf") {

    if (subtitle_defined) {

      heading_component <-
        rtf_title_subtitle(
          title = paste0(remove_html(heading$title), footnote_title_glyphs),
          subtitle = paste0(remove_html(heading$subtitle), footnote_subtitle_glyphs),
          n_cols = n_cols)

    } else {

      heading_component <-
        rtf_title(
          title = paste0(remove_html(heading$heading), footnote_title_glyphs),
          n_cols = n_cols)
    }
  }

  heading_component
}

#' Create the columns component of a table (HTML)
#'
#' @import rlang
#' @importFrom dplyr filter group_by mutate ungroup select distinct
#' @noRd
create_columns_component_h <- function(boxh_df,
                                       output_df,
                                       stub_available,
                                       spanners_present,
                                       styles_resolved,
                                       stubhead_label,
                                       col_alignment,
                                       opts_df) {

  # Should the column labels be hidden?
  column_labels_hidden <-
    opts_df %>%
    opts_df_get(option = "column_labels_hidden") %>%
    as.logical()

  if (column_labels_hidden) {
    return("")
  }

  # Get the style attrs for the spanner column headings
  spanner_style_attrs <-
    styles_resolved %>%
    dplyr::filter(locname == "columns_groups") %>%
    dplyr::group_by(grpname) %>%
    dplyr::mutate(styles_appended = paste(text, collapse = "")) %>%
    dplyr::ungroup() %>%
    dplyr::select(grpname, styles_appended) %>%
    dplyr::distinct()

  # Get the style attrs for the spanner column headings
  column_style_attrs <-
    styles_resolved %>%
    dplyr::filter(locname == "columns_columns") %>%
    dplyr::group_by(colname) %>%
    dplyr::mutate(styles_appended = paste(text, collapse = "")) %>%
    dplyr::ungroup() %>%
    dplyr::select(colname, styles_appended) %>%
    dplyr::distinct()

  # Get the headings
  headings <- boxh_df["column_label", ] %>% unlist() %>% unname()

  # If `stub_available` == TRUE, then replace with a set stubhead
  #   caption or nothing
  if (stub_available &&
      length(stubhead_label) > 0) {

    headings <- rlang::prepend(headings, stubhead_label$stubhead_label)

  } else if (stub_available) {

    headings <- rlang::prepend(headings, "")
  }

  if (spanners_present == FALSE) {

    table_col_headings <- c()

    for (i in seq(headings)) {

      table_col_headings <-
        c(table_col_headings,
          paste0(
            "<th class='gt_col_heading ",
            paste0("gt_", col_alignment[i]),
            "' rowspan='1' colspan='1'",
            get_column_style(
              column_style_attrs,
              column_name = headings[i]),
            ">", headings[i], "</th>")
        )
    }

    table_col_headings <-
      paste0(
        "<tr>\n",
        paste0(table_col_headings, collapse = "\n"), "\n</tr>\n")

  } else {

    # spanners
    spanners <-
      boxh_df["group_label", ] %>%
      unlist() %>%
      unname()

    first_set <- second_set <- headings_stack <- c()

    if (stub_available) {

      first_set <-
        c(first_set,
          paste0(
            "<th class='gt_col_heading ", paste0("gt_", col_alignment[1]),
            "' rowspan='2' colspan='1'",
            get_column_style(column_style_attrs, column_name = headings[1]),
            ">", headings[1], "</th>"))

      headings <- headings[-1]
    }

    for (i in seq(headings)) {

      if (is.na(spanners[i])) {

        first_set <-
          c(first_set,
            paste0(
              "<th class='gt_col_heading gt_center' rowspan='2' colspan='1'",
              get_column_style(
                column_style_attrs,
                column_name = colnames(boxh_df)[i]),
              ">", headings[i], "</th>")
          )

        headings_stack <- c(headings_stack, headings[i])

      } else if (!is.na(spanners[i])) {

        if (i > 1) {
          if (is.na(spanners[i - 1])) {
            same_spanner <- FALSE
          } else if (spanners[i] == spanners[i - 1]) {
            same_spanner <- TRUE
          } else {
            same_spanner <- FALSE
          }
        } else {
          same_spanner <- FALSE
        }

        if (!same_spanner) {

          class <- "gt_column_spanner"

          colspan <- 1L

          for (j in 1:length(spanners)) {

            if (is.na(spanners[i + j])) {
              spanner_adjacent <- FALSE
              break
            } else if (duplicated(spanners)[i + j]) {
              colspan <- colspan + 1L
            } else {
              spanner_adjacent <- ifelse(!is.na(spanners[i + j]), TRUE, FALSE)
              break
            }
          }

          if (spanner_adjacent) {
            class <- paste0(class, " gt_sep_right")
          }

          first_set <-
            c(first_set,
              paste0(
                "<th class='gt_col_heading ",
                class, " ",
                ifelse(
                  colspan > 1, "gt_center",
                  paste0("gt_", col_alignment[-1][i])),
                "' rowspan='1' colspan='", colspan, "'",
                get_spanner_style(
                  spanner_style_attrs,
                  group_name = spanners[i]),
                ">", spanners[i], "</th>")
            )
        }
      }
    }

    first_set <- paste(first_set, collapse = "\n")

    remaining_headings <- headings[!(headings %in% headings_stack)]

    remaining_headings_indices <- which(remaining_headings %in% headings)

    col_alignment <- col_alignment[-1][!(headings %in% headings_stack)]

    if (length(remaining_headings) > 0) {

      second_set <- c()

      for (j in seq(remaining_headings)) {

        second_set <-
          c(second_set,
            paste0(
              "<th class='gt_col_heading ",
              paste0("gt_", col_alignment[j]), "' rowspan='1' colspan='1'",
              get_column_style(
                column_style_attrs,
                column_name = colnames(boxh_df)[remaining_headings_indices[j]]),
              ">", remaining_headings[j], "</th>")
          )
      }

      second_set <- paste(second_set, collapse = "\n")

      # Create the `table_col_headings` HTML component
      table_col_headings <-
        paste0(
          "<tr>\n",
          first_set, "\n</tr>\n<tr>\n",
          second_set, "\n</tr>\n")

    } else {

      # Create the `table_col_headings` HTML component
      table_col_headings <- paste0("<tr>\n", first_set, "\n</tr>\n")
    }
  }

  table_col_headings
}

#' Create the table body component (HTML)
#'
#' @importFrom dplyr mutate filter pull
#' @noRd
create_body_component_h <- function(row_splits_body,
                                    row_splits_styles,
                                    styles_resolved,
                                    groups_rows_df,
                                    col_alignment,
                                    stub_components,
                                    summaries_present,
                                    list_of_summaries,
                                    n_rows,
                                    n_cols,
                                    opts_df) {

  if (is.null(stub_components)) {
    stub_available <- FALSE
  } else if (stub_component_is_groupname(stub_components)) {
    stub_available <- FALSE
  } else {
    stub_available <- TRUE
  }

  # Get the sequence of column numbers in the table body
  column_series <- seq(n_cols)

  # If there is a stub, remove the last element in the series
  if (stub_available) {
    column_series <- column_series[-length(column_series)]
  }

  # Replace an NA group with an empty string
  if (any(is.na(groups_rows_df$group))) {

    groups_rows_df <-
      groups_rows_df %>%
      dplyr::mutate(group_label = ifelse(is.na(group_label), "", group_label)) %>%
      dplyr::mutate(group_label = gsub("^NA", "\u2014", group_label))
  }

  # Is the stub to be striped?
  stub_striped <-
    opts_df %>%
    opts_df_get(option = "row_striping_include_stub") %>%
    as.logical()

  # Are the rows in the table body to be striped?
  table_body_striped <-
    opts_df %>%
    opts_df_get(option = "row_striping_include_table_body") %>%
    as.logical()

  body_rows <- c()

  for (i in 1:n_rows) {

    if (!is.null(groups_rows_df) &&
        i %in% groups_rows_df$row) {

      group_name <-
        groups_rows_df %>%
        dplyr::filter(row == i) %>%
        dplyr::pull(group)

      group_style <-
        styles_resolved %>%
        filter(locname == "stub_groups") %>%
        dplyr::filter(grpname == group_name) %>%
        dplyr::pull(text)

      # Process `group` rows
      body_rows <-
        c(body_rows,
          paste0(
            "<tr class='gt_group_heading_row'",
            ">\n",
            "<td colspan='", n_cols, "' ",
            "class='",
            ifelse(
              groups_rows_df[which(groups_rows_df$row %in% i), "group_label"][[1]] == "",
              "gt_empty_group_heading", "gt_group_heading"),
            "'",
            ifelse(
              length(group_style) > 0,
              paste0(" style='", paste(group_style, collapse = ","), "'"), ""),
            ">",
            groups_rows_df[which(groups_rows_df$row %in% i), "group_label"][[1]],
            "</td>\n",
            "</tr>\n")
        )
    }

    if (stub_available) {

      # Process "data" rows where a stub is present
      body_rows <-
        c(body_rows,
          paste0(
            "<tr>\n",
            paste0(
              "<td class='gt_row gt_stub gt_", col_alignment[1],
              ifelse(i %% 2 == 0 && stub_striped, " gt_striped", ""), "'",
              create_style_attrs(row_splits_styles[[i]][1]),
              ">", row_splits_body[[i]][1],
              "</td>"), "\n",
            paste0(
              "<td class='gt_row gt_", col_alignment[-1],
              ifelse(i %% 2 == 0 && table_body_striped, " gt_striped", ""), "'",
              create_style_attrs(row_splits_styles[[i]][-1]),
              ">", row_splits_body[[i]][-1],
              "</td>", collapse = "\n"),
            "\n</tr>\n") %>%
            tidy_gsub(" style=\"\"", "")
        )

    } else {

      # Process "data" rows where no stub is present
      body_rows <-
        c(body_rows,
          paste0(
            "<tr>\n",
            paste0(
              "<td class='gt_row gt_", col_alignment,
              ifelse(i %% 2 == 0 && table_body_striped, " gt_striped", ""), "'",
              create_style_attrs(row_splits_styles[[i]]),
              ">", row_splits_body[[i]],
              "</td>", collapse = "\n"),
            "\n</tr>\n"))
    }

    if (stub_available && summaries_present &&
        i %in% groups_rows_df$row_end) {

      group <-
        groups_rows_df %>%
        dplyr::filter(row_end == i) %>%
        dplyr::pull(group)

      if (group %in% names(list_of_summaries$summary_df_display_list)) {

        summary_df <-
          list_of_summaries$summary_df_display_list[[
            which(names(list_of_summaries$summary_df_display_list) == group)]] %>%
          as.data.frame(stringsAsFactors = FALSE)

        row_splits_summary_styles <-
          apply_styles_to_summary_output(summary_df, styles_resolved, group, n_cols)

        body_content_summary <- as.vector(t(summary_df))

        row_splits_summary <-
          split_body_content(
            body_content = body_content_summary,
            n_cols = n_cols)

        # Provide CSS classes for leading and non-leading summary rows
        summary_row_classes_first <- "gt_summary_row gt_first_summary_row "
        summary_row_classes <- "gt_summary_row "

        summary_row_lines <- c()

        for (j in seq(length(row_splits_summary))) {

          summary_row_lines <-
            c(summary_row_lines,
              paste0(
                "<tr>\n",
                paste0(
                  "<td class='gt_stub gt_row ",
                  ifelse(j == 1, summary_row_classes_first, summary_row_classes),
                  "gt_", col_alignment[1], "'",
                  create_style_attrs(row_splits_summary_styles[[j]][1]), ">",
                  row_splits_summary[[j]][1],
                  "</td>"), "\n",
                paste0(
                  "<td class='gt_row ",
                  ifelse(j == 1, summary_row_classes_first, summary_row_classes),
                  "gt_", col_alignment[-1], "'",
                  create_style_attrs(row_splits_summary_styles[[j]][-1]), ">",
                  row_splits_summary[[j]][-1],
                  "</td>", collapse = "\n"),
                "\n</tr>\n")
            )
        }

        body_rows <- c(body_rows, summary_row_lines)
      }
    }
  }

  # If there is a grand summary, include that at the end
  if (summaries_present &&
      grand_summary_col %in% names(list_of_summaries$summary_df_display_list)) {

    grand_summary_df <-
      list_of_summaries$summary_df_display_list[[grand_summary_col]] %>%
      as.data.frame(stringsAsFactors = FALSE)

    row_splits_summary_styles <-
      apply_styles_to_grand_summary_output(
        summary_df = grand_summary_df,
        styles_resolved = styles_resolved,
        n_cols = n_cols
      )

    grand_summary <- as.vector(t(grand_summary_df))

    row_splits_grand_summary <-
      split_body_content(
        body_content = grand_summary,
        n_cols = n_cols)

    # Provide CSS classes for leading and
    # non-leading grand summary rows
    gs_row_classes_first <- "gt_grand_summary_row gt_first_grand_summary_row "
    gs_row_classes <- "gt_grand_summary_row "

    grand_summary_row_lines <- c()

    for (j in seq(length(row_splits_grand_summary))) {

      grand_summary_row_lines <-
        c(grand_summary_row_lines,
          paste0(
            "<tr>\n",
            paste0(
              "<td class='gt_stub gt_row ",
              ifelse(j == 1, gs_row_classes_first, gs_row_classes),
              "gt_", col_alignment[1], "'",
              create_style_attrs(row_splits_summary_styles[[j]][1]), ">",
              row_splits_grand_summary[[j]][1],
              "</td>"), "\n",
            paste0(
              "<td class='gt_row ",
              ifelse(j == 1, gs_row_classes_first, gs_row_classes),
              "gt_", col_alignment[-1], "'",
              create_style_attrs(row_splits_summary_styles[[j]][-1]), ">",
              row_splits_grand_summary[[j]][-1],
              "</td>", collapse = "\n"),
            "\n</tr>\n")
        )
    }

    body_rows <- c(body_rows, grand_summary_row_lines)
  }

  # Create a single-length vector by collapsing all vector components
  body_rows <- body_rows %>% paste(collapse = "")

  # Create the `table_body` HTML component
  paste0(
    "<tbody class='gt_table_body'>\n",
    body_rows,
    "</tbody>\n")
}

#' Create the table source note component (HTML)
#'
#' @noRd
create_source_note_component_h <- function(source_note,
                                           n_cols) {

  if (length(source_note) == 0) {
    return("")
  }

  paste0(
    "<tfoot>\n",
    paste0(
      "<tr>\n",
      "<td colspan='", n_cols + 1 ,
      "' class='gt_sourcenote'>", source_note$source_note,
      "</td>\n</tr>\n",
      collapse = ""),
    "</tfoot>\n")
}

#' Create the table footnote component (HTML)
#'
#' @importFrom dplyr select distinct filter pull
#' @noRd
create_footnote_component_h <- function(footnotes_resolved,
                                        opts_df,
                                        n_cols) {

  # If the `footnotes_resolved` object has no
  # rows, then return an empty footnotes component
  if (nrow(footnotes_resolved) == 0) {
    return("")
  }

  footnotes_tbl <-
    footnotes_resolved %>%
    dplyr::select(fs_id, text) %>%
    dplyr::distinct()

  # Get the separator option from `opts_df`
  separator <- opts_df %>%
    dplyr::filter(parameter == "footnote_sep") %>%
    dplyr::pull(value)

  # Create the footnotes block
  footnote_component <-
    paste0(
      "<tfoot>\n",
      "<tr>\n<td colspan='", n_cols, "' ",
      "class='gt_footnote'>",
      paste0(
        "<sup class='gt_footnote_glyph'><em>", footnotes_tbl[["fs_id"]],
        "</em></sup> ", footnotes_tbl[["text"]],
        collapse = separator),
      "</td>\n</tr>\n</tfoot>")

  footnote_component
}

#' Create the closing HTML element of a table
#'
#' @noRd
create_table_end_h <- function() {

  "</table>\n<!--gt table end-->\n"
}
