#' @importFrom grDevices col2rgb rgb
#' @importFrom htmltools tagList
NULL

# tbl ----------------------------------------------------------

ooxml_tbl <- function(ooxml_type, properties = NULL, grid = NULL, ...) {
  rows <- ooxml_list(ooxml_type, "ooxml_tbl_row", ooxml_tbl_row, ...)

  tag <- switch_ooxml_tag(ooxml_type, "tbl")
  ooxml_tag(tag, tag_class = "ooxml_tbl", !!!ooxml_ns(ooxml_type),
    check_inherits(properties, "ooxml_tbl_properties", accept_null = TRUE),
    check_inherits(grid, "ooxml_tbl_grid", accept_null = TRUE),

    !!!rows
  )
}

## tbl_properties ---------------------------------------------------------

ooxml_tbl_properties <- function(ooxml_type, ...) {
  switch_ooxml(ooxml_type,
    word = word_tbl_properties(...),
    pptx = pptx_tbl_properties(...)
  )
}

word_tbl_cell_margins <- function() {
  ooxml_tag("w:tblCellMar",
    ooxml_tag("w:top", "w:w" = "0", "w:type" = "dxa"),
    ooxml_tag("w:bottom", "w:w" = "0", "w:type" = "dxa"),
    ooxml_tag("w:start", "w:w" = "60", "w:type" = "dxa"),
    ooxml_tag("w:end", "w:w" = "60", "w:type" = "dxa")
  )
}

word_tbl_properties <- function(..., layout = c("autofit", "fixed"), justify = c("center", "start", "end"), width = "auto", tableStyle = NULL) {
  rlang::check_dots_empty()

  if (!rlang::is_character(width, n = 1)) {
    cli::cli_abort("{.arg width} must be a scalar character value.")
  }


  ooxml_tag("w:tblPr", tag_class = "ooxml_tbl_properties",
    word_tbl_cell_margins(),
    ooxml_tbl_width("word", width = width),
    # ooxml_tag("w:tblLayout", "w:type" = rlang::arg_match(layout)),
    ooxml_tag("w:tblLook",
      "w:firstRow"    = "0",
      "w:lastRow"     = "0",
      "w:firstColumn" = "0",
      "w:lastColumn"  = "0",
      "w:noVBand"     = "0",
      "w:noHBand"     = "0"
    ),
    ooxml_tag("w:jc", "w:val" = rlang::arg_match(justify))
  )
}

pptx_tbl_properties <- function(..., width = "auto", tableStyle = NULL) {

  ooxml_tag("a:tblPr", tag_class = "ooxml_tbl_properties",
    "firstRow"    = "0",
    "lastRow"     = "0",
    "firstCol"    = "0",
    "lastCol"     = "0",
    "bandCol"     = "0",
    "bandRow"     = "0",

    ooxml_tbl_width("pptx", width = width),

    ooxml_tag("a:tblLook", firstRow="0", lastRow="0", firstCol="0", lastCol="0", noHBand="1", noVBand="1", val="04A0"),

    ooxml_tag("a:tableStyleId", tableStyle %||% "{5C22544A-7EE6-4342-B048-85BDC9FD1C3A}")
  )
}

ooxml_tbl_width <- function(ooxml_type, width = "auto") {
  if (is.null(width)) {
    return(NULL)
  }

  if (identical(width, "auto")) {
    return(switch_ooxml(ooxml_type,
      word = ooxml_tag("w:tblW"  , "w:type" = "auto"),
      pptx = ooxml_tag("a:tableW", "type" = "auto", w = "9144000")
    ))
  }

  if (grepl("%$", width)) {
    width <- as.numeric(sub("%$", "", width))
    return(switch_ooxml(ooxml_type,
      word = ooxml_tag("w:tblW"  , "w:type" = "pct", "w:w" = 50 * width),
      pptx = ooxml_tag("a:tableW", "type" = "pct", "w" = 1000 * width)
    ))
  }

  # otherwise assume dxa, expressed in pt
  width <- as.numeric(width)
  return(switch_ooxml(ooxml_type,
    word = ooxml_tag("w:tblW"  , "w:type" = "dxa", "w:w" = 20 * width),
    pptx = ooxml_tag("a:tableW", "type" = "pct", "w" = 20 * width)
  ))

}


## tbl_grid -----------------------------------------------------------

ooxml_tbl_grid <- function(ooxml_type, ..., table_width = NULL) {
  dots <- list2(...)
  if (identical(ooxml_type, "word") && all(sapply(dots, is.null))) {
    return(NULL)
  }

  tblGrid_tag <- switch_ooxml_tag(ooxml_type, "tblGrid")
  gridCol_tag <- switch_ooxml_tag(ooxml_type, "gridCol")

  if(identical(ooxml_type, "pptx")){
    dots <- derive_ooxml_width_pptx(widths = dots, table_width = table_width)
  }

  grid_cols <- lapply(dots, \(width) {
    if (ooxml_type == "word") {
      if (is.null(width)) {
        ooxml_tag(gridCol_tag)
      } else
      ooxml_tag(gridCol_tag, "w:w" = width)
    } else {
      ooxml_tag(gridCol_tag, "w" = width)
    }
  })
  ooxml_tag(tblGrid_tag, tag_class = "ooxml_tbl_grid", !!!grid_cols)
}


derive_ooxml_width_pptx <- function(widths, table_width = NULL){

  widths_out <- vector("numeric", length = length(widths))

  table_width_remainder <- table_width <- table_width %||% 9144000
  warned_on_negative_table_width_remainder <- FALSE


  ## Types of columns widths - pct, defined (px, cm, etc), or undefined
  pct_cols <- sapply(widths, function(.x){if(is.character(.x)){endsWith(.x, "%")}else{FALSE}})
  defined_cols <- sapply(widths, function(.x){if(is.character(.x)){grepl("(in|pt|cm|emu|em|px)$", x = .x)}else{FALSE}})
  undefined_cols <- !pct_cols & !defined_cols

  ## convert pct cols to EMU
  if(sum(pct_cols) > 0){
    pct_cols_widths <- round(( as.numeric(gsub("%", "", widths[pct_cols], fixed = TRUE))/100 )* table_width)
    pct_cols_widths <-  pmax(
      pct_cols_widths,
      9525*22 ## smallest allowable width is .23in, or 22px
    )
    widths_out[pct_cols] <- pct_cols_widths
    table_width_remainder <- table_width_remainder - sum(pct_cols_widths)
    if(table_width_remainder < 0 & !warned_on_negative_table_width_remainder){
      warn("Defined column widths are wider than the defined table")
      warned_on_negative_table_width_remainder <- TRUE
    }
  }

  ## convert defined cols to EMU
  if(sum(defined_cols) > 0){
    defined_cols_widths <- widths[defined_cols] %>% sapply(function(.x){
      if(grepl("(in|pt|cm|emu|em)$", x = .x)){
        px <- convert_to_px(.x)
      }else{
        px <- as.numeric(gsub("px$", "", .x))
      }
      px * 9525 # https://stackoverflow.com/questions/66541210/convert-google-slides-emu-units-to-pixels-api
      })
    defined_cols_widths <-  pmax(
      defined_cols_widths,
      9525*22 ## smallest allowable width is .23in, or 22px
    )

    widths_out[defined_cols] <- defined_cols_widths
    table_width_remainder <- table_width_remainder - sum(defined_cols_widths)
    if(table_width_remainder < 0 & !warned_on_negative_table_width_remainder){
      warn("Defined column widths are wider than the defined table")
      warned_on_negative_table_width_remainder <- TRUE
    }
  }

  ## undefined columns split table width evenly
  if(sum(undefined_cols) > 0){

    undefined_cols_widths <- max(
      round(table_width_remainder / sum(undefined_cols)), ## split remainder of the table evenly
      9525*22 ## smallest allowable width is .23in, or 22px
      )

    widths_out[undefined_cols] <- undefined_cols_widths

    if(table_width_remainder < 0 & !warned_on_negative_table_width_remainder){
      warn("Defined column widths are wider than the defined table")
      warned_on_negative_table_width_remainder <- TRUE
    }

  }

  return(as.list(widths_out))


}

