# Testable version of `render_formats()`
render_formats_test <- function(data, context) {

  build_data(data, context = context)$`_body`
}
