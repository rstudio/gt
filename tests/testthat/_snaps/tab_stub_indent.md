# A gt table can contain indentation in the stub

    Code
      cat(render_as_html(gt_tbl))
    Output
      <table class="gt_table" data-quarto-disable-processing="false" data-quarto-bootstrap="false">
        <thead>
          <tr class="gt_col_headings">
            <th class="gt_col_heading gt_columns_bottom_border gt_left" rowspan="1" colspan="1" scope="col" id="a::stub"></th>
            <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id="num">num</th>
            <th class="gt_col_heading gt_columns_bottom_border gt_left" rowspan="1" colspan="1" scope="col" id="char">char</th>
            <th class="gt_col_heading gt_columns_bottom_border gt_center" rowspan="1" colspan="1" scope="col" id="fctr">fctr</th>
            <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id="date">date</th>
            <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id="time">time</th>
            <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id="datetime">datetime</th>
            <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id="currency">currency</th>
            <th class="gt_col_heading gt_columns_bottom_border gt_left" rowspan="1" colspan="1" scope="col" id="group">group</th>
          </tr>
        </thead>
        <tbody class="gt_table_body">
          <tr><td headers="stub_1_1 stub_1" class="gt_row gt_left gt_stub gt_indent_1">row_1</td>
      <td headers="stub_1_1 num" class="gt_row gt_right">1.111e-01</td>
      <td headers="stub_1_1 char" class="gt_row gt_left">apricot</td>
      <td headers="stub_1_1 fctr" class="gt_row gt_center">one</td>
      <td headers="stub_1_1 date" class="gt_row gt_right">2015-01-15</td>
      <td headers="stub_1_1 time" class="gt_row gt_right">13:35</td>
      <td headers="stub_1_1 datetime" class="gt_row gt_right">2018-01-01 02:22</td>
      <td headers="stub_1_1 currency" class="gt_row gt_right">49.950</td>
      <td headers="stub_1_1 group" class="gt_row gt_left">grp_a</td></tr>
          <tr><td headers="stub_1_2 stub_1" class="gt_row gt_left gt_stub gt_indent_1">row_2</td>
      <td headers="stub_1_2 num" class="gt_row gt_right">2.222e+00</td>
      <td headers="stub_1_2 char" class="gt_row gt_left">banana</td>
      <td headers="stub_1_2 fctr" class="gt_row gt_center">two</td>
      <td headers="stub_1_2 date" class="gt_row gt_right">2015-02-15</td>
      <td headers="stub_1_2 time" class="gt_row gt_right">14:40</td>
      <td headers="stub_1_2 datetime" class="gt_row gt_right">2018-02-02 14:33</td>
      <td headers="stub_1_2 currency" class="gt_row gt_right">17.950</td>
      <td headers="stub_1_2 group" class="gt_row gt_left">grp_a</td></tr>
          <tr><td headers="stub_1_3 stub_1" class="gt_row gt_left gt_stub gt_indent_1">row_3</td>
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
        
      </table>

---

    Code
      as.character(as_latex(gt_tbl))
    Output
      [1] "\\begingroup\n\\begin{longtable}{l|rlcrrrrl}\n\\toprule\n & num & char & fctr & date & time & datetime & currency & group \\\\ \n\\midrule\\addlinespace[2.5pt]\n\\hspace*{3.75pt} row\\_1 & 1.111e-01 & apricot & one & 2015-01-15 & 13:35 & 2018-01-01 02:22 & 49.950 & grp\\_a \\\\ \n\\hspace*{3.75pt} row\\_2 & 2.222e+00 & banana & two & 2015-02-15 & 14:40 & 2018-02-02 14:33 & 17.950 & grp\\_a \\\\ \n\\hspace*{3.75pt} row\\_3 & 3.333e+01 & coconut & three & 2015-03-15 & 15:45 & 2018-03-03 03:44 & 1.390 & grp\\_a \\\\ \nrow\\_4 & 4.444e+02 & durian & four & 2015-04-15 & 16:50 & 2018-04-04 15:55 & 65100.000 & grp\\_a \\\\ \nrow\\_5 & 5.550e+03 & NA & five & 2015-05-15 & 17:55 & 2018-05-05 04:00 & 1325.810 & grp\\_b \\\\ \nrow\\_6 & NA & fig & six & 2015-06-15 & NA & 2018-06-06 16:11 & 13.255 & grp\\_b \\\\ \nrow\\_7 & 7.770e+05 & grapefruit & seven & NA & 19:10 & 2018-07-07 05:22 & NA & grp\\_b \\\\ \nrow\\_8 & 8.880e+06 & honeydew & eight & 2015-08-15 & 20:20 & NA & 0.440 & grp\\_b \\\\ \n\\bottomrule\n\\end{longtable}\n\\endgroup\n"

