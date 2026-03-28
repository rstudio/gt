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


# -- Color & length conversion helpers ----------------------------------------

css_color_to_typst <- function(color) {

  if (is.null(color) || is.na(color) || nchar(color) == 0L) {
    return(NULL)
  }

  # If already a hex color, wrap in rgb()

  if (grepl("^#[0-9A-Fa-f]{3,8}$", color)) {

    # Expand 3-digit hex to 6-digit
    if (nchar(color) == 4L) {
      chars <- strsplit(sub("^#", "", color), "")[[1]]
      color <- paste0("#", chars[1], chars[1], chars[2], chars[2], chars[3], chars[3])
    }

    return(paste0("rgb(\"", color, "\")"))
  }

  # Handle rgba(r, g, b, a) or rgb(r, g, b)
  if (grepl("^rgba?\\(", color)) {
    nums <- as.numeric(regmatches(color, gregexpr("[0-9.]+", color))[[1]])
    if (length(nums) >= 3L) {
      hex <- sprintf("#%02X%02X%02X", as.integer(nums[1]), as.integer(nums[2]), as.integer(nums[3]))
      if (length(nums) >= 4L) {
        alpha_hex <- sprintf("%02X", as.integer(nums[4] * 255))
        hex <- paste0(hex, alpha_hex)
      }
      return(paste0("rgb(\"", hex, "\")"))
    }
  }

  # For named colors, convert to hex via grDevices to avoid Typst/CSS name mismatches
  tryCatch({
    rgb_vals <- grDevices::col2rgb(color)
    hex <- sprintf("#%02X%02X%02X", rgb_vals[1], rgb_vals[2], rgb_vals[3])
    paste0("rgb(\"", hex, "\")")
  }, error = function(e) {
    # Fallback: pass through (Typst may handle it)
    color
  })
}

css_length_to_typst <- function(length) {

  if (is.null(length) || is.na(length) || nchar(length) == 0L) {
    return(NULL)
  }

  # px -> pt conversion (1px = 0.75pt)
  if (grepl("px$", length)) {
    val <- as.numeric(sub("px$", "", length))
    return(paste0(format(val * 0.75, nsmall = 1), "pt"))
  }

  # Passthrough for pt, cm, mm, in, em, %
  if (grepl("(pt|cm|mm|in|em|%)$", length)) {
    return(length)
  }

  # Numeric value: assume pt
  if (grepl("^[0-9.]+$", length)) {
    return(paste0(length, "pt"))
  }

  length
}

#' Convert CSS length to Typst length for text sizes
#'
#' Like css_length_to_typst() but converts % to em since Typst text()
#' doesn't accept percentage sizes.
#' @noRd
css_length_to_typst_text_size <- function(length) {
  if (is.null(length) || is.na(length) || nchar(length) == 0L) return(NULL)

  # Convert % to em for text size
  if (grepl("%$", length)) {
    pct_val <- as.numeric(sub("%$", "", length))
    return(paste0(format(pct_val / 100, nsmall = 2), "em"))
  }

  css_length_to_typst(length)
}

# -- Markdown to Typst conversion ---------------------------------------------

markdown_to_typst <- function(text) {

  if (length(text) == 0L) return(text)
  if (all(is.na(text))) return(text)

  na_idx <- is.na(text)

  result <- text[!na_idx]

  for (i in seq_along(result)) {

    x <- result[i]

    # Preserve inline code spans by replacing with placeholders
    code_spans <- character(0)
    code_pattern <- "`([^`]+)`"
    while (grepl(code_pattern, x)) {
      code_match <- regmatches(x, regexpr(code_pattern, x))
      code_spans <- c(code_spans, code_match)
      x <- sub(code_pattern, paste0("<<CODE_", length(code_spans), ">>"), x, perl = TRUE)
    }

    # Convert links first (before any other processing that might affect [] or ())
    x <- gsub("\\[([^\\]]+)\\]\\(([^)]+)\\)", "#link(\"\\2\")[\\1]", x, perl = TRUE)

    # Convert strikethrough
    x <- gsub("~~(.+?)~~", "#strike[\\1]", x, perl = TRUE)

    # Markdown→Typst mapping:
    #   MD bold **x** or __x__  →  Typst bold *x*
    #   MD italic *x* or _x_   →  Typst italic _x_
    #   MD bold-italic ***x***  →  Typst *_x_*
    #
    # Strategy: convert bold-italic first, then bold, then italic.
    # Since MD italic *x* maps to Typst _x_, and MD bold **x** maps to
    # Typst *x*, we must handle * carefully to avoid re-matching.
    # Use placeholders to prevent re-matching.

    # Bold-italic (*** or ___) → placeholder
    x <- gsub("\\*\\*\\*(.+?)\\*\\*\\*", "\x01_\\1_\x01", x, perl = TRUE)
    x <- gsub("___(.+?)___", "\x01_\\1_\x01", x, perl = TRUE)

    # Bold (** or __) → placeholder
    x <- gsub("\\*\\*(.+?)\\*\\*", "\x01\\1\x01", x, perl = TRUE)
    x <- gsub("__(.+?)__", "\x01\\1\x01", x, perl = TRUE)

    # Italic (* or _) → Typst _x_
    # Single * not adjacent to another *
    x <- gsub("(?<![*\\x01])\\*(?![*])(.+?)(?<![*])\\*(?![*\\x01])", "_\\1_", x, perl = TRUE)
    # Single _ (already Typst italic syntax, but ensure not __)
    # _x_ in markdown is already _x_ in Typst, so no conversion needed

    # Replace bold placeholders with Typst bold *
    x <- gsub("\x01", "*", x, fixed = TRUE)

    # Restore code spans
    for (j in seq_along(code_spans)) {
      x <- sub(paste0("<<CODE_", j, ">>"), code_spans[j], x, fixed = TRUE)
    }

    result[i] <- x
  }

  text[!na_idx] <- result
  text
}

# -- CSS to Typst weight mapping -----------------------------------------------

#' Map CSS font-weight values to Typst weight values
#' @noRd
css_weight_to_typst <- function(weight) {

  if (is.null(weight) || is.na(weight) || !nzchar(weight)) return(NULL)

  # Typst accepts: "thin", "extralight", "light", "regular", "medium",
  # "semibold", "bold", "extrabold", "black", or integer 100-900
  weight_map <- c(
    "normal" = "regular",
    "initial" = "regular",
    "inherit" = "regular",
    "lighter" = "light",
    "bolder" = "bold"
  )

  if (weight %in% names(weight_map)) {
    return(weight_map[[weight]])
  }

  # Already a valid Typst weight or numeric
  weight
}

# -- Option border helper ------------------------------------------------------

#' Convert a gt border option triple (style, width, color) to a Typst stroke
#' @param data A built gt_tbl object
#' @param option_prefix The option prefix, e.g. "table_border_top"
#' @return A Typst stroke string like "1.5pt + rgb(\"#000000\")" or NULL
#' @noRd
option_border_to_typst <- function(data, option_prefix) {

  style <- dt_options_get_value(data = data, option = paste0(option_prefix, "_style"))
  width <- dt_options_get_value(data = data, option = paste0(option_prefix, "_width"))
  color <- dt_options_get_value(data = data, option = paste0(option_prefix, "_color"))

  if (is.null(style) || style == "none" || style == "hidden") return(NULL)

  typst_width <- css_length_to_typst(width) %||% "1pt"
  typst_color <- css_color_to_typst(color) %||% "black"

  # Typst doesn't support "double" — approximate as solid at ~1/3 the width
  if (style == "double") {
    tryCatch({
      val <- as.numeric(sub("pt$", "", typst_width))
      typst_width <- paste0(max(val / 3, 0.75), "pt")
    }, error = function(e) NULL, warning = function(w) NULL)
  }

  paste0(typst_width, " + ", typst_color)
}

