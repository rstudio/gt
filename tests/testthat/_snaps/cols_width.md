# column widths are accurately reflected in Latex multicolumn statements

    Code
      as_latex(gt_tbl)
    Output
      [1] "\\begin{table}[t]\n\\fontsize{12.0pt}{14.0pt}\\selectfont\n\\begin{tabular*}{\\linewidth}{@{\\extracolsep{\\fill}}>{\\raggedright\\arraybackslash}p{\\dimexpr 57.00pt -2\\tabcolsep-1.5\\arrayrulewidth}|>{\\raggedleft\\arraybackslash}p{\\dimexpr 57.00pt -2\\tabcolsep-1.5\\arrayrulewidth}>{\\raggedleft\\arraybackslash}p{\\dimexpr 57.00pt -2\\tabcolsep-1.5\\arrayrulewidth}>{\\raggedleft\\arraybackslash}p{\\dimexpr 57.00pt -2\\tabcolsep-1.5\\arrayrulewidth}>{\\raggedleft\\arraybackslash}p{\\dimexpr 57.00pt -2\\tabcolsep-1.5\\arrayrulewidth}>{\\raggedleft\\arraybackslash}p{\\dimexpr 57.00pt -2\\tabcolsep-1.5\\arrayrulewidth}}\n\\toprule\n &  & \\multicolumn{2}{>{\\centering\\arraybackslash}m{\\dimexpr 114.00pt -2\\tabcolsep-1.5\\arrayrulewidth}}{\\parbox{\\linewidth}{\\centering {Another long spanner that needs to wrap even more than the other}}} &  &  \\\\ \n\\cmidrule(lr){3-4}\n & \\multicolumn{2}{>{\\centering\\arraybackslash}m{\\dimexpr 114.00pt -2\\tabcolsep-1.5\\arrayrulewidth}}{\\parbox{\\linewidth}{\\centering {Spanner with a long title that should be wrapped}}} &  & \\multicolumn{2}{>{\\centering\\arraybackslash}m{\\dimexpr 114.00pt -2\\tabcolsep-1.5\\arrayrulewidth}}{\\parbox{\\linewidth}{\\centering {Spanner2}}} \\\\ \n\\cmidrule(lr){2-3} \\cmidrule(lr){5-6}\n & y & z & m & n & w \\\\ \n\\midrule\\addlinespace[2.5pt]\n\\multicolumn{6}{>{\\raggedright\\arraybackslash}m{342pt}}{\\parbox{\\linewidth}{Only row group label}} \\\\[2.5pt] \n\\midrule\\addlinespace[2.5pt]\na & 0.114 & 0.640 & 0.694 & 0.837 & 0.317 \\\\ \nb & 0.622 & 0.009 & 0.545 & 0.286 & 0.303 \\\\ \n\\midrule \nmean & 0.3680014 & 0.3249032 & 0.6192831 & 0.5617595 & 0.3096529 \\\\ \n\\midrule\\addlinespace[2.5pt]\n\\multicolumn{6}{>{\\raggedright\\arraybackslash}m{342pt}}{\\parbox{\\linewidth}{\\rule{0pt}{0pt}}} \\\\[-3.2ex] \n\\midrule\\addlinespace[2.5pt]\nc & 0.609 & 0.233 & 0.283 & 0.267 & 0.159 \\\\ \nd & 0.623 & 0.666 & 0.923 & 0.187 & 0.040 \\\\ \ne & 0.861 & 0.514 & 0.292 & 0.232 & 0.219 \\\\ \n\\bottomrule\n\\end{tabular*}\n\\end{table}\n"
      attr(,"class")
      [1] "knit_asis"
      attr(,"knit_meta")
      attr(,"knit_meta")[[1]]
      $name
      [1] "booktabs"
      
      $options
      NULL
      
      $extra_lines
      NULL
      
      attr(,"class")
      [1] "latex_dependency"
      
      attr(,"knit_meta")[[2]]
      $name
      [1] "caption"
      
      $options
      NULL
      
      $extra_lines
      NULL
      
      attr(,"class")
      [1] "latex_dependency"
      
      attr(,"knit_meta")[[3]]
      $name
      [1] "longtable"
      
      $options
      NULL
      
      $extra_lines
      NULL
      
      attr(,"class")
      [1] "latex_dependency"
      
      attr(,"knit_meta")[[4]]
      $name
      [1] "colortbl"
      
      $options
      NULL
      
      $extra_lines
      NULL
      
      attr(,"class")
      [1] "latex_dependency"
      
      attr(,"knit_meta")[[5]]
      $name
      [1] "array"
      
      $options
      NULL
      
      $extra_lines
      NULL
      
      attr(,"class")
      [1] "latex_dependency"
      
      attr(,"knit_meta")[[6]]
      $name
      [1] "anyfontsize"
      
      $options
      NULL
      
      $extra_lines
      NULL
      
      attr(,"class")
      [1] "latex_dependency"
      
      attr(,"knit_meta")[[7]]
      $name
      [1] "multirow"
      
      $options
      NULL
      
      $extra_lines
      NULL
      
      attr(,"class")
      [1] "latex_dependency"
      
      attr(,"knit_cacheable")
      [1] NA

