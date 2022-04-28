# group labels as a column work well across many variations

    Code
      .
    Output
      [1] "<table class=\"gt_table\">\n  <thead class=\"gt_header\">\n    <tr>\n      <th colspan=\"9\" class=\"gt_heading gt_title gt_font_normal\" style>Data listing from <strong>exibble</strong></th>\n    </tr>\n    <tr>\n      <th colspan=\"9\" class=\"gt_heading gt_subtitle gt_font_normal gt_bottom_border\" style><code>exibble</code> is an R dataset</th>\n    </tr>\n  </thead>\n  <thead class=\"gt_col_headings\">\n    <tr>\n      <th class=\"gt_col_heading gt_columns_bottom_border gt_right\" rowspan=\"2\" colspan=\"1\">num</th>\n      <th class=\"gt_col_heading gt_columns_bottom_border gt_left\" rowspan=\"2\" colspan=\"1\">char</th>\n      <th class=\"gt_col_heading gt_columns_bottom_border gt_center\" rowspan=\"2\" colspan=\"1\">fctr</th>\n      <th class=\"gt_center gt_columns_top_border gt_column_spanner_outer\" rowspan=\"1\" colspan=\"3\">\n        <span class=\"gt_column_spanner\">timing</span>\n      </th>\n      <th class=\"gt_col_heading gt_columns_bottom_border gt_right\" rowspan=\"2\" colspan=\"1\">currency</th>\n      <th class=\"gt_col_heading gt_columns_bottom_border gt_left\" rowspan=\"2\" colspan=\"1\">row</th>\n      <th class=\"gt_col_heading gt_columns_bottom_border gt_left\" rowspan=\"2\" colspan=\"1\">group</th>\n    </tr>\n    <tr>\n      <th class=\"gt_col_heading gt_columns_bottom_border gt_left\" rowspan=\"1\" colspan=\"1\">date</th>\n      <th class=\"gt_col_heading gt_columns_bottom_border gt_left\" rowspan=\"1\" colspan=\"1\">time</th>\n      <th class=\"gt_col_heading gt_columns_bottom_border gt_left\" rowspan=\"1\" colspan=\"1\">datetime</th>\n    </tr>\n  </thead>\n  <tbody class=\"gt_table_body\">\n    <tr><td class=\"gt_row gt_right\">1.111e-01</td>\n<td class=\"gt_row gt_left\">apricot</td>\n<td class=\"gt_row gt_center\">one</td>\n<td class=\"gt_row gt_left\">2015-01-15</td>\n<td class=\"gt_row gt_left\">13:35</td>\n<td class=\"gt_row gt_left\">2018-01-01 02:22</td>\n<td class=\"gt_row gt_right\">49.950</td>\n<td class=\"gt_row gt_left\">row_1</td>\n<td class=\"gt_row gt_left\">grp_a</td></tr>\n    <tr><td class=\"gt_row gt_right\">2.222e+00</td>\n<td class=\"gt_row gt_left\">banana</td>\n<td class=\"gt_row gt_center\">two</td>\n<td class=\"gt_row gt_left\">2015-02-15</td>\n<td class=\"gt_row gt_left\">14:40</td>\n<td class=\"gt_row gt_left\">2018-02-02 14:33</td>\n<td class=\"gt_row gt_right\">17.950</td>\n<td class=\"gt_row gt_left\">row_2</td>\n<td class=\"gt_row gt_left\">grp_a</td></tr>\n    <tr><td class=\"gt_row gt_right\">3.333e+01</td>\n<td class=\"gt_row gt_left\">coconut</td>\n<td class=\"gt_row gt_center\">three</td>\n<td class=\"gt_row gt_left\">2015-03-15</td>\n<td class=\"gt_row gt_left\">15:45</td>\n<td class=\"gt_row gt_left\">2018-03-03 03:44</td>\n<td class=\"gt_row gt_right\">1.390</td>\n<td class=\"gt_row gt_left\">row_3</td>\n<td class=\"gt_row gt_left\">grp_a</td></tr>\n    <tr><td class=\"gt_row gt_right\">4.444e+02</td>\n<td class=\"gt_row gt_left\">durian</td>\n<td class=\"gt_row gt_center\">four</td>\n<td class=\"gt_row gt_left\">2015-04-15</td>\n<td class=\"gt_row gt_left\">16:50</td>\n<td class=\"gt_row gt_left\">2018-04-04 15:55</td>\n<td class=\"gt_row gt_right\">65100.000</td>\n<td class=\"gt_row gt_left\">row_4</td>\n<td class=\"gt_row gt_left\">grp_a</td></tr>\n    <tr><td class=\"gt_row gt_right\">5.550e+03</td>\n<td class=\"gt_row gt_left\">NA</td>\n<td class=\"gt_row gt_center\">five</td>\n<td class=\"gt_row gt_left\">2015-05-15</td>\n<td class=\"gt_row gt_left\">17:55</td>\n<td class=\"gt_row gt_left\">2018-05-05 04:00</td>\n<td class=\"gt_row gt_right\">1325.810</td>\n<td class=\"gt_row gt_left\">row_5</td>\n<td class=\"gt_row gt_left\">grp_b</td></tr>\n    <tr><td class=\"gt_row gt_right\">NA</td>\n<td class=\"gt_row gt_left\">fig</td>\n<td class=\"gt_row gt_center\">six</td>\n<td class=\"gt_row gt_left\">2015-06-15</td>\n<td class=\"gt_row gt_left\">NA</td>\n<td class=\"gt_row gt_left\">2018-06-06 16:11</td>\n<td class=\"gt_row gt_right\">13.255</td>\n<td class=\"gt_row gt_left\">row_6</td>\n<td class=\"gt_row gt_left\">grp_b</td></tr>\n    <tr><td class=\"gt_row gt_right\">7.770e+05</td>\n<td class=\"gt_row gt_left\">grapefruit</td>\n<td class=\"gt_row gt_center\">seven</td>\n<td class=\"gt_row gt_left\">NA</td>\n<td class=\"gt_row gt_left\">19:10</td>\n<td class=\"gt_row gt_left\">2018-07-07 05:22</td>\n<td class=\"gt_row gt_right\">NA</td>\n<td class=\"gt_row gt_left\">row_7</td>\n<td class=\"gt_row gt_left\">grp_b</td></tr>\n    <tr><td class=\"gt_row gt_right\">8.880e+06</td>\n<td class=\"gt_row gt_left\">honeydew</td>\n<td class=\"gt_row gt_center\">eight</td>\n<td class=\"gt_row gt_left\">2015-08-15</td>\n<td class=\"gt_row gt_left\">20:20</td>\n<td class=\"gt_row gt_left\">NA</td>\n<td class=\"gt_row gt_right\">0.440</td>\n<td class=\"gt_row gt_left\">row_8</td>\n<td class=\"gt_row gt_left\">grp_b</td></tr>\n  </tbody>\n  <tfoot class=\"gt_sourcenotes\">\n    <tr>\n      <td class=\"gt_sourcenote\" colspan=\"9\">Source note #1</td>\n    </tr>\n    <tr>\n      <td class=\"gt_sourcenote\" colspan=\"9\">Source note #2</td>\n    </tr>\n  </tfoot>\n  \n</table>"

---

    Code
      .
    Output
      [1] "\\captionsetup[table]{labelformat=empty,skip=1pt}\n\\setlength{\\LTpost}{0mm}\n\\begin{longtable}{rlclllrll}\n\\caption*{\n{\\large Data listing from \\textbf{exibble}} \\\\ \n{\\small \\texttt{exibble} is an R dataset}\n} \\\\ \n\\toprule\n &  &  & \\multicolumn{3}{c}{timing} &  &  &  \\\\ \n\\cmidrule(lr){4-6}\nnum & char & fctr & date & time & datetime & currency & row & group \\\\ \n\\midrule\n1.111e-01 & apricot & one & 2015-01-15 & 13:35 & 2018-01-01 02:22 & 49.950 & row\\_1 & grp\\_a \\\\ \n2.222e+00 & banana & two & 2015-02-15 & 14:40 & 2018-02-02 14:33 & 17.950 & row\\_2 & grp\\_a \\\\ \n3.333e+01 & coconut & three & 2015-03-15 & 15:45 & 2018-03-03 03:44 & 1.390 & row\\_3 & grp\\_a \\\\ \n4.444e+02 & durian & four & 2015-04-15 & 16:50 & 2018-04-04 15:55 & 65100.000 & row\\_4 & grp\\_a \\\\ \n5.550e+03 & NA & five & 2015-05-15 & 17:55 & 2018-05-05 04:00 & 1325.810 & row\\_5 & grp\\_b \\\\ \nNA & fig & six & 2015-06-15 & NA & 2018-06-06 16:11 & 13.255 & row\\_6 & grp\\_b \\\\ \n7.770e+05 & grapefruit & seven & NA & 19:10 & 2018-07-07 05:22 & NA & row\\_7 & grp\\_b \\\\ \n8.880e+06 & honeydew & eight & 2015-08-15 & 20:20 & NA & 0.440 & row\\_8 & grp\\_b \\\\ \n\\bottomrule\n\\end{longtable}\n\\begin{minipage}{\\linewidth}\nSource note \\#1\\\\\nSource note \\#2\\\\\n\\end{minipage}\n"

---

    Code
      .
    Output
      {\rtf\ansi\ansicpg1252{\fonttbl{\f0\froman\fcharset0\fprq0 Courier New;}{\f1\froman\fcharset0\fprq0 Times;}}{\colortbl;\red51\green51\blue51;\red211\green211\blue211;}
      
      \paperw12240\paperh15840\widowctrl\ftnbj\fet0\sectd\linex0
      \lndscpsxn
      \margl1440\margr1440\margt1440\margb1440
      \headery720\footery720\fs20
      
      \trowd\trrh0\trhdr
      
      \pard\plain\uc0\qc\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx9360
      \intbl {\f0\cf1 {\f0\fs20 Data listing from {\b exibble}} {\f0\fs20\i\super } \line {\f0\fs20 {\f1 exibble} is an R dataset} {\f0\fs20\i\super }}\cell
      \pard\plain
      
      \row
      
      \trowd\trrh0\trhdr
      
      \pard\plain\uc0\qc\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx1040
      \intbl {\f0 {\f0\fs20 }}\cell
      \pard\plain
      
      \pard\plain\uc0\qc\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx2080
      \intbl {\f0 {\f0\fs20 }}\cell
      \pard\plain
      
      \pard\plain\uc0\qc\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx3120
      \intbl {\f0 {\f0\fs20 }}\cell
      \pard\plain
      
      \pard\plain\uc0\qc\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clmgf\cellx4160
      \intbl {\f0 {\f0\fs20 timing}}\cell
      \pard\plain
      
      \pard\plain\uc0\qc\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clmrg\cellx5200
      \intbl {\f0 {\f0\fs20 timing}}\cell
      \pard\plain
      
      \pard\plain\uc0\qc\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clmrg\cellx6240
      \intbl {\f0 {\f0\fs20 timing}}\cell
      \pard\plain
      
      \pard\plain\uc0\qc\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx7280
      \intbl {\f0 {\f0\fs20 }}\cell
      \pard\plain
      
      \pard\plain\uc0\qc\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx8320
      \intbl {\f0 {\f0\fs20 }}\cell
      \pard\plain
      
      \pard\plain\uc0\qc\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx9360
      \intbl {\f0 {\f0\fs20 }}\cell
      \pard\plain
      
      \row
      
      \trowd\trrh0\trhdr
      
      \pard\plain\uc0\qr\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clbrdrb\brdrs\brdrw40\brdrcf2\cellx1040
      \intbl {\f0 {\f0\fs20 num}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clbrdrb\brdrs\brdrw40\brdrcf2\cellx2080
      \intbl {\f0 {\f0\fs20 char}}\cell
      \pard\plain
      
      \pard\plain\uc0\qc\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clbrdrb\brdrs\brdrw40\brdrcf2\cellx3120
      \intbl {\f0 {\f0\fs20 fctr}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clbrdrb\brdrs\brdrw40\brdrcf2\cellx4160
      \intbl {\f0 {\f0\fs20 date}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clbrdrb\brdrs\brdrw40\brdrcf2\cellx5200
      \intbl {\f0 {\f0\fs20 time}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clbrdrb\brdrs\brdrw40\brdrcf2\cellx6240
      \intbl {\f0 {\f0\fs20 datetime}}\cell
      \pard\plain
      
      \pard\plain\uc0\qr\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clbrdrb\brdrs\brdrw40\brdrcf2\cellx7280
      \intbl {\f0 {\f0\fs20 currency}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clbrdrb\brdrs\brdrw40\brdrcf2\cellx8320
      \intbl {\f0 {\f0\fs20 row}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clbrdrb\brdrs\brdrw40\brdrcf2\cellx9360
      \intbl {\f0 {\f0\fs20 group}}\cell
      \pard\plain
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\qr\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx1040
      \intbl {\f0 {\f0\fs20 1.111e-01}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx2080
      \intbl {\f0 {\f0\fs20 apricot}}\cell
      \pard\plain
      
      \pard\plain\uc0\qc\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx3120
      \intbl {\f0 {\f0\fs20 one}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx4160
      \intbl {\f0 {\f0\fs20 2015-01-15}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx5200
      \intbl {\f0 {\f0\fs20 13:35}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx6240
      \intbl {\f0 {\f0\fs20 2018-01-01 02:22}}\cell
      \pard\plain
      
      \pard\plain\uc0\qr\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx7280
      \intbl {\f0 {\f0\fs20 49.950}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx8320
      \intbl {\f0 {\f0\fs20 row_1}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx9360
      \intbl {\f0 {\f0\fs20 grp_a}}\cell
      \pard\plain
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\qr\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx1040
      \intbl {\f0 {\f0\fs20 2.222e+00}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx2080
      \intbl {\f0 {\f0\fs20 banana}}\cell
      \pard\plain
      
      \pard\plain\uc0\qc\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx3120
      \intbl {\f0 {\f0\fs20 two}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx4160
      \intbl {\f0 {\f0\fs20 2015-02-15}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx5200
      \intbl {\f0 {\f0\fs20 14:40}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx6240
      \intbl {\f0 {\f0\fs20 2018-02-02 14:33}}\cell
      \pard\plain
      
      \pard\plain\uc0\qr\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx7280
      \intbl {\f0 {\f0\fs20 17.950}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx8320
      \intbl {\f0 {\f0\fs20 row_2}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx9360
      \intbl {\f0 {\f0\fs20 grp_a}}\cell
      \pard\plain
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\qr\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx1040
      \intbl {\f0 {\f0\fs20 3.333e+01}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx2080
      \intbl {\f0 {\f0\fs20 coconut}}\cell
      \pard\plain
      
      \pard\plain\uc0\qc\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx3120
      \intbl {\f0 {\f0\fs20 three}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx4160
      \intbl {\f0 {\f0\fs20 2015-03-15}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx5200
      \intbl {\f0 {\f0\fs20 15:45}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx6240
      \intbl {\f0 {\f0\fs20 2018-03-03 03:44}}\cell
      \pard\plain
      
      \pard\plain\uc0\qr\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx7280
      \intbl {\f0 {\f0\fs20 1.390}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx8320
      \intbl {\f0 {\f0\fs20 row_3}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx9360
      \intbl {\f0 {\f0\fs20 grp_a}}\cell
      \pard\plain
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\qr\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx1040
      \intbl {\f0 {\f0\fs20 4.444e+02}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx2080
      \intbl {\f0 {\f0\fs20 durian}}\cell
      \pard\plain
      
      \pard\plain\uc0\qc\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx3120
      \intbl {\f0 {\f0\fs20 four}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx4160
      \intbl {\f0 {\f0\fs20 2015-04-15}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx5200
      \intbl {\f0 {\f0\fs20 16:50}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx6240
      \intbl {\f0 {\f0\fs20 2018-04-04 15:55}}\cell
      \pard\plain
      
      \pard\plain\uc0\qr\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx7280
      \intbl {\f0 {\f0\fs20 65100.000}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx8320
      \intbl {\f0 {\f0\fs20 row_4}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx9360
      \intbl {\f0 {\f0\fs20 grp_a}}\cell
      \pard\plain
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\qr\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx1040
      \intbl {\f0 {\f0\fs20 5.550e+03}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx2080
      \intbl {\f0 {\f0\fs20 NA}}\cell
      \pard\plain
      
      \pard\plain\uc0\qc\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx3120
      \intbl {\f0 {\f0\fs20 five}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx4160
      \intbl {\f0 {\f0\fs20 2015-05-15}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx5200
      \intbl {\f0 {\f0\fs20 17:55}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx6240
      \intbl {\f0 {\f0\fs20 2018-05-05 04:00}}\cell
      \pard\plain
      
      \pard\plain\uc0\qr\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx7280
      \intbl {\f0 {\f0\fs20 1325.810}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx8320
      \intbl {\f0 {\f0\fs20 row_5}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx9360
      \intbl {\f0 {\f0\fs20 grp_b}}\cell
      \pard\plain
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\qr\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx1040
      \intbl {\f0 {\f0\fs20 NA}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx2080
      \intbl {\f0 {\f0\fs20 fig}}\cell
      \pard\plain
      
      \pard\plain\uc0\qc\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx3120
      \intbl {\f0 {\f0\fs20 six}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx4160
      \intbl {\f0 {\f0\fs20 2015-06-15}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx5200
      \intbl {\f0 {\f0\fs20 NA}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx6240
      \intbl {\f0 {\f0\fs20 2018-06-06 16:11}}\cell
      \pard\plain
      
      \pard\plain\uc0\qr\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx7280
      \intbl {\f0 {\f0\fs20 13.255}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx8320
      \intbl {\f0 {\f0\fs20 row_6}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx9360
      \intbl {\f0 {\f0\fs20 grp_b}}\cell
      \pard\plain
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\qr\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx1040
      \intbl {\f0 {\f0\fs20 7.770e+05}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx2080
      \intbl {\f0 {\f0\fs20 grapefruit}}\cell
      \pard\plain
      
      \pard\plain\uc0\qc\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx3120
      \intbl {\f0 {\f0\fs20 seven}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx4160
      \intbl {\f0 {\f0\fs20 NA}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx5200
      \intbl {\f0 {\f0\fs20 19:10}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx6240
      \intbl {\f0 {\f0\fs20 2018-07-07 05:22}}\cell
      \pard\plain
      
      \pard\plain\uc0\qr\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx7280
      \intbl {\f0 {\f0\fs20 NA}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx8320
      \intbl {\f0 {\f0\fs20 row_7}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx9360
      \intbl {\f0 {\f0\fs20 grp_b}}\cell
      \pard\plain
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\qr\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx1040
      \intbl {\f0 {\f0\fs20 8.880e+06}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx2080
      \intbl {\f0 {\f0\fs20 honeydew}}\cell
      \pard\plain
      
      \pard\plain\uc0\qc\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx3120
      \intbl {\f0 {\f0\fs20 eight}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx4160
      \intbl {\f0 {\f0\fs20 2015-08-15}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx5200
      \intbl {\f0 {\f0\fs20 20:20}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx6240
      \intbl {\f0 {\f0\fs20 NA}}\cell
      \pard\plain
      
      \pard\plain\uc0\qr\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx7280
      \intbl {\f0 {\f0\fs20 0.440}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx8320
      \intbl {\f0 {\f0\fs20 row_8}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx9360
      \intbl {\f0 {\f0\fs20 grp_b}}\cell
      \pard\plain
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx9360
      \intbl {\f0 {\f0\fs20 Source note #1\line Source note #2}}\cell
      \pard\plain
      
      \row
      
      }

---

    Code
      .
    Output
      [1] "<table class=\"gt_table\">\n  <thead class=\"gt_header\">\n    <tr>\n      <th colspan=\"9\" class=\"gt_heading gt_title gt_font_normal\" style>Data listing from <strong>exibble</strong></th>\n    </tr>\n    <tr>\n      <th colspan=\"9\" class=\"gt_heading gt_subtitle gt_font_normal gt_bottom_border\" style><code>exibble</code> is an R dataset</th>\n    </tr>\n  </thead>\n  <thead class=\"gt_col_headings\">\n    <tr>\n      <th class=\"gt_col_heading gt_columns_bottom_border gt_right\" rowspan=\"2\" colspan=\"1\">num</th>\n      <th class=\"gt_col_heading gt_columns_bottom_border gt_left\" rowspan=\"2\" colspan=\"1\">char</th>\n      <th class=\"gt_col_heading gt_columns_bottom_border gt_center\" rowspan=\"2\" colspan=\"1\">fctr</th>\n      <th class=\"gt_center gt_columns_top_border gt_column_spanner_outer\" rowspan=\"1\" colspan=\"3\">\n        <span class=\"gt_column_spanner\">timing</span>\n      </th>\n      <th class=\"gt_col_heading gt_columns_bottom_border gt_right\" rowspan=\"2\" colspan=\"1\">currency</th>\n      <th class=\"gt_col_heading gt_columns_bottom_border gt_left\" rowspan=\"2\" colspan=\"1\">row</th>\n      <th class=\"gt_col_heading gt_columns_bottom_border gt_left\" rowspan=\"2\" colspan=\"1\">group</th>\n    </tr>\n    <tr>\n      <th class=\"gt_col_heading gt_columns_bottom_border gt_left\" rowspan=\"1\" colspan=\"1\">date</th>\n      <th class=\"gt_col_heading gt_columns_bottom_border gt_left\" rowspan=\"1\" colspan=\"1\">time</th>\n      <th class=\"gt_col_heading gt_columns_bottom_border gt_left\" rowspan=\"1\" colspan=\"1\">datetime</th>\n    </tr>\n  </thead>\n  <tbody class=\"gt_table_body\">\n    <tr><td class=\"gt_row gt_right\">1.111e-01</td>\n<td class=\"gt_row gt_left\">apricot</td>\n<td class=\"gt_row gt_center\">one</td>\n<td class=\"gt_row gt_left\">2015-01-15</td>\n<td class=\"gt_row gt_left\">13:35</td>\n<td class=\"gt_row gt_left\">2018-01-01 02:22</td>\n<td class=\"gt_row gt_right\">49.950</td>\n<td class=\"gt_row gt_left\">row_1</td>\n<td class=\"gt_row gt_left\">grp_a</td></tr>\n    <tr><td class=\"gt_row gt_right\">2.222e+00</td>\n<td class=\"gt_row gt_left\">banana</td>\n<td class=\"gt_row gt_center\">two</td>\n<td class=\"gt_row gt_left\">2015-02-15</td>\n<td class=\"gt_row gt_left\">14:40</td>\n<td class=\"gt_row gt_left\">2018-02-02 14:33</td>\n<td class=\"gt_row gt_right\">17.950</td>\n<td class=\"gt_row gt_left\">row_2</td>\n<td class=\"gt_row gt_left\">grp_a</td></tr>\n    <tr><td class=\"gt_row gt_right\">3.333e+01</td>\n<td class=\"gt_row gt_left\">coconut</td>\n<td class=\"gt_row gt_center\">three</td>\n<td class=\"gt_row gt_left\">2015-03-15</td>\n<td class=\"gt_row gt_left\">15:45</td>\n<td class=\"gt_row gt_left\">2018-03-03 03:44</td>\n<td class=\"gt_row gt_right\">1.390</td>\n<td class=\"gt_row gt_left\">row_3</td>\n<td class=\"gt_row gt_left\">grp_a</td></tr>\n    <tr><td class=\"gt_row gt_right\">4.444e+02</td>\n<td class=\"gt_row gt_left\">durian</td>\n<td class=\"gt_row gt_center\">four</td>\n<td class=\"gt_row gt_left\">2015-04-15</td>\n<td class=\"gt_row gt_left\">16:50</td>\n<td class=\"gt_row gt_left\">2018-04-04 15:55</td>\n<td class=\"gt_row gt_right\">65100.000</td>\n<td class=\"gt_row gt_left\">row_4</td>\n<td class=\"gt_row gt_left\">grp_a</td></tr>\n    <tr><td class=\"gt_row gt_right\">5.550e+03</td>\n<td class=\"gt_row gt_left\">NA</td>\n<td class=\"gt_row gt_center\">five</td>\n<td class=\"gt_row gt_left\">2015-05-15</td>\n<td class=\"gt_row gt_left\">17:55</td>\n<td class=\"gt_row gt_left\">2018-05-05 04:00</td>\n<td class=\"gt_row gt_right\">1325.810</td>\n<td class=\"gt_row gt_left\">row_5</td>\n<td class=\"gt_row gt_left\">grp_b</td></tr>\n    <tr><td class=\"gt_row gt_right\">NA</td>\n<td class=\"gt_row gt_left\">fig</td>\n<td class=\"gt_row gt_center\">six</td>\n<td class=\"gt_row gt_left\">2015-06-15</td>\n<td class=\"gt_row gt_left\">NA</td>\n<td class=\"gt_row gt_left\">2018-06-06 16:11</td>\n<td class=\"gt_row gt_right\">13.255</td>\n<td class=\"gt_row gt_left\">row_6</td>\n<td class=\"gt_row gt_left\">grp_b</td></tr>\n    <tr><td class=\"gt_row gt_right\">7.770e+05</td>\n<td class=\"gt_row gt_left\">grapefruit</td>\n<td class=\"gt_row gt_center\">seven</td>\n<td class=\"gt_row gt_left\">NA</td>\n<td class=\"gt_row gt_left\">19:10</td>\n<td class=\"gt_row gt_left\">2018-07-07 05:22</td>\n<td class=\"gt_row gt_right\">NA</td>\n<td class=\"gt_row gt_left\">row_7</td>\n<td class=\"gt_row gt_left\">grp_b</td></tr>\n    <tr><td class=\"gt_row gt_right\">8.880e+06</td>\n<td class=\"gt_row gt_left\">honeydew</td>\n<td class=\"gt_row gt_center\">eight</td>\n<td class=\"gt_row gt_left\">2015-08-15</td>\n<td class=\"gt_row gt_left\">20:20</td>\n<td class=\"gt_row gt_left\">NA</td>\n<td class=\"gt_row gt_right\">0.440</td>\n<td class=\"gt_row gt_left\">row_8</td>\n<td class=\"gt_row gt_left\">grp_b</td></tr>\n  </tbody>\n  <tfoot class=\"gt_sourcenotes\">\n    <tr>\n      <td class=\"gt_sourcenote\" colspan=\"9\">Source note #1</td>\n    </tr>\n    <tr>\n      <td class=\"gt_sourcenote\" colspan=\"9\">Source note #2</td>\n    </tr>\n  </tfoot>\n  \n</table>"

---

    Code
      .
    Output
      [1] "\\captionsetup[table]{labelformat=empty,skip=1pt}\n\\setlength{\\LTpost}{0mm}\n\\begin{longtable}{rlclllrll}\n\\caption*{\n{\\large Data listing from \\textbf{exibble}} \\\\ \n{\\small \\texttt{exibble} is an R dataset}\n} \\\\ \n\\toprule\n &  &  & \\multicolumn{3}{c}{timing} &  &  &  \\\\ \n\\cmidrule(lr){4-6}\nnum & char & fctr & date & time & datetime & currency & row & group \\\\ \n\\midrule\n1.111e-01 & apricot & one & 2015-01-15 & 13:35 & 2018-01-01 02:22 & 49.950 & row\\_1 & grp\\_a \\\\ \n2.222e+00 & banana & two & 2015-02-15 & 14:40 & 2018-02-02 14:33 & 17.950 & row\\_2 & grp\\_a \\\\ \n3.333e+01 & coconut & three & 2015-03-15 & 15:45 & 2018-03-03 03:44 & 1.390 & row\\_3 & grp\\_a \\\\ \n4.444e+02 & durian & four & 2015-04-15 & 16:50 & 2018-04-04 15:55 & 65100.000 & row\\_4 & grp\\_a \\\\ \n5.550e+03 & NA & five & 2015-05-15 & 17:55 & 2018-05-05 04:00 & 1325.810 & row\\_5 & grp\\_b \\\\ \nNA & fig & six & 2015-06-15 & NA & 2018-06-06 16:11 & 13.255 & row\\_6 & grp\\_b \\\\ \n7.770e+05 & grapefruit & seven & NA & 19:10 & 2018-07-07 05:22 & NA & row\\_7 & grp\\_b \\\\ \n8.880e+06 & honeydew & eight & 2015-08-15 & 20:20 & NA & 0.440 & row\\_8 & grp\\_b \\\\ \n\\bottomrule\n\\end{longtable}\n\\begin{minipage}{\\linewidth}\nSource note \\#1\\\\\nSource note \\#2\\\\\n\\end{minipage}\n"

---

    Code
      .
    Output
      {\rtf\ansi\ansicpg1252{\fonttbl{\f0\froman\fcharset0\fprq0 Courier New;}{\f1\froman\fcharset0\fprq0 Times;}}{\colortbl;\red51\green51\blue51;\red211\green211\blue211;}
      
      \paperw12240\paperh15840\widowctrl\ftnbj\fet0\sectd\linex0
      \lndscpsxn
      \margl1440\margr1440\margt1440\margb1440
      \headery720\footery720\fs20
      
      \trowd\trrh0\trhdr
      
      \pard\plain\uc0\qc\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx9360
      \intbl {\f0\cf1 {\f0\fs20 Data listing from {\b exibble}} {\f0\fs20\i\super } \line {\f0\fs20 {\f1 exibble} is an R dataset} {\f0\fs20\i\super }}\cell
      \pard\plain
      
      \row
      
      \trowd\trrh0\trhdr
      
      \pard\plain\uc0\qc\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx1040
      \intbl {\f0 {\f0\fs20 }}\cell
      \pard\plain
      
      \pard\plain\uc0\qc\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx2080
      \intbl {\f0 {\f0\fs20 }}\cell
      \pard\plain
      
      \pard\plain\uc0\qc\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx3120
      \intbl {\f0 {\f0\fs20 }}\cell
      \pard\plain
      
      \pard\plain\uc0\qc\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clmgf\cellx4160
      \intbl {\f0 {\f0\fs20 timing}}\cell
      \pard\plain
      
      \pard\plain\uc0\qc\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clmrg\cellx5200
      \intbl {\f0 {\f0\fs20 timing}}\cell
      \pard\plain
      
      \pard\plain\uc0\qc\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clmrg\cellx6240
      \intbl {\f0 {\f0\fs20 timing}}\cell
      \pard\plain
      
      \pard\plain\uc0\qc\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx7280
      \intbl {\f0 {\f0\fs20 }}\cell
      \pard\plain
      
      \pard\plain\uc0\qc\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx8320
      \intbl {\f0 {\f0\fs20 }}\cell
      \pard\plain
      
      \pard\plain\uc0\qc\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx9360
      \intbl {\f0 {\f0\fs20 }}\cell
      \pard\plain
      
      \row
      
      \trowd\trrh0\trhdr
      
      \pard\plain\uc0\qr\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clbrdrb\brdrs\brdrw40\brdrcf2\cellx1040
      \intbl {\f0 {\f0\fs20 num}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clbrdrb\brdrs\brdrw40\brdrcf2\cellx2080
      \intbl {\f0 {\f0\fs20 char}}\cell
      \pard\plain
      
      \pard\plain\uc0\qc\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clbrdrb\brdrs\brdrw40\brdrcf2\cellx3120
      \intbl {\f0 {\f0\fs20 fctr}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clbrdrb\brdrs\brdrw40\brdrcf2\cellx4160
      \intbl {\f0 {\f0\fs20 date}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clbrdrb\brdrs\brdrw40\brdrcf2\cellx5200
      \intbl {\f0 {\f0\fs20 time}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clbrdrb\brdrs\brdrw40\brdrcf2\cellx6240
      \intbl {\f0 {\f0\fs20 datetime}}\cell
      \pard\plain
      
      \pard\plain\uc0\qr\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clbrdrb\brdrs\brdrw40\brdrcf2\cellx7280
      \intbl {\f0 {\f0\fs20 currency}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clbrdrb\brdrs\brdrw40\brdrcf2\cellx8320
      \intbl {\f0 {\f0\fs20 row}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clbrdrb\brdrs\brdrw40\brdrcf2\cellx9360
      \intbl {\f0 {\f0\fs20 group}}\cell
      \pard\plain
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\qr\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx1040
      \intbl {\f0 {\f0\fs20 1.111e-01}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx2080
      \intbl {\f0 {\f0\fs20 apricot}}\cell
      \pard\plain
      
      \pard\plain\uc0\qc\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx3120
      \intbl {\f0 {\f0\fs20 one}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx4160
      \intbl {\f0 {\f0\fs20 2015-01-15}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx5200
      \intbl {\f0 {\f0\fs20 13:35}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx6240
      \intbl {\f0 {\f0\fs20 2018-01-01 02:22}}\cell
      \pard\plain
      
      \pard\plain\uc0\qr\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx7280
      \intbl {\f0 {\f0\fs20 49.950}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx8320
      \intbl {\f0 {\f0\fs20 row_1}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx9360
      \intbl {\f0 {\f0\fs20 grp_a}}\cell
      \pard\plain
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\qr\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx1040
      \intbl {\f0 {\f0\fs20 2.222e+00}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx2080
      \intbl {\f0 {\f0\fs20 banana}}\cell
      \pard\plain
      
      \pard\plain\uc0\qc\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx3120
      \intbl {\f0 {\f0\fs20 two}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx4160
      \intbl {\f0 {\f0\fs20 2015-02-15}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx5200
      \intbl {\f0 {\f0\fs20 14:40}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx6240
      \intbl {\f0 {\f0\fs20 2018-02-02 14:33}}\cell
      \pard\plain
      
      \pard\plain\uc0\qr\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx7280
      \intbl {\f0 {\f0\fs20 17.950}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx8320
      \intbl {\f0 {\f0\fs20 row_2}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx9360
      \intbl {\f0 {\f0\fs20 grp_a}}\cell
      \pard\plain
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\qr\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx1040
      \intbl {\f0 {\f0\fs20 3.333e+01}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx2080
      \intbl {\f0 {\f0\fs20 coconut}}\cell
      \pard\plain
      
      \pard\plain\uc0\qc\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx3120
      \intbl {\f0 {\f0\fs20 three}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx4160
      \intbl {\f0 {\f0\fs20 2015-03-15}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx5200
      \intbl {\f0 {\f0\fs20 15:45}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx6240
      \intbl {\f0 {\f0\fs20 2018-03-03 03:44}}\cell
      \pard\plain
      
      \pard\plain\uc0\qr\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx7280
      \intbl {\f0 {\f0\fs20 1.390}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx8320
      \intbl {\f0 {\f0\fs20 row_3}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx9360
      \intbl {\f0 {\f0\fs20 grp_a}}\cell
      \pard\plain
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\qr\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx1040
      \intbl {\f0 {\f0\fs20 4.444e+02}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx2080
      \intbl {\f0 {\f0\fs20 durian}}\cell
      \pard\plain
      
      \pard\plain\uc0\qc\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx3120
      \intbl {\f0 {\f0\fs20 four}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx4160
      \intbl {\f0 {\f0\fs20 2015-04-15}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx5200
      \intbl {\f0 {\f0\fs20 16:50}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx6240
      \intbl {\f0 {\f0\fs20 2018-04-04 15:55}}\cell
      \pard\plain
      
      \pard\plain\uc0\qr\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx7280
      \intbl {\f0 {\f0\fs20 65100.000}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx8320
      \intbl {\f0 {\f0\fs20 row_4}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx9360
      \intbl {\f0 {\f0\fs20 grp_a}}\cell
      \pard\plain
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\qr\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx1040
      \intbl {\f0 {\f0\fs20 5.550e+03}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx2080
      \intbl {\f0 {\f0\fs20 NA}}\cell
      \pard\plain
      
      \pard\plain\uc0\qc\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx3120
      \intbl {\f0 {\f0\fs20 five}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx4160
      \intbl {\f0 {\f0\fs20 2015-05-15}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx5200
      \intbl {\f0 {\f0\fs20 17:55}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx6240
      \intbl {\f0 {\f0\fs20 2018-05-05 04:00}}\cell
      \pard\plain
      
      \pard\plain\uc0\qr\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx7280
      \intbl {\f0 {\f0\fs20 1325.810}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx8320
      \intbl {\f0 {\f0\fs20 row_5}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx9360
      \intbl {\f0 {\f0\fs20 grp_b}}\cell
      \pard\plain
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\qr\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx1040
      \intbl {\f0 {\f0\fs20 NA}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx2080
      \intbl {\f0 {\f0\fs20 fig}}\cell
      \pard\plain
      
      \pard\plain\uc0\qc\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx3120
      \intbl {\f0 {\f0\fs20 six}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx4160
      \intbl {\f0 {\f0\fs20 2015-06-15}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx5200
      \intbl {\f0 {\f0\fs20 NA}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx6240
      \intbl {\f0 {\f0\fs20 2018-06-06 16:11}}\cell
      \pard\plain
      
      \pard\plain\uc0\qr\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx7280
      \intbl {\f0 {\f0\fs20 13.255}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx8320
      \intbl {\f0 {\f0\fs20 row_6}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx9360
      \intbl {\f0 {\f0\fs20 grp_b}}\cell
      \pard\plain
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\qr\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx1040
      \intbl {\f0 {\f0\fs20 7.770e+05}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx2080
      \intbl {\f0 {\f0\fs20 grapefruit}}\cell
      \pard\plain
      
      \pard\plain\uc0\qc\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx3120
      \intbl {\f0 {\f0\fs20 seven}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx4160
      \intbl {\f0 {\f0\fs20 NA}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx5200
      \intbl {\f0 {\f0\fs20 19:10}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx6240
      \intbl {\f0 {\f0\fs20 2018-07-07 05:22}}\cell
      \pard\plain
      
      \pard\plain\uc0\qr\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx7280
      \intbl {\f0 {\f0\fs20 NA}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx8320
      \intbl {\f0 {\f0\fs20 row_7}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx9360
      \intbl {\f0 {\f0\fs20 grp_b}}\cell
      \pard\plain
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\qr\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx1040
      \intbl {\f0 {\f0\fs20 8.880e+06}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx2080
      \intbl {\f0 {\f0\fs20 honeydew}}\cell
      \pard\plain
      
      \pard\plain\uc0\qc\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx3120
      \intbl {\f0 {\f0\fs20 eight}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx4160
      \intbl {\f0 {\f0\fs20 2015-08-15}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx5200
      \intbl {\f0 {\f0\fs20 20:20}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx6240
      \intbl {\f0 {\f0\fs20 NA}}\cell
      \pard\plain
      
      \pard\plain\uc0\qr\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx7280
      \intbl {\f0 {\f0\fs20 0.440}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx8320
      \intbl {\f0 {\f0\fs20 row_8}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx9360
      \intbl {\f0 {\f0\fs20 grp_b}}\cell
      \pard\plain
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx9360
      \intbl {\f0 {\f0\fs20 Source note #1\line Source note #2}}\cell
      \pard\plain
      
      \row
      
      }

---

    Code
      .
    Output
      [1] "<table class=\"gt_table\">\n  <thead class=\"gt_header\">\n    <tr>\n      <th colspan=\"8\" class=\"gt_heading gt_title gt_font_normal\" style>Data listing from <strong>exibble</strong></th>\n    </tr>\n    <tr>\n      <th colspan=\"8\" class=\"gt_heading gt_subtitle gt_font_normal gt_bottom_border\" style><code>exibble</code> is an R dataset</th>\n    </tr>\n  </thead>\n  <thead class=\"gt_col_headings\">\n    <tr>\n      <th class=\"gt_col_heading gt_columns_bottom_border gt_right\" rowspan=\"2\" colspan=\"1\">num</th>\n      <th class=\"gt_col_heading gt_columns_bottom_border gt_left\" rowspan=\"2\" colspan=\"1\">char</th>\n      <th class=\"gt_col_heading gt_columns_bottom_border gt_center\" rowspan=\"2\" colspan=\"1\">fctr</th>\n      <th class=\"gt_center gt_columns_top_border gt_column_spanner_outer\" rowspan=\"1\" colspan=\"3\">\n        <span class=\"gt_column_spanner\">timing</span>\n      </th>\n      <th class=\"gt_col_heading gt_columns_bottom_border gt_right\" rowspan=\"2\" colspan=\"1\">currency</th>\n      <th class=\"gt_col_heading gt_columns_bottom_border gt_left\" rowspan=\"2\" colspan=\"1\">row</th>\n    </tr>\n    <tr>\n      <th class=\"gt_col_heading gt_columns_bottom_border gt_left\" rowspan=\"1\" colspan=\"1\">date</th>\n      <th class=\"gt_col_heading gt_columns_bottom_border gt_left\" rowspan=\"1\" colspan=\"1\">time</th>\n      <th class=\"gt_col_heading gt_columns_bottom_border gt_left\" rowspan=\"1\" colspan=\"1\">datetime</th>\n    </tr>\n  </thead>\n  <tbody class=\"gt_table_body\">\n    <tr class=\"gt_group_heading_row\">\n      <td colspan=\"8\" class=\"gt_group_heading\">grp_a</td>\n    </tr>\n    <tr class=\"gt_row_group_first\"><td class=\"gt_row gt_right\">1.111e-01</td>\n<td class=\"gt_row gt_left\">apricot</td>\n<td class=\"gt_row gt_center\">one</td>\n<td class=\"gt_row gt_left\">2015-01-15</td>\n<td class=\"gt_row gt_left\">13:35</td>\n<td class=\"gt_row gt_left\">2018-01-01 02:22</td>\n<td class=\"gt_row gt_right\">49.950</td>\n<td class=\"gt_row gt_left\">row_1</td></tr>\n    <tr><td class=\"gt_row gt_right\">2.222e+00</td>\n<td class=\"gt_row gt_left\">banana</td>\n<td class=\"gt_row gt_center\">two</td>\n<td class=\"gt_row gt_left\">2015-02-15</td>\n<td class=\"gt_row gt_left\">14:40</td>\n<td class=\"gt_row gt_left\">2018-02-02 14:33</td>\n<td class=\"gt_row gt_right\">17.950</td>\n<td class=\"gt_row gt_left\">row_2</td></tr>\n    <tr><td class=\"gt_row gt_right\">3.333e+01</td>\n<td class=\"gt_row gt_left\">coconut</td>\n<td class=\"gt_row gt_center\">three</td>\n<td class=\"gt_row gt_left\">2015-03-15</td>\n<td class=\"gt_row gt_left\">15:45</td>\n<td class=\"gt_row gt_left\">2018-03-03 03:44</td>\n<td class=\"gt_row gt_right\">1.390</td>\n<td class=\"gt_row gt_left\">row_3</td></tr>\n    <tr><td class=\"gt_row gt_right\">4.444e+02</td>\n<td class=\"gt_row gt_left\">durian</td>\n<td class=\"gt_row gt_center\">four</td>\n<td class=\"gt_row gt_left\">2015-04-15</td>\n<td class=\"gt_row gt_left\">16:50</td>\n<td class=\"gt_row gt_left\">2018-04-04 15:55</td>\n<td class=\"gt_row gt_right\">65100.000</td>\n<td class=\"gt_row gt_left\">row_4</td></tr>\n    <tr class=\"gt_group_heading_row\">\n      <td colspan=\"8\" class=\"gt_group_heading\">grp_b</td>\n    </tr>\n    <tr class=\"gt_row_group_first\"><td class=\"gt_row gt_right\">5.550e+03</td>\n<td class=\"gt_row gt_left\">NA</td>\n<td class=\"gt_row gt_center\">five</td>\n<td class=\"gt_row gt_left\">2015-05-15</td>\n<td class=\"gt_row gt_left\">17:55</td>\n<td class=\"gt_row gt_left\">2018-05-05 04:00</td>\n<td class=\"gt_row gt_right\">1325.810</td>\n<td class=\"gt_row gt_left\">row_5</td></tr>\n    <tr><td class=\"gt_row gt_right\">NA</td>\n<td class=\"gt_row gt_left\">fig</td>\n<td class=\"gt_row gt_center\">six</td>\n<td class=\"gt_row gt_left\">2015-06-15</td>\n<td class=\"gt_row gt_left\">NA</td>\n<td class=\"gt_row gt_left\">2018-06-06 16:11</td>\n<td class=\"gt_row gt_right\">13.255</td>\n<td class=\"gt_row gt_left\">row_6</td></tr>\n    <tr><td class=\"gt_row gt_right\">7.770e+05</td>\n<td class=\"gt_row gt_left\">grapefruit</td>\n<td class=\"gt_row gt_center\">seven</td>\n<td class=\"gt_row gt_left\">NA</td>\n<td class=\"gt_row gt_left\">19:10</td>\n<td class=\"gt_row gt_left\">2018-07-07 05:22</td>\n<td class=\"gt_row gt_right\">NA</td>\n<td class=\"gt_row gt_left\">row_7</td></tr>\n    <tr><td class=\"gt_row gt_right\">8.880e+06</td>\n<td class=\"gt_row gt_left\">honeydew</td>\n<td class=\"gt_row gt_center\">eight</td>\n<td class=\"gt_row gt_left\">2015-08-15</td>\n<td class=\"gt_row gt_left\">20:20</td>\n<td class=\"gt_row gt_left\">NA</td>\n<td class=\"gt_row gt_right\">0.440</td>\n<td class=\"gt_row gt_left\">row_8</td></tr>\n  </tbody>\n  <tfoot class=\"gt_sourcenotes\">\n    <tr>\n      <td class=\"gt_sourcenote\" colspan=\"8\">Source note #1</td>\n    </tr>\n    <tr>\n      <td class=\"gt_sourcenote\" colspan=\"8\">Source note #2</td>\n    </tr>\n  </tfoot>\n  \n</table>"

---

    Code
      .
    Output
      [1] "\\captionsetup[table]{labelformat=empty,skip=1pt}\n\\setlength{\\LTpost}{0mm}\n\\begin{longtable}{rlclllrl}\n\\caption*{\n{\\large Data listing from \\textbf{exibble}} \\\\ \n{\\small \\texttt{exibble} is an R dataset}\n} \\\\ \n\\toprule\n &  &  & \\multicolumn{3}{c}{timing} &  &  \\\\ \n\\cmidrule(lr){4-6}\nnum & char & fctr & date & time & datetime & currency & row \\\\ \n\\midrule\n\\multicolumn{1}{l}{grp\\_a} \\\\ \n\\midrule\n1.111e-01 & apricot & one & 2015-01-15 & 13:35 & 2018-01-01 02:22 & 49.950 & row\\_1 \\\\ \n2.222e+00 & banana & two & 2015-02-15 & 14:40 & 2018-02-02 14:33 & 17.950 & row\\_2 \\\\ \n3.333e+01 & coconut & three & 2015-03-15 & 15:45 & 2018-03-03 03:44 & 1.390 & row\\_3 \\\\ \n4.444e+02 & durian & four & 2015-04-15 & 16:50 & 2018-04-04 15:55 & 65100.000 & row\\_4 \\\\ \n\\midrule\n\\multicolumn{1}{l}{grp\\_b} \\\\ \n\\midrule\n5.550e+03 & NA & five & 2015-05-15 & 17:55 & 2018-05-05 04:00 & 1325.810 & row\\_5 \\\\ \nNA & fig & six & 2015-06-15 & NA & 2018-06-06 16:11 & 13.255 & row\\_6 \\\\ \n7.770e+05 & grapefruit & seven & NA & 19:10 & 2018-07-07 05:22 & NA & row\\_7 \\\\ \n8.880e+06 & honeydew & eight & 2015-08-15 & 20:20 & NA & 0.440 & row\\_8 \\\\ \n\\bottomrule\n\\end{longtable}\n\\begin{minipage}{\\linewidth}\nSource note \\#1\\\\\nSource note \\#2\\\\\n\\end{minipage}\n"

---

    Code
      .
    Output
      {\rtf\ansi\ansicpg1252{\fonttbl{\f0\froman\fcharset0\fprq0 Courier New;}{\f1\froman\fcharset0\fprq0 Times;}}{\colortbl;\red51\green51\blue51;\red211\green211\blue211;}
      
      \paperw12240\paperh15840\widowctrl\ftnbj\fet0\sectd\linex0
      \lndscpsxn
      \margl1440\margr1440\margt1440\margb1440
      \headery720\footery720\fs20
      
      \trowd\trrh0\trhdr
      
      \pard\plain\uc0\qc\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx9360
      \intbl {\f0\cf1 {\f0\fs20 Data listing from {\b exibble}} {\f0\fs20\i\super } \line {\f0\fs20 {\f1 exibble} is an R dataset} {\f0\fs20\i\super }}\cell
      \pard\plain
      
      \row
      
      \trowd\trrh0\trhdr
      
      \pard\plain\uc0\qc\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx1170
      \intbl {\f0 {\f0\fs20 }}\cell
      \pard\plain
      
      \pard\plain\uc0\qc\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx2340
      \intbl {\f0 {\f0\fs20 }}\cell
      \pard\plain
      
      \pard\plain\uc0\qc\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx3510
      \intbl {\f0 {\f0\fs20 }}\cell
      \pard\plain
      
      \pard\plain\uc0\qc\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clmgf\cellx4680
      \intbl {\f0 {\f0\fs20 timing}}\cell
      \pard\plain
      
      \pard\plain\uc0\qc\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clmrg\cellx5850
      \intbl {\f0 {\f0\fs20 timing}}\cell
      \pard\plain
      
      \pard\plain\uc0\qc\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clmrg\cellx7020
      \intbl {\f0 {\f0\fs20 timing}}\cell
      \pard\plain
      
      \pard\plain\uc0\qc\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx8190
      \intbl {\f0 {\f0\fs20 }}\cell
      \pard\plain
      
      \pard\plain\uc0\qc\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx9360
      \intbl {\f0 {\f0\fs20 }}\cell
      \pard\plain
      
      \row
      
      \trowd\trrh0\trhdr
      
      \pard\plain\uc0\qr\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clbrdrb\brdrs\brdrw40\brdrcf2\cellx1170
      \intbl {\f0 {\f0\fs20 num}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clbrdrb\brdrs\brdrw40\brdrcf2\cellx2340
      \intbl {\f0 {\f0\fs20 char}}\cell
      \pard\plain
      
      \pard\plain\uc0\qc\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clbrdrb\brdrs\brdrw40\brdrcf2\cellx3510
      \intbl {\f0 {\f0\fs20 fctr}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clbrdrb\brdrs\brdrw40\brdrcf2\cellx4680
      \intbl {\f0 {\f0\fs20 date}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clbrdrb\brdrs\brdrw40\brdrcf2\cellx5850
      \intbl {\f0 {\f0\fs20 time}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clbrdrb\brdrs\brdrw40\brdrcf2\cellx7020
      \intbl {\f0 {\f0\fs20 datetime}}\cell
      \pard\plain
      
      \pard\plain\uc0\qr\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clbrdrb\brdrs\brdrw40\brdrcf2\cellx8190
      \intbl {\f0 {\f0\fs20 currency}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clbrdrb\brdrs\brdrw40\brdrcf2\cellx9360
      \intbl {\f0 {\f0\fs20 row}}\cell
      \pard\plain
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx9360
      \intbl {\f0\fs20 grp_a}\cell
      \pard\plain
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\qr\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx1170
      \intbl {\f0 {\f0\fs20 1.111e-01}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx2340
      \intbl {\f0 {\f0\fs20 apricot}}\cell
      \pard\plain
      
      \pard\plain\uc0\qc\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx3510
      \intbl {\f0 {\f0\fs20 one}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx4680
      \intbl {\f0 {\f0\fs20 2015-01-15}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx5850
      \intbl {\f0 {\f0\fs20 13:35}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx7020
      \intbl {\f0 {\f0\fs20 2018-01-01 02:22}}\cell
      \pard\plain
      
      \pard\plain\uc0\qr\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx8190
      \intbl {\f0 {\f0\fs20 49.950}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx9360
      \intbl {\f0 {\f0\fs20 row_1}}\cell
      \pard\plain
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\qr\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx1170
      \intbl {\f0 {\f0\fs20 2.222e+00}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx2340
      \intbl {\f0 {\f0\fs20 banana}}\cell
      \pard\plain
      
      \pard\plain\uc0\qc\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx3510
      \intbl {\f0 {\f0\fs20 two}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx4680
      \intbl {\f0 {\f0\fs20 2015-02-15}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx5850
      \intbl {\f0 {\f0\fs20 14:40}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx7020
      \intbl {\f0 {\f0\fs20 2018-02-02 14:33}}\cell
      \pard\plain
      
      \pard\plain\uc0\qr\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx8190
      \intbl {\f0 {\f0\fs20 17.950}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx9360
      \intbl {\f0 {\f0\fs20 row_2}}\cell
      \pard\plain
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\qr\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx1170
      \intbl {\f0 {\f0\fs20 3.333e+01}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx2340
      \intbl {\f0 {\f0\fs20 coconut}}\cell
      \pard\plain
      
      \pard\plain\uc0\qc\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx3510
      \intbl {\f0 {\f0\fs20 three}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx4680
      \intbl {\f0 {\f0\fs20 2015-03-15}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx5850
      \intbl {\f0 {\f0\fs20 15:45}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx7020
      \intbl {\f0 {\f0\fs20 2018-03-03 03:44}}\cell
      \pard\plain
      
      \pard\plain\uc0\qr\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx8190
      \intbl {\f0 {\f0\fs20 1.390}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx9360
      \intbl {\f0 {\f0\fs20 row_3}}\cell
      \pard\plain
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\qr\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx1170
      \intbl {\f0 {\f0\fs20 4.444e+02}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx2340
      \intbl {\f0 {\f0\fs20 durian}}\cell
      \pard\plain
      
      \pard\plain\uc0\qc\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx3510
      \intbl {\f0 {\f0\fs20 four}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx4680
      \intbl {\f0 {\f0\fs20 2015-04-15}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx5850
      \intbl {\f0 {\f0\fs20 16:50}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx7020
      \intbl {\f0 {\f0\fs20 2018-04-04 15:55}}\cell
      \pard\plain
      
      \pard\plain\uc0\qr\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx8190
      \intbl {\f0 {\f0\fs20 65100.000}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx9360
      \intbl {\f0 {\f0\fs20 row_4}}\cell
      \pard\plain
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx9360
      \intbl {\f0\fs20 grp_b}\cell
      \pard\plain
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\qr\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx1170
      \intbl {\f0 {\f0\fs20 5.550e+03}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx2340
      \intbl {\f0 {\f0\fs20 NA}}\cell
      \pard\plain
      
      \pard\plain\uc0\qc\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx3510
      \intbl {\f0 {\f0\fs20 five}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx4680
      \intbl {\f0 {\f0\fs20 2015-05-15}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx5850
      \intbl {\f0 {\f0\fs20 17:55}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx7020
      \intbl {\f0 {\f0\fs20 2018-05-05 04:00}}\cell
      \pard\plain
      
      \pard\plain\uc0\qr\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx8190
      \intbl {\f0 {\f0\fs20 1325.810}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx9360
      \intbl {\f0 {\f0\fs20 row_5}}\cell
      \pard\plain
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\qr\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx1170
      \intbl {\f0 {\f0\fs20 NA}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx2340
      \intbl {\f0 {\f0\fs20 fig}}\cell
      \pard\plain
      
      \pard\plain\uc0\qc\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx3510
      \intbl {\f0 {\f0\fs20 six}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx4680
      \intbl {\f0 {\f0\fs20 2015-06-15}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx5850
      \intbl {\f0 {\f0\fs20 NA}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx7020
      \intbl {\f0 {\f0\fs20 2018-06-06 16:11}}\cell
      \pard\plain
      
      \pard\plain\uc0\qr\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx8190
      \intbl {\f0 {\f0\fs20 13.255}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx9360
      \intbl {\f0 {\f0\fs20 row_6}}\cell
      \pard\plain
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\qr\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx1170
      \intbl {\f0 {\f0\fs20 7.770e+05}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx2340
      \intbl {\f0 {\f0\fs20 grapefruit}}\cell
      \pard\plain
      
      \pard\plain\uc0\qc\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx3510
      \intbl {\f0 {\f0\fs20 seven}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx4680
      \intbl {\f0 {\f0\fs20 NA}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx5850
      \intbl {\f0 {\f0\fs20 19:10}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx7020
      \intbl {\f0 {\f0\fs20 2018-07-07 05:22}}\cell
      \pard\plain
      
      \pard\plain\uc0\qr\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx8190
      \intbl {\f0 {\f0\fs20 NA}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx9360
      \intbl {\f0 {\f0\fs20 row_7}}\cell
      \pard\plain
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\qr\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx1170
      \intbl {\f0 {\f0\fs20 8.880e+06}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx2340
      \intbl {\f0 {\f0\fs20 honeydew}}\cell
      \pard\plain
      
      \pard\plain\uc0\qc\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx3510
      \intbl {\f0 {\f0\fs20 eight}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx4680
      \intbl {\f0 {\f0\fs20 2015-08-15}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx5850
      \intbl {\f0 {\f0\fs20 20:20}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx7020
      \intbl {\f0 {\f0\fs20 NA}}\cell
      \pard\plain
      
      \pard\plain\uc0\qr\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx8190
      \intbl {\f0 {\f0\fs20 0.440}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx9360
      \intbl {\f0 {\f0\fs20 row_8}}\cell
      \pard\plain
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx9360
      \intbl {\f0 {\f0\fs20 Source note #1\line Source note #2}}\cell
      \pard\plain
      
      \row
      
      }

---

    Code
      .
    Output
      [1] "<table class=\"gt_table\">\n  <thead class=\"gt_header\">\n    <tr>\n      <th colspan=\"9\" class=\"gt_heading gt_title gt_font_normal\" style>Data listing from <strong>exibble</strong></th>\n    </tr>\n    <tr>\n      <th colspan=\"9\" class=\"gt_heading gt_subtitle gt_font_normal gt_bottom_border\" style><code>exibble</code> is an R dataset</th>\n    </tr>\n  </thead>\n  <thead class=\"gt_col_headings\">\n    <tr>\n      <th class=\"gt_col_heading gt_columns_bottom_border gt_left\" rowspan=\"2\" colspan=\"1\">S.L.</th>\n      <th class=\"gt_col_heading gt_columns_bottom_border gt_right\" rowspan=\"2\" colspan=\"1\">num</th>\n      <th class=\"gt_col_heading gt_columns_bottom_border gt_left\" rowspan=\"2\" colspan=\"1\">char</th>\n      <th class=\"gt_col_heading gt_columns_bottom_border gt_center\" rowspan=\"2\" colspan=\"1\">fctr</th>\n      <th class=\"gt_center gt_columns_top_border gt_column_spanner_outer\" rowspan=\"1\" colspan=\"3\">\n        <span class=\"gt_column_spanner\">timing</span>\n      </th>\n      <th class=\"gt_col_heading gt_columns_bottom_border gt_right\" rowspan=\"2\" colspan=\"1\">currency</th>\n      <th class=\"gt_col_heading gt_columns_bottom_border gt_left\" rowspan=\"2\" colspan=\"1\">row</th>\n    </tr>\n    <tr>\n      <th class=\"gt_col_heading gt_columns_bottom_border gt_left\" rowspan=\"1\" colspan=\"1\">date</th>\n      <th class=\"gt_col_heading gt_columns_bottom_border gt_left\" rowspan=\"1\" colspan=\"1\">time</th>\n      <th class=\"gt_col_heading gt_columns_bottom_border gt_left\" rowspan=\"1\" colspan=\"1\">datetime</th>\n    </tr>\n  </thead>\n  <tbody class=\"gt_table_body\">\n    <tr class=\"gt_row_group_first\"><td rowspan=\"4\" class=\"gt_row gt_right gt_stub_row_group\">grp_a</td>\n<td class=\"gt_row gt_right\">1.111e-01</td>\n<td class=\"gt_row gt_left\">apricot</td>\n<td class=\"gt_row gt_center\">one</td>\n<td class=\"gt_row gt_left\">2015-01-15</td>\n<td class=\"gt_row gt_left\">13:35</td>\n<td class=\"gt_row gt_left\">2018-01-01 02:22</td>\n<td class=\"gt_row gt_right\">49.950</td>\n<td class=\"gt_row gt_left\">row_1</td></tr>\n    <tr><td class=\"gt_row gt_right\">2.222e+00</td>\n<td class=\"gt_row gt_left\">banana</td>\n<td class=\"gt_row gt_center\">two</td>\n<td class=\"gt_row gt_left\">2015-02-15</td>\n<td class=\"gt_row gt_left\">14:40</td>\n<td class=\"gt_row gt_left\">2018-02-02 14:33</td>\n<td class=\"gt_row gt_right\">17.950</td>\n<td class=\"gt_row gt_left\">row_2</td></tr>\n    <tr><td class=\"gt_row gt_right\">3.333e+01</td>\n<td class=\"gt_row gt_left\">coconut</td>\n<td class=\"gt_row gt_center\">three</td>\n<td class=\"gt_row gt_left\">2015-03-15</td>\n<td class=\"gt_row gt_left\">15:45</td>\n<td class=\"gt_row gt_left\">2018-03-03 03:44</td>\n<td class=\"gt_row gt_right\">1.390</td>\n<td class=\"gt_row gt_left\">row_3</td></tr>\n    <tr><td class=\"gt_row gt_right\">4.444e+02</td>\n<td class=\"gt_row gt_left\">durian</td>\n<td class=\"gt_row gt_center\">four</td>\n<td class=\"gt_row gt_left\">2015-04-15</td>\n<td class=\"gt_row gt_left\">16:50</td>\n<td class=\"gt_row gt_left\">2018-04-04 15:55</td>\n<td class=\"gt_row gt_right\">65100.000</td>\n<td class=\"gt_row gt_left\">row_4</td></tr>\n    <tr class=\"gt_row_group_first\"><td rowspan=\"4\" class=\"gt_row gt_right gt_stub_row_group\">grp_b</td>\n<td class=\"gt_row gt_right\">5.550e+03</td>\n<td class=\"gt_row gt_left\">NA</td>\n<td class=\"gt_row gt_center\">five</td>\n<td class=\"gt_row gt_left\">2015-05-15</td>\n<td class=\"gt_row gt_left\">17:55</td>\n<td class=\"gt_row gt_left\">2018-05-05 04:00</td>\n<td class=\"gt_row gt_right\">1325.810</td>\n<td class=\"gt_row gt_left\">row_5</td></tr>\n    <tr><td class=\"gt_row gt_right\">NA</td>\n<td class=\"gt_row gt_left\">fig</td>\n<td class=\"gt_row gt_center\">six</td>\n<td class=\"gt_row gt_left\">2015-06-15</td>\n<td class=\"gt_row gt_left\">NA</td>\n<td class=\"gt_row gt_left\">2018-06-06 16:11</td>\n<td class=\"gt_row gt_right\">13.255</td>\n<td class=\"gt_row gt_left\">row_6</td></tr>\n    <tr><td class=\"gt_row gt_right\">7.770e+05</td>\n<td class=\"gt_row gt_left\">grapefruit</td>\n<td class=\"gt_row gt_center\">seven</td>\n<td class=\"gt_row gt_left\">NA</td>\n<td class=\"gt_row gt_left\">19:10</td>\n<td class=\"gt_row gt_left\">2018-07-07 05:22</td>\n<td class=\"gt_row gt_right\">NA</td>\n<td class=\"gt_row gt_left\">row_7</td></tr>\n    <tr><td class=\"gt_row gt_right\">8.880e+06</td>\n<td class=\"gt_row gt_left\">honeydew</td>\n<td class=\"gt_row gt_center\">eight</td>\n<td class=\"gt_row gt_left\">2015-08-15</td>\n<td class=\"gt_row gt_left\">20:20</td>\n<td class=\"gt_row gt_left\">NA</td>\n<td class=\"gt_row gt_right\">0.440</td>\n<td class=\"gt_row gt_left\">row_8</td></tr>\n  </tbody>\n  <tfoot class=\"gt_sourcenotes\">\n    <tr>\n      <td class=\"gt_sourcenote\" colspan=\"9\">Source note #1</td>\n    </tr>\n    <tr>\n      <td class=\"gt_sourcenote\" colspan=\"9\">Source note #2</td>\n    </tr>\n  </tfoot>\n  \n</table>"

---

    Code
      .
    Output
      [1] "\\captionsetup[table]{labelformat=empty,skip=1pt}\n\\setlength{\\LTpost}{0mm}\n\\begin{longtable}{r|rlclllrl}\n\\caption*{\n{\\large Data listing from \\textbf{exibble}} \\\\ \n{\\small \\texttt{exibble} is an R dataset}\n} \\\\ \n\\toprule\n\\multicolumn{1}{l}{} &  &  &  & \\multicolumn{3}{c}{timing} &  &  \\\\ \n\\cmidrule(lr){5-7}\n\\multicolumn{1}{l}{S.L.} & num & char & fctr & date & time & datetime & currency & row \\\\ \n\\midrule\ngrp\\_a & 1.111e-01 & apricot & one & 2015-01-15 & 13:35 & 2018-01-01 02:22 & 49.950 & row\\_1 \\\\ \n & 2.222e+00 & banana & two & 2015-02-15 & 14:40 & 2018-02-02 14:33 & 17.950 & row\\_2 \\\\ \n & 3.333e+01 & coconut & three & 2015-03-15 & 15:45 & 2018-03-03 03:44 & 1.390 & row\\_3 \\\\ \n & 4.444e+02 & durian & four & 2015-04-15 & 16:50 & 2018-04-04 15:55 & 65100.000 & row\\_4 \\\\ \n\\midrule\ngrp\\_b & 5.550e+03 & NA & five & 2015-05-15 & 17:55 & 2018-05-05 04:00 & 1325.810 & row\\_5 \\\\ \n & NA & fig & six & 2015-06-15 & NA & 2018-06-06 16:11 & 13.255 & row\\_6 \\\\ \n & 7.770e+05 & grapefruit & seven & NA & 19:10 & 2018-07-07 05:22 & NA & row\\_7 \\\\ \n & 8.880e+06 & honeydew & eight & 2015-08-15 & 20:20 & NA & 0.440 & row\\_8 \\\\ \n\\bottomrule\n\\end{longtable}\n\\begin{minipage}{\\linewidth}\nSource note \\#1\\\\\nSource note \\#2\\\\\n\\end{minipage}\n"

---

    Code
      .
    Output
      {\rtf\ansi\ansicpg1252{\fonttbl{\f0\froman\fcharset0\fprq0 Courier New;}{\f1\froman\fcharset0\fprq0 Times;}}{\colortbl;\red51\green51\blue51;\red211\green211\blue211;}
      
      \paperw12240\paperh15840\widowctrl\ftnbj\fet0\sectd\linex0
      \lndscpsxn
      \margl1440\margr1440\margt1440\margb1440
      \headery720\footery720\fs20
      
      \trowd\trrh0\trhdr
      
      \pard\plain\uc0\qc\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx9360
      \intbl {\f0\cf1 {\f0\fs20 Data listing from {\b exibble}} {\f0\fs20\i\super } \line {\f0\fs20 {\f1 exibble} is an R dataset} {\f0\fs20\i\super }}\cell
      \pard\plain
      
      \row
      
      \trowd\trrh0\trhdr
      
      \pard\plain\uc0\qc\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx1040
      \intbl {\f0 {\f0\fs20 }}\cell
      \pard\plain
      
      \pard\plain\uc0\qc\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx2080
      \intbl {\f0 {\f0\fs20 }}\cell
      \pard\plain
      
      \pard\plain\uc0\qc\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx3120
      \intbl {\f0 {\f0\fs20 }}\cell
      \pard\plain
      
      \pard\plain\uc0\qc\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx4160
      \intbl {\f0 {\f0\fs20 }}\cell
      \pard\plain
      
      \pard\plain\uc0\qc\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clmgf\cellx5200
      \intbl {\f0 {\f0\fs20 timing}}\cell
      \pard\plain
      
      \pard\plain\uc0\qc\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clmrg\cellx6240
      \intbl {\f0 {\f0\fs20 timing}}\cell
      \pard\plain
      
      \pard\plain\uc0\qc\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clmrg\cellx7280
      \intbl {\f0 {\f0\fs20 timing}}\cell
      \pard\plain
      
      \pard\plain\uc0\qc\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx8320
      \intbl {\f0 {\f0\fs20 }}\cell
      \pard\plain
      
      \pard\plain\uc0\qc\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx9360
      \intbl {\f0 {\f0\fs20 }}\cell
      \pard\plain
      
      \row
      
      \trowd\trrh0\trhdr
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clbrdrb\brdrs\brdrw40\brdrcf2\cellx1040
      \intbl {\f0 {\f0\fs20 S.L.}}\cell
      \pard\plain
      
      \pard\plain\uc0\qr\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clbrdrb\brdrs\brdrw40\brdrcf2\cellx2080
      \intbl {\f0 {\f0\fs20 num}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clbrdrb\brdrs\brdrw40\brdrcf2\cellx3120
      \intbl {\f0 {\f0\fs20 char}}\cell
      \pard\plain
      
      \pard\plain\uc0\qc\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clbrdrb\brdrs\brdrw40\brdrcf2\cellx4160
      \intbl {\f0 {\f0\fs20 fctr}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clbrdrb\brdrs\brdrw40\brdrcf2\cellx5200
      \intbl {\f0 {\f0\fs20 date}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clbrdrb\brdrs\brdrw40\brdrcf2\cellx6240
      \intbl {\f0 {\f0\fs20 time}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clbrdrb\brdrs\brdrw40\brdrcf2\cellx7280
      \intbl {\f0 {\f0\fs20 datetime}}\cell
      \pard\plain
      
      \pard\plain\uc0\qr\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clbrdrb\brdrs\brdrw40\brdrcf2\cellx8320
      \intbl {\f0 {\f0\fs20 currency}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clbrdrb\brdrs\brdrw40\brdrcf2\cellx9360
      \intbl {\f0 {\f0\fs20 row}}\cell
      \pard\plain
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\qr\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx1040
      \intbl {\f0 {\f0\fs20 grp_a}}\cell
      \pard\plain
      
      \pard\plain\uc0\qr\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx2080
      \intbl {\f0 {\f0\fs20 1.111e-01}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx3120
      \intbl {\f0 {\f0\fs20 apricot}}\cell
      \pard\plain
      
      \pard\plain\uc0\qc\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx4160
      \intbl {\f0 {\f0\fs20 one}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx5200
      \intbl {\f0 {\f0\fs20 2015-01-15}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx6240
      \intbl {\f0 {\f0\fs20 13:35}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx7280
      \intbl {\f0 {\f0\fs20 2018-01-01 02:22}}\cell
      \pard\plain
      
      \pard\plain\uc0\qr\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx8320
      \intbl {\f0 {\f0\fs20 49.950}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx9360
      \intbl {\f0 {\f0\fs20 row_1}}\cell
      \pard\plain
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\qr\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx1040
      \intbl {\f0 {\f0\fs20 }}\cell
      \pard\plain
      
      \pard\plain\uc0\qr\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx2080
      \intbl {\f0 {\f0\fs20 2.222e+00}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx3120
      \intbl {\f0 {\f0\fs20 banana}}\cell
      \pard\plain
      
      \pard\plain\uc0\qc\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx4160
      \intbl {\f0 {\f0\fs20 two}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx5200
      \intbl {\f0 {\f0\fs20 2015-02-15}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx6240
      \intbl {\f0 {\f0\fs20 14:40}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx7280
      \intbl {\f0 {\f0\fs20 2018-02-02 14:33}}\cell
      \pard\plain
      
      \pard\plain\uc0\qr\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx8320
      \intbl {\f0 {\f0\fs20 17.950}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx9360
      \intbl {\f0 {\f0\fs20 row_2}}\cell
      \pard\plain
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\qr\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx1040
      \intbl {\f0 {\f0\fs20 }}\cell
      \pard\plain
      
      \pard\plain\uc0\qr\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx2080
      \intbl {\f0 {\f0\fs20 3.333e+01}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx3120
      \intbl {\f0 {\f0\fs20 coconut}}\cell
      \pard\plain
      
      \pard\plain\uc0\qc\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx4160
      \intbl {\f0 {\f0\fs20 three}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx5200
      \intbl {\f0 {\f0\fs20 2015-03-15}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx6240
      \intbl {\f0 {\f0\fs20 15:45}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx7280
      \intbl {\f0 {\f0\fs20 2018-03-03 03:44}}\cell
      \pard\plain
      
      \pard\plain\uc0\qr\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx8320
      \intbl {\f0 {\f0\fs20 1.390}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx9360
      \intbl {\f0 {\f0\fs20 row_3}}\cell
      \pard\plain
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\qr\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx1040
      \intbl {\f0 {\f0\fs20 }}\cell
      \pard\plain
      
      \pard\plain\uc0\qr\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx2080
      \intbl {\f0 {\f0\fs20 4.444e+02}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx3120
      \intbl {\f0 {\f0\fs20 durian}}\cell
      \pard\plain
      
      \pard\plain\uc0\qc\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx4160
      \intbl {\f0 {\f0\fs20 four}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx5200
      \intbl {\f0 {\f0\fs20 2015-04-15}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx6240
      \intbl {\f0 {\f0\fs20 16:50}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx7280
      \intbl {\f0 {\f0\fs20 2018-04-04 15:55}}\cell
      \pard\plain
      
      \pard\plain\uc0\qr\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx8320
      \intbl {\f0 {\f0\fs20 65100.000}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx9360
      \intbl {\f0 {\f0\fs20 row_4}}\cell
      \pard\plain
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\qr\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx1040
      \intbl {\f0 {\f0\fs20 grp_b}}\cell
      \pard\plain
      
      \pard\plain\uc0\qr\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx2080
      \intbl {\f0 {\f0\fs20 5.550e+03}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx3120
      \intbl {\f0 {\f0\fs20 NA}}\cell
      \pard\plain
      
      \pard\plain\uc0\qc\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx4160
      \intbl {\f0 {\f0\fs20 five}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx5200
      \intbl {\f0 {\f0\fs20 2015-05-15}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx6240
      \intbl {\f0 {\f0\fs20 17:55}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx7280
      \intbl {\f0 {\f0\fs20 2018-05-05 04:00}}\cell
      \pard\plain
      
      \pard\plain\uc0\qr\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx8320
      \intbl {\f0 {\f0\fs20 1325.810}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx9360
      \intbl {\f0 {\f0\fs20 row_5}}\cell
      \pard\plain
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\qr\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx1040
      \intbl {\f0 {\f0\fs20 }}\cell
      \pard\plain
      
      \pard\plain\uc0\qr\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx2080
      \intbl {\f0 {\f0\fs20 NA}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx3120
      \intbl {\f0 {\f0\fs20 fig}}\cell
      \pard\plain
      
      \pard\plain\uc0\qc\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx4160
      \intbl {\f0 {\f0\fs20 six}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx5200
      \intbl {\f0 {\f0\fs20 2015-06-15}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx6240
      \intbl {\f0 {\f0\fs20 NA}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx7280
      \intbl {\f0 {\f0\fs20 2018-06-06 16:11}}\cell
      \pard\plain
      
      \pard\plain\uc0\qr\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx8320
      \intbl {\f0 {\f0\fs20 13.255}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx9360
      \intbl {\f0 {\f0\fs20 row_6}}\cell
      \pard\plain
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\qr\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx1040
      \intbl {\f0 {\f0\fs20 }}\cell
      \pard\plain
      
      \pard\plain\uc0\qr\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx2080
      \intbl {\f0 {\f0\fs20 7.770e+05}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx3120
      \intbl {\f0 {\f0\fs20 grapefruit}}\cell
      \pard\plain
      
      \pard\plain\uc0\qc\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx4160
      \intbl {\f0 {\f0\fs20 seven}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx5200
      \intbl {\f0 {\f0\fs20 NA}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx6240
      \intbl {\f0 {\f0\fs20 19:10}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx7280
      \intbl {\f0 {\f0\fs20 2018-07-07 05:22}}\cell
      \pard\plain
      
      \pard\plain\uc0\qr\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx8320
      \intbl {\f0 {\f0\fs20 NA}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx9360
      \intbl {\f0 {\f0\fs20 row_7}}\cell
      \pard\plain
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\qr\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx1040
      \intbl {\f0 {\f0\fs20 }}\cell
      \pard\plain
      
      \pard\plain\uc0\qr\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx2080
      \intbl {\f0 {\f0\fs20 8.880e+06}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx3120
      \intbl {\f0 {\f0\fs20 honeydew}}\cell
      \pard\plain
      
      \pard\plain\uc0\qc\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx4160
      \intbl {\f0 {\f0\fs20 eight}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx5200
      \intbl {\f0 {\f0\fs20 2015-08-15}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx6240
      \intbl {\f0 {\f0\fs20 20:20}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx7280
      \intbl {\f0 {\f0\fs20 NA}}\cell
      \pard\plain
      
      \pard\plain\uc0\qr\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx8320
      \intbl {\f0 {\f0\fs20 0.440}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx9360
      \intbl {\f0 {\f0\fs20 row_8}}\cell
      \pard\plain
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx9360
      \intbl {\f0 {\f0\fs20 Source note #1\line Source note #2}}\cell
      \pard\plain
      
      \row
      
      }

---

    Code
      .
    Output
      [1] "<table class=\"gt_table\">\n  <thead class=\"gt_header\">\n    <tr>\n      <th colspan=\"9\" class=\"gt_heading gt_title gt_font_normal\" style>Data listing from <strong>exibble</strong></th>\n    </tr>\n    <tr>\n      <th colspan=\"9\" class=\"gt_heading gt_subtitle gt_font_normal gt_bottom_border\" style><code>exibble</code> is an R dataset</th>\n    </tr>\n  </thead>\n  <thead class=\"gt_col_headings\">\n    <tr>\n      <th class=\"gt_col_heading gt_columns_bottom_border gt_left\" rowspan=\"2\" colspan=\"1\">S.L.</th>\n      <th class=\"gt_col_heading gt_columns_bottom_border gt_right\" rowspan=\"2\" colspan=\"1\">num</th>\n      <th class=\"gt_col_heading gt_columns_bottom_border gt_left\" rowspan=\"2\" colspan=\"1\">char</th>\n      <th class=\"gt_col_heading gt_columns_bottom_border gt_center\" rowspan=\"2\" colspan=\"1\">fctr</th>\n      <th class=\"gt_center gt_columns_top_border gt_column_spanner_outer\" rowspan=\"1\" colspan=\"3\">\n        <span class=\"gt_column_spanner\">timing</span>\n      </th>\n      <th class=\"gt_col_heading gt_columns_bottom_border gt_right\" rowspan=\"2\" colspan=\"1\">currency</th>\n      <th class=\"gt_col_heading gt_columns_bottom_border gt_left\" rowspan=\"2\" colspan=\"1\">group</th>\n    </tr>\n    <tr>\n      <th class=\"gt_col_heading gt_columns_bottom_border gt_left\" rowspan=\"1\" colspan=\"1\">date</th>\n      <th class=\"gt_col_heading gt_columns_bottom_border gt_left\" rowspan=\"1\" colspan=\"1\">time</th>\n      <th class=\"gt_col_heading gt_columns_bottom_border gt_left\" rowspan=\"1\" colspan=\"1\">datetime</th>\n    </tr>\n  </thead>\n  <tbody class=\"gt_table_body\">\n    <tr><td class=\"gt_row gt_right gt_stub\">row_1</td>\n<td class=\"gt_row gt_right\">1.111e-01</td>\n<td class=\"gt_row gt_left\">apricot</td>\n<td class=\"gt_row gt_center\">one</td>\n<td class=\"gt_row gt_left\">2015-01-15</td>\n<td class=\"gt_row gt_left\">13:35</td>\n<td class=\"gt_row gt_left\">2018-01-01 02:22</td>\n<td class=\"gt_row gt_right\">49.950</td>\n<td class=\"gt_row gt_left\">grp_a</td></tr>\n    <tr><td class=\"gt_row gt_right gt_stub\">row_2</td>\n<td class=\"gt_row gt_right\">2.222e+00</td>\n<td class=\"gt_row gt_left\">banana</td>\n<td class=\"gt_row gt_center\">two</td>\n<td class=\"gt_row gt_left\">2015-02-15</td>\n<td class=\"gt_row gt_left\">14:40</td>\n<td class=\"gt_row gt_left\">2018-02-02 14:33</td>\n<td class=\"gt_row gt_right\">17.950</td>\n<td class=\"gt_row gt_left\">grp_a</td></tr>\n    <tr><td class=\"gt_row gt_right gt_stub\">row_3</td>\n<td class=\"gt_row gt_right\">3.333e+01</td>\n<td class=\"gt_row gt_left\">coconut</td>\n<td class=\"gt_row gt_center\">three</td>\n<td class=\"gt_row gt_left\">2015-03-15</td>\n<td class=\"gt_row gt_left\">15:45</td>\n<td class=\"gt_row gt_left\">2018-03-03 03:44</td>\n<td class=\"gt_row gt_right\">1.390</td>\n<td class=\"gt_row gt_left\">grp_a</td></tr>\n    <tr><td class=\"gt_row gt_right gt_stub\">row_4</td>\n<td class=\"gt_row gt_right\">4.444e+02</td>\n<td class=\"gt_row gt_left\">durian</td>\n<td class=\"gt_row gt_center\">four</td>\n<td class=\"gt_row gt_left\">2015-04-15</td>\n<td class=\"gt_row gt_left\">16:50</td>\n<td class=\"gt_row gt_left\">2018-04-04 15:55</td>\n<td class=\"gt_row gt_right\">65100.000</td>\n<td class=\"gt_row gt_left\">grp_a</td></tr>\n    <tr><td class=\"gt_row gt_right gt_stub\">row_5</td>\n<td class=\"gt_row gt_right\">5.550e+03</td>\n<td class=\"gt_row gt_left\">NA</td>\n<td class=\"gt_row gt_center\">five</td>\n<td class=\"gt_row gt_left\">2015-05-15</td>\n<td class=\"gt_row gt_left\">17:55</td>\n<td class=\"gt_row gt_left\">2018-05-05 04:00</td>\n<td class=\"gt_row gt_right\">1325.810</td>\n<td class=\"gt_row gt_left\">grp_b</td></tr>\n    <tr><td class=\"gt_row gt_right gt_stub\">row_6</td>\n<td class=\"gt_row gt_right\">NA</td>\n<td class=\"gt_row gt_left\">fig</td>\n<td class=\"gt_row gt_center\">six</td>\n<td class=\"gt_row gt_left\">2015-06-15</td>\n<td class=\"gt_row gt_left\">NA</td>\n<td class=\"gt_row gt_left\">2018-06-06 16:11</td>\n<td class=\"gt_row gt_right\">13.255</td>\n<td class=\"gt_row gt_left\">grp_b</td></tr>\n    <tr><td class=\"gt_row gt_right gt_stub\">row_7</td>\n<td class=\"gt_row gt_right\">7.770e+05</td>\n<td class=\"gt_row gt_left\">grapefruit</td>\n<td class=\"gt_row gt_center\">seven</td>\n<td class=\"gt_row gt_left\">NA</td>\n<td class=\"gt_row gt_left\">19:10</td>\n<td class=\"gt_row gt_left\">2018-07-07 05:22</td>\n<td class=\"gt_row gt_right\">NA</td>\n<td class=\"gt_row gt_left\">grp_b</td></tr>\n    <tr><td class=\"gt_row gt_right gt_stub\">row_8</td>\n<td class=\"gt_row gt_right\">8.880e+06</td>\n<td class=\"gt_row gt_left\">honeydew</td>\n<td class=\"gt_row gt_center\">eight</td>\n<td class=\"gt_row gt_left\">2015-08-15</td>\n<td class=\"gt_row gt_left\">20:20</td>\n<td class=\"gt_row gt_left\">NA</td>\n<td class=\"gt_row gt_right\">0.440</td>\n<td class=\"gt_row gt_left\">grp_b</td></tr>\n  </tbody>\n  <tfoot class=\"gt_sourcenotes\">\n    <tr>\n      <td class=\"gt_sourcenote\" colspan=\"9\">Source note #1</td>\n    </tr>\n    <tr>\n      <td class=\"gt_sourcenote\" colspan=\"9\">Source note #2</td>\n    </tr>\n  </tfoot>\n  \n</table>"

---

    Code
      .
    Output
      [1] "\\captionsetup[table]{labelformat=empty,skip=1pt}\n\\setlength{\\LTpost}{0mm}\n\\begin{longtable}{r|rlclllrl}\n\\caption*{\n{\\large Data listing from \\textbf{exibble}} \\\\ \n{\\small \\texttt{exibble} is an R dataset}\n} \\\\ \n\\toprule\n\\multicolumn{1}{l}{} &  &  &  & \\multicolumn{3}{c}{timing} &  &  \\\\ \n\\cmidrule(lr){5-7}\n\\multicolumn{1}{l}{S.L.} & num & char & fctr & date & time & datetime & currency & group \\\\ \n\\midrule\nrow\\_1 & 1.111e-01 & apricot & one & 2015-01-15 & 13:35 & 2018-01-01 02:22 & 49.950 & grp\\_a \\\\ \nrow\\_2 & 2.222e+00 & banana & two & 2015-02-15 & 14:40 & 2018-02-02 14:33 & 17.950 & grp\\_a \\\\ \nrow\\_3 & 3.333e+01 & coconut & three & 2015-03-15 & 15:45 & 2018-03-03 03:44 & 1.390 & grp\\_a \\\\ \nrow\\_4 & 4.444e+02 & durian & four & 2015-04-15 & 16:50 & 2018-04-04 15:55 & 65100.000 & grp\\_a \\\\ \nrow\\_5 & 5.550e+03 & NA & five & 2015-05-15 & 17:55 & 2018-05-05 04:00 & 1325.810 & grp\\_b \\\\ \nrow\\_6 & NA & fig & six & 2015-06-15 & NA & 2018-06-06 16:11 & 13.255 & grp\\_b \\\\ \nrow\\_7 & 7.770e+05 & grapefruit & seven & NA & 19:10 & 2018-07-07 05:22 & NA & grp\\_b \\\\ \nrow\\_8 & 8.880e+06 & honeydew & eight & 2015-08-15 & 20:20 & NA & 0.440 & grp\\_b \\\\ \n\\bottomrule\n\\end{longtable}\n\\begin{minipage}{\\linewidth}\nSource note \\#1\\\\\nSource note \\#2\\\\\n\\end{minipage}\n"

---

    Code
      .
    Output
      {\rtf\ansi\ansicpg1252{\fonttbl{\f0\froman\fcharset0\fprq0 Courier New;}{\f1\froman\fcharset0\fprq0 Times;}}{\colortbl;\red51\green51\blue51;\red211\green211\blue211;}
      
      \paperw12240\paperh15840\widowctrl\ftnbj\fet0\sectd\linex0
      \lndscpsxn
      \margl1440\margr1440\margt1440\margb1440
      \headery720\footery720\fs20
      
      \trowd\trrh0\trhdr
      
      \pard\plain\uc0\qc\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx9360
      \intbl {\f0\cf1 {\f0\fs20 Data listing from {\b exibble}} {\f0\fs20\i\super } \line {\f0\fs20 {\f1 exibble} is an R dataset} {\f0\fs20\i\super }}\cell
      \pard\plain
      
      \row
      
      \trowd\trrh0\trhdr
      
      \pard\plain\uc0\qc\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx1040
      \intbl {\f0 {\f0\fs20 }}\cell
      \pard\plain
      
      \pard\plain\uc0\qc\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx2080
      \intbl {\f0 {\f0\fs20 }}\cell
      \pard\plain
      
      \pard\plain\uc0\qc\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx3120
      \intbl {\f0 {\f0\fs20 }}\cell
      \pard\plain
      
      \pard\plain\uc0\qc\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx4160
      \intbl {\f0 {\f0\fs20 }}\cell
      \pard\plain
      
      \pard\plain\uc0\qc\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clmgf\cellx5200
      \intbl {\f0 {\f0\fs20 timing}}\cell
      \pard\plain
      
      \pard\plain\uc0\qc\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clmrg\cellx6240
      \intbl {\f0 {\f0\fs20 timing}}\cell
      \pard\plain
      
      \pard\plain\uc0\qc\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clmrg\cellx7280
      \intbl {\f0 {\f0\fs20 timing}}\cell
      \pard\plain
      
      \pard\plain\uc0\qc\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx8320
      \intbl {\f0 {\f0\fs20 }}\cell
      \pard\plain
      
      \pard\plain\uc0\qc\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx9360
      \intbl {\f0 {\f0\fs20 }}\cell
      \pard\plain
      
      \row
      
      \trowd\trrh0\trhdr
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clbrdrb\brdrs\brdrw40\brdrcf2\cellx1040
      \intbl {\f0 {\f0\fs20 S.L.}}\cell
      \pard\plain
      
      \pard\plain\uc0\qr\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clbrdrb\brdrs\brdrw40\brdrcf2\cellx2080
      \intbl {\f0 {\f0\fs20 num}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clbrdrb\brdrs\brdrw40\brdrcf2\cellx3120
      \intbl {\f0 {\f0\fs20 char}}\cell
      \pard\plain
      
      \pard\plain\uc0\qc\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clbrdrb\brdrs\brdrw40\brdrcf2\cellx4160
      \intbl {\f0 {\f0\fs20 fctr}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clbrdrb\brdrs\brdrw40\brdrcf2\cellx5200
      \intbl {\f0 {\f0\fs20 date}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clbrdrb\brdrs\brdrw40\brdrcf2\cellx6240
      \intbl {\f0 {\f0\fs20 time}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clbrdrb\brdrs\brdrw40\brdrcf2\cellx7280
      \intbl {\f0 {\f0\fs20 datetime}}\cell
      \pard\plain
      
      \pard\plain\uc0\qr\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clbrdrb\brdrs\brdrw40\brdrcf2\cellx8320
      \intbl {\f0 {\f0\fs20 currency}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clbrdrb\brdrs\brdrw40\brdrcf2\cellx9360
      \intbl {\f0 {\f0\fs20 group}}\cell
      \pard\plain
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\qr\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx1040
      \intbl {\f0 {\f0\fs20 row_1}}\cell
      \pard\plain
      
      \pard\plain\uc0\qr\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx2080
      \intbl {\f0 {\f0\fs20 1.111e-01}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx3120
      \intbl {\f0 {\f0\fs20 apricot}}\cell
      \pard\plain
      
      \pard\plain\uc0\qc\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx4160
      \intbl {\f0 {\f0\fs20 one}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx5200
      \intbl {\f0 {\f0\fs20 2015-01-15}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx6240
      \intbl {\f0 {\f0\fs20 13:35}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx7280
      \intbl {\f0 {\f0\fs20 2018-01-01 02:22}}\cell
      \pard\plain
      
      \pard\plain\uc0\qr\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx8320
      \intbl {\f0 {\f0\fs20 49.950}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx9360
      \intbl {\f0 {\f0\fs20 grp_a}}\cell
      \pard\plain
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\qr\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx1040
      \intbl {\f0 {\f0\fs20 row_2}}\cell
      \pard\plain
      
      \pard\plain\uc0\qr\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx2080
      \intbl {\f0 {\f0\fs20 2.222e+00}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx3120
      \intbl {\f0 {\f0\fs20 banana}}\cell
      \pard\plain
      
      \pard\plain\uc0\qc\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx4160
      \intbl {\f0 {\f0\fs20 two}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx5200
      \intbl {\f0 {\f0\fs20 2015-02-15}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx6240
      \intbl {\f0 {\f0\fs20 14:40}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx7280
      \intbl {\f0 {\f0\fs20 2018-02-02 14:33}}\cell
      \pard\plain
      
      \pard\plain\uc0\qr\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx8320
      \intbl {\f0 {\f0\fs20 17.950}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx9360
      \intbl {\f0 {\f0\fs20 grp_a}}\cell
      \pard\plain
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\qr\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx1040
      \intbl {\f0 {\f0\fs20 row_3}}\cell
      \pard\plain
      
      \pard\plain\uc0\qr\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx2080
      \intbl {\f0 {\f0\fs20 3.333e+01}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx3120
      \intbl {\f0 {\f0\fs20 coconut}}\cell
      \pard\plain
      
      \pard\plain\uc0\qc\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx4160
      \intbl {\f0 {\f0\fs20 three}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx5200
      \intbl {\f0 {\f0\fs20 2015-03-15}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx6240
      \intbl {\f0 {\f0\fs20 15:45}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx7280
      \intbl {\f0 {\f0\fs20 2018-03-03 03:44}}\cell
      \pard\plain
      
      \pard\plain\uc0\qr\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx8320
      \intbl {\f0 {\f0\fs20 1.390}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx9360
      \intbl {\f0 {\f0\fs20 grp_a}}\cell
      \pard\plain
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\qr\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx1040
      \intbl {\f0 {\f0\fs20 row_4}}\cell
      \pard\plain
      
      \pard\plain\uc0\qr\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx2080
      \intbl {\f0 {\f0\fs20 4.444e+02}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx3120
      \intbl {\f0 {\f0\fs20 durian}}\cell
      \pard\plain
      
      \pard\plain\uc0\qc\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx4160
      \intbl {\f0 {\f0\fs20 four}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx5200
      \intbl {\f0 {\f0\fs20 2015-04-15}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx6240
      \intbl {\f0 {\f0\fs20 16:50}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx7280
      \intbl {\f0 {\f0\fs20 2018-04-04 15:55}}\cell
      \pard\plain
      
      \pard\plain\uc0\qr\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx8320
      \intbl {\f0 {\f0\fs20 65100.000}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx9360
      \intbl {\f0 {\f0\fs20 grp_a}}\cell
      \pard\plain
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\qr\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx1040
      \intbl {\f0 {\f0\fs20 row_5}}\cell
      \pard\plain
      
      \pard\plain\uc0\qr\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx2080
      \intbl {\f0 {\f0\fs20 5.550e+03}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx3120
      \intbl {\f0 {\f0\fs20 NA}}\cell
      \pard\plain
      
      \pard\plain\uc0\qc\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx4160
      \intbl {\f0 {\f0\fs20 five}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx5200
      \intbl {\f0 {\f0\fs20 2015-05-15}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx6240
      \intbl {\f0 {\f0\fs20 17:55}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx7280
      \intbl {\f0 {\f0\fs20 2018-05-05 04:00}}\cell
      \pard\plain
      
      \pard\plain\uc0\qr\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx8320
      \intbl {\f0 {\f0\fs20 1325.810}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx9360
      \intbl {\f0 {\f0\fs20 grp_b}}\cell
      \pard\plain
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\qr\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx1040
      \intbl {\f0 {\f0\fs20 row_6}}\cell
      \pard\plain
      
      \pard\plain\uc0\qr\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx2080
      \intbl {\f0 {\f0\fs20 NA}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx3120
      \intbl {\f0 {\f0\fs20 fig}}\cell
      \pard\plain
      
      \pard\plain\uc0\qc\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx4160
      \intbl {\f0 {\f0\fs20 six}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx5200
      \intbl {\f0 {\f0\fs20 2015-06-15}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx6240
      \intbl {\f0 {\f0\fs20 NA}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx7280
      \intbl {\f0 {\f0\fs20 2018-06-06 16:11}}\cell
      \pard\plain
      
      \pard\plain\uc0\qr\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx8320
      \intbl {\f0 {\f0\fs20 13.255}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx9360
      \intbl {\f0 {\f0\fs20 grp_b}}\cell
      \pard\plain
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\qr\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx1040
      \intbl {\f0 {\f0\fs20 row_7}}\cell
      \pard\plain
      
      \pard\plain\uc0\qr\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx2080
      \intbl {\f0 {\f0\fs20 7.770e+05}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx3120
      \intbl {\f0 {\f0\fs20 grapefruit}}\cell
      \pard\plain
      
      \pard\plain\uc0\qc\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx4160
      \intbl {\f0 {\f0\fs20 seven}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx5200
      \intbl {\f0 {\f0\fs20 NA}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx6240
      \intbl {\f0 {\f0\fs20 19:10}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx7280
      \intbl {\f0 {\f0\fs20 2018-07-07 05:22}}\cell
      \pard\plain
      
      \pard\plain\uc0\qr\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx8320
      \intbl {\f0 {\f0\fs20 NA}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx9360
      \intbl {\f0 {\f0\fs20 grp_b}}\cell
      \pard\plain
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\qr\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx1040
      \intbl {\f0 {\f0\fs20 row_8}}\cell
      \pard\plain
      
      \pard\plain\uc0\qr\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx2080
      \intbl {\f0 {\f0\fs20 8.880e+06}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx3120
      \intbl {\f0 {\f0\fs20 honeydew}}\cell
      \pard\plain
      
      \pard\plain\uc0\qc\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx4160
      \intbl {\f0 {\f0\fs20 eight}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx5200
      \intbl {\f0 {\f0\fs20 2015-08-15}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx6240
      \intbl {\f0 {\f0\fs20 20:20}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx7280
      \intbl {\f0 {\f0\fs20 NA}}\cell
      \pard\plain
      
      \pard\plain\uc0\qr\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx8320
      \intbl {\f0 {\f0\fs20 0.440}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx9360
      \intbl {\f0 {\f0\fs20 grp_b}}\cell
      \pard\plain
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx9360
      \intbl {\f0 {\f0\fs20 Source note #1\line Source note #2}}\cell
      \pard\plain
      
      \row
      
      }

---

    Code
      .
    Output
      [1] "<table class=\"gt_table\">\n  <thead class=\"gt_header\">\n    <tr>\n      <th colspan=\"9\" class=\"gt_heading gt_title gt_font_normal\" style>Data listing from <strong>exibble</strong></th>\n    </tr>\n    <tr>\n      <th colspan=\"9\" class=\"gt_heading gt_subtitle gt_font_normal gt_bottom_border\" style><code>exibble</code> is an R dataset</th>\n    </tr>\n  </thead>\n  <thead class=\"gt_col_headings\">\n    <tr>\n      <th class=\"gt_col_heading gt_columns_bottom_border gt_left\" rowspan=\"2\" colspan=\"1\">S.L.</th>\n      <th class=\"gt_col_heading gt_columns_bottom_border gt_right\" rowspan=\"2\" colspan=\"1\">num</th>\n      <th class=\"gt_col_heading gt_columns_bottom_border gt_left\" rowspan=\"2\" colspan=\"1\">char</th>\n      <th class=\"gt_col_heading gt_columns_bottom_border gt_center\" rowspan=\"2\" colspan=\"1\">fctr</th>\n      <th class=\"gt_center gt_columns_top_border gt_column_spanner_outer\" rowspan=\"1\" colspan=\"3\">\n        <span class=\"gt_column_spanner\">timing</span>\n      </th>\n      <th class=\"gt_col_heading gt_columns_bottom_border gt_right\" rowspan=\"2\" colspan=\"1\">currency</th>\n      <th class=\"gt_col_heading gt_columns_bottom_border gt_left\" rowspan=\"2\" colspan=\"1\">group</th>\n    </tr>\n    <tr>\n      <th class=\"gt_col_heading gt_columns_bottom_border gt_left\" rowspan=\"1\" colspan=\"1\">date</th>\n      <th class=\"gt_col_heading gt_columns_bottom_border gt_left\" rowspan=\"1\" colspan=\"1\">time</th>\n      <th class=\"gt_col_heading gt_columns_bottom_border gt_left\" rowspan=\"1\" colspan=\"1\">datetime</th>\n    </tr>\n  </thead>\n  <tbody class=\"gt_table_body\">\n    <tr><td class=\"gt_row gt_right gt_stub\">row_1</td>\n<td class=\"gt_row gt_right\">1.111e-01</td>\n<td class=\"gt_row gt_left\">apricot</td>\n<td class=\"gt_row gt_center\">one</td>\n<td class=\"gt_row gt_left\">2015-01-15</td>\n<td class=\"gt_row gt_left\">13:35</td>\n<td class=\"gt_row gt_left\">2018-01-01 02:22</td>\n<td class=\"gt_row gt_right\">49.950</td>\n<td class=\"gt_row gt_left\">grp_a</td></tr>\n    <tr><td class=\"gt_row gt_right gt_stub\">row_2</td>\n<td class=\"gt_row gt_right\">2.222e+00</td>\n<td class=\"gt_row gt_left\">banana</td>\n<td class=\"gt_row gt_center\">two</td>\n<td class=\"gt_row gt_left\">2015-02-15</td>\n<td class=\"gt_row gt_left\">14:40</td>\n<td class=\"gt_row gt_left\">2018-02-02 14:33</td>\n<td class=\"gt_row gt_right\">17.950</td>\n<td class=\"gt_row gt_left\">grp_a</td></tr>\n    <tr><td class=\"gt_row gt_right gt_stub\">row_3</td>\n<td class=\"gt_row gt_right\">3.333e+01</td>\n<td class=\"gt_row gt_left\">coconut</td>\n<td class=\"gt_row gt_center\">three</td>\n<td class=\"gt_row gt_left\">2015-03-15</td>\n<td class=\"gt_row gt_left\">15:45</td>\n<td class=\"gt_row gt_left\">2018-03-03 03:44</td>\n<td class=\"gt_row gt_right\">1.390</td>\n<td class=\"gt_row gt_left\">grp_a</td></tr>\n    <tr><td class=\"gt_row gt_right gt_stub\">row_4</td>\n<td class=\"gt_row gt_right\">4.444e+02</td>\n<td class=\"gt_row gt_left\">durian</td>\n<td class=\"gt_row gt_center\">four</td>\n<td class=\"gt_row gt_left\">2015-04-15</td>\n<td class=\"gt_row gt_left\">16:50</td>\n<td class=\"gt_row gt_left\">2018-04-04 15:55</td>\n<td class=\"gt_row gt_right\">65100.000</td>\n<td class=\"gt_row gt_left\">grp_a</td></tr>\n    <tr><td class=\"gt_row gt_right gt_stub\">row_5</td>\n<td class=\"gt_row gt_right\">5.550e+03</td>\n<td class=\"gt_row gt_left\">NA</td>\n<td class=\"gt_row gt_center\">five</td>\n<td class=\"gt_row gt_left\">2015-05-15</td>\n<td class=\"gt_row gt_left\">17:55</td>\n<td class=\"gt_row gt_left\">2018-05-05 04:00</td>\n<td class=\"gt_row gt_right\">1325.810</td>\n<td class=\"gt_row gt_left\">grp_b</td></tr>\n    <tr><td class=\"gt_row gt_right gt_stub\">row_6</td>\n<td class=\"gt_row gt_right\">NA</td>\n<td class=\"gt_row gt_left\">fig</td>\n<td class=\"gt_row gt_center\">six</td>\n<td class=\"gt_row gt_left\">2015-06-15</td>\n<td class=\"gt_row gt_left\">NA</td>\n<td class=\"gt_row gt_left\">2018-06-06 16:11</td>\n<td class=\"gt_row gt_right\">13.255</td>\n<td class=\"gt_row gt_left\">grp_b</td></tr>\n    <tr><td class=\"gt_row gt_right gt_stub\">row_7</td>\n<td class=\"gt_row gt_right\">7.770e+05</td>\n<td class=\"gt_row gt_left\">grapefruit</td>\n<td class=\"gt_row gt_center\">seven</td>\n<td class=\"gt_row gt_left\">NA</td>\n<td class=\"gt_row gt_left\">19:10</td>\n<td class=\"gt_row gt_left\">2018-07-07 05:22</td>\n<td class=\"gt_row gt_right\">NA</td>\n<td class=\"gt_row gt_left\">grp_b</td></tr>\n    <tr><td class=\"gt_row gt_right gt_stub\">row_8</td>\n<td class=\"gt_row gt_right\">8.880e+06</td>\n<td class=\"gt_row gt_left\">honeydew</td>\n<td class=\"gt_row gt_center\">eight</td>\n<td class=\"gt_row gt_left\">2015-08-15</td>\n<td class=\"gt_row gt_left\">20:20</td>\n<td class=\"gt_row gt_left\">NA</td>\n<td class=\"gt_row gt_right\">0.440</td>\n<td class=\"gt_row gt_left\">grp_b</td></tr>\n  </tbody>\n  <tfoot class=\"gt_sourcenotes\">\n    <tr>\n      <td class=\"gt_sourcenote\" colspan=\"9\">Source note #1</td>\n    </tr>\n    <tr>\n      <td class=\"gt_sourcenote\" colspan=\"9\">Source note #2</td>\n    </tr>\n  </tfoot>\n  \n</table>"

---

    Code
      .
    Output
      [1] "\\captionsetup[table]{labelformat=empty,skip=1pt}\n\\setlength{\\LTpost}{0mm}\n\\begin{longtable}{r|rlclllrl}\n\\caption*{\n{\\large Data listing from \\textbf{exibble}} \\\\ \n{\\small \\texttt{exibble} is an R dataset}\n} \\\\ \n\\toprule\n\\multicolumn{1}{l}{} &  &  &  & \\multicolumn{3}{c}{timing} &  &  \\\\ \n\\cmidrule(lr){5-7}\n\\multicolumn{1}{l}{S.L.} & num & char & fctr & date & time & datetime & currency & group \\\\ \n\\midrule\nrow\\_1 & 1.111e-01 & apricot & one & 2015-01-15 & 13:35 & 2018-01-01 02:22 & 49.950 & grp\\_a \\\\ \nrow\\_2 & 2.222e+00 & banana & two & 2015-02-15 & 14:40 & 2018-02-02 14:33 & 17.950 & grp\\_a \\\\ \nrow\\_3 & 3.333e+01 & coconut & three & 2015-03-15 & 15:45 & 2018-03-03 03:44 & 1.390 & grp\\_a \\\\ \nrow\\_4 & 4.444e+02 & durian & four & 2015-04-15 & 16:50 & 2018-04-04 15:55 & 65100.000 & grp\\_a \\\\ \nrow\\_5 & 5.550e+03 & NA & five & 2015-05-15 & 17:55 & 2018-05-05 04:00 & 1325.810 & grp\\_b \\\\ \nrow\\_6 & NA & fig & six & 2015-06-15 & NA & 2018-06-06 16:11 & 13.255 & grp\\_b \\\\ \nrow\\_7 & 7.770e+05 & grapefruit & seven & NA & 19:10 & 2018-07-07 05:22 & NA & grp\\_b \\\\ \nrow\\_8 & 8.880e+06 & honeydew & eight & 2015-08-15 & 20:20 & NA & 0.440 & grp\\_b \\\\ \n\\bottomrule\n\\end{longtable}\n\\begin{minipage}{\\linewidth}\nSource note \\#1\\\\\nSource note \\#2\\\\\n\\end{minipage}\n"

---

    Code
      .
    Output
      {\rtf\ansi\ansicpg1252{\fonttbl{\f0\froman\fcharset0\fprq0 Courier New;}{\f1\froman\fcharset0\fprq0 Times;}}{\colortbl;\red51\green51\blue51;\red211\green211\blue211;}
      
      \paperw12240\paperh15840\widowctrl\ftnbj\fet0\sectd\linex0
      \lndscpsxn
      \margl1440\margr1440\margt1440\margb1440
      \headery720\footery720\fs20
      
      \trowd\trrh0\trhdr
      
      \pard\plain\uc0\qc\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx9360
      \intbl {\f0\cf1 {\f0\fs20 Data listing from {\b exibble}} {\f0\fs20\i\super } \line {\f0\fs20 {\f1 exibble} is an R dataset} {\f0\fs20\i\super }}\cell
      \pard\plain
      
      \row
      
      \trowd\trrh0\trhdr
      
      \pard\plain\uc0\qc\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx1040
      \intbl {\f0 {\f0\fs20 }}\cell
      \pard\plain
      
      \pard\plain\uc0\qc\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx2080
      \intbl {\f0 {\f0\fs20 }}\cell
      \pard\plain
      
      \pard\plain\uc0\qc\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx3120
      \intbl {\f0 {\f0\fs20 }}\cell
      \pard\plain
      
      \pard\plain\uc0\qc\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx4160
      \intbl {\f0 {\f0\fs20 }}\cell
      \pard\plain
      
      \pard\plain\uc0\qc\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clmgf\cellx5200
      \intbl {\f0 {\f0\fs20 timing}}\cell
      \pard\plain
      
      \pard\plain\uc0\qc\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clmrg\cellx6240
      \intbl {\f0 {\f0\fs20 timing}}\cell
      \pard\plain
      
      \pard\plain\uc0\qc\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clmrg\cellx7280
      \intbl {\f0 {\f0\fs20 timing}}\cell
      \pard\plain
      
      \pard\plain\uc0\qc\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx8320
      \intbl {\f0 {\f0\fs20 }}\cell
      \pard\plain
      
      \pard\plain\uc0\qc\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx9360
      \intbl {\f0 {\f0\fs20 }}\cell
      \pard\plain
      
      \row
      
      \trowd\trrh0\trhdr
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clbrdrb\brdrs\brdrw40\brdrcf2\cellx1040
      \intbl {\f0 {\f0\fs20 S.L.}}\cell
      \pard\plain
      
      \pard\plain\uc0\qr\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clbrdrb\brdrs\brdrw40\brdrcf2\cellx2080
      \intbl {\f0 {\f0\fs20 num}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clbrdrb\brdrs\brdrw40\brdrcf2\cellx3120
      \intbl {\f0 {\f0\fs20 char}}\cell
      \pard\plain
      
      \pard\plain\uc0\qc\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clbrdrb\brdrs\brdrw40\brdrcf2\cellx4160
      \intbl {\f0 {\f0\fs20 fctr}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clbrdrb\brdrs\brdrw40\brdrcf2\cellx5200
      \intbl {\f0 {\f0\fs20 date}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clbrdrb\brdrs\brdrw40\brdrcf2\cellx6240
      \intbl {\f0 {\f0\fs20 time}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clbrdrb\brdrs\brdrw40\brdrcf2\cellx7280
      \intbl {\f0 {\f0\fs20 datetime}}\cell
      \pard\plain
      
      \pard\plain\uc0\qr\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clbrdrb\brdrs\brdrw40\brdrcf2\cellx8320
      \intbl {\f0 {\f0\fs20 currency}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clbrdrb\brdrs\brdrw40\brdrcf2\cellx9360
      \intbl {\f0 {\f0\fs20 group}}\cell
      \pard\plain
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\qr\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx1040
      \intbl {\f0 {\f0\fs20 row_1}}\cell
      \pard\plain
      
      \pard\plain\uc0\qr\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx2080
      \intbl {\f0 {\f0\fs20 1.111e-01}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx3120
      \intbl {\f0 {\f0\fs20 apricot}}\cell
      \pard\plain
      
      \pard\plain\uc0\qc\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx4160
      \intbl {\f0 {\f0\fs20 one}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx5200
      \intbl {\f0 {\f0\fs20 2015-01-15}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx6240
      \intbl {\f0 {\f0\fs20 13:35}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx7280
      \intbl {\f0 {\f0\fs20 2018-01-01 02:22}}\cell
      \pard\plain
      
      \pard\plain\uc0\qr\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx8320
      \intbl {\f0 {\f0\fs20 49.950}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx9360
      \intbl {\f0 {\f0\fs20 grp_a}}\cell
      \pard\plain
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\qr\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx1040
      \intbl {\f0 {\f0\fs20 row_2}}\cell
      \pard\plain
      
      \pard\plain\uc0\qr\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx2080
      \intbl {\f0 {\f0\fs20 2.222e+00}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx3120
      \intbl {\f0 {\f0\fs20 banana}}\cell
      \pard\plain
      
      \pard\plain\uc0\qc\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx4160
      \intbl {\f0 {\f0\fs20 two}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx5200
      \intbl {\f0 {\f0\fs20 2015-02-15}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx6240
      \intbl {\f0 {\f0\fs20 14:40}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx7280
      \intbl {\f0 {\f0\fs20 2018-02-02 14:33}}\cell
      \pard\plain
      
      \pard\plain\uc0\qr\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx8320
      \intbl {\f0 {\f0\fs20 17.950}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx9360
      \intbl {\f0 {\f0\fs20 grp_a}}\cell
      \pard\plain
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\qr\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx1040
      \intbl {\f0 {\f0\fs20 row_3}}\cell
      \pard\plain
      
      \pard\plain\uc0\qr\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx2080
      \intbl {\f0 {\f0\fs20 3.333e+01}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx3120
      \intbl {\f0 {\f0\fs20 coconut}}\cell
      \pard\plain
      
      \pard\plain\uc0\qc\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx4160
      \intbl {\f0 {\f0\fs20 three}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx5200
      \intbl {\f0 {\f0\fs20 2015-03-15}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx6240
      \intbl {\f0 {\f0\fs20 15:45}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx7280
      \intbl {\f0 {\f0\fs20 2018-03-03 03:44}}\cell
      \pard\plain
      
      \pard\plain\uc0\qr\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx8320
      \intbl {\f0 {\f0\fs20 1.390}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx9360
      \intbl {\f0 {\f0\fs20 grp_a}}\cell
      \pard\plain
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\qr\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx1040
      \intbl {\f0 {\f0\fs20 row_4}}\cell
      \pard\plain
      
      \pard\plain\uc0\qr\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx2080
      \intbl {\f0 {\f0\fs20 4.444e+02}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx3120
      \intbl {\f0 {\f0\fs20 durian}}\cell
      \pard\plain
      
      \pard\plain\uc0\qc\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx4160
      \intbl {\f0 {\f0\fs20 four}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx5200
      \intbl {\f0 {\f0\fs20 2015-04-15}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx6240
      \intbl {\f0 {\f0\fs20 16:50}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx7280
      \intbl {\f0 {\f0\fs20 2018-04-04 15:55}}\cell
      \pard\plain
      
      \pard\plain\uc0\qr\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx8320
      \intbl {\f0 {\f0\fs20 65100.000}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx9360
      \intbl {\f0 {\f0\fs20 grp_a}}\cell
      \pard\plain
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\qr\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx1040
      \intbl {\f0 {\f0\fs20 row_5}}\cell
      \pard\plain
      
      \pard\plain\uc0\qr\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx2080
      \intbl {\f0 {\f0\fs20 5.550e+03}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx3120
      \intbl {\f0 {\f0\fs20 NA}}\cell
      \pard\plain
      
      \pard\plain\uc0\qc\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx4160
      \intbl {\f0 {\f0\fs20 five}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx5200
      \intbl {\f0 {\f0\fs20 2015-05-15}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx6240
      \intbl {\f0 {\f0\fs20 17:55}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx7280
      \intbl {\f0 {\f0\fs20 2018-05-05 04:00}}\cell
      \pard\plain
      
      \pard\plain\uc0\qr\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx8320
      \intbl {\f0 {\f0\fs20 1325.810}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx9360
      \intbl {\f0 {\f0\fs20 grp_b}}\cell
      \pard\plain
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\qr\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx1040
      \intbl {\f0 {\f0\fs20 row_6}}\cell
      \pard\plain
      
      \pard\plain\uc0\qr\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx2080
      \intbl {\f0 {\f0\fs20 NA}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx3120
      \intbl {\f0 {\f0\fs20 fig}}\cell
      \pard\plain
      
      \pard\plain\uc0\qc\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx4160
      \intbl {\f0 {\f0\fs20 six}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx5200
      \intbl {\f0 {\f0\fs20 2015-06-15}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx6240
      \intbl {\f0 {\f0\fs20 NA}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx7280
      \intbl {\f0 {\f0\fs20 2018-06-06 16:11}}\cell
      \pard\plain
      
      \pard\plain\uc0\qr\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx8320
      \intbl {\f0 {\f0\fs20 13.255}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx9360
      \intbl {\f0 {\f0\fs20 grp_b}}\cell
      \pard\plain
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\qr\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx1040
      \intbl {\f0 {\f0\fs20 row_7}}\cell
      \pard\plain
      
      \pard\plain\uc0\qr\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx2080
      \intbl {\f0 {\f0\fs20 7.770e+05}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx3120
      \intbl {\f0 {\f0\fs20 grapefruit}}\cell
      \pard\plain
      
      \pard\plain\uc0\qc\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx4160
      \intbl {\f0 {\f0\fs20 seven}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx5200
      \intbl {\f0 {\f0\fs20 NA}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx6240
      \intbl {\f0 {\f0\fs20 19:10}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx7280
      \intbl {\f0 {\f0\fs20 2018-07-07 05:22}}\cell
      \pard\plain
      
      \pard\plain\uc0\qr\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx8320
      \intbl {\f0 {\f0\fs20 NA}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx9360
      \intbl {\f0 {\f0\fs20 grp_b}}\cell
      \pard\plain
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\qr\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx1040
      \intbl {\f0 {\f0\fs20 row_8}}\cell
      \pard\plain
      
      \pard\plain\uc0\qr\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx2080
      \intbl {\f0 {\f0\fs20 8.880e+06}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx3120
      \intbl {\f0 {\f0\fs20 honeydew}}\cell
      \pard\plain
      
      \pard\plain\uc0\qc\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx4160
      \intbl {\f0 {\f0\fs20 eight}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx5200
      \intbl {\f0 {\f0\fs20 2015-08-15}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx6240
      \intbl {\f0 {\f0\fs20 20:20}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx7280
      \intbl {\f0 {\f0\fs20 NA}}\cell
      \pard\plain
      
      \pard\plain\uc0\qr\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx8320
      \intbl {\f0 {\f0\fs20 0.440}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx9360
      \intbl {\f0 {\f0\fs20 grp_b}}\cell
      \pard\plain
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx9360
      \intbl {\f0 {\f0\fs20 Source note #1\line Source note #2}}\cell
      \pard\plain
      
      \row
      
      }

---

    Code
      .
    Output
      [1] "<table class=\"gt_table\">\n  <thead class=\"gt_header\">\n    <tr>\n      <th colspan=\"8\" class=\"gt_heading gt_title gt_font_normal\" style>Data listing from <strong>exibble</strong></th>\n    </tr>\n    <tr>\n      <th colspan=\"8\" class=\"gt_heading gt_subtitle gt_font_normal gt_bottom_border\" style><code>exibble</code> is an R dataset</th>\n    </tr>\n  </thead>\n  <thead class=\"gt_col_headings\">\n    <tr>\n      <th class=\"gt_col_heading gt_columns_bottom_border gt_left\" rowspan=\"2\" colspan=\"1\">S.L.</th>\n      <th class=\"gt_col_heading gt_columns_bottom_border gt_right\" rowspan=\"2\" colspan=\"1\">num</th>\n      <th class=\"gt_col_heading gt_columns_bottom_border gt_left\" rowspan=\"2\" colspan=\"1\">char</th>\n      <th class=\"gt_col_heading gt_columns_bottom_border gt_center\" rowspan=\"2\" colspan=\"1\">fctr</th>\n      <th class=\"gt_center gt_columns_top_border gt_column_spanner_outer\" rowspan=\"1\" colspan=\"3\">\n        <span class=\"gt_column_spanner\">timing</span>\n      </th>\n      <th class=\"gt_col_heading gt_columns_bottom_border gt_right\" rowspan=\"2\" colspan=\"1\">currency</th>\n    </tr>\n    <tr>\n      <th class=\"gt_col_heading gt_columns_bottom_border gt_left\" rowspan=\"1\" colspan=\"1\">date</th>\n      <th class=\"gt_col_heading gt_columns_bottom_border gt_left\" rowspan=\"1\" colspan=\"1\">time</th>\n      <th class=\"gt_col_heading gt_columns_bottom_border gt_left\" rowspan=\"1\" colspan=\"1\">datetime</th>\n    </tr>\n  </thead>\n  <tbody class=\"gt_table_body\">\n    <tr class=\"gt_group_heading_row\">\n      <td colspan=\"8\" class=\"gt_group_heading\">grp_a</td>\n    </tr>\n    <tr class=\"gt_row_group_first\"><td class=\"gt_row gt_right gt_stub\">row_1</td>\n<td class=\"gt_row gt_right\">1.111e-01</td>\n<td class=\"gt_row gt_left\">apricot</td>\n<td class=\"gt_row gt_center\">one</td>\n<td class=\"gt_row gt_left\">2015-01-15</td>\n<td class=\"gt_row gt_left\">13:35</td>\n<td class=\"gt_row gt_left\">2018-01-01 02:22</td>\n<td class=\"gt_row gt_right\">49.950</td></tr>\n    <tr><td class=\"gt_row gt_right gt_stub\">row_2</td>\n<td class=\"gt_row gt_right\">2.222e+00</td>\n<td class=\"gt_row gt_left\">banana</td>\n<td class=\"gt_row gt_center\">two</td>\n<td class=\"gt_row gt_left\">2015-02-15</td>\n<td class=\"gt_row gt_left\">14:40</td>\n<td class=\"gt_row gt_left\">2018-02-02 14:33</td>\n<td class=\"gt_row gt_right\">17.950</td></tr>\n    <tr><td class=\"gt_row gt_right gt_stub\">row_3</td>\n<td class=\"gt_row gt_right\">3.333e+01</td>\n<td class=\"gt_row gt_left\">coconut</td>\n<td class=\"gt_row gt_center\">three</td>\n<td class=\"gt_row gt_left\">2015-03-15</td>\n<td class=\"gt_row gt_left\">15:45</td>\n<td class=\"gt_row gt_left\">2018-03-03 03:44</td>\n<td class=\"gt_row gt_right\">1.390</td></tr>\n    <tr><td class=\"gt_row gt_right gt_stub\">row_4</td>\n<td class=\"gt_row gt_right\">4.444e+02</td>\n<td class=\"gt_row gt_left\">durian</td>\n<td class=\"gt_row gt_center\">four</td>\n<td class=\"gt_row gt_left\">2015-04-15</td>\n<td class=\"gt_row gt_left\">16:50</td>\n<td class=\"gt_row gt_left\">2018-04-04 15:55</td>\n<td class=\"gt_row gt_right\">65100.000</td></tr>\n    <tr class=\"gt_group_heading_row\">\n      <td colspan=\"8\" class=\"gt_group_heading\">grp_b</td>\n    </tr>\n    <tr class=\"gt_row_group_first\"><td class=\"gt_row gt_right gt_stub\">row_5</td>\n<td class=\"gt_row gt_right\">5.550e+03</td>\n<td class=\"gt_row gt_left\">NA</td>\n<td class=\"gt_row gt_center\">five</td>\n<td class=\"gt_row gt_left\">2015-05-15</td>\n<td class=\"gt_row gt_left\">17:55</td>\n<td class=\"gt_row gt_left\">2018-05-05 04:00</td>\n<td class=\"gt_row gt_right\">1325.810</td></tr>\n    <tr><td class=\"gt_row gt_right gt_stub\">row_6</td>\n<td class=\"gt_row gt_right\">NA</td>\n<td class=\"gt_row gt_left\">fig</td>\n<td class=\"gt_row gt_center\">six</td>\n<td class=\"gt_row gt_left\">2015-06-15</td>\n<td class=\"gt_row gt_left\">NA</td>\n<td class=\"gt_row gt_left\">2018-06-06 16:11</td>\n<td class=\"gt_row gt_right\">13.255</td></tr>\n    <tr><td class=\"gt_row gt_right gt_stub\">row_7</td>\n<td class=\"gt_row gt_right\">7.770e+05</td>\n<td class=\"gt_row gt_left\">grapefruit</td>\n<td class=\"gt_row gt_center\">seven</td>\n<td class=\"gt_row gt_left\">NA</td>\n<td class=\"gt_row gt_left\">19:10</td>\n<td class=\"gt_row gt_left\">2018-07-07 05:22</td>\n<td class=\"gt_row gt_right\">NA</td></tr>\n    <tr><td class=\"gt_row gt_right gt_stub\">row_8</td>\n<td class=\"gt_row gt_right\">8.880e+06</td>\n<td class=\"gt_row gt_left\">honeydew</td>\n<td class=\"gt_row gt_center\">eight</td>\n<td class=\"gt_row gt_left\">2015-08-15</td>\n<td class=\"gt_row gt_left\">20:20</td>\n<td class=\"gt_row gt_left\">NA</td>\n<td class=\"gt_row gt_right\">0.440</td></tr>\n  </tbody>\n  <tfoot class=\"gt_sourcenotes\">\n    <tr>\n      <td class=\"gt_sourcenote\" colspan=\"8\">Source note #1</td>\n    </tr>\n    <tr>\n      <td class=\"gt_sourcenote\" colspan=\"8\">Source note #2</td>\n    </tr>\n  </tfoot>\n  \n</table>"

---

    Code
      .
    Output
      [1] "\\captionsetup[table]{labelformat=empty,skip=1pt}\n\\setlength{\\LTpost}{0mm}\n\\begin{longtable}{r|rlclllr}\n\\caption*{\n{\\large Data listing from \\textbf{exibble}} \\\\ \n{\\small \\texttt{exibble} is an R dataset}\n} \\\\ \n\\toprule\n\\multicolumn{1}{l}{} &  &  &  & \\multicolumn{3}{c}{timing} &  \\\\ \n\\cmidrule(lr){5-7}\n\\multicolumn{1}{l}{S.L.} & num & char & fctr & date & time & datetime & currency \\\\ \n\\midrule\n\\multicolumn{1}{l}{grp\\_a} \\\\ \n\\midrule\nrow\\_1 & 1.111e-01 & apricot & one & 2015-01-15 & 13:35 & 2018-01-01 02:22 & 49.950 \\\\ \nrow\\_2 & 2.222e+00 & banana & two & 2015-02-15 & 14:40 & 2018-02-02 14:33 & 17.950 \\\\ \nrow\\_3 & 3.333e+01 & coconut & three & 2015-03-15 & 15:45 & 2018-03-03 03:44 & 1.390 \\\\ \nrow\\_4 & 4.444e+02 & durian & four & 2015-04-15 & 16:50 & 2018-04-04 15:55 & 65100.000 \\\\ \n\\midrule\n\\multicolumn{1}{l}{grp\\_b} \\\\ \n\\midrule\nrow\\_5 & 5.550e+03 & NA & five & 2015-05-15 & 17:55 & 2018-05-05 04:00 & 1325.810 \\\\ \nrow\\_6 & NA & fig & six & 2015-06-15 & NA & 2018-06-06 16:11 & 13.255 \\\\ \nrow\\_7 & 7.770e+05 & grapefruit & seven & NA & 19:10 & 2018-07-07 05:22 & NA \\\\ \nrow\\_8 & 8.880e+06 & honeydew & eight & 2015-08-15 & 20:20 & NA & 0.440 \\\\ \n\\bottomrule\n\\end{longtable}\n\\begin{minipage}{\\linewidth}\nSource note \\#1\\\\\nSource note \\#2\\\\\n\\end{minipage}\n"

---

    Code
      .
    Output
      {\rtf\ansi\ansicpg1252{\fonttbl{\f0\froman\fcharset0\fprq0 Courier New;}{\f1\froman\fcharset0\fprq0 Times;}}{\colortbl;\red51\green51\blue51;\red211\green211\blue211;}
      
      \paperw12240\paperh15840\widowctrl\ftnbj\fet0\sectd\linex0
      \lndscpsxn
      \margl1440\margr1440\margt1440\margb1440
      \headery720\footery720\fs20
      
      \trowd\trrh0\trhdr
      
      \pard\plain\uc0\qc\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx9360
      \intbl {\f0\cf1 {\f0\fs20 Data listing from {\b exibble}} {\f0\fs20\i\super } \line {\f0\fs20 {\f1 exibble} is an R dataset} {\f0\fs20\i\super }}\cell
      \pard\plain
      
      \row
      
      \trowd\trrh0\trhdr
      
      \pard\plain\uc0\qc\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx1170
      \intbl {\f0 {\f0\fs20 }}\cell
      \pard\plain
      
      \pard\plain\uc0\qc\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx2340
      \intbl {\f0 {\f0\fs20 }}\cell
      \pard\plain
      
      \pard\plain\uc0\qc\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx3510
      \intbl {\f0 {\f0\fs20 }}\cell
      \pard\plain
      
      \pard\plain\uc0\qc\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx4680
      \intbl {\f0 {\f0\fs20 }}\cell
      \pard\plain
      
      \pard\plain\uc0\qc\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clmgf\cellx5850
      \intbl {\f0 {\f0\fs20 timing}}\cell
      \pard\plain
      
      \pard\plain\uc0\qc\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clmrg\cellx7020
      \intbl {\f0 {\f0\fs20 timing}}\cell
      \pard\plain
      
      \pard\plain\uc0\qc\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clmrg\cellx8190
      \intbl {\f0 {\f0\fs20 timing}}\cell
      \pard\plain
      
      \pard\plain\uc0\qc\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx9360
      \intbl {\f0 {\f0\fs20 }}\cell
      \pard\plain
      
      \row
      
      \trowd\trrh0\trhdr
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clbrdrb\brdrs\brdrw40\brdrcf2\cellx1170
      \intbl {\f0 {\f0\fs20 S.L.}}\cell
      \pard\plain
      
      \pard\plain\uc0\qr\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clbrdrb\brdrs\brdrw40\brdrcf2\cellx2340
      \intbl {\f0 {\f0\fs20 num}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clbrdrb\brdrs\brdrw40\brdrcf2\cellx3510
      \intbl {\f0 {\f0\fs20 char}}\cell
      \pard\plain
      
      \pard\plain\uc0\qc\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clbrdrb\brdrs\brdrw40\brdrcf2\cellx4680
      \intbl {\f0 {\f0\fs20 fctr}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clbrdrb\brdrs\brdrw40\brdrcf2\cellx5850
      \intbl {\f0 {\f0\fs20 date}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clbrdrb\brdrs\brdrw40\brdrcf2\cellx7020
      \intbl {\f0 {\f0\fs20 time}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clbrdrb\brdrs\brdrw40\brdrcf2\cellx8190
      \intbl {\f0 {\f0\fs20 datetime}}\cell
      \pard\plain
      
      \pard\plain\uc0\qr\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clbrdrb\brdrs\brdrw40\brdrcf2\cellx9360
      \intbl {\f0 {\f0\fs20 currency}}\cell
      \pard\plain
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx9360
      \intbl {\f0\fs20 grp_a}\cell
      \pard\plain
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\qr\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx1170
      \intbl {\f0 {\f0\fs20 row_1}}\cell
      \pard\plain
      
      \pard\plain\uc0\qr\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx2340
      \intbl {\f0 {\f0\fs20 1.111e-01}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx3510
      \intbl {\f0 {\f0\fs20 apricot}}\cell
      \pard\plain
      
      \pard\plain\uc0\qc\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx4680
      \intbl {\f0 {\f0\fs20 one}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx5850
      \intbl {\f0 {\f0\fs20 2015-01-15}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx7020
      \intbl {\f0 {\f0\fs20 13:35}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx8190
      \intbl {\f0 {\f0\fs20 2018-01-01 02:22}}\cell
      \pard\plain
      
      \pard\plain\uc0\qr\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx9360
      \intbl {\f0 {\f0\fs20 49.950}}\cell
      \pard\plain
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\qr\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx1170
      \intbl {\f0 {\f0\fs20 row_2}}\cell
      \pard\plain
      
      \pard\plain\uc0\qr\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx2340
      \intbl {\f0 {\f0\fs20 2.222e+00}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx3510
      \intbl {\f0 {\f0\fs20 banana}}\cell
      \pard\plain
      
      \pard\plain\uc0\qc\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx4680
      \intbl {\f0 {\f0\fs20 two}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx5850
      \intbl {\f0 {\f0\fs20 2015-02-15}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx7020
      \intbl {\f0 {\f0\fs20 14:40}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx8190
      \intbl {\f0 {\f0\fs20 2018-02-02 14:33}}\cell
      \pard\plain
      
      \pard\plain\uc0\qr\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx9360
      \intbl {\f0 {\f0\fs20 17.950}}\cell
      \pard\plain
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\qr\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx1170
      \intbl {\f0 {\f0\fs20 row_3}}\cell
      \pard\plain
      
      \pard\plain\uc0\qr\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx2340
      \intbl {\f0 {\f0\fs20 3.333e+01}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx3510
      \intbl {\f0 {\f0\fs20 coconut}}\cell
      \pard\plain
      
      \pard\plain\uc0\qc\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx4680
      \intbl {\f0 {\f0\fs20 three}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx5850
      \intbl {\f0 {\f0\fs20 2015-03-15}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx7020
      \intbl {\f0 {\f0\fs20 15:45}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx8190
      \intbl {\f0 {\f0\fs20 2018-03-03 03:44}}\cell
      \pard\plain
      
      \pard\plain\uc0\qr\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx9360
      \intbl {\f0 {\f0\fs20 1.390}}\cell
      \pard\plain
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\qr\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx1170
      \intbl {\f0 {\f0\fs20 row_4}}\cell
      \pard\plain
      
      \pard\plain\uc0\qr\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx2340
      \intbl {\f0 {\f0\fs20 4.444e+02}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx3510
      \intbl {\f0 {\f0\fs20 durian}}\cell
      \pard\plain
      
      \pard\plain\uc0\qc\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx4680
      \intbl {\f0 {\f0\fs20 four}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx5850
      \intbl {\f0 {\f0\fs20 2015-04-15}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx7020
      \intbl {\f0 {\f0\fs20 16:50}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx8190
      \intbl {\f0 {\f0\fs20 2018-04-04 15:55}}\cell
      \pard\plain
      
      \pard\plain\uc0\qr\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx9360
      \intbl {\f0 {\f0\fs20 65100.000}}\cell
      \pard\plain
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx9360
      \intbl {\f0\fs20 grp_b}\cell
      \pard\plain
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\qr\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx1170
      \intbl {\f0 {\f0\fs20 row_5}}\cell
      \pard\plain
      
      \pard\plain\uc0\qr\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx2340
      \intbl {\f0 {\f0\fs20 5.550e+03}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx3510
      \intbl {\f0 {\f0\fs20 NA}}\cell
      \pard\plain
      
      \pard\plain\uc0\qc\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx4680
      \intbl {\f0 {\f0\fs20 five}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx5850
      \intbl {\f0 {\f0\fs20 2015-05-15}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx7020
      \intbl {\f0 {\f0\fs20 17:55}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx8190
      \intbl {\f0 {\f0\fs20 2018-05-05 04:00}}\cell
      \pard\plain
      
      \pard\plain\uc0\qr\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx9360
      \intbl {\f0 {\f0\fs20 1325.810}}\cell
      \pard\plain
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\qr\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx1170
      \intbl {\f0 {\f0\fs20 row_6}}\cell
      \pard\plain
      
      \pard\plain\uc0\qr\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx2340
      \intbl {\f0 {\f0\fs20 NA}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx3510
      \intbl {\f0 {\f0\fs20 fig}}\cell
      \pard\plain
      
      \pard\plain\uc0\qc\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx4680
      \intbl {\f0 {\f0\fs20 six}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx5850
      \intbl {\f0 {\f0\fs20 2015-06-15}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx7020
      \intbl {\f0 {\f0\fs20 NA}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx8190
      \intbl {\f0 {\f0\fs20 2018-06-06 16:11}}\cell
      \pard\plain
      
      \pard\plain\uc0\qr\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx9360
      \intbl {\f0 {\f0\fs20 13.255}}\cell
      \pard\plain
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\qr\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx1170
      \intbl {\f0 {\f0\fs20 row_7}}\cell
      \pard\plain
      
      \pard\plain\uc0\qr\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx2340
      \intbl {\f0 {\f0\fs20 7.770e+05}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx3510
      \intbl {\f0 {\f0\fs20 grapefruit}}\cell
      \pard\plain
      
      \pard\plain\uc0\qc\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx4680
      \intbl {\f0 {\f0\fs20 seven}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx5850
      \intbl {\f0 {\f0\fs20 NA}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx7020
      \intbl {\f0 {\f0\fs20 19:10}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx8190
      \intbl {\f0 {\f0\fs20 2018-07-07 05:22}}\cell
      \pard\plain
      
      \pard\plain\uc0\qr\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx9360
      \intbl {\f0 {\f0\fs20 NA}}\cell
      \pard\plain
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\qr\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx1170
      \intbl {\f0 {\f0\fs20 row_8}}\cell
      \pard\plain
      
      \pard\plain\uc0\qr\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx2340
      \intbl {\f0 {\f0\fs20 8.880e+06}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx3510
      \intbl {\f0 {\f0\fs20 honeydew}}\cell
      \pard\plain
      
      \pard\plain\uc0\qc\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx4680
      \intbl {\f0 {\f0\fs20 eight}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx5850
      \intbl {\f0 {\f0\fs20 2015-08-15}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx7020
      \intbl {\f0 {\f0\fs20 20:20}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx8190
      \intbl {\f0 {\f0\fs20 NA}}\cell
      \pard\plain
      
      \pard\plain\uc0\qr\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx9360
      \intbl {\f0 {\f0\fs20 0.440}}\cell
      \pard\plain
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx9360
      \intbl {\f0 {\f0\fs20 Source note #1\line Source note #2}}\cell
      \pard\plain
      
      \row
      
      }

---

    Code
      .
    Output
      [1] "<table class=\"gt_table\">\n  <thead class=\"gt_header\">\n    <tr>\n      <th colspan=\"9\" class=\"gt_heading gt_title gt_font_normal\" style>Data listing from <strong>exibble</strong></th>\n    </tr>\n    <tr>\n      <th colspan=\"9\" class=\"gt_heading gt_subtitle gt_font_normal gt_bottom_border\" style><code>exibble</code> is an R dataset</th>\n    </tr>\n  </thead>\n  <thead class=\"gt_col_headings\">\n    <tr>\n      <th class=\"gt_col_heading gt_columns_bottom_border gt_left\" rowspan=\"2\" colspan=\"2\">S.L.</th>\n      <th class=\"gt_col_heading gt_columns_bottom_border gt_right\" rowspan=\"2\" colspan=\"1\">num</th>\n      <th class=\"gt_col_heading gt_columns_bottom_border gt_left\" rowspan=\"2\" colspan=\"1\">char</th>\n      <th class=\"gt_col_heading gt_columns_bottom_border gt_center\" rowspan=\"2\" colspan=\"1\">fctr</th>\n      <th class=\"gt_center gt_columns_top_border gt_column_spanner_outer\" rowspan=\"1\" colspan=\"3\">\n        <span class=\"gt_column_spanner\">timing</span>\n      </th>\n      <th class=\"gt_col_heading gt_columns_bottom_border gt_right\" rowspan=\"2\" colspan=\"1\">currency</th>\n    </tr>\n    <tr>\n      <th class=\"gt_col_heading gt_columns_bottom_border gt_left\" rowspan=\"1\" colspan=\"1\">date</th>\n      <th class=\"gt_col_heading gt_columns_bottom_border gt_left\" rowspan=\"1\" colspan=\"1\">time</th>\n      <th class=\"gt_col_heading gt_columns_bottom_border gt_left\" rowspan=\"1\" colspan=\"1\">datetime</th>\n    </tr>\n  </thead>\n  <tbody class=\"gt_table_body\">\n    <tr class=\"gt_row_group_first\"><td rowspan=\"4\" class=\"gt_row gt_right gt_stub_row_group\">grp_a</td>\n<td class=\"gt_row gt_right gt_stub\">row_1</td>\n<td class=\"gt_row gt_right\">1.111e-01</td>\n<td class=\"gt_row gt_left\">apricot</td>\n<td class=\"gt_row gt_center\">one</td>\n<td class=\"gt_row gt_left\">2015-01-15</td>\n<td class=\"gt_row gt_left\">13:35</td>\n<td class=\"gt_row gt_left\">2018-01-01 02:22</td>\n<td class=\"gt_row gt_right\">49.950</td></tr>\n    <tr><td class=\"gt_row gt_right gt_stub\">row_2</td>\n<td class=\"gt_row gt_right\">2.222e+00</td>\n<td class=\"gt_row gt_left\">banana</td>\n<td class=\"gt_row gt_center\">two</td>\n<td class=\"gt_row gt_left\">2015-02-15</td>\n<td class=\"gt_row gt_left\">14:40</td>\n<td class=\"gt_row gt_left\">2018-02-02 14:33</td>\n<td class=\"gt_row gt_right\">17.950</td></tr>\n    <tr><td class=\"gt_row gt_right gt_stub\">row_3</td>\n<td class=\"gt_row gt_right\">3.333e+01</td>\n<td class=\"gt_row gt_left\">coconut</td>\n<td class=\"gt_row gt_center\">three</td>\n<td class=\"gt_row gt_left\">2015-03-15</td>\n<td class=\"gt_row gt_left\">15:45</td>\n<td class=\"gt_row gt_left\">2018-03-03 03:44</td>\n<td class=\"gt_row gt_right\">1.390</td></tr>\n    <tr><td class=\"gt_row gt_right gt_stub\">row_4</td>\n<td class=\"gt_row gt_right\">4.444e+02</td>\n<td class=\"gt_row gt_left\">durian</td>\n<td class=\"gt_row gt_center\">four</td>\n<td class=\"gt_row gt_left\">2015-04-15</td>\n<td class=\"gt_row gt_left\">16:50</td>\n<td class=\"gt_row gt_left\">2018-04-04 15:55</td>\n<td class=\"gt_row gt_right\">65100.000</td></tr>\n    <tr class=\"gt_row_group_first\"><td rowspan=\"4\" class=\"gt_row gt_right gt_stub_row_group\">grp_b</td>\n<td class=\"gt_row gt_right gt_stub\">row_5</td>\n<td class=\"gt_row gt_right\">5.550e+03</td>\n<td class=\"gt_row gt_left\">NA</td>\n<td class=\"gt_row gt_center\">five</td>\n<td class=\"gt_row gt_left\">2015-05-15</td>\n<td class=\"gt_row gt_left\">17:55</td>\n<td class=\"gt_row gt_left\">2018-05-05 04:00</td>\n<td class=\"gt_row gt_right\">1325.810</td></tr>\n    <tr><td class=\"gt_row gt_right gt_stub\">row_6</td>\n<td class=\"gt_row gt_right\">NA</td>\n<td class=\"gt_row gt_left\">fig</td>\n<td class=\"gt_row gt_center\">six</td>\n<td class=\"gt_row gt_left\">2015-06-15</td>\n<td class=\"gt_row gt_left\">NA</td>\n<td class=\"gt_row gt_left\">2018-06-06 16:11</td>\n<td class=\"gt_row gt_right\">13.255</td></tr>\n    <tr><td class=\"gt_row gt_right gt_stub\">row_7</td>\n<td class=\"gt_row gt_right\">7.770e+05</td>\n<td class=\"gt_row gt_left\">grapefruit</td>\n<td class=\"gt_row gt_center\">seven</td>\n<td class=\"gt_row gt_left\">NA</td>\n<td class=\"gt_row gt_left\">19:10</td>\n<td class=\"gt_row gt_left\">2018-07-07 05:22</td>\n<td class=\"gt_row gt_right\">NA</td></tr>\n    <tr><td class=\"gt_row gt_right gt_stub\">row_8</td>\n<td class=\"gt_row gt_right\">8.880e+06</td>\n<td class=\"gt_row gt_left\">honeydew</td>\n<td class=\"gt_row gt_center\">eight</td>\n<td class=\"gt_row gt_left\">2015-08-15</td>\n<td class=\"gt_row gt_left\">20:20</td>\n<td class=\"gt_row gt_left\">NA</td>\n<td class=\"gt_row gt_right\">0.440</td></tr>\n  </tbody>\n  <tfoot class=\"gt_sourcenotes\">\n    <tr>\n      <td class=\"gt_sourcenote\" colspan=\"9\">Source note #1</td>\n    </tr>\n    <tr>\n      <td class=\"gt_sourcenote\" colspan=\"9\">Source note #2</td>\n    </tr>\n  </tfoot>\n  \n</table>"

---

    Code
      .
    Output
      [1] "\\captionsetup[table]{labelformat=empty,skip=1pt}\n\\setlength{\\LTpost}{0mm}\n\\begin{longtable}{r|r|rlclllr}\n\\caption*{\n{\\large Data listing from \\textbf{exibble}} \\\\ \n{\\small \\texttt{exibble} is an R dataset}\n} \\\\ \n\\toprule\n\\multicolumn{2}{l}{} &  &  &  & \\multicolumn{3}{c}{timing} &  \\\\ \n\\cmidrule(lr){6-8}\n\\multicolumn{2}{l}{S.L.} & num & char & fctr & date & time & datetime & currency \\\\ \n\\midrule\ngrp\\_a & row\\_1 & 1.111e-01 & apricot & one & 2015-01-15 & 13:35 & 2018-01-01 02:22 & 49.950 \\\\ \n & row\\_2 & 2.222e+00 & banana & two & 2015-02-15 & 14:40 & 2018-02-02 14:33 & 17.950 \\\\ \n & row\\_3 & 3.333e+01 & coconut & three & 2015-03-15 & 15:45 & 2018-03-03 03:44 & 1.390 \\\\ \n & row\\_4 & 4.444e+02 & durian & four & 2015-04-15 & 16:50 & 2018-04-04 15:55 & 65100.000 \\\\ \n\\midrule\ngrp\\_b & row\\_5 & 5.550e+03 & NA & five & 2015-05-15 & 17:55 & 2018-05-05 04:00 & 1325.810 \\\\ \n & row\\_6 & NA & fig & six & 2015-06-15 & NA & 2018-06-06 16:11 & 13.255 \\\\ \n & row\\_7 & 7.770e+05 & grapefruit & seven & NA & 19:10 & 2018-07-07 05:22 & NA \\\\ \n & row\\_8 & 8.880e+06 & honeydew & eight & 2015-08-15 & 20:20 & NA & 0.440 \\\\ \n\\bottomrule\n\\end{longtable}\n\\begin{minipage}{\\linewidth}\nSource note \\#1\\\\\nSource note \\#2\\\\\n\\end{minipage}\n"

---

    Code
      .
    Output
      {\rtf\ansi\ansicpg1252{\fonttbl{\f0\froman\fcharset0\fprq0 Courier New;}{\f1\froman\fcharset0\fprq0 Times;}}{\colortbl;\red51\green51\blue51;\red211\green211\blue211;}
      
      \paperw12240\paperh15840\widowctrl\ftnbj\fet0\sectd\linex0
      \lndscpsxn
      \margl1440\margr1440\margt1440\margb1440
      \headery720\footery720\fs20
      
      \trowd\trrh0\trhdr
      
      \pard\plain\uc0\qc\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx9360
      \intbl {\f0\cf1 {\f0\fs20 Data listing from {\b exibble}} {\f0\fs20\i\super } \line {\f0\fs20 {\f1 exibble} is an R dataset} {\f0\fs20\i\super }}\cell
      \pard\plain
      
      \row
      
      \trowd\trrh0\trhdr
      
      \pard\plain\uc0\qc\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx1040
      \intbl {\f0 {\f0\fs20 }}\cell
      \pard\plain
      
      \pard\plain\uc0\qc\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx2080
      \intbl {\f0 {\f0\fs20 }}\cell
      \pard\plain
      
      \pard\plain\uc0\qc\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx3120
      \intbl {\f0 {\f0\fs20 }}\cell
      \pard\plain
      
      \pard\plain\uc0\qc\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx4160
      \intbl {\f0 {\f0\fs20 }}\cell
      \pard\plain
      
      \pard\plain\uc0\qc\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx5200
      \intbl {\f0 {\f0\fs20 }}\cell
      \pard\plain
      
      \pard\plain\uc0\qc\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clmgf\cellx6240
      \intbl {\f0 {\f0\fs20 timing}}\cell
      \pard\plain
      
      \pard\plain\uc0\qc\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clmrg\cellx7280
      \intbl {\f0 {\f0\fs20 timing}}\cell
      \pard\plain
      
      \pard\plain\uc0\qc\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clmrg\cellx8320
      \intbl {\f0 {\f0\fs20 timing}}\cell
      \pard\plain
      
      \pard\plain\uc0\qc\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx9360
      \intbl {\f0 {\f0\fs20 }}\cell
      \pard\plain
      
      \row
      
      \trowd\trrh0\trhdr
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clbrdrb\brdrs\brdrw40\brdrcf2\clmgf\cellx1040
      \intbl {\f0 {\f0\fs20 S.L.}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clbrdrb\brdrs\brdrw40\brdrcf2\clmrg\cellx2080
      \intbl {\f0 {\f0\fs20 }}\cell
      \pard\plain
      
      \pard\plain\uc0\qr\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clbrdrb\brdrs\brdrw40\brdrcf2\cellx3120
      \intbl {\f0 {\f0\fs20 num}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clbrdrb\brdrs\brdrw40\brdrcf2\cellx4160
      \intbl {\f0 {\f0\fs20 char}}\cell
      \pard\plain
      
      \pard\plain\uc0\qc\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clbrdrb\brdrs\brdrw40\brdrcf2\cellx5200
      \intbl {\f0 {\f0\fs20 fctr}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clbrdrb\brdrs\brdrw40\brdrcf2\cellx6240
      \intbl {\f0 {\f0\fs20 date}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clbrdrb\brdrs\brdrw40\brdrcf2\cellx7280
      \intbl {\f0 {\f0\fs20 time}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clbrdrb\brdrs\brdrw40\brdrcf2\cellx8320
      \intbl {\f0 {\f0\fs20 datetime}}\cell
      \pard\plain
      
      \pard\plain\uc0\qr\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clbrdrb\brdrs\brdrw40\brdrcf2\cellx9360
      \intbl {\f0 {\f0\fs20 currency}}\cell
      \pard\plain
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\qr\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx1040
      \intbl {\f0 {\f0\fs20 grp_a}}\cell
      \pard\plain
      
      \pard\plain\uc0\qr\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx2080
      \intbl {\f0 {\f0\fs20 row_1}}\cell
      \pard\plain
      
      \pard\plain\uc0\qr\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx3120
      \intbl {\f0 {\f0\fs20 1.111e-01}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx4160
      \intbl {\f0 {\f0\fs20 apricot}}\cell
      \pard\plain
      
      \pard\plain\uc0\qc\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx5200
      \intbl {\f0 {\f0\fs20 one}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx6240
      \intbl {\f0 {\f0\fs20 2015-01-15}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx7280
      \intbl {\f0 {\f0\fs20 13:35}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx8320
      \intbl {\f0 {\f0\fs20 2018-01-01 02:22}}\cell
      \pard\plain
      
      \pard\plain\uc0\qr\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx9360
      \intbl {\f0 {\f0\fs20 49.950}}\cell
      \pard\plain
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\qr\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx1040
      \intbl {\f0 {\f0\fs20 }}\cell
      \pard\plain
      
      \pard\plain\uc0\qr\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx2080
      \intbl {\f0 {\f0\fs20 row_2}}\cell
      \pard\plain
      
      \pard\plain\uc0\qr\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx3120
      \intbl {\f0 {\f0\fs20 2.222e+00}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx4160
      \intbl {\f0 {\f0\fs20 banana}}\cell
      \pard\plain
      
      \pard\plain\uc0\qc\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx5200
      \intbl {\f0 {\f0\fs20 two}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx6240
      \intbl {\f0 {\f0\fs20 2015-02-15}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx7280
      \intbl {\f0 {\f0\fs20 14:40}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx8320
      \intbl {\f0 {\f0\fs20 2018-02-02 14:33}}\cell
      \pard\plain
      
      \pard\plain\uc0\qr\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx9360
      \intbl {\f0 {\f0\fs20 17.950}}\cell
      \pard\plain
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\qr\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx1040
      \intbl {\f0 {\f0\fs20 }}\cell
      \pard\plain
      
      \pard\plain\uc0\qr\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx2080
      \intbl {\f0 {\f0\fs20 row_3}}\cell
      \pard\plain
      
      \pard\plain\uc0\qr\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx3120
      \intbl {\f0 {\f0\fs20 3.333e+01}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx4160
      \intbl {\f0 {\f0\fs20 coconut}}\cell
      \pard\plain
      
      \pard\plain\uc0\qc\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx5200
      \intbl {\f0 {\f0\fs20 three}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx6240
      \intbl {\f0 {\f0\fs20 2015-03-15}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx7280
      \intbl {\f0 {\f0\fs20 15:45}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx8320
      \intbl {\f0 {\f0\fs20 2018-03-03 03:44}}\cell
      \pard\plain
      
      \pard\plain\uc0\qr\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx9360
      \intbl {\f0 {\f0\fs20 1.390}}\cell
      \pard\plain
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\qr\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx1040
      \intbl {\f0 {\f0\fs20 }}\cell
      \pard\plain
      
      \pard\plain\uc0\qr\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx2080
      \intbl {\f0 {\f0\fs20 row_4}}\cell
      \pard\plain
      
      \pard\plain\uc0\qr\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx3120
      \intbl {\f0 {\f0\fs20 4.444e+02}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx4160
      \intbl {\f0 {\f0\fs20 durian}}\cell
      \pard\plain
      
      \pard\plain\uc0\qc\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx5200
      \intbl {\f0 {\f0\fs20 four}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx6240
      \intbl {\f0 {\f0\fs20 2015-04-15}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx7280
      \intbl {\f0 {\f0\fs20 16:50}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx8320
      \intbl {\f0 {\f0\fs20 2018-04-04 15:55}}\cell
      \pard\plain
      
      \pard\plain\uc0\qr\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx9360
      \intbl {\f0 {\f0\fs20 65100.000}}\cell
      \pard\plain
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\qr\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx1040
      \intbl {\f0 {\f0\fs20 grp_b}}\cell
      \pard\plain
      
      \pard\plain\uc0\qr\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx2080
      \intbl {\f0 {\f0\fs20 row_5}}\cell
      \pard\plain
      
      \pard\plain\uc0\qr\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx3120
      \intbl {\f0 {\f0\fs20 5.550e+03}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx4160
      \intbl {\f0 {\f0\fs20 NA}}\cell
      \pard\plain
      
      \pard\plain\uc0\qc\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx5200
      \intbl {\f0 {\f0\fs20 five}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx6240
      \intbl {\f0 {\f0\fs20 2015-05-15}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx7280
      \intbl {\f0 {\f0\fs20 17:55}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx8320
      \intbl {\f0 {\f0\fs20 2018-05-05 04:00}}\cell
      \pard\plain
      
      \pard\plain\uc0\qr\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx9360
      \intbl {\f0 {\f0\fs20 1325.810}}\cell
      \pard\plain
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\qr\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx1040
      \intbl {\f0 {\f0\fs20 }}\cell
      \pard\plain
      
      \pard\plain\uc0\qr\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx2080
      \intbl {\f0 {\f0\fs20 row_6}}\cell
      \pard\plain
      
      \pard\plain\uc0\qr\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx3120
      \intbl {\f0 {\f0\fs20 NA}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx4160
      \intbl {\f0 {\f0\fs20 fig}}\cell
      \pard\plain
      
      \pard\plain\uc0\qc\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx5200
      \intbl {\f0 {\f0\fs20 six}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx6240
      \intbl {\f0 {\f0\fs20 2015-06-15}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx7280
      \intbl {\f0 {\f0\fs20 NA}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx8320
      \intbl {\f0 {\f0\fs20 2018-06-06 16:11}}\cell
      \pard\plain
      
      \pard\plain\uc0\qr\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx9360
      \intbl {\f0 {\f0\fs20 13.255}}\cell
      \pard\plain
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\qr\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx1040
      \intbl {\f0 {\f0\fs20 }}\cell
      \pard\plain
      
      \pard\plain\uc0\qr\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx2080
      \intbl {\f0 {\f0\fs20 row_7}}\cell
      \pard\plain
      
      \pard\plain\uc0\qr\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx3120
      \intbl {\f0 {\f0\fs20 7.770e+05}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx4160
      \intbl {\f0 {\f0\fs20 grapefruit}}\cell
      \pard\plain
      
      \pard\plain\uc0\qc\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx5200
      \intbl {\f0 {\f0\fs20 seven}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx6240
      \intbl {\f0 {\f0\fs20 NA}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx7280
      \intbl {\f0 {\f0\fs20 19:10}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx8320
      \intbl {\f0 {\f0\fs20 2018-07-07 05:22}}\cell
      \pard\plain
      
      \pard\plain\uc0\qr\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx9360
      \intbl {\f0 {\f0\fs20 NA}}\cell
      \pard\plain
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\qr\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx1040
      \intbl {\f0 {\f0\fs20 }}\cell
      \pard\plain
      
      \pard\plain\uc0\qr\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx2080
      \intbl {\f0 {\f0\fs20 row_8}}\cell
      \pard\plain
      
      \pard\plain\uc0\qr\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx3120
      \intbl {\f0 {\f0\fs20 8.880e+06}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx4160
      \intbl {\f0 {\f0\fs20 honeydew}}\cell
      \pard\plain
      
      \pard\plain\uc0\qc\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx5200
      \intbl {\f0 {\f0\fs20 eight}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx6240
      \intbl {\f0 {\f0\fs20 2015-08-15}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx7280
      \intbl {\f0 {\f0\fs20 20:20}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx8320
      \intbl {\f0 {\f0\fs20 NA}}\cell
      \pard\plain
      
      \pard\plain\uc0\qr\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx9360
      \intbl {\f0 {\f0\fs20 0.440}}\cell
      \pard\plain
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx9360
      \intbl {\f0 {\f0\fs20 Source note #1\line Source note #2}}\cell
      \pard\plain
      
      \row
      
      }

---

    Code
      .
    Output
      [1] "<table class=\"gt_table\">\n  <thead class=\"gt_header\">\n    <tr>\n      <th colspan=\"10\" class=\"gt_heading gt_title gt_font_normal\" style>Data listing from <strong>exibble</strong></th>\n    </tr>\n    <tr>\n      <th colspan=\"10\" class=\"gt_heading gt_subtitle gt_font_normal gt_bottom_border\" style><code>exibble</code> is an R dataset</th>\n    </tr>\n  </thead>\n  <thead class=\"gt_col_headings\">\n    <tr>\n      <th class=\"gt_col_heading gt_columns_bottom_border gt_left\" rowspan=\"2\" colspan=\"1\">S.L.</th>\n      <th class=\"gt_col_heading gt_columns_bottom_border gt_right\" rowspan=\"2\" colspan=\"1\">num</th>\n      <th class=\"gt_col_heading gt_columns_bottom_border gt_left\" rowspan=\"2\" colspan=\"1\">char</th>\n      <th class=\"gt_col_heading gt_columns_bottom_border gt_center\" rowspan=\"2\" colspan=\"1\">fctr</th>\n      <th class=\"gt_center gt_columns_top_border gt_column_spanner_outer\" rowspan=\"1\" colspan=\"3\">\n        <span class=\"gt_column_spanner\">timing</span>\n      </th>\n      <th class=\"gt_col_heading gt_columns_bottom_border gt_right\" rowspan=\"2\" colspan=\"1\">currency</th>\n      <th class=\"gt_col_heading gt_columns_bottom_border gt_left\" rowspan=\"2\" colspan=\"1\">row</th>\n      <th class=\"gt_col_heading gt_columns_bottom_border gt_left\" rowspan=\"2\" colspan=\"1\">group</th>\n    </tr>\n    <tr>\n      <th class=\"gt_col_heading gt_columns_bottom_border gt_left\" rowspan=\"1\" colspan=\"1\">date</th>\n      <th class=\"gt_col_heading gt_columns_bottom_border gt_left\" rowspan=\"1\" colspan=\"1\">time</th>\n      <th class=\"gt_col_heading gt_columns_bottom_border gt_left\" rowspan=\"1\" colspan=\"1\">datetime</th>\n    </tr>\n  </thead>\n  <tbody class=\"gt_table_body\">\n    <tr><td class=\"gt_row gt_right gt_stub\"></td>\n<td class=\"gt_row gt_right\">1.111e-01</td>\n<td class=\"gt_row gt_left\">apricot</td>\n<td class=\"gt_row gt_center\">one</td>\n<td class=\"gt_row gt_left\">2015-01-15</td>\n<td class=\"gt_row gt_left\">13:35</td>\n<td class=\"gt_row gt_left\">2018-01-01 02:22</td>\n<td class=\"gt_row gt_right\">49.950</td>\n<td class=\"gt_row gt_left\">row_1</td>\n<td class=\"gt_row gt_left\">grp_a</td></tr>\n    <tr><td class=\"gt_row gt_right gt_stub\"></td>\n<td class=\"gt_row gt_right\">2.222e+00</td>\n<td class=\"gt_row gt_left\">banana</td>\n<td class=\"gt_row gt_center\">two</td>\n<td class=\"gt_row gt_left\">2015-02-15</td>\n<td class=\"gt_row gt_left\">14:40</td>\n<td class=\"gt_row gt_left\">2018-02-02 14:33</td>\n<td class=\"gt_row gt_right\">17.950</td>\n<td class=\"gt_row gt_left\">row_2</td>\n<td class=\"gt_row gt_left\">grp_a</td></tr>\n    <tr><td class=\"gt_row gt_right gt_stub\"></td>\n<td class=\"gt_row gt_right\">3.333e+01</td>\n<td class=\"gt_row gt_left\">coconut</td>\n<td class=\"gt_row gt_center\">three</td>\n<td class=\"gt_row gt_left\">2015-03-15</td>\n<td class=\"gt_row gt_left\">15:45</td>\n<td class=\"gt_row gt_left\">2018-03-03 03:44</td>\n<td class=\"gt_row gt_right\">1.390</td>\n<td class=\"gt_row gt_left\">row_3</td>\n<td class=\"gt_row gt_left\">grp_a</td></tr>\n    <tr><td class=\"gt_row gt_right gt_stub\"></td>\n<td class=\"gt_row gt_right\">4.444e+02</td>\n<td class=\"gt_row gt_left\">durian</td>\n<td class=\"gt_row gt_center\">four</td>\n<td class=\"gt_row gt_left\">2015-04-15</td>\n<td class=\"gt_row gt_left\">16:50</td>\n<td class=\"gt_row gt_left\">2018-04-04 15:55</td>\n<td class=\"gt_row gt_right\">65100.000</td>\n<td class=\"gt_row gt_left\">row_4</td>\n<td class=\"gt_row gt_left\">grp_a</td></tr>\n    <tr><td class=\"gt_row gt_right gt_stub\"></td>\n<td class=\"gt_row gt_right\">5.550e+03</td>\n<td class=\"gt_row gt_left\">NA</td>\n<td class=\"gt_row gt_center\">five</td>\n<td class=\"gt_row gt_left\">2015-05-15</td>\n<td class=\"gt_row gt_left\">17:55</td>\n<td class=\"gt_row gt_left\">2018-05-05 04:00</td>\n<td class=\"gt_row gt_right\">1325.810</td>\n<td class=\"gt_row gt_left\">row_5</td>\n<td class=\"gt_row gt_left\">grp_b</td></tr>\n    <tr><td class=\"gt_row gt_right gt_stub\"></td>\n<td class=\"gt_row gt_right\">NA</td>\n<td class=\"gt_row gt_left\">fig</td>\n<td class=\"gt_row gt_center\">six</td>\n<td class=\"gt_row gt_left\">2015-06-15</td>\n<td class=\"gt_row gt_left\">NA</td>\n<td class=\"gt_row gt_left\">2018-06-06 16:11</td>\n<td class=\"gt_row gt_right\">13.255</td>\n<td class=\"gt_row gt_left\">row_6</td>\n<td class=\"gt_row gt_left\">grp_b</td></tr>\n    <tr><td class=\"gt_row gt_right gt_stub\"></td>\n<td class=\"gt_row gt_right\">7.770e+05</td>\n<td class=\"gt_row gt_left\">grapefruit</td>\n<td class=\"gt_row gt_center\">seven</td>\n<td class=\"gt_row gt_left\">NA</td>\n<td class=\"gt_row gt_left\">19:10</td>\n<td class=\"gt_row gt_left\">2018-07-07 05:22</td>\n<td class=\"gt_row gt_right\">NA</td>\n<td class=\"gt_row gt_left\">row_7</td>\n<td class=\"gt_row gt_left\">grp_b</td></tr>\n    <tr><td class=\"gt_row gt_right gt_stub\"></td>\n<td class=\"gt_row gt_right\">8.880e+06</td>\n<td class=\"gt_row gt_left\">honeydew</td>\n<td class=\"gt_row gt_center\">eight</td>\n<td class=\"gt_row gt_left\">2015-08-15</td>\n<td class=\"gt_row gt_left\">20:20</td>\n<td class=\"gt_row gt_left\">NA</td>\n<td class=\"gt_row gt_right\">0.440</td>\n<td class=\"gt_row gt_left\">row_8</td>\n<td class=\"gt_row gt_left\">grp_b</td></tr>\n    <tr><td class=\"gt_row gt_right gt_stub gt_grand_summary_row gt_first_grand_summary_row\">min</td>\n<td class=\"gt_row gt_right gt_grand_summary_row gt_first_grand_summary_row\">0.11</td>\n<td class=\"gt_row gt_left gt_grand_summary_row gt_first_grand_summary_row\">&mdash;</td>\n<td class=\"gt_row gt_center gt_grand_summary_row gt_first_grand_summary_row\">&mdash;</td>\n<td class=\"gt_row gt_left gt_grand_summary_row gt_first_grand_summary_row\">&mdash;</td>\n<td class=\"gt_row gt_left gt_grand_summary_row gt_first_grand_summary_row\">&mdash;</td>\n<td class=\"gt_row gt_left gt_grand_summary_row gt_first_grand_summary_row\">&mdash;</td>\n<td class=\"gt_row gt_right gt_grand_summary_row gt_first_grand_summary_row\">0.44</td>\n<td class=\"gt_row gt_left gt_grand_summary_row gt_first_grand_summary_row\">&mdash;</td>\n<td class=\"gt_row gt_left gt_grand_summary_row gt_first_grand_summary_row\">&mdash;</td></tr>\n    <tr><td class=\"gt_row gt_right gt_stub gt_grand_summary_row\">max</td>\n<td class=\"gt_row gt_right gt_grand_summary_row\">8880000.00</td>\n<td class=\"gt_row gt_left gt_grand_summary_row\">&mdash;</td>\n<td class=\"gt_row gt_center gt_grand_summary_row\">&mdash;</td>\n<td class=\"gt_row gt_left gt_grand_summary_row\">&mdash;</td>\n<td class=\"gt_row gt_left gt_grand_summary_row\">&mdash;</td>\n<td class=\"gt_row gt_left gt_grand_summary_row\">&mdash;</td>\n<td class=\"gt_row gt_right gt_grand_summary_row\">65100.00</td>\n<td class=\"gt_row gt_left gt_grand_summary_row\">&mdash;</td>\n<td class=\"gt_row gt_left gt_grand_summary_row\">&mdash;</td></tr>\n    <tr><td class=\"gt_row gt_right gt_stub gt_grand_summary_row gt_last_summary_row\">avg</td>\n<td class=\"gt_row gt_right gt_grand_summary_row gt_last_summary_row\">1380432.87</td>\n<td class=\"gt_row gt_left gt_grand_summary_row gt_last_summary_row\">&mdash;</td>\n<td class=\"gt_row gt_center gt_grand_summary_row gt_last_summary_row\">&mdash;</td>\n<td class=\"gt_row gt_left gt_grand_summary_row gt_last_summary_row\">&mdash;</td>\n<td class=\"gt_row gt_left gt_grand_summary_row gt_last_summary_row\">&mdash;</td>\n<td class=\"gt_row gt_left gt_grand_summary_row gt_last_summary_row\">&mdash;</td>\n<td class=\"gt_row gt_right gt_grand_summary_row gt_last_summary_row\">9501.26</td>\n<td class=\"gt_row gt_left gt_grand_summary_row gt_last_summary_row\">&mdash;</td>\n<td class=\"gt_row gt_left gt_grand_summary_row gt_last_summary_row\">&mdash;</td></tr>\n  </tbody>\n  <tfoot class=\"gt_sourcenotes\">\n    <tr>\n      <td class=\"gt_sourcenote\" colspan=\"10\">Source note #1</td>\n    </tr>\n    <tr>\n      <td class=\"gt_sourcenote\" colspan=\"10\">Source note #2</td>\n    </tr>\n  </tfoot>\n  \n</table>"

---

    Code
      .
    Output
      [1] "\\captionsetup[table]{labelformat=empty,skip=1pt}\n\\setlength{\\LTpost}{0mm}\n\\begin{longtable}{r|rlclllrll}\n\\caption*{\n{\\large Data listing from \\textbf{exibble}} \\\\ \n{\\small \\texttt{exibble} is an R dataset}\n} \\\\ \n\\toprule\n\\multicolumn{1}{l}{} &  &  &  & \\multicolumn{3}{c}{timing} &  &  &  \\\\ \n\\cmidrule(lr){5-7}\n\\multicolumn{1}{l}{S.L.} & num & char & fctr & date & time & datetime & currency & row & group \\\\ \n\\midrule\n & 1.111e-01 & apricot & one & 2015-01-15 & 13:35 & 2018-01-01 02:22 & 49.950 & row\\_1 & grp\\_a \\\\ \n & 2.222e+00 & banana & two & 2015-02-15 & 14:40 & 2018-02-02 14:33 & 17.950 & row\\_2 & grp\\_a \\\\ \n & 3.333e+01 & coconut & three & 2015-03-15 & 15:45 & 2018-03-03 03:44 & 1.390 & row\\_3 & grp\\_a \\\\ \n & 4.444e+02 & durian & four & 2015-04-15 & 16:50 & 2018-04-04 15:55 & 65100.000 & row\\_4 & grp\\_a \\\\ \n & 5.550e+03 & NA & five & 2015-05-15 & 17:55 & 2018-05-05 04:00 & 1325.810 & row\\_5 & grp\\_b \\\\ \n & NA & fig & six & 2015-06-15 & NA & 2018-06-06 16:11 & 13.255 & row\\_6 & grp\\_b \\\\ \n & 7.770e+05 & grapefruit & seven & NA & 19:10 & 2018-07-07 05:22 & NA & row\\_7 & grp\\_b \\\\ \n & 8.880e+06 & honeydew & eight & 2015-08-15 & 20:20 & NA & 0.440 & row\\_8 & grp\\_b \\\\ \n\\midrule \n\\midrule \nmin & $0.11$ & — & — & — & — & — & $0.44$ & — & — \\\\ \nmax & $8880000.00$ & — & — & — & — & — & $65100.00$ & — & — \\\\ \navg & $1380432.87$ & — & — & — & — & — & $9501.26$ & — & — \\\\ \n\\bottomrule\n\\end{longtable}\n\\begin{minipage}{\\linewidth}\nSource note \\#1\\\\\nSource note \\#2\\\\\n\\end{minipage}\n"

---

    Code
      .
    Output
      {\rtf\ansi\ansicpg1252{\fonttbl{\f0\froman\fcharset0\fprq0 Courier New;}{\f1\froman\fcharset0\fprq0 Times;}}{\colortbl;\red51\green51\blue51;\red211\green211\blue211;}
      
      \paperw12240\paperh15840\widowctrl\ftnbj\fet0\sectd\linex0
      \lndscpsxn
      \margl1440\margr1440\margt1440\margb1440
      \headery720\footery720\fs20
      
      \trowd\trrh0\trhdr
      
      \pard\plain\uc0\qc\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx9360
      \intbl {\f0\cf1 {\f0\fs20 Data listing from {\b exibble}} {\f0\fs20\i\super } \line {\f0\fs20 {\f1 exibble} is an R dataset} {\f0\fs20\i\super }}\cell
      \pard\plain
      
      \row
      
      \trowd\trrh0\trhdr
      
      \pard\plain\uc0\qc\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx936
      \intbl {\f0 {\f0\fs20 }}\cell
      \pard\plain
      
      \pard\plain\uc0\qc\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx1872
      \intbl {\f0 {\f0\fs20 }}\cell
      \pard\plain
      
      \pard\plain\uc0\qc\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx2808
      \intbl {\f0 {\f0\fs20 }}\cell
      \pard\plain
      
      \pard\plain\uc0\qc\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx3744
      \intbl {\f0 {\f0\fs20 }}\cell
      \pard\plain
      
      \pard\plain\uc0\qc\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clmgf\cellx4680
      \intbl {\f0 {\f0\fs20 timing}}\cell
      \pard\plain
      
      \pard\plain\uc0\qc\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clmrg\cellx5616
      \intbl {\f0 {\f0\fs20 timing}}\cell
      \pard\plain
      
      \pard\plain\uc0\qc\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clmrg\cellx6552
      \intbl {\f0 {\f0\fs20 timing}}\cell
      \pard\plain
      
      \pard\plain\uc0\qc\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx7488
      \intbl {\f0 {\f0\fs20 }}\cell
      \pard\plain
      
      \pard\plain\uc0\qc\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx8424
      \intbl {\f0 {\f0\fs20 }}\cell
      \pard\plain
      
      \pard\plain\uc0\qc\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx9360
      \intbl {\f0 {\f0\fs20 }}\cell
      \pard\plain
      
      \row
      
      \trowd\trrh0\trhdr
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clbrdrb\brdrs\brdrw40\brdrcf2\cellx936
      \intbl {\f0 {\f0\fs20 S.L.}}\cell
      \pard\plain
      
      \pard\plain\uc0\qr\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clbrdrb\brdrs\brdrw40\brdrcf2\cellx1872
      \intbl {\f0 {\f0\fs20 num}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clbrdrb\brdrs\brdrw40\brdrcf2\cellx2808
      \intbl {\f0 {\f0\fs20 char}}\cell
      \pard\plain
      
      \pard\plain\uc0\qc\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clbrdrb\brdrs\brdrw40\brdrcf2\cellx3744
      \intbl {\f0 {\f0\fs20 fctr}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clbrdrb\brdrs\brdrw40\brdrcf2\cellx4680
      \intbl {\f0 {\f0\fs20 date}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clbrdrb\brdrs\brdrw40\brdrcf2\cellx5616
      \intbl {\f0 {\f0\fs20 time}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clbrdrb\brdrs\brdrw40\brdrcf2\cellx6552
      \intbl {\f0 {\f0\fs20 datetime}}\cell
      \pard\plain
      
      \pard\plain\uc0\qr\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clbrdrb\brdrs\brdrw40\brdrcf2\cellx7488
      \intbl {\f0 {\f0\fs20 currency}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clbrdrb\brdrs\brdrw40\brdrcf2\cellx8424
      \intbl {\f0 {\f0\fs20 row}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clbrdrb\brdrs\brdrw40\brdrcf2\cellx9360
      \intbl {\f0 {\f0\fs20 group}}\cell
      \pard\plain
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\qr\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx936
      \intbl {\f0 {\f0\fs20 }}\cell
      \pard\plain
      
      \pard\plain\uc0\qr\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx1872
      \intbl {\f0 {\f0\fs20 1.111e-01}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx2808
      \intbl {\f0 {\f0\fs20 apricot}}\cell
      \pard\plain
      
      \pard\plain\uc0\qc\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx3744
      \intbl {\f0 {\f0\fs20 one}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx4680
      \intbl {\f0 {\f0\fs20 2015-01-15}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx5616
      \intbl {\f0 {\f0\fs20 13:35}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx6552
      \intbl {\f0 {\f0\fs20 2018-01-01 02:22}}\cell
      \pard\plain
      
      \pard\plain\uc0\qr\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx7488
      \intbl {\f0 {\f0\fs20 49.950}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx8424
      \intbl {\f0 {\f0\fs20 row_1}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx9360
      \intbl {\f0 {\f0\fs20 grp_a}}\cell
      \pard\plain
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\qr\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx936
      \intbl {\f0 {\f0\fs20 }}\cell
      \pard\plain
      
      \pard\plain\uc0\qr\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx1872
      \intbl {\f0 {\f0\fs20 2.222e+00}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx2808
      \intbl {\f0 {\f0\fs20 banana}}\cell
      \pard\plain
      
      \pard\plain\uc0\qc\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx3744
      \intbl {\f0 {\f0\fs20 two}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx4680
      \intbl {\f0 {\f0\fs20 2015-02-15}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx5616
      \intbl {\f0 {\f0\fs20 14:40}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx6552
      \intbl {\f0 {\f0\fs20 2018-02-02 14:33}}\cell
      \pard\plain
      
      \pard\plain\uc0\qr\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx7488
      \intbl {\f0 {\f0\fs20 17.950}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx8424
      \intbl {\f0 {\f0\fs20 row_2}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx9360
      \intbl {\f0 {\f0\fs20 grp_a}}\cell
      \pard\plain
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\qr\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx936
      \intbl {\f0 {\f0\fs20 }}\cell
      \pard\plain
      
      \pard\plain\uc0\qr\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx1872
      \intbl {\f0 {\f0\fs20 3.333e+01}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx2808
      \intbl {\f0 {\f0\fs20 coconut}}\cell
      \pard\plain
      
      \pard\plain\uc0\qc\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx3744
      \intbl {\f0 {\f0\fs20 three}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx4680
      \intbl {\f0 {\f0\fs20 2015-03-15}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx5616
      \intbl {\f0 {\f0\fs20 15:45}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx6552
      \intbl {\f0 {\f0\fs20 2018-03-03 03:44}}\cell
      \pard\plain
      
      \pard\plain\uc0\qr\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx7488
      \intbl {\f0 {\f0\fs20 1.390}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx8424
      \intbl {\f0 {\f0\fs20 row_3}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx9360
      \intbl {\f0 {\f0\fs20 grp_a}}\cell
      \pard\plain
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\qr\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx936
      \intbl {\f0 {\f0\fs20 }}\cell
      \pard\plain
      
      \pard\plain\uc0\qr\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx1872
      \intbl {\f0 {\f0\fs20 4.444e+02}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx2808
      \intbl {\f0 {\f0\fs20 durian}}\cell
      \pard\plain
      
      \pard\plain\uc0\qc\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx3744
      \intbl {\f0 {\f0\fs20 four}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx4680
      \intbl {\f0 {\f0\fs20 2015-04-15}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx5616
      \intbl {\f0 {\f0\fs20 16:50}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx6552
      \intbl {\f0 {\f0\fs20 2018-04-04 15:55}}\cell
      \pard\plain
      
      \pard\plain\uc0\qr\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx7488
      \intbl {\f0 {\f0\fs20 65100.000}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx8424
      \intbl {\f0 {\f0\fs20 row_4}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx9360
      \intbl {\f0 {\f0\fs20 grp_a}}\cell
      \pard\plain
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\qr\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx936
      \intbl {\f0 {\f0\fs20 }}\cell
      \pard\plain
      
      \pard\plain\uc0\qr\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx1872
      \intbl {\f0 {\f0\fs20 5.550e+03}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx2808
      \intbl {\f0 {\f0\fs20 NA}}\cell
      \pard\plain
      
      \pard\plain\uc0\qc\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx3744
      \intbl {\f0 {\f0\fs20 five}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx4680
      \intbl {\f0 {\f0\fs20 2015-05-15}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx5616
      \intbl {\f0 {\f0\fs20 17:55}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx6552
      \intbl {\f0 {\f0\fs20 2018-05-05 04:00}}\cell
      \pard\plain
      
      \pard\plain\uc0\qr\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx7488
      \intbl {\f0 {\f0\fs20 1325.810}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx8424
      \intbl {\f0 {\f0\fs20 row_5}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx9360
      \intbl {\f0 {\f0\fs20 grp_b}}\cell
      \pard\plain
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\qr\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx936
      \intbl {\f0 {\f0\fs20 }}\cell
      \pard\plain
      
      \pard\plain\uc0\qr\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx1872
      \intbl {\f0 {\f0\fs20 NA}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx2808
      \intbl {\f0 {\f0\fs20 fig}}\cell
      \pard\plain
      
      \pard\plain\uc0\qc\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx3744
      \intbl {\f0 {\f0\fs20 six}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx4680
      \intbl {\f0 {\f0\fs20 2015-06-15}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx5616
      \intbl {\f0 {\f0\fs20 NA}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx6552
      \intbl {\f0 {\f0\fs20 2018-06-06 16:11}}\cell
      \pard\plain
      
      \pard\plain\uc0\qr\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx7488
      \intbl {\f0 {\f0\fs20 13.255}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx8424
      \intbl {\f0 {\f0\fs20 row_6}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx9360
      \intbl {\f0 {\f0\fs20 grp_b}}\cell
      \pard\plain
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\qr\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx936
      \intbl {\f0 {\f0\fs20 }}\cell
      \pard\plain
      
      \pard\plain\uc0\qr\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx1872
      \intbl {\f0 {\f0\fs20 7.770e+05}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx2808
      \intbl {\f0 {\f0\fs20 grapefruit}}\cell
      \pard\plain
      
      \pard\plain\uc0\qc\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx3744
      \intbl {\f0 {\f0\fs20 seven}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx4680
      \intbl {\f0 {\f0\fs20 NA}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx5616
      \intbl {\f0 {\f0\fs20 19:10}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx6552
      \intbl {\f0 {\f0\fs20 2018-07-07 05:22}}\cell
      \pard\plain
      
      \pard\plain\uc0\qr\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx7488
      \intbl {\f0 {\f0\fs20 NA}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx8424
      \intbl {\f0 {\f0\fs20 row_7}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx9360
      \intbl {\f0 {\f0\fs20 grp_b}}\cell
      \pard\plain
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\qr\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx936
      \intbl {\f0 {\f0\fs20 }}\cell
      \pard\plain
      
      \pard\plain\uc0\qr\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx1872
      \intbl {\f0 {\f0\fs20 8.880e+06}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx2808
      \intbl {\f0 {\f0\fs20 honeydew}}\cell
      \pard\plain
      
      \pard\plain\uc0\qc\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx3744
      \intbl {\f0 {\f0\fs20 eight}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx4680
      \intbl {\f0 {\f0\fs20 2015-08-15}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx5616
      \intbl {\f0 {\f0\fs20 20:20}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx6552
      \intbl {\f0 {\f0\fs20 NA}}\cell
      \pard\plain
      
      \pard\plain\uc0\qr\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx7488
      \intbl {\f0 {\f0\fs20 0.440}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx8424
      \intbl {\f0 {\f0\fs20 row_8}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx9360
      \intbl {\f0 {\f0\fs20 grp_b}}\cell
      \pard\plain
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\qr\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx936
      \intbl {\f0 {\f0\fs20 min}}\cell
      \pard\plain
      
      \pard\plain\uc0\qr\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx1872
      \intbl {\f0 {\f0\fs20 0.11}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx2808
      \intbl {\f0 {\f0\fs20 \'97}}\cell
      \pard\plain
      
      \pard\plain\uc0\qc\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx3744
      \intbl {\f0 {\f0\fs20 \'97}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx4680
      \intbl {\f0 {\f0\fs20 \'97}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx5616
      \intbl {\f0 {\f0\fs20 \'97}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx6552
      \intbl {\f0 {\f0\fs20 \'97}}\cell
      \pard\plain
      
      \pard\plain\uc0\qr\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx7488
      \intbl {\f0 {\f0\fs20 0.44}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx8424
      \intbl {\f0 {\f0\fs20 \'97}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx9360
      \intbl {\f0 {\f0\fs20 \'97}}\cell
      \pard\plain
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\qr\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx936
      \intbl {\f0 {\f0\fs20 max}}\cell
      \pard\plain
      
      \pard\plain\uc0\qr\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx1872
      \intbl {\f0 {\f0\fs20 8880000.00}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx2808
      \intbl {\f0 {\f0\fs20 \'97}}\cell
      \pard\plain
      
      \pard\plain\uc0\qc\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx3744
      \intbl {\f0 {\f0\fs20 \'97}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx4680
      \intbl {\f0 {\f0\fs20 \'97}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx5616
      \intbl {\f0 {\f0\fs20 \'97}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx6552
      \intbl {\f0 {\f0\fs20 \'97}}\cell
      \pard\plain
      
      \pard\plain\uc0\qr\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx7488
      \intbl {\f0 {\f0\fs20 65100.00}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx8424
      \intbl {\f0 {\f0\fs20 \'97}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx9360
      \intbl {\f0 {\f0\fs20 \'97}}\cell
      \pard\plain
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\qr\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx936
      \intbl {\f0 {\f0\fs20 avg}}\cell
      \pard\plain
      
      \pard\plain\uc0\qr\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx1872
      \intbl {\f0 {\f0\fs20 1380432.87}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx2808
      \intbl {\f0 {\f0\fs20 \'97}}\cell
      \pard\plain
      
      \pard\plain\uc0\qc\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx3744
      \intbl {\f0 {\f0\fs20 \'97}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx4680
      \intbl {\f0 {\f0\fs20 \'97}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx5616
      \intbl {\f0 {\f0\fs20 \'97}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx6552
      \intbl {\f0 {\f0\fs20 \'97}}\cell
      \pard\plain
      
      \pard\plain\uc0\qr\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx7488
      \intbl {\f0 {\f0\fs20 9501.26}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx8424
      \intbl {\f0 {\f0\fs20 \'97}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx9360
      \intbl {\f0 {\f0\fs20 \'97}}\cell
      \pard\plain
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx9360
      \intbl {\f0 {\f0\fs20 Source note #1\line Source note #2}}\cell
      \pard\plain
      
      \row
      
      }

---

    Code
      .
    Output
      [1] "<table class=\"gt_table\">\n  <thead class=\"gt_header\">\n    <tr>\n      <th colspan=\"10\" class=\"gt_heading gt_title gt_font_normal\" style>Data listing from <strong>exibble</strong></th>\n    </tr>\n    <tr>\n      <th colspan=\"10\" class=\"gt_heading gt_subtitle gt_font_normal gt_bottom_border\" style><code>exibble</code> is an R dataset</th>\n    </tr>\n  </thead>\n  <thead class=\"gt_col_headings\">\n    <tr>\n      <th class=\"gt_col_heading gt_columns_bottom_border gt_left\" rowspan=\"2\" colspan=\"1\">S.L.</th>\n      <th class=\"gt_col_heading gt_columns_bottom_border gt_right\" rowspan=\"2\" colspan=\"1\">num</th>\n      <th class=\"gt_col_heading gt_columns_bottom_border gt_left\" rowspan=\"2\" colspan=\"1\">char</th>\n      <th class=\"gt_col_heading gt_columns_bottom_border gt_center\" rowspan=\"2\" colspan=\"1\">fctr</th>\n      <th class=\"gt_center gt_columns_top_border gt_column_spanner_outer\" rowspan=\"1\" colspan=\"3\">\n        <span class=\"gt_column_spanner\">timing</span>\n      </th>\n      <th class=\"gt_col_heading gt_columns_bottom_border gt_right\" rowspan=\"2\" colspan=\"1\">currency</th>\n      <th class=\"gt_col_heading gt_columns_bottom_border gt_left\" rowspan=\"2\" colspan=\"1\">row</th>\n      <th class=\"gt_col_heading gt_columns_bottom_border gt_left\" rowspan=\"2\" colspan=\"1\">group</th>\n    </tr>\n    <tr>\n      <th class=\"gt_col_heading gt_columns_bottom_border gt_left\" rowspan=\"1\" colspan=\"1\">date</th>\n      <th class=\"gt_col_heading gt_columns_bottom_border gt_left\" rowspan=\"1\" colspan=\"1\">time</th>\n      <th class=\"gt_col_heading gt_columns_bottom_border gt_left\" rowspan=\"1\" colspan=\"1\">datetime</th>\n    </tr>\n  </thead>\n  <tbody class=\"gt_table_body\">\n    <tr><td class=\"gt_row gt_right gt_stub\"></td>\n<td class=\"gt_row gt_right\">1.111e-01</td>\n<td class=\"gt_row gt_left\">apricot</td>\n<td class=\"gt_row gt_center\">one</td>\n<td class=\"gt_row gt_left\">2015-01-15</td>\n<td class=\"gt_row gt_left\">13:35</td>\n<td class=\"gt_row gt_left\">2018-01-01 02:22</td>\n<td class=\"gt_row gt_right\">49.950</td>\n<td class=\"gt_row gt_left\">row_1</td>\n<td class=\"gt_row gt_left\">grp_a</td></tr>\n    <tr><td class=\"gt_row gt_right gt_stub\"></td>\n<td class=\"gt_row gt_right\">2.222e+00</td>\n<td class=\"gt_row gt_left\">banana</td>\n<td class=\"gt_row gt_center\">two</td>\n<td class=\"gt_row gt_left\">2015-02-15</td>\n<td class=\"gt_row gt_left\">14:40</td>\n<td class=\"gt_row gt_left\">2018-02-02 14:33</td>\n<td class=\"gt_row gt_right\">17.950</td>\n<td class=\"gt_row gt_left\">row_2</td>\n<td class=\"gt_row gt_left\">grp_a</td></tr>\n    <tr><td class=\"gt_row gt_right gt_stub\"></td>\n<td class=\"gt_row gt_right\">3.333e+01</td>\n<td class=\"gt_row gt_left\">coconut</td>\n<td class=\"gt_row gt_center\">three</td>\n<td class=\"gt_row gt_left\">2015-03-15</td>\n<td class=\"gt_row gt_left\">15:45</td>\n<td class=\"gt_row gt_left\">2018-03-03 03:44</td>\n<td class=\"gt_row gt_right\">1.390</td>\n<td class=\"gt_row gt_left\">row_3</td>\n<td class=\"gt_row gt_left\">grp_a</td></tr>\n    <tr><td class=\"gt_row gt_right gt_stub\"></td>\n<td class=\"gt_row gt_right\">4.444e+02</td>\n<td class=\"gt_row gt_left\">durian</td>\n<td class=\"gt_row gt_center\">four</td>\n<td class=\"gt_row gt_left\">2015-04-15</td>\n<td class=\"gt_row gt_left\">16:50</td>\n<td class=\"gt_row gt_left\">2018-04-04 15:55</td>\n<td class=\"gt_row gt_right\">65100.000</td>\n<td class=\"gt_row gt_left\">row_4</td>\n<td class=\"gt_row gt_left\">grp_a</td></tr>\n    <tr><td class=\"gt_row gt_right gt_stub\"></td>\n<td class=\"gt_row gt_right\">5.550e+03</td>\n<td class=\"gt_row gt_left\">NA</td>\n<td class=\"gt_row gt_center\">five</td>\n<td class=\"gt_row gt_left\">2015-05-15</td>\n<td class=\"gt_row gt_left\">17:55</td>\n<td class=\"gt_row gt_left\">2018-05-05 04:00</td>\n<td class=\"gt_row gt_right\">1325.810</td>\n<td class=\"gt_row gt_left\">row_5</td>\n<td class=\"gt_row gt_left\">grp_b</td></tr>\n    <tr><td class=\"gt_row gt_right gt_stub\"></td>\n<td class=\"gt_row gt_right\">NA</td>\n<td class=\"gt_row gt_left\">fig</td>\n<td class=\"gt_row gt_center\">six</td>\n<td class=\"gt_row gt_left\">2015-06-15</td>\n<td class=\"gt_row gt_left\">NA</td>\n<td class=\"gt_row gt_left\">2018-06-06 16:11</td>\n<td class=\"gt_row gt_right\">13.255</td>\n<td class=\"gt_row gt_left\">row_6</td>\n<td class=\"gt_row gt_left\">grp_b</td></tr>\n    <tr><td class=\"gt_row gt_right gt_stub\"></td>\n<td class=\"gt_row gt_right\">7.770e+05</td>\n<td class=\"gt_row gt_left\">grapefruit</td>\n<td class=\"gt_row gt_center\">seven</td>\n<td class=\"gt_row gt_left\">NA</td>\n<td class=\"gt_row gt_left\">19:10</td>\n<td class=\"gt_row gt_left\">2018-07-07 05:22</td>\n<td class=\"gt_row gt_right\">NA</td>\n<td class=\"gt_row gt_left\">row_7</td>\n<td class=\"gt_row gt_left\">grp_b</td></tr>\n    <tr><td class=\"gt_row gt_right gt_stub\"></td>\n<td class=\"gt_row gt_right\">8.880e+06</td>\n<td class=\"gt_row gt_left\">honeydew</td>\n<td class=\"gt_row gt_center\">eight</td>\n<td class=\"gt_row gt_left\">2015-08-15</td>\n<td class=\"gt_row gt_left\">20:20</td>\n<td class=\"gt_row gt_left\">NA</td>\n<td class=\"gt_row gt_right\">0.440</td>\n<td class=\"gt_row gt_left\">row_8</td>\n<td class=\"gt_row gt_left\">grp_b</td></tr>\n    <tr><td class=\"gt_row gt_right gt_stub gt_grand_summary_row gt_first_grand_summary_row\">min</td>\n<td class=\"gt_row gt_right gt_grand_summary_row gt_first_grand_summary_row\">0.11</td>\n<td class=\"gt_row gt_left gt_grand_summary_row gt_first_grand_summary_row\">&mdash;</td>\n<td class=\"gt_row gt_center gt_grand_summary_row gt_first_grand_summary_row\">&mdash;</td>\n<td class=\"gt_row gt_left gt_grand_summary_row gt_first_grand_summary_row\">&mdash;</td>\n<td class=\"gt_row gt_left gt_grand_summary_row gt_first_grand_summary_row\">&mdash;</td>\n<td class=\"gt_row gt_left gt_grand_summary_row gt_first_grand_summary_row\">&mdash;</td>\n<td class=\"gt_row gt_right gt_grand_summary_row gt_first_grand_summary_row\">0.44</td>\n<td class=\"gt_row gt_left gt_grand_summary_row gt_first_grand_summary_row\">&mdash;</td>\n<td class=\"gt_row gt_left gt_grand_summary_row gt_first_grand_summary_row\">&mdash;</td></tr>\n    <tr><td class=\"gt_row gt_right gt_stub gt_grand_summary_row\">max</td>\n<td class=\"gt_row gt_right gt_grand_summary_row\">8880000.00</td>\n<td class=\"gt_row gt_left gt_grand_summary_row\">&mdash;</td>\n<td class=\"gt_row gt_center gt_grand_summary_row\">&mdash;</td>\n<td class=\"gt_row gt_left gt_grand_summary_row\">&mdash;</td>\n<td class=\"gt_row gt_left gt_grand_summary_row\">&mdash;</td>\n<td class=\"gt_row gt_left gt_grand_summary_row\">&mdash;</td>\n<td class=\"gt_row gt_right gt_grand_summary_row\">65100.00</td>\n<td class=\"gt_row gt_left gt_grand_summary_row\">&mdash;</td>\n<td class=\"gt_row gt_left gt_grand_summary_row\">&mdash;</td></tr>\n    <tr><td class=\"gt_row gt_right gt_stub gt_grand_summary_row gt_last_summary_row\">avg</td>\n<td class=\"gt_row gt_right gt_grand_summary_row gt_last_summary_row\">1380432.87</td>\n<td class=\"gt_row gt_left gt_grand_summary_row gt_last_summary_row\">&mdash;</td>\n<td class=\"gt_row gt_center gt_grand_summary_row gt_last_summary_row\">&mdash;</td>\n<td class=\"gt_row gt_left gt_grand_summary_row gt_last_summary_row\">&mdash;</td>\n<td class=\"gt_row gt_left gt_grand_summary_row gt_last_summary_row\">&mdash;</td>\n<td class=\"gt_row gt_left gt_grand_summary_row gt_last_summary_row\">&mdash;</td>\n<td class=\"gt_row gt_right gt_grand_summary_row gt_last_summary_row\">9501.26</td>\n<td class=\"gt_row gt_left gt_grand_summary_row gt_last_summary_row\">&mdash;</td>\n<td class=\"gt_row gt_left gt_grand_summary_row gt_last_summary_row\">&mdash;</td></tr>\n  </tbody>\n  <tfoot class=\"gt_sourcenotes\">\n    <tr>\n      <td class=\"gt_sourcenote\" colspan=\"10\">Source note #1</td>\n    </tr>\n    <tr>\n      <td class=\"gt_sourcenote\" colspan=\"10\">Source note #2</td>\n    </tr>\n  </tfoot>\n  \n</table>"

---

    Code
      .
    Output
      [1] "\\captionsetup[table]{labelformat=empty,skip=1pt}\n\\setlength{\\LTpost}{0mm}\n\\begin{longtable}{r|rlclllrll}\n\\caption*{\n{\\large Data listing from \\textbf{exibble}} \\\\ \n{\\small \\texttt{exibble} is an R dataset}\n} \\\\ \n\\toprule\n\\multicolumn{1}{l}{} &  &  &  & \\multicolumn{3}{c}{timing} &  &  &  \\\\ \n\\cmidrule(lr){5-7}\n\\multicolumn{1}{l}{S.L.} & num & char & fctr & date & time & datetime & currency & row & group \\\\ \n\\midrule\n & 1.111e-01 & apricot & one & 2015-01-15 & 13:35 & 2018-01-01 02:22 & 49.950 & row\\_1 & grp\\_a \\\\ \n & 2.222e+00 & banana & two & 2015-02-15 & 14:40 & 2018-02-02 14:33 & 17.950 & row\\_2 & grp\\_a \\\\ \n & 3.333e+01 & coconut & three & 2015-03-15 & 15:45 & 2018-03-03 03:44 & 1.390 & row\\_3 & grp\\_a \\\\ \n & 4.444e+02 & durian & four & 2015-04-15 & 16:50 & 2018-04-04 15:55 & 65100.000 & row\\_4 & grp\\_a \\\\ \n & 5.550e+03 & NA & five & 2015-05-15 & 17:55 & 2018-05-05 04:00 & 1325.810 & row\\_5 & grp\\_b \\\\ \n & NA & fig & six & 2015-06-15 & NA & 2018-06-06 16:11 & 13.255 & row\\_6 & grp\\_b \\\\ \n & 7.770e+05 & grapefruit & seven & NA & 19:10 & 2018-07-07 05:22 & NA & row\\_7 & grp\\_b \\\\ \n & 8.880e+06 & honeydew & eight & 2015-08-15 & 20:20 & NA & 0.440 & row\\_8 & grp\\_b \\\\ \n\\midrule \n\\midrule \nmin & $0.11$ & — & — & — & — & — & $0.44$ & — & — \\\\ \nmax & $8880000.00$ & — & — & — & — & — & $65100.00$ & — & — \\\\ \navg & $1380432.87$ & — & — & — & — & — & $9501.26$ & — & — \\\\ \n\\bottomrule\n\\end{longtable}\n\\begin{minipage}{\\linewidth}\nSource note \\#1\\\\\nSource note \\#2\\\\\n\\end{minipage}\n"

---

    Code
      .
    Output
      {\rtf\ansi\ansicpg1252{\fonttbl{\f0\froman\fcharset0\fprq0 Courier New;}{\f1\froman\fcharset0\fprq0 Times;}}{\colortbl;\red51\green51\blue51;\red211\green211\blue211;}
      
      \paperw12240\paperh15840\widowctrl\ftnbj\fet0\sectd\linex0
      \lndscpsxn
      \margl1440\margr1440\margt1440\margb1440
      \headery720\footery720\fs20
      
      \trowd\trrh0\trhdr
      
      \pard\plain\uc0\qc\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx9360
      \intbl {\f0\cf1 {\f0\fs20 Data listing from {\b exibble}} {\f0\fs20\i\super } \line {\f0\fs20 {\f1 exibble} is an R dataset} {\f0\fs20\i\super }}\cell
      \pard\plain
      
      \row
      
      \trowd\trrh0\trhdr
      
      \pard\plain\uc0\qc\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx936
      \intbl {\f0 {\f0\fs20 }}\cell
      \pard\plain
      
      \pard\plain\uc0\qc\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx1872
      \intbl {\f0 {\f0\fs20 }}\cell
      \pard\plain
      
      \pard\plain\uc0\qc\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx2808
      \intbl {\f0 {\f0\fs20 }}\cell
      \pard\plain
      
      \pard\plain\uc0\qc\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx3744
      \intbl {\f0 {\f0\fs20 }}\cell
      \pard\plain
      
      \pard\plain\uc0\qc\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clmgf\cellx4680
      \intbl {\f0 {\f0\fs20 timing}}\cell
      \pard\plain
      
      \pard\plain\uc0\qc\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clmrg\cellx5616
      \intbl {\f0 {\f0\fs20 timing}}\cell
      \pard\plain
      
      \pard\plain\uc0\qc\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clmrg\cellx6552
      \intbl {\f0 {\f0\fs20 timing}}\cell
      \pard\plain
      
      \pard\plain\uc0\qc\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx7488
      \intbl {\f0 {\f0\fs20 }}\cell
      \pard\plain
      
      \pard\plain\uc0\qc\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx8424
      \intbl {\f0 {\f0\fs20 }}\cell
      \pard\plain
      
      \pard\plain\uc0\qc\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx9360
      \intbl {\f0 {\f0\fs20 }}\cell
      \pard\plain
      
      \row
      
      \trowd\trrh0\trhdr
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clbrdrb\brdrs\brdrw40\brdrcf2\cellx936
      \intbl {\f0 {\f0\fs20 S.L.}}\cell
      \pard\plain
      
      \pard\plain\uc0\qr\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clbrdrb\brdrs\brdrw40\brdrcf2\cellx1872
      \intbl {\f0 {\f0\fs20 num}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clbrdrb\brdrs\brdrw40\brdrcf2\cellx2808
      \intbl {\f0 {\f0\fs20 char}}\cell
      \pard\plain
      
      \pard\plain\uc0\qc\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clbrdrb\brdrs\brdrw40\brdrcf2\cellx3744
      \intbl {\f0 {\f0\fs20 fctr}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clbrdrb\brdrs\brdrw40\brdrcf2\cellx4680
      \intbl {\f0 {\f0\fs20 date}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clbrdrb\brdrs\brdrw40\brdrcf2\cellx5616
      \intbl {\f0 {\f0\fs20 time}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clbrdrb\brdrs\brdrw40\brdrcf2\cellx6552
      \intbl {\f0 {\f0\fs20 datetime}}\cell
      \pard\plain
      
      \pard\plain\uc0\qr\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clbrdrb\brdrs\brdrw40\brdrcf2\cellx7488
      \intbl {\f0 {\f0\fs20 currency}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clbrdrb\brdrs\brdrw40\brdrcf2\cellx8424
      \intbl {\f0 {\f0\fs20 row}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clbrdrb\brdrs\brdrw40\brdrcf2\cellx9360
      \intbl {\f0 {\f0\fs20 group}}\cell
      \pard\plain
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\qr\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx936
      \intbl {\f0 {\f0\fs20 }}\cell
      \pard\plain
      
      \pard\plain\uc0\qr\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx1872
      \intbl {\f0 {\f0\fs20 1.111e-01}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx2808
      \intbl {\f0 {\f0\fs20 apricot}}\cell
      \pard\plain
      
      \pard\plain\uc0\qc\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx3744
      \intbl {\f0 {\f0\fs20 one}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx4680
      \intbl {\f0 {\f0\fs20 2015-01-15}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx5616
      \intbl {\f0 {\f0\fs20 13:35}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx6552
      \intbl {\f0 {\f0\fs20 2018-01-01 02:22}}\cell
      \pard\plain
      
      \pard\plain\uc0\qr\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx7488
      \intbl {\f0 {\f0\fs20 49.950}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx8424
      \intbl {\f0 {\f0\fs20 row_1}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx9360
      \intbl {\f0 {\f0\fs20 grp_a}}\cell
      \pard\plain
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\qr\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx936
      \intbl {\f0 {\f0\fs20 }}\cell
      \pard\plain
      
      \pard\plain\uc0\qr\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx1872
      \intbl {\f0 {\f0\fs20 2.222e+00}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx2808
      \intbl {\f0 {\f0\fs20 banana}}\cell
      \pard\plain
      
      \pard\plain\uc0\qc\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx3744
      \intbl {\f0 {\f0\fs20 two}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx4680
      \intbl {\f0 {\f0\fs20 2015-02-15}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx5616
      \intbl {\f0 {\f0\fs20 14:40}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx6552
      \intbl {\f0 {\f0\fs20 2018-02-02 14:33}}\cell
      \pard\plain
      
      \pard\plain\uc0\qr\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx7488
      \intbl {\f0 {\f0\fs20 17.950}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx8424
      \intbl {\f0 {\f0\fs20 row_2}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx9360
      \intbl {\f0 {\f0\fs20 grp_a}}\cell
      \pard\plain
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\qr\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx936
      \intbl {\f0 {\f0\fs20 }}\cell
      \pard\plain
      
      \pard\plain\uc0\qr\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx1872
      \intbl {\f0 {\f0\fs20 3.333e+01}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx2808
      \intbl {\f0 {\f0\fs20 coconut}}\cell
      \pard\plain
      
      \pard\plain\uc0\qc\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx3744
      \intbl {\f0 {\f0\fs20 three}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx4680
      \intbl {\f0 {\f0\fs20 2015-03-15}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx5616
      \intbl {\f0 {\f0\fs20 15:45}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx6552
      \intbl {\f0 {\f0\fs20 2018-03-03 03:44}}\cell
      \pard\plain
      
      \pard\plain\uc0\qr\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx7488
      \intbl {\f0 {\f0\fs20 1.390}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx8424
      \intbl {\f0 {\f0\fs20 row_3}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx9360
      \intbl {\f0 {\f0\fs20 grp_a}}\cell
      \pard\plain
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\qr\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx936
      \intbl {\f0 {\f0\fs20 }}\cell
      \pard\plain
      
      \pard\plain\uc0\qr\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx1872
      \intbl {\f0 {\f0\fs20 4.444e+02}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx2808
      \intbl {\f0 {\f0\fs20 durian}}\cell
      \pard\plain
      
      \pard\plain\uc0\qc\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx3744
      \intbl {\f0 {\f0\fs20 four}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx4680
      \intbl {\f0 {\f0\fs20 2015-04-15}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx5616
      \intbl {\f0 {\f0\fs20 16:50}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx6552
      \intbl {\f0 {\f0\fs20 2018-04-04 15:55}}\cell
      \pard\plain
      
      \pard\plain\uc0\qr\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx7488
      \intbl {\f0 {\f0\fs20 65100.000}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx8424
      \intbl {\f0 {\f0\fs20 row_4}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx9360
      \intbl {\f0 {\f0\fs20 grp_a}}\cell
      \pard\plain
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\qr\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx936
      \intbl {\f0 {\f0\fs20 }}\cell
      \pard\plain
      
      \pard\plain\uc0\qr\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx1872
      \intbl {\f0 {\f0\fs20 5.550e+03}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx2808
      \intbl {\f0 {\f0\fs20 NA}}\cell
      \pard\plain
      
      \pard\plain\uc0\qc\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx3744
      \intbl {\f0 {\f0\fs20 five}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx4680
      \intbl {\f0 {\f0\fs20 2015-05-15}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx5616
      \intbl {\f0 {\f0\fs20 17:55}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx6552
      \intbl {\f0 {\f0\fs20 2018-05-05 04:00}}\cell
      \pard\plain
      
      \pard\plain\uc0\qr\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx7488
      \intbl {\f0 {\f0\fs20 1325.810}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx8424
      \intbl {\f0 {\f0\fs20 row_5}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx9360
      \intbl {\f0 {\f0\fs20 grp_b}}\cell
      \pard\plain
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\qr\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx936
      \intbl {\f0 {\f0\fs20 }}\cell
      \pard\plain
      
      \pard\plain\uc0\qr\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx1872
      \intbl {\f0 {\f0\fs20 NA}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx2808
      \intbl {\f0 {\f0\fs20 fig}}\cell
      \pard\plain
      
      \pard\plain\uc0\qc\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx3744
      \intbl {\f0 {\f0\fs20 six}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx4680
      \intbl {\f0 {\f0\fs20 2015-06-15}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx5616
      \intbl {\f0 {\f0\fs20 NA}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx6552
      \intbl {\f0 {\f0\fs20 2018-06-06 16:11}}\cell
      \pard\plain
      
      \pard\plain\uc0\qr\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx7488
      \intbl {\f0 {\f0\fs20 13.255}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx8424
      \intbl {\f0 {\f0\fs20 row_6}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx9360
      \intbl {\f0 {\f0\fs20 grp_b}}\cell
      \pard\plain
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\qr\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx936
      \intbl {\f0 {\f0\fs20 }}\cell
      \pard\plain
      
      \pard\plain\uc0\qr\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx1872
      \intbl {\f0 {\f0\fs20 7.770e+05}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx2808
      \intbl {\f0 {\f0\fs20 grapefruit}}\cell
      \pard\plain
      
      \pard\plain\uc0\qc\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx3744
      \intbl {\f0 {\f0\fs20 seven}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx4680
      \intbl {\f0 {\f0\fs20 NA}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx5616
      \intbl {\f0 {\f0\fs20 19:10}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx6552
      \intbl {\f0 {\f0\fs20 2018-07-07 05:22}}\cell
      \pard\plain
      
      \pard\plain\uc0\qr\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx7488
      \intbl {\f0 {\f0\fs20 NA}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx8424
      \intbl {\f0 {\f0\fs20 row_7}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx9360
      \intbl {\f0 {\f0\fs20 grp_b}}\cell
      \pard\plain
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\qr\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx936
      \intbl {\f0 {\f0\fs20 }}\cell
      \pard\plain
      
      \pard\plain\uc0\qr\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx1872
      \intbl {\f0 {\f0\fs20 8.880e+06}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx2808
      \intbl {\f0 {\f0\fs20 honeydew}}\cell
      \pard\plain
      
      \pard\plain\uc0\qc\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx3744
      \intbl {\f0 {\f0\fs20 eight}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx4680
      \intbl {\f0 {\f0\fs20 2015-08-15}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx5616
      \intbl {\f0 {\f0\fs20 20:20}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx6552
      \intbl {\f0 {\f0\fs20 NA}}\cell
      \pard\plain
      
      \pard\plain\uc0\qr\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx7488
      \intbl {\f0 {\f0\fs20 0.440}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx8424
      \intbl {\f0 {\f0\fs20 row_8}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx9360
      \intbl {\f0 {\f0\fs20 grp_b}}\cell
      \pard\plain
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\qr\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx936
      \intbl {\f0 {\f0\fs20 min}}\cell
      \pard\plain
      
      \pard\plain\uc0\qr\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx1872
      \intbl {\f0 {\f0\fs20 0.11}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx2808
      \intbl {\f0 {\f0\fs20 \'97}}\cell
      \pard\plain
      
      \pard\plain\uc0\qc\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx3744
      \intbl {\f0 {\f0\fs20 \'97}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx4680
      \intbl {\f0 {\f0\fs20 \'97}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx5616
      \intbl {\f0 {\f0\fs20 \'97}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx6552
      \intbl {\f0 {\f0\fs20 \'97}}\cell
      \pard\plain
      
      \pard\plain\uc0\qr\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx7488
      \intbl {\f0 {\f0\fs20 0.44}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx8424
      \intbl {\f0 {\f0\fs20 \'97}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx9360
      \intbl {\f0 {\f0\fs20 \'97}}\cell
      \pard\plain
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\qr\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx936
      \intbl {\f0 {\f0\fs20 max}}\cell
      \pard\plain
      
      \pard\plain\uc0\qr\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx1872
      \intbl {\f0 {\f0\fs20 8880000.00}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx2808
      \intbl {\f0 {\f0\fs20 \'97}}\cell
      \pard\plain
      
      \pard\plain\uc0\qc\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx3744
      \intbl {\f0 {\f0\fs20 \'97}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx4680
      \intbl {\f0 {\f0\fs20 \'97}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx5616
      \intbl {\f0 {\f0\fs20 \'97}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx6552
      \intbl {\f0 {\f0\fs20 \'97}}\cell
      \pard\plain
      
      \pard\plain\uc0\qr\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx7488
      \intbl {\f0 {\f0\fs20 65100.00}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx8424
      \intbl {\f0 {\f0\fs20 \'97}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx9360
      \intbl {\f0 {\f0\fs20 \'97}}\cell
      \pard\plain
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\qr\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx936
      \intbl {\f0 {\f0\fs20 avg}}\cell
      \pard\plain
      
      \pard\plain\uc0\qr\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx1872
      \intbl {\f0 {\f0\fs20 1380432.87}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx2808
      \intbl {\f0 {\f0\fs20 \'97}}\cell
      \pard\plain
      
      \pard\plain\uc0\qc\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx3744
      \intbl {\f0 {\f0\fs20 \'97}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx4680
      \intbl {\f0 {\f0\fs20 \'97}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx5616
      \intbl {\f0 {\f0\fs20 \'97}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx6552
      \intbl {\f0 {\f0\fs20 \'97}}\cell
      \pard\plain
      
      \pard\plain\uc0\qr\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx7488
      \intbl {\f0 {\f0\fs20 9501.26}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx8424
      \intbl {\f0 {\f0\fs20 \'97}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx9360
      \intbl {\f0 {\f0\fs20 \'97}}\cell
      \pard\plain
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx9360
      \intbl {\f0 {\f0\fs20 Source note #1\line Source note #2}}\cell
      \pard\plain
      
      \row
      
      }

---

    Code
      .
    Output
      [1] "<table class=\"gt_table\">\n  <thead class=\"gt_header\">\n    <tr>\n      <th colspan=\"9\" class=\"gt_heading gt_title gt_font_normal\" style>Data listing from <strong>exibble</strong></th>\n    </tr>\n    <tr>\n      <th colspan=\"9\" class=\"gt_heading gt_subtitle gt_font_normal gt_bottom_border\" style><code>exibble</code> is an R dataset</th>\n    </tr>\n  </thead>\n  <thead class=\"gt_col_headings\">\n    <tr>\n      <th class=\"gt_col_heading gt_columns_bottom_border gt_left\" rowspan=\"2\" colspan=\"1\">S.L.</th>\n      <th class=\"gt_col_heading gt_columns_bottom_border gt_right\" rowspan=\"2\" colspan=\"1\">num</th>\n      <th class=\"gt_col_heading gt_columns_bottom_border gt_left\" rowspan=\"2\" colspan=\"1\">char</th>\n      <th class=\"gt_col_heading gt_columns_bottom_border gt_center\" rowspan=\"2\" colspan=\"1\">fctr</th>\n      <th class=\"gt_center gt_columns_top_border gt_column_spanner_outer\" rowspan=\"1\" colspan=\"3\">\n        <span class=\"gt_column_spanner\">timing</span>\n      </th>\n      <th class=\"gt_col_heading gt_columns_bottom_border gt_right\" rowspan=\"2\" colspan=\"1\">currency</th>\n      <th class=\"gt_col_heading gt_columns_bottom_border gt_left\" rowspan=\"2\" colspan=\"1\">row</th>\n    </tr>\n    <tr>\n      <th class=\"gt_col_heading gt_columns_bottom_border gt_left\" rowspan=\"1\" colspan=\"1\">date</th>\n      <th class=\"gt_col_heading gt_columns_bottom_border gt_left\" rowspan=\"1\" colspan=\"1\">time</th>\n      <th class=\"gt_col_heading gt_columns_bottom_border gt_left\" rowspan=\"1\" colspan=\"1\">datetime</th>\n    </tr>\n  </thead>\n  <tbody class=\"gt_table_body\">\n    <tr class=\"gt_group_heading_row\">\n      <td colspan=\"9\" class=\"gt_group_heading\">grp_a</td>\n    </tr>\n    <tr class=\"gt_row_group_first\"><td class=\"gt_row gt_right gt_stub\"></td>\n<td class=\"gt_row gt_right\">1.111e-01</td>\n<td class=\"gt_row gt_left\">apricot</td>\n<td class=\"gt_row gt_center\">one</td>\n<td class=\"gt_row gt_left\">2015-01-15</td>\n<td class=\"gt_row gt_left\">13:35</td>\n<td class=\"gt_row gt_left\">2018-01-01 02:22</td>\n<td class=\"gt_row gt_right\">49.950</td>\n<td class=\"gt_row gt_left\">row_1</td></tr>\n    <tr><td class=\"gt_row gt_right gt_stub\"></td>\n<td class=\"gt_row gt_right\">2.222e+00</td>\n<td class=\"gt_row gt_left\">banana</td>\n<td class=\"gt_row gt_center\">two</td>\n<td class=\"gt_row gt_left\">2015-02-15</td>\n<td class=\"gt_row gt_left\">14:40</td>\n<td class=\"gt_row gt_left\">2018-02-02 14:33</td>\n<td class=\"gt_row gt_right\">17.950</td>\n<td class=\"gt_row gt_left\">row_2</td></tr>\n    <tr><td class=\"gt_row gt_right gt_stub\"></td>\n<td class=\"gt_row gt_right\">3.333e+01</td>\n<td class=\"gt_row gt_left\">coconut</td>\n<td class=\"gt_row gt_center\">three</td>\n<td class=\"gt_row gt_left\">2015-03-15</td>\n<td class=\"gt_row gt_left\">15:45</td>\n<td class=\"gt_row gt_left\">2018-03-03 03:44</td>\n<td class=\"gt_row gt_right\">1.390</td>\n<td class=\"gt_row gt_left\">row_3</td></tr>\n    <tr><td class=\"gt_row gt_right gt_stub\"></td>\n<td class=\"gt_row gt_right\">4.444e+02</td>\n<td class=\"gt_row gt_left\">durian</td>\n<td class=\"gt_row gt_center\">four</td>\n<td class=\"gt_row gt_left\">2015-04-15</td>\n<td class=\"gt_row gt_left\">16:50</td>\n<td class=\"gt_row gt_left\">2018-04-04 15:55</td>\n<td class=\"gt_row gt_right\">65100.000</td>\n<td class=\"gt_row gt_left\">row_4</td></tr>\n    <tr><td class=\"gt_row gt_right gt_stub gt_summary_row gt_first_summary_row thick\">min</td>\n<td class=\"gt_row gt_right gt_summary_row gt_first_summary_row thick\">0.11</td>\n<td class=\"gt_row gt_left gt_summary_row gt_first_summary_row thick\">&mdash;</td>\n<td class=\"gt_row gt_center gt_summary_row gt_first_summary_row thick\">&mdash;</td>\n<td class=\"gt_row gt_left gt_summary_row gt_first_summary_row thick\">&mdash;</td>\n<td class=\"gt_row gt_left gt_summary_row gt_first_summary_row thick\">&mdash;</td>\n<td class=\"gt_row gt_left gt_summary_row gt_first_summary_row thick\">&mdash;</td>\n<td class=\"gt_row gt_right gt_summary_row gt_first_summary_row thick\">1.39</td>\n<td class=\"gt_row gt_left gt_summary_row gt_first_summary_row thick\">&mdash;</td></tr>\n    <tr><td class=\"gt_row gt_right gt_stub gt_summary_row\">max</td>\n<td class=\"gt_row gt_right gt_summary_row\">444.40</td>\n<td class=\"gt_row gt_left gt_summary_row\">&mdash;</td>\n<td class=\"gt_row gt_center gt_summary_row\">&mdash;</td>\n<td class=\"gt_row gt_left gt_summary_row\">&mdash;</td>\n<td class=\"gt_row gt_left gt_summary_row\">&mdash;</td>\n<td class=\"gt_row gt_left gt_summary_row\">&mdash;</td>\n<td class=\"gt_row gt_right gt_summary_row\">65100.00</td>\n<td class=\"gt_row gt_left gt_summary_row\">&mdash;</td></tr>\n    <tr><td class=\"gt_row gt_right gt_stub gt_summary_row gt_last_summary_row\">avg</td>\n<td class=\"gt_row gt_right gt_summary_row gt_last_summary_row\">120.02</td>\n<td class=\"gt_row gt_left gt_summary_row gt_last_summary_row\">&mdash;</td>\n<td class=\"gt_row gt_center gt_summary_row gt_last_summary_row\">&mdash;</td>\n<td class=\"gt_row gt_left gt_summary_row gt_last_summary_row\">&mdash;</td>\n<td class=\"gt_row gt_left gt_summary_row gt_last_summary_row\">&mdash;</td>\n<td class=\"gt_row gt_left gt_summary_row gt_last_summary_row\">&mdash;</td>\n<td class=\"gt_row gt_right gt_summary_row gt_last_summary_row\">16292.32</td>\n<td class=\"gt_row gt_left gt_summary_row gt_last_summary_row\">&mdash;</td></tr>\n    <tr class=\"gt_group_heading_row\">\n      <td colspan=\"9\" class=\"gt_group_heading\">grp_b</td>\n    </tr>\n    <tr class=\"gt_row_group_first\"><td class=\"gt_row gt_right gt_stub\"></td>\n<td class=\"gt_row gt_right\">5.550e+03</td>\n<td class=\"gt_row gt_left\">NA</td>\n<td class=\"gt_row gt_center\">five</td>\n<td class=\"gt_row gt_left\">2015-05-15</td>\n<td class=\"gt_row gt_left\">17:55</td>\n<td class=\"gt_row gt_left\">2018-05-05 04:00</td>\n<td class=\"gt_row gt_right\">1325.810</td>\n<td class=\"gt_row gt_left\">row_5</td></tr>\n    <tr><td class=\"gt_row gt_right gt_stub\"></td>\n<td class=\"gt_row gt_right\">NA</td>\n<td class=\"gt_row gt_left\">fig</td>\n<td class=\"gt_row gt_center\">six</td>\n<td class=\"gt_row gt_left\">2015-06-15</td>\n<td class=\"gt_row gt_left\">NA</td>\n<td class=\"gt_row gt_left\">2018-06-06 16:11</td>\n<td class=\"gt_row gt_right\">13.255</td>\n<td class=\"gt_row gt_left\">row_6</td></tr>\n    <tr><td class=\"gt_row gt_right gt_stub\"></td>\n<td class=\"gt_row gt_right\">7.770e+05</td>\n<td class=\"gt_row gt_left\">grapefruit</td>\n<td class=\"gt_row gt_center\">seven</td>\n<td class=\"gt_row gt_left\">NA</td>\n<td class=\"gt_row gt_left\">19:10</td>\n<td class=\"gt_row gt_left\">2018-07-07 05:22</td>\n<td class=\"gt_row gt_right\">NA</td>\n<td class=\"gt_row gt_left\">row_7</td></tr>\n    <tr><td class=\"gt_row gt_right gt_stub\"></td>\n<td class=\"gt_row gt_right\">8.880e+06</td>\n<td class=\"gt_row gt_left\">honeydew</td>\n<td class=\"gt_row gt_center\">eight</td>\n<td class=\"gt_row gt_left\">2015-08-15</td>\n<td class=\"gt_row gt_left\">20:20</td>\n<td class=\"gt_row gt_left\">NA</td>\n<td class=\"gt_row gt_right\">0.440</td>\n<td class=\"gt_row gt_left\">row_8</td></tr>\n    <tr><td class=\"gt_row gt_right gt_stub gt_summary_row gt_first_summary_row thick\">min</td>\n<td class=\"gt_row gt_right gt_summary_row gt_first_summary_row thick\">5550.00</td>\n<td class=\"gt_row gt_left gt_summary_row gt_first_summary_row thick\">&mdash;</td>\n<td class=\"gt_row gt_center gt_summary_row gt_first_summary_row thick\">&mdash;</td>\n<td class=\"gt_row gt_left gt_summary_row gt_first_summary_row thick\">&mdash;</td>\n<td class=\"gt_row gt_left gt_summary_row gt_first_summary_row thick\">&mdash;</td>\n<td class=\"gt_row gt_left gt_summary_row gt_first_summary_row thick\">&mdash;</td>\n<td class=\"gt_row gt_right gt_summary_row gt_first_summary_row thick\">0.44</td>\n<td class=\"gt_row gt_left gt_summary_row gt_first_summary_row thick\">&mdash;</td></tr>\n    <tr><td class=\"gt_row gt_right gt_stub gt_summary_row\">max</td>\n<td class=\"gt_row gt_right gt_summary_row\">8880000.00</td>\n<td class=\"gt_row gt_left gt_summary_row\">&mdash;</td>\n<td class=\"gt_row gt_center gt_summary_row\">&mdash;</td>\n<td class=\"gt_row gt_left gt_summary_row\">&mdash;</td>\n<td class=\"gt_row gt_left gt_summary_row\">&mdash;</td>\n<td class=\"gt_row gt_left gt_summary_row\">&mdash;</td>\n<td class=\"gt_row gt_right gt_summary_row\">1325.81</td>\n<td class=\"gt_row gt_left gt_summary_row\">&mdash;</td></tr>\n    <tr><td class=\"gt_row gt_right gt_stub gt_summary_row gt_last_summary_row\">avg</td>\n<td class=\"gt_row gt_right gt_summary_row gt_last_summary_row\">3220850.00</td>\n<td class=\"gt_row gt_left gt_summary_row gt_last_summary_row\">&mdash;</td>\n<td class=\"gt_row gt_center gt_summary_row gt_last_summary_row\">&mdash;</td>\n<td class=\"gt_row gt_left gt_summary_row gt_last_summary_row\">&mdash;</td>\n<td class=\"gt_row gt_left gt_summary_row gt_last_summary_row\">&mdash;</td>\n<td class=\"gt_row gt_left gt_summary_row gt_last_summary_row\">&mdash;</td>\n<td class=\"gt_row gt_right gt_summary_row gt_last_summary_row\">446.50</td>\n<td class=\"gt_row gt_left gt_summary_row gt_last_summary_row\">&mdash;</td></tr>\n    <tr><td class=\"gt_row gt_right gt_stub gt_grand_summary_row gt_first_grand_summary_row\">min</td>\n<td class=\"gt_row gt_right gt_grand_summary_row gt_first_grand_summary_row\">0.11</td>\n<td class=\"gt_row gt_left gt_grand_summary_row gt_first_grand_summary_row\">&mdash;</td>\n<td class=\"gt_row gt_center gt_grand_summary_row gt_first_grand_summary_row\">&mdash;</td>\n<td class=\"gt_row gt_left gt_grand_summary_row gt_first_grand_summary_row\">&mdash;</td>\n<td class=\"gt_row gt_left gt_grand_summary_row gt_first_grand_summary_row\">&mdash;</td>\n<td class=\"gt_row gt_left gt_grand_summary_row gt_first_grand_summary_row\">&mdash;</td>\n<td class=\"gt_row gt_right gt_grand_summary_row gt_first_grand_summary_row\">0.44</td>\n<td class=\"gt_row gt_left gt_grand_summary_row gt_first_grand_summary_row\">&mdash;</td></tr>\n    <tr><td class=\"gt_row gt_right gt_stub gt_grand_summary_row\">max</td>\n<td class=\"gt_row gt_right gt_grand_summary_row\">8880000.00</td>\n<td class=\"gt_row gt_left gt_grand_summary_row\">&mdash;</td>\n<td class=\"gt_row gt_center gt_grand_summary_row\">&mdash;</td>\n<td class=\"gt_row gt_left gt_grand_summary_row\">&mdash;</td>\n<td class=\"gt_row gt_left gt_grand_summary_row\">&mdash;</td>\n<td class=\"gt_row gt_left gt_grand_summary_row\">&mdash;</td>\n<td class=\"gt_row gt_right gt_grand_summary_row\">65100.00</td>\n<td class=\"gt_row gt_left gt_grand_summary_row\">&mdash;</td></tr>\n    <tr><td class=\"gt_row gt_right gt_stub gt_grand_summary_row gt_last_summary_row\">avg</td>\n<td class=\"gt_row gt_right gt_grand_summary_row gt_last_summary_row\">1380432.87</td>\n<td class=\"gt_row gt_left gt_grand_summary_row gt_last_summary_row\">&mdash;</td>\n<td class=\"gt_row gt_center gt_grand_summary_row gt_last_summary_row\">&mdash;</td>\n<td class=\"gt_row gt_left gt_grand_summary_row gt_last_summary_row\">&mdash;</td>\n<td class=\"gt_row gt_left gt_grand_summary_row gt_last_summary_row\">&mdash;</td>\n<td class=\"gt_row gt_left gt_grand_summary_row gt_last_summary_row\">&mdash;</td>\n<td class=\"gt_row gt_right gt_grand_summary_row gt_last_summary_row\">9501.26</td>\n<td class=\"gt_row gt_left gt_grand_summary_row gt_last_summary_row\">&mdash;</td></tr>\n  </tbody>\n  <tfoot class=\"gt_sourcenotes\">\n    <tr>\n      <td class=\"gt_sourcenote\" colspan=\"9\">Source note #1</td>\n    </tr>\n    <tr>\n      <td class=\"gt_sourcenote\" colspan=\"9\">Source note #2</td>\n    </tr>\n  </tfoot>\n  \n</table>"

---

    Code
      .
    Output
      [1] "\\captionsetup[table]{labelformat=empty,skip=1pt}\n\\setlength{\\LTpost}{0mm}\n\\begin{longtable}{r|rlclllrl}\n\\caption*{\n{\\large Data listing from \\textbf{exibble}} \\\\ \n{\\small \\texttt{exibble} is an R dataset}\n} \\\\ \n\\toprule\n\\multicolumn{1}{l}{} &  &  &  & \\multicolumn{3}{c}{timing} &  &  \\\\ \n\\cmidrule(lr){5-7}\n\\multicolumn{1}{l}{S.L.} & num & char & fctr & date & time & datetime & currency & row \\\\ \n\\midrule\n\\multicolumn{1}{l}{grp\\_a} \\\\ \n\\midrule\n & 1.111e-01 & apricot & one & 2015-01-15 & 13:35 & 2018-01-01 02:22 & 49.950 & row\\_1 \\\\ \n & 2.222e+00 & banana & two & 2015-02-15 & 14:40 & 2018-02-02 14:33 & 17.950 & row\\_2 \\\\ \n & 3.333e+01 & coconut & three & 2015-03-15 & 15:45 & 2018-03-03 03:44 & 1.390 & row\\_3 \\\\ \n & 4.444e+02 & durian & four & 2015-04-15 & 16:50 & 2018-04-04 15:55 & 65100.000 & row\\_4 \\\\ \n\\midrule \nmin & $0.11$ & — & — & — & — & — & $1.39$ & — \\\\ \nmax & $444.40$ & — & — & — & — & — & $65100.00$ & — \\\\ \navg & $120.02$ & — & — & — & — & — & $16292.32$ & — \\\\ \n\\midrule\n\\multicolumn{1}{l}{grp\\_b} \\\\ \n\\midrule\n & 5.550e+03 & NA & five & 2015-05-15 & 17:55 & 2018-05-05 04:00 & 1325.810 & row\\_5 \\\\ \n & NA & fig & six & 2015-06-15 & NA & 2018-06-06 16:11 & 13.255 & row\\_6 \\\\ \n & 7.770e+05 & grapefruit & seven & NA & 19:10 & 2018-07-07 05:22 & NA & row\\_7 \\\\ \n & 8.880e+06 & honeydew & eight & 2015-08-15 & 20:20 & NA & 0.440 & row\\_8 \\\\ \n\\midrule \nmin & $5550.00$ & — & — & — & — & — & $0.44$ & — \\\\ \nmax & $8880000.00$ & — & — & — & — & — & $1325.81$ & — \\\\ \navg & $3220850.00$ & — & — & — & — & — & $446.50$ & — \\\\ \n\\midrule \n\\midrule \nmin & $0.11$ & — & — & — & — & — & $0.44$ & — \\\\ \nmax & $8880000.00$ & — & — & — & — & — & $65100.00$ & — \\\\ \navg & $1380432.87$ & — & — & — & — & — & $9501.26$ & — \\\\ \n\\bottomrule\n\\end{longtable}\n\\begin{minipage}{\\linewidth}\nSource note \\#1\\\\\nSource note \\#2\\\\\n\\end{minipage}\n"

---

    Code
      .
    Output
      {\rtf\ansi\ansicpg1252{\fonttbl{\f0\froman\fcharset0\fprq0 Courier New;}{\f1\froman\fcharset0\fprq0 Times;}}{\colortbl;\red51\green51\blue51;\red211\green211\blue211;}
      
      \paperw12240\paperh15840\widowctrl\ftnbj\fet0\sectd\linex0
      \lndscpsxn
      \margl1440\margr1440\margt1440\margb1440
      \headery720\footery720\fs20
      
      \trowd\trrh0\trhdr
      
      \pard\plain\uc0\qc\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx9360
      \intbl {\f0\cf1 {\f0\fs20 Data listing from {\b exibble}} {\f0\fs20\i\super } \line {\f0\fs20 {\f1 exibble} is an R dataset} {\f0\fs20\i\super }}\cell
      \pard\plain
      
      \row
      
      \trowd\trrh0\trhdr
      
      \pard\plain\uc0\qc\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx1040
      \intbl {\f0 {\f0\fs20 }}\cell
      \pard\plain
      
      \pard\plain\uc0\qc\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx2080
      \intbl {\f0 {\f0\fs20 }}\cell
      \pard\plain
      
      \pard\plain\uc0\qc\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx3120
      \intbl {\f0 {\f0\fs20 }}\cell
      \pard\plain
      
      \pard\plain\uc0\qc\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx4160
      \intbl {\f0 {\f0\fs20 }}\cell
      \pard\plain
      
      \pard\plain\uc0\qc\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clmgf\cellx5200
      \intbl {\f0 {\f0\fs20 timing}}\cell
      \pard\plain
      
      \pard\plain\uc0\qc\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clmrg\cellx6240
      \intbl {\f0 {\f0\fs20 timing}}\cell
      \pard\plain
      
      \pard\plain\uc0\qc\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clmrg\cellx7280
      \intbl {\f0 {\f0\fs20 timing}}\cell
      \pard\plain
      
      \pard\plain\uc0\qc\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx8320
      \intbl {\f0 {\f0\fs20 }}\cell
      \pard\plain
      
      \pard\plain\uc0\qc\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx9360
      \intbl {\f0 {\f0\fs20 }}\cell
      \pard\plain
      
      \row
      
      \trowd\trrh0\trhdr
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clbrdrb\brdrs\brdrw40\brdrcf2\cellx1040
      \intbl {\f0 {\f0\fs20 S.L.}}\cell
      \pard\plain
      
      \pard\plain\uc0\qr\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clbrdrb\brdrs\brdrw40\brdrcf2\cellx2080
      \intbl {\f0 {\f0\fs20 num}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clbrdrb\brdrs\brdrw40\brdrcf2\cellx3120
      \intbl {\f0 {\f0\fs20 char}}\cell
      \pard\plain
      
      \pard\plain\uc0\qc\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clbrdrb\brdrs\brdrw40\brdrcf2\cellx4160
      \intbl {\f0 {\f0\fs20 fctr}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clbrdrb\brdrs\brdrw40\brdrcf2\cellx5200
      \intbl {\f0 {\f0\fs20 date}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clbrdrb\brdrs\brdrw40\brdrcf2\cellx6240
      \intbl {\f0 {\f0\fs20 time}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clbrdrb\brdrs\brdrw40\brdrcf2\cellx7280
      \intbl {\f0 {\f0\fs20 datetime}}\cell
      \pard\plain
      
      \pard\plain\uc0\qr\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clbrdrb\brdrs\brdrw40\brdrcf2\cellx8320
      \intbl {\f0 {\f0\fs20 currency}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clbrdrb\brdrs\brdrw40\brdrcf2\cellx9360
      \intbl {\f0 {\f0\fs20 row}}\cell
      \pard\plain
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx9360
      \intbl {\f0\fs20 grp_a}\cell
      \pard\plain
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\qr\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx1040
      \intbl {\f0 {\f0\fs20 }}\cell
      \pard\plain
      
      \pard\plain\uc0\qr\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx2080
      \intbl {\f0 {\f0\fs20 1.111e-01}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx3120
      \intbl {\f0 {\f0\fs20 apricot}}\cell
      \pard\plain
      
      \pard\plain\uc0\qc\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx4160
      \intbl {\f0 {\f0\fs20 one}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx5200
      \intbl {\f0 {\f0\fs20 2015-01-15}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx6240
      \intbl {\f0 {\f0\fs20 13:35}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx7280
      \intbl {\f0 {\f0\fs20 2018-01-01 02:22}}\cell
      \pard\plain
      
      \pard\plain\uc0\qr\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx8320
      \intbl {\f0 {\f0\fs20 49.950}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx9360
      \intbl {\f0 {\f0\fs20 row_1}}\cell
      \pard\plain
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\qr\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx1040
      \intbl {\f0 {\f0\fs20 }}\cell
      \pard\plain
      
      \pard\plain\uc0\qr\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx2080
      \intbl {\f0 {\f0\fs20 2.222e+00}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx3120
      \intbl {\f0 {\f0\fs20 banana}}\cell
      \pard\plain
      
      \pard\plain\uc0\qc\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx4160
      \intbl {\f0 {\f0\fs20 two}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx5200
      \intbl {\f0 {\f0\fs20 2015-02-15}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx6240
      \intbl {\f0 {\f0\fs20 14:40}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx7280
      \intbl {\f0 {\f0\fs20 2018-02-02 14:33}}\cell
      \pard\plain
      
      \pard\plain\uc0\qr\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx8320
      \intbl {\f0 {\f0\fs20 17.950}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx9360
      \intbl {\f0 {\f0\fs20 row_2}}\cell
      \pard\plain
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\qr\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx1040
      \intbl {\f0 {\f0\fs20 }}\cell
      \pard\plain
      
      \pard\plain\uc0\qr\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx2080
      \intbl {\f0 {\f0\fs20 3.333e+01}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx3120
      \intbl {\f0 {\f0\fs20 coconut}}\cell
      \pard\plain
      
      \pard\plain\uc0\qc\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx4160
      \intbl {\f0 {\f0\fs20 three}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx5200
      \intbl {\f0 {\f0\fs20 2015-03-15}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx6240
      \intbl {\f0 {\f0\fs20 15:45}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx7280
      \intbl {\f0 {\f0\fs20 2018-03-03 03:44}}\cell
      \pard\plain
      
      \pard\plain\uc0\qr\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx8320
      \intbl {\f0 {\f0\fs20 1.390}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx9360
      \intbl {\f0 {\f0\fs20 row_3}}\cell
      \pard\plain
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\qr\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx1040
      \intbl {\f0 {\f0\fs20 }}\cell
      \pard\plain
      
      \pard\plain\uc0\qr\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx2080
      \intbl {\f0 {\f0\fs20 4.444e+02}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx3120
      \intbl {\f0 {\f0\fs20 durian}}\cell
      \pard\plain
      
      \pard\plain\uc0\qc\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx4160
      \intbl {\f0 {\f0\fs20 four}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx5200
      \intbl {\f0 {\f0\fs20 2015-04-15}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx6240
      \intbl {\f0 {\f0\fs20 16:50}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx7280
      \intbl {\f0 {\f0\fs20 2018-04-04 15:55}}\cell
      \pard\plain
      
      \pard\plain\uc0\qr\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx8320
      \intbl {\f0 {\f0\fs20 65100.000}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx9360
      \intbl {\f0 {\f0\fs20 row_4}}\cell
      \pard\plain
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\qr\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx1040
      \intbl {\f0 {\f0\fs20 min}}\cell
      \pard\plain
      
      \pard\plain\uc0\qr\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx2080
      \intbl {\f0 {\f0\fs20 0.11}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx3120
      \intbl {\f0 {\f0\fs20 \'97}}\cell
      \pard\plain
      
      \pard\plain\uc0\qc\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx4160
      \intbl {\f0 {\f0\fs20 \'97}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx5200
      \intbl {\f0 {\f0\fs20 \'97}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx6240
      \intbl {\f0 {\f0\fs20 \'97}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx7280
      \intbl {\f0 {\f0\fs20 \'97}}\cell
      \pard\plain
      
      \pard\plain\uc0\qr\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx8320
      \intbl {\f0 {\f0\fs20 1.39}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx9360
      \intbl {\f0 {\f0\fs20 \'97}}\cell
      \pard\plain
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\qr\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx1040
      \intbl {\f0 {\f0\fs20 max}}\cell
      \pard\plain
      
      \pard\plain\uc0\qr\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx2080
      \intbl {\f0 {\f0\fs20 444.40}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx3120
      \intbl {\f0 {\f0\fs20 \'97}}\cell
      \pard\plain
      
      \pard\plain\uc0\qc\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx4160
      \intbl {\f0 {\f0\fs20 \'97}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx5200
      \intbl {\f0 {\f0\fs20 \'97}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx6240
      \intbl {\f0 {\f0\fs20 \'97}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx7280
      \intbl {\f0 {\f0\fs20 \'97}}\cell
      \pard\plain
      
      \pard\plain\uc0\qr\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx8320
      \intbl {\f0 {\f0\fs20 65100.00}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx9360
      \intbl {\f0 {\f0\fs20 \'97}}\cell
      \pard\plain
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\qr\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx1040
      \intbl {\f0 {\f0\fs20 avg}}\cell
      \pard\plain
      
      \pard\plain\uc0\qr\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx2080
      \intbl {\f0 {\f0\fs20 120.02}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx3120
      \intbl {\f0 {\f0\fs20 \'97}}\cell
      \pard\plain
      
      \pard\plain\uc0\qc\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx4160
      \intbl {\f0 {\f0\fs20 \'97}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx5200
      \intbl {\f0 {\f0\fs20 \'97}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx6240
      \intbl {\f0 {\f0\fs20 \'97}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx7280
      \intbl {\f0 {\f0\fs20 \'97}}\cell
      \pard\plain
      
      \pard\plain\uc0\qr\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx8320
      \intbl {\f0 {\f0\fs20 16292.32}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx9360
      \intbl {\f0 {\f0\fs20 \'97}}\cell
      \pard\plain
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx9360
      \intbl {\f0\fs20 grp_b}\cell
      \pard\plain
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\qr\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx1040
      \intbl {\f0 {\f0\fs20 }}\cell
      \pard\plain
      
      \pard\plain\uc0\qr\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx2080
      \intbl {\f0 {\f0\fs20 5.550e+03}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx3120
      \intbl {\f0 {\f0\fs20 NA}}\cell
      \pard\plain
      
      \pard\plain\uc0\qc\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx4160
      \intbl {\f0 {\f0\fs20 five}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx5200
      \intbl {\f0 {\f0\fs20 2015-05-15}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx6240
      \intbl {\f0 {\f0\fs20 17:55}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx7280
      \intbl {\f0 {\f0\fs20 2018-05-05 04:00}}\cell
      \pard\plain
      
      \pard\plain\uc0\qr\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx8320
      \intbl {\f0 {\f0\fs20 1325.810}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx9360
      \intbl {\f0 {\f0\fs20 row_5}}\cell
      \pard\plain
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\qr\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx1040
      \intbl {\f0 {\f0\fs20 }}\cell
      \pard\plain
      
      \pard\plain\uc0\qr\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx2080
      \intbl {\f0 {\f0\fs20 NA}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx3120
      \intbl {\f0 {\f0\fs20 fig}}\cell
      \pard\plain
      
      \pard\plain\uc0\qc\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx4160
      \intbl {\f0 {\f0\fs20 six}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx5200
      \intbl {\f0 {\f0\fs20 2015-06-15}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx6240
      \intbl {\f0 {\f0\fs20 NA}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx7280
      \intbl {\f0 {\f0\fs20 2018-06-06 16:11}}\cell
      \pard\plain
      
      \pard\plain\uc0\qr\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx8320
      \intbl {\f0 {\f0\fs20 13.255}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx9360
      \intbl {\f0 {\f0\fs20 row_6}}\cell
      \pard\plain
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\qr\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx1040
      \intbl {\f0 {\f0\fs20 }}\cell
      \pard\plain
      
      \pard\plain\uc0\qr\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx2080
      \intbl {\f0 {\f0\fs20 7.770e+05}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx3120
      \intbl {\f0 {\f0\fs20 grapefruit}}\cell
      \pard\plain
      
      \pard\plain\uc0\qc\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx4160
      \intbl {\f0 {\f0\fs20 seven}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx5200
      \intbl {\f0 {\f0\fs20 NA}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx6240
      \intbl {\f0 {\f0\fs20 19:10}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx7280
      \intbl {\f0 {\f0\fs20 2018-07-07 05:22}}\cell
      \pard\plain
      
      \pard\plain\uc0\qr\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx8320
      \intbl {\f0 {\f0\fs20 NA}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx9360
      \intbl {\f0 {\f0\fs20 row_7}}\cell
      \pard\plain
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\qr\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx1040
      \intbl {\f0 {\f0\fs20 }}\cell
      \pard\plain
      
      \pard\plain\uc0\qr\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx2080
      \intbl {\f0 {\f0\fs20 8.880e+06}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx3120
      \intbl {\f0 {\f0\fs20 honeydew}}\cell
      \pard\plain
      
      \pard\plain\uc0\qc\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx4160
      \intbl {\f0 {\f0\fs20 eight}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx5200
      \intbl {\f0 {\f0\fs20 2015-08-15}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx6240
      \intbl {\f0 {\f0\fs20 20:20}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx7280
      \intbl {\f0 {\f0\fs20 NA}}\cell
      \pard\plain
      
      \pard\plain\uc0\qr\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx8320
      \intbl {\f0 {\f0\fs20 0.440}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx9360
      \intbl {\f0 {\f0\fs20 row_8}}\cell
      \pard\plain
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\qr\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx1040
      \intbl {\f0 {\f0\fs20 min}}\cell
      \pard\plain
      
      \pard\plain\uc0\qr\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx2080
      \intbl {\f0 {\f0\fs20 5550.00}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx3120
      \intbl {\f0 {\f0\fs20 \'97}}\cell
      \pard\plain
      
      \pard\plain\uc0\qc\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx4160
      \intbl {\f0 {\f0\fs20 \'97}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx5200
      \intbl {\f0 {\f0\fs20 \'97}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx6240
      \intbl {\f0 {\f0\fs20 \'97}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx7280
      \intbl {\f0 {\f0\fs20 \'97}}\cell
      \pard\plain
      
      \pard\plain\uc0\qr\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx8320
      \intbl {\f0 {\f0\fs20 0.44}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx9360
      \intbl {\f0 {\f0\fs20 \'97}}\cell
      \pard\plain
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\qr\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx1040
      \intbl {\f0 {\f0\fs20 max}}\cell
      \pard\plain
      
      \pard\plain\uc0\qr\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx2080
      \intbl {\f0 {\f0\fs20 8880000.00}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx3120
      \intbl {\f0 {\f0\fs20 \'97}}\cell
      \pard\plain
      
      \pard\plain\uc0\qc\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx4160
      \intbl {\f0 {\f0\fs20 \'97}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx5200
      \intbl {\f0 {\f0\fs20 \'97}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx6240
      \intbl {\f0 {\f0\fs20 \'97}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx7280
      \intbl {\f0 {\f0\fs20 \'97}}\cell
      \pard\plain
      
      \pard\plain\uc0\qr\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx8320
      \intbl {\f0 {\f0\fs20 1325.81}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx9360
      \intbl {\f0 {\f0\fs20 \'97}}\cell
      \pard\plain
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\qr\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx1040
      \intbl {\f0 {\f0\fs20 avg}}\cell
      \pard\plain
      
      \pard\plain\uc0\qr\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx2080
      \intbl {\f0 {\f0\fs20 3220850.00}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx3120
      \intbl {\f0 {\f0\fs20 \'97}}\cell
      \pard\plain
      
      \pard\plain\uc0\qc\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx4160
      \intbl {\f0 {\f0\fs20 \'97}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx5200
      \intbl {\f0 {\f0\fs20 \'97}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx6240
      \intbl {\f0 {\f0\fs20 \'97}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx7280
      \intbl {\f0 {\f0\fs20 \'97}}\cell
      \pard\plain
      
      \pard\plain\uc0\qr\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx8320
      \intbl {\f0 {\f0\fs20 446.50}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx9360
      \intbl {\f0 {\f0\fs20 \'97}}\cell
      \pard\plain
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\qr\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx1040
      \intbl {\f0 {\f0\fs20 min}}\cell
      \pard\plain
      
      \pard\plain\uc0\qr\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx2080
      \intbl {\f0 {\f0\fs20 0.11}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx3120
      \intbl {\f0 {\f0\fs20 \'97}}\cell
      \pard\plain
      
      \pard\plain\uc0\qc\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx4160
      \intbl {\f0 {\f0\fs20 \'97}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx5200
      \intbl {\f0 {\f0\fs20 \'97}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx6240
      \intbl {\f0 {\f0\fs20 \'97}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx7280
      \intbl {\f0 {\f0\fs20 \'97}}\cell
      \pard\plain
      
      \pard\plain\uc0\qr\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx8320
      \intbl {\f0 {\f0\fs20 0.44}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx9360
      \intbl {\f0 {\f0\fs20 \'97}}\cell
      \pard\plain
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\qr\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx1040
      \intbl {\f0 {\f0\fs20 max}}\cell
      \pard\plain
      
      \pard\plain\uc0\qr\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx2080
      \intbl {\f0 {\f0\fs20 8880000.00}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx3120
      \intbl {\f0 {\f0\fs20 \'97}}\cell
      \pard\plain
      
      \pard\plain\uc0\qc\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx4160
      \intbl {\f0 {\f0\fs20 \'97}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx5200
      \intbl {\f0 {\f0\fs20 \'97}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx6240
      \intbl {\f0 {\f0\fs20 \'97}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx7280
      \intbl {\f0 {\f0\fs20 \'97}}\cell
      \pard\plain
      
      \pard\plain\uc0\qr\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx8320
      \intbl {\f0 {\f0\fs20 65100.00}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx9360
      \intbl {\f0 {\f0\fs20 \'97}}\cell
      \pard\plain
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\qr\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx1040
      \intbl {\f0 {\f0\fs20 avg}}\cell
      \pard\plain
      
      \pard\plain\uc0\qr\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx2080
      \intbl {\f0 {\f0\fs20 1380432.87}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx3120
      \intbl {\f0 {\f0\fs20 \'97}}\cell
      \pard\plain
      
      \pard\plain\uc0\qc\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx4160
      \intbl {\f0 {\f0\fs20 \'97}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx5200
      \intbl {\f0 {\f0\fs20 \'97}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx6240
      \intbl {\f0 {\f0\fs20 \'97}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx7280
      \intbl {\f0 {\f0\fs20 \'97}}\cell
      \pard\plain
      
      \pard\plain\uc0\qr\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx8320
      \intbl {\f0 {\f0\fs20 9501.26}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx9360
      \intbl {\f0 {\f0\fs20 \'97}}\cell
      \pard\plain
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx9360
      \intbl {\f0 {\f0\fs20 Source note #1\line Source note #2}}\cell
      \pard\plain
      
      \row
      
      }

---

    Code
      .
    Output
      [1] "<table class=\"gt_table\">\n  <thead class=\"gt_header\">\n    <tr>\n      <th colspan=\"9\" class=\"gt_heading gt_title gt_font_normal\" style>Data listing from <strong>exibble</strong></th>\n    </tr>\n    <tr>\n      <th colspan=\"9\" class=\"gt_heading gt_subtitle gt_font_normal gt_bottom_border\" style><code>exibble</code> is an R dataset</th>\n    </tr>\n  </thead>\n  <thead class=\"gt_col_headings\">\n    <tr>\n      <th class=\"gt_col_heading gt_columns_bottom_border gt_left\" rowspan=\"2\" colspan=\"1\">S.L.</th>\n      <th class=\"gt_col_heading gt_columns_bottom_border gt_right\" rowspan=\"2\" colspan=\"1\">num</th>\n      <th class=\"gt_col_heading gt_columns_bottom_border gt_left\" rowspan=\"2\" colspan=\"1\">char</th>\n      <th class=\"gt_col_heading gt_columns_bottom_border gt_center\" rowspan=\"2\" colspan=\"1\">fctr</th>\n      <th class=\"gt_center gt_columns_top_border gt_column_spanner_outer\" rowspan=\"1\" colspan=\"3\">\n        <span class=\"gt_column_spanner\">timing</span>\n      </th>\n      <th class=\"gt_col_heading gt_columns_bottom_border gt_right\" rowspan=\"2\" colspan=\"1\">currency</th>\n      <th class=\"gt_col_heading gt_columns_bottom_border gt_left\" rowspan=\"2\" colspan=\"1\">row</th>\n    </tr>\n    <tr>\n      <th class=\"gt_col_heading gt_columns_bottom_border gt_left\" rowspan=\"1\" colspan=\"1\">date</th>\n      <th class=\"gt_col_heading gt_columns_bottom_border gt_left\" rowspan=\"1\" colspan=\"1\">time</th>\n      <th class=\"gt_col_heading gt_columns_bottom_border gt_left\" rowspan=\"1\" colspan=\"1\">datetime</th>\n    </tr>\n  </thead>\n  <tbody class=\"gt_table_body\">\n    <tr class=\"gt_row_group_first\"><td rowspan=\"4\" class=\"gt_row gt_right gt_stub_row_group\">grp_a</td>\n<td class=\"gt_row gt_right\">1.111e-01</td>\n<td class=\"gt_row gt_left\">apricot</td>\n<td class=\"gt_row gt_center\">one</td>\n<td class=\"gt_row gt_left\">2015-01-15</td>\n<td class=\"gt_row gt_left\">13:35</td>\n<td class=\"gt_row gt_left\">2018-01-01 02:22</td>\n<td class=\"gt_row gt_right\">49.950</td>\n<td class=\"gt_row gt_left\">row_1</td></tr>\n    <tr><td class=\"gt_row gt_right\">2.222e+00</td>\n<td class=\"gt_row gt_left\">banana</td>\n<td class=\"gt_row gt_center\">two</td>\n<td class=\"gt_row gt_left\">2015-02-15</td>\n<td class=\"gt_row gt_left\">14:40</td>\n<td class=\"gt_row gt_left\">2018-02-02 14:33</td>\n<td class=\"gt_row gt_right\">17.950</td>\n<td class=\"gt_row gt_left\">row_2</td></tr>\n    <tr><td class=\"gt_row gt_right\">3.333e+01</td>\n<td class=\"gt_row gt_left\">coconut</td>\n<td class=\"gt_row gt_center\">three</td>\n<td class=\"gt_row gt_left\">2015-03-15</td>\n<td class=\"gt_row gt_left\">15:45</td>\n<td class=\"gt_row gt_left\">2018-03-03 03:44</td>\n<td class=\"gt_row gt_right\">1.390</td>\n<td class=\"gt_row gt_left\">row_3</td></tr>\n    <tr><td class=\"gt_row gt_right\">4.444e+02</td>\n<td class=\"gt_row gt_left\">durian</td>\n<td class=\"gt_row gt_center\">four</td>\n<td class=\"gt_row gt_left\">2015-04-15</td>\n<td class=\"gt_row gt_left\">16:50</td>\n<td class=\"gt_row gt_left\">2018-04-04 15:55</td>\n<td class=\"gt_row gt_right\">65100.000</td>\n<td class=\"gt_row gt_left\">row_4</td></tr>\n    <tr><td class=\"gt_row gt_right gt_stub gt_summary_row gt_first_summary_row\">min</td>\n<td class=\"gt_row gt_right gt_summary_row gt_first_summary_row\">0.11</td>\n<td class=\"gt_row gt_left gt_summary_row gt_first_summary_row\">&mdash;</td>\n<td class=\"gt_row gt_center gt_summary_row gt_first_summary_row\">&mdash;</td>\n<td class=\"gt_row gt_left gt_summary_row gt_first_summary_row\">&mdash;</td>\n<td class=\"gt_row gt_left gt_summary_row gt_first_summary_row\">&mdash;</td>\n<td class=\"gt_row gt_left gt_summary_row gt_first_summary_row\">&mdash;</td>\n<td class=\"gt_row gt_right gt_summary_row gt_first_summary_row\">1.39</td>\n<td class=\"gt_row gt_left gt_summary_row gt_first_summary_row\">&mdash;</td></tr>\n    <tr><td class=\"gt_row gt_right gt_stub gt_summary_row\">max</td>\n<td class=\"gt_row gt_right gt_summary_row\">444.40</td>\n<td class=\"gt_row gt_left gt_summary_row\">&mdash;</td>\n<td class=\"gt_row gt_center gt_summary_row\">&mdash;</td>\n<td class=\"gt_row gt_left gt_summary_row\">&mdash;</td>\n<td class=\"gt_row gt_left gt_summary_row\">&mdash;</td>\n<td class=\"gt_row gt_left gt_summary_row\">&mdash;</td>\n<td class=\"gt_row gt_right gt_summary_row\">65100.00</td>\n<td class=\"gt_row gt_left gt_summary_row\">&mdash;</td></tr>\n    <tr><td class=\"gt_row gt_right gt_stub gt_summary_row gt_last_summary_row\">avg</td>\n<td class=\"gt_row gt_right gt_summary_row gt_last_summary_row\">120.02</td>\n<td class=\"gt_row gt_left gt_summary_row gt_last_summary_row\">&mdash;</td>\n<td class=\"gt_row gt_center gt_summary_row gt_last_summary_row\">&mdash;</td>\n<td class=\"gt_row gt_left gt_summary_row gt_last_summary_row\">&mdash;</td>\n<td class=\"gt_row gt_left gt_summary_row gt_last_summary_row\">&mdash;</td>\n<td class=\"gt_row gt_left gt_summary_row gt_last_summary_row\">&mdash;</td>\n<td class=\"gt_row gt_right gt_summary_row gt_last_summary_row\">16292.32</td>\n<td class=\"gt_row gt_left gt_summary_row gt_last_summary_row\">&mdash;</td></tr>\n    <tr class=\"gt_row_group_first\"><td rowspan=\"4\" class=\"gt_row gt_right gt_stub_row_group\">grp_b</td>\n<td class=\"gt_row gt_right\">5.550e+03</td>\n<td class=\"gt_row gt_left\">NA</td>\n<td class=\"gt_row gt_center\">five</td>\n<td class=\"gt_row gt_left\">2015-05-15</td>\n<td class=\"gt_row gt_left\">17:55</td>\n<td class=\"gt_row gt_left\">2018-05-05 04:00</td>\n<td class=\"gt_row gt_right\">1325.810</td>\n<td class=\"gt_row gt_left\">row_5</td></tr>\n    <tr><td class=\"gt_row gt_right\">NA</td>\n<td class=\"gt_row gt_left\">fig</td>\n<td class=\"gt_row gt_center\">six</td>\n<td class=\"gt_row gt_left\">2015-06-15</td>\n<td class=\"gt_row gt_left\">NA</td>\n<td class=\"gt_row gt_left\">2018-06-06 16:11</td>\n<td class=\"gt_row gt_right\">13.255</td>\n<td class=\"gt_row gt_left\">row_6</td></tr>\n    <tr><td class=\"gt_row gt_right\">7.770e+05</td>\n<td class=\"gt_row gt_left\">grapefruit</td>\n<td class=\"gt_row gt_center\">seven</td>\n<td class=\"gt_row gt_left\">NA</td>\n<td class=\"gt_row gt_left\">19:10</td>\n<td class=\"gt_row gt_left\">2018-07-07 05:22</td>\n<td class=\"gt_row gt_right\">NA</td>\n<td class=\"gt_row gt_left\">row_7</td></tr>\n    <tr><td class=\"gt_row gt_right\">8.880e+06</td>\n<td class=\"gt_row gt_left\">honeydew</td>\n<td class=\"gt_row gt_center\">eight</td>\n<td class=\"gt_row gt_left\">2015-08-15</td>\n<td class=\"gt_row gt_left\">20:20</td>\n<td class=\"gt_row gt_left\">NA</td>\n<td class=\"gt_row gt_right\">0.440</td>\n<td class=\"gt_row gt_left\">row_8</td></tr>\n    <tr><td class=\"gt_row gt_right gt_stub gt_summary_row gt_first_summary_row\">min</td>\n<td class=\"gt_row gt_right gt_summary_row gt_first_summary_row\">5550.00</td>\n<td class=\"gt_row gt_left gt_summary_row gt_first_summary_row\">&mdash;</td>\n<td class=\"gt_row gt_center gt_summary_row gt_first_summary_row\">&mdash;</td>\n<td class=\"gt_row gt_left gt_summary_row gt_first_summary_row\">&mdash;</td>\n<td class=\"gt_row gt_left gt_summary_row gt_first_summary_row\">&mdash;</td>\n<td class=\"gt_row gt_left gt_summary_row gt_first_summary_row\">&mdash;</td>\n<td class=\"gt_row gt_right gt_summary_row gt_first_summary_row\">0.44</td>\n<td class=\"gt_row gt_left gt_summary_row gt_first_summary_row\">&mdash;</td></tr>\n    <tr><td class=\"gt_row gt_right gt_stub gt_summary_row\">max</td>\n<td class=\"gt_row gt_right gt_summary_row\">8880000.00</td>\n<td class=\"gt_row gt_left gt_summary_row\">&mdash;</td>\n<td class=\"gt_row gt_center gt_summary_row\">&mdash;</td>\n<td class=\"gt_row gt_left gt_summary_row\">&mdash;</td>\n<td class=\"gt_row gt_left gt_summary_row\">&mdash;</td>\n<td class=\"gt_row gt_left gt_summary_row\">&mdash;</td>\n<td class=\"gt_row gt_right gt_summary_row\">1325.81</td>\n<td class=\"gt_row gt_left gt_summary_row\">&mdash;</td></tr>\n    <tr><td class=\"gt_row gt_right gt_stub gt_summary_row gt_last_summary_row\">avg</td>\n<td class=\"gt_row gt_right gt_summary_row gt_last_summary_row\">3220850.00</td>\n<td class=\"gt_row gt_left gt_summary_row gt_last_summary_row\">&mdash;</td>\n<td class=\"gt_row gt_center gt_summary_row gt_last_summary_row\">&mdash;</td>\n<td class=\"gt_row gt_left gt_summary_row gt_last_summary_row\">&mdash;</td>\n<td class=\"gt_row gt_left gt_summary_row gt_last_summary_row\">&mdash;</td>\n<td class=\"gt_row gt_left gt_summary_row gt_last_summary_row\">&mdash;</td>\n<td class=\"gt_row gt_right gt_summary_row gt_last_summary_row\">446.50</td>\n<td class=\"gt_row gt_left gt_summary_row gt_last_summary_row\">&mdash;</td></tr>\n    <tr><td class=\"gt_row gt_right gt_stub gt_grand_summary_row gt_first_grand_summary_row\">min</td>\n<td class=\"gt_row gt_right gt_grand_summary_row gt_first_grand_summary_row\">0.11</td>\n<td class=\"gt_row gt_left gt_grand_summary_row gt_first_grand_summary_row\">&mdash;</td>\n<td class=\"gt_row gt_center gt_grand_summary_row gt_first_grand_summary_row\">&mdash;</td>\n<td class=\"gt_row gt_left gt_grand_summary_row gt_first_grand_summary_row\">&mdash;</td>\n<td class=\"gt_row gt_left gt_grand_summary_row gt_first_grand_summary_row\">&mdash;</td>\n<td class=\"gt_row gt_left gt_grand_summary_row gt_first_grand_summary_row\">&mdash;</td>\n<td class=\"gt_row gt_right gt_grand_summary_row gt_first_grand_summary_row\">0.44</td>\n<td class=\"gt_row gt_left gt_grand_summary_row gt_first_grand_summary_row\">&mdash;</td></tr>\n    <tr><td class=\"gt_row gt_right gt_stub gt_grand_summary_row\">max</td>\n<td class=\"gt_row gt_right gt_grand_summary_row\">8880000.00</td>\n<td class=\"gt_row gt_left gt_grand_summary_row\">&mdash;</td>\n<td class=\"gt_row gt_center gt_grand_summary_row\">&mdash;</td>\n<td class=\"gt_row gt_left gt_grand_summary_row\">&mdash;</td>\n<td class=\"gt_row gt_left gt_grand_summary_row\">&mdash;</td>\n<td class=\"gt_row gt_left gt_grand_summary_row\">&mdash;</td>\n<td class=\"gt_row gt_right gt_grand_summary_row\">65100.00</td>\n<td class=\"gt_row gt_left gt_grand_summary_row\">&mdash;</td></tr>\n    <tr><td class=\"gt_row gt_right gt_stub gt_grand_summary_row gt_last_summary_row\">avg</td>\n<td class=\"gt_row gt_right gt_grand_summary_row gt_last_summary_row\">1380432.87</td>\n<td class=\"gt_row gt_left gt_grand_summary_row gt_last_summary_row\">&mdash;</td>\n<td class=\"gt_row gt_center gt_grand_summary_row gt_last_summary_row\">&mdash;</td>\n<td class=\"gt_row gt_left gt_grand_summary_row gt_last_summary_row\">&mdash;</td>\n<td class=\"gt_row gt_left gt_grand_summary_row gt_last_summary_row\">&mdash;</td>\n<td class=\"gt_row gt_left gt_grand_summary_row gt_last_summary_row\">&mdash;</td>\n<td class=\"gt_row gt_right gt_grand_summary_row gt_last_summary_row\">9501.26</td>\n<td class=\"gt_row gt_left gt_grand_summary_row gt_last_summary_row\">&mdash;</td></tr>\n  </tbody>\n  <tfoot class=\"gt_sourcenotes\">\n    <tr>\n      <td class=\"gt_sourcenote\" colspan=\"9\">Source note #1</td>\n    </tr>\n    <tr>\n      <td class=\"gt_sourcenote\" colspan=\"9\">Source note #2</td>\n    </tr>\n  </tfoot>\n  \n</table>"

---

    Code
      .
    Output
      [1] "\\captionsetup[table]{labelformat=empty,skip=1pt}\n\\setlength{\\LTpost}{0mm}\n\\begin{longtable}{r|rlclllrl}\n\\caption*{\n{\\large Data listing from \\textbf{exibble}} \\\\ \n{\\small \\texttt{exibble} is an R dataset}\n} \\\\ \n\\toprule\n\\multicolumn{1}{l}{} &  &  &  & \\multicolumn{3}{c}{timing} &  &  \\\\ \n\\cmidrule(lr){5-7}\n\\multicolumn{1}{l}{S.L.} & num & char & fctr & date & time & datetime & currency & row \\\\ \n\\midrule\ngrp\\_a & 1.111e-01 & apricot & one & 2015-01-15 & 13:35 & 2018-01-01 02:22 & 49.950 & row\\_1 \\\\ \n & 2.222e+00 & banana & two & 2015-02-15 & 14:40 & 2018-02-02 14:33 & 17.950 & row\\_2 \\\\ \n & 3.333e+01 & coconut & three & 2015-03-15 & 15:45 & 2018-03-03 03:44 & 1.390 & row\\_3 \\\\ \n & 4.444e+02 & durian & four & 2015-04-15 & 16:50 & 2018-04-04 15:55 & 65100.000 & row\\_4 \\\\ \n\\midrule \nmin & $0.11$ & — & — & — & — & — & $1.39$ & — \\\\ \nmax & $444.40$ & — & — & — & — & — & $65100.00$ & — \\\\ \navg & $120.02$ & — & — & — & — & — & $16292.32$ & — \\\\ \n\\midrule\ngrp\\_b & 5.550e+03 & NA & five & 2015-05-15 & 17:55 & 2018-05-05 04:00 & 1325.810 & row\\_5 \\\\ \n & NA & fig & six & 2015-06-15 & NA & 2018-06-06 16:11 & 13.255 & row\\_6 \\\\ \n & 7.770e+05 & grapefruit & seven & NA & 19:10 & 2018-07-07 05:22 & NA & row\\_7 \\\\ \n & 8.880e+06 & honeydew & eight & 2015-08-15 & 20:20 & NA & 0.440 & row\\_8 \\\\ \n\\midrule \nmin & $5550.00$ & — & — & — & — & — & $0.44$ & — \\\\ \nmax & $8880000.00$ & — & — & — & — & — & $1325.81$ & — \\\\ \navg & $3220850.00$ & — & — & — & — & — & $446.50$ & — \\\\ \n\\midrule \n\\midrule \nmin & $0.11$ & — & — & — & — & — & $0.44$ & — \\\\ \nmax & $8880000.00$ & — & — & — & — & — & $65100.00$ & — \\\\ \navg & $1380432.87$ & — & — & — & — & — & $9501.26$ & — \\\\ \n\\bottomrule\n\\end{longtable}\n\\begin{minipage}{\\linewidth}\nSource note \\#1\\\\\nSource note \\#2\\\\\n\\end{minipage}\n"

---

    Code
      .
    Output
      {\rtf\ansi\ansicpg1252{\fonttbl{\f0\froman\fcharset0\fprq0 Courier New;}{\f1\froman\fcharset0\fprq0 Times;}}{\colortbl;\red51\green51\blue51;\red211\green211\blue211;}
      
      \paperw12240\paperh15840\widowctrl\ftnbj\fet0\sectd\linex0
      \lndscpsxn
      \margl1440\margr1440\margt1440\margb1440
      \headery720\footery720\fs20
      
      \trowd\trrh0\trhdr
      
      \pard\plain\uc0\qc\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx9360
      \intbl {\f0\cf1 {\f0\fs20 Data listing from {\b exibble}} {\f0\fs20\i\super } \line {\f0\fs20 {\f1 exibble} is an R dataset} {\f0\fs20\i\super }}\cell
      \pard\plain
      
      \row
      
      \trowd\trrh0\trhdr
      
      \pard\plain\uc0\qc\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx1040
      \intbl {\f0 {\f0\fs20 }}\cell
      \pard\plain
      
      \pard\plain\uc0\qc\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx2080
      \intbl {\f0 {\f0\fs20 }}\cell
      \pard\plain
      
      \pard\plain\uc0\qc\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx3120
      \intbl {\f0 {\f0\fs20 }}\cell
      \pard\plain
      
      \pard\plain\uc0\qc\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx4160
      \intbl {\f0 {\f0\fs20 }}\cell
      \pard\plain
      
      \pard\plain\uc0\qc\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clmgf\cellx5200
      \intbl {\f0 {\f0\fs20 timing}}\cell
      \pard\plain
      
      \pard\plain\uc0\qc\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clmrg\cellx6240
      \intbl {\f0 {\f0\fs20 timing}}\cell
      \pard\plain
      
      \pard\plain\uc0\qc\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clmrg\cellx7280
      \intbl {\f0 {\f0\fs20 timing}}\cell
      \pard\plain
      
      \pard\plain\uc0\qc\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx8320
      \intbl {\f0 {\f0\fs20 }}\cell
      \pard\plain
      
      \pard\plain\uc0\qc\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx9360
      \intbl {\f0 {\f0\fs20 }}\cell
      \pard\plain
      
      \row
      
      \trowd\trrh0\trhdr
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clbrdrb\brdrs\brdrw40\brdrcf2\cellx1040
      \intbl {\f0 {\f0\fs20 S.L.}}\cell
      \pard\plain
      
      \pard\plain\uc0\qr\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clbrdrb\brdrs\brdrw40\brdrcf2\cellx2080
      \intbl {\f0 {\f0\fs20 num}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clbrdrb\brdrs\brdrw40\brdrcf2\cellx3120
      \intbl {\f0 {\f0\fs20 char}}\cell
      \pard\plain
      
      \pard\plain\uc0\qc\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clbrdrb\brdrs\brdrw40\brdrcf2\cellx4160
      \intbl {\f0 {\f0\fs20 fctr}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clbrdrb\brdrs\brdrw40\brdrcf2\cellx5200
      \intbl {\f0 {\f0\fs20 date}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clbrdrb\brdrs\brdrw40\brdrcf2\cellx6240
      \intbl {\f0 {\f0\fs20 time}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clbrdrb\brdrs\brdrw40\brdrcf2\cellx7280
      \intbl {\f0 {\f0\fs20 datetime}}\cell
      \pard\plain
      
      \pard\plain\uc0\qr\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clbrdrb\brdrs\brdrw40\brdrcf2\cellx8320
      \intbl {\f0 {\f0\fs20 currency}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clbrdrb\brdrs\brdrw40\brdrcf2\cellx9360
      \intbl {\f0 {\f0\fs20 row}}\cell
      \pard\plain
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\qr\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx1040
      \intbl {\f0 {\f0\fs20 grp_a}}\cell
      \pard\plain
      
      \pard\plain\uc0\qr\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx2080
      \intbl {\f0 {\f0\fs20 1.111e-01}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx3120
      \intbl {\f0 {\f0\fs20 apricot}}\cell
      \pard\plain
      
      \pard\plain\uc0\qc\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx4160
      \intbl {\f0 {\f0\fs20 one}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx5200
      \intbl {\f0 {\f0\fs20 2015-01-15}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx6240
      \intbl {\f0 {\f0\fs20 13:35}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx7280
      \intbl {\f0 {\f0\fs20 2018-01-01 02:22}}\cell
      \pard\plain
      
      \pard\plain\uc0\qr\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx8320
      \intbl {\f0 {\f0\fs20 49.950}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx9360
      \intbl {\f0 {\f0\fs20 row_1}}\cell
      \pard\plain
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\qr\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx1040
      \intbl {\f0 {\f0\fs20 }}\cell
      \pard\plain
      
      \pard\plain\uc0\qr\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx2080
      \intbl {\f0 {\f0\fs20 2.222e+00}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx3120
      \intbl {\f0 {\f0\fs20 banana}}\cell
      \pard\plain
      
      \pard\plain\uc0\qc\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx4160
      \intbl {\f0 {\f0\fs20 two}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx5200
      \intbl {\f0 {\f0\fs20 2015-02-15}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx6240
      \intbl {\f0 {\f0\fs20 14:40}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx7280
      \intbl {\f0 {\f0\fs20 2018-02-02 14:33}}\cell
      \pard\plain
      
      \pard\plain\uc0\qr\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx8320
      \intbl {\f0 {\f0\fs20 17.950}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx9360
      \intbl {\f0 {\f0\fs20 row_2}}\cell
      \pard\plain
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\qr\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx1040
      \intbl {\f0 {\f0\fs20 }}\cell
      \pard\plain
      
      \pard\plain\uc0\qr\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx2080
      \intbl {\f0 {\f0\fs20 3.333e+01}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx3120
      \intbl {\f0 {\f0\fs20 coconut}}\cell
      \pard\plain
      
      \pard\plain\uc0\qc\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx4160
      \intbl {\f0 {\f0\fs20 three}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx5200
      \intbl {\f0 {\f0\fs20 2015-03-15}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx6240
      \intbl {\f0 {\f0\fs20 15:45}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx7280
      \intbl {\f0 {\f0\fs20 2018-03-03 03:44}}\cell
      \pard\plain
      
      \pard\plain\uc0\qr\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx8320
      \intbl {\f0 {\f0\fs20 1.390}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx9360
      \intbl {\f0 {\f0\fs20 row_3}}\cell
      \pard\plain
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\qr\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx1040
      \intbl {\f0 {\f0\fs20 }}\cell
      \pard\plain
      
      \pard\plain\uc0\qr\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx2080
      \intbl {\f0 {\f0\fs20 4.444e+02}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx3120
      \intbl {\f0 {\f0\fs20 durian}}\cell
      \pard\plain
      
      \pard\plain\uc0\qc\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx4160
      \intbl {\f0 {\f0\fs20 four}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx5200
      \intbl {\f0 {\f0\fs20 2015-04-15}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx6240
      \intbl {\f0 {\f0\fs20 16:50}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx7280
      \intbl {\f0 {\f0\fs20 2018-04-04 15:55}}\cell
      \pard\plain
      
      \pard\plain\uc0\qr\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx8320
      \intbl {\f0 {\f0\fs20 65100.000}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx9360
      \intbl {\f0 {\f0\fs20 row_4}}\cell
      \pard\plain
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\qr\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx1040
      \intbl {\f0 {\f0\fs20 min}}\cell
      \pard\plain
      
      \pard\plain\uc0\qr\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx2080
      \intbl {\f0 {\f0\fs20 0.11}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx3120
      \intbl {\f0 {\f0\fs20 \'97}}\cell
      \pard\plain
      
      \pard\plain\uc0\qc\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx4160
      \intbl {\f0 {\f0\fs20 \'97}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx5200
      \intbl {\f0 {\f0\fs20 \'97}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx6240
      \intbl {\f0 {\f0\fs20 \'97}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx7280
      \intbl {\f0 {\f0\fs20 \'97}}\cell
      \pard\plain
      
      \pard\plain\uc0\qr\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx8320
      \intbl {\f0 {\f0\fs20 1.39}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx9360
      \intbl {\f0 {\f0\fs20 \'97}}\cell
      \pard\plain
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\qr\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx1040
      \intbl {\f0 {\f0\fs20 max}}\cell
      \pard\plain
      
      \pard\plain\uc0\qr\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx2080
      \intbl {\f0 {\f0\fs20 444.40}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx3120
      \intbl {\f0 {\f0\fs20 \'97}}\cell
      \pard\plain
      
      \pard\plain\uc0\qc\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx4160
      \intbl {\f0 {\f0\fs20 \'97}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx5200
      \intbl {\f0 {\f0\fs20 \'97}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx6240
      \intbl {\f0 {\f0\fs20 \'97}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx7280
      \intbl {\f0 {\f0\fs20 \'97}}\cell
      \pard\plain
      
      \pard\plain\uc0\qr\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx8320
      \intbl {\f0 {\f0\fs20 65100.00}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx9360
      \intbl {\f0 {\f0\fs20 \'97}}\cell
      \pard\plain
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\qr\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx1040
      \intbl {\f0 {\f0\fs20 avg}}\cell
      \pard\plain
      
      \pard\plain\uc0\qr\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx2080
      \intbl {\f0 {\f0\fs20 120.02}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx3120
      \intbl {\f0 {\f0\fs20 \'97}}\cell
      \pard\plain
      
      \pard\plain\uc0\qc\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx4160
      \intbl {\f0 {\f0\fs20 \'97}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx5200
      \intbl {\f0 {\f0\fs20 \'97}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx6240
      \intbl {\f0 {\f0\fs20 \'97}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx7280
      \intbl {\f0 {\f0\fs20 \'97}}\cell
      \pard\plain
      
      \pard\plain\uc0\qr\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx8320
      \intbl {\f0 {\f0\fs20 16292.32}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx9360
      \intbl {\f0 {\f0\fs20 \'97}}\cell
      \pard\plain
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\qr\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx1040
      \intbl {\f0 {\f0\fs20 grp_b}}\cell
      \pard\plain
      
      \pard\plain\uc0\qr\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx2080
      \intbl {\f0 {\f0\fs20 5.550e+03}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx3120
      \intbl {\f0 {\f0\fs20 NA}}\cell
      \pard\plain
      
      \pard\plain\uc0\qc\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx4160
      \intbl {\f0 {\f0\fs20 five}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx5200
      \intbl {\f0 {\f0\fs20 2015-05-15}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx6240
      \intbl {\f0 {\f0\fs20 17:55}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx7280
      \intbl {\f0 {\f0\fs20 2018-05-05 04:00}}\cell
      \pard\plain
      
      \pard\plain\uc0\qr\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx8320
      \intbl {\f0 {\f0\fs20 1325.810}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx9360
      \intbl {\f0 {\f0\fs20 row_5}}\cell
      \pard\plain
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\qr\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx1040
      \intbl {\f0 {\f0\fs20 }}\cell
      \pard\plain
      
      \pard\plain\uc0\qr\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx2080
      \intbl {\f0 {\f0\fs20 NA}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx3120
      \intbl {\f0 {\f0\fs20 fig}}\cell
      \pard\plain
      
      \pard\plain\uc0\qc\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx4160
      \intbl {\f0 {\f0\fs20 six}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx5200
      \intbl {\f0 {\f0\fs20 2015-06-15}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx6240
      \intbl {\f0 {\f0\fs20 NA}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx7280
      \intbl {\f0 {\f0\fs20 2018-06-06 16:11}}\cell
      \pard\plain
      
      \pard\plain\uc0\qr\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx8320
      \intbl {\f0 {\f0\fs20 13.255}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx9360
      \intbl {\f0 {\f0\fs20 row_6}}\cell
      \pard\plain
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\qr\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx1040
      \intbl {\f0 {\f0\fs20 }}\cell
      \pard\plain
      
      \pard\plain\uc0\qr\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx2080
      \intbl {\f0 {\f0\fs20 7.770e+05}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx3120
      \intbl {\f0 {\f0\fs20 grapefruit}}\cell
      \pard\plain
      
      \pard\plain\uc0\qc\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx4160
      \intbl {\f0 {\f0\fs20 seven}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx5200
      \intbl {\f0 {\f0\fs20 NA}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx6240
      \intbl {\f0 {\f0\fs20 19:10}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx7280
      \intbl {\f0 {\f0\fs20 2018-07-07 05:22}}\cell
      \pard\plain
      
      \pard\plain\uc0\qr\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx8320
      \intbl {\f0 {\f0\fs20 NA}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx9360
      \intbl {\f0 {\f0\fs20 row_7}}\cell
      \pard\plain
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\qr\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx1040
      \intbl {\f0 {\f0\fs20 }}\cell
      \pard\plain
      
      \pard\plain\uc0\qr\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx2080
      \intbl {\f0 {\f0\fs20 8.880e+06}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx3120
      \intbl {\f0 {\f0\fs20 honeydew}}\cell
      \pard\plain
      
      \pard\plain\uc0\qc\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx4160
      \intbl {\f0 {\f0\fs20 eight}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx5200
      \intbl {\f0 {\f0\fs20 2015-08-15}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx6240
      \intbl {\f0 {\f0\fs20 20:20}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx7280
      \intbl {\f0 {\f0\fs20 NA}}\cell
      \pard\plain
      
      \pard\plain\uc0\qr\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx8320
      \intbl {\f0 {\f0\fs20 0.440}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx9360
      \intbl {\f0 {\f0\fs20 row_8}}\cell
      \pard\plain
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\qr\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx1040
      \intbl {\f0 {\f0\fs20 min}}\cell
      \pard\plain
      
      \pard\plain\uc0\qr\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx2080
      \intbl {\f0 {\f0\fs20 5550.00}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx3120
      \intbl {\f0 {\f0\fs20 \'97}}\cell
      \pard\plain
      
      \pard\plain\uc0\qc\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx4160
      \intbl {\f0 {\f0\fs20 \'97}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx5200
      \intbl {\f0 {\f0\fs20 \'97}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx6240
      \intbl {\f0 {\f0\fs20 \'97}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx7280
      \intbl {\f0 {\f0\fs20 \'97}}\cell
      \pard\plain
      
      \pard\plain\uc0\qr\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx8320
      \intbl {\f0 {\f0\fs20 0.44}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx9360
      \intbl {\f0 {\f0\fs20 \'97}}\cell
      \pard\plain
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\qr\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx1040
      \intbl {\f0 {\f0\fs20 max}}\cell
      \pard\plain
      
      \pard\plain\uc0\qr\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx2080
      \intbl {\f0 {\f0\fs20 8880000.00}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx3120
      \intbl {\f0 {\f0\fs20 \'97}}\cell
      \pard\plain
      
      \pard\plain\uc0\qc\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx4160
      \intbl {\f0 {\f0\fs20 \'97}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx5200
      \intbl {\f0 {\f0\fs20 \'97}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx6240
      \intbl {\f0 {\f0\fs20 \'97}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx7280
      \intbl {\f0 {\f0\fs20 \'97}}\cell
      \pard\plain
      
      \pard\plain\uc0\qr\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx8320
      \intbl {\f0 {\f0\fs20 1325.81}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx9360
      \intbl {\f0 {\f0\fs20 \'97}}\cell
      \pard\plain
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\qr\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx1040
      \intbl {\f0 {\f0\fs20 avg}}\cell
      \pard\plain
      
      \pard\plain\uc0\qr\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx2080
      \intbl {\f0 {\f0\fs20 3220850.00}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx3120
      \intbl {\f0 {\f0\fs20 \'97}}\cell
      \pard\plain
      
      \pard\plain\uc0\qc\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx4160
      \intbl {\f0 {\f0\fs20 \'97}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx5200
      \intbl {\f0 {\f0\fs20 \'97}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx6240
      \intbl {\f0 {\f0\fs20 \'97}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx7280
      \intbl {\f0 {\f0\fs20 \'97}}\cell
      \pard\plain
      
      \pard\plain\uc0\qr\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx8320
      \intbl {\f0 {\f0\fs20 446.50}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx9360
      \intbl {\f0 {\f0\fs20 \'97}}\cell
      \pard\plain
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\qr\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx1040
      \intbl {\f0 {\f0\fs20 min}}\cell
      \pard\plain
      
      \pard\plain\uc0\qr\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx2080
      \intbl {\f0 {\f0\fs20 0.11}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx3120
      \intbl {\f0 {\f0\fs20 \'97}}\cell
      \pard\plain
      
      \pard\plain\uc0\qc\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx4160
      \intbl {\f0 {\f0\fs20 \'97}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx5200
      \intbl {\f0 {\f0\fs20 \'97}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx6240
      \intbl {\f0 {\f0\fs20 \'97}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx7280
      \intbl {\f0 {\f0\fs20 \'97}}\cell
      \pard\plain
      
      \pard\plain\uc0\qr\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx8320
      \intbl {\f0 {\f0\fs20 0.44}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx9360
      \intbl {\f0 {\f0\fs20 \'97}}\cell
      \pard\plain
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\qr\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx1040
      \intbl {\f0 {\f0\fs20 max}}\cell
      \pard\plain
      
      \pard\plain\uc0\qr\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx2080
      \intbl {\f0 {\f0\fs20 8880000.00}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx3120
      \intbl {\f0 {\f0\fs20 \'97}}\cell
      \pard\plain
      
      \pard\plain\uc0\qc\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx4160
      \intbl {\f0 {\f0\fs20 \'97}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx5200
      \intbl {\f0 {\f0\fs20 \'97}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx6240
      \intbl {\f0 {\f0\fs20 \'97}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx7280
      \intbl {\f0 {\f0\fs20 \'97}}\cell
      \pard\plain
      
      \pard\plain\uc0\qr\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx8320
      \intbl {\f0 {\f0\fs20 65100.00}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx9360
      \intbl {\f0 {\f0\fs20 \'97}}\cell
      \pard\plain
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\qr\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx1040
      \intbl {\f0 {\f0\fs20 avg}}\cell
      \pard\plain
      
      \pard\plain\uc0\qr\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx2080
      \intbl {\f0 {\f0\fs20 1380432.87}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx3120
      \intbl {\f0 {\f0\fs20 \'97}}\cell
      \pard\plain
      
      \pard\plain\uc0\qc\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx4160
      \intbl {\f0 {\f0\fs20 \'97}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx5200
      \intbl {\f0 {\f0\fs20 \'97}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx6240
      \intbl {\f0 {\f0\fs20 \'97}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx7280
      \intbl {\f0 {\f0\fs20 \'97}}\cell
      \pard\plain
      
      \pard\plain\uc0\qr\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx8320
      \intbl {\f0 {\f0\fs20 9501.26}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx9360
      \intbl {\f0 {\f0\fs20 \'97}}\cell
      \pard\plain
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx9360
      \intbl {\f0 {\f0\fs20 Source note #1\line Source note #2}}\cell
      \pard\plain
      
      \row
      
      }

---

    Code
      .
    Output
      [1] "<table class=\"gt_table\">\n  <thead class=\"gt_header\">\n    <tr>\n      <th colspan=\"9\" class=\"gt_heading gt_title gt_font_normal\" style>Data listing from <strong>exibble</strong></th>\n    </tr>\n    <tr>\n      <th colspan=\"9\" class=\"gt_heading gt_subtitle gt_font_normal gt_bottom_border\" style><code>exibble</code> is an R dataset</th>\n    </tr>\n  </thead>\n  <thead class=\"gt_col_headings\">\n    <tr>\n      <th class=\"gt_col_heading gt_columns_bottom_border gt_left\" rowspan=\"2\" colspan=\"1\">S.L.</th>\n      <th class=\"gt_col_heading gt_columns_bottom_border gt_right\" rowspan=\"2\" colspan=\"1\">num</th>\n      <th class=\"gt_col_heading gt_columns_bottom_border gt_left\" rowspan=\"2\" colspan=\"1\">char</th>\n      <th class=\"gt_col_heading gt_columns_bottom_border gt_center\" rowspan=\"2\" colspan=\"1\">fctr</th>\n      <th class=\"gt_center gt_columns_top_border gt_column_spanner_outer\" rowspan=\"1\" colspan=\"3\">\n        <span class=\"gt_column_spanner\">timing</span>\n      </th>\n      <th class=\"gt_col_heading gt_columns_bottom_border gt_right\" rowspan=\"2\" colspan=\"1\">currency</th>\n      <th class=\"gt_col_heading gt_columns_bottom_border gt_left\" rowspan=\"2\" colspan=\"1\">group</th>\n    </tr>\n    <tr>\n      <th class=\"gt_col_heading gt_columns_bottom_border gt_left\" rowspan=\"1\" colspan=\"1\">date</th>\n      <th class=\"gt_col_heading gt_columns_bottom_border gt_left\" rowspan=\"1\" colspan=\"1\">time</th>\n      <th class=\"gt_col_heading gt_columns_bottom_border gt_left\" rowspan=\"1\" colspan=\"1\">datetime</th>\n    </tr>\n  </thead>\n  <tbody class=\"gt_table_body\">\n    <tr><td class=\"gt_row gt_right gt_stub\">row_1</td>\n<td class=\"gt_row gt_right\">1.111e-01</td>\n<td class=\"gt_row gt_left\">apricot</td>\n<td class=\"gt_row gt_center\">one</td>\n<td class=\"gt_row gt_left\">2015-01-15</td>\n<td class=\"gt_row gt_left\">13:35</td>\n<td class=\"gt_row gt_left\">2018-01-01 02:22</td>\n<td class=\"gt_row gt_right\">49.950</td>\n<td class=\"gt_row gt_left\">grp_a</td></tr>\n    <tr><td class=\"gt_row gt_right gt_stub\">row_2</td>\n<td class=\"gt_row gt_right\">2.222e+00</td>\n<td class=\"gt_row gt_left\">banana</td>\n<td class=\"gt_row gt_center\">two</td>\n<td class=\"gt_row gt_left\">2015-02-15</td>\n<td class=\"gt_row gt_left\">14:40</td>\n<td class=\"gt_row gt_left\">2018-02-02 14:33</td>\n<td class=\"gt_row gt_right\">17.950</td>\n<td class=\"gt_row gt_left\">grp_a</td></tr>\n    <tr><td class=\"gt_row gt_right gt_stub\">row_3</td>\n<td class=\"gt_row gt_right\">3.333e+01</td>\n<td class=\"gt_row gt_left\">coconut</td>\n<td class=\"gt_row gt_center\">three</td>\n<td class=\"gt_row gt_left\">2015-03-15</td>\n<td class=\"gt_row gt_left\">15:45</td>\n<td class=\"gt_row gt_left\">2018-03-03 03:44</td>\n<td class=\"gt_row gt_right\">1.390</td>\n<td class=\"gt_row gt_left\">grp_a</td></tr>\n    <tr><td class=\"gt_row gt_right gt_stub\">row_4</td>\n<td class=\"gt_row gt_right\">4.444e+02</td>\n<td class=\"gt_row gt_left\">durian</td>\n<td class=\"gt_row gt_center\">four</td>\n<td class=\"gt_row gt_left\">2015-04-15</td>\n<td class=\"gt_row gt_left\">16:50</td>\n<td class=\"gt_row gt_left\">2018-04-04 15:55</td>\n<td class=\"gt_row gt_right\">65100.000</td>\n<td class=\"gt_row gt_left\">grp_a</td></tr>\n    <tr><td class=\"gt_row gt_right gt_stub\">row_5</td>\n<td class=\"gt_row gt_right\">5.550e+03</td>\n<td class=\"gt_row gt_left\">NA</td>\n<td class=\"gt_row gt_center\">five</td>\n<td class=\"gt_row gt_left\">2015-05-15</td>\n<td class=\"gt_row gt_left\">17:55</td>\n<td class=\"gt_row gt_left\">2018-05-05 04:00</td>\n<td class=\"gt_row gt_right\">1325.810</td>\n<td class=\"gt_row gt_left\">grp_b</td></tr>\n    <tr><td class=\"gt_row gt_right gt_stub\">row_6</td>\n<td class=\"gt_row gt_right\">NA</td>\n<td class=\"gt_row gt_left\">fig</td>\n<td class=\"gt_row gt_center\">six</td>\n<td class=\"gt_row gt_left\">2015-06-15</td>\n<td class=\"gt_row gt_left\">NA</td>\n<td class=\"gt_row gt_left\">2018-06-06 16:11</td>\n<td class=\"gt_row gt_right\">13.255</td>\n<td class=\"gt_row gt_left\">grp_b</td></tr>\n    <tr><td class=\"gt_row gt_right gt_stub\">row_7</td>\n<td class=\"gt_row gt_right\">7.770e+05</td>\n<td class=\"gt_row gt_left\">grapefruit</td>\n<td class=\"gt_row gt_center\">seven</td>\n<td class=\"gt_row gt_left\">NA</td>\n<td class=\"gt_row gt_left\">19:10</td>\n<td class=\"gt_row gt_left\">2018-07-07 05:22</td>\n<td class=\"gt_row gt_right\">NA</td>\n<td class=\"gt_row gt_left\">grp_b</td></tr>\n    <tr><td class=\"gt_row gt_right gt_stub\">row_8</td>\n<td class=\"gt_row gt_right\">8.880e+06</td>\n<td class=\"gt_row gt_left\">honeydew</td>\n<td class=\"gt_row gt_center\">eight</td>\n<td class=\"gt_row gt_left\">2015-08-15</td>\n<td class=\"gt_row gt_left\">20:20</td>\n<td class=\"gt_row gt_left\">NA</td>\n<td class=\"gt_row gt_right\">0.440</td>\n<td class=\"gt_row gt_left\">grp_b</td></tr>\n    <tr><td class=\"gt_row gt_right gt_stub gt_grand_summary_row gt_first_grand_summary_row\">min</td>\n<td class=\"gt_row gt_right gt_grand_summary_row gt_first_grand_summary_row\">0.11</td>\n<td class=\"gt_row gt_left gt_grand_summary_row gt_first_grand_summary_row\">&mdash;</td>\n<td class=\"gt_row gt_center gt_grand_summary_row gt_first_grand_summary_row\">&mdash;</td>\n<td class=\"gt_row gt_left gt_grand_summary_row gt_first_grand_summary_row\">&mdash;</td>\n<td class=\"gt_row gt_left gt_grand_summary_row gt_first_grand_summary_row\">&mdash;</td>\n<td class=\"gt_row gt_left gt_grand_summary_row gt_first_grand_summary_row\">&mdash;</td>\n<td class=\"gt_row gt_right gt_grand_summary_row gt_first_grand_summary_row\">0.44</td>\n<td class=\"gt_row gt_left gt_grand_summary_row gt_first_grand_summary_row\">&mdash;</td></tr>\n    <tr><td class=\"gt_row gt_right gt_stub gt_grand_summary_row\">max</td>\n<td class=\"gt_row gt_right gt_grand_summary_row\">8880000.00</td>\n<td class=\"gt_row gt_left gt_grand_summary_row\">&mdash;</td>\n<td class=\"gt_row gt_center gt_grand_summary_row\">&mdash;</td>\n<td class=\"gt_row gt_left gt_grand_summary_row\">&mdash;</td>\n<td class=\"gt_row gt_left gt_grand_summary_row\">&mdash;</td>\n<td class=\"gt_row gt_left gt_grand_summary_row\">&mdash;</td>\n<td class=\"gt_row gt_right gt_grand_summary_row\">65100.00</td>\n<td class=\"gt_row gt_left gt_grand_summary_row\">&mdash;</td></tr>\n    <tr><td class=\"gt_row gt_right gt_stub gt_grand_summary_row gt_last_summary_row\">avg</td>\n<td class=\"gt_row gt_right gt_grand_summary_row gt_last_summary_row\">1380432.87</td>\n<td class=\"gt_row gt_left gt_grand_summary_row gt_last_summary_row\">&mdash;</td>\n<td class=\"gt_row gt_center gt_grand_summary_row gt_last_summary_row\">&mdash;</td>\n<td class=\"gt_row gt_left gt_grand_summary_row gt_last_summary_row\">&mdash;</td>\n<td class=\"gt_row gt_left gt_grand_summary_row gt_last_summary_row\">&mdash;</td>\n<td class=\"gt_row gt_left gt_grand_summary_row gt_last_summary_row\">&mdash;</td>\n<td class=\"gt_row gt_right gt_grand_summary_row gt_last_summary_row\">9501.26</td>\n<td class=\"gt_row gt_left gt_grand_summary_row gt_last_summary_row\">&mdash;</td></tr>\n  </tbody>\n  <tfoot class=\"gt_sourcenotes\">\n    <tr>\n      <td class=\"gt_sourcenote\" colspan=\"9\">Source note #1</td>\n    </tr>\n    <tr>\n      <td class=\"gt_sourcenote\" colspan=\"9\">Source note #2</td>\n    </tr>\n  </tfoot>\n  \n</table>"

---

    Code
      .
    Output
      [1] "\\captionsetup[table]{labelformat=empty,skip=1pt}\n\\setlength{\\LTpost}{0mm}\n\\begin{longtable}{r|rlclllrl}\n\\caption*{\n{\\large Data listing from \\textbf{exibble}} \\\\ \n{\\small \\texttt{exibble} is an R dataset}\n} \\\\ \n\\toprule\n\\multicolumn{1}{l}{} &  &  &  & \\multicolumn{3}{c}{timing} &  &  \\\\ \n\\cmidrule(lr){5-7}\n\\multicolumn{1}{l}{S.L.} & num & char & fctr & date & time & datetime & currency & group \\\\ \n\\midrule\nrow\\_1 & 1.111e-01 & apricot & one & 2015-01-15 & 13:35 & 2018-01-01 02:22 & 49.950 & grp\\_a \\\\ \nrow\\_2 & 2.222e+00 & banana & two & 2015-02-15 & 14:40 & 2018-02-02 14:33 & 17.950 & grp\\_a \\\\ \nrow\\_3 & 3.333e+01 & coconut & three & 2015-03-15 & 15:45 & 2018-03-03 03:44 & 1.390 & grp\\_a \\\\ \nrow\\_4 & 4.444e+02 & durian & four & 2015-04-15 & 16:50 & 2018-04-04 15:55 & 65100.000 & grp\\_a \\\\ \nrow\\_5 & 5.550e+03 & NA & five & 2015-05-15 & 17:55 & 2018-05-05 04:00 & 1325.810 & grp\\_b \\\\ \nrow\\_6 & NA & fig & six & 2015-06-15 & NA & 2018-06-06 16:11 & 13.255 & grp\\_b \\\\ \nrow\\_7 & 7.770e+05 & grapefruit & seven & NA & 19:10 & 2018-07-07 05:22 & NA & grp\\_b \\\\ \nrow\\_8 & 8.880e+06 & honeydew & eight & 2015-08-15 & 20:20 & NA & 0.440 & grp\\_b \\\\ \n\\midrule \n\\midrule \nmin & $0.11$ & — & — & — & — & — & $0.44$ & — \\\\ \nmax & $8880000.00$ & — & — & — & — & — & $65100.00$ & — \\\\ \navg & $1380432.87$ & — & — & — & — & — & $9501.26$ & — \\\\ \n\\bottomrule\n\\end{longtable}\n\\begin{minipage}{\\linewidth}\nSource note \\#1\\\\\nSource note \\#2\\\\\n\\end{minipage}\n"

---

    Code
      .
    Output
      {\rtf\ansi\ansicpg1252{\fonttbl{\f0\froman\fcharset0\fprq0 Courier New;}{\f1\froman\fcharset0\fprq0 Times;}}{\colortbl;\red51\green51\blue51;\red211\green211\blue211;}
      
      \paperw12240\paperh15840\widowctrl\ftnbj\fet0\sectd\linex0
      \lndscpsxn
      \margl1440\margr1440\margt1440\margb1440
      \headery720\footery720\fs20
      
      \trowd\trrh0\trhdr
      
      \pard\plain\uc0\qc\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx9360
      \intbl {\f0\cf1 {\f0\fs20 Data listing from {\b exibble}} {\f0\fs20\i\super } \line {\f0\fs20 {\f1 exibble} is an R dataset} {\f0\fs20\i\super }}\cell
      \pard\plain
      
      \row
      
      \trowd\trrh0\trhdr
      
      \pard\plain\uc0\qc\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx1040
      \intbl {\f0 {\f0\fs20 }}\cell
      \pard\plain
      
      \pard\plain\uc0\qc\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx2080
      \intbl {\f0 {\f0\fs20 }}\cell
      \pard\plain
      
      \pard\plain\uc0\qc\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx3120
      \intbl {\f0 {\f0\fs20 }}\cell
      \pard\plain
      
      \pard\plain\uc0\qc\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx4160
      \intbl {\f0 {\f0\fs20 }}\cell
      \pard\plain
      
      \pard\plain\uc0\qc\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clmgf\cellx5200
      \intbl {\f0 {\f0\fs20 timing}}\cell
      \pard\plain
      
      \pard\plain\uc0\qc\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clmrg\cellx6240
      \intbl {\f0 {\f0\fs20 timing}}\cell
      \pard\plain
      
      \pard\plain\uc0\qc\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clmrg\cellx7280
      \intbl {\f0 {\f0\fs20 timing}}\cell
      \pard\plain
      
      \pard\plain\uc0\qc\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx8320
      \intbl {\f0 {\f0\fs20 }}\cell
      \pard\plain
      
      \pard\plain\uc0\qc\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx9360
      \intbl {\f0 {\f0\fs20 }}\cell
      \pard\plain
      
      \row
      
      \trowd\trrh0\trhdr
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clbrdrb\brdrs\brdrw40\brdrcf2\cellx1040
      \intbl {\f0 {\f0\fs20 S.L.}}\cell
      \pard\plain
      
      \pard\plain\uc0\qr\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clbrdrb\brdrs\brdrw40\brdrcf2\cellx2080
      \intbl {\f0 {\f0\fs20 num}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clbrdrb\brdrs\brdrw40\brdrcf2\cellx3120
      \intbl {\f0 {\f0\fs20 char}}\cell
      \pard\plain
      
      \pard\plain\uc0\qc\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clbrdrb\brdrs\brdrw40\brdrcf2\cellx4160
      \intbl {\f0 {\f0\fs20 fctr}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clbrdrb\brdrs\brdrw40\brdrcf2\cellx5200
      \intbl {\f0 {\f0\fs20 date}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clbrdrb\brdrs\brdrw40\brdrcf2\cellx6240
      \intbl {\f0 {\f0\fs20 time}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clbrdrb\brdrs\brdrw40\brdrcf2\cellx7280
      \intbl {\f0 {\f0\fs20 datetime}}\cell
      \pard\plain
      
      \pard\plain\uc0\qr\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clbrdrb\brdrs\brdrw40\brdrcf2\cellx8320
      \intbl {\f0 {\f0\fs20 currency}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clbrdrb\brdrs\brdrw40\brdrcf2\cellx9360
      \intbl {\f0 {\f0\fs20 group}}\cell
      \pard\plain
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\qr\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx1040
      \intbl {\f0 {\f0\fs20 row_1}}\cell
      \pard\plain
      
      \pard\plain\uc0\qr\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx2080
      \intbl {\f0 {\f0\fs20 1.111e-01}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx3120
      \intbl {\f0 {\f0\fs20 apricot}}\cell
      \pard\plain
      
      \pard\plain\uc0\qc\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx4160
      \intbl {\f0 {\f0\fs20 one}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx5200
      \intbl {\f0 {\f0\fs20 2015-01-15}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx6240
      \intbl {\f0 {\f0\fs20 13:35}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx7280
      \intbl {\f0 {\f0\fs20 2018-01-01 02:22}}\cell
      \pard\plain
      
      \pard\plain\uc0\qr\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx8320
      \intbl {\f0 {\f0\fs20 49.950}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx9360
      \intbl {\f0 {\f0\fs20 grp_a}}\cell
      \pard\plain
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\qr\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx1040
      \intbl {\f0 {\f0\fs20 row_2}}\cell
      \pard\plain
      
      \pard\plain\uc0\qr\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx2080
      \intbl {\f0 {\f0\fs20 2.222e+00}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx3120
      \intbl {\f0 {\f0\fs20 banana}}\cell
      \pard\plain
      
      \pard\plain\uc0\qc\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx4160
      \intbl {\f0 {\f0\fs20 two}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx5200
      \intbl {\f0 {\f0\fs20 2015-02-15}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx6240
      \intbl {\f0 {\f0\fs20 14:40}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx7280
      \intbl {\f0 {\f0\fs20 2018-02-02 14:33}}\cell
      \pard\plain
      
      \pard\plain\uc0\qr\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx8320
      \intbl {\f0 {\f0\fs20 17.950}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx9360
      \intbl {\f0 {\f0\fs20 grp_a}}\cell
      \pard\plain
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\qr\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx1040
      \intbl {\f0 {\f0\fs20 row_3}}\cell
      \pard\plain
      
      \pard\plain\uc0\qr\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx2080
      \intbl {\f0 {\f0\fs20 3.333e+01}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx3120
      \intbl {\f0 {\f0\fs20 coconut}}\cell
      \pard\plain
      
      \pard\plain\uc0\qc\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx4160
      \intbl {\f0 {\f0\fs20 three}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx5200
      \intbl {\f0 {\f0\fs20 2015-03-15}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx6240
      \intbl {\f0 {\f0\fs20 15:45}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx7280
      \intbl {\f0 {\f0\fs20 2018-03-03 03:44}}\cell
      \pard\plain
      
      \pard\plain\uc0\qr\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx8320
      \intbl {\f0 {\f0\fs20 1.390}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx9360
      \intbl {\f0 {\f0\fs20 grp_a}}\cell
      \pard\plain
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\qr\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx1040
      \intbl {\f0 {\f0\fs20 row_4}}\cell
      \pard\plain
      
      \pard\plain\uc0\qr\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx2080
      \intbl {\f0 {\f0\fs20 4.444e+02}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx3120
      \intbl {\f0 {\f0\fs20 durian}}\cell
      \pard\plain
      
      \pard\plain\uc0\qc\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx4160
      \intbl {\f0 {\f0\fs20 four}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx5200
      \intbl {\f0 {\f0\fs20 2015-04-15}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx6240
      \intbl {\f0 {\f0\fs20 16:50}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx7280
      \intbl {\f0 {\f0\fs20 2018-04-04 15:55}}\cell
      \pard\plain
      
      \pard\plain\uc0\qr\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx8320
      \intbl {\f0 {\f0\fs20 65100.000}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx9360
      \intbl {\f0 {\f0\fs20 grp_a}}\cell
      \pard\plain
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\qr\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx1040
      \intbl {\f0 {\f0\fs20 row_5}}\cell
      \pard\plain
      
      \pard\plain\uc0\qr\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx2080
      \intbl {\f0 {\f0\fs20 5.550e+03}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx3120
      \intbl {\f0 {\f0\fs20 NA}}\cell
      \pard\plain
      
      \pard\plain\uc0\qc\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx4160
      \intbl {\f0 {\f0\fs20 five}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx5200
      \intbl {\f0 {\f0\fs20 2015-05-15}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx6240
      \intbl {\f0 {\f0\fs20 17:55}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx7280
      \intbl {\f0 {\f0\fs20 2018-05-05 04:00}}\cell
      \pard\plain
      
      \pard\plain\uc0\qr\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx8320
      \intbl {\f0 {\f0\fs20 1325.810}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx9360
      \intbl {\f0 {\f0\fs20 grp_b}}\cell
      \pard\plain
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\qr\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx1040
      \intbl {\f0 {\f0\fs20 row_6}}\cell
      \pard\plain
      
      \pard\plain\uc0\qr\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx2080
      \intbl {\f0 {\f0\fs20 NA}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx3120
      \intbl {\f0 {\f0\fs20 fig}}\cell
      \pard\plain
      
      \pard\plain\uc0\qc\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx4160
      \intbl {\f0 {\f0\fs20 six}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx5200
      \intbl {\f0 {\f0\fs20 2015-06-15}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx6240
      \intbl {\f0 {\f0\fs20 NA}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx7280
      \intbl {\f0 {\f0\fs20 2018-06-06 16:11}}\cell
      \pard\plain
      
      \pard\plain\uc0\qr\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx8320
      \intbl {\f0 {\f0\fs20 13.255}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx9360
      \intbl {\f0 {\f0\fs20 grp_b}}\cell
      \pard\plain
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\qr\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx1040
      \intbl {\f0 {\f0\fs20 row_7}}\cell
      \pard\plain
      
      \pard\plain\uc0\qr\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx2080
      \intbl {\f0 {\f0\fs20 7.770e+05}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx3120
      \intbl {\f0 {\f0\fs20 grapefruit}}\cell
      \pard\plain
      
      \pard\plain\uc0\qc\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx4160
      \intbl {\f0 {\f0\fs20 seven}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx5200
      \intbl {\f0 {\f0\fs20 NA}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx6240
      \intbl {\f0 {\f0\fs20 19:10}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx7280
      \intbl {\f0 {\f0\fs20 2018-07-07 05:22}}\cell
      \pard\plain
      
      \pard\plain\uc0\qr\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx8320
      \intbl {\f0 {\f0\fs20 NA}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx9360
      \intbl {\f0 {\f0\fs20 grp_b}}\cell
      \pard\plain
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\qr\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx1040
      \intbl {\f0 {\f0\fs20 row_8}}\cell
      \pard\plain
      
      \pard\plain\uc0\qr\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx2080
      \intbl {\f0 {\f0\fs20 8.880e+06}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx3120
      \intbl {\f0 {\f0\fs20 honeydew}}\cell
      \pard\plain
      
      \pard\plain\uc0\qc\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx4160
      \intbl {\f0 {\f0\fs20 eight}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx5200
      \intbl {\f0 {\f0\fs20 2015-08-15}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx6240
      \intbl {\f0 {\f0\fs20 20:20}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx7280
      \intbl {\f0 {\f0\fs20 NA}}\cell
      \pard\plain
      
      \pard\plain\uc0\qr\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx8320
      \intbl {\f0 {\f0\fs20 0.440}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx9360
      \intbl {\f0 {\f0\fs20 grp_b}}\cell
      \pard\plain
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\qr\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx1040
      \intbl {\f0 {\f0\fs20 min}}\cell
      \pard\plain
      
      \pard\plain\uc0\qr\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx2080
      \intbl {\f0 {\f0\fs20 0.11}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx3120
      \intbl {\f0 {\f0\fs20 \'97}}\cell
      \pard\plain
      
      \pard\plain\uc0\qc\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx4160
      \intbl {\f0 {\f0\fs20 \'97}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx5200
      \intbl {\f0 {\f0\fs20 \'97}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx6240
      \intbl {\f0 {\f0\fs20 \'97}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx7280
      \intbl {\f0 {\f0\fs20 \'97}}\cell
      \pard\plain
      
      \pard\plain\uc0\qr\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx8320
      \intbl {\f0 {\f0\fs20 0.44}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx9360
      \intbl {\f0 {\f0\fs20 \'97}}\cell
      \pard\plain
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\qr\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx1040
      \intbl {\f0 {\f0\fs20 max}}\cell
      \pard\plain
      
      \pard\plain\uc0\qr\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx2080
      \intbl {\f0 {\f0\fs20 8880000.00}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx3120
      \intbl {\f0 {\f0\fs20 \'97}}\cell
      \pard\plain
      
      \pard\plain\uc0\qc\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx4160
      \intbl {\f0 {\f0\fs20 \'97}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx5200
      \intbl {\f0 {\f0\fs20 \'97}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx6240
      \intbl {\f0 {\f0\fs20 \'97}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx7280
      \intbl {\f0 {\f0\fs20 \'97}}\cell
      \pard\plain
      
      \pard\plain\uc0\qr\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx8320
      \intbl {\f0 {\f0\fs20 65100.00}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx9360
      \intbl {\f0 {\f0\fs20 \'97}}\cell
      \pard\plain
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\qr\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx1040
      \intbl {\f0 {\f0\fs20 avg}}\cell
      \pard\plain
      
      \pard\plain\uc0\qr\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx2080
      \intbl {\f0 {\f0\fs20 1380432.87}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx3120
      \intbl {\f0 {\f0\fs20 \'97}}\cell
      \pard\plain
      
      \pard\plain\uc0\qc\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx4160
      \intbl {\f0 {\f0\fs20 \'97}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx5200
      \intbl {\f0 {\f0\fs20 \'97}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx6240
      \intbl {\f0 {\f0\fs20 \'97}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx7280
      \intbl {\f0 {\f0\fs20 \'97}}\cell
      \pard\plain
      
      \pard\plain\uc0\qr\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx8320
      \intbl {\f0 {\f0\fs20 9501.26}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx9360
      \intbl {\f0 {\f0\fs20 \'97}}\cell
      \pard\plain
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx9360
      \intbl {\f0 {\f0\fs20 Source note #1\line Source note #2}}\cell
      \pard\plain
      
      \row
      
      }

---

    Code
      .
    Output
      [1] "<table class=\"gt_table\">\n  <thead class=\"gt_header\">\n    <tr>\n      <th colspan=\"9\" class=\"gt_heading gt_title gt_font_normal\" style>Data listing from <strong>exibble</strong></th>\n    </tr>\n    <tr>\n      <th colspan=\"9\" class=\"gt_heading gt_subtitle gt_font_normal gt_bottom_border\" style><code>exibble</code> is an R dataset</th>\n    </tr>\n  </thead>\n  <thead class=\"gt_col_headings\">\n    <tr>\n      <th class=\"gt_col_heading gt_columns_bottom_border gt_left\" rowspan=\"2\" colspan=\"1\">S.L.</th>\n      <th class=\"gt_col_heading gt_columns_bottom_border gt_right\" rowspan=\"2\" colspan=\"1\">num</th>\n      <th class=\"gt_col_heading gt_columns_bottom_border gt_left\" rowspan=\"2\" colspan=\"1\">char</th>\n      <th class=\"gt_col_heading gt_columns_bottom_border gt_center\" rowspan=\"2\" colspan=\"1\">fctr</th>\n      <th class=\"gt_center gt_columns_top_border gt_column_spanner_outer\" rowspan=\"1\" colspan=\"3\">\n        <span class=\"gt_column_spanner\">timing</span>\n      </th>\n      <th class=\"gt_col_heading gt_columns_bottom_border gt_right\" rowspan=\"2\" colspan=\"1\">currency</th>\n      <th class=\"gt_col_heading gt_columns_bottom_border gt_left\" rowspan=\"2\" colspan=\"1\">group</th>\n    </tr>\n    <tr>\n      <th class=\"gt_col_heading gt_columns_bottom_border gt_left\" rowspan=\"1\" colspan=\"1\">date</th>\n      <th class=\"gt_col_heading gt_columns_bottom_border gt_left\" rowspan=\"1\" colspan=\"1\">time</th>\n      <th class=\"gt_col_heading gt_columns_bottom_border gt_left\" rowspan=\"1\" colspan=\"1\">datetime</th>\n    </tr>\n  </thead>\n  <tbody class=\"gt_table_body\">\n    <tr><td class=\"gt_row gt_right gt_stub\">row_1</td>\n<td class=\"gt_row gt_right\">1.111e-01</td>\n<td class=\"gt_row gt_left\">apricot</td>\n<td class=\"gt_row gt_center\">one</td>\n<td class=\"gt_row gt_left\">2015-01-15</td>\n<td class=\"gt_row gt_left\">13:35</td>\n<td class=\"gt_row gt_left\">2018-01-01 02:22</td>\n<td class=\"gt_row gt_right\">49.950</td>\n<td class=\"gt_row gt_left\">grp_a</td></tr>\n    <tr><td class=\"gt_row gt_right gt_stub\">row_2</td>\n<td class=\"gt_row gt_right\">2.222e+00</td>\n<td class=\"gt_row gt_left\">banana</td>\n<td class=\"gt_row gt_center\">two</td>\n<td class=\"gt_row gt_left\">2015-02-15</td>\n<td class=\"gt_row gt_left\">14:40</td>\n<td class=\"gt_row gt_left\">2018-02-02 14:33</td>\n<td class=\"gt_row gt_right\">17.950</td>\n<td class=\"gt_row gt_left\">grp_a</td></tr>\n    <tr><td class=\"gt_row gt_right gt_stub\">row_3</td>\n<td class=\"gt_row gt_right\">3.333e+01</td>\n<td class=\"gt_row gt_left\">coconut</td>\n<td class=\"gt_row gt_center\">three</td>\n<td class=\"gt_row gt_left\">2015-03-15</td>\n<td class=\"gt_row gt_left\">15:45</td>\n<td class=\"gt_row gt_left\">2018-03-03 03:44</td>\n<td class=\"gt_row gt_right\">1.390</td>\n<td class=\"gt_row gt_left\">grp_a</td></tr>\n    <tr><td class=\"gt_row gt_right gt_stub\">row_4</td>\n<td class=\"gt_row gt_right\">4.444e+02</td>\n<td class=\"gt_row gt_left\">durian</td>\n<td class=\"gt_row gt_center\">four</td>\n<td class=\"gt_row gt_left\">2015-04-15</td>\n<td class=\"gt_row gt_left\">16:50</td>\n<td class=\"gt_row gt_left\">2018-04-04 15:55</td>\n<td class=\"gt_row gt_right\">65100.000</td>\n<td class=\"gt_row gt_left\">grp_a</td></tr>\n    <tr><td class=\"gt_row gt_right gt_stub\">row_5</td>\n<td class=\"gt_row gt_right\">5.550e+03</td>\n<td class=\"gt_row gt_left\">NA</td>\n<td class=\"gt_row gt_center\">five</td>\n<td class=\"gt_row gt_left\">2015-05-15</td>\n<td class=\"gt_row gt_left\">17:55</td>\n<td class=\"gt_row gt_left\">2018-05-05 04:00</td>\n<td class=\"gt_row gt_right\">1325.810</td>\n<td class=\"gt_row gt_left\">grp_b</td></tr>\n    <tr><td class=\"gt_row gt_right gt_stub\">row_6</td>\n<td class=\"gt_row gt_right\">NA</td>\n<td class=\"gt_row gt_left\">fig</td>\n<td class=\"gt_row gt_center\">six</td>\n<td class=\"gt_row gt_left\">2015-06-15</td>\n<td class=\"gt_row gt_left\">NA</td>\n<td class=\"gt_row gt_left\">2018-06-06 16:11</td>\n<td class=\"gt_row gt_right\">13.255</td>\n<td class=\"gt_row gt_left\">grp_b</td></tr>\n    <tr><td class=\"gt_row gt_right gt_stub\">row_7</td>\n<td class=\"gt_row gt_right\">7.770e+05</td>\n<td class=\"gt_row gt_left\">grapefruit</td>\n<td class=\"gt_row gt_center\">seven</td>\n<td class=\"gt_row gt_left\">NA</td>\n<td class=\"gt_row gt_left\">19:10</td>\n<td class=\"gt_row gt_left\">2018-07-07 05:22</td>\n<td class=\"gt_row gt_right\">NA</td>\n<td class=\"gt_row gt_left\">grp_b</td></tr>\n    <tr><td class=\"gt_row gt_right gt_stub\">row_8</td>\n<td class=\"gt_row gt_right\">8.880e+06</td>\n<td class=\"gt_row gt_left\">honeydew</td>\n<td class=\"gt_row gt_center\">eight</td>\n<td class=\"gt_row gt_left\">2015-08-15</td>\n<td class=\"gt_row gt_left\">20:20</td>\n<td class=\"gt_row gt_left\">NA</td>\n<td class=\"gt_row gt_right\">0.440</td>\n<td class=\"gt_row gt_left\">grp_b</td></tr>\n    <tr><td class=\"gt_row gt_right gt_stub gt_grand_summary_row gt_first_grand_summary_row\">min</td>\n<td class=\"gt_row gt_right gt_grand_summary_row gt_first_grand_summary_row\">0.11</td>\n<td class=\"gt_row gt_left gt_grand_summary_row gt_first_grand_summary_row\">&mdash;</td>\n<td class=\"gt_row gt_center gt_grand_summary_row gt_first_grand_summary_row\">&mdash;</td>\n<td class=\"gt_row gt_left gt_grand_summary_row gt_first_grand_summary_row\">&mdash;</td>\n<td class=\"gt_row gt_left gt_grand_summary_row gt_first_grand_summary_row\">&mdash;</td>\n<td class=\"gt_row gt_left gt_grand_summary_row gt_first_grand_summary_row\">&mdash;</td>\n<td class=\"gt_row gt_right gt_grand_summary_row gt_first_grand_summary_row\">0.44</td>\n<td class=\"gt_row gt_left gt_grand_summary_row gt_first_grand_summary_row\">&mdash;</td></tr>\n    <tr><td class=\"gt_row gt_right gt_stub gt_grand_summary_row\">max</td>\n<td class=\"gt_row gt_right gt_grand_summary_row\">8880000.00</td>\n<td class=\"gt_row gt_left gt_grand_summary_row\">&mdash;</td>\n<td class=\"gt_row gt_center gt_grand_summary_row\">&mdash;</td>\n<td class=\"gt_row gt_left gt_grand_summary_row\">&mdash;</td>\n<td class=\"gt_row gt_left gt_grand_summary_row\">&mdash;</td>\n<td class=\"gt_row gt_left gt_grand_summary_row\">&mdash;</td>\n<td class=\"gt_row gt_right gt_grand_summary_row\">65100.00</td>\n<td class=\"gt_row gt_left gt_grand_summary_row\">&mdash;</td></tr>\n    <tr><td class=\"gt_row gt_right gt_stub gt_grand_summary_row gt_last_summary_row\">avg</td>\n<td class=\"gt_row gt_right gt_grand_summary_row gt_last_summary_row\">1380432.87</td>\n<td class=\"gt_row gt_left gt_grand_summary_row gt_last_summary_row\">&mdash;</td>\n<td class=\"gt_row gt_center gt_grand_summary_row gt_last_summary_row\">&mdash;</td>\n<td class=\"gt_row gt_left gt_grand_summary_row gt_last_summary_row\">&mdash;</td>\n<td class=\"gt_row gt_left gt_grand_summary_row gt_last_summary_row\">&mdash;</td>\n<td class=\"gt_row gt_left gt_grand_summary_row gt_last_summary_row\">&mdash;</td>\n<td class=\"gt_row gt_right gt_grand_summary_row gt_last_summary_row\">9501.26</td>\n<td class=\"gt_row gt_left gt_grand_summary_row gt_last_summary_row\">&mdash;</td></tr>\n  </tbody>\n  <tfoot class=\"gt_sourcenotes\">\n    <tr>\n      <td class=\"gt_sourcenote\" colspan=\"9\">Source note #1</td>\n    </tr>\n    <tr>\n      <td class=\"gt_sourcenote\" colspan=\"9\">Source note #2</td>\n    </tr>\n  </tfoot>\n  \n</table>"

---

    Code
      .
    Output
      [1] "\\captionsetup[table]{labelformat=empty,skip=1pt}\n\\setlength{\\LTpost}{0mm}\n\\begin{longtable}{r|rlclllrl}\n\\caption*{\n{\\large Data listing from \\textbf{exibble}} \\\\ \n{\\small \\texttt{exibble} is an R dataset}\n} \\\\ \n\\toprule\n\\multicolumn{1}{l}{} &  &  &  & \\multicolumn{3}{c}{timing} &  &  \\\\ \n\\cmidrule(lr){5-7}\n\\multicolumn{1}{l}{S.L.} & num & char & fctr & date & time & datetime & currency & group \\\\ \n\\midrule\nrow\\_1 & 1.111e-01 & apricot & one & 2015-01-15 & 13:35 & 2018-01-01 02:22 & 49.950 & grp\\_a \\\\ \nrow\\_2 & 2.222e+00 & banana & two & 2015-02-15 & 14:40 & 2018-02-02 14:33 & 17.950 & grp\\_a \\\\ \nrow\\_3 & 3.333e+01 & coconut & three & 2015-03-15 & 15:45 & 2018-03-03 03:44 & 1.390 & grp\\_a \\\\ \nrow\\_4 & 4.444e+02 & durian & four & 2015-04-15 & 16:50 & 2018-04-04 15:55 & 65100.000 & grp\\_a \\\\ \nrow\\_5 & 5.550e+03 & NA & five & 2015-05-15 & 17:55 & 2018-05-05 04:00 & 1325.810 & grp\\_b \\\\ \nrow\\_6 & NA & fig & six & 2015-06-15 & NA & 2018-06-06 16:11 & 13.255 & grp\\_b \\\\ \nrow\\_7 & 7.770e+05 & grapefruit & seven & NA & 19:10 & 2018-07-07 05:22 & NA & grp\\_b \\\\ \nrow\\_8 & 8.880e+06 & honeydew & eight & 2015-08-15 & 20:20 & NA & 0.440 & grp\\_b \\\\ \n\\midrule \n\\midrule \nmin & $0.11$ & — & — & — & — & — & $0.44$ & — \\\\ \nmax & $8880000.00$ & — & — & — & — & — & $65100.00$ & — \\\\ \navg & $1380432.87$ & — & — & — & — & — & $9501.26$ & — \\\\ \n\\bottomrule\n\\end{longtable}\n\\begin{minipage}{\\linewidth}\nSource note \\#1\\\\\nSource note \\#2\\\\\n\\end{minipage}\n"

---

    Code
      .
    Output
      {\rtf\ansi\ansicpg1252{\fonttbl{\f0\froman\fcharset0\fprq0 Courier New;}{\f1\froman\fcharset0\fprq0 Times;}}{\colortbl;\red51\green51\blue51;\red211\green211\blue211;}
      
      \paperw12240\paperh15840\widowctrl\ftnbj\fet0\sectd\linex0
      \lndscpsxn
      \margl1440\margr1440\margt1440\margb1440
      \headery720\footery720\fs20
      
      \trowd\trrh0\trhdr
      
      \pard\plain\uc0\qc\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx9360
      \intbl {\f0\cf1 {\f0\fs20 Data listing from {\b exibble}} {\f0\fs20\i\super } \line {\f0\fs20 {\f1 exibble} is an R dataset} {\f0\fs20\i\super }}\cell
      \pard\plain
      
      \row
      
      \trowd\trrh0\trhdr
      
      \pard\plain\uc0\qc\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx1040
      \intbl {\f0 {\f0\fs20 }}\cell
      \pard\plain
      
      \pard\plain\uc0\qc\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx2080
      \intbl {\f0 {\f0\fs20 }}\cell
      \pard\plain
      
      \pard\plain\uc0\qc\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx3120
      \intbl {\f0 {\f0\fs20 }}\cell
      \pard\plain
      
      \pard\plain\uc0\qc\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx4160
      \intbl {\f0 {\f0\fs20 }}\cell
      \pard\plain
      
      \pard\plain\uc0\qc\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clmgf\cellx5200
      \intbl {\f0 {\f0\fs20 timing}}\cell
      \pard\plain
      
      \pard\plain\uc0\qc\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clmrg\cellx6240
      \intbl {\f0 {\f0\fs20 timing}}\cell
      \pard\plain
      
      \pard\plain\uc0\qc\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clmrg\cellx7280
      \intbl {\f0 {\f0\fs20 timing}}\cell
      \pard\plain
      
      \pard\plain\uc0\qc\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx8320
      \intbl {\f0 {\f0\fs20 }}\cell
      \pard\plain
      
      \pard\plain\uc0\qc\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx9360
      \intbl {\f0 {\f0\fs20 }}\cell
      \pard\plain
      
      \row
      
      \trowd\trrh0\trhdr
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clbrdrb\brdrs\brdrw40\brdrcf2\cellx1040
      \intbl {\f0 {\f0\fs20 S.L.}}\cell
      \pard\plain
      
      \pard\plain\uc0\qr\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clbrdrb\brdrs\brdrw40\brdrcf2\cellx2080
      \intbl {\f0 {\f0\fs20 num}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clbrdrb\brdrs\brdrw40\brdrcf2\cellx3120
      \intbl {\f0 {\f0\fs20 char}}\cell
      \pard\plain
      
      \pard\plain\uc0\qc\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clbrdrb\brdrs\brdrw40\brdrcf2\cellx4160
      \intbl {\f0 {\f0\fs20 fctr}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clbrdrb\brdrs\brdrw40\brdrcf2\cellx5200
      \intbl {\f0 {\f0\fs20 date}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clbrdrb\brdrs\brdrw40\brdrcf2\cellx6240
      \intbl {\f0 {\f0\fs20 time}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clbrdrb\brdrs\brdrw40\brdrcf2\cellx7280
      \intbl {\f0 {\f0\fs20 datetime}}\cell
      \pard\plain
      
      \pard\plain\uc0\qr\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clbrdrb\brdrs\brdrw40\brdrcf2\cellx8320
      \intbl {\f0 {\f0\fs20 currency}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clbrdrb\brdrs\brdrw40\brdrcf2\cellx9360
      \intbl {\f0 {\f0\fs20 group}}\cell
      \pard\plain
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\qr\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx1040
      \intbl {\f0 {\f0\fs20 row_1}}\cell
      \pard\plain
      
      \pard\plain\uc0\qr\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx2080
      \intbl {\f0 {\f0\fs20 1.111e-01}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx3120
      \intbl {\f0 {\f0\fs20 apricot}}\cell
      \pard\plain
      
      \pard\plain\uc0\qc\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx4160
      \intbl {\f0 {\f0\fs20 one}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx5200
      \intbl {\f0 {\f0\fs20 2015-01-15}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx6240
      \intbl {\f0 {\f0\fs20 13:35}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx7280
      \intbl {\f0 {\f0\fs20 2018-01-01 02:22}}\cell
      \pard\plain
      
      \pard\plain\uc0\qr\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx8320
      \intbl {\f0 {\f0\fs20 49.950}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx9360
      \intbl {\f0 {\f0\fs20 grp_a}}\cell
      \pard\plain
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\qr\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx1040
      \intbl {\f0 {\f0\fs20 row_2}}\cell
      \pard\plain
      
      \pard\plain\uc0\qr\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx2080
      \intbl {\f0 {\f0\fs20 2.222e+00}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx3120
      \intbl {\f0 {\f0\fs20 banana}}\cell
      \pard\plain
      
      \pard\plain\uc0\qc\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx4160
      \intbl {\f0 {\f0\fs20 two}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx5200
      \intbl {\f0 {\f0\fs20 2015-02-15}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx6240
      \intbl {\f0 {\f0\fs20 14:40}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx7280
      \intbl {\f0 {\f0\fs20 2018-02-02 14:33}}\cell
      \pard\plain
      
      \pard\plain\uc0\qr\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx8320
      \intbl {\f0 {\f0\fs20 17.950}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx9360
      \intbl {\f0 {\f0\fs20 grp_a}}\cell
      \pard\plain
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\qr\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx1040
      \intbl {\f0 {\f0\fs20 row_3}}\cell
      \pard\plain
      
      \pard\plain\uc0\qr\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx2080
      \intbl {\f0 {\f0\fs20 3.333e+01}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx3120
      \intbl {\f0 {\f0\fs20 coconut}}\cell
      \pard\plain
      
      \pard\plain\uc0\qc\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx4160
      \intbl {\f0 {\f0\fs20 three}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx5200
      \intbl {\f0 {\f0\fs20 2015-03-15}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx6240
      \intbl {\f0 {\f0\fs20 15:45}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx7280
      \intbl {\f0 {\f0\fs20 2018-03-03 03:44}}\cell
      \pard\plain
      
      \pard\plain\uc0\qr\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx8320
      \intbl {\f0 {\f0\fs20 1.390}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx9360
      \intbl {\f0 {\f0\fs20 grp_a}}\cell
      \pard\plain
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\qr\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx1040
      \intbl {\f0 {\f0\fs20 row_4}}\cell
      \pard\plain
      
      \pard\plain\uc0\qr\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx2080
      \intbl {\f0 {\f0\fs20 4.444e+02}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx3120
      \intbl {\f0 {\f0\fs20 durian}}\cell
      \pard\plain
      
      \pard\plain\uc0\qc\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx4160
      \intbl {\f0 {\f0\fs20 four}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx5200
      \intbl {\f0 {\f0\fs20 2015-04-15}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx6240
      \intbl {\f0 {\f0\fs20 16:50}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx7280
      \intbl {\f0 {\f0\fs20 2018-04-04 15:55}}\cell
      \pard\plain
      
      \pard\plain\uc0\qr\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx8320
      \intbl {\f0 {\f0\fs20 65100.000}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx9360
      \intbl {\f0 {\f0\fs20 grp_a}}\cell
      \pard\plain
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\qr\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx1040
      \intbl {\f0 {\f0\fs20 row_5}}\cell
      \pard\plain
      
      \pard\plain\uc0\qr\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx2080
      \intbl {\f0 {\f0\fs20 5.550e+03}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx3120
      \intbl {\f0 {\f0\fs20 NA}}\cell
      \pard\plain
      
      \pard\plain\uc0\qc\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx4160
      \intbl {\f0 {\f0\fs20 five}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx5200
      \intbl {\f0 {\f0\fs20 2015-05-15}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx6240
      \intbl {\f0 {\f0\fs20 17:55}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx7280
      \intbl {\f0 {\f0\fs20 2018-05-05 04:00}}\cell
      \pard\plain
      
      \pard\plain\uc0\qr\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx8320
      \intbl {\f0 {\f0\fs20 1325.810}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx9360
      \intbl {\f0 {\f0\fs20 grp_b}}\cell
      \pard\plain
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\qr\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx1040
      \intbl {\f0 {\f0\fs20 row_6}}\cell
      \pard\plain
      
      \pard\plain\uc0\qr\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx2080
      \intbl {\f0 {\f0\fs20 NA}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx3120
      \intbl {\f0 {\f0\fs20 fig}}\cell
      \pard\plain
      
      \pard\plain\uc0\qc\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx4160
      \intbl {\f0 {\f0\fs20 six}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx5200
      \intbl {\f0 {\f0\fs20 2015-06-15}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx6240
      \intbl {\f0 {\f0\fs20 NA}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx7280
      \intbl {\f0 {\f0\fs20 2018-06-06 16:11}}\cell
      \pard\plain
      
      \pard\plain\uc0\qr\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx8320
      \intbl {\f0 {\f0\fs20 13.255}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx9360
      \intbl {\f0 {\f0\fs20 grp_b}}\cell
      \pard\plain
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\qr\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx1040
      \intbl {\f0 {\f0\fs20 row_7}}\cell
      \pard\plain
      
      \pard\plain\uc0\qr\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx2080
      \intbl {\f0 {\f0\fs20 7.770e+05}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx3120
      \intbl {\f0 {\f0\fs20 grapefruit}}\cell
      \pard\plain
      
      \pard\plain\uc0\qc\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx4160
      \intbl {\f0 {\f0\fs20 seven}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx5200
      \intbl {\f0 {\f0\fs20 NA}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx6240
      \intbl {\f0 {\f0\fs20 19:10}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx7280
      \intbl {\f0 {\f0\fs20 2018-07-07 05:22}}\cell
      \pard\plain
      
      \pard\plain\uc0\qr\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx8320
      \intbl {\f0 {\f0\fs20 NA}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx9360
      \intbl {\f0 {\f0\fs20 grp_b}}\cell
      \pard\plain
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\qr\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx1040
      \intbl {\f0 {\f0\fs20 row_8}}\cell
      \pard\plain
      
      \pard\plain\uc0\qr\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx2080
      \intbl {\f0 {\f0\fs20 8.880e+06}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx3120
      \intbl {\f0 {\f0\fs20 honeydew}}\cell
      \pard\plain
      
      \pard\plain\uc0\qc\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx4160
      \intbl {\f0 {\f0\fs20 eight}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx5200
      \intbl {\f0 {\f0\fs20 2015-08-15}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx6240
      \intbl {\f0 {\f0\fs20 20:20}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx7280
      \intbl {\f0 {\f0\fs20 NA}}\cell
      \pard\plain
      
      \pard\plain\uc0\qr\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx8320
      \intbl {\f0 {\f0\fs20 0.440}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx9360
      \intbl {\f0 {\f0\fs20 grp_b}}\cell
      \pard\plain
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\qr\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx1040
      \intbl {\f0 {\f0\fs20 min}}\cell
      \pard\plain
      
      \pard\plain\uc0\qr\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx2080
      \intbl {\f0 {\f0\fs20 0.11}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx3120
      \intbl {\f0 {\f0\fs20 \'97}}\cell
      \pard\plain
      
      \pard\plain\uc0\qc\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx4160
      \intbl {\f0 {\f0\fs20 \'97}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx5200
      \intbl {\f0 {\f0\fs20 \'97}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx6240
      \intbl {\f0 {\f0\fs20 \'97}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx7280
      \intbl {\f0 {\f0\fs20 \'97}}\cell
      \pard\plain
      
      \pard\plain\uc0\qr\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx8320
      \intbl {\f0 {\f0\fs20 0.44}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx9360
      \intbl {\f0 {\f0\fs20 \'97}}\cell
      \pard\plain
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\qr\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx1040
      \intbl {\f0 {\f0\fs20 max}}\cell
      \pard\plain
      
      \pard\plain\uc0\qr\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx2080
      \intbl {\f0 {\f0\fs20 8880000.00}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx3120
      \intbl {\f0 {\f0\fs20 \'97}}\cell
      \pard\plain
      
      \pard\plain\uc0\qc\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx4160
      \intbl {\f0 {\f0\fs20 \'97}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx5200
      \intbl {\f0 {\f0\fs20 \'97}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx6240
      \intbl {\f0 {\f0\fs20 \'97}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx7280
      \intbl {\f0 {\f0\fs20 \'97}}\cell
      \pard\plain
      
      \pard\plain\uc0\qr\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx8320
      \intbl {\f0 {\f0\fs20 65100.00}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx9360
      \intbl {\f0 {\f0\fs20 \'97}}\cell
      \pard\plain
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\qr\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx1040
      \intbl {\f0 {\f0\fs20 avg}}\cell
      \pard\plain
      
      \pard\plain\uc0\qr\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx2080
      \intbl {\f0 {\f0\fs20 1380432.87}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx3120
      \intbl {\f0 {\f0\fs20 \'97}}\cell
      \pard\plain
      
      \pard\plain\uc0\qc\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx4160
      \intbl {\f0 {\f0\fs20 \'97}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx5200
      \intbl {\f0 {\f0\fs20 \'97}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx6240
      \intbl {\f0 {\f0\fs20 \'97}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx7280
      \intbl {\f0 {\f0\fs20 \'97}}\cell
      \pard\plain
      
      \pard\plain\uc0\qr\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx8320
      \intbl {\f0 {\f0\fs20 9501.26}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx9360
      \intbl {\f0 {\f0\fs20 \'97}}\cell
      \pard\plain
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx9360
      \intbl {\f0 {\f0\fs20 Source note #1\line Source note #2}}\cell
      \pard\plain
      
      \row
      
      }

---

    Code
      .
    Output
      [1] "<table class=\"gt_table\">\n  <thead class=\"gt_header\">\n    <tr>\n      <th colspan=\"8\" class=\"gt_heading gt_title gt_font_normal\" style>Data listing from <strong>exibble</strong></th>\n    </tr>\n    <tr>\n      <th colspan=\"8\" class=\"gt_heading gt_subtitle gt_font_normal gt_bottom_border\" style><code>exibble</code> is an R dataset</th>\n    </tr>\n  </thead>\n  <thead class=\"gt_col_headings\">\n    <tr>\n      <th class=\"gt_col_heading gt_columns_bottom_border gt_left\" rowspan=\"2\" colspan=\"1\">S.L.</th>\n      <th class=\"gt_col_heading gt_columns_bottom_border gt_right\" rowspan=\"2\" colspan=\"1\">num</th>\n      <th class=\"gt_col_heading gt_columns_bottom_border gt_left\" rowspan=\"2\" colspan=\"1\">char</th>\n      <th class=\"gt_col_heading gt_columns_bottom_border gt_center\" rowspan=\"2\" colspan=\"1\">fctr</th>\n      <th class=\"gt_center gt_columns_top_border gt_column_spanner_outer\" rowspan=\"1\" colspan=\"3\">\n        <span class=\"gt_column_spanner\">timing</span>\n      </th>\n      <th class=\"gt_col_heading gt_columns_bottom_border gt_right\" rowspan=\"2\" colspan=\"1\">currency</th>\n    </tr>\n    <tr>\n      <th class=\"gt_col_heading gt_columns_bottom_border gt_left\" rowspan=\"1\" colspan=\"1\">date</th>\n      <th class=\"gt_col_heading gt_columns_bottom_border gt_left\" rowspan=\"1\" colspan=\"1\">time</th>\n      <th class=\"gt_col_heading gt_columns_bottom_border gt_left\" rowspan=\"1\" colspan=\"1\">datetime</th>\n    </tr>\n  </thead>\n  <tbody class=\"gt_table_body\">\n    <tr class=\"gt_group_heading_row\">\n      <td colspan=\"8\" class=\"gt_group_heading\">grp_a</td>\n    </tr>\n    <tr class=\"gt_row_group_first\"><td class=\"gt_row gt_right gt_stub\">row_1</td>\n<td class=\"gt_row gt_right\">1.111e-01</td>\n<td class=\"gt_row gt_left\">apricot</td>\n<td class=\"gt_row gt_center\">one</td>\n<td class=\"gt_row gt_left\">2015-01-15</td>\n<td class=\"gt_row gt_left\">13:35</td>\n<td class=\"gt_row gt_left\">2018-01-01 02:22</td>\n<td class=\"gt_row gt_right\">49.950</td></tr>\n    <tr><td class=\"gt_row gt_right gt_stub\">row_2</td>\n<td class=\"gt_row gt_right\">2.222e+00</td>\n<td class=\"gt_row gt_left\">banana</td>\n<td class=\"gt_row gt_center\">two</td>\n<td class=\"gt_row gt_left\">2015-02-15</td>\n<td class=\"gt_row gt_left\">14:40</td>\n<td class=\"gt_row gt_left\">2018-02-02 14:33</td>\n<td class=\"gt_row gt_right\">17.950</td></tr>\n    <tr><td class=\"gt_row gt_right gt_stub\">row_3</td>\n<td class=\"gt_row gt_right\">3.333e+01</td>\n<td class=\"gt_row gt_left\">coconut</td>\n<td class=\"gt_row gt_center\">three</td>\n<td class=\"gt_row gt_left\">2015-03-15</td>\n<td class=\"gt_row gt_left\">15:45</td>\n<td class=\"gt_row gt_left\">2018-03-03 03:44</td>\n<td class=\"gt_row gt_right\">1.390</td></tr>\n    <tr><td class=\"gt_row gt_right gt_stub\">row_4</td>\n<td class=\"gt_row gt_right\">4.444e+02</td>\n<td class=\"gt_row gt_left\">durian</td>\n<td class=\"gt_row gt_center\">four</td>\n<td class=\"gt_row gt_left\">2015-04-15</td>\n<td class=\"gt_row gt_left\">16:50</td>\n<td class=\"gt_row gt_left\">2018-04-04 15:55</td>\n<td class=\"gt_row gt_right\">65100.000</td></tr>\n    <tr><td class=\"gt_row gt_right gt_stub gt_summary_row gt_first_summary_row thick\">min</td>\n<td class=\"gt_row gt_right gt_summary_row gt_first_summary_row thick\">0.11</td>\n<td class=\"gt_row gt_left gt_summary_row gt_first_summary_row thick\">&mdash;</td>\n<td class=\"gt_row gt_center gt_summary_row gt_first_summary_row thick\">&mdash;</td>\n<td class=\"gt_row gt_left gt_summary_row gt_first_summary_row thick\">&mdash;</td>\n<td class=\"gt_row gt_left gt_summary_row gt_first_summary_row thick\">&mdash;</td>\n<td class=\"gt_row gt_left gt_summary_row gt_first_summary_row thick\">&mdash;</td>\n<td class=\"gt_row gt_right gt_summary_row gt_first_summary_row thick\">1.39</td></tr>\n    <tr><td class=\"gt_row gt_right gt_stub gt_summary_row\">max</td>\n<td class=\"gt_row gt_right gt_summary_row\">444.40</td>\n<td class=\"gt_row gt_left gt_summary_row\">&mdash;</td>\n<td class=\"gt_row gt_center gt_summary_row\">&mdash;</td>\n<td class=\"gt_row gt_left gt_summary_row\">&mdash;</td>\n<td class=\"gt_row gt_left gt_summary_row\">&mdash;</td>\n<td class=\"gt_row gt_left gt_summary_row\">&mdash;</td>\n<td class=\"gt_row gt_right gt_summary_row\">65100.00</td></tr>\n    <tr><td class=\"gt_row gt_right gt_stub gt_summary_row gt_last_summary_row\">avg</td>\n<td class=\"gt_row gt_right gt_summary_row gt_last_summary_row\">120.02</td>\n<td class=\"gt_row gt_left gt_summary_row gt_last_summary_row\">&mdash;</td>\n<td class=\"gt_row gt_center gt_summary_row gt_last_summary_row\">&mdash;</td>\n<td class=\"gt_row gt_left gt_summary_row gt_last_summary_row\">&mdash;</td>\n<td class=\"gt_row gt_left gt_summary_row gt_last_summary_row\">&mdash;</td>\n<td class=\"gt_row gt_left gt_summary_row gt_last_summary_row\">&mdash;</td>\n<td class=\"gt_row gt_right gt_summary_row gt_last_summary_row\">16292.32</td></tr>\n    <tr class=\"gt_group_heading_row\">\n      <td colspan=\"8\" class=\"gt_group_heading\">grp_b</td>\n    </tr>\n    <tr class=\"gt_row_group_first\"><td class=\"gt_row gt_right gt_stub\">row_5</td>\n<td class=\"gt_row gt_right\">5.550e+03</td>\n<td class=\"gt_row gt_left\">NA</td>\n<td class=\"gt_row gt_center\">five</td>\n<td class=\"gt_row gt_left\">2015-05-15</td>\n<td class=\"gt_row gt_left\">17:55</td>\n<td class=\"gt_row gt_left\">2018-05-05 04:00</td>\n<td class=\"gt_row gt_right\">1325.810</td></tr>\n    <tr><td class=\"gt_row gt_right gt_stub\">row_6</td>\n<td class=\"gt_row gt_right\">NA</td>\n<td class=\"gt_row gt_left\">fig</td>\n<td class=\"gt_row gt_center\">six</td>\n<td class=\"gt_row gt_left\">2015-06-15</td>\n<td class=\"gt_row gt_left\">NA</td>\n<td class=\"gt_row gt_left\">2018-06-06 16:11</td>\n<td class=\"gt_row gt_right\">13.255</td></tr>\n    <tr><td class=\"gt_row gt_right gt_stub\">row_7</td>\n<td class=\"gt_row gt_right\">7.770e+05</td>\n<td class=\"gt_row gt_left\">grapefruit</td>\n<td class=\"gt_row gt_center\">seven</td>\n<td class=\"gt_row gt_left\">NA</td>\n<td class=\"gt_row gt_left\">19:10</td>\n<td class=\"gt_row gt_left\">2018-07-07 05:22</td>\n<td class=\"gt_row gt_right\">NA</td></tr>\n    <tr><td class=\"gt_row gt_right gt_stub\">row_8</td>\n<td class=\"gt_row gt_right\">8.880e+06</td>\n<td class=\"gt_row gt_left\">honeydew</td>\n<td class=\"gt_row gt_center\">eight</td>\n<td class=\"gt_row gt_left\">2015-08-15</td>\n<td class=\"gt_row gt_left\">20:20</td>\n<td class=\"gt_row gt_left\">NA</td>\n<td class=\"gt_row gt_right\">0.440</td></tr>\n    <tr><td class=\"gt_row gt_right gt_stub gt_summary_row gt_first_summary_row thick\">min</td>\n<td class=\"gt_row gt_right gt_summary_row gt_first_summary_row thick\">5550.00</td>\n<td class=\"gt_row gt_left gt_summary_row gt_first_summary_row thick\">&mdash;</td>\n<td class=\"gt_row gt_center gt_summary_row gt_first_summary_row thick\">&mdash;</td>\n<td class=\"gt_row gt_left gt_summary_row gt_first_summary_row thick\">&mdash;</td>\n<td class=\"gt_row gt_left gt_summary_row gt_first_summary_row thick\">&mdash;</td>\n<td class=\"gt_row gt_left gt_summary_row gt_first_summary_row thick\">&mdash;</td>\n<td class=\"gt_row gt_right gt_summary_row gt_first_summary_row thick\">0.44</td></tr>\n    <tr><td class=\"gt_row gt_right gt_stub gt_summary_row\">max</td>\n<td class=\"gt_row gt_right gt_summary_row\">8880000.00</td>\n<td class=\"gt_row gt_left gt_summary_row\">&mdash;</td>\n<td class=\"gt_row gt_center gt_summary_row\">&mdash;</td>\n<td class=\"gt_row gt_left gt_summary_row\">&mdash;</td>\n<td class=\"gt_row gt_left gt_summary_row\">&mdash;</td>\n<td class=\"gt_row gt_left gt_summary_row\">&mdash;</td>\n<td class=\"gt_row gt_right gt_summary_row\">1325.81</td></tr>\n    <tr><td class=\"gt_row gt_right gt_stub gt_summary_row gt_last_summary_row\">avg</td>\n<td class=\"gt_row gt_right gt_summary_row gt_last_summary_row\">3220850.00</td>\n<td class=\"gt_row gt_left gt_summary_row gt_last_summary_row\">&mdash;</td>\n<td class=\"gt_row gt_center gt_summary_row gt_last_summary_row\">&mdash;</td>\n<td class=\"gt_row gt_left gt_summary_row gt_last_summary_row\">&mdash;</td>\n<td class=\"gt_row gt_left gt_summary_row gt_last_summary_row\">&mdash;</td>\n<td class=\"gt_row gt_left gt_summary_row gt_last_summary_row\">&mdash;</td>\n<td class=\"gt_row gt_right gt_summary_row gt_last_summary_row\">446.50</td></tr>\n    <tr><td class=\"gt_row gt_right gt_stub gt_grand_summary_row gt_first_grand_summary_row\">min</td>\n<td class=\"gt_row gt_right gt_grand_summary_row gt_first_grand_summary_row\">0.11</td>\n<td class=\"gt_row gt_left gt_grand_summary_row gt_first_grand_summary_row\">&mdash;</td>\n<td class=\"gt_row gt_center gt_grand_summary_row gt_first_grand_summary_row\">&mdash;</td>\n<td class=\"gt_row gt_left gt_grand_summary_row gt_first_grand_summary_row\">&mdash;</td>\n<td class=\"gt_row gt_left gt_grand_summary_row gt_first_grand_summary_row\">&mdash;</td>\n<td class=\"gt_row gt_left gt_grand_summary_row gt_first_grand_summary_row\">&mdash;</td>\n<td class=\"gt_row gt_right gt_grand_summary_row gt_first_grand_summary_row\">0.44</td></tr>\n    <tr><td class=\"gt_row gt_right gt_stub gt_grand_summary_row\">max</td>\n<td class=\"gt_row gt_right gt_grand_summary_row\">8880000.00</td>\n<td class=\"gt_row gt_left gt_grand_summary_row\">&mdash;</td>\n<td class=\"gt_row gt_center gt_grand_summary_row\">&mdash;</td>\n<td class=\"gt_row gt_left gt_grand_summary_row\">&mdash;</td>\n<td class=\"gt_row gt_left gt_grand_summary_row\">&mdash;</td>\n<td class=\"gt_row gt_left gt_grand_summary_row\">&mdash;</td>\n<td class=\"gt_row gt_right gt_grand_summary_row\">65100.00</td></tr>\n    <tr><td class=\"gt_row gt_right gt_stub gt_grand_summary_row gt_last_summary_row\">avg</td>\n<td class=\"gt_row gt_right gt_grand_summary_row gt_last_summary_row\">1380432.87</td>\n<td class=\"gt_row gt_left gt_grand_summary_row gt_last_summary_row\">&mdash;</td>\n<td class=\"gt_row gt_center gt_grand_summary_row gt_last_summary_row\">&mdash;</td>\n<td class=\"gt_row gt_left gt_grand_summary_row gt_last_summary_row\">&mdash;</td>\n<td class=\"gt_row gt_left gt_grand_summary_row gt_last_summary_row\">&mdash;</td>\n<td class=\"gt_row gt_left gt_grand_summary_row gt_last_summary_row\">&mdash;</td>\n<td class=\"gt_row gt_right gt_grand_summary_row gt_last_summary_row\">9501.26</td></tr>\n  </tbody>\n  <tfoot class=\"gt_sourcenotes\">\n    <tr>\n      <td class=\"gt_sourcenote\" colspan=\"8\">Source note #1</td>\n    </tr>\n    <tr>\n      <td class=\"gt_sourcenote\" colspan=\"8\">Source note #2</td>\n    </tr>\n  </tfoot>\n  \n</table>"

---

    Code
      .
    Output
      [1] "\\captionsetup[table]{labelformat=empty,skip=1pt}\n\\setlength{\\LTpost}{0mm}\n\\begin{longtable}{r|rlclllr}\n\\caption*{\n{\\large Data listing from \\textbf{exibble}} \\\\ \n{\\small \\texttt{exibble} is an R dataset}\n} \\\\ \n\\toprule\n\\multicolumn{1}{l}{} &  &  &  & \\multicolumn{3}{c}{timing} &  \\\\ \n\\cmidrule(lr){5-7}\n\\multicolumn{1}{l}{S.L.} & num & char & fctr & date & time & datetime & currency \\\\ \n\\midrule\n\\multicolumn{1}{l}{grp\\_a} \\\\ \n\\midrule\nrow\\_1 & 1.111e-01 & apricot & one & 2015-01-15 & 13:35 & 2018-01-01 02:22 & 49.950 \\\\ \nrow\\_2 & 2.222e+00 & banana & two & 2015-02-15 & 14:40 & 2018-02-02 14:33 & 17.950 \\\\ \nrow\\_3 & 3.333e+01 & coconut & three & 2015-03-15 & 15:45 & 2018-03-03 03:44 & 1.390 \\\\ \nrow\\_4 & 4.444e+02 & durian & four & 2015-04-15 & 16:50 & 2018-04-04 15:55 & 65100.000 \\\\ \n\\midrule \nmin & $0.11$ & — & — & — & — & — & $1.39$ \\\\ \nmax & $444.40$ & — & — & — & — & — & $65100.00$ \\\\ \navg & $120.02$ & — & — & — & — & — & $16292.32$ \\\\ \n\\midrule\n\\multicolumn{1}{l}{grp\\_b} \\\\ \n\\midrule\nrow\\_5 & 5.550e+03 & NA & five & 2015-05-15 & 17:55 & 2018-05-05 04:00 & 1325.810 \\\\ \nrow\\_6 & NA & fig & six & 2015-06-15 & NA & 2018-06-06 16:11 & 13.255 \\\\ \nrow\\_7 & 7.770e+05 & grapefruit & seven & NA & 19:10 & 2018-07-07 05:22 & NA \\\\ \nrow\\_8 & 8.880e+06 & honeydew & eight & 2015-08-15 & 20:20 & NA & 0.440 \\\\ \n\\midrule \nmin & $5550.00$ & — & — & — & — & — & $0.44$ \\\\ \nmax & $8880000.00$ & — & — & — & — & — & $1325.81$ \\\\ \navg & $3220850.00$ & — & — & — & — & — & $446.50$ \\\\ \n\\midrule \n\\midrule \nmin & $0.11$ & — & — & — & — & — & $0.44$ \\\\ \nmax & $8880000.00$ & — & — & — & — & — & $65100.00$ \\\\ \navg & $1380432.87$ & — & — & — & — & — & $9501.26$ \\\\ \n\\bottomrule\n\\end{longtable}\n\\begin{minipage}{\\linewidth}\nSource note \\#1\\\\\nSource note \\#2\\\\\n\\end{minipage}\n"

---

    Code
      .
    Output
      {\rtf\ansi\ansicpg1252{\fonttbl{\f0\froman\fcharset0\fprq0 Courier New;}{\f1\froman\fcharset0\fprq0 Times;}}{\colortbl;\red51\green51\blue51;\red211\green211\blue211;}
      
      \paperw12240\paperh15840\widowctrl\ftnbj\fet0\sectd\linex0
      \lndscpsxn
      \margl1440\margr1440\margt1440\margb1440
      \headery720\footery720\fs20
      
      \trowd\trrh0\trhdr
      
      \pard\plain\uc0\qc\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx9360
      \intbl {\f0\cf1 {\f0\fs20 Data listing from {\b exibble}} {\f0\fs20\i\super } \line {\f0\fs20 {\f1 exibble} is an R dataset} {\f0\fs20\i\super }}\cell
      \pard\plain
      
      \row
      
      \trowd\trrh0\trhdr
      
      \pard\plain\uc0\qc\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx1170
      \intbl {\f0 {\f0\fs20 }}\cell
      \pard\plain
      
      \pard\plain\uc0\qc\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx2340
      \intbl {\f0 {\f0\fs20 }}\cell
      \pard\plain
      
      \pard\plain\uc0\qc\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx3510
      \intbl {\f0 {\f0\fs20 }}\cell
      \pard\plain
      
      \pard\plain\uc0\qc\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx4680
      \intbl {\f0 {\f0\fs20 }}\cell
      \pard\plain
      
      \pard\plain\uc0\qc\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clmgf\cellx5850
      \intbl {\f0 {\f0\fs20 timing}}\cell
      \pard\plain
      
      \pard\plain\uc0\qc\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clmrg\cellx7020
      \intbl {\f0 {\f0\fs20 timing}}\cell
      \pard\plain
      
      \pard\plain\uc0\qc\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clmrg\cellx8190
      \intbl {\f0 {\f0\fs20 timing}}\cell
      \pard\plain
      
      \pard\plain\uc0\qc\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx9360
      \intbl {\f0 {\f0\fs20 }}\cell
      \pard\plain
      
      \row
      
      \trowd\trrh0\trhdr
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clbrdrb\brdrs\brdrw40\brdrcf2\cellx1170
      \intbl {\f0 {\f0\fs20 S.L.}}\cell
      \pard\plain
      
      \pard\plain\uc0\qr\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clbrdrb\brdrs\brdrw40\brdrcf2\cellx2340
      \intbl {\f0 {\f0\fs20 num}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clbrdrb\brdrs\brdrw40\brdrcf2\cellx3510
      \intbl {\f0 {\f0\fs20 char}}\cell
      \pard\plain
      
      \pard\plain\uc0\qc\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clbrdrb\brdrs\brdrw40\brdrcf2\cellx4680
      \intbl {\f0 {\f0\fs20 fctr}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clbrdrb\brdrs\brdrw40\brdrcf2\cellx5850
      \intbl {\f0 {\f0\fs20 date}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clbrdrb\brdrs\brdrw40\brdrcf2\cellx7020
      \intbl {\f0 {\f0\fs20 time}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clbrdrb\brdrs\brdrw40\brdrcf2\cellx8190
      \intbl {\f0 {\f0\fs20 datetime}}\cell
      \pard\plain
      
      \pard\plain\uc0\qr\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clbrdrb\brdrs\brdrw40\brdrcf2\cellx9360
      \intbl {\f0 {\f0\fs20 currency}}\cell
      \pard\plain
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx9360
      \intbl {\f0\fs20 grp_a}\cell
      \pard\plain
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\qr\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx1170
      \intbl {\f0 {\f0\fs20 row_1}}\cell
      \pard\plain
      
      \pard\plain\uc0\qr\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx2340
      \intbl {\f0 {\f0\fs20 1.111e-01}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx3510
      \intbl {\f0 {\f0\fs20 apricot}}\cell
      \pard\plain
      
      \pard\plain\uc0\qc\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx4680
      \intbl {\f0 {\f0\fs20 one}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx5850
      \intbl {\f0 {\f0\fs20 2015-01-15}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx7020
      \intbl {\f0 {\f0\fs20 13:35}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx8190
      \intbl {\f0 {\f0\fs20 2018-01-01 02:22}}\cell
      \pard\plain
      
      \pard\plain\uc0\qr\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx9360
      \intbl {\f0 {\f0\fs20 49.950}}\cell
      \pard\plain
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\qr\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx1170
      \intbl {\f0 {\f0\fs20 row_2}}\cell
      \pard\plain
      
      \pard\plain\uc0\qr\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx2340
      \intbl {\f0 {\f0\fs20 2.222e+00}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx3510
      \intbl {\f0 {\f0\fs20 banana}}\cell
      \pard\plain
      
      \pard\plain\uc0\qc\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx4680
      \intbl {\f0 {\f0\fs20 two}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx5850
      \intbl {\f0 {\f0\fs20 2015-02-15}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx7020
      \intbl {\f0 {\f0\fs20 14:40}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx8190
      \intbl {\f0 {\f0\fs20 2018-02-02 14:33}}\cell
      \pard\plain
      
      \pard\plain\uc0\qr\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx9360
      \intbl {\f0 {\f0\fs20 17.950}}\cell
      \pard\plain
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\qr\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx1170
      \intbl {\f0 {\f0\fs20 row_3}}\cell
      \pard\plain
      
      \pard\plain\uc0\qr\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx2340
      \intbl {\f0 {\f0\fs20 3.333e+01}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx3510
      \intbl {\f0 {\f0\fs20 coconut}}\cell
      \pard\plain
      
      \pard\plain\uc0\qc\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx4680
      \intbl {\f0 {\f0\fs20 three}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx5850
      \intbl {\f0 {\f0\fs20 2015-03-15}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx7020
      \intbl {\f0 {\f0\fs20 15:45}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx8190
      \intbl {\f0 {\f0\fs20 2018-03-03 03:44}}\cell
      \pard\plain
      
      \pard\plain\uc0\qr\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx9360
      \intbl {\f0 {\f0\fs20 1.390}}\cell
      \pard\plain
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\qr\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx1170
      \intbl {\f0 {\f0\fs20 row_4}}\cell
      \pard\plain
      
      \pard\plain\uc0\qr\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx2340
      \intbl {\f0 {\f0\fs20 4.444e+02}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx3510
      \intbl {\f0 {\f0\fs20 durian}}\cell
      \pard\plain
      
      \pard\plain\uc0\qc\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx4680
      \intbl {\f0 {\f0\fs20 four}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx5850
      \intbl {\f0 {\f0\fs20 2015-04-15}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx7020
      \intbl {\f0 {\f0\fs20 16:50}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx8190
      \intbl {\f0 {\f0\fs20 2018-04-04 15:55}}\cell
      \pard\plain
      
      \pard\plain\uc0\qr\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx9360
      \intbl {\f0 {\f0\fs20 65100.000}}\cell
      \pard\plain
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\qr\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx1170
      \intbl {\f0 {\f0\fs20 min}}\cell
      \pard\plain
      
      \pard\plain\uc0\qr\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx2340
      \intbl {\f0 {\f0\fs20 0.11}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx3510
      \intbl {\f0 {\f0\fs20 \'97}}\cell
      \pard\plain
      
      \pard\plain\uc0\qc\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx4680
      \intbl {\f0 {\f0\fs20 \'97}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx5850
      \intbl {\f0 {\f0\fs20 \'97}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx7020
      \intbl {\f0 {\f0\fs20 \'97}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx8190
      \intbl {\f0 {\f0\fs20 \'97}}\cell
      \pard\plain
      
      \pard\plain\uc0\qr\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx9360
      \intbl {\f0 {\f0\fs20 1.39}}\cell
      \pard\plain
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\qr\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx1170
      \intbl {\f0 {\f0\fs20 max}}\cell
      \pard\plain
      
      \pard\plain\uc0\qr\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx2340
      \intbl {\f0 {\f0\fs20 444.40}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx3510
      \intbl {\f0 {\f0\fs20 \'97}}\cell
      \pard\plain
      
      \pard\plain\uc0\qc\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx4680
      \intbl {\f0 {\f0\fs20 \'97}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx5850
      \intbl {\f0 {\f0\fs20 \'97}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx7020
      \intbl {\f0 {\f0\fs20 \'97}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx8190
      \intbl {\f0 {\f0\fs20 \'97}}\cell
      \pard\plain
      
      \pard\plain\uc0\qr\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx9360
      \intbl {\f0 {\f0\fs20 65100.00}}\cell
      \pard\plain
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\qr\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx1170
      \intbl {\f0 {\f0\fs20 avg}}\cell
      \pard\plain
      
      \pard\plain\uc0\qr\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx2340
      \intbl {\f0 {\f0\fs20 120.02}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx3510
      \intbl {\f0 {\f0\fs20 \'97}}\cell
      \pard\plain
      
      \pard\plain\uc0\qc\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx4680
      \intbl {\f0 {\f0\fs20 \'97}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx5850
      \intbl {\f0 {\f0\fs20 \'97}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx7020
      \intbl {\f0 {\f0\fs20 \'97}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx8190
      \intbl {\f0 {\f0\fs20 \'97}}\cell
      \pard\plain
      
      \pard\plain\uc0\qr\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx9360
      \intbl {\f0 {\f0\fs20 16292.32}}\cell
      \pard\plain
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx9360
      \intbl {\f0\fs20 grp_b}\cell
      \pard\plain
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\qr\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx1170
      \intbl {\f0 {\f0\fs20 row_5}}\cell
      \pard\plain
      
      \pard\plain\uc0\qr\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx2340
      \intbl {\f0 {\f0\fs20 5.550e+03}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx3510
      \intbl {\f0 {\f0\fs20 NA}}\cell
      \pard\plain
      
      \pard\plain\uc0\qc\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx4680
      \intbl {\f0 {\f0\fs20 five}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx5850
      \intbl {\f0 {\f0\fs20 2015-05-15}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx7020
      \intbl {\f0 {\f0\fs20 17:55}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx8190
      \intbl {\f0 {\f0\fs20 2018-05-05 04:00}}\cell
      \pard\plain
      
      \pard\plain\uc0\qr\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx9360
      \intbl {\f0 {\f0\fs20 1325.810}}\cell
      \pard\plain
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\qr\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx1170
      \intbl {\f0 {\f0\fs20 row_6}}\cell
      \pard\plain
      
      \pard\plain\uc0\qr\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx2340
      \intbl {\f0 {\f0\fs20 NA}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx3510
      \intbl {\f0 {\f0\fs20 fig}}\cell
      \pard\plain
      
      \pard\plain\uc0\qc\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx4680
      \intbl {\f0 {\f0\fs20 six}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx5850
      \intbl {\f0 {\f0\fs20 2015-06-15}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx7020
      \intbl {\f0 {\f0\fs20 NA}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx8190
      \intbl {\f0 {\f0\fs20 2018-06-06 16:11}}\cell
      \pard\plain
      
      \pard\plain\uc0\qr\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx9360
      \intbl {\f0 {\f0\fs20 13.255}}\cell
      \pard\plain
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\qr\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx1170
      \intbl {\f0 {\f0\fs20 row_7}}\cell
      \pard\plain
      
      \pard\plain\uc0\qr\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx2340
      \intbl {\f0 {\f0\fs20 7.770e+05}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx3510
      \intbl {\f0 {\f0\fs20 grapefruit}}\cell
      \pard\plain
      
      \pard\plain\uc0\qc\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx4680
      \intbl {\f0 {\f0\fs20 seven}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx5850
      \intbl {\f0 {\f0\fs20 NA}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx7020
      \intbl {\f0 {\f0\fs20 19:10}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx8190
      \intbl {\f0 {\f0\fs20 2018-07-07 05:22}}\cell
      \pard\plain
      
      \pard\plain\uc0\qr\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx9360
      \intbl {\f0 {\f0\fs20 NA}}\cell
      \pard\plain
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\qr\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx1170
      \intbl {\f0 {\f0\fs20 row_8}}\cell
      \pard\plain
      
      \pard\plain\uc0\qr\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx2340
      \intbl {\f0 {\f0\fs20 8.880e+06}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx3510
      \intbl {\f0 {\f0\fs20 honeydew}}\cell
      \pard\plain
      
      \pard\plain\uc0\qc\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx4680
      \intbl {\f0 {\f0\fs20 eight}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx5850
      \intbl {\f0 {\f0\fs20 2015-08-15}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx7020
      \intbl {\f0 {\f0\fs20 20:20}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx8190
      \intbl {\f0 {\f0\fs20 NA}}\cell
      \pard\plain
      
      \pard\plain\uc0\qr\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx9360
      \intbl {\f0 {\f0\fs20 0.440}}\cell
      \pard\plain
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\qr\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx1170
      \intbl {\f0 {\f0\fs20 min}}\cell
      \pard\plain
      
      \pard\plain\uc0\qr\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx2340
      \intbl {\f0 {\f0\fs20 5550.00}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx3510
      \intbl {\f0 {\f0\fs20 \'97}}\cell
      \pard\plain
      
      \pard\plain\uc0\qc\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx4680
      \intbl {\f0 {\f0\fs20 \'97}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx5850
      \intbl {\f0 {\f0\fs20 \'97}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx7020
      \intbl {\f0 {\f0\fs20 \'97}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx8190
      \intbl {\f0 {\f0\fs20 \'97}}\cell
      \pard\plain
      
      \pard\plain\uc0\qr\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx9360
      \intbl {\f0 {\f0\fs20 0.44}}\cell
      \pard\plain
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\qr\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx1170
      \intbl {\f0 {\f0\fs20 max}}\cell
      \pard\plain
      
      \pard\plain\uc0\qr\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx2340
      \intbl {\f0 {\f0\fs20 8880000.00}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx3510
      \intbl {\f0 {\f0\fs20 \'97}}\cell
      \pard\plain
      
      \pard\plain\uc0\qc\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx4680
      \intbl {\f0 {\f0\fs20 \'97}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx5850
      \intbl {\f0 {\f0\fs20 \'97}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx7020
      \intbl {\f0 {\f0\fs20 \'97}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx8190
      \intbl {\f0 {\f0\fs20 \'97}}\cell
      \pard\plain
      
      \pard\plain\uc0\qr\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx9360
      \intbl {\f0 {\f0\fs20 1325.81}}\cell
      \pard\plain
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\qr\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx1170
      \intbl {\f0 {\f0\fs20 avg}}\cell
      \pard\plain
      
      \pard\plain\uc0\qr\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx2340
      \intbl {\f0 {\f0\fs20 3220850.00}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx3510
      \intbl {\f0 {\f0\fs20 \'97}}\cell
      \pard\plain
      
      \pard\plain\uc0\qc\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx4680
      \intbl {\f0 {\f0\fs20 \'97}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx5850
      \intbl {\f0 {\f0\fs20 \'97}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx7020
      \intbl {\f0 {\f0\fs20 \'97}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx8190
      \intbl {\f0 {\f0\fs20 \'97}}\cell
      \pard\plain
      
      \pard\plain\uc0\qr\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx9360
      \intbl {\f0 {\f0\fs20 446.50}}\cell
      \pard\plain
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\qr\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx1170
      \intbl {\f0 {\f0\fs20 min}}\cell
      \pard\plain
      
      \pard\plain\uc0\qr\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx2340
      \intbl {\f0 {\f0\fs20 0.11}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx3510
      \intbl {\f0 {\f0\fs20 \'97}}\cell
      \pard\plain
      
      \pard\plain\uc0\qc\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx4680
      \intbl {\f0 {\f0\fs20 \'97}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx5850
      \intbl {\f0 {\f0\fs20 \'97}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx7020
      \intbl {\f0 {\f0\fs20 \'97}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx8190
      \intbl {\f0 {\f0\fs20 \'97}}\cell
      \pard\plain
      
      \pard\plain\uc0\qr\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx9360
      \intbl {\f0 {\f0\fs20 0.44}}\cell
      \pard\plain
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\qr\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx1170
      \intbl {\f0 {\f0\fs20 max}}\cell
      \pard\plain
      
      \pard\plain\uc0\qr\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx2340
      \intbl {\f0 {\f0\fs20 8880000.00}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx3510
      \intbl {\f0 {\f0\fs20 \'97}}\cell
      \pard\plain
      
      \pard\plain\uc0\qc\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx4680
      \intbl {\f0 {\f0\fs20 \'97}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx5850
      \intbl {\f0 {\f0\fs20 \'97}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx7020
      \intbl {\f0 {\f0\fs20 \'97}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx8190
      \intbl {\f0 {\f0\fs20 \'97}}\cell
      \pard\plain
      
      \pard\plain\uc0\qr\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx9360
      \intbl {\f0 {\f0\fs20 65100.00}}\cell
      \pard\plain
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\qr\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx1170
      \intbl {\f0 {\f0\fs20 avg}}\cell
      \pard\plain
      
      \pard\plain\uc0\qr\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx2340
      \intbl {\f0 {\f0\fs20 1380432.87}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx3510
      \intbl {\f0 {\f0\fs20 \'97}}\cell
      \pard\plain
      
      \pard\plain\uc0\qc\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx4680
      \intbl {\f0 {\f0\fs20 \'97}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx5850
      \intbl {\f0 {\f0\fs20 \'97}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx7020
      \intbl {\f0 {\f0\fs20 \'97}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx8190
      \intbl {\f0 {\f0\fs20 \'97}}\cell
      \pard\plain
      
      \pard\plain\uc0\qr\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx9360
      \intbl {\f0 {\f0\fs20 9501.26}}\cell
      \pard\plain
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx9360
      \intbl {\f0 {\f0\fs20 Source note #1\line Source note #2}}\cell
      \pard\plain
      
      \row
      
      }

---

    Code
      .
    Output
      [1] "<table class=\"gt_table\">\n  <thead class=\"gt_header\">\n    <tr>\n      <th colspan=\"9\" class=\"gt_heading gt_title gt_font_normal\" style>Data listing from <strong>exibble</strong></th>\n    </tr>\n    <tr>\n      <th colspan=\"9\" class=\"gt_heading gt_subtitle gt_font_normal gt_bottom_border\" style><code>exibble</code> is an R dataset</th>\n    </tr>\n  </thead>\n  <thead class=\"gt_col_headings\">\n    <tr>\n      <th class=\"gt_col_heading gt_columns_bottom_border gt_left\" rowspan=\"2\" colspan=\"2\">S.L.</th>\n      <th class=\"gt_col_heading gt_columns_bottom_border gt_right\" rowspan=\"2\" colspan=\"1\">num</th>\n      <th class=\"gt_col_heading gt_columns_bottom_border gt_left\" rowspan=\"2\" colspan=\"1\">char</th>\n      <th class=\"gt_col_heading gt_columns_bottom_border gt_center\" rowspan=\"2\" colspan=\"1\">fctr</th>\n      <th class=\"gt_center gt_columns_top_border gt_column_spanner_outer\" rowspan=\"1\" colspan=\"3\">\n        <span class=\"gt_column_spanner\">timing</span>\n      </th>\n      <th class=\"gt_col_heading gt_columns_bottom_border gt_right\" rowspan=\"2\" colspan=\"1\">currency</th>\n    </tr>\n    <tr>\n      <th class=\"gt_col_heading gt_columns_bottom_border gt_left\" rowspan=\"1\" colspan=\"1\">date</th>\n      <th class=\"gt_col_heading gt_columns_bottom_border gt_left\" rowspan=\"1\" colspan=\"1\">time</th>\n      <th class=\"gt_col_heading gt_columns_bottom_border gt_left\" rowspan=\"1\" colspan=\"1\">datetime</th>\n    </tr>\n  </thead>\n  <tbody class=\"gt_table_body\">\n    <tr class=\"gt_row_group_first\"><td rowspan=\"7\" class=\"gt_row gt_right gt_stub_row_group\">grp_a</td>\n<td class=\"gt_row gt_right gt_stub\">row_1</td>\n<td class=\"gt_row gt_right\">1.111e-01</td>\n<td class=\"gt_row gt_left\">apricot</td>\n<td class=\"gt_row gt_center\">one</td>\n<td class=\"gt_row gt_left\">2015-01-15</td>\n<td class=\"gt_row gt_left\">13:35</td>\n<td class=\"gt_row gt_left\">2018-01-01 02:22</td>\n<td class=\"gt_row gt_right\">49.950</td></tr>\n    <tr><td class=\"gt_row gt_right gt_stub\">row_2</td>\n<td class=\"gt_row gt_right\">2.222e+00</td>\n<td class=\"gt_row gt_left\">banana</td>\n<td class=\"gt_row gt_center\">two</td>\n<td class=\"gt_row gt_left\">2015-02-15</td>\n<td class=\"gt_row gt_left\">14:40</td>\n<td class=\"gt_row gt_left\">2018-02-02 14:33</td>\n<td class=\"gt_row gt_right\">17.950</td></tr>\n    <tr><td class=\"gt_row gt_right gt_stub\">row_3</td>\n<td class=\"gt_row gt_right\">3.333e+01</td>\n<td class=\"gt_row gt_left\">coconut</td>\n<td class=\"gt_row gt_center\">three</td>\n<td class=\"gt_row gt_left\">2015-03-15</td>\n<td class=\"gt_row gt_left\">15:45</td>\n<td class=\"gt_row gt_left\">2018-03-03 03:44</td>\n<td class=\"gt_row gt_right\">1.390</td></tr>\n    <tr><td class=\"gt_row gt_right gt_stub\">row_4</td>\n<td class=\"gt_row gt_right\">4.444e+02</td>\n<td class=\"gt_row gt_left\">durian</td>\n<td class=\"gt_row gt_center\">four</td>\n<td class=\"gt_row gt_left\">2015-04-15</td>\n<td class=\"gt_row gt_left\">16:50</td>\n<td class=\"gt_row gt_left\">2018-04-04 15:55</td>\n<td class=\"gt_row gt_right\">65100.000</td></tr>\n    <tr><td class=\"gt_row gt_right gt_stub gt_summary_row gt_first_summary_row thick\">min</td>\n<td class=\"gt_row gt_right gt_summary_row gt_first_summary_row thick\">0.11</td>\n<td class=\"gt_row gt_left gt_summary_row gt_first_summary_row thick\">&mdash;</td>\n<td class=\"gt_row gt_center gt_summary_row gt_first_summary_row thick\">&mdash;</td>\n<td class=\"gt_row gt_left gt_summary_row gt_first_summary_row thick\">&mdash;</td>\n<td class=\"gt_row gt_left gt_summary_row gt_first_summary_row thick\">&mdash;</td>\n<td class=\"gt_row gt_left gt_summary_row gt_first_summary_row thick\">&mdash;</td>\n<td class=\"gt_row gt_right gt_summary_row gt_first_summary_row thick\">1.39</td></tr>\n    <tr><td class=\"gt_row gt_right gt_stub gt_summary_row\">max</td>\n<td class=\"gt_row gt_right gt_summary_row\">444.40</td>\n<td class=\"gt_row gt_left gt_summary_row\">&mdash;</td>\n<td class=\"gt_row gt_center gt_summary_row\">&mdash;</td>\n<td class=\"gt_row gt_left gt_summary_row\">&mdash;</td>\n<td class=\"gt_row gt_left gt_summary_row\">&mdash;</td>\n<td class=\"gt_row gt_left gt_summary_row\">&mdash;</td>\n<td class=\"gt_row gt_right gt_summary_row\">65100.00</td></tr>\n    <tr><td class=\"gt_row gt_right gt_stub gt_summary_row gt_last_summary_row\">avg</td>\n<td class=\"gt_row gt_right gt_summary_row gt_last_summary_row\">120.02</td>\n<td class=\"gt_row gt_left gt_summary_row gt_last_summary_row\">&mdash;</td>\n<td class=\"gt_row gt_center gt_summary_row gt_last_summary_row\">&mdash;</td>\n<td class=\"gt_row gt_left gt_summary_row gt_last_summary_row\">&mdash;</td>\n<td class=\"gt_row gt_left gt_summary_row gt_last_summary_row\">&mdash;</td>\n<td class=\"gt_row gt_left gt_summary_row gt_last_summary_row\">&mdash;</td>\n<td class=\"gt_row gt_right gt_summary_row gt_last_summary_row\">16292.32</td></tr>\n    <tr class=\"gt_row_group_first\"><td rowspan=\"7\" class=\"gt_row gt_right gt_stub_row_group\">grp_b</td>\n<td class=\"gt_row gt_right gt_stub\">row_5</td>\n<td class=\"gt_row gt_right\">5.550e+03</td>\n<td class=\"gt_row gt_left\">NA</td>\n<td class=\"gt_row gt_center\">five</td>\n<td class=\"gt_row gt_left\">2015-05-15</td>\n<td class=\"gt_row gt_left\">17:55</td>\n<td class=\"gt_row gt_left\">2018-05-05 04:00</td>\n<td class=\"gt_row gt_right\">1325.810</td></tr>\n    <tr><td class=\"gt_row gt_right gt_stub\">row_6</td>\n<td class=\"gt_row gt_right\">NA</td>\n<td class=\"gt_row gt_left\">fig</td>\n<td class=\"gt_row gt_center\">six</td>\n<td class=\"gt_row gt_left\">2015-06-15</td>\n<td class=\"gt_row gt_left\">NA</td>\n<td class=\"gt_row gt_left\">2018-06-06 16:11</td>\n<td class=\"gt_row gt_right\">13.255</td></tr>\n    <tr><td class=\"gt_row gt_right gt_stub\">row_7</td>\n<td class=\"gt_row gt_right\">7.770e+05</td>\n<td class=\"gt_row gt_left\">grapefruit</td>\n<td class=\"gt_row gt_center\">seven</td>\n<td class=\"gt_row gt_left\">NA</td>\n<td class=\"gt_row gt_left\">19:10</td>\n<td class=\"gt_row gt_left\">2018-07-07 05:22</td>\n<td class=\"gt_row gt_right\">NA</td></tr>\n    <tr><td class=\"gt_row gt_right gt_stub\">row_8</td>\n<td class=\"gt_row gt_right\">8.880e+06</td>\n<td class=\"gt_row gt_left\">honeydew</td>\n<td class=\"gt_row gt_center\">eight</td>\n<td class=\"gt_row gt_left\">2015-08-15</td>\n<td class=\"gt_row gt_left\">20:20</td>\n<td class=\"gt_row gt_left\">NA</td>\n<td class=\"gt_row gt_right\">0.440</td></tr>\n    <tr><td class=\"gt_row gt_right gt_stub gt_summary_row gt_first_summary_row thick\">min</td>\n<td class=\"gt_row gt_right gt_summary_row gt_first_summary_row thick\">5550.00</td>\n<td class=\"gt_row gt_left gt_summary_row gt_first_summary_row thick\">&mdash;</td>\n<td class=\"gt_row gt_center gt_summary_row gt_first_summary_row thick\">&mdash;</td>\n<td class=\"gt_row gt_left gt_summary_row gt_first_summary_row thick\">&mdash;</td>\n<td class=\"gt_row gt_left gt_summary_row gt_first_summary_row thick\">&mdash;</td>\n<td class=\"gt_row gt_left gt_summary_row gt_first_summary_row thick\">&mdash;</td>\n<td class=\"gt_row gt_right gt_summary_row gt_first_summary_row thick\">0.44</td></tr>\n    <tr><td class=\"gt_row gt_right gt_stub gt_summary_row\">max</td>\n<td class=\"gt_row gt_right gt_summary_row\">8880000.00</td>\n<td class=\"gt_row gt_left gt_summary_row\">&mdash;</td>\n<td class=\"gt_row gt_center gt_summary_row\">&mdash;</td>\n<td class=\"gt_row gt_left gt_summary_row\">&mdash;</td>\n<td class=\"gt_row gt_left gt_summary_row\">&mdash;</td>\n<td class=\"gt_row gt_left gt_summary_row\">&mdash;</td>\n<td class=\"gt_row gt_right gt_summary_row\">1325.81</td></tr>\n    <tr><td class=\"gt_row gt_right gt_stub gt_summary_row gt_last_summary_row\">avg</td>\n<td class=\"gt_row gt_right gt_summary_row gt_last_summary_row\">3220850.00</td>\n<td class=\"gt_row gt_left gt_summary_row gt_last_summary_row\">&mdash;</td>\n<td class=\"gt_row gt_center gt_summary_row gt_last_summary_row\">&mdash;</td>\n<td class=\"gt_row gt_left gt_summary_row gt_last_summary_row\">&mdash;</td>\n<td class=\"gt_row gt_left gt_summary_row gt_last_summary_row\">&mdash;</td>\n<td class=\"gt_row gt_left gt_summary_row gt_last_summary_row\">&mdash;</td>\n<td class=\"gt_row gt_right gt_summary_row gt_last_summary_row\">446.50</td></tr>\n    <tr><td colspan=\"2\" class=\"gt_row gt_right gt_stub gt_grand_summary_row gt_first_grand_summary_row\">min</td>\n<td class=\"gt_row gt_right gt_grand_summary_row gt_first_grand_summary_row\">0.11</td>\n<td class=\"gt_row gt_left gt_grand_summary_row gt_first_grand_summary_row\">&mdash;</td>\n<td class=\"gt_row gt_center gt_grand_summary_row gt_first_grand_summary_row\">&mdash;</td>\n<td class=\"gt_row gt_left gt_grand_summary_row gt_first_grand_summary_row\">&mdash;</td>\n<td class=\"gt_row gt_left gt_grand_summary_row gt_first_grand_summary_row\">&mdash;</td>\n<td class=\"gt_row gt_left gt_grand_summary_row gt_first_grand_summary_row\">&mdash;</td>\n<td class=\"gt_row gt_right gt_grand_summary_row gt_first_grand_summary_row\">0.44</td></tr>\n    <tr><td colspan=\"2\" class=\"gt_row gt_right gt_stub gt_grand_summary_row\">max</td>\n<td class=\"gt_row gt_right gt_grand_summary_row\">8880000.00</td>\n<td class=\"gt_row gt_left gt_grand_summary_row\">&mdash;</td>\n<td class=\"gt_row gt_center gt_grand_summary_row\">&mdash;</td>\n<td class=\"gt_row gt_left gt_grand_summary_row\">&mdash;</td>\n<td class=\"gt_row gt_left gt_grand_summary_row\">&mdash;</td>\n<td class=\"gt_row gt_left gt_grand_summary_row\">&mdash;</td>\n<td class=\"gt_row gt_right gt_grand_summary_row\">65100.00</td></tr>\n    <tr><td colspan=\"2\" class=\"gt_row gt_right gt_stub gt_grand_summary_row gt_last_summary_row\">avg</td>\n<td class=\"gt_row gt_right gt_grand_summary_row gt_last_summary_row\">1380432.87</td>\n<td class=\"gt_row gt_left gt_grand_summary_row gt_last_summary_row\">&mdash;</td>\n<td class=\"gt_row gt_center gt_grand_summary_row gt_last_summary_row\">&mdash;</td>\n<td class=\"gt_row gt_left gt_grand_summary_row gt_last_summary_row\">&mdash;</td>\n<td class=\"gt_row gt_left gt_grand_summary_row gt_last_summary_row\">&mdash;</td>\n<td class=\"gt_row gt_left gt_grand_summary_row gt_last_summary_row\">&mdash;</td>\n<td class=\"gt_row gt_right gt_grand_summary_row gt_last_summary_row\">9501.26</td></tr>\n  </tbody>\n  <tfoot class=\"gt_sourcenotes\">\n    <tr>\n      <td class=\"gt_sourcenote\" colspan=\"9\">Source note #1</td>\n    </tr>\n    <tr>\n      <td class=\"gt_sourcenote\" colspan=\"9\">Source note #2</td>\n    </tr>\n  </tfoot>\n  \n</table>"

---

    Code
      .
    Output
      [1] "\\captionsetup[table]{labelformat=empty,skip=1pt}\n\\setlength{\\LTpost}{0mm}\n\\begin{longtable}{r|r|rlclllr}\n\\caption*{\n{\\large Data listing from \\textbf{exibble}} \\\\ \n{\\small \\texttt{exibble} is an R dataset}\n} \\\\ \n\\toprule\n\\multicolumn{2}{l}{} &  &  &  & \\multicolumn{3}{c}{timing} &  \\\\ \n\\cmidrule(lr){6-8}\n\\multicolumn{2}{l}{S.L.} & num & char & fctr & date & time & datetime & currency \\\\ \n\\midrule\ngrp\\_a & row\\_1 & 1.111e-01 & apricot & one & 2015-01-15 & 13:35 & 2018-01-01 02:22 & 49.950 \\\\ \n & row\\_2 & 2.222e+00 & banana & two & 2015-02-15 & 14:40 & 2018-02-02 14:33 & 17.950 \\\\ \n & row\\_3 & 3.333e+01 & coconut & three & 2015-03-15 & 15:45 & 2018-03-03 03:44 & 1.390 \\\\ \n & row\\_4 & 4.444e+02 & durian & four & 2015-04-15 & 16:50 & 2018-04-04 15:55 & 65100.000 \\\\ \n\\cmidrule(l{-0.05em}r){2-9}\\multicolumn{1}{r|}{} & \\multicolumn{1}{r|}{min} & $0.11$ & — & — & — & — & — & $1.39$ \\\\ \n\\multicolumn{1}{r|}{} & \\multicolumn{1}{r|}{max} & $444.40$ & — & — & — & — & — & $65100.00$ \\\\ \n\\multicolumn{1}{r|}{} & \\multicolumn{1}{r|}{avg} & $120.02$ & — & — & — & — & — & $16292.32$ \\\\ \n\\midrule\ngrp\\_b & row\\_5 & 5.550e+03 & NA & five & 2015-05-15 & 17:55 & 2018-05-05 04:00 & 1325.810 \\\\ \n & row\\_6 & NA & fig & six & 2015-06-15 & NA & 2018-06-06 16:11 & 13.255 \\\\ \n & row\\_7 & 7.770e+05 & grapefruit & seven & NA & 19:10 & 2018-07-07 05:22 & NA \\\\ \n & row\\_8 & 8.880e+06 & honeydew & eight & 2015-08-15 & 20:20 & NA & 0.440 \\\\ \n\\cmidrule(l{-0.05em}r){2-9}\\multicolumn{1}{r|}{} & \\multicolumn{1}{r|}{min} & $5550.00$ & — & — & — & — & — & $0.44$ \\\\ \n\\multicolumn{1}{r|}{} & \\multicolumn{1}{r|}{max} & $8880000.00$ & — & — & — & — & — & $1325.81$ \\\\ \n\\multicolumn{1}{r|}{} & \\multicolumn{1}{r|}{avg} & $3220850.00$ & — & — & — & — & — & $446.50$ \\\\ \n\\midrule \n\\midrule \n\\multicolumn{2}{r|}{min} & $0.11$ & — & — & — & — & — & $0.44$ \\\\ \n\\multicolumn{2}{r|}{max} & $8880000.00$ & — & — & — & — & — & $65100.00$ \\\\ \n\\multicolumn{2}{r|}{avg} & $1380432.87$ & — & — & — & — & — & $9501.26$ \\\\ \n\\bottomrule\n\\end{longtable}\n\\begin{minipage}{\\linewidth}\nSource note \\#1\\\\\nSource note \\#2\\\\\n\\end{minipage}\n"

---

    Code
      .
    Output
      {\rtf\ansi\ansicpg1252{\fonttbl{\f0\froman\fcharset0\fprq0 Courier New;}{\f1\froman\fcharset0\fprq0 Times;}}{\colortbl;\red51\green51\blue51;\red211\green211\blue211;}
      
      \paperw12240\paperh15840\widowctrl\ftnbj\fet0\sectd\linex0
      \lndscpsxn
      \margl1440\margr1440\margt1440\margb1440
      \headery720\footery720\fs20
      
      \trowd\trrh0\trhdr
      
      \pard\plain\uc0\qc\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx9360
      \intbl {\f0\cf1 {\f0\fs20 Data listing from {\b exibble}} {\f0\fs20\i\super } \line {\f0\fs20 {\f1 exibble} is an R dataset} {\f0\fs20\i\super }}\cell
      \pard\plain
      
      \row
      
      \trowd\trrh0\trhdr
      
      \pard\plain\uc0\qc\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx1040
      \intbl {\f0 {\f0\fs20 }}\cell
      \pard\plain
      
      \pard\plain\uc0\qc\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx2080
      \intbl {\f0 {\f0\fs20 }}\cell
      \pard\plain
      
      \pard\plain\uc0\qc\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx3120
      \intbl {\f0 {\f0\fs20 }}\cell
      \pard\plain
      
      \pard\plain\uc0\qc\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx4160
      \intbl {\f0 {\f0\fs20 }}\cell
      \pard\plain
      
      \pard\plain\uc0\qc\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx5200
      \intbl {\f0 {\f0\fs20 }}\cell
      \pard\plain
      
      \pard\plain\uc0\qc\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clmgf\cellx6240
      \intbl {\f0 {\f0\fs20 timing}}\cell
      \pard\plain
      
      \pard\plain\uc0\qc\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clmrg\cellx7280
      \intbl {\f0 {\f0\fs20 timing}}\cell
      \pard\plain
      
      \pard\plain\uc0\qc\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clmrg\cellx8320
      \intbl {\f0 {\f0\fs20 timing}}\cell
      \pard\plain
      
      \pard\plain\uc0\qc\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx9360
      \intbl {\f0 {\f0\fs20 }}\cell
      \pard\plain
      
      \row
      
      \trowd\trrh0\trhdr
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clbrdrb\brdrs\brdrw40\brdrcf2\clmgf\cellx1040
      \intbl {\f0 {\f0\fs20 S.L.}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clbrdrb\brdrs\brdrw40\brdrcf2\clmrg\cellx2080
      \intbl {\f0 {\f0\fs20 }}\cell
      \pard\plain
      
      \pard\plain\uc0\qr\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clbrdrb\brdrs\brdrw40\brdrcf2\cellx3120
      \intbl {\f0 {\f0\fs20 num}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clbrdrb\brdrs\brdrw40\brdrcf2\cellx4160
      \intbl {\f0 {\f0\fs20 char}}\cell
      \pard\plain
      
      \pard\plain\uc0\qc\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clbrdrb\brdrs\brdrw40\brdrcf2\cellx5200
      \intbl {\f0 {\f0\fs20 fctr}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clbrdrb\brdrs\brdrw40\brdrcf2\cellx6240
      \intbl {\f0 {\f0\fs20 date}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clbrdrb\brdrs\brdrw40\brdrcf2\cellx7280
      \intbl {\f0 {\f0\fs20 time}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clbrdrb\brdrs\brdrw40\brdrcf2\cellx8320
      \intbl {\f0 {\f0\fs20 datetime}}\cell
      \pard\plain
      
      \pard\plain\uc0\qr\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clbrdrb\brdrs\brdrw40\brdrcf2\cellx9360
      \intbl {\f0 {\f0\fs20 currency}}\cell
      \pard\plain
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\qr\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx1040
      \intbl {\f0 {\f0\fs20 grp_a}}\cell
      \pard\plain
      
      \pard\plain\uc0\qr\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx2080
      \intbl {\f0 {\f0\fs20 row_1}}\cell
      \pard\plain
      
      \pard\plain\uc0\qr\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx3120
      \intbl {\f0 {\f0\fs20 1.111e-01}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx4160
      \intbl {\f0 {\f0\fs20 apricot}}\cell
      \pard\plain
      
      \pard\plain\uc0\qc\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx5200
      \intbl {\f0 {\f0\fs20 one}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx6240
      \intbl {\f0 {\f0\fs20 2015-01-15}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx7280
      \intbl {\f0 {\f0\fs20 13:35}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx8320
      \intbl {\f0 {\f0\fs20 2018-01-01 02:22}}\cell
      \pard\plain
      
      \pard\plain\uc0\qr\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx9360
      \intbl {\f0 {\f0\fs20 49.950}}\cell
      \pard\plain
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\qr\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx1040
      \intbl {\f0 {\f0\fs20 }}\cell
      \pard\plain
      
      \pard\plain\uc0\qr\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx2080
      \intbl {\f0 {\f0\fs20 row_2}}\cell
      \pard\plain
      
      \pard\plain\uc0\qr\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx3120
      \intbl {\f0 {\f0\fs20 2.222e+00}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx4160
      \intbl {\f0 {\f0\fs20 banana}}\cell
      \pard\plain
      
      \pard\plain\uc0\qc\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx5200
      \intbl {\f0 {\f0\fs20 two}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx6240
      \intbl {\f0 {\f0\fs20 2015-02-15}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx7280
      \intbl {\f0 {\f0\fs20 14:40}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx8320
      \intbl {\f0 {\f0\fs20 2018-02-02 14:33}}\cell
      \pard\plain
      
      \pard\plain\uc0\qr\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx9360
      \intbl {\f0 {\f0\fs20 17.950}}\cell
      \pard\plain
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\qr\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx1040
      \intbl {\f0 {\f0\fs20 }}\cell
      \pard\plain
      
      \pard\plain\uc0\qr\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx2080
      \intbl {\f0 {\f0\fs20 row_3}}\cell
      \pard\plain
      
      \pard\plain\uc0\qr\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx3120
      \intbl {\f0 {\f0\fs20 3.333e+01}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx4160
      \intbl {\f0 {\f0\fs20 coconut}}\cell
      \pard\plain
      
      \pard\plain\uc0\qc\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx5200
      \intbl {\f0 {\f0\fs20 three}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx6240
      \intbl {\f0 {\f0\fs20 2015-03-15}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx7280
      \intbl {\f0 {\f0\fs20 15:45}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx8320
      \intbl {\f0 {\f0\fs20 2018-03-03 03:44}}\cell
      \pard\plain
      
      \pard\plain\uc0\qr\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx9360
      \intbl {\f0 {\f0\fs20 1.390}}\cell
      \pard\plain
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\qr\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx1040
      \intbl {\f0 {\f0\fs20 }}\cell
      \pard\plain
      
      \pard\plain\uc0\qr\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx2080
      \intbl {\f0 {\f0\fs20 row_4}}\cell
      \pard\plain
      
      \pard\plain\uc0\qr\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx3120
      \intbl {\f0 {\f0\fs20 4.444e+02}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx4160
      \intbl {\f0 {\f0\fs20 durian}}\cell
      \pard\plain
      
      \pard\plain\uc0\qc\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx5200
      \intbl {\f0 {\f0\fs20 four}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx6240
      \intbl {\f0 {\f0\fs20 2015-04-15}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx7280
      \intbl {\f0 {\f0\fs20 16:50}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx8320
      \intbl {\f0 {\f0\fs20 2018-04-04 15:55}}\cell
      \pard\plain
      
      \pard\plain\uc0\qr\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx9360
      \intbl {\f0 {\f0\fs20 65100.000}}\cell
      \pard\plain
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\qr\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx1040
      \intbl {\f0 {\f0\fs20 }}\cell
      \pard\plain
      
      \pard\plain\uc0\qr\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx2080
      \intbl {\f0 {\f0\fs20 min}}\cell
      \pard\plain
      
      \pard\plain\uc0\qr\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx3120
      \intbl {\f0 {\f0\fs20 0.11}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx4160
      \intbl {\f0 {\f0\fs20 \'97}}\cell
      \pard\plain
      
      \pard\plain\uc0\qc\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx5200
      \intbl {\f0 {\f0\fs20 \'97}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx6240
      \intbl {\f0 {\f0\fs20 \'97}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx7280
      \intbl {\f0 {\f0\fs20 \'97}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx8320
      \intbl {\f0 {\f0\fs20 \'97}}\cell
      \pard\plain
      
      \pard\plain\uc0\qr\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx9360
      \intbl {\f0 {\f0\fs20 1.39}}\cell
      \pard\plain
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\qr\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx1040
      \intbl {\f0 {\f0\fs20 }}\cell
      \pard\plain
      
      \pard\plain\uc0\qr\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx2080
      \intbl {\f0 {\f0\fs20 max}}\cell
      \pard\plain
      
      \pard\plain\uc0\qr\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx3120
      \intbl {\f0 {\f0\fs20 444.40}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx4160
      \intbl {\f0 {\f0\fs20 \'97}}\cell
      \pard\plain
      
      \pard\plain\uc0\qc\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx5200
      \intbl {\f0 {\f0\fs20 \'97}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx6240
      \intbl {\f0 {\f0\fs20 \'97}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx7280
      \intbl {\f0 {\f0\fs20 \'97}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx8320
      \intbl {\f0 {\f0\fs20 \'97}}\cell
      \pard\plain
      
      \pard\plain\uc0\qr\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx9360
      \intbl {\f0 {\f0\fs20 65100.00}}\cell
      \pard\plain
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\qr\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx1040
      \intbl {\f0 {\f0\fs20 }}\cell
      \pard\plain
      
      \pard\plain\uc0\qr\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx2080
      \intbl {\f0 {\f0\fs20 avg}}\cell
      \pard\plain
      
      \pard\plain\uc0\qr\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx3120
      \intbl {\f0 {\f0\fs20 120.02}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx4160
      \intbl {\f0 {\f0\fs20 \'97}}\cell
      \pard\plain
      
      \pard\plain\uc0\qc\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx5200
      \intbl {\f0 {\f0\fs20 \'97}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx6240
      \intbl {\f0 {\f0\fs20 \'97}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx7280
      \intbl {\f0 {\f0\fs20 \'97}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx8320
      \intbl {\f0 {\f0\fs20 \'97}}\cell
      \pard\plain
      
      \pard\plain\uc0\qr\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx9360
      \intbl {\f0 {\f0\fs20 16292.32}}\cell
      \pard\plain
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\qr\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx1040
      \intbl {\f0 {\f0\fs20 grp_b}}\cell
      \pard\plain
      
      \pard\plain\uc0\qr\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx2080
      \intbl {\f0 {\f0\fs20 row_5}}\cell
      \pard\plain
      
      \pard\plain\uc0\qr\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx3120
      \intbl {\f0 {\f0\fs20 5.550e+03}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx4160
      \intbl {\f0 {\f0\fs20 NA}}\cell
      \pard\plain
      
      \pard\plain\uc0\qc\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx5200
      \intbl {\f0 {\f0\fs20 five}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx6240
      \intbl {\f0 {\f0\fs20 2015-05-15}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx7280
      \intbl {\f0 {\f0\fs20 17:55}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx8320
      \intbl {\f0 {\f0\fs20 2018-05-05 04:00}}\cell
      \pard\plain
      
      \pard\plain\uc0\qr\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx9360
      \intbl {\f0 {\f0\fs20 1325.810}}\cell
      \pard\plain
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\qr\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx1040
      \intbl {\f0 {\f0\fs20 }}\cell
      \pard\plain
      
      \pard\plain\uc0\qr\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx2080
      \intbl {\f0 {\f0\fs20 row_6}}\cell
      \pard\plain
      
      \pard\plain\uc0\qr\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx3120
      \intbl {\f0 {\f0\fs20 NA}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx4160
      \intbl {\f0 {\f0\fs20 fig}}\cell
      \pard\plain
      
      \pard\plain\uc0\qc\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx5200
      \intbl {\f0 {\f0\fs20 six}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx6240
      \intbl {\f0 {\f0\fs20 2015-06-15}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx7280
      \intbl {\f0 {\f0\fs20 NA}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx8320
      \intbl {\f0 {\f0\fs20 2018-06-06 16:11}}\cell
      \pard\plain
      
      \pard\plain\uc0\qr\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx9360
      \intbl {\f0 {\f0\fs20 13.255}}\cell
      \pard\plain
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\qr\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx1040
      \intbl {\f0 {\f0\fs20 }}\cell
      \pard\plain
      
      \pard\plain\uc0\qr\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx2080
      \intbl {\f0 {\f0\fs20 row_7}}\cell
      \pard\plain
      
      \pard\plain\uc0\qr\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx3120
      \intbl {\f0 {\f0\fs20 7.770e+05}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx4160
      \intbl {\f0 {\f0\fs20 grapefruit}}\cell
      \pard\plain
      
      \pard\plain\uc0\qc\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx5200
      \intbl {\f0 {\f0\fs20 seven}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx6240
      \intbl {\f0 {\f0\fs20 NA}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx7280
      \intbl {\f0 {\f0\fs20 19:10}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx8320
      \intbl {\f0 {\f0\fs20 2018-07-07 05:22}}\cell
      \pard\plain
      
      \pard\plain\uc0\qr\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx9360
      \intbl {\f0 {\f0\fs20 NA}}\cell
      \pard\plain
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\qr\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx1040
      \intbl {\f0 {\f0\fs20 }}\cell
      \pard\plain
      
      \pard\plain\uc0\qr\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx2080
      \intbl {\f0 {\f0\fs20 row_8}}\cell
      \pard\plain
      
      \pard\plain\uc0\qr\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx3120
      \intbl {\f0 {\f0\fs20 8.880e+06}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx4160
      \intbl {\f0 {\f0\fs20 honeydew}}\cell
      \pard\plain
      
      \pard\plain\uc0\qc\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx5200
      \intbl {\f0 {\f0\fs20 eight}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx6240
      \intbl {\f0 {\f0\fs20 2015-08-15}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx7280
      \intbl {\f0 {\f0\fs20 20:20}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx8320
      \intbl {\f0 {\f0\fs20 NA}}\cell
      \pard\plain
      
      \pard\plain\uc0\qr\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx9360
      \intbl {\f0 {\f0\fs20 0.440}}\cell
      \pard\plain
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\qr\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx1040
      \intbl {\f0 {\f0\fs20 }}\cell
      \pard\plain
      
      \pard\plain\uc0\qr\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx2080
      \intbl {\f0 {\f0\fs20 min}}\cell
      \pard\plain
      
      \pard\plain\uc0\qr\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx3120
      \intbl {\f0 {\f0\fs20 5550.00}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx4160
      \intbl {\f0 {\f0\fs20 \'97}}\cell
      \pard\plain
      
      \pard\plain\uc0\qc\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx5200
      \intbl {\f0 {\f0\fs20 \'97}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx6240
      \intbl {\f0 {\f0\fs20 \'97}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx7280
      \intbl {\f0 {\f0\fs20 \'97}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx8320
      \intbl {\f0 {\f0\fs20 \'97}}\cell
      \pard\plain
      
      \pard\plain\uc0\qr\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx9360
      \intbl {\f0 {\f0\fs20 0.44}}\cell
      \pard\plain
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\qr\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx1040
      \intbl {\f0 {\f0\fs20 }}\cell
      \pard\plain
      
      \pard\plain\uc0\qr\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx2080
      \intbl {\f0 {\f0\fs20 max}}\cell
      \pard\plain
      
      \pard\plain\uc0\qr\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx3120
      \intbl {\f0 {\f0\fs20 8880000.00}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx4160
      \intbl {\f0 {\f0\fs20 \'97}}\cell
      \pard\plain
      
      \pard\plain\uc0\qc\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx5200
      \intbl {\f0 {\f0\fs20 \'97}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx6240
      \intbl {\f0 {\f0\fs20 \'97}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx7280
      \intbl {\f0 {\f0\fs20 \'97}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx8320
      \intbl {\f0 {\f0\fs20 \'97}}\cell
      \pard\plain
      
      \pard\plain\uc0\qr\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx9360
      \intbl {\f0 {\f0\fs20 1325.81}}\cell
      \pard\plain
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\qr\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx1040
      \intbl {\f0 {\f0\fs20 }}\cell
      \pard\plain
      
      \pard\plain\uc0\qr\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx2080
      \intbl {\f0 {\f0\fs20 avg}}\cell
      \pard\plain
      
      \pard\plain\uc0\qr\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx3120
      \intbl {\f0 {\f0\fs20 3220850.00}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx4160
      \intbl {\f0 {\f0\fs20 \'97}}\cell
      \pard\plain
      
      \pard\plain\uc0\qc\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx5200
      \intbl {\f0 {\f0\fs20 \'97}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx6240
      \intbl {\f0 {\f0\fs20 \'97}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx7280
      \intbl {\f0 {\f0\fs20 \'97}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx8320
      \intbl {\f0 {\f0\fs20 \'97}}\cell
      \pard\plain
      
      \pard\plain\uc0\qr\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx9360
      \intbl {\f0 {\f0\fs20 446.50}}\cell
      \pard\plain
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\qr\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clmgf\cellx1040
      \intbl {\f0 {\f0\fs20 min}}\cell
      \pard\plain
      
      \pard\plain\uc0\qr\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clmrg\cellx2080
      \intbl {\f0 {\f0\fs20 }}\cell
      \pard\plain
      
      \pard\plain\uc0\qr\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx3120
      \intbl {\f0 {\f0\fs20 0.11}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx4160
      \intbl {\f0 {\f0\fs20 \'97}}\cell
      \pard\plain
      
      \pard\plain\uc0\qc\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx5200
      \intbl {\f0 {\f0\fs20 \'97}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx6240
      \intbl {\f0 {\f0\fs20 \'97}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx7280
      \intbl {\f0 {\f0\fs20 \'97}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx8320
      \intbl {\f0 {\f0\fs20 \'97}}\cell
      \pard\plain
      
      \pard\plain\uc0\qr\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx9360
      \intbl {\f0 {\f0\fs20 0.44}}\cell
      \pard\plain
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\qr\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clmgf\cellx1040
      \intbl {\f0 {\f0\fs20 max}}\cell
      \pard\plain
      
      \pard\plain\uc0\qr\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clmrg\cellx2080
      \intbl {\f0 {\f0\fs20 }}\cell
      \pard\plain
      
      \pard\plain\uc0\qr\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx3120
      \intbl {\f0 {\f0\fs20 8880000.00}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx4160
      \intbl {\f0 {\f0\fs20 \'97}}\cell
      \pard\plain
      
      \pard\plain\uc0\qc\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx5200
      \intbl {\f0 {\f0\fs20 \'97}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx6240
      \intbl {\f0 {\f0\fs20 \'97}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx7280
      \intbl {\f0 {\f0\fs20 \'97}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx8320
      \intbl {\f0 {\f0\fs20 \'97}}\cell
      \pard\plain
      
      \pard\plain\uc0\qr\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx9360
      \intbl {\f0 {\f0\fs20 65100.00}}\cell
      \pard\plain
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\qr\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clmgf\cellx1040
      \intbl {\f0 {\f0\fs20 avg}}\cell
      \pard\plain
      
      \pard\plain\uc0\qr\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clmrg\cellx2080
      \intbl {\f0 {\f0\fs20 }}\cell
      \pard\plain
      
      \pard\plain\uc0\qr\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx3120
      \intbl {\f0 {\f0\fs20 1380432.87}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx4160
      \intbl {\f0 {\f0\fs20 \'97}}\cell
      \pard\plain
      
      \pard\plain\uc0\qc\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx5200
      \intbl {\f0 {\f0\fs20 \'97}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx6240
      \intbl {\f0 {\f0\fs20 \'97}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx7280
      \intbl {\f0 {\f0\fs20 \'97}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx8320
      \intbl {\f0 {\f0\fs20 \'97}}\cell
      \pard\plain
      
      \pard\plain\uc0\qr\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx9360
      \intbl {\f0 {\f0\fs20 9501.26}}\cell
      \pard\plain
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\cellx9360
      \intbl {\f0 {\f0\fs20 Source note #1\line Source note #2}}\cell
      \pard\plain
      
      \row
      
      }

---

    Code
      .
    Output
      [1] "<table class=\"gt_table\">\n  <thead class=\"gt_header\">\n    <tr>\n      <th colspan=\"9\" class=\"gt_heading gt_title gt_font_normal\" style=\"background-color: #ADD8E6;\">Data listing from <strong>exibble</strong></th>\n    </tr>\n    <tr>\n      <th colspan=\"9\" class=\"gt_heading gt_subtitle gt_font_normal gt_bottom_border\" style=\"background-color: #00FFFF;\"><code>exibble</code> is an R dataset</th>\n    </tr>\n  </thead>\n  <thead class=\"gt_col_headings\">\n    <tr>\n      <th class=\"gt_col_heading gt_columns_bottom_border gt_right\" rowspan=\"2\" colspan=\"1\" style=\"background-color: #7FFFD4;\">num</th>\n      <th class=\"gt_col_heading gt_columns_bottom_border gt_left\" rowspan=\"2\" colspan=\"1\" style=\"background-color: #7FFFD4;\">char</th>\n      <th class=\"gt_col_heading gt_columns_bottom_border gt_center\" rowspan=\"2\" colspan=\"1\" style=\"background-color: #7FFFD4;\">fctr</th>\n      <th class=\"gt_center gt_columns_top_border gt_column_spanner_outer\" rowspan=\"1\" colspan=\"3\" style=\"background-color: #FFFF00;\">\n        <span class=\"gt_column_spanner\">timing</span>\n      </th>\n      <th class=\"gt_col_heading gt_columns_bottom_border gt_right\" rowspan=\"2\" colspan=\"1\" style=\"background-color: #7FFFD4;\">currency</th>\n      <th class=\"gt_col_heading gt_columns_bottom_border gt_left\" rowspan=\"2\" colspan=\"1\" style=\"background-color: #7FFFD4;\">row</th>\n      <th class=\"gt_col_heading gt_columns_bottom_border gt_left\" rowspan=\"2\" colspan=\"1\" style=\"background-color: #7FFFD4;\">group</th>\n    </tr>\n    <tr>\n      <th class=\"gt_col_heading gt_columns_bottom_border gt_left\" rowspan=\"1\" colspan=\"1\" style=\"background-color: #7FFFD4;\">date</th>\n      <th class=\"gt_col_heading gt_columns_bottom_border gt_left\" rowspan=\"1\" colspan=\"1\" style=\"background-color: #7FFFD4;\">time</th>\n      <th class=\"gt_col_heading gt_columns_bottom_border gt_left\" rowspan=\"1\" colspan=\"1\" style=\"background-color: #7FFFD4;\">datetime</th>\n    </tr>\n  </thead>\n  <tbody class=\"gt_table_body\">\n    <tr><td class=\"gt_row gt_right\" style=\"background-color: #D9D9D9;\">1.111e-01</td>\n<td class=\"gt_row gt_left\" style=\"background-color: #CCCCCC;\">apricot</td>\n<td class=\"gt_row gt_center\" style=\"background-color: #BFBFBF;\">one</td>\n<td class=\"gt_row gt_left\" style=\"background-color: #B3B3B3;\">2015-01-15</td>\n<td class=\"gt_row gt_left\" style=\"background-color: #A6A6A6;\">13:35</td>\n<td class=\"gt_row gt_left\" style=\"background-color: #999999;\">2018-01-01 02:22</td>\n<td class=\"gt_row gt_right\" style=\"background-color: #8C8C8C;\">49.950</td>\n<td class=\"gt_row gt_left\" style=\"background-color: #7F7F7F;\">row_1</td>\n<td class=\"gt_row gt_left\" style=\"background-color: #737373;\">grp_a</td></tr>\n    <tr><td class=\"gt_row gt_right\" style=\"background-color: #D9D9D9;\">2.222e+00</td>\n<td class=\"gt_row gt_left\" style=\"background-color: #CCCCCC;\">banana</td>\n<td class=\"gt_row gt_center\" style=\"background-color: #BFBFBF;\">two</td>\n<td class=\"gt_row gt_left\" style=\"background-color: #B3B3B3;\">2015-02-15</td>\n<td class=\"gt_row gt_left\" style=\"background-color: #A6A6A6;\">14:40</td>\n<td class=\"gt_row gt_left\" style=\"background-color: #999999;\">2018-02-02 14:33</td>\n<td class=\"gt_row gt_right\" style=\"background-color: #8C8C8C;\">17.950</td>\n<td class=\"gt_row gt_left\" style=\"background-color: #7F7F7F;\">row_2</td>\n<td class=\"gt_row gt_left\" style=\"background-color: #737373;\">grp_a</td></tr>\n    <tr><td class=\"gt_row gt_right\" style=\"background-color: #D9D9D9;\">3.333e+01</td>\n<td class=\"gt_row gt_left\" style=\"background-color: #CCCCCC;\">coconut</td>\n<td class=\"gt_row gt_center\" style=\"background-color: #BFBFBF;\">three</td>\n<td class=\"gt_row gt_left\" style=\"background-color: #B3B3B3;\">2015-03-15</td>\n<td class=\"gt_row gt_left\" style=\"background-color: #A6A6A6;\">15:45</td>\n<td class=\"gt_row gt_left\" style=\"background-color: #999999;\">2018-03-03 03:44</td>\n<td class=\"gt_row gt_right\" style=\"background-color: #8C8C8C;\">1.390</td>\n<td class=\"gt_row gt_left\" style=\"background-color: #7F7F7F;\">row_3</td>\n<td class=\"gt_row gt_left\" style=\"background-color: #737373;\">grp_a</td></tr>\n    <tr><td class=\"gt_row gt_right\" style=\"background-color: #D9D9D9;\">4.444e+02</td>\n<td class=\"gt_row gt_left\" style=\"background-color: #CCCCCC;\">durian</td>\n<td class=\"gt_row gt_center\" style=\"background-color: #BFBFBF;\">four</td>\n<td class=\"gt_row gt_left\" style=\"background-color: #B3B3B3;\">2015-04-15</td>\n<td class=\"gt_row gt_left\" style=\"background-color: #A6A6A6;\">16:50</td>\n<td class=\"gt_row gt_left\" style=\"background-color: #999999;\">2018-04-04 15:55</td>\n<td class=\"gt_row gt_right\" style=\"background-color: #8C8C8C;\">65100.000</td>\n<td class=\"gt_row gt_left\" style=\"background-color: #7F7F7F;\">row_4</td>\n<td class=\"gt_row gt_left\" style=\"background-color: #737373;\">grp_a</td></tr>\n    <tr><td class=\"gt_row gt_right\" style=\"background-color: #D9D9D9;\">5.550e+03</td>\n<td class=\"gt_row gt_left\" style=\"background-color: #CCCCCC;\">NA</td>\n<td class=\"gt_row gt_center\" style=\"background-color: #BFBFBF;\">five</td>\n<td class=\"gt_row gt_left\" style=\"background-color: #B3B3B3;\">2015-05-15</td>\n<td class=\"gt_row gt_left\" style=\"background-color: #A6A6A6;\">17:55</td>\n<td class=\"gt_row gt_left\" style=\"background-color: #999999;\">2018-05-05 04:00</td>\n<td class=\"gt_row gt_right\" style=\"background-color: #8C8C8C;\">1325.810</td>\n<td class=\"gt_row gt_left\" style=\"background-color: #7F7F7F;\">row_5</td>\n<td class=\"gt_row gt_left\" style=\"background-color: #737373;\">grp_b</td></tr>\n    <tr><td class=\"gt_row gt_right\" style=\"background-color: #D9D9D9;\">NA</td>\n<td class=\"gt_row gt_left\" style=\"background-color: #CCCCCC;\">fig</td>\n<td class=\"gt_row gt_center\" style=\"background-color: #BFBFBF;\">six</td>\n<td class=\"gt_row gt_left\" style=\"background-color: #B3B3B3;\">2015-06-15</td>\n<td class=\"gt_row gt_left\" style=\"background-color: #A6A6A6;\">NA</td>\n<td class=\"gt_row gt_left\" style=\"background-color: #999999;\">2018-06-06 16:11</td>\n<td class=\"gt_row gt_right\" style=\"background-color: #8C8C8C;\">13.255</td>\n<td class=\"gt_row gt_left\" style=\"background-color: #7F7F7F;\">row_6</td>\n<td class=\"gt_row gt_left\" style=\"background-color: #737373;\">grp_b</td></tr>\n    <tr><td class=\"gt_row gt_right\" style=\"background-color: #D9D9D9;\">7.770e+05</td>\n<td class=\"gt_row gt_left\" style=\"background-color: #CCCCCC;\">grapefruit</td>\n<td class=\"gt_row gt_center\" style=\"background-color: #BFBFBF;\">seven</td>\n<td class=\"gt_row gt_left\" style=\"background-color: #B3B3B3;\">NA</td>\n<td class=\"gt_row gt_left\" style=\"background-color: #A6A6A6;\">19:10</td>\n<td class=\"gt_row gt_left\" style=\"background-color: #999999;\">2018-07-07 05:22</td>\n<td class=\"gt_row gt_right\" style=\"background-color: #8C8C8C;\">NA</td>\n<td class=\"gt_row gt_left\" style=\"background-color: #7F7F7F;\">row_7</td>\n<td class=\"gt_row gt_left\" style=\"background-color: #737373;\">grp_b</td></tr>\n    <tr><td class=\"gt_row gt_right\" style=\"background-color: #D9D9D9;\">8.880e+06</td>\n<td class=\"gt_row gt_left\" style=\"background-color: #CCCCCC;\">honeydew</td>\n<td class=\"gt_row gt_center\" style=\"background-color: #BFBFBF;\">eight</td>\n<td class=\"gt_row gt_left\" style=\"background-color: #B3B3B3;\">2015-08-15</td>\n<td class=\"gt_row gt_left\" style=\"background-color: #A6A6A6;\">20:20</td>\n<td class=\"gt_row gt_left\" style=\"background-color: #999999;\">NA</td>\n<td class=\"gt_row gt_right\" style=\"background-color: #8C8C8C;\">0.440</td>\n<td class=\"gt_row gt_left\" style=\"background-color: #7F7F7F;\">row_8</td>\n<td class=\"gt_row gt_left\" style=\"background-color: #737373;\">grp_b</td></tr>\n  </tbody>\n  <tfoot class=\"gt_sourcenotes\">\n    <tr>\n      <td class=\"gt_sourcenote\" style=\"background-color: #F5DEB3;\" colspan=\"9\">Source note #1</td>\n    </tr>\n    <tr>\n      <td class=\"gt_sourcenote\" style=\"background-color: #F5DEB3;\" colspan=\"9\">Source note #2</td>\n    </tr>\n  </tfoot>\n  \n</table>"

---

    Code
      .
    Output
      [1] "<table class=\"gt_table\">\n  <thead class=\"gt_header\">\n    <tr>\n      <th colspan=\"9\" class=\"gt_heading gt_title gt_font_normal\" style=\"background-color: #ADD8E6;\">Data listing from <strong>exibble</strong></th>\n    </tr>\n    <tr>\n      <th colspan=\"9\" class=\"gt_heading gt_subtitle gt_font_normal gt_bottom_border\" style=\"background-color: #00FFFF;\"><code>exibble</code> is an R dataset</th>\n    </tr>\n  </thead>\n  <thead class=\"gt_col_headings\">\n    <tr>\n      <th class=\"gt_col_heading gt_columns_bottom_border gt_right\" rowspan=\"2\" colspan=\"1\" style=\"background-color: #7FFFD4;\">num</th>\n      <th class=\"gt_col_heading gt_columns_bottom_border gt_left\" rowspan=\"2\" colspan=\"1\" style=\"background-color: #7FFFD4;\">char</th>\n      <th class=\"gt_col_heading gt_columns_bottom_border gt_center\" rowspan=\"2\" colspan=\"1\" style=\"background-color: #7FFFD4;\">fctr</th>\n      <th class=\"gt_center gt_columns_top_border gt_column_spanner_outer\" rowspan=\"1\" colspan=\"3\" style=\"background-color: #FFFF00;\">\n        <span class=\"gt_column_spanner\">timing</span>\n      </th>\n      <th class=\"gt_col_heading gt_columns_bottom_border gt_right\" rowspan=\"2\" colspan=\"1\" style=\"background-color: #7FFFD4;\">currency</th>\n      <th class=\"gt_col_heading gt_columns_bottom_border gt_left\" rowspan=\"2\" colspan=\"1\" style=\"background-color: #7FFFD4;\">row</th>\n      <th class=\"gt_col_heading gt_columns_bottom_border gt_left\" rowspan=\"2\" colspan=\"1\" style=\"background-color: #7FFFD4;\">group</th>\n    </tr>\n    <tr>\n      <th class=\"gt_col_heading gt_columns_bottom_border gt_left\" rowspan=\"1\" colspan=\"1\" style=\"background-color: #7FFFD4;\">date</th>\n      <th class=\"gt_col_heading gt_columns_bottom_border gt_left\" rowspan=\"1\" colspan=\"1\" style=\"background-color: #7FFFD4;\">time</th>\n      <th class=\"gt_col_heading gt_columns_bottom_border gt_left\" rowspan=\"1\" colspan=\"1\" style=\"background-color: #7FFFD4;\">datetime</th>\n    </tr>\n  </thead>\n  <tbody class=\"gt_table_body\">\n    <tr><td class=\"gt_row gt_right\" style=\"background-color: #D9D9D9;\">1.111e-01</td>\n<td class=\"gt_row gt_left\" style=\"background-color: #CCCCCC;\">apricot</td>\n<td class=\"gt_row gt_center\" style=\"background-color: #BFBFBF;\">one</td>\n<td class=\"gt_row gt_left\" style=\"background-color: #B3B3B3;\">2015-01-15</td>\n<td class=\"gt_row gt_left\" style=\"background-color: #A6A6A6;\">13:35</td>\n<td class=\"gt_row gt_left\" style=\"background-color: #999999;\">2018-01-01 02:22</td>\n<td class=\"gt_row gt_right\" style=\"background-color: #8C8C8C;\">49.950</td>\n<td class=\"gt_row gt_left\" style=\"background-color: #7F7F7F;\">row_1</td>\n<td class=\"gt_row gt_left\" style=\"background-color: #737373;\">grp_a</td></tr>\n    <tr><td class=\"gt_row gt_right\" style=\"background-color: #D9D9D9;\">2.222e+00</td>\n<td class=\"gt_row gt_left\" style=\"background-color: #CCCCCC;\">banana</td>\n<td class=\"gt_row gt_center\" style=\"background-color: #BFBFBF;\">two</td>\n<td class=\"gt_row gt_left\" style=\"background-color: #B3B3B3;\">2015-02-15</td>\n<td class=\"gt_row gt_left\" style=\"background-color: #A6A6A6;\">14:40</td>\n<td class=\"gt_row gt_left\" style=\"background-color: #999999;\">2018-02-02 14:33</td>\n<td class=\"gt_row gt_right\" style=\"background-color: #8C8C8C;\">17.950</td>\n<td class=\"gt_row gt_left\" style=\"background-color: #7F7F7F;\">row_2</td>\n<td class=\"gt_row gt_left\" style=\"background-color: #737373;\">grp_a</td></tr>\n    <tr><td class=\"gt_row gt_right\" style=\"background-color: #D9D9D9;\">3.333e+01</td>\n<td class=\"gt_row gt_left\" style=\"background-color: #CCCCCC;\">coconut</td>\n<td class=\"gt_row gt_center\" style=\"background-color: #BFBFBF;\">three</td>\n<td class=\"gt_row gt_left\" style=\"background-color: #B3B3B3;\">2015-03-15</td>\n<td class=\"gt_row gt_left\" style=\"background-color: #A6A6A6;\">15:45</td>\n<td class=\"gt_row gt_left\" style=\"background-color: #999999;\">2018-03-03 03:44</td>\n<td class=\"gt_row gt_right\" style=\"background-color: #8C8C8C;\">1.390</td>\n<td class=\"gt_row gt_left\" style=\"background-color: #7F7F7F;\">row_3</td>\n<td class=\"gt_row gt_left\" style=\"background-color: #737373;\">grp_a</td></tr>\n    <tr><td class=\"gt_row gt_right\" style=\"background-color: #D9D9D9;\">4.444e+02</td>\n<td class=\"gt_row gt_left\" style=\"background-color: #CCCCCC;\">durian</td>\n<td class=\"gt_row gt_center\" style=\"background-color: #BFBFBF;\">four</td>\n<td class=\"gt_row gt_left\" style=\"background-color: #B3B3B3;\">2015-04-15</td>\n<td class=\"gt_row gt_left\" style=\"background-color: #A6A6A6;\">16:50</td>\n<td class=\"gt_row gt_left\" style=\"background-color: #999999;\">2018-04-04 15:55</td>\n<td class=\"gt_row gt_right\" style=\"background-color: #8C8C8C;\">65100.000</td>\n<td class=\"gt_row gt_left\" style=\"background-color: #7F7F7F;\">row_4</td>\n<td class=\"gt_row gt_left\" style=\"background-color: #737373;\">grp_a</td></tr>\n    <tr><td class=\"gt_row gt_right\" style=\"background-color: #D9D9D9;\">5.550e+03</td>\n<td class=\"gt_row gt_left\" style=\"background-color: #CCCCCC;\">NA</td>\n<td class=\"gt_row gt_center\" style=\"background-color: #BFBFBF;\">five</td>\n<td class=\"gt_row gt_left\" style=\"background-color: #B3B3B3;\">2015-05-15</td>\n<td class=\"gt_row gt_left\" style=\"background-color: #A6A6A6;\">17:55</td>\n<td class=\"gt_row gt_left\" style=\"background-color: #999999;\">2018-05-05 04:00</td>\n<td class=\"gt_row gt_right\" style=\"background-color: #8C8C8C;\">1325.810</td>\n<td class=\"gt_row gt_left\" style=\"background-color: #7F7F7F;\">row_5</td>\n<td class=\"gt_row gt_left\" style=\"background-color: #737373;\">grp_b</td></tr>\n    <tr><td class=\"gt_row gt_right\" style=\"background-color: #D9D9D9;\">NA</td>\n<td class=\"gt_row gt_left\" style=\"background-color: #CCCCCC;\">fig</td>\n<td class=\"gt_row gt_center\" style=\"background-color: #BFBFBF;\">six</td>\n<td class=\"gt_row gt_left\" style=\"background-color: #B3B3B3;\">2015-06-15</td>\n<td class=\"gt_row gt_left\" style=\"background-color: #A6A6A6;\">NA</td>\n<td class=\"gt_row gt_left\" style=\"background-color: #999999;\">2018-06-06 16:11</td>\n<td class=\"gt_row gt_right\" style=\"background-color: #8C8C8C;\">13.255</td>\n<td class=\"gt_row gt_left\" style=\"background-color: #7F7F7F;\">row_6</td>\n<td class=\"gt_row gt_left\" style=\"background-color: #737373;\">grp_b</td></tr>\n    <tr><td class=\"gt_row gt_right\" style=\"background-color: #D9D9D9;\">7.770e+05</td>\n<td class=\"gt_row gt_left\" style=\"background-color: #CCCCCC;\">grapefruit</td>\n<td class=\"gt_row gt_center\" style=\"background-color: #BFBFBF;\">seven</td>\n<td class=\"gt_row gt_left\" style=\"background-color: #B3B3B3;\">NA</td>\n<td class=\"gt_row gt_left\" style=\"background-color: #A6A6A6;\">19:10</td>\n<td class=\"gt_row gt_left\" style=\"background-color: #999999;\">2018-07-07 05:22</td>\n<td class=\"gt_row gt_right\" style=\"background-color: #8C8C8C;\">NA</td>\n<td class=\"gt_row gt_left\" style=\"background-color: #7F7F7F;\">row_7</td>\n<td class=\"gt_row gt_left\" style=\"background-color: #737373;\">grp_b</td></tr>\n    <tr><td class=\"gt_row gt_right\" style=\"background-color: #D9D9D9;\">8.880e+06</td>\n<td class=\"gt_row gt_left\" style=\"background-color: #CCCCCC;\">honeydew</td>\n<td class=\"gt_row gt_center\" style=\"background-color: #BFBFBF;\">eight</td>\n<td class=\"gt_row gt_left\" style=\"background-color: #B3B3B3;\">2015-08-15</td>\n<td class=\"gt_row gt_left\" style=\"background-color: #A6A6A6;\">20:20</td>\n<td class=\"gt_row gt_left\" style=\"background-color: #999999;\">NA</td>\n<td class=\"gt_row gt_right\" style=\"background-color: #8C8C8C;\">0.440</td>\n<td class=\"gt_row gt_left\" style=\"background-color: #7F7F7F;\">row_8</td>\n<td class=\"gt_row gt_left\" style=\"background-color: #737373;\">grp_b</td></tr>\n  </tbody>\n  <tfoot class=\"gt_sourcenotes\">\n    <tr>\n      <td class=\"gt_sourcenote\" style=\"background-color: #F5DEB3;\" colspan=\"9\">Source note #1</td>\n    </tr>\n    <tr>\n      <td class=\"gt_sourcenote\" style=\"background-color: #F5DEB3;\" colspan=\"9\">Source note #2</td>\n    </tr>\n  </tfoot>\n  \n</table>"

---

    Code
      .
    Output
      [1] "<table class=\"gt_table\">\n  <thead class=\"gt_header\">\n    <tr>\n      <th colspan=\"8\" class=\"gt_heading gt_title gt_font_normal\" style=\"background-color: #ADD8E6;\">Data listing from <strong>exibble</strong></th>\n    </tr>\n    <tr>\n      <th colspan=\"8\" class=\"gt_heading gt_subtitle gt_font_normal gt_bottom_border\" style=\"background-color: #00FFFF;\"><code>exibble</code> is an R dataset</th>\n    </tr>\n  </thead>\n  <thead class=\"gt_col_headings\">\n    <tr>\n      <th class=\"gt_col_heading gt_columns_bottom_border gt_right\" rowspan=\"2\" colspan=\"1\" style=\"background-color: #7FFFD4;\">num</th>\n      <th class=\"gt_col_heading gt_columns_bottom_border gt_left\" rowspan=\"2\" colspan=\"1\" style=\"background-color: #7FFFD4;\">char</th>\n      <th class=\"gt_col_heading gt_columns_bottom_border gt_center\" rowspan=\"2\" colspan=\"1\" style=\"background-color: #7FFFD4;\">fctr</th>\n      <th class=\"gt_center gt_columns_top_border gt_column_spanner_outer\" rowspan=\"1\" colspan=\"3\" style=\"background-color: #FFFF00;\">\n        <span class=\"gt_column_spanner\">timing</span>\n      </th>\n      <th class=\"gt_col_heading gt_columns_bottom_border gt_right\" rowspan=\"2\" colspan=\"1\" style=\"background-color: #7FFFD4;\">currency</th>\n      <th class=\"gt_col_heading gt_columns_bottom_border gt_left\" rowspan=\"2\" colspan=\"1\" style=\"background-color: #7FFFD4;\">row</th>\n    </tr>\n    <tr>\n      <th class=\"gt_col_heading gt_columns_bottom_border gt_left\" rowspan=\"1\" colspan=\"1\" style=\"background-color: #7FFFD4;\">date</th>\n      <th class=\"gt_col_heading gt_columns_bottom_border gt_left\" rowspan=\"1\" colspan=\"1\" style=\"background-color: #7FFFD4;\">time</th>\n      <th class=\"gt_col_heading gt_columns_bottom_border gt_left\" rowspan=\"1\" colspan=\"1\" style=\"background-color: #7FFFD4;\">datetime</th>\n    </tr>\n  </thead>\n  <tbody class=\"gt_table_body\">\n    <tr class=\"gt_group_heading_row\">\n      <td colspan=\"8\" class=\"gt_group_heading\" style=\"background-color: #E0FFFF;\">grp_a</td>\n    </tr>\n    <tr class=\"gt_row_group_first\"><td class=\"gt_row gt_right\" style=\"background-color: #D9D9D9;\">1.111e-01</td>\n<td class=\"gt_row gt_left\" style=\"background-color: #CCCCCC;\">apricot</td>\n<td class=\"gt_row gt_center\" style=\"background-color: #BFBFBF;\">one</td>\n<td class=\"gt_row gt_left\" style=\"background-color: #B3B3B3;\">2015-01-15</td>\n<td class=\"gt_row gt_left\" style=\"background-color: #A6A6A6;\">13:35</td>\n<td class=\"gt_row gt_left\" style=\"background-color: #999999;\">2018-01-01 02:22</td>\n<td class=\"gt_row gt_right\" style=\"background-color: #8C8C8C;\">49.950</td>\n<td class=\"gt_row gt_left\" style=\"background-color: #7F7F7F;\">row_1</td></tr>\n    <tr><td class=\"gt_row gt_right\" style=\"background-color: #D9D9D9;\">2.222e+00</td>\n<td class=\"gt_row gt_left\" style=\"background-color: #CCCCCC;\">banana</td>\n<td class=\"gt_row gt_center\" style=\"background-color: #BFBFBF;\">two</td>\n<td class=\"gt_row gt_left\" style=\"background-color: #B3B3B3;\">2015-02-15</td>\n<td class=\"gt_row gt_left\" style=\"background-color: #A6A6A6;\">14:40</td>\n<td class=\"gt_row gt_left\" style=\"background-color: #999999;\">2018-02-02 14:33</td>\n<td class=\"gt_row gt_right\" style=\"background-color: #8C8C8C;\">17.950</td>\n<td class=\"gt_row gt_left\" style=\"background-color: #7F7F7F;\">row_2</td></tr>\n    <tr><td class=\"gt_row gt_right\" style=\"background-color: #D9D9D9;\">3.333e+01</td>\n<td class=\"gt_row gt_left\" style=\"background-color: #CCCCCC;\">coconut</td>\n<td class=\"gt_row gt_center\" style=\"background-color: #BFBFBF;\">three</td>\n<td class=\"gt_row gt_left\" style=\"background-color: #B3B3B3;\">2015-03-15</td>\n<td class=\"gt_row gt_left\" style=\"background-color: #A6A6A6;\">15:45</td>\n<td class=\"gt_row gt_left\" style=\"background-color: #999999;\">2018-03-03 03:44</td>\n<td class=\"gt_row gt_right\" style=\"background-color: #8C8C8C;\">1.390</td>\n<td class=\"gt_row gt_left\" style=\"background-color: #7F7F7F;\">row_3</td></tr>\n    <tr><td class=\"gt_row gt_right\" style=\"background-color: #D9D9D9;\">4.444e+02</td>\n<td class=\"gt_row gt_left\" style=\"background-color: #CCCCCC;\">durian</td>\n<td class=\"gt_row gt_center\" style=\"background-color: #BFBFBF;\">four</td>\n<td class=\"gt_row gt_left\" style=\"background-color: #B3B3B3;\">2015-04-15</td>\n<td class=\"gt_row gt_left\" style=\"background-color: #A6A6A6;\">16:50</td>\n<td class=\"gt_row gt_left\" style=\"background-color: #999999;\">2018-04-04 15:55</td>\n<td class=\"gt_row gt_right\" style=\"background-color: #8C8C8C;\">65100.000</td>\n<td class=\"gt_row gt_left\" style=\"background-color: #7F7F7F;\">row_4</td></tr>\n    <tr class=\"gt_group_heading_row\">\n      <td colspan=\"8\" class=\"gt_group_heading\" style=\"background-color: #E0FFFF;\">grp_b</td>\n    </tr>\n    <tr class=\"gt_row_group_first\"><td class=\"gt_row gt_right\" style=\"background-color: #D9D9D9;\">5.550e+03</td>\n<td class=\"gt_row gt_left\" style=\"background-color: #CCCCCC;\">NA</td>\n<td class=\"gt_row gt_center\" style=\"background-color: #BFBFBF;\">five</td>\n<td class=\"gt_row gt_left\" style=\"background-color: #B3B3B3;\">2015-05-15</td>\n<td class=\"gt_row gt_left\" style=\"background-color: #A6A6A6;\">17:55</td>\n<td class=\"gt_row gt_left\" style=\"background-color: #999999;\">2018-05-05 04:00</td>\n<td class=\"gt_row gt_right\" style=\"background-color: #8C8C8C;\">1325.810</td>\n<td class=\"gt_row gt_left\" style=\"background-color: #7F7F7F;\">row_5</td></tr>\n    <tr><td class=\"gt_row gt_right\" style=\"background-color: #D9D9D9;\">NA</td>\n<td class=\"gt_row gt_left\" style=\"background-color: #CCCCCC;\">fig</td>\n<td class=\"gt_row gt_center\" style=\"background-color: #BFBFBF;\">six</td>\n<td class=\"gt_row gt_left\" style=\"background-color: #B3B3B3;\">2015-06-15</td>\n<td class=\"gt_row gt_left\" style=\"background-color: #A6A6A6;\">NA</td>\n<td class=\"gt_row gt_left\" style=\"background-color: #999999;\">2018-06-06 16:11</td>\n<td class=\"gt_row gt_right\" style=\"background-color: #8C8C8C;\">13.255</td>\n<td class=\"gt_row gt_left\" style=\"background-color: #7F7F7F;\">row_6</td></tr>\n    <tr><td class=\"gt_row gt_right\" style=\"background-color: #D9D9D9;\">7.770e+05</td>\n<td class=\"gt_row gt_left\" style=\"background-color: #CCCCCC;\">grapefruit</td>\n<td class=\"gt_row gt_center\" style=\"background-color: #BFBFBF;\">seven</td>\n<td class=\"gt_row gt_left\" style=\"background-color: #B3B3B3;\">NA</td>\n<td class=\"gt_row gt_left\" style=\"background-color: #A6A6A6;\">19:10</td>\n<td class=\"gt_row gt_left\" style=\"background-color: #999999;\">2018-07-07 05:22</td>\n<td class=\"gt_row gt_right\" style=\"background-color: #8C8C8C;\">NA</td>\n<td class=\"gt_row gt_left\" style=\"background-color: #7F7F7F;\">row_7</td></tr>\n    <tr><td class=\"gt_row gt_right\" style=\"background-color: #D9D9D9;\">8.880e+06</td>\n<td class=\"gt_row gt_left\" style=\"background-color: #CCCCCC;\">honeydew</td>\n<td class=\"gt_row gt_center\" style=\"background-color: #BFBFBF;\">eight</td>\n<td class=\"gt_row gt_left\" style=\"background-color: #B3B3B3;\">2015-08-15</td>\n<td class=\"gt_row gt_left\" style=\"background-color: #A6A6A6;\">20:20</td>\n<td class=\"gt_row gt_left\" style=\"background-color: #999999;\">NA</td>\n<td class=\"gt_row gt_right\" style=\"background-color: #8C8C8C;\">0.440</td>\n<td class=\"gt_row gt_left\" style=\"background-color: #7F7F7F;\">row_8</td></tr>\n  </tbody>\n  <tfoot class=\"gt_sourcenotes\">\n    <tr>\n      <td class=\"gt_sourcenote\" style=\"background-color: #F5DEB3;\" colspan=\"8\">Source note #1</td>\n    </tr>\n    <tr>\n      <td class=\"gt_sourcenote\" style=\"background-color: #F5DEB3;\" colspan=\"8\">Source note #2</td>\n    </tr>\n  </tfoot>\n  \n</table>"

---

    Code
      .
    Output
      [1] "<table class=\"gt_table\">\n  <thead class=\"gt_header\">\n    <tr>\n      <th colspan=\"9\" class=\"gt_heading gt_title gt_font_normal\" style=\"background-color: #ADD8E6;\">Data listing from <strong>exibble</strong></th>\n    </tr>\n    <tr>\n      <th colspan=\"9\" class=\"gt_heading gt_subtitle gt_font_normal gt_bottom_border\" style=\"background-color: #00FFFF;\"><code>exibble</code> is an R dataset</th>\n    </tr>\n  </thead>\n  <thead class=\"gt_col_headings\">\n    <tr>\n      <th class=\"gt_col_heading gt_columns_bottom_border gt_left\" rowspan=\"2\" colspan=\"1\" style=\"background-color: #DCDCDC;\">S.L.</th>\n      <th class=\"gt_col_heading gt_columns_bottom_border gt_right\" rowspan=\"2\" colspan=\"1\" style=\"background-color: #7FFFD4;\">num</th>\n      <th class=\"gt_col_heading gt_columns_bottom_border gt_left\" rowspan=\"2\" colspan=\"1\" style=\"background-color: #7FFFD4;\">char</th>\n      <th class=\"gt_col_heading gt_columns_bottom_border gt_center\" rowspan=\"2\" colspan=\"1\" style=\"background-color: #7FFFD4;\">fctr</th>\n      <th class=\"gt_center gt_columns_top_border gt_column_spanner_outer\" rowspan=\"1\" colspan=\"3\" style=\"background-color: #FFFF00;\">\n        <span class=\"gt_column_spanner\">timing</span>\n      </th>\n      <th class=\"gt_col_heading gt_columns_bottom_border gt_right\" rowspan=\"2\" colspan=\"1\" style=\"background-color: #7FFFD4;\">currency</th>\n      <th class=\"gt_col_heading gt_columns_bottom_border gt_left\" rowspan=\"2\" colspan=\"1\" style=\"background-color: #7FFFD4;\">row</th>\n    </tr>\n    <tr>\n      <th class=\"gt_col_heading gt_columns_bottom_border gt_left\" rowspan=\"1\" colspan=\"1\" style=\"background-color: #7FFFD4;\">date</th>\n      <th class=\"gt_col_heading gt_columns_bottom_border gt_left\" rowspan=\"1\" colspan=\"1\" style=\"background-color: #7FFFD4;\">time</th>\n      <th class=\"gt_col_heading gt_columns_bottom_border gt_left\" rowspan=\"1\" colspan=\"1\" style=\"background-color: #7FFFD4;\">datetime</th>\n    </tr>\n  </thead>\n  <tbody class=\"gt_table_body\">\n    <tr class=\"gt_row_group_first\"><td rowspan=\"4\" class=\"gt_row gt_right gt_stub_row_group\" style=\"background-color: #E0FFFF;\">grp_a</td>\n<td class=\"gt_row gt_right\" style=\"background-color: #D9D9D9;\">1.111e-01</td>\n<td class=\"gt_row gt_left\" style=\"background-color: #CCCCCC;\">apricot</td>\n<td class=\"gt_row gt_center\" style=\"background-color: #BFBFBF;\">one</td>\n<td class=\"gt_row gt_left\" style=\"background-color: #B3B3B3;\">2015-01-15</td>\n<td class=\"gt_row gt_left\" style=\"background-color: #A6A6A6;\">13:35</td>\n<td class=\"gt_row gt_left\" style=\"background-color: #999999;\">2018-01-01 02:22</td>\n<td class=\"gt_row gt_right\" style=\"background-color: #8C8C8C;\">49.950</td>\n<td class=\"gt_row gt_left\" style=\"background-color: #7F7F7F;\">row_1</td></tr>\n    <tr><td class=\"gt_row gt_right\" style=\"background-color: #D9D9D9;\">2.222e+00</td>\n<td class=\"gt_row gt_left\" style=\"background-color: #CCCCCC;\">banana</td>\n<td class=\"gt_row gt_center\" style=\"background-color: #BFBFBF;\">two</td>\n<td class=\"gt_row gt_left\" style=\"background-color: #B3B3B3;\">2015-02-15</td>\n<td class=\"gt_row gt_left\" style=\"background-color: #A6A6A6;\">14:40</td>\n<td class=\"gt_row gt_left\" style=\"background-color: #999999;\">2018-02-02 14:33</td>\n<td class=\"gt_row gt_right\" style=\"background-color: #8C8C8C;\">17.950</td>\n<td class=\"gt_row gt_left\" style=\"background-color: #7F7F7F;\">row_2</td></tr>\n    <tr><td class=\"gt_row gt_right\" style=\"background-color: #D9D9D9;\">3.333e+01</td>\n<td class=\"gt_row gt_left\" style=\"background-color: #CCCCCC;\">coconut</td>\n<td class=\"gt_row gt_center\" style=\"background-color: #BFBFBF;\">three</td>\n<td class=\"gt_row gt_left\" style=\"background-color: #B3B3B3;\">2015-03-15</td>\n<td class=\"gt_row gt_left\" style=\"background-color: #A6A6A6;\">15:45</td>\n<td class=\"gt_row gt_left\" style=\"background-color: #999999;\">2018-03-03 03:44</td>\n<td class=\"gt_row gt_right\" style=\"background-color: #8C8C8C;\">1.390</td>\n<td class=\"gt_row gt_left\" style=\"background-color: #7F7F7F;\">row_3</td></tr>\n    <tr><td class=\"gt_row gt_right\" style=\"background-color: #D9D9D9;\">4.444e+02</td>\n<td class=\"gt_row gt_left\" style=\"background-color: #CCCCCC;\">durian</td>\n<td class=\"gt_row gt_center\" style=\"background-color: #BFBFBF;\">four</td>\n<td class=\"gt_row gt_left\" style=\"background-color: #B3B3B3;\">2015-04-15</td>\n<td class=\"gt_row gt_left\" style=\"background-color: #A6A6A6;\">16:50</td>\n<td class=\"gt_row gt_left\" style=\"background-color: #999999;\">2018-04-04 15:55</td>\n<td class=\"gt_row gt_right\" style=\"background-color: #8C8C8C;\">65100.000</td>\n<td class=\"gt_row gt_left\" style=\"background-color: #7F7F7F;\">row_4</td></tr>\n    <tr class=\"gt_row_group_first\"><td rowspan=\"4\" class=\"gt_row gt_right gt_stub_row_group\" style=\"background-color: #E0FFFF;\">grp_b</td>\n<td class=\"gt_row gt_right\" style=\"background-color: #D9D9D9;\">5.550e+03</td>\n<td class=\"gt_row gt_left\" style=\"background-color: #CCCCCC;\">NA</td>\n<td class=\"gt_row gt_center\" style=\"background-color: #BFBFBF;\">five</td>\n<td class=\"gt_row gt_left\" style=\"background-color: #B3B3B3;\">2015-05-15</td>\n<td class=\"gt_row gt_left\" style=\"background-color: #A6A6A6;\">17:55</td>\n<td class=\"gt_row gt_left\" style=\"background-color: #999999;\">2018-05-05 04:00</td>\n<td class=\"gt_row gt_right\" style=\"background-color: #8C8C8C;\">1325.810</td>\n<td class=\"gt_row gt_left\" style=\"background-color: #7F7F7F;\">row_5</td></tr>\n    <tr><td class=\"gt_row gt_right\" style=\"background-color: #D9D9D9;\">NA</td>\n<td class=\"gt_row gt_left\" style=\"background-color: #CCCCCC;\">fig</td>\n<td class=\"gt_row gt_center\" style=\"background-color: #BFBFBF;\">six</td>\n<td class=\"gt_row gt_left\" style=\"background-color: #B3B3B3;\">2015-06-15</td>\n<td class=\"gt_row gt_left\" style=\"background-color: #A6A6A6;\">NA</td>\n<td class=\"gt_row gt_left\" style=\"background-color: #999999;\">2018-06-06 16:11</td>\n<td class=\"gt_row gt_right\" style=\"background-color: #8C8C8C;\">13.255</td>\n<td class=\"gt_row gt_left\" style=\"background-color: #7F7F7F;\">row_6</td></tr>\n    <tr><td class=\"gt_row gt_right\" style=\"background-color: #D9D9D9;\">7.770e+05</td>\n<td class=\"gt_row gt_left\" style=\"background-color: #CCCCCC;\">grapefruit</td>\n<td class=\"gt_row gt_center\" style=\"background-color: #BFBFBF;\">seven</td>\n<td class=\"gt_row gt_left\" style=\"background-color: #B3B3B3;\">NA</td>\n<td class=\"gt_row gt_left\" style=\"background-color: #A6A6A6;\">19:10</td>\n<td class=\"gt_row gt_left\" style=\"background-color: #999999;\">2018-07-07 05:22</td>\n<td class=\"gt_row gt_right\" style=\"background-color: #8C8C8C;\">NA</td>\n<td class=\"gt_row gt_left\" style=\"background-color: #7F7F7F;\">row_7</td></tr>\n    <tr><td class=\"gt_row gt_right\" style=\"background-color: #D9D9D9;\">8.880e+06</td>\n<td class=\"gt_row gt_left\" style=\"background-color: #CCCCCC;\">honeydew</td>\n<td class=\"gt_row gt_center\" style=\"background-color: #BFBFBF;\">eight</td>\n<td class=\"gt_row gt_left\" style=\"background-color: #B3B3B3;\">2015-08-15</td>\n<td class=\"gt_row gt_left\" style=\"background-color: #A6A6A6;\">20:20</td>\n<td class=\"gt_row gt_left\" style=\"background-color: #999999;\">NA</td>\n<td class=\"gt_row gt_right\" style=\"background-color: #8C8C8C;\">0.440</td>\n<td class=\"gt_row gt_left\" style=\"background-color: #7F7F7F;\">row_8</td></tr>\n  </tbody>\n  <tfoot class=\"gt_sourcenotes\">\n    <tr>\n      <td class=\"gt_sourcenote\" style=\"background-color: #F5DEB3;\" colspan=\"9\">Source note #1</td>\n    </tr>\n    <tr>\n      <td class=\"gt_sourcenote\" style=\"background-color: #F5DEB3;\" colspan=\"9\">Source note #2</td>\n    </tr>\n  </tfoot>\n  \n</table>"

---

    Code
      .
    Output
      [1] "<table class=\"gt_table\">\n  <thead class=\"gt_header\">\n    <tr>\n      <th colspan=\"9\" class=\"gt_heading gt_title gt_font_normal\" style=\"background-color: #ADD8E6;\">Data listing from <strong>exibble</strong></th>\n    </tr>\n    <tr>\n      <th colspan=\"9\" class=\"gt_heading gt_subtitle gt_font_normal gt_bottom_border\" style=\"background-color: #00FFFF;\"><code>exibble</code> is an R dataset</th>\n    </tr>\n  </thead>\n  <thead class=\"gt_col_headings\">\n    <tr>\n      <th class=\"gt_col_heading gt_columns_bottom_border gt_left\" rowspan=\"2\" colspan=\"1\" style=\"background-color: #DCDCDC;\">S.L.</th>\n      <th class=\"gt_col_heading gt_columns_bottom_border gt_right\" rowspan=\"2\" colspan=\"1\" style=\"background-color: #7FFFD4;\">num</th>\n      <th class=\"gt_col_heading gt_columns_bottom_border gt_left\" rowspan=\"2\" colspan=\"1\" style=\"background-color: #7FFFD4;\">char</th>\n      <th class=\"gt_col_heading gt_columns_bottom_border gt_center\" rowspan=\"2\" colspan=\"1\" style=\"background-color: #7FFFD4;\">fctr</th>\n      <th class=\"gt_center gt_columns_top_border gt_column_spanner_outer\" rowspan=\"1\" colspan=\"3\" style=\"background-color: #FFFF00;\">\n        <span class=\"gt_column_spanner\">timing</span>\n      </th>\n      <th class=\"gt_col_heading gt_columns_bottom_border gt_right\" rowspan=\"2\" colspan=\"1\" style=\"background-color: #7FFFD4;\">currency</th>\n      <th class=\"gt_col_heading gt_columns_bottom_border gt_left\" rowspan=\"2\" colspan=\"1\" style=\"background-color: #7FFFD4;\">group</th>\n    </tr>\n    <tr>\n      <th class=\"gt_col_heading gt_columns_bottom_border gt_left\" rowspan=\"1\" colspan=\"1\" style=\"background-color: #7FFFD4;\">date</th>\n      <th class=\"gt_col_heading gt_columns_bottom_border gt_left\" rowspan=\"1\" colspan=\"1\" style=\"background-color: #7FFFD4;\">time</th>\n      <th class=\"gt_col_heading gt_columns_bottom_border gt_left\" rowspan=\"1\" colspan=\"1\" style=\"background-color: #7FFFD4;\">datetime</th>\n    </tr>\n  </thead>\n  <tbody class=\"gt_table_body\">\n    <tr><td class=\"gt_row gt_right gt_stub\" style=\"background-color: #FFDAB9;\">row_1</td>\n<td class=\"gt_row gt_right\" style=\"background-color: #D9D9D9;\">1.111e-01</td>\n<td class=\"gt_row gt_left\" style=\"background-color: #CCCCCC;\">apricot</td>\n<td class=\"gt_row gt_center\" style=\"background-color: #BFBFBF;\">one</td>\n<td class=\"gt_row gt_left\" style=\"background-color: #B3B3B3;\">2015-01-15</td>\n<td class=\"gt_row gt_left\" style=\"background-color: #A6A6A6;\">13:35</td>\n<td class=\"gt_row gt_left\" style=\"background-color: #999999;\">2018-01-01 02:22</td>\n<td class=\"gt_row gt_right\" style=\"background-color: #8C8C8C;\">49.950</td>\n<td class=\"gt_row gt_left\" style=\"background-color: #737373;\">grp_a</td></tr>\n    <tr><td class=\"gt_row gt_right gt_stub\" style=\"background-color: #FFDAB9;\">row_2</td>\n<td class=\"gt_row gt_right\" style=\"background-color: #D9D9D9;\">2.222e+00</td>\n<td class=\"gt_row gt_left\" style=\"background-color: #CCCCCC;\">banana</td>\n<td class=\"gt_row gt_center\" style=\"background-color: #BFBFBF;\">two</td>\n<td class=\"gt_row gt_left\" style=\"background-color: #B3B3B3;\">2015-02-15</td>\n<td class=\"gt_row gt_left\" style=\"background-color: #A6A6A6;\">14:40</td>\n<td class=\"gt_row gt_left\" style=\"background-color: #999999;\">2018-02-02 14:33</td>\n<td class=\"gt_row gt_right\" style=\"background-color: #8C8C8C;\">17.950</td>\n<td class=\"gt_row gt_left\" style=\"background-color: #737373;\">grp_a</td></tr>\n    <tr><td class=\"gt_row gt_right gt_stub\" style=\"background-color: #FFDAB9;\">row_3</td>\n<td class=\"gt_row gt_right\" style=\"background-color: #D9D9D9;\">3.333e+01</td>\n<td class=\"gt_row gt_left\" style=\"background-color: #CCCCCC;\">coconut</td>\n<td class=\"gt_row gt_center\" style=\"background-color: #BFBFBF;\">three</td>\n<td class=\"gt_row gt_left\" style=\"background-color: #B3B3B3;\">2015-03-15</td>\n<td class=\"gt_row gt_left\" style=\"background-color: #A6A6A6;\">15:45</td>\n<td class=\"gt_row gt_left\" style=\"background-color: #999999;\">2018-03-03 03:44</td>\n<td class=\"gt_row gt_right\" style=\"background-color: #8C8C8C;\">1.390</td>\n<td class=\"gt_row gt_left\" style=\"background-color: #737373;\">grp_a</td></tr>\n    <tr><td class=\"gt_row gt_right gt_stub\" style=\"background-color: #FFDAB9;\">row_4</td>\n<td class=\"gt_row gt_right\" style=\"background-color: #D9D9D9;\">4.444e+02</td>\n<td class=\"gt_row gt_left\" style=\"background-color: #CCCCCC;\">durian</td>\n<td class=\"gt_row gt_center\" style=\"background-color: #BFBFBF;\">four</td>\n<td class=\"gt_row gt_left\" style=\"background-color: #B3B3B3;\">2015-04-15</td>\n<td class=\"gt_row gt_left\" style=\"background-color: #A6A6A6;\">16:50</td>\n<td class=\"gt_row gt_left\" style=\"background-color: #999999;\">2018-04-04 15:55</td>\n<td class=\"gt_row gt_right\" style=\"background-color: #8C8C8C;\">65100.000</td>\n<td class=\"gt_row gt_left\" style=\"background-color: #737373;\">grp_a</td></tr>\n    <tr><td class=\"gt_row gt_right gt_stub\" style=\"background-color: #FFDAB9;\">row_5</td>\n<td class=\"gt_row gt_right\" style=\"background-color: #D9D9D9;\">5.550e+03</td>\n<td class=\"gt_row gt_left\" style=\"background-color: #CCCCCC;\">NA</td>\n<td class=\"gt_row gt_center\" style=\"background-color: #BFBFBF;\">five</td>\n<td class=\"gt_row gt_left\" style=\"background-color: #B3B3B3;\">2015-05-15</td>\n<td class=\"gt_row gt_left\" style=\"background-color: #A6A6A6;\">17:55</td>\n<td class=\"gt_row gt_left\" style=\"background-color: #999999;\">2018-05-05 04:00</td>\n<td class=\"gt_row gt_right\" style=\"background-color: #8C8C8C;\">1325.810</td>\n<td class=\"gt_row gt_left\" style=\"background-color: #737373;\">grp_b</td></tr>\n    <tr><td class=\"gt_row gt_right gt_stub\" style=\"background-color: #FFDAB9;\">row_6</td>\n<td class=\"gt_row gt_right\" style=\"background-color: #D9D9D9;\">NA</td>\n<td class=\"gt_row gt_left\" style=\"background-color: #CCCCCC;\">fig</td>\n<td class=\"gt_row gt_center\" style=\"background-color: #BFBFBF;\">six</td>\n<td class=\"gt_row gt_left\" style=\"background-color: #B3B3B3;\">2015-06-15</td>\n<td class=\"gt_row gt_left\" style=\"background-color: #A6A6A6;\">NA</td>\n<td class=\"gt_row gt_left\" style=\"background-color: #999999;\">2018-06-06 16:11</td>\n<td class=\"gt_row gt_right\" style=\"background-color: #8C8C8C;\">13.255</td>\n<td class=\"gt_row gt_left\" style=\"background-color: #737373;\">grp_b</td></tr>\n    <tr><td class=\"gt_row gt_right gt_stub\" style=\"background-color: #FFDAB9;\">row_7</td>\n<td class=\"gt_row gt_right\" style=\"background-color: #D9D9D9;\">7.770e+05</td>\n<td class=\"gt_row gt_left\" style=\"background-color: #CCCCCC;\">grapefruit</td>\n<td class=\"gt_row gt_center\" style=\"background-color: #BFBFBF;\">seven</td>\n<td class=\"gt_row gt_left\" style=\"background-color: #B3B3B3;\">NA</td>\n<td class=\"gt_row gt_left\" style=\"background-color: #A6A6A6;\">19:10</td>\n<td class=\"gt_row gt_left\" style=\"background-color: #999999;\">2018-07-07 05:22</td>\n<td class=\"gt_row gt_right\" style=\"background-color: #8C8C8C;\">NA</td>\n<td class=\"gt_row gt_left\" style=\"background-color: #737373;\">grp_b</td></tr>\n    <tr><td class=\"gt_row gt_right gt_stub\" style=\"background-color: #FFDAB9;\">row_8</td>\n<td class=\"gt_row gt_right\" style=\"background-color: #D9D9D9;\">8.880e+06</td>\n<td class=\"gt_row gt_left\" style=\"background-color: #CCCCCC;\">honeydew</td>\n<td class=\"gt_row gt_center\" style=\"background-color: #BFBFBF;\">eight</td>\n<td class=\"gt_row gt_left\" style=\"background-color: #B3B3B3;\">2015-08-15</td>\n<td class=\"gt_row gt_left\" style=\"background-color: #A6A6A6;\">20:20</td>\n<td class=\"gt_row gt_left\" style=\"background-color: #999999;\">NA</td>\n<td class=\"gt_row gt_right\" style=\"background-color: #8C8C8C;\">0.440</td>\n<td class=\"gt_row gt_left\" style=\"background-color: #737373;\">grp_b</td></tr>\n  </tbody>\n  <tfoot class=\"gt_sourcenotes\">\n    <tr>\n      <td class=\"gt_sourcenote\" style=\"background-color: #F5DEB3;\" colspan=\"9\">Source note #1</td>\n    </tr>\n    <tr>\n      <td class=\"gt_sourcenote\" style=\"background-color: #F5DEB3;\" colspan=\"9\">Source note #2</td>\n    </tr>\n  </tfoot>\n  \n</table>"

---

    Code
      .
    Output
      [1] "<table class=\"gt_table\">\n  <thead class=\"gt_header\">\n    <tr>\n      <th colspan=\"9\" class=\"gt_heading gt_title gt_font_normal\" style=\"background-color: #ADD8E6;\">Data listing from <strong>exibble</strong></th>\n    </tr>\n    <tr>\n      <th colspan=\"9\" class=\"gt_heading gt_subtitle gt_font_normal gt_bottom_border\" style=\"background-color: #00FFFF;\"><code>exibble</code> is an R dataset</th>\n    </tr>\n  </thead>\n  <thead class=\"gt_col_headings\">\n    <tr>\n      <th class=\"gt_col_heading gt_columns_bottom_border gt_left\" rowspan=\"2\" colspan=\"1\" style=\"background-color: #DCDCDC;\">S.L.</th>\n      <th class=\"gt_col_heading gt_columns_bottom_border gt_right\" rowspan=\"2\" colspan=\"1\" style=\"background-color: #7FFFD4;\">num</th>\n      <th class=\"gt_col_heading gt_columns_bottom_border gt_left\" rowspan=\"2\" colspan=\"1\" style=\"background-color: #7FFFD4;\">char</th>\n      <th class=\"gt_col_heading gt_columns_bottom_border gt_center\" rowspan=\"2\" colspan=\"1\" style=\"background-color: #7FFFD4;\">fctr</th>\n      <th class=\"gt_center gt_columns_top_border gt_column_spanner_outer\" rowspan=\"1\" colspan=\"3\" style=\"background-color: #FFFF00;\">\n        <span class=\"gt_column_spanner\">timing</span>\n      </th>\n      <th class=\"gt_col_heading gt_columns_bottom_border gt_right\" rowspan=\"2\" colspan=\"1\" style=\"background-color: #7FFFD4;\">currency</th>\n      <th class=\"gt_col_heading gt_columns_bottom_border gt_left\" rowspan=\"2\" colspan=\"1\" style=\"background-color: #7FFFD4;\">group</th>\n    </tr>\n    <tr>\n      <th class=\"gt_col_heading gt_columns_bottom_border gt_left\" rowspan=\"1\" colspan=\"1\" style=\"background-color: #7FFFD4;\">date</th>\n      <th class=\"gt_col_heading gt_columns_bottom_border gt_left\" rowspan=\"1\" colspan=\"1\" style=\"background-color: #7FFFD4;\">time</th>\n      <th class=\"gt_col_heading gt_columns_bottom_border gt_left\" rowspan=\"1\" colspan=\"1\" style=\"background-color: #7FFFD4;\">datetime</th>\n    </tr>\n  </thead>\n  <tbody class=\"gt_table_body\">\n    <tr><td class=\"gt_row gt_right gt_stub\" style=\"background-color: #FFDAB9;\">row_1</td>\n<td class=\"gt_row gt_right\" style=\"background-color: #D9D9D9;\">1.111e-01</td>\n<td class=\"gt_row gt_left\" style=\"background-color: #CCCCCC;\">apricot</td>\n<td class=\"gt_row gt_center\" style=\"background-color: #BFBFBF;\">one</td>\n<td class=\"gt_row gt_left\" style=\"background-color: #B3B3B3;\">2015-01-15</td>\n<td class=\"gt_row gt_left\" style=\"background-color: #A6A6A6;\">13:35</td>\n<td class=\"gt_row gt_left\" style=\"background-color: #999999;\">2018-01-01 02:22</td>\n<td class=\"gt_row gt_right\" style=\"background-color: #8C8C8C;\">49.950</td>\n<td class=\"gt_row gt_left\" style=\"background-color: #737373;\">grp_a</td></tr>\n    <tr><td class=\"gt_row gt_right gt_stub\" style=\"background-color: #FFDAB9;\">row_2</td>\n<td class=\"gt_row gt_right\" style=\"background-color: #D9D9D9;\">2.222e+00</td>\n<td class=\"gt_row gt_left\" style=\"background-color: #CCCCCC;\">banana</td>\n<td class=\"gt_row gt_center\" style=\"background-color: #BFBFBF;\">two</td>\n<td class=\"gt_row gt_left\" style=\"background-color: #B3B3B3;\">2015-02-15</td>\n<td class=\"gt_row gt_left\" style=\"background-color: #A6A6A6;\">14:40</td>\n<td class=\"gt_row gt_left\" style=\"background-color: #999999;\">2018-02-02 14:33</td>\n<td class=\"gt_row gt_right\" style=\"background-color: #8C8C8C;\">17.950</td>\n<td class=\"gt_row gt_left\" style=\"background-color: #737373;\">grp_a</td></tr>\n    <tr><td class=\"gt_row gt_right gt_stub\" style=\"background-color: #FFDAB9;\">row_3</td>\n<td class=\"gt_row gt_right\" style=\"background-color: #D9D9D9;\">3.333e+01</td>\n<td class=\"gt_row gt_left\" style=\"background-color: #CCCCCC;\">coconut</td>\n<td class=\"gt_row gt_center\" style=\"background-color: #BFBFBF;\">three</td>\n<td class=\"gt_row gt_left\" style=\"background-color: #B3B3B3;\">2015-03-15</td>\n<td class=\"gt_row gt_left\" style=\"background-color: #A6A6A6;\">15:45</td>\n<td class=\"gt_row gt_left\" style=\"background-color: #999999;\">2018-03-03 03:44</td>\n<td class=\"gt_row gt_right\" style=\"background-color: #8C8C8C;\">1.390</td>\n<td class=\"gt_row gt_left\" style=\"background-color: #737373;\">grp_a</td></tr>\n    <tr><td class=\"gt_row gt_right gt_stub\" style=\"background-color: #FFDAB9;\">row_4</td>\n<td class=\"gt_row gt_right\" style=\"background-color: #D9D9D9;\">4.444e+02</td>\n<td class=\"gt_row gt_left\" style=\"background-color: #CCCCCC;\">durian</td>\n<td class=\"gt_row gt_center\" style=\"background-color: #BFBFBF;\">four</td>\n<td class=\"gt_row gt_left\" style=\"background-color: #B3B3B3;\">2015-04-15</td>\n<td class=\"gt_row gt_left\" style=\"background-color: #A6A6A6;\">16:50</td>\n<td class=\"gt_row gt_left\" style=\"background-color: #999999;\">2018-04-04 15:55</td>\n<td class=\"gt_row gt_right\" style=\"background-color: #8C8C8C;\">65100.000</td>\n<td class=\"gt_row gt_left\" style=\"background-color: #737373;\">grp_a</td></tr>\n    <tr><td class=\"gt_row gt_right gt_stub\" style=\"background-color: #FFDAB9;\">row_5</td>\n<td class=\"gt_row gt_right\" style=\"background-color: #D9D9D9;\">5.550e+03</td>\n<td class=\"gt_row gt_left\" style=\"background-color: #CCCCCC;\">NA</td>\n<td class=\"gt_row gt_center\" style=\"background-color: #BFBFBF;\">five</td>\n<td class=\"gt_row gt_left\" style=\"background-color: #B3B3B3;\">2015-05-15</td>\n<td class=\"gt_row gt_left\" style=\"background-color: #A6A6A6;\">17:55</td>\n<td class=\"gt_row gt_left\" style=\"background-color: #999999;\">2018-05-05 04:00</td>\n<td class=\"gt_row gt_right\" style=\"background-color: #8C8C8C;\">1325.810</td>\n<td class=\"gt_row gt_left\" style=\"background-color: #737373;\">grp_b</td></tr>\n    <tr><td class=\"gt_row gt_right gt_stub\" style=\"background-color: #FFDAB9;\">row_6</td>\n<td class=\"gt_row gt_right\" style=\"background-color: #D9D9D9;\">NA</td>\n<td class=\"gt_row gt_left\" style=\"background-color: #CCCCCC;\">fig</td>\n<td class=\"gt_row gt_center\" style=\"background-color: #BFBFBF;\">six</td>\n<td class=\"gt_row gt_left\" style=\"background-color: #B3B3B3;\">2015-06-15</td>\n<td class=\"gt_row gt_left\" style=\"background-color: #A6A6A6;\">NA</td>\n<td class=\"gt_row gt_left\" style=\"background-color: #999999;\">2018-06-06 16:11</td>\n<td class=\"gt_row gt_right\" style=\"background-color: #8C8C8C;\">13.255</td>\n<td class=\"gt_row gt_left\" style=\"background-color: #737373;\">grp_b</td></tr>\n    <tr><td class=\"gt_row gt_right gt_stub\" style=\"background-color: #FFDAB9;\">row_7</td>\n<td class=\"gt_row gt_right\" style=\"background-color: #D9D9D9;\">7.770e+05</td>\n<td class=\"gt_row gt_left\" style=\"background-color: #CCCCCC;\">grapefruit</td>\n<td class=\"gt_row gt_center\" style=\"background-color: #BFBFBF;\">seven</td>\n<td class=\"gt_row gt_left\" style=\"background-color: #B3B3B3;\">NA</td>\n<td class=\"gt_row gt_left\" style=\"background-color: #A6A6A6;\">19:10</td>\n<td class=\"gt_row gt_left\" style=\"background-color: #999999;\">2018-07-07 05:22</td>\n<td class=\"gt_row gt_right\" style=\"background-color: #8C8C8C;\">NA</td>\n<td class=\"gt_row gt_left\" style=\"background-color: #737373;\">grp_b</td></tr>\n    <tr><td class=\"gt_row gt_right gt_stub\" style=\"background-color: #FFDAB9;\">row_8</td>\n<td class=\"gt_row gt_right\" style=\"background-color: #D9D9D9;\">8.880e+06</td>\n<td class=\"gt_row gt_left\" style=\"background-color: #CCCCCC;\">honeydew</td>\n<td class=\"gt_row gt_center\" style=\"background-color: #BFBFBF;\">eight</td>\n<td class=\"gt_row gt_left\" style=\"background-color: #B3B3B3;\">2015-08-15</td>\n<td class=\"gt_row gt_left\" style=\"background-color: #A6A6A6;\">20:20</td>\n<td class=\"gt_row gt_left\" style=\"background-color: #999999;\">NA</td>\n<td class=\"gt_row gt_right\" style=\"background-color: #8C8C8C;\">0.440</td>\n<td class=\"gt_row gt_left\" style=\"background-color: #737373;\">grp_b</td></tr>\n  </tbody>\n  <tfoot class=\"gt_sourcenotes\">\n    <tr>\n      <td class=\"gt_sourcenote\" style=\"background-color: #F5DEB3;\" colspan=\"9\">Source note #1</td>\n    </tr>\n    <tr>\n      <td class=\"gt_sourcenote\" style=\"background-color: #F5DEB3;\" colspan=\"9\">Source note #2</td>\n    </tr>\n  </tfoot>\n  \n</table>"

---

    Code
      .
    Output
      [1] "<table class=\"gt_table\">\n  <thead class=\"gt_header\">\n    <tr>\n      <th colspan=\"8\" class=\"gt_heading gt_title gt_font_normal\" style=\"background-color: #ADD8E6;\">Data listing from <strong>exibble</strong></th>\n    </tr>\n    <tr>\n      <th colspan=\"8\" class=\"gt_heading gt_subtitle gt_font_normal gt_bottom_border\" style=\"background-color: #00FFFF;\"><code>exibble</code> is an R dataset</th>\n    </tr>\n  </thead>\n  <thead class=\"gt_col_headings\">\n    <tr>\n      <th class=\"gt_col_heading gt_columns_bottom_border gt_left\" rowspan=\"2\" colspan=\"1\" style=\"background-color: #DCDCDC;\">S.L.</th>\n      <th class=\"gt_col_heading gt_columns_bottom_border gt_right\" rowspan=\"2\" colspan=\"1\" style=\"background-color: #7FFFD4;\">num</th>\n      <th class=\"gt_col_heading gt_columns_bottom_border gt_left\" rowspan=\"2\" colspan=\"1\" style=\"background-color: #7FFFD4;\">char</th>\n      <th class=\"gt_col_heading gt_columns_bottom_border gt_center\" rowspan=\"2\" colspan=\"1\" style=\"background-color: #7FFFD4;\">fctr</th>\n      <th class=\"gt_center gt_columns_top_border gt_column_spanner_outer\" rowspan=\"1\" colspan=\"3\" style=\"background-color: #FFFF00;\">\n        <span class=\"gt_column_spanner\">timing</span>\n      </th>\n      <th class=\"gt_col_heading gt_columns_bottom_border gt_right\" rowspan=\"2\" colspan=\"1\" style=\"background-color: #7FFFD4;\">currency</th>\n    </tr>\n    <tr>\n      <th class=\"gt_col_heading gt_columns_bottom_border gt_left\" rowspan=\"1\" colspan=\"1\" style=\"background-color: #7FFFD4;\">date</th>\n      <th class=\"gt_col_heading gt_columns_bottom_border gt_left\" rowspan=\"1\" colspan=\"1\" style=\"background-color: #7FFFD4;\">time</th>\n      <th class=\"gt_col_heading gt_columns_bottom_border gt_left\" rowspan=\"1\" colspan=\"1\" style=\"background-color: #7FFFD4;\">datetime</th>\n    </tr>\n  </thead>\n  <tbody class=\"gt_table_body\">\n    <tr class=\"gt_group_heading_row\">\n      <td colspan=\"8\" class=\"gt_group_heading\" style=\"background-color: #E0FFFF;\">grp_a</td>\n    </tr>\n    <tr class=\"gt_row_group_first\"><td class=\"gt_row gt_right gt_stub\" style=\"background-color: #FFDAB9;\">row_1</td>\n<td class=\"gt_row gt_right\" style=\"background-color: #D9D9D9;\">1.111e-01</td>\n<td class=\"gt_row gt_left\" style=\"background-color: #CCCCCC;\">apricot</td>\n<td class=\"gt_row gt_center\" style=\"background-color: #BFBFBF;\">one</td>\n<td class=\"gt_row gt_left\" style=\"background-color: #B3B3B3;\">2015-01-15</td>\n<td class=\"gt_row gt_left\" style=\"background-color: #A6A6A6;\">13:35</td>\n<td class=\"gt_row gt_left\" style=\"background-color: #999999;\">2018-01-01 02:22</td>\n<td class=\"gt_row gt_right\" style=\"background-color: #8C8C8C;\">49.950</td></tr>\n    <tr><td class=\"gt_row gt_right gt_stub\" style=\"background-color: #FFDAB9;\">row_2</td>\n<td class=\"gt_row gt_right\" style=\"background-color: #D9D9D9;\">2.222e+00</td>\n<td class=\"gt_row gt_left\" style=\"background-color: #CCCCCC;\">banana</td>\n<td class=\"gt_row gt_center\" style=\"background-color: #BFBFBF;\">two</td>\n<td class=\"gt_row gt_left\" style=\"background-color: #B3B3B3;\">2015-02-15</td>\n<td class=\"gt_row gt_left\" style=\"background-color: #A6A6A6;\">14:40</td>\n<td class=\"gt_row gt_left\" style=\"background-color: #999999;\">2018-02-02 14:33</td>\n<td class=\"gt_row gt_right\" style=\"background-color: #8C8C8C;\">17.950</td></tr>\n    <tr><td class=\"gt_row gt_right gt_stub\" style=\"background-color: #FFDAB9;\">row_3</td>\n<td class=\"gt_row gt_right\" style=\"background-color: #D9D9D9;\">3.333e+01</td>\n<td class=\"gt_row gt_left\" style=\"background-color: #CCCCCC;\">coconut</td>\n<td class=\"gt_row gt_center\" style=\"background-color: #BFBFBF;\">three</td>\n<td class=\"gt_row gt_left\" style=\"background-color: #B3B3B3;\">2015-03-15</td>\n<td class=\"gt_row gt_left\" style=\"background-color: #A6A6A6;\">15:45</td>\n<td class=\"gt_row gt_left\" style=\"background-color: #999999;\">2018-03-03 03:44</td>\n<td class=\"gt_row gt_right\" style=\"background-color: #8C8C8C;\">1.390</td></tr>\n    <tr><td class=\"gt_row gt_right gt_stub\" style=\"background-color: #FFDAB9;\">row_4</td>\n<td class=\"gt_row gt_right\" style=\"background-color: #D9D9D9;\">4.444e+02</td>\n<td class=\"gt_row gt_left\" style=\"background-color: #CCCCCC;\">durian</td>\n<td class=\"gt_row gt_center\" style=\"background-color: #BFBFBF;\">four</td>\n<td class=\"gt_row gt_left\" style=\"background-color: #B3B3B3;\">2015-04-15</td>\n<td class=\"gt_row gt_left\" style=\"background-color: #A6A6A6;\">16:50</td>\n<td class=\"gt_row gt_left\" style=\"background-color: #999999;\">2018-04-04 15:55</td>\n<td class=\"gt_row gt_right\" style=\"background-color: #8C8C8C;\">65100.000</td></tr>\n    <tr class=\"gt_group_heading_row\">\n      <td colspan=\"8\" class=\"gt_group_heading\" style=\"background-color: #E0FFFF;\">grp_b</td>\n    </tr>\n    <tr class=\"gt_row_group_first\"><td class=\"gt_row gt_right gt_stub\" style=\"background-color: #FFDAB9;\">row_5</td>\n<td class=\"gt_row gt_right\" style=\"background-color: #D9D9D9;\">5.550e+03</td>\n<td class=\"gt_row gt_left\" style=\"background-color: #CCCCCC;\">NA</td>\n<td class=\"gt_row gt_center\" style=\"background-color: #BFBFBF;\">five</td>\n<td class=\"gt_row gt_left\" style=\"background-color: #B3B3B3;\">2015-05-15</td>\n<td class=\"gt_row gt_left\" style=\"background-color: #A6A6A6;\">17:55</td>\n<td class=\"gt_row gt_left\" style=\"background-color: #999999;\">2018-05-05 04:00</td>\n<td class=\"gt_row gt_right\" style=\"background-color: #8C8C8C;\">1325.810</td></tr>\n    <tr><td class=\"gt_row gt_right gt_stub\" style=\"background-color: #FFDAB9;\">row_6</td>\n<td class=\"gt_row gt_right\" style=\"background-color: #D9D9D9;\">NA</td>\n<td class=\"gt_row gt_left\" style=\"background-color: #CCCCCC;\">fig</td>\n<td class=\"gt_row gt_center\" style=\"background-color: #BFBFBF;\">six</td>\n<td class=\"gt_row gt_left\" style=\"background-color: #B3B3B3;\">2015-06-15</td>\n<td class=\"gt_row gt_left\" style=\"background-color: #A6A6A6;\">NA</td>\n<td class=\"gt_row gt_left\" style=\"background-color: #999999;\">2018-06-06 16:11</td>\n<td class=\"gt_row gt_right\" style=\"background-color: #8C8C8C;\">13.255</td></tr>\n    <tr><td class=\"gt_row gt_right gt_stub\" style=\"background-color: #FFDAB9;\">row_7</td>\n<td class=\"gt_row gt_right\" style=\"background-color: #D9D9D9;\">7.770e+05</td>\n<td class=\"gt_row gt_left\" style=\"background-color: #CCCCCC;\">grapefruit</td>\n<td class=\"gt_row gt_center\" style=\"background-color: #BFBFBF;\">seven</td>\n<td class=\"gt_row gt_left\" style=\"background-color: #B3B3B3;\">NA</td>\n<td class=\"gt_row gt_left\" style=\"background-color: #A6A6A6;\">19:10</td>\n<td class=\"gt_row gt_left\" style=\"background-color: #999999;\">2018-07-07 05:22</td>\n<td class=\"gt_row gt_right\" style=\"background-color: #8C8C8C;\">NA</td></tr>\n    <tr><td class=\"gt_row gt_right gt_stub\" style=\"background-color: #FFDAB9;\">row_8</td>\n<td class=\"gt_row gt_right\" style=\"background-color: #D9D9D9;\">8.880e+06</td>\n<td class=\"gt_row gt_left\" style=\"background-color: #CCCCCC;\">honeydew</td>\n<td class=\"gt_row gt_center\" style=\"background-color: #BFBFBF;\">eight</td>\n<td class=\"gt_row gt_left\" style=\"background-color: #B3B3B3;\">2015-08-15</td>\n<td class=\"gt_row gt_left\" style=\"background-color: #A6A6A6;\">20:20</td>\n<td class=\"gt_row gt_left\" style=\"background-color: #999999;\">NA</td>\n<td class=\"gt_row gt_right\" style=\"background-color: #8C8C8C;\">0.440</td></tr>\n  </tbody>\n  <tfoot class=\"gt_sourcenotes\">\n    <tr>\n      <td class=\"gt_sourcenote\" style=\"background-color: #F5DEB3;\" colspan=\"8\">Source note #1</td>\n    </tr>\n    <tr>\n      <td class=\"gt_sourcenote\" style=\"background-color: #F5DEB3;\" colspan=\"8\">Source note #2</td>\n    </tr>\n  </tfoot>\n  \n</table>"

---

    Code
      .
    Output
      [1] "<table class=\"gt_table\">\n  <thead class=\"gt_header\">\n    <tr>\n      <th colspan=\"9\" class=\"gt_heading gt_title gt_font_normal\" style=\"background-color: #ADD8E6;\">Data listing from <strong>exibble</strong></th>\n    </tr>\n    <tr>\n      <th colspan=\"9\" class=\"gt_heading gt_subtitle gt_font_normal gt_bottom_border\" style=\"background-color: #00FFFF;\"><code>exibble</code> is an R dataset</th>\n    </tr>\n  </thead>\n  <thead class=\"gt_col_headings\">\n    <tr>\n      <th class=\"gt_col_heading gt_columns_bottom_border gt_left\" rowspan=\"2\" colspan=\"2\" style=\"background-color: #DCDCDC;\">S.L.</th>\n      <th class=\"gt_col_heading gt_columns_bottom_border gt_right\" rowspan=\"2\" colspan=\"1\" style=\"background-color: #7FFFD4;\">num</th>\n      <th class=\"gt_col_heading gt_columns_bottom_border gt_left\" rowspan=\"2\" colspan=\"1\" style=\"background-color: #7FFFD4;\">char</th>\n      <th class=\"gt_col_heading gt_columns_bottom_border gt_center\" rowspan=\"2\" colspan=\"1\" style=\"background-color: #7FFFD4;\">fctr</th>\n      <th class=\"gt_center gt_columns_top_border gt_column_spanner_outer\" rowspan=\"1\" colspan=\"3\" style=\"background-color: #FFFF00;\">\n        <span class=\"gt_column_spanner\">timing</span>\n      </th>\n      <th class=\"gt_col_heading gt_columns_bottom_border gt_right\" rowspan=\"2\" colspan=\"1\" style=\"background-color: #7FFFD4;\">currency</th>\n    </tr>\n    <tr>\n      <th class=\"gt_col_heading gt_columns_bottom_border gt_left\" rowspan=\"1\" colspan=\"1\" style=\"background-color: #7FFFD4;\">date</th>\n      <th class=\"gt_col_heading gt_columns_bottom_border gt_left\" rowspan=\"1\" colspan=\"1\" style=\"background-color: #7FFFD4;\">time</th>\n      <th class=\"gt_col_heading gt_columns_bottom_border gt_left\" rowspan=\"1\" colspan=\"1\" style=\"background-color: #7FFFD4;\">datetime</th>\n    </tr>\n  </thead>\n  <tbody class=\"gt_table_body\">\n    <tr class=\"gt_row_group_first\"><td rowspan=\"4\" class=\"gt_row gt_right gt_stub_row_group\" style=\"background-color: #E0FFFF;\">grp_a</td>\n<td class=\"gt_row gt_right gt_stub\" style=\"background-color: #FFDAB9;\">row_1</td>\n<td class=\"gt_row gt_right\" style=\"background-color: #D9D9D9;\">1.111e-01</td>\n<td class=\"gt_row gt_left\" style=\"background-color: #CCCCCC;\">apricot</td>\n<td class=\"gt_row gt_center\" style=\"background-color: #BFBFBF;\">one</td>\n<td class=\"gt_row gt_left\" style=\"background-color: #B3B3B3;\">2015-01-15</td>\n<td class=\"gt_row gt_left\" style=\"background-color: #A6A6A6;\">13:35</td>\n<td class=\"gt_row gt_left\" style=\"background-color: #999999;\">2018-01-01 02:22</td>\n<td class=\"gt_row gt_right\" style=\"background-color: #8C8C8C;\">49.950</td></tr>\n    <tr><td class=\"gt_row gt_right gt_stub\" style=\"background-color: #FFDAB9;\">row_2</td>\n<td class=\"gt_row gt_right\" style=\"background-color: #D9D9D9;\">2.222e+00</td>\n<td class=\"gt_row gt_left\" style=\"background-color: #CCCCCC;\">banana</td>\n<td class=\"gt_row gt_center\" style=\"background-color: #BFBFBF;\">two</td>\n<td class=\"gt_row gt_left\" style=\"background-color: #B3B3B3;\">2015-02-15</td>\n<td class=\"gt_row gt_left\" style=\"background-color: #A6A6A6;\">14:40</td>\n<td class=\"gt_row gt_left\" style=\"background-color: #999999;\">2018-02-02 14:33</td>\n<td class=\"gt_row gt_right\" style=\"background-color: #8C8C8C;\">17.950</td></tr>\n    <tr><td class=\"gt_row gt_right gt_stub\" style=\"background-color: #FFDAB9;\">row_3</td>\n<td class=\"gt_row gt_right\" style=\"background-color: #D9D9D9;\">3.333e+01</td>\n<td class=\"gt_row gt_left\" style=\"background-color: #CCCCCC;\">coconut</td>\n<td class=\"gt_row gt_center\" style=\"background-color: #BFBFBF;\">three</td>\n<td class=\"gt_row gt_left\" style=\"background-color: #B3B3B3;\">2015-03-15</td>\n<td class=\"gt_row gt_left\" style=\"background-color: #A6A6A6;\">15:45</td>\n<td class=\"gt_row gt_left\" style=\"background-color: #999999;\">2018-03-03 03:44</td>\n<td class=\"gt_row gt_right\" style=\"background-color: #8C8C8C;\">1.390</td></tr>\n    <tr><td class=\"gt_row gt_right gt_stub\" style=\"background-color: #FFDAB9;\">row_4</td>\n<td class=\"gt_row gt_right\" style=\"background-color: #D9D9D9;\">4.444e+02</td>\n<td class=\"gt_row gt_left\" style=\"background-color: #CCCCCC;\">durian</td>\n<td class=\"gt_row gt_center\" style=\"background-color: #BFBFBF;\">four</td>\n<td class=\"gt_row gt_left\" style=\"background-color: #B3B3B3;\">2015-04-15</td>\n<td class=\"gt_row gt_left\" style=\"background-color: #A6A6A6;\">16:50</td>\n<td class=\"gt_row gt_left\" style=\"background-color: #999999;\">2018-04-04 15:55</td>\n<td class=\"gt_row gt_right\" style=\"background-color: #8C8C8C;\">65100.000</td></tr>\n    <tr class=\"gt_row_group_first\"><td rowspan=\"4\" class=\"gt_row gt_right gt_stub_row_group\" style=\"background-color: #E0FFFF;\">grp_b</td>\n<td class=\"gt_row gt_right gt_stub\" style=\"background-color: #FFDAB9;\">row_5</td>\n<td class=\"gt_row gt_right\" style=\"background-color: #D9D9D9;\">5.550e+03</td>\n<td class=\"gt_row gt_left\" style=\"background-color: #CCCCCC;\">NA</td>\n<td class=\"gt_row gt_center\" style=\"background-color: #BFBFBF;\">five</td>\n<td class=\"gt_row gt_left\" style=\"background-color: #B3B3B3;\">2015-05-15</td>\n<td class=\"gt_row gt_left\" style=\"background-color: #A6A6A6;\">17:55</td>\n<td class=\"gt_row gt_left\" style=\"background-color: #999999;\">2018-05-05 04:00</td>\n<td class=\"gt_row gt_right\" style=\"background-color: #8C8C8C;\">1325.810</td></tr>\n    <tr><td class=\"gt_row gt_right gt_stub\" style=\"background-color: #FFDAB9;\">row_6</td>\n<td class=\"gt_row gt_right\" style=\"background-color: #D9D9D9;\">NA</td>\n<td class=\"gt_row gt_left\" style=\"background-color: #CCCCCC;\">fig</td>\n<td class=\"gt_row gt_center\" style=\"background-color: #BFBFBF;\">six</td>\n<td class=\"gt_row gt_left\" style=\"background-color: #B3B3B3;\">2015-06-15</td>\n<td class=\"gt_row gt_left\" style=\"background-color: #A6A6A6;\">NA</td>\n<td class=\"gt_row gt_left\" style=\"background-color: #999999;\">2018-06-06 16:11</td>\n<td class=\"gt_row gt_right\" style=\"background-color: #8C8C8C;\">13.255</td></tr>\n    <tr><td class=\"gt_row gt_right gt_stub\" style=\"background-color: #FFDAB9;\">row_7</td>\n<td class=\"gt_row gt_right\" style=\"background-color: #D9D9D9;\">7.770e+05</td>\n<td class=\"gt_row gt_left\" style=\"background-color: #CCCCCC;\">grapefruit</td>\n<td class=\"gt_row gt_center\" style=\"background-color: #BFBFBF;\">seven</td>\n<td class=\"gt_row gt_left\" style=\"background-color: #B3B3B3;\">NA</td>\n<td class=\"gt_row gt_left\" style=\"background-color: #A6A6A6;\">19:10</td>\n<td class=\"gt_row gt_left\" style=\"background-color: #999999;\">2018-07-07 05:22</td>\n<td class=\"gt_row gt_right\" style=\"background-color: #8C8C8C;\">NA</td></tr>\n    <tr><td class=\"gt_row gt_right gt_stub\" style=\"background-color: #FFDAB9;\">row_8</td>\n<td class=\"gt_row gt_right\" style=\"background-color: #D9D9D9;\">8.880e+06</td>\n<td class=\"gt_row gt_left\" style=\"background-color: #CCCCCC;\">honeydew</td>\n<td class=\"gt_row gt_center\" style=\"background-color: #BFBFBF;\">eight</td>\n<td class=\"gt_row gt_left\" style=\"background-color: #B3B3B3;\">2015-08-15</td>\n<td class=\"gt_row gt_left\" style=\"background-color: #A6A6A6;\">20:20</td>\n<td class=\"gt_row gt_left\" style=\"background-color: #999999;\">NA</td>\n<td class=\"gt_row gt_right\" style=\"background-color: #8C8C8C;\">0.440</td></tr>\n  </tbody>\n  <tfoot class=\"gt_sourcenotes\">\n    <tr>\n      <td class=\"gt_sourcenote\" style=\"background-color: #F5DEB3;\" colspan=\"9\">Source note #1</td>\n    </tr>\n    <tr>\n      <td class=\"gt_sourcenote\" style=\"background-color: #F5DEB3;\" colspan=\"9\">Source note #2</td>\n    </tr>\n  </tfoot>\n  \n</table>"

---

    Code
      .
    Output
      [1] "<table class=\"gt_table\">\n  <thead class=\"gt_header\">\n    <tr>\n      <th colspan=\"10\" class=\"gt_heading gt_title gt_font_normal\" style=\"background-color: #ADD8E6;\">Data listing from <strong>exibble</strong></th>\n    </tr>\n    <tr>\n      <th colspan=\"10\" class=\"gt_heading gt_subtitle gt_font_normal gt_bottom_border\" style=\"background-color: #00FFFF;\"><code>exibble</code> is an R dataset</th>\n    </tr>\n  </thead>\n  <thead class=\"gt_col_headings\">\n    <tr>\n      <th class=\"gt_col_heading gt_columns_bottom_border gt_left\" rowspan=\"2\" colspan=\"1\" style=\"background-color: #DCDCDC;\">S.L.</th>\n      <th class=\"gt_col_heading gt_columns_bottom_border gt_right\" rowspan=\"2\" colspan=\"1\" style=\"background-color: #7FFFD4;\">num</th>\n      <th class=\"gt_col_heading gt_columns_bottom_border gt_left\" rowspan=\"2\" colspan=\"1\" style=\"background-color: #7FFFD4;\">char</th>\n      <th class=\"gt_col_heading gt_columns_bottom_border gt_center\" rowspan=\"2\" colspan=\"1\" style=\"background-color: #7FFFD4;\">fctr</th>\n      <th class=\"gt_center gt_columns_top_border gt_column_spanner_outer\" rowspan=\"1\" colspan=\"3\" style=\"background-color: #FFFF00;\">\n        <span class=\"gt_column_spanner\">timing</span>\n      </th>\n      <th class=\"gt_col_heading gt_columns_bottom_border gt_right\" rowspan=\"2\" colspan=\"1\" style=\"background-color: #7FFFD4;\">currency</th>\n      <th class=\"gt_col_heading gt_columns_bottom_border gt_left\" rowspan=\"2\" colspan=\"1\" style=\"background-color: #7FFFD4;\">row</th>\n      <th class=\"gt_col_heading gt_columns_bottom_border gt_left\" rowspan=\"2\" colspan=\"1\" style=\"background-color: #7FFFD4;\">group</th>\n    </tr>\n    <tr>\n      <th class=\"gt_col_heading gt_columns_bottom_border gt_left\" rowspan=\"1\" colspan=\"1\" style=\"background-color: #7FFFD4;\">date</th>\n      <th class=\"gt_col_heading gt_columns_bottom_border gt_left\" rowspan=\"1\" colspan=\"1\" style=\"background-color: #7FFFD4;\">time</th>\n      <th class=\"gt_col_heading gt_columns_bottom_border gt_left\" rowspan=\"1\" colspan=\"1\" style=\"background-color: #7FFFD4;\">datetime</th>\n    </tr>\n  </thead>\n  <tbody class=\"gt_table_body\">\n    <tr><td class=\"gt_row gt_right gt_stub\" style=\"background-color: #FFDAB9;\"></td>\n<td class=\"gt_row gt_right\" style=\"background-color: #D9D9D9;\">1.111e-01</td>\n<td class=\"gt_row gt_left\" style=\"background-color: #CCCCCC;\">apricot</td>\n<td class=\"gt_row gt_center\" style=\"background-color: #BFBFBF;\">one</td>\n<td class=\"gt_row gt_left\" style=\"background-color: #B3B3B3;\">2015-01-15</td>\n<td class=\"gt_row gt_left\" style=\"background-color: #A6A6A6;\">13:35</td>\n<td class=\"gt_row gt_left\" style=\"background-color: #999999;\">2018-01-01 02:22</td>\n<td class=\"gt_row gt_right\" style=\"background-color: #8C8C8C;\">49.950</td>\n<td class=\"gt_row gt_left\" style=\"background-color: #7F7F7F;\">row_1</td>\n<td class=\"gt_row gt_left\" style=\"background-color: #737373;\">grp_a</td></tr>\n    <tr><td class=\"gt_row gt_right gt_stub\" style=\"background-color: #FFDAB9;\"></td>\n<td class=\"gt_row gt_right\" style=\"background-color: #D9D9D9;\">2.222e+00</td>\n<td class=\"gt_row gt_left\" style=\"background-color: #CCCCCC;\">banana</td>\n<td class=\"gt_row gt_center\" style=\"background-color: #BFBFBF;\">two</td>\n<td class=\"gt_row gt_left\" style=\"background-color: #B3B3B3;\">2015-02-15</td>\n<td class=\"gt_row gt_left\" style=\"background-color: #A6A6A6;\">14:40</td>\n<td class=\"gt_row gt_left\" style=\"background-color: #999999;\">2018-02-02 14:33</td>\n<td class=\"gt_row gt_right\" style=\"background-color: #8C8C8C;\">17.950</td>\n<td class=\"gt_row gt_left\" style=\"background-color: #7F7F7F;\">row_2</td>\n<td class=\"gt_row gt_left\" style=\"background-color: #737373;\">grp_a</td></tr>\n    <tr><td class=\"gt_row gt_right gt_stub\" style=\"background-color: #FFDAB9;\"></td>\n<td class=\"gt_row gt_right\" style=\"background-color: #D9D9D9;\">3.333e+01</td>\n<td class=\"gt_row gt_left\" style=\"background-color: #CCCCCC;\">coconut</td>\n<td class=\"gt_row gt_center\" style=\"background-color: #BFBFBF;\">three</td>\n<td class=\"gt_row gt_left\" style=\"background-color: #B3B3B3;\">2015-03-15</td>\n<td class=\"gt_row gt_left\" style=\"background-color: #A6A6A6;\">15:45</td>\n<td class=\"gt_row gt_left\" style=\"background-color: #999999;\">2018-03-03 03:44</td>\n<td class=\"gt_row gt_right\" style=\"background-color: #8C8C8C;\">1.390</td>\n<td class=\"gt_row gt_left\" style=\"background-color: #7F7F7F;\">row_3</td>\n<td class=\"gt_row gt_left\" style=\"background-color: #737373;\">grp_a</td></tr>\n    <tr><td class=\"gt_row gt_right gt_stub\" style=\"background-color: #FFDAB9;\"></td>\n<td class=\"gt_row gt_right\" style=\"background-color: #D9D9D9;\">4.444e+02</td>\n<td class=\"gt_row gt_left\" style=\"background-color: #CCCCCC;\">durian</td>\n<td class=\"gt_row gt_center\" style=\"background-color: #BFBFBF;\">four</td>\n<td class=\"gt_row gt_left\" style=\"background-color: #B3B3B3;\">2015-04-15</td>\n<td class=\"gt_row gt_left\" style=\"background-color: #A6A6A6;\">16:50</td>\n<td class=\"gt_row gt_left\" style=\"background-color: #999999;\">2018-04-04 15:55</td>\n<td class=\"gt_row gt_right\" style=\"background-color: #8C8C8C;\">65100.000</td>\n<td class=\"gt_row gt_left\" style=\"background-color: #7F7F7F;\">row_4</td>\n<td class=\"gt_row gt_left\" style=\"background-color: #737373;\">grp_a</td></tr>\n    <tr><td class=\"gt_row gt_right gt_stub\" style=\"background-color: #FFDAB9;\"></td>\n<td class=\"gt_row gt_right\" style=\"background-color: #D9D9D9;\">5.550e+03</td>\n<td class=\"gt_row gt_left\" style=\"background-color: #CCCCCC;\">NA</td>\n<td class=\"gt_row gt_center\" style=\"background-color: #BFBFBF;\">five</td>\n<td class=\"gt_row gt_left\" style=\"background-color: #B3B3B3;\">2015-05-15</td>\n<td class=\"gt_row gt_left\" style=\"background-color: #A6A6A6;\">17:55</td>\n<td class=\"gt_row gt_left\" style=\"background-color: #999999;\">2018-05-05 04:00</td>\n<td class=\"gt_row gt_right\" style=\"background-color: #8C8C8C;\">1325.810</td>\n<td class=\"gt_row gt_left\" style=\"background-color: #7F7F7F;\">row_5</td>\n<td class=\"gt_row gt_left\" style=\"background-color: #737373;\">grp_b</td></tr>\n    <tr><td class=\"gt_row gt_right gt_stub\" style=\"background-color: #FFDAB9;\"></td>\n<td class=\"gt_row gt_right\" style=\"background-color: #D9D9D9;\">NA</td>\n<td class=\"gt_row gt_left\" style=\"background-color: #CCCCCC;\">fig</td>\n<td class=\"gt_row gt_center\" style=\"background-color: #BFBFBF;\">six</td>\n<td class=\"gt_row gt_left\" style=\"background-color: #B3B3B3;\">2015-06-15</td>\n<td class=\"gt_row gt_left\" style=\"background-color: #A6A6A6;\">NA</td>\n<td class=\"gt_row gt_left\" style=\"background-color: #999999;\">2018-06-06 16:11</td>\n<td class=\"gt_row gt_right\" style=\"background-color: #8C8C8C;\">13.255</td>\n<td class=\"gt_row gt_left\" style=\"background-color: #7F7F7F;\">row_6</td>\n<td class=\"gt_row gt_left\" style=\"background-color: #737373;\">grp_b</td></tr>\n    <tr><td class=\"gt_row gt_right gt_stub\" style=\"background-color: #FFDAB9;\"></td>\n<td class=\"gt_row gt_right\" style=\"background-color: #D9D9D9;\">7.770e+05</td>\n<td class=\"gt_row gt_left\" style=\"background-color: #CCCCCC;\">grapefruit</td>\n<td class=\"gt_row gt_center\" style=\"background-color: #BFBFBF;\">seven</td>\n<td class=\"gt_row gt_left\" style=\"background-color: #B3B3B3;\">NA</td>\n<td class=\"gt_row gt_left\" style=\"background-color: #A6A6A6;\">19:10</td>\n<td class=\"gt_row gt_left\" style=\"background-color: #999999;\">2018-07-07 05:22</td>\n<td class=\"gt_row gt_right\" style=\"background-color: #8C8C8C;\">NA</td>\n<td class=\"gt_row gt_left\" style=\"background-color: #7F7F7F;\">row_7</td>\n<td class=\"gt_row gt_left\" style=\"background-color: #737373;\">grp_b</td></tr>\n    <tr><td class=\"gt_row gt_right gt_stub\" style=\"background-color: #FFDAB9;\"></td>\n<td class=\"gt_row gt_right\" style=\"background-color: #D9D9D9;\">8.880e+06</td>\n<td class=\"gt_row gt_left\" style=\"background-color: #CCCCCC;\">honeydew</td>\n<td class=\"gt_row gt_center\" style=\"background-color: #BFBFBF;\">eight</td>\n<td class=\"gt_row gt_left\" style=\"background-color: #B3B3B3;\">2015-08-15</td>\n<td class=\"gt_row gt_left\" style=\"background-color: #A6A6A6;\">20:20</td>\n<td class=\"gt_row gt_left\" style=\"background-color: #999999;\">NA</td>\n<td class=\"gt_row gt_right\" style=\"background-color: #8C8C8C;\">0.440</td>\n<td class=\"gt_row gt_left\" style=\"background-color: #7F7F7F;\">row_8</td>\n<td class=\"gt_row gt_left\" style=\"background-color: #737373;\">grp_b</td></tr>\n    <tr><td class=\"gt_row gt_right gt_stub gt_grand_summary_row gt_first_grand_summary_row\" style=\"background-color: #FF0000;\">min</td>\n<td class=\"gt_row gt_right gt_grand_summary_row gt_first_grand_summary_row\" style=\"background-color: #D3D3D3;\">0.11</td>\n<td class=\"gt_row gt_left gt_grand_summary_row gt_first_grand_summary_row\">&mdash;</td>\n<td class=\"gt_row gt_center gt_grand_summary_row gt_first_grand_summary_row\">&mdash;</td>\n<td class=\"gt_row gt_left gt_grand_summary_row gt_first_grand_summary_row\">&mdash;</td>\n<td class=\"gt_row gt_left gt_grand_summary_row gt_first_grand_summary_row\">&mdash;</td>\n<td class=\"gt_row gt_left gt_grand_summary_row gt_first_grand_summary_row\">&mdash;</td>\n<td class=\"gt_row gt_right gt_grand_summary_row gt_first_grand_summary_row\" style=\"background-color: #D3D3D3;\">0.44</td>\n<td class=\"gt_row gt_left gt_grand_summary_row gt_first_grand_summary_row\">&mdash;</td>\n<td class=\"gt_row gt_left gt_grand_summary_row gt_first_grand_summary_row\">&mdash;</td></tr>\n    <tr><td class=\"gt_row gt_right gt_stub gt_grand_summary_row\" style=\"background-color: #FF0000;\">max</td>\n<td class=\"gt_row gt_right gt_grand_summary_row\" style=\"background-color: #D3D3D3;\">8880000.00</td>\n<td class=\"gt_row gt_left gt_grand_summary_row\">&mdash;</td>\n<td class=\"gt_row gt_center gt_grand_summary_row\">&mdash;</td>\n<td class=\"gt_row gt_left gt_grand_summary_row\">&mdash;</td>\n<td class=\"gt_row gt_left gt_grand_summary_row\">&mdash;</td>\n<td class=\"gt_row gt_left gt_grand_summary_row\">&mdash;</td>\n<td class=\"gt_row gt_right gt_grand_summary_row\" style=\"background-color: #D3D3D3;\">65100.00</td>\n<td class=\"gt_row gt_left gt_grand_summary_row\">&mdash;</td>\n<td class=\"gt_row gt_left gt_grand_summary_row\">&mdash;</td></tr>\n    <tr><td class=\"gt_row gt_right gt_stub gt_grand_summary_row gt_last_summary_row\" style=\"background-color: #FF0000;\">avg</td>\n<td class=\"gt_row gt_right gt_grand_summary_row gt_last_summary_row\" style=\"background-color: #D3D3D3;\">1380432.87</td>\n<td class=\"gt_row gt_left gt_grand_summary_row gt_last_summary_row\">&mdash;</td>\n<td class=\"gt_row gt_center gt_grand_summary_row gt_last_summary_row\">&mdash;</td>\n<td class=\"gt_row gt_left gt_grand_summary_row gt_last_summary_row\">&mdash;</td>\n<td class=\"gt_row gt_left gt_grand_summary_row gt_last_summary_row\">&mdash;</td>\n<td class=\"gt_row gt_left gt_grand_summary_row gt_last_summary_row\">&mdash;</td>\n<td class=\"gt_row gt_right gt_grand_summary_row gt_last_summary_row\" style=\"background-color: #D3D3D3;\">9501.26</td>\n<td class=\"gt_row gt_left gt_grand_summary_row gt_last_summary_row\">&mdash;</td>\n<td class=\"gt_row gt_left gt_grand_summary_row gt_last_summary_row\">&mdash;</td></tr>\n  </tbody>\n  <tfoot class=\"gt_sourcenotes\">\n    <tr>\n      <td class=\"gt_sourcenote\" style=\"background-color: #F5DEB3;\" colspan=\"10\">Source note #1</td>\n    </tr>\n    <tr>\n      <td class=\"gt_sourcenote\" style=\"background-color: #F5DEB3;\" colspan=\"10\">Source note #2</td>\n    </tr>\n  </tfoot>\n  \n</table>"

---

    Code
      .
    Output
      [1] "<table class=\"gt_table\">\n  <thead class=\"gt_header\">\n    <tr>\n      <th colspan=\"10\" class=\"gt_heading gt_title gt_font_normal\" style=\"background-color: #ADD8E6;\">Data listing from <strong>exibble</strong></th>\n    </tr>\n    <tr>\n      <th colspan=\"10\" class=\"gt_heading gt_subtitle gt_font_normal gt_bottom_border\" style=\"background-color: #00FFFF;\"><code>exibble</code> is an R dataset</th>\n    </tr>\n  </thead>\n  <thead class=\"gt_col_headings\">\n    <tr>\n      <th class=\"gt_col_heading gt_columns_bottom_border gt_left\" rowspan=\"2\" colspan=\"1\" style=\"background-color: #DCDCDC;\">S.L.</th>\n      <th class=\"gt_col_heading gt_columns_bottom_border gt_right\" rowspan=\"2\" colspan=\"1\" style=\"background-color: #7FFFD4;\">num</th>\n      <th class=\"gt_col_heading gt_columns_bottom_border gt_left\" rowspan=\"2\" colspan=\"1\" style=\"background-color: #7FFFD4;\">char</th>\n      <th class=\"gt_col_heading gt_columns_bottom_border gt_center\" rowspan=\"2\" colspan=\"1\" style=\"background-color: #7FFFD4;\">fctr</th>\n      <th class=\"gt_center gt_columns_top_border gt_column_spanner_outer\" rowspan=\"1\" colspan=\"3\" style=\"background-color: #FFFF00;\">\n        <span class=\"gt_column_spanner\">timing</span>\n      </th>\n      <th class=\"gt_col_heading gt_columns_bottom_border gt_right\" rowspan=\"2\" colspan=\"1\" style=\"background-color: #7FFFD4;\">currency</th>\n      <th class=\"gt_col_heading gt_columns_bottom_border gt_left\" rowspan=\"2\" colspan=\"1\" style=\"background-color: #7FFFD4;\">row</th>\n      <th class=\"gt_col_heading gt_columns_bottom_border gt_left\" rowspan=\"2\" colspan=\"1\" style=\"background-color: #7FFFD4;\">group</th>\n    </tr>\n    <tr>\n      <th class=\"gt_col_heading gt_columns_bottom_border gt_left\" rowspan=\"1\" colspan=\"1\" style=\"background-color: #7FFFD4;\">date</th>\n      <th class=\"gt_col_heading gt_columns_bottom_border gt_left\" rowspan=\"1\" colspan=\"1\" style=\"background-color: #7FFFD4;\">time</th>\n      <th class=\"gt_col_heading gt_columns_bottom_border gt_left\" rowspan=\"1\" colspan=\"1\" style=\"background-color: #7FFFD4;\">datetime</th>\n    </tr>\n  </thead>\n  <tbody class=\"gt_table_body\">\n    <tr><td class=\"gt_row gt_right gt_stub\" style=\"background-color: #FFDAB9;\"></td>\n<td class=\"gt_row gt_right\" style=\"background-color: #D9D9D9;\">1.111e-01</td>\n<td class=\"gt_row gt_left\" style=\"background-color: #CCCCCC;\">apricot</td>\n<td class=\"gt_row gt_center\" style=\"background-color: #BFBFBF;\">one</td>\n<td class=\"gt_row gt_left\" style=\"background-color: #B3B3B3;\">2015-01-15</td>\n<td class=\"gt_row gt_left\" style=\"background-color: #A6A6A6;\">13:35</td>\n<td class=\"gt_row gt_left\" style=\"background-color: #999999;\">2018-01-01 02:22</td>\n<td class=\"gt_row gt_right\" style=\"background-color: #8C8C8C;\">49.950</td>\n<td class=\"gt_row gt_left\" style=\"background-color: #7F7F7F;\">row_1</td>\n<td class=\"gt_row gt_left\" style=\"background-color: #737373;\">grp_a</td></tr>\n    <tr><td class=\"gt_row gt_right gt_stub\" style=\"background-color: #FFDAB9;\"></td>\n<td class=\"gt_row gt_right\" style=\"background-color: #D9D9D9;\">2.222e+00</td>\n<td class=\"gt_row gt_left\" style=\"background-color: #CCCCCC;\">banana</td>\n<td class=\"gt_row gt_center\" style=\"background-color: #BFBFBF;\">two</td>\n<td class=\"gt_row gt_left\" style=\"background-color: #B3B3B3;\">2015-02-15</td>\n<td class=\"gt_row gt_left\" style=\"background-color: #A6A6A6;\">14:40</td>\n<td class=\"gt_row gt_left\" style=\"background-color: #999999;\">2018-02-02 14:33</td>\n<td class=\"gt_row gt_right\" style=\"background-color: #8C8C8C;\">17.950</td>\n<td class=\"gt_row gt_left\" style=\"background-color: #7F7F7F;\">row_2</td>\n<td class=\"gt_row gt_left\" style=\"background-color: #737373;\">grp_a</td></tr>\n    <tr><td class=\"gt_row gt_right gt_stub\" style=\"background-color: #FFDAB9;\"></td>\n<td class=\"gt_row gt_right\" style=\"background-color: #D9D9D9;\">3.333e+01</td>\n<td class=\"gt_row gt_left\" style=\"background-color: #CCCCCC;\">coconut</td>\n<td class=\"gt_row gt_center\" style=\"background-color: #BFBFBF;\">three</td>\n<td class=\"gt_row gt_left\" style=\"background-color: #B3B3B3;\">2015-03-15</td>\n<td class=\"gt_row gt_left\" style=\"background-color: #A6A6A6;\">15:45</td>\n<td class=\"gt_row gt_left\" style=\"background-color: #999999;\">2018-03-03 03:44</td>\n<td class=\"gt_row gt_right\" style=\"background-color: #8C8C8C;\">1.390</td>\n<td class=\"gt_row gt_left\" style=\"background-color: #7F7F7F;\">row_3</td>\n<td class=\"gt_row gt_left\" style=\"background-color: #737373;\">grp_a</td></tr>\n    <tr><td class=\"gt_row gt_right gt_stub\" style=\"background-color: #FFDAB9;\"></td>\n<td class=\"gt_row gt_right\" style=\"background-color: #D9D9D9;\">4.444e+02</td>\n<td class=\"gt_row gt_left\" style=\"background-color: #CCCCCC;\">durian</td>\n<td class=\"gt_row gt_center\" style=\"background-color: #BFBFBF;\">four</td>\n<td class=\"gt_row gt_left\" style=\"background-color: #B3B3B3;\">2015-04-15</td>\n<td class=\"gt_row gt_left\" style=\"background-color: #A6A6A6;\">16:50</td>\n<td class=\"gt_row gt_left\" style=\"background-color: #999999;\">2018-04-04 15:55</td>\n<td class=\"gt_row gt_right\" style=\"background-color: #8C8C8C;\">65100.000</td>\n<td class=\"gt_row gt_left\" style=\"background-color: #7F7F7F;\">row_4</td>\n<td class=\"gt_row gt_left\" style=\"background-color: #737373;\">grp_a</td></tr>\n    <tr><td class=\"gt_row gt_right gt_stub\" style=\"background-color: #FFDAB9;\"></td>\n<td class=\"gt_row gt_right\" style=\"background-color: #D9D9D9;\">5.550e+03</td>\n<td class=\"gt_row gt_left\" style=\"background-color: #CCCCCC;\">NA</td>\n<td class=\"gt_row gt_center\" style=\"background-color: #BFBFBF;\">five</td>\n<td class=\"gt_row gt_left\" style=\"background-color: #B3B3B3;\">2015-05-15</td>\n<td class=\"gt_row gt_left\" style=\"background-color: #A6A6A6;\">17:55</td>\n<td class=\"gt_row gt_left\" style=\"background-color: #999999;\">2018-05-05 04:00</td>\n<td class=\"gt_row gt_right\" style=\"background-color: #8C8C8C;\">1325.810</td>\n<td class=\"gt_row gt_left\" style=\"background-color: #7F7F7F;\">row_5</td>\n<td class=\"gt_row gt_left\" style=\"background-color: #737373;\">grp_b</td></tr>\n    <tr><td class=\"gt_row gt_right gt_stub\" style=\"background-color: #FFDAB9;\"></td>\n<td class=\"gt_row gt_right\" style=\"background-color: #D9D9D9;\">NA</td>\n<td class=\"gt_row gt_left\" style=\"background-color: #CCCCCC;\">fig</td>\n<td class=\"gt_row gt_center\" style=\"background-color: #BFBFBF;\">six</td>\n<td class=\"gt_row gt_left\" style=\"background-color: #B3B3B3;\">2015-06-15</td>\n<td class=\"gt_row gt_left\" style=\"background-color: #A6A6A6;\">NA</td>\n<td class=\"gt_row gt_left\" style=\"background-color: #999999;\">2018-06-06 16:11</td>\n<td class=\"gt_row gt_right\" style=\"background-color: #8C8C8C;\">13.255</td>\n<td class=\"gt_row gt_left\" style=\"background-color: #7F7F7F;\">row_6</td>\n<td class=\"gt_row gt_left\" style=\"background-color: #737373;\">grp_b</td></tr>\n    <tr><td class=\"gt_row gt_right gt_stub\" style=\"background-color: #FFDAB9;\"></td>\n<td class=\"gt_row gt_right\" style=\"background-color: #D9D9D9;\">7.770e+05</td>\n<td class=\"gt_row gt_left\" style=\"background-color: #CCCCCC;\">grapefruit</td>\n<td class=\"gt_row gt_center\" style=\"background-color: #BFBFBF;\">seven</td>\n<td class=\"gt_row gt_left\" style=\"background-color: #B3B3B3;\">NA</td>\n<td class=\"gt_row gt_left\" style=\"background-color: #A6A6A6;\">19:10</td>\n<td class=\"gt_row gt_left\" style=\"background-color: #999999;\">2018-07-07 05:22</td>\n<td class=\"gt_row gt_right\" style=\"background-color: #8C8C8C;\">NA</td>\n<td class=\"gt_row gt_left\" style=\"background-color: #7F7F7F;\">row_7</td>\n<td class=\"gt_row gt_left\" style=\"background-color: #737373;\">grp_b</td></tr>\n    <tr><td class=\"gt_row gt_right gt_stub\" style=\"background-color: #FFDAB9;\"></td>\n<td class=\"gt_row gt_right\" style=\"background-color: #D9D9D9;\">8.880e+06</td>\n<td class=\"gt_row gt_left\" style=\"background-color: #CCCCCC;\">honeydew</td>\n<td class=\"gt_row gt_center\" style=\"background-color: #BFBFBF;\">eight</td>\n<td class=\"gt_row gt_left\" style=\"background-color: #B3B3B3;\">2015-08-15</td>\n<td class=\"gt_row gt_left\" style=\"background-color: #A6A6A6;\">20:20</td>\n<td class=\"gt_row gt_left\" style=\"background-color: #999999;\">NA</td>\n<td class=\"gt_row gt_right\" style=\"background-color: #8C8C8C;\">0.440</td>\n<td class=\"gt_row gt_left\" style=\"background-color: #7F7F7F;\">row_8</td>\n<td class=\"gt_row gt_left\" style=\"background-color: #737373;\">grp_b</td></tr>\n    <tr><td class=\"gt_row gt_right gt_stub gt_grand_summary_row gt_first_grand_summary_row\" style=\"background-color: #FF0000;\">min</td>\n<td class=\"gt_row gt_right gt_grand_summary_row gt_first_grand_summary_row\" style=\"background-color: #D3D3D3;\">0.11</td>\n<td class=\"gt_row gt_left gt_grand_summary_row gt_first_grand_summary_row\">&mdash;</td>\n<td class=\"gt_row gt_center gt_grand_summary_row gt_first_grand_summary_row\">&mdash;</td>\n<td class=\"gt_row gt_left gt_grand_summary_row gt_first_grand_summary_row\">&mdash;</td>\n<td class=\"gt_row gt_left gt_grand_summary_row gt_first_grand_summary_row\">&mdash;</td>\n<td class=\"gt_row gt_left gt_grand_summary_row gt_first_grand_summary_row\">&mdash;</td>\n<td class=\"gt_row gt_right gt_grand_summary_row gt_first_grand_summary_row\" style=\"background-color: #D3D3D3;\">0.44</td>\n<td class=\"gt_row gt_left gt_grand_summary_row gt_first_grand_summary_row\">&mdash;</td>\n<td class=\"gt_row gt_left gt_grand_summary_row gt_first_grand_summary_row\">&mdash;</td></tr>\n    <tr><td class=\"gt_row gt_right gt_stub gt_grand_summary_row\" style=\"background-color: #FF0000;\">max</td>\n<td class=\"gt_row gt_right gt_grand_summary_row\" style=\"background-color: #D3D3D3;\">8880000.00</td>\n<td class=\"gt_row gt_left gt_grand_summary_row\">&mdash;</td>\n<td class=\"gt_row gt_center gt_grand_summary_row\">&mdash;</td>\n<td class=\"gt_row gt_left gt_grand_summary_row\">&mdash;</td>\n<td class=\"gt_row gt_left gt_grand_summary_row\">&mdash;</td>\n<td class=\"gt_row gt_left gt_grand_summary_row\">&mdash;</td>\n<td class=\"gt_row gt_right gt_grand_summary_row\" style=\"background-color: #D3D3D3;\">65100.00</td>\n<td class=\"gt_row gt_left gt_grand_summary_row\">&mdash;</td>\n<td class=\"gt_row gt_left gt_grand_summary_row\">&mdash;</td></tr>\n    <tr><td class=\"gt_row gt_right gt_stub gt_grand_summary_row gt_last_summary_row\" style=\"background-color: #FF0000;\">avg</td>\n<td class=\"gt_row gt_right gt_grand_summary_row gt_last_summary_row\" style=\"background-color: #D3D3D3;\">1380432.87</td>\n<td class=\"gt_row gt_left gt_grand_summary_row gt_last_summary_row\">&mdash;</td>\n<td class=\"gt_row gt_center gt_grand_summary_row gt_last_summary_row\">&mdash;</td>\n<td class=\"gt_row gt_left gt_grand_summary_row gt_last_summary_row\">&mdash;</td>\n<td class=\"gt_row gt_left gt_grand_summary_row gt_last_summary_row\">&mdash;</td>\n<td class=\"gt_row gt_left gt_grand_summary_row gt_last_summary_row\">&mdash;</td>\n<td class=\"gt_row gt_right gt_grand_summary_row gt_last_summary_row\" style=\"background-color: #D3D3D3;\">9501.26</td>\n<td class=\"gt_row gt_left gt_grand_summary_row gt_last_summary_row\">&mdash;</td>\n<td class=\"gt_row gt_left gt_grand_summary_row gt_last_summary_row\">&mdash;</td></tr>\n  </tbody>\n  <tfoot class=\"gt_sourcenotes\">\n    <tr>\n      <td class=\"gt_sourcenote\" style=\"background-color: #F5DEB3;\" colspan=\"10\">Source note #1</td>\n    </tr>\n    <tr>\n      <td class=\"gt_sourcenote\" style=\"background-color: #F5DEB3;\" colspan=\"10\">Source note #2</td>\n    </tr>\n  </tfoot>\n  \n</table>"

---

    Code
      .
    Output
      [1] "<table class=\"gt_table\">\n  <thead class=\"gt_header\">\n    <tr>\n      <th colspan=\"9\" class=\"gt_heading gt_title gt_font_normal\" style=\"background-color: #ADD8E6;\">Data listing from <strong>exibble</strong></th>\n    </tr>\n    <tr>\n      <th colspan=\"9\" class=\"gt_heading gt_subtitle gt_font_normal gt_bottom_border\" style=\"background-color: #00FFFF;\"><code>exibble</code> is an R dataset</th>\n    </tr>\n  </thead>\n  <thead class=\"gt_col_headings\">\n    <tr>\n      <th class=\"gt_col_heading gt_columns_bottom_border gt_left\" rowspan=\"2\" colspan=\"1\" style=\"background-color: #DCDCDC;\">S.L.</th>\n      <th class=\"gt_col_heading gt_columns_bottom_border gt_right\" rowspan=\"2\" colspan=\"1\" style=\"background-color: #7FFFD4;\">num</th>\n      <th class=\"gt_col_heading gt_columns_bottom_border gt_left\" rowspan=\"2\" colspan=\"1\" style=\"background-color: #7FFFD4;\">char</th>\n      <th class=\"gt_col_heading gt_columns_bottom_border gt_center\" rowspan=\"2\" colspan=\"1\" style=\"background-color: #7FFFD4;\">fctr</th>\n      <th class=\"gt_center gt_columns_top_border gt_column_spanner_outer\" rowspan=\"1\" colspan=\"3\" style=\"background-color: #FFFF00;\">\n        <span class=\"gt_column_spanner\">timing</span>\n      </th>\n      <th class=\"gt_col_heading gt_columns_bottom_border gt_right\" rowspan=\"2\" colspan=\"1\" style=\"background-color: #7FFFD4;\">currency</th>\n      <th class=\"gt_col_heading gt_columns_bottom_border gt_left\" rowspan=\"2\" colspan=\"1\" style=\"background-color: #7FFFD4;\">row</th>\n    </tr>\n    <tr>\n      <th class=\"gt_col_heading gt_columns_bottom_border gt_left\" rowspan=\"1\" colspan=\"1\" style=\"background-color: #7FFFD4;\">date</th>\n      <th class=\"gt_col_heading gt_columns_bottom_border gt_left\" rowspan=\"1\" colspan=\"1\" style=\"background-color: #7FFFD4;\">time</th>\n      <th class=\"gt_col_heading gt_columns_bottom_border gt_left\" rowspan=\"1\" colspan=\"1\" style=\"background-color: #7FFFD4;\">datetime</th>\n    </tr>\n  </thead>\n  <tbody class=\"gt_table_body\">\n    <tr class=\"gt_group_heading_row\">\n      <td colspan=\"9\" class=\"gt_group_heading\" style=\"background-color: #E0FFFF;\">grp_a</td>\n    </tr>\n    <tr class=\"gt_row_group_first\"><td class=\"gt_row gt_right gt_stub\" style=\"background-color: #FFDAB9;\"></td>\n<td class=\"gt_row gt_right\" style=\"background-color: #D9D9D9;\">1.111e-01</td>\n<td class=\"gt_row gt_left\" style=\"background-color: #CCCCCC;\">apricot</td>\n<td class=\"gt_row gt_center\" style=\"background-color: #BFBFBF;\">one</td>\n<td class=\"gt_row gt_left\" style=\"background-color: #B3B3B3;\">2015-01-15</td>\n<td class=\"gt_row gt_left\" style=\"background-color: #A6A6A6;\">13:35</td>\n<td class=\"gt_row gt_left\" style=\"background-color: #999999;\">2018-01-01 02:22</td>\n<td class=\"gt_row gt_right\" style=\"background-color: #8C8C8C;\">49.950</td>\n<td class=\"gt_row gt_left\" style=\"background-color: #7F7F7F;\">row_1</td></tr>\n    <tr><td class=\"gt_row gt_right gt_stub\" style=\"background-color: #FFDAB9;\"></td>\n<td class=\"gt_row gt_right\" style=\"background-color: #D9D9D9;\">2.222e+00</td>\n<td class=\"gt_row gt_left\" style=\"background-color: #CCCCCC;\">banana</td>\n<td class=\"gt_row gt_center\" style=\"background-color: #BFBFBF;\">two</td>\n<td class=\"gt_row gt_left\" style=\"background-color: #B3B3B3;\">2015-02-15</td>\n<td class=\"gt_row gt_left\" style=\"background-color: #A6A6A6;\">14:40</td>\n<td class=\"gt_row gt_left\" style=\"background-color: #999999;\">2018-02-02 14:33</td>\n<td class=\"gt_row gt_right\" style=\"background-color: #8C8C8C;\">17.950</td>\n<td class=\"gt_row gt_left\" style=\"background-color: #7F7F7F;\">row_2</td></tr>\n    <tr><td class=\"gt_row gt_right gt_stub\" style=\"background-color: #FFDAB9;\"></td>\n<td class=\"gt_row gt_right\" style=\"background-color: #D9D9D9;\">3.333e+01</td>\n<td class=\"gt_row gt_left\" style=\"background-color: #CCCCCC;\">coconut</td>\n<td class=\"gt_row gt_center\" style=\"background-color: #BFBFBF;\">three</td>\n<td class=\"gt_row gt_left\" style=\"background-color: #B3B3B3;\">2015-03-15</td>\n<td class=\"gt_row gt_left\" style=\"background-color: #A6A6A6;\">15:45</td>\n<td class=\"gt_row gt_left\" style=\"background-color: #999999;\">2018-03-03 03:44</td>\n<td class=\"gt_row gt_right\" style=\"background-color: #8C8C8C;\">1.390</td>\n<td class=\"gt_row gt_left\" style=\"background-color: #7F7F7F;\">row_3</td></tr>\n    <tr><td class=\"gt_row gt_right gt_stub\" style=\"background-color: #FFDAB9;\"></td>\n<td class=\"gt_row gt_right\" style=\"background-color: #D9D9D9;\">4.444e+02</td>\n<td class=\"gt_row gt_left\" style=\"background-color: #CCCCCC;\">durian</td>\n<td class=\"gt_row gt_center\" style=\"background-color: #BFBFBF;\">four</td>\n<td class=\"gt_row gt_left\" style=\"background-color: #B3B3B3;\">2015-04-15</td>\n<td class=\"gt_row gt_left\" style=\"background-color: #A6A6A6;\">16:50</td>\n<td class=\"gt_row gt_left\" style=\"background-color: #999999;\">2018-04-04 15:55</td>\n<td class=\"gt_row gt_right\" style=\"background-color: #8C8C8C;\">65100.000</td>\n<td class=\"gt_row gt_left\" style=\"background-color: #7F7F7F;\">row_4</td></tr>\n    <tr><td class=\"gt_row gt_right gt_stub gt_summary_row gt_first_summary_row thick\" style=\"background-color: #FFA500;\">min</td>\n<td class=\"gt_row gt_right gt_summary_row gt_first_summary_row thick\" style=\"background-color: #8FBC8F;\">0.11</td>\n<td class=\"gt_row gt_left gt_summary_row gt_first_summary_row thick\">&mdash;</td>\n<td class=\"gt_row gt_center gt_summary_row gt_first_summary_row thick\">&mdash;</td>\n<td class=\"gt_row gt_left gt_summary_row gt_first_summary_row thick\">&mdash;</td>\n<td class=\"gt_row gt_left gt_summary_row gt_first_summary_row thick\">&mdash;</td>\n<td class=\"gt_row gt_left gt_summary_row gt_first_summary_row thick\">&mdash;</td>\n<td class=\"gt_row gt_right gt_summary_row gt_first_summary_row thick\" style=\"background-color: #8FBC8F;\">1.39</td>\n<td class=\"gt_row gt_left gt_summary_row gt_first_summary_row thick\">&mdash;</td></tr>\n    <tr><td class=\"gt_row gt_right gt_stub gt_summary_row\" style=\"background-color: #FFA500;\">max</td>\n<td class=\"gt_row gt_right gt_summary_row\" style=\"background-color: #8FBC8F;\">444.40</td>\n<td class=\"gt_row gt_left gt_summary_row\">&mdash;</td>\n<td class=\"gt_row gt_center gt_summary_row\">&mdash;</td>\n<td class=\"gt_row gt_left gt_summary_row\">&mdash;</td>\n<td class=\"gt_row gt_left gt_summary_row\">&mdash;</td>\n<td class=\"gt_row gt_left gt_summary_row\">&mdash;</td>\n<td class=\"gt_row gt_right gt_summary_row\" style=\"background-color: #8FBC8F;\">65100.00</td>\n<td class=\"gt_row gt_left gt_summary_row\">&mdash;</td></tr>\n    <tr><td class=\"gt_row gt_right gt_stub gt_summary_row gt_last_summary_row\" style=\"background-color: #FFA500;\">avg</td>\n<td class=\"gt_row gt_right gt_summary_row gt_last_summary_row\" style=\"background-color: #8FBC8F;\">120.02</td>\n<td class=\"gt_row gt_left gt_summary_row gt_last_summary_row\">&mdash;</td>\n<td class=\"gt_row gt_center gt_summary_row gt_last_summary_row\">&mdash;</td>\n<td class=\"gt_row gt_left gt_summary_row gt_last_summary_row\">&mdash;</td>\n<td class=\"gt_row gt_left gt_summary_row gt_last_summary_row\">&mdash;</td>\n<td class=\"gt_row gt_left gt_summary_row gt_last_summary_row\">&mdash;</td>\n<td class=\"gt_row gt_right gt_summary_row gt_last_summary_row\" style=\"background-color: #8FBC8F;\">16292.32</td>\n<td class=\"gt_row gt_left gt_summary_row gt_last_summary_row\">&mdash;</td></tr>\n    <tr class=\"gt_group_heading_row\">\n      <td colspan=\"9\" class=\"gt_group_heading\" style=\"background-color: #E0FFFF;\">grp_b</td>\n    </tr>\n    <tr class=\"gt_row_group_first\"><td class=\"gt_row gt_right gt_stub\" style=\"background-color: #FFDAB9;\"></td>\n<td class=\"gt_row gt_right\" style=\"background-color: #D9D9D9;\">5.550e+03</td>\n<td class=\"gt_row gt_left\" style=\"background-color: #CCCCCC;\">NA</td>\n<td class=\"gt_row gt_center\" style=\"background-color: #BFBFBF;\">five</td>\n<td class=\"gt_row gt_left\" style=\"background-color: #B3B3B3;\">2015-05-15</td>\n<td class=\"gt_row gt_left\" style=\"background-color: #A6A6A6;\">17:55</td>\n<td class=\"gt_row gt_left\" style=\"background-color: #999999;\">2018-05-05 04:00</td>\n<td class=\"gt_row gt_right\" style=\"background-color: #8C8C8C;\">1325.810</td>\n<td class=\"gt_row gt_left\" style=\"background-color: #7F7F7F;\">row_5</td></tr>\n    <tr><td class=\"gt_row gt_right gt_stub\" style=\"background-color: #FFDAB9;\"></td>\n<td class=\"gt_row gt_right\" style=\"background-color: #D9D9D9;\">NA</td>\n<td class=\"gt_row gt_left\" style=\"background-color: #CCCCCC;\">fig</td>\n<td class=\"gt_row gt_center\" style=\"background-color: #BFBFBF;\">six</td>\n<td class=\"gt_row gt_left\" style=\"background-color: #B3B3B3;\">2015-06-15</td>\n<td class=\"gt_row gt_left\" style=\"background-color: #A6A6A6;\">NA</td>\n<td class=\"gt_row gt_left\" style=\"background-color: #999999;\">2018-06-06 16:11</td>\n<td class=\"gt_row gt_right\" style=\"background-color: #8C8C8C;\">13.255</td>\n<td class=\"gt_row gt_left\" style=\"background-color: #7F7F7F;\">row_6</td></tr>\n    <tr><td class=\"gt_row gt_right gt_stub\" style=\"background-color: #FFDAB9;\"></td>\n<td class=\"gt_row gt_right\" style=\"background-color: #D9D9D9;\">7.770e+05</td>\n<td class=\"gt_row gt_left\" style=\"background-color: #CCCCCC;\">grapefruit</td>\n<td class=\"gt_row gt_center\" style=\"background-color: #BFBFBF;\">seven</td>\n<td class=\"gt_row gt_left\" style=\"background-color: #B3B3B3;\">NA</td>\n<td class=\"gt_row gt_left\" style=\"background-color: #A6A6A6;\">19:10</td>\n<td class=\"gt_row gt_left\" style=\"background-color: #999999;\">2018-07-07 05:22</td>\n<td class=\"gt_row gt_right\" style=\"background-color: #8C8C8C;\">NA</td>\n<td class=\"gt_row gt_left\" style=\"background-color: #7F7F7F;\">row_7</td></tr>\n    <tr><td class=\"gt_row gt_right gt_stub\" style=\"background-color: #FFDAB9;\"></td>\n<td class=\"gt_row gt_right\" style=\"background-color: #D9D9D9;\">8.880e+06</td>\n<td class=\"gt_row gt_left\" style=\"background-color: #CCCCCC;\">honeydew</td>\n<td class=\"gt_row gt_center\" style=\"background-color: #BFBFBF;\">eight</td>\n<td class=\"gt_row gt_left\" style=\"background-color: #B3B3B3;\">2015-08-15</td>\n<td class=\"gt_row gt_left\" style=\"background-color: #A6A6A6;\">20:20</td>\n<td class=\"gt_row gt_left\" style=\"background-color: #999999;\">NA</td>\n<td class=\"gt_row gt_right\" style=\"background-color: #8C8C8C;\">0.440</td>\n<td class=\"gt_row gt_left\" style=\"background-color: #7F7F7F;\">row_8</td></tr>\n    <tr><td class=\"gt_row gt_right gt_stub gt_summary_row gt_first_summary_row thick\" style=\"background-color: #FFA500;\">min</td>\n<td class=\"gt_row gt_right gt_summary_row gt_first_summary_row thick\" style=\"background-color: #8FBC8F;\">5550.00</td>\n<td class=\"gt_row gt_left gt_summary_row gt_first_summary_row thick\">&mdash;</td>\n<td class=\"gt_row gt_center gt_summary_row gt_first_summary_row thick\">&mdash;</td>\n<td class=\"gt_row gt_left gt_summary_row gt_first_summary_row thick\">&mdash;</td>\n<td class=\"gt_row gt_left gt_summary_row gt_first_summary_row thick\">&mdash;</td>\n<td class=\"gt_row gt_left gt_summary_row gt_first_summary_row thick\">&mdash;</td>\n<td class=\"gt_row gt_right gt_summary_row gt_first_summary_row thick\" style=\"background-color: #8FBC8F;\">0.44</td>\n<td class=\"gt_row gt_left gt_summary_row gt_first_summary_row thick\">&mdash;</td></tr>\n    <tr><td class=\"gt_row gt_right gt_stub gt_summary_row\" style=\"background-color: #FFA500;\">max</td>\n<td class=\"gt_row gt_right gt_summary_row\" style=\"background-color: #8FBC8F;\">8880000.00</td>\n<td class=\"gt_row gt_left gt_summary_row\">&mdash;</td>\n<td class=\"gt_row gt_center gt_summary_row\">&mdash;</td>\n<td class=\"gt_row gt_left gt_summary_row\">&mdash;</td>\n<td class=\"gt_row gt_left gt_summary_row\">&mdash;</td>\n<td class=\"gt_row gt_left gt_summary_row\">&mdash;</td>\n<td class=\"gt_row gt_right gt_summary_row\" style=\"background-color: #8FBC8F;\">1325.81</td>\n<td class=\"gt_row gt_left gt_summary_row\">&mdash;</td></tr>\n    <tr><td class=\"gt_row gt_right gt_stub gt_summary_row gt_last_summary_row\" style=\"background-color: #FFA500;\">avg</td>\n<td class=\"gt_row gt_right gt_summary_row gt_last_summary_row\" style=\"background-color: #8FBC8F;\">3220850.00</td>\n<td class=\"gt_row gt_left gt_summary_row gt_last_summary_row\">&mdash;</td>\n<td class=\"gt_row gt_center gt_summary_row gt_last_summary_row\">&mdash;</td>\n<td class=\"gt_row gt_left gt_summary_row gt_last_summary_row\">&mdash;</td>\n<td class=\"gt_row gt_left gt_summary_row gt_last_summary_row\">&mdash;</td>\n<td class=\"gt_row gt_left gt_summary_row gt_last_summary_row\">&mdash;</td>\n<td class=\"gt_row gt_right gt_summary_row gt_last_summary_row\" style=\"background-color: #8FBC8F;\">446.50</td>\n<td class=\"gt_row gt_left gt_summary_row gt_last_summary_row\">&mdash;</td></tr>\n    <tr><td class=\"gt_row gt_right gt_stub gt_grand_summary_row gt_first_grand_summary_row\" style=\"background-color: #FF0000;\">min</td>\n<td class=\"gt_row gt_right gt_grand_summary_row gt_first_grand_summary_row\" style=\"background-color: #D3D3D3;\">0.11</td>\n<td class=\"gt_row gt_left gt_grand_summary_row gt_first_grand_summary_row\">&mdash;</td>\n<td class=\"gt_row gt_center gt_grand_summary_row gt_first_grand_summary_row\">&mdash;</td>\n<td class=\"gt_row gt_left gt_grand_summary_row gt_first_grand_summary_row\">&mdash;</td>\n<td class=\"gt_row gt_left gt_grand_summary_row gt_first_grand_summary_row\">&mdash;</td>\n<td class=\"gt_row gt_left gt_grand_summary_row gt_first_grand_summary_row\">&mdash;</td>\n<td class=\"gt_row gt_right gt_grand_summary_row gt_first_grand_summary_row\" style=\"background-color: #D3D3D3;\">0.44</td>\n<td class=\"gt_row gt_left gt_grand_summary_row gt_first_grand_summary_row\">&mdash;</td></tr>\n    <tr><td class=\"gt_row gt_right gt_stub gt_grand_summary_row\" style=\"background-color: #FF0000;\">max</td>\n<td class=\"gt_row gt_right gt_grand_summary_row\" style=\"background-color: #D3D3D3;\">8880000.00</td>\n<td class=\"gt_row gt_left gt_grand_summary_row\">&mdash;</td>\n<td class=\"gt_row gt_center gt_grand_summary_row\">&mdash;</td>\n<td class=\"gt_row gt_left gt_grand_summary_row\">&mdash;</td>\n<td class=\"gt_row gt_left gt_grand_summary_row\">&mdash;</td>\n<td class=\"gt_row gt_left gt_grand_summary_row\">&mdash;</td>\n<td class=\"gt_row gt_right gt_grand_summary_row\" style=\"background-color: #D3D3D3;\">65100.00</td>\n<td class=\"gt_row gt_left gt_grand_summary_row\">&mdash;</td></tr>\n    <tr><td class=\"gt_row gt_right gt_stub gt_grand_summary_row gt_last_summary_row\" style=\"background-color: #FF0000;\">avg</td>\n<td class=\"gt_row gt_right gt_grand_summary_row gt_last_summary_row\" style=\"background-color: #D3D3D3;\">1380432.87</td>\n<td class=\"gt_row gt_left gt_grand_summary_row gt_last_summary_row\">&mdash;</td>\n<td class=\"gt_row gt_center gt_grand_summary_row gt_last_summary_row\">&mdash;</td>\n<td class=\"gt_row gt_left gt_grand_summary_row gt_last_summary_row\">&mdash;</td>\n<td class=\"gt_row gt_left gt_grand_summary_row gt_last_summary_row\">&mdash;</td>\n<td class=\"gt_row gt_left gt_grand_summary_row gt_last_summary_row\">&mdash;</td>\n<td class=\"gt_row gt_right gt_grand_summary_row gt_last_summary_row\" style=\"background-color: #D3D3D3;\">9501.26</td>\n<td class=\"gt_row gt_left gt_grand_summary_row gt_last_summary_row\">&mdash;</td></tr>\n  </tbody>\n  <tfoot class=\"gt_sourcenotes\">\n    <tr>\n      <td class=\"gt_sourcenote\" style=\"background-color: #F5DEB3;\" colspan=\"9\">Source note #1</td>\n    </tr>\n    <tr>\n      <td class=\"gt_sourcenote\" style=\"background-color: #F5DEB3;\" colspan=\"9\">Source note #2</td>\n    </tr>\n  </tfoot>\n  \n</table>"

---

    Code
      .
    Output
      [1] "<table class=\"gt_table\">\n  <thead class=\"gt_header\">\n    <tr>\n      <th colspan=\"9\" class=\"gt_heading gt_title gt_font_normal\" style=\"background-color: #ADD8E6;\">Data listing from <strong>exibble</strong></th>\n    </tr>\n    <tr>\n      <th colspan=\"9\" class=\"gt_heading gt_subtitle gt_font_normal gt_bottom_border\" style=\"background-color: #00FFFF;\"><code>exibble</code> is an R dataset</th>\n    </tr>\n  </thead>\n  <thead class=\"gt_col_headings\">\n    <tr>\n      <th class=\"gt_col_heading gt_columns_bottom_border gt_left\" rowspan=\"2\" colspan=\"1\" style=\"background-color: #DCDCDC;\">S.L.</th>\n      <th class=\"gt_col_heading gt_columns_bottom_border gt_right\" rowspan=\"2\" colspan=\"1\" style=\"background-color: #7FFFD4;\">num</th>\n      <th class=\"gt_col_heading gt_columns_bottom_border gt_left\" rowspan=\"2\" colspan=\"1\" style=\"background-color: #7FFFD4;\">char</th>\n      <th class=\"gt_col_heading gt_columns_bottom_border gt_center\" rowspan=\"2\" colspan=\"1\" style=\"background-color: #7FFFD4;\">fctr</th>\n      <th class=\"gt_center gt_columns_top_border gt_column_spanner_outer\" rowspan=\"1\" colspan=\"3\" style=\"background-color: #FFFF00;\">\n        <span class=\"gt_column_spanner\">timing</span>\n      </th>\n      <th class=\"gt_col_heading gt_columns_bottom_border gt_right\" rowspan=\"2\" colspan=\"1\" style=\"background-color: #7FFFD4;\">currency</th>\n      <th class=\"gt_col_heading gt_columns_bottom_border gt_left\" rowspan=\"2\" colspan=\"1\" style=\"background-color: #7FFFD4;\">row</th>\n    </tr>\n    <tr>\n      <th class=\"gt_col_heading gt_columns_bottom_border gt_left\" rowspan=\"1\" colspan=\"1\" style=\"background-color: #7FFFD4;\">date</th>\n      <th class=\"gt_col_heading gt_columns_bottom_border gt_left\" rowspan=\"1\" colspan=\"1\" style=\"background-color: #7FFFD4;\">time</th>\n      <th class=\"gt_col_heading gt_columns_bottom_border gt_left\" rowspan=\"1\" colspan=\"1\" style=\"background-color: #7FFFD4;\">datetime</th>\n    </tr>\n  </thead>\n  <tbody class=\"gt_table_body\">\n    <tr class=\"gt_row_group_first\"><td rowspan=\"4\" class=\"gt_row gt_right gt_stub_row_group\" style=\"background-color: #E0FFFF;\">grp_a</td>\n<td class=\"gt_row gt_right\" style=\"background-color: #D9D9D9;\">1.111e-01</td>\n<td class=\"gt_row gt_left\" style=\"background-color: #CCCCCC;\">apricot</td>\n<td class=\"gt_row gt_center\" style=\"background-color: #BFBFBF;\">one</td>\n<td class=\"gt_row gt_left\" style=\"background-color: #B3B3B3;\">2015-01-15</td>\n<td class=\"gt_row gt_left\" style=\"background-color: #A6A6A6;\">13:35</td>\n<td class=\"gt_row gt_left\" style=\"background-color: #999999;\">2018-01-01 02:22</td>\n<td class=\"gt_row gt_right\" style=\"background-color: #8C8C8C;\">49.950</td>\n<td class=\"gt_row gt_left\" style=\"background-color: #7F7F7F;\">row_1</td></tr>\n    <tr><td class=\"gt_row gt_right\" style=\"background-color: #D9D9D9;\">2.222e+00</td>\n<td class=\"gt_row gt_left\" style=\"background-color: #CCCCCC;\">banana</td>\n<td class=\"gt_row gt_center\" style=\"background-color: #BFBFBF;\">two</td>\n<td class=\"gt_row gt_left\" style=\"background-color: #B3B3B3;\">2015-02-15</td>\n<td class=\"gt_row gt_left\" style=\"background-color: #A6A6A6;\">14:40</td>\n<td class=\"gt_row gt_left\" style=\"background-color: #999999;\">2018-02-02 14:33</td>\n<td class=\"gt_row gt_right\" style=\"background-color: #8C8C8C;\">17.950</td>\n<td class=\"gt_row gt_left\" style=\"background-color: #7F7F7F;\">row_2</td></tr>\n    <tr><td class=\"gt_row gt_right\" style=\"background-color: #D9D9D9;\">3.333e+01</td>\n<td class=\"gt_row gt_left\" style=\"background-color: #CCCCCC;\">coconut</td>\n<td class=\"gt_row gt_center\" style=\"background-color: #BFBFBF;\">three</td>\n<td class=\"gt_row gt_left\" style=\"background-color: #B3B3B3;\">2015-03-15</td>\n<td class=\"gt_row gt_left\" style=\"background-color: #A6A6A6;\">15:45</td>\n<td class=\"gt_row gt_left\" style=\"background-color: #999999;\">2018-03-03 03:44</td>\n<td class=\"gt_row gt_right\" style=\"background-color: #8C8C8C;\">1.390</td>\n<td class=\"gt_row gt_left\" style=\"background-color: #7F7F7F;\">row_3</td></tr>\n    <tr><td class=\"gt_row gt_right\" style=\"background-color: #D9D9D9;\">4.444e+02</td>\n<td class=\"gt_row gt_left\" style=\"background-color: #CCCCCC;\">durian</td>\n<td class=\"gt_row gt_center\" style=\"background-color: #BFBFBF;\">four</td>\n<td class=\"gt_row gt_left\" style=\"background-color: #B3B3B3;\">2015-04-15</td>\n<td class=\"gt_row gt_left\" style=\"background-color: #A6A6A6;\">16:50</td>\n<td class=\"gt_row gt_left\" style=\"background-color: #999999;\">2018-04-04 15:55</td>\n<td class=\"gt_row gt_right\" style=\"background-color: #8C8C8C;\">65100.000</td>\n<td class=\"gt_row gt_left\" style=\"background-color: #7F7F7F;\">row_4</td></tr>\n    <tr><td class=\"gt_row gt_right gt_stub gt_summary_row gt_first_summary_row\" style=\"background-color: #FFA500;\">min</td>\n<td class=\"gt_row gt_right gt_summary_row gt_first_summary_row\" style=\"background-color: #8FBC8F;\">0.11</td>\n<td class=\"gt_row gt_left gt_summary_row gt_first_summary_row\">&mdash;</td>\n<td class=\"gt_row gt_center gt_summary_row gt_first_summary_row\">&mdash;</td>\n<td class=\"gt_row gt_left gt_summary_row gt_first_summary_row\">&mdash;</td>\n<td class=\"gt_row gt_left gt_summary_row gt_first_summary_row\">&mdash;</td>\n<td class=\"gt_row gt_left gt_summary_row gt_first_summary_row\">&mdash;</td>\n<td class=\"gt_row gt_right gt_summary_row gt_first_summary_row\" style=\"background-color: #8FBC8F;\">1.39</td>\n<td class=\"gt_row gt_left gt_summary_row gt_first_summary_row\">&mdash;</td></tr>\n    <tr><td class=\"gt_row gt_right gt_stub gt_summary_row\" style=\"background-color: #FFA500;\">max</td>\n<td class=\"gt_row gt_right gt_summary_row\" style=\"background-color: #8FBC8F;\">444.40</td>\n<td class=\"gt_row gt_left gt_summary_row\">&mdash;</td>\n<td class=\"gt_row gt_center gt_summary_row\">&mdash;</td>\n<td class=\"gt_row gt_left gt_summary_row\">&mdash;</td>\n<td class=\"gt_row gt_left gt_summary_row\">&mdash;</td>\n<td class=\"gt_row gt_left gt_summary_row\">&mdash;</td>\n<td class=\"gt_row gt_right gt_summary_row\" style=\"background-color: #8FBC8F;\">65100.00</td>\n<td class=\"gt_row gt_left gt_summary_row\">&mdash;</td></tr>\n    <tr><td class=\"gt_row gt_right gt_stub gt_summary_row gt_last_summary_row\" style=\"background-color: #FFA500;\">avg</td>\n<td class=\"gt_row gt_right gt_summary_row gt_last_summary_row\" style=\"background-color: #8FBC8F;\">120.02</td>\n<td class=\"gt_row gt_left gt_summary_row gt_last_summary_row\">&mdash;</td>\n<td class=\"gt_row gt_center gt_summary_row gt_last_summary_row\">&mdash;</td>\n<td class=\"gt_row gt_left gt_summary_row gt_last_summary_row\">&mdash;</td>\n<td class=\"gt_row gt_left gt_summary_row gt_last_summary_row\">&mdash;</td>\n<td class=\"gt_row gt_left gt_summary_row gt_last_summary_row\">&mdash;</td>\n<td class=\"gt_row gt_right gt_summary_row gt_last_summary_row\" style=\"background-color: #8FBC8F;\">16292.32</td>\n<td class=\"gt_row gt_left gt_summary_row gt_last_summary_row\">&mdash;</td></tr>\n    <tr class=\"gt_row_group_first\"><td rowspan=\"4\" class=\"gt_row gt_right gt_stub_row_group\" style=\"background-color: #E0FFFF;\">grp_b</td>\n<td class=\"gt_row gt_right\" style=\"background-color: #D9D9D9;\">5.550e+03</td>\n<td class=\"gt_row gt_left\" style=\"background-color: #CCCCCC;\">NA</td>\n<td class=\"gt_row gt_center\" style=\"background-color: #BFBFBF;\">five</td>\n<td class=\"gt_row gt_left\" style=\"background-color: #B3B3B3;\">2015-05-15</td>\n<td class=\"gt_row gt_left\" style=\"background-color: #A6A6A6;\">17:55</td>\n<td class=\"gt_row gt_left\" style=\"background-color: #999999;\">2018-05-05 04:00</td>\n<td class=\"gt_row gt_right\" style=\"background-color: #8C8C8C;\">1325.810</td>\n<td class=\"gt_row gt_left\" style=\"background-color: #7F7F7F;\">row_5</td></tr>\n    <tr><td class=\"gt_row gt_right\" style=\"background-color: #D9D9D9;\">NA</td>\n<td class=\"gt_row gt_left\" style=\"background-color: #CCCCCC;\">fig</td>\n<td class=\"gt_row gt_center\" style=\"background-color: #BFBFBF;\">six</td>\n<td class=\"gt_row gt_left\" style=\"background-color: #B3B3B3;\">2015-06-15</td>\n<td class=\"gt_row gt_left\" style=\"background-color: #A6A6A6;\">NA</td>\n<td class=\"gt_row gt_left\" style=\"background-color: #999999;\">2018-06-06 16:11</td>\n<td class=\"gt_row gt_right\" style=\"background-color: #8C8C8C;\">13.255</td>\n<td class=\"gt_row gt_left\" style=\"background-color: #7F7F7F;\">row_6</td></tr>\n    <tr><td class=\"gt_row gt_right\" style=\"background-color: #D9D9D9;\">7.770e+05</td>\n<td class=\"gt_row gt_left\" style=\"background-color: #CCCCCC;\">grapefruit</td>\n<td class=\"gt_row gt_center\" style=\"background-color: #BFBFBF;\">seven</td>\n<td class=\"gt_row gt_left\" style=\"background-color: #B3B3B3;\">NA</td>\n<td class=\"gt_row gt_left\" style=\"background-color: #A6A6A6;\">19:10</td>\n<td class=\"gt_row gt_left\" style=\"background-color: #999999;\">2018-07-07 05:22</td>\n<td class=\"gt_row gt_right\" style=\"background-color: #8C8C8C;\">NA</td>\n<td class=\"gt_row gt_left\" style=\"background-color: #7F7F7F;\">row_7</td></tr>\n    <tr><td class=\"gt_row gt_right\" style=\"background-color: #D9D9D9;\">8.880e+06</td>\n<td class=\"gt_row gt_left\" style=\"background-color: #CCCCCC;\">honeydew</td>\n<td class=\"gt_row gt_center\" style=\"background-color: #BFBFBF;\">eight</td>\n<td class=\"gt_row gt_left\" style=\"background-color: #B3B3B3;\">2015-08-15</td>\n<td class=\"gt_row gt_left\" style=\"background-color: #A6A6A6;\">20:20</td>\n<td class=\"gt_row gt_left\" style=\"background-color: #999999;\">NA</td>\n<td class=\"gt_row gt_right\" style=\"background-color: #8C8C8C;\">0.440</td>\n<td class=\"gt_row gt_left\" style=\"background-color: #7F7F7F;\">row_8</td></tr>\n    <tr><td class=\"gt_row gt_right gt_stub gt_summary_row gt_first_summary_row\" style=\"background-color: #FFA500;\">min</td>\n<td class=\"gt_row gt_right gt_summary_row gt_first_summary_row\" style=\"background-color: #8FBC8F;\">5550.00</td>\n<td class=\"gt_row gt_left gt_summary_row gt_first_summary_row\">&mdash;</td>\n<td class=\"gt_row gt_center gt_summary_row gt_first_summary_row\">&mdash;</td>\n<td class=\"gt_row gt_left gt_summary_row gt_first_summary_row\">&mdash;</td>\n<td class=\"gt_row gt_left gt_summary_row gt_first_summary_row\">&mdash;</td>\n<td class=\"gt_row gt_left gt_summary_row gt_first_summary_row\">&mdash;</td>\n<td class=\"gt_row gt_right gt_summary_row gt_first_summary_row\" style=\"background-color: #8FBC8F;\">0.44</td>\n<td class=\"gt_row gt_left gt_summary_row gt_first_summary_row\">&mdash;</td></tr>\n    <tr><td class=\"gt_row gt_right gt_stub gt_summary_row\" style=\"background-color: #FFA500;\">max</td>\n<td class=\"gt_row gt_right gt_summary_row\" style=\"background-color: #8FBC8F;\">8880000.00</td>\n<td class=\"gt_row gt_left gt_summary_row\">&mdash;</td>\n<td class=\"gt_row gt_center gt_summary_row\">&mdash;</td>\n<td class=\"gt_row gt_left gt_summary_row\">&mdash;</td>\n<td class=\"gt_row gt_left gt_summary_row\">&mdash;</td>\n<td class=\"gt_row gt_left gt_summary_row\">&mdash;</td>\n<td class=\"gt_row gt_right gt_summary_row\" style=\"background-color: #8FBC8F;\">1325.81</td>\n<td class=\"gt_row gt_left gt_summary_row\">&mdash;</td></tr>\n    <tr><td class=\"gt_row gt_right gt_stub gt_summary_row gt_last_summary_row\" style=\"background-color: #FFA500;\">avg</td>\n<td class=\"gt_row gt_right gt_summary_row gt_last_summary_row\" style=\"background-color: #8FBC8F;\">3220850.00</td>\n<td class=\"gt_row gt_left gt_summary_row gt_last_summary_row\">&mdash;</td>\n<td class=\"gt_row gt_center gt_summary_row gt_last_summary_row\">&mdash;</td>\n<td class=\"gt_row gt_left gt_summary_row gt_last_summary_row\">&mdash;</td>\n<td class=\"gt_row gt_left gt_summary_row gt_last_summary_row\">&mdash;</td>\n<td class=\"gt_row gt_left gt_summary_row gt_last_summary_row\">&mdash;</td>\n<td class=\"gt_row gt_right gt_summary_row gt_last_summary_row\" style=\"background-color: #8FBC8F;\">446.50</td>\n<td class=\"gt_row gt_left gt_summary_row gt_last_summary_row\">&mdash;</td></tr>\n    <tr><td class=\"gt_row gt_right gt_stub gt_grand_summary_row gt_first_grand_summary_row\" style=\"background-color: #FF0000;\">min</td>\n<td class=\"gt_row gt_right gt_grand_summary_row gt_first_grand_summary_row\" style=\"background-color: #D3D3D3;\">0.11</td>\n<td class=\"gt_row gt_left gt_grand_summary_row gt_first_grand_summary_row\">&mdash;</td>\n<td class=\"gt_row gt_center gt_grand_summary_row gt_first_grand_summary_row\">&mdash;</td>\n<td class=\"gt_row gt_left gt_grand_summary_row gt_first_grand_summary_row\">&mdash;</td>\n<td class=\"gt_row gt_left gt_grand_summary_row gt_first_grand_summary_row\">&mdash;</td>\n<td class=\"gt_row gt_left gt_grand_summary_row gt_first_grand_summary_row\">&mdash;</td>\n<td class=\"gt_row gt_right gt_grand_summary_row gt_first_grand_summary_row\" style=\"background-color: #D3D3D3;\">0.44</td>\n<td class=\"gt_row gt_left gt_grand_summary_row gt_first_grand_summary_row\">&mdash;</td></tr>\n    <tr><td class=\"gt_row gt_right gt_stub gt_grand_summary_row\" style=\"background-color: #FF0000;\">max</td>\n<td class=\"gt_row gt_right gt_grand_summary_row\" style=\"background-color: #D3D3D3;\">8880000.00</td>\n<td class=\"gt_row gt_left gt_grand_summary_row\">&mdash;</td>\n<td class=\"gt_row gt_center gt_grand_summary_row\">&mdash;</td>\n<td class=\"gt_row gt_left gt_grand_summary_row\">&mdash;</td>\n<td class=\"gt_row gt_left gt_grand_summary_row\">&mdash;</td>\n<td class=\"gt_row gt_left gt_grand_summary_row\">&mdash;</td>\n<td class=\"gt_row gt_right gt_grand_summary_row\" style=\"background-color: #D3D3D3;\">65100.00</td>\n<td class=\"gt_row gt_left gt_grand_summary_row\">&mdash;</td></tr>\n    <tr><td class=\"gt_row gt_right gt_stub gt_grand_summary_row gt_last_summary_row\" style=\"background-color: #FF0000;\">avg</td>\n<td class=\"gt_row gt_right gt_grand_summary_row gt_last_summary_row\" style=\"background-color: #D3D3D3;\">1380432.87</td>\n<td class=\"gt_row gt_left gt_grand_summary_row gt_last_summary_row\">&mdash;</td>\n<td class=\"gt_row gt_center gt_grand_summary_row gt_last_summary_row\">&mdash;</td>\n<td class=\"gt_row gt_left gt_grand_summary_row gt_last_summary_row\">&mdash;</td>\n<td class=\"gt_row gt_left gt_grand_summary_row gt_last_summary_row\">&mdash;</td>\n<td class=\"gt_row gt_left gt_grand_summary_row gt_last_summary_row\">&mdash;</td>\n<td class=\"gt_row gt_right gt_grand_summary_row gt_last_summary_row\" style=\"background-color: #D3D3D3;\">9501.26</td>\n<td class=\"gt_row gt_left gt_grand_summary_row gt_last_summary_row\">&mdash;</td></tr>\n  </tbody>\n  <tfoot class=\"gt_sourcenotes\">\n    <tr>\n      <td class=\"gt_sourcenote\" style=\"background-color: #F5DEB3;\" colspan=\"9\">Source note #1</td>\n    </tr>\n    <tr>\n      <td class=\"gt_sourcenote\" style=\"background-color: #F5DEB3;\" colspan=\"9\">Source note #2</td>\n    </tr>\n  </tfoot>\n  \n</table>"

---

    Code
      .
    Output
      [1] "<table class=\"gt_table\">\n  <thead class=\"gt_header\">\n    <tr>\n      <th colspan=\"9\" class=\"gt_heading gt_title gt_font_normal\" style=\"background-color: #ADD8E6;\">Data listing from <strong>exibble</strong></th>\n    </tr>\n    <tr>\n      <th colspan=\"9\" class=\"gt_heading gt_subtitle gt_font_normal gt_bottom_border\" style=\"background-color: #00FFFF;\"><code>exibble</code> is an R dataset</th>\n    </tr>\n  </thead>\n  <thead class=\"gt_col_headings\">\n    <tr>\n      <th class=\"gt_col_heading gt_columns_bottom_border gt_left\" rowspan=\"2\" colspan=\"1\" style=\"background-color: #DCDCDC;\">S.L.</th>\n      <th class=\"gt_col_heading gt_columns_bottom_border gt_right\" rowspan=\"2\" colspan=\"1\" style=\"background-color: #7FFFD4;\">num</th>\n      <th class=\"gt_col_heading gt_columns_bottom_border gt_left\" rowspan=\"2\" colspan=\"1\" style=\"background-color: #7FFFD4;\">char</th>\n      <th class=\"gt_col_heading gt_columns_bottom_border gt_center\" rowspan=\"2\" colspan=\"1\" style=\"background-color: #7FFFD4;\">fctr</th>\n      <th class=\"gt_center gt_columns_top_border gt_column_spanner_outer\" rowspan=\"1\" colspan=\"3\" style=\"background-color: #FFFF00;\">\n        <span class=\"gt_column_spanner\">timing</span>\n      </th>\n      <th class=\"gt_col_heading gt_columns_bottom_border gt_right\" rowspan=\"2\" colspan=\"1\" style=\"background-color: #7FFFD4;\">currency</th>\n      <th class=\"gt_col_heading gt_columns_bottom_border gt_left\" rowspan=\"2\" colspan=\"1\" style=\"background-color: #7FFFD4;\">group</th>\n    </tr>\n    <tr>\n      <th class=\"gt_col_heading gt_columns_bottom_border gt_left\" rowspan=\"1\" colspan=\"1\" style=\"background-color: #7FFFD4;\">date</th>\n      <th class=\"gt_col_heading gt_columns_bottom_border gt_left\" rowspan=\"1\" colspan=\"1\" style=\"background-color: #7FFFD4;\">time</th>\n      <th class=\"gt_col_heading gt_columns_bottom_border gt_left\" rowspan=\"1\" colspan=\"1\" style=\"background-color: #7FFFD4;\">datetime</th>\n    </tr>\n  </thead>\n  <tbody class=\"gt_table_body\">\n    <tr><td class=\"gt_row gt_right gt_stub\" style=\"background-color: #FFDAB9;\">row_1</td>\n<td class=\"gt_row gt_right\" style=\"background-color: #D9D9D9;\">1.111e-01</td>\n<td class=\"gt_row gt_left\" style=\"background-color: #CCCCCC;\">apricot</td>\n<td class=\"gt_row gt_center\" style=\"background-color: #BFBFBF;\">one</td>\n<td class=\"gt_row gt_left\" style=\"background-color: #B3B3B3;\">2015-01-15</td>\n<td class=\"gt_row gt_left\" style=\"background-color: #A6A6A6;\">13:35</td>\n<td class=\"gt_row gt_left\" style=\"background-color: #999999;\">2018-01-01 02:22</td>\n<td class=\"gt_row gt_right\" style=\"background-color: #8C8C8C;\">49.950</td>\n<td class=\"gt_row gt_left\" style=\"background-color: #737373;\">grp_a</td></tr>\n    <tr><td class=\"gt_row gt_right gt_stub\" style=\"background-color: #FFDAB9;\">row_2</td>\n<td class=\"gt_row gt_right\" style=\"background-color: #D9D9D9;\">2.222e+00</td>\n<td class=\"gt_row gt_left\" style=\"background-color: #CCCCCC;\">banana</td>\n<td class=\"gt_row gt_center\" style=\"background-color: #BFBFBF;\">two</td>\n<td class=\"gt_row gt_left\" style=\"background-color: #B3B3B3;\">2015-02-15</td>\n<td class=\"gt_row gt_left\" style=\"background-color: #A6A6A6;\">14:40</td>\n<td class=\"gt_row gt_left\" style=\"background-color: #999999;\">2018-02-02 14:33</td>\n<td class=\"gt_row gt_right\" style=\"background-color: #8C8C8C;\">17.950</td>\n<td class=\"gt_row gt_left\" style=\"background-color: #737373;\">grp_a</td></tr>\n    <tr><td class=\"gt_row gt_right gt_stub\" style=\"background-color: #FFDAB9;\">row_3</td>\n<td class=\"gt_row gt_right\" style=\"background-color: #D9D9D9;\">3.333e+01</td>\n<td class=\"gt_row gt_left\" style=\"background-color: #CCCCCC;\">coconut</td>\n<td class=\"gt_row gt_center\" style=\"background-color: #BFBFBF;\">three</td>\n<td class=\"gt_row gt_left\" style=\"background-color: #B3B3B3;\">2015-03-15</td>\n<td class=\"gt_row gt_left\" style=\"background-color: #A6A6A6;\">15:45</td>\n<td class=\"gt_row gt_left\" style=\"background-color: #999999;\">2018-03-03 03:44</td>\n<td class=\"gt_row gt_right\" style=\"background-color: #8C8C8C;\">1.390</td>\n<td class=\"gt_row gt_left\" style=\"background-color: #737373;\">grp_a</td></tr>\n    <tr><td class=\"gt_row gt_right gt_stub\" style=\"background-color: #FFDAB9;\">row_4</td>\n<td class=\"gt_row gt_right\" style=\"background-color: #D9D9D9;\">4.444e+02</td>\n<td class=\"gt_row gt_left\" style=\"background-color: #CCCCCC;\">durian</td>\n<td class=\"gt_row gt_center\" style=\"background-color: #BFBFBF;\">four</td>\n<td class=\"gt_row gt_left\" style=\"background-color: #B3B3B3;\">2015-04-15</td>\n<td class=\"gt_row gt_left\" style=\"background-color: #A6A6A6;\">16:50</td>\n<td class=\"gt_row gt_left\" style=\"background-color: #999999;\">2018-04-04 15:55</td>\n<td class=\"gt_row gt_right\" style=\"background-color: #8C8C8C;\">65100.000</td>\n<td class=\"gt_row gt_left\" style=\"background-color: #737373;\">grp_a</td></tr>\n    <tr><td class=\"gt_row gt_right gt_stub\" style=\"background-color: #FFDAB9;\">row_5</td>\n<td class=\"gt_row gt_right\" style=\"background-color: #D9D9D9;\">5.550e+03</td>\n<td class=\"gt_row gt_left\" style=\"background-color: #CCCCCC;\">NA</td>\n<td class=\"gt_row gt_center\" style=\"background-color: #BFBFBF;\">five</td>\n<td class=\"gt_row gt_left\" style=\"background-color: #B3B3B3;\">2015-05-15</td>\n<td class=\"gt_row gt_left\" style=\"background-color: #A6A6A6;\">17:55</td>\n<td class=\"gt_row gt_left\" style=\"background-color: #999999;\">2018-05-05 04:00</td>\n<td class=\"gt_row gt_right\" style=\"background-color: #8C8C8C;\">1325.810</td>\n<td class=\"gt_row gt_left\" style=\"background-color: #737373;\">grp_b</td></tr>\n    <tr><td class=\"gt_row gt_right gt_stub\" style=\"background-color: #FFDAB9;\">row_6</td>\n<td class=\"gt_row gt_right\" style=\"background-color: #D9D9D9;\">NA</td>\n<td class=\"gt_row gt_left\" style=\"background-color: #CCCCCC;\">fig</td>\n<td class=\"gt_row gt_center\" style=\"background-color: #BFBFBF;\">six</td>\n<td class=\"gt_row gt_left\" style=\"background-color: #B3B3B3;\">2015-06-15</td>\n<td class=\"gt_row gt_left\" style=\"background-color: #A6A6A6;\">NA</td>\n<td class=\"gt_row gt_left\" style=\"background-color: #999999;\">2018-06-06 16:11</td>\n<td class=\"gt_row gt_right\" style=\"background-color: #8C8C8C;\">13.255</td>\n<td class=\"gt_row gt_left\" style=\"background-color: #737373;\">grp_b</td></tr>\n    <tr><td class=\"gt_row gt_right gt_stub\" style=\"background-color: #FFDAB9;\">row_7</td>\n<td class=\"gt_row gt_right\" style=\"background-color: #D9D9D9;\">7.770e+05</td>\n<td class=\"gt_row gt_left\" style=\"background-color: #CCCCCC;\">grapefruit</td>\n<td class=\"gt_row gt_center\" style=\"background-color: #BFBFBF;\">seven</td>\n<td class=\"gt_row gt_left\" style=\"background-color: #B3B3B3;\">NA</td>\n<td class=\"gt_row gt_left\" style=\"background-color: #A6A6A6;\">19:10</td>\n<td class=\"gt_row gt_left\" style=\"background-color: #999999;\">2018-07-07 05:22</td>\n<td class=\"gt_row gt_right\" style=\"background-color: #8C8C8C;\">NA</td>\n<td class=\"gt_row gt_left\" style=\"background-color: #737373;\">grp_b</td></tr>\n    <tr><td class=\"gt_row gt_right gt_stub\" style=\"background-color: #FFDAB9;\">row_8</td>\n<td class=\"gt_row gt_right\" style=\"background-color: #D9D9D9;\">8.880e+06</td>\n<td class=\"gt_row gt_left\" style=\"background-color: #CCCCCC;\">honeydew</td>\n<td class=\"gt_row gt_center\" style=\"background-color: #BFBFBF;\">eight</td>\n<td class=\"gt_row gt_left\" style=\"background-color: #B3B3B3;\">2015-08-15</td>\n<td class=\"gt_row gt_left\" style=\"background-color: #A6A6A6;\">20:20</td>\n<td class=\"gt_row gt_left\" style=\"background-color: #999999;\">NA</td>\n<td class=\"gt_row gt_right\" style=\"background-color: #8C8C8C;\">0.440</td>\n<td class=\"gt_row gt_left\" style=\"background-color: #737373;\">grp_b</td></tr>\n    <tr><td class=\"gt_row gt_right gt_stub gt_grand_summary_row gt_first_grand_summary_row\" style=\"background-color: #FF0000;\">min</td>\n<td class=\"gt_row gt_right gt_grand_summary_row gt_first_grand_summary_row\" style=\"background-color: #D3D3D3;\">0.11</td>\n<td class=\"gt_row gt_left gt_grand_summary_row gt_first_grand_summary_row\">&mdash;</td>\n<td class=\"gt_row gt_center gt_grand_summary_row gt_first_grand_summary_row\">&mdash;</td>\n<td class=\"gt_row gt_left gt_grand_summary_row gt_first_grand_summary_row\">&mdash;</td>\n<td class=\"gt_row gt_left gt_grand_summary_row gt_first_grand_summary_row\">&mdash;</td>\n<td class=\"gt_row gt_left gt_grand_summary_row gt_first_grand_summary_row\">&mdash;</td>\n<td class=\"gt_row gt_right gt_grand_summary_row gt_first_grand_summary_row\" style=\"background-color: #D3D3D3;\">0.44</td>\n<td class=\"gt_row gt_left gt_grand_summary_row gt_first_grand_summary_row\">&mdash;</td></tr>\n    <tr><td class=\"gt_row gt_right gt_stub gt_grand_summary_row\" style=\"background-color: #FF0000;\">max</td>\n<td class=\"gt_row gt_right gt_grand_summary_row\" style=\"background-color: #D3D3D3;\">8880000.00</td>\n<td class=\"gt_row gt_left gt_grand_summary_row\">&mdash;</td>\n<td class=\"gt_row gt_center gt_grand_summary_row\">&mdash;</td>\n<td class=\"gt_row gt_left gt_grand_summary_row\">&mdash;</td>\n<td class=\"gt_row gt_left gt_grand_summary_row\">&mdash;</td>\n<td class=\"gt_row gt_left gt_grand_summary_row\">&mdash;</td>\n<td class=\"gt_row gt_right gt_grand_summary_row\" style=\"background-color: #D3D3D3;\">65100.00</td>\n<td class=\"gt_row gt_left gt_grand_summary_row\">&mdash;</td></tr>\n    <tr><td class=\"gt_row gt_right gt_stub gt_grand_summary_row gt_last_summary_row\" style=\"background-color: #FF0000;\">avg</td>\n<td class=\"gt_row gt_right gt_grand_summary_row gt_last_summary_row\" style=\"background-color: #D3D3D3;\">1380432.87</td>\n<td class=\"gt_row gt_left gt_grand_summary_row gt_last_summary_row\">&mdash;</td>\n<td class=\"gt_row gt_center gt_grand_summary_row gt_last_summary_row\">&mdash;</td>\n<td class=\"gt_row gt_left gt_grand_summary_row gt_last_summary_row\">&mdash;</td>\n<td class=\"gt_row gt_left gt_grand_summary_row gt_last_summary_row\">&mdash;</td>\n<td class=\"gt_row gt_left gt_grand_summary_row gt_last_summary_row\">&mdash;</td>\n<td class=\"gt_row gt_right gt_grand_summary_row gt_last_summary_row\" style=\"background-color: #D3D3D3;\">9501.26</td>\n<td class=\"gt_row gt_left gt_grand_summary_row gt_last_summary_row\">&mdash;</td></tr>\n  </tbody>\n  <tfoot class=\"gt_sourcenotes\">\n    <tr>\n      <td class=\"gt_sourcenote\" style=\"background-color: #F5DEB3;\" colspan=\"9\">Source note #1</td>\n    </tr>\n    <tr>\n      <td class=\"gt_sourcenote\" style=\"background-color: #F5DEB3;\" colspan=\"9\">Source note #2</td>\n    </tr>\n  </tfoot>\n  \n</table>"

---

    Code
      .
    Output
      [1] "<table class=\"gt_table\">\n  <thead class=\"gt_header\">\n    <tr>\n      <th colspan=\"9\" class=\"gt_heading gt_title gt_font_normal\" style=\"background-color: #ADD8E6;\">Data listing from <strong>exibble</strong></th>\n    </tr>\n    <tr>\n      <th colspan=\"9\" class=\"gt_heading gt_subtitle gt_font_normal gt_bottom_border\" style=\"background-color: #00FFFF;\"><code>exibble</code> is an R dataset</th>\n    </tr>\n  </thead>\n  <thead class=\"gt_col_headings\">\n    <tr>\n      <th class=\"gt_col_heading gt_columns_bottom_border gt_left\" rowspan=\"2\" colspan=\"1\" style=\"background-color: #DCDCDC;\">S.L.</th>\n      <th class=\"gt_col_heading gt_columns_bottom_border gt_right\" rowspan=\"2\" colspan=\"1\" style=\"background-color: #7FFFD4;\">num</th>\n      <th class=\"gt_col_heading gt_columns_bottom_border gt_left\" rowspan=\"2\" colspan=\"1\" style=\"background-color: #7FFFD4;\">char</th>\n      <th class=\"gt_col_heading gt_columns_bottom_border gt_center\" rowspan=\"2\" colspan=\"1\" style=\"background-color: #7FFFD4;\">fctr</th>\n      <th class=\"gt_center gt_columns_top_border gt_column_spanner_outer\" rowspan=\"1\" colspan=\"3\" style=\"background-color: #FFFF00;\">\n        <span class=\"gt_column_spanner\">timing</span>\n      </th>\n      <th class=\"gt_col_heading gt_columns_bottom_border gt_right\" rowspan=\"2\" colspan=\"1\" style=\"background-color: #7FFFD4;\">currency</th>\n      <th class=\"gt_col_heading gt_columns_bottom_border gt_left\" rowspan=\"2\" colspan=\"1\" style=\"background-color: #7FFFD4;\">group</th>\n    </tr>\n    <tr>\n      <th class=\"gt_col_heading gt_columns_bottom_border gt_left\" rowspan=\"1\" colspan=\"1\" style=\"background-color: #7FFFD4;\">date</th>\n      <th class=\"gt_col_heading gt_columns_bottom_border gt_left\" rowspan=\"1\" colspan=\"1\" style=\"background-color: #7FFFD4;\">time</th>\n      <th class=\"gt_col_heading gt_columns_bottom_border gt_left\" rowspan=\"1\" colspan=\"1\" style=\"background-color: #7FFFD4;\">datetime</th>\n    </tr>\n  </thead>\n  <tbody class=\"gt_table_body\">\n    <tr><td class=\"gt_row gt_right gt_stub\" style=\"background-color: #FFDAB9;\">row_1</td>\n<td class=\"gt_row gt_right\" style=\"background-color: #D9D9D9;\">1.111e-01</td>\n<td class=\"gt_row gt_left\" style=\"background-color: #CCCCCC;\">apricot</td>\n<td class=\"gt_row gt_center\" style=\"background-color: #BFBFBF;\">one</td>\n<td class=\"gt_row gt_left\" style=\"background-color: #B3B3B3;\">2015-01-15</td>\n<td class=\"gt_row gt_left\" style=\"background-color: #A6A6A6;\">13:35</td>\n<td class=\"gt_row gt_left\" style=\"background-color: #999999;\">2018-01-01 02:22</td>\n<td class=\"gt_row gt_right\" style=\"background-color: #8C8C8C;\">49.950</td>\n<td class=\"gt_row gt_left\" style=\"background-color: #737373;\">grp_a</td></tr>\n    <tr><td class=\"gt_row gt_right gt_stub\" style=\"background-color: #FFDAB9;\">row_2</td>\n<td class=\"gt_row gt_right\" style=\"background-color: #D9D9D9;\">2.222e+00</td>\n<td class=\"gt_row gt_left\" style=\"background-color: #CCCCCC;\">banana</td>\n<td class=\"gt_row gt_center\" style=\"background-color: #BFBFBF;\">two</td>\n<td class=\"gt_row gt_left\" style=\"background-color: #B3B3B3;\">2015-02-15</td>\n<td class=\"gt_row gt_left\" style=\"background-color: #A6A6A6;\">14:40</td>\n<td class=\"gt_row gt_left\" style=\"background-color: #999999;\">2018-02-02 14:33</td>\n<td class=\"gt_row gt_right\" style=\"background-color: #8C8C8C;\">17.950</td>\n<td class=\"gt_row gt_left\" style=\"background-color: #737373;\">grp_a</td></tr>\n    <tr><td class=\"gt_row gt_right gt_stub\" style=\"background-color: #FFDAB9;\">row_3</td>\n<td class=\"gt_row gt_right\" style=\"background-color: #D9D9D9;\">3.333e+01</td>\n<td class=\"gt_row gt_left\" style=\"background-color: #CCCCCC;\">coconut</td>\n<td class=\"gt_row gt_center\" style=\"background-color: #BFBFBF;\">three</td>\n<td class=\"gt_row gt_left\" style=\"background-color: #B3B3B3;\">2015-03-15</td>\n<td class=\"gt_row gt_left\" style=\"background-color: #A6A6A6;\">15:45</td>\n<td class=\"gt_row gt_left\" style=\"background-color: #999999;\">2018-03-03 03:44</td>\n<td class=\"gt_row gt_right\" style=\"background-color: #8C8C8C;\">1.390</td>\n<td class=\"gt_row gt_left\" style=\"background-color: #737373;\">grp_a</td></tr>\n    <tr><td class=\"gt_row gt_right gt_stub\" style=\"background-color: #FFDAB9;\">row_4</td>\n<td class=\"gt_row gt_right\" style=\"background-color: #D9D9D9;\">4.444e+02</td>\n<td class=\"gt_row gt_left\" style=\"background-color: #CCCCCC;\">durian</td>\n<td class=\"gt_row gt_center\" style=\"background-color: #BFBFBF;\">four</td>\n<td class=\"gt_row gt_left\" style=\"background-color: #B3B3B3;\">2015-04-15</td>\n<td class=\"gt_row gt_left\" style=\"background-color: #A6A6A6;\">16:50</td>\n<td class=\"gt_row gt_left\" style=\"background-color: #999999;\">2018-04-04 15:55</td>\n<td class=\"gt_row gt_right\" style=\"background-color: #8C8C8C;\">65100.000</td>\n<td class=\"gt_row gt_left\" style=\"background-color: #737373;\">grp_a</td></tr>\n    <tr><td class=\"gt_row gt_right gt_stub\" style=\"background-color: #FFDAB9;\">row_5</td>\n<td class=\"gt_row gt_right\" style=\"background-color: #D9D9D9;\">5.550e+03</td>\n<td class=\"gt_row gt_left\" style=\"background-color: #CCCCCC;\">NA</td>\n<td class=\"gt_row gt_center\" style=\"background-color: #BFBFBF;\">five</td>\n<td class=\"gt_row gt_left\" style=\"background-color: #B3B3B3;\">2015-05-15</td>\n<td class=\"gt_row gt_left\" style=\"background-color: #A6A6A6;\">17:55</td>\n<td class=\"gt_row gt_left\" style=\"background-color: #999999;\">2018-05-05 04:00</td>\n<td class=\"gt_row gt_right\" style=\"background-color: #8C8C8C;\">1325.810</td>\n<td class=\"gt_row gt_left\" style=\"background-color: #737373;\">grp_b</td></tr>\n    <tr><td class=\"gt_row gt_right gt_stub\" style=\"background-color: #FFDAB9;\">row_6</td>\n<td class=\"gt_row gt_right\" style=\"background-color: #D9D9D9;\">NA</td>\n<td class=\"gt_row gt_left\" style=\"background-color: #CCCCCC;\">fig</td>\n<td class=\"gt_row gt_center\" style=\"background-color: #BFBFBF;\">six</td>\n<td class=\"gt_row gt_left\" style=\"background-color: #B3B3B3;\">2015-06-15</td>\n<td class=\"gt_row gt_left\" style=\"background-color: #A6A6A6;\">NA</td>\n<td class=\"gt_row gt_left\" style=\"background-color: #999999;\">2018-06-06 16:11</td>\n<td class=\"gt_row gt_right\" style=\"background-color: #8C8C8C;\">13.255</td>\n<td class=\"gt_row gt_left\" style=\"background-color: #737373;\">grp_b</td></tr>\n    <tr><td class=\"gt_row gt_right gt_stub\" style=\"background-color: #FFDAB9;\">row_7</td>\n<td class=\"gt_row gt_right\" style=\"background-color: #D9D9D9;\">7.770e+05</td>\n<td class=\"gt_row gt_left\" style=\"background-color: #CCCCCC;\">grapefruit</td>\n<td class=\"gt_row gt_center\" style=\"background-color: #BFBFBF;\">seven</td>\n<td class=\"gt_row gt_left\" style=\"background-color: #B3B3B3;\">NA</td>\n<td class=\"gt_row gt_left\" style=\"background-color: #A6A6A6;\">19:10</td>\n<td class=\"gt_row gt_left\" style=\"background-color: #999999;\">2018-07-07 05:22</td>\n<td class=\"gt_row gt_right\" style=\"background-color: #8C8C8C;\">NA</td>\n<td class=\"gt_row gt_left\" style=\"background-color: #737373;\">grp_b</td></tr>\n    <tr><td class=\"gt_row gt_right gt_stub\" style=\"background-color: #FFDAB9;\">row_8</td>\n<td class=\"gt_row gt_right\" style=\"background-color: #D9D9D9;\">8.880e+06</td>\n<td class=\"gt_row gt_left\" style=\"background-color: #CCCCCC;\">honeydew</td>\n<td class=\"gt_row gt_center\" style=\"background-color: #BFBFBF;\">eight</td>\n<td class=\"gt_row gt_left\" style=\"background-color: #B3B3B3;\">2015-08-15</td>\n<td class=\"gt_row gt_left\" style=\"background-color: #A6A6A6;\">20:20</td>\n<td class=\"gt_row gt_left\" style=\"background-color: #999999;\">NA</td>\n<td class=\"gt_row gt_right\" style=\"background-color: #8C8C8C;\">0.440</td>\n<td class=\"gt_row gt_left\" style=\"background-color: #737373;\">grp_b</td></tr>\n    <tr><td class=\"gt_row gt_right gt_stub gt_grand_summary_row gt_first_grand_summary_row\" style=\"background-color: #FF0000;\">min</td>\n<td class=\"gt_row gt_right gt_grand_summary_row gt_first_grand_summary_row\" style=\"background-color: #D3D3D3;\">0.11</td>\n<td class=\"gt_row gt_left gt_grand_summary_row gt_first_grand_summary_row\">&mdash;</td>\n<td class=\"gt_row gt_center gt_grand_summary_row gt_first_grand_summary_row\">&mdash;</td>\n<td class=\"gt_row gt_left gt_grand_summary_row gt_first_grand_summary_row\">&mdash;</td>\n<td class=\"gt_row gt_left gt_grand_summary_row gt_first_grand_summary_row\">&mdash;</td>\n<td class=\"gt_row gt_left gt_grand_summary_row gt_first_grand_summary_row\">&mdash;</td>\n<td class=\"gt_row gt_right gt_grand_summary_row gt_first_grand_summary_row\" style=\"background-color: #D3D3D3;\">0.44</td>\n<td class=\"gt_row gt_left gt_grand_summary_row gt_first_grand_summary_row\">&mdash;</td></tr>\n    <tr><td class=\"gt_row gt_right gt_stub gt_grand_summary_row\" style=\"background-color: #FF0000;\">max</td>\n<td class=\"gt_row gt_right gt_grand_summary_row\" style=\"background-color: #D3D3D3;\">8880000.00</td>\n<td class=\"gt_row gt_left gt_grand_summary_row\">&mdash;</td>\n<td class=\"gt_row gt_center gt_grand_summary_row\">&mdash;</td>\n<td class=\"gt_row gt_left gt_grand_summary_row\">&mdash;</td>\n<td class=\"gt_row gt_left gt_grand_summary_row\">&mdash;</td>\n<td class=\"gt_row gt_left gt_grand_summary_row\">&mdash;</td>\n<td class=\"gt_row gt_right gt_grand_summary_row\" style=\"background-color: #D3D3D3;\">65100.00</td>\n<td class=\"gt_row gt_left gt_grand_summary_row\">&mdash;</td></tr>\n    <tr><td class=\"gt_row gt_right gt_stub gt_grand_summary_row gt_last_summary_row\" style=\"background-color: #FF0000;\">avg</td>\n<td class=\"gt_row gt_right gt_grand_summary_row gt_last_summary_row\" style=\"background-color: #D3D3D3;\">1380432.87</td>\n<td class=\"gt_row gt_left gt_grand_summary_row gt_last_summary_row\">&mdash;</td>\n<td class=\"gt_row gt_center gt_grand_summary_row gt_last_summary_row\">&mdash;</td>\n<td class=\"gt_row gt_left gt_grand_summary_row gt_last_summary_row\">&mdash;</td>\n<td class=\"gt_row gt_left gt_grand_summary_row gt_last_summary_row\">&mdash;</td>\n<td class=\"gt_row gt_left gt_grand_summary_row gt_last_summary_row\">&mdash;</td>\n<td class=\"gt_row gt_right gt_grand_summary_row gt_last_summary_row\" style=\"background-color: #D3D3D3;\">9501.26</td>\n<td class=\"gt_row gt_left gt_grand_summary_row gt_last_summary_row\">&mdash;</td></tr>\n  </tbody>\n  <tfoot class=\"gt_sourcenotes\">\n    <tr>\n      <td class=\"gt_sourcenote\" style=\"background-color: #F5DEB3;\" colspan=\"9\">Source note #1</td>\n    </tr>\n    <tr>\n      <td class=\"gt_sourcenote\" style=\"background-color: #F5DEB3;\" colspan=\"9\">Source note #2</td>\n    </tr>\n  </tfoot>\n  \n</table>"

---

    Code
      .
    Output
      [1] "<table class=\"gt_table\">\n  <thead class=\"gt_header\">\n    <tr>\n      <th colspan=\"8\" class=\"gt_heading gt_title gt_font_normal\" style=\"background-color: #ADD8E6;\">Data listing from <strong>exibble</strong></th>\n    </tr>\n    <tr>\n      <th colspan=\"8\" class=\"gt_heading gt_subtitle gt_font_normal gt_bottom_border\" style=\"background-color: #00FFFF;\"><code>exibble</code> is an R dataset</th>\n    </tr>\n  </thead>\n  <thead class=\"gt_col_headings\">\n    <tr>\n      <th class=\"gt_col_heading gt_columns_bottom_border gt_left\" rowspan=\"2\" colspan=\"1\" style=\"background-color: #DCDCDC;\">S.L.</th>\n      <th class=\"gt_col_heading gt_columns_bottom_border gt_right\" rowspan=\"2\" colspan=\"1\" style=\"background-color: #7FFFD4;\">num</th>\n      <th class=\"gt_col_heading gt_columns_bottom_border gt_left\" rowspan=\"2\" colspan=\"1\" style=\"background-color: #7FFFD4;\">char</th>\n      <th class=\"gt_col_heading gt_columns_bottom_border gt_center\" rowspan=\"2\" colspan=\"1\" style=\"background-color: #7FFFD4;\">fctr</th>\n      <th class=\"gt_center gt_columns_top_border gt_column_spanner_outer\" rowspan=\"1\" colspan=\"3\" style=\"background-color: #FFFF00;\">\n        <span class=\"gt_column_spanner\">timing</span>\n      </th>\n      <th class=\"gt_col_heading gt_columns_bottom_border gt_right\" rowspan=\"2\" colspan=\"1\" style=\"background-color: #7FFFD4;\">currency</th>\n    </tr>\n    <tr>\n      <th class=\"gt_col_heading gt_columns_bottom_border gt_left\" rowspan=\"1\" colspan=\"1\" style=\"background-color: #7FFFD4;\">date</th>\n      <th class=\"gt_col_heading gt_columns_bottom_border gt_left\" rowspan=\"1\" colspan=\"1\" style=\"background-color: #7FFFD4;\">time</th>\n      <th class=\"gt_col_heading gt_columns_bottom_border gt_left\" rowspan=\"1\" colspan=\"1\" style=\"background-color: #7FFFD4;\">datetime</th>\n    </tr>\n  </thead>\n  <tbody class=\"gt_table_body\">\n    <tr class=\"gt_group_heading_row\">\n      <td colspan=\"8\" class=\"gt_group_heading\" style=\"background-color: #E0FFFF;\">grp_a</td>\n    </tr>\n    <tr class=\"gt_row_group_first\"><td class=\"gt_row gt_right gt_stub\" style=\"background-color: #FFDAB9;\">row_1</td>\n<td class=\"gt_row gt_right\" style=\"background-color: #D9D9D9;\">1.111e-01</td>\n<td class=\"gt_row gt_left\" style=\"background-color: #CCCCCC;\">apricot</td>\n<td class=\"gt_row gt_center\" style=\"background-color: #BFBFBF;\">one</td>\n<td class=\"gt_row gt_left\" style=\"background-color: #B3B3B3;\">2015-01-15</td>\n<td class=\"gt_row gt_left\" style=\"background-color: #A6A6A6;\">13:35</td>\n<td class=\"gt_row gt_left\" style=\"background-color: #999999;\">2018-01-01 02:22</td>\n<td class=\"gt_row gt_right\" style=\"background-color: #8C8C8C;\">49.950</td></tr>\n    <tr><td class=\"gt_row gt_right gt_stub\" style=\"background-color: #FFDAB9;\">row_2</td>\n<td class=\"gt_row gt_right\" style=\"background-color: #D9D9D9;\">2.222e+00</td>\n<td class=\"gt_row gt_left\" style=\"background-color: #CCCCCC;\">banana</td>\n<td class=\"gt_row gt_center\" style=\"background-color: #BFBFBF;\">two</td>\n<td class=\"gt_row gt_left\" style=\"background-color: #B3B3B3;\">2015-02-15</td>\n<td class=\"gt_row gt_left\" style=\"background-color: #A6A6A6;\">14:40</td>\n<td class=\"gt_row gt_left\" style=\"background-color: #999999;\">2018-02-02 14:33</td>\n<td class=\"gt_row gt_right\" style=\"background-color: #8C8C8C;\">17.950</td></tr>\n    <tr><td class=\"gt_row gt_right gt_stub\" style=\"background-color: #FFDAB9;\">row_3</td>\n<td class=\"gt_row gt_right\" style=\"background-color: #D9D9D9;\">3.333e+01</td>\n<td class=\"gt_row gt_left\" style=\"background-color: #CCCCCC;\">coconut</td>\n<td class=\"gt_row gt_center\" style=\"background-color: #BFBFBF;\">three</td>\n<td class=\"gt_row gt_left\" style=\"background-color: #B3B3B3;\">2015-03-15</td>\n<td class=\"gt_row gt_left\" style=\"background-color: #A6A6A6;\">15:45</td>\n<td class=\"gt_row gt_left\" style=\"background-color: #999999;\">2018-03-03 03:44</td>\n<td class=\"gt_row gt_right\" style=\"background-color: #8C8C8C;\">1.390</td></tr>\n    <tr><td class=\"gt_row gt_right gt_stub\" style=\"background-color: #FFDAB9;\">row_4</td>\n<td class=\"gt_row gt_right\" style=\"background-color: #D9D9D9;\">4.444e+02</td>\n<td class=\"gt_row gt_left\" style=\"background-color: #CCCCCC;\">durian</td>\n<td class=\"gt_row gt_center\" style=\"background-color: #BFBFBF;\">four</td>\n<td class=\"gt_row gt_left\" style=\"background-color: #B3B3B3;\">2015-04-15</td>\n<td class=\"gt_row gt_left\" style=\"background-color: #A6A6A6;\">16:50</td>\n<td class=\"gt_row gt_left\" style=\"background-color: #999999;\">2018-04-04 15:55</td>\n<td class=\"gt_row gt_right\" style=\"background-color: #8C8C8C;\">65100.000</td></tr>\n    <tr><td class=\"gt_row gt_right gt_stub gt_summary_row gt_first_summary_row thick\" style=\"background-color: #FFA500;\">min</td>\n<td class=\"gt_row gt_right gt_summary_row gt_first_summary_row thick\" style=\"background-color: #8FBC8F;\">0.11</td>\n<td class=\"gt_row gt_left gt_summary_row gt_first_summary_row thick\">&mdash;</td>\n<td class=\"gt_row gt_center gt_summary_row gt_first_summary_row thick\">&mdash;</td>\n<td class=\"gt_row gt_left gt_summary_row gt_first_summary_row thick\">&mdash;</td>\n<td class=\"gt_row gt_left gt_summary_row gt_first_summary_row thick\">&mdash;</td>\n<td class=\"gt_row gt_left gt_summary_row gt_first_summary_row thick\">&mdash;</td>\n<td class=\"gt_row gt_right gt_summary_row gt_first_summary_row thick\" style=\"background-color: #8FBC8F;\">1.39</td></tr>\n    <tr><td class=\"gt_row gt_right gt_stub gt_summary_row\" style=\"background-color: #FFA500;\">max</td>\n<td class=\"gt_row gt_right gt_summary_row\" style=\"background-color: #8FBC8F;\">444.40</td>\n<td class=\"gt_row gt_left gt_summary_row\">&mdash;</td>\n<td class=\"gt_row gt_center gt_summary_row\">&mdash;</td>\n<td class=\"gt_row gt_left gt_summary_row\">&mdash;</td>\n<td class=\"gt_row gt_left gt_summary_row\">&mdash;</td>\n<td class=\"gt_row gt_left gt_summary_row\">&mdash;</td>\n<td class=\"gt_row gt_right gt_summary_row\" style=\"background-color: #8FBC8F;\">65100.00</td></tr>\n    <tr><td class=\"gt_row gt_right gt_stub gt_summary_row gt_last_summary_row\" style=\"background-color: #FFA500;\">avg</td>\n<td class=\"gt_row gt_right gt_summary_row gt_last_summary_row\" style=\"background-color: #8FBC8F;\">120.02</td>\n<td class=\"gt_row gt_left gt_summary_row gt_last_summary_row\">&mdash;</td>\n<td class=\"gt_row gt_center gt_summary_row gt_last_summary_row\">&mdash;</td>\n<td class=\"gt_row gt_left gt_summary_row gt_last_summary_row\">&mdash;</td>\n<td class=\"gt_row gt_left gt_summary_row gt_last_summary_row\">&mdash;</td>\n<td class=\"gt_row gt_left gt_summary_row gt_last_summary_row\">&mdash;</td>\n<td class=\"gt_row gt_right gt_summary_row gt_last_summary_row\" style=\"background-color: #8FBC8F;\">16292.32</td></tr>\n    <tr class=\"gt_group_heading_row\">\n      <td colspan=\"8\" class=\"gt_group_heading\" style=\"background-color: #E0FFFF;\">grp_b</td>\n    </tr>\n    <tr class=\"gt_row_group_first\"><td class=\"gt_row gt_right gt_stub\" style=\"background-color: #FFDAB9;\">row_5</td>\n<td class=\"gt_row gt_right\" style=\"background-color: #D9D9D9;\">5.550e+03</td>\n<td class=\"gt_row gt_left\" style=\"background-color: #CCCCCC;\">NA</td>\n<td class=\"gt_row gt_center\" style=\"background-color: #BFBFBF;\">five</td>\n<td class=\"gt_row gt_left\" style=\"background-color: #B3B3B3;\">2015-05-15</td>\n<td class=\"gt_row gt_left\" style=\"background-color: #A6A6A6;\">17:55</td>\n<td class=\"gt_row gt_left\" style=\"background-color: #999999;\">2018-05-05 04:00</td>\n<td class=\"gt_row gt_right\" style=\"background-color: #8C8C8C;\">1325.810</td></tr>\n    <tr><td class=\"gt_row gt_right gt_stub\" style=\"background-color: #FFDAB9;\">row_6</td>\n<td class=\"gt_row gt_right\" style=\"background-color: #D9D9D9;\">NA</td>\n<td class=\"gt_row gt_left\" style=\"background-color: #CCCCCC;\">fig</td>\n<td class=\"gt_row gt_center\" style=\"background-color: #BFBFBF;\">six</td>\n<td class=\"gt_row gt_left\" style=\"background-color: #B3B3B3;\">2015-06-15</td>\n<td class=\"gt_row gt_left\" style=\"background-color: #A6A6A6;\">NA</td>\n<td class=\"gt_row gt_left\" style=\"background-color: #999999;\">2018-06-06 16:11</td>\n<td class=\"gt_row gt_right\" style=\"background-color: #8C8C8C;\">13.255</td></tr>\n    <tr><td class=\"gt_row gt_right gt_stub\" style=\"background-color: #FFDAB9;\">row_7</td>\n<td class=\"gt_row gt_right\" style=\"background-color: #D9D9D9;\">7.770e+05</td>\n<td class=\"gt_row gt_left\" style=\"background-color: #CCCCCC;\">grapefruit</td>\n<td class=\"gt_row gt_center\" style=\"background-color: #BFBFBF;\">seven</td>\n<td class=\"gt_row gt_left\" style=\"background-color: #B3B3B3;\">NA</td>\n<td class=\"gt_row gt_left\" style=\"background-color: #A6A6A6;\">19:10</td>\n<td class=\"gt_row gt_left\" style=\"background-color: #999999;\">2018-07-07 05:22</td>\n<td class=\"gt_row gt_right\" style=\"background-color: #8C8C8C;\">NA</td></tr>\n    <tr><td class=\"gt_row gt_right gt_stub\" style=\"background-color: #FFDAB9;\">row_8</td>\n<td class=\"gt_row gt_right\" style=\"background-color: #D9D9D9;\">8.880e+06</td>\n<td class=\"gt_row gt_left\" style=\"background-color: #CCCCCC;\">honeydew</td>\n<td class=\"gt_row gt_center\" style=\"background-color: #BFBFBF;\">eight</td>\n<td class=\"gt_row gt_left\" style=\"background-color: #B3B3B3;\">2015-08-15</td>\n<td class=\"gt_row gt_left\" style=\"background-color: #A6A6A6;\">20:20</td>\n<td class=\"gt_row gt_left\" style=\"background-color: #999999;\">NA</td>\n<td class=\"gt_row gt_right\" style=\"background-color: #8C8C8C;\">0.440</td></tr>\n    <tr><td class=\"gt_row gt_right gt_stub gt_summary_row gt_first_summary_row thick\" style=\"background-color: #FFA500;\">min</td>\n<td class=\"gt_row gt_right gt_summary_row gt_first_summary_row thick\" style=\"background-color: #8FBC8F;\">5550.00</td>\n<td class=\"gt_row gt_left gt_summary_row gt_first_summary_row thick\">&mdash;</td>\n<td class=\"gt_row gt_center gt_summary_row gt_first_summary_row thick\">&mdash;</td>\n<td class=\"gt_row gt_left gt_summary_row gt_first_summary_row thick\">&mdash;</td>\n<td class=\"gt_row gt_left gt_summary_row gt_first_summary_row thick\">&mdash;</td>\n<td class=\"gt_row gt_left gt_summary_row gt_first_summary_row thick\">&mdash;</td>\n<td class=\"gt_row gt_right gt_summary_row gt_first_summary_row thick\" style=\"background-color: #8FBC8F;\">0.44</td></tr>\n    <tr><td class=\"gt_row gt_right gt_stub gt_summary_row\" style=\"background-color: #FFA500;\">max</td>\n<td class=\"gt_row gt_right gt_summary_row\" style=\"background-color: #8FBC8F;\">8880000.00</td>\n<td class=\"gt_row gt_left gt_summary_row\">&mdash;</td>\n<td class=\"gt_row gt_center gt_summary_row\">&mdash;</td>\n<td class=\"gt_row gt_left gt_summary_row\">&mdash;</td>\n<td class=\"gt_row gt_left gt_summary_row\">&mdash;</td>\n<td class=\"gt_row gt_left gt_summary_row\">&mdash;</td>\n<td class=\"gt_row gt_right gt_summary_row\" style=\"background-color: #8FBC8F;\">1325.81</td></tr>\n    <tr><td class=\"gt_row gt_right gt_stub gt_summary_row gt_last_summary_row\" style=\"background-color: #FFA500;\">avg</td>\n<td class=\"gt_row gt_right gt_summary_row gt_last_summary_row\" style=\"background-color: #8FBC8F;\">3220850.00</td>\n<td class=\"gt_row gt_left gt_summary_row gt_last_summary_row\">&mdash;</td>\n<td class=\"gt_row gt_center gt_summary_row gt_last_summary_row\">&mdash;</td>\n<td class=\"gt_row gt_left gt_summary_row gt_last_summary_row\">&mdash;</td>\n<td class=\"gt_row gt_left gt_summary_row gt_last_summary_row\">&mdash;</td>\n<td class=\"gt_row gt_left gt_summary_row gt_last_summary_row\">&mdash;</td>\n<td class=\"gt_row gt_right gt_summary_row gt_last_summary_row\" style=\"background-color: #8FBC8F;\">446.50</td></tr>\n    <tr><td class=\"gt_row gt_right gt_stub gt_grand_summary_row gt_first_grand_summary_row\" style=\"background-color: #FF0000;\">min</td>\n<td class=\"gt_row gt_right gt_grand_summary_row gt_first_grand_summary_row\" style=\"background-color: #D3D3D3;\">0.11</td>\n<td class=\"gt_row gt_left gt_grand_summary_row gt_first_grand_summary_row\">&mdash;</td>\n<td class=\"gt_row gt_center gt_grand_summary_row gt_first_grand_summary_row\">&mdash;</td>\n<td class=\"gt_row gt_left gt_grand_summary_row gt_first_grand_summary_row\">&mdash;</td>\n<td class=\"gt_row gt_left gt_grand_summary_row gt_first_grand_summary_row\">&mdash;</td>\n<td class=\"gt_row gt_left gt_grand_summary_row gt_first_grand_summary_row\">&mdash;</td>\n<td class=\"gt_row gt_right gt_grand_summary_row gt_first_grand_summary_row\" style=\"background-color: #D3D3D3;\">0.44</td></tr>\n    <tr><td class=\"gt_row gt_right gt_stub gt_grand_summary_row\" style=\"background-color: #FF0000;\">max</td>\n<td class=\"gt_row gt_right gt_grand_summary_row\" style=\"background-color: #D3D3D3;\">8880000.00</td>\n<td class=\"gt_row gt_left gt_grand_summary_row\">&mdash;</td>\n<td class=\"gt_row gt_center gt_grand_summary_row\">&mdash;</td>\n<td class=\"gt_row gt_left gt_grand_summary_row\">&mdash;</td>\n<td class=\"gt_row gt_left gt_grand_summary_row\">&mdash;</td>\n<td class=\"gt_row gt_left gt_grand_summary_row\">&mdash;</td>\n<td class=\"gt_row gt_right gt_grand_summary_row\" style=\"background-color: #D3D3D3;\">65100.00</td></tr>\n    <tr><td class=\"gt_row gt_right gt_stub gt_grand_summary_row gt_last_summary_row\" style=\"background-color: #FF0000;\">avg</td>\n<td class=\"gt_row gt_right gt_grand_summary_row gt_last_summary_row\" style=\"background-color: #D3D3D3;\">1380432.87</td>\n<td class=\"gt_row gt_left gt_grand_summary_row gt_last_summary_row\">&mdash;</td>\n<td class=\"gt_row gt_center gt_grand_summary_row gt_last_summary_row\">&mdash;</td>\n<td class=\"gt_row gt_left gt_grand_summary_row gt_last_summary_row\">&mdash;</td>\n<td class=\"gt_row gt_left gt_grand_summary_row gt_last_summary_row\">&mdash;</td>\n<td class=\"gt_row gt_left gt_grand_summary_row gt_last_summary_row\">&mdash;</td>\n<td class=\"gt_row gt_right gt_grand_summary_row gt_last_summary_row\" style=\"background-color: #D3D3D3;\">9501.26</td></tr>\n  </tbody>\n  <tfoot class=\"gt_sourcenotes\">\n    <tr>\n      <td class=\"gt_sourcenote\" style=\"background-color: #F5DEB3;\" colspan=\"8\">Source note #1</td>\n    </tr>\n    <tr>\n      <td class=\"gt_sourcenote\" style=\"background-color: #F5DEB3;\" colspan=\"8\">Source note #2</td>\n    </tr>\n  </tfoot>\n  \n</table>"

---

    Code
      .
    Output
      [1] "<table class=\"gt_table\">\n  <thead class=\"gt_header\">\n    <tr>\n      <th colspan=\"9\" class=\"gt_heading gt_title gt_font_normal\" style=\"background-color: #ADD8E6;\">Data listing from <strong>exibble</strong></th>\n    </tr>\n    <tr>\n      <th colspan=\"9\" class=\"gt_heading gt_subtitle gt_font_normal gt_bottom_border\" style=\"background-color: #00FFFF;\"><code>exibble</code> is an R dataset</th>\n    </tr>\n  </thead>\n  <thead class=\"gt_col_headings\">\n    <tr>\n      <th class=\"gt_col_heading gt_columns_bottom_border gt_left\" rowspan=\"2\" colspan=\"2\" style=\"background-color: #DCDCDC;\">S.L.</th>\n      <th class=\"gt_col_heading gt_columns_bottom_border gt_right\" rowspan=\"2\" colspan=\"1\" style=\"background-color: #7FFFD4;\">num</th>\n      <th class=\"gt_col_heading gt_columns_bottom_border gt_left\" rowspan=\"2\" colspan=\"1\" style=\"background-color: #7FFFD4;\">char</th>\n      <th class=\"gt_col_heading gt_columns_bottom_border gt_center\" rowspan=\"2\" colspan=\"1\" style=\"background-color: #7FFFD4;\">fctr</th>\n      <th class=\"gt_center gt_columns_top_border gt_column_spanner_outer\" rowspan=\"1\" colspan=\"3\" style=\"background-color: #FFFF00;\">\n        <span class=\"gt_column_spanner\">timing</span>\n      </th>\n      <th class=\"gt_col_heading gt_columns_bottom_border gt_right\" rowspan=\"2\" colspan=\"1\" style=\"background-color: #7FFFD4;\">currency</th>\n    </tr>\n    <tr>\n      <th class=\"gt_col_heading gt_columns_bottom_border gt_left\" rowspan=\"1\" colspan=\"1\" style=\"background-color: #7FFFD4;\">date</th>\n      <th class=\"gt_col_heading gt_columns_bottom_border gt_left\" rowspan=\"1\" colspan=\"1\" style=\"background-color: #7FFFD4;\">time</th>\n      <th class=\"gt_col_heading gt_columns_bottom_border gt_left\" rowspan=\"1\" colspan=\"1\" style=\"background-color: #7FFFD4;\">datetime</th>\n    </tr>\n  </thead>\n  <tbody class=\"gt_table_body\">\n    <tr class=\"gt_row_group_first\"><td rowspan=\"7\" class=\"gt_row gt_right gt_stub_row_group\" style=\"background-color: #E0FFFF;\">grp_a</td>\n<td class=\"gt_row gt_right gt_stub\" style=\"background-color: #FFDAB9;\">row_1</td>\n<td class=\"gt_row gt_right\" style=\"background-color: #D9D9D9;\">1.111e-01</td>\n<td class=\"gt_row gt_left\" style=\"background-color: #CCCCCC;\">apricot</td>\n<td class=\"gt_row gt_center\" style=\"background-color: #BFBFBF;\">one</td>\n<td class=\"gt_row gt_left\" style=\"background-color: #B3B3B3;\">2015-01-15</td>\n<td class=\"gt_row gt_left\" style=\"background-color: #A6A6A6;\">13:35</td>\n<td class=\"gt_row gt_left\" style=\"background-color: #999999;\">2018-01-01 02:22</td>\n<td class=\"gt_row gt_right\" style=\"background-color: #8C8C8C;\">49.950</td></tr>\n    <tr><td class=\"gt_row gt_right gt_stub\" style=\"background-color: #FFDAB9;\">row_2</td>\n<td class=\"gt_row gt_right\" style=\"background-color: #D9D9D9;\">2.222e+00</td>\n<td class=\"gt_row gt_left\" style=\"background-color: #CCCCCC;\">banana</td>\n<td class=\"gt_row gt_center\" style=\"background-color: #BFBFBF;\">two</td>\n<td class=\"gt_row gt_left\" style=\"background-color: #B3B3B3;\">2015-02-15</td>\n<td class=\"gt_row gt_left\" style=\"background-color: #A6A6A6;\">14:40</td>\n<td class=\"gt_row gt_left\" style=\"background-color: #999999;\">2018-02-02 14:33</td>\n<td class=\"gt_row gt_right\" style=\"background-color: #8C8C8C;\">17.950</td></tr>\n    <tr><td class=\"gt_row gt_right gt_stub\" style=\"background-color: #FFDAB9;\">row_3</td>\n<td class=\"gt_row gt_right\" style=\"background-color: #D9D9D9;\">3.333e+01</td>\n<td class=\"gt_row gt_left\" style=\"background-color: #CCCCCC;\">coconut</td>\n<td class=\"gt_row gt_center\" style=\"background-color: #BFBFBF;\">three</td>\n<td class=\"gt_row gt_left\" style=\"background-color: #B3B3B3;\">2015-03-15</td>\n<td class=\"gt_row gt_left\" style=\"background-color: #A6A6A6;\">15:45</td>\n<td class=\"gt_row gt_left\" style=\"background-color: #999999;\">2018-03-03 03:44</td>\n<td class=\"gt_row gt_right\" style=\"background-color: #8C8C8C;\">1.390</td></tr>\n    <tr><td class=\"gt_row gt_right gt_stub\" style=\"background-color: #FFDAB9;\">row_4</td>\n<td class=\"gt_row gt_right\" style=\"background-color: #D9D9D9;\">4.444e+02</td>\n<td class=\"gt_row gt_left\" style=\"background-color: #CCCCCC;\">durian</td>\n<td class=\"gt_row gt_center\" style=\"background-color: #BFBFBF;\">four</td>\n<td class=\"gt_row gt_left\" style=\"background-color: #B3B3B3;\">2015-04-15</td>\n<td class=\"gt_row gt_left\" style=\"background-color: #A6A6A6;\">16:50</td>\n<td class=\"gt_row gt_left\" style=\"background-color: #999999;\">2018-04-04 15:55</td>\n<td class=\"gt_row gt_right\" style=\"background-color: #8C8C8C;\">65100.000</td></tr>\n    <tr><td class=\"gt_row gt_right gt_stub gt_summary_row gt_first_summary_row thick\" style=\"background-color: #FFA500;\">min</td>\n<td class=\"gt_row gt_right gt_summary_row gt_first_summary_row thick\" style=\"background-color: #8FBC8F;\">0.11</td>\n<td class=\"gt_row gt_left gt_summary_row gt_first_summary_row thick\">&mdash;</td>\n<td class=\"gt_row gt_center gt_summary_row gt_first_summary_row thick\">&mdash;</td>\n<td class=\"gt_row gt_left gt_summary_row gt_first_summary_row thick\">&mdash;</td>\n<td class=\"gt_row gt_left gt_summary_row gt_first_summary_row thick\">&mdash;</td>\n<td class=\"gt_row gt_left gt_summary_row gt_first_summary_row thick\">&mdash;</td>\n<td class=\"gt_row gt_right gt_summary_row gt_first_summary_row thick\" style=\"background-color: #8FBC8F;\">1.39</td></tr>\n    <tr><td class=\"gt_row gt_right gt_stub gt_summary_row\" style=\"background-color: #FFA500;\">max</td>\n<td class=\"gt_row gt_right gt_summary_row\" style=\"background-color: #8FBC8F;\">444.40</td>\n<td class=\"gt_row gt_left gt_summary_row\">&mdash;</td>\n<td class=\"gt_row gt_center gt_summary_row\">&mdash;</td>\n<td class=\"gt_row gt_left gt_summary_row\">&mdash;</td>\n<td class=\"gt_row gt_left gt_summary_row\">&mdash;</td>\n<td class=\"gt_row gt_left gt_summary_row\">&mdash;</td>\n<td class=\"gt_row gt_right gt_summary_row\" style=\"background-color: #8FBC8F;\">65100.00</td></tr>\n    <tr><td class=\"gt_row gt_right gt_stub gt_summary_row gt_last_summary_row\" style=\"background-color: #FFA500;\">avg</td>\n<td class=\"gt_row gt_right gt_summary_row gt_last_summary_row\" style=\"background-color: #8FBC8F;\">120.02</td>\n<td class=\"gt_row gt_left gt_summary_row gt_last_summary_row\">&mdash;</td>\n<td class=\"gt_row gt_center gt_summary_row gt_last_summary_row\">&mdash;</td>\n<td class=\"gt_row gt_left gt_summary_row gt_last_summary_row\">&mdash;</td>\n<td class=\"gt_row gt_left gt_summary_row gt_last_summary_row\">&mdash;</td>\n<td class=\"gt_row gt_left gt_summary_row gt_last_summary_row\">&mdash;</td>\n<td class=\"gt_row gt_right gt_summary_row gt_last_summary_row\" style=\"background-color: #8FBC8F;\">16292.32</td></tr>\n    <tr class=\"gt_row_group_first\"><td rowspan=\"7\" class=\"gt_row gt_right gt_stub_row_group\" style=\"background-color: #E0FFFF;\">grp_b</td>\n<td class=\"gt_row gt_right gt_stub\" style=\"background-color: #FFDAB9;\">row_5</td>\n<td class=\"gt_row gt_right\" style=\"background-color: #D9D9D9;\">5.550e+03</td>\n<td class=\"gt_row gt_left\" style=\"background-color: #CCCCCC;\">NA</td>\n<td class=\"gt_row gt_center\" style=\"background-color: #BFBFBF;\">five</td>\n<td class=\"gt_row gt_left\" style=\"background-color: #B3B3B3;\">2015-05-15</td>\n<td class=\"gt_row gt_left\" style=\"background-color: #A6A6A6;\">17:55</td>\n<td class=\"gt_row gt_left\" style=\"background-color: #999999;\">2018-05-05 04:00</td>\n<td class=\"gt_row gt_right\" style=\"background-color: #8C8C8C;\">1325.810</td></tr>\n    <tr><td class=\"gt_row gt_right gt_stub\" style=\"background-color: #FFDAB9;\">row_6</td>\n<td class=\"gt_row gt_right\" style=\"background-color: #D9D9D9;\">NA</td>\n<td class=\"gt_row gt_left\" style=\"background-color: #CCCCCC;\">fig</td>\n<td class=\"gt_row gt_center\" style=\"background-color: #BFBFBF;\">six</td>\n<td class=\"gt_row gt_left\" style=\"background-color: #B3B3B3;\">2015-06-15</td>\n<td class=\"gt_row gt_left\" style=\"background-color: #A6A6A6;\">NA</td>\n<td class=\"gt_row gt_left\" style=\"background-color: #999999;\">2018-06-06 16:11</td>\n<td class=\"gt_row gt_right\" style=\"background-color: #8C8C8C;\">13.255</td></tr>\n    <tr><td class=\"gt_row gt_right gt_stub\" style=\"background-color: #FFDAB9;\">row_7</td>\n<td class=\"gt_row gt_right\" style=\"background-color: #D9D9D9;\">7.770e+05</td>\n<td class=\"gt_row gt_left\" style=\"background-color: #CCCCCC;\">grapefruit</td>\n<td class=\"gt_row gt_center\" style=\"background-color: #BFBFBF;\">seven</td>\n<td class=\"gt_row gt_left\" style=\"background-color: #B3B3B3;\">NA</td>\n<td class=\"gt_row gt_left\" style=\"background-color: #A6A6A6;\">19:10</td>\n<td class=\"gt_row gt_left\" style=\"background-color: #999999;\">2018-07-07 05:22</td>\n<td class=\"gt_row gt_right\" style=\"background-color: #8C8C8C;\">NA</td></tr>\n    <tr><td class=\"gt_row gt_right gt_stub\" style=\"background-color: #FFDAB9;\">row_8</td>\n<td class=\"gt_row gt_right\" style=\"background-color: #D9D9D9;\">8.880e+06</td>\n<td class=\"gt_row gt_left\" style=\"background-color: #CCCCCC;\">honeydew</td>\n<td class=\"gt_row gt_center\" style=\"background-color: #BFBFBF;\">eight</td>\n<td class=\"gt_row gt_left\" style=\"background-color: #B3B3B3;\">2015-08-15</td>\n<td class=\"gt_row gt_left\" style=\"background-color: #A6A6A6;\">20:20</td>\n<td class=\"gt_row gt_left\" style=\"background-color: #999999;\">NA</td>\n<td class=\"gt_row gt_right\" style=\"background-color: #8C8C8C;\">0.440</td></tr>\n    <tr><td class=\"gt_row gt_right gt_stub gt_summary_row gt_first_summary_row thick\" style=\"background-color: #FFA500;\">min</td>\n<td class=\"gt_row gt_right gt_summary_row gt_first_summary_row thick\" style=\"background-color: #8FBC8F;\">5550.00</td>\n<td class=\"gt_row gt_left gt_summary_row gt_first_summary_row thick\">&mdash;</td>\n<td class=\"gt_row gt_center gt_summary_row gt_first_summary_row thick\">&mdash;</td>\n<td class=\"gt_row gt_left gt_summary_row gt_first_summary_row thick\">&mdash;</td>\n<td class=\"gt_row gt_left gt_summary_row gt_first_summary_row thick\">&mdash;</td>\n<td class=\"gt_row gt_left gt_summary_row gt_first_summary_row thick\">&mdash;</td>\n<td class=\"gt_row gt_right gt_summary_row gt_first_summary_row thick\" style=\"background-color: #8FBC8F;\">0.44</td></tr>\n    <tr><td class=\"gt_row gt_right gt_stub gt_summary_row\" style=\"background-color: #FFA500;\">max</td>\n<td class=\"gt_row gt_right gt_summary_row\" style=\"background-color: #8FBC8F;\">8880000.00</td>\n<td class=\"gt_row gt_left gt_summary_row\">&mdash;</td>\n<td class=\"gt_row gt_center gt_summary_row\">&mdash;</td>\n<td class=\"gt_row gt_left gt_summary_row\">&mdash;</td>\n<td class=\"gt_row gt_left gt_summary_row\">&mdash;</td>\n<td class=\"gt_row gt_left gt_summary_row\">&mdash;</td>\n<td class=\"gt_row gt_right gt_summary_row\" style=\"background-color: #8FBC8F;\">1325.81</td></tr>\n    <tr><td class=\"gt_row gt_right gt_stub gt_summary_row gt_last_summary_row\" style=\"background-color: #FFA500;\">avg</td>\n<td class=\"gt_row gt_right gt_summary_row gt_last_summary_row\" style=\"background-color: #8FBC8F;\">3220850.00</td>\n<td class=\"gt_row gt_left gt_summary_row gt_last_summary_row\">&mdash;</td>\n<td class=\"gt_row gt_center gt_summary_row gt_last_summary_row\">&mdash;</td>\n<td class=\"gt_row gt_left gt_summary_row gt_last_summary_row\">&mdash;</td>\n<td class=\"gt_row gt_left gt_summary_row gt_last_summary_row\">&mdash;</td>\n<td class=\"gt_row gt_left gt_summary_row gt_last_summary_row\">&mdash;</td>\n<td class=\"gt_row gt_right gt_summary_row gt_last_summary_row\" style=\"background-color: #8FBC8F;\">446.50</td></tr>\n    <tr><td colspan=\"2\" class=\"gt_row gt_right gt_stub gt_grand_summary_row gt_first_grand_summary_row\" style=\"background-color: #FF0000;\">min</td>\n<td class=\"gt_row gt_right gt_grand_summary_row gt_first_grand_summary_row\" style=\"background-color: #D3D3D3;\">0.11</td>\n<td class=\"gt_row gt_left gt_grand_summary_row gt_first_grand_summary_row\">&mdash;</td>\n<td class=\"gt_row gt_center gt_grand_summary_row gt_first_grand_summary_row\">&mdash;</td>\n<td class=\"gt_row gt_left gt_grand_summary_row gt_first_grand_summary_row\">&mdash;</td>\n<td class=\"gt_row gt_left gt_grand_summary_row gt_first_grand_summary_row\">&mdash;</td>\n<td class=\"gt_row gt_left gt_grand_summary_row gt_first_grand_summary_row\">&mdash;</td>\n<td class=\"gt_row gt_right gt_grand_summary_row gt_first_grand_summary_row\" style=\"background-color: #D3D3D3;\">0.44</td></tr>\n    <tr><td colspan=\"2\" class=\"gt_row gt_right gt_stub gt_grand_summary_row\" style=\"background-color: #FF0000;\">max</td>\n<td class=\"gt_row gt_right gt_grand_summary_row\" style=\"background-color: #D3D3D3;\">8880000.00</td>\n<td class=\"gt_row gt_left gt_grand_summary_row\">&mdash;</td>\n<td class=\"gt_row gt_center gt_grand_summary_row\">&mdash;</td>\n<td class=\"gt_row gt_left gt_grand_summary_row\">&mdash;</td>\n<td class=\"gt_row gt_left gt_grand_summary_row\">&mdash;</td>\n<td class=\"gt_row gt_left gt_grand_summary_row\">&mdash;</td>\n<td class=\"gt_row gt_right gt_grand_summary_row\" style=\"background-color: #D3D3D3;\">65100.00</td></tr>\n    <tr><td colspan=\"2\" class=\"gt_row gt_right gt_stub gt_grand_summary_row gt_last_summary_row\" style=\"background-color: #FF0000;\">avg</td>\n<td class=\"gt_row gt_right gt_grand_summary_row gt_last_summary_row\" style=\"background-color: #D3D3D3;\">1380432.87</td>\n<td class=\"gt_row gt_left gt_grand_summary_row gt_last_summary_row\">&mdash;</td>\n<td class=\"gt_row gt_center gt_grand_summary_row gt_last_summary_row\">&mdash;</td>\n<td class=\"gt_row gt_left gt_grand_summary_row gt_last_summary_row\">&mdash;</td>\n<td class=\"gt_row gt_left gt_grand_summary_row gt_last_summary_row\">&mdash;</td>\n<td class=\"gt_row gt_left gt_grand_summary_row gt_last_summary_row\">&mdash;</td>\n<td class=\"gt_row gt_right gt_grand_summary_row gt_last_summary_row\" style=\"background-color: #D3D3D3;\">9501.26</td></tr>\n  </tbody>\n  <tfoot class=\"gt_sourcenotes\">\n    <tr>\n      <td class=\"gt_sourcenote\" style=\"background-color: #F5DEB3;\" colspan=\"9\">Source note #1</td>\n    </tr>\n    <tr>\n      <td class=\"gt_sourcenote\" style=\"background-color: #F5DEB3;\" colspan=\"9\">Source note #2</td>\n    </tr>\n  </tfoot>\n  \n</table>"

