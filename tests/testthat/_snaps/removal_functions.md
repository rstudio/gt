# The different removal functions work correctly

    Code
      cat(render_as_html(gt_tbl))
    Output
      <table class="gt_table" data-quarto-disable-processing="false" data-quarto-bootstrap="false">
        <!--/html_preserve--><caption class='gt_caption'>This is a caption</caption><!--html_preserve-->
        <thead>
          <tr class="gt_col_headings gt_spanner_row">
            <th rowspan="1" colspan="1" scope="col"></th>
            <th class="gt_center gt_columns_top_border gt_column_spanner_outer" rowspan="1" colspan="7" scope="colgroup" id="Grand Spanner">
              <div class="gt_column_spanner">Grand Spanner</div>
            </th>
          </tr>
          <tr class="gt_col_headings gt_spanner_row">
            <th class="gt_col_heading gt_columns_bottom_border gt_left" rowspan="2" colspan="1" scope="col" id="a::stub">A Stubhead Label</th>
            <th class="gt_center gt_columns_top_border gt_column_spanner_outer" rowspan="1" colspan="1" scope="col" id="Numbers">
              <div class="gt_column_spanner">Numbers</div>
            </th>
            <th class="gt_center gt_columns_top_border gt_column_spanner_outer" rowspan="1" colspan="2" scope="colgroup" id="Words">
              <div class="gt_column_spanner">Words</div>
            </th>
            <th class="gt_center gt_columns_top_border gt_column_spanner_outer" rowspan="1" colspan="3" scope="colgroup" id="Date and Time">
              <div class="gt_column_spanner">Date and Time</div>
            </th>
            <th class="gt_center gt_columns_top_border gt_column_spanner_outer" rowspan="1" colspan="1" scope="col" id="Numbers">
              <div class="gt_column_spanner">Numbers</div>
            </th>
          </tr>
          <tr class="gt_col_headings">
            <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id="num">num</th>
            <th class="gt_col_heading gt_columns_bottom_border gt_left" rowspan="1" colspan="1" scope="col" id="char">char</th>
            <th class="gt_col_heading gt_columns_bottom_border gt_center" rowspan="1" colspan="1" scope="col" id="fctr">fctr</th>
            <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id="date">date</th>
            <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id="time">time</th>
            <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id="datetime">datetime</th>
            <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id="currency">currency</th>
          </tr>
        </thead>
        <tbody class="gt_table_body">
          <tr class="gt_group_heading_row">
            <th colspan="8" class="gt_group_heading" scope="colgroup" id="grp_a">grp_a</th>
          </tr>
          <tr class="gt_row_group_first"><th id="stub_1_1" scope="row" class="gt_row gt_left gt_stub">row_1</th>
      <td headers="grp_a stub_1_1 num" class="gt_row gt_right"><span class="gt_footnote_marks" style="white-space:nowrap;font-style:italic;font-weight:normal;line-height:0;"><sup>1</sup></span> 1.111e-01</td>
      <td headers="grp_a stub_1_1 char" class="gt_row gt_left">apricot</td>
      <td headers="grp_a stub_1_1 fctr" class="gt_row gt_center">one</td>
      <td headers="grp_a stub_1_1 date" class="gt_row gt_right">2015-01-15</td>
      <td headers="grp_a stub_1_1 time" class="gt_row gt_right">13:35</td>
      <td headers="grp_a stub_1_1 datetime" class="gt_row gt_right">2018-01-01 02:22</td>
      <td headers="grp_a stub_1_1 currency" class="gt_row gt_right">49.950</td></tr>
          <tr><th id="stub_1_2" scope="row" class="gt_row gt_left gt_stub">row_2</th>
      <td headers="grp_a stub_1_2 num" class="gt_row gt_right"><span class="gt_footnote_marks" style="white-space:nowrap;font-style:italic;font-weight:normal;line-height:0;"><sup>2</sup></span> 2.222e+00</td>
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
          <tr><th id="summary_stub_grp_a_2" scope="row" class="gt_row gt_left gt_stub gt_summary_row gt_last_summary_row">max</th>
      <td headers="grp_a summary_stub_grp_a_2 num" class="gt_row gt_right gt_summary_row gt_last_summary_row">444.40</td>
      <td headers="grp_a summary_stub_grp_a_2 char" class="gt_row gt_left gt_summary_row gt_last_summary_row">—</td>
      <td headers="grp_a summary_stub_grp_a_2 fctr" class="gt_row gt_center gt_summary_row gt_last_summary_row">—</td>
      <td headers="grp_a summary_stub_grp_a_2 date" class="gt_row gt_right gt_summary_row gt_last_summary_row">—</td>
      <td headers="grp_a summary_stub_grp_a_2 time" class="gt_row gt_right gt_summary_row gt_last_summary_row">—</td>
      <td headers="grp_a summary_stub_grp_a_2 datetime" class="gt_row gt_right gt_summary_row gt_last_summary_row">—</td>
      <td headers="grp_a summary_stub_grp_a_2 currency" class="gt_row gt_right gt_summary_row gt_last_summary_row">65,100.00</td></tr>
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
          <tr><th id="grand_summary_stub_1" scope="row" class="gt_row gt_left gt_stub gt_grand_summary_row gt_first_grand_summary_row gt_last_summary_row">total</th>
      <td headers="grand_summary_stub_1 num" class="gt_row gt_right gt_grand_summary_row gt_first_grand_summary_row gt_last_summary_row">—</td>
      <td headers="grand_summary_stub_1 char" class="gt_row gt_left gt_grand_summary_row gt_first_grand_summary_row gt_last_summary_row">—</td>
      <td headers="grand_summary_stub_1 fctr" class="gt_row gt_center gt_grand_summary_row gt_first_grand_summary_row gt_last_summary_row">—</td>
      <td headers="grand_summary_stub_1 date" class="gt_row gt_right gt_grand_summary_row gt_first_grand_summary_row gt_last_summary_row">—</td>
      <td headers="grand_summary_stub_1 time" class="gt_row gt_right gt_grand_summary_row gt_first_grand_summary_row gt_last_summary_row">—</td>
      <td headers="grand_summary_stub_1 datetime" class="gt_row gt_right gt_grand_summary_row gt_first_grand_summary_row gt_last_summary_row">—</td>
      <td headers="grand_summary_stub_1 currency" class="gt_row gt_right gt_grand_summary_row gt_first_grand_summary_row gt_last_summary_row">66,509</td></tr>
        </tbody>
        <tfoot>
          <tr class="gt_footnotes">
            <td class="gt_footnote" colspan="8"><span class="gt_footnote_marks" style="white-space:nowrap;font-style:italic;font-weight:normal;line-height:0;"><sup>1</sup></span> This is a footnote.</td>
          </tr>
          <tr class="gt_footnotes">
            <td class="gt_footnote" colspan="8"><span class="gt_footnote_marks" style="white-space:nowrap;font-style:italic;font-weight:normal;line-height:0;"><sup>2</sup></span> This is a second footnote.</td>
          </tr>
          <tr class="gt_sourcenotes">
            <td class="gt_sourcenote" colspan="8">This is a source note.</td>
          </tr>
          <tr class="gt_sourcenotes">
            <td class="gt_sourcenote" colspan="8">This is a second source note.</td>
          </tr>
        </tfoot>
      </table>

---

    Code
      cat(render_as_html(gt_tbl))
    Output
      <table class="gt_table" data-quarto-disable-processing="false" data-quarto-bootstrap="false">
        <!--/html_preserve--><caption class='gt_caption'>This is a caption</caption><!--html_preserve-->
        <thead>
          <tr class="gt_heading">
            <td colspan="8" class="gt_heading gt_title gt_font_normal" style>The title of the table</td>
          </tr>
          <tr class="gt_heading">
            <td colspan="8" class="gt_heading gt_subtitle gt_font_normal gt_bottom_border" style>The table's subtitle</td>
          </tr>
          <tr class="gt_col_headings gt_spanner_row">
            <th rowspan="1" colspan="1" scope="col"></th>
            <th class="gt_center gt_columns_top_border gt_column_spanner_outer" rowspan="1" colspan="7" scope="colgroup" id="Grand Spanner">
              <div class="gt_column_spanner">Grand Spanner</div>
            </th>
          </tr>
          <tr class="gt_col_headings gt_spanner_row">
            <th class="gt_col_heading gt_columns_bottom_border gt_left" rowspan="2" colspan="1" scope="col" id="a::stub"></th>
            <th class="gt_center gt_columns_top_border gt_column_spanner_outer" rowspan="1" colspan="1" scope="col" id="Numbers">
              <div class="gt_column_spanner">Numbers</div>
            </th>
            <th class="gt_center gt_columns_top_border gt_column_spanner_outer" rowspan="1" colspan="2" scope="colgroup" id="Words">
              <div class="gt_column_spanner">Words</div>
            </th>
            <th class="gt_center gt_columns_top_border gt_column_spanner_outer" rowspan="1" colspan="3" scope="colgroup" id="Date and Time">
              <div class="gt_column_spanner">Date and Time</div>
            </th>
            <th class="gt_center gt_columns_top_border gt_column_spanner_outer" rowspan="1" colspan="1" scope="col" id="Numbers">
              <div class="gt_column_spanner">Numbers</div>
            </th>
          </tr>
          <tr class="gt_col_headings">
            <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id="num">num</th>
            <th class="gt_col_heading gt_columns_bottom_border gt_left" rowspan="1" colspan="1" scope="col" id="char">char</th>
            <th class="gt_col_heading gt_columns_bottom_border gt_center" rowspan="1" colspan="1" scope="col" id="fctr">fctr</th>
            <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id="date">date</th>
            <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id="time">time</th>
            <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id="datetime">datetime</th>
            <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id="currency">currency</th>
          </tr>
        </thead>
        <tbody class="gt_table_body">
          <tr class="gt_group_heading_row">
            <th colspan="8" class="gt_group_heading" scope="colgroup" id="grp_a">grp_a</th>
          </tr>
          <tr class="gt_row_group_first"><th id="stub_1_1" scope="row" class="gt_row gt_left gt_stub">row_1</th>
      <td headers="grp_a stub_1_1 num" class="gt_row gt_right"><span class="gt_footnote_marks" style="white-space:nowrap;font-style:italic;font-weight:normal;line-height:0;"><sup>1</sup></span> 1.111e-01</td>
      <td headers="grp_a stub_1_1 char" class="gt_row gt_left">apricot</td>
      <td headers="grp_a stub_1_1 fctr" class="gt_row gt_center">one</td>
      <td headers="grp_a stub_1_1 date" class="gt_row gt_right">2015-01-15</td>
      <td headers="grp_a stub_1_1 time" class="gt_row gt_right">13:35</td>
      <td headers="grp_a stub_1_1 datetime" class="gt_row gt_right">2018-01-01 02:22</td>
      <td headers="grp_a stub_1_1 currency" class="gt_row gt_right">49.950</td></tr>
          <tr><th id="stub_1_2" scope="row" class="gt_row gt_left gt_stub">row_2</th>
      <td headers="grp_a stub_1_2 num" class="gt_row gt_right"><span class="gt_footnote_marks" style="white-space:nowrap;font-style:italic;font-weight:normal;line-height:0;"><sup>2</sup></span> 2.222e+00</td>
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
          <tr><th id="summary_stub_grp_a_2" scope="row" class="gt_row gt_left gt_stub gt_summary_row gt_last_summary_row">max</th>
      <td headers="grp_a summary_stub_grp_a_2 num" class="gt_row gt_right gt_summary_row gt_last_summary_row">444.40</td>
      <td headers="grp_a summary_stub_grp_a_2 char" class="gt_row gt_left gt_summary_row gt_last_summary_row">—</td>
      <td headers="grp_a summary_stub_grp_a_2 fctr" class="gt_row gt_center gt_summary_row gt_last_summary_row">—</td>
      <td headers="grp_a summary_stub_grp_a_2 date" class="gt_row gt_right gt_summary_row gt_last_summary_row">—</td>
      <td headers="grp_a summary_stub_grp_a_2 time" class="gt_row gt_right gt_summary_row gt_last_summary_row">—</td>
      <td headers="grp_a summary_stub_grp_a_2 datetime" class="gt_row gt_right gt_summary_row gt_last_summary_row">—</td>
      <td headers="grp_a summary_stub_grp_a_2 currency" class="gt_row gt_right gt_summary_row gt_last_summary_row">65,100.00</td></tr>
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
          <tr><th id="grand_summary_stub_1" scope="row" class="gt_row gt_left gt_stub gt_grand_summary_row gt_first_grand_summary_row gt_last_summary_row">total</th>
      <td headers="grand_summary_stub_1 num" class="gt_row gt_right gt_grand_summary_row gt_first_grand_summary_row gt_last_summary_row">—</td>
      <td headers="grand_summary_stub_1 char" class="gt_row gt_left gt_grand_summary_row gt_first_grand_summary_row gt_last_summary_row">—</td>
      <td headers="grand_summary_stub_1 fctr" class="gt_row gt_center gt_grand_summary_row gt_first_grand_summary_row gt_last_summary_row">—</td>
      <td headers="grand_summary_stub_1 date" class="gt_row gt_right gt_grand_summary_row gt_first_grand_summary_row gt_last_summary_row">—</td>
      <td headers="grand_summary_stub_1 time" class="gt_row gt_right gt_grand_summary_row gt_first_grand_summary_row gt_last_summary_row">—</td>
      <td headers="grand_summary_stub_1 datetime" class="gt_row gt_right gt_grand_summary_row gt_first_grand_summary_row gt_last_summary_row">—</td>
      <td headers="grand_summary_stub_1 currency" class="gt_row gt_right gt_grand_summary_row gt_first_grand_summary_row gt_last_summary_row">66,509</td></tr>
        </tbody>
        <tfoot>
          <tr class="gt_footnotes">
            <td class="gt_footnote" colspan="8"><span class="gt_footnote_marks" style="white-space:nowrap;font-style:italic;font-weight:normal;line-height:0;"><sup>1</sup></span> This is a footnote.</td>
          </tr>
          <tr class="gt_footnotes">
            <td class="gt_footnote" colspan="8"><span class="gt_footnote_marks" style="white-space:nowrap;font-style:italic;font-weight:normal;line-height:0;"><sup>2</sup></span> This is a second footnote.</td>
          </tr>
          <tr class="gt_sourcenotes">
            <td class="gt_sourcenote" colspan="8">This is a source note.</td>
          </tr>
          <tr class="gt_sourcenotes">
            <td class="gt_sourcenote" colspan="8">This is a second source note.</td>
          </tr>
        </tfoot>
      </table>

