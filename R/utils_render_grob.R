as_grob <- function(data){

  stop_if_not_gt(data = data)

  # Build all table data objects through a common pipeline
  data <- build_data(data = data, context = "word")

  # Create the heading component
  heading_component <- create_heading_component_grob(data = data)

  # Create the columns component
  columns_component <- create_columns_component_grob(data = data)

  # Create the body component
  body_component <- create_body_component_grob(data = data)

  # Create the footer component
  footer_component <- create_footer_component_grob(data = data)

  # Create the source notes component
  source_notes_component <- create_source_notes_component_grob(data = data)


  # Construct table as a grob with gtable
  construct_gtable(
    header = heading_component,
    col_labels = columns_component,
    body = body_component,
    footer = footer_component,
    source_notes = source_notes_component
  )

}

#' @importFrom gtable gtable
construct_gtable <- function(header, col_labels, body, footer, source_notes){

  main_table_components <- c(col_labels, body)

  grob_nrows <- length(main_table_components)
  grob_ncols <- max(lengths(body), 1)


  cell_dims <- get_cell_dims(main_table_components, grob_ncols)

  if(!is.null(header)){
    grob_nrows <- grob_nrows + length(header)
    header_dims <- get_cell_dims(header, 1)
    cell_dims$heights <- c(header_dims$heights, cell_dims$heights)
  }

  if(!is.null(footer)){
    grob_nrows <- grob_nrows + length(footer)
    footer_dims <- get_cell_dims(footer, length(footer))
    cell_dims$heights <- c(cell_dims$heights, footer_dims$heights)
  }

  if(!is.null(source_notes)){
    grob_nrows <- grob_nrows + length(source_notes)
    source_notes_dims <- get_cell_dims(source_notes, length(source_notes))
    cell_dims$heights <- c(cell_dims$heights, source_notes_dims$heights)
  }

  col_widths <- cell_width_units(cell_dims$widths)
  row_heights <- cell_height_units(cell_dims$heights)

  grob_table <- gtable(widths = col_widths, heights = row_heights)

  if(!is.null(header)){
    for(i in seq_along(header)){
      grob_table <- gg_add_table_row(grob_table, header[[i]], row = i , clip = "off")
    }

    offset <- i

  }else{
    offset <- 0
  }


  for(i in seq_along(main_table_components)){
    grob_table <- gg_add_table_row(grob_table, main_table_components[[i]], row = i + offset)
  }

  offset <- i + offset

  if(!is.null(footer)){
    for(i in seq_along(footer)){
      grob_table <- gg_add_table_row(grob_table, footer[[i]], row = i + offset)
    }
  }

  offset <- i + offset


  if(!is.null(source_notes)){
    for(k in seq_along(source_notes)){
      grob_table <- gg_add_table_row(grob_table, source_notes[[k]], row = k + offset)
    }
  }

  structure(
    grob_table,
    class = c("gt_grob", class(grob_table))
  )

}

#' @importFrom grid grid.newpage grid.draw
#' @export
print.gt_grob <- function(x,  ...) {
  grid.newpage()

  # Record dependency on 'ggplot2' on the display list
  # (AFTER grid.newpage())
  grDevices::recordGraphics(requireNamespace("gt", quietly = TRUE),
                            list(),
                            getNamespace("gt"))

  grid.draw(x)

}

gg_add_table_row <- function(g, cells, row ,...){

  for(cell in cells){
    g <- gg_table_add_grob(
      g,
      cell,
      col = attr(cell, ".col"),
      row = row,
      span_cols = attr(cell, ".cell_col_span"),
      span_rows = attr(cell, ".cell_row_span"),
      ...
    )
  }

  g

}

#' @importFrom gtable gtable_add_grob
gg_table_add_grob <- function(g, grob, col, row, span_cols = 1, span_rows = 1, ...){
  gtable_add_grob(
    x = g,
    grobs = grob,
    l = col,  r = col + (span_cols - 1),
    t = row,  b = row + (span_rows - 1),
    ...
  )
}

get_cell_dims <- function(x, ncol = 1){

  heights <- rep(0,length(x))
  widths <- rep(0, ncol)

  for(r in seq_along(x)){
    row_height <- heights[[r]]

    for(cell in x[[r]]){

      column <- attr(cell, ".col")
      font_size <- attr(cell, ".text_size")
      cell_rows <- attr(cell, ".text_rows")
      cell_nchar <- attr(cell, ".text_cols")

      ## guestimation to what the height/width is
      height <- font_size/9 * cell_rows
      width <-  max(cell_nchar,1)

      if(width > widths[[column]]){
        widths[[column]] <- width
      }

      if(height > row_height){
        row_height <- height
      }
    }
    heights[[r]] <- row_height
  }

  list(
    heights = heights,
    widths = widths
  )

}