# -- Typst text color helper ---------------------------------------------------

make_typst_text_with_color <- function(text, color = NULL) {

  if (is.null(color) || is.null(text) || is.na(color)) {
    return(text)
  }

  typst_color <- css_color_to_typst(color)
  paste0("#text(fill: ", typst_color, ")[", text, "]")
}

# -- Footnote helpers ----------------------------------------------------------

footnote_mark_to_typst <- function(data, mark, location = c("ref", "ftr")) {

  location <- match.arg(location)

  if (length(mark) == 1L && is.na(mark)) return("")
  if (length(mark) == 0L) return("")

  mark <- as.character(mark)

  paste0("#super[", mark, "]")
}


# -- Style application helpers ------------------------------------------------

#' Convert a consolidated style list to Typst cell and text properties
#'
#' Returns a list with two elements:
#'   $cell_props - named character vector of table.cell() properties (fill, stroke, align)
#'   $text_wraps - character vector of text wrappers to nest around content
#' @noRd
styles_to_typst <- function(styles) {

  if (is.null(styles) || length(styles) == 0L) {
    return(list(cell_props = character(0), text_wraps = character(0)))
  }

  cell_props <- character(0)
  text_props <- character(0)
  outer_wraps <- character(0) # wraps applied outside #text()

  for (style_obj in styles) {

    if (is.null(names(style_obj))) next

    cls <- class(style_obj)

    if ("cell_text" %in% cls) {

      s <- unclass(style_obj)

      if (!is.null(s$color) && !is.na(s$color)) {
        typst_color <- css_color_to_typst(s$color)
        if (!is.null(typst_color)) {
          text_props <- c(text_props, paste0("fill: ", typst_color))
        }
      }

      if (!is.null(s$weight) && !is.na(s$weight)) {
        weight_val <- if (is.numeric(s$weight)) {
          as.character(as.integer(s$weight))
        } else {
          paste0("\"", css_weight_to_typst(s$weight), "\"")
        }
        text_props <- c(text_props, paste0("weight: ", weight_val))
      }

      if (!is.null(s$style) && !is.na(s$style)) {
        text_props <- c(text_props, paste0("style: \"", s$style, "\""))
      }

      if (!is.null(s$size) && !is.na(s$size)) {
        typst_size <- css_length_to_typst_text_size(s$size)
        if (!is.null(typst_size)) {
          text_props <- c(text_props, paste0("size: ", typst_size))
        }
      }

      if (!is.null(s$font) && !is.na(s$font)) {
        text_props <- c(text_props, paste0("font: \"", s$font, "\""))
      }

      if (!is.null(s$decorate) && !is.na(s$decorate)) {
        if (s$decorate == "underline") {
          outer_wraps <- c(outer_wraps, "underline")
        } else if (s$decorate %in% c("line-through", "strikeout")) {
          outer_wraps <- c(outer_wraps, "strike")
        } else if (s$decorate == "overline") {
          outer_wraps <- c(outer_wraps, "overline")
        }
      }

      if (!is.null(s$transform) && !is.na(s$transform)) {
        if (s$transform == "uppercase") {
          outer_wraps <- c(outer_wraps, "upper")
        } else if (s$transform == "lowercase") {
          outer_wraps <- c(outer_wraps, "lower")
        } else if (s$transform == "capitalize") {
          outer_wraps <- c(outer_wraps, "smallcaps")
        }
      }

      if (!is.null(s$align) && !is.na(s$align)) {
        cell_props <- c(cell_props, paste0("align: ", s$align))
      }

    } else if ("cell_fill" %in% cls) {

      s <- unclass(style_obj)

      if (!is.null(s$color) && !is.na(s$color)) {
        typst_color <- css_color_to_typst(s$color)
        if (!is.null(typst_color)) {
          cell_props <- c(cell_props, paste0("fill: ", typst_color))
        }
      }

    } else if ("cell_border" %in% cls) {

      s <- unclass(style_obj)
      # cell_border objects have: style, width, color, sides
      side <- sub("^cell_border_", "", cls[grepl("^cell_border_", cls)])
      if (length(side) == 0L) side <- "bottom"

      width <- if (!is.null(s$width)) css_length_to_typst(s$width) else "1pt"
      color <- if (!is.null(s$color)) css_color_to_typst(s$color) else "black"

      stroke_val <- paste0(width, " + ", color)
      cell_props <- c(cell_props, paste0("stroke: (", side, ": ", stroke_val, ")"))
    }
  }

  list(
    cell_props = cell_props,
    text_props = text_props,
    outer_wraps = outer_wraps
  )
}

#' Apply Typst styles to cell content
#'
#' @param content The cell content string (already escaped)
#' @param styles_list Output of styles_to_typst()
#' @param colspan Integer colspan (default 1)
#' @return A string like `table.cell(fill: ...)[#text(weight: "bold")[content]]`
#' @noRd
apply_cell_styles_t <- function(content, styles_list = NULL, colspan = 1L) {

  if (is.null(styles_list)) {
    styles_list <- list(cell_props = character(0), text_props = character(0), outer_wraps = character(0))
  }

  inner <- content

  # Apply outer wraps (innermost first)
  for (wrap in rev(styles_list$outer_wraps)) {
    inner <- paste0("#", wrap, "[", inner, "]")
  }

  # Apply text properties
  if (length(styles_list$text_props) > 0L) {
    inner <- paste0("#text(", paste(styles_list$text_props, collapse = ", "), ")[", inner, "]")
  }

  # Build cell properties
  cell_props <- styles_list$cell_props
  if (colspan > 1L) {
    cell_props <- c(paste0("colspan: ", colspan), cell_props)
  }

  # If any cell-level properties, wrap in table.cell()
  if (length(cell_props) > 0L) {
    paste0("table.cell(", paste(cell_props, collapse = ", "), ")[", inner, "]")
  } else {
    paste0("[", inner, "]")
  }
}

# -- Component constructors ---------------------------------------------------

#' Get the total number of visible columns (including stub)
#' @noRd
get_n_cols_total <- function(data) {

  n_data_cols <- length(dt_boxhead_get_vars_default(data = data))
  n_stub_cols <- get_stub_column_count(data = data)

  n_data_cols + n_stub_cols
}

