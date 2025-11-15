# A table header can be removed using `rm_header()`

    Code
      cat(render_as_html(gt_tbl))
    Output
      <table class="gt_table" data-quarto-disable-processing="false" data-quarto-bootstrap="false">
        <thead>
          <tr class="gt_heading">
            <td colspan="9" class="gt_heading gt_title gt_font_normal" style>test title</td>
          </tr>
          <tr class="gt_heading">
            <td colspan="9" class="gt_heading gt_subtitle gt_font_normal gt_bottom_border" style>test subtitle</td>
          </tr>
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
        
      </table>

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
        
      </table>

# Stubhead labels can be removed using `rm_stubhead()`

    Code
      cat(render_as_html(gt_tbl))
    Output
      <table class="gt_table" data-quarto-disable-processing="false" data-quarto-bootstrap="false">
        <thead>
          <tr class="gt_col_headings">
            <th class="gt_col_heading gt_columns_bottom_border gt_left" rowspan="1" colspan="1" scope="col" id="a::stub">Stubhead Label</th>
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
        
      </table>

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
        
      </table>

# Spanner column labels can be removed using `rm_spanners()`

    Code
      cat(render_as_html(gt_tbl))
    Output
      <table class="gt_table" data-quarto-disable-processing="false" data-quarto-bootstrap="false">
        <thead>
          <tr class="gt_col_headings gt_spanner_row">
            <th rowspan="1" colspan="1" scope="col"></th>
            <th class="gt_center gt_columns_top_border gt_column_spanner_outer" rowspan="1" colspan="2" scope="colgroup"></th>
            <th class="gt_center gt_columns_top_border gt_column_spanner_outer" rowspan="1" colspan="6" scope="colgroup" id="Performance">
              <div class="gt_column_spanner">Performance</div>
            </th>
            <th class="gt_center gt_columns_top_border gt_column_spanner_outer" rowspan="1" colspan="1" scope="col"></th>
          </tr>
          <tr class="gt_col_headings gt_spanner_row">
            <th class="gt_col_heading gt_columns_bottom_border gt_left" rowspan="2" colspan="1" scope="col" id="a::stub"></th>
            <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="2" colspan="1" scope="col" id="year">year</th>
            <th class="gt_col_heading gt_columns_bottom_border gt_left" rowspan="2" colspan="1" scope="col" id="bdy_style">bdy_style</th>
            <th class="gt_center gt_columns_top_border gt_column_spanner_outer" rowspan="1" colspan="2" scope="colgroup" id="HP">
              <div class="gt_column_spanner">HP</div>
            </th>
            <th class="gt_center gt_columns_top_border gt_column_spanner_outer" rowspan="1" colspan="2" scope="colgroup" id="Torque">
              <div class="gt_column_spanner">Torque</div>
            </th>
            <th class="gt_center gt_columns_top_border gt_column_spanner_outer" rowspan="1" colspan="2" scope="colgroup" id="MPG">
              <div class="gt_column_spanner">MPG</div>
            </th>
            <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="2" colspan="1" scope="col" id="msrp">msrp</th>
          </tr>
          <tr class="gt_col_headings">
            <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id="hp">hp</th>
            <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id="hp_rpm">hp_rpm</th>
            <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id="trq">trq</th>
            <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id="trq_rpm">trq_rpm</th>
            <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id="mpg_c">mpg_c</th>
            <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id="mpg_h">mpg_h</th>
          </tr>
        </thead>
        <tbody class="gt_table_body">
          <tr><th id="stub_1_1" scope="row" class="gt_row gt_left gt_stub">GT</th>
      <td headers="stub_1_1 year" class="gt_row gt_right">2017</td>
      <td headers="stub_1_1 bdy_style" class="gt_row gt_left">coupe</td>
      <td headers="stub_1_1 hp" class="gt_row gt_right">647</td>
      <td headers="stub_1_1 hp_rpm" class="gt_row gt_right">6250</td>
      <td headers="stub_1_1 trq" class="gt_row gt_right">550</td>
      <td headers="stub_1_1 trq_rpm" class="gt_row gt_right">5900</td>
      <td headers="stub_1_1 mpg_c" class="gt_row gt_right">11</td>
      <td headers="stub_1_1 mpg_h" class="gt_row gt_right">18</td>
      <td headers="stub_1_1 msrp" class="gt_row gt_right">447000</td></tr>
          <tr><th id="stub_1_2" scope="row" class="gt_row gt_left gt_stub">458 Speciale</th>
      <td headers="stub_1_2 year" class="gt_row gt_right">2015</td>
      <td headers="stub_1_2 bdy_style" class="gt_row gt_left">coupe</td>
      <td headers="stub_1_2 hp" class="gt_row gt_right">597</td>
      <td headers="stub_1_2 hp_rpm" class="gt_row gt_right">9000</td>
      <td headers="stub_1_2 trq" class="gt_row gt_right">398</td>
      <td headers="stub_1_2 trq_rpm" class="gt_row gt_right">6000</td>
      <td headers="stub_1_2 mpg_c" class="gt_row gt_right">13</td>
      <td headers="stub_1_2 mpg_h" class="gt_row gt_right">17</td>
      <td headers="stub_1_2 msrp" class="gt_row gt_right">291744</td></tr>
          <tr><th id="stub_1_3" scope="row" class="gt_row gt_left gt_stub">458 Spider</th>
      <td headers="stub_1_3 year" class="gt_row gt_right">2015</td>
      <td headers="stub_1_3 bdy_style" class="gt_row gt_left">convertible</td>
      <td headers="stub_1_3 hp" class="gt_row gt_right">562</td>
      <td headers="stub_1_3 hp_rpm" class="gt_row gt_right">9000</td>
      <td headers="stub_1_3 trq" class="gt_row gt_right">398</td>
      <td headers="stub_1_3 trq_rpm" class="gt_row gt_right">6000</td>
      <td headers="stub_1_3 mpg_c" class="gt_row gt_right">13</td>
      <td headers="stub_1_3 mpg_h" class="gt_row gt_right">17</td>
      <td headers="stub_1_3 msrp" class="gt_row gt_right">263553</td></tr>
          <tr><th id="stub_1_4" scope="row" class="gt_row gt_left gt_stub">458 Italia</th>
      <td headers="stub_1_4 year" class="gt_row gt_right">2014</td>
      <td headers="stub_1_4 bdy_style" class="gt_row gt_left">coupe</td>
      <td headers="stub_1_4 hp" class="gt_row gt_right">562</td>
      <td headers="stub_1_4 hp_rpm" class="gt_row gt_right">9000</td>
      <td headers="stub_1_4 trq" class="gt_row gt_right">398</td>
      <td headers="stub_1_4 trq_rpm" class="gt_row gt_right">6000</td>
      <td headers="stub_1_4 mpg_c" class="gt_row gt_right">13</td>
      <td headers="stub_1_4 mpg_h" class="gt_row gt_right">17</td>
      <td headers="stub_1_4 msrp" class="gt_row gt_right">233509</td></tr>
          <tr><th id="stub_1_5" scope="row" class="gt_row gt_left gt_stub">488 GTB</th>
      <td headers="stub_1_5 year" class="gt_row gt_right">2016</td>
      <td headers="stub_1_5 bdy_style" class="gt_row gt_left">coupe</td>
      <td headers="stub_1_5 hp" class="gt_row gt_right">661</td>
      <td headers="stub_1_5 hp_rpm" class="gt_row gt_right">8000</td>
      <td headers="stub_1_5 trq" class="gt_row gt_right">561</td>
      <td headers="stub_1_5 trq_rpm" class="gt_row gt_right">3000</td>
      <td headers="stub_1_5 mpg_c" class="gt_row gt_right">15</td>
      <td headers="stub_1_5 mpg_h" class="gt_row gt_right">22</td>
      <td headers="stub_1_5 msrp" class="gt_row gt_right">245400</td></tr>
          <tr><th id="stub_1_6" scope="row" class="gt_row gt_left gt_stub">California</th>
      <td headers="stub_1_6 year" class="gt_row gt_right">2015</td>
      <td headers="stub_1_6 bdy_style" class="gt_row gt_left">convertible</td>
      <td headers="stub_1_6 hp" class="gt_row gt_right">553</td>
      <td headers="stub_1_6 hp_rpm" class="gt_row gt_right">7500</td>
      <td headers="stub_1_6 trq" class="gt_row gt_right">557</td>
      <td headers="stub_1_6 trq_rpm" class="gt_row gt_right">4750</td>
      <td headers="stub_1_6 mpg_c" class="gt_row gt_right">16</td>
      <td headers="stub_1_6 mpg_h" class="gt_row gt_right">23</td>
      <td headers="stub_1_6 msrp" class="gt_row gt_right">198973</td></tr>
          <tr><th id="stub_1_7" scope="row" class="gt_row gt_left gt_stub">GTC4Lusso</th>
      <td headers="stub_1_7 year" class="gt_row gt_right">2017</td>
      <td headers="stub_1_7 bdy_style" class="gt_row gt_left">coupe</td>
      <td headers="stub_1_7 hp" class="gt_row gt_right">680</td>
      <td headers="stub_1_7 hp_rpm" class="gt_row gt_right">8250</td>
      <td headers="stub_1_7 trq" class="gt_row gt_right">514</td>
      <td headers="stub_1_7 trq_rpm" class="gt_row gt_right">5750</td>
      <td headers="stub_1_7 mpg_c" class="gt_row gt_right">12</td>
      <td headers="stub_1_7 mpg_h" class="gt_row gt_right">17</td>
      <td headers="stub_1_7 msrp" class="gt_row gt_right">298000</td></tr>
          <tr><th id="stub_1_8" scope="row" class="gt_row gt_left gt_stub">FF</th>
      <td headers="stub_1_8 year" class="gt_row gt_right">2015</td>
      <td headers="stub_1_8 bdy_style" class="gt_row gt_left">coupe</td>
      <td headers="stub_1_8 hp" class="gt_row gt_right">652</td>
      <td headers="stub_1_8 hp_rpm" class="gt_row gt_right">8000</td>
      <td headers="stub_1_8 trq" class="gt_row gt_right">504</td>
      <td headers="stub_1_8 trq_rpm" class="gt_row gt_right">6000</td>
      <td headers="stub_1_8 mpg_c" class="gt_row gt_right">11</td>
      <td headers="stub_1_8 mpg_h" class="gt_row gt_right">16</td>
      <td headers="stub_1_8 msrp" class="gt_row gt_right">295000</td></tr>
        </tbody>
        
      </table>