---

    Code
      cat(render_as_html(gt_tbl))
    Output
      <table class="gt_table" data-quarto-disable-processing="false" data-quarto-bootstrap="false">
        <!--/html_preserve--><caption class='gt_caption'>This is a caption</caption><!--html_preserve-->
        <thead>
          <tr class="gt_heading">
            <td colspan="8" class="gt_heading gt_title gt_font_normal" style>The title of the table</td>
          </tr>
          <tr class="gt_heading">
            <td colspan="8" class="gt_heading gt_subtitle gt_font_normal gt_bottom_border" style>The table's subtitle</td>
          </tr>
          <tr class="gt_col_headings">
            <th class="gt_col_heading gt_columns_bottom_border gt_left" rowspan="1" colspan="1" scope="col" id="a::stub">A Stubhead Label</th>
            <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id="num">num</th>
            <th class="gt_col_heading gt_columns_bottom_border gt_left" rowspan="1" colspan="1" scope="col" id="char">char</th>
            <th class="gt_col_heading gt_columns_bottom_border gt_center" rowspan="1" colspan="1" scope="col" id="fctr">fctr</th>
            <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id="date">date</th>
            <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id="time">time</th>
            <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id="datetime">datetime</th>
            <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id="currency">currency</th>
          </tr>
        </thead>
        <tbody class="gt_table_body">
          <tr class="gt_group_heading_row">
            <th colspan="8" class="gt_group_heading" scope="colgroup" id="grp_a">grp_a</th>
          </tr>
          <tr class="gt_row_group_first"><th id="stub_1_1" scope="row" class="gt_row gt_left gt_stub">row_1</th>
      <td headers="grp_a stub_1_1 num" class="gt_row gt_right"><span class="gt_footnote_marks" style="white-space:nowrap;font-style:italic;font-weight:normal;line-height:0;"><sup>1</sup></span> 1.111e-01</td>
      <td headers="grp_a stub_1_1 char" class="gt_row gt_left">apricot</td>
      <td headers="grp_a stub_1_1 fctr" class="gt_row gt_center">one</td>
      <td headers="grp_a stub_1_1 date" class="gt_row gt_right">2015-01-15</td>
      <td headers="grp_a stub_1_1 time" class="gt_row gt_right">13:35</td>
      <td headers="grp_a stub_1_1 datetime" class="gt_row gt_right">2018-01-01 02:22</td>
      <td headers="grp_a stub_1_1 currency" class="gt_row gt_right">49.950</td></tr>
          <tr><th id="stub_1_2" scope="row" class="gt_row gt_left gt_stub">row_2</th>
      <td headers="grp_a stub_1_2 num" class="gt_row gt_right"><span class="gt_footnote_marks" style="white-space:nowrap;font-style:italic;font-weight:normal;line-height:0;"><sup>2</sup></span> 2.222e+00</td>
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
          <tr><th id="summary_stub_grp_a_2" scope="row" class="gt_row gt_left gt_stub gt_summary_row gt_last_summary_row">max</th>
      <td headers="grp_a summary_stub_grp_a_2 num" class="gt_row gt_right gt_summary_row gt_last_summary_row">444.40</td>
      <td headers="grp_a summary_stub_grp_a_2 char" class="gt_row gt_left gt_summary_row gt_last_summary_row">—</td>
      <td headers="grp_a summary_stub_grp_a_2 fctr" class="gt_row gt_center gt_summary_row gt_last_summary_row">—</td>
      <td headers="grp_a summary_stub_grp_a_2 date" class="gt_row gt_right gt_summary_row gt_last_summary_row">—</td>
      <td headers="grp_a summary_stub_grp_a_2 time" class="gt_row gt_right gt_summary_row gt_last_summary_row">—</td>
      <td headers="grp_a summary_stub_grp_a_2 datetime" class="gt_row gt_right gt_summary_row gt_last_summary_row">—</td>
      <td headers="grp_a summary_stub_grp_a_2 currency" class="gt_row gt_right gt_summary_row gt_last_summary_row">65,100.00</td></tr>
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
          <tr><th id="grand_summary_stub_1" scope="row" class="gt_row gt_left gt_stub gt_grand_summary_row gt_first_grand_summary_row gt_last_summary_row">total</th>
      <td headers="grand_summary_stub_1 num" class="gt_row gt_right gt_grand_summary_row gt_first_grand_summary_row gt_last_summary_row">—</td>
      <td headers="grand_summary_stub_1 char" class="gt_row gt_left gt_grand_summary_row gt_first_grand_summary_row gt_last_summary_row">—</td>
      <td headers="grand_summary_stub_1 fctr" class="gt_row gt_center gt_grand_summary_row gt_first_grand_summary_row gt_last_summary_row">—</td>
      <td headers="grand_summary_stub_1 date" class="gt_row gt_right gt_grand_summary_row gt_first_grand_summary_row gt_last_summary_row">—</td>
      <td headers="grand_summary_stub_1 time" class="gt_row gt_right gt_grand_summary_row gt_first_grand_summary_row gt_last_summary_row">—</td>
      <td headers="grand_summary_stub_1 datetime" class="gt_row gt_right gt_grand_summary_row gt_first_grand_summary_row gt_last_summary_row">—</td>
      <td headers="grand_summary_stub_1 currency" class="gt_row gt_right gt_grand_summary_row gt_first_grand_summary_row gt_last_summary_row">66,509</td></tr>
        </tbody>
        <tfoot>
          <tr class="gt_footnotes">
            <td class="gt_footnote" colspan="8"><span class="gt_footnote_marks" style="white-space:nowrap;font-style:italic;font-weight:normal;line-height:0;"><sup>1</sup></span> This is a footnote.</td>
          </tr>
          <tr class="gt_footnotes">
            <td class="gt_footnote" colspan="8"><span class="gt_footnote_marks" style="white-space:nowrap;font-style:italic;font-weight:normal;line-height:0;"><sup>2</sup></span> This is a second footnote.</td>
          </tr>
          <tr class="gt_sourcenotes">
            <td class="gt_sourcenote" colspan="8">This is a source note.</td>
          </tr>
          <tr class="gt_sourcenotes">
            <td class="gt_sourcenote" colspan="8">This is a second source note.</td>
          </tr>
        </tfoot>
      </table>

---

    Code
      cat(render_as_html(gt_tbl))
    Output
      <table class="gt_table" data-quarto-disable-processing="false" data-quarto-bootstrap="false">
        <!--/html_preserve--><caption class='gt_caption'>This is a caption</caption><!--html_preserve-->
        <thead>
          <tr class="gt_heading">
            <td colspan="8" class="gt_heading gt_title gt_font_normal" style>The title of the table</td>
          </tr>
          <tr class="gt_heading">
            <td colspan="8" class="gt_heading gt_subtitle gt_font_normal gt_bottom_border" style>The table's subtitle</td>
          </tr>
          <tr class="gt_col_headings gt_spanner_row">
            <th rowspan="1" colspan="1" scope="col"></th>
            <th class="gt_center gt_columns_top_border gt_column_spanner_outer" rowspan="1" colspan="7" scope="colgroup" id="Grand Spanner">
              <div class="gt_column_spanner">Grand Spanner</div>
            </th>
          </tr>
          <tr class="gt_col_headings gt_spanner_row">
            <th class="gt_col_heading gt_columns_bottom_border gt_left" rowspan="2" colspan="1" scope="col" id="a::stub">A Stubhead Label</th>
            <th class="gt_center gt_columns_top_border gt_column_spanner_outer" rowspan="1" colspan="1" scope="col" id="Numbers">
              <div class="gt_column_spanner">Numbers</div>
            </th>
            <th class="gt_center gt_columns_top_border gt_column_spanner_outer" rowspan="1" colspan="2" scope="colgroup" id="Words">
              <div class="gt_column_spanner">Words</div>
            </th>
            <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="2" colspan="1" scope="col" id="date">date</th>
            <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="2" colspan="1" scope="col" id="time">time</th>
            <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="2" colspan="1" scope="col" id="datetime">datetime</th>
            <th class="gt_center gt_columns_top_border gt_column_spanner_outer" rowspan="1" colspan="1" scope="col" id="Numbers">
              <div class="gt_column_spanner">Numbers</div>
            </th>
          </tr>
          <tr class="gt_col_headings">
            <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id="num">num</th>
            <th class="gt_col_heading gt_columns_bottom_border gt_left" rowspan="1" colspan="1" scope="col" id="char">char</th>
            <th class="gt_col_heading gt_columns_bottom_border gt_center" rowspan="1" colspan="1" scope="col" id="fctr">fctr</th>
            <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id="currency">currency</th>
          </tr>
        </thead>
        <tbody class="gt_table_body">
          <tr class="gt_group_heading_row">
            <th colspan="8" class="gt_group_heading" scope="colgroup" id="grp_a">grp_a</th>
          </tr>
          <tr class="gt_row_group_first"><th id="stub_1_1" scope="row" class="gt_row gt_left gt_stub">row_1</th>
      <td headers="grp_a stub_1_1 num" class="gt_row gt_right"><span class="gt_footnote_marks" style="white-space:nowrap;font-style:italic;font-weight:normal;line-height:0;"><sup>1</sup></span> 1.111e-01</td>
      <td headers="grp_a stub_1_1 char" class="gt_row gt_left">apricot</td>
      <td headers="grp_a stub_1_1 fctr" class="gt_row gt_center">one</td>
      <td headers="grp_a stub_1_1 date" class="gt_row gt_right">2015-01-15</td>
      <td headers="grp_a stub_1_1 time" class="gt_row gt_right">13:35</td>
      <td headers="grp_a stub_1_1 datetime" class="gt_row gt_right">2018-01-01 02:22</td>
      <td headers="grp_a stub_1_1 currency" class="gt_row gt_right">49.950</td></tr>
          <tr><th id="stub_1_2" scope="row" class="gt_row gt_left gt_stub">row_2</th>
      <td headers="grp_a stub_1_2 num" class="gt_row gt_right"><span class="gt_footnote_marks" style="white-space:nowrap;font-style:italic;font-weight:normal;line-height:0;"><sup>2</sup></span> 2.222e+00</td>
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
          <tr><th id="summary_stub_grp_a_2" scope="row" class="gt_row gt_left gt_stub gt_summary_row gt_last_summary_row">max</th>
      <td headers="grp_a summary_stub_grp_a_2 num" class="gt_row gt_right gt_summary_row gt_last_summary_row">444.40</td>
      <td headers="grp_a summary_stub_grp_a_2 char" class="gt_row gt_left gt_summary_row gt_last_summary_row">—</td>
      <td headers="grp_a summary_stub_grp_a_2 fctr" class="gt_row gt_center gt_summary_row gt_last_summary_row">—</td>
      <td headers="grp_a summary_stub_grp_a_2 date" class="gt_row gt_right gt_summary_row gt_last_summary_row">—</td>
      <td headers="grp_a summary_stub_grp_a_2 time" class="gt_row gt_right gt_summary_row gt_last_summary_row">—</td>
      <td headers="grp_a summary_stub_grp_a_2 datetime" class="gt_row gt_right gt_summary_row gt_last_summary_row">—</td>
      <td headers="grp_a summary_stub_grp_a_2 currency" class="gt_row gt_right gt_summary_row gt_last_summary_row">65,100.00</td></tr>
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
          <tr><th id="grand_summary_stub_1" scope="row" class="gt_row gt_left gt_stub gt_grand_summary_row gt_first_grand_summary_row gt_last_summary_row">total</th>
      <td headers="grand_summary_stub_1 num" class="gt_row gt_right gt_grand_summary_row gt_first_grand_summary_row gt_last_summary_row">—</td>
      <td headers="grand_summary_stub_1 char" class="gt_row gt_left gt_grand_summary_row gt_first_grand_summary_row gt_last_summary_row">—</td>
      <td headers="grand_summary_stub_1 fctr" class="gt_row gt_center gt_grand_summary_row gt_first_grand_summary_row gt_last_summary_row">—</td>
      <td headers="grand_summary_stub_1 date" class="gt_row gt_right gt_grand_summary_row gt_first_grand_summary_row gt_last_summary_row">—</td>
      <td headers="grand_summary_stub_1 time" class="gt_row gt_right gt_grand_summary_row gt_first_grand_summary_row gt_last_summary_row">—</td>
      <td headers="grand_summary_stub_1 datetime" class="gt_row gt_right gt_grand_summary_row gt_first_grand_summary_row gt_last_summary_row">—</td>
      <td headers="grand_summary_stub_1 currency" class="gt_row gt_right gt_grand_summary_row gt_first_grand_summary_row gt_last_summary_row">66,509</td></tr>
        </tbody>
        <tfoot>
          <tr class="gt_footnotes">
            <td class="gt_footnote" colspan="8"><span class="gt_footnote_marks" style="white-space:nowrap;font-style:italic;font-weight:normal;line-height:0;"><sup>1</sup></span> This is a footnote.</td>
          </tr>
          <tr class="gt_footnotes">
            <td class="gt_footnote" colspan="8"><span class="gt_footnote_marks" style="white-space:nowrap;font-style:italic;font-weight:normal;line-height:0;"><sup>2</sup></span> This is a second footnote.</td>
          </tr>
          <tr class="gt_sourcenotes">
            <td class="gt_sourcenote" colspan="8">This is a source note.</td>
          </tr>
          <tr class="gt_sourcenotes">
            <td class="gt_sourcenote" colspan="8">This is a second source note.</td>
          </tr>
        </tfoot>
      </table>

---

    Code
      cat(render_as_html(gt_tbl))
    Output
      <table class="gt_table" data-quarto-disable-processing="false" data-quarto-bootstrap="false">
        <!--/html_preserve--><caption class='gt_caption'>This is a caption</caption><!--html_preserve-->
        <thead>
          <tr class="gt_heading">
            <td colspan="8" class="gt_heading gt_title gt_font_normal" style>The title of the table</td>
          </tr>
          <tr class="gt_heading">
            <td colspan="8" class="gt_heading gt_subtitle gt_font_normal gt_bottom_border" style>The table's subtitle</td>
          </tr>
          <tr class="gt_col_headings gt_spanner_row">
            <th rowspan="1" colspan="1" scope="col"></th>
            <th class="gt_center gt_columns_top_border gt_column_spanner_outer" rowspan="1" colspan="7" scope="colgroup" id="Grand Spanner">
              <div class="gt_column_spanner">Grand Spanner</div>
            </th>
          </tr>
          <tr class="gt_col_headings gt_spanner_row">
            <th class="gt_col_heading gt_columns_bottom_border gt_left" rowspan="2" colspan="1" scope="col" id="a::stub">A Stubhead Label</th>
            <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="2" colspan="1" scope="col" id="num">num</th>
            <th class="gt_center gt_columns_top_border gt_column_spanner_outer" rowspan="1" colspan="2" scope="colgroup" id="Words">
              <div class="gt_column_spanner">Words</div>
            </th>
            <th class="gt_center gt_columns_top_border gt_column_spanner_outer" rowspan="1" colspan="3" scope="colgroup" id="Date and Time">
              <div class="gt_column_spanner">Date and Time</div>
            </th>
            <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="2" colspan="1" scope="col" id="currency">currency</th>
          </tr>
          <tr class="gt_col_headings">
            <th class="gt_col_heading gt_columns_bottom_border gt_left" rowspan="1" colspan="1" scope="col" id="char">char</th>
            <th class="gt_col_heading gt_columns_bottom_border gt_center" rowspan="1" colspan="1" scope="col" id="fctr">fctr</th>
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
      <td headers="grp_a stub_1_1 num" class="gt_row gt_right"><span class="gt_footnote_marks" style="white-space:nowrap;font-style:italic;font-weight:normal;line-height:0;"><sup>1</sup></span> 1.111e-01</td>
      <td headers="grp_a stub_1_1 char" class="gt_row gt_left">apricot</td>
      <td headers="grp_a stub_1_1 fctr" class="gt_row gt_center">one</td>
      <td headers="grp_a stub_1_1 date" class="gt_row gt_right">2015-01-15</td>
      <td headers="grp_a stub_1_1 time" class="gt_row gt_right">13:35</td>
      <td headers="grp_a stub_1_1 datetime" class="gt_row gt_right">2018-01-01 02:22</td>
      <td headers="grp_a stub_1_1 currency" class="gt_row gt_right">49.950</td></tr>
          <tr><th id="stub_1_2" scope="row" class="gt_row gt_left gt_stub">row_2</th>
      <td headers="grp_a stub_1_2 num" class="gt_row gt_right"><span class="gt_footnote_marks" style="white-space:nowrap;font-style:italic;font-weight:normal;line-height:0;"><sup>2</sup></span> 2.222e+00</td>
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
          <tr><th id="summary_stub_grp_a_2" scope="row" class="gt_row gt_left gt_stub gt_summary_row gt_last_summary_row">max</th>
      <td headers="grp_a summary_stub_grp_a_2 num" class="gt_row gt_right gt_summary_row gt_last_summary_row">444.40</td>
      <td headers="grp_a summary_stub_grp_a_2 char" class="gt_row gt_left gt_summary_row gt_last_summary_row">—</td>
      <td headers="grp_a summary_stub_grp_a_2 fctr" class="gt_row gt_center gt_summary_row gt_last_summary_row">—</td>
      <td headers="grp_a summary_stub_grp_a_2 date" class="gt_row gt_right gt_summary_row gt_last_summary_row">—</td>
      <td headers="grp_a summary_stub_grp_a_2 time" class="gt_row gt_right gt_summary_row gt_last_summary_row">—</td>
      <td headers="grp_a summary_stub_grp_a_2 datetime" class="gt_row gt_right gt_summary_row gt_last_summary_row">—</td>
      <td headers="grp_a summary_stub_grp_a_2 currency" class="gt_row gt_right gt_summary_row gt_last_summary_row">65,100.00</td></tr>
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
          <tr><th id="grand_summary_stub_1" scope="row" class="gt_row gt_left gt_stub gt_grand_summary_row gt_first_grand_summary_row gt_last_summary_row">total</th>
      <td headers="grand_summary_stub_1 num" class="gt_row gt_right gt_grand_summary_row gt_first_grand_summary_row gt_last_summary_row">—</td>
      <td headers="grand_summary_stub_1 char" class="gt_row gt_left gt_grand_summary_row gt_first_grand_summary_row gt_last_summary_row">—</td>
      <td headers="grand_summary_stub_1 fctr" class="gt_row gt_center gt_grand_summary_row gt_first_grand_summary_row gt_last_summary_row">—</td>
      <td headers="grand_summary_stub_1 date" class="gt_row gt_right gt_grand_summary_row gt_first_grand_summary_row gt_last_summary_row">—</td>
      <td headers="grand_summary_stub_1 time" class="gt_row gt_right gt_grand_summary_row gt_first_grand_summary_row gt_last_summary_row">—</td>
      <td headers="grand_summary_stub_1 datetime" class="gt_row gt_right gt_grand_summary_row gt_first_grand_summary_row gt_last_summary_row">—</td>
      <td headers="grand_summary_stub_1 currency" class="gt_row gt_right gt_grand_summary_row gt_first_grand_summary_row gt_last_summary_row">66,509</td></tr>
        </tbody>
        <tfoot>
          <tr class="gt_footnotes">
            <td class="gt_footnote" colspan="8"><span class="gt_footnote_marks" style="white-space:nowrap;font-style:italic;font-weight:normal;line-height:0;"><sup>1</sup></span> This is a footnote.</td>
          </tr>
          <tr class="gt_footnotes">
            <td class="gt_footnote" colspan="8"><span class="gt_footnote_marks" style="white-space:nowrap;font-style:italic;font-weight:normal;line-height:0;"><sup>2</sup></span> This is a second footnote.</td>
          </tr>
          <tr class="gt_sourcenotes">
            <td class="gt_sourcenote" colspan="8">This is a source note.</td>
          </tr>
          <tr class="gt_sourcenotes">
            <td class="gt_sourcenote" colspan="8">This is a second source note.</td>
          </tr>
        </tfoot>
      </table>