#' Create the heading component as table.cell rows inside the table
#'
#' Returns table.cell(colspan: N) entries for title/subtitle, placed inside
#' the #table() before the header. This way the heading inherits the table's
#' width and the background/borders work as part of the table structure.
#' @noRd
create_heading_component_t <- function(data) {

  heading <- dt_heading_get(data = data)
  has_title <- dt_heading_has_title(data = data)

  if (!has_title) return("")

  title <- heading$title
  subtitle <- heading$subtitle
  n_cols <- get_n_cols_total(data = data)

  # Heading options
  heading_align <- dt_options_get_value(data = data, option = "heading_align")
  title_font_size <- dt_options_get_value(data = data, option = "heading_title_font_size")
  title_font_weight <- dt_options_get_value(data = data, option = "heading_title_font_weight")
  subtitle_font_size <- dt_options_get_value(data = data, option = "heading_subtitle_font_size")
  subtitle_font_weight <- dt_options_get_value(data = data, option = "heading_subtitle_font_weight")
  heading_bg <- dt_options_get_value(data = data, option = "heading_background_color")
  heading_padding <- dt_options_get_value(data = data, option = "heading_padding")
  heading_padding_h <- dt_options_get_value(data = data, option = "heading_padding_horizontal")
  font_color_light <- dt_options_get_value(data = data, option = "table_font_color_light")

  typst_align <- heading_align %||% "center"
  typst_padding <- css_length_to_typst(heading_padding) %||% "4pt"
  typst_padding_h <- css_length_to_typst(heading_padding_h) %||% "5pt"

  typst_title_size <- css_length_to_typst_text_size(title_font_size) %||% "1.25em"
  typst_subtitle_size <- css_length_to_typst_text_size(subtitle_font_size) %||% "0.85em"

  # Title text properties
  title_text_props <- paste0("size: ", typst_title_size)
  if (!is.null(title_font_weight) && title_font_weight != "initial") {
    title_text_props <- paste0(title_text_props, ", weight: \"", css_weight_to_typst(title_font_weight), "\"")
  } else {
    title_text_props <- paste0(title_text_props, ", weight: \"bold\"")
  }

  # Use light text color when heading has a dark background
  heading_text_fill <- ""
  if (!is.null(heading_bg) && !is.na(heading_bg) && nzchar(heading_bg)) {
    tryCatch({
      rgb_vals <- grDevices::col2rgb(heading_bg)
      luminance <- (0.299 * rgb_vals[1] + 0.587 * rgb_vals[2] + 0.114 * rgb_vals[3]) / 255
      if (luminance < 0.5) {
        light_color <- font_color_light %||% "#FFFFFF"
        typst_light <- css_color_to_typst(light_color)
        heading_text_fill <- paste0(", fill: ", typst_light)
        title_text_props <- paste0(title_text_props, heading_text_fill)
      }
    }, error = function(e) NULL)
  }

  # Build cell properties
  cell_props <- paste0("colspan: ", n_cols, ", align: ", typst_align)
  if (!is.null(heading_bg) && !is.na(heading_bg) && nzchar(heading_bg)) {
    typst_bg <- css_color_to_typst(heading_bg)
    if (!is.null(typst_bg)) {
      cell_props <- paste0(cell_props, ", fill: ", typst_bg)
    }
  }
  cell_props <- paste0(cell_props, ", inset: (x: ", typst_padding_h, ", y: ", typst_padding, ")")

  # Build title content (with optional subtitle on next line using \)
  title_content <- paste0("#text(", title_text_props, ")[", title, "]")

  if (!is.null(subtitle) && !is.na(subtitle) && nzchar(subtitle)) {
    subtitle_text_props <- paste0("size: ", typst_subtitle_size)
    if (!is.null(subtitle_font_weight) && subtitle_font_weight != "initial") {
      subtitle_text_props <- paste0(subtitle_text_props, ", weight: \"", css_weight_to_typst(subtitle_font_weight), "\"")
    }
    subtitle_text_props <- paste0(subtitle_text_props, heading_text_fill)
    title_content <- paste0(title_content, " \\ #text(", subtitle_text_props, ")[", subtitle, "]")
  }

  out <- paste0("  table.cell(", cell_props, ")[", title_content, "],\n")

  # Heading border bottom
  heading_border <- option_border_to_typst(data, "heading_border_bottom")
  if (!is.null(heading_border)) {
    out <- paste0(out, "  table.hline(stroke: ", heading_border, "),\n")
  }

  out
}

#' Create the table start: #table(columns:, align:, stroke:, inset:,
#' @noRd
create_table_start_t <- function(data) {

  n_cols <- get_n_cols_total(data = data)
  stub_layout <- get_stub_layout(data = data)
  default_vars <- dt_boxhead_get_vars_default(data = data)
  boxhead <- dt_boxhead_get(data = data)

  # Build alignment vector
  alignments <- character(0)

  # Stub columns
  if (!is.null(stub_layout)) {
    n_stub <- get_stub_column_count(data = data)
    alignments <- c(alignments, rep("left", n_stub))
  }

  # Data columns
  for (var in default_vars) {
    align_val <- boxhead$column_align[boxhead$var == var]
    if (length(align_val) == 0L) align_val <- "center"
    alignments <- c(alignments, align_val)
  }

  align_str <- paste(alignments, collapse = ", ")

  # Build column widths
  col_widths <- character(0)
  has_widths <- FALSE

  if (!is.null(stub_layout)) {
    n_stub <- get_stub_column_count(data = data)
    col_widths <- c(col_widths, rep("auto", n_stub))
  }

  for (var in default_vars) {
    width_raw <- boxhead$column_width[boxhead$var == var]
    # column_width is a deeply nested list column; unwrap to get the string value
    while (is.list(width_raw) && length(width_raw) > 0L) {
      width_raw <- width_raw[[1]]
    }
    if (length(width_raw) == 0L || is.null(width_raw) || is.na(width_raw)) {
      col_widths <- c(col_widths, "auto")
    } else {
      typst_width <- css_length_to_typst(as.character(width_raw))
      if (!is.null(typst_width)) {
        col_widths <- c(col_widths, typst_width)
        has_widths <- TRUE
      } else {
        col_widths <- c(col_widths, "auto")
      }
    }
  }

  # Use tuple format if any widths specified, otherwise integer

  if (has_widths) {
    columns_str <- paste0("(", paste(col_widths, collapse = ", "), ")")
  } else {
    columns_str <- as.character(n_cols)
  }

  # Table width — stored for use by as_typst() to wrap in #block(width: ...)
  # Typst's #table() doesn't have a width parameter; we use a block wrapper

  # Table background color
  bg_color_str <- ""
  bg_color <- dt_options_get_value(data = data, option = "table_background_color")
  if (!is.null(bg_color) && nzchar(bg_color) && bg_color != "#FFFFFF") {
    typst_bg <- css_color_to_typst(bg_color)
    if (!is.null(typst_bg)) {
      bg_color_str <- paste0("  fill: ", typst_bg, ",\n")
    }
  }

  # Cell padding from options
  row_pad <- dt_options_get_value(data = data, option = "data_row_padding")
  row_pad_h <- dt_options_get_value(data = data, option = "data_row_padding_horizontal")

  inset_y <- css_length_to_typst(row_pad) %||% "5pt"
  inset_x <- css_length_to_typst(row_pad_h) %||% "8pt"
  inset_str <- paste0("inset: (x: ", inset_x, ", y: ", inset_y, ")")

  # Compute header row count for striping offset.
  # Since heading, spanners, and column labels are all rendered as table rows,
  # the fill function's y index includes them. We offset so striping starts
  # at the first data row.
  has_heading <- dt_heading_has_title(data = data)
  spanner_levels <- dt_spanners_matrix_height(data = data, omit_columns_row = TRUE)
  col_labels_visible <- !isTRUE(dt_options_get_value(data = data, option = "column_labels_hidden"))
  header_row_count <- (if (has_heading) 1L else 0L) + spanner_levels + (if (col_labels_visible) 1L else 0L)

  # Row striping (takes precedence over static background for fill)
  fill_str <- ""
  striping_opt <- dt_options_get_value(data = data, option = "row_striping_include_table_body")
  if (isTRUE(striping_opt)) {
    stripe_color <- dt_options_get_value(data = data, option = "row_striping_background_color")
    if (!is.null(stripe_color) && nzchar(stripe_color)) {
      typst_color <- css_color_to_typst(stripe_color)
    } else {
      typst_color <- "luma(244)"
    }
    striping_include_stub <- isTRUE(dt_options_get_value(data = data, option = "row_striping_include_stub"))
    has_stub <- !is.null(stub_layout)

    if (has_stub && !striping_include_stub) {
      fill_str <- paste0(
        "  fill: (x, y) => if y >= ", header_row_count,
        " and calc.odd(y - ", header_row_count, ") and x > 0 { ", typst_color, " },\n"
      )
    } else {
      fill_str <- paste0(
        "  fill: (_, y) => if y >= ", header_row_count,
        " and calc.odd(y - ", header_row_count, ") { ", typst_color, " },\n"
      )
    }
  } else if (nzchar(bg_color_str)) {
    # Static background color (only if not using row striping)
    fill_str <- bg_color_str
  }

  # Top table border
  top_hline <- ""
  top_border_include <- dt_options_get_value(data = data, option = "table_border_top_include")
  if (isTRUE(top_border_include)) {
    top_border <- option_border_to_typst(data, "table_border_top")
    if (!is.null(top_border)) {
      top_hline <- paste0("  table.hline(stroke: ", top_border, "),\n")
    }
  }

  # Table body hlines (horizontal lines between rows)
  hlines_style <- dt_options_get_value(data = data, option = "table_body_hlines_style")
  stroke_str <- "  stroke: none,\n"
  if (!is.null(hlines_style) && hlines_style != "none") {
    hlines_border <- option_border_to_typst(data, "table_body_hlines")
    if (!is.null(hlines_border)) {
      stroke_str <- paste0("  stroke: (x: none, y: ", hlines_border, "),\n")
    }
  }

  # Table body vlines (vertical lines between columns)
  vlines_style <- dt_options_get_value(data = data, option = "table_body_vlines_style")
  if (!is.null(vlines_style) && vlines_style != "none") {
    vlines_border <- option_border_to_typst(data, "table_body_vlines")
    if (!is.null(vlines_border)) {
      # If both hlines and vlines, combine
      if (hlines_style != "none" && !is.null(hlines_border)) {
        hlines_border_val <- option_border_to_typst(data, "table_body_hlines")
        stroke_str <- paste0("  stroke: (x: ", vlines_border, ", y: ", hlines_border_val, "),\n")
      } else {
        stroke_str <- paste0("  stroke: (x: ", vlines_border, ", y: none),\n")
      }
    }
  }

  # Table border left/right (vertical lines at edges)
  left_vline <- ""
  left_border <- option_border_to_typst(data, "table_border_left")
  if (!is.null(left_border)) {
    left_vline <- paste0("  table.vline(x: 0, stroke: ", left_border, "),\n")
  }

  right_vline <- ""
  right_border <- option_border_to_typst(data, "table_border_right")
  if (!is.null(right_border)) {
    right_vline <- paste0("  table.vline(x: ", n_cols, ", stroke: ", right_border, "),\n")
  }

  paste0(
    "#table(\n",
    "  columns: ", columns_str, ",\n",
    "  align: (", align_str, "),\n",
    stroke_str,
    "  ", inset_str, ",\n",
    fill_str,
    left_vline,
    right_vline,
    # Stub vertical border (stub_separate + stub_border)
    if (!is.null(stub_layout) && isTRUE(dt_options_get_value(data = data, option = "stub_separate"))) {
      stub_border_val <- option_border_to_typst(data, "stub_border")
      n_stub_cols <- get_stub_column_count(data = data)
      if (!is.null(stub_border_val)) {
        paste0("  table.vline(x: ", n_stub_cols, ", stroke: ", stub_border_val, "),\n")
      } else {
        ""
      }
    } else {
      ""
    },
    top_hline
  )
}

