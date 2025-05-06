
## OOXML tag definition ----
ooxml_tag <- function(tag, tag_attributes = list(), content = list(), tag_class = tag, metadata = list(), error_call = current_env()){

  if(!is.list(tag_attributes)){
    cli::cli_abort(
      call = error_call,
      "`tag_attributes` must be a named list"
    )
  }

  if(length(tag_attributes) > 0){
    if(is.null(names(tag_attributes)) | (sum(names(tag_attributes) == "") > 0)){
      cli::cli_abort(
        call = error_call,
        "`tag_attributes` must be a named list"
      )
    }
  }

  xml_tag <- htmltools::tag(
    `_tag_name` = tag,
    varArgs = c(
      tag_attributes,
      content
    )
  )

  class(xml_tag) <- c(tag_class, "ooxml_tag", class(xml_tag))
  attr(xml_tag, "metadata") <- metadata

  xml_tag
}

## Strings -----

### Text
ooxml_text <- function(x, ..., space = c("default", "preserve"), type = c("word","pptx"), error_call = current_env()){

  space <- rlang::arg_match(space)
  type <- rlang::arg_match(type)

  run_xml_tag <- c("word" = "w:t","pptx" = "a:t")[[type]]

  space_attr <- list()
  if(space == "preserve"){
    space_attr <- list(`xml:space` = space)
  }

  ooxml_tag(
    tag = run_xml_tag,
    tag_class = "ooxml_text",
    tag_attributes =  space_attr,
    content = htmltools::HTML(format(x)),
    error_call = error_call
  )

}

### Run
ooxml_run <- function(x, ..., font=NULL, style=NULL, size=NULL, color=NULL, background=NULL, space = "default", type = c("word","pptx"), error_call = current_env()){

  type <- rlang::arg_match(type)
  run_xml_tag <- c("word" = "w:r","pptx" = "a:r")[[type]]

  ooxml_tag(
    tag = run_xml_tag,
    tag_class = "ooxml_run",
    content = list(
      ooxml_rPr(font=font, style=style, size=size, color=color, background=background, type = type, error_call = error_call),
      ooxml_text(x, space = space, type = type, error_call = error_call)
    ),
    error_call = error_call
  )

}

### Paragraph
ooxml_p <- function(x, ..., alignment = "right", margin = NULL, space = "default", type = c("word","pptx"), error_call = current_env()){

  type <- rlang::arg_match(type)
  paragraph_xml_tag <- c("word" = "w:p","pptx" = "a:p")[[type]]

  xml_runs <- lapply(x, function(content){
    if(!inherits(content, "ooxml_run")){
      content <- ooxml_run(content, ..., type = type, error_call = error_call)
    }
    content
  })

  ooxml_tag(
    tag = paragraph_xml_tag,
    tag_class = c("ooxml_paragraph","ooxml_cell_content"),
    content = c(
      list(ooxml_pPr(alignment = alignment, margin = margin, type = type, error_call = error_call)),
      xml_runs
    ),
    error_call = error_call
  )

}

## Tables ----

### Table Cells

ooxml_tbl_cell <- function(x, ..., type = c("word","pptx"), error_call = current_env()){

  type <- rlang::arg_match(type)

  table_cell_content <- lapply(unname(x), function(content){
    if(!inherits(content, "ooxml_cell_content")){
      content <- ooxml_p(content, ..., type = type, error_call = error_call)
    }
    content
  })

  if(type == "pptx"){
    table_cell_content <- list(ooxml_tag(
      tag = "a:txBody",
      content = c(
        list(ooxml_tag(tag = "a:bodyPr")),
        list(ooxml_tag(tag = "a:lstStyle")),
        table_cell_content
      )
    ))
  }

  table_cell_xml_tag <- c("word" = "w:tc","pptx" = "a:tc")[[type]]

  ooxml_tag(
    tag = table_cell_xml_tag,
    tag_class = "ooxml_table_cell",
    content = c(
      list(ooxml_tcPr(..., type = type, error_call = error_call)),
      table_cell_content
    )
  )




}

### Table Rows ----