#' @importFrom grid unit convertX
cell_width_units <- function(x){
    convertX(
      unit(
        (x * (1 + (1/(x + 3)))) / 63,
        "strwidth",
        "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789 "
      ),"npc"
    )
}

#' @importFrom grid unit convertY
cell_height_units <- function(x){
  convertY(unit(x * 1.5, "char"),"npc")
}


#' Create the heading component of a table (grob)
#'
#' The table heading component contains the title and possibly a subtitle; if
#' there are no heading components defined this function will return an empty
#' string.
#'
#' @noRd
create_heading_component_grob <- function(data) {

  # If there is no title or heading component, then return an empty string
  if (!dt_heading_has_title(data = data)) {
    return(NULL)
  }

  heading <- dt_heading_get(data = data)
  footnotes_tbl <- dt_footnotes_get(data = data)
  styles_tbl <- dt_styles_get(data = data)
  stub_components <- dt_stub_components(data = data)
  subtitle_defined <- dt_heading_has_subtitle(data = data)

  # Obtain the number of visible columns in the built table
  n_data_cols <- length(dt_boxhead_get_vars_default(data = data))

  # Determine whether the stub is available
  stub_available <- dt_stub_components_has_rowname(stub_components)

  # If a stub is present then the effective number of columns increases by 1
  if (stub_available) {
    n_cols <- n_data_cols + 1
  } else {
    n_cols <- n_data_cols
  }

  # Get table options
  table_font_color <- dt_options_get_value(data, option = "table_font_color")
  table_border_top_include <- dt_options_get_value(data, option = "table_border_top_include")
  heading_border_bottom_color <- dt_options_get_value(data, option = "heading_border_bottom_color")

  # Get the footnote marks for the title
  if ("title" %in% footnotes_tbl$locname) {

    footnote_title_marks <-
      coalesce_marks(
        fn_tbl = footnotes_tbl,
        locname = "title"
      )

    footnote_title_marks <-
      footnote_mark_to_grob(mark = footnote_title_marks$fs_id_c)

  } else {
    footnote_title_marks <- ""
  }

  header_grobs <- list(
    title = list(
      table_cell_grob(
        text = paste0(heading$title, footnote_title_marks),
        font = "sans",
        color = table_font_color,
        size = 16,
        align = "center",
        v_align = "middle",
        col = 1,
        col_span = n_cols,
        border = if (table_border_top_include) {
          list(
            top = list(size = 4, color = heading_border_bottom_color),
            bottom = if(!subtitle_defined){list(size = 4, color = heading_border_bottom_color)}
          )
        }
      )
    )
  )

  if(subtitle_defined){

    # Get the footnote marks for the subtitle
    if (subtitle_defined && "subtitle" %in% footnotes_tbl$locname) {

      footnote_subtitle_marks <-
        coalesce_marks(
          fn_tbl = footnotes_tbl,
          locname = "subtitle"
        )

      footnote_subtitle_marks <-
        footnote_mark_to_grob(mark = footnote_subtitle_marks$fs_id_c)

    } else {
      footnote_subtitle_marks <- ""
    }

    header_grobs <- c(
        header_grobs,
        list(
          subtitle = list(
            table_cell_grob(
              text = paste0(heading$subtitle, footnote_subtitle_marks),
              font = "sans",
              color = table_font_color,
              size = 14,
              align = "center",
              v_align = "middle",
              col = 1,
              col_span = n_cols,
              border = if (table_border_top_include) {
                list(
                  bottom = list(size = 4, color = heading_border_bottom_color)
                )
              }
            )
          )
        )
      )
  }

  header_grobs
}