---

    Code
      cat(render_as_html(gt_tbl))
    Output
      <table class="gt_table" data-quarto-disable-processing="false" data-quarto-bootstrap="false">
        <thead>
          <tr class="gt_col_headings">
            <th class="gt_col_heading gt_columns_bottom_border gt_left" rowspan="1" colspan="1" scope="col" id="a::stub"></th>
            <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id="year">year</th>
            <th class="gt_col_heading gt_columns_bottom_border gt_left" rowspan="1" colspan="1" scope="col" id="bdy_style">bdy_style</th>
            <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id="hp">hp</th>
            <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id="hp_rpm">hp_rpm</th>
            <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id="trq">trq</th>
            <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id="trq_rpm">trq_rpm</th>
            <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id="mpg_c">mpg_c</th>
            <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id="mpg_h">mpg_h</th>
            <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id="msrp">msrp</th>
          </tr>
        </thead>
        <tbody class="gt_table_body">
          <tr><th id="stub_1_1" scope="row" class="gt_row gt_left gt_stub">GT</th>
      <td headers="stub_1_1 year" class="gt_row gt_right">2017</td>
      <td headers="stub_1_1 bdy_style" class="gt_row gt_left">coupe</td>
      <td headers="stub_1_1 hp" class="gt_row gt_right">647</td>
      <td headers="stub_1_1 hp_rpm" class="gt_row gt_right">6250</td>
      <td headers="stub_1_1 trq" class="gt_row gt_right">550</td>
      <td headers="stub_1_1 trq_rpm" class="gt_row gt_right">5900</td>
      <td headers="stub_1_1 mpg_c" class="gt_row gt_right">11</td>
      <td headers="stub_1_1 mpg_h" class="gt_row gt_right">18</td>
      <td headers="stub_1_1 msrp" class="gt_row gt_right">447000</td></tr>
          <tr><th id="stub_1_2" scope="row" class="gt_row gt_left gt_stub">458 Speciale</th>
      <td headers="stub_1_2 year" class="gt_row gt_right">2015</td>
      <td headers="stub_1_2 bdy_style" class="gt_row gt_left">coupe</td>
      <td headers="stub_1_2 hp" class="gt_row gt_right">597</td>
      <td headers="stub_1_2 hp_rpm" class="gt_row gt_right">9000</td>
      <td headers="stub_1_2 trq" class="gt_row gt_right">398</td>
      <td headers="stub_1_2 trq_rpm" class="gt_row gt_right">6000</td>
      <td headers="stub_1_2 mpg_c" class="gt_row gt_right">13</td>
      <td headers="stub_1_2 mpg_h" class="gt_row gt_right">17</td>
      <td headers="stub_1_2 msrp" class="gt_row gt_right">291744</td></tr>
          <tr><th id="stub_1_3" scope="row" class="gt_row gt_left gt_stub">458 Spider</th>
      <td headers="stub_1_3 year" class="gt_row gt_right">2015</td>
      <td headers="stub_1_3 bdy_style" class="gt_row gt_left">convertible</td>
      <td headers="stub_1_3 hp" class="gt_row gt_right">562</td>
      <td headers="stub_1_3 hp_rpm" class="gt_row gt_right">9000</td>
      <td headers="stub_1_3 trq" class="gt_row gt_right">398</td>
      <td headers="stub_1_3 trq_rpm" class="gt_row gt_right">6000</td>
      <td headers="stub_1_3 mpg_c" class="gt_row gt_right">13</td>
      <td headers="stub_1_3 mpg_h" class="gt_row gt_right">17</td>
      <td headers="stub_1_3 msrp" class="gt_row gt_right">263553</td></tr>
          <tr><th id="stub_1_4" scope="row" class="gt_row gt_left gt_stub">458 Italia</th>
      <td headers="stub_1_4 year" class="gt_row gt_right">2014</td>
      <td headers="stub_1_4 bdy_style" class="gt_row gt_left">coupe</td>
      <td headers="stub_1_4 hp" class="gt_row gt_right">562</td>
      <td headers="stub_1_4 hp_rpm" class="gt_row gt_right">9000</td>
      <td headers="stub_1_4 trq" class="gt_row gt_right">398</td>
      <td headers="stub_1_4 trq_rpm" class="gt_row gt_right">6000</td>
      <td headers="stub_1_4 mpg_c" class="gt_row gt_right">13</td>
      <td headers="stub_1_4 mpg_h" class="gt_row gt_right">17</td>
      <td headers="stub_1_4 msrp" class="gt_row gt_right">233509</td></tr>
          <tr><th id="stub_1_5" scope="row" class="gt_row gt_left gt_stub">488 GTB</th>
      <td headers="stub_1_5 year" class="gt_row gt_right">2016</td>
      <td headers="stub_1_5 bdy_style" class="gt_row gt_left">coupe</td>
      <td headers="stub_1_5 hp" class="gt_row gt_right">661</td>
      <td headers="stub_1_5 hp_rpm" class="gt_row gt_right">8000</td>
      <td headers="stub_1_5 trq" class="gt_row gt_right">561</td>
      <td headers="stub_1_5 trq_rpm" class="gt_row gt_right">3000</td>
      <td headers="stub_1_5 mpg_c" class="gt_row gt_right">15</td>
      <td headers="stub_1_5 mpg_h" class="gt_row gt_right">22</td>
      <td headers="stub_1_5 msrp" class="gt_row gt_right">245400</td></tr>
          <tr><th id="stub_1_6" scope="row" class="gt_row gt_left gt_stub">California</th>
      <td headers="stub_1_6 year" class="gt_row gt_right">2015</td>
      <td headers="stub_1_6 bdy_style" class="gt_row gt_left">convertible</td>
      <td headers="stub_1_6 hp" class="gt_row gt_right">553</td>
      <td headers="stub_1_6 hp_rpm" class="gt_row gt_right">7500</td>
      <td headers="stub_1_6 trq" class="gt_row gt_right">557</td>
      <td headers="stub_1_6 trq_rpm" class="gt_row gt_right">4750</td>
      <td headers="stub_1_6 mpg_c" class="gt_row gt_right">16</td>
      <td headers="stub_1_6 mpg_h" class="gt_row gt_right">23</td>
      <td headers="stub_1_6 msrp" class="gt_row gt_right">198973</td></tr>
          <tr><th id="stub_1_7" scope="row" class="gt_row gt_left gt_stub">GTC4Lusso</th>
      <td headers="stub_1_7 year" class="gt_row gt_right">2017</td>
      <td headers="stub_1_7 bdy_style" class="gt_row gt_left">coupe</td>
      <td headers="stub_1_7 hp" class="gt_row gt_right">680</td>
      <td headers="stub_1_7 hp_rpm" class="gt_row gt_right">8250</td>
      <td headers="stub_1_7 trq" class="gt_row gt_right">514</td>
      <td headers="stub_1_7 trq_rpm" class="gt_row gt_right">5750</td>
      <td headers="stub_1_7 mpg_c" class="gt_row gt_right">12</td>
      <td headers="stub_1_7 mpg_h" class="gt_row gt_right">17</td>
      <td headers="stub_1_7 msrp" class="gt_row gt_right">298000</td></tr>
          <tr><th id="stub_1_8" scope="row" class="gt_row gt_left gt_stub">FF</th>
      <td headers="stub_1_8 year" class="gt_row gt_right">2015</td>
      <td headers="stub_1_8 bdy_style" class="gt_row gt_left">coupe</td>
      <td headers="stub_1_8 hp" class="gt_row gt_right">652</td>
      <td headers="stub_1_8 hp_rpm" class="gt_row gt_right">8000</td>
      <td headers="stub_1_8 trq" class="gt_row gt_right">504</td>
      <td headers="stub_1_8 trq_rpm" class="gt_row gt_right">6000</td>
      <td headers="stub_1_8 mpg_c" class="gt_row gt_right">11</td>
      <td headers="stub_1_8 mpg_h" class="gt_row gt_right">16</td>
      <td headers="stub_1_8 msrp" class="gt_row gt_right">295000</td></tr>
        </tbody>
        
      </table>

---

    Code
      cat(render_as_html(gt_tbl))
    Output
      <table class="gt_table" data-quarto-disable-processing="false" data-quarto-bootstrap="false">
        <thead>
          <tr class="gt_col_headings gt_spanner_row">
            <th rowspan="1" colspan="1" scope="col"></th>
            <th class="gt_center gt_columns_top_border gt_column_spanner_outer" rowspan="1" colspan="2" scope="colgroup"></th>
            <th class="gt_center gt_columns_top_border gt_column_spanner_outer" rowspan="1" colspan="6" scope="colgroup" id="Performance">
              <div class="gt_column_spanner">Performance</div>
            </th>
            <th class="gt_center gt_columns_top_border gt_column_spanner_outer" rowspan="1" colspan="1" scope="col"></th>
          </tr>
          <tr class="gt_col_headings gt_spanner_row">
            <th class="gt_col_heading gt_columns_bottom_border gt_left" rowspan="2" colspan="1" scope="col" id="a::stub"></th>
            <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="2" colspan="1" scope="col" id="year">year</th>
            <th class="gt_col_heading gt_columns_bottom_border gt_left" rowspan="2" colspan="1" scope="col" id="bdy_style">bdy_style</th>
            <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="2" colspan="1" scope="col" id="hp">hp</th>
            <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="2" colspan="1" scope="col" id="hp_rpm">hp_rpm</th>
            <th class="gt_center gt_columns_top_border gt_column_spanner_outer" rowspan="1" colspan="2" scope="colgroup" id="Torque">
              <div class="gt_column_spanner">Torque</div>
            </th>
            <th class="gt_center gt_columns_top_border gt_column_spanner_outer" rowspan="1" colspan="2" scope="colgroup" id="MPG">
              <div class="gt_column_spanner">MPG</div>
            </th>
            <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="2" colspan="1" scope="col" id="msrp">msrp</th>
          </tr>
          <tr class="gt_col_headings">
            <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id="trq">trq</th>
            <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id="trq_rpm">trq_rpm</th>
            <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id="mpg_c">mpg_c</th>
            <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id="mpg_h">mpg_h</th>
          </tr>
        </thead>
        <tbody class="gt_table_body">
          <tr><th id="stub_1_1" scope="row" class="gt_row gt_left gt_stub">GT</th>
      <td headers="stub_1_1 year" class="gt_row gt_right">2017</td>
      <td headers="stub_1_1 bdy_style" class="gt_row gt_left">coupe</td>
      <td headers="stub_1_1 hp" class="gt_row gt_right">647</td>
      <td headers="stub_1_1 hp_rpm" class="gt_row gt_right">6250</td>
      <td headers="stub_1_1 trq" class="gt_row gt_right">550</td>
      <td headers="stub_1_1 trq_rpm" class="gt_row gt_right">5900</td>
      <td headers="stub_1_1 mpg_c" class="gt_row gt_right">11</td>
      <td headers="stub_1_1 mpg_h" class="gt_row gt_right">18</td>
      <td headers="stub_1_1 msrp" class="gt_row gt_right">447000</td></tr>
          <tr><th id="stub_1_2" scope="row" class="gt_row gt_left gt_stub">458 Speciale</th>
      <td headers="stub_1_2 year" class="gt_row gt_right">2015</td>
      <td headers="stub_1_2 bdy_style" class="gt_row gt_left">coupe</td>
      <td headers="stub_1_2 hp" class="gt_row gt_right">597</td>
      <td headers="stub_1_2 hp_rpm" class="gt_row gt_right">9000</td>
      <td headers="stub_1_2 trq" class="gt_row gt_right">398</td>
      <td headers="stub_1_2 trq_rpm" class="gt_row gt_right">6000</td>
      <td headers="stub_1_2 mpg_c" class="gt_row gt_right">13</td>
      <td headers="stub_1_2 mpg_h" class="gt_row gt_right">17</td>
      <td headers="stub_1_2 msrp" class="gt_row gt_right">291744</td></tr>
          <tr><th id="stub_1_3" scope="row" class="gt_row gt_left gt_stub">458 Spider</th>
      <td headers="stub_1_3 year" class="gt_row gt_right">2015</td>
      <td headers="stub_1_3 bdy_style" class="gt_row gt_left">convertible</td>
      <td headers="stub_1_3 hp" class="gt_row gt_right">562</td>
      <td headers="stub_1_3 hp_rpm" class="gt_row gt_right">9000</td>
      <td headers="stub_1_3 trq" class="gt_row gt_right">398</td>
      <td headers="stub_1_3 trq_rpm" class="gt_row gt_right">6000</td>
      <td headers="stub_1_3 mpg_c" class="gt_row gt_right">13</td>
      <td headers="stub_1_3 mpg_h" class="gt_row gt_right">17</td>
      <td headers="stub_1_3 msrp" class="gt_row gt_right">263553</td></tr>
          <tr><th id="stub_1_4" scope="row" class="gt_row gt_left gt_stub">458 Italia</th>
      <td headers="stub_1_4 year" class="gt_row gt_right">2014</td>
      <td headers="stub_1_4 bdy_style" class="gt_row gt_left">coupe</td>
      <td headers="stub_1_4 hp" class="gt_row gt_right">562</td>
      <td headers="stub_1_4 hp_rpm" class="gt_row gt_right">9000</td>
      <td headers="stub_1_4 trq" class="gt_row gt_right">398</td>
      <td headers="stub_1_4 trq_rpm" class="gt_row gt_right">6000</td>
      <td headers="stub_1_4 mpg_c" class="gt_row gt_right">13</td>
      <td headers="stub_1_4 mpg_h" class="gt_row gt_right">17</td>
      <td headers="stub_1_4 msrp" class="gt_row gt_right">233509</td></tr>
          <tr><th id="stub_1_5" scope="row" class="gt_row gt_left gt_stub">488 GTB</th>
      <td headers="stub_1_5 year" class="gt_row gt_right">2016</td>
      <td headers="stub_1_5 bdy_style" class="gt_row gt_left">coupe</td>
      <td headers="stub_1_5 hp" class="gt_row gt_right">661</td>
      <td headers="stub_1_5 hp_rpm" class="gt_row gt_right">8000</td>
      <td headers="stub_1_5 trq" class="gt_row gt_right">561</td>
      <td headers="stub_1_5 trq_rpm" class="gt_row gt_right">3000</td>
      <td headers="stub_1_5 mpg_c" class="gt_row gt_right">15</td>
      <td headers="stub_1_5 mpg_h" class="gt_row gt_right">22</td>
      <td headers="stub_1_5 msrp" class="gt_row gt_right">245400</td></tr>
          <tr><th id="stub_1_6" scope="row" class="gt_row gt_left gt_stub">California</th>
      <td headers="stub_1_6 year" class="gt_row gt_right">2015</td>
      <td headers="stub_1_6 bdy_style" class="gt_row gt_left">convertible</td>
      <td headers="stub_1_6 hp" class="gt_row gt_right">553</td>
      <td headers="stub_1_6 hp_rpm" class="gt_row gt_right">7500</td>
      <td headers="stub_1_6 trq" class="gt_row gt_right">557</td>
      <td headers="stub_1_6 trq_rpm" class="gt_row gt_right">4750</td>
      <td headers="stub_1_6 mpg_c" class="gt_row gt_right">16</td>
      <td headers="stub_1_6 mpg_h" class="gt_row gt_right">23</td>
      <td headers="stub_1_6 msrp" class="gt_row gt_right">198973</td></tr>
          <tr><th id="stub_1_7" scope="row" class="gt_row gt_left gt_stub">GTC4Lusso</th>
      <td headers="stub_1_7 year" class="gt_row gt_right">2017</td>
      <td headers="stub_1_7 bdy_style" class="gt_row gt_left">coupe</td>
      <td headers="stub_1_7 hp" class="gt_row gt_right">680</td>
      <td headers="stub_1_7 hp_rpm" class="gt_row gt_right">8250</td>
      <td headers="stub_1_7 trq" class="gt_row gt_right">514</td>
      <td headers="stub_1_7 trq_rpm" class="gt_row gt_right">5750</td>
      <td headers="stub_1_7 mpg_c" class="gt_row gt_right">12</td>
      <td headers="stub_1_7 mpg_h" class="gt_row gt_right">17</td>
      <td headers="stub_1_7 msrp" class="gt_row gt_right">298000</td></tr>
          <tr><th id="stub_1_8" scope="row" class="gt_row gt_left gt_stub">FF</th>
      <td headers="stub_1_8 year" class="gt_row gt_right">2015</td>
      <td headers="stub_1_8 bdy_style" class="gt_row gt_left">coupe</td>
      <td headers="stub_1_8 hp" class="gt_row gt_right">652</td>
      <td headers="stub_1_8 hp_rpm" class="gt_row gt_right">8000</td>
      <td headers="stub_1_8 trq" class="gt_row gt_right">504</td>
      <td headers="stub_1_8 trq_rpm" class="gt_row gt_right">6000</td>
      <td headers="stub_1_8 mpg_c" class="gt_row gt_right">11</td>
      <td headers="stub_1_8 mpg_h" class="gt_row gt_right">16</td>
      <td headers="stub_1_8 msrp" class="gt_row gt_right">295000</td></tr>
        </tbody>
        
      </table>

