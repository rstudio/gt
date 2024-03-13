# Table styles correctly applied

    Code
      .
    Output
      [1] "\\begin{table}\n\\fontsize{12.0pt}{14.4pt}\\selectfont\n\\begin{tabular*}{\\linewidth}{@{\\extracolsep{\\fill}}l|rlcrrr}\n\\toprule\n\\multicolumn{1}{l}{} & \\multicolumn{3}{c}{{\\itshape heading}} &  & \\multicolumn{2}{c}{heading} \\\\ \n\\cmidrule(lr){2-4} \\cmidrule(lr){6-7}\n\\multicolumn{1}{l}{{$\\overline{\\mbox{stubhead}}$}} & {NUM} & char & fctr\\textsuperscript{\\textit{1}} & time & {DATETIME} & currency \\\\ \n\\midrule\\addlinespace[2.5pt]\n\\multicolumn{7}{l}{grp\\_a} \\\\ \n\\midrule\\addlinespace[2.5pt]\n{\\cellcolor[HTML]{AA0000}{\\textcolor[HTML]{FFFFFF}{\\hspace*{3.75pt} row\\_1}}} & 0.1111 & apricot & {\\fontsize{15}{18.75}\\selectfont \\textcolor[HTML]{0000FF}{one}} & 13:35 & {\\scriptsize2018-01-01 02:22} & 49.95 \\\\ \n{\\slshape \\hspace{11.25pt}\\cellcolor[HTML]{AA0000}{\\textcolor[HTML]{FFFFFF}{\\hspace*{3.75pt} row\\_2}}} & 2.2220 & {\\bfseries \\hspace{15pt}banana} & {\\fontsize{15}{18.75}\\selectfont \\textcolor[HTML]{0000FF}{two}} & 14:40 & {\\scriptsize2018-02-02 14:33} & 17.95 \\\\ \n{\\cellcolor[HTML]{AA0000}{\\textcolor[HTML]{FFFFFF}{\\hspace*{3.75pt} row\\_3}}} & 33.3300 & coconut & {\\fontsize{15}{18.75}\\selectfont \\textcolor[HTML]{0000FF}{three}} & \\textsuperscript{\\textit{2}}{\\fontsize{15}{18.75}\\selectfont \\underline{\\textcolor[HTML]{FF0000}{15:45}}} & {\\scriptsize2018-03-03 03:44} & 1.39 \\\\ \n{\\slshape \\hspace{11.25pt}\\cellcolor[HTML]{AA0000}{\\textcolor[HTML]{FFFFFF}{\\hspace*{3.75pt} row\\_4}}} & 444.4000 & {\\bfseries \\hspace{15pt}durian} & {\\fontsize{15}{18.75}\\selectfont \\textcolor[HTML]{0000FF}{four}} & {\\fontsize{15}{18.75}\\selectfont \\underline{\\textcolor[HTML]{FF0000}{16:50}}} & {\\scriptsize2018-04-04 15:55} & 65100.00 \\\\ \n\\midrule \nTotal & {\\cellcolor[HTML]{00FF00}{480.06}} & — & — & — & — & {\\cellcolor[HTML]{00FF00}{65,169.29}} \\\\ \nAvg & 120.02 & — & — & — & — & 16,292.32 \\\\ \n\\midrule\\addlinespace[2.5pt]\n\\multicolumn{7}{l}{{\\bfseries \\cellcolor[HTML]{CCCCFF}{grp\\_b}}} \\\\ \n\\midrule\\addlinespace[2.5pt]\n{\\slshape \\hspace{11.25pt}\\cellcolor[HTML]{AA0000}{\\textcolor[HTML]{FFFFFF}{\\hspace*{3.75pt} row\\_5}}} & 5550.0000 & {\\bfseries \\hspace{15pt}NA} & {\\fontsize{15}{18.75}\\selectfont \\textcolor[HTML]{0000FF}{five}} & 17:55 & {\\scriptsize2018-05-05 04:00} & 1325.81 \\\\ \n\\midrule \n\\midrule \n{\\bfseries Grand Total} & {\\cellcolor[HTML]{AAAAAA}{6,030.06}} & {\\cellcolor[HTML]{AAAAAA}{—}} & {\\cellcolor[HTML]{AAAAAA}{—}} & {\\cellcolor[HTML]{AAAAAA}{—}} & {\\cellcolor[HTML]{AAAAAA}{—}} & {\\cellcolor[HTML]{AAAAAA}{66,495.10}} \\\\ \n\\bottomrule\n\\end{tabular*}\n\\begin{minipage}{\\linewidth}\n\\textsuperscript{\\textit{1}}{\\bfseries This is a footnote in the column labels.}\\\\\n\\textsuperscript{\\textit{2}}{\\bfseries This is a footnote. With a second line.}\\\\\n{\\itshape \\fontsize{6}{7.5}\\selectfont NOTES:  A mtcars example.\\\\\n}\\end{minipage}\n\\end{table}\n"
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
      
      attr(,"knit_cacheable")
      [1] NA

