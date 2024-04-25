# Testable version of the `render_formats()` function
# FIXME works with warning on Windows
render_formats_test <- function(data,
                                context) {
  if (.Platform$OS.type == "windows")) {
    # file not-existing related warnings
    # only delete on Windows
    suppressWarnings(build_data(data, context = context)$`_body`)
  } else {
    build_data(data, context = context)$`_body`
  }
}