---

    Code
      cat(render_as_html(gt_tbl))
    Output
      <table class="gt_table" data-quarto-disable-processing="false" data-quarto-bootstrap="false">
        <!--/html_preserve--><caption class='gt_caption'>This is a caption</caption><!--html_preserve-->
        <thead>
          <tr class="gt_heading">
            <td colspan="8" class="gt_heading gt_title gt_font_normal" style>The title of the table</td>
          </tr>
          <tr class="gt_heading">
            <td colspan="8" class="gt_heading gt_subtitle gt_font_normal gt_bottom_border" style>The table's subtitle</td>
          </tr>
          <tr class="gt_col_headings gt_spanner_row">
            <th rowspan="1" colspan="1" scope="col"></th>
            <th class="gt_center gt_columns_top_border gt_column_spanner_outer" rowspan="1" colspan="7" scope="colgroup" id="Grand Spanner">
              <div class="gt_column_spanner">Grand Spanner</div>
            </th>
          </tr>
          <tr class="gt_col_headings gt_spanner_row">
            <th class="gt_col_heading gt_columns_bottom_border gt_left" rowspan="2" colspan="1" scope="col" id="a::stub">A Stubhead Label</th>
            <th class="gt_center gt_columns_top_border gt_column_spanner_outer" rowspan="1" colspan="1" scope="col" id="Numbers">
              <div class="gt_column_spanner">Numbers</div>
            </th>
            <th class="gt_col_heading gt_columns_bottom_border gt_left" rowspan="2" colspan="1" scope="col" id="char">char</th>
            <th class="gt_col_heading gt_columns_bottom_border gt_center" rowspan="2" colspan="1" scope="col" id="fctr">fctr</th>
            <th class="gt_center gt_columns_top_border gt_column_spanner_outer" rowspan="1" colspan="3" scope="colgroup" id="Date and Time">
              <div class="gt_column_spanner">Date and Time</div>
            </th>
            <th class="gt_center gt_columns_top_border gt_column_spanner_outer" rowspan="1" colspan="1" scope="col" id="Numbers">
              <div class="gt_column_spanner">Numbers</div>
            </th>
          </tr>
          <tr class="gt_col_headings">
            <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id="num">num</th>
            <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id="date">date</th>
            <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id="time">time</th>
            <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id="datetime">datetime</th>
            <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id="currency">currency</th>
          </tr>
        </thead>
        <tbody class="gt_table_body">
          <tr class="gt_group_heading_row">
            <th colspan="8" class="gt_group_heading" scope="colgroup" id="grp_a">grp_a</th>
          </tr>
          <tr class="gt_row_group_first"><th id="stub_1_1" scope="row" class="gt_row gt_left gt_stub">row_1</th>
      <td headers="grp_a stub_1_1 num" class="gt_row gt_right"><span class="gt_footnote_marks" style="white-space:nowrap;font-style:italic;font-weight:normal;line-height:0;"><sup>1</sup></span> 1.111e-01</td>
      <td headers="grp_a stub_1_1 char" class="gt_row gt_left">apricot</td>
      <td headers="grp_a stub_1_1 fctr" class="gt_row gt_center">one</td>
      <td headers="grp_a stub_1_1 date" class="gt_row gt_right">2015-01-15</td>
      <td headers="grp_a stub_1_1 time" class="gt_row gt_right">13:35</td>
      <td headers="grp_a stub_1_1 datetime" class="gt_row gt_right">2018-01-01 02:22</td>
      <td headers="grp_a stub_1_1 currency" class="gt_row gt_right">49.950</td></tr>
          <tr><th id="stub_1_2" scope="row" class="gt_row gt_left gt_stub">row_2</th>
      <td headers="grp_a stub_1_2 num" class="gt_row gt_right"><span class="gt_footnote_marks" style="white-space:nowrap;font-style:italic;font-weight:normal;line-height:0;"><sup>2</sup></span> 2.222e+00</td>
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
          <tr><th id="summary_stub_grp_a_2" scope="row" class="gt_row gt_left gt_stub gt_summary_row gt_last_summary_row">max</th>
      <td headers="grp_a summary_stub_grp_a_2 num" class="gt_row gt_right gt_summary_row gt_last_summary_row">444.40</td>
      <td headers="grp_a summary_stub_grp_a_2 char" class="gt_row gt_left gt_summary_row gt_last_summary_row">—</td>
      <td headers="grp_a summary_stub_grp_a_2 fctr" class="gt_row gt_center gt_summary_row gt_last_summary_row">—</td>
      <td headers="grp_a summary_stub_grp_a_2 date" class="gt_row gt_right gt_summary_row gt_last_summary_row">—</td>
      <td headers="grp_a summary_stub_grp_a_2 time" class="gt_row gt_right gt_summary_row gt_last_summary_row">—</td>
      <td headers="grp_a summary_stub_grp_a_2 datetime" class="gt_row gt_right gt_summary_row gt_last_summary_row">—</td>
      <td headers="grp_a summary_stub_grp_a_2 currency" class="gt_row gt_right gt_summary_row gt_last_summary_row">65,100.00</td></tr>
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
          <tr><th id="grand_summary_stub_1" scope="row" class="gt_row gt_left gt_stub gt_grand_summary_row gt_first_grand_summary_row gt_last_summary_row">total</th>
      <td headers="grand_summary_stub_1 num" class="gt_row gt_right gt_grand_summary_row gt_first_grand_summary_row gt_last_summary_row">—</td>
      <td headers="grand_summary_stub_1 char" class="gt_row gt_left gt_grand_summary_row gt_first_grand_summary_row gt_last_summary_row">—</td>
      <td headers="grand_summary_stub_1 fctr" class="gt_row gt_center gt_grand_summary_row gt_first_grand_summary_row gt_last_summary_row">—</td>
      <td headers="grand_summary_stub_1 date" class="gt_row gt_right gt_grand_summary_row gt_first_grand_summary_row gt_last_summary_row">—</td>
      <td headers="grand_summary_stub_1 time" class="gt_row gt_right gt_grand_summary_row gt_first_grand_summary_row gt_last_summary_row">—</td>
      <td headers="grand_summary_stub_1 datetime" class="gt_row gt_right gt_grand_summary_row gt_first_grand_summary_row gt_last_summary_row">—</td>
      <td headers="grand_summary_stub_1 currency" class="gt_row gt_right gt_grand_summary_row gt_first_grand_summary_row gt_last_summary_row">66,509</td></tr>
        </tbody>
        <tfoot>
          <tr class="gt_footnotes">
            <td class="gt_footnote" colspan="8"><span class="gt_footnote_marks" style="white-space:nowrap;font-style:italic;font-weight:normal;line-height:0;"><sup>1</sup></span> This is a footnote.</td>
          </tr>
          <tr class="gt_footnotes">
            <td class="gt_footnote" colspan="8"><span class="gt_footnote_marks" style="white-space:nowrap;font-style:italic;font-weight:normal;line-height:0;"><sup>2</sup></span> This is a second footnote.</td>
          </tr>
          <tr class="gt_sourcenotes">
            <td class="gt_sourcenote" colspan="8">This is a source note.</td>
          </tr>
          <tr class="gt_sourcenotes">
            <td class="gt_sourcenote" colspan="8">This is a second source note.</td>
          </tr>
        </tfoot>
      </table>

---

    Code
      cat(render_as_html(gt_tbl))
    Output
      <table class="gt_table" data-quarto-disable-processing="false" data-quarto-bootstrap="false">
        <!--/html_preserve--><caption class='gt_caption'>This is a caption</caption><!--html_preserve-->
        <thead>
          <tr class="gt_heading">
            <td colspan="8" class="gt_heading gt_title gt_font_normal" style>The title of the table</td>
          </tr>
          <tr class="gt_heading">
            <td colspan="8" class="gt_heading gt_subtitle gt_font_normal gt_bottom_border" style>The table's subtitle</td>
          </tr>
          <tr class="gt_col_headings gt_spanner_row">
            <th class="gt_col_heading gt_columns_bottom_border gt_left" rowspan="2" colspan="1" scope="col" id="a::stub">A Stubhead Label</th>
            <th class="gt_center gt_columns_top_border gt_column_spanner_outer" rowspan="1" colspan="1" scope="col" id="Numbers">
              <div class="gt_column_spanner">Numbers</div>
            </th>
            <th class="gt_center gt_columns_top_border gt_column_spanner_outer" rowspan="1" colspan="2" scope="colgroup" id="Words">
              <div class="gt_column_spanner">Words</div>
            </th>
            <th class="gt_center gt_columns_top_border gt_column_spanner_outer" rowspan="1" colspan="3" scope="colgroup" id="Date and Time">
              <div class="gt_column_spanner">Date and Time</div>
            </th>
            <th class="gt_center gt_columns_top_border gt_column_spanner_outer" rowspan="1" colspan="1" scope="col" id="Numbers">
              <div class="gt_column_spanner">Numbers</div>
            </th>
          </tr>
          <tr class="gt_col_headings">
            <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id="num">num</th>
            <th class="gt_col_heading gt_columns_bottom_border gt_left" rowspan="1" colspan="1" scope="col" id="char">char</th>
            <th class="gt_col_heading gt_columns_bottom_border gt_center" rowspan="1" colspan="1" scope="col" id="fctr">fctr</th>
            <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id="date">date</th>
            <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id="time">time</th>
            <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id="datetime">datetime</th>
            <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id="currency">currency</th>
          </tr>
        </thead>
        <tbody class="gt_table_body">
          <tr class="gt_group_heading_row">
            <th colspan="8" class="gt_group_heading" scope="colgroup" id="grp_a">grp_a</th>
          </tr>
          <tr class="gt_row_group_first"><th id="stub_1_1" scope="row" class="gt_row gt_left gt_stub">row_1</th>
      <td headers="grp_a stub_1_1 num" class="gt_row gt_right"><span class="gt_footnote_marks" style="white-space:nowrap;font-style:italic;font-weight:normal;line-height:0;"><sup>1</sup></span> 1.111e-01</td>
      <td headers="grp_a stub_1_1 char" class="gt_row gt_left">apricot</td>
      <td headers="grp_a stub_1_1 fctr" class="gt_row gt_center">one</td>
      <td headers="grp_a stub_1_1 date" class="gt_row gt_right">2015-01-15</td>
      <td headers="grp_a stub_1_1 time" class="gt_row gt_right">13:35</td>
      <td headers="grp_a stub_1_1 datetime" class="gt_row gt_right">2018-01-01 02:22</td>
      <td headers="grp_a stub_1_1 currency" class="gt_row gt_right">49.950</td></tr>
          <tr><th id="stub_1_2" scope="row" class="gt_row gt_left gt_stub">row_2</th>
      <td headers="grp_a stub_1_2 num" class="gt_row gt_right"><span class="gt_footnote_marks" style="white-space:nowrap;font-style:italic;font-weight:normal;line-height:0;"><sup>2</sup></span> 2.222e+00</td>
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
          <tr><th id="summary_stub_grp_a_2" scope="row" class="gt_row gt_left gt_stub gt_summary_row gt_last_summary_row">max</th>
      <td headers="grp_a summary_stub_grp_a_2 num" class="gt_row gt_right gt_summary_row gt_last_summary_row">444.40</td>
      <td headers="grp_a summary_stub_grp_a_2 char" class="gt_row gt_left gt_summary_row gt_last_summary_row">—</td>
      <td headers="grp_a summary_stub_grp_a_2 fctr" class="gt_row gt_center gt_summary_row gt_last_summary_row">—</td>
      <td headers="grp_a summary_stub_grp_a_2 date" class="gt_row gt_right gt_summary_row gt_last_summary_row">—</td>
      <td headers="grp_a summary_stub_grp_a_2 time" class="gt_row gt_right gt_summary_row gt_last_summary_row">—</td>
      <td headers="grp_a summary_stub_grp_a_2 datetime" class="gt_row gt_right gt_summary_row gt_last_summary_row">—</td>
      <td headers="grp_a summary_stub_grp_a_2 currency" class="gt_row gt_right gt_summary_row gt_last_summary_row">65,100.00</td></tr>
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
          <tr><th id="grand_summary_stub_1" scope="row" class="gt_row gt_left gt_stub gt_grand_summary_row gt_first_grand_summary_row gt_last_summary_row">total</th>
      <td headers="grand_summary_stub_1 num" class="gt_row gt_right gt_grand_summary_row gt_first_grand_summary_row gt_last_summary_row">—</td>
      <td headers="grand_summary_stub_1 char" class="gt_row gt_left gt_grand_summary_row gt_first_grand_summary_row gt_last_summary_row">—</td>
      <td headers="grand_summary_stub_1 fctr" class="gt_row gt_center gt_grand_summary_row gt_first_grand_summary_row gt_last_summary_row">—</td>
      <td headers="grand_summary_stub_1 date" class="gt_row gt_right gt_grand_summary_row gt_first_grand_summary_row gt_last_summary_row">—</td>
      <td headers="grand_summary_stub_1 time" class="gt_row gt_right gt_grand_summary_row gt_first_grand_summary_row gt_last_summary_row">—</td>
      <td headers="grand_summary_stub_1 datetime" class="gt_row gt_right gt_grand_summary_row gt_first_grand_summary_row gt_last_summary_row">—</td>
      <td headers="grand_summary_stub_1 currency" class="gt_row gt_right gt_grand_summary_row gt_first_grand_summary_row gt_last_summary_row">66,509</td></tr>
        </tbody>
        <tfoot>
          <tr class="gt_footnotes">
            <td class="gt_footnote" colspan="8"><span class="gt_footnote_marks" style="white-space:nowrap;font-style:italic;font-weight:normal;line-height:0;"><sup>1</sup></span> This is a footnote.</td>
          </tr>
          <tr class="gt_footnotes">
            <td class="gt_footnote" colspan="8"><span class="gt_footnote_marks" style="white-space:nowrap;font-style:italic;font-weight:normal;line-height:0;"><sup>2</sup></span> This is a second footnote.</td>
          </tr>
          <tr class="gt_sourcenotes">
            <td class="gt_sourcenote" colspan="8">This is a source note.</td>
          </tr>
          <tr class="gt_sourcenotes">
            <td class="gt_sourcenote" colspan="8">This is a second source note.</td>
          </tr>
        </tfoot>
      </table>