ooxml_tbl_row <- function(x, ..., height = 0, is_header = FALSE, type = c("word","pptx"), error_call = current_env()){
  type <- rlang::arg_match(type)

  table_cell_xml_tag <- c("word" = "w:tr","pptx" = "a:tr")[[type]]

  table_row_content <- lapply(unname(x), function(cell){
    if(!inherits(cell, "ooxml_table_cell")){
      cell <- ooxml_tbl_cell(cell, ..., type = type, error_call = error_call)
    }
    cell
  })

  tag_attr <- list()
  if(type == "pptx"){
    tag_attr <- list(h=height)
  }

  ooxml_tag(
    tag = table_cell_xml_tag,
    tag_class = "ooxml_table_row",
    tag_attributes = tag_attr,
    content = c(
      list(ooxml_trPr(is_header = is_header, type = type, error_call = error_call)),
      table_row_content
    )
  )

}

## Table ----

ooxml_tbl <- function(table_body,
                      table_grid,
                      table_style = ooxml_tblPr(type = type, error_call = error_call),
                      type = c("word", "pptx"),
                      error_call = current_env()
) {

  type <- rlang::arg_match(type)

  table_xml_tag <- c("word" = "w:tbl","pptx" = "a:tbl")[[type]]

  lapply(seq_along(table_body), function(row_idx){
    row <- table_body[[row_idx]]
    if(!inherits(table_body[[row_idx]], "ooxml_table_row")){
      stop(paste0("Entry `",row_idx,"` is not of class `ooxml_table_row`."))
    }
  })

  type_ns <- list()
  if(type == "word"){
    type_ns <- list(
      "xmlns:w" = "http://schemas.openxmlformats.org/wordprocessingml/2006/main",
      "xmlns:wp" = "http://schemas.openxmlformats.org/drawingml/2006/wordprocessingDrawing",
      "xmlns:r" = "http://schemas.openxmlformats.org/officeDocument/2006/relationships",
      "xmlns:w14" = "http://schemas.microsoft.com/office/word/2010/wordml"
    )
  }

  ooxml_tag(
    tag = table_xml_tag,
    tag_attributes = type_ns,
    tag_class = "ooxml_table",
    content = c(
      list(table_style),
      list(table_grid),
      table_body
    )
  )


}

### Table Utilities ----

ooxml_tblGrid <- function(..., .gridcols = list(...), type = c("word","pptx"), error_call = current_env()){
  type <- rlang::arg_match(type)

  table_grid_xml_tag <- c("word" = "w:tblGrid","pptx" = "a:tblGrid")[[type]]

  gridCols <- lapply(.gridcols, function(col){
    if(!inherits(col, "gridCol")){
      ooxml_gridCol(width = col, type = type)
    }else{
      col
    }
  })

  ooxml_tag(
    tag = table_grid_xml_tag,
    content = gridCols
  )

}

ooxml_gridCol <- function(width = NA_integer_, type = c("word","pptx"), error_call = current_env()){

  type <- rlang::arg_match(type)
  if(!rlang::is_integerish(width, n = 1)){
    cli::cli_abort(
      call = error_call,
      "`width` should be a length one integer"
    )
  }

  gridCol_xml_tag <- c("word" = "w:gridCol","pptx" = "a:gridCol")[[type]]
  gridCol_attr_name <-c("word" = "w:w","pptx" = "w")[[type]]

  gridWidth <- list()
  if(!is.na(width)){
    gridWidth[[gridCol_attr_name]] <- width
  }

  ooxml_tag(
    tag = gridCol_xml_tag,
    tag_class = "gridCol",
    tag_attributes = gridWidth
  )

}

## Style Properties ----

### Run
ooxml_rPr <- function( ..., font=NULL, style=NULL, size=NULL, color=NULL, background=NULL, type = c("word","pptx"), error_call = current_env()){
  # if (is.null(font) && is.null(style) && is.null(size) && is.null(color) && is.null(background)) {
  #   return(NULL)
  # }
  type <- rlang::arg_match(type)

  run_properties_xml_tag <- c("word" = "w:rPr","pptx" = "a:rPr")[[type]]

  ooxml_tag(
    tag = run_properties_xml_tag,
    tag_attributes = list(
      dirty = 0
    )
  )
}

