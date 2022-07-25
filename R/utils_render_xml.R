#
# XML tag functions
#

xml_tag_type <- function(tag_name, app) {
  paste0(substring(app, 1, 1), ":", tag_name)
}

# Table
xml_tbl <- function(...,
                    app = "word") {
  htmltools::tag(
    `_tag_name` = xml_tag_type("tbl", app),

    varArgs = list(
      "xmlns:w"="http://schemas.openxmlformats.org/wordprocessingml/2006/main",
      "xmlns:wp"="http://schemas.openxmlformats.org/drawingml/2006/wordprocessingDrawing",
      "xmlns:r"="http://schemas.openxmlformats.org/officeDocument/2006/relationships",
      "xmlns:w14"="http://schemas.microsoft.com/office/word/2010/wordml",
      htmltools::HTML(paste0(...)))
  )
}

# Table properties
xml_tblPr <- function(...,
                      app = "word") {

  htmltools::tag(
    `_tag_name` = xml_tag_type("tblPr", app),
    varArgs = list(htmltools::HTML(paste0(...)))
  )
}

# Table width (child of `tblPr`)
xml_tblW <- function(type = c("pct", "auto", "dxa", "nil"),
                     w = "100%",
                     app = "word") {

  type <- match.arg(type)

  htmltools::tag(
    `_tag_name` = xml_tag_type("tblW", app),
    varArgs = list(
      `w:type` = type,
      `w:w` = w
    )
  )
}

