###  LaTeX Math

#' @noRd
fmt_latex_symbols <- function(x){
  if(grepl('%', x)){
    x <- gsub('%', '\\%', x, fixed = TRUE)
  }
  if(grepl('CHECKMARK', x)){
    x <- gsub('CHECKMARK', '\\checkmark', x, fixed = TRUE)
  }
  if(grepl('>', x)){
    x <- gsub('>', '$>$', x, fixed = TRUE)
  }
  if(grepl('<', x)){
    x <- gsub('<', '$<$', x, fixed = TRUE)
  }
  if(grepl('textsuperscript{', x, fixed=TRUE)){
    x <- gsub('textsuperscript{', '\\textsuperscript{', x, fixed = TRUE)
  }
  x
}

#' @noRd
fmt_latex_math <- function(x){
  if(grepl('!@', x)){
    vect <- unlist(qdapRegex::rm_between(x, '<', '>', extract=TRUE))
    swap <- list('!@' = '',
                 '*' = '\\',
                 'CHECKMARK' = '\\text{\\checkmark}',
                 'textsuperscript{' = '\\textsuperscript{',
                 '%' = '\\%',
                 '|' = '\\vert')

    if(length(vect[!is.na(vect)]) > 0){

      text_vect <- purrr::map_chr(vect, function(.){paste0('\\text{', ., '}')})
      with_indicator <- purrr::map_chr(vect, function(.){paste0('<', ., '>')})
      names(text_vect) <- with_indicator
      swap <- append(text_vect, swap)

    }

    for(i in names(swap)){

      x <- gsub(i, swap[[i]], x, fixed = TRUE)

    }

    return(paste0('$', x, '$'))
  }

  fmt_latex_symbols(x)
}
