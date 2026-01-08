# Table styles correctly applied for longtable

    Code
      gt_latex_styled
    Output
      [1] "\\begingroup\n\\fontsize{12.0pt}{14.0pt}\\selectfont\n\\setlength{\\LTpost}{0mm}\n\\begin{longtable}{l|rlcrrr}\n\\toprule\n & \\multicolumn{3}{c}{{\\itshape heading}} &  & \\multicolumn{2}{c}{{heading}} \\\\ \n\\cmidrule(lr){2-4} \\cmidrule(lr){6-7}\n{$\\overline{\\mbox{stubhead}}$} & {NUM} & char & {FCTR}\\textsuperscript{\\textit{1}} & time & {DATETIME} & currency \\\\ \n\\midrule\\addlinespace[2.5pt]\n\\multicolumn{7}{l}{grp\\_a} \\\\[2.5pt] \n\\midrule\\addlinespace[2.5pt]\n{\\cellcolor[HTML]{AA0000}{\\textcolor[HTML]{FFFFFF}{\\hspace*{3.75pt} row\\_1}}} & 0.1111 & apricot & {\\fontsize{15}{19}\\selectfont \\textcolor[HTML]{0000FF}{one}} & 13:35 & {\\scriptsize 2018-01-01 02:22} & 49.95 \\\\ \n{\\slshape \\hspace{11.25pt}\\cellcolor[HTML]{AA0000}{\\textcolor[HTML]{FFFFFF}{\\hspace*{3.75pt} row\\_2}}} & 2.2220 & {\\bfseries \\hspace{15pt}banana} & {\\fontsize{15}{19}\\selectfont \\textcolor[HTML]{0000FF}{two}} & 14:40 & {\\scriptsize 2018-02-02 14:33} & 17.95 \\\\ \n{\\cellcolor[HTML]{AA0000}{\\textcolor[HTML]{FFFFFF}{\\hspace*{3.75pt} row\\_3}}} & 33.3300 & coconut & {\\fontsize{15}{19}\\selectfont \\textcolor[HTML]{0000FF}{three}} & \\textsuperscript{\\textit{2}} {\\fontsize{15}{19}\\selectfont \\underline{\\textcolor[HTML]{FF0000}{15:45}}} & {\\scriptsize 2018-03-03 03:44} & 1.39 \\\\ \n{\\slshape \\hspace{11.25pt}\\cellcolor[HTML]{AA0000}{\\textcolor[HTML]{FFFFFF}{\\hspace*{3.75pt} row\\_4}}} & 444.4000 & {\\bfseries \\hspace{15pt}durian} & {\\fontsize{15}{19}\\selectfont \\textcolor[HTML]{0000FF}{four}} & {\\fontsize{15}{19}\\selectfont \\underline{\\textcolor[HTML]{FF0000}{16:50}}} & {\\scriptsize 2018-04-04 15:55} & 65100.00 \\\\ \n\\midrule \nTotal & {\\cellcolor[HTML]{00FF00}{480.06}} & — & — & — & — & {\\cellcolor[HTML]{00FF00}{65,169.29}} \\\\ \nAvg & 120.02 & — & — & — & — & 16,292.32 \\\\ \n\\midrule\\addlinespace[2.5pt]\n\\multicolumn{7}{l}{{\\bfseries \\cellcolor[HTML]{CCCCFF}{grp\\_b}}} \\\\[2.5pt] \n\\midrule\\addlinespace[2.5pt]\n{\\slshape \\hspace{11.25pt}\\cellcolor[HTML]{AA0000}{\\textcolor[HTML]{FFFFFF}{\\hspace*{3.75pt} row\\_5}}} & 5550.0000 & {\\bfseries \\hspace{15pt}NA} & {\\fontsize{15}{19}\\selectfont \\textcolor[HTML]{0000FF}{five}} & 17:55 & {\\scriptsize 2018-05-05 04:00} & 1325.81 \\\\ \n\\midrule \n\\midrule \n{\\bfseries Grand Total} & {\\cellcolor[HTML]{AAAAAA}{6,030.06}} & {\\cellcolor[HTML]{AAAAAA}{—}} & {\\cellcolor[HTML]{AAAAAA}{—}} & {\\cellcolor[HTML]{AAAAAA}{—}} & {\\cellcolor[HTML]{AAAAAA}{—}} & {\\cellcolor[HTML]{AAAAAA}{66,495.10}} \\\\ \n\\bottomrule\n\\end{longtable}\n\\begin{minipage}{\\linewidth}\n\\vspace{.05em}\n{\\bfseries \\textsuperscript{\\textit{1}} This is a footnote in the column labels.}\\\\\n{\\bfseries \\textsuperscript{\\textit{2}} This is a footnote. With a second line.}\\\\\n{\\itshape \\fontsize{6}{8}\\selectfont NOTES:  A mtcars example.\\\\\n}\\end{minipage}\n\\endgroup\n"
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

