library(gt)

# Create HTML tables that are suitable for
# emailing; this requires `as_raw_html()` to
# generate inline CSS styles, which are essential
# (i.e., they won't be stripped away)

html_tbl_1 <-
  gt(data = airquality[1:3, ]) %>%
  cols_move_to_start(columns = vars(Month, Day)) %>%
  cols_label(Solar.R = html("Solar<br>Radiation")) %>%
  fmt_number(
    columns = vars(Wind),
    decimals = 2
  )  %>%
  tab_boxhead_panel(
    group = "Measurement Period",
    columns = vars(Month, Day)
  ) %>%
  fmt_missing(columns = vars(Ozone, Solar.R, Ozone, Wind, Temp)) %>%
  as_raw_html(inline_css = TRUE)

html_tbl_2 <-
  gt(mtcars[1:3, ], rownames_to_stub = TRUE) %>%
  tab_options(
    table.width = "200px") %>%
  as_raw_html(inline_css = TRUE)

# Create an email message using the
# `compose_email()` function from the
# blastula package
email <-
  blastula::compose_email(
    body = "
  Hello,

  This is an email generated and sent \\
  using the **blastula** R package. For more \\
  information on that package, please visit \\
  https://github.com/rich-iannone/blastula

  We can use Markdown formatting \\
  to **embolden** text or to add \\
  *emphasis*.

  Here is a `gt` table based on the \\
  `airquality` dataset:

  {html_tbl_1}

  Here is a `gt` table based on the \\
  `mtcars` dataset:

  {html_tbl_2}

  "
)

# Preview the email in the RStudio Viewer
email %>% blastula::preview_email()

# Create a credentials file for sending
# this message through Gmail
blastula::create_email_creds_file(
  user = "someone@gmail.com",
  password = "<password>",
  provider = "gmail",
  sender = "The Sender",
  creds_file_name = "<creds_file>")

# Send the email message out with
# `send_email_out()`
send_email_out(
  message = email,
  from = "someone@gmail.com",
  to = "somebody@gmail.com",
  subject = "Email with Table Test",
  creds_file = "<creds_file>")
