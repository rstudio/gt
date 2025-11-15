# Footnotes with no location are rendered correctly

    Code
      cat(render_as_html(gt_tbl))
    Output
      <table class="gt_table" data-quarto-disable-processing="false" data-quarto-bootstrap="false">
        <thead>
          <tr class="gt_col_headings">
            <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id="num">num</th>
            <th class="gt_col_heading gt_columns_bottom_border gt_left" rowspan="1" colspan="1" scope="col" id="char">char</th>
            <th class="gt_col_heading gt_columns_bottom_border gt_center" rowspan="1" colspan="1" scope="col" id="fctr">fctr</th>
            <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id="date">date</th>
            <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id="time">time</th>
            <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id="datetime">datetime</th>
            <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id="currency">currency</th>
            <th class="gt_col_heading gt_columns_bottom_border gt_left" rowspan="1" colspan="1" scope="col" id="row">row</th>
            <th class="gt_col_heading gt_columns_bottom_border gt_left" rowspan="1" colspan="1" scope="col" id="group">group</th>
          </tr>
        </thead>
        <tbody class="gt_table_body">
          <tr><td headers="num" class="gt_row gt_right">0.1111</td>
      <td headers="char" class="gt_row gt_left">apricot</td>
      <td headers="fctr" class="gt_row gt_center">one</td>
      <td headers="date" class="gt_row gt_right">2015-01-15</td>
      <td headers="time" class="gt_row gt_right">13:35</td>
      <td headers="datetime" class="gt_row gt_right">2018-01-01 02:22</td>
      <td headers="currency" class="gt_row gt_right">49.95</td>
      <td headers="row" class="gt_row gt_left">row_1</td>
      <td headers="group" class="gt_row gt_left">grp_a</td></tr>
        </tbody>
        <tfoot>
          <tr class="gt_footnotes">
            <td class="gt_footnote" colspan="9"> A footnote.</td>
          </tr>
        </tfoot>
      </table>

---

    Code
      as.character(as_latex(gt_tbl))
    Output
      [1] "\\begingroup\n\\setlength{\\LTpost}{0mm}\n\\begin{longtable}{rlcrrrrll}\n\\toprule\nnum & char & fctr & date & time & datetime & currency & row & group \\\\ \n\\midrule\\addlinespace[2.5pt]\n0.1111 & apricot & one & 2015-01-15 & 13:35 & 2018-01-01 02:22 & 49.95 & row\\_1 & grp\\_a \\\\ \n\\bottomrule\n\\end{longtable}\n\\begin{minipage}{\\linewidth}\nA footnote.\\\\\n\\end{minipage}\n\\endgroup\n"

