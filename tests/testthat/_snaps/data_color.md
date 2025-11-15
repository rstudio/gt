# Color palettes can be obtained from the paletteer package

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
          <tr><td headers="num" class="gt_row gt_right" style="background-color: #FFEBEE; color: #000000;">1.111e-01</td>
      <td headers="char" class="gt_row gt_left" style="background-color: #FFEBEE; color: #000000;">apricot</td>
      <td headers="fctr" class="gt_row gt_center" style="background-color: #FFEBEE; color: #000000;">one</td>
      <td headers="date" class="gt_row gt_right" style="background-color: #FFEBEE; color: #000000;">2015-01-15</td>
      <td headers="time" class="gt_row gt_right" style="background-color: #FFEBEE; color: #000000;">13:35</td>
      <td headers="datetime" class="gt_row gt_right" style="background-color: #FFEBEE; color: #000000;">2018-01-01 02:22</td>
      <td headers="currency" class="gt_row gt_right" style="background-color: #FFEBEE; color: #000000;">49.950</td>
      <td headers="row" class="gt_row gt_left" style="background-color: #FFEBEE; color: #000000;">row_1</td>
      <td headers="group" class="gt_row gt_left" style="background-color: #FFEBEE; color: #000000;">grp_a</td></tr>
          <tr><td headers="num" class="gt_row gt_right" style="background-color: #FFEBEE; color: #000000;">2.222e+00</td>
      <td headers="char" class="gt_row gt_left" style="background-color: #FFCDD2; color: #000000;">banana</td>
      <td headers="fctr" class="gt_row gt_center" style="background-color: #FFD1D6; color: #000000;">two</td>
      <td headers="date" class="gt_row gt_right" style="background-color: #FFCDD2; color: #000000;">2015-02-15</td>
      <td headers="time" class="gt_row gt_right" style="background-color: #FFCDD2; color: #000000;">14:40</td>
      <td headers="datetime" class="gt_row gt_right" style="background-color: #FFCDD2; color: #000000;">2018-02-02 14:33</td>
      <td headers="currency" class="gt_row gt_right" style="background-color: #FFEBEE; color: #000000;">17.950</td>
      <td headers="row" class="gt_row gt_left" style="background-color: #FFD1D6; color: #000000;">row_2</td>
      <td headers="group" class="gt_row gt_left" style="background-color: #FFEBEE; color: #000000;">grp_a</td></tr>
          <tr><td headers="num" class="gt_row gt_right" style="background-color: #FFEBEE; color: #000000;">3.333e+01</td>
      <td headers="char" class="gt_row gt_left" style="background-color: #EF9A9A; color: #000000;">coconut</td>
      <td headers="fctr" class="gt_row gt_center" style="background-color: #F4A9AA; color: #000000;">three</td>
      <td headers="date" class="gt_row gt_right" style="background-color: #EF9A9A; color: #000000;">2015-03-15</td>
      <td headers="time" class="gt_row gt_right" style="background-color: #EF9A9A; color: #000000;">15:45</td>
      <td headers="datetime" class="gt_row gt_right" style="background-color: #EF9A9A; color: #000000;">2018-03-03 03:44</td>
      <td headers="currency" class="gt_row gt_right" style="background-color: #FFEBEE; color: #000000;">1.390</td>
      <td headers="row" class="gt_row gt_left" style="background-color: #F4A9AA; color: #000000;">row_3</td>
      <td headers="group" class="gt_row gt_left" style="background-color: #FFEBEE; color: #000000;">grp_a</td></tr>
          <tr><td headers="num" class="gt_row gt_right" style="background-color: #FFEBEE; color: #000000;">4.444e+02</td>
      <td headers="char" class="gt_row gt_left" style="background-color: #E57373; color: #FFFFFF;">durian</td>
      <td headers="fctr" class="gt_row gt_center" style="background-color: #EA8483; color: #FFFFFF;">four</td>
      <td headers="date" class="gt_row gt_right" style="background-color: #E57373; color: #FFFFFF;">2015-04-15</td>
      <td headers="time" class="gt_row gt_right" style="background-color: #E57373; color: #FFFFFF;">16:50</td>
      <td headers="datetime" class="gt_row gt_right" style="background-color: #E57373; color: #FFFFFF;">2018-04-04 15:55</td>
      <td headers="currency" class="gt_row gt_right" style="background-color: #E53935; color: #FFFFFF;">65100.000</td>
      <td headers="row" class="gt_row gt_left" style="background-color: #EA8483; color: #FFFFFF;">row_4</td>
      <td headers="group" class="gt_row gt_left" style="background-color: #FFEBEE; color: #000000;">grp_a</td></tr>
          <tr><td headers="num" class="gt_row gt_right" style="background-color: #FFEBEE; color: #000000;">5.550e+03</td>
      <td headers="char" class="gt_row gt_left" style="background-color: #808080; color: #FFFFFF;">NA</td>
      <td headers="fctr" class="gt_row gt_center" style="background-color: #EA6664; color: #FFFFFF;">five</td>
      <td headers="date" class="gt_row gt_right" style="background-color: #EF5350; color: #FFFFFF;">2015-05-15</td>
      <td headers="time" class="gt_row gt_right" style="background-color: #EF5350; color: #FFFFFF;">17:55</td>
      <td headers="datetime" class="gt_row gt_right" style="background-color: #EF5350; color: #FFFFFF;">2018-05-05 04:00</td>
      <td headers="currency" class="gt_row gt_right" style="background-color: #FFE7EB; color: #000000;">1325.810</td>
      <td headers="row" class="gt_row gt_left" style="background-color: #EA6664; color: #FFFFFF;">row_5</td>
      <td headers="group" class="gt_row gt_left" style="background-color: #FFCDD2; color: #000000;">grp_b</td></tr>
          <tr><td headers="num" class="gt_row gt_right" style="background-color: #808080; color: #FFFFFF;">NA</td>
      <td headers="char" class="gt_row gt_left" style="background-color: #EF5350; color: #FFFFFF;">fig</td>
      <td headers="fctr" class="gt_row gt_center" style="background-color: #F14F49; color: #FFFFFF;">six</td>
      <td headers="date" class="gt_row gt_right" style="background-color: #F44336; color: #FFFFFF;">2015-06-15</td>
      <td headers="time" class="gt_row gt_right" style="background-color: #808080; color: #FFFFFF;">NA</td>
      <td headers="datetime" class="gt_row gt_right" style="background-color: #F44336; color: #FFFFFF;">2018-06-06 16:11</td>
      <td headers="currency" class="gt_row gt_right" style="background-color: #FFEBEE; color: #000000;">13.255</td>
      <td headers="row" class="gt_row gt_left" style="background-color: #F14F49; color: #FFFFFF;">row_6</td>
      <td headers="group" class="gt_row gt_left" style="background-color: #FFCDD2; color: #000000;">grp_b</td></tr>
          <tr><td headers="num" class="gt_row gt_right" style="background-color: #FFD3D8; color: #000000;">7.770e+05</td>
      <td headers="char" class="gt_row gt_left" style="background-color: #F44336; color: #FFFFFF;">grapefruit</td>
      <td headers="fctr" class="gt_row gt_center" style="background-color: #F24236; color: #FFFFFF;">seven</td>
      <td headers="date" class="gt_row gt_right" style="background-color: #808080; color: #FFFFFF;">NA</td>
      <td headers="time" class="gt_row gt_right" style="background-color: #F44336; color: #FFFFFF;">19:10</td>
      <td headers="datetime" class="gt_row gt_right" style="background-color: #E53935; color: #FFFFFF;">2018-07-07 05:22</td>
      <td headers="currency" class="gt_row gt_right" style="background-color: #808080; color: #FFFFFF;">NA</td>
      <td headers="row" class="gt_row gt_left" style="background-color: #F24236; color: #FFFFFF;">row_7</td>
      <td headers="group" class="gt_row gt_left" style="background-color: #FFCDD2; color: #000000;">grp_b</td></tr>
          <tr><td headers="num" class="gt_row gt_right" style="background-color: #B71C1C; color: #FFFFFF;">8.880e+06</td>
      <td headers="char" class="gt_row gt_left" style="background-color: #E53935; color: #FFFFFF;">honeydew</td>
      <td headers="fctr" class="gt_row gt_center" style="background-color: #E53935; color: #FFFFFF;">eight</td>
      <td headers="date" class="gt_row gt_right" style="background-color: #E53935; color: #FFFFFF;">2015-08-15</td>
      <td headers="time" class="gt_row gt_right" style="background-color: #E53935; color: #FFFFFF;">20:20</td>
      <td headers="datetime" class="gt_row gt_right" style="background-color: #808080; color: #FFFFFF;">NA</td>
      <td headers="currency" class="gt_row gt_right" style="background-color: #FFEBEE; color: #000000;">0.440</td>
      <td headers="row" class="gt_row gt_left" style="background-color: #E53935; color: #FFFFFF;">row_8</td>
      <td headers="group" class="gt_row gt_left" style="background-color: #FFCDD2; color: #000000;">grp_b</td></tr>
        </tbody>
        
      </table>

# Some color palettes from the viridis package can be used

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
          <tr><td headers="num" class="gt_row gt_right" style="background-color: #440154; color: #FFFFFF;">1.111e-01</td>
      <td headers="char" class="gt_row gt_left" style="background-color: #440154; color: #FFFFFF;">apricot</td>
      <td headers="fctr" class="gt_row gt_center" style="background-color: #440154; color: #FFFFFF;">one</td>
      <td headers="date" class="gt_row gt_right" style="background-color: #440154; color: #FFFFFF;">2015-01-15</td>
      <td headers="time" class="gt_row gt_right" style="background-color: #440154; color: #FFFFFF;">13:35</td>
      <td headers="datetime" class="gt_row gt_right" style="background-color: #440154; color: #FFFFFF;">2018-01-01 02:22</td>
      <td headers="currency" class="gt_row gt_right" style="background-color: #440154; color: #FFFFFF;">49.950</td>
      <td headers="row" class="gt_row gt_left" style="background-color: #440154; color: #FFFFFF;">row_1</td>
      <td headers="group" class="gt_row gt_left" style="background-color: #440154; color: #FFFFFF;">grp_a</td></tr>
          <tr><td headers="num" class="gt_row gt_right" style="background-color: #440154; color: #FFFFFF;">2.222e+00</td>
      <td headers="char" class="gt_row gt_left" style="background-color: #443A83; color: #FFFFFF;">banana</td>
      <td headers="fctr" class="gt_row gt_center" style="background-color: #46327E; color: #FFFFFF;">two</td>
      <td headers="date" class="gt_row gt_right" style="background-color: #443A83; color: #FFFFFF;">2015-02-15</td>
      <td headers="time" class="gt_row gt_right" style="background-color: #443A83; color: #FFFFFF;">14:40</td>
      <td headers="datetime" class="gt_row gt_right" style="background-color: #443A83; color: #FFFFFF;">2018-02-02 14:33</td>
      <td headers="currency" class="gt_row gt_right" style="background-color: #440154; color: #FFFFFF;">17.950</td>
      <td headers="row" class="gt_row gt_left" style="background-color: #46327E; color: #FFFFFF;">row_2</td>
      <td headers="group" class="gt_row gt_left" style="background-color: #440154; color: #FFFFFF;">grp_a</td></tr>
          <tr><td headers="num" class="gt_row gt_right" style="background-color: #440154; color: #FFFFFF;">3.333e+01</td>
      <td headers="char" class="gt_row gt_left" style="background-color: #31688E; color: #FFFFFF;">coconut</td>
      <td headers="fctr" class="gt_row gt_center" style="background-color: #365C8D; color: #FFFFFF;">three</td>
      <td headers="date" class="gt_row gt_right" style="background-color: #31688E; color: #FFFFFF;">2015-03-15</td>
      <td headers="time" class="gt_row gt_right" style="background-color: #31688E; color: #FFFFFF;">15:45</td>
      <td headers="datetime" class="gt_row gt_right" style="background-color: #31688E; color: #FFFFFF;">2018-03-03 03:44</td>
      <td headers="currency" class="gt_row gt_right" style="background-color: #440154; color: #FFFFFF;">1.390</td>
      <td headers="row" class="gt_row gt_left" style="background-color: #365C8D; color: #FFFFFF;">row_3</td>
      <td headers="group" class="gt_row gt_left" style="background-color: #440154; color: #FFFFFF;">grp_a</td></tr>
          <tr><td headers="num" class="gt_row gt_right" style="background-color: #440154; color: #FFFFFF;">4.444e+02</td>
      <td headers="char" class="gt_row gt_left" style="background-color: #21908D; color: #FFFFFF;">durian</td>
      <td headers="fctr" class="gt_row gt_center" style="background-color: #277F8E; color: #FFFFFF;">four</td>
      <td headers="date" class="gt_row gt_right" style="background-color: #21908D; color: #FFFFFF;">2015-04-15</td>
      <td headers="time" class="gt_row gt_right" style="background-color: #21908D; color: #FFFFFF;">16:50</td>
      <td headers="datetime" class="gt_row gt_right" style="background-color: #21908D; color: #FFFFFF;">2018-04-04 15:55</td>
      <td headers="currency" class="gt_row gt_right" style="background-color: #FDE725; color: #000000;">65100.000</td>
      <td headers="row" class="gt_row gt_left" style="background-color: #277F8E; color: #FFFFFF;">row_4</td>
      <td headers="group" class="gt_row gt_left" style="background-color: #440154; color: #FFFFFF;">grp_a</td></tr>
          <tr><td headers="num" class="gt_row gt_right" style="background-color: #440154; color: #FFFFFF;">5.550e+03</td>
      <td headers="char" class="gt_row gt_left" style="background-color: #808080; color: #FFFFFF;">NA</td>
      <td headers="fctr" class="gt_row gt_center" style="background-color: #1FA187; color: #FFFFFF;">five</td>
      <td headers="date" class="gt_row gt_right" style="background-color: #35B779; color: #FFFFFF;">2015-05-15</td>
      <td headers="time" class="gt_row gt_right" style="background-color: #35B779; color: #FFFFFF;">17:55</td>
      <td headers="datetime" class="gt_row gt_right" style="background-color: #35B779; color: #FFFFFF;">2018-05-05 04:00</td>
      <td headers="currency" class="gt_row gt_right" style="background-color: #46085C; color: #FFFFFF;">1325.810</td>
      <td headers="row" class="gt_row gt_left" style="background-color: #1FA187; color: #FFFFFF;">row_5</td>
      <td headers="group" class="gt_row gt_left" style="background-color: #FDE725; color: #000000;">grp_b</td></tr>
          <tr><td headers="num" class="gt_row gt_right" style="background-color: #808080; color: #FFFFFF;">NA</td>
      <td headers="char" class="gt_row gt_left" style="background-color: #35B779; color: #FFFFFF;">fig</td>
      <td headers="fctr" class="gt_row gt_center" style="background-color: #4AC16D; color: #000000;">six</td>
      <td headers="date" class="gt_row gt_right" style="background-color: #8FD644; color: #000000;">2015-06-15</td>
      <td headers="time" class="gt_row gt_right" style="background-color: #808080; color: #FFFFFF;">NA</td>
      <td headers="datetime" class="gt_row gt_right" style="background-color: #8FD644; color: #000000;">2018-06-06 16:11</td>
      <td headers="currency" class="gt_row gt_right" style="background-color: #440154; color: #FFFFFF;">13.255</td>
      <td headers="row" class="gt_row gt_left" style="background-color: #4AC16D; color: #000000;">row_6</td>
      <td headers="group" class="gt_row gt_left" style="background-color: #FDE725; color: #000000;">grp_b</td></tr>
          <tr><td headers="num" class="gt_row gt_right" style="background-color: #482072; color: #FFFFFF;">7.770e+05</td>
      <td headers="char" class="gt_row gt_left" style="background-color: #8FD644; color: #000000;">grapefruit</td>
      <td headers="fctr" class="gt_row gt_center" style="background-color: #9FDA3A; color: #000000;">seven</td>
      <td headers="date" class="gt_row gt_right" style="background-color: #808080; color: #FFFFFF;">NA</td>
      <td headers="time" class="gt_row gt_right" style="background-color: #8FD644; color: #000000;">19:10</td>
      <td headers="datetime" class="gt_row gt_right" style="background-color: #FDE725; color: #000000;">2018-07-07 05:22</td>
      <td headers="currency" class="gt_row gt_right" style="background-color: #808080; color: #FFFFFF;">NA</td>
      <td headers="row" class="gt_row gt_left" style="background-color: #9FDA3A; color: #000000;">row_7</td>
      <td headers="group" class="gt_row gt_left" style="background-color: #FDE725; color: #000000;">grp_b</td></tr>
          <tr><td headers="num" class="gt_row gt_right" style="background-color: #FDE725; color: #000000;">8.880e+06</td>
      <td headers="char" class="gt_row gt_left" style="background-color: #FDE725; color: #000000;">honeydew</td>
      <td headers="fctr" class="gt_row gt_center" style="background-color: #FDE725; color: #000000;">eight</td>
      <td headers="date" class="gt_row gt_right" style="background-color: #FDE725; color: #000000;">2015-08-15</td>
      <td headers="time" class="gt_row gt_right" style="background-color: #FDE725; color: #000000;">20:20</td>
      <td headers="datetime" class="gt_row gt_right" style="background-color: #808080; color: #FFFFFF;">NA</td>
      <td headers="currency" class="gt_row gt_right" style="background-color: #440154; color: #FFFFFF;">0.440</td>
      <td headers="row" class="gt_row gt_left" style="background-color: #FDE725; color: #000000;">row_8</td>
      <td headers="group" class="gt_row gt_left" style="background-color: #FDE725; color: #000000;">grp_b</td></tr>
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
          <tr><td headers="num" class="gt_row gt_right" style="background-color: #000004; color: #FFFFFF;">1.111e-01</td>
      <td headers="char" class="gt_row gt_left" style="background-color: #000004; color: #FFFFFF;">apricot</td>
      <td headers="fctr" class="gt_row gt_center" style="background-color: #000004; color: #FFFFFF;">one</td>
      <td headers="date" class="gt_row gt_right" style="background-color: #000004; color: #FFFFFF;">2015-01-15</td>
      <td headers="time" class="gt_row gt_right" style="background-color: #000004; color: #FFFFFF;">13:35</td>
      <td headers="datetime" class="gt_row gt_right" style="background-color: #000004; color: #FFFFFF;">2018-01-01 02:22</td>
      <td headers="currency" class="gt_row gt_right" style="background-color: #000004; color: #FFFFFF;">49.950</td>
      <td headers="row" class="gt_row gt_left" style="background-color: #000004; color: #FFFFFF;">row_1</td>
      <td headers="group" class="gt_row gt_left" style="background-color: #000004; color: #FFFFFF;">grp_a</td></tr>
          <tr><td headers="num" class="gt_row gt_right" style="background-color: #000004; color: #FFFFFF;">2.222e+00</td>
      <td headers="char" class="gt_row gt_left" style="background-color: #2C1160; color: #FFFFFF;">banana</td>
      <td headers="fctr" class="gt_row gt_center" style="background-color: #231151; color: #FFFFFF;">two</td>
      <td headers="date" class="gt_row gt_right" style="background-color: #2C1160; color: #FFFFFF;">2015-02-15</td>
      <td headers="time" class="gt_row gt_right" style="background-color: #2C1160; color: #FFFFFF;">14:40</td>
      <td headers="datetime" class="gt_row gt_right" style="background-color: #2C1160; color: #FFFFFF;">2018-02-02 14:33</td>
      <td headers="currency" class="gt_row gt_right" style="background-color: #000004; color: #FFFFFF;">17.950</td>
      <td headers="row" class="gt_row gt_left" style="background-color: #231151; color: #FFFFFF;">row_2</td>
      <td headers="group" class="gt_row gt_left" style="background-color: #000004; color: #FFFFFF;">grp_a</td></tr>
          <tr><td headers="num" class="gt_row gt_right" style="background-color: #000004; color: #FFFFFF;">3.333e+01</td>
      <td headers="char" class="gt_row gt_left" style="background-color: #721F81; color: #FFFFFF;">coconut</td>
      <td headers="fctr" class="gt_row gt_center" style="background-color: #5F187F; color: #FFFFFF;">three</td>
      <td headers="date" class="gt_row gt_right" style="background-color: #721F81; color: #FFFFFF;">2015-03-15</td>
      <td headers="time" class="gt_row gt_right" style="background-color: #721F81; color: #FFFFFF;">15:45</td>
      <td headers="datetime" class="gt_row gt_right" style="background-color: #721F81; color: #FFFFFF;">2018-03-03 03:44</td>
      <td headers="currency" class="gt_row gt_right" style="background-color: #000004; color: #FFFFFF;">1.390</td>
      <td headers="row" class="gt_row gt_left" style="background-color: #5F187F; color: #FFFFFF;">row_3</td>
      <td headers="group" class="gt_row gt_left" style="background-color: #000004; color: #FFFFFF;">grp_a</td></tr>
          <tr><td headers="num" class="gt_row gt_right" style="background-color: #000004; color: #FFFFFF;">4.444e+02</td>
      <td headers="char" class="gt_row gt_left" style="background-color: #B6367A; color: #FFFFFF;">durian</td>
      <td headers="fctr" class="gt_row gt_center" style="background-color: #982D80; color: #FFFFFF;">four</td>
      <td headers="date" class="gt_row gt_right" style="background-color: #B6367A; color: #FFFFFF;">2015-04-15</td>
      <td headers="time" class="gt_row gt_right" style="background-color: #B6367A; color: #FFFFFF;">16:50</td>
      <td headers="datetime" class="gt_row gt_right" style="background-color: #B6367A; color: #FFFFFF;">2018-04-04 15:55</td>
      <td headers="currency" class="gt_row gt_right" style="background-color: #FCFDBF; color: #000000;">65100.000</td>
      <td headers="row" class="gt_row gt_left" style="background-color: #982D80; color: #FFFFFF;">row_4</td>
      <td headers="group" class="gt_row gt_left" style="background-color: #000004; color: #FFFFFF;">grp_a</td></tr>
          <tr><td headers="num" class="gt_row gt_right" style="background-color: #000004; color: #FFFFFF;">5.550e+03</td>
      <td headers="char" class="gt_row gt_left" style="background-color: #808080; color: #FFFFFF;">NA</td>
      <td headers="fctr" class="gt_row gt_center" style="background-color: #D3436E; color: #FFFFFF;">five</td>
      <td headers="date" class="gt_row gt_right" style="background-color: #F1605D; color: #FFFFFF;">2015-05-15</td>
      <td headers="time" class="gt_row gt_right" style="background-color: #F1605D; color: #FFFFFF;">17:55</td>
      <td headers="datetime" class="gt_row gt_right" style="background-color: #F1605D; color: #FFFFFF;">2018-05-05 04:00</td>
      <td headers="currency" class="gt_row gt_right" style="background-color: #02020B; color: #FFFFFF;">1325.810</td>
      <td headers="row" class="gt_row gt_left" style="background-color: #D3436E; color: #FFFFFF;">row_5</td>
      <td headers="group" class="gt_row gt_left" style="background-color: #FCFDBF; color: #000000;">grp_b</td></tr>
          <tr><td headers="num" class="gt_row gt_right" style="background-color: #808080; color: #FFFFFF;">NA</td>
      <td headers="char" class="gt_row gt_left" style="background-color: #F1605D; color: #FFFFFF;">fig</td>
      <td headers="fctr" class="gt_row gt_center" style="background-color: #F8765C; color: #FFFFFF;">six</td>
      <td headers="date" class="gt_row gt_right" style="background-color: #FEAF77; color: #000000;">2015-06-15</td>
      <td headers="time" class="gt_row gt_right" style="background-color: #808080; color: #FFFFFF;">NA</td>
      <td headers="datetime" class="gt_row gt_right" style="background-color: #FEAF77; color: #000000;">2018-06-06 16:11</td>
      <td headers="currency" class="gt_row gt_right" style="background-color: #000004; color: #FFFFFF;">13.255</td>
      <td headers="row" class="gt_row gt_left" style="background-color: #F8765C; color: #FFFFFF;">row_6</td>
      <td headers="group" class="gt_row gt_left" style="background-color: #FCFDBF; color: #000000;">grp_b</td></tr>
          <tr><td headers="num" class="gt_row gt_right" style="background-color: #110C30; color: #FFFFFF;">7.770e+05</td>
      <td headers="char" class="gt_row gt_left" style="background-color: #FEAF77; color: #000000;">grapefruit</td>
      <td headers="fctr" class="gt_row gt_center" style="background-color: #FEBA80; color: #000000;">seven</td>
      <td headers="date" class="gt_row gt_right" style="background-color: #808080; color: #FFFFFF;">NA</td>
      <td headers="time" class="gt_row gt_right" style="background-color: #FEAF77; color: #000000;">19:10</td>
      <td headers="datetime" class="gt_row gt_right" style="background-color: #FCFDBF; color: #000000;">2018-07-07 05:22</td>
      <td headers="currency" class="gt_row gt_right" style="background-color: #808080; color: #FFFFFF;">NA</td>
      <td headers="row" class="gt_row gt_left" style="background-color: #FEBA80; color: #000000;">row_7</td>
      <td headers="group" class="gt_row gt_left" style="background-color: #FCFDBF; color: #000000;">grp_b</td></tr>
          <tr><td headers="num" class="gt_row gt_right" style="background-color: #FCFDBF; color: #000000;">8.880e+06</td>
      <td headers="char" class="gt_row gt_left" style="background-color: #FCFDBF; color: #000000;">honeydew</td>
      <td headers="fctr" class="gt_row gt_center" style="background-color: #FCFDBF; color: #000000;">eight</td>
      <td headers="date" class="gt_row gt_right" style="background-color: #FCFDBF; color: #000000;">2015-08-15</td>
      <td headers="time" class="gt_row gt_right" style="background-color: #FCFDBF; color: #000000;">20:20</td>
      <td headers="datetime" class="gt_row gt_right" style="background-color: #808080; color: #FFFFFF;">NA</td>
      <td headers="currency" class="gt_row gt_right" style="background-color: #000004; color: #FFFFFF;">0.440</td>
      <td headers="row" class="gt_row gt_left" style="background-color: #FCFDBF; color: #000000;">row_8</td>
      <td headers="group" class="gt_row gt_left" style="background-color: #FCFDBF; color: #000000;">grp_b</td></tr>
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
          <tr><td headers="num" class="gt_row gt_right" style="background-color: #0D0887; color: #FFFFFF;">1.111e-01</td>
      <td headers="char" class="gt_row gt_left" style="background-color: #0D0887; color: #FFFFFF;">apricot</td>
      <td headers="fctr" class="gt_row gt_center" style="background-color: #0D0887; color: #FFFFFF;">one</td>
      <td headers="date" class="gt_row gt_right" style="background-color: #0D0887; color: #FFFFFF;">2015-01-15</td>
      <td headers="time" class="gt_row gt_right" style="background-color: #0D0887; color: #FFFFFF;">13:35</td>
      <td headers="datetime" class="gt_row gt_right" style="background-color: #0D0887; color: #FFFFFF;">2018-01-01 02:22</td>
      <td headers="currency" class="gt_row gt_right" style="background-color: #0E0887; color: #FFFFFF;">49.950</td>
      <td headers="row" class="gt_row gt_left" style="background-color: #0D0887; color: #FFFFFF;">row_1</td>
      <td headers="group" class="gt_row gt_left" style="background-color: #0D0887; color: #FFFFFF;">grp_a</td></tr>
          <tr><td headers="num" class="gt_row gt_right" style="background-color: #0D0887; color: #FFFFFF;">2.222e+00</td>
      <td headers="char" class="gt_row gt_left" style="background-color: #5D01A6; color: #FFFFFF;">banana</td>
      <td headers="fctr" class="gt_row gt_center" style="background-color: #5402A3; color: #FFFFFF;">two</td>
      <td headers="date" class="gt_row gt_right" style="background-color: #5D01A6; color: #FFFFFF;">2015-02-15</td>
      <td headers="time" class="gt_row gt_right" style="background-color: #5D01A6; color: #FFFFFF;">14:40</td>
      <td headers="datetime" class="gt_row gt_right" style="background-color: #5D01A6; color: #FFFFFF;">2018-02-02 14:33</td>
      <td headers="currency" class="gt_row gt_right" style="background-color: #0D0887; color: #FFFFFF;">17.950</td>
      <td headers="row" class="gt_row gt_left" style="background-color: #5402A3; color: #FFFFFF;">row_2</td>
      <td headers="group" class="gt_row gt_left" style="background-color: #0D0887; color: #FFFFFF;">grp_a</td></tr>
          <tr><td headers="num" class="gt_row gt_right" style="background-color: #0D0887; color: #FFFFFF;">3.333e+01</td>
      <td headers="char" class="gt_row gt_left" style="background-color: #9C179E; color: #FFFFFF;">coconut</td>
      <td headers="fctr" class="gt_row gt_center" style="background-color: #8B0AA5; color: #FFFFFF;">three</td>
      <td headers="date" class="gt_row gt_right" style="background-color: #9C179E; color: #FFFFFF;">2015-03-15</td>
      <td headers="time" class="gt_row gt_right" style="background-color: #9C179E; color: #FFFFFF;">15:45</td>
      <td headers="datetime" class="gt_row gt_right" style="background-color: #9C179E; color: #FFFFFF;">2018-03-03 03:44</td>
      <td headers="currency" class="gt_row gt_right" style="background-color: #0D0887; color: #FFFFFF;">1.390</td>
      <td headers="row" class="gt_row gt_left" style="background-color: #8B0AA5; color: #FFFFFF;">row_3</td>
      <td headers="group" class="gt_row gt_left" style="background-color: #0D0887; color: #FFFFFF;">grp_a</td></tr>
          <tr><td headers="num" class="gt_row gt_right" style="background-color: #0D0887; color: #FFFFFF;">4.444e+02</td>
      <td headers="char" class="gt_row gt_left" style="background-color: #CC4779; color: #FFFFFF;">durian</td>
      <td headers="fctr" class="gt_row gt_center" style="background-color: #B93289; color: #FFFFFF;">four</td>
      <td headers="date" class="gt_row gt_right" style="background-color: #CC4779; color: #FFFFFF;">2015-04-15</td>
      <td headers="time" class="gt_row gt_right" style="background-color: #CC4779; color: #FFFFFF;">16:50</td>
      <td headers="datetime" class="gt_row gt_right" style="background-color: #CC4779; color: #FFFFFF;">2018-04-04 15:55</td>
      <td headers="currency" class="gt_row gt_right" style="background-color: #F0F921; color: #000000;">65100.000</td>
      <td headers="row" class="gt_row gt_left" style="background-color: #B93289; color: #FFFFFF;">row_4</td>
      <td headers="group" class="gt_row gt_left" style="background-color: #0D0887; color: #FFFFFF;">grp_a</td></tr>
          <tr><td headers="num" class="gt_row gt_right" style="background-color: #0E0887; color: #FFFFFF;">5.550e+03</td>
      <td headers="char" class="gt_row gt_left" style="background-color: #808080; color: #FFFFFF;">NA</td>
      <td headers="fctr" class="gt_row gt_center" style="background-color: #DB5C68; color: #FFFFFF;">five</td>
      <td headers="date" class="gt_row gt_right" style="background-color: #ED7953; color: #FFFFFF;">2015-05-15</td>
      <td headers="time" class="gt_row gt_right" style="background-color: #ED7953; color: #FFFFFF;">17:55</td>
      <td headers="datetime" class="gt_row gt_right" style="background-color: #ED7953; color: #FFFFFF;">2018-05-05 04:00</td>
      <td headers="currency" class="gt_row gt_right" style="background-color: #1B068D; color: #FFFFFF;">1325.810</td>
      <td headers="row" class="gt_row gt_left" style="background-color: #DB5C68; color: #FFFFFF;">row_5</td>
      <td headers="group" class="gt_row gt_left" style="background-color: #F0F921; color: #000000;">grp_b</td></tr>
          <tr><td headers="num" class="gt_row gt_right" style="background-color: #808080; color: #FFFFFF;">NA</td>
      <td headers="char" class="gt_row gt_left" style="background-color: #ED7953; color: #FFFFFF;">fig</td>
      <td headers="fctr" class="gt_row gt_center" style="background-color: #F48849; color: #000000;">six</td>
      <td headers="date" class="gt_row gt_right" style="background-color: #FDB32F; color: #000000;">2015-06-15</td>
      <td headers="time" class="gt_row gt_right" style="background-color: #808080; color: #FFFFFF;">NA</td>
      <td headers="datetime" class="gt_row gt_right" style="background-color: #FDB32F; color: #000000;">2018-06-06 16:11</td>
      <td headers="currency" class="gt_row gt_right" style="background-color: #0D0887; color: #FFFFFF;">13.255</td>
      <td headers="row" class="gt_row gt_left" style="background-color: #F48849; color: #000000;">row_6</td>
      <td headers="group" class="gt_row gt_left" style="background-color: #F0F921; color: #000000;">grp_b</td></tr>
          <tr><td headers="num" class="gt_row gt_right" style="background-color: #3D049B; color: #FFFFFF;">7.770e+05</td>
      <td headers="char" class="gt_row gt_left" style="background-color: #FDB32F; color: #000000;">grapefruit</td>
      <td headers="fctr" class="gt_row gt_center" style="background-color: #FEBC2A; color: #000000;">seven</td>
      <td headers="date" class="gt_row gt_right" style="background-color: #808080; color: #FFFFFF;">NA</td>
      <td headers="time" class="gt_row gt_right" style="background-color: #FDB32F; color: #000000;">19:10</td>
      <td headers="datetime" class="gt_row gt_right" style="background-color: #F0F921; color: #000000;">2018-07-07 05:22</td>
      <td headers="currency" class="gt_row gt_right" style="background-color: #808080; color: #FFFFFF;">NA</td>
      <td headers="row" class="gt_row gt_left" style="background-color: #FEBC2A; color: #000000;">row_7</td>
      <td headers="group" class="gt_row gt_left" style="background-color: #F0F921; color: #000000;">grp_b</td></tr>
          <tr><td headers="num" class="gt_row gt_right" style="background-color: #F0F921; color: #000000;">8.880e+06</td>
      <td headers="char" class="gt_row gt_left" style="background-color: #F0F921; color: #000000;">honeydew</td>
      <td headers="fctr" class="gt_row gt_center" style="background-color: #F0F921; color: #000000;">eight</td>
      <td headers="date" class="gt_row gt_right" style="background-color: #F0F921; color: #000000;">2015-08-15</td>
      <td headers="time" class="gt_row gt_right" style="background-color: #F0F921; color: #000000;">20:20</td>
      <td headers="datetime" class="gt_row gt_right" style="background-color: #808080; color: #FFFFFF;">NA</td>
      <td headers="currency" class="gt_row gt_right" style="background-color: #0D0887; color: #FFFFFF;">0.440</td>
      <td headers="row" class="gt_row gt_left" style="background-color: #F0F921; color: #000000;">row_8</td>
      <td headers="group" class="gt_row gt_left" style="background-color: #F0F921; color: #000000;">grp_b</td></tr>
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
          <tr><td headers="num" class="gt_row gt_right" style="background-color: #000004; color: #FFFFFF;">1.111e-01</td>
      <td headers="char" class="gt_row gt_left" style="background-color: #000004; color: #FFFFFF;">apricot</td>
      <td headers="fctr" class="gt_row gt_center" style="background-color: #000004; color: #FFFFFF;">one</td>
      <td headers="date" class="gt_row gt_right" style="background-color: #000004; color: #FFFFFF;">2015-01-15</td>
      <td headers="time" class="gt_row gt_right" style="background-color: #000004; color: #FFFFFF;">13:35</td>
      <td headers="datetime" class="gt_row gt_right" style="background-color: #000004; color: #FFFFFF;">2018-01-01 02:22</td>
      <td headers="currency" class="gt_row gt_right" style="background-color: #000004; color: #FFFFFF;">49.950</td>
      <td headers="row" class="gt_row gt_left" style="background-color: #000004; color: #FFFFFF;">row_1</td>
      <td headers="group" class="gt_row gt_left" style="background-color: #000004; color: #FFFFFF;">grp_a</td></tr>
          <tr><td headers="num" class="gt_row gt_right" style="background-color: #000004; color: #FFFFFF;">2.222e+00</td>
      <td headers="char" class="gt_row gt_left" style="background-color: #330A5E; color: #FFFFFF;">banana</td>
      <td headers="fctr" class="gt_row gt_center" style="background-color: #280B54; color: #FFFFFF;">two</td>
      <td headers="date" class="gt_row gt_right" style="background-color: #330A5E; color: #FFFFFF;">2015-02-15</td>
      <td headers="time" class="gt_row gt_right" style="background-color: #330A5E; color: #FFFFFF;">14:40</td>
      <td headers="datetime" class="gt_row gt_right" style="background-color: #330A5E; color: #FFFFFF;">2018-02-02 14:33</td>
      <td headers="currency" class="gt_row gt_right" style="background-color: #000004; color: #FFFFFF;">17.950</td>
      <td headers="row" class="gt_row gt_left" style="background-color: #280B54; color: #FFFFFF;">row_2</td>
      <td headers="group" class="gt_row gt_left" style="background-color: #000004; color: #FFFFFF;">grp_a</td></tr>
          <tr><td headers="num" class="gt_row gt_right" style="background-color: #000004; color: #FFFFFF;">3.333e+01</td>
      <td headers="char" class="gt_row gt_left" style="background-color: #781C6D; color: #FFFFFF;">coconut</td>
      <td headers="fctr" class="gt_row gt_center" style="background-color: #65156E; color: #FFFFFF;">three</td>
      <td headers="date" class="gt_row gt_right" style="background-color: #781C6D; color: #FFFFFF;">2015-03-15</td>
      <td headers="time" class="gt_row gt_right" style="background-color: #781C6D; color: #FFFFFF;">15:45</td>
      <td headers="datetime" class="gt_row gt_right" style="background-color: #781C6D; color: #FFFFFF;">2018-03-03 03:44</td>
      <td headers="currency" class="gt_row gt_right" style="background-color: #000004; color: #FFFFFF;">1.390</td>
      <td headers="row" class="gt_row gt_left" style="background-color: #65156E; color: #FFFFFF;">row_3</td>
      <td headers="group" class="gt_row gt_left" style="background-color: #000004; color: #FFFFFF;">grp_a</td></tr>
          <tr><td headers="num" class="gt_row gt_right" style="background-color: #000004; color: #FFFFFF;">4.444e+02</td>
      <td headers="char" class="gt_row gt_left" style="background-color: #BB3655; color: #FFFFFF;">durian</td>
      <td headers="fctr" class="gt_row gt_center" style="background-color: #9F2A63; color: #FFFFFF;">four</td>
      <td headers="date" class="gt_row gt_right" style="background-color: #BB3655; color: #FFFFFF;">2015-04-15</td>
      <td headers="time" class="gt_row gt_right" style="background-color: #BB3655; color: #FFFFFF;">16:50</td>
      <td headers="datetime" class="gt_row gt_right" style="background-color: #BB3655; color: #FFFFFF;">2018-04-04 15:55</td>
      <td headers="currency" class="gt_row gt_right" style="background-color: #FCFFA4; color: #000000;">65100.000</td>
      <td headers="row" class="gt_row gt_left" style="background-color: #9F2A63; color: #FFFFFF;">row_4</td>
      <td headers="group" class="gt_row gt_left" style="background-color: #000004; color: #FFFFFF;">grp_a</td></tr>
          <tr><td headers="num" class="gt_row gt_right" style="background-color: #000004; color: #FFFFFF;">5.550e+03</td>
      <td headers="char" class="gt_row gt_left" style="background-color: #808080; color: #FFFFFF;">NA</td>
      <td headers="fctr" class="gt_row gt_center" style="background-color: #D44842; color: #FFFFFF;">five</td>
      <td headers="date" class="gt_row gt_right" style="background-color: #ED6925; color: #FFFFFF;">2015-05-15</td>
      <td headers="time" class="gt_row gt_right" style="background-color: #ED6925; color: #FFFFFF;">17:55</td>
      <td headers="datetime" class="gt_row gt_right" style="background-color: #ED6925; color: #FFFFFF;">2018-05-05 04:00</td>
      <td headers="currency" class="gt_row gt_right" style="background-color: #02020C; color: #FFFFFF;">1325.810</td>
      <td headers="row" class="gt_row gt_left" style="background-color: #D44842; color: #FFFFFF;">row_5</td>
      <td headers="group" class="gt_row gt_left" style="background-color: #FCFFA4; color: #000000;">grp_b</td></tr>
          <tr><td headers="num" class="gt_row gt_right" style="background-color: #808080; color: #FFFFFF;">NA</td>
      <td headers="char" class="gt_row gt_left" style="background-color: #ED6925; color: #FFFFFF;">fig</td>
      <td headers="fctr" class="gt_row gt_center" style="background-color: #F57D15; color: #FFFFFF;">six</td>
      <td headers="date" class="gt_row gt_right" style="background-color: #FCB519; color: #000000;">2015-06-15</td>
      <td headers="time" class="gt_row gt_right" style="background-color: #808080; color: #FFFFFF;">NA</td>
      <td headers="datetime" class="gt_row gt_right" style="background-color: #FCB519; color: #000000;">2018-06-06 16:11</td>
      <td headers="currency" class="gt_row gt_right" style="background-color: #000004; color: #FFFFFF;">13.255</td>
      <td headers="row" class="gt_row gt_left" style="background-color: #F57D15; color: #FFFFFF;">row_6</td>
      <td headers="group" class="gt_row gt_left" style="background-color: #FCFFA4; color: #000000;">grp_b</td></tr>
          <tr><td headers="num" class="gt_row gt_right" style="background-color: #130A33; color: #FFFFFF;">7.770e+05</td>
      <td headers="char" class="gt_row gt_left" style="background-color: #FCB519; color: #000000;">grapefruit</td>
      <td headers="fctr" class="gt_row gt_center" style="background-color: #FAC127; color: #000000;">seven</td>
      <td headers="date" class="gt_row gt_right" style="background-color: #808080; color: #FFFFFF;">NA</td>
      <td headers="time" class="gt_row gt_right" style="background-color: #FCB519; color: #000000;">19:10</td>
      <td headers="datetime" class="gt_row gt_right" style="background-color: #FCFFA4; color: #000000;">2018-07-07 05:22</td>
      <td headers="currency" class="gt_row gt_right" style="background-color: #808080; color: #FFFFFF;">NA</td>
      <td headers="row" class="gt_row gt_left" style="background-color: #FAC127; color: #000000;">row_7</td>
      <td headers="group" class="gt_row gt_left" style="background-color: #FCFFA4; color: #000000;">grp_b</td></tr>
          <tr><td headers="num" class="gt_row gt_right" style="background-color: #FCFFA4; color: #000000;">8.880e+06</td>
      <td headers="char" class="gt_row gt_left" style="background-color: #FCFFA4; color: #000000;">honeydew</td>
      <td headers="fctr" class="gt_row gt_center" style="background-color: #FCFFA4; color: #000000;">eight</td>
      <td headers="date" class="gt_row gt_right" style="background-color: #FCFFA4; color: #000000;">2015-08-15</td>
      <td headers="time" class="gt_row gt_right" style="background-color: #FCFFA4; color: #000000;">20:20</td>
      <td headers="datetime" class="gt_row gt_right" style="background-color: #808080; color: #FFFFFF;">NA</td>
      <td headers="currency" class="gt_row gt_right" style="background-color: #000004; color: #FFFFFF;">0.440</td>
      <td headers="row" class="gt_row gt_left" style="background-color: #FCFFA4; color: #000000;">row_8</td>
      <td headers="group" class="gt_row gt_left" style="background-color: #FCFFA4; color: #000000;">grp_b</td></tr>
        </tbody>
        
      </table>