---

    Code
      .
    Output
      [1] "\\begingroup\n\\fontsize{12.0pt}{14.4pt}\\selectfont\n\\setlength{\\LTpost}{0mm}\n\\begin{longtable}{l|rlcrrr}\n\\toprule\n\\multicolumn{1}{l}{} & \\multicolumn{3}{c}{{\\itshape heading}} &  & \\multicolumn{2}{c}{heading} \\\\ \n\\cmidrule(lr){2-4} \\cmidrule(lr){6-7}\n\\multicolumn{1}{l}{{$\\overline{\\mbox{stubhead}}$}} & {NUM} & char & fctr\\textsuperscript{\\textit{1}} & time & {DATETIME} & currency \\\\ \n\\midrule\\addlinespace[2.5pt]\n\\multicolumn{7}{l}{grp\\_a} \\\\ \n\\midrule\\addlinespace[2.5pt]\n{\\cellcolor[HTML]{AA0000}{\\textcolor[HTML]{FFFFFF}{\\hspace*{3.75pt} row\\_1}}} & 0.1111 & apricot & {\\fontsize{15}{18.75}\\selectfont \\textcolor[HTML]{0000FF}{one}} & 13:35 & {\\scriptsize2018-01-01 02:22} & 49.95 \\\\ \n{\\slshape \\hspace{11.25pt}\\cellcolor[HTML]{AA0000}{\\textcolor[HTML]{FFFFFF}{\\hspace*{3.75pt} row\\_2}}} & 2.2220 & {\\bfseries \\hspace{15pt}banana} & {\\fontsize{15}{18.75}\\selectfont \\textcolor[HTML]{0000FF}{two}} & 14:40 & {\\scriptsize2018-02-02 14:33} & 17.95 \\\\ \n{\\cellcolor[HTML]{AA0000}{\\textcolor[HTML]{FFFFFF}{\\hspace*{3.75pt} row\\_3}}} & 33.3300 & coconut & {\\fontsize{15}{18.75}\\selectfont \\textcolor[HTML]{0000FF}{three}} & \\textsuperscript{\\textit{2}}{\\fontsize{15}{18.75}\\selectfont \\underline{\\textcolor[HTML]{FF0000}{15:45}}} & {\\scriptsize2018-03-03 03:44} & 1.39 \\\\ \n{\\slshape \\hspace{11.25pt}\\cellcolor[HTML]{AA0000}{\\textcolor[HTML]{FFFFFF}{\\hspace*{3.75pt} row\\_4}}} & 444.4000 & {\\bfseries \\hspace{15pt}durian} & {\\fontsize{15}{18.75}\\selectfont \\textcolor[HTML]{0000FF}{four}} & {\\fontsize{15}{18.75}\\selectfont \\underline{\\textcolor[HTML]{FF0000}{16:50}}} & {\\scriptsize2018-04-04 15:55} & 65100.00 \\\\ \n\\midrule \nTotal & {\\cellcolor[HTML]{00FF00}{480.06}} & — & — & — & — & {\\cellcolor[HTML]{00FF00}{65,169.29}} \\\\ \nAvg & 120.02 & — & — & — & — & 16,292.32 \\\\ \n\\midrule\\addlinespace[2.5pt]\n\\multicolumn{7}{l}{{\\bfseries \\cellcolor[HTML]{CCCCFF}{grp\\_b}}} \\\\ \n\\midrule\\addlinespace[2.5pt]\n{\\slshape \\hspace{11.25pt}\\cellcolor[HTML]{AA0000}{\\textcolor[HTML]{FFFFFF}{\\hspace*{3.75pt} row\\_5}}} & 5550.0000 & {\\bfseries \\hspace{15pt}NA} & {\\fontsize{15}{18.75}\\selectfont \\textcolor[HTML]{0000FF}{five}} & 17:55 & {\\scriptsize2018-05-05 04:00} & 1325.81 \\\\ \n\\midrule \n\\midrule \n{\\bfseries Grand Total} & {\\cellcolor[HTML]{AAAAAA}{6,030.06}} & {\\cellcolor[HTML]{AAAAAA}{—}} & {\\cellcolor[HTML]{AAAAAA}{—}} & {\\cellcolor[HTML]{AAAAAA}{—}} & {\\cellcolor[HTML]{AAAAAA}{—}} & {\\cellcolor[HTML]{AAAAAA}{66,495.10}} \\\\ \n\\bottomrule\n\\end{longtable}\n\\begin{minipage}{\\linewidth}\n\\textsuperscript{\\textit{1}}{\\bfseries This is a footnote in the column labels.}\\\\\n\\textsuperscript{\\textit{2}}{\\bfseries This is a footnote. With a second line.}\\\\\n{\\itshape \\fontsize{6}{7.5}\\selectfont NOTES:  A mtcars example.\\\\\n}\\end{minipage}\n\\endgroup\n"
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
      
      attr(,"knit_cacheable")
      [1] NA