---

    Code
      cat(render_as_html(gt_tbl))
    Output
      <table class="gt_table" data-quarto-disable-processing="false" data-quarto-bootstrap="false">
        <!--/html_preserve--><caption class='gt_caption'>This is a caption</caption><!--html_preserve-->
        <thead>
          <tr class="gt_heading">
            <td colspan="8" class="gt_heading gt_title gt_font_normal" style>The title of the table</td>
          </tr>
          <tr class="gt_heading">
            <td colspan="8" class="gt_heading gt_subtitle gt_font_normal gt_bottom_border" style>The table's subtitle</td>
          </tr>
          <tr class="gt_col_headings gt_spanner_row">
            <th class="gt_col_heading gt_columns_bottom_border gt_left" rowspan="2" colspan="1" scope="col" id="a::stub">A Stubhead Label</th>
            <th class="gt_center gt_columns_top_border gt_column_spanner_outer" rowspan="1" colspan="7" scope="colgroup" id="Grand Spanner">
              <div class="gt_column_spanner">Grand Spanner</div>
            </th>
          </tr>
          <tr class="gt_col_headings">
            <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id="num">num</th>
            <th class="gt_col_heading gt_columns_bottom_border gt_left" rowspan="1" colspan="1" scope="col" id="char">char</th>
            <th class="gt_col_heading gt_columns_bottom_border gt_center" rowspan="1" colspan="1" scope="col" id="fctr">fctr</th>
            <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id="date">date</th>
            <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id="time">time</th>
            <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id="datetime">datetime</th>
            <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id="currency">currency</th>
          </tr>
        </thead>
        <tbody class="gt_table_body">
          <tr class="gt_group_heading_row">
            <th colspan="8" class="gt_group_heading" scope="colgroup" id="grp_a">grp_a</th>
          </tr>
          <tr class="gt_row_group_first"><th id="stub_1_1" scope="row" class="gt_row gt_left gt_stub">row_1</th>
      <td headers="grp_a stub_1_1 num" class="gt_row gt_right"><span class="gt_footnote_marks" style="white-space:nowrap;font-style:italic;font-weight:normal;line-height:0;"><sup>1</sup></span> 1.111e-01</td>
      <td headers="grp_a stub_1_1 char" class="gt_row gt_left">apricot</td>
      <td headers="grp_a stub_1_1 fctr" class="gt_row gt_center">one</td>
      <td headers="grp_a stub_1_1 date" class="gt_row gt_right">2015-01-15</td>
      <td headers="grp_a stub_1_1 time" class="gt_row gt_right">13:35</td>
      <td headers="grp_a stub_1_1 datetime" class="gt_row gt_right">2018-01-01 02:22</td>
      <td headers="grp_a stub_1_1 currency" class="gt_row gt_right">49.950</td></tr>
          <tr><th id="stub_1_2" scope="row" class="gt_row gt_left gt_stub">row_2</th>
      <td headers="grp_a stub_1_2 num" class="gt_row gt_right"><span class="gt_footnote_marks" style="white-space:nowrap;font-style:italic;font-weight:normal;line-height:0;"><sup>2</sup></span> 2.222e+00</td>
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
          <tr><th id="summary_stub_grp_a_2" scope="row" class="gt_row gt_left gt_stub gt_summary_row gt_last_summary_row">max</th>
      <td headers="grp_a summary_stub_grp_a_2 num" class="gt_row gt_right gt_summary_row gt_last_summary_row">444.40</td>
      <td headers="grp_a summary_stub_grp_a_2 char" class="gt_row gt_left gt_summary_row gt_last_summary_row">—</td>
      <td headers="grp_a summary_stub_grp_a_2 fctr" class="gt_row gt_center gt_summary_row gt_last_summary_row">—</td>
      <td headers="grp_a summary_stub_grp_a_2 date" class="gt_row gt_right gt_summary_row gt_last_summary_row">—</td>
      <td headers="grp_a summary_stub_grp_a_2 time" class="gt_row gt_right gt_summary_row gt_last_summary_row">—</td>
      <td headers="grp_a summary_stub_grp_a_2 datetime" class="gt_row gt_right gt_summary_row gt_last_summary_row">—</td>
      <td headers="grp_a summary_stub_grp_a_2 currency" class="gt_row gt_right gt_summary_row gt_last_summary_row">65,100.00</td></tr>
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
          <tr><th id="grand_summary_stub_1" scope="row" class="gt_row gt_left gt_stub gt_grand_summary_row gt_first_grand_summary_row gt_last_summary_row">total</th>
      <td headers="grand_summary_stub_1 num" class="gt_row gt_right gt_grand_summary_row gt_first_grand_summary_row gt_last_summary_row">—</td>
      <td headers="grand_summary_stub_1 char" class="gt_row gt_left gt_grand_summary_row gt_first_grand_summary_row gt_last_summary_row">—</td>
      <td headers="grand_summary_stub_1 fctr" class="gt_row gt_center gt_grand_summary_row gt_first_grand_summary_row gt_last_summary_row">—</td>
      <td headers="grand_summary_stub_1 date" class="gt_row gt_right gt_grand_summary_row gt_first_grand_summary_row gt_last_summary_row">—</td>
      <td headers="grand_summary_stub_1 time" class="gt_row gt_right gt_grand_summary_row gt_first_grand_summary_row gt_last_summary_row">—</td>
      <td headers="grand_summary_stub_1 datetime" class="gt_row gt_right gt_grand_summary_row gt_first_grand_summary_row gt_last_summary_row">—</td>
      <td headers="grand_summary_stub_1 currency" class="gt_row gt_right gt_grand_summary_row gt_first_grand_summary_row gt_last_summary_row">66,509</td></tr>
        </tbody>
        <tfoot>
          <tr class="gt_footnotes">
            <td class="gt_footnote" colspan="8"><span class="gt_footnote_marks" style="white-space:nowrap;font-style:italic;font-weight:normal;line-height:0;"><sup>1</sup></span> This is a footnote.</td>
          </tr>
          <tr class="gt_footnotes">
            <td class="gt_footnote" colspan="8"><span class="gt_footnote_marks" style="white-space:nowrap;font-style:italic;font-weight:normal;line-height:0;"><sup>2</sup></span> This is a second footnote.</td>
          </tr>
          <tr class="gt_sourcenotes">
            <td class="gt_sourcenote" colspan="8">This is a source note.</td>
          </tr>
          <tr class="gt_sourcenotes">
            <td class="gt_sourcenote" colspan="8">This is a second source note.</td>
          </tr>
        </tfoot>
      </table>

---

    Code
      cat(render_as_html(gt_tbl))
    Output
      <table class="gt_table" data-quarto-disable-processing="false" data-quarto-bootstrap="false">
        <!--/html_preserve--><caption class='gt_caption'>This is a caption</caption><!--html_preserve-->
        <thead>
          <tr class="gt_heading">
            <td colspan="8" class="gt_heading gt_title gt_font_normal" style>The title of the table</td>
          </tr>
          <tr class="gt_heading">
            <td colspan="8" class="gt_heading gt_subtitle gt_font_normal gt_bottom_border" style>The table's subtitle</td>
          </tr>
          <tr class="gt_col_headings gt_spanner_row">
            <th class="gt_col_heading gt_columns_bottom_border gt_left" rowspan="2" colspan="1" scope="col" id="a::stub">A Stubhead Label</th>
            <th class="gt_center gt_columns_top_border gt_column_spanner_outer" rowspan="1" colspan="7" scope="colgroup" id="Grand Spanner">
              <div class="gt_column_spanner">Grand Spanner</div>
            </th>
          </tr>
          <tr class="gt_col_headings">
            <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id="num">num</th>
            <th class="gt_col_heading gt_columns_bottom_border gt_left" rowspan="1" colspan="1" scope="col" id="char">char</th>
            <th class="gt_col_heading gt_columns_bottom_border gt_center" rowspan="1" colspan="1" scope="col" id="fctr">fctr</th>
            <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id="date">date</th>
            <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id="time">time</th>
            <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id="datetime">datetime</th>
            <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id="currency">currency</th>
          </tr>
        </thead>
        <tbody class="gt_table_body">
          <tr class="gt_group_heading_row">
            <th colspan="8" class="gt_group_heading" scope="colgroup" id="grp_a">grp_a</th>
          </tr>
          <tr class="gt_row_group_first"><th id="stub_1_1" scope="row" class="gt_row gt_left gt_stub">row_1</th>
      <td headers="grp_a stub_1_1 num" class="gt_row gt_right"><span class="gt_footnote_marks" style="white-space:nowrap;font-style:italic;font-weight:normal;line-height:0;"><sup>1</sup></span> 1.111e-01</td>
      <td headers="grp_a stub_1_1 char" class="gt_row gt_left">apricot</td>
      <td headers="grp_a stub_1_1 fctr" class="gt_row gt_center">one</td>
      <td headers="grp_a stub_1_1 date" class="gt_row gt_right">2015-01-15</td>
      <td headers="grp_a stub_1_1 time" class="gt_row gt_right">13:35</td>
      <td headers="grp_a stub_1_1 datetime" class="gt_row gt_right">2018-01-01 02:22</td>
      <td headers="grp_a stub_1_1 currency" class="gt_row gt_right">49.950</td></tr>
          <tr><th id="stub_1_2" scope="row" class="gt_row gt_left gt_stub">row_2</th>
      <td headers="grp_a stub_1_2 num" class="gt_row gt_right"><span class="gt_footnote_marks" style="white-space:nowrap;font-style:italic;font-weight:normal;line-height:0;"><sup>2</sup></span> 2.222e+00</td>
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
          <tr><th id="summary_stub_grp_a_2" scope="row" class="gt_row gt_left gt_stub gt_summary_row gt_last_summary_row">max</th>
      <td headers="grp_a summary_stub_grp_a_2 num" class="gt_row gt_right gt_summary_row gt_last_summary_row">444.40</td>
      <td headers="grp_a summary_stub_grp_a_2 char" class="gt_row gt_left gt_summary_row gt_last_summary_row">—</td>
      <td headers="grp_a summary_stub_grp_a_2 fctr" class="gt_row gt_center gt_summary_row gt_last_summary_row">—</td>
      <td headers="grp_a summary_stub_grp_a_2 date" class="gt_row gt_right gt_summary_row gt_last_summary_row">—</td>
      <td headers="grp_a summary_stub_grp_a_2 time" class="gt_row gt_right gt_summary_row gt_last_summary_row">—</td>
      <td headers="grp_a summary_stub_grp_a_2 datetime" class="gt_row gt_right gt_summary_row gt_last_summary_row">—</td>
      <td headers="grp_a summary_stub_grp_a_2 currency" class="gt_row gt_right gt_summary_row gt_last_summary_row">65,100.00</td></tr>
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
          <tr><th id="grand_summary_stub_1" scope="row" class="gt_row gt_left gt_stub gt_grand_summary_row gt_first_grand_summary_row gt_last_summary_row">total</th>
      <td headers="grand_summary_stub_1 num" class="gt_row gt_right gt_grand_summary_row gt_first_grand_summary_row gt_last_summary_row">—</td>
      <td headers="grand_summary_stub_1 char" class="gt_row gt_left gt_grand_summary_row gt_first_grand_summary_row gt_last_summary_row">—</td>
      <td headers="grand_summary_stub_1 fctr" class="gt_row gt_center gt_grand_summary_row gt_first_grand_summary_row gt_last_summary_row">—</td>
      <td headers="grand_summary_stub_1 date" class="gt_row gt_right gt_grand_summary_row gt_first_grand_summary_row gt_last_summary_row">—</td>
      <td headers="grand_summary_stub_1 time" class="gt_row gt_right gt_grand_summary_row gt_first_grand_summary_row gt_last_summary_row">—</td>
      <td headers="grand_summary_stub_1 datetime" class="gt_row gt_right gt_grand_summary_row gt_first_grand_summary_row gt_last_summary_row">—</td>
      <td headers="grand_summary_stub_1 currency" class="gt_row gt_right gt_grand_summary_row gt_first_grand_summary_row gt_last_summary_row">66,509</td></tr>
        </tbody>
        <tfoot>
          <tr class="gt_footnotes">
            <td class="gt_footnote" colspan="8"><span class="gt_footnote_marks" style="white-space:nowrap;font-style:italic;font-weight:normal;line-height:0;"><sup>1</sup></span> This is a footnote.</td>
          </tr>
          <tr class="gt_footnotes">
            <td class="gt_footnote" colspan="8"><span class="gt_footnote_marks" style="white-space:nowrap;font-style:italic;font-weight:normal;line-height:0;"><sup>2</sup></span> This is a second footnote.</td>
          </tr>
          <tr class="gt_sourcenotes">
            <td class="gt_sourcenote" colspan="8">This is a source note.</td>
          </tr>
          <tr class="gt_sourcenotes">
            <td class="gt_sourcenote" colspan="8">This is a second source note.</td>
          </tr>
        </tfoot>
      </table>

---

    Code
      cat(render_as_html(gt_tbl))
    Output
      <table class="gt_table" data-quarto-disable-processing="false" data-quarto-bootstrap="false">
        <!--/html_preserve--><caption class='gt_caption'>This is a caption</caption><!--html_preserve-->
        <thead>
          <tr class="gt_heading">
            <td colspan="8" class="gt_heading gt_title gt_font_normal" style>The title of the table</td>
          </tr>
          <tr class="gt_heading">
            <td colspan="8" class="gt_heading gt_subtitle gt_font_normal gt_bottom_border" style>The table's subtitle</td>
          </tr>
          <tr class="gt_col_headings gt_spanner_row">
            <th class="gt_col_heading gt_columns_bottom_border gt_left" rowspan="2" colspan="1" scope="col" id="a::stub">A Stubhead Label</th>
            <th class="gt_center gt_columns_top_border gt_column_spanner_outer" rowspan="1" colspan="1" scope="col" id="Numbers">
              <div class="gt_column_spanner">Numbers</div>
            </th>
            <th class="gt_center gt_columns_top_border gt_column_spanner_outer" rowspan="1" colspan="2" scope="colgroup" id="Words">
              <div class="gt_column_spanner">Words</div>
            </th>
            <th class="gt_center gt_columns_top_border gt_column_spanner_outer" rowspan="1" colspan="3" scope="colgroup" id="Date and Time">
              <div class="gt_column_spanner">Date and Time</div>
            </th>
            <th class="gt_center gt_columns_top_border gt_column_spanner_outer" rowspan="1" colspan="1" scope="col" id="Numbers">
              <div class="gt_column_spanner">Numbers</div>
            </th>
          </tr>
          <tr class="gt_col_headings">
            <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id="num">num</th>
            <th class="gt_col_heading gt_columns_bottom_border gt_left" rowspan="1" colspan="1" scope="col" id="char">char</th>
            <th class="gt_col_heading gt_columns_bottom_border gt_center" rowspan="1" colspan="1" scope="col" id="fctr">fctr</th>
            <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id="date">date</th>
            <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id="time">time</th>
            <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id="datetime">datetime</th>
            <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id="currency">currency</th>
          </tr>
        </thead>
        <tbody class="gt_table_body">
          <tr class="gt_group_heading_row">
            <th colspan="8" class="gt_group_heading" scope="colgroup" id="grp_a">grp_a</th>
          </tr>
          <tr class="gt_row_group_first"><th id="stub_1_1" scope="row" class="gt_row gt_left gt_stub">row_1</th>
      <td headers="grp_a stub_1_1 num" class="gt_row gt_right"><span class="gt_footnote_marks" style="white-space:nowrap;font-style:italic;font-weight:normal;line-height:0;"><sup>1</sup></span> 1.111e-01</td>
      <td headers="grp_a stub_1_1 char" class="gt_row gt_left">apricot</td>
      <td headers="grp_a stub_1_1 fctr" class="gt_row gt_center">one</td>
      <td headers="grp_a stub_1_1 date" class="gt_row gt_right">2015-01-15</td>
      <td headers="grp_a stub_1_1 time" class="gt_row gt_right">13:35</td>
      <td headers="grp_a stub_1_1 datetime" class="gt_row gt_right">2018-01-01 02:22</td>
      <td headers="grp_a stub_1_1 currency" class="gt_row gt_right">49.950</td></tr>
          <tr><th id="stub_1_2" scope="row" class="gt_row gt_left gt_stub">row_2</th>
      <td headers="grp_a stub_1_2 num" class="gt_row gt_right"><span class="gt_footnote_marks" style="white-space:nowrap;font-style:italic;font-weight:normal;line-height:0;"><sup>2</sup></span> 2.222e+00</td>
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
          <tr><th id="summary_stub_grp_a_2" scope="row" class="gt_row gt_left gt_stub gt_summary_row gt_last_summary_row">max</th>
      <td headers="grp_a summary_stub_grp_a_2 num" class="gt_row gt_right gt_summary_row gt_last_summary_row">444.40</td>
      <td headers="grp_a summary_stub_grp_a_2 char" class="gt_row gt_left gt_summary_row gt_last_summary_row">—</td>
      <td headers="grp_a summary_stub_grp_a_2 fctr" class="gt_row gt_center gt_summary_row gt_last_summary_row">—</td>
      <td headers="grp_a summary_stub_grp_a_2 date" class="gt_row gt_right gt_summary_row gt_last_summary_row">—</td>
      <td headers="grp_a summary_stub_grp_a_2 time" class="gt_row gt_right gt_summary_row gt_last_summary_row">—</td>
      <td headers="grp_a summary_stub_grp_a_2 datetime" class="gt_row gt_right gt_summary_row gt_last_summary_row">—</td>
      <td headers="grp_a summary_stub_grp_a_2 currency" class="gt_row gt_right gt_summary_row gt_last_summary_row">65,100.00</td></tr>
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
          <tr><th id="grand_summary_stub_1" scope="row" class="gt_row gt_left gt_stub gt_grand_summary_row gt_first_grand_summary_row gt_last_summary_row">total</th>
      <td headers="grand_summary_stub_1 num" class="gt_row gt_right gt_grand_summary_row gt_first_grand_summary_row gt_last_summary_row">—</td>
      <td headers="grand_summary_stub_1 char" class="gt_row gt_left gt_grand_summary_row gt_first_grand_summary_row gt_last_summary_row">—</td>
      <td headers="grand_summary_stub_1 fctr" class="gt_row gt_center gt_grand_summary_row gt_first_grand_summary_row gt_last_summary_row">—</td>
      <td headers="grand_summary_stub_1 date" class="gt_row gt_right gt_grand_summary_row gt_first_grand_summary_row gt_last_summary_row">—</td>
      <td headers="grand_summary_stub_1 time" class="gt_row gt_right gt_grand_summary_row gt_first_grand_summary_row gt_last_summary_row">—</td>
      <td headers="grand_summary_stub_1 datetime" class="gt_row gt_right gt_grand_summary_row gt_first_grand_summary_row gt_last_summary_row">—</td>
      <td headers="grand_summary_stub_1 currency" class="gt_row gt_right gt_grand_summary_row gt_first_grand_summary_row gt_last_summary_row">66,509</td></tr>
        </tbody>
        <tfoot>
          <tr class="gt_footnotes">
            <td class="gt_footnote" colspan="8"><span class="gt_footnote_marks" style="white-space:nowrap;font-style:italic;font-weight:normal;line-height:0;"><sup>1</sup></span> This is a footnote.</td>
          </tr>
          <tr class="gt_footnotes">
            <td class="gt_footnote" colspan="8"><span class="gt_footnote_marks" style="white-space:nowrap;font-style:italic;font-weight:normal;line-height:0;"><sup>2</sup></span> This is a second footnote.</td>
          </tr>
          <tr class="gt_sourcenotes">
            <td class="gt_sourcenote" colspan="8">This is a source note.</td>
          </tr>
          <tr class="gt_sourcenotes">
            <td class="gt_sourcenote" colspan="8">This is a second source note.</td>
          </tr>
        </tfoot>
      </table>