---

    Code
      cat(render_as_html(gt_tbl))
    Output
      <table class="gt_table" data-quarto-disable-processing="false" data-quarto-bootstrap="false">
        <thead>
          <tr class="gt_col_headings gt_spanner_row">
            <th rowspan="1" colspan="1" scope="col"></th>
            <th class="gt_center gt_columns_top_border gt_column_spanner_outer" rowspan="1" colspan="2" scope="colgroup"></th>
            <th class="gt_center gt_columns_top_border gt_column_spanner_outer" rowspan="1" colspan="6" scope="colgroup" id="Performance">
              <div class="gt_column_spanner">Performance</div>
            </th>
            <th class="gt_center gt_columns_top_border gt_column_spanner_outer" rowspan="1" colspan="1" scope="col"></th>
          </tr>
          <tr class="gt_col_headings gt_spanner_row">
            <th class="gt_col_heading gt_columns_bottom_border gt_left" rowspan="2" colspan="1" scope="col" id="a::stub"></th>
            <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="2" colspan="1" scope="col" id="year">year</th>
            <th class="gt_col_heading gt_columns_bottom_border gt_left" rowspan="2" colspan="1" scope="col" id="bdy_style">bdy_style</th>
            <th class="gt_center gt_columns_top_border gt_column_spanner_outer" rowspan="1" colspan="2" scope="colgroup" id="HP">
              <div class="gt_column_spanner">HP</div>
            </th>
            <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="2" colspan="1" scope="col" id="trq">trq</th>
            <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="2" colspan="1" scope="col" id="trq_rpm">trq_rpm</th>
            <th class="gt_center gt_columns_top_border gt_column_spanner_outer" rowspan="1" colspan="2" scope="colgroup" id="MPG">
              <div class="gt_column_spanner">MPG</div>
            </th>
            <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="2" colspan="1" scope="col" id="msrp">msrp</th>
          </tr>
          <tr class="gt_col_headings">
            <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id="hp">hp</th>
            <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id="hp_rpm">hp_rpm</th>
            <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id="mpg_c">mpg_c</th>
            <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id="mpg_h">mpg_h</th>
          </tr>
        </thead>
        <tbody class="gt_table_body">
          <tr><th id="stub_1_1" scope="row" class="gt_row gt_left gt_stub">GT</th>
      <td headers="stub_1_1 year" class="gt_row gt_right">2017</td>
      <td headers="stub_1_1 bdy_style" class="gt_row gt_left">coupe</td>
      <td headers="stub_1_1 hp" class="gt_row gt_right">647</td>
      <td headers="stub_1_1 hp_rpm" class="gt_row gt_right">6250</td>
      <td headers="stub_1_1 trq" class="gt_row gt_right">550</td>
      <td headers="stub_1_1 trq_rpm" class="gt_row gt_right">5900</td>
      <td headers="stub_1_1 mpg_c" class="gt_row gt_right">11</td>
      <td headers="stub_1_1 mpg_h" class="gt_row gt_right">18</td>
      <td headers="stub_1_1 msrp" class="gt_row gt_right">447000</td></tr>
          <tr><th id="stub_1_2" scope="row" class="gt_row gt_left gt_stub">458 Speciale</th>
      <td headers="stub_1_2 year" class="gt_row gt_right">2015</td>
      <td headers="stub_1_2 bdy_style" class="gt_row gt_left">coupe</td>
      <td headers="stub_1_2 hp" class="gt_row gt_right">597</td>
      <td headers="stub_1_2 hp_rpm" class="gt_row gt_right">9000</td>
      <td headers="stub_1_2 trq" class="gt_row gt_right">398</td>
      <td headers="stub_1_2 trq_rpm" class="gt_row gt_right">6000</td>
      <td headers="stub_1_2 mpg_c" class="gt_row gt_right">13</td>
      <td headers="stub_1_2 mpg_h" class="gt_row gt_right">17</td>
      <td headers="stub_1_2 msrp" class="gt_row gt_right">291744</td></tr>
          <tr><th id="stub_1_3" scope="row" class="gt_row gt_left gt_stub">458 Spider</th>
      <td headers="stub_1_3 year" class="gt_row gt_right">2015</td>
      <td headers="stub_1_3 bdy_style" class="gt_row gt_left">convertible</td>
      <td headers="stub_1_3 hp" class="gt_row gt_right">562</td>
      <td headers="stub_1_3 hp_rpm" class="gt_row gt_right">9000</td>
      <td headers="stub_1_3 trq" class="gt_row gt_right">398</td>
      <td headers="stub_1_3 trq_rpm" class="gt_row gt_right">6000</td>
      <td headers="stub_1_3 mpg_c" class="gt_row gt_right">13</td>
      <td headers="stub_1_3 mpg_h" class="gt_row gt_right">17</td>
      <td headers="stub_1_3 msrp" class="gt_row gt_right">263553</td></tr>
          <tr><th id="stub_1_4" scope="row" class="gt_row gt_left gt_stub">458 Italia</th>
      <td headers="stub_1_4 year" class="gt_row gt_right">2014</td>
      <td headers="stub_1_4 bdy_style" class="gt_row gt_left">coupe</td>
      <td headers="stub_1_4 hp" class="gt_row gt_right">562</td>
      <td headers="stub_1_4 hp_rpm" class="gt_row gt_right">9000</td>
      <td headers="stub_1_4 trq" class="gt_row gt_right">398</td>
      <td headers="stub_1_4 trq_rpm" class="gt_row gt_right">6000</td>
      <td headers="stub_1_4 mpg_c" class="gt_row gt_right">13</td>
      <td headers="stub_1_4 mpg_h" class="gt_row gt_right">17</td>
      <td headers="stub_1_4 msrp" class="gt_row gt_right">233509</td></tr>
          <tr><th id="stub_1_5" scope="row" class="gt_row gt_left gt_stub">488 GTB</th>
      <td headers="stub_1_5 year" class="gt_row gt_right">2016</td>
      <td headers="stub_1_5 bdy_style" class="gt_row gt_left">coupe</td>
      <td headers="stub_1_5 hp" class="gt_row gt_right">661</td>
      <td headers="stub_1_5 hp_rpm" class="gt_row gt_right">8000</td>
      <td headers="stub_1_5 trq" class="gt_row gt_right">561</td>
      <td headers="stub_1_5 trq_rpm" class="gt_row gt_right">3000</td>
      <td headers="stub_1_5 mpg_c" class="gt_row gt_right">15</td>
      <td headers="stub_1_5 mpg_h" class="gt_row gt_right">22</td>
      <td headers="stub_1_5 msrp" class="gt_row gt_right">245400</td></tr>
          <tr><th id="stub_1_6" scope="row" class="gt_row gt_left gt_stub">California</th>
      <td headers="stub_1_6 year" class="gt_row gt_right">2015</td>
      <td headers="stub_1_6 bdy_style" class="gt_row gt_left">convertible</td>
      <td headers="stub_1_6 hp" class="gt_row gt_right">553</td>
      <td headers="stub_1_6 hp_rpm" class="gt_row gt_right">7500</td>
      <td headers="stub_1_6 trq" class="gt_row gt_right">557</td>
      <td headers="stub_1_6 trq_rpm" class="gt_row gt_right">4750</td>
      <td headers="stub_1_6 mpg_c" class="gt_row gt_right">16</td>
      <td headers="stub_1_6 mpg_h" class="gt_row gt_right">23</td>
      <td headers="stub_1_6 msrp" class="gt_row gt_right">198973</td></tr>
          <tr><th id="stub_1_7" scope="row" class="gt_row gt_left gt_stub">GTC4Lusso</th>
      <td headers="stub_1_7 year" class="gt_row gt_right">2017</td>
      <td headers="stub_1_7 bdy_style" class="gt_row gt_left">coupe</td>
      <td headers="stub_1_7 hp" class="gt_row gt_right">680</td>
      <td headers="stub_1_7 hp_rpm" class="gt_row gt_right">8250</td>
      <td headers="stub_1_7 trq" class="gt_row gt_right">514</td>
      <td headers="stub_1_7 trq_rpm" class="gt_row gt_right">5750</td>
      <td headers="stub_1_7 mpg_c" class="gt_row gt_right">12</td>
      <td headers="stub_1_7 mpg_h" class="gt_row gt_right">17</td>
      <td headers="stub_1_7 msrp" class="gt_row gt_right">298000</td></tr>
          <tr><th id="stub_1_8" scope="row" class="gt_row gt_left gt_stub">FF</th>
      <td headers="stub_1_8 year" class="gt_row gt_right">2015</td>
      <td headers="stub_1_8 bdy_style" class="gt_row gt_left">coupe</td>
      <td headers="stub_1_8 hp" class="gt_row gt_right">652</td>
      <td headers="stub_1_8 hp_rpm" class="gt_row gt_right">8000</td>
      <td headers="stub_1_8 trq" class="gt_row gt_right">504</td>
      <td headers="stub_1_8 trq_rpm" class="gt_row gt_right">6000</td>
      <td headers="stub_1_8 mpg_c" class="gt_row gt_right">11</td>
      <td headers="stub_1_8 mpg_h" class="gt_row gt_right">16</td>
      <td headers="stub_1_8 msrp" class="gt_row gt_right">295000</td></tr>
        </tbody>
        
      </table>

