rtf_paste0 <- function(..., collapse = NULL) {
  args <- lapply(list(...), function(x) {
    if (is.null(x) || is_rtf(x)) {
      x
    } else {
      rtf_escape(as.character(x))
    }
  })
  args$collapse <- collapse
  rtf_raw(do.call(paste0, args))
}

rtf_key <- function(word, val = NULL, space = FALSE) {
  rtf_raw(paste0("\\", word, val %||% "", if (space) " "))
}

rtf_fonttbl <- function(...,
                        .font_names = NULL,
                        .default_n = NULL) {

  fonts <- list(...)

  if (!is.null(.font_names)) {
    fonts <- lapply(.font_names, FUN = function(x) rtf_font_def(x))
  }

  if (length(fonts) < 1) {
    fonts <-
      list(
        rtf_font_def(font = "Calibri", family = "roman"),
        rtf_font_def(font = "Courier", family = "roman")
      )
  }

  # TODO: Validate that all provided objects are "rtf_font"
  default_n <- if (!is.null(.default_n)) rtf_key("deff", .default_n - 1) else ""

  font_sequence <- seq_len(length(fonts)) - 1

  fontinfo_values <-
    vapply(
      seq_along(fonts),FUN.VALUE = character(1), USE.NAMES = FALSE,
      FUN = function(x) {
        fonts[x] %>% unlist() %>% gsub("{x}", font_sequence[x], ., fixed = TRUE)
      }
    )

  fonttbl_values <- rtf_key("fonttbl", paste(fontinfo_values, collapse = ""))

  rtf_fonttbl <- list(paste0(default_n, paste0("{", fonttbl_values, "}")))

  class(rtf_fonttbl) <- "rtf_fonttbl"
  rtf_fonttbl
}

rtf_font_def <- function(font,
                         family = NULL,
                         number = NULL,
                         charset = NULL,
                         pitch = NULL) {

  font_family_name <- family %||% "nil"
  font_charset <- charset %||% 0
  font_pitch <- pitch %||% 0

  rtf_font_n <- rtf_key("f", "{x}")
  rtf_fontfamily <- rtf_key("f", font_family_name)
  rtf_fontcharset <- rtf_key("fcharset", font_charset)
  rtf_fontpitch <- rtf_key("fprq", font_pitch)

  rtf_font <-
    list(
      paste0(
        "{",
        rtf_font_n,
        rtf_fontfamily,
        rtf_fontcharset,
        rtf_fontpitch,
        " ",
        font,
        ";}"
      )
    )

  class(rtf_font) <- "rtf_font"
  rtf_font
}

rtf_colortbl <- function(...,
                         .hexadecimal_colors = NULL,
                         .add_default = TRUE) {

  colors <- list(...)

  if (!is.null(.hexadecimal_colors)) {
    colors <- lapply(.hexadecimal_colors, FUN = function(x) rtf_color(x))
  }

  rtf_colortbl <-
    list(
      paste0(
        "{",
        rtf_key(
          "colortbl",
          paste0(if (.add_default) ";", paste(unlist(colors), collapse = ";"), ";")
        ),
        "}"
      )
    )

  class(rtf_colortbl) <- "rtf_colortbl"
  rtf_colortbl
}

rtf_color <- function(color = NULL, rgb = NULL) {

  if (!is.null(color)) {
    rgb <- as.integer(t(grDevices::col2rgb(col = color)))
  }

  rtf_color <-
    list(
      paste0(
        rtf_key("red", rgb[1]),
        rtf_key("green", rgb[2]),
        rtf_key("blue", rgb[3])
      )
    )

  class(rtf_color) <- "rtf_color"
  rtf_color
}

rtf_header <- function(..., .charset = "ansi", .ansi_code_page = 1252) {

  # Requires the font table (<fonttbl>)

  # Optionally can use the:
  #   [1] file table (<filetbl>)
  #   [2] color table (<colortbl>)
  #   [3] stylesheet (<stylesheet>)
  #   [4] list tables (<listtables>)
  #   [5] revision table (<revtbl>)

  dots_list <- list(...)

  additional_items <- c()

  # TODO: Validate `dots_list` for object types

  rtf_rtf_key <- rtf_key("rtf")
  charset_key <- rtf_key(.charset)
  ansi_code_page_key <- rtf_key("ansicpg", .ansi_code_page)

  # Get a vector of the different object types
  object_types <- vapply(dots_list, class, FUN.VALUE = character(1), USE.NAMES = FALSE)

  # TODO: Validate the `object_types` vector

  # Extract the `font_table` object
  font_table <- unlist(dots_list[object_types == "rtf_fonttbl"])

  if ("rtf_colortbl" %in% object_types) {
    additional_items <- c(additional_items, unlist(dots_list[object_types == "rtf_colortbl"]))
  }

  # Arrange the keywords of the RTF header
  rtf_header <-
    list(
      rtf_header = paste0(
        rtf_rtf_key,
        charset_key,
        ansi_code_page_key,
        font_table,
        additional_items,
        "\n"
      )
    )

  class(rtf_header) <- c("rtf_header", "rtf")
  rtf_header
}

