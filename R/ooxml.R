
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
