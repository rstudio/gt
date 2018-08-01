# Get a file's extension
get_file_ext <- function(file) {

  pos <- regexpr("\\.([[:alnum:]]+)$", file)
  ifelse(pos > -1L, substring(file, pos + 1L), "")
}

# Encode a raw string to a Base64 string
encode_base64 <- function(raw) {

  b64 <- c(LETTERS, letters, 0:9, "+", "/")

  n <- length(s <- as.integer(raw))
  res <- rep(NA, (n + 2) / 3 * 4)
  i <- 0L
  j <- 1L

  while (n > 2L) {
    res[i <- i + 1L] <- b64[s[j] %/% 4L + 1L]
    res[i <- i + 1L] <- b64[16 * (s[j] %% 4L) + s[j + 1L] %/% 16 + 1L]
    res[i <- i + 1L] <- b64[4L * (s[j + 1L] %% 16) + s[j + 2L] %/% 64L + 1L]
    res[i <- i + 1L] <- b64[s[j + 2L] %% 64L + 1L]
    j <- j + 3L
    n <- n - 3L
  }

  if (n) {

    res[i <- i + 1L] <- b64[s[j] %/% 4L + 1L]

    if (n > 1L) {
      res[i <- i + 1L] <- b64[16 * (s[j] %% 4L) + s[j + 1L] %/% 16 + 1L]
      res[i <- i + 1L] <- b64[4L * (s[j + 1L] %% 16) + 1L]
      res[i <- i + 1L] <- "="

    } else {

      res[i <- i + 1L] <- b64[16 * (s[j] %% 4L) + 1L]
      res[i <- i + 1L] <- "="
      res[i <- i + 1L] <- "="
    }
  }
  paste(res[!is.na(res)], collapse = "")
}

# Helper to set the MIME type
get_mime_type <- function(file) {

  extension <-
    file %>%
    get_file_ext() %>%
    tolower()

  switch(
    extension,
    svg = "image/svg+xml",
    jpg = "image/jpeg",
    paste("image", extension, sep = "/"))
}

# Get an image URI from an on-disk graphics file
# as a Base64-encoded image string
get_image_uri <- function(file) {

  image_raw <-
    readBin(
      con = file,
      what = "raw",
      n = file.info(file)$size)

  paste0("data:", get_mime_type(file), ";base64,", encode_base64(image_raw))
}
