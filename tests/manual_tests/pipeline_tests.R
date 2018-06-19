# Pipeline tests

# x is the `html_tbl` object
# x <- html_tbl

# [0.5] Creation of stub block groups
x <-
  gt:::create_stub_block_groups(html_tbl = x)

# [1] Creation of the content table
x <-
  gt:::create_content_tbl(html_tbl = x)

# [2] Modification of the content table
x <-
  gt:::all_tbl_format_steps(
    html_tbl = x)

# [3] Processing of the content table
x <-
  gt:::process_content_tbl(
    html_tbl = x)

# [4] Creation of the HTML table
x <-
  gt:::create_html_table_tbl(
    html_tbl = x)

# [5] Join in formatted content
x <-
  gt:::use_html_content(
    html_tbl = x)

# [6] Merge columns
x <-
  gt:::merge_columns(
    html_tbl = x)

# [7] Apply HTML aesthetics
x <-
  gt:::use_html_aesthetics(
    html_tbl = x,
    aesthetics_tbl = x[["aesthetics"]])

# [8] Generation of table HTML
html_output <-
  gt:::create_html(html_tbl = x)

# Use `print()` to print to the console
print(html_output, browse = view, ...)

