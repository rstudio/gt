
## Tables ----
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