### Paragraph
ooxml_pPr <- function( ..., alignment=NULL, margin=NULL, type = c("word","pptx"), error_call = current_env()){
  if (is.null(alignment) && is.null(margin)) {
    return(NULL)
  }
  type <- rlang::arg_match(type)
  if(!is.null(alignment)){
    alignment <- rlang::arg_match(alignment, c("left","right","centered","justified","distributed"), error_arg = "alignment", error_call = error_call)
    alignment <- c(left="l", right = "r", centered = "ctr", justified = "just", distributed=dist)[[alignment]]
  }


  paragraph_properties_xml_tag <- c("word" = "w:pPr","pptx" = "a:pPr")[[type]]

  ooxml_tag(
    tag = paragraph_properties_xml_tag,
    tag_attributes = list(
      algn = alignment
    )
  )
}

### Table Cell
ooxml_tcPr <- function(..., background=NULL, borders = NULL, type = c("word","pptx"), error_call = current_env()){

  # if(is.null(background) & is.null(borders)){
  #   return(NULL)
  # }

  type <- rlang::arg_match(type)

  tablecell_properties_xml_tag <- c("word" = "w:tcPr","pptx" = "a:tcPr")[[type]]

  fill_xml <- NULL
  if(!is.null(background)){
    fill_xml <- ooxml_fill(color = background, type = type, error_call = error_call)
  }

  ooxml_tag(
    tag = tablecell_properties_xml_tag,
    content = c(
      borders,
      fill_xml
    )
  )
}



### Table Row
ooxml_trPr <- function(..., is_header = FALSE, height = "auto", hidden = FALSE, cantSplit = TRUE, type = c("word","pptx"), error_call = current_env()){

  type <- rlang::arg_match(type)

  if(type == "pptx"){
    return(NULL)
  }

  table_style_xml_tag <- c("word" = "w:trPr","pptx" = "a:trPr")[[type]]

  style_tags <- list(
    if(is_header) ooxml_tbl_header(type = type),
    if(hidden) ooxml_cantSplit(type = type),
    if(type == "word"){ooxml_trHeight(value = height)}
  )

  ooxml_tag(
    tag = table_style_xml_tag,
    content = style_tags
  )
}

ooxml_trHeight <- function(..., value, type = c("word","pptx"), error_call = current_env()){

  type <- rlang::arg_match(type)

  if(type == "word"){

    if(is.character(value)){
      if(tolower(value) %in% c("auto","atleast")){
        hRule <- match.arg(value, c("auto","atLeast"))
        value <- "10"
      }else{
        numeric_value <- as.numeric(value)
        if(!is.na(numeric_value)){
          hRule <- "exact"
          value <- as.integer(numeric_value)
        }else{
          cli::cli_abort(
            "Invalid value for table row height: `{value}`. Must be a positive numeric value or one of 'auto' or 'atLeast'.",
            call = error_call
          )
        }
      }
    }else if(is.numeric(value)){
      hRule <- "exact"
      value <- as.integer(value)
    }else{
      cli::cli_abort(
        "Invalid value for table row height: `{value}`. Must be a positive numeric value or one of 'auto' or 'atLeast'.",
        call = error_call
      )
    }

    if(value <= 0){
      cli::cli_abort(
        "Invalid value for table row height: `{value}`. Must be a positive numeric value or one of 'auto' or 'atLeast'.",
        call = error_call
      )
    }

    table_row_height_xml_tag <- c("word" = "w:trHeight")[[type]]

    ooxml_tag(
      tag = table_row_height_xml_tag,
      tag_attributes = list(
        `w:hRule` = hRule,
        `w:val` = value
      )
    )

  }

}

### Table
ooxml_tblPr <- function(..., type = c("word","pptx"), error_call = current_env()){
  type <- rlang::arg_match(type)

  if(type == "word"){
    ooxml_tblPr_word(..., error_call = error_call)
  }else if(type == "pptx"){
    ooxml_tblPr_pptx(..., error_call = error_call)
  }

}

#### tblPr word ----

ooxml_tblPr_word <- function(layout="autofit", justify="center", width="100%", look = c("First Row","No Banded Columns"), tableStyle=NULL, error_call = current_env()){
  ooxml_tag(
    tag = "w:tblPr",
    content = list(
      ooxml_tblLayout(layout = layout, type = "word", error_call = error_call),
      ooxml_jc(justify, type = "word", error_call = error_call),
      ooxml_tblW(width, type = "word", error_call = error_call),
      ooxml_tblLook(look, type = "word", error_call = error_call)
    )
  )
}

