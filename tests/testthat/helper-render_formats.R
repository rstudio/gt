# Testable version of the `render_formats()` function
render_formats_test <- function(data,
                                context) {

  data %>%
    build_data(context = context) %>%
    attributes() %>%
    .$`_output_tbl`
}