create_columns_component_grob <- function(data) {

  boxh <- dt_boxhead_get(data = data)
  stubh <- dt_stubhead_get(data = data)
  body <- dt_body_get(data = data)
  styles_tbl <- dt_styles_get(data = data)
  stub_available <- dt_stub_df_exists(data = data)
  spanners_present <- dt_spanners_exists(data = data)

  # Get the column alignments for all visible columns
  col_alignment <- dplyr::pull(subset(boxh, type == "default"), column_align)

  # Get the column headings
  headings_vars <- dplyr::pull(subset(boxh, type == "default"), var)
  headings_labels <- dt_boxhead_get_vars_labels_default(data = data)

  # Determine the finalized number of spanner rows
  spanner_row_count <-
    dt_spanners_matrix_height(
      data = data,
      omit_columns_row = TRUE
    )

  # Should the column labels be hidden?
  column_labels_hidden <-
    dt_options_get_value(
      data = data,
      option = "column_labels_hidden"
    )

  if (column_labels_hidden) {
    return(NULL)
  }

  # Get table options
  table_border_top_include <- dt_options_get_value(data, option = "table_border_top_include")
  column_labels_border_top_color <- dt_options_get_value(data = data, option = "column_labels_border_top_color")
  column_labels_border_bottom_color <- dt_options_get_value(data = data, option = "column_labels_border_bottom_color")
  column_labels_vlines_color <- dt_options_get_value(data = data, option = "column_labels_vlines_color")

  # If `stub_available` == TRUE, then replace with a set stubhead
  # label or nothing
  if (isTRUE(stub_available) && length(stubh$label) > 0) {

    headings_labels <- prepend_vec(headings_labels, stubh$label)
    headings_vars <- prepend_vec(headings_vars, "::stub")

  } else if (isTRUE(stub_available)) {

    headings_labels <- prepend_vec(headings_labels, "")
    headings_vars <- prepend_vec(headings_vars, "::stub")
  }

  stubhead_label_alignment <- "left"

  table_col_headings_list <- list()

  ## Create first row of table column headings -
  table_cell_vals <- list()

  # Create the cell for the stubhead label
  if (stub_available) {

      cell_style <- styles_tbl %>%
        dplyr::filter(
          locname %in% c("stubhead")
        ) %>%
        dplyr::pull("styles") %>%
        .[1] %>% .[[1]]

      table_cell_vals[[length(table_cell_vals) + 1]] <-
        table_cell_grob(
          text = headings_labels[1],
          font = cell_style[["cell_text"]][["font"]],
          size = cell_style[["cell_text"]][["size"]] %||% 12,
          color = cell_style[["cell_text"]][["color"]],
          align = cell_style[["cell_text"]][["align"]] %||% stubhead_label_alignment,
          v_align = cell_style[["cell_text"]][["v_align"]],
          fill = cell_style[["cell_fill"]][["color"]],
          col = 1,
          border = list(
            top = if(!spanners_present) list(size = 2, color = column_labels_border_top_color),
            bottom = list(size = 2, color = column_labels_border_bottom_color)
          )
        )

  }

  for (i in seq_len(length(headings_vars) - stub_available)) {

    cell_style <- styles_tbl %>%
      dplyr::filter(
        locname %in% c("columns_columns"),
        rownum == -1,
        colnum == i
      ) %>%
      dplyr::pull("styles") %>%
      .[1] %>%
      .[[1]]

    table_cell_vals[[length(table_cell_vals) + 1]] <-
      table_cell_grob(
        text = headings_labels[i + stub_available],
        font = cell_style[["cell_text"]][["font"]],
        size = cell_style[["cell_text"]][["size"]] %||% 12,
        color = cell_style[["cell_text"]][["color"]] %||% "black",
        align = cell_style[["cell_text"]][["align"]] %||% "center",
        v_align = cell_style[["cell_text"]][["v_align"]] %||% "middle",
        fill = cell_style[["cell_fill"]][["color"]],
        col = i + stub_available,
        border = list(
          top = if(!spanners_present){list(size = 2, color = column_labels_border_top_color)},
          bottom = list(size = 2, color = column_labels_border_bottom_color)
        )
      )
  }

  table_col_headings_list[[1]] <- table_cell_vals


  ## TODO: MAKE WORK WITH SPANNING HEADERS

  if(spanners_present){

    spanners <-
      dt_spanners_print_matrix(
        data = data,
        include_hidden = FALSE
      )

    spanner_ids <-
      dt_spanners_print_matrix(
        data = data,
        include_hidden = FALSE,
        ids = TRUE
      )

    for(span_row_idx in rev(seq_len(spanner_row_count))){

      spanner_row_values <- spanners[span_row_idx,]
      spanner_row_ids <- spanner_ids[span_row_idx,]

      spanner_cell_vals <- list()

      # Create the cell for the stub head label

      if (stub_available) {

        if(span_row_idx == 1){

          cell_style <- styles_tbl %>%
            dplyr::filter(
              locname %in% c("stubhead")
            ) %>%
            dplyr::pull("styles") %>%
            .[1] %>% .[[1]]


          spanner_cell_vals[[length(spanner_cell_vals) + 1]] <-
            table_cell_grob(
              text = "",
              font = cell_style[["cell_text"]][["font"]],
              size = cell_style[["cell_text"]][["size"]] %||% 12,
              color = cell_style[["cell_text"]][["color"]],
              align = cell_style[["cell_text"]][["align"]] %||% stubhead_label_alignment,
              v_align = cell_style[["cell_text"]][["v_align"]],
              fill = cell_style[["cell_fill"]][["color"]],
              row_span = spanner_row_count,
              col = 1,
              border = list(
                top = list(size = 2, color = column_labels_border_top_color)
              )
            )

        }

      }

      # NOTE: rle treats NA values as distinct from each other; in other words,
      # each NA value starts a new run of length 1.
      spanners_rle <- rle(spanner_row_ids)
      # sig_cells contains the indices of spanners' elements where the value is
      # either NA, or, is different than the previous value. (Because NAs are
      # distinct, every NA element will be present sig_cells.)
      sig_cells <- c(1, utils::head(cumsum(spanners_rle$lengths) + 1, -1))
      # colspans matches spanners in length; each element is the number of
      # columns that the <th> at that position should span. If 0, then skip the
      # <th> at that position.
      colspans <- ifelse(
        seq_along(spanner_row_values) %in% sig_cells,
        spanners_rle$lengths[match(seq_along(spanner_row_ids), sig_cells)],
        0
      )

      for (i in seq_along(spanner_row_values)) {

        if (!is.na(spanner_row_ids[i])) {

          # Case with no spanner labels are in top row
          # (merge cells horizontally and align text to bottom)
          if (colspans[i] > 0) {

            cell_style <- styles_tbl %>%
              dplyr::filter(
                locname %in% c("columns_groups"),
                grpname %in% spanner_row_ids[i]
              ) %>%
              dplyr::pull("styles") %>%
              .[1] %>% .[[1]]

            ## check if there are any open cells above to determine
            spanner_cell_vals[[length(spanner_cell_vals) + 1]] <-
              table_cell_grob(
                text = spanner_row_values[i],
                font = cell_style[["cell_text"]][["font"]],
                size = cell_style[["cell_text"]][["size"]] %||% 12,
                color = cell_style[["cell_text"]][["color"]],
                align = cell_style[["cell_text"]][["align"]],
                v_align = cell_style[["cell_text"]][["v_align"]],
                fill = cell_style[["cell_fill"]][["color"]],
                col_span = colspans[i],
                col = i + stub_available,
                border = list(
                  bottom = list(size = 3, color = column_labels_border_bottom_color),
                  top = if(span_row_idx == 1){list(size = 2, color = column_labels_border_top_color)}
                )
              )

          }
        } else{

          spanner_cell_vals[[length(spanner_cell_vals) + 1]] <-
            table_cell_grob(
              text = "",
              col = i + stub_available,
              border = list(
                top = if(span_row_idx == 1){list(size = 2, color = column_labels_border_top_color)}
              ),
            )

        }

      }

      table_col_headings_list[[length(table_col_headings_list) + 1 ]] <- spanner_cell_vals
    }

  }

  rev(table_col_headings_list)

}