---

    Code
      cat(render_as_html(gt_tbl))
    Output
      <table class="gt_table" data-quarto-disable-processing="false" data-quarto-bootstrap="false">
        <thead>
          <tr class="gt_col_headings">
            <th class="gt_col_heading gt_columns_bottom_border gt_left" rowspan="1" colspan="1" scope="col" id="a::stub"></th>
            <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id="num">num</th>
            <th class="gt_col_heading gt_columns_bottom_border gt_left" rowspan="1" colspan="1" scope="col" id="char">char</th>
            <th class="gt_col_heading gt_columns_bottom_border gt_center" rowspan="1" colspan="1" scope="col" id="fctr">fctr</th>
            <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id="date">date</th>
            <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id="time">time</th>
            <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id="datetime">datetime</th>
            <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id="currency">currency</th>
            <th class="gt_col_heading gt_columns_bottom_border gt_left" rowspan="1" colspan="1" scope="col" id="group">group</th>
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
          <tr><td headers="stub_1_3 stub_1" class="gt_row gt_left gt_stub gt_indent_2">row_3</td>
      <td headers="stub_1_3 num" class="gt_row gt_right">3.333e+01</td>
      <td headers="stub_1_3 char" class="gt_row gt_left">coconut</td>
      <td headers="stub_1_3 fctr" class="gt_row gt_center">three</td>
      <td headers="stub_1_3 date" class="gt_row gt_right">2015-03-15</td>
      <td headers="stub_1_3 time" class="gt_row gt_right">15:45</td>
      <td headers="stub_1_3 datetime" class="gt_row gt_right">2018-03-03 03:44</td>
      <td headers="stub_1_3 currency" class="gt_row gt_right">1.390</td>
      <td headers="stub_1_3 group" class="gt_row gt_left">grp_a</td></tr>
          <tr><td headers="stub_1_4 stub_1" class="gt_row gt_left gt_stub gt_indent_2">row_4</td>
      <td headers="stub_1_4 num" class="gt_row gt_right">4.444e+02</td>
      <td headers="stub_1_4 char" class="gt_row gt_left">durian</td>
      <td headers="stub_1_4 fctr" class="gt_row gt_center">four</td>
      <td headers="stub_1_4 date" class="gt_row gt_right">2015-04-15</td>
      <td headers="stub_1_4 time" class="gt_row gt_right">16:50</td>
      <td headers="stub_1_4 datetime" class="gt_row gt_right">2018-04-04 15:55</td>
      <td headers="stub_1_4 currency" class="gt_row gt_right">65100.000</td>
      <td headers="stub_1_4 group" class="gt_row gt_left">grp_a</td></tr>
          <tr><td headers="stub_1_5 stub_1" class="gt_row gt_left gt_stub gt_indent_2">row_5</td>
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
        
      </table>

---

    Code
      as.character(as_latex(gt_tbl))
    Output
      [1] "\\begingroup\n\\begin{longtable}{l|rlcrrrrl}\n\\toprule\n & num & char & fctr & date & time & datetime & currency & group \\\\ \n\\midrule\\addlinespace[2.5pt]\nrow\\_1 & 1.111e-01 & apricot & one & 2015-01-15 & 13:35 & 2018-01-01 02:22 & 49.950 & grp\\_a \\\\ \nrow\\_2 & 2.222e+00 & banana & two & 2015-02-15 & 14:40 & 2018-02-02 14:33 & 17.950 & grp\\_a \\\\ \n\\hspace*{7.5pt} row\\_3 & 3.333e+01 & coconut & three & 2015-03-15 & 15:45 & 2018-03-03 03:44 & 1.390 & grp\\_a \\\\ \n\\hspace*{7.5pt} row\\_4 & 4.444e+02 & durian & four & 2015-04-15 & 16:50 & 2018-04-04 15:55 & 65100.000 & grp\\_a \\\\ \n\\hspace*{7.5pt} row\\_5 & 5.550e+03 & NA & five & 2015-05-15 & 17:55 & 2018-05-05 04:00 & 1325.810 & grp\\_b \\\\ \nrow\\_6 & NA & fig & six & 2015-06-15 & NA & 2018-06-06 16:11 & 13.255 & grp\\_b \\\\ \nrow\\_7 & 7.770e+05 & grapefruit & seven & NA & 19:10 & 2018-07-07 05:22 & NA & grp\\_b \\\\ \nrow\\_8 & 8.880e+06 & honeydew & eight & 2015-08-15 & 20:20 & NA & 0.440 & grp\\_b \\\\ \n\\bottomrule\n\\end{longtable}\n\\endgroup\n"