rtf_file <- function(header = NULL, document = NULL) {

  if (is.null(header) && is.null(document)) {
    header <- document <- ""
  } else if (is.null(header) && !is.null(document)) {

    # If `header` is NULL then generate the header based on the
    # `document` content (and also modify the document)

    # Scan for hexadecimal colors in the document; generate
    # a <colortbl> object
    matched_colors <-
      unique(unlist(stringr::str_extract_all(document, "<<COLOR:#[0-9a-fA-F]{6}>>")))

    if (length(matched_colors) > 0) {

      colortbl <-
        rtf_colortbl(.hexadecimal_colors = gsub("<<COLOR:|>>", "", matched_colors))

      for (i in seq_along(matched_colors)) {
        document <- gsub(matched_colors[i], as.character(i), document, fixed = TRUE)
      }
    } else {
      colortbl <- rtf_colortbl(.hexadecimal_colors = "#FFFFFF")
    }

    # Scan for hexadecimal colors in the document; generate
    # a <fonttbl> object
    matched_fonts <-
      unique(unlist(stringr::str_extract_all(document, "<<FONT:.*?>>")))

    if (length(matched_fonts) > 0) {

      fonttbl <-
        rtf_fonttbl(.font_names = c("Calibri", gsub("<<FONT:|>>", "", matched_fonts)), .default_n = 1)

      for (i in seq_along(matched_fonts)) {
        document <- gsub(matched_fonts[i], as.character(i), document, fixed = TRUE)
      }
    } else {
      fonttbl <- rtf_fonttbl()
    }

    # Create the document header
    header <- rtf_header(fonttbl, colortbl)
  }


  rtf_file <- list(header = header, document = document)

  class(rtf_file) <- c("rtf_file", "rtf")
  rtf_file
}

rtf_table <- function(rows) {

  rtf_raw(paste(unlist(rows), collapse = ""))
}

# This is the assumed width of the area within page
# margins in a default Word document
standard_width_twips <- 9468L

twip_factors <-
  c(
    `in` = 1440, `pt` = 20, `px` = 15,
    `cm` = 566.9291, `mm` = 56.69291, `tw` = 1
  )

# Input: character vector of any length. Valid values are numbers with
# suffix of in, pt, px, cm, mm, tw; you can also include `""`.
# Output: data frame with columns `value` and `unit`, with NA for both
# if input element was `""`. Unparseable values throw errors.
parse_length_str <- function(lengths_vec) {

  if (length(lengths_vec) == 1 && lengths_vec == "auto") {
    lengths_vec <- paste0(standard_width_twips, "tw")
  }

  match <- regexec("^([0-9.-]+)(%|[a-z]+)$", lengths_vec)
  match <- regmatches(lengths_vec, match)

  vals <- vapply(match, function(m) {
    if (length(m)) {
      as.numeric(m[[2]])
    } else {
      NA_real_
    }
  }, numeric(1))

  units <- vapply(match, function(m) {
    if (length(m)) {
      m[[3]]
    } else {
      NA_character_
    }
  }, character(1))

  bad_values <- nzchar(lengths_vec) & is.na(vals)

  if (any(bad_values)) {
    stop(
      "Some of the values supplied as absolute lengths cannot be interpreted:\n",
      "* Use either of: `px`, `pt`, `in`, `cm`, `mm`, or `tw`.",
      call. = FALSE
    )
  }

  dplyr::tibble(value = vals, unit = units)
}

abs_len_to_twips <- function(lengths_df) {

  lengths_df %>%
    dplyr::left_join(
      tibble::enframe(twip_factors, name = "unit", value = "conv"),
      by = c("unit" = "unit")
    ) %>%
    dplyr::mutate(
      value = ifelse(!is.na(conv), value * conv, value),
      unit = ifelse(!is.na(conv), "tw", unit)
    ) %>%
    dplyr::select(value, unit)
}

