# Testable version of the `render_formats()` function
render_formats_test <- function(data,
                                context) {

  data_attr <- attributes(data)

  # Move original data frame to `data_df`
  data_df <- as.data.frame(data)

  # Initialize `output_df`
  output_df <- initialize_output_df(data_df)

  # Get the `formats` list
  formats <- data_attr$formats

  # Render input data to output data where formatting
  # is specified
  for (fmt in formats)  {

    # Determine if the formatter has a function relevant
    # to the context; if not, use the `default` function
    # (which should always be present)
    if (context %in% names(fmt$func)) {
      eval_func <- context
    } else {
      eval_func <- "default"
    }

    for (col in fmt[["cols"]]) {

      # Perform rendering but only do so if the column is present
      if (col %in% colnames(data_df)) {

        output_df[[col]][fmt$rows] <-
          fmt$func[[eval_func]](data_df[[col]][fmt$rows])
      }
    }
  }

  output_df
}
