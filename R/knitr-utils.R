# These functions are copies of unexported functions in knitr

kable_caption = function(label, caption, format) {
  # create a label for bookdown if applicable
  if (is.null(label)) label = knitr::opts_current$get('label')
  if (!is.null(caption) && !is.na(caption)) caption = paste0(
    create_label('tab:', label, latex = (format == 'latex')), caption
  )
  caption
}

# create \label{x} or (\#x); the latter is current an internal hack for bookdown
create_label = function(..., latex = FALSE) {
  if (isTRUE(knitr::opts_knit$get('bookdown.internal.label'))) {
    # knitr use (\\# but we remove the escaping as HTML is directly written
    lab1 = '(#'; lab2 = ')'
  } else if (latex) {
    lab1 = '\\label{'; lab2 = '}'
  } else {
    return('')  # we don't want the label at all
  }
  paste(c(lab1, ..., lab2), collapse = '')
}