#' Create the columns component (table.header with heading + spanners + labels)
#' @param heading_content Character string of heading table.cell rows to include
#'   at the top of table.header() for page-break repetition
#' @noRd
create_columns_component_t <- function(data, heading_content = "") {

  # Check if column labels are hidden
  col_labels_hidden <- dt_options_get_value(data = data, option = "column_labels_hidden")
  if (isTRUE(col_labels_hidden)) {
    # Still emit table.header() with heading for page-break repetition
    if (nzchar(heading_content)) {
      return(paste0("  table.header(\n", heading_content, "  ),\n"))
    }
    return("")
  }

  stub_layout <- get_stub_layout(data = data)
  default_vars <- dt_boxhead_get_vars_default(data = data)
  headings_labels <- dt_boxhead_get_vars_labels_default(data = data)
  n_cols <- get_n_cols_total(data = data)

  # Column label options
  col_bg <- dt_options_get_value(data = data, option = "column_labels_background_color")
  col_font_size <- dt_options_get_value(data = data, option = "column_labels_font_size")
  col_font_weight <- dt_options_get_value(data = data, option = "column_labels_font_weight")
  col_text_transform <- dt_options_get_value(data = data, option = "column_labels_text_transform")
  col_border_lr <- option_border_to_typst(data, "column_labels_border_lr")

  # Build label vector (stub labels first)
  labels <- character(0)

  if (!is.null(stub_layout)) {
    n_stub <- get_stub_column_count(data = data)
    stubh <- dt_stubhead_get(data = data)

    if (n_stub == 1L) {
      stub_label <- if (!is.null(stubh$label) && !is.na(stubh$label)) stubh$label else ""
      labels <- c(labels, stub_label)
    } else {
      # Multi-column stub
      for (j in seq_len(n_stub)) {
        if (j == 1L && "group_label" %in% stub_layout) {
          labels <- c(labels, "")
        } else {
          stub_vars <- dt_boxhead_get_var_stub(data = data)
          idx <- if ("group_label" %in% stub_layout) j - 1L else j
          labels <- c(labels, if (idx <= length(stub_vars)) stub_vars[idx] else "")
        }
      }
    }
  }

  labels <- c(labels, headings_labels)

  # Format header cells with column label options
  # Build text properties for header cells
  header_text_props <- character(0)
  if (!is.null(col_font_size) && nzchar(col_font_size) && col_font_size != "100%") {
    typst_size <- css_length_to_typst_text_size(col_font_size)
    if (!is.null(typst_size)) {
      header_text_props <- c(header_text_props, paste0("size: ", typst_size))
    }
  }
  # For non-standard weights (not "normal" or "bold"), use #text(weight:)
  # For "bold", we use *...* markup instead (simpler, more idiomatic Typst)
  if (!is.null(col_font_weight) && !col_font_weight %in% c("normal", "bold")) {
    typst_cw <- css_weight_to_typst(col_font_weight)
    header_text_props <- c(header_text_props, paste0("weight: \"", typst_cw, "\""))
  }

  header_cell_props <- character(0)

  if (!is.null(col_bg) && !is.na(col_bg) && nzchar(col_bg)) {
    typst_bg <- css_color_to_typst(col_bg)
    if (!is.null(typst_bg)) {
      header_cell_props <- c(header_cell_props, paste0("fill: ", typst_bg))
    }
  }

  if (!is.null(col_border_lr)) {
    header_cell_props <- c(header_cell_props, paste0("stroke: (left: ", col_border_lr, ", right: ", col_border_lr, ")"))
  }

  header_cells <- vapply(labels, function(lbl) {
    if (nchar(lbl) == 0L) return("[]")

    # Apply text transform
    if (!is.null(col_text_transform) && col_text_transform != "inherit") {
      if (col_text_transform == "uppercase") lbl <- toupper(lbl)
      else if (col_text_transform == "lowercase") lbl <- tolower(lbl)
    }

    inner <- lbl

    # Bold formatting only when column_labels_font_weight is "bold"
    if (!is.null(col_font_weight) && col_font_weight == "bold") {
      inner <- paste0("*", inner, "*")
    }

    # Wrap with text properties if any
    if (length(header_text_props) > 0L) {
      inner <- paste0("#text(", paste(header_text_props, collapse = ", "), ")[", inner, "]")
    }

    # Wrap with cell properties if any
    if (length(header_cell_props) > 0L) {
      paste0("table.cell(", paste(header_cell_props, collapse = ", "), ")[", inner, "]")
    } else {
      paste0("[", inner, "]")
    }
  }, character(1), USE.NAMES = FALSE)

  # Build spanner rows (if any)
  spanner_output <- ""

  spanner_height <- dt_spanners_matrix_height(data = data, omit_columns_row = TRUE)

  if (spanner_height > 0L) {

    spanners_matrix <- dt_spanners_print_matrix(
      data = data, include_hidden = FALSE, omit_columns_row = TRUE
    )
    spanner_ids_matrix <- dt_spanners_print_matrix(
      data = data, ids = TRUE, omit_columns_row = TRUE
    )

    n_stub <- get_stub_column_count(data = data)

    for (row_i in seq_len(nrow(spanners_matrix))) {

      spanner_row <- spanners_matrix[row_i, ]
      spanner_ids_row <- spanner_ids_matrix[row_i, ]

      # Build cells for this spanner row
      spanner_cells <- character(0)

      # Stub columns get empty cells
      if (n_stub > 0L) {
        spanner_cells <- c(spanner_cells, rep("[]", n_stub))
      }

      # Process data column spanners using run-length encoding
      rle_result <- rle(as.character(spanner_ids_row))

      hline_segments <- character(0)
      col_pos <- n_stub # track position for hline start/end

      for (j in seq_along(rle_result$lengths)) {

        span_len <- rle_result$lengths[j]
        span_id <- rle_result$values[j]
        span_label <- spanners_matrix[row_i, sum(rle_result$lengths[seq_len(j - 1)]) + 1L]

        start_col <- col_pos
        end_col <- col_pos + span_len

        if (!is.na(span_id) && nzchar(span_id)) {
          # Spanner cell — inherit column_labels font weight
          spanner_inner <- if (!is.null(col_font_weight) && col_font_weight == "bold") {
            paste0("*", span_label, "*")
          } else {
            span_label
          }
          if (span_len > 1L) {
            spanner_cells <- c(
              spanner_cells,
              paste0("table.cell(colspan: ", span_len, ", align: center)[", spanner_inner, "]")
            )
          } else {
            spanner_cells <- c(spanner_cells, paste0("[", spanner_inner, "]"))
          }

          # Spanner underline — lighter than column_labels_border_bottom
          spanner_stroke <- "0.75pt + rgb(\"#D3D3D3\")"
          hline_segments <- c(
            hline_segments,
            paste0("table.hline(start: ", start_col, ", end: ", end_col, ", stroke: ", spanner_stroke, ")")
          )
        } else {
          # Empty cells for non-spanned columns
          spanner_cells <- c(spanner_cells, rep("[]", span_len))
        }

        col_pos <- end_col
      }

      spanner_output <- paste0(
        spanner_output,
        "    ", paste(spanner_cells, collapse = ", "), ",\n",
        if (length(hline_segments) > 0L) {
          paste0("    ", paste(hline_segments, collapse = ", "), ",\n")
        } else {
          ""
        }
      )
    }
  }

  # Column labels vlines (vertical lines between header cells)
  col_vlines_str <- ""
  col_vlines_style <- dt_options_get_value(data = data, option = "column_labels_vlines_style")
  if (!is.null(col_vlines_style) && col_vlines_style != "none") {
    col_vlines_border <- option_border_to_typst(data, "column_labels_vlines")
    if (!is.null(col_vlines_border)) {
      # Add vlines between each column in the header
      for (vi in seq_len(n_cols - 1L)) {
        col_vlines_str <- paste0(
          col_vlines_str,
          "    table.vline(x: ", vi, ", stroke: ", col_vlines_border, "),\n"
        )
      }
    }
  }

  # Column label top border
  col_top_border <- option_border_to_typst(data, "column_labels_border_top")
  col_top_hline <- if (!is.null(col_top_border)) {
    paste0("    table.hline(stroke: ", col_top_border, "),\n")
  } else {
    ""
  }

  # Column label bottom border
  col_border <- option_border_to_typst(data, "column_labels_border_bottom")
  col_hline <- if (!is.null(col_border)) {
    paste0("    table.hline(stroke: ", col_border, "),\n")
  } else {
    "    table.hline(stroke: 0.75pt),\n"
  }

  # Assemble header — heading goes inside table.header() for page-break repetition
  paste0(
    "  table.header(\n",
    heading_content,
    col_top_hline,
    col_vlines_str,
    spanner_output,
    "    ", paste(header_cells, collapse = ", "), ",\n",
    col_hline,
    "  ),\n"
  )
}

