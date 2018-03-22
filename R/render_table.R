#' Render an HTML table object
#'
#' View an HTML table in the viewer pane.
#' @param x a \code{data.frame} object, a tibble,
#' or an object of class \code{html_table}.
#' @importFrom glue glue
#' @importFrom htmltools HTML html_print
#' @export

render_table <- function(x) {

 if (inherits(x, "data.frame")) {

  html_table <- x %>% gt::add_table()

 } else if (inherits(x, "html_table")) {

  html_table <- emit_html(html_tbl = x)
 }

 html_view <-
  glue(
   "
  <!doctype html>
  <html>
  <head>
  <meta name=\"viewport\" content=\"width=device-width\">
  <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">
  <title></title>
  <style>
  @media only screen and (max-width: 720px) {{
  table[class=body] h1 {{
  font-size: 28px !important;
  margin-bottom: 10px !important;
  }}
  table[class=body] p,
  table[class=body] ul,
  table[class=body] ol,
  table[class=body] td,
  table[class=body] span,
  table[class=body] a {{
  font-size: 16px !important;
  }}
  table[class=body] .wrapper,
  table[class=body] .article {{
  padding: 10px !important;
  }}
  table[class=body] .content {{
  padding: 0 !important;
  }}
  table[class=body] .container {{
  padding: 0 !important;
  width: 100% !important;
  }}
  table[class=body] .main {{
  border-left-width: 0 !important;
  border-radius: 0 !important;
  border-right-width: 0 !important;
  }}
  table[class=body] .btn table {{
  width: 100% !important;
  }}
  table[class=body] .btn a {{
  width: 100% !important;
  }}
  table[class=body] .img-responsive {{
  height: auto !important;
  max-width: 100% !important;
  width: auto !important;
  }}
  }}

  /* -------------------------------------
  PRESERVE THESE STYLES IN THE HEAD
  ------------------------------------- */
  @media all {{
  .ExternalClass {{
  width: 100%;
  }}
  .ExternalClass,
  .ExternalClass p,
  .ExternalClass span,
  .ExternalClass font,
  .ExternalClass td,
  .ExternalClass div {{
  line-height: 100%;
  }}
  .apple-link a {{
  color: inherit !important;
  font-family: inherit !important;
  font-size: inherit !important;
  font-weight: inherit !important;
  line-height: inherit !important;
  text-decoration: none !important;
  }}
  .btn-primary table td:hover {{
  background-color: #34495e !important;
  }}
  .btn-primary a:hover {{
  background-color: #34495e !important;
  border-color: #34495e !important;
  }}
  }}
  </style>
  </head>
  <body class=\"\" style=\"background-color: #f6f6f6; font-family: sans-serif; -webkit-font-smoothing: antialiased; font-size: 14px; line-height: 1.4; margin: 0; padding: 0; -ms-text-size-adjust: 100%; -webkit-text-size-adjust: 100%;\">
  <table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" class=\"body\" style=\"border-collapse: separate; mso-table-lspace: 0pt; mso-table-rspace: 0pt; width: 100%; background-color: #f6f6f6;\">
  <tr>
  <td style=\"font-family: sans-serif; font-size: 14px; vertical-align: top;\">&nbsp;</td>
    <td class=\"container\" style=\"font-family: sans-serif; font-size: 14px; vertical-align: top; display: block; Margin: 0 auto; max-width: 680px; padding: 10px; width: 680px;\">
    <div class=\"content\" style=\"box-sizing: border-box; display: block; Margin: 0 auto; max-width: 680px; padding: 10px;\">

    <!-- START CENTERED WHITE CONTAINER -->
    <span class=\"preheader\" style=\"color: transparent; display: none; height: 0; max-height: 0; max-width: 0; opacity: 0; overflow: hidden; mso-hide: all; visibility: hidden; width: 0;\"></span>
    <table class=\"main\" style=\"border-collapse: separate; mso-table-lspace: 0pt; mso-table-rspace: 0pt; width: 100%; background: #ffffff; border-radius: 3px;\">

    <!-- START MAIN CONTENT AREA -->
    <tr>
    <td class=\"wrapper\" style=\"font-family: sans-serif; font-size: 14px; vertical-align: top; box-sizing: border-box; padding: 20px;\">
    <table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" style=\"border-collapse: separate; mso-table-lspace: 0pt; mso-table-rspace: 0pt; width: 100%;\">
    <tr>
    <td style=\"font-family: sans-serif; font-size: 14px; vertical-align: top;\">
    <p style=\"font-family: sans-serif; font-size: 14px; font-weight: normal; margin: 0; Margin-bottom: 15px;\">{html_table}</p>
    </td>
    </tr>
    </table>
    </td>
    </tr>

    <!-- END MAIN CONTENT AREA -->
    </table>

  <!-- END CENTERED WHITE CONTAINER -->
  </div>
  </td>
  <td style=\"font-family: sans-serif; font-size: 14px; vertical-align: top;\">&nbsp;</td>
  </tr>
  </table>
  </body>
  </html>"
  )

 html_view %>%
  htmltools::HTML() %>%
  htmltools::html_print()
}
