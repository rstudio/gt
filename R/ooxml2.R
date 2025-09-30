#' @importFrom grDevices col2rgb rgb
NULL

# Tables ----------------------------------------------------------

ooxml_tbl <- function(ooxml_type, properties = NULL, grid = NULL, ...) {
  rows <- ooxml_list(ooxml_type, "ooxml_tbl_row", ooxml_tbl_row, ...)

  switch_ooxml(ooxml_type,
    word = {
      ooxml_tag("w:tbl", tag_class = "ooxml_tbl",
        "xmlns:w" = "http://schemas.openxmlformats.org/wordprocessingml/2006/main",
        "xmlns:wp" = "http://schemas.openxmlformats.org/drawingml/2006/wordprocessingDrawing",
        "xmlns:r" = "http://schemas.openxmlformats.org/officeDocument/2006/relationships",
        "xmlns:w14" = "http://schemas.microsoft.com/office/word/2010/wordml",

        check_inherits(properties, "ooxml_tbl_properties", accept_null = TRUE),
        check_inherits(grid, "ooxml_tbl_grid", accept_null = TRUE),

        !!!rows
      )
    }
  )
}

# ooxml_tbl_cell ----------------------------------------------------------

ooxml_tbl_cell <- function(ooxml_type, ..., properties = NULL) {
  content    <- ooxml_list(ooxml_type, "ooxml_paragraph", ooxml_paragraph, ...)
  properties <- check_inherits(properties, "ooxml_tbl_cell_properties", accept_null = TRUE)

  switch_ooxml(ooxml_type,
    word = ooxml_tag("w:tc", tag_class = "ooxml_tbl_cell",
      properties, !!!content
    ),
    pptx = ooxml_tag("a:tc", tag_class = "ooxml_tbl_cell",
      properties,
      ooxml_tag("a:txBody", tag_class = "ooxml_text_body",
        ooxml_tag(tag = "a:bodyPr"),
        ooxml_tag(tag = "a:lstStyle"),
        !!!content
      )
    )
  )
}

# ooxml_tbl_cell_properties --------------------------------------------------------------

ooxml_tbl_cell_properties <- function(ooxml_type, ..., borders = NULL, fill = NULL, margins = NULL, row_span = NULL, col_span = NULL, v_align = NULL) {
  rlang::check_dots_empty()

  margins  <- ooxml_tbl_cell_margins(ooxml_type, margins)
  borders  <- ooxml_cell_borders(ooxml_type, borders)
  fill     <- ooxml_fill(ooxml_type, fill)
  v_merge  <- ooxml_vMerge(ooxml_type, row_span)
  v_align  <- ooxml_vAlign(ooxml_type, v_align)
  gridSpan <- ooxml_gridSpan(ooxml_type, col_span)

  tag <- switch_ooxml_tag(ooxml_type, "tcPr")
  ooxml_tag(tag, tag_class = "ooxml_tbl_cell_properties",
    margins,
    borders,
    fill,
    v_merge,
    v_align,
    gridSpan
  )
}

# ooxml_paragraph -----------------------------------------------------------------

ooxml_paragraph <- function(ooxml_type, ..., properties = NULL) {
  runs <- ooxml_list(ooxml_type, "ooxml_run", ooxml_run, ...)

  tag <- switch_ooxml_tag(ooxml_type, "p")
  ooxml_tag(tag, tag_class = "ooxml_paragraph", !!!runs)
}

# ooxml_run ---------------------------------------------------------------

ooxml_run <- function(ooxml_type, x, ..., properties = NULL) {
  rlang::check_dots_empty()

  tag <- switch_ooxml_tag(ooxml_type, "r")
  ooxml_tag(tag, tag_class = "ooxml_run",
    ooxml_text(ooxml_type, x),
    check_inherits(properties, "ooxml_run_properties", accept_null = TRUE)
  )
}

# ooxml_run_properties ----------------------------------------------------