# tbl_row -----------------------------------------------------------

ooxml_tbl_row <- function(ooxml_type, ..., is_header = FALSE, split = FALSE, height = 10) {
  content <- ooxml_list(ooxml_type, "ooxml_tbl_cell", ooxml_tbl_cell, ...)

  switch_ooxml(ooxml_type,
    word = {
      properties <- ooxml_tag("w:trPr", tag_class = "ooxml_tbl_row_properties",
        if (!split)    ooxml_tag("w:cantSplit"),
        if (is_header) ooxml_tag("w:tblHeader"),
        # ooxml_tbl_row_height(ooxml_type, value = height)
      )
      ooxml_tag("w:tr", tag_class = "ooxml_tbl_row",
        properties,
        !!!content
      )
    },

    pptx = {
      ooxml_tag("a:tr", tag_class = "ooxml_tbl_row",
        ooxml_tbl_row_height(ooxml_type, value = height),
        !!!content
      )
    }
  )
}

## tbl_row_height ----------------------------------------------------------

ooxml_tbl_row_height <- function(ooxml_type, value, ..., error_call = current_env()) {
  rlang::check_dots_empty()

  word_trHeight <- function() {
    bullets <- c(
      "Invalid value for table row height: {.val {value}}.",
      i = "{.arg {value}} must be a positive numeric value, or one of {.val auto} or {.val atLeast}."
    )

    if (is.character(value)) {
      if (value %in% c("auto", "atLeast")) {
        hRule <- match.arg(value, c("auto","atLeast"))
        value <- "10"

        return(
          ooxml_tag("w:trHeight",
            "w:hRule" = hRule,
            "w:val"   = "10"
          )
        )

      }
      value <- tryCatch(
        vctrs::vec_cast(value, numeric(), call = error_call),
        error = function(e) {
          cli::cli_abort(call = error_call, bullets, parent = e)
        }
      )
    }

    if (!is.numeric(value) || value <= 0) {
      cli::cli_abort(call = error_call, bullets)
    }

    ooxml_tag("w:trHeight",
      "w:hRule" = "exact",
      "w:val"   = value
    )
  }

  pptx_trHeight <- function() {
    value <- value %||% 10
    splice3(h = value * 12700 * 2)
  }

  switch_ooxml(ooxml_type,
    word = word_trHeight(),
    pptx = pptx_trHeight(),
  )
}


# ooxml_tbl_cell ----------------------------------------------------------

ooxml_tbl_cell <- function(ooxml_type, ..., properties = NULL, col_span = NULL, row_span = NULL) {

  if (identical(properties, "remove cell")) {
    return(NULL)
  }

  properties <- check_inherits(properties, "ooxml_tbl_cell_properties", accept_null = TRUE)

  switch_ooxml(ooxml_type,
    word = {
      ooxml_tag("w:tc", tag_class = "ooxml_tbl_cell", properties, ...)
    },
    pptx = {

      if(identical(row_span, 0) | identical(col_span, 0)){
        ooxml_tag("a:tc", tag_class = "ooxml_tbl_cell",
                  if (!is.null(col_span) && isTRUE(col_span > 1L)) splice3(gridSpan = col_span),
                  if (identical(col_span, 0)) splice3(hMerge = 1),
                  if (!is.null(row_span) &&  isTRUE(row_span > 1L)) splice3(rowSpan = row_span),
                  if (identical(row_span, 0)) splice3(vMerge = 1),
                  ooxml_tag("a:txBody", tag_class = "ooxml_text_body",
                            ooxml_tag(tag = "a:bodyPr"),
                            ooxml_tag(tag = "a:lstStyle"),
                            ooxml_tag(tag = "a:p", ooxml_tag(tag = "a:endParaRPr"))
                  )
        )

      }else{
        ooxml_tag("a:tc", tag_class = "ooxml_tbl_cell",
                  if (!is.null(col_span) && isTRUE(col_span > 1L)) splice3(gridSpan = col_span),
                  if (!is.null(row_span) &&  isTRUE(row_span > 1L)) splice3(rowSpan = row_span),
                  ooxml_tag("a:txBody", tag_class = "ooxml_text_body",
                            ooxml_tag(tag = "a:bodyPr", vertOverflow="clip", horzOverflow="clip", wrap="square", rtlCol="0", anchor="ctr"),
                            ooxml_tag(tag = "a:lstStyle"),
                            ...
                  ),
                  properties
        )
      }
    }
  )
}

# ooxml_tbl_cell_properties --------------------------------------------------------------

ooxml_tbl_cell_properties <- function(ooxml_type, ..., borders = NULL, fill = NULL, margins = NULL,
                                       row_span = NULL, col_span = NULL, v_align = NULL, v_merge = FALSE) {
  rlang::check_dots_empty()

  margins  <- ooxml_tbl_cell_margins(ooxml_type, margins)
  borders  <- ooxml_cell_borders(ooxml_type, borders)
  fill     <- ooxml_fill(ooxml_type, fill)
  v_merge_tag <- if (isTRUE(v_merge)) {
    switch_ooxml(ooxml_type,
      word = ooxml_tag("w:vMerge"),           # continuation: no val attribute
      pptx = ooxml_tag("a:vMerge")            # continuation
    )
  } else {
    ooxml_vMerge(ooxml_type, row_span)
  }
  v_align  <- ooxml_vAlign(ooxml_type, v_align)
  gridSpan <- ooxml_gridSpan(ooxml_type, col_span)


  tag <- switch_ooxml_tag(ooxml_type, "tcPr")
  ooxml_tag(tag, tag_class = "ooxml_tbl_cell_properties",
    borders,
    margins,
    gridSpan,
    fill,
    v_merge_tag,
    v_align
  )
}

# ooxml_cell_borders ------------------------------------------------------

ooxml_cell_borders <- function(ooxml_type, border = NULL) {

  if (is.null(border)) {
    return(NULL)
  }

  border_order <- switch(ooxml_type,
      word = c("top", "bottom", "left", "right"),
      pptx = c("left", "right", "top", "bottom")
  )

  xml_border <- lapply(border_order, function(location) {
    if (is.null(border[[location]])){
      return(ooxml_cell_border_default(ooxml_type = ooxml_type, location = location))
    }
    x <- border[[location]]
    rlang::exec(ooxml_cell_border, ooxml_type = ooxml_type, location = location, !!!x)
  })

  switch_ooxml(ooxml_type,
    word = {
      tag <- switch_ooxml_tag(ooxml_type, word = "tcBorders", pptx = "tcBdr")
      ooxml_tag(tag, tag_class = "ooxml_cell_borders", !!!xml_border)
    },
    pptx = {
      tagList3(xml_border)
    }
  )


}

# ooxml_cell_border -------------------------------------------------------