create_body_component_grob <- function(data) {

  boxh <- dt_boxhead_get(data = data)
  body <- dt_body_get(data = data)

  summaries_present <- dt_summary_exists(data = data)
  list_of_summaries <- dt_summary_df_get(data = data)
  groups_rows_df <- dt_groups_rows_get(data = data)
  stub_components <- dt_stub_components(data = data)

  # Get table styles
  styles_tbl <- dt_styles_get(data = data)

  # Get table options
  row_group_border_top_color <- dt_options_get_value(data = data, option = "row_group_border_top_color")
  row_group_border_bottom_color <- dt_options_get_value(data = data, option = "row_group_border_bottom_color")
  row_group_border_left_color <- dt_options_get_value(data = data, option = "row_group_border_left_color")
  row_group_border_right_color <- dt_options_get_value(data = data, option = "row_group_border_right_color")
  table_body_hlines_color <- dt_options_get_value(data = data, option = "table_body_hlines_color")
  table_body_vlines_color <- dt_options_get_value(data = data, option = "table_body_vlines_color")
  table_border_bottom_color <- dt_options_get_value(data, option = "table_border_bottom_color")
  table_border_top_color <- dt_options_get_value(data, option = "table_border_top_color")

  n_data_cols <- length(dt_boxhead_get_vars_default(data = data))
  n_rows <- nrow(body)

  # Get the column alignments for the data columns (this
  # doesn't include the stub alignment)
  col_alignment <- boxh[boxh$type == "default", ][["column_align"]]

  # Determine whether the stub is available through analysis
  # of the `stub_components`
  stub_available <- dt_stub_components_has_rowname(stub_components)

  # Obtain all of the visible (`"default"`), non-stub
  # column names for the table
  default_vars <- dt_boxhead_get_vars_default(data = data)

  all_default_vals <- unname(as.matrix(body[, default_vars]))

  alignment_classes <- paste0("gt_", col_alignment)

  if (stub_available) {

    n_cols <- n_data_cols + 1

    alignment_classes <- c("gt_left", alignment_classes)

    stub_var <- dt_boxhead_get_var_stub(data = data)
    all_stub_vals <- as.matrix(body[, stub_var])

  } else {
    n_cols <- n_data_cols
  }

  # Define function to get a character vector of formatted cell
  # data (this includes the stub, if it is present)
  output_df_row_as_vec <- function(i) {

    default_vals <- all_default_vals[i, ]

    if (stub_available) {
      default_vals <- c(all_stub_vals[i], default_vals)
    }

    default_vals
  }

  # Get the sequence of column numbers in the table body (these
  # are the visible columns in the table exclusive of the stub)
  column_series <- seq(n_cols)

  # Replace an NA group with an empty string
  if (any(is.na(groups_rows_df$group_label))) {

    groups_rows_df <-
      groups_rows_df %>%
      dplyr::mutate(group_label = ifelse(is.na(group_label), "", group_label)) %>%
      dplyr::mutate(group_label = gsub("^NA", "\u2014", group_label))
  }

  body_rows <-
    lapply(
      seq_len(n_rows),
      function(i) {

        if(summaries_present & !stub_available){
          n_cols <- n_cols + 1
        }

        body_section <- list()
        #
        # Create a group heading row
        #
        if (!is.null(groups_rows_df) && i %in% groups_rows_df$row_start) {

          group_label <-
            groups_rows_df[
              which(groups_rows_df$row_start %in% i), "group_label"
            ][[1]]

          cell_style <- styles_tbl %>%
            dplyr::filter(
              locname == "row_groups",
              rownum == (i-.1)
            ) %>%
            dplyr::pull("styles") %>%
            .[1] %>% .[[1]]

          group_heading_row <-list(
            table_cell_grob(
                text = htmltools::HTML(group_label),
                font = cell_style[["cell_text"]][["font"]],
                size = cell_style[["cell_text"]][["size"]],
                color = cell_style[["cell_text"]][["color"]],
                align = cell_style[["cell_text"]][["align"]] %||% "left",
                v_align = cell_style[["cell_text"]][["v_align"]],
                fill = cell_style[["cell_fill"]][["color"]],
                col_span = n_cols,
                col = 1,
                border = list(
                  top = list(size = 2, color = row_group_border_top_color),
                  bottom = list(size = 2, color = row_group_border_bottom_color),
                  left = list(size = 1, color = row_group_border_left_color),
                  right = list(size = 1, color = row_group_border_right_color)
                )
              )
            )

          body_section <- c(body_section, list(group_heading_row))
        }

        #
        # Create a body row
        #

        row_cells <- list()

        ## add an empty column if there
        if(summaries_present & !stub_available){
          row_cells[[length(row_cells) + 1]] <-
            table_cell_grob(
              text = "",
              col = 1,
              border = list(
                top = list(size = 1, color = table_body_hlines_color),
                bottom = list(size = ifelse(i %in% groups_rows_df$row_end, 2, 1), color = table_body_hlines_color),
                left = list(size = 1, color = table_body_vlines_color),
                right = list(size =  1, color = table_body_vlines_color)
              )
            )
        }

        for (y in seq_along(output_df_row_as_vec(i))) {

          style_col_idx <- ifelse(stub_available, y - 1, y )

          col <- ifelse(summaries_present & !stub_available, y + 1, y)

          cell_style <- styles_tbl %>%
            dplyr::filter(
              locname %in% c("data","stub"),
              rownum == i,
              colnum == style_col_idx
            ) %>%
            dplyr::pull("styles") %>%
            .[1] %>% .[[1]]

          row_cells[[length(row_cells) + 1]] <-
            table_cell_grob(
              text = output_df_row_as_vec(i)[y],
              font = cell_style[["cell_text"]][["font"]],
              size = cell_style[["cell_text"]][["size"]],
              color = cell_style[["cell_text"]][["color"]],
              align = cell_style[["cell_text"]][["align"]],
              v_align = cell_style[["cell_text"]][["v_align"]],
              col = col,
              border = list(
                top = list(size = 1, color = table_body_hlines_color),
                bottom = list(size = ifelse(i %in% groups_rows_df$row_end, 2, 1), color = table_body_hlines_color),
                left = list(size = 1, color = table_body_vlines_color),
                right = list(size =  1, color = table_body_vlines_color)
              ),
              fill = cell_style[["cell_fill"]][["color"]]
            )
        }

        body_section <- c(body_section, list(row_cells))

        #
        # Add groupwise summary rows
        #

        if (summaries_present &&
            i %in% groups_rows_df$row_end) {

          group_id <-
            groups_rows_df[
              stats::na.omit(groups_rows_df$row_end == i),
              "group_id", drop = TRUE
            ]

          summary_styles <- styles_tbl %>%
            dplyr::filter(
              locname %in% c("summary_cells"),
              grpname %in% group_id
            ) %>%
            dplyr::mutate(
              rownum = ceiling(rownum*100 - i*100)
            )

          summary_section <-
            summary_rows_grob(
              list_of_summaries = list_of_summaries,
              boxh = boxh,
              group_id = group_id,
              locname = "summary_cells",
              col_alignment = col_alignment,
              table_body_hlines_color = table_body_hlines_color,
              table_body_vlines_color = table_body_vlines_color,
              styles = summary_styles
            )

          body_section <- c(body_section, summary_section)
        }

        body_section
      }
    )

  body_rows <- do.call('c', body_rows)

  #
  # Add grand summary rows
  #

  if (summaries_present &&
      grand_summary_col %in% names(list_of_summaries$summary_df_display_list)) {

    summary_styles <- styles_tbl %>%
      dplyr::filter(
        locname %in% "grand_summary_cells",
        grpname %in% c("::GRAND_SUMMARY")
      )

    grand_summary_section <-
      summary_rows_grob(
        list_of_summaries = list_of_summaries,
        boxh = boxh,
        group_id = grand_summary_col,
        locname = "grand_summary_cells",
        col_alignment = col_alignment,
        table_body_hlines_color = table_body_hlines_color,
        table_body_vlines_color = table_body_vlines_color,
        styles = summary_styles
      )

    body_rows <- c(body_rows, grand_summary_section)
  }

  body_rows
}