# The `col_width_resolver_rtf()` function returns a vector of
# RTF column widths in units of twips (numeric)
#
# `table_width` and `col_widths` should be character vectors with
# a numeric portion followed by the unit; the first should be a
# length-1 vector and the latter should be a vector with as many
# elements as there are visible columns in the gt table
col_width_resolver_rtf <- function(table_width,
                                   col_widths,
                                   n_cols) {

  if (table_width == "auto" && is.null(col_widths)) {
    return(rep(standard_width_twips / n_cols, n_cols))
  }

  table_width <- abs_len_to_twips(parse_length_str(table_width))

  # Should stop if row count of `table_width` isn't 1
  stopifnot(nrow(table_width) == 1)

  # For a table width set as a percentage, convert it to twips
  # using the assumed width of a table set in a page
  if (table_width$unit == "%") {

    table_width$value <- (table_width$value / 100) * standard_width_twips
    table_width$unit <- "tw"
  }

  # Ensure that the `table_width` unit is `"tw"`
  stopifnot(isTRUE(table_width$unit == "tw"))

  # If given a table width (i.e., not `"auto"`) without any specification
  # of column widths, generate evenly spaced column widths based on the
  # table width
  if (is.null(col_widths)) {
    col_widths <- paste0(rep(table_width$value / n_cols, n_cols), "tw")
  }

  col_widths <- abs_len_to_twips(parse_length_str(col_widths))

  is_udf <- is.na(col_widths$value) & is.na(col_widths$unit)
  is_abs <- !is_udf & col_widths$unit == "tw"
  is_pct <- !is_udf & col_widths$unit == "%"

  stopifnot(all(is_abs | is_pct | is_udf))

  twips_used <- sum(col_widths$value[is_abs])
  twips_remaining <- max(0, table_width$value - twips_used)

  col_widths$value[is_pct] <- twips_remaining * col_widths$value[is_pct] / 100
  col_widths$unit[is_pct] <- "tw"

  twips_remaining <- max(0, table_width$value - sum(na.omit(col_widths$value)))

  col_widths$value[is_udf] <- twips_remaining / sum(is_udf)
  col_widths$unit[is_udf] <- "tw"

  if (sum(col_widths$value) != table_width$value) {

    col_widths$value <-
      col_widths$value / (sum(col_widths$value) / table_width$value)
  }

  col_widths[["value"]]
}

rtf_tbl_row <- function(x,
                        widths = NULL,
                        height = NULL,
                        borders = NULL,
                        repeat_header = FALSE) {

  if (is.list(x)) x <- unlist(x)

  cell_count <- length(x)

  if (!is.null(widths)) {
    widths_twips <- cumsum(widths)
  } else {
    widths_twips <- cumsum(rep(standard_width_twips / cell_count, cell_count))
  }

  if (is.null(height)) height <- 425

  # Set border values
  if (!is.null(borders)) {

    if (inherits(borders, "list")) {
      borders <- unlist(borders, recursive = FALSE)
    }

    tb_borders <-
      borders %>%
      lapply(
        FUN = function(x) {

          if (is.numeric(x$color)) {
            border_color_value <- x$color
          } else {
            border_color_value <- rtf_paste0("<<COLOR:", rtf_raw(x$color), ">>")
          }

          if (x$direction %in% c("top", "bottom")) {

            rtf_paste0(
              rtf_key("clbrdr", substr(x$direction, 1, 1)),
              rtf_key("brdr", x$style),
              rtf_key("brdrw", x$width),
              rtf_key("brdrcf", border_color_value)
            )
          } else {
            ""
          }
        }
      ) %>% unlist()

    lr_borders <-
      borders %>%
      lapply(
        FUN = function(x) {

          if (is.numeric(x$color)) {
            border_color_value <- x$color
          } else {
            border_color_value <- rtf_paste0("<<COLOR:", rtf_raw(x$color), ">>")
          }

          if (x$direction %in% c("left", "right")) {

            rtf_paste0(
              rtf_key("clbrdr", substr(x$direction, 1, 1)),
              rtf_key("brdr", x$style),
              rtf_key("brdrw", x$width),
              rtf_key("brdrcf", border_color_value)
            )
          } else {
            ""
          }
        }
      ) %>% unlist()

  } else {
    tb_borders <- ""
    lr_borders <- ""
  }

  # Combine all row settings
  row_settings <-
    rtf_paste0(
      rtf_key("trowd"),
      rtf_key("trrh", height),
      if (repeat_header) rtf_key("trhdr")
    )

  # Divide `x` into a list with three elements
  x <- strsplit(x, "\n")

  # Combine additional row components to the first element
  row_components <- paste0(tb_borders, paste0("\\cellx", floor(widths_twips)))

  for (i in seq_along(row_components)) {
    x[[i]][1] <- rtf_paste0(rtf_raw(x[[i]][1]), rtf_raw(row_components[i]))
  }

  x <- lapply(x, FUN = function(x) paste(x, collapse = "\n")) %>% unlist()

  # Return a complete row of RTF table cells (marked as `rtf_text`)
  rtf_paste0(
    row_settings,
    "\n\n",
    rtf_raw(paste0(x, collapse = "\n\n")),
    "\n\n",
    rtf_key("row"),
    "\n\n"
  )
}