#' Render a single body row with styles applied
#' @param stub_style_list Optional pre-computed stub style list from styles_to_typst()
#' @noRd
render_body_row_t <- function(row_cells, row_i, col_vars, styles_tbl, stub_col_vars = NULL, stub_style_list = NULL) {

  styled_cells <- character(length(row_cells))

  for (j in seq_along(row_cells)) {
    cell_content <- row_cells[j]
    var_name <- col_vars[j]

    # Look up styles for this cell
    cell_styles <- styles_tbl[
      styles_tbl$locname == "data" &
        styles_tbl$colname == var_name &
        styles_tbl$rownum == row_i,
      ,
      drop = FALSE
    ]

    if (nrow(cell_styles) > 0L) {
      # Consolidate and apply styles
      all_style_objs <- unlist(cell_styles$styles, recursive = FALSE)
      typst_styles <- styles_to_typst(all_style_objs)
      styled_cells[j] <- apply_cell_styles_t(cell_content, typst_styles)
    } else if (!is.null(stub_style_list) && var_name %in% stub_col_vars) {
      # Apply default stub styling from options
      styled_cells[j] <- apply_cell_styles_t(cell_content, stub_style_list)
    } else {
      styled_cells[j] <- paste0("[", cell_content, "]")
    }
  }

  paste0("  ", paste(styled_cells, collapse = ", "), ",\n")
}