# Table styles correctly applied for tabular*

    Code
      gt_latex_styled
    Output
      [1] "\\begin{table}[t]\n\\fontsize{12.0pt}{14.0pt}\\selectfont\n\\begin{tabular*}{\\linewidth}{@{\\extracolsep{\\fill}}l|rlcrrr}\n\\toprule\n & \\multicolumn{3}{c}{{\\itshape heading}} &  & \\multicolumn{2}{c}{{heading}} \\\\ \n\\cmidrule(lr){2-4} \\cmidrule(lr){6-7}\n{$\\overline{\\mbox{stubhead}}$} & {NUM} & char & {FCTR}\\textsuperscript{\\textit{1}} & time & {DATETIME} & currency \\\\ \n\\midrule\\addlinespace[2.5pt]\n\\multicolumn{7}{l}{grp\\_a} \\\\[2.5pt] \n\\midrule\\addlinespace[2.5pt]\n{\\cellcolor[HTML]{AA0000}{\\textcolor[HTML]{FFFFFF}{\\hspace*{3.75pt} row\\_1}}} & 0.1111 & apricot & {\\fontsize{15}{19}\\selectfont \\textcolor[HTML]{0000FF}{one}} & 13:35 & {\\scriptsize 2018-01-01 02:22} & 49.95 \\\\ \n{\\slshape \\hspace{11.25pt}\\cellcolor[HTML]{AA0000}{\\textcolor[HTML]{FFFFFF}{\\hspace*{3.75pt} row\\_2}}} & 2.2220 & {\\bfseries \\hspace{15pt}banana} & {\\fontsize{15}{19}\\selectfont \\textcolor[HTML]{0000FF}{two}} & 14:40 & {\\scriptsize 2018-02-02 14:33} & 17.95 \\\\ \n{\\cellcolor[HTML]{AA0000}{\\textcolor[HTML]{FFFFFF}{\\hspace*{3.75pt} row\\_3}}} & 33.3300 & coconut & {\\fontsize{15}{19}\\selectfont \\textcolor[HTML]{0000FF}{three}} & \\textsuperscript{\\textit{2}} {\\fontsize{15}{19}\\selectfont \\underline{\\textcolor[HTML]{FF0000}{15:45}}} & {\\scriptsize 2018-03-03 03:44} & 1.39 \\\\ \n{\\slshape \\hspace{11.25pt}\\cellcolor[HTML]{AA0000}{\\textcolor[HTML]{FFFFFF}{\\hspace*{3.75pt} row\\_4}}} & 444.4000 & {\\bfseries \\hspace{15pt}durian} & {\\fontsize{15}{19}\\selectfont \\textcolor[HTML]{0000FF}{four}} & {\\fontsize{15}{19}\\selectfont \\underline{\\textcolor[HTML]{FF0000}{16:50}}} & {\\scriptsize 2018-04-04 15:55} & 65100.00 \\\\ \n\\midrule \nTotal & {\\cellcolor[HTML]{00FF00}{480.06}} & — & — & — & — & {\\cellcolor[HTML]{00FF00}{65,169.29}} \\\\ \nAvg & 120.02 & — & — & — & — & 16,292.32 \\\\ \n\\midrule\\addlinespace[2.5pt]\n\\multicolumn{7}{l}{{\\bfseries \\cellcolor[HTML]{CCCCFF}{grp\\_b}}} \\\\[2.5pt] \n\\midrule\\addlinespace[2.5pt]\n{\\slshape \\hspace{11.25pt}\\cellcolor[HTML]{AA0000}{\\textcolor[HTML]{FFFFFF}{\\hspace*{3.75pt} row\\_5}}} & 5550.0000 & {\\bfseries \\hspace{15pt}NA} & {\\fontsize{15}{19}\\selectfont \\textcolor[HTML]{0000FF}{five}} & 17:55 & {\\scriptsize 2018-05-05 04:00} & 1325.81 \\\\ \n\\midrule \n\\midrule \n{\\bfseries Grand Total} & {\\cellcolor[HTML]{AAAAAA}{6,030.06}} & {\\cellcolor[HTML]{AAAAAA}{—}} & {\\cellcolor[HTML]{AAAAAA}{—}} & {\\cellcolor[HTML]{AAAAAA}{—}} & {\\cellcolor[HTML]{AAAAAA}{—}} & {\\cellcolor[HTML]{AAAAAA}{66,495.10}} \\\\ \n\\bottomrule\n\\end{tabular*}\n\\begin{minipage}{\\linewidth}\n\\vspace{.05em}\n{\\bfseries \\textsuperscript{\\textit{1}} This is a footnote in the column labels.}\\\\\n{\\bfseries \\textsuperscript{\\textit{2}} This is a footnote. With a second line.}\\\\\n{\\itshape \\fontsize{6}{8}\\selectfont NOTES:  A mtcars example.\\\\\n}\\end{minipage}\n\\end{table}\n"
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