---

    Code
      cat(render_as_html(gt_tbl))
    Output
      <table class="gt_table" data-quarto-disable-processing="false" data-quarto-bootstrap="false">
        <thead>
          <tr class="gt_col_headings gt_spanner_row">
            <th rowspan="1" colspan="1" scope="col"></th>
            <th class="gt_center gt_columns_top_border gt_column_spanner_outer" rowspan="1" colspan="2" scope="colgroup"></th>
            <th class="gt_center gt_columns_top_border gt_column_spanner_outer" rowspan="1" colspan="6" scope="colgroup" id="Performance">
              <div class="gt_column_spanner">Performance</div>
            </th>
            <th class="gt_center gt_columns_top_border gt_column_spanner_outer" rowspan="1" colspan="1" scope="col"></th>
          </tr>
          <tr class="gt_col_headings gt_spanner_row">
            <th class="gt_col_heading gt_columns_bottom_border gt_left" rowspan="2" colspan="1" scope="col" id="a::stub"></th>
            <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="2" colspan="1" scope="col" id="year">year</th>
            <th class="gt_col_heading gt_columns_bottom_border gt_left" rowspan="2" colspan="1" scope="col" id="bdy_style">bdy_style</th>
            <th class="gt_center gt_columns_top_border gt_column_spanner_outer" rowspan="1" colspan="2" scope="colgroup" id="HP">
              <div class="gt_column_spanner">HP</div>
            </th>
            <th class="gt_center gt_columns_top_border gt_column_spanner_outer" rowspan="1" colspan="2" scope="colgroup" id="Torque">
              <div class="gt_column_spanner">Torque</div>
            </th>
            <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="2" colspan="1" scope="col" id="mpg_c">mpg_c</th>
            <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="2" colspan="1" scope="col" id="mpg_h">mpg_h</th>
            <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="2" colspan="1" scope="col" id="msrp">msrp</th>
          </tr>
          <tr class="gt_col_headings">
            <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id="hp">hp</th>
            <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id="hp_rpm">hp_rpm</th>
            <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id="trq">trq</th>
            <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id="trq_rpm">trq_rpm</th>
          </tr>
        </thead>
        <tbody class="gt_table_body">
          <tr><th id="stub_1_1" scope="row" class="gt_row gt_left gt_stub">GT</th>
      <td headers="stub_1_1 year" class="gt_row gt_right">2017</td>
      <td headers="stub_1_1 bdy_style" class="gt_row gt_left">coupe</td>
      <td headers="stub_1_1 hp" class="gt_row gt_right">647</td>
      <td headers="stub_1_1 hp_rpm" class="gt_row gt_right">6250</td>
      <td headers="stub_1_1 trq" class="gt_row gt_right">550</td>
      <td headers="stub_1_1 trq_rpm" class="gt_row gt_right">5900</td>
      <td headers="stub_1_1 mpg_c" class="gt_row gt_right">11</td>
      <td headers="stub_1_1 mpg_h" class="gt_row gt_right">18</td>
      <td headers="stub_1_1 msrp" class="gt_row gt_right">447000</td></tr>
          <tr><th id="stub_1_2" scope="row" class="gt_row gt_left gt_stub">458 Speciale</th>
      <td headers="stub_1_2 year" class="gt_row gt_right">2015</td>
      <td headers="stub_1_2 bdy_style" class="gt_row gt_left">coupe</td>
      <td headers="stub_1_2 hp" class="gt_row gt_right">597</td>
      <td headers="stub_1_2 hp_rpm" class="gt_row gt_right">9000</td>
      <td headers="stub_1_2 trq" class="gt_row gt_right">398</td>
      <td headers="stub_1_2 trq_rpm" class="gt_row gt_right">6000</td>
      <td headers="stub_1_2 mpg_c" class="gt_row gt_right">13</td>
      <td headers="stub_1_2 mpg_h" class="gt_row gt_right">17</td>
      <td headers="stub_1_2 msrp" class="gt_row gt_right">291744</td></tr>
          <tr><th id="stub_1_3" scope="row" class="gt_row gt_left gt_stub">458 Spider</th>
      <td headers="stub_1_3 year" class="gt_row gt_right">2015</td>
      <td headers="stub_1_3 bdy_style" class="gt_row gt_left">convertible</td>
      <td headers="stub_1_3 hp" class="gt_row gt_right">562</td>
      <td headers="stub_1_3 hp_rpm" class="gt_row gt_right">9000</td>
      <td headers="stub_1_3 trq" class="gt_row gt_right">398</td>
      <td headers="stub_1_3 trq_rpm" class="gt_row gt_right">6000</td>
      <td headers="stub_1_3 mpg_c" class="gt_row gt_right">13</td>
      <td headers="stub_1_3 mpg_h" class="gt_row gt_right">17</td>
      <td headers="stub_1_3 msrp" class="gt_row gt_right">263553</td></tr>
          <tr><th id="stub_1_4" scope="row" class="gt_row gt_left gt_stub">458 Italia</th>
      <td headers="stub_1_4 year" class="gt_row gt_right">2014</td>
      <td headers="stub_1_4 bdy_style" class="gt_row gt_left">coupe</td>
      <td headers="stub_1_4 hp" class="gt_row gt_right">562</td>
      <td headers="stub_1_4 hp_rpm" class="gt_row gt_right">9000</td>
      <td headers="stub_1_4 trq" class="gt_row gt_right">398</td>
      <td headers="stub_1_4 trq_rpm" class="gt_row gt_right">6000</td>
      <td headers="stub_1_4 mpg_c" class="gt_row gt_right">13</td>
      <td headers="stub_1_4 mpg_h" class="gt_row gt_right">17</td>
      <td headers="stub_1_4 msrp" class="gt_row gt_right">233509</td></tr>
          <tr><th id="stub_1_5" scope="row" class="gt_row gt_left gt_stub">488 GTB</th>
      <td headers="stub_1_5 year" class="gt_row gt_right">2016</td>
      <td headers="stub_1_5 bdy_style" class="gt_row gt_left">coupe</td>
      <td headers="stub_1_5 hp" class="gt_row gt_right">661</td>
      <td headers="stub_1_5 hp_rpm" class="gt_row gt_right">8000</td>
      <td headers="stub_1_5 trq" class="gt_row gt_right">561</td>
      <td headers="stub_1_5 trq_rpm" class="gt_row gt_right">3000</td>
      <td headers="stub_1_5 mpg_c" class="gt_row gt_right">15</td>
      <td headers="stub_1_5 mpg_h" class="gt_row gt_right">22</td>
      <td headers="stub_1_5 msrp" class="gt_row gt_right">245400</td></tr>
          <tr><th id="stub_1_6" scope="row" class="gt_row gt_left gt_stub">California</th>
      <td headers="stub_1_6 year" class="gt_row gt_right">2015</td>
      <td headers="stub_1_6 bdy_style" class="gt_row gt_left">convertible</td>
      <td headers="stub_1_6 hp" class="gt_row gt_right">553</td>
      <td headers="stub_1_6 hp_rpm" class="gt_row gt_right">7500</td>
      <td headers="stub_1_6 trq" class="gt_row gt_right">557</td>
      <td headers="stub_1_6 trq_rpm" class="gt_row gt_right">4750</td>
      <td headers="stub_1_6 mpg_c" class="gt_row gt_right">16</td>
      <td headers="stub_1_6 mpg_h" class="gt_row gt_right">23</td>
      <td headers="stub_1_6 msrp" class="gt_row gt_right">198973</td></tr>
          <tr><th id="stub_1_7" scope="row" class="gt_row gt_left gt_stub">GTC4Lusso</th>
      <td headers="stub_1_7 year" class="gt_row gt_right">2017</td>
      <td headers="stub_1_7 bdy_style" class="gt_row gt_left">coupe</td>
      <td headers="stub_1_7 hp" class="gt_row gt_right">680</td>
      <td headers="stub_1_7 hp_rpm" class="gt_row gt_right">8250</td>
      <td headers="stub_1_7 trq" class="gt_row gt_right">514</td>
      <td headers="stub_1_7 trq_rpm" class="gt_row gt_right">5750</td>
      <td headers="stub_1_7 mpg_c" class="gt_row gt_right">12</td>
      <td headers="stub_1_7 mpg_h" class="gt_row gt_right">17</td>
      <td headers="stub_1_7 msrp" class="gt_row gt_right">298000</td></tr>
          <tr><th id="stub_1_8" scope="row" class="gt_row gt_left gt_stub">FF</th>
      <td headers="stub_1_8 year" class="gt_row gt_right">2015</td>
      <td headers="stub_1_8 bdy_style" class="gt_row gt_left">coupe</td>
      <td headers="stub_1_8 hp" class="gt_row gt_right">652</td>
      <td headers="stub_1_8 hp_rpm" class="gt_row gt_right">8000</td>
      <td headers="stub_1_8 trq" class="gt_row gt_right">504</td>
      <td headers="stub_1_8 trq_rpm" class="gt_row gt_right">6000</td>
      <td headers="stub_1_8 mpg_c" class="gt_row gt_right">11</td>
      <td headers="stub_1_8 mpg_h" class="gt_row gt_right">16</td>
      <td headers="stub_1_8 msrp" class="gt_row gt_right">295000</td></tr>
        </tbody>
        
      </table>

---

    Code
      cat(render_as_html(gt_tbl))
    Output
      <table class="gt_table" data-quarto-disable-processing="false" data-quarto-bootstrap="false">
        <thead>
          <tr class="gt_col_headings gt_spanner_row">
            <th class="gt_col_heading gt_columns_bottom_border gt_left" rowspan="2" colspan="1" scope="col" id="a::stub"></th>
            <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="2" colspan="1" scope="col" id="year">year</th>
            <th class="gt_col_heading gt_columns_bottom_border gt_left" rowspan="2" colspan="1" scope="col" id="bdy_style">bdy_style</th>
            <th class="gt_center gt_columns_top_border gt_column_spanner_outer" rowspan="1" colspan="2" scope="colgroup" id="HP">
              <div class="gt_column_spanner">HP</div>
            </th>
            <th class="gt_center gt_columns_top_border gt_column_spanner_outer" rowspan="1" colspan="2" scope="colgroup" id="Torque">
              <div class="gt_column_spanner">Torque</div>
            </th>
            <th class="gt_center gt_columns_top_border gt_column_spanner_outer" rowspan="1" colspan="2" scope="colgroup" id="MPG">
              <div class="gt_column_spanner">MPG</div>
            </th>
            <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="2" colspan="1" scope="col" id="msrp">msrp</th>
          </tr>
          <tr class="gt_col_headings">
            <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id="hp">hp</th>
            <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id="hp_rpm">hp_rpm</th>
            <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id="trq">trq</th>
            <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id="trq_rpm">trq_rpm</th>
            <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id="mpg_c">mpg_c</th>
            <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id="mpg_h">mpg_h</th>
          </tr>
        </thead>
        <tbody class="gt_table_body">
          <tr><th id="stub_1_1" scope="row" class="gt_row gt_left gt_stub">GT</th>
      <td headers="stub_1_1 year" class="gt_row gt_right">2017</td>
      <td headers="stub_1_1 bdy_style" class="gt_row gt_left">coupe</td>
      <td headers="stub_1_1 hp" class="gt_row gt_right">647</td>
      <td headers="stub_1_1 hp_rpm" class="gt_row gt_right">6250</td>
      <td headers="stub_1_1 trq" class="gt_row gt_right">550</td>
      <td headers="stub_1_1 trq_rpm" class="gt_row gt_right">5900</td>
      <td headers="stub_1_1 mpg_c" class="gt_row gt_right">11</td>
      <td headers="stub_1_1 mpg_h" class="gt_row gt_right">18</td>
      <td headers="stub_1_1 msrp" class="gt_row gt_right">447000</td></tr>
          <tr><th id="stub_1_2" scope="row" class="gt_row gt_left gt_stub">458 Speciale</th>
      <td headers="stub_1_2 year" class="gt_row gt_right">2015</td>
      <td headers="stub_1_2 bdy_style" class="gt_row gt_left">coupe</td>
      <td headers="stub_1_2 hp" class="gt_row gt_right">597</td>
      <td headers="stub_1_2 hp_rpm" class="gt_row gt_right">9000</td>
      <td headers="stub_1_2 trq" class="gt_row gt_right">398</td>
      <td headers="stub_1_2 trq_rpm" class="gt_row gt_right">6000</td>
      <td headers="stub_1_2 mpg_c" class="gt_row gt_right">13</td>
      <td headers="stub_1_2 mpg_h" class="gt_row gt_right">17</td>
      <td headers="stub_1_2 msrp" class="gt_row gt_right">291744</td></tr>
          <tr><th id="stub_1_3" scope="row" class="gt_row gt_left gt_stub">458 Spider</th>
      <td headers="stub_1_3 year" class="gt_row gt_right">2015</td>
      <td headers="stub_1_3 bdy_style" class="gt_row gt_left">convertible</td>
      <td headers="stub_1_3 hp" class="gt_row gt_right">562</td>
      <td headers="stub_1_3 hp_rpm" class="gt_row gt_right">9000</td>
      <td headers="stub_1_3 trq" class="gt_row gt_right">398</td>
      <td headers="stub_1_3 trq_rpm" class="gt_row gt_right">6000</td>
      <td headers="stub_1_3 mpg_c" class="gt_row gt_right">13</td>
      <td headers="stub_1_3 mpg_h" class="gt_row gt_right">17</td>
      <td headers="stub_1_3 msrp" class="gt_row gt_right">263553</td></tr>
          <tr><th id="stub_1_4" scope="row" class="gt_row gt_left gt_stub">458 Italia</th>
      <td headers="stub_1_4 year" class="gt_row gt_right">2014</td>
      <td headers="stub_1_4 bdy_style" class="gt_row gt_left">coupe</td>
      <td headers="stub_1_4 hp" class="gt_row gt_right">562</td>
      <td headers="stub_1_4 hp_rpm" class="gt_row gt_right">9000</td>
      <td headers="stub_1_4 trq" class="gt_row gt_right">398</td>
      <td headers="stub_1_4 trq_rpm" class="gt_row gt_right">6000</td>
      <td headers="stub_1_4 mpg_c" class="gt_row gt_right">13</td>
      <td headers="stub_1_4 mpg_h" class="gt_row gt_right">17</td>
      <td headers="stub_1_4 msrp" class="gt_row gt_right">233509</td></tr>
          <tr><th id="stub_1_5" scope="row" class="gt_row gt_left gt_stub">488 GTB</th>
      <td headers="stub_1_5 year" class="gt_row gt_right">2016</td>
      <td headers="stub_1_5 bdy_style" class="gt_row gt_left">coupe</td>
      <td headers="stub_1_5 hp" class="gt_row gt_right">661</td>
      <td headers="stub_1_5 hp_rpm" class="gt_row gt_right">8000</td>
      <td headers="stub_1_5 trq" class="gt_row gt_right">561</td>
      <td headers="stub_1_5 trq_rpm" class="gt_row gt_right">3000</td>
      <td headers="stub_1_5 mpg_c" class="gt_row gt_right">15</td>
      <td headers="stub_1_5 mpg_h" class="gt_row gt_right">22</td>
      <td headers="stub_1_5 msrp" class="gt_row gt_right">245400</td></tr>
          <tr><th id="stub_1_6" scope="row" class="gt_row gt_left gt_stub">California</th>
      <td headers="stub_1_6 year" class="gt_row gt_right">2015</td>
      <td headers="stub_1_6 bdy_style" class="gt_row gt_left">convertible</td>
      <td headers="stub_1_6 hp" class="gt_row gt_right">553</td>
      <td headers="stub_1_6 hp_rpm" class="gt_row gt_right">7500</td>
      <td headers="stub_1_6 trq" class="gt_row gt_right">557</td>
      <td headers="stub_1_6 trq_rpm" class="gt_row gt_right">4750</td>
      <td headers="stub_1_6 mpg_c" class="gt_row gt_right">16</td>
      <td headers="stub_1_6 mpg_h" class="gt_row gt_right">23</td>
      <td headers="stub_1_6 msrp" class="gt_row gt_right">198973</td></tr>
          <tr><th id="stub_1_7" scope="row" class="gt_row gt_left gt_stub">GTC4Lusso</th>
      <td headers="stub_1_7 year" class="gt_row gt_right">2017</td>
      <td headers="stub_1_7 bdy_style" class="gt_row gt_left">coupe</td>
      <td headers="stub_1_7 hp" class="gt_row gt_right">680</td>
      <td headers="stub_1_7 hp_rpm" class="gt_row gt_right">8250</td>
      <td headers="stub_1_7 trq" class="gt_row gt_right">514</td>
      <td headers="stub_1_7 trq_rpm" class="gt_row gt_right">5750</td>
      <td headers="stub_1_7 mpg_c" class="gt_row gt_right">12</td>
      <td headers="stub_1_7 mpg_h" class="gt_row gt_right">17</td>
      <td headers="stub_1_7 msrp" class="gt_row gt_right">298000</td></tr>
          <tr><th id="stub_1_8" scope="row" class="gt_row gt_left gt_stub">FF</th>
      <td headers="stub_1_8 year" class="gt_row gt_right">2015</td>
      <td headers="stub_1_8 bdy_style" class="gt_row gt_left">coupe</td>
      <td headers="stub_1_8 hp" class="gt_row gt_right">652</td>
      <td headers="stub_1_8 hp_rpm" class="gt_row gt_right">8000</td>
      <td headers="stub_1_8 trq" class="gt_row gt_right">504</td>
      <td headers="stub_1_8 trq_rpm" class="gt_row gt_right">6000</td>
      <td headers="stub_1_8 mpg_c" class="gt_row gt_right">11</td>
      <td headers="stub_1_8 mpg_h" class="gt_row gt_right">16</td>
      <td headers="stub_1_8 msrp" class="gt_row gt_right">295000</td></tr>
        </tbody>
        
      </table>

