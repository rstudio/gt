#' @importFrom grDevices col2rgb rgb
NULL

# ooxml types --------------------------------------------------------------

ooxml_word <- function() {
  structure(list(), class = "ooxml_word")
}

ooxml_pptx <- function() {
  structure(list(), class = "ooxml_pptx")
}

# Tables ----------------------------------------------------------
ooxml_tbl <- function(ooxml_type, properties, grid, ...) {
  UseMethod("ooxml_tbl")
}

#' @export
ooxml_tbl.ooxml_word <- function(ooxml_type, properties = NULL, grid = NULL, ...) {
  rows <- ooxml_list(ooxml_type, "ooxml_tbl_row", ooxml_tbl_row, ...)
  ooxml_tag("w:tbl", tag_class = "ooxml_tbl",
    "xmlns:w" = "http://schemas.openxmlformats.org/wordprocessingml/2006/main",
    "xmlns:wp" = "http://schemas.openxmlformats.org/drawingml/2006/wordprocessingDrawing",
    "xmlns:r" = "http://schemas.openxmlformats.org/officeDocument/2006/relationships",
    "xmlns:w14" = "http://schemas.microsoft.com/office/word/2010/wordml",

    properties,
    grid,

    !!!rows
  )
}

# ooxml_tbl_cell ----------------------------------------------------------

ooxml_tbl_cell <- function(ooxml_type, ..., properties = NULL) {
  UseMethod("ooxml_tbl_cell")
}

#' @export
ooxml_tbl_cell.ooxml_word <- function(ooxml_type, ..., properties = NULL) {
  content <- ooxml_list(ooxml_type, "ooxml_paragraph", ooxml_paragraph, ...)

  ooxml_tag(
    "w:tc", tag_class = "ooxml_tbl_cell",
    check_inherits(properties, "ooxml_tbl_cell_properties", accept_null = TRUE),
    !!!content
  )
}

#' @export
ooxml_tbl_cell.ooxml_pptx <- function(ooxml_type, ..., properties = NULL) {
  content <- ooxml_list(ooxml_type, "ooxml_paragraph", ooxml_paragraph, ...)

  txBody  <- ooxml_tag("a:txBody", tag_class = "ooxml_text_body",
    ooxml_tag(tag = "a:bodyPr"),
    ooxml_tag(tag = "a:lstStyle"),
    !!!content
  )

  ooxml_tag("a:tc", tag_class = "ooxml_tbl_cell",
    check_inherits(properties, "ooxml_tbl_cell_properties", accept_null = TRUE),
    txBody
  )
}

# ooxml_tbl_cell_properties --------------------------------------------------------------

ooxml_tbl_cell_properties <- function(ooxml_type, ..., borders = NULL, fill = NULL, margins = NULL, row_span = NULL, col_span = NULL, v_align = NULL) {
  rlang::check_dots_empty()

  tag <- switch_ooxml_type(ooxml_type, word = "w:tcPr", pptx = "a:tcPr")

  margins  <- ooxml_tbl_cell_margins(ooxml_type, margins)
  borders  <- ooxml_cell_borders(ooxml_type, borders)
  fill     <- ooxml_fill(ooxml_type, fill)
  v_merge  <- ooxml_vMerge(ooxml_type, row_span)
  v_align  <- ooxml_vAlign(ooxml_type, v_align)
  gridSpan <- ooxml_gridSpan(ooxml_type, col_span)

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
  tag <- switch_ooxml_type(ooxml_type, word = "w:p", pptx = "a:p")
  runs <- lapply(list2(...), ooxml_run, ooxml_type = ooxml_type)

  ooxml_tag(tag, tag_class = "ooxml_paragraph", !!!runs)
}

# ooxml_run ---------------------------------------------------------------

ooxml_run <- function(ooxml_type, x, ..., properties = NULL) {
  if (inherits(x, "ooxml_run")) {
    return(x)
  }
  rlang::check_dots_empty()
  tag <- switch_ooxml_type(ooxml_type, word = "w:r", pptx = "a:r")

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
  tag <- switch_ooxml_type(ooxml_type, word = "w:rPr", pptx = "r:rPr")
  rlang::check_dots_empty()

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
  tag <- switch_ooxml_type(ooxml_type, word = "w:t", pptx = "a:t")

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
  tag <- switch_ooxml_type(ooxml_type, word = "w:tcBorders", pptx = "a:tcBdr")

  xml_border <- lapply(c("top", "bottom", "left", "right"), function(location) {
    if (is.null(border[[location]])) {
      return(NULL)
    }

    x <- border[[location]]
    rlang::exec(ooxml_cell_border, ooxml_type = ooxml_type, location = location, !!!x)
  })
  ooxml_tag(tag, tag_class = "ooxml_cell_borders", !!!xml_border)
}