# Table heading allows for repeating

    Code
      gt_latex_repeat_header
    Output
      [1] "\\begin{table}[t]\n\\fontsize{12.0pt}{14.0pt}\\selectfont\n\\begin{tabular*}{\\linewidth}{@{\\extracolsep{\\fill}}rlcrrrrll}\n\\toprule\nnum & char & fctr & date & time & datetime & currency & row & group \\\\ \n\\midrule\\endhead\\addlinespace[2.5pt]\n1.111e-01 & apricot & one & 2015-01-15 & 13:35 & 2018-01-01 02:22 & 49.950 & row\\_1 & grp\\_a \\\\ \n2.222e+00 & banana & two & 2015-02-15 & 14:40 & 2018-02-02 14:33 & 17.950 & row\\_2 & grp\\_a \\\\ \n3.333e+01 & coconut & three & 2015-03-15 & 15:45 & 2018-03-03 03:44 & 1.390 & row\\_3 & grp\\_a \\\\ \n4.444e+02 & durian & four & 2015-04-15 & 16:50 & 2018-04-04 15:55 & 65100.000 & row\\_4 & grp\\_a \\\\ \n5.550e+03 & NA & five & 2015-05-15 & 17:55 & 2018-05-05 04:00 & 1325.810 & row\\_5 & grp\\_b \\\\ \nNA & fig & six & 2015-06-15 & NA & 2018-06-06 16:11 & 13.255 & row\\_6 & grp\\_b \\\\ \n7.770e+05 & grapefruit & seven & NA & 19:10 & 2018-07-07 05:22 & NA & row\\_7 & grp\\_b \\\\ \n8.880e+06 & honeydew & eight & 2015-08-15 & 20:20 & NA & 0.440 & row\\_8 & grp\\_b \\\\ \n\\bottomrule\n\\end{tabular*}\n\\end{table}\n"
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

# Table can remove top and bottom rules

    Code
      gt_latex_no_top_rule
    Output
      [1] "\\begin{table}[t]\n\\fontsize{12.0pt}{14.0pt}\\selectfont\n\\begin{tabular*}{\\linewidth}{@{\\extracolsep{\\fill}}rlcrrrrll}\nnum & char & fctr & date & time & datetime & currency & row & group \\\\ \n\\midrule\\addlinespace[2.5pt]\n1.111e-01 & apricot & one & 2015-01-15 & 13:35 & 2018-01-01 02:22 & 49.950 & row\\_1 & grp\\_a \\\\ \n2.222e+00 & banana & two & 2015-02-15 & 14:40 & 2018-02-02 14:33 & 17.950 & row\\_2 & grp\\_a \\\\ \n3.333e+01 & coconut & three & 2015-03-15 & 15:45 & 2018-03-03 03:44 & 1.390 & row\\_3 & grp\\_a \\\\ \n4.444e+02 & durian & four & 2015-04-15 & 16:50 & 2018-04-04 15:55 & 65100.000 & row\\_4 & grp\\_a \\\\ \n5.550e+03 & NA & five & 2015-05-15 & 17:55 & 2018-05-05 04:00 & 1325.810 & row\\_5 & grp\\_b \\\\ \nNA & fig & six & 2015-06-15 & NA & 2018-06-06 16:11 & 13.255 & row\\_6 & grp\\_b \\\\ \n7.770e+05 & grapefruit & seven & NA & 19:10 & 2018-07-07 05:22 & NA & row\\_7 & grp\\_b \\\\ \n8.880e+06 & honeydew & eight & 2015-08-15 & 20:20 & NA & 0.440 & row\\_8 & grp\\_b \\\\ \n\\bottomrule\n\\end{tabular*}\n\\end{table}\n"
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

