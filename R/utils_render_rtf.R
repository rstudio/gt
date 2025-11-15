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
#  Copyright (c) 2018-2025 gt authors
#
#  For full copyright and license information, please look at
#  https://gt.rstudio.com/LICENSE.html
#
#------------------------------------------------------------------------------#


rtf_paste0 <- function(..., collapse = NULL) {

  args <-
    lapply(list(...), function(x) {
      if (is.null(x) || is_rtf(x)) {
        x
      } else {
        escape_rtf(as.character(x))
      }
    })

  args$collapse <- collapse

  rtf_raw(do.call(paste0, args))
}

# Conversion factors from absolute width units to twips (`tw`)
twip_factors <-
  c(
    `in` = 1440, `pt` = 20, `px` = 15,
    `cm` = 566.9291, `mm` = 56.69291, `tw` = 1
  )

twip_factors_df <- data.frame(
  unit = names(twip_factors),
  conv = unname(twip_factors)
)

rtf_key <- function(word, val = NULL, space = FALSE) {
  rtf_raw(paste0("\\", word, val %||% "", if (space) " "))
}

rtf_fonttbl <- function(
    ...,
    .font_names = NULL,
    .default_n = NULL
) {

  fonts <- list(...)

  if (!is.null(.font_names)) {
    fonts <- lapply(.font_names, FUN = function(x) rtf_font_def(x))
  }

  if (length(fonts) < 1) {
    fonts <-
      list(
        rtf_font_def(font = "Courier New", family = "roman"),
        rtf_font_def(font = "Times", family = "roman")
      )
  }

  # TODO: Validate that all provided objects are "rtf_font"
  default_n <- if (!is.null(.default_n)) rtf_key("deff", .default_n - 1) else ""

  font_sequence <- seq_len(length(fonts)) - 1

  fontinfo_values <-
    vapply(
      seq_along(fonts),
      FUN.VALUE = character(1L),
      USE.NAMES = FALSE,
      FUN = function(x) {
        gsub("{x}", font_sequence[x], unlist(fonts[x]), fixed = TRUE)
      }
    )

  fonttbl_values <- rtf_key("fonttbl", paste(fontinfo_values, collapse = ""))

  rtf_fonttbl <- list(paste0(default_n, paste0("{", fonttbl_values, "}")))

  class(rtf_fonttbl) <- "rtf_fonttbl"

  rtf_fonttbl
}