---

    Code
      as_rtf(gt_tbl)
    Output
      {\rtf\ansi\ansicpg1252{\fonttbl{\f0\froman\fcharset0\fprq0 Courier New;}{\f1\froman\fcharset0\fprq0 Times;}}{\colortbl;\red211\green211\blue211;}
      
      \paperw12240\paperh15840\widowctrl\ftnbj\fet0\sectd\linex0
      \lndscpsxn
      \margl1440\margr1440\margt1440\margb1440
      \headery720\footery720\fs20
      
      \trowd\trrh0\trhdr
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85\clbrdrb\brdrs\brdrw20\brdrcf1 \cellx1040
      \intbl {\f0 {\f0\fs20 num}}\cell
      
      \pard\plain\uc0\ql\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85\clbrdrb\brdrs\brdrw20\brdrcf1 \cellx2080
      \intbl {\f0 {\f0\fs20 char}}\cell
      
      \pard\plain\uc0\qc\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85\clbrdrb\brdrs\brdrw20\brdrcf1 \cellx3120
      \intbl {\f0 {\f0\fs20 fctr}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85\clbrdrb\brdrs\brdrw20\brdrcf1 \cellx4160
      \intbl {\f0 {\f0\fs20 date}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85\clbrdrb\brdrs\brdrw20\brdrcf1 \cellx5200
      \intbl {\f0 {\f0\fs20 time}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85\clbrdrb\brdrs\brdrw20\brdrcf1 \cellx6240
      \intbl {\f0 {\f0\fs20 datetime}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85\clbrdrb\brdrs\brdrw20\brdrcf1 \cellx7280
      \intbl {\f0 {\f0\fs20 currency}}\cell
      
      \pard\plain\uc0\ql\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85\clbrdrb\brdrs\brdrw20\brdrcf1 \cellx8320
      \intbl {\f0 {\f0\fs20 row}}\cell
      
      \pard\plain\uc0\ql\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85\clbrdrb\brdrs\brdrw20\brdrcf1 \cellx9360
      \intbl {\f0 {\f0\fs20 group}}\cell
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx1040
      \intbl {\f0 {\f0\fs20 0.1111}}\cell
      
      \pard\plain\uc0\ql\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx2080
      \intbl {\f0 {\f0\fs20 apricot}}\cell
      
      \pard\plain\uc0\qc\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx3120
      \intbl {\f0 {\f0\fs20 one}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx4160
      \intbl {\f0 {\f0\fs20 2015-01-15}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx5200
      \intbl {\f0 {\f0\fs20 13:35}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx6240
      \intbl {\f0 {\f0\fs20 2018-01-01 02:22}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx7280
      \intbl {\f0 {\f0\fs20 49.95}}\cell
      
      \pard\plain\uc0\ql\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx8320
      \intbl {\f0 {\f0\fs20 row_1}}\cell
      
      \pard\plain\uc0\ql\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx9360
      \intbl {\f0 {\f0\fs20 grp_a}}\cell
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\ql\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx9360
      \intbl {\f0 {\f0\fs20  A footnote.}}\cell
      
      \row
      
      }

---

    Code
      cat(render_as_html(gt_tbl))
    Output
      <table class="gt_table" data-quarto-disable-processing="false" data-quarto-bootstrap="false">
        <thead>
          <tr class="gt_col_headings">
            <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id="num">num</th>
            <th class="gt_col_heading gt_columns_bottom_border gt_left" rowspan="1" colspan="1" scope="col" id="char">char</th>
            <th class="gt_col_heading gt_columns_bottom_border gt_center" rowspan="1" colspan="1" scope="col" id="fctr">fctr</th>
            <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id="date">date</th>
            <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id="time">time</th>
            <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id="datetime">datetime</th>
            <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id="currency">currency</th>
            <th class="gt_col_heading gt_columns_bottom_border gt_left" rowspan="1" colspan="1" scope="col" id="row">row</th>
            <th class="gt_col_heading gt_columns_bottom_border gt_left" rowspan="1" colspan="1" scope="col" id="group">group</th>
          </tr>
        </thead>
        <tbody class="gt_table_body">
          <tr><td headers="num" class="gt_row gt_right">0.1111</td>
      <td headers="char" class="gt_row gt_left">apricot</td>
      <td headers="fctr" class="gt_row gt_center">one</td>
      <td headers="date" class="gt_row gt_right">2015-01-15</td>
      <td headers="time" class="gt_row gt_right">13:35</td>
      <td headers="datetime" class="gt_row gt_right">2018-01-01 02:22</td>
      <td headers="currency" class="gt_row gt_right">49.95</td>
      <td headers="row" class="gt_row gt_left">row_1</td>
      <td headers="group" class="gt_row gt_left">grp_a</td></tr>
        </tbody>
        <tfoot>
          <tr class="gt_footnotes">
            <td class="gt_footnote" colspan="9"> A footnote.</td>
          </tr>
        </tfoot>
      </table>

---

    Code
      as.character(as_latex(gt_tbl))
    Output
      [1] "\\begingroup\n\\setlength{\\LTpost}{0mm}\n\\begin{longtable}{rlcrrrrll}\n\\toprule\nnum & char & fctr & date & time & datetime & currency & row & group \\\\ \n\\midrule\\addlinespace[2.5pt]\n0.1111 & apricot & one & 2015-01-15 & 13:35 & 2018-01-01 02:22 & 49.95 & row\\_1 & grp\\_a \\\\ \n\\bottomrule\n\\end{longtable}\n\\begin{minipage}{\\linewidth}\nA footnote.\\\\\n\\end{minipage}\n\\endgroup\n"

---

    Code
      as_rtf(gt_tbl)
    Output
      {\rtf\ansi\ansicpg1252{\fonttbl{\f0\froman\fcharset0\fprq0 Courier New;}{\f1\froman\fcharset0\fprq0 Times;}}{\colortbl;\red211\green211\blue211;}
      
      \paperw12240\paperh15840\widowctrl\ftnbj\fet0\sectd\linex0
      \lndscpsxn
      \margl1440\margr1440\margt1440\margb1440
      \headery720\footery720\fs20
      
      \trowd\trrh0\trhdr
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85\clbrdrb\brdrs\brdrw20\brdrcf1 \cellx1040
      \intbl {\f0 {\f0\fs20 num}}\cell
      
      \pard\plain\uc0\ql\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85\clbrdrb\brdrs\brdrw20\brdrcf1 \cellx2080
      \intbl {\f0 {\f0\fs20 char}}\cell
      
      \pard\plain\uc0\qc\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85\clbrdrb\brdrs\brdrw20\brdrcf1 \cellx3120
      \intbl {\f0 {\f0\fs20 fctr}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85\clbrdrb\brdrs\brdrw20\brdrcf1 \cellx4160
      \intbl {\f0 {\f0\fs20 date}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85\clbrdrb\brdrs\brdrw20\brdrcf1 \cellx5200
      \intbl {\f0 {\f0\fs20 time}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85\clbrdrb\brdrs\brdrw20\brdrcf1 \cellx6240
      \intbl {\f0 {\f0\fs20 datetime}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85\clbrdrb\brdrs\brdrw20\brdrcf1 \cellx7280
      \intbl {\f0 {\f0\fs20 currency}}\cell
      
      \pard\plain\uc0\ql\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85\clbrdrb\brdrs\brdrw20\brdrcf1 \cellx8320
      \intbl {\f0 {\f0\fs20 row}}\cell
      
      \pard\plain\uc0\ql\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85\clbrdrb\brdrs\brdrw20\brdrcf1 \cellx9360
      \intbl {\f0 {\f0\fs20 group}}\cell
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx1040
      \intbl {\f0 {\f0\fs20 0.1111}}\cell
      
      \pard\plain\uc0\ql\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx2080
      \intbl {\f0 {\f0\fs20 apricot}}\cell
      
      \pard\plain\uc0\qc\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx3120
      \intbl {\f0 {\f0\fs20 one}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx4160
      \intbl {\f0 {\f0\fs20 2015-01-15}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx5200
      \intbl {\f0 {\f0\fs20 13:35}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx6240
      \intbl {\f0 {\f0\fs20 2018-01-01 02:22}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx7280
      \intbl {\f0 {\f0\fs20 49.95}}\cell
      
      \pard\plain\uc0\ql\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx8320
      \intbl {\f0 {\f0\fs20 row_1}}\cell
      
      \pard\plain\uc0\ql\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx9360
      \intbl {\f0 {\f0\fs20 grp_a}}\cell
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\ql\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx9360
      \intbl {\f0 {\f0\fs20  A footnote.}}\cell
      
      \row
      
      }

---

    Code
      cat(render_as_html(gt_tbl))
    Output
      <table class="gt_table" data-quarto-disable-processing="false" data-quarto-bootstrap="false">
        <thead>
          <tr class="gt_col_headings">
            <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id="num">num</th>
            <th class="gt_col_heading gt_columns_bottom_border gt_left" rowspan="1" colspan="1" scope="col" id="char">char</th>
            <th class="gt_col_heading gt_columns_bottom_border gt_center" rowspan="1" colspan="1" scope="col" id="fctr">fctr</th>
            <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id="date">date</th>
            <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id="time">time</th>
            <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id="datetime">datetime</th>
            <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id="currency">currency</th>
            <th class="gt_col_heading gt_columns_bottom_border gt_left" rowspan="1" colspan="1" scope="col" id="row">row</th>
            <th class="gt_col_heading gt_columns_bottom_border gt_left" rowspan="1" colspan="1" scope="col" id="group">group</th>
          </tr>
        </thead>
        <tbody class="gt_table_body">
          <tr><td headers="num" class="gt_row gt_right"><span class="gt_footnote_marks" style="white-space:nowrap;font-style:italic;font-weight:normal;line-height:0;"><sup>1</sup></span> 0.1111</td>
      <td headers="char" class="gt_row gt_left">apricot</td>
      <td headers="fctr" class="gt_row gt_center">one</td>
      <td headers="date" class="gt_row gt_right">2015-01-15</td>
      <td headers="time" class="gt_row gt_right">13:35</td>
      <td headers="datetime" class="gt_row gt_right">2018-01-01 02:22</td>
      <td headers="currency" class="gt_row gt_right">49.95</td>
      <td headers="row" class="gt_row gt_left">row_1</td>
      <td headers="group" class="gt_row gt_left">grp_a</td></tr>
        </tbody>
        <tfoot>
          <tr class="gt_footnotes">
            <td class="gt_footnote" colspan="9"> A footnote.</td>
          </tr>
          <tr class="gt_footnotes">
            <td class="gt_footnote" colspan="9"><span class="gt_footnote_marks" style="white-space:nowrap;font-style:italic;font-weight:normal;line-height:0;"><sup>1</sup></span> A footnote.</td>
          </tr>
        </tfoot>
      </table>

---

    Code
      as.character(as_latex(gt_tbl))
    Output
      [1] "\\begingroup\n\\setlength{\\LTpost}{0mm}\n\\begin{longtable}{rlcrrrrll}\n\\toprule\nnum & char & fctr & date & time & datetime & currency & row & group \\\\ \n\\midrule\\addlinespace[2.5pt]\n0.1111\\textsuperscript{\\textit{1}} & apricot & one & 2015-01-15 & 13:35 & 2018-01-01 02:22 & 49.95 & row\\_1 & grp\\_a \\\\ \n\\bottomrule\n\\end{longtable}\n\\begin{minipage}{\\linewidth}\nA footnote.\\\\\n\\textsuperscript{\\textit{1}}A footnote.\\\\\n\\end{minipage}\n\\endgroup\n"

---

    Code
      as_rtf(gt_tbl)
    Output
      {\rtf\ansi\ansicpg1252{\fonttbl{\f0\froman\fcharset0\fprq0 Courier New;}{\f1\froman\fcharset0\fprq0 Times;}}{\colortbl;\red211\green211\blue211;}
      
      \paperw12240\paperh15840\widowctrl\ftnbj\fet0\sectd\linex0
      \lndscpsxn
      \margl1440\margr1440\margt1440\margb1440
      \headery720\footery720\fs20
      
      \trowd\trrh0\trhdr
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85\clbrdrb\brdrs\brdrw20\brdrcf1 \cellx1040
      \intbl {\f0 {\f0\fs20 num}}\cell
      
      \pard\plain\uc0\ql\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85\clbrdrb\brdrs\brdrw20\brdrcf1 \cellx2080
      \intbl {\f0 {\f0\fs20 char}}\cell
      
      \pard\plain\uc0\qc\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85\clbrdrb\brdrs\brdrw20\brdrcf1 \cellx3120
      \intbl {\f0 {\f0\fs20 fctr}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85\clbrdrb\brdrs\brdrw20\brdrcf1 \cellx4160
      \intbl {\f0 {\f0\fs20 date}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85\clbrdrb\brdrs\brdrw20\brdrcf1 \cellx5200
      \intbl {\f0 {\f0\fs20 time}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85\clbrdrb\brdrs\brdrw20\brdrcf1 \cellx6240
      \intbl {\f0 {\f0\fs20 datetime}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85\clbrdrb\brdrs\brdrw20\brdrcf1 \cellx7280
      \intbl {\f0 {\f0\fs20 currency}}\cell
      
      \pard\plain\uc0\ql\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85\clbrdrb\brdrs\brdrw20\brdrcf1 \cellx8320
      \intbl {\f0 {\f0\fs20 row}}\cell
      
      \pard\plain\uc0\ql\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85\clbrdrb\brdrs\brdrw20\brdrcf1 \cellx9360
      \intbl {\f0 {\f0\fs20 group}}\cell
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx1040
      \intbl {\f0 {\f0\fs20 {\super \i 1} 0.1111}}\cell
      
      \pard\plain\uc0\ql\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx2080
      \intbl {\f0 {\f0\fs20 apricot}}\cell
      
      \pard\plain\uc0\qc\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx3120
      \intbl {\f0 {\f0\fs20 one}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx4160
      \intbl {\f0 {\f0\fs20 2015-01-15}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx5200
      \intbl {\f0 {\f0\fs20 13:35}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx6240
      \intbl {\f0 {\f0\fs20 2018-01-01 02:22}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx7280
      \intbl {\f0 {\f0\fs20 49.95}}\cell
      
      \pard\plain\uc0\ql\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx8320
      \intbl {\f0 {\f0\fs20 row_1}}\cell
      
      \pard\plain\uc0\ql\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx9360
      \intbl {\f0 {\f0\fs20 grp_a}}\cell
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\ql\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx9360
      \intbl {\f0 {\f0\fs20  A footnote.\line {\super \i 1} A footnote.}}\cell
      
      \row
      
      }

---

    Code
      cat(render_as_html(gt_tbl))
    Output
      <table class="gt_table" data-quarto-disable-processing="false" data-quarto-bootstrap="false">
        <thead>
          <tr class="gt_col_headings">
            <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id="num">num</th>
            <th class="gt_col_heading gt_columns_bottom_border gt_left" rowspan="1" colspan="1" scope="col" id="char">char</th>
            <th class="gt_col_heading gt_columns_bottom_border gt_center" rowspan="1" colspan="1" scope="col" id="fctr">fctr</th>
            <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id="date">date</th>
            <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id="time">time</th>
            <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id="datetime">datetime</th>
            <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id="currency">currency</th>
            <th class="gt_col_heading gt_columns_bottom_border gt_left" rowspan="1" colspan="1" scope="col" id="row">row</th>
            <th class="gt_col_heading gt_columns_bottom_border gt_left" rowspan="1" colspan="1" scope="col" id="group">group</th>
          </tr>
        </thead>
        <tbody class="gt_table_body">
          <tr><td headers="num" class="gt_row gt_right"><span class="gt_footnote_marks" style="white-space:nowrap;font-style:italic;font-weight:normal;line-height:0;"><sup>1</sup></span> 0.1111</td>
      <td headers="char" class="gt_row gt_left">apricot</td>
      <td headers="fctr" class="gt_row gt_center">one</td>
      <td headers="date" class="gt_row gt_right">2015-01-15</td>
      <td headers="time" class="gt_row gt_right">13:35</td>
      <td headers="datetime" class="gt_row gt_right">2018-01-01 02:22</td>
      <td headers="currency" class="gt_row gt_right">49.95</td>
      <td headers="row" class="gt_row gt_left">row_1</td>
      <td headers="group" class="gt_row gt_left">grp_a</td></tr>
        </tbody>
        <tfoot>
          <tr class="gt_footnotes">
            <td class="gt_footnote" colspan="9">
              <div style="padding-bottom:2px;"> A footnote.  A second footnote. <span class="gt_footnote_marks" style="white-space:nowrap;font-style:italic;font-weight:normal;line-height:0;"><sup>1</sup></span> location note</div>
            </td>
          </tr>
        </tfoot>
      </table>

---

    Code
      as.character(as_latex(gt_tbl))
    Output
      [1] "\\begingroup\n\\setlength{\\LTpost}{0mm}\n\\begin{longtable}{rlcrrrrll}\n\\toprule\nnum & char & fctr & date & time & datetime & currency & row & group \\\\ \n\\midrule\\addlinespace[2.5pt]\n0.1111\\textsuperscript{\\textit{1}} & apricot & one & 2015-01-15 & 13:35 & 2018-01-01 02:22 & 49.95 & row\\_1 & grp\\_a \\\\ \n\\bottomrule\n\\end{longtable}\n\\begin{minipage}{\\linewidth}\nA footnote. A second footnote. \\textsuperscript{\\textit{1}}location note\\\\\n\\end{minipage}\n\\endgroup\n"

---

    Code
      as_rtf(gt_tbl)
    Output
      {\rtf\ansi\ansicpg1252{\fonttbl{\f0\froman\fcharset0\fprq0 Courier New;}{\f1\froman\fcharset0\fprq0 Times;}}{\colortbl;\red211\green211\blue211;}
      
      \paperw12240\paperh15840\widowctrl\ftnbj\fet0\sectd\linex0
      \lndscpsxn
      \margl1440\margr1440\margt1440\margb1440
      \headery720\footery720\fs20
      
      \trowd\trrh0\trhdr
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85\clbrdrb\brdrs\brdrw20\brdrcf1 \cellx1040
      \intbl {\f0 {\f0\fs20 num}}\cell
      
      \pard\plain\uc0\ql\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85\clbrdrb\brdrs\brdrw20\brdrcf1 \cellx2080
      \intbl {\f0 {\f0\fs20 char}}\cell
      
      \pard\plain\uc0\qc\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85\clbrdrb\brdrs\brdrw20\brdrcf1 \cellx3120
      \intbl {\f0 {\f0\fs20 fctr}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85\clbrdrb\brdrs\brdrw20\brdrcf1 \cellx4160
      \intbl {\f0 {\f0\fs20 date}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85\clbrdrb\brdrs\brdrw20\brdrcf1 \cellx5200
      \intbl {\f0 {\f0\fs20 time}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85\clbrdrb\brdrs\brdrw20\brdrcf1 \cellx6240
      \intbl {\f0 {\f0\fs20 datetime}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85\clbrdrb\brdrs\brdrw20\brdrcf1 \cellx7280
      \intbl {\f0 {\f0\fs20 currency}}\cell
      
      \pard\plain\uc0\ql\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85\clbrdrb\brdrs\brdrw20\brdrcf1 \cellx8320
      \intbl {\f0 {\f0\fs20 row}}\cell
      
      \pard\plain\uc0\ql\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85\clbrdrb\brdrs\brdrw20\brdrcf1 \cellx9360
      \intbl {\f0 {\f0\fs20 group}}\cell
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx1040
      \intbl {\f0 {\f0\fs20 {\super \i 1} 0.1111}}\cell
      
      \pard\plain\uc0\ql\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx2080
      \intbl {\f0 {\f0\fs20 apricot}}\cell
      
      \pard\plain\uc0\qc\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx3120
      \intbl {\f0 {\f0\fs20 one}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx4160
      \intbl {\f0 {\f0\fs20 2015-01-15}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx5200
      \intbl {\f0 {\f0\fs20 13:35}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx6240
      \intbl {\f0 {\f0\fs20 2018-01-01 02:22}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx7280
      \intbl {\f0 {\f0\fs20 49.95}}\cell
      
      \pard\plain\uc0\ql\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx8320
      \intbl {\f0 {\f0\fs20 row_1}}\cell
      
      \pard\plain\uc0\ql\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx9360
      \intbl {\f0 {\f0\fs20 grp_a}}\cell
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\ql\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx9360
      \intbl {\f0 {\f0\fs20  A footnote.  A second footnote. {\super \i 1} location note}}\cell
      
      \row
      
      }

# Footnotes are correctly placed with text produced by `fmt_markdown()` (#1013)

    Code
      cat(render_as_html(gt_tbl))
    Output
      <table class="gt_table" data-quarto-disable-processing="false" data-quarto-bootstrap="false">
        <thead>
          <tr class="gt_col_headings">
            <th class="gt_col_heading gt_columns_bottom_border gt_left" rowspan="1" colspan="1" scope="col" id="char">char</th>
          </tr>
        </thead>
        <tbody class="gt_table_body">
          <tr><td headers="char" class="gt_row gt_left"><span class='gt_from_md'>apricot</span><span class="gt_footnote_marks" style="white-space:nowrap;font-style:italic;font-weight:normal;line-height:0;"><sup>1</sup></span></td></tr>
        </tbody>
        <tfoot>
          <tr class="gt_footnotes">
            <td class="gt_footnote" colspan="1"><span class="gt_footnote_marks" style="white-space:nowrap;font-style:italic;font-weight:normal;line-height:0;"><sup>1</sup></span> note</td>
          </tr>
        </tfoot>
      </table>

---

    Code
      cat(render_as_html(gt_tbl))
    Output
      <table class="gt_table" data-quarto-disable-processing="false" data-quarto-bootstrap="false">
        <thead>
          <tr class="gt_col_headings">
            <th class="gt_col_heading gt_columns_bottom_border gt_left" rowspan="1" colspan="1" scope="col" id="char">char</th>
          </tr>
        </thead>
        <tbody class="gt_table_body">
          <tr><td headers="char" class="gt_row gt_left"><span class="gt_footnote_marks" style="white-space:nowrap;font-style:italic;font-weight:normal;line-height:0;"><sup>1</sup></span> <span class='gt_from_md'>apricot</span></td></tr>
        </tbody>
        <tfoot>
          <tr class="gt_footnotes">
            <td class="gt_footnote" colspan="1"><span class="gt_footnote_marks" style="white-space:nowrap;font-style:italic;font-weight:normal;line-height:0;"><sup>1</sup></span> note</td>
          </tr>
        </tfoot>
      </table>

# Footnotes are correctly placed with text produced by `fmt_markdown()` in Quarto (#1773)

    Code
      cat(render_as_html(gt_tbl))
    Output
      <table class="gt_table" data-quarto-disable-processing="false" data-quarto-bootstrap="false">
        <thead>
          <tr class="gt_col_headings">
            <th class="gt_col_heading gt_columns_bottom_border gt_left" rowspan="1" colspan="1" scope="col" id="char">char</th>
          </tr>
        </thead>
        <tbody class="gt_table_body">
          <tr><td headers="char" class="gt_row gt_left"><span data-qmd-base64="YXByaWNvdA=="><span class='gt_from_md'>apricot</span></span><span class="gt_footnote_marks" style="white-space:nowrap;font-style:italic;font-weight:normal;line-height:0;"><sup>1</sup></span></td></tr>
        </tbody>
        <tfoot>
          <tr class="gt_footnotes">
            <td class="gt_footnote" colspan="1"><span class="gt_footnote_marks" style="white-space:nowrap;font-style:italic;font-weight:normal;line-height:0;"><sup>1</sup></span> note</td>
          </tr>
        </tfoot>
      </table>

---

    Code
      cat(render_as_html(gt_tbl))
    Output
      <table class="gt_table" data-quarto-disable-processing="false" data-quarto-bootstrap="false">
        <thead>
          <tr class="gt_col_headings">
            <th class="gt_col_heading gt_columns_bottom_border gt_left" rowspan="1" colspan="1" scope="col" id="char">char</th>
          </tr>
        </thead>
        <tbody class="gt_table_body">
          <tr><td headers="char" class="gt_row gt_left"><span class="gt_footnote_marks" style="white-space:nowrap;font-style:italic;font-weight:normal;line-height:0;"><sup>1</sup></span> <span data-qmd-base64="YXByaWNvdA=="><span class='gt_from_md'>apricot</span></span></td></tr>
        </tbody>
        <tfoot>
          <tr class="gt_footnotes">
            <td class="gt_footnote" colspan="1"><span class="gt_footnote_marks" style="white-space:nowrap;font-style:italic;font-weight:normal;line-height:0;"><sup>1</sup></span> note</td>
          </tr>
        </tfoot>
      </table>

# Footnotes work with group labels in 2-column stub arrangements

    Code
      cat(render_as_html(gt_tbl))
    Output
      <table class="gt_table" data-quarto-disable-processing="false" data-quarto-bootstrap="false">
        <thead>
          <tr class="gt_col_headings">
            <th class="gt_col_heading gt_columns_bottom_border gt_left" rowspan="1" colspan="2" scope="colgroup" id="a::stub"></th>
            <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id="Pizzas-Sold">Pizzas Sold</th>
          </tr>
        </thead>
        <tbody class="gt_table_body">
          <tr class="gt_row_group_first"><td headers="peppr_salami stub_2_1 stub_1" rowspan="4" class="gt_row gt_left gt_stub_row_group">peppr_salami<span class="gt_footnote_marks" style="white-space:nowrap;font-style:italic;font-weight:normal;line-height:0;"><sup>1</sup></span></td>
      <th id="stub_2_1" scope="row" class="gt_row gt_left gt_stub">L</th>
      <td headers="peppr_salami stub_2_1 Pizzas Sold" class="gt_row gt_right">696</td></tr>
          <tr><th id="stub_2_2" scope="row" class="gt_row gt_left gt_stub">M</th>
      <td headers="peppr_salami stub_2_2 Pizzas Sold" class="gt_row gt_right">428</td></tr>
          <tr><th id="stub_2_3" scope="row" class="gt_row gt_left gt_stub">S</th>
      <td headers="peppr_salami stub_2_3 Pizzas Sold" class="gt_row gt_right">322</td></tr>
          <tr><th id="summary_stub_peppr_salami_1" scope="row" class="gt_row gt_left gt_stub gt_summary_row gt_first_summary_row thick gt_last_summary_row">sum</th>
      <td headers="peppr_salami summary_stub_peppr_salami_1 Pizzas Sold" class="gt_row gt_right gt_summary_row gt_first_summary_row thick gt_last_summary_row">1,446</td></tr>
          <tr class="gt_row_group_first"><td headers="soppressata stub_2_4 stub_1" rowspan="4" class="gt_row gt_left gt_stub_row_group">soppressata</td>
      <th id="stub_2_4" scope="row" class="gt_row gt_left gt_stub">L</th>
      <td headers="soppressata stub_2_4 Pizzas Sold" class="gt_row gt_right">405</td></tr>
          <tr><th id="stub_2_5" scope="row" class="gt_row gt_left gt_stub">M</th>
      <td headers="soppressata stub_2_5 Pizzas Sold" class="gt_row gt_right">268</td></tr>
          <tr><th id="stub_2_6" scope="row" class="gt_row gt_left gt_stub">S</th>
      <td headers="soppressata stub_2_6 Pizzas Sold" class="gt_row gt_right">288</td></tr>
          <tr><th id="summary_stub_soppressata_1" scope="row" class="gt_row gt_left gt_stub gt_summary_row gt_first_summary_row thick gt_last_summary_row">sum</th>
      <td headers="soppressata summary_stub_soppressata_1 Pizzas Sold" class="gt_row gt_right gt_summary_row gt_first_summary_row thick gt_last_summary_row">961</td></tr>
        </tbody>
        <tfoot>
          <tr class="gt_footnotes">
            <td class="gt_footnote" colspan="3"><span class="gt_footnote_marks" style="white-space:nowrap;font-style:italic;font-weight:normal;line-height:0;"><sup>1</sup></span> The Pepper-Salami.</td>
          </tr>
        </tfoot>
      </table>

---

    Code
      as.character(as_latex(gt_tbl))
    Output
      [1] "\\begingroup\n\\setlength{\\LTpost}{0mm}\n\\begin{longtable}{l|l|r}\n\\toprule\n\\multicolumn{2}{c}{} & Pizzas Sold \\\\ \n\\midrule\\addlinespace[2.5pt]\n\\multirow[t]{4}{*}{peppr\\_salami\\textsuperscript{\\textit{1}}} & L & 696 \\\\ \n & M & 428 \\\\ \n & S & 322 \\\\ \n\\cmidrule(l{-0.05em}r){2-3}\n\\multicolumn{1}{l|}{} & \\multicolumn{1}{l|}{sum} & 1,446 \\\\ \n\\midrule\\addlinespace[2.5pt]\n\\multirow[t]{4}{*}{soppressata} & L & 405 \\\\ \n & M & 268 \\\\ \n & S & 288 \\\\ \n\\cmidrule(l{-0.05em}r){2-3}\n\\multicolumn{1}{l|}{} & \\multicolumn{1}{l|}{sum} & 961 \\\\ \n\\bottomrule\n\\end{longtable}\n\\begin{minipage}{\\linewidth}\n\\textsuperscript{\\textit{1}}The Pepper-Salami.\\\\\n\\end{minipage}\n\\endgroup\n"

---

    Code
      as_rtf(gt_tbl)
    Output
      {\rtf\ansi\ansicpg1252{\fonttbl{\f0\froman\fcharset0\fprq0 Courier New;}{\f1\froman\fcharset0\fprq0 Times;}}{\colortbl;\red211\green211\blue211;}
      
      \paperw12240\paperh15840\widowctrl\ftnbj\fet0\sectd\linex0
      \lndscpsxn
      \margl1440\margr1440\margt1440\margb1440
      \headery720\footery720\fs20
      
      \trowd\trrh0\trhdr
      
      \pard\plain\uc0\ql\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85\clbrdrb\brdrs\brdrw20\brdrcf1\clmgf \cellx3120
      \intbl {\f0 {\f0\fs20 }}\cell
      
      \pard\plain\uc0\ql\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85\clbrdrb\brdrs\brdrw20\brdrcf1\clmrg \cellx6240
      \intbl {\f0 {\f0\fs20 }}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85\clbrdrb\brdrs\brdrw20\brdrcf1 \cellx9360
      \intbl {\f0 {\f0\fs20 Pizzas Sold}}\cell
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\ql\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx3120
      \intbl {\f0 {\f0\fs20 peppr_salami{\super \i 1}}}\cell
      
      \pard\plain\uc0\ql\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx6240
      \intbl {\f0 {\f0\fs20 L}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx9360
      \intbl {\f0 {\f0\fs20 696}}\cell
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\ql\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx3120
      \intbl {\f0 {\f0\fs20 }}\cell
      
      \pard\plain\uc0\ql\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx6240
      \intbl {\f0 {\f0\fs20 M}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx9360
      \intbl {\f0 {\f0\fs20 428}}\cell
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\ql\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx3120
      \intbl {\f0 {\f0\fs20 }}\cell
      
      \pard\plain\uc0\ql\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx6240
      \intbl {\f0 {\f0\fs20 S}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx9360
      \intbl {\f0 {\f0\fs20 322}}\cell
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\ql\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx3120
      \intbl {\f0 {\f0\fs20 }}\cell
      
      \pard\plain\uc0\ql\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx6240
      \intbl {\f0 {\f0\fs20 sum}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx9360
      \intbl {\f0 {\f0\fs20 1,446}}\cell
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\ql\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx3120
      \intbl {\f0 {\f0\fs20 soppressata}}\cell
      
      \pard\plain\uc0\ql\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx6240
      \intbl {\f0 {\f0\fs20 L}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx9360
      \intbl {\f0 {\f0\fs20 405}}\cell
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\ql\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx3120
      \intbl {\f0 {\f0\fs20 }}\cell
      
      \pard\plain\uc0\ql\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx6240
      \intbl {\f0 {\f0\fs20 M}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx9360
      \intbl {\f0 {\f0\fs20 268}}\cell
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\ql\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx3120
      \intbl {\f0 {\f0\fs20 }}\cell
      
      \pard\plain\uc0\ql\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx6240
      \intbl {\f0 {\f0\fs20 S}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx9360
      \intbl {\f0 {\f0\fs20 288}}\cell
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\ql\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx3120
      \intbl {\f0 {\f0\fs20 }}\cell
      
      \pard\plain\uc0\ql\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx6240
      \intbl {\f0 {\f0\fs20 sum}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx9360
      \intbl {\f0 {\f0\fs20 961}}\cell
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\ql\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx9360
      \intbl {\f0 {\f0\fs20 {\super \i 1} The Pepper-Salami.}}\cell
      
      \row
      
      }

# tab_footnote() produces helpful error messages (#475).

    Code
      tab_footnote(start_gt, footnote = "First data cell.", locations = cells_body(
        columns = "valuer", rows = 1))
    Condition
      Error in `tab_footnote()`:
      ! Can't add footnote "First data cell.".
      Caused by error in `cells_body()`:
      ! Can't select columns that don't exist.
      x Column `valuer` doesn't exist.
    Code
      tab_footnote(start_gt, footnote = "First data cell.", locations = cells_column_labels(
        columns = "valuer"))
    Condition
      Error in `tab_footnote()`:
      ! Can't add footnote "First data cell.".
      Caused by error in `cells_column_labels()`:
      ! Can't select columns that don't exist.
      x Column `valuer` doesn't exist.
    Code
      tab_footnote(start_gt, footnote = "First data cell.", locations = cells_column_spanners(
        "valuer"))
    Condition
      Error in `tab_footnote()`:
      ! Can't add footnote "First data cell.".
      Caused by error in `cells_column_spanners()`:
      ! Spanner "valuer" does not exist in the data.
    Code
      tab_footnote(start_gt, footnote = "First data cell.", locations = cells_column_spanners(
        3))
    Condition
      Error in `tab_footnote()`:
      ! Can't add footnote "First data cell.".
      Caused by error in `cells_column_spanners()`:
      ! Spanner 3 does not exist in the data.
    Code
      tab_footnote(start_gt, footnote = "Footnote error.", locations = cells_body(
        columns = "value_1", rows = "Mazda RX7"))
    Condition
      Error in `tab_footnote()`:
      ! Can't add footnote "Footnote error.".
      Caused by error in `cells_body()`:
      ! Row "Mazda RX7" does not exist in the data.

# tab_footnote() errors well when it can't resolve location

    Code
      tab_footnote(data, footnote = "Summary cell footnote.", locations = cells_summary(
        groups = "Mercs", columns = starts_with("x"), rows = 2))
    Condition
      Error in `tab_footnote()`:
      ! Can't add footnote "Summary cell footnote.".
      Caused by error in `cells_summary()`:
      ! The location requested could not be resolved.
      * Review the expression provided as `columns`.
    Code
      tab_footnote(data, footnote = "Summary cell footnote.", locations = cells_summary(
        groups = "Mercs", columns = starts_with("m"), rows = starts_with("x")))
    Condition
      Error in `tab_footnote()`:
      ! Can't add footnote "Summary cell footnote.".
      Caused by error in `cells_summary()`:
      ! The location requested could not be resolved.
      * Review the expression provided as `rows`.
    Code
      tab_footnote(data, footnote = "Grand summary cell footnote.", locations = cells_grand_summary(
        columns = starts_with("x"), rows = 2))
    Condition
      Error in `tab_footnote()`:
      ! Can't add footnote "Grand summary cell footnote.".
      Caused by error in `cells_grand_summary()`:
      ! The location requested could not be resolved.
      * Review the expression provided as `columns`.
    Code
      tab_footnote(data, footnote = "Grand summary cell footnote.", locations = cells_grand_summary(
        columns = starts_with("m"), rows = starts_with("x")))
    Condition
      Error in `tab_footnote()`:
      ! Can't add footnote "Grand summary cell footnote.".
      Caused by error in `cells_grand_summary()`:
      ! The location requested could not be resolved.
      * Review the expression provided as `rows`.
    Code
      tab_footnote(data, footnote = "Grand summary cell footnote.", locations = cells_grand_summary(
        columns = starts_with("m"), rows = 15))
    Condition
      Error in `tab_footnote()`:
      ! Can't add footnote "Grand summary cell footnote.".
      Caused by error in `cells_grand_summary()`:
      ! Grand summary row 15 does not exist in the data.

# footnote consolidation works correctly (regression test for duplicate footnotes)

    Code
      cat(render_as_html(gt_tbl))
    Output
      <table class="gt_table" data-quarto-disable-processing="false" data-quarto-bootstrap="false">
        <thead>
          <tr class="gt_col_headings">
            <th class="gt_col_heading gt_columns_bottom_border gt_left" rowspan="1" colspan="1" scope="col" id="name">name</th>
            <th class="gt_col_heading gt_columns_bottom_border gt_left" rowspan="1" colspan="1" scope="col" id="csd_type">csd_type</th>
            <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id="population_2021">population_2021</th>
          </tr>
        </thead>
        <tbody class="gt_table_body">
          <tr><td headers="name" class="gt_row gt_left">Addington Highlands<span class="gt_footnote_marks" style="white-space:nowrap;font-style:italic;font-weight:normal;line-height:0;"><sup>1</sup></span></td>
      <td headers="csd_type" class="gt_row gt_left">township</td>
      <td headers="population_2021" class="gt_row gt_right">2534</td></tr>
          <tr><td headers="name" class="gt_row gt_left">Adelaide Metcalfe<span class="gt_footnote_marks" style="white-space:nowrap;font-style:italic;font-weight:normal;line-height:0;"><sup>1</sup></span></td>
      <td headers="csd_type" class="gt_row gt_left">township</td>
      <td headers="population_2021" class="gt_row gt_right">3011</td></tr>
          <tr><td headers="name" class="gt_row gt_left">Adjala-Tosorontio<span class="gt_footnote_marks" style="white-space:nowrap;font-style:italic;font-weight:normal;line-height:0;"><sup>1</sup></span></td>
      <td headers="csd_type" class="gt_row gt_left">township</td>
      <td headers="population_2021" class="gt_row gt_right">10989</td></tr>
          <tr><td headers="name" class="gt_row gt_left">Admaston/Bromley<span class="gt_footnote_marks" style="white-space:nowrap;font-style:italic;font-weight:normal;line-height:0;"><sup>1</sup></span></td>
      <td headers="csd_type" class="gt_row gt_left">township</td>
      <td headers="population_2021" class="gt_row gt_right">2995</td></tr>
          <tr><td headers="name" class="gt_row gt_left">Ajax<span class="gt_footnote_marks" style="white-space:nowrap;font-style:italic;font-weight:normal;line-height:0;"><sup>1</sup></span></td>
      <td headers="csd_type" class="gt_row gt_left">town</td>
      <td headers="population_2021" class="gt_row gt_right">126666</td></tr>
        </tbody>
        <tfoot>
          <tr class="gt_footnotes">
            <td class="gt_footnote" colspan="3"><span class="gt_footnote_marks" style="white-space:nowrap;font-style:italic;font-weight:normal;line-height:0;"><sup>1</sup></span> Part of the Greater Toronto Area.</td>
          </tr>
        </tfoot>
      </table>

---

    Code
      cat(render_as_html(gt_tbl))
    Output
      <table class="gt_table" data-quarto-disable-processing="false" data-quarto-bootstrap="false">
        <thead>
          <tr class="gt_col_headings">
            <th class="gt_col_heading gt_columns_bottom_border gt_left" rowspan="1" colspan="1" scope="col" id="name">name</th>
            <th class="gt_col_heading gt_columns_bottom_border gt_left" rowspan="1" colspan="1" scope="col" id="csd_type">csd_type</th>
            <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id="population_2021">population_2021</th>
          </tr>
        </thead>
        <tbody class="gt_table_body">
          <tr><td headers="name" class="gt_row gt_left">Addington Highlands<span class="gt_footnote_marks" style="white-space:nowrap;font-style:italic;font-weight:normal;line-height:0;"><sup>1</sup></span></td>
      <td headers="csd_type" class="gt_row gt_left">township</td>
      <td headers="population_2021" class="gt_row gt_right">2534</td></tr>
          <tr><td headers="name" class="gt_row gt_left">Adelaide Metcalfe<span class="gt_footnote_marks" style="white-space:nowrap;font-style:italic;font-weight:normal;line-height:0;"><sup>2</sup></span></td>
      <td headers="csd_type" class="gt_row gt_left">township</td>
      <td headers="population_2021" class="gt_row gt_right">3011</td></tr>
          <tr><td headers="name" class="gt_row gt_left">Adjala-Tosorontio<span class="gt_footnote_marks" style="white-space:nowrap;font-style:italic;font-weight:normal;line-height:0;"><sup>1</sup></span></td>
      <td headers="csd_type" class="gt_row gt_left">township</td>
      <td headers="population_2021" class="gt_row gt_right">10989</td></tr>
          <tr><td headers="name" class="gt_row gt_left">Admaston/Bromley<span class="gt_footnote_marks" style="white-space:nowrap;font-style:italic;font-weight:normal;line-height:0;"><sup>2</sup></span></td>
      <td headers="csd_type" class="gt_row gt_left">township</td>
      <td headers="population_2021" class="gt_row gt_right">2995</td></tr>
          <tr><td headers="name" class="gt_row gt_left">Ajax<span class="gt_footnote_marks" style="white-space:nowrap;font-style:italic;font-weight:normal;line-height:0;"><sup>1</sup></span></td>
      <td headers="csd_type" class="gt_row gt_left">town</td>
      <td headers="population_2021" class="gt_row gt_right">126666</td></tr>
          <tr><td headers="name" class="gt_row gt_left">Alberton<span class="gt_footnote_marks" style="white-space:nowrap;font-style:italic;font-weight:normal;line-height:0;"><sup>1</sup></span></td>
      <td headers="csd_type" class="gt_row gt_left">township</td>
      <td headers="population_2021" class="gt_row gt_right">954</td></tr>
        </tbody>
        <tfoot>
          <tr class="gt_footnotes">
            <td class="gt_footnote" colspan="3"><span class="gt_footnote_marks" style="white-space:nowrap;font-style:italic;font-weight:normal;line-height:0;"><sup>1</sup></span> Part of the Greater Toronto Area.</td>
          </tr>
          <tr class="gt_footnotes">
            <td class="gt_footnote" colspan="3"><span class="gt_footnote_marks" style="white-space:nowrap;font-style:italic;font-weight:normal;line-height:0;"><sup>2</sup></span> Different footnote text.</td>
          </tr>
        </tfoot>
      </table>

# footnote kitchen sink test - comprehensive location and consolidation scenarios

    Code
      cat(render_as_html(gt_tbl))
    Output
      <table class="gt_table" data-quarto-disable-processing="false" data-quarto-bootstrap="false">
        <thead>
          <tr class="gt_heading">
            <td colspan="4" class="gt_heading gt_title gt_font_normal" style>Kitchen Sink Footnote Test<span class="gt_footnote_marks" style="white-space:nowrap;font-style:italic;font-weight:normal;line-height:0;"><sup>1</sup></span></td>
          </tr>
          <tr class="gt_heading">
            <td colspan="4" class="gt_heading gt_subtitle gt_font_normal gt_bottom_border" style>Testing all footnote locations and consolidation<span class="gt_footnote_marks" style="white-space:nowrap;font-style:italic;font-weight:normal;line-height:0;"><sup>2,3,4</sup></span></td>
          </tr>
          <tr class="gt_col_headings gt_spanner_row">
            <th class="gt_col_heading gt_columns_bottom_border gt_left" rowspan="2" colspan="1" scope="col" id="a::stub"></th>
            <th class="gt_center gt_columns_top_border gt_column_spanner_outer" rowspan="1" colspan="3" scope="colgroup" id="Data Columns">
              <div class="gt_column_spanner">Data Columns<span class="gt_footnote_marks" style="white-space:nowrap;font-style:italic;font-weight:normal;line-height:0;"><sup>5</sup></span></div>
            </th>
          </tr>
          <tr class="gt_col_headings">
            <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id="num">num<span class="gt_footnote_marks" style="white-space:nowrap;font-style:italic;font-weight:normal;line-height:0;"><sup>1</sup></span></th>
            <th class="gt_col_heading gt_columns_bottom_border gt_left" rowspan="1" colspan="1" scope="col" id="char">char<span class="gt_footnote_marks" style="white-space:nowrap;font-style:italic;font-weight:normal;line-height:0;"><sup>1</sup></span></th>
            <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id="currency">currency</th>
          </tr>
        </thead>
        <tbody class="gt_table_body">
          <tr><th id="stub_1_1" scope="row" class="gt_row gt_right gt_stub"><span class="gt_footnote_marks" style="white-space:nowrap;font-style:italic;font-weight:normal;line-height:0;"><sup>1</sup></span> 1</th>
      <td headers="stub_1_1 num" class="gt_row gt_right">0.1111</td>
      <td headers="stub_1_1 char" class="gt_row gt_left">apricot<span class="gt_footnote_marks" style="white-space:nowrap;font-style:italic;font-weight:normal;line-height:0;"><sup>1</sup></span></td>
      <td headers="stub_1_1 currency" class="gt_row gt_right"><span class="gt_footnote_marks" style="white-space:nowrap;font-style:italic;font-weight:normal;line-height:0;"><sup>6</sup></span> 49.95</td></tr>
          <tr><th id="stub_1_2" scope="row" class="gt_row gt_right gt_stub">2</th>
      <td headers="stub_1_2 num" class="gt_row gt_right"><span class="gt_footnote_marks" style="white-space:nowrap;font-style:italic;font-weight:normal;line-height:0;"><sup>6</sup></span> 2.2220</td>
      <td headers="stub_1_2 char" class="gt_row gt_left">banana</td>
      <td headers="stub_1_2 currency" class="gt_row gt_right"><span class="gt_footnote_marks" style="white-space:nowrap;font-style:italic;font-weight:normal;line-height:0;"><sup>6</sup></span> 17.95</td></tr>
          <tr><th id="stub_1_3" scope="row" class="gt_row gt_right gt_stub">3</th>
      <td headers="stub_1_3 num" class="gt_row gt_right">33.3300</td>
      <td headers="stub_1_3 char" class="gt_row gt_left">coconut</td>
      <td headers="stub_1_3 currency" class="gt_row gt_right"><span class="gt_footnote_marks" style="white-space:nowrap;font-style:italic;font-weight:normal;line-height:0;"><sup>6</sup></span> 1.39</td></tr>
        </tbody>
        <tfoot>
          <tr class="gt_footnotes">
            <td class="gt_footnote" colspan="4"><span class="gt_footnote_marks" style="white-space:nowrap;font-style:italic;font-weight:normal;line-height:0;"><sup>1</sup></span> Shared footnote across locations.</td>
          </tr>
          <tr class="gt_footnotes">
            <td class="gt_footnote" colspan="4"><span class="gt_footnote_marks" style="white-space:nowrap;font-style:italic;font-weight:normal;line-height:0;"><sup>2</sup></span> First footnote on subtitle.</td>
          </tr>
          <tr class="gt_footnotes">
            <td class="gt_footnote" colspan="4"><span class="gt_footnote_marks" style="white-space:nowrap;font-style:italic;font-weight:normal;line-height:0;"><sup>3</sup></span> Second footnote on subtitle.</td>
          </tr>
          <tr class="gt_footnotes">
            <td class="gt_footnote" colspan="4"><span class="gt_footnote_marks" style="white-space:nowrap;font-style:italic;font-weight:normal;line-height:0;"><sup>4</sup></span> Third footnote on subtitle.</td>
          </tr>
          <tr class="gt_footnotes">
            <td class="gt_footnote" colspan="4"><span class="gt_footnote_marks" style="white-space:nowrap;font-style:italic;font-weight:normal;line-height:0;"><sup>5</sup></span> Unique column spanner footnote.</td>
          </tr>
          <tr class="gt_footnotes">
            <td class="gt_footnote" colspan="4"><span class="gt_footnote_marks" style="white-space:nowrap;font-style:italic;font-weight:normal;line-height:0;"><sup>6</sup></span> Repeated in body cells.</td>
          </tr>
          <tr class="gt_sourcenotes">
            <td class="gt_sourcenote" colspan="4">Source: exibble dataset</td>
          </tr>
        </tfoot>
      </table>

