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


#
# XML tag functions
#

xml_tag_type <- function(tag_name, app) {
  paste0(substring(app, 1, 1), ":", tag_name)
}

# Table
xml_tbl <- function(..., app = "word") {

  htmltools::tag(
    `_tag_name` = xml_tag_type("tbl", app),
    varArgs = list(
      "xmlns:w" = "http://schemas.openxmlformats.org/wordprocessingml/2006/main",
      "xmlns:wp" = "http://schemas.openxmlformats.org/drawingml/2006/wordprocessingDrawing",
      "xmlns:r" = "http://schemas.openxmlformats.org/officeDocument/2006/relationships",
      "xmlns:w14" = "http://schemas.microsoft.com/office/word/2010/wordml",
      htmltools::HTML(paste0(...))
    )
  )
}

# Table properties
xml_tblPr <- function(..., app = "word") {

  htmltools::tag(
    `_tag_name` = xml_tag_type("tblPr", app),
    varArgs = list(htmltools::HTML(paste0(...)))
  )
}

# Table width (child of `tblPr`)
xml_tblW <- function(
    type = c("pct", "auto", "dxa", "nil"),
    w = "100%",
    app = "word"
) {

  type <- rlang::arg_match(type)

  htmltools::tag(
    `_tag_name` = xml_tag_type("tblW", app),
    varArgs = list(
      `w:type` = type,
      `w:w` = w
    )
  )
}

# Table look (child of `tblPr`)
xml_tblLook <- function(
    first_row = "0",
    last_row = "0",
    first_column = "0",
    last_column = "0",
    no_h_band = "0",
    no_v_band = "0",
    app = "word"
) {

  htmltools::tag(
    `_tag_name` = xml_tag_type("tblLook", app),
    varArgs = list(
      `w:firstRow` = first_row,
      `w:lastRow` = last_row,
      `w:firstColumn` = first_column,
      `w:lastColumn` = last_column,
      `w:noHBand` = no_h_band,
      `w:noVBand` = no_v_band
    )
  )
}

# Table style (child of `tblPr`)
xml_tblStyle <- function(val = "Table", app = "word") {

  htmltools::tag(
    `_tag_name` = xml_tag_type("tblStyle", app),
    varArgs = list(`w:val` = val)
  )
}

# Table cell margins
xml_tbl_cell_margins <- function(..., app = "word") {

  htmltools::tag(
    `_tag_name` = xml_tag_type("tblCellMar", app),
    varArgs = list(htmltools::HTML(paste0(...)))
  )
}

# Width specifiers (child of `tblCellMar` or `tcMar`)
xml_width <- function(
    dir = c("top", "bottom", "left", "right"),
    width = 0,
    type = c("dxa", "nil"),
    app = "word"
) {

  dir <- rlang::arg_match(dir)
  type <- rlang::arg_match(type)

  dir <-
    switch(
      dir,
      left = "start",
      right = "end",
      top = "top",
      bottom = "bottom"
    )

  htmltools::tag(
    `_tag_name` = xml_tag_type(dir, app),
    varArgs = list(
      `w:w` = width,
      `w:type` = type
    )
  )
}

# Table grid
xml_tblGrid <- function(..., app = "word") {

  htmltools::tag(
    `_tag_name` = xml_tag_type("tblGrid", app),
    varArgs = list(htmltools::HTML(paste0(...)))
  )
}

# Table grid
xml_gridcol <- function(width = NULL, app = "word") {

  htmltools::tag(
    `_tag_name` = xml_tag_type("gridCol", app),
    varArgs = list(`w:w` = width, `w:type` = type)
  )
}

# Table row
xml_tr <- function(..., app = "word") {

  htmltools::tag(
    `_tag_name` = xml_tag_type("tr", app),
    varArgs = list(
      htmltools::HTML(paste0(...))
    )
  )
}

# Table row properties
xml_trPr <- function(..., app = "word") {

  htmltools::tag(
    `_tag_name` = xml_tag_type("trPr", app),
    varArgs = list(htmltools::HTML(paste0(...)))
  )
}

# Table row height
xml_tr_height <- function(
    h_rule = c("auto", "exact", "atLeast"),
    height_twips = "150",
    app = "word"
) {

  h_rule <- rlang::arg_match(h_rule)

  htmltools::tag(
    `_tag_name` = xml_tag_type("trHeight", app),
    varArgs = list(
      `w:hRule` = h_rule,
      `w:val` = height_twips
    )
  )
}

# Indicator of row header
xml_tbl_header <- function(app = "word") {

  htmltools::tag(
    `_tag_name` = xml_tag_type("tblHeader", app),
    varArgs = list()
  )
}

# Table cell
xml_tc <- function(..., app = "word") {

  htmltools::tag(
    `_tag_name` = xml_tag_type("tc", app),
    varArgs = list(htmltools::HTML(paste0(...)))
  )
}

# Table cell properties
xml_tcPr <- function(..., app = "word") {

  htmltools::tag(
    `_tag_name` = xml_tag_type("tcPr", app),
    varArgs = list(htmltools::HTML(paste0(...)))
  )
}

# Table cell margins (child of `tcPr`)
xml_tc_margins <- function(..., app = "word") {

  htmltools::tag(
    `_tag_name` = xml_tag_type("tcMar", app),
    varArgs = list(htmltools::HTML(paste0(...)))
  )
}

# Vertical alignment of paragraph in cell (child of `tcPr`)
xml_v_align <- function(v_align = c("center", "bottom", "top"), app = "word") {

  v_align <- rlang::arg_match(v_align)

  htmltools::tag(
    `_tag_name` = xml_tag_type("vAlign", app),
    varArgs = list(`w:val` = v_align)
  )
}

# Span cells horizontally (child of `tcPr`)
xml_gridSpan <- function(val = "1", app = "word") {

  htmltools::tag(
    `_tag_name` = xml_tag_type("gridSpan", app),
    varArgs = list(`w:val` = val)
  )
}

# Span cells vertically (child of `tcPr`)
xml_v_merge <- function(val = c("restart", "continue"), app = "word") {

  val <- rlang::arg_match(val)

  htmltools::tag(
    `_tag_name` = xml_tag_type("vMerge", app),
    varArgs = list(`w:val` = val)
  )
}

# Table cell borders
xml_tc_borders <- function(..., app = "word") {

  htmltools::tag(
    `_tag_name` = xml_tag_type("tcBorders", app),
    varArgs = list(htmltools::HTML(paste0(...)))
  )
}

# Table cell border setting (child of `tcBorders`)
# The `size` is expressed in eighths of a point (min: 2, max: 96)
xml_border <- function(
    dir = c("top", "bottom", "left", "right"),
    type = "single",
    size = 2,
    space = 0,
    color = "D3D3D3",
    app = "word"
) {

  dir <- rlang::arg_match(dir)

  dir <-
    switch(
      dir,
      left = "start",
      right = "end",
      top = "top",
      bottom = "bottom"
    )

  color <- toupper(gsub("#", "", color, fixed = TRUE))

  htmltools::tag(
    `_tag_name` = xml_tag_type(dir, app),
    varArgs = list(
      `w:val` = type,
      `w:sz` = size,
      `w:space` = space,
      `w:color` = color
    )
  )
}

# Paragraph
xml_p <- function(..., app = "word") {

  htmltools::tag(
    `_tag_name` = xml_tag_type("p", app),
    varArgs = list(
      htmltools::HTML(paste0(...))
    )
  )
}

# Paragraph with namespace defined
xml_p_ns <- function(..., app = "word") {

  htmltools::tag(
    `_tag_name` = xml_tag_type("p", app),
    varArgs = list(
      "xmlns:w" = "http://schemas.openxmlformats.org/wordprocessingml/2006/main",
      "xmlns:wp" = "http://schemas.openxmlformats.org/drawingml/2006/wordprocessingDrawing",
      "xmlns:r" = "http://schemas.openxmlformats.org/officeDocument/2006/relationships",
      "xmlns:w14" = "http://schemas.microsoft.com/office/word/2010/wordml",
      htmltools::HTML(paste0(...))
    )
  )
}

# Paragraph properties
xml_pPr <- function(..., app = "word") {

  htmltools::tag(
    `_tag_name` = xml_tag_type("pPr", app),
    varArgs = list(htmltools::HTML(paste0(...)))
  )
}

# Paragraph style
xml_pStyle <- function(
    ...,
    val = "Compact",
    app = "word"
) {

  htmltools::tag(
    `_tag_name` = xml_tag_type("pStyle", app),
    varArgs = list(
      htmltools::HTML(paste0(...)),
      `w:val` = val
    )
  )
}

# paragraph border
xml_pBdr <- function(..., app = "word") {

  htmltools::tag(
    `_tag_name` = xml_tag_type("pBdr", app),
    varArgs = list(
      htmltools::HTML(paste0(...))
    )
  )
}

xml_numPr <- function(..., app = "word") {

  htmltools::tag(
    `_tag_name` = xml_tag_type("numPr", app),
    varArgs = list(
      htmltools::HTML(paste0(...))
    )
  )
}

xml_ilvl <- function(..., val, app = "word") {

  stopifnot(is.numeric(val))

  htmltools::tag(
    `_tag_name` = xml_tag_type("ilvl", app),
    varArgs = list(
      htmltools::HTML(paste0(...)),
      `w:val` = val
    )
  )
}

xml_numId <- function(..., val, app = "word") {

  stopifnot(is.numeric(val), val > 0)

  htmltools::tag(
    `_tag_name` = xml_tag_type("numId", app),
    varArgs = list(
      htmltools::HTML(paste0(...)),
      `w:val` = val
    )
  )
}

# Paragraph alignment
xml_jc <- function(
    val = c("left", "center", "right"),
    app = "word"
) {

  val <- rlang::arg_match(val)

  val <-
    switch(
      val,
      left = "start",
      right = "end",
      center = "center"
    )

  htmltools::tag(
    `_tag_name` = xml_tag_type("jc", app),
    varArgs = list(`w:val` = val)
  )
}

# Paragraph spacing
xml_spacing <- function(
    before = 120,
    after = 120,
    val = NULL,
    app = "word"
) {

  htmltools::tag(
    `_tag_name` = xml_tag_type("spacing", app),
    varArgs = list(
      `w:before` = before,
      `w:after` = after,
      `w:val` = val
    )
  )
}

# hyperlink
xml_hyperlink <- function(..., url, app = "word") {

  htmltools::tag(
    `_tag_name` = xml_tag_type("hyperlink", app),
    varArgs = list(
      `r:id` = url,
      htmltools::HTML(paste0(...))
    )
  )
}

# Text run
xml_r <- function(..., app = "word") {

  htmltools::tag(
    `_tag_name` = xml_tag_type("r", app),
    varArgs = list(htmltools::HTML(paste0(...)))
  )
}

# Text run properties
xml_rPr <- function(..., app = "word") {

  htmltools::tag(
    `_tag_name` = xml_tag_type("rPr", app),
    varArgs = list(htmltools::HTML(paste0(...)))
  )
}

# run style
xml_rStyle <- function(
  ...,
  val = "Compact",
  app = "word"
) {

  htmltools::tag(
    `_tag_name` = xml_tag_type("rStyle", app),
    varArgs = list(
      htmltools::HTML(paste0(...)),
      `w:val` = val
    )
  )
}

# Font selection (child of `rPr`)
xml_r_font <- function(
    ascii_font = "Calibri",
    ansi_font = "Calibri",
    app = "word"
) {

  htmltools::tag(
    `_tag_name` = xml_tag_type("rFonts", app),
    varArgs = list(
      `w:ascii` = ascii_font,
      `w:hAnsi` = ansi_font
    )
  )
}