rtf_tbl_cell <- function(x,
                         borders = NULL,
                         h_align = c("left", "center", "right"),
                         v_align = c("center", "top", "bottom"),
                         h_merge = NULL,
                         padding = NULL,
                         cell_background_color = NULL,
                         font = NULL,
                         font_size = NULL,
                         font_color = NULL,
                         bold = FALSE,
                         italic = FALSE,
                         super_sub = NULL) {

  x <- paste(x, collapse = " ")

  h_align <- substr(match.arg(h_align), 1, 1)
  v_align <- substr(match.arg(v_align), 1, 1)

  # Set default padding values if `padding = NULL`
  if (is.null(padding)) padding <- c(50, 50, 50, 50)

  # Set padding in units of twips, in the order bottom, right, left, and top
  padding_values <-
    c(
      rtf_key("clpadb", padding[1]), rtf_key("clpadr", padding[2]),
      rtf_key("clpadl", padding[3]), rtf_key("clpadt", padding[4])
    )
  padding_units <-
    c(
      rtf_key("clpadfb", 3), rtf_key("clpadfr", 3),
      rtf_key("clpadfl", 3), rtf_key("clpadft", 3)
    )

  cell_padding <- paste(paste0(padding_values, padding_units), collapse = "")

  # Set border values
  if (!is.null(borders)) {

    if (inherits(borders, "list")) {
      borders <- unlist(borders, recursive = FALSE)
    }

    cell_borders <-
      vapply(
        borders,
        FUN.VALUE = character(1),
        USE.NAMES = FALSE,
        FUN = function(x) {

          if (is.numeric(x$color)) {
            border_color_value <- x$color
          } else {
            border_color_value <- rtf_raw(paste0("<<COLOR:", x$color, ">>"))
          }

          rtf_paste0(
            rtf_key("clbrdr", substr(x$direction, 1, 1)),
            rtf_key("brdr", x$style),
            rtf_key("brdrw", x$width),
            rtf_key("brdrcf", border_color_value)
          )
        }
      ) %>%
      paste(collapse = "")
  } else {
    cell_borders <- ""
  }

  # Set background color
  if (!is.null(cell_background_color)) {
    cell_background_color <- rtf_key("clcbpat", paste0("<<COLOR:", cell_background_color, ">>"))
  } else {
    cell_background_color <- ""
  }

  # Set horizontal cell merging
  if (!is.null(h_merge)) {
    if (h_merge == 1) {
      cell_merging <- rtf_key("clmgf")
    } else if (h_merge == 2) {
      cell_merging <- rtf_key("clmrg")
    } else {
      cell_merging <- NULL
    }
  } else {
    cell_merging <- NULL
  }

  # Pass all text fragments and options though `rtf_font()`
  cell_text <-
    rtf_font(
      font = font,
      font_size = font_size,
      font_color = font_color,
      bold = bold,
      italic = italic,
      super_sub = super_sub,
      rtf_raw(x)
    ) %>%
    unlist() %>%
    unname() %>%
    tidy_gsub("\\\\super", "\\super", fixed = TRUE) %>%
    tidy_gsub("\\\\i", "\\i", fixed = TRUE)

  # Combine all cell settings
  cell_settings <-
    rtf_paste0(
      rtf_key("pard"),
      rtf_key("plain"),
      rtf_key("uc", 0),
      rtf_key("q", h_align),
      rtf_key("clvertal", v_align),
      rtf_raw(cell_padding),
      rtf_raw(cell_borders),
      rtf_raw(cell_background_color),
      rtf_raw(cell_merging)
    )

  # Combine all cell content
  cell_content <-
    rtf_paste0(
      rtf_key("intbl"),
      " ",
      cell_text,
      rtf_key("cell"), "\n",
      rtf_key("pard"),
      rtf_key("plain")
    )

  # Return a complete RTF table cell (marked as `rtf_text`)
  rtf_paste0(cell_settings, "\n", cell_content)
}

rtf_font <- function(...,
                     font = NULL,
                     font_size = NULL,
                     font_color = NULL,
                     bold = FALSE,
                     italic = FALSE,
                     super_sub = NULL) {

  # Obtain font-specific settings
  font_styles <-
    rtf_font_styling(
      font = font,
      font_size = font_size,
      font_color = font_color,
      bold = bold,
      italic = italic,
      super_sub = super_sub
    )

  rtf_paste0(rtf_raw("{"), rtf_raw(font_styles), " ", ..., rtf_raw("}"))
}

# Mark the given text as being RTF, meaning, it should not be escaped if passed
# to rtf_text
rtf_raw <- function(...) {
  text <- paste0(..., collapse = "")
  class(text) <- "rtf_text"
  text
}

# Transform a footnote mark to an RTF representation as a superscript
footnote_mark_to_rtf <- function(mark) {
  rtf_paste0(rtf_raw("{\\super \\i "), mark, rtf_raw("}"))
}

rtf_escape <- function(x) {

  if (length(x) < 1) return(x)

  x <- gsub("\\", "\\'5c", x, fixed = TRUE)
  x <- gsub("{", "\\'7b", x, fixed = TRUE)
  x <- gsub("}", "\\'7d", x, fixed = TRUE)
  x <- vapply(x, FUN.VALUE = character(1), FUN = rtf_escape_unicode, USE.NAMES = FALSE)
  class(x) <- "rtf_text"
  x
}

rtf_escape_unicode <- function(x) {

  # Ensure that we encode non-UTF-8 strings to UTF-8 in a
  # two-step process: (1) to UTF-8, (2) to RTF's weird signed
  # 16 bit integer encoding
  if (Encoding(x) != 'UTF-8') {
    x <- enc2utf8(x)
  }

  chars <- unlist(strsplit(x, ""))
  codepoints <- utf8ToInt(x)
  needs_escape <- codepoints > 127
  codepoints_subset <- codepoints[needs_escape]

  # RTF wants the code points as signed 16 bit integers
  codepoints_subset_signed <- ifelse(
    codepoints_subset > 2^15-1,
    -(bitops::bitFlip(codepoints_subset, 16) + 1), # twos complement
    codepoints_subset)

  chars[needs_escape] <- paste0("\\u", codepoints_subset_signed, " ")
  paste(chars, collapse = "")
}