---

    Code
      .
    Output
      [1] "\\begingroup\n\\fontsize{12.0pt}{14.4pt}\\selectfont\n\\setlength{\\LTpost}{0mm}\n\\begin{longtable}{l|rlcrrr}\n\\toprule\n\\multicolumn{1}{l}{} & \\multicolumn{3}{c}{{\\itshape heading}} &  & \\multicolumn{2}{c}{heading} \\\\ \n\\cmidrule(lr){2-4} \\cmidrule(lr){6-7}\n\\multicolumn{1}{l}{{$\\overline{\\mbox{stubhead}}$}} & {NUM} & char & fctr\\textsuperscript{\\textit{1}} & time & {DATETIME} & currency \\\\ \n\\midrule\\addlinespace[2.5pt]\n\\multicolumn{7}{l}{grp\\_a} \\\\ \n\\midrule\\addlinespace[2.5pt]\n{\\cellcolor[HTML]{AA0000}{\\textcolor[HTML]{FFFFFF}{\\hspace*{3.75pt} row\\_1}}} & 0.1111 & apricot & {\\fontsize{15}{18.75}\\selectfont \\textcolor[HTML]{0000FF}{one}} & 13:35 & {\\scriptsize2018-01-01 02:22} & 49.95 \\\\ \n{\\slshape \\hspace{11.25pt}\\cellcolor[HTML]{AA0000}{\\textcolor[HTML]{FFFFFF}{\\hspace*{3.75pt} row\\_2}}} & 2.2220 & {\\bfseries \\hspace{15pt}banana} & {\\fontsize{15}{18.75}\\selectfont \\textcolor[HTML]{0000FF}{two}} & 14:40 & {\\scriptsize2018-02-02 14:33} & 17.95 \\\\ \n{\\cellcolor[HTML]{AA0000}{\\textcolor[HTML]{FFFFFF}{\\hspace*{3.75pt} row\\_3}}} & 33.3300 & coconut & {\\fontsize{15}{18.75}\\selectfont \\textcolor[HTML]{0000FF}{three}} & \\textsuperscript{\\textit{2}}{\\fontsize{15}{18.75}\\selectfont \\underline{\\textcolor[HTML]{FF0000}{15:45}}} & {\\scriptsize2018-03-03 03:44} & 1.39 \\\\ \n{\\slshape \\hspace{11.25pt}\\cellcolor[HTML]{AA0000}{\\textcolor[HTML]{FFFFFF}{\\hspace*{3.75pt} row\\_4}}} & 444.4000 & {\\bfseries \\hspace{15pt}durian} & {\\fontsize{15}{18.75}\\selectfont \\textcolor[HTML]{0000FF}{four}} & {\\fontsize{15}{18.75}\\selectfont \\underline{\\textcolor[HTML]{FF0000}{16:50}}} & {\\scriptsize2018-04-04 15:55} & 65100.00 \\\\ \n\\midrule \nTotal & {\\cellcolor[HTML]{00FF00}{480.06}} & — & — & — & — & {\\cellcolor[HTML]{00FF00}{65,169.29}} \\\\ \nAvg & 120.02 & — & — & — & — & 16,292.32 \\\\ \n\\midrule\\addlinespace[2.5pt]\n\\multicolumn{7}{l}{{\\bfseries \\cellcolor[HTML]{CCCCFF}{grp\\_b}}} \\\\ \n\\midrule\\addlinespace[2.5pt]\n{\\slshape \\hspace{11.25pt}\\cellcolor[HTML]{AA0000}{\\textcolor[HTML]{FFFFFF}{\\hspace*{3.75pt} row\\_5}}} & 5550.0000 & {\\bfseries \\hspace{15pt}NA} & {\\fontsize{15}{18.75}\\selectfont \\textcolor[HTML]{0000FF}{five}} & 17:55 & {\\scriptsize2018-05-05 04:00} & 1325.81 \\\\ \n\\midrule \n\\midrule \n{\\bfseries Grand Total} & {\\cellcolor[HTML]{AAAAAA}{6,030.06}} & {\\cellcolor[HTML]{AAAAAA}{—}} & {\\cellcolor[HTML]{AAAAAA}{—}} & {\\cellcolor[HTML]{AAAAAA}{—}} & {\\cellcolor[HTML]{AAAAAA}{—}} & {\\cellcolor[HTML]{AAAAAA}{66,495.10}} \\\\ \n\\bottomrule\n\\end{longtable}\n\\begin{minipage}{\\linewidth}\n\\textsuperscript{\\textit{1}}{\\bfseries This is a footnote in the column labels.}\\\\\n\\textsuperscript{\\textit{2}}{\\bfseries This is a footnote. With a second line.}\\\\\n{\\itshape \\fontsize{6}{7.5}\\selectfont NOTES:  A mtcars example.\\\\\n}\\end{minipage}\n\\endgroup\n"
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
      
      attr(,"knit_cacheable")
      [1] NA