ooxml_cell_border <- function(ooxml_type, ..., location, color = "black", size = NULL, type = "solid") {
  rlang::check_dots_empty()

  switch_ooxml(ooxml_type,
    word = {
      tag      <- arg_match_names(location, c("top" = "w:top", "left" = "w:start", "bottom" = "w:bottom", "right" = "w:end"))
      color    <- as_hex_code(color)
      size     <- check_between(size, min = .25, max = 12, null_ok = TRUE)
      type     <- arg_match_names(type, c("single" = "single", "solid" = "single", "dashed" = "dashed", "dotted" = "dotted", "hidden" = "none", "double" = "double"))

      ooxml_tag(tag, tag_class = "ooxml_cell_border",
        `w:val`   = type,
        `w:sz`    = if (!is.null(size)) size * 2,
        `w:space` = 0,
        `w:color` = color
      )
    },
    pptx = {
      tag   <- arg_match_names(location, c("top"="a:lnT","left"="a:lnL","bottom"="a:lnB","right"="a:lnR"))

      size  <- check_between(size, min = 0, max = 10, default = 1.3333)
      style <- convert_border_style_pptx(type)

      if (is.null(style[["compound"]])) {
        return(NULL)
      }

      dash <- if (!is.null(style[["dash_style"]])) {
        ooxml_tag("a:prstDash", `val` = style[["dash_style"]])
      }

      ooxml_tag(tag, tag_class = "ooxml_cell_border",
        `w`    = px_to_emu(size),
        `cap`  = "flat",
        `cmpd` = style[["compound"]],
        `algn` = "ctr",
        ooxml_fill(ooxml_type, color = color),
        dash,
        ooxml_tag("a:round"),
        ooxml_line_end(loc = "head"),
        ooxml_line_end(loc = "tail")
      )
    }
  )
}

ooxml_cell_border_default <- function(ooxml_type, location){

  switch_ooxml(ooxml_type,
    word = {NULL},
    pptx = {
      ooxml_cell_border(
        ooxml_type = ooxml_type,
        location = location,
        color = NULL,
        size = 1,
        type = "solid"
        )
    }
  )
}

px_to_emu <- function(x) {
  round(x * 9525)
}


border_style_pptx <- list(
  "solid"  = list(compound = "sng", dash_style = "solid"),
  "dashed" = list(compound = "sng", dash_style = "dash"),
  "dotted" = list(compound = "sng", dash_style = "dot"),
  "hidden" = list(compound = NULL,     dash_style = NULL),
  "double" = list(compound = "dbl",    dash_style = NULL)
)

convert_border_style_pptx <- function(x, error_call = caller_env()){

  if (x %in% names(border_style_pptx)) {
    border_style_pptx[[x]]
  } else {
    cli::cli_warn("Invalid border style supplied: {x}", error_call = error_call)
    border_style_pptx[["hidden"]]
  }
}

# type = line end decoration, ie. triangle, arrowhead, etc
# w = Specifies the line end width in relation to the line width.
# len = Specifies the line end length in relation to the line width.
ooxml_line_end <- function(loc = c("head","tail"), type = "none", w = "med", len = "med"){

  loc <- match.arg(loc)

  tag <- paste0("a:",loc, "End")

  ooxml_tag(tag = tag,
            tag_class = paste0("ooxml_cell_border_",loc,"_end"),
            `type` = type,
            `w` = w,
            `len` = len
            )
}


# ooxml_fill --------------------------------------------------------------

ooxml_fill <- function(ooxml_type, color = NULL) {
  switch_ooxml(ooxml_type,
    word = if (!is.null(color)) {
      ooxml_tag("w:shd", tag_class = "ooxml_fill",
        `w:val`   = "clear",
        `w:color` = "auto",
        `w:fill`  = as_hex_code(color)
      )
    },
    pptx = {
      if (is.null(color)) {
        ooxml_tag("a:noFill", tag_class = "ooxml_fill")
      } else {
        ooxml_tag("a:solidFill", tag_class = "ooxml_fill",
          ooxml_tag("a:srgbClr", "val" = as_hex_code(color))
        )
      }
    }
  )
}

# ooxml_tbl_cell_margins --------------------------------------------------

ooxml_tbl_cell_margins <- function(ooxml_type, margins = NULL) {
  word_tbl_cell_margins <- function() {
    if (is.null(margins)) {
      return(NULL)
    }

    xml_margins <- lapply(c("top", "bottom", "left", "right"), function(location) {
      if (is.null(margins[[location]])) {
        return(NULL)
      }

      x <- margins[[location]]
      dir <- switch(location,
        left   = "start",
        right  = "end",
        top    = "top",
        bottom = "bottom"
      )
      ooxml_tag(paste0("w:", dir), tag_class = "ooxml_tbl_cell_margin",
        "w:w"    = x[["width"]],
        "w:type" = x[["type"]]
      )
    })

    # in word margins are expressed with a <w:tcMar> node
    ooxml_tag("w:tcMar", !!!xml_margins)
  }

  pptx_tbl_cell_margins <- function() {

    if (is.null(margins)) {
      return(NULL)
      # return(rlang::splice(list(
      #   marT = "45720",
      #   marB = "45720",
      #   marL = "45720",
      #   marR = "45720",
      #   anchor = "ctr"
      # )))
    }

    attrs_margins <- lapply(c("top", "bottom", "left", "right"), function(location) {
      if (is.null(margins[[location]])) {
        return("0")
      }
      margins[[location]]$width # TODO: should there be a multiplier here ?
    })

    names(attrs_margins) <- c("marT", "marB", "marL", "marR")

    attrs_margins <- c(attrs_margins, "anchor" = "ctr")
    # in pptx, margins are attributes, so we use a spliced list
    rlang::splice(attrs_margins)
  }

  switch_ooxml(ooxml_type,
    word = word_tbl_cell_margins(),
    pptx = pptx_tbl_cell_margins()
  )

}

# ooxml_cantSplit ---------------------------------------------------------

ooxml_cantSplit <- function(ooxml_type) {
  switch_ooxml(ooxml_type,
    word = ooxml_tag("w:cantSplit"),
    pptx = NULL
  )
}

# ooxml_vMerge  ---------------------------------------------------------------

ooxml_vMerge <- function(ooxml_type, val = 1) {
  if (is.null(val) || val == 1) {
    return(NULL)
  }

  switch_ooxml(ooxml_type,
    word = ooxml_tag("w:vMerge" , "val" = if (val > 1) "restart" else "continue"),
    pptx = ooxml_tag("a:rowSpan", "val" = val)
  )

}

# ooxml_vAlign ------------------------------------------------------------

ooxml_vAlign <- function(ooxml_type, align = NULL) {
  if (is.null(align)) {
    return(NULL)
  }

  switch_ooxml(ooxml_type,
    word = ooxml_tag("w:vAlign", "w:val" = arg_match_names(align, values = c("top" = "top", "center" = "center", "middle" = "center", "bottom" = "bottom"))),
    pptx = ooxml_tag("a:anchor", arg_match_names(align, values = c("top" = "t", "center" = "ctr", "middle" = "ctr", "bottom" = "b")))
  )
}

# ooxml_gridSpan ----------------------------------------------------------

ooxml_gridSpan <- function(ooxml_type, col_span = NULL) {
  if (is.null(col_span)) {
    return(NULL)
  }
  col_span <- as.integer(col_span)
  if (col_span == 1) {
    return(NULL)
  }

  switch_ooxml(ooxml_type,
    word = ooxml_tag("w:gridSpan", "w:val" = col_span),
    pptx = NULL
  )
}

# ooxml_font --------------------------------------------------------------

ooxml_font <- function(ooxml_type, font = NULL) {
  if (is.null(font)) {
    return(NULL)
  }

  switch_ooxml(ooxml_type,
    word = ooxml_tag("w:rFonts", "w:ascii" = font, "w:hAnsi" = font),
    pptx = ooxml_tag("a:latin", typeface = font)
  )
}

# ooxml_size --------------------------------------------------------------

ooxml_size <- function(ooxml_type, size = NULL) {
  if (is.null(size)) {
    return(NULL)
  }

  switch_ooxml(ooxml_type,
    word = ooxml_tag("w:sz", "w:val" = check_scalar_integer(size) * 2),
    pptx = splice3("sz" = check_scalar_integer(size) * 100)
  )
}

# ooxml_color --------------------------------------------------------------

