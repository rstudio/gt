# footnotes with no location are rendered correctly

    Code
      .
    Output
      [1] "<table class=\"gt_table\">\n  \n  <thead class=\"gt_col_headings\">\n    <tr>\n      <th class=\"gt_col_heading gt_columns_bottom_border gt_right\" rowspan=\"1\" colspan=\"1\">num</th>\n      <th class=\"gt_col_heading gt_columns_bottom_border gt_left\" rowspan=\"1\" colspan=\"1\">char</th>\n      <th class=\"gt_col_heading gt_columns_bottom_border gt_center\" rowspan=\"1\" colspan=\"1\">fctr</th>\n      <th class=\"gt_col_heading gt_columns_bottom_border gt_left\" rowspan=\"1\" colspan=\"1\">date</th>\n      <th class=\"gt_col_heading gt_columns_bottom_border gt_left\" rowspan=\"1\" colspan=\"1\">time</th>\n      <th class=\"gt_col_heading gt_columns_bottom_border gt_left\" rowspan=\"1\" colspan=\"1\">datetime</th>\n      <th class=\"gt_col_heading gt_columns_bottom_border gt_right\" rowspan=\"1\" colspan=\"1\">currency</th>\n      <th class=\"gt_col_heading gt_columns_bottom_border gt_left\" rowspan=\"1\" colspan=\"1\">row</th>\n      <th class=\"gt_col_heading gt_columns_bottom_border gt_left\" rowspan=\"1\" colspan=\"1\">group</th>\n    </tr>\n  </thead>\n  <tbody class=\"gt_table_body\">\n    <tr><td class=\"gt_row gt_right\">0.1111</td>\n<td class=\"gt_row gt_left\">apricot</td>\n<td class=\"gt_row gt_center\">one</td>\n<td class=\"gt_row gt_left\">2015-01-15</td>\n<td class=\"gt_row gt_left\">13:35</td>\n<td class=\"gt_row gt_left\">2018-01-01 02:22</td>\n<td class=\"gt_row gt_right\">49.95</td>\n<td class=\"gt_row gt_left\">row_1</td>\n<td class=\"gt_row gt_left\">grp_a</td></tr>\n  </tbody>\n  \n  <tfoot class=\"gt_footnotes\">\n    <tr>\n      <td class=\"gt_footnote\" colspan=\"9\"> A footnote.</td>\n    </tr>\n  </tfoot>\n</table>"

---

    Code
      .
    Output
      [1] "\\captionsetup[table]{labelformat=empty,skip=1pt}\n\\setlength{\\LTpost}{0mm}\n\\begin{longtable}{rlclllrll}\n\\toprule\nnum & char & fctr & date & time & datetime & currency & row & group \\\\ \n\\midrule\n0.1111 & apricot & one & 2015-01-15 & 13:35 & 2018-01-01 02:22 & 49.95 & row\\_1 & grp\\_a \\\\ \n\\bottomrule\n\\end{longtable}\n\\begin{minipage}{\\linewidth}\nA footnote.\\\\\n\\end{minipage}\n"