ooxml_tblLayout <- function(layout = c("autofit", "fixed"), type = c("word","pptx"), error_call = current_env()){
  type <- rlang::arg_match(type)
  layout <- rlang::arg_match(layout)

  if(type == "pptx"){
    stop("Not implemented tblLayout tag for pptx")
  }

  ooxml_tag(
    tag = "w:tblLayout",
    tag_attributes = list(
      "w:type" = layout
    )
  )
}

ooxml_tblW <- function(width, type = c("word","pptx"), error_call = current_env()){

  type <- rlang::arg_match(type)
  stopifnot(rlang::is_character(width, n = 1))

  if(type == "pptx"){
    stop("Not implemented tblW tag for pptx")
  }

  w_type <- "dxa"
  if(grepl("%$", width)){
    w_type <- "pct"
    width <- gsub("%$", "", width)
  }

  ooxml_tag(
    tag =  "w:tblW",
    tag_attributes = list("w:type" = w_type, "w:w" = width)
  )

}

ooxml_tblLook <- function(look = c("First Row","No Banded Columns"), type = c("word","pptx"), error_call = current_env()){

  type <- rlang::arg_match(type)
  stopifnot(rlang::is_character(look))

  if(type == "pptx"){
    stop("Not implemented tblLook tag for pptx")
  }

  style_attrs <- list( noVBand = 1, noHBand = 1)
  for(style in names(table_style_settings_word_key)){
    result <- isTRUE(tolower(table_style_settings_word_key[[style]]) %in% tolower(look))
    if(style %in% c("noVBand","noHBand")){
      result <- !result
    }
    style_attrs[[paste0("w:",style)]] <- as.numeric(result)
  }

  ooxml_tag(
    tag = "w:tblLook",
    tag_attributes = style_attrs
  )

}

table_style_settings_word_key <- c(
  "noVBand" = "Banded Columns", ## we want the inverse, if Banded Columns is missing set to 1
  "noHBand" = "Banded Rows", ## we want the inverse, if Banded Rows is missing set to 1
  "firstColumn" = "First Column",
  "firstRow"  = "Header Row",
  "lastCol" = "Last Column",
  "lastRow" = "Total Row"
)

#### tblPr pptx ----
ooxml_tblPr_pptx <- function(..., look = c("First Column","Banded Rows"), tableStyle = NA, error_call = current_env()){

  style_attrs <- list()
  for(style in names(table_style_settings_pptx_key)){
    if(isTRUE(tolower(table_style_settings_pptx_key[[style]]) %in% tolower(look)))
      style_attrs[[style]] <- 1
  }
}

ooxml_tag(
  tag = "a:tblPr",
  tag_attributes = style_attrs,
  content = list(
    ooxml_tblStyleId( tableStyle = tableStyle, type = "pptx", error_call = error_call)
  )
)

}

table_style_settings_pptx_key <- c(
  "bandCol" = "Banded Columns",
  "bandRow" = "Banded Rows",
  "firstColumn" = "First Column",
  "firstRow"  = "Header Row",
  "lastColumn" = "Last Column",
  "lastRow" = "Total Row"
)

ooxml_tblStyleId <- function(tableStyle = NA, type = c("word","pptx"), error_call = current_env()){
  ooxml_tag(
    tag = "a:tableStyleId",
    content = list(
      tableStyle
    )
  )
}


## Border Properties ----
ooxml_cell_border <- function(location, color="black", size = NULL, style="solid", type = c("word","pptx"), error_call = current_env()){
  type <- rlang::arg_match(type)

  if(type == "word"){
    ooxml_cell_border_word(location = location, color = color, size = size, style = style, error_call = error_call)
  }else if(type == "pptx"){
    ooxml_cell_border_pptx(location = location, color = color, size = size, style = style, error_call = error_call)
  }
}


ooxml_cell_border_word <- function(location, color=NULL, size=NULL, style="solid", error_call = current_env()){

  if (is.null(style)) {
    return(NULL)
  }

  location <- rlang::arg_match(location, values = c("top","left","bottom","right"))
  location_xml_tag <- c("top"="w:top","left"="w:start","bottom"="w:bottom","right"="w:end")[[location]]

  if(is.null(color)){
    color <- "black"
  }

  color <- as_hex_code(color)
  size <- check_border_size_word(size)
  style <- convert_border_style_word(style)

  ooxml_tag(
    tag = location_xml_tag,
    tag_attributes = list(
      `w:color` = color,
      `w:size` = size*8, ## size is in 1/8 points
      `w:val` = style
    )
  )

}