ooxml_color <- function(ooxml_type, color = NULL) {
  if (is.null(color)) {
    return(NULL)
  }

  color <- as_hex_code(color)
  switch_ooxml(ooxml_type,
    word = ooxml_tag("w:color", "w:val" = color),
    pptx = ooxml_tag("a:solidFill", ooxml_tag("a:srgbClr", val = color))
  )
}

# ooxml_style --------------------------------------------------------------

ooxml_style <- function(ooxml_type, style = NULL) {
  if (!identical(style, "italic")) {
    return(NULL)
  }

  switch_ooxml(ooxml_type,
    word = ooxml_tag("w:i"),
    pptx = splice3(i = "1")
  )
}

# ooxml_weight --------------------------------------------------------------

ooxml_weight <- function(ooxml_type, weight = NULL) {
  if (!identical(weight, "bold")) {
    return(NULL)
  }

  switch_ooxml(ooxml_type,
    word = ooxml_tag("w:b", "w:val" = "true"),
    pptx = splice3(b = "1")
  )
}


# ooxml_table_autonum -----------------------------------------------------

ooxml_table_autonum <- function(ooxml_type, font = "Calibri", size = 12) {
  if (ooxml_type == "pptx") {
    return(NULL)
  }

  tagList(
    ooxml_tag("w:r",
      ooxml_tag("w:rPr",
        ooxml_tag("w:rFonts", "w:ascii" = font, "w:hAnsi" = font),
        ooxml_tag("w:sz", "w:val" = size)
      ),
      ooxml_tag("w:t", "xml:space" = "preserve", "Table ")
    ),
    ooxml_tag("w:r", ooxml_tag("w:fldChar", "w:fldCharType" = "begin", "w:dirty" = "true")),
    ooxml_tag("w:r",
      ooxml_tag("w:instrText", "xml:space" = "preserve", "w:dirty" = "true", " SEQ Table \\* ARABIC "),
    ),
    ooxml_tag("w:r", ooxml_tag("w:fldChar", "w:fldCharType" = "separate", "w:dirty" = "true")),
    ooxml_tag("w:r",
      ooxml_tag("w:noProof"),
      ooxml_tag("w:rFonts", "w:ascii" = font, "w:hAnsi" = font),
      ooxml_tag("w:sz", "w:val" = size),
      ooxml_tag("w:t", "w:space" = "default", "1")
    ),
    ooxml_tag("w:r", ooxml_tag("w:fldChar", "w:fldCharType" = "end", "w:dirty" = "true")),
    ooxml_tag("w:r",
      ooxml_tag("w:rPr",
        ooxml_tag("w:rFonts", "w:ascii" = font, "w:hAnsi" = font),
        ooxml_tag("w:sz", "w:val" = size)
      ),
      ooxml_tag("w:t", "xml:space" = "preserve", ": ")
    )
  )

}

ooxml_image <- function(ooxml_type, src, height = 1, width = 1, units = "in", alt_text = "") {
 switch_ooxml(ooxml_type, word = ooxml_image_word(src = src, height = height, width = width, units = units, alt_text = alt_text))
}

ooxml_image_word <- function(src, height = 1, width = 1, units = "in", alt_text = "") {
  xml_image(src, height = height, width = width, units = units, alt_text = alt_text)
}

# ooxml_tag ---------------------------------------------------------------

ooxml_tag <- function(tag, ..., tag_class = tag) {
  xml_tag <- htmltools::tag(`_tag_name` = tag, varArgs = list3(...))
  class(xml_tag) <- c(tag_class, "ooxml_tag", class(xml_tag))
  xml_tag
}

# tools -------------------------------------------------------------------

as_hex_code <- function(x) {
  tryCatch({
    ## if hex already, return the hex
    if (grepl("^(#)", x) || grepl("^(#)*[0-9A-Fa-f]{6}$", x, perl = TRUE)) {
      x <- toupper(x)
    } else {
      font_colors <- col2rgb(x)
      x <- rgb(font_colors[1], font_colors[2], font_colors[3], maxColorValue = 255)
    }

    gsub("^(#)","",x)
  }, error = function(e) {
    ""
  })
}

arg_match_names <- function(arg, values = NULL, error_arg = caller_arg(arg), error_call = caller_env()) {
  arg <- rlang::arg_match(arg, names(values), error_call = error_call, error_arg = error_arg)
  values[[arg]]
}

check_between <- function(x = NULL, min, max, default, null_ok = FALSE, error_arg = caller_arg(x), error_call = caller_env()){
  if (is.null(x)) {
    if (isTRUE(null_ok)) {
      return(NULL)
    }
    x <- default
  }
  if (!is.numeric(x) || length(x) != 1 || x < min || x > max) {
    cli::cli_abort(call = error_call,
      "{.arg {error_arg}} must be a single number between {min} and {max}."
    )
  }
  x
}

check_inherits <- function(x, class, accept_null = TRUE, error_arg = caller_arg(x), error_call = caller_env()) {
  if (is.null(x) && accept_null) {
    return(NULL)
  }

  if (!inherits(x, class)) {
    cli::cli_abort(call = error_call,
      "{.arg {error_arg}} must be a {.cls {class}}, not {.obj_type_friendly {x}}."
    )
  }
  x
}

check_scalar_integer <- function(x, error_arg = caller_arg(x), error_call = caller_env()) {
  if (!rlang::is_integerish(x, n = 1L)) {
    cli::cli_abort(call = error_call,
      "{.arg {error_arg}} must be a single integer."
    )
  }
  as.integer(x)
}

switch_ooxml <- function(
  ooxml_type = c("word", "pptx"),
  word = cli::cli_abort("Not available for word", call = error_call),
  pptx = cli::cli_abort("Not available for pptx", call = error_call),
  error_call = caller_env())
{
  ooxml_type <- rlang::arg_match(ooxml_type, error_call = error_call)
  switch(ooxml_type, "word" = word, "pptx" = pptx)
}

switch_ooxml_tag <- function(ooxml_type = c("word", "pptx"), tag, word = tag, pptx = tag, error_call = caller_env()) {
  suffix <- switch_ooxml(ooxml_type, word = word, pptx = pptx, error_call = error_call)
  prefix <- switch(ooxml_type, word = "w", pptx = "a")
  paste0(prefix, ":", suffix)
}

list3 <- function(...) {
  dots <- list2(...)
  dots <- dots[!sapply(dots, is.null)]
  dots
}

ooxml_list <- function(ooxml_type, tag_class, tag_fun, ...) {
  dots <- list2(...)
  dots <- dots[!sapply(dots, is.null)]
  lapply(dots, \(x) {
    if (!inherits(x, tag_class)) {
      x <- tag_fun(ooxml_type, x)
    }
    x
  })
}

splice3 <- function(...) {
  rlang::splice(list3(...))
}

tagList3 <- function(...) {
  htmltools::tagList(!!!list3(...))
}

# process_text() implementation -------------------------------------------

process_text_ooxml <- function(text, ooxml_type = c("word", "pptx")) {
  ooxml_type <- rlang::arg_match(ooxml_type)

  if (inherits(text, "from_markdown")) {
    return(markdown_to_ooxml(text, ooxml_type = ooxml_type))
  }

  if (is_html(text)) {
    return(markdown_to_ooxml(unescape_html(linebreak_br(text)), ooxml_type = ooxml_type))
  }

  as.character(text)
}

# parse_to_ooxml ----------------------------------------------------------

parse_to_ooxml <- function(x, ooxml_type = c("word", "pptx"), ...) {
  switch_ooxml(ooxml_type, word = parse_to_ooxml_word(x), pptx = parse_to_ooxml_pptx(x))
}