# Indentation values can be obtained from a table column

    Code
      cat(render_as_html(gt_tbl))
    Output
      <table class="gt_table" data-quarto-disable-processing="false" data-quarto-bootstrap="false">
        <thead>
          <tr class="gt_col_headings">
            <th class="gt_col_heading gt_columns_bottom_border gt_left" rowspan="1" colspan="1" scope="col" id="a::stub"></th>
            <th class="gt_col_heading gt_columns_bottom_border gt_center" rowspan="1" colspan="1" scope="col" id="fctr">fctr</th>
            <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id="currency">currency</th>
            <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id="rank">rank</th>
          </tr>
        </thead>
        <tbody class="gt_table_body">
          <tr><td headers="stub_1_1 stub_1" class="gt_row gt_left gt_stub gt_indent_1">durian</td>
      <td headers="stub_1_1 fctr" class="gt_row gt_center">four</td>
      <td headers="stub_1_1 currency" class="gt_row gt_right">65100.000</td>
      <td headers="stub_1_1 rank" class="gt_row gt_right">1</td></tr>
          <tr><td headers="stub_1_2 stub_1" class="gt_row gt_left gt_stub gt_indent_2">NA</td>
      <td headers="stub_1_2 fctr" class="gt_row gt_center">five</td>
      <td headers="stub_1_2 currency" class="gt_row gt_right">1325.810</td>
      <td headers="stub_1_2 rank" class="gt_row gt_right">2</td></tr>
          <tr><td headers="stub_1_3 stub_1" class="gt_row gt_left gt_stub gt_indent_3">apricot</td>
      <td headers="stub_1_3 fctr" class="gt_row gt_center">one</td>
      <td headers="stub_1_3 currency" class="gt_row gt_right">49.950</td>
      <td headers="stub_1_3 rank" class="gt_row gt_right">3</td></tr>
          <tr><td headers="stub_1_4 stub_1" class="gt_row gt_left gt_stub gt_indent_4">banana</td>
      <td headers="stub_1_4 fctr" class="gt_row gt_center">two</td>
      <td headers="stub_1_4 currency" class="gt_row gt_right">17.950</td>
      <td headers="stub_1_4 rank" class="gt_row gt_right">4</td></tr>
          <tr><td headers="stub_1_5 stub_1" class="gt_row gt_left gt_stub gt_indent_5">fig</td>
      <td headers="stub_1_5 fctr" class="gt_row gt_center">six</td>
      <td headers="stub_1_5 currency" class="gt_row gt_right">13.255</td>
      <td headers="stub_1_5 rank" class="gt_row gt_right">5</td></tr>
          <tr><td headers="stub_1_6 stub_1" class="gt_row gt_left gt_stub gt_indent_5">coconut</td>
      <td headers="stub_1_6 fctr" class="gt_row gt_center">three</td>
      <td headers="stub_1_6 currency" class="gt_row gt_right">1.390</td>
      <td headers="stub_1_6 rank" class="gt_row gt_right">6</td></tr>
          <tr><td headers="stub_1_7 stub_1" class="gt_row gt_left gt_stub gt_indent_5">honeydew</td>
      <td headers="stub_1_7 fctr" class="gt_row gt_center">eight</td>
      <td headers="stub_1_7 currency" class="gt_row gt_right">0.440</td>
      <td headers="stub_1_7 rank" class="gt_row gt_right">7</td></tr>
          <tr><th id="stub_1_8" scope="row" class="gt_row gt_left gt_stub">grapefruit</th>
      <td headers="stub_1_8 fctr" class="gt_row gt_center">seven</td>
      <td headers="stub_1_8 currency" class="gt_row gt_right">NA</td>
      <td headers="stub_1_8 rank" class="gt_row gt_right">NA</td></tr>
        </tbody>
        
      </table>

---

    Code
      as.character(as_latex(gt_tbl))
    Output
      [1] "\\begingroup\n\\begin{longtable}{l|crr}\n\\toprule\n & fctr & currency & rank \\\\ \n\\midrule\\addlinespace[2.5pt]\n\\hspace*{3.75pt} durian & four & 65100.000 & 1 \\\\ \n\\hspace*{7.5pt} NA & five & 1325.810 & 2 \\\\ \n\\hspace*{11.25pt} apricot & one & 49.950 & 3 \\\\ \n\\hspace*{15pt} banana & two & 17.950 & 4 \\\\ \n\\hspace*{18.75pt} fig & six & 13.255 & 5 \\\\ \n\\hspace*{18.75pt} coconut & three & 1.390 & 6 \\\\ \n\\hspace*{18.75pt} honeydew & eight & 0.440 & 7 \\\\ \ngrapefruit & seven & NA & NA \\\\ \n\\bottomrule\n\\end{longtable}\n\\endgroup\n"