---

    Code
      cat(render_as_html(gt_tbl))
    Output
      <table class="gt_table" data-quarto-disable-processing="false" data-quarto-bootstrap="false">
        <thead>
          <tr class="gt_col_headings gt_spanner_row">
            <th class="gt_col_heading gt_columns_bottom_border gt_left" rowspan="2" colspan="1" scope="col" id="a::stub"></th>
            <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="2" colspan="1" scope="col" id="year">year</th>
            <th class="gt_col_heading gt_columns_bottom_border gt_left" rowspan="2" colspan="1" scope="col" id="bdy_style">bdy_style</th>
            <th class="gt_center gt_columns_top_border gt_column_spanner_outer" rowspan="1" colspan="6" scope="colgroup" id="Performance">
              <div class="gt_column_spanner">Performance</div>
            </th>
            <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="2" colspan="1" scope="col" id="msrp">msrp</th>
          </tr>
          <tr class="gt_col_headings">
            <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id="hp">hp</th>
            <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id="hp_rpm">hp_rpm</th>
            <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id="trq">trq</th>
            <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id="trq_rpm">trq_rpm</th>
            <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id="mpg_c">mpg_c</th>
            <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id="mpg_h">mpg_h</th>
          </tr>
        </thead>
        <tbody class="gt_table_body">
          <tr><th id="stub_1_1" scope="row" class="gt_row gt_left gt_stub">GT</th>
      <td headers="stub_1_1 year" class="gt_row gt_right">2017</td>
      <td headers="stub_1_1 bdy_style" class="gt_row gt_left">coupe</td>
      <td headers="stub_1_1 hp" class="gt_row gt_right">647</td>
      <td headers="stub_1_1 hp_rpm" class="gt_row gt_right">6250</td>
      <td headers="stub_1_1 trq" class="gt_row gt_right">550</td>
      <td headers="stub_1_1 trq_rpm" class="gt_row gt_right">5900</td>
      <td headers="stub_1_1 mpg_c" class="gt_row gt_right">11</td>
      <td headers="stub_1_1 mpg_h" class="gt_row gt_right">18</td>
      <td headers="stub_1_1 msrp" class="gt_row gt_right">447000</td></tr>
          <tr><th id="stub_1_2" scope="row" class="gt_row gt_left gt_stub">458 Speciale</th>
      <td headers="stub_1_2 year" class="gt_row gt_right">2015</td>
      <td headers="stub_1_2 bdy_style" class="gt_row gt_left">coupe</td>
      <td headers="stub_1_2 hp" class="gt_row gt_right">597</td>
      <td headers="stub_1_2 hp_rpm" class="gt_row gt_right">9000</td>
      <td headers="stub_1_2 trq" class="gt_row gt_right">398</td>
      <td headers="stub_1_2 trq_rpm" class="gt_row gt_right">6000</td>
      <td headers="stub_1_2 mpg_c" class="gt_row gt_right">13</td>
      <td headers="stub_1_2 mpg_h" class="gt_row gt_right">17</td>
      <td headers="stub_1_2 msrp" class="gt_row gt_right">291744</td></tr>
          <tr><th id="stub_1_3" scope="row" class="gt_row gt_left gt_stub">458 Spider</th>
      <td headers="stub_1_3 year" class="gt_row gt_right">2015</td>
      <td headers="stub_1_3 bdy_style" class="gt_row gt_left">convertible</td>
      <td headers="stub_1_3 hp" class="gt_row gt_right">562</td>
      <td headers="stub_1_3 hp_rpm" class="gt_row gt_right">9000</td>
      <td headers="stub_1_3 trq" class="gt_row gt_right">398</td>
      <td headers="stub_1_3 trq_rpm" class="gt_row gt_right">6000</td>
      <td headers="stub_1_3 mpg_c" class="gt_row gt_right">13</td>
      <td headers="stub_1_3 mpg_h" class="gt_row gt_right">17</td>
      <td headers="stub_1_3 msrp" class="gt_row gt_right">263553</td></tr>
          <tr><th id="stub_1_4" scope="row" class="gt_row gt_left gt_stub">458 Italia</th>
      <td headers="stub_1_4 year" class="gt_row gt_right">2014</td>
      <td headers="stub_1_4 bdy_style" class="gt_row gt_left">coupe</td>
      <td headers="stub_1_4 hp" class="gt_row gt_right">562</td>
      <td headers="stub_1_4 hp_rpm" class="gt_row gt_right">9000</td>
      <td headers="stub_1_4 trq" class="gt_row gt_right">398</td>
      <td headers="stub_1_4 trq_rpm" class="gt_row gt_right">6000</td>
      <td headers="stub_1_4 mpg_c" class="gt_row gt_right">13</td>
      <td headers="stub_1_4 mpg_h" class="gt_row gt_right">17</td>
      <td headers="stub_1_4 msrp" class="gt_row gt_right">233509</td></tr>
          <tr><th id="stub_1_5" scope="row" class="gt_row gt_left gt_stub">488 GTB</th>
      <td headers="stub_1_5 year" class="gt_row gt_right">2016</td>
      <td headers="stub_1_5 bdy_style" class="gt_row gt_left">coupe</td>
      <td headers="stub_1_5 hp" class="gt_row gt_right">661</td>
      <td headers="stub_1_5 hp_rpm" class="gt_row gt_right">8000</td>
      <td headers="stub_1_5 trq" class="gt_row gt_right">561</td>
      <td headers="stub_1_5 trq_rpm" class="gt_row gt_right">3000</td>
      <td headers="stub_1_5 mpg_c" class="gt_row gt_right">15</td>
      <td headers="stub_1_5 mpg_h" class="gt_row gt_right">22</td>
      <td headers="stub_1_5 msrp" class="gt_row gt_right">245400</td></tr>
          <tr><th id="stub_1_6" scope="row" class="gt_row gt_left gt_stub">California</th>
      <td headers="stub_1_6 year" class="gt_row gt_right">2015</td>
      <td headers="stub_1_6 bdy_style" class="gt_row gt_left">convertible</td>
      <td headers="stub_1_6 hp" class="gt_row gt_right">553</td>
      <td headers="stub_1_6 hp_rpm" class="gt_row gt_right">7500</td>
      <td headers="stub_1_6 trq" class="gt_row gt_right">557</td>
      <td headers="stub_1_6 trq_rpm" class="gt_row gt_right">4750</td>
      <td headers="stub_1_6 mpg_c" class="gt_row gt_right">16</td>
      <td headers="stub_1_6 mpg_h" class="gt_row gt_right">23</td>
      <td headers="stub_1_6 msrp" class="gt_row gt_right">198973</td></tr>
          <tr><th id="stub_1_7" scope="row" class="gt_row gt_left gt_stub">GTC4Lusso</th>
      <td headers="stub_1_7 year" class="gt_row gt_right">2017</td>
      <td headers="stub_1_7 bdy_style" class="gt_row gt_left">coupe</td>
      <td headers="stub_1_7 hp" class="gt_row gt_right">680</td>
      <td headers="stub_1_7 hp_rpm" class="gt_row gt_right">8250</td>
      <td headers="stub_1_7 trq" class="gt_row gt_right">514</td>
      <td headers="stub_1_7 trq_rpm" class="gt_row gt_right">5750</td>
      <td headers="stub_1_7 mpg_c" class="gt_row gt_right">12</td>
      <td headers="stub_1_7 mpg_h" class="gt_row gt_right">17</td>
      <td headers="stub_1_7 msrp" class="gt_row gt_right">298000</td></tr>
          <tr><th id="stub_1_8" scope="row" class="gt_row gt_left gt_stub">FF</th>
      <td headers="stub_1_8 year" class="gt_row gt_right">2015</td>
      <td headers="stub_1_8 bdy_style" class="gt_row gt_left">coupe</td>
      <td headers="stub_1_8 hp" class="gt_row gt_right">652</td>
      <td headers="stub_1_8 hp_rpm" class="gt_row gt_right">8000</td>
      <td headers="stub_1_8 trq" class="gt_row gt_right">504</td>
      <td headers="stub_1_8 trq_rpm" class="gt_row gt_right">6000</td>
      <td headers="stub_1_8 mpg_c" class="gt_row gt_right">11</td>
      <td headers="stub_1_8 mpg_h" class="gt_row gt_right">16</td>
      <td headers="stub_1_8 msrp" class="gt_row gt_right">295000</td></tr>
        </tbody>
        
      </table>

