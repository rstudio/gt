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


#' Flexibly split a string into two pieces
#'
#' @param x The string to split into a character vector of length 2.
#' @param before,after Either an exact numeric position for where splitting will
#'   occur, or a regular expression to match on a range of characters. We can
#'   use either `before` or `after` (but not both) with this variable input to
#'   accurately define which side of the match is the split position.
#' @noRd
split_string_2 <- function(
    x,
    before = NULL,
    after = NULL
) {

  # TODO: use `split` instead of before/after and include
  # a `dir` option (for "before" or "after" splitting)

  # Stop function if `x` is not of class character
  if (!rlang::is_string(x)) {
    cli::cli_abort(c(
      "*" = "The `x` object must be a single string, not {.obj_type_friendly {x}}."
    ), .internal = TRUE)
  }

  # Get the length of the string `x`
  x_length <- nchar(x)

  # If neither of `before` or `after` has a value,
  # stop the function
  if (is.null(before) && is.null(after)) {
    cli::cli_abort(c(
      "*" = "Both `before` and `after` cannot be `NULL`."
    ), .internal = TRUE)
  }

  # If both `before` and `after` have values, stop
  # the function
  if (!is.null(before) && !is.null(after)) {
    cli::cli_abort(c(
      "*" = "A value must be provided to either `before` or `after`, not both."
    ), .internal = TRUE)
  }

  # Collapse value for either `before` or `after`;
  # add a class to retain the direction-of-split
  # information
  if (!is.null(before)) {
    input <- before
    class(input) <- c("before", class(before))
  } else if (!is.null(after)) {
    input <- after
    class(input) <- c("after", class(after))
  }

  if (inherits(input, "character")) {

    # Use the pattern (`input`) with the input string
    # `x` with `regexpr()` to get the matching output
    regexpr_out <- regexpr(input, x)

    # If there is no match, return a character vector
    # of length 2 (original string, then empty string)
    if (as.numeric(regexpr_out) == -1) {
      return(c(x, ""))
    }

    # Define the start position for the matched characters
    split_start <- as.numeric(regexpr_out)

    # Define the stop position for the matched characters
    split_stop <-
      attr(regexpr_out, "match.length", exact = TRUE) + split_start - 1

  } else if (inherits(input, "numeric")) {

    # Stop function if the index position is not valid
    if (input > x_length) {
      cli::cli_abort(c(
        "*" = "The numeric value provided cannot be greater than {x_length}."
      ), .internal = TRUE)
    }

    # Define the start and stop positions as
    # the single `input` value
    split_start <- split_stop <- as.numeric(input)
  }

  # Perform the split either before the matched characters
  if (inherits(input, "before")) {

    x_2 <- c(substr(x, 0, split_start - 1), substr(x, split_start, x_length))

  } else if (inherits(input, "after")) {

    x_2 <- c(substr(x, 0, split_stop), substr(x, split_stop + 1, x_length))
  }

  x_2
}

#' Flexibly split a string into two pieces
#'
#' @param x A character vector that is to be pasted between the
#'   first and second elements of `x_2`.
#' @param x_2 A character vector of length 2.
#' @noRd
paste_between <- function(x, x_2) {

  # Stop function if `x_2` is not of class character length 2
  if (!inherits(x_2, "character") || length(x_2) != 2) {
    cli::cli_abort(c(
      "*" = "The `x_2` object must be of class `character` of length 2, not {.obj_type_friendly {x_2}}."
    ), .internal = TRUE)
  }

  # Stop function if `x` is not of class character
  if (!is.character(x)) {
    cli::cli_abort(c(
      "*" = "The `x` object must be of class `character`."
    ), .internal = TRUE)
  }

  paste0(x_2[1], x, x_2[2])
}