---

    Code
      cat(render_as_html(gt_tbl))
    Output
      <table class="gt_table" data-quarto-disable-processing="false" data-quarto-bootstrap="false">
        <!--/html_preserve--><caption class='gt_caption'>This is a caption</caption><!--html_preserve-->
        <thead>
          <tr class="gt_heading">
            <td colspan="8" class="gt_heading gt_title gt_font_normal" style>The title of the table</td>
          </tr>
          <tr class="gt_heading">
            <td colspan="8" class="gt_heading gt_subtitle gt_font_normal gt_bottom_border" style>The table's subtitle</td>
          </tr>
          <tr class="gt_col_headings">
            <th class="gt_col_heading gt_columns_bottom_border gt_left" rowspan="1" colspan="1" scope="col" id="a::stub">A Stubhead Label</th>
            <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id="num">num</th>
            <th class="gt_col_heading gt_columns_bottom_border gt_left" rowspan="1" colspan="1" scope="col" id="char">char</th>
            <th class="gt_col_heading gt_columns_bottom_border gt_center" rowspan="1" colspan="1" scope="col" id="fctr">fctr</th>
            <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id="date">date</th>
            <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id="time">time</th>
            <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id="datetime">datetime</th>
            <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id="currency">currency</th>
          </tr>
        </thead>
        <tbody class="gt_table_body">
          <tr class="gt_group_heading_row">
            <th colspan="8" class="gt_group_heading" scope="colgroup" id="grp_a">grp_a</th>
          </tr>
          <tr class="gt_row_group_first"><th id="stub_1_1" scope="row" class="gt_row gt_left gt_stub">row_1</th>
      <td headers="grp_a stub_1_1 num" class="gt_row gt_right"><span class="gt_footnote_marks" style="white-space:nowrap;font-style:italic;font-weight:normal;line-height:0;"><sup>1</sup></span> 1.111e-01</td>
      <td headers="grp_a stub_1_1 char" class="gt_row gt_left">apricot</td>
      <td headers="grp_a stub_1_1 fctr" class="gt_row gt_center">one</td>
      <td headers="grp_a stub_1_1 date" class="gt_row gt_right">2015-01-15</td>
      <td headers="grp_a stub_1_1 time" class="gt_row gt_right">13:35</td>
      <td headers="grp_a stub_1_1 datetime" class="gt_row gt_right">2018-01-01 02:22</td>
      <td headers="grp_a stub_1_1 currency" class="gt_row gt_right">49.950</td></tr>
          <tr><th id="stub_1_2" scope="row" class="gt_row gt_left gt_stub">row_2</th>
      <td headers="grp_a stub_1_2 num" class="gt_row gt_right"><span class="gt_footnote_marks" style="white-space:nowrap;font-style:italic;font-weight:normal;line-height:0;"><sup>2</sup></span> 2.222e+00</td>
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
          <tr><th id="summary_stub_grp_a_2" scope="row" class="gt_row gt_left gt_stub gt_summary_row gt_last_summary_row">max</th>
      <td headers="grp_a summary_stub_grp_a_2 num" class="gt_row gt_right gt_summary_row gt_last_summary_row">444.40</td>
      <td headers="grp_a summary_stub_grp_a_2 char" class="gt_row gt_left gt_summary_row gt_last_summary_row">—</td>
      <td headers="grp_a summary_stub_grp_a_2 fctr" class="gt_row gt_center gt_summary_row gt_last_summary_row">—</td>
      <td headers="grp_a summary_stub_grp_a_2 date" class="gt_row gt_right gt_summary_row gt_last_summary_row">—</td>
      <td headers="grp_a summary_stub_grp_a_2 time" class="gt_row gt_right gt_summary_row gt_last_summary_row">—</td>
      <td headers="grp_a summary_stub_grp_a_2 datetime" class="gt_row gt_right gt_summary_row gt_last_summary_row">—</td>
      <td headers="grp_a summary_stub_grp_a_2 currency" class="gt_row gt_right gt_summary_row gt_last_summary_row">65,100.00</td></tr>
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
          <tr><th id="grand_summary_stub_1" scope="row" class="gt_row gt_left gt_stub gt_grand_summary_row gt_first_grand_summary_row gt_last_summary_row">total</th>
      <td headers="grand_summary_stub_1 num" class="gt_row gt_right gt_grand_summary_row gt_first_grand_summary_row gt_last_summary_row">—</td>
      <td headers="grand_summary_stub_1 char" class="gt_row gt_left gt_grand_summary_row gt_first_grand_summary_row gt_last_summary_row">—</td>
      <td headers="grand_summary_stub_1 fctr" class="gt_row gt_center gt_grand_summary_row gt_first_grand_summary_row gt_last_summary_row">—</td>
      <td headers="grand_summary_stub_1 date" class="gt_row gt_right gt_grand_summary_row gt_first_grand_summary_row gt_last_summary_row">—</td>
      <td headers="grand_summary_stub_1 time" class="gt_row gt_right gt_grand_summary_row gt_first_grand_summary_row gt_last_summary_row">—</td>
      <td headers="grand_summary_stub_1 datetime" class="gt_row gt_right gt_grand_summary_row gt_first_grand_summary_row gt_last_summary_row">—</td>
      <td headers="grand_summary_stub_1 currency" class="gt_row gt_right gt_grand_summary_row gt_first_grand_summary_row gt_last_summary_row">66,509</td></tr>
        </tbody>
        <tfoot>
          <tr class="gt_footnotes">
            <td class="gt_footnote" colspan="8"><span class="gt_footnote_marks" style="white-space:nowrap;font-style:italic;font-weight:normal;line-height:0;"><sup>1</sup></span> This is a footnote.</td>
          </tr>
          <tr class="gt_footnotes">
            <td class="gt_footnote" colspan="8"><span class="gt_footnote_marks" style="white-space:nowrap;font-style:italic;font-weight:normal;line-height:0;"><sup>2</sup></span> This is a second footnote.</td>
          </tr>
          <tr class="gt_sourcenotes">
            <td class="gt_sourcenote" colspan="8">This is a source note.</td>
          </tr>
          <tr class="gt_sourcenotes">
            <td class="gt_sourcenote" colspan="8">This is a second source note.</td>
          </tr>
        </tfoot>
      </table>

---

    Code
      cat(render_as_html(gt_tbl))
    Output
      <table class="gt_table" data-quarto-disable-processing="false" data-quarto-bootstrap="false">
        <!--/html_preserve--><caption class='gt_caption'>This is a caption</caption><!--html_preserve-->
        <thead>
          <tr class="gt_heading">
            <td colspan="8" class="gt_heading gt_title gt_font_normal" style>The title of the table</td>
          </tr>
          <tr class="gt_heading">
            <td colspan="8" class="gt_heading gt_subtitle gt_font_normal gt_bottom_border" style>The table's subtitle</td>
          </tr>
          <tr class="gt_col_headings gt_spanner_row">
            <th rowspan="1" colspan="1" scope="col"></th>
            <th class="gt_center gt_columns_top_border gt_column_spanner_outer" rowspan="1" colspan="7" scope="colgroup" id="Grand Spanner">
              <div class="gt_column_spanner">Grand Spanner</div>
            </th>
          </tr>
          <tr class="gt_col_headings gt_spanner_row">
            <th class="gt_col_heading gt_columns_bottom_border gt_left" rowspan="2" colspan="1" scope="col" id="a::stub">A Stubhead Label</th>
            <th class="gt_center gt_columns_top_border gt_column_spanner_outer" rowspan="1" colspan="1" scope="col" id="Numbers">
              <div class="gt_column_spanner">Numbers</div>
            </th>
            <th class="gt_center gt_columns_top_border gt_column_spanner_outer" rowspan="1" colspan="2" scope="colgroup" id="Words">
              <div class="gt_column_spanner">Words</div>
            </th>
            <th class="gt_center gt_columns_top_border gt_column_spanner_outer" rowspan="1" colspan="3" scope="colgroup" id="Date and Time">
              <div class="gt_column_spanner">Date and Time</div>
            </th>
            <th class="gt_center gt_columns_top_border gt_column_spanner_outer" rowspan="1" colspan="1" scope="col" id="Numbers">
              <div class="gt_column_spanner">Numbers</div>
            </th>
          </tr>
          <tr class="gt_col_headings">
            <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id="num">num</th>
            <th class="gt_col_heading gt_columns_bottom_border gt_left" rowspan="1" colspan="1" scope="col" id="char">char</th>
            <th class="gt_col_heading gt_columns_bottom_border gt_center" rowspan="1" colspan="1" scope="col" id="fctr">fctr</th>
            <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id="date">date</th>
            <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id="time">time</th>
            <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id="datetime">datetime</th>
            <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id="currency">currency</th>
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
          <tr><th id="summary_stub_grp_a_2" scope="row" class="gt_row gt_left gt_stub gt_summary_row gt_last_summary_row">max</th>
      <td headers="grp_a summary_stub_grp_a_2 num" class="gt_row gt_right gt_summary_row gt_last_summary_row">444.40</td>
      <td headers="grp_a summary_stub_grp_a_2 char" class="gt_row gt_left gt_summary_row gt_last_summary_row">—</td>
      <td headers="grp_a summary_stub_grp_a_2 fctr" class="gt_row gt_center gt_summary_row gt_last_summary_row">—</td>
      <td headers="grp_a summary_stub_grp_a_2 date" class="gt_row gt_right gt_summary_row gt_last_summary_row">—</td>
      <td headers="grp_a summary_stub_grp_a_2 time" class="gt_row gt_right gt_summary_row gt_last_summary_row">—</td>
      <td headers="grp_a summary_stub_grp_a_2 datetime" class="gt_row gt_right gt_summary_row gt_last_summary_row">—</td>
      <td headers="grp_a summary_stub_grp_a_2 currency" class="gt_row gt_right gt_summary_row gt_last_summary_row">65,100.00</td></tr>
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
          <tr><th id="grand_summary_stub_1" scope="row" class="gt_row gt_left gt_stub gt_grand_summary_row gt_first_grand_summary_row gt_last_summary_row">total</th>
      <td headers="grand_summary_stub_1 num" class="gt_row gt_right gt_grand_summary_row gt_first_grand_summary_row gt_last_summary_row">—</td>
      <td headers="grand_summary_stub_1 char" class="gt_row gt_left gt_grand_summary_row gt_first_grand_summary_row gt_last_summary_row">—</td>
      <td headers="grand_summary_stub_1 fctr" class="gt_row gt_center gt_grand_summary_row gt_first_grand_summary_row gt_last_summary_row">—</td>
      <td headers="grand_summary_stub_1 date" class="gt_row gt_right gt_grand_summary_row gt_first_grand_summary_row gt_last_summary_row">—</td>
      <td headers="grand_summary_stub_1 time" class="gt_row gt_right gt_grand_summary_row gt_first_grand_summary_row gt_last_summary_row">—</td>
      <td headers="grand_summary_stub_1 datetime" class="gt_row gt_right gt_grand_summary_row gt_first_grand_summary_row gt_last_summary_row">—</td>
      <td headers="grand_summary_stub_1 currency" class="gt_row gt_right gt_grand_summary_row gt_first_grand_summary_row gt_last_summary_row">66,509</td></tr>
        </tbody>
        <tfoot>
          <tr class="gt_sourcenotes">
            <td class="gt_sourcenote" colspan="8">This is a source note.</td>
          </tr>
          <tr class="gt_sourcenotes">
            <td class="gt_sourcenote" colspan="8">This is a second source note.</td>
          </tr>
        </tfoot>
      </table>

---

    Code
      cat(render_as_html(gt_tbl))
    Output
      <table class="gt_table" data-quarto-disable-processing="false" data-quarto-bootstrap="false">
        <!--/html_preserve--><caption class='gt_caption'>This is a caption</caption><!--html_preserve-->
        <thead>
          <tr class="gt_heading">
            <td colspan="8" class="gt_heading gt_title gt_font_normal" style>The title of the table</td>
          </tr>
          <tr class="gt_heading">
            <td colspan="8" class="gt_heading gt_subtitle gt_font_normal gt_bottom_border" style>The table's subtitle</td>
          </tr>
          <tr class="gt_col_headings gt_spanner_row">
            <th rowspan="1" colspan="1" scope="col"></th>
            <th class="gt_center gt_columns_top_border gt_column_spanner_outer" rowspan="1" colspan="7" scope="colgroup" id="Grand Spanner">
              <div class="gt_column_spanner">Grand Spanner</div>
            </th>
          </tr>
          <tr class="gt_col_headings gt_spanner_row">
            <th class="gt_col_heading gt_columns_bottom_border gt_left" rowspan="2" colspan="1" scope="col" id="a::stub">A Stubhead Label</th>
            <th class="gt_center gt_columns_top_border gt_column_spanner_outer" rowspan="1" colspan="1" scope="col" id="Numbers">
              <div class="gt_column_spanner">Numbers</div>
            </th>
            <th class="gt_center gt_columns_top_border gt_column_spanner_outer" rowspan="1" colspan="2" scope="colgroup" id="Words">
              <div class="gt_column_spanner">Words</div>
            </th>
            <th class="gt_center gt_columns_top_border gt_column_spanner_outer" rowspan="1" colspan="3" scope="colgroup" id="Date and Time">
              <div class="gt_column_spanner">Date and Time</div>
            </th>
            <th class="gt_center gt_columns_top_border gt_column_spanner_outer" rowspan="1" colspan="1" scope="col" id="Numbers">
              <div class="gt_column_spanner">Numbers</div>
            </th>
          </tr>
          <tr class="gt_col_headings">
            <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id="num">num</th>
            <th class="gt_col_heading gt_columns_bottom_border gt_left" rowspan="1" colspan="1" scope="col" id="char">char</th>
            <th class="gt_col_heading gt_columns_bottom_border gt_center" rowspan="1" colspan="1" scope="col" id="fctr">fctr</th>
            <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id="date">date</th>
            <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id="time">time</th>
            <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id="datetime">datetime</th>
            <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id="currency">currency</th>
          </tr>
        </thead>
        <tbody class="gt_table_body">
          <tr class="gt_group_heading_row">
            <th colspan="8" class="gt_group_heading" scope="colgroup" id="grp_a">grp_a</th>
          </tr>
          <tr class="gt_row_group_first"><th id="stub_1_1" scope="row" class="gt_row gt_left gt_stub">row_1</th>
      <td headers="grp_a stub_1_1 num" class="gt_row gt_right"><span class="gt_footnote_marks" style="white-space:nowrap;font-style:italic;font-weight:normal;line-height:0;"><sup>1</sup></span> 1.111e-01</td>
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
          <tr><th id="summary_stub_grp_a_2" scope="row" class="gt_row gt_left gt_stub gt_summary_row gt_last_summary_row">max</th>
      <td headers="grp_a summary_stub_grp_a_2 num" class="gt_row gt_right gt_summary_row gt_last_summary_row">444.40</td>
      <td headers="grp_a summary_stub_grp_a_2 char" class="gt_row gt_left gt_summary_row gt_last_summary_row">—</td>
      <td headers="grp_a summary_stub_grp_a_2 fctr" class="gt_row gt_center gt_summary_row gt_last_summary_row">—</td>
      <td headers="grp_a summary_stub_grp_a_2 date" class="gt_row gt_right gt_summary_row gt_last_summary_row">—</td>
      <td headers="grp_a summary_stub_grp_a_2 time" class="gt_row gt_right gt_summary_row gt_last_summary_row">—</td>
      <td headers="grp_a summary_stub_grp_a_2 datetime" class="gt_row gt_right gt_summary_row gt_last_summary_row">—</td>
      <td headers="grp_a summary_stub_grp_a_2 currency" class="gt_row gt_right gt_summary_row gt_last_summary_row">65,100.00</td></tr>
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
          <tr><th id="grand_summary_stub_1" scope="row" class="gt_row gt_left gt_stub gt_grand_summary_row gt_first_grand_summary_row gt_last_summary_row">total</th>
      <td headers="grand_summary_stub_1 num" class="gt_row gt_right gt_grand_summary_row gt_first_grand_summary_row gt_last_summary_row">—</td>
      <td headers="grand_summary_stub_1 char" class="gt_row gt_left gt_grand_summary_row gt_first_grand_summary_row gt_last_summary_row">—</td>
      <td headers="grand_summary_stub_1 fctr" class="gt_row gt_center gt_grand_summary_row gt_first_grand_summary_row gt_last_summary_row">—</td>
      <td headers="grand_summary_stub_1 date" class="gt_row gt_right gt_grand_summary_row gt_first_grand_summary_row gt_last_summary_row">—</td>
      <td headers="grand_summary_stub_1 time" class="gt_row gt_right gt_grand_summary_row gt_first_grand_summary_row gt_last_summary_row">—</td>
      <td headers="grand_summary_stub_1 datetime" class="gt_row gt_right gt_grand_summary_row gt_first_grand_summary_row gt_last_summary_row">—</td>
      <td headers="grand_summary_stub_1 currency" class="gt_row gt_right gt_grand_summary_row gt_first_grand_summary_row gt_last_summary_row">66,509</td></tr>
        </tbody>
        <tfoot>
          <tr class="gt_footnotes">
            <td class="gt_footnote" colspan="8"><span class="gt_footnote_marks" style="white-space:nowrap;font-style:italic;font-weight:normal;line-height:0;"><sup>1</sup></span> This is a footnote.</td>
          </tr>
          <tr class="gt_sourcenotes">
            <td class="gt_sourcenote" colspan="8">This is a source note.</td>
          </tr>
          <tr class="gt_sourcenotes">
            <td class="gt_sourcenote" colspan="8">This is a second source note.</td>
          </tr>
        </tfoot>
      </table>