ooxml_run_properties <- function(ooxml_type,
  ...,
  font   = cell_style[["cell_text"]][["font"]],
  style  = cell_style[["cell_text"]][["style"]],
  size   = cell_style[["cell_text"]][["size"]] %||% 5,
  color  = cell_style[["cell_text"]][["color"]],
  weight = NULL,
  cell_style
){
  rlang::check_dots_empty()

  tag <- switch_ooxml_tag(ooxml_type, "rPr")
  ooxml_tag(tag, tag_class = "ooxml_run_properties",
    ooxml_font(ooxml_type, font),
    ooxml_size(ooxml_type, size),
    ooxml_color(ooxml_type, color),
    ooxml_style(ooxml_type, style),
    ooxml_weight(ooxml_type, weight)
  )
}

# ooxml_text --------------------------------------------------------------

ooxml_text <- function(ooxml_type, x, ..., space = c("default", "preserve")) {
  if (inherits(x, "ooxml_text")) {
    return(x)
  }
  rlang::check_dots_empty()

  tag <- switch_ooxml_tag(ooxml_type, "t")
  ooxml_tag(tag, tag_class = "ooxml_text",
    ooxml_space_attr(space),
    htmltools::HTML(format(x))
  )
}

# ooxml_cell_borders ------------------------------------------------------

ooxml_cell_borders <- function(ooxml_type, border = NULL) {
  if (is.null(border)) {
    return(NULL)
  }

  xml_border <- lapply(c("top", "bottom", "left", "right"), function(location) {
    if (is.null(border[[location]])) {
      return(NULL)
    }

    x <- border[[location]]
    rlang::exec(ooxml_cell_border, ooxml_type = ooxml_type, location = location, !!!x)
  })

  tag <- switch_ooxml_tag(ooxml_type, word = "tcBorders", pptx = "tcBdr")
  ooxml_tag(tag, tag_class = "ooxml_cell_borders", !!!xml_border)
}

# ooxml_cell_border -------------------------------------------------------

ooxml_cell_border <- function(ooxml_type, ..., location, color = "black", size = NULL, type = "solid") {
  rlang::check_dots_empty()

  switch_ooxml(ooxml_type,
    word = {
      tag      <- arg_match_names(location, c("top" = "w:top", "left" = "w:start", "bottom" = "w:bottom", "right" = "w:end"))
      color    <- as_hex_code(color)
      size     <- check_between(size, min = .25, max = 12, default = 4)
      type     <- arg_match_names(type, c("solid" = "single", "dashed" = "dashed", "dotted" = "dotted", "hidden" = "none", "double" = "double"))

      ooxml_tag(tag, tag_class = "ooxml_cell_border",
        `w:color` = color,
        `w:size`  = size * 8, # size is in 1/8 points
        `w:val`   = type
      )
    },
    pptx = {
      tag <- arg_match_names(location, c("top"="a:lnT","left"="a:lnL","bottom"="a:lnB","right"="a:lnR"))
      size     <- check_between(size, min = 0, max = 10, default = .5)
      style    <- convert_border_style_pptx(type)

      if (is.null(style[["compound"]])) {
        return(NULL)
      }

      dash <- if(!is.null(style[["dash_style"]])) {
        ooxml_tag("a:prstDash", `val` = style[["dash_style"]])
      }

      ooxml_tag(tag, tag_class = "ooxml_cell_border",
        `w`    = size * 12700,
        `cap`  = "flat",
        `cmpd` = style[["compound"]],
        `algn` = "ctr",

        dash,
        ooxml_fill(ooxml_type, color = color)
      )
    }
  )
}

