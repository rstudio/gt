
# ooxml types --------------------------------------------------------------

ooxml_word <- function() {
  structure(list(), class = "ooxml_word")
}

ooxml_pptx <- function() {
  structure(list(), class = "ooxml_pptx")
}


# ooxml_text --------------------------------------------------------------

ooxml_text <- function(type, x, ..., space = c("default", "preserve"), error_call = current_env()) {
  UseMethod("ooxml_text")
}

ooxml_text_impl <- function(tag) {
  function(type, x, ..., space = c("default", "preserve"), error_call = current_env()) {
    if (inherits(x, "ooxml_text")) {
      return(x)
    }

    space_attr <- ooxml_space_attr(space, error_call = error_call)
    ooxml_tag(
      tag, tag_class = "ooxml_text",
      !!!space_attr,
      htmltools::HTML(format(x))
    )
  }
}

ooxml_text.ooxml_word <- ooxml_text_impl("w:t")
ooxml_text.ooxml_pptx <- ooxml_text_impl("a:t")

# ooxml_run ---------------------------------------------------------------

ooxml_run <- function(type, x, ..., font = NULL, style = NULL, size = NULL, color = NULL, background = NULL, space = c("default", "preserve")) {
  UseMethod("ooxml_run")
}

ooxml_run_impl <- function(tag) {
  function(type, x, ..., font = NULL, style = NULL, size = NULL, color = NULL, background = NULL, space = "default") {
    if (inherits(x, "ooxml_run")) {
      return(x)
    }

    ooxml_tag(tag, tag_class = "ooxml_run",
      ooxml_text(type, x, space = space)
    )
  }
}

ooxml_run.ooxml_word <- ooxml_run_impl("w:r")
ooxml_run.ooxml_pptx <- ooxml_run_impl("a:r")

# ooxml_cell_content -----------------------------------------------------------------

ooxml_cell_content <- function(type, x, ..., alignment = "right") {
  UseMethod("ooxml_cell_content")
}

ooxml_cell_content_impl <- function(tag) {
  function(type, x, ..., alignment = "right") {
    if (inherits(x, "ooxml_cell_content")) {
      return(x)
    }

    runs <- lapply(x, ooxml_run, type = type)

    ooxml_tag(
      tag, tag_class = "ooxml_cell_content",
      ooxml_pPr(type, alignment = alignment),
      !!!runs
    )
  }
}
ooxml_cell_content.ooxml_word <- ooxml_cell_content_impl("w:p")
ooxml_cell_content.ooxml_pptx <- ooxml_cell_content_impl("a:p")

# ooxml_pPr ---------------------------------------------------------------

ooxml_pPr <- function(type, alignment = NULL) {
  UseMethod("ooxml_rPr")
}

ooxml_pPr_impl <- function(tag) {
  function(type, alignment = NULL) {
    if (is.null(alignment)) {
      return(NULL)
    }

    choices <- c(left="l", right = "r", centered = "ctr", justified = "just", distributed="dist")
    alignment <- rlang::arg_match(alignment, names(choices))

    ooxml_tag(tag, algn = choices[[alignment]])
  }
}

ooxml_pPr.ooxml_word <- ooxml_pPr_impl("w:pPr")
ooxml_pPr.ooxml_pptx <- ooxml_pPr_impl("a:pPr")

# ooxml_tbl_cell ----------------------------------------------------------

ooxml_tbl_cell <- function(type, x, ...) {
  if (inherits(x, "oooxml_table_cell")) {
    return(x)
  }
  UseMethod("ooxml_tbl_cell")
}

ooxml_tbl_cell.ooxml_word <- function(type, x, ...) {
  rlang::check_dots_empty()
  content <- lapply(x, ooxml_cell_content, type = type)
  ooxml_tag(
    "w:tc", tag_class = "ooxml_table_cell",
    ooxml_tcPr(type, ...),
    !!!content
  )
}

ooxml_tbl_cell.ooxml_pptx <- function(type, x, ...) {
  content <- lapply(x, ooxml_cell_content, type = type)
  txBody  <- ooxml_tag("a:txBody", tag_class = "ooxml_text_body",
    ooxml_tag(tag = "a:bodyPr"),
    ooxml_tag(tag = "a:lstStyle"),
    !!!content
  )

  ooxml_tag("a:tc", tag_class = "ooxml_table_cell",
    ooxml_tcPr(type, ...),
    txBody
  )
}

# ooxml_tcPr --------------------------------------------------------------

ooxml_tcPr <- function(type, x, ..., background = NULL, borders = NULL) {
  UseMethod("ooxml_tcPr")
}

ooxml_tcPr_impl <- function(tag) {
  function(type, x, ..., background=NULL, borders = NULL) {
    rlang::check_dots_empty()

    ooxml_tag(tag,
      borders, # TODO: ooxml_borders() ?
      ooxml_fill(type, color = background)
    )
  }
}
ooxml_tcPr.ooxml_word <- ooxml_tcPr_impl("w:tcPr")
ooxml_tcPr.ooxml_pptx <- ooxml_tcPr_impl("a:tcPr")


# ooxml_tbl_row -----------------------------------------------------------

ooxml_tbl_row <- function(type, color, ...) {
  UseMethod("ooxml_tbl_row")
}

ooxml_tbl_row.ooxml_word <- function(type, x, ...) {
  content <- lapply(x, ooxml_tbl_cell, type = type)

  ooxml_tag("a:tr", tag_class = "ooxml_table_row",
    ooxml_trPr(type, is_header = is_header),
    !!!content
  )
}