summary_rows_grob <- function(list_of_summaries,
                             boxh,
                             group_id,
                             locname,
                             col_alignment,
                             table_body_hlines_color,
                             table_body_vlines_color,
                             styles) {

  # Obtain all of the visible (`"default"`), non-stub column names
  # for the table from the `boxh` object
  default_vars <- boxh[boxh$type == "default", "var", drop = TRUE]

  summary_row_lines <- list()

  if (group_id %in% names(list_of_summaries$summary_df_display_list)) {

    # Obtain the summary data table specific to the group ID and
    # select the column named `rowname` and all of the visible columns
    summary_df <-
      list_of_summaries$summary_df_display_list[[group_id]] %>%
      dplyr::select(.env$rowname_col_private, .env$default_vars)

    n_cols <- ncol(summary_df)

    summary_df_row <- function(j) {
      unname(unlist(summary_df[j, ]))
    }

    for (j in seq_len(nrow(summary_df))) {

      summary_row_cells <- list()

      for (y in seq_along(summary_df_row(j))) {

        cell_style <- styles %>%
          dplyr::filter(
            rownum == j,
            colnum == y -1
          ) %>%
          dplyr::pull("styles") %>%
          .[1] %>% .[[1]]

        summary_row_cells[[length(summary_row_cells) + 1]] <-
          table_cell_grob(
            text = summary_df_row(j)[y],
            font = cell_style[["cell_text"]][["font"]],
            size = cell_style[["cell_text"]][["size"]],
            color = cell_style[["cell_text"]][["color"]],
            align = cell_style[["cell_text"]][["align"]],
            v_align = cell_style[["cell_text"]][["v_align"]],
            fill = cell_style[["cell_fill"]][["color"]],
            col = y,
            border = list(
              "top" = list(size = ifelse(j == 1, 2, 1), color = table_body_hlines_color),
              "bottom" = list(size = ifelse(j == nrow(summary_df), 2, 1), color = table_body_hlines_color),
              "left" = list(size= 1, color = table_body_vlines_color),
              "right" = list(size= 1, color = table_body_vlines_color)
            )
          )
      }

      summary_row <- summary_row_cells

      summary_row_lines <- append(summary_row_lines, list(summary_row))
    }
  }

  summary_row_lines
}