#' Create the body component (data rows, group rows, summary rows)
#' @noRd
create_body_component_t <- function(data) {

  cell_matrix <- get_body_component_cell_matrix(data = data)

  if (nrow(cell_matrix) == 0L) return("")

  # Escape Typst special characters in formatted cell content.
  # Format functions (fmt_currency, fmt_number, etc.) produce plain strings
  # that may contain Typst-special chars like $ (currency) or % (percent).
  # These need escaping since they'll be placed inside [...] content blocks.
  # Cells processed by fmt_typst() are already raw Typst and should not be
  # escaped — but those cells are handled by the format dispatch (they have
  # a "typst" context function that skips escaping). The cell_matrix here
  # contains the output of format functions, so we escape remaining specials.
  formats <- dt_formats_get(data = data)
  typst_fmt_cols <- character(0)
  for (fmt in formats) {
    if ("typst" %in% names(fmt$func)) {
      typst_fmt_cols <- c(typst_fmt_cols, fmt$cols)
    }
  }

  # Escape Typst special chars in formatted cells.
  # Unformatted cells are already escaped by migrate_unformatted_to_output().
  # Formatted cells (from fmt_currency, fmt_number, etc.) may contain
  # unescaped $ or % characters. We use escape_typst_safe() which only
  # escapes characters NOT already preceded by a backslash.
  #
  # Columns formatted with fmt_typst() are skipped entirely.
  default_vars_vec <- dt_boxhead_get_vars_default(data = data)
  typst_fmt_col_indices <- integer(0)
  for (fmt in formats) {
    # Detect formats that produce raw Typst markup (should not be escaped):
    # - fmt_typst(): has "typst" + "default" keys only (no "html")
    # - fmt_markdown(): has "typst" + "html" + other keys, but its typst
    #   handler produces Typst markup via markdown_to_typst()
    # We identify these by checking if the typst handler differs from the
    # default handler — standard fmt_* functions share the same logic across
    # contexts (produced by the format infrastructure), while fmt_typst and
    # fmt_markdown have distinct hand-written typst handlers.
    fmt_keys <- names(fmt$func)
    is_raw_typst <- FALSE
    if ("typst" %in% fmt_keys) {
      if (!("html" %in% fmt_keys)) {
        # fmt_typst: only has typst + default
        is_raw_typst <- TRUE
      } else if (!identical(body(fmt$func$typst), body(fmt$func$default))) {
        # fmt_markdown and similar: typst handler differs from default
        # (standard fmts share the same body via the format infrastructure)
        is_raw_typst <- TRUE
      }
    }
    if (is_raw_typst) {
      for (fc in fmt$cols) {
        idx <- match(fc, default_vars_vec)
        if (!is.na(idx)) {
          typst_fmt_col_indices <- c(typst_fmt_col_indices, idx + get_stub_column_count(data = data))
        }
      }
    }
  }

  for (col_i in seq_len(ncol(cell_matrix))) {
    if (col_i %in% typst_fmt_col_indices) next
    cell_matrix[, col_i] <- escape_typst_safe(cell_matrix[, col_i])
    # Convert scientific notation exponents (10^N) to Typst superscripts
    # ^ is not a Typst special char so it survives escape_typst_safe unchanged
    cell_matrix[, col_i] <- gsub(
      "10\\^([0-9\u2212+.-]+)", "10#super[\\1]",
      cell_matrix[, col_i], perl = TRUE
    )
  }

  # Note: table_body_border_top overlaps with column_labels_border_bottom
  # and table_body_border_bottom overlaps with grand_summary/table_border_bottom.
  # These are handled by their respective component functions to avoid double borders.

  stub_layout <- get_stub_layout(data = data)
  groups_rows_df <- dt_groups_rows_get(data = data)
  n_cols <- get_n_cols_total(data = data)
  list_of_summaries <- dt_summary_df_get(data = data)
  has_groups <- nrow(groups_rows_df) > 0L
  has_group_column <- "group_label" %in% stub_layout

  styles_tbl <- dt_styles_get(data = data)

  # Apply stub indentation
  has_stub_column <- !is.null(stub_layout) && "rowname" %in% stub_layout
  if (has_stub_column) {
    stub_df <- dt_stub_df_get(data = data)
    if (!all(is.na(stub_df$indent))) {
      indent_length <- dt_options_get_value(data = data, option = "stub_indent_length")
      indent_px <- as.integer(gsub("px", "", indent_length))
      indent_pt <- indent_px * 0.75

      # Find the stub column index in the matrix
      stub_col_idx <- if (has_group_column) 2L else 1L

      for (r in seq_len(nrow(cell_matrix))) {
        indent_val <- stub_df$indent[r]
        if (!is.na(indent_val) && indent_val > 0L) {
          cell_matrix[r, stub_col_idx] <- paste0(
            "#h(", indent_pt * indent_val, "pt)", cell_matrix[r, stub_col_idx]
          )
        }
      }
    }
  }

  # Build column variable names vector matching the cell_matrix columns
  default_vars <- dt_boxhead_get_vars_default(data = data)
  stub_vars <- character(0)
  if (!is.null(stub_layout)) {
    if ("group_label" %in% stub_layout) {
      stub_vars <- c(stub_vars, "::group::")
    }
    if ("rowname" %in% stub_layout) {
      sv <- dt_boxhead_get_var_stub(data = data)
      if (!anyNA(sv)) stub_vars <- c(stub_vars, sv)
      else stub_vars <- c(stub_vars, "::stub::")
    }
  }
  all_col_vars <- c(stub_vars, default_vars)

  # Compute stub styling from options
  stub_style_list <- NULL
  stub_col_var_names <- NULL
  if (has_stub_column && length(stub_vars) > 0L) {
    stub_bg <- dt_options_get_value(data = data, option = "stub_background_color")
    stub_font_sz <- dt_options_get_value(data = data, option = "stub_font_size")
    stub_font_wt <- dt_options_get_value(data = data, option = "stub_font_weight")
    stub_txt_xform <- dt_options_get_value(data = data, option = "stub_text_transform")

    stub_cell_p <- character(0)
    stub_text_p <- character(0)
    stub_outer_w <- character(0)

    if (!is.null(stub_bg) && !is.na(stub_bg) && nzchar(stub_bg)) {
      typst_bg <- css_color_to_typst(stub_bg)
      if (!is.null(typst_bg)) stub_cell_p <- c(stub_cell_p, paste0("fill: ", typst_bg))
    }

    # When row_striping is enabled but row_striping_include_stub is FALSE,
    # override stub cells with white/table background to cancel the table-level fill
    striping_active <- isTRUE(dt_options_get_value(data = data, option = "row_striping_include_table_body"))
    striping_include_stub <- isTRUE(dt_options_get_value(data = data, option = "row_striping_include_stub"))
    if (striping_active && !striping_include_stub && !any(grepl("^fill:", stub_cell_p))) {
      tbl_bg <- dt_options_get_value(data = data, option = "table_background_color")
      override_bg <- css_color_to_typst(tbl_bg %||% "#FFFFFF")
      stub_cell_p <- c(stub_cell_p, paste0("fill: ", override_bg))
    }
    if (!is.null(stub_font_sz) && nzchar(stub_font_sz) && stub_font_sz != "100%") {
      tsz <- css_length_to_typst_text_size(stub_font_sz)
      if (!is.null(tsz)) stub_text_p <- c(stub_text_p, paste0("size: ", tsz))
    }
    if (!is.null(stub_font_wt) && nzchar(stub_font_wt) && stub_font_wt != "initial") {
      typst_swt <- css_weight_to_typst(stub_font_wt)
      stub_text_p <- c(stub_text_p, paste0("weight: \"", typst_swt, "\""))
    }
    if (!is.null(stub_txt_xform) && stub_txt_xform != "inherit") {
      if (stub_txt_xform == "uppercase") stub_outer_w <- c(stub_outer_w, "upper")
      else if (stub_txt_xform == "lowercase") stub_outer_w <- c(stub_outer_w, "lower")
    }

    if (length(stub_cell_p) > 0L || length(stub_text_p) > 0L || length(stub_outer_w) > 0L) {
      stub_style_list <- list(
        cell_props = stub_cell_p,
        text_props = stub_text_p,
        outer_wraps = stub_outer_w
      )
      stub_col_var_names <- stub_vars
    }
  }

  out <- ""

  # Track which rows belong to which group for interleaving
  if (has_groups && nrow(groups_rows_df) > 0L) {

    for (grp_i in seq_len(nrow(groups_rows_df))) {

      group_label <- groups_rows_df$group_label[grp_i]
      group_id <- groups_rows_df$group_id[grp_i]
      row_start <- groups_rows_df$row_start[grp_i]
      row_end <- groups_rows_df$row_end[grp_i]

      # Add separator before group (except the first)
      if (grp_i > 1L) {
        rg_border_top <- option_border_to_typst(data, "row_group_border_top")
        if (!is.null(rg_border_top)) {
          out <- paste0(out, "  table.hline(stroke: ", rg_border_top, "),\n")
        } else {
          out <- paste0(out, "  table.hline(stroke: 0.5pt),\n")
        }
      }

      # Group label row spanning all columns (with row_group options)
      rg_bg <- dt_options_get_value(data = data, option = "row_group_background_color")
      rg_font_weight <- dt_options_get_value(data = data, option = "row_group_font_weight")
      rg_font_size <- dt_options_get_value(data = data, option = "row_group_font_size")
      rg_text_transform <- dt_options_get_value(data = data, option = "row_group_text_transform")

      grp_label_text <- group_label
      if (!is.null(rg_text_transform) && rg_text_transform != "inherit") {
        if (rg_text_transform == "uppercase") grp_label_text <- toupper(grp_label_text)
        else if (rg_text_transform == "lowercase") grp_label_text <- tolower(grp_label_text)
      }

      grp_text_props <- character(0)
      rg_weight <- if (!is.null(rg_font_weight) && rg_font_weight != "initial") {
        css_weight_to_typst(rg_font_weight)
      } else {
        "bold"
      }
      grp_text_props <- c(grp_text_props, paste0("weight: \"", rg_weight, "\""))
      if (!is.null(rg_font_size) && nzchar(rg_font_size) && rg_font_size != "100%") {
        typst_rg_size <- css_length_to_typst_text_size(rg_font_size)
        if (!is.null(typst_rg_size)) {
          grp_text_props <- c(grp_text_props, paste0("size: ", typst_rg_size))
        }
      }

      grp_cell_props <- paste0("colspan: ", n_cols)
      if (!is.null(rg_bg) && !is.na(rg_bg) && nzchar(rg_bg)) {
        typst_rg_bg <- css_color_to_typst(rg_bg)
        if (!is.null(typst_rg_bg)) {
          grp_cell_props <- paste0(grp_cell_props, ", fill: ", typst_rg_bg)
        }
      }

      # Row group border left/right
      rg_border_lr <- option_border_to_typst(data, "row_group_border_right")
      rg_border_left <- option_border_to_typst(data, "row_group_border_left")
      if (!is.null(rg_border_lr) || !is.null(rg_border_left)) {
        rg_strokes <- character(0)
        if (!is.null(rg_border_left)) rg_strokes <- c(rg_strokes, paste0("left: ", rg_border_left))
        if (!is.null(rg_border_lr)) rg_strokes <- c(rg_strokes, paste0("right: ", rg_border_lr))
        grp_cell_props <- paste0(grp_cell_props, ", stroke: (", paste(rg_strokes, collapse = ", "), ")")
      }

      # Row group padding
      rg_pad <- dt_options_get_value(data = data, option = "row_group_padding")
      rg_pad_h <- dt_options_get_value(data = data, option = "row_group_padding_horizontal")
      rg_pad_y <- css_length_to_typst(rg_pad)
      rg_pad_x <- css_length_to_typst(rg_pad_h)
      if (!is.null(rg_pad_y) || !is.null(rg_pad_x)) {
        pad_x <- rg_pad_x %||% "5pt"
        pad_y <- rg_pad_y %||% "8pt"
        grp_cell_props <- paste0(grp_cell_props, ", inset: (x: ", pad_x, ", y: ", pad_y, ")")
      }

      out <- paste0(
        out,
        "  table.cell(", grp_cell_props, ")[#text(",
        paste(grp_text_props, collapse = ", "),
        ")[", grp_label_text, "]],\n"
      )

      # Row group border bottom
      rg_border_bottom <- option_border_to_typst(data, "row_group_border_bottom")
      if (!is.null(rg_border_bottom)) {
        out <- paste0(out, "  table.hline(stroke: ", rg_border_bottom, "),\n")
      }

      # Summary rows (top side)
      summary_top <- render_summary_rows_t(
        data = data,
        list_of_summaries = list_of_summaries,
        group_id = group_id,
        side = "top",
        n_cols = n_cols
      )
      out <- paste0(out, summary_top)

      # Data rows for this group
      for (row_i in row_start:row_end) {

        row_cells <- cell_matrix[row_i, ]
        col_vars <- all_col_vars

        # Skip group_label column (column 1) if it exists in the matrix
        if (has_group_column) {
          row_cells <- row_cells[-1]
          col_vars <- col_vars[-1]
        }

        out <- paste0(out, render_body_row_t(row_cells, row_i, col_vars, styles_tbl, stub_col_var_names, stub_style_list))
      }

      # Summary rows (bottom side)
      summary_bottom <- render_summary_rows_t(
        data = data,
        list_of_summaries = list_of_summaries,
        group_id = group_id,
        side = "bottom",
        n_cols = n_cols
      )
      out <- paste0(out, summary_bottom)
    }

  } else {

    # No groups — just render rows
    for (row_i in seq_len(nrow(cell_matrix))) {

      row_cells <- cell_matrix[row_i, ]

      out <- paste0(out, render_body_row_t(row_cells, row_i, all_col_vars, styles_tbl, stub_col_var_names, stub_style_list))
    }
  }

  # Grand summary rows
  if (!is.null(list_of_summaries$summary_df_display_list[["::GRAND_SUMMARY"]]) &&
      nrow(list_of_summaries$summary_df_display_list[["::GRAND_SUMMARY"]]) > 0L) {

    gs_border <- option_border_to_typst(data, "grand_summary_row_border")
    if (!is.null(gs_border)) {
      out <- paste0(out, "  table.hline(stroke: ", gs_border, "),\n")
    } else {
      out <- paste0(out, "  table.hline(stroke: 0.75pt),\n")
    }

    grand_summary <- render_summary_rows_t(
      data = data,
      list_of_summaries = list_of_summaries,
      group_id = "::GRAND_SUMMARY",
      side = NULL,
      n_cols = n_cols
    )
    out <- paste0(out, grand_summary)
  }

  out
}