ooxml_tbl_row.ooxml_pptx <- function(type, x, ..., height = 0) {
  content <- lapply(x, ooxml_tbl_cell, type = type)

  ooxml_tag("a:tr", tag_class = "ooxml_table_row",
    h = height,
    ooxml_trPr(type, is_header = is_header),
    !!!content
  )
}


# ooxml_trHeight ----------------------------------------------------------

ooxml_trHeight <- function(type, value, ...) {
  UseMethod("ooxml_trHeight")
}

ooxml_trHeight.ooxml_word <- function(type, value, ..., error_call = current_env()) {
  rlang::check_dots_empty()

  error_bullets <- c(
    "Invalid value for table row height: {.val {value}}.",
    i = "{.arg {value}} must be a positive numeric value, or one of {.val auto} or {.val atLeast}."
  )

  if (is.character(value)) {
    if (value %in% c("auto", "atLeast")) {
      hRule <- match.arg(value, c("auto","atLeast"))
      value <- "10"

      return(
        ooxml_tag("w:trHeight",
          "w:hRule" = match.arg(value, c("auto", "atLeast")),
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

ooxml_trHeight.ooxml_pptx <- function(type, value, ..., error_call = current_env()) {
  NULL
}

# ooxml_trPr --------------------------------------------------------------

ooxml_trPr <- function(type, ...) {
  UseMethod("ooxml_trPr")
}

ooxml_trPr.ooxml_word <- function(type, ..., is_header = FALSE, hidden = FALSE, height = "auto") {
  rlang::check_dots_empty()
  ooxml_tag("w:trPr",
    if (is_header) ooxml_tbl_header(type),
    if (hidden) ooxml_cantSplit(type),
    ooxml_trHeight(type, value = height)
  )
}

ooxml_trPr.ooxml_pptx <- function(type, ...) {
  NULL
}


# ooxml_tbl_header --------------------------------------------------------

ooxml_tbl_header <- function(type) {
  UseMethod("ooxml_tbl_header")
}

ooxml_tcPr.ooxml_word <- function(type) {
  ooxml_tag("w:tblHeader")
}
ooxml_tcPr.ooxml_pptx <- function(type) {
  ooxml_tag("a:tblHeader")
}


# ooxml_tblPr -------------------------------------------------------------

ooxml_tblPr <- function(type, ...) {
  UseMethod("ooxml_tblPr")
}

ooxml_tblPr.ooxml_word <- function(type, ..., layout = c("autofit", "fixed"), justify = c("center", "start","end"), width="100%", look = c("First Row","No Banded Columns"), tableStyle=NULL) {
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

ooxml_tblPr.ooxml_pptx <- function(type, ..., look = c("First Column","Banded Rows"), tableStyle = NA) {

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

ooxml_tblGrid <- function(type, ...) {
  UseMethod("ooxml_tblGrid")
}

ooxml_tblGrid_impl <- function(tag){
  function(type, ...) {
    gridCols <- lapply(list2(...), ooxml_gridCol, type = type)
    ooxml_tag(tag, !!!gridCols)
  }
}

ooxml_tblGrid.ooxml_word <- ooxml_tblGrid_impl("w:tblGrid")
ooxml_tblGrid.ooxml_pptx <- ooxml_tblGrid_impl("a:tblGrid")


# ooxml_gridCol -----------------------------------------------------------

ooxml_gridCol <- function(type, width = NA_integer_) {
  if (!rlang::is_integerish(width, n = 1)){
    cli::cli_abort("{.arg width} should be a length one integer.")
  }

  UseMethod("ooxml_gridCol")
}

ooxml_gridCol.ooxml_word <- function(type, width = NA_integer_) {
  gridWidth <- if (!is.na(width)) {
    list("w:w" = width)
  }
  ooxml_tag("w:gridCol", !!!gridWidth)
}

ooxml_gridCol.ooxml_pptx <- function(type, width = NA_integer_) {
  gridWidth <- if (!is.na(width)) {
    list("w" = width)
  }
  ooxml_tag("a:gridCol", !!!gridWidth)
}

# ooxml_fill --------------------------------------------------------------

ooxml_fill <- function(type, color) {
  UseMethod("ooxml_fill")
}

ooxml_fill.ooxml_word <- function(type, color) {
  color <- as_hex_code(color)

  ooxml_tag("w:shd",
    `w:val`   = "clear",
    `w:color` = "auto",
    `w:fill`  = color
  )
}

ooxml_fill.ooxml_pptx <- function(type, color) {
  color <- as_hex_code(color)

  ooxml_tag("a:solidFill",
    ooxml_tag("a:srgbClr", color)
  )
}

# ooxml_cantSplit ---------------------------------------------------------

ooxml_cantSplit <- function(type) {
  UseMethod("ooxml_cantSplit")
}

ooxml_cantSplit.ooxml_word <- function(type) {
  ooxml_tag("w:cantSplit")
}

ooxml_cantSplit.ooxml_pptx <- function(type) {
  NULL
}


# ooxml_tag ---------------------------------------------------------------

ooxml_tag <- function(tag, ..., tag_class = tag) {
  xml_tag <- htmltools::tag(`_tag_name` = tag, varArgs = list2(...))
  class(xml_tag) <- c(tag_class, "ooxml_tag", class(xml_tag))
  xml_tag
}

# tools -------------------------------------------------------------------

ooxml_space_attr <- function(space = c("default", "preserve"), error_call = caller_env()) {
  space <- rlang::arg_match(space, error_call = error_call)
  if (space == "preserve") {
    list(`xml:space` = "preserve")
  }
}

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
