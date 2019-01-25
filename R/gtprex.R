# reprex_wrapper(
#
#   gt_data = mtcars,
#   csv_name = "mtcars.csv",
#   expr = {
#     # library(gt)
#     # .data <- readr::read_csv(csv_name, col_types = csv_coltypes)
#     library(dplyr)
#
#     gt_data %>% gt()
#   }
# )

gtprex <- function(gt_data,
                   csv_data,
                   expr) {

  # Comparisons for extracting df column classes
  # microbenchmark(
  #   raw = map_chr(iris, class),
  #   head = map_chr(as.data.frame(head(iris, 0)), class),
  #   sapply = sapply(iris, class),
  #   vapply = vapply(iris, class, FUN.VALUE = character(1))
  #   )
}