# Font size in half points (child of `rPr`)
xml_sz <- function(val = 24, app = "word") {

  htmltools::tag(
    `_tag_name` = xml_tag_type("sz", app),
    varArgs = list(`w:val` = val)
  )
}

# Baseline adjustment of text (subscript, superscript) (child of `rPr`)
xml_baseline_adj <- function(
    v_align = c("superscript", "subscript", "baseline"),
    app = "word"
) {

  v_align <- rlang::arg_match(v_align)

  htmltools::tag(
    `_tag_name` = xml_tag_type("vertAlign", app),
    varArgs = list(`w:val` = v_align)
  )
}

# Literal text
xml_t <- function(
    ...,
    xml_space = c("default", "preserve"),
    app = "word"
) {

  xml_space <- rlang::arg_match(xml_space)

  # HTML-escape literal text
  htmltools::tag(
    `_tag_name` = xml_tag_type("t", app),
    varArgs = list(
      htmltools::HTML(paste0(...)),
      `xml:space` = xml_space
    )
  )
}

# Bold text specifier (toggle property)
xml_b <- function(active = TRUE, app = "word") {

  htmltools::tag(
    `_tag_name` = xml_tag_type("b", app),
    varArgs = list(`w:val` = tolower(as.character(active)))
  )
}

# Italics text specifier (toggle property)
xml_i <- function(active = TRUE, app = "word") {

  htmltools::tag(
    `_tag_name` = xml_tag_type("i", app),
    varArgs = list()
  )
}

# Specification of text color
xml_color <- function(color = "D3D3D3", app = "word") {

  color <- toupper(gsub("#", "", color))

  htmltools::tag(
    `_tag_name` = xml_tag_type("color", app),
    varArgs = list(`w:val` = color)
  )
}

xml_shd <- function(fill = "auto", app = "word") {

  fill <- toupper(gsub("#", "", fill))

  htmltools::tag(
    `_tag_name` = xml_tag_type("shd", app),
    varArgs = list(
      `w:val` = "clear",
      `w:color` = "auto",
      `w:fill` = fill
    )
  )
}

# Text break
xml_br <- function(type = "textWrapping", clear = "all", app = "word") {

  htmltools::tag(
    `_tag_name` = xml_tag_type("br", app),
    varArgs = list(
      `w:type` = type,
      `w:clear` = clear
    )
  )
}

# Carriage return
xml_cr <- function(app = "word") {

  htmltools::tag(
    `_tag_name` = xml_tag_type("cr", app),
    varArgs = list()
  )
}

# Contents within the current cell shall be rendered on a single page
xml_cantSplit <- function(app = "word") {

  htmltools::tag(
    `_tag_name` = xml_tag_type("cantSplit", app),
    varArgs = list()
  )
}

# keep with Next
# contents of this paragraph are at least partly rendered on the same page
# as the following paragraph whenever possible
xml_keepNext <- function(app = "word") {

  htmltools::tag(
    `_tag_name` = xml_tag_type("keepNext", app),
    varArgs = list()
  )
}

# Specifies the start or end of a complex field
xml_fldChar <- function(
    fldCharType = c("begin", "separate", "end"),
    dirty = TRUE,
    app = "word"
) {

  fldCharType <- rlang::arg_match(fldCharType)
  check_bool(dirty)

  htmltools::tag(
    `_tag_name` = xml_tag_type("fldChar", app),
    varArgs = list(
      `w:fldCharType` = fldCharType,
      `w:dirty` = tolower(dirty))
  )
}

# Field instructions for specifying the codes for the fields; used
# within a `fldChar`
xml_instrText <- function(
    instr,
    dirty = TRUE,
    app = "word"
) {

  htmltools::tag(
    `_tag_name` = xml_tag_type("instrText", app),
    varArgs = list(
      `xml:space` = "preserve",
      `w:dirty` = tolower(dirty),
      instr),
  )
}

# Declares the noProof property
xml_noProof <- function(app = "word") {
  htmltools::tag(
    `_tag_name` = xml_tag_type("noProof", app),
    varArgs = list()
  )
}

# Add automatic table numbering
xml_table_autonum <- function(
    font = xml_r_font(),
    size = xml_sz(val = 24),
    app = "word"
) {

  htmltools::tagList(
    xml_r(
      xml_rPr(
        font,
        size
      ),
      xml_t(
        xml_space = "preserve",
        "Table "
      )
    ),
    xml_r(
      xml_fldChar(fldCharType = "begin")
    ),
    xml_r(
      xml_instrText(" SEQ Table \\* ARABIC ")
    ),
    xml_r(
      xml_fldChar(fldCharType = "separate")
    ),
    xml_r(
      xml_rPr(
        xml_noProof(),
        font,
        size
      ),
      xml_t(1)
    ),
    xml_r(
      xml_fldChar(fldCharType = "end")
    ),
    xml_r(
      xml_rPr(
        font,
        size
      ),
      xml_t(
        ": ",
        xml_space = "preserve"
      )
    )
  )
}

#' Transform a footnote mark to an XML representation
#'
#' @noRd
footnote_mark_to_xml <- function(
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

  as.character(
    xml_r(
      xml_rPr(
        xml_baseline_adj(
          v_align = if (grepl("^", spec, fixed = TRUE)) "superscript" else "baseline"
        ),
        if (grepl("i", spec, fixed = TRUE)) xml_i(active = TRUE) else NULL,
        if (grepl("b", spec, fixed = TRUE)) xml_b(active = TRUE) else NULL
      ),
      xml_t(mark)
    )
  )
}

# Images in ooxml ----

#' Image ooxml container
#'
#' To be inserted as part of a run
#'
#' @noRd
xml_image <- function(src, height = 1, width = 1, units = "in", alt_text = "") {

  xml_drawing(
    xml_wp_inline(
      xml_wp_extent(
        cx = width,
        cy = height,
        units = units
      ),
      # xml_wp_docPr(id = "", description = alt_text),
      xml_wp_docPr(id = "", description = ""),

      xml_wp_effectExtent(),
      xml_wp_cNvGraphicFramePr(
        xml_a_graphic_frame_locks()
      ),
      xml_a_graphic(
        xml_a_graphicData(
          xml_pic_pic(
            xml_pic_nvPicPr(
              xml_pic_cNvPr(id = ""),
              xml_pic_cNvPicPr(
                xml_a_pic_locks(noChangeAspect = TRUE, noChangeArrowheads = TRUE)
              )
            ),
            xml_pic_blipFill(
              xml_a_blip(
                src = src
              ),
              xml_a_srcRect(),
              xml_a_stretch_rect()
            ),
            xml_pic_spPr(
              bwMode = "auto",
              xml_a_xfrm(height = height, width = width, offx = 0, offy = 0),
              xml_a_prstGeom_rect(),
              xml_a_noFill(),
              xml_a_ln(
                xml_a_noFill()
              )
            )
          )
        )
      )
    )
  )

}

xml_drawing <- function(..., app = "word") {

  htmltools::tag(
    `_tag_name` = xml_tag_type("drawing", app),
    varArgs = list(
      `xmlns:r` = "http://schemas.openxmlformats.org/officeDocument/2006/relationships",
      ...
      )
  )

}

## Defines the image as being "inline" with text (in run)
xml_wp_inline <- function(..., distT = 0, distB = 0, distL = 0, distR = 0) {

  htmltools::tag(
    `_tag_name` = "wp:inline",
    varArgs = list(
      ...,
      distT = distT,
      distB = distB,
      distL = distL,
      distR = distR
    )
  )
}

## Define height and width of graphic object
xml_wp_extent <- function(cx, cy, units = "in") {

  htmltools::tag(
    `_tag_name` = "wp:extent",
    varArgs = list(
      cx = convert_to_emu(cx, units = units),
      cy = convert_to_emu(cy, units = units)
    )
  )
}

convert_to_emu <- function(x, units = "in") {

  ## a px is
  emu_conversion <- c(
    "in" = 914400, # https://startbigthinksmall.wordpress.com/2010/01/04/points-inches-and-emus-measuring-units-in-office-open-xml/
    "cm" = 360000,
    "px" = 9525 # https://stackoverflow.com/questions/66541210/convert-google-slides-emu-units-to-pixels-api
    )[[units]]

  x * emu_conversion
}

xml_wp_effectExtent <- function(l = 0, r = 0, t = 0, b = 0) {

  htmltools::tag(
    `_tag_name` = "wp:effectExtent",
    varArgs = list(
      l = l,
      r = r,
      t = t,
      b = b
    )
  )

}

# Place ot define DrawingML properties
xml_wp_docPr <- function(id = "", name = "", description = "") {

  htmltools::tag(
    `_tag_name` = "wp:docPr",
    varArgs = list(
      id = id,
      name = name,
      descr = description
    )
  )
}

## describe locking properties. Not usually used except to define that the
## aspect ratio shouldn't change
xml_wp_cNvGraphicFramePr <- function(...) {
  htmltools::tag(
    `_tag_name` = "wp:cNvGraphicFramePr",
    varArgs = list(
      ...
    )
  )
}

xml_a_graphic_frame_locks <- function(noChangeAspect = TRUE, noCrop = FALSE, noRot = FALSE, noSelect = FALSE) {

  locks <- c(noChangeAspect = noChangeAspect, noCrop = noCrop, noRot = noRot, noSelect = noSelect)
  locks <- locks[locks] # only keep TRUE

  locks_list <- lapply(locks, as.numeric)

  htmltools::tag(
    `_tag_name` = "a:graphicFrameLocks",
    varArgs = as.list(c(
      `xmlns:a` = "http://schemas.openxmlformats.org/drawingml/2006/main",
      locks_list
    ))
  )

}

## graphic object
xml_a_graphic <- function(...) {
  htmltools::tag(
    `_tag_name` = "a:graphic",
    varArgs = list(
      `xmlns:a` = "http://schemas.openxmlformats.org/drawingml/2006/main",
      ...
    )
  )
}

## graphic object data
xml_a_graphicData <- function(...) {
  htmltools::tag(
    `_tag_name` = "a:graphicData",
    varArgs = list(
      `uri` = "http://schemas.openxmlformats.org/drawingml/2006/picture",
      ...
    )
  )
}

## picture object
xml_pic_pic <- function(...) {
  htmltools::tag(
    `_tag_name` = "pic:pic",
    varArgs = list(
      `xmlns:pic` = "http://schemas.openxmlformats.org/drawingml/2006/picture",
      ...
    )
  )

}

## Picture non-visual properties (locking, name, id, title, hidden/not)
xml_pic_nvPicPr <- function(...) {
  htmltools::tag(
    `_tag_name` = "pic:nvPicPr",
    varArgs = list(
      ...
    )
  )

}

xml_pic_cNvPr <- function(id = "", name = "") {
  htmltools::tag(
    `_tag_name` = "pic:cNvPr",
    varArgs = list(
      `id` = id,
      `name` = name
    )
  )
}

xml_pic_cNvPicPr <- function(...) {
  htmltools::tag(
    `_tag_name` = "pic:cNvPicPr",
    varArgs = list(
      ...
    )
  )
}

