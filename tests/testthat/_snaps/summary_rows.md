# Situtations where `rowname` is a column name don't interfere with internals

    Code
      .
    Output
      [1] "<table class=\"gt_table\">\n  \n  <thead class=\"gt_col_headings\">\n    <tr>\n      <th class=\"gt_col_heading gt_columns_bottom_border gt_left\" rowspan=\"1\" colspan=\"1\"></th>\n      <th class=\"gt_col_heading gt_columns_bottom_border gt_right\" rowspan=\"1\" colspan=\"1\">num</th>\n      <th class=\"gt_col_heading gt_columns_bottom_border gt_left\" rowspan=\"1\" colspan=\"1\">char</th>\n      <th class=\"gt_col_heading gt_columns_bottom_border gt_center\" rowspan=\"1\" colspan=\"1\">fctr</th>\n      <th class=\"gt_col_heading gt_columns_bottom_border gt_left\" rowspan=\"1\" colspan=\"1\">date</th>\n      <th class=\"gt_col_heading gt_columns_bottom_border gt_left\" rowspan=\"1\" colspan=\"1\">time</th>\n      <th class=\"gt_col_heading gt_columns_bottom_border gt_left\" rowspan=\"1\" colspan=\"1\">datetime</th>\n      <th class=\"gt_col_heading gt_columns_bottom_border gt_right\" rowspan=\"1\" colspan=\"1\">currency</th>\n      <th class=\"gt_col_heading gt_columns_bottom_border gt_left\" rowspan=\"1\" colspan=\"1\">group</th>\n    </tr>\n  </thead>\n  <tbody class=\"gt_table_body\">\n    <tr><td class=\"gt_row gt_left gt_stub\">row_1</td>\n<td class=\"gt_row gt_right\">1.111e-01</td>\n<td class=\"gt_row gt_left\">apricot</td>\n<td class=\"gt_row gt_center\">one</td>\n<td class=\"gt_row gt_left\">2015-01-15</td>\n<td class=\"gt_row gt_left\">13:35</td>\n<td class=\"gt_row gt_left\">2018-01-01 02:22</td>\n<td class=\"gt_row gt_right\">49.950</td>\n<td class=\"gt_row gt_left\">grp_a</td></tr>\n    <tr><td class=\"gt_row gt_left gt_stub\">row_2</td>\n<td class=\"gt_row gt_right\">2.222e+00</td>\n<td class=\"gt_row gt_left\">banana</td>\n<td class=\"gt_row gt_center\">two</td>\n<td class=\"gt_row gt_left\">2015-02-15</td>\n<td class=\"gt_row gt_left\">14:40</td>\n<td class=\"gt_row gt_left\">2018-02-02 14:33</td>\n<td class=\"gt_row gt_right\">17.950</td>\n<td class=\"gt_row gt_left\">grp_a</td></tr>\n    <tr><td class=\"gt_row gt_left gt_stub\">row_3</td>\n<td class=\"gt_row gt_right\">3.333e+01</td>\n<td class=\"gt_row gt_left\">coconut</td>\n<td class=\"gt_row gt_center\">three</td>\n<td class=\"gt_row gt_left\">2015-03-15</td>\n<td class=\"gt_row gt_left\">15:45</td>\n<td class=\"gt_row gt_left\">2018-03-03 03:44</td>\n<td class=\"gt_row gt_right\">1.390</td>\n<td class=\"gt_row gt_left\">grp_a</td></tr>\n    <tr><td class=\"gt_row gt_left gt_stub\">row_4</td>\n<td class=\"gt_row gt_right\">4.444e+02</td>\n<td class=\"gt_row gt_left\">durian</td>\n<td class=\"gt_row gt_center\">four</td>\n<td class=\"gt_row gt_left\">2015-04-15</td>\n<td class=\"gt_row gt_left\">16:50</td>\n<td class=\"gt_row gt_left\">2018-04-04 15:55</td>\n<td class=\"gt_row gt_right\">65100.000</td>\n<td class=\"gt_row gt_left\">grp_a</td></tr>\n    <tr><td class=\"gt_row gt_left gt_stub\">row_5</td>\n<td class=\"gt_row gt_right\">5.550e+03</td>\n<td class=\"gt_row gt_left\">NA</td>\n<td class=\"gt_row gt_center\">five</td>\n<td class=\"gt_row gt_left\">2015-05-15</td>\n<td class=\"gt_row gt_left\">17:55</td>\n<td class=\"gt_row gt_left\">2018-05-05 04:00</td>\n<td class=\"gt_row gt_right\">1325.810</td>\n<td class=\"gt_row gt_left\">grp_b</td></tr>\n    <tr><td class=\"gt_row gt_left gt_stub\">row_6</td>\n<td class=\"gt_row gt_right\">NA</td>\n<td class=\"gt_row gt_left\">fig</td>\n<td class=\"gt_row gt_center\">six</td>\n<td class=\"gt_row gt_left\">2015-06-15</td>\n<td class=\"gt_row gt_left\">NA</td>\n<td class=\"gt_row gt_left\">2018-06-06 16:11</td>\n<td class=\"gt_row gt_right\">13.255</td>\n<td class=\"gt_row gt_left\">grp_b</td></tr>\n    <tr><td class=\"gt_row gt_left gt_stub\">row_7</td>\n<td class=\"gt_row gt_right\">7.770e+05</td>\n<td class=\"gt_row gt_left\">grapefruit</td>\n<td class=\"gt_row gt_center\">seven</td>\n<td class=\"gt_row gt_left\">NA</td>\n<td class=\"gt_row gt_left\">19:10</td>\n<td class=\"gt_row gt_left\">2018-07-07 05:22</td>\n<td class=\"gt_row gt_right\">NA</td>\n<td class=\"gt_row gt_left\">grp_b</td></tr>\n    <tr><td class=\"gt_row gt_left gt_stub\">row_8</td>\n<td class=\"gt_row gt_right\">8.880e+06</td>\n<td class=\"gt_row gt_left\">honeydew</td>\n<td class=\"gt_row gt_center\">eight</td>\n<td class=\"gt_row gt_left\">2015-08-15</td>\n<td class=\"gt_row gt_left\">20:20</td>\n<td class=\"gt_row gt_left\">NA</td>\n<td class=\"gt_row gt_right\">0.440</td>\n<td class=\"gt_row gt_left\">grp_b</td></tr>\n    <tr><td class=\"gt_row gt_right gt_stub gt_grand_summary_row gt_first_grand_summary_row\">min</td>\n<td class=\"gt_row gt_right gt_grand_summary_row gt_first_grand_summary_row\">0.11</td>\n<td class=\"gt_row gt_left gt_grand_summary_row gt_first_grand_summary_row\">&mdash;</td>\n<td class=\"gt_row gt_center gt_grand_summary_row gt_first_grand_summary_row\">&mdash;</td>\n<td class=\"gt_row gt_left gt_grand_summary_row gt_first_grand_summary_row\">&mdash;</td>\n<td class=\"gt_row gt_left gt_grand_summary_row gt_first_grand_summary_row\">&mdash;</td>\n<td class=\"gt_row gt_left gt_grand_summary_row gt_first_grand_summary_row\">&mdash;</td>\n<td class=\"gt_row gt_right gt_grand_summary_row gt_first_grand_summary_row\">0.44</td>\n<td class=\"gt_row gt_left gt_grand_summary_row gt_first_grand_summary_row\">&mdash;</td></tr>\n    <tr><td class=\"gt_row gt_right gt_stub gt_grand_summary_row\">max</td>\n<td class=\"gt_row gt_right gt_grand_summary_row\">8,880,000.00</td>\n<td class=\"gt_row gt_left gt_grand_summary_row\">&mdash;</td>\n<td class=\"gt_row gt_center gt_grand_summary_row\">&mdash;</td>\n<td class=\"gt_row gt_left gt_grand_summary_row\">&mdash;</td>\n<td class=\"gt_row gt_left gt_grand_summary_row\">&mdash;</td>\n<td class=\"gt_row gt_left gt_grand_summary_row\">&mdash;</td>\n<td class=\"gt_row gt_right gt_grand_summary_row\">65,100.00</td>\n<td class=\"gt_row gt_left gt_grand_summary_row\">&mdash;</td></tr>\n    <tr><td class=\"gt_row gt_right gt_stub gt_grand_summary_row gt_last_summary_row\">avg</td>\n<td class=\"gt_row gt_right gt_grand_summary_row gt_last_summary_row\">1,380,432.87</td>\n<td class=\"gt_row gt_left gt_grand_summary_row gt_last_summary_row\">&mdash;</td>\n<td class=\"gt_row gt_center gt_grand_summary_row gt_last_summary_row\">&mdash;</td>\n<td class=\"gt_row gt_left gt_grand_summary_row gt_last_summary_row\">&mdash;</td>\n<td class=\"gt_row gt_left gt_grand_summary_row gt_last_summary_row\">&mdash;</td>\n<td class=\"gt_row gt_left gt_grand_summary_row gt_last_summary_row\">&mdash;</td>\n<td class=\"gt_row gt_right gt_grand_summary_row gt_last_summary_row\">9,501.26</td>\n<td class=\"gt_row gt_left gt_grand_summary_row gt_last_summary_row\">&mdash;</td></tr>\n  </tbody>\n  \n  \n</table>"

---

    Code
      .
    Output
      [1] "\\captionsetup[table]{labelformat=empty,skip=1pt}\n\\begin{longtable}{lrlclllrl}\n\\toprule\n & num & char & fctr & date & time & datetime & currency & group \\\\ \n\\midrule\nrow\\_1 & 1.111e-01 & apricot & one & 2015-01-15 & 13:35 & 2018-01-01 02:22 & 49.950 & grp\\_a \\\\ \nrow\\_2 & 2.222e+00 & banana & two & 2015-02-15 & 14:40 & 2018-02-02 14:33 & 17.950 & grp\\_a \\\\ \nrow\\_3 & 3.333e+01 & coconut & three & 2015-03-15 & 15:45 & 2018-03-03 03:44 & 1.390 & grp\\_a \\\\ \nrow\\_4 & 4.444e+02 & durian & four & 2015-04-15 & 16:50 & 2018-04-04 15:55 & 65100.000 & grp\\_a \\\\ \nrow\\_5 & 5.550e+03 & NA & five & 2015-05-15 & 17:55 & 2018-05-05 04:00 & 1325.810 & grp\\_b \\\\ \nrow\\_6 & NA & fig & six & 2015-06-15 & NA & 2018-06-06 16:11 & 13.255 & grp\\_b \\\\ \nrow\\_7 & 7.770e+05 & grapefruit & seven & NA & 19:10 & 2018-07-07 05:22 & NA & grp\\_b \\\\ \nrow\\_8 & 8.880e+06 & honeydew & eight & 2015-08-15 & 20:20 & NA & 0.440 & grp\\_b \\\\ \n \\midrule \n\\midrule \nmin & $0.11$ & — & — & — & — & — & $0.44$ & — \\\\ \nmax & $8,880,000.00$ & — & — & — & — & — & $65,100.00$ & — \\\\ \navg & $1,380,432.87$ & — & — & — & — & — & $9,501.26$ & — \\\\ \n\\bottomrule\n\\end{longtable}\n"