#' Paste a string either onto the left or the right of another string
#'
#' @param x A character vector of length equal to that of `x_side`.
#' @param x_side Another character vector, with a length equal to that of `x`.
#'   It will be pasted either to the left or to the right of `x` depending on
#'   the `direction`.
#' @param direction The side that `x_side` will be relative to `x`. This can
#'   be `left` or `right`.
#' @noRd
paste_on_side <- function(
    x,
    x_side,
    direction
) {

  # Stop function if `direction` is not valid
  if (!(direction %in% c("left", "right"))) {
    cli::cli_abort(c(
      "*" = "The `direction` must be either `left` or `right`."
    ), .internal = TRUE)
  }

  # Stop function if `x` and `x_side` are not both of class character
  if (!all(inherits(x, "character"), inherits(x_side, "character"))) {
    cli::cli_abort(c(
      "*" = "The `x` and `x_side` objects must be of class `character`."
    ), .internal = TRUE)
  }

  len <- length(x_side)

  # Stop function if the length of `x_side` is not 1 of the length of `x`
  if (!any(len == 1, len == length(x))) {
    cli::cli_abort(
      "The length of the `x_side` vector must be 1 or the length of `x`."
    )
  }

  if (direction == "left") {

    return(paste0(x_side, x))

  } else if (direction == "right") {

    return(paste0(x, x_side))
  }
}

#' Paste a string onto the left side of another string
#'
#' @inheritParams paste_on_side
#' @param x_left Another character vector of length 1 that is to be pasted to
#'   the left of `x`.
#' @noRd
paste_left <- function(x, x_left) {
  paste_on_side(x, x_side = x_left, direction = "left")
}

#' Paste a string onto the right side of another string
#'
#' @inheritParams paste_on_side
#' @param x_right Another character vector of length 1 that is to be pasted to
#'   the right of `x`.
#' @noRd
paste_right <- function(x, x_right) {
  paste_on_side(x, x_side = x_right, direction = "right")
}

#' Swap adjacent text groups
#'
#' @param x A text string.
#' @param pattern_1,pattern_2 Regular expression to match on a range of
#'   characters. The order of regex patterns does not need to be in the order of
#'   matching in `x`.
#' @noRd
swap_adjacent_text_groups <- function(
    x,
    pattern_1,
    pattern_2
) {

  # Stop function if `x` is not of class character
  if (!inherits(x, "character")) {
    cli::cli_abort(c(
      "*" = "The `x` object must be of class `character`."
    ), .internal = TRUE)
  }

  vapply(
    x,
    FUN.VALUE = character(1L),
    USE.NAMES = FALSE,
    function(x) {

      # Return `x` as is if both patterns aren't present
      if (!grepl(pattern_1, x) || !grepl(pattern_2, x)) {
        return(x)
      }

      # Get the start and stop positions for the text groups
      group_1 <- get_start_stop_positions(x, pattern = pattern_1)
      group_2 <- get_start_stop_positions(x, pattern = pattern_2)

      # Return `x` as is if the patterns don't encompass text ranges
      # that aren't adjacent
      if (!is_adjacent_separate(group_1, group_2)) {
        return(x)
      }

      # Obtain a length-two vector of text groups based on the
      # extracted substrings
      substr <-
        c(
          substring(x, group_1[1], group_1[2]),
          substring(x, group_2[1], group_2[2])
        )

      # Reverse the order of the elements in `substr`
      # if necessary and paste elements together
      if (group_1[1] < group_2[1]) {
        rev_group <- paste0(rev(substr), collapse = "")
      } else {
        rev_group <- paste0(substr, collapse = "")
      }

      # Get the character indices that the contiguous text
      # groups encompass
      group_pos <- min(group_1, group_2):max(group_1, group_2)

      # Return the reversed set of patterns
      paste0(
        substring(x, 0, min(group_pos) - 1),
        rev_group,
        substring(x, max(group_pos) + 1, nchar(x)),
        collapse = ""
      )
    }
  )
}