parse_to_ooxml <- function(x, ooxml_type = "word") {
  if (inherits(x, "xml_nodeset")) {
    return(x)
  }
  if (is.null(x) || length(x) == 0) {
    x <- parse_to_ooxml_simple("", ooxml_type)
  }

  if (length(x) > 1) {
    x <- gsub("^<md_container>(.*)</md_container>$", "\\1", x)
    x <- paste0(x, collapse = "")
    x <- paste0("<md_container>", x, "</md_container>")
  }

  if (!grepl("^<md_container>.*</md_container>$", x)) {
    x <- parse_to_ooxml_simple(enc2utf8(htmltools::htmlEscape(x)), ooxml_type)
  }

  parsed_xml_contents <- suppressWarnings(read_xml(add_ns(x, ooxml_type)))
  xml_children(parsed_xml_contents)
}

parse_to_ooxml_simple <- function(text = "", ooxml_type = "word") {
  switch_ooxml(ooxml_type,
    word = glue::glue('
<md_container>
  <w:p>
    <w:pPr>
      <w:spacing w:before="0" w:after="60"/>
    </w:pPr>
    <w:r>
      <w:rPr/>
      <w:t xml:space="default">{text}</w:t>
    </w:r>
  </w:p>
</md_container>'),

    pptx = glue::glue('
<md_container>
  <a:p>
    <a:pPr>
      <a:spcBef>
      <a:spcPts val="0"/>
        </a:spcBef>
      <a:spcAft>
        <a:spcPts val="300"/>
      </a:spcAft>
    </a:pPr>
    <a:r>
      <a:rPr lang="en-US"/>
      <a:t>{text}</a:t>
    </a:r>
  </a:p>
</md_container>')
  )
}

# process cell content ----------------------------------------------------

process_cell_content_ooxml <- function(
  ooxml_type = c("word", "pptx"),
  x,
  ...,

  # text
  whitespace = c("default", "preserve"),

  # run
  font = NULL ,  font_default = "Calibri",
  size = NULL ,  size_default = 20,
  color = NULL,  color_default = NULL,
  style = NULL,  style_default = NULL,
  weight = NULL, weight_default = NULL,
  stretch = NULL,

  # paragraph
  align = NULL, align_default = NULL,
  keep_with_next = TRUE,
  paragraph_style = NULL,

  # ...
  cell_style = NULL

) {
  rlang::check_dots_empty()
  ooxml_type <- rlang::arg_match(ooxml_type)

  font   <- font   %||% cell_style[["cell_text"]][["font"]]   %||% font_default
  size   <- size   %||% cell_style[["cell_text"]][["size"]]   %||% size_default
  color  <- color  %||% cell_style[["cell_text"]][["color"]]  %||% color_default
  style  <- style  %||% cell_style[["cell_text"]][["style"]]  %||% style_default
  weight <- weight %||% cell_style[["cell_text"]][["weight"]]  %||% weight_default

  whitespace <- cell_style[["cell_text"]][["whitespace"]] %||% whitespace

  processed <- parse_to_ooxml(x, ooxml_type = ooxml_type)

  processed <- process_ooxml__paragraph(ooxml_type, nodes = processed,
    align          = align %||% cell_style[["cell_text"]][["align"]] %||% align_default,
    keep_with_next = keep_with_next,
    style          = paragraph_style,
    color          = color
  )

  processed <- process_ooxml__run(ooxml_type, nodes = processed,
    font       = font ,
    size       = size,
    color      = color,
    style      = style,
    weight     = weight,
    stretch    = stretch
  )

  processed <- process_ooxml__text(ooxml_type, nodes = processed, whitespace = whitespace)

  processed <- process_ooxml__white_space_br(ooxml_type, processed,
    whitespace = whitespace,

    font       = font ,
    size       = size,
    color      = color,
    style      = style,
    weight     = weight,
    stretch    = stretch
  )

  # TODO
  # processed <- process_drop_empty_styling_nodes(processed)

  processed
}

process_ooxml__white_space_br <- function(ooxml_type, x,
  whitespace = NULL,

  font = NULL,
  size = NULL,
  color = NULL,
  style = NULL,
  weight = NULL,

  stretch = NULL
) {

  fun <- switch_ooxml(ooxml_type,
    word = process_ooxml__white_space_br_word,
    pptx = process_ooxml__white_space_br_pptx
  )

  fun(x,
    whitespace = whitespace,

    font       = font ,
    size       = size,
    color      = color,
    style      = style,
    weight     = weight,
    stretch    = stretch
  )
}

process_ooxml__white_space_br_word <- function(x,
  whitespace = NULL,

  font = NULL,
  size = NULL,
  color = NULL,
  style = NULL,
  weight = NULL,

  stretch = NULL
) {

  ## Options for white space: normal, nowrap, pre, pre-wrap, pre-line, break-spaces
  ## normal drops all newlines and collapse spaces
  ## general behavior based on: https://developer.mozilla.org/en-US/docs/Web/CSS/white-space

  ## Remove newlines (br) unless preserving it
  if (!isTRUE(whitespace %in% c("pre", "pre-wrap", "pre-line", "break-spaces"))) {

    paragraphs <- xml_find_all(x, "//w:p")

    replacement_br <- as_xml_node(create_ns = TRUE, ooxml_tag("w:r",
      ooxml_tag("w:rPr"),
      ooxml_tag("w:t", "xml:space" = "preserve", " ")
    ))

    replacement_br <- process_ooxml__text("word", replacement_br,
      whitespace = whitespace
    )

    replacement_br <- process_ooxml__run("word", replacement_br,
      font       = font ,
      size       = size,
      color      = color,
      style      = style,
      weight     = weight,
      stretch    = stretch
    )

    replacement_br <- replacement_br[[1]]

    for (p in paragraphs) {

      paragraph_children <- xml_children(p)

      break_tags_locs <- which(xml_name(paragraph_children, ns = xml_ns(x)) == "w:br")
      run_tags_locs <-  which(xml_name(paragraph_children, ns = xml_ns(x)) == "w:r")

      if (length(break_tags_locs) > 0L) {
        for (break_tag_loc in break_tags_locs) {

          break_tag <- paragraph_children[[break_tag_loc]]

          ## if the br is between two runs, replace with space
          if (any(run_tags_locs > break_tag_loc) && any(run_tags_locs < break_tag_loc)) {
            xml_add_sibling(break_tag, replacement_br, .where = "after")
          }

          xml_remove(break_tag)
        }
      }
    }
  }

  x
}

process_ooxml__white_space_br_pptx <- function(x,
  whitespace = NULL,

  font = NULL,
  size = NULL,
  color = NULL,
  style = NULL,
  weight = NULL,

  stretch = NULL
) {

  ## Options for white space: normal, nowrap, pre, pre-wrap, pre-line, break-spaces
  ## normal drops all newlines and collapse spaces
  ## general behavior based on: https://developer.mozilla.org/en-US/docs/Web/CSS/white-space

  ## Remove newlines (br) unless preserving it
  if (!isTRUE(whitespace %in% c("pre", "pre-wrap", "pre-line", "break-spaces"))) {

    paragraphs <- xml_find_all(x, "//a:p")

    replacement_br <- as_xml_node(create_ns = TRUE, ooxml_type = "pptx", ooxml_tag("a:r",
      ooxml_tag("a:rPr"),
      ooxml_tag("a:t", "xml:space" = "preserve", " ")
    ))

    replacement_br <- process_ooxml__text("pptx", replacement_br,
      whitespace = whitespace
    )

    replacement_br <- process_ooxml__run("pptx", replacement_br,
      font       = font ,
      size       = size,
      color      = color,
      style      = style,
      weight     = weight,
      stretch    = stretch
    )

    replacement_br <- replacement_br[[1]]

    for (p in paragraphs) {

      paragraph_children <- xml_children(p)

      break_tags_locs <- which(xml_name(paragraph_children, ns = xml_ns(x)) == "a:br")
      run_tags_locs <-  which(xml_name(paragraph_children, ns = xml_ns(x)) == "a:r")

      if (length(break_tags_locs) > 0L) {
        for (break_tag_loc in break_tags_locs) {

          break_tag <- paragraph_children[[break_tag_loc]]

          ## if the br is between two runs, replace with space
          if (any(run_tags_locs > break_tag_loc) && any(run_tags_locs < break_tag_loc)) {
            xml_add_sibling(break_tag, replacement_br, .where = "after")
          }

          xml_remove(break_tag)
        }
      }
    }
  }

  x
}



process_ooxml__text <- function(ooxml_type, nodes, whitespace = "default") {
  nodes_text <- xml_find_all(nodes, switch_ooxml(ooxml_type, word = "//w:t", pptx = "//a:t"))
  for (txt in nodes_text) {
    content <- xml_text(txt)
    attr    <- xml_attr(txt, "space")

    # If it's already set to preserve, respect preservation
    if (!identical(attr, "preserve")) {
      ## options for white space: normal, nowrap, pre, pre-wrap, pre-line, break-spaces
      ## normal drops all newlines and collapse spaces
      ## general behavior based on: https://developer.mozilla.org/en-US/docs/Web/CSS/white-space

      ## collapse white spaces unless preserving it
      if (!isTRUE(whitespace %in% c( "pre", "pre-wrap", "break-spaces"))) {
        content <- gsub("\\s+|\\t+", " ", content)
        xml_text(txt) <- content
      }

      spacing <- if (isTRUE(whitespace %in% c( "pre", "pre-wrap", "pre-line","break-spaces"))) {
        "preserve"
      } else {
        "default"
      }
      xml_set_attr(txt, "xml:space", spacing)


    }
  }

  nodes
}

process_ooxml__run <- function(ooxml_type, nodes,
  font = NULL,
  size = NULL,
  color = NULL,
  style = NULL,
  weight = NULL,

  stretch = NULL
) {

  switch_ooxml(ooxml_type,
    word = process_ooxml__run_word(nodes, font = font, size = size, color = color, style = style, weight = weight, stretch = stretch),
    pptx = process_ooxml__run_pptx(nodes, font = font, size = size, color = color, style = style, weight = weight, stretch = stretch),
  )

}

process_ooxml__run_word <- function(nodes, font, size, color, style, weight, stretch) {

  nodes_run <- xml_find_all(nodes, "//w:r")
  for (run in nodes_run) {
    run_image <- xml_find_first(run, ".//w:drawing")
    run_style <- xml_find_first(run, ".//w:rPr")

    if (length(run_image) > 0L) {

      if (length(xml_find_first(run, ".//w:noProof")) == 0L) {
        xml_add_child(run_style, "w:noProof")
      }

    } else {
      # add styles if not already present
      children <- xml_children(run_style)
      names    <- xml_name(children, ns = xml_ns(nodes))

      if (!"w:rFonts" %in% names) {
        xml_add_child(run_style, "w:rFonts", "w:ascii" = font, "w:hAnsi" = font)
      }

      if (!"color" %in% names && !is.null(color)) {
        color <- toupper(gsub("#", "", color))
        xml_add_child(run_style, "w:color", "w:val" = color)
      }

      if (!"italic" %in% names && identical(style, "italic")) {
        xml_add_child(run_style, "w:i")
      }

      if (!"weight" %in% names && identical(weight, "bold")) {
        xml_add_child(run_style, "w:b")
      }

      if (!"spacing" %in% names && !is.null(stretch)) {
        xml_add_child(run_style, "w:space", "w:val" = stretch_to_xml_stretch(stretch))
      }

      if (!"w:sz" %in% names) {
        xml_add_child(run_style, "w:sz", "w:val" = size)
      }

    }

  }

  nodes
}

process_ooxml__run_pptx <- function(nodes, font, size, color, style, weight, stretch) {

  nodes_run <- xml_find_all(nodes, "//a:r")

  for (run in nodes_run) {
    run_image <- xml_find_first(run, ".//a:drawing")
    run_style <- xml_find_first(run, ".//a:rPr")

    if (length(run_image) > 0L) {
      cli::cli_abort("images not yet supported in pptx")
    } else {
      # add styles if not already present
      children <- xml_children(run_style)
      names    <- xml_name(children, ns = xml_ns(nodes))
      attrs_names <- names(xml_attrs(run_style))

      if (!"latin" %in% names) {
        xml_add_child(run_style, "a:latin", "typeface" = font)
      }

      if (!"i" %in% attrs_names && identical(style, "italic")) {
        xml_set_attr(run_style, "i", "1")
      }

      if (!"b" %in% attrs_names && identical(weight, "bold")) {
        xml_set_attr(run_style, "b", "1")
      }

      if (!is.null(stretch)) {
        xml_set_attr(run_style, "spc", stretch_to_xml_stretch(stretch) * 50)
      }

      if (!"sz" %in% attrs_names && !is.null(size)) {
        xml_set_attr(run_style, "sz", size * 50)
      }

    }

  }

  nodes
}

process_ooxml__paragraph <- function(ooxml_type, nodes, align = NULL, keep_with_next = TRUE, style = NULL, color = NULL) {
  switch_ooxml(ooxml_type,
    word = process_ooxml__paragraph_word(nodes, align = align, keep_with_next = keep_with_next, style = style, color = color),
    pptx = process_ooxml__paragraph_pptx(nodes, align = align, keep_with_next = keep_with_next, style = style, color = color),
  )
}

process_ooxml__paragraph_word <- function(nodes, align = NULL, keep_with_next = TRUE, style = NULL, color) {
  nodes_p <- xml_find_all(nodes, "//w:p")

  # if there are no paragraph, add an empty one
  if (length(nodes_p) == 0) {
    xml_add_child(nodes, "w:p")
    xml_add_child(xml_find_first(nodes, ".//w:p"), "w:pPr")
    nodes_p <- xml_find_all(nodes, "//w:p")
  }

  for (p in nodes_p) {
    # no extra processing when there are images
    if (length(xml_find_first(p, ".//w:drawing")) > 0L){
      next
    }

    pPr      <- xml_find_all(p, ".//w:pPr")
    children <- xml_children(pPr)
    names    <- xml_name(children)

    if (!"spacing" %in% names) {
      xml_add_child(pPr, "w:spacing", "before" = 0, "after" = 60)
    }

    if (isTRUE(keep_with_next)) {
      if (!"keepNext" %in% names) {
        xml_add_child(pPr, "w:keepNext")
      }
    } else {
      if ("keepNext" %in% names) {
        xml_remove(xml_find_first(pPr, ".//w:keepNext"))
      }
    }

    if (!is.null(align)) {
      val <- arg_match_names(align, c(left = "start", right = "end", center = "center"))

      if ("jc" %in% names) {
        xml_set_attr(xml_find_first(pPr, ".//w:jc"), "w:val", val)
      } else {
        xml_add_child(pPr, "w:jc", "w:val" = val)
      }

    }

    if (!"pStyle" %in% names && !is.null(style)) {
      xml_add_child(pPr, "w:pStyle", "w:val" = style)
    }

  }

  nodes
}

process_ooxml__paragraph_pptx <- function(nodes, align, stretch, keep_with_next, style, color) {
  nodes_p <- xml_find_all(nodes, "//a:p")

  # if there are no paragraph, add an empty one
  if (length(nodes_p) == 0) {
    xml_add_child(nodes, "w:p")
    xml_add_child(xml_find_first(nodes, ".//a:p"), "a:pPr")
    nodes_p <- xml_find_all(nodes, "//a:p")
  }

  for (p in nodes_p) {

    if (length(xml_find_first(p, ".//a:drawing")) > 0L){
      cli::cli_abort("drawing are not supported yet in pptx")
    }

    pPr        <- xml_find_all(p, ".//a:pPr")
    children   <- xml_children(pPr)
    names      <- xml_name(children)

    if (!"defRPr" %in% names && !is.null(color)) {
      color <- as_hex_code(color)
      node <- as_xml_node(glue::glue('<a:defRPr><a:solidFill><a:srgbClr val="{color}"/></a:solidFill></a:defRPr>'), create_ns = TRUE, ooxml_type = "pptx")[[1]]
      xml_add_child(pPr, node, .where = 0)
    }

    if (!"spcBef" %in% names) {
      xml_add_child(pPr, as_xml_node('<a:spcBef><a:spcPts val="0" /></a:spcBef>', create_ns = TRUE, ooxml_type = "pptx"))
    }

    if (!"spcAft" %in% names) {
      xml_add_child(pPr, as_xml_node('<a:spcAft><a:spcPts val="300"/></a:spcAft>', create_ns = TRUE, ooxml_type = "pptx"))
    }

    if (!is.null(align)) {
      val <- arg_match_names(align, c(left = "l", right = "r", center = "ctr"))
      xml_set_attr(pPr, "algn", val)
    }

  }

  nodes
}

to_tags <- function(nodeset) {
  tags <- lapply(nodeset, \(node) {
    htmltools::HTML(as.character(node))
  })
  tagList(!!!tags)
}

fmt_image_ooxml <- function(ooxml_type, x, height = NULL, width = NULL, file_pattern = NULL, path = NULL) {
  switch_ooxml(ooxml_type,
    word = fmt_image_ooxml_word(x, height = height, width = width, file_pattern = file_pattern, path = path),
    pptx = fmt_image_ooxml_pptx(x, height = height, width = width, file_pattern = file_pattern, path = path)
  )
}

auto_px <- function(x) {
  if (!is.null(x)) {
    if (is.numeric(x)) {
      x <- paste0(x, "px")
    } else {
      if (is.character(x)) {
        x <- convert_to_px(x)
      }
    }
  }
  x
}

fmt_image_ooxml_word <- function(x, height = NULL, width = NULL, file_pattern = NULL, path = NULL) {
  x_str <- character(length(x))
  x_str_non_missing <- x[!is.na(x)]

  # Automatically append `px` length unit when `height` or `width`
  # is given as a number

  height <- auto_px(height)
  width  <- auto_px(width)

  x_str_non_missing <-
    vapply(
      seq_along(x_str_non_missing),
      FUN.VALUE = character(1L),
      USE.NAMES = FALSE,
      FUN = function(x) {

        if (grepl(",", x_str_non_missing[x], fixed = TRUE)) {
          files <- unlist(strsplit(x_str_non_missing[x], ",\\s*"))
        } else {
          files <- x_str_non_missing[x]
        }

        # Handle formatting of `file_pattern`
        files <- apply_pattern_fmt_x(pattern = file_pattern, values = files)

        out <- list()

        out <- lapply(seq_along(files), function(y) {
          # Handle case where the image is online
          if ((!is.null(path) && grepl("https?://", path)) || grepl("https?://", files[y])) {

            if (!is.null(path)) {

              # Normalize ending of `path`
              path <- gsub("/\\s+$", "", path)
              uri <- paste0(path, "/", files[y])

            } else {
              uri <- files[y]
            }

            filename <- download_file(uri)

          } else {

            # Compose and normalize the local file path
            filename <- gtsave_filename(path = path, filename = files[y])
            filename <- path_expand(filename)
          }

          if (is.null(height) || is.null(width)) {

            hw_ratio <- get_image_hw_ratio(filename)

            if (is.null(width)) {
              width <- round(height / hw_ratio, 0)
            } else {
              height <- round(width * hw_ratio, 0)
            }
          }

          ooxml_tag("w:r",
            ooxml_tag("w:rPr"),
            ooxml_image("word", filename, height = height, width = width, units = "px")
          )
        })

        p <- ooxml_tag("w:p", ooxml_tag("w:pPr"), !!!out)
        paste0("<md_container>", as.character(p), "</md_container>")
      }
    )

  x_str[!is.na(x)] <- x_str_non_missing
  x_str[is.na(x)] <- NA_character_

  x_str
}

fmt_image_ooxml_pptx <- function(x, height = NULL, width = NULL, file_pattern = NULL, path = NULL) {
  x_str <- character(length(x))
  x_str_non_missing <- x[!is.na(x)]

  x_str_non_missing <-
    vapply(
      seq_along(x_str_non_missing),
      FUN.VALUE = character(1L),
      USE.NAMES = FALSE,
      FUN = function(x) {

        if (grepl(",", x_str_non_missing[x], fixed = TRUE)) {
          files <- unlist(strsplit(x_str_non_missing[x], ",\\s*"))
        } else {
          files <- x_str_non_missing[x]
        }

        # Handle formatting of `file_pattern`
        files <- apply_pattern_fmt_x(pattern = file_pattern, values = files)

        out <- list()

        out <- lapply(seq_along(files), function(y) {
          # Handle case where the image is online
          if ((!is.null(path) && grepl("https?://", path)) || grepl("https?://", files[y])) {

            if (!is.null(path)) {

              # Normalize ending of `path`
              path <- gsub("/\\s+$", "", path)
              uri <- paste0(path, "/", files[y])

            } else {
              uri <- files[y]
            }

            filename <- uri

          } else {

            # Compose and normalize the local file path
            filename <- gtsave_filename(path = path, filename = files[y])
            filename <- path_expand(filename)
          }

          ooxml_tag("a:r",
            ooxml_tag("a:rPr"),
            ooxml_tag("a:t", paste0("image: ", filename))
          )
        })

        p <- ooxml_tag("a:p", ooxml_tag("a:pPr"), !!!out)
        paste0("<md_container>", as.character(p), "</md_container>")
      }
    )

  x_str[!is.na(x)] <- x_str_non_missing
  x_str[is.na(x)] <- NA_character_

  x_str
}

# markdown to ooxml ----------------------------------------------------

markdown_to_ooxml <- function(text, ooxml_type = c("word", "pptx")) {

  rules <- switch_ooxml(ooxml_type,
    word = cmark_rules_xml,
    pptx = cmark_rules_ooxml_pptx
  )

  res <- gsub("<br>", "\n\n", as.character(text))
  sapply(res, USE.NAMES = FALSE, function(x) {
    cmark <- commonmark::markdown_xml(x)
    xml   <- read_xml(cmark)
    if (!identical(xml2::xml_name(xml), "document")) {
      cli::cli_abort("Unexpected result from markdown parsing: `document` element not found")
    }
    children <- xml2::xml_children(xml)

    apply_rules <- function(x, ...) {

      if (inherits(x, "xml_nodeset")) {
        results <- lapply(x, apply_rules)
        rlang::exec(paste, !!!results, collapse = "\n")
      } else {

        output <- if (xml2::xml_type(x) == "element") {

          rule <- rules[[xml2::xml_name(x)]]

          if (is.null(rule)) {

            # rlang::warn(
            cli::cli_abort(
              "Unknown commonmark element encountered: {.val {xml2::xml_name(x)}}",
              .frequency = "once",
              .frequency_id = "gt_commonmark_unknown_element"
            )

            apply_rules(xml2::xml_children(x), ...)

          } else if (is.function(rule)) {
            rule(x, apply_rules, ...)
          }
        }
        paste0(output, collapse = "")
      }
    }

    res <- lapply(children, apply_rules)
    res <-  paste0(res, collapse = "")
    paste0("<md_container>", res, "</md_container>")
  })
}


cmark_rules_ooxml_pptx <- list2(

  text = function(x, process, ...) {
    txt <- enc2utf8(as.character(htmltools::htmlEscape(xml2::xml_text(x))))
    glue::glue('<a:r><a:rPr/><a:t xml:space = "preserve">{txt}</a:t></a:r>')
  },
  paragraph = function(x, process, ...) {
    runs <- paste(lapply(xml2::xml_children(x), process), collapse = "")
    glue::glue('<a:p><a:pPr/>{runs}</a:p>')
  },
  strong = function(x, process, ...) {
    res <- as_xml_node(process(xml_children(x), ...), create_ns = TRUE, ooxml_type = "pptx")
    xml_set_attr(xml_find_all(res, ".//a:rPr"), "b", "1")
    as.character(res)
  },
  emph = function(x, process, ...) {
    res <- as_xml_node(process(xml_children(x), ...), create_ns = TRUE, ooxml_type = "pptx")
    xml_set_attr(xml_find_all(res, ".//a:rPr"), "i", "1")
    as.character(res)
  },
  image = function(x, process, ...) {
    destination <- xml_attr(x, "destination")
    glue::glue('<a:r><a:rPr/><a:t xml:space = "preserve">image: {destination}</a:t></a:r>')
  },
  code = function(x, process, ...) {
    txt <- xml2::xml_text(x)
    glue::glue('<a:r><a:rPr><a:latin typeface="Consolas"/></a:rPr><a:t xml:space = "preserve">{txt}</a:t></a:r>')
  },
  link = function(x, process, ...) {
    # TODO: later: use hlinkClick rel= and update the .rels file
    destination <- xml_attr(x, "destination") %||% ""
    text <- xml2::xml_text(x) %||% ""

    glue::glue('
<a:r>
  <a:rPr>
    <a:solidFill>
      <a:srgbClr val="0563C1"/>
    </a:solidFill>
    <a:u/>
  </a:rPr>
  <a:t>{destination}</a:t>
</a:r>
    ')
  },

  heading = function(x, process, ...) {
    heading_sizes <- c(36, 32, 28, 24, 20, 16)
    fs <- heading_sizes[as.numeric(xml2::xml_attr(x, attr = "level"))]
    res <- as_xml_node(process(xml2::xml_children(x)), create_ns = TRUE, ooxml_type = "pptx")
    xml_set_attr(xml_find_all(res, ".//a:rPr"), "sz", fs * 50)
    glue::glue('<a:p><a:pPr/>{as.character(res)}</a:p>')
  },

  item = function(x, process, ...) {
    item_contents <- lapply(xml2::xml_children(x), process, ...)
    unlist(item_contents)
  },

  list = function(x, process, ..., indent_level = 0, type = "bullet") {
    type <- xml2::xml_attr(x, attr = "type")
    children <- xml2::xml_children(x)

    content <- lapply(seq_along(children), function(child_idx) {
      child <- children[[child_idx]]

      li_content <- process(child, indent_level = indent_level + 1, type = type)
      li_content <- as_xml_node(li_content, create_ns = TRUE, ooxml_type = "pptx")

      paragraph_style <- xml_find_first(li_content, ".//a:pPr")[[1]]
      xml_set_attr(paragraph_style, "lvl", indent_level)
      if (identical(type, "bullet")) {
        xml_add_child(paragraph_style, "a:buChar", char = "-")
      } else if (identical(type, "ordered")) {
        xml_add_child(paragraph_style, "a:buAutoNum", type = "arabicPeriod")
      }
      paste0(li_content, collapse = "")
    })
    paste(content, collapse = "")
  },
  softbreak = function(x, process, ...) {
    glue::glue('<a:r><a:t xml:space="preserve"> </a:t></a:r>')
  }

  #------- TODO: later
  #,

  # thematic_break = function(x, process, ...) {
  #   res <- xml_p(
  #     xml_pPr(
  #       xml_keepNext(),
  #       xml_pBdr(
  #         xml_border(dir = "bottom", type = "single", size = 6, space = 1, color = "auto")
  #       ),
  #       xml_spacing(after = 60)
  #     )
  #   )
  #   as.character(res)
  # },

  # ## code sections
  #
  # code_block = function(x, process, ...) {
  #   ##split text up by new line
  #   text <- strsplit(xml2::xml_text(x), split = "\n")[[1]]
  #   code_text <- lapply(text, function(line) {
  #     xml_t(line, xml_space = "preserve")
  #   })
  #   res <- xml_p(xml_pPr(xml_pStyle(val = "Macro Text")),
  #         xml_r(xml_rPr(),
  #               paste0(
  #                 vapply(code_text,
  #                        FUN = paste,
  #                        FUN.VALUE = character(1L)),
  #                 collapse = "<w:br/>"
  #               )))
  #   as.character(res)
  # },
  #
  # ## line breaks
  # linebreak = function(x, process, ...) {
  #   xml_br()
  # },
  #
  # html_inline = function(x, process, ...) {
  #
  #   tag <- xml2::xml_text(x)
  #
  #   match <- str_get_match(tag, pattern = "^<(/?)([a-zA-Z0-9\\-]+)")
  #
  #   if (!is.na(match[1, 1])) {
  #
  #     span_map <-
  #       c(
  #         sup = "super",
  #         sub = "sub",
  #         strong = "b",
  #         b = "b",
  #         em = "i",
  #         i = "i",
  #         code = "f1"
  #       )
  #
  #     key_map <- c(br = "line")
  #
  #     is_closing <- match[1, 2] == "/"
  #     tag_name <- match[1, 3]
  #
  #     if (!is_closing) {
  #
  #       if (tag_name %in% names(key_map)) {
  #
  #         return(rtf_key(key_map[tag_name], space = TRUE))
  #
  #       } else if (tag_name %in% names(span_map)) {
  #
  #         return(
  #           rtf_paste0(
  #             rtf_raw("{"),
  #             rtf_key(span_map[tag_name], space = TRUE)
  #           )
  #         )
  #       }
  #
  #     } else {
  #
  #       if (tag_name %in% names(span_map)) {
  #         return(rtf_raw("}"))
  #       }
  #     }
  #   }
  #
  #   # Any unrecognized HTML tags are stripped, returning nothing
  #   return(rtf_raw(""))
  # },
  #
  # html_block = function(x, process, ...) {
  #   res <- xml_p(
  #     xml_pPr(),
  #     xml_r(xml_rPr(),
  #           xml_t(
  #             enc2utf8(as.character(xml2::xml_text(x))),
  #             xml_space = "preserve")
  #     )
  #   )
  #   as.character(res)
  # },
  #
  # block_quote = function(x, process, ...) {
  #   # TODO: Implement
  #   process(xml2::xml_children(x))
  # }
)

gt_as_pptx_post_processing <- function(path) {
  temp_dir <- tempfile()
  on.exit(unlink(temp_dir, recursive = TRUE))
  unzip(path, exdir = temp_dir)

  ooxml_tableStyles_path <- file.path(temp_dir, "ppt", "tableStyles.xml")
  xml_styles <- read_xml(ooxml_tableStyles_path)
  tbl_styles <- xml_attr(xml_styles, "def")

  slides <- list.files(file.path(temp_dir, "ppt", "slides"), full.names = TRUE, pattern = "^slide")
  for (i in seq_along(slides)) {
    xml <- read_xml(slides[i])
    styles <- xml_find_all(xml, ".//a:tableStyleId")

    for (style in styles) {
      if (xml_text(style) %in% tbl_styles) {
        xml_set_text(style, tbl_styles[1])
      }
    }

    if (length(xml_find_all(xml, ".//p:clrMapOvr")) == 0) {
      xml_add_child(xml, "p:clrMapOvr")
      xml_add_child(xml_find_all(xml, ".//p:clrMapOvr"), "a:masterClrMapping")
    }
    write_xml(xml, slides[i])

  }

  old <- setwd(temp_dir)
  zip(path, files = list.files(temp_dir, recursive = TRUE), flags = "-q")
  setwd(old)

  path
}