---

    Code
      cat(render_as_html(gt_tbl))
    Output
      <table class="gt_table" data-quarto-disable-processing="false" data-quarto-bootstrap="false">
        <thead>
          <tr class="gt_col_headings">
            <th class="gt_col_heading gt_columns_bottom_border gt_left" rowspan="1" colspan="1" scope="col" id="a::stub"></th>
            <th class="gt_col_heading gt_columns_bottom_border gt_center" rowspan="1" colspan="1" scope="col" id="fctr">fctr</th>
            <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id="currency">currency</th>
            <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id="rank">rank</th>
          </tr>
        </thead>
        <tbody class="gt_table_body">
          <tr class="gt_group_heading_row">
            <th colspan="4" class="gt_group_heading" scope="colgroup" id="grp_a">grp_a</th>
          </tr>
          <tr class="gt_row_group_first"><td headers="grp_a stub_1_1 stub_1" class="gt_row gt_left gt_stub gt_indent_1">durian</td>
      <td headers="grp_a stub_1_1 fctr" class="gt_row gt_center">four</td>
      <td headers="grp_a stub_1_1 currency" class="gt_row gt_right">65100.000</td>
      <td headers="grp_a stub_1_1 rank" class="gt_row gt_right">1</td></tr>
          <tr><td headers="grp_a stub_1_2 stub_1" class="gt_row gt_left gt_stub gt_indent_3">apricot</td>
      <td headers="grp_a stub_1_2 fctr" class="gt_row gt_center">one</td>
      <td headers="grp_a stub_1_2 currency" class="gt_row gt_right">49.950</td>
      <td headers="grp_a stub_1_2 rank" class="gt_row gt_right">3</td></tr>
          <tr><td headers="grp_a stub_1_3 stub_1" class="gt_row gt_left gt_stub gt_indent_4">banana</td>
      <td headers="grp_a stub_1_3 fctr" class="gt_row gt_center">two</td>
      <td headers="grp_a stub_1_3 currency" class="gt_row gt_right">17.950</td>
      <td headers="grp_a stub_1_3 rank" class="gt_row gt_right">4</td></tr>
          <tr><td headers="grp_a stub_1_4 stub_1" class="gt_row gt_left gt_stub gt_indent_5">coconut</td>
      <td headers="grp_a stub_1_4 fctr" class="gt_row gt_center">three</td>
      <td headers="grp_a stub_1_4 currency" class="gt_row gt_right">1.390</td>
      <td headers="grp_a stub_1_4 rank" class="gt_row gt_right">6</td></tr>
          <tr class="gt_group_heading_row">
            <th colspan="4" class="gt_group_heading" scope="colgroup" id="grp_b">grp_b</th>
          </tr>
          <tr class="gt_row_group_first"><td headers="grp_b stub_1_5 stub_1" class="gt_row gt_left gt_stub gt_indent_2">NA</td>
      <td headers="grp_b stub_1_5 fctr" class="gt_row gt_center">five</td>
      <td headers="grp_b stub_1_5 currency" class="gt_row gt_right">1325.810</td>
      <td headers="grp_b stub_1_5 rank" class="gt_row gt_right">2</td></tr>
          <tr><td headers="grp_b stub_1_6 stub_1" class="gt_row gt_left gt_stub gt_indent_5">fig</td>
      <td headers="grp_b stub_1_6 fctr" class="gt_row gt_center">six</td>
      <td headers="grp_b stub_1_6 currency" class="gt_row gt_right">13.255</td>
      <td headers="grp_b stub_1_6 rank" class="gt_row gt_right">5</td></tr>
          <tr><td headers="grp_b stub_1_7 stub_1" class="gt_row gt_left gt_stub gt_indent_5">honeydew</td>
      <td headers="grp_b stub_1_7 fctr" class="gt_row gt_center">eight</td>
      <td headers="grp_b stub_1_7 currency" class="gt_row gt_right">0.440</td>
      <td headers="grp_b stub_1_7 rank" class="gt_row gt_right">7</td></tr>
          <tr><th id="stub_1_8" scope="row" class="gt_row gt_left gt_stub">grapefruit</th>
      <td headers="grp_b stub_1_8 fctr" class="gt_row gt_center">seven</td>
      <td headers="grp_b stub_1_8 currency" class="gt_row gt_right">NA</td>
      <td headers="grp_b stub_1_8 rank" class="gt_row gt_right">NA</td></tr>
        </tbody>
        
      </table>

---

    Code
      as.character(as_latex(gt_tbl))
    Output
      [1] "\\begingroup\n\\begin{longtable}{l|crr}\n\\toprule\n & fctr & currency & rank \\\\ \n\\midrule\\addlinespace[2.5pt]\n\\multicolumn{4}{l}{grp\\_a} \\\\[2.5pt] \n\\midrule\\addlinespace[2.5pt]\n\\hspace*{3.75pt} durian & four & 65100.000 & 1 \\\\ \n\\hspace*{11.25pt} apricot & one & 49.950 & 3 \\\\ \n\\hspace*{15pt} banana & two & 17.950 & 4 \\\\ \n\\hspace*{18.75pt} coconut & three & 1.390 & 6 \\\\ \n\\midrule\\addlinespace[2.5pt]\n\\multicolumn{4}{l}{grp\\_b} \\\\[2.5pt] \n\\midrule\\addlinespace[2.5pt]\n\\hspace*{7.5pt} NA & five & 1325.810 & 2 \\\\ \n\\hspace*{18.75pt} fig & six & 13.255 & 5 \\\\ \n\\hspace*{18.75pt} honeydew & eight & 0.440 & 7 \\\\ \ngrapefruit & seven & NA & NA \\\\ \n\\bottomrule\n\\end{longtable}\n\\endgroup\n"