#' Get the start and stop positions for a text match
#'
#' @param x A text string.
#' @param pattern A regular expression pattern.
#' @noRd
get_start_stop_positions <- function(x, pattern) {

  # Use the pattern (`input`) with the input string
  # `x` with `regexpr()` to get the matching output
  regexpr_out <- regexpr(pattern, x)

  # Define the start position for the matched characters
  start_pos <- as.numeric(regexpr_out)

  # Define the stop position for the matched characters
  stop_pos <- attr(regexpr_out, "match.length", exact = TRUE) + start_pos - 1

  # Return a vector of length 2
  c(start_pos, stop_pos)
}

#' Determine if text groups are adjacent and non-overlapping
#'
#' @param group_1,group_2 Vectors of length 2 with starting and stopping
#'   positions in a text string.
#' @noRd
is_adjacent_separate <- function(group_1, group_2) {

  group_1_expanded <- seq(group_1[1], group_1[2])
  group_2_expanded <- seq(group_2[1], group_2[2])

  if (length(base::intersect(group_1_expanded, group_2_expanded)) > 0) {
    return(FALSE)
  }

  if (any(diff(sort(c(group_1_expanded, group_2_expanded))) > 1)) {
    return(FALSE)
  }

  TRUE
}

str_title_case <- function(x) {

  title_case_i <- function(y) {

    s <- strsplit(y, " ", fixed = TRUE)[[1]]

    paste0(
      toupper(substring(s, 1, 1)),
      substring(s, 2),
      collapse = " "
    )
  }

  vapply(x, FUN.VALUE = character(1L), USE.NAMES = FALSE, FUN = title_case_i)
}

str_substitute <- function(string, start = 1L, end = -1L) {

  if (is.matrix(start)) {
    end <- start[, 2L]
    start <- start[, 1L]
  }
  # Error if start or end is incorrect.
  vec <- vctrs::vec_recycle_common(start = start, end = end, .size = length(string))
  start <- vec$start
  end <- vec$end
  n <- nchar(string)
  start <- ifelse(start < 0, start + n + 1, start)
  end <- ifelse(end < 0, end + n + 1, end)

  substr(string, start, end)
}

str_complete_locate <- function(string, pattern) {
  out <- gregexpr(pattern, string, perl = TRUE)
  lapply(out, location, all = TRUE)
}

str_single_locate <- function(string, pattern) {
  out <- regexpr(pattern, string, perl = TRUE)
  location(out)
}

location <- function(x, all = FALSE) {

  start <- as.vector(x)
  if (all && identical(start, -1L)) {
    return(cbind(start = integer(), end = integer()))
  }
  end <- as.vector(x) + attr(x, "match.length") - 1

  no_match <- start == -1L
  start[no_match] <- NA
  end[no_match] <- NA

  cbind(start = start, end = end)
}

str_complete_extract <- function(string, pattern) {

  loc <- str_complete_locate(string, pattern)
  lapply(seq_along(string), function(i) {
    loc <- loc[[i]]
    str_substitute(rep(string[[i]], nrow(loc)), loc)
  })
}

str_single_extract <- function(string, pattern) {
  str_substitute(string, str_single_locate(string, pattern))
}

str_get_match <- function(string, pattern) {

  loc <- regexec(pattern, string, perl = TRUE)
  loc <- lapply(loc, location)

  out <- lapply(seq_along(string), function(i) {
    loc <- loc[[i]]
    str_substitute(rep(string[[i]], nrow(loc)), loc)
  })
  do.call("rbind", out)
}

str_has_match <- function(string, pattern, negate = FALSE) {

  out <- grepl(pattern, string, perl = TRUE)
  out[is.na(string)] <- NA

  if (negate) {
    !out
  } else {
    out
  }
}

str_trim_sides <- function(string) {
  sub("\\s+$", "", sub("^\\s+", "", string))
}

alnum_id <- function(x, exclude = '[^[:alnum:]]+') {
  tolower(gsub('^-+|-+$', '', gsub(exclude, '-', x, perl = TRUE)))
}