create_footer_component_grob <- function(data){

  footnotes_tbl <- dt_footnotes_get(data = data)

  footnotes_border_bottom_color <- dt_options_get_value(data, option = "footnotes_border_bottom_color")


  # If the `footnotes_resolved` object has no
  # rows, then return an empty footnotes component
  if (nrow(footnotes_tbl) == 0) {
    return(NULL)
  }

  add_bottom_line  <- is.null(dt_source_notes_get(data = data))

  stub_components <- dt_stub_components(data = data)

  cell_style <- dt_styles_get(data = data) %>%
    dplyr::filter(
      locname == "footnotes"
    ) %>%
    dplyr::pull("styles") %>%
    .[1] %>% .[[1]]

  n_data_cols <- length(dt_boxhead_get_vars_default(data = data))

  # Determine whether the stub is available
  stub_available <- dt_stub_components_has_rowname(stub_components = stub_components)

  if (stub_available) {
    n_cols <- n_data_cols + 1
  } else {
    n_cols <- n_data_cols
  }

  footnotes_tbl <-
    footnotes_tbl %>%
    dplyr::select(fs_id, footnotes) %>%
    dplyr::distinct()

  # Get the footnote separator option
  separator <- dt_options_get_value(data = data, option = "footnotes_sep")

  footnote_ids <- footnotes_tbl[["fs_id"]]
  footnote_text <- footnotes_tbl[["footnotes"]]

  seq_along(footnote_text) %>%
    map(function(x) {
           table_cell_grob(
             text = paste(if (!is.na(footnote_ids[x])) {
               paste0(footnote_ids[x], ".")
               },
               footnote_text[x]
             ),
             font = cell_style[["cell_text"]][["font"]],
             size = cell_style[["cell_text"]][["size"]] %||% 11,
             color = cell_style[["cell_text"]][["color"]],
             align = cell_style[["cell_text"]][["align"]] %||% "left",
             v_align = cell_style[["cell_text"]][["v_align"]],
             col = 1,
             col_span = n_cols,
             fill = cell_style[["cell_fill"]][["color"]],
             border = list(
               bottom = if(add_bottom_line & x == length(footnote_text)) list(size = 2, color = footnotes_border_bottom_color)
             ),
             margins =
           ) %>% list()
      })

}