border_style_pptx <- list(
  "solid"  = list(compound = "single", dash_style = NULL),
  "dashed" = list(compound = "single", dash_style = "dash"),
  "dotted" = list(compound = "single", dash_style = "dot"),
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

# ooxml_tbl_row -----------------------------------------------------------

ooxml_tbl_row <- function(ooxml_type, ..., is_header = FALSE, hidden = FALSE, height = 10) {
  content <- ooxml_list(ooxml_type, "ooxml_tbl_cell", ooxml_tbl_cell, ...)

  switch_ooxml(ooxml_type,
    word = {
      properties <- ooxml_tag("w:trPr", tag_class = "ooxml_tbl_row_properties",
        if (is_header) ooxml_tag("w:tblHeader"),
        if (hidden)    ooxml_tag("w:cantSplit"),
        ooxml_trHeight(ooxml_type, value = height)
      )
      ooxml_tag("w:tr", tag_class = "ooxml_tbl_row",
        properties,
        !!!content
      )
    },

    pptx = {
      ooxml_tag("a:tr", tag_class = "ooxml_tbl_row",
        ooxml_trHeight(ooxml_type, value = height),
        !!!content
      )
    }
  )
}

# ooxml_trHeight ----------------------------------------------------------

ooxml_trHeight <- function(ooxml_type, value, ..., error_call = current_env()) {
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
    # TODO: checks for row height in pptx
    attrs <- list(h = value)
    rlang::splice(attrs)
  }

  switch_ooxml(ooxml_type,
    word = word_trHeight(),
    pptx = pptx_trHeight(),
  )
}


# ooxml_tbl_properties ---------------------------------------------------------

ooxml_tbl_properties <- function(ooxml_type, ...) {
  switch_ooxml(ooxml_type,
    word = word_tbl_properties(...),
    pptx = pptx_tbl_properties(...)
  )
}

word_tbl_properties <- function(..., layout = c("autofit", "fixed"), justify = c("center", "start","end"), width="100%", look = c("First Row"), tableStyle=NULL) {
  rlang::check_dots_empty()

  if (!rlang::is_character(width, n = 1)) {
    cli::cli_abort("{.arg width} must be a scalar character value.")
  }
  if (!rlang::is_character(look)) {
    cli::cli_abort("{.arg look} must be a character vector.")
  }

  w_type <- "dxa"
  if (grepl("%$", width)){
    w_type <- "pct"
    width <- gsub("%$", "", width)
  }

  ooxml_tag("w:tblPr", tag_class = "ooxml_tbl_properties",
    ooxml_tag("w:tblLayout", "w:type" = rlang::arg_match(layout)),
    ooxml_tag("w:jc", "w:val" = rlang::arg_match(justify)),
    ooxml_tag("w:tblW", "w:type" = w_type, "w:w" = width),
    ooxml_tag("w:tblLook",
      "w:firstColumn" = as.numeric("first column" %in% look),
      "w:firstRow"    = as.numeric("first row" %in% look),
      "w:lastCol"     = as.numeric("last column" %in% look),
      "w:lastRow"     = as.numeric("last row" %in% look),
      "w:noVBand"     = as.numeric(!"banded columns" %in% look),
      "w:noHBand"     = as.numeric(!"banded rows" %in% look)
    )
  )
}

pptx_tbl_properties <- function(..., look = c("First Column","Banded Rows"), tableStyle = NA) {
  rlang::check_dots_empty()

  ooxml_tag("a:tblPr", tag_class = "ooxml_tbl_properties",
    "a:firstColumn" = as.numeric("first column" %in% look),
    "a:firstRow"    = as.numeric("first row" %in% look),
    "a:lastCol"     = as.numeric("last column" %in% look),
    "a:lastRow"     = as.numeric("last row" %in% look),
    "a:bandCol"     = as.numeric("banded columns" %in% look),
    "a:bandRow"     = as.numeric("banded rows" %in% look),

    ooxml_tag("a:tableStyleId", tableStyle)
  )
}


# ooxml_tblGrid -----------------------------------------------------------

ooxml_tblGrid <- function(ooxml_type, ...) {
  tag <- switch_ooxml_tag(ooxml_type, "tblGrid")
  gridCols <- lapply(list2(...), ooxml_gridCol, ooxml_type = ooxml_type)
  ooxml_tag(tag, tag_class = "ooxml_tbl_grid", !!!gridCols)
}

# ooxml_gridCol -----------------------------------------------------------