xml_a_pic_locks <- function(noChangeAspect = TRUE, noChangeArrowheads = TRUE, noCrop = FALSE, noMove = FALSE, noResize = FALSE, noRot = FALSE, noSelect = FALSE) {

  locks <-
    c(
      "noChangeAspect" = noChangeAspect,
      "noChangeArrowheads" = noChangeArrowheads,
      "noCrop" = noCrop,
      "noMove" = noMove,
      "noResize" = noResize,
      "noRot" = noRot,
      "noSelect" = noSelect
    )
  locks <- locks[locks == TRUE]

  locks_list <- lapply(locks, as.numeric)

  htmltools::tag(
    `_tag_name` = "a:picLocks",
    varArgs = as.list(c(
      locks_list
    ))
  )

}

## Define the picture fill that the picture has and contains element of blip
xml_pic_blipFill <- function(...) {
  htmltools::tag(
    `_tag_name` = "pic:blipFill",
    varArgs = list(
      ...
    )
  )
}

### reference the actual picture in relationship
xml_a_blip <- function(src, cstate = "print") {

  htmltools::tag(
    `_tag_name` = "a:blip",
    varArgs = list(
      `r:embed` = src,
      `cstate` = cstate
    )
  )
}

### reference how to display image - stretch to fit
xml_a_stretch_rect <- function() {
  htmltools::tag(
    `_tag_name` = "a:stretch",
    varArgs = list(
      htmltools::tag(
        `_tag_name` = "a:fillRect", varArgs = list()
      )
    )
  )
}

## cropping

xml_a_srcRect <- function(left = NA, right = NA, top = NA, bottom = NA) {

  crop <-
    c(
      "l" = left,
      "r" = right,
      "t" = top,
      "b" = bottom
    )
  crop <- crop[!is.na(crop)]

  htmltools::tag(
    `_tag_name` = "a:srcRect",
    varArgs = as.list(crop)
  )
}

## Contains Visual shape properties of picture
xml_pic_spPr <- function(..., bwMode = "auto") {
  htmltools::tag(
    `_tag_name` = "pic:spPr",
    varArgs = list(
      bwMode = bwMode,
      ...
    )
  )
}

xml_a_xfrm <- function(height, width, offx, offy) {

  htmltools::tag(
    `_tag_name` = "a:xfrm",
    varArgs = list(
      htmltools::tag(
        `_tag_name` = "a:off",
        varArgs = list(
          x = offx,
          y = offy
        )
      ),
      htmltools::tag(
        `_tag_name` = "a:ext",
        varArgs = list(
          cx = convert_to_emu(width)/72, ## EMU to pixels?
          cy = convert_to_emu(height)/72
        )
      )
    )
  )
}

xml_a_prstGeom_rect <- function() {

  htmltools::tag(
    `_tag_name` = "a:prstGeom",
    varArgs = list(
      `prst` = "rect",
      htmltools::tag(
        `_tag_name` = "a:avLst",
        varArgs = list()
      )
    )
  )

}

xml_a_noFill <- function() {
  htmltools::tag(
    `_tag_name` = "a:noFill",
    varArgs = list()
  )
}

xml_a_ln <- function(...) {
  htmltools::tag(
    `_tag_name` = "a:ln",
    varArgs = list(...)
  )
}


# Major Table Components ----


# TODO: make table widths work for XML
# Get the attributes for the table tag
create_table_props_component_xml <- function(data, align = c("center", "start", "end", "right", "left")) {

  align <- match.arg(align)

  boxh <- dt_boxhead_get(data = data)

  # Get the `table-layout` value, which is set in `_options`
  table_style <-
    paste0(
      "table-layout: ",
      dt_options_get_value(
        data = data,
        option = "table_layout"
      ),
      ";"
    )

  doc_page_width <- getOption("gt.rtf_page_width")

  # In the case that column widths are not set for any columns,
  # there should not be a `<colgroup>` tag requirement
  # if (length(unlist(boxh$column_width)) < 1) {
  #   return(list(table_style = NULL, table_colgroups = NULL))
  # }

  # Get the table's width (which or may not have been set)
  table_width <-
    dt_options_get_value(
      data = data,
      option = "table_width"
    )

  widths <- boxh[boxh$type %in% c("default", "stub"), , drop = FALSE]
  # returns vector of column widths where `stub` is first
  widths <- dplyr::arrange(widths, dplyr::desc(type))$column_width

  table_properties <-
    xml_tblPr(
      xml_tbl_cell_margins(
        xml_width("top"),
        xml_width("bottom"),
        xml_width("left", width = 60),
        xml_width("right", width = 60)
      ),
      xml_tblW(type = "auto", w = 0),
      xml_tblLook(),
      xml_jc(val = c(center = "center", start = "start", end = "end", end = "right", start = "left")[[align]])
    )

  # table_cols <- xml_tblGrid(
  #     vapply(lapply(widths,xml_gridcol), as.character, as.character(0L))
  # )

  # htmltools::tagList(c(table_properties, table_cols))

  htmltools::tagList(table_properties)


}

#' Create the caption component of a table (OOXML)
#'
#' The table heading component contains the title and possibly a subtitle; if
#' there are no heading components defined this function will return an empty
#' string.
#'
#' @noRd
create_table_caption_component_xml <- function(
    data,
    align = "center",
    keep_with_next = TRUE,
    autonum = TRUE
) {

  # If there is no title or heading component, then return an empty string
  if (!dt_heading_has_title(data = data)) {
    return("")
  }

  heading <- dt_heading_get(data = data)
  footnotes_tbl <- dt_footnotes_get(data = data)
  styles_tbl <- dt_styles_get(data = data)
  subtitle_defined <- dt_heading_has_subtitle(data = data)

  header_title_style <- styles_tbl[
    styles_tbl$locname == "title",
    "styles",
    drop = TRUE
  ][1][[1]]

  # Get table options
  table_font_color <- dt_options_get_value(data, option = "table_font_color")

  title_caption_string <- parse_to_xml(heading$title)

  # Get the footnote marks for the title
  if ("title" %in% footnotes_tbl$locname) {

    footnote_title_marks <-
      coalesce_marks(
        fn_tbl = footnotes_tbl,
        locname = "title"
      )

    footnote_title_marks <-
      footnote_mark_to_xml(
        data = data,
        mark = footnote_title_marks
      )
    footnote_title_marks <- as_xml_node(footnote_title_marks)[[1L]]

    xml_add_child(
      title_caption_string,
      footnote_title_marks
      )
  }

  title_caption_string <- paste0("<md_container>", as.character(title_caption_string), "</md_container>")

  title_caption_xml <-
    process_cell_content(
      x = title_caption_string,
      font = header_title_style[["cell_text"]][["font"]] %||% "Calibri",
      size = header_title_style[["cell_text"]][["size"]] %||% 24,
      whitespace = header_title_style[["cell_text"]][["whitespace"]],
      paragraph_style = "caption",
      color = header_title_style[["cell_text"]][["color"]] %||% table_font_color,
      align = header_title_style[["cell_text"]][["align"]] %||% align,
      keep_with_next = keep_with_next
    )

  title_caption_xml <- as_xml_node(title_caption_xml)

  if (autonum) {
    autonum_node_xml <-
      xml_table_autonum(
        font = xml_r_font(header_title_style[["cell_text"]][["font"]] %||% "Calibri"),
        size = xml_sz(val = header_title_style[["cell_text"]][["size"]] %||% 24)
      )

    autonum_node_xml <- as_xml_node(autonum_node_xml)

    for (autonum_node in rev(autonum_node_xml)) {
      xml_add_child(title_caption_xml[1], autonum_node, .where = 1)
    }
  }

  title_caption <- as.character(title_caption_xml)

  if (subtitle_defined) {

    header_subtitle_style <-
      styles_tbl[styles_tbl$locname == "subtitle", ]$styles[1][[1]]

    subtitle_caption_string <- parse_to_xml(heading$subtitle)

    # Get the footnote marks for the subtitle
    if ("subtitle" %in% footnotes_tbl$locname) {

      footnote_subtitle_marks <-
        coalesce_marks(
          fn_tbl = footnotes_tbl,
          locname = "subtitle"
        )

      footnote_subtitle_marks <-
        footnote_mark_to_xml(
          data = data,
          mark = footnote_subtitle_marks
        )
      footnote_subtitle_marks <- as_xml_node(footnote_subtitle_marks)[[1]]

      xml_add_child(
        subtitle_caption_string,
        footnote_subtitle_marks
      )
    }

    subtitle_caption_string <-
      paste0(
        "<md_container>",
        as.character(subtitle_caption_string),
        "</md_container>"
      )

    subtitle_caption <-
      process_cell_content(
        x = subtitle_caption_string,
        font = header_subtitle_style[["cell_text"]][["font"]] %||% "Calibri",
        size = header_subtitle_style[["cell_text"]][["size"]] %||% 20,
        whitespace = header_subtitle_style[["cell_text"]][["whitespace"]],
        paragraph_style = "caption",
        align = header_subtitle_style[["cell_text"]][["align"]] %||% align,
        keep_with_next = keep_with_next,
        color = header_subtitle_style[["cell_text"]][["color"]] %||% table_font_color
      )

    title_caption <- c(title_caption, subtitle_caption)
  }

  title_caption
}

#' Create the heading component of a table (OOXML)
#'
#' The table heading component contains the title and possibly a subtitle; if
#' there are no heading components defined this function will return an empty
#' string.
#'
#' @noRd
create_heading_component_xml <- function(
    data,
    split = FALSE,
    align = "center",
    keep_with_next = TRUE
) {

  # If there is no title or heading component, then return an empty string
  if (!dt_heading_has_title(data = data)) {
    return("")
  }

  heading <- dt_heading_get(data = data)
  footnotes_tbl <- dt_footnotes_get(data = data)
  styles_tbl <- dt_styles_get(data = data)
  stub_components <- dt_stub_components(data = data)
  subtitle_defined <- dt_heading_has_subtitle(data = data)

  header_title_style <-
    styles_tbl[styles_tbl$locname == "title", ]$styles[1][[1]]

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
  title_caption <- parse_to_xml(heading$title)

  # Get the footnote marks for the title
  if ("title" %in% footnotes_tbl$locname) {

    footnote_title_marks <-
      coalesce_marks(
        fn_tbl = footnotes_tbl,
        locname = "title"
      )

    footnote_title_marks <-
      footnote_mark_to_xml(
        data = data,
        mark = footnote_title_marks
      )
    footnote_title_marks <- as_xml_node(footnote_title_marks)[[1L]]

    xml_add_child(
      title_caption,
      footnote_title_marks
    )

  }

  title_caption <- as.character(title_caption)

  if (subtitle_defined) {

    # Get the footnote marks for the subtitle
    subtitle_caption_string <- parse_to_xml(heading$subtitle)

    # Get the footnote marks for the subtitle
    if ("subtitle" %in% footnotes_tbl$locname) {

      footnote_subtitle_marks <-
        coalesce_marks(
          fn_tbl = footnotes_tbl,
          locname = "subtitle"
        )

      footnote_subtitle_marks <-
        footnote_mark_to_xml(
          data = data,
          mark = footnote_subtitle_marks
        )
      footnote_subtitle_marks <- as_xml_node(footnote_subtitle_marks)[[1L]]

      xml_add_child(
        subtitle_caption_string,
        footnote_subtitle_marks
      )
    }

    header_subtitle_style <-
      styles_tbl[styles_tbl$locname == "subtitle", ]$styles[1][[1]]

    subtitle_caption_string <-
      paste0(
        "<md_container>",
        as.character(subtitle_caption_string),
        "</md_container>"
        )

    subtitle_caption_string <-
      process_cell_content(
        subtitle_caption_string,
        size = header_subtitle_style[["cell_text"]][["size"]] %||% 16,
        color = header_subtitle_style[["cell_text"]][["color"]] %||% table_font_color,
        align = header_subtitle_style[["cell_text"]][["align"]] %||% "center",
        col_span = n_cols,
        whitespace = header_subtitle_style[["cell_text"]][["whitespace"]],
        keep_with_next = keep_with_next
      )

    title_caption <- paste0(
      title_caption,
      subtitle_caption_string
    )
  }

  title_caption <-
    paste0("<md_container>", title_caption ,"</md_container>")

  title_section <-
    htmltools::tagList(
      xml_tr(
        xml_trPr(
          if (!split) {
            xml_cantSplit()
          },
          xml_tbl_header()
        ),
        xml_table_cell(
          content = title_caption,
          font = header_title_style[["cell_text"]][["font"]] %||% "Calibri",
          size = header_title_style[["cell_text"]][["size"]] %||% 24,
          whitespace = header_title_style[["cell_text"]][["whitespace"]],
          paragraph_style = "caption",
          color = header_title_style[["cell_text"]][["color"]] %||% table_font_color,
          align = header_title_style[["cell_text"]][["align"]] %||% align,
          col_span = n_cols,
          border = if (table_border_top_include) {
            c(
              list(
                "top" = cell_border(
                  type = "single",
                  size = 16,
                  color = heading_border_bottom_color
                )
              ),
              if (!subtitle_defined) {
                list(
                  "bottom" = cell_border(
                    type = "single",
                    size = 16,
                    color = heading_border_bottom_color
                  )
                )
              }
            )
          },
          keep_with_next = TRUE
        )
      )
    )

  title_section
}