---

    Code
      .
    Output
      {\rtf\ansi\ansicpg1252{\fonttbl{\f0\froman\fcharset0\fprq0 Calibri;}{\f1\froman\fcharset0\fprq0 Courier;}}{\colortbl;\red211\green211\blue211;}
      
      \trowd\trrh0\trhdr
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clbrdrt\brdrs\brdrw40\brdrcf1\clbrdrb\brdrs\brdrw40\brdrcf1\clbrdrl\brdrs\brdrw20\brdrcf1\clbrdrr\brdrs\brdrw20\brdrcf1\cellx1052
      \intbl {\f0 {\f0\fs20 }}\cell
      \pard\plain
      
      \pard\plain\uc0\qr\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clbrdrt\brdrs\brdrw40\brdrcf1\clbrdrb\brdrs\brdrw40\brdrcf1\clbrdrl\brdrs\brdrw20\brdrcf1\clbrdrr\brdrs\brdrw20\brdrcf1\cellx2104
      \intbl {\f0 {\f0\fs20 num}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clbrdrt\brdrs\brdrw40\brdrcf1\clbrdrb\brdrs\brdrw40\brdrcf1\clbrdrl\brdrs\brdrw20\brdrcf1\clbrdrr\brdrs\brdrw20\brdrcf1\cellx3156
      \intbl {\f0 {\f0\fs20 char}}\cell
      \pard\plain
      
      \pard\plain\uc0\qc\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clbrdrt\brdrs\brdrw40\brdrcf1\clbrdrb\brdrs\brdrw40\brdrcf1\clbrdrl\brdrs\brdrw20\brdrcf1\clbrdrr\brdrs\brdrw20\brdrcf1\cellx4208
      \intbl {\f0 {\f0\fs20 fctr}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clbrdrt\brdrs\brdrw40\brdrcf1\clbrdrb\brdrs\brdrw40\brdrcf1\clbrdrl\brdrs\brdrw20\brdrcf1\clbrdrr\brdrs\brdrw20\brdrcf1\cellx5260
      \intbl {\f0 {\f0\fs20 date}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clbrdrt\brdrs\brdrw40\brdrcf1\clbrdrb\brdrs\brdrw40\brdrcf1\clbrdrl\brdrs\brdrw20\brdrcf1\clbrdrr\brdrs\brdrw20\brdrcf1\cellx6312
      \intbl {\f0 {\f0\fs20 time}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clbrdrt\brdrs\brdrw40\brdrcf1\clbrdrb\brdrs\brdrw40\brdrcf1\clbrdrl\brdrs\brdrw20\brdrcf1\clbrdrr\brdrs\brdrw20\brdrcf1\cellx7364
      \intbl {\f0 {\f0\fs20 datetime}}\cell
      \pard\plain
      
      \pard\plain\uc0\qr\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clbrdrt\brdrs\brdrw40\brdrcf1\clbrdrb\brdrs\brdrw40\brdrcf1\clbrdrl\brdrs\brdrw20\brdrcf1\clbrdrr\brdrs\brdrw20\brdrcf1\cellx8416
      \intbl {\f0 {\f0\fs20 currency}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clbrdrt\brdrs\brdrw40\brdrcf1\clbrdrb\brdrs\brdrw40\brdrcf1\clbrdrl\brdrs\brdrw20\brdrcf1\clbrdrr\brdrs\brdrw20\brdrcf1\cellx9468
      \intbl {\f0 {\f0\fs20 group}}\cell
      \pard\plain
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clbrdrb\brdrs\brdrw10\brdrcf1\clbrdrl\brdrs\brdrw10\brdrcf1\clbrdrr\brdrs\brdrw10\brdrcf1\cellx1052
      \intbl {\f0 {\f0\fs20 row_1}}\cell
      \pard\plain
      
      \pard\plain\uc0\qr\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clbrdrb\brdrs\brdrw10\brdrcf1\clbrdrl\brdrs\brdrw10\brdrcf1\clbrdrr\brdrs\brdrw10\brdrcf1\cellx2104
      \intbl {\f0 {\f0\fs20 1.111e-01}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clbrdrb\brdrs\brdrw10\brdrcf1\clbrdrl\brdrs\brdrw10\brdrcf1\clbrdrr\brdrs\brdrw10\brdrcf1\cellx3156
      \intbl {\f0 {\f0\fs20 apricot}}\cell
      \pard\plain
      
      \pard\plain\uc0\qc\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clbrdrb\brdrs\brdrw10\brdrcf1\clbrdrl\brdrs\brdrw10\brdrcf1\clbrdrr\brdrs\brdrw10\brdrcf1\cellx4208
      \intbl {\f0 {\f0\fs20 one}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clbrdrb\brdrs\brdrw10\brdrcf1\clbrdrl\brdrs\brdrw10\brdrcf1\clbrdrr\brdrs\brdrw10\brdrcf1\cellx5260
      \intbl {\f0 {\f0\fs20 2015-01-15}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clbrdrb\brdrs\brdrw10\brdrcf1\clbrdrl\brdrs\brdrw10\brdrcf1\clbrdrr\brdrs\brdrw10\brdrcf1\cellx6312
      \intbl {\f0 {\f0\fs20 13:35}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clbrdrb\brdrs\brdrw10\brdrcf1\clbrdrl\brdrs\brdrw10\brdrcf1\clbrdrr\brdrs\brdrw10\brdrcf1\cellx7364
      \intbl {\f0 {\f0\fs20 2018-01-01 02:22}}\cell
      \pard\plain
      
      \pard\plain\uc0\qr\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clbrdrb\brdrs\brdrw10\brdrcf1\clbrdrl\brdrs\brdrw10\brdrcf1\clbrdrr\brdrs\brdrw10\brdrcf1\cellx8416
      \intbl {\f0 {\f0\fs20 49.950}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clbrdrb\brdrs\brdrw10\brdrcf1\clbrdrl\brdrs\brdrw10\brdrcf1\clbrdrr\brdrs\brdrw10\brdrcf1\cellx9468
      \intbl {\f0 {\f0\fs20 grp_a}}\cell
      \pard\plain
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clbrdrb\brdrs\brdrw10\brdrcf1\clbrdrl\brdrs\brdrw10\brdrcf1\clbrdrr\brdrs\brdrw10\brdrcf1\cellx1052
      \intbl {\f0 {\f0\fs20 row_2}}\cell
      \pard\plain
      
      \pard\plain\uc0\qr\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clbrdrb\brdrs\brdrw10\brdrcf1\clbrdrl\brdrs\brdrw10\brdrcf1\clbrdrr\brdrs\brdrw10\brdrcf1\cellx2104
      \intbl {\f0 {\f0\fs20 2.222e+00}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clbrdrb\brdrs\brdrw10\brdrcf1\clbrdrl\brdrs\brdrw10\brdrcf1\clbrdrr\brdrs\brdrw10\brdrcf1\cellx3156
      \intbl {\f0 {\f0\fs20 banana}}\cell
      \pard\plain
      
      \pard\plain\uc0\qc\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clbrdrb\brdrs\brdrw10\brdrcf1\clbrdrl\brdrs\brdrw10\brdrcf1\clbrdrr\brdrs\brdrw10\brdrcf1\cellx4208
      \intbl {\f0 {\f0\fs20 two}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clbrdrb\brdrs\brdrw10\brdrcf1\clbrdrl\brdrs\brdrw10\brdrcf1\clbrdrr\brdrs\brdrw10\brdrcf1\cellx5260
      \intbl {\f0 {\f0\fs20 2015-02-15}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clbrdrb\brdrs\brdrw10\brdrcf1\clbrdrl\brdrs\brdrw10\brdrcf1\clbrdrr\brdrs\brdrw10\brdrcf1\cellx6312
      \intbl {\f0 {\f0\fs20 14:40}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clbrdrb\brdrs\brdrw10\brdrcf1\clbrdrl\brdrs\brdrw10\brdrcf1\clbrdrr\brdrs\brdrw10\brdrcf1\cellx7364
      \intbl {\f0 {\f0\fs20 2018-02-02 14:33}}\cell
      \pard\plain
      
      \pard\plain\uc0\qr\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clbrdrb\brdrs\brdrw10\brdrcf1\clbrdrl\brdrs\brdrw10\brdrcf1\clbrdrr\brdrs\brdrw10\brdrcf1\cellx8416
      \intbl {\f0 {\f0\fs20 17.950}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clbrdrb\brdrs\brdrw10\brdrcf1\clbrdrl\brdrs\brdrw10\brdrcf1\clbrdrr\brdrs\brdrw10\brdrcf1\cellx9468
      \intbl {\f0 {\f0\fs20 grp_a}}\cell
      \pard\plain
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clbrdrb\brdrs\brdrw10\brdrcf1\clbrdrl\brdrs\brdrw10\brdrcf1\clbrdrr\brdrs\brdrw10\brdrcf1\cellx1052
      \intbl {\f0 {\f0\fs20 row_3}}\cell
      \pard\plain
      
      \pard\plain\uc0\qr\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clbrdrb\brdrs\brdrw10\brdrcf1\clbrdrl\brdrs\brdrw10\brdrcf1\clbrdrr\brdrs\brdrw10\brdrcf1\cellx2104
      \intbl {\f0 {\f0\fs20 3.333e+01}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clbrdrb\brdrs\brdrw10\brdrcf1\clbrdrl\brdrs\brdrw10\brdrcf1\clbrdrr\brdrs\brdrw10\brdrcf1\cellx3156
      \intbl {\f0 {\f0\fs20 coconut}}\cell
      \pard\plain
      
      \pard\plain\uc0\qc\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clbrdrb\brdrs\brdrw10\brdrcf1\clbrdrl\brdrs\brdrw10\brdrcf1\clbrdrr\brdrs\brdrw10\brdrcf1\cellx4208
      \intbl {\f0 {\f0\fs20 three}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clbrdrb\brdrs\brdrw10\brdrcf1\clbrdrl\brdrs\brdrw10\brdrcf1\clbrdrr\brdrs\brdrw10\brdrcf1\cellx5260
      \intbl {\f0 {\f0\fs20 2015-03-15}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clbrdrb\brdrs\brdrw10\brdrcf1\clbrdrl\brdrs\brdrw10\brdrcf1\clbrdrr\brdrs\brdrw10\brdrcf1\cellx6312
      \intbl {\f0 {\f0\fs20 15:45}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clbrdrb\brdrs\brdrw10\brdrcf1\clbrdrl\brdrs\brdrw10\brdrcf1\clbrdrr\brdrs\brdrw10\brdrcf1\cellx7364
      \intbl {\f0 {\f0\fs20 2018-03-03 03:44}}\cell
      \pard\plain
      
      \pard\plain\uc0\qr\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clbrdrb\brdrs\brdrw10\brdrcf1\clbrdrl\brdrs\brdrw10\brdrcf1\clbrdrr\brdrs\brdrw10\brdrcf1\cellx8416
      \intbl {\f0 {\f0\fs20 1.390}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clbrdrb\brdrs\brdrw10\brdrcf1\clbrdrl\brdrs\brdrw10\brdrcf1\clbrdrr\brdrs\brdrw10\brdrcf1\cellx9468
      \intbl {\f0 {\f0\fs20 grp_a}}\cell
      \pard\plain
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clbrdrb\brdrs\brdrw10\brdrcf1\clbrdrl\brdrs\brdrw10\brdrcf1\clbrdrr\brdrs\brdrw10\brdrcf1\cellx1052
      \intbl {\f0 {\f0\fs20 row_4}}\cell
      \pard\plain
      
      \pard\plain\uc0\qr\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clbrdrb\brdrs\brdrw10\brdrcf1\clbrdrl\brdrs\brdrw10\brdrcf1\clbrdrr\brdrs\brdrw10\brdrcf1\cellx2104
      \intbl {\f0 {\f0\fs20 4.444e+02}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clbrdrb\brdrs\brdrw10\brdrcf1\clbrdrl\brdrs\brdrw10\brdrcf1\clbrdrr\brdrs\brdrw10\brdrcf1\cellx3156
      \intbl {\f0 {\f0\fs20 durian}}\cell
      \pard\plain
      
      \pard\plain\uc0\qc\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clbrdrb\brdrs\brdrw10\brdrcf1\clbrdrl\brdrs\brdrw10\brdrcf1\clbrdrr\brdrs\brdrw10\brdrcf1\cellx4208
      \intbl {\f0 {\f0\fs20 four}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clbrdrb\brdrs\brdrw10\brdrcf1\clbrdrl\brdrs\brdrw10\brdrcf1\clbrdrr\brdrs\brdrw10\brdrcf1\cellx5260
      \intbl {\f0 {\f0\fs20 2015-04-15}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clbrdrb\brdrs\brdrw10\brdrcf1\clbrdrl\brdrs\brdrw10\brdrcf1\clbrdrr\brdrs\brdrw10\brdrcf1\cellx6312
      \intbl {\f0 {\f0\fs20 16:50}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clbrdrb\brdrs\brdrw10\brdrcf1\clbrdrl\brdrs\brdrw10\brdrcf1\clbrdrr\brdrs\brdrw10\brdrcf1\cellx7364
      \intbl {\f0 {\f0\fs20 2018-04-04 15:55}}\cell
      \pard\plain
      
      \pard\plain\uc0\qr\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clbrdrb\brdrs\brdrw10\brdrcf1\clbrdrl\brdrs\brdrw10\brdrcf1\clbrdrr\brdrs\brdrw10\brdrcf1\cellx8416
      \intbl {\f0 {\f0\fs20 65100.000}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clbrdrb\brdrs\brdrw10\brdrcf1\clbrdrl\brdrs\brdrw10\brdrcf1\clbrdrr\brdrs\brdrw10\brdrcf1\cellx9468
      \intbl {\f0 {\f0\fs20 grp_a}}\cell
      \pard\plain
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clbrdrb\brdrs\brdrw10\brdrcf1\clbrdrl\brdrs\brdrw10\brdrcf1\clbrdrr\brdrs\brdrw10\brdrcf1\cellx1052
      \intbl {\f0 {\f0\fs20 row_5}}\cell
      \pard\plain
      
      \pard\plain\uc0\qr\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clbrdrb\brdrs\brdrw10\brdrcf1\clbrdrl\brdrs\brdrw10\brdrcf1\clbrdrr\brdrs\brdrw10\brdrcf1\cellx2104
      \intbl {\f0 {\f0\fs20 5.550e+03}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clbrdrb\brdrs\brdrw10\brdrcf1\clbrdrl\brdrs\brdrw10\brdrcf1\clbrdrr\brdrs\brdrw10\brdrcf1\cellx3156
      \intbl {\f0 {\f0\fs20 NA}}\cell
      \pard\plain
      
      \pard\plain\uc0\qc\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clbrdrb\brdrs\brdrw10\brdrcf1\clbrdrl\brdrs\brdrw10\brdrcf1\clbrdrr\brdrs\brdrw10\brdrcf1\cellx4208
      \intbl {\f0 {\f0\fs20 five}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clbrdrb\brdrs\brdrw10\brdrcf1\clbrdrl\brdrs\brdrw10\brdrcf1\clbrdrr\brdrs\brdrw10\brdrcf1\cellx5260
      \intbl {\f0 {\f0\fs20 2015-05-15}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clbrdrb\brdrs\brdrw10\brdrcf1\clbrdrl\brdrs\brdrw10\brdrcf1\clbrdrr\brdrs\brdrw10\brdrcf1\cellx6312
      \intbl {\f0 {\f0\fs20 17:55}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clbrdrb\brdrs\brdrw10\brdrcf1\clbrdrl\brdrs\brdrw10\brdrcf1\clbrdrr\brdrs\brdrw10\brdrcf1\cellx7364
      \intbl {\f0 {\f0\fs20 2018-05-05 04:00}}\cell
      \pard\plain
      
      \pard\plain\uc0\qr\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clbrdrb\brdrs\brdrw10\brdrcf1\clbrdrl\brdrs\brdrw10\brdrcf1\clbrdrr\brdrs\brdrw10\brdrcf1\cellx8416
      \intbl {\f0 {\f0\fs20 1325.810}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clbrdrb\brdrs\brdrw10\brdrcf1\clbrdrl\brdrs\brdrw10\brdrcf1\clbrdrr\brdrs\brdrw10\brdrcf1\cellx9468
      \intbl {\f0 {\f0\fs20 grp_b}}\cell
      \pard\plain
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clbrdrb\brdrs\brdrw10\brdrcf1\clbrdrl\brdrs\brdrw10\brdrcf1\clbrdrr\brdrs\brdrw10\brdrcf1\cellx1052
      \intbl {\f0 {\f0\fs20 row_6}}\cell
      \pard\plain
      
      \pard\plain\uc0\qr\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clbrdrb\brdrs\brdrw10\brdrcf1\clbrdrl\brdrs\brdrw10\brdrcf1\clbrdrr\brdrs\brdrw10\brdrcf1\cellx2104
      \intbl {\f0 {\f0\fs20 NA}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clbrdrb\brdrs\brdrw10\brdrcf1\clbrdrl\brdrs\brdrw10\brdrcf1\clbrdrr\brdrs\brdrw10\brdrcf1\cellx3156
      \intbl {\f0 {\f0\fs20 fig}}\cell
      \pard\plain
      
      \pard\plain\uc0\qc\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clbrdrb\brdrs\brdrw10\brdrcf1\clbrdrl\brdrs\brdrw10\brdrcf1\clbrdrr\brdrs\brdrw10\brdrcf1\cellx4208
      \intbl {\f0 {\f0\fs20 six}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clbrdrb\brdrs\brdrw10\brdrcf1\clbrdrl\brdrs\brdrw10\brdrcf1\clbrdrr\brdrs\brdrw10\brdrcf1\cellx5260
      \intbl {\f0 {\f0\fs20 2015-06-15}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clbrdrb\brdrs\brdrw10\brdrcf1\clbrdrl\brdrs\brdrw10\brdrcf1\clbrdrr\brdrs\brdrw10\brdrcf1\cellx6312
      \intbl {\f0 {\f0\fs20 NA}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clbrdrb\brdrs\brdrw10\brdrcf1\clbrdrl\brdrs\brdrw10\brdrcf1\clbrdrr\brdrs\brdrw10\brdrcf1\cellx7364
      \intbl {\f0 {\f0\fs20 2018-06-06 16:11}}\cell
      \pard\plain
      
      \pard\plain\uc0\qr\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clbrdrb\brdrs\brdrw10\brdrcf1\clbrdrl\brdrs\brdrw10\brdrcf1\clbrdrr\brdrs\brdrw10\brdrcf1\cellx8416
      \intbl {\f0 {\f0\fs20 13.255}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clbrdrb\brdrs\brdrw10\brdrcf1\clbrdrl\brdrs\brdrw10\brdrcf1\clbrdrr\brdrs\brdrw10\brdrcf1\cellx9468
      \intbl {\f0 {\f0\fs20 grp_b}}\cell
      \pard\plain
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clbrdrb\brdrs\brdrw10\brdrcf1\clbrdrl\brdrs\brdrw10\brdrcf1\clbrdrr\brdrs\brdrw10\brdrcf1\cellx1052
      \intbl {\f0 {\f0\fs20 row_7}}\cell
      \pard\plain
      
      \pard\plain\uc0\qr\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clbrdrb\brdrs\brdrw10\brdrcf1\clbrdrl\brdrs\brdrw10\brdrcf1\clbrdrr\brdrs\brdrw10\brdrcf1\cellx2104
      \intbl {\f0 {\f0\fs20 7.770e+05}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clbrdrb\brdrs\brdrw10\brdrcf1\clbrdrl\brdrs\brdrw10\brdrcf1\clbrdrr\brdrs\brdrw10\brdrcf1\cellx3156
      \intbl {\f0 {\f0\fs20 grapefruit}}\cell
      \pard\plain
      
      \pard\plain\uc0\qc\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clbrdrb\brdrs\brdrw10\brdrcf1\clbrdrl\brdrs\brdrw10\brdrcf1\clbrdrr\brdrs\brdrw10\brdrcf1\cellx4208
      \intbl {\f0 {\f0\fs20 seven}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clbrdrb\brdrs\brdrw10\brdrcf1\clbrdrl\brdrs\brdrw10\brdrcf1\clbrdrr\brdrs\brdrw10\brdrcf1\cellx5260
      \intbl {\f0 {\f0\fs20 NA}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clbrdrb\brdrs\brdrw10\brdrcf1\clbrdrl\brdrs\brdrw10\brdrcf1\clbrdrr\brdrs\brdrw10\brdrcf1\cellx6312
      \intbl {\f0 {\f0\fs20 19:10}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clbrdrb\brdrs\brdrw10\brdrcf1\clbrdrl\brdrs\brdrw10\brdrcf1\clbrdrr\brdrs\brdrw10\brdrcf1\cellx7364
      \intbl {\f0 {\f0\fs20 2018-07-07 05:22}}\cell
      \pard\plain
      
      \pard\plain\uc0\qr\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clbrdrb\brdrs\brdrw10\brdrcf1\clbrdrl\brdrs\brdrw10\brdrcf1\clbrdrr\brdrs\brdrw10\brdrcf1\cellx8416
      \intbl {\f0 {\f0\fs20 NA}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clbrdrb\brdrs\brdrw10\brdrcf1\clbrdrl\brdrs\brdrw10\brdrcf1\clbrdrr\brdrs\brdrw10\brdrcf1\cellx9468
      \intbl {\f0 {\f0\fs20 grp_b}}\cell
      \pard\plain
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clbrdrb\brdrs\brdrw10\brdrcf1\clbrdrl\brdrs\brdrw10\brdrcf1\clbrdrr\brdrs\brdrw10\brdrcf1\cellx1052
      \intbl {\f0 {\f0\fs20 row_8}}\cell
      \pard\plain
      
      \pard\plain\uc0\qr\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clbrdrb\brdrs\brdrw10\brdrcf1\clbrdrl\brdrs\brdrw10\brdrcf1\clbrdrr\brdrs\brdrw10\brdrcf1\cellx2104
      \intbl {\f0 {\f0\fs20 8.880e+06}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clbrdrb\brdrs\brdrw10\brdrcf1\clbrdrl\brdrs\brdrw10\brdrcf1\clbrdrr\brdrs\brdrw10\brdrcf1\cellx3156
      \intbl {\f0 {\f0\fs20 honeydew}}\cell
      \pard\plain
      
      \pard\plain\uc0\qc\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clbrdrb\brdrs\brdrw10\brdrcf1\clbrdrl\brdrs\brdrw10\brdrcf1\clbrdrr\brdrs\brdrw10\brdrcf1\cellx4208
      \intbl {\f0 {\f0\fs20 eight}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clbrdrb\brdrs\brdrw10\brdrcf1\clbrdrl\brdrs\brdrw10\brdrcf1\clbrdrr\brdrs\brdrw10\brdrcf1\cellx5260
      \intbl {\f0 {\f0\fs20 2015-08-15}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clbrdrb\brdrs\brdrw10\brdrcf1\clbrdrl\brdrs\brdrw10\brdrcf1\clbrdrr\brdrs\brdrw10\brdrcf1\cellx6312
      \intbl {\f0 {\f0\fs20 20:20}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clbrdrb\brdrs\brdrw10\brdrcf1\clbrdrl\brdrs\brdrw10\brdrcf1\clbrdrr\brdrs\brdrw10\brdrcf1\cellx7364
      \intbl {\f0 {\f0\fs20 NA}}\cell
      \pard\plain
      
      \pard\plain\uc0\qr\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clbrdrb\brdrs\brdrw10\brdrcf1\clbrdrl\brdrs\brdrw10\brdrcf1\clbrdrr\brdrs\brdrw10\brdrcf1\cellx8416
      \intbl {\f0 {\f0\fs20 0.440}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clbrdrb\brdrs\brdrw10\brdrcf1\clbrdrl\brdrs\brdrw10\brdrcf1\clbrdrr\brdrs\brdrw10\brdrcf1\cellx9468
      \intbl {\f0 {\f0\fs20 grp_b}}\cell
      \pard\plain
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clbrdrb\brdrs\brdrw10\brdrcf1\clbrdrl\brdrs\brdrw10\brdrcf1\clbrdrr\brdrs\brdrw10\brdrcf1\clbrdrt\brdrdb\brdrw50\brdrcf1\cellx1052
      \intbl {\f0 {\f0\fs20 min}}\cell
      \pard\plain
      
      \pard\plain\uc0\qr\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clbrdrb\brdrs\brdrw10\brdrcf1\clbrdrl\brdrs\brdrw10\brdrcf1\clbrdrr\brdrs\brdrw10\brdrcf1\clbrdrt\brdrdb\brdrw50\brdrcf1\cellx2104
      \intbl {\f0 {\f0\fs20 0.11}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clbrdrb\brdrs\brdrw10\brdrcf1\clbrdrl\brdrs\brdrw10\brdrcf1\clbrdrr\brdrs\brdrw10\brdrcf1\clbrdrt\brdrdb\brdrw50\brdrcf1\cellx3156
      \intbl {\f0 {\f0\fs20 \'97}}\cell
      \pard\plain
      
      \pard\plain\uc0\qc\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clbrdrb\brdrs\brdrw10\brdrcf1\clbrdrl\brdrs\brdrw10\brdrcf1\clbrdrr\brdrs\brdrw10\brdrcf1\clbrdrt\brdrdb\brdrw50\brdrcf1\cellx4208
      \intbl {\f0 {\f0\fs20 \'97}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clbrdrb\brdrs\brdrw10\brdrcf1\clbrdrl\brdrs\brdrw10\brdrcf1\clbrdrr\brdrs\brdrw10\brdrcf1\clbrdrt\brdrdb\brdrw50\brdrcf1\cellx5260
      \intbl {\f0 {\f0\fs20 \'97}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clbrdrb\brdrs\brdrw10\brdrcf1\clbrdrl\brdrs\brdrw10\brdrcf1\clbrdrr\brdrs\brdrw10\brdrcf1\clbrdrt\brdrdb\brdrw50\brdrcf1\cellx6312
      \intbl {\f0 {\f0\fs20 \'97}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clbrdrb\brdrs\brdrw10\brdrcf1\clbrdrl\brdrs\brdrw10\brdrcf1\clbrdrr\brdrs\brdrw10\brdrcf1\clbrdrt\brdrdb\brdrw50\brdrcf1\cellx7364
      \intbl {\f0 {\f0\fs20 \'97}}\cell
      \pard\plain
      
      \pard\plain\uc0\qr\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clbrdrb\brdrs\brdrw10\brdrcf1\clbrdrl\brdrs\brdrw10\brdrcf1\clbrdrr\brdrs\brdrw10\brdrcf1\clbrdrt\brdrdb\brdrw50\brdrcf1\cellx8416
      \intbl {\f0 {\f0\fs20 0.44}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clbrdrb\brdrs\brdrw10\brdrcf1\clbrdrl\brdrs\brdrw10\brdrcf1\clbrdrr\brdrs\brdrw10\brdrcf1\clbrdrt\brdrdb\brdrw50\brdrcf1\cellx9468
      \intbl {\f0 {\f0\fs20 \'97}}\cell
      \pard\plain
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clbrdrb\brdrs\brdrw10\brdrcf1\clbrdrl\brdrs\brdrw10\brdrcf1\clbrdrr\brdrs\brdrw10\brdrcf1\clbrdrt\brdrs\brdrw10\brdrcf1\cellx1052
      \intbl {\f0 {\f0\fs20 max}}\cell
      \pard\plain
      
      \pard\plain\uc0\qr\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clbrdrb\brdrs\brdrw10\brdrcf1\clbrdrl\brdrs\brdrw10\brdrcf1\clbrdrr\brdrs\brdrw10\brdrcf1\clbrdrt\brdrs\brdrw10\brdrcf1\cellx2104
      \intbl {\f0 {\f0\fs20 8,880,000.00}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clbrdrb\brdrs\brdrw10\brdrcf1\clbrdrl\brdrs\brdrw10\brdrcf1\clbrdrr\brdrs\brdrw10\brdrcf1\clbrdrt\brdrs\brdrw10\brdrcf1\cellx3156
      \intbl {\f0 {\f0\fs20 \'97}}\cell
      \pard\plain
      
      \pard\plain\uc0\qc\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clbrdrb\brdrs\brdrw10\brdrcf1\clbrdrl\brdrs\brdrw10\brdrcf1\clbrdrr\brdrs\brdrw10\brdrcf1\clbrdrt\brdrs\brdrw10\brdrcf1\cellx4208
      \intbl {\f0 {\f0\fs20 \'97}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clbrdrb\brdrs\brdrw10\brdrcf1\clbrdrl\brdrs\brdrw10\brdrcf1\clbrdrr\brdrs\brdrw10\brdrcf1\clbrdrt\brdrs\brdrw10\brdrcf1\cellx5260
      \intbl {\f0 {\f0\fs20 \'97}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clbrdrb\brdrs\brdrw10\brdrcf1\clbrdrl\brdrs\brdrw10\brdrcf1\clbrdrr\brdrs\brdrw10\brdrcf1\clbrdrt\brdrs\brdrw10\brdrcf1\cellx6312
      \intbl {\f0 {\f0\fs20 \'97}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clbrdrb\brdrs\brdrw10\brdrcf1\clbrdrl\brdrs\brdrw10\brdrcf1\clbrdrr\brdrs\brdrw10\brdrcf1\clbrdrt\brdrs\brdrw10\brdrcf1\cellx7364
      \intbl {\f0 {\f0\fs20 \'97}}\cell
      \pard\plain
      
      \pard\plain\uc0\qr\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clbrdrb\brdrs\brdrw10\brdrcf1\clbrdrl\brdrs\brdrw10\brdrcf1\clbrdrr\brdrs\brdrw10\brdrcf1\clbrdrt\brdrs\brdrw10\brdrcf1\cellx8416
      \intbl {\f0 {\f0\fs20 65,100.00}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clbrdrb\brdrs\brdrw10\brdrcf1\clbrdrl\brdrs\brdrw10\brdrcf1\clbrdrr\brdrs\brdrw10\brdrcf1\clbrdrt\brdrs\brdrw10\brdrcf1\cellx9468
      \intbl {\f0 {\f0\fs20 \'97}}\cell
      \pard\plain
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clbrdrb\brdrs\brdrw50\brdrcf1\clbrdrl\brdrs\brdrw10\brdrcf1\clbrdrr\brdrs\brdrw10\brdrcf1\clbrdrt\brdrs\brdrw10\brdrcf1\cellx1052
      \intbl {\f0 {\f0\fs20 avg}}\cell
      \pard\plain
      
      \pard\plain\uc0\qr\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clbrdrb\brdrs\brdrw50\brdrcf1\clbrdrl\brdrs\brdrw10\brdrcf1\clbrdrr\brdrs\brdrw10\brdrcf1\clbrdrt\brdrs\brdrw10\brdrcf1\cellx2104
      \intbl {\f0 {\f0\fs20 1,380,432.87}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clbrdrb\brdrs\brdrw50\brdrcf1\clbrdrl\brdrs\brdrw10\brdrcf1\clbrdrr\brdrs\brdrw10\brdrcf1\clbrdrt\brdrs\brdrw10\brdrcf1\cellx3156
      \intbl {\f0 {\f0\fs20 \'97}}\cell
      \pard\plain
      
      \pard\plain\uc0\qc\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clbrdrb\brdrs\brdrw50\brdrcf1\clbrdrl\brdrs\brdrw10\brdrcf1\clbrdrr\brdrs\brdrw10\brdrcf1\clbrdrt\brdrs\brdrw10\brdrcf1\cellx4208
      \intbl {\f0 {\f0\fs20 \'97}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clbrdrb\brdrs\brdrw50\brdrcf1\clbrdrl\brdrs\brdrw10\brdrcf1\clbrdrr\brdrs\brdrw10\brdrcf1\clbrdrt\brdrs\brdrw10\brdrcf1\cellx5260
      \intbl {\f0 {\f0\fs20 \'97}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clbrdrb\brdrs\brdrw50\brdrcf1\clbrdrl\brdrs\brdrw10\brdrcf1\clbrdrr\brdrs\brdrw10\brdrcf1\clbrdrt\brdrs\brdrw10\brdrcf1\cellx6312
      \intbl {\f0 {\f0\fs20 \'97}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clbrdrb\brdrs\brdrw50\brdrcf1\clbrdrl\brdrs\brdrw10\brdrcf1\clbrdrr\brdrs\brdrw10\brdrcf1\clbrdrt\brdrs\brdrw10\brdrcf1\cellx7364
      \intbl {\f0 {\f0\fs20 \'97}}\cell
      \pard\plain
      
      \pard\plain\uc0\qr\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clbrdrb\brdrs\brdrw50\brdrcf1\clbrdrl\brdrs\brdrw10\brdrcf1\clbrdrr\brdrs\brdrw10\brdrcf1\clbrdrt\brdrs\brdrw10\brdrcf1\cellx8416
      \intbl {\f0 {\f0\fs20 9,501.26}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clbrdrb\brdrs\brdrw50\brdrcf1\clbrdrl\brdrs\brdrw10\brdrcf1\clbrdrr\brdrs\brdrw10\brdrcf1\clbrdrt\brdrs\brdrw10\brdrcf1\cellx9468
      \intbl {\f0 {\f0\fs20 \'97}}\cell
      \pard\plain
      
      \row
      
      }

---

    Code
      .
    Output
      [1] "<table class=\"gt_table\">\n  \n  <thead class=\"gt_col_headings\">\n    <tr>\n      <th class=\"gt_col_heading gt_columns_bottom_border gt_left\" rowspan=\"1\" colspan=\"1\"></th>\n      <th class=\"gt_col_heading gt_columns_bottom_border gt_right\" rowspan=\"1\" colspan=\"1\">num</th>\n      <th class=\"gt_col_heading gt_columns_bottom_border gt_left\" rowspan=\"1\" colspan=\"1\">char</th>\n      <th class=\"gt_col_heading gt_columns_bottom_border gt_center\" rowspan=\"1\" colspan=\"1\">fctr</th>\n      <th class=\"gt_col_heading gt_columns_bottom_border gt_left\" rowspan=\"1\" colspan=\"1\">date</th>\n      <th class=\"gt_col_heading gt_columns_bottom_border gt_left\" rowspan=\"1\" colspan=\"1\">time</th>\n      <th class=\"gt_col_heading gt_columns_bottom_border gt_left\" rowspan=\"1\" colspan=\"1\">datetime</th>\n      <th class=\"gt_col_heading gt_columns_bottom_border gt_right\" rowspan=\"1\" colspan=\"1\">currency</th>\n      <th class=\"gt_col_heading gt_columns_bottom_border gt_left\" rowspan=\"1\" colspan=\"1\">rowname</th>\n      <th class=\"gt_col_heading gt_columns_bottom_border gt_left\" rowspan=\"1\" colspan=\"1\">group</th>\n    </tr>\n  </thead>\n  <tbody class=\"gt_table_body\">\n    <tr><td class=\"gt_row gt_left gt_stub\"></td>\n<td class=\"gt_row gt_right\">1.111e-01</td>\n<td class=\"gt_row gt_left\">apricot</td>\n<td class=\"gt_row gt_center\">one</td>\n<td class=\"gt_row gt_left\">2015-01-15</td>\n<td class=\"gt_row gt_left\">13:35</td>\n<td class=\"gt_row gt_left\">2018-01-01 02:22</td>\n<td class=\"gt_row gt_right\">49.950</td>\n<td class=\"gt_row gt_left\">row_1</td>\n<td class=\"gt_row gt_left\">grp_a</td></tr>\n    <tr><td class=\"gt_row gt_left gt_stub\"></td>\n<td class=\"gt_row gt_right\">2.222e+00</td>\n<td class=\"gt_row gt_left\">banana</td>\n<td class=\"gt_row gt_center\">two</td>\n<td class=\"gt_row gt_left\">2015-02-15</td>\n<td class=\"gt_row gt_left\">14:40</td>\n<td class=\"gt_row gt_left\">2018-02-02 14:33</td>\n<td class=\"gt_row gt_right\">17.950</td>\n<td class=\"gt_row gt_left\">row_2</td>\n<td class=\"gt_row gt_left\">grp_a</td></tr>\n    <tr><td class=\"gt_row gt_left gt_stub\"></td>\n<td class=\"gt_row gt_right\">3.333e+01</td>\n<td class=\"gt_row gt_left\">coconut</td>\n<td class=\"gt_row gt_center\">three</td>\n<td class=\"gt_row gt_left\">2015-03-15</td>\n<td class=\"gt_row gt_left\">15:45</td>\n<td class=\"gt_row gt_left\">2018-03-03 03:44</td>\n<td class=\"gt_row gt_right\">1.390</td>\n<td class=\"gt_row gt_left\">row_3</td>\n<td class=\"gt_row gt_left\">grp_a</td></tr>\n    <tr><td class=\"gt_row gt_left gt_stub\"></td>\n<td class=\"gt_row gt_right\">4.444e+02</td>\n<td class=\"gt_row gt_left\">durian</td>\n<td class=\"gt_row gt_center\">four</td>\n<td class=\"gt_row gt_left\">2015-04-15</td>\n<td class=\"gt_row gt_left\">16:50</td>\n<td class=\"gt_row gt_left\">2018-04-04 15:55</td>\n<td class=\"gt_row gt_right\">65100.000</td>\n<td class=\"gt_row gt_left\">row_4</td>\n<td class=\"gt_row gt_left\">grp_a</td></tr>\n    <tr><td class=\"gt_row gt_left gt_stub\"></td>\n<td class=\"gt_row gt_right\">5.550e+03</td>\n<td class=\"gt_row gt_left\">NA</td>\n<td class=\"gt_row gt_center\">five</td>\n<td class=\"gt_row gt_left\">2015-05-15</td>\n<td class=\"gt_row gt_left\">17:55</td>\n<td class=\"gt_row gt_left\">2018-05-05 04:00</td>\n<td class=\"gt_row gt_right\">1325.810</td>\n<td class=\"gt_row gt_left\">row_5</td>\n<td class=\"gt_row gt_left\">grp_b</td></tr>\n    <tr><td class=\"gt_row gt_left gt_stub\"></td>\n<td class=\"gt_row gt_right\">NA</td>\n<td class=\"gt_row gt_left\">fig</td>\n<td class=\"gt_row gt_center\">six</td>\n<td class=\"gt_row gt_left\">2015-06-15</td>\n<td class=\"gt_row gt_left\">NA</td>\n<td class=\"gt_row gt_left\">2018-06-06 16:11</td>\n<td class=\"gt_row gt_right\">13.255</td>\n<td class=\"gt_row gt_left\">row_6</td>\n<td class=\"gt_row gt_left\">grp_b</td></tr>\n    <tr><td class=\"gt_row gt_left gt_stub\"></td>\n<td class=\"gt_row gt_right\">7.770e+05</td>\n<td class=\"gt_row gt_left\">grapefruit</td>\n<td class=\"gt_row gt_center\">seven</td>\n<td class=\"gt_row gt_left\">NA</td>\n<td class=\"gt_row gt_left\">19:10</td>\n<td class=\"gt_row gt_left\">2018-07-07 05:22</td>\n<td class=\"gt_row gt_right\">NA</td>\n<td class=\"gt_row gt_left\">row_7</td>\n<td class=\"gt_row gt_left\">grp_b</td></tr>\n    <tr><td class=\"gt_row gt_left gt_stub\"></td>\n<td class=\"gt_row gt_right\">8.880e+06</td>\n<td class=\"gt_row gt_left\">honeydew</td>\n<td class=\"gt_row gt_center\">eight</td>\n<td class=\"gt_row gt_left\">2015-08-15</td>\n<td class=\"gt_row gt_left\">20:20</td>\n<td class=\"gt_row gt_left\">NA</td>\n<td class=\"gt_row gt_right\">0.440</td>\n<td class=\"gt_row gt_left\">row_8</td>\n<td class=\"gt_row gt_left\">grp_b</td></tr>\n    <tr><td class=\"gt_row gt_right gt_stub gt_grand_summary_row gt_first_grand_summary_row\">min</td>\n<td class=\"gt_row gt_right gt_grand_summary_row gt_first_grand_summary_row\">0.11</td>\n<td class=\"gt_row gt_left gt_grand_summary_row gt_first_grand_summary_row\">&mdash;</td>\n<td class=\"gt_row gt_center gt_grand_summary_row gt_first_grand_summary_row\">&mdash;</td>\n<td class=\"gt_row gt_left gt_grand_summary_row gt_first_grand_summary_row\">&mdash;</td>\n<td class=\"gt_row gt_left gt_grand_summary_row gt_first_grand_summary_row\">&mdash;</td>\n<td class=\"gt_row gt_left gt_grand_summary_row gt_first_grand_summary_row\">&mdash;</td>\n<td class=\"gt_row gt_right gt_grand_summary_row gt_first_grand_summary_row\">0.44</td>\n<td class=\"gt_row gt_left gt_grand_summary_row gt_first_grand_summary_row\">&mdash;</td>\n<td class=\"gt_row gt_left gt_grand_summary_row gt_first_grand_summary_row\">&mdash;</td></tr>\n    <tr><td class=\"gt_row gt_right gt_stub gt_grand_summary_row\">max</td>\n<td class=\"gt_row gt_right gt_grand_summary_row\">8,880,000.00</td>\n<td class=\"gt_row gt_left gt_grand_summary_row\">&mdash;</td>\n<td class=\"gt_row gt_center gt_grand_summary_row\">&mdash;</td>\n<td class=\"gt_row gt_left gt_grand_summary_row\">&mdash;</td>\n<td class=\"gt_row gt_left gt_grand_summary_row\">&mdash;</td>\n<td class=\"gt_row gt_left gt_grand_summary_row\">&mdash;</td>\n<td class=\"gt_row gt_right gt_grand_summary_row\">65,100.00</td>\n<td class=\"gt_row gt_left gt_grand_summary_row\">&mdash;</td>\n<td class=\"gt_row gt_left gt_grand_summary_row\">&mdash;</td></tr>\n    <tr><td class=\"gt_row gt_right gt_stub gt_grand_summary_row gt_last_summary_row\">avg</td>\n<td class=\"gt_row gt_right gt_grand_summary_row gt_last_summary_row\">1,380,432.87</td>\n<td class=\"gt_row gt_left gt_grand_summary_row gt_last_summary_row\">&mdash;</td>\n<td class=\"gt_row gt_center gt_grand_summary_row gt_last_summary_row\">&mdash;</td>\n<td class=\"gt_row gt_left gt_grand_summary_row gt_last_summary_row\">&mdash;</td>\n<td class=\"gt_row gt_left gt_grand_summary_row gt_last_summary_row\">&mdash;</td>\n<td class=\"gt_row gt_left gt_grand_summary_row gt_last_summary_row\">&mdash;</td>\n<td class=\"gt_row gt_right gt_grand_summary_row gt_last_summary_row\">9,501.26</td>\n<td class=\"gt_row gt_left gt_grand_summary_row gt_last_summary_row\">&mdash;</td>\n<td class=\"gt_row gt_left gt_grand_summary_row gt_last_summary_row\">&mdash;</td></tr>\n  </tbody>\n  \n  \n</table>"

---

    Code
      .
    Output
      [1] "\\captionsetup[table]{labelformat=empty,skip=1pt}\n\\begin{longtable}{lrlclllrll}\n\\toprule\n & num & char & fctr & date & time & datetime & currency & rowname & group \\\\ \n\\midrule\n & 1.111e-01 & apricot & one & 2015-01-15 & 13:35 & 2018-01-01 02:22 & 49.950 & row\\_1 & grp\\_a \\\\ \n & 2.222e+00 & banana & two & 2015-02-15 & 14:40 & 2018-02-02 14:33 & 17.950 & row\\_2 & grp\\_a \\\\ \n & 3.333e+01 & coconut & three & 2015-03-15 & 15:45 & 2018-03-03 03:44 & 1.390 & row\\_3 & grp\\_a \\\\ \n & 4.444e+02 & durian & four & 2015-04-15 & 16:50 & 2018-04-04 15:55 & 65100.000 & row\\_4 & grp\\_a \\\\ \n & 5.550e+03 & NA & five & 2015-05-15 & 17:55 & 2018-05-05 04:00 & 1325.810 & row\\_5 & grp\\_b \\\\ \n & NA & fig & six & 2015-06-15 & NA & 2018-06-06 16:11 & 13.255 & row\\_6 & grp\\_b \\\\ \n & 7.770e+05 & grapefruit & seven & NA & 19:10 & 2018-07-07 05:22 & NA & row\\_7 & grp\\_b \\\\ \n & 8.880e+06 & honeydew & eight & 2015-08-15 & 20:20 & NA & 0.440 & row\\_8 & grp\\_b \\\\ \n \\midrule \n\\midrule \nmin & $0.11$ & — & — & — & — & — & $0.44$ & — & — \\\\ \nmax & $8,880,000.00$ & — & — & — & — & — & $65,100.00$ & — & — \\\\ \navg & $1,380,432.87$ & — & — & — & — & — & $9,501.26$ & — & — \\\\ \n\\bottomrule\n\\end{longtable}\n"

---

    Code
      .
    Output
      {\rtf\ansi\ansicpg1252{\fonttbl{\f0\froman\fcharset0\fprq0 Calibri;}{\f1\froman\fcharset0\fprq0 Courier;}}{\colortbl;\red211\green211\blue211;}
      
      \trowd\trrh0\trhdr
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clbrdrt\brdrs\brdrw40\brdrcf1\clbrdrb\brdrs\brdrw40\brdrcf1\clbrdrl\brdrs\brdrw20\brdrcf1\clbrdrr\brdrs\brdrw20\brdrcf1\cellx947
      \intbl {\f0 {\f0\fs20 }}\cell
      \pard\plain
      
      \pard\plain\uc0\qr\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clbrdrt\brdrs\brdrw40\brdrcf1\clbrdrb\brdrs\brdrw40\brdrcf1\clbrdrl\brdrs\brdrw20\brdrcf1\clbrdrr\brdrs\brdrw20\brdrcf1\cellx1894
      \intbl {\f0 {\f0\fs20 num}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clbrdrt\brdrs\brdrw40\brdrcf1\clbrdrb\brdrs\brdrw40\brdrcf1\clbrdrl\brdrs\brdrw20\brdrcf1\clbrdrr\brdrs\brdrw20\brdrcf1\cellx2841
      \intbl {\f0 {\f0\fs20 char}}\cell
      \pard\plain
      
      \pard\plain\uc0\qc\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clbrdrt\brdrs\brdrw40\brdrcf1\clbrdrb\brdrs\brdrw40\brdrcf1\clbrdrl\brdrs\brdrw20\brdrcf1\clbrdrr\brdrs\brdrw20\brdrcf1\cellx3788
      \intbl {\f0 {\f0\fs20 fctr}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clbrdrt\brdrs\brdrw40\brdrcf1\clbrdrb\brdrs\brdrw40\brdrcf1\clbrdrl\brdrs\brdrw20\brdrcf1\clbrdrr\brdrs\brdrw20\brdrcf1\cellx4735
      \intbl {\f0 {\f0\fs20 date}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clbrdrt\brdrs\brdrw40\brdrcf1\clbrdrb\brdrs\brdrw40\brdrcf1\clbrdrl\brdrs\brdrw20\brdrcf1\clbrdrr\brdrs\brdrw20\brdrcf1\cellx5682
      \intbl {\f0 {\f0\fs20 time}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clbrdrt\brdrs\brdrw40\brdrcf1\clbrdrb\brdrs\brdrw40\brdrcf1\clbrdrl\brdrs\brdrw20\brdrcf1\clbrdrr\brdrs\brdrw20\brdrcf1\cellx6629
      \intbl {\f0 {\f0\fs20 datetime}}\cell
      \pard\plain
      
      \pard\plain\uc0\qr\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clbrdrt\brdrs\brdrw40\brdrcf1\clbrdrb\brdrs\brdrw40\brdrcf1\clbrdrl\brdrs\brdrw20\brdrcf1\clbrdrr\brdrs\brdrw20\brdrcf1\cellx7576
      \intbl {\f0 {\f0\fs20 currency}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clbrdrt\brdrs\brdrw40\brdrcf1\clbrdrb\brdrs\brdrw40\brdrcf1\clbrdrl\brdrs\brdrw20\brdrcf1\clbrdrr\brdrs\brdrw20\brdrcf1\cellx8523
      \intbl {\f0 {\f0\fs20 rowname}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clbrdrt\brdrs\brdrw40\brdrcf1\clbrdrb\brdrs\brdrw40\brdrcf1\clbrdrl\brdrs\brdrw20\brdrcf1\clbrdrr\brdrs\brdrw20\brdrcf1\cellx9470
      \intbl {\f0 {\f0\fs20 group}}\cell
      \pard\plain
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clbrdrb\brdrs\brdrw10\brdrcf1\clbrdrl\brdrs\brdrw10\brdrcf1\clbrdrr\brdrs\brdrw10\brdrcf1\cellx947
      \intbl {\f0 {\f0\fs20 }}\cell
      \pard\plain
      
      \pard\plain\uc0\qr\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clbrdrb\brdrs\brdrw10\brdrcf1\clbrdrl\brdrs\brdrw10\brdrcf1\clbrdrr\brdrs\brdrw10\brdrcf1\cellx1894
      \intbl {\f0 {\f0\fs20 1.111e-01}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clbrdrb\brdrs\brdrw10\brdrcf1\clbrdrl\brdrs\brdrw10\brdrcf1\clbrdrr\brdrs\brdrw10\brdrcf1\cellx2841
      \intbl {\f0 {\f0\fs20 apricot}}\cell
      \pard\plain
      
      \pard\plain\uc0\qc\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clbrdrb\brdrs\brdrw10\brdrcf1\clbrdrl\brdrs\brdrw10\brdrcf1\clbrdrr\brdrs\brdrw10\brdrcf1\cellx3788
      \intbl {\f0 {\f0\fs20 one}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clbrdrb\brdrs\brdrw10\brdrcf1\clbrdrl\brdrs\brdrw10\brdrcf1\clbrdrr\brdrs\brdrw10\brdrcf1\cellx4735
      \intbl {\f0 {\f0\fs20 2015-01-15}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clbrdrb\brdrs\brdrw10\brdrcf1\clbrdrl\brdrs\brdrw10\brdrcf1\clbrdrr\brdrs\brdrw10\brdrcf1\cellx5682
      \intbl {\f0 {\f0\fs20 13:35}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clbrdrb\brdrs\brdrw10\brdrcf1\clbrdrl\brdrs\brdrw10\brdrcf1\clbrdrr\brdrs\brdrw10\brdrcf1\cellx6629
      \intbl {\f0 {\f0\fs20 2018-01-01 02:22}}\cell
      \pard\plain
      
      \pard\plain\uc0\qr\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clbrdrb\brdrs\brdrw10\brdrcf1\clbrdrl\brdrs\brdrw10\brdrcf1\clbrdrr\brdrs\brdrw10\brdrcf1\cellx7576
      \intbl {\f0 {\f0\fs20 49.950}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clbrdrb\brdrs\brdrw10\brdrcf1\clbrdrl\brdrs\brdrw10\brdrcf1\clbrdrr\brdrs\brdrw10\brdrcf1\cellx8523
      \intbl {\f0 {\f0\fs20 row_1}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clbrdrb\brdrs\brdrw10\brdrcf1\clbrdrl\brdrs\brdrw10\brdrcf1\clbrdrr\brdrs\brdrw10\brdrcf1\cellx9470
      \intbl {\f0 {\f0\fs20 grp_a}}\cell
      \pard\plain
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clbrdrb\brdrs\brdrw10\brdrcf1\clbrdrl\brdrs\brdrw10\brdrcf1\clbrdrr\brdrs\brdrw10\brdrcf1\cellx947
      \intbl {\f0 {\f0\fs20 }}\cell
      \pard\plain
      
      \pard\plain\uc0\qr\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clbrdrb\brdrs\brdrw10\brdrcf1\clbrdrl\brdrs\brdrw10\brdrcf1\clbrdrr\brdrs\brdrw10\brdrcf1\cellx1894
      \intbl {\f0 {\f0\fs20 2.222e+00}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clbrdrb\brdrs\brdrw10\brdrcf1\clbrdrl\brdrs\brdrw10\brdrcf1\clbrdrr\brdrs\brdrw10\brdrcf1\cellx2841
      \intbl {\f0 {\f0\fs20 banana}}\cell
      \pard\plain
      
      \pard\plain\uc0\qc\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clbrdrb\brdrs\brdrw10\brdrcf1\clbrdrl\brdrs\brdrw10\brdrcf1\clbrdrr\brdrs\brdrw10\brdrcf1\cellx3788
      \intbl {\f0 {\f0\fs20 two}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clbrdrb\brdrs\brdrw10\brdrcf1\clbrdrl\brdrs\brdrw10\brdrcf1\clbrdrr\brdrs\brdrw10\brdrcf1\cellx4735
      \intbl {\f0 {\f0\fs20 2015-02-15}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clbrdrb\brdrs\brdrw10\brdrcf1\clbrdrl\brdrs\brdrw10\brdrcf1\clbrdrr\brdrs\brdrw10\brdrcf1\cellx5682
      \intbl {\f0 {\f0\fs20 14:40}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clbrdrb\brdrs\brdrw10\brdrcf1\clbrdrl\brdrs\brdrw10\brdrcf1\clbrdrr\brdrs\brdrw10\brdrcf1\cellx6629
      \intbl {\f0 {\f0\fs20 2018-02-02 14:33}}\cell
      \pard\plain
      
      \pard\plain\uc0\qr\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clbrdrb\brdrs\brdrw10\brdrcf1\clbrdrl\brdrs\brdrw10\brdrcf1\clbrdrr\brdrs\brdrw10\brdrcf1\cellx7576
      \intbl {\f0 {\f0\fs20 17.950}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clbrdrb\brdrs\brdrw10\brdrcf1\clbrdrl\brdrs\brdrw10\brdrcf1\clbrdrr\brdrs\brdrw10\brdrcf1\cellx8523
      \intbl {\f0 {\f0\fs20 row_2}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clbrdrb\brdrs\brdrw10\brdrcf1\clbrdrl\brdrs\brdrw10\brdrcf1\clbrdrr\brdrs\brdrw10\brdrcf1\cellx9470
      \intbl {\f0 {\f0\fs20 grp_a}}\cell
      \pard\plain
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clbrdrb\brdrs\brdrw10\brdrcf1\clbrdrl\brdrs\brdrw10\brdrcf1\clbrdrr\brdrs\brdrw10\brdrcf1\cellx947
      \intbl {\f0 {\f0\fs20 }}\cell
      \pard\plain
      
      \pard\plain\uc0\qr\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clbrdrb\brdrs\brdrw10\brdrcf1\clbrdrl\brdrs\brdrw10\brdrcf1\clbrdrr\brdrs\brdrw10\brdrcf1\cellx1894
      \intbl {\f0 {\f0\fs20 3.333e+01}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clbrdrb\brdrs\brdrw10\brdrcf1\clbrdrl\brdrs\brdrw10\brdrcf1\clbrdrr\brdrs\brdrw10\brdrcf1\cellx2841
      \intbl {\f0 {\f0\fs20 coconut}}\cell
      \pard\plain
      
      \pard\plain\uc0\qc\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clbrdrb\brdrs\brdrw10\brdrcf1\clbrdrl\brdrs\brdrw10\brdrcf1\clbrdrr\brdrs\brdrw10\brdrcf1\cellx3788
      \intbl {\f0 {\f0\fs20 three}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clbrdrb\brdrs\brdrw10\brdrcf1\clbrdrl\brdrs\brdrw10\brdrcf1\clbrdrr\brdrs\brdrw10\brdrcf1\cellx4735
      \intbl {\f0 {\f0\fs20 2015-03-15}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clbrdrb\brdrs\brdrw10\brdrcf1\clbrdrl\brdrs\brdrw10\brdrcf1\clbrdrr\brdrs\brdrw10\brdrcf1\cellx5682
      \intbl {\f0 {\f0\fs20 15:45}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clbrdrb\brdrs\brdrw10\brdrcf1\clbrdrl\brdrs\brdrw10\brdrcf1\clbrdrr\brdrs\brdrw10\brdrcf1\cellx6629
      \intbl {\f0 {\f0\fs20 2018-03-03 03:44}}\cell
      \pard\plain
      
      \pard\plain\uc0\qr\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clbrdrb\brdrs\brdrw10\brdrcf1\clbrdrl\brdrs\brdrw10\brdrcf1\clbrdrr\brdrs\brdrw10\brdrcf1\cellx7576
      \intbl {\f0 {\f0\fs20 1.390}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clbrdrb\brdrs\brdrw10\brdrcf1\clbrdrl\brdrs\brdrw10\brdrcf1\clbrdrr\brdrs\brdrw10\brdrcf1\cellx8523
      \intbl {\f0 {\f0\fs20 row_3}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clbrdrb\brdrs\brdrw10\brdrcf1\clbrdrl\brdrs\brdrw10\brdrcf1\clbrdrr\brdrs\brdrw10\brdrcf1\cellx9470
      \intbl {\f0 {\f0\fs20 grp_a}}\cell
      \pard\plain
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clbrdrb\brdrs\brdrw10\brdrcf1\clbrdrl\brdrs\brdrw10\brdrcf1\clbrdrr\brdrs\brdrw10\brdrcf1\cellx947
      \intbl {\f0 {\f0\fs20 }}\cell
      \pard\plain
      
      \pard\plain\uc0\qr\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clbrdrb\brdrs\brdrw10\brdrcf1\clbrdrl\brdrs\brdrw10\brdrcf1\clbrdrr\brdrs\brdrw10\brdrcf1\cellx1894
      \intbl {\f0 {\f0\fs20 4.444e+02}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clbrdrb\brdrs\brdrw10\brdrcf1\clbrdrl\brdrs\brdrw10\brdrcf1\clbrdrr\brdrs\brdrw10\brdrcf1\cellx2841
      \intbl {\f0 {\f0\fs20 durian}}\cell
      \pard\plain
      
      \pard\plain\uc0\qc\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clbrdrb\brdrs\brdrw10\brdrcf1\clbrdrl\brdrs\brdrw10\brdrcf1\clbrdrr\brdrs\brdrw10\brdrcf1\cellx3788
      \intbl {\f0 {\f0\fs20 four}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clbrdrb\brdrs\brdrw10\brdrcf1\clbrdrl\brdrs\brdrw10\brdrcf1\clbrdrr\brdrs\brdrw10\brdrcf1\cellx4735
      \intbl {\f0 {\f0\fs20 2015-04-15}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clbrdrb\brdrs\brdrw10\brdrcf1\clbrdrl\brdrs\brdrw10\brdrcf1\clbrdrr\brdrs\brdrw10\brdrcf1\cellx5682
      \intbl {\f0 {\f0\fs20 16:50}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clbrdrb\brdrs\brdrw10\brdrcf1\clbrdrl\brdrs\brdrw10\brdrcf1\clbrdrr\brdrs\brdrw10\brdrcf1\cellx6629
      \intbl {\f0 {\f0\fs20 2018-04-04 15:55}}\cell
      \pard\plain
      
      \pard\plain\uc0\qr\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clbrdrb\brdrs\brdrw10\brdrcf1\clbrdrl\brdrs\brdrw10\brdrcf1\clbrdrr\brdrs\brdrw10\brdrcf1\cellx7576
      \intbl {\f0 {\f0\fs20 65100.000}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clbrdrb\brdrs\brdrw10\brdrcf1\clbrdrl\brdrs\brdrw10\brdrcf1\clbrdrr\brdrs\brdrw10\brdrcf1\cellx8523
      \intbl {\f0 {\f0\fs20 row_4}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clbrdrb\brdrs\brdrw10\brdrcf1\clbrdrl\brdrs\brdrw10\brdrcf1\clbrdrr\brdrs\brdrw10\brdrcf1\cellx9470
      \intbl {\f0 {\f0\fs20 grp_a}}\cell
      \pard\plain
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clbrdrb\brdrs\brdrw10\brdrcf1\clbrdrl\brdrs\brdrw10\brdrcf1\clbrdrr\brdrs\brdrw10\brdrcf1\cellx947
      \intbl {\f0 {\f0\fs20 }}\cell
      \pard\plain
      
      \pard\plain\uc0\qr\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clbrdrb\brdrs\brdrw10\brdrcf1\clbrdrl\brdrs\brdrw10\brdrcf1\clbrdrr\brdrs\brdrw10\brdrcf1\cellx1894
      \intbl {\f0 {\f0\fs20 5.550e+03}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clbrdrb\brdrs\brdrw10\brdrcf1\clbrdrl\brdrs\brdrw10\brdrcf1\clbrdrr\brdrs\brdrw10\brdrcf1\cellx2841
      \intbl {\f0 {\f0\fs20 NA}}\cell
      \pard\plain
      
      \pard\plain\uc0\qc\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clbrdrb\brdrs\brdrw10\brdrcf1\clbrdrl\brdrs\brdrw10\brdrcf1\clbrdrr\brdrs\brdrw10\brdrcf1\cellx3788
      \intbl {\f0 {\f0\fs20 five}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clbrdrb\brdrs\brdrw10\brdrcf1\clbrdrl\brdrs\brdrw10\brdrcf1\clbrdrr\brdrs\brdrw10\brdrcf1\cellx4735
      \intbl {\f0 {\f0\fs20 2015-05-15}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clbrdrb\brdrs\brdrw10\brdrcf1\clbrdrl\brdrs\brdrw10\brdrcf1\clbrdrr\brdrs\brdrw10\brdrcf1\cellx5682
      \intbl {\f0 {\f0\fs20 17:55}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clbrdrb\brdrs\brdrw10\brdrcf1\clbrdrl\brdrs\brdrw10\brdrcf1\clbrdrr\brdrs\brdrw10\brdrcf1\cellx6629
      \intbl {\f0 {\f0\fs20 2018-05-05 04:00}}\cell
      \pard\plain
      
      \pard\plain\uc0\qr\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clbrdrb\brdrs\brdrw10\brdrcf1\clbrdrl\brdrs\brdrw10\brdrcf1\clbrdrr\brdrs\brdrw10\brdrcf1\cellx7576
      \intbl {\f0 {\f0\fs20 1325.810}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clbrdrb\brdrs\brdrw10\brdrcf1\clbrdrl\brdrs\brdrw10\brdrcf1\clbrdrr\brdrs\brdrw10\brdrcf1\cellx8523
      \intbl {\f0 {\f0\fs20 row_5}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clbrdrb\brdrs\brdrw10\brdrcf1\clbrdrl\brdrs\brdrw10\brdrcf1\clbrdrr\brdrs\brdrw10\brdrcf1\cellx9470
      \intbl {\f0 {\f0\fs20 grp_b}}\cell
      \pard\plain
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clbrdrb\brdrs\brdrw10\brdrcf1\clbrdrl\brdrs\brdrw10\brdrcf1\clbrdrr\brdrs\brdrw10\brdrcf1\cellx947
      \intbl {\f0 {\f0\fs20 }}\cell
      \pard\plain
      
      \pard\plain\uc0\qr\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clbrdrb\brdrs\brdrw10\brdrcf1\clbrdrl\brdrs\brdrw10\brdrcf1\clbrdrr\brdrs\brdrw10\brdrcf1\cellx1894
      \intbl {\f0 {\f0\fs20 NA}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clbrdrb\brdrs\brdrw10\brdrcf1\clbrdrl\brdrs\brdrw10\brdrcf1\clbrdrr\brdrs\brdrw10\brdrcf1\cellx2841
      \intbl {\f0 {\f0\fs20 fig}}\cell
      \pard\plain
      
      \pard\plain\uc0\qc\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clbrdrb\brdrs\brdrw10\brdrcf1\clbrdrl\brdrs\brdrw10\brdrcf1\clbrdrr\brdrs\brdrw10\brdrcf1\cellx3788
      \intbl {\f0 {\f0\fs20 six}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clbrdrb\brdrs\brdrw10\brdrcf1\clbrdrl\brdrs\brdrw10\brdrcf1\clbrdrr\brdrs\brdrw10\brdrcf1\cellx4735
      \intbl {\f0 {\f0\fs20 2015-06-15}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clbrdrb\brdrs\brdrw10\brdrcf1\clbrdrl\brdrs\brdrw10\brdrcf1\clbrdrr\brdrs\brdrw10\brdrcf1\cellx5682
      \intbl {\f0 {\f0\fs20 NA}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clbrdrb\brdrs\brdrw10\brdrcf1\clbrdrl\brdrs\brdrw10\brdrcf1\clbrdrr\brdrs\brdrw10\brdrcf1\cellx6629
      \intbl {\f0 {\f0\fs20 2018-06-06 16:11}}\cell
      \pard\plain
      
      \pard\plain\uc0\qr\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clbrdrb\brdrs\brdrw10\brdrcf1\clbrdrl\brdrs\brdrw10\brdrcf1\clbrdrr\brdrs\brdrw10\brdrcf1\cellx7576
      \intbl {\f0 {\f0\fs20 13.255}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clbrdrb\brdrs\brdrw10\brdrcf1\clbrdrl\brdrs\brdrw10\brdrcf1\clbrdrr\brdrs\brdrw10\brdrcf1\cellx8523
      \intbl {\f0 {\f0\fs20 row_6}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clbrdrb\brdrs\brdrw10\brdrcf1\clbrdrl\brdrs\brdrw10\brdrcf1\clbrdrr\brdrs\brdrw10\brdrcf1\cellx9470
      \intbl {\f0 {\f0\fs20 grp_b}}\cell
      \pard\plain
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clbrdrb\brdrs\brdrw10\brdrcf1\clbrdrl\brdrs\brdrw10\brdrcf1\clbrdrr\brdrs\brdrw10\brdrcf1\cellx947
      \intbl {\f0 {\f0\fs20 }}\cell
      \pard\plain
      
      \pard\plain\uc0\qr\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clbrdrb\brdrs\brdrw10\brdrcf1\clbrdrl\brdrs\brdrw10\brdrcf1\clbrdrr\brdrs\brdrw10\brdrcf1\cellx1894
      \intbl {\f0 {\f0\fs20 7.770e+05}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clbrdrb\brdrs\brdrw10\brdrcf1\clbrdrl\brdrs\brdrw10\brdrcf1\clbrdrr\brdrs\brdrw10\brdrcf1\cellx2841
      \intbl {\f0 {\f0\fs20 grapefruit}}\cell
      \pard\plain
      
      \pard\plain\uc0\qc\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clbrdrb\brdrs\brdrw10\brdrcf1\clbrdrl\brdrs\brdrw10\brdrcf1\clbrdrr\brdrs\brdrw10\brdrcf1\cellx3788
      \intbl {\f0 {\f0\fs20 seven}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clbrdrb\brdrs\brdrw10\brdrcf1\clbrdrl\brdrs\brdrw10\brdrcf1\clbrdrr\brdrs\brdrw10\brdrcf1\cellx4735
      \intbl {\f0 {\f0\fs20 NA}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clbrdrb\brdrs\brdrw10\brdrcf1\clbrdrl\brdrs\brdrw10\brdrcf1\clbrdrr\brdrs\brdrw10\brdrcf1\cellx5682
      \intbl {\f0 {\f0\fs20 19:10}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clbrdrb\brdrs\brdrw10\brdrcf1\clbrdrl\brdrs\brdrw10\brdrcf1\clbrdrr\brdrs\brdrw10\brdrcf1\cellx6629
      \intbl {\f0 {\f0\fs20 2018-07-07 05:22}}\cell
      \pard\plain
      
      \pard\plain\uc0\qr\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clbrdrb\brdrs\brdrw10\brdrcf1\clbrdrl\brdrs\brdrw10\brdrcf1\clbrdrr\brdrs\brdrw10\brdrcf1\cellx7576
      \intbl {\f0 {\f0\fs20 NA}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clbrdrb\brdrs\brdrw10\brdrcf1\clbrdrl\brdrs\brdrw10\brdrcf1\clbrdrr\brdrs\brdrw10\brdrcf1\cellx8523
      \intbl {\f0 {\f0\fs20 row_7}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clbrdrb\brdrs\brdrw10\brdrcf1\clbrdrl\brdrs\brdrw10\brdrcf1\clbrdrr\brdrs\brdrw10\brdrcf1\cellx9470
      \intbl {\f0 {\f0\fs20 grp_b}}\cell
      \pard\plain
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clbrdrb\brdrs\brdrw10\brdrcf1\clbrdrl\brdrs\brdrw10\brdrcf1\clbrdrr\brdrs\brdrw10\brdrcf1\cellx947
      \intbl {\f0 {\f0\fs20 }}\cell
      \pard\plain
      
      \pard\plain\uc0\qr\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clbrdrb\brdrs\brdrw10\brdrcf1\clbrdrl\brdrs\brdrw10\brdrcf1\clbrdrr\brdrs\brdrw10\brdrcf1\cellx1894
      \intbl {\f0 {\f0\fs20 8.880e+06}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clbrdrb\brdrs\brdrw10\brdrcf1\clbrdrl\brdrs\brdrw10\brdrcf1\clbrdrr\brdrs\brdrw10\brdrcf1\cellx2841
      \intbl {\f0 {\f0\fs20 honeydew}}\cell
      \pard\plain
      
      \pard\plain\uc0\qc\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clbrdrb\brdrs\brdrw10\brdrcf1\clbrdrl\brdrs\brdrw10\brdrcf1\clbrdrr\brdrs\brdrw10\brdrcf1\cellx3788
      \intbl {\f0 {\f0\fs20 eight}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clbrdrb\brdrs\brdrw10\brdrcf1\clbrdrl\brdrs\brdrw10\brdrcf1\clbrdrr\brdrs\brdrw10\brdrcf1\cellx4735
      \intbl {\f0 {\f0\fs20 2015-08-15}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clbrdrb\brdrs\brdrw10\brdrcf1\clbrdrl\brdrs\brdrw10\brdrcf1\clbrdrr\brdrs\brdrw10\brdrcf1\cellx5682
      \intbl {\f0 {\f0\fs20 20:20}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clbrdrb\brdrs\brdrw10\brdrcf1\clbrdrl\brdrs\brdrw10\brdrcf1\clbrdrr\brdrs\brdrw10\brdrcf1\cellx6629
      \intbl {\f0 {\f0\fs20 NA}}\cell
      \pard\plain
      
      \pard\plain\uc0\qr\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clbrdrb\brdrs\brdrw10\brdrcf1\clbrdrl\brdrs\brdrw10\brdrcf1\clbrdrr\brdrs\brdrw10\brdrcf1\cellx7576
      \intbl {\f0 {\f0\fs20 0.440}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clbrdrb\brdrs\brdrw10\brdrcf1\clbrdrl\brdrs\brdrw10\brdrcf1\clbrdrr\brdrs\brdrw10\brdrcf1\cellx8523
      \intbl {\f0 {\f0\fs20 row_8}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clbrdrb\brdrs\brdrw10\brdrcf1\clbrdrl\brdrs\brdrw10\brdrcf1\clbrdrr\brdrs\brdrw10\brdrcf1\cellx9470
      \intbl {\f0 {\f0\fs20 grp_b}}\cell
      \pard\plain
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clbrdrb\brdrs\brdrw10\brdrcf1\clbrdrl\brdrs\brdrw10\brdrcf1\clbrdrr\brdrs\brdrw10\brdrcf1\clbrdrt\brdrdb\brdrw50\brdrcf1\cellx947
      \intbl {\f0 {\f0\fs20 min}}\cell
      \pard\plain
      
      \pard\plain\uc0\qr\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clbrdrb\brdrs\brdrw10\brdrcf1\clbrdrl\brdrs\brdrw10\brdrcf1\clbrdrr\brdrs\brdrw10\brdrcf1\clbrdrt\brdrdb\brdrw50\brdrcf1\cellx1894
      \intbl {\f0 {\f0\fs20 0.11}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clbrdrb\brdrs\brdrw10\brdrcf1\clbrdrl\brdrs\brdrw10\brdrcf1\clbrdrr\brdrs\brdrw10\brdrcf1\clbrdrt\brdrdb\brdrw50\brdrcf1\cellx2841
      \intbl {\f0 {\f0\fs20 \'97}}\cell
      \pard\plain
      
      \pard\plain\uc0\qc\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clbrdrb\brdrs\brdrw10\brdrcf1\clbrdrl\brdrs\brdrw10\brdrcf1\clbrdrr\brdrs\brdrw10\brdrcf1\clbrdrt\brdrdb\brdrw50\brdrcf1\cellx3788
      \intbl {\f0 {\f0\fs20 \'97}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clbrdrb\brdrs\brdrw10\brdrcf1\clbrdrl\brdrs\brdrw10\brdrcf1\clbrdrr\brdrs\brdrw10\brdrcf1\clbrdrt\brdrdb\brdrw50\brdrcf1\cellx4735
      \intbl {\f0 {\f0\fs20 \'97}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clbrdrb\brdrs\brdrw10\brdrcf1\clbrdrl\brdrs\brdrw10\brdrcf1\clbrdrr\brdrs\brdrw10\brdrcf1\clbrdrt\brdrdb\brdrw50\brdrcf1\cellx5682
      \intbl {\f0 {\f0\fs20 \'97}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clbrdrb\brdrs\brdrw10\brdrcf1\clbrdrl\brdrs\brdrw10\brdrcf1\clbrdrr\brdrs\brdrw10\brdrcf1\clbrdrt\brdrdb\brdrw50\brdrcf1\cellx6629
      \intbl {\f0 {\f0\fs20 \'97}}\cell
      \pard\plain
      
      \pard\plain\uc0\qr\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clbrdrb\brdrs\brdrw10\brdrcf1\clbrdrl\brdrs\brdrw10\brdrcf1\clbrdrr\brdrs\brdrw10\brdrcf1\clbrdrt\brdrdb\brdrw50\brdrcf1\cellx7576
      \intbl {\f0 {\f0\fs20 0.44}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clbrdrb\brdrs\brdrw10\brdrcf1\clbrdrl\brdrs\brdrw10\brdrcf1\clbrdrr\brdrs\brdrw10\brdrcf1\clbrdrt\brdrdb\brdrw50\brdrcf1\cellx8523
      \intbl {\f0 {\f0\fs20 \'97}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clbrdrb\brdrs\brdrw10\brdrcf1\clbrdrl\brdrs\brdrw10\brdrcf1\clbrdrr\brdrs\brdrw10\brdrcf1\clbrdrt\brdrdb\brdrw50\brdrcf1\cellx9470
      \intbl {\f0 {\f0\fs20 \'97}}\cell
      \pard\plain
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clbrdrb\brdrs\brdrw10\brdrcf1\clbrdrl\brdrs\brdrw10\brdrcf1\clbrdrr\brdrs\brdrw10\brdrcf1\clbrdrt\brdrs\brdrw10\brdrcf1\cellx947
      \intbl {\f0 {\f0\fs20 max}}\cell
      \pard\plain
      
      \pard\plain\uc0\qr\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clbrdrb\brdrs\brdrw10\brdrcf1\clbrdrl\brdrs\brdrw10\brdrcf1\clbrdrr\brdrs\brdrw10\brdrcf1\clbrdrt\brdrs\brdrw10\brdrcf1\cellx1894
      \intbl {\f0 {\f0\fs20 8,880,000.00}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clbrdrb\brdrs\brdrw10\brdrcf1\clbrdrl\brdrs\brdrw10\brdrcf1\clbrdrr\brdrs\brdrw10\brdrcf1\clbrdrt\brdrs\brdrw10\brdrcf1\cellx2841
      \intbl {\f0 {\f0\fs20 \'97}}\cell
      \pard\plain
      
      \pard\plain\uc0\qc\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clbrdrb\brdrs\brdrw10\brdrcf1\clbrdrl\brdrs\brdrw10\brdrcf1\clbrdrr\brdrs\brdrw10\brdrcf1\clbrdrt\brdrs\brdrw10\brdrcf1\cellx3788
      \intbl {\f0 {\f0\fs20 \'97}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clbrdrb\brdrs\brdrw10\brdrcf1\clbrdrl\brdrs\brdrw10\brdrcf1\clbrdrr\brdrs\brdrw10\brdrcf1\clbrdrt\brdrs\brdrw10\brdrcf1\cellx4735
      \intbl {\f0 {\f0\fs20 \'97}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clbrdrb\brdrs\brdrw10\brdrcf1\clbrdrl\brdrs\brdrw10\brdrcf1\clbrdrr\brdrs\brdrw10\brdrcf1\clbrdrt\brdrs\brdrw10\brdrcf1\cellx5682
      \intbl {\f0 {\f0\fs20 \'97}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clbrdrb\brdrs\brdrw10\brdrcf1\clbrdrl\brdrs\brdrw10\brdrcf1\clbrdrr\brdrs\brdrw10\brdrcf1\clbrdrt\brdrs\brdrw10\brdrcf1\cellx6629
      \intbl {\f0 {\f0\fs20 \'97}}\cell
      \pard\plain
      
      \pard\plain\uc0\qr\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clbrdrb\brdrs\brdrw10\brdrcf1\clbrdrl\brdrs\brdrw10\brdrcf1\clbrdrr\brdrs\brdrw10\brdrcf1\clbrdrt\brdrs\brdrw10\brdrcf1\cellx7576
      \intbl {\f0 {\f0\fs20 65,100.00}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clbrdrb\brdrs\brdrw10\brdrcf1\clbrdrl\brdrs\brdrw10\brdrcf1\clbrdrr\brdrs\brdrw10\brdrcf1\clbrdrt\brdrs\brdrw10\brdrcf1\cellx8523
      \intbl {\f0 {\f0\fs20 \'97}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clbrdrb\brdrs\brdrw10\brdrcf1\clbrdrl\brdrs\brdrw10\brdrcf1\clbrdrr\brdrs\brdrw10\brdrcf1\clbrdrt\brdrs\brdrw10\brdrcf1\cellx9470
      \intbl {\f0 {\f0\fs20 \'97}}\cell
      \pard\plain
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clbrdrb\brdrs\brdrw50\brdrcf1\clbrdrl\brdrs\brdrw10\brdrcf1\clbrdrr\brdrs\brdrw10\brdrcf1\clbrdrt\brdrs\brdrw10\brdrcf1\cellx947
      \intbl {\f0 {\f0\fs20 avg}}\cell
      \pard\plain
      
      \pard\plain\uc0\qr\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clbrdrb\brdrs\brdrw50\brdrcf1\clbrdrl\brdrs\brdrw10\brdrcf1\clbrdrr\brdrs\brdrw10\brdrcf1\clbrdrt\brdrs\brdrw10\brdrcf1\cellx1894
      \intbl {\f0 {\f0\fs20 1,380,432.87}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clbrdrb\brdrs\brdrw50\brdrcf1\clbrdrl\brdrs\brdrw10\brdrcf1\clbrdrr\brdrs\brdrw10\brdrcf1\clbrdrt\brdrs\brdrw10\brdrcf1\cellx2841
      \intbl {\f0 {\f0\fs20 \'97}}\cell
      \pard\plain
      
      \pard\plain\uc0\qc\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clbrdrb\brdrs\brdrw50\brdrcf1\clbrdrl\brdrs\brdrw10\brdrcf1\clbrdrr\brdrs\brdrw10\brdrcf1\clbrdrt\brdrs\brdrw10\brdrcf1\cellx3788
      \intbl {\f0 {\f0\fs20 \'97}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clbrdrb\brdrs\brdrw50\brdrcf1\clbrdrl\brdrs\brdrw10\brdrcf1\clbrdrr\brdrs\brdrw10\brdrcf1\clbrdrt\brdrs\brdrw10\brdrcf1\cellx4735
      \intbl {\f0 {\f0\fs20 \'97}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clbrdrb\brdrs\brdrw50\brdrcf1\clbrdrl\brdrs\brdrw10\brdrcf1\clbrdrr\brdrs\brdrw10\brdrcf1\clbrdrt\brdrs\brdrw10\brdrcf1\cellx5682
      \intbl {\f0 {\f0\fs20 \'97}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clbrdrb\brdrs\brdrw50\brdrcf1\clbrdrl\brdrs\brdrw10\brdrcf1\clbrdrr\brdrs\brdrw10\brdrcf1\clbrdrt\brdrs\brdrw10\brdrcf1\cellx6629
      \intbl {\f0 {\f0\fs20 \'97}}\cell
      \pard\plain
      
      \pard\plain\uc0\qr\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clbrdrb\brdrs\brdrw50\brdrcf1\clbrdrl\brdrs\brdrw10\brdrcf1\clbrdrr\brdrs\brdrw10\brdrcf1\clbrdrt\brdrs\brdrw10\brdrcf1\cellx7576
      \intbl {\f0 {\f0\fs20 9,501.26}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clbrdrb\brdrs\brdrw50\brdrcf1\clbrdrl\brdrs\brdrw10\brdrcf1\clbrdrr\brdrs\brdrw10\brdrcf1\clbrdrt\brdrs\brdrw10\brdrcf1\cellx8523
      \intbl {\f0 {\f0\fs20 \'97}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clbrdrb\brdrs\brdrw50\brdrcf1\clbrdrl\brdrs\brdrw10\brdrcf1\clbrdrr\brdrs\brdrw10\brdrcf1\clbrdrt\brdrs\brdrw10\brdrcf1\cellx9470
      \intbl {\f0 {\f0\fs20 \'97}}\cell
      \pard\plain
      
      \row
      
      }

---

    Code
      .
    Output
      [1] "<table class=\"gt_table\">\n  \n  <thead class=\"gt_col_headings\">\n    <tr>\n      <th class=\"gt_col_heading gt_columns_bottom_border gt_left\" rowspan=\"1\" colspan=\"1\"></th>\n      <th class=\"gt_col_heading gt_columns_bottom_border gt_right\" rowspan=\"1\" colspan=\"1\">num</th>\n      <th class=\"gt_col_heading gt_columns_bottom_border gt_left\" rowspan=\"1\" colspan=\"1\">char</th>\n      <th class=\"gt_col_heading gt_columns_bottom_border gt_center\" rowspan=\"1\" colspan=\"1\">fctr</th>\n      <th class=\"gt_col_heading gt_columns_bottom_border gt_left\" rowspan=\"1\" colspan=\"1\">date</th>\n      <th class=\"gt_col_heading gt_columns_bottom_border gt_left\" rowspan=\"1\" colspan=\"1\">time</th>\n      <th class=\"gt_col_heading gt_columns_bottom_border gt_left\" rowspan=\"1\" colspan=\"1\">datetime</th>\n      <th class=\"gt_col_heading gt_columns_bottom_border gt_right\" rowspan=\"1\" colspan=\"1\">currency</th>\n      <th class=\"gt_col_heading gt_columns_bottom_border gt_left\" rowspan=\"1\" colspan=\"1\">rowname</th>\n    </tr>\n  </thead>\n  <tbody class=\"gt_table_body\">\n    <tr class=\"gt_group_heading_row\">\n      <td colspan=\"9\" class=\"gt_group_heading\">grp_a</td>\n    </tr>\n    <tr><td class=\"gt_row gt_left gt_stub\"></td>\n<td class=\"gt_row gt_right\">1.111e-01</td>\n<td class=\"gt_row gt_left\">apricot</td>\n<td class=\"gt_row gt_center\">one</td>\n<td class=\"gt_row gt_left\">2015-01-15</td>\n<td class=\"gt_row gt_left\">13:35</td>\n<td class=\"gt_row gt_left\">2018-01-01 02:22</td>\n<td class=\"gt_row gt_right\">49.950</td>\n<td class=\"gt_row gt_left\">row_1</td></tr>\n    <tr><td class=\"gt_row gt_left gt_stub\"></td>\n<td class=\"gt_row gt_right\">2.222e+00</td>\n<td class=\"gt_row gt_left\">banana</td>\n<td class=\"gt_row gt_center\">two</td>\n<td class=\"gt_row gt_left\">2015-02-15</td>\n<td class=\"gt_row gt_left\">14:40</td>\n<td class=\"gt_row gt_left\">2018-02-02 14:33</td>\n<td class=\"gt_row gt_right\">17.950</td>\n<td class=\"gt_row gt_left\">row_2</td></tr>\n    <tr><td class=\"gt_row gt_left gt_stub\"></td>\n<td class=\"gt_row gt_right\">3.333e+01</td>\n<td class=\"gt_row gt_left\">coconut</td>\n<td class=\"gt_row gt_center\">three</td>\n<td class=\"gt_row gt_left\">2015-03-15</td>\n<td class=\"gt_row gt_left\">15:45</td>\n<td class=\"gt_row gt_left\">2018-03-03 03:44</td>\n<td class=\"gt_row gt_right\">1.390</td>\n<td class=\"gt_row gt_left\">row_3</td></tr>\n    <tr><td class=\"gt_row gt_left gt_stub\"></td>\n<td class=\"gt_row gt_right\">4.444e+02</td>\n<td class=\"gt_row gt_left\">durian</td>\n<td class=\"gt_row gt_center\">four</td>\n<td class=\"gt_row gt_left\">2015-04-15</td>\n<td class=\"gt_row gt_left\">16:50</td>\n<td class=\"gt_row gt_left\">2018-04-04 15:55</td>\n<td class=\"gt_row gt_right\">65100.000</td>\n<td class=\"gt_row gt_left\">row_4</td></tr>\n    <tr><td class=\"gt_row gt_right gt_stub gt_summary_row gt_first_summary_row gt_last_summary_row\">median</td>\n<td class=\"gt_row gt_right gt_summary_row gt_first_summary_row gt_last_summary_row\">17.78</td>\n<td class=\"gt_row gt_left gt_summary_row gt_first_summary_row gt_last_summary_row\">&mdash;</td>\n<td class=\"gt_row gt_center gt_summary_row gt_first_summary_row gt_last_summary_row\">&mdash;</td>\n<td class=\"gt_row gt_left gt_summary_row gt_first_summary_row gt_last_summary_row\">&mdash;</td>\n<td class=\"gt_row gt_left gt_summary_row gt_first_summary_row gt_last_summary_row\">&mdash;</td>\n<td class=\"gt_row gt_left gt_summary_row gt_first_summary_row gt_last_summary_row\">&mdash;</td>\n<td class=\"gt_row gt_right gt_summary_row gt_first_summary_row gt_last_summary_row\">33.95</td>\n<td class=\"gt_row gt_left gt_summary_row gt_first_summary_row gt_last_summary_row\">&mdash;</td></tr>\n    <tr class=\"gt_group_heading_row\">\n      <td colspan=\"9\" class=\"gt_group_heading\">grp_b</td>\n    </tr>\n    <tr><td class=\"gt_row gt_left gt_stub\"></td>\n<td class=\"gt_row gt_right\">5.550e+03</td>\n<td class=\"gt_row gt_left\">NA</td>\n<td class=\"gt_row gt_center\">five</td>\n<td class=\"gt_row gt_left\">2015-05-15</td>\n<td class=\"gt_row gt_left\">17:55</td>\n<td class=\"gt_row gt_left\">2018-05-05 04:00</td>\n<td class=\"gt_row gt_right\">1325.810</td>\n<td class=\"gt_row gt_left\">row_5</td></tr>\n    <tr><td class=\"gt_row gt_left gt_stub\"></td>\n<td class=\"gt_row gt_right\">NA</td>\n<td class=\"gt_row gt_left\">fig</td>\n<td class=\"gt_row gt_center\">six</td>\n<td class=\"gt_row gt_left\">2015-06-15</td>\n<td class=\"gt_row gt_left\">NA</td>\n<td class=\"gt_row gt_left\">2018-06-06 16:11</td>\n<td class=\"gt_row gt_right\">13.255</td>\n<td class=\"gt_row gt_left\">row_6</td></tr>\n    <tr><td class=\"gt_row gt_left gt_stub\"></td>\n<td class=\"gt_row gt_right\">7.770e+05</td>\n<td class=\"gt_row gt_left\">grapefruit</td>\n<td class=\"gt_row gt_center\">seven</td>\n<td class=\"gt_row gt_left\">NA</td>\n<td class=\"gt_row gt_left\">19:10</td>\n<td class=\"gt_row gt_left\">2018-07-07 05:22</td>\n<td class=\"gt_row gt_right\">NA</td>\n<td class=\"gt_row gt_left\">row_7</td></tr>\n    <tr><td class=\"gt_row gt_left gt_stub\"></td>\n<td class=\"gt_row gt_right\">8.880e+06</td>\n<td class=\"gt_row gt_left\">honeydew</td>\n<td class=\"gt_row gt_center\">eight</td>\n<td class=\"gt_row gt_left\">2015-08-15</td>\n<td class=\"gt_row gt_left\">20:20</td>\n<td class=\"gt_row gt_left\">NA</td>\n<td class=\"gt_row gt_right\">0.440</td>\n<td class=\"gt_row gt_left\">row_8</td></tr>\n    <tr><td class=\"gt_row gt_right gt_stub gt_summary_row gt_first_summary_row gt_last_summary_row\">median</td>\n<td class=\"gt_row gt_right gt_summary_row gt_first_summary_row gt_last_summary_row\">777,000.00</td>\n<td class=\"gt_row gt_left gt_summary_row gt_first_summary_row gt_last_summary_row\">&mdash;</td>\n<td class=\"gt_row gt_center gt_summary_row gt_first_summary_row gt_last_summary_row\">&mdash;</td>\n<td class=\"gt_row gt_left gt_summary_row gt_first_summary_row gt_last_summary_row\">&mdash;</td>\n<td class=\"gt_row gt_left gt_summary_row gt_first_summary_row gt_last_summary_row\">&mdash;</td>\n<td class=\"gt_row gt_left gt_summary_row gt_first_summary_row gt_last_summary_row\">&mdash;</td>\n<td class=\"gt_row gt_right gt_summary_row gt_first_summary_row gt_last_summary_row\">13.26</td>\n<td class=\"gt_row gt_left gt_summary_row gt_first_summary_row gt_last_summary_row\">&mdash;</td></tr>\n    <tr><td class=\"gt_row gt_right gt_stub gt_grand_summary_row gt_first_grand_summary_row\">min</td>\n<td class=\"gt_row gt_right gt_grand_summary_row gt_first_grand_summary_row\">0.11</td>\n<td class=\"gt_row gt_left gt_grand_summary_row gt_first_grand_summary_row\">&mdash;</td>\n<td class=\"gt_row gt_center gt_grand_summary_row gt_first_grand_summary_row\">&mdash;</td>\n<td class=\"gt_row gt_left gt_grand_summary_row gt_first_grand_summary_row\">&mdash;</td>\n<td class=\"gt_row gt_left gt_grand_summary_row gt_first_grand_summary_row\">&mdash;</td>\n<td class=\"gt_row gt_left gt_grand_summary_row gt_first_grand_summary_row\">&mdash;</td>\n<td class=\"gt_row gt_right gt_grand_summary_row gt_first_grand_summary_row\">0.44</td>\n<td class=\"gt_row gt_left gt_grand_summary_row gt_first_grand_summary_row\">&mdash;</td></tr>\n    <tr><td class=\"gt_row gt_right gt_stub gt_grand_summary_row\">max</td>\n<td class=\"gt_row gt_right gt_grand_summary_row\">8,880,000.00</td>\n<td class=\"gt_row gt_left gt_grand_summary_row\">&mdash;</td>\n<td class=\"gt_row gt_center gt_grand_summary_row\">&mdash;</td>\n<td class=\"gt_row gt_left gt_grand_summary_row\">&mdash;</td>\n<td class=\"gt_row gt_left gt_grand_summary_row\">&mdash;</td>\n<td class=\"gt_row gt_left gt_grand_summary_row\">&mdash;</td>\n<td class=\"gt_row gt_right gt_grand_summary_row\">65,100.00</td>\n<td class=\"gt_row gt_left gt_grand_summary_row\">&mdash;</td></tr>\n    <tr><td class=\"gt_row gt_right gt_stub gt_grand_summary_row gt_last_summary_row\">avg</td>\n<td class=\"gt_row gt_right gt_grand_summary_row gt_last_summary_row\">1,380,432.87</td>\n<td class=\"gt_row gt_left gt_grand_summary_row gt_last_summary_row\">&mdash;</td>\n<td class=\"gt_row gt_center gt_grand_summary_row gt_last_summary_row\">&mdash;</td>\n<td class=\"gt_row gt_left gt_grand_summary_row gt_last_summary_row\">&mdash;</td>\n<td class=\"gt_row gt_left gt_grand_summary_row gt_last_summary_row\">&mdash;</td>\n<td class=\"gt_row gt_left gt_grand_summary_row gt_last_summary_row\">&mdash;</td>\n<td class=\"gt_row gt_right gt_grand_summary_row gt_last_summary_row\">9,501.26</td>\n<td class=\"gt_row gt_left gt_grand_summary_row gt_last_summary_row\">&mdash;</td></tr>\n  </tbody>\n  \n  \n</table>"

---

    Code
      .
    Output
      [1] "\\captionsetup[table]{labelformat=empty,skip=1pt}\n\\begin{longtable}{lrlclllrl}\n\\toprule\n & num & char & fctr & date & time & datetime & currency & rowname \\\\ \n\\midrule\n\\multicolumn{1}{l}{grp\\_a} \\\\ \n\\midrule\n & 1.111e-01 & apricot & one & 2015-01-15 & 13:35 & 2018-01-01 02:22 & 49.950 & row\\_1 \\\\ \n & 2.222e+00 & banana & two & 2015-02-15 & 14:40 & 2018-02-02 14:33 & 17.950 & row\\_2 \\\\ \n & 3.333e+01 & coconut & three & 2015-03-15 & 15:45 & 2018-03-03 03:44 & 1.390 & row\\_3 \\\\ \n & 4.444e+02 & durian & four & 2015-04-15 & 16:50 & 2018-04-04 15:55 & 65100.000 & row\\_4 \\\\ \n\\midrule \nmedian & $17.78$ & — & — & — & — & — & $33.95$ & — \\\\ \n\\midrule\n\\multicolumn{1}{l}{grp\\_b} \\\\ \n\\midrule\n & 5.550e+03 & NA & five & 2015-05-15 & 17:55 & 2018-05-05 04:00 & 1325.810 & row\\_5 \\\\ \n & NA & fig & six & 2015-06-15 & NA & 2018-06-06 16:11 & 13.255 & row\\_6 \\\\ \n & 7.770e+05 & grapefruit & seven & NA & 19:10 & 2018-07-07 05:22 & NA & row\\_7 \\\\ \n & 8.880e+06 & honeydew & eight & 2015-08-15 & 20:20 & NA & 0.440 & row\\_8 \\\\ \n\\midrule \nmedian & $777,000.00$ & — & — & — & — & — & $13.26$ & — \\\\ \n \\midrule \n\\midrule \nmin & $0.11$ & — & — & — & — & — & $0.44$ & — \\\\ \nmax & $8,880,000.00$ & — & — & — & — & — & $65,100.00$ & — \\\\ \navg & $1,380,432.87$ & — & — & — & — & — & $9,501.26$ & — \\\\ \n\\bottomrule\n\\end{longtable}\n"

---

    Code
      .
    Output
      {\rtf\ansi\ansicpg1252{\fonttbl{\f0\froman\fcharset0\fprq0 Calibri;}{\f1\froman\fcharset0\fprq0 Courier;}}{\colortbl;\red211\green211\blue211;}
      
      \trowd\trrh0\trhdr
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clbrdrt\brdrs\brdrw40\brdrcf1\clbrdrb\brdrs\brdrw40\brdrcf1\clbrdrl\brdrs\brdrw20\brdrcf1\clbrdrr\brdrs\brdrw20\brdrcf1\cellx1052
      \intbl {\f0 {\f0\fs20 }}\cell
      \pard\plain
      
      \pard\plain\uc0\qr\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clbrdrt\brdrs\brdrw40\brdrcf1\clbrdrb\brdrs\brdrw40\brdrcf1\clbrdrl\brdrs\brdrw20\brdrcf1\clbrdrr\brdrs\brdrw20\brdrcf1\cellx2104
      \intbl {\f0 {\f0\fs20 num}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clbrdrt\brdrs\brdrw40\brdrcf1\clbrdrb\brdrs\brdrw40\brdrcf1\clbrdrl\brdrs\brdrw20\brdrcf1\clbrdrr\brdrs\brdrw20\brdrcf1\cellx3156
      \intbl {\f0 {\f0\fs20 char}}\cell
      \pard\plain
      
      \pard\plain\uc0\qc\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clbrdrt\brdrs\brdrw40\brdrcf1\clbrdrb\brdrs\brdrw40\brdrcf1\clbrdrl\brdrs\brdrw20\brdrcf1\clbrdrr\brdrs\brdrw20\brdrcf1\cellx4208
      \intbl {\f0 {\f0\fs20 fctr}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clbrdrt\brdrs\brdrw40\brdrcf1\clbrdrb\brdrs\brdrw40\brdrcf1\clbrdrl\brdrs\brdrw20\brdrcf1\clbrdrr\brdrs\brdrw20\brdrcf1\cellx5260
      \intbl {\f0 {\f0\fs20 date}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clbrdrt\brdrs\brdrw40\brdrcf1\clbrdrb\brdrs\brdrw40\brdrcf1\clbrdrl\brdrs\brdrw20\brdrcf1\clbrdrr\brdrs\brdrw20\brdrcf1\cellx6312
      \intbl {\f0 {\f0\fs20 time}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clbrdrt\brdrs\brdrw40\brdrcf1\clbrdrb\brdrs\brdrw40\brdrcf1\clbrdrl\brdrs\brdrw20\brdrcf1\clbrdrr\brdrs\brdrw20\brdrcf1\cellx7364
      \intbl {\f0 {\f0\fs20 datetime}}\cell
      \pard\plain
      
      \pard\plain\uc0\qr\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clbrdrt\brdrs\brdrw40\brdrcf1\clbrdrb\brdrs\brdrw40\brdrcf1\clbrdrl\brdrs\brdrw20\brdrcf1\clbrdrr\brdrs\brdrw20\brdrcf1\cellx8416
      \intbl {\f0 {\f0\fs20 currency}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clbrdrt\brdrs\brdrw40\brdrcf1\clbrdrb\brdrs\brdrw40\brdrcf1\clbrdrl\brdrs\brdrw20\brdrcf1\clbrdrr\brdrs\brdrw20\brdrcf1\cellx9468
      \intbl {\f0 {\f0\fs20 rowname}}\cell
      \pard\plain
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clbrdrt\brdrs\brdrw40\brdrcf1\clbrdrb\brdrs\brdrw40\brdrcf1\clbrdrl\brdrs\brdrw20\brdrcf1\clbrdrr\brdrs\brdrw20\brdrcf1\cellx9468
      \intbl {\f0\fs20 grp_a}\cell
      \pard\plain
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clbrdrb\brdrs\brdrw10\brdrcf1\clbrdrl\brdrs\brdrw10\brdrcf1\clbrdrr\brdrs\brdrw10\brdrcf1\cellx1052
      \intbl {\f0 {\f0\fs20 }}\cell
      \pard\plain
      
      \pard\plain\uc0\qr\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clbrdrb\brdrs\brdrw10\brdrcf1\clbrdrl\brdrs\brdrw10\brdrcf1\clbrdrr\brdrs\brdrw10\brdrcf1\cellx2104
      \intbl {\f0 {\f0\fs20 1.111e-01}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clbrdrb\brdrs\brdrw10\brdrcf1\clbrdrl\brdrs\brdrw10\brdrcf1\clbrdrr\brdrs\brdrw10\brdrcf1\cellx3156
      \intbl {\f0 {\f0\fs20 apricot}}\cell
      \pard\plain
      
      \pard\plain\uc0\qc\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clbrdrb\brdrs\brdrw10\brdrcf1\clbrdrl\brdrs\brdrw10\brdrcf1\clbrdrr\brdrs\brdrw10\brdrcf1\cellx4208
      \intbl {\f0 {\f0\fs20 one}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clbrdrb\brdrs\brdrw10\brdrcf1\clbrdrl\brdrs\brdrw10\brdrcf1\clbrdrr\brdrs\brdrw10\brdrcf1\cellx5260
      \intbl {\f0 {\f0\fs20 2015-01-15}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clbrdrb\brdrs\brdrw10\brdrcf1\clbrdrl\brdrs\brdrw10\brdrcf1\clbrdrr\brdrs\brdrw10\brdrcf1\cellx6312
      \intbl {\f0 {\f0\fs20 13:35}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clbrdrb\brdrs\brdrw10\brdrcf1\clbrdrl\brdrs\brdrw10\brdrcf1\clbrdrr\brdrs\brdrw10\brdrcf1\cellx7364
      \intbl {\f0 {\f0\fs20 2018-01-01 02:22}}\cell
      \pard\plain
      
      \pard\plain\uc0\qr\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clbrdrb\brdrs\brdrw10\brdrcf1\clbrdrl\brdrs\brdrw10\brdrcf1\clbrdrr\brdrs\brdrw10\brdrcf1\cellx8416
      \intbl {\f0 {\f0\fs20 49.950}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clbrdrb\brdrs\brdrw10\brdrcf1\clbrdrl\brdrs\brdrw10\brdrcf1\clbrdrr\brdrs\brdrw10\brdrcf1\cellx9468
      \intbl {\f0 {\f0\fs20 row_1}}\cell
      \pard\plain
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clbrdrb\brdrs\brdrw10\brdrcf1\clbrdrl\brdrs\brdrw10\brdrcf1\clbrdrr\brdrs\brdrw10\brdrcf1\cellx1052
      \intbl {\f0 {\f0\fs20 }}\cell
      \pard\plain
      
      \pard\plain\uc0\qr\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clbrdrb\brdrs\brdrw10\brdrcf1\clbrdrl\brdrs\brdrw10\brdrcf1\clbrdrr\brdrs\brdrw10\brdrcf1\cellx2104
      \intbl {\f0 {\f0\fs20 2.222e+00}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clbrdrb\brdrs\brdrw10\brdrcf1\clbrdrl\brdrs\brdrw10\brdrcf1\clbrdrr\brdrs\brdrw10\brdrcf1\cellx3156
      \intbl {\f0 {\f0\fs20 banana}}\cell
      \pard\plain
      
      \pard\plain\uc0\qc\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clbrdrb\brdrs\brdrw10\brdrcf1\clbrdrl\brdrs\brdrw10\brdrcf1\clbrdrr\brdrs\brdrw10\brdrcf1\cellx4208
      \intbl {\f0 {\f0\fs20 two}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clbrdrb\brdrs\brdrw10\brdrcf1\clbrdrl\brdrs\brdrw10\brdrcf1\clbrdrr\brdrs\brdrw10\brdrcf1\cellx5260
      \intbl {\f0 {\f0\fs20 2015-02-15}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clbrdrb\brdrs\brdrw10\brdrcf1\clbrdrl\brdrs\brdrw10\brdrcf1\clbrdrr\brdrs\brdrw10\brdrcf1\cellx6312
      \intbl {\f0 {\f0\fs20 14:40}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clbrdrb\brdrs\brdrw10\brdrcf1\clbrdrl\brdrs\brdrw10\brdrcf1\clbrdrr\brdrs\brdrw10\brdrcf1\cellx7364
      \intbl {\f0 {\f0\fs20 2018-02-02 14:33}}\cell
      \pard\plain
      
      \pard\plain\uc0\qr\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clbrdrb\brdrs\brdrw10\brdrcf1\clbrdrl\brdrs\brdrw10\brdrcf1\clbrdrr\brdrs\brdrw10\brdrcf1\cellx8416
      \intbl {\f0 {\f0\fs20 17.950}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clbrdrb\brdrs\brdrw10\brdrcf1\clbrdrl\brdrs\brdrw10\brdrcf1\clbrdrr\brdrs\brdrw10\brdrcf1\cellx9468
      \intbl {\f0 {\f0\fs20 row_2}}\cell
      \pard\plain
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clbrdrb\brdrs\brdrw10\brdrcf1\clbrdrl\brdrs\brdrw10\brdrcf1\clbrdrr\brdrs\brdrw10\brdrcf1\cellx1052
      \intbl {\f0 {\f0\fs20 }}\cell
      \pard\plain
      
      \pard\plain\uc0\qr\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clbrdrb\brdrs\brdrw10\brdrcf1\clbrdrl\brdrs\brdrw10\brdrcf1\clbrdrr\brdrs\brdrw10\brdrcf1\cellx2104
      \intbl {\f0 {\f0\fs20 3.333e+01}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clbrdrb\brdrs\brdrw10\brdrcf1\clbrdrl\brdrs\brdrw10\brdrcf1\clbrdrr\brdrs\brdrw10\brdrcf1\cellx3156
      \intbl {\f0 {\f0\fs20 coconut}}\cell
      \pard\plain
      
      \pard\plain\uc0\qc\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clbrdrb\brdrs\brdrw10\brdrcf1\clbrdrl\brdrs\brdrw10\brdrcf1\clbrdrr\brdrs\brdrw10\brdrcf1\cellx4208
      \intbl {\f0 {\f0\fs20 three}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clbrdrb\brdrs\brdrw10\brdrcf1\clbrdrl\brdrs\brdrw10\brdrcf1\clbrdrr\brdrs\brdrw10\brdrcf1\cellx5260
      \intbl {\f0 {\f0\fs20 2015-03-15}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clbrdrb\brdrs\brdrw10\brdrcf1\clbrdrl\brdrs\brdrw10\brdrcf1\clbrdrr\brdrs\brdrw10\brdrcf1\cellx6312
      \intbl {\f0 {\f0\fs20 15:45}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clbrdrb\brdrs\brdrw10\brdrcf1\clbrdrl\brdrs\brdrw10\brdrcf1\clbrdrr\brdrs\brdrw10\brdrcf1\cellx7364
      \intbl {\f0 {\f0\fs20 2018-03-03 03:44}}\cell
      \pard\plain
      
      \pard\plain\uc0\qr\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clbrdrb\brdrs\brdrw10\brdrcf1\clbrdrl\brdrs\brdrw10\brdrcf1\clbrdrr\brdrs\brdrw10\brdrcf1\cellx8416
      \intbl {\f0 {\f0\fs20 1.390}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clbrdrb\brdrs\brdrw10\brdrcf1\clbrdrl\brdrs\brdrw10\brdrcf1\clbrdrr\brdrs\brdrw10\brdrcf1\cellx9468
      \intbl {\f0 {\f0\fs20 row_3}}\cell
      \pard\plain
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clbrdrb\brdrs\brdrw10\brdrcf1\clbrdrl\brdrs\brdrw10\brdrcf1\clbrdrr\brdrs\brdrw10\brdrcf1\cellx1052
      \intbl {\f0 {\f0\fs20 }}\cell
      \pard\plain
      
      \pard\plain\uc0\qr\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clbrdrb\brdrs\brdrw10\brdrcf1\clbrdrl\brdrs\brdrw10\brdrcf1\clbrdrr\brdrs\brdrw10\brdrcf1\cellx2104
      \intbl {\f0 {\f0\fs20 4.444e+02}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clbrdrb\brdrs\brdrw10\brdrcf1\clbrdrl\brdrs\brdrw10\brdrcf1\clbrdrr\brdrs\brdrw10\brdrcf1\cellx3156
      \intbl {\f0 {\f0\fs20 durian}}\cell
      \pard\plain
      
      \pard\plain\uc0\qc\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clbrdrb\brdrs\brdrw10\brdrcf1\clbrdrl\brdrs\brdrw10\brdrcf1\clbrdrr\brdrs\brdrw10\brdrcf1\cellx4208
      \intbl {\f0 {\f0\fs20 four}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clbrdrb\brdrs\brdrw10\brdrcf1\clbrdrl\brdrs\brdrw10\brdrcf1\clbrdrr\brdrs\brdrw10\brdrcf1\cellx5260
      \intbl {\f0 {\f0\fs20 2015-04-15}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clbrdrb\brdrs\brdrw10\brdrcf1\clbrdrl\brdrs\brdrw10\brdrcf1\clbrdrr\brdrs\brdrw10\brdrcf1\cellx6312
      \intbl {\f0 {\f0\fs20 16:50}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clbrdrb\brdrs\brdrw10\brdrcf1\clbrdrl\brdrs\brdrw10\brdrcf1\clbrdrr\brdrs\brdrw10\brdrcf1\cellx7364
      \intbl {\f0 {\f0\fs20 2018-04-04 15:55}}\cell
      \pard\plain
      
      \pard\plain\uc0\qr\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clbrdrb\brdrs\brdrw10\brdrcf1\clbrdrl\brdrs\brdrw10\brdrcf1\clbrdrr\brdrs\brdrw10\brdrcf1\cellx8416
      \intbl {\f0 {\f0\fs20 65100.000}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clbrdrb\brdrs\brdrw10\brdrcf1\clbrdrl\brdrs\brdrw10\brdrcf1\clbrdrr\brdrs\brdrw10\brdrcf1\cellx9468
      \intbl {\f0 {\f0\fs20 row_4}}\cell
      \pard\plain
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clbrdrt\brdrdb\brdrw20\brdrcf1\clbrdrb\brdrs\brdrw10\brdrcf1\clbrdrl\brdrs\brdrw10\brdrcf1\clbrdrr\brdrs\brdrw10\brdrcf1\cellx1052
      \intbl {\f0 {\f0\fs20 median}}\cell
      \pard\plain
      
      \pard\plain\uc0\qr\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clbrdrt\brdrdb\brdrw20\brdrcf1\clbrdrb\brdrs\brdrw10\brdrcf1\clbrdrl\brdrs\brdrw10\brdrcf1\clbrdrr\brdrs\brdrw10\brdrcf1\cellx2104
      \intbl {\f0 {\f0\fs20 17.78}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clbrdrt\brdrdb\brdrw20\brdrcf1\clbrdrb\brdrs\brdrw10\brdrcf1\clbrdrl\brdrs\brdrw10\brdrcf1\clbrdrr\brdrs\brdrw10\brdrcf1\cellx3156
      \intbl {\f0 {\f0\fs20 \'97}}\cell
      \pard\plain
      
      \pard\plain\uc0\qc\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clbrdrt\brdrdb\brdrw20\brdrcf1\clbrdrb\brdrs\brdrw10\brdrcf1\clbrdrl\brdrs\brdrw10\brdrcf1\clbrdrr\brdrs\brdrw10\brdrcf1\cellx4208
      \intbl {\f0 {\f0\fs20 \'97}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clbrdrt\brdrdb\brdrw20\brdrcf1\clbrdrb\brdrs\brdrw10\brdrcf1\clbrdrl\brdrs\brdrw10\brdrcf1\clbrdrr\brdrs\brdrw10\brdrcf1\cellx5260
      \intbl {\f0 {\f0\fs20 \'97}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clbrdrt\brdrdb\brdrw20\brdrcf1\clbrdrb\brdrs\brdrw10\brdrcf1\clbrdrl\brdrs\brdrw10\brdrcf1\clbrdrr\brdrs\brdrw10\brdrcf1\cellx6312
      \intbl {\f0 {\f0\fs20 \'97}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clbrdrt\brdrdb\brdrw20\brdrcf1\clbrdrb\brdrs\brdrw10\brdrcf1\clbrdrl\brdrs\brdrw10\brdrcf1\clbrdrr\brdrs\brdrw10\brdrcf1\cellx7364
      \intbl {\f0 {\f0\fs20 \'97}}\cell
      \pard\plain
      
      \pard\plain\uc0\qr\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clbrdrt\brdrdb\brdrw20\brdrcf1\clbrdrb\brdrs\brdrw10\brdrcf1\clbrdrl\brdrs\brdrw10\brdrcf1\clbrdrr\brdrs\brdrw10\brdrcf1\cellx8416
      \intbl {\f0 {\f0\fs20 33.95}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clbrdrt\brdrdb\brdrw20\brdrcf1\clbrdrb\brdrs\brdrw10\brdrcf1\clbrdrl\brdrs\brdrw10\brdrcf1\clbrdrr\brdrs\brdrw10\brdrcf1\cellx9468
      \intbl {\f0 {\f0\fs20 \'97}}\cell
      \pard\plain
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clbrdrt\brdrs\brdrw40\brdrcf1\clbrdrb\brdrs\brdrw40\brdrcf1\clbrdrl\brdrs\brdrw20\brdrcf1\clbrdrr\brdrs\brdrw20\brdrcf1\cellx9468
      \intbl {\f0\fs20 grp_b}\cell
      \pard\plain
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clbrdrb\brdrs\brdrw10\brdrcf1\clbrdrl\brdrs\brdrw10\brdrcf1\clbrdrr\brdrs\brdrw10\brdrcf1\cellx1052
      \intbl {\f0 {\f0\fs20 }}\cell
      \pard\plain
      
      \pard\plain\uc0\qr\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clbrdrb\brdrs\brdrw10\brdrcf1\clbrdrl\brdrs\brdrw10\brdrcf1\clbrdrr\brdrs\brdrw10\brdrcf1\cellx2104
      \intbl {\f0 {\f0\fs20 5.550e+03}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clbrdrb\brdrs\brdrw10\brdrcf1\clbrdrl\brdrs\brdrw10\brdrcf1\clbrdrr\brdrs\brdrw10\brdrcf1\cellx3156
      \intbl {\f0 {\f0\fs20 NA}}\cell
      \pard\plain
      
      \pard\plain\uc0\qc\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clbrdrb\brdrs\brdrw10\brdrcf1\clbrdrl\brdrs\brdrw10\brdrcf1\clbrdrr\brdrs\brdrw10\brdrcf1\cellx4208
      \intbl {\f0 {\f0\fs20 five}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clbrdrb\brdrs\brdrw10\brdrcf1\clbrdrl\brdrs\brdrw10\brdrcf1\clbrdrr\brdrs\brdrw10\brdrcf1\cellx5260
      \intbl {\f0 {\f0\fs20 2015-05-15}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clbrdrb\brdrs\brdrw10\brdrcf1\clbrdrl\brdrs\brdrw10\brdrcf1\clbrdrr\brdrs\brdrw10\brdrcf1\cellx6312
      \intbl {\f0 {\f0\fs20 17:55}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clbrdrb\brdrs\brdrw10\brdrcf1\clbrdrl\brdrs\brdrw10\brdrcf1\clbrdrr\brdrs\brdrw10\brdrcf1\cellx7364
      \intbl {\f0 {\f0\fs20 2018-05-05 04:00}}\cell
      \pard\plain
      
      \pard\plain\uc0\qr\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clbrdrb\brdrs\brdrw10\brdrcf1\clbrdrl\brdrs\brdrw10\brdrcf1\clbrdrr\brdrs\brdrw10\brdrcf1\cellx8416
      \intbl {\f0 {\f0\fs20 1325.810}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clbrdrb\brdrs\brdrw10\brdrcf1\clbrdrl\brdrs\brdrw10\brdrcf1\clbrdrr\brdrs\brdrw10\brdrcf1\cellx9468
      \intbl {\f0 {\f0\fs20 row_5}}\cell
      \pard\plain
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clbrdrb\brdrs\brdrw10\brdrcf1\clbrdrl\brdrs\brdrw10\brdrcf1\clbrdrr\brdrs\brdrw10\brdrcf1\cellx1052
      \intbl {\f0 {\f0\fs20 }}\cell
      \pard\plain
      
      \pard\plain\uc0\qr\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clbrdrb\brdrs\brdrw10\brdrcf1\clbrdrl\brdrs\brdrw10\brdrcf1\clbrdrr\brdrs\brdrw10\brdrcf1\cellx2104
      \intbl {\f0 {\f0\fs20 NA}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clbrdrb\brdrs\brdrw10\brdrcf1\clbrdrl\brdrs\brdrw10\brdrcf1\clbrdrr\brdrs\brdrw10\brdrcf1\cellx3156
      \intbl {\f0 {\f0\fs20 fig}}\cell
      \pard\plain
      
      \pard\plain\uc0\qc\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clbrdrb\brdrs\brdrw10\brdrcf1\clbrdrl\brdrs\brdrw10\brdrcf1\clbrdrr\brdrs\brdrw10\brdrcf1\cellx4208
      \intbl {\f0 {\f0\fs20 six}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clbrdrb\brdrs\brdrw10\brdrcf1\clbrdrl\brdrs\brdrw10\brdrcf1\clbrdrr\brdrs\brdrw10\brdrcf1\cellx5260
      \intbl {\f0 {\f0\fs20 2015-06-15}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clbrdrb\brdrs\brdrw10\brdrcf1\clbrdrl\brdrs\brdrw10\brdrcf1\clbrdrr\brdrs\brdrw10\brdrcf1\cellx6312
      \intbl {\f0 {\f0\fs20 NA}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clbrdrb\brdrs\brdrw10\brdrcf1\clbrdrl\brdrs\brdrw10\brdrcf1\clbrdrr\brdrs\brdrw10\brdrcf1\cellx7364
      \intbl {\f0 {\f0\fs20 2018-06-06 16:11}}\cell
      \pard\plain
      
      \pard\plain\uc0\qr\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clbrdrb\brdrs\brdrw10\brdrcf1\clbrdrl\brdrs\brdrw10\brdrcf1\clbrdrr\brdrs\brdrw10\brdrcf1\cellx8416
      \intbl {\f0 {\f0\fs20 13.255}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clbrdrb\brdrs\brdrw10\brdrcf1\clbrdrl\brdrs\brdrw10\brdrcf1\clbrdrr\brdrs\brdrw10\brdrcf1\cellx9468
      \intbl {\f0 {\f0\fs20 row_6}}\cell
      \pard\plain
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clbrdrb\brdrs\brdrw10\brdrcf1\clbrdrl\brdrs\brdrw10\brdrcf1\clbrdrr\brdrs\brdrw10\brdrcf1\cellx1052
      \intbl {\f0 {\f0\fs20 }}\cell
      \pard\plain
      
      \pard\plain\uc0\qr\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clbrdrb\brdrs\brdrw10\brdrcf1\clbrdrl\brdrs\brdrw10\brdrcf1\clbrdrr\brdrs\brdrw10\brdrcf1\cellx2104
      \intbl {\f0 {\f0\fs20 7.770e+05}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clbrdrb\brdrs\brdrw10\brdrcf1\clbrdrl\brdrs\brdrw10\brdrcf1\clbrdrr\brdrs\brdrw10\brdrcf1\cellx3156
      \intbl {\f0 {\f0\fs20 grapefruit}}\cell
      \pard\plain
      
      \pard\plain\uc0\qc\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clbrdrb\brdrs\brdrw10\brdrcf1\clbrdrl\brdrs\brdrw10\brdrcf1\clbrdrr\brdrs\brdrw10\brdrcf1\cellx4208
      \intbl {\f0 {\f0\fs20 seven}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clbrdrb\brdrs\brdrw10\brdrcf1\clbrdrl\brdrs\brdrw10\brdrcf1\clbrdrr\brdrs\brdrw10\brdrcf1\cellx5260
      \intbl {\f0 {\f0\fs20 NA}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clbrdrb\brdrs\brdrw10\brdrcf1\clbrdrl\brdrs\brdrw10\brdrcf1\clbrdrr\brdrs\brdrw10\brdrcf1\cellx6312
      \intbl {\f0 {\f0\fs20 19:10}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clbrdrb\brdrs\brdrw10\brdrcf1\clbrdrl\brdrs\brdrw10\brdrcf1\clbrdrr\brdrs\brdrw10\brdrcf1\cellx7364
      \intbl {\f0 {\f0\fs20 2018-07-07 05:22}}\cell
      \pard\plain
      
      \pard\plain\uc0\qr\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clbrdrb\brdrs\brdrw10\brdrcf1\clbrdrl\brdrs\brdrw10\brdrcf1\clbrdrr\brdrs\brdrw10\brdrcf1\cellx8416
      \intbl {\f0 {\f0\fs20 NA}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clbrdrb\brdrs\brdrw10\brdrcf1\clbrdrl\brdrs\brdrw10\brdrcf1\clbrdrr\brdrs\brdrw10\brdrcf1\cellx9468
      \intbl {\f0 {\f0\fs20 row_7}}\cell
      \pard\plain
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clbrdrb\brdrs\brdrw10\brdrcf1\clbrdrl\brdrs\brdrw10\brdrcf1\clbrdrr\brdrs\brdrw10\brdrcf1\cellx1052
      \intbl {\f0 {\f0\fs20 }}\cell
      \pard\plain
      
      \pard\plain\uc0\qr\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clbrdrb\brdrs\brdrw10\brdrcf1\clbrdrl\brdrs\brdrw10\brdrcf1\clbrdrr\brdrs\brdrw10\brdrcf1\cellx2104
      \intbl {\f0 {\f0\fs20 8.880e+06}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clbrdrb\brdrs\brdrw10\brdrcf1\clbrdrl\brdrs\brdrw10\brdrcf1\clbrdrr\brdrs\brdrw10\brdrcf1\cellx3156
      \intbl {\f0 {\f0\fs20 honeydew}}\cell
      \pard\plain
      
      \pard\plain\uc0\qc\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clbrdrb\brdrs\brdrw10\brdrcf1\clbrdrl\brdrs\brdrw10\brdrcf1\clbrdrr\brdrs\brdrw10\brdrcf1\cellx4208
      \intbl {\f0 {\f0\fs20 eight}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clbrdrb\brdrs\brdrw10\brdrcf1\clbrdrl\brdrs\brdrw10\brdrcf1\clbrdrr\brdrs\brdrw10\brdrcf1\cellx5260
      \intbl {\f0 {\f0\fs20 2015-08-15}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clbrdrb\brdrs\brdrw10\brdrcf1\clbrdrl\brdrs\brdrw10\brdrcf1\clbrdrr\brdrs\brdrw10\brdrcf1\cellx6312
      \intbl {\f0 {\f0\fs20 20:20}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clbrdrb\brdrs\brdrw10\brdrcf1\clbrdrl\brdrs\brdrw10\brdrcf1\clbrdrr\brdrs\brdrw10\brdrcf1\cellx7364
      \intbl {\f0 {\f0\fs20 NA}}\cell
      \pard\plain
      
      \pard\plain\uc0\qr\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clbrdrb\brdrs\brdrw10\brdrcf1\clbrdrl\brdrs\brdrw10\brdrcf1\clbrdrr\brdrs\brdrw10\brdrcf1\cellx8416
      \intbl {\f0 {\f0\fs20 0.440}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clbrdrb\brdrs\brdrw10\brdrcf1\clbrdrl\brdrs\brdrw10\brdrcf1\clbrdrr\brdrs\brdrw10\brdrcf1\cellx9468
      \intbl {\f0 {\f0\fs20 row_8}}\cell
      \pard\plain
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clbrdrt\brdrdb\brdrw20\brdrcf1\clbrdrb\brdrs\brdrw10\brdrcf1\clbrdrl\brdrs\brdrw10\brdrcf1\clbrdrr\brdrs\brdrw10\brdrcf1\cellx1052
      \intbl {\f0 {\f0\fs20 median}}\cell
      \pard\plain
      
      \pard\plain\uc0\qr\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clbrdrt\brdrdb\brdrw20\brdrcf1\clbrdrb\brdrs\brdrw10\brdrcf1\clbrdrl\brdrs\brdrw10\brdrcf1\clbrdrr\brdrs\brdrw10\brdrcf1\cellx2104
      \intbl {\f0 {\f0\fs20 777,000.00}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clbrdrt\brdrdb\brdrw20\brdrcf1\clbrdrb\brdrs\brdrw10\brdrcf1\clbrdrl\brdrs\brdrw10\brdrcf1\clbrdrr\brdrs\brdrw10\brdrcf1\cellx3156
      \intbl {\f0 {\f0\fs20 \'97}}\cell
      \pard\plain
      
      \pard\plain\uc0\qc\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clbrdrt\brdrdb\brdrw20\brdrcf1\clbrdrb\brdrs\brdrw10\brdrcf1\clbrdrl\brdrs\brdrw10\brdrcf1\clbrdrr\brdrs\brdrw10\brdrcf1\cellx4208
      \intbl {\f0 {\f0\fs20 \'97}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clbrdrt\brdrdb\brdrw20\brdrcf1\clbrdrb\brdrs\brdrw10\brdrcf1\clbrdrl\brdrs\brdrw10\brdrcf1\clbrdrr\brdrs\brdrw10\brdrcf1\cellx5260
      \intbl {\f0 {\f0\fs20 \'97}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clbrdrt\brdrdb\brdrw20\brdrcf1\clbrdrb\brdrs\brdrw10\brdrcf1\clbrdrl\brdrs\brdrw10\brdrcf1\clbrdrr\brdrs\brdrw10\brdrcf1\cellx6312
      \intbl {\f0 {\f0\fs20 \'97}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clbrdrt\brdrdb\brdrw20\brdrcf1\clbrdrb\brdrs\brdrw10\brdrcf1\clbrdrl\brdrs\brdrw10\brdrcf1\clbrdrr\brdrs\brdrw10\brdrcf1\cellx7364
      \intbl {\f0 {\f0\fs20 \'97}}\cell
      \pard\plain
      
      \pard\plain\uc0\qr\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clbrdrt\brdrdb\brdrw20\brdrcf1\clbrdrb\brdrs\brdrw10\brdrcf1\clbrdrl\brdrs\brdrw10\brdrcf1\clbrdrr\brdrs\brdrw10\brdrcf1\cellx8416
      \intbl {\f0 {\f0\fs20 13.26}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clbrdrt\brdrdb\brdrw20\brdrcf1\clbrdrb\brdrs\brdrw10\brdrcf1\clbrdrl\brdrs\brdrw10\brdrcf1\clbrdrr\brdrs\brdrw10\brdrcf1\cellx9468
      \intbl {\f0 {\f0\fs20 \'97}}\cell
      \pard\plain
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clbrdrb\brdrs\brdrw10\brdrcf1\clbrdrl\brdrs\brdrw10\brdrcf1\clbrdrr\brdrs\brdrw10\brdrcf1\clbrdrt\brdrdb\brdrw50\brdrcf1\cellx1052
      \intbl {\f0 {\f0\fs20 min}}\cell
      \pard\plain
      
      \pard\plain\uc0\qr\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clbrdrb\brdrs\brdrw10\brdrcf1\clbrdrl\brdrs\brdrw10\brdrcf1\clbrdrr\brdrs\brdrw10\brdrcf1\clbrdrt\brdrdb\brdrw50\brdrcf1\cellx2104
      \intbl {\f0 {\f0\fs20 0.11}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clbrdrb\brdrs\brdrw10\brdrcf1\clbrdrl\brdrs\brdrw10\brdrcf1\clbrdrr\brdrs\brdrw10\brdrcf1\clbrdrt\brdrdb\brdrw50\brdrcf1\cellx3156
      \intbl {\f0 {\f0\fs20 \'97}}\cell
      \pard\plain
      
      \pard\plain\uc0\qc\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clbrdrb\brdrs\brdrw10\brdrcf1\clbrdrl\brdrs\brdrw10\brdrcf1\clbrdrr\brdrs\brdrw10\brdrcf1\clbrdrt\brdrdb\brdrw50\brdrcf1\cellx4208
      \intbl {\f0 {\f0\fs20 \'97}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clbrdrb\brdrs\brdrw10\brdrcf1\clbrdrl\brdrs\brdrw10\brdrcf1\clbrdrr\brdrs\brdrw10\brdrcf1\clbrdrt\brdrdb\brdrw50\brdrcf1\cellx5260
      \intbl {\f0 {\f0\fs20 \'97}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clbrdrb\brdrs\brdrw10\brdrcf1\clbrdrl\brdrs\brdrw10\brdrcf1\clbrdrr\brdrs\brdrw10\brdrcf1\clbrdrt\brdrdb\brdrw50\brdrcf1\cellx6312
      \intbl {\f0 {\f0\fs20 \'97}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clbrdrb\brdrs\brdrw10\brdrcf1\clbrdrl\brdrs\brdrw10\brdrcf1\clbrdrr\brdrs\brdrw10\brdrcf1\clbrdrt\brdrdb\brdrw50\brdrcf1\cellx7364
      \intbl {\f0 {\f0\fs20 \'97}}\cell
      \pard\plain
      
      \pard\plain\uc0\qr\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clbrdrb\brdrs\brdrw10\brdrcf1\clbrdrl\brdrs\brdrw10\brdrcf1\clbrdrr\brdrs\brdrw10\brdrcf1\clbrdrt\brdrdb\brdrw50\brdrcf1\cellx8416
      \intbl {\f0 {\f0\fs20 0.44}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clbrdrb\brdrs\brdrw10\brdrcf1\clbrdrl\brdrs\brdrw10\brdrcf1\clbrdrr\brdrs\brdrw10\brdrcf1\clbrdrt\brdrdb\brdrw50\brdrcf1\cellx9468
      \intbl {\f0 {\f0\fs20 \'97}}\cell
      \pard\plain
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clbrdrb\brdrs\brdrw10\brdrcf1\clbrdrl\brdrs\brdrw10\brdrcf1\clbrdrr\brdrs\brdrw10\brdrcf1\clbrdrt\brdrs\brdrw10\brdrcf1\cellx1052
      \intbl {\f0 {\f0\fs20 max}}\cell
      \pard\plain
      
      \pard\plain\uc0\qr\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clbrdrb\brdrs\brdrw10\brdrcf1\clbrdrl\brdrs\brdrw10\brdrcf1\clbrdrr\brdrs\brdrw10\brdrcf1\clbrdrt\brdrs\brdrw10\brdrcf1\cellx2104
      \intbl {\f0 {\f0\fs20 8,880,000.00}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clbrdrb\brdrs\brdrw10\brdrcf1\clbrdrl\brdrs\brdrw10\brdrcf1\clbrdrr\brdrs\brdrw10\brdrcf1\clbrdrt\brdrs\brdrw10\brdrcf1\cellx3156
      \intbl {\f0 {\f0\fs20 \'97}}\cell
      \pard\plain
      
      \pard\plain\uc0\qc\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clbrdrb\brdrs\brdrw10\brdrcf1\clbrdrl\brdrs\brdrw10\brdrcf1\clbrdrr\brdrs\brdrw10\brdrcf1\clbrdrt\brdrs\brdrw10\brdrcf1\cellx4208
      \intbl {\f0 {\f0\fs20 \'97}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clbrdrb\brdrs\brdrw10\brdrcf1\clbrdrl\brdrs\brdrw10\brdrcf1\clbrdrr\brdrs\brdrw10\brdrcf1\clbrdrt\brdrs\brdrw10\brdrcf1\cellx5260
      \intbl {\f0 {\f0\fs20 \'97}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clbrdrb\brdrs\brdrw10\brdrcf1\clbrdrl\brdrs\brdrw10\brdrcf1\clbrdrr\brdrs\brdrw10\brdrcf1\clbrdrt\brdrs\brdrw10\brdrcf1\cellx6312
      \intbl {\f0 {\f0\fs20 \'97}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clbrdrb\brdrs\brdrw10\brdrcf1\clbrdrl\brdrs\brdrw10\brdrcf1\clbrdrr\brdrs\brdrw10\brdrcf1\clbrdrt\brdrs\brdrw10\brdrcf1\cellx7364
      \intbl {\f0 {\f0\fs20 \'97}}\cell
      \pard\plain
      
      \pard\plain\uc0\qr\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clbrdrb\brdrs\brdrw10\brdrcf1\clbrdrl\brdrs\brdrw10\brdrcf1\clbrdrr\brdrs\brdrw10\brdrcf1\clbrdrt\brdrs\brdrw10\brdrcf1\cellx8416
      \intbl {\f0 {\f0\fs20 65,100.00}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clbrdrb\brdrs\brdrw10\brdrcf1\clbrdrl\brdrs\brdrw10\brdrcf1\clbrdrr\brdrs\brdrw10\brdrcf1\clbrdrt\brdrs\brdrw10\brdrcf1\cellx9468
      \intbl {\f0 {\f0\fs20 \'97}}\cell
      \pard\plain
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clbrdrb\brdrs\brdrw50\brdrcf1\clbrdrl\brdrs\brdrw10\brdrcf1\clbrdrr\brdrs\brdrw10\brdrcf1\clbrdrt\brdrs\brdrw10\brdrcf1\cellx1052
      \intbl {\f0 {\f0\fs20 avg}}\cell
      \pard\plain
      
      \pard\plain\uc0\qr\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clbrdrb\brdrs\brdrw50\brdrcf1\clbrdrl\brdrs\brdrw10\brdrcf1\clbrdrr\brdrs\brdrw10\brdrcf1\clbrdrt\brdrs\brdrw10\brdrcf1\cellx2104
      \intbl {\f0 {\f0\fs20 1,380,432.87}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clbrdrb\brdrs\brdrw50\brdrcf1\clbrdrl\brdrs\brdrw10\brdrcf1\clbrdrr\brdrs\brdrw10\brdrcf1\clbrdrt\brdrs\brdrw10\brdrcf1\cellx3156
      \intbl {\f0 {\f0\fs20 \'97}}\cell
      \pard\plain
      
      \pard\plain\uc0\qc\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clbrdrb\brdrs\brdrw50\brdrcf1\clbrdrl\brdrs\brdrw10\brdrcf1\clbrdrr\brdrs\brdrw10\brdrcf1\clbrdrt\brdrs\brdrw10\brdrcf1\cellx4208
      \intbl {\f0 {\f0\fs20 \'97}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clbrdrb\brdrs\brdrw50\brdrcf1\clbrdrl\brdrs\brdrw10\brdrcf1\clbrdrr\brdrs\brdrw10\brdrcf1\clbrdrt\brdrs\brdrw10\brdrcf1\cellx5260
      \intbl {\f0 {\f0\fs20 \'97}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clbrdrb\brdrs\brdrw50\brdrcf1\clbrdrl\brdrs\brdrw10\brdrcf1\clbrdrr\brdrs\brdrw10\brdrcf1\clbrdrt\brdrs\brdrw10\brdrcf1\cellx6312
      \intbl {\f0 {\f0\fs20 \'97}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clbrdrb\brdrs\brdrw50\brdrcf1\clbrdrl\brdrs\brdrw10\brdrcf1\clbrdrr\brdrs\brdrw10\brdrcf1\clbrdrt\brdrs\brdrw10\brdrcf1\cellx7364
      \intbl {\f0 {\f0\fs20 \'97}}\cell
      \pard\plain
      
      \pard\plain\uc0\qr\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clbrdrb\brdrs\brdrw50\brdrcf1\clbrdrl\brdrs\brdrw10\brdrcf1\clbrdrr\brdrs\brdrw10\brdrcf1\clbrdrt\brdrs\brdrw10\brdrcf1\cellx8416
      \intbl {\f0 {\f0\fs20 9,501.26}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clbrdrb\brdrs\brdrw50\brdrcf1\clbrdrl\brdrs\brdrw10\brdrcf1\clbrdrr\brdrs\brdrw10\brdrcf1\clbrdrt\brdrs\brdrw10\brdrcf1\cellx9468
      \intbl {\f0 {\f0\fs20 \'97}}\cell
      \pard\plain
      
      \row
      
      }

---

    Code
      .
    Output
      [1] "<table class=\"gt_table\">\n  \n  <thead class=\"gt_col_headings\">\n    <tr>\n      <th class=\"gt_col_heading gt_columns_bottom_border gt_left\" rowspan=\"1\" colspan=\"1\"></th>\n      <th class=\"gt_col_heading gt_columns_bottom_border gt_right\" rowspan=\"1\" colspan=\"1\">num</th>\n      <th class=\"gt_col_heading gt_columns_bottom_border gt_center\" rowspan=\"1\" colspan=\"1\">fctr</th>\n      <th class=\"gt_col_heading gt_columns_bottom_border gt_left\" rowspan=\"1\" colspan=\"1\">date</th>\n      <th class=\"gt_col_heading gt_columns_bottom_border gt_left\" rowspan=\"1\" colspan=\"1\">time</th>\n      <th class=\"gt_col_heading gt_columns_bottom_border gt_left\" rowspan=\"1\" colspan=\"1\">datetime</th>\n      <th class=\"gt_col_heading gt_columns_bottom_border gt_right\" rowspan=\"1\" colspan=\"1\">currency</th>\n      <th class=\"gt_col_heading gt_columns_bottom_border gt_left\" rowspan=\"1\" colspan=\"1\">rowname</th>\n      <th class=\"gt_col_heading gt_columns_bottom_border gt_left\" rowspan=\"1\" colspan=\"1\">group</th>\n    </tr>\n  </thead>\n  <tbody class=\"gt_table_body\">\n    <tr><td class=\"gt_row gt_left gt_stub\">apricot</td>\n<td class=\"gt_row gt_right\">1.111e-01</td>\n<td class=\"gt_row gt_center\">one</td>\n<td class=\"gt_row gt_left\">2015-01-15</td>\n<td class=\"gt_row gt_left\">13:35</td>\n<td class=\"gt_row gt_left\">2018-01-01 02:22</td>\n<td class=\"gt_row gt_right\">49.950</td>\n<td class=\"gt_row gt_left\">row_1</td>\n<td class=\"gt_row gt_left\">grp_a</td></tr>\n    <tr><td class=\"gt_row gt_left gt_stub\">banana</td>\n<td class=\"gt_row gt_right\">2.222e+00</td>\n<td class=\"gt_row gt_center\">two</td>\n<td class=\"gt_row gt_left\">2015-02-15</td>\n<td class=\"gt_row gt_left\">14:40</td>\n<td class=\"gt_row gt_left\">2018-02-02 14:33</td>\n<td class=\"gt_row gt_right\">17.950</td>\n<td class=\"gt_row gt_left\">row_2</td>\n<td class=\"gt_row gt_left\">grp_a</td></tr>\n    <tr><td class=\"gt_row gt_left gt_stub\">coconut</td>\n<td class=\"gt_row gt_right\">3.333e+01</td>\n<td class=\"gt_row gt_center\">three</td>\n<td class=\"gt_row gt_left\">2015-03-15</td>\n<td class=\"gt_row gt_left\">15:45</td>\n<td class=\"gt_row gt_left\">2018-03-03 03:44</td>\n<td class=\"gt_row gt_right\">1.390</td>\n<td class=\"gt_row gt_left\">row_3</td>\n<td class=\"gt_row gt_left\">grp_a</td></tr>\n    <tr><td class=\"gt_row gt_left gt_stub\">durian</td>\n<td class=\"gt_row gt_right\">4.444e+02</td>\n<td class=\"gt_row gt_center\">four</td>\n<td class=\"gt_row gt_left\">2015-04-15</td>\n<td class=\"gt_row gt_left\">16:50</td>\n<td class=\"gt_row gt_left\">2018-04-04 15:55</td>\n<td class=\"gt_row gt_right\">65100.000</td>\n<td class=\"gt_row gt_left\">row_4</td>\n<td class=\"gt_row gt_left\">grp_a</td></tr>\n    <tr><td class=\"gt_row gt_left gt_stub\">NA</td>\n<td class=\"gt_row gt_right\">5.550e+03</td>\n<td class=\"gt_row gt_center\">five</td>\n<td class=\"gt_row gt_left\">2015-05-15</td>\n<td class=\"gt_row gt_left\">17:55</td>\n<td class=\"gt_row gt_left\">2018-05-05 04:00</td>\n<td class=\"gt_row gt_right\">1325.810</td>\n<td class=\"gt_row gt_left\">row_5</td>\n<td class=\"gt_row gt_left\">grp_b</td></tr>\n    <tr><td class=\"gt_row gt_left gt_stub\">fig</td>\n<td class=\"gt_row gt_right\">NA</td>\n<td class=\"gt_row gt_center\">six</td>\n<td class=\"gt_row gt_left\">2015-06-15</td>\n<td class=\"gt_row gt_left\">NA</td>\n<td class=\"gt_row gt_left\">2018-06-06 16:11</td>\n<td class=\"gt_row gt_right\">13.255</td>\n<td class=\"gt_row gt_left\">row_6</td>\n<td class=\"gt_row gt_left\">grp_b</td></tr>\n    <tr><td class=\"gt_row gt_left gt_stub\">grapefruit</td>\n<td class=\"gt_row gt_right\">7.770e+05</td>\n<td class=\"gt_row gt_center\">seven</td>\n<td class=\"gt_row gt_left\">NA</td>\n<td class=\"gt_row gt_left\">19:10</td>\n<td class=\"gt_row gt_left\">2018-07-07 05:22</td>\n<td class=\"gt_row gt_right\">NA</td>\n<td class=\"gt_row gt_left\">row_7</td>\n<td class=\"gt_row gt_left\">grp_b</td></tr>\n    <tr><td class=\"gt_row gt_left gt_stub\">honeydew</td>\n<td class=\"gt_row gt_right\">8.880e+06</td>\n<td class=\"gt_row gt_center\">eight</td>\n<td class=\"gt_row gt_left\">2015-08-15</td>\n<td class=\"gt_row gt_left\">20:20</td>\n<td class=\"gt_row gt_left\">NA</td>\n<td class=\"gt_row gt_right\">0.440</td>\n<td class=\"gt_row gt_left\">row_8</td>\n<td class=\"gt_row gt_left\">grp_b</td></tr>\n    <tr><td class=\"gt_row gt_right gt_stub gt_grand_summary_row gt_first_grand_summary_row\">min</td>\n<td class=\"gt_row gt_right gt_grand_summary_row gt_first_grand_summary_row\">0.11</td>\n<td class=\"gt_row gt_center gt_grand_summary_row gt_first_grand_summary_row\">&mdash;</td>\n<td class=\"gt_row gt_left gt_grand_summary_row gt_first_grand_summary_row\">&mdash;</td>\n<td class=\"gt_row gt_left gt_grand_summary_row gt_first_grand_summary_row\">&mdash;</td>\n<td class=\"gt_row gt_left gt_grand_summary_row gt_first_grand_summary_row\">&mdash;</td>\n<td class=\"gt_row gt_right gt_grand_summary_row gt_first_grand_summary_row\">0.44</td>\n<td class=\"gt_row gt_left gt_grand_summary_row gt_first_grand_summary_row\">&mdash;</td>\n<td class=\"gt_row gt_left gt_grand_summary_row gt_first_grand_summary_row\">&mdash;</td></tr>\n    <tr><td class=\"gt_row gt_right gt_stub gt_grand_summary_row\">max</td>\n<td class=\"gt_row gt_right gt_grand_summary_row\">8,880,000.00</td>\n<td class=\"gt_row gt_center gt_grand_summary_row\">&mdash;</td>\n<td class=\"gt_row gt_left gt_grand_summary_row\">&mdash;</td>\n<td class=\"gt_row gt_left gt_grand_summary_row\">&mdash;</td>\n<td class=\"gt_row gt_left gt_grand_summary_row\">&mdash;</td>\n<td class=\"gt_row gt_right gt_grand_summary_row\">65,100.00</td>\n<td class=\"gt_row gt_left gt_grand_summary_row\">&mdash;</td>\n<td class=\"gt_row gt_left gt_grand_summary_row\">&mdash;</td></tr>\n    <tr><td class=\"gt_row gt_right gt_stub gt_grand_summary_row gt_last_summary_row\">avg</td>\n<td class=\"gt_row gt_right gt_grand_summary_row gt_last_summary_row\">1,380,432.87</td>\n<td class=\"gt_row gt_center gt_grand_summary_row gt_last_summary_row\">&mdash;</td>\n<td class=\"gt_row gt_left gt_grand_summary_row gt_last_summary_row\">&mdash;</td>\n<td class=\"gt_row gt_left gt_grand_summary_row gt_last_summary_row\">&mdash;</td>\n<td class=\"gt_row gt_left gt_grand_summary_row gt_last_summary_row\">&mdash;</td>\n<td class=\"gt_row gt_right gt_grand_summary_row gt_last_summary_row\">9,501.26</td>\n<td class=\"gt_row gt_left gt_grand_summary_row gt_last_summary_row\">&mdash;</td>\n<td class=\"gt_row gt_left gt_grand_summary_row gt_last_summary_row\">&mdash;</td></tr>\n  </tbody>\n  \n  \n</table>"

---

    Code
      .
    Output
      [1] "\\captionsetup[table]{labelformat=empty,skip=1pt}\n\\begin{longtable}{lrclllrll}\n\\toprule\n & num & fctr & date & time & datetime & currency & rowname & group \\\\ \n\\midrule\napricot & 1.111e-01 & one & 2015-01-15 & 13:35 & 2018-01-01 02:22 & 49.950 & row\\_1 & grp\\_a \\\\ \nbanana & 2.222e+00 & two & 2015-02-15 & 14:40 & 2018-02-02 14:33 & 17.950 & row\\_2 & grp\\_a \\\\ \ncoconut & 3.333e+01 & three & 2015-03-15 & 15:45 & 2018-03-03 03:44 & 1.390 & row\\_3 & grp\\_a \\\\ \ndurian & 4.444e+02 & four & 2015-04-15 & 16:50 & 2018-04-04 15:55 & 65100.000 & row\\_4 & grp\\_a \\\\ \nNA & 5.550e+03 & five & 2015-05-15 & 17:55 & 2018-05-05 04:00 & 1325.810 & row\\_5 & grp\\_b \\\\ \nfig & NA & six & 2015-06-15 & NA & 2018-06-06 16:11 & 13.255 & row\\_6 & grp\\_b \\\\ \ngrapefruit & 7.770e+05 & seven & NA & 19:10 & 2018-07-07 05:22 & NA & row\\_7 & grp\\_b \\\\ \nhoneydew & 8.880e+06 & eight & 2015-08-15 & 20:20 & NA & 0.440 & row\\_8 & grp\\_b \\\\ \n \\midrule \n\\midrule \nmin & $0.11$ & — & — & — & — & $0.44$ & — & — \\\\ \nmax & $8,880,000.00$ & — & — & — & — & $65,100.00$ & — & — \\\\ \navg & $1,380,432.87$ & — & — & — & — & $9,501.26$ & — & — \\\\ \n\\bottomrule\n\\end{longtable}\n"

---

    Code
      .
    Output
      {\rtf\ansi\ansicpg1252{\fonttbl{\f0\froman\fcharset0\fprq0 Calibri;}{\f1\froman\fcharset0\fprq0 Courier;}}{\colortbl;\red211\green211\blue211;}
      
      \trowd\trrh0\trhdr
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clbrdrt\brdrs\brdrw40\brdrcf1\clbrdrb\brdrs\brdrw40\brdrcf1\clbrdrl\brdrs\brdrw20\brdrcf1\clbrdrr\brdrs\brdrw20\brdrcf1\cellx1052
      \intbl {\f0 {\f0\fs20 }}\cell
      \pard\plain
      
      \pard\plain\uc0\qr\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clbrdrt\brdrs\brdrw40\brdrcf1\clbrdrb\brdrs\brdrw40\brdrcf1\clbrdrl\brdrs\brdrw20\brdrcf1\clbrdrr\brdrs\brdrw20\brdrcf1\cellx2104
      \intbl {\f0 {\f0\fs20 num}}\cell
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
      \intbl {\f0 {\f0\fs20 rowname}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clbrdrt\brdrs\brdrw40\brdrcf1\clbrdrb\brdrs\brdrw40\brdrcf1\clbrdrl\brdrs\brdrw20\brdrcf1\clbrdrr\brdrs\brdrw20\brdrcf1\cellx9468
      \intbl {\f0 {\f0\fs20 group}}\cell
      \pard\plain
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clbrdrb\brdrs\brdrw10\brdrcf1\clbrdrl\brdrs\brdrw10\brdrcf1\clbrdrr\brdrs\brdrw10\brdrcf1\cellx1052
      \intbl {\f0 {\f0\fs20 apricot}}\cell
      \pard\plain
      
      \pard\plain\uc0\qr\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clbrdrb\brdrs\brdrw10\brdrcf1\clbrdrl\brdrs\brdrw10\brdrcf1\clbrdrr\brdrs\brdrw10\brdrcf1\cellx2104
      \intbl {\f0 {\f0\fs20 1.111e-01}}\cell
      \pard\plain
      
      \pard\plain\uc0\qc\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clbrdrb\brdrs\brdrw10\brdrcf1\clbrdrl\brdrs\brdrw10\brdrcf1\clbrdrr\brdrs\brdrw10\brdrcf1\cellx3156
      \intbl {\f0 {\f0\fs20 one}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clbrdrb\brdrs\brdrw10\brdrcf1\clbrdrl\brdrs\brdrw10\brdrcf1\clbrdrr\brdrs\brdrw10\brdrcf1\cellx4208
      \intbl {\f0 {\f0\fs20 2015-01-15}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clbrdrb\brdrs\brdrw10\brdrcf1\clbrdrl\brdrs\brdrw10\brdrcf1\clbrdrr\brdrs\brdrw10\brdrcf1\cellx5260
      \intbl {\f0 {\f0\fs20 13:35}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clbrdrb\brdrs\brdrw10\brdrcf1\clbrdrl\brdrs\brdrw10\brdrcf1\clbrdrr\brdrs\brdrw10\brdrcf1\cellx6312
      \intbl {\f0 {\f0\fs20 2018-01-01 02:22}}\cell
      \pard\plain
      
      \pard\plain\uc0\qr\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clbrdrb\brdrs\brdrw10\brdrcf1\clbrdrl\brdrs\brdrw10\brdrcf1\clbrdrr\brdrs\brdrw10\brdrcf1\cellx7364
      \intbl {\f0 {\f0\fs20 49.950}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clbrdrb\brdrs\brdrw10\brdrcf1\clbrdrl\brdrs\brdrw10\brdrcf1\clbrdrr\brdrs\brdrw10\brdrcf1\cellx8416
      \intbl {\f0 {\f0\fs20 row_1}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clbrdrb\brdrs\brdrw10\brdrcf1\clbrdrl\brdrs\brdrw10\brdrcf1\clbrdrr\brdrs\brdrw10\brdrcf1\cellx9468
      \intbl {\f0 {\f0\fs20 grp_a}}\cell
      \pard\plain
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clbrdrb\brdrs\brdrw10\brdrcf1\clbrdrl\brdrs\brdrw10\brdrcf1\clbrdrr\brdrs\brdrw10\brdrcf1\cellx1052
      \intbl {\f0 {\f0\fs20 banana}}\cell
      \pard\plain
      
      \pard\plain\uc0\qr\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clbrdrb\brdrs\brdrw10\brdrcf1\clbrdrl\brdrs\brdrw10\brdrcf1\clbrdrr\brdrs\brdrw10\brdrcf1\cellx2104
      \intbl {\f0 {\f0\fs20 2.222e+00}}\cell
      \pard\plain
      
      \pard\plain\uc0\qc\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clbrdrb\brdrs\brdrw10\brdrcf1\clbrdrl\brdrs\brdrw10\brdrcf1\clbrdrr\brdrs\brdrw10\brdrcf1\cellx3156
      \intbl {\f0 {\f0\fs20 two}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clbrdrb\brdrs\brdrw10\brdrcf1\clbrdrl\brdrs\brdrw10\brdrcf1\clbrdrr\brdrs\brdrw10\brdrcf1\cellx4208
      \intbl {\f0 {\f0\fs20 2015-02-15}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clbrdrb\brdrs\brdrw10\brdrcf1\clbrdrl\brdrs\brdrw10\brdrcf1\clbrdrr\brdrs\brdrw10\brdrcf1\cellx5260
      \intbl {\f0 {\f0\fs20 14:40}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clbrdrb\brdrs\brdrw10\brdrcf1\clbrdrl\brdrs\brdrw10\brdrcf1\clbrdrr\brdrs\brdrw10\brdrcf1\cellx6312
      \intbl {\f0 {\f0\fs20 2018-02-02 14:33}}\cell
      \pard\plain
      
      \pard\plain\uc0\qr\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clbrdrb\brdrs\brdrw10\brdrcf1\clbrdrl\brdrs\brdrw10\brdrcf1\clbrdrr\brdrs\brdrw10\brdrcf1\cellx7364
      \intbl {\f0 {\f0\fs20 17.950}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clbrdrb\brdrs\brdrw10\brdrcf1\clbrdrl\brdrs\brdrw10\brdrcf1\clbrdrr\brdrs\brdrw10\brdrcf1\cellx8416
      \intbl {\f0 {\f0\fs20 row_2}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clbrdrb\brdrs\brdrw10\brdrcf1\clbrdrl\brdrs\brdrw10\brdrcf1\clbrdrr\brdrs\brdrw10\brdrcf1\cellx9468
      \intbl {\f0 {\f0\fs20 grp_a}}\cell
      \pard\plain
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clbrdrb\brdrs\brdrw10\brdrcf1\clbrdrl\brdrs\brdrw10\brdrcf1\clbrdrr\brdrs\brdrw10\brdrcf1\cellx1052
      \intbl {\f0 {\f0\fs20 coconut}}\cell
      \pard\plain
      
      \pard\plain\uc0\qr\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clbrdrb\brdrs\brdrw10\brdrcf1\clbrdrl\brdrs\brdrw10\brdrcf1\clbrdrr\brdrs\brdrw10\brdrcf1\cellx2104
      \intbl {\f0 {\f0\fs20 3.333e+01}}\cell
      \pard\plain
      
      \pard\plain\uc0\qc\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clbrdrb\brdrs\brdrw10\brdrcf1\clbrdrl\brdrs\brdrw10\brdrcf1\clbrdrr\brdrs\brdrw10\brdrcf1\cellx3156
      \intbl {\f0 {\f0\fs20 three}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clbrdrb\brdrs\brdrw10\brdrcf1\clbrdrl\brdrs\brdrw10\brdrcf1\clbrdrr\brdrs\brdrw10\brdrcf1\cellx4208
      \intbl {\f0 {\f0\fs20 2015-03-15}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clbrdrb\brdrs\brdrw10\brdrcf1\clbrdrl\brdrs\brdrw10\brdrcf1\clbrdrr\brdrs\brdrw10\brdrcf1\cellx5260
      \intbl {\f0 {\f0\fs20 15:45}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clbrdrb\brdrs\brdrw10\brdrcf1\clbrdrl\brdrs\brdrw10\brdrcf1\clbrdrr\brdrs\brdrw10\brdrcf1\cellx6312
      \intbl {\f0 {\f0\fs20 2018-03-03 03:44}}\cell
      \pard\plain
      
      \pard\plain\uc0\qr\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clbrdrb\brdrs\brdrw10\brdrcf1\clbrdrl\brdrs\brdrw10\brdrcf1\clbrdrr\brdrs\brdrw10\brdrcf1\cellx7364
      \intbl {\f0 {\f0\fs20 1.390}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clbrdrb\brdrs\brdrw10\brdrcf1\clbrdrl\brdrs\brdrw10\brdrcf1\clbrdrr\brdrs\brdrw10\brdrcf1\cellx8416
      \intbl {\f0 {\f0\fs20 row_3}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clbrdrb\brdrs\brdrw10\brdrcf1\clbrdrl\brdrs\brdrw10\brdrcf1\clbrdrr\brdrs\brdrw10\brdrcf1\cellx9468
      \intbl {\f0 {\f0\fs20 grp_a}}\cell
      \pard\plain
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clbrdrb\brdrs\brdrw10\brdrcf1\clbrdrl\brdrs\brdrw10\brdrcf1\clbrdrr\brdrs\brdrw10\brdrcf1\cellx1052
      \intbl {\f0 {\f0\fs20 durian}}\cell
      \pard\plain
      
      \pard\plain\uc0\qr\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clbrdrb\brdrs\brdrw10\brdrcf1\clbrdrl\brdrs\brdrw10\brdrcf1\clbrdrr\brdrs\brdrw10\brdrcf1\cellx2104
      \intbl {\f0 {\f0\fs20 4.444e+02}}\cell
      \pard\plain
      
      \pard\plain\uc0\qc\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clbrdrb\brdrs\brdrw10\brdrcf1\clbrdrl\brdrs\brdrw10\brdrcf1\clbrdrr\brdrs\brdrw10\brdrcf1\cellx3156
      \intbl {\f0 {\f0\fs20 four}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clbrdrb\brdrs\brdrw10\brdrcf1\clbrdrl\brdrs\brdrw10\brdrcf1\clbrdrr\brdrs\brdrw10\brdrcf1\cellx4208
      \intbl {\f0 {\f0\fs20 2015-04-15}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clbrdrb\brdrs\brdrw10\brdrcf1\clbrdrl\brdrs\brdrw10\brdrcf1\clbrdrr\brdrs\brdrw10\brdrcf1\cellx5260
      \intbl {\f0 {\f0\fs20 16:50}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clbrdrb\brdrs\brdrw10\brdrcf1\clbrdrl\brdrs\brdrw10\brdrcf1\clbrdrr\brdrs\brdrw10\brdrcf1\cellx6312
      \intbl {\f0 {\f0\fs20 2018-04-04 15:55}}\cell
      \pard\plain
      
      \pard\plain\uc0\qr\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clbrdrb\brdrs\brdrw10\brdrcf1\clbrdrl\brdrs\brdrw10\brdrcf1\clbrdrr\brdrs\brdrw10\brdrcf1\cellx7364
      \intbl {\f0 {\f0\fs20 65100.000}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clbrdrb\brdrs\brdrw10\brdrcf1\clbrdrl\brdrs\brdrw10\brdrcf1\clbrdrr\brdrs\brdrw10\brdrcf1\cellx8416
      \intbl {\f0 {\f0\fs20 row_4}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clbrdrb\brdrs\brdrw10\brdrcf1\clbrdrl\brdrs\brdrw10\brdrcf1\clbrdrr\brdrs\brdrw10\brdrcf1\cellx9468
      \intbl {\f0 {\f0\fs20 grp_a}}\cell
      \pard\plain
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clbrdrb\brdrs\brdrw10\brdrcf1\clbrdrl\brdrs\brdrw10\brdrcf1\clbrdrr\brdrs\brdrw10\brdrcf1\cellx1052
      \intbl {\f0 {\f0\fs20 NA}}\cell
      \pard\plain
      
      \pard\plain\uc0\qr\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clbrdrb\brdrs\brdrw10\brdrcf1\clbrdrl\brdrs\brdrw10\brdrcf1\clbrdrr\brdrs\brdrw10\brdrcf1\cellx2104
      \intbl {\f0 {\f0\fs20 5.550e+03}}\cell
      \pard\plain
      
      \pard\plain\uc0\qc\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clbrdrb\brdrs\brdrw10\brdrcf1\clbrdrl\brdrs\brdrw10\brdrcf1\clbrdrr\brdrs\brdrw10\brdrcf1\cellx3156
      \intbl {\f0 {\f0\fs20 five}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clbrdrb\brdrs\brdrw10\brdrcf1\clbrdrl\brdrs\brdrw10\brdrcf1\clbrdrr\brdrs\brdrw10\brdrcf1\cellx4208
      \intbl {\f0 {\f0\fs20 2015-05-15}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clbrdrb\brdrs\brdrw10\brdrcf1\clbrdrl\brdrs\brdrw10\brdrcf1\clbrdrr\brdrs\brdrw10\brdrcf1\cellx5260
      \intbl {\f0 {\f0\fs20 17:55}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clbrdrb\brdrs\brdrw10\brdrcf1\clbrdrl\brdrs\brdrw10\brdrcf1\clbrdrr\brdrs\brdrw10\brdrcf1\cellx6312
      \intbl {\f0 {\f0\fs20 2018-05-05 04:00}}\cell
      \pard\plain
      
      \pard\plain\uc0\qr\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clbrdrb\brdrs\brdrw10\brdrcf1\clbrdrl\brdrs\brdrw10\brdrcf1\clbrdrr\brdrs\brdrw10\brdrcf1\cellx7364
      \intbl {\f0 {\f0\fs20 1325.810}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clbrdrb\brdrs\brdrw10\brdrcf1\clbrdrl\brdrs\brdrw10\brdrcf1\clbrdrr\brdrs\brdrw10\brdrcf1\cellx8416
      \intbl {\f0 {\f0\fs20 row_5}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clbrdrb\brdrs\brdrw10\brdrcf1\clbrdrl\brdrs\brdrw10\brdrcf1\clbrdrr\brdrs\brdrw10\brdrcf1\cellx9468
      \intbl {\f0 {\f0\fs20 grp_b}}\cell
      \pard\plain
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clbrdrb\brdrs\brdrw10\brdrcf1\clbrdrl\brdrs\brdrw10\brdrcf1\clbrdrr\brdrs\brdrw10\brdrcf1\cellx1052
      \intbl {\f0 {\f0\fs20 fig}}\cell
      \pard\plain
      
      \pard\plain\uc0\qr\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clbrdrb\brdrs\brdrw10\brdrcf1\clbrdrl\brdrs\brdrw10\brdrcf1\clbrdrr\brdrs\brdrw10\brdrcf1\cellx2104
      \intbl {\f0 {\f0\fs20 NA}}\cell
      \pard\plain
      
      \pard\plain\uc0\qc\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clbrdrb\brdrs\brdrw10\brdrcf1\clbrdrl\brdrs\brdrw10\brdrcf1\clbrdrr\brdrs\brdrw10\brdrcf1\cellx3156
      \intbl {\f0 {\f0\fs20 six}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clbrdrb\brdrs\brdrw10\brdrcf1\clbrdrl\brdrs\brdrw10\brdrcf1\clbrdrr\brdrs\brdrw10\brdrcf1\cellx4208
      \intbl {\f0 {\f0\fs20 2015-06-15}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clbrdrb\brdrs\brdrw10\brdrcf1\clbrdrl\brdrs\brdrw10\brdrcf1\clbrdrr\brdrs\brdrw10\brdrcf1\cellx5260
      \intbl {\f0 {\f0\fs20 NA}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clbrdrb\brdrs\brdrw10\brdrcf1\clbrdrl\brdrs\brdrw10\brdrcf1\clbrdrr\brdrs\brdrw10\brdrcf1\cellx6312
      \intbl {\f0 {\f0\fs20 2018-06-06 16:11}}\cell
      \pard\plain
      
      \pard\plain\uc0\qr\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clbrdrb\brdrs\brdrw10\brdrcf1\clbrdrl\brdrs\brdrw10\brdrcf1\clbrdrr\brdrs\brdrw10\brdrcf1\cellx7364
      \intbl {\f0 {\f0\fs20 13.255}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clbrdrb\brdrs\brdrw10\brdrcf1\clbrdrl\brdrs\brdrw10\brdrcf1\clbrdrr\brdrs\brdrw10\brdrcf1\cellx8416
      \intbl {\f0 {\f0\fs20 row_6}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clbrdrb\brdrs\brdrw10\brdrcf1\clbrdrl\brdrs\brdrw10\brdrcf1\clbrdrr\brdrs\brdrw10\brdrcf1\cellx9468
      \intbl {\f0 {\f0\fs20 grp_b}}\cell
      \pard\plain
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clbrdrb\brdrs\brdrw10\brdrcf1\clbrdrl\brdrs\brdrw10\brdrcf1\clbrdrr\brdrs\brdrw10\brdrcf1\cellx1052
      \intbl {\f0 {\f0\fs20 grapefruit}}\cell
      \pard\plain
      
      \pard\plain\uc0\qr\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clbrdrb\brdrs\brdrw10\brdrcf1\clbrdrl\brdrs\brdrw10\brdrcf1\clbrdrr\brdrs\brdrw10\brdrcf1\cellx2104
      \intbl {\f0 {\f0\fs20 7.770e+05}}\cell
      \pard\plain
      
      \pard\plain\uc0\qc\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clbrdrb\brdrs\brdrw10\brdrcf1\clbrdrl\brdrs\brdrw10\brdrcf1\clbrdrr\brdrs\brdrw10\brdrcf1\cellx3156
      \intbl {\f0 {\f0\fs20 seven}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clbrdrb\brdrs\brdrw10\brdrcf1\clbrdrl\brdrs\brdrw10\brdrcf1\clbrdrr\brdrs\brdrw10\brdrcf1\cellx4208
      \intbl {\f0 {\f0\fs20 NA}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clbrdrb\brdrs\brdrw10\brdrcf1\clbrdrl\brdrs\brdrw10\brdrcf1\clbrdrr\brdrs\brdrw10\brdrcf1\cellx5260
      \intbl {\f0 {\f0\fs20 19:10}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clbrdrb\brdrs\brdrw10\brdrcf1\clbrdrl\brdrs\brdrw10\brdrcf1\clbrdrr\brdrs\brdrw10\brdrcf1\cellx6312
      \intbl {\f0 {\f0\fs20 2018-07-07 05:22}}\cell
      \pard\plain
      
      \pard\plain\uc0\qr\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clbrdrb\brdrs\brdrw10\brdrcf1\clbrdrl\brdrs\brdrw10\brdrcf1\clbrdrr\brdrs\brdrw10\brdrcf1\cellx7364
      \intbl {\f0 {\f0\fs20 NA}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clbrdrb\brdrs\brdrw10\brdrcf1\clbrdrl\brdrs\brdrw10\brdrcf1\clbrdrr\brdrs\brdrw10\brdrcf1\cellx8416
      \intbl {\f0 {\f0\fs20 row_7}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clbrdrb\brdrs\brdrw10\brdrcf1\clbrdrl\brdrs\brdrw10\brdrcf1\clbrdrr\brdrs\brdrw10\brdrcf1\cellx9468
      \intbl {\f0 {\f0\fs20 grp_b}}\cell
      \pard\plain
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clbrdrb\brdrs\brdrw10\brdrcf1\clbrdrl\brdrs\brdrw10\brdrcf1\clbrdrr\brdrs\brdrw10\brdrcf1\cellx1052
      \intbl {\f0 {\f0\fs20 honeydew}}\cell
      \pard\plain
      
      \pard\plain\uc0\qr\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clbrdrb\brdrs\brdrw10\brdrcf1\clbrdrl\brdrs\brdrw10\brdrcf1\clbrdrr\brdrs\brdrw10\brdrcf1\cellx2104
      \intbl {\f0 {\f0\fs20 8.880e+06}}\cell
      \pard\plain
      
      \pard\plain\uc0\qc\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clbrdrb\brdrs\brdrw10\brdrcf1\clbrdrl\brdrs\brdrw10\brdrcf1\clbrdrr\brdrs\brdrw10\brdrcf1\cellx3156
      \intbl {\f0 {\f0\fs20 eight}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clbrdrb\brdrs\brdrw10\brdrcf1\clbrdrl\brdrs\brdrw10\brdrcf1\clbrdrr\brdrs\brdrw10\brdrcf1\cellx4208
      \intbl {\f0 {\f0\fs20 2015-08-15}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clbrdrb\brdrs\brdrw10\brdrcf1\clbrdrl\brdrs\brdrw10\brdrcf1\clbrdrr\brdrs\brdrw10\brdrcf1\cellx5260
      \intbl {\f0 {\f0\fs20 20:20}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clbrdrb\brdrs\brdrw10\brdrcf1\clbrdrl\brdrs\brdrw10\brdrcf1\clbrdrr\brdrs\brdrw10\brdrcf1\cellx6312
      \intbl {\f0 {\f0\fs20 NA}}\cell
      \pard\plain
      
      \pard\plain\uc0\qr\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clbrdrb\brdrs\brdrw10\brdrcf1\clbrdrl\brdrs\brdrw10\brdrcf1\clbrdrr\brdrs\brdrw10\brdrcf1\cellx7364
      \intbl {\f0 {\f0\fs20 0.440}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clbrdrb\brdrs\brdrw10\brdrcf1\clbrdrl\brdrs\brdrw10\brdrcf1\clbrdrr\brdrs\brdrw10\brdrcf1\cellx8416
      \intbl {\f0 {\f0\fs20 row_8}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clbrdrb\brdrs\brdrw10\brdrcf1\clbrdrl\brdrs\brdrw10\brdrcf1\clbrdrr\brdrs\brdrw10\brdrcf1\cellx9468
      \intbl {\f0 {\f0\fs20 grp_b}}\cell
      \pard\plain
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clbrdrb\brdrs\brdrw10\brdrcf1\clbrdrl\brdrs\brdrw10\brdrcf1\clbrdrr\brdrs\brdrw10\brdrcf1\clbrdrt\brdrdb\brdrw50\brdrcf1\cellx1052
      \intbl {\f0 {\f0\fs20 min}}\cell
      \pard\plain
      
      \pard\plain\uc0\qr\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clbrdrb\brdrs\brdrw10\brdrcf1\clbrdrl\brdrs\brdrw10\brdrcf1\clbrdrr\brdrs\brdrw10\brdrcf1\clbrdrt\brdrdb\brdrw50\brdrcf1\cellx2104
      \intbl {\f0 {\f0\fs20 0.11}}\cell
      \pard\plain
      
      \pard\plain\uc0\qc\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clbrdrb\brdrs\brdrw10\brdrcf1\clbrdrl\brdrs\brdrw10\brdrcf1\clbrdrr\brdrs\brdrw10\brdrcf1\clbrdrt\brdrdb\brdrw50\brdrcf1\cellx3156
      \intbl {\f0 {\f0\fs20 \'97}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clbrdrb\brdrs\brdrw10\brdrcf1\clbrdrl\brdrs\brdrw10\brdrcf1\clbrdrr\brdrs\brdrw10\brdrcf1\clbrdrt\brdrdb\brdrw50\brdrcf1\cellx4208
      \intbl {\f0 {\f0\fs20 \'97}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clbrdrb\brdrs\brdrw10\brdrcf1\clbrdrl\brdrs\brdrw10\brdrcf1\clbrdrr\brdrs\brdrw10\brdrcf1\clbrdrt\brdrdb\brdrw50\brdrcf1\cellx5260
      \intbl {\f0 {\f0\fs20 \'97}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clbrdrb\brdrs\brdrw10\brdrcf1\clbrdrl\brdrs\brdrw10\brdrcf1\clbrdrr\brdrs\brdrw10\brdrcf1\clbrdrt\brdrdb\brdrw50\brdrcf1\cellx6312
      \intbl {\f0 {\f0\fs20 \'97}}\cell
      \pard\plain
      
      \pard\plain\uc0\qr\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clbrdrb\brdrs\brdrw10\brdrcf1\clbrdrl\brdrs\brdrw10\brdrcf1\clbrdrr\brdrs\brdrw10\brdrcf1\clbrdrt\brdrdb\brdrw50\brdrcf1\cellx7364
      \intbl {\f0 {\f0\fs20 0.44}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clbrdrb\brdrs\brdrw10\brdrcf1\clbrdrl\brdrs\brdrw10\brdrcf1\clbrdrr\brdrs\brdrw10\brdrcf1\clbrdrt\brdrdb\brdrw50\brdrcf1\cellx8416
      \intbl {\f0 {\f0\fs20 \'97}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clbrdrb\brdrs\brdrw10\brdrcf1\clbrdrl\brdrs\brdrw10\brdrcf1\clbrdrr\brdrs\brdrw10\brdrcf1\clbrdrt\brdrdb\brdrw50\brdrcf1\cellx9468
      \intbl {\f0 {\f0\fs20 \'97}}\cell
      \pard\plain
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clbrdrb\brdrs\brdrw10\brdrcf1\clbrdrl\brdrs\brdrw10\brdrcf1\clbrdrr\brdrs\brdrw10\brdrcf1\clbrdrt\brdrs\brdrw10\brdrcf1\cellx1052
      \intbl {\f0 {\f0\fs20 max}}\cell
      \pard\plain
      
      \pard\plain\uc0\qr\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clbrdrb\brdrs\brdrw10\brdrcf1\clbrdrl\brdrs\brdrw10\brdrcf1\clbrdrr\brdrs\brdrw10\brdrcf1\clbrdrt\brdrs\brdrw10\brdrcf1\cellx2104
      \intbl {\f0 {\f0\fs20 8,880,000.00}}\cell
      \pard\plain
      
      \pard\plain\uc0\qc\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clbrdrb\brdrs\brdrw10\brdrcf1\clbrdrl\brdrs\brdrw10\brdrcf1\clbrdrr\brdrs\brdrw10\brdrcf1\clbrdrt\brdrs\brdrw10\brdrcf1\cellx3156
      \intbl {\f0 {\f0\fs20 \'97}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clbrdrb\brdrs\brdrw10\brdrcf1\clbrdrl\brdrs\brdrw10\brdrcf1\clbrdrr\brdrs\brdrw10\brdrcf1\clbrdrt\brdrs\brdrw10\brdrcf1\cellx4208
      \intbl {\f0 {\f0\fs20 \'97}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clbrdrb\brdrs\brdrw10\brdrcf1\clbrdrl\brdrs\brdrw10\brdrcf1\clbrdrr\brdrs\brdrw10\brdrcf1\clbrdrt\brdrs\brdrw10\brdrcf1\cellx5260
      \intbl {\f0 {\f0\fs20 \'97}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clbrdrb\brdrs\brdrw10\brdrcf1\clbrdrl\brdrs\brdrw10\brdrcf1\clbrdrr\brdrs\brdrw10\brdrcf1\clbrdrt\brdrs\brdrw10\brdrcf1\cellx6312
      \intbl {\f0 {\f0\fs20 \'97}}\cell
      \pard\plain
      
      \pard\plain\uc0\qr\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clbrdrb\brdrs\brdrw10\brdrcf1\clbrdrl\brdrs\brdrw10\brdrcf1\clbrdrr\brdrs\brdrw10\brdrcf1\clbrdrt\brdrs\brdrw10\brdrcf1\cellx7364
      \intbl {\f0 {\f0\fs20 65,100.00}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clbrdrb\brdrs\brdrw10\brdrcf1\clbrdrl\brdrs\brdrw10\brdrcf1\clbrdrr\brdrs\brdrw10\brdrcf1\clbrdrt\brdrs\brdrw10\brdrcf1\cellx8416
      \intbl {\f0 {\f0\fs20 \'97}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clbrdrb\brdrs\brdrw10\brdrcf1\clbrdrl\brdrs\brdrw10\brdrcf1\clbrdrr\brdrs\brdrw10\brdrcf1\clbrdrt\brdrs\brdrw10\brdrcf1\cellx9468
      \intbl {\f0 {\f0\fs20 \'97}}\cell
      \pard\plain
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clbrdrb\brdrs\brdrw50\brdrcf1\clbrdrl\brdrs\brdrw10\brdrcf1\clbrdrr\brdrs\brdrw10\brdrcf1\clbrdrt\brdrs\brdrw10\brdrcf1\cellx1052
      \intbl {\f0 {\f0\fs20 avg}}\cell
      \pard\plain
      
      \pard\plain\uc0\qr\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clbrdrb\brdrs\brdrw50\brdrcf1\clbrdrl\brdrs\brdrw10\brdrcf1\clbrdrr\brdrs\brdrw10\brdrcf1\clbrdrt\brdrs\brdrw10\brdrcf1\cellx2104
      \intbl {\f0 {\f0\fs20 1,380,432.87}}\cell
      \pard\plain
      
      \pard\plain\uc0\qc\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clbrdrb\brdrs\brdrw50\brdrcf1\clbrdrl\brdrs\brdrw10\brdrcf1\clbrdrr\brdrs\brdrw10\brdrcf1\clbrdrt\brdrs\brdrw10\brdrcf1\cellx3156
      \intbl {\f0 {\f0\fs20 \'97}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clbrdrb\brdrs\brdrw50\brdrcf1\clbrdrl\brdrs\brdrw10\brdrcf1\clbrdrr\brdrs\brdrw10\brdrcf1\clbrdrt\brdrs\brdrw10\brdrcf1\cellx4208
      \intbl {\f0 {\f0\fs20 \'97}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clbrdrb\brdrs\brdrw50\brdrcf1\clbrdrl\brdrs\brdrw10\brdrcf1\clbrdrr\brdrs\brdrw10\brdrcf1\clbrdrt\brdrs\brdrw10\brdrcf1\cellx5260
      \intbl {\f0 {\f0\fs20 \'97}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clbrdrb\brdrs\brdrw50\brdrcf1\clbrdrl\brdrs\brdrw10\brdrcf1\clbrdrr\brdrs\brdrw10\brdrcf1\clbrdrt\brdrs\brdrw10\brdrcf1\cellx6312
      \intbl {\f0 {\f0\fs20 \'97}}\cell
      \pard\plain
      
      \pard\plain\uc0\qr\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clbrdrb\brdrs\brdrw50\brdrcf1\clbrdrl\brdrs\brdrw10\brdrcf1\clbrdrr\brdrs\brdrw10\brdrcf1\clbrdrt\brdrs\brdrw10\brdrcf1\cellx7364
      \intbl {\f0 {\f0\fs20 9,501.26}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clbrdrb\brdrs\brdrw50\brdrcf1\clbrdrl\brdrs\brdrw10\brdrcf1\clbrdrr\brdrs\brdrw10\brdrcf1\clbrdrt\brdrs\brdrw10\brdrcf1\cellx8416
      \intbl {\f0 {\f0\fs20 \'97}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clbrdrb\brdrs\brdrw50\brdrcf1\clbrdrl\brdrs\brdrw10\brdrcf1\clbrdrr\brdrs\brdrw10\brdrcf1\clbrdrt\brdrs\brdrw10\brdrcf1\cellx9468
      \intbl {\f0 {\f0\fs20 \'97}}\cell
      \pard\plain
      
      \row
      
      }

---

    Code
      .
    Output
      [1] "<table class=\"gt_table\">\n  \n  <thead class=\"gt_col_headings\">\n    <tr>\n      <th class=\"gt_col_heading gt_columns_bottom_border gt_left\" rowspan=\"1\" colspan=\"1\"></th>\n      <th class=\"gt_col_heading gt_columns_bottom_border gt_right\" rowspan=\"1\" colspan=\"1\">num</th>\n      <th class=\"gt_col_heading gt_columns_bottom_border gt_center\" rowspan=\"1\" colspan=\"1\">fctr</th>\n      <th class=\"gt_col_heading gt_columns_bottom_border gt_left\" rowspan=\"1\" colspan=\"1\">date</th>\n      <th class=\"gt_col_heading gt_columns_bottom_border gt_left\" rowspan=\"1\" colspan=\"1\">time</th>\n      <th class=\"gt_col_heading gt_columns_bottom_border gt_left\" rowspan=\"1\" colspan=\"1\">datetime</th>\n      <th class=\"gt_col_heading gt_columns_bottom_border gt_right\" rowspan=\"1\" colspan=\"1\">currency</th>\n      <th class=\"gt_col_heading gt_columns_bottom_border gt_left\" rowspan=\"1\" colspan=\"1\">rowname</th>\n    </tr>\n  </thead>\n  <tbody class=\"gt_table_body\">\n    <tr class=\"gt_group_heading_row\">\n      <td colspan=\"8\" class=\"gt_group_heading\">grp_a</td>\n    </tr>\n    <tr><td class=\"gt_row gt_left gt_stub\">apricot</td>\n<td class=\"gt_row gt_right\">1.111e-01</td>\n<td class=\"gt_row gt_center\">one</td>\n<td class=\"gt_row gt_left\">2015-01-15</td>\n<td class=\"gt_row gt_left\">13:35</td>\n<td class=\"gt_row gt_left\">2018-01-01 02:22</td>\n<td class=\"gt_row gt_right\">49.950</td>\n<td class=\"gt_row gt_left\">row_1</td></tr>\n    <tr><td class=\"gt_row gt_left gt_stub\">banana</td>\n<td class=\"gt_row gt_right\">2.222e+00</td>\n<td class=\"gt_row gt_center\">two</td>\n<td class=\"gt_row gt_left\">2015-02-15</td>\n<td class=\"gt_row gt_left\">14:40</td>\n<td class=\"gt_row gt_left\">2018-02-02 14:33</td>\n<td class=\"gt_row gt_right\">17.950</td>\n<td class=\"gt_row gt_left\">row_2</td></tr>\n    <tr><td class=\"gt_row gt_left gt_stub\">coconut</td>\n<td class=\"gt_row gt_right\">3.333e+01</td>\n<td class=\"gt_row gt_center\">three</td>\n<td class=\"gt_row gt_left\">2015-03-15</td>\n<td class=\"gt_row gt_left\">15:45</td>\n<td class=\"gt_row gt_left\">2018-03-03 03:44</td>\n<td class=\"gt_row gt_right\">1.390</td>\n<td class=\"gt_row gt_left\">row_3</td></tr>\n    <tr><td class=\"gt_row gt_left gt_stub\">durian</td>\n<td class=\"gt_row gt_right\">4.444e+02</td>\n<td class=\"gt_row gt_center\">four</td>\n<td class=\"gt_row gt_left\">2015-04-15</td>\n<td class=\"gt_row gt_left\">16:50</td>\n<td class=\"gt_row gt_left\">2018-04-04 15:55</td>\n<td class=\"gt_row gt_right\">65100.000</td>\n<td class=\"gt_row gt_left\">row_4</td></tr>\n    <tr><td class=\"gt_row gt_right gt_stub gt_summary_row gt_first_summary_row gt_last_summary_row\">median</td>\n<td class=\"gt_row gt_right gt_summary_row gt_first_summary_row gt_last_summary_row\">17.78</td>\n<td class=\"gt_row gt_center gt_summary_row gt_first_summary_row gt_last_summary_row\">&mdash;</td>\n<td class=\"gt_row gt_left gt_summary_row gt_first_summary_row gt_last_summary_row\">&mdash;</td>\n<td class=\"gt_row gt_left gt_summary_row gt_first_summary_row gt_last_summary_row\">&mdash;</td>\n<td class=\"gt_row gt_left gt_summary_row gt_first_summary_row gt_last_summary_row\">&mdash;</td>\n<td class=\"gt_row gt_right gt_summary_row gt_first_summary_row gt_last_summary_row\">33.95</td>\n<td class=\"gt_row gt_left gt_summary_row gt_first_summary_row gt_last_summary_row\">&mdash;</td></tr>\n    <tr class=\"gt_group_heading_row\">\n      <td colspan=\"8\" class=\"gt_group_heading\">grp_b</td>\n    </tr>\n    <tr><td class=\"gt_row gt_left gt_stub\">NA</td>\n<td class=\"gt_row gt_right\">5.550e+03</td>\n<td class=\"gt_row gt_center\">five</td>\n<td class=\"gt_row gt_left\">2015-05-15</td>\n<td class=\"gt_row gt_left\">17:55</td>\n<td class=\"gt_row gt_left\">2018-05-05 04:00</td>\n<td class=\"gt_row gt_right\">1325.810</td>\n<td class=\"gt_row gt_left\">row_5</td></tr>\n    <tr><td class=\"gt_row gt_left gt_stub\">fig</td>\n<td class=\"gt_row gt_right\">NA</td>\n<td class=\"gt_row gt_center\">six</td>\n<td class=\"gt_row gt_left\">2015-06-15</td>\n<td class=\"gt_row gt_left\">NA</td>\n<td class=\"gt_row gt_left\">2018-06-06 16:11</td>\n<td class=\"gt_row gt_right\">13.255</td>\n<td class=\"gt_row gt_left\">row_6</td></tr>\n    <tr><td class=\"gt_row gt_left gt_stub\">grapefruit</td>\n<td class=\"gt_row gt_right\">7.770e+05</td>\n<td class=\"gt_row gt_center\">seven</td>\n<td class=\"gt_row gt_left\">NA</td>\n<td class=\"gt_row gt_left\">19:10</td>\n<td class=\"gt_row gt_left\">2018-07-07 05:22</td>\n<td class=\"gt_row gt_right\">NA</td>\n<td class=\"gt_row gt_left\">row_7</td></tr>\n    <tr><td class=\"gt_row gt_left gt_stub\">honeydew</td>\n<td class=\"gt_row gt_right\">8.880e+06</td>\n<td class=\"gt_row gt_center\">eight</td>\n<td class=\"gt_row gt_left\">2015-08-15</td>\n<td class=\"gt_row gt_left\">20:20</td>\n<td class=\"gt_row gt_left\">NA</td>\n<td class=\"gt_row gt_right\">0.440</td>\n<td class=\"gt_row gt_left\">row_8</td></tr>\n    <tr><td class=\"gt_row gt_right gt_stub gt_summary_row gt_first_summary_row gt_last_summary_row\">median</td>\n<td class=\"gt_row gt_right gt_summary_row gt_first_summary_row gt_last_summary_row\">777,000.00</td>\n<td class=\"gt_row gt_center gt_summary_row gt_first_summary_row gt_last_summary_row\">&mdash;</td>\n<td class=\"gt_row gt_left gt_summary_row gt_first_summary_row gt_last_summary_row\">&mdash;</td>\n<td class=\"gt_row gt_left gt_summary_row gt_first_summary_row gt_last_summary_row\">&mdash;</td>\n<td class=\"gt_row gt_left gt_summary_row gt_first_summary_row gt_last_summary_row\">&mdash;</td>\n<td class=\"gt_row gt_right gt_summary_row gt_first_summary_row gt_last_summary_row\">13.26</td>\n<td class=\"gt_row gt_left gt_summary_row gt_first_summary_row gt_last_summary_row\">&mdash;</td></tr>\n    <tr><td class=\"gt_row gt_right gt_stub gt_grand_summary_row gt_first_grand_summary_row\">min</td>\n<td class=\"gt_row gt_right gt_grand_summary_row gt_first_grand_summary_row\">0.11</td>\n<td class=\"gt_row gt_center gt_grand_summary_row gt_first_grand_summary_row\">&mdash;</td>\n<td class=\"gt_row gt_left gt_grand_summary_row gt_first_grand_summary_row\">&mdash;</td>\n<td class=\"gt_row gt_left gt_grand_summary_row gt_first_grand_summary_row\">&mdash;</td>\n<td class=\"gt_row gt_left gt_grand_summary_row gt_first_grand_summary_row\">&mdash;</td>\n<td class=\"gt_row gt_right gt_grand_summary_row gt_first_grand_summary_row\">0.44</td>\n<td class=\"gt_row gt_left gt_grand_summary_row gt_first_grand_summary_row\">&mdash;</td></tr>\n    <tr><td class=\"gt_row gt_right gt_stub gt_grand_summary_row\">max</td>\n<td class=\"gt_row gt_right gt_grand_summary_row\">8,880,000.00</td>\n<td class=\"gt_row gt_center gt_grand_summary_row\">&mdash;</td>\n<td class=\"gt_row gt_left gt_grand_summary_row\">&mdash;</td>\n<td class=\"gt_row gt_left gt_grand_summary_row\">&mdash;</td>\n<td class=\"gt_row gt_left gt_grand_summary_row\">&mdash;</td>\n<td class=\"gt_row gt_right gt_grand_summary_row\">65,100.00</td>\n<td class=\"gt_row gt_left gt_grand_summary_row\">&mdash;</td></tr>\n    <tr><td class=\"gt_row gt_right gt_stub gt_grand_summary_row gt_last_summary_row\">avg</td>\n<td class=\"gt_row gt_right gt_grand_summary_row gt_last_summary_row\">1,380,432.87</td>\n<td class=\"gt_row gt_center gt_grand_summary_row gt_last_summary_row\">&mdash;</td>\n<td class=\"gt_row gt_left gt_grand_summary_row gt_last_summary_row\">&mdash;</td>\n<td class=\"gt_row gt_left gt_grand_summary_row gt_last_summary_row\">&mdash;</td>\n<td class=\"gt_row gt_left gt_grand_summary_row gt_last_summary_row\">&mdash;</td>\n<td class=\"gt_row gt_right gt_grand_summary_row gt_last_summary_row\">9,501.26</td>\n<td class=\"gt_row gt_left gt_grand_summary_row gt_last_summary_row\">&mdash;</td></tr>\n  </tbody>\n  \n  \n</table>"

---

    Code
      .
    Output
      [1] "\\captionsetup[table]{labelformat=empty,skip=1pt}\n\\begin{longtable}{lrclllrl}\n\\toprule\n & num & fctr & date & time & datetime & currency & rowname \\\\ \n\\midrule\n\\multicolumn{1}{l}{grp\\_a} \\\\ \n\\midrule\napricot & 1.111e-01 & one & 2015-01-15 & 13:35 & 2018-01-01 02:22 & 49.950 & row\\_1 \\\\ \nbanana & 2.222e+00 & two & 2015-02-15 & 14:40 & 2018-02-02 14:33 & 17.950 & row\\_2 \\\\ \ncoconut & 3.333e+01 & three & 2015-03-15 & 15:45 & 2018-03-03 03:44 & 1.390 & row\\_3 \\\\ \ndurian & 4.444e+02 & four & 2015-04-15 & 16:50 & 2018-04-04 15:55 & 65100.000 & row\\_4 \\\\ \n\\midrule \nmedian & $17.78$ & — & — & — & — & $33.95$ & — \\\\ \n\\midrule\n\\multicolumn{1}{l}{grp\\_b} \\\\ \n\\midrule\nNA & 5.550e+03 & five & 2015-05-15 & 17:55 & 2018-05-05 04:00 & 1325.810 & row\\_5 \\\\ \nfig & NA & six & 2015-06-15 & NA & 2018-06-06 16:11 & 13.255 & row\\_6 \\\\ \ngrapefruit & 7.770e+05 & seven & NA & 19:10 & 2018-07-07 05:22 & NA & row\\_7 \\\\ \nhoneydew & 8.880e+06 & eight & 2015-08-15 & 20:20 & NA & 0.440 & row\\_8 \\\\ \n\\midrule \nmedian & $777,000.00$ & — & — & — & — & $13.26$ & — \\\\ \n \\midrule \n\\midrule \nmin & $0.11$ & — & — & — & — & $0.44$ & — \\\\ \nmax & $8,880,000.00$ & — & — & — & — & $65,100.00$ & — \\\\ \navg & $1,380,432.87$ & — & — & — & — & $9,501.26$ & — \\\\ \n\\bottomrule\n\\end{longtable}\n"

---

    Code
      .
    Output
      {\rtf\ansi\ansicpg1252{\fonttbl{\f0\froman\fcharset0\fprq0 Calibri;}{\f1\froman\fcharset0\fprq0 Courier;}}{\colortbl;\red211\green211\blue211;}
      
      \trowd\trrh0\trhdr
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clbrdrt\brdrs\brdrw40\brdrcf1\clbrdrb\brdrs\brdrw40\brdrcf1\clbrdrl\brdrs\brdrw20\brdrcf1\clbrdrr\brdrs\brdrw20\brdrcf1\cellx1184
      \intbl {\f0 {\f0\fs20 }}\cell
      \pard\plain
      
      \pard\plain\uc0\qr\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clbrdrt\brdrs\brdrw40\brdrcf1\clbrdrb\brdrs\brdrw40\brdrcf1\clbrdrl\brdrs\brdrw20\brdrcf1\clbrdrr\brdrs\brdrw20\brdrcf1\cellx2368
      \intbl {\f0 {\f0\fs20 num}}\cell
      \pard\plain
      
      \pard\plain\uc0\qc\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clbrdrt\brdrs\brdrw40\brdrcf1\clbrdrb\brdrs\brdrw40\brdrcf1\clbrdrl\brdrs\brdrw20\brdrcf1\clbrdrr\brdrs\brdrw20\brdrcf1\cellx3552
      \intbl {\f0 {\f0\fs20 fctr}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clbrdrt\brdrs\brdrw40\brdrcf1\clbrdrb\brdrs\brdrw40\brdrcf1\clbrdrl\brdrs\brdrw20\brdrcf1\clbrdrr\brdrs\brdrw20\brdrcf1\cellx4736
      \intbl {\f0 {\f0\fs20 date}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clbrdrt\brdrs\brdrw40\brdrcf1\clbrdrb\brdrs\brdrw40\brdrcf1\clbrdrl\brdrs\brdrw20\brdrcf1\clbrdrr\brdrs\brdrw20\brdrcf1\cellx5920
      \intbl {\f0 {\f0\fs20 time}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clbrdrt\brdrs\brdrw40\brdrcf1\clbrdrb\brdrs\brdrw40\brdrcf1\clbrdrl\brdrs\brdrw20\brdrcf1\clbrdrr\brdrs\brdrw20\brdrcf1\cellx7104
      \intbl {\f0 {\f0\fs20 datetime}}\cell
      \pard\plain
      
      \pard\plain\uc0\qr\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clbrdrt\brdrs\brdrw40\brdrcf1\clbrdrb\brdrs\brdrw40\brdrcf1\clbrdrl\brdrs\brdrw20\brdrcf1\clbrdrr\brdrs\brdrw20\brdrcf1\cellx8288
      \intbl {\f0 {\f0\fs20 currency}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clbrdrt\brdrs\brdrw40\brdrcf1\clbrdrb\brdrs\brdrw40\brdrcf1\clbrdrl\brdrs\brdrw20\brdrcf1\clbrdrr\brdrs\brdrw20\brdrcf1\cellx9472
      \intbl {\f0 {\f0\fs20 rowname}}\cell
      \pard\plain
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clbrdrt\brdrs\brdrw40\brdrcf1\clbrdrb\brdrs\brdrw40\brdrcf1\clbrdrl\brdrs\brdrw20\brdrcf1\clbrdrr\brdrs\brdrw20\brdrcf1\cellx9472
      \intbl {\f0\fs20 grp_a}\cell
      \pard\plain
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clbrdrb\brdrs\brdrw10\brdrcf1\clbrdrl\brdrs\brdrw10\brdrcf1\clbrdrr\brdrs\brdrw10\brdrcf1\cellx1184
      \intbl {\f0 {\f0\fs20 apricot}}\cell
      \pard\plain
      
      \pard\plain\uc0\qr\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clbrdrb\brdrs\brdrw10\brdrcf1\clbrdrl\brdrs\brdrw10\brdrcf1\clbrdrr\brdrs\brdrw10\brdrcf1\cellx2368
      \intbl {\f0 {\f0\fs20 1.111e-01}}\cell
      \pard\plain
      
      \pard\plain\uc0\qc\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clbrdrb\brdrs\brdrw10\brdrcf1\clbrdrl\brdrs\brdrw10\brdrcf1\clbrdrr\brdrs\brdrw10\brdrcf1\cellx3552
      \intbl {\f0 {\f0\fs20 one}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clbrdrb\brdrs\brdrw10\brdrcf1\clbrdrl\brdrs\brdrw10\brdrcf1\clbrdrr\brdrs\brdrw10\brdrcf1\cellx4736
      \intbl {\f0 {\f0\fs20 2015-01-15}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clbrdrb\brdrs\brdrw10\brdrcf1\clbrdrl\brdrs\brdrw10\brdrcf1\clbrdrr\brdrs\brdrw10\brdrcf1\cellx5920
      \intbl {\f0 {\f0\fs20 13:35}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clbrdrb\brdrs\brdrw10\brdrcf1\clbrdrl\brdrs\brdrw10\brdrcf1\clbrdrr\brdrs\brdrw10\brdrcf1\cellx7104
      \intbl {\f0 {\f0\fs20 2018-01-01 02:22}}\cell
      \pard\plain
      
      \pard\plain\uc0\qr\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clbrdrb\brdrs\brdrw10\brdrcf1\clbrdrl\brdrs\brdrw10\brdrcf1\clbrdrr\brdrs\brdrw10\brdrcf1\cellx8288
      \intbl {\f0 {\f0\fs20 49.950}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clbrdrb\brdrs\brdrw10\brdrcf1\clbrdrl\brdrs\brdrw10\brdrcf1\clbrdrr\brdrs\brdrw10\brdrcf1\cellx9472
      \intbl {\f0 {\f0\fs20 row_1}}\cell
      \pard\plain
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clbrdrb\brdrs\brdrw10\brdrcf1\clbrdrl\brdrs\brdrw10\brdrcf1\clbrdrr\brdrs\brdrw10\brdrcf1\cellx1184
      \intbl {\f0 {\f0\fs20 banana}}\cell
      \pard\plain
      
      \pard\plain\uc0\qr\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clbrdrb\brdrs\brdrw10\brdrcf1\clbrdrl\brdrs\brdrw10\brdrcf1\clbrdrr\brdrs\brdrw10\brdrcf1\cellx2368
      \intbl {\f0 {\f0\fs20 2.222e+00}}\cell
      \pard\plain
      
      \pard\plain\uc0\qc\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clbrdrb\brdrs\brdrw10\brdrcf1\clbrdrl\brdrs\brdrw10\brdrcf1\clbrdrr\brdrs\brdrw10\brdrcf1\cellx3552
      \intbl {\f0 {\f0\fs20 two}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clbrdrb\brdrs\brdrw10\brdrcf1\clbrdrl\brdrs\brdrw10\brdrcf1\clbrdrr\brdrs\brdrw10\brdrcf1\cellx4736
      \intbl {\f0 {\f0\fs20 2015-02-15}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clbrdrb\brdrs\brdrw10\brdrcf1\clbrdrl\brdrs\brdrw10\brdrcf1\clbrdrr\brdrs\brdrw10\brdrcf1\cellx5920
      \intbl {\f0 {\f0\fs20 14:40}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clbrdrb\brdrs\brdrw10\brdrcf1\clbrdrl\brdrs\brdrw10\brdrcf1\clbrdrr\brdrs\brdrw10\brdrcf1\cellx7104
      \intbl {\f0 {\f0\fs20 2018-02-02 14:33}}\cell
      \pard\plain
      
      \pard\plain\uc0\qr\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clbrdrb\brdrs\brdrw10\brdrcf1\clbrdrl\brdrs\brdrw10\brdrcf1\clbrdrr\brdrs\brdrw10\brdrcf1\cellx8288
      \intbl {\f0 {\f0\fs20 17.950}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clbrdrb\brdrs\brdrw10\brdrcf1\clbrdrl\brdrs\brdrw10\brdrcf1\clbrdrr\brdrs\brdrw10\brdrcf1\cellx9472
      \intbl {\f0 {\f0\fs20 row_2}}\cell
      \pard\plain
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clbrdrb\brdrs\brdrw10\brdrcf1\clbrdrl\brdrs\brdrw10\brdrcf1\clbrdrr\brdrs\brdrw10\brdrcf1\cellx1184
      \intbl {\f0 {\f0\fs20 coconut}}\cell
      \pard\plain
      
      \pard\plain\uc0\qr\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clbrdrb\brdrs\brdrw10\brdrcf1\clbrdrl\brdrs\brdrw10\brdrcf1\clbrdrr\brdrs\brdrw10\brdrcf1\cellx2368
      \intbl {\f0 {\f0\fs20 3.333e+01}}\cell
      \pard\plain
      
      \pard\plain\uc0\qc\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clbrdrb\brdrs\brdrw10\brdrcf1\clbrdrl\brdrs\brdrw10\brdrcf1\clbrdrr\brdrs\brdrw10\brdrcf1\cellx3552
      \intbl {\f0 {\f0\fs20 three}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clbrdrb\brdrs\brdrw10\brdrcf1\clbrdrl\brdrs\brdrw10\brdrcf1\clbrdrr\brdrs\brdrw10\brdrcf1\cellx4736
      \intbl {\f0 {\f0\fs20 2015-03-15}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clbrdrb\brdrs\brdrw10\brdrcf1\clbrdrl\brdrs\brdrw10\brdrcf1\clbrdrr\brdrs\brdrw10\brdrcf1\cellx5920
      \intbl {\f0 {\f0\fs20 15:45}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clbrdrb\brdrs\brdrw10\brdrcf1\clbrdrl\brdrs\brdrw10\brdrcf1\clbrdrr\brdrs\brdrw10\brdrcf1\cellx7104
      \intbl {\f0 {\f0\fs20 2018-03-03 03:44}}\cell
      \pard\plain
      
      \pard\plain\uc0\qr\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clbrdrb\brdrs\brdrw10\brdrcf1\clbrdrl\brdrs\brdrw10\brdrcf1\clbrdrr\brdrs\brdrw10\brdrcf1\cellx8288
      \intbl {\f0 {\f0\fs20 1.390}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clbrdrb\brdrs\brdrw10\brdrcf1\clbrdrl\brdrs\brdrw10\brdrcf1\clbrdrr\brdrs\brdrw10\brdrcf1\cellx9472
      \intbl {\f0 {\f0\fs20 row_3}}\cell
      \pard\plain
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clbrdrb\brdrs\brdrw10\brdrcf1\clbrdrl\brdrs\brdrw10\brdrcf1\clbrdrr\brdrs\brdrw10\brdrcf1\cellx1184
      \intbl {\f0 {\f0\fs20 durian}}\cell
      \pard\plain
      
      \pard\plain\uc0\qr\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clbrdrb\brdrs\brdrw10\brdrcf1\clbrdrl\brdrs\brdrw10\brdrcf1\clbrdrr\brdrs\brdrw10\brdrcf1\cellx2368
      \intbl {\f0 {\f0\fs20 4.444e+02}}\cell
      \pard\plain
      
      \pard\plain\uc0\qc\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clbrdrb\brdrs\brdrw10\brdrcf1\clbrdrl\brdrs\brdrw10\brdrcf1\clbrdrr\brdrs\brdrw10\brdrcf1\cellx3552
      \intbl {\f0 {\f0\fs20 four}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clbrdrb\brdrs\brdrw10\brdrcf1\clbrdrl\brdrs\brdrw10\brdrcf1\clbrdrr\brdrs\brdrw10\brdrcf1\cellx4736
      \intbl {\f0 {\f0\fs20 2015-04-15}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clbrdrb\brdrs\brdrw10\brdrcf1\clbrdrl\brdrs\brdrw10\brdrcf1\clbrdrr\brdrs\brdrw10\brdrcf1\cellx5920
      \intbl {\f0 {\f0\fs20 16:50}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clbrdrb\brdrs\brdrw10\brdrcf1\clbrdrl\brdrs\brdrw10\brdrcf1\clbrdrr\brdrs\brdrw10\brdrcf1\cellx7104
      \intbl {\f0 {\f0\fs20 2018-04-04 15:55}}\cell
      \pard\plain
      
      \pard\plain\uc0\qr\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clbrdrb\brdrs\brdrw10\brdrcf1\clbrdrl\brdrs\brdrw10\brdrcf1\clbrdrr\brdrs\brdrw10\brdrcf1\cellx8288
      \intbl {\f0 {\f0\fs20 65100.000}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clbrdrb\brdrs\brdrw10\brdrcf1\clbrdrl\brdrs\brdrw10\brdrcf1\clbrdrr\brdrs\brdrw10\brdrcf1\cellx9472
      \intbl {\f0 {\f0\fs20 row_4}}\cell
      \pard\plain
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clbrdrt\brdrdb\brdrw20\brdrcf1\clbrdrb\brdrs\brdrw10\brdrcf1\clbrdrl\brdrs\brdrw10\brdrcf1\clbrdrr\brdrs\brdrw10\brdrcf1\cellx1184
      \intbl {\f0 {\f0\fs20 median}}\cell
      \pard\plain
      
      \pard\plain\uc0\qr\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clbrdrt\brdrdb\brdrw20\brdrcf1\clbrdrb\brdrs\brdrw10\brdrcf1\clbrdrl\brdrs\brdrw10\brdrcf1\clbrdrr\brdrs\brdrw10\brdrcf1\cellx2368
      \intbl {\f0 {\f0\fs20 17.78}}\cell
      \pard\plain
      
      \pard\plain\uc0\qc\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clbrdrt\brdrdb\brdrw20\brdrcf1\clbrdrb\brdrs\brdrw10\brdrcf1\clbrdrl\brdrs\brdrw10\brdrcf1\clbrdrr\brdrs\brdrw10\brdrcf1\cellx3552
      \intbl {\f0 {\f0\fs20 \'97}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clbrdrt\brdrdb\brdrw20\brdrcf1\clbrdrb\brdrs\brdrw10\brdrcf1\clbrdrl\brdrs\brdrw10\brdrcf1\clbrdrr\brdrs\brdrw10\brdrcf1\cellx4736
      \intbl {\f0 {\f0\fs20 \'97}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clbrdrt\brdrdb\brdrw20\brdrcf1\clbrdrb\brdrs\brdrw10\brdrcf1\clbrdrl\brdrs\brdrw10\brdrcf1\clbrdrr\brdrs\brdrw10\brdrcf1\cellx5920
      \intbl {\f0 {\f0\fs20 \'97}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clbrdrt\brdrdb\brdrw20\brdrcf1\clbrdrb\brdrs\brdrw10\brdrcf1\clbrdrl\brdrs\brdrw10\brdrcf1\clbrdrr\brdrs\brdrw10\brdrcf1\cellx7104
      \intbl {\f0 {\f0\fs20 \'97}}\cell
      \pard\plain
      
      \pard\plain\uc0\qr\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clbrdrt\brdrdb\brdrw20\brdrcf1\clbrdrb\brdrs\brdrw10\brdrcf1\clbrdrl\brdrs\brdrw10\brdrcf1\clbrdrr\brdrs\brdrw10\brdrcf1\cellx8288
      \intbl {\f0 {\f0\fs20 33.95}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clbrdrt\brdrdb\brdrw20\brdrcf1\clbrdrb\brdrs\brdrw10\brdrcf1\clbrdrl\brdrs\brdrw10\brdrcf1\clbrdrr\brdrs\brdrw10\brdrcf1\cellx9472
      \intbl {\f0 {\f0\fs20 \'97}}\cell
      \pard\plain
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clbrdrt\brdrs\brdrw40\brdrcf1\clbrdrb\brdrs\brdrw40\brdrcf1\clbrdrl\brdrs\brdrw20\brdrcf1\clbrdrr\brdrs\brdrw20\brdrcf1\cellx9472
      \intbl {\f0\fs20 grp_b}\cell
      \pard\plain
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clbrdrb\brdrs\brdrw10\brdrcf1\clbrdrl\brdrs\brdrw10\brdrcf1\clbrdrr\brdrs\brdrw10\brdrcf1\cellx1184
      \intbl {\f0 {\f0\fs20 NA}}\cell
      \pard\plain
      
      \pard\plain\uc0\qr\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clbrdrb\brdrs\brdrw10\brdrcf1\clbrdrl\brdrs\brdrw10\brdrcf1\clbrdrr\brdrs\brdrw10\brdrcf1\cellx2368
      \intbl {\f0 {\f0\fs20 5.550e+03}}\cell
      \pard\plain
      
      \pard\plain\uc0\qc\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clbrdrb\brdrs\brdrw10\brdrcf1\clbrdrl\brdrs\brdrw10\brdrcf1\clbrdrr\brdrs\brdrw10\brdrcf1\cellx3552
      \intbl {\f0 {\f0\fs20 five}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clbrdrb\brdrs\brdrw10\brdrcf1\clbrdrl\brdrs\brdrw10\brdrcf1\clbrdrr\brdrs\brdrw10\brdrcf1\cellx4736
      \intbl {\f0 {\f0\fs20 2015-05-15}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clbrdrb\brdrs\brdrw10\brdrcf1\clbrdrl\brdrs\brdrw10\brdrcf1\clbrdrr\brdrs\brdrw10\brdrcf1\cellx5920
      \intbl {\f0 {\f0\fs20 17:55}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clbrdrb\brdrs\brdrw10\brdrcf1\clbrdrl\brdrs\brdrw10\brdrcf1\clbrdrr\brdrs\brdrw10\brdrcf1\cellx7104
      \intbl {\f0 {\f0\fs20 2018-05-05 04:00}}\cell
      \pard\plain
      
      \pard\plain\uc0\qr\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clbrdrb\brdrs\brdrw10\brdrcf1\clbrdrl\brdrs\brdrw10\brdrcf1\clbrdrr\brdrs\brdrw10\brdrcf1\cellx8288
      \intbl {\f0 {\f0\fs20 1325.810}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clbrdrb\brdrs\brdrw10\brdrcf1\clbrdrl\brdrs\brdrw10\brdrcf1\clbrdrr\brdrs\brdrw10\brdrcf1\cellx9472
      \intbl {\f0 {\f0\fs20 row_5}}\cell
      \pard\plain
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clbrdrb\brdrs\brdrw10\brdrcf1\clbrdrl\brdrs\brdrw10\brdrcf1\clbrdrr\brdrs\brdrw10\brdrcf1\cellx1184
      \intbl {\f0 {\f0\fs20 fig}}\cell
      \pard\plain
      
      \pard\plain\uc0\qr\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clbrdrb\brdrs\brdrw10\brdrcf1\clbrdrl\brdrs\brdrw10\brdrcf1\clbrdrr\brdrs\brdrw10\brdrcf1\cellx2368
      \intbl {\f0 {\f0\fs20 NA}}\cell
      \pard\plain
      
      \pard\plain\uc0\qc\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clbrdrb\brdrs\brdrw10\brdrcf1\clbrdrl\brdrs\brdrw10\brdrcf1\clbrdrr\brdrs\brdrw10\brdrcf1\cellx3552
      \intbl {\f0 {\f0\fs20 six}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clbrdrb\brdrs\brdrw10\brdrcf1\clbrdrl\brdrs\brdrw10\brdrcf1\clbrdrr\brdrs\brdrw10\brdrcf1\cellx4736
      \intbl {\f0 {\f0\fs20 2015-06-15}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clbrdrb\brdrs\brdrw10\brdrcf1\clbrdrl\brdrs\brdrw10\brdrcf1\clbrdrr\brdrs\brdrw10\brdrcf1\cellx5920
      \intbl {\f0 {\f0\fs20 NA}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clbrdrb\brdrs\brdrw10\brdrcf1\clbrdrl\brdrs\brdrw10\brdrcf1\clbrdrr\brdrs\brdrw10\brdrcf1\cellx7104
      \intbl {\f0 {\f0\fs20 2018-06-06 16:11}}\cell
      \pard\plain
      
      \pard\plain\uc0\qr\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clbrdrb\brdrs\brdrw10\brdrcf1\clbrdrl\brdrs\brdrw10\brdrcf1\clbrdrr\brdrs\brdrw10\brdrcf1\cellx8288
      \intbl {\f0 {\f0\fs20 13.255}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clbrdrb\brdrs\brdrw10\brdrcf1\clbrdrl\brdrs\brdrw10\brdrcf1\clbrdrr\brdrs\brdrw10\brdrcf1\cellx9472
      \intbl {\f0 {\f0\fs20 row_6}}\cell
      \pard\plain
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clbrdrb\brdrs\brdrw10\brdrcf1\clbrdrl\brdrs\brdrw10\brdrcf1\clbrdrr\brdrs\brdrw10\brdrcf1\cellx1184
      \intbl {\f0 {\f0\fs20 grapefruit}}\cell
      \pard\plain
      
      \pard\plain\uc0\qr\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clbrdrb\brdrs\brdrw10\brdrcf1\clbrdrl\brdrs\brdrw10\brdrcf1\clbrdrr\brdrs\brdrw10\brdrcf1\cellx2368
      \intbl {\f0 {\f0\fs20 7.770e+05}}\cell
      \pard\plain
      
      \pard\plain\uc0\qc\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clbrdrb\brdrs\brdrw10\brdrcf1\clbrdrl\brdrs\brdrw10\brdrcf1\clbrdrr\brdrs\brdrw10\brdrcf1\cellx3552
      \intbl {\f0 {\f0\fs20 seven}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clbrdrb\brdrs\brdrw10\brdrcf1\clbrdrl\brdrs\brdrw10\brdrcf1\clbrdrr\brdrs\brdrw10\brdrcf1\cellx4736
      \intbl {\f0 {\f0\fs20 NA}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clbrdrb\brdrs\brdrw10\brdrcf1\clbrdrl\brdrs\brdrw10\brdrcf1\clbrdrr\brdrs\brdrw10\brdrcf1\cellx5920
      \intbl {\f0 {\f0\fs20 19:10}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clbrdrb\brdrs\brdrw10\brdrcf1\clbrdrl\brdrs\brdrw10\brdrcf1\clbrdrr\brdrs\brdrw10\brdrcf1\cellx7104
      \intbl {\f0 {\f0\fs20 2018-07-07 05:22}}\cell
      \pard\plain
      
      \pard\plain\uc0\qr\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clbrdrb\brdrs\brdrw10\brdrcf1\clbrdrl\brdrs\brdrw10\brdrcf1\clbrdrr\brdrs\brdrw10\brdrcf1\cellx8288
      \intbl {\f0 {\f0\fs20 NA}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clbrdrb\brdrs\brdrw10\brdrcf1\clbrdrl\brdrs\brdrw10\brdrcf1\clbrdrr\brdrs\brdrw10\brdrcf1\cellx9472
      \intbl {\f0 {\f0\fs20 row_7}}\cell
      \pard\plain
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clbrdrb\brdrs\brdrw10\brdrcf1\clbrdrl\brdrs\brdrw10\brdrcf1\clbrdrr\brdrs\brdrw10\brdrcf1\cellx1184
      \intbl {\f0 {\f0\fs20 honeydew}}\cell
      \pard\plain
      
      \pard\plain\uc0\qr\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clbrdrb\brdrs\brdrw10\brdrcf1\clbrdrl\brdrs\brdrw10\brdrcf1\clbrdrr\brdrs\brdrw10\brdrcf1\cellx2368
      \intbl {\f0 {\f0\fs20 8.880e+06}}\cell
      \pard\plain
      
      \pard\plain\uc0\qc\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clbrdrb\brdrs\brdrw10\brdrcf1\clbrdrl\brdrs\brdrw10\brdrcf1\clbrdrr\brdrs\brdrw10\brdrcf1\cellx3552
      \intbl {\f0 {\f0\fs20 eight}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clbrdrb\brdrs\brdrw10\brdrcf1\clbrdrl\brdrs\brdrw10\brdrcf1\clbrdrr\brdrs\brdrw10\brdrcf1\cellx4736
      \intbl {\f0 {\f0\fs20 2015-08-15}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clbrdrb\brdrs\brdrw10\brdrcf1\clbrdrl\brdrs\brdrw10\brdrcf1\clbrdrr\brdrs\brdrw10\brdrcf1\cellx5920
      \intbl {\f0 {\f0\fs20 20:20}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clbrdrb\brdrs\brdrw10\brdrcf1\clbrdrl\brdrs\brdrw10\brdrcf1\clbrdrr\brdrs\brdrw10\brdrcf1\cellx7104
      \intbl {\f0 {\f0\fs20 NA}}\cell
      \pard\plain
      
      \pard\plain\uc0\qr\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clbrdrb\brdrs\brdrw10\brdrcf1\clbrdrl\brdrs\brdrw10\brdrcf1\clbrdrr\brdrs\brdrw10\brdrcf1\cellx8288
      \intbl {\f0 {\f0\fs20 0.440}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clbrdrb\brdrs\brdrw10\brdrcf1\clbrdrl\brdrs\brdrw10\brdrcf1\clbrdrr\brdrs\brdrw10\brdrcf1\cellx9472
      \intbl {\f0 {\f0\fs20 row_8}}\cell
      \pard\plain
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clbrdrt\brdrdb\brdrw20\brdrcf1\clbrdrb\brdrs\brdrw10\brdrcf1\clbrdrl\brdrs\brdrw10\brdrcf1\clbrdrr\brdrs\brdrw10\brdrcf1\cellx1184
      \intbl {\f0 {\f0\fs20 median}}\cell
      \pard\plain
      
      \pard\plain\uc0\qr\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clbrdrt\brdrdb\brdrw20\brdrcf1\clbrdrb\brdrs\brdrw10\brdrcf1\clbrdrl\brdrs\brdrw10\brdrcf1\clbrdrr\brdrs\brdrw10\brdrcf1\cellx2368
      \intbl {\f0 {\f0\fs20 777,000.00}}\cell
      \pard\plain
      
      \pard\plain\uc0\qc\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clbrdrt\brdrdb\brdrw20\brdrcf1\clbrdrb\brdrs\brdrw10\brdrcf1\clbrdrl\brdrs\brdrw10\brdrcf1\clbrdrr\brdrs\brdrw10\brdrcf1\cellx3552
      \intbl {\f0 {\f0\fs20 \'97}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clbrdrt\brdrdb\brdrw20\brdrcf1\clbrdrb\brdrs\brdrw10\brdrcf1\clbrdrl\brdrs\brdrw10\brdrcf1\clbrdrr\brdrs\brdrw10\brdrcf1\cellx4736
      \intbl {\f0 {\f0\fs20 \'97}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clbrdrt\brdrdb\brdrw20\brdrcf1\clbrdrb\brdrs\brdrw10\brdrcf1\clbrdrl\brdrs\brdrw10\brdrcf1\clbrdrr\brdrs\brdrw10\brdrcf1\cellx5920
      \intbl {\f0 {\f0\fs20 \'97}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clbrdrt\brdrdb\brdrw20\brdrcf1\clbrdrb\brdrs\brdrw10\brdrcf1\clbrdrl\brdrs\brdrw10\brdrcf1\clbrdrr\brdrs\brdrw10\brdrcf1\cellx7104
      \intbl {\f0 {\f0\fs20 \'97}}\cell
      \pard\plain
      
      \pard\plain\uc0\qr\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clbrdrt\brdrdb\brdrw20\brdrcf1\clbrdrb\brdrs\brdrw10\brdrcf1\clbrdrl\brdrs\brdrw10\brdrcf1\clbrdrr\brdrs\brdrw10\brdrcf1\cellx8288
      \intbl {\f0 {\f0\fs20 13.26}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clbrdrt\brdrdb\brdrw20\brdrcf1\clbrdrb\brdrs\brdrw10\brdrcf1\clbrdrl\brdrs\brdrw10\brdrcf1\clbrdrr\brdrs\brdrw10\brdrcf1\cellx9472
      \intbl {\f0 {\f0\fs20 \'97}}\cell
      \pard\plain
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clbrdrb\brdrs\brdrw10\brdrcf1\clbrdrl\brdrs\brdrw10\brdrcf1\clbrdrr\brdrs\brdrw10\brdrcf1\clbrdrt\brdrdb\brdrw50\brdrcf1\cellx1184
      \intbl {\f0 {\f0\fs20 min}}\cell
      \pard\plain
      
      \pard\plain\uc0\qr\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clbrdrb\brdrs\brdrw10\brdrcf1\clbrdrl\brdrs\brdrw10\brdrcf1\clbrdrr\brdrs\brdrw10\brdrcf1\clbrdrt\brdrdb\brdrw50\brdrcf1\cellx2368
      \intbl {\f0 {\f0\fs20 0.11}}\cell
      \pard\plain
      
      \pard\plain\uc0\qc\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clbrdrb\brdrs\brdrw10\brdrcf1\clbrdrl\brdrs\brdrw10\brdrcf1\clbrdrr\brdrs\brdrw10\brdrcf1\clbrdrt\brdrdb\brdrw50\brdrcf1\cellx3552
      \intbl {\f0 {\f0\fs20 \'97}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clbrdrb\brdrs\brdrw10\brdrcf1\clbrdrl\brdrs\brdrw10\brdrcf1\clbrdrr\brdrs\brdrw10\brdrcf1\clbrdrt\brdrdb\brdrw50\brdrcf1\cellx4736
      \intbl {\f0 {\f0\fs20 \'97}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clbrdrb\brdrs\brdrw10\brdrcf1\clbrdrl\brdrs\brdrw10\brdrcf1\clbrdrr\brdrs\brdrw10\brdrcf1\clbrdrt\brdrdb\brdrw50\brdrcf1\cellx5920
      \intbl {\f0 {\f0\fs20 \'97}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clbrdrb\brdrs\brdrw10\brdrcf1\clbrdrl\brdrs\brdrw10\brdrcf1\clbrdrr\brdrs\brdrw10\brdrcf1\clbrdrt\brdrdb\brdrw50\brdrcf1\cellx7104
      \intbl {\f0 {\f0\fs20 \'97}}\cell
      \pard\plain
      
      \pard\plain\uc0\qr\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clbrdrb\brdrs\brdrw10\brdrcf1\clbrdrl\brdrs\brdrw10\brdrcf1\clbrdrr\brdrs\brdrw10\brdrcf1\clbrdrt\brdrdb\brdrw50\brdrcf1\cellx8288
      \intbl {\f0 {\f0\fs20 0.44}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clbrdrb\brdrs\brdrw10\brdrcf1\clbrdrl\brdrs\brdrw10\brdrcf1\clbrdrr\brdrs\brdrw10\brdrcf1\clbrdrt\brdrdb\brdrw50\brdrcf1\cellx9472
      \intbl {\f0 {\f0\fs20 \'97}}\cell
      \pard\plain
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clbrdrb\brdrs\brdrw10\brdrcf1\clbrdrl\brdrs\brdrw10\brdrcf1\clbrdrr\brdrs\brdrw10\brdrcf1\clbrdrt\brdrs\brdrw10\brdrcf1\cellx1184
      \intbl {\f0 {\f0\fs20 max}}\cell
      \pard\plain
      
      \pard\plain\uc0\qr\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clbrdrb\brdrs\brdrw10\brdrcf1\clbrdrl\brdrs\brdrw10\brdrcf1\clbrdrr\brdrs\brdrw10\brdrcf1\clbrdrt\brdrs\brdrw10\brdrcf1\cellx2368
      \intbl {\f0 {\f0\fs20 8,880,000.00}}\cell
      \pard\plain
      
      \pard\plain\uc0\qc\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clbrdrb\brdrs\brdrw10\brdrcf1\clbrdrl\brdrs\brdrw10\brdrcf1\clbrdrr\brdrs\brdrw10\brdrcf1\clbrdrt\brdrs\brdrw10\brdrcf1\cellx3552
      \intbl {\f0 {\f0\fs20 \'97}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clbrdrb\brdrs\brdrw10\brdrcf1\clbrdrl\brdrs\brdrw10\brdrcf1\clbrdrr\brdrs\brdrw10\brdrcf1\clbrdrt\brdrs\brdrw10\brdrcf1\cellx4736
      \intbl {\f0 {\f0\fs20 \'97}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clbrdrb\brdrs\brdrw10\brdrcf1\clbrdrl\brdrs\brdrw10\brdrcf1\clbrdrr\brdrs\brdrw10\brdrcf1\clbrdrt\brdrs\brdrw10\brdrcf1\cellx5920
      \intbl {\f0 {\f0\fs20 \'97}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clbrdrb\brdrs\brdrw10\brdrcf1\clbrdrl\brdrs\brdrw10\brdrcf1\clbrdrr\brdrs\brdrw10\brdrcf1\clbrdrt\brdrs\brdrw10\brdrcf1\cellx7104
      \intbl {\f0 {\f0\fs20 \'97}}\cell
      \pard\plain
      
      \pard\plain\uc0\qr\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clbrdrb\brdrs\brdrw10\brdrcf1\clbrdrl\brdrs\brdrw10\brdrcf1\clbrdrr\brdrs\brdrw10\brdrcf1\clbrdrt\brdrs\brdrw10\brdrcf1\cellx8288
      \intbl {\f0 {\f0\fs20 65,100.00}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clbrdrb\brdrs\brdrw10\brdrcf1\clbrdrl\brdrs\brdrw10\brdrcf1\clbrdrr\brdrs\brdrw10\brdrcf1\clbrdrt\brdrs\brdrw10\brdrcf1\cellx9472
      \intbl {\f0 {\f0\fs20 \'97}}\cell
      \pard\plain
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clbrdrb\brdrs\brdrw50\brdrcf1\clbrdrl\brdrs\brdrw10\brdrcf1\clbrdrr\brdrs\brdrw10\brdrcf1\clbrdrt\brdrs\brdrw10\brdrcf1\cellx1184
      \intbl {\f0 {\f0\fs20 avg}}\cell
      \pard\plain
      
      \pard\plain\uc0\qr\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clbrdrb\brdrs\brdrw50\brdrcf1\clbrdrl\brdrs\brdrw10\brdrcf1\clbrdrr\brdrs\brdrw10\brdrcf1\clbrdrt\brdrs\brdrw10\brdrcf1\cellx2368
      \intbl {\f0 {\f0\fs20 1,380,432.87}}\cell
      \pard\plain
      
      \pard\plain\uc0\qc\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clbrdrb\brdrs\brdrw50\brdrcf1\clbrdrl\brdrs\brdrw10\brdrcf1\clbrdrr\brdrs\brdrw10\brdrcf1\clbrdrt\brdrs\brdrw10\brdrcf1\cellx3552
      \intbl {\f0 {\f0\fs20 \'97}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clbrdrb\brdrs\brdrw50\brdrcf1\clbrdrl\brdrs\brdrw10\brdrcf1\clbrdrr\brdrs\brdrw10\brdrcf1\clbrdrt\brdrs\brdrw10\brdrcf1\cellx4736
      \intbl {\f0 {\f0\fs20 \'97}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clbrdrb\brdrs\brdrw50\brdrcf1\clbrdrl\brdrs\brdrw10\brdrcf1\clbrdrr\brdrs\brdrw10\brdrcf1\clbrdrt\brdrs\brdrw10\brdrcf1\cellx5920
      \intbl {\f0 {\f0\fs20 \'97}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clbrdrb\brdrs\brdrw50\brdrcf1\clbrdrl\brdrs\brdrw10\brdrcf1\clbrdrr\brdrs\brdrw10\brdrcf1\clbrdrt\brdrs\brdrw10\brdrcf1\cellx7104
      \intbl {\f0 {\f0\fs20 \'97}}\cell
      \pard\plain
      
      \pard\plain\uc0\qr\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clbrdrb\brdrs\brdrw50\brdrcf1\clbrdrl\brdrs\brdrw10\brdrcf1\clbrdrr\brdrs\brdrw10\brdrcf1\clbrdrt\brdrs\brdrw10\brdrcf1\cellx8288
      \intbl {\f0 {\f0\fs20 9,501.26}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clbrdrb\brdrs\brdrw50\brdrcf1\clbrdrl\brdrs\brdrw10\brdrcf1\clbrdrr\brdrs\brdrw10\brdrcf1\clbrdrt\brdrs\brdrw10\brdrcf1\cellx9472
      \intbl {\f0 {\f0\fs20 \'97}}\cell
      \pard\plain
      
      \row
      
      }

---

    Code
      .
    Output
      [1] "<table class=\"gt_table\">\n  \n  <thead class=\"gt_col_headings\">\n    <tr>\n      <th class=\"gt_col_heading gt_columns_bottom_border gt_left\" rowspan=\"1\" colspan=\"1\"></th>\n      <th class=\"gt_col_heading gt_columns_bottom_border gt_right\" rowspan=\"1\" colspan=\"1\">num</th>\n      <th class=\"gt_col_heading gt_columns_bottom_border gt_left\" rowspan=\"1\" colspan=\"1\">char</th>\n      <th class=\"gt_col_heading gt_columns_bottom_border gt_center\" rowspan=\"1\" colspan=\"1\">fctr</th>\n      <th class=\"gt_col_heading gt_columns_bottom_border gt_left\" rowspan=\"1\" colspan=\"1\">date</th>\n      <th class=\"gt_col_heading gt_columns_bottom_border gt_left\" rowspan=\"1\" colspan=\"1\">time</th>\n      <th class=\"gt_col_heading gt_columns_bottom_border gt_left\" rowspan=\"1\" colspan=\"1\">datetime</th>\n      <th class=\"gt_col_heading gt_columns_bottom_border gt_right\" rowspan=\"1\" colspan=\"1\">currency</th>\n    </tr>\n  </thead>\n  <tbody class=\"gt_table_body\">\n    <tr class=\"gt_group_heading_row\">\n      <td colspan=\"8\" class=\"gt_group_heading\">grp_a</td>\n    </tr>\n    <tr><td class=\"gt_row gt_left gt_stub\">row_1</td>\n<td class=\"gt_row gt_right\">1.111e-01</td>\n<td class=\"gt_row gt_left\">apricot</td>\n<td class=\"gt_row gt_center\">one</td>\n<td class=\"gt_row gt_left\">2015-01-15</td>\n<td class=\"gt_row gt_left\">13:35</td>\n<td class=\"gt_row gt_left\">2018-01-01 02:22</td>\n<td class=\"gt_row gt_right\">49.950</td></tr>\n    <tr><td class=\"gt_row gt_left gt_stub\">row_2</td>\n<td class=\"gt_row gt_right\">2.222e+00</td>\n<td class=\"gt_row gt_left\">banana</td>\n<td class=\"gt_row gt_center\">two</td>\n<td class=\"gt_row gt_left\">2015-02-15</td>\n<td class=\"gt_row gt_left\">14:40</td>\n<td class=\"gt_row gt_left\">2018-02-02 14:33</td>\n<td class=\"gt_row gt_right\">17.950</td></tr>\n    <tr><td class=\"gt_row gt_left gt_stub\">row_3</td>\n<td class=\"gt_row gt_right\">3.333e+01</td>\n<td class=\"gt_row gt_left\">coconut</td>\n<td class=\"gt_row gt_center\">three</td>\n<td class=\"gt_row gt_left\">2015-03-15</td>\n<td class=\"gt_row gt_left\">15:45</td>\n<td class=\"gt_row gt_left\">2018-03-03 03:44</td>\n<td class=\"gt_row gt_right\">1.390</td></tr>\n    <tr><td class=\"gt_row gt_left gt_stub\">row_4</td>\n<td class=\"gt_row gt_right\">4.444e+02</td>\n<td class=\"gt_row gt_left\">durian</td>\n<td class=\"gt_row gt_center\">four</td>\n<td class=\"gt_row gt_left\">2015-04-15</td>\n<td class=\"gt_row gt_left\">16:50</td>\n<td class=\"gt_row gt_left\">2018-04-04 15:55</td>\n<td class=\"gt_row gt_right\">65100.000</td></tr>\n    <tr><td class=\"gt_row gt_right gt_stub gt_summary_row gt_first_summary_row gt_last_summary_row\">median</td>\n<td class=\"gt_row gt_right gt_summary_row gt_first_summary_row gt_last_summary_row\">17.78</td>\n<td class=\"gt_row gt_left gt_summary_row gt_first_summary_row gt_last_summary_row\">&mdash;</td>\n<td class=\"gt_row gt_center gt_summary_row gt_first_summary_row gt_last_summary_row\">&mdash;</td>\n<td class=\"gt_row gt_left gt_summary_row gt_first_summary_row gt_last_summary_row\">&mdash;</td>\n<td class=\"gt_row gt_left gt_summary_row gt_first_summary_row gt_last_summary_row\">&mdash;</td>\n<td class=\"gt_row gt_left gt_summary_row gt_first_summary_row gt_last_summary_row\">&mdash;</td>\n<td class=\"gt_row gt_right gt_summary_row gt_first_summary_row gt_last_summary_row\">33.95</td></tr>\n    <tr class=\"gt_group_heading_row\">\n      <td colspan=\"8\" class=\"gt_group_heading\">grp_b</td>\n    </tr>\n    <tr><td class=\"gt_row gt_left gt_stub\">row_5</td>\n<td class=\"gt_row gt_right\">5.550e+03</td>\n<td class=\"gt_row gt_left\">NA</td>\n<td class=\"gt_row gt_center\">five</td>\n<td class=\"gt_row gt_left\">2015-05-15</td>\n<td class=\"gt_row gt_left\">17:55</td>\n<td class=\"gt_row gt_left\">2018-05-05 04:00</td>\n<td class=\"gt_row gt_right\">1325.810</td></tr>\n    <tr><td class=\"gt_row gt_left gt_stub\">row_6</td>\n<td class=\"gt_row gt_right\">NA</td>\n<td class=\"gt_row gt_left\">fig</td>\n<td class=\"gt_row gt_center\">six</td>\n<td class=\"gt_row gt_left\">2015-06-15</td>\n<td class=\"gt_row gt_left\">NA</td>\n<td class=\"gt_row gt_left\">2018-06-06 16:11</td>\n<td class=\"gt_row gt_right\">13.255</td></tr>\n    <tr><td class=\"gt_row gt_left gt_stub\">row_7</td>\n<td class=\"gt_row gt_right\">7.770e+05</td>\n<td class=\"gt_row gt_left\">grapefruit</td>\n<td class=\"gt_row gt_center\">seven</td>\n<td class=\"gt_row gt_left\">NA</td>\n<td class=\"gt_row gt_left\">19:10</td>\n<td class=\"gt_row gt_left\">2018-07-07 05:22</td>\n<td class=\"gt_row gt_right\">NA</td></tr>\n    <tr><td class=\"gt_row gt_left gt_stub\">row_8</td>\n<td class=\"gt_row gt_right\">8.880e+06</td>\n<td class=\"gt_row gt_left\">honeydew</td>\n<td class=\"gt_row gt_center\">eight</td>\n<td class=\"gt_row gt_left\">2015-08-15</td>\n<td class=\"gt_row gt_left\">20:20</td>\n<td class=\"gt_row gt_left\">NA</td>\n<td class=\"gt_row gt_right\">0.440</td></tr>\n    <tr><td class=\"gt_row gt_right gt_stub gt_summary_row gt_first_summary_row gt_last_summary_row\">median</td>\n<td class=\"gt_row gt_right gt_summary_row gt_first_summary_row gt_last_summary_row\">777,000.00</td>\n<td class=\"gt_row gt_left gt_summary_row gt_first_summary_row gt_last_summary_row\">&mdash;</td>\n<td class=\"gt_row gt_center gt_summary_row gt_first_summary_row gt_last_summary_row\">&mdash;</td>\n<td class=\"gt_row gt_left gt_summary_row gt_first_summary_row gt_last_summary_row\">&mdash;</td>\n<td class=\"gt_row gt_left gt_summary_row gt_first_summary_row gt_last_summary_row\">&mdash;</td>\n<td class=\"gt_row gt_left gt_summary_row gt_first_summary_row gt_last_summary_row\">&mdash;</td>\n<td class=\"gt_row gt_right gt_summary_row gt_first_summary_row gt_last_summary_row\">13.26</td></tr>\n    <tr><td class=\"gt_row gt_right gt_stub gt_grand_summary_row gt_first_grand_summary_row\">min</td>\n<td class=\"gt_row gt_right gt_grand_summary_row gt_first_grand_summary_row\">0.11</td>\n<td class=\"gt_row gt_left gt_grand_summary_row gt_first_grand_summary_row\">&mdash;</td>\n<td class=\"gt_row gt_center gt_grand_summary_row gt_first_grand_summary_row\">&mdash;</td>\n<td class=\"gt_row gt_left gt_grand_summary_row gt_first_grand_summary_row\">&mdash;</td>\n<td class=\"gt_row gt_left gt_grand_summary_row gt_first_grand_summary_row\">&mdash;</td>\n<td class=\"gt_row gt_left gt_grand_summary_row gt_first_grand_summary_row\">&mdash;</td>\n<td class=\"gt_row gt_right gt_grand_summary_row gt_first_grand_summary_row\">0.44</td></tr>\n    <tr><td class=\"gt_row gt_right gt_stub gt_grand_summary_row\">max</td>\n<td class=\"gt_row gt_right gt_grand_summary_row\">8,880,000.00</td>\n<td class=\"gt_row gt_left gt_grand_summary_row\">&mdash;</td>\n<td class=\"gt_row gt_center gt_grand_summary_row\">&mdash;</td>\n<td class=\"gt_row gt_left gt_grand_summary_row\">&mdash;</td>\n<td class=\"gt_row gt_left gt_grand_summary_row\">&mdash;</td>\n<td class=\"gt_row gt_left gt_grand_summary_row\">&mdash;</td>\n<td class=\"gt_row gt_right gt_grand_summary_row\">65,100.00</td></tr>\n    <tr><td class=\"gt_row gt_right gt_stub gt_grand_summary_row gt_last_summary_row\">avg</td>\n<td class=\"gt_row gt_right gt_grand_summary_row gt_last_summary_row\">1,380,432.87</td>\n<td class=\"gt_row gt_left gt_grand_summary_row gt_last_summary_row\">&mdash;</td>\n<td class=\"gt_row gt_center gt_grand_summary_row gt_last_summary_row\">&mdash;</td>\n<td class=\"gt_row gt_left gt_grand_summary_row gt_last_summary_row\">&mdash;</td>\n<td class=\"gt_row gt_left gt_grand_summary_row gt_last_summary_row\">&mdash;</td>\n<td class=\"gt_row gt_left gt_grand_summary_row gt_last_summary_row\">&mdash;</td>\n<td class=\"gt_row gt_right gt_grand_summary_row gt_last_summary_row\">9,501.26</td></tr>\n  </tbody>\n  \n  \n</table>"

---

    Code
      .
    Output
      [1] "\\captionsetup[table]{labelformat=empty,skip=1pt}\n\\begin{longtable}{lrlclllr}\n\\toprule\n & num & char & fctr & date & time & datetime & currency \\\\ \n\\midrule\n\\multicolumn{1}{l}{grp\\_a} \\\\ \n\\midrule\nrow\\_1 & 1.111e-01 & apricot & one & 2015-01-15 & 13:35 & 2018-01-01 02:22 & 49.950 \\\\ \nrow\\_2 & 2.222e+00 & banana & two & 2015-02-15 & 14:40 & 2018-02-02 14:33 & 17.950 \\\\ \nrow\\_3 & 3.333e+01 & coconut & three & 2015-03-15 & 15:45 & 2018-03-03 03:44 & 1.390 \\\\ \nrow\\_4 & 4.444e+02 & durian & four & 2015-04-15 & 16:50 & 2018-04-04 15:55 & 65100.000 \\\\ \n\\midrule \nmedian & $17.78$ & — & — & — & — & — & $33.95$ \\\\ \n\\midrule\n\\multicolumn{1}{l}{grp\\_b} \\\\ \n\\midrule\nrow\\_5 & 5.550e+03 & NA & five & 2015-05-15 & 17:55 & 2018-05-05 04:00 & 1325.810 \\\\ \nrow\\_6 & NA & fig & six & 2015-06-15 & NA & 2018-06-06 16:11 & 13.255 \\\\ \nrow\\_7 & 7.770e+05 & grapefruit & seven & NA & 19:10 & 2018-07-07 05:22 & NA \\\\ \nrow\\_8 & 8.880e+06 & honeydew & eight & 2015-08-15 & 20:20 & NA & 0.440 \\\\ \n\\midrule \nmedian & $777,000.00$ & — & — & — & — & — & $13.26$ \\\\ \n \\midrule \n\\midrule \nmin & $0.11$ & — & — & — & — & — & $0.44$ \\\\ \nmax & $8,880,000.00$ & — & — & — & — & — & $65,100.00$ \\\\ \navg & $1,380,432.87$ & — & — & — & — & — & $9,501.26$ \\\\ \n\\bottomrule\n\\end{longtable}\n"

---

    Code
      .
    Output
      {\rtf\ansi\ansicpg1252{\fonttbl{\f0\froman\fcharset0\fprq0 Calibri;}{\f1\froman\fcharset0\fprq0 Courier;}}{\colortbl;\red211\green211\blue211;}
      
      \trowd\trrh0\trhdr
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clbrdrt\brdrs\brdrw40\brdrcf1\clbrdrb\brdrs\brdrw40\brdrcf1\clbrdrl\brdrs\brdrw20\brdrcf1\clbrdrr\brdrs\brdrw20\brdrcf1\cellx1184
      \intbl {\f0 {\f0\fs20 }}\cell
      \pard\plain
      
      \pard\plain\uc0\qr\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clbrdrt\brdrs\brdrw40\brdrcf1\clbrdrb\brdrs\brdrw40\brdrcf1\clbrdrl\brdrs\brdrw20\brdrcf1\clbrdrr\brdrs\brdrw20\brdrcf1\cellx2368
      \intbl {\f0 {\f0\fs20 num}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clbrdrt\brdrs\brdrw40\brdrcf1\clbrdrb\brdrs\brdrw40\brdrcf1\clbrdrl\brdrs\brdrw20\brdrcf1\clbrdrr\brdrs\brdrw20\brdrcf1\cellx3552
      \intbl {\f0 {\f0\fs20 char}}\cell
      \pard\plain
      
      \pard\plain\uc0\qc\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clbrdrt\brdrs\brdrw40\brdrcf1\clbrdrb\brdrs\brdrw40\brdrcf1\clbrdrl\brdrs\brdrw20\brdrcf1\clbrdrr\brdrs\brdrw20\brdrcf1\cellx4736
      \intbl {\f0 {\f0\fs20 fctr}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clbrdrt\brdrs\brdrw40\brdrcf1\clbrdrb\brdrs\brdrw40\brdrcf1\clbrdrl\brdrs\brdrw20\brdrcf1\clbrdrr\brdrs\brdrw20\brdrcf1\cellx5920
      \intbl {\f0 {\f0\fs20 date}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clbrdrt\brdrs\brdrw40\brdrcf1\clbrdrb\brdrs\brdrw40\brdrcf1\clbrdrl\brdrs\brdrw20\brdrcf1\clbrdrr\brdrs\brdrw20\brdrcf1\cellx7104
      \intbl {\f0 {\f0\fs20 time}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clbrdrt\brdrs\brdrw40\brdrcf1\clbrdrb\brdrs\brdrw40\brdrcf1\clbrdrl\brdrs\brdrw20\brdrcf1\clbrdrr\brdrs\brdrw20\brdrcf1\cellx8288
      \intbl {\f0 {\f0\fs20 datetime}}\cell
      \pard\plain
      
      \pard\plain\uc0\qr\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clbrdrt\brdrs\brdrw40\brdrcf1\clbrdrb\brdrs\brdrw40\brdrcf1\clbrdrl\brdrs\brdrw20\brdrcf1\clbrdrr\brdrs\brdrw20\brdrcf1\cellx9472
      \intbl {\f0 {\f0\fs20 currency}}\cell
      \pard\plain
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clbrdrt\brdrs\brdrw40\brdrcf1\clbrdrb\brdrs\brdrw40\brdrcf1\clbrdrl\brdrs\brdrw20\brdrcf1\clbrdrr\brdrs\brdrw20\brdrcf1\cellx9472
      \intbl {\f0\fs20 grp_a}\cell
      \pard\plain
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clbrdrb\brdrs\brdrw10\brdrcf1\clbrdrl\brdrs\brdrw10\brdrcf1\clbrdrr\brdrs\brdrw10\brdrcf1\cellx1184
      \intbl {\f0 {\f0\fs20 row_1}}\cell
      \pard\plain
      
      \pard\plain\uc0\qr\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clbrdrb\brdrs\brdrw10\brdrcf1\clbrdrl\brdrs\brdrw10\brdrcf1\clbrdrr\brdrs\brdrw10\brdrcf1\cellx2368
      \intbl {\f0 {\f0\fs20 1.111e-01}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clbrdrb\brdrs\brdrw10\brdrcf1\clbrdrl\brdrs\brdrw10\brdrcf1\clbrdrr\brdrs\brdrw10\brdrcf1\cellx3552
      \intbl {\f0 {\f0\fs20 apricot}}\cell
      \pard\plain
      
      \pard\plain\uc0\qc\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clbrdrb\brdrs\brdrw10\brdrcf1\clbrdrl\brdrs\brdrw10\brdrcf1\clbrdrr\brdrs\brdrw10\brdrcf1\cellx4736
      \intbl {\f0 {\f0\fs20 one}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clbrdrb\brdrs\brdrw10\brdrcf1\clbrdrl\brdrs\brdrw10\brdrcf1\clbrdrr\brdrs\brdrw10\brdrcf1\cellx5920
      \intbl {\f0 {\f0\fs20 2015-01-15}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clbrdrb\brdrs\brdrw10\brdrcf1\clbrdrl\brdrs\brdrw10\brdrcf1\clbrdrr\brdrs\brdrw10\brdrcf1\cellx7104
      \intbl {\f0 {\f0\fs20 13:35}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clbrdrb\brdrs\brdrw10\brdrcf1\clbrdrl\brdrs\brdrw10\brdrcf1\clbrdrr\brdrs\brdrw10\brdrcf1\cellx8288
      \intbl {\f0 {\f0\fs20 2018-01-01 02:22}}\cell
      \pard\plain
      
      \pard\plain\uc0\qr\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clbrdrb\brdrs\brdrw10\brdrcf1\clbrdrl\brdrs\brdrw10\brdrcf1\clbrdrr\brdrs\brdrw10\brdrcf1\cellx9472
      \intbl {\f0 {\f0\fs20 49.950}}\cell
      \pard\plain
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clbrdrb\brdrs\brdrw10\brdrcf1\clbrdrl\brdrs\brdrw10\brdrcf1\clbrdrr\brdrs\brdrw10\brdrcf1\cellx1184
      \intbl {\f0 {\f0\fs20 row_2}}\cell
      \pard\plain
      
      \pard\plain\uc0\qr\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clbrdrb\brdrs\brdrw10\brdrcf1\clbrdrl\brdrs\brdrw10\brdrcf1\clbrdrr\brdrs\brdrw10\brdrcf1\cellx2368
      \intbl {\f0 {\f0\fs20 2.222e+00}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clbrdrb\brdrs\brdrw10\brdrcf1\clbrdrl\brdrs\brdrw10\brdrcf1\clbrdrr\brdrs\brdrw10\brdrcf1\cellx3552
      \intbl {\f0 {\f0\fs20 banana}}\cell
      \pard\plain
      
      \pard\plain\uc0\qc\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clbrdrb\brdrs\brdrw10\brdrcf1\clbrdrl\brdrs\brdrw10\brdrcf1\clbrdrr\brdrs\brdrw10\brdrcf1\cellx4736
      \intbl {\f0 {\f0\fs20 two}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clbrdrb\brdrs\brdrw10\brdrcf1\clbrdrl\brdrs\brdrw10\brdrcf1\clbrdrr\brdrs\brdrw10\brdrcf1\cellx5920
      \intbl {\f0 {\f0\fs20 2015-02-15}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clbrdrb\brdrs\brdrw10\brdrcf1\clbrdrl\brdrs\brdrw10\brdrcf1\clbrdrr\brdrs\brdrw10\brdrcf1\cellx7104
      \intbl {\f0 {\f0\fs20 14:40}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clbrdrb\brdrs\brdrw10\brdrcf1\clbrdrl\brdrs\brdrw10\brdrcf1\clbrdrr\brdrs\brdrw10\brdrcf1\cellx8288
      \intbl {\f0 {\f0\fs20 2018-02-02 14:33}}\cell
      \pard\plain
      
      \pard\plain\uc0\qr\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clbrdrb\brdrs\brdrw10\brdrcf1\clbrdrl\brdrs\brdrw10\brdrcf1\clbrdrr\brdrs\brdrw10\brdrcf1\cellx9472
      \intbl {\f0 {\f0\fs20 17.950}}\cell
      \pard\plain
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clbrdrb\brdrs\brdrw10\brdrcf1\clbrdrl\brdrs\brdrw10\brdrcf1\clbrdrr\brdrs\brdrw10\brdrcf1\cellx1184
      \intbl {\f0 {\f0\fs20 row_3}}\cell
      \pard\plain
      
      \pard\plain\uc0\qr\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clbrdrb\brdrs\brdrw10\brdrcf1\clbrdrl\brdrs\brdrw10\brdrcf1\clbrdrr\brdrs\brdrw10\brdrcf1\cellx2368
      \intbl {\f0 {\f0\fs20 3.333e+01}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clbrdrb\brdrs\brdrw10\brdrcf1\clbrdrl\brdrs\brdrw10\brdrcf1\clbrdrr\brdrs\brdrw10\brdrcf1\cellx3552
      \intbl {\f0 {\f0\fs20 coconut}}\cell
      \pard\plain
      
      \pard\plain\uc0\qc\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clbrdrb\brdrs\brdrw10\brdrcf1\clbrdrl\brdrs\brdrw10\brdrcf1\clbrdrr\brdrs\brdrw10\brdrcf1\cellx4736
      \intbl {\f0 {\f0\fs20 three}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clbrdrb\brdrs\brdrw10\brdrcf1\clbrdrl\brdrs\brdrw10\brdrcf1\clbrdrr\brdrs\brdrw10\brdrcf1\cellx5920
      \intbl {\f0 {\f0\fs20 2015-03-15}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clbrdrb\brdrs\brdrw10\brdrcf1\clbrdrl\brdrs\brdrw10\brdrcf1\clbrdrr\brdrs\brdrw10\brdrcf1\cellx7104
      \intbl {\f0 {\f0\fs20 15:45}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clbrdrb\brdrs\brdrw10\brdrcf1\clbrdrl\brdrs\brdrw10\brdrcf1\clbrdrr\brdrs\brdrw10\brdrcf1\cellx8288
      \intbl {\f0 {\f0\fs20 2018-03-03 03:44}}\cell
      \pard\plain
      
      \pard\plain\uc0\qr\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clbrdrb\brdrs\brdrw10\brdrcf1\clbrdrl\brdrs\brdrw10\brdrcf1\clbrdrr\brdrs\brdrw10\brdrcf1\cellx9472
      \intbl {\f0 {\f0\fs20 1.390}}\cell
      \pard\plain
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clbrdrb\brdrs\brdrw10\brdrcf1\clbrdrl\brdrs\brdrw10\brdrcf1\clbrdrr\brdrs\brdrw10\brdrcf1\cellx1184
      \intbl {\f0 {\f0\fs20 row_4}}\cell
      \pard\plain
      
      \pard\plain\uc0\qr\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clbrdrb\brdrs\brdrw10\brdrcf1\clbrdrl\brdrs\brdrw10\brdrcf1\clbrdrr\brdrs\brdrw10\brdrcf1\cellx2368
      \intbl {\f0 {\f0\fs20 4.444e+02}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clbrdrb\brdrs\brdrw10\brdrcf1\clbrdrl\brdrs\brdrw10\brdrcf1\clbrdrr\brdrs\brdrw10\brdrcf1\cellx3552
      \intbl {\f0 {\f0\fs20 durian}}\cell
      \pard\plain
      
      \pard\plain\uc0\qc\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clbrdrb\brdrs\brdrw10\brdrcf1\clbrdrl\brdrs\brdrw10\brdrcf1\clbrdrr\brdrs\brdrw10\brdrcf1\cellx4736
      \intbl {\f0 {\f0\fs20 four}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clbrdrb\brdrs\brdrw10\brdrcf1\clbrdrl\brdrs\brdrw10\brdrcf1\clbrdrr\brdrs\brdrw10\brdrcf1\cellx5920
      \intbl {\f0 {\f0\fs20 2015-04-15}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clbrdrb\brdrs\brdrw10\brdrcf1\clbrdrl\brdrs\brdrw10\brdrcf1\clbrdrr\brdrs\brdrw10\brdrcf1\cellx7104
      \intbl {\f0 {\f0\fs20 16:50}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clbrdrb\brdrs\brdrw10\brdrcf1\clbrdrl\brdrs\brdrw10\brdrcf1\clbrdrr\brdrs\brdrw10\brdrcf1\cellx8288
      \intbl {\f0 {\f0\fs20 2018-04-04 15:55}}\cell
      \pard\plain
      
      \pard\plain\uc0\qr\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clbrdrb\brdrs\brdrw10\brdrcf1\clbrdrl\brdrs\brdrw10\brdrcf1\clbrdrr\brdrs\brdrw10\brdrcf1\cellx9472
      \intbl {\f0 {\f0\fs20 65100.000}}\cell
      \pard\plain
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clbrdrt\brdrdb\brdrw20\brdrcf1\clbrdrb\brdrs\brdrw10\brdrcf1\clbrdrl\brdrs\brdrw10\brdrcf1\clbrdrr\brdrs\brdrw10\brdrcf1\cellx1184
      \intbl {\f0 {\f0\fs20 median}}\cell
      \pard\plain
      
      \pard\plain\uc0\qr\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clbrdrt\brdrdb\brdrw20\brdrcf1\clbrdrb\brdrs\brdrw10\brdrcf1\clbrdrl\brdrs\brdrw10\brdrcf1\clbrdrr\brdrs\brdrw10\brdrcf1\cellx2368
      \intbl {\f0 {\f0\fs20 17.78}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clbrdrt\brdrdb\brdrw20\brdrcf1\clbrdrb\brdrs\brdrw10\brdrcf1\clbrdrl\brdrs\brdrw10\brdrcf1\clbrdrr\brdrs\brdrw10\brdrcf1\cellx3552
      \intbl {\f0 {\f0\fs20 \'97}}\cell
      \pard\plain
      
      \pard\plain\uc0\qc\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clbrdrt\brdrdb\brdrw20\brdrcf1\clbrdrb\brdrs\brdrw10\brdrcf1\clbrdrl\brdrs\brdrw10\brdrcf1\clbrdrr\brdrs\brdrw10\brdrcf1\cellx4736
      \intbl {\f0 {\f0\fs20 \'97}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clbrdrt\brdrdb\brdrw20\brdrcf1\clbrdrb\brdrs\brdrw10\brdrcf1\clbrdrl\brdrs\brdrw10\brdrcf1\clbrdrr\brdrs\brdrw10\brdrcf1\cellx5920
      \intbl {\f0 {\f0\fs20 \'97}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clbrdrt\brdrdb\brdrw20\brdrcf1\clbrdrb\brdrs\brdrw10\brdrcf1\clbrdrl\brdrs\brdrw10\brdrcf1\clbrdrr\brdrs\brdrw10\brdrcf1\cellx7104
      \intbl {\f0 {\f0\fs20 \'97}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clbrdrt\brdrdb\brdrw20\brdrcf1\clbrdrb\brdrs\brdrw10\brdrcf1\clbrdrl\brdrs\brdrw10\brdrcf1\clbrdrr\brdrs\brdrw10\brdrcf1\cellx8288
      \intbl {\f0 {\f0\fs20 \'97}}\cell
      \pard\plain
      
      \pard\plain\uc0\qr\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clbrdrt\brdrdb\brdrw20\brdrcf1\clbrdrb\brdrs\brdrw10\brdrcf1\clbrdrl\brdrs\brdrw10\brdrcf1\clbrdrr\brdrs\brdrw10\brdrcf1\cellx9472
      \intbl {\f0 {\f0\fs20 33.95}}\cell
      \pard\plain
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clbrdrt\brdrs\brdrw40\brdrcf1\clbrdrb\brdrs\brdrw40\brdrcf1\clbrdrl\brdrs\brdrw20\brdrcf1\clbrdrr\brdrs\brdrw20\brdrcf1\cellx9472
      \intbl {\f0\fs20 grp_b}\cell
      \pard\plain
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clbrdrb\brdrs\brdrw10\brdrcf1\clbrdrl\brdrs\brdrw10\brdrcf1\clbrdrr\brdrs\brdrw10\brdrcf1\cellx1184
      \intbl {\f0 {\f0\fs20 row_5}}\cell
      \pard\plain
      
      \pard\plain\uc0\qr\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clbrdrb\brdrs\brdrw10\brdrcf1\clbrdrl\brdrs\brdrw10\brdrcf1\clbrdrr\brdrs\brdrw10\brdrcf1\cellx2368
      \intbl {\f0 {\f0\fs20 5.550e+03}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clbrdrb\brdrs\brdrw10\brdrcf1\clbrdrl\brdrs\brdrw10\brdrcf1\clbrdrr\brdrs\brdrw10\brdrcf1\cellx3552
      \intbl {\f0 {\f0\fs20 NA}}\cell
      \pard\plain
      
      \pard\plain\uc0\qc\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clbrdrb\brdrs\brdrw10\brdrcf1\clbrdrl\brdrs\brdrw10\brdrcf1\clbrdrr\brdrs\brdrw10\brdrcf1\cellx4736
      \intbl {\f0 {\f0\fs20 five}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clbrdrb\brdrs\brdrw10\brdrcf1\clbrdrl\brdrs\brdrw10\brdrcf1\clbrdrr\brdrs\brdrw10\brdrcf1\cellx5920
      \intbl {\f0 {\f0\fs20 2015-05-15}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clbrdrb\brdrs\brdrw10\brdrcf1\clbrdrl\brdrs\brdrw10\brdrcf1\clbrdrr\brdrs\brdrw10\brdrcf1\cellx7104
      \intbl {\f0 {\f0\fs20 17:55}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clbrdrb\brdrs\brdrw10\brdrcf1\clbrdrl\brdrs\brdrw10\brdrcf1\clbrdrr\brdrs\brdrw10\brdrcf1\cellx8288
      \intbl {\f0 {\f0\fs20 2018-05-05 04:00}}\cell
      \pard\plain
      
      \pard\plain\uc0\qr\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clbrdrb\brdrs\brdrw10\brdrcf1\clbrdrl\brdrs\brdrw10\brdrcf1\clbrdrr\brdrs\brdrw10\brdrcf1\cellx9472
      \intbl {\f0 {\f0\fs20 1325.810}}\cell
      \pard\plain
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clbrdrb\brdrs\brdrw10\brdrcf1\clbrdrl\brdrs\brdrw10\brdrcf1\clbrdrr\brdrs\brdrw10\brdrcf1\cellx1184
      \intbl {\f0 {\f0\fs20 row_6}}\cell
      \pard\plain
      
      \pard\plain\uc0\qr\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clbrdrb\brdrs\brdrw10\brdrcf1\clbrdrl\brdrs\brdrw10\brdrcf1\clbrdrr\brdrs\brdrw10\brdrcf1\cellx2368
      \intbl {\f0 {\f0\fs20 NA}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clbrdrb\brdrs\brdrw10\brdrcf1\clbrdrl\brdrs\brdrw10\brdrcf1\clbrdrr\brdrs\brdrw10\brdrcf1\cellx3552
      \intbl {\f0 {\f0\fs20 fig}}\cell
      \pard\plain
      
      \pard\plain\uc0\qc\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clbrdrb\brdrs\brdrw10\brdrcf1\clbrdrl\brdrs\brdrw10\brdrcf1\clbrdrr\brdrs\brdrw10\brdrcf1\cellx4736
      \intbl {\f0 {\f0\fs20 six}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clbrdrb\brdrs\brdrw10\brdrcf1\clbrdrl\brdrs\brdrw10\brdrcf1\clbrdrr\brdrs\brdrw10\brdrcf1\cellx5920
      \intbl {\f0 {\f0\fs20 2015-06-15}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clbrdrb\brdrs\brdrw10\brdrcf1\clbrdrl\brdrs\brdrw10\brdrcf1\clbrdrr\brdrs\brdrw10\brdrcf1\cellx7104
      \intbl {\f0 {\f0\fs20 NA}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clbrdrb\brdrs\brdrw10\brdrcf1\clbrdrl\brdrs\brdrw10\brdrcf1\clbrdrr\brdrs\brdrw10\brdrcf1\cellx8288
      \intbl {\f0 {\f0\fs20 2018-06-06 16:11}}\cell
      \pard\plain
      
      \pard\plain\uc0\qr\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clbrdrb\brdrs\brdrw10\brdrcf1\clbrdrl\brdrs\brdrw10\brdrcf1\clbrdrr\brdrs\brdrw10\brdrcf1\cellx9472
      \intbl {\f0 {\f0\fs20 13.255}}\cell
      \pard\plain
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clbrdrb\brdrs\brdrw10\brdrcf1\clbrdrl\brdrs\brdrw10\brdrcf1\clbrdrr\brdrs\brdrw10\brdrcf1\cellx1184
      \intbl {\f0 {\f0\fs20 row_7}}\cell
      \pard\plain
      
      \pard\plain\uc0\qr\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clbrdrb\brdrs\brdrw10\brdrcf1\clbrdrl\brdrs\brdrw10\brdrcf1\clbrdrr\brdrs\brdrw10\brdrcf1\cellx2368
      \intbl {\f0 {\f0\fs20 7.770e+05}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clbrdrb\brdrs\brdrw10\brdrcf1\clbrdrl\brdrs\brdrw10\brdrcf1\clbrdrr\brdrs\brdrw10\brdrcf1\cellx3552
      \intbl {\f0 {\f0\fs20 grapefruit}}\cell
      \pard\plain
      
      \pard\plain\uc0\qc\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clbrdrb\brdrs\brdrw10\brdrcf1\clbrdrl\brdrs\brdrw10\brdrcf1\clbrdrr\brdrs\brdrw10\brdrcf1\cellx4736
      \intbl {\f0 {\f0\fs20 seven}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clbrdrb\brdrs\brdrw10\brdrcf1\clbrdrl\brdrs\brdrw10\brdrcf1\clbrdrr\brdrs\brdrw10\brdrcf1\cellx5920
      \intbl {\f0 {\f0\fs20 NA}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clbrdrb\brdrs\brdrw10\brdrcf1\clbrdrl\brdrs\brdrw10\brdrcf1\clbrdrr\brdrs\brdrw10\brdrcf1\cellx7104
      \intbl {\f0 {\f0\fs20 19:10}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clbrdrb\brdrs\brdrw10\brdrcf1\clbrdrl\brdrs\brdrw10\brdrcf1\clbrdrr\brdrs\brdrw10\brdrcf1\cellx8288
      \intbl {\f0 {\f0\fs20 2018-07-07 05:22}}\cell
      \pard\plain
      
      \pard\plain\uc0\qr\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clbrdrb\brdrs\brdrw10\brdrcf1\clbrdrl\brdrs\brdrw10\brdrcf1\clbrdrr\brdrs\brdrw10\brdrcf1\cellx9472
      \intbl {\f0 {\f0\fs20 NA}}\cell
      \pard\plain
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clbrdrb\brdrs\brdrw10\brdrcf1\clbrdrl\brdrs\brdrw10\brdrcf1\clbrdrr\brdrs\brdrw10\brdrcf1\cellx1184
      \intbl {\f0 {\f0\fs20 row_8}}\cell
      \pard\plain
      
      \pard\plain\uc0\qr\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clbrdrb\brdrs\brdrw10\brdrcf1\clbrdrl\brdrs\brdrw10\brdrcf1\clbrdrr\brdrs\brdrw10\brdrcf1\cellx2368
      \intbl {\f0 {\f0\fs20 8.880e+06}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clbrdrb\brdrs\brdrw10\brdrcf1\clbrdrl\brdrs\brdrw10\brdrcf1\clbrdrr\brdrs\brdrw10\brdrcf1\cellx3552
      \intbl {\f0 {\f0\fs20 honeydew}}\cell
      \pard\plain
      
      \pard\plain\uc0\qc\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clbrdrb\brdrs\brdrw10\brdrcf1\clbrdrl\brdrs\brdrw10\brdrcf1\clbrdrr\brdrs\brdrw10\brdrcf1\cellx4736
      \intbl {\f0 {\f0\fs20 eight}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clbrdrb\brdrs\brdrw10\brdrcf1\clbrdrl\brdrs\brdrw10\brdrcf1\clbrdrr\brdrs\brdrw10\brdrcf1\cellx5920
      \intbl {\f0 {\f0\fs20 2015-08-15}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clbrdrb\brdrs\brdrw10\brdrcf1\clbrdrl\brdrs\brdrw10\brdrcf1\clbrdrr\brdrs\brdrw10\brdrcf1\cellx7104
      \intbl {\f0 {\f0\fs20 20:20}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clbrdrb\brdrs\brdrw10\brdrcf1\clbrdrl\brdrs\brdrw10\brdrcf1\clbrdrr\brdrs\brdrw10\brdrcf1\cellx8288
      \intbl {\f0 {\f0\fs20 NA}}\cell
      \pard\plain
      
      \pard\plain\uc0\qr\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clbrdrb\brdrs\brdrw10\brdrcf1\clbrdrl\brdrs\brdrw10\brdrcf1\clbrdrr\brdrs\brdrw10\brdrcf1\cellx9472
      \intbl {\f0 {\f0\fs20 0.440}}\cell
      \pard\plain
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clbrdrt\brdrdb\brdrw20\brdrcf1\clbrdrb\brdrs\brdrw10\brdrcf1\clbrdrl\brdrs\brdrw10\brdrcf1\clbrdrr\brdrs\brdrw10\brdrcf1\cellx1184
      \intbl {\f0 {\f0\fs20 median}}\cell
      \pard\plain
      
      \pard\plain\uc0\qr\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clbrdrt\brdrdb\brdrw20\brdrcf1\clbrdrb\brdrs\brdrw10\brdrcf1\clbrdrl\brdrs\brdrw10\brdrcf1\clbrdrr\brdrs\brdrw10\brdrcf1\cellx2368
      \intbl {\f0 {\f0\fs20 777,000.00}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clbrdrt\brdrdb\brdrw20\brdrcf1\clbrdrb\brdrs\brdrw10\brdrcf1\clbrdrl\brdrs\brdrw10\brdrcf1\clbrdrr\brdrs\brdrw10\brdrcf1\cellx3552
      \intbl {\f0 {\f0\fs20 \'97}}\cell
      \pard\plain
      
      \pard\plain\uc0\qc\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clbrdrt\brdrdb\brdrw20\brdrcf1\clbrdrb\brdrs\brdrw10\brdrcf1\clbrdrl\brdrs\brdrw10\brdrcf1\clbrdrr\brdrs\brdrw10\brdrcf1\cellx4736
      \intbl {\f0 {\f0\fs20 \'97}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clbrdrt\brdrdb\brdrw20\brdrcf1\clbrdrb\brdrs\brdrw10\brdrcf1\clbrdrl\brdrs\brdrw10\brdrcf1\clbrdrr\brdrs\brdrw10\brdrcf1\cellx5920
      \intbl {\f0 {\f0\fs20 \'97}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clbrdrt\brdrdb\brdrw20\brdrcf1\clbrdrb\brdrs\brdrw10\brdrcf1\clbrdrl\brdrs\brdrw10\brdrcf1\clbrdrr\brdrs\brdrw10\brdrcf1\cellx7104
      \intbl {\f0 {\f0\fs20 \'97}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clbrdrt\brdrdb\brdrw20\brdrcf1\clbrdrb\brdrs\brdrw10\brdrcf1\clbrdrl\brdrs\brdrw10\brdrcf1\clbrdrr\brdrs\brdrw10\brdrcf1\cellx8288
      \intbl {\f0 {\f0\fs20 \'97}}\cell
      \pard\plain
      
      \pard\plain\uc0\qr\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clbrdrt\brdrdb\brdrw20\brdrcf1\clbrdrb\brdrs\brdrw10\brdrcf1\clbrdrl\brdrs\brdrw10\brdrcf1\clbrdrr\brdrs\brdrw10\brdrcf1\cellx9472
      \intbl {\f0 {\f0\fs20 13.26}}\cell
      \pard\plain
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clbrdrb\brdrs\brdrw10\brdrcf1\clbrdrl\brdrs\brdrw10\brdrcf1\clbrdrr\brdrs\brdrw10\brdrcf1\clbrdrt\brdrdb\brdrw50\brdrcf1\cellx1184
      \intbl {\f0 {\f0\fs20 min}}\cell
      \pard\plain
      
      \pard\plain\uc0\qr\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clbrdrb\brdrs\brdrw10\brdrcf1\clbrdrl\brdrs\brdrw10\brdrcf1\clbrdrr\brdrs\brdrw10\brdrcf1\clbrdrt\brdrdb\brdrw50\brdrcf1\cellx2368
      \intbl {\f0 {\f0\fs20 0.11}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clbrdrb\brdrs\brdrw10\brdrcf1\clbrdrl\brdrs\brdrw10\brdrcf1\clbrdrr\brdrs\brdrw10\brdrcf1\clbrdrt\brdrdb\brdrw50\brdrcf1\cellx3552
      \intbl {\f0 {\f0\fs20 \'97}}\cell
      \pard\plain
      
      \pard\plain\uc0\qc\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clbrdrb\brdrs\brdrw10\brdrcf1\clbrdrl\brdrs\brdrw10\brdrcf1\clbrdrr\brdrs\brdrw10\brdrcf1\clbrdrt\brdrdb\brdrw50\brdrcf1\cellx4736
      \intbl {\f0 {\f0\fs20 \'97}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clbrdrb\brdrs\brdrw10\brdrcf1\clbrdrl\brdrs\brdrw10\brdrcf1\clbrdrr\brdrs\brdrw10\brdrcf1\clbrdrt\brdrdb\brdrw50\brdrcf1\cellx5920
      \intbl {\f0 {\f0\fs20 \'97}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clbrdrb\brdrs\brdrw10\brdrcf1\clbrdrl\brdrs\brdrw10\brdrcf1\clbrdrr\brdrs\brdrw10\brdrcf1\clbrdrt\brdrdb\brdrw50\brdrcf1\cellx7104
      \intbl {\f0 {\f0\fs20 \'97}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clbrdrb\brdrs\brdrw10\brdrcf1\clbrdrl\brdrs\brdrw10\brdrcf1\clbrdrr\brdrs\brdrw10\brdrcf1\clbrdrt\brdrdb\brdrw50\brdrcf1\cellx8288
      \intbl {\f0 {\f0\fs20 \'97}}\cell
      \pard\plain
      
      \pard\plain\uc0\qr\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clbrdrb\brdrs\brdrw10\brdrcf1\clbrdrl\brdrs\brdrw10\brdrcf1\clbrdrr\brdrs\brdrw10\brdrcf1\clbrdrt\brdrdb\brdrw50\brdrcf1\cellx9472
      \intbl {\f0 {\f0\fs20 0.44}}\cell
      \pard\plain
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clbrdrb\brdrs\brdrw10\brdrcf1\clbrdrl\brdrs\brdrw10\brdrcf1\clbrdrr\brdrs\brdrw10\brdrcf1\clbrdrt\brdrs\brdrw10\brdrcf1\cellx1184
      \intbl {\f0 {\f0\fs20 max}}\cell
      \pard\plain
      
      \pard\plain\uc0\qr\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clbrdrb\brdrs\brdrw10\brdrcf1\clbrdrl\brdrs\brdrw10\brdrcf1\clbrdrr\brdrs\brdrw10\brdrcf1\clbrdrt\brdrs\brdrw10\brdrcf1\cellx2368
      \intbl {\f0 {\f0\fs20 8,880,000.00}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clbrdrb\brdrs\brdrw10\brdrcf1\clbrdrl\brdrs\brdrw10\brdrcf1\clbrdrr\brdrs\brdrw10\brdrcf1\clbrdrt\brdrs\brdrw10\brdrcf1\cellx3552
      \intbl {\f0 {\f0\fs20 \'97}}\cell
      \pard\plain
      
      \pard\plain\uc0\qc\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clbrdrb\brdrs\brdrw10\brdrcf1\clbrdrl\brdrs\brdrw10\brdrcf1\clbrdrr\brdrs\brdrw10\brdrcf1\clbrdrt\brdrs\brdrw10\brdrcf1\cellx4736
      \intbl {\f0 {\f0\fs20 \'97}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clbrdrb\brdrs\brdrw10\brdrcf1\clbrdrl\brdrs\brdrw10\brdrcf1\clbrdrr\brdrs\brdrw10\brdrcf1\clbrdrt\brdrs\brdrw10\brdrcf1\cellx5920
      \intbl {\f0 {\f0\fs20 \'97}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clbrdrb\brdrs\brdrw10\brdrcf1\clbrdrl\brdrs\brdrw10\brdrcf1\clbrdrr\brdrs\brdrw10\brdrcf1\clbrdrt\brdrs\brdrw10\brdrcf1\cellx7104
      \intbl {\f0 {\f0\fs20 \'97}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clbrdrb\brdrs\brdrw10\brdrcf1\clbrdrl\brdrs\brdrw10\brdrcf1\clbrdrr\brdrs\brdrw10\brdrcf1\clbrdrt\brdrs\brdrw10\brdrcf1\cellx8288
      \intbl {\f0 {\f0\fs20 \'97}}\cell
      \pard\plain
      
      \pard\plain\uc0\qr\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clbrdrb\brdrs\brdrw10\brdrcf1\clbrdrl\brdrs\brdrw10\brdrcf1\clbrdrr\brdrs\brdrw10\brdrcf1\clbrdrt\brdrs\brdrw10\brdrcf1\cellx9472
      \intbl {\f0 {\f0\fs20 65,100.00}}\cell
      \pard\plain
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clbrdrb\brdrs\brdrw50\brdrcf1\clbrdrl\brdrs\brdrw10\brdrcf1\clbrdrr\brdrs\brdrw10\brdrcf1\clbrdrt\brdrs\brdrw10\brdrcf1\cellx1184
      \intbl {\f0 {\f0\fs20 avg}}\cell
      \pard\plain
      
      \pard\plain\uc0\qr\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clbrdrb\brdrs\brdrw50\brdrcf1\clbrdrl\brdrs\brdrw10\brdrcf1\clbrdrr\brdrs\brdrw10\brdrcf1\clbrdrt\brdrs\brdrw10\brdrcf1\cellx2368
      \intbl {\f0 {\f0\fs20 1,380,432.87}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clbrdrb\brdrs\brdrw50\brdrcf1\clbrdrl\brdrs\brdrw10\brdrcf1\clbrdrr\brdrs\brdrw10\brdrcf1\clbrdrt\brdrs\brdrw10\brdrcf1\cellx3552
      \intbl {\f0 {\f0\fs20 \'97}}\cell
      \pard\plain
      
      \pard\plain\uc0\qc\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clbrdrb\brdrs\brdrw50\brdrcf1\clbrdrl\brdrs\brdrw10\brdrcf1\clbrdrr\brdrs\brdrw10\brdrcf1\clbrdrt\brdrs\brdrw10\brdrcf1\cellx4736
      \intbl {\f0 {\f0\fs20 \'97}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clbrdrb\brdrs\brdrw50\brdrcf1\clbrdrl\brdrs\brdrw10\brdrcf1\clbrdrr\brdrs\brdrw10\brdrcf1\clbrdrt\brdrs\brdrw10\brdrcf1\cellx5920
      \intbl {\f0 {\f0\fs20 \'97}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clbrdrb\brdrs\brdrw50\brdrcf1\clbrdrl\brdrs\brdrw10\brdrcf1\clbrdrr\brdrs\brdrw10\brdrcf1\clbrdrt\brdrs\brdrw10\brdrcf1\cellx7104
      \intbl {\f0 {\f0\fs20 \'97}}\cell
      \pard\plain
      
      \pard\plain\uc0\ql\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clbrdrb\brdrs\brdrw50\brdrcf1\clbrdrl\brdrs\brdrw10\brdrcf1\clbrdrr\brdrs\brdrw10\brdrcf1\clbrdrt\brdrs\brdrw10\brdrcf1\cellx8288
      \intbl {\f0 {\f0\fs20 \'97}}\cell
      \pard\plain
      
      \pard\plain\uc0\qr\clvertalc\clpadb50\clpadfb3\clpadr50\clpadfr3\clpadl50\clpadfl3\clpadt50\clpadft3\clbrdrb\brdrs\brdrw50\brdrcf1\clbrdrl\brdrs\brdrw10\brdrcf1\clbrdrr\brdrs\brdrw10\brdrcf1\clbrdrt\brdrs\brdrw10\brdrcf1\cellx9472
      \intbl {\f0 {\f0\fs20 9,501.26}}\cell
      \pard\plain
      
      \row
      
      }

