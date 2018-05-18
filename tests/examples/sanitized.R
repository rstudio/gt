library(gt)
library(tidyverse)

# Create a table with single column, where text will be sanitized
tbl <-
  tibble::tribble(
    ~sanitized,
    "<strong>html sanitized</strong>",
    "> < & should appear as entities")

# Create a table that has a mixture of escaped and non-escaped text
html_tbl <-
  tab_create(tbl = tbl) %>%
  tab_source_note(md("**Should** be styled *HTML* because of `md()` tagging.")) %>%
  tab_source_note("> < & should appear as entities here (escaping as default)") %>%
  tab_source_note(html("> < & should <em>not</em> appear as entities here; used html() tagging")) %>%
  theme_striped()

html_tbl

# The following will emit HTML for the table; check that the HTML
# output has escaped entities where they should be escaped

x <- html_tbl

x <- gt:::create_stub_block_groups(html_tbl = x)

x <- gt:::create_content_tbl(html_tbl = x)

x <- gt:::all_tbl_format_steps(html_tbl = x)

x <- gt:::process_content_tbl(html_tbl = x)

x <- gt:::create_html_table_tbl(html_tbl = x)

x <- gt:::use_html_content(html_tbl = x)

x <- gt:::merge_columns(html_tbl = x)

x <- gt:::use_html_aesthetics(html_tbl = x, aesthetics_tbl = x[["aesthetics"]])

gt:::create_html(html_tbl = x) %>% cat()



