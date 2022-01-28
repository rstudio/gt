#' @rdname fmt_number
#' @export
gt_spec_number <- function(decimals = 2,
                           n_sigfig = NULL,
                           drop_trailing_zeros = FALSE,
                           drop_trailing_dec_mark = TRUE,
                           use_seps = TRUE,
                           accounting = FALSE,
                           scale_by = 1.0,
                           suffixing = FALSE,
                           pattern = "{x}",
                           sep_mark = ",",
                           dec_mark = ".",
                           force_sign = FALSE,
                           locale = NULL) {

  call <- capture_call("gt_spec_number")

  # Use locale-based marks if a locale ID is provided
  sep_mark <- get_locale_sep_mark(locale, sep_mark, use_seps)
  dec_mark <- get_locale_dec_mark(locale, dec_mark)

  # Stop function if `locale` does not have a valid value
  validate_locale(locale)

  # Normalize the `suffixing` input to either return a character vector
  # of suffix labels, or NULL (the case where `suffixing` is FALSE)
  suffix_labels <- normalize_suffixing_inputs(suffixing, scale_by)

  # Set the `formatC_format` option according to whether number
  # formatting with significant figures is to be performed
  if (!is.null(n_sigfig)) {

    # Stop function if `n_sigfig` does not have a valid value
    validate_n_sigfig(n_sigfig)

    formatC_format <- "fg"
  } else {
    formatC_format <- "f"
  }

  # Return the factory
  funs <- num_fmt_factory_multi(
    pattern = pattern,
    format_fn = function(x, context) {

      # Create the `suffix_df` object
      suffix_df <-
        create_suffix_df(
          x,
          decimals = decimals,
          suffix_labels = suffix_labels,
          scale_by = scale_by
        )

      # Scale the `x` values by the `scale_by` values in `suffix_df`
      x <- scale_x_values(x, scale_by = suffix_df$scale_by)

      # Format numeric values to character-based numbers
      x_str <-
        format_num_to_str(
          x,
          context = context,
          decimals = decimals,
          n_sigfig = n_sigfig,
          sep_mark = sep_mark,
          dec_mark = dec_mark,
          drop_trailing_zeros = drop_trailing_zeros,
          drop_trailing_dec_mark = drop_trailing_dec_mark,
          format = formatC_format
        )

      # Paste the vector of suffixes to the right of the values
      x_str <- paste_right(x_str, x_right = suffix_df$suffix)

      # Format values in accounting notation (if `accounting = TRUE`)
      x_str <-
        format_as_accounting(
          x_str,
          x = x,
          context = context,
          accounting = accounting
        )

      # Force a positive sign on certain values if the option is taken
      if (!accounting && force_sign) {

        positive_x <- !is.na(x) & x > 0
        x_str[positive_x] <- paste_left(x_str[positive_x], x_left = "+")
      }

      x_str
    }
  )

  new_gt_spec(funs, call)
}