# Different combinations of methods and column types work well

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
          <tr><td headers="num" class="gt_row gt_right" style="background-color: #000000; color: #FFFFFF;">1.111e-01</td>
      <td headers="char" class="gt_row gt_left" style="background-color: #000000; color: #FFFFFF;">apricot</td>
      <td headers="fctr" class="gt_row gt_center" style="background-color: #000000; color: #FFFFFF;">one</td>
      <td headers="date" class="gt_row gt_right" style="background-color: #000000; color: #FFFFFF;">2015-01-15</td>
      <td headers="time" class="gt_row gt_right" style="background-color: #000000; color: #FFFFFF;">13:35</td>
      <td headers="datetime" class="gt_row gt_right" style="background-color: #000000; color: #FFFFFF;">2018-01-01 02:22</td>
      <td headers="currency" class="gt_row gt_right" style="background-color: #020101; color: #FFFFFF;">49.950</td>
      <td headers="row" class="gt_row gt_left" style="background-color: #000000; color: #FFFFFF;">row_1</td>
      <td headers="group" class="gt_row gt_left" style="background-color: #000000; color: #FFFFFF;">grp_a</td></tr>
          <tr><td headers="num" class="gt_row gt_right" style="background-color: #000000; color: #FFFFFF;">2.222e+00</td>
      <td headers="char" class="gt_row gt_left" style="background-color: #DF536B; color: #FFFFFF;">banana</td>
      <td headers="fctr" class="gt_row gt_center" style="background-color: #BC485B; color: #FFFFFF;">two</td>
      <td headers="date" class="gt_row gt_right" style="background-color: #DF536B; color: #FFFFFF;">2015-02-15</td>
      <td headers="time" class="gt_row gt_right" style="background-color: #DF536B; color: #FFFFFF;">14:40</td>
      <td headers="datetime" class="gt_row gt_right" style="background-color: #DF536B; color: #FFFFFF;">2018-02-02 14:33</td>
      <td headers="currency" class="gt_row gt_right" style="background-color: #010000; color: #FFFFFF;">17.950</td>
      <td headers="row" class="gt_row gt_left" style="background-color: #BC485B; color: #FFFFFF;">row_2</td>
      <td headers="group" class="gt_row gt_left" style="background-color: #000000; color: #FFFFFF;">grp_a</td></tr>
          <tr><td headers="num" class="gt_row gt_right" style="background-color: #000000; color: #FFFFFF;">3.333e+01</td>
      <td headers="char" class="gt_row gt_left" style="background-color: #61D04F; color: #000000;">coconut</td>
      <td headers="fctr" class="gt_row gt_center" style="background-color: #98B359; color: #000000;">three</td>
      <td headers="date" class="gt_row gt_right" style="background-color: #61D04F; color: #000000;">2015-03-15</td>
      <td headers="time" class="gt_row gt_right" style="background-color: #61D04F; color: #000000;">15:45</td>
      <td headers="datetime" class="gt_row gt_right" style="background-color: #61D04F; color: #000000;">2018-03-03 03:44</td>
      <td headers="currency" class="gt_row gt_right" style="background-color: #000000; color: #FFFFFF;">1.390</td>
      <td headers="row" class="gt_row gt_left" style="background-color: #98B359; color: #000000;">row_3</td>
      <td headers="group" class="gt_row gt_left" style="background-color: #000000; color: #FFFFFF;">grp_a</td></tr>
          <tr><td headers="num" class="gt_row gt_right" style="background-color: #000000; color: #FFFFFF;">4.444e+02</td>
      <td headers="char" class="gt_row gt_left" style="background-color: #2297E6; color: #FFFFFF;">durian</td>
      <td headers="fctr" class="gt_row gt_center" style="background-color: #5FAFAA; color: #FFFFFF;">four</td>
      <td headers="date" class="gt_row gt_right" style="background-color: #2297E6; color: #FFFFFF;">2015-04-15</td>
      <td headers="time" class="gt_row gt_right" style="background-color: #2297E6; color: #FFFFFF;">16:50</td>
      <td headers="datetime" class="gt_row gt_right" style="background-color: #2297E6; color: #FFFFFF;">2018-04-04 15:55</td>
      <td headers="currency" class="gt_row gt_right" style="background-color: #F5C710; color: #000000;">65100.000</td>
      <td headers="row" class="gt_row gt_left" style="background-color: #5FAFAA; color: #FFFFFF;">row_4</td>
      <td headers="group" class="gt_row gt_left" style="background-color: #000000; color: #FFFFFF;">grp_a</td></tr>
          <tr><td headers="num" class="gt_row gt_right" style="background-color: #020101; color: #FFFFFF;">5.550e+03</td>
      <td headers="char" class="gt_row gt_left" style="background-color: #808080; color: #FFFFFF;">NA</td>
      <td headers="fctr" class="gt_row gt_center" style="background-color: #2FB7E6; color: #000000;">five</td>
      <td headers="date" class="gt_row gt_right" style="background-color: #28E2E5; color: #000000;">2015-05-15</td>
      <td headers="time" class="gt_row gt_right" style="background-color: #28E2E5; color: #000000;">17:55</td>
      <td headers="datetime" class="gt_row gt_right" style="background-color: #28E2E5; color: #000000;">2018-05-05 04:00</td>
      <td headers="currency" class="gt_row gt_right" style="background-color: #1F1112; color: #FFFFFF;">1325.810</td>
      <td headers="row" class="gt_row gt_left" style="background-color: #2FB7E6; color: #000000;">row_5</td>
      <td headers="group" class="gt_row gt_left" style="background-color: #DF536B; color: #FFFFFF;">grp_b</td></tr>
          <tr><td headers="num" class="gt_row gt_right" style="background-color: #808080; color: #FFFFFF;">NA</td>
      <td headers="char" class="gt_row gt_left" style="background-color: #28E2E5; color: #000000;">fig</td>
      <td headers="fctr" class="gt_row gt_center" style="background-color: #89B7DA; color: #000000;">six</td>
      <td headers="date" class="gt_row gt_right" style="background-color: #CD0BBC; color: #FFFFFF;">2015-06-15</td>
      <td headers="time" class="gt_row gt_right" style="background-color: #808080; color: #FFFFFF;">NA</td>
      <td headers="datetime" class="gt_row gt_right" style="background-color: #CD0BBC; color: #FFFFFF;">2018-06-06 16:11</td>
      <td headers="currency" class="gt_row gt_right" style="background-color: #000000; color: #FFFFFF;">13.255</td>
      <td headers="row" class="gt_row gt_left" style="background-color: #89B7DA; color: #000000;">row_6</td>
      <td headers="group" class="gt_row gt_left" style="background-color: #DF536B; color: #FFFFFF;">grp_b</td></tr>
          <tr><td headers="num" class="gt_row gt_right" style="background-color: #833641; color: #FFFFFF;">7.770e+05</td>
      <td headers="char" class="gt_row gt_left" style="background-color: #CD0BBC; color: #FFFFFF;">grapefruit</td>
      <td headers="fctr" class="gt_row gt_center" style="background-color: #D83FAB; color: #FFFFFF;">seven</td>
      <td headers="date" class="gt_row gt_right" style="background-color: #808080; color: #FFFFFF;">NA</td>
      <td headers="time" class="gt_row gt_right" style="background-color: #CD0BBC; color: #FFFFFF;">19:10</td>
      <td headers="datetime" class="gt_row gt_right" style="background-color: #F5C710; color: #000000;">2018-07-07 05:22</td>
      <td headers="currency" class="gt_row gt_right" style="background-color: #808080; color: #FFFFFF;">NA</td>
      <td headers="row" class="gt_row gt_left" style="background-color: #D83FAB; color: #FFFFFF;">row_7</td>
      <td headers="group" class="gt_row gt_left" style="background-color: #DF536B; color: #FFFFFF;">grp_b</td></tr>
          <tr><td headers="num" class="gt_row gt_right" style="background-color: #9E9E9E; color: #FFFFFF;">8.880e+06</td>
      <td headers="char" class="gt_row gt_left" style="background-color: #F5C710; color: #000000;">honeydew</td>
      <td headers="fctr" class="gt_row gt_center" style="background-color: #F5C710; color: #000000;">eight</td>
      <td headers="date" class="gt_row gt_right" style="background-color: #F5C710; color: #000000;">2015-08-15</td>
      <td headers="time" class="gt_row gt_right" style="background-color: #F5C710; color: #000000;">20:20</td>
      <td headers="datetime" class="gt_row gt_right" style="background-color: #808080; color: #FFFFFF;">NA</td>
      <td headers="currency" class="gt_row gt_right" style="background-color: #000000; color: #FFFFFF;">0.440</td>
      <td headers="row" class="gt_row gt_left" style="background-color: #F5C710; color: #000000;">row_8</td>
      <td headers="group" class="gt_row gt_left" style="background-color: #DF536B; color: #FFFFFF;">grp_b</td></tr>
        </tbody>
        
      </table>

