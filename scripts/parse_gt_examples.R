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
fn_names <- get_package_docs(pkg = "gt") %>% names()

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
fn_names <- fn_names %>% base::setdiff(name_exclusions)

# Create a `save_with_webshot()` function that allows us to
# resize the images before writing to disk
save_with_webshot <- function(data,
                              filename,
                              path = NULL,
                              ...,
                              zoom = 2,
                              expand = 5,
                              resize = NULL) {

  gtsave_filename <- function(path, filename) {

    if (!is.null(path)) {
      filename <- file.path(path, filename)
    }

    filename %>% gt:::path_expand()
  }

  filename <- gtsave_filename(path = path, filename = filename)

  # Create a temporary file with the `html` extension
  tempfile_ <- tempfile(fileext = ".html")

  # Reverse slashes on Windows filesystems
  tempfile_ <-
    tempfile_ %>%
    gt:::tidy_gsub("\\\\", "/")

  # Save gt table as HTML using the `gt_save_html()` function
  data %>% gt:::gt_save_html(filename = tempfile_, path = NULL)

  # Saving an image requires the webshot package; if it's
  # not present, stop with a message
  if (!requireNamespace("webshot", quietly = TRUE)) {

    stop("The `webshot` package is required for saving images of gt tables.",
         call. = FALSE)

  } else {

    if (is.null(resize)) {
      webshot::webshot(
        url = paste0("file:///", tempfile_),
        file = filename,
        zoom = zoom,
        expand = expand,
        ...
      )
    } else {
      webshot::webshot(
        url = paste0("file:///", tempfile_),
        file = filename,
        zoom = zoom,
        expand = expand,
        ...
      ) %>%
        webshot::resize(resize)
    }
  }
}

# Declare a fixed image width
image_width <- 1100

# Obtain a temporary directory name
temp_dir <- tempdir()

# Generate images in `temp_dir`
for (fn_name in fn_names) {

  # Get the initial list of objects in the environment
  obj_list_initial <- ls()

  # Evaluate the examples in the examples for each topic/function; the
  # objects we'd want to create images from all begin with `tab_`
  utils::example(topic = fn_name, package = "gt", character.only = TRUE, give.lines = FALSE)

  # Get a vector of new objects created
  new_obj <- base::setdiff(ls(), obj_list_initial)

  # Get a separate vector of objects that begin with `tab_`
  tab_obj <- new_obj %>% grep("^tab_.\\d*?", ., value = TRUE)

  # For each of the `tab_` objects, create an image using webshot
  for (i in seq_along(tab_obj)) {

    # Create a systematic file name so that the help file
    # can access multiple images in the correct order
    filename <- file.path(temp_dir, paste0("man_", fn_name, "_", i, ".png"))

    # Save the image with a high `zoom` value for clarity,
    # but resized down to 50% of the original
    save_with_webshot(
      data = get(tab_obj[i]),
      filename = filename,
      zoom = 3,
      selector = "table",
      resize = "50%"
    )

    # Get the width and height of the image produced by webshot
    image_x <- readPNG(filename) %>% dim() %>% .[2]
    image_y <- readPNG(filename) %>% dim() %>% .[1]

    if (image_x > image_width) {
      eff_image_x <- image_x
    } else {
      eff_image_x <- image_width
    }

    if (image_y >= 1500) {
      eff_image_y <- 1500
    } else {
      eff_image_y <- image_y
    }

    # Use ImageMagick (installed on system) to widen all images to 1100px
    system(glue::glue("convert {filename} -gravity center -extent {eff_image_x}x{eff_image_y} {filename}"))
  }

  # Clean up some of the created objects
  rm(list = new_obj)
  rm(new_obj)
  rm(tab_obj)
}

# Copy all PNG files to a clean temporary directory
temp_dir_final <- paste0(tempdir(), "final")
dir.create(temp_dir_final)
png_list <- list.files(temp_dir, ".*\\.png$")
file.copy(file.path(temp_dir, png_list), file.path(temp_dir_final, png_list))

# Shrink PNG files with `webshot::shrink()`
webshot::shrink(filename = file.path(temp_dir_final, png_list))

# Use `pngquant` to losslessly compress PNG files
# The project is at https://github.com/kornelski/pngquant
system(glue::glue("cd {temp_dir_final}; pngquant --force --ext=.png --skip-if-larger --nofs --speed 1 *.png"))

# Move the files into the `man/figures` directory
file.copy(file.path(temp_dir_final, png_list), here::here("man", "figures", png_list), overwrite = TRUE)