---

    Code
      cat(render_as_html(gt_tbl))
    Output
      <table class="gt_table" data-quarto-disable-processing="false" data-quarto-bootstrap="false">
        <thead>
          <tr class="gt_col_headings">
            <th class="gt_col_heading gt_columns_bottom_border gt_left" rowspan="1" colspan="1" scope="col" id="a::stub"></th>
            <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id="year">year</th>
            <th class="gt_col_heading gt_columns_bottom_border gt_left" rowspan="1" colspan="1" scope="col" id="bdy_style">bdy_style</th>
            <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id="hp">hp</th>
            <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id="hp_rpm">hp_rpm</th>
            <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id="trq">trq</th>
            <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id="trq_rpm">trq_rpm</th>
            <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id="mpg_c">mpg_c</th>
            <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id="mpg_h">mpg_h</th>
            <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id="msrp">msrp</th>
          </tr>
        </thead>
        <tbody class="gt_table_body">
          <tr><th id="stub_1_1" scope="row" class="gt_row gt_left gt_stub">GT</th>
      <td headers="stub_1_1 year" class="gt_row gt_right">2017</td>
      <td headers="stub_1_1 bdy_style" class="gt_row gt_left">coupe</td>
      <td headers="stub_1_1 hp" class="gt_row gt_right">647</td>
      <td headers="stub_1_1 hp_rpm" class="gt_row gt_right">6250</td>
      <td headers="stub_1_1 trq" class="gt_row gt_right">550</td>
      <td headers="stub_1_1 trq_rpm" class="gt_row gt_right">5900</td>
      <td headers="stub_1_1 mpg_c" class="gt_row gt_right">11</td>
      <td headers="stub_1_1 mpg_h" class="gt_row gt_right">18</td>
      <td headers="stub_1_1 msrp" class="gt_row gt_right">447000</td></tr>
          <tr><th id="stub_1_2" scope="row" class="gt_row gt_left gt_stub">458 Speciale</th>
      <td headers="stub_1_2 year" class="gt_row gt_right">2015</td>
      <td headers="stub_1_2 bdy_style" class="gt_row gt_left">coupe</td>
      <td headers="stub_1_2 hp" class="gt_row gt_right">597</td>
      <td headers="stub_1_2 hp_rpm" class="gt_row gt_right">9000</td>
      <td headers="stub_1_2 trq" class="gt_row gt_right">398</td>
      <td headers="stub_1_2 trq_rpm" class="gt_row gt_right">6000</td>
      <td headers="stub_1_2 mpg_c" class="gt_row gt_right">13</td>
      <td headers="stub_1_2 mpg_h" class="gt_row gt_right">17</td>
      <td headers="stub_1_2 msrp" class="gt_row gt_right">291744</td></tr>
          <tr><th id="stub_1_3" scope="row" class="gt_row gt_left gt_stub">458 Spider</th>
      <td headers="stub_1_3 year" class="gt_row gt_right">2015</td>
      <td headers="stub_1_3 bdy_style" class="gt_row gt_left">convertible</td>
      <td headers="stub_1_3 hp" class="gt_row gt_right">562</td>
      <td headers="stub_1_3 hp_rpm" class="gt_row gt_right">9000</td>
      <td headers="stub_1_3 trq" class="gt_row gt_right">398</td>
      <td headers="stub_1_3 trq_rpm" class="gt_row gt_right">6000</td>
      <td headers="stub_1_3 mpg_c" class="gt_row gt_right">13</td>
      <td headers="stub_1_3 mpg_h" class="gt_row gt_right">17</td>
      <td headers="stub_1_3 msrp" class="gt_row gt_right">263553</td></tr>
          <tr><th id="stub_1_4" scope="row" class="gt_row gt_left gt_stub">458 Italia</th>
      <td headers="stub_1_4 year" class="gt_row gt_right">2014</td>
      <td headers="stub_1_4 bdy_style" class="gt_row gt_left">coupe</td>
      <td headers="stub_1_4 hp" class="gt_row gt_right">562</td>
      <td headers="stub_1_4 hp_rpm" class="gt_row gt_right">9000</td>
      <td headers="stub_1_4 trq" class="gt_row gt_right">398</td>
      <td headers="stub_1_4 trq_rpm" class="gt_row gt_right">6000</td>
      <td headers="stub_1_4 mpg_c" class="gt_row gt_right">13</td>
      <td headers="stub_1_4 mpg_h" class="gt_row gt_right">17</td>
      <td headers="stub_1_4 msrp" class="gt_row gt_right">233509</td></tr>
          <tr><th id="stub_1_5" scope="row" class="gt_row gt_left gt_stub">488 GTB</th>
      <td headers="stub_1_5 year" class="gt_row gt_right">2016</td>
      <td headers="stub_1_5 bdy_style" class="gt_row gt_left">coupe</td>
      <td headers="stub_1_5 hp" class="gt_row gt_right">661</td>
      <td headers="stub_1_5 hp_rpm" class="gt_row gt_right">8000</td>
      <td headers="stub_1_5 trq" class="gt_row gt_right">561</td>
      <td headers="stub_1_5 trq_rpm" class="gt_row gt_right">3000</td>
      <td headers="stub_1_5 mpg_c" class="gt_row gt_right">15</td>
      <td headers="stub_1_5 mpg_h" class="gt_row gt_right">22</td>
      <td headers="stub_1_5 msrp" class="gt_row gt_right">245400</td></tr>
          <tr><th id="stub_1_6" scope="row" class="gt_row gt_left gt_stub">California</th>
      <td headers="stub_1_6 year" class="gt_row gt_right">2015</td>
      <td headers="stub_1_6 bdy_style" class="gt_row gt_left">convertible</td>
      <td headers="stub_1_6 hp" class="gt_row gt_right">553</td>
      <td headers="stub_1_6 hp_rpm" class="gt_row gt_right">7500</td>
      <td headers="stub_1_6 trq" class="gt_row gt_right">557</td>
      <td headers="stub_1_6 trq_rpm" class="gt_row gt_right">4750</td>
      <td headers="stub_1_6 mpg_c" class="gt_row gt_right">16</td>
      <td headers="stub_1_6 mpg_h" class="gt_row gt_right">23</td>
      <td headers="stub_1_6 msrp" class="gt_row gt_right">198973</td></tr>
          <tr><th id="stub_1_7" scope="row" class="gt_row gt_left gt_stub">GTC4Lusso</th>
      <td headers="stub_1_7 year" class="gt_row gt_right">2017</td>
      <td headers="stub_1_7 bdy_style" class="gt_row gt_left">coupe</td>
      <td headers="stub_1_7 hp" class="gt_row gt_right">680</td>
      <td headers="stub_1_7 hp_rpm" class="gt_row gt_right">8250</td>
      <td headers="stub_1_7 trq" class="gt_row gt_right">514</td>
      <td headers="stub_1_7 trq_rpm" class="gt_row gt_right">5750</td>
      <td headers="stub_1_7 mpg_c" class="gt_row gt_right">12</td>
      <td headers="stub_1_7 mpg_h" class="gt_row gt_right">17</td>
      <td headers="stub_1_7 msrp" class="gt_row gt_right">298000</td></tr>
          <tr><th id="stub_1_8" scope="row" class="gt_row gt_left gt_stub">FF</th>
      <td headers="stub_1_8 year" class="gt_row gt_right">2015</td>
      <td headers="stub_1_8 bdy_style" class="gt_row gt_left">coupe</td>
      <td headers="stub_1_8 hp" class="gt_row gt_right">652</td>
      <td headers="stub_1_8 hp_rpm" class="gt_row gt_right">8000</td>
      <td headers="stub_1_8 trq" class="gt_row gt_right">504</td>
      <td headers="stub_1_8 trq_rpm" class="gt_row gt_right">6000</td>
      <td headers="stub_1_8 mpg_c" class="gt_row gt_right">11</td>
      <td headers="stub_1_8 mpg_h" class="gt_row gt_right">16</td>
      <td headers="stub_1_8 msrp" class="gt_row gt_right">295000</td></tr>
        </tbody>
        
      </table>

---

    Code
      cat(render_as_html(gt_tbl))
    Output
      <table class="gt_table" data-quarto-disable-processing="false" data-quarto-bootstrap="false">
        <thead>
          <tr class="gt_col_headings gt_spanner_row">
            <th class="gt_col_heading gt_columns_bottom_border gt_left" rowspan="2" colspan="1" scope="col" id="a::stub"></th>
            <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="2" colspan="1" scope="col" id="year">year</th>
            <th class="gt_col_heading gt_columns_bottom_border gt_left" rowspan="2" colspan="1" scope="col" id="bdy_style">bdy_style</th>
            <th class="gt_center gt_columns_top_border gt_column_spanner_outer" rowspan="1" colspan="6" scope="colgroup" id="Performance">
              <div class="gt_column_spanner">Performance</div>
            </th>
            <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="2" colspan="1" scope="col" id="msrp">msrp</th>
          </tr>
          <tr class="gt_col_headings">
            <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id="hp">hp</th>
            <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id="hp_rpm">hp_rpm</th>
            <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id="trq">trq</th>
            <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id="trq_rpm">trq_rpm</th>
            <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id="mpg_c">mpg_c</th>
            <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id="mpg_h">mpg_h</th>
          </tr>
        </thead>
        <tbody class="gt_table_body">
          <tr><th id="stub_1_1" scope="row" class="gt_row gt_left gt_stub">GT</th>
      <td headers="stub_1_1 year" class="gt_row gt_right">2017</td>
      <td headers="stub_1_1 bdy_style" class="gt_row gt_left">coupe</td>
      <td headers="stub_1_1 hp" class="gt_row gt_right">647</td>
      <td headers="stub_1_1 hp_rpm" class="gt_row gt_right">6250</td>
      <td headers="stub_1_1 trq" class="gt_row gt_right">550</td>
      <td headers="stub_1_1 trq_rpm" class="gt_row gt_right">5900</td>
      <td headers="stub_1_1 mpg_c" class="gt_row gt_right">11</td>
      <td headers="stub_1_1 mpg_h" class="gt_row gt_right">18</td>
      <td headers="stub_1_1 msrp" class="gt_row gt_right">447000</td></tr>
          <tr><th id="stub_1_2" scope="row" class="gt_row gt_left gt_stub">458 Speciale</th>
      <td headers="stub_1_2 year" class="gt_row gt_right">2015</td>
      <td headers="stub_1_2 bdy_style" class="gt_row gt_left">coupe</td>
      <td headers="stub_1_2 hp" class="gt_row gt_right">597</td>
      <td headers="stub_1_2 hp_rpm" class="gt_row gt_right">9000</td>
      <td headers="stub_1_2 trq" class="gt_row gt_right">398</td>
      <td headers="stub_1_2 trq_rpm" class="gt_row gt_right">6000</td>
      <td headers="stub_1_2 mpg_c" class="gt_row gt_right">13</td>
      <td headers="stub_1_2 mpg_h" class="gt_row gt_right">17</td>
      <td headers="stub_1_2 msrp" class="gt_row gt_right">291744</td></tr>
          <tr><th id="stub_1_3" scope="row" class="gt_row gt_left gt_stub">458 Spider</th>
      <td headers="stub_1_3 year" class="gt_row gt_right">2015</td>
      <td headers="stub_1_3 bdy_style" class="gt_row gt_left">convertible</td>
      <td headers="stub_1_3 hp" class="gt_row gt_right">562</td>
      <td headers="stub_1_3 hp_rpm" class="gt_row gt_right">9000</td>
      <td headers="stub_1_3 trq" class="gt_row gt_right">398</td>
      <td headers="stub_1_3 trq_rpm" class="gt_row gt_right">6000</td>
      <td headers="stub_1_3 mpg_c" class="gt_row gt_right">13</td>
      <td headers="stub_1_3 mpg_h" class="gt_row gt_right">17</td>
      <td headers="stub_1_3 msrp" class="gt_row gt_right">263553</td></tr>
          <tr><th id="stub_1_4" scope="row" class="gt_row gt_left gt_stub">458 Italia</th>
      <td headers="stub_1_4 year" class="gt_row gt_right">2014</td>
      <td headers="stub_1_4 bdy_style" class="gt_row gt_left">coupe</td>
      <td headers="stub_1_4 hp" class="gt_row gt_right">562</td>
      <td headers="stub_1_4 hp_rpm" class="gt_row gt_right">9000</td>
      <td headers="stub_1_4 trq" class="gt_row gt_right">398</td>
      <td headers="stub_1_4 trq_rpm" class="gt_row gt_right">6000</td>
      <td headers="stub_1_4 mpg_c" class="gt_row gt_right">13</td>
      <td headers="stub_1_4 mpg_h" class="gt_row gt_right">17</td>
      <td headers="stub_1_4 msrp" class="gt_row gt_right">233509</td></tr>
          <tr><th id="stub_1_5" scope="row" class="gt_row gt_left gt_stub">488 GTB</th>
      <td headers="stub_1_5 year" class="gt_row gt_right">2016</td>
      <td headers="stub_1_5 bdy_style" class="gt_row gt_left">coupe</td>
      <td headers="stub_1_5 hp" class="gt_row gt_right">661</td>
      <td headers="stub_1_5 hp_rpm" class="gt_row gt_right">8000</td>
      <td headers="stub_1_5 trq" class="gt_row gt_right">561</td>
      <td headers="stub_1_5 trq_rpm" class="gt_row gt_right">3000</td>
      <td headers="stub_1_5 mpg_c" class="gt_row gt_right">15</td>
      <td headers="stub_1_5 mpg_h" class="gt_row gt_right">22</td>
      <td headers="stub_1_5 msrp" class="gt_row gt_right">245400</td></tr>
          <tr><th id="stub_1_6" scope="row" class="gt_row gt_left gt_stub">California</th>
      <td headers="stub_1_6 year" class="gt_row gt_right">2015</td>
      <td headers="stub_1_6 bdy_style" class="gt_row gt_left">convertible</td>
      <td headers="stub_1_6 hp" class="gt_row gt_right">553</td>
      <td headers="stub_1_6 hp_rpm" class="gt_row gt_right">7500</td>
      <td headers="stub_1_6 trq" class="gt_row gt_right">557</td>
      <td headers="stub_1_6 trq_rpm" class="gt_row gt_right">4750</td>
      <td headers="stub_1_6 mpg_c" class="gt_row gt_right">16</td>
      <td headers="stub_1_6 mpg_h" class="gt_row gt_right">23</td>
      <td headers="stub_1_6 msrp" class="gt_row gt_right">198973</td></tr>
          <tr><th id="stub_1_7" scope="row" class="gt_row gt_left gt_stub">GTC4Lusso</th>
      <td headers="stub_1_7 year" class="gt_row gt_right">2017</td>
      <td headers="stub_1_7 bdy_style" class="gt_row gt_left">coupe</td>
      <td headers="stub_1_7 hp" class="gt_row gt_right">680</td>
      <td headers="stub_1_7 hp_rpm" class="gt_row gt_right">8250</td>
      <td headers="stub_1_7 trq" class="gt_row gt_right">514</td>
      <td headers="stub_1_7 trq_rpm" class="gt_row gt_right">5750</td>
      <td headers="stub_1_7 mpg_c" class="gt_row gt_right">12</td>
      <td headers="stub_1_7 mpg_h" class="gt_row gt_right">17</td>
      <td headers="stub_1_7 msrp" class="gt_row gt_right">298000</td></tr>
          <tr><th id="stub_1_8" scope="row" class="gt_row gt_left gt_stub">FF</th>
      <td headers="stub_1_8 year" class="gt_row gt_right">2015</td>
      <td headers="stub_1_8 bdy_style" class="gt_row gt_left">coupe</td>
      <td headers="stub_1_8 hp" class="gt_row gt_right">652</td>
      <td headers="stub_1_8 hp_rpm" class="gt_row gt_right">8000</td>
      <td headers="stub_1_8 trq" class="gt_row gt_right">504</td>
      <td headers="stub_1_8 trq_rpm" class="gt_row gt_right">6000</td>
      <td headers="stub_1_8 mpg_c" class="gt_row gt_right">11</td>
      <td headers="stub_1_8 mpg_h" class="gt_row gt_right">16</td>
      <td headers="stub_1_8 msrp" class="gt_row gt_right">295000</td></tr>
        </tbody>
        
      </table>

