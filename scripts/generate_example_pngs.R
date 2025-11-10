library(gt)
library(tidyverse)
library(png)
library(webshot)
library(here)

# Function to get the package docs RdDB for any package
get_package_docs <- function(pkg) {
  help_dir <- system.file("help", package = pkg)
  db_path <- file.path(help_dir, pkg)
  tools:::fetchRdDB(db_path)
}

# Get a list of topic names from `gt`'s RdDB; work was done to
# ensure that each of gt's exported function has it's own topic
fn_names <- names(get_package_docs(pkg = "gt"))

# Have a list of topics to be excluded from the image-generation
# process; all of these don't produce `gt_tbl` objects
name_exclusions <-
  c(
    "as.data.frame.gt_tbl",
    "as_latex",
    "as_raw_html",
    "as_rtf",
    "cells_data",
    "cells_group",
    "countrypops",
    "escape_latex",
    "gt-options",
    "gt-package",
    "gt_latex_dependencies",
    "gt_output",
    "gtcars",
    "gtsave",
    "pipe",
    "pizzaplace",
    "print.gt_tbl",
    "random_id",
    "reexports",
    "render_gt",
    "sp500",
    "sza",
    "test_image"
  )

# Revise the list of topic names by removing the excluded ones
fn_names <- base::setdiff(fn_names, name_exclusions)

# Declare a fixed image width
image_width <- 1100

# Obtain a temporary directory name
temp_dir <- paste0(tempdir(), random_id())
dir.create(temp_dir, showWarnings = FALSE)

rm(list = ls(pattern = "^tab_[0-9]*?$"))

for (fn_name in fn_names) {

  # Evaluate the examples in the examples for each topic/function; the
  # objects we'd want to create images from all begin with `tab_`
  utils::example(
    topic = fn_name,
    package = "gt",
    character.only = TRUE,
    give.lines = FALSE,
    echo = FALSE
  )

  # Get a separate vector of objects that begin with `tab_`
  tab_obj <- ls(pattern = "^tab_[0-9]*?$")

  # For each of the `tab_` objects, create an image using webshot
  for (i in seq_along(tab_obj)) {

    if (!inherits(get(tab_obj[i]), "gt_tbl")) stop("All `tab_#` objects must be gt objects")

    # Create a systematic file name so that the help file
    # can access multiple images in the correct order
    filename <- file.path(temp_dir, paste0("man_", fn_name, "_", i, ".png"))

    # Save the image with a high `zoom` value for clarity,
    # but resized down to 50% of the original
    gt:::gt_save_webshot(data = get(tab_obj[i]), filename = filename, zoom = 3) |>
      webshot::resize(geometry = "50%")

    # Get the height and width of the image produced by webshot
    image_dim <- dim(readPNG(filename))

    if (image_dim[2] > image_width) eff_image_x <- image_dim[2] else eff_image_x <- image_width
    if (image_dim[1] >= 1500) eff_image_y <- 1500 else eff_image_y <- image_dim[1]

    # Use ImageMagick (installed on system) to widen all images to 1100px
    system(glue::glue("convert {shQuote(filename)} -gravity center -extent {eff_image_x}x{eff_image_y} {shQuote(filename)}"))
  }

  rm(list = tab_obj)
}

# Copy all PNG files to a clean temporary directory
png_list <- list.files(temp_dir, ".*\\.png$")

# Shrink PNG files with `webshot::shrink()`
webshot::shrink(filename = file.path(temp_dir, png_list))

# Use `pngquant` to losslessly compress PNG files
# The project is at https://github.com/kornelski/pngquant
system(glue::glue("cd {shQuote(temp_dir)}; pngquant --force --ext=.png --skip-if-larger --nofs --speed 1 *.png"))

# Move the files into the `man/figures` directory
file.copy(
  from = file.path(temp_dir, png_list),
  to = here::here("man", "figures", png_list),
  overwrite = TRUE
)