---

    Code
      cat(render_as_html(gt_tbl))
    Output
      <table class="gt_table" data-quarto-disable-processing="false" data-quarto-bootstrap="false">
        <!--/html_preserve--><caption class='gt_caption'>This is a caption</caption><!--html_preserve-->
        <thead>
          <tr class="gt_heading">
            <td colspan="8" class="gt_heading gt_title gt_font_normal" style>The title of the table</td>
          </tr>
          <tr class="gt_heading">
            <td colspan="8" class="gt_heading gt_subtitle gt_font_normal gt_bottom_border" style>The table's subtitle</td>
          </tr>
          <tr class="gt_col_headings gt_spanner_row">
            <th rowspan="1" colspan="1" scope="col"></th>
            <th class="gt_center gt_columns_top_border gt_column_spanner_outer" rowspan="1" colspan="7" scope="colgroup" id="Grand Spanner">
              <div class="gt_column_spanner">Grand Spanner</div>
            </th>
          </tr>
          <tr class="gt_col_headings gt_spanner_row">
            <th class="gt_col_heading gt_columns_bottom_border gt_left" rowspan="2" colspan="1" scope="col" id="a::stub">A Stubhead Label</th>
            <th class="gt_center gt_columns_top_border gt_column_spanner_outer" rowspan="1" colspan="1" scope="col" id="Numbers">
              <div class="gt_column_spanner">Numbers</div>
            </th>
            <th class="gt_center gt_columns_top_border gt_column_spanner_outer" rowspan="1" colspan="2" scope="colgroup" id="Words">
              <div class="gt_column_spanner">Words</div>
            </th>
            <th class="gt_center gt_columns_top_border gt_column_spanner_outer" rowspan="1" colspan="3" scope="colgroup" id="Date and Time">
              <div class="gt_column_spanner">Date and Time</div>
            </th>
            <th class="gt_center gt_columns_top_border gt_column_spanner_outer" rowspan="1" colspan="1" scope="col" id="Numbers">
              <div class="gt_column_spanner">Numbers</div>
            </th>
          </tr>
          <tr class="gt_col_headings">
            <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id="num">num</th>
            <th class="gt_col_heading gt_columns_bottom_border gt_left" rowspan="1" colspan="1" scope="col" id="char">char</th>
            <th class="gt_col_heading gt_columns_bottom_border gt_center" rowspan="1" colspan="1" scope="col" id="fctr">fctr</th>
            <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id="date">date</th>
            <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id="time">time</th>
            <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id="datetime">datetime</th>
            <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id="currency">currency</th>
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
      <td headers="grp_a stub_1_2 num" class="gt_row gt_right"><span class="gt_footnote_marks" style="white-space:nowrap;font-style:italic;font-weight:normal;line-height:0;"><sup>1</sup></span> 2.222e+00</td>
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
          <tr><th id="summary_stub_grp_a_2" scope="row" class="gt_row gt_left gt_stub gt_summary_row gt_last_summary_row">max</th>
      <td headers="grp_a summary_stub_grp_a_2 num" class="gt_row gt_right gt_summary_row gt_last_summary_row">444.40</td>
      <td headers="grp_a summary_stub_grp_a_2 char" class="gt_row gt_left gt_summary_row gt_last_summary_row">—</td>
      <td headers="grp_a summary_stub_grp_a_2 fctr" class="gt_row gt_center gt_summary_row gt_last_summary_row">—</td>
      <td headers="grp_a summary_stub_grp_a_2 date" class="gt_row gt_right gt_summary_row gt_last_summary_row">—</td>
      <td headers="grp_a summary_stub_grp_a_2 time" class="gt_row gt_right gt_summary_row gt_last_summary_row">—</td>
      <td headers="grp_a summary_stub_grp_a_2 datetime" class="gt_row gt_right gt_summary_row gt_last_summary_row">—</td>
      <td headers="grp_a summary_stub_grp_a_2 currency" class="gt_row gt_right gt_summary_row gt_last_summary_row">65,100.00</td></tr>
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
          <tr><th id="grand_summary_stub_1" scope="row" class="gt_row gt_left gt_stub gt_grand_summary_row gt_first_grand_summary_row gt_last_summary_row">total</th>
      <td headers="grand_summary_stub_1 num" class="gt_row gt_right gt_grand_summary_row gt_first_grand_summary_row gt_last_summary_row">—</td>
      <td headers="grand_summary_stub_1 char" class="gt_row gt_left gt_grand_summary_row gt_first_grand_summary_row gt_last_summary_row">—</td>
      <td headers="grand_summary_stub_1 fctr" class="gt_row gt_center gt_grand_summary_row gt_first_grand_summary_row gt_last_summary_row">—</td>
      <td headers="grand_summary_stub_1 date" class="gt_row gt_right gt_grand_summary_row gt_first_grand_summary_row gt_last_summary_row">—</td>
      <td headers="grand_summary_stub_1 time" class="gt_row gt_right gt_grand_summary_row gt_first_grand_summary_row gt_last_summary_row">—</td>
      <td headers="grand_summary_stub_1 datetime" class="gt_row gt_right gt_grand_summary_row gt_first_grand_summary_row gt_last_summary_row">—</td>
      <td headers="grand_summary_stub_1 currency" class="gt_row gt_right gt_grand_summary_row gt_first_grand_summary_row gt_last_summary_row">66,509</td></tr>
        </tbody>
        <tfoot>
          <tr class="gt_footnotes">
            <td class="gt_footnote" colspan="8"><span class="gt_footnote_marks" style="white-space:nowrap;font-style:italic;font-weight:normal;line-height:0;"><sup>1</sup></span> This is a second footnote.</td>
          </tr>
          <tr class="gt_sourcenotes">
            <td class="gt_sourcenote" colspan="8">This is a source note.</td>
          </tr>
          <tr class="gt_sourcenotes">
            <td class="gt_sourcenote" colspan="8">This is a second source note.</td>
          </tr>
        </tfoot>
      </table>

---

    Code
      cat(render_as_html(gt_tbl))
    Output
      <table class="gt_table" data-quarto-disable-processing="false" data-quarto-bootstrap="false">
        <!--/html_preserve--><caption class='gt_caption'>This is a caption</caption><!--html_preserve-->
        <thead>
          <tr class="gt_heading">
            <td colspan="8" class="gt_heading gt_title gt_font_normal" style>The title of the table</td>
          </tr>
          <tr class="gt_heading">
            <td colspan="8" class="gt_heading gt_subtitle gt_font_normal gt_bottom_border" style>The table's subtitle</td>
          </tr>
          <tr class="gt_col_headings gt_spanner_row">
            <th rowspan="1" colspan="1" scope="col"></th>
            <th class="gt_center gt_columns_top_border gt_column_spanner_outer" rowspan="1" colspan="7" scope="colgroup" id="Grand Spanner">
              <div class="gt_column_spanner">Grand Spanner</div>
            </th>
          </tr>
          <tr class="gt_col_headings gt_spanner_row">
            <th class="gt_col_heading gt_columns_bottom_border gt_left" rowspan="2" colspan="1" scope="col" id="a::stub">A Stubhead Label</th>
            <th class="gt_center gt_columns_top_border gt_column_spanner_outer" rowspan="1" colspan="1" scope="col" id="Numbers">
              <div class="gt_column_spanner">Numbers</div>
            </th>
            <th class="gt_center gt_columns_top_border gt_column_spanner_outer" rowspan="1" colspan="2" scope="colgroup" id="Words">
              <div class="gt_column_spanner">Words</div>
            </th>
            <th class="gt_center gt_columns_top_border gt_column_spanner_outer" rowspan="1" colspan="3" scope="colgroup" id="Date and Time">
              <div class="gt_column_spanner">Date and Time</div>
            </th>
            <th class="gt_center gt_columns_top_border gt_column_spanner_outer" rowspan="1" colspan="1" scope="col" id="Numbers">
              <div class="gt_column_spanner">Numbers</div>
            </th>
          </tr>
          <tr class="gt_col_headings">
            <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id="num">num</th>
            <th class="gt_col_heading gt_columns_bottom_border gt_left" rowspan="1" colspan="1" scope="col" id="char">char</th>
            <th class="gt_col_heading gt_columns_bottom_border gt_center" rowspan="1" colspan="1" scope="col" id="fctr">fctr</th>
            <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id="date">date</th>
            <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id="time">time</th>
            <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id="datetime">datetime</th>
            <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id="currency">currency</th>
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
          <tr><th id="summary_stub_grp_a_2" scope="row" class="gt_row gt_left gt_stub gt_summary_row gt_last_summary_row">max</th>
      <td headers="grp_a summary_stub_grp_a_2 num" class="gt_row gt_right gt_summary_row gt_last_summary_row">444.40</td>
      <td headers="grp_a summary_stub_grp_a_2 char" class="gt_row gt_left gt_summary_row gt_last_summary_row">—</td>
      <td headers="grp_a summary_stub_grp_a_2 fctr" class="gt_row gt_center gt_summary_row gt_last_summary_row">—</td>
      <td headers="grp_a summary_stub_grp_a_2 date" class="gt_row gt_right gt_summary_row gt_last_summary_row">—</td>
      <td headers="grp_a summary_stub_grp_a_2 time" class="gt_row gt_right gt_summary_row gt_last_summary_row">—</td>
      <td headers="grp_a summary_stub_grp_a_2 datetime" class="gt_row gt_right gt_summary_row gt_last_summary_row">—</td>
      <td headers="grp_a summary_stub_grp_a_2 currency" class="gt_row gt_right gt_summary_row gt_last_summary_row">65,100.00</td></tr>
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
          <tr><th id="grand_summary_stub_1" scope="row" class="gt_row gt_left gt_stub gt_grand_summary_row gt_first_grand_summary_row gt_last_summary_row">total</th>
      <td headers="grand_summary_stub_1 num" class="gt_row gt_right gt_grand_summary_row gt_first_grand_summary_row gt_last_summary_row">—</td>
      <td headers="grand_summary_stub_1 char" class="gt_row gt_left gt_grand_summary_row gt_first_grand_summary_row gt_last_summary_row">—</td>
      <td headers="grand_summary_stub_1 fctr" class="gt_row gt_center gt_grand_summary_row gt_first_grand_summary_row gt_last_summary_row">—</td>
      <td headers="grand_summary_stub_1 date" class="gt_row gt_right gt_grand_summary_row gt_first_grand_summary_row gt_last_summary_row">—</td>
      <td headers="grand_summary_stub_1 time" class="gt_row gt_right gt_grand_summary_row gt_first_grand_summary_row gt_last_summary_row">—</td>
      <td headers="grand_summary_stub_1 datetime" class="gt_row gt_right gt_grand_summary_row gt_first_grand_summary_row gt_last_summary_row">—</td>
      <td headers="grand_summary_stub_1 currency" class="gt_row gt_right gt_grand_summary_row gt_first_grand_summary_row gt_last_summary_row">66,509</td></tr>
        </tbody>
        <tfoot>
          <tr class="gt_sourcenotes">
            <td class="gt_sourcenote" colspan="8">This is a source note.</td>
          </tr>
          <tr class="gt_sourcenotes">
            <td class="gt_sourcenote" colspan="8">This is a second source note.</td>
          </tr>
        </tfoot>
      </table>