---

    Code
      cat(render_as_html(gt_tbl))
    Output
      <table class="gt_table" data-quarto-disable-processing="false" data-quarto-bootstrap="false">
        <thead>
          <tr class="gt_col_headings gt_spanner_row">
            <th class="gt_col_heading gt_columns_bottom_border gt_left" rowspan="2" colspan="1" scope="col" id="a::stub"></th>
            <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="2" colspan="1" scope="col" id="year">year</th>
            <th class="gt_col_heading gt_columns_bottom_border gt_left" rowspan="2" colspan="1" scope="col" id="bdy_style">bdy_style</th>
            <th class="gt_center gt_columns_top_border gt_column_spanner_outer" rowspan="1" colspan="2" scope="colgroup" id="HP">
              <div class="gt_column_spanner">HP</div>
            </th>
            <th class="gt_center gt_columns_top_border gt_column_spanner_outer" rowspan="1" colspan="2" scope="colgroup" id="Torque">
              <div class="gt_column_spanner">Torque</div>
            </th>
            <th class="gt_center gt_columns_top_border gt_column_spanner_outer" rowspan="1" colspan="2" scope="colgroup" id="MPG">
              <div class="gt_column_spanner">MPG</div>
            </th>
            <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="2" colspan="1" scope="col" id="msrp">msrp</th>
          </tr>
          <tr class="gt_col_headings">
            <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id="hp">hp</th>
            <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id="hp_rpm">hp_rpm</th>
            <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id="trq">trq</th>
            <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id="trq_rpm">trq_rpm</th>
            <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id="mpg_c">mpg_c</th>
            <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id="mpg_h">mpg_h</th>
          </tr>
        </thead>
        <tbody class="gt_table_body">
          <tr><th id="stub_1_1" scope="row" class="gt_row gt_left gt_stub">GT</th>
      <td headers="stub_1_1 year" class="gt_row gt_right">2017</td>
      <td headers="stub_1_1 bdy_style" class="gt_row gt_left">coupe</td>
      <td headers="stub_1_1 hp" class="gt_row gt_right">647</td>
      <td headers="stub_1_1 hp_rpm" class="gt_row gt_right">6250</td>
      <td headers="stub_1_1 trq" class="gt_row gt_right">550</td>
      <td headers="stub_1_1 trq_rpm" class="gt_row gt_right">5900</td>
      <td headers="stub_1_1 mpg_c" class="gt_row gt_right">11</td>
      <td headers="stub_1_1 mpg_h" class="gt_row gt_right">18</td>
      <td headers="stub_1_1 msrp" class="gt_row gt_right">447000</td></tr>
          <tr><th id="stub_1_2" scope="row" class="gt_row gt_left gt_stub">458 Speciale</th>
      <td headers="stub_1_2 year" class="gt_row gt_right">2015</td>
      <td headers="stub_1_2 bdy_style" class="gt_row gt_left">coupe</td>
      <td headers="stub_1_2 hp" class="gt_row gt_right">597</td>
      <td headers="stub_1_2 hp_rpm" class="gt_row gt_right">9000</td>
      <td headers="stub_1_2 trq" class="gt_row gt_right">398</td>
      <td headers="stub_1_2 trq_rpm" class="gt_row gt_right">6000</td>
      <td headers="stub_1_2 mpg_c" class="gt_row gt_right">13</td>
      <td headers="stub_1_2 mpg_h" class="gt_row gt_right">17</td>
      <td headers="stub_1_2 msrp" class="gt_row gt_right">291744</td></tr>
          <tr><th id="stub_1_3" scope="row" class="gt_row gt_left gt_stub">458 Spider</th>
      <td headers="stub_1_3 year" class="gt_row gt_right">2015</td>
      <td headers="stub_1_3 bdy_style" class="gt_row gt_left">convertible</td>
      <td headers="stub_1_3 hp" class="gt_row gt_right">562</td>
      <td headers="stub_1_3 hp_rpm" class="gt_row gt_right">9000</td>
      <td headers="stub_1_3 trq" class="gt_row gt_right">398</td>
      <td headers="stub_1_3 trq_rpm" class="gt_row gt_right">6000</td>
      <td headers="stub_1_3 mpg_c" class="gt_row gt_right">13</td>
      <td headers="stub_1_3 mpg_h" class="gt_row gt_right">17</td>
      <td headers="stub_1_3 msrp" class="gt_row gt_right">263553</td></tr>
          <tr><th id="stub_1_4" scope="row" class="gt_row gt_left gt_stub">458 Italia</th>
      <td headers="stub_1_4 year" class="gt_row gt_right">2014</td>
      <td headers="stub_1_4 bdy_style" class="gt_row gt_left">coupe</td>
      <td headers="stub_1_4 hp" class="gt_row gt_right">562</td>
      <td headers="stub_1_4 hp_rpm" class="gt_row gt_right">9000</td>
      <td headers="stub_1_4 trq" class="gt_row gt_right">398</td>
      <td headers="stub_1_4 trq_rpm" class="gt_row gt_right">6000</td>
      <td headers="stub_1_4 mpg_c" class="gt_row gt_right">13</td>
      <td headers="stub_1_4 mpg_h" class="gt_row gt_right">17</td>
      <td headers="stub_1_4 msrp" class="gt_row gt_right">233509</td></tr>
          <tr><th id="stub_1_5" scope="row" class="gt_row gt_left gt_stub">488 GTB</th>
      <td headers="stub_1_5 year" class="gt_row gt_right">2016</td>
      <td headers="stub_1_5 bdy_style" class="gt_row gt_left">coupe</td>
      <td headers="stub_1_5 hp" class="gt_row gt_right">661</td>
      <td headers="stub_1_5 hp_rpm" class="gt_row gt_right">8000</td>
      <td headers="stub_1_5 trq" class="gt_row gt_right">561</td>
      <td headers="stub_1_5 trq_rpm" class="gt_row gt_right">3000</td>
      <td headers="stub_1_5 mpg_c" class="gt_row gt_right">15</td>
      <td headers="stub_1_5 mpg_h" class="gt_row gt_right">22</td>
      <td headers="stub_1_5 msrp" class="gt_row gt_right">245400</td></tr>
          <tr><th id="stub_1_6" scope="row" class="gt_row gt_left gt_stub">California</th>
      <td headers="stub_1_6 year" class="gt_row gt_right">2015</td>
      <td headers="stub_1_6 bdy_style" class="gt_row gt_left">convertible</td>
      <td headers="stub_1_6 hp" class="gt_row gt_right">553</td>
      <td headers="stub_1_6 hp_rpm" class="gt_row gt_right">7500</td>
      <td headers="stub_1_6 trq" class="gt_row gt_right">557</td>
      <td headers="stub_1_6 trq_rpm" class="gt_row gt_right">4750</td>
      <td headers="stub_1_6 mpg_c" class="gt_row gt_right">16</td>
      <td headers="stub_1_6 mpg_h" class="gt_row gt_right">23</td>
      <td headers="stub_1_6 msrp" class="gt_row gt_right">198973</td></tr>
          <tr><th id="stub_1_7" scope="row" class="gt_row gt_left gt_stub">GTC4Lusso</th>
      <td headers="stub_1_7 year" class="gt_row gt_right">2017</td>
      <td headers="stub_1_7 bdy_style" class="gt_row gt_left">coupe</td>
      <td headers="stub_1_7 hp" class="gt_row gt_right">680</td>
      <td headers="stub_1_7 hp_rpm" class="gt_row gt_right">8250</td>
      <td headers="stub_1_7 trq" class="gt_row gt_right">514</td>
      <td headers="stub_1_7 trq_rpm" class="gt_row gt_right">5750</td>
      <td headers="stub_1_7 mpg_c" class="gt_row gt_right">12</td>
      <td headers="stub_1_7 mpg_h" class="gt_row gt_right">17</td>
      <td headers="stub_1_7 msrp" class="gt_row gt_right">298000</td></tr>
          <tr><th id="stub_1_8" scope="row" class="gt_row gt_left gt_stub">FF</th>
      <td headers="stub_1_8 year" class="gt_row gt_right">2015</td>
      <td headers="stub_1_8 bdy_style" class="gt_row gt_left">coupe</td>
      <td headers="stub_1_8 hp" class="gt_row gt_right">652</td>
      <td headers="stub_1_8 hp_rpm" class="gt_row gt_right">8000</td>
      <td headers="stub_1_8 trq" class="gt_row gt_right">504</td>
      <td headers="stub_1_8 trq_rpm" class="gt_row gt_right">6000</td>
      <td headers="stub_1_8 mpg_c" class="gt_row gt_right">11</td>
      <td headers="stub_1_8 mpg_h" class="gt_row gt_right">16</td>
      <td headers="stub_1_8 msrp" class="gt_row gt_right">295000</td></tr>
        </tbody>
        
      </table>