---

    Code
      gt_latex_no_bottom_rule
    Output
      [1] "\\begin{table}[t]\n\\fontsize{12.0pt}{14.0pt}\\selectfont\n\\begin{tabular*}{\\linewidth}{@{\\extracolsep{\\fill}}rlcrrrrll}\n\\toprule\nnum & char & fctr & date & time & datetime & currency & row & group \\\\ \n\\midrule\\addlinespace[2.5pt]\n1.111e-01 & apricot & one & 2015-01-15 & 13:35 & 2018-01-01 02:22 & 49.950 & row\\_1 & grp\\_a \\\\ \n2.222e+00 & banana & two & 2015-02-15 & 14:40 & 2018-02-02 14:33 & 17.950 & row\\_2 & grp\\_a \\\\ \n3.333e+01 & coconut & three & 2015-03-15 & 15:45 & 2018-03-03 03:44 & 1.390 & row\\_3 & grp\\_a \\\\ \n4.444e+02 & durian & four & 2015-04-15 & 16:50 & 2018-04-04 15:55 & 65100.000 & row\\_4 & grp\\_a \\\\ \n5.550e+03 & NA & five & 2015-05-15 & 17:55 & 2018-05-05 04:00 & 1325.810 & row\\_5 & grp\\_b \\\\ \nNA & fig & six & 2015-06-15 & NA & 2018-06-06 16:11 & 13.255 & row\\_6 & grp\\_b \\\\ \n7.770e+05 & grapefruit & seven & NA & 19:10 & 2018-07-07 05:22 & NA & row\\_7 & grp\\_b \\\\ \n8.880e+06 & honeydew & eight & 2015-08-15 & 20:20 & NA & 0.440 & row\\_8 & grp\\_b \\\\ \n\\end{tabular*}\n\\end{table}\n"
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

---

    Code
      gt_latex_no_top_or_bottom_rule
    Output
      [1] "\\begin{table}[t]\n\\fontsize{12.0pt}{14.0pt}\\selectfont\n\\begin{tabular*}{\\linewidth}{@{\\extracolsep{\\fill}}rlcrrrrll}\nnum & char & fctr & date & time & datetime & currency & row & group \\\\ \n\\midrule\\addlinespace[2.5pt]\n1.111e-01 & apricot & one & 2015-01-15 & 13:35 & 2018-01-01 02:22 & 49.950 & row\\_1 & grp\\_a \\\\ \n2.222e+00 & banana & two & 2015-02-15 & 14:40 & 2018-02-02 14:33 & 17.950 & row\\_2 & grp\\_a \\\\ \n3.333e+01 & coconut & three & 2015-03-15 & 15:45 & 2018-03-03 03:44 & 1.390 & row\\_3 & grp\\_a \\\\ \n4.444e+02 & durian & four & 2015-04-15 & 16:50 & 2018-04-04 15:55 & 65100.000 & row\\_4 & grp\\_a \\\\ \n5.550e+03 & NA & five & 2015-05-15 & 17:55 & 2018-05-05 04:00 & 1325.810 & row\\_5 & grp\\_b \\\\ \nNA & fig & six & 2015-06-15 & NA & 2018-06-06 16:11 & 13.255 & row\\_6 & grp\\_b \\\\ \n7.770e+05 & grapefruit & seven & NA & 19:10 & 2018-07-07 05:22 & NA & row\\_7 & grp\\_b \\\\ \n8.880e+06 & honeydew & eight & 2015-08-15 & 20:20 & NA & 0.440 & row\\_8 & grp\\_b \\\\ \n\\end{tabular*}\n\\end{table}\n"
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