rtf_font_styling <- function(font = NULL,
                             font_size = NULL,
                             font_color = NULL,
                             bold = FALSE,
                             italic = FALSE,
                             super_sub = NULL) {

  # Set font for text
  if (!is.null(font)) {
    cell_font <- rtf_key("f", rtf_paste0(rtf_raw("<<FONT:"), font, rtf_raw(">>")))
  } else {
    cell_font <- rtf_key("f", 0)
  }

  # Set font size for text (in half-points)
  if (!is.null(font_size)) {
    cell_font_size <- rtf_key("fs", font_size * 2)
  } else {
    cell_font_size <- ""
  }

  # Set font color
  if (!is.null(font_color)) {
    cell_font_color <- rtf_key("cf", rtf_paste0(rtf_raw("<<COLOR:"), font_color, rtf_raw(">>")))
  } else {
    cell_font_color <- ""
  }

  # Optionally set bold type
  if (bold) {
    cell_bold <- rtf_key("b")
  } else {
    cell_bold <- ""
  }

  # Optionally set italic type
  if (italic) {
    cell_italic <- rtf_key("i")
  } else {
    cell_italic <- ""
  }

  # Set font superscripting or subscripting
  if (!is.null(super_sub)) {
    if (super_sub == "super") {
      cell_super_sub <- rtf_key("super")
    } else if (super_sub == "sub") {
      cell_super_sub <- rtf_key("sub")
    } else {
      stop("The super_sub value must be either `\"super\"` or `\"sub\"`.")
    }
  } else {
    cell_super_sub <- ""
  }

  rtf_paste0(
    cell_font,
    cell_font_size,
    cell_font_color,
    cell_bold,
    cell_italic,
    cell_super_sub
  )
}

rtf_border <- function(direction,
                       style = "s",
                       width = 20,
                       color = 0) {

  if (direction == "all") {
    direction <- c("top", "bottom", "left", "right")
  }

  rtf_border <- list()

  for (dir in direction) {
    rtf_border <-
      append(
        rtf_border,
        list(
          list(
            direction = dir,
            style = style,
            width = width,
            color = color
          )
        )
      )
  }

  class(rtf_border) <- "rtf_border"
  rtf_border
}

as_rtf_string <- function(x) {

  rtf_paste0(
    rtf_raw("{"),
    rtf_raw(as.character(x$header)),
    "\n",
    rtf_raw(as.character(x$document)),
    rtf_raw("}")
  )
}

#
# Table Header
#
create_heading_component_rtf <- function(data) {

  if (!dt_heading_has_title(data = data) &&
      !dt_heading_has_subtitle(data = data)) {
    return(list())
  }

  # Get table components and metadata using the `data`
  heading <- dt_heading_get(data)
  footnotes_tbl <- dt_footnotes_get(data)

  # Get table width
  table_width <- dt_options_get_value(data = data, option = "table_width")
  col_widths <- table_width
  table_width <-
    col_width_resolver_rtf(
      table_width = table_width,
      col_widths = col_widths,
      n_cols = 1
    )

  # Get table options
  table_font_color <- dt_options_get_value(data, option = "table_font_color")
  table_border_top_include <- dt_options_get_value(data, option = "table_border_top_include")
  table_border_top_color <- dt_options_get_value(data, option = "table_border_top_color")


  if ("title" %in% footnotes_tbl$locname) {
    footnote_title_marks <- footnotes_tbl %>% coalesce_marks(locname = "title")
    footnote_title_marks <- footnote_title_marks$fs_id_c
  } else {
    footnote_title_marks <- ""
  }

  if ("subtitle" %in% footnotes_tbl$locname) {
    footnote_subtitle_marks <- footnotes_tbl %>% coalesce_marks(locname = "subtitle")
    footnote_subtitle_marks <- footnote_subtitle_marks$fs_id_c
  } else {
    footnote_subtitle_marks <- ""
  }

  if (dt_heading_has_subtitle(data = data)) {
    subtitle_component <-
      c(
        rtf_key("line"),
        rtf_font(
          font_size = 8,
          rtf_raw(heading$subtitle)
        ),
        rtf_font(
          italic = TRUE,
          super_sub = "super",
          font_size = 8,
          rtf_raw(footnote_subtitle_marks)
        )
      )
  } else {
    subtitle_component <- NULL
  }

  tbl_cell <-
    rtf_tbl_cell(
      c(
        rtf_font(
          font_size = 14,
          rtf_raw(heading$title)
        ),
        rtf_font(
          italic = TRUE,
          super_sub = "super",
          font_size = 14,
          rtf_raw(footnote_title_marks)
        ),
        subtitle_component
      ),
      h_align = "center",
      borders = if (table_border_top_include) list(rtf_border("top", color = table_border_top_color, width = 40)) else NULL,
      font_color = table_font_color
    )

  # Return a list of RTF table rows (in this case, a single row)
  list(
    rtf_tbl_row(
      tbl_cell,
      widths = table_width,
      height = 0,
      repeat_header = TRUE
    )
  )
}