ooxml_gridCol <- function(ooxml_type = c("word", "pptx"), width = NULL) {
  tag <- switch_ooxml_tag(ooxml_type, "gridCol")
  ooxml_type <- rlang::arg_match(ooxml_type)
  att <- NULL
  if (is.null(width)) {
    ooxml_tag(tag)
  } else if (ooxml_type == "word") {
    ooxml_tag(tag, "w:w" = width)
  } else {
    ooxml_tag(tag, "w" = width)
  }
}

# ooxml_fill --------------------------------------------------------------

ooxml_fill <- function(ooxml_type, color = NULL) {
  if (is.null(color)) {
    return(NULL)
  }
  color <- as_hex_code(color)

  switch_ooxml(ooxml_type,
    word = ooxml_tag("w:shd", tag_class = "ooxml_fill",
      `w:val`   = "clear",
      `w:color` = "auto",
      `w:fill`  = color
    ),
    pptx = ooxml_tag("a:solidFill", tag_class = "ooxml_fill",
      ooxml_tag("a:srgbClr", color)
    )
  )
}

# ooxml_tbl_cell_margins --------------------------------------------------

ooxml_tbl_cell_margins <- function(ooxml_type, margins = NULL) {
  if (is.null(margins)) {
    return(NULL)
  }

  word_tbl_cell_margins <- function() {
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
    attrs_margins <- lapply(c("top", "bottom", "left", "right"), function(location) {
      if (is.null(margins[[location]])) {
        return(NULL)
      }
      margins[[location]]$width # TODO: should there be a multiplier here ?
    })

    names(attrs_margins) <- c("marT", "marB", "marL", "marR")
    attrs_margins <- attrs_margins[!sapply(attrs_margins, is.null)]

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

ooxml_vMerge <- function(ooxml_type, val = NULL) {
  if (is.null(val)) {
    return(NULL)
  }

  tag <- switch_ooxml_tag(ooxml_type, word = "vMerge")
  ooxml_tag(tag,
    "w:val" = rlang::arg_match(val, values = c("restart", "continue"))
  )
}

# ooxml_vAlign ------------------------------------------------------------

ooxml_vAlign <- function(ooxml_type, align = NULL) {
  if (is.null(align)) {
    return(NULL)
  }

  switch_ooxml(ooxml_type,
    word = ooxml_tag("w:vAlign", "w:val" = rlang::arg_match(align, values = c("top", "center", "bottom"))),
    pptx = ooxml_tag("a:anchor", arg_match_names(align, values = c("top" = "t", "center" = "ctr", "bottom" = "b")))
  )
}

# ooxml_gridSpan ----------------------------------------------------------

ooxml_gridSpan <- function(ooxml_type, col_span = NULL) {
  if (is.null(col_span)) {
    return(NULL)
  }

  switch_ooxml(ooxml_type,
    word = ooxml_tag("w:gridSpan", "w:val" = as.integer(col_span)),
    pptx = rlang::splice(list("gridSpan" = as.integer(col_span)))
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
    pptx = rlang::splice(list("sz" = check_scalar_integer(size) * 100))
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
    pptx = rlang::splice(list(i = "1"))
  )
}

# ooxml_weight --------------------------------------------------------------

ooxml_weight <- function(ooxml_type, weight = NULL) {
  if (!identical(weight, "bold")) {
    return(NULL)
  }

  switch_ooxml(ooxml_type,
    word = ooxml_tag("w:b"),
    pptx = rlang::splice(list(b = "1"))
  )
}

# ooxml_tag ---------------------------------------------------------------

ooxml_tag <- function(tag, ..., tag_class = tag) {
  varArgs <- list2(...)
  varArgs <- varArgs[!sapply(varArgs, is.null)]
  xml_tag <- htmltools::tag(`_tag_name` = tag, varArgs = varArgs)
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

check_between <- function(x = NULL, min, max, default, error_arg = caller_arg(x), error_call = caller_env()){
  if (is.null(x)){
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
  paste0("w:", suffix)
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

ooxml_space_attr <- function(space = c("default", "preserve")) {
  space <- rlang::arg_match(space)
  if (identical(space, "preserve")) rlang::splice(list("xml:space" = "preserve"))
}