---

    Code
      .
    Output
      {\rtf\ansi\ansicpg1252{\fonttbl{\f0\froman\fcharset0\fprq0 Calibri;}{\f1\froman\fcharset0\fprq0 Courier;}}{\colortbl;\red211\green211\blue211;}
      
      \trowd\trrh0\trhdr
      
      \pard\plain\uc0\qr\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clbrdrt\brdrs\brdrw40\brdrcf1\clbrdrb\brdrs\brdrw40\brdrcf1\clbrdrl\brdrs\brdrw20\brdrcf1\clbrdrr\brdrs\brdrw20\brdrcf1\cellx1052
      \intbl {\f0 {\f0\fs20 num}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clbrdrt\brdrs\brdrw40\brdrcf1\clbrdrb\brdrs\brdrw40\brdrcf1\clbrdrl\brdrs\brdrw20\brdrcf1\clbrdrr\brdrs\brdrw20\brdrcf1\cellx2104
      \intbl {\f0 {\f0\fs20 char}}\cell
      \pard\plain
      
      \pard\plain\uc0\qc\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clbrdrt\brdrs\brdrw40\brdrcf1\clbrdrb\brdrs\brdrw40\brdrcf1\clbrdrl\brdrs\brdrw20\brdrcf1\clbrdrr\brdrs\brdrw20\brdrcf1\cellx3156
      \intbl {\f0 {\f0\fs20 fctr}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clbrdrt\brdrs\brdrw40\brdrcf1\clbrdrb\brdrs\brdrw40\brdrcf1\clbrdrl\brdrs\brdrw20\brdrcf1\clbrdrr\brdrs\brdrw20\brdrcf1\cellx4208
      \intbl {\f0 {\f0\fs20 date}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clbrdrt\brdrs\brdrw40\brdrcf1\clbrdrb\brdrs\brdrw40\brdrcf1\clbrdrl\brdrs\brdrw20\brdrcf1\clbrdrr\brdrs\brdrw20\brdrcf1\cellx5260
      \intbl {\f0 {\f0\fs20 time}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clbrdrt\brdrs\brdrw40\brdrcf1\clbrdrb\brdrs\brdrw40\brdrcf1\clbrdrl\brdrs\brdrw20\brdrcf1\clbrdrr\brdrs\brdrw20\brdrcf1\cellx6312
      \intbl {\f0 {\f0\fs20 datetime}}\cell
      \pard\plain
      
      \pard\plain\uc0\qr\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clbrdrt\brdrs\brdrw40\brdrcf1\clbrdrb\brdrs\brdrw40\brdrcf1\clbrdrl\brdrs\brdrw20\brdrcf1\clbrdrr\brdrs\brdrw20\brdrcf1\cellx7364
      \intbl {\f0 {\f0\fs20 currency}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clbrdrt\brdrs\brdrw40\brdrcf1\clbrdrb\brdrs\brdrw40\brdrcf1\clbrdrl\brdrs\brdrw20\brdrcf1\clbrdrr\brdrs\brdrw20\brdrcf1\cellx8416
      \intbl {\f0 {\f0\fs20 row}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clbrdrt\brdrs\brdrw40\brdrcf1\clbrdrb\brdrs\brdrw40\brdrcf1\clbrdrl\brdrs\brdrw20\brdrcf1\clbrdrr\brdrs\brdrw20\brdrcf1\cellx9468
      \intbl {\f0 {\f0\fs20 group}}\cell
      \pard\plain
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\qr\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clbrdrt\brdrs\brdrw10\brdrcf1\clbrdrb\brdrs\brdrw10\brdrcf1\clbrdrl\brdrs\brdrw10\brdrcf1\clbrdrr\brdrs\brdrw10\brdrcf1\cellx1052
      \intbl {\f0 {\f0\fs20 0.1111}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clbrdrt\brdrs\brdrw10\brdrcf1\clbrdrb\brdrs\brdrw10\brdrcf1\clbrdrl\brdrs\brdrw10\brdrcf1\clbrdrr\brdrs\brdrw10\brdrcf1\cellx2104
      \intbl {\f0 {\f0\fs20 apricot}}\cell
      \pard\plain
      
      \pard\plain\uc0\qc\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clbrdrt\brdrs\brdrw10\brdrcf1\clbrdrb\brdrs\brdrw10\brdrcf1\clbrdrl\brdrs\brdrw10\brdrcf1\clbrdrr\brdrs\brdrw10\brdrcf1\cellx3156
      \intbl {\f0 {\f0\fs20 one}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clbrdrt\brdrs\brdrw10\brdrcf1\clbrdrb\brdrs\brdrw10\brdrcf1\clbrdrl\brdrs\brdrw10\brdrcf1\clbrdrr\brdrs\brdrw10\brdrcf1\cellx4208
      \intbl {\f0 {\f0\fs20 2015-01-15}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clbrdrt\brdrs\brdrw10\brdrcf1\clbrdrb\brdrs\brdrw10\brdrcf1\clbrdrl\brdrs\brdrw10\brdrcf1\clbrdrr\brdrs\brdrw10\brdrcf1\cellx5260
      \intbl {\f0 {\f0\fs20 13:35}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clbrdrt\brdrs\brdrw10\brdrcf1\clbrdrb\brdrs\brdrw10\brdrcf1\clbrdrl\brdrs\brdrw10\brdrcf1\clbrdrr\brdrs\brdrw10\brdrcf1\cellx6312
      \intbl {\f0 {\f0\fs20 2018-01-01 02:22}}\cell
      \pard\plain
      
      \pard\plain\uc0\qr\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clbrdrt\brdrs\brdrw10\brdrcf1\clbrdrb\brdrs\brdrw10\brdrcf1\clbrdrl\brdrs\brdrw10\brdrcf1\clbrdrr\brdrs\brdrw10\brdrcf1\cellx7364
      \intbl {\f0 {\f0\fs20 49.95}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clbrdrt\brdrs\brdrw10\brdrcf1\clbrdrb\brdrs\brdrw10\brdrcf1\clbrdrl\brdrs\brdrw10\brdrcf1\clbrdrr\brdrs\brdrw10\brdrcf1\cellx8416
      \intbl {\f0 {\f0\fs20 row_1}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clbrdrt\brdrs\brdrw10\brdrcf1\clbrdrb\brdrs\brdrw10\brdrcf1\clbrdrl\brdrs\brdrw10\brdrcf1\clbrdrr\brdrs\brdrw10\brdrcf1\cellx9468
      \intbl {\f0 {\f0\fs20 grp_a}}\cell
      \pard\plain
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx9468
      \intbl {\f0 {\f0\fs20 {\f0\fs20\i\super }{\f0\fs20 A footnote.}}}\cell
      \pard\plain
      
      \row
      
      }

---

    Code
      .
    Output
      [1] "<table class=\"gt_table\">\n  \n  <thead class=\"gt_col_headings\">\n    <tr>\n      <th class=\"gt_col_heading gt_columns_bottom_border gt_right\" rowspan=\"1\" colspan=\"1\">num</th>\n      <th class=\"gt_col_heading gt_columns_bottom_border gt_left\" rowspan=\"1\" colspan=\"1\">char</th>\n      <th class=\"gt_col_heading gt_columns_bottom_border gt_center\" rowspan=\"1\" colspan=\"1\">fctr</th>\n      <th class=\"gt_col_heading gt_columns_bottom_border gt_left\" rowspan=\"1\" colspan=\"1\">date</th>\n      <th class=\"gt_col_heading gt_columns_bottom_border gt_left\" rowspan=\"1\" colspan=\"1\">time</th>\n      <th class=\"gt_col_heading gt_columns_bottom_border gt_left\" rowspan=\"1\" colspan=\"1\">datetime</th>\n      <th class=\"gt_col_heading gt_columns_bottom_border gt_right\" rowspan=\"1\" colspan=\"1\">currency</th>\n      <th class=\"gt_col_heading gt_columns_bottom_border gt_left\" rowspan=\"1\" colspan=\"1\">row</th>\n      <th class=\"gt_col_heading gt_columns_bottom_border gt_left\" rowspan=\"1\" colspan=\"1\">group</th>\n    </tr>\n  </thead>\n  <tbody class=\"gt_table_body\">\n    <tr><td class=\"gt_row gt_right\">0.1111</td>\n<td class=\"gt_row gt_left\">apricot</td>\n<td class=\"gt_row gt_center\">one</td>\n<td class=\"gt_row gt_left\">2015-01-15</td>\n<td class=\"gt_row gt_left\">13:35</td>\n<td class=\"gt_row gt_left\">2018-01-01 02:22</td>\n<td class=\"gt_row gt_right\">49.95</td>\n<td class=\"gt_row gt_left\">row_1</td>\n<td class=\"gt_row gt_left\">grp_a</td></tr>\n  </tbody>\n  \n  <tfoot class=\"gt_footnotes\">\n    <tr>\n      <td class=\"gt_footnote\" colspan=\"9\"> A footnote.</td>\n    </tr>\n  </tfoot>\n</table>"

---

    Code
      .
    Output
      [1] "\\captionsetup[table]{labelformat=empty,skip=1pt}\n\\setlength{\\LTpost}{0mm}\n\\begin{longtable}{rlclllrll}\n\\toprule\nnum & char & fctr & date & time & datetime & currency & row & group \\\\ \n\\midrule\n0.1111 & apricot & one & 2015-01-15 & 13:35 & 2018-01-01 02:22 & 49.95 & row\\_1 & grp\\_a \\\\ \n\\bottomrule\n\\end{longtable}\n\\begin{minipage}{\\linewidth}\nA footnote.\\\\\n\\end{minipage}\n"

---

    Code
      .
    Output
      {\rtf\ansi\ansicpg1252{\fonttbl{\f0\froman\fcharset0\fprq0 Calibri;}{\f1\froman\fcharset0\fprq0 Courier;}}{\colortbl;\red211\green211\blue211;}
      
      \trowd\trrh0\trhdr
      
      \pard\plain\uc0\qr\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clbrdrt\brdrs\brdrw40\brdrcf1\clbrdrb\brdrs\brdrw40\brdrcf1\clbrdrl\brdrs\brdrw20\brdrcf1\clbrdrr\brdrs\brdrw20\brdrcf1\cellx1052
      \intbl {\f0 {\f0\fs20 num}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clbrdrt\brdrs\brdrw40\brdrcf1\clbrdrb\brdrs\brdrw40\brdrcf1\clbrdrl\brdrs\brdrw20\brdrcf1\clbrdrr\brdrs\brdrw20\brdrcf1\cellx2104
      \intbl {\f0 {\f0\fs20 char}}\cell
      \pard\plain
      
      \pard\plain\uc0\qc\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clbrdrt\brdrs\brdrw40\brdrcf1\clbrdrb\brdrs\brdrw40\brdrcf1\clbrdrl\brdrs\brdrw20\brdrcf1\clbrdrr\brdrs\brdrw20\brdrcf1\cellx3156
      \intbl {\f0 {\f0\fs20 fctr}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clbrdrt\brdrs\brdrw40\brdrcf1\clbrdrb\brdrs\brdrw40\brdrcf1\clbrdrl\brdrs\brdrw20\brdrcf1\clbrdrr\brdrs\brdrw20\brdrcf1\cellx4208
      \intbl {\f0 {\f0\fs20 date}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clbrdrt\brdrs\brdrw40\brdrcf1\clbrdrb\brdrs\brdrw40\brdrcf1\clbrdrl\brdrs\brdrw20\brdrcf1\clbrdrr\brdrs\brdrw20\brdrcf1\cellx5260
      \intbl {\f0 {\f0\fs20 time}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clbrdrt\brdrs\brdrw40\brdrcf1\clbrdrb\brdrs\brdrw40\brdrcf1\clbrdrl\brdrs\brdrw20\brdrcf1\clbrdrr\brdrs\brdrw20\brdrcf1\cellx6312
      \intbl {\f0 {\f0\fs20 datetime}}\cell
      \pard\plain
      
      \pard\plain\uc0\qr\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clbrdrt\brdrs\brdrw40\brdrcf1\clbrdrb\brdrs\brdrw40\brdrcf1\clbrdrl\brdrs\brdrw20\brdrcf1\clbrdrr\brdrs\brdrw20\brdrcf1\cellx7364
      \intbl {\f0 {\f0\fs20 currency}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clbrdrt\brdrs\brdrw40\brdrcf1\clbrdrb\brdrs\brdrw40\brdrcf1\clbrdrl\brdrs\brdrw20\brdrcf1\clbrdrr\brdrs\brdrw20\brdrcf1\cellx8416
      \intbl {\f0 {\f0\fs20 row}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clbrdrt\brdrs\brdrw40\brdrcf1\clbrdrb\brdrs\brdrw40\brdrcf1\clbrdrl\brdrs\brdrw20\brdrcf1\clbrdrr\brdrs\brdrw20\brdrcf1\cellx9468
      \intbl {\f0 {\f0\fs20 group}}\cell
      \pard\plain
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\qr\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clbrdrt\brdrs\brdrw10\brdrcf1\clbrdrb\brdrs\brdrw10\brdrcf1\clbrdrl\brdrs\brdrw10\brdrcf1\clbrdrr\brdrs\brdrw10\brdrcf1\cellx1052
      \intbl {\f0 {\f0\fs20 0.1111}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clbrdrt\brdrs\brdrw10\brdrcf1\clbrdrb\brdrs\brdrw10\brdrcf1\clbrdrl\brdrs\brdrw10\brdrcf1\clbrdrr\brdrs\brdrw10\brdrcf1\cellx2104
      \intbl {\f0 {\f0\fs20 apricot}}\cell
      \pard\plain
      
      \pard\plain\uc0\qc\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clbrdrt\brdrs\brdrw10\brdrcf1\clbrdrb\brdrs\brdrw10\brdrcf1\clbrdrl\brdrs\brdrw10\brdrcf1\clbrdrr\brdrs\brdrw10\brdrcf1\cellx3156
      \intbl {\f0 {\f0\fs20 one}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clbrdrt\brdrs\brdrw10\brdrcf1\clbrdrb\brdrs\brdrw10\brdrcf1\clbrdrl\brdrs\brdrw10\brdrcf1\clbrdrr\brdrs\brdrw10\brdrcf1\cellx4208
      \intbl {\f0 {\f0\fs20 2015-01-15}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clbrdrt\brdrs\brdrw10\brdrcf1\clbrdrb\brdrs\brdrw10\brdrcf1\clbrdrl\brdrs\brdrw10\brdrcf1\clbrdrr\brdrs\brdrw10\brdrcf1\cellx5260
      \intbl {\f0 {\f0\fs20 13:35}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clbrdrt\brdrs\brdrw10\brdrcf1\clbrdrb\brdrs\brdrw10\brdrcf1\clbrdrl\brdrs\brdrw10\brdrcf1\clbrdrr\brdrs\brdrw10\brdrcf1\cellx6312
      \intbl {\f0 {\f0\fs20 2018-01-01 02:22}}\cell
      \pard\plain
      
      \pard\plain\uc0\qr\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clbrdrt\brdrs\brdrw10\brdrcf1\clbrdrb\brdrs\brdrw10\brdrcf1\clbrdrl\brdrs\brdrw10\brdrcf1\clbrdrr\brdrs\brdrw10\brdrcf1\cellx7364
      \intbl {\f0 {\f0\fs20 49.95}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clbrdrt\brdrs\brdrw10\brdrcf1\clbrdrb\brdrs\brdrw10\brdrcf1\clbrdrl\brdrs\brdrw10\brdrcf1\clbrdrr\brdrs\brdrw10\brdrcf1\cellx8416
      \intbl {\f0 {\f0\fs20 row_1}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clbrdrt\brdrs\brdrw10\brdrcf1\clbrdrb\brdrs\brdrw10\brdrcf1\clbrdrl\brdrs\brdrw10\brdrcf1\clbrdrr\brdrs\brdrw10\brdrcf1\cellx9468
      \intbl {\f0 {\f0\fs20 grp_a}}\cell
      \pard\plain
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx9468
      \intbl {\f0 {\f0\fs20 {\f0\fs20\i\super }{\f0\fs20 A footnote.}}}\cell
      \pard\plain
      
      \row
      
      }

---

    Code
      .
    Output
      [1] "<table class=\"gt_table\">\n  \n  <thead class=\"gt_col_headings\">\n    <tr>\n      <th class=\"gt_col_heading gt_columns_bottom_border gt_right\" rowspan=\"1\" colspan=\"1\">num</th>\n      <th class=\"gt_col_heading gt_columns_bottom_border gt_left\" rowspan=\"1\" colspan=\"1\">char</th>\n      <th class=\"gt_col_heading gt_columns_bottom_border gt_center\" rowspan=\"1\" colspan=\"1\">fctr</th>\n      <th class=\"gt_col_heading gt_columns_bottom_border gt_left\" rowspan=\"1\" colspan=\"1\">date</th>\n      <th class=\"gt_col_heading gt_columns_bottom_border gt_left\" rowspan=\"1\" colspan=\"1\">time</th>\n      <th class=\"gt_col_heading gt_columns_bottom_border gt_left\" rowspan=\"1\" colspan=\"1\">datetime</th>\n      <th class=\"gt_col_heading gt_columns_bottom_border gt_right\" rowspan=\"1\" colspan=\"1\">currency</th>\n      <th class=\"gt_col_heading gt_columns_bottom_border gt_left\" rowspan=\"1\" colspan=\"1\">row</th>\n      <th class=\"gt_col_heading gt_columns_bottom_border gt_left\" rowspan=\"1\" colspan=\"1\">group</th>\n    </tr>\n  </thead>\n  <tbody class=\"gt_table_body\">\n    <tr><td class=\"gt_row gt_right\">0.1111<sup class=\"gt_footnote_marks\">1</sup></td>\n<td class=\"gt_row gt_left\">apricot</td>\n<td class=\"gt_row gt_center\">one</td>\n<td class=\"gt_row gt_left\">2015-01-15</td>\n<td class=\"gt_row gt_left\">13:35</td>\n<td class=\"gt_row gt_left\">2018-01-01 02:22</td>\n<td class=\"gt_row gt_right\">49.95</td>\n<td class=\"gt_row gt_left\">row_1</td>\n<td class=\"gt_row gt_left\">grp_a</td></tr>\n  </tbody>\n  \n  <tfoot class=\"gt_footnotes\">\n    <tr>\n      <td class=\"gt_footnote\" colspan=\"9\"><sup class=\"gt_footnote_marks\">1</sup> A footnote.</td>\n    </tr>\n  </tfoot>\n</table>"

---

    Code
      .
    Output
      [1] "\\captionsetup[table]{labelformat=empty,skip=1pt}\n\\setlength{\\LTpost}{0mm}\n\\begin{longtable}{rlclllrll}\n\\toprule\nnum & char & fctr & date & time & datetime & currency & row & group \\\\ \n\\midrule\n0.1111\\textsuperscript{1} & apricot & one & 2015-01-15 & 13:35 & 2018-01-01 02:22 & 49.95 & row\\_1 & grp\\_a \\\\ \n\\bottomrule\n\\end{longtable}\n\\begin{minipage}{\\linewidth}\n\\textsuperscript{1}A footnote.\\\\\n\\end{minipage}\n"

---

    Code
      .
    Output
      {\rtf\ansi\ansicpg1252{\fonttbl{\f0\froman\fcharset0\fprq0 Calibri;}{\f1\froman\fcharset0\fprq0 Courier;}}{\colortbl;\red211\green211\blue211;}
      
      \trowd\trrh0\trhdr
      
      \pard\plain\uc0\qr\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clbrdrt\brdrs\brdrw40\brdrcf1\clbrdrb\brdrs\brdrw40\brdrcf1\clbrdrl\brdrs\brdrw20\brdrcf1\clbrdrr\brdrs\brdrw20\brdrcf1\cellx1052
      \intbl {\f0 {\f0\fs20 num}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clbrdrt\brdrs\brdrw40\brdrcf1\clbrdrb\brdrs\brdrw40\brdrcf1\clbrdrl\brdrs\brdrw20\brdrcf1\clbrdrr\brdrs\brdrw20\brdrcf1\cellx2104
      \intbl {\f0 {\f0\fs20 char}}\cell
      \pard\plain
      
      \pard\plain\uc0\qc\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clbrdrt\brdrs\brdrw40\brdrcf1\clbrdrb\brdrs\brdrw40\brdrcf1\clbrdrl\brdrs\brdrw20\brdrcf1\clbrdrr\brdrs\brdrw20\brdrcf1\cellx3156
      \intbl {\f0 {\f0\fs20 fctr}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clbrdrt\brdrs\brdrw40\brdrcf1\clbrdrb\brdrs\brdrw40\brdrcf1\clbrdrl\brdrs\brdrw20\brdrcf1\clbrdrr\brdrs\brdrw20\brdrcf1\cellx4208
      \intbl {\f0 {\f0\fs20 date}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clbrdrt\brdrs\brdrw40\brdrcf1\clbrdrb\brdrs\brdrw40\brdrcf1\clbrdrl\brdrs\brdrw20\brdrcf1\clbrdrr\brdrs\brdrw20\brdrcf1\cellx5260
      \intbl {\f0 {\f0\fs20 time}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clbrdrt\brdrs\brdrw40\brdrcf1\clbrdrb\brdrs\brdrw40\brdrcf1\clbrdrl\brdrs\brdrw20\brdrcf1\clbrdrr\brdrs\brdrw20\brdrcf1\cellx6312
      \intbl {\f0 {\f0\fs20 datetime}}\cell
      \pard\plain
      
      \pard\plain\uc0\qr\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clbrdrt\brdrs\brdrw40\brdrcf1\clbrdrb\brdrs\brdrw40\brdrcf1\clbrdrl\brdrs\brdrw20\brdrcf1\clbrdrr\brdrs\brdrw20\brdrcf1\cellx7364
      \intbl {\f0 {\f0\fs20 currency}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clbrdrt\brdrs\brdrw40\brdrcf1\clbrdrb\brdrs\brdrw40\brdrcf1\clbrdrl\brdrs\brdrw20\brdrcf1\clbrdrr\brdrs\brdrw20\brdrcf1\cellx8416
      \intbl {\f0 {\f0\fs20 row}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clbrdrt\brdrs\brdrw40\brdrcf1\clbrdrb\brdrs\brdrw40\brdrcf1\clbrdrl\brdrs\brdrw20\brdrcf1\clbrdrr\brdrs\brdrw20\brdrcf1\cellx9468
      \intbl {\f0 {\f0\fs20 group}}\cell
      \pard\plain
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\qr\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clbrdrt\brdrs\brdrw10\brdrcf1\clbrdrb\brdrs\brdrw10\brdrcf1\clbrdrl\brdrs\brdrw10\brdrcf1\clbrdrr\brdrs\brdrw10\brdrcf1\cellx1052
      \intbl {\f0 {\f0\fs20 0.1111{\super \i 1}}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clbrdrt\brdrs\brdrw10\brdrcf1\clbrdrb\brdrs\brdrw10\brdrcf1\clbrdrl\brdrs\brdrw10\brdrcf1\clbrdrr\brdrs\brdrw10\brdrcf1\cellx2104
      \intbl {\f0 {\f0\fs20 apricot}}\cell
      \pard\plain
      
      \pard\plain\uc0\qc\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clbrdrt\brdrs\brdrw10\brdrcf1\clbrdrb\brdrs\brdrw10\brdrcf1\clbrdrl\brdrs\brdrw10\brdrcf1\clbrdrr\brdrs\brdrw10\brdrcf1\cellx3156
      \intbl {\f0 {\f0\fs20 one}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clbrdrt\brdrs\brdrw10\brdrcf1\clbrdrb\brdrs\brdrw10\brdrcf1\clbrdrl\brdrs\brdrw10\brdrcf1\clbrdrr\brdrs\brdrw10\brdrcf1\cellx4208
      \intbl {\f0 {\f0\fs20 2015-01-15}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clbrdrt\brdrs\brdrw10\brdrcf1\clbrdrb\brdrs\brdrw10\brdrcf1\clbrdrl\brdrs\brdrw10\brdrcf1\clbrdrr\brdrs\brdrw10\brdrcf1\cellx5260
      \intbl {\f0 {\f0\fs20 13:35}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clbrdrt\brdrs\brdrw10\brdrcf1\clbrdrb\brdrs\brdrw10\brdrcf1\clbrdrl\brdrs\brdrw10\brdrcf1\clbrdrr\brdrs\brdrw10\brdrcf1\cellx6312
      \intbl {\f0 {\f0\fs20 2018-01-01 02:22}}\cell
      \pard\plain
      
      \pard\plain\uc0\qr\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clbrdrt\brdrs\brdrw10\brdrcf1\clbrdrb\brdrs\brdrw10\brdrcf1\clbrdrl\brdrs\brdrw10\brdrcf1\clbrdrr\brdrs\brdrw10\brdrcf1\cellx7364
      \intbl {\f0 {\f0\fs20 49.95}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clbrdrt\brdrs\brdrw10\brdrcf1\clbrdrb\brdrs\brdrw10\brdrcf1\clbrdrl\brdrs\brdrw10\brdrcf1\clbrdrr\brdrs\brdrw10\brdrcf1\cellx8416
      \intbl {\f0 {\f0\fs20 row_1}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clbrdrt\brdrs\brdrw10\brdrcf1\clbrdrb\brdrs\brdrw10\brdrcf1\clbrdrl\brdrs\brdrw10\brdrcf1\clbrdrr\brdrs\brdrw10\brdrcf1\cellx9468
      \intbl {\f0 {\f0\fs20 grp_a}}\cell
      \pard\plain
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx9468
      \intbl {\f0 {\f0\fs20 {\f0\fs20\i\super 1}{\f0\fs20 A footnote.}}}\cell
      \pard\plain
      
      \row
      
      }

---

    Code
      .
    Output
      [1] "<table class=\"gt_table\">\n  \n  <thead class=\"gt_col_headings\">\n    <tr>\n      <th class=\"gt_col_heading gt_columns_bottom_border gt_right\" rowspan=\"1\" colspan=\"1\">num</th>\n      <th class=\"gt_col_heading gt_columns_bottom_border gt_left\" rowspan=\"1\" colspan=\"1\">char</th>\n      <th class=\"gt_col_heading gt_columns_bottom_border gt_center\" rowspan=\"1\" colspan=\"1\">fctr</th>\n      <th class=\"gt_col_heading gt_columns_bottom_border gt_left\" rowspan=\"1\" colspan=\"1\">date</th>\n      <th class=\"gt_col_heading gt_columns_bottom_border gt_left\" rowspan=\"1\" colspan=\"1\">time</th>\n      <th class=\"gt_col_heading gt_columns_bottom_border gt_left\" rowspan=\"1\" colspan=\"1\">datetime</th>\n      <th class=\"gt_col_heading gt_columns_bottom_border gt_right\" rowspan=\"1\" colspan=\"1\">currency</th>\n      <th class=\"gt_col_heading gt_columns_bottom_border gt_left\" rowspan=\"1\" colspan=\"1\">row</th>\n      <th class=\"gt_col_heading gt_columns_bottom_border gt_left\" rowspan=\"1\" colspan=\"1\">group</th>\n    </tr>\n  </thead>\n  <tbody class=\"gt_table_body\">\n    <tr><td class=\"gt_row gt_right\">0.1111<sup class=\"gt_footnote_marks\">1</sup></td>\n<td class=\"gt_row gt_left\">apricot</td>\n<td class=\"gt_row gt_center\">one</td>\n<td class=\"gt_row gt_left\">2015-01-15</td>\n<td class=\"gt_row gt_left\">13:35</td>\n<td class=\"gt_row gt_left\">2018-01-01 02:22</td>\n<td class=\"gt_row gt_right\">49.95</td>\n<td class=\"gt_row gt_left\">row_1</td>\n<td class=\"gt_row gt_left\">grp_a</td></tr>\n  </tbody>\n  \n  <tfoot>\n    <tr class=\"gt_footnotes\">\n      <td class=\"gt_footnote\" colspan=\"9\">\n        <div style=\"padding-bottom:2px;\"> A footnote.  A second footnote. <sup class=\"gt_footnote_marks\">1</sup> location note</div>\n      </td>\n    </tr>\n  </tfoot>\n</table>"

---

    Code
      .
    Output
      [1] "\\captionsetup[table]{labelformat=empty,skip=1pt}\n\\setlength{\\LTpost}{0mm}\n\\begin{longtable}{rlclllrll}\n\\toprule\nnum & char & fctr & date & time & datetime & currency & row & group \\\\ \n\\midrule\n0.1111\\textsuperscript{1} & apricot & one & 2015-01-15 & 13:35 & 2018-01-01 02:22 & 49.95 & row\\_1 & grp\\_a \\\\ \n\\bottomrule\n\\end{longtable}\n\\begin{minipage}{\\linewidth}\nA footnote. A second footnote. \\textsuperscript{1}location note\\\\\n\\end{minipage}\n"

---

    Code
      .
    Output
      {\rtf\ansi\ansicpg1252{\fonttbl{\f0\froman\fcharset0\fprq0 Calibri;}{\f1\froman\fcharset0\fprq0 Courier;}}{\colortbl;\red211\green211\blue211;}
      
      \trowd\trrh0\trhdr
      
      \pard\plain\uc0\qr\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clbrdrt\brdrs\brdrw40\brdrcf1\clbrdrb\brdrs\brdrw40\brdrcf1\clbrdrl\brdrs\brdrw20\brdrcf1\clbrdrr\brdrs\brdrw20\brdrcf1\cellx1052
      \intbl {\f0 {\f0\fs20 num}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clbrdrt\brdrs\brdrw40\brdrcf1\clbrdrb\brdrs\brdrw40\brdrcf1\clbrdrl\brdrs\brdrw20\brdrcf1\clbrdrr\brdrs\brdrw20\brdrcf1\cellx2104
      \intbl {\f0 {\f0\fs20 char}}\cell
      \pard\plain
      
      \pard\plain\uc0\qc\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clbrdrt\brdrs\brdrw40\brdrcf1\clbrdrb\brdrs\brdrw40\brdrcf1\clbrdrl\brdrs\brdrw20\brdrcf1\clbrdrr\brdrs\brdrw20\brdrcf1\cellx3156
      \intbl {\f0 {\f0\fs20 fctr}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clbrdrt\brdrs\brdrw40\brdrcf1\clbrdrb\brdrs\brdrw40\brdrcf1\clbrdrl\brdrs\brdrw20\brdrcf1\clbrdrr\brdrs\brdrw20\brdrcf1\cellx4208
      \intbl {\f0 {\f0\fs20 date}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clbrdrt\brdrs\brdrw40\brdrcf1\clbrdrb\brdrs\brdrw40\brdrcf1\clbrdrl\brdrs\brdrw20\brdrcf1\clbrdrr\brdrs\brdrw20\brdrcf1\cellx5260
      \intbl {\f0 {\f0\fs20 time}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clbrdrt\brdrs\brdrw40\brdrcf1\clbrdrb\brdrs\brdrw40\brdrcf1\clbrdrl\brdrs\brdrw20\brdrcf1\clbrdrr\brdrs\brdrw20\brdrcf1\cellx6312
      \intbl {\f0 {\f0\fs20 datetime}}\cell
      \pard\plain
      
      \pard\plain\uc0\qr\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clbrdrt\brdrs\brdrw40\brdrcf1\clbrdrb\brdrs\brdrw40\brdrcf1\clbrdrl\brdrs\brdrw20\brdrcf1\clbrdrr\brdrs\brdrw20\brdrcf1\cellx7364
      \intbl {\f0 {\f0\fs20 currency}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clbrdrt\brdrs\brdrw40\brdrcf1\clbrdrb\brdrs\brdrw40\brdrcf1\clbrdrl\brdrs\brdrw20\brdrcf1\clbrdrr\brdrs\brdrw20\brdrcf1\cellx8416
      \intbl {\f0 {\f0\fs20 row}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clbrdrt\brdrs\brdrw40\brdrcf1\clbrdrb\brdrs\brdrw40\brdrcf1\clbrdrl\brdrs\brdrw20\brdrcf1\clbrdrr\brdrs\brdrw20\brdrcf1\cellx9468
      \intbl {\f0 {\f0\fs20 group}}\cell
      \pard\plain
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\qr\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clbrdrt\brdrs\brdrw10\brdrcf1\clbrdrb\brdrs\brdrw10\brdrcf1\clbrdrl\brdrs\brdrw10\brdrcf1\clbrdrr\brdrs\brdrw10\brdrcf1\cellx1052
      \intbl {\f0 {\f0\fs20 0.1111{\super \i 1}}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clbrdrt\brdrs\brdrw10\brdrcf1\clbrdrb\brdrs\brdrw10\brdrcf1\clbrdrl\brdrs\brdrw10\brdrcf1\clbrdrr\brdrs\brdrw10\brdrcf1\cellx2104
      \intbl {\f0 {\f0\fs20 apricot}}\cell
      \pard\plain
      
      \pard\plain\uc0\qc\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clbrdrt\brdrs\brdrw10\brdrcf1\clbrdrb\brdrs\brdrw10\brdrcf1\clbrdrl\brdrs\brdrw10\brdrcf1\clbrdrr\brdrs\brdrw10\brdrcf1\cellx3156
      \intbl {\f0 {\f0\fs20 one}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clbrdrt\brdrs\brdrw10\brdrcf1\clbrdrb\brdrs\brdrw10\brdrcf1\clbrdrl\brdrs\brdrw10\brdrcf1\clbrdrr\brdrs\brdrw10\brdrcf1\cellx4208
      \intbl {\f0 {\f0\fs20 2015-01-15}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clbrdrt\brdrs\brdrw10\brdrcf1\clbrdrb\brdrs\brdrw10\brdrcf1\clbrdrl\brdrs\brdrw10\brdrcf1\clbrdrr\brdrs\brdrw10\brdrcf1\cellx5260
      \intbl {\f0 {\f0\fs20 13:35}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clbrdrt\brdrs\brdrw10\brdrcf1\clbrdrb\brdrs\brdrw10\brdrcf1\clbrdrl\brdrs\brdrw10\brdrcf1\clbrdrr\brdrs\brdrw10\brdrcf1\cellx6312
      \intbl {\f0 {\f0\fs20 2018-01-01 02:22}}\cell
      \pard\plain
      
      \pard\plain\uc0\qr\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clbrdrt\brdrs\brdrw10\brdrcf1\clbrdrb\brdrs\brdrw10\brdrcf1\clbrdrl\brdrs\brdrw10\brdrcf1\clbrdrr\brdrs\brdrw10\brdrcf1\cellx7364
      \intbl {\f0 {\f0\fs20 49.95}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clbrdrt\brdrs\brdrw10\brdrcf1\clbrdrb\brdrs\brdrw10\brdrcf1\clbrdrl\brdrs\brdrw10\brdrcf1\clbrdrr\brdrs\brdrw10\brdrcf1\cellx8416
      \intbl {\f0 {\f0\fs20 row_1}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clbrdrt\brdrs\brdrw10\brdrcf1\clbrdrb\brdrs\brdrw10\brdrcf1\clbrdrl\brdrs\brdrw10\brdrcf1\clbrdrr\brdrs\brdrw10\brdrcf1\cellx9468
      \intbl {\f0 {\f0\fs20 grp_a}}\cell
      \pard\plain
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx9468
      \intbl {\f0 {\f0\fs20 {\f0\fs20\i\super }{\f0\fs20 A footnote.} {\f0\fs20\i\super }{\f0\fs20 A second footnote.} {\f0\fs20\i\super 1}{\f0\fs20 location note}}}\cell
      \pard\plain
      
      \row
      
      }