---

    Code
      cat(render_as_html(gt_tbl))
    Output
      <table class="gt_table" data-quarto-disable-processing="false" data-quarto-bootstrap="false">
        <thead>
          <tr class="gt_col_headings">
            <th class="gt_col_heading gt_columns_bottom_border gt_center" rowspan="1" colspan="1" scope="col" id="month">month</th>
            <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id="min_sza">min_sza</th>
          </tr>
        </thead>
        <tbody class="gt_table_body">
          <tr><td headers="month" class="gt_row gt_center">jan</td>
      <td headers="min_sza" class="gt_row gt_right">73.0</td></tr>
          <tr><td headers="month" class="gt_row gt_center">feb</td>
      <td headers="min_sza" class="gt_row gt_right">67.2</td></tr>
          <tr><td headers="month" class="gt_row gt_center" style="background-color: #C97F65; color: #FFFFFF;">mar</td>
      <td headers="min_sza" class="gt_row gt_right" style="background-color: #9E9E9E; color: #FFFFFF;">57.7</td></tr>
          <tr><td headers="month" class="gt_row gt_center" style="background-color: #76C753; color: #000000;">apr</td>
      <td headers="min_sza" class="gt_row gt_right" style="background-color: #2FCAE6; color: #000000;">45.5</td></tr>
          <tr><td headers="month" class="gt_row gt_center" style="background-color: #60B0A6; color: #FFFFFF;">may</td>
      <td headers="min_sza" class="gt_row gt_right" style="background-color: #B84759; color: #FFFFFF;">35.0</td></tr>
          <tr><td headers="month" class="gt_row gt_center">jun</td>
      <td headers="min_sza" class="gt_row gt_right">28.0</td></tr>
          <tr><td headers="month" class="gt_row gt_center">jul</td>
      <td headers="min_sza" class="gt_row gt_right">26.9</td></tr>
          <tr><td headers="month" class="gt_row gt_center" style="background-color: #A29CD3; color: #FFFFFF;">aug</td>
      <td headers="min_sza" class="gt_row gt_right" style="background-color: #000000; color: #FFFFFF;">31.9</td></tr>
          <tr><td headers="month" class="gt_row gt_center" style="background-color: #D431B1; color: #FFFFFF;">sep</td>
      <td headers="min_sza" class="gt_row gt_right" style="background-color: #5BABB2; color: #FFFFFF;">41.6</td></tr>
          <tr><td headers="month" class="gt_row gt_center" style="background-color: #F1A05B; color: #000000;">oct</td>
      <td headers="min_sza" class="gt_row gt_right" style="background-color: #F2A457; color: #000000;">53.1</td></tr>
          <tr><td headers="month" class="gt_row gt_center">nov</td>
      <td headers="min_sza" class="gt_row gt_right">64.4</td></tr>
          <tr><td headers="month" class="gt_row gt_center">dec</td>
      <td headers="min_sza" class="gt_row gt_right">71.8</td></tr>
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
          <tr><td headers="num" class="gt_row gt_right" style="background-color: #000000; color: #FFFFFF;">1.111e-01</td>
      <td headers="char" class="gt_row gt_left">apricot</td>
      <td headers="fctr" class="gt_row gt_center">one</td>
      <td headers="date" class="gt_row gt_right">2015-01-15</td>
      <td headers="time" class="gt_row gt_right">13:35</td>
      <td headers="datetime" class="gt_row gt_right">2018-01-01 02:22</td>
      <td headers="currency" class="gt_row gt_right">49.950</td>
      <td headers="row" class="gt_row gt_left">row_1</td>
      <td headers="group" class="gt_row gt_left">grp_a</td></tr>
          <tr><td headers="num" class="gt_row gt_right" style="background-color: #000000; color: #FFFFFF;">2.222e+00</td>
      <td headers="char" class="gt_row gt_left">banana</td>
      <td headers="fctr" class="gt_row gt_center">two</td>
      <td headers="date" class="gt_row gt_right">2015-02-15</td>
      <td headers="time" class="gt_row gt_right">14:40</td>
      <td headers="datetime" class="gt_row gt_right">2018-02-02 14:33</td>
      <td headers="currency" class="gt_row gt_right">17.950</td>
      <td headers="row" class="gt_row gt_left">row_2</td>
      <td headers="group" class="gt_row gt_left">grp_a</td></tr>
          <tr><td headers="num" class="gt_row gt_right" style="background-color: #000000; color: #FFFFFF;">3.333e+01</td>
      <td headers="char" class="gt_row gt_left">coconut</td>
      <td headers="fctr" class="gt_row gt_center">three</td>
      <td headers="date" class="gt_row gt_right">2015-03-15</td>
      <td headers="time" class="gt_row gt_right">15:45</td>
      <td headers="datetime" class="gt_row gt_right">2018-03-03 03:44</td>
      <td headers="currency" class="gt_row gt_right">1.390</td>
      <td headers="row" class="gt_row gt_left">row_3</td>
      <td headers="group" class="gt_row gt_left">grp_a</td></tr>
          <tr><td headers="num" class="gt_row gt_right" style="background-color: #000000; color: #FFFFFF;">4.444e+02</td>
      <td headers="char" class="gt_row gt_left">durian</td>
      <td headers="fctr" class="gt_row gt_center">four</td>
      <td headers="date" class="gt_row gt_right">2015-04-15</td>
      <td headers="time" class="gt_row gt_right">16:50</td>
      <td headers="datetime" class="gt_row gt_right">2018-04-04 15:55</td>
      <td headers="currency" class="gt_row gt_right">65100.000</td>
      <td headers="row" class="gt_row gt_left">row_4</td>
      <td headers="group" class="gt_row gt_left">grp_a</td></tr>
          <tr><td headers="num" class="gt_row gt_right" style="background-color: #020101; color: #FFFFFF;">5.550e+03</td>
      <td headers="char" class="gt_row gt_left">NA</td>
      <td headers="fctr" class="gt_row gt_center">five</td>
      <td headers="date" class="gt_row gt_right">2015-05-15</td>
      <td headers="time" class="gt_row gt_right">17:55</td>
      <td headers="datetime" class="gt_row gt_right">2018-05-05 04:00</td>
      <td headers="currency" class="gt_row gt_right">1325.810</td>
      <td headers="row" class="gt_row gt_left">row_5</td>
      <td headers="group" class="gt_row gt_left">grp_b</td></tr>
          <tr><td headers="num" class="gt_row gt_right" style="background-color: #808080; color: #FFFFFF;">NA</td>
      <td headers="char" class="gt_row gt_left">fig</td>
      <td headers="fctr" class="gt_row gt_center">six</td>
      <td headers="date" class="gt_row gt_right">2015-06-15</td>
      <td headers="time" class="gt_row gt_right">NA</td>
      <td headers="datetime" class="gt_row gt_right">2018-06-06 16:11</td>
      <td headers="currency" class="gt_row gt_right">13.255</td>
      <td headers="row" class="gt_row gt_left">row_6</td>
      <td headers="group" class="gt_row gt_left">grp_b</td></tr>
          <tr><td headers="num" class="gt_row gt_right" style="background-color: #833641; color: #FFFFFF;">7.770e+05</td>
      <td headers="char" class="gt_row gt_left">grapefruit</td>
      <td headers="fctr" class="gt_row gt_center">seven</td>
      <td headers="date" class="gt_row gt_right">NA</td>
      <td headers="time" class="gt_row gt_right">19:10</td>
      <td headers="datetime" class="gt_row gt_right">2018-07-07 05:22</td>
      <td headers="currency" class="gt_row gt_right">NA</td>
      <td headers="row" class="gt_row gt_left">row_7</td>
      <td headers="group" class="gt_row gt_left">grp_b</td></tr>
          <tr><td headers="num" class="gt_row gt_right" style="background-color: #9E9E9E; color: #FFFFFF;">8.880e+06</td>
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
          <tr><td headers="num" class="gt_row gt_right" style="background-color: #000000; color: #FFFFFF;">1.111e-01</td>
      <td headers="char" class="gt_row gt_left">apricot</td>
      <td headers="fctr" class="gt_row gt_center">one</td>
      <td headers="date" class="gt_row gt_right">2015-01-15</td>
      <td headers="time" class="gt_row gt_right">13:35</td>
      <td headers="datetime" class="gt_row gt_right">2018-01-01 02:22</td>
      <td headers="currency" class="gt_row gt_right">49.950</td>
      <td headers="row" class="gt_row gt_left">row_1</td>
      <td headers="group" class="gt_row gt_left">grp_a</td></tr>
          <tr><td headers="num" class="gt_row gt_right" style="background-color: #000000; color: #FFFFFF;">2.222e+00</td>
      <td headers="char" class="gt_row gt_left">banana</td>
      <td headers="fctr" class="gt_row gt_center">two</td>
      <td headers="date" class="gt_row gt_right">2015-02-15</td>
      <td headers="time" class="gt_row gt_right">14:40</td>
      <td headers="datetime" class="gt_row gt_right">2018-02-02 14:33</td>
      <td headers="currency" class="gt_row gt_right">17.950</td>
      <td headers="row" class="gt_row gt_left">row_2</td>
      <td headers="group" class="gt_row gt_left">grp_a</td></tr>
          <tr><td headers="num" class="gt_row gt_right" style="background-color: #000000; color: #FFFFFF;">3.333e+01</td>
      <td headers="char" class="gt_row gt_left">coconut</td>
      <td headers="fctr" class="gt_row gt_center">three</td>
      <td headers="date" class="gt_row gt_right">2015-03-15</td>
      <td headers="time" class="gt_row gt_right">15:45</td>
      <td headers="datetime" class="gt_row gt_right">2018-03-03 03:44</td>
      <td headers="currency" class="gt_row gt_right">1.390</td>
      <td headers="row" class="gt_row gt_left">row_3</td>
      <td headers="group" class="gt_row gt_left">grp_a</td></tr>
          <tr><td headers="num" class="gt_row gt_right" style="background-color: #000000; color: #FFFFFF;">4.444e+02</td>
      <td headers="char" class="gt_row gt_left">durian</td>
      <td headers="fctr" class="gt_row gt_center">four</td>
      <td headers="date" class="gt_row gt_right">2015-04-15</td>
      <td headers="time" class="gt_row gt_right">16:50</td>
      <td headers="datetime" class="gt_row gt_right">2018-04-04 15:55</td>
      <td headers="currency" class="gt_row gt_right">65100.000</td>
      <td headers="row" class="gt_row gt_left">row_4</td>
      <td headers="group" class="gt_row gt_left">grp_a</td></tr>
          <tr><td headers="num" class="gt_row gt_right" style="background-color: #000000; color: #FFFFFF;">5.550e+03</td>
      <td headers="char" class="gt_row gt_left">NA</td>
      <td headers="fctr" class="gt_row gt_center">five</td>
      <td headers="date" class="gt_row gt_right">2015-05-15</td>
      <td headers="time" class="gt_row gt_right">17:55</td>
      <td headers="datetime" class="gt_row gt_right">2018-05-05 04:00</td>
      <td headers="currency" class="gt_row gt_right">1325.810</td>
      <td headers="row" class="gt_row gt_left">row_5</td>
      <td headers="group" class="gt_row gt_left">grp_b</td></tr>
          <tr><td headers="num" class="gt_row gt_right" style="background-color: #808080; color: #FFFFFF;">NA</td>
      <td headers="char" class="gt_row gt_left">fig</td>
      <td headers="fctr" class="gt_row gt_center">six</td>
      <td headers="date" class="gt_row gt_right">2015-06-15</td>
      <td headers="time" class="gt_row gt_right">NA</td>
      <td headers="datetime" class="gt_row gt_right">2018-06-06 16:11</td>
      <td headers="currency" class="gt_row gt_right">13.255</td>
      <td headers="row" class="gt_row gt_left">row_6</td>
      <td headers="group" class="gt_row gt_left">grp_b</td></tr>
          <tr><td headers="num" class="gt_row gt_right" style="background-color: #000000; color: #FFFFFF;">7.770e+05</td>
      <td headers="char" class="gt_row gt_left">grapefruit</td>
      <td headers="fctr" class="gt_row gt_center">seven</td>
      <td headers="date" class="gt_row gt_right">NA</td>
      <td headers="time" class="gt_row gt_right">19:10</td>
      <td headers="datetime" class="gt_row gt_right">2018-07-07 05:22</td>
      <td headers="currency" class="gt_row gt_right">NA</td>
      <td headers="row" class="gt_row gt_left">row_7</td>
      <td headers="group" class="gt_row gt_left">grp_b</td></tr>
          <tr><td headers="num" class="gt_row gt_right" style="background-color: #9E9E9E; color: #FFFFFF;">8.880e+06</td>
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
          <tr><td headers="num" class="gt_row gt_right" style="background-color: #000000; color: #FFFFFF;">1.111e-01</td>
      <td headers="char" class="gt_row gt_left">apricot</td>
      <td headers="fctr" class="gt_row gt_center">one</td>
      <td headers="date" class="gt_row gt_right">2015-01-15</td>
      <td headers="time" class="gt_row gt_right">13:35</td>
      <td headers="datetime" class="gt_row gt_right">2018-01-01 02:22</td>
      <td headers="currency" class="gt_row gt_right">49.950</td>
      <td headers="row" class="gt_row gt_left">row_1</td>
      <td headers="group" class="gt_row gt_left">grp_a</td></tr>
          <tr><td headers="num" class="gt_row gt_right" style="background-color: #000000; color: #FFFFFF;">2.222e+00</td>
      <td headers="char" class="gt_row gt_left">banana</td>
      <td headers="fctr" class="gt_row gt_center">two</td>
      <td headers="date" class="gt_row gt_right">2015-02-15</td>
      <td headers="time" class="gt_row gt_right">14:40</td>
      <td headers="datetime" class="gt_row gt_right">2018-02-02 14:33</td>
      <td headers="currency" class="gt_row gt_right">17.950</td>
      <td headers="row" class="gt_row gt_left">row_2</td>
      <td headers="group" class="gt_row gt_left">grp_a</td></tr>
          <tr><td headers="num" class="gt_row gt_right" style="background-color: #66BC87; color: #000000;">3.333e+01</td>
      <td headers="char" class="gt_row gt_left">coconut</td>
      <td headers="fctr" class="gt_row gt_center">three</td>
      <td headers="date" class="gt_row gt_right">2015-03-15</td>
      <td headers="time" class="gt_row gt_right">15:45</td>
      <td headers="datetime" class="gt_row gt_right">2018-03-03 03:44</td>
      <td headers="currency" class="gt_row gt_right">1.390</td>
      <td headers="row" class="gt_row gt_left">row_3</td>
      <td headers="group" class="gt_row gt_left">grp_a</td></tr>
          <tr><td headers="num" class="gt_row gt_right" style="background-color: #B877CA; color: #FFFFFF;">4.444e+02</td>
      <td headers="char" class="gt_row gt_left">durian</td>
      <td headers="fctr" class="gt_row gt_center">four</td>
      <td headers="date" class="gt_row gt_right">2015-04-15</td>
      <td headers="time" class="gt_row gt_right">16:50</td>
      <td headers="datetime" class="gt_row gt_right">2018-04-04 15:55</td>
      <td headers="currency" class="gt_row gt_right">65100.000</td>
      <td headers="row" class="gt_row gt_left">row_4</td>
      <td headers="group" class="gt_row gt_left">grp_a</td></tr>
          <tr><td headers="num" class="gt_row gt_right" style="background-color: #B877CA; color: #FFFFFF;">5.550e+03</td>
      <td headers="char" class="gt_row gt_left">NA</td>
      <td headers="fctr" class="gt_row gt_center">five</td>
      <td headers="date" class="gt_row gt_right">2015-05-15</td>
      <td headers="time" class="gt_row gt_right">17:55</td>
      <td headers="datetime" class="gt_row gt_right">2018-05-05 04:00</td>
      <td headers="currency" class="gt_row gt_right">1325.810</td>
      <td headers="row" class="gt_row gt_left">row_5</td>
      <td headers="group" class="gt_row gt_left">grp_b</td></tr>
          <tr><td headers="num" class="gt_row gt_right" style="background-color: #808080; color: #FFFFFF;">NA</td>
      <td headers="char" class="gt_row gt_left">fig</td>
      <td headers="fctr" class="gt_row gt_center">six</td>
      <td headers="date" class="gt_row gt_right">2015-06-15</td>
      <td headers="time" class="gt_row gt_right">NA</td>
      <td headers="datetime" class="gt_row gt_right">2018-06-06 16:11</td>
      <td headers="currency" class="gt_row gt_right">13.255</td>
      <td headers="row" class="gt_row gt_left">row_6</td>
      <td headers="group" class="gt_row gt_left">grp_b</td></tr>
          <tr><td headers="num" class="gt_row gt_right" style="background-color: #9E9E9E; color: #FFFFFF;">7.770e+05</td>
      <td headers="char" class="gt_row gt_left">grapefruit</td>
      <td headers="fctr" class="gt_row gt_center">seven</td>
      <td headers="date" class="gt_row gt_right">NA</td>
      <td headers="time" class="gt_row gt_right">19:10</td>
      <td headers="datetime" class="gt_row gt_right">2018-07-07 05:22</td>
      <td headers="currency" class="gt_row gt_right">NA</td>
      <td headers="row" class="gt_row gt_left">row_7</td>
      <td headers="group" class="gt_row gt_left">grp_b</td></tr>
          <tr><td headers="num" class="gt_row gt_right" style="background-color: #9E9E9E; color: #FFFFFF;">8.880e+06</td>
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
          <tr><td headers="num" class="gt_row gt_right" style="background-color: #000000; color: #FFFFFF;">1.111e-01</td>
      <td headers="char" class="gt_row gt_left">apricot</td>
      <td headers="fctr" class="gt_row gt_center">one</td>
      <td headers="date" class="gt_row gt_right">2015-01-15</td>
      <td headers="time" class="gt_row gt_right">13:35</td>
      <td headers="datetime" class="gt_row gt_right">2018-01-01 02:22</td>
      <td headers="currency" class="gt_row gt_right">49.950</td>
      <td headers="row" class="gt_row gt_left">row_1</td>
      <td headers="group" class="gt_row gt_left">grp_a</td></tr>
          <tr><td headers="num" class="gt_row gt_right" style="background-color: #DF536B; color: #FFFFFF;">2.222e+00</td>
      <td headers="char" class="gt_row gt_left">banana</td>
      <td headers="fctr" class="gt_row gt_center">two</td>
      <td headers="date" class="gt_row gt_right">2015-02-15</td>
      <td headers="time" class="gt_row gt_right">14:40</td>
      <td headers="datetime" class="gt_row gt_right">2018-02-02 14:33</td>
      <td headers="currency" class="gt_row gt_right">17.950</td>
      <td headers="row" class="gt_row gt_left">row_2</td>
      <td headers="group" class="gt_row gt_left">grp_a</td></tr>
          <tr><td headers="num" class="gt_row gt_right" style="background-color: #61D04F; color: #000000;">3.333e+01</td>
      <td headers="char" class="gt_row gt_left">coconut</td>
      <td headers="fctr" class="gt_row gt_center">three</td>
      <td headers="date" class="gt_row gt_right">2015-03-15</td>
      <td headers="time" class="gt_row gt_right">15:45</td>
      <td headers="datetime" class="gt_row gt_right">2018-03-03 03:44</td>
      <td headers="currency" class="gt_row gt_right">1.390</td>
      <td headers="row" class="gt_row gt_left">row_3</td>
      <td headers="group" class="gt_row gt_left">grp_a</td></tr>
          <tr><td headers="num" class="gt_row gt_right" style="background-color: #2297E6; color: #FFFFFF;">4.444e+02</td>
      <td headers="char" class="gt_row gt_left">durian</td>
      <td headers="fctr" class="gt_row gt_center">four</td>
      <td headers="date" class="gt_row gt_right">2015-04-15</td>
      <td headers="time" class="gt_row gt_right">16:50</td>
      <td headers="datetime" class="gt_row gt_right">2018-04-04 15:55</td>
      <td headers="currency" class="gt_row gt_right">65100.000</td>
      <td headers="row" class="gt_row gt_left">row_4</td>
      <td headers="group" class="gt_row gt_left">grp_a</td></tr>
          <tr><td headers="num" class="gt_row gt_right" style="background-color: #28E2E5; color: #000000;">5.550e+03</td>
      <td headers="char" class="gt_row gt_left">NA</td>
      <td headers="fctr" class="gt_row gt_center">five</td>
      <td headers="date" class="gt_row gt_right">2015-05-15</td>
      <td headers="time" class="gt_row gt_right">17:55</td>
      <td headers="datetime" class="gt_row gt_right">2018-05-05 04:00</td>
      <td headers="currency" class="gt_row gt_right">1325.810</td>
      <td headers="row" class="gt_row gt_left">row_5</td>
      <td headers="group" class="gt_row gt_left">grp_b</td></tr>
          <tr><td headers="num" class="gt_row gt_right" style="background-color: #808080; color: #FFFFFF;">NA</td>
      <td headers="char" class="gt_row gt_left">fig</td>
      <td headers="fctr" class="gt_row gt_center">six</td>
      <td headers="date" class="gt_row gt_right">2015-06-15</td>
      <td headers="time" class="gt_row gt_right">NA</td>
      <td headers="datetime" class="gt_row gt_right">2018-06-06 16:11</td>
      <td headers="currency" class="gt_row gt_right">13.255</td>
      <td headers="row" class="gt_row gt_left">row_6</td>
      <td headers="group" class="gt_row gt_left">grp_b</td></tr>
          <tr><td headers="num" class="gt_row gt_right" style="background-color: #CD0BBC; color: #FFFFFF;">7.770e+05</td>
      <td headers="char" class="gt_row gt_left">grapefruit</td>
      <td headers="fctr" class="gt_row gt_center">seven</td>
      <td headers="date" class="gt_row gt_right">NA</td>
      <td headers="time" class="gt_row gt_right">19:10</td>
      <td headers="datetime" class="gt_row gt_right">2018-07-07 05:22</td>
      <td headers="currency" class="gt_row gt_right">NA</td>
      <td headers="row" class="gt_row gt_left">row_7</td>
      <td headers="group" class="gt_row gt_left">grp_b</td></tr>
          <tr><td headers="num" class="gt_row gt_right" style="background-color: #F5C710; color: #000000;">8.880e+06</td>
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
      <td headers="char" class="gt_row gt_left" style="background-color: #000000; color: #FFFFFF;">apricot</td>
      <td headers="fctr" class="gt_row gt_center">one</td>
      <td headers="date" class="gt_row gt_right">2015-01-15</td>
      <td headers="time" class="gt_row gt_right">13:35</td>
      <td headers="datetime" class="gt_row gt_right">2018-01-01 02:22</td>
      <td headers="currency" class="gt_row gt_right">49.950</td>
      <td headers="row" class="gt_row gt_left">row_1</td>
      <td headers="group" class="gt_row gt_left">grp_a</td></tr>
          <tr><td headers="num" class="gt_row gt_right">2.222e+00</td>
      <td headers="char" class="gt_row gt_left" style="background-color: #DF536B; color: #FFFFFF;">banana</td>
      <td headers="fctr" class="gt_row gt_center">two</td>
      <td headers="date" class="gt_row gt_right">2015-02-15</td>
      <td headers="time" class="gt_row gt_right">14:40</td>
      <td headers="datetime" class="gt_row gt_right">2018-02-02 14:33</td>
      <td headers="currency" class="gt_row gt_right">17.950</td>
      <td headers="row" class="gt_row gt_left">row_2</td>
      <td headers="group" class="gt_row gt_left">grp_a</td></tr>
          <tr><td headers="num" class="gt_row gt_right">3.333e+01</td>
      <td headers="char" class="gt_row gt_left" style="background-color: #61D04F; color: #000000;">coconut</td>
      <td headers="fctr" class="gt_row gt_center">three</td>
      <td headers="date" class="gt_row gt_right">2015-03-15</td>
      <td headers="time" class="gt_row gt_right">15:45</td>
      <td headers="datetime" class="gt_row gt_right">2018-03-03 03:44</td>
      <td headers="currency" class="gt_row gt_right">1.390</td>
      <td headers="row" class="gt_row gt_left">row_3</td>
      <td headers="group" class="gt_row gt_left">grp_a</td></tr>
          <tr><td headers="num" class="gt_row gt_right">4.444e+02</td>
      <td headers="char" class="gt_row gt_left" style="background-color: #2297E6; color: #FFFFFF;">durian</td>
      <td headers="fctr" class="gt_row gt_center">four</td>
      <td headers="date" class="gt_row gt_right">2015-04-15</td>
      <td headers="time" class="gt_row gt_right">16:50</td>
      <td headers="datetime" class="gt_row gt_right">2018-04-04 15:55</td>
      <td headers="currency" class="gt_row gt_right">65100.000</td>
      <td headers="row" class="gt_row gt_left">row_4</td>
      <td headers="group" class="gt_row gt_left">grp_a</td></tr>
          <tr><td headers="num" class="gt_row gt_right">5.550e+03</td>
      <td headers="char" class="gt_row gt_left" style="background-color: #808080; color: #FFFFFF;">NA</td>
      <td headers="fctr" class="gt_row gt_center">five</td>
      <td headers="date" class="gt_row gt_right">2015-05-15</td>
      <td headers="time" class="gt_row gt_right">17:55</td>
      <td headers="datetime" class="gt_row gt_right">2018-05-05 04:00</td>
      <td headers="currency" class="gt_row gt_right">1325.810</td>
      <td headers="row" class="gt_row gt_left">row_5</td>
      <td headers="group" class="gt_row gt_left">grp_b</td></tr>
          <tr><td headers="num" class="gt_row gt_right">NA</td>
      <td headers="char" class="gt_row gt_left" style="background-color: #28E2E5; color: #000000;">fig</td>
      <td headers="fctr" class="gt_row gt_center">six</td>
      <td headers="date" class="gt_row gt_right">2015-06-15</td>
      <td headers="time" class="gt_row gt_right">NA</td>
      <td headers="datetime" class="gt_row gt_right">2018-06-06 16:11</td>
      <td headers="currency" class="gt_row gt_right">13.255</td>
      <td headers="row" class="gt_row gt_left">row_6</td>
      <td headers="group" class="gt_row gt_left">grp_b</td></tr>
          <tr><td headers="num" class="gt_row gt_right">7.770e+05</td>
      <td headers="char" class="gt_row gt_left" style="background-color: #CD0BBC; color: #FFFFFF;">grapefruit</td>
      <td headers="fctr" class="gt_row gt_center">seven</td>
      <td headers="date" class="gt_row gt_right">NA</td>
      <td headers="time" class="gt_row gt_right">19:10</td>
      <td headers="datetime" class="gt_row gt_right">2018-07-07 05:22</td>
      <td headers="currency" class="gt_row gt_right">NA</td>
      <td headers="row" class="gt_row gt_left">row_7</td>
      <td headers="group" class="gt_row gt_left">grp_b</td></tr>
          <tr><td headers="num" class="gt_row gt_right">8.880e+06</td>
      <td headers="char" class="gt_row gt_left" style="background-color: #F5C710; color: #000000;">honeydew</td>
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
      <td headers="fctr" class="gt_row gt_center" style="background-color: #000000; color: #FFFFFF;">one</td>
      <td headers="date" class="gt_row gt_right">2015-01-15</td>
      <td headers="time" class="gt_row gt_right">13:35</td>
      <td headers="datetime" class="gt_row gt_right">2018-01-01 02:22</td>
      <td headers="currency" class="gt_row gt_right">49.950</td>
      <td headers="row" class="gt_row gt_left">row_1</td>
      <td headers="group" class="gt_row gt_left">grp_a</td></tr>
          <tr><td headers="num" class="gt_row gt_right">2.222e+00</td>
      <td headers="char" class="gt_row gt_left">banana</td>
      <td headers="fctr" class="gt_row gt_center" style="background-color: #DF536B; color: #FFFFFF;">two</td>
      <td headers="date" class="gt_row gt_right">2015-02-15</td>
      <td headers="time" class="gt_row gt_right">14:40</td>
      <td headers="datetime" class="gt_row gt_right">2018-02-02 14:33</td>
      <td headers="currency" class="gt_row gt_right">17.950</td>
      <td headers="row" class="gt_row gt_left">row_2</td>
      <td headers="group" class="gt_row gt_left">grp_a</td></tr>
          <tr><td headers="num" class="gt_row gt_right">3.333e+01</td>
      <td headers="char" class="gt_row gt_left">coconut</td>
      <td headers="fctr" class="gt_row gt_center" style="background-color: #61D04F; color: #000000;">three</td>
      <td headers="date" class="gt_row gt_right">2015-03-15</td>
      <td headers="time" class="gt_row gt_right">15:45</td>
      <td headers="datetime" class="gt_row gt_right">2018-03-03 03:44</td>
      <td headers="currency" class="gt_row gt_right">1.390</td>
      <td headers="row" class="gt_row gt_left">row_3</td>
      <td headers="group" class="gt_row gt_left">grp_a</td></tr>
          <tr><td headers="num" class="gt_row gt_right">4.444e+02</td>
      <td headers="char" class="gt_row gt_left">durian</td>
      <td headers="fctr" class="gt_row gt_center" style="background-color: #2297E6; color: #FFFFFF;">four</td>
      <td headers="date" class="gt_row gt_right">2015-04-15</td>
      <td headers="time" class="gt_row gt_right">16:50</td>
      <td headers="datetime" class="gt_row gt_right">2018-04-04 15:55</td>
      <td headers="currency" class="gt_row gt_right">65100.000</td>
      <td headers="row" class="gt_row gt_left">row_4</td>
      <td headers="group" class="gt_row gt_left">grp_a</td></tr>
          <tr><td headers="num" class="gt_row gt_right">5.550e+03</td>
      <td headers="char" class="gt_row gt_left">NA</td>
      <td headers="fctr" class="gt_row gt_center" style="background-color: #28E2E5; color: #000000;">five</td>
      <td headers="date" class="gt_row gt_right">2015-05-15</td>
      <td headers="time" class="gt_row gt_right">17:55</td>
      <td headers="datetime" class="gt_row gt_right">2018-05-05 04:00</td>
      <td headers="currency" class="gt_row gt_right">1325.810</td>
      <td headers="row" class="gt_row gt_left">row_5</td>
      <td headers="group" class="gt_row gt_left">grp_b</td></tr>
          <tr><td headers="num" class="gt_row gt_right">NA</td>
      <td headers="char" class="gt_row gt_left">fig</td>
      <td headers="fctr" class="gt_row gt_center" style="background-color: #CD0BBC; color: #FFFFFF;">six</td>
      <td headers="date" class="gt_row gt_right">2015-06-15</td>
      <td headers="time" class="gt_row gt_right">NA</td>
      <td headers="datetime" class="gt_row gt_right">2018-06-06 16:11</td>
      <td headers="currency" class="gt_row gt_right">13.255</td>
      <td headers="row" class="gt_row gt_left">row_6</td>
      <td headers="group" class="gt_row gt_left">grp_b</td></tr>
          <tr><td headers="num" class="gt_row gt_right">7.770e+05</td>
      <td headers="char" class="gt_row gt_left">grapefruit</td>
      <td headers="fctr" class="gt_row gt_center" style="background-color: #F5C710; color: #000000;">seven</td>
      <td headers="date" class="gt_row gt_right">NA</td>
      <td headers="time" class="gt_row gt_right">19:10</td>
      <td headers="datetime" class="gt_row gt_right">2018-07-07 05:22</td>
      <td headers="currency" class="gt_row gt_right">NA</td>
      <td headers="row" class="gt_row gt_left">row_7</td>
      <td headers="group" class="gt_row gt_left">grp_b</td></tr>
          <tr><td headers="num" class="gt_row gt_right">8.880e+06</td>
      <td headers="char" class="gt_row gt_left">honeydew</td>
      <td headers="fctr" class="gt_row gt_center" style="background-color: #9E9E9E; color: #FFFFFF;">eight</td>
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
          <tr><td headers="num" class="gt_row gt_right" style="background-color: #000000; color: #FFFFFF;">1.111e-01</td>
      <td headers="char" class="gt_row gt_left">apricot</td>
      <td headers="fctr" class="gt_row gt_center">one</td>
      <td headers="date" class="gt_row gt_right">2015-01-15</td>
      <td headers="time" class="gt_row gt_right">13:35</td>
      <td headers="datetime" class="gt_row gt_right">2018-01-01 02:22</td>
      <td headers="currency" class="gt_row gt_right" style="background-color: #020101; color: #FFFFFF;">49.950</td>
      <td headers="row" class="gt_row gt_left">row_1</td>
      <td headers="group" class="gt_row gt_left">grp_a</td></tr>
          <tr><td headers="num" class="gt_row gt_right" style="background-color: #000000; color: #FFFFFF;">2.222e+00</td>
      <td headers="char" class="gt_row gt_left">banana</td>
      <td headers="fctr" class="gt_row gt_center">two</td>
      <td headers="date" class="gt_row gt_right">2015-02-15</td>
      <td headers="time" class="gt_row gt_right">14:40</td>
      <td headers="datetime" class="gt_row gt_right">2018-02-02 14:33</td>
      <td headers="currency" class="gt_row gt_right" style="background-color: #010000; color: #FFFFFF;">17.950</td>
      <td headers="row" class="gt_row gt_left">row_2</td>
      <td headers="group" class="gt_row gt_left">grp_a</td></tr>
          <tr><td headers="num" class="gt_row gt_right" style="background-color: #000000; color: #FFFFFF;">3.333e+01</td>
      <td headers="char" class="gt_row gt_left">coconut</td>
      <td headers="fctr" class="gt_row gt_center">three</td>
      <td headers="date" class="gt_row gt_right">2015-03-15</td>
      <td headers="time" class="gt_row gt_right">15:45</td>
      <td headers="datetime" class="gt_row gt_right">2018-03-03 03:44</td>
      <td headers="currency" class="gt_row gt_right" style="background-color: #000000; color: #FFFFFF;">1.390</td>
      <td headers="row" class="gt_row gt_left">row_3</td>
      <td headers="group" class="gt_row gt_left">grp_a</td></tr>
          <tr><td headers="num" class="gt_row gt_right" style="background-color: #000000; color: #FFFFFF;">4.444e+02</td>
      <td headers="char" class="gt_row gt_left">durian</td>
      <td headers="fctr" class="gt_row gt_center">four</td>
      <td headers="date" class="gt_row gt_right">2015-04-15</td>
      <td headers="time" class="gt_row gt_right">16:50</td>
      <td headers="datetime" class="gt_row gt_right">2018-04-04 15:55</td>
      <td headers="currency" class="gt_row gt_right" style="background-color: #9E9E9E; color: #FFFFFF;">65100.000</td>
      <td headers="row" class="gt_row gt_left">row_4</td>
      <td headers="group" class="gt_row gt_left">grp_a</td></tr>
          <tr><td headers="num" class="gt_row gt_right" style="background-color: #020101; color: #FFFFFF;">5.550e+03</td>
      <td headers="char" class="gt_row gt_left">NA</td>
      <td headers="fctr" class="gt_row gt_center">five</td>
      <td headers="date" class="gt_row gt_right">2015-05-15</td>
      <td headers="time" class="gt_row gt_right">17:55</td>
      <td headers="datetime" class="gt_row gt_right">2018-05-05 04:00</td>
      <td headers="currency" class="gt_row gt_right" style="background-color: #221314; color: #FFFFFF;">1325.810</td>
      <td headers="row" class="gt_row gt_left">row_5</td>
      <td headers="group" class="gt_row gt_left">grp_b</td></tr>
          <tr><td headers="num" class="gt_row gt_right" style="background-color: #808080; color: #FFFFFF;">NA</td>
      <td headers="char" class="gt_row gt_left">fig</td>
      <td headers="fctr" class="gt_row gt_center">six</td>
      <td headers="date" class="gt_row gt_right">2015-06-15</td>
      <td headers="time" class="gt_row gt_right">NA</td>
      <td headers="datetime" class="gt_row gt_right">2018-06-06 16:11</td>
      <td headers="currency" class="gt_row gt_right" style="background-color: #010000; color: #FFFFFF;">13.255</td>
      <td headers="row" class="gt_row gt_left">row_6</td>
      <td headers="group" class="gt_row gt_left">grp_b</td></tr>
          <tr><td headers="num" class="gt_row gt_right" style="background-color: #833641; color: #FFFFFF;">7.770e+05</td>
      <td headers="char" class="gt_row gt_left">grapefruit</td>
      <td headers="fctr" class="gt_row gt_center">seven</td>
      <td headers="date" class="gt_row gt_right">NA</td>
      <td headers="time" class="gt_row gt_right">19:10</td>
      <td headers="datetime" class="gt_row gt_right">2018-07-07 05:22</td>
      <td headers="currency" class="gt_row gt_right" style="background-color: #808080; color: #FFFFFF;">NA</td>
      <td headers="row" class="gt_row gt_left">row_7</td>
      <td headers="group" class="gt_row gt_left">grp_b</td></tr>
          <tr><td headers="num" class="gt_row gt_right" style="background-color: #9E9E9E; color: #FFFFFF;">8.880e+06</td>
      <td headers="char" class="gt_row gt_left">honeydew</td>
      <td headers="fctr" class="gt_row gt_center">eight</td>
      <td headers="date" class="gt_row gt_right">2015-08-15</td>
      <td headers="time" class="gt_row gt_right">20:20</td>
      <td headers="datetime" class="gt_row gt_right">NA</td>
      <td headers="currency" class="gt_row gt_right" style="background-color: #000000; color: #FFFFFF;">0.440</td>
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
          <tr><td headers="num" class="gt_row gt_right" style="background-color: #000000; color: #FFFFFF;">1.111e-01</td>
      <td headers="char" class="gt_row gt_left">apricot</td>
      <td headers="fctr" class="gt_row gt_center">one</td>
      <td headers="date" class="gt_row gt_right">2015-01-15</td>
      <td headers="time" class="gt_row gt_right">13:35</td>
      <td headers="datetime" class="gt_row gt_right">2018-01-01 02:22</td>
      <td headers="currency" class="gt_row gt_right" style="background-color: #000000; color: #FFFFFF;">49.950</td>
      <td headers="row" class="gt_row gt_left">row_1</td>
      <td headers="group" class="gt_row gt_left">grp_a</td></tr>
          <tr><td headers="num" class="gt_row gt_right" style="background-color: #000000; color: #FFFFFF;">2.222e+00</td>
      <td headers="char" class="gt_row gt_left">banana</td>
      <td headers="fctr" class="gt_row gt_center">two</td>
      <td headers="date" class="gt_row gt_right">2015-02-15</td>
      <td headers="time" class="gt_row gt_right">14:40</td>
      <td headers="datetime" class="gt_row gt_right">2018-02-02 14:33</td>
      <td headers="currency" class="gt_row gt_right" style="background-color: #000000; color: #FFFFFF;">17.950</td>
      <td headers="row" class="gt_row gt_left">row_2</td>
      <td headers="group" class="gt_row gt_left">grp_a</td></tr>
          <tr><td headers="num" class="gt_row gt_right" style="background-color: #000000; color: #FFFFFF;">3.333e+01</td>
      <td headers="char" class="gt_row gt_left">coconut</td>
      <td headers="fctr" class="gt_row gt_center">three</td>
      <td headers="date" class="gt_row gt_right">2015-03-15</td>
      <td headers="time" class="gt_row gt_right">15:45</td>
      <td headers="datetime" class="gt_row gt_right">2018-03-03 03:44</td>
      <td headers="currency" class="gt_row gt_right" style="background-color: #000000; color: #FFFFFF;">1.390</td>
      <td headers="row" class="gt_row gt_left">row_3</td>
      <td headers="group" class="gt_row gt_left">grp_a</td></tr>
          <tr><td headers="num" class="gt_row gt_right" style="background-color: #000000; color: #FFFFFF;">4.444e+02</td>
      <td headers="char" class="gt_row gt_left">durian</td>
      <td headers="fctr" class="gt_row gt_center">four</td>
      <td headers="date" class="gt_row gt_right">2015-04-15</td>
      <td headers="time" class="gt_row gt_right">16:50</td>
      <td headers="datetime" class="gt_row gt_right">2018-04-04 15:55</td>
      <td headers="currency" class="gt_row gt_right" style="background-color: #9E9E9E; color: #FFFFFF;">65100.000</td>
      <td headers="row" class="gt_row gt_left">row_4</td>
      <td headers="group" class="gt_row gt_left">grp_a</td></tr>
          <tr><td headers="num" class="gt_row gt_right" style="background-color: #000000; color: #FFFFFF;">5.550e+03</td>
      <td headers="char" class="gt_row gt_left">NA</td>
      <td headers="fctr" class="gt_row gt_center">five</td>
      <td headers="date" class="gt_row gt_right">2015-05-15</td>
      <td headers="time" class="gt_row gt_right">17:55</td>
      <td headers="datetime" class="gt_row gt_right">2018-05-05 04:00</td>
      <td headers="currency" class="gt_row gt_right" style="background-color: #000000; color: #FFFFFF;">1325.810</td>
      <td headers="row" class="gt_row gt_left">row_5</td>
      <td headers="group" class="gt_row gt_left">grp_b</td></tr>
          <tr><td headers="num" class="gt_row gt_right" style="background-color: #808080; color: #FFFFFF;">NA</td>
      <td headers="char" class="gt_row gt_left">fig</td>
      <td headers="fctr" class="gt_row gt_center">six</td>
      <td headers="date" class="gt_row gt_right">2015-06-15</td>
      <td headers="time" class="gt_row gt_right">NA</td>
      <td headers="datetime" class="gt_row gt_right">2018-06-06 16:11</td>
      <td headers="currency" class="gt_row gt_right" style="background-color: #000000; color: #FFFFFF;">13.255</td>
      <td headers="row" class="gt_row gt_left">row_6</td>
      <td headers="group" class="gt_row gt_left">grp_b</td></tr>
          <tr><td headers="num" class="gt_row gt_right" style="background-color: #000000; color: #FFFFFF;">7.770e+05</td>
      <td headers="char" class="gt_row gt_left">grapefruit</td>
      <td headers="fctr" class="gt_row gt_center">seven</td>
      <td headers="date" class="gt_row gt_right">NA</td>
      <td headers="time" class="gt_row gt_right">19:10</td>
      <td headers="datetime" class="gt_row gt_right">2018-07-07 05:22</td>
      <td headers="currency" class="gt_row gt_right" style="background-color: #808080; color: #FFFFFF;">NA</td>
      <td headers="row" class="gt_row gt_left">row_7</td>
      <td headers="group" class="gt_row gt_left">grp_b</td></tr>
          <tr><td headers="num" class="gt_row gt_right" style="background-color: #9E9E9E; color: #FFFFFF;">8.880e+06</td>
      <td headers="char" class="gt_row gt_left">honeydew</td>
      <td headers="fctr" class="gt_row gt_center">eight</td>
      <td headers="date" class="gt_row gt_right">2015-08-15</td>
      <td headers="time" class="gt_row gt_right">20:20</td>
      <td headers="datetime" class="gt_row gt_right">NA</td>
      <td headers="currency" class="gt_row gt_right" style="background-color: #000000; color: #FFFFFF;">0.440</td>
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
          <tr><td headers="num" class="gt_row gt_right" style="background-color: #000000; color: #FFFFFF;">1.111e-01</td>
      <td headers="char" class="gt_row gt_left">apricot</td>
      <td headers="fctr" class="gt_row gt_center">one</td>
      <td headers="date" class="gt_row gt_right">2015-01-15</td>
      <td headers="time" class="gt_row gt_right">13:35</td>
      <td headers="datetime" class="gt_row gt_right">2018-01-01 02:22</td>
      <td headers="currency" class="gt_row gt_right" style="background-color: #B877CA; color: #FFFFFF;">49.950</td>
      <td headers="row" class="gt_row gt_left">row_1</td>
      <td headers="group" class="gt_row gt_left">grp_a</td></tr>
          <tr><td headers="num" class="gt_row gt_right" style="background-color: #000000; color: #FFFFFF;">2.222e+00</td>
      <td headers="char" class="gt_row gt_left">banana</td>
      <td headers="fctr" class="gt_row gt_center">two</td>
      <td headers="date" class="gt_row gt_right">2015-02-15</td>
      <td headers="time" class="gt_row gt_right">14:40</td>
      <td headers="datetime" class="gt_row gt_right">2018-02-02 14:33</td>
      <td headers="currency" class="gt_row gt_right" style="background-color: #B877CA; color: #FFFFFF;">17.950</td>
      <td headers="row" class="gt_row gt_left">row_2</td>
      <td headers="group" class="gt_row gt_left">grp_a</td></tr>
          <tr><td headers="num" class="gt_row gt_right" style="background-color: #66BC87; color: #000000;">3.333e+01</td>
      <td headers="char" class="gt_row gt_left">coconut</td>
      <td headers="fctr" class="gt_row gt_center">three</td>
      <td headers="date" class="gt_row gt_right">2015-03-15</td>
      <td headers="time" class="gt_row gt_right">15:45</td>
      <td headers="datetime" class="gt_row gt_right">2018-03-03 03:44</td>
      <td headers="currency" class="gt_row gt_right" style="background-color: #000000; color: #FFFFFF;">1.390</td>
      <td headers="row" class="gt_row gt_left">row_3</td>
      <td headers="group" class="gt_row gt_left">grp_a</td></tr>
          <tr><td headers="num" class="gt_row gt_right" style="background-color: #B877CA; color: #FFFFFF;">4.444e+02</td>
      <td headers="char" class="gt_row gt_left">durian</td>
      <td headers="fctr" class="gt_row gt_center">four</td>
      <td headers="date" class="gt_row gt_right">2015-04-15</td>
      <td headers="time" class="gt_row gt_right">16:50</td>
      <td headers="datetime" class="gt_row gt_right">2018-04-04 15:55</td>
      <td headers="currency" class="gt_row gt_right" style="background-color: #9E9E9E; color: #FFFFFF;">65100.000</td>
      <td headers="row" class="gt_row gt_left">row_4</td>
      <td headers="group" class="gt_row gt_left">grp_a</td></tr>
          <tr><td headers="num" class="gt_row gt_right" style="background-color: #B877CA; color: #FFFFFF;">5.550e+03</td>
      <td headers="char" class="gt_row gt_left">NA</td>
      <td headers="fctr" class="gt_row gt_center">five</td>
      <td headers="date" class="gt_row gt_right">2015-05-15</td>
      <td headers="time" class="gt_row gt_right">17:55</td>
      <td headers="datetime" class="gt_row gt_right">2018-05-05 04:00</td>
      <td headers="currency" class="gt_row gt_right" style="background-color: #9E9E9E; color: #FFFFFF;">1325.810</td>
      <td headers="row" class="gt_row gt_left">row_5</td>
      <td headers="group" class="gt_row gt_left">grp_b</td></tr>
          <tr><td headers="num" class="gt_row gt_right" style="background-color: #808080; color: #FFFFFF;">NA</td>
      <td headers="char" class="gt_row gt_left">fig</td>
      <td headers="fctr" class="gt_row gt_center">six</td>
      <td headers="date" class="gt_row gt_right">2015-06-15</td>
      <td headers="time" class="gt_row gt_right">NA</td>
      <td headers="datetime" class="gt_row gt_right">2018-06-06 16:11</td>
      <td headers="currency" class="gt_row gt_right" style="background-color: #66BC87; color: #000000;">13.255</td>
      <td headers="row" class="gt_row gt_left">row_6</td>
      <td headers="group" class="gt_row gt_left">grp_b</td></tr>
          <tr><td headers="num" class="gt_row gt_right" style="background-color: #9E9E9E; color: #FFFFFF;">7.770e+05</td>
      <td headers="char" class="gt_row gt_left">grapefruit</td>
      <td headers="fctr" class="gt_row gt_center">seven</td>
      <td headers="date" class="gt_row gt_right">NA</td>
      <td headers="time" class="gt_row gt_right">19:10</td>
      <td headers="datetime" class="gt_row gt_right">2018-07-07 05:22</td>
      <td headers="currency" class="gt_row gt_right" style="background-color: #808080; color: #FFFFFF;">NA</td>
      <td headers="row" class="gt_row gt_left">row_7</td>
      <td headers="group" class="gt_row gt_left">grp_b</td></tr>
          <tr><td headers="num" class="gt_row gt_right" style="background-color: #9E9E9E; color: #FFFFFF;">8.880e+06</td>
      <td headers="char" class="gt_row gt_left">honeydew</td>
      <td headers="fctr" class="gt_row gt_center">eight</td>
      <td headers="date" class="gt_row gt_right">2015-08-15</td>
      <td headers="time" class="gt_row gt_right">20:20</td>
      <td headers="datetime" class="gt_row gt_right">NA</td>
      <td headers="currency" class="gt_row gt_right" style="background-color: #000000; color: #FFFFFF;">0.440</td>
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
          <tr><td headers="num" class="gt_row gt_right" style="background-color: #000000; color: #FFFFFF;">1.111e-01</td>
      <td headers="char" class="gt_row gt_left" style="background-color: #000000; color: #FFFFFF;">apricot</td>
      <td headers="fctr" class="gt_row gt_center" style="background-color: #000000; color: #FFFFFF;">one</td>
      <td headers="date" class="gt_row gt_right" style="background-color: #000000; color: #FFFFFF;">2015-01-15</td>
      <td headers="time" class="gt_row gt_right" style="background-color: #000000; color: #FFFFFF;">13:35</td>
      <td headers="datetime" class="gt_row gt_right" style="background-color: #000000; color: #FFFFFF;">2018-01-01 02:22</td>
      <td headers="currency" class="gt_row gt_right" style="background-color: #28E2E5; color: #000000;">49.950</td>
      <td headers="row" class="gt_row gt_left" style="background-color: #000000; color: #FFFFFF;">row_1</td>
      <td headers="group" class="gt_row gt_left" style="background-color: #000000; color: #FFFFFF;">grp_a</td></tr>
          <tr><td headers="num" class="gt_row gt_right" style="background-color: #DF536B; color: #FFFFFF;">2.222e+00</td>
      <td headers="char" class="gt_row gt_left" style="background-color: #DF536B; color: #FFFFFF;">banana</td>
      <td headers="fctr" class="gt_row gt_center" style="background-color: #BC485B; color: #FFFFFF;">two</td>
      <td headers="date" class="gt_row gt_right" style="background-color: #DF536B; color: #FFFFFF;">2015-02-15</td>
      <td headers="time" class="gt_row gt_right" style="background-color: #DF536B; color: #FFFFFF;">14:40</td>
      <td headers="datetime" class="gt_row gt_right" style="background-color: #DF536B; color: #FFFFFF;">2018-02-02 14:33</td>
      <td headers="currency" class="gt_row gt_right" style="background-color: #2297E6; color: #FFFFFF;">17.950</td>
      <td headers="row" class="gt_row gt_left" style="background-color: #BC485B; color: #FFFFFF;">row_2</td>
      <td headers="group" class="gt_row gt_left" style="background-color: #000000; color: #FFFFFF;">grp_a</td></tr>
          <tr><td headers="num" class="gt_row gt_right" style="background-color: #61D04F; color: #000000;">3.333e+01</td>
      <td headers="char" class="gt_row gt_left" style="background-color: #61D04F; color: #000000;">coconut</td>
      <td headers="fctr" class="gt_row gt_center" style="background-color: #98B359; color: #000000;">three</td>
      <td headers="date" class="gt_row gt_right" style="background-color: #61D04F; color: #000000;">2015-03-15</td>
      <td headers="time" class="gt_row gt_right" style="background-color: #61D04F; color: #000000;">15:45</td>
      <td headers="datetime" class="gt_row gt_right" style="background-color: #61D04F; color: #000000;">2018-03-03 03:44</td>
      <td headers="currency" class="gt_row gt_right" style="background-color: #DF536B; color: #FFFFFF;">1.390</td>
      <td headers="row" class="gt_row gt_left" style="background-color: #98B359; color: #000000;">row_3</td>
      <td headers="group" class="gt_row gt_left" style="background-color: #000000; color: #FFFFFF;">grp_a</td></tr>
          <tr><td headers="num" class="gt_row gt_right" style="background-color: #2297E6; color: #FFFFFF;">4.444e+02</td>
      <td headers="char" class="gt_row gt_left" style="background-color: #2297E6; color: #FFFFFF;">durian</td>
      <td headers="fctr" class="gt_row gt_center" style="background-color: #5FAFAA; color: #FFFFFF;">four</td>
      <td headers="date" class="gt_row gt_right" style="background-color: #2297E6; color: #FFFFFF;">2015-04-15</td>
      <td headers="time" class="gt_row gt_right" style="background-color: #2297E6; color: #FFFFFF;">16:50</td>
      <td headers="datetime" class="gt_row gt_right" style="background-color: #2297E6; color: #FFFFFF;">2018-04-04 15:55</td>
      <td headers="currency" class="gt_row gt_right" style="background-color: #F5C710; color: #000000;">65100.000</td>
      <td headers="row" class="gt_row gt_left" style="background-color: #5FAFAA; color: #FFFFFF;">row_4</td>
      <td headers="group" class="gt_row gt_left" style="background-color: #000000; color: #FFFFFF;">grp_a</td></tr>
          <tr><td headers="num" class="gt_row gt_right" style="background-color: #28E2E5; color: #000000;">5.550e+03</td>
      <td headers="char" class="gt_row gt_left" style="background-color: #808080; color: #FFFFFF;">NA</td>
      <td headers="fctr" class="gt_row gt_center" style="background-color: #2FB7E6; color: #000000;">five</td>
      <td headers="date" class="gt_row gt_right" style="background-color: #28E2E5; color: #000000;">2015-05-15</td>
      <td headers="time" class="gt_row gt_right" style="background-color: #28E2E5; color: #000000;">17:55</td>
      <td headers="datetime" class="gt_row gt_right" style="background-color: #28E2E5; color: #000000;">2018-05-05 04:00</td>
      <td headers="currency" class="gt_row gt_right" style="background-color: #CD0BBC; color: #FFFFFF;">1325.810</td>
      <td headers="row" class="gt_row gt_left" style="background-color: #2FB7E6; color: #000000;">row_5</td>
      <td headers="group" class="gt_row gt_left" style="background-color: #DF536B; color: #FFFFFF;">grp_b</td></tr>
          <tr><td headers="num" class="gt_row gt_right" style="background-color: #808080; color: #FFFFFF;">NA</td>
      <td headers="char" class="gt_row gt_left" style="background-color: #28E2E5; color: #000000;">fig</td>
      <td headers="fctr" class="gt_row gt_center" style="background-color: #89B7DA; color: #000000;">six</td>
      <td headers="date" class="gt_row gt_right" style="background-color: #CD0BBC; color: #FFFFFF;">2015-06-15</td>
      <td headers="time" class="gt_row gt_right" style="background-color: #808080; color: #FFFFFF;">NA</td>
      <td headers="datetime" class="gt_row gt_right" style="background-color: #CD0BBC; color: #FFFFFF;">2018-06-06 16:11</td>
      <td headers="currency" class="gt_row gt_right" style="background-color: #61D04F; color: #000000;">13.255</td>
      <td headers="row" class="gt_row gt_left" style="background-color: #89B7DA; color: #000000;">row_6</td>
      <td headers="group" class="gt_row gt_left" style="background-color: #DF536B; color: #FFFFFF;">grp_b</td></tr>
          <tr><td headers="num" class="gt_row gt_right" style="background-color: #CD0BBC; color: #FFFFFF;">7.770e+05</td>
      <td headers="char" class="gt_row gt_left" style="background-color: #CD0BBC; color: #FFFFFF;">grapefruit</td>
      <td headers="fctr" class="gt_row gt_center" style="background-color: #D83FAB; color: #FFFFFF;">seven</td>
      <td headers="date" class="gt_row gt_right" style="background-color: #808080; color: #FFFFFF;">NA</td>
      <td headers="time" class="gt_row gt_right" style="background-color: #CD0BBC; color: #FFFFFF;">19:10</td>
      <td headers="datetime" class="gt_row gt_right" style="background-color: #F5C710; color: #000000;">2018-07-07 05:22</td>
      <td headers="currency" class="gt_row gt_right" style="background-color: #808080; color: #FFFFFF;">NA</td>
      <td headers="row" class="gt_row gt_left" style="background-color: #D83FAB; color: #FFFFFF;">row_7</td>
      <td headers="group" class="gt_row gt_left" style="background-color: #DF536B; color: #FFFFFF;">grp_b</td></tr>
          <tr><td headers="num" class="gt_row gt_right" style="background-color: #F5C710; color: #000000;">8.880e+06</td>
      <td headers="char" class="gt_row gt_left" style="background-color: #F5C710; color: #000000;">honeydew</td>
      <td headers="fctr" class="gt_row gt_center" style="background-color: #F5C710; color: #000000;">eight</td>
      <td headers="date" class="gt_row gt_right" style="background-color: #F5C710; color: #000000;">2015-08-15</td>
      <td headers="time" class="gt_row gt_right" style="background-color: #F5C710; color: #000000;">20:20</td>
      <td headers="datetime" class="gt_row gt_right" style="background-color: #808080; color: #FFFFFF;">NA</td>
      <td headers="currency" class="gt_row gt_right" style="background-color: #000000; color: #FFFFFF;">0.440</td>
      <td headers="row" class="gt_row gt_left" style="background-color: #F5C710; color: #000000;">row_8</td>
      <td headers="group" class="gt_row gt_left" style="background-color: #DF536B; color: #FFFFFF;">grp_b</td></tr>
        </tbody>
        
      </table>