# Latex table allows for line breaks in title and cells

    Code
      gt_tbl_linebreaks
    Output
      [1] "\\begin{table}[t]\n\\caption*{\n{\\fontsize{20}{25}\\selectfont  \\shortstack[l]{\\parbox{\\linewidth}{TABLE  \\\\ TITLE}}\\fontsize{12}{15}\\selectfont } \\\\ \n{\\fontsize{14}{17}\\selectfont  \\shortstack[l]{\\parbox{\\linewidth}{table  \\\\ subtitle}}\\fontsize{12}{15}\\selectfont }\n} \n\\fontsize{12.0pt}{14.0pt}\\selectfont\n\\begin{tabular*}{\\linewidth}{@{\\extracolsep{\\fill}}l}\n\\toprule\nx \\\\ \n\\midrule\\addlinespace[2.5pt]\n\\shortstack[l]{x \\\\y} \\\\ \n\\bottomrule\n\\end{tabular*}\n\\end{table}\n"
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

# Latex() function lets users pass their own latex to titles

    Code
      as.character(gt_tbl_inline_latex)
    Output
      [1] "\\begin{table}[t]\n\\caption*{\n{\\fontsize{20}{25}\\selectfont  \\textbf{TABLE TITLE}\\fontsize{12}{15}\\selectfont } \\\\ \n{\\fontsize{14}{17}\\selectfont  \\textbackslash{}textbf\\{TABLE SUBTITLE\\}\\fontsize{12}{15}\\selectfont }\n} \n\\fontsize{12.0pt}{14.0pt}\\selectfont\n\\begin{tabular*}{\\linewidth}{@{\\extracolsep{\\fill}}l}\n\\toprule\nx \\\\ \n\\midrule\\addlinespace[2.5pt]\n\\textbf{x} \\\\ \n\\textbackslash{}textbf\\{y\\} \\\\ \n\\bottomrule\n\\end{tabular*}\n\\end{table}\n"

# Table can apply font sizes

    Code
      gt_latex_font_size_10
    Output
      [1] "\\begin{table}[t]\n\\caption*{\n{\\fontsize{10}{12}\\selectfont  My title\\fontsize{10}{12}\\selectfont } \\\\ \n{\\fontsize{10}{12}\\selectfont  My subtitle\\fontsize{10}{12}\\selectfont }\n} \n\\fontsize{10.0pt}{12.0pt}\\selectfont\n\\begin{tabular*}{\\linewidth}{@{\\extracolsep{\\fill}}rlcrrrrll}\n\\toprule\nnum & char & fctr & date & time & datetime & currency & row & group \\\\ \n\\midrule\\addlinespace[2.5pt]\n0.1111 & apricot & one & 2015-01-15 & 13:35 & 2018-01-01 02:22 & 49.95 & row\\_1 & grp\\_a \\\\ \n\\bottomrule\n\\end{tabular*}\n\\end{table}\n"

---

    Code
      gt_latex_font_size_10_title_20
    Output
      [1] "\\begin{table}[t]\n\\caption*{\n{\\fontsize{20}{25}\\selectfont  My title\\fontsize{10}{12}\\selectfont } \\\\ \n{\\fontsize{10}{12}\\selectfont  My subtitle\\fontsize{10}{12}\\selectfont }\n} \n\\fontsize{10.0pt}{12.0pt}\\selectfont\n\\begin{tabular*}{\\linewidth}{@{\\extracolsep{\\fill}}rlcrrrrll}\n\\toprule\nnum & char & fctr & date & time & datetime & currency & row & group \\\\ \n\\midrule\\addlinespace[2.5pt]\n0.1111 & apricot & one & 2015-01-15 & 13:35 & 2018-01-01 02:22 & 49.95 & row\\_1 & grp\\_a \\\\ \n\\bottomrule\n\\end{tabular*}\n\\end{table}\n"

---

    Code
      gt_latex_font_size_10_subtitle_20
    Output
      [1] "\\begin{table}[t]\n\\caption*{\n{\\fontsize{10}{12}\\selectfont  My title\\fontsize{10}{12}\\selectfont } \\\\ \n{\\fontsize{20}{25}\\selectfont  My subtitle\\fontsize{10}{12}\\selectfont }\n} \n\\fontsize{10.0pt}{12.0pt}\\selectfont\n\\begin{tabular*}{\\linewidth}{@{\\extracolsep{\\fill}}rlcrrrrll}\n\\toprule\nnum & char & fctr & date & time & datetime & currency & row & group \\\\ \n\\midrule\\addlinespace[2.5pt]\n0.1111 & apricot & one & 2015-01-15 & 13:35 & 2018-01-01 02:22 & 49.95 & row\\_1 & grp\\_a \\\\ \n\\bottomrule\n\\end{tabular*}\n\\end{table}\n"

