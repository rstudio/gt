# Testable version of the `render_formats()` function
render_formats_test <- function(data,
                                context) {

  data %>% build_data(context) %>% .subset2("output_df")
}