---

    Code
      cat(render_as_html(gt_tbl))
    Output
      <table class="gt_table" data-quarto-disable-processing="false" data-quarto-bootstrap="false">
        <thead>
          <tr class="gt_col_headings">
            <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id="a">a</th>
          </tr>
        </thead>
        <tbody class="gt_table_body">
          <tr><td headers="a" class="gt_row gt_right" style="background-color: #440154; color: #FFFFFF;">1</td></tr>
          <tr><td headers="a" class="gt_row gt_right" style="background-color: #440154; color: #FFFFFF;">2</td></tr>
          <tr><td headers="a" class="gt_row gt_right" style="background-color: #440154; color: #FFFFFF;">3</td></tr>
          <tr><td headers="a" class="gt_row gt_right" style="background-color: #440154; color: #FFFFFF;">4</td></tr>
          <tr><td headers="a" class="gt_row gt_right" style="background-color: #440154; color: #FFFFFF;">5</td></tr>
          <tr><td headers="a" class="gt_row gt_right" style="background-color: #31688E; color: #FFFFFF;">6</td></tr>
          <tr><td headers="a" class="gt_row gt_right" style="background-color: #31688E; color: #FFFFFF;">7</td></tr>
          <tr><td headers="a" class="gt_row gt_right" style="background-color: #31688E; color: #FFFFFF;">8</td></tr>
          <tr><td headers="a" class="gt_row gt_right" style="background-color: #31688E; color: #FFFFFF;">9</td></tr>
          <tr><td headers="a" class="gt_row gt_right" style="background-color: #31688E; color: #FFFFFF;">10</td></tr>
          <tr><td headers="a" class="gt_row gt_right" style="background-color: #35B779; color: #FFFFFF;">11</td></tr>
          <tr><td headers="a" class="gt_row gt_right" style="background-color: #35B779; color: #FFFFFF;">12</td></tr>
          <tr><td headers="a" class="gt_row gt_right" style="background-color: #35B779; color: #FFFFFF;">13</td></tr>
          <tr><td headers="a" class="gt_row gt_right" style="background-color: #35B779; color: #FFFFFF;">14</td></tr>
          <tr><td headers="a" class="gt_row gt_right" style="background-color: #35B779; color: #FFFFFF;">15</td></tr>
          <tr><td headers="a" class="gt_row gt_right" style="background-color: #FDE725; color: #000000;">16</td></tr>
          <tr><td headers="a" class="gt_row gt_right" style="background-color: #FDE725; color: #000000;">17</td></tr>
          <tr><td headers="a" class="gt_row gt_right" style="background-color: #FDE725; color: #000000;">18</td></tr>
          <tr><td headers="a" class="gt_row gt_right" style="background-color: #FDE725; color: #000000;">19</td></tr>
          <tr><td headers="a" class="gt_row gt_right" style="background-color: #FDE725; color: #000000;">20</td></tr>
        </tbody>
        
      </table>

---

    Code
      cat(render_as_html(gt_tbl))
    Output
      <table class="gt_table" data-quarto-disable-processing="false" data-quarto-bootstrap="false">
        <thead>
          <tr class="gt_col_headings">
            <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id="a">a</th>
          </tr>
        </thead>
        <tbody class="gt_table_body">
          <tr><td headers="a" class="gt_row gt_right" style="background-color: #440154; color: #FFFFFF;">1</td></tr>
          <tr><td headers="a" class="gt_row gt_right" style="background-color: #440154; color: #FFFFFF;">2</td></tr>
          <tr><td headers="a" class="gt_row gt_right" style="background-color: #440154; color: #FFFFFF;">3</td></tr>
          <tr><td headers="a" class="gt_row gt_right" style="background-color: #440154; color: #FFFFFF;">4</td></tr>
          <tr><td headers="a" class="gt_row gt_right" style="background-color: #3B528B; color: #FFFFFF;">5</td></tr>
          <tr><td headers="a" class="gt_row gt_right" style="background-color: #3B528B; color: #FFFFFF;">6</td></tr>
          <tr><td headers="a" class="gt_row gt_right" style="background-color: #3B528B; color: #FFFFFF;">7</td></tr>
          <tr><td headers="a" class="gt_row gt_right" style="background-color: #3B528B; color: #FFFFFF;">8</td></tr>
          <tr><td headers="a" class="gt_row gt_right" style="background-color: #21908D; color: #FFFFFF;">9</td></tr>
          <tr><td headers="a" class="gt_row gt_right" style="background-color: #21908D; color: #FFFFFF;">10</td></tr>
          <tr><td headers="a" class="gt_row gt_right" style="background-color: #21908D; color: #FFFFFF;">11</td></tr>
          <tr><td headers="a" class="gt_row gt_right" style="background-color: #21908D; color: #FFFFFF;">12</td></tr>
          <tr><td headers="a" class="gt_row gt_right" style="background-color: #5DC863; color: #000000;">13</td></tr>
          <tr><td headers="a" class="gt_row gt_right" style="background-color: #5DC863; color: #000000;">14</td></tr>
          <tr><td headers="a" class="gt_row gt_right" style="background-color: #5DC863; color: #000000;">15</td></tr>
          <tr><td headers="a" class="gt_row gt_right" style="background-color: #5DC863; color: #000000;">16</td></tr>
          <tr><td headers="a" class="gt_row gt_right" style="background-color: #FDE725; color: #000000;">17</td></tr>
          <tr><td headers="a" class="gt_row gt_right" style="background-color: #FDE725; color: #000000;">18</td></tr>
          <tr><td headers="a" class="gt_row gt_right" style="background-color: #FDE725; color: #000000;">19</td></tr>
          <tr><td headers="a" class="gt_row gt_right" style="background-color: #FDE725; color: #000000;">20</td></tr>
        </tbody>
        
      </table>

---

    Code
      cat(render_as_html(gt_tbl))
    Output
      <table class="gt_table" data-quarto-disable-processing="false" data-quarto-bootstrap="false">
        <thead>
          <tr class="gt_col_headings">
            <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id="a">a</th>
          </tr>
        </thead>
        <tbody class="gt_table_body">
          <tr><td headers="a" class="gt_row gt_right" style="background-color: #440154; color: #FFFFFF;">1</td></tr>
          <tr><td headers="a" class="gt_row gt_right" style="background-color: #440154; color: #FFFFFF;">2</td></tr>
          <tr><td headers="a" class="gt_row gt_right" style="background-color: #440154; color: #FFFFFF;">3</td></tr>
          <tr><td headers="a" class="gt_row gt_right" style="background-color: #440154; color: #FFFFFF;">4</td></tr>
          <tr><td headers="a" class="gt_row gt_right" style="background-color: #3B528B; color: #FFFFFF;">5</td></tr>
          <tr><td headers="a" class="gt_row gt_right" style="background-color: #3B528B; color: #FFFFFF;">6</td></tr>
          <tr><td headers="a" class="gt_row gt_right" style="background-color: #3B528B; color: #FFFFFF;">7</td></tr>
          <tr><td headers="a" class="gt_row gt_right" style="background-color: #3B528B; color: #FFFFFF;">8</td></tr>
          <tr><td headers="a" class="gt_row gt_right" style="background-color: #21908D; color: #FFFFFF;">9</td></tr>
          <tr><td headers="a" class="gt_row gt_right" style="background-color: #21908D; color: #FFFFFF;">10</td></tr>
          <tr><td headers="a" class="gt_row gt_right" style="background-color: #21908D; color: #FFFFFF;">11</td></tr>
          <tr><td headers="a" class="gt_row gt_right" style="background-color: #21908D; color: #FFFFFF;">12</td></tr>
          <tr><td headers="a" class="gt_row gt_right" style="background-color: #5DC863; color: #000000;">13</td></tr>
          <tr><td headers="a" class="gt_row gt_right" style="background-color: #5DC863; color: #000000;">14</td></tr>
          <tr><td headers="a" class="gt_row gt_right" style="background-color: #5DC863; color: #000000;">15</td></tr>
          <tr><td headers="a" class="gt_row gt_right" style="background-color: #5DC863; color: #000000;">16</td></tr>
          <tr><td headers="a" class="gt_row gt_right" style="background-color: #FDE725; color: #000000;">17</td></tr>
          <tr><td headers="a" class="gt_row gt_right" style="background-color: #FDE725; color: #000000;">18</td></tr>
          <tr><td headers="a" class="gt_row gt_right" style="background-color: #FDE725; color: #000000;">19</td></tr>
          <tr><td headers="a" class="gt_row gt_right" style="background-color: #FDE725; color: #000000;">20</td></tr>
        </tbody>
        
      </table>

---

    Code
      cat(render_as_html(gt_tbl))
    Output
      <table class="gt_table" data-quarto-disable-processing="false" data-quarto-bootstrap="false">
        <thead>
          <tr class="gt_col_headings">
            <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id="a">a</th>
          </tr>
        </thead>
        <tbody class="gt_table_body">
          <tr><td headers="a" class="gt_row gt_right" style="background-color: #440154; color: #FFFFFF;">1</td></tr>
          <tr><td headers="a" class="gt_row gt_right" style="background-color: #440154; color: #FFFFFF;">2</td></tr>
          <tr><td headers="a" class="gt_row gt_right" style="background-color: #482878; color: #FFFFFF;">3</td></tr>
          <tr><td headers="a" class="gt_row gt_right" style="background-color: #482878; color: #FFFFFF;">4</td></tr>
          <tr><td headers="a" class="gt_row gt_right" style="background-color: #3E4A89; color: #FFFFFF;">5</td></tr>
          <tr><td headers="a" class="gt_row gt_right" style="background-color: #3E4A89; color: #FFFFFF;">6</td></tr>
          <tr><td headers="a" class="gt_row gt_right" style="background-color: #31688E; color: #FFFFFF;">7</td></tr>
          <tr><td headers="a" class="gt_row gt_right" style="background-color: #31688E; color: #FFFFFF;">8</td></tr>
          <tr><td headers="a" class="gt_row gt_right" style="background-color: #26828E; color: #FFFFFF;">9</td></tr>
          <tr><td headers="a" class="gt_row gt_right" style="background-color: #26828E; color: #FFFFFF;">10</td></tr>
          <tr><td headers="a" class="gt_row gt_right" style="background-color: #1F9E89; color: #FFFFFF;">11</td></tr>
          <tr><td headers="a" class="gt_row gt_right" style="background-color: #1F9E89; color: #FFFFFF;">12</td></tr>
          <tr><td headers="a" class="gt_row gt_right" style="background-color: #35B779; color: #FFFFFF;">13</td></tr>
          <tr><td headers="a" class="gt_row gt_right" style="background-color: #35B779; color: #FFFFFF;">14</td></tr>
          <tr><td headers="a" class="gt_row gt_right" style="background-color: #6DCD59; color: #000000;">15</td></tr>
          <tr><td headers="a" class="gt_row gt_right" style="background-color: #6DCD59; color: #000000;">16</td></tr>
          <tr><td headers="a" class="gt_row gt_right" style="background-color: #B4DE2C; color: #000000;">17</td></tr>
          <tr><td headers="a" class="gt_row gt_right" style="background-color: #B4DE2C; color: #000000;">18</td></tr>
          <tr><td headers="a" class="gt_row gt_right" style="background-color: #FDE725; color: #000000;">19</td></tr>
          <tr><td headers="a" class="gt_row gt_right" style="background-color: #FDE725; color: #000000;">20</td></tr>
        </tbody>
        
      </table>