#
# Table Column Labels
#
create_columns_component_rtf <- function(data) {

  # Get table components and metadata using the `data`
  boxh <- dt_boxhead_get(data)
  spanners_present <- dt_spanners_exists(data)
  column_labels_hidden <- dt_options_get_value(data, option = "column_labels_hidden")
  headings_labels <- dt_boxhead_get_vars_labels_default(data = data)
  stub_available <- dt_stub_df_exists(data)
  stubh_available <- dt_stubhead_has_label(data)

  footnotes_tbl <- dt_footnotes_get(data) # not used currently

  # Get table options
  column_labels_border_top_color <- dt_options_get_value(data = data, option = "column_labels_border_top_color")
  column_labels_border_bottom_color <- dt_options_get_value(data = data, option = "column_labels_border_bottom_color")
  column_labels_vlines_color <- dt_options_get_value(data = data, option = "column_labels_vlines_color")
  column_labels_border_lr_color <- dt_options_get_value(data = data, option = "column_labels_border_lr_color") # not used currently

  # Obtain alignments for each visible column label
  col_alignment <-
    boxh %>%
    dplyr::filter(type == "default") %>%
    dplyr::pull(column_align)

  # Obtain widths for each visible column label
  col_widths <-
    boxh %>%
    dplyr::filter(type %in% c("default", "stub")) %>%
    dplyr::arrange(dplyr::desc(type)) %>%
    dplyr::pull(column_width) %>%
    unlist()

  if (column_labels_hidden) {
    return(list())
  }

  if (stub_available) {
    headings_labels <- c("", headings_labels)
    col_alignment <- c("left", col_alignment)
  }

  if (stubh_available) {
    headings_labels[1] <-
      dt_stubhead_get(data = data) %>%
      .$label
  }

  if (spanners_present) {

    spanners <- dt_spanners_print(data = data, include_hidden = FALSE)
    spanner_ids <- dt_spanners_print(data = data, include_hidden = FALSE, ids = TRUE)

    spanners[is.na(spanners)] <- ""

    if (stub_available) {
      spanners <- c("", spanners)
      spanner_ids <- c("", spanner_ids)
    }
    spanners_lengths <- unclass(rle(spanner_ids))

    merge_keys <- c()
    for (i in seq_along(spanners_lengths$lengths)) {
      if (spanners_lengths$lengths[i] == 1) {
        merge_keys <- c(merge_keys, 0)
      } else {
        merge_keys <- c(merge_keys, 1, rep(2, spanners_lengths$lengths[i] - 1))
      }
    }

    spanners_list <-
      lapply(
        seq_along(spanner_ids),
        FUN = function(x) {
          rtf_tbl_cell(
            rtf_font(
              font_size = 10,
              rtf_raw(spanners[x])
            ),
            h_align = "center",
            h_merge = merge_keys[x],
            borders = list(
              rtf_border("top", color = column_labels_border_top_color, width = 40),
              rtf_border("bottom", color = column_labels_border_bottom_color),
              rtf_border("left", color = column_labels_vlines_color),
              rtf_border("right", color = column_labels_vlines_color)
            )
          )
        }
      )
  } else {
    spanners_list <- list()
  }

  table_width <- dt_options_get_value(data = data, option = "table_width")

  col_widths <-
    col_width_resolver_rtf(
      table_width = table_width,
      col_widths = col_widths,
      n_cols = length(headings_labels)
    )


  cell_list <-
    lapply(
      seq_along(headings_labels),
      FUN = function(x) {
        rtf_tbl_cell(
          rtf_font(
            font_size = 10,
            rtf_raw(headings_labels[x])
          ),
          h_align = col_alignment[x],
          borders = list(
            rtf_border("top", color = column_labels_border_top_color, width = 40),
            rtf_border("bottom", color = column_labels_border_bottom_color, width = 40),
            rtf_border("left", color = column_labels_vlines_color),
            rtf_border("right", color = column_labels_vlines_color)
          )
        )
      }
    )

  if (spanners_present) {

    row_list_column_labels <-
      list(
        rtf_tbl_row(
          spanners_list,
          widths = col_widths,
          height = 0,
          repeat_header = TRUE
        ),
        rtf_tbl_row(
          cell_list,
          widths = col_widths,
          height = 0,
          repeat_header = TRUE
        )
      )

  } else {

    row_list_column_labels <-
      list(
        rtf_tbl_row(
          cell_list,
          widths = col_widths,
          height = 0,
          repeat_header = TRUE
        )
      )
  }

  # Return a list of RTF table rows (either one or two rows)
  row_list_column_labels
}