#' Render summary rows for a given group
#' @noRd
render_summary_rows_t <- function(
    data,
    list_of_summaries,
    group_id,
    side = NULL,
    n_cols
) {

  summary_df <- list_of_summaries$summary_df_display_list[[group_id]]

  if (is.null(summary_df) || nrow(summary_df) == 0L) return("")

  # Filter by side if specified
  if (!is.null(side) && "::side::" %in% names(summary_df)) {
    summary_df <- summary_df[summary_df[["::side::"]] == side, , drop = FALSE]
  }

  if (nrow(summary_df) == 0L) return("")

  default_vars <- dt_boxhead_get_vars_default(data = data)
  stub_layout <- get_stub_layout(data = data)
  has_groups <- "group_label" %in% stub_layout

  # Determine if this is a grand summary or regular summary
  is_grand <- identical(group_id, "::GRAND_SUMMARY")
  opt_prefix <- if (is_grand) "grand_summary_row" else "summary_row"

  # Read summary row options
  sr_padding <- dt_options_get_value(data = data, option = paste0(opt_prefix, "_padding"))
  sr_padding_h <- dt_options_get_value(data = data, option = paste0(opt_prefix, "_padding_horizontal"))
  sr_bg <- dt_options_get_value(data = data, option = paste0(opt_prefix, "_background_color"))
  sr_text_transform <- dt_options_get_value(data = data, option = paste0(opt_prefix, "_text_transform"))
  sr_border <- option_border_to_typst(data, paste0(opt_prefix, "_border"))

  # Build cell properties for summary cells
  # Only wrap summary cells in table.cell() when explicit styling is set
  sr_cell_props <- character(0)
  if (!is.null(sr_bg) && !is.na(sr_bg) && nzchar(sr_bg)) {
    typst_bg <- css_color_to_typst(sr_bg)
    if (!is.null(typst_bg)) sr_cell_props <- c(sr_cell_props, paste0("fill: ", typst_bg))
  }

  out <- ""

  # Add border before summary rows
  if (!is.null(sr_border)) {
    out <- paste0(out, "  table.hline(stroke: ", sr_border, "),\n")
  }

  for (row_i in seq_len(nrow(summary_df))) {

    row_label <- escape_typst(summary_df[["::rowname::"]][row_i])

    # Apply text transform to label
    if (!is.null(sr_text_transform) && sr_text_transform != "inherit") {
      if (sr_text_transform == "uppercase") row_label <- toupper(row_label)
      else if (sr_text_transform == "lowercase") row_label <- tolower(row_label)
    }

    cells <- character(0)

    # Label cell (bold)
    label_cell <- paste0("*", row_label, "*")
    if (length(sr_cell_props) > 0L) {
      label_cell <- paste0("table.cell(", paste(sr_cell_props, collapse = ", "), ")[", label_cell, "]")
    } else {
      label_cell <- paste0("[", label_cell, "]")
    }
    cells <- c(cells, label_cell)

    # Data columns
    for (var in default_vars) {
      cell_val <- if (var %in% names(summary_df)) {
        val <- summary_df[[var]][row_i]
        if (is.na(val)) "" else escape_typst(as.character(val))
      } else {
        ""
      }

      if (length(sr_cell_props) > 0L) {
        cells <- c(cells, paste0("table.cell(", paste(sr_cell_props, collapse = ", "), ")[", cell_val, "]"))
      } else {
        cells <- c(cells, paste0("[", cell_val, "]"))
      }
    }

    # Adjust cell count to match n_cols
    n_stub <- get_stub_column_count(data = data)
    if (has_groups) {
      needed_stub <- n_stub - 1L
    } else {
      needed_stub <- n_stub
    }

    if (needed_stub > 1L) {
      cells <- c(cells[1], rep("[]", needed_stub - 1L), cells[-1])
    }

    out <- paste0(out, "  ", paste(cells, collapse = ", "), ",\n")
  }

  out
}