# The direction of coloring can be column-wise or row-wise

    Code
      cat(render_as_html(gt_tbl))
    Output
      <table class="gt_table" data-quarto-disable-processing="false" data-quarto-bootstrap="false">
        <thead>
          <tr class="gt_col_headings">
            <th class="gt_col_heading gt_columns_bottom_border gt_left" rowspan="1" colspan="1" scope="col" id="a::stub"></th>
            <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id="a0530">0530</th>
            <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id="a0600">0600</th>
            <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id="a0630">0630</th>
            <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id="a0700">0700</th>
            <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id="a0730">0730</th>
            <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id="a0800">0800</th>
            <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id="a0830">0830</th>
            <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id="a0900">0900</th>
            <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id="a0930">0930</th>
            <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id="a1000">1000</th>
            <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id="a1030">1030</th>
            <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id="a1100">1100</th>
            <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id="a1130">1130</th>
            <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id="a1200">1200</th>
          </tr>
        </thead>
        <tbody class="gt_table_body">
          <tr><th id="stub_1_1" scope="row" class="gt_row gt_center gt_stub">jan</th>
      <td headers="stub_1_1 0530" class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;"><br /></td>
      <td headers="stub_1_1 0600" class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;"><br /></td>
      <td headers="stub_1_1 0630" class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;"><br /></td>
      <td headers="stub_1_1 0700" class="gt_row gt_right" style="background-color: #4D4D4D; color: #FFFFFF;">84.9</td>
      <td headers="stub_1_1 0730" class="gt_row gt_right" style="background-color: #4D4D4D; color: #FFFFFF;">78.7</td>
      <td headers="stub_1_1 0800" class="gt_row gt_right" style="background-color: #4D4D4D; color: #FFFFFF;">72.7</td>
      <td headers="stub_1_1 0830" class="gt_row gt_right" style="background-color: #4D4D4D; color: #FFFFFF;">66.1</td>
      <td headers="stub_1_1 0900" class="gt_row gt_right" style="background-color: #4D4D4D; color: #FFFFFF;">61.5</td>
      <td headers="stub_1_1 0930" class="gt_row gt_right" style="background-color: #4D4D4D; color: #FFFFFF;">56.5</td>
      <td headers="stub_1_1 1000" class="gt_row gt_right" style="background-color: #4D4D4D; color: #FFFFFF;">52.1</td>
      <td headers="stub_1_1 1030" class="gt_row gt_right" style="background-color: #4D4D4D; color: #FFFFFF;">48.3</td>
      <td headers="stub_1_1 1100" class="gt_row gt_right" style="background-color: #4D4D4D; color: #FFFFFF;">45.5</td>
      <td headers="stub_1_1 1130" class="gt_row gt_right" style="background-color: #4D4D4D; color: #FFFFFF;">43.6</td>
      <td headers="stub_1_1 1200" class="gt_row gt_right" style="background-color: #4D4D4D; color: #FFFFFF;">43.0</td></tr>
          <tr><th id="stub_1_2" scope="row" class="gt_row gt_center gt_stub">feb</th>
      <td headers="stub_1_2 0530" class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;"><br /></td>
      <td headers="stub_1_2 0600" class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;"><br /></td>
      <td headers="stub_1_2 0630" class="gt_row gt_right" style="background-color: #4D4D4D; color: #FFFFFF;">88.9</td>
      <td headers="stub_1_2 0700" class="gt_row gt_right" style="background-color: #564181; color: #FFFFFF;">82.5</td>
      <td headers="stub_1_2 0730" class="gt_row gt_right" style="background-color: #563F89; color: #FFFFFF;">75.8</td>
      <td headers="stub_1_2 0800" class="gt_row gt_right" style="background-color: #563F8B; color: #FFFFFF;">69.6</td>
      <td headers="stub_1_2 0830" class="gt_row gt_right" style="background-color: #564084; color: #FFFFFF;">63.3</td>
      <td headers="stub_1_2 0900" class="gt_row gt_right" style="background-color: #563D8F; color: #FFFFFF;">57.7</td>
      <td headers="stub_1_2 0930" class="gt_row gt_right" style="background-color: #563D91; color: #FFFFFF;">52.2</td>
      <td headers="stub_1_2 1000" class="gt_row gt_right" style="background-color: #563D90; color: #FFFFFF;">47.4</td>
      <td headers="stub_1_2 1030" class="gt_row gt_right" style="background-color: #563D8E; color: #FFFFFF;">43.1</td>
      <td headers="stub_1_2 1100" class="gt_row gt_right" style="background-color: #563F89; color: #FFFFFF;">40.0</td>
      <td headers="stub_1_2 1130" class="gt_row gt_right" style="background-color: #564083; color: #FFFFFF;">37.8</td>
      <td headers="stub_1_2 1200" class="gt_row gt_right" style="background-color: #56427D; color: #FFFFFF;">37.2</td></tr>
          <tr><th id="stub_1_3" scope="row" class="gt_row gt_center gt_stub">mar</th>
      <td headers="stub_1_3 0530" class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;"><br /></td>
      <td headers="stub_1_3 0600" class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;"><br /></td>
      <td headers="stub_1_3 0630" class="gt_row gt_right" style="background-color: #5538A0; color: #FFFFFF;">85.7</td>
      <td headers="stub_1_3 0700" class="gt_row gt_right" style="background-color: #4424D4; color: #FFFFFF;">78.8</td>
      <td headers="stub_1_3 0730" class="gt_row gt_right" style="background-color: #3E20DD; color: #FFFFFF;">72.0</td>
      <td headers="stub_1_3 0800" class="gt_row gt_right" style="background-color: #3519E7; color: #FFFFFF;">65.2</td>
      <td headers="stub_1_3 0830" class="gt_row gt_right" style="background-color: #371BE5; color: #FFFFFF;">58.6</td>
      <td headers="stub_1_3 0900" class="gt_row gt_right" style="background-color: #2710F2; color: #FFFFFF;">52.3</td>
      <td headers="stub_1_3 0930" class="gt_row gt_right" style="background-color: #1E0BF7; color: #FFFFFF;">46.2</td>
      <td headers="stub_1_3 1000" class="gt_row gt_right" style="background-color: #1A09F9; color: #FFFFFF;">40.5</td>
      <td headers="stub_1_3 1030" class="gt_row gt_right" style="background-color: #240FF4; color: #FFFFFF;">35.5</td>
      <td headers="stub_1_3 1100" class="gt_row gt_right" style="background-color: #2F16EC; color: #FFFFFF;">31.4</td>
      <td headers="stub_1_3 1130" class="gt_row gt_right" style="background-color: #3D1FDE; color: #FFFFFF;">28.6</td>
      <td headers="stub_1_3 1200" class="gt_row gt_right" style="background-color: #4727CF; color: #FFFFFF;">27.7</td></tr>
          <tr><th id="stub_1_4" scope="row" class="gt_row gt_center gt_stub">apr</th>
      <td headers="stub_1_4 0530" class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;"><br /></td>
      <td headers="stub_1_4 0600" class="gt_row gt_right" style="background-color: #4D4D4D; color: #FFFFFF;">88.5</td>
      <td headers="stub_1_4 0630" class="gt_row gt_right" style="background-color: #6E1AE6; color: #FFFFFF;">81.5</td>
      <td headers="stub_1_4 0700" class="gt_row gt_right" style="background-color: #A93EBD; color: #FFFFFF;">74.4</td>
      <td headers="stub_1_4 0730" class="gt_row gt_right" style="background-color: #B345B3; color: #FFFFFF;">67.4</td>
      <td headers="stub_1_4 0800" class="gt_row gt_right" style="background-color: #BE4FA6; color: #FFFFFF;">60.3</td>
      <td headers="stub_1_4 0830" class="gt_row gt_right" style="background-color: #C152A2; color: #FFFFFF;">53.4</td>
      <td headers="stub_1_4 0900" class="gt_row gt_right" style="background-color: #CB5C96; color: #FFFFFF;">46.5</td>
      <td headers="stub_1_4 0930" class="gt_row gt_right" style="background-color: #D1628D; color: #FFFFFF;">39.7</td>
      <td headers="stub_1_4 1000" class="gt_row gt_right" style="background-color: #D2648B; color: #FFFFFF;">33.2</td>
      <td headers="stub_1_4 1030" class="gt_row gt_right" style="background-color: #D2648B; color: #FFFFFF;">26.9</td>
      <td headers="stub_1_4 1100" class="gt_row gt_right" style="background-color: #CE6091; color: #FFFFFF;">21.3</td>
      <td headers="stub_1_4 1130" class="gt_row gt_right" style="background-color: #C051A3; color: #FFFFFF;">17.2</td>
      <td headers="stub_1_4 1200" class="gt_row gt_right" style="background-color: #AB3FBB; color: #FFFFFF;">15.5</td></tr>
          <tr><th id="stub_1_5" scope="row" class="gt_row gt_center gt_stub">may</th>
      <td headers="stub_1_5 0530" class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;"><br /></td>
      <td headers="stub_1_5 0600" class="gt_row gt_right" style="background-color: #711CE5; color: #FFFFFF;">85.0</td>
      <td headers="stub_1_5 0630" class="gt_row gt_right" style="background-color: #D86B81; color: #FFFFFF;">78.2</td>
      <td headers="stub_1_5 0700" class="gt_row gt_right" style="background-color: #E67D68; color: #FFFFFF;">71.2</td>
      <td headers="stub_1_5 0730" class="gt_row gt_right" style="background-color: #E88063; color: #FFFFFF;">64.3</td>
      <td headers="stub_1_5 0800" class="gt_row gt_right" style="background-color: #ED8758; color: #FFFFFF;">57.2</td>
      <td headers="stub_1_5 0830" class="gt_row gt_right" style="background-color: #EF8B51; color: #000000;">50.2</td>
      <td headers="stub_1_5 0900" class="gt_row gt_right" style="background-color: #F28F49; color: #000000;">43.2</td>
      <td headers="stub_1_5 0930" class="gt_row gt_right" style="background-color: #F6953C; color: #000000;">36.1</td>
      <td headers="stub_1_5 1000" class="gt_row gt_right" style="background-color: #F89836; color: #000000;">29.1</td>
      <td headers="stub_1_5 1030" class="gt_row gt_right" style="background-color: #DA6D7F; color: #FFFFFF;">26.1</td>
      <td headers="stub_1_5 1100" class="gt_row gt_right" style="background-color: #FA9B2E; color: #000000;">15.2</td>
      <td headers="stub_1_5 1130" class="gt_row gt_right" style="background-color: #F89836; color: #000000;">8.8</td>
      <td headers="stub_1_5 1200" class="gt_row gt_right" style="background-color: #F18E4B; color: #000000;">5.0</td></tr>
          <tr><th id="stub_1_6" scope="row" class="gt_row gt_center gt_stub">jun</th>
      <td headers="stub_1_6 0530" class="gt_row gt_right" style="background-color: #4D4D4D; color: #FFFFFF;">89.2</td>
      <td headers="stub_1_6 0600" class="gt_row gt_right" style="background-color: #F49145; color: #000000;">82.7</td>
      <td headers="stub_1_6 0630" class="gt_row gt_right" style="background-color: #FB9E26; color: #000000;">76.0</td>
      <td headers="stub_1_6 0700" class="gt_row gt_right" style="background-color: #FDA11A; color: #000000;">69.3</td>
      <td headers="stub_1_6 0730" class="gt_row gt_right" style="background-color: #FDA11A; color: #000000;">62.5</td>
      <td headers="stub_1_6 0800" class="gt_row gt_right" style="background-color: #FDA119; color: #000000;">55.7</td>
      <td headers="stub_1_6 0830" class="gt_row gt_right" style="background-color: #FEA30F; color: #000000;">48.8</td>
      <td headers="stub_1_6 0900" class="gt_row gt_right" style="background-color: #FEA30D; color: #000000;">41.9</td>
      <td headers="stub_1_6 0930" class="gt_row gt_right" style="background-color: #FFA500; color: #000000;">35.0</td>
      <td headers="stub_1_6 1000" class="gt_row gt_right" style="background-color: #FFA500; color: #000000;">28.1</td>
      <td headers="stub_1_6 1030" class="gt_row gt_right" style="background-color: #FFA500; color: #000000;">21.1</td>
      <td headers="stub_1_6 1100" class="gt_row gt_right" style="background-color: #FFA500; color: #000000;">14.2</td>
      <td headers="stub_1_6 1130" class="gt_row gt_right" style="background-color: #FFA500; color: #000000;">7.3</td>
      <td headers="stub_1_6 1200" class="gt_row gt_right" style="background-color: #FFA407; color: #000000;">2.0</td></tr>
          <tr><th id="stub_1_7" scope="row" class="gt_row gt_center gt_stub">jul</th>
      <td headers="stub_1_7 0530" class="gt_row gt_right" style="background-color: #FFA500; color: #000000;">88.8</td>
      <td headers="stub_1_7 0600" class="gt_row gt_right" style="background-color: #FFA500; color: #000000;">82.3</td>
      <td headers="stub_1_7 0630" class="gt_row gt_right" style="background-color: #FFA500; color: #000000;">75.7</td>
      <td headers="stub_1_7 0700" class="gt_row gt_right" style="background-color: #FFA500; color: #000000;">69.1</td>
      <td headers="stub_1_7 0730" class="gt_row gt_right" style="background-color: #FFA500; color: #000000;">62.3</td>
      <td headers="stub_1_7 0800" class="gt_row gt_right" style="background-color: #FFA500; color: #000000;">55.5</td>
      <td headers="stub_1_7 0830" class="gt_row gt_right" style="background-color: #FFA500; color: #000000;">48.7</td>
      <td headers="stub_1_7 0900" class="gt_row gt_right" style="background-color: #FFA500; color: #000000;">41.8</td>
      <td headers="stub_1_7 0930" class="gt_row gt_right" style="background-color: #FFA500; color: #000000;">35.0</td>
      <td headers="stub_1_7 1000" class="gt_row gt_right" style="background-color: #FFA500; color: #000000;">28.1</td>
      <td headers="stub_1_7 1030" class="gt_row gt_right" style="background-color: #FEA40A; color: #000000;">21.2</td>
      <td headers="stub_1_7 1100" class="gt_row gt_right" style="background-color: #FEA409; color: #000000;">14.3</td>
      <td headers="stub_1_7 1130" class="gt_row gt_right" style="background-color: #FDA218; color: #000000;">7.7</td>
      <td headers="stub_1_7 1200" class="gt_row gt_right" style="background-color: #FA9C2C; color: #000000;">3.1</td></tr>
          <tr><th id="stub_1_8" scope="row" class="gt_row gt_center gt_stub">aug</th>
      <td headers="stub_1_8 0530" class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;"><br /></td>
      <td headers="stub_1_8 0600" class="gt_row gt_right" style="background-color: #CA5B97; color: #FFFFFF;">83.8</td>
      <td headers="stub_1_8 0630" class="gt_row gt_right" style="background-color: #EB855B; color: #FFFFFF;">77.1</td>
      <td headers="stub_1_8 0700" class="gt_row gt_right" style="background-color: #F39048; color: #000000;">70.2</td>
      <td headers="stub_1_8 0730" class="gt_row gt_right" style="background-color: #F49243; color: #000000;">63.3</td>
      <td headers="stub_1_8 0800" class="gt_row gt_right" style="background-color: #F6953D; color: #000000;">56.4</td>
      <td headers="stub_1_8 0830" class="gt_row gt_right" style="background-color: #F89935; color: #000000;">49.4</td>
      <td headers="stub_1_8 0900" class="gt_row gt_right" style="background-color: #FA9C2D; color: #000000;">42.4</td>
      <td headers="stub_1_8 0930" class="gt_row gt_right" style="background-color: #FC9F22; color: #000000;">35.4</td>
      <td headers="stub_1_8 1000" class="gt_row gt_right" style="background-color: #FEA214; color: #000000;">28.3</td>
      <td headers="stub_1_8 1030" class="gt_row gt_right" style="background-color: #FEA312; color: #000000;">21.3</td>
      <td headers="stub_1_8 1100" class="gt_row gt_right" style="background-color: #FEA409; color: #000000;">14.3</td>
      <td headers="stub_1_8 1130" class="gt_row gt_right" style="background-color: #FFA500; color: #000000;">7.3</td>
      <td headers="stub_1_8 1200" class="gt_row gt_right" style="background-color: #FFA500; color: #000000;">1.9</td></tr>
          <tr><th id="stub_1_9" scope="row" class="gt_row gt_center gt_stub">sep</th>
      <td headers="stub_1_9 0530" class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;"><br /></td>
      <td headers="stub_1_9 0600" class="gt_row gt_right" style="background-color: #563C95; color: #FFFFFF;">87.2</td>
      <td headers="stub_1_9 0630" class="gt_row gt_right" style="background-color: #A73CBF; color: #FFFFFF;">80.2</td>
      <td headers="stub_1_9 0700" class="gt_row gt_right" style="background-color: #C5569E; color: #FFFFFF;">73.2</td>
      <td headers="stub_1_9 0730" class="gt_row gt_right" style="background-color: #CD5E93; color: #FFFFFF;">66.1</td>
      <td headers="stub_1_9 0800" class="gt_row gt_right" style="background-color: #D36589; color: #FFFFFF;">59.1</td>
      <td headers="stub_1_9 0830" class="gt_row gt_right" style="background-color: #D76984; color: #FFFFFF;">52.1</td>
      <td headers="stub_1_9 0900" class="gt_row gt_right" style="background-color: #DE7278; color: #FFFFFF;">45.1</td>
      <td headers="stub_1_9 0930" class="gt_row gt_right" style="background-color: #E3796D; color: #FFFFFF;">38.1</td>
      <td headers="stub_1_9 1000" class="gt_row gt_right" style="background-color: #E67C68; color: #FFFFFF;">31.3</td>
      <td headers="stub_1_9 1030" class="gt_row gt_right" style="background-color: #E67D68; color: #FFFFFF;">24.7</td>
      <td headers="stub_1_9 1100" class="gt_row gt_right" style="background-color: #E47A6C; color: #FFFFFF;">18.6</td>
      <td headers="stub_1_9 1130" class="gt_row gt_right" style="background-color: #DC6F7B; color: #FFFFFF;">13.7</td>
      <td headers="stub_1_9 1200" class="gt_row gt_right" style="background-color: #CC5D95; color: #FFFFFF;">11.6</td></tr>
          <tr><th id="stub_1_10" scope="row" class="gt_row gt_center gt_stub">oct</th>
      <td headers="stub_1_10 0530" class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;"><br /></td>
      <td headers="stub_1_10 0600" class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;"><br /></td>
      <td headers="stub_1_10 0630" class="gt_row gt_right" style="background-color: #4828CC; color: #FFFFFF;">84.1</td>
      <td headers="stub_1_10 0700" class="gt_row gt_right" style="background-color: #0D03FD; color: #FFFFFF;">77.1</td>
      <td headers="stub_1_10 0730" class="gt_row gt_right" style="background-color: #3E08F8; color: #FFFFFF;">70.2</td>
      <td headers="stub_1_10 0800" class="gt_row gt_right" style="background-color: #6114EC; color: #FFFFFF;">63.3</td>
      <td headers="stub_1_10 0830" class="gt_row gt_right" style="background-color: #6617EA; color: #FFFFFF;">56.5</td>
      <td headers="stub_1_10 0900" class="gt_row gt_right" style="background-color: #8224DB; color: #FFFFFF;">49.9</td>
      <td headers="stub_1_10 0930" class="gt_row gt_right" style="background-color: #8C2AD5; color: #FFFFFF;">43.5</td>
      <td headers="stub_1_10 1000" class="gt_row gt_right" style="background-color: #8E2BD3; color: #FFFFFF;">37.5</td>
      <td headers="stub_1_10 1030" class="gt_row gt_right" style="background-color: #8928D7; color: #FFFFFF;">32.0</td>
      <td headers="stub_1_10 1100" class="gt_row gt_right" style="background-color: #7B21DF; color: #FFFFFF;">27.4</td>
      <td headers="stub_1_10 1130" class="gt_row gt_right" style="background-color: #510EF2; color: #FFFFFF;">24.3</td>
      <td headers="stub_1_10 1200" class="gt_row gt_right" style="background-color: #1908F9; color: #FFFFFF;">23.1</td></tr>
          <tr><th id="stub_1_11" scope="row" class="gt_row gt_center gt_stub">nov</th>
      <td headers="stub_1_11 0530" class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;"><br /></td>
      <td headers="stub_1_11 0600" class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;"><br /></td>
      <td headers="stub_1_11 0630" class="gt_row gt_right" style="background-color: #544769; color: #FFFFFF;">87.8</td>
      <td headers="stub_1_11 0700" class="gt_row gt_right" style="background-color: #563A9B; color: #FFFFFF;">81.3</td>
      <td headers="stub_1_11 0730" class="gt_row gt_right" style="background-color: #5437A5; color: #FFFFFF;">74.5</td>
      <td headers="stub_1_11 0800" class="gt_row gt_right" style="background-color: #5437A5; color: #FFFFFF;">68.3</td>
      <td headers="stub_1_11 0830" class="gt_row gt_right" style="background-color: #5538A2; color: #FFFFFF;">61.8</td>
      <td headers="stub_1_11 0900" class="gt_row gt_right" style="background-color: #5334AD; color: #FFFFFF;">56.0</td>
      <td headers="stub_1_11 0930" class="gt_row gt_right" style="background-color: #5232B2; color: #FFFFFF;">50.2</td>
      <td headers="stub_1_11 1000" class="gt_row gt_right" style="background-color: #5233AF; color: #FFFFFF;">45.3</td>
      <td headers="stub_1_11 1030" class="gt_row gt_right" style="background-color: #5334AE; color: #FFFFFF;">40.7</td>
      <td headers="stub_1_11 1100" class="gt_row gt_right" style="background-color: #5436A6; color: #FFFFFF;">37.4</td>
      <td headers="stub_1_11 1130" class="gt_row gt_right" style="background-color: #55399D; color: #FFFFFF;">35.1</td>
      <td headers="stub_1_11 1200" class="gt_row gt_right" style="background-color: #563C95; color: #FFFFFF;">34.4</td></tr>
          <tr><th id="stub_1_12" scope="row" class="gt_row gt_center gt_stub">dec</th>
      <td headers="stub_1_12 0530" class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;"><br /></td>
      <td headers="stub_1_12 0600" class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;"><br /></td>
      <td headers="stub_1_12 0630" class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;"><br /></td>
      <td headers="stub_1_12 0700" class="gt_row gt_right" style="background-color: #514A5A; color: #FFFFFF;">84.3</td>
      <td headers="stub_1_12 0730" class="gt_row gt_right" style="background-color: #514A5B; color: #FFFFFF;">78.0</td>
      <td headers="stub_1_12 0800" class="gt_row gt_right" style="background-color: #52495F; color: #FFFFFF;">71.8</td>
      <td headers="stub_1_12 0830" class="gt_row gt_right" style="background-color: #4D4D4D; color: #FFFFFF;">66.1</td>
      <td headers="stub_1_12 0900" class="gt_row gt_right" style="background-color: #52495E; color: #FFFFFF;">60.5</td>
      <td headers="stub_1_12 0930" class="gt_row gt_right" style="background-color: #514A5B; color: #FFFFFF;">55.6</td>
      <td headers="stub_1_12 1000" class="gt_row gt_right" style="background-color: #51495E; color: #FFFFFF;">50.9</td>
      <td headers="stub_1_12 1030" class="gt_row gt_right" style="background-color: #514A5B; color: #FFFFFF;">47.2</td>
      <td headers="stub_1_12 1100" class="gt_row gt_right" style="background-color: #514A5B; color: #FFFFFF;">44.2</td>
      <td headers="stub_1_12 1130" class="gt_row gt_right" style="background-color: #504B58; color: #FFFFFF;">42.4</td>
      <td headers="stub_1_12 1200" class="gt_row gt_right" style="background-color: #504B57; color: #FFFFFF;">41.8</td></tr>
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
            <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id="a0530">0530</th>
            <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id="a0600">0600</th>
            <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id="a0630">0630</th>
            <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id="a0700">0700</th>
            <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id="a0730">0730</th>
            <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id="a0800">0800</th>
            <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id="a0830">0830</th>
            <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id="a0900">0900</th>
            <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id="a0930">0930</th>
            <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id="a1000">1000</th>
            <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id="a1030">1030</th>
            <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id="a1100">1100</th>
            <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id="a1130">1130</th>
            <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id="a1200">1200</th>
          </tr>
        </thead>
        <tbody class="gt_table_body">
          <tr><th id="stub_1_1" scope="row" class="gt_row gt_center gt_stub">jan</th>
      <td headers="stub_1_1 0530" class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;"><br /></td>
      <td headers="stub_1_1 0600" class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;"><br /></td>
      <td headers="stub_1_1 0630" class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;"><br /></td>
      <td headers="stub_1_1 0700" class="gt_row gt_right" style="background-color: #4D4D4D; color: #FFFFFF;">84.9</td>
      <td headers="stub_1_1 0730" class="gt_row gt_right" style="background-color: #56417F; color: #FFFFFF;">78.7</td>
      <td headers="stub_1_1 0800" class="gt_row gt_right" style="background-color: #5232B2; color: #FFFFFF;">72.7</td>
      <td headers="stub_1_1 0830" class="gt_row gt_right" style="background-color: #3016EC; color: #FFFFFF;">66.1</td>
      <td headers="stub_1_1 0900" class="gt_row gt_right" style="background-color: #6C19E7; color: #FFFFFF;">61.5</td>
      <td headers="stub_1_1 0930" class="gt_row gt_right" style="background-color: #AE42B7; color: #FFFFFF;">56.5</td>
      <td headers="stub_1_1 1000" class="gt_row gt_right" style="background-color: #D1638D; color: #FFFFFF;">52.1</td>
      <td headers="stub_1_1 1030" class="gt_row gt_right" style="background-color: #E77E65; color: #FFFFFF;">48.3</td>
      <td headers="stub_1_1 1100" class="gt_row gt_right" style="background-color: #F49342; color: #000000;">45.5</td>
      <td headers="stub_1_1 1130" class="gt_row gt_right" style="background-color: #FDA11D; color: #000000;">43.6</td>
      <td headers="stub_1_1 1200" class="gt_row gt_right" style="background-color: #FFA500; color: #000000;">43.0</td></tr>
          <tr><th id="stub_1_2" scope="row" class="gt_row gt_center gt_stub">feb</th>
      <td headers="stub_1_2 0530" class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;"><br /></td>
      <td headers="stub_1_2 0600" class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;"><br /></td>
      <td headers="stub_1_2 0630" class="gt_row gt_right" style="background-color: #4D4D4D; color: #FFFFFF;">88.9</td>
      <td headers="stub_1_2 0700" class="gt_row gt_right" style="background-color: #554477; color: #FFFFFF;">82.5</td>
      <td headers="stub_1_2 0730" class="gt_row gt_right" style="background-color: #5437A4; color: #FFFFFF;">75.8</td>
      <td headers="stub_1_2 0800" class="gt_row gt_right" style="background-color: #4726D0; color: #FFFFFF;">69.6</td>
      <td headers="stub_1_2 0830" class="gt_row gt_right" style="background-color: #0A02FD; color: #FFFFFF;">63.3</td>
      <td headers="stub_1_2 0900" class="gt_row gt_right" style="background-color: #8B29D5; color: #FFFFFF;">57.7</td>
      <td headers="stub_1_2 0930" class="gt_row gt_right" style="background-color: #BA4CAB; color: #FFFFFF;">52.2</td>
      <td headers="stub_1_2 1000" class="gt_row gt_right" style="background-color: #D66984; color: #FFFFFF;">47.4</td>
      <td headers="stub_1_2 1030" class="gt_row gt_right" style="background-color: #EA825F; color: #FFFFFF;">43.1</td>
      <td headers="stub_1_2 1100" class="gt_row gt_right" style="background-color: #F6953E; color: #000000;">40.0</td>
      <td headers="stub_1_2 1130" class="gt_row gt_right" style="background-color: #FDA119; color: #000000;">37.8</td>
      <td headers="stub_1_2 1200" class="gt_row gt_right" style="background-color: #FFA500; color: #000000;">37.2</td></tr>
          <tr><th id="stub_1_3" scope="row" class="gt_row gt_center gt_stub">mar</th>
      <td headers="stub_1_3 0530" class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;"><br /></td>
      <td headers="stub_1_3 0600" class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;"><br /></td>
      <td headers="stub_1_3 0630" class="gt_row gt_right" style="background-color: #4D4D4D; color: #FFFFFF;">85.7</td>
      <td headers="stub_1_3 0700" class="gt_row gt_right" style="background-color: #554475; color: #FFFFFF;">78.8</td>
      <td headers="stub_1_3 0730" class="gt_row gt_right" style="background-color: #55399E; color: #FFFFFF;">72.0</td>
      <td headers="stub_1_3 0800" class="gt_row gt_right" style="background-color: #4A2AC8; color: #FFFFFF;">65.2</td>
      <td headers="stub_1_3 0830" class="gt_row gt_right" style="background-color: #2610F3; color: #FFFFFF;">58.6</td>
      <td headers="stub_1_3 0900" class="gt_row gt_right" style="background-color: #7A20E0; color: #FFFFFF;">52.3</td>
      <td headers="stub_1_3 0930" class="gt_row gt_right" style="background-color: #B043B6; color: #FFFFFF;">46.2</td>
      <td headers="stub_1_3 1000" class="gt_row gt_right" style="background-color: #D0628E; color: #FFFFFF;">40.5</td>
      <td headers="stub_1_3 1030" class="gt_row gt_right" style="background-color: #E57C69; color: #FFFFFF;">35.5</td>
      <td headers="stub_1_3 1100" class="gt_row gt_right" style="background-color: #F49244; color: #000000;">31.4</td>
      <td headers="stub_1_3 1130" class="gt_row gt_right" style="background-color: #FCA01E; color: #000000;">28.6</td>
      <td headers="stub_1_3 1200" class="gt_row gt_right" style="background-color: #FFA500; color: #000000;">27.7</td></tr>
          <tr><th id="stub_1_4" scope="row" class="gt_row gt_center gt_stub">apr</th>
      <td headers="stub_1_4 0530" class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;"><br /></td>
      <td headers="stub_1_4 0600" class="gt_row gt_right" style="background-color: #4D4D4D; color: #FFFFFF;">88.5</td>
      <td headers="stub_1_4 0630" class="gt_row gt_right" style="background-color: #54466D; color: #FFFFFF;">81.5</td>
      <td headers="stub_1_4 0700" class="gt_row gt_right" style="background-color: #563D8F; color: #FFFFFF;">74.4</td>
      <td headers="stub_1_4 0730" class="gt_row gt_right" style="background-color: #5233B1; color: #FFFFFF;">67.4</td>
      <td headers="stub_1_4 0800" class="gt_row gt_right" style="background-color: #4424D4; color: #FFFFFF;">60.3</td>
      <td headers="stub_1_4 0830" class="gt_row gt_right" style="background-color: #1C0AF8; color: #FFFFFF;">53.4</td>
      <td headers="stub_1_4 0900" class="gt_row gt_right" style="background-color: #7920E1; color: #FFFFFF;">46.5</td>
      <td headers="stub_1_4 0930" class="gt_row gt_right" style="background-color: #AB3FBB; color: #FFFFFF;">39.7</td>
      <td headers="stub_1_4 1000" class="gt_row gt_right" style="background-color: #CA5B97; color: #FFFFFF;">33.2</td>
      <td headers="stub_1_4 1030" class="gt_row gt_right" style="background-color: #E07573; color: #FFFFFF;">26.9</td>
      <td headers="stub_1_4 1100" class="gt_row gt_right" style="background-color: #F18D4D; color: #000000;">21.3</td>
      <td headers="stub_1_4 1130" class="gt_row gt_right" style="background-color: #FB9E26; color: #000000;">17.2</td>
      <td headers="stub_1_4 1200" class="gt_row gt_right" style="background-color: #FFA500; color: #000000;">15.5</td></tr>
          <tr><th id="stub_1_5" scope="row" class="gt_row gt_center gt_stub">may</th>
      <td headers="stub_1_5 0530" class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;"><br /></td>
      <td headers="stub_1_5 0600" class="gt_row gt_right" style="background-color: #4D4D4D; color: #FFFFFF;">85.0</td>
      <td headers="stub_1_5 0630" class="gt_row gt_right" style="background-color: #54476A; color: #FFFFFF;">78.2</td>
      <td headers="stub_1_5 0700" class="gt_row gt_right" style="background-color: #563F88; color: #FFFFFF;">71.2</td>
      <td headers="stub_1_5 0730" class="gt_row gt_right" style="background-color: #5436A6; color: #FFFFFF;">64.3</td>
      <td headers="stub_1_5 0800" class="gt_row gt_right" style="background-color: #4B2BC6; color: #FFFFFF;">57.2</td>
      <td headers="stub_1_5 0830" class="gt_row gt_right" style="background-color: #361AE6; color: #FFFFFF;">50.2</td>
      <td headers="stub_1_5 0900" class="gt_row gt_right" style="background-color: #450AF6; color: #FFFFFF;">43.2</td>
      <td headers="stub_1_5 0930" class="gt_row gt_right" style="background-color: #902CD2; color: #FFFFFF;">36.1</td>
      <td headers="stub_1_5 1000" class="gt_row gt_right" style="background-color: #B649AF; color: #FFFFFF;">29.1</td>
      <td headers="stub_1_5 1030" class="gt_row gt_right" style="background-color: #C354A0; color: #FFFFFF;">26.1</td>
      <td headers="stub_1_5 1100" class="gt_row gt_right" style="background-color: #E77E66; color: #FFFFFF;">15.2</td>
      <td headers="stub_1_5 1130" class="gt_row gt_right" style="background-color: #F7973A; color: #000000;">8.8</td>
      <td headers="stub_1_5 1200" class="gt_row gt_right" style="background-color: #FFA500; color: #000000;">5.0</td></tr>
          <tr><th id="stub_1_6" scope="row" class="gt_row gt_center gt_stub">jun</th>
      <td headers="stub_1_6 0530" class="gt_row gt_right" style="background-color: #4D4D4D; color: #FFFFFF;">89.2</td>
      <td headers="stub_1_6 0600" class="gt_row gt_right" style="background-color: #534866; color: #FFFFFF;">82.7</td>
      <td headers="stub_1_6 0630" class="gt_row gt_right" style="background-color: #564181; color: #FFFFFF;">76.0</td>
      <td headers="stub_1_6 0700" class="gt_row gt_right" style="background-color: #563A9B; color: #FFFFFF;">69.3</td>
      <td headers="stub_1_6 0730" class="gt_row gt_right" style="background-color: #5030B7; color: #FFFFFF;">62.5</td>
      <td headers="stub_1_6 0800" class="gt_row gt_right" style="background-color: #4425D4; color: #FFFFFF;">55.7</td>
      <td headers="stub_1_6 0830" class="gt_row gt_right" style="background-color: #2911F1; color: #FFFFFF;">48.8</td>
      <td headers="stub_1_6 0900" class="gt_row gt_right" style="background-color: #5D13EE; color: #FFFFFF;">41.9</td>
      <td headers="stub_1_6 0930" class="gt_row gt_right" style="background-color: #9530CE; color: #FFFFFF;">35.0</td>
      <td headers="stub_1_6 1000" class="gt_row gt_right" style="background-color: #B749AE; color: #FFFFFF;">28.1</td>
      <td headers="stub_1_6 1030" class="gt_row gt_right" style="background-color: #D0628D; color: #FFFFFF;">21.1</td>
      <td headers="stub_1_6 1100" class="gt_row gt_right" style="background-color: #E47A6B; color: #FFFFFF;">14.2</td>
      <td headers="stub_1_6 1130" class="gt_row gt_right" style="background-color: #F49243; color: #000000;">7.3</td>
      <td headers="stub_1_6 1200" class="gt_row gt_right" style="background-color: #FFA500; color: #000000;">2.0</td></tr>
          <tr><th id="stub_1_7" scope="row" class="gt_row gt_center gt_stub">jul</th>
      <td headers="stub_1_7 0530" class="gt_row gt_right" style="background-color: #4D4D4D; color: #FFFFFF;">88.8</td>
      <td headers="stub_1_7 0600" class="gt_row gt_right" style="background-color: #534767; color: #FFFFFF;">82.3</td>
      <td headers="stub_1_7 0630" class="gt_row gt_right" style="background-color: #564181; color: #FFFFFF;">75.7</td>
      <td headers="stub_1_7 0700" class="gt_row gt_right" style="background-color: #553A9C; color: #FFFFFF;">69.1</td>
      <td headers="stub_1_7 0730" class="gt_row gt_right" style="background-color: #5030B8; color: #FFFFFF;">62.3</td>
      <td headers="stub_1_7 0800" class="gt_row gt_right" style="background-color: #4324D5; color: #FFFFFF;">55.5</td>
      <td headers="stub_1_7 0830" class="gt_row gt_right" style="background-color: #2610F3; color: #FFFFFF;">48.7</td>
      <td headers="stub_1_7 0900" class="gt_row gt_right" style="background-color: #6315EB; color: #FFFFFF;">41.8</td>
      <td headers="stub_1_7 0930" class="gt_row gt_right" style="background-color: #9832CC; color: #FFFFFF;">35.0</td>
      <td headers="stub_1_7 1000" class="gt_row gt_right" style="background-color: #BA4CAB; color: #FFFFFF;">28.1</td>
      <td headers="stub_1_7 1030" class="gt_row gt_right" style="background-color: #D3658A; color: #FFFFFF;">21.2</td>
      <td headers="stub_1_7 1100" class="gt_row gt_right" style="background-color: #E67D67; color: #FFFFFF;">14.3</td>
      <td headers="stub_1_7 1130" class="gt_row gt_right" style="background-color: #F6953E; color: #000000;">7.7</td>
      <td headers="stub_1_7 1200" class="gt_row gt_right" style="background-color: #FFA500; color: #000000;">3.1</td></tr>
          <tr><th id="stub_1_8" scope="row" class="gt_row gt_center gt_stub">aug</th>
      <td headers="stub_1_8 0530" class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;"><br /></td>
      <td headers="stub_1_8 0600" class="gt_row gt_right" style="background-color: #4D4D4D; color: #FFFFFF;">83.8</td>
      <td headers="stub_1_8 0630" class="gt_row gt_right" style="background-color: #544769; color: #FFFFFF;">77.1</td>
      <td headers="stub_1_8 0700" class="gt_row gt_right" style="background-color: #564086; color: #FFFFFF;">70.2</td>
      <td headers="stub_1_8 0730" class="gt_row gt_right" style="background-color: #5537A3; color: #FFFFFF;">63.3</td>
      <td headers="stub_1_8 0800" class="gt_row gt_right" style="background-color: #4D2DC1; color: #FFFFFF;">56.4</td>
      <td headers="stub_1_8 0830" class="gt_row gt_right" style="background-color: #3B1DE1; color: #FFFFFF;">49.4</td>
      <td headers="stub_1_8 0900" class="gt_row gt_right" style="background-color: #2002FD; color: #FFFFFF;">42.4</td>
      <td headers="stub_1_8 0930" class="gt_row gt_right" style="background-color: #8425DA; color: #FFFFFF;">35.4</td>
      <td headers="stub_1_8 1000" class="gt_row gt_right" style="background-color: #AE42B8; color: #FFFFFF;">28.3</td>
      <td headers="stub_1_8 1030" class="gt_row gt_right" style="background-color: #CB5D95; color: #FFFFFF;">21.3</td>
      <td headers="stub_1_8 1100" class="gt_row gt_right" style="background-color: #E17770; color: #FFFFFF;">14.3</td>
      <td headers="stub_1_8 1130" class="gt_row gt_right" style="background-color: #F39146; color: #000000;">7.3</td>
      <td headers="stub_1_8 1200" class="gt_row gt_right" style="background-color: #FFA500; color: #000000;">1.9</td></tr>
          <tr><th id="stub_1_9" scope="row" class="gt_row gt_center gt_stub">sep</th>
      <td headers="stub_1_9 0530" class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;"><br /></td>
      <td headers="stub_1_9 0600" class="gt_row gt_right" style="background-color: #4D4D4D; color: #FFFFFF;">87.2</td>
      <td headers="stub_1_9 0630" class="gt_row gt_right" style="background-color: #54466C; color: #FFFFFF;">80.2</td>
      <td headers="stub_1_9 0700" class="gt_row gt_right" style="background-color: #563E8C; color: #FFFFFF;">73.2</td>
      <td headers="stub_1_9 0730" class="gt_row gt_right" style="background-color: #5334AD; color: #FFFFFF;">66.1</td>
      <td headers="stub_1_9 0800" class="gt_row gt_right" style="background-color: #4727CF; color: #FFFFFF;">59.1</td>
      <td headers="stub_1_9 0830" class="gt_row gt_right" style="background-color: #2811F1; color: #FFFFFF;">52.1</td>
      <td headers="stub_1_9 0900" class="gt_row gt_right" style="background-color: #6B19E8; color: #FFFFFF;">45.1</td>
      <td headers="stub_1_9 0930" class="gt_row gt_right" style="background-color: #A339C3; color: #FFFFFF;">38.1</td>
      <td headers="stub_1_9 1000" class="gt_row gt_right" style="background-color: #C4559F; color: #FFFFFF;">31.3</td>
      <td headers="stub_1_9 1030" class="gt_row gt_right" style="background-color: #DC707A; color: #FFFFFF;">24.7</td>
      <td headers="stub_1_9 1100" class="gt_row gt_right" style="background-color: #EE8954; color: #000000;">18.6</td>
      <td headers="stub_1_9 1130" class="gt_row gt_right" style="background-color: #FA9D2B; color: #000000;">13.7</td>
      <td headers="stub_1_9 1200" class="gt_row gt_right" style="background-color: #FFA500; color: #000000;">11.6</td></tr>
          <tr><th id="stub_1_10" scope="row" class="gt_row gt_center gt_stub">oct</th>
      <td headers="stub_1_10 0530" class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;"><br /></td>
      <td headers="stub_1_10 0600" class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;"><br /></td>
      <td headers="stub_1_10 0630" class="gt_row gt_right" style="background-color: #4D4D4D; color: #FFFFFF;">84.1</td>
      <td headers="stub_1_10 0700" class="gt_row gt_right" style="background-color: #554474; color: #FFFFFF;">77.1</td>
      <td headers="stub_1_10 0730" class="gt_row gt_right" style="background-color: #563A9B; color: #FFFFFF;">70.2</td>
      <td headers="stub_1_10 0800" class="gt_row gt_right" style="background-color: #4C2CC4; color: #FFFFFF;">63.3</td>
      <td headers="stub_1_10 0830" class="gt_row gt_right" style="background-color: #2E15ED; color: #FFFFFF;">56.5</td>
      <td headers="stub_1_10 0900" class="gt_row gt_right" style="background-color: #6E1AE6; color: #FFFFFF;">49.9</td>
      <td headers="stub_1_10 0930" class="gt_row gt_right" style="background-color: #AA3EBC; color: #FFFFFF;">43.5</td>
      <td headers="stub_1_10 1000" class="gt_row gt_right" style="background-color: #CC5D95; color: #FFFFFF;">37.5</td>
      <td headers="stub_1_10 1030" class="gt_row gt_right" style="background-color: #E3796E; color: #FFFFFF;">32.0</td>
      <td headers="stub_1_10 1100" class="gt_row gt_right" style="background-color: #F29048; color: #000000;">27.4</td>
      <td headers="stub_1_10 1130" class="gt_row gt_right" style="background-color: #FC9F23; color: #000000;">24.3</td>
      <td headers="stub_1_10 1200" class="gt_row gt_right" style="background-color: #FFA500; color: #000000;">23.1</td></tr>
          <tr><th id="stub_1_11" scope="row" class="gt_row gt_center gt_stub">nov</th>
      <td headers="stub_1_11 0530" class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;"><br /></td>
      <td headers="stub_1_11 0600" class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;"><br /></td>
      <td headers="stub_1_11 0630" class="gt_row gt_right" style="background-color: #4D4D4D; color: #FFFFFF;">87.8</td>
      <td headers="stub_1_11 0700" class="gt_row gt_right" style="background-color: #554476; color: #FFFFFF;">81.3</td>
      <td headers="stub_1_11 0730" class="gt_row gt_right" style="background-color: #5537A3; color: #FFFFFF;">74.5</td>
      <td headers="stub_1_11 0800" class="gt_row gt_right" style="background-color: #4828CD; color: #FFFFFF;">68.3</td>
      <td headers="stub_1_11 0830" class="gt_row gt_right" style="background-color: #1607FA; color: #FFFFFF;">61.8</td>
      <td headers="stub_1_11 0900" class="gt_row gt_right" style="background-color: #8627D8; color: #FFFFFF;">56.0</td>
      <td headers="stub_1_11 0930" class="gt_row gt_right" style="background-color: #B84AAD; color: #FFFFFF;">50.2</td>
      <td headers="stub_1_11 1000" class="gt_row gt_right" style="background-color: #D46787; color: #FFFFFF;">45.3</td>
      <td headers="stub_1_11 1030" class="gt_row gt_right" style="background-color: #E98161; color: #FFFFFF;">40.7</td>
      <td headers="stub_1_11 1100" class="gt_row gt_right" style="background-color: #F59440; color: #000000;">37.4</td>
      <td headers="stub_1_11 1130" class="gt_row gt_right" style="background-color: #FDA11B; color: #000000;">35.1</td>
      <td headers="stub_1_11 1200" class="gt_row gt_right" style="background-color: #FFA500; color: #000000;">34.4</td></tr>
          <tr><th id="stub_1_12" scope="row" class="gt_row gt_center gt_stub">dec</th>
      <td headers="stub_1_12 0530" class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;"><br /></td>
      <td headers="stub_1_12 0600" class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;"><br /></td>
      <td headers="stub_1_12 0630" class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;"><br /></td>
      <td headers="stub_1_12 0700" class="gt_row gt_right" style="background-color: #4D4D4D; color: #FFFFFF;">84.3</td>
      <td headers="stub_1_12 0730" class="gt_row gt_right" style="background-color: #56417F; color: #FFFFFF;">78.0</td>
      <td headers="stub_1_12 0800" class="gt_row gt_right" style="background-color: #5132B3; color: #FFFFFF;">71.8</td>
      <td headers="stub_1_12 0830" class="gt_row gt_right" style="background-color: #381BE4; color: #FFFFFF;">66.1</td>
      <td headers="stub_1_12 0900" class="gt_row gt_right" style="background-color: #6D1AE7; color: #FFFFFF;">60.5</td>
      <td headers="stub_1_12 0930" class="gt_row gt_right" style="background-color: #AD41B8; color: #FFFFFF;">55.6</td>
      <td headers="stub_1_12 1000" class="gt_row gt_right" style="background-color: #D2648B; color: #FFFFFF;">50.9</td>
      <td headers="stub_1_12 1030" class="gt_row gt_right" style="background-color: #E77E65; color: #FFFFFF;">47.2</td>
      <td headers="stub_1_12 1100" class="gt_row gt_right" style="background-color: #F59440; color: #000000;">44.2</td>
      <td headers="stub_1_12 1130" class="gt_row gt_right" style="background-color: #FDA11C; color: #000000;">42.4</td>
      <td headers="stub_1_12 1200" class="gt_row gt_right" style="background-color: #FFA500; color: #000000;">41.8</td></tr>
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
            <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id="a0530">0530</th>
            <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id="a0600">0600</th>
            <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id="a0630">0630</th>
            <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id="a0700">0700</th>
            <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id="a0730">0730</th>
            <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id="a0800">0800</th>
            <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id="a0830">0830</th>
            <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id="a0900">0900</th>
            <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id="a0930">0930</th>
            <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id="a1000">1000</th>
            <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id="a1030">1030</th>
            <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id="a1100">1100</th>
            <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id="a1130">1130</th>
            <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id="a1200">1200</th>
          </tr>
        </thead>
        <tbody class="gt_table_body">
          <tr><th id="stub_1_1" scope="row" class="gt_row gt_center gt_stub">jan</th>
      <td headers="stub_1_1 0530" class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;"><br /></td>
      <td headers="stub_1_1 0600" class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;"><br /></td>
      <td headers="stub_1_1 0630" class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;"><br /></td>
      <td headers="stub_1_1 0700" class="gt_row gt_right" style="background-color: #4D4D4D; color: #FFFFFF;">84.9</td>
      <td headers="stub_1_1 0730" class="gt_row gt_right" style="background-color: #56427E; color: #FFFFFF;">78.7</td>
      <td headers="stub_1_1 0800" class="gt_row gt_right" style="background-color: #5233B0; color: #FFFFFF;">72.7</td>
      <td headers="stub_1_1 0830" class="gt_row gt_right" style="background-color: #381BE4; color: #FFFFFF;">66.1</td>
      <td headers="stub_1_1 0900" class="gt_row gt_right" style="background-color: #761EE2; color: #FFFFFF;">61.5</td>
      <td headers="stub_1_1 0930" class="gt_row gt_right" style="background-color: #BC4DA9; color: #FFFFFF;">56.5</td>
      <td headers="stub_1_1 1000" class="gt_row gt_right" style="background-color: #E3796D; color: #FFFFFF;">52.1</td>
      <td headers="stub_1_1 1030" class="gt_row gt_right" style="background-color: #E3796D; color: #FFFFFF;">48.3</td>
      <td headers="stub_1_1 1100" class="gt_row gt_right" style="background-color: #FFA500; color: #000000;">45.5</td>
      <td headers="stub_1_1 1130" class="gt_row gt_right" style="background-color: #FFA500; color: #000000;">43.6</td>
      <td headers="stub_1_1 1200" class="gt_row gt_right" style="background-color: #FFA500; color: #000000;">43.0</td></tr>
          <tr><th id="stub_1_2" scope="row" class="gt_row gt_center gt_stub">feb</th>
      <td headers="stub_1_2 0530" class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;"><br /></td>
      <td headers="stub_1_2 0600" class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;"><br /></td>
      <td headers="stub_1_2 0630" class="gt_row gt_right" style="background-color: #4D4D4D; color: #FFFFFF;">88.9</td>
      <td headers="stub_1_2 0700" class="gt_row gt_right" style="background-color: #4D4D4D; color: #FFFFFF;">82.5</td>
      <td headers="stub_1_2 0730" class="gt_row gt_right" style="background-color: #5233B0; color: #FFFFFF;">75.8</td>
      <td headers="stub_1_2 0800" class="gt_row gt_right" style="background-color: #5233B0; color: #FFFFFF;">69.6</td>
      <td headers="stub_1_2 0830" class="gt_row gt_right" style="background-color: #381BE4; color: #FFFFFF;">63.3</td>
      <td headers="stub_1_2 0900" class="gt_row gt_right" style="background-color: #761EE2; color: #FFFFFF;">57.7</td>
      <td headers="stub_1_2 0930" class="gt_row gt_right" style="background-color: #BC4DA9; color: #FFFFFF;">52.2</td>
      <td headers="stub_1_2 1000" class="gt_row gt_right" style="background-color: #E3796D; color: #FFFFFF;">47.4</td>
      <td headers="stub_1_2 1030" class="gt_row gt_right" style="background-color: #FFA500; color: #000000;">43.1</td>
      <td headers="stub_1_2 1100" class="gt_row gt_right" style="background-color: #FFA500; color: #000000;">40.0</td>
      <td headers="stub_1_2 1130" class="gt_row gt_right" style="background-color: #FFA500; color: #000000;">37.8</td>
      <td headers="stub_1_2 1200" class="gt_row gt_right" style="background-color: #FFA500; color: #000000;">37.2</td></tr>
          <tr><th id="stub_1_3" scope="row" class="gt_row gt_center gt_stub">mar</th>
      <td headers="stub_1_3 0530" class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;"><br /></td>
      <td headers="stub_1_3 0600" class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;"><br /></td>
      <td headers="stub_1_3 0630" class="gt_row gt_right" style="background-color: #4D4D4D; color: #FFFFFF;">85.7</td>
      <td headers="stub_1_3 0700" class="gt_row gt_right" style="background-color: #4D4D4D; color: #FFFFFF;">78.8</td>
      <td headers="stub_1_3 0730" class="gt_row gt_right" style="background-color: #56427E; color: #FFFFFF;">72.0</td>
      <td headers="stub_1_3 0800" class="gt_row gt_right" style="background-color: #5233B0; color: #FFFFFF;">65.2</td>
      <td headers="stub_1_3 0830" class="gt_row gt_right" style="background-color: #381BE4; color: #FFFFFF;">58.6</td>
      <td headers="stub_1_3 0900" class="gt_row gt_right" style="background-color: #761EE2; color: #FFFFFF;">52.3</td>
      <td headers="stub_1_3 0930" class="gt_row gt_right" style="background-color: #BC4DA9; color: #FFFFFF;">46.2</td>
      <td headers="stub_1_3 1000" class="gt_row gt_right" style="background-color: #E3796D; color: #FFFFFF;">40.5</td>
      <td headers="stub_1_3 1030" class="gt_row gt_right" style="background-color: #E3796D; color: #FFFFFF;">35.5</td>
      <td headers="stub_1_3 1100" class="gt_row gt_right" style="background-color: #FFA500; color: #000000;">31.4</td>
      <td headers="stub_1_3 1130" class="gt_row gt_right" style="background-color: #FFA500; color: #000000;">28.6</td>
      <td headers="stub_1_3 1200" class="gt_row gt_right" style="background-color: #FFA500; color: #000000;">27.7</td></tr>
          <tr><th id="stub_1_4" scope="row" class="gt_row gt_center gt_stub">apr</th>
      <td headers="stub_1_4 0530" class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;"><br /></td>
      <td headers="stub_1_4 0600" class="gt_row gt_right" style="background-color: #4D4D4D; color: #FFFFFF;">88.5</td>
      <td headers="stub_1_4 0630" class="gt_row gt_right" style="background-color: #4D4D4D; color: #FFFFFF;">81.5</td>
      <td headers="stub_1_4 0700" class="gt_row gt_right" style="background-color: #56427E; color: #FFFFFF;">74.4</td>
      <td headers="stub_1_4 0730" class="gt_row gt_right" style="background-color: #5233B0; color: #FFFFFF;">67.4</td>
      <td headers="stub_1_4 0800" class="gt_row gt_right" style="background-color: #381BE4; color: #FFFFFF;">60.3</td>
      <td headers="stub_1_4 0830" class="gt_row gt_right" style="background-color: #381BE4; color: #FFFFFF;">53.4</td>
      <td headers="stub_1_4 0900" class="gt_row gt_right" style="background-color: #761EE2; color: #FFFFFF;">46.5</td>
      <td headers="stub_1_4 0930" class="gt_row gt_right" style="background-color: #BC4DA9; color: #FFFFFF;">39.7</td>
      <td headers="stub_1_4 1000" class="gt_row gt_right" style="background-color: #E3796D; color: #FFFFFF;">33.2</td>
      <td headers="stub_1_4 1030" class="gt_row gt_right" style="background-color: #E3796D; color: #FFFFFF;">26.9</td>
      <td headers="stub_1_4 1100" class="gt_row gt_right" style="background-color: #FFA500; color: #000000;">21.3</td>
      <td headers="stub_1_4 1130" class="gt_row gt_right" style="background-color: #FFA500; color: #000000;">17.2</td>
      <td headers="stub_1_4 1200" class="gt_row gt_right" style="background-color: #FFA500; color: #000000;">15.5</td></tr>
          <tr><th id="stub_1_5" scope="row" class="gt_row gt_center gt_stub">may</th>
      <td headers="stub_1_5 0530" class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;"><br /></td>
      <td headers="stub_1_5 0600" class="gt_row gt_right" style="background-color: #4D4D4D; color: #FFFFFF;">85.0</td>
      <td headers="stub_1_5 0630" class="gt_row gt_right" style="background-color: #4D4D4D; color: #FFFFFF;">78.2</td>
      <td headers="stub_1_5 0700" class="gt_row gt_right" style="background-color: #56427E; color: #FFFFFF;">71.2</td>
      <td headers="stub_1_5 0730" class="gt_row gt_right" style="background-color: #5233B0; color: #FFFFFF;">64.3</td>
      <td headers="stub_1_5 0800" class="gt_row gt_right" style="background-color: #5233B0; color: #FFFFFF;">57.2</td>
      <td headers="stub_1_5 0830" class="gt_row gt_right" style="background-color: #381BE4; color: #FFFFFF;">50.2</td>
      <td headers="stub_1_5 0900" class="gt_row gt_right" style="background-color: #761EE2; color: #FFFFFF;">43.2</td>
      <td headers="stub_1_5 0930" class="gt_row gt_right" style="background-color: #761EE2; color: #FFFFFF;">36.1</td>
      <td headers="stub_1_5 1000" class="gt_row gt_right" style="background-color: #BC4DA9; color: #FFFFFF;">29.1</td>
      <td headers="stub_1_5 1030" class="gt_row gt_right" style="background-color: #BC4DA9; color: #FFFFFF;">26.1</td>
      <td headers="stub_1_5 1100" class="gt_row gt_right" style="background-color: #E3796D; color: #FFFFFF;">15.2</td>
      <td headers="stub_1_5 1130" class="gt_row gt_right" style="background-color: #FFA500; color: #000000;">8.8</td>
      <td headers="stub_1_5 1200" class="gt_row gt_right" style="background-color: #FFA500; color: #000000;">5.0</td></tr>
          <tr><th id="stub_1_6" scope="row" class="gt_row gt_center gt_stub">jun</th>
      <td headers="stub_1_6 0530" class="gt_row gt_right" style="background-color: #4D4D4D; color: #FFFFFF;">89.2</td>
      <td headers="stub_1_6 0600" class="gt_row gt_right" style="background-color: #4D4D4D; color: #FFFFFF;">82.7</td>
      <td headers="stub_1_6 0630" class="gt_row gt_right" style="background-color: #56427E; color: #FFFFFF;">76.0</td>
      <td headers="stub_1_6 0700" class="gt_row gt_right" style="background-color: #56427E; color: #FFFFFF;">69.3</td>
      <td headers="stub_1_6 0730" class="gt_row gt_right" style="background-color: #5233B0; color: #FFFFFF;">62.5</td>
      <td headers="stub_1_6 0800" class="gt_row gt_right" style="background-color: #381BE4; color: #FFFFFF;">55.7</td>
      <td headers="stub_1_6 0830" class="gt_row gt_right" style="background-color: #381BE4; color: #FFFFFF;">48.8</td>
      <td headers="stub_1_6 0900" class="gt_row gt_right" style="background-color: #761EE2; color: #FFFFFF;">41.9</td>
      <td headers="stub_1_6 0930" class="gt_row gt_right" style="background-color: #761EE2; color: #FFFFFF;">35.0</td>
      <td headers="stub_1_6 1000" class="gt_row gt_right" style="background-color: #BC4DA9; color: #FFFFFF;">28.1</td>
      <td headers="stub_1_6 1030" class="gt_row gt_right" style="background-color: #E3796D; color: #FFFFFF;">21.1</td>
      <td headers="stub_1_6 1100" class="gt_row gt_right" style="background-color: #E3796D; color: #FFFFFF;">14.2</td>
      <td headers="stub_1_6 1130" class="gt_row gt_right" style="background-color: #FFA500; color: #000000;">7.3</td>
      <td headers="stub_1_6 1200" class="gt_row gt_right" style="background-color: #FFA500; color: #000000;">2.0</td></tr>
          <tr><th id="stub_1_7" scope="row" class="gt_row gt_center gt_stub">jul</th>
      <td headers="stub_1_7 0530" class="gt_row gt_right" style="background-color: #4D4D4D; color: #FFFFFF;">88.8</td>
      <td headers="stub_1_7 0600" class="gt_row gt_right" style="background-color: #4D4D4D; color: #FFFFFF;">82.3</td>
      <td headers="stub_1_7 0630" class="gt_row gt_right" style="background-color: #56427E; color: #FFFFFF;">75.7</td>
      <td headers="stub_1_7 0700" class="gt_row gt_right" style="background-color: #56427E; color: #FFFFFF;">69.1</td>
      <td headers="stub_1_7 0730" class="gt_row gt_right" style="background-color: #5233B0; color: #FFFFFF;">62.3</td>
      <td headers="stub_1_7 0800" class="gt_row gt_right" style="background-color: #381BE4; color: #FFFFFF;">55.5</td>
      <td headers="stub_1_7 0830" class="gt_row gt_right" style="background-color: #381BE4; color: #FFFFFF;">48.7</td>
      <td headers="stub_1_7 0900" class="gt_row gt_right" style="background-color: #761EE2; color: #FFFFFF;">41.8</td>
      <td headers="stub_1_7 0930" class="gt_row gt_right" style="background-color: #BC4DA9; color: #FFFFFF;">35.0</td>
      <td headers="stub_1_7 1000" class="gt_row gt_right" style="background-color: #BC4DA9; color: #FFFFFF;">28.1</td>
      <td headers="stub_1_7 1030" class="gt_row gt_right" style="background-color: #E3796D; color: #FFFFFF;">21.2</td>
      <td headers="stub_1_7 1100" class="gt_row gt_right" style="background-color: #E3796D; color: #FFFFFF;">14.3</td>
      <td headers="stub_1_7 1130" class="gt_row gt_right" style="background-color: #FFA500; color: #000000;">7.7</td>
      <td headers="stub_1_7 1200" class="gt_row gt_right" style="background-color: #FFA500; color: #000000;">3.1</td></tr>
          <tr><th id="stub_1_8" scope="row" class="gt_row gt_center gt_stub">aug</th>
      <td headers="stub_1_8 0530" class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;"><br /></td>
      <td headers="stub_1_8 0600" class="gt_row gt_right" style="background-color: #4D4D4D; color: #FFFFFF;">83.8</td>
      <td headers="stub_1_8 0630" class="gt_row gt_right" style="background-color: #4D4D4D; color: #FFFFFF;">77.1</td>
      <td headers="stub_1_8 0700" class="gt_row gt_right" style="background-color: #56427E; color: #FFFFFF;">70.2</td>
      <td headers="stub_1_8 0730" class="gt_row gt_right" style="background-color: #5233B0; color: #FFFFFF;">63.3</td>
      <td headers="stub_1_8 0800" class="gt_row gt_right" style="background-color: #5233B0; color: #FFFFFF;">56.4</td>
      <td headers="stub_1_8 0830" class="gt_row gt_right" style="background-color: #381BE4; color: #FFFFFF;">49.4</td>
      <td headers="stub_1_8 0900" class="gt_row gt_right" style="background-color: #761EE2; color: #FFFFFF;">42.4</td>
      <td headers="stub_1_8 0930" class="gt_row gt_right" style="background-color: #761EE2; color: #FFFFFF;">35.4</td>
      <td headers="stub_1_8 1000" class="gt_row gt_right" style="background-color: #BC4DA9; color: #FFFFFF;">28.3</td>
      <td headers="stub_1_8 1030" class="gt_row gt_right" style="background-color: #E3796D; color: #FFFFFF;">21.3</td>
      <td headers="stub_1_8 1100" class="gt_row gt_right" style="background-color: #E3796D; color: #FFFFFF;">14.3</td>
      <td headers="stub_1_8 1130" class="gt_row gt_right" style="background-color: #FFA500; color: #000000;">7.3</td>
      <td headers="stub_1_8 1200" class="gt_row gt_right" style="background-color: #FFA500; color: #000000;">1.9</td></tr>
          <tr><th id="stub_1_9" scope="row" class="gt_row gt_center gt_stub">sep</th>
      <td headers="stub_1_9 0530" class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;"><br /></td>
      <td headers="stub_1_9 0600" class="gt_row gt_right" style="background-color: #4D4D4D; color: #FFFFFF;">87.2</td>
      <td headers="stub_1_9 0630" class="gt_row gt_right" style="background-color: #4D4D4D; color: #FFFFFF;">80.2</td>
      <td headers="stub_1_9 0700" class="gt_row gt_right" style="background-color: #56427E; color: #FFFFFF;">73.2</td>
      <td headers="stub_1_9 0730" class="gt_row gt_right" style="background-color: #5233B0; color: #FFFFFF;">66.1</td>
      <td headers="stub_1_9 0800" class="gt_row gt_right" style="background-color: #5233B0; color: #FFFFFF;">59.1</td>
      <td headers="stub_1_9 0830" class="gt_row gt_right" style="background-color: #381BE4; color: #FFFFFF;">52.1</td>
      <td headers="stub_1_9 0900" class="gt_row gt_right" style="background-color: #761EE2; color: #FFFFFF;">45.1</td>
      <td headers="stub_1_9 0930" class="gt_row gt_right" style="background-color: #BC4DA9; color: #FFFFFF;">38.1</td>
      <td headers="stub_1_9 1000" class="gt_row gt_right" style="background-color: #BC4DA9; color: #FFFFFF;">31.3</td>
      <td headers="stub_1_9 1030" class="gt_row gt_right" style="background-color: #E3796D; color: #FFFFFF;">24.7</td>
      <td headers="stub_1_9 1100" class="gt_row gt_right" style="background-color: #FFA500; color: #000000;">18.6</td>
      <td headers="stub_1_9 1130" class="gt_row gt_right" style="background-color: #FFA500; color: #000000;">13.7</td>
      <td headers="stub_1_9 1200" class="gt_row gt_right" style="background-color: #FFA500; color: #000000;">11.6</td></tr>
          <tr><th id="stub_1_10" scope="row" class="gt_row gt_center gt_stub">oct</th>
      <td headers="stub_1_10 0530" class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;"><br /></td>
      <td headers="stub_1_10 0600" class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;"><br /></td>
      <td headers="stub_1_10 0630" class="gt_row gt_right" style="background-color: #4D4D4D; color: #FFFFFF;">84.1</td>
      <td headers="stub_1_10 0700" class="gt_row gt_right" style="background-color: #4D4D4D; color: #FFFFFF;">77.1</td>
      <td headers="stub_1_10 0730" class="gt_row gt_right" style="background-color: #56427E; color: #FFFFFF;">70.2</td>
      <td headers="stub_1_10 0800" class="gt_row gt_right" style="background-color: #5233B0; color: #FFFFFF;">63.3</td>
      <td headers="stub_1_10 0830" class="gt_row gt_right" style="background-color: #381BE4; color: #FFFFFF;">56.5</td>
      <td headers="stub_1_10 0900" class="gt_row gt_right" style="background-color: #761EE2; color: #FFFFFF;">49.9</td>
      <td headers="stub_1_10 0930" class="gt_row gt_right" style="background-color: #BC4DA9; color: #FFFFFF;">43.5</td>
      <td headers="stub_1_10 1000" class="gt_row gt_right" style="background-color: #E3796D; color: #FFFFFF;">37.5</td>
      <td headers="stub_1_10 1030" class="gt_row gt_right" style="background-color: #E3796D; color: #FFFFFF;">32.0</td>
      <td headers="stub_1_10 1100" class="gt_row gt_right" style="background-color: #FFA500; color: #000000;">27.4</td>
      <td headers="stub_1_10 1130" class="gt_row gt_right" style="background-color: #FFA500; color: #000000;">24.3</td>
      <td headers="stub_1_10 1200" class="gt_row gt_right" style="background-color: #FFA500; color: #000000;">23.1</td></tr>
          <tr><th id="stub_1_11" scope="row" class="gt_row gt_center gt_stub">nov</th>
      <td headers="stub_1_11 0530" class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;"><br /></td>
      <td headers="stub_1_11 0600" class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;"><br /></td>
      <td headers="stub_1_11 0630" class="gt_row gt_right" style="background-color: #4D4D4D; color: #FFFFFF;">87.8</td>
      <td headers="stub_1_11 0700" class="gt_row gt_right" style="background-color: #4D4D4D; color: #FFFFFF;">81.3</td>
      <td headers="stub_1_11 0730" class="gt_row gt_right" style="background-color: #56427E; color: #FFFFFF;">74.5</td>
      <td headers="stub_1_11 0800" class="gt_row gt_right" style="background-color: #5233B0; color: #FFFFFF;">68.3</td>
      <td headers="stub_1_11 0830" class="gt_row gt_right" style="background-color: #381BE4; color: #FFFFFF;">61.8</td>
      <td headers="stub_1_11 0900" class="gt_row gt_right" style="background-color: #761EE2; color: #FFFFFF;">56.0</td>
      <td headers="stub_1_11 0930" class="gt_row gt_right" style="background-color: #BC4DA9; color: #FFFFFF;">50.2</td>
      <td headers="stub_1_11 1000" class="gt_row gt_right" style="background-color: #E3796D; color: #FFFFFF;">45.3</td>
      <td headers="stub_1_11 1030" class="gt_row gt_right" style="background-color: #FFA500; color: #000000;">40.7</td>
      <td headers="stub_1_11 1100" class="gt_row gt_right" style="background-color: #FFA500; color: #000000;">37.4</td>
      <td headers="stub_1_11 1130" class="gt_row gt_right" style="background-color: #FFA500; color: #000000;">35.1</td>
      <td headers="stub_1_11 1200" class="gt_row gt_right" style="background-color: #FFA500; color: #000000;">34.4</td></tr>
          <tr><th id="stub_1_12" scope="row" class="gt_row gt_center gt_stub">dec</th>
      <td headers="stub_1_12 0530" class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;"><br /></td>
      <td headers="stub_1_12 0600" class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;"><br /></td>
      <td headers="stub_1_12 0630" class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;"><br /></td>
      <td headers="stub_1_12 0700" class="gt_row gt_right" style="background-color: #4D4D4D; color: #FFFFFF;">84.3</td>
      <td headers="stub_1_12 0730" class="gt_row gt_right" style="background-color: #56427E; color: #FFFFFF;">78.0</td>
      <td headers="stub_1_12 0800" class="gt_row gt_right" style="background-color: #5233B0; color: #FFFFFF;">71.8</td>
      <td headers="stub_1_12 0830" class="gt_row gt_right" style="background-color: #381BE4; color: #FFFFFF;">66.1</td>
      <td headers="stub_1_12 0900" class="gt_row gt_right" style="background-color: #761EE2; color: #FFFFFF;">60.5</td>
      <td headers="stub_1_12 0930" class="gt_row gt_right" style="background-color: #BC4DA9; color: #FFFFFF;">55.6</td>
      <td headers="stub_1_12 1000" class="gt_row gt_right" style="background-color: #E3796D; color: #FFFFFF;">50.9</td>
      <td headers="stub_1_12 1030" class="gt_row gt_right" style="background-color: #E3796D; color: #FFFFFF;">47.2</td>
      <td headers="stub_1_12 1100" class="gt_row gt_right" style="background-color: #FFA500; color: #000000;">44.2</td>
      <td headers="stub_1_12 1130" class="gt_row gt_right" style="background-color: #FFA500; color: #000000;">42.4</td>
      <td headers="stub_1_12 1200" class="gt_row gt_right" style="background-color: #FFA500; color: #000000;">41.8</td></tr>
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
            <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id="a0530">0530</th>
            <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id="a0600">0600</th>
            <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id="a0630">0630</th>
            <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id="a0700">0700</th>
            <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id="a0730">0730</th>
            <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id="a0800">0800</th>
            <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id="a0830">0830</th>
            <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id="a0900">0900</th>
            <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id="a0930">0930</th>
            <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id="a1000">1000</th>
            <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id="a1030">1030</th>
            <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id="a1100">1100</th>
            <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id="a1130">1130</th>
            <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id="a1200">1200</th>
          </tr>
        </thead>
        <tbody class="gt_table_body">
          <tr><th id="stub_1_1" scope="row" class="gt_row gt_center gt_stub">jan</th>
      <td headers="stub_1_1 0530" class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;"><br /></td>
      <td headers="stub_1_1 0600" class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;"><br /></td>
      <td headers="stub_1_1 0630" class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;"><br /></td>
      <td headers="stub_1_1 0700" class="gt_row gt_right" style="background-color: #4D4D4D; color: #FFFFFF;">84.9</td>
      <td headers="stub_1_1 0730" class="gt_row gt_right" style="background-color: #4D4D4D; color: #FFFFFF;">78.7</td>
      <td headers="stub_1_1 0800" class="gt_row gt_right" style="background-color: #4D4D4D; color: #FFFFFF;">72.7</td>
      <td headers="stub_1_1 0830" class="gt_row gt_right" style="background-color: #4D2DC1; color: #FFFFFF;">66.1</td>
      <td headers="stub_1_1 0900" class="gt_row gt_right" style="background-color: #4D2DC1; color: #FFFFFF;">61.5</td>
      <td headers="stub_1_1 0930" class="gt_row gt_right" style="background-color: #4D2DC1; color: #FFFFFF;">56.5</td>
      <td headers="stub_1_1 1000" class="gt_row gt_right" style="background-color: #AA3EBC; color: #FFFFFF;">52.1</td>
      <td headers="stub_1_1 1030" class="gt_row gt_right" style="background-color: #AA3EBC; color: #FFFFFF;">48.3</td>
      <td headers="stub_1_1 1100" class="gt_row gt_right" style="background-color: #FFA500; color: #000000;">45.5</td>
      <td headers="stub_1_1 1130" class="gt_row gt_right" style="background-color: #FFA500; color: #000000;">43.6</td>
      <td headers="stub_1_1 1200" class="gt_row gt_right" style="background-color: #FFA500; color: #000000;">43.0</td></tr>
          <tr><th id="stub_1_2" scope="row" class="gt_row gt_center gt_stub">feb</th>
      <td headers="stub_1_2 0530" class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;"><br /></td>
      <td headers="stub_1_2 0600" class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;"><br /></td>
      <td headers="stub_1_2 0630" class="gt_row gt_right" style="background-color: #4D4D4D; color: #FFFFFF;">88.9</td>
      <td headers="stub_1_2 0700" class="gt_row gt_right" style="background-color: #4D4D4D; color: #FFFFFF;">82.5</td>
      <td headers="stub_1_2 0730" class="gt_row gt_right" style="background-color: #4D4D4D; color: #FFFFFF;">75.8</td>
      <td headers="stub_1_2 0800" class="gt_row gt_right" style="background-color: #4D2DC1; color: #FFFFFF;">69.6</td>
      <td headers="stub_1_2 0830" class="gt_row gt_right" style="background-color: #4D2DC1; color: #FFFFFF;">63.3</td>
      <td headers="stub_1_2 0900" class="gt_row gt_right" style="background-color: #4D2DC1; color: #FFFFFF;">57.7</td>
      <td headers="stub_1_2 0930" class="gt_row gt_right" style="background-color: #AA3EBC; color: #FFFFFF;">52.2</td>
      <td headers="stub_1_2 1000" class="gt_row gt_right" style="background-color: #AA3EBC; color: #FFFFFF;">47.4</td>
      <td headers="stub_1_2 1030" class="gt_row gt_right" style="background-color: #AA3EBC; color: #FFFFFF;">43.1</td>
      <td headers="stub_1_2 1100" class="gt_row gt_right" style="background-color: #FFA500; color: #000000;">40.0</td>
      <td headers="stub_1_2 1130" class="gt_row gt_right" style="background-color: #FFA500; color: #000000;">37.8</td>
      <td headers="stub_1_2 1200" class="gt_row gt_right" style="background-color: #FFA500; color: #000000;">37.2</td></tr>
          <tr><th id="stub_1_3" scope="row" class="gt_row gt_center gt_stub">mar</th>
      <td headers="stub_1_3 0530" class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;"><br /></td>
      <td headers="stub_1_3 0600" class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;"><br /></td>
      <td headers="stub_1_3 0630" class="gt_row gt_right" style="background-color: #4D4D4D; color: #FFFFFF;">85.7</td>
      <td headers="stub_1_3 0700" class="gt_row gt_right" style="background-color: #4D4D4D; color: #FFFFFF;">78.8</td>
      <td headers="stub_1_3 0730" class="gt_row gt_right" style="background-color: #4D4D4D; color: #FFFFFF;">72.0</td>
      <td headers="stub_1_3 0800" class="gt_row gt_right" style="background-color: #4D2DC1; color: #FFFFFF;">65.2</td>
      <td headers="stub_1_3 0830" class="gt_row gt_right" style="background-color: #4D2DC1; color: #FFFFFF;">58.6</td>
      <td headers="stub_1_3 0900" class="gt_row gt_right" style="background-color: #4D2DC1; color: #FFFFFF;">52.3</td>
      <td headers="stub_1_3 0930" class="gt_row gt_right" style="background-color: #AA3EBC; color: #FFFFFF;">46.2</td>
      <td headers="stub_1_3 1000" class="gt_row gt_right" style="background-color: #AA3EBC; color: #FFFFFF;">40.5</td>
      <td headers="stub_1_3 1030" class="gt_row gt_right" style="background-color: #AA3EBC; color: #FFFFFF;">35.5</td>
      <td headers="stub_1_3 1100" class="gt_row gt_right" style="background-color: #FFA500; color: #000000;">31.4</td>
      <td headers="stub_1_3 1130" class="gt_row gt_right" style="background-color: #FFA500; color: #000000;">28.6</td>
      <td headers="stub_1_3 1200" class="gt_row gt_right" style="background-color: #FFA500; color: #000000;">27.7</td></tr>
          <tr><th id="stub_1_4" scope="row" class="gt_row gt_center gt_stub">apr</th>
      <td headers="stub_1_4 0530" class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;"><br /></td>
      <td headers="stub_1_4 0600" class="gt_row gt_right" style="background-color: #4D4D4D; color: #FFFFFF;">88.5</td>
      <td headers="stub_1_4 0630" class="gt_row gt_right" style="background-color: #4D4D4D; color: #FFFFFF;">81.5</td>
      <td headers="stub_1_4 0700" class="gt_row gt_right" style="background-color: #4D4D4D; color: #FFFFFF;">74.4</td>
      <td headers="stub_1_4 0730" class="gt_row gt_right" style="background-color: #4D4D4D; color: #FFFFFF;">67.4</td>
      <td headers="stub_1_4 0800" class="gt_row gt_right" style="background-color: #4D2DC1; color: #FFFFFF;">60.3</td>
      <td headers="stub_1_4 0830" class="gt_row gt_right" style="background-color: #4D2DC1; color: #FFFFFF;">53.4</td>
      <td headers="stub_1_4 0900" class="gt_row gt_right" style="background-color: #4D2DC1; color: #FFFFFF;">46.5</td>
      <td headers="stub_1_4 0930" class="gt_row gt_right" style="background-color: #AA3EBC; color: #FFFFFF;">39.7</td>
      <td headers="stub_1_4 1000" class="gt_row gt_right" style="background-color: #AA3EBC; color: #FFFFFF;">33.2</td>
      <td headers="stub_1_4 1030" class="gt_row gt_right" style="background-color: #AA3EBC; color: #FFFFFF;">26.9</td>
      <td headers="stub_1_4 1100" class="gt_row gt_right" style="background-color: #FFA500; color: #000000;">21.3</td>
      <td headers="stub_1_4 1130" class="gt_row gt_right" style="background-color: #FFA500; color: #000000;">17.2</td>
      <td headers="stub_1_4 1200" class="gt_row gt_right" style="background-color: #FFA500; color: #000000;">15.5</td></tr>
          <tr><th id="stub_1_5" scope="row" class="gt_row gt_center gt_stub">may</th>
      <td headers="stub_1_5 0530" class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;"><br /></td>
      <td headers="stub_1_5 0600" class="gt_row gt_right" style="background-color: #4D4D4D; color: #FFFFFF;">85.0</td>
      <td headers="stub_1_5 0630" class="gt_row gt_right" style="background-color: #4D4D4D; color: #FFFFFF;">78.2</td>
      <td headers="stub_1_5 0700" class="gt_row gt_right" style="background-color: #4D4D4D; color: #FFFFFF;">71.2</td>
      <td headers="stub_1_5 0730" class="gt_row gt_right" style="background-color: #4D4D4D; color: #FFFFFF;">64.3</td>
      <td headers="stub_1_5 0800" class="gt_row gt_right" style="background-color: #4D2DC1; color: #FFFFFF;">57.2</td>
      <td headers="stub_1_5 0830" class="gt_row gt_right" style="background-color: #4D2DC1; color: #FFFFFF;">50.2</td>
      <td headers="stub_1_5 0900" class="gt_row gt_right" style="background-color: #4D2DC1; color: #FFFFFF;">43.2</td>
      <td headers="stub_1_5 0930" class="gt_row gt_right" style="background-color: #AA3EBC; color: #FFFFFF;">36.1</td>
      <td headers="stub_1_5 1000" class="gt_row gt_right" style="background-color: #AA3EBC; color: #FFFFFF;">29.1</td>
      <td headers="stub_1_5 1030" class="gt_row gt_right" style="background-color: #AA3EBC; color: #FFFFFF;">26.1</td>
      <td headers="stub_1_5 1100" class="gt_row gt_right" style="background-color: #FFA500; color: #000000;">15.2</td>
      <td headers="stub_1_5 1130" class="gt_row gt_right" style="background-color: #FFA500; color: #000000;">8.8</td>
      <td headers="stub_1_5 1200" class="gt_row gt_right" style="background-color: #FFA500; color: #000000;">5.0</td></tr>
          <tr><th id="stub_1_6" scope="row" class="gt_row gt_center gt_stub">jun</th>
      <td headers="stub_1_6 0530" class="gt_row gt_right" style="background-color: #4D4D4D; color: #FFFFFF;">89.2</td>
      <td headers="stub_1_6 0600" class="gt_row gt_right" style="background-color: #4D4D4D; color: #FFFFFF;">82.7</td>
      <td headers="stub_1_6 0630" class="gt_row gt_right" style="background-color: #4D4D4D; color: #FFFFFF;">76.0</td>
      <td headers="stub_1_6 0700" class="gt_row gt_right" style="background-color: #4D4D4D; color: #FFFFFF;">69.3</td>
      <td headers="stub_1_6 0730" class="gt_row gt_right" style="background-color: #4D2DC1; color: #FFFFFF;">62.5</td>
      <td headers="stub_1_6 0800" class="gt_row gt_right" style="background-color: #4D2DC1; color: #FFFFFF;">55.7</td>
      <td headers="stub_1_6 0830" class="gt_row gt_right" style="background-color: #4D2DC1; color: #FFFFFF;">48.8</td>
      <td headers="stub_1_6 0900" class="gt_row gt_right" style="background-color: #AA3EBC; color: #FFFFFF;">41.9</td>
      <td headers="stub_1_6 0930" class="gt_row gt_right" style="background-color: #AA3EBC; color: #FFFFFF;">35.0</td>
      <td headers="stub_1_6 1000" class="gt_row gt_right" style="background-color: #AA3EBC; color: #FFFFFF;">28.1</td>
      <td headers="stub_1_6 1030" class="gt_row gt_right" style="background-color: #FFA500; color: #000000;">21.1</td>
      <td headers="stub_1_6 1100" class="gt_row gt_right" style="background-color: #FFA500; color: #000000;">14.2</td>
      <td headers="stub_1_6 1130" class="gt_row gt_right" style="background-color: #FFA500; color: #000000;">7.3</td>
      <td headers="stub_1_6 1200" class="gt_row gt_right" style="background-color: #FFA500; color: #000000;">2.0</td></tr>
          <tr><th id="stub_1_7" scope="row" class="gt_row gt_center gt_stub">jul</th>
      <td headers="stub_1_7 0530" class="gt_row gt_right" style="background-color: #4D4D4D; color: #FFFFFF;">88.8</td>
      <td headers="stub_1_7 0600" class="gt_row gt_right" style="background-color: #4D4D4D; color: #FFFFFF;">82.3</td>
      <td headers="stub_1_7 0630" class="gt_row gt_right" style="background-color: #4D4D4D; color: #FFFFFF;">75.7</td>
      <td headers="stub_1_7 0700" class="gt_row gt_right" style="background-color: #4D4D4D; color: #FFFFFF;">69.1</td>
      <td headers="stub_1_7 0730" class="gt_row gt_right" style="background-color: #4D2DC1; color: #FFFFFF;">62.3</td>
      <td headers="stub_1_7 0800" class="gt_row gt_right" style="background-color: #4D2DC1; color: #FFFFFF;">55.5</td>
      <td headers="stub_1_7 0830" class="gt_row gt_right" style="background-color: #4D2DC1; color: #FFFFFF;">48.7</td>
      <td headers="stub_1_7 0900" class="gt_row gt_right" style="background-color: #AA3EBC; color: #FFFFFF;">41.8</td>
      <td headers="stub_1_7 0930" class="gt_row gt_right" style="background-color: #AA3EBC; color: #FFFFFF;">35.0</td>
      <td headers="stub_1_7 1000" class="gt_row gt_right" style="background-color: #AA3EBC; color: #FFFFFF;">28.1</td>
      <td headers="stub_1_7 1030" class="gt_row gt_right" style="background-color: #FFA500; color: #000000;">21.2</td>
      <td headers="stub_1_7 1100" class="gt_row gt_right" style="background-color: #FFA500; color: #000000;">14.3</td>
      <td headers="stub_1_7 1130" class="gt_row gt_right" style="background-color: #FFA500; color: #000000;">7.7</td>
      <td headers="stub_1_7 1200" class="gt_row gt_right" style="background-color: #FFA500; color: #000000;">3.1</td></tr>
          <tr><th id="stub_1_8" scope="row" class="gt_row gt_center gt_stub">aug</th>
      <td headers="stub_1_8 0530" class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;"><br /></td>
      <td headers="stub_1_8 0600" class="gt_row gt_right" style="background-color: #4D4D4D; color: #FFFFFF;">83.8</td>
      <td headers="stub_1_8 0630" class="gt_row gt_right" style="background-color: #4D4D4D; color: #FFFFFF;">77.1</td>
      <td headers="stub_1_8 0700" class="gt_row gt_right" style="background-color: #4D4D4D; color: #FFFFFF;">70.2</td>
      <td headers="stub_1_8 0730" class="gt_row gt_right" style="background-color: #4D4D4D; color: #FFFFFF;">63.3</td>
      <td headers="stub_1_8 0800" class="gt_row gt_right" style="background-color: #4D2DC1; color: #FFFFFF;">56.4</td>
      <td headers="stub_1_8 0830" class="gt_row gt_right" style="background-color: #4D2DC1; color: #FFFFFF;">49.4</td>
      <td headers="stub_1_8 0900" class="gt_row gt_right" style="background-color: #4D2DC1; color: #FFFFFF;">42.4</td>
      <td headers="stub_1_8 0930" class="gt_row gt_right" style="background-color: #AA3EBC; color: #FFFFFF;">35.4</td>
      <td headers="stub_1_8 1000" class="gt_row gt_right" style="background-color: #AA3EBC; color: #FFFFFF;">28.3</td>
      <td headers="stub_1_8 1030" class="gt_row gt_right" style="background-color: #AA3EBC; color: #FFFFFF;">21.3</td>
      <td headers="stub_1_8 1100" class="gt_row gt_right" style="background-color: #FFA500; color: #000000;">14.3</td>
      <td headers="stub_1_8 1130" class="gt_row gt_right" style="background-color: #FFA500; color: #000000;">7.3</td>
      <td headers="stub_1_8 1200" class="gt_row gt_right" style="background-color: #FFA500; color: #000000;">1.9</td></tr>
          <tr><th id="stub_1_9" scope="row" class="gt_row gt_center gt_stub">sep</th>
      <td headers="stub_1_9 0530" class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;"><br /></td>
      <td headers="stub_1_9 0600" class="gt_row gt_right" style="background-color: #4D4D4D; color: #FFFFFF;">87.2</td>
      <td headers="stub_1_9 0630" class="gt_row gt_right" style="background-color: #4D4D4D; color: #FFFFFF;">80.2</td>
      <td headers="stub_1_9 0700" class="gt_row gt_right" style="background-color: #4D4D4D; color: #FFFFFF;">73.2</td>
      <td headers="stub_1_9 0730" class="gt_row gt_right" style="background-color: #4D4D4D; color: #FFFFFF;">66.1</td>
      <td headers="stub_1_9 0800" class="gt_row gt_right" style="background-color: #4D2DC1; color: #FFFFFF;">59.1</td>
      <td headers="stub_1_9 0830" class="gt_row gt_right" style="background-color: #4D2DC1; color: #FFFFFF;">52.1</td>
      <td headers="stub_1_9 0900" class="gt_row gt_right" style="background-color: #4D2DC1; color: #FFFFFF;">45.1</td>
      <td headers="stub_1_9 0930" class="gt_row gt_right" style="background-color: #AA3EBC; color: #FFFFFF;">38.1</td>
      <td headers="stub_1_9 1000" class="gt_row gt_right" style="background-color: #AA3EBC; color: #FFFFFF;">31.3</td>
      <td headers="stub_1_9 1030" class="gt_row gt_right" style="background-color: #AA3EBC; color: #FFFFFF;">24.7</td>
      <td headers="stub_1_9 1100" class="gt_row gt_right" style="background-color: #FFA500; color: #000000;">18.6</td>
      <td headers="stub_1_9 1130" class="gt_row gt_right" style="background-color: #FFA500; color: #000000;">13.7</td>
      <td headers="stub_1_9 1200" class="gt_row gt_right" style="background-color: #FFA500; color: #000000;">11.6</td></tr>
          <tr><th id="stub_1_10" scope="row" class="gt_row gt_center gt_stub">oct</th>
      <td headers="stub_1_10 0530" class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;"><br /></td>
      <td headers="stub_1_10 0600" class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;"><br /></td>
      <td headers="stub_1_10 0630" class="gt_row gt_right" style="background-color: #4D4D4D; color: #FFFFFF;">84.1</td>
      <td headers="stub_1_10 0700" class="gt_row gt_right" style="background-color: #4D4D4D; color: #FFFFFF;">77.1</td>
      <td headers="stub_1_10 0730" class="gt_row gt_right" style="background-color: #4D4D4D; color: #FFFFFF;">70.2</td>
      <td headers="stub_1_10 0800" class="gt_row gt_right" style="background-color: #4D2DC1; color: #FFFFFF;">63.3</td>
      <td headers="stub_1_10 0830" class="gt_row gt_right" style="background-color: #4D2DC1; color: #FFFFFF;">56.5</td>
      <td headers="stub_1_10 0900" class="gt_row gt_right" style="background-color: #4D2DC1; color: #FFFFFF;">49.9</td>
      <td headers="stub_1_10 0930" class="gt_row gt_right" style="background-color: #AA3EBC; color: #FFFFFF;">43.5</td>
      <td headers="stub_1_10 1000" class="gt_row gt_right" style="background-color: #AA3EBC; color: #FFFFFF;">37.5</td>
      <td headers="stub_1_10 1030" class="gt_row gt_right" style="background-color: #AA3EBC; color: #FFFFFF;">32.0</td>
      <td headers="stub_1_10 1100" class="gt_row gt_right" style="background-color: #FFA500; color: #000000;">27.4</td>
      <td headers="stub_1_10 1130" class="gt_row gt_right" style="background-color: #FFA500; color: #000000;">24.3</td>
      <td headers="stub_1_10 1200" class="gt_row gt_right" style="background-color: #FFA500; color: #000000;">23.1</td></tr>
          <tr><th id="stub_1_11" scope="row" class="gt_row gt_center gt_stub">nov</th>
      <td headers="stub_1_11 0530" class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;"><br /></td>
      <td headers="stub_1_11 0600" class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;"><br /></td>
      <td headers="stub_1_11 0630" class="gt_row gt_right" style="background-color: #4D4D4D; color: #FFFFFF;">87.8</td>
      <td headers="stub_1_11 0700" class="gt_row gt_right" style="background-color: #4D4D4D; color: #FFFFFF;">81.3</td>
      <td headers="stub_1_11 0730" class="gt_row gt_right" style="background-color: #4D4D4D; color: #FFFFFF;">74.5</td>
      <td headers="stub_1_11 0800" class="gt_row gt_right" style="background-color: #4D2DC1; color: #FFFFFF;">68.3</td>
      <td headers="stub_1_11 0830" class="gt_row gt_right" style="background-color: #4D2DC1; color: #FFFFFF;">61.8</td>
      <td headers="stub_1_11 0900" class="gt_row gt_right" style="background-color: #4D2DC1; color: #FFFFFF;">56.0</td>
      <td headers="stub_1_11 0930" class="gt_row gt_right" style="background-color: #AA3EBC; color: #FFFFFF;">50.2</td>
      <td headers="stub_1_11 1000" class="gt_row gt_right" style="background-color: #AA3EBC; color: #FFFFFF;">45.3</td>
      <td headers="stub_1_11 1030" class="gt_row gt_right" style="background-color: #AA3EBC; color: #FFFFFF;">40.7</td>
      <td headers="stub_1_11 1100" class="gt_row gt_right" style="background-color: #FFA500; color: #000000;">37.4</td>
      <td headers="stub_1_11 1130" class="gt_row gt_right" style="background-color: #FFA500; color: #000000;">35.1</td>
      <td headers="stub_1_11 1200" class="gt_row gt_right" style="background-color: #FFA500; color: #000000;">34.4</td></tr>
          <tr><th id="stub_1_12" scope="row" class="gt_row gt_center gt_stub">dec</th>
      <td headers="stub_1_12 0530" class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;"><br /></td>
      <td headers="stub_1_12 0600" class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;"><br /></td>
      <td headers="stub_1_12 0630" class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;"><br /></td>
      <td headers="stub_1_12 0700" class="gt_row gt_right" style="background-color: #4D4D4D; color: #FFFFFF;">84.3</td>
      <td headers="stub_1_12 0730" class="gt_row gt_right" style="background-color: #4D4D4D; color: #FFFFFF;">78.0</td>
      <td headers="stub_1_12 0800" class="gt_row gt_right" style="background-color: #4D4D4D; color: #FFFFFF;">71.8</td>
      <td headers="stub_1_12 0830" class="gt_row gt_right" style="background-color: #4D2DC1; color: #FFFFFF;">66.1</td>
      <td headers="stub_1_12 0900" class="gt_row gt_right" style="background-color: #4D2DC1; color: #FFFFFF;">60.5</td>
      <td headers="stub_1_12 0930" class="gt_row gt_right" style="background-color: #4D2DC1; color: #FFFFFF;">55.6</td>
      <td headers="stub_1_12 1000" class="gt_row gt_right" style="background-color: #AA3EBC; color: #FFFFFF;">50.9</td>
      <td headers="stub_1_12 1030" class="gt_row gt_right" style="background-color: #AA3EBC; color: #FFFFFF;">47.2</td>
      <td headers="stub_1_12 1100" class="gt_row gt_right" style="background-color: #FFA500; color: #000000;">44.2</td>
      <td headers="stub_1_12 1130" class="gt_row gt_right" style="background-color: #FFA500; color: #000000;">42.4</td>
      <td headers="stub_1_12 1200" class="gt_row gt_right" style="background-color: #FFA500; color: #000000;">41.8</td></tr>
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
            <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id="a0530">0530</th>
            <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id="a0600">0600</th>
            <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id="a0630">0630</th>
            <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id="a0700">0700</th>
            <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id="a0730">0730</th>
            <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id="a0800">0800</th>
            <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id="a0830">0830</th>
            <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id="a0900">0900</th>
            <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id="a0930">0930</th>
            <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id="a1000">1000</th>
            <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id="a1030">1030</th>
            <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id="a1100">1100</th>
            <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id="a1130">1130</th>
            <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id="a1200">1200</th>
          </tr>
        </thead>
        <tbody class="gt_table_body">
          <tr><th id="stub_1_1" scope="row" class="gt_row gt_center gt_stub">jan</th>
      <td headers="stub_1_1 0530" class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;"><br /></td>
      <td headers="stub_1_1 0600" class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;"><br /></td>
      <td headers="stub_1_1 0630" class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;"><br /></td>
      <td headers="stub_1_1 0700" class="gt_row gt_right" style="background-color: #4D4D4D; color: #FFFFFF;">84.9</td>
      <td headers="stub_1_1 0730" class="gt_row gt_right" style="background-color: #55466F; color: #FFFFFF;">78.7</td>
      <td headers="stub_1_1 0800" class="gt_row gt_right" style="background-color: #563D91; color: #FFFFFF;">72.7</td>
      <td headers="stub_1_1 0830" class="gt_row gt_right" style="background-color: #5131B5; color: #FFFFFF;">66.1</td>
      <td headers="stub_1_1 0900" class="gt_row gt_right" style="background-color: #4122D9; color: #FFFFFF;">61.5</td>
      <td headers="stub_1_1 0930" class="gt_row gt_right" style="background-color: #0000FF; color: #FFFFFF;">56.5</td>
      <td headers="stub_1_1 1000" class="gt_row gt_right" style="background-color: #8928D7; color: #FFFFFF;">52.1</td>
      <td headers="stub_1_1 1030" class="gt_row gt_right" style="background-color: #B749AF; color: #FFFFFF;">48.3</td>
      <td headers="stub_1_1 1100" class="gt_row gt_right" style="background-color: #D66886; color: #FFFFFF;">45.5</td>
      <td headers="stub_1_1 1130" class="gt_row gt_right" style="background-color: #ED8758; color: #FFFFFF;">43.6</td>
      <td headers="stub_1_1 1200" class="gt_row gt_right" style="background-color: #FFA500; color: #000000;">43.0</td></tr>
          <tr><th id="stub_1_2" scope="row" class="gt_row gt_center gt_stub">feb</th>
      <td headers="stub_1_2 0530" class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;"><br /></td>
      <td headers="stub_1_2 0600" class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;"><br /></td>
      <td headers="stub_1_2 0630" class="gt_row gt_right" style="background-color: #4D4D4D; color: #FFFFFF;">88.9</td>
      <td headers="stub_1_2 0700" class="gt_row gt_right" style="background-color: #54466C; color: #FFFFFF;">82.5</td>
      <td headers="stub_1_2 0730" class="gt_row gt_right" style="background-color: #563E8B; color: #FFFFFF;">75.8</td>
      <td headers="stub_1_2 0800" class="gt_row gt_right" style="background-color: #5335AB; color: #FFFFFF;">69.6</td>
      <td headers="stub_1_2 0830" class="gt_row gt_right" style="background-color: #4828CC; color: #FFFFFF;">63.3</td>
      <td headers="stub_1_2 0900" class="gt_row gt_right" style="background-color: #2D14EE; color: #FFFFFF;">57.7</td>
      <td headers="stub_1_2 0930" class="gt_row gt_right" style="background-color: #6014ED; color: #FFFFFF;">52.2</td>
      <td headers="stub_1_2 1000" class="gt_row gt_right" style="background-color: #9C34C8; color: #FFFFFF;">47.4</td>
      <td headers="stub_1_2 1030" class="gt_row gt_right" style="background-color: #C051A3; color: #FFFFFF;">43.1</td>
      <td headers="stub_1_2 1100" class="gt_row gt_right" style="background-color: #DA6E7E; color: #FFFFFF;">40.0</td>
      <td headers="stub_1_2 1130" class="gt_row gt_right" style="background-color: #EE8954; color: #000000;">37.8</td>
      <td headers="stub_1_2 1200" class="gt_row gt_right" style="background-color: #FFA500; color: #000000;">37.2</td></tr>
          <tr><th id="stub_1_3" scope="row" class="gt_row gt_center gt_stub">mar</th>
      <td headers="stub_1_3 0530" class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;"><br /></td>
      <td headers="stub_1_3 0600" class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;"><br /></td>
      <td headers="stub_1_3 0630" class="gt_row gt_right" style="background-color: #4D4D4D; color: #FFFFFF;">85.7</td>
      <td headers="stub_1_3 0700" class="gt_row gt_right" style="background-color: #54466C; color: #FFFFFF;">78.8</td>
      <td headers="stub_1_3 0730" class="gt_row gt_right" style="background-color: #563E8B; color: #FFFFFF;">72.0</td>
      <td headers="stub_1_3 0800" class="gt_row gt_right" style="background-color: #5335AB; color: #FFFFFF;">65.2</td>
      <td headers="stub_1_3 0830" class="gt_row gt_right" style="background-color: #4828CC; color: #FFFFFF;">58.6</td>
      <td headers="stub_1_3 0900" class="gt_row gt_right" style="background-color: #2D14EE; color: #FFFFFF;">52.3</td>
      <td headers="stub_1_3 0930" class="gt_row gt_right" style="background-color: #6014ED; color: #FFFFFF;">46.2</td>
      <td headers="stub_1_3 1000" class="gt_row gt_right" style="background-color: #9C34C8; color: #FFFFFF;">40.5</td>
      <td headers="stub_1_3 1030" class="gt_row gt_right" style="background-color: #C051A3; color: #FFFFFF;">35.5</td>
      <td headers="stub_1_3 1100" class="gt_row gt_right" style="background-color: #DA6E7E; color: #FFFFFF;">31.4</td>
      <td headers="stub_1_3 1130" class="gt_row gt_right" style="background-color: #EE8954; color: #000000;">28.6</td>
      <td headers="stub_1_3 1200" class="gt_row gt_right" style="background-color: #FFA500; color: #000000;">27.7</td></tr>
          <tr><th id="stub_1_4" scope="row" class="gt_row gt_center gt_stub">apr</th>
      <td headers="stub_1_4 0530" class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;"><br /></td>
      <td headers="stub_1_4 0600" class="gt_row gt_right" style="background-color: #4D4D4D; color: #FFFFFF;">88.5</td>
      <td headers="stub_1_4 0630" class="gt_row gt_right" style="background-color: #544769; color: #FFFFFF;">81.5</td>
      <td headers="stub_1_4 0700" class="gt_row gt_right" style="background-color: #564086; color: #FFFFFF;">74.4</td>
      <td headers="stub_1_4 0730" class="gt_row gt_right" style="background-color: #5537A3; color: #FFFFFF;">67.4</td>
      <td headers="stub_1_4 0800" class="gt_row gt_right" style="background-color: #4D2DC1; color: #FFFFFF;">60.3</td>
      <td headers="stub_1_4 0830" class="gt_row gt_right" style="background-color: #3C1EE0; color: #FFFFFF;">53.4</td>
      <td headers="stub_1_4 0900" class="gt_row gt_right" style="background-color: #0000FF; color: #FFFFFF;">46.5</td>
      <td headers="stub_1_4 0930" class="gt_row gt_right" style="background-color: #7F22DD; color: #FFFFFF;">39.7</td>
      <td headers="stub_1_4 1000" class="gt_row gt_right" style="background-color: #AA3EBC; color: #FFFFFF;">33.2</td>
      <td headers="stub_1_4 1030" class="gt_row gt_right" style="background-color: #C7599A; color: #FFFFFF;">26.9</td>
      <td headers="stub_1_4 1100" class="gt_row gt_right" style="background-color: #DE7277; color: #FFFFFF;">21.3</td>
      <td headers="stub_1_4 1130" class="gt_row gt_right" style="background-color: #F08C4F; color: #000000;">17.2</td>
      <td headers="stub_1_4 1200" class="gt_row gt_right" style="background-color: #FFA500; color: #000000;">15.5</td></tr>
          <tr><th id="stub_1_5" scope="row" class="gt_row gt_center gt_stub">may</th>
      <td headers="stub_1_5 0530" class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;"><br /></td>
      <td headers="stub_1_5 0600" class="gt_row gt_right" style="background-color: #4D4D4D; color: #FFFFFF;">85.0</td>
      <td headers="stub_1_5 0630" class="gt_row gt_right" style="background-color: #544769; color: #FFFFFF;">78.2</td>
      <td headers="stub_1_5 0700" class="gt_row gt_right" style="background-color: #564086; color: #FFFFFF;">71.2</td>
      <td headers="stub_1_5 0730" class="gt_row gt_right" style="background-color: #5537A3; color: #FFFFFF;">64.3</td>
      <td headers="stub_1_5 0800" class="gt_row gt_right" style="background-color: #4D2DC1; color: #FFFFFF;">57.2</td>
      <td headers="stub_1_5 0830" class="gt_row gt_right" style="background-color: #3C1EE0; color: #FFFFFF;">50.2</td>
      <td headers="stub_1_5 0900" class="gt_row gt_right" style="background-color: #0000FF; color: #FFFFFF;">43.2</td>
      <td headers="stub_1_5 0930" class="gt_row gt_right" style="background-color: #7F22DD; color: #FFFFFF;">36.1</td>
      <td headers="stub_1_5 1000" class="gt_row gt_right" style="background-color: #AA3EBC; color: #FFFFFF;">29.1</td>
      <td headers="stub_1_5 1030" class="gt_row gt_right" style="background-color: #C7599A; color: #FFFFFF;">26.1</td>
      <td headers="stub_1_5 1100" class="gt_row gt_right" style="background-color: #DE7277; color: #FFFFFF;">15.2</td>
      <td headers="stub_1_5 1130" class="gt_row gt_right" style="background-color: #F08C4F; color: #000000;">8.8</td>
      <td headers="stub_1_5 1200" class="gt_row gt_right" style="background-color: #FFA500; color: #000000;">5.0</td></tr>
          <tr><th id="stub_1_6" scope="row" class="gt_row gt_center gt_stub">jun</th>
      <td headers="stub_1_6 0530" class="gt_row gt_right" style="background-color: #4D4D4D; color: #FFFFFF;">89.2</td>
      <td headers="stub_1_6 0600" class="gt_row gt_right" style="background-color: #534767; color: #FFFFFF;">82.7</td>
      <td headers="stub_1_6 0630" class="gt_row gt_right" style="background-color: #564181; color: #FFFFFF;">76.0</td>
      <td headers="stub_1_6 0700" class="gt_row gt_right" style="background-color: #55399C; color: #FFFFFF;">69.3</td>
      <td headers="stub_1_6 0730" class="gt_row gt_right" style="background-color: #5030B8; color: #FFFFFF;">62.5</td>
      <td headers="stub_1_6 0800" class="gt_row gt_right" style="background-color: #4424D4; color: #FFFFFF;">55.7</td>
      <td headers="stub_1_6 0830" class="gt_row gt_right" style="background-color: #2A12F0; color: #FFFFFF;">48.8</td>
      <td headers="stub_1_6 0900" class="gt_row gt_right" style="background-color: #5911EF; color: #FFFFFF;">41.9</td>
      <td headers="stub_1_6 0930" class="gt_row gt_right" style="background-color: #922DD0; color: #FFFFFF;">35.0</td>
      <td headers="stub_1_6 1000" class="gt_row gt_right" style="background-color: #B446B2; color: #FFFFFF;">28.1</td>
      <td headers="stub_1_6 1030" class="gt_row gt_right" style="background-color: #CD5E92; color: #FFFFFF;">21.1</td>
      <td headers="stub_1_6 1100" class="gt_row gt_right" style="background-color: #E17672; color: #FFFFFF;">14.2</td>
      <td headers="stub_1_6 1130" class="gt_row gt_right" style="background-color: #F18E4C; color: #000000;">7.3</td>
      <td headers="stub_1_6 1200" class="gt_row gt_right" style="background-color: #FFA500; color: #000000;">2.0</td></tr>
          <tr><th id="stub_1_7" scope="row" class="gt_row gt_center gt_stub">jul</th>
      <td headers="stub_1_7 0530" class="gt_row gt_right" style="background-color: #4D4D4D; color: #FFFFFF;">88.8</td>
      <td headers="stub_1_7 0600" class="gt_row gt_right" style="background-color: #534767; color: #FFFFFF;">82.3</td>
      <td headers="stub_1_7 0630" class="gt_row gt_right" style="background-color: #564181; color: #FFFFFF;">75.7</td>
      <td headers="stub_1_7 0700" class="gt_row gt_right" style="background-color: #55399C; color: #FFFFFF;">69.1</td>
      <td headers="stub_1_7 0730" class="gt_row gt_right" style="background-color: #5030B8; color: #FFFFFF;">62.3</td>
      <td headers="stub_1_7 0800" class="gt_row gt_right" style="background-color: #4424D4; color: #FFFFFF;">55.5</td>
      <td headers="stub_1_7 0830" class="gt_row gt_right" style="background-color: #2A12F0; color: #FFFFFF;">48.7</td>
      <td headers="stub_1_7 0900" class="gt_row gt_right" style="background-color: #5911EF; color: #FFFFFF;">41.8</td>
      <td headers="stub_1_7 0930" class="gt_row gt_right" style="background-color: #922DD0; color: #FFFFFF;">35.0</td>
      <td headers="stub_1_7 1000" class="gt_row gt_right" style="background-color: #B446B2; color: #FFFFFF;">28.1</td>
      <td headers="stub_1_7 1030" class="gt_row gt_right" style="background-color: #CD5E92; color: #FFFFFF;">21.2</td>
      <td headers="stub_1_7 1100" class="gt_row gt_right" style="background-color: #E17672; color: #FFFFFF;">14.3</td>
      <td headers="stub_1_7 1130" class="gt_row gt_right" style="background-color: #F18E4C; color: #000000;">7.7</td>
      <td headers="stub_1_7 1200" class="gt_row gt_right" style="background-color: #FFA500; color: #000000;">3.1</td></tr>
          <tr><th id="stub_1_8" scope="row" class="gt_row gt_center gt_stub">aug</th>
      <td headers="stub_1_8 0530" class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;"><br /></td>
      <td headers="stub_1_8 0600" class="gt_row gt_right" style="background-color: #4D4D4D; color: #FFFFFF;">83.8</td>
      <td headers="stub_1_8 0630" class="gt_row gt_right" style="background-color: #544769; color: #FFFFFF;">77.1</td>
      <td headers="stub_1_8 0700" class="gt_row gt_right" style="background-color: #564086; color: #FFFFFF;">70.2</td>
      <td headers="stub_1_8 0730" class="gt_row gt_right" style="background-color: #5537A3; color: #FFFFFF;">63.3</td>
      <td headers="stub_1_8 0800" class="gt_row gt_right" style="background-color: #4D2DC1; color: #FFFFFF;">56.4</td>
      <td headers="stub_1_8 0830" class="gt_row gt_right" style="background-color: #3C1EE0; color: #FFFFFF;">49.4</td>
      <td headers="stub_1_8 0900" class="gt_row gt_right" style="background-color: #0000FF; color: #FFFFFF;">42.4</td>
      <td headers="stub_1_8 0930" class="gt_row gt_right" style="background-color: #7F22DD; color: #FFFFFF;">35.4</td>
      <td headers="stub_1_8 1000" class="gt_row gt_right" style="background-color: #AA3EBC; color: #FFFFFF;">28.3</td>
      <td headers="stub_1_8 1030" class="gt_row gt_right" style="background-color: #C7599A; color: #FFFFFF;">21.3</td>
      <td headers="stub_1_8 1100" class="gt_row gt_right" style="background-color: #DE7277; color: #FFFFFF;">14.3</td>
      <td headers="stub_1_8 1130" class="gt_row gt_right" style="background-color: #F08C4F; color: #000000;">7.3</td>
      <td headers="stub_1_8 1200" class="gt_row gt_right" style="background-color: #FFA500; color: #000000;">1.9</td></tr>
          <tr><th id="stub_1_9" scope="row" class="gt_row gt_center gt_stub">sep</th>
      <td headers="stub_1_9 0530" class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;"><br /></td>
      <td headers="stub_1_9 0600" class="gt_row gt_right" style="background-color: #4D4D4D; color: #FFFFFF;">87.2</td>
      <td headers="stub_1_9 0630" class="gt_row gt_right" style="background-color: #544769; color: #FFFFFF;">80.2</td>
      <td headers="stub_1_9 0700" class="gt_row gt_right" style="background-color: #564086; color: #FFFFFF;">73.2</td>
      <td headers="stub_1_9 0730" class="gt_row gt_right" style="background-color: #5537A3; color: #FFFFFF;">66.1</td>
      <td headers="stub_1_9 0800" class="gt_row gt_right" style="background-color: #4D2DC1; color: #FFFFFF;">59.1</td>
      <td headers="stub_1_9 0830" class="gt_row gt_right" style="background-color: #3C1EE0; color: #FFFFFF;">52.1</td>
      <td headers="stub_1_9 0900" class="gt_row gt_right" style="background-color: #0000FF; color: #FFFFFF;">45.1</td>
      <td headers="stub_1_9 0930" class="gt_row gt_right" style="background-color: #7F22DD; color: #FFFFFF;">38.1</td>
      <td headers="stub_1_9 1000" class="gt_row gt_right" style="background-color: #AA3EBC; color: #FFFFFF;">31.3</td>
      <td headers="stub_1_9 1030" class="gt_row gt_right" style="background-color: #C7599A; color: #FFFFFF;">24.7</td>
      <td headers="stub_1_9 1100" class="gt_row gt_right" style="background-color: #DE7277; color: #FFFFFF;">18.6</td>
      <td headers="stub_1_9 1130" class="gt_row gt_right" style="background-color: #F08C4F; color: #000000;">13.7</td>
      <td headers="stub_1_9 1200" class="gt_row gt_right" style="background-color: #FFA500; color: #000000;">11.6</td></tr>
          <tr><th id="stub_1_10" scope="row" class="gt_row gt_center gt_stub">oct</th>
      <td headers="stub_1_10 0530" class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;"><br /></td>
      <td headers="stub_1_10 0600" class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;"><br /></td>
      <td headers="stub_1_10 0630" class="gt_row gt_right" style="background-color: #4D4D4D; color: #FFFFFF;">84.1</td>
      <td headers="stub_1_10 0700" class="gt_row gt_right" style="background-color: #54466C; color: #FFFFFF;">77.1</td>
      <td headers="stub_1_10 0730" class="gt_row gt_right" style="background-color: #563E8B; color: #FFFFFF;">70.2</td>
      <td headers="stub_1_10 0800" class="gt_row gt_right" style="background-color: #5335AB; color: #FFFFFF;">63.3</td>
      <td headers="stub_1_10 0830" class="gt_row gt_right" style="background-color: #4828CC; color: #FFFFFF;">56.5</td>
      <td headers="stub_1_10 0900" class="gt_row gt_right" style="background-color: #2D14EE; color: #FFFFFF;">49.9</td>
      <td headers="stub_1_10 0930" class="gt_row gt_right" style="background-color: #6014ED; color: #FFFFFF;">43.5</td>
      <td headers="stub_1_10 1000" class="gt_row gt_right" style="background-color: #9C34C8; color: #FFFFFF;">37.5</td>
      <td headers="stub_1_10 1030" class="gt_row gt_right" style="background-color: #C051A3; color: #FFFFFF;">32.0</td>
      <td headers="stub_1_10 1100" class="gt_row gt_right" style="background-color: #DA6E7E; color: #FFFFFF;">27.4</td>
      <td headers="stub_1_10 1130" class="gt_row gt_right" style="background-color: #EE8954; color: #000000;">24.3</td>
      <td headers="stub_1_10 1200" class="gt_row gt_right" style="background-color: #FFA500; color: #000000;">23.1</td></tr>
          <tr><th id="stub_1_11" scope="row" class="gt_row gt_center gt_stub">nov</th>
      <td headers="stub_1_11 0530" class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;"><br /></td>
      <td headers="stub_1_11 0600" class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;"><br /></td>
      <td headers="stub_1_11 0630" class="gt_row gt_right" style="background-color: #4D4D4D; color: #FFFFFF;">87.8</td>
      <td headers="stub_1_11 0700" class="gt_row gt_right" style="background-color: #54466C; color: #FFFFFF;">81.3</td>
      <td headers="stub_1_11 0730" class="gt_row gt_right" style="background-color: #563E8B; color: #FFFFFF;">74.5</td>
      <td headers="stub_1_11 0800" class="gt_row gt_right" style="background-color: #5335AB; color: #FFFFFF;">68.3</td>
      <td headers="stub_1_11 0830" class="gt_row gt_right" style="background-color: #4828CC; color: #FFFFFF;">61.8</td>
      <td headers="stub_1_11 0900" class="gt_row gt_right" style="background-color: #2D14EE; color: #FFFFFF;">56.0</td>
      <td headers="stub_1_11 0930" class="gt_row gt_right" style="background-color: #6014ED; color: #FFFFFF;">50.2</td>
      <td headers="stub_1_11 1000" class="gt_row gt_right" style="background-color: #9C34C8; color: #FFFFFF;">45.3</td>
      <td headers="stub_1_11 1030" class="gt_row gt_right" style="background-color: #C051A3; color: #FFFFFF;">40.7</td>
      <td headers="stub_1_11 1100" class="gt_row gt_right" style="background-color: #DA6E7E; color: #FFFFFF;">37.4</td>
      <td headers="stub_1_11 1130" class="gt_row gt_right" style="background-color: #EE8954; color: #000000;">35.1</td>
      <td headers="stub_1_11 1200" class="gt_row gt_right" style="background-color: #FFA500; color: #000000;">34.4</td></tr>
          <tr><th id="stub_1_12" scope="row" class="gt_row gt_center gt_stub">dec</th>
      <td headers="stub_1_12 0530" class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;"><br /></td>
      <td headers="stub_1_12 0600" class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;"><br /></td>
      <td headers="stub_1_12 0630" class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;"><br /></td>
      <td headers="stub_1_12 0700" class="gt_row gt_right" style="background-color: #4D4D4D; color: #FFFFFF;">84.3</td>
      <td headers="stub_1_12 0730" class="gt_row gt_right" style="background-color: #55466F; color: #FFFFFF;">78.0</td>
      <td headers="stub_1_12 0800" class="gt_row gt_right" style="background-color: #563D91; color: #FFFFFF;">71.8</td>
      <td headers="stub_1_12 0830" class="gt_row gt_right" style="background-color: #5131B5; color: #FFFFFF;">66.1</td>
      <td headers="stub_1_12 0900" class="gt_row gt_right" style="background-color: #4122D9; color: #FFFFFF;">60.5</td>
      <td headers="stub_1_12 0930" class="gt_row gt_right" style="background-color: #0000FF; color: #FFFFFF;">55.6</td>
      <td headers="stub_1_12 1000" class="gt_row gt_right" style="background-color: #8928D7; color: #FFFFFF;">50.9</td>
      <td headers="stub_1_12 1030" class="gt_row gt_right" style="background-color: #B749AF; color: #FFFFFF;">47.2</td>
      <td headers="stub_1_12 1100" class="gt_row gt_right" style="background-color: #D66886; color: #FFFFFF;">44.2</td>
      <td headers="stub_1_12 1130" class="gt_row gt_right" style="background-color: #ED8758; color: #FFFFFF;">42.4</td>
      <td headers="stub_1_12 1200" class="gt_row gt_right" style="background-color: #FFA500; color: #000000;">41.8</td></tr>
        </tbody>
        
      </table>

