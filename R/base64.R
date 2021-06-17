# TODO: the `get_file_ext()` function overlaps greatly with `gtsave_file_ext()`;
#       both are not vectorized
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

  # Create a list of `raw` objects
  image_raw <-
    lapply(
      file, FUN = function(x) {
        readBin(
          con = x,
          what = "raw",
          n = file.info(x)$size
        )
      }
    )

  vapply(
    seq_along(image_raw),
    FUN.VALUE = character(1),
    USE.NAMES = FALSE, FUN = function(x) {
      paste0(
        "data:", get_mime_type(file[x]),
        ";base64,", base64enc::base64encode(image_raw[[x]])
      )
    }
  )
}