#
# Table Body
#
create_body_component_rtf <- function(data) {

  # Get table components and metadata using the `data`
  body <- dt_body_get(data)
  boxh <- dt_boxhead_get(data)
  stubh <- dt_stubhead_get(data)
  opts_df <- dt_options_get(data)
  stub_available <- dt_stub_df_exists(data)
  stub_df <- dt_stub_df_get(data)
  groups_rows <- dt_groups_rows_get(data)
  summaries_present <- dt_summary_exists(data = data)
  list_of_summaries <- dt_summary_df_get(data = data)
  groups_rows_df <- dt_groups_rows_get(data = data)
  stub_components <- dt_stub_components(data = data)

  # Get the table width
  table_width <- dt_options_get_value(data = data, option = "table_width")

  # Get table options
  row_group_border_top_color <- dt_options_get_value(data = data, option = "row_group_border_top_color")
  row_group_border_bottom_color <- dt_options_get_value(data = data, option = "row_group_border_bottom_color")
  row_group_border_left_color <- dt_options_get_value(data = data, option = "row_group_border_left_color")
  row_group_border_right_color <- dt_options_get_value(data = data, option = "row_group_border_right_color")
  table_body_hlines_color <- dt_options_get_value(data = data, option = "table_body_hlines_color")
  table_body_vlines_color <- dt_options_get_value(data = data, option = "table_body_vlines_color")
  table_border_bottom_color <- dt_options_get_value(data, option = "table_border_bottom_color")

  headings_vars <- boxh %>% dplyr::filter(type == "default") %>% dplyr::pull(var)
  row_groups_present <- nrow(groups_rows) > 0
  row_group_rows <- groups_rows$row
  row_group_labels <- groups_rows$group_label
  row_group_labels[is.na(row_group_labels)] <- ""

  # Ensure that the columns are only the visible ones, and,
  # that they are in order
  body <- body %>% dplyr::select(dplyr::all_of(headings_vars))

  n_cols <- ncol(body)
  n_rows <- nrow(body)

  # Obtain alignments for each values in each visible column label
  col_alignment <-
    boxh %>%
    dplyr::filter(type == "default") %>%
    dplyr::pull(column_align)

  if (stub_available) {

    stub_var <- dt_boxhead_get_var_stub(data = data)

    body <-
      dplyr::bind_cols(
        dt_body_get(data) %>% dplyr::select(dplyr::one_of(stub_var)),
        body
      )

    col_alignment <- c("left", col_alignment)
    n_cols <- n_cols + 1
  }

  # Obtain widths for each visible column label
  col_widths <-
    boxh %>%
    dplyr::filter(type %in% c("default", "stub")) %>%
    dplyr::arrange(dplyr::desc(type)) %>%
    dplyr::pull(column_width) %>%
    unlist()

  col_widths <-
    col_width_resolver_rtf(
      table_width = table_width,
      col_widths = col_widths,
      n_cols = length(col_alignment)
    )

  row_list_body <- list()

  for (i in seq_len(n_rows)) {

    # Add group rows where necessary
    if (row_groups_present && i %in% row_group_rows) {

      row_list_body <-
        c(
          row_list_body,
          rtf_tbl_row(
            list(
              rtf_tbl_cell(
                row_group_labels[which(row_group_rows == i)],
                font_size = 10,
                h_align = "left",
                borders = list(
                  rtf_border("top", color = row_group_border_top_color, width = 40),
                  rtf_border("bottom", color = row_group_border_bottom_color, width = 40),
                  rtf_border("left", color = row_group_border_left_color),
                  rtf_border("right", color = row_group_border_right_color)
                )
              )
            ),
            widths = sum(col_widths),
            height = 0
          )
        )
    }

    cell_list <-
      lapply(
        seq_len(n_cols), FUN = function(x) {

          rtf_tbl_cell(
            rtf_font(
              font_size = 10,
              rtf_raw(body[[i, x]])
            ),
            h_align = col_alignment[x],
            borders = list(
              rtf_border("bottom", color = table_body_hlines_color, width = 10),
              rtf_border("left", color = table_body_vlines_color, width = 10),
              rtf_border("right", color = table_body_vlines_color, width = 10)
            )
          )
        }
      )

    if (i == 1 && row_groups_present && !(i %in% row_group_rows)) {

      body_row <-
        rtf_tbl_row(
          cell_list,
          borders = list(
            rtf_border(direction = "top", color = table_body_hlines_color)
          ),
          widths = col_widths,
          height = 0
        )
    } else {

      body_row <-
        rtf_tbl_row(
          cell_list,
          widths = col_widths,
          height = 0
        )
    }

    row_list_body <- c(row_list_body, body_row)

    #
    # Add groupwise summary rows
    #

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
          as.data.frame(stringsAsFactors = FALSE) %>%
          dplyr::select(-matches("^group[s]?$"))

        for (j in seq_len(nrow(summary_df))) {

          cell_list <-
            lapply(
              seq_len(n_cols), FUN = function(x) {

                rtf_tbl_cell(
                  rtf_font(
                    font_size = 10,
                    rtf_raw(summary_df[[j, x]])
                  ),
                  h_align = col_alignment[x],
                  borders = list(
                    rtf_border(
                      "top",
                      style = ifelse(j == 1, "db", "s"),
                      color = table_body_hlines_color,
                      width = ifelse(j == 1, 20, 10)
                    ),
                    rtf_border("bottom", color = table_body_hlines_color, width = 10),
                    rtf_border("left", color = table_body_vlines_color, width = 10),
                    rtf_border("right", color = table_body_vlines_color, width = 10)
                  )
                )
              }
            )

          row_list_body <-
            c(
              row_list_body,
              rtf_tbl_row(
                cell_list,
                widths = col_widths,
                height = 0
              )
            )
        }
      }
    }
  }

  #
  # Add grand summary rows
  #

  if (summaries_present &&
      grand_summary_col %in% names(list_of_summaries$summary_df_display_list)) {

    summary_df <-
      list_of_summaries$summary_df_display_list[["::GRAND_SUMMARY"]] %>%
      as.data.frame(stringsAsFactors = FALSE) %>%
      dplyr::select(-matches("^group[s]?$"))

    for (j in seq_len(nrow(summary_df))) {

      cell_list <-
        lapply(
          seq_len(n_cols), FUN = function(x) {

            rtf_tbl_cell(
              rtf_font(
                font_size = 10,
                rtf_raw(summary_df[[j, x]])
              ),
              h_align = col_alignment[x],
              borders = list(
                rtf_border(
                  "bottom",
                  color = table_body_hlines_color,
                  width = ifelse(j == nrow(summary_df), 50, 10)
                  ),
                rtf_border("left", color = table_body_vlines_color, width = 10),
                rtf_border("right", color = table_body_vlines_color, width = 10)
              )
            )
          }
        )

      row_list_body <-
        c(
          row_list_body,
          rtf_tbl_row(
            cell_list,
            widths = col_widths,
            height = 0,
            borders = list(
              rtf_border(
                "top",
                style = ifelse(j == 1, "db", "s"),
                color = table_body_hlines_color,
                width = ifelse(j == 1, 50, 10)
              )
            ),
          )
        )
    }
  }

  # Return a list of RTF table rows for the body part
  row_list_body
}