---

    Code
      cat(render_as_html(gt_tbl))
    Output
      <table class="gt_table" data-quarto-disable-processing="false" data-quarto-bootstrap="false">
        <thead>
          <tr class="gt_col_headings">
            <th class="gt_col_heading gt_columns_bottom_border gt_left" rowspan="1" colspan="1" scope="col" id="a::stub"></th>
            <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id="year">year</th>
            <th class="gt_col_heading gt_columns_bottom_border gt_left" rowspan="1" colspan="1" scope="col" id="bdy_style">bdy_style</th>
            <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id="hp">hp</th>
            <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id="hp_rpm">hp_rpm</th>
            <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id="trq">trq</th>
            <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id="trq_rpm">trq_rpm</th>
            <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id="mpg_c">mpg_c</th>
            <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id="mpg_h">mpg_h</th>
            <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id="msrp">msrp</th>
          </tr>
        </thead>
        <tbody class="gt_table_body">
          <tr><th id="stub_1_1" scope="row" class="gt_row gt_left gt_stub">GT</th>
      <td headers="stub_1_1 year" class="gt_row gt_right">2017</td>
      <td headers="stub_1_1 bdy_style" class="gt_row gt_left">coupe</td>
      <td headers="stub_1_1 hp" class="gt_row gt_right">647</td>
      <td headers="stub_1_1 hp_rpm" class="gt_row gt_right">6250</td>
      <td headers="stub_1_1 trq" class="gt_row gt_right">550</td>
      <td headers="stub_1_1 trq_rpm" class="gt_row gt_right">5900</td>
      <td headers="stub_1_1 mpg_c" class="gt_row gt_right">11</td>
      <td headers="stub_1_1 mpg_h" class="gt_row gt_right">18</td>
      <td headers="stub_1_1 msrp" class="gt_row gt_right">447000</td></tr>
          <tr><th id="stub_1_2" scope="row" class="gt_row gt_left gt_stub">458 Speciale</th>
      <td headers="stub_1_2 year" class="gt_row gt_right">2015</td>
      <td headers="stub_1_2 bdy_style" class="gt_row gt_left">coupe</td>
      <td headers="stub_1_2 hp" class="gt_row gt_right">597</td>
      <td headers="stub_1_2 hp_rpm" class="gt_row gt_right">9000</td>
      <td headers="stub_1_2 trq" class="gt_row gt_right">398</td>
      <td headers="stub_1_2 trq_rpm" class="gt_row gt_right">6000</td>
      <td headers="stub_1_2 mpg_c" class="gt_row gt_right">13</td>
      <td headers="stub_1_2 mpg_h" class="gt_row gt_right">17</td>
      <td headers="stub_1_2 msrp" class="gt_row gt_right">291744</td></tr>
          <tr><th id="stub_1_3" scope="row" class="gt_row gt_left gt_stub">458 Spider</th>
      <td headers="stub_1_3 year" class="gt_row gt_right">2015</td>
      <td headers="stub_1_3 bdy_style" class="gt_row gt_left">convertible</td>
      <td headers="stub_1_3 hp" class="gt_row gt_right">562</td>
      <td headers="stub_1_3 hp_rpm" class="gt_row gt_right">9000</td>
      <td headers="stub_1_3 trq" class="gt_row gt_right">398</td>
      <td headers="stub_1_3 trq_rpm" class="gt_row gt_right">6000</td>
      <td headers="stub_1_3 mpg_c" class="gt_row gt_right">13</td>
      <td headers="stub_1_3 mpg_h" class="gt_row gt_right">17</td>
      <td headers="stub_1_3 msrp" class="gt_row gt_right">263553</td></tr>
          <tr><th id="stub_1_4" scope="row" class="gt_row gt_left gt_stub">458 Italia</th>
      <td headers="stub_1_4 year" class="gt_row gt_right">2014</td>
      <td headers="stub_1_4 bdy_style" class="gt_row gt_left">coupe</td>
      <td headers="stub_1_4 hp" class="gt_row gt_right">562</td>
      <td headers="stub_1_4 hp_rpm" class="gt_row gt_right">9000</td>
      <td headers="stub_1_4 trq" class="gt_row gt_right">398</td>
      <td headers="stub_1_4 trq_rpm" class="gt_row gt_right">6000</td>
      <td headers="stub_1_4 mpg_c" class="gt_row gt_right">13</td>
      <td headers="stub_1_4 mpg_h" class="gt_row gt_right">17</td>
      <td headers="stub_1_4 msrp" class="gt_row gt_right">233509</td></tr>
          <tr><th id="stub_1_5" scope="row" class="gt_row gt_left gt_stub">488 GTB</th>
      <td headers="stub_1_5 year" class="gt_row gt_right">2016</td>
      <td headers="stub_1_5 bdy_style" class="gt_row gt_left">coupe</td>
      <td headers="stub_1_5 hp" class="gt_row gt_right">661</td>
      <td headers="stub_1_5 hp_rpm" class="gt_row gt_right">8000</td>
      <td headers="stub_1_5 trq" class="gt_row gt_right">561</td>
      <td headers="stub_1_5 trq_rpm" class="gt_row gt_right">3000</td>
      <td headers="stub_1_5 mpg_c" class="gt_row gt_right">15</td>
      <td headers="stub_1_5 mpg_h" class="gt_row gt_right">22</td>
      <td headers="stub_1_5 msrp" class="gt_row gt_right">245400</td></tr>
          <tr><th id="stub_1_6" scope="row" class="gt_row gt_left gt_stub">California</th>
      <td headers="stub_1_6 year" class="gt_row gt_right">2015</td>
      <td headers="stub_1_6 bdy_style" class="gt_row gt_left">convertible</td>
      <td headers="stub_1_6 hp" class="gt_row gt_right">553</td>
      <td headers="stub_1_6 hp_rpm" class="gt_row gt_right">7500</td>
      <td headers="stub_1_6 trq" class="gt_row gt_right">557</td>
      <td headers="stub_1_6 trq_rpm" class="gt_row gt_right">4750</td>
      <td headers="stub_1_6 mpg_c" class="gt_row gt_right">16</td>
      <td headers="stub_1_6 mpg_h" class="gt_row gt_right">23</td>
      <td headers="stub_1_6 msrp" class="gt_row gt_right">198973</td></tr>
          <tr><th id="stub_1_7" scope="row" class="gt_row gt_left gt_stub">GTC4Lusso</th>
      <td headers="stub_1_7 year" class="gt_row gt_right">2017</td>
      <td headers="stub_1_7 bdy_style" class="gt_row gt_left">coupe</td>
      <td headers="stub_1_7 hp" class="gt_row gt_right">680</td>
      <td headers="stub_1_7 hp_rpm" class="gt_row gt_right">8250</td>
      <td headers="stub_1_7 trq" class="gt_row gt_right">514</td>
      <td headers="stub_1_7 trq_rpm" class="gt_row gt_right">5750</td>
      <td headers="stub_1_7 mpg_c" class="gt_row gt_right">12</td>
      <td headers="stub_1_7 mpg_h" class="gt_row gt_right">17</td>
      <td headers="stub_1_7 msrp" class="gt_row gt_right">298000</td></tr>
          <tr><th id="stub_1_8" scope="row" class="gt_row gt_left gt_stub">FF</th>
      <td headers="stub_1_8 year" class="gt_row gt_right">2015</td>
      <td headers="stub_1_8 bdy_style" class="gt_row gt_left">coupe</td>
      <td headers="stub_1_8 hp" class="gt_row gt_right">652</td>
      <td headers="stub_1_8 hp_rpm" class="gt_row gt_right">8000</td>
      <td headers="stub_1_8 trq" class="gt_row gt_right">504</td>
      <td headers="stub_1_8 trq_rpm" class="gt_row gt_right">6000</td>
      <td headers="stub_1_8 mpg_c" class="gt_row gt_right">11</td>
      <td headers="stub_1_8 mpg_h" class="gt_row gt_right">16</td>
      <td headers="stub_1_8 msrp" class="gt_row gt_right">295000</td></tr>
        </tbody>
        
      </table>

---

    Code
      t_sp <- tab_spanner(gt(exibble), "span1", columns = c(char, fctr))
      rm_spanners(t_sp, "span2")
    Condition
      Error in `rm_spanners()`:
      ! Spanner "span2" does not exist in the data.
    Code
      rm_spanners(t_sp, c("span1", "span2", "span3"))
    Condition
      Error in `rm_spanners()`:
      ! Spanners "span2" and "span3" do not exist in the data.

# Table footnotes can be removed using `rm_footnotes()`

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
          <tr><td headers="num" class="gt_row gt_right"><span class="gt_footnote_marks" style="white-space:nowrap;font-style:italic;font-weight:normal;line-height:0;"><sup>1</sup></span> 1.111e-01</td>
      <td headers="char" class="gt_row gt_left">apricot</td>
      <td headers="fctr" class="gt_row gt_center">one</td>
      <td headers="date" class="gt_row gt_right">2015-01-15</td>
      <td headers="time" class="gt_row gt_right">13:35</td>
      <td headers="datetime" class="gt_row gt_right">2018-01-01 02:22</td>
      <td headers="currency" class="gt_row gt_right">49.950</td>
      <td headers="row" class="gt_row gt_left">row_1</td>
      <td headers="group" class="gt_row gt_left">grp_a</td></tr>
          <tr><td headers="num" class="gt_row gt_right"><span class="gt_footnote_marks" style="white-space:nowrap;font-style:italic;font-weight:normal;line-height:0;"><sup>2</sup></span> 2.222e+00</td>
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
          <tr class="gt_footnotes">
            <td class="gt_footnote" colspan="9"><span class="gt_footnote_marks" style="white-space:nowrap;font-style:italic;font-weight:normal;line-height:0;"><sup>1</sup></span> Footnote 1</td>
          </tr>
          <tr class="gt_footnotes">
            <td class="gt_footnote" colspan="9"><span class="gt_footnote_marks" style="white-space:nowrap;font-style:italic;font-weight:normal;line-height:0;"><sup>2</sup></span> Footnote 2</td>
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
        
      </table>

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
          <tr><td headers="num" class="gt_row gt_right">1.111e-01</td>
      <td headers="char" class="gt_row gt_left">apricot</td>
      <td headers="fctr" class="gt_row gt_center">one</td>
      <td headers="date" class="gt_row gt_right">2015-01-15</td>
      <td headers="time" class="gt_row gt_right">13:35</td>
      <td headers="datetime" class="gt_row gt_right">2018-01-01 02:22</td>
      <td headers="currency" class="gt_row gt_right">49.950</td>
      <td headers="row" class="gt_row gt_left">row_1</td>
      <td headers="group" class="gt_row gt_left">grp_a</td></tr>
          <tr><td headers="num" class="gt_row gt_right"><span class="gt_footnote_marks" style="white-space:nowrap;font-style:italic;font-weight:normal;line-height:0;"><sup>1</sup></span> 2.222e+00</td>
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
          <tr class="gt_footnotes">
            <td class="gt_footnote" colspan="9"><span class="gt_footnote_marks" style="white-space:nowrap;font-style:italic;font-weight:normal;line-height:0;"><sup>1</sup></span> Footnote 2</td>
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
          <tr><td headers="num" class="gt_row gt_right"><span class="gt_footnote_marks" style="white-space:nowrap;font-style:italic;font-weight:normal;line-height:0;"><sup>1</sup></span> 1.111e-01</td>
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
          <tr class="gt_footnotes">
            <td class="gt_footnote" colspan="9"><span class="gt_footnote_marks" style="white-space:nowrap;font-style:italic;font-weight:normal;line-height:0;"><sup>1</sup></span> Footnote 1</td>
          </tr>
        </tfoot>
      </table>

---

    Code
      t_ft <- tab_footnote(tab_footnote(gt(exibble), footnote = "Footnote 1",
      locations = cells_body(1, 1)), footnote = "Footnote 2", locations = cells_body(
        1, 2))
      rm_footnotes(t_ft, footnotes = 0:1)
    Condition
      Error in `rm_footnotes()`:
      ! Footnote 0 does not exist in the data.
    Code
      rm_footnotes(t_ft, footnotes = 2:3)
    Condition
      Error in `rm_footnotes()`:
      ! Footnote 3 does not exist in the data.
    Code
      rm_footnotes(t_ft, footnotes = 3)
    Condition
      Error in `rm_footnotes()`:
      ! Footnote 3 does not exist in the data.

# Table source notes can be removed using `rm_source_notes()`

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
            <td class="gt_sourcenote" colspan="9">Source Note 1</td>
          </tr>
          <tr class="gt_sourcenotes">
            <td class="gt_sourcenote" colspan="9">Source Note 2</td>
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
        
      </table>

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
            <td class="gt_sourcenote" colspan="9">Source Note 2</td>
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
            <td class="gt_sourcenote" colspan="9">Source Note 1</td>
          </tr>
        </tfoot>
      </table>

---

    Code
      t_sn <- tab_source_note(tab_source_note(gt(exibble), source_note = "Source Note 1"),
      source_note = "Source Note 2")
      rm_source_notes(t_sn, source_notes = 0:1)
    Condition
      Error in `rm_source_notes()`:
      ! Source note 0 does not exist in the data.
    Code
      rm_source_notes(t_sn, 2:3)
    Condition
      Error in `rm_source_notes()`:
      ! Source note 3 does not exist in the data.
    Code
      rm_source_notes(t_sn, 3)
    Condition
      Error in `rm_source_notes()`:
      ! Source note 3 does not exist in the data.