create_unique_id_vals <- function(
    x,
    simplify = TRUE,
    exclude = "[^[:alnum:]]+",
    na_is_index = TRUE,
    sep = "__"
) {

  if (simplify) {
    x <- tolower(gsub("^-+|-+$", "", gsub(exclude, "-", x, perl = TRUE)))
  }

  id_vals <- rep(NA_character_, length(x))

  for (i in seq_along(x)) {

    if (is.na(x[i])) {
      if (na_is_index) {
        id_vals[i] <- as.character(i)
      } else {
        id_vals[i] <- random_id()
      }
    }

    if (!is.na(x[i])) {
      id_vals[i] <- x[i]
    }

    if (i > 1 && id_vals[i] %in% id_vals[1:(i - 1)]) {
      id_vals[i] <- paste0(id_vals[i], sep, formatC(i, width = 3, flag = "0"))
    }
  }

  id_vals
}

glue_gt <- function(.x, ...) {
  glue::glue_data(.x, ..., .transformer = get, .envir = emptyenv())
}

regexec_gt <- function(pattern, text, perl = FALSE) {

  if (is.factor(text) && nlevels(text) < length(text)) {

    out <- regexec_gt(pattern, c(levels(text), NA_character_), perl)
    outna <- out[length(out)]
    out <- out[text]
    out[is.na(text)] <- outna
    return(out)
  }

  dat <- gregexpr(pattern = pattern, text = text, perl = perl)

  if (perl) {

    capt.attr <- c("capture.start", "capture.length", "capture.names")
    process <- function(x) {

      if (anyNA(x) || any(x < 0)) {

        y <- x

      } else {

        y <- t(cbind(x, attr(x, "capture.start")))
        attributes(y)[names(attributes(x))] <- attributes(x)
        ml <- t(cbind(attr(x, "match.length"), attr(x, "capture.length")))
        nm <- attr(x, "capture.names")
        dimnames(ml) <- dimnames(y) <- if (any(nzchar(nm))) list(c("", nm), NULL)
        attr(y, "match.length") <- ml
        y
      }
      attributes(y)[capt.attr] <- NULL
      y
    }
    lapply(dat, process)

  } else {

    m1 <- lapply(regmatches(text, dat), regexec, pattern = pattern, perl = perl)
    mlen <- lengths(m1)
    res <- vector("list", length(m1))
    im <- mlen > 0
    res[!im] <- dat[!im]
    res[im] <-
      Map(
        function(outer, inner) {
          tmp <- do.call(cbind, inner)
          attributes(tmp)[names(attributes(inner))] <- attributes(inner)
          attr(tmp, "match.length") <- do.call(cbind, lapply(inner, `attr`, "match.length"))
          attr(tmp, "useBytes") <- attr(outer, "useBytes")
          attr(tmp, "index.type") <- attr(outer, "index.type")
          tmp + rep(outer - 1L, xeach <- nrow(tmp))
        },
        dat[im],
        m1[im]
      )
    res
  }
}

# The Hebrew Unicode character set (112 code points)
hebrew_unicode_charset <- "[\U00590-\U005FF]"

# The Arabic Unicode character set (256 code points)
arabic_unicode_charset <- "[\U00600-\U006FF]"

# The Syriac Unicode character set (80 code points)
syriac_unicode_charset <- "[\U00700-\U0074F]"

# The Thaana Unicode character set (64 code points)
thaana_unicode_charset <- "[\U00780-\U007BF]"

# The Samaritan Unicode character set (61 code points)
samaritan_unicode_charset <- "[\U00800-\U0083F]"

# The Mandaic Unicode character set (32 code points)
mandaic_unicode_charset <- "[\U00840-\U0085F]"

# The combination of these RTL character sets
rtl_modern_unicode_charset <-
  paste(
    hebrew_unicode_charset,
    arabic_unicode_charset,
    syriac_unicode_charset,
    thaana_unicode_charset,
    samaritan_unicode_charset,
    mandaic_unicode_charset, sep = "|"
  )