#
# Table Footnotes
#
create_footnotes_component_rtf <- function(data) {

  # Get table components and metadata using the `data`
  footnotes_tbl <- dt_footnotes_get(data)

  # If the `footnotes_tbl` object has no
  # rows, then return an empty footnotes component
  if (nrow(footnotes_tbl) == 0) {
    row_list_footnotes <- list()
    return(row_list_footnotes)
  }

  # Get table width
  table_width <- dt_options_get_value(data = data, option = "table_width")
  col_widths <- table_width
  table_width <-
    col_width_resolver_rtf(
      table_width = table_width,
      col_widths = col_widths,
      n_cols = 1
    )

  footnotes_tbl <-
    footnotes_tbl %>%
    dplyr::select(fs_id, footnotes) %>%
    dplyr::distinct()

  n_footnotes <- nrow(footnotes_tbl)

  footnote_text <- footnotes_tbl$footnotes
  footnote_mark <- footnotes_tbl[["fs_id"]]

  footnote_text <-
    vapply(
      footnote_text, FUN.VALUE = character(1), USE.NAMES = FALSE,
      FUN = markdown_to_rtf
    )

  cell_list <- ""

  for (i in seq_len(n_footnotes)) {

    use_newline <- i != n_footnotes

    cell_list <-
      rtf_paste0(
        cell_list,
        rtf_font(
          italic = TRUE,
          super_sub = "super",
          font_size = 10,
          rtf_raw(footnote_mark[i])
        ),
        rtf_font(
          font_size = 10,
          rtf_raw(footnote_text[i], " ")
        )
      )
  }

  # Return a list of RTF table rows (a single row) for the footnotes section
  rtf_tbl_row(
    list(rtf_tbl_cell(cell_list)),
    widths = table_width,
    height = 0
  )
}

#
# Table Source Notes
#
create_source_notes_component_rtf <- function(data) {

  # Get table components and metadata using the `data`
  source_notes <- dt_source_notes_get(data)

  # If there are no source notes then return an empty list
  if (length(source_notes) == 0) {
    row_list_source_notes <- list()
    return(row_list_source_notes)
  }

  # Get table width
  table_width <- dt_options_get_value(data = data, option = "table_width")
  col_widths <- table_width
  table_width <-
    col_width_resolver_rtf(
      table_width = table_width,
      col_widths = col_widths,
      n_cols = 1
    )

  n_source_notes <- length(source_notes)
  row_list_source_notes <- list()

  cell_list <- ""

  for (i in seq_len(n_source_notes)) {

    cell_list <-
      rtf_paste0(
        cell_list,
        rtf_font(
          font_size = 10,
          rtf_raw(source_notes[i])
        )
      )
  }

  # Return a list of RTF table rows (a single row) for the source notes section
  rtf_tbl_row(
    list(rtf_tbl_cell(cell_list)),
    widths = table_width,
    height = 0
  )
}