convert_border_style_word <- function(x){
  if(x %in% names(border_style_word)){
    border_style_word[[x]]
  }else{
    cli::cli_warn("Invalid border style supplied: {x}")
    "none"
  }
}

border_style_word <- list("solid" = "single", "dashed" = "dashed", "dotted" = "dotted", "hidden" = "none", "double" = "double")

check_border_size_word <- function(x){

  if(is.null(x)){
    x <- 4
  }

  stopifnot(is.numeric(x))
  stopifnot(x>=.25)
  stopifnot(x<=12)

  x

}

ooxml_cell_border_pptx <- function(location, color=NULL, size=NULL, style="solid", error_call = current_env()){

  if (is.null(style)) {
    return(NULL)
  }

  location <- rlang::arg_match(location, values = c("top","left","bottom","right"))
  location_xml_tag <- c("top"="a:lnT","left"="a:lnL","bottom"="a:lnB","right"="a:lnR")[[location]]

  size <- check_border_size_pptx(size)
  style <- convert_border_style_pptx(style)

  if(is.null(color)){
    color <- "black"
  }

  if(!is.null(style$compound)){
    ooxml_tag(
      tag = location_xml_tag,
      tag_attributes = list(
        `w` = size*12700,
        `cap` = "flat",
        `cmpd` = style$compound,
        `algn` = "ctr"
      ),
      content = c(
        if(!is.null(style$dash_style)){list(ooxml_tag(tag = "a:prstDash", tag_attributes = list(`val` = style$dash_style)))},
        list(ooxml_fill(color = color))
      )
    )
  }
}

check_border_size_pptx <- function(x){
  if(is.null(x)){
    x <- .5
  }
  stopifnot(is.numeric(x))
  stopifnot(x>=0)
  stopifnot(x<=10)
  x
}

convert_border_style_pptx <- function(x){

  if(x %in% names(border_style_pptx)){
    border_style_pptx[[x]]
  }else{
    cli::cli_warn("Invalid border style supplied: {x}")
    border_style_pptx[["hidden"]]
  }
}

border_style_word <- list(
  "solid" = c(compound = "single",dash_style = NULL),
  "dashed" = c(compound = "single",dash_style = "dash"),
  "dotted" = c(compound = "single",dash_style = "dot"),
  "hidden" = c(compound = NULL,dash_style = NULL),
  "double" = c(compound = "dbl",dash_style = NULL)
)


## Misc OOXML tags ----

ooxml_tbl_header <- function(type = c("word","pptx"), error_call = current_env()){
  type <- rlang::arg_match(type)
  table_header_xml_tag <- c("word" = "w:tblHeader","pptx" = "a:tblHeader")[[type]]

  ooxml_tag(
    tag = table_header_xml_tag
  )
}

ooxml_jc <- function(justify = c("center", "start","end"), type = c("word","pptx"), error_call = current_env()){

  justify <- rlang::arg_match(justify)
  type <- rlang::arg_match(type)

  if(type == "pptx"){
    stop("Not implemented jc tag for pptx")
  }

  ooxml_tag(
    tag =  "w:jc",
    tag_attributes = list("w:val" = justify)
  )

}

ooxml_cantSplit <- function(type = c("word","pptx"), error_call = current_env()){
  type <- rlang::arg_match(type)
  if(type == "word"){
    ooxml_tag(tag = "w:cantSplit")
  }
}

ooxml_fill <- function(color, type = c("word","pptx"), error_call = current_env()){
  color <- as_hex_code(color)

  type <- rlang::arg_match(type)
  shade_fill_xml_tag <- c("word" = ,"pptx" = "a:solidFill")[[type]]

  if(type == "word"){
    ooxml_tag(
      tag = "w:shd",
      tag_attributes = list(
        `w:val` = "clear",
        `w:color` = "auto",
        `w:fill` = color
      )
    )
  }else if(type == "pptx"){
    ooxml_tag(
      tag = "a:solidFill",
      content = list(
        ooxml_tag(
          tag = "a:srgbClr",
          content = color
        )
      )

    )
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


### Cell Borders




