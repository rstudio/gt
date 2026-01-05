# Group labels as a column work well across many variations

    Code
      cat(render_as_html(gt_tbl))
    Output
      <table class="gt_table" data-quarto-disable-processing="false" data-quarto-bootstrap="false">
        <thead>
          <tr class="gt_heading">
            <td colspan="9" class="gt_heading gt_title gt_font_normal" style><span class='gt_from_md'>Data listing from <strong>exibble</strong></span></td>
          </tr>
          <tr class="gt_heading">
            <td colspan="9" class="gt_heading gt_subtitle gt_font_normal gt_bottom_border" style><span class='gt_from_md'><code>exibble</code> is an R dataset</span></td>
          </tr>
          <tr class="gt_col_headings gt_spanner_row">
            <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="2" colspan="1" scope="col" id="num">num</th>
            <th class="gt_col_heading gt_columns_bottom_border gt_left" rowspan="2" colspan="1" scope="col" id="char">char</th>
            <th class="gt_col_heading gt_columns_bottom_border gt_center" rowspan="2" colspan="1" scope="col" id="fctr">fctr</th>
            <th class="gt_center gt_columns_top_border gt_column_spanner_outer" rowspan="1" colspan="3" scope="colgroup" id="timing">
              <div class="gt_column_spanner">timing</div>
            </th>
            <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="2" colspan="1" scope="col" id="currency">currency</th>
            <th class="gt_col_heading gt_columns_bottom_border gt_left" rowspan="2" colspan="1" scope="col" id="row">row</th>
            <th class="gt_col_heading gt_columns_bottom_border gt_left" rowspan="2" colspan="1" scope="col" id="group">group</th>
          </tr>
          <tr class="gt_col_headings">
            <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id="date">date</th>
            <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id="time">time</th>
            <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id="datetime">datetime</th>
          </tr>
        </thead>
        <tbody class="gt_table_body">
          <tr><td headers="num" class="gt_row gt_right">1.111e-01</td>
      <td headers="char" class="gt_row gt_left">apricot</td>
      <td headers="fctr" class="gt_row gt_center">one</td>
      <td headers="date" class="gt_row gt_right">2015-01-15</td>
      <td headers="time" class="gt_row gt_right">13:35</td>
      <td headers="datetime" class="gt_row gt_right">2018-01-01 02:22</td>
      <td headers="currency" class="gt_row gt_right">49.950</td>
      <td headers="row" class="gt_row gt_left">row_1</td>
      <td headers="group" class="gt_row gt_left">grp_a</td></tr>
          <tr><td headers="num" class="gt_row gt_right">2.222e+00</td>
      <td headers="char" class="gt_row gt_left">banana</td>
      <td headers="fctr" class="gt_row gt_center">two</td>
      <td headers="date" class="gt_row gt_right">2015-02-15</td>
      <td headers="time" class="gt_row gt_right">14:40</td>
      <td headers="datetime" class="gt_row gt_right">2018-02-02 14:33</td>
      <td headers="currency" class="gt_row gt_right">17.950</td>
      <td headers="row" class="gt_row gt_left">row_2</td>
      <td headers="group" class="gt_row gt_left">grp_a</td></tr>
          <tr><td headers="num" class="gt_row gt_right">3.333e+01</td>
      <td headers="char" class="gt_row gt_left">coconut</td>
      <td headers="fctr" class="gt_row gt_center">three</td>
      <td headers="date" class="gt_row gt_right">2015-03-15</td>
      <td headers="time" class="gt_row gt_right">15:45</td>
      <td headers="datetime" class="gt_row gt_right">2018-03-03 03:44</td>
      <td headers="currency" class="gt_row gt_right">1.390</td>
      <td headers="row" class="gt_row gt_left">row_3</td>
      <td headers="group" class="gt_row gt_left">grp_a</td></tr>
          <tr><td headers="num" class="gt_row gt_right">4.444e+02</td>
      <td headers="char" class="gt_row gt_left">durian</td>
      <td headers="fctr" class="gt_row gt_center">four</td>
      <td headers="date" class="gt_row gt_right">2015-04-15</td>
      <td headers="time" class="gt_row gt_right">16:50</td>
      <td headers="datetime" class="gt_row gt_right">2018-04-04 15:55</td>
      <td headers="currency" class="gt_row gt_right">65100.000</td>
      <td headers="row" class="gt_row gt_left">row_4</td>
      <td headers="group" class="gt_row gt_left">grp_a</td></tr>
          <tr><td headers="num" class="gt_row gt_right">5.550e+03</td>
      <td headers="char" class="gt_row gt_left">NA</td>
      <td headers="fctr" class="gt_row gt_center">five</td>
      <td headers="date" class="gt_row gt_right">2015-05-15</td>
      <td headers="time" class="gt_row gt_right">17:55</td>
      <td headers="datetime" class="gt_row gt_right">2018-05-05 04:00</td>
      <td headers="currency" class="gt_row gt_right">1325.810</td>
      <td headers="row" class="gt_row gt_left">row_5</td>
      <td headers="group" class="gt_row gt_left">grp_b</td></tr>
          <tr><td headers="num" class="gt_row gt_right">NA</td>
      <td headers="char" class="gt_row gt_left">fig</td>
      <td headers="fctr" class="gt_row gt_center">six</td>
      <td headers="date" class="gt_row gt_right">2015-06-15</td>
      <td headers="time" class="gt_row gt_right">NA</td>
      <td headers="datetime" class="gt_row gt_right">2018-06-06 16:11</td>
      <td headers="currency" class="gt_row gt_right">13.255</td>
      <td headers="row" class="gt_row gt_left">row_6</td>
      <td headers="group" class="gt_row gt_left">grp_b</td></tr>
          <tr><td headers="num" class="gt_row gt_right">7.770e+05</td>
      <td headers="char" class="gt_row gt_left">grapefruit</td>
      <td headers="fctr" class="gt_row gt_center">seven</td>
      <td headers="date" class="gt_row gt_right">NA</td>
      <td headers="time" class="gt_row gt_right">19:10</td>
      <td headers="datetime" class="gt_row gt_right">2018-07-07 05:22</td>
      <td headers="currency" class="gt_row gt_right">NA</td>
      <td headers="row" class="gt_row gt_left">row_7</td>
      <td headers="group" class="gt_row gt_left">grp_b</td></tr>
          <tr><td headers="num" class="gt_row gt_right">8.880e+06</td>
      <td headers="char" class="gt_row gt_left">honeydew</td>
      <td headers="fctr" class="gt_row gt_center">eight</td>
      <td headers="date" class="gt_row gt_right">2015-08-15</td>
      <td headers="time" class="gt_row gt_right">20:20</td>
      <td headers="datetime" class="gt_row gt_right">NA</td>
      <td headers="currency" class="gt_row gt_right">0.440</td>
      <td headers="row" class="gt_row gt_left">row_8</td>
      <td headers="group" class="gt_row gt_left">grp_b</td></tr>
        </tbody>
        <tfoot>
          <tr class="gt_sourcenotes">
            <td class="gt_sourcenote" colspan="9">Source note #1</td>
          </tr>
          <tr class="gt_sourcenotes">
            <td class="gt_sourcenote" colspan="9">Source note #2</td>
          </tr>
        </tfoot>
      </table>

---

    Code
      as.character(as_latex(gt_tbl))
    Output
      [1] "\\begingroup\n\\fontsize{12.0pt}{14.0pt}\\selectfont\n\\setlength{\\LTpost}{0mm}\n\\begin{longtable}{rlcrrrrll}\n\\caption*{\n{\\fontsize{20}{25}\\selectfont  Data listing from \\textbf{exibble}\\fontsize{12}{15}\\selectfont } \\\\ \n{\\fontsize{14}{17}\\selectfont  \\texttt{exibble} is an R dataset\\fontsize{12}{15}\\selectfont }\n} \\\\ \n\\toprule\n &  &  & \\multicolumn{3}{c}{timing} &  &  &  \\\\ \n\\cmidrule(lr){4-6}\nnum & char & fctr & date & time & datetime & currency & row & group \\\\ \n\\midrule\\addlinespace[2.5pt]\n1.111e-01 & apricot & one & 2015-01-15 & 13:35 & 2018-01-01 02:22 & 49.950 & row\\_1 & grp\\_a \\\\ \n2.222e+00 & banana & two & 2015-02-15 & 14:40 & 2018-02-02 14:33 & 17.950 & row\\_2 & grp\\_a \\\\ \n3.333e+01 & coconut & three & 2015-03-15 & 15:45 & 2018-03-03 03:44 & 1.390 & row\\_3 & grp\\_a \\\\ \n4.444e+02 & durian & four & 2015-04-15 & 16:50 & 2018-04-04 15:55 & 65100.000 & row\\_4 & grp\\_a \\\\ \n5.550e+03 & NA & five & 2015-05-15 & 17:55 & 2018-05-05 04:00 & 1325.810 & row\\_5 & grp\\_b \\\\ \nNA & fig & six & 2015-06-15 & NA & 2018-06-06 16:11 & 13.255 & row\\_6 & grp\\_b \\\\ \n7.770e+05 & grapefruit & seven & NA & 19:10 & 2018-07-07 05:22 & NA & row\\_7 & grp\\_b \\\\ \n8.880e+06 & honeydew & eight & 2015-08-15 & 20:20 & NA & 0.440 & row\\_8 & grp\\_b \\\\ \n\\bottomrule\n\\end{longtable}\n\\begin{minipage}{\\linewidth}\n\\vspace{.05em}\nSource note \\#1\\\\\nSource note \\#2\\\\\n\\end{minipage}\n\\endgroup\n"

---

    Code
      as_rtf(gt_tbl)
    Output
      {\rtf\ansi\ansicpg1252{\fonttbl{\f0\froman\fcharset0\fprq0 Courier New;}{\f1\froman\fcharset0\fprq0 Times;}}{\colortbl;\red51\green51\blue51;\red211\green211\blue211;}
      
      \paperw12240\paperh15840\widowctrl\ftnbj\fet0\sectd\linex0
      \lndscpsxn
      \margl1440\margr1440\margt1440\margb1440
      \headery720\footery720\fs20
      
      \trowd\trrh0\trhdr
      
      \pard\plain\uc0\qc\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx9360
      \intbl {\f0\cf1 {\f0\fs20 Data listing from {\b exibble}} {\f0\fs20\i\super } \line {\f0\fs20 {\f1 exibble} is an R dataset} {\f0\fs20\i\super }}\cell
      
      \row
      
      \trowd\trrh0\trhdr
      
      \pard\plain\uc0\qc\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx1040
      \intbl {\f0 {\f0\fs20 }}\cell
      
      \pard\plain\uc0\qc\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx2080
      \intbl {\f0 {\f0\fs20 }}\cell
      
      \pard\plain\uc0\qc\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx3120
      \intbl {\f0 {\f0\fs20 }}\cell
      
      \pard\plain\uc0\qc\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85\clbrdrb\brdrs\brdrw20\brdrcf2\clmgf \cellx4160
      \intbl {\f0 {\f0\fs20 timing}}\cell
      
      \pard\plain\uc0\qc\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85\clmrg \cellx5200
      \intbl {\f0 {\f0\fs20 }}\cell
      
      \pard\plain\uc0\qc\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85\clmrg \cellx6240
      \intbl {\f0 {\f0\fs20 }}\cell
      
      \pard\plain\uc0\qc\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx7280
      \intbl {\f0 {\f0\fs20 }}\cell
      
      \pard\plain\uc0\qc\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx8320
      \intbl {\f0 {\f0\fs20 }}\cell
      
      \pard\plain\uc0\qc\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx9360
      \intbl {\f0 {\f0\fs20 }}\cell
      
      \row
      
      \trowd\trrh0\trhdr
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85\clbrdrb\brdrs\brdrw20\brdrcf2 \cellx1040
      \intbl {\f0 {\f0\fs20 num}}\cell
      
      \pard\plain\uc0\ql\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85\clbrdrb\brdrs\brdrw20\brdrcf2 \cellx2080
      \intbl {\f0 {\f0\fs20 char}}\cell
      
      \pard\plain\uc0\qc\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85\clbrdrb\brdrs\brdrw20\brdrcf2 \cellx3120
      \intbl {\f0 {\f0\fs20 fctr}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85\clbrdrb\brdrs\brdrw20\brdrcf2 \cellx4160
      \intbl {\f0 {\f0\fs20 date}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85\clbrdrb\brdrs\brdrw20\brdrcf2 \cellx5200
      \intbl {\f0 {\f0\fs20 time}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85\clbrdrb\brdrs\brdrw20\brdrcf2 \cellx6240
      \intbl {\f0 {\f0\fs20 datetime}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85\clbrdrb\brdrs\brdrw20\brdrcf2 \cellx7280
      \intbl {\f0 {\f0\fs20 currency}}\cell
      
      \pard\plain\uc0\ql\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85\clbrdrb\brdrs\brdrw20\brdrcf2 \cellx8320
      \intbl {\f0 {\f0\fs20 row}}\cell
      
      \pard\plain\uc0\ql\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85\clbrdrb\brdrs\brdrw20\brdrcf2 \cellx9360
      \intbl {\f0 {\f0\fs20 group}}\cell
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx1040
      \intbl {\f0 {\f0\fs20 1.111e-01}}\cell
      
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
      \intbl {\f0 {\f0\fs20 49.950}}\cell
      
      \pard\plain\uc0\ql\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx8320
      \intbl {\f0 {\f0\fs20 row_1}}\cell
      
      \pard\plain\uc0\ql\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx9360
      \intbl {\f0 {\f0\fs20 grp_a}}\cell
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx1040
      \intbl {\f0 {\f0\fs20 2.222e+00}}\cell
      
      \pard\plain\uc0\ql\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx2080
      \intbl {\f0 {\f0\fs20 banana}}\cell
      
      \pard\plain\uc0\qc\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx3120
      \intbl {\f0 {\f0\fs20 two}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx4160
      \intbl {\f0 {\f0\fs20 2015-02-15}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx5200
      \intbl {\f0 {\f0\fs20 14:40}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx6240
      \intbl {\f0 {\f0\fs20 2018-02-02 14:33}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx7280
      \intbl {\f0 {\f0\fs20 17.950}}\cell
      
      \pard\plain\uc0\ql\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx8320
      \intbl {\f0 {\f0\fs20 row_2}}\cell
      
      \pard\plain\uc0\ql\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx9360
      \intbl {\f0 {\f0\fs20 grp_a}}\cell
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx1040
      \intbl {\f0 {\f0\fs20 3.333e+01}}\cell
      
      \pard\plain\uc0\ql\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx2080
      \intbl {\f0 {\f0\fs20 coconut}}\cell
      
      \pard\plain\uc0\qc\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx3120
      \intbl {\f0 {\f0\fs20 three}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx4160
      \intbl {\f0 {\f0\fs20 2015-03-15}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx5200
      \intbl {\f0 {\f0\fs20 15:45}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx6240
      \intbl {\f0 {\f0\fs20 2018-03-03 03:44}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx7280
      \intbl {\f0 {\f0\fs20 1.390}}\cell
      
      \pard\plain\uc0\ql\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx8320
      \intbl {\f0 {\f0\fs20 row_3}}\cell
      
      \pard\plain\uc0\ql\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx9360
      \intbl {\f0 {\f0\fs20 grp_a}}\cell
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx1040
      \intbl {\f0 {\f0\fs20 4.444e+02}}\cell
      
      \pard\plain\uc0\ql\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx2080
      \intbl {\f0 {\f0\fs20 durian}}\cell
      
      \pard\plain\uc0\qc\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx3120
      \intbl {\f0 {\f0\fs20 four}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx4160
      \intbl {\f0 {\f0\fs20 2015-04-15}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx5200
      \intbl {\f0 {\f0\fs20 16:50}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx6240
      \intbl {\f0 {\f0\fs20 2018-04-04 15:55}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx7280
      \intbl {\f0 {\f0\fs20 65100.000}}\cell
      
      \pard\plain\uc0\ql\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx8320
      \intbl {\f0 {\f0\fs20 row_4}}\cell
      
      \pard\plain\uc0\ql\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx9360
      \intbl {\f0 {\f0\fs20 grp_a}}\cell
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx1040
      \intbl {\f0 {\f0\fs20 5.550e+03}}\cell
      
      \pard\plain\uc0\ql\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx2080
      \intbl {\f0 {\f0\fs20 NA}}\cell
      
      \pard\plain\uc0\qc\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx3120
      \intbl {\f0 {\f0\fs20 five}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx4160
      \intbl {\f0 {\f0\fs20 2015-05-15}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx5200
      \intbl {\f0 {\f0\fs20 17:55}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx6240
      \intbl {\f0 {\f0\fs20 2018-05-05 04:00}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx7280
      \intbl {\f0 {\f0\fs20 1325.810}}\cell
      
      \pard\plain\uc0\ql\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx8320
      \intbl {\f0 {\f0\fs20 row_5}}\cell
      
      \pard\plain\uc0\ql\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx9360
      \intbl {\f0 {\f0\fs20 grp_b}}\cell
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx1040
      \intbl {\f0 {\f0\fs20 NA}}\cell
      
      \pard\plain\uc0\ql\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx2080
      \intbl {\f0 {\f0\fs20 fig}}\cell
      
      \pard\plain\uc0\qc\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx3120
      \intbl {\f0 {\f0\fs20 six}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx4160
      \intbl {\f0 {\f0\fs20 2015-06-15}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx5200
      \intbl {\f0 {\f0\fs20 NA}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx6240
      \intbl {\f0 {\f0\fs20 2018-06-06 16:11}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx7280
      \intbl {\f0 {\f0\fs20 13.255}}\cell
      
      \pard\plain\uc0\ql\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx8320
      \intbl {\f0 {\f0\fs20 row_6}}\cell
      
      \pard\plain\uc0\ql\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx9360
      \intbl {\f0 {\f0\fs20 grp_b}}\cell
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx1040
      \intbl {\f0 {\f0\fs20 7.770e+05}}\cell
      
      \pard\plain\uc0\ql\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx2080
      \intbl {\f0 {\f0\fs20 grapefruit}}\cell
      
      \pard\plain\uc0\qc\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx3120
      \intbl {\f0 {\f0\fs20 seven}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx4160
      \intbl {\f0 {\f0\fs20 NA}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx5200
      \intbl {\f0 {\f0\fs20 19:10}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx6240
      \intbl {\f0 {\f0\fs20 2018-07-07 05:22}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx7280
      \intbl {\f0 {\f0\fs20 NA}}\cell
      
      \pard\plain\uc0\ql\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx8320
      \intbl {\f0 {\f0\fs20 row_7}}\cell
      
      \pard\plain\uc0\ql\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx9360
      \intbl {\f0 {\f0\fs20 grp_b}}\cell
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx1040
      \intbl {\f0 {\f0\fs20 8.880e+06}}\cell
      
      \pard\plain\uc0\ql\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx2080
      \intbl {\f0 {\f0\fs20 honeydew}}\cell
      
      \pard\plain\uc0\qc\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx3120
      \intbl {\f0 {\f0\fs20 eight}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx4160
      \intbl {\f0 {\f0\fs20 2015-08-15}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx5200
      \intbl {\f0 {\f0\fs20 20:20}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx6240
      \intbl {\f0 {\f0\fs20 NA}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx7280
      \intbl {\f0 {\f0\fs20 0.440}}\cell
      
      \pard\plain\uc0\ql\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx8320
      \intbl {\f0 {\f0\fs20 row_8}}\cell
      
      \pard\plain\uc0\ql\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx9360
      \intbl {\f0 {\f0\fs20 grp_b}}\cell
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\ql\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx9360
      \intbl {\f0 {\f0\fs20 Source note #1\line Source note #2}}\cell
      
      \row
      
      }

---

    Code
      cat(render_as_html(gt_tbl))
    Output
      <table class="gt_table" data-quarto-disable-processing="false" data-quarto-bootstrap="false">
        <thead>
          <tr class="gt_heading">
            <td colspan="9" class="gt_heading gt_title gt_font_normal" style><span class='gt_from_md'>Data listing from <strong>exibble</strong></span></td>
          </tr>
          <tr class="gt_heading">
            <td colspan="9" class="gt_heading gt_subtitle gt_font_normal gt_bottom_border" style><span class='gt_from_md'><code>exibble</code> is an R dataset</span></td>
          </tr>
          <tr class="gt_col_headings gt_spanner_row">
            <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="2" colspan="1" scope="col" id="num">num</th>
            <th class="gt_col_heading gt_columns_bottom_border gt_left" rowspan="2" colspan="1" scope="col" id="char">char</th>
            <th class="gt_col_heading gt_columns_bottom_border gt_center" rowspan="2" colspan="1" scope="col" id="fctr">fctr</th>
            <th class="gt_center gt_columns_top_border gt_column_spanner_outer" rowspan="1" colspan="3" scope="colgroup" id="timing">
              <div class="gt_column_spanner">timing</div>
            </th>
            <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="2" colspan="1" scope="col" id="currency">currency</th>
            <th class="gt_col_heading gt_columns_bottom_border gt_left" rowspan="2" colspan="1" scope="col" id="row">row</th>
            <th class="gt_col_heading gt_columns_bottom_border gt_left" rowspan="2" colspan="1" scope="col" id="group">group</th>
          </tr>
          <tr class="gt_col_headings">
            <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id="date">date</th>
            <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id="time">time</th>
            <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id="datetime">datetime</th>
          </tr>
        </thead>
        <tbody class="gt_table_body">
          <tr><td headers="num" class="gt_row gt_right">1.111e-01</td>
      <td headers="char" class="gt_row gt_left">apricot</td>
      <td headers="fctr" class="gt_row gt_center">one</td>
      <td headers="date" class="gt_row gt_right">2015-01-15</td>
      <td headers="time" class="gt_row gt_right">13:35</td>
      <td headers="datetime" class="gt_row gt_right">2018-01-01 02:22</td>
      <td headers="currency" class="gt_row gt_right">49.950</td>
      <td headers="row" class="gt_row gt_left">row_1</td>
      <td headers="group" class="gt_row gt_left">grp_a</td></tr>
          <tr><td headers="num" class="gt_row gt_right">2.222e+00</td>
      <td headers="char" class="gt_row gt_left">banana</td>
      <td headers="fctr" class="gt_row gt_center">two</td>
      <td headers="date" class="gt_row gt_right">2015-02-15</td>
      <td headers="time" class="gt_row gt_right">14:40</td>
      <td headers="datetime" class="gt_row gt_right">2018-02-02 14:33</td>
      <td headers="currency" class="gt_row gt_right">17.950</td>
      <td headers="row" class="gt_row gt_left">row_2</td>
      <td headers="group" class="gt_row gt_left">grp_a</td></tr>
          <tr><td headers="num" class="gt_row gt_right">3.333e+01</td>
      <td headers="char" class="gt_row gt_left">coconut</td>
      <td headers="fctr" class="gt_row gt_center">three</td>
      <td headers="date" class="gt_row gt_right">2015-03-15</td>
      <td headers="time" class="gt_row gt_right">15:45</td>
      <td headers="datetime" class="gt_row gt_right">2018-03-03 03:44</td>
      <td headers="currency" class="gt_row gt_right">1.390</td>
      <td headers="row" class="gt_row gt_left">row_3</td>
      <td headers="group" class="gt_row gt_left">grp_a</td></tr>
          <tr><td headers="num" class="gt_row gt_right">4.444e+02</td>
      <td headers="char" class="gt_row gt_left">durian</td>
      <td headers="fctr" class="gt_row gt_center">four</td>
      <td headers="date" class="gt_row gt_right">2015-04-15</td>
      <td headers="time" class="gt_row gt_right">16:50</td>
      <td headers="datetime" class="gt_row gt_right">2018-04-04 15:55</td>
      <td headers="currency" class="gt_row gt_right">65100.000</td>
      <td headers="row" class="gt_row gt_left">row_4</td>
      <td headers="group" class="gt_row gt_left">grp_a</td></tr>
          <tr><td headers="num" class="gt_row gt_right">5.550e+03</td>
      <td headers="char" class="gt_row gt_left">NA</td>
      <td headers="fctr" class="gt_row gt_center">five</td>
      <td headers="date" class="gt_row gt_right">2015-05-15</td>
      <td headers="time" class="gt_row gt_right">17:55</td>
      <td headers="datetime" class="gt_row gt_right">2018-05-05 04:00</td>
      <td headers="currency" class="gt_row gt_right">1325.810</td>
      <td headers="row" class="gt_row gt_left">row_5</td>
      <td headers="group" class="gt_row gt_left">grp_b</td></tr>
          <tr><td headers="num" class="gt_row gt_right">NA</td>
      <td headers="char" class="gt_row gt_left">fig</td>
      <td headers="fctr" class="gt_row gt_center">six</td>
      <td headers="date" class="gt_row gt_right">2015-06-15</td>
      <td headers="time" class="gt_row gt_right">NA</td>
      <td headers="datetime" class="gt_row gt_right">2018-06-06 16:11</td>
      <td headers="currency" class="gt_row gt_right">13.255</td>
      <td headers="row" class="gt_row gt_left">row_6</td>
      <td headers="group" class="gt_row gt_left">grp_b</td></tr>
          <tr><td headers="num" class="gt_row gt_right">7.770e+05</td>
      <td headers="char" class="gt_row gt_left">grapefruit</td>
      <td headers="fctr" class="gt_row gt_center">seven</td>
      <td headers="date" class="gt_row gt_right">NA</td>
      <td headers="time" class="gt_row gt_right">19:10</td>
      <td headers="datetime" class="gt_row gt_right">2018-07-07 05:22</td>
      <td headers="currency" class="gt_row gt_right">NA</td>
      <td headers="row" class="gt_row gt_left">row_7</td>
      <td headers="group" class="gt_row gt_left">grp_b</td></tr>
          <tr><td headers="num" class="gt_row gt_right">8.880e+06</td>
      <td headers="char" class="gt_row gt_left">honeydew</td>
      <td headers="fctr" class="gt_row gt_center">eight</td>
      <td headers="date" class="gt_row gt_right">2015-08-15</td>
      <td headers="time" class="gt_row gt_right">20:20</td>
      <td headers="datetime" class="gt_row gt_right">NA</td>
      <td headers="currency" class="gt_row gt_right">0.440</td>
      <td headers="row" class="gt_row gt_left">row_8</td>
      <td headers="group" class="gt_row gt_left">grp_b</td></tr>
        </tbody>
        <tfoot>
          <tr class="gt_sourcenotes">
            <td class="gt_sourcenote" colspan="9">Source note #1</td>
          </tr>
          <tr class="gt_sourcenotes">
            <td class="gt_sourcenote" colspan="9">Source note #2</td>
          </tr>
        </tfoot>
      </table>

---

    Code
      as.character(as_latex(gt_tbl))
    Output
      [1] "\\begingroup\n\\fontsize{12.0pt}{14.0pt}\\selectfont\n\\setlength{\\LTpost}{0mm}\n\\begin{longtable}{rlcrrrrll}\n\\caption*{\n{\\fontsize{20}{25}\\selectfont  Data listing from \\textbf{exibble}\\fontsize{12}{15}\\selectfont } \\\\ \n{\\fontsize{14}{17}\\selectfont  \\texttt{exibble} is an R dataset\\fontsize{12}{15}\\selectfont }\n} \\\\ \n\\toprule\n &  &  & \\multicolumn{3}{c}{timing} &  &  &  \\\\ \n\\cmidrule(lr){4-6}\nnum & char & fctr & date & time & datetime & currency & row & group \\\\ \n\\midrule\\addlinespace[2.5pt]\n1.111e-01 & apricot & one & 2015-01-15 & 13:35 & 2018-01-01 02:22 & 49.950 & row\\_1 & grp\\_a \\\\ \n2.222e+00 & banana & two & 2015-02-15 & 14:40 & 2018-02-02 14:33 & 17.950 & row\\_2 & grp\\_a \\\\ \n3.333e+01 & coconut & three & 2015-03-15 & 15:45 & 2018-03-03 03:44 & 1.390 & row\\_3 & grp\\_a \\\\ \n4.444e+02 & durian & four & 2015-04-15 & 16:50 & 2018-04-04 15:55 & 65100.000 & row\\_4 & grp\\_a \\\\ \n5.550e+03 & NA & five & 2015-05-15 & 17:55 & 2018-05-05 04:00 & 1325.810 & row\\_5 & grp\\_b \\\\ \nNA & fig & six & 2015-06-15 & NA & 2018-06-06 16:11 & 13.255 & row\\_6 & grp\\_b \\\\ \n7.770e+05 & grapefruit & seven & NA & 19:10 & 2018-07-07 05:22 & NA & row\\_7 & grp\\_b \\\\ \n8.880e+06 & honeydew & eight & 2015-08-15 & 20:20 & NA & 0.440 & row\\_8 & grp\\_b \\\\ \n\\bottomrule\n\\end{longtable}\n\\begin{minipage}{\\linewidth}\n\\vspace{.05em}\nSource note \\#1\\\\\nSource note \\#2\\\\\n\\end{minipage}\n\\endgroup\n"

---

    Code
      as_rtf(gt_tbl)
    Output
      {\rtf\ansi\ansicpg1252{\fonttbl{\f0\froman\fcharset0\fprq0 Courier New;}{\f1\froman\fcharset0\fprq0 Times;}}{\colortbl;\red51\green51\blue51;\red211\green211\blue211;}
      
      \paperw12240\paperh15840\widowctrl\ftnbj\fet0\sectd\linex0
      \lndscpsxn
      \margl1440\margr1440\margt1440\margb1440
      \headery720\footery720\fs20
      
      \trowd\trrh0\trhdr
      
      \pard\plain\uc0\qc\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx9360
      \intbl {\f0\cf1 {\f0\fs20 Data listing from {\b exibble}} {\f0\fs20\i\super } \line {\f0\fs20 {\f1 exibble} is an R dataset} {\f0\fs20\i\super }}\cell
      
      \row
      
      \trowd\trrh0\trhdr
      
      \pard\plain\uc0\qc\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx1040
      \intbl {\f0 {\f0\fs20 }}\cell
      
      \pard\plain\uc0\qc\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx2080
      \intbl {\f0 {\f0\fs20 }}\cell
      
      \pard\plain\uc0\qc\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx3120
      \intbl {\f0 {\f0\fs20 }}\cell
      
      \pard\plain\uc0\qc\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85\clbrdrb\brdrs\brdrw20\brdrcf2\clmgf \cellx4160
      \intbl {\f0 {\f0\fs20 timing}}\cell
      
      \pard\plain\uc0\qc\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85\clmrg \cellx5200
      \intbl {\f0 {\f0\fs20 }}\cell
      
      \pard\plain\uc0\qc\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85\clmrg \cellx6240
      \intbl {\f0 {\f0\fs20 }}\cell
      
      \pard\plain\uc0\qc\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx7280
      \intbl {\f0 {\f0\fs20 }}\cell
      
      \pard\plain\uc0\qc\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx8320
      \intbl {\f0 {\f0\fs20 }}\cell
      
      \pard\plain\uc0\qc\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx9360
      \intbl {\f0 {\f0\fs20 }}\cell
      
      \row
      
      \trowd\trrh0\trhdr
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85\clbrdrb\brdrs\brdrw20\brdrcf2 \cellx1040
      \intbl {\f0 {\f0\fs20 num}}\cell
      
      \pard\plain\uc0\ql\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85\clbrdrb\brdrs\brdrw20\brdrcf2 \cellx2080
      \intbl {\f0 {\f0\fs20 char}}\cell
      
      \pard\plain\uc0\qc\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85\clbrdrb\brdrs\brdrw20\brdrcf2 \cellx3120
      \intbl {\f0 {\f0\fs20 fctr}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85\clbrdrb\brdrs\brdrw20\brdrcf2 \cellx4160
      \intbl {\f0 {\f0\fs20 date}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85\clbrdrb\brdrs\brdrw20\brdrcf2 \cellx5200
      \intbl {\f0 {\f0\fs20 time}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85\clbrdrb\brdrs\brdrw20\brdrcf2 \cellx6240
      \intbl {\f0 {\f0\fs20 datetime}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85\clbrdrb\brdrs\brdrw20\brdrcf2 \cellx7280
      \intbl {\f0 {\f0\fs20 currency}}\cell
      
      \pard\plain\uc0\ql\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85\clbrdrb\brdrs\brdrw20\brdrcf2 \cellx8320
      \intbl {\f0 {\f0\fs20 row}}\cell
      
      \pard\plain\uc0\ql\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85\clbrdrb\brdrs\brdrw20\brdrcf2 \cellx9360
      \intbl {\f0 {\f0\fs20 group}}\cell
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx1040
      \intbl {\f0 {\f0\fs20 1.111e-01}}\cell
      
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
      \intbl {\f0 {\f0\fs20 49.950}}\cell
      
      \pard\plain\uc0\ql\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx8320
      \intbl {\f0 {\f0\fs20 row_1}}\cell
      
      \pard\plain\uc0\ql\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx9360
      \intbl {\f0 {\f0\fs20 grp_a}}\cell
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx1040
      \intbl {\f0 {\f0\fs20 2.222e+00}}\cell
      
      \pard\plain\uc0\ql\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx2080
      \intbl {\f0 {\f0\fs20 banana}}\cell
      
      \pard\plain\uc0\qc\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx3120
      \intbl {\f0 {\f0\fs20 two}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx4160
      \intbl {\f0 {\f0\fs20 2015-02-15}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx5200
      \intbl {\f0 {\f0\fs20 14:40}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx6240
      \intbl {\f0 {\f0\fs20 2018-02-02 14:33}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx7280
      \intbl {\f0 {\f0\fs20 17.950}}\cell
      
      \pard\plain\uc0\ql\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx8320
      \intbl {\f0 {\f0\fs20 row_2}}\cell
      
      \pard\plain\uc0\ql\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx9360
      \intbl {\f0 {\f0\fs20 grp_a}}\cell
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx1040
      \intbl {\f0 {\f0\fs20 3.333e+01}}\cell
      
      \pard\plain\uc0\ql\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx2080
      \intbl {\f0 {\f0\fs20 coconut}}\cell
      
      \pard\plain\uc0\qc\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx3120
      \intbl {\f0 {\f0\fs20 three}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx4160
      \intbl {\f0 {\f0\fs20 2015-03-15}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx5200
      \intbl {\f0 {\f0\fs20 15:45}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx6240
      \intbl {\f0 {\f0\fs20 2018-03-03 03:44}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx7280
      \intbl {\f0 {\f0\fs20 1.390}}\cell
      
      \pard\plain\uc0\ql\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx8320
      \intbl {\f0 {\f0\fs20 row_3}}\cell
      
      \pard\plain\uc0\ql\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx9360
      \intbl {\f0 {\f0\fs20 grp_a}}\cell
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx1040
      \intbl {\f0 {\f0\fs20 4.444e+02}}\cell
      
      \pard\plain\uc0\ql\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx2080
      \intbl {\f0 {\f0\fs20 durian}}\cell
      
      \pard\plain\uc0\qc\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx3120
      \intbl {\f0 {\f0\fs20 four}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx4160
      \intbl {\f0 {\f0\fs20 2015-04-15}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx5200
      \intbl {\f0 {\f0\fs20 16:50}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx6240
      \intbl {\f0 {\f0\fs20 2018-04-04 15:55}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx7280
      \intbl {\f0 {\f0\fs20 65100.000}}\cell
      
      \pard\plain\uc0\ql\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx8320
      \intbl {\f0 {\f0\fs20 row_4}}\cell
      
      \pard\plain\uc0\ql\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx9360
      \intbl {\f0 {\f0\fs20 grp_a}}\cell
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx1040
      \intbl {\f0 {\f0\fs20 5.550e+03}}\cell
      
      \pard\plain\uc0\ql\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx2080
      \intbl {\f0 {\f0\fs20 NA}}\cell
      
      \pard\plain\uc0\qc\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx3120
      \intbl {\f0 {\f0\fs20 five}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx4160
      \intbl {\f0 {\f0\fs20 2015-05-15}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx5200
      \intbl {\f0 {\f0\fs20 17:55}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx6240
      \intbl {\f0 {\f0\fs20 2018-05-05 04:00}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx7280
      \intbl {\f0 {\f0\fs20 1325.810}}\cell
      
      \pard\plain\uc0\ql\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx8320
      \intbl {\f0 {\f0\fs20 row_5}}\cell
      
      \pard\plain\uc0\ql\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx9360
      \intbl {\f0 {\f0\fs20 grp_b}}\cell
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx1040
      \intbl {\f0 {\f0\fs20 NA}}\cell
      
      \pard\plain\uc0\ql\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx2080
      \intbl {\f0 {\f0\fs20 fig}}\cell
      
      \pard\plain\uc0\qc\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx3120
      \intbl {\f0 {\f0\fs20 six}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx4160
      \intbl {\f0 {\f0\fs20 2015-06-15}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx5200
      \intbl {\f0 {\f0\fs20 NA}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx6240
      \intbl {\f0 {\f0\fs20 2018-06-06 16:11}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx7280
      \intbl {\f0 {\f0\fs20 13.255}}\cell
      
      \pard\plain\uc0\ql\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx8320
      \intbl {\f0 {\f0\fs20 row_6}}\cell
      
      \pard\plain\uc0\ql\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx9360
      \intbl {\f0 {\f0\fs20 grp_b}}\cell
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx1040
      \intbl {\f0 {\f0\fs20 7.770e+05}}\cell
      
      \pard\plain\uc0\ql\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx2080
      \intbl {\f0 {\f0\fs20 grapefruit}}\cell
      
      \pard\plain\uc0\qc\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx3120
      \intbl {\f0 {\f0\fs20 seven}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx4160
      \intbl {\f0 {\f0\fs20 NA}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx5200
      \intbl {\f0 {\f0\fs20 19:10}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx6240
      \intbl {\f0 {\f0\fs20 2018-07-07 05:22}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx7280
      \intbl {\f0 {\f0\fs20 NA}}\cell
      
      \pard\plain\uc0\ql\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx8320
      \intbl {\f0 {\f0\fs20 row_7}}\cell
      
      \pard\plain\uc0\ql\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx9360
      \intbl {\f0 {\f0\fs20 grp_b}}\cell
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx1040
      \intbl {\f0 {\f0\fs20 8.880e+06}}\cell
      
      \pard\plain\uc0\ql\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx2080
      \intbl {\f0 {\f0\fs20 honeydew}}\cell
      
      \pard\plain\uc0\qc\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx3120
      \intbl {\f0 {\f0\fs20 eight}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx4160
      \intbl {\f0 {\f0\fs20 2015-08-15}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx5200
      \intbl {\f0 {\f0\fs20 20:20}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx6240
      \intbl {\f0 {\f0\fs20 NA}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx7280
      \intbl {\f0 {\f0\fs20 0.440}}\cell
      
      \pard\plain\uc0\ql\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx8320
      \intbl {\f0 {\f0\fs20 row_8}}\cell
      
      \pard\plain\uc0\ql\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx9360
      \intbl {\f0 {\f0\fs20 grp_b}}\cell
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\ql\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx9360
      \intbl {\f0 {\f0\fs20 Source note #1\line Source note #2}}\cell
      
      \row
      
      }

---

    Code
      cat(render_as_html(gt_tbl))
    Output
      <table class="gt_table" data-quarto-disable-processing="false" data-quarto-bootstrap="false">
        <thead>
          <tr class="gt_heading">
            <td colspan="8" class="gt_heading gt_title gt_font_normal" style><span class='gt_from_md'>Data listing from <strong>exibble</strong></span></td>
          </tr>
          <tr class="gt_heading">
            <td colspan="8" class="gt_heading gt_subtitle gt_font_normal gt_bottom_border" style><span class='gt_from_md'><code>exibble</code> is an R dataset</span></td>
          </tr>
          <tr class="gt_col_headings gt_spanner_row">
            <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="2" colspan="1" scope="col" id="num">num</th>
            <th class="gt_col_heading gt_columns_bottom_border gt_left" rowspan="2" colspan="1" scope="col" id="char">char</th>
            <th class="gt_col_heading gt_columns_bottom_border gt_center" rowspan="2" colspan="1" scope="col" id="fctr">fctr</th>
            <th class="gt_center gt_columns_top_border gt_column_spanner_outer" rowspan="1" colspan="3" scope="colgroup" id="timing">
              <div class="gt_column_spanner">timing</div>
            </th>
            <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="2" colspan="1" scope="col" id="currency">currency</th>
            <th class="gt_col_heading gt_columns_bottom_border gt_left" rowspan="2" colspan="1" scope="col" id="row">row</th>
          </tr>
          <tr class="gt_col_headings">
            <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id="date">date</th>
            <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id="time">time</th>
            <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id="datetime">datetime</th>
          </tr>
        </thead>
        <tbody class="gt_table_body">
          <tr class="gt_group_heading_row">
            <th colspan="8" class="gt_group_heading" scope="colgroup" id="grp_a">grp_a</th>
          </tr>
          <tr class="gt_row_group_first"><td headers="grp_a  num" class="gt_row gt_right">1.111e-01</td>
      <td headers="grp_a  char" class="gt_row gt_left">apricot</td>
      <td headers="grp_a  fctr" class="gt_row gt_center">one</td>
      <td headers="grp_a  date" class="gt_row gt_right">2015-01-15</td>
      <td headers="grp_a  time" class="gt_row gt_right">13:35</td>
      <td headers="grp_a  datetime" class="gt_row gt_right">2018-01-01 02:22</td>
      <td headers="grp_a  currency" class="gt_row gt_right">49.950</td>
      <td headers="grp_a  row" class="gt_row gt_left">row_1</td></tr>
          <tr><td headers="grp_a  num" class="gt_row gt_right">2.222e+00</td>
      <td headers="grp_a  char" class="gt_row gt_left">banana</td>
      <td headers="grp_a  fctr" class="gt_row gt_center">two</td>
      <td headers="grp_a  date" class="gt_row gt_right">2015-02-15</td>
      <td headers="grp_a  time" class="gt_row gt_right">14:40</td>
      <td headers="grp_a  datetime" class="gt_row gt_right">2018-02-02 14:33</td>
      <td headers="grp_a  currency" class="gt_row gt_right">17.950</td>
      <td headers="grp_a  row" class="gt_row gt_left">row_2</td></tr>
          <tr><td headers="grp_a  num" class="gt_row gt_right">3.333e+01</td>
      <td headers="grp_a  char" class="gt_row gt_left">coconut</td>
      <td headers="grp_a  fctr" class="gt_row gt_center">three</td>
      <td headers="grp_a  date" class="gt_row gt_right">2015-03-15</td>
      <td headers="grp_a  time" class="gt_row gt_right">15:45</td>
      <td headers="grp_a  datetime" class="gt_row gt_right">2018-03-03 03:44</td>
      <td headers="grp_a  currency" class="gt_row gt_right">1.390</td>
      <td headers="grp_a  row" class="gt_row gt_left">row_3</td></tr>
          <tr><td headers="grp_a  num" class="gt_row gt_right">4.444e+02</td>
      <td headers="grp_a  char" class="gt_row gt_left">durian</td>
      <td headers="grp_a  fctr" class="gt_row gt_center">four</td>
      <td headers="grp_a  date" class="gt_row gt_right">2015-04-15</td>
      <td headers="grp_a  time" class="gt_row gt_right">16:50</td>
      <td headers="grp_a  datetime" class="gt_row gt_right">2018-04-04 15:55</td>
      <td headers="grp_a  currency" class="gt_row gt_right">65100.000</td>
      <td headers="grp_a  row" class="gt_row gt_left">row_4</td></tr>
          <tr class="gt_group_heading_row">
            <th colspan="8" class="gt_group_heading" scope="colgroup" id="grp_b">grp_b</th>
          </tr>
          <tr class="gt_row_group_first"><td headers="grp_b  num" class="gt_row gt_right">5.550e+03</td>
      <td headers="grp_b  char" class="gt_row gt_left">NA</td>
      <td headers="grp_b  fctr" class="gt_row gt_center">five</td>
      <td headers="grp_b  date" class="gt_row gt_right">2015-05-15</td>
      <td headers="grp_b  time" class="gt_row gt_right">17:55</td>
      <td headers="grp_b  datetime" class="gt_row gt_right">2018-05-05 04:00</td>
      <td headers="grp_b  currency" class="gt_row gt_right">1325.810</td>
      <td headers="grp_b  row" class="gt_row gt_left">row_5</td></tr>
          <tr><td headers="grp_b  num" class="gt_row gt_right">NA</td>
      <td headers="grp_b  char" class="gt_row gt_left">fig</td>
      <td headers="grp_b  fctr" class="gt_row gt_center">six</td>
      <td headers="grp_b  date" class="gt_row gt_right">2015-06-15</td>
      <td headers="grp_b  time" class="gt_row gt_right">NA</td>
      <td headers="grp_b  datetime" class="gt_row gt_right">2018-06-06 16:11</td>
      <td headers="grp_b  currency" class="gt_row gt_right">13.255</td>
      <td headers="grp_b  row" class="gt_row gt_left">row_6</td></tr>
          <tr><td headers="grp_b  num" class="gt_row gt_right">7.770e+05</td>
      <td headers="grp_b  char" class="gt_row gt_left">grapefruit</td>
      <td headers="grp_b  fctr" class="gt_row gt_center">seven</td>
      <td headers="grp_b  date" class="gt_row gt_right">NA</td>
      <td headers="grp_b  time" class="gt_row gt_right">19:10</td>
      <td headers="grp_b  datetime" class="gt_row gt_right">2018-07-07 05:22</td>
      <td headers="grp_b  currency" class="gt_row gt_right">NA</td>
      <td headers="grp_b  row" class="gt_row gt_left">row_7</td></tr>
          <tr><td headers="grp_b  num" class="gt_row gt_right">8.880e+06</td>
      <td headers="grp_b  char" class="gt_row gt_left">honeydew</td>
      <td headers="grp_b  fctr" class="gt_row gt_center">eight</td>
      <td headers="grp_b  date" class="gt_row gt_right">2015-08-15</td>
      <td headers="grp_b  time" class="gt_row gt_right">20:20</td>
      <td headers="grp_b  datetime" class="gt_row gt_right">NA</td>
      <td headers="grp_b  currency" class="gt_row gt_right">0.440</td>
      <td headers="grp_b  row" class="gt_row gt_left">row_8</td></tr>
        </tbody>
        <tfoot>
          <tr class="gt_sourcenotes">
            <td class="gt_sourcenote" colspan="8">Source note #1</td>
          </tr>
          <tr class="gt_sourcenotes">
            <td class="gt_sourcenote" colspan="8">Source note #2</td>
          </tr>
        </tfoot>
      </table>

---

    Code
      as.character(as_latex(gt_tbl))
    Output
      [1] "\\begingroup\n\\fontsize{12.0pt}{14.0pt}\\selectfont\n\\setlength{\\LTpost}{0mm}\n\\begin{longtable}{rlcrrrrl}\n\\caption*{\n{\\fontsize{20}{25}\\selectfont  Data listing from \\textbf{exibble}\\fontsize{12}{15}\\selectfont } \\\\ \n{\\fontsize{14}{17}\\selectfont  \\texttt{exibble} is an R dataset\\fontsize{12}{15}\\selectfont }\n} \\\\ \n\\toprule\n &  &  & \\multicolumn{3}{c}{timing} &  &  \\\\ \n\\cmidrule(lr){4-6}\nnum & char & fctr & date & time & datetime & currency & row \\\\ \n\\midrule\\addlinespace[2.5pt]\n\\multicolumn{8}{l}{grp\\_a} \\\\[2.5pt] \n\\midrule\\addlinespace[2.5pt]\n1.111e-01 & apricot & one & 2015-01-15 & 13:35 & 2018-01-01 02:22 & 49.950 & row\\_1 \\\\ \n2.222e+00 & banana & two & 2015-02-15 & 14:40 & 2018-02-02 14:33 & 17.950 & row\\_2 \\\\ \n3.333e+01 & coconut & three & 2015-03-15 & 15:45 & 2018-03-03 03:44 & 1.390 & row\\_3 \\\\ \n4.444e+02 & durian & four & 2015-04-15 & 16:50 & 2018-04-04 15:55 & 65100.000 & row\\_4 \\\\ \n\\midrule\\addlinespace[2.5pt]\n\\multicolumn{8}{l}{grp\\_b} \\\\[2.5pt] \n\\midrule\\addlinespace[2.5pt]\n5.550e+03 & NA & five & 2015-05-15 & 17:55 & 2018-05-05 04:00 & 1325.810 & row\\_5 \\\\ \nNA & fig & six & 2015-06-15 & NA & 2018-06-06 16:11 & 13.255 & row\\_6 \\\\ \n7.770e+05 & grapefruit & seven & NA & 19:10 & 2018-07-07 05:22 & NA & row\\_7 \\\\ \n8.880e+06 & honeydew & eight & 2015-08-15 & 20:20 & NA & 0.440 & row\\_8 \\\\ \n\\bottomrule\n\\end{longtable}\n\\begin{minipage}{\\linewidth}\n\\vspace{.05em}\nSource note \\#1\\\\\nSource note \\#2\\\\\n\\end{minipage}\n\\endgroup\n"

---

    Code
      as_rtf(gt_tbl)
    Output
      {\rtf\ansi\ansicpg1252{\fonttbl{\f0\froman\fcharset0\fprq0 Courier New;}{\f1\froman\fcharset0\fprq0 Times;}}{\colortbl;\red51\green51\blue51;\red211\green211\blue211;}
      
      \paperw12240\paperh15840\widowctrl\ftnbj\fet0\sectd\linex0
      \lndscpsxn
      \margl1440\margr1440\margt1440\margb1440
      \headery720\footery720\fs20
      
      \trowd\trrh0\trhdr
      
      \pard\plain\uc0\qc\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx9360
      \intbl {\f0\cf1 {\f0\fs20 Data listing from {\b exibble}} {\f0\fs20\i\super } \line {\f0\fs20 {\f1 exibble} is an R dataset} {\f0\fs20\i\super }}\cell
      
      \row
      
      \trowd\trrh0\trhdr
      
      \pard\plain\uc0\qc\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx1170
      \intbl {\f0 {\f0\fs20 }}\cell
      
      \pard\plain\uc0\qc\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx2340
      \intbl {\f0 {\f0\fs20 }}\cell
      
      \pard\plain\uc0\qc\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx3510
      \intbl {\f0 {\f0\fs20 }}\cell
      
      \pard\plain\uc0\qc\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85\clbrdrb\brdrs\brdrw20\brdrcf2\clmgf \cellx4680
      \intbl {\f0 {\f0\fs20 timing}}\cell
      
      \pard\plain\uc0\qc\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85\clmrg \cellx5850
      \intbl {\f0 {\f0\fs20 }}\cell
      
      \pard\plain\uc0\qc\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85\clmrg \cellx7020
      \intbl {\f0 {\f0\fs20 }}\cell
      
      \pard\plain\uc0\qc\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx8190
      \intbl {\f0 {\f0\fs20 }}\cell
      
      \pard\plain\uc0\qc\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx9360
      \intbl {\f0 {\f0\fs20 }}\cell
      
      \row
      
      \trowd\trrh0\trhdr
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85\clbrdrb\brdrs\brdrw20\brdrcf2 \cellx1170
      \intbl {\f0 {\f0\fs20 num}}\cell
      
      \pard\plain\uc0\ql\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85\clbrdrb\brdrs\brdrw20\brdrcf2 \cellx2340
      \intbl {\f0 {\f0\fs20 char}}\cell
      
      \pard\plain\uc0\qc\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85\clbrdrb\brdrs\brdrw20\brdrcf2 \cellx3510
      \intbl {\f0 {\f0\fs20 fctr}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85\clbrdrb\brdrs\brdrw20\brdrcf2 \cellx4680
      \intbl {\f0 {\f0\fs20 date}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85\clbrdrb\brdrs\brdrw20\brdrcf2 \cellx5850
      \intbl {\f0 {\f0\fs20 time}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85\clbrdrb\brdrs\brdrw20\brdrcf2 \cellx7020
      \intbl {\f0 {\f0\fs20 datetime}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85\clbrdrb\brdrs\brdrw20\brdrcf2 \cellx8190
      \intbl {\f0 {\f0\fs20 currency}}\cell
      
      \pard\plain\uc0\ql\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85\clbrdrb\brdrs\brdrw20\brdrcf2 \cellx9360
      \intbl {\f0 {\f0\fs20 row}}\cell
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\ql\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx9360
      \intbl {\f0\fs20 grp_a}\cell
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx1170
      \intbl {\f0 {\f0\fs20 1.111e-01}}\cell
      
      \pard\plain\uc0\ql\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx2340
      \intbl {\f0 {\f0\fs20 apricot}}\cell
      
      \pard\plain\uc0\qc\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx3510
      \intbl {\f0 {\f0\fs20 one}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx4680
      \intbl {\f0 {\f0\fs20 2015-01-15}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx5850
      \intbl {\f0 {\f0\fs20 13:35}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx7020
      \intbl {\f0 {\f0\fs20 2018-01-01 02:22}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx8190
      \intbl {\f0 {\f0\fs20 49.950}}\cell
      
      \pard\plain\uc0\ql\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx9360
      \intbl {\f0 {\f0\fs20 row_1}}\cell
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx1170
      \intbl {\f0 {\f0\fs20 2.222e+00}}\cell
      
      \pard\plain\uc0\ql\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx2340
      \intbl {\f0 {\f0\fs20 banana}}\cell
      
      \pard\plain\uc0\qc\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx3510
      \intbl {\f0 {\f0\fs20 two}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx4680
      \intbl {\f0 {\f0\fs20 2015-02-15}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx5850
      \intbl {\f0 {\f0\fs20 14:40}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx7020
      \intbl {\f0 {\f0\fs20 2018-02-02 14:33}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx8190
      \intbl {\f0 {\f0\fs20 17.950}}\cell
      
      \pard\plain\uc0\ql\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx9360
      \intbl {\f0 {\f0\fs20 row_2}}\cell
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx1170
      \intbl {\f0 {\f0\fs20 3.333e+01}}\cell
      
      \pard\plain\uc0\ql\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx2340
      \intbl {\f0 {\f0\fs20 coconut}}\cell
      
      \pard\plain\uc0\qc\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx3510
      \intbl {\f0 {\f0\fs20 three}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx4680
      \intbl {\f0 {\f0\fs20 2015-03-15}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx5850
      \intbl {\f0 {\f0\fs20 15:45}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx7020
      \intbl {\f0 {\f0\fs20 2018-03-03 03:44}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx8190
      \intbl {\f0 {\f0\fs20 1.390}}\cell
      
      \pard\plain\uc0\ql\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx9360
      \intbl {\f0 {\f0\fs20 row_3}}\cell
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx1170
      \intbl {\f0 {\f0\fs20 4.444e+02}}\cell
      
      \pard\plain\uc0\ql\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx2340
      \intbl {\f0 {\f0\fs20 durian}}\cell
      
      \pard\plain\uc0\qc\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx3510
      \intbl {\f0 {\f0\fs20 four}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx4680
      \intbl {\f0 {\f0\fs20 2015-04-15}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx5850
      \intbl {\f0 {\f0\fs20 16:50}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx7020
      \intbl {\f0 {\f0\fs20 2018-04-04 15:55}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx8190
      \intbl {\f0 {\f0\fs20 65100.000}}\cell
      
      \pard\plain\uc0\ql\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx9360
      \intbl {\f0 {\f0\fs20 row_4}}\cell
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\ql\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx9360
      \intbl {\f0\fs20 grp_b}\cell
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx1170
      \intbl {\f0 {\f0\fs20 5.550e+03}}\cell
      
      \pard\plain\uc0\ql\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx2340
      \intbl {\f0 {\f0\fs20 NA}}\cell
      
      \pard\plain\uc0\qc\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx3510
      \intbl {\f0 {\f0\fs20 five}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx4680
      \intbl {\f0 {\f0\fs20 2015-05-15}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx5850
      \intbl {\f0 {\f0\fs20 17:55}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx7020
      \intbl {\f0 {\f0\fs20 2018-05-05 04:00}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx8190
      \intbl {\f0 {\f0\fs20 1325.810}}\cell
      
      \pard\plain\uc0\ql\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx9360
      \intbl {\f0 {\f0\fs20 row_5}}\cell
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx1170
      \intbl {\f0 {\f0\fs20 NA}}\cell
      
      \pard\plain\uc0\ql\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx2340
      \intbl {\f0 {\f0\fs20 fig}}\cell
      
      \pard\plain\uc0\qc\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx3510
      \intbl {\f0 {\f0\fs20 six}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx4680
      \intbl {\f0 {\f0\fs20 2015-06-15}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx5850
      \intbl {\f0 {\f0\fs20 NA}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx7020
      \intbl {\f0 {\f0\fs20 2018-06-06 16:11}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx8190
      \intbl {\f0 {\f0\fs20 13.255}}\cell
      
      \pard\plain\uc0\ql\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx9360
      \intbl {\f0 {\f0\fs20 row_6}}\cell
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx1170
      \intbl {\f0 {\f0\fs20 7.770e+05}}\cell
      
      \pard\plain\uc0\ql\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx2340
      \intbl {\f0 {\f0\fs20 grapefruit}}\cell
      
      \pard\plain\uc0\qc\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx3510
      \intbl {\f0 {\f0\fs20 seven}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx4680
      \intbl {\f0 {\f0\fs20 NA}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx5850
      \intbl {\f0 {\f0\fs20 19:10}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx7020
      \intbl {\f0 {\f0\fs20 2018-07-07 05:22}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx8190
      \intbl {\f0 {\f0\fs20 NA}}\cell
      
      \pard\plain\uc0\ql\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx9360
      \intbl {\f0 {\f0\fs20 row_7}}\cell
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx1170
      \intbl {\f0 {\f0\fs20 8.880e+06}}\cell
      
      \pard\plain\uc0\ql\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx2340
      \intbl {\f0 {\f0\fs20 honeydew}}\cell
      
      \pard\plain\uc0\qc\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx3510
      \intbl {\f0 {\f0\fs20 eight}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx4680
      \intbl {\f0 {\f0\fs20 2015-08-15}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx5850
      \intbl {\f0 {\f0\fs20 20:20}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx7020
      \intbl {\f0 {\f0\fs20 NA}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx8190
      \intbl {\f0 {\f0\fs20 0.440}}\cell
      
      \pard\plain\uc0\ql\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx9360
      \intbl {\f0 {\f0\fs20 row_8}}\cell
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\ql\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx9360
      \intbl {\f0 {\f0\fs20 Source note #1\line Source note #2}}\cell
      
      \row
      
      }

---

    Code
      cat(render_as_html(gt_tbl))
    Output
      <table class="gt_table" data-quarto-disable-processing="false" data-quarto-bootstrap="false">
        <thead>
          <tr class="gt_heading">
            <td colspan="9" class="gt_heading gt_title gt_font_normal" style><span class='gt_from_md'>Data listing from <strong>exibble</strong></span></td>
          </tr>
          <tr class="gt_heading">
            <td colspan="9" class="gt_heading gt_subtitle gt_font_normal gt_bottom_border" style><span class='gt_from_md'><code>exibble</code> is an R dataset</span></td>
          </tr>
          <tr class="gt_col_headings gt_spanner_row">
            <th class="gt_col_heading gt_columns_bottom_border gt_left" rowspan="2" colspan="1" scope="col" id="a::stub">S.L.</th>
            <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="2" colspan="1" scope="col" id="num">num</th>
            <th class="gt_col_heading gt_columns_bottom_border gt_left" rowspan="2" colspan="1" scope="col" id="char">char</th>
            <th class="gt_col_heading gt_columns_bottom_border gt_center" rowspan="2" colspan="1" scope="col" id="fctr">fctr</th>
            <th class="gt_center gt_columns_top_border gt_column_spanner_outer" rowspan="1" colspan="3" scope="colgroup" id="timing">
              <div class="gt_column_spanner">timing</div>
            </th>
            <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="2" colspan="1" scope="col" id="currency">currency</th>
            <th class="gt_col_heading gt_columns_bottom_border gt_left" rowspan="2" colspan="1" scope="col" id="row">row</th>
          </tr>
          <tr class="gt_col_headings">
            <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id="date">date</th>
            <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id="time">time</th>
            <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id="datetime">datetime</th>
          </tr>
        </thead>
        <tbody class="gt_table_body">
          <tr class="gt_row_group_first"><td headers="grp_a stub_2_1 stub_1" rowspan="4" class="gt_row gt_left gt_stub_row_group">grp_a</td>
      <td headers="grp_a stub_2_1 num" class="gt_row gt_right">1.111e-01</td>
      <td headers="grp_a stub_2_1 char" class="gt_row gt_left">apricot</td>
      <td headers="grp_a stub_2_1 fctr" class="gt_row gt_center">one</td>
      <td headers="grp_a stub_2_1 date" class="gt_row gt_right">2015-01-15</td>
      <td headers="grp_a stub_2_1 time" class="gt_row gt_right">13:35</td>
      <td headers="grp_a stub_2_1 datetime" class="gt_row gt_right">2018-01-01 02:22</td>
      <td headers="grp_a stub_2_1 currency" class="gt_row gt_right">49.950</td>
      <td headers="grp_a stub_2_1 row" class="gt_row gt_left">row_1</td></tr>
          <tr><td headers="grp_a stub_2_2 num" class="gt_row gt_right">2.222e+00</td>
      <td headers="grp_a stub_2_2 char" class="gt_row gt_left">banana</td>
      <td headers="grp_a stub_2_2 fctr" class="gt_row gt_center">two</td>
      <td headers="grp_a stub_2_2 date" class="gt_row gt_right">2015-02-15</td>
      <td headers="grp_a stub_2_2 time" class="gt_row gt_right">14:40</td>
      <td headers="grp_a stub_2_2 datetime" class="gt_row gt_right">2018-02-02 14:33</td>
      <td headers="grp_a stub_2_2 currency" class="gt_row gt_right">17.950</td>
      <td headers="grp_a stub_2_2 row" class="gt_row gt_left">row_2</td></tr>
          <tr><td headers="grp_a stub_2_3 num" class="gt_row gt_right">3.333e+01</td>
      <td headers="grp_a stub_2_3 char" class="gt_row gt_left">coconut</td>
      <td headers="grp_a stub_2_3 fctr" class="gt_row gt_center">three</td>
      <td headers="grp_a stub_2_3 date" class="gt_row gt_right">2015-03-15</td>
      <td headers="grp_a stub_2_3 time" class="gt_row gt_right">15:45</td>
      <td headers="grp_a stub_2_3 datetime" class="gt_row gt_right">2018-03-03 03:44</td>
      <td headers="grp_a stub_2_3 currency" class="gt_row gt_right">1.390</td>
      <td headers="grp_a stub_2_3 row" class="gt_row gt_left">row_3</td></tr>
          <tr><td headers="grp_a stub_2_4 num" class="gt_row gt_right">4.444e+02</td>
      <td headers="grp_a stub_2_4 char" class="gt_row gt_left">durian</td>
      <td headers="grp_a stub_2_4 fctr" class="gt_row gt_center">four</td>
      <td headers="grp_a stub_2_4 date" class="gt_row gt_right">2015-04-15</td>
      <td headers="grp_a stub_2_4 time" class="gt_row gt_right">16:50</td>
      <td headers="grp_a stub_2_4 datetime" class="gt_row gt_right">2018-04-04 15:55</td>
      <td headers="grp_a stub_2_4 currency" class="gt_row gt_right">65100.000</td>
      <td headers="grp_a stub_2_4 row" class="gt_row gt_left">row_4</td></tr>
          <tr class="gt_row_group_first"><td headers="grp_b stub_2_5 stub_1" rowspan="4" class="gt_row gt_left gt_stub_row_group">grp_b</td>
      <td headers="grp_b stub_2_5 num" class="gt_row gt_right">5.550e+03</td>
      <td headers="grp_b stub_2_5 char" class="gt_row gt_left">NA</td>
      <td headers="grp_b stub_2_5 fctr" class="gt_row gt_center">five</td>
      <td headers="grp_b stub_2_5 date" class="gt_row gt_right">2015-05-15</td>
      <td headers="grp_b stub_2_5 time" class="gt_row gt_right">17:55</td>
      <td headers="grp_b stub_2_5 datetime" class="gt_row gt_right">2018-05-05 04:00</td>
      <td headers="grp_b stub_2_5 currency" class="gt_row gt_right">1325.810</td>
      <td headers="grp_b stub_2_5 row" class="gt_row gt_left">row_5</td></tr>
          <tr><td headers="grp_b stub_2_6 num" class="gt_row gt_right">NA</td>
      <td headers="grp_b stub_2_6 char" class="gt_row gt_left">fig</td>
      <td headers="grp_b stub_2_6 fctr" class="gt_row gt_center">six</td>
      <td headers="grp_b stub_2_6 date" class="gt_row gt_right">2015-06-15</td>
      <td headers="grp_b stub_2_6 time" class="gt_row gt_right">NA</td>
      <td headers="grp_b stub_2_6 datetime" class="gt_row gt_right">2018-06-06 16:11</td>
      <td headers="grp_b stub_2_6 currency" class="gt_row gt_right">13.255</td>
      <td headers="grp_b stub_2_6 row" class="gt_row gt_left">row_6</td></tr>
          <tr><td headers="grp_b stub_2_7 num" class="gt_row gt_right">7.770e+05</td>
      <td headers="grp_b stub_2_7 char" class="gt_row gt_left">grapefruit</td>
      <td headers="grp_b stub_2_7 fctr" class="gt_row gt_center">seven</td>
      <td headers="grp_b stub_2_7 date" class="gt_row gt_right">NA</td>
      <td headers="grp_b stub_2_7 time" class="gt_row gt_right">19:10</td>
      <td headers="grp_b stub_2_7 datetime" class="gt_row gt_right">2018-07-07 05:22</td>
      <td headers="grp_b stub_2_7 currency" class="gt_row gt_right">NA</td>
      <td headers="grp_b stub_2_7 row" class="gt_row gt_left">row_7</td></tr>
          <tr><td headers="grp_b stub_2_8 num" class="gt_row gt_right">8.880e+06</td>
      <td headers="grp_b stub_2_8 char" class="gt_row gt_left">honeydew</td>
      <td headers="grp_b stub_2_8 fctr" class="gt_row gt_center">eight</td>
      <td headers="grp_b stub_2_8 date" class="gt_row gt_right">2015-08-15</td>
      <td headers="grp_b stub_2_8 time" class="gt_row gt_right">20:20</td>
      <td headers="grp_b stub_2_8 datetime" class="gt_row gt_right">NA</td>
      <td headers="grp_b stub_2_8 currency" class="gt_row gt_right">0.440</td>
      <td headers="grp_b stub_2_8 row" class="gt_row gt_left">row_8</td></tr>
        </tbody>
        <tfoot>
          <tr class="gt_sourcenotes">
            <td class="gt_sourcenote" colspan="9">Source note #1</td>
          </tr>
          <tr class="gt_sourcenotes">
            <td class="gt_sourcenote" colspan="9">Source note #2</td>
          </tr>
        </tfoot>
      </table>

---

    Code
      as.character(as_latex(gt_tbl))
    Output
      [1] "\\begingroup\n\\fontsize{12.0pt}{14.0pt}\\selectfont\n\\setlength{\\LTpost}{0mm}\n\\begin{longtable}{l|rlcrrrrl}\n\\caption*{\n{\\fontsize{20}{25}\\selectfont  Data listing from \\textbf{exibble}\\fontsize{12}{15}\\selectfont } \\\\ \n{\\fontsize{14}{17}\\selectfont  \\texttt{exibble} is an R dataset\\fontsize{12}{15}\\selectfont }\n} \\\\ \n\\toprule\n &  &  &  & \\multicolumn{3}{c}{timing} &  &  \\\\ \n\\cmidrule(lr){5-7}\nS.L. & num & char & fctr & date & time & datetime & currency & row \\\\ \n\\midrule\\addlinespace[2.5pt]\n\\multirow[t]{4}{*}{grp\\_a} & 1.111e-01 & apricot & one & 2015-01-15 & 13:35 & 2018-01-01 02:22 & 49.950 & row\\_1 \\\\ \n & 2.222e+00 & banana & two & 2015-02-15 & 14:40 & 2018-02-02 14:33 & 17.950 & row\\_2 \\\\ \n & 3.333e+01 & coconut & three & 2015-03-15 & 15:45 & 2018-03-03 03:44 & 1.390 & row\\_3 \\\\ \n & 4.444e+02 & durian & four & 2015-04-15 & 16:50 & 2018-04-04 15:55 & 65100.000 & row\\_4 \\\\ \n\\midrule\\addlinespace[2.5pt]\n\\multirow[t]{4}{*}{grp\\_b} & 5.550e+03 & NA & five & 2015-05-15 & 17:55 & 2018-05-05 04:00 & 1325.810 & row\\_5 \\\\ \n & NA & fig & six & 2015-06-15 & NA & 2018-06-06 16:11 & 13.255 & row\\_6 \\\\ \n & 7.770e+05 & grapefruit & seven & NA & 19:10 & 2018-07-07 05:22 & NA & row\\_7 \\\\ \n & 8.880e+06 & honeydew & eight & 2015-08-15 & 20:20 & NA & 0.440 & row\\_8 \\\\ \n\\bottomrule\n\\end{longtable}\n\\begin{minipage}{\\linewidth}\n\\vspace{.05em}\nSource note \\#1\\\\\nSource note \\#2\\\\\n\\end{minipage}\n\\endgroup\n"

---

    Code
      as_rtf(gt_tbl)
    Output
      {\rtf\ansi\ansicpg1252{\fonttbl{\f0\froman\fcharset0\fprq0 Courier New;}{\f1\froman\fcharset0\fprq0 Times;}}{\colortbl;\red51\green51\blue51;\red211\green211\blue211;}
      
      \paperw12240\paperh15840\widowctrl\ftnbj\fet0\sectd\linex0
      \lndscpsxn
      \margl1440\margr1440\margt1440\margb1440
      \headery720\footery720\fs20
      
      \trowd\trrh0\trhdr
      
      \pard\plain\uc0\qc\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx9360
      \intbl {\f0\cf1 {\f0\fs20 Data listing from {\b exibble}} {\f0\fs20\i\super } \line {\f0\fs20 {\f1 exibble} is an R dataset} {\f0\fs20\i\super }}\cell
      
      \row
      
      \trowd\trrh0\trhdr
      
      \pard\plain\uc0\qc\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx1040
      \intbl {\f0 {\f0\fs20 }}\cell
      
      \pard\plain\uc0\qc\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx2080
      \intbl {\f0 {\f0\fs20 }}\cell
      
      \pard\plain\uc0\qc\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx3120
      \intbl {\f0 {\f0\fs20 }}\cell
      
      \pard\plain\uc0\qc\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx4160
      \intbl {\f0 {\f0\fs20 }}\cell
      
      \pard\plain\uc0\qc\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85\clbrdrb\brdrs\brdrw20\brdrcf2\clmgf \cellx5200
      \intbl {\f0 {\f0\fs20 timing}}\cell
      
      \pard\plain\uc0\qc\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85\clmrg \cellx6240
      \intbl {\f0 {\f0\fs20 }}\cell
      
      \pard\plain\uc0\qc\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85\clmrg \cellx7280
      \intbl {\f0 {\f0\fs20 }}\cell
      
      \pard\plain\uc0\qc\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx8320
      \intbl {\f0 {\f0\fs20 }}\cell
      
      \pard\plain\uc0\qc\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx9360
      \intbl {\f0 {\f0\fs20 }}\cell
      
      \row
      
      \trowd\trrh0\trhdr
      
      \pard\plain\uc0\ql\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85\clbrdrb\brdrs\brdrw20\brdrcf2 \cellx1040
      \intbl {\f0 {\f0\fs20 S.L.}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85\clbrdrb\brdrs\brdrw20\brdrcf2 \cellx2080
      \intbl {\f0 {\f0\fs20 num}}\cell
      
      \pard\plain\uc0\ql\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85\clbrdrb\brdrs\brdrw20\brdrcf2 \cellx3120
      \intbl {\f0 {\f0\fs20 char}}\cell
      
      \pard\plain\uc0\qc\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85\clbrdrb\brdrs\brdrw20\brdrcf2 \cellx4160
      \intbl {\f0 {\f0\fs20 fctr}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85\clbrdrb\brdrs\brdrw20\brdrcf2 \cellx5200
      \intbl {\f0 {\f0\fs20 date}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85\clbrdrb\brdrs\brdrw20\brdrcf2 \cellx6240
      \intbl {\f0 {\f0\fs20 time}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85\clbrdrb\brdrs\brdrw20\brdrcf2 \cellx7280
      \intbl {\f0 {\f0\fs20 datetime}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85\clbrdrb\brdrs\brdrw20\brdrcf2 \cellx8320
      \intbl {\f0 {\f0\fs20 currency}}\cell
      
      \pard\plain\uc0\ql\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85\clbrdrb\brdrs\brdrw20\brdrcf2 \cellx9360
      \intbl {\f0 {\f0\fs20 row}}\cell
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\ql\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx1040
      \intbl {\f0 {\f0\fs20 grp_a}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx2080
      \intbl {\f0 {\f0\fs20 1.111e-01}}\cell
      
      \pard\plain\uc0\ql\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx3120
      \intbl {\f0 {\f0\fs20 apricot}}\cell
      
      \pard\plain\uc0\qc\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx4160
      \intbl {\f0 {\f0\fs20 one}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx5200
      \intbl {\f0 {\f0\fs20 2015-01-15}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx6240
      \intbl {\f0 {\f0\fs20 13:35}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx7280
      \intbl {\f0 {\f0\fs20 2018-01-01 02:22}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx8320
      \intbl {\f0 {\f0\fs20 49.950}}\cell
      
      \pard\plain\uc0\ql\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx9360
      \intbl {\f0 {\f0\fs20 row_1}}\cell
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\ql\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx1040
      \intbl {\f0 {\f0\fs20 }}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx2080
      \intbl {\f0 {\f0\fs20 2.222e+00}}\cell
      
      \pard\plain\uc0\ql\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx3120
      \intbl {\f0 {\f0\fs20 banana}}\cell
      
      \pard\plain\uc0\qc\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx4160
      \intbl {\f0 {\f0\fs20 two}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx5200
      \intbl {\f0 {\f0\fs20 2015-02-15}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx6240
      \intbl {\f0 {\f0\fs20 14:40}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx7280
      \intbl {\f0 {\f0\fs20 2018-02-02 14:33}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx8320
      \intbl {\f0 {\f0\fs20 17.950}}\cell
      
      \pard\plain\uc0\ql\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx9360
      \intbl {\f0 {\f0\fs20 row_2}}\cell
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\ql\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx1040
      \intbl {\f0 {\f0\fs20 }}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx2080
      \intbl {\f0 {\f0\fs20 3.333e+01}}\cell
      
      \pard\plain\uc0\ql\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx3120
      \intbl {\f0 {\f0\fs20 coconut}}\cell
      
      \pard\plain\uc0\qc\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx4160
      \intbl {\f0 {\f0\fs20 three}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx5200
      \intbl {\f0 {\f0\fs20 2015-03-15}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx6240
      \intbl {\f0 {\f0\fs20 15:45}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx7280
      \intbl {\f0 {\f0\fs20 2018-03-03 03:44}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx8320
      \intbl {\f0 {\f0\fs20 1.390}}\cell
      
      \pard\plain\uc0\ql\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx9360
      \intbl {\f0 {\f0\fs20 row_3}}\cell
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\ql\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx1040
      \intbl {\f0 {\f0\fs20 }}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx2080
      \intbl {\f0 {\f0\fs20 4.444e+02}}\cell
      
      \pard\plain\uc0\ql\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx3120
      \intbl {\f0 {\f0\fs20 durian}}\cell
      
      \pard\plain\uc0\qc\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx4160
      \intbl {\f0 {\f0\fs20 four}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx5200
      \intbl {\f0 {\f0\fs20 2015-04-15}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx6240
      \intbl {\f0 {\f0\fs20 16:50}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx7280
      \intbl {\f0 {\f0\fs20 2018-04-04 15:55}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx8320
      \intbl {\f0 {\f0\fs20 65100.000}}\cell
      
      \pard\plain\uc0\ql\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx9360
      \intbl {\f0 {\f0\fs20 row_4}}\cell
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\ql\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx1040
      \intbl {\f0 {\f0\fs20 grp_b}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx2080
      \intbl {\f0 {\f0\fs20 5.550e+03}}\cell
      
      \pard\plain\uc0\ql\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx3120
      \intbl {\f0 {\f0\fs20 NA}}\cell
      
      \pard\plain\uc0\qc\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx4160
      \intbl {\f0 {\f0\fs20 five}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx5200
      \intbl {\f0 {\f0\fs20 2015-05-15}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx6240
      \intbl {\f0 {\f0\fs20 17:55}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx7280
      \intbl {\f0 {\f0\fs20 2018-05-05 04:00}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx8320
      \intbl {\f0 {\f0\fs20 1325.810}}\cell
      
      \pard\plain\uc0\ql\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx9360
      \intbl {\f0 {\f0\fs20 row_5}}\cell
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\ql\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx1040
      \intbl {\f0 {\f0\fs20 }}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx2080
      \intbl {\f0 {\f0\fs20 NA}}\cell
      
      \pard\plain\uc0\ql\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx3120
      \intbl {\f0 {\f0\fs20 fig}}\cell
      
      \pard\plain\uc0\qc\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx4160
      \intbl {\f0 {\f0\fs20 six}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx5200
      \intbl {\f0 {\f0\fs20 2015-06-15}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx6240
      \intbl {\f0 {\f0\fs20 NA}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx7280
      \intbl {\f0 {\f0\fs20 2018-06-06 16:11}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx8320
      \intbl {\f0 {\f0\fs20 13.255}}\cell
      
      \pard\plain\uc0\ql\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx9360
      \intbl {\f0 {\f0\fs20 row_6}}\cell
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\ql\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx1040
      \intbl {\f0 {\f0\fs20 }}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx2080
      \intbl {\f0 {\f0\fs20 7.770e+05}}\cell
      
      \pard\plain\uc0\ql\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx3120
      \intbl {\f0 {\f0\fs20 grapefruit}}\cell
      
      \pard\plain\uc0\qc\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx4160
      \intbl {\f0 {\f0\fs20 seven}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx5200
      \intbl {\f0 {\f0\fs20 NA}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx6240
      \intbl {\f0 {\f0\fs20 19:10}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx7280
      \intbl {\f0 {\f0\fs20 2018-07-07 05:22}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx8320
      \intbl {\f0 {\f0\fs20 NA}}\cell
      
      \pard\plain\uc0\ql\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx9360
      \intbl {\f0 {\f0\fs20 row_7}}\cell
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\ql\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx1040
      \intbl {\f0 {\f0\fs20 }}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx2080
      \intbl {\f0 {\f0\fs20 8.880e+06}}\cell
      
      \pard\plain\uc0\ql\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx3120
      \intbl {\f0 {\f0\fs20 honeydew}}\cell
      
      \pard\plain\uc0\qc\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx4160
      \intbl {\f0 {\f0\fs20 eight}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx5200
      \intbl {\f0 {\f0\fs20 2015-08-15}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx6240
      \intbl {\f0 {\f0\fs20 20:20}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx7280
      \intbl {\f0 {\f0\fs20 NA}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx8320
      \intbl {\f0 {\f0\fs20 0.440}}\cell
      
      \pard\plain\uc0\ql\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx9360
      \intbl {\f0 {\f0\fs20 row_8}}\cell
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\ql\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx9360
      \intbl {\f0 {\f0\fs20 Source note #1\line Source note #2}}\cell
      
      \row
      
      }

---

    Code
      cat(render_as_html(gt_tbl))
    Output
      <table class="gt_table" data-quarto-disable-processing="false" data-quarto-bootstrap="false">
        <thead>
          <tr class="gt_heading">
            <td colspan="9" class="gt_heading gt_title gt_font_normal" style><span class='gt_from_md'>Data listing from <strong>exibble</strong></span></td>
          </tr>
          <tr class="gt_heading">
            <td colspan="9" class="gt_heading gt_subtitle gt_font_normal gt_bottom_border" style><span class='gt_from_md'><code>exibble</code> is an R dataset</span></td>
          </tr>
          <tr class="gt_col_headings gt_spanner_row">
            <th class="gt_col_heading gt_columns_bottom_border gt_left" rowspan="2" colspan="1" scope="col" id="a::stub">S.L.</th>
            <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="2" colspan="1" scope="col" id="num">num</th>
            <th class="gt_col_heading gt_columns_bottom_border gt_left" rowspan="2" colspan="1" scope="col" id="char">char</th>
            <th class="gt_col_heading gt_columns_bottom_border gt_center" rowspan="2" colspan="1" scope="col" id="fctr">fctr</th>
            <th class="gt_center gt_columns_top_border gt_column_spanner_outer" rowspan="1" colspan="3" scope="colgroup" id="timing">
              <div class="gt_column_spanner">timing</div>
            </th>
            <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="2" colspan="1" scope="col" id="currency">currency</th>
            <th class="gt_col_heading gt_columns_bottom_border gt_left" rowspan="2" colspan="1" scope="col" id="group">group</th>
          </tr>
          <tr class="gt_col_headings">
            <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id="date">date</th>
            <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id="time">time</th>
            <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id="datetime">datetime</th>
          </tr>
        </thead>
        <tbody class="gt_table_body">
          <tr><th id="stub_1_1" scope="row" class="gt_row gt_left gt_stub">row_1</th>
      <td headers="stub_1_1 num" class="gt_row gt_right">1.111e-01</td>
      <td headers="stub_1_1 char" class="gt_row gt_left">apricot</td>
      <td headers="stub_1_1 fctr" class="gt_row gt_center">one</td>
      <td headers="stub_1_1 date" class="gt_row gt_right">2015-01-15</td>
      <td headers="stub_1_1 time" class="gt_row gt_right">13:35</td>
      <td headers="stub_1_1 datetime" class="gt_row gt_right">2018-01-01 02:22</td>
      <td headers="stub_1_1 currency" class="gt_row gt_right">49.950</td>
      <td headers="stub_1_1 group" class="gt_row gt_left">grp_a</td></tr>
          <tr><th id="stub_1_2" scope="row" class="gt_row gt_left gt_stub">row_2</th>
      <td headers="stub_1_2 num" class="gt_row gt_right">2.222e+00</td>
      <td headers="stub_1_2 char" class="gt_row gt_left">banana</td>
      <td headers="stub_1_2 fctr" class="gt_row gt_center">two</td>
      <td headers="stub_1_2 date" class="gt_row gt_right">2015-02-15</td>
      <td headers="stub_1_2 time" class="gt_row gt_right">14:40</td>
      <td headers="stub_1_2 datetime" class="gt_row gt_right">2018-02-02 14:33</td>
      <td headers="stub_1_2 currency" class="gt_row gt_right">17.950</td>
      <td headers="stub_1_2 group" class="gt_row gt_left">grp_a</td></tr>
          <tr><th id="stub_1_3" scope="row" class="gt_row gt_left gt_stub">row_3</th>
      <td headers="stub_1_3 num" class="gt_row gt_right">3.333e+01</td>
      <td headers="stub_1_3 char" class="gt_row gt_left">coconut</td>
      <td headers="stub_1_3 fctr" class="gt_row gt_center">three</td>
      <td headers="stub_1_3 date" class="gt_row gt_right">2015-03-15</td>
      <td headers="stub_1_3 time" class="gt_row gt_right">15:45</td>
      <td headers="stub_1_3 datetime" class="gt_row gt_right">2018-03-03 03:44</td>
      <td headers="stub_1_3 currency" class="gt_row gt_right">1.390</td>
      <td headers="stub_1_3 group" class="gt_row gt_left">grp_a</td></tr>
          <tr><th id="stub_1_4" scope="row" class="gt_row gt_left gt_stub">row_4</th>
      <td headers="stub_1_4 num" class="gt_row gt_right">4.444e+02</td>
      <td headers="stub_1_4 char" class="gt_row gt_left">durian</td>
      <td headers="stub_1_4 fctr" class="gt_row gt_center">four</td>
      <td headers="stub_1_4 date" class="gt_row gt_right">2015-04-15</td>
      <td headers="stub_1_4 time" class="gt_row gt_right">16:50</td>
      <td headers="stub_1_4 datetime" class="gt_row gt_right">2018-04-04 15:55</td>
      <td headers="stub_1_4 currency" class="gt_row gt_right">65100.000</td>
      <td headers="stub_1_4 group" class="gt_row gt_left">grp_a</td></tr>
          <tr><th id="stub_1_5" scope="row" class="gt_row gt_left gt_stub">row_5</th>
      <td headers="stub_1_5 num" class="gt_row gt_right">5.550e+03</td>
      <td headers="stub_1_5 char" class="gt_row gt_left">NA</td>
      <td headers="stub_1_5 fctr" class="gt_row gt_center">five</td>
      <td headers="stub_1_5 date" class="gt_row gt_right">2015-05-15</td>
      <td headers="stub_1_5 time" class="gt_row gt_right">17:55</td>
      <td headers="stub_1_5 datetime" class="gt_row gt_right">2018-05-05 04:00</td>
      <td headers="stub_1_5 currency" class="gt_row gt_right">1325.810</td>
      <td headers="stub_1_5 group" class="gt_row gt_left">grp_b</td></tr>
          <tr><th id="stub_1_6" scope="row" class="gt_row gt_left gt_stub">row_6</th>
      <td headers="stub_1_6 num" class="gt_row gt_right">NA</td>
      <td headers="stub_1_6 char" class="gt_row gt_left">fig</td>
      <td headers="stub_1_6 fctr" class="gt_row gt_center">six</td>
      <td headers="stub_1_6 date" class="gt_row gt_right">2015-06-15</td>
      <td headers="stub_1_6 time" class="gt_row gt_right">NA</td>
      <td headers="stub_1_6 datetime" class="gt_row gt_right">2018-06-06 16:11</td>
      <td headers="stub_1_6 currency" class="gt_row gt_right">13.255</td>
      <td headers="stub_1_6 group" class="gt_row gt_left">grp_b</td></tr>
          <tr><th id="stub_1_7" scope="row" class="gt_row gt_left gt_stub">row_7</th>
      <td headers="stub_1_7 num" class="gt_row gt_right">7.770e+05</td>
      <td headers="stub_1_7 char" class="gt_row gt_left">grapefruit</td>
      <td headers="stub_1_7 fctr" class="gt_row gt_center">seven</td>
      <td headers="stub_1_7 date" class="gt_row gt_right">NA</td>
      <td headers="stub_1_7 time" class="gt_row gt_right">19:10</td>
      <td headers="stub_1_7 datetime" class="gt_row gt_right">2018-07-07 05:22</td>
      <td headers="stub_1_7 currency" class="gt_row gt_right">NA</td>
      <td headers="stub_1_7 group" class="gt_row gt_left">grp_b</td></tr>
          <tr><th id="stub_1_8" scope="row" class="gt_row gt_left gt_stub">row_8</th>
      <td headers="stub_1_8 num" class="gt_row gt_right">8.880e+06</td>
      <td headers="stub_1_8 char" class="gt_row gt_left">honeydew</td>
      <td headers="stub_1_8 fctr" class="gt_row gt_center">eight</td>
      <td headers="stub_1_8 date" class="gt_row gt_right">2015-08-15</td>
      <td headers="stub_1_8 time" class="gt_row gt_right">20:20</td>
      <td headers="stub_1_8 datetime" class="gt_row gt_right">NA</td>
      <td headers="stub_1_8 currency" class="gt_row gt_right">0.440</td>
      <td headers="stub_1_8 group" class="gt_row gt_left">grp_b</td></tr>
        </tbody>
        <tfoot>
          <tr class="gt_sourcenotes">
            <td class="gt_sourcenote" colspan="9">Source note #1</td>
          </tr>
          <tr class="gt_sourcenotes">
            <td class="gt_sourcenote" colspan="9">Source note #2</td>
          </tr>
        </tfoot>
      </table>

---

    Code
      as.character(as_latex(gt_tbl))
    Output
      [1] "\\begingroup\n\\fontsize{12.0pt}{14.0pt}\\selectfont\n\\setlength{\\LTpost}{0mm}\n\\begin{longtable}{l|rlcrrrrl}\n\\caption*{\n{\\fontsize{20}{25}\\selectfont  Data listing from \\textbf{exibble}\\fontsize{12}{15}\\selectfont } \\\\ \n{\\fontsize{14}{17}\\selectfont  \\texttt{exibble} is an R dataset\\fontsize{12}{15}\\selectfont }\n} \\\\ \n\\toprule\n &  &  &  & \\multicolumn{3}{c}{timing} &  &  \\\\ \n\\cmidrule(lr){5-7}\nS.L. & num & char & fctr & date & time & datetime & currency & group \\\\ \n\\midrule\\addlinespace[2.5pt]\nrow\\_1 & 1.111e-01 & apricot & one & 2015-01-15 & 13:35 & 2018-01-01 02:22 & 49.950 & grp\\_a \\\\ \nrow\\_2 & 2.222e+00 & banana & two & 2015-02-15 & 14:40 & 2018-02-02 14:33 & 17.950 & grp\\_a \\\\ \nrow\\_3 & 3.333e+01 & coconut & three & 2015-03-15 & 15:45 & 2018-03-03 03:44 & 1.390 & grp\\_a \\\\ \nrow\\_4 & 4.444e+02 & durian & four & 2015-04-15 & 16:50 & 2018-04-04 15:55 & 65100.000 & grp\\_a \\\\ \nrow\\_5 & 5.550e+03 & NA & five & 2015-05-15 & 17:55 & 2018-05-05 04:00 & 1325.810 & grp\\_b \\\\ \nrow\\_6 & NA & fig & six & 2015-06-15 & NA & 2018-06-06 16:11 & 13.255 & grp\\_b \\\\ \nrow\\_7 & 7.770e+05 & grapefruit & seven & NA & 19:10 & 2018-07-07 05:22 & NA & grp\\_b \\\\ \nrow\\_8 & 8.880e+06 & honeydew & eight & 2015-08-15 & 20:20 & NA & 0.440 & grp\\_b \\\\ \n\\bottomrule\n\\end{longtable}\n\\begin{minipage}{\\linewidth}\n\\vspace{.05em}\nSource note \\#1\\\\\nSource note \\#2\\\\\n\\end{minipage}\n\\endgroup\n"

---

    Code
      as_rtf(gt_tbl)
    Output
      {\rtf\ansi\ansicpg1252{\fonttbl{\f0\froman\fcharset0\fprq0 Courier New;}{\f1\froman\fcharset0\fprq0 Times;}}{\colortbl;\red51\green51\blue51;\red211\green211\blue211;}
      
      \paperw12240\paperh15840\widowctrl\ftnbj\fet0\sectd\linex0
      \lndscpsxn
      \margl1440\margr1440\margt1440\margb1440
      \headery720\footery720\fs20
      
      \trowd\trrh0\trhdr
      
      \pard\plain\uc0\qc\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx9360
      \intbl {\f0\cf1 {\f0\fs20 Data listing from {\b exibble}} {\f0\fs20\i\super } \line {\f0\fs20 {\f1 exibble} is an R dataset} {\f0\fs20\i\super }}\cell
      
      \row
      
      \trowd\trrh0\trhdr
      
      \pard\plain\uc0\qc\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx1040
      \intbl {\f0 {\f0\fs20 }}\cell
      
      \pard\plain\uc0\qc\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx2080
      \intbl {\f0 {\f0\fs20 }}\cell
      
      \pard\plain\uc0\qc\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx3120
      \intbl {\f0 {\f0\fs20 }}\cell
      
      \pard\plain\uc0\qc\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx4160
      \intbl {\f0 {\f0\fs20 }}\cell
      
      \pard\plain\uc0\qc\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85\clbrdrb\brdrs\brdrw20\brdrcf2\clmgf \cellx5200
      \intbl {\f0 {\f0\fs20 timing}}\cell
      
      \pard\plain\uc0\qc\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85\clmrg \cellx6240
      \intbl {\f0 {\f0\fs20 }}\cell
      
      \pard\plain\uc0\qc\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85\clmrg \cellx7280
      \intbl {\f0 {\f0\fs20 }}\cell
      
      \pard\plain\uc0\qc\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx8320
      \intbl {\f0 {\f0\fs20 }}\cell
      
      \pard\plain\uc0\qc\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx9360
      \intbl {\f0 {\f0\fs20 }}\cell
      
      \row
      
      \trowd\trrh0\trhdr
      
      \pard\plain\uc0\ql\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85\clbrdrb\brdrs\brdrw20\brdrcf2 \cellx1040
      \intbl {\f0 {\f0\fs20 S.L.}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85\clbrdrb\brdrs\brdrw20\brdrcf2 \cellx2080
      \intbl {\f0 {\f0\fs20 num}}\cell
      
      \pard\plain\uc0\ql\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85\clbrdrb\brdrs\brdrw20\brdrcf2 \cellx3120
      \intbl {\f0 {\f0\fs20 char}}\cell
      
      \pard\plain\uc0\qc\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85\clbrdrb\brdrs\brdrw20\brdrcf2 \cellx4160
      \intbl {\f0 {\f0\fs20 fctr}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85\clbrdrb\brdrs\brdrw20\brdrcf2 \cellx5200
      \intbl {\f0 {\f0\fs20 date}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85\clbrdrb\brdrs\brdrw20\brdrcf2 \cellx6240
      \intbl {\f0 {\f0\fs20 time}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85\clbrdrb\brdrs\brdrw20\brdrcf2 \cellx7280
      \intbl {\f0 {\f0\fs20 datetime}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85\clbrdrb\brdrs\brdrw20\brdrcf2 \cellx8320
      \intbl {\f0 {\f0\fs20 currency}}\cell
      
      \pard\plain\uc0\ql\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85\clbrdrb\brdrs\brdrw20\brdrcf2 \cellx9360
      \intbl {\f0 {\f0\fs20 group}}\cell
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\ql\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx1040
      \intbl {\f0 {\f0\fs20 row_1}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx2080
      \intbl {\f0 {\f0\fs20 1.111e-01}}\cell
      
      \pard\plain\uc0\ql\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx3120
      \intbl {\f0 {\f0\fs20 apricot}}\cell
      
      \pard\plain\uc0\qc\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx4160
      \intbl {\f0 {\f0\fs20 one}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx5200
      \intbl {\f0 {\f0\fs20 2015-01-15}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx6240
      \intbl {\f0 {\f0\fs20 13:35}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx7280
      \intbl {\f0 {\f0\fs20 2018-01-01 02:22}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx8320
      \intbl {\f0 {\f0\fs20 49.950}}\cell
      
      \pard\plain\uc0\ql\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx9360
      \intbl {\f0 {\f0\fs20 grp_a}}\cell
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\ql\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx1040
      \intbl {\f0 {\f0\fs20 row_2}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx2080
      \intbl {\f0 {\f0\fs20 2.222e+00}}\cell
      
      \pard\plain\uc0\ql\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx3120
      \intbl {\f0 {\f0\fs20 banana}}\cell
      
      \pard\plain\uc0\qc\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx4160
      \intbl {\f0 {\f0\fs20 two}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx5200
      \intbl {\f0 {\f0\fs20 2015-02-15}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx6240
      \intbl {\f0 {\f0\fs20 14:40}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx7280
      \intbl {\f0 {\f0\fs20 2018-02-02 14:33}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx8320
      \intbl {\f0 {\f0\fs20 17.950}}\cell
      
      \pard\plain\uc0\ql\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx9360
      \intbl {\f0 {\f0\fs20 grp_a}}\cell
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\ql\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx1040
      \intbl {\f0 {\f0\fs20 row_3}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx2080
      \intbl {\f0 {\f0\fs20 3.333e+01}}\cell
      
      \pard\plain\uc0\ql\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx3120
      \intbl {\f0 {\f0\fs20 coconut}}\cell
      
      \pard\plain\uc0\qc\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx4160
      \intbl {\f0 {\f0\fs20 three}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx5200
      \intbl {\f0 {\f0\fs20 2015-03-15}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx6240
      \intbl {\f0 {\f0\fs20 15:45}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx7280
      \intbl {\f0 {\f0\fs20 2018-03-03 03:44}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx8320
      \intbl {\f0 {\f0\fs20 1.390}}\cell
      
      \pard\plain\uc0\ql\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx9360
      \intbl {\f0 {\f0\fs20 grp_a}}\cell
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\ql\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx1040
      \intbl {\f0 {\f0\fs20 row_4}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx2080
      \intbl {\f0 {\f0\fs20 4.444e+02}}\cell
      
      \pard\plain\uc0\ql\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx3120
      \intbl {\f0 {\f0\fs20 durian}}\cell
      
      \pard\plain\uc0\qc\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx4160
      \intbl {\f0 {\f0\fs20 four}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx5200
      \intbl {\f0 {\f0\fs20 2015-04-15}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx6240
      \intbl {\f0 {\f0\fs20 16:50}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx7280
      \intbl {\f0 {\f0\fs20 2018-04-04 15:55}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx8320
      \intbl {\f0 {\f0\fs20 65100.000}}\cell
      
      \pard\plain\uc0\ql\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx9360
      \intbl {\f0 {\f0\fs20 grp_a}}\cell
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\ql\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx1040
      \intbl {\f0 {\f0\fs20 row_5}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx2080
      \intbl {\f0 {\f0\fs20 5.550e+03}}\cell
      
      \pard\plain\uc0\ql\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx3120
      \intbl {\f0 {\f0\fs20 NA}}\cell
      
      \pard\plain\uc0\qc\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx4160
      \intbl {\f0 {\f0\fs20 five}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx5200
      \intbl {\f0 {\f0\fs20 2015-05-15}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx6240
      \intbl {\f0 {\f0\fs20 17:55}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx7280
      \intbl {\f0 {\f0\fs20 2018-05-05 04:00}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx8320
      \intbl {\f0 {\f0\fs20 1325.810}}\cell
      
      \pard\plain\uc0\ql\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx9360
      \intbl {\f0 {\f0\fs20 grp_b}}\cell
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\ql\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx1040
      \intbl {\f0 {\f0\fs20 row_6}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx2080
      \intbl {\f0 {\f0\fs20 NA}}\cell
      
      \pard\plain\uc0\ql\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx3120
      \intbl {\f0 {\f0\fs20 fig}}\cell
      
      \pard\plain\uc0\qc\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx4160
      \intbl {\f0 {\f0\fs20 six}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx5200
      \intbl {\f0 {\f0\fs20 2015-06-15}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx6240
      \intbl {\f0 {\f0\fs20 NA}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx7280
      \intbl {\f0 {\f0\fs20 2018-06-06 16:11}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx8320
      \intbl {\f0 {\f0\fs20 13.255}}\cell
      
      \pard\plain\uc0\ql\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx9360
      \intbl {\f0 {\f0\fs20 grp_b}}\cell
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\ql\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx1040
      \intbl {\f0 {\f0\fs20 row_7}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx2080
      \intbl {\f0 {\f0\fs20 7.770e+05}}\cell
      
      \pard\plain\uc0\ql\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx3120
      \intbl {\f0 {\f0\fs20 grapefruit}}\cell
      
      \pard\plain\uc0\qc\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx4160
      \intbl {\f0 {\f0\fs20 seven}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx5200
      \intbl {\f0 {\f0\fs20 NA}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx6240
      \intbl {\f0 {\f0\fs20 19:10}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx7280
      \intbl {\f0 {\f0\fs20 2018-07-07 05:22}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx8320
      \intbl {\f0 {\f0\fs20 NA}}\cell
      
      \pard\plain\uc0\ql\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx9360
      \intbl {\f0 {\f0\fs20 grp_b}}\cell
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\ql\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx1040
      \intbl {\f0 {\f0\fs20 row_8}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx2080
      \intbl {\f0 {\f0\fs20 8.880e+06}}\cell
      
      \pard\plain\uc0\ql\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx3120
      \intbl {\f0 {\f0\fs20 honeydew}}\cell
      
      \pard\plain\uc0\qc\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx4160
      \intbl {\f0 {\f0\fs20 eight}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx5200
      \intbl {\f0 {\f0\fs20 2015-08-15}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx6240
      \intbl {\f0 {\f0\fs20 20:20}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx7280
      \intbl {\f0 {\f0\fs20 NA}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx8320
      \intbl {\f0 {\f0\fs20 0.440}}\cell
      
      \pard\plain\uc0\ql\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx9360
      \intbl {\f0 {\f0\fs20 grp_b}}\cell
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\ql\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx9360
      \intbl {\f0 {\f0\fs20 Source note #1\line Source note #2}}\cell
      
      \row
      
      }

---

    Code
      cat(render_as_html(gt_tbl))
    Output
      <table class="gt_table" data-quarto-disable-processing="false" data-quarto-bootstrap="false">
        <thead>
          <tr class="gt_heading">
            <td colspan="9" class="gt_heading gt_title gt_font_normal" style><span class='gt_from_md'>Data listing from <strong>exibble</strong></span></td>
          </tr>
          <tr class="gt_heading">
            <td colspan="9" class="gt_heading gt_subtitle gt_font_normal gt_bottom_border" style><span class='gt_from_md'><code>exibble</code> is an R dataset</span></td>
          </tr>
          <tr class="gt_col_headings gt_spanner_row">
            <th class="gt_col_heading gt_columns_bottom_border gt_left" rowspan="2" colspan="1" scope="col" id="a::stub">S.L.</th>
            <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="2" colspan="1" scope="col" id="num">num</th>
            <th class="gt_col_heading gt_columns_bottom_border gt_left" rowspan="2" colspan="1" scope="col" id="char">char</th>
            <th class="gt_col_heading gt_columns_bottom_border gt_center" rowspan="2" colspan="1" scope="col" id="fctr">fctr</th>
            <th class="gt_center gt_columns_top_border gt_column_spanner_outer" rowspan="1" colspan="3" scope="colgroup" id="timing">
              <div class="gt_column_spanner">timing</div>
            </th>
            <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="2" colspan="1" scope="col" id="currency">currency</th>
            <th class="gt_col_heading gt_columns_bottom_border gt_left" rowspan="2" colspan="1" scope="col" id="group">group</th>
          </tr>
          <tr class="gt_col_headings">
            <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id="date">date</th>
            <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id="time">time</th>
            <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id="datetime">datetime</th>
          </tr>
        </thead>
        <tbody class="gt_table_body">
          <tr><th id="stub_1_1" scope="row" class="gt_row gt_left gt_stub">row_1</th>
      <td headers="stub_1_1 num" class="gt_row gt_right">1.111e-01</td>
      <td headers="stub_1_1 char" class="gt_row gt_left">apricot</td>
      <td headers="stub_1_1 fctr" class="gt_row gt_center">one</td>
      <td headers="stub_1_1 date" class="gt_row gt_right">2015-01-15</td>
      <td headers="stub_1_1 time" class="gt_row gt_right">13:35</td>
      <td headers="stub_1_1 datetime" class="gt_row gt_right">2018-01-01 02:22</td>
      <td headers="stub_1_1 currency" class="gt_row gt_right">49.950</td>
      <td headers="stub_1_1 group" class="gt_row gt_left">grp_a</td></tr>
          <tr><th id="stub_1_2" scope="row" class="gt_row gt_left gt_stub">row_2</th>
      <td headers="stub_1_2 num" class="gt_row gt_right">2.222e+00</td>
      <td headers="stub_1_2 char" class="gt_row gt_left">banana</td>
      <td headers="stub_1_2 fctr" class="gt_row gt_center">two</td>
      <td headers="stub_1_2 date" class="gt_row gt_right">2015-02-15</td>
      <td headers="stub_1_2 time" class="gt_row gt_right">14:40</td>
      <td headers="stub_1_2 datetime" class="gt_row gt_right">2018-02-02 14:33</td>
      <td headers="stub_1_2 currency" class="gt_row gt_right">17.950</td>
      <td headers="stub_1_2 group" class="gt_row gt_left">grp_a</td></tr>
          <tr><th id="stub_1_3" scope="row" class="gt_row gt_left gt_stub">row_3</th>
      <td headers="stub_1_3 num" class="gt_row gt_right">3.333e+01</td>
      <td headers="stub_1_3 char" class="gt_row gt_left">coconut</td>
      <td headers="stub_1_3 fctr" class="gt_row gt_center">three</td>
      <td headers="stub_1_3 date" class="gt_row gt_right">2015-03-15</td>
      <td headers="stub_1_3 time" class="gt_row gt_right">15:45</td>
      <td headers="stub_1_3 datetime" class="gt_row gt_right">2018-03-03 03:44</td>
      <td headers="stub_1_3 currency" class="gt_row gt_right">1.390</td>
      <td headers="stub_1_3 group" class="gt_row gt_left">grp_a</td></tr>
          <tr><th id="stub_1_4" scope="row" class="gt_row gt_left gt_stub">row_4</th>
      <td headers="stub_1_4 num" class="gt_row gt_right">4.444e+02</td>
      <td headers="stub_1_4 char" class="gt_row gt_left">durian</td>
      <td headers="stub_1_4 fctr" class="gt_row gt_center">four</td>
      <td headers="stub_1_4 date" class="gt_row gt_right">2015-04-15</td>
      <td headers="stub_1_4 time" class="gt_row gt_right">16:50</td>
      <td headers="stub_1_4 datetime" class="gt_row gt_right">2018-04-04 15:55</td>
      <td headers="stub_1_4 currency" class="gt_row gt_right">65100.000</td>
      <td headers="stub_1_4 group" class="gt_row gt_left">grp_a</td></tr>
          <tr><th id="stub_1_5" scope="row" class="gt_row gt_left gt_stub">row_5</th>
      <td headers="stub_1_5 num" class="gt_row gt_right">5.550e+03</td>
      <td headers="stub_1_5 char" class="gt_row gt_left">NA</td>
      <td headers="stub_1_5 fctr" class="gt_row gt_center">five</td>
      <td headers="stub_1_5 date" class="gt_row gt_right">2015-05-15</td>
      <td headers="stub_1_5 time" class="gt_row gt_right">17:55</td>
      <td headers="stub_1_5 datetime" class="gt_row gt_right">2018-05-05 04:00</td>
      <td headers="stub_1_5 currency" class="gt_row gt_right">1325.810</td>
      <td headers="stub_1_5 group" class="gt_row gt_left">grp_b</td></tr>
          <tr><th id="stub_1_6" scope="row" class="gt_row gt_left gt_stub">row_6</th>
      <td headers="stub_1_6 num" class="gt_row gt_right">NA</td>
      <td headers="stub_1_6 char" class="gt_row gt_left">fig</td>
      <td headers="stub_1_6 fctr" class="gt_row gt_center">six</td>
      <td headers="stub_1_6 date" class="gt_row gt_right">2015-06-15</td>
      <td headers="stub_1_6 time" class="gt_row gt_right">NA</td>
      <td headers="stub_1_6 datetime" class="gt_row gt_right">2018-06-06 16:11</td>
      <td headers="stub_1_6 currency" class="gt_row gt_right">13.255</td>
      <td headers="stub_1_6 group" class="gt_row gt_left">grp_b</td></tr>
          <tr><th id="stub_1_7" scope="row" class="gt_row gt_left gt_stub">row_7</th>
      <td headers="stub_1_7 num" class="gt_row gt_right">7.770e+05</td>
      <td headers="stub_1_7 char" class="gt_row gt_left">grapefruit</td>
      <td headers="stub_1_7 fctr" class="gt_row gt_center">seven</td>
      <td headers="stub_1_7 date" class="gt_row gt_right">NA</td>
      <td headers="stub_1_7 time" class="gt_row gt_right">19:10</td>
      <td headers="stub_1_7 datetime" class="gt_row gt_right">2018-07-07 05:22</td>
      <td headers="stub_1_7 currency" class="gt_row gt_right">NA</td>
      <td headers="stub_1_7 group" class="gt_row gt_left">grp_b</td></tr>
          <tr><th id="stub_1_8" scope="row" class="gt_row gt_left gt_stub">row_8</th>
      <td headers="stub_1_8 num" class="gt_row gt_right">8.880e+06</td>
      <td headers="stub_1_8 char" class="gt_row gt_left">honeydew</td>
      <td headers="stub_1_8 fctr" class="gt_row gt_center">eight</td>
      <td headers="stub_1_8 date" class="gt_row gt_right">2015-08-15</td>
      <td headers="stub_1_8 time" class="gt_row gt_right">20:20</td>
      <td headers="stub_1_8 datetime" class="gt_row gt_right">NA</td>
      <td headers="stub_1_8 currency" class="gt_row gt_right">0.440</td>
      <td headers="stub_1_8 group" class="gt_row gt_left">grp_b</td></tr>
        </tbody>
        <tfoot>
          <tr class="gt_sourcenotes">
            <td class="gt_sourcenote" colspan="9">Source note #1</td>
          </tr>
          <tr class="gt_sourcenotes">
            <td class="gt_sourcenote" colspan="9">Source note #2</td>
          </tr>
        </tfoot>
      </table>

---

    Code
      as.character(as_latex(gt_tbl))
    Output
      [1] "\\begingroup\n\\fontsize{12.0pt}{14.0pt}\\selectfont\n\\setlength{\\LTpost}{0mm}\n\\begin{longtable}{l|rlcrrrrl}\n\\caption*{\n{\\fontsize{20}{25}\\selectfont  Data listing from \\textbf{exibble}\\fontsize{12}{15}\\selectfont } \\\\ \n{\\fontsize{14}{17}\\selectfont  \\texttt{exibble} is an R dataset\\fontsize{12}{15}\\selectfont }\n} \\\\ \n\\toprule\n &  &  &  & \\multicolumn{3}{c}{timing} &  &  \\\\ \n\\cmidrule(lr){5-7}\nS.L. & num & char & fctr & date & time & datetime & currency & group \\\\ \n\\midrule\\addlinespace[2.5pt]\nrow\\_1 & 1.111e-01 & apricot & one & 2015-01-15 & 13:35 & 2018-01-01 02:22 & 49.950 & grp\\_a \\\\ \nrow\\_2 & 2.222e+00 & banana & two & 2015-02-15 & 14:40 & 2018-02-02 14:33 & 17.950 & grp\\_a \\\\ \nrow\\_3 & 3.333e+01 & coconut & three & 2015-03-15 & 15:45 & 2018-03-03 03:44 & 1.390 & grp\\_a \\\\ \nrow\\_4 & 4.444e+02 & durian & four & 2015-04-15 & 16:50 & 2018-04-04 15:55 & 65100.000 & grp\\_a \\\\ \nrow\\_5 & 5.550e+03 & NA & five & 2015-05-15 & 17:55 & 2018-05-05 04:00 & 1325.810 & grp\\_b \\\\ \nrow\\_6 & NA & fig & six & 2015-06-15 & NA & 2018-06-06 16:11 & 13.255 & grp\\_b \\\\ \nrow\\_7 & 7.770e+05 & grapefruit & seven & NA & 19:10 & 2018-07-07 05:22 & NA & grp\\_b \\\\ \nrow\\_8 & 8.880e+06 & honeydew & eight & 2015-08-15 & 20:20 & NA & 0.440 & grp\\_b \\\\ \n\\bottomrule\n\\end{longtable}\n\\begin{minipage}{\\linewidth}\n\\vspace{.05em}\nSource note \\#1\\\\\nSource note \\#2\\\\\n\\end{minipage}\n\\endgroup\n"

---

    Code
      as_rtf(gt_tbl)
    Output
      {\rtf\ansi\ansicpg1252{\fonttbl{\f0\froman\fcharset0\fprq0 Courier New;}{\f1\froman\fcharset0\fprq0 Times;}}{\colortbl;\red51\green51\blue51;\red211\green211\blue211;}
      
      \paperw12240\paperh15840\widowctrl\ftnbj\fet0\sectd\linex0
      \lndscpsxn
      \margl1440\margr1440\margt1440\margb1440
      \headery720\footery720\fs20
      
      \trowd\trrh0\trhdr
      
      \pard\plain\uc0\qc\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx9360
      \intbl {\f0\cf1 {\f0\fs20 Data listing from {\b exibble}} {\f0\fs20\i\super } \line {\f0\fs20 {\f1 exibble} is an R dataset} {\f0\fs20\i\super }}\cell
      
      \row
      
      \trowd\trrh0\trhdr
      
      \pard\plain\uc0\qc\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx1040
      \intbl {\f0 {\f0\fs20 }}\cell
      
      \pard\plain\uc0\qc\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx2080
      \intbl {\f0 {\f0\fs20 }}\cell
      
      \pard\plain\uc0\qc\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx3120
      \intbl {\f0 {\f0\fs20 }}\cell
      
      \pard\plain\uc0\qc\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx4160
      \intbl {\f0 {\f0\fs20 }}\cell
      
      \pard\plain\uc0\qc\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85\clbrdrb\brdrs\brdrw20\brdrcf2\clmgf \cellx5200
      \intbl {\f0 {\f0\fs20 timing}}\cell
      
      \pard\plain\uc0\qc\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85\clmrg \cellx6240
      \intbl {\f0 {\f0\fs20 }}\cell
      
      \pard\plain\uc0\qc\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85\clmrg \cellx7280
      \intbl {\f0 {\f0\fs20 }}\cell
      
      \pard\plain\uc0\qc\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx8320
      \intbl {\f0 {\f0\fs20 }}\cell
      
      \pard\plain\uc0\qc\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx9360
      \intbl {\f0 {\f0\fs20 }}\cell
      
      \row
      
      \trowd\trrh0\trhdr
      
      \pard\plain\uc0\ql\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85\clbrdrb\brdrs\brdrw20\brdrcf2 \cellx1040
      \intbl {\f0 {\f0\fs20 S.L.}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85\clbrdrb\brdrs\brdrw20\brdrcf2 \cellx2080
      \intbl {\f0 {\f0\fs20 num}}\cell
      
      \pard\plain\uc0\ql\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85\clbrdrb\brdrs\brdrw20\brdrcf2 \cellx3120
      \intbl {\f0 {\f0\fs20 char}}\cell
      
      \pard\plain\uc0\qc\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85\clbrdrb\brdrs\brdrw20\brdrcf2 \cellx4160
      \intbl {\f0 {\f0\fs20 fctr}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85\clbrdrb\brdrs\brdrw20\brdrcf2 \cellx5200
      \intbl {\f0 {\f0\fs20 date}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85\clbrdrb\brdrs\brdrw20\brdrcf2 \cellx6240
      \intbl {\f0 {\f0\fs20 time}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85\clbrdrb\brdrs\brdrw20\brdrcf2 \cellx7280
      \intbl {\f0 {\f0\fs20 datetime}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85\clbrdrb\brdrs\brdrw20\brdrcf2 \cellx8320
      \intbl {\f0 {\f0\fs20 currency}}\cell
      
      \pard\plain\uc0\ql\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85\clbrdrb\brdrs\brdrw20\brdrcf2 \cellx9360
      \intbl {\f0 {\f0\fs20 group}}\cell
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\ql\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx1040
      \intbl {\f0 {\f0\fs20 row_1}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx2080
      \intbl {\f0 {\f0\fs20 1.111e-01}}\cell
      
      \pard\plain\uc0\ql\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx3120
      \intbl {\f0 {\f0\fs20 apricot}}\cell
      
      \pard\plain\uc0\qc\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx4160
      \intbl {\f0 {\f0\fs20 one}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx5200
      \intbl {\f0 {\f0\fs20 2015-01-15}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx6240
      \intbl {\f0 {\f0\fs20 13:35}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx7280
      \intbl {\f0 {\f0\fs20 2018-01-01 02:22}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx8320
      \intbl {\f0 {\f0\fs20 49.950}}\cell
      
      \pard\plain\uc0\ql\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx9360
      \intbl {\f0 {\f0\fs20 grp_a}}\cell
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\ql\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx1040
      \intbl {\f0 {\f0\fs20 row_2}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx2080
      \intbl {\f0 {\f0\fs20 2.222e+00}}\cell
      
      \pard\plain\uc0\ql\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx3120
      \intbl {\f0 {\f0\fs20 banana}}\cell
      
      \pard\plain\uc0\qc\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx4160
      \intbl {\f0 {\f0\fs20 two}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx5200
      \intbl {\f0 {\f0\fs20 2015-02-15}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx6240
      \intbl {\f0 {\f0\fs20 14:40}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx7280
      \intbl {\f0 {\f0\fs20 2018-02-02 14:33}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx8320
      \intbl {\f0 {\f0\fs20 17.950}}\cell
      
      \pard\plain\uc0\ql\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx9360
      \intbl {\f0 {\f0\fs20 grp_a}}\cell
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\ql\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx1040
      \intbl {\f0 {\f0\fs20 row_3}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx2080
      \intbl {\f0 {\f0\fs20 3.333e+01}}\cell
      
      \pard\plain\uc0\ql\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx3120
      \intbl {\f0 {\f0\fs20 coconut}}\cell
      
      \pard\plain\uc0\qc\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx4160
      \intbl {\f0 {\f0\fs20 three}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx5200
      \intbl {\f0 {\f0\fs20 2015-03-15}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx6240
      \intbl {\f0 {\f0\fs20 15:45}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx7280
      \intbl {\f0 {\f0\fs20 2018-03-03 03:44}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx8320
      \intbl {\f0 {\f0\fs20 1.390}}\cell
      
      \pard\plain\uc0\ql\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx9360
      \intbl {\f0 {\f0\fs20 grp_a}}\cell
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\ql\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx1040
      \intbl {\f0 {\f0\fs20 row_4}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx2080
      \intbl {\f0 {\f0\fs20 4.444e+02}}\cell
      
      \pard\plain\uc0\ql\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx3120
      \intbl {\f0 {\f0\fs20 durian}}\cell
      
      \pard\plain\uc0\qc\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx4160
      \intbl {\f0 {\f0\fs20 four}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx5200
      \intbl {\f0 {\f0\fs20 2015-04-15}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx6240
      \intbl {\f0 {\f0\fs20 16:50}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx7280
      \intbl {\f0 {\f0\fs20 2018-04-04 15:55}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx8320
      \intbl {\f0 {\f0\fs20 65100.000}}\cell
      
      \pard\plain\uc0\ql\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx9360
      \intbl {\f0 {\f0\fs20 grp_a}}\cell
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\ql\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx1040
      \intbl {\f0 {\f0\fs20 row_5}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx2080
      \intbl {\f0 {\f0\fs20 5.550e+03}}\cell
      
      \pard\plain\uc0\ql\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx3120
      \intbl {\f0 {\f0\fs20 NA}}\cell
      
      \pard\plain\uc0\qc\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx4160
      \intbl {\f0 {\f0\fs20 five}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx5200
      \intbl {\f0 {\f0\fs20 2015-05-15}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx6240
      \intbl {\f0 {\f0\fs20 17:55}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx7280
      \intbl {\f0 {\f0\fs20 2018-05-05 04:00}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx8320
      \intbl {\f0 {\f0\fs20 1325.810}}\cell
      
      \pard\plain\uc0\ql\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx9360
      \intbl {\f0 {\f0\fs20 grp_b}}\cell
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\ql\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx1040
      \intbl {\f0 {\f0\fs20 row_6}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx2080
      \intbl {\f0 {\f0\fs20 NA}}\cell
      
      \pard\plain\uc0\ql\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx3120
      \intbl {\f0 {\f0\fs20 fig}}\cell
      
      \pard\plain\uc0\qc\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx4160
      \intbl {\f0 {\f0\fs20 six}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx5200
      \intbl {\f0 {\f0\fs20 2015-06-15}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx6240
      \intbl {\f0 {\f0\fs20 NA}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx7280
      \intbl {\f0 {\f0\fs20 2018-06-06 16:11}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx8320
      \intbl {\f0 {\f0\fs20 13.255}}\cell
      
      \pard\plain\uc0\ql\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx9360
      \intbl {\f0 {\f0\fs20 grp_b}}\cell
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\ql\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx1040
      \intbl {\f0 {\f0\fs20 row_7}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx2080
      \intbl {\f0 {\f0\fs20 7.770e+05}}\cell
      
      \pard\plain\uc0\ql\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx3120
      \intbl {\f0 {\f0\fs20 grapefruit}}\cell
      
      \pard\plain\uc0\qc\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx4160
      \intbl {\f0 {\f0\fs20 seven}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx5200
      \intbl {\f0 {\f0\fs20 NA}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx6240
      \intbl {\f0 {\f0\fs20 19:10}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx7280
      \intbl {\f0 {\f0\fs20 2018-07-07 05:22}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx8320
      \intbl {\f0 {\f0\fs20 NA}}\cell
      
      \pard\plain\uc0\ql\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx9360
      \intbl {\f0 {\f0\fs20 grp_b}}\cell
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\ql\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx1040
      \intbl {\f0 {\f0\fs20 row_8}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx2080
      \intbl {\f0 {\f0\fs20 8.880e+06}}\cell
      
      \pard\plain\uc0\ql\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx3120
      \intbl {\f0 {\f0\fs20 honeydew}}\cell
      
      \pard\plain\uc0\qc\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx4160
      \intbl {\f0 {\f0\fs20 eight}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx5200
      \intbl {\f0 {\f0\fs20 2015-08-15}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx6240
      \intbl {\f0 {\f0\fs20 20:20}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx7280
      \intbl {\f0 {\f0\fs20 NA}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx8320
      \intbl {\f0 {\f0\fs20 0.440}}\cell
      
      \pard\plain\uc0\ql\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx9360
      \intbl {\f0 {\f0\fs20 grp_b}}\cell
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\ql\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx9360
      \intbl {\f0 {\f0\fs20 Source note #1\line Source note #2}}\cell
      
      \row
      
      }

---

    Code
      cat(render_as_html(gt_tbl))
    Output
      <table class="gt_table" data-quarto-disable-processing="false" data-quarto-bootstrap="false">
        <thead>
          <tr class="gt_heading">
            <td colspan="8" class="gt_heading gt_title gt_font_normal" style><span class='gt_from_md'>Data listing from <strong>exibble</strong></span></td>
          </tr>
          <tr class="gt_heading">
            <td colspan="8" class="gt_heading gt_subtitle gt_font_normal gt_bottom_border" style><span class='gt_from_md'><code>exibble</code> is an R dataset</span></td>
          </tr>
          <tr class="gt_col_headings gt_spanner_row">
            <th class="gt_col_heading gt_columns_bottom_border gt_left" rowspan="2" colspan="1" scope="col" id="a::stub">S.L.</th>
            <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="2" colspan="1" scope="col" id="num">num</th>
            <th class="gt_col_heading gt_columns_bottom_border gt_left" rowspan="2" colspan="1" scope="col" id="char">char</th>
            <th class="gt_col_heading gt_columns_bottom_border gt_center" rowspan="2" colspan="1" scope="col" id="fctr">fctr</th>
            <th class="gt_center gt_columns_top_border gt_column_spanner_outer" rowspan="1" colspan="3" scope="colgroup" id="timing">
              <div class="gt_column_spanner">timing</div>
            </th>
            <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="2" colspan="1" scope="col" id="currency">currency</th>
          </tr>
          <tr class="gt_col_headings">
            <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id="date">date</th>
            <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id="time">time</th>
            <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id="datetime">datetime</th>
          </tr>
        </thead>
        <tbody class="gt_table_body">
          <tr class="gt_group_heading_row">
            <th colspan="8" class="gt_group_heading" scope="colgroup" id="grp_a">grp_a</th>
          </tr>
          <tr class="gt_row_group_first"><th id="stub_1_1" scope="row" class="gt_row gt_left gt_stub">row_1</th>
      <td headers="grp_a stub_1_1 num" class="gt_row gt_right">1.111e-01</td>
      <td headers="grp_a stub_1_1 char" class="gt_row gt_left">apricot</td>
      <td headers="grp_a stub_1_1 fctr" class="gt_row gt_center">one</td>
      <td headers="grp_a stub_1_1 date" class="gt_row gt_right">2015-01-15</td>
      <td headers="grp_a stub_1_1 time" class="gt_row gt_right">13:35</td>
      <td headers="grp_a stub_1_1 datetime" class="gt_row gt_right">2018-01-01 02:22</td>
      <td headers="grp_a stub_1_1 currency" class="gt_row gt_right">49.950</td></tr>
          <tr><th id="stub_1_2" scope="row" class="gt_row gt_left gt_stub">row_2</th>
      <td headers="grp_a stub_1_2 num" class="gt_row gt_right">2.222e+00</td>
      <td headers="grp_a stub_1_2 char" class="gt_row gt_left">banana</td>
      <td headers="grp_a stub_1_2 fctr" class="gt_row gt_center">two</td>
      <td headers="grp_a stub_1_2 date" class="gt_row gt_right">2015-02-15</td>
      <td headers="grp_a stub_1_2 time" class="gt_row gt_right">14:40</td>
      <td headers="grp_a stub_1_2 datetime" class="gt_row gt_right">2018-02-02 14:33</td>
      <td headers="grp_a stub_1_2 currency" class="gt_row gt_right">17.950</td></tr>
          <tr><th id="stub_1_3" scope="row" class="gt_row gt_left gt_stub">row_3</th>
      <td headers="grp_a stub_1_3 num" class="gt_row gt_right">3.333e+01</td>
      <td headers="grp_a stub_1_3 char" class="gt_row gt_left">coconut</td>
      <td headers="grp_a stub_1_3 fctr" class="gt_row gt_center">three</td>
      <td headers="grp_a stub_1_3 date" class="gt_row gt_right">2015-03-15</td>
      <td headers="grp_a stub_1_3 time" class="gt_row gt_right">15:45</td>
      <td headers="grp_a stub_1_3 datetime" class="gt_row gt_right">2018-03-03 03:44</td>
      <td headers="grp_a stub_1_3 currency" class="gt_row gt_right">1.390</td></tr>
          <tr><th id="stub_1_4" scope="row" class="gt_row gt_left gt_stub">row_4</th>
      <td headers="grp_a stub_1_4 num" class="gt_row gt_right">4.444e+02</td>
      <td headers="grp_a stub_1_4 char" class="gt_row gt_left">durian</td>
      <td headers="grp_a stub_1_4 fctr" class="gt_row gt_center">four</td>
      <td headers="grp_a stub_1_4 date" class="gt_row gt_right">2015-04-15</td>
      <td headers="grp_a stub_1_4 time" class="gt_row gt_right">16:50</td>
      <td headers="grp_a stub_1_4 datetime" class="gt_row gt_right">2018-04-04 15:55</td>
      <td headers="grp_a stub_1_4 currency" class="gt_row gt_right">65100.000</td></tr>
          <tr class="gt_group_heading_row">
            <th colspan="8" class="gt_group_heading" scope="colgroup" id="grp_b">grp_b</th>
          </tr>
          <tr class="gt_row_group_first"><th id="stub_1_5" scope="row" class="gt_row gt_left gt_stub">row_5</th>
      <td headers="grp_b stub_1_5 num" class="gt_row gt_right">5.550e+03</td>
      <td headers="grp_b stub_1_5 char" class="gt_row gt_left">NA</td>
      <td headers="grp_b stub_1_5 fctr" class="gt_row gt_center">five</td>
      <td headers="grp_b stub_1_5 date" class="gt_row gt_right">2015-05-15</td>
      <td headers="grp_b stub_1_5 time" class="gt_row gt_right">17:55</td>
      <td headers="grp_b stub_1_5 datetime" class="gt_row gt_right">2018-05-05 04:00</td>
      <td headers="grp_b stub_1_5 currency" class="gt_row gt_right">1325.810</td></tr>
          <tr><th id="stub_1_6" scope="row" class="gt_row gt_left gt_stub">row_6</th>
      <td headers="grp_b stub_1_6 num" class="gt_row gt_right">NA</td>
      <td headers="grp_b stub_1_6 char" class="gt_row gt_left">fig</td>
      <td headers="grp_b stub_1_6 fctr" class="gt_row gt_center">six</td>
      <td headers="grp_b stub_1_6 date" class="gt_row gt_right">2015-06-15</td>
      <td headers="grp_b stub_1_6 time" class="gt_row gt_right">NA</td>
      <td headers="grp_b stub_1_6 datetime" class="gt_row gt_right">2018-06-06 16:11</td>
      <td headers="grp_b stub_1_6 currency" class="gt_row gt_right">13.255</td></tr>
          <tr><th id="stub_1_7" scope="row" class="gt_row gt_left gt_stub">row_7</th>
      <td headers="grp_b stub_1_7 num" class="gt_row gt_right">7.770e+05</td>
      <td headers="grp_b stub_1_7 char" class="gt_row gt_left">grapefruit</td>
      <td headers="grp_b stub_1_7 fctr" class="gt_row gt_center">seven</td>
      <td headers="grp_b stub_1_7 date" class="gt_row gt_right">NA</td>
      <td headers="grp_b stub_1_7 time" class="gt_row gt_right">19:10</td>
      <td headers="grp_b stub_1_7 datetime" class="gt_row gt_right">2018-07-07 05:22</td>
      <td headers="grp_b stub_1_7 currency" class="gt_row gt_right">NA</td></tr>
          <tr><th id="stub_1_8" scope="row" class="gt_row gt_left gt_stub">row_8</th>
      <td headers="grp_b stub_1_8 num" class="gt_row gt_right">8.880e+06</td>
      <td headers="grp_b stub_1_8 char" class="gt_row gt_left">honeydew</td>
      <td headers="grp_b stub_1_8 fctr" class="gt_row gt_center">eight</td>
      <td headers="grp_b stub_1_8 date" class="gt_row gt_right">2015-08-15</td>
      <td headers="grp_b stub_1_8 time" class="gt_row gt_right">20:20</td>
      <td headers="grp_b stub_1_8 datetime" class="gt_row gt_right">NA</td>
      <td headers="grp_b stub_1_8 currency" class="gt_row gt_right">0.440</td></tr>
        </tbody>
        <tfoot>
          <tr class="gt_sourcenotes">
            <td class="gt_sourcenote" colspan="8">Source note #1</td>
          </tr>
          <tr class="gt_sourcenotes">
            <td class="gt_sourcenote" colspan="8">Source note #2</td>
          </tr>
        </tfoot>
      </table>

---

    Code
      as.character(as_latex(gt_tbl))
    Output
      [1] "\\begingroup\n\\fontsize{12.0pt}{14.0pt}\\selectfont\n\\setlength{\\LTpost}{0mm}\n\\begin{longtable}{l|rlcrrrr}\n\\caption*{\n{\\fontsize{20}{25}\\selectfont  Data listing from \\textbf{exibble}\\fontsize{12}{15}\\selectfont } \\\\ \n{\\fontsize{14}{17}\\selectfont  \\texttt{exibble} is an R dataset\\fontsize{12}{15}\\selectfont }\n} \\\\ \n\\toprule\n &  &  &  & \\multicolumn{3}{c}{timing} &  \\\\ \n\\cmidrule(lr){5-7}\nS.L. & num & char & fctr & date & time & datetime & currency \\\\ \n\\midrule\\addlinespace[2.5pt]\n\\multicolumn{8}{l}{grp\\_a} \\\\[2.5pt] \n\\midrule\\addlinespace[2.5pt]\nrow\\_1 & 1.111e-01 & apricot & one & 2015-01-15 & 13:35 & 2018-01-01 02:22 & 49.950 \\\\ \nrow\\_2 & 2.222e+00 & banana & two & 2015-02-15 & 14:40 & 2018-02-02 14:33 & 17.950 \\\\ \nrow\\_3 & 3.333e+01 & coconut & three & 2015-03-15 & 15:45 & 2018-03-03 03:44 & 1.390 \\\\ \nrow\\_4 & 4.444e+02 & durian & four & 2015-04-15 & 16:50 & 2018-04-04 15:55 & 65100.000 \\\\ \n\\midrule\\addlinespace[2.5pt]\n\\multicolumn{8}{l}{grp\\_b} \\\\[2.5pt] \n\\midrule\\addlinespace[2.5pt]\nrow\\_5 & 5.550e+03 & NA & five & 2015-05-15 & 17:55 & 2018-05-05 04:00 & 1325.810 \\\\ \nrow\\_6 & NA & fig & six & 2015-06-15 & NA & 2018-06-06 16:11 & 13.255 \\\\ \nrow\\_7 & 7.770e+05 & grapefruit & seven & NA & 19:10 & 2018-07-07 05:22 & NA \\\\ \nrow\\_8 & 8.880e+06 & honeydew & eight & 2015-08-15 & 20:20 & NA & 0.440 \\\\ \n\\bottomrule\n\\end{longtable}\n\\begin{minipage}{\\linewidth}\n\\vspace{.05em}\nSource note \\#1\\\\\nSource note \\#2\\\\\n\\end{minipage}\n\\endgroup\n"

---

    Code
      as_rtf(gt_tbl)
    Output
      {\rtf\ansi\ansicpg1252{\fonttbl{\f0\froman\fcharset0\fprq0 Courier New;}{\f1\froman\fcharset0\fprq0 Times;}}{\colortbl;\red51\green51\blue51;\red211\green211\blue211;}
      
      \paperw12240\paperh15840\widowctrl\ftnbj\fet0\sectd\linex0
      \lndscpsxn
      \margl1440\margr1440\margt1440\margb1440
      \headery720\footery720\fs20
      
      \trowd\trrh0\trhdr
      
      \pard\plain\uc0\qc\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx9360
      \intbl {\f0\cf1 {\f0\fs20 Data listing from {\b exibble}} {\f0\fs20\i\super } \line {\f0\fs20 {\f1 exibble} is an R dataset} {\f0\fs20\i\super }}\cell
      
      \row
      
      \trowd\trrh0\trhdr
      
      \pard\plain\uc0\qc\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx1170
      \intbl {\f0 {\f0\fs20 }}\cell
      
      \pard\plain\uc0\qc\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx2340
      \intbl {\f0 {\f0\fs20 }}\cell
      
      \pard\plain\uc0\qc\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx3510
      \intbl {\f0 {\f0\fs20 }}\cell
      
      \pard\plain\uc0\qc\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx4680
      \intbl {\f0 {\f0\fs20 }}\cell
      
      \pard\plain\uc0\qc\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85\clbrdrb\brdrs\brdrw20\brdrcf2\clmgf \cellx5850
      \intbl {\f0 {\f0\fs20 timing}}\cell
      
      \pard\plain\uc0\qc\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85\clmrg \cellx7020
      \intbl {\f0 {\f0\fs20 }}\cell
      
      \pard\plain\uc0\qc\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85\clmrg \cellx8190
      \intbl {\f0 {\f0\fs20 }}\cell
      
      \pard\plain\uc0\qc\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx9360
      \intbl {\f0 {\f0\fs20 }}\cell
      
      \row
      
      \trowd\trrh0\trhdr
      
      \pard\plain\uc0\ql\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85\clbrdrb\brdrs\brdrw20\brdrcf2 \cellx1170
      \intbl {\f0 {\f0\fs20 S.L.}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85\clbrdrb\brdrs\brdrw20\brdrcf2 \cellx2340
      \intbl {\f0 {\f0\fs20 num}}\cell
      
      \pard\plain\uc0\ql\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85\clbrdrb\brdrs\brdrw20\brdrcf2 \cellx3510
      \intbl {\f0 {\f0\fs20 char}}\cell
      
      \pard\plain\uc0\qc\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85\clbrdrb\brdrs\brdrw20\brdrcf2 \cellx4680
      \intbl {\f0 {\f0\fs20 fctr}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85\clbrdrb\brdrs\brdrw20\brdrcf2 \cellx5850
      \intbl {\f0 {\f0\fs20 date}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85\clbrdrb\brdrs\brdrw20\brdrcf2 \cellx7020
      \intbl {\f0 {\f0\fs20 time}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85\clbrdrb\brdrs\brdrw20\brdrcf2 \cellx8190
      \intbl {\f0 {\f0\fs20 datetime}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85\clbrdrb\brdrs\brdrw20\brdrcf2 \cellx9360
      \intbl {\f0 {\f0\fs20 currency}}\cell
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\ql\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx9360
      \intbl {\f0\fs20 grp_a}\cell
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\ql\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx1170
      \intbl {\f0 {\f0\fs20 row_1}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx2340
      \intbl {\f0 {\f0\fs20 1.111e-01}}\cell
      
      \pard\plain\uc0\ql\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx3510
      \intbl {\f0 {\f0\fs20 apricot}}\cell
      
      \pard\plain\uc0\qc\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx4680
      \intbl {\f0 {\f0\fs20 one}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx5850
      \intbl {\f0 {\f0\fs20 2015-01-15}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx7020
      \intbl {\f0 {\f0\fs20 13:35}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx8190
      \intbl {\f0 {\f0\fs20 2018-01-01 02:22}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx9360
      \intbl {\f0 {\f0\fs20 49.950}}\cell
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\ql\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx1170
      \intbl {\f0 {\f0\fs20 row_2}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx2340
      \intbl {\f0 {\f0\fs20 2.222e+00}}\cell
      
      \pard\plain\uc0\ql\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx3510
      \intbl {\f0 {\f0\fs20 banana}}\cell
      
      \pard\plain\uc0\qc\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx4680
      \intbl {\f0 {\f0\fs20 two}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx5850
      \intbl {\f0 {\f0\fs20 2015-02-15}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx7020
      \intbl {\f0 {\f0\fs20 14:40}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx8190
      \intbl {\f0 {\f0\fs20 2018-02-02 14:33}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx9360
      \intbl {\f0 {\f0\fs20 17.950}}\cell
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\ql\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx1170
      \intbl {\f0 {\f0\fs20 row_3}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx2340
      \intbl {\f0 {\f0\fs20 3.333e+01}}\cell
      
      \pard\plain\uc0\ql\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx3510
      \intbl {\f0 {\f0\fs20 coconut}}\cell
      
      \pard\plain\uc0\qc\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx4680
      \intbl {\f0 {\f0\fs20 three}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx5850
      \intbl {\f0 {\f0\fs20 2015-03-15}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx7020
      \intbl {\f0 {\f0\fs20 15:45}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx8190
      \intbl {\f0 {\f0\fs20 2018-03-03 03:44}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx9360
      \intbl {\f0 {\f0\fs20 1.390}}\cell
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\ql\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx1170
      \intbl {\f0 {\f0\fs20 row_4}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx2340
      \intbl {\f0 {\f0\fs20 4.444e+02}}\cell
      
      \pard\plain\uc0\ql\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx3510
      \intbl {\f0 {\f0\fs20 durian}}\cell
      
      \pard\plain\uc0\qc\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx4680
      \intbl {\f0 {\f0\fs20 four}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx5850
      \intbl {\f0 {\f0\fs20 2015-04-15}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx7020
      \intbl {\f0 {\f0\fs20 16:50}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx8190
      \intbl {\f0 {\f0\fs20 2018-04-04 15:55}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx9360
      \intbl {\f0 {\f0\fs20 65100.000}}\cell
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\ql\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx9360
      \intbl {\f0\fs20 grp_b}\cell
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\ql\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx1170
      \intbl {\f0 {\f0\fs20 row_5}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx2340
      \intbl {\f0 {\f0\fs20 5.550e+03}}\cell
      
      \pard\plain\uc0\ql\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx3510
      \intbl {\f0 {\f0\fs20 NA}}\cell
      
      \pard\plain\uc0\qc\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx4680
      \intbl {\f0 {\f0\fs20 five}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx5850
      \intbl {\f0 {\f0\fs20 2015-05-15}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx7020
      \intbl {\f0 {\f0\fs20 17:55}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx8190
      \intbl {\f0 {\f0\fs20 2018-05-05 04:00}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx9360
      \intbl {\f0 {\f0\fs20 1325.810}}\cell
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\ql\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx1170
      \intbl {\f0 {\f0\fs20 row_6}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx2340
      \intbl {\f0 {\f0\fs20 NA}}\cell
      
      \pard\plain\uc0\ql\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx3510
      \intbl {\f0 {\f0\fs20 fig}}\cell
      
      \pard\plain\uc0\qc\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx4680
      \intbl {\f0 {\f0\fs20 six}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx5850
      \intbl {\f0 {\f0\fs20 2015-06-15}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx7020
      \intbl {\f0 {\f0\fs20 NA}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx8190
      \intbl {\f0 {\f0\fs20 2018-06-06 16:11}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx9360
      \intbl {\f0 {\f0\fs20 13.255}}\cell
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\ql\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx1170
      \intbl {\f0 {\f0\fs20 row_7}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx2340
      \intbl {\f0 {\f0\fs20 7.770e+05}}\cell
      
      \pard\plain\uc0\ql\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx3510
      \intbl {\f0 {\f0\fs20 grapefruit}}\cell
      
      \pard\plain\uc0\qc\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx4680
      \intbl {\f0 {\f0\fs20 seven}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx5850
      \intbl {\f0 {\f0\fs20 NA}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx7020
      \intbl {\f0 {\f0\fs20 19:10}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx8190
      \intbl {\f0 {\f0\fs20 2018-07-07 05:22}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx9360
      \intbl {\f0 {\f0\fs20 NA}}\cell
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\ql\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx1170
      \intbl {\f0 {\f0\fs20 row_8}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx2340
      \intbl {\f0 {\f0\fs20 8.880e+06}}\cell
      
      \pard\plain\uc0\ql\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx3510
      \intbl {\f0 {\f0\fs20 honeydew}}\cell
      
      \pard\plain\uc0\qc\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx4680
      \intbl {\f0 {\f0\fs20 eight}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx5850
      \intbl {\f0 {\f0\fs20 2015-08-15}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx7020
      \intbl {\f0 {\f0\fs20 20:20}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx8190
      \intbl {\f0 {\f0\fs20 NA}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx9360
      \intbl {\f0 {\f0\fs20 0.440}}\cell
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\ql\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx9360
      \intbl {\f0 {\f0\fs20 Source note #1\line Source note #2}}\cell
      
      \row
      
      }

---

    Code
      cat(render_as_html(gt_tbl))
    Output
      <table class="gt_table" data-quarto-disable-processing="false" data-quarto-bootstrap="false">
        <thead>
          <tr class="gt_heading">
            <td colspan="9" class="gt_heading gt_title gt_font_normal" style><span class='gt_from_md'>Data listing from <strong>exibble</strong></span></td>
          </tr>
          <tr class="gt_heading">
            <td colspan="9" class="gt_heading gt_subtitle gt_font_normal gt_bottom_border" style><span class='gt_from_md'><code>exibble</code> is an R dataset</span></td>
          </tr>
          <tr class="gt_col_headings gt_spanner_row">
            <th class="gt_col_heading gt_columns_bottom_border gt_left" rowspan="2" colspan="2" scope="colgroup" id="a::stub">S.L.</th>
            <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="2" colspan="1" scope="col" id="num">num</th>
            <th class="gt_col_heading gt_columns_bottom_border gt_left" rowspan="2" colspan="1" scope="col" id="char">char</th>
            <th class="gt_col_heading gt_columns_bottom_border gt_center" rowspan="2" colspan="1" scope="col" id="fctr">fctr</th>
            <th class="gt_center gt_columns_top_border gt_column_spanner_outer" rowspan="1" colspan="3" scope="colgroup" id="timing">
              <div class="gt_column_spanner">timing</div>
            </th>
            <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="2" colspan="1" scope="col" id="currency">currency</th>
          </tr>
          <tr class="gt_col_headings">
            <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id="date">date</th>
            <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id="time">time</th>
            <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id="datetime">datetime</th>
          </tr>
        </thead>
        <tbody class="gt_table_body">
          <tr class="gt_row_group_first"><td headers="grp_a stub_2_1 stub_1" rowspan="4" class="gt_row gt_left gt_stub_row_group">grp_a</td>
      <th id="stub_2_1" scope="row" class="gt_row gt_left gt_stub">row_1</th>
      <td headers="grp_a stub_2_1 num" class="gt_row gt_right">1.111e-01</td>
      <td headers="grp_a stub_2_1 char" class="gt_row gt_left">apricot</td>
      <td headers="grp_a stub_2_1 fctr" class="gt_row gt_center">one</td>
      <td headers="grp_a stub_2_1 date" class="gt_row gt_right">2015-01-15</td>
      <td headers="grp_a stub_2_1 time" class="gt_row gt_right">13:35</td>
      <td headers="grp_a stub_2_1 datetime" class="gt_row gt_right">2018-01-01 02:22</td>
      <td headers="grp_a stub_2_1 currency" class="gt_row gt_right">49.950</td></tr>
          <tr><th id="stub_2_2" scope="row" class="gt_row gt_left gt_stub">row_2</th>
      <td headers="grp_a stub_2_2 num" class="gt_row gt_right">2.222e+00</td>
      <td headers="grp_a stub_2_2 char" class="gt_row gt_left">banana</td>
      <td headers="grp_a stub_2_2 fctr" class="gt_row gt_center">two</td>
      <td headers="grp_a stub_2_2 date" class="gt_row gt_right">2015-02-15</td>
      <td headers="grp_a stub_2_2 time" class="gt_row gt_right">14:40</td>
      <td headers="grp_a stub_2_2 datetime" class="gt_row gt_right">2018-02-02 14:33</td>
      <td headers="grp_a stub_2_2 currency" class="gt_row gt_right">17.950</td></tr>
          <tr><th id="stub_2_3" scope="row" class="gt_row gt_left gt_stub">row_3</th>
      <td headers="grp_a stub_2_3 num" class="gt_row gt_right">3.333e+01</td>
      <td headers="grp_a stub_2_3 char" class="gt_row gt_left">coconut</td>
      <td headers="grp_a stub_2_3 fctr" class="gt_row gt_center">three</td>
      <td headers="grp_a stub_2_3 date" class="gt_row gt_right">2015-03-15</td>
      <td headers="grp_a stub_2_3 time" class="gt_row gt_right">15:45</td>
      <td headers="grp_a stub_2_3 datetime" class="gt_row gt_right">2018-03-03 03:44</td>
      <td headers="grp_a stub_2_3 currency" class="gt_row gt_right">1.390</td></tr>
          <tr><th id="stub_2_4" scope="row" class="gt_row gt_left gt_stub">row_4</th>
      <td headers="grp_a stub_2_4 num" class="gt_row gt_right">4.444e+02</td>
      <td headers="grp_a stub_2_4 char" class="gt_row gt_left">durian</td>
      <td headers="grp_a stub_2_4 fctr" class="gt_row gt_center">four</td>
      <td headers="grp_a stub_2_4 date" class="gt_row gt_right">2015-04-15</td>
      <td headers="grp_a stub_2_4 time" class="gt_row gt_right">16:50</td>
      <td headers="grp_a stub_2_4 datetime" class="gt_row gt_right">2018-04-04 15:55</td>
      <td headers="grp_a stub_2_4 currency" class="gt_row gt_right">65100.000</td></tr>
          <tr class="gt_row_group_first"><td headers="grp_b stub_2_5 stub_1" rowspan="4" class="gt_row gt_left gt_stub_row_group">grp_b</td>
      <th id="stub_2_5" scope="row" class="gt_row gt_left gt_stub">row_5</th>
      <td headers="grp_b stub_2_5 num" class="gt_row gt_right">5.550e+03</td>
      <td headers="grp_b stub_2_5 char" class="gt_row gt_left">NA</td>
      <td headers="grp_b stub_2_5 fctr" class="gt_row gt_center">five</td>
      <td headers="grp_b stub_2_5 date" class="gt_row gt_right">2015-05-15</td>
      <td headers="grp_b stub_2_5 time" class="gt_row gt_right">17:55</td>
      <td headers="grp_b stub_2_5 datetime" class="gt_row gt_right">2018-05-05 04:00</td>
      <td headers="grp_b stub_2_5 currency" class="gt_row gt_right">1325.810</td></tr>
          <tr><th id="stub_2_6" scope="row" class="gt_row gt_left gt_stub">row_6</th>
      <td headers="grp_b stub_2_6 num" class="gt_row gt_right">NA</td>
      <td headers="grp_b stub_2_6 char" class="gt_row gt_left">fig</td>
      <td headers="grp_b stub_2_6 fctr" class="gt_row gt_center">six</td>
      <td headers="grp_b stub_2_6 date" class="gt_row gt_right">2015-06-15</td>
      <td headers="grp_b stub_2_6 time" class="gt_row gt_right">NA</td>
      <td headers="grp_b stub_2_6 datetime" class="gt_row gt_right">2018-06-06 16:11</td>
      <td headers="grp_b stub_2_6 currency" class="gt_row gt_right">13.255</td></tr>
          <tr><th id="stub_2_7" scope="row" class="gt_row gt_left gt_stub">row_7</th>
      <td headers="grp_b stub_2_7 num" class="gt_row gt_right">7.770e+05</td>
      <td headers="grp_b stub_2_7 char" class="gt_row gt_left">grapefruit</td>
      <td headers="grp_b stub_2_7 fctr" class="gt_row gt_center">seven</td>
      <td headers="grp_b stub_2_7 date" class="gt_row gt_right">NA</td>
      <td headers="grp_b stub_2_7 time" class="gt_row gt_right">19:10</td>
      <td headers="grp_b stub_2_7 datetime" class="gt_row gt_right">2018-07-07 05:22</td>
      <td headers="grp_b stub_2_7 currency" class="gt_row gt_right">NA</td></tr>
          <tr><th id="stub_2_8" scope="row" class="gt_row gt_left gt_stub">row_8</th>
      <td headers="grp_b stub_2_8 num" class="gt_row gt_right">8.880e+06</td>
      <td headers="grp_b stub_2_8 char" class="gt_row gt_left">honeydew</td>
      <td headers="grp_b stub_2_8 fctr" class="gt_row gt_center">eight</td>
      <td headers="grp_b stub_2_8 date" class="gt_row gt_right">2015-08-15</td>
      <td headers="grp_b stub_2_8 time" class="gt_row gt_right">20:20</td>
      <td headers="grp_b stub_2_8 datetime" class="gt_row gt_right">NA</td>
      <td headers="grp_b stub_2_8 currency" class="gt_row gt_right">0.440</td></tr>
        </tbody>
        <tfoot>
          <tr class="gt_sourcenotes">
            <td class="gt_sourcenote" colspan="9">Source note #1</td>
          </tr>
          <tr class="gt_sourcenotes">
            <td class="gt_sourcenote" colspan="9">Source note #2</td>
          </tr>
        </tfoot>
      </table>

---

    Code
      as.character(as_latex(gt_tbl))
    Output
      [1] "\\begingroup\n\\fontsize{12.0pt}{14.0pt}\\selectfont\n\\setlength{\\LTpost}{0mm}\n\\begin{longtable}{l|l|rlcrrrr}\n\\caption*{\n{\\fontsize{20}{25}\\selectfont  Data listing from \\textbf{exibble}\\fontsize{12}{15}\\selectfont } \\\\ \n{\\fontsize{14}{17}\\selectfont  \\texttt{exibble} is an R dataset\\fontsize{12}{15}\\selectfont }\n} \\\\ \n\\toprule\n\\multicolumn{2}{l}{} &  &  &  & \\multicolumn{3}{c}{timing} &  \\\\ \n\\cmidrule(lr){6-8}\n\\multicolumn{2}{c}{S.L.} & num & char & fctr & date & time & datetime & currency \\\\ \n\\midrule\\addlinespace[2.5pt]\n\\multirow[t]{4}{*}{grp\\_a} & row\\_1 & 1.111e-01 & apricot & one & 2015-01-15 & 13:35 & 2018-01-01 02:22 & 49.950 \\\\ \n & row\\_2 & 2.222e+00 & banana & two & 2015-02-15 & 14:40 & 2018-02-02 14:33 & 17.950 \\\\ \n & row\\_3 & 3.333e+01 & coconut & three & 2015-03-15 & 15:45 & 2018-03-03 03:44 & 1.390 \\\\ \n & row\\_4 & 4.444e+02 & durian & four & 2015-04-15 & 16:50 & 2018-04-04 15:55 & 65100.000 \\\\ \n\\midrule\\addlinespace[2.5pt]\n\\multirow[t]{4}{*}{grp\\_b} & row\\_5 & 5.550e+03 & NA & five & 2015-05-15 & 17:55 & 2018-05-05 04:00 & 1325.810 \\\\ \n & row\\_6 & NA & fig & six & 2015-06-15 & NA & 2018-06-06 16:11 & 13.255 \\\\ \n & row\\_7 & 7.770e+05 & grapefruit & seven & NA & 19:10 & 2018-07-07 05:22 & NA \\\\ \n & row\\_8 & 8.880e+06 & honeydew & eight & 2015-08-15 & 20:20 & NA & 0.440 \\\\ \n\\bottomrule\n\\end{longtable}\n\\begin{minipage}{\\linewidth}\n\\vspace{.05em}\nSource note \\#1\\\\\nSource note \\#2\\\\\n\\end{minipage}\n\\endgroup\n"

---

    Code
      as_rtf(gt_tbl)
    Output
      {\rtf\ansi\ansicpg1252{\fonttbl{\f0\froman\fcharset0\fprq0 Courier New;}{\f1\froman\fcharset0\fprq0 Times;}}{\colortbl;\red51\green51\blue51;\red211\green211\blue211;}
      
      \paperw12240\paperh15840\widowctrl\ftnbj\fet0\sectd\linex0
      \lndscpsxn
      \margl1440\margr1440\margt1440\margb1440
      \headery720\footery720\fs20
      
      \trowd\trrh0\trhdr
      
      \pard\plain\uc0\qc\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx9360
      \intbl {\f0\cf1 {\f0\fs20 Data listing from {\b exibble}} {\f0\fs20\i\super } \line {\f0\fs20 {\f1 exibble} is an R dataset} {\f0\fs20\i\super }}\cell
      
      \row
      
      \trowd\trrh0\trhdr
      
      \pard\plain\uc0\qc\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx1040
      \intbl {\f0 {\f0\fs20 }}\cell
      
      \pard\plain\uc0\qc\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx2080
      \intbl {\f0 {\f0\fs20 }}\cell
      
      \pard\plain\uc0\qc\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx3120
      \intbl {\f0 {\f0\fs20 }}\cell
      
      \pard\plain\uc0\qc\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx4160
      \intbl {\f0 {\f0\fs20 }}\cell
      
      \pard\plain\uc0\qc\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx5200
      \intbl {\f0 {\f0\fs20 }}\cell
      
      \pard\plain\uc0\qc\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85\clbrdrb\brdrs\brdrw20\brdrcf2\clmgf \cellx6240
      \intbl {\f0 {\f0\fs20 timing}}\cell
      
      \pard\plain\uc0\qc\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85\clmrg \cellx7280
      \intbl {\f0 {\f0\fs20 }}\cell
      
      \pard\plain\uc0\qc\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85\clmrg \cellx8320
      \intbl {\f0 {\f0\fs20 }}\cell
      
      \pard\plain\uc0\qc\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx9360
      \intbl {\f0 {\f0\fs20 }}\cell
      
      \row
      
      \trowd\trrh0\trhdr
      
      \pard\plain\uc0\ql\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85\clbrdrb\brdrs\brdrw20\brdrcf2\clmgf \cellx1040
      \intbl {\f0 {\f0\fs20 S.L.}}\cell
      
      \pard\plain\uc0\ql\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85\clbrdrb\brdrs\brdrw20\brdrcf2\clmrg \cellx2080
      \intbl {\f0 {\f0\fs20 }}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85\clbrdrb\brdrs\brdrw20\brdrcf2 \cellx3120
      \intbl {\f0 {\f0\fs20 num}}\cell
      
      \pard\plain\uc0\ql\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85\clbrdrb\brdrs\brdrw20\brdrcf2 \cellx4160
      \intbl {\f0 {\f0\fs20 char}}\cell
      
      \pard\plain\uc0\qc\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85\clbrdrb\brdrs\brdrw20\brdrcf2 \cellx5200
      \intbl {\f0 {\f0\fs20 fctr}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85\clbrdrb\brdrs\brdrw20\brdrcf2 \cellx6240
      \intbl {\f0 {\f0\fs20 date}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85\clbrdrb\brdrs\brdrw20\brdrcf2 \cellx7280
      \intbl {\f0 {\f0\fs20 time}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85\clbrdrb\brdrs\brdrw20\brdrcf2 \cellx8320
      \intbl {\f0 {\f0\fs20 datetime}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85\clbrdrb\brdrs\brdrw20\brdrcf2 \cellx9360
      \intbl {\f0 {\f0\fs20 currency}}\cell
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\ql\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx1040
      \intbl {\f0 {\f0\fs20 grp_a}}\cell
      
      \pard\plain\uc0\ql\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx2080
      \intbl {\f0 {\f0\fs20 row_1}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx3120
      \intbl {\f0 {\f0\fs20 1.111e-01}}\cell
      
      \pard\plain\uc0\ql\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx4160
      \intbl {\f0 {\f0\fs20 apricot}}\cell
      
      \pard\plain\uc0\qc\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx5200
      \intbl {\f0 {\f0\fs20 one}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx6240
      \intbl {\f0 {\f0\fs20 2015-01-15}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx7280
      \intbl {\f0 {\f0\fs20 13:35}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx8320
      \intbl {\f0 {\f0\fs20 2018-01-01 02:22}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx9360
      \intbl {\f0 {\f0\fs20 49.950}}\cell
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\ql\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx1040
      \intbl {\f0 {\f0\fs20 }}\cell
      
      \pard\plain\uc0\ql\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx2080
      \intbl {\f0 {\f0\fs20 row_2}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx3120
      \intbl {\f0 {\f0\fs20 2.222e+00}}\cell
      
      \pard\plain\uc0\ql\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx4160
      \intbl {\f0 {\f0\fs20 banana}}\cell
      
      \pard\plain\uc0\qc\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx5200
      \intbl {\f0 {\f0\fs20 two}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx6240
      \intbl {\f0 {\f0\fs20 2015-02-15}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx7280
      \intbl {\f0 {\f0\fs20 14:40}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx8320
      \intbl {\f0 {\f0\fs20 2018-02-02 14:33}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx9360
      \intbl {\f0 {\f0\fs20 17.950}}\cell
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\ql\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx1040
      \intbl {\f0 {\f0\fs20 }}\cell
      
      \pard\plain\uc0\ql\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx2080
      \intbl {\f0 {\f0\fs20 row_3}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx3120
      \intbl {\f0 {\f0\fs20 3.333e+01}}\cell
      
      \pard\plain\uc0\ql\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx4160
      \intbl {\f0 {\f0\fs20 coconut}}\cell
      
      \pard\plain\uc0\qc\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx5200
      \intbl {\f0 {\f0\fs20 three}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx6240
      \intbl {\f0 {\f0\fs20 2015-03-15}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx7280
      \intbl {\f0 {\f0\fs20 15:45}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx8320
      \intbl {\f0 {\f0\fs20 2018-03-03 03:44}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx9360
      \intbl {\f0 {\f0\fs20 1.390}}\cell
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\ql\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx1040
      \intbl {\f0 {\f0\fs20 }}\cell
      
      \pard\plain\uc0\ql\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx2080
      \intbl {\f0 {\f0\fs20 row_4}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx3120
      \intbl {\f0 {\f0\fs20 4.444e+02}}\cell
      
      \pard\plain\uc0\ql\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx4160
      \intbl {\f0 {\f0\fs20 durian}}\cell
      
      \pard\plain\uc0\qc\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx5200
      \intbl {\f0 {\f0\fs20 four}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx6240
      \intbl {\f0 {\f0\fs20 2015-04-15}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx7280
      \intbl {\f0 {\f0\fs20 16:50}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx8320
      \intbl {\f0 {\f0\fs20 2018-04-04 15:55}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx9360
      \intbl {\f0 {\f0\fs20 65100.000}}\cell
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\ql\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx1040
      \intbl {\f0 {\f0\fs20 grp_b}}\cell
      
      \pard\plain\uc0\ql\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx2080
      \intbl {\f0 {\f0\fs20 row_5}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx3120
      \intbl {\f0 {\f0\fs20 5.550e+03}}\cell
      
      \pard\plain\uc0\ql\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx4160
      \intbl {\f0 {\f0\fs20 NA}}\cell
      
      \pard\plain\uc0\qc\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx5200
      \intbl {\f0 {\f0\fs20 five}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx6240
      \intbl {\f0 {\f0\fs20 2015-05-15}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx7280
      \intbl {\f0 {\f0\fs20 17:55}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx8320
      \intbl {\f0 {\f0\fs20 2018-05-05 04:00}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx9360
      \intbl {\f0 {\f0\fs20 1325.810}}\cell
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\ql\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx1040
      \intbl {\f0 {\f0\fs20 }}\cell
      
      \pard\plain\uc0\ql\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx2080
      \intbl {\f0 {\f0\fs20 row_6}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx3120
      \intbl {\f0 {\f0\fs20 NA}}\cell
      
      \pard\plain\uc0\ql\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx4160
      \intbl {\f0 {\f0\fs20 fig}}\cell
      
      \pard\plain\uc0\qc\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx5200
      \intbl {\f0 {\f0\fs20 six}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx6240
      \intbl {\f0 {\f0\fs20 2015-06-15}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx7280
      \intbl {\f0 {\f0\fs20 NA}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx8320
      \intbl {\f0 {\f0\fs20 2018-06-06 16:11}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx9360
      \intbl {\f0 {\f0\fs20 13.255}}\cell
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\ql\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx1040
      \intbl {\f0 {\f0\fs20 }}\cell
      
      \pard\plain\uc0\ql\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx2080
      \intbl {\f0 {\f0\fs20 row_7}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx3120
      \intbl {\f0 {\f0\fs20 7.770e+05}}\cell
      
      \pard\plain\uc0\ql\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx4160
      \intbl {\f0 {\f0\fs20 grapefruit}}\cell
      
      \pard\plain\uc0\qc\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx5200
      \intbl {\f0 {\f0\fs20 seven}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx6240
      \intbl {\f0 {\f0\fs20 NA}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx7280
      \intbl {\f0 {\f0\fs20 19:10}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx8320
      \intbl {\f0 {\f0\fs20 2018-07-07 05:22}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx9360
      \intbl {\f0 {\f0\fs20 NA}}\cell
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\ql\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx1040
      \intbl {\f0 {\f0\fs20 }}\cell
      
      \pard\plain\uc0\ql\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx2080
      \intbl {\f0 {\f0\fs20 row_8}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx3120
      \intbl {\f0 {\f0\fs20 8.880e+06}}\cell
      
      \pard\plain\uc0\ql\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx4160
      \intbl {\f0 {\f0\fs20 honeydew}}\cell
      
      \pard\plain\uc0\qc\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx5200
      \intbl {\f0 {\f0\fs20 eight}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx6240
      \intbl {\f0 {\f0\fs20 2015-08-15}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx7280
      \intbl {\f0 {\f0\fs20 20:20}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx8320
      \intbl {\f0 {\f0\fs20 NA}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx9360
      \intbl {\f0 {\f0\fs20 0.440}}\cell
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\ql\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx9360
      \intbl {\f0 {\f0\fs20 Source note #1\line Source note #2}}\cell
      
      \row
      
      }

---

    Code
      cat(render_as_html(gt_tbl))
    Output
      <table class="gt_table" data-quarto-disable-processing="false" data-quarto-bootstrap="false">
        <thead>
          <tr class="gt_heading">
            <td colspan="10" class="gt_heading gt_title gt_font_normal" style><span class='gt_from_md'>Data listing from <strong>exibble</strong></span></td>
          </tr>
          <tr class="gt_heading">
            <td colspan="10" class="gt_heading gt_subtitle gt_font_normal gt_bottom_border" style><span class='gt_from_md'><code>exibble</code> is an R dataset</span></td>
          </tr>
          <tr class="gt_col_headings gt_spanner_row">
            <th class="gt_col_heading gt_columns_bottom_border gt_left" rowspan="2" colspan="1" scope="col" id="a::stub">S.L.</th>
            <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="2" colspan="1" scope="col" id="num">num</th>
            <th class="gt_col_heading gt_columns_bottom_border gt_left" rowspan="2" colspan="1" scope="col" id="char">char</th>
            <th class="gt_col_heading gt_columns_bottom_border gt_center" rowspan="2" colspan="1" scope="col" id="fctr">fctr</th>
            <th class="gt_center gt_columns_top_border gt_column_spanner_outer" rowspan="1" colspan="3" scope="colgroup" id="timing">
              <div class="gt_column_spanner">timing</div>
            </th>
            <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="2" colspan="1" scope="col" id="currency">currency</th>
            <th class="gt_col_heading gt_columns_bottom_border gt_left" rowspan="2" colspan="1" scope="col" id="row">row</th>
            <th class="gt_col_heading gt_columns_bottom_border gt_left" rowspan="2" colspan="1" scope="col" id="group">group</th>
          </tr>
          <tr class="gt_col_headings">
            <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id="date">date</th>
            <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id="time">time</th>
            <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id="datetime">datetime</th>
          </tr>
        </thead>
        <tbody class="gt_table_body">
          <tr><th id="stub_1_1" scope="row" class="gt_row gt_left gt_stub"></th>
      <td headers="stub_1_1 num" class="gt_row gt_right">1.111e-01</td>
      <td headers="stub_1_1 char" class="gt_row gt_left">apricot</td>
      <td headers="stub_1_1 fctr" class="gt_row gt_center">one</td>
      <td headers="stub_1_1 date" class="gt_row gt_right">2015-01-15</td>
      <td headers="stub_1_1 time" class="gt_row gt_right">13:35</td>
      <td headers="stub_1_1 datetime" class="gt_row gt_right">2018-01-01 02:22</td>
      <td headers="stub_1_1 currency" class="gt_row gt_right">49.950</td>
      <td headers="stub_1_1 row" class="gt_row gt_left">row_1</td>
      <td headers="stub_1_1 group" class="gt_row gt_left">grp_a</td></tr>
          <tr><th id="stub_1_2" scope="row" class="gt_row gt_left gt_stub"></th>
      <td headers="stub_1_2 num" class="gt_row gt_right">2.222e+00</td>
      <td headers="stub_1_2 char" class="gt_row gt_left">banana</td>
      <td headers="stub_1_2 fctr" class="gt_row gt_center">two</td>
      <td headers="stub_1_2 date" class="gt_row gt_right">2015-02-15</td>
      <td headers="stub_1_2 time" class="gt_row gt_right">14:40</td>
      <td headers="stub_1_2 datetime" class="gt_row gt_right">2018-02-02 14:33</td>
      <td headers="stub_1_2 currency" class="gt_row gt_right">17.950</td>
      <td headers="stub_1_2 row" class="gt_row gt_left">row_2</td>
      <td headers="stub_1_2 group" class="gt_row gt_left">grp_a</td></tr>
          <tr><th id="stub_1_3" scope="row" class="gt_row gt_left gt_stub"></th>
      <td headers="stub_1_3 num" class="gt_row gt_right">3.333e+01</td>
      <td headers="stub_1_3 char" class="gt_row gt_left">coconut</td>
      <td headers="stub_1_3 fctr" class="gt_row gt_center">three</td>
      <td headers="stub_1_3 date" class="gt_row gt_right">2015-03-15</td>
      <td headers="stub_1_3 time" class="gt_row gt_right">15:45</td>
      <td headers="stub_1_3 datetime" class="gt_row gt_right">2018-03-03 03:44</td>
      <td headers="stub_1_3 currency" class="gt_row gt_right">1.390</td>
      <td headers="stub_1_3 row" class="gt_row gt_left">row_3</td>
      <td headers="stub_1_3 group" class="gt_row gt_left">grp_a</td></tr>
          <tr><th id="stub_1_4" scope="row" class="gt_row gt_left gt_stub"></th>
      <td headers="stub_1_4 num" class="gt_row gt_right">4.444e+02</td>
      <td headers="stub_1_4 char" class="gt_row gt_left">durian</td>
      <td headers="stub_1_4 fctr" class="gt_row gt_center">four</td>
      <td headers="stub_1_4 date" class="gt_row gt_right">2015-04-15</td>
      <td headers="stub_1_4 time" class="gt_row gt_right">16:50</td>
      <td headers="stub_1_4 datetime" class="gt_row gt_right">2018-04-04 15:55</td>
      <td headers="stub_1_4 currency" class="gt_row gt_right">65100.000</td>
      <td headers="stub_1_4 row" class="gt_row gt_left">row_4</td>
      <td headers="stub_1_4 group" class="gt_row gt_left">grp_a</td></tr>
          <tr><th id="stub_1_5" scope="row" class="gt_row gt_left gt_stub"></th>
      <td headers="stub_1_5 num" class="gt_row gt_right">5.550e+03</td>
      <td headers="stub_1_5 char" class="gt_row gt_left">NA</td>
      <td headers="stub_1_5 fctr" class="gt_row gt_center">five</td>
      <td headers="stub_1_5 date" class="gt_row gt_right">2015-05-15</td>
      <td headers="stub_1_5 time" class="gt_row gt_right">17:55</td>
      <td headers="stub_1_5 datetime" class="gt_row gt_right">2018-05-05 04:00</td>
      <td headers="stub_1_5 currency" class="gt_row gt_right">1325.810</td>
      <td headers="stub_1_5 row" class="gt_row gt_left">row_5</td>
      <td headers="stub_1_5 group" class="gt_row gt_left">grp_b</td></tr>
          <tr><th id="stub_1_6" scope="row" class="gt_row gt_left gt_stub"></th>
      <td headers="stub_1_6 num" class="gt_row gt_right">NA</td>
      <td headers="stub_1_6 char" class="gt_row gt_left">fig</td>
      <td headers="stub_1_6 fctr" class="gt_row gt_center">six</td>
      <td headers="stub_1_6 date" class="gt_row gt_right">2015-06-15</td>
      <td headers="stub_1_6 time" class="gt_row gt_right">NA</td>
      <td headers="stub_1_6 datetime" class="gt_row gt_right">2018-06-06 16:11</td>
      <td headers="stub_1_6 currency" class="gt_row gt_right">13.255</td>
      <td headers="stub_1_6 row" class="gt_row gt_left">row_6</td>
      <td headers="stub_1_6 group" class="gt_row gt_left">grp_b</td></tr>
          <tr><th id="stub_1_7" scope="row" class="gt_row gt_left gt_stub"></th>
      <td headers="stub_1_7 num" class="gt_row gt_right">7.770e+05</td>
      <td headers="stub_1_7 char" class="gt_row gt_left">grapefruit</td>
      <td headers="stub_1_7 fctr" class="gt_row gt_center">seven</td>
      <td headers="stub_1_7 date" class="gt_row gt_right">NA</td>
      <td headers="stub_1_7 time" class="gt_row gt_right">19:10</td>
      <td headers="stub_1_7 datetime" class="gt_row gt_right">2018-07-07 05:22</td>
      <td headers="stub_1_7 currency" class="gt_row gt_right">NA</td>
      <td headers="stub_1_7 row" class="gt_row gt_left">row_7</td>
      <td headers="stub_1_7 group" class="gt_row gt_left">grp_b</td></tr>
          <tr><th id="stub_1_8" scope="row" class="gt_row gt_left gt_stub"></th>
      <td headers="stub_1_8 num" class="gt_row gt_right">8.880e+06</td>
      <td headers="stub_1_8 char" class="gt_row gt_left">honeydew</td>
      <td headers="stub_1_8 fctr" class="gt_row gt_center">eight</td>
      <td headers="stub_1_8 date" class="gt_row gt_right">2015-08-15</td>
      <td headers="stub_1_8 time" class="gt_row gt_right">20:20</td>
      <td headers="stub_1_8 datetime" class="gt_row gt_right">NA</td>
      <td headers="stub_1_8 currency" class="gt_row gt_right">0.440</td>
      <td headers="stub_1_8 row" class="gt_row gt_left">row_8</td>
      <td headers="stub_1_8 group" class="gt_row gt_left">grp_b</td></tr>
          <tr><th id="grand_summary_stub_1" scope="row" class="gt_row gt_left gt_stub gt_grand_summary_row gt_first_grand_summary_row">min</th>
      <td headers="grand_summary_stub_1 num" class="gt_row gt_right gt_grand_summary_row gt_first_grand_summary_row">0.11</td>
      <td headers="grand_summary_stub_1 char" class="gt_row gt_left gt_grand_summary_row gt_first_grand_summary_row">—</td>
      <td headers="grand_summary_stub_1 fctr" class="gt_row gt_center gt_grand_summary_row gt_first_grand_summary_row">—</td>
      <td headers="grand_summary_stub_1 date" class="gt_row gt_right gt_grand_summary_row gt_first_grand_summary_row">—</td>
      <td headers="grand_summary_stub_1 time" class="gt_row gt_right gt_grand_summary_row gt_first_grand_summary_row">—</td>
      <td headers="grand_summary_stub_1 datetime" class="gt_row gt_right gt_grand_summary_row gt_first_grand_summary_row">—</td>
      <td headers="grand_summary_stub_1 currency" class="gt_row gt_right gt_grand_summary_row gt_first_grand_summary_row">0.44</td>
      <td headers="grand_summary_stub_1 row" class="gt_row gt_left gt_grand_summary_row gt_first_grand_summary_row">—</td>
      <td headers="grand_summary_stub_1 group" class="gt_row gt_left gt_grand_summary_row gt_first_grand_summary_row">—</td></tr>
          <tr><th id="grand_summary_stub_2" scope="row" class="gt_row gt_left gt_stub gt_grand_summary_row">max</th>
      <td headers="grand_summary_stub_2 num" class="gt_row gt_right gt_grand_summary_row">8880000.00</td>
      <td headers="grand_summary_stub_2 char" class="gt_row gt_left gt_grand_summary_row">—</td>
      <td headers="grand_summary_stub_2 fctr" class="gt_row gt_center gt_grand_summary_row">—</td>
      <td headers="grand_summary_stub_2 date" class="gt_row gt_right gt_grand_summary_row">—</td>
      <td headers="grand_summary_stub_2 time" class="gt_row gt_right gt_grand_summary_row">—</td>
      <td headers="grand_summary_stub_2 datetime" class="gt_row gt_right gt_grand_summary_row">—</td>
      <td headers="grand_summary_stub_2 currency" class="gt_row gt_right gt_grand_summary_row">65100.00</td>
      <td headers="grand_summary_stub_2 row" class="gt_row gt_left gt_grand_summary_row">—</td>
      <td headers="grand_summary_stub_2 group" class="gt_row gt_left gt_grand_summary_row">—</td></tr>
          <tr><th id="grand_summary_stub_3" scope="row" class="gt_row gt_left gt_stub gt_grand_summary_row gt_last_summary_row">avg</th>
      <td headers="grand_summary_stub_3 num" class="gt_row gt_right gt_grand_summary_row gt_last_summary_row">1380432.87</td>
      <td headers="grand_summary_stub_3 char" class="gt_row gt_left gt_grand_summary_row gt_last_summary_row">—</td>
      <td headers="grand_summary_stub_3 fctr" class="gt_row gt_center gt_grand_summary_row gt_last_summary_row">—</td>
      <td headers="grand_summary_stub_3 date" class="gt_row gt_right gt_grand_summary_row gt_last_summary_row">—</td>
      <td headers="grand_summary_stub_3 time" class="gt_row gt_right gt_grand_summary_row gt_last_summary_row">—</td>
      <td headers="grand_summary_stub_3 datetime" class="gt_row gt_right gt_grand_summary_row gt_last_summary_row">—</td>
      <td headers="grand_summary_stub_3 currency" class="gt_row gt_right gt_grand_summary_row gt_last_summary_row">9501.26</td>
      <td headers="grand_summary_stub_3 row" class="gt_row gt_left gt_grand_summary_row gt_last_summary_row">—</td>
      <td headers="grand_summary_stub_3 group" class="gt_row gt_left gt_grand_summary_row gt_last_summary_row">—</td></tr>
        </tbody>
        <tfoot>
          <tr class="gt_sourcenotes">
            <td class="gt_sourcenote" colspan="10">Source note #1</td>
          </tr>
          <tr class="gt_sourcenotes">
            <td class="gt_sourcenote" colspan="10">Source note #2</td>
          </tr>
        </tfoot>
      </table>

---

    Code
      as.character(as_latex(gt_tbl))
    Output
      [1] "\\begingroup\n\\fontsize{12.0pt}{14.0pt}\\selectfont\n\\setlength{\\LTpost}{0mm}\n\\begin{longtable}{l|rlcrrrrll}\n\\caption*{\n{\\fontsize{20}{25}\\selectfont  Data listing from \\textbf{exibble}\\fontsize{12}{15}\\selectfont } \\\\ \n{\\fontsize{14}{17}\\selectfont  \\texttt{exibble} is an R dataset\\fontsize{12}{15}\\selectfont }\n} \\\\ \n\\toprule\n &  &  &  & \\multicolumn{3}{c}{timing} &  &  &  \\\\ \n\\cmidrule(lr){5-7}\nS.L. & num & char & fctr & date & time & datetime & currency & row & group \\\\ \n\\midrule\\addlinespace[2.5pt]\n & 1.111e-01 & apricot & one & 2015-01-15 & 13:35 & 2018-01-01 02:22 & 49.950 & row\\_1 & grp\\_a \\\\ \n & 2.222e+00 & banana & two & 2015-02-15 & 14:40 & 2018-02-02 14:33 & 17.950 & row\\_2 & grp\\_a \\\\ \n & 3.333e+01 & coconut & three & 2015-03-15 & 15:45 & 2018-03-03 03:44 & 1.390 & row\\_3 & grp\\_a \\\\ \n & 4.444e+02 & durian & four & 2015-04-15 & 16:50 & 2018-04-04 15:55 & 65100.000 & row\\_4 & grp\\_a \\\\ \n & 5.550e+03 & NA & five & 2015-05-15 & 17:55 & 2018-05-05 04:00 & 1325.810 & row\\_5 & grp\\_b \\\\ \n & NA & fig & six & 2015-06-15 & NA & 2018-06-06 16:11 & 13.255 & row\\_6 & grp\\_b \\\\ \n & 7.770e+05 & grapefruit & seven & NA & 19:10 & 2018-07-07 05:22 & NA & row\\_7 & grp\\_b \\\\ \n & 8.880e+06 & honeydew & eight & 2015-08-15 & 20:20 & NA & 0.440 & row\\_8 & grp\\_b \\\\ \n\\midrule \n\\midrule \nmin & 0.11 & — & — & — & — & — & 0.44 & — & — \\\\ \nmax & 8880000.00 & — & — & — & — & — & 65100.00 & — & — \\\\ \navg & 1380432.87 & — & — & — & — & — & 9501.26 & — & — \\\\ \n\\bottomrule\n\\end{longtable}\n\\begin{minipage}{\\linewidth}\n\\vspace{.05em}\nSource note \\#1\\\\\nSource note \\#2\\\\\n\\end{minipage}\n\\endgroup\n"

---

    Code
      as_rtf(gt_tbl)
    Output
      {\rtf\ansi\ansicpg1252{\fonttbl{\f0\froman\fcharset0\fprq0 Courier New;}{\f1\froman\fcharset0\fprq0 Times;}}{\colortbl;\red51\green51\blue51;\red211\green211\blue211;}
      
      \paperw12240\paperh15840\widowctrl\ftnbj\fet0\sectd\linex0
      \lndscpsxn
      \margl1440\margr1440\margt1440\margb1440
      \headery720\footery720\fs20
      
      \trowd\trrh0\trhdr
      
      \pard\plain\uc0\qc\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx9360
      \intbl {\f0\cf1 {\f0\fs20 Data listing from {\b exibble}} {\f0\fs20\i\super } \line {\f0\fs20 {\f1 exibble} is an R dataset} {\f0\fs20\i\super }}\cell
      
      \row
      
      \trowd\trrh0\trhdr
      
      \pard\plain\uc0\qc\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx936
      \intbl {\f0 {\f0\fs20 }}\cell
      
      \pard\plain\uc0\qc\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx1872
      \intbl {\f0 {\f0\fs20 }}\cell
      
      \pard\plain\uc0\qc\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx2808
      \intbl {\f0 {\f0\fs20 }}\cell
      
      \pard\plain\uc0\qc\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx3744
      \intbl {\f0 {\f0\fs20 }}\cell
      
      \pard\plain\uc0\qc\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85\clbrdrb\brdrs\brdrw20\brdrcf2\clmgf \cellx4680
      \intbl {\f0 {\f0\fs20 timing}}\cell
      
      \pard\plain\uc0\qc\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85\clmrg \cellx5616
      \intbl {\f0 {\f0\fs20 }}\cell
      
      \pard\plain\uc0\qc\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85\clmrg \cellx6552
      \intbl {\f0 {\f0\fs20 }}\cell
      
      \pard\plain\uc0\qc\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx7488
      \intbl {\f0 {\f0\fs20 }}\cell
      
      \pard\plain\uc0\qc\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx8424
      \intbl {\f0 {\f0\fs20 }}\cell
      
      \pard\plain\uc0\qc\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx9360
      \intbl {\f0 {\f0\fs20 }}\cell
      
      \row
      
      \trowd\trrh0\trhdr
      
      \pard\plain\uc0\ql\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85\clbrdrb\brdrs\brdrw20\brdrcf2 \cellx936
      \intbl {\f0 {\f0\fs20 S.L.}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85\clbrdrb\brdrs\brdrw20\brdrcf2 \cellx1872
      \intbl {\f0 {\f0\fs20 num}}\cell
      
      \pard\plain\uc0\ql\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85\clbrdrb\brdrs\brdrw20\brdrcf2 \cellx2808
      \intbl {\f0 {\f0\fs20 char}}\cell
      
      \pard\plain\uc0\qc\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85\clbrdrb\brdrs\brdrw20\brdrcf2 \cellx3744
      \intbl {\f0 {\f0\fs20 fctr}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85\clbrdrb\brdrs\brdrw20\brdrcf2 \cellx4680
      \intbl {\f0 {\f0\fs20 date}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85\clbrdrb\brdrs\brdrw20\brdrcf2 \cellx5616
      \intbl {\f0 {\f0\fs20 time}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85\clbrdrb\brdrs\brdrw20\brdrcf2 \cellx6552
      \intbl {\f0 {\f0\fs20 datetime}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85\clbrdrb\brdrs\brdrw20\brdrcf2 \cellx7488
      \intbl {\f0 {\f0\fs20 currency}}\cell
      
      \pard\plain\uc0\ql\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85\clbrdrb\brdrs\brdrw20\brdrcf2 \cellx8424
      \intbl {\f0 {\f0\fs20 row}}\cell
      
      \pard\plain\uc0\ql\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85\clbrdrb\brdrs\brdrw20\brdrcf2 \cellx9360
      \intbl {\f0 {\f0\fs20 group}}\cell
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\ql\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx936
      \intbl {\f0 {\f0\fs20 }}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx1872
      \intbl {\f0 {\f0\fs20 1.111e-01}}\cell
      
      \pard\plain\uc0\ql\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx2808
      \intbl {\f0 {\f0\fs20 apricot}}\cell
      
      \pard\plain\uc0\qc\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx3744
      \intbl {\f0 {\f0\fs20 one}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx4680
      \intbl {\f0 {\f0\fs20 2015-01-15}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx5616
      \intbl {\f0 {\f0\fs20 13:35}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx6552
      \intbl {\f0 {\f0\fs20 2018-01-01 02:22}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx7488
      \intbl {\f0 {\f0\fs20 49.950}}\cell
      
      \pard\plain\uc0\ql\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx8424
      \intbl {\f0 {\f0\fs20 row_1}}\cell
      
      \pard\plain\uc0\ql\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx9360
      \intbl {\f0 {\f0\fs20 grp_a}}\cell
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\ql\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx936
      \intbl {\f0 {\f0\fs20 }}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx1872
      \intbl {\f0 {\f0\fs20 2.222e+00}}\cell
      
      \pard\plain\uc0\ql\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx2808
      \intbl {\f0 {\f0\fs20 banana}}\cell
      
      \pard\plain\uc0\qc\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx3744
      \intbl {\f0 {\f0\fs20 two}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx4680
      \intbl {\f0 {\f0\fs20 2015-02-15}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx5616
      \intbl {\f0 {\f0\fs20 14:40}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx6552
      \intbl {\f0 {\f0\fs20 2018-02-02 14:33}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx7488
      \intbl {\f0 {\f0\fs20 17.950}}\cell
      
      \pard\plain\uc0\ql\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx8424
      \intbl {\f0 {\f0\fs20 row_2}}\cell
      
      \pard\plain\uc0\ql\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx9360
      \intbl {\f0 {\f0\fs20 grp_a}}\cell
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\ql\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx936
      \intbl {\f0 {\f0\fs20 }}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx1872
      \intbl {\f0 {\f0\fs20 3.333e+01}}\cell
      
      \pard\plain\uc0\ql\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx2808
      \intbl {\f0 {\f0\fs20 coconut}}\cell
      
      \pard\plain\uc0\qc\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx3744
      \intbl {\f0 {\f0\fs20 three}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx4680
      \intbl {\f0 {\f0\fs20 2015-03-15}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx5616
      \intbl {\f0 {\f0\fs20 15:45}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx6552
      \intbl {\f0 {\f0\fs20 2018-03-03 03:44}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx7488
      \intbl {\f0 {\f0\fs20 1.390}}\cell
      
      \pard\plain\uc0\ql\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx8424
      \intbl {\f0 {\f0\fs20 row_3}}\cell
      
      \pard\plain\uc0\ql\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx9360
      \intbl {\f0 {\f0\fs20 grp_a}}\cell
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\ql\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx936
      \intbl {\f0 {\f0\fs20 }}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx1872
      \intbl {\f0 {\f0\fs20 4.444e+02}}\cell
      
      \pard\plain\uc0\ql\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx2808
      \intbl {\f0 {\f0\fs20 durian}}\cell
      
      \pard\plain\uc0\qc\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx3744
      \intbl {\f0 {\f0\fs20 four}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx4680
      \intbl {\f0 {\f0\fs20 2015-04-15}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx5616
      \intbl {\f0 {\f0\fs20 16:50}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx6552
      \intbl {\f0 {\f0\fs20 2018-04-04 15:55}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx7488
      \intbl {\f0 {\f0\fs20 65100.000}}\cell
      
      \pard\plain\uc0\ql\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx8424
      \intbl {\f0 {\f0\fs20 row_4}}\cell
      
      \pard\plain\uc0\ql\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx9360
      \intbl {\f0 {\f0\fs20 grp_a}}\cell
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\ql\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx936
      \intbl {\f0 {\f0\fs20 }}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx1872
      \intbl {\f0 {\f0\fs20 5.550e+03}}\cell
      
      \pard\plain\uc0\ql\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx2808
      \intbl {\f0 {\f0\fs20 NA}}\cell
      
      \pard\plain\uc0\qc\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx3744
      \intbl {\f0 {\f0\fs20 five}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx4680
      \intbl {\f0 {\f0\fs20 2015-05-15}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx5616
      \intbl {\f0 {\f0\fs20 17:55}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx6552
      \intbl {\f0 {\f0\fs20 2018-05-05 04:00}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx7488
      \intbl {\f0 {\f0\fs20 1325.810}}\cell
      
      \pard\plain\uc0\ql\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx8424
      \intbl {\f0 {\f0\fs20 row_5}}\cell
      
      \pard\plain\uc0\ql\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx9360
      \intbl {\f0 {\f0\fs20 grp_b}}\cell
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\ql\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx936
      \intbl {\f0 {\f0\fs20 }}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx1872
      \intbl {\f0 {\f0\fs20 NA}}\cell
      
      \pard\plain\uc0\ql\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx2808
      \intbl {\f0 {\f0\fs20 fig}}\cell
      
      \pard\plain\uc0\qc\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx3744
      \intbl {\f0 {\f0\fs20 six}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx4680
      \intbl {\f0 {\f0\fs20 2015-06-15}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx5616
      \intbl {\f0 {\f0\fs20 NA}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx6552
      \intbl {\f0 {\f0\fs20 2018-06-06 16:11}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx7488
      \intbl {\f0 {\f0\fs20 13.255}}\cell
      
      \pard\plain\uc0\ql\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx8424
      \intbl {\f0 {\f0\fs20 row_6}}\cell
      
      \pard\plain\uc0\ql\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx9360
      \intbl {\f0 {\f0\fs20 grp_b}}\cell
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\ql\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx936
      \intbl {\f0 {\f0\fs20 }}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx1872
      \intbl {\f0 {\f0\fs20 7.770e+05}}\cell
      
      \pard\plain\uc0\ql\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx2808
      \intbl {\f0 {\f0\fs20 grapefruit}}\cell
      
      \pard\plain\uc0\qc\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx3744
      \intbl {\f0 {\f0\fs20 seven}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx4680
      \intbl {\f0 {\f0\fs20 NA}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx5616
      \intbl {\f0 {\f0\fs20 19:10}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx6552
      \intbl {\f0 {\f0\fs20 2018-07-07 05:22}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx7488
      \intbl {\f0 {\f0\fs20 NA}}\cell
      
      \pard\plain\uc0\ql\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx8424
      \intbl {\f0 {\f0\fs20 row_7}}\cell
      
      \pard\plain\uc0\ql\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx9360
      \intbl {\f0 {\f0\fs20 grp_b}}\cell
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\ql\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx936
      \intbl {\f0 {\f0\fs20 }}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx1872
      \intbl {\f0 {\f0\fs20 8.880e+06}}\cell
      
      \pard\plain\uc0\ql\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx2808
      \intbl {\f0 {\f0\fs20 honeydew}}\cell
      
      \pard\plain\uc0\qc\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx3744
      \intbl {\f0 {\f0\fs20 eight}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx4680
      \intbl {\f0 {\f0\fs20 2015-08-15}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx5616
      \intbl {\f0 {\f0\fs20 20:20}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx6552
      \intbl {\f0 {\f0\fs20 NA}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx7488
      \intbl {\f0 {\f0\fs20 0.440}}\cell
      
      \pard\plain\uc0\ql\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx8424
      \intbl {\f0 {\f0\fs20 row_8}}\cell
      
      \pard\plain\uc0\ql\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx9360
      \intbl {\f0 {\f0\fs20 grp_b}}\cell
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\ql\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx936
      \intbl {\f0 {\f0\fs20 min}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx1872
      \intbl {\f0 {\f0\fs20 0.11}}\cell
      
      \pard\plain\uc0\ql\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx2808
      \intbl {\f0 {\f0\fs20 \'97}}\cell
      
      \pard\plain\uc0\qc\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx3744
      \intbl {\f0 {\f0\fs20 \'97}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx4680
      \intbl {\f0 {\f0\fs20 \'97}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx5616
      \intbl {\f0 {\f0\fs20 \'97}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx6552
      \intbl {\f0 {\f0\fs20 \'97}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx7488
      \intbl {\f0 {\f0\fs20 0.44}}\cell
      
      \pard\plain\uc0\ql\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx8424
      \intbl {\f0 {\f0\fs20 \'97}}\cell
      
      \pard\plain\uc0\ql\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx9360
      \intbl {\f0 {\f0\fs20 \'97}}\cell
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\ql\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx936
      \intbl {\f0 {\f0\fs20 max}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx1872
      \intbl {\f0 {\f0\fs20 8880000.00}}\cell
      
      \pard\plain\uc0\ql\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx2808
      \intbl {\f0 {\f0\fs20 \'97}}\cell
      
      \pard\plain\uc0\qc\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx3744
      \intbl {\f0 {\f0\fs20 \'97}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx4680
      \intbl {\f0 {\f0\fs20 \'97}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx5616
      \intbl {\f0 {\f0\fs20 \'97}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx6552
      \intbl {\f0 {\f0\fs20 \'97}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx7488
      \intbl {\f0 {\f0\fs20 65100.00}}\cell
      
      \pard\plain\uc0\ql\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx8424
      \intbl {\f0 {\f0\fs20 \'97}}\cell
      
      \pard\plain\uc0\ql\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx9360
      \intbl {\f0 {\f0\fs20 \'97}}\cell
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\ql\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx936
      \intbl {\f0 {\f0\fs20 avg}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx1872
      \intbl {\f0 {\f0\fs20 1380432.87}}\cell
      
      \pard\plain\uc0\ql\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx2808
      \intbl {\f0 {\f0\fs20 \'97}}\cell
      
      \pard\plain\uc0\qc\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx3744
      \intbl {\f0 {\f0\fs20 \'97}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx4680
      \intbl {\f0 {\f0\fs20 \'97}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx5616
      \intbl {\f0 {\f0\fs20 \'97}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx6552
      \intbl {\f0 {\f0\fs20 \'97}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx7488
      \intbl {\f0 {\f0\fs20 9501.26}}\cell
      
      \pard\plain\uc0\ql\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx8424
      \intbl {\f0 {\f0\fs20 \'97}}\cell
      
      \pard\plain\uc0\ql\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx9360
      \intbl {\f0 {\f0\fs20 \'97}}\cell
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\ql\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx9360
      \intbl {\f0 {\f0\fs20 Source note #1\line Source note #2}}\cell
      
      \row
      
      }

---

    Code
      cat(render_as_html(gt_tbl))
    Output
      <table class="gt_table" data-quarto-disable-processing="false" data-quarto-bootstrap="false">
        <thead>
          <tr class="gt_heading">
            <td colspan="10" class="gt_heading gt_title gt_font_normal" style><span class='gt_from_md'>Data listing from <strong>exibble</strong></span></td>
          </tr>
          <tr class="gt_heading">
            <td colspan="10" class="gt_heading gt_subtitle gt_font_normal gt_bottom_border" style><span class='gt_from_md'><code>exibble</code> is an R dataset</span></td>
          </tr>
          <tr class="gt_col_headings gt_spanner_row">
            <th class="gt_col_heading gt_columns_bottom_border gt_left" rowspan="2" colspan="1" scope="col" id="a::stub">S.L.</th>
            <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="2" colspan="1" scope="col" id="num">num</th>
            <th class="gt_col_heading gt_columns_bottom_border gt_left" rowspan="2" colspan="1" scope="col" id="char">char</th>
            <th class="gt_col_heading gt_columns_bottom_border gt_center" rowspan="2" colspan="1" scope="col" id="fctr">fctr</th>
            <th class="gt_center gt_columns_top_border gt_column_spanner_outer" rowspan="1" colspan="3" scope="colgroup" id="timing">
              <div class="gt_column_spanner">timing</div>
            </th>
            <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="2" colspan="1" scope="col" id="currency">currency</th>
            <th class="gt_col_heading gt_columns_bottom_border gt_left" rowspan="2" colspan="1" scope="col" id="row">row</th>
            <th class="gt_col_heading gt_columns_bottom_border gt_left" rowspan="2" colspan="1" scope="col" id="group">group</th>
          </tr>
          <tr class="gt_col_headings">
            <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id="date">date</th>
            <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id="time">time</th>
            <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id="datetime">datetime</th>
          </tr>
        </thead>
        <tbody class="gt_table_body">
          <tr><th id="stub_1_1" scope="row" class="gt_row gt_left gt_stub"></th>
      <td headers="stub_1_1 num" class="gt_row gt_right">1.111e-01</td>
      <td headers="stub_1_1 char" class="gt_row gt_left">apricot</td>
      <td headers="stub_1_1 fctr" class="gt_row gt_center">one</td>
      <td headers="stub_1_1 date" class="gt_row gt_right">2015-01-15</td>
      <td headers="stub_1_1 time" class="gt_row gt_right">13:35</td>
      <td headers="stub_1_1 datetime" class="gt_row gt_right">2018-01-01 02:22</td>
      <td headers="stub_1_1 currency" class="gt_row gt_right">49.950</td>
      <td headers="stub_1_1 row" class="gt_row gt_left">row_1</td>
      <td headers="stub_1_1 group" class="gt_row gt_left">grp_a</td></tr>
          <tr><th id="stub_1_2" scope="row" class="gt_row gt_left gt_stub"></th>
      <td headers="stub_1_2 num" class="gt_row gt_right">2.222e+00</td>
      <td headers="stub_1_2 char" class="gt_row gt_left">banana</td>
      <td headers="stub_1_2 fctr" class="gt_row gt_center">two</td>
      <td headers="stub_1_2 date" class="gt_row gt_right">2015-02-15</td>
      <td headers="stub_1_2 time" class="gt_row gt_right">14:40</td>
      <td headers="stub_1_2 datetime" class="gt_row gt_right">2018-02-02 14:33</td>
      <td headers="stub_1_2 currency" class="gt_row gt_right">17.950</td>
      <td headers="stub_1_2 row" class="gt_row gt_left">row_2</td>
      <td headers="stub_1_2 group" class="gt_row gt_left">grp_a</td></tr>
          <tr><th id="stub_1_3" scope="row" class="gt_row gt_left gt_stub"></th>
      <td headers="stub_1_3 num" class="gt_row gt_right">3.333e+01</td>
      <td headers="stub_1_3 char" class="gt_row gt_left">coconut</td>
      <td headers="stub_1_3 fctr" class="gt_row gt_center">three</td>
      <td headers="stub_1_3 date" class="gt_row gt_right">2015-03-15</td>
      <td headers="stub_1_3 time" class="gt_row gt_right">15:45</td>
      <td headers="stub_1_3 datetime" class="gt_row gt_right">2018-03-03 03:44</td>
      <td headers="stub_1_3 currency" class="gt_row gt_right">1.390</td>
      <td headers="stub_1_3 row" class="gt_row gt_left">row_3</td>
      <td headers="stub_1_3 group" class="gt_row gt_left">grp_a</td></tr>
          <tr><th id="stub_1_4" scope="row" class="gt_row gt_left gt_stub"></th>
      <td headers="stub_1_4 num" class="gt_row gt_right">4.444e+02</td>
      <td headers="stub_1_4 char" class="gt_row gt_left">durian</td>
      <td headers="stub_1_4 fctr" class="gt_row gt_center">four</td>
      <td headers="stub_1_4 date" class="gt_row gt_right">2015-04-15</td>
      <td headers="stub_1_4 time" class="gt_row gt_right">16:50</td>
      <td headers="stub_1_4 datetime" class="gt_row gt_right">2018-04-04 15:55</td>
      <td headers="stub_1_4 currency" class="gt_row gt_right">65100.000</td>
      <td headers="stub_1_4 row" class="gt_row gt_left">row_4</td>
      <td headers="stub_1_4 group" class="gt_row gt_left">grp_a</td></tr>
          <tr><th id="stub_1_5" scope="row" class="gt_row gt_left gt_stub"></th>
      <td headers="stub_1_5 num" class="gt_row gt_right">5.550e+03</td>
      <td headers="stub_1_5 char" class="gt_row gt_left">NA</td>
      <td headers="stub_1_5 fctr" class="gt_row gt_center">five</td>
      <td headers="stub_1_5 date" class="gt_row gt_right">2015-05-15</td>
      <td headers="stub_1_5 time" class="gt_row gt_right">17:55</td>
      <td headers="stub_1_5 datetime" class="gt_row gt_right">2018-05-05 04:00</td>
      <td headers="stub_1_5 currency" class="gt_row gt_right">1325.810</td>
      <td headers="stub_1_5 row" class="gt_row gt_left">row_5</td>
      <td headers="stub_1_5 group" class="gt_row gt_left">grp_b</td></tr>
          <tr><th id="stub_1_6" scope="row" class="gt_row gt_left gt_stub"></th>
      <td headers="stub_1_6 num" class="gt_row gt_right">NA</td>
      <td headers="stub_1_6 char" class="gt_row gt_left">fig</td>
      <td headers="stub_1_6 fctr" class="gt_row gt_center">six</td>
      <td headers="stub_1_6 date" class="gt_row gt_right">2015-06-15</td>
      <td headers="stub_1_6 time" class="gt_row gt_right">NA</td>
      <td headers="stub_1_6 datetime" class="gt_row gt_right">2018-06-06 16:11</td>
      <td headers="stub_1_6 currency" class="gt_row gt_right">13.255</td>
      <td headers="stub_1_6 row" class="gt_row gt_left">row_6</td>
      <td headers="stub_1_6 group" class="gt_row gt_left">grp_b</td></tr>
          <tr><th id="stub_1_7" scope="row" class="gt_row gt_left gt_stub"></th>
      <td headers="stub_1_7 num" class="gt_row gt_right">7.770e+05</td>
      <td headers="stub_1_7 char" class="gt_row gt_left">grapefruit</td>
      <td headers="stub_1_7 fctr" class="gt_row gt_center">seven</td>
      <td headers="stub_1_7 date" class="gt_row gt_right">NA</td>
      <td headers="stub_1_7 time" class="gt_row gt_right">19:10</td>
      <td headers="stub_1_7 datetime" class="gt_row gt_right">2018-07-07 05:22</td>
      <td headers="stub_1_7 currency" class="gt_row gt_right">NA</td>
      <td headers="stub_1_7 row" class="gt_row gt_left">row_7</td>
      <td headers="stub_1_7 group" class="gt_row gt_left">grp_b</td></tr>
          <tr><th id="stub_1_8" scope="row" class="gt_row gt_left gt_stub"></th>
      <td headers="stub_1_8 num" class="gt_row gt_right">8.880e+06</td>
      <td headers="stub_1_8 char" class="gt_row gt_left">honeydew</td>
      <td headers="stub_1_8 fctr" class="gt_row gt_center">eight</td>
      <td headers="stub_1_8 date" class="gt_row gt_right">2015-08-15</td>
      <td headers="stub_1_8 time" class="gt_row gt_right">20:20</td>
      <td headers="stub_1_8 datetime" class="gt_row gt_right">NA</td>
      <td headers="stub_1_8 currency" class="gt_row gt_right">0.440</td>
      <td headers="stub_1_8 row" class="gt_row gt_left">row_8</td>
      <td headers="stub_1_8 group" class="gt_row gt_left">grp_b</td></tr>
          <tr><th id="grand_summary_stub_1" scope="row" class="gt_row gt_left gt_stub gt_grand_summary_row gt_first_grand_summary_row">min</th>
      <td headers="grand_summary_stub_1 num" class="gt_row gt_right gt_grand_summary_row gt_first_grand_summary_row">0.11</td>
      <td headers="grand_summary_stub_1 char" class="gt_row gt_left gt_grand_summary_row gt_first_grand_summary_row">—</td>
      <td headers="grand_summary_stub_1 fctr" class="gt_row gt_center gt_grand_summary_row gt_first_grand_summary_row">—</td>
      <td headers="grand_summary_stub_1 date" class="gt_row gt_right gt_grand_summary_row gt_first_grand_summary_row">—</td>
      <td headers="grand_summary_stub_1 time" class="gt_row gt_right gt_grand_summary_row gt_first_grand_summary_row">—</td>
      <td headers="grand_summary_stub_1 datetime" class="gt_row gt_right gt_grand_summary_row gt_first_grand_summary_row">—</td>
      <td headers="grand_summary_stub_1 currency" class="gt_row gt_right gt_grand_summary_row gt_first_grand_summary_row">0.44</td>
      <td headers="grand_summary_stub_1 row" class="gt_row gt_left gt_grand_summary_row gt_first_grand_summary_row">—</td>
      <td headers="grand_summary_stub_1 group" class="gt_row gt_left gt_grand_summary_row gt_first_grand_summary_row">—</td></tr>
          <tr><th id="grand_summary_stub_2" scope="row" class="gt_row gt_left gt_stub gt_grand_summary_row">max</th>
      <td headers="grand_summary_stub_2 num" class="gt_row gt_right gt_grand_summary_row">8880000.00</td>
      <td headers="grand_summary_stub_2 char" class="gt_row gt_left gt_grand_summary_row">—</td>
      <td headers="grand_summary_stub_2 fctr" class="gt_row gt_center gt_grand_summary_row">—</td>
      <td headers="grand_summary_stub_2 date" class="gt_row gt_right gt_grand_summary_row">—</td>
      <td headers="grand_summary_stub_2 time" class="gt_row gt_right gt_grand_summary_row">—</td>
      <td headers="grand_summary_stub_2 datetime" class="gt_row gt_right gt_grand_summary_row">—</td>
      <td headers="grand_summary_stub_2 currency" class="gt_row gt_right gt_grand_summary_row">65100.00</td>
      <td headers="grand_summary_stub_2 row" class="gt_row gt_left gt_grand_summary_row">—</td>
      <td headers="grand_summary_stub_2 group" class="gt_row gt_left gt_grand_summary_row">—</td></tr>
          <tr><th id="grand_summary_stub_3" scope="row" class="gt_row gt_left gt_stub gt_grand_summary_row gt_last_summary_row">avg</th>
      <td headers="grand_summary_stub_3 num" class="gt_row gt_right gt_grand_summary_row gt_last_summary_row">1380432.87</td>
      <td headers="grand_summary_stub_3 char" class="gt_row gt_left gt_grand_summary_row gt_last_summary_row">—</td>
      <td headers="grand_summary_stub_3 fctr" class="gt_row gt_center gt_grand_summary_row gt_last_summary_row">—</td>
      <td headers="grand_summary_stub_3 date" class="gt_row gt_right gt_grand_summary_row gt_last_summary_row">—</td>
      <td headers="grand_summary_stub_3 time" class="gt_row gt_right gt_grand_summary_row gt_last_summary_row">—</td>
      <td headers="grand_summary_stub_3 datetime" class="gt_row gt_right gt_grand_summary_row gt_last_summary_row">—</td>
      <td headers="grand_summary_stub_3 currency" class="gt_row gt_right gt_grand_summary_row gt_last_summary_row">9501.26</td>
      <td headers="grand_summary_stub_3 row" class="gt_row gt_left gt_grand_summary_row gt_last_summary_row">—</td>
      <td headers="grand_summary_stub_3 group" class="gt_row gt_left gt_grand_summary_row gt_last_summary_row">—</td></tr>
        </tbody>
        <tfoot>
          <tr class="gt_sourcenotes">
            <td class="gt_sourcenote" colspan="10">Source note #1</td>
          </tr>
          <tr class="gt_sourcenotes">
            <td class="gt_sourcenote" colspan="10">Source note #2</td>
          </tr>
        </tfoot>
      </table>

---

    Code
      as.character(as_latex(gt_tbl))
    Output
      [1] "\\begingroup\n\\fontsize{12.0pt}{14.0pt}\\selectfont\n\\setlength{\\LTpost}{0mm}\n\\begin{longtable}{l|rlcrrrrll}\n\\caption*{\n{\\fontsize{20}{25}\\selectfont  Data listing from \\textbf{exibble}\\fontsize{12}{15}\\selectfont } \\\\ \n{\\fontsize{14}{17}\\selectfont  \\texttt{exibble} is an R dataset\\fontsize{12}{15}\\selectfont }\n} \\\\ \n\\toprule\n &  &  &  & \\multicolumn{3}{c}{timing} &  &  &  \\\\ \n\\cmidrule(lr){5-7}\nS.L. & num & char & fctr & date & time & datetime & currency & row & group \\\\ \n\\midrule\\addlinespace[2.5pt]\n & 1.111e-01 & apricot & one & 2015-01-15 & 13:35 & 2018-01-01 02:22 & 49.950 & row\\_1 & grp\\_a \\\\ \n & 2.222e+00 & banana & two & 2015-02-15 & 14:40 & 2018-02-02 14:33 & 17.950 & row\\_2 & grp\\_a \\\\ \n & 3.333e+01 & coconut & three & 2015-03-15 & 15:45 & 2018-03-03 03:44 & 1.390 & row\\_3 & grp\\_a \\\\ \n & 4.444e+02 & durian & four & 2015-04-15 & 16:50 & 2018-04-04 15:55 & 65100.000 & row\\_4 & grp\\_a \\\\ \n & 5.550e+03 & NA & five & 2015-05-15 & 17:55 & 2018-05-05 04:00 & 1325.810 & row\\_5 & grp\\_b \\\\ \n & NA & fig & six & 2015-06-15 & NA & 2018-06-06 16:11 & 13.255 & row\\_6 & grp\\_b \\\\ \n & 7.770e+05 & grapefruit & seven & NA & 19:10 & 2018-07-07 05:22 & NA & row\\_7 & grp\\_b \\\\ \n & 8.880e+06 & honeydew & eight & 2015-08-15 & 20:20 & NA & 0.440 & row\\_8 & grp\\_b \\\\ \n\\midrule \n\\midrule \nmin & 0.11 & — & — & — & — & — & 0.44 & — & — \\\\ \nmax & 8880000.00 & — & — & — & — & — & 65100.00 & — & — \\\\ \navg & 1380432.87 & — & — & — & — & — & 9501.26 & — & — \\\\ \n\\bottomrule\n\\end{longtable}\n\\begin{minipage}{\\linewidth}\n\\vspace{.05em}\nSource note \\#1\\\\\nSource note \\#2\\\\\n\\end{minipage}\n\\endgroup\n"

---

    Code
      as_rtf(gt_tbl)
    Output
      {\rtf\ansi\ansicpg1252{\fonttbl{\f0\froman\fcharset0\fprq0 Courier New;}{\f1\froman\fcharset0\fprq0 Times;}}{\colortbl;\red51\green51\blue51;\red211\green211\blue211;}
      
      \paperw12240\paperh15840\widowctrl\ftnbj\fet0\sectd\linex0
      \lndscpsxn
      \margl1440\margr1440\margt1440\margb1440
      \headery720\footery720\fs20
      
      \trowd\trrh0\trhdr
      
      \pard\plain\uc0\qc\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx9360
      \intbl {\f0\cf1 {\f0\fs20 Data listing from {\b exibble}} {\f0\fs20\i\super } \line {\f0\fs20 {\f1 exibble} is an R dataset} {\f0\fs20\i\super }}\cell
      
      \row
      
      \trowd\trrh0\trhdr
      
      \pard\plain\uc0\qc\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx936
      \intbl {\f0 {\f0\fs20 }}\cell
      
      \pard\plain\uc0\qc\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx1872
      \intbl {\f0 {\f0\fs20 }}\cell
      
      \pard\plain\uc0\qc\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx2808
      \intbl {\f0 {\f0\fs20 }}\cell
      
      \pard\plain\uc0\qc\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx3744
      \intbl {\f0 {\f0\fs20 }}\cell
      
      \pard\plain\uc0\qc\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85\clbrdrb\brdrs\brdrw20\brdrcf2\clmgf \cellx4680
      \intbl {\f0 {\f0\fs20 timing}}\cell
      
      \pard\plain\uc0\qc\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85\clmrg \cellx5616
      \intbl {\f0 {\f0\fs20 }}\cell
      
      \pard\plain\uc0\qc\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85\clmrg \cellx6552
      \intbl {\f0 {\f0\fs20 }}\cell
      
      \pard\plain\uc0\qc\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx7488
      \intbl {\f0 {\f0\fs20 }}\cell
      
      \pard\plain\uc0\qc\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx8424
      \intbl {\f0 {\f0\fs20 }}\cell
      
      \pard\plain\uc0\qc\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx9360
      \intbl {\f0 {\f0\fs20 }}\cell
      
      \row
      
      \trowd\trrh0\trhdr
      
      \pard\plain\uc0\ql\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85\clbrdrb\brdrs\brdrw20\brdrcf2 \cellx936
      \intbl {\f0 {\f0\fs20 S.L.}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85\clbrdrb\brdrs\brdrw20\brdrcf2 \cellx1872
      \intbl {\f0 {\f0\fs20 num}}\cell
      
      \pard\plain\uc0\ql\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85\clbrdrb\brdrs\brdrw20\brdrcf2 \cellx2808
      \intbl {\f0 {\f0\fs20 char}}\cell
      
      \pard\plain\uc0\qc\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85\clbrdrb\brdrs\brdrw20\brdrcf2 \cellx3744
      \intbl {\f0 {\f0\fs20 fctr}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85\clbrdrb\brdrs\brdrw20\brdrcf2 \cellx4680
      \intbl {\f0 {\f0\fs20 date}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85\clbrdrb\brdrs\brdrw20\brdrcf2 \cellx5616
      \intbl {\f0 {\f0\fs20 time}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85\clbrdrb\brdrs\brdrw20\brdrcf2 \cellx6552
      \intbl {\f0 {\f0\fs20 datetime}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85\clbrdrb\brdrs\brdrw20\brdrcf2 \cellx7488
      \intbl {\f0 {\f0\fs20 currency}}\cell
      
      \pard\plain\uc0\ql\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85\clbrdrb\brdrs\brdrw20\brdrcf2 \cellx8424
      \intbl {\f0 {\f0\fs20 row}}\cell
      
      \pard\plain\uc0\ql\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85\clbrdrb\brdrs\brdrw20\brdrcf2 \cellx9360
      \intbl {\f0 {\f0\fs20 group}}\cell
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\ql\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx936
      \intbl {\f0 {\f0\fs20 }}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx1872
      \intbl {\f0 {\f0\fs20 1.111e-01}}\cell
      
      \pard\plain\uc0\ql\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx2808
      \intbl {\f0 {\f0\fs20 apricot}}\cell
      
      \pard\plain\uc0\qc\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx3744
      \intbl {\f0 {\f0\fs20 one}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx4680
      \intbl {\f0 {\f0\fs20 2015-01-15}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx5616
      \intbl {\f0 {\f0\fs20 13:35}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx6552
      \intbl {\f0 {\f0\fs20 2018-01-01 02:22}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx7488
      \intbl {\f0 {\f0\fs20 49.950}}\cell
      
      \pard\plain\uc0\ql\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx8424
      \intbl {\f0 {\f0\fs20 row_1}}\cell
      
      \pard\plain\uc0\ql\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx9360
      \intbl {\f0 {\f0\fs20 grp_a}}\cell
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\ql\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx936
      \intbl {\f0 {\f0\fs20 }}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx1872
      \intbl {\f0 {\f0\fs20 2.222e+00}}\cell
      
      \pard\plain\uc0\ql\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx2808
      \intbl {\f0 {\f0\fs20 banana}}\cell
      
      \pard\plain\uc0\qc\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx3744
      \intbl {\f0 {\f0\fs20 two}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx4680
      \intbl {\f0 {\f0\fs20 2015-02-15}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx5616
      \intbl {\f0 {\f0\fs20 14:40}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx6552
      \intbl {\f0 {\f0\fs20 2018-02-02 14:33}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx7488
      \intbl {\f0 {\f0\fs20 17.950}}\cell
      
      \pard\plain\uc0\ql\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx8424
      \intbl {\f0 {\f0\fs20 row_2}}\cell
      
      \pard\plain\uc0\ql\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx9360
      \intbl {\f0 {\f0\fs20 grp_a}}\cell
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\ql\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx936
      \intbl {\f0 {\f0\fs20 }}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx1872
      \intbl {\f0 {\f0\fs20 3.333e+01}}\cell
      
      \pard\plain\uc0\ql\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx2808
      \intbl {\f0 {\f0\fs20 coconut}}\cell
      
      \pard\plain\uc0\qc\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx3744
      \intbl {\f0 {\f0\fs20 three}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx4680
      \intbl {\f0 {\f0\fs20 2015-03-15}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx5616
      \intbl {\f0 {\f0\fs20 15:45}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx6552
      \intbl {\f0 {\f0\fs20 2018-03-03 03:44}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx7488
      \intbl {\f0 {\f0\fs20 1.390}}\cell
      
      \pard\plain\uc0\ql\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx8424
      \intbl {\f0 {\f0\fs20 row_3}}\cell
      
      \pard\plain\uc0\ql\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx9360
      \intbl {\f0 {\f0\fs20 grp_a}}\cell
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\ql\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx936
      \intbl {\f0 {\f0\fs20 }}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx1872
      \intbl {\f0 {\f0\fs20 4.444e+02}}\cell
      
      \pard\plain\uc0\ql\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx2808
      \intbl {\f0 {\f0\fs20 durian}}\cell
      
      \pard\plain\uc0\qc\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx3744
      \intbl {\f0 {\f0\fs20 four}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx4680
      \intbl {\f0 {\f0\fs20 2015-04-15}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx5616
      \intbl {\f0 {\f0\fs20 16:50}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx6552
      \intbl {\f0 {\f0\fs20 2018-04-04 15:55}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx7488
      \intbl {\f0 {\f0\fs20 65100.000}}\cell
      
      \pard\plain\uc0\ql\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx8424
      \intbl {\f0 {\f0\fs20 row_4}}\cell
      
      \pard\plain\uc0\ql\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx9360
      \intbl {\f0 {\f0\fs20 grp_a}}\cell
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\ql\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx936
      \intbl {\f0 {\f0\fs20 }}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx1872
      \intbl {\f0 {\f0\fs20 5.550e+03}}\cell
      
      \pard\plain\uc0\ql\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx2808
      \intbl {\f0 {\f0\fs20 NA}}\cell
      
      \pard\plain\uc0\qc\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx3744
      \intbl {\f0 {\f0\fs20 five}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx4680
      \intbl {\f0 {\f0\fs20 2015-05-15}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx5616
      \intbl {\f0 {\f0\fs20 17:55}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx6552
      \intbl {\f0 {\f0\fs20 2018-05-05 04:00}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx7488
      \intbl {\f0 {\f0\fs20 1325.810}}\cell
      
      \pard\plain\uc0\ql\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx8424
      \intbl {\f0 {\f0\fs20 row_5}}\cell
      
      \pard\plain\uc0\ql\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx9360
      \intbl {\f0 {\f0\fs20 grp_b}}\cell
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\ql\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx936
      \intbl {\f0 {\f0\fs20 }}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx1872
      \intbl {\f0 {\f0\fs20 NA}}\cell
      
      \pard\plain\uc0\ql\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx2808
      \intbl {\f0 {\f0\fs20 fig}}\cell
      
      \pard\plain\uc0\qc\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx3744
      \intbl {\f0 {\f0\fs20 six}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx4680
      \intbl {\f0 {\f0\fs20 2015-06-15}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx5616
      \intbl {\f0 {\f0\fs20 NA}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx6552
      \intbl {\f0 {\f0\fs20 2018-06-06 16:11}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx7488
      \intbl {\f0 {\f0\fs20 13.255}}\cell
      
      \pard\plain\uc0\ql\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx8424
      \intbl {\f0 {\f0\fs20 row_6}}\cell
      
      \pard\plain\uc0\ql\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx9360
      \intbl {\f0 {\f0\fs20 grp_b}}\cell
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\ql\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx936
      \intbl {\f0 {\f0\fs20 }}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx1872
      \intbl {\f0 {\f0\fs20 7.770e+05}}\cell
      
      \pard\plain\uc0\ql\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx2808
      \intbl {\f0 {\f0\fs20 grapefruit}}\cell
      
      \pard\plain\uc0\qc\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx3744
      \intbl {\f0 {\f0\fs20 seven}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx4680
      \intbl {\f0 {\f0\fs20 NA}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx5616
      \intbl {\f0 {\f0\fs20 19:10}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx6552
      \intbl {\f0 {\f0\fs20 2018-07-07 05:22}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx7488
      \intbl {\f0 {\f0\fs20 NA}}\cell
      
      \pard\plain\uc0\ql\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx8424
      \intbl {\f0 {\f0\fs20 row_7}}\cell
      
      \pard\plain\uc0\ql\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx9360
      \intbl {\f0 {\f0\fs20 grp_b}}\cell
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\ql\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx936
      \intbl {\f0 {\f0\fs20 }}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx1872
      \intbl {\f0 {\f0\fs20 8.880e+06}}\cell
      
      \pard\plain\uc0\ql\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx2808
      \intbl {\f0 {\f0\fs20 honeydew}}\cell
      
      \pard\plain\uc0\qc\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx3744
      \intbl {\f0 {\f0\fs20 eight}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx4680
      \intbl {\f0 {\f0\fs20 2015-08-15}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx5616
      \intbl {\f0 {\f0\fs20 20:20}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx6552
      \intbl {\f0 {\f0\fs20 NA}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx7488
      \intbl {\f0 {\f0\fs20 0.440}}\cell
      
      \pard\plain\uc0\ql\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx8424
      \intbl {\f0 {\f0\fs20 row_8}}\cell
      
      \pard\plain\uc0\ql\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx9360
      \intbl {\f0 {\f0\fs20 grp_b}}\cell
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\ql\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx936
      \intbl {\f0 {\f0\fs20 min}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx1872
      \intbl {\f0 {\f0\fs20 0.11}}\cell
      
      \pard\plain\uc0\ql\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx2808
      \intbl {\f0 {\f0\fs20 \'97}}\cell
      
      \pard\plain\uc0\qc\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx3744
      \intbl {\f0 {\f0\fs20 \'97}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx4680
      \intbl {\f0 {\f0\fs20 \'97}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx5616
      \intbl {\f0 {\f0\fs20 \'97}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx6552
      \intbl {\f0 {\f0\fs20 \'97}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx7488
      \intbl {\f0 {\f0\fs20 0.44}}\cell
      
      \pard\plain\uc0\ql\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx8424
      \intbl {\f0 {\f0\fs20 \'97}}\cell
      
      \pard\plain\uc0\ql\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx9360
      \intbl {\f0 {\f0\fs20 \'97}}\cell
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\ql\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx936
      \intbl {\f0 {\f0\fs20 max}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx1872
      \intbl {\f0 {\f0\fs20 8880000.00}}\cell
      
      \pard\plain\uc0\ql\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx2808
      \intbl {\f0 {\f0\fs20 \'97}}\cell
      
      \pard\plain\uc0\qc\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx3744
      \intbl {\f0 {\f0\fs20 \'97}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx4680
      \intbl {\f0 {\f0\fs20 \'97}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx5616
      \intbl {\f0 {\f0\fs20 \'97}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx6552
      \intbl {\f0 {\f0\fs20 \'97}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx7488
      \intbl {\f0 {\f0\fs20 65100.00}}\cell
      
      \pard\plain\uc0\ql\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx8424
      \intbl {\f0 {\f0\fs20 \'97}}\cell
      
      \pard\plain\uc0\ql\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx9360
      \intbl {\f0 {\f0\fs20 \'97}}\cell
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\ql\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx936
      \intbl {\f0 {\f0\fs20 avg}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx1872
      \intbl {\f0 {\f0\fs20 1380432.87}}\cell
      
      \pard\plain\uc0\ql\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx2808
      \intbl {\f0 {\f0\fs20 \'97}}\cell
      
      \pard\plain\uc0\qc\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx3744
      \intbl {\f0 {\f0\fs20 \'97}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx4680
      \intbl {\f0 {\f0\fs20 \'97}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx5616
      \intbl {\f0 {\f0\fs20 \'97}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx6552
      \intbl {\f0 {\f0\fs20 \'97}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx7488
      \intbl {\f0 {\f0\fs20 9501.26}}\cell
      
      \pard\plain\uc0\ql\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx8424
      \intbl {\f0 {\f0\fs20 \'97}}\cell
      
      \pard\plain\uc0\ql\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx9360
      \intbl {\f0 {\f0\fs20 \'97}}\cell
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\ql\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx9360
      \intbl {\f0 {\f0\fs20 Source note #1\line Source note #2}}\cell
      
      \row
      
      }

---

    Code
      cat(render_as_html(gt_tbl))
    Output
      <table class="gt_table" data-quarto-disable-processing="false" data-quarto-bootstrap="false">
        <thead>
          <tr class="gt_heading">
            <td colspan="9" class="gt_heading gt_title gt_font_normal" style><span class='gt_from_md'>Data listing from <strong>exibble</strong></span></td>
          </tr>
          <tr class="gt_heading">
            <td colspan="9" class="gt_heading gt_subtitle gt_font_normal gt_bottom_border" style><span class='gt_from_md'><code>exibble</code> is an R dataset</span></td>
          </tr>
          <tr class="gt_col_headings gt_spanner_row">
            <th class="gt_col_heading gt_columns_bottom_border gt_left" rowspan="2" colspan="1" scope="col" id="a::stub">S.L.</th>
            <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="2" colspan="1" scope="col" id="num">num</th>
            <th class="gt_col_heading gt_columns_bottom_border gt_left" rowspan="2" colspan="1" scope="col" id="char">char</th>
            <th class="gt_col_heading gt_columns_bottom_border gt_center" rowspan="2" colspan="1" scope="col" id="fctr">fctr</th>
            <th class="gt_center gt_columns_top_border gt_column_spanner_outer" rowspan="1" colspan="3" scope="colgroup" id="timing">
              <div class="gt_column_spanner">timing</div>
            </th>
            <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="2" colspan="1" scope="col" id="currency">currency</th>
            <th class="gt_col_heading gt_columns_bottom_border gt_left" rowspan="2" colspan="1" scope="col" id="row">row</th>
          </tr>
          <tr class="gt_col_headings">
            <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id="date">date</th>
            <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id="time">time</th>
            <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id="datetime">datetime</th>
          </tr>
        </thead>
        <tbody class="gt_table_body">
          <tr class="gt_group_heading_row">
            <th colspan="9" class="gt_group_heading" scope="colgroup" id="grp_a">grp_a</th>
          </tr>
          <tr class="gt_row_group_first"><th id="stub_1_1" scope="row" class="gt_row gt_left gt_stub"></th>
      <td headers="grp_a stub_1_1 num" class="gt_row gt_right">1.111e-01</td>
      <td headers="grp_a stub_1_1 char" class="gt_row gt_left">apricot</td>
      <td headers="grp_a stub_1_1 fctr" class="gt_row gt_center">one</td>
      <td headers="grp_a stub_1_1 date" class="gt_row gt_right">2015-01-15</td>
      <td headers="grp_a stub_1_1 time" class="gt_row gt_right">13:35</td>
      <td headers="grp_a stub_1_1 datetime" class="gt_row gt_right">2018-01-01 02:22</td>
      <td headers="grp_a stub_1_1 currency" class="gt_row gt_right">49.950</td>
      <td headers="grp_a stub_1_1 row" class="gt_row gt_left">row_1</td></tr>
          <tr><th id="stub_1_2" scope="row" class="gt_row gt_left gt_stub"></th>
      <td headers="grp_a stub_1_2 num" class="gt_row gt_right">2.222e+00</td>
      <td headers="grp_a stub_1_2 char" class="gt_row gt_left">banana</td>
      <td headers="grp_a stub_1_2 fctr" class="gt_row gt_center">two</td>
      <td headers="grp_a stub_1_2 date" class="gt_row gt_right">2015-02-15</td>
      <td headers="grp_a stub_1_2 time" class="gt_row gt_right">14:40</td>
      <td headers="grp_a stub_1_2 datetime" class="gt_row gt_right">2018-02-02 14:33</td>
      <td headers="grp_a stub_1_2 currency" class="gt_row gt_right">17.950</td>
      <td headers="grp_a stub_1_2 row" class="gt_row gt_left">row_2</td></tr>
          <tr><th id="stub_1_3" scope="row" class="gt_row gt_left gt_stub"></th>
      <td headers="grp_a stub_1_3 num" class="gt_row gt_right">3.333e+01</td>
      <td headers="grp_a stub_1_3 char" class="gt_row gt_left">coconut</td>
      <td headers="grp_a stub_1_3 fctr" class="gt_row gt_center">three</td>
      <td headers="grp_a stub_1_3 date" class="gt_row gt_right">2015-03-15</td>
      <td headers="grp_a stub_1_3 time" class="gt_row gt_right">15:45</td>
      <td headers="grp_a stub_1_3 datetime" class="gt_row gt_right">2018-03-03 03:44</td>
      <td headers="grp_a stub_1_3 currency" class="gt_row gt_right">1.390</td>
      <td headers="grp_a stub_1_3 row" class="gt_row gt_left">row_3</td></tr>
          <tr><th id="stub_1_4" scope="row" class="gt_row gt_left gt_stub"></th>
      <td headers="grp_a stub_1_4 num" class="gt_row gt_right">4.444e+02</td>
      <td headers="grp_a stub_1_4 char" class="gt_row gt_left">durian</td>
      <td headers="grp_a stub_1_4 fctr" class="gt_row gt_center">four</td>
      <td headers="grp_a stub_1_4 date" class="gt_row gt_right">2015-04-15</td>
      <td headers="grp_a stub_1_4 time" class="gt_row gt_right">16:50</td>
      <td headers="grp_a stub_1_4 datetime" class="gt_row gt_right">2018-04-04 15:55</td>
      <td headers="grp_a stub_1_4 currency" class="gt_row gt_right">65100.000</td>
      <td headers="grp_a stub_1_4 row" class="gt_row gt_left">row_4</td></tr>
          <tr><th id="summary_stub_grp_a_1" scope="row" class="gt_row gt_left gt_stub gt_summary_row gt_first_summary_row thick">min</th>
      <td headers="grp_a summary_stub_grp_a_1 num" class="gt_row gt_right gt_summary_row gt_first_summary_row thick">0.11</td>
      <td headers="grp_a summary_stub_grp_a_1 char" class="gt_row gt_left gt_summary_row gt_first_summary_row thick">—</td>
      <td headers="grp_a summary_stub_grp_a_1 fctr" class="gt_row gt_center gt_summary_row gt_first_summary_row thick">—</td>
      <td headers="grp_a summary_stub_grp_a_1 date" class="gt_row gt_right gt_summary_row gt_first_summary_row thick">—</td>
      <td headers="grp_a summary_stub_grp_a_1 time" class="gt_row gt_right gt_summary_row gt_first_summary_row thick">—</td>
      <td headers="grp_a summary_stub_grp_a_1 datetime" class="gt_row gt_right gt_summary_row gt_first_summary_row thick">—</td>
      <td headers="grp_a summary_stub_grp_a_1 currency" class="gt_row gt_right gt_summary_row gt_first_summary_row thick">1.39</td>
      <td headers="grp_a summary_stub_grp_a_1 row" class="gt_row gt_left gt_summary_row gt_first_summary_row thick">—</td></tr>
          <tr><th id="summary_stub_grp_a_2" scope="row" class="gt_row gt_left gt_stub gt_summary_row">max</th>
      <td headers="grp_a summary_stub_grp_a_2 num" class="gt_row gt_right gt_summary_row">444.40</td>
      <td headers="grp_a summary_stub_grp_a_2 char" class="gt_row gt_left gt_summary_row">—</td>
      <td headers="grp_a summary_stub_grp_a_2 fctr" class="gt_row gt_center gt_summary_row">—</td>
      <td headers="grp_a summary_stub_grp_a_2 date" class="gt_row gt_right gt_summary_row">—</td>
      <td headers="grp_a summary_stub_grp_a_2 time" class="gt_row gt_right gt_summary_row">—</td>
      <td headers="grp_a summary_stub_grp_a_2 datetime" class="gt_row gt_right gt_summary_row">—</td>
      <td headers="grp_a summary_stub_grp_a_2 currency" class="gt_row gt_right gt_summary_row">65100.00</td>
      <td headers="grp_a summary_stub_grp_a_2 row" class="gt_row gt_left gt_summary_row">—</td></tr>
          <tr><th id="summary_stub_grp_a_3" scope="row" class="gt_row gt_left gt_stub gt_summary_row gt_last_summary_row">avg</th>
      <td headers="grp_a summary_stub_grp_a_3 num" class="gt_row gt_right gt_summary_row gt_last_summary_row">120.02</td>
      <td headers="grp_a summary_stub_grp_a_3 char" class="gt_row gt_left gt_summary_row gt_last_summary_row">—</td>
      <td headers="grp_a summary_stub_grp_a_3 fctr" class="gt_row gt_center gt_summary_row gt_last_summary_row">—</td>
      <td headers="grp_a summary_stub_grp_a_3 date" class="gt_row gt_right gt_summary_row gt_last_summary_row">—</td>
      <td headers="grp_a summary_stub_grp_a_3 time" class="gt_row gt_right gt_summary_row gt_last_summary_row">—</td>
      <td headers="grp_a summary_stub_grp_a_3 datetime" class="gt_row gt_right gt_summary_row gt_last_summary_row">—</td>
      <td headers="grp_a summary_stub_grp_a_3 currency" class="gt_row gt_right gt_summary_row gt_last_summary_row">16292.32</td>
      <td headers="grp_a summary_stub_grp_a_3 row" class="gt_row gt_left gt_summary_row gt_last_summary_row">—</td></tr>
          <tr class="gt_group_heading_row">
            <th colspan="9" class="gt_group_heading" scope="colgroup" id="grp_b">grp_b</th>
          </tr>
          <tr class="gt_row_group_first"><th id="stub_1_5" scope="row" class="gt_row gt_left gt_stub"></th>
      <td headers="grp_b stub_1_5 num" class="gt_row gt_right">5.550e+03</td>
      <td headers="grp_b stub_1_5 char" class="gt_row gt_left">NA</td>
      <td headers="grp_b stub_1_5 fctr" class="gt_row gt_center">five</td>
      <td headers="grp_b stub_1_5 date" class="gt_row gt_right">2015-05-15</td>
      <td headers="grp_b stub_1_5 time" class="gt_row gt_right">17:55</td>
      <td headers="grp_b stub_1_5 datetime" class="gt_row gt_right">2018-05-05 04:00</td>
      <td headers="grp_b stub_1_5 currency" class="gt_row gt_right">1325.810</td>
      <td headers="grp_b stub_1_5 row" class="gt_row gt_left">row_5</td></tr>
          <tr><th id="stub_1_6" scope="row" class="gt_row gt_left gt_stub"></th>
      <td headers="grp_b stub_1_6 num" class="gt_row gt_right">NA</td>
      <td headers="grp_b stub_1_6 char" class="gt_row gt_left">fig</td>
      <td headers="grp_b stub_1_6 fctr" class="gt_row gt_center">six</td>
      <td headers="grp_b stub_1_6 date" class="gt_row gt_right">2015-06-15</td>
      <td headers="grp_b stub_1_6 time" class="gt_row gt_right">NA</td>
      <td headers="grp_b stub_1_6 datetime" class="gt_row gt_right">2018-06-06 16:11</td>
      <td headers="grp_b stub_1_6 currency" class="gt_row gt_right">13.255</td>
      <td headers="grp_b stub_1_6 row" class="gt_row gt_left">row_6</td></tr>
          <tr><th id="stub_1_7" scope="row" class="gt_row gt_left gt_stub"></th>
      <td headers="grp_b stub_1_7 num" class="gt_row gt_right">7.770e+05</td>
      <td headers="grp_b stub_1_7 char" class="gt_row gt_left">grapefruit</td>
      <td headers="grp_b stub_1_7 fctr" class="gt_row gt_center">seven</td>
      <td headers="grp_b stub_1_7 date" class="gt_row gt_right">NA</td>
      <td headers="grp_b stub_1_7 time" class="gt_row gt_right">19:10</td>
      <td headers="grp_b stub_1_7 datetime" class="gt_row gt_right">2018-07-07 05:22</td>
      <td headers="grp_b stub_1_7 currency" class="gt_row gt_right">NA</td>
      <td headers="grp_b stub_1_7 row" class="gt_row gt_left">row_7</td></tr>
          <tr><th id="stub_1_8" scope="row" class="gt_row gt_left gt_stub"></th>
      <td headers="grp_b stub_1_8 num" class="gt_row gt_right">8.880e+06</td>
      <td headers="grp_b stub_1_8 char" class="gt_row gt_left">honeydew</td>
      <td headers="grp_b stub_1_8 fctr" class="gt_row gt_center">eight</td>
      <td headers="grp_b stub_1_8 date" class="gt_row gt_right">2015-08-15</td>
      <td headers="grp_b stub_1_8 time" class="gt_row gt_right">20:20</td>
      <td headers="grp_b stub_1_8 datetime" class="gt_row gt_right">NA</td>
      <td headers="grp_b stub_1_8 currency" class="gt_row gt_right">0.440</td>
      <td headers="grp_b stub_1_8 row" class="gt_row gt_left">row_8</td></tr>
          <tr><th id="summary_stub_grp_b_1" scope="row" class="gt_row gt_left gt_stub gt_summary_row gt_first_summary_row thick">min</th>
      <td headers="grp_b summary_stub_grp_b_1 num" class="gt_row gt_right gt_summary_row gt_first_summary_row thick">5550.00</td>
      <td headers="grp_b summary_stub_grp_b_1 char" class="gt_row gt_left gt_summary_row gt_first_summary_row thick">—</td>
      <td headers="grp_b summary_stub_grp_b_1 fctr" class="gt_row gt_center gt_summary_row gt_first_summary_row thick">—</td>
      <td headers="grp_b summary_stub_grp_b_1 date" class="gt_row gt_right gt_summary_row gt_first_summary_row thick">—</td>
      <td headers="grp_b summary_stub_grp_b_1 time" class="gt_row gt_right gt_summary_row gt_first_summary_row thick">—</td>
      <td headers="grp_b summary_stub_grp_b_1 datetime" class="gt_row gt_right gt_summary_row gt_first_summary_row thick">—</td>
      <td headers="grp_b summary_stub_grp_b_1 currency" class="gt_row gt_right gt_summary_row gt_first_summary_row thick">0.44</td>
      <td headers="grp_b summary_stub_grp_b_1 row" class="gt_row gt_left gt_summary_row gt_first_summary_row thick">—</td></tr>
          <tr><th id="summary_stub_grp_b_2" scope="row" class="gt_row gt_left gt_stub gt_summary_row">max</th>
      <td headers="grp_b summary_stub_grp_b_2 num" class="gt_row gt_right gt_summary_row">8880000.00</td>
      <td headers="grp_b summary_stub_grp_b_2 char" class="gt_row gt_left gt_summary_row">—</td>
      <td headers="grp_b summary_stub_grp_b_2 fctr" class="gt_row gt_center gt_summary_row">—</td>
      <td headers="grp_b summary_stub_grp_b_2 date" class="gt_row gt_right gt_summary_row">—</td>
      <td headers="grp_b summary_stub_grp_b_2 time" class="gt_row gt_right gt_summary_row">—</td>
      <td headers="grp_b summary_stub_grp_b_2 datetime" class="gt_row gt_right gt_summary_row">—</td>
      <td headers="grp_b summary_stub_grp_b_2 currency" class="gt_row gt_right gt_summary_row">1325.81</td>
      <td headers="grp_b summary_stub_grp_b_2 row" class="gt_row gt_left gt_summary_row">—</td></tr>
          <tr><th id="summary_stub_grp_b_3" scope="row" class="gt_row gt_left gt_stub gt_summary_row gt_last_summary_row">avg</th>
      <td headers="grp_b summary_stub_grp_b_3 num" class="gt_row gt_right gt_summary_row gt_last_summary_row">3220850.00</td>
      <td headers="grp_b summary_stub_grp_b_3 char" class="gt_row gt_left gt_summary_row gt_last_summary_row">—</td>
      <td headers="grp_b summary_stub_grp_b_3 fctr" class="gt_row gt_center gt_summary_row gt_last_summary_row">—</td>
      <td headers="grp_b summary_stub_grp_b_3 date" class="gt_row gt_right gt_summary_row gt_last_summary_row">—</td>
      <td headers="grp_b summary_stub_grp_b_3 time" class="gt_row gt_right gt_summary_row gt_last_summary_row">—</td>
      <td headers="grp_b summary_stub_grp_b_3 datetime" class="gt_row gt_right gt_summary_row gt_last_summary_row">—</td>
      <td headers="grp_b summary_stub_grp_b_3 currency" class="gt_row gt_right gt_summary_row gt_last_summary_row">446.50</td>
      <td headers="grp_b summary_stub_grp_b_3 row" class="gt_row gt_left gt_summary_row gt_last_summary_row">—</td></tr>
          <tr><th id="grand_summary_stub_1" scope="row" class="gt_row gt_left gt_stub gt_grand_summary_row gt_first_grand_summary_row">min</th>
      <td headers="grand_summary_stub_1 num" class="gt_row gt_right gt_grand_summary_row gt_first_grand_summary_row">0.11</td>
      <td headers="grand_summary_stub_1 char" class="gt_row gt_left gt_grand_summary_row gt_first_grand_summary_row">—</td>
      <td headers="grand_summary_stub_1 fctr" class="gt_row gt_center gt_grand_summary_row gt_first_grand_summary_row">—</td>
      <td headers="grand_summary_stub_1 date" class="gt_row gt_right gt_grand_summary_row gt_first_grand_summary_row">—</td>
      <td headers="grand_summary_stub_1 time" class="gt_row gt_right gt_grand_summary_row gt_first_grand_summary_row">—</td>
      <td headers="grand_summary_stub_1 datetime" class="gt_row gt_right gt_grand_summary_row gt_first_grand_summary_row">—</td>
      <td headers="grand_summary_stub_1 currency" class="gt_row gt_right gt_grand_summary_row gt_first_grand_summary_row">0.44</td>
      <td headers="grand_summary_stub_1 row" class="gt_row gt_left gt_grand_summary_row gt_first_grand_summary_row">—</td></tr>
          <tr><th id="grand_summary_stub_2" scope="row" class="gt_row gt_left gt_stub gt_grand_summary_row">max</th>
      <td headers="grand_summary_stub_2 num" class="gt_row gt_right gt_grand_summary_row">8880000.00</td>
      <td headers="grand_summary_stub_2 char" class="gt_row gt_left gt_grand_summary_row">—</td>
      <td headers="grand_summary_stub_2 fctr" class="gt_row gt_center gt_grand_summary_row">—</td>
      <td headers="grand_summary_stub_2 date" class="gt_row gt_right gt_grand_summary_row">—</td>
      <td headers="grand_summary_stub_2 time" class="gt_row gt_right gt_grand_summary_row">—</td>
      <td headers="grand_summary_stub_2 datetime" class="gt_row gt_right gt_grand_summary_row">—</td>
      <td headers="grand_summary_stub_2 currency" class="gt_row gt_right gt_grand_summary_row">65100.00</td>
      <td headers="grand_summary_stub_2 row" class="gt_row gt_left gt_grand_summary_row">—</td></tr>
          <tr><th id="grand_summary_stub_3" scope="row" class="gt_row gt_left gt_stub gt_grand_summary_row gt_last_summary_row">avg</th>
      <td headers="grand_summary_stub_3 num" class="gt_row gt_right gt_grand_summary_row gt_last_summary_row">1380432.87</td>
      <td headers="grand_summary_stub_3 char" class="gt_row gt_left gt_grand_summary_row gt_last_summary_row">—</td>
      <td headers="grand_summary_stub_3 fctr" class="gt_row gt_center gt_grand_summary_row gt_last_summary_row">—</td>
      <td headers="grand_summary_stub_3 date" class="gt_row gt_right gt_grand_summary_row gt_last_summary_row">—</td>
      <td headers="grand_summary_stub_3 time" class="gt_row gt_right gt_grand_summary_row gt_last_summary_row">—</td>
      <td headers="grand_summary_stub_3 datetime" class="gt_row gt_right gt_grand_summary_row gt_last_summary_row">—</td>
      <td headers="grand_summary_stub_3 currency" class="gt_row gt_right gt_grand_summary_row gt_last_summary_row">9501.26</td>
      <td headers="grand_summary_stub_3 row" class="gt_row gt_left gt_grand_summary_row gt_last_summary_row">—</td></tr>
        </tbody>
        <tfoot>
          <tr class="gt_sourcenotes">
            <td class="gt_sourcenote" colspan="9">Source note #1</td>
          </tr>
          <tr class="gt_sourcenotes">
            <td class="gt_sourcenote" colspan="9">Source note #2</td>
          </tr>
        </tfoot>
      </table>

---

    Code
      as.character(as_latex(gt_tbl))
    Output
      [1] "\\begingroup\n\\fontsize{12.0pt}{14.0pt}\\selectfont\n\\setlength{\\LTpost}{0mm}\n\\begin{longtable}{l|rlcrrrrl}\n\\caption*{\n{\\fontsize{20}{25}\\selectfont  Data listing from \\textbf{exibble}\\fontsize{12}{15}\\selectfont } \\\\ \n{\\fontsize{14}{17}\\selectfont  \\texttt{exibble} is an R dataset\\fontsize{12}{15}\\selectfont }\n} \\\\ \n\\toprule\n &  &  &  & \\multicolumn{3}{c}{timing} &  &  \\\\ \n\\cmidrule(lr){5-7}\nS.L. & num & char & fctr & date & time & datetime & currency & row \\\\ \n\\midrule\\addlinespace[2.5pt]\n\\multicolumn{9}{l}{grp\\_a} \\\\[2.5pt] \n\\midrule\\addlinespace[2.5pt]\n & 1.111e-01 & apricot & one & 2015-01-15 & 13:35 & 2018-01-01 02:22 & 49.950 & row\\_1 \\\\ \n & 2.222e+00 & banana & two & 2015-02-15 & 14:40 & 2018-02-02 14:33 & 17.950 & row\\_2 \\\\ \n & 3.333e+01 & coconut & three & 2015-03-15 & 15:45 & 2018-03-03 03:44 & 1.390 & row\\_3 \\\\ \n & 4.444e+02 & durian & four & 2015-04-15 & 16:50 & 2018-04-04 15:55 & 65100.000 & row\\_4 \\\\ \n\\midrule \nmin & 0.11 & — & — & — & — & — & 1.39 & — \\\\ \nmax & 444.40 & — & — & — & — & — & 65100.00 & — \\\\ \navg & 120.02 & — & — & — & — & — & 16292.32 & — \\\\ \n\\midrule\\addlinespace[2.5pt]\n\\multicolumn{9}{l}{grp\\_b} \\\\[2.5pt] \n\\midrule\\addlinespace[2.5pt]\n & 5.550e+03 & NA & five & 2015-05-15 & 17:55 & 2018-05-05 04:00 & 1325.810 & row\\_5 \\\\ \n & NA & fig & six & 2015-06-15 & NA & 2018-06-06 16:11 & 13.255 & row\\_6 \\\\ \n & 7.770e+05 & grapefruit & seven & NA & 19:10 & 2018-07-07 05:22 & NA & row\\_7 \\\\ \n & 8.880e+06 & honeydew & eight & 2015-08-15 & 20:20 & NA & 0.440 & row\\_8 \\\\ \n\\midrule \nmin & 5550.00 & — & — & — & — & — & 0.44 & — \\\\ \nmax & 8880000.00 & — & — & — & — & — & 1325.81 & — \\\\ \navg & 3220850.00 & — & — & — & — & — & 446.50 & — \\\\ \n\\midrule \n\\midrule \nmin & 0.11 & — & — & — & — & — & 0.44 & — \\\\ \nmax & 8880000.00 & — & — & — & — & — & 65100.00 & — \\\\ \navg & 1380432.87 & — & — & — & — & — & 9501.26 & — \\\\ \n\\bottomrule\n\\end{longtable}\n\\begin{minipage}{\\linewidth}\n\\vspace{.05em}\nSource note \\#1\\\\\nSource note \\#2\\\\\n\\end{minipage}\n\\endgroup\n"

---

    Code
      as_rtf(gt_tbl)
    Output
      {\rtf\ansi\ansicpg1252{\fonttbl{\f0\froman\fcharset0\fprq0 Courier New;}{\f1\froman\fcharset0\fprq0 Times;}}{\colortbl;\red51\green51\blue51;\red211\green211\blue211;}
      
      \paperw12240\paperh15840\widowctrl\ftnbj\fet0\sectd\linex0
      \lndscpsxn
      \margl1440\margr1440\margt1440\margb1440
      \headery720\footery720\fs20
      
      \trowd\trrh0\trhdr
      
      \pard\plain\uc0\qc\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx9360
      \intbl {\f0\cf1 {\f0\fs20 Data listing from {\b exibble}} {\f0\fs20\i\super } \line {\f0\fs20 {\f1 exibble} is an R dataset} {\f0\fs20\i\super }}\cell
      
      \row
      
      \trowd\trrh0\trhdr
      
      \pard\plain\uc0\qc\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx1040
      \intbl {\f0 {\f0\fs20 }}\cell
      
      \pard\plain\uc0\qc\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx2080
      \intbl {\f0 {\f0\fs20 }}\cell
      
      \pard\plain\uc0\qc\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx3120
      \intbl {\f0 {\f0\fs20 }}\cell
      
      \pard\plain\uc0\qc\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx4160
      \intbl {\f0 {\f0\fs20 }}\cell
      
      \pard\plain\uc0\qc\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85\clbrdrb\brdrs\brdrw20\brdrcf2\clmgf \cellx5200
      \intbl {\f0 {\f0\fs20 timing}}\cell
      
      \pard\plain\uc0\qc\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85\clmrg \cellx6240
      \intbl {\f0 {\f0\fs20 }}\cell
      
      \pard\plain\uc0\qc\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85\clmrg \cellx7280
      \intbl {\f0 {\f0\fs20 }}\cell
      
      \pard\plain\uc0\qc\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx8320
      \intbl {\f0 {\f0\fs20 }}\cell
      
      \pard\plain\uc0\qc\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx9360
      \intbl {\f0 {\f0\fs20 }}\cell
      
      \row
      
      \trowd\trrh0\trhdr
      
      \pard\plain\uc0\ql\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85\clbrdrb\brdrs\brdrw20\brdrcf2 \cellx1040
      \intbl {\f0 {\f0\fs20 S.L.}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85\clbrdrb\brdrs\brdrw20\brdrcf2 \cellx2080
      \intbl {\f0 {\f0\fs20 num}}\cell
      
      \pard\plain\uc0\ql\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85\clbrdrb\brdrs\brdrw20\brdrcf2 \cellx3120
      \intbl {\f0 {\f0\fs20 char}}\cell
      
      \pard\plain\uc0\qc\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85\clbrdrb\brdrs\brdrw20\brdrcf2 \cellx4160
      \intbl {\f0 {\f0\fs20 fctr}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85\clbrdrb\brdrs\brdrw20\brdrcf2 \cellx5200
      \intbl {\f0 {\f0\fs20 date}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85\clbrdrb\brdrs\brdrw20\brdrcf2 \cellx6240
      \intbl {\f0 {\f0\fs20 time}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85\clbrdrb\brdrs\brdrw20\brdrcf2 \cellx7280
      \intbl {\f0 {\f0\fs20 datetime}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85\clbrdrb\brdrs\brdrw20\brdrcf2 \cellx8320
      \intbl {\f0 {\f0\fs20 currency}}\cell
      
      \pard\plain\uc0\ql\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85\clbrdrb\brdrs\brdrw20\brdrcf2 \cellx9360
      \intbl {\f0 {\f0\fs20 row}}\cell
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\ql\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx9360
      \intbl {\f0\fs20 grp_a}\cell
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\ql\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx1040
      \intbl {\f0 {\f0\fs20 }}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx2080
      \intbl {\f0 {\f0\fs20 1.111e-01}}\cell
      
      \pard\plain\uc0\ql\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx3120
      \intbl {\f0 {\f0\fs20 apricot}}\cell
      
      \pard\plain\uc0\qc\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx4160
      \intbl {\f0 {\f0\fs20 one}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx5200
      \intbl {\f0 {\f0\fs20 2015-01-15}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx6240
      \intbl {\f0 {\f0\fs20 13:35}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx7280
      \intbl {\f0 {\f0\fs20 2018-01-01 02:22}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx8320
      \intbl {\f0 {\f0\fs20 49.950}}\cell
      
      \pard\plain\uc0\ql\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx9360
      \intbl {\f0 {\f0\fs20 row_1}}\cell
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\ql\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx1040
      \intbl {\f0 {\f0\fs20 }}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx2080
      \intbl {\f0 {\f0\fs20 2.222e+00}}\cell
      
      \pard\plain\uc0\ql\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx3120
      \intbl {\f0 {\f0\fs20 banana}}\cell
      
      \pard\plain\uc0\qc\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx4160
      \intbl {\f0 {\f0\fs20 two}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx5200
      \intbl {\f0 {\f0\fs20 2015-02-15}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx6240
      \intbl {\f0 {\f0\fs20 14:40}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx7280
      \intbl {\f0 {\f0\fs20 2018-02-02 14:33}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx8320
      \intbl {\f0 {\f0\fs20 17.950}}\cell
      
      \pard\plain\uc0\ql\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx9360
      \intbl {\f0 {\f0\fs20 row_2}}\cell
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\ql\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx1040
      \intbl {\f0 {\f0\fs20 }}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx2080
      \intbl {\f0 {\f0\fs20 3.333e+01}}\cell
      
      \pard\plain\uc0\ql\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx3120
      \intbl {\f0 {\f0\fs20 coconut}}\cell
      
      \pard\plain\uc0\qc\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx4160
      \intbl {\f0 {\f0\fs20 three}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx5200
      \intbl {\f0 {\f0\fs20 2015-03-15}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx6240
      \intbl {\f0 {\f0\fs20 15:45}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx7280
      \intbl {\f0 {\f0\fs20 2018-03-03 03:44}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx8320
      \intbl {\f0 {\f0\fs20 1.390}}\cell
      
      \pard\plain\uc0\ql\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx9360
      \intbl {\f0 {\f0\fs20 row_3}}\cell
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\ql\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx1040
      \intbl {\f0 {\f0\fs20 }}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx2080
      \intbl {\f0 {\f0\fs20 4.444e+02}}\cell
      
      \pard\plain\uc0\ql\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx3120
      \intbl {\f0 {\f0\fs20 durian}}\cell
      
      \pard\plain\uc0\qc\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx4160
      \intbl {\f0 {\f0\fs20 four}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx5200
      \intbl {\f0 {\f0\fs20 2015-04-15}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx6240
      \intbl {\f0 {\f0\fs20 16:50}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx7280
      \intbl {\f0 {\f0\fs20 2018-04-04 15:55}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx8320
      \intbl {\f0 {\f0\fs20 65100.000}}\cell
      
      \pard\plain\uc0\ql\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx9360
      \intbl {\f0 {\f0\fs20 row_4}}\cell
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\ql\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx1040
      \intbl {\f0 {\f0\fs20 min}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx2080
      \intbl {\f0 {\f0\fs20 0.11}}\cell
      
      \pard\plain\uc0\ql\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx3120
      \intbl {\f0 {\f0\fs20 \'97}}\cell
      
      \pard\plain\uc0\qc\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx4160
      \intbl {\f0 {\f0\fs20 \'97}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx5200
      \intbl {\f0 {\f0\fs20 \'97}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx6240
      \intbl {\f0 {\f0\fs20 \'97}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx7280
      \intbl {\f0 {\f0\fs20 \'97}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx8320
      \intbl {\f0 {\f0\fs20 1.39}}\cell
      
      \pard\plain\uc0\ql\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx9360
      \intbl {\f0 {\f0\fs20 \'97}}\cell
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\ql\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx1040
      \intbl {\f0 {\f0\fs20 max}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx2080
      \intbl {\f0 {\f0\fs20 444.40}}\cell
      
      \pard\plain\uc0\ql\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx3120
      \intbl {\f0 {\f0\fs20 \'97}}\cell
      
      \pard\plain\uc0\qc\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx4160
      \intbl {\f0 {\f0\fs20 \'97}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx5200
      \intbl {\f0 {\f0\fs20 \'97}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx6240
      \intbl {\f0 {\f0\fs20 \'97}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx7280
      \intbl {\f0 {\f0\fs20 \'97}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx8320
      \intbl {\f0 {\f0\fs20 65100.00}}\cell
      
      \pard\plain\uc0\ql\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx9360
      \intbl {\f0 {\f0\fs20 \'97}}\cell
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\ql\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx1040
      \intbl {\f0 {\f0\fs20 avg}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx2080
      \intbl {\f0 {\f0\fs20 120.02}}\cell
      
      \pard\plain\uc0\ql\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx3120
      \intbl {\f0 {\f0\fs20 \'97}}\cell
      
      \pard\plain\uc0\qc\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx4160
      \intbl {\f0 {\f0\fs20 \'97}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx5200
      \intbl {\f0 {\f0\fs20 \'97}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx6240
      \intbl {\f0 {\f0\fs20 \'97}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx7280
      \intbl {\f0 {\f0\fs20 \'97}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx8320
      \intbl {\f0 {\f0\fs20 16292.32}}\cell
      
      \pard\plain\uc0\ql\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx9360
      \intbl {\f0 {\f0\fs20 \'97}}\cell
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\ql\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx9360
      \intbl {\f0\fs20 grp_b}\cell
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\ql\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx1040
      \intbl {\f0 {\f0\fs20 }}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx2080
      \intbl {\f0 {\f0\fs20 5.550e+03}}\cell
      
      \pard\plain\uc0\ql\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx3120
      \intbl {\f0 {\f0\fs20 NA}}\cell
      
      \pard\plain\uc0\qc\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx4160
      \intbl {\f0 {\f0\fs20 five}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx5200
      \intbl {\f0 {\f0\fs20 2015-05-15}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx6240
      \intbl {\f0 {\f0\fs20 17:55}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx7280
      \intbl {\f0 {\f0\fs20 2018-05-05 04:00}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx8320
      \intbl {\f0 {\f0\fs20 1325.810}}\cell
      
      \pard\plain\uc0\ql\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx9360
      \intbl {\f0 {\f0\fs20 row_5}}\cell
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\ql\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx1040
      \intbl {\f0 {\f0\fs20 }}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx2080
      \intbl {\f0 {\f0\fs20 NA}}\cell
      
      \pard\plain\uc0\ql\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx3120
      \intbl {\f0 {\f0\fs20 fig}}\cell
      
      \pard\plain\uc0\qc\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx4160
      \intbl {\f0 {\f0\fs20 six}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx5200
      \intbl {\f0 {\f0\fs20 2015-06-15}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx6240
      \intbl {\f0 {\f0\fs20 NA}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx7280
      \intbl {\f0 {\f0\fs20 2018-06-06 16:11}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx8320
      \intbl {\f0 {\f0\fs20 13.255}}\cell
      
      \pard\plain\uc0\ql\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx9360
      \intbl {\f0 {\f0\fs20 row_6}}\cell
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\ql\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx1040
      \intbl {\f0 {\f0\fs20 }}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx2080
      \intbl {\f0 {\f0\fs20 7.770e+05}}\cell
      
      \pard\plain\uc0\ql\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx3120
      \intbl {\f0 {\f0\fs20 grapefruit}}\cell
      
      \pard\plain\uc0\qc\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx4160
      \intbl {\f0 {\f0\fs20 seven}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx5200
      \intbl {\f0 {\f0\fs20 NA}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx6240
      \intbl {\f0 {\f0\fs20 19:10}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx7280
      \intbl {\f0 {\f0\fs20 2018-07-07 05:22}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx8320
      \intbl {\f0 {\f0\fs20 NA}}\cell
      
      \pard\plain\uc0\ql\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx9360
      \intbl {\f0 {\f0\fs20 row_7}}\cell
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\ql\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx1040
      \intbl {\f0 {\f0\fs20 }}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx2080
      \intbl {\f0 {\f0\fs20 8.880e+06}}\cell
      
      \pard\plain\uc0\ql\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx3120
      \intbl {\f0 {\f0\fs20 honeydew}}\cell
      
      \pard\plain\uc0\qc\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx4160
      \intbl {\f0 {\f0\fs20 eight}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx5200
      \intbl {\f0 {\f0\fs20 2015-08-15}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx6240
      \intbl {\f0 {\f0\fs20 20:20}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx7280
      \intbl {\f0 {\f0\fs20 NA}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx8320
      \intbl {\f0 {\f0\fs20 0.440}}\cell
      
      \pard\plain\uc0\ql\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx9360
      \intbl {\f0 {\f0\fs20 row_8}}\cell
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\ql\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx1040
      \intbl {\f0 {\f0\fs20 min}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx2080
      \intbl {\f0 {\f0\fs20 5550.00}}\cell
      
      \pard\plain\uc0\ql\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx3120
      \intbl {\f0 {\f0\fs20 \'97}}\cell
      
      \pard\plain\uc0\qc\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx4160
      \intbl {\f0 {\f0\fs20 \'97}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx5200
      \intbl {\f0 {\f0\fs20 \'97}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx6240
      \intbl {\f0 {\f0\fs20 \'97}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx7280
      \intbl {\f0 {\f0\fs20 \'97}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx8320
      \intbl {\f0 {\f0\fs20 0.44}}\cell
      
      \pard\plain\uc0\ql\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx9360
      \intbl {\f0 {\f0\fs20 \'97}}\cell
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\ql\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx1040
      \intbl {\f0 {\f0\fs20 max}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx2080
      \intbl {\f0 {\f0\fs20 8880000.00}}\cell
      
      \pard\plain\uc0\ql\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx3120
      \intbl {\f0 {\f0\fs20 \'97}}\cell
      
      \pard\plain\uc0\qc\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx4160
      \intbl {\f0 {\f0\fs20 \'97}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx5200
      \intbl {\f0 {\f0\fs20 \'97}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx6240
      \intbl {\f0 {\f0\fs20 \'97}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx7280
      \intbl {\f0 {\f0\fs20 \'97}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx8320
      \intbl {\f0 {\f0\fs20 1325.81}}\cell
      
      \pard\plain\uc0\ql\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx9360
      \intbl {\f0 {\f0\fs20 \'97}}\cell
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\ql\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx1040
      \intbl {\f0 {\f0\fs20 avg}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx2080
      \intbl {\f0 {\f0\fs20 3220850.00}}\cell
      
      \pard\plain\uc0\ql\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx3120
      \intbl {\f0 {\f0\fs20 \'97}}\cell
      
      \pard\plain\uc0\qc\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx4160
      \intbl {\f0 {\f0\fs20 \'97}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx5200
      \intbl {\f0 {\f0\fs20 \'97}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx6240
      \intbl {\f0 {\f0\fs20 \'97}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx7280
      \intbl {\f0 {\f0\fs20 \'97}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx8320
      \intbl {\f0 {\f0\fs20 446.50}}\cell
      
      \pard\plain\uc0\ql\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx9360
      \intbl {\f0 {\f0\fs20 \'97}}\cell
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\ql\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx1040
      \intbl {\f0 {\f0\fs20 min}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx2080
      \intbl {\f0 {\f0\fs20 0.11}}\cell
      
      \pard\plain\uc0\ql\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx3120
      \intbl {\f0 {\f0\fs20 \'97}}\cell
      
      \pard\plain\uc0\qc\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx4160
      \intbl {\f0 {\f0\fs20 \'97}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx5200
      \intbl {\f0 {\f0\fs20 \'97}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx6240
      \intbl {\f0 {\f0\fs20 \'97}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx7280
      \intbl {\f0 {\f0\fs20 \'97}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx8320
      \intbl {\f0 {\f0\fs20 0.44}}\cell
      
      \pard\plain\uc0\ql\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx9360
      \intbl {\f0 {\f0\fs20 \'97}}\cell
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\ql\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx1040
      \intbl {\f0 {\f0\fs20 max}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx2080
      \intbl {\f0 {\f0\fs20 8880000.00}}\cell
      
      \pard\plain\uc0\ql\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx3120
      \intbl {\f0 {\f0\fs20 \'97}}\cell
      
      \pard\plain\uc0\qc\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx4160
      \intbl {\f0 {\f0\fs20 \'97}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx5200
      \intbl {\f0 {\f0\fs20 \'97}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx6240
      \intbl {\f0 {\f0\fs20 \'97}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx7280
      \intbl {\f0 {\f0\fs20 \'97}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx8320
      \intbl {\f0 {\f0\fs20 65100.00}}\cell
      
      \pard\plain\uc0\ql\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx9360
      \intbl {\f0 {\f0\fs20 \'97}}\cell
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\ql\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx1040
      \intbl {\f0 {\f0\fs20 avg}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx2080
      \intbl {\f0 {\f0\fs20 1380432.87}}\cell
      
      \pard\plain\uc0\ql\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx3120
      \intbl {\f0 {\f0\fs20 \'97}}\cell
      
      \pard\plain\uc0\qc\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx4160
      \intbl {\f0 {\f0\fs20 \'97}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx5200
      \intbl {\f0 {\f0\fs20 \'97}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx6240
      \intbl {\f0 {\f0\fs20 \'97}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx7280
      \intbl {\f0 {\f0\fs20 \'97}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx8320
      \intbl {\f0 {\f0\fs20 9501.26}}\cell
      
      \pard\plain\uc0\ql\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx9360
      \intbl {\f0 {\f0\fs20 \'97}}\cell
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\ql\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx9360
      \intbl {\f0 {\f0\fs20 Source note #1\line Source note #2}}\cell
      
      \row
      
      }

---

    Code
      cat(render_as_html(gt_tbl))
    Output
      <table class="gt_table" data-quarto-disable-processing="false" data-quarto-bootstrap="false">
        <thead>
          <tr class="gt_heading">
            <td colspan="9" class="gt_heading gt_title gt_font_normal" style><span class='gt_from_md'>Data listing from <strong>exibble</strong></span></td>
          </tr>
          <tr class="gt_heading">
            <td colspan="9" class="gt_heading gt_subtitle gt_font_normal gt_bottom_border" style><span class='gt_from_md'><code>exibble</code> is an R dataset</span></td>
          </tr>
          <tr class="gt_col_headings gt_spanner_row">
            <th class="gt_col_heading gt_columns_bottom_border gt_left" rowspan="2" colspan="1" scope="col" id="a::stub">S.L.</th>
            <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="2" colspan="1" scope="col" id="num">num</th>
            <th class="gt_col_heading gt_columns_bottom_border gt_left" rowspan="2" colspan="1" scope="col" id="char">char</th>
            <th class="gt_col_heading gt_columns_bottom_border gt_center" rowspan="2" colspan="1" scope="col" id="fctr">fctr</th>
            <th class="gt_center gt_columns_top_border gt_column_spanner_outer" rowspan="1" colspan="3" scope="colgroup" id="timing">
              <div class="gt_column_spanner">timing</div>
            </th>
            <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="2" colspan="1" scope="col" id="currency">currency</th>
            <th class="gt_col_heading gt_columns_bottom_border gt_left" rowspan="2" colspan="1" scope="col" id="row">row</th>
          </tr>
          <tr class="gt_col_headings">
            <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id="date">date</th>
            <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id="time">time</th>
            <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id="datetime">datetime</th>
          </tr>
        </thead>
        <tbody class="gt_table_body">
          <tr class="gt_row_group_first"><td headers="grp_a stub_2_1 stub_1" rowspan="4" class="gt_row gt_left gt_stub_row_group">grp_a</td>
      <td headers="grp_a stub_2_1 num" class="gt_row gt_right">1.111e-01</td>
      <td headers="grp_a stub_2_1 char" class="gt_row gt_left">apricot</td>
      <td headers="grp_a stub_2_1 fctr" class="gt_row gt_center">one</td>
      <td headers="grp_a stub_2_1 date" class="gt_row gt_right">2015-01-15</td>
      <td headers="grp_a stub_2_1 time" class="gt_row gt_right">13:35</td>
      <td headers="grp_a stub_2_1 datetime" class="gt_row gt_right">2018-01-01 02:22</td>
      <td headers="grp_a stub_2_1 currency" class="gt_row gt_right">49.950</td>
      <td headers="grp_a stub_2_1 row" class="gt_row gt_left">row_1</td></tr>
          <tr><td headers="grp_a stub_2_2 num" class="gt_row gt_right">2.222e+00</td>
      <td headers="grp_a stub_2_2 char" class="gt_row gt_left">banana</td>
      <td headers="grp_a stub_2_2 fctr" class="gt_row gt_center">two</td>
      <td headers="grp_a stub_2_2 date" class="gt_row gt_right">2015-02-15</td>
      <td headers="grp_a stub_2_2 time" class="gt_row gt_right">14:40</td>
      <td headers="grp_a stub_2_2 datetime" class="gt_row gt_right">2018-02-02 14:33</td>
      <td headers="grp_a stub_2_2 currency" class="gt_row gt_right">17.950</td>
      <td headers="grp_a stub_2_2 row" class="gt_row gt_left">row_2</td></tr>
          <tr><td headers="grp_a stub_2_3 num" class="gt_row gt_right">3.333e+01</td>
      <td headers="grp_a stub_2_3 char" class="gt_row gt_left">coconut</td>
      <td headers="grp_a stub_2_3 fctr" class="gt_row gt_center">three</td>
      <td headers="grp_a stub_2_3 date" class="gt_row gt_right">2015-03-15</td>
      <td headers="grp_a stub_2_3 time" class="gt_row gt_right">15:45</td>
      <td headers="grp_a stub_2_3 datetime" class="gt_row gt_right">2018-03-03 03:44</td>
      <td headers="grp_a stub_2_3 currency" class="gt_row gt_right">1.390</td>
      <td headers="grp_a stub_2_3 row" class="gt_row gt_left">row_3</td></tr>
          <tr><td headers="grp_a stub_2_4 num" class="gt_row gt_right">4.444e+02</td>
      <td headers="grp_a stub_2_4 char" class="gt_row gt_left">durian</td>
      <td headers="grp_a stub_2_4 fctr" class="gt_row gt_center">four</td>
      <td headers="grp_a stub_2_4 date" class="gt_row gt_right">2015-04-15</td>
      <td headers="grp_a stub_2_4 time" class="gt_row gt_right">16:50</td>
      <td headers="grp_a stub_2_4 datetime" class="gt_row gt_right">2018-04-04 15:55</td>
      <td headers="grp_a stub_2_4 currency" class="gt_row gt_right">65100.000</td>
      <td headers="grp_a stub_2_4 row" class="gt_row gt_left">row_4</td></tr>
          <tr><th id="summary_stub_grp_a_1" scope="row" class="gt_row gt_left gt_stub gt_summary_row gt_first_summary_row">min</th>
      <td headers="grp_a summary_stub_grp_a_1 num" class="gt_row gt_right gt_summary_row gt_first_summary_row">0.11</td>
      <td headers="grp_a summary_stub_grp_a_1 char" class="gt_row gt_left gt_summary_row gt_first_summary_row">—</td>
      <td headers="grp_a summary_stub_grp_a_1 fctr" class="gt_row gt_center gt_summary_row gt_first_summary_row">—</td>
      <td headers="grp_a summary_stub_grp_a_1 date" class="gt_row gt_right gt_summary_row gt_first_summary_row">—</td>
      <td headers="grp_a summary_stub_grp_a_1 time" class="gt_row gt_right gt_summary_row gt_first_summary_row">—</td>
      <td headers="grp_a summary_stub_grp_a_1 datetime" class="gt_row gt_right gt_summary_row gt_first_summary_row">—</td>
      <td headers="grp_a summary_stub_grp_a_1 currency" class="gt_row gt_right gt_summary_row gt_first_summary_row">1.39</td>
      <td headers="grp_a summary_stub_grp_a_1 row" class="gt_row gt_left gt_summary_row gt_first_summary_row">—</td></tr>
          <tr><th id="summary_stub_grp_a_2" scope="row" class="gt_row gt_left gt_stub gt_summary_row">max</th>
      <td headers="grp_a summary_stub_grp_a_2 num" class="gt_row gt_right gt_summary_row">444.40</td>
      <td headers="grp_a summary_stub_grp_a_2 char" class="gt_row gt_left gt_summary_row">—</td>
      <td headers="grp_a summary_stub_grp_a_2 fctr" class="gt_row gt_center gt_summary_row">—</td>
      <td headers="grp_a summary_stub_grp_a_2 date" class="gt_row gt_right gt_summary_row">—</td>
      <td headers="grp_a summary_stub_grp_a_2 time" class="gt_row gt_right gt_summary_row">—</td>
      <td headers="grp_a summary_stub_grp_a_2 datetime" class="gt_row gt_right gt_summary_row">—</td>
      <td headers="grp_a summary_stub_grp_a_2 currency" class="gt_row gt_right gt_summary_row">65100.00</td>
      <td headers="grp_a summary_stub_grp_a_2 row" class="gt_row gt_left gt_summary_row">—</td></tr>
          <tr><th id="summary_stub_grp_a_3" scope="row" class="gt_row gt_left gt_stub gt_summary_row gt_last_summary_row">avg</th>
      <td headers="grp_a summary_stub_grp_a_3 num" class="gt_row gt_right gt_summary_row gt_last_summary_row">120.02</td>
      <td headers="grp_a summary_stub_grp_a_3 char" class="gt_row gt_left gt_summary_row gt_last_summary_row">—</td>
      <td headers="grp_a summary_stub_grp_a_3 fctr" class="gt_row gt_center gt_summary_row gt_last_summary_row">—</td>
      <td headers="grp_a summary_stub_grp_a_3 date" class="gt_row gt_right gt_summary_row gt_last_summary_row">—</td>
      <td headers="grp_a summary_stub_grp_a_3 time" class="gt_row gt_right gt_summary_row gt_last_summary_row">—</td>
      <td headers="grp_a summary_stub_grp_a_3 datetime" class="gt_row gt_right gt_summary_row gt_last_summary_row">—</td>
      <td headers="grp_a summary_stub_grp_a_3 currency" class="gt_row gt_right gt_summary_row gt_last_summary_row">16292.32</td>
      <td headers="grp_a summary_stub_grp_a_3 row" class="gt_row gt_left gt_summary_row gt_last_summary_row">—</td></tr>
          <tr class="gt_row_group_first"><td headers="grp_b stub_2_5 stub_1" rowspan="4" class="gt_row gt_left gt_stub_row_group">grp_b</td>
      <td headers="grp_b stub_2_5 num" class="gt_row gt_right">5.550e+03</td>
      <td headers="grp_b stub_2_5 char" class="gt_row gt_left">NA</td>
      <td headers="grp_b stub_2_5 fctr" class="gt_row gt_center">five</td>
      <td headers="grp_b stub_2_5 date" class="gt_row gt_right">2015-05-15</td>
      <td headers="grp_b stub_2_5 time" class="gt_row gt_right">17:55</td>
      <td headers="grp_b stub_2_5 datetime" class="gt_row gt_right">2018-05-05 04:00</td>
      <td headers="grp_b stub_2_5 currency" class="gt_row gt_right">1325.810</td>
      <td headers="grp_b stub_2_5 row" class="gt_row gt_left">row_5</td></tr>
          <tr><td headers="grp_b stub_2_6 num" class="gt_row gt_right">NA</td>
      <td headers="grp_b stub_2_6 char" class="gt_row gt_left">fig</td>
      <td headers="grp_b stub_2_6 fctr" class="gt_row gt_center">six</td>
      <td headers="grp_b stub_2_6 date" class="gt_row gt_right">2015-06-15</td>
      <td headers="grp_b stub_2_6 time" class="gt_row gt_right">NA</td>
      <td headers="grp_b stub_2_6 datetime" class="gt_row gt_right">2018-06-06 16:11</td>
      <td headers="grp_b stub_2_6 currency" class="gt_row gt_right">13.255</td>
      <td headers="grp_b stub_2_6 row" class="gt_row gt_left">row_6</td></tr>
          <tr><td headers="grp_b stub_2_7 num" class="gt_row gt_right">7.770e+05</td>
      <td headers="grp_b stub_2_7 char" class="gt_row gt_left">grapefruit</td>
      <td headers="grp_b stub_2_7 fctr" class="gt_row gt_center">seven</td>
      <td headers="grp_b stub_2_7 date" class="gt_row gt_right">NA</td>
      <td headers="grp_b stub_2_7 time" class="gt_row gt_right">19:10</td>
      <td headers="grp_b stub_2_7 datetime" class="gt_row gt_right">2018-07-07 05:22</td>
      <td headers="grp_b stub_2_7 currency" class="gt_row gt_right">NA</td>
      <td headers="grp_b stub_2_7 row" class="gt_row gt_left">row_7</td></tr>
          <tr><td headers="grp_b stub_2_8 num" class="gt_row gt_right">8.880e+06</td>
      <td headers="grp_b stub_2_8 char" class="gt_row gt_left">honeydew</td>
      <td headers="grp_b stub_2_8 fctr" class="gt_row gt_center">eight</td>
      <td headers="grp_b stub_2_8 date" class="gt_row gt_right">2015-08-15</td>
      <td headers="grp_b stub_2_8 time" class="gt_row gt_right">20:20</td>
      <td headers="grp_b stub_2_8 datetime" class="gt_row gt_right">NA</td>
      <td headers="grp_b stub_2_8 currency" class="gt_row gt_right">0.440</td>
      <td headers="grp_b stub_2_8 row" class="gt_row gt_left">row_8</td></tr>
          <tr><th id="summary_stub_grp_b_1" scope="row" class="gt_row gt_left gt_stub gt_summary_row gt_first_summary_row">min</th>
      <td headers="grp_b summary_stub_grp_b_1 num" class="gt_row gt_right gt_summary_row gt_first_summary_row">5550.00</td>
      <td headers="grp_b summary_stub_grp_b_1 char" class="gt_row gt_left gt_summary_row gt_first_summary_row">—</td>
      <td headers="grp_b summary_stub_grp_b_1 fctr" class="gt_row gt_center gt_summary_row gt_first_summary_row">—</td>
      <td headers="grp_b summary_stub_grp_b_1 date" class="gt_row gt_right gt_summary_row gt_first_summary_row">—</td>
      <td headers="grp_b summary_stub_grp_b_1 time" class="gt_row gt_right gt_summary_row gt_first_summary_row">—</td>
      <td headers="grp_b summary_stub_grp_b_1 datetime" class="gt_row gt_right gt_summary_row gt_first_summary_row">—</td>
      <td headers="grp_b summary_stub_grp_b_1 currency" class="gt_row gt_right gt_summary_row gt_first_summary_row">0.44</td>
      <td headers="grp_b summary_stub_grp_b_1 row" class="gt_row gt_left gt_summary_row gt_first_summary_row">—</td></tr>
          <tr><th id="summary_stub_grp_b_2" scope="row" class="gt_row gt_left gt_stub gt_summary_row">max</th>
      <td headers="grp_b summary_stub_grp_b_2 num" class="gt_row gt_right gt_summary_row">8880000.00</td>
      <td headers="grp_b summary_stub_grp_b_2 char" class="gt_row gt_left gt_summary_row">—</td>
      <td headers="grp_b summary_stub_grp_b_2 fctr" class="gt_row gt_center gt_summary_row">—</td>
      <td headers="grp_b summary_stub_grp_b_2 date" class="gt_row gt_right gt_summary_row">—</td>
      <td headers="grp_b summary_stub_grp_b_2 time" class="gt_row gt_right gt_summary_row">—</td>
      <td headers="grp_b summary_stub_grp_b_2 datetime" class="gt_row gt_right gt_summary_row">—</td>
      <td headers="grp_b summary_stub_grp_b_2 currency" class="gt_row gt_right gt_summary_row">1325.81</td>
      <td headers="grp_b summary_stub_grp_b_2 row" class="gt_row gt_left gt_summary_row">—</td></tr>
          <tr><th id="summary_stub_grp_b_3" scope="row" class="gt_row gt_left gt_stub gt_summary_row gt_last_summary_row">avg</th>
      <td headers="grp_b summary_stub_grp_b_3 num" class="gt_row gt_right gt_summary_row gt_last_summary_row">3220850.00</td>
      <td headers="grp_b summary_stub_grp_b_3 char" class="gt_row gt_left gt_summary_row gt_last_summary_row">—</td>
      <td headers="grp_b summary_stub_grp_b_3 fctr" class="gt_row gt_center gt_summary_row gt_last_summary_row">—</td>
      <td headers="grp_b summary_stub_grp_b_3 date" class="gt_row gt_right gt_summary_row gt_last_summary_row">—</td>
      <td headers="grp_b summary_stub_grp_b_3 time" class="gt_row gt_right gt_summary_row gt_last_summary_row">—</td>
      <td headers="grp_b summary_stub_grp_b_3 datetime" class="gt_row gt_right gt_summary_row gt_last_summary_row">—</td>
      <td headers="grp_b summary_stub_grp_b_3 currency" class="gt_row gt_right gt_summary_row gt_last_summary_row">446.50</td>
      <td headers="grp_b summary_stub_grp_b_3 row" class="gt_row gt_left gt_summary_row gt_last_summary_row">—</td></tr>
          <tr><th id="grand_summary_stub_1" scope="row" class="gt_row gt_left gt_stub gt_grand_summary_row gt_first_grand_summary_row">min</th>
      <td headers="grand_summary_stub_1 num" class="gt_row gt_right gt_grand_summary_row gt_first_grand_summary_row">0.11</td>
      <td headers="grand_summary_stub_1 char" class="gt_row gt_left gt_grand_summary_row gt_first_grand_summary_row">—</td>
      <td headers="grand_summary_stub_1 fctr" class="gt_row gt_center gt_grand_summary_row gt_first_grand_summary_row">—</td>
      <td headers="grand_summary_stub_1 date" class="gt_row gt_right gt_grand_summary_row gt_first_grand_summary_row">—</td>
      <td headers="grand_summary_stub_1 time" class="gt_row gt_right gt_grand_summary_row gt_first_grand_summary_row">—</td>
      <td headers="grand_summary_stub_1 datetime" class="gt_row gt_right gt_grand_summary_row gt_first_grand_summary_row">—</td>
      <td headers="grand_summary_stub_1 currency" class="gt_row gt_right gt_grand_summary_row gt_first_grand_summary_row">0.44</td>
      <td headers="grand_summary_stub_1 row" class="gt_row gt_left gt_grand_summary_row gt_first_grand_summary_row">—</td></tr>
          <tr><th id="grand_summary_stub_2" scope="row" class="gt_row gt_left gt_stub gt_grand_summary_row">max</th>
      <td headers="grand_summary_stub_2 num" class="gt_row gt_right gt_grand_summary_row">8880000.00</td>
      <td headers="grand_summary_stub_2 char" class="gt_row gt_left gt_grand_summary_row">—</td>
      <td headers="grand_summary_stub_2 fctr" class="gt_row gt_center gt_grand_summary_row">—</td>
      <td headers="grand_summary_stub_2 date" class="gt_row gt_right gt_grand_summary_row">—</td>
      <td headers="grand_summary_stub_2 time" class="gt_row gt_right gt_grand_summary_row">—</td>
      <td headers="grand_summary_stub_2 datetime" class="gt_row gt_right gt_grand_summary_row">—</td>
      <td headers="grand_summary_stub_2 currency" class="gt_row gt_right gt_grand_summary_row">65100.00</td>
      <td headers="grand_summary_stub_2 row" class="gt_row gt_left gt_grand_summary_row">—</td></tr>
          <tr><th id="grand_summary_stub_3" scope="row" class="gt_row gt_left gt_stub gt_grand_summary_row gt_last_summary_row">avg</th>
      <td headers="grand_summary_stub_3 num" class="gt_row gt_right gt_grand_summary_row gt_last_summary_row">1380432.87</td>
      <td headers="grand_summary_stub_3 char" class="gt_row gt_left gt_grand_summary_row gt_last_summary_row">—</td>
      <td headers="grand_summary_stub_3 fctr" class="gt_row gt_center gt_grand_summary_row gt_last_summary_row">—</td>
      <td headers="grand_summary_stub_3 date" class="gt_row gt_right gt_grand_summary_row gt_last_summary_row">—</td>
      <td headers="grand_summary_stub_3 time" class="gt_row gt_right gt_grand_summary_row gt_last_summary_row">—</td>
      <td headers="grand_summary_stub_3 datetime" class="gt_row gt_right gt_grand_summary_row gt_last_summary_row">—</td>
      <td headers="grand_summary_stub_3 currency" class="gt_row gt_right gt_grand_summary_row gt_last_summary_row">9501.26</td>
      <td headers="grand_summary_stub_3 row" class="gt_row gt_left gt_grand_summary_row gt_last_summary_row">—</td></tr>
        </tbody>
        <tfoot>
          <tr class="gt_sourcenotes">
            <td class="gt_sourcenote" colspan="9">Source note #1</td>
          </tr>
          <tr class="gt_sourcenotes">
            <td class="gt_sourcenote" colspan="9">Source note #2</td>
          </tr>
        </tfoot>
      </table>

---

    Code
      as.character(as_latex(gt_tbl))
    Output
      [1] "\\begingroup\n\\fontsize{12.0pt}{14.0pt}\\selectfont\n\\setlength{\\LTpost}{0mm}\n\\begin{longtable}{l|rlcrrrrl}\n\\caption*{\n{\\fontsize{20}{25}\\selectfont  Data listing from \\textbf{exibble}\\fontsize{12}{15}\\selectfont } \\\\ \n{\\fontsize{14}{17}\\selectfont  \\texttt{exibble} is an R dataset\\fontsize{12}{15}\\selectfont }\n} \\\\ \n\\toprule\n &  &  &  & \\multicolumn{3}{c}{timing} &  &  \\\\ \n\\cmidrule(lr){5-7}\nS.L. & num & char & fctr & date & time & datetime & currency & row \\\\ \n\\midrule\\addlinespace[2.5pt]\n\\multirow[t]{7}{*}{grp\\_a} & 1.111e-01 & apricot & one & 2015-01-15 & 13:35 & 2018-01-01 02:22 & 49.950 & row\\_1 \\\\ \n & 2.222e+00 & banana & two & 2015-02-15 & 14:40 & 2018-02-02 14:33 & 17.950 & row\\_2 \\\\ \n & 3.333e+01 & coconut & three & 2015-03-15 & 15:45 & 2018-03-03 03:44 & 1.390 & row\\_3 \\\\ \n & 4.444e+02 & durian & four & 2015-04-15 & 16:50 & 2018-04-04 15:55 & 65100.000 & row\\_4 \\\\ \n\\midrule \nmin & 0.11 & — & — & — & — & — & 1.39 & — \\\\ \nmax & 444.40 & — & — & — & — & — & 65100.00 & — \\\\ \navg & 120.02 & — & — & — & — & — & 16292.32 & — \\\\ \n\\midrule\\addlinespace[2.5pt]\n\\multirow[t]{7}{*}{grp\\_b} & 5.550e+03 & NA & five & 2015-05-15 & 17:55 & 2018-05-05 04:00 & 1325.810 & row\\_5 \\\\ \n & NA & fig & six & 2015-06-15 & NA & 2018-06-06 16:11 & 13.255 & row\\_6 \\\\ \n & 7.770e+05 & grapefruit & seven & NA & 19:10 & 2018-07-07 05:22 & NA & row\\_7 \\\\ \n & 8.880e+06 & honeydew & eight & 2015-08-15 & 20:20 & NA & 0.440 & row\\_8 \\\\ \n\\midrule \nmin & 5550.00 & — & — & — & — & — & 0.44 & — \\\\ \nmax & 8880000.00 & — & — & — & — & — & 1325.81 & — \\\\ \navg & 3220850.00 & — & — & — & — & — & 446.50 & — \\\\ \n\\midrule \n\\midrule \nmin & 0.11 & — & — & — & — & — & 0.44 & — \\\\ \nmax & 8880000.00 & — & — & — & — & — & 65100.00 & — \\\\ \navg & 1380432.87 & — & — & — & — & — & 9501.26 & — \\\\ \n\\bottomrule\n\\end{longtable}\n\\begin{minipage}{\\linewidth}\n\\vspace{.05em}\nSource note \\#1\\\\\nSource note \\#2\\\\\n\\end{minipage}\n\\endgroup\n"

---

    Code
      as_rtf(gt_tbl)
    Output
      {\rtf\ansi\ansicpg1252{\fonttbl{\f0\froman\fcharset0\fprq0 Courier New;}{\f1\froman\fcharset0\fprq0 Times;}}{\colortbl;\red51\green51\blue51;\red211\green211\blue211;}
      
      \paperw12240\paperh15840\widowctrl\ftnbj\fet0\sectd\linex0
      \lndscpsxn
      \margl1440\margr1440\margt1440\margb1440
      \headery720\footery720\fs20
      
      \trowd\trrh0\trhdr
      
      \pard\plain\uc0\qc\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx9360
      \intbl {\f0\cf1 {\f0\fs20 Data listing from {\b exibble}} {\f0\fs20\i\super } \line {\f0\fs20 {\f1 exibble} is an R dataset} {\f0\fs20\i\super }}\cell
      
      \row
      
      \trowd\trrh0\trhdr
      
      \pard\plain\uc0\qc\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx1040
      \intbl {\f0 {\f0\fs20 }}\cell
      
      \pard\plain\uc0\qc\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx2080
      \intbl {\f0 {\f0\fs20 }}\cell
      
      \pard\plain\uc0\qc\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx3120
      \intbl {\f0 {\f0\fs20 }}\cell
      
      \pard\plain\uc0\qc\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx4160
      \intbl {\f0 {\f0\fs20 }}\cell
      
      \pard\plain\uc0\qc\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85\clbrdrb\brdrs\brdrw20\brdrcf2\clmgf \cellx5200
      \intbl {\f0 {\f0\fs20 timing}}\cell
      
      \pard\plain\uc0\qc\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85\clmrg \cellx6240
      \intbl {\f0 {\f0\fs20 }}\cell
      
      \pard\plain\uc0\qc\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85\clmrg \cellx7280
      \intbl {\f0 {\f0\fs20 }}\cell
      
      \pard\plain\uc0\qc\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx8320
      \intbl {\f0 {\f0\fs20 }}\cell
      
      \pard\plain\uc0\qc\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx9360
      \intbl {\f0 {\f0\fs20 }}\cell
      
      \row
      
      \trowd\trrh0\trhdr
      
      \pard\plain\uc0\ql\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85\clbrdrb\brdrs\brdrw20\brdrcf2 \cellx1040
      \intbl {\f0 {\f0\fs20 S.L.}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85\clbrdrb\brdrs\brdrw20\brdrcf2 \cellx2080
      \intbl {\f0 {\f0\fs20 num}}\cell
      
      \pard\plain\uc0\ql\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85\clbrdrb\brdrs\brdrw20\brdrcf2 \cellx3120
      \intbl {\f0 {\f0\fs20 char}}\cell
      
      \pard\plain\uc0\qc\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85\clbrdrb\brdrs\brdrw20\brdrcf2 \cellx4160
      \intbl {\f0 {\f0\fs20 fctr}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85\clbrdrb\brdrs\brdrw20\brdrcf2 \cellx5200
      \intbl {\f0 {\f0\fs20 date}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85\clbrdrb\brdrs\brdrw20\brdrcf2 \cellx6240
      \intbl {\f0 {\f0\fs20 time}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85\clbrdrb\brdrs\brdrw20\brdrcf2 \cellx7280
      \intbl {\f0 {\f0\fs20 datetime}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85\clbrdrb\brdrs\brdrw20\brdrcf2 \cellx8320
      \intbl {\f0 {\f0\fs20 currency}}\cell
      
      \pard\plain\uc0\ql\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85\clbrdrb\brdrs\brdrw20\brdrcf2 \cellx9360
      \intbl {\f0 {\f0\fs20 row}}\cell
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\ql\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx1040
      \intbl {\f0 {\f0\fs20 grp_a}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx2080
      \intbl {\f0 {\f0\fs20 1.111e-01}}\cell
      
      \pard\plain\uc0\ql\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx3120
      \intbl {\f0 {\f0\fs20 apricot}}\cell
      
      \pard\plain\uc0\qc\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx4160
      \intbl {\f0 {\f0\fs20 one}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx5200
      \intbl {\f0 {\f0\fs20 2015-01-15}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx6240
      \intbl {\f0 {\f0\fs20 13:35}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx7280
      \intbl {\f0 {\f0\fs20 2018-01-01 02:22}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx8320
      \intbl {\f0 {\f0\fs20 49.950}}\cell
      
      \pard\plain\uc0\ql\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx9360
      \intbl {\f0 {\f0\fs20 row_1}}\cell
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\ql\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx1040
      \intbl {\f0 {\f0\fs20 }}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx2080
      \intbl {\f0 {\f0\fs20 2.222e+00}}\cell
      
      \pard\plain\uc0\ql\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx3120
      \intbl {\f0 {\f0\fs20 banana}}\cell
      
      \pard\plain\uc0\qc\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx4160
      \intbl {\f0 {\f0\fs20 two}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx5200
      \intbl {\f0 {\f0\fs20 2015-02-15}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx6240
      \intbl {\f0 {\f0\fs20 14:40}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx7280
      \intbl {\f0 {\f0\fs20 2018-02-02 14:33}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx8320
      \intbl {\f0 {\f0\fs20 17.950}}\cell
      
      \pard\plain\uc0\ql\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx9360
      \intbl {\f0 {\f0\fs20 row_2}}\cell
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\ql\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx1040
      \intbl {\f0 {\f0\fs20 }}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx2080
      \intbl {\f0 {\f0\fs20 3.333e+01}}\cell
      
      \pard\plain\uc0\ql\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx3120
      \intbl {\f0 {\f0\fs20 coconut}}\cell
      
      \pard\plain\uc0\qc\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx4160
      \intbl {\f0 {\f0\fs20 three}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx5200
      \intbl {\f0 {\f0\fs20 2015-03-15}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx6240
      \intbl {\f0 {\f0\fs20 15:45}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx7280
      \intbl {\f0 {\f0\fs20 2018-03-03 03:44}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx8320
      \intbl {\f0 {\f0\fs20 1.390}}\cell
      
      \pard\plain\uc0\ql\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx9360
      \intbl {\f0 {\f0\fs20 row_3}}\cell
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\ql\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx1040
      \intbl {\f0 {\f0\fs20 }}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx2080
      \intbl {\f0 {\f0\fs20 4.444e+02}}\cell
      
      \pard\plain\uc0\ql\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx3120
      \intbl {\f0 {\f0\fs20 durian}}\cell
      
      \pard\plain\uc0\qc\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx4160
      \intbl {\f0 {\f0\fs20 four}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx5200
      \intbl {\f0 {\f0\fs20 2015-04-15}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx6240
      \intbl {\f0 {\f0\fs20 16:50}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx7280
      \intbl {\f0 {\f0\fs20 2018-04-04 15:55}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx8320
      \intbl {\f0 {\f0\fs20 65100.000}}\cell
      
      \pard\plain\uc0\ql\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx9360
      \intbl {\f0 {\f0\fs20 row_4}}\cell
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\ql\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx1040
      \intbl {\f0 {\f0\fs20 min}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx2080
      \intbl {\f0 {\f0\fs20 0.11}}\cell
      
      \pard\plain\uc0\ql\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx3120
      \intbl {\f0 {\f0\fs20 \'97}}\cell
      
      \pard\plain\uc0\qc\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx4160
      \intbl {\f0 {\f0\fs20 \'97}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx5200
      \intbl {\f0 {\f0\fs20 \'97}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx6240
      \intbl {\f0 {\f0\fs20 \'97}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx7280
      \intbl {\f0 {\f0\fs20 \'97}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx8320
      \intbl {\f0 {\f0\fs20 1.39}}\cell
      
      \pard\plain\uc0\ql\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx9360
      \intbl {\f0 {\f0\fs20 \'97}}\cell
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\ql\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx1040
      \intbl {\f0 {\f0\fs20 max}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx2080
      \intbl {\f0 {\f0\fs20 444.40}}\cell
      
      \pard\plain\uc0\ql\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx3120
      \intbl {\f0 {\f0\fs20 \'97}}\cell
      
      \pard\plain\uc0\qc\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx4160
      \intbl {\f0 {\f0\fs20 \'97}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx5200
      \intbl {\f0 {\f0\fs20 \'97}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx6240
      \intbl {\f0 {\f0\fs20 \'97}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx7280
      \intbl {\f0 {\f0\fs20 \'97}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx8320
      \intbl {\f0 {\f0\fs20 65100.00}}\cell
      
      \pard\plain\uc0\ql\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx9360
      \intbl {\f0 {\f0\fs20 \'97}}\cell
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\ql\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx1040
      \intbl {\f0 {\f0\fs20 avg}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx2080
      \intbl {\f0 {\f0\fs20 120.02}}\cell
      
      \pard\plain\uc0\ql\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx3120
      \intbl {\f0 {\f0\fs20 \'97}}\cell
      
      \pard\plain\uc0\qc\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx4160
      \intbl {\f0 {\f0\fs20 \'97}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx5200
      \intbl {\f0 {\f0\fs20 \'97}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx6240
      \intbl {\f0 {\f0\fs20 \'97}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx7280
      \intbl {\f0 {\f0\fs20 \'97}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx8320
      \intbl {\f0 {\f0\fs20 16292.32}}\cell
      
      \pard\plain\uc0\ql\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx9360
      \intbl {\f0 {\f0\fs20 \'97}}\cell
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\ql\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx1040
      \intbl {\f0 {\f0\fs20 grp_b}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx2080
      \intbl {\f0 {\f0\fs20 5.550e+03}}\cell
      
      \pard\plain\uc0\ql\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx3120
      \intbl {\f0 {\f0\fs20 NA}}\cell
      
      \pard\plain\uc0\qc\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx4160
      \intbl {\f0 {\f0\fs20 five}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx5200
      \intbl {\f0 {\f0\fs20 2015-05-15}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx6240
      \intbl {\f0 {\f0\fs20 17:55}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx7280
      \intbl {\f0 {\f0\fs20 2018-05-05 04:00}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx8320
      \intbl {\f0 {\f0\fs20 1325.810}}\cell
      
      \pard\plain\uc0\ql\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx9360
      \intbl {\f0 {\f0\fs20 row_5}}\cell
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\ql\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx1040
      \intbl {\f0 {\f0\fs20 }}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx2080
      \intbl {\f0 {\f0\fs20 NA}}\cell
      
      \pard\plain\uc0\ql\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx3120
      \intbl {\f0 {\f0\fs20 fig}}\cell
      
      \pard\plain\uc0\qc\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx4160
      \intbl {\f0 {\f0\fs20 six}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx5200
      \intbl {\f0 {\f0\fs20 2015-06-15}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx6240
      \intbl {\f0 {\f0\fs20 NA}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx7280
      \intbl {\f0 {\f0\fs20 2018-06-06 16:11}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx8320
      \intbl {\f0 {\f0\fs20 13.255}}\cell
      
      \pard\plain\uc0\ql\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx9360
      \intbl {\f0 {\f0\fs20 row_6}}\cell
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\ql\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx1040
      \intbl {\f0 {\f0\fs20 }}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx2080
      \intbl {\f0 {\f0\fs20 7.770e+05}}\cell
      
      \pard\plain\uc0\ql\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx3120
      \intbl {\f0 {\f0\fs20 grapefruit}}\cell
      
      \pard\plain\uc0\qc\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx4160
      \intbl {\f0 {\f0\fs20 seven}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx5200
      \intbl {\f0 {\f0\fs20 NA}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx6240
      \intbl {\f0 {\f0\fs20 19:10}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx7280
      \intbl {\f0 {\f0\fs20 2018-07-07 05:22}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx8320
      \intbl {\f0 {\f0\fs20 NA}}\cell
      
      \pard\plain\uc0\ql\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx9360
      \intbl {\f0 {\f0\fs20 row_7}}\cell
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\ql\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx1040
      \intbl {\f0 {\f0\fs20 }}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx2080
      \intbl {\f0 {\f0\fs20 8.880e+06}}\cell
      
      \pard\plain\uc0\ql\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx3120
      \intbl {\f0 {\f0\fs20 honeydew}}\cell
      
      \pard\plain\uc0\qc\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx4160
      \intbl {\f0 {\f0\fs20 eight}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx5200
      \intbl {\f0 {\f0\fs20 2015-08-15}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx6240
      \intbl {\f0 {\f0\fs20 20:20}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx7280
      \intbl {\f0 {\f0\fs20 NA}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx8320
      \intbl {\f0 {\f0\fs20 0.440}}\cell
      
      \pard\plain\uc0\ql\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx9360
      \intbl {\f0 {\f0\fs20 row_8}}\cell
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\ql\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx1040
      \intbl {\f0 {\f0\fs20 min}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx2080
      \intbl {\f0 {\f0\fs20 5550.00}}\cell
      
      \pard\plain\uc0\ql\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx3120
      \intbl {\f0 {\f0\fs20 \'97}}\cell
      
      \pard\plain\uc0\qc\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx4160
      \intbl {\f0 {\f0\fs20 \'97}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx5200
      \intbl {\f0 {\f0\fs20 \'97}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx6240
      \intbl {\f0 {\f0\fs20 \'97}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx7280
      \intbl {\f0 {\f0\fs20 \'97}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx8320
      \intbl {\f0 {\f0\fs20 0.44}}\cell
      
      \pard\plain\uc0\ql\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx9360
      \intbl {\f0 {\f0\fs20 \'97}}\cell
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\ql\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx1040
      \intbl {\f0 {\f0\fs20 max}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx2080
      \intbl {\f0 {\f0\fs20 8880000.00}}\cell
      
      \pard\plain\uc0\ql\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx3120
      \intbl {\f0 {\f0\fs20 \'97}}\cell
      
      \pard\plain\uc0\qc\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx4160
      \intbl {\f0 {\f0\fs20 \'97}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx5200
      \intbl {\f0 {\f0\fs20 \'97}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx6240
      \intbl {\f0 {\f0\fs20 \'97}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx7280
      \intbl {\f0 {\f0\fs20 \'97}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx8320
      \intbl {\f0 {\f0\fs20 1325.81}}\cell
      
      \pard\plain\uc0\ql\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx9360
      \intbl {\f0 {\f0\fs20 \'97}}\cell
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\ql\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx1040
      \intbl {\f0 {\f0\fs20 avg}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx2080
      \intbl {\f0 {\f0\fs20 3220850.00}}\cell
      
      \pard\plain\uc0\ql\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx3120
      \intbl {\f0 {\f0\fs20 \'97}}\cell
      
      \pard\plain\uc0\qc\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx4160
      \intbl {\f0 {\f0\fs20 \'97}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx5200
      \intbl {\f0 {\f0\fs20 \'97}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx6240
      \intbl {\f0 {\f0\fs20 \'97}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx7280
      \intbl {\f0 {\f0\fs20 \'97}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx8320
      \intbl {\f0 {\f0\fs20 446.50}}\cell
      
      \pard\plain\uc0\ql\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx9360
      \intbl {\f0 {\f0\fs20 \'97}}\cell
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\ql\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx1040
      \intbl {\f0 {\f0\fs20 min}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx2080
      \intbl {\f0 {\f0\fs20 0.11}}\cell
      
      \pard\plain\uc0\ql\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx3120
      \intbl {\f0 {\f0\fs20 \'97}}\cell
      
      \pard\plain\uc0\qc\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx4160
      \intbl {\f0 {\f0\fs20 \'97}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx5200
      \intbl {\f0 {\f0\fs20 \'97}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx6240
      \intbl {\f0 {\f0\fs20 \'97}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx7280
      \intbl {\f0 {\f0\fs20 \'97}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx8320
      \intbl {\f0 {\f0\fs20 0.44}}\cell
      
      \pard\plain\uc0\ql\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx9360
      \intbl {\f0 {\f0\fs20 \'97}}\cell
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\ql\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx1040
      \intbl {\f0 {\f0\fs20 max}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx2080
      \intbl {\f0 {\f0\fs20 8880000.00}}\cell
      
      \pard\plain\uc0\ql\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx3120
      \intbl {\f0 {\f0\fs20 \'97}}\cell
      
      \pard\plain\uc0\qc\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx4160
      \intbl {\f0 {\f0\fs20 \'97}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx5200
      \intbl {\f0 {\f0\fs20 \'97}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx6240
      \intbl {\f0 {\f0\fs20 \'97}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx7280
      \intbl {\f0 {\f0\fs20 \'97}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx8320
      \intbl {\f0 {\f0\fs20 65100.00}}\cell
      
      \pard\plain\uc0\ql\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx9360
      \intbl {\f0 {\f0\fs20 \'97}}\cell
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\ql\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx1040
      \intbl {\f0 {\f0\fs20 avg}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx2080
      \intbl {\f0 {\f0\fs20 1380432.87}}\cell
      
      \pard\plain\uc0\ql\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx3120
      \intbl {\f0 {\f0\fs20 \'97}}\cell
      
      \pard\plain\uc0\qc\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx4160
      \intbl {\f0 {\f0\fs20 \'97}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx5200
      \intbl {\f0 {\f0\fs20 \'97}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx6240
      \intbl {\f0 {\f0\fs20 \'97}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx7280
      \intbl {\f0 {\f0\fs20 \'97}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx8320
      \intbl {\f0 {\f0\fs20 9501.26}}\cell
      
      \pard\plain\uc0\ql\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx9360
      \intbl {\f0 {\f0\fs20 \'97}}\cell
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\ql\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx9360
      \intbl {\f0 {\f0\fs20 Source note #1\line Source note #2}}\cell
      
      \row
      
      }

---

    Code
      cat(render_as_html(gt_tbl))
    Output
      <table class="gt_table" data-quarto-disable-processing="false" data-quarto-bootstrap="false">
        <thead>
          <tr class="gt_heading">
            <td colspan="9" class="gt_heading gt_title gt_font_normal" style><span class='gt_from_md'>Data listing from <strong>exibble</strong></span></td>
          </tr>
          <tr class="gt_heading">
            <td colspan="9" class="gt_heading gt_subtitle gt_font_normal gt_bottom_border" style><span class='gt_from_md'><code>exibble</code> is an R dataset</span></td>
          </tr>
          <tr class="gt_col_headings gt_spanner_row">
            <th class="gt_col_heading gt_columns_bottom_border gt_left" rowspan="2" colspan="1" scope="col" id="a::stub">S.L.</th>
            <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="2" colspan="1" scope="col" id="num">num</th>
            <th class="gt_col_heading gt_columns_bottom_border gt_left" rowspan="2" colspan="1" scope="col" id="char">char</th>
            <th class="gt_col_heading gt_columns_bottom_border gt_center" rowspan="2" colspan="1" scope="col" id="fctr">fctr</th>
            <th class="gt_center gt_columns_top_border gt_column_spanner_outer" rowspan="1" colspan="3" scope="colgroup" id="timing">
              <div class="gt_column_spanner">timing</div>
            </th>
            <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="2" colspan="1" scope="col" id="currency">currency</th>
            <th class="gt_col_heading gt_columns_bottom_border gt_left" rowspan="2" colspan="1" scope="col" id="group">group</th>
          </tr>
          <tr class="gt_col_headings">
            <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id="date">date</th>
            <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id="time">time</th>
            <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id="datetime">datetime</th>
          </tr>
        </thead>
        <tbody class="gt_table_body">
          <tr><th id="stub_1_1" scope="row" class="gt_row gt_left gt_stub">row_1</th>
      <td headers="stub_1_1 num" class="gt_row gt_right">1.111e-01</td>
      <td headers="stub_1_1 char" class="gt_row gt_left">apricot</td>
      <td headers="stub_1_1 fctr" class="gt_row gt_center">one</td>
      <td headers="stub_1_1 date" class="gt_row gt_right">2015-01-15</td>
      <td headers="stub_1_1 time" class="gt_row gt_right">13:35</td>
      <td headers="stub_1_1 datetime" class="gt_row gt_right">2018-01-01 02:22</td>
      <td headers="stub_1_1 currency" class="gt_row gt_right">49.950</td>
      <td headers="stub_1_1 group" class="gt_row gt_left">grp_a</td></tr>
          <tr><th id="stub_1_2" scope="row" class="gt_row gt_left gt_stub">row_2</th>
      <td headers="stub_1_2 num" class="gt_row gt_right">2.222e+00</td>
      <td headers="stub_1_2 char" class="gt_row gt_left">banana</td>
      <td headers="stub_1_2 fctr" class="gt_row gt_center">two</td>
      <td headers="stub_1_2 date" class="gt_row gt_right">2015-02-15</td>
      <td headers="stub_1_2 time" class="gt_row gt_right">14:40</td>
      <td headers="stub_1_2 datetime" class="gt_row gt_right">2018-02-02 14:33</td>
      <td headers="stub_1_2 currency" class="gt_row gt_right">17.950</td>
      <td headers="stub_1_2 group" class="gt_row gt_left">grp_a</td></tr>
          <tr><th id="stub_1_3" scope="row" class="gt_row gt_left gt_stub">row_3</th>
      <td headers="stub_1_3 num" class="gt_row gt_right">3.333e+01</td>
      <td headers="stub_1_3 char" class="gt_row gt_left">coconut</td>
      <td headers="stub_1_3 fctr" class="gt_row gt_center">three</td>
      <td headers="stub_1_3 date" class="gt_row gt_right">2015-03-15</td>
      <td headers="stub_1_3 time" class="gt_row gt_right">15:45</td>
      <td headers="stub_1_3 datetime" class="gt_row gt_right">2018-03-03 03:44</td>
      <td headers="stub_1_3 currency" class="gt_row gt_right">1.390</td>
      <td headers="stub_1_3 group" class="gt_row gt_left">grp_a</td></tr>
          <tr><th id="stub_1_4" scope="row" class="gt_row gt_left gt_stub">row_4</th>
      <td headers="stub_1_4 num" class="gt_row gt_right">4.444e+02</td>
      <td headers="stub_1_4 char" class="gt_row gt_left">durian</td>
      <td headers="stub_1_4 fctr" class="gt_row gt_center">four</td>
      <td headers="stub_1_4 date" class="gt_row gt_right">2015-04-15</td>
      <td headers="stub_1_4 time" class="gt_row gt_right">16:50</td>
      <td headers="stub_1_4 datetime" class="gt_row gt_right">2018-04-04 15:55</td>
      <td headers="stub_1_4 currency" class="gt_row gt_right">65100.000</td>
      <td headers="stub_1_4 group" class="gt_row gt_left">grp_a</td></tr>
          <tr><th id="stub_1_5" scope="row" class="gt_row gt_left gt_stub">row_5</th>
      <td headers="stub_1_5 num" class="gt_row gt_right">5.550e+03</td>
      <td headers="stub_1_5 char" class="gt_row gt_left">NA</td>
      <td headers="stub_1_5 fctr" class="gt_row gt_center">five</td>
      <td headers="stub_1_5 date" class="gt_row gt_right">2015-05-15</td>
      <td headers="stub_1_5 time" class="gt_row gt_right">17:55</td>
      <td headers="stub_1_5 datetime" class="gt_row gt_right">2018-05-05 04:00</td>
      <td headers="stub_1_5 currency" class="gt_row gt_right">1325.810</td>
      <td headers="stub_1_5 group" class="gt_row gt_left">grp_b</td></tr>
          <tr><th id="stub_1_6" scope="row" class="gt_row gt_left gt_stub">row_6</th>
      <td headers="stub_1_6 num" class="gt_row gt_right">NA</td>
      <td headers="stub_1_6 char" class="gt_row gt_left">fig</td>
      <td headers="stub_1_6 fctr" class="gt_row gt_center">six</td>
      <td headers="stub_1_6 date" class="gt_row gt_right">2015-06-15</td>
      <td headers="stub_1_6 time" class="gt_row gt_right">NA</td>
      <td headers="stub_1_6 datetime" class="gt_row gt_right">2018-06-06 16:11</td>
      <td headers="stub_1_6 currency" class="gt_row gt_right">13.255</td>
      <td headers="stub_1_6 group" class="gt_row gt_left">grp_b</td></tr>
          <tr><th id="stub_1_7" scope="row" class="gt_row gt_left gt_stub">row_7</th>
      <td headers="stub_1_7 num" class="gt_row gt_right">7.770e+05</td>
      <td headers="stub_1_7 char" class="gt_row gt_left">grapefruit</td>
      <td headers="stub_1_7 fctr" class="gt_row gt_center">seven</td>
      <td headers="stub_1_7 date" class="gt_row gt_right">NA</td>
      <td headers="stub_1_7 time" class="gt_row gt_right">19:10</td>
      <td headers="stub_1_7 datetime" class="gt_row gt_right">2018-07-07 05:22</td>
      <td headers="stub_1_7 currency" class="gt_row gt_right">NA</td>
      <td headers="stub_1_7 group" class="gt_row gt_left">grp_b</td></tr>
          <tr><th id="stub_1_8" scope="row" class="gt_row gt_left gt_stub">row_8</th>
      <td headers="stub_1_8 num" class="gt_row gt_right">8.880e+06</td>
      <td headers="stub_1_8 char" class="gt_row gt_left">honeydew</td>
      <td headers="stub_1_8 fctr" class="gt_row gt_center">eight</td>
      <td headers="stub_1_8 date" class="gt_row gt_right">2015-08-15</td>
      <td headers="stub_1_8 time" class="gt_row gt_right">20:20</td>
      <td headers="stub_1_8 datetime" class="gt_row gt_right">NA</td>
      <td headers="stub_1_8 currency" class="gt_row gt_right">0.440</td>
      <td headers="stub_1_8 group" class="gt_row gt_left">grp_b</td></tr>
          <tr><th id="grand_summary_stub_1" scope="row" class="gt_row gt_left gt_stub gt_grand_summary_row gt_first_grand_summary_row">min</th>
      <td headers="grand_summary_stub_1 num" class="gt_row gt_right gt_grand_summary_row gt_first_grand_summary_row">0.11</td>
      <td headers="grand_summary_stub_1 char" class="gt_row gt_left gt_grand_summary_row gt_first_grand_summary_row">—</td>
      <td headers="grand_summary_stub_1 fctr" class="gt_row gt_center gt_grand_summary_row gt_first_grand_summary_row">—</td>
      <td headers="grand_summary_stub_1 date" class="gt_row gt_right gt_grand_summary_row gt_first_grand_summary_row">—</td>
      <td headers="grand_summary_stub_1 time" class="gt_row gt_right gt_grand_summary_row gt_first_grand_summary_row">—</td>
      <td headers="grand_summary_stub_1 datetime" class="gt_row gt_right gt_grand_summary_row gt_first_grand_summary_row">—</td>
      <td headers="grand_summary_stub_1 currency" class="gt_row gt_right gt_grand_summary_row gt_first_grand_summary_row">0.44</td>
      <td headers="grand_summary_stub_1 group" class="gt_row gt_left gt_grand_summary_row gt_first_grand_summary_row">—</td></tr>
          <tr><th id="grand_summary_stub_2" scope="row" class="gt_row gt_left gt_stub gt_grand_summary_row">max</th>
      <td headers="grand_summary_stub_2 num" class="gt_row gt_right gt_grand_summary_row">8880000.00</td>
      <td headers="grand_summary_stub_2 char" class="gt_row gt_left gt_grand_summary_row">—</td>
      <td headers="grand_summary_stub_2 fctr" class="gt_row gt_center gt_grand_summary_row">—</td>
      <td headers="grand_summary_stub_2 date" class="gt_row gt_right gt_grand_summary_row">—</td>
      <td headers="grand_summary_stub_2 time" class="gt_row gt_right gt_grand_summary_row">—</td>
      <td headers="grand_summary_stub_2 datetime" class="gt_row gt_right gt_grand_summary_row">—</td>
      <td headers="grand_summary_stub_2 currency" class="gt_row gt_right gt_grand_summary_row">65100.00</td>
      <td headers="grand_summary_stub_2 group" class="gt_row gt_left gt_grand_summary_row">—</td></tr>
          <tr><th id="grand_summary_stub_3" scope="row" class="gt_row gt_left gt_stub gt_grand_summary_row gt_last_summary_row">avg</th>
      <td headers="grand_summary_stub_3 num" class="gt_row gt_right gt_grand_summary_row gt_last_summary_row">1380432.87</td>
      <td headers="grand_summary_stub_3 char" class="gt_row gt_left gt_grand_summary_row gt_last_summary_row">—</td>
      <td headers="grand_summary_stub_3 fctr" class="gt_row gt_center gt_grand_summary_row gt_last_summary_row">—</td>
      <td headers="grand_summary_stub_3 date" class="gt_row gt_right gt_grand_summary_row gt_last_summary_row">—</td>
      <td headers="grand_summary_stub_3 time" class="gt_row gt_right gt_grand_summary_row gt_last_summary_row">—</td>
      <td headers="grand_summary_stub_3 datetime" class="gt_row gt_right gt_grand_summary_row gt_last_summary_row">—</td>
      <td headers="grand_summary_stub_3 currency" class="gt_row gt_right gt_grand_summary_row gt_last_summary_row">9501.26</td>
      <td headers="grand_summary_stub_3 group" class="gt_row gt_left gt_grand_summary_row gt_last_summary_row">—</td></tr>
        </tbody>
        <tfoot>
          <tr class="gt_sourcenotes">
            <td class="gt_sourcenote" colspan="9">Source note #1</td>
          </tr>
          <tr class="gt_sourcenotes">
            <td class="gt_sourcenote" colspan="9">Source note #2</td>
          </tr>
        </tfoot>
      </table>

---

    Code
      as.character(as_latex(gt_tbl))
    Output
      [1] "\\begingroup\n\\fontsize{12.0pt}{14.0pt}\\selectfont\n\\setlength{\\LTpost}{0mm}\n\\begin{longtable}{l|rlcrrrrl}\n\\caption*{\n{\\fontsize{20}{25}\\selectfont  Data listing from \\textbf{exibble}\\fontsize{12}{15}\\selectfont } \\\\ \n{\\fontsize{14}{17}\\selectfont  \\texttt{exibble} is an R dataset\\fontsize{12}{15}\\selectfont }\n} \\\\ \n\\toprule\n &  &  &  & \\multicolumn{3}{c}{timing} &  &  \\\\ \n\\cmidrule(lr){5-7}\nS.L. & num & char & fctr & date & time & datetime & currency & group \\\\ \n\\midrule\\addlinespace[2.5pt]\nrow\\_1 & 1.111e-01 & apricot & one & 2015-01-15 & 13:35 & 2018-01-01 02:22 & 49.950 & grp\\_a \\\\ \nrow\\_2 & 2.222e+00 & banana & two & 2015-02-15 & 14:40 & 2018-02-02 14:33 & 17.950 & grp\\_a \\\\ \nrow\\_3 & 3.333e+01 & coconut & three & 2015-03-15 & 15:45 & 2018-03-03 03:44 & 1.390 & grp\\_a \\\\ \nrow\\_4 & 4.444e+02 & durian & four & 2015-04-15 & 16:50 & 2018-04-04 15:55 & 65100.000 & grp\\_a \\\\ \nrow\\_5 & 5.550e+03 & NA & five & 2015-05-15 & 17:55 & 2018-05-05 04:00 & 1325.810 & grp\\_b \\\\ \nrow\\_6 & NA & fig & six & 2015-06-15 & NA & 2018-06-06 16:11 & 13.255 & grp\\_b \\\\ \nrow\\_7 & 7.770e+05 & grapefruit & seven & NA & 19:10 & 2018-07-07 05:22 & NA & grp\\_b \\\\ \nrow\\_8 & 8.880e+06 & honeydew & eight & 2015-08-15 & 20:20 & NA & 0.440 & grp\\_b \\\\ \n\\midrule \n\\midrule \nmin & 0.11 & — & — & — & — & — & 0.44 & — \\\\ \nmax & 8880000.00 & — & — & — & — & — & 65100.00 & — \\\\ \navg & 1380432.87 & — & — & — & — & — & 9501.26 & — \\\\ \n\\bottomrule\n\\end{longtable}\n\\begin{minipage}{\\linewidth}\n\\vspace{.05em}\nSource note \\#1\\\\\nSource note \\#2\\\\\n\\end{minipage}\n\\endgroup\n"

---

    Code
      as_rtf(gt_tbl)
    Output
      {\rtf\ansi\ansicpg1252{\fonttbl{\f0\froman\fcharset0\fprq0 Courier New;}{\f1\froman\fcharset0\fprq0 Times;}}{\colortbl;\red51\green51\blue51;\red211\green211\blue211;}
      
      \paperw12240\paperh15840\widowctrl\ftnbj\fet0\sectd\linex0
      \lndscpsxn
      \margl1440\margr1440\margt1440\margb1440
      \headery720\footery720\fs20
      
      \trowd\trrh0\trhdr
      
      \pard\plain\uc0\qc\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx9360
      \intbl {\f0\cf1 {\f0\fs20 Data listing from {\b exibble}} {\f0\fs20\i\super } \line {\f0\fs20 {\f1 exibble} is an R dataset} {\f0\fs20\i\super }}\cell
      
      \row
      
      \trowd\trrh0\trhdr
      
      \pard\plain\uc0\qc\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx1040
      \intbl {\f0 {\f0\fs20 }}\cell
      
      \pard\plain\uc0\qc\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx2080
      \intbl {\f0 {\f0\fs20 }}\cell
      
      \pard\plain\uc0\qc\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx3120
      \intbl {\f0 {\f0\fs20 }}\cell
      
      \pard\plain\uc0\qc\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx4160
      \intbl {\f0 {\f0\fs20 }}\cell
      
      \pard\plain\uc0\qc\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85\clbrdrb\brdrs\brdrw20\brdrcf2\clmgf \cellx5200
      \intbl {\f0 {\f0\fs20 timing}}\cell
      
      \pard\plain\uc0\qc\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85\clmrg \cellx6240
      \intbl {\f0 {\f0\fs20 }}\cell
      
      \pard\plain\uc0\qc\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85\clmrg \cellx7280
      \intbl {\f0 {\f0\fs20 }}\cell
      
      \pard\plain\uc0\qc\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx8320
      \intbl {\f0 {\f0\fs20 }}\cell
      
      \pard\plain\uc0\qc\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx9360
      \intbl {\f0 {\f0\fs20 }}\cell
      
      \row
      
      \trowd\trrh0\trhdr
      
      \pard\plain\uc0\ql\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85\clbrdrb\brdrs\brdrw20\brdrcf2 \cellx1040
      \intbl {\f0 {\f0\fs20 S.L.}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85\clbrdrb\brdrs\brdrw20\brdrcf2 \cellx2080
      \intbl {\f0 {\f0\fs20 num}}\cell
      
      \pard\plain\uc0\ql\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85\clbrdrb\brdrs\brdrw20\brdrcf2 \cellx3120
      \intbl {\f0 {\f0\fs20 char}}\cell
      
      \pard\plain\uc0\qc\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85\clbrdrb\brdrs\brdrw20\brdrcf2 \cellx4160
      \intbl {\f0 {\f0\fs20 fctr}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85\clbrdrb\brdrs\brdrw20\brdrcf2 \cellx5200
      \intbl {\f0 {\f0\fs20 date}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85\clbrdrb\brdrs\brdrw20\brdrcf2 \cellx6240
      \intbl {\f0 {\f0\fs20 time}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85\clbrdrb\brdrs\brdrw20\brdrcf2 \cellx7280
      \intbl {\f0 {\f0\fs20 datetime}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85\clbrdrb\brdrs\brdrw20\brdrcf2 \cellx8320
      \intbl {\f0 {\f0\fs20 currency}}\cell
      
      \pard\plain\uc0\ql\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85\clbrdrb\brdrs\brdrw20\brdrcf2 \cellx9360
      \intbl {\f0 {\f0\fs20 group}}\cell
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\ql\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx1040
      \intbl {\f0 {\f0\fs20 row_1}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx2080
      \intbl {\f0 {\f0\fs20 1.111e-01}}\cell
      
      \pard\plain\uc0\ql\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx3120
      \intbl {\f0 {\f0\fs20 apricot}}\cell
      
      \pard\plain\uc0\qc\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx4160
      \intbl {\f0 {\f0\fs20 one}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx5200
      \intbl {\f0 {\f0\fs20 2015-01-15}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx6240
      \intbl {\f0 {\f0\fs20 13:35}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx7280
      \intbl {\f0 {\f0\fs20 2018-01-01 02:22}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx8320
      \intbl {\f0 {\f0\fs20 49.950}}\cell
      
      \pard\plain\uc0\ql\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx9360
      \intbl {\f0 {\f0\fs20 grp_a}}\cell
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\ql\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx1040
      \intbl {\f0 {\f0\fs20 row_2}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx2080
      \intbl {\f0 {\f0\fs20 2.222e+00}}\cell
      
      \pard\plain\uc0\ql\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx3120
      \intbl {\f0 {\f0\fs20 banana}}\cell
      
      \pard\plain\uc0\qc\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx4160
      \intbl {\f0 {\f0\fs20 two}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx5200
      \intbl {\f0 {\f0\fs20 2015-02-15}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx6240
      \intbl {\f0 {\f0\fs20 14:40}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx7280
      \intbl {\f0 {\f0\fs20 2018-02-02 14:33}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx8320
      \intbl {\f0 {\f0\fs20 17.950}}\cell
      
      \pard\plain\uc0\ql\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx9360
      \intbl {\f0 {\f0\fs20 grp_a}}\cell
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\ql\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx1040
      \intbl {\f0 {\f0\fs20 row_3}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx2080
      \intbl {\f0 {\f0\fs20 3.333e+01}}\cell
      
      \pard\plain\uc0\ql\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx3120
      \intbl {\f0 {\f0\fs20 coconut}}\cell
      
      \pard\plain\uc0\qc\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx4160
      \intbl {\f0 {\f0\fs20 three}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx5200
      \intbl {\f0 {\f0\fs20 2015-03-15}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx6240
      \intbl {\f0 {\f0\fs20 15:45}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx7280
      \intbl {\f0 {\f0\fs20 2018-03-03 03:44}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx8320
      \intbl {\f0 {\f0\fs20 1.390}}\cell
      
      \pard\plain\uc0\ql\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx9360
      \intbl {\f0 {\f0\fs20 grp_a}}\cell
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\ql\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx1040
      \intbl {\f0 {\f0\fs20 row_4}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx2080
      \intbl {\f0 {\f0\fs20 4.444e+02}}\cell
      
      \pard\plain\uc0\ql\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx3120
      \intbl {\f0 {\f0\fs20 durian}}\cell
      
      \pard\plain\uc0\qc\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx4160
      \intbl {\f0 {\f0\fs20 four}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx5200
      \intbl {\f0 {\f0\fs20 2015-04-15}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx6240
      \intbl {\f0 {\f0\fs20 16:50}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx7280
      \intbl {\f0 {\f0\fs20 2018-04-04 15:55}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx8320
      \intbl {\f0 {\f0\fs20 65100.000}}\cell
      
      \pard\plain\uc0\ql\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx9360
      \intbl {\f0 {\f0\fs20 grp_a}}\cell
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\ql\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx1040
      \intbl {\f0 {\f0\fs20 row_5}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx2080
      \intbl {\f0 {\f0\fs20 5.550e+03}}\cell
      
      \pard\plain\uc0\ql\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx3120
      \intbl {\f0 {\f0\fs20 NA}}\cell
      
      \pard\plain\uc0\qc\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx4160
      \intbl {\f0 {\f0\fs20 five}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx5200
      \intbl {\f0 {\f0\fs20 2015-05-15}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx6240
      \intbl {\f0 {\f0\fs20 17:55}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx7280
      \intbl {\f0 {\f0\fs20 2018-05-05 04:00}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx8320
      \intbl {\f0 {\f0\fs20 1325.810}}\cell
      
      \pard\plain\uc0\ql\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx9360
      \intbl {\f0 {\f0\fs20 grp_b}}\cell
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\ql\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx1040
      \intbl {\f0 {\f0\fs20 row_6}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx2080
      \intbl {\f0 {\f0\fs20 NA}}\cell
      
      \pard\plain\uc0\ql\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx3120
      \intbl {\f0 {\f0\fs20 fig}}\cell
      
      \pard\plain\uc0\qc\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx4160
      \intbl {\f0 {\f0\fs20 six}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx5200
      \intbl {\f0 {\f0\fs20 2015-06-15}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx6240
      \intbl {\f0 {\f0\fs20 NA}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx7280
      \intbl {\f0 {\f0\fs20 2018-06-06 16:11}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx8320
      \intbl {\f0 {\f0\fs20 13.255}}\cell
      
      \pard\plain\uc0\ql\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx9360
      \intbl {\f0 {\f0\fs20 grp_b}}\cell
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\ql\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx1040
      \intbl {\f0 {\f0\fs20 row_7}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx2080
      \intbl {\f0 {\f0\fs20 7.770e+05}}\cell
      
      \pard\plain\uc0\ql\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx3120
      \intbl {\f0 {\f0\fs20 grapefruit}}\cell
      
      \pard\plain\uc0\qc\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx4160
      \intbl {\f0 {\f0\fs20 seven}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx5200
      \intbl {\f0 {\f0\fs20 NA}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx6240
      \intbl {\f0 {\f0\fs20 19:10}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx7280
      \intbl {\f0 {\f0\fs20 2018-07-07 05:22}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx8320
      \intbl {\f0 {\f0\fs20 NA}}\cell
      
      \pard\plain\uc0\ql\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx9360
      \intbl {\f0 {\f0\fs20 grp_b}}\cell
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\ql\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx1040
      \intbl {\f0 {\f0\fs20 row_8}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx2080
      \intbl {\f0 {\f0\fs20 8.880e+06}}\cell
      
      \pard\plain\uc0\ql\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx3120
      \intbl {\f0 {\f0\fs20 honeydew}}\cell
      
      \pard\plain\uc0\qc\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx4160
      \intbl {\f0 {\f0\fs20 eight}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx5200
      \intbl {\f0 {\f0\fs20 2015-08-15}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx6240
      \intbl {\f0 {\f0\fs20 20:20}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx7280
      \intbl {\f0 {\f0\fs20 NA}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx8320
      \intbl {\f0 {\f0\fs20 0.440}}\cell
      
      \pard\plain\uc0\ql\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx9360
      \intbl {\f0 {\f0\fs20 grp_b}}\cell
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\ql\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx1040
      \intbl {\f0 {\f0\fs20 min}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx2080
      \intbl {\f0 {\f0\fs20 0.11}}\cell
      
      \pard\plain\uc0\ql\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx3120
      \intbl {\f0 {\f0\fs20 \'97}}\cell
      
      \pard\plain\uc0\qc\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx4160
      \intbl {\f0 {\f0\fs20 \'97}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx5200
      \intbl {\f0 {\f0\fs20 \'97}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx6240
      \intbl {\f0 {\f0\fs20 \'97}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx7280
      \intbl {\f0 {\f0\fs20 \'97}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx8320
      \intbl {\f0 {\f0\fs20 0.44}}\cell
      
      \pard\plain\uc0\ql\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx9360
      \intbl {\f0 {\f0\fs20 \'97}}\cell
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\ql\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx1040
      \intbl {\f0 {\f0\fs20 max}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx2080
      \intbl {\f0 {\f0\fs20 8880000.00}}\cell
      
      \pard\plain\uc0\ql\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx3120
      \intbl {\f0 {\f0\fs20 \'97}}\cell
      
      \pard\plain\uc0\qc\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx4160
      \intbl {\f0 {\f0\fs20 \'97}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx5200
      \intbl {\f0 {\f0\fs20 \'97}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx6240
      \intbl {\f0 {\f0\fs20 \'97}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx7280
      \intbl {\f0 {\f0\fs20 \'97}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx8320
      \intbl {\f0 {\f0\fs20 65100.00}}\cell
      
      \pard\plain\uc0\ql\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx9360
      \intbl {\f0 {\f0\fs20 \'97}}\cell
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\ql\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx1040
      \intbl {\f0 {\f0\fs20 avg}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx2080
      \intbl {\f0 {\f0\fs20 1380432.87}}\cell
      
      \pard\plain\uc0\ql\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx3120
      \intbl {\f0 {\f0\fs20 \'97}}\cell
      
      \pard\plain\uc0\qc\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx4160
      \intbl {\f0 {\f0\fs20 \'97}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx5200
      \intbl {\f0 {\f0\fs20 \'97}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx6240
      \intbl {\f0 {\f0\fs20 \'97}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx7280
      \intbl {\f0 {\f0\fs20 \'97}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx8320
      \intbl {\f0 {\f0\fs20 9501.26}}\cell
      
      \pard\plain\uc0\ql\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx9360
      \intbl {\f0 {\f0\fs20 \'97}}\cell
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\ql\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx9360
      \intbl {\f0 {\f0\fs20 Source note #1\line Source note #2}}\cell
      
      \row
      
      }

---

    Code
      cat(render_as_html(gt_tbl))
    Output
      <table class="gt_table" data-quarto-disable-processing="false" data-quarto-bootstrap="false">
        <thead>
          <tr class="gt_heading">
            <td colspan="9" class="gt_heading gt_title gt_font_normal" style><span class='gt_from_md'>Data listing from <strong>exibble</strong></span></td>
          </tr>
          <tr class="gt_heading">
            <td colspan="9" class="gt_heading gt_subtitle gt_font_normal gt_bottom_border" style><span class='gt_from_md'><code>exibble</code> is an R dataset</span></td>
          </tr>
          <tr class="gt_col_headings gt_spanner_row">
            <th class="gt_col_heading gt_columns_bottom_border gt_left" rowspan="2" colspan="1" scope="col" id="a::stub">S.L.</th>
            <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="2" colspan="1" scope="col" id="num">num</th>
            <th class="gt_col_heading gt_columns_bottom_border gt_left" rowspan="2" colspan="1" scope="col" id="char">char</th>
            <th class="gt_col_heading gt_columns_bottom_border gt_center" rowspan="2" colspan="1" scope="col" id="fctr">fctr</th>
            <th class="gt_center gt_columns_top_border gt_column_spanner_outer" rowspan="1" colspan="3" scope="colgroup" id="timing">
              <div class="gt_column_spanner">timing</div>
            </th>
            <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="2" colspan="1" scope="col" id="currency">currency</th>
            <th class="gt_col_heading gt_columns_bottom_border gt_left" rowspan="2" colspan="1" scope="col" id="group">group</th>
          </tr>
          <tr class="gt_col_headings">
            <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id="date">date</th>
            <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id="time">time</th>
            <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id="datetime">datetime</th>
          </tr>
        </thead>
        <tbody class="gt_table_body">
          <tr><th id="stub_1_1" scope="row" class="gt_row gt_left gt_stub">row_1</th>
      <td headers="stub_1_1 num" class="gt_row gt_right">1.111e-01</td>
      <td headers="stub_1_1 char" class="gt_row gt_left">apricot</td>
      <td headers="stub_1_1 fctr" class="gt_row gt_center">one</td>
      <td headers="stub_1_1 date" class="gt_row gt_right">2015-01-15</td>
      <td headers="stub_1_1 time" class="gt_row gt_right">13:35</td>
      <td headers="stub_1_1 datetime" class="gt_row gt_right">2018-01-01 02:22</td>
      <td headers="stub_1_1 currency" class="gt_row gt_right">49.950</td>
      <td headers="stub_1_1 group" class="gt_row gt_left">grp_a</td></tr>
          <tr><th id="stub_1_2" scope="row" class="gt_row gt_left gt_stub">row_2</th>
      <td headers="stub_1_2 num" class="gt_row gt_right">2.222e+00</td>
      <td headers="stub_1_2 char" class="gt_row gt_left">banana</td>
      <td headers="stub_1_2 fctr" class="gt_row gt_center">two</td>
      <td headers="stub_1_2 date" class="gt_row gt_right">2015-02-15</td>
      <td headers="stub_1_2 time" class="gt_row gt_right">14:40</td>
      <td headers="stub_1_2 datetime" class="gt_row gt_right">2018-02-02 14:33</td>
      <td headers="stub_1_2 currency" class="gt_row gt_right">17.950</td>
      <td headers="stub_1_2 group" class="gt_row gt_left">grp_a</td></tr>
          <tr><th id="stub_1_3" scope="row" class="gt_row gt_left gt_stub">row_3</th>
      <td headers="stub_1_3 num" class="gt_row gt_right">3.333e+01</td>
      <td headers="stub_1_3 char" class="gt_row gt_left">coconut</td>
      <td headers="stub_1_3 fctr" class="gt_row gt_center">three</td>
      <td headers="stub_1_3 date" class="gt_row gt_right">2015-03-15</td>
      <td headers="stub_1_3 time" class="gt_row gt_right">15:45</td>
      <td headers="stub_1_3 datetime" class="gt_row gt_right">2018-03-03 03:44</td>
      <td headers="stub_1_3 currency" class="gt_row gt_right">1.390</td>
      <td headers="stub_1_3 group" class="gt_row gt_left">grp_a</td></tr>
          <tr><th id="stub_1_4" scope="row" class="gt_row gt_left gt_stub">row_4</th>
      <td headers="stub_1_4 num" class="gt_row gt_right">4.444e+02</td>
      <td headers="stub_1_4 char" class="gt_row gt_left">durian</td>
      <td headers="stub_1_4 fctr" class="gt_row gt_center">four</td>
      <td headers="stub_1_4 date" class="gt_row gt_right">2015-04-15</td>
      <td headers="stub_1_4 time" class="gt_row gt_right">16:50</td>
      <td headers="stub_1_4 datetime" class="gt_row gt_right">2018-04-04 15:55</td>
      <td headers="stub_1_4 currency" class="gt_row gt_right">65100.000</td>
      <td headers="stub_1_4 group" class="gt_row gt_left">grp_a</td></tr>
          <tr><th id="stub_1_5" scope="row" class="gt_row gt_left gt_stub">row_5</th>
      <td headers="stub_1_5 num" class="gt_row gt_right">5.550e+03</td>
      <td headers="stub_1_5 char" class="gt_row gt_left">NA</td>
      <td headers="stub_1_5 fctr" class="gt_row gt_center">five</td>
      <td headers="stub_1_5 date" class="gt_row gt_right">2015-05-15</td>
      <td headers="stub_1_5 time" class="gt_row gt_right">17:55</td>
      <td headers="stub_1_5 datetime" class="gt_row gt_right">2018-05-05 04:00</td>
      <td headers="stub_1_5 currency" class="gt_row gt_right">1325.810</td>
      <td headers="stub_1_5 group" class="gt_row gt_left">grp_b</td></tr>
          <tr><th id="stub_1_6" scope="row" class="gt_row gt_left gt_stub">row_6</th>
      <td headers="stub_1_6 num" class="gt_row gt_right">NA</td>
      <td headers="stub_1_6 char" class="gt_row gt_left">fig</td>
      <td headers="stub_1_6 fctr" class="gt_row gt_center">six</td>
      <td headers="stub_1_6 date" class="gt_row gt_right">2015-06-15</td>
      <td headers="stub_1_6 time" class="gt_row gt_right">NA</td>
      <td headers="stub_1_6 datetime" class="gt_row gt_right">2018-06-06 16:11</td>
      <td headers="stub_1_6 currency" class="gt_row gt_right">13.255</td>
      <td headers="stub_1_6 group" class="gt_row gt_left">grp_b</td></tr>
          <tr><th id="stub_1_7" scope="row" class="gt_row gt_left gt_stub">row_7</th>
      <td headers="stub_1_7 num" class="gt_row gt_right">7.770e+05</td>
      <td headers="stub_1_7 char" class="gt_row gt_left">grapefruit</td>
      <td headers="stub_1_7 fctr" class="gt_row gt_center">seven</td>
      <td headers="stub_1_7 date" class="gt_row gt_right">NA</td>
      <td headers="stub_1_7 time" class="gt_row gt_right">19:10</td>
      <td headers="stub_1_7 datetime" class="gt_row gt_right">2018-07-07 05:22</td>
      <td headers="stub_1_7 currency" class="gt_row gt_right">NA</td>
      <td headers="stub_1_7 group" class="gt_row gt_left">grp_b</td></tr>
          <tr><th id="stub_1_8" scope="row" class="gt_row gt_left gt_stub">row_8</th>
      <td headers="stub_1_8 num" class="gt_row gt_right">8.880e+06</td>
      <td headers="stub_1_8 char" class="gt_row gt_left">honeydew</td>
      <td headers="stub_1_8 fctr" class="gt_row gt_center">eight</td>
      <td headers="stub_1_8 date" class="gt_row gt_right">2015-08-15</td>
      <td headers="stub_1_8 time" class="gt_row gt_right">20:20</td>
      <td headers="stub_1_8 datetime" class="gt_row gt_right">NA</td>
      <td headers="stub_1_8 currency" class="gt_row gt_right">0.440</td>
      <td headers="stub_1_8 group" class="gt_row gt_left">grp_b</td></tr>
          <tr><th id="grand_summary_stub_1" scope="row" class="gt_row gt_left gt_stub gt_grand_summary_row gt_first_grand_summary_row">min</th>
      <td headers="grand_summary_stub_1 num" class="gt_row gt_right gt_grand_summary_row gt_first_grand_summary_row">0.11</td>
      <td headers="grand_summary_stub_1 char" class="gt_row gt_left gt_grand_summary_row gt_first_grand_summary_row">—</td>
      <td headers="grand_summary_stub_1 fctr" class="gt_row gt_center gt_grand_summary_row gt_first_grand_summary_row">—</td>
      <td headers="grand_summary_stub_1 date" class="gt_row gt_right gt_grand_summary_row gt_first_grand_summary_row">—</td>
      <td headers="grand_summary_stub_1 time" class="gt_row gt_right gt_grand_summary_row gt_first_grand_summary_row">—</td>
      <td headers="grand_summary_stub_1 datetime" class="gt_row gt_right gt_grand_summary_row gt_first_grand_summary_row">—</td>
      <td headers="grand_summary_stub_1 currency" class="gt_row gt_right gt_grand_summary_row gt_first_grand_summary_row">0.44</td>
      <td headers="grand_summary_stub_1 group" class="gt_row gt_left gt_grand_summary_row gt_first_grand_summary_row">—</td></tr>
          <tr><th id="grand_summary_stub_2" scope="row" class="gt_row gt_left gt_stub gt_grand_summary_row">max</th>
      <td headers="grand_summary_stub_2 num" class="gt_row gt_right gt_grand_summary_row">8880000.00</td>
      <td headers="grand_summary_stub_2 char" class="gt_row gt_left gt_grand_summary_row">—</td>
      <td headers="grand_summary_stub_2 fctr" class="gt_row gt_center gt_grand_summary_row">—</td>
      <td headers="grand_summary_stub_2 date" class="gt_row gt_right gt_grand_summary_row">—</td>
      <td headers="grand_summary_stub_2 time" class="gt_row gt_right gt_grand_summary_row">—</td>
      <td headers="grand_summary_stub_2 datetime" class="gt_row gt_right gt_grand_summary_row">—</td>
      <td headers="grand_summary_stub_2 currency" class="gt_row gt_right gt_grand_summary_row">65100.00</td>
      <td headers="grand_summary_stub_2 group" class="gt_row gt_left gt_grand_summary_row">—</td></tr>
          <tr><th id="grand_summary_stub_3" scope="row" class="gt_row gt_left gt_stub gt_grand_summary_row gt_last_summary_row">avg</th>
      <td headers="grand_summary_stub_3 num" class="gt_row gt_right gt_grand_summary_row gt_last_summary_row">1380432.87</td>
      <td headers="grand_summary_stub_3 char" class="gt_row gt_left gt_grand_summary_row gt_last_summary_row">—</td>
      <td headers="grand_summary_stub_3 fctr" class="gt_row gt_center gt_grand_summary_row gt_last_summary_row">—</td>
      <td headers="grand_summary_stub_3 date" class="gt_row gt_right gt_grand_summary_row gt_last_summary_row">—</td>
      <td headers="grand_summary_stub_3 time" class="gt_row gt_right gt_grand_summary_row gt_last_summary_row">—</td>
      <td headers="grand_summary_stub_3 datetime" class="gt_row gt_right gt_grand_summary_row gt_last_summary_row">—</td>
      <td headers="grand_summary_stub_3 currency" class="gt_row gt_right gt_grand_summary_row gt_last_summary_row">9501.26</td>
      <td headers="grand_summary_stub_3 group" class="gt_row gt_left gt_grand_summary_row gt_last_summary_row">—</td></tr>
        </tbody>
        <tfoot>
          <tr class="gt_sourcenotes">
            <td class="gt_sourcenote" colspan="9">Source note #1</td>
          </tr>
          <tr class="gt_sourcenotes">
            <td class="gt_sourcenote" colspan="9">Source note #2</td>
          </tr>
        </tfoot>
      </table>

---

    Code
      as.character(as_latex(gt_tbl))
    Output
      [1] "\\begingroup\n\\fontsize{12.0pt}{14.0pt}\\selectfont\n\\setlength{\\LTpost}{0mm}\n\\begin{longtable}{l|rlcrrrrl}\n\\caption*{\n{\\fontsize{20}{25}\\selectfont  Data listing from \\textbf{exibble}\\fontsize{12}{15}\\selectfont } \\\\ \n{\\fontsize{14}{17}\\selectfont  \\texttt{exibble} is an R dataset\\fontsize{12}{15}\\selectfont }\n} \\\\ \n\\toprule\n &  &  &  & \\multicolumn{3}{c}{timing} &  &  \\\\ \n\\cmidrule(lr){5-7}\nS.L. & num & char & fctr & date & time & datetime & currency & group \\\\ \n\\midrule\\addlinespace[2.5pt]\nrow\\_1 & 1.111e-01 & apricot & one & 2015-01-15 & 13:35 & 2018-01-01 02:22 & 49.950 & grp\\_a \\\\ \nrow\\_2 & 2.222e+00 & banana & two & 2015-02-15 & 14:40 & 2018-02-02 14:33 & 17.950 & grp\\_a \\\\ \nrow\\_3 & 3.333e+01 & coconut & three & 2015-03-15 & 15:45 & 2018-03-03 03:44 & 1.390 & grp\\_a \\\\ \nrow\\_4 & 4.444e+02 & durian & four & 2015-04-15 & 16:50 & 2018-04-04 15:55 & 65100.000 & grp\\_a \\\\ \nrow\\_5 & 5.550e+03 & NA & five & 2015-05-15 & 17:55 & 2018-05-05 04:00 & 1325.810 & grp\\_b \\\\ \nrow\\_6 & NA & fig & six & 2015-06-15 & NA & 2018-06-06 16:11 & 13.255 & grp\\_b \\\\ \nrow\\_7 & 7.770e+05 & grapefruit & seven & NA & 19:10 & 2018-07-07 05:22 & NA & grp\\_b \\\\ \nrow\\_8 & 8.880e+06 & honeydew & eight & 2015-08-15 & 20:20 & NA & 0.440 & grp\\_b \\\\ \n\\midrule \n\\midrule \nmin & 0.11 & — & — & — & — & — & 0.44 & — \\\\ \nmax & 8880000.00 & — & — & — & — & — & 65100.00 & — \\\\ \navg & 1380432.87 & — & — & — & — & — & 9501.26 & — \\\\ \n\\bottomrule\n\\end{longtable}\n\\begin{minipage}{\\linewidth}\n\\vspace{.05em}\nSource note \\#1\\\\\nSource note \\#2\\\\\n\\end{minipage}\n\\endgroup\n"

---

    Code
      as_rtf(gt_tbl)
    Output
      {\rtf\ansi\ansicpg1252{\fonttbl{\f0\froman\fcharset0\fprq0 Courier New;}{\f1\froman\fcharset0\fprq0 Times;}}{\colortbl;\red51\green51\blue51;\red211\green211\blue211;}
      
      \paperw12240\paperh15840\widowctrl\ftnbj\fet0\sectd\linex0
      \lndscpsxn
      \margl1440\margr1440\margt1440\margb1440
      \headery720\footery720\fs20
      
      \trowd\trrh0\trhdr
      
      \pard\plain\uc0\qc\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx9360
      \intbl {\f0\cf1 {\f0\fs20 Data listing from {\b exibble}} {\f0\fs20\i\super } \line {\f0\fs20 {\f1 exibble} is an R dataset} {\f0\fs20\i\super }}\cell
      
      \row
      
      \trowd\trrh0\trhdr
      
      \pard\plain\uc0\qc\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx1040
      \intbl {\f0 {\f0\fs20 }}\cell
      
      \pard\plain\uc0\qc\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx2080
      \intbl {\f0 {\f0\fs20 }}\cell
      
      \pard\plain\uc0\qc\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx3120
      \intbl {\f0 {\f0\fs20 }}\cell
      
      \pard\plain\uc0\qc\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx4160
      \intbl {\f0 {\f0\fs20 }}\cell
      
      \pard\plain\uc0\qc\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85\clbrdrb\brdrs\brdrw20\brdrcf2\clmgf \cellx5200
      \intbl {\f0 {\f0\fs20 timing}}\cell
      
      \pard\plain\uc0\qc\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85\clmrg \cellx6240
      \intbl {\f0 {\f0\fs20 }}\cell
      
      \pard\plain\uc0\qc\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85\clmrg \cellx7280
      \intbl {\f0 {\f0\fs20 }}\cell
      
      \pard\plain\uc0\qc\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx8320
      \intbl {\f0 {\f0\fs20 }}\cell
      
      \pard\plain\uc0\qc\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx9360
      \intbl {\f0 {\f0\fs20 }}\cell
      
      \row
      
      \trowd\trrh0\trhdr
      
      \pard\plain\uc0\ql\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85\clbrdrb\brdrs\brdrw20\brdrcf2 \cellx1040
      \intbl {\f0 {\f0\fs20 S.L.}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85\clbrdrb\brdrs\brdrw20\brdrcf2 \cellx2080
      \intbl {\f0 {\f0\fs20 num}}\cell
      
      \pard\plain\uc0\ql\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85\clbrdrb\brdrs\brdrw20\brdrcf2 \cellx3120
      \intbl {\f0 {\f0\fs20 char}}\cell
      
      \pard\plain\uc0\qc\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85\clbrdrb\brdrs\brdrw20\brdrcf2 \cellx4160
      \intbl {\f0 {\f0\fs20 fctr}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85\clbrdrb\brdrs\brdrw20\brdrcf2 \cellx5200
      \intbl {\f0 {\f0\fs20 date}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85\clbrdrb\brdrs\brdrw20\brdrcf2 \cellx6240
      \intbl {\f0 {\f0\fs20 time}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85\clbrdrb\brdrs\brdrw20\brdrcf2 \cellx7280
      \intbl {\f0 {\f0\fs20 datetime}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85\clbrdrb\brdrs\brdrw20\brdrcf2 \cellx8320
      \intbl {\f0 {\f0\fs20 currency}}\cell
      
      \pard\plain\uc0\ql\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85\clbrdrb\brdrs\brdrw20\brdrcf2 \cellx9360
      \intbl {\f0 {\f0\fs20 group}}\cell
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\ql\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx1040
      \intbl {\f0 {\f0\fs20 row_1}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx2080
      \intbl {\f0 {\f0\fs20 1.111e-01}}\cell
      
      \pard\plain\uc0\ql\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx3120
      \intbl {\f0 {\f0\fs20 apricot}}\cell
      
      \pard\plain\uc0\qc\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx4160
      \intbl {\f0 {\f0\fs20 one}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx5200
      \intbl {\f0 {\f0\fs20 2015-01-15}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx6240
      \intbl {\f0 {\f0\fs20 13:35}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx7280
      \intbl {\f0 {\f0\fs20 2018-01-01 02:22}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx8320
      \intbl {\f0 {\f0\fs20 49.950}}\cell
      
      \pard\plain\uc0\ql\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx9360
      \intbl {\f0 {\f0\fs20 grp_a}}\cell
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\ql\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx1040
      \intbl {\f0 {\f0\fs20 row_2}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx2080
      \intbl {\f0 {\f0\fs20 2.222e+00}}\cell
      
      \pard\plain\uc0\ql\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx3120
      \intbl {\f0 {\f0\fs20 banana}}\cell
      
      \pard\plain\uc0\qc\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx4160
      \intbl {\f0 {\f0\fs20 two}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx5200
      \intbl {\f0 {\f0\fs20 2015-02-15}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx6240
      \intbl {\f0 {\f0\fs20 14:40}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx7280
      \intbl {\f0 {\f0\fs20 2018-02-02 14:33}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx8320
      \intbl {\f0 {\f0\fs20 17.950}}\cell
      
      \pard\plain\uc0\ql\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx9360
      \intbl {\f0 {\f0\fs20 grp_a}}\cell
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\ql\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx1040
      \intbl {\f0 {\f0\fs20 row_3}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx2080
      \intbl {\f0 {\f0\fs20 3.333e+01}}\cell
      
      \pard\plain\uc0\ql\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx3120
      \intbl {\f0 {\f0\fs20 coconut}}\cell
      
      \pard\plain\uc0\qc\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx4160
      \intbl {\f0 {\f0\fs20 three}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx5200
      \intbl {\f0 {\f0\fs20 2015-03-15}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx6240
      \intbl {\f0 {\f0\fs20 15:45}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx7280
      \intbl {\f0 {\f0\fs20 2018-03-03 03:44}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx8320
      \intbl {\f0 {\f0\fs20 1.390}}\cell
      
      \pard\plain\uc0\ql\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx9360
      \intbl {\f0 {\f0\fs20 grp_a}}\cell
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\ql\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx1040
      \intbl {\f0 {\f0\fs20 row_4}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx2080
      \intbl {\f0 {\f0\fs20 4.444e+02}}\cell
      
      \pard\plain\uc0\ql\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx3120
      \intbl {\f0 {\f0\fs20 durian}}\cell
      
      \pard\plain\uc0\qc\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx4160
      \intbl {\f0 {\f0\fs20 four}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx5200
      \intbl {\f0 {\f0\fs20 2015-04-15}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx6240
      \intbl {\f0 {\f0\fs20 16:50}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx7280
      \intbl {\f0 {\f0\fs20 2018-04-04 15:55}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx8320
      \intbl {\f0 {\f0\fs20 65100.000}}\cell
      
      \pard\plain\uc0\ql\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx9360
      \intbl {\f0 {\f0\fs20 grp_a}}\cell
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\ql\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx1040
      \intbl {\f0 {\f0\fs20 row_5}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx2080
      \intbl {\f0 {\f0\fs20 5.550e+03}}\cell
      
      \pard\plain\uc0\ql\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx3120
      \intbl {\f0 {\f0\fs20 NA}}\cell
      
      \pard\plain\uc0\qc\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx4160
      \intbl {\f0 {\f0\fs20 five}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx5200
      \intbl {\f0 {\f0\fs20 2015-05-15}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx6240
      \intbl {\f0 {\f0\fs20 17:55}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx7280
      \intbl {\f0 {\f0\fs20 2018-05-05 04:00}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx8320
      \intbl {\f0 {\f0\fs20 1325.810}}\cell
      
      \pard\plain\uc0\ql\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx9360
      \intbl {\f0 {\f0\fs20 grp_b}}\cell
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\ql\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx1040
      \intbl {\f0 {\f0\fs20 row_6}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx2080
      \intbl {\f0 {\f0\fs20 NA}}\cell
      
      \pard\plain\uc0\ql\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx3120
      \intbl {\f0 {\f0\fs20 fig}}\cell
      
      \pard\plain\uc0\qc\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx4160
      \intbl {\f0 {\f0\fs20 six}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx5200
      \intbl {\f0 {\f0\fs20 2015-06-15}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx6240
      \intbl {\f0 {\f0\fs20 NA}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx7280
      \intbl {\f0 {\f0\fs20 2018-06-06 16:11}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx8320
      \intbl {\f0 {\f0\fs20 13.255}}\cell
      
      \pard\plain\uc0\ql\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx9360
      \intbl {\f0 {\f0\fs20 grp_b}}\cell
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\ql\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx1040
      \intbl {\f0 {\f0\fs20 row_7}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx2080
      \intbl {\f0 {\f0\fs20 7.770e+05}}\cell
      
      \pard\plain\uc0\ql\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx3120
      \intbl {\f0 {\f0\fs20 grapefruit}}\cell
      
      \pard\plain\uc0\qc\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx4160
      \intbl {\f0 {\f0\fs20 seven}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx5200
      \intbl {\f0 {\f0\fs20 NA}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx6240
      \intbl {\f0 {\f0\fs20 19:10}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx7280
      \intbl {\f0 {\f0\fs20 2018-07-07 05:22}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx8320
      \intbl {\f0 {\f0\fs20 NA}}\cell
      
      \pard\plain\uc0\ql\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx9360
      \intbl {\f0 {\f0\fs20 grp_b}}\cell
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\ql\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx1040
      \intbl {\f0 {\f0\fs20 row_8}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx2080
      \intbl {\f0 {\f0\fs20 8.880e+06}}\cell
      
      \pard\plain\uc0\ql\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx3120
      \intbl {\f0 {\f0\fs20 honeydew}}\cell
      
      \pard\plain\uc0\qc\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx4160
      \intbl {\f0 {\f0\fs20 eight}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx5200
      \intbl {\f0 {\f0\fs20 2015-08-15}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx6240
      \intbl {\f0 {\f0\fs20 20:20}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx7280
      \intbl {\f0 {\f0\fs20 NA}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx8320
      \intbl {\f0 {\f0\fs20 0.440}}\cell
      
      \pard\plain\uc0\ql\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx9360
      \intbl {\f0 {\f0\fs20 grp_b}}\cell
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\ql\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx1040
      \intbl {\f0 {\f0\fs20 min}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx2080
      \intbl {\f0 {\f0\fs20 0.11}}\cell
      
      \pard\plain\uc0\ql\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx3120
      \intbl {\f0 {\f0\fs20 \'97}}\cell
      
      \pard\plain\uc0\qc\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx4160
      \intbl {\f0 {\f0\fs20 \'97}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx5200
      \intbl {\f0 {\f0\fs20 \'97}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx6240
      \intbl {\f0 {\f0\fs20 \'97}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx7280
      \intbl {\f0 {\f0\fs20 \'97}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx8320
      \intbl {\f0 {\f0\fs20 0.44}}\cell
      
      \pard\plain\uc0\ql\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx9360
      \intbl {\f0 {\f0\fs20 \'97}}\cell
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\ql\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx1040
      \intbl {\f0 {\f0\fs20 max}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx2080
      \intbl {\f0 {\f0\fs20 8880000.00}}\cell
      
      \pard\plain\uc0\ql\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx3120
      \intbl {\f0 {\f0\fs20 \'97}}\cell
      
      \pard\plain\uc0\qc\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx4160
      \intbl {\f0 {\f0\fs20 \'97}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx5200
      \intbl {\f0 {\f0\fs20 \'97}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx6240
      \intbl {\f0 {\f0\fs20 \'97}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx7280
      \intbl {\f0 {\f0\fs20 \'97}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx8320
      \intbl {\f0 {\f0\fs20 65100.00}}\cell
      
      \pard\plain\uc0\ql\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx9360
      \intbl {\f0 {\f0\fs20 \'97}}\cell
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\ql\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx1040
      \intbl {\f0 {\f0\fs20 avg}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx2080
      \intbl {\f0 {\f0\fs20 1380432.87}}\cell
      
      \pard\plain\uc0\ql\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx3120
      \intbl {\f0 {\f0\fs20 \'97}}\cell
      
      \pard\plain\uc0\qc\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx4160
      \intbl {\f0 {\f0\fs20 \'97}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx5200
      \intbl {\f0 {\f0\fs20 \'97}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx6240
      \intbl {\f0 {\f0\fs20 \'97}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx7280
      \intbl {\f0 {\f0\fs20 \'97}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx8320
      \intbl {\f0 {\f0\fs20 9501.26}}\cell
      
      \pard\plain\uc0\ql\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx9360
      \intbl {\f0 {\f0\fs20 \'97}}\cell
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\ql\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx9360
      \intbl {\f0 {\f0\fs20 Source note #1\line Source note #2}}\cell
      
      \row
      
      }

---

    Code
      cat(render_as_html(gt_tbl))
    Output
      <table class="gt_table" data-quarto-disable-processing="false" data-quarto-bootstrap="false">
        <thead>
          <tr class="gt_heading">
            <td colspan="8" class="gt_heading gt_title gt_font_normal" style><span class='gt_from_md'>Data listing from <strong>exibble</strong></span></td>
          </tr>
          <tr class="gt_heading">
            <td colspan="8" class="gt_heading gt_subtitle gt_font_normal gt_bottom_border" style><span class='gt_from_md'><code>exibble</code> is an R dataset</span></td>
          </tr>
          <tr class="gt_col_headings gt_spanner_row">
            <th class="gt_col_heading gt_columns_bottom_border gt_left" rowspan="2" colspan="1" scope="col" id="a::stub">S.L.</th>
            <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="2" colspan="1" scope="col" id="num">num</th>
            <th class="gt_col_heading gt_columns_bottom_border gt_left" rowspan="2" colspan="1" scope="col" id="char">char</th>
            <th class="gt_col_heading gt_columns_bottom_border gt_center" rowspan="2" colspan="1" scope="col" id="fctr">fctr</th>
            <th class="gt_center gt_columns_top_border gt_column_spanner_outer" rowspan="1" colspan="3" scope="colgroup" id="timing">
              <div class="gt_column_spanner">timing</div>
            </th>
            <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="2" colspan="1" scope="col" id="currency">currency</th>
          </tr>
          <tr class="gt_col_headings">
            <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id="date">date</th>
            <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id="time">time</th>
            <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id="datetime">datetime</th>
          </tr>
        </thead>
        <tbody class="gt_table_body">
          <tr class="gt_group_heading_row">
            <th colspan="8" class="gt_group_heading" scope="colgroup" id="grp_a">grp_a</th>
          </tr>
          <tr class="gt_row_group_first"><th id="stub_1_1" scope="row" class="gt_row gt_left gt_stub">row_1</th>
      <td headers="grp_a stub_1_1 num" class="gt_row gt_right">1.111e-01</td>
      <td headers="grp_a stub_1_1 char" class="gt_row gt_left">apricot</td>
      <td headers="grp_a stub_1_1 fctr" class="gt_row gt_center">one</td>
      <td headers="grp_a stub_1_1 date" class="gt_row gt_right">2015-01-15</td>
      <td headers="grp_a stub_1_1 time" class="gt_row gt_right">13:35</td>
      <td headers="grp_a stub_1_1 datetime" class="gt_row gt_right">2018-01-01 02:22</td>
      <td headers="grp_a stub_1_1 currency" class="gt_row gt_right">49.950</td></tr>
          <tr><th id="stub_1_2" scope="row" class="gt_row gt_left gt_stub">row_2</th>
      <td headers="grp_a stub_1_2 num" class="gt_row gt_right">2.222e+00</td>
      <td headers="grp_a stub_1_2 char" class="gt_row gt_left">banana</td>
      <td headers="grp_a stub_1_2 fctr" class="gt_row gt_center">two</td>
      <td headers="grp_a stub_1_2 date" class="gt_row gt_right">2015-02-15</td>
      <td headers="grp_a stub_1_2 time" class="gt_row gt_right">14:40</td>
      <td headers="grp_a stub_1_2 datetime" class="gt_row gt_right">2018-02-02 14:33</td>
      <td headers="grp_a stub_1_2 currency" class="gt_row gt_right">17.950</td></tr>
          <tr><th id="stub_1_3" scope="row" class="gt_row gt_left gt_stub">row_3</th>
      <td headers="grp_a stub_1_3 num" class="gt_row gt_right">3.333e+01</td>
      <td headers="grp_a stub_1_3 char" class="gt_row gt_left">coconut</td>
      <td headers="grp_a stub_1_3 fctr" class="gt_row gt_center">three</td>
      <td headers="grp_a stub_1_3 date" class="gt_row gt_right">2015-03-15</td>
      <td headers="grp_a stub_1_3 time" class="gt_row gt_right">15:45</td>
      <td headers="grp_a stub_1_3 datetime" class="gt_row gt_right">2018-03-03 03:44</td>
      <td headers="grp_a stub_1_3 currency" class="gt_row gt_right">1.390</td></tr>
          <tr><th id="stub_1_4" scope="row" class="gt_row gt_left gt_stub">row_4</th>
      <td headers="grp_a stub_1_4 num" class="gt_row gt_right">4.444e+02</td>
      <td headers="grp_a stub_1_4 char" class="gt_row gt_left">durian</td>
      <td headers="grp_a stub_1_4 fctr" class="gt_row gt_center">four</td>
      <td headers="grp_a stub_1_4 date" class="gt_row gt_right">2015-04-15</td>
      <td headers="grp_a stub_1_4 time" class="gt_row gt_right">16:50</td>
      <td headers="grp_a stub_1_4 datetime" class="gt_row gt_right">2018-04-04 15:55</td>
      <td headers="grp_a stub_1_4 currency" class="gt_row gt_right">65100.000</td></tr>
          <tr><th id="summary_stub_grp_a_1" scope="row" class="gt_row gt_left gt_stub gt_summary_row gt_first_summary_row thick">min</th>
      <td headers="grp_a summary_stub_grp_a_1 num" class="gt_row gt_right gt_summary_row gt_first_summary_row thick">0.11</td>
      <td headers="grp_a summary_stub_grp_a_1 char" class="gt_row gt_left gt_summary_row gt_first_summary_row thick">—</td>
      <td headers="grp_a summary_stub_grp_a_1 fctr" class="gt_row gt_center gt_summary_row gt_first_summary_row thick">—</td>
      <td headers="grp_a summary_stub_grp_a_1 date" class="gt_row gt_right gt_summary_row gt_first_summary_row thick">—</td>
      <td headers="grp_a summary_stub_grp_a_1 time" class="gt_row gt_right gt_summary_row gt_first_summary_row thick">—</td>
      <td headers="grp_a summary_stub_grp_a_1 datetime" class="gt_row gt_right gt_summary_row gt_first_summary_row thick">—</td>
      <td headers="grp_a summary_stub_grp_a_1 currency" class="gt_row gt_right gt_summary_row gt_first_summary_row thick">1.39</td></tr>
          <tr><th id="summary_stub_grp_a_2" scope="row" class="gt_row gt_left gt_stub gt_summary_row">max</th>
      <td headers="grp_a summary_stub_grp_a_2 num" class="gt_row gt_right gt_summary_row">444.40</td>
      <td headers="grp_a summary_stub_grp_a_2 char" class="gt_row gt_left gt_summary_row">—</td>
      <td headers="grp_a summary_stub_grp_a_2 fctr" class="gt_row gt_center gt_summary_row">—</td>
      <td headers="grp_a summary_stub_grp_a_2 date" class="gt_row gt_right gt_summary_row">—</td>
      <td headers="grp_a summary_stub_grp_a_2 time" class="gt_row gt_right gt_summary_row">—</td>
      <td headers="grp_a summary_stub_grp_a_2 datetime" class="gt_row gt_right gt_summary_row">—</td>
      <td headers="grp_a summary_stub_grp_a_2 currency" class="gt_row gt_right gt_summary_row">65100.00</td></tr>
          <tr><th id="summary_stub_grp_a_3" scope="row" class="gt_row gt_left gt_stub gt_summary_row gt_last_summary_row">avg</th>
      <td headers="grp_a summary_stub_grp_a_3 num" class="gt_row gt_right gt_summary_row gt_last_summary_row">120.02</td>
      <td headers="grp_a summary_stub_grp_a_3 char" class="gt_row gt_left gt_summary_row gt_last_summary_row">—</td>
      <td headers="grp_a summary_stub_grp_a_3 fctr" class="gt_row gt_center gt_summary_row gt_last_summary_row">—</td>
      <td headers="grp_a summary_stub_grp_a_3 date" class="gt_row gt_right gt_summary_row gt_last_summary_row">—</td>
      <td headers="grp_a summary_stub_grp_a_3 time" class="gt_row gt_right gt_summary_row gt_last_summary_row">—</td>
      <td headers="grp_a summary_stub_grp_a_3 datetime" class="gt_row gt_right gt_summary_row gt_last_summary_row">—</td>
      <td headers="grp_a summary_stub_grp_a_3 currency" class="gt_row gt_right gt_summary_row gt_last_summary_row">16292.32</td></tr>
          <tr class="gt_group_heading_row">
            <th colspan="8" class="gt_group_heading" scope="colgroup" id="grp_b">grp_b</th>
          </tr>
          <tr class="gt_row_group_first"><th id="stub_1_5" scope="row" class="gt_row gt_left gt_stub">row_5</th>
      <td headers="grp_b stub_1_5 num" class="gt_row gt_right">5.550e+03</td>
      <td headers="grp_b stub_1_5 char" class="gt_row gt_left">NA</td>
      <td headers="grp_b stub_1_5 fctr" class="gt_row gt_center">five</td>
      <td headers="grp_b stub_1_5 date" class="gt_row gt_right">2015-05-15</td>
      <td headers="grp_b stub_1_5 time" class="gt_row gt_right">17:55</td>
      <td headers="grp_b stub_1_5 datetime" class="gt_row gt_right">2018-05-05 04:00</td>
      <td headers="grp_b stub_1_5 currency" class="gt_row gt_right">1325.810</td></tr>
          <tr><th id="stub_1_6" scope="row" class="gt_row gt_left gt_stub">row_6</th>
      <td headers="grp_b stub_1_6 num" class="gt_row gt_right">NA</td>
      <td headers="grp_b stub_1_6 char" class="gt_row gt_left">fig</td>
      <td headers="grp_b stub_1_6 fctr" class="gt_row gt_center">six</td>
      <td headers="grp_b stub_1_6 date" class="gt_row gt_right">2015-06-15</td>
      <td headers="grp_b stub_1_6 time" class="gt_row gt_right">NA</td>
      <td headers="grp_b stub_1_6 datetime" class="gt_row gt_right">2018-06-06 16:11</td>
      <td headers="grp_b stub_1_6 currency" class="gt_row gt_right">13.255</td></tr>
          <tr><th id="stub_1_7" scope="row" class="gt_row gt_left gt_stub">row_7</th>
      <td headers="grp_b stub_1_7 num" class="gt_row gt_right">7.770e+05</td>
      <td headers="grp_b stub_1_7 char" class="gt_row gt_left">grapefruit</td>
      <td headers="grp_b stub_1_7 fctr" class="gt_row gt_center">seven</td>
      <td headers="grp_b stub_1_7 date" class="gt_row gt_right">NA</td>
      <td headers="grp_b stub_1_7 time" class="gt_row gt_right">19:10</td>
      <td headers="grp_b stub_1_7 datetime" class="gt_row gt_right">2018-07-07 05:22</td>
      <td headers="grp_b stub_1_7 currency" class="gt_row gt_right">NA</td></tr>
          <tr><th id="stub_1_8" scope="row" class="gt_row gt_left gt_stub">row_8</th>
      <td headers="grp_b stub_1_8 num" class="gt_row gt_right">8.880e+06</td>
      <td headers="grp_b stub_1_8 char" class="gt_row gt_left">honeydew</td>
      <td headers="grp_b stub_1_8 fctr" class="gt_row gt_center">eight</td>
      <td headers="grp_b stub_1_8 date" class="gt_row gt_right">2015-08-15</td>
      <td headers="grp_b stub_1_8 time" class="gt_row gt_right">20:20</td>
      <td headers="grp_b stub_1_8 datetime" class="gt_row gt_right">NA</td>
      <td headers="grp_b stub_1_8 currency" class="gt_row gt_right">0.440</td></tr>
          <tr><th id="summary_stub_grp_b_1" scope="row" class="gt_row gt_left gt_stub gt_summary_row gt_first_summary_row thick">min</th>
      <td headers="grp_b summary_stub_grp_b_1 num" class="gt_row gt_right gt_summary_row gt_first_summary_row thick">5550.00</td>
      <td headers="grp_b summary_stub_grp_b_1 char" class="gt_row gt_left gt_summary_row gt_first_summary_row thick">—</td>
      <td headers="grp_b summary_stub_grp_b_1 fctr" class="gt_row gt_center gt_summary_row gt_first_summary_row thick">—</td>
      <td headers="grp_b summary_stub_grp_b_1 date" class="gt_row gt_right gt_summary_row gt_first_summary_row thick">—</td>
      <td headers="grp_b summary_stub_grp_b_1 time" class="gt_row gt_right gt_summary_row gt_first_summary_row thick">—</td>
      <td headers="grp_b summary_stub_grp_b_1 datetime" class="gt_row gt_right gt_summary_row gt_first_summary_row thick">—</td>
      <td headers="grp_b summary_stub_grp_b_1 currency" class="gt_row gt_right gt_summary_row gt_first_summary_row thick">0.44</td></tr>
          <tr><th id="summary_stub_grp_b_2" scope="row" class="gt_row gt_left gt_stub gt_summary_row">max</th>
      <td headers="grp_b summary_stub_grp_b_2 num" class="gt_row gt_right gt_summary_row">8880000.00</td>
      <td headers="grp_b summary_stub_grp_b_2 char" class="gt_row gt_left gt_summary_row">—</td>
      <td headers="grp_b summary_stub_grp_b_2 fctr" class="gt_row gt_center gt_summary_row">—</td>
      <td headers="grp_b summary_stub_grp_b_2 date" class="gt_row gt_right gt_summary_row">—</td>
      <td headers="grp_b summary_stub_grp_b_2 time" class="gt_row gt_right gt_summary_row">—</td>
      <td headers="grp_b summary_stub_grp_b_2 datetime" class="gt_row gt_right gt_summary_row">—</td>
      <td headers="grp_b summary_stub_grp_b_2 currency" class="gt_row gt_right gt_summary_row">1325.81</td></tr>
          <tr><th id="summary_stub_grp_b_3" scope="row" class="gt_row gt_left gt_stub gt_summary_row gt_last_summary_row">avg</th>
      <td headers="grp_b summary_stub_grp_b_3 num" class="gt_row gt_right gt_summary_row gt_last_summary_row">3220850.00</td>
      <td headers="grp_b summary_stub_grp_b_3 char" class="gt_row gt_left gt_summary_row gt_last_summary_row">—</td>
      <td headers="grp_b summary_stub_grp_b_3 fctr" class="gt_row gt_center gt_summary_row gt_last_summary_row">—</td>
      <td headers="grp_b summary_stub_grp_b_3 date" class="gt_row gt_right gt_summary_row gt_last_summary_row">—</td>
      <td headers="grp_b summary_stub_grp_b_3 time" class="gt_row gt_right gt_summary_row gt_last_summary_row">—</td>
      <td headers="grp_b summary_stub_grp_b_3 datetime" class="gt_row gt_right gt_summary_row gt_last_summary_row">—</td>
      <td headers="grp_b summary_stub_grp_b_3 currency" class="gt_row gt_right gt_summary_row gt_last_summary_row">446.50</td></tr>
          <tr><th id="grand_summary_stub_1" scope="row" class="gt_row gt_left gt_stub gt_grand_summary_row gt_first_grand_summary_row">min</th>
      <td headers="grand_summary_stub_1 num" class="gt_row gt_right gt_grand_summary_row gt_first_grand_summary_row">0.11</td>
      <td headers="grand_summary_stub_1 char" class="gt_row gt_left gt_grand_summary_row gt_first_grand_summary_row">—</td>
      <td headers="grand_summary_stub_1 fctr" class="gt_row gt_center gt_grand_summary_row gt_first_grand_summary_row">—</td>
      <td headers="grand_summary_stub_1 date" class="gt_row gt_right gt_grand_summary_row gt_first_grand_summary_row">—</td>
      <td headers="grand_summary_stub_1 time" class="gt_row gt_right gt_grand_summary_row gt_first_grand_summary_row">—</td>
      <td headers="grand_summary_stub_1 datetime" class="gt_row gt_right gt_grand_summary_row gt_first_grand_summary_row">—</td>
      <td headers="grand_summary_stub_1 currency" class="gt_row gt_right gt_grand_summary_row gt_first_grand_summary_row">0.44</td></tr>
          <tr><th id="grand_summary_stub_2" scope="row" class="gt_row gt_left gt_stub gt_grand_summary_row">max</th>
      <td headers="grand_summary_stub_2 num" class="gt_row gt_right gt_grand_summary_row">8880000.00</td>
      <td headers="grand_summary_stub_2 char" class="gt_row gt_left gt_grand_summary_row">—</td>
      <td headers="grand_summary_stub_2 fctr" class="gt_row gt_center gt_grand_summary_row">—</td>
      <td headers="grand_summary_stub_2 date" class="gt_row gt_right gt_grand_summary_row">—</td>
      <td headers="grand_summary_stub_2 time" class="gt_row gt_right gt_grand_summary_row">—</td>
      <td headers="grand_summary_stub_2 datetime" class="gt_row gt_right gt_grand_summary_row">—</td>
      <td headers="grand_summary_stub_2 currency" class="gt_row gt_right gt_grand_summary_row">65100.00</td></tr>
          <tr><th id="grand_summary_stub_3" scope="row" class="gt_row gt_left gt_stub gt_grand_summary_row gt_last_summary_row">avg</th>
      <td headers="grand_summary_stub_3 num" class="gt_row gt_right gt_grand_summary_row gt_last_summary_row">1380432.87</td>
      <td headers="grand_summary_stub_3 char" class="gt_row gt_left gt_grand_summary_row gt_last_summary_row">—</td>
      <td headers="grand_summary_stub_3 fctr" class="gt_row gt_center gt_grand_summary_row gt_last_summary_row">—</td>
      <td headers="grand_summary_stub_3 date" class="gt_row gt_right gt_grand_summary_row gt_last_summary_row">—</td>
      <td headers="grand_summary_stub_3 time" class="gt_row gt_right gt_grand_summary_row gt_last_summary_row">—</td>
      <td headers="grand_summary_stub_3 datetime" class="gt_row gt_right gt_grand_summary_row gt_last_summary_row">—</td>
      <td headers="grand_summary_stub_3 currency" class="gt_row gt_right gt_grand_summary_row gt_last_summary_row">9501.26</td></tr>
        </tbody>
        <tfoot>
          <tr class="gt_sourcenotes">
            <td class="gt_sourcenote" colspan="8">Source note #1</td>
          </tr>
          <tr class="gt_sourcenotes">
            <td class="gt_sourcenote" colspan="8">Source note #2</td>
          </tr>
        </tfoot>
      </table>

---

    Code
      as.character(as_latex(gt_tbl))
    Output
      [1] "\\begingroup\n\\fontsize{12.0pt}{14.0pt}\\selectfont\n\\setlength{\\LTpost}{0mm}\n\\begin{longtable}{l|rlcrrrr}\n\\caption*{\n{\\fontsize{20}{25}\\selectfont  Data listing from \\textbf{exibble}\\fontsize{12}{15}\\selectfont } \\\\ \n{\\fontsize{14}{17}\\selectfont  \\texttt{exibble} is an R dataset\\fontsize{12}{15}\\selectfont }\n} \\\\ \n\\toprule\n &  &  &  & \\multicolumn{3}{c}{timing} &  \\\\ \n\\cmidrule(lr){5-7}\nS.L. & num & char & fctr & date & time & datetime & currency \\\\ \n\\midrule\\addlinespace[2.5pt]\n\\multicolumn{8}{l}{grp\\_a} \\\\[2.5pt] \n\\midrule\\addlinespace[2.5pt]\nrow\\_1 & 1.111e-01 & apricot & one & 2015-01-15 & 13:35 & 2018-01-01 02:22 & 49.950 \\\\ \nrow\\_2 & 2.222e+00 & banana & two & 2015-02-15 & 14:40 & 2018-02-02 14:33 & 17.950 \\\\ \nrow\\_3 & 3.333e+01 & coconut & three & 2015-03-15 & 15:45 & 2018-03-03 03:44 & 1.390 \\\\ \nrow\\_4 & 4.444e+02 & durian & four & 2015-04-15 & 16:50 & 2018-04-04 15:55 & 65100.000 \\\\ \n\\midrule \nmin & 0.11 & — & — & — & — & — & 1.39 \\\\ \nmax & 444.40 & — & — & — & — & — & 65100.00 \\\\ \navg & 120.02 & — & — & — & — & — & 16292.32 \\\\ \n\\midrule\\addlinespace[2.5pt]\n\\multicolumn{8}{l}{grp\\_b} \\\\[2.5pt] \n\\midrule\\addlinespace[2.5pt]\nrow\\_5 & 5.550e+03 & NA & five & 2015-05-15 & 17:55 & 2018-05-05 04:00 & 1325.810 \\\\ \nrow\\_6 & NA & fig & six & 2015-06-15 & NA & 2018-06-06 16:11 & 13.255 \\\\ \nrow\\_7 & 7.770e+05 & grapefruit & seven & NA & 19:10 & 2018-07-07 05:22 & NA \\\\ \nrow\\_8 & 8.880e+06 & honeydew & eight & 2015-08-15 & 20:20 & NA & 0.440 \\\\ \n\\midrule \nmin & 5550.00 & — & — & — & — & — & 0.44 \\\\ \nmax & 8880000.00 & — & — & — & — & — & 1325.81 \\\\ \navg & 3220850.00 & — & — & — & — & — & 446.50 \\\\ \n\\midrule \n\\midrule \nmin & 0.11 & — & — & — & — & — & 0.44 \\\\ \nmax & 8880000.00 & — & — & — & — & — & 65100.00 \\\\ \navg & 1380432.87 & — & — & — & — & — & 9501.26 \\\\ \n\\bottomrule\n\\end{longtable}\n\\begin{minipage}{\\linewidth}\n\\vspace{.05em}\nSource note \\#1\\\\\nSource note \\#2\\\\\n\\end{minipage}\n\\endgroup\n"

---

    Code
      as_rtf(gt_tbl)
    Output
      {\rtf\ansi\ansicpg1252{\fonttbl{\f0\froman\fcharset0\fprq0 Courier New;}{\f1\froman\fcharset0\fprq0 Times;}}{\colortbl;\red51\green51\blue51;\red211\green211\blue211;}
      
      \paperw12240\paperh15840\widowctrl\ftnbj\fet0\sectd\linex0
      \lndscpsxn
      \margl1440\margr1440\margt1440\margb1440
      \headery720\footery720\fs20
      
      \trowd\trrh0\trhdr
      
      \pard\plain\uc0\qc\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx9360
      \intbl {\f0\cf1 {\f0\fs20 Data listing from {\b exibble}} {\f0\fs20\i\super } \line {\f0\fs20 {\f1 exibble} is an R dataset} {\f0\fs20\i\super }}\cell
      
      \row
      
      \trowd\trrh0\trhdr
      
      \pard\plain\uc0\qc\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx1170
      \intbl {\f0 {\f0\fs20 }}\cell
      
      \pard\plain\uc0\qc\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx2340
      \intbl {\f0 {\f0\fs20 }}\cell
      
      \pard\plain\uc0\qc\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx3510
      \intbl {\f0 {\f0\fs20 }}\cell
      
      \pard\plain\uc0\qc\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx4680
      \intbl {\f0 {\f0\fs20 }}\cell
      
      \pard\plain\uc0\qc\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85\clbrdrb\brdrs\brdrw20\brdrcf2\clmgf \cellx5850
      \intbl {\f0 {\f0\fs20 timing}}\cell
      
      \pard\plain\uc0\qc\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85\clmrg \cellx7020
      \intbl {\f0 {\f0\fs20 }}\cell
      
      \pard\plain\uc0\qc\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85\clmrg \cellx8190
      \intbl {\f0 {\f0\fs20 }}\cell
      
      \pard\plain\uc0\qc\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx9360
      \intbl {\f0 {\f0\fs20 }}\cell
      
      \row
      
      \trowd\trrh0\trhdr
      
      \pard\plain\uc0\ql\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85\clbrdrb\brdrs\brdrw20\brdrcf2 \cellx1170
      \intbl {\f0 {\f0\fs20 S.L.}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85\clbrdrb\brdrs\brdrw20\brdrcf2 \cellx2340
      \intbl {\f0 {\f0\fs20 num}}\cell
      
      \pard\plain\uc0\ql\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85\clbrdrb\brdrs\brdrw20\brdrcf2 \cellx3510
      \intbl {\f0 {\f0\fs20 char}}\cell
      
      \pard\plain\uc0\qc\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85\clbrdrb\brdrs\brdrw20\brdrcf2 \cellx4680
      \intbl {\f0 {\f0\fs20 fctr}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85\clbrdrb\brdrs\brdrw20\brdrcf2 \cellx5850
      \intbl {\f0 {\f0\fs20 date}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85\clbrdrb\brdrs\brdrw20\brdrcf2 \cellx7020
      \intbl {\f0 {\f0\fs20 time}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85\clbrdrb\brdrs\brdrw20\brdrcf2 \cellx8190
      \intbl {\f0 {\f0\fs20 datetime}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85\clbrdrb\brdrs\brdrw20\brdrcf2 \cellx9360
      \intbl {\f0 {\f0\fs20 currency}}\cell
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\ql\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx9360
      \intbl {\f0\fs20 grp_a}\cell
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\ql\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx1170
      \intbl {\f0 {\f0\fs20 row_1}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx2340
      \intbl {\f0 {\f0\fs20 1.111e-01}}\cell
      
      \pard\plain\uc0\ql\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx3510
      \intbl {\f0 {\f0\fs20 apricot}}\cell
      
      \pard\plain\uc0\qc\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx4680
      \intbl {\f0 {\f0\fs20 one}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx5850
      \intbl {\f0 {\f0\fs20 2015-01-15}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx7020
      \intbl {\f0 {\f0\fs20 13:35}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx8190
      \intbl {\f0 {\f0\fs20 2018-01-01 02:22}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx9360
      \intbl {\f0 {\f0\fs20 49.950}}\cell
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\ql\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx1170
      \intbl {\f0 {\f0\fs20 row_2}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx2340
      \intbl {\f0 {\f0\fs20 2.222e+00}}\cell
      
      \pard\plain\uc0\ql\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx3510
      \intbl {\f0 {\f0\fs20 banana}}\cell
      
      \pard\plain\uc0\qc\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx4680
      \intbl {\f0 {\f0\fs20 two}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx5850
      \intbl {\f0 {\f0\fs20 2015-02-15}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx7020
      \intbl {\f0 {\f0\fs20 14:40}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx8190
      \intbl {\f0 {\f0\fs20 2018-02-02 14:33}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx9360
      \intbl {\f0 {\f0\fs20 17.950}}\cell
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\ql\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx1170
      \intbl {\f0 {\f0\fs20 row_3}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx2340
      \intbl {\f0 {\f0\fs20 3.333e+01}}\cell
      
      \pard\plain\uc0\ql\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx3510
      \intbl {\f0 {\f0\fs20 coconut}}\cell
      
      \pard\plain\uc0\qc\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx4680
      \intbl {\f0 {\f0\fs20 three}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx5850
      \intbl {\f0 {\f0\fs20 2015-03-15}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx7020
      \intbl {\f0 {\f0\fs20 15:45}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx8190
      \intbl {\f0 {\f0\fs20 2018-03-03 03:44}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx9360
      \intbl {\f0 {\f0\fs20 1.390}}\cell
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\ql\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx1170
      \intbl {\f0 {\f0\fs20 row_4}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx2340
      \intbl {\f0 {\f0\fs20 4.444e+02}}\cell
      
      \pard\plain\uc0\ql\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx3510
      \intbl {\f0 {\f0\fs20 durian}}\cell
      
      \pard\plain\uc0\qc\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx4680
      \intbl {\f0 {\f0\fs20 four}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx5850
      \intbl {\f0 {\f0\fs20 2015-04-15}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx7020
      \intbl {\f0 {\f0\fs20 16:50}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx8190
      \intbl {\f0 {\f0\fs20 2018-04-04 15:55}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx9360
      \intbl {\f0 {\f0\fs20 65100.000}}\cell
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\ql\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx1170
      \intbl {\f0 {\f0\fs20 min}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx2340
      \intbl {\f0 {\f0\fs20 0.11}}\cell
      
      \pard\plain\uc0\ql\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx3510
      \intbl {\f0 {\f0\fs20 \'97}}\cell
      
      \pard\plain\uc0\qc\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx4680
      \intbl {\f0 {\f0\fs20 \'97}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx5850
      \intbl {\f0 {\f0\fs20 \'97}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx7020
      \intbl {\f0 {\f0\fs20 \'97}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx8190
      \intbl {\f0 {\f0\fs20 \'97}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx9360
      \intbl {\f0 {\f0\fs20 1.39}}\cell
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\ql\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx1170
      \intbl {\f0 {\f0\fs20 max}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx2340
      \intbl {\f0 {\f0\fs20 444.40}}\cell
      
      \pard\plain\uc0\ql\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx3510
      \intbl {\f0 {\f0\fs20 \'97}}\cell
      
      \pard\plain\uc0\qc\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx4680
      \intbl {\f0 {\f0\fs20 \'97}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx5850
      \intbl {\f0 {\f0\fs20 \'97}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx7020
      \intbl {\f0 {\f0\fs20 \'97}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx8190
      \intbl {\f0 {\f0\fs20 \'97}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx9360
      \intbl {\f0 {\f0\fs20 65100.00}}\cell
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\ql\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx1170
      \intbl {\f0 {\f0\fs20 avg}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx2340
      \intbl {\f0 {\f0\fs20 120.02}}\cell
      
      \pard\plain\uc0\ql\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx3510
      \intbl {\f0 {\f0\fs20 \'97}}\cell
      
      \pard\plain\uc0\qc\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx4680
      \intbl {\f0 {\f0\fs20 \'97}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx5850
      \intbl {\f0 {\f0\fs20 \'97}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx7020
      \intbl {\f0 {\f0\fs20 \'97}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx8190
      \intbl {\f0 {\f0\fs20 \'97}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx9360
      \intbl {\f0 {\f0\fs20 16292.32}}\cell
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\ql\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx9360
      \intbl {\f0\fs20 grp_b}\cell
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\ql\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx1170
      \intbl {\f0 {\f0\fs20 row_5}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx2340
      \intbl {\f0 {\f0\fs20 5.550e+03}}\cell
      
      \pard\plain\uc0\ql\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx3510
      \intbl {\f0 {\f0\fs20 NA}}\cell
      
      \pard\plain\uc0\qc\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx4680
      \intbl {\f0 {\f0\fs20 five}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx5850
      \intbl {\f0 {\f0\fs20 2015-05-15}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx7020
      \intbl {\f0 {\f0\fs20 17:55}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx8190
      \intbl {\f0 {\f0\fs20 2018-05-05 04:00}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx9360
      \intbl {\f0 {\f0\fs20 1325.810}}\cell
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\ql\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx1170
      \intbl {\f0 {\f0\fs20 row_6}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx2340
      \intbl {\f0 {\f0\fs20 NA}}\cell
      
      \pard\plain\uc0\ql\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx3510
      \intbl {\f0 {\f0\fs20 fig}}\cell
      
      \pard\plain\uc0\qc\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx4680
      \intbl {\f0 {\f0\fs20 six}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx5850
      \intbl {\f0 {\f0\fs20 2015-06-15}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx7020
      \intbl {\f0 {\f0\fs20 NA}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx8190
      \intbl {\f0 {\f0\fs20 2018-06-06 16:11}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx9360
      \intbl {\f0 {\f0\fs20 13.255}}\cell
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\ql\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx1170
      \intbl {\f0 {\f0\fs20 row_7}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx2340
      \intbl {\f0 {\f0\fs20 7.770e+05}}\cell
      
      \pard\plain\uc0\ql\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx3510
      \intbl {\f0 {\f0\fs20 grapefruit}}\cell
      
      \pard\plain\uc0\qc\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx4680
      \intbl {\f0 {\f0\fs20 seven}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx5850
      \intbl {\f0 {\f0\fs20 NA}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx7020
      \intbl {\f0 {\f0\fs20 19:10}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx8190
      \intbl {\f0 {\f0\fs20 2018-07-07 05:22}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx9360
      \intbl {\f0 {\f0\fs20 NA}}\cell
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\ql\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx1170
      \intbl {\f0 {\f0\fs20 row_8}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx2340
      \intbl {\f0 {\f0\fs20 8.880e+06}}\cell
      
      \pard\plain\uc0\ql\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx3510
      \intbl {\f0 {\f0\fs20 honeydew}}\cell
      
      \pard\plain\uc0\qc\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx4680
      \intbl {\f0 {\f0\fs20 eight}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx5850
      \intbl {\f0 {\f0\fs20 2015-08-15}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx7020
      \intbl {\f0 {\f0\fs20 20:20}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx8190
      \intbl {\f0 {\f0\fs20 NA}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx9360
      \intbl {\f0 {\f0\fs20 0.440}}\cell
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\ql\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx1170
      \intbl {\f0 {\f0\fs20 min}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx2340
      \intbl {\f0 {\f0\fs20 5550.00}}\cell
      
      \pard\plain\uc0\ql\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx3510
      \intbl {\f0 {\f0\fs20 \'97}}\cell
      
      \pard\plain\uc0\qc\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx4680
      \intbl {\f0 {\f0\fs20 \'97}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx5850
      \intbl {\f0 {\f0\fs20 \'97}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx7020
      \intbl {\f0 {\f0\fs20 \'97}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx8190
      \intbl {\f0 {\f0\fs20 \'97}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx9360
      \intbl {\f0 {\f0\fs20 0.44}}\cell
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\ql\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx1170
      \intbl {\f0 {\f0\fs20 max}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx2340
      \intbl {\f0 {\f0\fs20 8880000.00}}\cell
      
      \pard\plain\uc0\ql\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx3510
      \intbl {\f0 {\f0\fs20 \'97}}\cell
      
      \pard\plain\uc0\qc\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx4680
      \intbl {\f0 {\f0\fs20 \'97}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx5850
      \intbl {\f0 {\f0\fs20 \'97}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx7020
      \intbl {\f0 {\f0\fs20 \'97}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx8190
      \intbl {\f0 {\f0\fs20 \'97}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx9360
      \intbl {\f0 {\f0\fs20 1325.81}}\cell
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\ql\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx1170
      \intbl {\f0 {\f0\fs20 avg}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx2340
      \intbl {\f0 {\f0\fs20 3220850.00}}\cell
      
      \pard\plain\uc0\ql\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx3510
      \intbl {\f0 {\f0\fs20 \'97}}\cell
      
      \pard\plain\uc0\qc\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx4680
      \intbl {\f0 {\f0\fs20 \'97}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx5850
      \intbl {\f0 {\f0\fs20 \'97}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx7020
      \intbl {\f0 {\f0\fs20 \'97}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx8190
      \intbl {\f0 {\f0\fs20 \'97}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx9360
      \intbl {\f0 {\f0\fs20 446.50}}\cell
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\ql\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx1170
      \intbl {\f0 {\f0\fs20 min}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx2340
      \intbl {\f0 {\f0\fs20 0.11}}\cell
      
      \pard\plain\uc0\ql\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx3510
      \intbl {\f0 {\f0\fs20 \'97}}\cell
      
      \pard\plain\uc0\qc\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx4680
      \intbl {\f0 {\f0\fs20 \'97}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx5850
      \intbl {\f0 {\f0\fs20 \'97}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx7020
      \intbl {\f0 {\f0\fs20 \'97}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx8190
      \intbl {\f0 {\f0\fs20 \'97}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx9360
      \intbl {\f0 {\f0\fs20 0.44}}\cell
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\ql\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx1170
      \intbl {\f0 {\f0\fs20 max}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx2340
      \intbl {\f0 {\f0\fs20 8880000.00}}\cell
      
      \pard\plain\uc0\ql\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx3510
      \intbl {\f0 {\f0\fs20 \'97}}\cell
      
      \pard\plain\uc0\qc\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx4680
      \intbl {\f0 {\f0\fs20 \'97}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx5850
      \intbl {\f0 {\f0\fs20 \'97}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx7020
      \intbl {\f0 {\f0\fs20 \'97}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx8190
      \intbl {\f0 {\f0\fs20 \'97}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx9360
      \intbl {\f0 {\f0\fs20 65100.00}}\cell
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\ql\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx1170
      \intbl {\f0 {\f0\fs20 avg}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx2340
      \intbl {\f0 {\f0\fs20 1380432.87}}\cell
      
      \pard\plain\uc0\ql\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx3510
      \intbl {\f0 {\f0\fs20 \'97}}\cell
      
      \pard\plain\uc0\qc\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx4680
      \intbl {\f0 {\f0\fs20 \'97}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx5850
      \intbl {\f0 {\f0\fs20 \'97}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx7020
      \intbl {\f0 {\f0\fs20 \'97}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx8190
      \intbl {\f0 {\f0\fs20 \'97}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx9360
      \intbl {\f0 {\f0\fs20 9501.26}}\cell
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\ql\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx9360
      \intbl {\f0 {\f0\fs20 Source note #1\line Source note #2}}\cell
      
      \row
      
      }

---

    Code
      cat(render_as_html(gt_tbl))
    Output
      <table class="gt_table" data-quarto-disable-processing="false" data-quarto-bootstrap="false">
        <thead>
          <tr class="gt_heading">
            <td colspan="9" class="gt_heading gt_title gt_font_normal" style><span class='gt_from_md'>Data listing from <strong>exibble</strong></span></td>
          </tr>
          <tr class="gt_heading">
            <td colspan="9" class="gt_heading gt_subtitle gt_font_normal gt_bottom_border" style><span class='gt_from_md'><code>exibble</code> is an R dataset</span></td>
          </tr>
          <tr class="gt_col_headings gt_spanner_row">
            <th class="gt_col_heading gt_columns_bottom_border gt_left" rowspan="2" colspan="2" scope="colgroup" id="a::stub">S.L.</th>
            <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="2" colspan="1" scope="col" id="num">num</th>
            <th class="gt_col_heading gt_columns_bottom_border gt_left" rowspan="2" colspan="1" scope="col" id="char">char</th>
            <th class="gt_col_heading gt_columns_bottom_border gt_center" rowspan="2" colspan="1" scope="col" id="fctr">fctr</th>
            <th class="gt_center gt_columns_top_border gt_column_spanner_outer" rowspan="1" colspan="3" scope="colgroup" id="timing">
              <div class="gt_column_spanner">timing</div>
            </th>
            <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="2" colspan="1" scope="col" id="currency">currency</th>
          </tr>
          <tr class="gt_col_headings">
            <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id="date">date</th>
            <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id="time">time</th>
            <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id="datetime">datetime</th>
          </tr>
        </thead>
        <tbody class="gt_table_body">
          <tr class="gt_row_group_first"><td headers="grp_a stub_2_1 stub_1" rowspan="7" class="gt_row gt_left gt_stub_row_group">grp_a</td>
      <th id="stub_2_1" scope="row" class="gt_row gt_left gt_stub">row_1</th>
      <td headers="grp_a stub_2_1 num" class="gt_row gt_right">1.111e-01</td>
      <td headers="grp_a stub_2_1 char" class="gt_row gt_left">apricot</td>
      <td headers="grp_a stub_2_1 fctr" class="gt_row gt_center">one</td>
      <td headers="grp_a stub_2_1 date" class="gt_row gt_right">2015-01-15</td>
      <td headers="grp_a stub_2_1 time" class="gt_row gt_right">13:35</td>
      <td headers="grp_a stub_2_1 datetime" class="gt_row gt_right">2018-01-01 02:22</td>
      <td headers="grp_a stub_2_1 currency" class="gt_row gt_right">49.950</td></tr>
          <tr><th id="stub_2_2" scope="row" class="gt_row gt_left gt_stub">row_2</th>
      <td headers="grp_a stub_2_2 num" class="gt_row gt_right">2.222e+00</td>
      <td headers="grp_a stub_2_2 char" class="gt_row gt_left">banana</td>
      <td headers="grp_a stub_2_2 fctr" class="gt_row gt_center">two</td>
      <td headers="grp_a stub_2_2 date" class="gt_row gt_right">2015-02-15</td>
      <td headers="grp_a stub_2_2 time" class="gt_row gt_right">14:40</td>
      <td headers="grp_a stub_2_2 datetime" class="gt_row gt_right">2018-02-02 14:33</td>
      <td headers="grp_a stub_2_2 currency" class="gt_row gt_right">17.950</td></tr>
          <tr><th id="stub_2_3" scope="row" class="gt_row gt_left gt_stub">row_3</th>
      <td headers="grp_a stub_2_3 num" class="gt_row gt_right">3.333e+01</td>
      <td headers="grp_a stub_2_3 char" class="gt_row gt_left">coconut</td>
      <td headers="grp_a stub_2_3 fctr" class="gt_row gt_center">three</td>
      <td headers="grp_a stub_2_3 date" class="gt_row gt_right">2015-03-15</td>
      <td headers="grp_a stub_2_3 time" class="gt_row gt_right">15:45</td>
      <td headers="grp_a stub_2_3 datetime" class="gt_row gt_right">2018-03-03 03:44</td>
      <td headers="grp_a stub_2_3 currency" class="gt_row gt_right">1.390</td></tr>
          <tr><th id="stub_2_4" scope="row" class="gt_row gt_left gt_stub">row_4</th>
      <td headers="grp_a stub_2_4 num" class="gt_row gt_right">4.444e+02</td>
      <td headers="grp_a stub_2_4 char" class="gt_row gt_left">durian</td>
      <td headers="grp_a stub_2_4 fctr" class="gt_row gt_center">four</td>
      <td headers="grp_a stub_2_4 date" class="gt_row gt_right">2015-04-15</td>
      <td headers="grp_a stub_2_4 time" class="gt_row gt_right">16:50</td>
      <td headers="grp_a stub_2_4 datetime" class="gt_row gt_right">2018-04-04 15:55</td>
      <td headers="grp_a stub_2_4 currency" class="gt_row gt_right">65100.000</td></tr>
          <tr><th id="summary_stub_grp_a_1" scope="row" class="gt_row gt_left gt_stub gt_summary_row gt_first_summary_row thick">min</th>
      <td headers="grp_a summary_stub_grp_a_1 num" class="gt_row gt_right gt_summary_row gt_first_summary_row thick">0.11</td>
      <td headers="grp_a summary_stub_grp_a_1 char" class="gt_row gt_left gt_summary_row gt_first_summary_row thick">—</td>
      <td headers="grp_a summary_stub_grp_a_1 fctr" class="gt_row gt_center gt_summary_row gt_first_summary_row thick">—</td>
      <td headers="grp_a summary_stub_grp_a_1 date" class="gt_row gt_right gt_summary_row gt_first_summary_row thick">—</td>
      <td headers="grp_a summary_stub_grp_a_1 time" class="gt_row gt_right gt_summary_row gt_first_summary_row thick">—</td>
      <td headers="grp_a summary_stub_grp_a_1 datetime" class="gt_row gt_right gt_summary_row gt_first_summary_row thick">—</td>
      <td headers="grp_a summary_stub_grp_a_1 currency" class="gt_row gt_right gt_summary_row gt_first_summary_row thick">1.39</td></tr>
          <tr><th id="summary_stub_grp_a_2" scope="row" class="gt_row gt_left gt_stub gt_summary_row">max</th>
      <td headers="grp_a summary_stub_grp_a_2 num" class="gt_row gt_right gt_summary_row">444.40</td>
      <td headers="grp_a summary_stub_grp_a_2 char" class="gt_row gt_left gt_summary_row">—</td>
      <td headers="grp_a summary_stub_grp_a_2 fctr" class="gt_row gt_center gt_summary_row">—</td>
      <td headers="grp_a summary_stub_grp_a_2 date" class="gt_row gt_right gt_summary_row">—</td>
      <td headers="grp_a summary_stub_grp_a_2 time" class="gt_row gt_right gt_summary_row">—</td>
      <td headers="grp_a summary_stub_grp_a_2 datetime" class="gt_row gt_right gt_summary_row">—</td>
      <td headers="grp_a summary_stub_grp_a_2 currency" class="gt_row gt_right gt_summary_row">65100.00</td></tr>
          <tr><th id="summary_stub_grp_a_3" scope="row" class="gt_row gt_left gt_stub gt_summary_row gt_last_summary_row">avg</th>
      <td headers="grp_a summary_stub_grp_a_3 num" class="gt_row gt_right gt_summary_row gt_last_summary_row">120.02</td>
      <td headers="grp_a summary_stub_grp_a_3 char" class="gt_row gt_left gt_summary_row gt_last_summary_row">—</td>
      <td headers="grp_a summary_stub_grp_a_3 fctr" class="gt_row gt_center gt_summary_row gt_last_summary_row">—</td>
      <td headers="grp_a summary_stub_grp_a_3 date" class="gt_row gt_right gt_summary_row gt_last_summary_row">—</td>
      <td headers="grp_a summary_stub_grp_a_3 time" class="gt_row gt_right gt_summary_row gt_last_summary_row">—</td>
      <td headers="grp_a summary_stub_grp_a_3 datetime" class="gt_row gt_right gt_summary_row gt_last_summary_row">—</td>
      <td headers="grp_a summary_stub_grp_a_3 currency" class="gt_row gt_right gt_summary_row gt_last_summary_row">16292.32</td></tr>
          <tr class="gt_row_group_first"><td headers="grp_b stub_2_5 stub_1" rowspan="7" class="gt_row gt_left gt_stub_row_group">grp_b</td>
      <th id="stub_2_5" scope="row" class="gt_row gt_left gt_stub">row_5</th>
      <td headers="grp_b stub_2_5 num" class="gt_row gt_right">5.550e+03</td>
      <td headers="grp_b stub_2_5 char" class="gt_row gt_left">NA</td>
      <td headers="grp_b stub_2_5 fctr" class="gt_row gt_center">five</td>
      <td headers="grp_b stub_2_5 date" class="gt_row gt_right">2015-05-15</td>
      <td headers="grp_b stub_2_5 time" class="gt_row gt_right">17:55</td>
      <td headers="grp_b stub_2_5 datetime" class="gt_row gt_right">2018-05-05 04:00</td>
      <td headers="grp_b stub_2_5 currency" class="gt_row gt_right">1325.810</td></tr>
          <tr><th id="stub_2_6" scope="row" class="gt_row gt_left gt_stub">row_6</th>
      <td headers="grp_b stub_2_6 num" class="gt_row gt_right">NA</td>
      <td headers="grp_b stub_2_6 char" class="gt_row gt_left">fig</td>
      <td headers="grp_b stub_2_6 fctr" class="gt_row gt_center">six</td>
      <td headers="grp_b stub_2_6 date" class="gt_row gt_right">2015-06-15</td>
      <td headers="grp_b stub_2_6 time" class="gt_row gt_right">NA</td>
      <td headers="grp_b stub_2_6 datetime" class="gt_row gt_right">2018-06-06 16:11</td>
      <td headers="grp_b stub_2_6 currency" class="gt_row gt_right">13.255</td></tr>
          <tr><th id="stub_2_7" scope="row" class="gt_row gt_left gt_stub">row_7</th>
      <td headers="grp_b stub_2_7 num" class="gt_row gt_right">7.770e+05</td>
      <td headers="grp_b stub_2_7 char" class="gt_row gt_left">grapefruit</td>
      <td headers="grp_b stub_2_7 fctr" class="gt_row gt_center">seven</td>
      <td headers="grp_b stub_2_7 date" class="gt_row gt_right">NA</td>
      <td headers="grp_b stub_2_7 time" class="gt_row gt_right">19:10</td>
      <td headers="grp_b stub_2_7 datetime" class="gt_row gt_right">2018-07-07 05:22</td>
      <td headers="grp_b stub_2_7 currency" class="gt_row gt_right">NA</td></tr>
          <tr><th id="stub_2_8" scope="row" class="gt_row gt_left gt_stub">row_8</th>
      <td headers="grp_b stub_2_8 num" class="gt_row gt_right">8.880e+06</td>
      <td headers="grp_b stub_2_8 char" class="gt_row gt_left">honeydew</td>
      <td headers="grp_b stub_2_8 fctr" class="gt_row gt_center">eight</td>
      <td headers="grp_b stub_2_8 date" class="gt_row gt_right">2015-08-15</td>
      <td headers="grp_b stub_2_8 time" class="gt_row gt_right">20:20</td>
      <td headers="grp_b stub_2_8 datetime" class="gt_row gt_right">NA</td>
      <td headers="grp_b stub_2_8 currency" class="gt_row gt_right">0.440</td></tr>
          <tr><th id="summary_stub_grp_b_1" scope="row" class="gt_row gt_left gt_stub gt_summary_row gt_first_summary_row thick">min</th>
      <td headers="grp_b summary_stub_grp_b_1 num" class="gt_row gt_right gt_summary_row gt_first_summary_row thick">5550.00</td>
      <td headers="grp_b summary_stub_grp_b_1 char" class="gt_row gt_left gt_summary_row gt_first_summary_row thick">—</td>
      <td headers="grp_b summary_stub_grp_b_1 fctr" class="gt_row gt_center gt_summary_row gt_first_summary_row thick">—</td>
      <td headers="grp_b summary_stub_grp_b_1 date" class="gt_row gt_right gt_summary_row gt_first_summary_row thick">—</td>
      <td headers="grp_b summary_stub_grp_b_1 time" class="gt_row gt_right gt_summary_row gt_first_summary_row thick">—</td>
      <td headers="grp_b summary_stub_grp_b_1 datetime" class="gt_row gt_right gt_summary_row gt_first_summary_row thick">—</td>
      <td headers="grp_b summary_stub_grp_b_1 currency" class="gt_row gt_right gt_summary_row gt_first_summary_row thick">0.44</td></tr>
          <tr><th id="summary_stub_grp_b_2" scope="row" class="gt_row gt_left gt_stub gt_summary_row">max</th>
      <td headers="grp_b summary_stub_grp_b_2 num" class="gt_row gt_right gt_summary_row">8880000.00</td>
      <td headers="grp_b summary_stub_grp_b_2 char" class="gt_row gt_left gt_summary_row">—</td>
      <td headers="grp_b summary_stub_grp_b_2 fctr" class="gt_row gt_center gt_summary_row">—</td>
      <td headers="grp_b summary_stub_grp_b_2 date" class="gt_row gt_right gt_summary_row">—</td>
      <td headers="grp_b summary_stub_grp_b_2 time" class="gt_row gt_right gt_summary_row">—</td>
      <td headers="grp_b summary_stub_grp_b_2 datetime" class="gt_row gt_right gt_summary_row">—</td>
      <td headers="grp_b summary_stub_grp_b_2 currency" class="gt_row gt_right gt_summary_row">1325.81</td></tr>
          <tr><th id="summary_stub_grp_b_3" scope="row" class="gt_row gt_left gt_stub gt_summary_row gt_last_summary_row">avg</th>
      <td headers="grp_b summary_stub_grp_b_3 num" class="gt_row gt_right gt_summary_row gt_last_summary_row">3220850.00</td>
      <td headers="grp_b summary_stub_grp_b_3 char" class="gt_row gt_left gt_summary_row gt_last_summary_row">—</td>
      <td headers="grp_b summary_stub_grp_b_3 fctr" class="gt_row gt_center gt_summary_row gt_last_summary_row">—</td>
      <td headers="grp_b summary_stub_grp_b_3 date" class="gt_row gt_right gt_summary_row gt_last_summary_row">—</td>
      <td headers="grp_b summary_stub_grp_b_3 time" class="gt_row gt_right gt_summary_row gt_last_summary_row">—</td>
      <td headers="grp_b summary_stub_grp_b_3 datetime" class="gt_row gt_right gt_summary_row gt_last_summary_row">—</td>
      <td headers="grp_b summary_stub_grp_b_3 currency" class="gt_row gt_right gt_summary_row gt_last_summary_row">446.50</td></tr>
          <tr><th id="grand_summary_stub_1" scope="row" colspan="2" class="gt_row gt_left gt_stub gt_grand_summary_row gt_first_grand_summary_row">min</th>
      <td headers="grand_summary_stub_1 num" class="gt_row gt_right gt_grand_summary_row gt_first_grand_summary_row">0.11</td>
      <td headers="grand_summary_stub_1 char" class="gt_row gt_left gt_grand_summary_row gt_first_grand_summary_row">—</td>
      <td headers="grand_summary_stub_1 fctr" class="gt_row gt_center gt_grand_summary_row gt_first_grand_summary_row">—</td>
      <td headers="grand_summary_stub_1 date" class="gt_row gt_right gt_grand_summary_row gt_first_grand_summary_row">—</td>
      <td headers="grand_summary_stub_1 time" class="gt_row gt_right gt_grand_summary_row gt_first_grand_summary_row">—</td>
      <td headers="grand_summary_stub_1 datetime" class="gt_row gt_right gt_grand_summary_row gt_first_grand_summary_row">—</td>
      <td headers="grand_summary_stub_1 currency" class="gt_row gt_right gt_grand_summary_row gt_first_grand_summary_row">0.44</td></tr>
          <tr><th id="grand_summary_stub_2" scope="row" colspan="2" class="gt_row gt_left gt_stub gt_grand_summary_row">max</th>
      <td headers="grand_summary_stub_2 num" class="gt_row gt_right gt_grand_summary_row">8880000.00</td>
      <td headers="grand_summary_stub_2 char" class="gt_row gt_left gt_grand_summary_row">—</td>
      <td headers="grand_summary_stub_2 fctr" class="gt_row gt_center gt_grand_summary_row">—</td>
      <td headers="grand_summary_stub_2 date" class="gt_row gt_right gt_grand_summary_row">—</td>
      <td headers="grand_summary_stub_2 time" class="gt_row gt_right gt_grand_summary_row">—</td>
      <td headers="grand_summary_stub_2 datetime" class="gt_row gt_right gt_grand_summary_row">—</td>
      <td headers="grand_summary_stub_2 currency" class="gt_row gt_right gt_grand_summary_row">65100.00</td></tr>
          <tr><th id="grand_summary_stub_3" scope="row" colspan="2" class="gt_row gt_left gt_stub gt_grand_summary_row gt_last_summary_row">avg</th>
      <td headers="grand_summary_stub_3 num" class="gt_row gt_right gt_grand_summary_row gt_last_summary_row">1380432.87</td>
      <td headers="grand_summary_stub_3 char" class="gt_row gt_left gt_grand_summary_row gt_last_summary_row">—</td>
      <td headers="grand_summary_stub_3 fctr" class="gt_row gt_center gt_grand_summary_row gt_last_summary_row">—</td>
      <td headers="grand_summary_stub_3 date" class="gt_row gt_right gt_grand_summary_row gt_last_summary_row">—</td>
      <td headers="grand_summary_stub_3 time" class="gt_row gt_right gt_grand_summary_row gt_last_summary_row">—</td>
      <td headers="grand_summary_stub_3 datetime" class="gt_row gt_right gt_grand_summary_row gt_last_summary_row">—</td>
      <td headers="grand_summary_stub_3 currency" class="gt_row gt_right gt_grand_summary_row gt_last_summary_row">9501.26</td></tr>
        </tbody>
        <tfoot>
          <tr class="gt_sourcenotes">
            <td class="gt_sourcenote" colspan="9">Source note #1</td>
          </tr>
          <tr class="gt_sourcenotes">
            <td class="gt_sourcenote" colspan="9">Source note #2</td>
          </tr>
        </tfoot>
      </table>

---

    Code
      as.character(as_latex(gt_tbl))
    Output
      [1] "\\begingroup\n\\fontsize{12.0pt}{14.0pt}\\selectfont\n\\setlength{\\LTpost}{0mm}\n\\begin{longtable}{l|l|rlcrrrr}\n\\caption*{\n{\\fontsize{20}{25}\\selectfont  Data listing from \\textbf{exibble}\\fontsize{12}{15}\\selectfont } \\\\ \n{\\fontsize{14}{17}\\selectfont  \\texttt{exibble} is an R dataset\\fontsize{12}{15}\\selectfont }\n} \\\\ \n\\toprule\n\\multicolumn{2}{l}{} &  &  &  & \\multicolumn{3}{c}{timing} &  \\\\ \n\\cmidrule(lr){6-8}\n\\multicolumn{2}{c}{S.L.} & num & char & fctr & date & time & datetime & currency \\\\ \n\\midrule\\addlinespace[2.5pt]\n\\multirow[t]{7}{*}{grp\\_a} & row\\_1 & 1.111e-01 & apricot & one & 2015-01-15 & 13:35 & 2018-01-01 02:22 & 49.950 \\\\ \n & row\\_2 & 2.222e+00 & banana & two & 2015-02-15 & 14:40 & 2018-02-02 14:33 & 17.950 \\\\ \n & row\\_3 & 3.333e+01 & coconut & three & 2015-03-15 & 15:45 & 2018-03-03 03:44 & 1.390 \\\\ \n & row\\_4 & 4.444e+02 & durian & four & 2015-04-15 & 16:50 & 2018-04-04 15:55 & 65100.000 \\\\ \n\\cmidrule(l{-0.05em}r){2-9}\n\\multicolumn{1}{l|}{} & \\multicolumn{1}{l|}{min} & 0.11 & — & — & — & — & — & 1.39 \\\\ \n\\multicolumn{1}{l|}{} & \\multicolumn{1}{l|}{max} & 444.40 & — & — & — & — & — & 65100.00 \\\\ \n\\multicolumn{1}{l|}{} & \\multicolumn{1}{l|}{avg} & 120.02 & — & — & — & — & — & 16292.32 \\\\ \n\\midrule\\addlinespace[2.5pt]\n\\multirow[t]{7}{*}{grp\\_b} & row\\_5 & 5.550e+03 & NA & five & 2015-05-15 & 17:55 & 2018-05-05 04:00 & 1325.810 \\\\ \n & row\\_6 & NA & fig & six & 2015-06-15 & NA & 2018-06-06 16:11 & 13.255 \\\\ \n & row\\_7 & 7.770e+05 & grapefruit & seven & NA & 19:10 & 2018-07-07 05:22 & NA \\\\ \n & row\\_8 & 8.880e+06 & honeydew & eight & 2015-08-15 & 20:20 & NA & 0.440 \\\\ \n\\cmidrule(l{-0.05em}r){2-9}\n\\multicolumn{1}{l|}{} & \\multicolumn{1}{l|}{min} & 5550.00 & — & — & — & — & — & 0.44 \\\\ \n\\multicolumn{1}{l|}{} & \\multicolumn{1}{l|}{max} & 8880000.00 & — & — & — & — & — & 1325.81 \\\\ \n\\multicolumn{1}{l|}{} & \\multicolumn{1}{l|}{avg} & 3220850.00 & — & — & — & — & — & 446.50 \\\\ \n\\midrule \n\\midrule \n\\multicolumn{1}{l|}{} & \\multicolumn{1}{l|}{min} & 0.11 & — & — & — & — & — & 0.44 \\\\ \n\\multicolumn{1}{l|}{} & \\multicolumn{1}{l|}{max} & 8880000.00 & — & — & — & — & — & 65100.00 \\\\ \n\\multicolumn{1}{l|}{} & \\multicolumn{1}{l|}{avg} & 1380432.87 & — & — & — & — & — & 9501.26 \\\\ \n\\bottomrule\n\\end{longtable}\n\\begin{minipage}{\\linewidth}\n\\vspace{.05em}\nSource note \\#1\\\\\nSource note \\#2\\\\\n\\end{minipage}\n\\endgroup\n"

---

    Code
      as_rtf(gt_tbl)
    Output
      {\rtf\ansi\ansicpg1252{\fonttbl{\f0\froman\fcharset0\fprq0 Courier New;}{\f1\froman\fcharset0\fprq0 Times;}}{\colortbl;\red51\green51\blue51;\red211\green211\blue211;}
      
      \paperw12240\paperh15840\widowctrl\ftnbj\fet0\sectd\linex0
      \lndscpsxn
      \margl1440\margr1440\margt1440\margb1440
      \headery720\footery720\fs20
      
      \trowd\trrh0\trhdr
      
      \pard\plain\uc0\qc\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx9360
      \intbl {\f0\cf1 {\f0\fs20 Data listing from {\b exibble}} {\f0\fs20\i\super } \line {\f0\fs20 {\f1 exibble} is an R dataset} {\f0\fs20\i\super }}\cell
      
      \row
      
      \trowd\trrh0\trhdr
      
      \pard\plain\uc0\qc\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx1040
      \intbl {\f0 {\f0\fs20 }}\cell
      
      \pard\plain\uc0\qc\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx2080
      \intbl {\f0 {\f0\fs20 }}\cell
      
      \pard\plain\uc0\qc\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx3120
      \intbl {\f0 {\f0\fs20 }}\cell
      
      \pard\plain\uc0\qc\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx4160
      \intbl {\f0 {\f0\fs20 }}\cell
      
      \pard\plain\uc0\qc\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx5200
      \intbl {\f0 {\f0\fs20 }}\cell
      
      \pard\plain\uc0\qc\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85\clbrdrb\brdrs\brdrw20\brdrcf2\clmgf \cellx6240
      \intbl {\f0 {\f0\fs20 timing}}\cell
      
      \pard\plain\uc0\qc\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85\clmrg \cellx7280
      \intbl {\f0 {\f0\fs20 }}\cell
      
      \pard\plain\uc0\qc\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85\clmrg \cellx8320
      \intbl {\f0 {\f0\fs20 }}\cell
      
      \pard\plain\uc0\qc\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx9360
      \intbl {\f0 {\f0\fs20 }}\cell
      
      \row
      
      \trowd\trrh0\trhdr
      
      \pard\plain\uc0\ql\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85\clbrdrb\brdrs\brdrw20\brdrcf2\clmgf \cellx1040
      \intbl {\f0 {\f0\fs20 S.L.}}\cell
      
      \pard\plain\uc0\ql\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85\clbrdrb\brdrs\brdrw20\brdrcf2\clmrg \cellx2080
      \intbl {\f0 {\f0\fs20 }}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85\clbrdrb\brdrs\brdrw20\brdrcf2 \cellx3120
      \intbl {\f0 {\f0\fs20 num}}\cell
      
      \pard\plain\uc0\ql\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85\clbrdrb\brdrs\brdrw20\brdrcf2 \cellx4160
      \intbl {\f0 {\f0\fs20 char}}\cell
      
      \pard\plain\uc0\qc\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85\clbrdrb\brdrs\brdrw20\brdrcf2 \cellx5200
      \intbl {\f0 {\f0\fs20 fctr}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85\clbrdrb\brdrs\brdrw20\brdrcf2 \cellx6240
      \intbl {\f0 {\f0\fs20 date}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85\clbrdrb\brdrs\brdrw20\brdrcf2 \cellx7280
      \intbl {\f0 {\f0\fs20 time}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85\clbrdrb\brdrs\brdrw20\brdrcf2 \cellx8320
      \intbl {\f0 {\f0\fs20 datetime}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85\clbrdrb\brdrs\brdrw20\brdrcf2 \cellx9360
      \intbl {\f0 {\f0\fs20 currency}}\cell
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\ql\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx1040
      \intbl {\f0 {\f0\fs20 grp_a}}\cell
      
      \pard\plain\uc0\ql\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx2080
      \intbl {\f0 {\f0\fs20 row_1}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx3120
      \intbl {\f0 {\f0\fs20 1.111e-01}}\cell
      
      \pard\plain\uc0\ql\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx4160
      \intbl {\f0 {\f0\fs20 apricot}}\cell
      
      \pard\plain\uc0\qc\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx5200
      \intbl {\f0 {\f0\fs20 one}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx6240
      \intbl {\f0 {\f0\fs20 2015-01-15}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx7280
      \intbl {\f0 {\f0\fs20 13:35}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx8320
      \intbl {\f0 {\f0\fs20 2018-01-01 02:22}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx9360
      \intbl {\f0 {\f0\fs20 49.950}}\cell
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\ql\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx1040
      \intbl {\f0 {\f0\fs20 }}\cell
      
      \pard\plain\uc0\ql\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx2080
      \intbl {\f0 {\f0\fs20 row_2}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx3120
      \intbl {\f0 {\f0\fs20 2.222e+00}}\cell
      
      \pard\plain\uc0\ql\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx4160
      \intbl {\f0 {\f0\fs20 banana}}\cell
      
      \pard\plain\uc0\qc\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx5200
      \intbl {\f0 {\f0\fs20 two}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx6240
      \intbl {\f0 {\f0\fs20 2015-02-15}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx7280
      \intbl {\f0 {\f0\fs20 14:40}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx8320
      \intbl {\f0 {\f0\fs20 2018-02-02 14:33}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx9360
      \intbl {\f0 {\f0\fs20 17.950}}\cell
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\ql\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx1040
      \intbl {\f0 {\f0\fs20 }}\cell
      
      \pard\plain\uc0\ql\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx2080
      \intbl {\f0 {\f0\fs20 row_3}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx3120
      \intbl {\f0 {\f0\fs20 3.333e+01}}\cell
      
      \pard\plain\uc0\ql\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx4160
      \intbl {\f0 {\f0\fs20 coconut}}\cell
      
      \pard\plain\uc0\qc\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx5200
      \intbl {\f0 {\f0\fs20 three}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx6240
      \intbl {\f0 {\f0\fs20 2015-03-15}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx7280
      \intbl {\f0 {\f0\fs20 15:45}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx8320
      \intbl {\f0 {\f0\fs20 2018-03-03 03:44}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx9360
      \intbl {\f0 {\f0\fs20 1.390}}\cell
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\ql\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx1040
      \intbl {\f0 {\f0\fs20 }}\cell
      
      \pard\plain\uc0\ql\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx2080
      \intbl {\f0 {\f0\fs20 row_4}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx3120
      \intbl {\f0 {\f0\fs20 4.444e+02}}\cell
      
      \pard\plain\uc0\ql\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx4160
      \intbl {\f0 {\f0\fs20 durian}}\cell
      
      \pard\plain\uc0\qc\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx5200
      \intbl {\f0 {\f0\fs20 four}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx6240
      \intbl {\f0 {\f0\fs20 2015-04-15}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx7280
      \intbl {\f0 {\f0\fs20 16:50}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx8320
      \intbl {\f0 {\f0\fs20 2018-04-04 15:55}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx9360
      \intbl {\f0 {\f0\fs20 65100.000}}\cell
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\ql\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx1040
      \intbl {\f0 {\f0\fs20 }}\cell
      
      \pard\plain\uc0\ql\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx2080
      \intbl {\f0 {\f0\fs20 min}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx3120
      \intbl {\f0 {\f0\fs20 0.11}}\cell
      
      \pard\plain\uc0\ql\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx4160
      \intbl {\f0 {\f0\fs20 \'97}}\cell
      
      \pard\plain\uc0\qc\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx5200
      \intbl {\f0 {\f0\fs20 \'97}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx6240
      \intbl {\f0 {\f0\fs20 \'97}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx7280
      \intbl {\f0 {\f0\fs20 \'97}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx8320
      \intbl {\f0 {\f0\fs20 \'97}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx9360
      \intbl {\f0 {\f0\fs20 1.39}}\cell
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\ql\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx1040
      \intbl {\f0 {\f0\fs20 }}\cell
      
      \pard\plain\uc0\ql\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx2080
      \intbl {\f0 {\f0\fs20 max}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx3120
      \intbl {\f0 {\f0\fs20 444.40}}\cell
      
      \pard\plain\uc0\ql\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx4160
      \intbl {\f0 {\f0\fs20 \'97}}\cell
      
      \pard\plain\uc0\qc\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx5200
      \intbl {\f0 {\f0\fs20 \'97}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx6240
      \intbl {\f0 {\f0\fs20 \'97}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx7280
      \intbl {\f0 {\f0\fs20 \'97}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx8320
      \intbl {\f0 {\f0\fs20 \'97}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx9360
      \intbl {\f0 {\f0\fs20 65100.00}}\cell
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\ql\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx1040
      \intbl {\f0 {\f0\fs20 }}\cell
      
      \pard\plain\uc0\ql\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx2080
      \intbl {\f0 {\f0\fs20 avg}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx3120
      \intbl {\f0 {\f0\fs20 120.02}}\cell
      
      \pard\plain\uc0\ql\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx4160
      \intbl {\f0 {\f0\fs20 \'97}}\cell
      
      \pard\plain\uc0\qc\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx5200
      \intbl {\f0 {\f0\fs20 \'97}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx6240
      \intbl {\f0 {\f0\fs20 \'97}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx7280
      \intbl {\f0 {\f0\fs20 \'97}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx8320
      \intbl {\f0 {\f0\fs20 \'97}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx9360
      \intbl {\f0 {\f0\fs20 16292.32}}\cell
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\ql\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx1040
      \intbl {\f0 {\f0\fs20 grp_b}}\cell
      
      \pard\plain\uc0\ql\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx2080
      \intbl {\f0 {\f0\fs20 row_5}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx3120
      \intbl {\f0 {\f0\fs20 5.550e+03}}\cell
      
      \pard\plain\uc0\ql\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx4160
      \intbl {\f0 {\f0\fs20 NA}}\cell
      
      \pard\plain\uc0\qc\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx5200
      \intbl {\f0 {\f0\fs20 five}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx6240
      \intbl {\f0 {\f0\fs20 2015-05-15}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx7280
      \intbl {\f0 {\f0\fs20 17:55}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx8320
      \intbl {\f0 {\f0\fs20 2018-05-05 04:00}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx9360
      \intbl {\f0 {\f0\fs20 1325.810}}\cell
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\ql\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx1040
      \intbl {\f0 {\f0\fs20 }}\cell
      
      \pard\plain\uc0\ql\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx2080
      \intbl {\f0 {\f0\fs20 row_6}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx3120
      \intbl {\f0 {\f0\fs20 NA}}\cell
      
      \pard\plain\uc0\ql\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx4160
      \intbl {\f0 {\f0\fs20 fig}}\cell
      
      \pard\plain\uc0\qc\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx5200
      \intbl {\f0 {\f0\fs20 six}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx6240
      \intbl {\f0 {\f0\fs20 2015-06-15}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx7280
      \intbl {\f0 {\f0\fs20 NA}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx8320
      \intbl {\f0 {\f0\fs20 2018-06-06 16:11}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx9360
      \intbl {\f0 {\f0\fs20 13.255}}\cell
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\ql\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx1040
      \intbl {\f0 {\f0\fs20 }}\cell
      
      \pard\plain\uc0\ql\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx2080
      \intbl {\f0 {\f0\fs20 row_7}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx3120
      \intbl {\f0 {\f0\fs20 7.770e+05}}\cell
      
      \pard\plain\uc0\ql\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx4160
      \intbl {\f0 {\f0\fs20 grapefruit}}\cell
      
      \pard\plain\uc0\qc\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx5200
      \intbl {\f0 {\f0\fs20 seven}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx6240
      \intbl {\f0 {\f0\fs20 NA}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx7280
      \intbl {\f0 {\f0\fs20 19:10}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx8320
      \intbl {\f0 {\f0\fs20 2018-07-07 05:22}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx9360
      \intbl {\f0 {\f0\fs20 NA}}\cell
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\ql\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx1040
      \intbl {\f0 {\f0\fs20 }}\cell
      
      \pard\plain\uc0\ql\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx2080
      \intbl {\f0 {\f0\fs20 row_8}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx3120
      \intbl {\f0 {\f0\fs20 8.880e+06}}\cell
      
      \pard\plain\uc0\ql\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx4160
      \intbl {\f0 {\f0\fs20 honeydew}}\cell
      
      \pard\plain\uc0\qc\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx5200
      \intbl {\f0 {\f0\fs20 eight}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx6240
      \intbl {\f0 {\f0\fs20 2015-08-15}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx7280
      \intbl {\f0 {\f0\fs20 20:20}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx8320
      \intbl {\f0 {\f0\fs20 NA}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx9360
      \intbl {\f0 {\f0\fs20 0.440}}\cell
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\ql\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx1040
      \intbl {\f0 {\f0\fs20 }}\cell
      
      \pard\plain\uc0\ql\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx2080
      \intbl {\f0 {\f0\fs20 min}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx3120
      \intbl {\f0 {\f0\fs20 5550.00}}\cell
      
      \pard\plain\uc0\ql\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx4160
      \intbl {\f0 {\f0\fs20 \'97}}\cell
      
      \pard\plain\uc0\qc\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx5200
      \intbl {\f0 {\f0\fs20 \'97}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx6240
      \intbl {\f0 {\f0\fs20 \'97}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx7280
      \intbl {\f0 {\f0\fs20 \'97}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx8320
      \intbl {\f0 {\f0\fs20 \'97}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx9360
      \intbl {\f0 {\f0\fs20 0.44}}\cell
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\ql\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx1040
      \intbl {\f0 {\f0\fs20 }}\cell
      
      \pard\plain\uc0\ql\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx2080
      \intbl {\f0 {\f0\fs20 max}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx3120
      \intbl {\f0 {\f0\fs20 8880000.00}}\cell
      
      \pard\plain\uc0\ql\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx4160
      \intbl {\f0 {\f0\fs20 \'97}}\cell
      
      \pard\plain\uc0\qc\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx5200
      \intbl {\f0 {\f0\fs20 \'97}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx6240
      \intbl {\f0 {\f0\fs20 \'97}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx7280
      \intbl {\f0 {\f0\fs20 \'97}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx8320
      \intbl {\f0 {\f0\fs20 \'97}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx9360
      \intbl {\f0 {\f0\fs20 1325.81}}\cell
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\ql\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx1040
      \intbl {\f0 {\f0\fs20 }}\cell
      
      \pard\plain\uc0\ql\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx2080
      \intbl {\f0 {\f0\fs20 avg}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx3120
      \intbl {\f0 {\f0\fs20 3220850.00}}\cell
      
      \pard\plain\uc0\ql\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx4160
      \intbl {\f0 {\f0\fs20 \'97}}\cell
      
      \pard\plain\uc0\qc\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx5200
      \intbl {\f0 {\f0\fs20 \'97}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx6240
      \intbl {\f0 {\f0\fs20 \'97}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx7280
      \intbl {\f0 {\f0\fs20 \'97}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx8320
      \intbl {\f0 {\f0\fs20 \'97}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx9360
      \intbl {\f0 {\f0\fs20 446.50}}\cell
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\ql\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85\clmgf \cellx1040
      \intbl {\f0 {\f0\fs20 min}}\cell
      
      \pard\plain\uc0\ql\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85\clmrg \cellx2080
      \intbl {\f0 {\f0\fs20 }}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx3120
      \intbl {\f0 {\f0\fs20 0.11}}\cell
      
      \pard\plain\uc0\ql\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx4160
      \intbl {\f0 {\f0\fs20 \'97}}\cell
      
      \pard\plain\uc0\qc\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx5200
      \intbl {\f0 {\f0\fs20 \'97}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx6240
      \intbl {\f0 {\f0\fs20 \'97}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx7280
      \intbl {\f0 {\f0\fs20 \'97}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx8320
      \intbl {\f0 {\f0\fs20 \'97}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx9360
      \intbl {\f0 {\f0\fs20 0.44}}\cell
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\ql\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85\clmgf \cellx1040
      \intbl {\f0 {\f0\fs20 max}}\cell
      
      \pard\plain\uc0\ql\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85\clmrg \cellx2080
      \intbl {\f0 {\f0\fs20 }}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx3120
      \intbl {\f0 {\f0\fs20 8880000.00}}\cell
      
      \pard\plain\uc0\ql\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx4160
      \intbl {\f0 {\f0\fs20 \'97}}\cell
      
      \pard\plain\uc0\qc\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx5200
      \intbl {\f0 {\f0\fs20 \'97}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx6240
      \intbl {\f0 {\f0\fs20 \'97}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx7280
      \intbl {\f0 {\f0\fs20 \'97}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx8320
      \intbl {\f0 {\f0\fs20 \'97}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx9360
      \intbl {\f0 {\f0\fs20 65100.00}}\cell
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\ql\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85\clmgf \cellx1040
      \intbl {\f0 {\f0\fs20 avg}}\cell
      
      \pard\plain\uc0\ql\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85\clmrg \cellx2080
      \intbl {\f0 {\f0\fs20 }}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx3120
      \intbl {\f0 {\f0\fs20 1380432.87}}\cell
      
      \pard\plain\uc0\ql\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx4160
      \intbl {\f0 {\f0\fs20 \'97}}\cell
      
      \pard\plain\uc0\qc\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx5200
      \intbl {\f0 {\f0\fs20 \'97}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx6240
      \intbl {\f0 {\f0\fs20 \'97}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx7280
      \intbl {\f0 {\f0\fs20 \'97}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx8320
      \intbl {\f0 {\f0\fs20 \'97}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx9360
      \intbl {\f0 {\f0\fs20 9501.26}}\cell
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\ql\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx9360
      \intbl {\f0 {\f0\fs20 Source note #1\line Source note #2}}\cell
      
      \row
      
      }

---

    Code
      cat(render_as_html(gt_tbl))
    Output
      <table class="gt_table" data-quarto-disable-processing="false" data-quarto-bootstrap="false">
        <thead>
          <tr class="gt_heading">
            <td colspan="9" class="gt_heading gt_title gt_font_normal" style="background-color: #ADD8E6;"><span class='gt_from_md'>Data listing from <strong>exibble</strong></span></td>
          </tr>
          <tr class="gt_heading">
            <td colspan="9" class="gt_heading gt_subtitle gt_font_normal gt_bottom_border" style="background-color: #00FFFF;"><span class='gt_from_md'><code>exibble</code> is an R dataset</span></td>
          </tr>
          <tr class="gt_col_headings gt_spanner_row">
            <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="2" colspan="1" style="background-color: #7FFFD4;" scope="col" id="num">num</th>
            <th class="gt_col_heading gt_columns_bottom_border gt_left" rowspan="2" colspan="1" style="background-color: #7FFFD4;" scope="col" id="char">char</th>
            <th class="gt_col_heading gt_columns_bottom_border gt_center" rowspan="2" colspan="1" style="background-color: #7FFFD4;" scope="col" id="fctr">fctr</th>
            <th class="gt_center gt_columns_top_border gt_column_spanner_outer" rowspan="1" colspan="3" style="background-color: #FFFF00;" scope="colgroup" id="timing">
              <div class="gt_column_spanner">timing</div>
            </th>
            <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="2" colspan="1" style="background-color: #7FFFD4;" scope="col" id="currency">currency</th>
            <th class="gt_col_heading gt_columns_bottom_border gt_left" rowspan="2" colspan="1" style="background-color: #7FFFD4;" scope="col" id="row">row</th>
            <th class="gt_col_heading gt_columns_bottom_border gt_left" rowspan="2" colspan="1" style="background-color: #7FFFD4;" scope="col" id="group">group</th>
          </tr>
          <tr class="gt_col_headings">
            <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" style="background-color: #7FFFD4;" scope="col" id="date">date</th>
            <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" style="background-color: #7FFFD4;" scope="col" id="time">time</th>
            <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" style="background-color: #7FFFD4;" scope="col" id="datetime">datetime</th>
          </tr>
        </thead>
        <tbody class="gt_table_body">
          <tr><td headers="num" class="gt_row gt_right" style="background-color: #D9D9D9;">1.111e-01</td>
      <td headers="char" class="gt_row gt_left" style="background-color: #CCCCCC;">apricot</td>
      <td headers="fctr" class="gt_row gt_center" style="background-color: #BFBFBF;">one</td>
      <td headers="date" class="gt_row gt_right" style="background-color: #B3B3B3;">2015-01-15</td>
      <td headers="time" class="gt_row gt_right" style="background-color: #A6A6A6;">13:35</td>
      <td headers="datetime" class="gt_row gt_right" style="background-color: #999999;">2018-01-01 02:22</td>
      <td headers="currency" class="gt_row gt_right" style="background-color: #8C8C8C;">49.950</td>
      <td headers="row" class="gt_row gt_left" style="background-color: #7F7F7F;">row_1</td>
      <td headers="group" class="gt_row gt_left" style="background-color: #737373;">grp_a</td></tr>
          <tr><td headers="num" class="gt_row gt_right" style="background-color: #D9D9D9;">2.222e+00</td>
      <td headers="char" class="gt_row gt_left" style="background-color: #CCCCCC;">banana</td>
      <td headers="fctr" class="gt_row gt_center" style="background-color: #BFBFBF;">two</td>
      <td headers="date" class="gt_row gt_right" style="background-color: #B3B3B3;">2015-02-15</td>
      <td headers="time" class="gt_row gt_right" style="background-color: #A6A6A6;">14:40</td>
      <td headers="datetime" class="gt_row gt_right" style="background-color: #999999;">2018-02-02 14:33</td>
      <td headers="currency" class="gt_row gt_right" style="background-color: #8C8C8C;">17.950</td>
      <td headers="row" class="gt_row gt_left" style="background-color: #7F7F7F;">row_2</td>
      <td headers="group" class="gt_row gt_left" style="background-color: #737373;">grp_a</td></tr>
          <tr><td headers="num" class="gt_row gt_right" style="background-color: #D9D9D9;">3.333e+01</td>
      <td headers="char" class="gt_row gt_left" style="background-color: #CCCCCC;">coconut</td>
      <td headers="fctr" class="gt_row gt_center" style="background-color: #BFBFBF;">three</td>
      <td headers="date" class="gt_row gt_right" style="background-color: #B3B3B3;">2015-03-15</td>
      <td headers="time" class="gt_row gt_right" style="background-color: #A6A6A6;">15:45</td>
      <td headers="datetime" class="gt_row gt_right" style="background-color: #999999;">2018-03-03 03:44</td>
      <td headers="currency" class="gt_row gt_right" style="background-color: #8C8C8C;">1.390</td>
      <td headers="row" class="gt_row gt_left" style="background-color: #7F7F7F;">row_3</td>
      <td headers="group" class="gt_row gt_left" style="background-color: #737373;">grp_a</td></tr>
          <tr><td headers="num" class="gt_row gt_right" style="background-color: #D9D9D9;">4.444e+02</td>
      <td headers="char" class="gt_row gt_left" style="background-color: #CCCCCC;">durian</td>
      <td headers="fctr" class="gt_row gt_center" style="background-color: #BFBFBF;">four</td>
      <td headers="date" class="gt_row gt_right" style="background-color: #B3B3B3;">2015-04-15</td>
      <td headers="time" class="gt_row gt_right" style="background-color: #A6A6A6;">16:50</td>
      <td headers="datetime" class="gt_row gt_right" style="background-color: #999999;">2018-04-04 15:55</td>
      <td headers="currency" class="gt_row gt_right" style="background-color: #8C8C8C;">65100.000</td>
      <td headers="row" class="gt_row gt_left" style="background-color: #7F7F7F;">row_4</td>
      <td headers="group" class="gt_row gt_left" style="background-color: #737373;">grp_a</td></tr>
          <tr><td headers="num" class="gt_row gt_right" style="background-color: #D9D9D9;">5.550e+03</td>
      <td headers="char" class="gt_row gt_left" style="background-color: #CCCCCC;">NA</td>
      <td headers="fctr" class="gt_row gt_center" style="background-color: #BFBFBF;">five</td>
      <td headers="date" class="gt_row gt_right" style="background-color: #B3B3B3;">2015-05-15</td>
      <td headers="time" class="gt_row gt_right" style="background-color: #A6A6A6;">17:55</td>
      <td headers="datetime" class="gt_row gt_right" style="background-color: #999999;">2018-05-05 04:00</td>
      <td headers="currency" class="gt_row gt_right" style="background-color: #8C8C8C;">1325.810</td>
      <td headers="row" class="gt_row gt_left" style="background-color: #7F7F7F;">row_5</td>
      <td headers="group" class="gt_row gt_left" style="background-color: #737373;">grp_b</td></tr>
          <tr><td headers="num" class="gt_row gt_right" style="background-color: #D9D9D9;">NA</td>
      <td headers="char" class="gt_row gt_left" style="background-color: #CCCCCC;">fig</td>
      <td headers="fctr" class="gt_row gt_center" style="background-color: #BFBFBF;">six</td>
      <td headers="date" class="gt_row gt_right" style="background-color: #B3B3B3;">2015-06-15</td>
      <td headers="time" class="gt_row gt_right" style="background-color: #A6A6A6;">NA</td>
      <td headers="datetime" class="gt_row gt_right" style="background-color: #999999;">2018-06-06 16:11</td>
      <td headers="currency" class="gt_row gt_right" style="background-color: #8C8C8C;">13.255</td>
      <td headers="row" class="gt_row gt_left" style="background-color: #7F7F7F;">row_6</td>
      <td headers="group" class="gt_row gt_left" style="background-color: #737373;">grp_b</td></tr>
          <tr><td headers="num" class="gt_row gt_right" style="background-color: #D9D9D9;">7.770e+05</td>
      <td headers="char" class="gt_row gt_left" style="background-color: #CCCCCC;">grapefruit</td>
      <td headers="fctr" class="gt_row gt_center" style="background-color: #BFBFBF;">seven</td>
      <td headers="date" class="gt_row gt_right" style="background-color: #B3B3B3;">NA</td>
      <td headers="time" class="gt_row gt_right" style="background-color: #A6A6A6;">19:10</td>
      <td headers="datetime" class="gt_row gt_right" style="background-color: #999999;">2018-07-07 05:22</td>
      <td headers="currency" class="gt_row gt_right" style="background-color: #8C8C8C;">NA</td>
      <td headers="row" class="gt_row gt_left" style="background-color: #7F7F7F;">row_7</td>
      <td headers="group" class="gt_row gt_left" style="background-color: #737373;">grp_b</td></tr>
          <tr><td headers="num" class="gt_row gt_right" style="background-color: #D9D9D9;">8.880e+06</td>
      <td headers="char" class="gt_row gt_left" style="background-color: #CCCCCC;">honeydew</td>
      <td headers="fctr" class="gt_row gt_center" style="background-color: #BFBFBF;">eight</td>
      <td headers="date" class="gt_row gt_right" style="background-color: #B3B3B3;">2015-08-15</td>
      <td headers="time" class="gt_row gt_right" style="background-color: #A6A6A6;">20:20</td>
      <td headers="datetime" class="gt_row gt_right" style="background-color: #999999;">NA</td>
      <td headers="currency" class="gt_row gt_right" style="background-color: #8C8C8C;">0.440</td>
      <td headers="row" class="gt_row gt_left" style="background-color: #7F7F7F;">row_8</td>
      <td headers="group" class="gt_row gt_left" style="background-color: #737373;">grp_b</td></tr>
        </tbody>
        <tfoot>
          <tr class="gt_sourcenotes">
            <td class="gt_sourcenote" style="background-color: #F5DEB3;" colspan="9">Source note #1</td>
          </tr>
          <tr class="gt_sourcenotes">
            <td class="gt_sourcenote" style="background-color: #F5DEB3;" colspan="9">Source note #2</td>
          </tr>
        </tfoot>
      </table>

---

    Code
      cat(render_as_html(gt_tbl))
    Output
      <table class="gt_table" data-quarto-disable-processing="false" data-quarto-bootstrap="false">
        <thead>
          <tr class="gt_heading">
            <td colspan="9" class="gt_heading gt_title gt_font_normal" style="background-color: #ADD8E6;"><span class='gt_from_md'>Data listing from <strong>exibble</strong></span></td>
          </tr>
          <tr class="gt_heading">
            <td colspan="9" class="gt_heading gt_subtitle gt_font_normal gt_bottom_border" style="background-color: #00FFFF;"><span class='gt_from_md'><code>exibble</code> is an R dataset</span></td>
          </tr>
          <tr class="gt_col_headings gt_spanner_row">
            <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="2" colspan="1" style="background-color: #7FFFD4;" scope="col" id="num">num</th>
            <th class="gt_col_heading gt_columns_bottom_border gt_left" rowspan="2" colspan="1" style="background-color: #7FFFD4;" scope="col" id="char">char</th>
            <th class="gt_col_heading gt_columns_bottom_border gt_center" rowspan="2" colspan="1" style="background-color: #7FFFD4;" scope="col" id="fctr">fctr</th>
            <th class="gt_center gt_columns_top_border gt_column_spanner_outer" rowspan="1" colspan="3" style="background-color: #FFFF00;" scope="colgroup" id="timing">
              <div class="gt_column_spanner">timing</div>
            </th>
            <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="2" colspan="1" style="background-color: #7FFFD4;" scope="col" id="currency">currency</th>
            <th class="gt_col_heading gt_columns_bottom_border gt_left" rowspan="2" colspan="1" style="background-color: #7FFFD4;" scope="col" id="row">row</th>
            <th class="gt_col_heading gt_columns_bottom_border gt_left" rowspan="2" colspan="1" style="background-color: #7FFFD4;" scope="col" id="group">group</th>
          </tr>
          <tr class="gt_col_headings">
            <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" style="background-color: #7FFFD4;" scope="col" id="date">date</th>
            <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" style="background-color: #7FFFD4;" scope="col" id="time">time</th>
            <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" style="background-color: #7FFFD4;" scope="col" id="datetime">datetime</th>
          </tr>
        </thead>
        <tbody class="gt_table_body">
          <tr><td headers="num" class="gt_row gt_right" style="background-color: #D9D9D9;">1.111e-01</td>
      <td headers="char" class="gt_row gt_left" style="background-color: #CCCCCC;">apricot</td>
      <td headers="fctr" class="gt_row gt_center" style="background-color: #BFBFBF;">one</td>
      <td headers="date" class="gt_row gt_right" style="background-color: #B3B3B3;">2015-01-15</td>
      <td headers="time" class="gt_row gt_right" style="background-color: #A6A6A6;">13:35</td>
      <td headers="datetime" class="gt_row gt_right" style="background-color: #999999;">2018-01-01 02:22</td>
      <td headers="currency" class="gt_row gt_right" style="background-color: #8C8C8C;">49.950</td>
      <td headers="row" class="gt_row gt_left" style="background-color: #7F7F7F;">row_1</td>
      <td headers="group" class="gt_row gt_left" style="background-color: #737373;">grp_a</td></tr>
          <tr><td headers="num" class="gt_row gt_right" style="background-color: #D9D9D9;">2.222e+00</td>
      <td headers="char" class="gt_row gt_left" style="background-color: #CCCCCC;">banana</td>
      <td headers="fctr" class="gt_row gt_center" style="background-color: #BFBFBF;">two</td>
      <td headers="date" class="gt_row gt_right" style="background-color: #B3B3B3;">2015-02-15</td>
      <td headers="time" class="gt_row gt_right" style="background-color: #A6A6A6;">14:40</td>
      <td headers="datetime" class="gt_row gt_right" style="background-color: #999999;">2018-02-02 14:33</td>
      <td headers="currency" class="gt_row gt_right" style="background-color: #8C8C8C;">17.950</td>
      <td headers="row" class="gt_row gt_left" style="background-color: #7F7F7F;">row_2</td>
      <td headers="group" class="gt_row gt_left" style="background-color: #737373;">grp_a</td></tr>
          <tr><td headers="num" class="gt_row gt_right" style="background-color: #D9D9D9;">3.333e+01</td>
      <td headers="char" class="gt_row gt_left" style="background-color: #CCCCCC;">coconut</td>
      <td headers="fctr" class="gt_row gt_center" style="background-color: #BFBFBF;">three</td>
      <td headers="date" class="gt_row gt_right" style="background-color: #B3B3B3;">2015-03-15</td>
      <td headers="time" class="gt_row gt_right" style="background-color: #A6A6A6;">15:45</td>
      <td headers="datetime" class="gt_row gt_right" style="background-color: #999999;">2018-03-03 03:44</td>
      <td headers="currency" class="gt_row gt_right" style="background-color: #8C8C8C;">1.390</td>
      <td headers="row" class="gt_row gt_left" style="background-color: #7F7F7F;">row_3</td>
      <td headers="group" class="gt_row gt_left" style="background-color: #737373;">grp_a</td></tr>
          <tr><td headers="num" class="gt_row gt_right" style="background-color: #D9D9D9;">4.444e+02</td>
      <td headers="char" class="gt_row gt_left" style="background-color: #CCCCCC;">durian</td>
      <td headers="fctr" class="gt_row gt_center" style="background-color: #BFBFBF;">four</td>
      <td headers="date" class="gt_row gt_right" style="background-color: #B3B3B3;">2015-04-15</td>
      <td headers="time" class="gt_row gt_right" style="background-color: #A6A6A6;">16:50</td>
      <td headers="datetime" class="gt_row gt_right" style="background-color: #999999;">2018-04-04 15:55</td>
      <td headers="currency" class="gt_row gt_right" style="background-color: #8C8C8C;">65100.000</td>
      <td headers="row" class="gt_row gt_left" style="background-color: #7F7F7F;">row_4</td>
      <td headers="group" class="gt_row gt_left" style="background-color: #737373;">grp_a</td></tr>
          <tr><td headers="num" class="gt_row gt_right" style="background-color: #D9D9D9;">5.550e+03</td>
      <td headers="char" class="gt_row gt_left" style="background-color: #CCCCCC;">NA</td>
      <td headers="fctr" class="gt_row gt_center" style="background-color: #BFBFBF;">five</td>
      <td headers="date" class="gt_row gt_right" style="background-color: #B3B3B3;">2015-05-15</td>
      <td headers="time" class="gt_row gt_right" style="background-color: #A6A6A6;">17:55</td>
      <td headers="datetime" class="gt_row gt_right" style="background-color: #999999;">2018-05-05 04:00</td>
      <td headers="currency" class="gt_row gt_right" style="background-color: #8C8C8C;">1325.810</td>
      <td headers="row" class="gt_row gt_left" style="background-color: #7F7F7F;">row_5</td>
      <td headers="group" class="gt_row gt_left" style="background-color: #737373;">grp_b</td></tr>
          <tr><td headers="num" class="gt_row gt_right" style="background-color: #D9D9D9;">NA</td>
      <td headers="char" class="gt_row gt_left" style="background-color: #CCCCCC;">fig</td>
      <td headers="fctr" class="gt_row gt_center" style="background-color: #BFBFBF;">six</td>
      <td headers="date" class="gt_row gt_right" style="background-color: #B3B3B3;">2015-06-15</td>
      <td headers="time" class="gt_row gt_right" style="background-color: #A6A6A6;">NA</td>
      <td headers="datetime" class="gt_row gt_right" style="background-color: #999999;">2018-06-06 16:11</td>
      <td headers="currency" class="gt_row gt_right" style="background-color: #8C8C8C;">13.255</td>
      <td headers="row" class="gt_row gt_left" style="background-color: #7F7F7F;">row_6</td>
      <td headers="group" class="gt_row gt_left" style="background-color: #737373;">grp_b</td></tr>
          <tr><td headers="num" class="gt_row gt_right" style="background-color: #D9D9D9;">7.770e+05</td>
      <td headers="char" class="gt_row gt_left" style="background-color: #CCCCCC;">grapefruit</td>
      <td headers="fctr" class="gt_row gt_center" style="background-color: #BFBFBF;">seven</td>
      <td headers="date" class="gt_row gt_right" style="background-color: #B3B3B3;">NA</td>
      <td headers="time" class="gt_row gt_right" style="background-color: #A6A6A6;">19:10</td>
      <td headers="datetime" class="gt_row gt_right" style="background-color: #999999;">2018-07-07 05:22</td>
      <td headers="currency" class="gt_row gt_right" style="background-color: #8C8C8C;">NA</td>
      <td headers="row" class="gt_row gt_left" style="background-color: #7F7F7F;">row_7</td>
      <td headers="group" class="gt_row gt_left" style="background-color: #737373;">grp_b</td></tr>
          <tr><td headers="num" class="gt_row gt_right" style="background-color: #D9D9D9;">8.880e+06</td>
      <td headers="char" class="gt_row gt_left" style="background-color: #CCCCCC;">honeydew</td>
      <td headers="fctr" class="gt_row gt_center" style="background-color: #BFBFBF;">eight</td>
      <td headers="date" class="gt_row gt_right" style="background-color: #B3B3B3;">2015-08-15</td>
      <td headers="time" class="gt_row gt_right" style="background-color: #A6A6A6;">20:20</td>
      <td headers="datetime" class="gt_row gt_right" style="background-color: #999999;">NA</td>
      <td headers="currency" class="gt_row gt_right" style="background-color: #8C8C8C;">0.440</td>
      <td headers="row" class="gt_row gt_left" style="background-color: #7F7F7F;">row_8</td>
      <td headers="group" class="gt_row gt_left" style="background-color: #737373;">grp_b</td></tr>
        </tbody>
        <tfoot>
          <tr class="gt_sourcenotes">
            <td class="gt_sourcenote" style="background-color: #F5DEB3;" colspan="9">Source note #1</td>
          </tr>
          <tr class="gt_sourcenotes">
            <td class="gt_sourcenote" style="background-color: #F5DEB3;" colspan="9">Source note #2</td>
          </tr>
        </tfoot>
      </table>

---

    Code
      cat(render_as_html(gt_tbl))
    Output
      <table class="gt_table" data-quarto-disable-processing="false" data-quarto-bootstrap="false">
        <thead>
          <tr class="gt_heading">
            <td colspan="8" class="gt_heading gt_title gt_font_normal" style="background-color: #ADD8E6;"><span class='gt_from_md'>Data listing from <strong>exibble</strong></span></td>
          </tr>
          <tr class="gt_heading">
            <td colspan="8" class="gt_heading gt_subtitle gt_font_normal gt_bottom_border" style="background-color: #00FFFF;"><span class='gt_from_md'><code>exibble</code> is an R dataset</span></td>
          </tr>
          <tr class="gt_col_headings gt_spanner_row">
            <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="2" colspan="1" style="background-color: #7FFFD4;" scope="col" id="num">num</th>
            <th class="gt_col_heading gt_columns_bottom_border gt_left" rowspan="2" colspan="1" style="background-color: #7FFFD4;" scope="col" id="char">char</th>
            <th class="gt_col_heading gt_columns_bottom_border gt_center" rowspan="2" colspan="1" style="background-color: #7FFFD4;" scope="col" id="fctr">fctr</th>
            <th class="gt_center gt_columns_top_border gt_column_spanner_outer" rowspan="1" colspan="3" style="background-color: #FFFF00;" scope="colgroup" id="timing">
              <div class="gt_column_spanner">timing</div>
            </th>
            <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="2" colspan="1" style="background-color: #7FFFD4;" scope="col" id="currency">currency</th>
            <th class="gt_col_heading gt_columns_bottom_border gt_left" rowspan="2" colspan="1" style="background-color: #7FFFD4;" scope="col" id="row">row</th>
          </tr>
          <tr class="gt_col_headings">
            <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" style="background-color: #7FFFD4;" scope="col" id="date">date</th>
            <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" style="background-color: #7FFFD4;" scope="col" id="time">time</th>
            <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" style="background-color: #7FFFD4;" scope="col" id="datetime">datetime</th>
          </tr>
        </thead>
        <tbody class="gt_table_body">
          <tr class="gt_group_heading_row">
            <th colspan="8" class="gt_group_heading" style="background-color: #E0FFFF;" scope="colgroup" id="grp_a">grp_a</th>
          </tr>
          <tr class="gt_row_group_first"><td headers="grp_a  num" class="gt_row gt_right" style="background-color: #D9D9D9;">1.111e-01</td>
      <td headers="grp_a  char" class="gt_row gt_left" style="background-color: #CCCCCC;">apricot</td>
      <td headers="grp_a  fctr" class="gt_row gt_center" style="background-color: #BFBFBF;">one</td>
      <td headers="grp_a  date" class="gt_row gt_right" style="background-color: #B3B3B3;">2015-01-15</td>
      <td headers="grp_a  time" class="gt_row gt_right" style="background-color: #A6A6A6;">13:35</td>
      <td headers="grp_a  datetime" class="gt_row gt_right" style="background-color: #999999;">2018-01-01 02:22</td>
      <td headers="grp_a  currency" class="gt_row gt_right" style="background-color: #8C8C8C;">49.950</td>
      <td headers="grp_a  row" class="gt_row gt_left" style="background-color: #7F7F7F;">row_1</td></tr>
          <tr><td headers="grp_a  num" class="gt_row gt_right" style="background-color: #D9D9D9;">2.222e+00</td>
      <td headers="grp_a  char" class="gt_row gt_left" style="background-color: #CCCCCC;">banana</td>
      <td headers="grp_a  fctr" class="gt_row gt_center" style="background-color: #BFBFBF;">two</td>
      <td headers="grp_a  date" class="gt_row gt_right" style="background-color: #B3B3B3;">2015-02-15</td>
      <td headers="grp_a  time" class="gt_row gt_right" style="background-color: #A6A6A6;">14:40</td>
      <td headers="grp_a  datetime" class="gt_row gt_right" style="background-color: #999999;">2018-02-02 14:33</td>
      <td headers="grp_a  currency" class="gt_row gt_right" style="background-color: #8C8C8C;">17.950</td>
      <td headers="grp_a  row" class="gt_row gt_left" style="background-color: #7F7F7F;">row_2</td></tr>
          <tr><td headers="grp_a  num" class="gt_row gt_right" style="background-color: #D9D9D9;">3.333e+01</td>
      <td headers="grp_a  char" class="gt_row gt_left" style="background-color: #CCCCCC;">coconut</td>
      <td headers="grp_a  fctr" class="gt_row gt_center" style="background-color: #BFBFBF;">three</td>
      <td headers="grp_a  date" class="gt_row gt_right" style="background-color: #B3B3B3;">2015-03-15</td>
      <td headers="grp_a  time" class="gt_row gt_right" style="background-color: #A6A6A6;">15:45</td>
      <td headers="grp_a  datetime" class="gt_row gt_right" style="background-color: #999999;">2018-03-03 03:44</td>
      <td headers="grp_a  currency" class="gt_row gt_right" style="background-color: #8C8C8C;">1.390</td>
      <td headers="grp_a  row" class="gt_row gt_left" style="background-color: #7F7F7F;">row_3</td></tr>
          <tr><td headers="grp_a  num" class="gt_row gt_right" style="background-color: #D9D9D9;">4.444e+02</td>
      <td headers="grp_a  char" class="gt_row gt_left" style="background-color: #CCCCCC;">durian</td>
      <td headers="grp_a  fctr" class="gt_row gt_center" style="background-color: #BFBFBF;">four</td>
      <td headers="grp_a  date" class="gt_row gt_right" style="background-color: #B3B3B3;">2015-04-15</td>
      <td headers="grp_a  time" class="gt_row gt_right" style="background-color: #A6A6A6;">16:50</td>
      <td headers="grp_a  datetime" class="gt_row gt_right" style="background-color: #999999;">2018-04-04 15:55</td>
      <td headers="grp_a  currency" class="gt_row gt_right" style="background-color: #8C8C8C;">65100.000</td>
      <td headers="grp_a  row" class="gt_row gt_left" style="background-color: #7F7F7F;">row_4</td></tr>
          <tr class="gt_group_heading_row">
            <th colspan="8" class="gt_group_heading" style="background-color: #E0FFFF;" scope="colgroup" id="grp_b">grp_b</th>
          </tr>
          <tr class="gt_row_group_first"><td headers="grp_b  num" class="gt_row gt_right" style="background-color: #D9D9D9;">5.550e+03</td>
      <td headers="grp_b  char" class="gt_row gt_left" style="background-color: #CCCCCC;">NA</td>
      <td headers="grp_b  fctr" class="gt_row gt_center" style="background-color: #BFBFBF;">five</td>
      <td headers="grp_b  date" class="gt_row gt_right" style="background-color: #B3B3B3;">2015-05-15</td>
      <td headers="grp_b  time" class="gt_row gt_right" style="background-color: #A6A6A6;">17:55</td>
      <td headers="grp_b  datetime" class="gt_row gt_right" style="background-color: #999999;">2018-05-05 04:00</td>
      <td headers="grp_b  currency" class="gt_row gt_right" style="background-color: #8C8C8C;">1325.810</td>
      <td headers="grp_b  row" class="gt_row gt_left" style="background-color: #7F7F7F;">row_5</td></tr>
          <tr><td headers="grp_b  num" class="gt_row gt_right" style="background-color: #D9D9D9;">NA</td>
      <td headers="grp_b  char" class="gt_row gt_left" style="background-color: #CCCCCC;">fig</td>
      <td headers="grp_b  fctr" class="gt_row gt_center" style="background-color: #BFBFBF;">six</td>
      <td headers="grp_b  date" class="gt_row gt_right" style="background-color: #B3B3B3;">2015-06-15</td>
      <td headers="grp_b  time" class="gt_row gt_right" style="background-color: #A6A6A6;">NA</td>
      <td headers="grp_b  datetime" class="gt_row gt_right" style="background-color: #999999;">2018-06-06 16:11</td>
      <td headers="grp_b  currency" class="gt_row gt_right" style="background-color: #8C8C8C;">13.255</td>
      <td headers="grp_b  row" class="gt_row gt_left" style="background-color: #7F7F7F;">row_6</td></tr>
          <tr><td headers="grp_b  num" class="gt_row gt_right" style="background-color: #D9D9D9;">7.770e+05</td>
      <td headers="grp_b  char" class="gt_row gt_left" style="background-color: #CCCCCC;">grapefruit</td>
      <td headers="grp_b  fctr" class="gt_row gt_center" style="background-color: #BFBFBF;">seven</td>
      <td headers="grp_b  date" class="gt_row gt_right" style="background-color: #B3B3B3;">NA</td>
      <td headers="grp_b  time" class="gt_row gt_right" style="background-color: #A6A6A6;">19:10</td>
      <td headers="grp_b  datetime" class="gt_row gt_right" style="background-color: #999999;">2018-07-07 05:22</td>
      <td headers="grp_b  currency" class="gt_row gt_right" style="background-color: #8C8C8C;">NA</td>
      <td headers="grp_b  row" class="gt_row gt_left" style="background-color: #7F7F7F;">row_7</td></tr>
          <tr><td headers="grp_b  num" class="gt_row gt_right" style="background-color: #D9D9D9;">8.880e+06</td>
      <td headers="grp_b  char" class="gt_row gt_left" style="background-color: #CCCCCC;">honeydew</td>
      <td headers="grp_b  fctr" class="gt_row gt_center" style="background-color: #BFBFBF;">eight</td>
      <td headers="grp_b  date" class="gt_row gt_right" style="background-color: #B3B3B3;">2015-08-15</td>
      <td headers="grp_b  time" class="gt_row gt_right" style="background-color: #A6A6A6;">20:20</td>
      <td headers="grp_b  datetime" class="gt_row gt_right" style="background-color: #999999;">NA</td>
      <td headers="grp_b  currency" class="gt_row gt_right" style="background-color: #8C8C8C;">0.440</td>
      <td headers="grp_b  row" class="gt_row gt_left" style="background-color: #7F7F7F;">row_8</td></tr>
        </tbody>
        <tfoot>
          <tr class="gt_sourcenotes">
            <td class="gt_sourcenote" style="background-color: #F5DEB3;" colspan="8">Source note #1</td>
          </tr>
          <tr class="gt_sourcenotes">
            <td class="gt_sourcenote" style="background-color: #F5DEB3;" colspan="8">Source note #2</td>
          </tr>
        </tfoot>
      </table>

---

    Code
      cat(render_as_html(gt_tbl))
    Output
      <table class="gt_table" data-quarto-disable-processing="false" data-quarto-bootstrap="false">
        <thead>
          <tr class="gt_heading">
            <td colspan="9" class="gt_heading gt_title gt_font_normal" style="background-color: #ADD8E6;"><span class='gt_from_md'>Data listing from <strong>exibble</strong></span></td>
          </tr>
          <tr class="gt_heading">
            <td colspan="9" class="gt_heading gt_subtitle gt_font_normal gt_bottom_border" style="background-color: #00FFFF;"><span class='gt_from_md'><code>exibble</code> is an R dataset</span></td>
          </tr>
          <tr class="gt_col_headings gt_spanner_row">
            <th class="gt_col_heading gt_columns_bottom_border gt_left" rowspan="2" colspan="1" style="background-color: #DCDCDC;" scope="col" id="a::stub">S.L.</th>
            <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="2" colspan="1" style="background-color: #7FFFD4;" scope="col" id="num">num</th>
            <th class="gt_col_heading gt_columns_bottom_border gt_left" rowspan="2" colspan="1" style="background-color: #7FFFD4;" scope="col" id="char">char</th>
            <th class="gt_col_heading gt_columns_bottom_border gt_center" rowspan="2" colspan="1" style="background-color: #7FFFD4;" scope="col" id="fctr">fctr</th>
            <th class="gt_center gt_columns_top_border gt_column_spanner_outer" rowspan="1" colspan="3" style="background-color: #FFFF00;" scope="colgroup" id="timing">
              <div class="gt_column_spanner">timing</div>
            </th>
            <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="2" colspan="1" style="background-color: #7FFFD4;" scope="col" id="currency">currency</th>
            <th class="gt_col_heading gt_columns_bottom_border gt_left" rowspan="2" colspan="1" style="background-color: #7FFFD4;" scope="col" id="row">row</th>
          </tr>
          <tr class="gt_col_headings">
            <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" style="background-color: #7FFFD4;" scope="col" id="date">date</th>
            <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" style="background-color: #7FFFD4;" scope="col" id="time">time</th>
            <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" style="background-color: #7FFFD4;" scope="col" id="datetime">datetime</th>
          </tr>
        </thead>
        <tbody class="gt_table_body">
          <tr class="gt_row_group_first"><td headers="grp_a stub_2_1 stub_1" rowspan="4" class="gt_row gt_left gt_stub_row_group" style="background-color: #E0FFFF;">grp_a</td>
      <td headers="grp_a stub_2_1 num" class="gt_row gt_right" style="background-color: #D9D9D9;">1.111e-01</td>
      <td headers="grp_a stub_2_1 char" class="gt_row gt_left" style="background-color: #CCCCCC;">apricot</td>
      <td headers="grp_a stub_2_1 fctr" class="gt_row gt_center" style="background-color: #BFBFBF;">one</td>
      <td headers="grp_a stub_2_1 date" class="gt_row gt_right" style="background-color: #B3B3B3;">2015-01-15</td>
      <td headers="grp_a stub_2_1 time" class="gt_row gt_right" style="background-color: #A6A6A6;">13:35</td>
      <td headers="grp_a stub_2_1 datetime" class="gt_row gt_right" style="background-color: #999999;">2018-01-01 02:22</td>
      <td headers="grp_a stub_2_1 currency" class="gt_row gt_right" style="background-color: #8C8C8C;">49.950</td>
      <td headers="grp_a stub_2_1 row" class="gt_row gt_left" style="background-color: #7F7F7F;">row_1</td></tr>
          <tr><td headers="grp_a stub_2_2 num" class="gt_row gt_right" style="background-color: #D9D9D9;">2.222e+00</td>
      <td headers="grp_a stub_2_2 char" class="gt_row gt_left" style="background-color: #CCCCCC;">banana</td>
      <td headers="grp_a stub_2_2 fctr" class="gt_row gt_center" style="background-color: #BFBFBF;">two</td>
      <td headers="grp_a stub_2_2 date" class="gt_row gt_right" style="background-color: #B3B3B3;">2015-02-15</td>
      <td headers="grp_a stub_2_2 time" class="gt_row gt_right" style="background-color: #A6A6A6;">14:40</td>
      <td headers="grp_a stub_2_2 datetime" class="gt_row gt_right" style="background-color: #999999;">2018-02-02 14:33</td>
      <td headers="grp_a stub_2_2 currency" class="gt_row gt_right" style="background-color: #8C8C8C;">17.950</td>
      <td headers="grp_a stub_2_2 row" class="gt_row gt_left" style="background-color: #7F7F7F;">row_2</td></tr>
          <tr><td headers="grp_a stub_2_3 num" class="gt_row gt_right" style="background-color: #D9D9D9;">3.333e+01</td>
      <td headers="grp_a stub_2_3 char" class="gt_row gt_left" style="background-color: #CCCCCC;">coconut</td>
      <td headers="grp_a stub_2_3 fctr" class="gt_row gt_center" style="background-color: #BFBFBF;">three</td>
      <td headers="grp_a stub_2_3 date" class="gt_row gt_right" style="background-color: #B3B3B3;">2015-03-15</td>
      <td headers="grp_a stub_2_3 time" class="gt_row gt_right" style="background-color: #A6A6A6;">15:45</td>
      <td headers="grp_a stub_2_3 datetime" class="gt_row gt_right" style="background-color: #999999;">2018-03-03 03:44</td>
      <td headers="grp_a stub_2_3 currency" class="gt_row gt_right" style="background-color: #8C8C8C;">1.390</td>
      <td headers="grp_a stub_2_3 row" class="gt_row gt_left" style="background-color: #7F7F7F;">row_3</td></tr>
          <tr><td headers="grp_a stub_2_4 num" class="gt_row gt_right" style="background-color: #D9D9D9;">4.444e+02</td>
      <td headers="grp_a stub_2_4 char" class="gt_row gt_left" style="background-color: #CCCCCC;">durian</td>
      <td headers="grp_a stub_2_4 fctr" class="gt_row gt_center" style="background-color: #BFBFBF;">four</td>
      <td headers="grp_a stub_2_4 date" class="gt_row gt_right" style="background-color: #B3B3B3;">2015-04-15</td>
      <td headers="grp_a stub_2_4 time" class="gt_row gt_right" style="background-color: #A6A6A6;">16:50</td>
      <td headers="grp_a stub_2_4 datetime" class="gt_row gt_right" style="background-color: #999999;">2018-04-04 15:55</td>
      <td headers="grp_a stub_2_4 currency" class="gt_row gt_right" style="background-color: #8C8C8C;">65100.000</td>
      <td headers="grp_a stub_2_4 row" class="gt_row gt_left" style="background-color: #7F7F7F;">row_4</td></tr>
          <tr class="gt_row_group_first"><td headers="grp_b stub_2_5 stub_1" rowspan="4" class="gt_row gt_left gt_stub_row_group" style="background-color: #E0FFFF;">grp_b</td>
      <td headers="grp_b stub_2_5 num" class="gt_row gt_right" style="background-color: #D9D9D9;">5.550e+03</td>
      <td headers="grp_b stub_2_5 char" class="gt_row gt_left" style="background-color: #CCCCCC;">NA</td>
      <td headers="grp_b stub_2_5 fctr" class="gt_row gt_center" style="background-color: #BFBFBF;">five</td>
      <td headers="grp_b stub_2_5 date" class="gt_row gt_right" style="background-color: #B3B3B3;">2015-05-15</td>
      <td headers="grp_b stub_2_5 time" class="gt_row gt_right" style="background-color: #A6A6A6;">17:55</td>
      <td headers="grp_b stub_2_5 datetime" class="gt_row gt_right" style="background-color: #999999;">2018-05-05 04:00</td>
      <td headers="grp_b stub_2_5 currency" class="gt_row gt_right" style="background-color: #8C8C8C;">1325.810</td>
      <td headers="grp_b stub_2_5 row" class="gt_row gt_left" style="background-color: #7F7F7F;">row_5</td></tr>
          <tr><td headers="grp_b stub_2_6 num" class="gt_row gt_right" style="background-color: #D9D9D9;">NA</td>
      <td headers="grp_b stub_2_6 char" class="gt_row gt_left" style="background-color: #CCCCCC;">fig</td>
      <td headers="grp_b stub_2_6 fctr" class="gt_row gt_center" style="background-color: #BFBFBF;">six</td>
      <td headers="grp_b stub_2_6 date" class="gt_row gt_right" style="background-color: #B3B3B3;">2015-06-15</td>
      <td headers="grp_b stub_2_6 time" class="gt_row gt_right" style="background-color: #A6A6A6;">NA</td>
      <td headers="grp_b stub_2_6 datetime" class="gt_row gt_right" style="background-color: #999999;">2018-06-06 16:11</td>
      <td headers="grp_b stub_2_6 currency" class="gt_row gt_right" style="background-color: #8C8C8C;">13.255</td>
      <td headers="grp_b stub_2_6 row" class="gt_row gt_left" style="background-color: #7F7F7F;">row_6</td></tr>
          <tr><td headers="grp_b stub_2_7 num" class="gt_row gt_right" style="background-color: #D9D9D9;">7.770e+05</td>
      <td headers="grp_b stub_2_7 char" class="gt_row gt_left" style="background-color: #CCCCCC;">grapefruit</td>
      <td headers="grp_b stub_2_7 fctr" class="gt_row gt_center" style="background-color: #BFBFBF;">seven</td>
      <td headers="grp_b stub_2_7 date" class="gt_row gt_right" style="background-color: #B3B3B3;">NA</td>
      <td headers="grp_b stub_2_7 time" class="gt_row gt_right" style="background-color: #A6A6A6;">19:10</td>
      <td headers="grp_b stub_2_7 datetime" class="gt_row gt_right" style="background-color: #999999;">2018-07-07 05:22</td>
      <td headers="grp_b stub_2_7 currency" class="gt_row gt_right" style="background-color: #8C8C8C;">NA</td>
      <td headers="grp_b stub_2_7 row" class="gt_row gt_left" style="background-color: #7F7F7F;">row_7</td></tr>
          <tr><td headers="grp_b stub_2_8 num" class="gt_row gt_right" style="background-color: #D9D9D9;">8.880e+06</td>
      <td headers="grp_b stub_2_8 char" class="gt_row gt_left" style="background-color: #CCCCCC;">honeydew</td>
      <td headers="grp_b stub_2_8 fctr" class="gt_row gt_center" style="background-color: #BFBFBF;">eight</td>
      <td headers="grp_b stub_2_8 date" class="gt_row gt_right" style="background-color: #B3B3B3;">2015-08-15</td>
      <td headers="grp_b stub_2_8 time" class="gt_row gt_right" style="background-color: #A6A6A6;">20:20</td>
      <td headers="grp_b stub_2_8 datetime" class="gt_row gt_right" style="background-color: #999999;">NA</td>
      <td headers="grp_b stub_2_8 currency" class="gt_row gt_right" style="background-color: #8C8C8C;">0.440</td>
      <td headers="grp_b stub_2_8 row" class="gt_row gt_left" style="background-color: #7F7F7F;">row_8</td></tr>
        </tbody>
        <tfoot>
          <tr class="gt_sourcenotes">
            <td class="gt_sourcenote" style="background-color: #F5DEB3;" colspan="9">Source note #1</td>
          </tr>
          <tr class="gt_sourcenotes">
            <td class="gt_sourcenote" style="background-color: #F5DEB3;" colspan="9">Source note #2</td>
          </tr>
        </tfoot>
      </table>

---

    Code
      cat(render_as_html(gt_tbl))
    Output
      <table class="gt_table" data-quarto-disable-processing="false" data-quarto-bootstrap="false">
        <thead>
          <tr class="gt_heading">
            <td colspan="9" class="gt_heading gt_title gt_font_normal" style="background-color: #ADD8E6;"><span class='gt_from_md'>Data listing from <strong>exibble</strong></span></td>
          </tr>
          <tr class="gt_heading">
            <td colspan="9" class="gt_heading gt_subtitle gt_font_normal gt_bottom_border" style="background-color: #00FFFF;"><span class='gt_from_md'><code>exibble</code> is an R dataset</span></td>
          </tr>
          <tr class="gt_col_headings gt_spanner_row">
            <th class="gt_col_heading gt_columns_bottom_border gt_left" rowspan="2" colspan="1" style="background-color: #DCDCDC;" scope="col" id="a::stub">S.L.</th>
            <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="2" colspan="1" style="background-color: #7FFFD4;" scope="col" id="num">num</th>
            <th class="gt_col_heading gt_columns_bottom_border gt_left" rowspan="2" colspan="1" style="background-color: #7FFFD4;" scope="col" id="char">char</th>
            <th class="gt_col_heading gt_columns_bottom_border gt_center" rowspan="2" colspan="1" style="background-color: #7FFFD4;" scope="col" id="fctr">fctr</th>
            <th class="gt_center gt_columns_top_border gt_column_spanner_outer" rowspan="1" colspan="3" style="background-color: #FFFF00;" scope="colgroup" id="timing">
              <div class="gt_column_spanner">timing</div>
            </th>
            <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="2" colspan="1" style="background-color: #7FFFD4;" scope="col" id="currency">currency</th>
            <th class="gt_col_heading gt_columns_bottom_border gt_left" rowspan="2" colspan="1" style="background-color: #7FFFD4;" scope="col" id="group">group</th>
          </tr>
          <tr class="gt_col_headings">
            <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" style="background-color: #7FFFD4;" scope="col" id="date">date</th>
            <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" style="background-color: #7FFFD4;" scope="col" id="time">time</th>
            <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" style="background-color: #7FFFD4;" scope="col" id="datetime">datetime</th>
          </tr>
        </thead>
        <tbody class="gt_table_body">
          <tr><th id="stub_1_1" scope="row" class="gt_row gt_left gt_stub" style="background-color: #FFDAB9;">row_1</th>
      <td headers="stub_1_1 num" class="gt_row gt_right" style="background-color: #D9D9D9;">1.111e-01</td>
      <td headers="stub_1_1 char" class="gt_row gt_left" style="background-color: #CCCCCC;">apricot</td>
      <td headers="stub_1_1 fctr" class="gt_row gt_center" style="background-color: #BFBFBF;">one</td>
      <td headers="stub_1_1 date" class="gt_row gt_right" style="background-color: #B3B3B3;">2015-01-15</td>
      <td headers="stub_1_1 time" class="gt_row gt_right" style="background-color: #A6A6A6;">13:35</td>
      <td headers="stub_1_1 datetime" class="gt_row gt_right" style="background-color: #999999;">2018-01-01 02:22</td>
      <td headers="stub_1_1 currency" class="gt_row gt_right" style="background-color: #8C8C8C;">49.950</td>
      <td headers="stub_1_1 group" class="gt_row gt_left" style="background-color: #737373;">grp_a</td></tr>
          <tr><th id="stub_1_2" scope="row" class="gt_row gt_left gt_stub" style="background-color: #FFDAB9;">row_2</th>
      <td headers="stub_1_2 num" class="gt_row gt_right" style="background-color: #D9D9D9;">2.222e+00</td>
      <td headers="stub_1_2 char" class="gt_row gt_left" style="background-color: #CCCCCC;">banana</td>
      <td headers="stub_1_2 fctr" class="gt_row gt_center" style="background-color: #BFBFBF;">two</td>
      <td headers="stub_1_2 date" class="gt_row gt_right" style="background-color: #B3B3B3;">2015-02-15</td>
      <td headers="stub_1_2 time" class="gt_row gt_right" style="background-color: #A6A6A6;">14:40</td>
      <td headers="stub_1_2 datetime" class="gt_row gt_right" style="background-color: #999999;">2018-02-02 14:33</td>
      <td headers="stub_1_2 currency" class="gt_row gt_right" style="background-color: #8C8C8C;">17.950</td>
      <td headers="stub_1_2 group" class="gt_row gt_left" style="background-color: #737373;">grp_a</td></tr>
          <tr><th id="stub_1_3" scope="row" class="gt_row gt_left gt_stub" style="background-color: #FFDAB9;">row_3</th>
      <td headers="stub_1_3 num" class="gt_row gt_right" style="background-color: #D9D9D9;">3.333e+01</td>
      <td headers="stub_1_3 char" class="gt_row gt_left" style="background-color: #CCCCCC;">coconut</td>
      <td headers="stub_1_3 fctr" class="gt_row gt_center" style="background-color: #BFBFBF;">three</td>
      <td headers="stub_1_3 date" class="gt_row gt_right" style="background-color: #B3B3B3;">2015-03-15</td>
      <td headers="stub_1_3 time" class="gt_row gt_right" style="background-color: #A6A6A6;">15:45</td>
      <td headers="stub_1_3 datetime" class="gt_row gt_right" style="background-color: #999999;">2018-03-03 03:44</td>
      <td headers="stub_1_3 currency" class="gt_row gt_right" style="background-color: #8C8C8C;">1.390</td>
      <td headers="stub_1_3 group" class="gt_row gt_left" style="background-color: #737373;">grp_a</td></tr>
          <tr><th id="stub_1_4" scope="row" class="gt_row gt_left gt_stub" style="background-color: #FFDAB9;">row_4</th>
      <td headers="stub_1_4 num" class="gt_row gt_right" style="background-color: #D9D9D9;">4.444e+02</td>
      <td headers="stub_1_4 char" class="gt_row gt_left" style="background-color: #CCCCCC;">durian</td>
      <td headers="stub_1_4 fctr" class="gt_row gt_center" style="background-color: #BFBFBF;">four</td>
      <td headers="stub_1_4 date" class="gt_row gt_right" style="background-color: #B3B3B3;">2015-04-15</td>
      <td headers="stub_1_4 time" class="gt_row gt_right" style="background-color: #A6A6A6;">16:50</td>
      <td headers="stub_1_4 datetime" class="gt_row gt_right" style="background-color: #999999;">2018-04-04 15:55</td>
      <td headers="stub_1_4 currency" class="gt_row gt_right" style="background-color: #8C8C8C;">65100.000</td>
      <td headers="stub_1_4 group" class="gt_row gt_left" style="background-color: #737373;">grp_a</td></tr>
          <tr><th id="stub_1_5" scope="row" class="gt_row gt_left gt_stub" style="background-color: #FFDAB9;">row_5</th>
      <td headers="stub_1_5 num" class="gt_row gt_right" style="background-color: #D9D9D9;">5.550e+03</td>
      <td headers="stub_1_5 char" class="gt_row gt_left" style="background-color: #CCCCCC;">NA</td>
      <td headers="stub_1_5 fctr" class="gt_row gt_center" style="background-color: #BFBFBF;">five</td>
      <td headers="stub_1_5 date" class="gt_row gt_right" style="background-color: #B3B3B3;">2015-05-15</td>
      <td headers="stub_1_5 time" class="gt_row gt_right" style="background-color: #A6A6A6;">17:55</td>
      <td headers="stub_1_5 datetime" class="gt_row gt_right" style="background-color: #999999;">2018-05-05 04:00</td>
      <td headers="stub_1_5 currency" class="gt_row gt_right" style="background-color: #8C8C8C;">1325.810</td>
      <td headers="stub_1_5 group" class="gt_row gt_left" style="background-color: #737373;">grp_b</td></tr>
          <tr><th id="stub_1_6" scope="row" class="gt_row gt_left gt_stub" style="background-color: #FFDAB9;">row_6</th>
      <td headers="stub_1_6 num" class="gt_row gt_right" style="background-color: #D9D9D9;">NA</td>
      <td headers="stub_1_6 char" class="gt_row gt_left" style="background-color: #CCCCCC;">fig</td>
      <td headers="stub_1_6 fctr" class="gt_row gt_center" style="background-color: #BFBFBF;">six</td>
      <td headers="stub_1_6 date" class="gt_row gt_right" style="background-color: #B3B3B3;">2015-06-15</td>
      <td headers="stub_1_6 time" class="gt_row gt_right" style="background-color: #A6A6A6;">NA</td>
      <td headers="stub_1_6 datetime" class="gt_row gt_right" style="background-color: #999999;">2018-06-06 16:11</td>
      <td headers="stub_1_6 currency" class="gt_row gt_right" style="background-color: #8C8C8C;">13.255</td>
      <td headers="stub_1_6 group" class="gt_row gt_left" style="background-color: #737373;">grp_b</td></tr>
          <tr><th id="stub_1_7" scope="row" class="gt_row gt_left gt_stub" style="background-color: #FFDAB9;">row_7</th>
      <td headers="stub_1_7 num" class="gt_row gt_right" style="background-color: #D9D9D9;">7.770e+05</td>
      <td headers="stub_1_7 char" class="gt_row gt_left" style="background-color: #CCCCCC;">grapefruit</td>
      <td headers="stub_1_7 fctr" class="gt_row gt_center" style="background-color: #BFBFBF;">seven</td>
      <td headers="stub_1_7 date" class="gt_row gt_right" style="background-color: #B3B3B3;">NA</td>
      <td headers="stub_1_7 time" class="gt_row gt_right" style="background-color: #A6A6A6;">19:10</td>
      <td headers="stub_1_7 datetime" class="gt_row gt_right" style="background-color: #999999;">2018-07-07 05:22</td>
      <td headers="stub_1_7 currency" class="gt_row gt_right" style="background-color: #8C8C8C;">NA</td>
      <td headers="stub_1_7 group" class="gt_row gt_left" style="background-color: #737373;">grp_b</td></tr>
          <tr><th id="stub_1_8" scope="row" class="gt_row gt_left gt_stub" style="background-color: #FFDAB9;">row_8</th>
      <td headers="stub_1_8 num" class="gt_row gt_right" style="background-color: #D9D9D9;">8.880e+06</td>
      <td headers="stub_1_8 char" class="gt_row gt_left" style="background-color: #CCCCCC;">honeydew</td>
      <td headers="stub_1_8 fctr" class="gt_row gt_center" style="background-color: #BFBFBF;">eight</td>
      <td headers="stub_1_8 date" class="gt_row gt_right" style="background-color: #B3B3B3;">2015-08-15</td>
      <td headers="stub_1_8 time" class="gt_row gt_right" style="background-color: #A6A6A6;">20:20</td>
      <td headers="stub_1_8 datetime" class="gt_row gt_right" style="background-color: #999999;">NA</td>
      <td headers="stub_1_8 currency" class="gt_row gt_right" style="background-color: #8C8C8C;">0.440</td>
      <td headers="stub_1_8 group" class="gt_row gt_left" style="background-color: #737373;">grp_b</td></tr>
        </tbody>
        <tfoot>
          <tr class="gt_sourcenotes">
            <td class="gt_sourcenote" style="background-color: #F5DEB3;" colspan="9">Source note #1</td>
          </tr>
          <tr class="gt_sourcenotes">
            <td class="gt_sourcenote" style="background-color: #F5DEB3;" colspan="9">Source note #2</td>
          </tr>
        </tfoot>
      </table>

---

    Code
      cat(render_as_html(gt_tbl))
    Output
      <table class="gt_table" data-quarto-disable-processing="false" data-quarto-bootstrap="false">
        <thead>
          <tr class="gt_heading">
            <td colspan="9" class="gt_heading gt_title gt_font_normal" style="background-color: #ADD8E6;"><span class='gt_from_md'>Data listing from <strong>exibble</strong></span></td>
          </tr>
          <tr class="gt_heading">
            <td colspan="9" class="gt_heading gt_subtitle gt_font_normal gt_bottom_border" style="background-color: #00FFFF;"><span class='gt_from_md'><code>exibble</code> is an R dataset</span></td>
          </tr>
          <tr class="gt_col_headings gt_spanner_row">
            <th class="gt_col_heading gt_columns_bottom_border gt_left" rowspan="2" colspan="1" style="background-color: #DCDCDC;" scope="col" id="a::stub">S.L.</th>
            <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="2" colspan="1" style="background-color: #7FFFD4;" scope="col" id="num">num</th>
            <th class="gt_col_heading gt_columns_bottom_border gt_left" rowspan="2" colspan="1" style="background-color: #7FFFD4;" scope="col" id="char">char</th>
            <th class="gt_col_heading gt_columns_bottom_border gt_center" rowspan="2" colspan="1" style="background-color: #7FFFD4;" scope="col" id="fctr">fctr</th>
            <th class="gt_center gt_columns_top_border gt_column_spanner_outer" rowspan="1" colspan="3" style="background-color: #FFFF00;" scope="colgroup" id="timing">
              <div class="gt_column_spanner">timing</div>
            </th>
            <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="2" colspan="1" style="background-color: #7FFFD4;" scope="col" id="currency">currency</th>
            <th class="gt_col_heading gt_columns_bottom_border gt_left" rowspan="2" colspan="1" style="background-color: #7FFFD4;" scope="col" id="group">group</th>
          </tr>
          <tr class="gt_col_headings">
            <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" style="background-color: #7FFFD4;" scope="col" id="date">date</th>
            <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" style="background-color: #7FFFD4;" scope="col" id="time">time</th>
            <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" style="background-color: #7FFFD4;" scope="col" id="datetime">datetime</th>
          </tr>
        </thead>
        <tbody class="gt_table_body">
          <tr><th id="stub_1_1" scope="row" class="gt_row gt_left gt_stub" style="background-color: #FFDAB9;">row_1</th>
      <td headers="stub_1_1 num" class="gt_row gt_right" style="background-color: #D9D9D9;">1.111e-01</td>
      <td headers="stub_1_1 char" class="gt_row gt_left" style="background-color: #CCCCCC;">apricot</td>
      <td headers="stub_1_1 fctr" class="gt_row gt_center" style="background-color: #BFBFBF;">one</td>
      <td headers="stub_1_1 date" class="gt_row gt_right" style="background-color: #B3B3B3;">2015-01-15</td>
      <td headers="stub_1_1 time" class="gt_row gt_right" style="background-color: #A6A6A6;">13:35</td>
      <td headers="stub_1_1 datetime" class="gt_row gt_right" style="background-color: #999999;">2018-01-01 02:22</td>
      <td headers="stub_1_1 currency" class="gt_row gt_right" style="background-color: #8C8C8C;">49.950</td>
      <td headers="stub_1_1 group" class="gt_row gt_left" style="background-color: #737373;">grp_a</td></tr>
          <tr><th id="stub_1_2" scope="row" class="gt_row gt_left gt_stub" style="background-color: #FFDAB9;">row_2</th>
      <td headers="stub_1_2 num" class="gt_row gt_right" style="background-color: #D9D9D9;">2.222e+00</td>
      <td headers="stub_1_2 char" class="gt_row gt_left" style="background-color: #CCCCCC;">banana</td>
      <td headers="stub_1_2 fctr" class="gt_row gt_center" style="background-color: #BFBFBF;">two</td>
      <td headers="stub_1_2 date" class="gt_row gt_right" style="background-color: #B3B3B3;">2015-02-15</td>
      <td headers="stub_1_2 time" class="gt_row gt_right" style="background-color: #A6A6A6;">14:40</td>
      <td headers="stub_1_2 datetime" class="gt_row gt_right" style="background-color: #999999;">2018-02-02 14:33</td>
      <td headers="stub_1_2 currency" class="gt_row gt_right" style="background-color: #8C8C8C;">17.950</td>
      <td headers="stub_1_2 group" class="gt_row gt_left" style="background-color: #737373;">grp_a</td></tr>
          <tr><th id="stub_1_3" scope="row" class="gt_row gt_left gt_stub" style="background-color: #FFDAB9;">row_3</th>
      <td headers="stub_1_3 num" class="gt_row gt_right" style="background-color: #D9D9D9;">3.333e+01</td>
      <td headers="stub_1_3 char" class="gt_row gt_left" style="background-color: #CCCCCC;">coconut</td>
      <td headers="stub_1_3 fctr" class="gt_row gt_center" style="background-color: #BFBFBF;">three</td>
      <td headers="stub_1_3 date" class="gt_row gt_right" style="background-color: #B3B3B3;">2015-03-15</td>
      <td headers="stub_1_3 time" class="gt_row gt_right" style="background-color: #A6A6A6;">15:45</td>
      <td headers="stub_1_3 datetime" class="gt_row gt_right" style="background-color: #999999;">2018-03-03 03:44</td>
      <td headers="stub_1_3 currency" class="gt_row gt_right" style="background-color: #8C8C8C;">1.390</td>
      <td headers="stub_1_3 group" class="gt_row gt_left" style="background-color: #737373;">grp_a</td></tr>
          <tr><th id="stub_1_4" scope="row" class="gt_row gt_left gt_stub" style="background-color: #FFDAB9;">row_4</th>
      <td headers="stub_1_4 num" class="gt_row gt_right" style="background-color: #D9D9D9;">4.444e+02</td>
      <td headers="stub_1_4 char" class="gt_row gt_left" style="background-color: #CCCCCC;">durian</td>
      <td headers="stub_1_4 fctr" class="gt_row gt_center" style="background-color: #BFBFBF;">four</td>
      <td headers="stub_1_4 date" class="gt_row gt_right" style="background-color: #B3B3B3;">2015-04-15</td>
      <td headers="stub_1_4 time" class="gt_row gt_right" style="background-color: #A6A6A6;">16:50</td>
      <td headers="stub_1_4 datetime" class="gt_row gt_right" style="background-color: #999999;">2018-04-04 15:55</td>
      <td headers="stub_1_4 currency" class="gt_row gt_right" style="background-color: #8C8C8C;">65100.000</td>
      <td headers="stub_1_4 group" class="gt_row gt_left" style="background-color: #737373;">grp_a</td></tr>
          <tr><th id="stub_1_5" scope="row" class="gt_row gt_left gt_stub" style="background-color: #FFDAB9;">row_5</th>
      <td headers="stub_1_5 num" class="gt_row gt_right" style="background-color: #D9D9D9;">5.550e+03</td>
      <td headers="stub_1_5 char" class="gt_row gt_left" style="background-color: #CCCCCC;">NA</td>
      <td headers="stub_1_5 fctr" class="gt_row gt_center" style="background-color: #BFBFBF;">five</td>
      <td headers="stub_1_5 date" class="gt_row gt_right" style="background-color: #B3B3B3;">2015-05-15</td>
      <td headers="stub_1_5 time" class="gt_row gt_right" style="background-color: #A6A6A6;">17:55</td>
      <td headers="stub_1_5 datetime" class="gt_row gt_right" style="background-color: #999999;">2018-05-05 04:00</td>
      <td headers="stub_1_5 currency" class="gt_row gt_right" style="background-color: #8C8C8C;">1325.810</td>
      <td headers="stub_1_5 group" class="gt_row gt_left" style="background-color: #737373;">grp_b</td></tr>
          <tr><th id="stub_1_6" scope="row" class="gt_row gt_left gt_stub" style="background-color: #FFDAB9;">row_6</th>
      <td headers="stub_1_6 num" class="gt_row gt_right" style="background-color: #D9D9D9;">NA</td>
      <td headers="stub_1_6 char" class="gt_row gt_left" style="background-color: #CCCCCC;">fig</td>
      <td headers="stub_1_6 fctr" class="gt_row gt_center" style="background-color: #BFBFBF;">six</td>
      <td headers="stub_1_6 date" class="gt_row gt_right" style="background-color: #B3B3B3;">2015-06-15</td>
      <td headers="stub_1_6 time" class="gt_row gt_right" style="background-color: #A6A6A6;">NA</td>
      <td headers="stub_1_6 datetime" class="gt_row gt_right" style="background-color: #999999;">2018-06-06 16:11</td>
      <td headers="stub_1_6 currency" class="gt_row gt_right" style="background-color: #8C8C8C;">13.255</td>
      <td headers="stub_1_6 group" class="gt_row gt_left" style="background-color: #737373;">grp_b</td></tr>
          <tr><th id="stub_1_7" scope="row" class="gt_row gt_left gt_stub" style="background-color: #FFDAB9;">row_7</th>
      <td headers="stub_1_7 num" class="gt_row gt_right" style="background-color: #D9D9D9;">7.770e+05</td>
      <td headers="stub_1_7 char" class="gt_row gt_left" style="background-color: #CCCCCC;">grapefruit</td>
      <td headers="stub_1_7 fctr" class="gt_row gt_center" style="background-color: #BFBFBF;">seven</td>
      <td headers="stub_1_7 date" class="gt_row gt_right" style="background-color: #B3B3B3;">NA</td>
      <td headers="stub_1_7 time" class="gt_row gt_right" style="background-color: #A6A6A6;">19:10</td>
      <td headers="stub_1_7 datetime" class="gt_row gt_right" style="background-color: #999999;">2018-07-07 05:22</td>
      <td headers="stub_1_7 currency" class="gt_row gt_right" style="background-color: #8C8C8C;">NA</td>
      <td headers="stub_1_7 group" class="gt_row gt_left" style="background-color: #737373;">grp_b</td></tr>
          <tr><th id="stub_1_8" scope="row" class="gt_row gt_left gt_stub" style="background-color: #FFDAB9;">row_8</th>
      <td headers="stub_1_8 num" class="gt_row gt_right" style="background-color: #D9D9D9;">8.880e+06</td>
      <td headers="stub_1_8 char" class="gt_row gt_left" style="background-color: #CCCCCC;">honeydew</td>
      <td headers="stub_1_8 fctr" class="gt_row gt_center" style="background-color: #BFBFBF;">eight</td>
      <td headers="stub_1_8 date" class="gt_row gt_right" style="background-color: #B3B3B3;">2015-08-15</td>
      <td headers="stub_1_8 time" class="gt_row gt_right" style="background-color: #A6A6A6;">20:20</td>
      <td headers="stub_1_8 datetime" class="gt_row gt_right" style="background-color: #999999;">NA</td>
      <td headers="stub_1_8 currency" class="gt_row gt_right" style="background-color: #8C8C8C;">0.440</td>
      <td headers="stub_1_8 group" class="gt_row gt_left" style="background-color: #737373;">grp_b</td></tr>
        </tbody>
        <tfoot>
          <tr class="gt_sourcenotes">
            <td class="gt_sourcenote" style="background-color: #F5DEB3;" colspan="9">Source note #1</td>
          </tr>
          <tr class="gt_sourcenotes">
            <td class="gt_sourcenote" style="background-color: #F5DEB3;" colspan="9">Source note #2</td>
          </tr>
        </tfoot>
      </table>

---

    Code
      cat(render_as_html(gt_tbl))
    Output
      <table class="gt_table" data-quarto-disable-processing="false" data-quarto-bootstrap="false">
        <thead>
          <tr class="gt_heading">
            <td colspan="8" class="gt_heading gt_title gt_font_normal" style="background-color: #ADD8E6;"><span class='gt_from_md'>Data listing from <strong>exibble</strong></span></td>
          </tr>
          <tr class="gt_heading">
            <td colspan="8" class="gt_heading gt_subtitle gt_font_normal gt_bottom_border" style="background-color: #00FFFF;"><span class='gt_from_md'><code>exibble</code> is an R dataset</span></td>
          </tr>
          <tr class="gt_col_headings gt_spanner_row">
            <th class="gt_col_heading gt_columns_bottom_border gt_left" rowspan="2" colspan="1" style="background-color: #DCDCDC;" scope="col" id="a::stub">S.L.</th>
            <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="2" colspan="1" style="background-color: #7FFFD4;" scope="col" id="num">num</th>
            <th class="gt_col_heading gt_columns_bottom_border gt_left" rowspan="2" colspan="1" style="background-color: #7FFFD4;" scope="col" id="char">char</th>
            <th class="gt_col_heading gt_columns_bottom_border gt_center" rowspan="2" colspan="1" style="background-color: #7FFFD4;" scope="col" id="fctr">fctr</th>
            <th class="gt_center gt_columns_top_border gt_column_spanner_outer" rowspan="1" colspan="3" style="background-color: #FFFF00;" scope="colgroup" id="timing">
              <div class="gt_column_spanner">timing</div>
            </th>
            <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="2" colspan="1" style="background-color: #7FFFD4;" scope="col" id="currency">currency</th>
          </tr>
          <tr class="gt_col_headings">
            <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" style="background-color: #7FFFD4;" scope="col" id="date">date</th>
            <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" style="background-color: #7FFFD4;" scope="col" id="time">time</th>
            <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" style="background-color: #7FFFD4;" scope="col" id="datetime">datetime</th>
          </tr>
        </thead>
        <tbody class="gt_table_body">
          <tr class="gt_group_heading_row">
            <th colspan="8" class="gt_group_heading" style="background-color: #E0FFFF;" scope="colgroup" id="grp_a">grp_a</th>
          </tr>
          <tr class="gt_row_group_first"><th id="stub_1_1" scope="row" class="gt_row gt_left gt_stub" style="background-color: #FFDAB9;">row_1</th>
      <td headers="grp_a stub_1_1 num" class="gt_row gt_right" style="background-color: #D9D9D9;">1.111e-01</td>
      <td headers="grp_a stub_1_1 char" class="gt_row gt_left" style="background-color: #CCCCCC;">apricot</td>
      <td headers="grp_a stub_1_1 fctr" class="gt_row gt_center" style="background-color: #BFBFBF;">one</td>
      <td headers="grp_a stub_1_1 date" class="gt_row gt_right" style="background-color: #B3B3B3;">2015-01-15</td>
      <td headers="grp_a stub_1_1 time" class="gt_row gt_right" style="background-color: #A6A6A6;">13:35</td>
      <td headers="grp_a stub_1_1 datetime" class="gt_row gt_right" style="background-color: #999999;">2018-01-01 02:22</td>
      <td headers="grp_a stub_1_1 currency" class="gt_row gt_right" style="background-color: #8C8C8C;">49.950</td></tr>
          <tr><th id="stub_1_2" scope="row" class="gt_row gt_left gt_stub" style="background-color: #FFDAB9;">row_2</th>
      <td headers="grp_a stub_1_2 num" class="gt_row gt_right" style="background-color: #D9D9D9;">2.222e+00</td>
      <td headers="grp_a stub_1_2 char" class="gt_row gt_left" style="background-color: #CCCCCC;">banana</td>
      <td headers="grp_a stub_1_2 fctr" class="gt_row gt_center" style="background-color: #BFBFBF;">two</td>
      <td headers="grp_a stub_1_2 date" class="gt_row gt_right" style="background-color: #B3B3B3;">2015-02-15</td>
      <td headers="grp_a stub_1_2 time" class="gt_row gt_right" style="background-color: #A6A6A6;">14:40</td>
      <td headers="grp_a stub_1_2 datetime" class="gt_row gt_right" style="background-color: #999999;">2018-02-02 14:33</td>
      <td headers="grp_a stub_1_2 currency" class="gt_row gt_right" style="background-color: #8C8C8C;">17.950</td></tr>
          <tr><th id="stub_1_3" scope="row" class="gt_row gt_left gt_stub" style="background-color: #FFDAB9;">row_3</th>
      <td headers="grp_a stub_1_3 num" class="gt_row gt_right" style="background-color: #D9D9D9;">3.333e+01</td>
      <td headers="grp_a stub_1_3 char" class="gt_row gt_left" style="background-color: #CCCCCC;">coconut</td>
      <td headers="grp_a stub_1_3 fctr" class="gt_row gt_center" style="background-color: #BFBFBF;">three</td>
      <td headers="grp_a stub_1_3 date" class="gt_row gt_right" style="background-color: #B3B3B3;">2015-03-15</td>
      <td headers="grp_a stub_1_3 time" class="gt_row gt_right" style="background-color: #A6A6A6;">15:45</td>
      <td headers="grp_a stub_1_3 datetime" class="gt_row gt_right" style="background-color: #999999;">2018-03-03 03:44</td>
      <td headers="grp_a stub_1_3 currency" class="gt_row gt_right" style="background-color: #8C8C8C;">1.390</td></tr>
          <tr><th id="stub_1_4" scope="row" class="gt_row gt_left gt_stub" style="background-color: #FFDAB9;">row_4</th>
      <td headers="grp_a stub_1_4 num" class="gt_row gt_right" style="background-color: #D9D9D9;">4.444e+02</td>
      <td headers="grp_a stub_1_4 char" class="gt_row gt_left" style="background-color: #CCCCCC;">durian</td>
      <td headers="grp_a stub_1_4 fctr" class="gt_row gt_center" style="background-color: #BFBFBF;">four</td>
      <td headers="grp_a stub_1_4 date" class="gt_row gt_right" style="background-color: #B3B3B3;">2015-04-15</td>
      <td headers="grp_a stub_1_4 time" class="gt_row gt_right" style="background-color: #A6A6A6;">16:50</td>
      <td headers="grp_a stub_1_4 datetime" class="gt_row gt_right" style="background-color: #999999;">2018-04-04 15:55</td>
      <td headers="grp_a stub_1_4 currency" class="gt_row gt_right" style="background-color: #8C8C8C;">65100.000</td></tr>
          <tr class="gt_group_heading_row">
            <th colspan="8" class="gt_group_heading" style="background-color: #E0FFFF;" scope="colgroup" id="grp_b">grp_b</th>
          </tr>
          <tr class="gt_row_group_first"><th id="stub_1_5" scope="row" class="gt_row gt_left gt_stub" style="background-color: #FFDAB9;">row_5</th>
      <td headers="grp_b stub_1_5 num" class="gt_row gt_right" style="background-color: #D9D9D9;">5.550e+03</td>
      <td headers="grp_b stub_1_5 char" class="gt_row gt_left" style="background-color: #CCCCCC;">NA</td>
      <td headers="grp_b stub_1_5 fctr" class="gt_row gt_center" style="background-color: #BFBFBF;">five</td>
      <td headers="grp_b stub_1_5 date" class="gt_row gt_right" style="background-color: #B3B3B3;">2015-05-15</td>
      <td headers="grp_b stub_1_5 time" class="gt_row gt_right" style="background-color: #A6A6A6;">17:55</td>
      <td headers="grp_b stub_1_5 datetime" class="gt_row gt_right" style="background-color: #999999;">2018-05-05 04:00</td>
      <td headers="grp_b stub_1_5 currency" class="gt_row gt_right" style="background-color: #8C8C8C;">1325.810</td></tr>
          <tr><th id="stub_1_6" scope="row" class="gt_row gt_left gt_stub" style="background-color: #FFDAB9;">row_6</th>
      <td headers="grp_b stub_1_6 num" class="gt_row gt_right" style="background-color: #D9D9D9;">NA</td>
      <td headers="grp_b stub_1_6 char" class="gt_row gt_left" style="background-color: #CCCCCC;">fig</td>
      <td headers="grp_b stub_1_6 fctr" class="gt_row gt_center" style="background-color: #BFBFBF;">six</td>
      <td headers="grp_b stub_1_6 date" class="gt_row gt_right" style="background-color: #B3B3B3;">2015-06-15</td>
      <td headers="grp_b stub_1_6 time" class="gt_row gt_right" style="background-color: #A6A6A6;">NA</td>
      <td headers="grp_b stub_1_6 datetime" class="gt_row gt_right" style="background-color: #999999;">2018-06-06 16:11</td>
      <td headers="grp_b stub_1_6 currency" class="gt_row gt_right" style="background-color: #8C8C8C;">13.255</td></tr>
          <tr><th id="stub_1_7" scope="row" class="gt_row gt_left gt_stub" style="background-color: #FFDAB9;">row_7</th>
      <td headers="grp_b stub_1_7 num" class="gt_row gt_right" style="background-color: #D9D9D9;">7.770e+05</td>
      <td headers="grp_b stub_1_7 char" class="gt_row gt_left" style="background-color: #CCCCCC;">grapefruit</td>
      <td headers="grp_b stub_1_7 fctr" class="gt_row gt_center" style="background-color: #BFBFBF;">seven</td>
      <td headers="grp_b stub_1_7 date" class="gt_row gt_right" style="background-color: #B3B3B3;">NA</td>
      <td headers="grp_b stub_1_7 time" class="gt_row gt_right" style="background-color: #A6A6A6;">19:10</td>
      <td headers="grp_b stub_1_7 datetime" class="gt_row gt_right" style="background-color: #999999;">2018-07-07 05:22</td>
      <td headers="grp_b stub_1_7 currency" class="gt_row gt_right" style="background-color: #8C8C8C;">NA</td></tr>
          <tr><th id="stub_1_8" scope="row" class="gt_row gt_left gt_stub" style="background-color: #FFDAB9;">row_8</th>
      <td headers="grp_b stub_1_8 num" class="gt_row gt_right" style="background-color: #D9D9D9;">8.880e+06</td>
      <td headers="grp_b stub_1_8 char" class="gt_row gt_left" style="background-color: #CCCCCC;">honeydew</td>
      <td headers="grp_b stub_1_8 fctr" class="gt_row gt_center" style="background-color: #BFBFBF;">eight</td>
      <td headers="grp_b stub_1_8 date" class="gt_row gt_right" style="background-color: #B3B3B3;">2015-08-15</td>
      <td headers="grp_b stub_1_8 time" class="gt_row gt_right" style="background-color: #A6A6A6;">20:20</td>
      <td headers="grp_b stub_1_8 datetime" class="gt_row gt_right" style="background-color: #999999;">NA</td>
      <td headers="grp_b stub_1_8 currency" class="gt_row gt_right" style="background-color: #8C8C8C;">0.440</td></tr>
        </tbody>
        <tfoot>
          <tr class="gt_sourcenotes">
            <td class="gt_sourcenote" style="background-color: #F5DEB3;" colspan="8">Source note #1</td>
          </tr>
          <tr class="gt_sourcenotes">
            <td class="gt_sourcenote" style="background-color: #F5DEB3;" colspan="8">Source note #2</td>
          </tr>
        </tfoot>
      </table>

---

    Code
      cat(render_as_html(gt_tbl))
    Output
      <table class="gt_table" data-quarto-disable-processing="false" data-quarto-bootstrap="false">
        <thead>
          <tr class="gt_heading">
            <td colspan="9" class="gt_heading gt_title gt_font_normal" style="background-color: #ADD8E6;"><span class='gt_from_md'>Data listing from <strong>exibble</strong></span></td>
          </tr>
          <tr class="gt_heading">
            <td colspan="9" class="gt_heading gt_subtitle gt_font_normal gt_bottom_border" style="background-color: #00FFFF;"><span class='gt_from_md'><code>exibble</code> is an R dataset</span></td>
          </tr>
          <tr class="gt_col_headings gt_spanner_row">
            <th class="gt_col_heading gt_columns_bottom_border gt_left" rowspan="2" colspan="2" style="background-color: #DCDCDC;" scope="colgroup" id="a::stub">S.L.</th>
            <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="2" colspan="1" style="background-color: #7FFFD4;" scope="col" id="num">num</th>
            <th class="gt_col_heading gt_columns_bottom_border gt_left" rowspan="2" colspan="1" style="background-color: #7FFFD4;" scope="col" id="char">char</th>
            <th class="gt_col_heading gt_columns_bottom_border gt_center" rowspan="2" colspan="1" style="background-color: #7FFFD4;" scope="col" id="fctr">fctr</th>
            <th class="gt_center gt_columns_top_border gt_column_spanner_outer" rowspan="1" colspan="3" style="background-color: #FFFF00;" scope="colgroup" id="timing">
              <div class="gt_column_spanner">timing</div>
            </th>
            <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="2" colspan="1" style="background-color: #7FFFD4;" scope="col" id="currency">currency</th>
          </tr>
          <tr class="gt_col_headings">
            <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" style="background-color: #7FFFD4;" scope="col" id="date">date</th>
            <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" style="background-color: #7FFFD4;" scope="col" id="time">time</th>
            <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" style="background-color: #7FFFD4;" scope="col" id="datetime">datetime</th>
          </tr>
        </thead>
        <tbody class="gt_table_body">
          <tr class="gt_row_group_first"><td headers="grp_a stub_2_1 stub_1" rowspan="4" class="gt_row gt_left gt_stub_row_group" style="background-color: #E0FFFF;">grp_a</td>
      <th id="stub_2_1" scope="row" class="gt_row gt_left gt_stub" style="background-color: #FFDAB9;">row_1</th>
      <td headers="grp_a stub_2_1 num" class="gt_row gt_right" style="background-color: #D9D9D9;">1.111e-01</td>
      <td headers="grp_a stub_2_1 char" class="gt_row gt_left" style="background-color: #CCCCCC;">apricot</td>
      <td headers="grp_a stub_2_1 fctr" class="gt_row gt_center" style="background-color: #BFBFBF;">one</td>
      <td headers="grp_a stub_2_1 date" class="gt_row gt_right" style="background-color: #B3B3B3;">2015-01-15</td>
      <td headers="grp_a stub_2_1 time" class="gt_row gt_right" style="background-color: #A6A6A6;">13:35</td>
      <td headers="grp_a stub_2_1 datetime" class="gt_row gt_right" style="background-color: #999999;">2018-01-01 02:22</td>
      <td headers="grp_a stub_2_1 currency" class="gt_row gt_right" style="background-color: #8C8C8C;">49.950</td></tr>
          <tr><th id="stub_2_2" scope="row" class="gt_row gt_left gt_stub" style="background-color: #FFDAB9;">row_2</th>
      <td headers="grp_a stub_2_2 num" class="gt_row gt_right" style="background-color: #D9D9D9;">2.222e+00</td>
      <td headers="grp_a stub_2_2 char" class="gt_row gt_left" style="background-color: #CCCCCC;">banana</td>
      <td headers="grp_a stub_2_2 fctr" class="gt_row gt_center" style="background-color: #BFBFBF;">two</td>
      <td headers="grp_a stub_2_2 date" class="gt_row gt_right" style="background-color: #B3B3B3;">2015-02-15</td>
      <td headers="grp_a stub_2_2 time" class="gt_row gt_right" style="background-color: #A6A6A6;">14:40</td>
      <td headers="grp_a stub_2_2 datetime" class="gt_row gt_right" style="background-color: #999999;">2018-02-02 14:33</td>
      <td headers="grp_a stub_2_2 currency" class="gt_row gt_right" style="background-color: #8C8C8C;">17.950</td></tr>
          <tr><th id="stub_2_3" scope="row" class="gt_row gt_left gt_stub" style="background-color: #FFDAB9;">row_3</th>
      <td headers="grp_a stub_2_3 num" class="gt_row gt_right" style="background-color: #D9D9D9;">3.333e+01</td>
      <td headers="grp_a stub_2_3 char" class="gt_row gt_left" style="background-color: #CCCCCC;">coconut</td>
      <td headers="grp_a stub_2_3 fctr" class="gt_row gt_center" style="background-color: #BFBFBF;">three</td>
      <td headers="grp_a stub_2_3 date" class="gt_row gt_right" style="background-color: #B3B3B3;">2015-03-15</td>
      <td headers="grp_a stub_2_3 time" class="gt_row gt_right" style="background-color: #A6A6A6;">15:45</td>
      <td headers="grp_a stub_2_3 datetime" class="gt_row gt_right" style="background-color: #999999;">2018-03-03 03:44</td>
      <td headers="grp_a stub_2_3 currency" class="gt_row gt_right" style="background-color: #8C8C8C;">1.390</td></tr>
          <tr><th id="stub_2_4" scope="row" class="gt_row gt_left gt_stub" style="background-color: #FFDAB9;">row_4</th>
      <td headers="grp_a stub_2_4 num" class="gt_row gt_right" style="background-color: #D9D9D9;">4.444e+02</td>
      <td headers="grp_a stub_2_4 char" class="gt_row gt_left" style="background-color: #CCCCCC;">durian</td>
      <td headers="grp_a stub_2_4 fctr" class="gt_row gt_center" style="background-color: #BFBFBF;">four</td>
      <td headers="grp_a stub_2_4 date" class="gt_row gt_right" style="background-color: #B3B3B3;">2015-04-15</td>
      <td headers="grp_a stub_2_4 time" class="gt_row gt_right" style="background-color: #A6A6A6;">16:50</td>
      <td headers="grp_a stub_2_4 datetime" class="gt_row gt_right" style="background-color: #999999;">2018-04-04 15:55</td>
      <td headers="grp_a stub_2_4 currency" class="gt_row gt_right" style="background-color: #8C8C8C;">65100.000</td></tr>
          <tr class="gt_row_group_first"><td headers="grp_b stub_2_5 stub_1" rowspan="4" class="gt_row gt_left gt_stub_row_group" style="background-color: #E0FFFF;">grp_b</td>
      <th id="stub_2_5" scope="row" class="gt_row gt_left gt_stub" style="background-color: #FFDAB9;">row_5</th>
      <td headers="grp_b stub_2_5 num" class="gt_row gt_right" style="background-color: #D9D9D9;">5.550e+03</td>
      <td headers="grp_b stub_2_5 char" class="gt_row gt_left" style="background-color: #CCCCCC;">NA</td>
      <td headers="grp_b stub_2_5 fctr" class="gt_row gt_center" style="background-color: #BFBFBF;">five</td>
      <td headers="grp_b stub_2_5 date" class="gt_row gt_right" style="background-color: #B3B3B3;">2015-05-15</td>
      <td headers="grp_b stub_2_5 time" class="gt_row gt_right" style="background-color: #A6A6A6;">17:55</td>
      <td headers="grp_b stub_2_5 datetime" class="gt_row gt_right" style="background-color: #999999;">2018-05-05 04:00</td>
      <td headers="grp_b stub_2_5 currency" class="gt_row gt_right" style="background-color: #8C8C8C;">1325.810</td></tr>
          <tr><th id="stub_2_6" scope="row" class="gt_row gt_left gt_stub" style="background-color: #FFDAB9;">row_6</th>
      <td headers="grp_b stub_2_6 num" class="gt_row gt_right" style="background-color: #D9D9D9;">NA</td>
      <td headers="grp_b stub_2_6 char" class="gt_row gt_left" style="background-color: #CCCCCC;">fig</td>
      <td headers="grp_b stub_2_6 fctr" class="gt_row gt_center" style="background-color: #BFBFBF;">six</td>
      <td headers="grp_b stub_2_6 date" class="gt_row gt_right" style="background-color: #B3B3B3;">2015-06-15</td>
      <td headers="grp_b stub_2_6 time" class="gt_row gt_right" style="background-color: #A6A6A6;">NA</td>
      <td headers="grp_b stub_2_6 datetime" class="gt_row gt_right" style="background-color: #999999;">2018-06-06 16:11</td>
      <td headers="grp_b stub_2_6 currency" class="gt_row gt_right" style="background-color: #8C8C8C;">13.255</td></tr>
          <tr><th id="stub_2_7" scope="row" class="gt_row gt_left gt_stub" style="background-color: #FFDAB9;">row_7</th>
      <td headers="grp_b stub_2_7 num" class="gt_row gt_right" style="background-color: #D9D9D9;">7.770e+05</td>
      <td headers="grp_b stub_2_7 char" class="gt_row gt_left" style="background-color: #CCCCCC;">grapefruit</td>
      <td headers="grp_b stub_2_7 fctr" class="gt_row gt_center" style="background-color: #BFBFBF;">seven</td>
      <td headers="grp_b stub_2_7 date" class="gt_row gt_right" style="background-color: #B3B3B3;">NA</td>
      <td headers="grp_b stub_2_7 time" class="gt_row gt_right" style="background-color: #A6A6A6;">19:10</td>
      <td headers="grp_b stub_2_7 datetime" class="gt_row gt_right" style="background-color: #999999;">2018-07-07 05:22</td>
      <td headers="grp_b stub_2_7 currency" class="gt_row gt_right" style="background-color: #8C8C8C;">NA</td></tr>
          <tr><th id="stub_2_8" scope="row" class="gt_row gt_left gt_stub" style="background-color: #FFDAB9;">row_8</th>
      <td headers="grp_b stub_2_8 num" class="gt_row gt_right" style="background-color: #D9D9D9;">8.880e+06</td>
      <td headers="grp_b stub_2_8 char" class="gt_row gt_left" style="background-color: #CCCCCC;">honeydew</td>
      <td headers="grp_b stub_2_8 fctr" class="gt_row gt_center" style="background-color: #BFBFBF;">eight</td>
      <td headers="grp_b stub_2_8 date" class="gt_row gt_right" style="background-color: #B3B3B3;">2015-08-15</td>
      <td headers="grp_b stub_2_8 time" class="gt_row gt_right" style="background-color: #A6A6A6;">20:20</td>
      <td headers="grp_b stub_2_8 datetime" class="gt_row gt_right" style="background-color: #999999;">NA</td>
      <td headers="grp_b stub_2_8 currency" class="gt_row gt_right" style="background-color: #8C8C8C;">0.440</td></tr>
        </tbody>
        <tfoot>
          <tr class="gt_sourcenotes">
            <td class="gt_sourcenote" style="background-color: #F5DEB3;" colspan="9">Source note #1</td>
          </tr>
          <tr class="gt_sourcenotes">
            <td class="gt_sourcenote" style="background-color: #F5DEB3;" colspan="9">Source note #2</td>
          </tr>
        </tfoot>
      </table>

---

    Code
      cat(render_as_html(gt_tbl))
    Output
      <table class="gt_table" data-quarto-disable-processing="false" data-quarto-bootstrap="false">
        <thead>
          <tr class="gt_heading">
            <td colspan="10" class="gt_heading gt_title gt_font_normal" style="background-color: #ADD8E6;"><span class='gt_from_md'>Data listing from <strong>exibble</strong></span></td>
          </tr>
          <tr class="gt_heading">
            <td colspan="10" class="gt_heading gt_subtitle gt_font_normal gt_bottom_border" style="background-color: #00FFFF;"><span class='gt_from_md'><code>exibble</code> is an R dataset</span></td>
          </tr>
          <tr class="gt_col_headings gt_spanner_row">
            <th class="gt_col_heading gt_columns_bottom_border gt_left" rowspan="2" colspan="1" style="background-color: #DCDCDC;" scope="col" id="a::stub">S.L.</th>
            <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="2" colspan="1" style="background-color: #7FFFD4;" scope="col" id="num">num</th>
            <th class="gt_col_heading gt_columns_bottom_border gt_left" rowspan="2" colspan="1" style="background-color: #7FFFD4;" scope="col" id="char">char</th>
            <th class="gt_col_heading gt_columns_bottom_border gt_center" rowspan="2" colspan="1" style="background-color: #7FFFD4;" scope="col" id="fctr">fctr</th>
            <th class="gt_center gt_columns_top_border gt_column_spanner_outer" rowspan="1" colspan="3" style="background-color: #FFFF00;" scope="colgroup" id="timing">
              <div class="gt_column_spanner">timing</div>
            </th>
            <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="2" colspan="1" style="background-color: #7FFFD4;" scope="col" id="currency">currency</th>
            <th class="gt_col_heading gt_columns_bottom_border gt_left" rowspan="2" colspan="1" style="background-color: #7FFFD4;" scope="col" id="row">row</th>
            <th class="gt_col_heading gt_columns_bottom_border gt_left" rowspan="2" colspan="1" style="background-color: #7FFFD4;" scope="col" id="group">group</th>
          </tr>
          <tr class="gt_col_headings">
            <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" style="background-color: #7FFFD4;" scope="col" id="date">date</th>
            <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" style="background-color: #7FFFD4;" scope="col" id="time">time</th>
            <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" style="background-color: #7FFFD4;" scope="col" id="datetime">datetime</th>
          </tr>
        </thead>
        <tbody class="gt_table_body">
          <tr><th id="stub_1_1" scope="row" class="gt_row gt_left gt_stub" style="background-color: #FFDAB9;"></th>
      <td headers="stub_1_1 num" class="gt_row gt_right" style="background-color: #D9D9D9;">1.111e-01</td>
      <td headers="stub_1_1 char" class="gt_row gt_left" style="background-color: #CCCCCC;">apricot</td>
      <td headers="stub_1_1 fctr" class="gt_row gt_center" style="background-color: #BFBFBF;">one</td>
      <td headers="stub_1_1 date" class="gt_row gt_right" style="background-color: #B3B3B3;">2015-01-15</td>
      <td headers="stub_1_1 time" class="gt_row gt_right" style="background-color: #A6A6A6;">13:35</td>
      <td headers="stub_1_1 datetime" class="gt_row gt_right" style="background-color: #999999;">2018-01-01 02:22</td>
      <td headers="stub_1_1 currency" class="gt_row gt_right" style="background-color: #8C8C8C;">49.950</td>
      <td headers="stub_1_1 row" class="gt_row gt_left" style="background-color: #7F7F7F;">row_1</td>
      <td headers="stub_1_1 group" class="gt_row gt_left" style="background-color: #737373;">grp_a</td></tr>
          <tr><th id="stub_1_2" scope="row" class="gt_row gt_left gt_stub" style="background-color: #FFDAB9;"></th>
      <td headers="stub_1_2 num" class="gt_row gt_right" style="background-color: #D9D9D9;">2.222e+00</td>
      <td headers="stub_1_2 char" class="gt_row gt_left" style="background-color: #CCCCCC;">banana</td>
      <td headers="stub_1_2 fctr" class="gt_row gt_center" style="background-color: #BFBFBF;">two</td>
      <td headers="stub_1_2 date" class="gt_row gt_right" style="background-color: #B3B3B3;">2015-02-15</td>
      <td headers="stub_1_2 time" class="gt_row gt_right" style="background-color: #A6A6A6;">14:40</td>
      <td headers="stub_1_2 datetime" class="gt_row gt_right" style="background-color: #999999;">2018-02-02 14:33</td>
      <td headers="stub_1_2 currency" class="gt_row gt_right" style="background-color: #8C8C8C;">17.950</td>
      <td headers="stub_1_2 row" class="gt_row gt_left" style="background-color: #7F7F7F;">row_2</td>
      <td headers="stub_1_2 group" class="gt_row gt_left" style="background-color: #737373;">grp_a</td></tr>
          <tr><th id="stub_1_3" scope="row" class="gt_row gt_left gt_stub" style="background-color: #FFDAB9;"></th>
      <td headers="stub_1_3 num" class="gt_row gt_right" style="background-color: #D9D9D9;">3.333e+01</td>
      <td headers="stub_1_3 char" class="gt_row gt_left" style="background-color: #CCCCCC;">coconut</td>
      <td headers="stub_1_3 fctr" class="gt_row gt_center" style="background-color: #BFBFBF;">three</td>
      <td headers="stub_1_3 date" class="gt_row gt_right" style="background-color: #B3B3B3;">2015-03-15</td>
      <td headers="stub_1_3 time" class="gt_row gt_right" style="background-color: #A6A6A6;">15:45</td>
      <td headers="stub_1_3 datetime" class="gt_row gt_right" style="background-color: #999999;">2018-03-03 03:44</td>
      <td headers="stub_1_3 currency" class="gt_row gt_right" style="background-color: #8C8C8C;">1.390</td>
      <td headers="stub_1_3 row" class="gt_row gt_left" style="background-color: #7F7F7F;">row_3</td>
      <td headers="stub_1_3 group" class="gt_row gt_left" style="background-color: #737373;">grp_a</td></tr>
          <tr><th id="stub_1_4" scope="row" class="gt_row gt_left gt_stub" style="background-color: #FFDAB9;"></th>
      <td headers="stub_1_4 num" class="gt_row gt_right" style="background-color: #D9D9D9;">4.444e+02</td>
      <td headers="stub_1_4 char" class="gt_row gt_left" style="background-color: #CCCCCC;">durian</td>
      <td headers="stub_1_4 fctr" class="gt_row gt_center" style="background-color: #BFBFBF;">four</td>
      <td headers="stub_1_4 date" class="gt_row gt_right" style="background-color: #B3B3B3;">2015-04-15</td>
      <td headers="stub_1_4 time" class="gt_row gt_right" style="background-color: #A6A6A6;">16:50</td>
      <td headers="stub_1_4 datetime" class="gt_row gt_right" style="background-color: #999999;">2018-04-04 15:55</td>
      <td headers="stub_1_4 currency" class="gt_row gt_right" style="background-color: #8C8C8C;">65100.000</td>
      <td headers="stub_1_4 row" class="gt_row gt_left" style="background-color: #7F7F7F;">row_4</td>
      <td headers="stub_1_4 group" class="gt_row gt_left" style="background-color: #737373;">grp_a</td></tr>
          <tr><th id="stub_1_5" scope="row" class="gt_row gt_left gt_stub" style="background-color: #FFDAB9;"></th>
      <td headers="stub_1_5 num" class="gt_row gt_right" style="background-color: #D9D9D9;">5.550e+03</td>
      <td headers="stub_1_5 char" class="gt_row gt_left" style="background-color: #CCCCCC;">NA</td>
      <td headers="stub_1_5 fctr" class="gt_row gt_center" style="background-color: #BFBFBF;">five</td>
      <td headers="stub_1_5 date" class="gt_row gt_right" style="background-color: #B3B3B3;">2015-05-15</td>
      <td headers="stub_1_5 time" class="gt_row gt_right" style="background-color: #A6A6A6;">17:55</td>
      <td headers="stub_1_5 datetime" class="gt_row gt_right" style="background-color: #999999;">2018-05-05 04:00</td>
      <td headers="stub_1_5 currency" class="gt_row gt_right" style="background-color: #8C8C8C;">1325.810</td>
      <td headers="stub_1_5 row" class="gt_row gt_left" style="background-color: #7F7F7F;">row_5</td>
      <td headers="stub_1_5 group" class="gt_row gt_left" style="background-color: #737373;">grp_b</td></tr>
          <tr><th id="stub_1_6" scope="row" class="gt_row gt_left gt_stub" style="background-color: #FFDAB9;"></th>
      <td headers="stub_1_6 num" class="gt_row gt_right" style="background-color: #D9D9D9;">NA</td>
      <td headers="stub_1_6 char" class="gt_row gt_left" style="background-color: #CCCCCC;">fig</td>
      <td headers="stub_1_6 fctr" class="gt_row gt_center" style="background-color: #BFBFBF;">six</td>
      <td headers="stub_1_6 date" class="gt_row gt_right" style="background-color: #B3B3B3;">2015-06-15</td>
      <td headers="stub_1_6 time" class="gt_row gt_right" style="background-color: #A6A6A6;">NA</td>
      <td headers="stub_1_6 datetime" class="gt_row gt_right" style="background-color: #999999;">2018-06-06 16:11</td>
      <td headers="stub_1_6 currency" class="gt_row gt_right" style="background-color: #8C8C8C;">13.255</td>
      <td headers="stub_1_6 row" class="gt_row gt_left" style="background-color: #7F7F7F;">row_6</td>
      <td headers="stub_1_6 group" class="gt_row gt_left" style="background-color: #737373;">grp_b</td></tr>
          <tr><th id="stub_1_7" scope="row" class="gt_row gt_left gt_stub" style="background-color: #FFDAB9;"></th>
      <td headers="stub_1_7 num" class="gt_row gt_right" style="background-color: #D9D9D9;">7.770e+05</td>
      <td headers="stub_1_7 char" class="gt_row gt_left" style="background-color: #CCCCCC;">grapefruit</td>
      <td headers="stub_1_7 fctr" class="gt_row gt_center" style="background-color: #BFBFBF;">seven</td>
      <td headers="stub_1_7 date" class="gt_row gt_right" style="background-color: #B3B3B3;">NA</td>
      <td headers="stub_1_7 time" class="gt_row gt_right" style="background-color: #A6A6A6;">19:10</td>
      <td headers="stub_1_7 datetime" class="gt_row gt_right" style="background-color: #999999;">2018-07-07 05:22</td>
      <td headers="stub_1_7 currency" class="gt_row gt_right" style="background-color: #8C8C8C;">NA</td>
      <td headers="stub_1_7 row" class="gt_row gt_left" style="background-color: #7F7F7F;">row_7</td>
      <td headers="stub_1_7 group" class="gt_row gt_left" style="background-color: #737373;">grp_b</td></tr>
          <tr><th id="stub_1_8" scope="row" class="gt_row gt_left gt_stub" style="background-color: #FFDAB9;"></th>
      <td headers="stub_1_8 num" class="gt_row gt_right" style="background-color: #D9D9D9;">8.880e+06</td>
      <td headers="stub_1_8 char" class="gt_row gt_left" style="background-color: #CCCCCC;">honeydew</td>
      <td headers="stub_1_8 fctr" class="gt_row gt_center" style="background-color: #BFBFBF;">eight</td>
      <td headers="stub_1_8 date" class="gt_row gt_right" style="background-color: #B3B3B3;">2015-08-15</td>
      <td headers="stub_1_8 time" class="gt_row gt_right" style="background-color: #A6A6A6;">20:20</td>
      <td headers="stub_1_8 datetime" class="gt_row gt_right" style="background-color: #999999;">NA</td>
      <td headers="stub_1_8 currency" class="gt_row gt_right" style="background-color: #8C8C8C;">0.440</td>
      <td headers="stub_1_8 row" class="gt_row gt_left" style="background-color: #7F7F7F;">row_8</td>
      <td headers="stub_1_8 group" class="gt_row gt_left" style="background-color: #737373;">grp_b</td></tr>
          <tr><th id="grand_summary_stub_1" scope="row" class="gt_row gt_left gt_stub gt_grand_summary_row gt_first_grand_summary_row" style="background-color: #FF0000;">min</th>
      <td headers="grand_summary_stub_1 num" class="gt_row gt_right gt_grand_summary_row gt_first_grand_summary_row" style="background-color: #D3D3D3;">0.11</td>
      <td headers="grand_summary_stub_1 char" class="gt_row gt_left gt_grand_summary_row gt_first_grand_summary_row">—</td>
      <td headers="grand_summary_stub_1 fctr" class="gt_row gt_center gt_grand_summary_row gt_first_grand_summary_row">—</td>
      <td headers="grand_summary_stub_1 date" class="gt_row gt_right gt_grand_summary_row gt_first_grand_summary_row">—</td>
      <td headers="grand_summary_stub_1 time" class="gt_row gt_right gt_grand_summary_row gt_first_grand_summary_row">—</td>
      <td headers="grand_summary_stub_1 datetime" class="gt_row gt_right gt_grand_summary_row gt_first_grand_summary_row">—</td>
      <td headers="grand_summary_stub_1 currency" class="gt_row gt_right gt_grand_summary_row gt_first_grand_summary_row" style="background-color: #D3D3D3;">0.44</td>
      <td headers="grand_summary_stub_1 row" class="gt_row gt_left gt_grand_summary_row gt_first_grand_summary_row">—</td>
      <td headers="grand_summary_stub_1 group" class="gt_row gt_left gt_grand_summary_row gt_first_grand_summary_row">—</td></tr>
          <tr><th id="grand_summary_stub_2" scope="row" class="gt_row gt_left gt_stub gt_grand_summary_row" style="background-color: #FF0000;">max</th>
      <td headers="grand_summary_stub_2 num" class="gt_row gt_right gt_grand_summary_row" style="background-color: #D3D3D3;">8880000.00</td>
      <td headers="grand_summary_stub_2 char" class="gt_row gt_left gt_grand_summary_row">—</td>
      <td headers="grand_summary_stub_2 fctr" class="gt_row gt_center gt_grand_summary_row">—</td>
      <td headers="grand_summary_stub_2 date" class="gt_row gt_right gt_grand_summary_row">—</td>
      <td headers="grand_summary_stub_2 time" class="gt_row gt_right gt_grand_summary_row">—</td>
      <td headers="grand_summary_stub_2 datetime" class="gt_row gt_right gt_grand_summary_row">—</td>
      <td headers="grand_summary_stub_2 currency" class="gt_row gt_right gt_grand_summary_row" style="background-color: #D3D3D3;">65100.00</td>
      <td headers="grand_summary_stub_2 row" class="gt_row gt_left gt_grand_summary_row">—</td>
      <td headers="grand_summary_stub_2 group" class="gt_row gt_left gt_grand_summary_row">—</td></tr>
          <tr><th id="grand_summary_stub_3" scope="row" class="gt_row gt_left gt_stub gt_grand_summary_row gt_last_summary_row" style="background-color: #FF0000;">avg</th>
      <td headers="grand_summary_stub_3 num" class="gt_row gt_right gt_grand_summary_row gt_last_summary_row" style="background-color: #D3D3D3;">1380432.87</td>
      <td headers="grand_summary_stub_3 char" class="gt_row gt_left gt_grand_summary_row gt_last_summary_row">—</td>
      <td headers="grand_summary_stub_3 fctr" class="gt_row gt_center gt_grand_summary_row gt_last_summary_row">—</td>
      <td headers="grand_summary_stub_3 date" class="gt_row gt_right gt_grand_summary_row gt_last_summary_row">—</td>
      <td headers="grand_summary_stub_3 time" class="gt_row gt_right gt_grand_summary_row gt_last_summary_row">—</td>
      <td headers="grand_summary_stub_3 datetime" class="gt_row gt_right gt_grand_summary_row gt_last_summary_row">—</td>
      <td headers="grand_summary_stub_3 currency" class="gt_row gt_right gt_grand_summary_row gt_last_summary_row" style="background-color: #D3D3D3;">9501.26</td>
      <td headers="grand_summary_stub_3 row" class="gt_row gt_left gt_grand_summary_row gt_last_summary_row">—</td>
      <td headers="grand_summary_stub_3 group" class="gt_row gt_left gt_grand_summary_row gt_last_summary_row">—</td></tr>
        </tbody>
        <tfoot>
          <tr class="gt_sourcenotes">
            <td class="gt_sourcenote" style="background-color: #F5DEB3;" colspan="10">Source note #1</td>
          </tr>
          <tr class="gt_sourcenotes">
            <td class="gt_sourcenote" style="background-color: #F5DEB3;" colspan="10">Source note #2</td>
          </tr>
        </tfoot>
      </table>

---

    Code
      cat(render_as_html(gt_tbl))
    Output
      <table class="gt_table" data-quarto-disable-processing="false" data-quarto-bootstrap="false">
        <thead>
          <tr class="gt_heading">
            <td colspan="10" class="gt_heading gt_title gt_font_normal" style="background-color: #ADD8E6;"><span class='gt_from_md'>Data listing from <strong>exibble</strong></span></td>
          </tr>
          <tr class="gt_heading">
            <td colspan="10" class="gt_heading gt_subtitle gt_font_normal gt_bottom_border" style="background-color: #00FFFF;"><span class='gt_from_md'><code>exibble</code> is an R dataset</span></td>
          </tr>
          <tr class="gt_col_headings gt_spanner_row">
            <th class="gt_col_heading gt_columns_bottom_border gt_left" rowspan="2" colspan="1" style="background-color: #DCDCDC;" scope="col" id="a::stub">S.L.</th>
            <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="2" colspan="1" style="background-color: #7FFFD4;" scope="col" id="num">num</th>
            <th class="gt_col_heading gt_columns_bottom_border gt_left" rowspan="2" colspan="1" style="background-color: #7FFFD4;" scope="col" id="char">char</th>
            <th class="gt_col_heading gt_columns_bottom_border gt_center" rowspan="2" colspan="1" style="background-color: #7FFFD4;" scope="col" id="fctr">fctr</th>
            <th class="gt_center gt_columns_top_border gt_column_spanner_outer" rowspan="1" colspan="3" style="background-color: #FFFF00;" scope="colgroup" id="timing">
              <div class="gt_column_spanner">timing</div>
            </th>
            <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="2" colspan="1" style="background-color: #7FFFD4;" scope="col" id="currency">currency</th>
            <th class="gt_col_heading gt_columns_bottom_border gt_left" rowspan="2" colspan="1" style="background-color: #7FFFD4;" scope="col" id="row">row</th>
            <th class="gt_col_heading gt_columns_bottom_border gt_left" rowspan="2" colspan="1" style="background-color: #7FFFD4;" scope="col" id="group">group</th>
          </tr>
          <tr class="gt_col_headings">
            <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" style="background-color: #7FFFD4;" scope="col" id="date">date</th>
            <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" style="background-color: #7FFFD4;" scope="col" id="time">time</th>
            <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" style="background-color: #7FFFD4;" scope="col" id="datetime">datetime</th>
          </tr>
        </thead>
        <tbody class="gt_table_body">
          <tr><th id="stub_1_1" scope="row" class="gt_row gt_left gt_stub" style="background-color: #FFDAB9;"></th>
      <td headers="stub_1_1 num" class="gt_row gt_right" style="background-color: #D9D9D9;">1.111e-01</td>
      <td headers="stub_1_1 char" class="gt_row gt_left" style="background-color: #CCCCCC;">apricot</td>
      <td headers="stub_1_1 fctr" class="gt_row gt_center" style="background-color: #BFBFBF;">one</td>
      <td headers="stub_1_1 date" class="gt_row gt_right" style="background-color: #B3B3B3;">2015-01-15</td>
      <td headers="stub_1_1 time" class="gt_row gt_right" style="background-color: #A6A6A6;">13:35</td>
      <td headers="stub_1_1 datetime" class="gt_row gt_right" style="background-color: #999999;">2018-01-01 02:22</td>
      <td headers="stub_1_1 currency" class="gt_row gt_right" style="background-color: #8C8C8C;">49.950</td>
      <td headers="stub_1_1 row" class="gt_row gt_left" style="background-color: #7F7F7F;">row_1</td>
      <td headers="stub_1_1 group" class="gt_row gt_left" style="background-color: #737373;">grp_a</td></tr>
          <tr><th id="stub_1_2" scope="row" class="gt_row gt_left gt_stub" style="background-color: #FFDAB9;"></th>
      <td headers="stub_1_2 num" class="gt_row gt_right" style="background-color: #D9D9D9;">2.222e+00</td>
      <td headers="stub_1_2 char" class="gt_row gt_left" style="background-color: #CCCCCC;">banana</td>
      <td headers="stub_1_2 fctr" class="gt_row gt_center" style="background-color: #BFBFBF;">two</td>
      <td headers="stub_1_2 date" class="gt_row gt_right" style="background-color: #B3B3B3;">2015-02-15</td>
      <td headers="stub_1_2 time" class="gt_row gt_right" style="background-color: #A6A6A6;">14:40</td>
      <td headers="stub_1_2 datetime" class="gt_row gt_right" style="background-color: #999999;">2018-02-02 14:33</td>
      <td headers="stub_1_2 currency" class="gt_row gt_right" style="background-color: #8C8C8C;">17.950</td>
      <td headers="stub_1_2 row" class="gt_row gt_left" style="background-color: #7F7F7F;">row_2</td>
      <td headers="stub_1_2 group" class="gt_row gt_left" style="background-color: #737373;">grp_a</td></tr>
          <tr><th id="stub_1_3" scope="row" class="gt_row gt_left gt_stub" style="background-color: #FFDAB9;"></th>
      <td headers="stub_1_3 num" class="gt_row gt_right" style="background-color: #D9D9D9;">3.333e+01</td>
      <td headers="stub_1_3 char" class="gt_row gt_left" style="background-color: #CCCCCC;">coconut</td>
      <td headers="stub_1_3 fctr" class="gt_row gt_center" style="background-color: #BFBFBF;">three</td>
      <td headers="stub_1_3 date" class="gt_row gt_right" style="background-color: #B3B3B3;">2015-03-15</td>
      <td headers="stub_1_3 time" class="gt_row gt_right" style="background-color: #A6A6A6;">15:45</td>
      <td headers="stub_1_3 datetime" class="gt_row gt_right" style="background-color: #999999;">2018-03-03 03:44</td>
      <td headers="stub_1_3 currency" class="gt_row gt_right" style="background-color: #8C8C8C;">1.390</td>
      <td headers="stub_1_3 row" class="gt_row gt_left" style="background-color: #7F7F7F;">row_3</td>
      <td headers="stub_1_3 group" class="gt_row gt_left" style="background-color: #737373;">grp_a</td></tr>
          <tr><th id="stub_1_4" scope="row" class="gt_row gt_left gt_stub" style="background-color: #FFDAB9;"></th>
      <td headers="stub_1_4 num" class="gt_row gt_right" style="background-color: #D9D9D9;">4.444e+02</td>
      <td headers="stub_1_4 char" class="gt_row gt_left" style="background-color: #CCCCCC;">durian</td>
      <td headers="stub_1_4 fctr" class="gt_row gt_center" style="background-color: #BFBFBF;">four</td>
      <td headers="stub_1_4 date" class="gt_row gt_right" style="background-color: #B3B3B3;">2015-04-15</td>
      <td headers="stub_1_4 time" class="gt_row gt_right" style="background-color: #A6A6A6;">16:50</td>
      <td headers="stub_1_4 datetime" class="gt_row gt_right" style="background-color: #999999;">2018-04-04 15:55</td>
      <td headers="stub_1_4 currency" class="gt_row gt_right" style="background-color: #8C8C8C;">65100.000</td>
      <td headers="stub_1_4 row" class="gt_row gt_left" style="background-color: #7F7F7F;">row_4</td>
      <td headers="stub_1_4 group" class="gt_row gt_left" style="background-color: #737373;">grp_a</td></tr>
          <tr><th id="stub_1_5" scope="row" class="gt_row gt_left gt_stub" style="background-color: #FFDAB9;"></th>
      <td headers="stub_1_5 num" class="gt_row gt_right" style="background-color: #D9D9D9;">5.550e+03</td>
      <td headers="stub_1_5 char" class="gt_row gt_left" style="background-color: #CCCCCC;">NA</td>
      <td headers="stub_1_5 fctr" class="gt_row gt_center" style="background-color: #BFBFBF;">five</td>
      <td headers="stub_1_5 date" class="gt_row gt_right" style="background-color: #B3B3B3;">2015-05-15</td>
      <td headers="stub_1_5 time" class="gt_row gt_right" style="background-color: #A6A6A6;">17:55</td>
      <td headers="stub_1_5 datetime" class="gt_row gt_right" style="background-color: #999999;">2018-05-05 04:00</td>
      <td headers="stub_1_5 currency" class="gt_row gt_right" style="background-color: #8C8C8C;">1325.810</td>
      <td headers="stub_1_5 row" class="gt_row gt_left" style="background-color: #7F7F7F;">row_5</td>
      <td headers="stub_1_5 group" class="gt_row gt_left" style="background-color: #737373;">grp_b</td></tr>
          <tr><th id="stub_1_6" scope="row" class="gt_row gt_left gt_stub" style="background-color: #FFDAB9;"></th>
      <td headers="stub_1_6 num" class="gt_row gt_right" style="background-color: #D9D9D9;">NA</td>
      <td headers="stub_1_6 char" class="gt_row gt_left" style="background-color: #CCCCCC;">fig</td>
      <td headers="stub_1_6 fctr" class="gt_row gt_center" style="background-color: #BFBFBF;">six</td>
      <td headers="stub_1_6 date" class="gt_row gt_right" style="background-color: #B3B3B3;">2015-06-15</td>
      <td headers="stub_1_6 time" class="gt_row gt_right" style="background-color: #A6A6A6;">NA</td>
      <td headers="stub_1_6 datetime" class="gt_row gt_right" style="background-color: #999999;">2018-06-06 16:11</td>
      <td headers="stub_1_6 currency" class="gt_row gt_right" style="background-color: #8C8C8C;">13.255</td>
      <td headers="stub_1_6 row" class="gt_row gt_left" style="background-color: #7F7F7F;">row_6</td>
      <td headers="stub_1_6 group" class="gt_row gt_left" style="background-color: #737373;">grp_b</td></tr>
          <tr><th id="stub_1_7" scope="row" class="gt_row gt_left gt_stub" style="background-color: #FFDAB9;"></th>
      <td headers="stub_1_7 num" class="gt_row gt_right" style="background-color: #D9D9D9;">7.770e+05</td>
      <td headers="stub_1_7 char" class="gt_row gt_left" style="background-color: #CCCCCC;">grapefruit</td>
      <td headers="stub_1_7 fctr" class="gt_row gt_center" style="background-color: #BFBFBF;">seven</td>
      <td headers="stub_1_7 date" class="gt_row gt_right" style="background-color: #B3B3B3;">NA</td>
      <td headers="stub_1_7 time" class="gt_row gt_right" style="background-color: #A6A6A6;">19:10</td>
      <td headers="stub_1_7 datetime" class="gt_row gt_right" style="background-color: #999999;">2018-07-07 05:22</td>
      <td headers="stub_1_7 currency" class="gt_row gt_right" style="background-color: #8C8C8C;">NA</td>
      <td headers="stub_1_7 row" class="gt_row gt_left" style="background-color: #7F7F7F;">row_7</td>
      <td headers="stub_1_7 group" class="gt_row gt_left" style="background-color: #737373;">grp_b</td></tr>
          <tr><th id="stub_1_8" scope="row" class="gt_row gt_left gt_stub" style="background-color: #FFDAB9;"></th>
      <td headers="stub_1_8 num" class="gt_row gt_right" style="background-color: #D9D9D9;">8.880e+06</td>
      <td headers="stub_1_8 char" class="gt_row gt_left" style="background-color: #CCCCCC;">honeydew</td>
      <td headers="stub_1_8 fctr" class="gt_row gt_center" style="background-color: #BFBFBF;">eight</td>
      <td headers="stub_1_8 date" class="gt_row gt_right" style="background-color: #B3B3B3;">2015-08-15</td>
      <td headers="stub_1_8 time" class="gt_row gt_right" style="background-color: #A6A6A6;">20:20</td>
      <td headers="stub_1_8 datetime" class="gt_row gt_right" style="background-color: #999999;">NA</td>
      <td headers="stub_1_8 currency" class="gt_row gt_right" style="background-color: #8C8C8C;">0.440</td>
      <td headers="stub_1_8 row" class="gt_row gt_left" style="background-color: #7F7F7F;">row_8</td>
      <td headers="stub_1_8 group" class="gt_row gt_left" style="background-color: #737373;">grp_b</td></tr>
          <tr><th id="grand_summary_stub_1" scope="row" class="gt_row gt_left gt_stub gt_grand_summary_row gt_first_grand_summary_row" style="background-color: #FF0000;">min</th>
      <td headers="grand_summary_stub_1 num" class="gt_row gt_right gt_grand_summary_row gt_first_grand_summary_row" style="background-color: #D3D3D3;">0.11</td>
      <td headers="grand_summary_stub_1 char" class="gt_row gt_left gt_grand_summary_row gt_first_grand_summary_row">—</td>
      <td headers="grand_summary_stub_1 fctr" class="gt_row gt_center gt_grand_summary_row gt_first_grand_summary_row">—</td>
      <td headers="grand_summary_stub_1 date" class="gt_row gt_right gt_grand_summary_row gt_first_grand_summary_row">—</td>
      <td headers="grand_summary_stub_1 time" class="gt_row gt_right gt_grand_summary_row gt_first_grand_summary_row">—</td>
      <td headers="grand_summary_stub_1 datetime" class="gt_row gt_right gt_grand_summary_row gt_first_grand_summary_row">—</td>
      <td headers="grand_summary_stub_1 currency" class="gt_row gt_right gt_grand_summary_row gt_first_grand_summary_row" style="background-color: #D3D3D3;">0.44</td>
      <td headers="grand_summary_stub_1 row" class="gt_row gt_left gt_grand_summary_row gt_first_grand_summary_row">—</td>
      <td headers="grand_summary_stub_1 group" class="gt_row gt_left gt_grand_summary_row gt_first_grand_summary_row">—</td></tr>
          <tr><th id="grand_summary_stub_2" scope="row" class="gt_row gt_left gt_stub gt_grand_summary_row" style="background-color: #FF0000;">max</th>
      <td headers="grand_summary_stub_2 num" class="gt_row gt_right gt_grand_summary_row" style="background-color: #D3D3D3;">8880000.00</td>
      <td headers="grand_summary_stub_2 char" class="gt_row gt_left gt_grand_summary_row">—</td>
      <td headers="grand_summary_stub_2 fctr" class="gt_row gt_center gt_grand_summary_row">—</td>
      <td headers="grand_summary_stub_2 date" class="gt_row gt_right gt_grand_summary_row">—</td>
      <td headers="grand_summary_stub_2 time" class="gt_row gt_right gt_grand_summary_row">—</td>
      <td headers="grand_summary_stub_2 datetime" class="gt_row gt_right gt_grand_summary_row">—</td>
      <td headers="grand_summary_stub_2 currency" class="gt_row gt_right gt_grand_summary_row" style="background-color: #D3D3D3;">65100.00</td>
      <td headers="grand_summary_stub_2 row" class="gt_row gt_left gt_grand_summary_row">—</td>
      <td headers="grand_summary_stub_2 group" class="gt_row gt_left gt_grand_summary_row">—</td></tr>
          <tr><th id="grand_summary_stub_3" scope="row" class="gt_row gt_left gt_stub gt_grand_summary_row gt_last_summary_row" style="background-color: #FF0000;">avg</th>
      <td headers="grand_summary_stub_3 num" class="gt_row gt_right gt_grand_summary_row gt_last_summary_row" style="background-color: #D3D3D3;">1380432.87</td>
      <td headers="grand_summary_stub_3 char" class="gt_row gt_left gt_grand_summary_row gt_last_summary_row">—</td>
      <td headers="grand_summary_stub_3 fctr" class="gt_row gt_center gt_grand_summary_row gt_last_summary_row">—</td>
      <td headers="grand_summary_stub_3 date" class="gt_row gt_right gt_grand_summary_row gt_last_summary_row">—</td>
      <td headers="grand_summary_stub_3 time" class="gt_row gt_right gt_grand_summary_row gt_last_summary_row">—</td>
      <td headers="grand_summary_stub_3 datetime" class="gt_row gt_right gt_grand_summary_row gt_last_summary_row">—</td>
      <td headers="grand_summary_stub_3 currency" class="gt_row gt_right gt_grand_summary_row gt_last_summary_row" style="background-color: #D3D3D3;">9501.26</td>
      <td headers="grand_summary_stub_3 row" class="gt_row gt_left gt_grand_summary_row gt_last_summary_row">—</td>
      <td headers="grand_summary_stub_3 group" class="gt_row gt_left gt_grand_summary_row gt_last_summary_row">—</td></tr>
        </tbody>
        <tfoot>
          <tr class="gt_sourcenotes">
            <td class="gt_sourcenote" style="background-color: #F5DEB3;" colspan="10">Source note #1</td>
          </tr>
          <tr class="gt_sourcenotes">
            <td class="gt_sourcenote" style="background-color: #F5DEB3;" colspan="10">Source note #2</td>
          </tr>
        </tfoot>
      </table>

---

    Code
      cat(render_as_html(gt_tbl))
    Output
      <table class="gt_table" data-quarto-disable-processing="false" data-quarto-bootstrap="false">
        <thead>
          <tr class="gt_heading">
            <td colspan="9" class="gt_heading gt_title gt_font_normal" style="background-color: #ADD8E6;"><span class='gt_from_md'>Data listing from <strong>exibble</strong></span></td>
          </tr>
          <tr class="gt_heading">
            <td colspan="9" class="gt_heading gt_subtitle gt_font_normal gt_bottom_border" style="background-color: #00FFFF;"><span class='gt_from_md'><code>exibble</code> is an R dataset</span></td>
          </tr>
          <tr class="gt_col_headings gt_spanner_row">
            <th class="gt_col_heading gt_columns_bottom_border gt_left" rowspan="2" colspan="1" style="background-color: #DCDCDC;" scope="col" id="a::stub">S.L.</th>
            <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="2" colspan="1" style="background-color: #7FFFD4;" scope="col" id="num">num</th>
            <th class="gt_col_heading gt_columns_bottom_border gt_left" rowspan="2" colspan="1" style="background-color: #7FFFD4;" scope="col" id="char">char</th>
            <th class="gt_col_heading gt_columns_bottom_border gt_center" rowspan="2" colspan="1" style="background-color: #7FFFD4;" scope="col" id="fctr">fctr</th>
            <th class="gt_center gt_columns_top_border gt_column_spanner_outer" rowspan="1" colspan="3" style="background-color: #FFFF00;" scope="colgroup" id="timing">
              <div class="gt_column_spanner">timing</div>
            </th>
            <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="2" colspan="1" style="background-color: #7FFFD4;" scope="col" id="currency">currency</th>
            <th class="gt_col_heading gt_columns_bottom_border gt_left" rowspan="2" colspan="1" style="background-color: #7FFFD4;" scope="col" id="row">row</th>
          </tr>
          <tr class="gt_col_headings">
            <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" style="background-color: #7FFFD4;" scope="col" id="date">date</th>
            <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" style="background-color: #7FFFD4;" scope="col" id="time">time</th>
            <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" style="background-color: #7FFFD4;" scope="col" id="datetime">datetime</th>
          </tr>
        </thead>
        <tbody class="gt_table_body">
          <tr class="gt_group_heading_row">
            <th colspan="9" class="gt_group_heading" style="background-color: #E0FFFF;" scope="colgroup" id="grp_a">grp_a</th>
          </tr>
          <tr class="gt_row_group_first"><th id="stub_1_1" scope="row" class="gt_row gt_left gt_stub" style="background-color: #FFDAB9;"></th>
      <td headers="grp_a stub_1_1 num" class="gt_row gt_right" style="background-color: #D9D9D9;">1.111e-01</td>
      <td headers="grp_a stub_1_1 char" class="gt_row gt_left" style="background-color: #CCCCCC;">apricot</td>
      <td headers="grp_a stub_1_1 fctr" class="gt_row gt_center" style="background-color: #BFBFBF;">one</td>
      <td headers="grp_a stub_1_1 date" class="gt_row gt_right" style="background-color: #B3B3B3;">2015-01-15</td>
      <td headers="grp_a stub_1_1 time" class="gt_row gt_right" style="background-color: #A6A6A6;">13:35</td>
      <td headers="grp_a stub_1_1 datetime" class="gt_row gt_right" style="background-color: #999999;">2018-01-01 02:22</td>
      <td headers="grp_a stub_1_1 currency" class="gt_row gt_right" style="background-color: #8C8C8C;">49.950</td>
      <td headers="grp_a stub_1_1 row" class="gt_row gt_left" style="background-color: #7F7F7F;">row_1</td></tr>
          <tr><th id="stub_1_2" scope="row" class="gt_row gt_left gt_stub" style="background-color: #FFDAB9;"></th>
      <td headers="grp_a stub_1_2 num" class="gt_row gt_right" style="background-color: #D9D9D9;">2.222e+00</td>
      <td headers="grp_a stub_1_2 char" class="gt_row gt_left" style="background-color: #CCCCCC;">banana</td>
      <td headers="grp_a stub_1_2 fctr" class="gt_row gt_center" style="background-color: #BFBFBF;">two</td>
      <td headers="grp_a stub_1_2 date" class="gt_row gt_right" style="background-color: #B3B3B3;">2015-02-15</td>
      <td headers="grp_a stub_1_2 time" class="gt_row gt_right" style="background-color: #A6A6A6;">14:40</td>
      <td headers="grp_a stub_1_2 datetime" class="gt_row gt_right" style="background-color: #999999;">2018-02-02 14:33</td>
      <td headers="grp_a stub_1_2 currency" class="gt_row gt_right" style="background-color: #8C8C8C;">17.950</td>
      <td headers="grp_a stub_1_2 row" class="gt_row gt_left" style="background-color: #7F7F7F;">row_2</td></tr>
          <tr><th id="stub_1_3" scope="row" class="gt_row gt_left gt_stub" style="background-color: #FFDAB9;"></th>
      <td headers="grp_a stub_1_3 num" class="gt_row gt_right" style="background-color: #D9D9D9;">3.333e+01</td>
      <td headers="grp_a stub_1_3 char" class="gt_row gt_left" style="background-color: #CCCCCC;">coconut</td>
      <td headers="grp_a stub_1_3 fctr" class="gt_row gt_center" style="background-color: #BFBFBF;">three</td>
      <td headers="grp_a stub_1_3 date" class="gt_row gt_right" style="background-color: #B3B3B3;">2015-03-15</td>
      <td headers="grp_a stub_1_3 time" class="gt_row gt_right" style="background-color: #A6A6A6;">15:45</td>
      <td headers="grp_a stub_1_3 datetime" class="gt_row gt_right" style="background-color: #999999;">2018-03-03 03:44</td>
      <td headers="grp_a stub_1_3 currency" class="gt_row gt_right" style="background-color: #8C8C8C;">1.390</td>
      <td headers="grp_a stub_1_3 row" class="gt_row gt_left" style="background-color: #7F7F7F;">row_3</td></tr>
          <tr><th id="stub_1_4" scope="row" class="gt_row gt_left gt_stub" style="background-color: #FFDAB9;"></th>
      <td headers="grp_a stub_1_4 num" class="gt_row gt_right" style="background-color: #D9D9D9;">4.444e+02</td>
      <td headers="grp_a stub_1_4 char" class="gt_row gt_left" style="background-color: #CCCCCC;">durian</td>
      <td headers="grp_a stub_1_4 fctr" class="gt_row gt_center" style="background-color: #BFBFBF;">four</td>
      <td headers="grp_a stub_1_4 date" class="gt_row gt_right" style="background-color: #B3B3B3;">2015-04-15</td>
      <td headers="grp_a stub_1_4 time" class="gt_row gt_right" style="background-color: #A6A6A6;">16:50</td>
      <td headers="grp_a stub_1_4 datetime" class="gt_row gt_right" style="background-color: #999999;">2018-04-04 15:55</td>
      <td headers="grp_a stub_1_4 currency" class="gt_row gt_right" style="background-color: #8C8C8C;">65100.000</td>
      <td headers="grp_a stub_1_4 row" class="gt_row gt_left" style="background-color: #7F7F7F;">row_4</td></tr>
          <tr><th id="summary_stub_grp_a_1" scope="row" class="gt_row gt_left gt_stub gt_summary_row gt_first_summary_row thick" style="background-color: #FFA500;">min</th>
      <td headers="grp_a summary_stub_grp_a_1 num" class="gt_row gt_right gt_summary_row gt_first_summary_row thick" style="background-color: #8FBC8F;">0.11</td>
      <td headers="grp_a summary_stub_grp_a_1 char" class="gt_row gt_left gt_summary_row gt_first_summary_row thick">—</td>
      <td headers="grp_a summary_stub_grp_a_1 fctr" class="gt_row gt_center gt_summary_row gt_first_summary_row thick">—</td>
      <td headers="grp_a summary_stub_grp_a_1 date" class="gt_row gt_right gt_summary_row gt_first_summary_row thick">—</td>
      <td headers="grp_a summary_stub_grp_a_1 time" class="gt_row gt_right gt_summary_row gt_first_summary_row thick">—</td>
      <td headers="grp_a summary_stub_grp_a_1 datetime" class="gt_row gt_right gt_summary_row gt_first_summary_row thick">—</td>
      <td headers="grp_a summary_stub_grp_a_1 currency" class="gt_row gt_right gt_summary_row gt_first_summary_row thick" style="background-color: #8FBC8F;">1.39</td>
      <td headers="grp_a summary_stub_grp_a_1 row" class="gt_row gt_left gt_summary_row gt_first_summary_row thick">—</td></tr>
          <tr><th id="summary_stub_grp_a_2" scope="row" class="gt_row gt_left gt_stub gt_summary_row" style="background-color: #FFA500;">max</th>
      <td headers="grp_a summary_stub_grp_a_2 num" class="gt_row gt_right gt_summary_row" style="background-color: #8FBC8F;">444.40</td>
      <td headers="grp_a summary_stub_grp_a_2 char" class="gt_row gt_left gt_summary_row">—</td>
      <td headers="grp_a summary_stub_grp_a_2 fctr" class="gt_row gt_center gt_summary_row">—</td>
      <td headers="grp_a summary_stub_grp_a_2 date" class="gt_row gt_right gt_summary_row">—</td>
      <td headers="grp_a summary_stub_grp_a_2 time" class="gt_row gt_right gt_summary_row">—</td>
      <td headers="grp_a summary_stub_grp_a_2 datetime" class="gt_row gt_right gt_summary_row">—</td>
      <td headers="grp_a summary_stub_grp_a_2 currency" class="gt_row gt_right gt_summary_row" style="background-color: #8FBC8F;">65100.00</td>
      <td headers="grp_a summary_stub_grp_a_2 row" class="gt_row gt_left gt_summary_row">—</td></tr>
          <tr><th id="summary_stub_grp_a_3" scope="row" class="gt_row gt_left gt_stub gt_summary_row gt_last_summary_row" style="background-color: #FFA500;">avg</th>
      <td headers="grp_a summary_stub_grp_a_3 num" class="gt_row gt_right gt_summary_row gt_last_summary_row" style="background-color: #8FBC8F;">120.02</td>
      <td headers="grp_a summary_stub_grp_a_3 char" class="gt_row gt_left gt_summary_row gt_last_summary_row">—</td>
      <td headers="grp_a summary_stub_grp_a_3 fctr" class="gt_row gt_center gt_summary_row gt_last_summary_row">—</td>
      <td headers="grp_a summary_stub_grp_a_3 date" class="gt_row gt_right gt_summary_row gt_last_summary_row">—</td>
      <td headers="grp_a summary_stub_grp_a_3 time" class="gt_row gt_right gt_summary_row gt_last_summary_row">—</td>
      <td headers="grp_a summary_stub_grp_a_3 datetime" class="gt_row gt_right gt_summary_row gt_last_summary_row">—</td>
      <td headers="grp_a summary_stub_grp_a_3 currency" class="gt_row gt_right gt_summary_row gt_last_summary_row" style="background-color: #8FBC8F;">16292.32</td>
      <td headers="grp_a summary_stub_grp_a_3 row" class="gt_row gt_left gt_summary_row gt_last_summary_row">—</td></tr>
          <tr class="gt_group_heading_row">
            <th colspan="9" class="gt_group_heading" style="background-color: #E0FFFF;" scope="colgroup" id="grp_b">grp_b</th>
          </tr>
          <tr class="gt_row_group_first"><th id="stub_1_5" scope="row" class="gt_row gt_left gt_stub" style="background-color: #FFDAB9;"></th>
      <td headers="grp_b stub_1_5 num" class="gt_row gt_right" style="background-color: #D9D9D9;">5.550e+03</td>
      <td headers="grp_b stub_1_5 char" class="gt_row gt_left" style="background-color: #CCCCCC;">NA</td>
      <td headers="grp_b stub_1_5 fctr" class="gt_row gt_center" style="background-color: #BFBFBF;">five</td>
      <td headers="grp_b stub_1_5 date" class="gt_row gt_right" style="background-color: #B3B3B3;">2015-05-15</td>
      <td headers="grp_b stub_1_5 time" class="gt_row gt_right" style="background-color: #A6A6A6;">17:55</td>
      <td headers="grp_b stub_1_5 datetime" class="gt_row gt_right" style="background-color: #999999;">2018-05-05 04:00</td>
      <td headers="grp_b stub_1_5 currency" class="gt_row gt_right" style="background-color: #8C8C8C;">1325.810</td>
      <td headers="grp_b stub_1_5 row" class="gt_row gt_left" style="background-color: #7F7F7F;">row_5</td></tr>
          <tr><th id="stub_1_6" scope="row" class="gt_row gt_left gt_stub" style="background-color: #FFDAB9;"></th>
      <td headers="grp_b stub_1_6 num" class="gt_row gt_right" style="background-color: #D9D9D9;">NA</td>
      <td headers="grp_b stub_1_6 char" class="gt_row gt_left" style="background-color: #CCCCCC;">fig</td>
      <td headers="grp_b stub_1_6 fctr" class="gt_row gt_center" style="background-color: #BFBFBF;">six</td>
      <td headers="grp_b stub_1_6 date" class="gt_row gt_right" style="background-color: #B3B3B3;">2015-06-15</td>
      <td headers="grp_b stub_1_6 time" class="gt_row gt_right" style="background-color: #A6A6A6;">NA</td>
      <td headers="grp_b stub_1_6 datetime" class="gt_row gt_right" style="background-color: #999999;">2018-06-06 16:11</td>
      <td headers="grp_b stub_1_6 currency" class="gt_row gt_right" style="background-color: #8C8C8C;">13.255</td>
      <td headers="grp_b stub_1_6 row" class="gt_row gt_left" style="background-color: #7F7F7F;">row_6</td></tr>
          <tr><th id="stub_1_7" scope="row" class="gt_row gt_left gt_stub" style="background-color: #FFDAB9;"></th>
      <td headers="grp_b stub_1_7 num" class="gt_row gt_right" style="background-color: #D9D9D9;">7.770e+05</td>
      <td headers="grp_b stub_1_7 char" class="gt_row gt_left" style="background-color: #CCCCCC;">grapefruit</td>
      <td headers="grp_b stub_1_7 fctr" class="gt_row gt_center" style="background-color: #BFBFBF;">seven</td>
      <td headers="grp_b stub_1_7 date" class="gt_row gt_right" style="background-color: #B3B3B3;">NA</td>
      <td headers="grp_b stub_1_7 time" class="gt_row gt_right" style="background-color: #A6A6A6;">19:10</td>
      <td headers="grp_b stub_1_7 datetime" class="gt_row gt_right" style="background-color: #999999;">2018-07-07 05:22</td>
      <td headers="grp_b stub_1_7 currency" class="gt_row gt_right" style="background-color: #8C8C8C;">NA</td>
      <td headers="grp_b stub_1_7 row" class="gt_row gt_left" style="background-color: #7F7F7F;">row_7</td></tr>
          <tr><th id="stub_1_8" scope="row" class="gt_row gt_left gt_stub" style="background-color: #FFDAB9;"></th>
      <td headers="grp_b stub_1_8 num" class="gt_row gt_right" style="background-color: #D9D9D9;">8.880e+06</td>
      <td headers="grp_b stub_1_8 char" class="gt_row gt_left" style="background-color: #CCCCCC;">honeydew</td>
      <td headers="grp_b stub_1_8 fctr" class="gt_row gt_center" style="background-color: #BFBFBF;">eight</td>
      <td headers="grp_b stub_1_8 date" class="gt_row gt_right" style="background-color: #B3B3B3;">2015-08-15</td>
      <td headers="grp_b stub_1_8 time" class="gt_row gt_right" style="background-color: #A6A6A6;">20:20</td>
      <td headers="grp_b stub_1_8 datetime" class="gt_row gt_right" style="background-color: #999999;">NA</td>
      <td headers="grp_b stub_1_8 currency" class="gt_row gt_right" style="background-color: #8C8C8C;">0.440</td>
      <td headers="grp_b stub_1_8 row" class="gt_row gt_left" style="background-color: #7F7F7F;">row_8</td></tr>
          <tr><th id="summary_stub_grp_b_1" scope="row" class="gt_row gt_left gt_stub gt_summary_row gt_first_summary_row thick" style="background-color: #FFA500;">min</th>
      <td headers="grp_b summary_stub_grp_b_1 num" class="gt_row gt_right gt_summary_row gt_first_summary_row thick" style="background-color: #8FBC8F;">5550.00</td>
      <td headers="grp_b summary_stub_grp_b_1 char" class="gt_row gt_left gt_summary_row gt_first_summary_row thick">—</td>
      <td headers="grp_b summary_stub_grp_b_1 fctr" class="gt_row gt_center gt_summary_row gt_first_summary_row thick">—</td>
      <td headers="grp_b summary_stub_grp_b_1 date" class="gt_row gt_right gt_summary_row gt_first_summary_row thick">—</td>
      <td headers="grp_b summary_stub_grp_b_1 time" class="gt_row gt_right gt_summary_row gt_first_summary_row thick">—</td>
      <td headers="grp_b summary_stub_grp_b_1 datetime" class="gt_row gt_right gt_summary_row gt_first_summary_row thick">—</td>
      <td headers="grp_b summary_stub_grp_b_1 currency" class="gt_row gt_right gt_summary_row gt_first_summary_row thick" style="background-color: #8FBC8F;">0.44</td>
      <td headers="grp_b summary_stub_grp_b_1 row" class="gt_row gt_left gt_summary_row gt_first_summary_row thick">—</td></tr>
          <tr><th id="summary_stub_grp_b_2" scope="row" class="gt_row gt_left gt_stub gt_summary_row" style="background-color: #FFA500;">max</th>
      <td headers="grp_b summary_stub_grp_b_2 num" class="gt_row gt_right gt_summary_row" style="background-color: #8FBC8F;">8880000.00</td>
      <td headers="grp_b summary_stub_grp_b_2 char" class="gt_row gt_left gt_summary_row">—</td>
      <td headers="grp_b summary_stub_grp_b_2 fctr" class="gt_row gt_center gt_summary_row">—</td>
      <td headers="grp_b summary_stub_grp_b_2 date" class="gt_row gt_right gt_summary_row">—</td>
      <td headers="grp_b summary_stub_grp_b_2 time" class="gt_row gt_right gt_summary_row">—</td>
      <td headers="grp_b summary_stub_grp_b_2 datetime" class="gt_row gt_right gt_summary_row">—</td>
      <td headers="grp_b summary_stub_grp_b_2 currency" class="gt_row gt_right gt_summary_row" style="background-color: #8FBC8F;">1325.81</td>
      <td headers="grp_b summary_stub_grp_b_2 row" class="gt_row gt_left gt_summary_row">—</td></tr>
          <tr><th id="summary_stub_grp_b_3" scope="row" class="gt_row gt_left gt_stub gt_summary_row gt_last_summary_row" style="background-color: #FFA500;">avg</th>
      <td headers="grp_b summary_stub_grp_b_3 num" class="gt_row gt_right gt_summary_row gt_last_summary_row" style="background-color: #8FBC8F;">3220850.00</td>
      <td headers="grp_b summary_stub_grp_b_3 char" class="gt_row gt_left gt_summary_row gt_last_summary_row">—</td>
      <td headers="grp_b summary_stub_grp_b_3 fctr" class="gt_row gt_center gt_summary_row gt_last_summary_row">—</td>
      <td headers="grp_b summary_stub_grp_b_3 date" class="gt_row gt_right gt_summary_row gt_last_summary_row">—</td>
      <td headers="grp_b summary_stub_grp_b_3 time" class="gt_row gt_right gt_summary_row gt_last_summary_row">—</td>
      <td headers="grp_b summary_stub_grp_b_3 datetime" class="gt_row gt_right gt_summary_row gt_last_summary_row">—</td>
      <td headers="grp_b summary_stub_grp_b_3 currency" class="gt_row gt_right gt_summary_row gt_last_summary_row" style="background-color: #8FBC8F;">446.50</td>
      <td headers="grp_b summary_stub_grp_b_3 row" class="gt_row gt_left gt_summary_row gt_last_summary_row">—</td></tr>
          <tr><th id="grand_summary_stub_1" scope="row" class="gt_row gt_left gt_stub gt_grand_summary_row gt_first_grand_summary_row" style="background-color: #FF0000;">min</th>
      <td headers="grand_summary_stub_1 num" class="gt_row gt_right gt_grand_summary_row gt_first_grand_summary_row" style="background-color: #D3D3D3;">0.11</td>
      <td headers="grand_summary_stub_1 char" class="gt_row gt_left gt_grand_summary_row gt_first_grand_summary_row">—</td>
      <td headers="grand_summary_stub_1 fctr" class="gt_row gt_center gt_grand_summary_row gt_first_grand_summary_row">—</td>
      <td headers="grand_summary_stub_1 date" class="gt_row gt_right gt_grand_summary_row gt_first_grand_summary_row">—</td>
      <td headers="grand_summary_stub_1 time" class="gt_row gt_right gt_grand_summary_row gt_first_grand_summary_row">—</td>
      <td headers="grand_summary_stub_1 datetime" class="gt_row gt_right gt_grand_summary_row gt_first_grand_summary_row">—</td>
      <td headers="grand_summary_stub_1 currency" class="gt_row gt_right gt_grand_summary_row gt_first_grand_summary_row" style="background-color: #D3D3D3;">0.44</td>
      <td headers="grand_summary_stub_1 row" class="gt_row gt_left gt_grand_summary_row gt_first_grand_summary_row">—</td></tr>
          <tr><th id="grand_summary_stub_2" scope="row" class="gt_row gt_left gt_stub gt_grand_summary_row" style="background-color: #FF0000;">max</th>
      <td headers="grand_summary_stub_2 num" class="gt_row gt_right gt_grand_summary_row" style="background-color: #D3D3D3;">8880000.00</td>
      <td headers="grand_summary_stub_2 char" class="gt_row gt_left gt_grand_summary_row">—</td>
      <td headers="grand_summary_stub_2 fctr" class="gt_row gt_center gt_grand_summary_row">—</td>
      <td headers="grand_summary_stub_2 date" class="gt_row gt_right gt_grand_summary_row">—</td>
      <td headers="grand_summary_stub_2 time" class="gt_row gt_right gt_grand_summary_row">—</td>
      <td headers="grand_summary_stub_2 datetime" class="gt_row gt_right gt_grand_summary_row">—</td>
      <td headers="grand_summary_stub_2 currency" class="gt_row gt_right gt_grand_summary_row" style="background-color: #D3D3D3;">65100.00</td>
      <td headers="grand_summary_stub_2 row" class="gt_row gt_left gt_grand_summary_row">—</td></tr>
          <tr><th id="grand_summary_stub_3" scope="row" class="gt_row gt_left gt_stub gt_grand_summary_row gt_last_summary_row" style="background-color: #FF0000;">avg</th>
      <td headers="grand_summary_stub_3 num" class="gt_row gt_right gt_grand_summary_row gt_last_summary_row" style="background-color: #D3D3D3;">1380432.87</td>
      <td headers="grand_summary_stub_3 char" class="gt_row gt_left gt_grand_summary_row gt_last_summary_row">—</td>
      <td headers="grand_summary_stub_3 fctr" class="gt_row gt_center gt_grand_summary_row gt_last_summary_row">—</td>
      <td headers="grand_summary_stub_3 date" class="gt_row gt_right gt_grand_summary_row gt_last_summary_row">—</td>
      <td headers="grand_summary_stub_3 time" class="gt_row gt_right gt_grand_summary_row gt_last_summary_row">—</td>
      <td headers="grand_summary_stub_3 datetime" class="gt_row gt_right gt_grand_summary_row gt_last_summary_row">—</td>
      <td headers="grand_summary_stub_3 currency" class="gt_row gt_right gt_grand_summary_row gt_last_summary_row" style="background-color: #D3D3D3;">9501.26</td>
      <td headers="grand_summary_stub_3 row" class="gt_row gt_left gt_grand_summary_row gt_last_summary_row">—</td></tr>
        </tbody>
        <tfoot>
          <tr class="gt_sourcenotes">
            <td class="gt_sourcenote" style="background-color: #F5DEB3;" colspan="9">Source note #1</td>
          </tr>
          <tr class="gt_sourcenotes">
            <td class="gt_sourcenote" style="background-color: #F5DEB3;" colspan="9">Source note #2</td>
          </tr>
        </tfoot>
      </table>

---

    Code
      cat(render_as_html(gt_tbl))
    Output
      <table class="gt_table" data-quarto-disable-processing="false" data-quarto-bootstrap="false">
        <thead>
          <tr class="gt_heading">
            <td colspan="9" class="gt_heading gt_title gt_font_normal" style="background-color: #ADD8E6;"><span class='gt_from_md'>Data listing from <strong>exibble</strong></span></td>
          </tr>
          <tr class="gt_heading">
            <td colspan="9" class="gt_heading gt_subtitle gt_font_normal gt_bottom_border" style="background-color: #00FFFF;"><span class='gt_from_md'><code>exibble</code> is an R dataset</span></td>
          </tr>
          <tr class="gt_col_headings gt_spanner_row">
            <th class="gt_col_heading gt_columns_bottom_border gt_left" rowspan="2" colspan="1" style="background-color: #DCDCDC;" scope="col" id="a::stub">S.L.</th>
            <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="2" colspan="1" style="background-color: #7FFFD4;" scope="col" id="num">num</th>
            <th class="gt_col_heading gt_columns_bottom_border gt_left" rowspan="2" colspan="1" style="background-color: #7FFFD4;" scope="col" id="char">char</th>
            <th class="gt_col_heading gt_columns_bottom_border gt_center" rowspan="2" colspan="1" style="background-color: #7FFFD4;" scope="col" id="fctr">fctr</th>
            <th class="gt_center gt_columns_top_border gt_column_spanner_outer" rowspan="1" colspan="3" style="background-color: #FFFF00;" scope="colgroup" id="timing">
              <div class="gt_column_spanner">timing</div>
            </th>
            <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="2" colspan="1" style="background-color: #7FFFD4;" scope="col" id="currency">currency</th>
            <th class="gt_col_heading gt_columns_bottom_border gt_left" rowspan="2" colspan="1" style="background-color: #7FFFD4;" scope="col" id="row">row</th>
          </tr>
          <tr class="gt_col_headings">
            <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" style="background-color: #7FFFD4;" scope="col" id="date">date</th>
            <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" style="background-color: #7FFFD4;" scope="col" id="time">time</th>
            <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" style="background-color: #7FFFD4;" scope="col" id="datetime">datetime</th>
          </tr>
        </thead>
        <tbody class="gt_table_body">
          <tr class="gt_row_group_first"><td headers="grp_a stub_2_1 stub_1" rowspan="4" class="gt_row gt_left gt_stub_row_group" style="background-color: #E0FFFF;">grp_a</td>
      <td headers="grp_a stub_2_1 num" class="gt_row gt_right" style="background-color: #D9D9D9;">1.111e-01</td>
      <td headers="grp_a stub_2_1 char" class="gt_row gt_left" style="background-color: #CCCCCC;">apricot</td>
      <td headers="grp_a stub_2_1 fctr" class="gt_row gt_center" style="background-color: #BFBFBF;">one</td>
      <td headers="grp_a stub_2_1 date" class="gt_row gt_right" style="background-color: #B3B3B3;">2015-01-15</td>
      <td headers="grp_a stub_2_1 time" class="gt_row gt_right" style="background-color: #A6A6A6;">13:35</td>
      <td headers="grp_a stub_2_1 datetime" class="gt_row gt_right" style="background-color: #999999;">2018-01-01 02:22</td>
      <td headers="grp_a stub_2_1 currency" class="gt_row gt_right" style="background-color: #8C8C8C;">49.950</td>
      <td headers="grp_a stub_2_1 row" class="gt_row gt_left" style="background-color: #7F7F7F;">row_1</td></tr>
          <tr><td headers="grp_a stub_2_2 num" class="gt_row gt_right" style="background-color: #D9D9D9;">2.222e+00</td>
      <td headers="grp_a stub_2_2 char" class="gt_row gt_left" style="background-color: #CCCCCC;">banana</td>
      <td headers="grp_a stub_2_2 fctr" class="gt_row gt_center" style="background-color: #BFBFBF;">two</td>
      <td headers="grp_a stub_2_2 date" class="gt_row gt_right" style="background-color: #B3B3B3;">2015-02-15</td>
      <td headers="grp_a stub_2_2 time" class="gt_row gt_right" style="background-color: #A6A6A6;">14:40</td>
      <td headers="grp_a stub_2_2 datetime" class="gt_row gt_right" style="background-color: #999999;">2018-02-02 14:33</td>
      <td headers="grp_a stub_2_2 currency" class="gt_row gt_right" style="background-color: #8C8C8C;">17.950</td>
      <td headers="grp_a stub_2_2 row" class="gt_row gt_left" style="background-color: #7F7F7F;">row_2</td></tr>
          <tr><td headers="grp_a stub_2_3 num" class="gt_row gt_right" style="background-color: #D9D9D9;">3.333e+01</td>
      <td headers="grp_a stub_2_3 char" class="gt_row gt_left" style="background-color: #CCCCCC;">coconut</td>
      <td headers="grp_a stub_2_3 fctr" class="gt_row gt_center" style="background-color: #BFBFBF;">three</td>
      <td headers="grp_a stub_2_3 date" class="gt_row gt_right" style="background-color: #B3B3B3;">2015-03-15</td>
      <td headers="grp_a stub_2_3 time" class="gt_row gt_right" style="background-color: #A6A6A6;">15:45</td>
      <td headers="grp_a stub_2_3 datetime" class="gt_row gt_right" style="background-color: #999999;">2018-03-03 03:44</td>
      <td headers="grp_a stub_2_3 currency" class="gt_row gt_right" style="background-color: #8C8C8C;">1.390</td>
      <td headers="grp_a stub_2_3 row" class="gt_row gt_left" style="background-color: #7F7F7F;">row_3</td></tr>
          <tr><td headers="grp_a stub_2_4 num" class="gt_row gt_right" style="background-color: #D9D9D9;">4.444e+02</td>
      <td headers="grp_a stub_2_4 char" class="gt_row gt_left" style="background-color: #CCCCCC;">durian</td>
      <td headers="grp_a stub_2_4 fctr" class="gt_row gt_center" style="background-color: #BFBFBF;">four</td>
      <td headers="grp_a stub_2_4 date" class="gt_row gt_right" style="background-color: #B3B3B3;">2015-04-15</td>
      <td headers="grp_a stub_2_4 time" class="gt_row gt_right" style="background-color: #A6A6A6;">16:50</td>
      <td headers="grp_a stub_2_4 datetime" class="gt_row gt_right" style="background-color: #999999;">2018-04-04 15:55</td>
      <td headers="grp_a stub_2_4 currency" class="gt_row gt_right" style="background-color: #8C8C8C;">65100.000</td>
      <td headers="grp_a stub_2_4 row" class="gt_row gt_left" style="background-color: #7F7F7F;">row_4</td></tr>
          <tr><th id="summary_stub_grp_a_1" scope="row" class="gt_row gt_left gt_stub gt_summary_row gt_first_summary_row" style="background-color: #FFA500;">min</th>
      <td headers="grp_a summary_stub_grp_a_1 num" class="gt_row gt_right gt_summary_row gt_first_summary_row" style="background-color: #8FBC8F;">0.11</td>
      <td headers="grp_a summary_stub_grp_a_1 char" class="gt_row gt_left gt_summary_row gt_first_summary_row">—</td>
      <td headers="grp_a summary_stub_grp_a_1 fctr" class="gt_row gt_center gt_summary_row gt_first_summary_row">—</td>
      <td headers="grp_a summary_stub_grp_a_1 date" class="gt_row gt_right gt_summary_row gt_first_summary_row">—</td>
      <td headers="grp_a summary_stub_grp_a_1 time" class="gt_row gt_right gt_summary_row gt_first_summary_row">—</td>
      <td headers="grp_a summary_stub_grp_a_1 datetime" class="gt_row gt_right gt_summary_row gt_first_summary_row">—</td>
      <td headers="grp_a summary_stub_grp_a_1 currency" class="gt_row gt_right gt_summary_row gt_first_summary_row" style="background-color: #8FBC8F;">1.39</td>
      <td headers="grp_a summary_stub_grp_a_1 row" class="gt_row gt_left gt_summary_row gt_first_summary_row">—</td></tr>
          <tr><th id="summary_stub_grp_a_2" scope="row" class="gt_row gt_left gt_stub gt_summary_row" style="background-color: #FFA500;">max</th>
      <td headers="grp_a summary_stub_grp_a_2 num" class="gt_row gt_right gt_summary_row" style="background-color: #8FBC8F;">444.40</td>
      <td headers="grp_a summary_stub_grp_a_2 char" class="gt_row gt_left gt_summary_row">—</td>
      <td headers="grp_a summary_stub_grp_a_2 fctr" class="gt_row gt_center gt_summary_row">—</td>
      <td headers="grp_a summary_stub_grp_a_2 date" class="gt_row gt_right gt_summary_row">—</td>
      <td headers="grp_a summary_stub_grp_a_2 time" class="gt_row gt_right gt_summary_row">—</td>
      <td headers="grp_a summary_stub_grp_a_2 datetime" class="gt_row gt_right gt_summary_row">—</td>
      <td headers="grp_a summary_stub_grp_a_2 currency" class="gt_row gt_right gt_summary_row" style="background-color: #8FBC8F;">65100.00</td>
      <td headers="grp_a summary_stub_grp_a_2 row" class="gt_row gt_left gt_summary_row">—</td></tr>
          <tr><th id="summary_stub_grp_a_3" scope="row" class="gt_row gt_left gt_stub gt_summary_row gt_last_summary_row" style="background-color: #FFA500;">avg</th>
      <td headers="grp_a summary_stub_grp_a_3 num" class="gt_row gt_right gt_summary_row gt_last_summary_row" style="background-color: #8FBC8F;">120.02</td>
      <td headers="grp_a summary_stub_grp_a_3 char" class="gt_row gt_left gt_summary_row gt_last_summary_row">—</td>
      <td headers="grp_a summary_stub_grp_a_3 fctr" class="gt_row gt_center gt_summary_row gt_last_summary_row">—</td>
      <td headers="grp_a summary_stub_grp_a_3 date" class="gt_row gt_right gt_summary_row gt_last_summary_row">—</td>
      <td headers="grp_a summary_stub_grp_a_3 time" class="gt_row gt_right gt_summary_row gt_last_summary_row">—</td>
      <td headers="grp_a summary_stub_grp_a_3 datetime" class="gt_row gt_right gt_summary_row gt_last_summary_row">—</td>
      <td headers="grp_a summary_stub_grp_a_3 currency" class="gt_row gt_right gt_summary_row gt_last_summary_row" style="background-color: #8FBC8F;">16292.32</td>
      <td headers="grp_a summary_stub_grp_a_3 row" class="gt_row gt_left gt_summary_row gt_last_summary_row">—</td></tr>
          <tr class="gt_row_group_first"><td headers="grp_b stub_2_5 stub_1" rowspan="4" class="gt_row gt_left gt_stub_row_group" style="background-color: #E0FFFF;">grp_b</td>
      <td headers="grp_b stub_2_5 num" class="gt_row gt_right" style="background-color: #D9D9D9;">5.550e+03</td>
      <td headers="grp_b stub_2_5 char" class="gt_row gt_left" style="background-color: #CCCCCC;">NA</td>
      <td headers="grp_b stub_2_5 fctr" class="gt_row gt_center" style="background-color: #BFBFBF;">five</td>
      <td headers="grp_b stub_2_5 date" class="gt_row gt_right" style="background-color: #B3B3B3;">2015-05-15</td>
      <td headers="grp_b stub_2_5 time" class="gt_row gt_right" style="background-color: #A6A6A6;">17:55</td>
      <td headers="grp_b stub_2_5 datetime" class="gt_row gt_right" style="background-color: #999999;">2018-05-05 04:00</td>
      <td headers="grp_b stub_2_5 currency" class="gt_row gt_right" style="background-color: #8C8C8C;">1325.810</td>
      <td headers="grp_b stub_2_5 row" class="gt_row gt_left" style="background-color: #7F7F7F;">row_5</td></tr>
          <tr><td headers="grp_b stub_2_6 num" class="gt_row gt_right" style="background-color: #D9D9D9;">NA</td>
      <td headers="grp_b stub_2_6 char" class="gt_row gt_left" style="background-color: #CCCCCC;">fig</td>
      <td headers="grp_b stub_2_6 fctr" class="gt_row gt_center" style="background-color: #BFBFBF;">six</td>
      <td headers="grp_b stub_2_6 date" class="gt_row gt_right" style="background-color: #B3B3B3;">2015-06-15</td>
      <td headers="grp_b stub_2_6 time" class="gt_row gt_right" style="background-color: #A6A6A6;">NA</td>
      <td headers="grp_b stub_2_6 datetime" class="gt_row gt_right" style="background-color: #999999;">2018-06-06 16:11</td>
      <td headers="grp_b stub_2_6 currency" class="gt_row gt_right" style="background-color: #8C8C8C;">13.255</td>
      <td headers="grp_b stub_2_6 row" class="gt_row gt_left" style="background-color: #7F7F7F;">row_6</td></tr>
          <tr><td headers="grp_b stub_2_7 num" class="gt_row gt_right" style="background-color: #D9D9D9;">7.770e+05</td>
      <td headers="grp_b stub_2_7 char" class="gt_row gt_left" style="background-color: #CCCCCC;">grapefruit</td>
      <td headers="grp_b stub_2_7 fctr" class="gt_row gt_center" style="background-color: #BFBFBF;">seven</td>
      <td headers="grp_b stub_2_7 date" class="gt_row gt_right" style="background-color: #B3B3B3;">NA</td>
      <td headers="grp_b stub_2_7 time" class="gt_row gt_right" style="background-color: #A6A6A6;">19:10</td>
      <td headers="grp_b stub_2_7 datetime" class="gt_row gt_right" style="background-color: #999999;">2018-07-07 05:22</td>
      <td headers="grp_b stub_2_7 currency" class="gt_row gt_right" style="background-color: #8C8C8C;">NA</td>
      <td headers="grp_b stub_2_7 row" class="gt_row gt_left" style="background-color: #7F7F7F;">row_7</td></tr>
          <tr><td headers="grp_b stub_2_8 num" class="gt_row gt_right" style="background-color: #D9D9D9;">8.880e+06</td>
      <td headers="grp_b stub_2_8 char" class="gt_row gt_left" style="background-color: #CCCCCC;">honeydew</td>
      <td headers="grp_b stub_2_8 fctr" class="gt_row gt_center" style="background-color: #BFBFBF;">eight</td>
      <td headers="grp_b stub_2_8 date" class="gt_row gt_right" style="background-color: #B3B3B3;">2015-08-15</td>
      <td headers="grp_b stub_2_8 time" class="gt_row gt_right" style="background-color: #A6A6A6;">20:20</td>
      <td headers="grp_b stub_2_8 datetime" class="gt_row gt_right" style="background-color: #999999;">NA</td>
      <td headers="grp_b stub_2_8 currency" class="gt_row gt_right" style="background-color: #8C8C8C;">0.440</td>
      <td headers="grp_b stub_2_8 row" class="gt_row gt_left" style="background-color: #7F7F7F;">row_8</td></tr>
          <tr><th id="summary_stub_grp_b_1" scope="row" class="gt_row gt_left gt_stub gt_summary_row gt_first_summary_row" style="background-color: #FFA500;">min</th>
      <td headers="grp_b summary_stub_grp_b_1 num" class="gt_row gt_right gt_summary_row gt_first_summary_row" style="background-color: #8FBC8F;">5550.00</td>
      <td headers="grp_b summary_stub_grp_b_1 char" class="gt_row gt_left gt_summary_row gt_first_summary_row">—</td>
      <td headers="grp_b summary_stub_grp_b_1 fctr" class="gt_row gt_center gt_summary_row gt_first_summary_row">—</td>
      <td headers="grp_b summary_stub_grp_b_1 date" class="gt_row gt_right gt_summary_row gt_first_summary_row">—</td>
      <td headers="grp_b summary_stub_grp_b_1 time" class="gt_row gt_right gt_summary_row gt_first_summary_row">—</td>
      <td headers="grp_b summary_stub_grp_b_1 datetime" class="gt_row gt_right gt_summary_row gt_first_summary_row">—</td>
      <td headers="grp_b summary_stub_grp_b_1 currency" class="gt_row gt_right gt_summary_row gt_first_summary_row" style="background-color: #8FBC8F;">0.44</td>
      <td headers="grp_b summary_stub_grp_b_1 row" class="gt_row gt_left gt_summary_row gt_first_summary_row">—</td></tr>
          <tr><th id="summary_stub_grp_b_2" scope="row" class="gt_row gt_left gt_stub gt_summary_row" style="background-color: #FFA500;">max</th>
      <td headers="grp_b summary_stub_grp_b_2 num" class="gt_row gt_right gt_summary_row" style="background-color: #8FBC8F;">8880000.00</td>
      <td headers="grp_b summary_stub_grp_b_2 char" class="gt_row gt_left gt_summary_row">—</td>
      <td headers="grp_b summary_stub_grp_b_2 fctr" class="gt_row gt_center gt_summary_row">—</td>
      <td headers="grp_b summary_stub_grp_b_2 date" class="gt_row gt_right gt_summary_row">—</td>
      <td headers="grp_b summary_stub_grp_b_2 time" class="gt_row gt_right gt_summary_row">—</td>
      <td headers="grp_b summary_stub_grp_b_2 datetime" class="gt_row gt_right gt_summary_row">—</td>
      <td headers="grp_b summary_stub_grp_b_2 currency" class="gt_row gt_right gt_summary_row" style="background-color: #8FBC8F;">1325.81</td>
      <td headers="grp_b summary_stub_grp_b_2 row" class="gt_row gt_left gt_summary_row">—</td></tr>
          <tr><th id="summary_stub_grp_b_3" scope="row" class="gt_row gt_left gt_stub gt_summary_row gt_last_summary_row" style="background-color: #FFA500;">avg</th>
      <td headers="grp_b summary_stub_grp_b_3 num" class="gt_row gt_right gt_summary_row gt_last_summary_row" style="background-color: #8FBC8F;">3220850.00</td>
      <td headers="grp_b summary_stub_grp_b_3 char" class="gt_row gt_left gt_summary_row gt_last_summary_row">—</td>
      <td headers="grp_b summary_stub_grp_b_3 fctr" class="gt_row gt_center gt_summary_row gt_last_summary_row">—</td>
      <td headers="grp_b summary_stub_grp_b_3 date" class="gt_row gt_right gt_summary_row gt_last_summary_row">—</td>
      <td headers="grp_b summary_stub_grp_b_3 time" class="gt_row gt_right gt_summary_row gt_last_summary_row">—</td>
      <td headers="grp_b summary_stub_grp_b_3 datetime" class="gt_row gt_right gt_summary_row gt_last_summary_row">—</td>
      <td headers="grp_b summary_stub_grp_b_3 currency" class="gt_row gt_right gt_summary_row gt_last_summary_row" style="background-color: #8FBC8F;">446.50</td>
      <td headers="grp_b summary_stub_grp_b_3 row" class="gt_row gt_left gt_summary_row gt_last_summary_row">—</td></tr>
          <tr><th id="grand_summary_stub_1" scope="row" class="gt_row gt_left gt_stub gt_grand_summary_row gt_first_grand_summary_row" style="background-color: #FF0000;">min</th>
      <td headers="grand_summary_stub_1 num" class="gt_row gt_right gt_grand_summary_row gt_first_grand_summary_row" style="background-color: #D3D3D3;">0.11</td>
      <td headers="grand_summary_stub_1 char" class="gt_row gt_left gt_grand_summary_row gt_first_grand_summary_row">—</td>
      <td headers="grand_summary_stub_1 fctr" class="gt_row gt_center gt_grand_summary_row gt_first_grand_summary_row">—</td>
      <td headers="grand_summary_stub_1 date" class="gt_row gt_right gt_grand_summary_row gt_first_grand_summary_row">—</td>
      <td headers="grand_summary_stub_1 time" class="gt_row gt_right gt_grand_summary_row gt_first_grand_summary_row">—</td>
      <td headers="grand_summary_stub_1 datetime" class="gt_row gt_right gt_grand_summary_row gt_first_grand_summary_row">—</td>
      <td headers="grand_summary_stub_1 currency" class="gt_row gt_right gt_grand_summary_row gt_first_grand_summary_row" style="background-color: #D3D3D3;">0.44</td>
      <td headers="grand_summary_stub_1 row" class="gt_row gt_left gt_grand_summary_row gt_first_grand_summary_row">—</td></tr>
          <tr><th id="grand_summary_stub_2" scope="row" class="gt_row gt_left gt_stub gt_grand_summary_row" style="background-color: #FF0000;">max</th>
      <td headers="grand_summary_stub_2 num" class="gt_row gt_right gt_grand_summary_row" style="background-color: #D3D3D3;">8880000.00</td>
      <td headers="grand_summary_stub_2 char" class="gt_row gt_left gt_grand_summary_row">—</td>
      <td headers="grand_summary_stub_2 fctr" class="gt_row gt_center gt_grand_summary_row">—</td>
      <td headers="grand_summary_stub_2 date" class="gt_row gt_right gt_grand_summary_row">—</td>
      <td headers="grand_summary_stub_2 time" class="gt_row gt_right gt_grand_summary_row">—</td>
      <td headers="grand_summary_stub_2 datetime" class="gt_row gt_right gt_grand_summary_row">—</td>
      <td headers="grand_summary_stub_2 currency" class="gt_row gt_right gt_grand_summary_row" style="background-color: #D3D3D3;">65100.00</td>
      <td headers="grand_summary_stub_2 row" class="gt_row gt_left gt_grand_summary_row">—</td></tr>
          <tr><th id="grand_summary_stub_3" scope="row" class="gt_row gt_left gt_stub gt_grand_summary_row gt_last_summary_row" style="background-color: #FF0000;">avg</th>
      <td headers="grand_summary_stub_3 num" class="gt_row gt_right gt_grand_summary_row gt_last_summary_row" style="background-color: #D3D3D3;">1380432.87</td>
      <td headers="grand_summary_stub_3 char" class="gt_row gt_left gt_grand_summary_row gt_last_summary_row">—</td>
      <td headers="grand_summary_stub_3 fctr" class="gt_row gt_center gt_grand_summary_row gt_last_summary_row">—</td>
      <td headers="grand_summary_stub_3 date" class="gt_row gt_right gt_grand_summary_row gt_last_summary_row">—</td>
      <td headers="grand_summary_stub_3 time" class="gt_row gt_right gt_grand_summary_row gt_last_summary_row">—</td>
      <td headers="grand_summary_stub_3 datetime" class="gt_row gt_right gt_grand_summary_row gt_last_summary_row">—</td>
      <td headers="grand_summary_stub_3 currency" class="gt_row gt_right gt_grand_summary_row gt_last_summary_row" style="background-color: #D3D3D3;">9501.26</td>
      <td headers="grand_summary_stub_3 row" class="gt_row gt_left gt_grand_summary_row gt_last_summary_row">—</td></tr>
        </tbody>
        <tfoot>
          <tr class="gt_sourcenotes">
            <td class="gt_sourcenote" style="background-color: #F5DEB3;" colspan="9">Source note #1</td>
          </tr>
          <tr class="gt_sourcenotes">
            <td class="gt_sourcenote" style="background-color: #F5DEB3;" colspan="9">Source note #2</td>
          </tr>
        </tfoot>
      </table>

---

    Code
      cat(render_as_html(gt_tbl))
    Output
      <table class="gt_table" data-quarto-disable-processing="false" data-quarto-bootstrap="false">
        <thead>
          <tr class="gt_heading">
            <td colspan="9" class="gt_heading gt_title gt_font_normal" style="background-color: #ADD8E6;"><span class='gt_from_md'>Data listing from <strong>exibble</strong></span></td>
          </tr>
          <tr class="gt_heading">
            <td colspan="9" class="gt_heading gt_subtitle gt_font_normal gt_bottom_border" style="background-color: #00FFFF;"><span class='gt_from_md'><code>exibble</code> is an R dataset</span></td>
          </tr>
          <tr class="gt_col_headings gt_spanner_row">
            <th class="gt_col_heading gt_columns_bottom_border gt_left" rowspan="2" colspan="1" style="background-color: #DCDCDC;" scope="col" id="a::stub">S.L.</th>
            <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="2" colspan="1" style="background-color: #7FFFD4;" scope="col" id="num">num</th>
            <th class="gt_col_heading gt_columns_bottom_border gt_left" rowspan="2" colspan="1" style="background-color: #7FFFD4;" scope="col" id="char">char</th>
            <th class="gt_col_heading gt_columns_bottom_border gt_center" rowspan="2" colspan="1" style="background-color: #7FFFD4;" scope="col" id="fctr">fctr</th>
            <th class="gt_center gt_columns_top_border gt_column_spanner_outer" rowspan="1" colspan="3" style="background-color: #FFFF00;" scope="colgroup" id="timing">
              <div class="gt_column_spanner">timing</div>
            </th>
            <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="2" colspan="1" style="background-color: #7FFFD4;" scope="col" id="currency">currency</th>
            <th class="gt_col_heading gt_columns_bottom_border gt_left" rowspan="2" colspan="1" style="background-color: #7FFFD4;" scope="col" id="group">group</th>
          </tr>
          <tr class="gt_col_headings">
            <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" style="background-color: #7FFFD4;" scope="col" id="date">date</th>
            <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" style="background-color: #7FFFD4;" scope="col" id="time">time</th>
            <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" style="background-color: #7FFFD4;" scope="col" id="datetime">datetime</th>
          </tr>
        </thead>
        <tbody class="gt_table_body">
          <tr><th id="stub_1_1" scope="row" class="gt_row gt_left gt_stub" style="background-color: #FFDAB9;">row_1</th>
      <td headers="stub_1_1 num" class="gt_row gt_right" style="background-color: #D9D9D9;">1.111e-01</td>
      <td headers="stub_1_1 char" class="gt_row gt_left" style="background-color: #CCCCCC;">apricot</td>
      <td headers="stub_1_1 fctr" class="gt_row gt_center" style="background-color: #BFBFBF;">one</td>
      <td headers="stub_1_1 date" class="gt_row gt_right" style="background-color: #B3B3B3;">2015-01-15</td>
      <td headers="stub_1_1 time" class="gt_row gt_right" style="background-color: #A6A6A6;">13:35</td>
      <td headers="stub_1_1 datetime" class="gt_row gt_right" style="background-color: #999999;">2018-01-01 02:22</td>
      <td headers="stub_1_1 currency" class="gt_row gt_right" style="background-color: #8C8C8C;">49.950</td>
      <td headers="stub_1_1 group" class="gt_row gt_left" style="background-color: #737373;">grp_a</td></tr>
          <tr><th id="stub_1_2" scope="row" class="gt_row gt_left gt_stub" style="background-color: #FFDAB9;">row_2</th>
      <td headers="stub_1_2 num" class="gt_row gt_right" style="background-color: #D9D9D9;">2.222e+00</td>
      <td headers="stub_1_2 char" class="gt_row gt_left" style="background-color: #CCCCCC;">banana</td>
      <td headers="stub_1_2 fctr" class="gt_row gt_center" style="background-color: #BFBFBF;">two</td>
      <td headers="stub_1_2 date" class="gt_row gt_right" style="background-color: #B3B3B3;">2015-02-15</td>
      <td headers="stub_1_2 time" class="gt_row gt_right" style="background-color: #A6A6A6;">14:40</td>
      <td headers="stub_1_2 datetime" class="gt_row gt_right" style="background-color: #999999;">2018-02-02 14:33</td>
      <td headers="stub_1_2 currency" class="gt_row gt_right" style="background-color: #8C8C8C;">17.950</td>
      <td headers="stub_1_2 group" class="gt_row gt_left" style="background-color: #737373;">grp_a</td></tr>
          <tr><th id="stub_1_3" scope="row" class="gt_row gt_left gt_stub" style="background-color: #FFDAB9;">row_3</th>
      <td headers="stub_1_3 num" class="gt_row gt_right" style="background-color: #D9D9D9;">3.333e+01</td>
      <td headers="stub_1_3 char" class="gt_row gt_left" style="background-color: #CCCCCC;">coconut</td>
      <td headers="stub_1_3 fctr" class="gt_row gt_center" style="background-color: #BFBFBF;">three</td>
      <td headers="stub_1_3 date" class="gt_row gt_right" style="background-color: #B3B3B3;">2015-03-15</td>
      <td headers="stub_1_3 time" class="gt_row gt_right" style="background-color: #A6A6A6;">15:45</td>
      <td headers="stub_1_3 datetime" class="gt_row gt_right" style="background-color: #999999;">2018-03-03 03:44</td>
      <td headers="stub_1_3 currency" class="gt_row gt_right" style="background-color: #8C8C8C;">1.390</td>
      <td headers="stub_1_3 group" class="gt_row gt_left" style="background-color: #737373;">grp_a</td></tr>
          <tr><th id="stub_1_4" scope="row" class="gt_row gt_left gt_stub" style="background-color: #FFDAB9;">row_4</th>
      <td headers="stub_1_4 num" class="gt_row gt_right" style="background-color: #D9D9D9;">4.444e+02</td>
      <td headers="stub_1_4 char" class="gt_row gt_left" style="background-color: #CCCCCC;">durian</td>
      <td headers="stub_1_4 fctr" class="gt_row gt_center" style="background-color: #BFBFBF;">four</td>
      <td headers="stub_1_4 date" class="gt_row gt_right" style="background-color: #B3B3B3;">2015-04-15</td>
      <td headers="stub_1_4 time" class="gt_row gt_right" style="background-color: #A6A6A6;">16:50</td>
      <td headers="stub_1_4 datetime" class="gt_row gt_right" style="background-color: #999999;">2018-04-04 15:55</td>
      <td headers="stub_1_4 currency" class="gt_row gt_right" style="background-color: #8C8C8C;">65100.000</td>
      <td headers="stub_1_4 group" class="gt_row gt_left" style="background-color: #737373;">grp_a</td></tr>
          <tr><th id="stub_1_5" scope="row" class="gt_row gt_left gt_stub" style="background-color: #FFDAB9;">row_5</th>
      <td headers="stub_1_5 num" class="gt_row gt_right" style="background-color: #D9D9D9;">5.550e+03</td>
      <td headers="stub_1_5 char" class="gt_row gt_left" style="background-color: #CCCCCC;">NA</td>
      <td headers="stub_1_5 fctr" class="gt_row gt_center" style="background-color: #BFBFBF;">five</td>
      <td headers="stub_1_5 date" class="gt_row gt_right" style="background-color: #B3B3B3;">2015-05-15</td>
      <td headers="stub_1_5 time" class="gt_row gt_right" style="background-color: #A6A6A6;">17:55</td>
      <td headers="stub_1_5 datetime" class="gt_row gt_right" style="background-color: #999999;">2018-05-05 04:00</td>
      <td headers="stub_1_5 currency" class="gt_row gt_right" style="background-color: #8C8C8C;">1325.810</td>
      <td headers="stub_1_5 group" class="gt_row gt_left" style="background-color: #737373;">grp_b</td></tr>
          <tr><th id="stub_1_6" scope="row" class="gt_row gt_left gt_stub" style="background-color: #FFDAB9;">row_6</th>
      <td headers="stub_1_6 num" class="gt_row gt_right" style="background-color: #D9D9D9;">NA</td>
      <td headers="stub_1_6 char" class="gt_row gt_left" style="background-color: #CCCCCC;">fig</td>
      <td headers="stub_1_6 fctr" class="gt_row gt_center" style="background-color: #BFBFBF;">six</td>
      <td headers="stub_1_6 date" class="gt_row gt_right" style="background-color: #B3B3B3;">2015-06-15</td>
      <td headers="stub_1_6 time" class="gt_row gt_right" style="background-color: #A6A6A6;">NA</td>
      <td headers="stub_1_6 datetime" class="gt_row gt_right" style="background-color: #999999;">2018-06-06 16:11</td>
      <td headers="stub_1_6 currency" class="gt_row gt_right" style="background-color: #8C8C8C;">13.255</td>
      <td headers="stub_1_6 group" class="gt_row gt_left" style="background-color: #737373;">grp_b</td></tr>
          <tr><th id="stub_1_7" scope="row" class="gt_row gt_left gt_stub" style="background-color: #FFDAB9;">row_7</th>
      <td headers="stub_1_7 num" class="gt_row gt_right" style="background-color: #D9D9D9;">7.770e+05</td>
      <td headers="stub_1_7 char" class="gt_row gt_left" style="background-color: #CCCCCC;">grapefruit</td>
      <td headers="stub_1_7 fctr" class="gt_row gt_center" style="background-color: #BFBFBF;">seven</td>
      <td headers="stub_1_7 date" class="gt_row gt_right" style="background-color: #B3B3B3;">NA</td>
      <td headers="stub_1_7 time" class="gt_row gt_right" style="background-color: #A6A6A6;">19:10</td>
      <td headers="stub_1_7 datetime" class="gt_row gt_right" style="background-color: #999999;">2018-07-07 05:22</td>
      <td headers="stub_1_7 currency" class="gt_row gt_right" style="background-color: #8C8C8C;">NA</td>
      <td headers="stub_1_7 group" class="gt_row gt_left" style="background-color: #737373;">grp_b</td></tr>
          <tr><th id="stub_1_8" scope="row" class="gt_row gt_left gt_stub" style="background-color: #FFDAB9;">row_8</th>
      <td headers="stub_1_8 num" class="gt_row gt_right" style="background-color: #D9D9D9;">8.880e+06</td>
      <td headers="stub_1_8 char" class="gt_row gt_left" style="background-color: #CCCCCC;">honeydew</td>
      <td headers="stub_1_8 fctr" class="gt_row gt_center" style="background-color: #BFBFBF;">eight</td>
      <td headers="stub_1_8 date" class="gt_row gt_right" style="background-color: #B3B3B3;">2015-08-15</td>
      <td headers="stub_1_8 time" class="gt_row gt_right" style="background-color: #A6A6A6;">20:20</td>
      <td headers="stub_1_8 datetime" class="gt_row gt_right" style="background-color: #999999;">NA</td>
      <td headers="stub_1_8 currency" class="gt_row gt_right" style="background-color: #8C8C8C;">0.440</td>
      <td headers="stub_1_8 group" class="gt_row gt_left" style="background-color: #737373;">grp_b</td></tr>
          <tr><th id="grand_summary_stub_1" scope="row" class="gt_row gt_left gt_stub gt_grand_summary_row gt_first_grand_summary_row" style="background-color: #FF0000;">min</th>
      <td headers="grand_summary_stub_1 num" class="gt_row gt_right gt_grand_summary_row gt_first_grand_summary_row" style="background-color: #D3D3D3;">0.11</td>
      <td headers="grand_summary_stub_1 char" class="gt_row gt_left gt_grand_summary_row gt_first_grand_summary_row">—</td>
      <td headers="grand_summary_stub_1 fctr" class="gt_row gt_center gt_grand_summary_row gt_first_grand_summary_row">—</td>
      <td headers="grand_summary_stub_1 date" class="gt_row gt_right gt_grand_summary_row gt_first_grand_summary_row">—</td>
      <td headers="grand_summary_stub_1 time" class="gt_row gt_right gt_grand_summary_row gt_first_grand_summary_row">—</td>
      <td headers="grand_summary_stub_1 datetime" class="gt_row gt_right gt_grand_summary_row gt_first_grand_summary_row">—</td>
      <td headers="grand_summary_stub_1 currency" class="gt_row gt_right gt_grand_summary_row gt_first_grand_summary_row" style="background-color: #D3D3D3;">0.44</td>
      <td headers="grand_summary_stub_1 group" class="gt_row gt_left gt_grand_summary_row gt_first_grand_summary_row">—</td></tr>
          <tr><th id="grand_summary_stub_2" scope="row" class="gt_row gt_left gt_stub gt_grand_summary_row" style="background-color: #FF0000;">max</th>
      <td headers="grand_summary_stub_2 num" class="gt_row gt_right gt_grand_summary_row" style="background-color: #D3D3D3;">8880000.00</td>
      <td headers="grand_summary_stub_2 char" class="gt_row gt_left gt_grand_summary_row">—</td>
      <td headers="grand_summary_stub_2 fctr" class="gt_row gt_center gt_grand_summary_row">—</td>
      <td headers="grand_summary_stub_2 date" class="gt_row gt_right gt_grand_summary_row">—</td>
      <td headers="grand_summary_stub_2 time" class="gt_row gt_right gt_grand_summary_row">—</td>
      <td headers="grand_summary_stub_2 datetime" class="gt_row gt_right gt_grand_summary_row">—</td>
      <td headers="grand_summary_stub_2 currency" class="gt_row gt_right gt_grand_summary_row" style="background-color: #D3D3D3;">65100.00</td>
      <td headers="grand_summary_stub_2 group" class="gt_row gt_left gt_grand_summary_row">—</td></tr>
          <tr><th id="grand_summary_stub_3" scope="row" class="gt_row gt_left gt_stub gt_grand_summary_row gt_last_summary_row" style="background-color: #FF0000;">avg</th>
      <td headers="grand_summary_stub_3 num" class="gt_row gt_right gt_grand_summary_row gt_last_summary_row" style="background-color: #D3D3D3;">1380432.87</td>
      <td headers="grand_summary_stub_3 char" class="gt_row gt_left gt_grand_summary_row gt_last_summary_row">—</td>
      <td headers="grand_summary_stub_3 fctr" class="gt_row gt_center gt_grand_summary_row gt_last_summary_row">—</td>
      <td headers="grand_summary_stub_3 date" class="gt_row gt_right gt_grand_summary_row gt_last_summary_row">—</td>
      <td headers="grand_summary_stub_3 time" class="gt_row gt_right gt_grand_summary_row gt_last_summary_row">—</td>
      <td headers="grand_summary_stub_3 datetime" class="gt_row gt_right gt_grand_summary_row gt_last_summary_row">—</td>
      <td headers="grand_summary_stub_3 currency" class="gt_row gt_right gt_grand_summary_row gt_last_summary_row" style="background-color: #D3D3D3;">9501.26</td>
      <td headers="grand_summary_stub_3 group" class="gt_row gt_left gt_grand_summary_row gt_last_summary_row">—</td></tr>
        </tbody>
        <tfoot>
          <tr class="gt_sourcenotes">
            <td class="gt_sourcenote" style="background-color: #F5DEB3;" colspan="9">Source note #1</td>
          </tr>
          <tr class="gt_sourcenotes">
            <td class="gt_sourcenote" style="background-color: #F5DEB3;" colspan="9">Source note #2</td>
          </tr>
        </tfoot>
      </table>

---

    Code
      cat(render_as_html(gt_tbl))
    Output
      <table class="gt_table" data-quarto-disable-processing="false" data-quarto-bootstrap="false">
        <thead>
          <tr class="gt_heading">
            <td colspan="9" class="gt_heading gt_title gt_font_normal" style="background-color: #ADD8E6;"><span class='gt_from_md'>Data listing from <strong>exibble</strong></span></td>
          </tr>
          <tr class="gt_heading">
            <td colspan="9" class="gt_heading gt_subtitle gt_font_normal gt_bottom_border" style="background-color: #00FFFF;"><span class='gt_from_md'><code>exibble</code> is an R dataset</span></td>
          </tr>
          <tr class="gt_col_headings gt_spanner_row">
            <th class="gt_col_heading gt_columns_bottom_border gt_left" rowspan="2" colspan="1" style="background-color: #DCDCDC;" scope="col" id="a::stub">S.L.</th>
            <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="2" colspan="1" style="background-color: #7FFFD4;" scope="col" id="num">num</th>
            <th class="gt_col_heading gt_columns_bottom_border gt_left" rowspan="2" colspan="1" style="background-color: #7FFFD4;" scope="col" id="char">char</th>
            <th class="gt_col_heading gt_columns_bottom_border gt_center" rowspan="2" colspan="1" style="background-color: #7FFFD4;" scope="col" id="fctr">fctr</th>
            <th class="gt_center gt_columns_top_border gt_column_spanner_outer" rowspan="1" colspan="3" style="background-color: #FFFF00;" scope="colgroup" id="timing">
              <div class="gt_column_spanner">timing</div>
            </th>
            <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="2" colspan="1" style="background-color: #7FFFD4;" scope="col" id="currency">currency</th>
            <th class="gt_col_heading gt_columns_bottom_border gt_left" rowspan="2" colspan="1" style="background-color: #7FFFD4;" scope="col" id="group">group</th>
          </tr>
          <tr class="gt_col_headings">
            <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" style="background-color: #7FFFD4;" scope="col" id="date">date</th>
            <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" style="background-color: #7FFFD4;" scope="col" id="time">time</th>
            <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" style="background-color: #7FFFD4;" scope="col" id="datetime">datetime</th>
          </tr>
        </thead>
        <tbody class="gt_table_body">
          <tr><th id="stub_1_1" scope="row" class="gt_row gt_left gt_stub" style="background-color: #FFDAB9;">row_1</th>
      <td headers="stub_1_1 num" class="gt_row gt_right" style="background-color: #D9D9D9;">1.111e-01</td>
      <td headers="stub_1_1 char" class="gt_row gt_left" style="background-color: #CCCCCC;">apricot</td>
      <td headers="stub_1_1 fctr" class="gt_row gt_center" style="background-color: #BFBFBF;">one</td>
      <td headers="stub_1_1 date" class="gt_row gt_right" style="background-color: #B3B3B3;">2015-01-15</td>
      <td headers="stub_1_1 time" class="gt_row gt_right" style="background-color: #A6A6A6;">13:35</td>
      <td headers="stub_1_1 datetime" class="gt_row gt_right" style="background-color: #999999;">2018-01-01 02:22</td>
      <td headers="stub_1_1 currency" class="gt_row gt_right" style="background-color: #8C8C8C;">49.950</td>
      <td headers="stub_1_1 group" class="gt_row gt_left" style="background-color: #737373;">grp_a</td></tr>
          <tr><th id="stub_1_2" scope="row" class="gt_row gt_left gt_stub" style="background-color: #FFDAB9;">row_2</th>
      <td headers="stub_1_2 num" class="gt_row gt_right" style="background-color: #D9D9D9;">2.222e+00</td>
      <td headers="stub_1_2 char" class="gt_row gt_left" style="background-color: #CCCCCC;">banana</td>
      <td headers="stub_1_2 fctr" class="gt_row gt_center" style="background-color: #BFBFBF;">two</td>
      <td headers="stub_1_2 date" class="gt_row gt_right" style="background-color: #B3B3B3;">2015-02-15</td>
      <td headers="stub_1_2 time" class="gt_row gt_right" style="background-color: #A6A6A6;">14:40</td>
      <td headers="stub_1_2 datetime" class="gt_row gt_right" style="background-color: #999999;">2018-02-02 14:33</td>
      <td headers="stub_1_2 currency" class="gt_row gt_right" style="background-color: #8C8C8C;">17.950</td>
      <td headers="stub_1_2 group" class="gt_row gt_left" style="background-color: #737373;">grp_a</td></tr>
          <tr><th id="stub_1_3" scope="row" class="gt_row gt_left gt_stub" style="background-color: #FFDAB9;">row_3</th>
      <td headers="stub_1_3 num" class="gt_row gt_right" style="background-color: #D9D9D9;">3.333e+01</td>
      <td headers="stub_1_3 char" class="gt_row gt_left" style="background-color: #CCCCCC;">coconut</td>
      <td headers="stub_1_3 fctr" class="gt_row gt_center" style="background-color: #BFBFBF;">three</td>
      <td headers="stub_1_3 date" class="gt_row gt_right" style="background-color: #B3B3B3;">2015-03-15</td>
      <td headers="stub_1_3 time" class="gt_row gt_right" style="background-color: #A6A6A6;">15:45</td>
      <td headers="stub_1_3 datetime" class="gt_row gt_right" style="background-color: #999999;">2018-03-03 03:44</td>
      <td headers="stub_1_3 currency" class="gt_row gt_right" style="background-color: #8C8C8C;">1.390</td>
      <td headers="stub_1_3 group" class="gt_row gt_left" style="background-color: #737373;">grp_a</td></tr>
          <tr><th id="stub_1_4" scope="row" class="gt_row gt_left gt_stub" style="background-color: #FFDAB9;">row_4</th>
      <td headers="stub_1_4 num" class="gt_row gt_right" style="background-color: #D9D9D9;">4.444e+02</td>
      <td headers="stub_1_4 char" class="gt_row gt_left" style="background-color: #CCCCCC;">durian</td>
      <td headers="stub_1_4 fctr" class="gt_row gt_center" style="background-color: #BFBFBF;">four</td>
      <td headers="stub_1_4 date" class="gt_row gt_right" style="background-color: #B3B3B3;">2015-04-15</td>
      <td headers="stub_1_4 time" class="gt_row gt_right" style="background-color: #A6A6A6;">16:50</td>
      <td headers="stub_1_4 datetime" class="gt_row gt_right" style="background-color: #999999;">2018-04-04 15:55</td>
      <td headers="stub_1_4 currency" class="gt_row gt_right" style="background-color: #8C8C8C;">65100.000</td>
      <td headers="stub_1_4 group" class="gt_row gt_left" style="background-color: #737373;">grp_a</td></tr>
          <tr><th id="stub_1_5" scope="row" class="gt_row gt_left gt_stub" style="background-color: #FFDAB9;">row_5</th>
      <td headers="stub_1_5 num" class="gt_row gt_right" style="background-color: #D9D9D9;">5.550e+03</td>
      <td headers="stub_1_5 char" class="gt_row gt_left" style="background-color: #CCCCCC;">NA</td>
      <td headers="stub_1_5 fctr" class="gt_row gt_center" style="background-color: #BFBFBF;">five</td>
      <td headers="stub_1_5 date" class="gt_row gt_right" style="background-color: #B3B3B3;">2015-05-15</td>
      <td headers="stub_1_5 time" class="gt_row gt_right" style="background-color: #A6A6A6;">17:55</td>
      <td headers="stub_1_5 datetime" class="gt_row gt_right" style="background-color: #999999;">2018-05-05 04:00</td>
      <td headers="stub_1_5 currency" class="gt_row gt_right" style="background-color: #8C8C8C;">1325.810</td>
      <td headers="stub_1_5 group" class="gt_row gt_left" style="background-color: #737373;">grp_b</td></tr>
          <tr><th id="stub_1_6" scope="row" class="gt_row gt_left gt_stub" style="background-color: #FFDAB9;">row_6</th>
      <td headers="stub_1_6 num" class="gt_row gt_right" style="background-color: #D9D9D9;">NA</td>
      <td headers="stub_1_6 char" class="gt_row gt_left" style="background-color: #CCCCCC;">fig</td>
      <td headers="stub_1_6 fctr" class="gt_row gt_center" style="background-color: #BFBFBF;">six</td>
      <td headers="stub_1_6 date" class="gt_row gt_right" style="background-color: #B3B3B3;">2015-06-15</td>
      <td headers="stub_1_6 time" class="gt_row gt_right" style="background-color: #A6A6A6;">NA</td>
      <td headers="stub_1_6 datetime" class="gt_row gt_right" style="background-color: #999999;">2018-06-06 16:11</td>
      <td headers="stub_1_6 currency" class="gt_row gt_right" style="background-color: #8C8C8C;">13.255</td>
      <td headers="stub_1_6 group" class="gt_row gt_left" style="background-color: #737373;">grp_b</td></tr>
          <tr><th id="stub_1_7" scope="row" class="gt_row gt_left gt_stub" style="background-color: #FFDAB9;">row_7</th>
      <td headers="stub_1_7 num" class="gt_row gt_right" style="background-color: #D9D9D9;">7.770e+05</td>
      <td headers="stub_1_7 char" class="gt_row gt_left" style="background-color: #CCCCCC;">grapefruit</td>
      <td headers="stub_1_7 fctr" class="gt_row gt_center" style="background-color: #BFBFBF;">seven</td>
      <td headers="stub_1_7 date" class="gt_row gt_right" style="background-color: #B3B3B3;">NA</td>
      <td headers="stub_1_7 time" class="gt_row gt_right" style="background-color: #A6A6A6;">19:10</td>
      <td headers="stub_1_7 datetime" class="gt_row gt_right" style="background-color: #999999;">2018-07-07 05:22</td>
      <td headers="stub_1_7 currency" class="gt_row gt_right" style="background-color: #8C8C8C;">NA</td>
      <td headers="stub_1_7 group" class="gt_row gt_left" style="background-color: #737373;">grp_b</td></tr>
          <tr><th id="stub_1_8" scope="row" class="gt_row gt_left gt_stub" style="background-color: #FFDAB9;">row_8</th>
      <td headers="stub_1_8 num" class="gt_row gt_right" style="background-color: #D9D9D9;">8.880e+06</td>
      <td headers="stub_1_8 char" class="gt_row gt_left" style="background-color: #CCCCCC;">honeydew</td>
      <td headers="stub_1_8 fctr" class="gt_row gt_center" style="background-color: #BFBFBF;">eight</td>
      <td headers="stub_1_8 date" class="gt_row gt_right" style="background-color: #B3B3B3;">2015-08-15</td>
      <td headers="stub_1_8 time" class="gt_row gt_right" style="background-color: #A6A6A6;">20:20</td>
      <td headers="stub_1_8 datetime" class="gt_row gt_right" style="background-color: #999999;">NA</td>
      <td headers="stub_1_8 currency" class="gt_row gt_right" style="background-color: #8C8C8C;">0.440</td>
      <td headers="stub_1_8 group" class="gt_row gt_left" style="background-color: #737373;">grp_b</td></tr>
          <tr><th id="grand_summary_stub_1" scope="row" class="gt_row gt_left gt_stub gt_grand_summary_row gt_first_grand_summary_row" style="background-color: #FF0000;">min</th>
      <td headers="grand_summary_stub_1 num" class="gt_row gt_right gt_grand_summary_row gt_first_grand_summary_row" style="background-color: #D3D3D3;">0.11</td>
      <td headers="grand_summary_stub_1 char" class="gt_row gt_left gt_grand_summary_row gt_first_grand_summary_row">—</td>
      <td headers="grand_summary_stub_1 fctr" class="gt_row gt_center gt_grand_summary_row gt_first_grand_summary_row">—</td>
      <td headers="grand_summary_stub_1 date" class="gt_row gt_right gt_grand_summary_row gt_first_grand_summary_row">—</td>
      <td headers="grand_summary_stub_1 time" class="gt_row gt_right gt_grand_summary_row gt_first_grand_summary_row">—</td>
      <td headers="grand_summary_stub_1 datetime" class="gt_row gt_right gt_grand_summary_row gt_first_grand_summary_row">—</td>
      <td headers="grand_summary_stub_1 currency" class="gt_row gt_right gt_grand_summary_row gt_first_grand_summary_row" style="background-color: #D3D3D3;">0.44</td>
      <td headers="grand_summary_stub_1 group" class="gt_row gt_left gt_grand_summary_row gt_first_grand_summary_row">—</td></tr>
          <tr><th id="grand_summary_stub_2" scope="row" class="gt_row gt_left gt_stub gt_grand_summary_row" style="background-color: #FF0000;">max</th>
      <td headers="grand_summary_stub_2 num" class="gt_row gt_right gt_grand_summary_row" style="background-color: #D3D3D3;">8880000.00</td>
      <td headers="grand_summary_stub_2 char" class="gt_row gt_left gt_grand_summary_row">—</td>
      <td headers="grand_summary_stub_2 fctr" class="gt_row gt_center gt_grand_summary_row">—</td>
      <td headers="grand_summary_stub_2 date" class="gt_row gt_right gt_grand_summary_row">—</td>
      <td headers="grand_summary_stub_2 time" class="gt_row gt_right gt_grand_summary_row">—</td>
      <td headers="grand_summary_stub_2 datetime" class="gt_row gt_right gt_grand_summary_row">—</td>
      <td headers="grand_summary_stub_2 currency" class="gt_row gt_right gt_grand_summary_row" style="background-color: #D3D3D3;">65100.00</td>
      <td headers="grand_summary_stub_2 group" class="gt_row gt_left gt_grand_summary_row">—</td></tr>
          <tr><th id="grand_summary_stub_3" scope="row" class="gt_row gt_left gt_stub gt_grand_summary_row gt_last_summary_row" style="background-color: #FF0000;">avg</th>
      <td headers="grand_summary_stub_3 num" class="gt_row gt_right gt_grand_summary_row gt_last_summary_row" style="background-color: #D3D3D3;">1380432.87</td>
      <td headers="grand_summary_stub_3 char" class="gt_row gt_left gt_grand_summary_row gt_last_summary_row">—</td>
      <td headers="grand_summary_stub_3 fctr" class="gt_row gt_center gt_grand_summary_row gt_last_summary_row">—</td>
      <td headers="grand_summary_stub_3 date" class="gt_row gt_right gt_grand_summary_row gt_last_summary_row">—</td>
      <td headers="grand_summary_stub_3 time" class="gt_row gt_right gt_grand_summary_row gt_last_summary_row">—</td>
      <td headers="grand_summary_stub_3 datetime" class="gt_row gt_right gt_grand_summary_row gt_last_summary_row">—</td>
      <td headers="grand_summary_stub_3 currency" class="gt_row gt_right gt_grand_summary_row gt_last_summary_row" style="background-color: #D3D3D3;">9501.26</td>
      <td headers="grand_summary_stub_3 group" class="gt_row gt_left gt_grand_summary_row gt_last_summary_row">—</td></tr>
        </tbody>
        <tfoot>
          <tr class="gt_sourcenotes">
            <td class="gt_sourcenote" style="background-color: #F5DEB3;" colspan="9">Source note #1</td>
          </tr>
          <tr class="gt_sourcenotes">
            <td class="gt_sourcenote" style="background-color: #F5DEB3;" colspan="9">Source note #2</td>
          </tr>
        </tfoot>
      </table>

---

    Code
      cat(render_as_html(gt_tbl))
    Output
      <table class="gt_table" data-quarto-disable-processing="false" data-quarto-bootstrap="false">
        <thead>
          <tr class="gt_heading">
            <td colspan="8" class="gt_heading gt_title gt_font_normal" style="background-color: #ADD8E6;"><span class='gt_from_md'>Data listing from <strong>exibble</strong></span></td>
          </tr>
          <tr class="gt_heading">
            <td colspan="8" class="gt_heading gt_subtitle gt_font_normal gt_bottom_border" style="background-color: #00FFFF;"><span class='gt_from_md'><code>exibble</code> is an R dataset</span></td>
          </tr>
          <tr class="gt_col_headings gt_spanner_row">
            <th class="gt_col_heading gt_columns_bottom_border gt_left" rowspan="2" colspan="1" style="background-color: #DCDCDC;" scope="col" id="a::stub">S.L.</th>
            <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="2" colspan="1" style="background-color: #7FFFD4;" scope="col" id="num">num</th>
            <th class="gt_col_heading gt_columns_bottom_border gt_left" rowspan="2" colspan="1" style="background-color: #7FFFD4;" scope="col" id="char">char</th>
            <th class="gt_col_heading gt_columns_bottom_border gt_center" rowspan="2" colspan="1" style="background-color: #7FFFD4;" scope="col" id="fctr">fctr</th>
            <th class="gt_center gt_columns_top_border gt_column_spanner_outer" rowspan="1" colspan="3" style="background-color: #FFFF00;" scope="colgroup" id="timing">
              <div class="gt_column_spanner">timing</div>
            </th>
            <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="2" colspan="1" style="background-color: #7FFFD4;" scope="col" id="currency">currency</th>
          </tr>
          <tr class="gt_col_headings">
            <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" style="background-color: #7FFFD4;" scope="col" id="date">date</th>
            <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" style="background-color: #7FFFD4;" scope="col" id="time">time</th>
            <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" style="background-color: #7FFFD4;" scope="col" id="datetime">datetime</th>
          </tr>
        </thead>
        <tbody class="gt_table_body">
          <tr class="gt_group_heading_row">
            <th colspan="8" class="gt_group_heading" style="background-color: #E0FFFF;" scope="colgroup" id="grp_a">grp_a</th>
          </tr>
          <tr class="gt_row_group_first"><th id="stub_1_1" scope="row" class="gt_row gt_left gt_stub" style="background-color: #FFDAB9;">row_1</th>
      <td headers="grp_a stub_1_1 num" class="gt_row gt_right" style="background-color: #D9D9D9;">1.111e-01</td>
      <td headers="grp_a stub_1_1 char" class="gt_row gt_left" style="background-color: #CCCCCC;">apricot</td>
      <td headers="grp_a stub_1_1 fctr" class="gt_row gt_center" style="background-color: #BFBFBF;">one</td>
      <td headers="grp_a stub_1_1 date" class="gt_row gt_right" style="background-color: #B3B3B3;">2015-01-15</td>
      <td headers="grp_a stub_1_1 time" class="gt_row gt_right" style="background-color: #A6A6A6;">13:35</td>
      <td headers="grp_a stub_1_1 datetime" class="gt_row gt_right" style="background-color: #999999;">2018-01-01 02:22</td>
      <td headers="grp_a stub_1_1 currency" class="gt_row gt_right" style="background-color: #8C8C8C;">49.950</td></tr>
          <tr><th id="stub_1_2" scope="row" class="gt_row gt_left gt_stub" style="background-color: #FFDAB9;">row_2</th>
      <td headers="grp_a stub_1_2 num" class="gt_row gt_right" style="background-color: #D9D9D9;">2.222e+00</td>
      <td headers="grp_a stub_1_2 char" class="gt_row gt_left" style="background-color: #CCCCCC;">banana</td>
      <td headers="grp_a stub_1_2 fctr" class="gt_row gt_center" style="background-color: #BFBFBF;">two</td>
      <td headers="grp_a stub_1_2 date" class="gt_row gt_right" style="background-color: #B3B3B3;">2015-02-15</td>
      <td headers="grp_a stub_1_2 time" class="gt_row gt_right" style="background-color: #A6A6A6;">14:40</td>
      <td headers="grp_a stub_1_2 datetime" class="gt_row gt_right" style="background-color: #999999;">2018-02-02 14:33</td>
      <td headers="grp_a stub_1_2 currency" class="gt_row gt_right" style="background-color: #8C8C8C;">17.950</td></tr>
          <tr><th id="stub_1_3" scope="row" class="gt_row gt_left gt_stub" style="background-color: #FFDAB9;">row_3</th>
      <td headers="grp_a stub_1_3 num" class="gt_row gt_right" style="background-color: #D9D9D9;">3.333e+01</td>
      <td headers="grp_a stub_1_3 char" class="gt_row gt_left" style="background-color: #CCCCCC;">coconut</td>
      <td headers="grp_a stub_1_3 fctr" class="gt_row gt_center" style="background-color: #BFBFBF;">three</td>
      <td headers="grp_a stub_1_3 date" class="gt_row gt_right" style="background-color: #B3B3B3;">2015-03-15</td>
      <td headers="grp_a stub_1_3 time" class="gt_row gt_right" style="background-color: #A6A6A6;">15:45</td>
      <td headers="grp_a stub_1_3 datetime" class="gt_row gt_right" style="background-color: #999999;">2018-03-03 03:44</td>
      <td headers="grp_a stub_1_3 currency" class="gt_row gt_right" style="background-color: #8C8C8C;">1.390</td></tr>
          <tr><th id="stub_1_4" scope="row" class="gt_row gt_left gt_stub" style="background-color: #FFDAB9;">row_4</th>
      <td headers="grp_a stub_1_4 num" class="gt_row gt_right" style="background-color: #D9D9D9;">4.444e+02</td>
      <td headers="grp_a stub_1_4 char" class="gt_row gt_left" style="background-color: #CCCCCC;">durian</td>
      <td headers="grp_a stub_1_4 fctr" class="gt_row gt_center" style="background-color: #BFBFBF;">four</td>
      <td headers="grp_a stub_1_4 date" class="gt_row gt_right" style="background-color: #B3B3B3;">2015-04-15</td>
      <td headers="grp_a stub_1_4 time" class="gt_row gt_right" style="background-color: #A6A6A6;">16:50</td>
      <td headers="grp_a stub_1_4 datetime" class="gt_row gt_right" style="background-color: #999999;">2018-04-04 15:55</td>
      <td headers="grp_a stub_1_4 currency" class="gt_row gt_right" style="background-color: #8C8C8C;">65100.000</td></tr>
          <tr><th id="summary_stub_grp_a_1" scope="row" class="gt_row gt_left gt_stub gt_summary_row gt_first_summary_row thick" style="background-color: #FFA500;">min</th>
      <td headers="grp_a summary_stub_grp_a_1 num" class="gt_row gt_right gt_summary_row gt_first_summary_row thick" style="background-color: #8FBC8F;">0.11</td>
      <td headers="grp_a summary_stub_grp_a_1 char" class="gt_row gt_left gt_summary_row gt_first_summary_row thick">—</td>
      <td headers="grp_a summary_stub_grp_a_1 fctr" class="gt_row gt_center gt_summary_row gt_first_summary_row thick">—</td>
      <td headers="grp_a summary_stub_grp_a_1 date" class="gt_row gt_right gt_summary_row gt_first_summary_row thick">—</td>
      <td headers="grp_a summary_stub_grp_a_1 time" class="gt_row gt_right gt_summary_row gt_first_summary_row thick">—</td>
      <td headers="grp_a summary_stub_grp_a_1 datetime" class="gt_row gt_right gt_summary_row gt_first_summary_row thick">—</td>
      <td headers="grp_a summary_stub_grp_a_1 currency" class="gt_row gt_right gt_summary_row gt_first_summary_row thick" style="background-color: #8FBC8F;">1.39</td></tr>
          <tr><th id="summary_stub_grp_a_2" scope="row" class="gt_row gt_left gt_stub gt_summary_row" style="background-color: #FFA500;">max</th>
      <td headers="grp_a summary_stub_grp_a_2 num" class="gt_row gt_right gt_summary_row" style="background-color: #8FBC8F;">444.40</td>
      <td headers="grp_a summary_stub_grp_a_2 char" class="gt_row gt_left gt_summary_row">—</td>
      <td headers="grp_a summary_stub_grp_a_2 fctr" class="gt_row gt_center gt_summary_row">—</td>
      <td headers="grp_a summary_stub_grp_a_2 date" class="gt_row gt_right gt_summary_row">—</td>
      <td headers="grp_a summary_stub_grp_a_2 time" class="gt_row gt_right gt_summary_row">—</td>
      <td headers="grp_a summary_stub_grp_a_2 datetime" class="gt_row gt_right gt_summary_row">—</td>
      <td headers="grp_a summary_stub_grp_a_2 currency" class="gt_row gt_right gt_summary_row" style="background-color: #8FBC8F;">65100.00</td></tr>
          <tr><th id="summary_stub_grp_a_3" scope="row" class="gt_row gt_left gt_stub gt_summary_row gt_last_summary_row" style="background-color: #FFA500;">avg</th>
      <td headers="grp_a summary_stub_grp_a_3 num" class="gt_row gt_right gt_summary_row gt_last_summary_row" style="background-color: #8FBC8F;">120.02</td>
      <td headers="grp_a summary_stub_grp_a_3 char" class="gt_row gt_left gt_summary_row gt_last_summary_row">—</td>
      <td headers="grp_a summary_stub_grp_a_3 fctr" class="gt_row gt_center gt_summary_row gt_last_summary_row">—</td>
      <td headers="grp_a summary_stub_grp_a_3 date" class="gt_row gt_right gt_summary_row gt_last_summary_row">—</td>
      <td headers="grp_a summary_stub_grp_a_3 time" class="gt_row gt_right gt_summary_row gt_last_summary_row">—</td>
      <td headers="grp_a summary_stub_grp_a_3 datetime" class="gt_row gt_right gt_summary_row gt_last_summary_row">—</td>
      <td headers="grp_a summary_stub_grp_a_3 currency" class="gt_row gt_right gt_summary_row gt_last_summary_row" style="background-color: #8FBC8F;">16292.32</td></tr>
          <tr class="gt_group_heading_row">
            <th colspan="8" class="gt_group_heading" style="background-color: #E0FFFF;" scope="colgroup" id="grp_b">grp_b</th>
          </tr>
          <tr class="gt_row_group_first"><th id="stub_1_5" scope="row" class="gt_row gt_left gt_stub" style="background-color: #FFDAB9;">row_5</th>
      <td headers="grp_b stub_1_5 num" class="gt_row gt_right" style="background-color: #D9D9D9;">5.550e+03</td>
      <td headers="grp_b stub_1_5 char" class="gt_row gt_left" style="background-color: #CCCCCC;">NA</td>
      <td headers="grp_b stub_1_5 fctr" class="gt_row gt_center" style="background-color: #BFBFBF;">five</td>
      <td headers="grp_b stub_1_5 date" class="gt_row gt_right" style="background-color: #B3B3B3;">2015-05-15</td>
      <td headers="grp_b stub_1_5 time" class="gt_row gt_right" style="background-color: #A6A6A6;">17:55</td>
      <td headers="grp_b stub_1_5 datetime" class="gt_row gt_right" style="background-color: #999999;">2018-05-05 04:00</td>
      <td headers="grp_b stub_1_5 currency" class="gt_row gt_right" style="background-color: #8C8C8C;">1325.810</td></tr>
          <tr><th id="stub_1_6" scope="row" class="gt_row gt_left gt_stub" style="background-color: #FFDAB9;">row_6</th>
      <td headers="grp_b stub_1_6 num" class="gt_row gt_right" style="background-color: #D9D9D9;">NA</td>
      <td headers="grp_b stub_1_6 char" class="gt_row gt_left" style="background-color: #CCCCCC;">fig</td>
      <td headers="grp_b stub_1_6 fctr" class="gt_row gt_center" style="background-color: #BFBFBF;">six</td>
      <td headers="grp_b stub_1_6 date" class="gt_row gt_right" style="background-color: #B3B3B3;">2015-06-15</td>
      <td headers="grp_b stub_1_6 time" class="gt_row gt_right" style="background-color: #A6A6A6;">NA</td>
      <td headers="grp_b stub_1_6 datetime" class="gt_row gt_right" style="background-color: #999999;">2018-06-06 16:11</td>
      <td headers="grp_b stub_1_6 currency" class="gt_row gt_right" style="background-color: #8C8C8C;">13.255</td></tr>
          <tr><th id="stub_1_7" scope="row" class="gt_row gt_left gt_stub" style="background-color: #FFDAB9;">row_7</th>
      <td headers="grp_b stub_1_7 num" class="gt_row gt_right" style="background-color: #D9D9D9;">7.770e+05</td>
      <td headers="grp_b stub_1_7 char" class="gt_row gt_left" style="background-color: #CCCCCC;">grapefruit</td>
      <td headers="grp_b stub_1_7 fctr" class="gt_row gt_center" style="background-color: #BFBFBF;">seven</td>
      <td headers="grp_b stub_1_7 date" class="gt_row gt_right" style="background-color: #B3B3B3;">NA</td>
      <td headers="grp_b stub_1_7 time" class="gt_row gt_right" style="background-color: #A6A6A6;">19:10</td>
      <td headers="grp_b stub_1_7 datetime" class="gt_row gt_right" style="background-color: #999999;">2018-07-07 05:22</td>
      <td headers="grp_b stub_1_7 currency" class="gt_row gt_right" style="background-color: #8C8C8C;">NA</td></tr>
          <tr><th id="stub_1_8" scope="row" class="gt_row gt_left gt_stub" style="background-color: #FFDAB9;">row_8</th>
      <td headers="grp_b stub_1_8 num" class="gt_row gt_right" style="background-color: #D9D9D9;">8.880e+06</td>
      <td headers="grp_b stub_1_8 char" class="gt_row gt_left" style="background-color: #CCCCCC;">honeydew</td>
      <td headers="grp_b stub_1_8 fctr" class="gt_row gt_center" style="background-color: #BFBFBF;">eight</td>
      <td headers="grp_b stub_1_8 date" class="gt_row gt_right" style="background-color: #B3B3B3;">2015-08-15</td>
      <td headers="grp_b stub_1_8 time" class="gt_row gt_right" style="background-color: #A6A6A6;">20:20</td>
      <td headers="grp_b stub_1_8 datetime" class="gt_row gt_right" style="background-color: #999999;">NA</td>
      <td headers="grp_b stub_1_8 currency" class="gt_row gt_right" style="background-color: #8C8C8C;">0.440</td></tr>
          <tr><th id="summary_stub_grp_b_1" scope="row" class="gt_row gt_left gt_stub gt_summary_row gt_first_summary_row thick" style="background-color: #FFA500;">min</th>
      <td headers="grp_b summary_stub_grp_b_1 num" class="gt_row gt_right gt_summary_row gt_first_summary_row thick" style="background-color: #8FBC8F;">5550.00</td>
      <td headers="grp_b summary_stub_grp_b_1 char" class="gt_row gt_left gt_summary_row gt_first_summary_row thick">—</td>
      <td headers="grp_b summary_stub_grp_b_1 fctr" class="gt_row gt_center gt_summary_row gt_first_summary_row thick">—</td>
      <td headers="grp_b summary_stub_grp_b_1 date" class="gt_row gt_right gt_summary_row gt_first_summary_row thick">—</td>
      <td headers="grp_b summary_stub_grp_b_1 time" class="gt_row gt_right gt_summary_row gt_first_summary_row thick">—</td>
      <td headers="grp_b summary_stub_grp_b_1 datetime" class="gt_row gt_right gt_summary_row gt_first_summary_row thick">—</td>
      <td headers="grp_b summary_stub_grp_b_1 currency" class="gt_row gt_right gt_summary_row gt_first_summary_row thick" style="background-color: #8FBC8F;">0.44</td></tr>
          <tr><th id="summary_stub_grp_b_2" scope="row" class="gt_row gt_left gt_stub gt_summary_row" style="background-color: #FFA500;">max</th>
      <td headers="grp_b summary_stub_grp_b_2 num" class="gt_row gt_right gt_summary_row" style="background-color: #8FBC8F;">8880000.00</td>
      <td headers="grp_b summary_stub_grp_b_2 char" class="gt_row gt_left gt_summary_row">—</td>
      <td headers="grp_b summary_stub_grp_b_2 fctr" class="gt_row gt_center gt_summary_row">—</td>
      <td headers="grp_b summary_stub_grp_b_2 date" class="gt_row gt_right gt_summary_row">—</td>
      <td headers="grp_b summary_stub_grp_b_2 time" class="gt_row gt_right gt_summary_row">—</td>
      <td headers="grp_b summary_stub_grp_b_2 datetime" class="gt_row gt_right gt_summary_row">—</td>
      <td headers="grp_b summary_stub_grp_b_2 currency" class="gt_row gt_right gt_summary_row" style="background-color: #8FBC8F;">1325.81</td></tr>
          <tr><th id="summary_stub_grp_b_3" scope="row" class="gt_row gt_left gt_stub gt_summary_row gt_last_summary_row" style="background-color: #FFA500;">avg</th>
      <td headers="grp_b summary_stub_grp_b_3 num" class="gt_row gt_right gt_summary_row gt_last_summary_row" style="background-color: #8FBC8F;">3220850.00</td>
      <td headers="grp_b summary_stub_grp_b_3 char" class="gt_row gt_left gt_summary_row gt_last_summary_row">—</td>
      <td headers="grp_b summary_stub_grp_b_3 fctr" class="gt_row gt_center gt_summary_row gt_last_summary_row">—</td>
      <td headers="grp_b summary_stub_grp_b_3 date" class="gt_row gt_right gt_summary_row gt_last_summary_row">—</td>
      <td headers="grp_b summary_stub_grp_b_3 time" class="gt_row gt_right gt_summary_row gt_last_summary_row">—</td>
      <td headers="grp_b summary_stub_grp_b_3 datetime" class="gt_row gt_right gt_summary_row gt_last_summary_row">—</td>
      <td headers="grp_b summary_stub_grp_b_3 currency" class="gt_row gt_right gt_summary_row gt_last_summary_row" style="background-color: #8FBC8F;">446.50</td></tr>
          <tr><th id="grand_summary_stub_1" scope="row" class="gt_row gt_left gt_stub gt_grand_summary_row gt_first_grand_summary_row" style="background-color: #FF0000;">min</th>
      <td headers="grand_summary_stub_1 num" class="gt_row gt_right gt_grand_summary_row gt_first_grand_summary_row" style="background-color: #D3D3D3;">0.11</td>
      <td headers="grand_summary_stub_1 char" class="gt_row gt_left gt_grand_summary_row gt_first_grand_summary_row">—</td>
      <td headers="grand_summary_stub_1 fctr" class="gt_row gt_center gt_grand_summary_row gt_first_grand_summary_row">—</td>
      <td headers="grand_summary_stub_1 date" class="gt_row gt_right gt_grand_summary_row gt_first_grand_summary_row">—</td>
      <td headers="grand_summary_stub_1 time" class="gt_row gt_right gt_grand_summary_row gt_first_grand_summary_row">—</td>
      <td headers="grand_summary_stub_1 datetime" class="gt_row gt_right gt_grand_summary_row gt_first_grand_summary_row">—</td>
      <td headers="grand_summary_stub_1 currency" class="gt_row gt_right gt_grand_summary_row gt_first_grand_summary_row" style="background-color: #D3D3D3;">0.44</td></tr>
          <tr><th id="grand_summary_stub_2" scope="row" class="gt_row gt_left gt_stub gt_grand_summary_row" style="background-color: #FF0000;">max</th>
      <td headers="grand_summary_stub_2 num" class="gt_row gt_right gt_grand_summary_row" style="background-color: #D3D3D3;">8880000.00</td>
      <td headers="grand_summary_stub_2 char" class="gt_row gt_left gt_grand_summary_row">—</td>
      <td headers="grand_summary_stub_2 fctr" class="gt_row gt_center gt_grand_summary_row">—</td>
      <td headers="grand_summary_stub_2 date" class="gt_row gt_right gt_grand_summary_row">—</td>
      <td headers="grand_summary_stub_2 time" class="gt_row gt_right gt_grand_summary_row">—</td>
      <td headers="grand_summary_stub_2 datetime" class="gt_row gt_right gt_grand_summary_row">—</td>
      <td headers="grand_summary_stub_2 currency" class="gt_row gt_right gt_grand_summary_row" style="background-color: #D3D3D3;">65100.00</td></tr>
          <tr><th id="grand_summary_stub_3" scope="row" class="gt_row gt_left gt_stub gt_grand_summary_row gt_last_summary_row" style="background-color: #FF0000;">avg</th>
      <td headers="grand_summary_stub_3 num" class="gt_row gt_right gt_grand_summary_row gt_last_summary_row" style="background-color: #D3D3D3;">1380432.87</td>
      <td headers="grand_summary_stub_3 char" class="gt_row gt_left gt_grand_summary_row gt_last_summary_row">—</td>
      <td headers="grand_summary_stub_3 fctr" class="gt_row gt_center gt_grand_summary_row gt_last_summary_row">—</td>
      <td headers="grand_summary_stub_3 date" class="gt_row gt_right gt_grand_summary_row gt_last_summary_row">—</td>
      <td headers="grand_summary_stub_3 time" class="gt_row gt_right gt_grand_summary_row gt_last_summary_row">—</td>
      <td headers="grand_summary_stub_3 datetime" class="gt_row gt_right gt_grand_summary_row gt_last_summary_row">—</td>
      <td headers="grand_summary_stub_3 currency" class="gt_row gt_right gt_grand_summary_row gt_last_summary_row" style="background-color: #D3D3D3;">9501.26</td></tr>
        </tbody>
        <tfoot>
          <tr class="gt_sourcenotes">
            <td class="gt_sourcenote" style="background-color: #F5DEB3;" colspan="8">Source note #1</td>
          </tr>
          <tr class="gt_sourcenotes">
            <td class="gt_sourcenote" style="background-color: #F5DEB3;" colspan="8">Source note #2</td>
          </tr>
        </tfoot>
      </table>

---

    Code
      cat(render_as_html(gt_tbl))
    Output
      <table class="gt_table" data-quarto-disable-processing="false" data-quarto-bootstrap="false">
        <thead>
          <tr class="gt_heading">
            <td colspan="9" class="gt_heading gt_title gt_font_normal" style="background-color: #ADD8E6;"><span class='gt_from_md'>Data listing from <strong>exibble</strong></span></td>
          </tr>
          <tr class="gt_heading">
            <td colspan="9" class="gt_heading gt_subtitle gt_font_normal gt_bottom_border" style="background-color: #00FFFF;"><span class='gt_from_md'><code>exibble</code> is an R dataset</span></td>
          </tr>
          <tr class="gt_col_headings gt_spanner_row">
            <th class="gt_col_heading gt_columns_bottom_border gt_left" rowspan="2" colspan="2" style="background-color: #DCDCDC;" scope="colgroup" id="a::stub">S.L.</th>
            <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="2" colspan="1" style="background-color: #7FFFD4;" scope="col" id="num">num</th>
            <th class="gt_col_heading gt_columns_bottom_border gt_left" rowspan="2" colspan="1" style="background-color: #7FFFD4;" scope="col" id="char">char</th>
            <th class="gt_col_heading gt_columns_bottom_border gt_center" rowspan="2" colspan="1" style="background-color: #7FFFD4;" scope="col" id="fctr">fctr</th>
            <th class="gt_center gt_columns_top_border gt_column_spanner_outer" rowspan="1" colspan="3" style="background-color: #FFFF00;" scope="colgroup" id="timing">
              <div class="gt_column_spanner">timing</div>
            </th>
            <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="2" colspan="1" style="background-color: #7FFFD4;" scope="col" id="currency">currency</th>
          </tr>
          <tr class="gt_col_headings">
            <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" style="background-color: #7FFFD4;" scope="col" id="date">date</th>
            <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" style="background-color: #7FFFD4;" scope="col" id="time">time</th>
            <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" style="background-color: #7FFFD4;" scope="col" id="datetime">datetime</th>
          </tr>
        </thead>
        <tbody class="gt_table_body">
          <tr class="gt_row_group_first"><td headers="grp_a stub_2_1 stub_1" rowspan="7" class="gt_row gt_left gt_stub_row_group" style="background-color: #E0FFFF;">grp_a</td>
      <th id="stub_2_1" scope="row" class="gt_row gt_left gt_stub" style="background-color: #FFDAB9;">row_1</th>
      <td headers="grp_a stub_2_1 num" class="gt_row gt_right" style="background-color: #D9D9D9;">1.111e-01</td>
      <td headers="grp_a stub_2_1 char" class="gt_row gt_left" style="background-color: #CCCCCC;">apricot</td>
      <td headers="grp_a stub_2_1 fctr" class="gt_row gt_center" style="background-color: #BFBFBF;">one</td>
      <td headers="grp_a stub_2_1 date" class="gt_row gt_right" style="background-color: #B3B3B3;">2015-01-15</td>
      <td headers="grp_a stub_2_1 time" class="gt_row gt_right" style="background-color: #A6A6A6;">13:35</td>
      <td headers="grp_a stub_2_1 datetime" class="gt_row gt_right" style="background-color: #999999;">2018-01-01 02:22</td>
      <td headers="grp_a stub_2_1 currency" class="gt_row gt_right" style="background-color: #8C8C8C;">49.950</td></tr>
          <tr><th id="stub_2_2" scope="row" class="gt_row gt_left gt_stub" style="background-color: #FFDAB9;">row_2</th>
      <td headers="grp_a stub_2_2 num" class="gt_row gt_right" style="background-color: #D9D9D9;">2.222e+00</td>
      <td headers="grp_a stub_2_2 char" class="gt_row gt_left" style="background-color: #CCCCCC;">banana</td>
      <td headers="grp_a stub_2_2 fctr" class="gt_row gt_center" style="background-color: #BFBFBF;">two</td>
      <td headers="grp_a stub_2_2 date" class="gt_row gt_right" style="background-color: #B3B3B3;">2015-02-15</td>
      <td headers="grp_a stub_2_2 time" class="gt_row gt_right" style="background-color: #A6A6A6;">14:40</td>
      <td headers="grp_a stub_2_2 datetime" class="gt_row gt_right" style="background-color: #999999;">2018-02-02 14:33</td>
      <td headers="grp_a stub_2_2 currency" class="gt_row gt_right" style="background-color: #8C8C8C;">17.950</td></tr>
          <tr><th id="stub_2_3" scope="row" class="gt_row gt_left gt_stub" style="background-color: #FFDAB9;">row_3</th>
      <td headers="grp_a stub_2_3 num" class="gt_row gt_right" style="background-color: #D9D9D9;">3.333e+01</td>
      <td headers="grp_a stub_2_3 char" class="gt_row gt_left" style="background-color: #CCCCCC;">coconut</td>
      <td headers="grp_a stub_2_3 fctr" class="gt_row gt_center" style="background-color: #BFBFBF;">three</td>
      <td headers="grp_a stub_2_3 date" class="gt_row gt_right" style="background-color: #B3B3B3;">2015-03-15</td>
      <td headers="grp_a stub_2_3 time" class="gt_row gt_right" style="background-color: #A6A6A6;">15:45</td>
      <td headers="grp_a stub_2_3 datetime" class="gt_row gt_right" style="background-color: #999999;">2018-03-03 03:44</td>
      <td headers="grp_a stub_2_3 currency" class="gt_row gt_right" style="background-color: #8C8C8C;">1.390</td></tr>
          <tr><th id="stub_2_4" scope="row" class="gt_row gt_left gt_stub" style="background-color: #FFDAB9;">row_4</th>
      <td headers="grp_a stub_2_4 num" class="gt_row gt_right" style="background-color: #D9D9D9;">4.444e+02</td>
      <td headers="grp_a stub_2_4 char" class="gt_row gt_left" style="background-color: #CCCCCC;">durian</td>
      <td headers="grp_a stub_2_4 fctr" class="gt_row gt_center" style="background-color: #BFBFBF;">four</td>
      <td headers="grp_a stub_2_4 date" class="gt_row gt_right" style="background-color: #B3B3B3;">2015-04-15</td>
      <td headers="grp_a stub_2_4 time" class="gt_row gt_right" style="background-color: #A6A6A6;">16:50</td>
      <td headers="grp_a stub_2_4 datetime" class="gt_row gt_right" style="background-color: #999999;">2018-04-04 15:55</td>
      <td headers="grp_a stub_2_4 currency" class="gt_row gt_right" style="background-color: #8C8C8C;">65100.000</td></tr>
          <tr><th id="summary_stub_grp_a_1" scope="row" class="gt_row gt_left gt_stub gt_summary_row gt_first_summary_row thick" style="background-color: #FFA500;">min</th>
      <td headers="grp_a summary_stub_grp_a_1 num" class="gt_row gt_right gt_summary_row gt_first_summary_row thick" style="background-color: #8FBC8F;">0.11</td>
      <td headers="grp_a summary_stub_grp_a_1 char" class="gt_row gt_left gt_summary_row gt_first_summary_row thick">—</td>
      <td headers="grp_a summary_stub_grp_a_1 fctr" class="gt_row gt_center gt_summary_row gt_first_summary_row thick">—</td>
      <td headers="grp_a summary_stub_grp_a_1 date" class="gt_row gt_right gt_summary_row gt_first_summary_row thick">—</td>
      <td headers="grp_a summary_stub_grp_a_1 time" class="gt_row gt_right gt_summary_row gt_first_summary_row thick">—</td>
      <td headers="grp_a summary_stub_grp_a_1 datetime" class="gt_row gt_right gt_summary_row gt_first_summary_row thick">—</td>
      <td headers="grp_a summary_stub_grp_a_1 currency" class="gt_row gt_right gt_summary_row gt_first_summary_row thick" style="background-color: #8FBC8F;">1.39</td></tr>
          <tr><th id="summary_stub_grp_a_2" scope="row" class="gt_row gt_left gt_stub gt_summary_row" style="background-color: #FFA500;">max</th>
      <td headers="grp_a summary_stub_grp_a_2 num" class="gt_row gt_right gt_summary_row" style="background-color: #8FBC8F;">444.40</td>
      <td headers="grp_a summary_stub_grp_a_2 char" class="gt_row gt_left gt_summary_row">—</td>
      <td headers="grp_a summary_stub_grp_a_2 fctr" class="gt_row gt_center gt_summary_row">—</td>
      <td headers="grp_a summary_stub_grp_a_2 date" class="gt_row gt_right gt_summary_row">—</td>
      <td headers="grp_a summary_stub_grp_a_2 time" class="gt_row gt_right gt_summary_row">—</td>
      <td headers="grp_a summary_stub_grp_a_2 datetime" class="gt_row gt_right gt_summary_row">—</td>
      <td headers="grp_a summary_stub_grp_a_2 currency" class="gt_row gt_right gt_summary_row" style="background-color: #8FBC8F;">65100.00</td></tr>
          <tr><th id="summary_stub_grp_a_3" scope="row" class="gt_row gt_left gt_stub gt_summary_row gt_last_summary_row" style="background-color: #FFA500;">avg</th>
      <td headers="grp_a summary_stub_grp_a_3 num" class="gt_row gt_right gt_summary_row gt_last_summary_row" style="background-color: #8FBC8F;">120.02</td>
      <td headers="grp_a summary_stub_grp_a_3 char" class="gt_row gt_left gt_summary_row gt_last_summary_row">—</td>
      <td headers="grp_a summary_stub_grp_a_3 fctr" class="gt_row gt_center gt_summary_row gt_last_summary_row">—</td>
      <td headers="grp_a summary_stub_grp_a_3 date" class="gt_row gt_right gt_summary_row gt_last_summary_row">—</td>
      <td headers="grp_a summary_stub_grp_a_3 time" class="gt_row gt_right gt_summary_row gt_last_summary_row">—</td>
      <td headers="grp_a summary_stub_grp_a_3 datetime" class="gt_row gt_right gt_summary_row gt_last_summary_row">—</td>
      <td headers="grp_a summary_stub_grp_a_3 currency" class="gt_row gt_right gt_summary_row gt_last_summary_row" style="background-color: #8FBC8F;">16292.32</td></tr>
          <tr class="gt_row_group_first"><td headers="grp_b stub_2_5 stub_1" rowspan="7" class="gt_row gt_left gt_stub_row_group" style="background-color: #E0FFFF;">grp_b</td>
      <th id="stub_2_5" scope="row" class="gt_row gt_left gt_stub" style="background-color: #FFDAB9;">row_5</th>
      <td headers="grp_b stub_2_5 num" class="gt_row gt_right" style="background-color: #D9D9D9;">5.550e+03</td>
      <td headers="grp_b stub_2_5 char" class="gt_row gt_left" style="background-color: #CCCCCC;">NA</td>
      <td headers="grp_b stub_2_5 fctr" class="gt_row gt_center" style="background-color: #BFBFBF;">five</td>
      <td headers="grp_b stub_2_5 date" class="gt_row gt_right" style="background-color: #B3B3B3;">2015-05-15</td>
      <td headers="grp_b stub_2_5 time" class="gt_row gt_right" style="background-color: #A6A6A6;">17:55</td>
      <td headers="grp_b stub_2_5 datetime" class="gt_row gt_right" style="background-color: #999999;">2018-05-05 04:00</td>
      <td headers="grp_b stub_2_5 currency" class="gt_row gt_right" style="background-color: #8C8C8C;">1325.810</td></tr>
          <tr><th id="stub_2_6" scope="row" class="gt_row gt_left gt_stub" style="background-color: #FFDAB9;">row_6</th>
      <td headers="grp_b stub_2_6 num" class="gt_row gt_right" style="background-color: #D9D9D9;">NA</td>
      <td headers="grp_b stub_2_6 char" class="gt_row gt_left" style="background-color: #CCCCCC;">fig</td>
      <td headers="grp_b stub_2_6 fctr" class="gt_row gt_center" style="background-color: #BFBFBF;">six</td>
      <td headers="grp_b stub_2_6 date" class="gt_row gt_right" style="background-color: #B3B3B3;">2015-06-15</td>
      <td headers="grp_b stub_2_6 time" class="gt_row gt_right" style="background-color: #A6A6A6;">NA</td>
      <td headers="grp_b stub_2_6 datetime" class="gt_row gt_right" style="background-color: #999999;">2018-06-06 16:11</td>
      <td headers="grp_b stub_2_6 currency" class="gt_row gt_right" style="background-color: #8C8C8C;">13.255</td></tr>
          <tr><th id="stub_2_7" scope="row" class="gt_row gt_left gt_stub" style="background-color: #FFDAB9;">row_7</th>
      <td headers="grp_b stub_2_7 num" class="gt_row gt_right" style="background-color: #D9D9D9;">7.770e+05</td>
      <td headers="grp_b stub_2_7 char" class="gt_row gt_left" style="background-color: #CCCCCC;">grapefruit</td>
      <td headers="grp_b stub_2_7 fctr" class="gt_row gt_center" style="background-color: #BFBFBF;">seven</td>
      <td headers="grp_b stub_2_7 date" class="gt_row gt_right" style="background-color: #B3B3B3;">NA</td>
      <td headers="grp_b stub_2_7 time" class="gt_row gt_right" style="background-color: #A6A6A6;">19:10</td>
      <td headers="grp_b stub_2_7 datetime" class="gt_row gt_right" style="background-color: #999999;">2018-07-07 05:22</td>
      <td headers="grp_b stub_2_7 currency" class="gt_row gt_right" style="background-color: #8C8C8C;">NA</td></tr>
          <tr><th id="stub_2_8" scope="row" class="gt_row gt_left gt_stub" style="background-color: #FFDAB9;">row_8</th>
      <td headers="grp_b stub_2_8 num" class="gt_row gt_right" style="background-color: #D9D9D9;">8.880e+06</td>
      <td headers="grp_b stub_2_8 char" class="gt_row gt_left" style="background-color: #CCCCCC;">honeydew</td>
      <td headers="grp_b stub_2_8 fctr" class="gt_row gt_center" style="background-color: #BFBFBF;">eight</td>
      <td headers="grp_b stub_2_8 date" class="gt_row gt_right" style="background-color: #B3B3B3;">2015-08-15</td>
      <td headers="grp_b stub_2_8 time" class="gt_row gt_right" style="background-color: #A6A6A6;">20:20</td>
      <td headers="grp_b stub_2_8 datetime" class="gt_row gt_right" style="background-color: #999999;">NA</td>
      <td headers="grp_b stub_2_8 currency" class="gt_row gt_right" style="background-color: #8C8C8C;">0.440</td></tr>
          <tr><th id="summary_stub_grp_b_1" scope="row" class="gt_row gt_left gt_stub gt_summary_row gt_first_summary_row thick" style="background-color: #FFA500;">min</th>
      <td headers="grp_b summary_stub_grp_b_1 num" class="gt_row gt_right gt_summary_row gt_first_summary_row thick" style="background-color: #8FBC8F;">5550.00</td>
      <td headers="grp_b summary_stub_grp_b_1 char" class="gt_row gt_left gt_summary_row gt_first_summary_row thick">—</td>
      <td headers="grp_b summary_stub_grp_b_1 fctr" class="gt_row gt_center gt_summary_row gt_first_summary_row thick">—</td>
      <td headers="grp_b summary_stub_grp_b_1 date" class="gt_row gt_right gt_summary_row gt_first_summary_row thick">—</td>
      <td headers="grp_b summary_stub_grp_b_1 time" class="gt_row gt_right gt_summary_row gt_first_summary_row thick">—</td>
      <td headers="grp_b summary_stub_grp_b_1 datetime" class="gt_row gt_right gt_summary_row gt_first_summary_row thick">—</td>
      <td headers="grp_b summary_stub_grp_b_1 currency" class="gt_row gt_right gt_summary_row gt_first_summary_row thick" style="background-color: #8FBC8F;">0.44</td></tr>
          <tr><th id="summary_stub_grp_b_2" scope="row" class="gt_row gt_left gt_stub gt_summary_row" style="background-color: #FFA500;">max</th>
      <td headers="grp_b summary_stub_grp_b_2 num" class="gt_row gt_right gt_summary_row" style="background-color: #8FBC8F;">8880000.00</td>
      <td headers="grp_b summary_stub_grp_b_2 char" class="gt_row gt_left gt_summary_row">—</td>
      <td headers="grp_b summary_stub_grp_b_2 fctr" class="gt_row gt_center gt_summary_row">—</td>
      <td headers="grp_b summary_stub_grp_b_2 date" class="gt_row gt_right gt_summary_row">—</td>
      <td headers="grp_b summary_stub_grp_b_2 time" class="gt_row gt_right gt_summary_row">—</td>
      <td headers="grp_b summary_stub_grp_b_2 datetime" class="gt_row gt_right gt_summary_row">—</td>
      <td headers="grp_b summary_stub_grp_b_2 currency" class="gt_row gt_right gt_summary_row" style="background-color: #8FBC8F;">1325.81</td></tr>
          <tr><th id="summary_stub_grp_b_3" scope="row" class="gt_row gt_left gt_stub gt_summary_row gt_last_summary_row" style="background-color: #FFA500;">avg</th>
      <td headers="grp_b summary_stub_grp_b_3 num" class="gt_row gt_right gt_summary_row gt_last_summary_row" style="background-color: #8FBC8F;">3220850.00</td>
      <td headers="grp_b summary_stub_grp_b_3 char" class="gt_row gt_left gt_summary_row gt_last_summary_row">—</td>
      <td headers="grp_b summary_stub_grp_b_3 fctr" class="gt_row gt_center gt_summary_row gt_last_summary_row">—</td>
      <td headers="grp_b summary_stub_grp_b_3 date" class="gt_row gt_right gt_summary_row gt_last_summary_row">—</td>
      <td headers="grp_b summary_stub_grp_b_3 time" class="gt_row gt_right gt_summary_row gt_last_summary_row">—</td>
      <td headers="grp_b summary_stub_grp_b_3 datetime" class="gt_row gt_right gt_summary_row gt_last_summary_row">—</td>
      <td headers="grp_b summary_stub_grp_b_3 currency" class="gt_row gt_right gt_summary_row gt_last_summary_row" style="background-color: #8FBC8F;">446.50</td></tr>
          <tr><th id="grand_summary_stub_1" scope="row" colspan="2" class="gt_row gt_left gt_stub gt_grand_summary_row gt_first_grand_summary_row" style="background-color: #FF0000;">min</th>
      <td headers="grand_summary_stub_1 num" class="gt_row gt_right gt_grand_summary_row gt_first_grand_summary_row" style="background-color: #D3D3D3;">0.11</td>
      <td headers="grand_summary_stub_1 char" class="gt_row gt_left gt_grand_summary_row gt_first_grand_summary_row">—</td>
      <td headers="grand_summary_stub_1 fctr" class="gt_row gt_center gt_grand_summary_row gt_first_grand_summary_row">—</td>
      <td headers="grand_summary_stub_1 date" class="gt_row gt_right gt_grand_summary_row gt_first_grand_summary_row">—</td>
      <td headers="grand_summary_stub_1 time" class="gt_row gt_right gt_grand_summary_row gt_first_grand_summary_row">—</td>
      <td headers="grand_summary_stub_1 datetime" class="gt_row gt_right gt_grand_summary_row gt_first_grand_summary_row">—</td>
      <td headers="grand_summary_stub_1 currency" class="gt_row gt_right gt_grand_summary_row gt_first_grand_summary_row" style="background-color: #D3D3D3;">0.44</td></tr>
          <tr><th id="grand_summary_stub_2" scope="row" colspan="2" class="gt_row gt_left gt_stub gt_grand_summary_row" style="background-color: #FF0000;">max</th>
      <td headers="grand_summary_stub_2 num" class="gt_row gt_right gt_grand_summary_row" style="background-color: #D3D3D3;">8880000.00</td>
      <td headers="grand_summary_stub_2 char" class="gt_row gt_left gt_grand_summary_row">—</td>
      <td headers="grand_summary_stub_2 fctr" class="gt_row gt_center gt_grand_summary_row">—</td>
      <td headers="grand_summary_stub_2 date" class="gt_row gt_right gt_grand_summary_row">—</td>
      <td headers="grand_summary_stub_2 time" class="gt_row gt_right gt_grand_summary_row">—</td>
      <td headers="grand_summary_stub_2 datetime" class="gt_row gt_right gt_grand_summary_row">—</td>
      <td headers="grand_summary_stub_2 currency" class="gt_row gt_right gt_grand_summary_row" style="background-color: #D3D3D3;">65100.00</td></tr>
          <tr><th id="grand_summary_stub_3" scope="row" colspan="2" class="gt_row gt_left gt_stub gt_grand_summary_row gt_last_summary_row" style="background-color: #FF0000;">avg</th>
      <td headers="grand_summary_stub_3 num" class="gt_row gt_right gt_grand_summary_row gt_last_summary_row" style="background-color: #D3D3D3;">1380432.87</td>
      <td headers="grand_summary_stub_3 char" class="gt_row gt_left gt_grand_summary_row gt_last_summary_row">—</td>
      <td headers="grand_summary_stub_3 fctr" class="gt_row gt_center gt_grand_summary_row gt_last_summary_row">—</td>
      <td headers="grand_summary_stub_3 date" class="gt_row gt_right gt_grand_summary_row gt_last_summary_row">—</td>
      <td headers="grand_summary_stub_3 time" class="gt_row gt_right gt_grand_summary_row gt_last_summary_row">—</td>
      <td headers="grand_summary_stub_3 datetime" class="gt_row gt_right gt_grand_summary_row gt_last_summary_row">—</td>
      <td headers="grand_summary_stub_3 currency" class="gt_row gt_right gt_grand_summary_row gt_last_summary_row" style="background-color: #D3D3D3;">9501.26</td></tr>
        </tbody>
        <tfoot>
          <tr class="gt_sourcenotes">
            <td class="gt_sourcenote" style="background-color: #F5DEB3;" colspan="9">Source note #1</td>
          </tr>
          <tr class="gt_sourcenotes">
            <td class="gt_sourcenote" style="background-color: #F5DEB3;" colspan="9">Source note #2</td>
          </tr>
        </tfoot>
      </table>

# Group labels as a column work well in Latex with specified column widths

    Code
      as.character(as_latex(gt_tbl))
    Output
      [1] "\\begingroup\n\\fontsize{12.0pt}{14.0pt}\\selectfont\n\\setlength{\\LTpost}{0mm}\n\\begin{longtable}{>{\\raggedright\\arraybackslash}p{\\dimexpr 0.10\\linewidth -2\\tabcolsep-1.5\\arrayrulewidth}|>{\\raggedright\\arraybackslash}p{\\dimexpr 0.10\\linewidth -2\\tabcolsep-1.5\\arrayrulewidth}|>{\\raggedleft\\arraybackslash}p{\\dimexpr 0.10\\linewidth -2\\tabcolsep-1.5\\arrayrulewidth}>{\\raggedright\\arraybackslash}p{\\dimexpr 0.10\\linewidth -2\\tabcolsep-1.5\\arrayrulewidth}>{\\centering\\arraybackslash}p{\\dimexpr 0.10\\linewidth -2\\tabcolsep-1.5\\arrayrulewidth}>{\\raggedleft\\arraybackslash}p{\\dimexpr 0.10\\linewidth -2\\tabcolsep-1.5\\arrayrulewidth}>{\\raggedleft\\arraybackslash}p{\\dimexpr 0.10\\linewidth -2\\tabcolsep-1.5\\arrayrulewidth}>{\\raggedleft\\arraybackslash}p{\\dimexpr 0.10\\linewidth -2\\tabcolsep-1.5\\arrayrulewidth}>{\\raggedleft\\arraybackslash}p{\\dimexpr 0.10\\linewidth -2\\tabcolsep-1.5\\arrayrulewidth}}\n\\caption*{\n{\\fontsize{20}{25}\\selectfont  Data listing from \\textbf{exibble}\\fontsize{12}{15}\\selectfont } \\\\ \n{\\fontsize{14}{17}\\selectfont  \\texttt{exibble} is an R dataset\\fontsize{12}{15}\\selectfont }\n} \\\\ \n\\toprule\n\\multicolumn{2}{>{\\raggedright\\arraybackslash}m{\\dimexpr 0.20\\linewidth -2\\tabcolsep-1.5\\arrayrulewidth}}{} &  &  &  & \\multicolumn{3}{>{\\centering\\arraybackslash}m{\\dimexpr 0.30\\linewidth -2\\tabcolsep-1.5\\arrayrulewidth}}{\\parbox{\\linewidth}{timing}} &  \\\\ \n\\cmidrule(lr){6-8}\n\\multicolumn{2}{>{\\centering\\arraybackslash}m{\\dimexpr 0.20\\linewidth -2\\tabcolsep-1.5\\arrayrulewidth}}{\\parbox{\\linewidth}{S.L.}} & num & char & fctr & date & time & datetime & currency \\\\ \n\\midrule\\addlinespace[2.5pt]\n\\multirow[t]{7}{=}{grp\\_a} & row\\_1 & 1.111e-01 & apricot & one & 2015-01-15 & 13:35 & 2018-01-01 02:22 & 49.950 \\\\ \n & row\\_2 & 2.222e+00 & banana & two & 2015-02-15 & 14:40 & 2018-02-02 14:33 & 17.950 \\\\ \n & row\\_3 & 3.333e+01 & coconut & three & 2015-03-15 & 15:45 & 2018-03-03 03:44 & 1.390 \\\\ \n & row\\_4 & 4.444e+02 & durian & four & 2015-04-15 & 16:50 & 2018-04-04 15:55 & 65100.000 \\\\ \n\\cmidrule(l{-0.05em}r){2-9}\n\\multicolumn{1}{l|}{} & \\multicolumn{1}{l|}{min} & 0.11 & — & — & — & — & — & 1.39 \\\\ \n\\multicolumn{1}{l|}{} & \\multicolumn{1}{l|}{max} & 444.40 & — & — & — & — & — & 65100.00 \\\\ \n\\multicolumn{1}{l|}{} & \\multicolumn{1}{l|}{avg} & 120.02 & — & — & — & — & — & 16292.32 \\\\ \n\\midrule\\addlinespace[2.5pt]\n\\multirow[t]{7}{=}{grp\\_b} & row\\_5 & 5.550e+03 & NA & five & 2015-05-15 & 17:55 & 2018-05-05 04:00 & 1325.810 \\\\ \n & row\\_6 & NA & fig & six & 2015-06-15 & NA & 2018-06-06 16:11 & 13.255 \\\\ \n & row\\_7 & 7.770e+05 & grapefruit & seven & NA & 19:10 & 2018-07-07 05:22 & NA \\\\ \n & row\\_8 & 8.880e+06 & honeydew & eight & 2015-08-15 & 20:20 & NA & 0.440 \\\\ \n\\cmidrule(l{-0.05em}r){2-9}\n\\multicolumn{1}{l|}{} & \\multicolumn{1}{l|}{min} & 5550.00 & — & — & — & — & — & 0.44 \\\\ \n\\multicolumn{1}{l|}{} & \\multicolumn{1}{l|}{max} & 8880000.00 & — & — & — & — & — & 1325.81 \\\\ \n\\multicolumn{1}{l|}{} & \\multicolumn{1}{l|}{avg} & 3220850.00 & — & — & — & — & — & 446.50 \\\\ \n\\midrule \n\\midrule \n\\multicolumn{1}{l|}{} & \\multicolumn{1}{l|}{min} & 0.11 & — & — & — & — & — & 0.44 \\\\ \n\\multicolumn{1}{l|}{} & \\multicolumn{1}{l|}{max} & 8880000.00 & — & — & — & — & — & 65100.00 \\\\ \n\\multicolumn{1}{l|}{} & \\multicolumn{1}{l|}{avg} & 1380432.87 & — & — & — & — & — & 9501.26 \\\\ \n\\bottomrule\n\\end{longtable}\n\\begin{minipage}{\\linewidth}\n\\vspace{.05em}\nSource note \\#1\\\\\nSource note \\#2\\\\\n\\end{minipage}\n\\endgroup\n"

---

    Code
      as.character(as_latex(gt_tbl))
    Output
      [1] "\\begingroup\n\\fontsize{12.0pt}{14.0pt}\\selectfont\n\\setlength{\\LTpost}{0mm}\n\\begin{longtable}{>{\\raggedright\\arraybackslash}p{\\dimexpr 0.10\\linewidth -2\\tabcolsep-1.5\\arrayrulewidth}|>{\\raggedleft\\arraybackslash}p{\\dimexpr 0.10\\linewidth -2\\tabcolsep-1.5\\arrayrulewidth}>{\\raggedright\\arraybackslash}p{\\dimexpr 0.10\\linewidth -2\\tabcolsep-1.5\\arrayrulewidth}>{\\centering\\arraybackslash}p{\\dimexpr 0.10\\linewidth -2\\tabcolsep-1.5\\arrayrulewidth}>{\\raggedleft\\arraybackslash}p{\\dimexpr 0.10\\linewidth -2\\tabcolsep-1.5\\arrayrulewidth}>{\\raggedleft\\arraybackslash}p{\\dimexpr 0.10\\linewidth -2\\tabcolsep-1.5\\arrayrulewidth}>{\\raggedleft\\arraybackslash}p{\\dimexpr 0.10\\linewidth -2\\tabcolsep-1.5\\arrayrulewidth}>{\\raggedleft\\arraybackslash}p{\\dimexpr 0.10\\linewidth -2\\tabcolsep-1.5\\arrayrulewidth}}\n\\caption*{\n{\\fontsize{20}{25}\\selectfont  Data listing from \\textbf{exibble}\\fontsize{12}{15}\\selectfont } \\\\ \n{\\fontsize{14}{17}\\selectfont  \\texttt{exibble} is an R dataset\\fontsize{12}{15}\\selectfont }\n} \\\\ \n\\toprule\n &  &  &  & \\multicolumn{3}{>{\\centering\\arraybackslash}m{\\dimexpr 0.30\\linewidth -2\\tabcolsep-1.5\\arrayrulewidth}}{\\parbox{\\linewidth}{timing}} &  \\\\ \n\\cmidrule(lr){5-7}\nS.L. & num & char & fctr & date & time & datetime & currency \\\\ \n\\midrule\\addlinespace[2.5pt]\n\\multicolumn{8}{>{\\raggedright\\arraybackslash}m{0.9\\linewidth}}{\\parbox{\\linewidth}{grp\\_a}} \\\\[2.5pt] \n\\midrule\\addlinespace[2.5pt]\nrow\\_1 & 1.111e-01 & apricot & one & 2015-01-15 & 13:35 & 2018-01-01 02:22 & 49.950 \\\\ \nrow\\_2 & 2.222e+00 & banana & two & 2015-02-15 & 14:40 & 2018-02-02 14:33 & 17.950 \\\\ \nrow\\_3 & 3.333e+01 & coconut & three & 2015-03-15 & 15:45 & 2018-03-03 03:44 & 1.390 \\\\ \nrow\\_4 & 4.444e+02 & durian & four & 2015-04-15 & 16:50 & 2018-04-04 15:55 & 65100.000 \\\\ \n\\midrule \nmin & 0.11 & — & — & — & — & — & 1.39 \\\\ \nmax & 444.40 & — & — & — & — & — & 65100.00 \\\\ \navg & 120.02 & — & — & — & — & — & 16292.32 \\\\ \n\\midrule\\addlinespace[2.5pt]\n\\multicolumn{8}{>{\\raggedright\\arraybackslash}m{0.9\\linewidth}}{\\parbox{\\linewidth}{grp\\_b}} \\\\[2.5pt] \n\\midrule\\addlinespace[2.5pt]\nrow\\_5 & 5.550e+03 & NA & five & 2015-05-15 & 17:55 & 2018-05-05 04:00 & 1325.810 \\\\ \nrow\\_6 & NA & fig & six & 2015-06-15 & NA & 2018-06-06 16:11 & 13.255 \\\\ \nrow\\_7 & 7.770e+05 & grapefruit & seven & NA & 19:10 & 2018-07-07 05:22 & NA \\\\ \nrow\\_8 & 8.880e+06 & honeydew & eight & 2015-08-15 & 20:20 & NA & 0.440 \\\\ \n\\midrule \nmin & 5550.00 & — & — & — & — & — & 0.44 \\\\ \nmax & 8880000.00 & — & — & — & — & — & 1325.81 \\\\ \navg & 3220850.00 & — & — & — & — & — & 446.50 \\\\ \n\\midrule \n\\midrule \nmin & 0.11 & — & — & — & — & — & 0.44 \\\\ \nmax & 8880000.00 & — & — & — & — & — & 65100.00 \\\\ \navg & 1380432.87 & — & — & — & — & — & 9501.26 \\\\ \n\\bottomrule\n\\end{longtable}\n\\begin{minipage}{\\linewidth}\n\\vspace{.05em}\nSource note \\#1\\\\\nSource note \\#2\\\\\n\\end{minipage}\n\\endgroup\n"