rtf_font_def <- function(
    font,
    family = NULL,
    number = NULL,
    charset = NULL,
    pitch = NULL
) {

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

rtf_colortbl <- function(
    ...,
    .hexadecimal_colors = NULL,
    .add_default = TRUE
) {

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

rtf_header <- function(
    ...,
    .charset = "ansi",
    .ansi_code_page = 1252
) {

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
  object_types <- vapply(dots_list, class, FUN.VALUE = character(1L), USE.NAMES = FALSE)

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

# Generate an RTF file based on content in an RTF 'document'
rtf_file <- function(
    data,
    document
) {

  #
  # Generate the header based on the RTF `document` content
  # (and also modify the document)
  #

  # Scan for any font declarations within the document (they use
  # a specialized notation with angle brackets)
  matched_fonts <-
    unique(
      unlist(
        str_complete_extract(document, "<<FONT:.*?>>")
      )
    )

  # Generate a <fonttbl> object, which is required for every RTF file
  if (length(matched_fonts) > 0) {

    fonttbl <-
      rtf_fonttbl(
        .font_names = c("Times", gsub("<<FONT:|>>", "", matched_fonts)),
        .default_n = 1
      )

    for (i in seq_along(matched_fonts)) {
      document <- gsub(matched_fonts[i], as.character(i), document, fixed = TRUE)
    }

  } else {
    fonttbl <- rtf_fonttbl()
  }

  # Scan for any hexadecimal colors within the document (they use
  # a specialized notation with angle brackets)
  matched_colors <-
    unique(
      unlist(
        str_complete_extract(document, "<<COLOR:#[0-9a-fA-F]{6}>>")
      )
    )

  # Generate a <colortbl> object
  if (length(matched_colors) > 0) {

    colortbl <-
      rtf_colortbl(.hexadecimal_colors = gsub("<<COLOR:|>>", "", matched_colors))

    for (i in seq_along(matched_colors)) {
      document <- gsub(matched_colors[i], as.character(i), document, fixed = TRUE)
    }
  } else {
    colortbl <- rtf_colortbl(.hexadecimal_colors = "#FFFFFF")
  }

  # Create the RTF document header (an 'rtf_header' object)
  header <- rtf_header(fonttbl, colortbl)

  #
  # Create the `page_information` statements
  #

  page_orientation <- dt_options_get_value(data = data, option = "page_orientation")

  page_width_val <-
    dt_options_get_page_value_in_twips(
      data = data,
      option = if (page_orientation == "portrait") "page_width" else "page_height"
    )

  page_height_val <-
    dt_options_get_page_value_in_twips(
      data = data,
      option = if (page_orientation == "portrait") "page_height" else "page_width"
    )

  page_margin_left_val <- dt_options_get_page_value_in_twips(data = data, option = "page_margin_left")
  page_margin_right_val <- dt_options_get_page_value_in_twips(data = data, option = "page_margin_right")
  page_margin_top_val <- dt_options_get_page_value_in_twips(data = data, option = "page_margin_top")
  page_margin_bottom_val <- dt_options_get_page_value_in_twips(data = data, option = "page_margin_bottom")
  page_header_height_val <- dt_options_get_page_value_in_twips(data = data, option = "page_header_height")
  page_footer_height_val <- dt_options_get_page_value_in_twips(data = data, option = "page_footer_height")

  page_information <-
    rtf_raw(
      paste0("\\paperw", page_width_val),
      paste0("\\paperh", page_height_val),
      "\\widowctrl\\ftnbj\\fet0\\sectd\\linex0\n",
      "\\lndscpsxn\n",
      paste0("\\margl", page_margin_left_val),
      paste0("\\margr", page_margin_right_val),
      paste0("\\margt", page_margin_top_val),
      paste0("\\margb", page_margin_bottom_val),
      "\n",
      paste0("\\headery", page_header_height_val),
      paste0("\\footery", page_footer_height_val),
      "\\fs20\n"
    )

  rtf_file <-
    list(
      header = header,
      page_information = page_information,
      document = document
    )

  class(rtf_file) <- c("rtf_file", "rtf")
  rtf_file
}

rtf_table <- function(rows) {
  rtf_raw(paste(unlist(rows), collapse = ""))
}



# Input: character vector of any length. Valid values are numbers with
# suffix of in, pt, px, cm, mm, tw; you can also include `""`.
# Output: data frame with columns `value` and `unit`, with NA for both
# if input element was `""`. Values that cannot be parsed will throw errors.
parse_length_str <- function(
    lengths_vec,
    allow_negative = FALSE
) {

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
  }, character(1L))

  # Check for negative values and stop of `allow_negative = FALSE`
  non_na_vals <- vals[!is.na(vals)]

  if (
    !allow_negative &&
    length(non_na_vals) > 0 &&
    !all(is.na(non_na_vals)) &&
    is.numeric(non_na_vals) &&
    any(non_na_vals < 0)
  ) {
    cli::cli_abort("Negative values supplied to widths cannot be used.")
  }

  # Check for bad values and stop if necessary
  bad_values <- nzchar(lengths_vec) & is.na(vals)
  if (any(bad_values)) {

    bad_values <- lengths_vec[nzchar(lengths_vec) & is.na(vals)]

    cli::cli_abort(c(
      "Some of the values supplied cannot be interpreted.",
      "*" = "Problem values are: {.str {bad_values}}",
      "*" = "Use either of: `px`, `pt`, `in`, `cm`, `mm`, or `tw`
      (e.g., \"12px\")"
    ))
  }

  dplyr::tibble(value = vals, unit = units)
}

abs_len_to_twips <- function(lengths_df) {

  res <- dplyr::left_join(
      lengths_df,
      twip_factors_df,
      by = c("unit" = "unit")
    )
  res$value[!is.na(res$conv)] <- res$value[!is.na(res$conv)] * res$conv[!is.na(res$conv)]
  res$unit[!is.na(res$conv)] <- "tw"

  dplyr::select(res, "value", "unit")
}

# The `col_width_resolver_rtf()` function returns a vector of
# RTF column widths in units of twips (numeric)
#
# `table_width` and `col_widths` should be character vectors with
# a numeric portion followed by the unit; the first should be a
# length-1 vector and the latter should be a vector with as many
# elements as there are visible columns in the gt table
col_width_resolver_rtf <- function(
    page_body_width,
    table_width,
    col_widths = NULL,
    n_cols = length(col_widths)
) {

  stopifnot(length(table_width) == 1)

  if (table_width == "auto") {
    table_width <- paste0(page_body_width, "tw")
  }

  if (is.null(col_widths)) {
    col_widths <- rep_len("", n_cols)
  }

  table_width <- abs_len_to_twips(parse_length_str(table_width))

  # For a table width set as a percentage, convert it to twips
  # using the assumed width of a table set in a page
  if (table_width$unit == "%") {

    table_width$value <- (table_width$value / 100) * page_body_width
    table_width$unit <- "tw"
  }

  # Ensure that the `table_width` unit is `"tw"`
  stopifnot(isTRUE(table_width$unit == "tw"))

  col_widths <- abs_len_to_twips(parse_length_str(col_widths))

  is_udf <- is.na(col_widths$value) & is.na(col_widths$unit)
  is_abs <- !is_udf & col_widths$unit == "tw"
  is_pct <- !is_udf & col_widths$unit == "%"

  stopifnot(all(is_abs | is_pct | is_udf))

  twips_used <- sum(col_widths$value[is_abs])
  twips_remaining <- max(0, table_width$value - twips_used)
  # 1 - [fraction used by absolute lengths]
  fraction_remaining <- max(0, twips_remaining / table_width$value)

  # fraction_remaining -= [fraction used by explicit percentages]
  fraction_remaining <- max(0, fraction_remaining - (sum(col_widths$value[is_pct]) / 100))

  # Distribute fraction_remaining among undefined-width cols
  col_widths$value[is_udf] <- (fraction_remaining / sum(is_udf) * 100)
  col_widths$unit[is_udf] <- "%"
  is_pct <- is_pct | is_udf
  is_udf <- is_udf & FALSE

  pct_used <- sum(col_widths$value[is_pct])
  # Avoid divide-by-zero
  if (pct_used != 0) {
    # Normalize pct to add up to 100
    col_widths$value[which(is_pct)] <- col_widths$value[which(is_pct)] * (100 / pct_used)
  }

  # Convert % to tw
  col_widths$value[which(is_pct)] <- twips_remaining * col_widths$value[which(is_pct)] / 100
  col_widths$unit[which(is_pct)] <- "tw"
  is_abs <- is_abs | TRUE
  is_pct <- is_pct & FALSE

  round(col_widths[["value"]])
}

rtf_tbl_row <- function(
    x,
    page_body_width,
    widths = NULL,
    height = NULL,
    borders = NULL,
    repeat_header = FALSE
) {

  if (is.list(x)) x <- unlist(x)

  cell_count <- length(x)

  if (is.null(widths)) {
    widths_twips <- cumsum(rep(page_body_width / cell_count, cell_count))
  } else {
    widths_twips <- cumsum(widths)
  }

  height <- height %||% 425

  # Set border values
  if (!is.null(borders)) {

    if (inherits(borders, "list")) {
      borders <- unlist(borders, recursive = FALSE)
    }

    tb_borders <-
      unlist(
        lapply(
          borders,
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
        )
      )

    lr_borders <-
      unlist(
        lapply(
          borders,
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
        )
      )

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
  row_components <- paste(tb_borders, paste0("\\cellx", floor(widths_twips)))

  for (i in seq_along(row_components)) {
    x[[i]][1] <- rtf_paste0(rtf_raw(x[[i]][1]), rtf_raw(row_components[i]))
  }

  x <- unlist(lapply(x, FUN = function(x) paste(x, collapse = "\n")))

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

rtf_tbl_cell <- function(
    x,
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
    super_sub = NULL
) {

  x <- paste(x, collapse = " ")

  h_align <- substr(rlang::arg_match(h_align), 1, 1)
  v_align <- substr(rlang::arg_match(v_align), 1, 1)

  # Set default padding values if `padding = NULL`
  padding <- padding %||% c(25, 85, 25, 85)

  # Set padding in units of twips, in the order left, top, bottom, right
  padding_units <-
    c(
      rtf_key("clpadfl", 3), rtf_key("clpadft", 3),
      rtf_key("clpadfb", 3), rtf_key("clpadfr", 3)
    )
  padding_values <-
    c(
      rtf_key("clpadl", padding[1]), rtf_key("clpadt", padding[2]),
      rtf_key("clpadb", padding[3]), rtf_key("clpadr", padding[4])
    )

  cell_padding <- paste(paste0(padding_units, padding_values), collapse = " ")

  # Set border values
  if (!is.null(borders)) {

    if (inherits(borders, "list")) {
      borders <- unlist(borders, recursive = FALSE)
    }

    cell_borders <-
      paste(
        vapply(
          borders,
          FUN.VALUE = character(1L),
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
        ),
        collapse = ""
      )
  } else {
    cell_borders <- ""
  }

  # Set background color
  if (!is.null(cell_background_color)) {
    cell_background_color <-
      rtf_key("clcbpat", paste0("<<COLOR:", cell_background_color, ">>"))
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
    )

  # Combine all cell settings
  cell_settings <-
    rtf_paste0(
      rtf_key("pard"),
      rtf_key("plain"),
      rtf_key("uc", 0),
      rtf_key("q", h_align),
      rtf_key("clvertal", v_align), " ",
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
      rtf_key("cell")
    )

  # Return a complete RTF table cell (marked as `rtf_text`)
  rtf_paste0(cell_settings, "\n", cell_content)
}

rtf_font <- function(
    ...,
    font = NULL,
    font_size = NULL,
    font_color = NULL,
    bold = FALSE,
    italic = FALSE,
    super_sub = NULL
) {

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
footnote_mark_to_rtf <- function(
    data,
    mark,
    location = c("ref", "ftr")
) {

  location <- match.arg(location)

  if (length(mark) == 1 && is.na(mark)) {
    return("")
  }

  spec <- get_footnote_spec_by_location(data = data, location = location)
  spec <- spec %||% "^i"

  if (grepl("\\(|\\[", spec)) mark <- paste0("(", mark)
  if (grepl("\\)|\\]", spec)) mark <- paste0(mark, ")")

  rtf_paste0(
    rtf_raw(
      paste0(
      "{",
      if (grepl("^", spec, fixed = TRUE)) "\\super " else NULL,
      if (grepl("i", spec, fixed = TRUE)) "\\i " else NULL,
      if (grepl("b", spec, fixed = TRUE)) "\\b " else NULL
      )
    ),
    mark,
    rtf_raw("}")
  )
}

escape_rtf <- function(text) {

  if (length(text) < 1) return(text)

  # If all text elements are `NA_character_` then return `text` unchanged
  if (all(is.na(text))) {
    return(text)
  }

  # Determine the elements of `text` that are `NA_character_`
  na_text <- is.na(text)

  x <- text[!na_text]

  x <- gsub("\\", "\\'5c", x, fixed = TRUE)
  x <- gsub("{", "\\'7b", x, fixed = TRUE)
  x <- gsub("}", "\\'7d", x, fixed = TRUE)

  x <- vapply(x, FUN.VALUE = character(1L), FUN = escape_rtf_unicode, USE.NAMES = FALSE)

  text[!na_text] <- x

  class(text) <- "rtf_text"
  text
}

escape_rtf_unicode <- function(x) {

  # Ensure that we encode non-UTF-8 strings to UTF-8 in a
  # two-step process: (1) to UTF-8, (2) to RTF's weird signed
  # 16 bit integer encoding
  if (Encoding(x) != 'UTF-8') {
    x <- enc2utf8(x)
  }

  chars <- unlist(strsplit(x, "", fixed = TRUE))
  codepoints <- utf8ToInt(x)
  needs_escape <- codepoints > 127
  codepoints_subset <- codepoints[needs_escape]

  # RTF wants the code points as signed 16 bit integers
  codepoints_subset_signed <- ifelse(
    codepoints_subset > 2^15 - 1,
    -(bitops::bitFlip(codepoints_subset, 16) + 1), # twos complement
    codepoints_subset)

  chars[needs_escape] <- paste0("\\u", codepoints_subset_signed, " ")
  paste(chars, collapse = "")
}

rtf_font_styling <- function(
    font = NULL,
    font_size = NULL,
    font_color = NULL,
    bold = FALSE,
    italic = FALSE,
    super_sub = NULL
) {

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
      cli::cli_abort(
        "The `super_sub` value must be either \"super\" or \"sub\"."
      )
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

rtf_border <- function(
    direction,
    style = "s",
    width = 20,
    color = 0
) {

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

as_rtf_string <- function(
    x,
    incl_open = TRUE,
    incl_header = TRUE,
    incl_page_info = TRUE,
    incl_body = TRUE,
    incl_close = TRUE
) {

  rtf_paste0(
    if (incl_open) rtf_raw("{") else NULL,
    if (incl_header) rtf_raw(as.character(x$header)) else NULL,
    "\n",
    if (incl_page_info) rtf_raw(as.character(x$page_information)) else NULL,
    "\n",
    if (incl_body) rtf_raw(as.character(x$document)) else NULL,
    if (incl_close) rtf_raw("}") else NULL
  )
}

rtf_header_page_numbering <-
  paste0(
    "{\\f0\\fs20\\i Page }{\\f0\\fs20\\i \\field\\flddirty{\\*\\fldinst{  PAGE   ",
    "\\\\* MERGEFORMAT }}}{\\f0\\fs20\\i  of }{\\f0\\fs20\\i \\field{\\*\\fldinst{ NUMPAGES}}}\n"
  )

#
# Table Header
#

create_heading_component_rtf <- function(data) {

  if (
    !dt_heading_has_title(data = data) &&
    !dt_heading_has_subtitle(data = data) &&
    !dt_heading_has_preheader(data = data)
  ) {
    return(list())
  }

  # Get table components and metadata using the `data`
  boxh <- dt_boxhead_get(data)
  heading <- dt_heading_get(data)
  footnotes_tbl <- dt_footnotes_get(data)

  # Get the table width and the page body width
  table_width <- dt_options_get_value(data = data, option = "table_width")
  page_body_width <- get_page_body_width(data = data)

  # Obtain widths for each visible column label
  col_widths <-
    vctrs::vec_slice(boxh, boxh$type %in% c("default", "stub"))
  # arrange by descending type and grab the "column_width" column.
  col_widths <- col_widths[order(col_widths$type, decreasing = TRUE), "column_width", drop = TRUE]
  col_widths <- unlist(col_widths)

  if (is.null(col_widths)) {
     n_cols <- sum(boxh$type %in% c("default", "stub"))
     col_widths <- rep("100%", n_cols)
  }

  col_widths <-
    col_width_resolver_rtf(
      page_body_width = page_body_width,
      table_width = table_width,
      col_widths = col_widths,
      n_cols = length(col_widths)
    )

  table_width <- sum(col_widths)

  # Get table options
  table_font_color <- dt_options_get_value(data, option = "table_font_color")
  #table_border_top_include <- dt_options_get_value(data, option = "table_border_top_include")
  table_border_top_include <- FALSE
  table_border_top_color <- dt_options_get_value(data, option = "table_border_top_color")

  if ("title" %in% footnotes_tbl$locname) {
    footnote_title_marks <- coalesce_marks(fn_tbl = footnotes_tbl, locname = "title")
  } else {
    footnote_title_marks <- ""
  }

  if ("subtitle" %in% footnotes_tbl$locname) {
    footnote_subtitle_marks <- coalesce_marks(fn_tbl = footnotes_tbl, locname = "subtitle")
  } else {
    footnote_subtitle_marks <- ""
  }

  if (dt_heading_has_subtitle(data = data)) {

    subtitle_component <-
      c(
        rtf_key("line"),
        rtf_font(
          font_size = 10,
          rtf_raw(heading$subtitle)
        ),
        rtf_font(
          italic = TRUE,
          super_sub = "super",
          font_size = 10,
          rtf_raw(footnote_subtitle_marks)
        )
      )

  } else {
    subtitle_component <- NULL
  }

  # Generate the RTF lines that will generate content in the table preheader
  if (
    dt_heading_has_preheader(data = data) &&
    !dt_options_get_value(data, option = "page_numbering")
  ) {

    # Case where one or more preheader lines are present

    preheader_component <-
      rtf_raw(
        "\n",
        paste0("{\\f0\\fs20 ", heading$preheader, "}\\par\n"),
        "\n"
      )

  } else if (
    !dt_heading_has_preheader(data = data) &&
    dt_options_get_value(data, option = "page_numbering")
  ) {

    # Case where page numbering is present (but no preheader lines)

    preheader_component <-
      rtf_raw(
        "\n",
        "\\ql\\tx7245\\tqr\\tx12360\n",
        "\\pmartabqr ",
        rtf_header_page_numbering,
        "\\par\\ql\n"
      )

  } else if (
    dt_heading_has_preheader(data = data) &&
    dt_options_get_value(data, option = "page_numbering")
  ) {

    # Case where one or more preheader lines and page numbering are present

    preheader_length <- length(heading$preheader)

    preheader_component <-
      rtf_raw(
        "\n",
        "\\ql\\tx7245\\tqr\\tx12360\n",
        paste0("{\\f0\\fs20 ", heading$preheader[1], "}\\pmartabqr "),
        rtf_header_page_numbering,
        "\\par\\ql\n",
        if (preheader_length > 1) paste0("{\\f0\\fs20 ", heading$preheader[2:preheader_length], "}\\par\n") else "",
        "\n"
      )

  } else {
    preheader_component <- NULL
  }

  tbl_cell <-
    rtf_tbl_cell(
      c(
        rtf_font(
          font_size = 10,
          rtf_raw(heading$title)
        ),
        rtf_font(
          italic = TRUE,
          super_sub = "super",
          font_size = 10,
          rtf_raw(footnote_title_marks)
        ),
        subtitle_component
      ),
      h_align = "center",
      borders =
        if (table_border_top_include) {
          list(rtf_border("top", color = table_border_top_color, width = 40))
        } else {
          NULL
        },
      font_color = table_font_color
    )

  # Return a list of RTF table rows (in this case, a single row)
  list(
    rtf_paste0(
      preheader_component,
      rtf_tbl_row(
        tbl_cell,
        page_body_width = page_body_width,
        widths = table_width,
        height = 0,
        repeat_header = TRUE
      )
    )
  )
}

#
# Table Column Labels
#
create_columns_component_rtf <- function(data) {

  # Should the column labels be hidden?
  column_labels_hidden <- dt_options_get_value(data, option = "column_labels_hidden")

  if (column_labels_hidden) {
    return(list())
  }

  # Get the page body width
  page_body_width <- get_page_body_width(data = data)

  stubh <- dt_stubhead_get(data = data)

  boxh <- dt_boxhead_get(data = data)
  # Get vector representation of stub layout
  stub_layout <- get_stub_layout(data = data)


  # Determine the finalized number of spanner rows
  spanner_row_count <-
    dt_spanners_matrix_height(
      data = data,
      omit_columns_row = TRUE
    )

  # Get options related to column label border colors
  column_labels_border_top_color <- dt_options_get_value(data = data, option = "column_labels_border_top_color")
  column_labels_border_bottom_color <- dt_options_get_value(data = data, option = "column_labels_border_bottom_color")
  column_labels_vlines_color <- dt_options_get_value(data = data, option = "column_labels_vlines_color")
  column_labels_border_lr_color <- dt_options_get_value(data = data, option = "column_labels_border_lr_color") # not used currently

  # Obtain alignments for each visible column label
  col_alignment <- dt_boxhead_get_vars_align_default(data = data)

  # Obtain widths for each visible column label in units of twips
  col_widths <- vctrs::vec_slice(
    boxh,
    boxh$type %in% c("default", "stub")
  )
  # Sort the data frame by desc(type) and get the "column_width" column.
  col_widths <- col_widths[order(col_widths$type, decreasing = TRUE), "column_width", drop = TRUE]
  col_widths <- unlist(col_widths)

  col_widths <-
    col_width_resolver_rtf(
      page_body_width = page_body_width,
      table_width = dt_options_get_value(data = data, option = "table_width"),
      col_widths = col_widths,
      n_cols = get_effective_number_of_columns(data = data)
    )

  # Get the column headings
  headings_labels <- dt_boxhead_get_vars_labels_default(data = data)

  if (length(stub_layout) > 0) {

    # Check if we have multiple stubhead labels for multi-column stub
    stub_vars <- dt_boxhead_get_var_stub(data = data)
    has_multi_column_stub <- length(stub_vars) > 1 && !any(is.na(stub_vars))
    has_multiple_labels <- has_multi_column_stub && length(stubh$label) > 1
    
    if (has_multiple_labels) {
      # Add individual headers for each stub column
      headings_labels <- prepend_vec(headings_labels, stubh$label)
    } else {
      # Single label (original behavior)
      headings_labels <-
        prepend_vec(
          headings_labels,
          c(
            if (length(stubh$label) > 0) stubh$label else "",
            rep("", length(stub_layout) - 1)
          )
        )
    }
  }

  # Get the column alignments
  col_alignment <-
    c(
      dt_boxhead_get_alignments_in_stub(data = data),
      dt_boxhead_get_vars_align_default(data = data)
    )

  merge_keys_cells <- rep(0, get_effective_number_of_columns(data = data))

  # Handle merging for stub columns
  if (length(stub_layout) > 0) {
    stub_vars <- dt_boxhead_get_var_stub(data = data)
    has_multi_column_stub <- length(stub_vars) > 1 && !any(is.na(stub_vars))
    has_multiple_labels <- has_multi_column_stub && length(stubh$label) > 1
    
    # Only merge if we have a single label spanning multiple columns
    if (!has_multiple_labels && length(stub_layout) > 1) {
      # Create merge keys for the stub columns
      stub_merge_keys <- c(1, rep(2:(length(stub_layout)), each = 1))
      merge_keys_cells <- c(stub_merge_keys, rep(0, get_effective_number_of_columns(data = data) - length(stub_layout)))
    }
  }

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
          h_merge = merge_keys_cells[x],
          borders = list(
            rtf_border("bottom", color = column_labels_border_bottom_color, width = 20)#,
            # rtf_border("top", color = column_labels_border_top_color, width = 40),
            # rtf_border("left", color = column_labels_vlines_color),
            # rtf_border("right", color = column_labels_vlines_color)
          )
        )
      }
    )

  if (spanner_row_count > 0) {

    spanner_rows <- list()

    spanners <-
      dt_spanners_print_matrix(
        data = data,
        include_hidden = FALSE,
        omit_columns_row = TRUE
      )

    spanner_ids <-
      dt_spanners_print_matrix(
        data = data,
        include_hidden = FALSE,
        ids = TRUE,
        omit_columns_row = TRUE
      )

    higher_spanner_rows_idx <- seq_len(nrow(spanner_ids))

    for (i in higher_spanner_rows_idx) {

      spanner_ids_row <- spanner_ids[i, ]
      spanners_row <- spanners[i, ]

      # Replace NA values with an empty string ID
      spanner_ids_row[is.na(spanner_ids_row)] <- ""
      spanners_row[is.na(spanners_row)] <- ""

      spanners_rle <- rle(unname(spanner_ids[i, ]))

      spanners_lengths <- unclass(spanners_rle)

      merge_keys_spanners <- c()
      for (j in seq_along(spanners_lengths$lengths)) {
        if (spanners_lengths$lengths[j] == 1) {
          merge_keys_spanners <- c(merge_keys_spanners, 0)
        } else {
          merge_keys_spanners <- c(merge_keys_spanners, 1, rep(2, spanners_lengths$lengths[j] - 1))
        }
      }

      # The `sig_cells` vector contains the indices of spanners' elements
      # where the value is either NA, or, is different than the previous value;
      # because NAs are distinct, every NA element will be present in `sig_cells`
      sig_cells <- c(1, utils::head(cumsum(spanners_rle$lengths) + 1, -1))

      # Replace repeating labels with an empty string, based on the
      # vector `sig_cells`
      for (k in seq_along(spanner_ids_row)) {
        if (k %in% sig_cells) next
        if (!(k %in% sig_cells)) {
          spanners_row[k] <- ""
        }
      }

      level_i_spanners <-
        lapply(
          seq_along(spanner_ids_row),
          FUN = function(x) {
            rtf_tbl_cell(
              rtf_font(
                font_size = 10,
                rtf_raw(spanners_row[x])
              ),
              h_align = "center",
              h_merge = merge_keys_spanners[x],
              borders = list(
                if (spanners_row[x] != "") {
                  rtf_border("bottom", color = column_labels_border_bottom_color, width = 20)
                } else {
                  NULL
                }
              )
            )
          }
        )

      if (length(stub_layout) > 0) {

        level_i_spanners <-
          c(
            rep(
              list(
                rtf_tbl_cell(
                  rtf_font(
                    font_size = 10,
                    rtf_raw("")
                  ),
                  h_align = "center"#,
                  # borders = list(
                  #   rtf_border("top", color = column_labels_border_top_color, width = 40),
                  #   rtf_border("bottom", color = column_labels_border_bottom_color),
                  #   rtf_border("left", color = column_labels_vlines_color),
                  #   rtf_border("right", color = column_labels_vlines_color)
                  # )
                )
              ),
              length(stub_layout)
            ),
            level_i_spanners
          )
      }

      spanner_rows <-
        c(
          spanner_rows,
          list(
            rtf_tbl_row(
              level_i_spanners,
              page_body_width = page_body_width,
              widths = col_widths,
              height = 0,
              repeat_header = TRUE
            )
          )
        )
    }
  } else {
    spanner_rows <- ""
  }

  row_list_column_labels <-
    list(
      spanner_rows,
      rtf_tbl_row(
        cell_list,
        page_body_width = page_body_width,
        widths = col_widths,
        height = 0,
        repeat_header = TRUE
      )
    )

  # Return a list of RTF table rows (either one or two rows)
  row_list_column_labels
}

#
# Table Body
#
create_body_component_rtf <- function(data) {

  summaries_present <- dt_summary_exists(data = data)
  list_of_summaries <- dt_summary_df_get(data = data)
  groups_rows_df <- dt_groups_rows_get(data = data)

  # Get table options
  row_group_border_top_color <- dt_options_get_value(data = data, option = "row_group_border_top_color")
  row_group_border_bottom_color <- dt_options_get_value(data = data, option = "row_group_border_bottom_color")
  row_group_border_left_color <- dt_options_get_value(data = data, option = "row_group_border_left_color")
  row_group_border_right_color <- dt_options_get_value(data = data, option = "row_group_border_right_color")
  table_body_hlines_color <- dt_options_get_value(data = data, option = "table_body_hlines_color")
  table_body_vlines_color <- dt_options_get_value(data = data, option = "table_body_vlines_color")

  # Get the table width and page body width
  table_width <- dt_options_get_value(data = data, option = "table_width")
  page_body_width <- get_page_body_width(data = data)

  # Obtain all of the visible (`"default"`), non-stub
  # column names for the table
  default_vars <- dt_boxhead_get_vars_labels_default(data = data)

  boxh <- dt_boxhead_get(data)
  # Create a named vector  https://github.com/rstudio/gt/issues/1233
  default_vars_names <-  dt_boxhead_get_vars_default(data = data)
  names(default_vars_names) <- default_vars

  # Get a matrix of all cell content for the body
  cell_matrix <- get_body_component_cell_matrix(data = data)

  # Get vector representation of stub layout
  stub_layout <- get_stub_layout(data = data)

  # Get the column alignments
  col_alignment <-
    c(
      dt_boxhead_get_alignments_in_stub(data = data),
      dt_boxhead_get_vars_align_default(data = data)
    )

  # Replace an NA group with an empty string
  if (anyNA(groups_rows_df$group_label)) {

    groups_rows_df$group_label[is.na(groups_rows_df$label)] <- ""
  }

  row_groups_present <- nrow(groups_rows_df) > 0L
  row_group_rows <- groups_rows_df$row_start
  row_group_labels <- groups_rows_df$group_label

  n_cols <- ncol(cell_matrix)
  n_rows <- nrow(cell_matrix)

  # Apply hierarchical stub merging for multiple stub columns
  # (hide repeated values in all columns except the rightmost)
  has_stub_column <- "rowname" %in% stub_layout
  
  if (has_stub_column) {
    stub_vars <- dt_boxhead_get_var_stub(data = data)
    
    if (length(stub_vars) > 1 && !any(is.na(stub_vars))) {

      # Get original body data to check for consecutive repeating values
      original_body <- dt_data_get(data = data)
      
      # Process all stub columns except the rightmost one
      hierarchy_vars <- stub_vars[-length(stub_vars)]
      stub_matrix <- as.matrix(original_body[, hierarchy_vars, drop = FALSE])
      
      # Determine which columns to hide based on hierarchical grouping
      for (col_idx in seq_along(hierarchy_vars)) {

        # Position in cell_matrix (accounting for group_label column if present)
        matrix_col_idx <- col_idx
        if ("group_label" %in% stub_layout) {
          matrix_col_idx <- col_idx + 1
        }
        
        for (row_idx in 2:n_rows) {
          should_hide <- TRUE
          
          # Check if current value matches previous value
          if (stub_matrix[row_idx, col_idx] != stub_matrix[row_idx - 1, col_idx]) {
            should_hide <- FALSE
          }
          
          # Also check that all columns to the left match
          if (should_hide && col_idx > 1) {
            for (left_col_idx in 1:(col_idx - 1)) {
              if (stub_matrix[row_idx, left_col_idx] != stub_matrix[row_idx - 1, left_col_idx]) {
                should_hide <- FALSE
                break
              }
            }
          }
          
          # Hide the value by making it empty if conditions are met
          if (should_hide) {
            cell_matrix[[row_idx, matrix_col_idx]] <- ""
          }
        }
      }
    }
  }

  # Obtain widths for each visible column label in units of twips

  # Obtain widths for each visible column label
  col_widths <-
    vctrs::vec_slice(boxh, boxh$type %in% c("default", "stub"))
  # arrange by descending type and grab the "column_width" column.
  col_widths <- col_widths[order(col_widths$type, decreasing = TRUE), "column_width", drop = TRUE]
  col_widths <- unlist(col_widths)

  col_widths <-
    col_width_resolver_rtf(
      page_body_width = page_body_width,
      table_width = table_width,
      col_widths = col_widths,
      n_cols = n_cols
    )

  row_list_body <- list()

  for (i in seq_len(n_rows)) {

    group_info <- groups_rows_df[groups_rows_df$row_start == i, c("group_id", "group_label")]

    if (nrow(group_info) == 0) {
      group_info <- NULL
    }

    group_id <- group_info[["group_id"]]
    group_label <- group_info[["group_label"]]

    #
    # Create a group heading row
    #
    if (
      !is.null(group_id) &&
      !("group_label" %in% stub_layout)
    ) {

      row_list_body <-
        c(
          row_list_body,
          rtf_tbl_row(
            list(
              rtf_tbl_cell(
                row_group_labels[which(row_group_rows == i)],
                font_size = 10,
                h_align = "left"#,
                # borders = list(
                #   rtf_border("top", color = row_group_border_top_color, width = 40),
                #   rtf_border("bottom", color = row_group_border_bottom_color, width = 40),
                #   rtf_border("left", color = row_group_border_left_color),
                #   rtf_border("right", color = row_group_border_right_color)
                # )
              )
            ),
            page_body_width = page_body_width,
            widths = sum(col_widths),
            height = 0
          )
        )
    }

    #
    # Create a body row
    #
    cell_list <-
      lapply(
        seq_len(n_cols),
        FUN = function(x) {

          # If we are in row group column and the cell is blank (only the first
          # value is shown) then we need to ensure that there is no top border
          top_bottom_borders <-
            c(
              rtf_border("top", color = table_body_hlines_color, width = 10),
              rtf_border("bottom", color = table_body_hlines_color, width = 10)
            )

          if ("group_label" %in% stub_layout && x == 1) {

            if (i %in% groups_rows_df$row_start) {
              cell_matrix[[i, x]] <- group_label
              top_bottom_borders[[2]] <- NULL
            } else if (i %in% groups_rows_df$row_end) {
              top_bottom_borders[[1]] <- NULL
            } else {
              top_bottom_borders <- NULL
            }
          }

          # This performs a removal of top and bottom borders in the two-column
          # stub case where summary rows follow
          if (x == 1) {

            row_limits <- dplyr::filter(groups_rows_df, row_end == i)
            row_limits <- row_limits[ , "group_id", drop = FALSE]

            if (nrow(row_limits) > 0) {

              summary_rows_group_df <-
                list_of_summaries[["summary_df_display_list"]][[row_limits$group_id]]

              if (!is.null(summary_rows_group_df) && length(stub_layout) > 1) {
                top_bottom_borders <- NULL
              }
            }
          }

          rtf_tbl_cell(
            rtf_font(
              font_size = 10,
              rtf_raw(cell_matrix[[i, x]])
            ),
            h_align = col_alignment[x]#,
            # borders = list(
            #   top_bottom_borders,
            #   rtf_border("left", color = table_body_vlines_color, width = 10),
            #   rtf_border("right", color = table_body_vlines_color, width = 10)
            # )
          )
        }
      )

    if (i == 1 && row_groups_present && !(i %in% row_group_rows)) {

      body_row <-
        rtf_tbl_row(
          cell_list,
          page_body_width = page_body_width,
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
          page_body_width = page_body_width,
          widths = col_widths,
          height = 0
        )
    }

    row_list_body <- c(row_list_body, body_row)

    #
    # Add groupwise summary rows
    #

    if (summaries_present && i %in% groups_rows_df$row_end) {

      group_id <-
        groups_rows_df[
          omit_na(groups_rows_df$row_end == i),
          "group_id", drop = TRUE
        ]

      if (group_id %in% names(list_of_summaries$summary_df_display_list)) {

        summary_df <-
          dplyr::select(
            list_of_summaries$summary_df_display_list[[group_id]],
            dplyr::all_of(c(rowname_col_private, default_vars_names)),
          )

        n_summary_rows <- seq_len(nrow(summary_df))

        for (j in n_summary_rows) {

          summary_row <- as.matrix(summary_df)[j, ]

          if (length(stub_layout) > 1) summary_row <- c("", summary_row)

          cell_list <-
            lapply(
              seq_len(n_cols), FUN = function(x) {

                if (j == length(n_summary_rows) && "group_label" %in% stub_layout) {
                  bottom_line_style <- "db"
                  bottom_line_width <- 20
                } else {
                  bottom_line_style <- "s"
                  bottom_line_width <- 10
                }

                bottom_border <-
                  rtf_border(
                    "bottom",
                    style = bottom_line_style,
                    color = table_body_hlines_color,
                    width = bottom_line_width
                  )

                # Remove all (but the last) bottom borders for first column
                # inside summary rows where there is a two-column stub
                if (length(stub_layout) > 1 && x == 1 && j != length(n_summary_rows)) {
                  bottom_border <- NULL
                }

                rtf_tbl_cell(
                  rtf_font(
                    font_size = 10,
                    rtf_raw(summary_row[x])
                  ),
                  h_align = col_alignment[x]#,
                  # borders = list(
                  #   bottom_border,
                  #   rtf_border("left", color = table_body_vlines_color, width = 10),
                  #   rtf_border("right", color = table_body_vlines_color, width = 10)
                  # )
                )
              }
            )

          row_list_summary <-
            rtf_tbl_row(
              cell_list,
              page_body_width = page_body_width,
              widths = col_widths,
              height = 0
            )

          row_list_body <- c(row_list_body, row_list_summary)
        }
      }
    }
  }

  #
  # Add grand summary rows
  #

  if (
    summaries_present &&
    grand_summary_col %in% names(list_of_summaries$summary_df_display_list)
  ) {

    grand_summary_df <-
      dplyr::select(
        list_of_summaries$summary_df_display_list[[grand_summary_col]],
        dplyr::all_of(c(rowname_col_private, default_vars_names))
      )

    for (j in seq_len(nrow(grand_summary_df))) {

      grand_summary_row <- as.matrix(grand_summary_df)[j, ]

      merge_keys_cells <- rep(0, length(grand_summary_row))

      if (length(stub_layout) > 1) {

        grand_summary_row <- c(grand_summary_row[1], "", grand_summary_row[-1])
        merge_keys_cells <- c(1, 2, rep(0, length(grand_summary_row) - 2))
      }

      # Generate a cell list containing grand summary rows
      cell_list <-
        lapply(
          seq_len(n_cols), FUN = function(x) {

            rtf_tbl_cell(
              rtf_font(
                font_size = 10,
                rtf_raw(grand_summary_row[x])
              ),
              h_align = col_alignment[x],
              h_merge = merge_keys_cells[x]#,
              # borders = list(
              #   rtf_border(
              #     "bottom",
              #     color = table_body_hlines_color,
              #     width = ifelse(j == nrow(grand_summary_df), 50, 10)
              #     ),
              #   rtf_border("left", color = table_body_vlines_color, width = 10),
              #   rtf_border("right", color = table_body_vlines_color, width = 10)
              # )
            )
          }
        )

      side <- summary_row_side(data = data, group_id = grand_summary_col)

      row_list_grand_summary <-
        rtf_tbl_row(
          cell_list,
          page_body_width = page_body_width,
          widths = col_widths,
          height = 0
        )

      if (side == "top") {
        row_list_body <- c(row_list_grand_summary, row_list_body)
      } else {
        row_list_body <- c(row_list_body, row_list_grand_summary)
      }
    }
  }

  # Return a list of RTF table rows for the body part
  row_list_body
}

#
# Table Footer Section
#
create_footer_component_rtf <- function(data) {

  # Obtain the option on whether to place the footer component in the
  # RTF document's page footer
  page_footer_use_tbl_notes <-
    dt_options_get_value(data = data, option = "page_footer_use_tbl_notes")

  # If option is taken to display table notes in the page footer,
  # return an empty list
  if (page_footer_use_tbl_notes) {
    return(list())
  }

  # Get table components and metadata using the `data`
  footnotes_tbl <- dt_footnotes_get(data = data)
  source_notes_vec <- dt_source_notes_get(data = data)

  # If there are no footnotes or source notes, return an empty list
  if (nrow(footnotes_tbl) == 0 && length(source_notes_vec) == 0) {
    return(list())
  }

  boxh <- dt_boxhead_get(data)

  # Get table width and page body width
  table_width <- dt_options_get_value(data = data, option = "table_width")
  page_body_width <- get_page_body_width(data = data)

  # Obtain widths for each visible column label
  col_widths <-
    vctrs::vec_slice(boxh, boxh$type %in% c("default", "stub"))
  # arrange by descending type and grab the "column_width" column.
  col_widths <- col_widths[order(col_widths$type, decreasing = TRUE), "column_width", drop = TRUE]
  col_widths <- unlist(col_widths)

  if (is.null(col_widths)) {

    n_cols <- sum(boxh$type %in% c("default", "stub"))
    col_widths <- rep("100%", n_cols)
  }

  col_widths <-
    col_width_resolver_rtf(
      page_body_width = page_body_width,
      table_width = table_width,
      col_widths = col_widths,
      n_cols = length(col_widths)
    )

  table_width <- sum(col_widths)

  # Get the multiline and separator options for footnotes and source notes
  footnotes_multiline <- dt_options_get_value(data = data, option = "footnotes_multiline")
  footnotes_sep <- dt_options_get_value(data = data, option = "footnotes_sep")
  source_notes_multiline <- dt_options_get_value(data = data, option = "source_notes_multiline")
  source_notes_sep <- dt_options_get_value(data = data, option = "source_notes_sep")

  # Generate a list containing formatted footnotes and source notes
  notes_list <-
    generate_notes_list(
      data = data,
      footnotes_tbl = footnotes_tbl,
      source_notes_vec = source_notes_vec,
      footnotes_multiline = footnotes_multiline,
      source_notes_multiline = source_notes_multiline,
      footnotes_sep = footnotes_sep,
      source_notes_sep = source_notes_sep
    )

  # Return a list of RTF table rows (up to two rows) for the footer
  list(
    if (notes_list$footnotes != "") {
      rtf_tbl_row(
        rtf_tbl_cell(
          rtf_font(
            font_size = 10,
            rtf_raw(notes_list$footnotes)
          )
        ),
        page_body_width = page_body_width,
        widths = table_width,
        height = 0
      )
    },
    if (notes_list$source_notes != "") {
      rtf_tbl_row(
        rtf_tbl_cell(
          rtf_font(
            font_size = 10,
            rtf_raw(notes_list$source_notes)
          )
        ),
        page_body_width = page_body_width,
        widths = table_width,
        height = 0
      )
    }
  )
}

create_page_footer_component_rtf <- function(data) {

  # Obtain the option on whether to place the footer component in the
  # RTF document's page footer
  page_footer_use_tbl_notes <-
    dt_options_get_value(data = data, option = "page_footer_use_tbl_notes")

  # If option not taken to display table notes in the page footer,
  # return an empty list
  if (!page_footer_use_tbl_notes) {
    return(list())
  }

  # Get table components and metadata using the `data`
  footnotes_tbl <- dt_footnotes_get(data = data)
  source_notes_vec <- dt_source_notes_get(data = data)

  # If there are no footnotes or source notes return an empty list
  if (nrow(footnotes_tbl) == 0 && length(source_notes_vec) == 0) {
    return(list())
  }

  # Get the multiline and separator options for footnotes and source notes
  footnotes_multiline <- dt_options_get_value(data = data, option = "footnotes_multiline")
  footnotes_sep <- dt_options_get_value(data = data, option = "footnotes_sep")
  source_notes_multiline <- dt_options_get_value(data = data, option = "source_notes_multiline")
  source_notes_sep <- dt_options_get_value(data = data, option = "source_notes_sep")

  # Generate a list containing formatted footnotes and source notes
  notes_list <-
    generate_notes_list(
      data = data,
      footnotes_tbl = footnotes_tbl,
      source_notes_vec = source_notes_vec,
      footnotes_multiline = footnotes_multiline,
      source_notes_multiline = source_notes_multiline,
      footnotes_sep = footnotes_sep,
      source_notes_sep = source_notes_sep
    )

  # Generate the RTF lines that will generate content in the page footer
  rtf_raw(
    "{\\footer\n",
    paste0("{\\f0\\fs20 ", notes_list$footnotes, "}\\par\n"),
    paste0("{\\f0\\fs20 ", notes_list$source_notes, "}\\par\n"),
    "}\n"
  )
}

generate_notes_list <- function(
    data,
    footnotes_tbl,
    source_notes_vec,
    footnotes_multiline,
    source_notes_multiline,
    footnotes_sep,
    source_notes_sep
) {

  # Create a formatted footnotes string
  if (nrow(footnotes_tbl) > 0) {

    footnotes_tbl <-
      dplyr::distinct(footnotes_tbl, fs_id, footnotes)

    footnote_text <- footnotes_tbl[["footnotes"]]
    footnote_mark <- footnotes_tbl[["fs_id"]]

    footnote_text <-
      vapply(
        footnote_text,
        FUN.VALUE = character(1L),
        USE.NAMES = FALSE,
        FUN = process_text,
        context = "rtf"
      )

    footnotes <- c()

    for (i in seq_along(footnote_mark)) {

      footnotes <-
        c(
          footnotes,
          rtf_paste0(
            footnote_mark_to_rtf(
              data = data,
              mark = footnote_mark[i],
              location = "ftr"
            ),
            " ",
            rtf_raw(footnote_text[i])
          )
        )
    }

    if (footnotes_multiline) {
      footnotes <- paste(footnotes, collapse = rtf_raw("\\line "))
    } else {
      footnotes <- paste(footnotes, collapse = footnotes_sep)
    }
  } else {
    footnotes <- ""
  }

  # Create a formatted source notes string
  if (length(source_notes_vec) > 0) {

    source_notes <- c()

    for (i in seq_along(source_notes_vec)) {
      source_notes <- c(source_notes, rtf_raw(source_notes_vec[i]))
    }

    if (source_notes_multiline) {
      source_notes <- paste(source_notes, collapse = "\\line ")
    } else {
      source_notes <- paste(source_notes, collapse = source_notes_sep)
    }
  } else {
    source_notes <- ""
  }

  list(
    footnotes = footnotes,
    source_notes = source_notes
  )
}

# Convert value given in different length units to twips
dt_options_get_page_value_in_twips <- function(data, option) {

  value <- dt_options_get_value(data = data, option = option)

  tw_tbl <- abs_len_to_twips(parse_length_str(value))

  tw_tbl$value
}

get_page_body_width <- function(data) {

  page_orientation <- dt_options_get_value(data = data, option = "page_orientation")

  page_width_val <-
    dt_options_get_page_value_in_twips(
      data = data,
      option = if (page_orientation == "portrait") "page_width" else "page_height"
    )

  page_margin_left_val <-
    dt_options_get_page_value_in_twips(data = data, option = "page_margin_left")

  page_margin_right_val <-
    dt_options_get_page_value_in_twips(data = data, option = "page_margin_right")

  page_width_val - page_margin_left_val - page_margin_right_val
}