#' Create the table end
#' @noRd
create_table_end_t <- function(data) {

  bottom_hline <- ""
  bottom_border_include <- dt_options_get_value(data = data, option = "table_border_bottom_include")
  if (isTRUE(bottom_border_include)) {
    bottom_border <- option_border_to_typst(data, "table_border_bottom")
    if (!is.null(bottom_border)) {
      bottom_hline <- paste0("  table.hline(stroke: ", bottom_border, "),\n")
    }
  }

  paste0(
    bottom_hline,
    ")\n"
  )
}

#' Create the footer component as table.cell rows inside the table
#'
#' Returns table.cell(colspan: N) entries for footnotes and source notes,
#' placed inside the #table() after the body rows and before the bottom border.
#' This way the footer inherits the table's width and styling.
#' @noRd
create_footer_component_t <- function(data) {

  n_cols <- get_n_cols_total(data = data)

  footnotes_tbl <- dt_footnotes_get(data = data)
  source_notes_vec <- dt_source_notes_get(data = data)

  # Footnote/source note options
  fn_font_size <- dt_options_get_value(data = data, option = "footnotes_font_size")
  fn_size_typst <- css_length_to_typst_text_size(fn_font_size) %||% "8pt"
  fn_multiline <- dt_options_get_value(data = data, option = "footnotes_multiline")
  fn_sep <- dt_options_get_value(data = data, option = "footnotes_sep")

  sn_font_size <- dt_options_get_value(data = data, option = "source_notes_font_size")
  sn_size_typst <- css_length_to_typst_text_size(sn_font_size) %||% "8pt"
  sn_multiline <- dt_options_get_value(data = data, option = "source_notes_multiline")
  sn_sep <- dt_options_get_value(data = data, option = "source_notes_sep")

  # Footnotes options
  fn_padding <- dt_options_get_value(data = data, option = "footnotes_padding")
  fn_padding_h <- dt_options_get_value(data = data, option = "footnotes_padding_horizontal")
  fn_bg <- dt_options_get_value(data = data, option = "footnotes_background_color")
  fn_margin <- dt_options_get_value(data = data, option = "footnotes_margin")
  fn_border_bottom <- option_border_to_typst(data, "footnotes_border_bottom")
  fn_border_lr <- option_border_to_typst(data, "footnotes_border_lr")

  # Source notes options
  sn_padding <- dt_options_get_value(data = data, option = "source_notes_padding")
  sn_padding_h <- dt_options_get_value(data = data, option = "source_notes_padding_horizontal")
  sn_bg <- dt_options_get_value(data = data, option = "source_notes_background_color")
  sn_border_bottom <- option_border_to_typst(data, "source_notes_border_bottom")
  sn_border_lr <- option_border_to_typst(data, "source_notes_border_lr")

  out <- ""

  has_footer <- (!is.null(footnotes_tbl) && nrow(footnotes_tbl) > 0L) || length(source_notes_vec) > 0L
  if (!has_footer) return("")

  # Separator line before footer (uses table_body_border_bottom)
  body_bottom_border <- option_border_to_typst(data, "table_body_border_bottom")
  if (!is.null(body_bottom_border)) {
    out <- paste0(out, "  table.hline(stroke: ", body_bottom_border, "),\n")
  }

  # Helper to build a table.cell for a footer section
  build_footer_cell <- function(content, bg, padding, padding_h, border_bottom, border_lr) {
    cell_props <- paste0("colspan: ", n_cols, ", align: left")
    # Always set fill to prevent table-level striping from leaking into footer
    if (!is.null(bg) && !is.na(bg) && nzchar(bg)) {
      typst_bg <- css_color_to_typst(bg)
    } else {
      tbl_bg <- dt_options_get_value(data = data, option = "table_background_color")
      typst_bg <- css_color_to_typst(tbl_bg %||% "#FFFFFF")
    }
    if (!is.null(typst_bg)) cell_props <- paste0(cell_props, ", fill: ", typst_bg)
    pad_y <- css_length_to_typst(padding) %||% "4pt"
    pad_x <- css_length_to_typst(padding_h) %||% "5pt"
    cell_props <- paste0(cell_props, ", inset: (x: ", pad_x, ", y: ", pad_y, ")")
    # Borders via stroke on the cell
    strokes <- character(0)
    if (!is.null(border_bottom)) strokes <- c(strokes, paste0("bottom: ", border_bottom))
    if (!is.null(border_lr)) {
      strokes <- c(strokes, paste0("left: ", border_lr), paste0("right: ", border_lr))
    }
    if (length(strokes) > 0L) {
      cell_props <- paste0(cell_props, ", stroke: (", paste(strokes, collapse = ", "), ")")
    }
    paste0("  table.cell(", cell_props, ")[", content, "],\n")
  }

  # Footnotes
  if (!is.null(footnotes_tbl) && nrow(footnotes_tbl) > 0L) {

    footnotes_resolved <- unique(footnotes_tbl[, c("fs_id", "footnotes"), drop = FALSE])

    if (isTRUE(fn_multiline)) {
      fn_parts <- vapply(seq_len(nrow(footnotes_resolved)), function(i) {
        mark <- footnotes_resolved$fs_id[i]
        note_text <- footnotes_resolved$footnotes[i]
        paste0("#text(size: ", fn_size_typst, ")[#super[", mark, "] ", note_text, "]")
      }, character(1))
      fn_content <- paste(fn_parts, collapse = " \\ ")
    } else {
      parts <- vapply(seq_len(nrow(footnotes_resolved)), function(i) {
        mark <- footnotes_resolved$fs_id[i]
        note_text <- footnotes_resolved$footnotes[i]
        paste0("#super[", mark, "] ", note_text)
      }, character(1))
      fn_content <- paste0("#text(size: ", fn_size_typst, ")[", paste(parts, collapse = fn_sep), "]")
    }

    out <- paste0(out, build_footer_cell(
      fn_content, fn_bg, fn_padding, fn_padding_h, fn_border_bottom, fn_border_lr
    ))
  }

  # Source notes
  if (length(source_notes_vec) > 0L) {

    if (isTRUE(sn_multiline)) {
      sn_parts <- vapply(source_notes_vec, function(note) {
        paste0("#text(size: ", sn_size_typst, ")[", note, "]")
      }, character(1))
      sn_content <- paste(sn_parts, collapse = " \\ ")
    } else {
      sn_content <- paste0("#text(size: ", sn_size_typst, ")[", paste(source_notes_vec, collapse = sn_sep), "]")
    }

    out <- paste0(out, build_footer_cell(
      sn_content, sn_bg, sn_padding, sn_padding_h, sn_border_bottom, sn_border_lr
    ))
  }

  out
}

#' Create the caption component (wraps table in #figure if caption needed)
#' @noRd
create_caption_component_t <- function(data) {

  # For now, captions are handled outside the table

  # The heading component handles title/subtitle
  # A future enhancement could wrap in #figure(..., caption: [...])
  ""
}