create_source_notes_component_grob <- function(data) {

  source_note <- dt_source_notes_get(data = data)

  sourcenotes_border_bottom_color <- dt_options_get_value(data, option = "source_notes_border_bottom_color")


  if (is.null(source_note)) {
    return(NULL)
  }

  stub_components <- dt_stub_components(data = data)

  cell_style <- dt_styles_get(data = data) %>%
    dplyr::filter(
      locname == "source_notes"
    ) %>%
    dplyr::pull("styles") %>%
    .[1] %>% .[[1]]

  n_data_cols <- length(dt_boxhead_get_vars_default(data = data))

  # Determine whether the stub is available
  stub_available <- dt_stub_components_has_rowname(stub_components = stub_components)

  if (stub_available) {
    n_cols <- n_data_cols + 1
  } else {
    n_cols <- n_data_cols
  }

  seq_along(source_note) %>%
    map(function(x) {
      table_cell_grob(
        text = source_note[[x]],
        font = cell_style[["cell_text"]][["font"]],
        size = cell_style[["cell_text"]][["size"]] %||% 12,
        color = cell_style[["cell_text"]][["color"]],
        align = cell_style[["cell_text"]][["align"]] %||% "left",
        v_align = cell_style[["cell_text"]][["v_align"]],
        col = 1,
        col_span = n_cols,
        fill = cell_style[["cell_fill"]][["color"]],
        border = list(
          bottom = if(x == length(source_note))list(size = 3, color = sourcenotes_border_bottom_color)
        )
      ) %>% list()
    }
  )

}