# Columns can indirectly apply coloring to other columns

    Code
      cat(render_as_html(gt_tbl))
    Output
      <table class="gt_table" data-quarto-disable-processing="false" data-quarto-bootstrap="false">
        <thead>
          <tr class="gt_col_headings">
            <th class="gt_col_heading gt_columns_bottom_border gt_left" rowspan="1" colspan="1" scope="col" id="a::stub"></th>
            <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id="a2013">2013</th>
            <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id="a2014">2014</th>
            <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id="a2015">2015</th>
            <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id="a2016">2016</th>
            <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id="a2017">2017</th>
            <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id="a2018">2018</th>
            <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id="a2019">2019</th>
            <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id="a2020">2020</th>
            <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id="a2021">2021</th>
            <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id="a2022">2022</th>
          </tr>
        </thead>
        <tbody class="gt_table_body">
          <tr><th id="stub_1_1" scope="row" class="gt_row gt_left gt_stub">Mongolia</th>
      <td headers="stub_1_1 2013" class="gt_row gt_right">2899011</td>
      <td headers="stub_1_1 2014" class="gt_row gt_right">2963113</td>
      <td headers="stub_1_1 2015" class="gt_row gt_right">3026864</td>
      <td headers="stub_1_1 2016" class="gt_row gt_right">3088856</td>
      <td headers="stub_1_1 2017" class="gt_row gt_right">3148917</td>
      <td headers="stub_1_1 2018" class="gt_row gt_right">3208189</td>
      <td headers="stub_1_1 2019" class="gt_row gt_right">3267673</td>
      <td headers="stub_1_1 2020" class="gt_row gt_right">3327204</td>
      <td headers="stub_1_1 2021" class="gt_row gt_right">3383741</td>
      <td headers="stub_1_1 2022" class="gt_row gt_right" style="background-color: #23B018; color: #FFFFFF;">3433748</td></tr>
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
            <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id="a2013">2013</th>
            <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id="a2014">2014</th>
            <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id="a2015">2015</th>
            <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id="a2016">2016</th>
            <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id="a2017">2017</th>
            <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id="a2018">2018</th>
            <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id="a2019">2019</th>
            <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id="a2020">2020</th>
            <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id="a2021">2021</th>
            <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id="a2022">2022</th>
          </tr>
        </thead>
        <tbody class="gt_table_body">
          <tr><th id="stub_1_1" scope="row" class="gt_row gt_left gt_stub">Mongolia</th>
      <td headers="stub_1_1 2013" class="gt_row gt_right">2899011</td>
      <td headers="stub_1_1 2014" class="gt_row gt_right">2963113</td>
      <td headers="stub_1_1 2015" class="gt_row gt_right">3026864</td>
      <td headers="stub_1_1 2016" class="gt_row gt_right">3088856</td>
      <td headers="stub_1_1 2017" class="gt_row gt_right">3148917</td>
      <td headers="stub_1_1 2018" class="gt_row gt_right">3208189</td>
      <td headers="stub_1_1 2019" class="gt_row gt_right">3267673</td>
      <td headers="stub_1_1 2020" class="gt_row gt_right" style="background-color: #23B018; color: #FFFFFF;">3327204</td>
      <td headers="stub_1_1 2021" class="gt_row gt_right" style="background-color: #23B018; color: #FFFFFF;">3383741</td>
      <td headers="stub_1_1 2022" class="gt_row gt_right" style="background-color: #23B018; color: #FFFFFF;">3433748</td></tr>
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
            <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id="a2013">2013</th>
            <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id="a2014">2014</th>
            <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id="a2015">2015</th>
            <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id="a2016">2016</th>
            <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id="a2017">2017</th>
            <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id="a2018">2018</th>
            <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id="a2019">2019</th>
            <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id="a2020">2020</th>
            <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id="a2021">2021</th>
            <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id="a2022">2022</th>
          </tr>
        </thead>
        <tbody class="gt_table_body">
          <tr><th id="stub_1_1" scope="row" class="gt_row gt_left gt_stub">Mongolia</th>
      <td headers="stub_1_1 2013" class="gt_row gt_right">2899011</td>
      <td headers="stub_1_1 2014" class="gt_row gt_right">2963113</td>
      <td headers="stub_1_1 2015" class="gt_row gt_right">3026864</td>
      <td headers="stub_1_1 2016" class="gt_row gt_right">3088856</td>
      <td headers="stub_1_1 2017" class="gt_row gt_right">3148917</td>
      <td headers="stub_1_1 2018" class="gt_row gt_right">3208189</td>
      <td headers="stub_1_1 2019" class="gt_row gt_right">3267673</td>
      <td headers="stub_1_1 2020" class="gt_row gt_right" style="background-color: #23B018; color: #FFFFFF;">3327204</td>
      <td headers="stub_1_1 2021" class="gt_row gt_right" style="background-color: #259719; color: #FFFFFF;">3383741</td>
      <td headers="stub_1_1 2022" class="gt_row gt_right" style="background-color: #248019; color: #FFFFFF;">3433748</td></tr>
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
            <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id="a2013">2013</th>
            <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id="a2014">2014</th>
            <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id="a2015">2015</th>
            <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id="a2016">2016</th>
            <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id="a2017">2017</th>
            <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id="a2018">2018</th>
            <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id="a2019">2019</th>
            <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id="a2020">2020</th>
            <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id="a2021">2021</th>
            <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id="a2022">2022</th>
          </tr>
        </thead>
        <tbody class="gt_table_body">
          <tr><th id="stub_1_1" scope="row" class="gt_row gt_left gt_stub">Mongolia</th>
      <td headers="stub_1_1 2013" class="gt_row gt_right">2899011</td>
      <td headers="stub_1_1 2014" class="gt_row gt_right">2963113</td>
      <td headers="stub_1_1 2015" class="gt_row gt_right">3026864</td>
      <td headers="stub_1_1 2016" class="gt_row gt_right">3088856</td>
      <td headers="stub_1_1 2017" class="gt_row gt_right">3148917</td>
      <td headers="stub_1_1 2018" class="gt_row gt_right">3208189</td>
      <td headers="stub_1_1 2019" class="gt_row gt_right">3267673</td>
      <td headers="stub_1_1 2020" class="gt_row gt_right" style="background-color: #1C4415; color: #FFFFFF;">3327204</td>
      <td headers="stub_1_1 2021" class="gt_row gt_right" style="background-color: #205917; color: #FFFFFF;">3383741</td>
      <td headers="stub_1_1 2022" class="gt_row gt_right" style="background-color: #236F19; color: #FFFFFF;">3433748</td></tr>
        </tbody>
        
      </table>