# ooxml_cell_border -------------------------------------------------------

ooxml_cell_border <- function(ooxml_type, ..., location, color = "black", size = NULL, type = "solid") {
  UseMethod("ooxml_cell_border")
}

#' @export
ooxml_cell_border.ooxml_word <- function(ooxml_type, ..., location, color = "black", size = NULL, type = "solid") {
  rlang::check_dots_empty()

  location <- arg_match_names(location, c("top" = "w:top", "left" = "w:start", "bottom" = "w:bottom", "right" = "w:end"))
  color    <- as_hex_code(color)
  size     <- check_between(size, min = .25, max = 12, default = 4)
  type    <- arg_match_names(type, c("solid" = "single", "dashed" = "dashed", "dotted" = "dotted", "hidden" = "none", "double" = "double"))

  ooxml_tag(location, tag_class = "ooxml_cell_border",
    `w:color` = color,
    `w:size`  = size * 8, # size is in 1/8 points
    `w:val`   = type
  )
}

#' @export
ooxml_cell_border.ooxml_pptx <- function(ooxml_type, ..., location, color = "black", size = NULL, type = "solid") {
  rlang::check_dots_empty()

  location <- arg_match_names(location, c("top"="a:lnT","left"="a:lnL","bottom"="a:lnB","right"="a:lnR"))
  size     <- check_between(size, min = 0, max = 10, default = .5)
  style    <- convert_border_style_pptx(type)

  if (is.null(style[["compound"]])) {
    return(NULL)
  }

  dash <- if(!is.null(style[["dash_style"]])) {
    ooxml_tag("a:prstDash", `val` = style[["dash_style"]])
  }

  ooxml_tag(location, tag_class = "ooxml_cell_border",
    `w` = size*12700,
    `cap` = "flat",
    `cmpd` = style[["compound"]],
    `algn` = "ctr",

    dash,
    ooxml_fill(ooxml_type, color = color)
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

ooxml_tbl_row <- function(ooxml_type, ..., is_header = FALSE) {
  UseMethod("ooxml_tbl_row")
}

#' @export
ooxml_tbl_row.ooxml_word <- function(ooxml_type, ..., is_header = FALSE) {
  content <- ooxml_list(ooxml_type, "ooxml_tbl_cell", ooxml_tbl_cell, ...)

  ooxml_tag("w:tr", tag_class = "ooxml_tbl_row",
    ooxml_tbl_row_properties(ooxml_type, is_header = is_header),
    !!!content
  )
}

#' @export
ooxml_tbl_row.ooxml_pptx <- function(ooxml_type, x, ..., is_header = FALSE, height = 0) {
  content <- ooxml_list(ooxml_type, "ooxml_tbl_cell", ooxml_tbl_cell, ...)

  ooxml_tag("a:tr", tag_class = "ooxml_tbl_row",
    h = height,
    ooxml_tbl_row_properties(ooxml_type, is_header = is_header),
    !!!content
  )
}


# ooxml_trHeight ----------------------------------------------------------

ooxml_trHeight <- function(ooxml_type, value, ...) {
  UseMethod("ooxml_trHeight")
}

#' @export
ooxml_trHeight.ooxml_word <- function(ooxml_type, value, ..., error_call = current_env()) {
  rlang::check_dots_empty()

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

#' @export
ooxml_trHeight.ooxml_pptx <- function(ooxml_type, value, ..., error_call = current_env()) {
  NULL
}

# ooxml_tbl_row_properties --------------------------------------------------------------

ooxml_tbl_row_properties <- function(ooxml_type, ...) {
  UseMethod("ooxml_tbl_row_properties")
}

#' @export
ooxml_tbl_row_properties.ooxml_word <- function(ooxml_type, ..., is_header = FALSE, hidden = FALSE, height = "auto") {
  rlang::check_dots_empty()
  ooxml_tag("w:trPr", tag_class = "ooxml_tbl_row_properties",
    if (is_header) ooxml_tbl_header(ooxml_type),
    if (hidden) ooxml_cantSplit(ooxml_type),
    ooxml_trHeight(ooxml_type, value = height)
  )
}

#' @export
ooxml_tbl_row_properties.ooxml_pptx <- function(ooxml_type, ...) {
  NULL
}


# ooxml_tbl_header --------------------------------------------------------

ooxml_tbl_header <- function(ooxml_type) {
  ooxml_tag(
    switch_ooxml_type(ooxml_type, word = "w:tblHeader", pptx = "a:tblHeader")
  )
}

# ooxml_tblPr -------------------------------------------------------------

ooxml_tbl_properties <- function(ooxml_type, ...) {
  UseMethod("ooxml_tbl_properties")
}

#' @export
ooxml_tbl_properties.ooxml_word <- function(ooxml_type, ..., layout = c("autofit", "fixed"), justify = c("center", "start","end"), width="100%", look = c("First Row"), tableStyle=NULL) {
  rlang::check_dots_empty()

  if (!rlang::is_character(width, n = 1)) {
    cli::cli_abort("{.arg width} must be a scalar character value.")
  }
  if (!rlang::is_character(look)) {
    cli::cli_abort("{.arg look} must be a character vector.")
  }

  w_type <- "dxa"
  if(grepl("%$", width)){
    w_type <- "pct"
    width <- gsub("%$", "", width)
  }

  ooxml_tag("w:tblPr",
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

#' @export
ooxml_tbl_properties.ooxml_pptx <- function(ooxml_type, ..., look = c("First Column","Banded Rows"), tableStyle = NA) {

  ooxml_tag("a:tblPr",
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
  tag <- switch_ooxml_type(ooxml_type, word = "w:tblGrid", pptx = "a:tblGrid")
  gridCols <- lapply(list2(...), ooxml_gridCol, ooxml_type = ooxml_type)
  ooxml_tag(tag, !!!gridCols)
}

# ooxml_gridCol -----------------------------------------------------------

ooxml_gridCol <- function(ooxml_type, width = NULL) {
  UseMethod("ooxml_gridCol")
}

#' @export
ooxml_gridCol.ooxml_word <- function(ooxml_type, width = NULL) {
  gridWidth <- if (!is.null(width)) {
    list("w:w" = width)
  }
  ooxml_tag("w:gridCol", !!!gridWidth)
}

#' @export
ooxml_gridCol.ooxml_pptx <- function(ooxml_type, width = NULL) {
  gridWidth <- if (!is.null(width)) {
    list("w" = width)
  }
  ooxml_tag("a:gridCol", !!!gridWidth)
}

# ooxml_fill --------------------------------------------------------------

ooxml_fill <- function(ooxml_type, color = NULL) {
  if (is.null(color)) {
    return(NULL)
  }
  UseMethod("ooxml_fill")
}

#' @export
ooxml_fill.ooxml_word <- function(ooxml_type, color = NULL) {
  color <- as_hex_code(color)

  ooxml_tag("w:shd", tag_class = "ooxml_fill",
    `w:val`   = "clear",
    `w:color` = "auto",
    `w:fill`  = color
  )
}

#' @export
ooxml_fill.ooxml_pptx <- function(ooxml_type, color) {
  color <- as_hex_code(color)

  ooxml_tag("a:solidFill", tag_class = "ooxml_fill",
    ooxml_tag("a:srgbClr", color)
  )
}

# ooxml_tbl_cell_margins --------------------------------------------------

ooxml_tbl_cell_margins <- function(ooxml_type, margins = NULL) {
  UseMethod("ooxml_tbl_cell_margins")
}

#' @export
ooxml_tbl_cell_margins.ooxml_word <- function(ooxml_type, margins = NULL) {
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

#' @export
ooxml_tbl_cell_margins.ooxml_pptx <- function(ooxml_type, margins = NULL) {
  if (is.null(margins)) {
    return(NULL)
  }

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

# ooxml_cantSplit ---------------------------------------------------------

ooxml_cantSplit <- function(ooxml_type) {
  UseMethod("ooxml_cantSplit")
}

#' @export
ooxml_cantSplit.ooxml_word <- function(ooxml_type) {
  ooxml_tag("w:cantSplit")
}

#' @export
ooxml_cantSplit.ooxml_pptx <- function(ooxml_type) {
  NULL
}

# ooxml_vMerge  ---------------------------------------------------------------

ooxml_vMerge <- function(ooxml_type, val = NULL) {
  if (is.null(val)) {
    return(NULL)
  }

  tag <- switch_ooxml_type(ooxml_type,
    word = "w:vMerge",
    pptx = cli::cli_abort("Vertical merge is not supported in pptx.")
  )

  ooxml_tag(tag,
    "w:val" = rlang::arg_match(val, values = c("restart", "continue"))
  )
}


# ooxml_vAlign ------------------------------------------------------------

ooxml_vAlign <- function(ooxml_type, align = NULL) {
  if (is.null(align)) {
    return(NULL)
  }

  UseMethod("ooxml_vAlign")
}

#' @export
ooxml_vAlign.ooxml_word <- function(ooxml_type, align = NULL) {
  ooxml_tag("w:vAlign",
    "w:val" = rlang::arg_match(align, values = c("top", "center", "bottom"))
  )
}

#' @export
ooxml_vAlign.ooxml_pptx <- function(ooxml_type, align = c("top", "center", "bottom")) {
  ooxml_tag("a:anchor",
    arg_match_names(align, values = c("top" = "t", "center" = "ctr", "bottom" = "b"))
  )
}


# ooxml_gridSpan ----------------------------------------------------------

ooxml_gridSpan <- function(ooxml_type, col_span = NULL) {
  if (is.null(col_span)) {
    return(NULL)
  }

  UseMethod("ooxml_gridSpan")
}

#' @export
ooxml_gridSpan.ooxml_word <- function(ooxml_type, col_span = NULL) {
  ooxml_tag("w:gridSpan",
    "w:val" = as.integer(col_span)
  )
}

#' @export
ooxml_gridSpan.ooxml_pptx <- function(ooxml_type, col_span = NULL) {
  rlang::splice(
    list("gridSpan" = as.integer(col_span))
  )
}


# ooxml_font --------------------------------------------------------------

ooxml_font <- function(ooxml_type, font = NULL) {
  if (is.null(font)) {
    return(NULL)
  }
  UseMethod("ooxml_font")
}

#' @export
ooxml_font.ooxml_word <- function(ooxml_type, font = NULL) {
  ooxml_tag("w:rFonts", "w:ascii" = font, "w:hAnsi" = font)
}

#' @export
ooxml_font.ooxml_pptx <- function(ooxml_type, font = NULL) {
  ooxml_tag("a:latin", typeface = font)
}


# ooxml_size --------------------------------------------------------------

ooxml_size <- function(ooxml_type, size = NULL) {
  if (is.null(size)) {
    return(NULL)
  }
  UseMethod("ooxml_size")
}

#' @export
ooxml_size.ooxml_word <- function(ooxml_type, size) {
  ooxml_tag("w:sz", "w:val" = check_scalar_integer(size) * 2)
}

#' @export
ooxml_size.ooxml_pptx <- function(ooxml_type, size) {
  rlang::splice(list("sz" = check_scalar_integer(size) * 100))
}

# ooxml_color --------------------------------------------------------------

ooxml_color <- function(ooxml_type, color = NULL) {
  if (is.null(color)) {
    return(NULL)
  }
  UseMethod("ooxml_color")
}

#' @export
ooxml_color.ooxml_word <- function(ooxml_type, color) {
  ooxml_tag("w:color", "w:val" = as_hex_code(color))
}

#' @export
ooxml_color.ooxml_pptx <- function(ooxml_type, color) {
  ooxml_tag("a:solidFill",
    ooxml_tag("a:srgbClr", val = as_hex_code(color))
  )
}

# ooxml_style --------------------------------------------------------------

ooxml_style <- function(ooxml_type, style = NULL) {
  if (is.null(style)) {
    return(NULL)
  }
  UseMethod("ooxml_style")
}

#' @export
ooxml_style.ooxml_word <- function(ooxml_type, style = NULL) {
  if (identical(style, "italic")) {
    ooxml_tag("w:i")
  }
}

#' @export
ooxml_style.ooxml_pptx <- function(ooxml_type, style = NULL) {
  out <- list()
  if (identical(style, "italic")) {
    out <- c(out, list(i = "1"))
  }
  rlang::splice(out)
}

# ooxml_weight --------------------------------------------------------------

ooxml_weight <- function(ooxml_type, weight = NULL) {
  if (is.null(weight)) {
    return(NULL)
  }
  UseMethod("ooxml_weight")
}

#' @export
ooxml_weight.ooxml_word <- function(ooxml_type, weight = NULL) {
  if (identical(style, "bold")) {
    ooxml_tag("w:b")
  }
}

#' @export
ooxml_weight.ooxml_pptx <- function(ooxml_type, weight = NULL) {
  out <- list()
  if (identical(style, "bold")) {
    out <- c(out, list(b = "1"))
  }
  rlang::splice(out)
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


switch_ooxml_type <- function(ooxml_type, word, pptx, error_call = caller_env()) {
  switch(class(ooxml_type),
    ooxml_word = word,
    ooxml_pptx = pptx,
    default    = cli::cli_abort("Unknown ooxml type {.cls {class(ooxml_type)}}")
  )
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
  if (identical(space, "preserve")) rlang:splice(list("xml:space" = "preserve"))
}