#' @importFrom grid grobTree rectGrob gpar unit addGrob textGrob
table_cell_grob <- function(text,
                      size = NULL,
                      font = NULL,
                      color = NULL,
                      fontface = NULL,
                      align = NULL,
                      v_align = NULL,
                      fill = NULL,
                      col = NULL,
                      col_span = 1,
                      row_span = 1,
                      border = NULL,
                      margins = NULL
                      ){

  align <- align %||% "center"
  v_align <- v_align %||% "middle"

  margins <- margins %||% list(top = .02, bottom = .02, left = .02, right = .02)


  cell_grob <- grid::grobTree()

  cell_bg_grob <- grid::rectGrob(
    gp = grid::gpar(
      col = fill,
      lty = "blank"
    ),
    height = grid::unit(1,"npc"),
    width = grid::unit(1,"npc")
    )

  cell_grob <- grid::addGrob(
    cell_grob,
    cell_bg_grob
  )

  if(is.na(text)){
    text <- "NA"
  }

  cell_text <- grid::textGrob(
    text,
    x = grid::unit(convert_to_hjust(align, margins),"npc"),
    y = grid::unit(convert_to_vjust(v_align, margins),"npc"),
    gp = grid::gpar(
      col = color %||% "black",
      fontsize = size %||% 12,
      fontfamily = font,
      fontface = fontface
    ),
    hjust = convert_to_hjust(align),
    vjust = convert_to_vjust(v_align)
  )

  cell_grob <- grid::addGrob(
    cell_grob,
    cell_text
  )

  if(!is_empty(border)){

    ## Remove NULL border values
    border <- border[!sapply(border, is.null)]

    ## set order of border drawing
    borders_to_draw <- sort(factor(names(border), c("left","right", "top","bottom")))

    for(border_line in borders_to_draw){

      border_grob <- create_border_grob(
        border_line_def = border[[border_line]],
        location = border_line)

      cell_grob <- grid::addGrob(
        cell_grob,
        border_grob
      )
    }
  }

  text_split <- strsplit(text, "\\n")

  structure(
    cell_grob,
    .col = col,
    .text_cols = max(sapply(text_split, function(x) if(length(x) == 0){0}else{nchar(x)})),
    .text_rows = length(text_split),
    .text_size = size %||% 12,
    .cell_col_span = col_span,
    .cell_row_span = row_span,
    class = c("gCell","gTree", "grob",  "gDesc")
  )

}


#' @importFrom grid linesGrob unit gpar
create_border_grob <- function(border_line_def, location, x_scale = 1, y_scale = 1){

  location <- match.arg(location, choices = c("top","bottom","left","right"))

  x <- list("top" = c(0,1), "bottom" = c(0,1) ,"left" = c(0,0), "right" = c(1,1))[[location]] * x_scale
  y <- list("top" = c(1,1), "bottom" = c(0,0) ,"left" = c(0,1), "right" = c(0,1))[[location]] * y_scale

  grid::linesGrob(
    x = grid::unit(x,units = "npc"),
    y = grid::unit(y,units = "npc"),
    gp = grid::gpar(
      col = border_line_def[["color"]] %||% "black",
      lty = grob_line_type(border_line_def[["type"]]),
      lwd = border_line_def[["size"]] %||% 1
    )
  )
}

grob_line_type <- function(x){
  if(is.null(x)){
    return("solid")
  }
  match.arg(x, choices = c("solid","dashed","dotted","dotdash","longdash","twodash"))
}

convert_to_vjust <- function(x = c("top", "middle", "bottom"), margins = list(top = 0, bottom = 0)){
    x <- match.arg(x)

    x_loc <- c(
      "bottom" = 0,
      "middle" = .5,
      "top" = 1
    )[x]

    if(x %in% names(margins)){
      if(x == "top"){
        x_loc <- x_loc - margins[[x]]
      }else{
        x_loc <- x_loc + margins[[x]]
      }
    }

    x_loc

}

convert_to_hjust <- function(x = c("left", "center", "right"), margins = list(left = 0, right = 0)) {

  x <- match.arg(x)
  x_loc <- c(
    "left" = 0,
    "center" = .5,
    "right" = 1
  )[x]

  if(x %in% names(margins)){
    if(x == "right"){
      x_loc <- x_loc - margins[[x]]
    }else{
      x_loc <- x_loc + margins[[x]]
    }
  }
  x_loc

}

footnote_mark_to_grob <- function(mark) {

  if (is.na(mark)) return("")

  paste0("^", mark)

}