---

    Code
      cat(render_as_html(gt_tbl))
    Output
      <table class="gt_table" data-quarto-disable-processing="false" data-quarto-bootstrap="false">
        <!--/html_preserve--><caption class='gt_caption'>This is a caption</caption><!--html_preserve-->
        <thead>
          <tr class="gt_heading">
            <td colspan="8" class="gt_heading gt_title gt_font_normal" style>The title of the table</td>
          </tr>
          <tr class="gt_heading">
            <td colspan="8" class="gt_heading gt_subtitle gt_font_normal gt_bottom_border" style>The table's subtitle</td>
          </tr>
          <tr class="gt_col_headings gt_spanner_row">
            <th rowspan="1" colspan="1" scope="col"></th>
            <th class="gt_center gt_columns_top_border gt_column_spanner_outer" rowspan="1" colspan="7" scope="colgroup" id="Grand Spanner">
              <div class="gt_column_spanner">Grand Spanner</div>
            </th>
          </tr>
          <tr class="gt_col_headings gt_spanner_row">
            <th class="gt_col_heading gt_columns_bottom_border gt_left" rowspan="2" colspan="1" scope="col" id="a::stub">A Stubhead Label</th>
            <th class="gt_center gt_columns_top_border gt_column_spanner_outer" rowspan="1" colspan="1" scope="col" id="Numbers">
              <div class="gt_column_spanner">Numbers</div>
            </th>
            <th class="gt_center gt_columns_top_border gt_column_spanner_outer" rowspan="1" colspan="2" scope="colgroup" id="Words">
              <div class="gt_column_spanner">Words</div>
            </th>
            <th class="gt_center gt_columns_top_border gt_column_spanner_outer" rowspan="1" colspan="3" scope="colgroup" id="Date and Time">
              <div class="gt_column_spanner">Date and Time</div>
            </th>
            <th class="gt_center gt_columns_top_border gt_column_spanner_outer" rowspan="1" colspan="1" scope="col" id="Numbers">
              <div class="gt_column_spanner">Numbers</div>
            </th>
          </tr>
          <tr class="gt_col_headings">
            <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id="num">num</th>
            <th class="gt_col_heading gt_columns_bottom_border gt_left" rowspan="1" colspan="1" scope="col" id="char">char</th>
            <th class="gt_col_heading gt_columns_bottom_border gt_center" rowspan="1" colspan="1" scope="col" id="fctr">fctr</th>
            <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id="date">date</th>
            <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id="time">time</th>
            <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id="datetime">datetime</th>
            <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id="currency">currency</th>
          </tr>
        </thead>
        <tbody class="gt_table_body">
          <tr class="gt_group_heading_row">
            <th colspan="8" class="gt_group_heading" scope="colgroup" id="grp_a">grp_a</th>
          </tr>
          <tr class="gt_row_group_first"><th id="stub_1_1" scope="row" class="gt_row gt_left gt_stub">row_1</th>
      <td headers="grp_a stub_1_1 num" class="gt_row gt_right"><span class="gt_footnote_marks" style="white-space:nowrap;font-style:italic;font-weight:normal;line-height:0;"><sup>1</sup></span> 1.111e-01</td>
      <td headers="grp_a stub_1_1 char" class="gt_row gt_left">apricot</td>
      <td headers="grp_a stub_1_1 fctr" class="gt_row gt_center">one</td>
      <td headers="grp_a stub_1_1 date" class="gt_row gt_right">2015-01-15</td>
      <td headers="grp_a stub_1_1 time" class="gt_row gt_right">13:35</td>
      <td headers="grp_a stub_1_1 datetime" class="gt_row gt_right">2018-01-01 02:22</td>
      <td headers="grp_a stub_1_1 currency" class="gt_row gt_right">49.950</td></tr>
          <tr><th id="stub_1_2" scope="row" class="gt_row gt_left gt_stub">row_2</th>
      <td headers="grp_a stub_1_2 num" class="gt_row gt_right"><span class="gt_footnote_marks" style="white-space:nowrap;font-style:italic;font-weight:normal;line-height:0;"><sup>2</sup></span> 2.222e+00</td>
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
          <tr><th id="summary_stub_grp_a_2" scope="row" class="gt_row gt_left gt_stub gt_summary_row gt_last_summary_row">max</th>
      <td headers="grp_a summary_stub_grp_a_2 num" class="gt_row gt_right gt_summary_row gt_last_summary_row">444.40</td>
      <td headers="grp_a summary_stub_grp_a_2 char" class="gt_row gt_left gt_summary_row gt_last_summary_row">—</td>
      <td headers="grp_a summary_stub_grp_a_2 fctr" class="gt_row gt_center gt_summary_row gt_last_summary_row">—</td>
      <td headers="grp_a summary_stub_grp_a_2 date" class="gt_row gt_right gt_summary_row gt_last_summary_row">—</td>
      <td headers="grp_a summary_stub_grp_a_2 time" class="gt_row gt_right gt_summary_row gt_last_summary_row">—</td>
      <td headers="grp_a summary_stub_grp_a_2 datetime" class="gt_row gt_right gt_summary_row gt_last_summary_row">—</td>
      <td headers="grp_a summary_stub_grp_a_2 currency" class="gt_row gt_right gt_summary_row gt_last_summary_row">65,100.00</td></tr>
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
          <tr><th id="grand_summary_stub_1" scope="row" class="gt_row gt_left gt_stub gt_grand_summary_row gt_first_grand_summary_row gt_last_summary_row">total</th>
      <td headers="grand_summary_stub_1 num" class="gt_row gt_right gt_grand_summary_row gt_first_grand_summary_row gt_last_summary_row">—</td>
      <td headers="grand_summary_stub_1 char" class="gt_row gt_left gt_grand_summary_row gt_first_grand_summary_row gt_last_summary_row">—</td>
      <td headers="grand_summary_stub_1 fctr" class="gt_row gt_center gt_grand_summary_row gt_first_grand_summary_row gt_last_summary_row">—</td>
      <td headers="grand_summary_stub_1 date" class="gt_row gt_right gt_grand_summary_row gt_first_grand_summary_row gt_last_summary_row">—</td>
      <td headers="grand_summary_stub_1 time" class="gt_row gt_right gt_grand_summary_row gt_first_grand_summary_row gt_last_summary_row">—</td>
      <td headers="grand_summary_stub_1 datetime" class="gt_row gt_right gt_grand_summary_row gt_first_grand_summary_row gt_last_summary_row">—</td>
      <td headers="grand_summary_stub_1 currency" class="gt_row gt_right gt_grand_summary_row gt_first_grand_summary_row gt_last_summary_row">66,509</td></tr>
        </tbody>
        <tfoot>
          <tr class="gt_footnotes">
            <td class="gt_footnote" colspan="8"><span class="gt_footnote_marks" style="white-space:nowrap;font-style:italic;font-weight:normal;line-height:0;"><sup>1</sup></span> This is a footnote.</td>
          </tr>
          <tr class="gt_footnotes">
            <td class="gt_footnote" colspan="8"><span class="gt_footnote_marks" style="white-space:nowrap;font-style:italic;font-weight:normal;line-height:0;"><sup>2</sup></span> This is a second footnote.</td>
          </tr>
        </tfoot>
      </table>

---

    Code
      cat(render_as_html(gt_tbl))
    Output
      <table class="gt_table" data-quarto-disable-processing="false" data-quarto-bootstrap="false">
        <!--/html_preserve--><caption class='gt_caption'>This is a caption</caption><!--html_preserve-->
        <thead>
          <tr class="gt_heading">
            <td colspan="8" class="gt_heading gt_title gt_font_normal" style>The title of the table</td>
          </tr>
          <tr class="gt_heading">
            <td colspan="8" class="gt_heading gt_subtitle gt_font_normal gt_bottom_border" style>The table's subtitle</td>
          </tr>
          <tr class="gt_col_headings gt_spanner_row">
            <th rowspan="1" colspan="1" scope="col"></th>
            <th class="gt_center gt_columns_top_border gt_column_spanner_outer" rowspan="1" colspan="7" scope="colgroup" id="Grand Spanner">
              <div class="gt_column_spanner">Grand Spanner</div>
            </th>
          </tr>
          <tr class="gt_col_headings gt_spanner_row">
            <th class="gt_col_heading gt_columns_bottom_border gt_left" rowspan="2" colspan="1" scope="col" id="a::stub">A Stubhead Label</th>
            <th class="gt_center gt_columns_top_border gt_column_spanner_outer" rowspan="1" colspan="1" scope="col" id="Numbers">
              <div class="gt_column_spanner">Numbers</div>
            </th>
            <th class="gt_center gt_columns_top_border gt_column_spanner_outer" rowspan="1" colspan="2" scope="colgroup" id="Words">
              <div class="gt_column_spanner">Words</div>
            </th>
            <th class="gt_center gt_columns_top_border gt_column_spanner_outer" rowspan="1" colspan="3" scope="colgroup" id="Date and Time">
              <div class="gt_column_spanner">Date and Time</div>
            </th>
            <th class="gt_center gt_columns_top_border gt_column_spanner_outer" rowspan="1" colspan="1" scope="col" id="Numbers">
              <div class="gt_column_spanner">Numbers</div>
            </th>
          </tr>
          <tr class="gt_col_headings">
            <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id="num">num</th>
            <th class="gt_col_heading gt_columns_bottom_border gt_left" rowspan="1" colspan="1" scope="col" id="char">char</th>
            <th class="gt_col_heading gt_columns_bottom_border gt_center" rowspan="1" colspan="1" scope="col" id="fctr">fctr</th>
            <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id="date">date</th>
            <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id="time">time</th>
            <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id="datetime">datetime</th>
            <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id="currency">currency</th>
          </tr>
        </thead>
        <tbody class="gt_table_body">
          <tr class="gt_group_heading_row">
            <th colspan="8" class="gt_group_heading" scope="colgroup" id="grp_a">grp_a</th>
          </tr>
          <tr class="gt_row_group_first"><th id="stub_1_1" scope="row" class="gt_row gt_left gt_stub">row_1</th>
      <td headers="grp_a stub_1_1 num" class="gt_row gt_right"><span class="gt_footnote_marks" style="white-space:nowrap;font-style:italic;font-weight:normal;line-height:0;"><sup>1</sup></span> 1.111e-01</td>
      <td headers="grp_a stub_1_1 char" class="gt_row gt_left">apricot</td>
      <td headers="grp_a stub_1_1 fctr" class="gt_row gt_center">one</td>
      <td headers="grp_a stub_1_1 date" class="gt_row gt_right">2015-01-15</td>
      <td headers="grp_a stub_1_1 time" class="gt_row gt_right">13:35</td>
      <td headers="grp_a stub_1_1 datetime" class="gt_row gt_right">2018-01-01 02:22</td>
      <td headers="grp_a stub_1_1 currency" class="gt_row gt_right">49.950</td></tr>
          <tr><th id="stub_1_2" scope="row" class="gt_row gt_left gt_stub">row_2</th>
      <td headers="grp_a stub_1_2 num" class="gt_row gt_right"><span class="gt_footnote_marks" style="white-space:nowrap;font-style:italic;font-weight:normal;line-height:0;"><sup>2</sup></span> 2.222e+00</td>
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
          <tr><th id="summary_stub_grp_a_2" scope="row" class="gt_row gt_left gt_stub gt_summary_row gt_last_summary_row">max</th>
      <td headers="grp_a summary_stub_grp_a_2 num" class="gt_row gt_right gt_summary_row gt_last_summary_row">444.40</td>
      <td headers="grp_a summary_stub_grp_a_2 char" class="gt_row gt_left gt_summary_row gt_last_summary_row">—</td>
      <td headers="grp_a summary_stub_grp_a_2 fctr" class="gt_row gt_center gt_summary_row gt_last_summary_row">—</td>
      <td headers="grp_a summary_stub_grp_a_2 date" class="gt_row gt_right gt_summary_row gt_last_summary_row">—</td>
      <td headers="grp_a summary_stub_grp_a_2 time" class="gt_row gt_right gt_summary_row gt_last_summary_row">—</td>
      <td headers="grp_a summary_stub_grp_a_2 datetime" class="gt_row gt_right gt_summary_row gt_last_summary_row">—</td>
      <td headers="grp_a summary_stub_grp_a_2 currency" class="gt_row gt_right gt_summary_row gt_last_summary_row">65,100.00</td></tr>
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
          <tr><th id="grand_summary_stub_1" scope="row" class="gt_row gt_left gt_stub gt_grand_summary_row gt_first_grand_summary_row gt_last_summary_row">total</th>
      <td headers="grand_summary_stub_1 num" class="gt_row gt_right gt_grand_summary_row gt_first_grand_summary_row gt_last_summary_row">—</td>
      <td headers="grand_summary_stub_1 char" class="gt_row gt_left gt_grand_summary_row gt_first_grand_summary_row gt_last_summary_row">—</td>
      <td headers="grand_summary_stub_1 fctr" class="gt_row gt_center gt_grand_summary_row gt_first_grand_summary_row gt_last_summary_row">—</td>
      <td headers="grand_summary_stub_1 date" class="gt_row gt_right gt_grand_summary_row gt_first_grand_summary_row gt_last_summary_row">—</td>
      <td headers="grand_summary_stub_1 time" class="gt_row gt_right gt_grand_summary_row gt_first_grand_summary_row gt_last_summary_row">—</td>
      <td headers="grand_summary_stub_1 datetime" class="gt_row gt_right gt_grand_summary_row gt_first_grand_summary_row gt_last_summary_row">—</td>
      <td headers="grand_summary_stub_1 currency" class="gt_row gt_right gt_grand_summary_row gt_first_grand_summary_row gt_last_summary_row">66,509</td></tr>
        </tbody>
        <tfoot>
          <tr class="gt_footnotes">
            <td class="gt_footnote" colspan="8"><span class="gt_footnote_marks" style="white-space:nowrap;font-style:italic;font-weight:normal;line-height:0;"><sup>1</sup></span> This is a footnote.</td>
          </tr>
          <tr class="gt_footnotes">
            <td class="gt_footnote" colspan="8"><span class="gt_footnote_marks" style="white-space:nowrap;font-style:italic;font-weight:normal;line-height:0;"><sup>2</sup></span> This is a second footnote.</td>
          </tr>
          <tr class="gt_sourcenotes">
            <td class="gt_sourcenote" colspan="8">This is a source note.</td>
          </tr>
        </tfoot>
      </table>

---

    Code
      cat(render_as_html(gt_tbl))
    Output
      <table class="gt_table" data-quarto-disable-processing="false" data-quarto-bootstrap="false">
        <!--/html_preserve--><caption class='gt_caption'>This is a caption</caption><!--html_preserve-->
        <thead>
          <tr class="gt_heading">
            <td colspan="8" class="gt_heading gt_title gt_font_normal" style>The title of the table</td>
          </tr>
          <tr class="gt_heading">
            <td colspan="8" class="gt_heading gt_subtitle gt_font_normal gt_bottom_border" style>The table's subtitle</td>
          </tr>
          <tr class="gt_col_headings gt_spanner_row">
            <th rowspan="1" colspan="1" scope="col"></th>
            <th class="gt_center gt_columns_top_border gt_column_spanner_outer" rowspan="1" colspan="7" scope="colgroup" id="Grand Spanner">
              <div class="gt_column_spanner">Grand Spanner</div>
            </th>
          </tr>
          <tr class="gt_col_headings gt_spanner_row">
            <th class="gt_col_heading gt_columns_bottom_border gt_left" rowspan="2" colspan="1" scope="col" id="a::stub">A Stubhead Label</th>
            <th class="gt_center gt_columns_top_border gt_column_spanner_outer" rowspan="1" colspan="1" scope="col" id="Numbers">
              <div class="gt_column_spanner">Numbers</div>
            </th>
            <th class="gt_center gt_columns_top_border gt_column_spanner_outer" rowspan="1" colspan="2" scope="colgroup" id="Words">
              <div class="gt_column_spanner">Words</div>
            </th>
            <th class="gt_center gt_columns_top_border gt_column_spanner_outer" rowspan="1" colspan="3" scope="colgroup" id="Date and Time">
              <div class="gt_column_spanner">Date and Time</div>
            </th>
            <th class="gt_center gt_columns_top_border gt_column_spanner_outer" rowspan="1" colspan="1" scope="col" id="Numbers">
              <div class="gt_column_spanner">Numbers</div>
            </th>
          </tr>
          <tr class="gt_col_headings">
            <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id="num">num</th>
            <th class="gt_col_heading gt_columns_bottom_border gt_left" rowspan="1" colspan="1" scope="col" id="char">char</th>
            <th class="gt_col_heading gt_columns_bottom_border gt_center" rowspan="1" colspan="1" scope="col" id="fctr">fctr</th>
            <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id="date">date</th>
            <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id="time">time</th>
            <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id="datetime">datetime</th>
            <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id="currency">currency</th>
          </tr>
        </thead>
        <tbody class="gt_table_body">
          <tr class="gt_group_heading_row">
            <th colspan="8" class="gt_group_heading" scope="colgroup" id="grp_a">grp_a</th>
          </tr>
          <tr class="gt_row_group_first"><th id="stub_1_1" scope="row" class="gt_row gt_left gt_stub">row_1</th>
      <td headers="grp_a stub_1_1 num" class="gt_row gt_right"><span class="gt_footnote_marks" style="white-space:nowrap;font-style:italic;font-weight:normal;line-height:0;"><sup>1</sup></span> 1.111e-01</td>
      <td headers="grp_a stub_1_1 char" class="gt_row gt_left">apricot</td>
      <td headers="grp_a stub_1_1 fctr" class="gt_row gt_center">one</td>
      <td headers="grp_a stub_1_1 date" class="gt_row gt_right">2015-01-15</td>
      <td headers="grp_a stub_1_1 time" class="gt_row gt_right">13:35</td>
      <td headers="grp_a stub_1_1 datetime" class="gt_row gt_right">2018-01-01 02:22</td>
      <td headers="grp_a stub_1_1 currency" class="gt_row gt_right">49.950</td></tr>
          <tr><th id="stub_1_2" scope="row" class="gt_row gt_left gt_stub">row_2</th>
      <td headers="grp_a stub_1_2 num" class="gt_row gt_right"><span class="gt_footnote_marks" style="white-space:nowrap;font-style:italic;font-weight:normal;line-height:0;"><sup>2</sup></span> 2.222e+00</td>
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
          <tr><th id="summary_stub_grp_a_2" scope="row" class="gt_row gt_left gt_stub gt_summary_row gt_last_summary_row">max</th>
      <td headers="grp_a summary_stub_grp_a_2 num" class="gt_row gt_right gt_summary_row gt_last_summary_row">444.40</td>
      <td headers="grp_a summary_stub_grp_a_2 char" class="gt_row gt_left gt_summary_row gt_last_summary_row">—</td>
      <td headers="grp_a summary_stub_grp_a_2 fctr" class="gt_row gt_center gt_summary_row gt_last_summary_row">—</td>
      <td headers="grp_a summary_stub_grp_a_2 date" class="gt_row gt_right gt_summary_row gt_last_summary_row">—</td>
      <td headers="grp_a summary_stub_grp_a_2 time" class="gt_row gt_right gt_summary_row gt_last_summary_row">—</td>
      <td headers="grp_a summary_stub_grp_a_2 datetime" class="gt_row gt_right gt_summary_row gt_last_summary_row">—</td>
      <td headers="grp_a summary_stub_grp_a_2 currency" class="gt_row gt_right gt_summary_row gt_last_summary_row">65,100.00</td></tr>
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
          <tr><th id="grand_summary_stub_1" scope="row" class="gt_row gt_left gt_stub gt_grand_summary_row gt_first_grand_summary_row gt_last_summary_row">total</th>
      <td headers="grand_summary_stub_1 num" class="gt_row gt_right gt_grand_summary_row gt_first_grand_summary_row gt_last_summary_row">—</td>
      <td headers="grand_summary_stub_1 char" class="gt_row gt_left gt_grand_summary_row gt_first_grand_summary_row gt_last_summary_row">—</td>
      <td headers="grand_summary_stub_1 fctr" class="gt_row gt_center gt_grand_summary_row gt_first_grand_summary_row gt_last_summary_row">—</td>
      <td headers="grand_summary_stub_1 date" class="gt_row gt_right gt_grand_summary_row gt_first_grand_summary_row gt_last_summary_row">—</td>
      <td headers="grand_summary_stub_1 time" class="gt_row gt_right gt_grand_summary_row gt_first_grand_summary_row gt_last_summary_row">—</td>
      <td headers="grand_summary_stub_1 datetime" class="gt_row gt_right gt_grand_summary_row gt_first_grand_summary_row gt_last_summary_row">—</td>
      <td headers="grand_summary_stub_1 currency" class="gt_row gt_right gt_grand_summary_row gt_first_grand_summary_row gt_last_summary_row">66,509</td></tr>
        </tbody>
        <tfoot>
          <tr class="gt_footnotes">
            <td class="gt_footnote" colspan="8"><span class="gt_footnote_marks" style="white-space:nowrap;font-style:italic;font-weight:normal;line-height:0;"><sup>1</sup></span> This is a footnote.</td>
          </tr>
          <tr class="gt_footnotes">
            <td class="gt_footnote" colspan="8"><span class="gt_footnote_marks" style="white-space:nowrap;font-style:italic;font-weight:normal;line-height:0;"><sup>2</sup></span> This is a second footnote.</td>
          </tr>
          <tr class="gt_sourcenotes">
            <td class="gt_sourcenote" colspan="8">This is a second source note.</td>
          </tr>
        </tfoot>
      </table>

