gt_to_word_contents <- function(gt, ..., as_word_func = as_word_ooxml) {
  temp_word_file <- withr::local_tempfile(fileext = ".docx")
  gtsave(gt, temp_word_file, ..., as_word_func = as_word_func)

  temp_dir <- withr::local_tempfile()
  unzip(temp_word_file, exdir = temp_dir)
  doc <- xml2::read_xml(file.path(temp_dir, "word", "document.xml"))

  out <- xml_children(xml_children(doc))
  rels <- xml2::read_xml(file.path(temp_dir, "word", "_rels", "document.xml.rels"))

  attr(out, "rels") <- data.frame(
    Type   = xml_attr(xml_children(rels), "Type"),
    Id     = xml_attr(xml_children(rels), "Id"),
    Target = xml_attr(xml_children(rels), "Target"),
    stringsAsFactors = FALSE
  )

  out
}

gt_to_pptx_slide <- function(gt, ...) {
  temp_pptx_file <- withr::local_tempfile(fileext = ".pptx")
  gtsave(gt, temp_pptx_file, ...)

  temp_dir <- withr::local_tempfile()
  unzip(temp_pptx_file, exdir = temp_dir)

  path_slides <- dir(file.path(temp_dir, "ppt", "slides"), pattern = "^slide", full.names = TRUE)
  lapply(path_slides, function(file) {
    xml2::read_xml(file)
  })

}


read_xml_word_nodes <- function(x) {
  xml2::xml_children(suppressWarnings(xml2::read_xml(paste0(
    '<w:wrapper xmlns:w="http://schemas.openxmlformats.org/wordprocessingml/2006/main" xmlns:wp="http://schemas.openxmlformats.org/drawingml/2006/wordprocessingDrawing" xmlns:r="http://schemas.openxmlformats.org/officeDocument/2006/relationships" xmlns:w14="http://schemas.microsoft.com/office/word/2010/wordml">',
    paste(x, collapse = ""),
    "</w:wrapper>"
  ))))
}

expect_xml_snapshot <- function(xml) {
  expect_snapshot(writeLines(as.character(xml)))
}