---

    Code
      cat(render_as_html(gt_tbl))
    Output
      <table class="gt_table" data-quarto-disable-processing="false" data-quarto-bootstrap="false">
        <thead>
          <tr class="gt_col_headings">
            <th class="gt_col_heading gt_columns_bottom_border gt_left" rowspan="1" colspan="1" scope="col" id="a::stub"></th>
            <th class="gt_col_heading gt_columns_bottom_border gt_center" rowspan="1" colspan="1" scope="col" id="fctr">fctr</th>
            <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id="currency">currency</th>
            <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id="rank">rank</th>
          </tr>
        </thead>
        <tbody class="gt_table_body">
          <tr class="gt_group_heading_row">
            <th colspan="4" class="gt_group_heading" scope="colgroup" id="grp_a">grp_a</th>
          </tr>
          <tr class="gt_row_group_first"><td headers="grp_a stub_1_1 stub_1" class="gt_row gt_left gt_stub gt_indent_1">durian</td>
      <td headers="grp_a stub_1_1 fctr" class="gt_row gt_center">four</td>
      <td headers="grp_a stub_1_1 currency" class="gt_row gt_right">65100.000</td>
      <td headers="grp_a stub_1_1 rank" class="gt_row gt_right">1</td></tr>
          <tr><td headers="grp_a stub_1_2 stub_1" class="gt_row gt_left gt_stub gt_indent_3">apricot</td>
      <td headers="grp_a stub_1_2 fctr" class="gt_row gt_center">one</td>
      <td headers="grp_a stub_1_2 currency" class="gt_row gt_right">49.950</td>
      <td headers="grp_a stub_1_2 rank" class="gt_row gt_right">3</td></tr>
          <tr><td headers="grp_a stub_1_3 stub_1" class="gt_row gt_left gt_stub gt_indent_4">banana</td>
      <td headers="grp_a stub_1_3 fctr" class="gt_row gt_center">two</td>
      <td headers="grp_a stub_1_3 currency" class="gt_row gt_right">17.950</td>
      <td headers="grp_a stub_1_3 rank" class="gt_row gt_right">4</td></tr>
          <tr><td headers="grp_a stub_1_4 stub_1" class="gt_row gt_left gt_stub gt_indent_5">coconut</td>
      <td headers="grp_a stub_1_4 fctr" class="gt_row gt_center">three</td>
      <td headers="grp_a stub_1_4 currency" class="gt_row gt_right">1.390</td>
      <td headers="grp_a stub_1_4 rank" class="gt_row gt_right">6</td></tr>
          <tr class="gt_group_heading_row">
            <th colspan="4" class="gt_group_heading" scope="colgroup" id="grp_b">grp_b</th>
          </tr>
          <tr class="gt_row_group_first"><td headers="grp_b stub_1_5 stub_1" class="gt_row gt_left gt_stub gt_indent_2">NA</td>
      <td headers="grp_b stub_1_5 fctr" class="gt_row gt_center">five</td>
      <td headers="grp_b stub_1_5 currency" class="gt_row gt_right">1325.810</td>
      <td headers="grp_b stub_1_5 rank" class="gt_row gt_right">2</td></tr>
          <tr><td headers="grp_b stub_1_6 stub_1" class="gt_row gt_left gt_stub gt_indent_5">fig</td>
      <td headers="grp_b stub_1_6 fctr" class="gt_row gt_center">six</td>
      <td headers="grp_b stub_1_6 currency" class="gt_row gt_right">13.255</td>
      <td headers="grp_b stub_1_6 rank" class="gt_row gt_right">5</td></tr>
          <tr><td headers="grp_b stub_1_7 stub_1" class="gt_row gt_left gt_stub gt_indent_5">honeydew</td>
      <td headers="grp_b stub_1_7 fctr" class="gt_row gt_center">eight</td>
      <td headers="grp_b stub_1_7 currency" class="gt_row gt_right">0.440</td>
      <td headers="grp_b stub_1_7 rank" class="gt_row gt_right">7</td></tr>
          <tr><td headers="grp_b stub_1_8 stub_1" class="gt_row gt_left gt_stub gt_indent_3">grapefruit</td>
      <td headers="grp_b stub_1_8 fctr" class="gt_row gt_center">seven</td>
      <td headers="grp_b stub_1_8 currency" class="gt_row gt_right">NA</td>
      <td headers="grp_b stub_1_8 rank" class="gt_row gt_right">NA</td></tr>
        </tbody>
        
      </table>

---

    Code
      as.character(as_latex(gt_tbl))
    Output
      [1] "\\begingroup\n\\begin{longtable}{l|crr}\n\\toprule\n & fctr & currency & rank \\\\ \n\\midrule\\addlinespace[2.5pt]\n\\multicolumn{4}{l}{grp\\_a} \\\\[2.5pt] \n\\midrule\\addlinespace[2.5pt]\n\\hspace*{3.75pt} durian & four & 65100.000 & 1 \\\\ \n\\hspace*{11.25pt} apricot & one & 49.950 & 3 \\\\ \n\\hspace*{15pt} banana & two & 17.950 & 4 \\\\ \n\\hspace*{18.75pt} coconut & three & 1.390 & 6 \\\\ \n\\midrule\\addlinespace[2.5pt]\n\\multicolumn{4}{l}{grp\\_b} \\\\[2.5pt] \n\\midrule\\addlinespace[2.5pt]\n\\hspace*{7.5pt} NA & five & 1325.810 & 2 \\\\ \n\\hspace*{18.75pt} fig & six & 13.255 & 5 \\\\ \n\\hspace*{18.75pt} honeydew & eight & 0.440 & 7 \\\\ \n\\hspace*{11.25pt} grapefruit & seven & NA & NA \\\\ \n\\bottomrule\n\\end{longtable}\n\\endgroup\n"