#' Create the columns component of a table (OOXML)
#'
#' @noRd
create_columns_component_xml <- function(
    data,
    split = FALSE,
    keep_with_next = TRUE
) {

  boxh <- dt_boxhead_get(data = data)
  stubh <- dt_stubhead_get(data = data)
  body <- dt_body_get(data = data)
  styles_tbl <- dt_styles_get(data = data)
  stub_available <- dt_stub_df_exists(data = data)
  spanners_present <- dt_spanners_exists(data = data)

  # Get the column alignments for all visible columns
  col_alignment <- vctrs::vec_slice(boxh$column_align, boxh$type == "default")

  # Get the column headings
  headings_vars <- vctrs::vec_slice(boxh$var, boxh$type == "default")
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
    return("")
  }

  # Get table options
  table_border_top_include <- dt_options_get_value(data, option = "table_border_top_include")
  column_labels_border_top_color <- dt_options_get_value(data = data, option = "column_labels_border_top_color")
  column_labels_border_bottom_color <- dt_options_get_value(data = data, option = "column_labels_border_bottom_color")
  column_labels_vlines_color <- dt_options_get_value(data = data, option = "column_labels_vlines_color")

  # If `stub_available` == TRUE, then replace with a set stubhead
  # label or nothing
  if (isTRUE(stub_available) && length(stubh$label) > 0L) {

    headings_labels <- prepend_vec(headings_labels, stubh$label)
    headings_vars <- prepend_vec(headings_vars, "::stub")

  } else if (isTRUE(stub_available)) {

    headings_labels <- prepend_vec(headings_labels, "")
    headings_vars <- prepend_vec(headings_vars, "::stub")
  }

  stubhead_label_alignment <- "left"

  table_col_headings_list <- list()

  # Create first row of table column headings
  table_cell_vals <- list()

  # Create the cell for the stubhead label
  if (stub_available) {

    # If there are spanners, make the first row an empty cell that continues merge
    if (spanner_row_count < 1) {

      cell_style <-
        styles_tbl[styles_tbl$locname %in% "stubhead", "styles", drop = TRUE]
      cell_style <- cell_style[1][[1]]

      table_cell_vals[[length(table_cell_vals) + 1]] <-
        xml_table_cell(
          content = headings_labels[1],
          font = cell_style[["cell_text"]][["font"]],
          size = cell_style[["cell_text"]][["size"]] %||% 20,
          color = cell_style[["cell_text"]][["color"]],
          style = cell_style[["cell_text"]][["style"]],
          stretch = cell_style[["cell_text"]][["stretch"]],
          whitespace = cell_style[["cell_text"]][["whitespace"]],
          align = cell_style[["cell_text"]][["align"]] %||% stubhead_label_alignment,
          v_align = cell_style[["cell_text"]][["v_align"]],
          fill = cell_style[["cell_fill"]][["color"]],
          border = list(
            top = cell_border(size = 16, color = column_labels_border_top_color),
            bottom = cell_border(size = 16, color = column_labels_border_bottom_color),
            left = cell_border(color = column_labels_vlines_color),
            right = cell_border(color = column_labels_vlines_color)
          ),
          keep_with_next = keep_with_next
        )

    } else {

      table_cell_vals[[length(table_cell_vals) + 1]] <-
        xml_table_cell(
          row_span = "continue",
          border = list(
            left = cell_border(color = column_labels_vlines_color),
            right = cell_border(color = column_labels_vlines_color),
            bottom = cell_border(size = 16, color = column_labels_border_bottom_color)
          ),
          keep_with_next = TRUE
        )
    }
  }

  for (i in seq_len(length(headings_vars) - stub_available)) {

    cell_style <-
      vctrs::vec_slice(
        styles_tbl,
        styles_tbl$locname %in% c("columns_columns") &
        styles_tbl$rownum == -1 &
        styles_tbl$colnum == i
      )
    cell_style <- cell_style$styles[1][[1]]

    table_cell_vals[[length(table_cell_vals) + 1]] <-
      xml_table_cell(
        content = headings_labels[i + stub_available],
        font = cell_style[["cell_text"]][["font"]],
        size = cell_style[["cell_text"]][["size"]] %||% 20,
        color = cell_style[["cell_text"]][["color"]],
        style = cell_style[["cell_text"]][["style"]],
        stretch = cell_style[["cell_text"]][["stretch"]],
        whitespace = cell_style[["cell_text"]][["whitespace"]],
        align = cell_style[["cell_text"]][["align"]] %||% col_alignment[i],
        v_align = cell_style[["cell_text"]][["v_align"]],
        fill = cell_style[["cell_fill"]][["color"]],
        border = list(
          top = if (!spanners_present) { cell_border(size = 16, color = column_labels_border_top_color) },
          bottom = cell_border(size = 16, color = column_labels_border_bottom_color),
          left = if (i == 1L) { cell_border(color = column_labels_vlines_color) },
          right = if (i == length(headings_vars) - stub_available) { cell_border(color = column_labels_vlines_color) }
        ),
        keep_with_next = keep_with_next
      )
  }

  table_col_headings_list[[1L]] <-
    xml_tr(
      xml_trPr(
        if (!split) { xml_cantSplit() },
        xml_tbl_header()
      ),
      paste(
        vapply(
          table_cell_vals,
          FUN.VALUE = character(1L),
          FUN = paste
        ),
        collapse = ""
      )
    )

  if (spanners_present) {

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

    for (span_row_idx in rev(seq_len(spanner_row_count))) {

      spanner_row_values <- spanners[span_row_idx,]
      spanner_row_ids <- spanner_ids[span_row_idx,]

      spanner_cell_vals <- list()

      # Create the cell for the stubhead label

      if (stub_available) {

        if (span_row_idx == 1) {

          cell_style <-
            styles_tbl[styles_tbl$locname %in% "stubhead", "styles", drop = TRUE]
          cell_style <- cell_style[1][[1]]

          spanner_cell_vals[[length(spanner_cell_vals) + 1]] <-
            xml_table_cell(
              content = headings_labels[1],
              font = cell_style[["cell_text"]][["font"]] %||% "Calibri",
              size = cell_style[["cell_text"]][["size"]] %||% 20,
              color = cell_style[["cell_text"]][["color"]],
              style = cell_style[["cell_text"]][["style"]],
              weight = cell_style[["cell_text"]][["weight"]],
              stretch = cell_style[["cell_text"]][["stretch"]],
              whitespace = cell_style[["cell_text"]][["whitespace"]],
              align = cell_style[["cell_text"]][["align"]] %||% stubhead_label_alignment,
              v_align = cell_style[["cell_text"]][["v_align"]] %||% "bottom",
              fill = cell_style[["cell_fill"]][["color"]],
              row_span = "start",
              border = list(
                top = cell_border(size = 16, color = column_labels_border_top_color),
                left = cell_border(color = column_labels_vlines_color),
                right = cell_border(color = column_labels_vlines_color)
              ),
              keep_with_next = TRUE
            )

        } else {

          spanner_cell_vals[[length(spanner_cell_vals) + 1]] <-
            xml_table_cell(
              row_span = "continue",
              border = list(
                left = cell_border(color = column_labels_vlines_color),
                right = cell_border(color = column_labels_vlines_color),
                bottom = if (span_row_idx == nrow(spanners)) { cell_border(size = 16, color = column_labels_border_bottom_color) }
              ),
              keep_with_next = TRUE
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

        if (is.na(spanner_row_ids[i])) {

          spanner_cell_vals[[length(spanner_cell_vals) + 1]] <-
            xml_table_cell(
              border = list(
                left = if (i == 1L) { cell_border(color = column_labels_vlines_color) },
                right = if (i == length(spanner_row_values)) { cell_border(color = column_labels_vlines_color) },
                top = if (span_row_idx == 1) { cell_border(size = 16, color = column_labels_border_top_color) }
              ),
              keep_with_next = keep_with_next
            )

        } else {
          # Case with no spanner labels are in top row
          # (merge cells horizontally and align text to bottom)
          if (colspans[i] > 0) {

            cell_style <-
              vctrs::vec_slice(
                styles_tbl,
                styles_tbl$locname %in% c("columns_groups") &
                styles_tbl$grpname %in% spanner_row_ids[i]
              )
            cell_style <- cell_style$styles[1][[1]]

            ## check if there are any open cells above to determine
            spanner_cell_vals[[length(spanner_cell_vals) + 1]] <-
              xml_table_cell(
                content = spanner_row_values[i],
                font = cell_style[["cell_text"]][["font"]],
                size = cell_style[["cell_text"]][["size"]] %||% 20,
                color = cell_style[["cell_text"]][["color"]],
                style = cell_style[["cell_text"]][["style"]],
                weight = cell_style[["cell_text"]][["weight"]],
                stretch = cell_style[["cell_text"]][["stretch"]],
                whitespace = cell_style[["cell_text"]][["whitespace"]],
                align = cell_style[["cell_text"]][["align"]] %||% "center",
                v_align = cell_style[["cell_text"]][["v_align"]],
                fill = cell_style[["cell_fill"]][["color"]],
                col_span = colspans[i],
                border = list(
                  left = if (i == 1) { cell_border(color = column_labels_vlines_color) },
                  right = if (i == (length(spanner_row_values) + 1 - colspans[i] )) { cell_border(color = column_labels_vlines_color) },
                  bottom = cell_border(size = 16, color = column_labels_border_bottom_color),
                  top = if (span_row_idx == 1) { cell_border(size = 16, color = column_labels_border_top_color) }
                ),
                keep_with_next = keep_with_next
              )
          }
        }
      }


      table_col_headings_list[[length(table_col_headings_list) + 1 ]] <-
        xml_tr(
          xml_trPr(
            if (!split) { xml_cantSplit() },
            xml_tbl_header()
          ),
          paste(
            vapply(
              spanner_cell_vals,
              FUN.VALUE = character(1L),
              FUN = paste
            ),
            collapse = ""
          )
        )
    }
  }

  do.call(htmltools::tagList, rev(table_col_headings_list))
}

# Create the table body component (OOXML)
create_body_component_xml <- function(
    data,
    split = FALSE,
    keep_with_next = TRUE
) {

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
  col_alignment <- vctrs::vec_slice(boxh$column_align, boxh$type == "default")

  # Determine whether the stub is available through analysis
  # of the `stub_components`
  stub_available <- dt_stub_components_has_rowname(stub_components) || summaries_present

  # Obtain all of the visible (`"default"`), non-stub
  # column names for the table
  default_vars <- dt_boxhead_get_vars_default(data = data)

  all_default_vals <- unname(as.matrix(body[, default_vars]))

  alignment <- col_alignment

  if (stub_available) {

    n_cols <- n_data_cols + 1

    alignment <- c("left", alignment)

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
  column_series <- seq_len(n_cols)

  if (anyNA(groups_rows_df$group_label)) {
    # Replace an NA group with an empty string
    groups_rows_df$group_label[is.na(groups_rows_df$group_label)] <- ""
    # Change NA at beginning into unicode?
    groups_rows_df$group_label <-
      gsub(
        "^NA", "\u2014",
        groups_rows_df$group_label
    )
  }

  body_rows <-
    lapply(
      seq_len(n_rows),
      function(i) {

        body_section <- list()


        #
        # Create a group heading row
        #

        if (!is.null(groups_rows_df) && i %in% groups_rows_df$row_start) {

          group_label <-
            groups_rows_df[
              which(groups_rows_df$row_start %in% i), "group_label"
            ][[1]]

          cell_style <-
            vctrs::vec_slice(
              styles_tbl,
              styles_tbl$locname == "row_groups" &
                styles_tbl$rownum == (i - 0.1)
            )
          cell_style <- cell_style$styles[1][[1]]

          group_heading_row <-
            xml_tr(
              xml_trPr(
                if (!split) { xml_cantSplit() }
              ),
              xml_table_cell(
                content = group_label,
                font = cell_style[["cell_text"]][["font"]],
                size = cell_style[["cell_text"]][["size"]] %||% 20,
                color = cell_style[["cell_text"]][["color"]],
                style = cell_style[["cell_text"]][["style"]],
                weight = cell_style[["cell_text"]][["weight"]],
                stretch = cell_style[["cell_text"]][["stretch"]],
                whitespace = cell_style[["cell_text"]][["whitespace"]],
                align = cell_style[["cell_text"]][["align"]],
                v_align = cell_style[["cell_text"]][["v_align"]],
                col_span = n_cols,
                fill = cell_style[["cell_fill"]][["color"]],
                margins = list(
                  top = cell_margin(width = 25)
                ),
                border = list(
                  top = cell_border(size = 16, color = row_group_border_top_color),
                  bottom = cell_border(size = 16, color = row_group_border_bottom_color),
                  left = cell_border(color = row_group_border_left_color),
                  right = cell_border(color = row_group_border_right_color)
                ),
                keep_with_next = keep_with_next
              )
            )

          body_section <- append(body_section, list(group_heading_row))
        }

        #
        # Create a body row
        #

        row_cells <- list()
        row_idx <- i
        row_vec <- output_df_row_as_vec(i)

        for (y in seq_along(row_vec)) {

          style_col_idx <- ifelse(stub_available, y - 1, y)

          cell_style <-
            vctrs::vec_slice(
              styles_tbl,
              styles_tbl$locname %in% c("data","stub") &
              styles_tbl$rownum == i &
              styles_tbl$colnum == style_col_idx
            )
          cell_style <- cell_style$styles[1][[1]]

          row_cells[[length(row_cells) + 1]] <-
            xml_table_cell(
              content = row_vec[y],
              font = cell_style[["cell_text"]][["font"]],
              size = cell_style[["cell_text"]][["size"]],
              color = cell_style[["cell_text"]][["color"]],
              style = cell_style[["cell_text"]][["style"]],
              weight = cell_style[["cell_text"]][["weight"]],
              stretch = cell_style[["cell_text"]][["stretch"]],
              whitespace = cell_style[["cell_text"]][["whitespace"]],
              align = cell_style[["cell_text"]][["align"]] %||% alignment[y],
              v_align = cell_style[["cell_text"]][["v_align"]],
              border = list(
                top = cell_border(color = table_body_hlines_color),
                bottom = cell_border(color = table_body_hlines_color),
                left = cell_border(color = table_body_vlines_color),
                right = cell_border(color = table_body_vlines_color)
              ),
              fill = cell_style[["cell_fill"]][["color"]],
              keep_with_next = keep_with_next
            )
        }

        body_row <-
          xml_tr(
            xml_trPr(
              if (!split) { xml_cantSplit() }
            ),
            paste(
              vapply(
                row_cells,
                FUN.VALUE = character(1L),
                FUN = paste
              ), collapse = ""
            )
          )



        #
        # Add groupwise summary rows.
        #

        if (summaries_present && nrow(groups_rows_df) > 0) {

          group_info <- groups_rows_df[
            i >= groups_rows_df$row_start & i <= groups_rows_df$row_end, ]

          group_summary_row_side <- unique(group_info[, "summary_row_side"])[[1]]
          # https://github.com/rstudio/gt/issues/2000
          group_summary_row_side <- ifelse(is.na(group_summary_row_side), "bottom", group_summary_row_side)
          group_row_add_row_loc <- group_info[,ifelse(group_summary_row_side == "top", "row_start","row_end")][[1]]

          if (i == group_row_add_row_loc) {

            summary_styles <-
              vctrs::vec_slice(
                styles_tbl,
                styles_tbl$locname %in% c("summary_cells") &
                styles_tbl$grpname %in% group_info[["group_id"]]
              )
            summary_styles$rownum <- ceiling(summary_styles$rownum * 100 - i * 100)

            summary_section <-
              summary_rows_xml(
                list_of_summaries = list_of_summaries,
                boxh = boxh,
                group_id = group_info[["group_id"]],
                locname = "summary_cells",
                col_alignment = col_alignment,
                table_body_hlines_color = table_body_hlines_color,
                table_body_vlines_color = table_body_vlines_color,
                styles = summary_styles,
                split = split,
                keep_with_next = keep_with_next
              )

            if (group_summary_row_side == "top") {
              body_section <- append(body_section, summary_section)
              body_section <- append(body_section, list(body_row))
            } else {
              body_section <- append(body_section, list(body_row))
              body_section <- append(body_section, summary_section)
            }
          } else {
            body_section <- append(body_section, list(body_row))
          }
        } else {
            body_section <- append(body_section, list(body_row))
        }

        body_section
      }
    )

  body_rows <- flatten_list(body_rows)

  #
  # Add grand summary rows
  #

  if (summaries_present &&
      grand_summary_col %in% names(list_of_summaries$summary_df_display_list)) {

    summary_styles <-
      vctrs::vec_slice(
        styles_tbl,
        styles_tbl$locname %in% "grand_summary_cells" &
          styles_tbl$grpname %in% c("::GRAND_SUMMARY")
      )

    grand_summary_section <-
      summary_rows_xml(
        list_of_summaries = list_of_summaries,
        boxh = boxh,
        group_id = grand_summary_col,
        locname = "grand_summary_cells",
        col_alignment = col_alignment,
        table_body_hlines_color = table_body_hlines_color,
        table_body_vlines_color = table_body_vlines_color,
        styles = summary_styles,
        split = split,
        keep_with_next = keep_with_next
      )

    grand_summary_loc <- unique(list_of_summaries$summary_df_display_list[[grand_summary_col]][["::side::"]])

    if (grand_summary_loc == "top") {
      body_rows <- c(grand_summary_section, body_rows)
    } else {
      body_rows <- c(body_rows, grand_summary_section)
    }
  }

  htmltools::tagList(body_rows)
}

#' Create the table source note component (OOXML)
#'
#' @noRd
create_source_notes_component_xml <- function(
    data,
    split = FALSE,
    keep_with_next = TRUE
) {

  source_note <- dt_source_notes_get(data = data)

  if (is.null(source_note)) {
    return("")
  }

  stub_components <- dt_stub_components(data = data)

  cell_style <- dt_styles_get(data = data)
  cell_style <- cell_style[cell_style$locname == "source_notes", "styles", drop = TRUE]
  cell_style <- cell_style[1][[1]]

  n_data_cols <- length(dt_boxhead_get_vars_default(data = data))

  # Determine whether the stub is available
  stub_available <- dt_stub_components_has_rowname(stub_components = stub_components)

  if (stub_available) {
    n_cols <- n_data_cols + 1
  } else {
    n_cols <- n_data_cols
  }

  source_note_rows <-
    lapply(
      source_note,
      function(x) {

        source_note_xml <- parse_to_xml(x)

        source_note_content <- paste0(
            "<md_container>",
            as.character(source_note_xml),
            "</md_container>"
          )

        as.character(
          xml_tr(
            xml_trPr(
              if (!split) { xml_cantSplit() }
            ),
            xml_table_cell(
              content = source_note_content,
              font = cell_style[["cell_text"]][["font"]],
              size = cell_style[["cell_text"]][["size"]] %||% 20,
              color = cell_style[["cell_text"]][["color"]],
              style = cell_style[["cell_text"]][["style"]],
              weight = cell_style[["cell_text"]][["weight"]],
              stretch = cell_style[["cell_text"]][["stretch"]],
              whitespace = cell_style[["cell_text"]][["whitespace"]],
              align = cell_style[["cell_text"]][["align"]],
              v_align = cell_style[["cell_text"]][["v_align"]],
              col_span = n_cols,
              fill = cell_style[["cell_fill"]][["color"]],
              keep_with_next = keep_with_next
            )
          )
        )
      }
    )

  paste0(unlist(source_note_rows), collapse = "\n")
}

#' Create the table footnote component (OOXML)
#'
#' @noRd
create_footnotes_component_xml <- function(
    data,
    split = FALSE,
    keep_with_next = TRUE
) {

  footnotes_tbl <- dt_footnotes_get(data = data)

  # If the `footnotes_resolved` object has no
  # rows, then return an empty footnotes component
  if (nrow(footnotes_tbl) == 0L) {
    return("")
  }

  stub_components <- dt_stub_components(data = data)

  cell_style <- dt_styles_get(data = data)
  cell_style <- cell_style[cell_style$locname == "footnotes", "styles", drop = TRUE]
  cell_style <- cell_style[1][[1]]

  n_data_cols <- length(dt_boxhead_get_vars_default(data = data))

  # Determine whether the stub is available
  stub_available <- dt_stub_components_has_rowname(stub_components = stub_components)

  if (stub_available) {
    n_cols <- n_data_cols + 1
  } else {
    n_cols <- n_data_cols
  }

  footnotes_tbl <-
    dplyr::distinct(footnotes_tbl, fs_id, footnotes)

  # Get the footnote separator option
  separator <- dt_options_get_value(data = data, option = "footnotes_sep")

  footnote_ids <- footnotes_tbl[["fs_id"]]
  footnote_text <- footnotes_tbl[["footnotes"]]

  footnote_rows <-
    lapply(
      seq_along(footnote_ids),
      function(x) {
        # in the build stage, we don't process markdown for footnote text
        # So, we process it now https://github.com/rstudio/gt/issues/1892
        footnote_text_xml <- parse_to_xml(process_text(footnote_text[[x]], context = "word"))

        # Get the footnote marks for the subtitle. Don't write
        # marks when footnote value is NA or ""
        if (!is.na(footnote_ids[x]) && !identical(footnote_ids[x], "")) {

          footnote_id_xml <- footnote_mark_to_xml(
            data = data,
            mark = footnote_ids[x],
            location = "ftr"
            )

          xml_add_child(
            footnote_text_xml,
            as_xml_node(footnote_id_xml),
            .where = 1
          )
        }

        footnote_content <-
          paste0(
            "<md_container>",
            as.character(footnote_text_xml),
            "</md_container>"
          )

        as.character(
          xml_tr(
            xml_trPr(
              if (!split) { xml_cantSplit() }
            ),
            xml_table_cell(
              content = footnote_content,
              font = cell_style[["cell_text"]][["font"]],
              size = cell_style[["cell_text"]][["size"]],
              color = cell_style[["cell_text"]][["color"]],
              style = cell_style[["cell_text"]][["style"]],
              weight = cell_style[["cell_text"]][["weight"]],
              stretch = cell_style[["cell_text"]][["stretch"]],
              whitespace = cell_style[["cell_text"]][["whitespace"]],
              align = cell_style[["cell_text"]][["align"]],
              v_align = cell_style[["cell_text"]][["v_align"]],
              col_span = n_cols,
              fill = cell_style[["cell_fill"]][["color"]],
              keep_with_next = keep_with_next
            )
          )
        )
      }
    )

  paste0(unlist(footnote_rows), collapse = "\n")
}

summary_rows_xml <- function(
    list_of_summaries,
    boxh,
    group_id,
    locname,
    col_alignment,
    table_body_hlines_color,
    table_body_vlines_color,
    styles,
    split = FALSE,
    keep_with_next = TRUE
) {

  # Obtain all of the visible (`"default"`), non-stub column names
  # for the table from the `boxh` object
  default_vars <- boxh[boxh$type == "default", "var", drop = TRUE]

  summary_row_lines <- list()

  if (group_id %in% names(list_of_summaries$summary_df_display_list)) {

    # Obtain the summary data table specific to the group ID and
    # select the column named `rowname` and all of the visible columns
    summary_df <-
      dplyr::select(
        list_of_summaries$summary_df_display_list[[group_id]],
        dplyr::all_of(c(rowname_col_private, default_vars))
      )

    summary_df_row <- function(j) {
      unname(unlist(summary_df[j, ]))
    }

    for (j in seq_len(nrow(summary_df))) {

      summary_row_cells <- list()

      for (y in seq_along(summary_df_row(j))) {

        cell_style <-
          dplyr::filter(
            styles,
            rownum == j,
            colnum == y - 1
          )
        cell_style <- cell_style$styles[1L][[1L]]

        summary_row_cells[[length(summary_row_cells) + 1]] <-
          xml_table_cell(
            content = summary_df_row(j)[y],
            font = cell_style[["cell_text"]][["font"]],
            size = cell_style[["cell_text"]][["size"]],
            color = cell_style[["cell_text"]][["color"]],
            style = cell_style[["cell_text"]][["style"]],
            weight = cell_style[["cell_text"]][["weight"]],
            stretch = cell_style[["cell_text"]][["stretch"]],
            whitespace = cell_style[["cell_text"]][["whitespace"]],
            align = cell_style[["cell_text"]][["align"]],
            v_align = cell_style[["cell_text"]][["v_align"]],
            fill = cell_style[["cell_fill"]][["color"]],
            border = list(
                "top" = cell_border(size = if (j == 1) 16 else 2, color = table_body_hlines_color),
                "bottom" = cell_border(size = if (j == nrow(summary_df)) 16 else 2, color = table_body_hlines_color),
                "left" = cell_border(color = table_body_vlines_color),
                "right" = cell_border(color = table_body_vlines_color)
            ),
            margins = list(
                "top" = cell_margin(width = 50)
            ),
            keep_with_next = keep_with_next
          )
      }

      summary_row <-
        xml_tr(
          xml_trPr(
            if (!split) { xml_cantSplit() }
          ),
          paste(
            vapply(
              summary_row_cells,
              FUN.VALUE = character(1L),
              FUN = paste
            ), collapse = ""
          )
        )

      summary_row_lines <- append(summary_row_lines, list(summary_row))
    }
  }

  summary_row_lines
}

# Constructing Table Cells ----

cell_border <- function(
    color = "#D3D3D3",
    size = NULL,
    type = "single"
) {

  list(
    color = color,
    size = size,
    type = type,
    type = NULL
  )
}

cell_margin <- function(width, type = c("dxa", "nil")) {

  type <- rlang::arg_match(type)

  list(
    width = width,
    type = type
  )
}

stretch_to_xml_stretch <- function(x) {

  x <-
    rlang::arg_match(
      x,
      values = c(
        "ultra-condensed",
        "extra-condensed",
        "condensed",
        "semi-condensed",
        "normal",
        "semi-expanded",
        "expanded",
        "extra-expanded",
        "ultra-expanded"
      )
    )

  c(
    "ultra-condensed" = -60,
    "extra-condensed" = -40,
    "condensed" = -20,
    "semi-condensed" = 0,
    "normal" = 20,
    "semi-expanded" = 40,
    "expanded" = 60,
    "extra-expanded" = 80,
    "ultra-expanded" = 100
  )[x]
}

v_align_to_xml_v_align <- function(x) {

  x <- rlang::arg_match(x, values = c("middle", "top", "bottom"))

  c(
    "middle" = "center",
    "bottom" = "bottom",
    "top" = "top"
  )[x]
}

row_span_to_xml_v_merge <- function(x) {

  x <- rlang::arg_match(x, values = c("start", "continue"))

  c(
    "continue" = "continue",
    "start" = "restart"
  )[x]
}

white_space_to_t_xml_space <- function(x = NULL) {

  # Default behavior we want
  spacing <- "default"

  if (isTRUE(x %in% c( "pre", "pre-wrap", "pre-line","break-spaces"))) {
    spacing <- "preserve"
  }

  spacing
}

white_space_in_text <- function(x, whitespace = NULL) {

  ##options for white space: normal, nowrap, pre, pre-wrap, pre-line, break-spaces
  ## normal drops all newlines and collapse spaces
  ## general behavior based on: https://developer.mozilla.org/en-US/docs/Web/CSS/white-space

  ## collapse white spaces unless preserving it
  if (!isTRUE(whitespace %in% c( "pre", "pre-wrap", "break-spaces"))) {
    x <- gsub("\\s+|\\t+", " ", x)
  }

  x
}

# Define OOXML table cells
xml_table_cell <- function(
    content = NULL,
    size = NULL,
    font = NULL,
    color = NULL,
    style = NULL,
    weight = NULL,
    stretch = NULL,
    whitespace = NULL,
    paragraph_style = NULL,
    align = NULL,
    v_align = NULL,
    col_span = NULL,
    row_span = NULL,
    fill = NULL,
    margins = NULL,
    border = NULL,
    keep_with_next = TRUE
) {

  xml_tc(
    xml_tcPr(
      if (!is.null(border)) {
        xml_tc_borders(
          if (!is.null(border[["top"]])) { xml_border("top", color = border[["top"]][["color"]], size = border[["top"]][["size"]], type = border[["top"]][["type"]]) },
          if (!is.null(border[["bottom"]])) { xml_border("bottom", color = border[["bottom"]][["color"]], size = border[["bottom"]][["size"]], type = border[["bottom"]][["type"]]) },
          if (!is.null(border[["left"]])) { xml_border("left", color = border[["left"]][["color"]], size = border[["left"]][["size"]], type = border[["left"]][["type"]]) },
          if (!is.null(border[["right"]])) { xml_border("right", color = border[["right"]][["color"]], size = border[["right"]][["size"]], type = border[["right"]][["type"]]) }
        )
      },
      if (!is.null(fill)) { xml_shd(fill = fill) },
      if (!is.null(row_span)) { xml_v_merge(val = row_span_to_xml_v_merge(row_span)) },
      if (!is.null(v_align)) { xml_v_align(v_align = v_align_to_xml_v_align(v_align)) },
      if (!is.null(margins)) {
        xml_tc_margins(
          if (!is.null(margins[["top"]])) { xml_width("top", width = margins[["top"]][["width"]], type = margins[["top"]][["type"]]) },
          if (!is.null(margins[["bottom"]])) { xml_width("bottom", width = margins[["bottom"]][["width"]], type = margins[["bottom"]][["type"]]) },
          if (!is.null(margins[["left"]])) { xml_width("left", width = margins[["left"]][["width"]], type = margins[["left"]][["type"]]) },
          if (!is.null(margins[["right"]])) { xml_width("right", width = margins[["right"]][["width"]], type = margins[["right"]][["type"]]) }
        )
      },
      if (!is.null(col_span)) {
        as_xml_node(xml_gridSpan(val = as.character(col_span)))
      }
    ),
    process_cell_content(
      content,
      font = font %||% "Calibri",
      size = size %||% 20,
      color = color,
      style = style,
      paragraph_style = paragraph_style,
      weight = weight,
      whitespace = whitespace,
      align = align,
      col_span = col_span,
      stretch = stretch,
      keep_with_next = keep_with_next
    )
  )
}

# Table Cell content management/Processing ----

process_cell_content <- function(x, ...) {

  processed <- parse_to_xml(x)
  processed <- process_cell_content_ooxml_t(processed, ...)
  processed <- process_cell_content_ooxml_r(processed, ...)
  processed <- process_cell_content_ooxml_p(processed, ...)
  processed <- process_white_space_br_in_xml(processed, ...)
  processed <- process_drop_empty_styling_nodes(processed)
  paste0(as.character(processed), collapse = "")
}

process_cell_content_ooxml_t <- function(
    x,
    ...,
    whitespace = NULL
) {

  text_tag <- xml_find_all(x, "//w:t")

  for (txt in text_tag) {

    text_tag_content <- xml_text(txt)
    text_tag_attr <- xml_attr(txt, "space")

    # If it's already set to preserve, respect preservation

    if (text_tag_attr != "preserve") {
      xml_text(txt) <- white_space_in_text(x = text_tag_content, whitespace = whitespace)
      xml_attr(txt, attr = "xml:space") <- white_space_to_t_xml_space(whitespace)
    }
  }

  x
}

process_cell_content_ooxml_r <- function(
    x,
    ...,
    font = NULL,
    size = NULL,
    color = NULL,
    style = NULL,
    weight = NULL
) {

  # Cell level styles
  cell_styles <-
    list(
      as_xml_node(
        xml_r_font(
          ascii_font = font ,
          ansi_font = font
        )
      ),
      as_xml_node(xml_sz(val = size %||% 20)),
      if (!is.null(color)) {
        as_xml_node(xml_color(color = color))
      },
      if (identical(style, "italic")) {
        as_xml_node(xml_i())
      },
      if (identical(weight, "bold")) {
        as_xml_node(xml_b())
      }
    )

  cell_styles <- cell_styles[!sapply(cell_styles, is.null)]

  cell_styles_types <- sapply(cell_styles,xml_name)

  ## pull run styles from x
  run_tags <- xml_find_all(x, "//w:r")

  for (run in run_tags) {

      run_image <- xml_find_first(run, ".//w:drawing")
      run_style <- xml_find_first(run, ".//w:rPr")

      if (length(run_image) > 0L) {

        if (length(xml_find_first(run, ".//w:noProof")) == 0L) {
          xml_add_child(
            run_style,
            as_xml_node(xml_noProof())[[1L]]
          )
        }

      } else {

        run_style_children <- xml_children(run_style)
        run_style_children_types <- sapply(run_style_children,xml_name, ns = xml_ns(x))

        ## which styles are new. Add those. Respect ones that already exist and do not update
        new_cell_styles <- which(!cell_styles_types %in% run_style_children_types)

        for (cell_style_idx in new_cell_styles) {
          xml_add_child(
            run_style,
            cell_styles[[cell_style_idx]][[1L]]
          )
        }
      }
  }

  x
}

process_cell_content_ooxml_p <- function(
    x,
    ...,
    align = NULL,
    col_span = NULL,
    stretch = NULL,
    keep_with_next = TRUE,
    whitespace = NULL,
    paragraph_style = NULL
) {

  ## cell level styles
  cell_styles <- list(
    as_xml_node(
      xml_spacing(before = 0, after = 60)
    ),
    if (keep_with_next) {
      as_xml_node(xml_keepNext())
    },
    if (!is.null(stretch)) {
      as_xml_node(xml_rPr(
        xml_spacing(val = stretch_to_xml_stretch(stretch))
      ))
    },
    if (!is.null(align)) {
      as_xml_node(xml_jc(val = align))
    },
    if (!is.null(paragraph_style)) {
      as_xml_node(xml_pStyle(val = paragraph_style))
    }
  )

  cell_styles <- cell_styles[!sapply(cell_styles, is.null)]

  cell_styles_types <- sapply(cell_styles,xml_name)

  ## pull run styles from x
  paragraph_tags <- xml_find_all(x, "//w:p")

  if (length(paragraph_tags) == 0L) {

    p_node <- as_xml_node(xml_p(xml_pPr()))
    x <- xml_add_child(p_node, x)

    paragraph_tags <- xml_find_all(x, "//w:p")
  }

  for (paragraph in paragraph_tags) {

    paragraph_image <- xml_find_first(paragraph, ".//w:drawing")

    if (length(paragraph_image) > 0L) {
      next
    }

    paragraph_style <- xml_find_all(paragraph, ".//w:pPr")

    paragraph_style_children <- xml_children(paragraph_style)
    paragraph_style_children_types <- sapply(paragraph_style_children,xml_name, xml_ns(x))

    ## which styles are new?
    new_cell_styles <- which(!cell_styles_types %in% paragraph_style_children_types)

    for (cell_style_idx in new_cell_styles) {
        xml_add_child(
          paragraph_style,
          cell_styles[[cell_style_idx]][[1L]]
        )
    }
  }

  x
}

process_white_space_br_in_xml <- function(x, ..., whitespace = NULL) {

  ## Options for white space: normal, nowrap, pre, pre-wrap, pre-line, break-spaces
  ## normal drops all newlines and collapse spaces
  ## general behavior based on: https://developer.mozilla.org/en-US/docs/Web/CSS/white-space

  ## Remove newlines (br) unless preserving it
  if (!isTRUE(whitespace %in% c("pre", "pre-wrap", "pre-line", "break-spaces"))) {

    paragraphs <- xml_find_all(x, "//w:p")

    for (p in paragraphs) {

      paragraph_children <- xml_children(p)

      break_tags_locs <- which(xml_name(paragraph_children, ns = xml_ns(x)) == "w:br")
      run_tags_locs <-  which(xml_name(paragraph_children, ns = xml_ns(x)) == "w:r")

      if (length(break_tags_locs) > 0L) {


        for (break_tag_loc in break_tags_locs) {

          break_tag <- paragraph_children[[break_tag_loc]]

          ## if the br is between two runs, replace with space
          if (any(run_tags_locs > break_tag_loc) && any(run_tags_locs < break_tag_loc)) {

            replacement_br <-
              xml_r(xml_rPr(), xml_t(" ", xml_space = "preserve"))
            replacement_br <- as_xml_node(replacement_br, create_ns = TRUE)
            replacement_br <-  process_cell_content_ooxml_t(replacement_br, ...)
            replacement_br <- process_cell_content_ooxml_r(replacement_br, ...)[[1]]

            xml_add_sibling(
              break_tag,
              replacement_br,
              .where = "after"
            )
          }

          xml_remove(break_tag)
        }
      }
    }
  }

  x
}

process_drop_empty_styling_nodes <- function(x) {

  paragraph_styles <- xml_find_all(x, ".//w:pPr")

  for (p_style in paragraph_styles) {
    style_children <- xml_children(p_style)

    if (length(style_children) == 0L) {
      xml_remove(p_style)
    }
  }

  run_styles <- xml_find_all(x, ".//w:rPr")

  for (r_style in run_styles) {
    style_children <- xml_children(r_style)

    if (length(style_children) == 0L) {
      xml_remove(r_style)
    }
  }

  x
}

add_text_style <- function(x, style) {
  UseMethod("add_text_style", x)
}

#' @export
add_text_style.character <- function(x, style) {

  x <- as_xml_node(x, create_ns = TRUE)
  style_to_add <- as_xml_node(style)
  run_style_tag <- xml_find_all(x, "./w:rPr")

  xml_add_child(
    run_style_tag,
    style_to_add
  )

  as.character(x)
}

#' @export
add_text_style.shiny.tag <- function(x, style) {

  x <- as.character(x)

  add_text_style.character(x, style = style)
}

# character to xml conversion ----

## if wrapped in xml, convert to html
parse_to_xml <- function(x, ...) {

  ##check if wrapped in ooxml
  ## get what it starts with and assign

  if (is.null(x)) {
    x <-
      xml_p(
        xml_pPr(
          xml_spacing(before = 0, after = 60)
        ),
        xml_r(
          xml_rPr(),
          xml_t()
        )
      )

    x <-
      paste0("<md_container>", as.character(x), "</md_container>")
  }

  if (length(x) > 1) {

    if (all(grepl("^<md_container>.*</md_container>$", x))) {

      x <- gsub("^<md_container>(.*)</md_container>$", "\\1", x)
      x <- paste0(x, collapse = "")
      x <- paste0("<md_container>", x, "</md_container>")

    } else {
      x <- paste0(x, collapse = "")
    }
  }

  if (!grepl("^<md_container>.*</md_container>$", x)) {

    x <-
      xml_p(
        xml_pPr(
          xml_spacing(before = 0, after = 60)
        ),
        xml_r(
          xml_rPr(),
          xml_t(enc2utf8(htmltools::htmlEscape(x)))
        )
      )

    x <-
      paste0("<md_container>", as.character(x), "</md_container>")
  }

  ## add namespace for later processing
  parsed_xml_contents <-
    suppressWarnings(read_xml(add_ns(x)))

  xml_children(parsed_xml_contents)
}

as_xml_node <- function(x, create_ns = FALSE) {

  x <- paste(
    "<node_container>",
    as.character(x),
    "</node_container>"
  )

  if (create_ns) {
    x <- add_ns(x)
  }

  suppressWarnings(xml_children(as_xml_document(x)))
}

add_ns <- function(x) {

  x <- suppressWarnings(read_xml(x))

  xml2::xml_set_attrs(
    x,
    c(
      `xmlns:r` = "http://schemas.openxmlformats.org/officeDocument/2006/relationships",
      `xmlns:w` = "http://schemas.openxmlformats.org/wordprocessingml/2006/main",
      `xmlns:w14` = "http://schemas.microsoft.com/office/word/2010/wordml",
      `xmlns:wp` = "http://schemas.openxmlformats.org/drawingml/2006/wordprocessingDrawing"
    )
  )

  as.character(x)
}

paste_footnote_xml <- function(
    text,
    footmark_xml,
    position = "right"
) {

  text_xml <- parse_to_xml(text)

  position <- match.arg(position, c("left","right"))

  footmark_xml <-
    as_xml_node(footmark_xml)[[1L]]

  if (position == "right") {
    xml_add_child(text_xml, footmark_xml)
  } else {
    xml_add_child(text_xml, footmark_xml, .where = 1)
  }

  paste0("<md_container>", as.character(text_xml), "</md_container>")
}

paste_footnote_latex <- function(
    text,
    footmark_latex,
    position = "right"
) {

  # This encodes the footnote marke and position into the text which
  # will allow it to be separated when formatting by calls to tab_style
  paste0(text, "%%%", position, ":", footmark_latex)

}

# Post-Processing word documents as needed -----

## if hyperlinks are in gt, postprocessing will be necessary
needs_gt_as_word_post_processing <- function(x) {
  any(grepl("<w:hyperlink", x, fixed = TRUE)) |
    any(grepl("<a:blip", x, fixed = TRUE))
}

## apply postprocessing
## at this point, only url relationship rId updating, but can expand to more in the future
gt_as_word_post_processing <- function(path) {

  # Unzip doc
  tmp_word_dir <- tempfile(pattern = "word_dir")
  utils::unzip(zipfile = path, exdir = tmp_word_dir)

  # Load docx
  content_doc_path <- file.path(tmp_word_dir, "word/document.xml")
  docx <- read_xml(content_doc_path)

  ## load word/_rels
  rels_doc_path <- file.path(tmp_word_dir, "word/_rels/document.xml.rels")
  rels <- read_xml(rels_doc_path)

  ## load content_types
  content_type_doc_path <- file.path(tmp_word_dir, "[Content_Types].xml")
  content_types <- create_xml_contents()

  ## update hyperlinks & blips
  update_hyperlink_node_id(docx, rels)
  update_blip_node_id(docx, rels, content_types, tmp_word_dir)

  ## update all ids
  update_ref_id(docx)

  ## Update settings
  settings_doc_path <- file.path(tmp_word_dir, "word/settings.xml")
  doc_settings <- create_doc_settings()

  ## end section
  ensure_sect_end(docx)

  ## write updates
  xml2::write_xml(doc_settings, settings_doc_path)
  xml2::write_xml(rels, rels_doc_path)
  xml2::write_xml(content_types, content_type_doc_path)
  xml2::write_xml(docx, content_doc_path)

  # Unzip contents
  zip_temp_word_doc(path, tmp_word_dir)
}

create_doc_settings <- function() {

  settings_xml <- as_xml_document("<?xml version=\"1.0\" encoding=\"UTF-8\" standalone=\"yes\"?>
    <w:settings xmlns:mc=\"http://schemas.openxmlformats.org/markup-compatibility/2006\" xmlns:o=\"urn:schemas-microsoft-com:office:office\" xmlns:r=\"http://schemas.openxmlformats.org/officeDocument/2006/relationships\" xmlns:m=\"http://schemas.openxmlformats.org/officeDocument/2006/math\" xmlns:v=\"urn:schemas-microsoft-com:vml\" xmlns:w10=\"urn:schemas-microsoft-com:office:word\" xmlns:w=\"http://schemas.openxmlformats.org/wordprocessingml/2006/main\" xmlns:w14=\"http://schemas.microsoft.com/office/word/2010/wordml\" xmlns:w15=\"http://schemas.microsoft.com/office/word/2012/wordml\" xmlns:w16cex=\"http://schemas.microsoft.com/office/word/2018/wordml/cex\" xmlns:w16cid=\"http://schemas.microsoft.com/office/word/2016/wordml/cid\" xmlns:w16=\"http://schemas.microsoft.com/office/word/2018/wordml\" xmlns:w16sdtdh=\"http://schemas.microsoft.com/office/word/2020/wordml/sdtdatahash\" xmlns:w16se=\"http://schemas.microsoft.com/office/word/2015/wordml/symex\" xmlns:sl=\"http://schemas.openxmlformats.org/schemaLibrary/2006/main\" mc:Ignorable=\"w14 w15 w16se w16cid w16 w16cex w16sdtdh\">
    </w:settings>
    ")

  settings_to_add <- list(
    zoom = "<w:zoom w:percent=\"130\"/>",
    defaultTabStop = "<w:defaultTabStop w:val=\"720\"/>",
    hyphenationZone = "<w:hyphenationZone w:val=\"360\"/>",
    decimalSymbol = "<w:decimalSymbol w:val=\".\"/>",
    listSeparator = "<w:listSeparator w:val=\",\"/>",
    compat = "<w:compat><w:compatSetting w:name=\"compatibilityMode\" w:uri=\"http://schemas.microsoft.com/office/word\" w:val=\"15\"/></w:compat>"
  )

  for (new_setting in names(settings_to_add)) {

    xml_add_child(
      settings_xml,
      as_xml_node(settings_to_add[[new_setting]])[[1]]
    )
  }

  settings_xml
}

update_hyperlink_node_id <- function(docx, rels) {

  rels_relationships <- xml_children(rels)
  rels_ids <- xml_attr(rels_relationships, "Id")
  max_id <- max(as.numeric(gsub("rId", "", rels_ids, fixed = TRUE)))

  # Get all hyperlink nodes
  hyperlink_nodes <- xml_find_all(docx, "//w:hyperlink[@r:id]")

  # Identify nodes needing updating
  hyperlink_nodes <-
    hyperlink_nodes[!grepl("^rId\\d+$", xml_attr(hyperlink_nodes, "id"))]

  for (hl_node in hyperlink_nodes) {

    max_id <- max_id + 1
    url <- xml_attr(hl_node, "id")
    new_id <- paste0("rId", max_id)

    xml2::xml_add_child(
      rels,
      xml_relationship(id = new_id, target = url)
    )

    xml_attr(hl_node, "r:id") <- new_id
  }
}

update_blip_node_id <- function(docx, rels, content_types, tmp_word_dir) {

  ## get relationships
  rels_relationships <- xml_children(rels)
  rels_ids <- xml_attr(rels_relationships, "Id")
  max_id <- max(as.numeric(gsub("rId", "", rels_ids, fixed = TRUE)))

  ## get all blip nodes (binary li)
  blip_nodes <-
    xml_find_all(
      docx,
      "//a:blip[@r:embed]",
      ns = c(
        a = "http://schemas.openxmlformats.org/drawingml/2006/main",
        r = "http://schemas.openxmlformats.org/officeDocument/2006/relationships"
        )
    )

  ## identify nodes needing updating
  blip_nodes <- blip_nodes[!grepl("^rId\\d+$", xml_attr(blip_nodes, "r:embed", ns = c(r = "http://schemas.openxmlformats.org/officeDocument/2006/relationships")))]

  if (length(blip_nodes) > 0) {

    tmp_word_dir_media <- file.path(tmp_word_dir, "word", "media")

    if (!dir.exists(tmp_word_dir_media)) {
      dir.create(tmp_word_dir_media, showWarnings = FALSE)
    }

    for (blip_node_idx in seq_along(blip_nodes)) {

      blip_node <- blip_nodes[[blip_node_idx]]

      max_id <- max_id + 1
      src <- xml_attr(blip_node, "r:embed", ns = c(r = "http://schemas.openxmlformats.org/officeDocument/2006/relationships"))
      src_rel <- file.path("media", basename_clean(src))

      new_id <- paste0("rId", max_id)

      #copy to media folder
      copy_to_media(src, tmp_word_dir_media)

      # add relationship
      xml2::xml_add_child(
        rels,
        xml_relationship(id = new_id, target = src_rel, type = "image", target_mode = NA)
      )

      # xml2::xml_add_child(
      #   content_types,
      #   xml_content_type_override(PartName = file.path("/word",src_rel), ContentType = file.path("image", tools::file_ext(src_rel)))
      # )

      xml_attr(blip_node, "r:embed", ns = c(r = "http://schemas.openxmlformats.org/officeDocument/2006/relationships")) <- new_id

    }
  }
}

update_ref_id <- function(docx) {

  all_uid <- xml_find_all(docx, "//*[@id]")
  int_id <- 1

  for (z in seq_along(all_uid)) {
    if (!grepl("[^0-9]", xml_attr(all_uid[[z]], "id"))) {
      xml_attr(all_uid[[z]], "id") <- int_id
      int_id <- int_id + 1
    }
  }

  int_id
}

ensure_sect_end <- function(docx) {

  body <- xml_child(docx)
  last_body_node <- xml_child(body, search = xml2::xml_length(body))
  new_last_node <-
    paste0(
      "<w:sectPr",
      " xmlns:w=\"http://schemas.openxmlformats.org/wordprocessingml/2006/main\"",
      " xmlns:wp=\"http://schemas.openxmlformats.org/drawingml/2006/wordprocessingDrawing\"",
      " xmlns:r=\"http://schemas.openxmlformats.org/officeDocument/2006/relationships\"",
      " xmlns:w14=\"http://schemas.microsoft.com/office/word/2010/wordml\">",
      "<w:type w:val=\"continuous\"/></w:sectPr>"
    )
  new_last_node <- as_xml_document(new_last_node)

  if (xml_name(last_body_node) != "sectPr") {

    xml_add_child(body, new_last_node)

  } else {

    xml2::xml_replace(
      last_body_node,
      new_last_node
    )
  }
}

copy_to_media <- function(path, media_dir) {

  if (grepl("https?://", path)) {

    utils::download.file(
      url = path,
      destfile = file.path(media_dir, basename_clean(path))
    )

  } else {

    file.copy(
      from = path,
      to = file.path(media_dir, basename_clean(path))
    )
  }
}

basename_clean <- function(x) {
  gsub("\\s+|_", "", basename(x))
}

## conveniently zip up word doc temp folder
zip_temp_word_doc <- function(path, temp_dir) {

  cur_dir <- getwd()

  setwd(temp_dir)
  tryCatch({
    utils::zip(
      zipfile = path,
      files = list.files(path = ".", recursive = TRUE, all.files = TRUE, include.dirs = FALSE),
      flags = "-r9X -q"
    )
  }, finally = {
    setwd(cur_dir)
  })
}

xml_relationship <- function(id, target, type = c("hyperlink", "image"), target_mode = "External") {

  type <- paste0("http://schemas.openxmlformats.org/officeDocument/2006/relationships/", match.arg(type))

  varArgs <- list(
    `Id` = id,
    `Type` = type,
    `Target` = target,
    `TargetMode` = target_mode)

  varArgs <- varArgs[!sapply(varArgs, is.na)]

  tag <- htmltools::tag(
    `_tag_name` = "Relationship",
    varArgs = varArgs
  )

  read_xml(as.character(tag))
}

create_xml_contents <- function() {

  content_types <- as_xml_document("<?xml version=\"1.0\" encoding=\"UTF-8\" standalone=\"yes\"?>
  <Types xmlns=\"http://schemas.openxmlformats.org/package/2006/content-types\"></Types>")

  xml2::xml_add_child(
    content_types,
    xml_content_type_ext(Extension = "rels", ContentType = "application/vnd.openxmlformats-package.relationships+xml"))
  xml2::xml_add_child(
    content_types,
    xml_content_type_ext(Extension = "xml", ContentType = "application/xml"))
  xml2::xml_add_child(
    content_types,
    xml_content_type_ext(Extension = "tiff", ContentType = "image/tiff"))
  xml2::xml_add_child(
    content_types,
    xml_content_type_ext(Extension = "wmf", ContentType = "image/x-wmf"))
  xml2::xml_add_child(
    content_types,
    xml_content_type_ext(Extension = "jpg", ContentType = "application/octet-stream"))
  xml2::xml_add_child(
    content_types,
    xml_content_type_ext(Extension = "emf", ContentType = "image/x-emf"))
  xml2::xml_add_child(
    content_types,
    xml_content_type_ext(Extension = "bmp", ContentType = "image/bmp"))
  xml2::xml_add_child(
    content_types,
    xml_content_type_ext(Extension = "png", ContentType = "image/png"))
  xml2::xml_add_child(
    content_types,
    xml_content_type_ext(Extension = "svg", ContentType = "image/svg+xml"))
  xml2::xml_add_child(
    content_types,
    xml_content_type_ext(Extension = "gif", ContentType = "image/gif"))
  xml2::xml_add_child(
    content_types,
    xml_content_type_ext(Extension = "jpeg", ContentType = "image/jpeg"))

  xml2::xml_add_child(
    content_types,
    xml_content_type_override(PartName = "/word/document.xml", ContentType = "application/vnd.openxmlformats-officedocument.wordprocessingml.document.main+xml"))
  xml2::xml_add_child(
    content_types,
    xml_content_type_override(PartName = "/word/numbering.xml", ContentType = "application/vnd.openxmlformats-officedocument.wordprocessingml.numbering+xml"))
  xml2::xml_add_child(
    content_types,
    xml_content_type_override(PartName = "/word/styles.xml", ContentType = "application/vnd.openxmlformats-officedocument.wordprocessingml.styles+xml"))
  xml2::xml_add_child(
    content_types,
    xml_content_type_override(PartName = "/word/settings.xml", ContentType = "application/vnd.openxmlformats-officedocument.wordprocessingml.settings+xml"))
  xml2::xml_add_child(
    content_types,
    xml_content_type_override(PartName = "/word/webSettings.xml", ContentType = "application/vnd.openxmlformats-officedocument.wordprocessingml.webSettings+xml"))
  xml2::xml_add_child(
    content_types,
    xml_content_type_override(PartName = "/word/fontTable.xml", ContentType = "application/vnd.openxmlformats-officedocument.wordprocessingml.fontTable+xml"))
  xml2::xml_add_child(
    content_types,
    xml_content_type_override(PartName = "/word/theme/theme1.xml", ContentType = "application/vnd.openxmlformats-officedocument.theme+xml"))
  xml2::xml_add_child(
    content_types,
    xml_content_type_override(PartName = "/docProps/core.xml", ContentType = "application/vnd.openxmlformats-package.core-properties+xml"))
  xml2::xml_add_child(
    content_types,
    xml_content_type_override(PartName = "/docProps/app.xml", ContentType = "application/vnd.openxmlformats-officedocument.extended-properties+xml"))
  xml2::xml_add_child(
    content_types,
    xml_content_type_override(PartName = "/docProps/custom.xml", ContentType = "application/vnd.openxmlformats-officedocument.custom-properties+xml"))
  xml2::xml_add_child(
    content_types,
    xml_content_type_override(PartName = "/word/comments.xml", ContentType = "application/vnd.openxmlformats-officedocument.wordprocessingml.comments+xml"))
  xml2::xml_add_child(
    content_types,
    xml_content_type_override(PartName = "/word/footnotes.xml", ContentType = "application/vnd.openxmlformats-officedocument.wordprocessingml.footnotes+xml"))

  content_types
}

xml_content_type_ext <- function(Extension, ContentType) {

  tag <- htmltools::tag(
    `_tag_name` = "Default",
    varArgs = list(
      Extension = Extension,
      ContentType = ContentType
    )
  )
  read_xml(as.character(tag))
}

xml_content_type_override <- function(PartName, ContentType) {

  tag <- htmltools::tag(
    `_tag_name` = "Override",
    varArgs = list(
      PartName = PartName,
      ContentType = ContentType
    )
  )
  read_xml(as.character(tag))
}