---

    Code
      cat(render_as_html(gt_tbl))
    Output
      <table class="gt_table" data-quarto-disable-processing="false" data-quarto-bootstrap="false">
        <!--/html_preserve--><caption class='gt_caption'>This is a caption</caption><!--html_preserve-->
        <thead>
          <tr class="gt_heading">
            <td colspan="8" class="gt_heading gt_title gt_font_normal" style>The title of the table</td>
          </tr>
          <tr class="gt_heading">
            <td colspan="8" class="gt_heading gt_subtitle gt_font_normal gt_bottom_border" style>The table's subtitle</td>
          </tr>
          <tr class="gt_col_headings gt_spanner_row">
            <th rowspan="1" colspan="1" scope="col"></th>
            <th class="gt_center gt_columns_top_border gt_column_spanner_outer" rowspan="1" colspan="7" scope="colgroup" id="Grand Spanner">
              <div class="gt_column_spanner">Grand Spanner</div>
            </th>
          </tr>
          <tr class="gt_col_headings gt_spanner_row">
            <th class="gt_col_heading gt_columns_bottom_border gt_left" rowspan="2" colspan="1" scope="col" id="a::stub">A Stubhead Label</th>
            <th class="gt_center gt_columns_top_border gt_column_spanner_outer" rowspan="1" colspan="1" scope="col" id="Numbers">
              <div class="gt_column_spanner">Numbers</div>
            </th>
            <th class="gt_center gt_columns_top_border gt_column_spanner_outer" rowspan="1" colspan="2" scope="colgroup" id="Words">
              <div class="gt_column_spanner">Words</div>
            </th>
            <th class="gt_center gt_columns_top_border gt_column_spanner_outer" rowspan="1" colspan="3" scope="colgroup" id="Date and Time">
              <div class="gt_column_spanner">Date and Time</div>
            </th>
            <th class="gt_center gt_columns_top_border gt_column_spanner_outer" rowspan="1" colspan="1" scope="col" id="Numbers">
              <div class="gt_column_spanner">Numbers</div>
            </th>
          </tr>
          <tr class="gt_col_headings">
            <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id="num">num</th>
            <th class="gt_col_heading gt_columns_bottom_border gt_left" rowspan="1" colspan="1" scope="col" id="char">char</th>
            <th class="gt_col_heading gt_columns_bottom_border gt_center" rowspan="1" colspan="1" scope="col" id="fctr">fctr</th>
            <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id="date">date</th>
            <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id="time">time</th>
            <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id="datetime">datetime</th>
            <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id="currency">currency</th>
          </tr>
        </thead>
        <tbody class="gt_table_body">
          <tr class="gt_group_heading_row">
            <th colspan="8" class="gt_group_heading" scope="colgroup" id="grp_a">grp_a</th>
          </tr>
          <tr class="gt_row_group_first"><th id="stub_1_1" scope="row" class="gt_row gt_left gt_stub">row_1</th>
      <td headers="grp_a stub_1_1 num" class="gt_row gt_right"><span class="gt_footnote_marks" style="white-space:nowrap;font-style:italic;font-weight:normal;line-height:0;"><sup>1</sup></span> 1.111e-01</td>
      <td headers="grp_a stub_1_1 char" class="gt_row gt_left">apricot</td>
      <td headers="grp_a stub_1_1 fctr" class="gt_row gt_center">one</td>
      <td headers="grp_a stub_1_1 date" class="gt_row gt_right">2015-01-15</td>
      <td headers="grp_a stub_1_1 time" class="gt_row gt_right">13:35</td>
      <td headers="grp_a stub_1_1 datetime" class="gt_row gt_right">2018-01-01 02:22</td>
      <td headers="grp_a stub_1_1 currency" class="gt_row gt_right">49.950</td></tr>
          <tr><th id="stub_1_2" scope="row" class="gt_row gt_left gt_stub">row_2</th>
      <td headers="grp_a stub_1_2 num" class="gt_row gt_right"><span class="gt_footnote_marks" style="white-space:nowrap;font-style:italic;font-weight:normal;line-height:0;"><sup>2</sup></span> 2.222e+00</td>
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
          <tr><th id="summary_stub_grp_a_2" scope="row" class="gt_row gt_left gt_stub gt_summary_row gt_last_summary_row">max</th>
      <td headers="grp_a summary_stub_grp_a_2 num" class="gt_row gt_right gt_summary_row gt_last_summary_row">444.40</td>
      <td headers="grp_a summary_stub_grp_a_2 char" class="gt_row gt_left gt_summary_row gt_last_summary_row">—</td>
      <td headers="grp_a summary_stub_grp_a_2 fctr" class="gt_row gt_center gt_summary_row gt_last_summary_row">—</td>
      <td headers="grp_a summary_stub_grp_a_2 date" class="gt_row gt_right gt_summary_row gt_last_summary_row">—</td>
      <td headers="grp_a summary_stub_grp_a_2 time" class="gt_row gt_right gt_summary_row gt_last_summary_row">—</td>
      <td headers="grp_a summary_stub_grp_a_2 datetime" class="gt_row gt_right gt_summary_row gt_last_summary_row">—</td>
      <td headers="grp_a summary_stub_grp_a_2 currency" class="gt_row gt_right gt_summary_row gt_last_summary_row">65,100.00</td></tr>
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
          <tr><th id="grand_summary_stub_1" scope="row" class="gt_row gt_left gt_stub gt_grand_summary_row gt_first_grand_summary_row gt_last_summary_row">total</th>
      <td headers="grand_summary_stub_1 num" class="gt_row gt_right gt_grand_summary_row gt_first_grand_summary_row gt_last_summary_row">—</td>
      <td headers="grand_summary_stub_1 char" class="gt_row gt_left gt_grand_summary_row gt_first_grand_summary_row gt_last_summary_row">—</td>
      <td headers="grand_summary_stub_1 fctr" class="gt_row gt_center gt_grand_summary_row gt_first_grand_summary_row gt_last_summary_row">—</td>
      <td headers="grand_summary_stub_1 date" class="gt_row gt_right gt_grand_summary_row gt_first_grand_summary_row gt_last_summary_row">—</td>
      <td headers="grand_summary_stub_1 time" class="gt_row gt_right gt_grand_summary_row gt_first_grand_summary_row gt_last_summary_row">—</td>
      <td headers="grand_summary_stub_1 datetime" class="gt_row gt_right gt_grand_summary_row gt_first_grand_summary_row gt_last_summary_row">—</td>
      <td headers="grand_summary_stub_1 currency" class="gt_row gt_right gt_grand_summary_row gt_first_grand_summary_row gt_last_summary_row">66,509</td></tr>
        </tbody>
        <tfoot>
          <tr class="gt_footnotes">
            <td class="gt_footnote" colspan="8"><span class="gt_footnote_marks" style="white-space:nowrap;font-style:italic;font-weight:normal;line-height:0;"><sup>1</sup></span> This is a footnote.</td>
          </tr>
          <tr class="gt_footnotes">
            <td class="gt_footnote" colspan="8"><span class="gt_footnote_marks" style="white-space:nowrap;font-style:italic;font-weight:normal;line-height:0;"><sup>2</sup></span> This is a second footnote.</td>
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
            <td colspan="8" class="gt_heading gt_title gt_font_normal" style>The title of the table</td>
          </tr>
          <tr class="gt_heading">
            <td colspan="8" class="gt_heading gt_subtitle gt_font_normal gt_bottom_border" style>The table's subtitle</td>
          </tr>
          <tr class="gt_col_headings gt_spanner_row">
            <th rowspan="1" colspan="1" scope="col"></th>
            <th class="gt_center gt_columns_top_border gt_column_spanner_outer" rowspan="1" colspan="7" scope="colgroup" id="Grand Spanner">
              <div class="gt_column_spanner">Grand Spanner</div>
            </th>
          </tr>
          <tr class="gt_col_headings gt_spanner_row">
            <th class="gt_col_heading gt_columns_bottom_border gt_left" rowspan="2" colspan="1" scope="col" id="a::stub">A Stubhead Label</th>
            <th class="gt_center gt_columns_top_border gt_column_spanner_outer" rowspan="1" colspan="1" scope="col" id="Numbers">
              <div class="gt_column_spanner">Numbers</div>
            </th>
            <th class="gt_center gt_columns_top_border gt_column_spanner_outer" rowspan="1" colspan="2" scope="colgroup" id="Words">
              <div class="gt_column_spanner">Words</div>
            </th>
            <th class="gt_center gt_columns_top_border gt_column_spanner_outer" rowspan="1" colspan="3" scope="colgroup" id="Date and Time">
              <div class="gt_column_spanner">Date and Time</div>
            </th>
            <th class="gt_center gt_columns_top_border gt_column_spanner_outer" rowspan="1" colspan="1" scope="col" id="Numbers">
              <div class="gt_column_spanner">Numbers</div>
            </th>
          </tr>
          <tr class="gt_col_headings">
            <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id="num">num</th>
            <th class="gt_col_heading gt_columns_bottom_border gt_left" rowspan="1" colspan="1" scope="col" id="char">char</th>
            <th class="gt_col_heading gt_columns_bottom_border gt_center" rowspan="1" colspan="1" scope="col" id="fctr">fctr</th>
            <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id="date">date</th>
            <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id="time">time</th>
            <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id="datetime">datetime</th>
            <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id="currency">currency</th>
          </tr>
        </thead>
        <tbody class="gt_table_body">
          <tr class="gt_group_heading_row">
            <th colspan="8" class="gt_group_heading" scope="colgroup" id="grp_a">grp_a</th>
          </tr>
          <tr class="gt_row_group_first"><th id="stub_1_1" scope="row" class="gt_row gt_left gt_stub">row_1</th>
      <td headers="grp_a stub_1_1 num" class="gt_row gt_right"><span class="gt_footnote_marks" style="white-space:nowrap;font-style:italic;font-weight:normal;line-height:0;"><sup>1</sup></span> 1.111e-01</td>
      <td headers="grp_a stub_1_1 char" class="gt_row gt_left">apricot</td>
      <td headers="grp_a stub_1_1 fctr" class="gt_row gt_center">one</td>
      <td headers="grp_a stub_1_1 date" class="gt_row gt_right">2015-01-15</td>
      <td headers="grp_a stub_1_1 time" class="gt_row gt_right">13:35</td>
      <td headers="grp_a stub_1_1 datetime" class="gt_row gt_right">2018-01-01 02:22</td>
      <td headers="grp_a stub_1_1 currency" class="gt_row gt_right">49.950</td></tr>
          <tr><th id="stub_1_2" scope="row" class="gt_row gt_left gt_stub">row_2</th>
      <td headers="grp_a stub_1_2 num" class="gt_row gt_right"><span class="gt_footnote_marks" style="white-space:nowrap;font-style:italic;font-weight:normal;line-height:0;"><sup>2</sup></span> 2.222e+00</td>
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
          <tr><th id="summary_stub_grp_a_2" scope="row" class="gt_row gt_left gt_stub gt_summary_row gt_last_summary_row">max</th>
      <td headers="grp_a summary_stub_grp_a_2 num" class="gt_row gt_right gt_summary_row gt_last_summary_row">444.40</td>
      <td headers="grp_a summary_stub_grp_a_2 char" class="gt_row gt_left gt_summary_row gt_last_summary_row">—</td>
      <td headers="grp_a summary_stub_grp_a_2 fctr" class="gt_row gt_center gt_summary_row gt_last_summary_row">—</td>
      <td headers="grp_a summary_stub_grp_a_2 date" class="gt_row gt_right gt_summary_row gt_last_summary_row">—</td>
      <td headers="grp_a summary_stub_grp_a_2 time" class="gt_row gt_right gt_summary_row gt_last_summary_row">—</td>
      <td headers="grp_a summary_stub_grp_a_2 datetime" class="gt_row gt_right gt_summary_row gt_last_summary_row">—</td>
      <td headers="grp_a summary_stub_grp_a_2 currency" class="gt_row gt_right gt_summary_row gt_last_summary_row">65,100.00</td></tr>
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
          <tr><th id="grand_summary_stub_1" scope="row" class="gt_row gt_left gt_stub gt_grand_summary_row gt_first_grand_summary_row gt_last_summary_row">total</th>
      <td headers="grand_summary_stub_1 num" class="gt_row gt_right gt_grand_summary_row gt_first_grand_summary_row gt_last_summary_row">—</td>
      <td headers="grand_summary_stub_1 char" class="gt_row gt_left gt_grand_summary_row gt_first_grand_summary_row gt_last_summary_row">—</td>
      <td headers="grand_summary_stub_1 fctr" class="gt_row gt_center gt_grand_summary_row gt_first_grand_summary_row gt_last_summary_row">—</td>
      <td headers="grand_summary_stub_1 date" class="gt_row gt_right gt_grand_summary_row gt_first_grand_summary_row gt_last_summary_row">—</td>
      <td headers="grand_summary_stub_1 time" class="gt_row gt_right gt_grand_summary_row gt_first_grand_summary_row gt_last_summary_row">—</td>
      <td headers="grand_summary_stub_1 datetime" class="gt_row gt_right gt_grand_summary_row gt_first_grand_summary_row gt_last_summary_row">—</td>
      <td headers="grand_summary_stub_1 currency" class="gt_row gt_right gt_grand_summary_row gt_first_grand_summary_row gt_last_summary_row">66,509</td></tr>
        </tbody>
        <tfoot>
          <tr class="gt_footnotes">
            <td class="gt_footnote" colspan="8"><span class="gt_footnote_marks" style="white-space:nowrap;font-style:italic;font-weight:normal;line-height:0;"><sup>1</sup></span> This is a footnote.</td>
          </tr>
          <tr class="gt_footnotes">
            <td class="gt_footnote" colspan="8"><span class="gt_footnote_marks" style="white-space:nowrap;font-style:italic;font-weight:normal;line-height:0;"><sup>2</sup></span> This is a second footnote.</td>
          </tr>
          <tr class="gt_sourcenotes">
            <td class="gt_sourcenote" colspan="8">This is a source note.</td>
          </tr>
          <tr class="gt_sourcenotes">
            <td class="gt_sourcenote" colspan="8">This is a second source note.</td>
          </tr>
        </tfoot>
      </table>