# data_color() errors gracefully with scales error (#1373)

    Code
      data_color(gt_inf)
    Condition
      Error in `data_color()`:
      ! Failed to compute colors for column `y`.
      Caused by error in `scales::col_numeric()`:
      ! Wasn't able to determine range of `domain`

# data_color() resolves rows and columns like fmt_number() (#1665).

    Code
      fmt_number(gt_simple, rows = "Datsun 710", decimals = 6)
    Condition
      Error in `fmt()`:
      ! Can't find named rows in the table
      i In gt() (`?gt::gt()`), use `rownames_to_stub = TRUE` or specify `rowname_col` to initialize row names in the table.
    Code
      data_color(gt_simple, rows = "Datsun 710")
    Condition
      Error in `data_color()`:
      ! Can't find named rows in the table
      i In gt() (`?gt::gt()`), use `rownames_to_stub = TRUE` or specify `rowname_col` to initialize row names in the table.

---

    Code
      fmt_number(gt_rows, rows = "Datsun 711", decimals = 6)
    Condition
      Error in `fmt()`:
      ! Row "Datsun 711" does not exist in the data.
    Code
      data_color(gt_rows, rows = "Datsun 711")
    Condition
      Error in `data_color()`:
      ! Row "Datsun 711" does not exist in the data.

---

    Code
      fmt_number(gt_rows, rows = 33, decimals = 6)
    Condition
      Error in `fmt()`:
      ! Row 33 does not exist in the data.
    Code
      data_color(gt_rows, rows = 33)
    Condition
      Error in `data_color()`:
      ! Row 33 does not exist in the data.