---

    Code
      cat(render_as_html(gt_tbl))
    Output
      <table class="gt_table" data-quarto-disable-processing="false" data-quarto-bootstrap="false">
        <thead>
          <tr class="gt_col_headings">
            <th class="gt_col_heading gt_columns_bottom_border gt_left" rowspan="1" colspan="1" scope="col" id="a::stub"></th>
            <th class="gt_col_heading gt_columns_bottom_border gt_center" rowspan="1" colspan="1" scope="col" id="fctr">fctr</th>
            <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id="currency">currency</th>
            <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id="rank">rank</th>
          </tr>
        </thead>
        <tbody class="gt_table_body">
          <tr class="gt_group_heading_row">
            <th colspan="4" class="gt_group_heading" scope="colgroup" id="grp_a">grp_a</th>
          </tr>
          <tr class="gt_row_group_first"><td headers="grp_a stub_1_1 stub_1" class="gt_row gt_left gt_stub gt_indent_2">durian</td>
      <td headers="grp_a stub_1_1 fctr" class="gt_row gt_center">four</td>
      <td headers="grp_a stub_1_1 currency" class="gt_row gt_right">65100.000</td>
      <td headers="grp_a stub_1_1 rank" class="gt_row gt_right">1</td></tr>
          <tr><td headers="grp_a stub_1_2 stub_1" class="gt_row gt_left gt_stub gt_indent_4">apricot</td>
      <td headers="grp_a stub_1_2 fctr" class="gt_row gt_center">one</td>
      <td headers="grp_a stub_1_2 currency" class="gt_row gt_right">49.950</td>
      <td headers="grp_a stub_1_2 rank" class="gt_row gt_right">3</td></tr>
          <tr><td headers="grp_a stub_1_3 stub_1" class="gt_row gt_left gt_stub gt_indent_5">banana</td>
      <td headers="grp_a stub_1_3 fctr" class="gt_row gt_center">two</td>
      <td headers="grp_a stub_1_3 currency" class="gt_row gt_right">17.950</td>
      <td headers="grp_a stub_1_3 rank" class="gt_row gt_right">4</td></tr>
          <tr><td headers="grp_a stub_1_4 stub_1" class="gt_row gt_left gt_stub gt_indent_5">coconut</td>
      <td headers="grp_a stub_1_4 fctr" class="gt_row gt_center">three</td>
      <td headers="grp_a stub_1_4 currency" class="gt_row gt_right">1.390</td>
      <td headers="grp_a stub_1_4 rank" class="gt_row gt_right">6</td></tr>
          <tr class="gt_group_heading_row">
            <th colspan="4" class="gt_group_heading" scope="colgroup" id="grp_b">grp_b</th>
          </tr>
          <tr class="gt_row_group_first"><td headers="grp_b stub_1_5 stub_1" class="gt_row gt_left gt_stub gt_indent_3">NA</td>
      <td headers="grp_b stub_1_5 fctr" class="gt_row gt_center">five</td>
      <td headers="grp_b stub_1_5 currency" class="gt_row gt_right">1325.810</td>
      <td headers="grp_b stub_1_5 rank" class="gt_row gt_right">2</td></tr>
          <tr><td headers="grp_b stub_1_6 stub_1" class="gt_row gt_left gt_stub gt_indent_5">fig</td>
      <td headers="grp_b stub_1_6 fctr" class="gt_row gt_center">six</td>
      <td headers="grp_b stub_1_6 currency" class="gt_row gt_right">13.255</td>
      <td headers="grp_b stub_1_6 rank" class="gt_row gt_right">5</td></tr>
          <tr><td headers="grp_b stub_1_7 stub_1" class="gt_row gt_left gt_stub gt_indent_5">honeydew</td>
      <td headers="grp_b stub_1_7 fctr" class="gt_row gt_center">eight</td>
      <td headers="grp_b stub_1_7 currency" class="gt_row gt_right">0.440</td>
      <td headers="grp_b stub_1_7 rank" class="gt_row gt_right">7</td></tr>
          <tr><td headers="grp_b stub_1_8 stub_1" class="gt_row gt_left gt_stub gt_indent_3">grapefruit</td>
      <td headers="grp_b stub_1_8 fctr" class="gt_row gt_center">seven</td>
      <td headers="grp_b stub_1_8 currency" class="gt_row gt_right">NA</td>
      <td headers="grp_b stub_1_8 rank" class="gt_row gt_right">NA</td></tr>
        </tbody>
        
      </table>

---

    Code
      as.character(as_latex(gt_tbl))
    Output
      [1] "\\begingroup\n\\begin{longtable}{l|crr}\n\\toprule\n & fctr & currency & rank \\\\ \n\\midrule\\addlinespace[2.5pt]\n\\multicolumn{4}{l}{grp\\_a} \\\\[2.5pt] \n\\midrule\\addlinespace[2.5pt]\n\\hspace*{7.5pt} durian & four & 65100.000 & 1 \\\\ \n\\hspace*{15pt} apricot & one & 49.950 & 3 \\\\ \n\\hspace*{18.75pt} banana & two & 17.950 & 4 \\\\ \n\\hspace*{18.75pt} coconut & three & 1.390 & 6 \\\\ \n\\midrule\\addlinespace[2.5pt]\n\\multicolumn{4}{l}{grp\\_b} \\\\[2.5pt] \n\\midrule\\addlinespace[2.5pt]\n\\hspace*{11.25pt} NA & five & 1325.810 & 2 \\\\ \n\\hspace*{18.75pt} fig & six & 13.255 & 5 \\\\ \n\\hspace*{18.75pt} honeydew & eight & 0.440 & 7 \\\\ \n\\hspace*{11.25pt} grapefruit & seven & NA & NA \\\\ \n\\bottomrule\n\\end{longtable}\n\\endgroup\n"

