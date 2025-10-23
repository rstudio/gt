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


.dt_summary_cols_key <- "_summary_cols"

.dt_summary_cols_build_key <- paste0(.dt_summary_cols_key, "_build")

dt_summary_cols_get <- function(data) {
  dt__get(data, .dt_summary_cols_key)
}

dt_summary_cols_build_get <- function(data) {
  dt__get(data, .dt_summary_cols_build_key)
}

dt_summary_cols_set <- function(data, summary_cols) {
  dt__set(data, .dt_summary_cols_key, summary_cols)
}

dt_summary_cols_build_set <- function(data, summary_cols) {
  dt__set(data, .dt_summary_cols_build_key, summary_cols)
}

dt_summary_cols_init <- function(data) {
  data <- dt_summary_cols_set(data = data, summary_cols = list())
  data <- dt_summary_cols_build_set(data = data, summary_cols = list())
  data
}

dt_summary_cols_add <- function(data, summary_col) {

  summary_cols_list <- dt_summary_cols_get(data = data)
  summary_cols_list <- append(summary_cols_list, list(summary_col))

  dt_summary_cols_set(data = data, summary_cols = summary_cols_list)
}

dt_summary_cols_exists <- function(data) {
  length(dt_summary_cols_get(data = data)) > 0
}

dt_summary_cols_build <- function(data, context) {

  # Summary columns are now built immediately when summary_column() is called,
  # so this function is essentially a no-op. It's kept for potential future
  # use (e.g., handling missing_text resolution or other build-time tasks).

  # Could potentially handle missing_text replacement here if needed
  summary_cols_list <- dt_summary_cols_get(data = data)

  if (length(summary_cols_list) > 0) {
    # Future: Apply any build-time transformations here
    # For now, just return data as-is since columns are already computed
  }

  data
}
