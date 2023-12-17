# Testable version of the `render_formats()` function
render_formats_test <- function(data,
                                context) {
  build_data(data, context = context)$`_body`
}