---

    Code
      cat(render_as_html(gt_tbl))
    Output
      <table class="gt_table" data-quarto-disable-processing="false" data-quarto-bootstrap="false">
        <thead>
          <tr class="gt_col_headings">
            <th class="gt_col_heading gt_columns_bottom_border gt_left" rowspan="1" colspan="1" scope="col" id="a::stub"></th>
            <th class="gt_col_heading gt_columns_bottom_border gt_center" rowspan="1" colspan="1" scope="col" id="fctr">fctr</th>
            <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id="currency">currency</th>
            <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id="rank">rank</th>
          </tr>
        </thead>
        <tbody class="gt_table_body">
          <tr class="gt_group_heading_row">
            <th colspan="4" class="gt_group_heading" scope="colgroup" id="grp_a">grp_a</th>
          </tr>
          <tr class="gt_row_group_first"><td headers="grp_a stub_1_1 stub_1" class="gt_row gt_left gt_stub gt_indent_1">durian</td>
      <td headers="grp_a stub_1_1 fctr" class="gt_row gt_center">four</td>
      <td headers="grp_a stub_1_1 currency" class="gt_row gt_right">65100.000</td>
      <td headers="grp_a stub_1_1 rank" class="gt_row gt_right">1</td></tr>
          <tr><td headers="grp_a stub_1_2 stub_1" class="gt_row gt_left gt_stub gt_indent_3">apricot</td>
      <td headers="grp_a stub_1_2 fctr" class="gt_row gt_center">one</td>
      <td headers="grp_a stub_1_2 currency" class="gt_row gt_right">49.950</td>
      <td headers="grp_a stub_1_2 rank" class="gt_row gt_right">3</td></tr>
          <tr><td headers="grp_a stub_1_3 stub_1" class="gt_row gt_left gt_stub gt_indent_4">banana</td>
      <td headers="grp_a stub_1_3 fctr" class="gt_row gt_center">two</td>
      <td headers="grp_a stub_1_3 currency" class="gt_row gt_right">17.950</td>
      <td headers="grp_a stub_1_3 rank" class="gt_row gt_right">4</td></tr>
          <tr><th id="stub_1_4" scope="row" class="gt_row gt_left gt_stub">coconut</th>
      <td headers="grp_a stub_1_4 fctr" class="gt_row gt_center">three</td>
      <td headers="grp_a stub_1_4 currency" class="gt_row gt_right">1.390</td>
      <td headers="grp_a stub_1_4 rank" class="gt_row gt_right">6</td></tr>
          <tr class="gt_group_heading_row">
            <th colspan="4" class="gt_group_heading" scope="colgroup" id="grp_b">grp_b</th>
          </tr>
          <tr class="gt_row_group_first"><th id="stub_1_5" scope="row" class="gt_row gt_left gt_stub">NA</th>
      <td headers="grp_b stub_1_5 fctr" class="gt_row gt_center">five</td>
      <td headers="grp_b stub_1_5 currency" class="gt_row gt_right">1325.810</td>
      <td headers="grp_b stub_1_5 rank" class="gt_row gt_right">2</td></tr>
          <tr><th id="stub_1_6" scope="row" class="gt_row gt_left gt_stub">fig</th>
      <td headers="grp_b stub_1_6 fctr" class="gt_row gt_center">six</td>
      <td headers="grp_b stub_1_6 currency" class="gt_row gt_right">13.255</td>
      <td headers="grp_b stub_1_6 rank" class="gt_row gt_right">5</td></tr>
          <tr><th id="stub_1_7" scope="row" class="gt_row gt_left gt_stub">honeydew</th>
      <td headers="grp_b stub_1_7 fctr" class="gt_row gt_center">eight</td>
      <td headers="grp_b stub_1_7 currency" class="gt_row gt_right">0.440</td>
      <td headers="grp_b stub_1_7 rank" class="gt_row gt_right">7</td></tr>
          <tr><td headers="grp_b stub_1_8 stub_1" class="gt_row gt_left gt_stub gt_indent_3">grapefruit</td>
      <td headers="grp_b stub_1_8 fctr" class="gt_row gt_center">seven</td>
      <td headers="grp_b stub_1_8 currency" class="gt_row gt_right">NA</td>
      <td headers="grp_b stub_1_8 rank" class="gt_row gt_right">NA</td></tr>
        </tbody>
        
      </table>

---

    Code
      as.character(as_latex(gt_tbl))
    Output
      [1] "\\begingroup\n\\begin{longtable}{l|crr}\n\\toprule\n & fctr & currency & rank \\\\ \n\\midrule\\addlinespace[2.5pt]\n\\multicolumn{4}{l}{grp\\_a} \\\\[2.5pt] \n\\midrule\\addlinespace[2.5pt]\n\\hspace*{3.75pt} durian & four & 65100.000 & 1 \\\\ \n\\hspace*{11.25pt} apricot & one & 49.950 & 3 \\\\ \n\\hspace*{15pt} banana & two & 17.950 & 4 \\\\ \ncoconut & three & 1.390 & 6 \\\\ \n\\midrule\\addlinespace[2.5pt]\n\\multicolumn{4}{l}{grp\\_b} \\\\[2.5pt] \n\\midrule\\addlinespace[2.5pt]\nNA & five & 1325.810 & 2 \\\\ \nfig & six & 13.255 & 5 \\\\ \nhoneydew & eight & 0.440 & 7 \\\\ \n\\hspace*{11.25pt} grapefruit & seven & NA & NA \\\\ \n\\bottomrule\n\\end{longtable}\n\\endgroup\n"

