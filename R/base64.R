# Get a file's extension
get_file_ext <- function(file) {

  pos <- regexpr("\\.([[:alnum:]]+)$", file)
  ifelse(pos > -1L, substring(file, pos + 1L), "")
}

# Helper to set the MIME type
get_mime_type <- function(file) {

  extension <- tolower(get_file_ext(file))

  switch(
    extension,
    svg = "image/svg+xml",
    jpg = "image/jpeg",
    paste("image", extension, sep = "/")
  )
}

# Get image URIs from on-disk graphics files
# as a vector Base64-encoded image strings
get_image_uri <- function(file) {

  image_raw <-
    readBin(
      con = file,
      what = "raw",
      n = file.info(file)$size
    )

  paste0(
    "data:", get_mime_type(file),
    ";base64,", base64enc::base64encode(image_raw)
  )
}