# Table look (child of `tblPr`)
xml_tblLook <- function(first_row = "0",
                        last_row = "0",
                        first_column = "0",
                        last_column = "0",
                        no_h_band = "0",
                        no_v_band = "0",
                        app = "word") {

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
xml_tblStyle <- function(val = "Table",
                         app = "word") {

  htmltools::tag(
    `_tag_name` = xml_tag_type("tblStyle", app),
    varArgs = list(`w:val` = val)
  )
}

# Table cell margins
xml_tbl_cell_margins <- function(...,
                                 app = "word") {

  htmltools::tag(
    `_tag_name` = xml_tag_type("tblCellMar", app),
    varArgs = list(htmltools::HTML(paste0(...)))
  )
}

# Width specifiers (child of `tblCellMar` or `tcMar`)
xml_width <- function(dir = c("top", "bottom", "left", "right"),
                      width = 0,
                      type = c("dxa", "nil"),
                      app = "word") {

  dir <- match.arg(dir)
  type <- match.arg(type)

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
xml_tblGrid <- function(...,
                        app = "word") {

  htmltools::tag(
    `_tag_name` = xml_tag_type("tblGrid", app),
    varArgs = list(htmltools::HTML(paste0(...)))
  )
}

# Table row
xml_tr <- function(...,
                   app = "word") {

  htmltools::tag(
    `_tag_name` = xml_tag_type("tr", app),
    varArgs = list(
      htmltools::HTML(paste0(...))
      )
  )
}

# Table row properties
xml_trPr <- function(...,
                     app = "word") {

  htmltools::tag(
    `_tag_name` = xml_tag_type("trPr", app),
    varArgs = list(htmltools::HTML(paste0(...)))
  )
}

# Table row height
xml_tr_height <- function(h_rule = c("auto", "exact", "atLeast"),
                          height_twips = "150",
                          app = "word") {

  h_rule <- match.arg(h_rule)

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
xml_tc_margins <- function(...,
                           app = "word") {

  htmltools::tag(
    `_tag_name` = xml_tag_type("tcMar", app),
    varArgs = list(htmltools::HTML(paste0(...)))
  )
}

# Vertical alignment of paragraph in cell (child of `tcPr`)
xml_v_align <- function(v_align = c("center", "bottom", "top"), app = "word") {

  v_align <- match.arg(v_align)

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

  val <- match.arg(val)

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
xml_border <- function(dir = c("top", "bottom", "left", "right"),
                       type = "single",
                       size = 2,
                       space = 0,
                       color = "D3D3D3",
                       app = "word") {

  dir <- match.arg(dir)

  dir <-
    switch(
      dir,
      left = "start",
      right = "end",
      top = "top",
      bottom = "bottom"
    )

  color <- toupper(gsub("#", "", color))

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
      "xmlns:w"="http://schemas.openxmlformats.org/wordprocessingml/2006/main",
      "xmlns:wp"="http://schemas.openxmlformats.org/drawingml/2006/wordprocessingDrawing",
      "xmlns:r"="http://schemas.openxmlformats.org/officeDocument/2006/relationships",
      "xmlns:w14"="http://schemas.microsoft.com/office/word/2010/wordml",
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
xml_pStyle <- function(..., val = "Compact", app = "word") {

  htmltools::tag(
    `_tag_name` = xml_tag_type("pStyle", app),
    varArgs = list(
      htmltools::HTML(paste0(...)),
      `w:val` = val
    )
  )
}

# Paragraph alignment
xml_jc <- function(val = c("left", "center", "right"), app = "word") {

  val <- match.arg(val)

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
xml_spacing <- function(before = 120, after = 120, val = NULL, app = "word") {

  htmltools::tag(
    `_tag_name` = xml_tag_type("spacing", app),
    varArgs = list(
      `w:before` = before,
      `w:after` = after,
      `w:val` = val
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

# Font selection (child of `rPr`)
xml_r_font <- function(ascii_font = "Calibri",
                       ansi_font = "Calibri",
                       app = "word") {

  htmltools::tag(
    `_tag_name` = xml_tag_type("rFonts", app),
    varArgs = list(
      `w:ascii` = ascii_font,
      `w:hAnsi` = ansi_font
    )
  )
}

# Font size in half points (child of `rPr`)
xml_sz <- function(val = 24,
                   app = "word") {

  htmltools::tag(
    `_tag_name` = xml_tag_type("sz", app),
    varArgs = list(`w:val` = val)
  )
}

# Baseline adjustment of text (subscript, superscript) (child of `rPr`)
xml_baseline_adj <- function(v_align = c("superscript", "subscript", "baseline"),
                             app = "word") {

  v_align <- match.arg(v_align)

  htmltools::tag(
    `_tag_name` = xml_tag_type("vertAlign", app),
    varArgs = list(`w:val` = v_align)
  )
}

# Literal text
xml_t <- function(...,
                  xml_space = c("default", "preserve"),
                  app = "word") {

  xml_space <- match.arg(xml_space)

  htmltools::tag(
    `_tag_name` = xml_tag_type("t", app),
    varArgs = list(
      htmltools::HTML(paste0(...)),
      `xml:space` = xml_space
    )
  )
}

# Bold text specifier (toggle property)
xml_b <- function(active = TRUE,
                  app = "word") {

  htmltools::tag(
    `_tag_name` = xml_tag_type("b", app),
    varArgs = list(`w:val` = tolower(as.character(active)))
  )
}

# Italics text specifier (toggle property)
xml_i <- function(active = TRUE,
                  app = "word") {

  htmltools::tag(
    `_tag_name` = xml_tag_type("i", app),
    varArgs = list(tolower(as.character(active)))
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

xml_shd <- function(fill = "auto", app = "word"){

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
xml_br <- function(app = "word") {

  htmltools::tag(
    `_tag_name` = xml_tag_type("br", app),
    varArgs = list()
  )
}

# Carriage return
xml_cr <- function(app = "word") {

  htmltools::tag(
    `_tag_name` = xml_tag_type("cr", app),
    varArgs = list()
  )
}

# contents within the current cell shall be rendered on a single page
xml_cantSplit <- function(app = "word"){

  htmltools::tag(
    `_tag_name` = xml_tag_type("cantSplit", app),
    varArgs = list()
  )
}

# keep with Next
# contents of this paragraph are at least partly rendered on the same page
# as the following paragraph whenever possible
xml_keepNext <- function(app = "word"){

  htmltools::tag(
    `_tag_name` = xml_tag_type("keepNext", app),
    varArgs = list()
  )
}


# Specifies the start or end of a complex field
xml_fldChar <- function(fldCharType = c("begin","separate","end"), dirty = TRUE, app = "word"){

  fldCharType <- match.arg(fldCharType)
  stopifnot(is_bool(dirty))

  htmltools::tag(
    `_tag_name` = xml_tag_type("fldChar", app),
    varArgs = list(
      `w:fldCharType` = fldCharType,
      `w:dirty` = tolower(dirty))
  )
}

# field instructions for specify the codes for the fields.
# used within a fldChar's
xml_instrText <- function(instr, dirty = TRUE, app = "word"){
  htmltools::tag(
    `_tag_name` = xml_tag_type("instrText", app),
    varArgs = list(
      `xml:space` = "preserve",
      `w:dirty` = tolower(dirty),
      instr),
  )
}

# declares that the noProof property
xml_noProof <- function(app = "word"){
  htmltools::tag(
    `_tag_name` = xml_tag_type("noProof", app),
    varArgs = list()
  )
}

# Add automatic table numbering
# Add components necessary for table auto-numbering
xml_table_autonum <- function(font = xml_r_font(), size = xml_sz(val = 24), app = "word"){

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
footnote_mark_to_xml <- function(mark) {

  as.character(
    htmltools::tagList(
      xml_rPr(
        xml_baseline_adj(v_align = "superscript"),
        xml_i(active = TRUE),
        xml_t(mark),
        xml_i(active = FALSE),
        xml_baseline_adj(v_align = "baseline")
      )
    )
  )
}

# Mark the given text as being XML, meaning, it should not be escaped if passed
# to xml_text
xml_raw <- function(...) {
  text <- paste0(..., collapse = "")
  class(text) <- "xml_text"
  text
}

# TODO: make table widths work for XML
# Get the attributes for the table tag
create_table_props_component_xml <- function(data, align = "center") {

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

  widths <-
    boxh %>%
    dplyr::filter(type %in% c("default", "stub")) %>%
    dplyr::arrange(dplyr::desc(type)) %>% # This ensures that the `stub` is first
    .$column_width %>%
    unlist()

  # Stop function if all length dimensions (where provided)
  # don't conform to accepted CSS length definitions
  validate_css_lengths(widths)

  # If all of the widths are defined as px values for all columns,
  # then ensure that the width values are strictly respected as
  # absolute width values (even if a table width has already been set)
  if (all(grepl("px", widths)) && table_width == "auto") {
    table_width <- "0px"
  }

  if (all(grepl("%", widths)) && table_width == "auto") {
    table_width <- "100%"
  }

  if (table_width != "auto") {
    table_style <- paste(table_style, paste0("width: ", table_width), sep = "; ")
  }

  table_properties <-
    xml_tblPr(
      xml_tbl_cell_margins(
        xml_width("top"),
        xml_width("bottom"),
        xml_width("left", width = 60),
        xml_width("right", width = 60)
      ),
      xml_tblW(),
      xml_tblLook(),
      xml_jc(val = align)
    )

  htmltools::tagList(table_properties)
}

#' Create the caption component of a table (OOXML)
#'
#' The table heading component contains the title and possibly a subtitle; if
#' there are no heading components defined this function will return an empty
#' string.
#'
#' @noRd
create_table_caption_component_xml <- function(data, align = "center", keep_with_next = TRUE) {

  # If there is no title or heading component, then return an empty string
  if (!dt_heading_has_title(data = data)) {
    return(c(""))
  }

  heading <- dt_heading_get(data = data)
  footnotes_tbl <- dt_footnotes_get(data = data)
  styles_tbl <- dt_styles_get(data = data)
  subtitle_defined <- dt_heading_has_subtitle(data = data)

  # Get table options
  table_font_color <- dt_options_get_value(data, option = "table_font_color")

  # Get the footnote marks for the title
  if ("title" %in% footnotes_tbl$locname) {

    footnote_title_marks <-
      coalesce_marks(
        fn_tbl = footnotes_tbl,
        locname = "title"
      )

    footnote_title_marks <-
      footnote_mark_to_xml(mark = footnote_title_marks$fs_id_c)

  } else {
    footnote_title_marks <- ""
  }

  title_caption <- as.character(
    xml_p_ns(
      xml_pPr(
        xml_pStyle(val = "caption"),
        xml_color(color = table_font_color),
        xml_jc(val = align),
        if(keep_with_next){xml_keepNext()}
      ),
      xml_table_autonum(
        font = xml_r_font(),
        size = xml_sz(val = 24)
      ),
      xml_r(
        xml_rPr(
          xml_r_font(),
          xml_sz(val = 24)
        ),
        xml_t(
          paste0(heading$title, footnote_title_marks)
        )
      )
    )
  )

  if(subtitle_defined){

    # Get the footnote marks for the subtitle
    if ("subtitle" %in% footnotes_tbl$locname) {

      footnote_subtitle_marks <-
        coalesce_marks(
          fn_tbl = footnotes_tbl,
          locname = "subtitle"
        )

      footnote_subtitle_marks <-
        footnote_mark_to_xml(mark = footnote_subtitle_marks$fs_id_c)

    } else {
      footnote_subtitle_marks <- ""
    }

    subtitle_caption <- as.character(
      xml_p_ns(
        xml_pPr(
          xml_pStyle(val = "caption"),
          xml_color(color = table_font_color),
          xml_jc(val = align),
          if(keep_with_next){xml_keepNext()}
        ),
        xml_r(
          xml_rPr(
            xml_r_font(),
            xml_sz(val = 20)
          ),
          xml_t(
            paste0(heading$subtitle, footnote_subtitle_marks),
            xml_space = "preserve"
          )
        )
      )
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
create_heading_component_xml <- function(data, split = FALSE, keep_with_next = TRUE) {

  # If there is no title or heading component, then return an empty string
  if (!dt_heading_has_title(data = data)) {
    return("")
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
      footnote_mark_to_xml(mark = footnote_title_marks$fs_id_c)

  } else {
    footnote_title_marks <- ""
  }

  # Get the footnote marks for the subtitle
  if (subtitle_defined && "subtitle" %in% footnotes_tbl$locname) {

    footnote_subtitle_marks <-
      coalesce_marks(
        fn_tbl = footnotes_tbl,
        locname = "subtitle"
      )

    footnote_subtitle_marks <-
      footnote_mark_to_xml(mark = footnote_subtitle_marks$fs_id_c)

  } else {
    footnote_subtitle_marks <- ""
  }



  title_html <- htmltools::tagList(
    xml_t(
      paste0(heading$title, footnote_title_marks)
      ),
    if (subtitle_defined) {
      htmltools::tagList(
        xml_br(),
        xml_r(
        xml_rPr(
          xml_r_font(),
          xml_sz(val = 16)
        ),
        xml_t(
          paste0(heading$subtitle, footnote_subtitle_marks)
        )
        )
      )
    }
  )

  title_row <-
    xml_tr(
      xml_trPr(
        if(!split){xml_cantSplit()},
        xml_tbl_header()
      ),
      xml_table_cell(
        text = title_html,
        size = 24,
        color = table_font_color,
        align = "center",
        col_span = n_cols,
        border = if (table_border_top_include) {
          list(
            "top" = cell_border(
              type = "single",
              size = 16,
              color = heading_border_bottom_color
            ),
            "bottom" = cell_border(
              type = "single",
              size = 16,
              color = heading_border_bottom_color
            )
          )
        },
        keep_with_next = TRUE
        )
      )

  htmltools::tagList(title_row)
}

#' Create the columns component of a table (OOXML)
#'
#' @noRd
create_columns_component_xml <- function(data, split = FALSE, keep_with_next = TRUE) {

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
    return("")
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
  if (stub_available ) {

    ## if there are spanners, make the first row an empty cell that continues merge
    if(spanner_row_count < 1){

      cell_style <- styles_tbl %>%
        dplyr::filter(
          locname %in% c("stubhead")
        ) %>%
        dplyr::pull("styles") %>%
        .[1] %>% .[[1]]

      table_cell_vals[[length(table_cell_vals) + 1]] <-
        xml_table_cell(
          text = headings_labels[1],
          font = cell_style[["cell_text"]][["font"]],
          size = cell_style[["cell_text"]][["size"]] %||% 20,
          color = cell_style[["cell_text"]][["color"]],
          style = cell_style[["cell_text"]][["style"]],
          stretch = cell_style[["cell_text"]][["stretch"]],
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

    }else{

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
      xml_table_cell(
        text = headings_labels[i + stub_available],
        font = cell_style[["cell_text"]][["font"]],
        size = cell_style[["cell_text"]][["size"]] %||% 20,
        color = cell_style[["cell_text"]][["color"]],
        style = cell_style[["cell_text"]][["style"]],
        stretch = cell_style[["cell_text"]][["stretch"]],
        align = cell_style[["cell_text"]][["align"]],
        v_align = cell_style[["cell_text"]][["v_align"]],
        fill = cell_style[["cell_fill"]][["color"]],
        border = list(
          top = if(!spanners_present){cell_border(size = 16, color = column_labels_border_top_color)},
          bottom = cell_border(size = 16, color = column_labels_border_bottom_color),
          left = if(i == 1){cell_border(color = column_labels_vlines_color)},
          right = if(i == length(headings_vars) - stub_available){ cell_border(color = column_labels_vlines_color)}
        ),
        keep_with_next = keep_with_next
      )
  }

  table_col_headings_list[[1]] <-
    xml_tr(
      xml_trPr(
        if(!split){xml_cantSplit()},
        xml_tbl_header()
      ),
      paste(
        vapply(
          table_cell_vals,
          FUN.VALUE = character(1),
          FUN = paste
        ),
        collapse = ""
      )
    )

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
            xml_table_cell(
              text = headings_labels[1],
              font = cell_style[["cell_text"]][["font"]] %||% "Calibri",
              size = cell_style[["cell_text"]][["size"]] %||% 20,
              color = cell_style[["cell_text"]][["color"]],
              style = cell_style[["cell_text"]][["style"]],
              weight = cell_style[["cell_text"]][["weight"]],
              stretch = cell_style[["cell_text"]][["stretch"]],
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

        }else{

          spanner_cell_vals[[length(spanner_cell_vals) + 1]] <-
            xml_table_cell(
              row_span = "continue",
              border = list(
                left = cell_border(color = column_labels_vlines_color),
                right = cell_border(color = column_labels_vlines_color),
                bottom = if(span_row_idx == nrow(spanners)){cell_border(size = 16, color = column_labels_border_bottom_color)}
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
                left = if(i == 1){cell_border(color = column_labels_vlines_color)},
                right = if(i == length(spanner_row_values)){ cell_border(color = column_labels_vlines_color)},
                top = if(span_row_idx == 1){cell_border(size = 16, color = column_labels_border_top_color)}
              ),
              keep_with_next = keep_with_next
            )

        } else {
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
              xml_table_cell(
                text = spanner_row_values[i],
                font = cell_style[["cell_text"]][["font"]],
                size = cell_style[["cell_text"]][["size"]] %||% 20,
                color = cell_style[["cell_text"]][["color"]],
                style = cell_style[["cell_text"]][["style"]],
                weight = cell_style[["cell_text"]][["weight"]],
                stretch = cell_style[["cell_text"]][["stretch"]],
                align = cell_style[["cell_text"]][["align"]] %||% "center",
                v_align = cell_style[["cell_text"]][["v_align"]],
                fill = cell_style[["cell_fill"]][["color"]],
                col_span = colspans[i],
                border = list(
                  left = if(i == 1){cell_border(color = column_labels_vlines_color)},
                  right = if(i == (length(spanner_row_values) + 1 - colspans[i] )){ cell_border(color = column_labels_vlines_color)},
                  bottom = cell_border(size = 16, color = column_labels_border_bottom_color),
                  top = if(span_row_idx == 1){cell_border(size = 16, color = column_labels_border_top_color)}
                ),
                keep_with_next = keep_with_next
              )

          }
        }

      }


      table_col_headings_list[[length(table_col_headings_list) + 1 ]] <-
        xml_tr(
          xml_trPr(
            if(!split){xml_cantSplit()},
            xml_tbl_header()
          ),
          paste(
            vapply(
              spanner_cell_vals,
              FUN.VALUE = character(1),
              FUN = paste
            ),
            collapse = ""
          )
        )

    }

  }

  do.call(htmltools::tagList, rev(table_col_headings_list))

}

#' Create the table body component (OOXML)
#'
#' @importFrom rlang `%||%`
#' @noRd
create_body_component_xml <- function(data, split = FALSE, keep_with_next = TRUE) {

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

          group_heading_row <-
            xml_tr(
              xml_trPr(
                if(!split){xml_cantSplit()}
              ),
              xml_table_cell(
                text = htmltools::HTML(group_label),
                font = cell_style[["cell_text"]][["font"]],
                size = cell_style[["cell_text"]][["size"]] %||% 20,
                color = cell_style[["cell_text"]][["color"]],
                style = cell_style[["cell_text"]][["style"]],
                weight = cell_style[["cell_text"]][["weight"]],
                stretch = cell_style[["cell_text"]][["stretch"]],
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
        col_idx <-

        i

        for (y in seq_along(output_df_row_as_vec(i))) {

          style_col_idx <- ifelse(stub_available, y - 1, y )

          cell_style <- styles_tbl %>%
            dplyr::filter(
              locname %in% c("data","stub"),
              rownum == i,
              colnum == style_col_idx
            ) %>%
            dplyr::pull("styles") %>%
            .[1] %>% .[[1]]

          row_cells[[length(row_cells) + 1]] <-
            xml_table_cell(
              text = output_df_row_as_vec(i)[y],
              font = cell_style[["cell_text"]][["font"]],
              size = cell_style[["cell_text"]][["size"]],
              color = cell_style[["cell_text"]][["color"]],
              style = cell_style[["cell_text"]][["style"]],
              weight = cell_style[["cell_text"]][["weight"]],
              stretch = cell_style[["cell_text"]][["stretch"]],
              align = cell_style[["cell_text"]][["align"]],
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
              if(!split){xml_cantSplit()}
            ),
            paste(
              vapply(
                row_cells,
                FUN.VALUE = character(1),
                FUN = paste
              ), collapse = ""
            )
          )

        body_section <- append(body_section, list(body_row))

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
            summary_rows_xml(
              list_of_summaries = list_of_summaries,
              boxh = boxh,
              group_id = group_id,
              locname = "summary_cells",
              col_alignment = col_alignment,
              table_body_hlines_color = table_body_hlines_color,
              table_body_vlines_color = table_body_vlines_color,
              styles = summary_styles,
              split = split,
              keep_with_next = keep_with_next
            )

          body_section <- append(body_section, summary_section)
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

    summary_styles <- styles_tbl %>%
      dplyr::filter(
        locname %in% "grand_summary_cells",
        grpname %in% c("::GRAND_SUMMARY")
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

    body_rows <- c(body_rows, grand_summary_section)
  }

  htmltools::tagList(body_rows)
}

#' Create the table source note component (OOXML)
#'
#' @noRd
create_source_notes_component_xml <- function(data, split = FALSE, keep_with_next = TRUE) {

  source_note <- dt_source_notes_get(data = data)

  if (is.null(source_note)) {
    return("")
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

  source_note_rows <-
    lapply(
      source_note,
      function(x) {

        as.character(
          xml_tr(
            xml_trPr(
              if(!split){xml_cantSplit()}
            ),
            xml_table_cell(
              text = htmltools::HTML(x),
              font = cell_style[["cell_text"]][["font"]],
              size = cell_style[["cell_text"]][["size"]] %||% 20,
              color = cell_style[["cell_text"]][["color"]],
              style = cell_style[["cell_text"]][["style"]],
              weight = cell_style[["cell_text"]][["weight"]],
              stretch = cell_style[["cell_text"]][["stretch"]],
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
create_footnotes_component_xml <- function(data, split = FALSE, keep_with_next = TRUE) {

  footnotes_tbl <- dt_footnotes_get(data = data)

  # If the `footnotes_resolved` object has no
  # rows, then return an empty footnotes component
  if (nrow(footnotes_tbl) == 0) {
    return("")
  }

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

  footnote_rows <-
    lapply(
      seq_along(footnote_ids),
      function(x) {

        as.character(
          xml_tr(
            xml_trPr(
              if(!split){xml_cantSplit()}
            ),
            xml_table_cell(
              paragraph_xml = htmltools::tagList(
                xml_r(
                  xml_rPr(
                    xml_r_font(
                      ascii_font= cell_style[["cell_text"]][["font"]] %||% "Calibri",
                      ansi_font= cell_style[["cell_text"]][["font"]] %||% "Calibri"
                    ),
                    if(!is.null(cell_style[["cell_text"]][["color"]])){
                      xml_color(color = cell_style[["cell_text"]][["color"]])
                    },
                    xml_sz(val = cell_style[["cell_text"]][["size"]] %||% 20),
                    xml_baseline_adj(v_align = "superscript"),
                    xml_i()
                  ),
                  xml_t(if(!is.na(footnote_ids[x])){footnote_ids[x]})
                ),
                xml_r(
                  xml_rPr(
                    xml_r_font(
                      ascii_font= cell_style[["cell_text"]][["font"]] %||% "Calibri",
                      ansi_font= cell_style[["cell_text"]][["font"]] %||% "Calibri"
                    ),
                    if(!is.null(cell_style[["cell_text"]][["color"]])){
                      xml_color(color = cell_style[["cell_text"]][["color"]])
                    },
                    xml_sz(val = cell_style[["cell_text"]][["size"]] %||% 20),
                    xml_baseline_adj(v_align = "baseline")
                  ),
                  xml_t(footnote_text[x])
                )
              ),
              stretch = cell_style[["cell_text"]][["stretch"]],
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

  paste0(unlist(footnote_rows), collapse = "")
}

summary_rows_xml <- function(list_of_summaries,
                             boxh,
                             group_id,
                             locname,
                             col_alignment,
                             table_body_hlines_color,
                             table_body_vlines_color,
                             styles,
                             split = FALSE,
                             keep_with_next = TRUE) {

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
          xml_table_cell(
            text = summary_df_row(j)[y],
            font = cell_style[["cell_text"]][["font"]],
            size = cell_style[["cell_text"]][["size"]],
            color = cell_style[["cell_text"]][["color"]],
            style = cell_style[["cell_text"]][["style"]],
            weight = cell_style[["cell_text"]][["weight"]],
            stretch = cell_style[["cell_text"]][["stretch"]],
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
            if(!split){xml_cantSplit()}
          ),
          paste(
            vapply(
              summary_row_cells,
              FUN.VALUE = character(1),
              FUN = paste
            ), collapse = ""
          )
        )

      summary_row_lines <- append(summary_row_lines, list(summary_row))
    }
  }

  summary_row_lines
}

cell_border <- function(color = "#D3D3D3", size = NULL, type = "single"){
  list(
    color = color,
    size = size,
    type = type,
    type = NULL
  )
}

cell_margin <- function(width, type = c("dxa", "nil")){
  type <- match.arg(type)
  list(
    width = width,
    type = type
  )
}

stretch_to_xml_stretch <- function(x){
  x <-
    match.arg(
      x,
      choices = c(
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

v_align_to_xml_v_align <- function(x){
  x <-
    match.arg(x,
              choices = c("middle", "top", "bottom"))

  c(
    "middle" = "center",
    "bottom" = "bottom",
    "top" = "top"
  )[x]
}

row_span_to_xml_v_merge <- function(x){

  x <- match.arg(x,choices = c("start","continue"))

  c(
    "continue" = "continue",
    "start" = "restart"
  )[x]

}

#' define ooxml table cells
#'
#' paragrah
#'
#' @importFrom rlang `%||%`
#' @noRd
xml_table_cell <-
  function(text = NULL,
           size = NULL,
           font = NULL,
           color = NULL,
           style = NULL,
           weight = NULL,
           stretch = NULL,
           align = NULL,
           v_align = NULL,
           col_span = NULL,
           row_span = NULL,
           fill = NULL,
           margins = NULL,
           border = NULL,
           keep_with_next = TRUE,
           paragraph_xml = NULL) {


    xml_tc(
      xml_tcPr(
        if(!is.null(border)){
          xml_tc_borders(
            if(!is.null(border[["top"]])){xml_border("top", color = border[["top"]][["color"]], size = border[["top"]][["size"]], type = border[["top"]][["type"]])},
            if(!is.null(border[["bottom"]])){xml_border("bottom", color = border[["bottom"]][["color"]], size = border[["bottom"]][["size"]], type = border[["bottom"]][["type"]])},
            if(!is.null(border[["left"]])){xml_border("left", color = border[["left"]][["color"]], size = border[["left"]][["size"]], type = border[["left"]][["type"]])},
            if(!is.null(border[["right"]])){xml_border("right", color = border[["right"]][["color"]], size = border[["right"]][["size"]], type = border[["right"]][["type"]])}
          )
        },
        if(!is.null(fill)){xml_shd(fill = fill)},
        if(!is.null(row_span)){xml_v_merge(val = row_span_to_xml_v_merge(row_span))},
        if(!is.null(v_align)){xml_v_align(v_align = v_align_to_xml_v_align(v_align))},
        if(!is.null(margins)){
          xml_tc_margins(
            if(!is.null(margins[["top"]])){xml_width("top", width = margins[["top"]][["width"]], type = margins[["top"]][["type"]])},
            if(!is.null(margins[["bottom"]])){xml_width("bottom", width = margins[["bottom"]][["width"]], type = margins[["bottom"]][["type"]])},
            if(!is.null(margins[["left"]])){xml_width("left", width = margins[["left"]][["width"]], type = margins[["left"]][["type"]])},
            if(!is.null(margins[["right"]])){xml_width("right", width = margins[["right"]][["width"]], type = margins[["right"]][["type"]])}
          )
        }
      ),

        xml_p(
          xml_pPr(
            xml_spacing(before = 0, after = 60),
            if(!is.null(col_span)){xml_gridSpan(val = as.character(col_span))},
            if(keep_with_next){xml_keepNext()},
            if(!is.null(stretch)){
              xml_rPr(
                xml_spacing(val = stretch_to_xml_stretch(stretch))
              )
            },
            if(!is.null(align)){xml_jc(val = align)}
          ),
          if(is.null(paragraph_xml)){
            xml_r(
              xml_rPr(
                xml_r_font(
                  ascii_font= font %||% "Calibri",
                  ansi_font= font %||% "Calibri"
                ),
                xml_sz(val = size %||% 20),
                if(!is.null(color)){
                  xml_color(color = color)
                },
                if(identical(style,"italic")){
                  xml_i()
                },
                if(identical(weight,"bold")){
                  xml_b()
                }
              ),
            if(is.character(text)){
              xml_t(replace_carrots(text))
            }else if(inherits(text, "shiny.tag.list")){
              text
            }
            )
          }else{
            paragraph_xml
          }
        )
      )

}


replace_carrots <- function(x){
  x <- gsub("<", "&lt;", x, fixed = TRUE)
  x <- gsub(">", "&gt;", x, fixed = TRUE)
  x
}