---

    Code
      cat(render_as_html(gt_tbl))
    Output
      <table class="gt_table" data-quarto-disable-processing="false" data-quarto-bootstrap="false">
        <thead>
          <tr class="gt_col_headings">
            <th class="gt_col_heading gt_columns_bottom_border gt_left" rowspan="1" colspan="1" scope="col" id="a::stub"></th>
            <th class="gt_col_heading gt_columns_bottom_border gt_center" rowspan="1" colspan="1" scope="col" id="fctr">fctr</th>
            <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id="currency">currency</th>
            <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id="rank">rank</th>
          </tr>
        </thead>
        <tbody class="gt_table_body">
          <tr><td headers="stub_1_1 stub_1" class="gt_row gt_left gt_stub gt_indent_1">durian</td>
      <td headers="stub_1_1 fctr" class="gt_row gt_center">four</td>
      <td headers="stub_1_1 currency" class="gt_row gt_right">65100.000</td>
      <td headers="stub_1_1 rank" class="gt_row gt_right">1.7</td></tr>
          <tr><td headers="stub_1_2 stub_1" class="gt_row gt_left gt_stub gt_indent_2">NA</td>
      <td headers="stub_1_2 fctr" class="gt_row gt_center">five</td>
      <td headers="stub_1_2 currency" class="gt_row gt_right">1325.810</td>
      <td headers="stub_1_2 rank" class="gt_row gt_right">2.7</td></tr>
          <tr><td headers="stub_1_3 stub_1" class="gt_row gt_left gt_stub gt_indent_3">apricot</td>
      <td headers="stub_1_3 fctr" class="gt_row gt_center">one</td>
      <td headers="stub_1_3 currency" class="gt_row gt_right">49.950</td>
      <td headers="stub_1_3 rank" class="gt_row gt_right">3.7</td></tr>
          <tr><td headers="stub_1_4 stub_1" class="gt_row gt_left gt_stub gt_indent_4">banana</td>
      <td headers="stub_1_4 fctr" class="gt_row gt_center">two</td>
      <td headers="stub_1_4 currency" class="gt_row gt_right">17.950</td>
      <td headers="stub_1_4 rank" class="gt_row gt_right">4.7</td></tr>
          <tr><td headers="stub_1_5 stub_1" class="gt_row gt_left gt_stub gt_indent_5">fig</td>
      <td headers="stub_1_5 fctr" class="gt_row gt_center">six</td>
      <td headers="stub_1_5 currency" class="gt_row gt_right">13.255</td>
      <td headers="stub_1_5 rank" class="gt_row gt_right">5.7</td></tr>
          <tr><td headers="stub_1_6 stub_1" class="gt_row gt_left gt_stub gt_indent_5">coconut</td>
      <td headers="stub_1_6 fctr" class="gt_row gt_center">three</td>
      <td headers="stub_1_6 currency" class="gt_row gt_right">1.390</td>
      <td headers="stub_1_6 rank" class="gt_row gt_right">6.7</td></tr>
          <tr><td headers="stub_1_7 stub_1" class="gt_row gt_left gt_stub gt_indent_5">honeydew</td>
      <td headers="stub_1_7 fctr" class="gt_row gt_center">eight</td>
      <td headers="stub_1_7 currency" class="gt_row gt_right">0.440</td>
      <td headers="stub_1_7 rank" class="gt_row gt_right">7.7</td></tr>
          <tr><th id="stub_1_8" scope="row" class="gt_row gt_left gt_stub">grapefruit</th>
      <td headers="stub_1_8 fctr" class="gt_row gt_center">seven</td>
      <td headers="stub_1_8 currency" class="gt_row gt_right">NA</td>
      <td headers="stub_1_8 rank" class="gt_row gt_right">NA</td></tr>
        </tbody>
        
      </table>

---

    Code
      as.character(as_latex(gt_tbl))
    Output
      [1] "\\begingroup\n\\begin{longtable}{l|crr}\n\\toprule\n & fctr & currency & rank \\\\ \n\\midrule\\addlinespace[2.5pt]\n\\hspace*{3.75pt} durian & four & 65100.000 & 1.7 \\\\ \n\\hspace*{7.5pt} NA & five & 1325.810 & 2.7 \\\\ \n\\hspace*{11.25pt} apricot & one & 49.950 & 3.7 \\\\ \n\\hspace*{15pt} banana & two & 17.950 & 4.7 \\\\ \n\\hspace*{18.75pt} fig & six & 13.255 & 5.7 \\\\ \n\\hspace*{18.75pt} coconut & three & 1.390 & 6.7 \\\\ \n\\hspace*{18.75pt} honeydew & eight & 0.440 & 7.7 \\\\ \ngrapefruit & seven & NA & NA \\\\ \n\\bottomrule\n\\end{longtable}\n\\endgroup\n"

