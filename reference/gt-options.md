# **gt** package options

**gt** package options

## Package options

**gt** uses the following
[`options()`](https://rdrr.io/r/base/options.html) to configure
behavior:

- `gt.locale`: A
  [locale](https://gt.rstudio.com/reference/info_locales.md) to use by
  default in the [`gt()`](https://gt.rstudio.com/reference/gt.md)
  function.

- `gt.row_group.sep`: A separator between groups for the row group
  label. By default this is `" - "`.

- `gt.html_tag_check`: A logical scalar indicating whether or not to
  print a warning when HTML tags are found in a table that is being
  rendered to LaTeX. The default for this is `TRUE`.

- `gt.strict_column_fmt`: A logical scalar that controls whether
  formatting via the `fmt_*()` functions should fail if attempting to
  format data that is incompatible with the function. This is `FALSE` by
  default.

- `gt.latex_packages`: A vector of LaTeX package names to use when
  generating tables in the LaTeX output context. The set of packages
  loaded is controlled by this default vector:
  `c("booktabs", "caption", "longtable", "colortbl", "array", "anyfontsize", "multirow")`.
