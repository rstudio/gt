# fmt_fraction() produces reproducible results for HTML output

    Code
      cat(render_as_html(gt_tbl))
    Output
      <table class="gt_table" style="table-layout:fixed;width:0px;" data-quarto-disable-processing="false" data-quarto-bootstrap="false">
        <colgroup>
          <col style="width:100px;"/>
          <col style="width:100px;"/>
          <col style="width:100px;"/>
          <col style="width:100px;"/>
          <col style="width:100px;"/>
          <col style="width:100px;"/>
          <col style="width:100px;"/>
          <col style="width:100px;"/>
          <col style="width:100px;"/>
        </colgroup>
        <thead>
          <tr class="gt_col_headings">
            <th class="gt_col_heading gt_columns_bottom_border gt_left" rowspan="1" colspan="1" scope="col" id="a::stub"></th>
            <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id="low">low</th>
            <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id="med">med</th>
            <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id="high">high</th>
            <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id="halves">halves</th>
            <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id="quarters">quarters</th>
            <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id="eighths">eighths</th>
            <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id="sixteenths">sixteenths</th>
            <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id="hundredths">hundredths</th>
          </tr>
        </thead>
        <tbody class="gt_table_body">
          <tr class="gt_group_heading_row">
            <th colspan="9" class="gt_group_heading" scope="colgroup" id="0 to 1">0 to 1</th>
          </tr>
          <tr class="gt_row_group_first"><th id="stub_1_1" scope="row" class="gt_row gt_right gt_stub">0.0001</th>
      <td headers="0 to 1 stub_1_1 low" class="gt_row gt_right">0</td>
      <td headers="0 to 1 stub_1_1 med" class="gt_row gt_right">0</td>
      <td headers="0 to 1 stub_1_1 high" class="gt_row gt_right">0</td>
      <td headers="0 to 1 stub_1_1 halves" class="gt_row gt_right">0</td>
      <td headers="0 to 1 stub_1_1 quarters" class="gt_row gt_right">0</td>
      <td headers="0 to 1 stub_1_1 eighths" class="gt_row gt_right">0</td>
      <td headers="0 to 1 stub_1_1 sixteenths" class="gt_row gt_right">0</td>
      <td headers="0 to 1 stub_1_1 hundredths" class="gt_row gt_right">0</td></tr>
          <tr><th id="stub_1_2" scope="row" class="gt_row gt_right gt_stub">0.0010</th>
      <td headers="0 to 1 stub_1_2 low" class="gt_row gt_right">0</td>
      <td headers="0 to 1 stub_1_2 med" class="gt_row gt_right">0</td>
      <td headers="0 to 1 stub_1_2 high" class="gt_row gt_right"><span style="font-size:0.6em;line-height:0.6em;vertical-align:0.45em;">1</span><span style="font-size:0.7em;line-height:0.7em;vertical-align:0.15em;">⁄</span><span style="font-size:0.6em;line-height:0.6em;vertical-align:-0.05em;">999</span></td>
      <td headers="0 to 1 stub_1_2 halves" class="gt_row gt_right">0</td>
      <td headers="0 to 1 stub_1_2 quarters" class="gt_row gt_right">0</td>
      <td headers="0 to 1 stub_1_2 eighths" class="gt_row gt_right">0</td>
      <td headers="0 to 1 stub_1_2 sixteenths" class="gt_row gt_right">0</td>
      <td headers="0 to 1 stub_1_2 hundredths" class="gt_row gt_right">0</td></tr>
          <tr><th id="stub_1_3" scope="row" class="gt_row gt_right gt_stub">0.0100</th>
      <td headers="0 to 1 stub_1_3 low" class="gt_row gt_right">0</td>
      <td headers="0 to 1 stub_1_3 med" class="gt_row gt_right"><span style="font-size:0.6em;line-height:0.6em;vertical-align:0.45em;">1</span><span style="font-size:0.7em;line-height:0.7em;vertical-align:0.15em;">⁄</span><span style="font-size:0.6em;line-height:0.6em;vertical-align:-0.05em;">99</span></td>
      <td headers="0 to 1 stub_1_3 high" class="gt_row gt_right"><span style="font-size:0.6em;line-height:0.6em;vertical-align:0.45em;">1</span><span style="font-size:0.7em;line-height:0.7em;vertical-align:0.15em;">⁄</span><span style="font-size:0.6em;line-height:0.6em;vertical-align:-0.05em;">100</span></td>
      <td headers="0 to 1 stub_1_3 halves" class="gt_row gt_right">0</td>
      <td headers="0 to 1 stub_1_3 quarters" class="gt_row gt_right">0</td>
      <td headers="0 to 1 stub_1_3 eighths" class="gt_row gt_right">0</td>
      <td headers="0 to 1 stub_1_3 sixteenths" class="gt_row gt_right">0</td>
      <td headers="0 to 1 stub_1_3 hundredths" class="gt_row gt_right"><span style="font-size:0.6em;line-height:0.6em;vertical-align:0.45em;">1</span><span style="font-size:0.7em;line-height:0.7em;vertical-align:0.15em;">⁄</span><span style="font-size:0.6em;line-height:0.6em;vertical-align:-0.05em;">100</span></td></tr>
          <tr><th id="stub_1_4" scope="row" class="gt_row gt_right gt_stub">0.1000</th>
      <td headers="0 to 1 stub_1_4 low" class="gt_row gt_right"><span style="font-size:0.6em;line-height:0.6em;vertical-align:0.45em;">1</span><span style="font-size:0.7em;line-height:0.7em;vertical-align:0.15em;">⁄</span><span style="font-size:0.6em;line-height:0.6em;vertical-align:-0.05em;">9</span></td>
      <td headers="0 to 1 stub_1_4 med" class="gt_row gt_right"><span style="font-size:0.6em;line-height:0.6em;vertical-align:0.45em;">1</span><span style="font-size:0.7em;line-height:0.7em;vertical-align:0.15em;">⁄</span><span style="font-size:0.6em;line-height:0.6em;vertical-align:-0.05em;">10</span></td>
      <td headers="0 to 1 stub_1_4 high" class="gt_row gt_right"><span style="font-size:0.6em;line-height:0.6em;vertical-align:0.45em;">1</span><span style="font-size:0.7em;line-height:0.7em;vertical-align:0.15em;">⁄</span><span style="font-size:0.6em;line-height:0.6em;vertical-align:-0.05em;">10</span></td>
      <td headers="0 to 1 stub_1_4 halves" class="gt_row gt_right">0</td>
      <td headers="0 to 1 stub_1_4 quarters" class="gt_row gt_right">0</td>
      <td headers="0 to 1 stub_1_4 eighths" class="gt_row gt_right"><span style="font-size:0.6em;line-height:0.6em;vertical-align:0.45em;">1</span><span style="font-size:0.7em;line-height:0.7em;vertical-align:0.15em;">⁄</span><span style="font-size:0.6em;line-height:0.6em;vertical-align:-0.05em;">8</span></td>
      <td headers="0 to 1 stub_1_4 sixteenths" class="gt_row gt_right"><span style="font-size:0.6em;line-height:0.6em;vertical-align:0.45em;">2</span><span style="font-size:0.7em;line-height:0.7em;vertical-align:0.15em;">⁄</span><span style="font-size:0.6em;line-height:0.6em;vertical-align:-0.05em;">16</span></td>
      <td headers="0 to 1 stub_1_4 hundredths" class="gt_row gt_right"><span style="font-size:0.6em;line-height:0.6em;vertical-align:0.45em;">10</span><span style="font-size:0.7em;line-height:0.7em;vertical-align:0.15em;">⁄</span><span style="font-size:0.6em;line-height:0.6em;vertical-align:-0.05em;">100</span></td></tr>
          <tr><th id="stub_1_5" scope="row" class="gt_row gt_right gt_stub">0.2500</th>
      <td headers="0 to 1 stub_1_5 low" class="gt_row gt_right"><span style="font-size:0.6em;line-height:0.6em;vertical-align:0.45em;">1</span><span style="font-size:0.7em;line-height:0.7em;vertical-align:0.15em;">⁄</span><span style="font-size:0.6em;line-height:0.6em;vertical-align:-0.05em;">4</span></td>
      <td headers="0 to 1 stub_1_5 med" class="gt_row gt_right"><span style="font-size:0.6em;line-height:0.6em;vertical-align:0.45em;">1</span><span style="font-size:0.7em;line-height:0.7em;vertical-align:0.15em;">⁄</span><span style="font-size:0.6em;line-height:0.6em;vertical-align:-0.05em;">4</span></td>
      <td headers="0 to 1 stub_1_5 high" class="gt_row gt_right"><span style="font-size:0.6em;line-height:0.6em;vertical-align:0.45em;">1</span><span style="font-size:0.7em;line-height:0.7em;vertical-align:0.15em;">⁄</span><span style="font-size:0.6em;line-height:0.6em;vertical-align:-0.05em;">4</span></td>
      <td headers="0 to 1 stub_1_5 halves" class="gt_row gt_right"><span style="font-size:0.6em;line-height:0.6em;vertical-align:0.45em;">1</span><span style="font-size:0.7em;line-height:0.7em;vertical-align:0.15em;">⁄</span><span style="font-size:0.6em;line-height:0.6em;vertical-align:-0.05em;">2</span></td>
      <td headers="0 to 1 stub_1_5 quarters" class="gt_row gt_right"><span style="font-size:0.6em;line-height:0.6em;vertical-align:0.45em;">1</span><span style="font-size:0.7em;line-height:0.7em;vertical-align:0.15em;">⁄</span><span style="font-size:0.6em;line-height:0.6em;vertical-align:-0.05em;">4</span></td>
      <td headers="0 to 1 stub_1_5 eighths" class="gt_row gt_right"><span style="font-size:0.6em;line-height:0.6em;vertical-align:0.45em;">2</span><span style="font-size:0.7em;line-height:0.7em;vertical-align:0.15em;">⁄</span><span style="font-size:0.6em;line-height:0.6em;vertical-align:-0.05em;">8</span></td>
      <td headers="0 to 1 stub_1_5 sixteenths" class="gt_row gt_right"><span style="font-size:0.6em;line-height:0.6em;vertical-align:0.45em;">4</span><span style="font-size:0.7em;line-height:0.7em;vertical-align:0.15em;">⁄</span><span style="font-size:0.6em;line-height:0.6em;vertical-align:-0.05em;">16</span></td>
      <td headers="0 to 1 stub_1_5 hundredths" class="gt_row gt_right"><span style="font-size:0.6em;line-height:0.6em;vertical-align:0.45em;">25</span><span style="font-size:0.7em;line-height:0.7em;vertical-align:0.15em;">⁄</span><span style="font-size:0.6em;line-height:0.6em;vertical-align:-0.05em;">100</span></td></tr>
          <tr><th id="stub_1_6" scope="row" class="gt_row gt_right gt_stub">0.4000</th>
      <td headers="0 to 1 stub_1_6 low" class="gt_row gt_right"><span style="font-size:0.6em;line-height:0.6em;vertical-align:0.45em;">2</span><span style="font-size:0.7em;line-height:0.7em;vertical-align:0.15em;">⁄</span><span style="font-size:0.6em;line-height:0.6em;vertical-align:-0.05em;">5</span></td>
      <td headers="0 to 1 stub_1_6 med" class="gt_row gt_right"><span style="font-size:0.6em;line-height:0.6em;vertical-align:0.45em;">2</span><span style="font-size:0.7em;line-height:0.7em;vertical-align:0.15em;">⁄</span><span style="font-size:0.6em;line-height:0.6em;vertical-align:-0.05em;">5</span></td>
      <td headers="0 to 1 stub_1_6 high" class="gt_row gt_right"><span style="font-size:0.6em;line-height:0.6em;vertical-align:0.45em;">2</span><span style="font-size:0.7em;line-height:0.7em;vertical-align:0.15em;">⁄</span><span style="font-size:0.6em;line-height:0.6em;vertical-align:-0.05em;">5</span></td>
      <td headers="0 to 1 stub_1_6 halves" class="gt_row gt_right"><span style="font-size:0.6em;line-height:0.6em;vertical-align:0.45em;">1</span><span style="font-size:0.7em;line-height:0.7em;vertical-align:0.15em;">⁄</span><span style="font-size:0.6em;line-height:0.6em;vertical-align:-0.05em;">2</span></td>
      <td headers="0 to 1 stub_1_6 quarters" class="gt_row gt_right"><span style="font-size:0.6em;line-height:0.6em;vertical-align:0.45em;">2</span><span style="font-size:0.7em;line-height:0.7em;vertical-align:0.15em;">⁄</span><span style="font-size:0.6em;line-height:0.6em;vertical-align:-0.05em;">4</span></td>
      <td headers="0 to 1 stub_1_6 eighths" class="gt_row gt_right"><span style="font-size:0.6em;line-height:0.6em;vertical-align:0.45em;">3</span><span style="font-size:0.7em;line-height:0.7em;vertical-align:0.15em;">⁄</span><span style="font-size:0.6em;line-height:0.6em;vertical-align:-0.05em;">8</span></td>
      <td headers="0 to 1 stub_1_6 sixteenths" class="gt_row gt_right"><span style="font-size:0.6em;line-height:0.6em;vertical-align:0.45em;">6</span><span style="font-size:0.7em;line-height:0.7em;vertical-align:0.15em;">⁄</span><span style="font-size:0.6em;line-height:0.6em;vertical-align:-0.05em;">16</span></td>
      <td headers="0 to 1 stub_1_6 hundredths" class="gt_row gt_right"><span style="font-size:0.6em;line-height:0.6em;vertical-align:0.45em;">40</span><span style="font-size:0.7em;line-height:0.7em;vertical-align:0.15em;">⁄</span><span style="font-size:0.6em;line-height:0.6em;vertical-align:-0.05em;">100</span></td></tr>
          <tr><th id="stub_1_7" scope="row" class="gt_row gt_right gt_stub">0.5000</th>
      <td headers="0 to 1 stub_1_7 low" class="gt_row gt_right"><span style="font-size:0.6em;line-height:0.6em;vertical-align:0.45em;">1</span><span style="font-size:0.7em;line-height:0.7em;vertical-align:0.15em;">⁄</span><span style="font-size:0.6em;line-height:0.6em;vertical-align:-0.05em;">2</span></td>
      <td headers="0 to 1 stub_1_7 med" class="gt_row gt_right"><span style="font-size:0.6em;line-height:0.6em;vertical-align:0.45em;">1</span><span style="font-size:0.7em;line-height:0.7em;vertical-align:0.15em;">⁄</span><span style="font-size:0.6em;line-height:0.6em;vertical-align:-0.05em;">2</span></td>
      <td headers="0 to 1 stub_1_7 high" class="gt_row gt_right"><span style="font-size:0.6em;line-height:0.6em;vertical-align:0.45em;">1</span><span style="font-size:0.7em;line-height:0.7em;vertical-align:0.15em;">⁄</span><span style="font-size:0.6em;line-height:0.6em;vertical-align:-0.05em;">2</span></td>
      <td headers="0 to 1 stub_1_7 halves" class="gt_row gt_right"><span style="font-size:0.6em;line-height:0.6em;vertical-align:0.45em;">1</span><span style="font-size:0.7em;line-height:0.7em;vertical-align:0.15em;">⁄</span><span style="font-size:0.6em;line-height:0.6em;vertical-align:-0.05em;">2</span></td>
      <td headers="0 to 1 stub_1_7 quarters" class="gt_row gt_right"><span style="font-size:0.6em;line-height:0.6em;vertical-align:0.45em;">2</span><span style="font-size:0.7em;line-height:0.7em;vertical-align:0.15em;">⁄</span><span style="font-size:0.6em;line-height:0.6em;vertical-align:-0.05em;">4</span></td>
      <td headers="0 to 1 stub_1_7 eighths" class="gt_row gt_right"><span style="font-size:0.6em;line-height:0.6em;vertical-align:0.45em;">4</span><span style="font-size:0.7em;line-height:0.7em;vertical-align:0.15em;">⁄</span><span style="font-size:0.6em;line-height:0.6em;vertical-align:-0.05em;">8</span></td>
      <td headers="0 to 1 stub_1_7 sixteenths" class="gt_row gt_right"><span style="font-size:0.6em;line-height:0.6em;vertical-align:0.45em;">8</span><span style="font-size:0.7em;line-height:0.7em;vertical-align:0.15em;">⁄</span><span style="font-size:0.6em;line-height:0.6em;vertical-align:-0.05em;">16</span></td>
      <td headers="0 to 1 stub_1_7 hundredths" class="gt_row gt_right"><span style="font-size:0.6em;line-height:0.6em;vertical-align:0.45em;">50</span><span style="font-size:0.7em;line-height:0.7em;vertical-align:0.15em;">⁄</span><span style="font-size:0.6em;line-height:0.6em;vertical-align:-0.05em;">100</span></td></tr>
          <tr><th id="stub_1_8" scope="row" class="gt_row gt_right gt_stub">0.6000</th>
      <td headers="0 to 1 stub_1_8 low" class="gt_row gt_right"><span style="font-size:0.6em;line-height:0.6em;vertical-align:0.45em;">3</span><span style="font-size:0.7em;line-height:0.7em;vertical-align:0.15em;">⁄</span><span style="font-size:0.6em;line-height:0.6em;vertical-align:-0.05em;">5</span></td>
      <td headers="0 to 1 stub_1_8 med" class="gt_row gt_right"><span style="font-size:0.6em;line-height:0.6em;vertical-align:0.45em;">3</span><span style="font-size:0.7em;line-height:0.7em;vertical-align:0.15em;">⁄</span><span style="font-size:0.6em;line-height:0.6em;vertical-align:-0.05em;">5</span></td>
      <td headers="0 to 1 stub_1_8 high" class="gt_row gt_right"><span style="font-size:0.6em;line-height:0.6em;vertical-align:0.45em;">3</span><span style="font-size:0.7em;line-height:0.7em;vertical-align:0.15em;">⁄</span><span style="font-size:0.6em;line-height:0.6em;vertical-align:-0.05em;">5</span></td>
      <td headers="0 to 1 stub_1_8 halves" class="gt_row gt_right"><span style="font-size:0.6em;line-height:0.6em;vertical-align:0.45em;">1</span><span style="font-size:0.7em;line-height:0.7em;vertical-align:0.15em;">⁄</span><span style="font-size:0.6em;line-height:0.6em;vertical-align:-0.05em;">2</span></td>
      <td headers="0 to 1 stub_1_8 quarters" class="gt_row gt_right"><span style="font-size:0.6em;line-height:0.6em;vertical-align:0.45em;">2</span><span style="font-size:0.7em;line-height:0.7em;vertical-align:0.15em;">⁄</span><span style="font-size:0.6em;line-height:0.6em;vertical-align:-0.05em;">4</span></td>
      <td headers="0 to 1 stub_1_8 eighths" class="gt_row gt_right"><span style="font-size:0.6em;line-height:0.6em;vertical-align:0.45em;">5</span><span style="font-size:0.7em;line-height:0.7em;vertical-align:0.15em;">⁄</span><span style="font-size:0.6em;line-height:0.6em;vertical-align:-0.05em;">8</span></td>
      <td headers="0 to 1 stub_1_8 sixteenths" class="gt_row gt_right"><span style="font-size:0.6em;line-height:0.6em;vertical-align:0.45em;">10</span><span style="font-size:0.7em;line-height:0.7em;vertical-align:0.15em;">⁄</span><span style="font-size:0.6em;line-height:0.6em;vertical-align:-0.05em;">16</span></td>
      <td headers="0 to 1 stub_1_8 hundredths" class="gt_row gt_right"><span style="font-size:0.6em;line-height:0.6em;vertical-align:0.45em;">60</span><span style="font-size:0.7em;line-height:0.7em;vertical-align:0.15em;">⁄</span><span style="font-size:0.6em;line-height:0.6em;vertical-align:-0.05em;">100</span></td></tr>
          <tr><th id="stub_1_9" scope="row" class="gt_row gt_right gt_stub">0.7500</th>
      <td headers="0 to 1 stub_1_9 low" class="gt_row gt_right"><span style="font-size:0.6em;line-height:0.6em;vertical-align:0.45em;">3</span><span style="font-size:0.7em;line-height:0.7em;vertical-align:0.15em;">⁄</span><span style="font-size:0.6em;line-height:0.6em;vertical-align:-0.05em;">4</span></td>
      <td headers="0 to 1 stub_1_9 med" class="gt_row gt_right"><span style="font-size:0.6em;line-height:0.6em;vertical-align:0.45em;">3</span><span style="font-size:0.7em;line-height:0.7em;vertical-align:0.15em;">⁄</span><span style="font-size:0.6em;line-height:0.6em;vertical-align:-0.05em;">4</span></td>
      <td headers="0 to 1 stub_1_9 high" class="gt_row gt_right"><span style="font-size:0.6em;line-height:0.6em;vertical-align:0.45em;">3</span><span style="font-size:0.7em;line-height:0.7em;vertical-align:0.15em;">⁄</span><span style="font-size:0.6em;line-height:0.6em;vertical-align:-0.05em;">4</span></td>
      <td headers="0 to 1 stub_1_9 halves" class="gt_row gt_right">1</td>
      <td headers="0 to 1 stub_1_9 quarters" class="gt_row gt_right"><span style="font-size:0.6em;line-height:0.6em;vertical-align:0.45em;">3</span><span style="font-size:0.7em;line-height:0.7em;vertical-align:0.15em;">⁄</span><span style="font-size:0.6em;line-height:0.6em;vertical-align:-0.05em;">4</span></td>
      <td headers="0 to 1 stub_1_9 eighths" class="gt_row gt_right"><span style="font-size:0.6em;line-height:0.6em;vertical-align:0.45em;">6</span><span style="font-size:0.7em;line-height:0.7em;vertical-align:0.15em;">⁄</span><span style="font-size:0.6em;line-height:0.6em;vertical-align:-0.05em;">8</span></td>
      <td headers="0 to 1 stub_1_9 sixteenths" class="gt_row gt_right"><span style="font-size:0.6em;line-height:0.6em;vertical-align:0.45em;">12</span><span style="font-size:0.7em;line-height:0.7em;vertical-align:0.15em;">⁄</span><span style="font-size:0.6em;line-height:0.6em;vertical-align:-0.05em;">16</span></td>
      <td headers="0 to 1 stub_1_9 hundredths" class="gt_row gt_right"><span style="font-size:0.6em;line-height:0.6em;vertical-align:0.45em;">75</span><span style="font-size:0.7em;line-height:0.7em;vertical-align:0.15em;">⁄</span><span style="font-size:0.6em;line-height:0.6em;vertical-align:-0.05em;">100</span></td></tr>
          <tr><th id="stub_1_10" scope="row" class="gt_row gt_right gt_stub">0.9000</th>
      <td headers="0 to 1 stub_1_10 low" class="gt_row gt_right"><span style="font-size:0.6em;line-height:0.6em;vertical-align:0.45em;">8</span><span style="font-size:0.7em;line-height:0.7em;vertical-align:0.15em;">⁄</span><span style="font-size:0.6em;line-height:0.6em;vertical-align:-0.05em;">9</span></td>
      <td headers="0 to 1 stub_1_10 med" class="gt_row gt_right"><span style="font-size:0.6em;line-height:0.6em;vertical-align:0.45em;">9</span><span style="font-size:0.7em;line-height:0.7em;vertical-align:0.15em;">⁄</span><span style="font-size:0.6em;line-height:0.6em;vertical-align:-0.05em;">10</span></td>
      <td headers="0 to 1 stub_1_10 high" class="gt_row gt_right"><span style="font-size:0.6em;line-height:0.6em;vertical-align:0.45em;">9</span><span style="font-size:0.7em;line-height:0.7em;vertical-align:0.15em;">⁄</span><span style="font-size:0.6em;line-height:0.6em;vertical-align:-0.05em;">10</span></td>
      <td headers="0 to 1 stub_1_10 halves" class="gt_row gt_right">1</td>
      <td headers="0 to 1 stub_1_10 quarters" class="gt_row gt_right">1</td>
      <td headers="0 to 1 stub_1_10 eighths" class="gt_row gt_right"><span style="font-size:0.6em;line-height:0.6em;vertical-align:0.45em;">7</span><span style="font-size:0.7em;line-height:0.7em;vertical-align:0.15em;">⁄</span><span style="font-size:0.6em;line-height:0.6em;vertical-align:-0.05em;">8</span></td>
      <td headers="0 to 1 stub_1_10 sixteenths" class="gt_row gt_right"><span style="font-size:0.6em;line-height:0.6em;vertical-align:0.45em;">14</span><span style="font-size:0.7em;line-height:0.7em;vertical-align:0.15em;">⁄</span><span style="font-size:0.6em;line-height:0.6em;vertical-align:-0.05em;">16</span></td>
      <td headers="0 to 1 stub_1_10 hundredths" class="gt_row gt_right"><span style="font-size:0.6em;line-height:0.6em;vertical-align:0.45em;">90</span><span style="font-size:0.7em;line-height:0.7em;vertical-align:0.15em;">⁄</span><span style="font-size:0.6em;line-height:0.6em;vertical-align:-0.05em;">100</span></td></tr>
          <tr><th id="stub_1_11" scope="row" class="gt_row gt_right gt_stub">0.9900</th>
      <td headers="0 to 1 stub_1_11 low" class="gt_row gt_right">1</td>
      <td headers="0 to 1 stub_1_11 med" class="gt_row gt_right"><span style="font-size:0.6em;line-height:0.6em;vertical-align:0.45em;">98</span><span style="font-size:0.7em;line-height:0.7em;vertical-align:0.15em;">⁄</span><span style="font-size:0.6em;line-height:0.6em;vertical-align:-0.05em;">99</span></td>
      <td headers="0 to 1 stub_1_11 high" class="gt_row gt_right"><span style="font-size:0.6em;line-height:0.6em;vertical-align:0.45em;">99</span><span style="font-size:0.7em;line-height:0.7em;vertical-align:0.15em;">⁄</span><span style="font-size:0.6em;line-height:0.6em;vertical-align:-0.05em;">100</span></td>
      <td headers="0 to 1 stub_1_11 halves" class="gt_row gt_right">1</td>
      <td headers="0 to 1 stub_1_11 quarters" class="gt_row gt_right">1</td>
      <td headers="0 to 1 stub_1_11 eighths" class="gt_row gt_right">1</td>
      <td headers="0 to 1 stub_1_11 sixteenths" class="gt_row gt_right">1</td>
      <td headers="0 to 1 stub_1_11 hundredths" class="gt_row gt_right"><span style="font-size:0.6em;line-height:0.6em;vertical-align:0.45em;">99</span><span style="font-size:0.7em;line-height:0.7em;vertical-align:0.15em;">⁄</span><span style="font-size:0.6em;line-height:0.6em;vertical-align:-0.05em;">100</span></td></tr>
          <tr><th id="stub_1_12" scope="row" class="gt_row gt_right gt_stub">0.9990</th>
      <td headers="0 to 1 stub_1_12 low" class="gt_row gt_right">1</td>
      <td headers="0 to 1 stub_1_12 med" class="gt_row gt_right">1</td>
      <td headers="0 to 1 stub_1_12 high" class="gt_row gt_right"><span style="font-size:0.6em;line-height:0.6em;vertical-align:0.45em;">998</span><span style="font-size:0.7em;line-height:0.7em;vertical-align:0.15em;">⁄</span><span style="font-size:0.6em;line-height:0.6em;vertical-align:-0.05em;">999</span></td>
      <td headers="0 to 1 stub_1_12 halves" class="gt_row gt_right">1</td>
      <td headers="0 to 1 stub_1_12 quarters" class="gt_row gt_right">1</td>
      <td headers="0 to 1 stub_1_12 eighths" class="gt_row gt_right">1</td>
      <td headers="0 to 1 stub_1_12 sixteenths" class="gt_row gt_right">1</td>
      <td headers="0 to 1 stub_1_12 hundredths" class="gt_row gt_right">1</td></tr>
          <tr><th id="stub_1_13" scope="row" class="gt_row gt_right gt_stub">0.9999</th>
      <td headers="0 to 1 stub_1_13 low" class="gt_row gt_right">1</td>
      <td headers="0 to 1 stub_1_13 med" class="gt_row gt_right">1</td>
      <td headers="0 to 1 stub_1_13 high" class="gt_row gt_right">1</td>
      <td headers="0 to 1 stub_1_13 halves" class="gt_row gt_right">1</td>
      <td headers="0 to 1 stub_1_13 quarters" class="gt_row gt_right">1</td>
      <td headers="0 to 1 stub_1_13 eighths" class="gt_row gt_right">1</td>
      <td headers="0 to 1 stub_1_13 sixteenths" class="gt_row gt_right">1</td>
      <td headers="0 to 1 stub_1_13 hundredths" class="gt_row gt_right">1</td></tr>
          <tr class="gt_group_heading_row">
            <th colspan="9" class="gt_group_heading" scope="colgroup" id="0 to -1">0 to -1</th>
          </tr>
          <tr class="gt_row_group_first"><th id="stub_1_14" scope="row" class="gt_row gt_right gt_stub">-0.0001</th>
      <td headers="0 to -1 stub_1_14 low" class="gt_row gt_right">0</td>
      <td headers="0 to -1 stub_1_14 med" class="gt_row gt_right">0</td>
      <td headers="0 to -1 stub_1_14 high" class="gt_row gt_right">0</td>
      <td headers="0 to -1 stub_1_14 halves" class="gt_row gt_right">0</td>
      <td headers="0 to -1 stub_1_14 quarters" class="gt_row gt_right">0</td>
      <td headers="0 to -1 stub_1_14 eighths" class="gt_row gt_right">0</td>
      <td headers="0 to -1 stub_1_14 sixteenths" class="gt_row gt_right">0</td>
      <td headers="0 to -1 stub_1_14 hundredths" class="gt_row gt_right">0</td></tr>
          <tr><th id="stub_1_15" scope="row" class="gt_row gt_right gt_stub">-0.0010</th>
      <td headers="0 to -1 stub_1_15 low" class="gt_row gt_right">0</td>
      <td headers="0 to -1 stub_1_15 med" class="gt_row gt_right">0</td>
      <td headers="0 to -1 stub_1_15 high" class="gt_row gt_right">−<span style="font-size:0.6em;line-height:0.6em;vertical-align:0.45em;">1</span><span style="font-size:0.7em;line-height:0.7em;vertical-align:0.15em;">⁄</span><span style="font-size:0.6em;line-height:0.6em;vertical-align:-0.05em;">999</span></td>
      <td headers="0 to -1 stub_1_15 halves" class="gt_row gt_right">0</td>
      <td headers="0 to -1 stub_1_15 quarters" class="gt_row gt_right">0</td>
      <td headers="0 to -1 stub_1_15 eighths" class="gt_row gt_right">0</td>
      <td headers="0 to -1 stub_1_15 sixteenths" class="gt_row gt_right">0</td>
      <td headers="0 to -1 stub_1_15 hundredths" class="gt_row gt_right">0</td></tr>
          <tr><th id="stub_1_16" scope="row" class="gt_row gt_right gt_stub">-0.0100</th>
      <td headers="0 to -1 stub_1_16 low" class="gt_row gt_right">0</td>
      <td headers="0 to -1 stub_1_16 med" class="gt_row gt_right">−<span style="font-size:0.6em;line-height:0.6em;vertical-align:0.45em;">1</span><span style="font-size:0.7em;line-height:0.7em;vertical-align:0.15em;">⁄</span><span style="font-size:0.6em;line-height:0.6em;vertical-align:-0.05em;">99</span></td>
      <td headers="0 to -1 stub_1_16 high" class="gt_row gt_right">−<span style="font-size:0.6em;line-height:0.6em;vertical-align:0.45em;">1</span><span style="font-size:0.7em;line-height:0.7em;vertical-align:0.15em;">⁄</span><span style="font-size:0.6em;line-height:0.6em;vertical-align:-0.05em;">100</span></td>
      <td headers="0 to -1 stub_1_16 halves" class="gt_row gt_right">0</td>
      <td headers="0 to -1 stub_1_16 quarters" class="gt_row gt_right">0</td>
      <td headers="0 to -1 stub_1_16 eighths" class="gt_row gt_right">0</td>
      <td headers="0 to -1 stub_1_16 sixteenths" class="gt_row gt_right">0</td>
      <td headers="0 to -1 stub_1_16 hundredths" class="gt_row gt_right">−<span style="font-size:0.6em;line-height:0.6em;vertical-align:0.45em;">1</span><span style="font-size:0.7em;line-height:0.7em;vertical-align:0.15em;">⁄</span><span style="font-size:0.6em;line-height:0.6em;vertical-align:-0.05em;">100</span></td></tr>
          <tr><th id="stub_1_17" scope="row" class="gt_row gt_right gt_stub">-0.1000</th>
      <td headers="0 to -1 stub_1_17 low" class="gt_row gt_right">−<span style="font-size:0.6em;line-height:0.6em;vertical-align:0.45em;">1</span><span style="font-size:0.7em;line-height:0.7em;vertical-align:0.15em;">⁄</span><span style="font-size:0.6em;line-height:0.6em;vertical-align:-0.05em;">9</span></td>
      <td headers="0 to -1 stub_1_17 med" class="gt_row gt_right">−<span style="font-size:0.6em;line-height:0.6em;vertical-align:0.45em;">1</span><span style="font-size:0.7em;line-height:0.7em;vertical-align:0.15em;">⁄</span><span style="font-size:0.6em;line-height:0.6em;vertical-align:-0.05em;">10</span></td>
      <td headers="0 to -1 stub_1_17 high" class="gt_row gt_right">−<span style="font-size:0.6em;line-height:0.6em;vertical-align:0.45em;">1</span><span style="font-size:0.7em;line-height:0.7em;vertical-align:0.15em;">⁄</span><span style="font-size:0.6em;line-height:0.6em;vertical-align:-0.05em;">10</span></td>
      <td headers="0 to -1 stub_1_17 halves" class="gt_row gt_right">0</td>
      <td headers="0 to -1 stub_1_17 quarters" class="gt_row gt_right">0</td>
      <td headers="0 to -1 stub_1_17 eighths" class="gt_row gt_right">−<span style="font-size:0.6em;line-height:0.6em;vertical-align:0.45em;">1</span><span style="font-size:0.7em;line-height:0.7em;vertical-align:0.15em;">⁄</span><span style="font-size:0.6em;line-height:0.6em;vertical-align:-0.05em;">8</span></td>
      <td headers="0 to -1 stub_1_17 sixteenths" class="gt_row gt_right">−<span style="font-size:0.6em;line-height:0.6em;vertical-align:0.45em;">2</span><span style="font-size:0.7em;line-height:0.7em;vertical-align:0.15em;">⁄</span><span style="font-size:0.6em;line-height:0.6em;vertical-align:-0.05em;">16</span></td>
      <td headers="0 to -1 stub_1_17 hundredths" class="gt_row gt_right">−<span style="font-size:0.6em;line-height:0.6em;vertical-align:0.45em;">10</span><span style="font-size:0.7em;line-height:0.7em;vertical-align:0.15em;">⁄</span><span style="font-size:0.6em;line-height:0.6em;vertical-align:-0.05em;">100</span></td></tr>
          <tr><th id="stub_1_18" scope="row" class="gt_row gt_right gt_stub">-0.2500</th>
      <td headers="0 to -1 stub_1_18 low" class="gt_row gt_right">−<span style="font-size:0.6em;line-height:0.6em;vertical-align:0.45em;">1</span><span style="font-size:0.7em;line-height:0.7em;vertical-align:0.15em;">⁄</span><span style="font-size:0.6em;line-height:0.6em;vertical-align:-0.05em;">4</span></td>
      <td headers="0 to -1 stub_1_18 med" class="gt_row gt_right">−<span style="font-size:0.6em;line-height:0.6em;vertical-align:0.45em;">1</span><span style="font-size:0.7em;line-height:0.7em;vertical-align:0.15em;">⁄</span><span style="font-size:0.6em;line-height:0.6em;vertical-align:-0.05em;">4</span></td>
      <td headers="0 to -1 stub_1_18 high" class="gt_row gt_right">−<span style="font-size:0.6em;line-height:0.6em;vertical-align:0.45em;">1</span><span style="font-size:0.7em;line-height:0.7em;vertical-align:0.15em;">⁄</span><span style="font-size:0.6em;line-height:0.6em;vertical-align:-0.05em;">4</span></td>
      <td headers="0 to -1 stub_1_18 halves" class="gt_row gt_right">−<span style="font-size:0.6em;line-height:0.6em;vertical-align:0.45em;">1</span><span style="font-size:0.7em;line-height:0.7em;vertical-align:0.15em;">⁄</span><span style="font-size:0.6em;line-height:0.6em;vertical-align:-0.05em;">2</span></td>
      <td headers="0 to -1 stub_1_18 quarters" class="gt_row gt_right">−<span style="font-size:0.6em;line-height:0.6em;vertical-align:0.45em;">1</span><span style="font-size:0.7em;line-height:0.7em;vertical-align:0.15em;">⁄</span><span style="font-size:0.6em;line-height:0.6em;vertical-align:-0.05em;">4</span></td>
      <td headers="0 to -1 stub_1_18 eighths" class="gt_row gt_right">−<span style="font-size:0.6em;line-height:0.6em;vertical-align:0.45em;">2</span><span style="font-size:0.7em;line-height:0.7em;vertical-align:0.15em;">⁄</span><span style="font-size:0.6em;line-height:0.6em;vertical-align:-0.05em;">8</span></td>
      <td headers="0 to -1 stub_1_18 sixteenths" class="gt_row gt_right">−<span style="font-size:0.6em;line-height:0.6em;vertical-align:0.45em;">4</span><span style="font-size:0.7em;line-height:0.7em;vertical-align:0.15em;">⁄</span><span style="font-size:0.6em;line-height:0.6em;vertical-align:-0.05em;">16</span></td>
      <td headers="0 to -1 stub_1_18 hundredths" class="gt_row gt_right">−<span style="font-size:0.6em;line-height:0.6em;vertical-align:0.45em;">25</span><span style="font-size:0.7em;line-height:0.7em;vertical-align:0.15em;">⁄</span><span style="font-size:0.6em;line-height:0.6em;vertical-align:-0.05em;">100</span></td></tr>
          <tr><th id="stub_1_19" scope="row" class="gt_row gt_right gt_stub">-0.4000</th>
      <td headers="0 to -1 stub_1_19 low" class="gt_row gt_right">−<span style="font-size:0.6em;line-height:0.6em;vertical-align:0.45em;">2</span><span style="font-size:0.7em;line-height:0.7em;vertical-align:0.15em;">⁄</span><span style="font-size:0.6em;line-height:0.6em;vertical-align:-0.05em;">5</span></td>
      <td headers="0 to -1 stub_1_19 med" class="gt_row gt_right">−<span style="font-size:0.6em;line-height:0.6em;vertical-align:0.45em;">2</span><span style="font-size:0.7em;line-height:0.7em;vertical-align:0.15em;">⁄</span><span style="font-size:0.6em;line-height:0.6em;vertical-align:-0.05em;">5</span></td>
      <td headers="0 to -1 stub_1_19 high" class="gt_row gt_right">−<span style="font-size:0.6em;line-height:0.6em;vertical-align:0.45em;">2</span><span style="font-size:0.7em;line-height:0.7em;vertical-align:0.15em;">⁄</span><span style="font-size:0.6em;line-height:0.6em;vertical-align:-0.05em;">5</span></td>
      <td headers="0 to -1 stub_1_19 halves" class="gt_row gt_right">−<span style="font-size:0.6em;line-height:0.6em;vertical-align:0.45em;">1</span><span style="font-size:0.7em;line-height:0.7em;vertical-align:0.15em;">⁄</span><span style="font-size:0.6em;line-height:0.6em;vertical-align:-0.05em;">2</span></td>
      <td headers="0 to -1 stub_1_19 quarters" class="gt_row gt_right">−<span style="font-size:0.6em;line-height:0.6em;vertical-align:0.45em;">2</span><span style="font-size:0.7em;line-height:0.7em;vertical-align:0.15em;">⁄</span><span style="font-size:0.6em;line-height:0.6em;vertical-align:-0.05em;">4</span></td>
      <td headers="0 to -1 stub_1_19 eighths" class="gt_row gt_right">−<span style="font-size:0.6em;line-height:0.6em;vertical-align:0.45em;">3</span><span style="font-size:0.7em;line-height:0.7em;vertical-align:0.15em;">⁄</span><span style="font-size:0.6em;line-height:0.6em;vertical-align:-0.05em;">8</span></td>
      <td headers="0 to -1 stub_1_19 sixteenths" class="gt_row gt_right">−<span style="font-size:0.6em;line-height:0.6em;vertical-align:0.45em;">6</span><span style="font-size:0.7em;line-height:0.7em;vertical-align:0.15em;">⁄</span><span style="font-size:0.6em;line-height:0.6em;vertical-align:-0.05em;">16</span></td>
      <td headers="0 to -1 stub_1_19 hundredths" class="gt_row gt_right">−<span style="font-size:0.6em;line-height:0.6em;vertical-align:0.45em;">40</span><span style="font-size:0.7em;line-height:0.7em;vertical-align:0.15em;">⁄</span><span style="font-size:0.6em;line-height:0.6em;vertical-align:-0.05em;">100</span></td></tr>
          <tr><th id="stub_1_20" scope="row" class="gt_row gt_right gt_stub">-0.5000</th>
      <td headers="0 to -1 stub_1_20 low" class="gt_row gt_right">−<span style="font-size:0.6em;line-height:0.6em;vertical-align:0.45em;">1</span><span style="font-size:0.7em;line-height:0.7em;vertical-align:0.15em;">⁄</span><span style="font-size:0.6em;line-height:0.6em;vertical-align:-0.05em;">2</span></td>
      <td headers="0 to -1 stub_1_20 med" class="gt_row gt_right">−<span style="font-size:0.6em;line-height:0.6em;vertical-align:0.45em;">1</span><span style="font-size:0.7em;line-height:0.7em;vertical-align:0.15em;">⁄</span><span style="font-size:0.6em;line-height:0.6em;vertical-align:-0.05em;">2</span></td>
      <td headers="0 to -1 stub_1_20 high" class="gt_row gt_right">−<span style="font-size:0.6em;line-height:0.6em;vertical-align:0.45em;">1</span><span style="font-size:0.7em;line-height:0.7em;vertical-align:0.15em;">⁄</span><span style="font-size:0.6em;line-height:0.6em;vertical-align:-0.05em;">2</span></td>
      <td headers="0 to -1 stub_1_20 halves" class="gt_row gt_right">−<span style="font-size:0.6em;line-height:0.6em;vertical-align:0.45em;">1</span><span style="font-size:0.7em;line-height:0.7em;vertical-align:0.15em;">⁄</span><span style="font-size:0.6em;line-height:0.6em;vertical-align:-0.05em;">2</span></td>
      <td headers="0 to -1 stub_1_20 quarters" class="gt_row gt_right">−<span style="font-size:0.6em;line-height:0.6em;vertical-align:0.45em;">2</span><span style="font-size:0.7em;line-height:0.7em;vertical-align:0.15em;">⁄</span><span style="font-size:0.6em;line-height:0.6em;vertical-align:-0.05em;">4</span></td>
      <td headers="0 to -1 stub_1_20 eighths" class="gt_row gt_right">−<span style="font-size:0.6em;line-height:0.6em;vertical-align:0.45em;">4</span><span style="font-size:0.7em;line-height:0.7em;vertical-align:0.15em;">⁄</span><span style="font-size:0.6em;line-height:0.6em;vertical-align:-0.05em;">8</span></td>
      <td headers="0 to -1 stub_1_20 sixteenths" class="gt_row gt_right">−<span style="font-size:0.6em;line-height:0.6em;vertical-align:0.45em;">8</span><span style="font-size:0.7em;line-height:0.7em;vertical-align:0.15em;">⁄</span><span style="font-size:0.6em;line-height:0.6em;vertical-align:-0.05em;">16</span></td>
      <td headers="0 to -1 stub_1_20 hundredths" class="gt_row gt_right">−<span style="font-size:0.6em;line-height:0.6em;vertical-align:0.45em;">50</span><span style="font-size:0.7em;line-height:0.7em;vertical-align:0.15em;">⁄</span><span style="font-size:0.6em;line-height:0.6em;vertical-align:-0.05em;">100</span></td></tr>
          <tr><th id="stub_1_21" scope="row" class="gt_row gt_right gt_stub">-0.6000</th>
      <td headers="0 to -1 stub_1_21 low" class="gt_row gt_right">−<span style="font-size:0.6em;line-height:0.6em;vertical-align:0.45em;">3</span><span style="font-size:0.7em;line-height:0.7em;vertical-align:0.15em;">⁄</span><span style="font-size:0.6em;line-height:0.6em;vertical-align:-0.05em;">5</span></td>
      <td headers="0 to -1 stub_1_21 med" class="gt_row gt_right">−<span style="font-size:0.6em;line-height:0.6em;vertical-align:0.45em;">3</span><span style="font-size:0.7em;line-height:0.7em;vertical-align:0.15em;">⁄</span><span style="font-size:0.6em;line-height:0.6em;vertical-align:-0.05em;">5</span></td>
      <td headers="0 to -1 stub_1_21 high" class="gt_row gt_right">−<span style="font-size:0.6em;line-height:0.6em;vertical-align:0.45em;">3</span><span style="font-size:0.7em;line-height:0.7em;vertical-align:0.15em;">⁄</span><span style="font-size:0.6em;line-height:0.6em;vertical-align:-0.05em;">5</span></td>
      <td headers="0 to -1 stub_1_21 halves" class="gt_row gt_right">−<span style="font-size:0.6em;line-height:0.6em;vertical-align:0.45em;">1</span><span style="font-size:0.7em;line-height:0.7em;vertical-align:0.15em;">⁄</span><span style="font-size:0.6em;line-height:0.6em;vertical-align:-0.05em;">2</span></td>
      <td headers="0 to -1 stub_1_21 quarters" class="gt_row gt_right">−<span style="font-size:0.6em;line-height:0.6em;vertical-align:0.45em;">2</span><span style="font-size:0.7em;line-height:0.7em;vertical-align:0.15em;">⁄</span><span style="font-size:0.6em;line-height:0.6em;vertical-align:-0.05em;">4</span></td>
      <td headers="0 to -1 stub_1_21 eighths" class="gt_row gt_right">−<span style="font-size:0.6em;line-height:0.6em;vertical-align:0.45em;">5</span><span style="font-size:0.7em;line-height:0.7em;vertical-align:0.15em;">⁄</span><span style="font-size:0.6em;line-height:0.6em;vertical-align:-0.05em;">8</span></td>
      <td headers="0 to -1 stub_1_21 sixteenths" class="gt_row gt_right">−<span style="font-size:0.6em;line-height:0.6em;vertical-align:0.45em;">10</span><span style="font-size:0.7em;line-height:0.7em;vertical-align:0.15em;">⁄</span><span style="font-size:0.6em;line-height:0.6em;vertical-align:-0.05em;">16</span></td>
      <td headers="0 to -1 stub_1_21 hundredths" class="gt_row gt_right">−<span style="font-size:0.6em;line-height:0.6em;vertical-align:0.45em;">60</span><span style="font-size:0.7em;line-height:0.7em;vertical-align:0.15em;">⁄</span><span style="font-size:0.6em;line-height:0.6em;vertical-align:-0.05em;">100</span></td></tr>
          <tr><th id="stub_1_22" scope="row" class="gt_row gt_right gt_stub">-0.7500</th>
      <td headers="0 to -1 stub_1_22 low" class="gt_row gt_right">−<span style="font-size:0.6em;line-height:0.6em;vertical-align:0.45em;">3</span><span style="font-size:0.7em;line-height:0.7em;vertical-align:0.15em;">⁄</span><span style="font-size:0.6em;line-height:0.6em;vertical-align:-0.05em;">4</span></td>
      <td headers="0 to -1 stub_1_22 med" class="gt_row gt_right">−<span style="font-size:0.6em;line-height:0.6em;vertical-align:0.45em;">3</span><span style="font-size:0.7em;line-height:0.7em;vertical-align:0.15em;">⁄</span><span style="font-size:0.6em;line-height:0.6em;vertical-align:-0.05em;">4</span></td>
      <td headers="0 to -1 stub_1_22 high" class="gt_row gt_right">−<span style="font-size:0.6em;line-height:0.6em;vertical-align:0.45em;">3</span><span style="font-size:0.7em;line-height:0.7em;vertical-align:0.15em;">⁄</span><span style="font-size:0.6em;line-height:0.6em;vertical-align:-0.05em;">4</span></td>
      <td headers="0 to -1 stub_1_22 halves" class="gt_row gt_right">−1</td>
      <td headers="0 to -1 stub_1_22 quarters" class="gt_row gt_right">−<span style="font-size:0.6em;line-height:0.6em;vertical-align:0.45em;">3</span><span style="font-size:0.7em;line-height:0.7em;vertical-align:0.15em;">⁄</span><span style="font-size:0.6em;line-height:0.6em;vertical-align:-0.05em;">4</span></td>
      <td headers="0 to -1 stub_1_22 eighths" class="gt_row gt_right">−<span style="font-size:0.6em;line-height:0.6em;vertical-align:0.45em;">6</span><span style="font-size:0.7em;line-height:0.7em;vertical-align:0.15em;">⁄</span><span style="font-size:0.6em;line-height:0.6em;vertical-align:-0.05em;">8</span></td>
      <td headers="0 to -1 stub_1_22 sixteenths" class="gt_row gt_right">−<span style="font-size:0.6em;line-height:0.6em;vertical-align:0.45em;">12</span><span style="font-size:0.7em;line-height:0.7em;vertical-align:0.15em;">⁄</span><span style="font-size:0.6em;line-height:0.6em;vertical-align:-0.05em;">16</span></td>
      <td headers="0 to -1 stub_1_22 hundredths" class="gt_row gt_right">−<span style="font-size:0.6em;line-height:0.6em;vertical-align:0.45em;">75</span><span style="font-size:0.7em;line-height:0.7em;vertical-align:0.15em;">⁄</span><span style="font-size:0.6em;line-height:0.6em;vertical-align:-0.05em;">100</span></td></tr>
          <tr><th id="stub_1_23" scope="row" class="gt_row gt_right gt_stub">-0.9000</th>
      <td headers="0 to -1 stub_1_23 low" class="gt_row gt_right">−<span style="font-size:0.6em;line-height:0.6em;vertical-align:0.45em;">8</span><span style="font-size:0.7em;line-height:0.7em;vertical-align:0.15em;">⁄</span><span style="font-size:0.6em;line-height:0.6em;vertical-align:-0.05em;">9</span></td>
      <td headers="0 to -1 stub_1_23 med" class="gt_row gt_right">−<span style="font-size:0.6em;line-height:0.6em;vertical-align:0.45em;">9</span><span style="font-size:0.7em;line-height:0.7em;vertical-align:0.15em;">⁄</span><span style="font-size:0.6em;line-height:0.6em;vertical-align:-0.05em;">10</span></td>
      <td headers="0 to -1 stub_1_23 high" class="gt_row gt_right">−<span style="font-size:0.6em;line-height:0.6em;vertical-align:0.45em;">9</span><span style="font-size:0.7em;line-height:0.7em;vertical-align:0.15em;">⁄</span><span style="font-size:0.6em;line-height:0.6em;vertical-align:-0.05em;">10</span></td>
      <td headers="0 to -1 stub_1_23 halves" class="gt_row gt_right">−1</td>
      <td headers="0 to -1 stub_1_23 quarters" class="gt_row gt_right">−1</td>
      <td headers="0 to -1 stub_1_23 eighths" class="gt_row gt_right">−<span style="font-size:0.6em;line-height:0.6em;vertical-align:0.45em;">7</span><span style="font-size:0.7em;line-height:0.7em;vertical-align:0.15em;">⁄</span><span style="font-size:0.6em;line-height:0.6em;vertical-align:-0.05em;">8</span></td>
      <td headers="0 to -1 stub_1_23 sixteenths" class="gt_row gt_right">−<span style="font-size:0.6em;line-height:0.6em;vertical-align:0.45em;">14</span><span style="font-size:0.7em;line-height:0.7em;vertical-align:0.15em;">⁄</span><span style="font-size:0.6em;line-height:0.6em;vertical-align:-0.05em;">16</span></td>
      <td headers="0 to -1 stub_1_23 hundredths" class="gt_row gt_right">−<span style="font-size:0.6em;line-height:0.6em;vertical-align:0.45em;">90</span><span style="font-size:0.7em;line-height:0.7em;vertical-align:0.15em;">⁄</span><span style="font-size:0.6em;line-height:0.6em;vertical-align:-0.05em;">100</span></td></tr>
          <tr><th id="stub_1_24" scope="row" class="gt_row gt_right gt_stub">-0.9900</th>
      <td headers="0 to -1 stub_1_24 low" class="gt_row gt_right">−1</td>
      <td headers="0 to -1 stub_1_24 med" class="gt_row gt_right">−<span style="font-size:0.6em;line-height:0.6em;vertical-align:0.45em;">98</span><span style="font-size:0.7em;line-height:0.7em;vertical-align:0.15em;">⁄</span><span style="font-size:0.6em;line-height:0.6em;vertical-align:-0.05em;">99</span></td>
      <td headers="0 to -1 stub_1_24 high" class="gt_row gt_right">−<span style="font-size:0.6em;line-height:0.6em;vertical-align:0.45em;">99</span><span style="font-size:0.7em;line-height:0.7em;vertical-align:0.15em;">⁄</span><span style="font-size:0.6em;line-height:0.6em;vertical-align:-0.05em;">100</span></td>
      <td headers="0 to -1 stub_1_24 halves" class="gt_row gt_right">−1</td>
      <td headers="0 to -1 stub_1_24 quarters" class="gt_row gt_right">−1</td>
      <td headers="0 to -1 stub_1_24 eighths" class="gt_row gt_right">−1</td>
      <td headers="0 to -1 stub_1_24 sixteenths" class="gt_row gt_right">−1</td>
      <td headers="0 to -1 stub_1_24 hundredths" class="gt_row gt_right">−<span style="font-size:0.6em;line-height:0.6em;vertical-align:0.45em;">99</span><span style="font-size:0.7em;line-height:0.7em;vertical-align:0.15em;">⁄</span><span style="font-size:0.6em;line-height:0.6em;vertical-align:-0.05em;">100</span></td></tr>
          <tr><th id="stub_1_25" scope="row" class="gt_row gt_right gt_stub">-0.9990</th>
      <td headers="0 to -1 stub_1_25 low" class="gt_row gt_right">−1</td>
      <td headers="0 to -1 stub_1_25 med" class="gt_row gt_right">−1</td>
      <td headers="0 to -1 stub_1_25 high" class="gt_row gt_right">−<span style="font-size:0.6em;line-height:0.6em;vertical-align:0.45em;">998</span><span style="font-size:0.7em;line-height:0.7em;vertical-align:0.15em;">⁄</span><span style="font-size:0.6em;line-height:0.6em;vertical-align:-0.05em;">999</span></td>
      <td headers="0 to -1 stub_1_25 halves" class="gt_row gt_right">−1</td>
      <td headers="0 to -1 stub_1_25 quarters" class="gt_row gt_right">−1</td>
      <td headers="0 to -1 stub_1_25 eighths" class="gt_row gt_right">−1</td>
      <td headers="0 to -1 stub_1_25 sixteenths" class="gt_row gt_right">−1</td>
      <td headers="0 to -1 stub_1_25 hundredths" class="gt_row gt_right">−1</td></tr>
          <tr><th id="stub_1_26" scope="row" class="gt_row gt_right gt_stub">-0.9999</th>
      <td headers="0 to -1 stub_1_26 low" class="gt_row gt_right">−1</td>
      <td headers="0 to -1 stub_1_26 med" class="gt_row gt_right">−1</td>
      <td headers="0 to -1 stub_1_26 high" class="gt_row gt_right">−1</td>
      <td headers="0 to -1 stub_1_26 halves" class="gt_row gt_right">−1</td>
      <td headers="0 to -1 stub_1_26 quarters" class="gt_row gt_right">−1</td>
      <td headers="0 to -1 stub_1_26 eighths" class="gt_row gt_right">−1</td>
      <td headers="0 to -1 stub_1_26 sixteenths" class="gt_row gt_right">−1</td>
      <td headers="0 to -1 stub_1_26 hundredths" class="gt_row gt_right">−1</td></tr>
          <tr class="gt_group_heading_row">
            <th colspan="9" class="gt_group_heading" scope="colgroup" id="1 to 2">1 to 2</th>
          </tr>
          <tr class="gt_row_group_first"><th id="stub_1_27" scope="row" class="gt_row gt_right gt_stub">1.0001</th>
      <td headers="1 to 2 stub_1_27 low" class="gt_row gt_right">1</td>
      <td headers="1 to 2 stub_1_27 med" class="gt_row gt_right">1</td>
      <td headers="1 to 2 stub_1_27 high" class="gt_row gt_right">1</td>
      <td headers="1 to 2 stub_1_27 halves" class="gt_row gt_right">1</td>
      <td headers="1 to 2 stub_1_27 quarters" class="gt_row gt_right">1</td>
      <td headers="1 to 2 stub_1_27 eighths" class="gt_row gt_right">1</td>
      <td headers="1 to 2 stub_1_27 sixteenths" class="gt_row gt_right">1</td>
      <td headers="1 to 2 stub_1_27 hundredths" class="gt_row gt_right">1</td></tr>
          <tr><th id="stub_1_28" scope="row" class="gt_row gt_right gt_stub">1.0010</th>
      <td headers="1 to 2 stub_1_28 low" class="gt_row gt_right">1</td>
      <td headers="1 to 2 stub_1_28 med" class="gt_row gt_right">1</td>
      <td headers="1 to 2 stub_1_28 high" class="gt_row gt_right">1 <span style="font-size:0.6em;line-height:0.6em;vertical-align:0.45em;">1</span><span style="font-size:0.7em;line-height:0.7em;vertical-align:0.15em;">⁄</span><span style="font-size:0.6em;line-height:0.6em;vertical-align:-0.05em;">999</span></td>
      <td headers="1 to 2 stub_1_28 halves" class="gt_row gt_right">1</td>
      <td headers="1 to 2 stub_1_28 quarters" class="gt_row gt_right">1</td>
      <td headers="1 to 2 stub_1_28 eighths" class="gt_row gt_right">1</td>
      <td headers="1 to 2 stub_1_28 sixteenths" class="gt_row gt_right">1</td>
      <td headers="1 to 2 stub_1_28 hundredths" class="gt_row gt_right">1</td></tr>
          <tr><th id="stub_1_29" scope="row" class="gt_row gt_right gt_stub">1.0100</th>
      <td headers="1 to 2 stub_1_29 low" class="gt_row gt_right">1</td>
      <td headers="1 to 2 stub_1_29 med" class="gt_row gt_right">1 <span style="font-size:0.6em;line-height:0.6em;vertical-align:0.45em;">1</span><span style="font-size:0.7em;line-height:0.7em;vertical-align:0.15em;">⁄</span><span style="font-size:0.6em;line-height:0.6em;vertical-align:-0.05em;">99</span></td>
      <td headers="1 to 2 stub_1_29 high" class="gt_row gt_right">1 <span style="font-size:0.6em;line-height:0.6em;vertical-align:0.45em;">1</span><span style="font-size:0.7em;line-height:0.7em;vertical-align:0.15em;">⁄</span><span style="font-size:0.6em;line-height:0.6em;vertical-align:-0.05em;">100</span></td>
      <td headers="1 to 2 stub_1_29 halves" class="gt_row gt_right">1</td>
      <td headers="1 to 2 stub_1_29 quarters" class="gt_row gt_right">1</td>
      <td headers="1 to 2 stub_1_29 eighths" class="gt_row gt_right">1</td>
      <td headers="1 to 2 stub_1_29 sixteenths" class="gt_row gt_right">1</td>
      <td headers="1 to 2 stub_1_29 hundredths" class="gt_row gt_right">1 <span style="font-size:0.6em;line-height:0.6em;vertical-align:0.45em;">1</span><span style="font-size:0.7em;line-height:0.7em;vertical-align:0.15em;">⁄</span><span style="font-size:0.6em;line-height:0.6em;vertical-align:-0.05em;">100</span></td></tr>
          <tr><th id="stub_1_30" scope="row" class="gt_row gt_right gt_stub">1.1000</th>
      <td headers="1 to 2 stub_1_30 low" class="gt_row gt_right">1 <span style="font-size:0.6em;line-height:0.6em;vertical-align:0.45em;">1</span><span style="font-size:0.7em;line-height:0.7em;vertical-align:0.15em;">⁄</span><span style="font-size:0.6em;line-height:0.6em;vertical-align:-0.05em;">9</span></td>
      <td headers="1 to 2 stub_1_30 med" class="gt_row gt_right">1 <span style="font-size:0.6em;line-height:0.6em;vertical-align:0.45em;">1</span><span style="font-size:0.7em;line-height:0.7em;vertical-align:0.15em;">⁄</span><span style="font-size:0.6em;line-height:0.6em;vertical-align:-0.05em;">10</span></td>
      <td headers="1 to 2 stub_1_30 high" class="gt_row gt_right">1 <span style="font-size:0.6em;line-height:0.6em;vertical-align:0.45em;">1</span><span style="font-size:0.7em;line-height:0.7em;vertical-align:0.15em;">⁄</span><span style="font-size:0.6em;line-height:0.6em;vertical-align:-0.05em;">10</span></td>
      <td headers="1 to 2 stub_1_30 halves" class="gt_row gt_right">1</td>
      <td headers="1 to 2 stub_1_30 quarters" class="gt_row gt_right">1</td>
      <td headers="1 to 2 stub_1_30 eighths" class="gt_row gt_right">1 <span style="font-size:0.6em;line-height:0.6em;vertical-align:0.45em;">1</span><span style="font-size:0.7em;line-height:0.7em;vertical-align:0.15em;">⁄</span><span style="font-size:0.6em;line-height:0.6em;vertical-align:-0.05em;">8</span></td>
      <td headers="1 to 2 stub_1_30 sixteenths" class="gt_row gt_right">1 <span style="font-size:0.6em;line-height:0.6em;vertical-align:0.45em;">2</span><span style="font-size:0.7em;line-height:0.7em;vertical-align:0.15em;">⁄</span><span style="font-size:0.6em;line-height:0.6em;vertical-align:-0.05em;">16</span></td>
      <td headers="1 to 2 stub_1_30 hundredths" class="gt_row gt_right">1 <span style="font-size:0.6em;line-height:0.6em;vertical-align:0.45em;">10</span><span style="font-size:0.7em;line-height:0.7em;vertical-align:0.15em;">⁄</span><span style="font-size:0.6em;line-height:0.6em;vertical-align:-0.05em;">100</span></td></tr>
          <tr><th id="stub_1_31" scope="row" class="gt_row gt_right gt_stub">1.2500</th>
      <td headers="1 to 2 stub_1_31 low" class="gt_row gt_right">1 <span style="font-size:0.6em;line-height:0.6em;vertical-align:0.45em;">1</span><span style="font-size:0.7em;line-height:0.7em;vertical-align:0.15em;">⁄</span><span style="font-size:0.6em;line-height:0.6em;vertical-align:-0.05em;">4</span></td>
      <td headers="1 to 2 stub_1_31 med" class="gt_row gt_right">1 <span style="font-size:0.6em;line-height:0.6em;vertical-align:0.45em;">1</span><span style="font-size:0.7em;line-height:0.7em;vertical-align:0.15em;">⁄</span><span style="font-size:0.6em;line-height:0.6em;vertical-align:-0.05em;">4</span></td>
      <td headers="1 to 2 stub_1_31 high" class="gt_row gt_right">1 <span style="font-size:0.6em;line-height:0.6em;vertical-align:0.45em;">1</span><span style="font-size:0.7em;line-height:0.7em;vertical-align:0.15em;">⁄</span><span style="font-size:0.6em;line-height:0.6em;vertical-align:-0.05em;">4</span></td>
      <td headers="1 to 2 stub_1_31 halves" class="gt_row gt_right">1 <span style="font-size:0.6em;line-height:0.6em;vertical-align:0.45em;">1</span><span style="font-size:0.7em;line-height:0.7em;vertical-align:0.15em;">⁄</span><span style="font-size:0.6em;line-height:0.6em;vertical-align:-0.05em;">2</span></td>
      <td headers="1 to 2 stub_1_31 quarters" class="gt_row gt_right">1 <span style="font-size:0.6em;line-height:0.6em;vertical-align:0.45em;">1</span><span style="font-size:0.7em;line-height:0.7em;vertical-align:0.15em;">⁄</span><span style="font-size:0.6em;line-height:0.6em;vertical-align:-0.05em;">4</span></td>
      <td headers="1 to 2 stub_1_31 eighths" class="gt_row gt_right">1 <span style="font-size:0.6em;line-height:0.6em;vertical-align:0.45em;">2</span><span style="font-size:0.7em;line-height:0.7em;vertical-align:0.15em;">⁄</span><span style="font-size:0.6em;line-height:0.6em;vertical-align:-0.05em;">8</span></td>
      <td headers="1 to 2 stub_1_31 sixteenths" class="gt_row gt_right">1 <span style="font-size:0.6em;line-height:0.6em;vertical-align:0.45em;">4</span><span style="font-size:0.7em;line-height:0.7em;vertical-align:0.15em;">⁄</span><span style="font-size:0.6em;line-height:0.6em;vertical-align:-0.05em;">16</span></td>
      <td headers="1 to 2 stub_1_31 hundredths" class="gt_row gt_right">1 <span style="font-size:0.6em;line-height:0.6em;vertical-align:0.45em;">25</span><span style="font-size:0.7em;line-height:0.7em;vertical-align:0.15em;">⁄</span><span style="font-size:0.6em;line-height:0.6em;vertical-align:-0.05em;">100</span></td></tr>
          <tr><th id="stub_1_32" scope="row" class="gt_row gt_right gt_stub">1.4000</th>
      <td headers="1 to 2 stub_1_32 low" class="gt_row gt_right">1 <span style="font-size:0.6em;line-height:0.6em;vertical-align:0.45em;">2</span><span style="font-size:0.7em;line-height:0.7em;vertical-align:0.15em;">⁄</span><span style="font-size:0.6em;line-height:0.6em;vertical-align:-0.05em;">5</span></td>
      <td headers="1 to 2 stub_1_32 med" class="gt_row gt_right">1 <span style="font-size:0.6em;line-height:0.6em;vertical-align:0.45em;">2</span><span style="font-size:0.7em;line-height:0.7em;vertical-align:0.15em;">⁄</span><span style="font-size:0.6em;line-height:0.6em;vertical-align:-0.05em;">5</span></td>
      <td headers="1 to 2 stub_1_32 high" class="gt_row gt_right">1 <span style="font-size:0.6em;line-height:0.6em;vertical-align:0.45em;">2</span><span style="font-size:0.7em;line-height:0.7em;vertical-align:0.15em;">⁄</span><span style="font-size:0.6em;line-height:0.6em;vertical-align:-0.05em;">5</span></td>
      <td headers="1 to 2 stub_1_32 halves" class="gt_row gt_right">1 <span style="font-size:0.6em;line-height:0.6em;vertical-align:0.45em;">1</span><span style="font-size:0.7em;line-height:0.7em;vertical-align:0.15em;">⁄</span><span style="font-size:0.6em;line-height:0.6em;vertical-align:-0.05em;">2</span></td>
      <td headers="1 to 2 stub_1_32 quarters" class="gt_row gt_right">1 <span style="font-size:0.6em;line-height:0.6em;vertical-align:0.45em;">2</span><span style="font-size:0.7em;line-height:0.7em;vertical-align:0.15em;">⁄</span><span style="font-size:0.6em;line-height:0.6em;vertical-align:-0.05em;">4</span></td>
      <td headers="1 to 2 stub_1_32 eighths" class="gt_row gt_right">1 <span style="font-size:0.6em;line-height:0.6em;vertical-align:0.45em;">3</span><span style="font-size:0.7em;line-height:0.7em;vertical-align:0.15em;">⁄</span><span style="font-size:0.6em;line-height:0.6em;vertical-align:-0.05em;">8</span></td>
      <td headers="1 to 2 stub_1_32 sixteenths" class="gt_row gt_right">1 <span style="font-size:0.6em;line-height:0.6em;vertical-align:0.45em;">6</span><span style="font-size:0.7em;line-height:0.7em;vertical-align:0.15em;">⁄</span><span style="font-size:0.6em;line-height:0.6em;vertical-align:-0.05em;">16</span></td>
      <td headers="1 to 2 stub_1_32 hundredths" class="gt_row gt_right">1 <span style="font-size:0.6em;line-height:0.6em;vertical-align:0.45em;">40</span><span style="font-size:0.7em;line-height:0.7em;vertical-align:0.15em;">⁄</span><span style="font-size:0.6em;line-height:0.6em;vertical-align:-0.05em;">100</span></td></tr>
          <tr><th id="stub_1_33" scope="row" class="gt_row gt_right gt_stub">1.5000</th>
      <td headers="1 to 2 stub_1_33 low" class="gt_row gt_right">1 <span style="font-size:0.6em;line-height:0.6em;vertical-align:0.45em;">1</span><span style="font-size:0.7em;line-height:0.7em;vertical-align:0.15em;">⁄</span><span style="font-size:0.6em;line-height:0.6em;vertical-align:-0.05em;">2</span></td>
      <td headers="1 to 2 stub_1_33 med" class="gt_row gt_right">1 <span style="font-size:0.6em;line-height:0.6em;vertical-align:0.45em;">1</span><span style="font-size:0.7em;line-height:0.7em;vertical-align:0.15em;">⁄</span><span style="font-size:0.6em;line-height:0.6em;vertical-align:-0.05em;">2</span></td>
      <td headers="1 to 2 stub_1_33 high" class="gt_row gt_right">1 <span style="font-size:0.6em;line-height:0.6em;vertical-align:0.45em;">1</span><span style="font-size:0.7em;line-height:0.7em;vertical-align:0.15em;">⁄</span><span style="font-size:0.6em;line-height:0.6em;vertical-align:-0.05em;">2</span></td>
      <td headers="1 to 2 stub_1_33 halves" class="gt_row gt_right">1 <span style="font-size:0.6em;line-height:0.6em;vertical-align:0.45em;">1</span><span style="font-size:0.7em;line-height:0.7em;vertical-align:0.15em;">⁄</span><span style="font-size:0.6em;line-height:0.6em;vertical-align:-0.05em;">2</span></td>
      <td headers="1 to 2 stub_1_33 quarters" class="gt_row gt_right">1 <span style="font-size:0.6em;line-height:0.6em;vertical-align:0.45em;">2</span><span style="font-size:0.7em;line-height:0.7em;vertical-align:0.15em;">⁄</span><span style="font-size:0.6em;line-height:0.6em;vertical-align:-0.05em;">4</span></td>
      <td headers="1 to 2 stub_1_33 eighths" class="gt_row gt_right">1 <span style="font-size:0.6em;line-height:0.6em;vertical-align:0.45em;">4</span><span style="font-size:0.7em;line-height:0.7em;vertical-align:0.15em;">⁄</span><span style="font-size:0.6em;line-height:0.6em;vertical-align:-0.05em;">8</span></td>
      <td headers="1 to 2 stub_1_33 sixteenths" class="gt_row gt_right">1 <span style="font-size:0.6em;line-height:0.6em;vertical-align:0.45em;">8</span><span style="font-size:0.7em;line-height:0.7em;vertical-align:0.15em;">⁄</span><span style="font-size:0.6em;line-height:0.6em;vertical-align:-0.05em;">16</span></td>
      <td headers="1 to 2 stub_1_33 hundredths" class="gt_row gt_right">1 <span style="font-size:0.6em;line-height:0.6em;vertical-align:0.45em;">50</span><span style="font-size:0.7em;line-height:0.7em;vertical-align:0.15em;">⁄</span><span style="font-size:0.6em;line-height:0.6em;vertical-align:-0.05em;">100</span></td></tr>
          <tr><th id="stub_1_34" scope="row" class="gt_row gt_right gt_stub">1.6000</th>
      <td headers="1 to 2 stub_1_34 low" class="gt_row gt_right">1 <span style="font-size:0.6em;line-height:0.6em;vertical-align:0.45em;">3</span><span style="font-size:0.7em;line-height:0.7em;vertical-align:0.15em;">⁄</span><span style="font-size:0.6em;line-height:0.6em;vertical-align:-0.05em;">5</span></td>
      <td headers="1 to 2 stub_1_34 med" class="gt_row gt_right">1 <span style="font-size:0.6em;line-height:0.6em;vertical-align:0.45em;">3</span><span style="font-size:0.7em;line-height:0.7em;vertical-align:0.15em;">⁄</span><span style="font-size:0.6em;line-height:0.6em;vertical-align:-0.05em;">5</span></td>
      <td headers="1 to 2 stub_1_34 high" class="gt_row gt_right">1 <span style="font-size:0.6em;line-height:0.6em;vertical-align:0.45em;">3</span><span style="font-size:0.7em;line-height:0.7em;vertical-align:0.15em;">⁄</span><span style="font-size:0.6em;line-height:0.6em;vertical-align:-0.05em;">5</span></td>
      <td headers="1 to 2 stub_1_34 halves" class="gt_row gt_right">1 <span style="font-size:0.6em;line-height:0.6em;vertical-align:0.45em;">1</span><span style="font-size:0.7em;line-height:0.7em;vertical-align:0.15em;">⁄</span><span style="font-size:0.6em;line-height:0.6em;vertical-align:-0.05em;">2</span></td>
      <td headers="1 to 2 stub_1_34 quarters" class="gt_row gt_right">1 <span style="font-size:0.6em;line-height:0.6em;vertical-align:0.45em;">2</span><span style="font-size:0.7em;line-height:0.7em;vertical-align:0.15em;">⁄</span><span style="font-size:0.6em;line-height:0.6em;vertical-align:-0.05em;">4</span></td>
      <td headers="1 to 2 stub_1_34 eighths" class="gt_row gt_right">1 <span style="font-size:0.6em;line-height:0.6em;vertical-align:0.45em;">5</span><span style="font-size:0.7em;line-height:0.7em;vertical-align:0.15em;">⁄</span><span style="font-size:0.6em;line-height:0.6em;vertical-align:-0.05em;">8</span></td>
      <td headers="1 to 2 stub_1_34 sixteenths" class="gt_row gt_right">1 <span style="font-size:0.6em;line-height:0.6em;vertical-align:0.45em;">10</span><span style="font-size:0.7em;line-height:0.7em;vertical-align:0.15em;">⁄</span><span style="font-size:0.6em;line-height:0.6em;vertical-align:-0.05em;">16</span></td>
      <td headers="1 to 2 stub_1_34 hundredths" class="gt_row gt_right">1 <span style="font-size:0.6em;line-height:0.6em;vertical-align:0.45em;">60</span><span style="font-size:0.7em;line-height:0.7em;vertical-align:0.15em;">⁄</span><span style="font-size:0.6em;line-height:0.6em;vertical-align:-0.05em;">100</span></td></tr>
          <tr><th id="stub_1_35" scope="row" class="gt_row gt_right gt_stub">1.7500</th>
      <td headers="1 to 2 stub_1_35 low" class="gt_row gt_right">1 <span style="font-size:0.6em;line-height:0.6em;vertical-align:0.45em;">3</span><span style="font-size:0.7em;line-height:0.7em;vertical-align:0.15em;">⁄</span><span style="font-size:0.6em;line-height:0.6em;vertical-align:-0.05em;">4</span></td>
      <td headers="1 to 2 stub_1_35 med" class="gt_row gt_right">1 <span style="font-size:0.6em;line-height:0.6em;vertical-align:0.45em;">3</span><span style="font-size:0.7em;line-height:0.7em;vertical-align:0.15em;">⁄</span><span style="font-size:0.6em;line-height:0.6em;vertical-align:-0.05em;">4</span></td>
      <td headers="1 to 2 stub_1_35 high" class="gt_row gt_right">1 <span style="font-size:0.6em;line-height:0.6em;vertical-align:0.45em;">3</span><span style="font-size:0.7em;line-height:0.7em;vertical-align:0.15em;">⁄</span><span style="font-size:0.6em;line-height:0.6em;vertical-align:-0.05em;">4</span></td>
      <td headers="1 to 2 stub_1_35 halves" class="gt_row gt_right">2</td>
      <td headers="1 to 2 stub_1_35 quarters" class="gt_row gt_right">1 <span style="font-size:0.6em;line-height:0.6em;vertical-align:0.45em;">3</span><span style="font-size:0.7em;line-height:0.7em;vertical-align:0.15em;">⁄</span><span style="font-size:0.6em;line-height:0.6em;vertical-align:-0.05em;">4</span></td>
      <td headers="1 to 2 stub_1_35 eighths" class="gt_row gt_right">1 <span style="font-size:0.6em;line-height:0.6em;vertical-align:0.45em;">6</span><span style="font-size:0.7em;line-height:0.7em;vertical-align:0.15em;">⁄</span><span style="font-size:0.6em;line-height:0.6em;vertical-align:-0.05em;">8</span></td>
      <td headers="1 to 2 stub_1_35 sixteenths" class="gt_row gt_right">1 <span style="font-size:0.6em;line-height:0.6em;vertical-align:0.45em;">12</span><span style="font-size:0.7em;line-height:0.7em;vertical-align:0.15em;">⁄</span><span style="font-size:0.6em;line-height:0.6em;vertical-align:-0.05em;">16</span></td>
      <td headers="1 to 2 stub_1_35 hundredths" class="gt_row gt_right">1 <span style="font-size:0.6em;line-height:0.6em;vertical-align:0.45em;">75</span><span style="font-size:0.7em;line-height:0.7em;vertical-align:0.15em;">⁄</span><span style="font-size:0.6em;line-height:0.6em;vertical-align:-0.05em;">100</span></td></tr>
          <tr><th id="stub_1_36" scope="row" class="gt_row gt_right gt_stub">1.9000</th>
      <td headers="1 to 2 stub_1_36 low" class="gt_row gt_right">1 <span style="font-size:0.6em;line-height:0.6em;vertical-align:0.45em;">8</span><span style="font-size:0.7em;line-height:0.7em;vertical-align:0.15em;">⁄</span><span style="font-size:0.6em;line-height:0.6em;vertical-align:-0.05em;">9</span></td>
      <td headers="1 to 2 stub_1_36 med" class="gt_row gt_right">1 <span style="font-size:0.6em;line-height:0.6em;vertical-align:0.45em;">9</span><span style="font-size:0.7em;line-height:0.7em;vertical-align:0.15em;">⁄</span><span style="font-size:0.6em;line-height:0.6em;vertical-align:-0.05em;">10</span></td>
      <td headers="1 to 2 stub_1_36 high" class="gt_row gt_right">1 <span style="font-size:0.6em;line-height:0.6em;vertical-align:0.45em;">9</span><span style="font-size:0.7em;line-height:0.7em;vertical-align:0.15em;">⁄</span><span style="font-size:0.6em;line-height:0.6em;vertical-align:-0.05em;">10</span></td>
      <td headers="1 to 2 stub_1_36 halves" class="gt_row gt_right">2</td>
      <td headers="1 to 2 stub_1_36 quarters" class="gt_row gt_right">2</td>
      <td headers="1 to 2 stub_1_36 eighths" class="gt_row gt_right">1 <span style="font-size:0.6em;line-height:0.6em;vertical-align:0.45em;">7</span><span style="font-size:0.7em;line-height:0.7em;vertical-align:0.15em;">⁄</span><span style="font-size:0.6em;line-height:0.6em;vertical-align:-0.05em;">8</span></td>
      <td headers="1 to 2 stub_1_36 sixteenths" class="gt_row gt_right">1 <span style="font-size:0.6em;line-height:0.6em;vertical-align:0.45em;">14</span><span style="font-size:0.7em;line-height:0.7em;vertical-align:0.15em;">⁄</span><span style="font-size:0.6em;line-height:0.6em;vertical-align:-0.05em;">16</span></td>
      <td headers="1 to 2 stub_1_36 hundredths" class="gt_row gt_right">1 <span style="font-size:0.6em;line-height:0.6em;vertical-align:0.45em;">90</span><span style="font-size:0.7em;line-height:0.7em;vertical-align:0.15em;">⁄</span><span style="font-size:0.6em;line-height:0.6em;vertical-align:-0.05em;">100</span></td></tr>
          <tr><th id="stub_1_37" scope="row" class="gt_row gt_right gt_stub">1.9900</th>
      <td headers="1 to 2 stub_1_37 low" class="gt_row gt_right">2</td>
      <td headers="1 to 2 stub_1_37 med" class="gt_row gt_right">1 <span style="font-size:0.6em;line-height:0.6em;vertical-align:0.45em;">98</span><span style="font-size:0.7em;line-height:0.7em;vertical-align:0.15em;">⁄</span><span style="font-size:0.6em;line-height:0.6em;vertical-align:-0.05em;">99</span></td>
      <td headers="1 to 2 stub_1_37 high" class="gt_row gt_right">1 <span style="font-size:0.6em;line-height:0.6em;vertical-align:0.45em;">99</span><span style="font-size:0.7em;line-height:0.7em;vertical-align:0.15em;">⁄</span><span style="font-size:0.6em;line-height:0.6em;vertical-align:-0.05em;">100</span></td>
      <td headers="1 to 2 stub_1_37 halves" class="gt_row gt_right">2</td>
      <td headers="1 to 2 stub_1_37 quarters" class="gt_row gt_right">2</td>
      <td headers="1 to 2 stub_1_37 eighths" class="gt_row gt_right">2</td>
      <td headers="1 to 2 stub_1_37 sixteenths" class="gt_row gt_right">2</td>
      <td headers="1 to 2 stub_1_37 hundredths" class="gt_row gt_right">1 <span style="font-size:0.6em;line-height:0.6em;vertical-align:0.45em;">99</span><span style="font-size:0.7em;line-height:0.7em;vertical-align:0.15em;">⁄</span><span style="font-size:0.6em;line-height:0.6em;vertical-align:-0.05em;">100</span></td></tr>
          <tr><th id="stub_1_38" scope="row" class="gt_row gt_right gt_stub">1.9990</th>
      <td headers="1 to 2 stub_1_38 low" class="gt_row gt_right">2</td>
      <td headers="1 to 2 stub_1_38 med" class="gt_row gt_right">2</td>
      <td headers="1 to 2 stub_1_38 high" class="gt_row gt_right">1 <span style="font-size:0.6em;line-height:0.6em;vertical-align:0.45em;">998</span><span style="font-size:0.7em;line-height:0.7em;vertical-align:0.15em;">⁄</span><span style="font-size:0.6em;line-height:0.6em;vertical-align:-0.05em;">999</span></td>
      <td headers="1 to 2 stub_1_38 halves" class="gt_row gt_right">2</td>
      <td headers="1 to 2 stub_1_38 quarters" class="gt_row gt_right">2</td>
      <td headers="1 to 2 stub_1_38 eighths" class="gt_row gt_right">2</td>
      <td headers="1 to 2 stub_1_38 sixteenths" class="gt_row gt_right">2</td>
      <td headers="1 to 2 stub_1_38 hundredths" class="gt_row gt_right">2</td></tr>
          <tr><th id="stub_1_39" scope="row" class="gt_row gt_right gt_stub">1.9999</th>
      <td headers="1 to 2 stub_1_39 low" class="gt_row gt_right">2</td>
      <td headers="1 to 2 stub_1_39 med" class="gt_row gt_right">2</td>
      <td headers="1 to 2 stub_1_39 high" class="gt_row gt_right">2</td>
      <td headers="1 to 2 stub_1_39 halves" class="gt_row gt_right">2</td>
      <td headers="1 to 2 stub_1_39 quarters" class="gt_row gt_right">2</td>
      <td headers="1 to 2 stub_1_39 eighths" class="gt_row gt_right">2</td>
      <td headers="1 to 2 stub_1_39 sixteenths" class="gt_row gt_right">2</td>
      <td headers="1 to 2 stub_1_39 hundredths" class="gt_row gt_right">2</td></tr>
          <tr class="gt_group_heading_row">
            <th colspan="9" class="gt_group_heading" scope="colgroup" id="-1 to -2">-1 to -2</th>
          </tr>
          <tr class="gt_row_group_first"><th id="stub_1_40" scope="row" class="gt_row gt_right gt_stub">-1.0001</th>
      <td headers="-1 to -2 stub_1_40 low" class="gt_row gt_right">−1</td>
      <td headers="-1 to -2 stub_1_40 med" class="gt_row gt_right">−1</td>
      <td headers="-1 to -2 stub_1_40 high" class="gt_row gt_right">−1</td>
      <td headers="-1 to -2 stub_1_40 halves" class="gt_row gt_right">−1</td>
      <td headers="-1 to -2 stub_1_40 quarters" class="gt_row gt_right">−1</td>
      <td headers="-1 to -2 stub_1_40 eighths" class="gt_row gt_right">−1</td>
      <td headers="-1 to -2 stub_1_40 sixteenths" class="gt_row gt_right">−1</td>
      <td headers="-1 to -2 stub_1_40 hundredths" class="gt_row gt_right">−1</td></tr>
          <tr><th id="stub_1_41" scope="row" class="gt_row gt_right gt_stub">-1.0010</th>
      <td headers="-1 to -2 stub_1_41 low" class="gt_row gt_right">−1</td>
      <td headers="-1 to -2 stub_1_41 med" class="gt_row gt_right">−1</td>
      <td headers="-1 to -2 stub_1_41 high" class="gt_row gt_right">−1 <span style="font-size:0.6em;line-height:0.6em;vertical-align:0.45em;">1</span><span style="font-size:0.7em;line-height:0.7em;vertical-align:0.15em;">⁄</span><span style="font-size:0.6em;line-height:0.6em;vertical-align:-0.05em;">999</span></td>
      <td headers="-1 to -2 stub_1_41 halves" class="gt_row gt_right">−1</td>
      <td headers="-1 to -2 stub_1_41 quarters" class="gt_row gt_right">−1</td>
      <td headers="-1 to -2 stub_1_41 eighths" class="gt_row gt_right">−1</td>
      <td headers="-1 to -2 stub_1_41 sixteenths" class="gt_row gt_right">−1</td>
      <td headers="-1 to -2 stub_1_41 hundredths" class="gt_row gt_right">−1</td></tr>
          <tr><th id="stub_1_42" scope="row" class="gt_row gt_right gt_stub">-1.0100</th>
      <td headers="-1 to -2 stub_1_42 low" class="gt_row gt_right">−1</td>
      <td headers="-1 to -2 stub_1_42 med" class="gt_row gt_right">−1 <span style="font-size:0.6em;line-height:0.6em;vertical-align:0.45em;">1</span><span style="font-size:0.7em;line-height:0.7em;vertical-align:0.15em;">⁄</span><span style="font-size:0.6em;line-height:0.6em;vertical-align:-0.05em;">99</span></td>
      <td headers="-1 to -2 stub_1_42 high" class="gt_row gt_right">−1 <span style="font-size:0.6em;line-height:0.6em;vertical-align:0.45em;">1</span><span style="font-size:0.7em;line-height:0.7em;vertical-align:0.15em;">⁄</span><span style="font-size:0.6em;line-height:0.6em;vertical-align:-0.05em;">100</span></td>
      <td headers="-1 to -2 stub_1_42 halves" class="gt_row gt_right">−1</td>
      <td headers="-1 to -2 stub_1_42 quarters" class="gt_row gt_right">−1</td>
      <td headers="-1 to -2 stub_1_42 eighths" class="gt_row gt_right">−1</td>
      <td headers="-1 to -2 stub_1_42 sixteenths" class="gt_row gt_right">−1</td>
      <td headers="-1 to -2 stub_1_42 hundredths" class="gt_row gt_right">−1 <span style="font-size:0.6em;line-height:0.6em;vertical-align:0.45em;">1</span><span style="font-size:0.7em;line-height:0.7em;vertical-align:0.15em;">⁄</span><span style="font-size:0.6em;line-height:0.6em;vertical-align:-0.05em;">100</span></td></tr>
          <tr><th id="stub_1_43" scope="row" class="gt_row gt_right gt_stub">-1.1000</th>
      <td headers="-1 to -2 stub_1_43 low" class="gt_row gt_right">−1 <span style="font-size:0.6em;line-height:0.6em;vertical-align:0.45em;">1</span><span style="font-size:0.7em;line-height:0.7em;vertical-align:0.15em;">⁄</span><span style="font-size:0.6em;line-height:0.6em;vertical-align:-0.05em;">9</span></td>
      <td headers="-1 to -2 stub_1_43 med" class="gt_row gt_right">−1 <span style="font-size:0.6em;line-height:0.6em;vertical-align:0.45em;">1</span><span style="font-size:0.7em;line-height:0.7em;vertical-align:0.15em;">⁄</span><span style="font-size:0.6em;line-height:0.6em;vertical-align:-0.05em;">10</span></td>
      <td headers="-1 to -2 stub_1_43 high" class="gt_row gt_right">−1 <span style="font-size:0.6em;line-height:0.6em;vertical-align:0.45em;">1</span><span style="font-size:0.7em;line-height:0.7em;vertical-align:0.15em;">⁄</span><span style="font-size:0.6em;line-height:0.6em;vertical-align:-0.05em;">10</span></td>
      <td headers="-1 to -2 stub_1_43 halves" class="gt_row gt_right">−1</td>
      <td headers="-1 to -2 stub_1_43 quarters" class="gt_row gt_right">−1</td>
      <td headers="-1 to -2 stub_1_43 eighths" class="gt_row gt_right">−1 <span style="font-size:0.6em;line-height:0.6em;vertical-align:0.45em;">1</span><span style="font-size:0.7em;line-height:0.7em;vertical-align:0.15em;">⁄</span><span style="font-size:0.6em;line-height:0.6em;vertical-align:-0.05em;">8</span></td>
      <td headers="-1 to -2 stub_1_43 sixteenths" class="gt_row gt_right">−1 <span style="font-size:0.6em;line-height:0.6em;vertical-align:0.45em;">2</span><span style="font-size:0.7em;line-height:0.7em;vertical-align:0.15em;">⁄</span><span style="font-size:0.6em;line-height:0.6em;vertical-align:-0.05em;">16</span></td>
      <td headers="-1 to -2 stub_1_43 hundredths" class="gt_row gt_right">−1 <span style="font-size:0.6em;line-height:0.6em;vertical-align:0.45em;">10</span><span style="font-size:0.7em;line-height:0.7em;vertical-align:0.15em;">⁄</span><span style="font-size:0.6em;line-height:0.6em;vertical-align:-0.05em;">100</span></td></tr>
          <tr><th id="stub_1_44" scope="row" class="gt_row gt_right gt_stub">-1.2500</th>
      <td headers="-1 to -2 stub_1_44 low" class="gt_row gt_right">−1 <span style="font-size:0.6em;line-height:0.6em;vertical-align:0.45em;">1</span><span style="font-size:0.7em;line-height:0.7em;vertical-align:0.15em;">⁄</span><span style="font-size:0.6em;line-height:0.6em;vertical-align:-0.05em;">4</span></td>
      <td headers="-1 to -2 stub_1_44 med" class="gt_row gt_right">−1 <span style="font-size:0.6em;line-height:0.6em;vertical-align:0.45em;">1</span><span style="font-size:0.7em;line-height:0.7em;vertical-align:0.15em;">⁄</span><span style="font-size:0.6em;line-height:0.6em;vertical-align:-0.05em;">4</span></td>
      <td headers="-1 to -2 stub_1_44 high" class="gt_row gt_right">−1 <span style="font-size:0.6em;line-height:0.6em;vertical-align:0.45em;">1</span><span style="font-size:0.7em;line-height:0.7em;vertical-align:0.15em;">⁄</span><span style="font-size:0.6em;line-height:0.6em;vertical-align:-0.05em;">4</span></td>
      <td headers="-1 to -2 stub_1_44 halves" class="gt_row gt_right">−1 <span style="font-size:0.6em;line-height:0.6em;vertical-align:0.45em;">1</span><span style="font-size:0.7em;line-height:0.7em;vertical-align:0.15em;">⁄</span><span style="font-size:0.6em;line-height:0.6em;vertical-align:-0.05em;">2</span></td>
      <td headers="-1 to -2 stub_1_44 quarters" class="gt_row gt_right">−1 <span style="font-size:0.6em;line-height:0.6em;vertical-align:0.45em;">1</span><span style="font-size:0.7em;line-height:0.7em;vertical-align:0.15em;">⁄</span><span style="font-size:0.6em;line-height:0.6em;vertical-align:-0.05em;">4</span></td>
      <td headers="-1 to -2 stub_1_44 eighths" class="gt_row gt_right">−1 <span style="font-size:0.6em;line-height:0.6em;vertical-align:0.45em;">2</span><span style="font-size:0.7em;line-height:0.7em;vertical-align:0.15em;">⁄</span><span style="font-size:0.6em;line-height:0.6em;vertical-align:-0.05em;">8</span></td>
      <td headers="-1 to -2 stub_1_44 sixteenths" class="gt_row gt_right">−1 <span style="font-size:0.6em;line-height:0.6em;vertical-align:0.45em;">4</span><span style="font-size:0.7em;line-height:0.7em;vertical-align:0.15em;">⁄</span><span style="font-size:0.6em;line-height:0.6em;vertical-align:-0.05em;">16</span></td>
      <td headers="-1 to -2 stub_1_44 hundredths" class="gt_row gt_right">−1 <span style="font-size:0.6em;line-height:0.6em;vertical-align:0.45em;">25</span><span style="font-size:0.7em;line-height:0.7em;vertical-align:0.15em;">⁄</span><span style="font-size:0.6em;line-height:0.6em;vertical-align:-0.05em;">100</span></td></tr>
          <tr><th id="stub_1_45" scope="row" class="gt_row gt_right gt_stub">-1.4000</th>
      <td headers="-1 to -2 stub_1_45 low" class="gt_row gt_right">−1 <span style="font-size:0.6em;line-height:0.6em;vertical-align:0.45em;">2</span><span style="font-size:0.7em;line-height:0.7em;vertical-align:0.15em;">⁄</span><span style="font-size:0.6em;line-height:0.6em;vertical-align:-0.05em;">5</span></td>
      <td headers="-1 to -2 stub_1_45 med" class="gt_row gt_right">−1 <span style="font-size:0.6em;line-height:0.6em;vertical-align:0.45em;">2</span><span style="font-size:0.7em;line-height:0.7em;vertical-align:0.15em;">⁄</span><span style="font-size:0.6em;line-height:0.6em;vertical-align:-0.05em;">5</span></td>
      <td headers="-1 to -2 stub_1_45 high" class="gt_row gt_right">−1 <span style="font-size:0.6em;line-height:0.6em;vertical-align:0.45em;">2</span><span style="font-size:0.7em;line-height:0.7em;vertical-align:0.15em;">⁄</span><span style="font-size:0.6em;line-height:0.6em;vertical-align:-0.05em;">5</span></td>
      <td headers="-1 to -2 stub_1_45 halves" class="gt_row gt_right">−1 <span style="font-size:0.6em;line-height:0.6em;vertical-align:0.45em;">1</span><span style="font-size:0.7em;line-height:0.7em;vertical-align:0.15em;">⁄</span><span style="font-size:0.6em;line-height:0.6em;vertical-align:-0.05em;">2</span></td>
      <td headers="-1 to -2 stub_1_45 quarters" class="gt_row gt_right">−1 <span style="font-size:0.6em;line-height:0.6em;vertical-align:0.45em;">2</span><span style="font-size:0.7em;line-height:0.7em;vertical-align:0.15em;">⁄</span><span style="font-size:0.6em;line-height:0.6em;vertical-align:-0.05em;">4</span></td>
      <td headers="-1 to -2 stub_1_45 eighths" class="gt_row gt_right">−1 <span style="font-size:0.6em;line-height:0.6em;vertical-align:0.45em;">3</span><span style="font-size:0.7em;line-height:0.7em;vertical-align:0.15em;">⁄</span><span style="font-size:0.6em;line-height:0.6em;vertical-align:-0.05em;">8</span></td>
      <td headers="-1 to -2 stub_1_45 sixteenths" class="gt_row gt_right">−1 <span style="font-size:0.6em;line-height:0.6em;vertical-align:0.45em;">6</span><span style="font-size:0.7em;line-height:0.7em;vertical-align:0.15em;">⁄</span><span style="font-size:0.6em;line-height:0.6em;vertical-align:-0.05em;">16</span></td>
      <td headers="-1 to -2 stub_1_45 hundredths" class="gt_row gt_right">−1 <span style="font-size:0.6em;line-height:0.6em;vertical-align:0.45em;">40</span><span style="font-size:0.7em;line-height:0.7em;vertical-align:0.15em;">⁄</span><span style="font-size:0.6em;line-height:0.6em;vertical-align:-0.05em;">100</span></td></tr>
          <tr><th id="stub_1_46" scope="row" class="gt_row gt_right gt_stub">-1.5000</th>
      <td headers="-1 to -2 stub_1_46 low" class="gt_row gt_right">−1 <span style="font-size:0.6em;line-height:0.6em;vertical-align:0.45em;">1</span><span style="font-size:0.7em;line-height:0.7em;vertical-align:0.15em;">⁄</span><span style="font-size:0.6em;line-height:0.6em;vertical-align:-0.05em;">2</span></td>
      <td headers="-1 to -2 stub_1_46 med" class="gt_row gt_right">−1 <span style="font-size:0.6em;line-height:0.6em;vertical-align:0.45em;">1</span><span style="font-size:0.7em;line-height:0.7em;vertical-align:0.15em;">⁄</span><span style="font-size:0.6em;line-height:0.6em;vertical-align:-0.05em;">2</span></td>
      <td headers="-1 to -2 stub_1_46 high" class="gt_row gt_right">−1 <span style="font-size:0.6em;line-height:0.6em;vertical-align:0.45em;">1</span><span style="font-size:0.7em;line-height:0.7em;vertical-align:0.15em;">⁄</span><span style="font-size:0.6em;line-height:0.6em;vertical-align:-0.05em;">2</span></td>
      <td headers="-1 to -2 stub_1_46 halves" class="gt_row gt_right">−1 <span style="font-size:0.6em;line-height:0.6em;vertical-align:0.45em;">1</span><span style="font-size:0.7em;line-height:0.7em;vertical-align:0.15em;">⁄</span><span style="font-size:0.6em;line-height:0.6em;vertical-align:-0.05em;">2</span></td>
      <td headers="-1 to -2 stub_1_46 quarters" class="gt_row gt_right">−1 <span style="font-size:0.6em;line-height:0.6em;vertical-align:0.45em;">2</span><span style="font-size:0.7em;line-height:0.7em;vertical-align:0.15em;">⁄</span><span style="font-size:0.6em;line-height:0.6em;vertical-align:-0.05em;">4</span></td>
      <td headers="-1 to -2 stub_1_46 eighths" class="gt_row gt_right">−1 <span style="font-size:0.6em;line-height:0.6em;vertical-align:0.45em;">4</span><span style="font-size:0.7em;line-height:0.7em;vertical-align:0.15em;">⁄</span><span style="font-size:0.6em;line-height:0.6em;vertical-align:-0.05em;">8</span></td>
      <td headers="-1 to -2 stub_1_46 sixteenths" class="gt_row gt_right">−1 <span style="font-size:0.6em;line-height:0.6em;vertical-align:0.45em;">8</span><span style="font-size:0.7em;line-height:0.7em;vertical-align:0.15em;">⁄</span><span style="font-size:0.6em;line-height:0.6em;vertical-align:-0.05em;">16</span></td>
      <td headers="-1 to -2 stub_1_46 hundredths" class="gt_row gt_right">−1 <span style="font-size:0.6em;line-height:0.6em;vertical-align:0.45em;">50</span><span style="font-size:0.7em;line-height:0.7em;vertical-align:0.15em;">⁄</span><span style="font-size:0.6em;line-height:0.6em;vertical-align:-0.05em;">100</span></td></tr>
          <tr><th id="stub_1_47" scope="row" class="gt_row gt_right gt_stub">-1.6000</th>
      <td headers="-1 to -2 stub_1_47 low" class="gt_row gt_right">−1 <span style="font-size:0.6em;line-height:0.6em;vertical-align:0.45em;">3</span><span style="font-size:0.7em;line-height:0.7em;vertical-align:0.15em;">⁄</span><span style="font-size:0.6em;line-height:0.6em;vertical-align:-0.05em;">5</span></td>
      <td headers="-1 to -2 stub_1_47 med" class="gt_row gt_right">−1 <span style="font-size:0.6em;line-height:0.6em;vertical-align:0.45em;">3</span><span style="font-size:0.7em;line-height:0.7em;vertical-align:0.15em;">⁄</span><span style="font-size:0.6em;line-height:0.6em;vertical-align:-0.05em;">5</span></td>
      <td headers="-1 to -2 stub_1_47 high" class="gt_row gt_right">−1 <span style="font-size:0.6em;line-height:0.6em;vertical-align:0.45em;">3</span><span style="font-size:0.7em;line-height:0.7em;vertical-align:0.15em;">⁄</span><span style="font-size:0.6em;line-height:0.6em;vertical-align:-0.05em;">5</span></td>
      <td headers="-1 to -2 stub_1_47 halves" class="gt_row gt_right">−1 <span style="font-size:0.6em;line-height:0.6em;vertical-align:0.45em;">1</span><span style="font-size:0.7em;line-height:0.7em;vertical-align:0.15em;">⁄</span><span style="font-size:0.6em;line-height:0.6em;vertical-align:-0.05em;">2</span></td>
      <td headers="-1 to -2 stub_1_47 quarters" class="gt_row gt_right">−1 <span style="font-size:0.6em;line-height:0.6em;vertical-align:0.45em;">2</span><span style="font-size:0.7em;line-height:0.7em;vertical-align:0.15em;">⁄</span><span style="font-size:0.6em;line-height:0.6em;vertical-align:-0.05em;">4</span></td>
      <td headers="-1 to -2 stub_1_47 eighths" class="gt_row gt_right">−1 <span style="font-size:0.6em;line-height:0.6em;vertical-align:0.45em;">5</span><span style="font-size:0.7em;line-height:0.7em;vertical-align:0.15em;">⁄</span><span style="font-size:0.6em;line-height:0.6em;vertical-align:-0.05em;">8</span></td>
      <td headers="-1 to -2 stub_1_47 sixteenths" class="gt_row gt_right">−1 <span style="font-size:0.6em;line-height:0.6em;vertical-align:0.45em;">10</span><span style="font-size:0.7em;line-height:0.7em;vertical-align:0.15em;">⁄</span><span style="font-size:0.6em;line-height:0.6em;vertical-align:-0.05em;">16</span></td>
      <td headers="-1 to -2 stub_1_47 hundredths" class="gt_row gt_right">−1 <span style="font-size:0.6em;line-height:0.6em;vertical-align:0.45em;">60</span><span style="font-size:0.7em;line-height:0.7em;vertical-align:0.15em;">⁄</span><span style="font-size:0.6em;line-height:0.6em;vertical-align:-0.05em;">100</span></td></tr>
          <tr><th id="stub_1_48" scope="row" class="gt_row gt_right gt_stub">-1.7500</th>
      <td headers="-1 to -2 stub_1_48 low" class="gt_row gt_right">−1 <span style="font-size:0.6em;line-height:0.6em;vertical-align:0.45em;">3</span><span style="font-size:0.7em;line-height:0.7em;vertical-align:0.15em;">⁄</span><span style="font-size:0.6em;line-height:0.6em;vertical-align:-0.05em;">4</span></td>
      <td headers="-1 to -2 stub_1_48 med" class="gt_row gt_right">−1 <span style="font-size:0.6em;line-height:0.6em;vertical-align:0.45em;">3</span><span style="font-size:0.7em;line-height:0.7em;vertical-align:0.15em;">⁄</span><span style="font-size:0.6em;line-height:0.6em;vertical-align:-0.05em;">4</span></td>
      <td headers="-1 to -2 stub_1_48 high" class="gt_row gt_right">−1 <span style="font-size:0.6em;line-height:0.6em;vertical-align:0.45em;">3</span><span style="font-size:0.7em;line-height:0.7em;vertical-align:0.15em;">⁄</span><span style="font-size:0.6em;line-height:0.6em;vertical-align:-0.05em;">4</span></td>
      <td headers="-1 to -2 stub_1_48 halves" class="gt_row gt_right">−2</td>
      <td headers="-1 to -2 stub_1_48 quarters" class="gt_row gt_right">−1 <span style="font-size:0.6em;line-height:0.6em;vertical-align:0.45em;">3</span><span style="font-size:0.7em;line-height:0.7em;vertical-align:0.15em;">⁄</span><span style="font-size:0.6em;line-height:0.6em;vertical-align:-0.05em;">4</span></td>
      <td headers="-1 to -2 stub_1_48 eighths" class="gt_row gt_right">−1 <span style="font-size:0.6em;line-height:0.6em;vertical-align:0.45em;">6</span><span style="font-size:0.7em;line-height:0.7em;vertical-align:0.15em;">⁄</span><span style="font-size:0.6em;line-height:0.6em;vertical-align:-0.05em;">8</span></td>
      <td headers="-1 to -2 stub_1_48 sixteenths" class="gt_row gt_right">−1 <span style="font-size:0.6em;line-height:0.6em;vertical-align:0.45em;">12</span><span style="font-size:0.7em;line-height:0.7em;vertical-align:0.15em;">⁄</span><span style="font-size:0.6em;line-height:0.6em;vertical-align:-0.05em;">16</span></td>
      <td headers="-1 to -2 stub_1_48 hundredths" class="gt_row gt_right">−1 <span style="font-size:0.6em;line-height:0.6em;vertical-align:0.45em;">75</span><span style="font-size:0.7em;line-height:0.7em;vertical-align:0.15em;">⁄</span><span style="font-size:0.6em;line-height:0.6em;vertical-align:-0.05em;">100</span></td></tr>
          <tr><th id="stub_1_49" scope="row" class="gt_row gt_right gt_stub">-1.9000</th>
      <td headers="-1 to -2 stub_1_49 low" class="gt_row gt_right">−1 <span style="font-size:0.6em;line-height:0.6em;vertical-align:0.45em;">8</span><span style="font-size:0.7em;line-height:0.7em;vertical-align:0.15em;">⁄</span><span style="font-size:0.6em;line-height:0.6em;vertical-align:-0.05em;">9</span></td>
      <td headers="-1 to -2 stub_1_49 med" class="gt_row gt_right">−1 <span style="font-size:0.6em;line-height:0.6em;vertical-align:0.45em;">9</span><span style="font-size:0.7em;line-height:0.7em;vertical-align:0.15em;">⁄</span><span style="font-size:0.6em;line-height:0.6em;vertical-align:-0.05em;">10</span></td>
      <td headers="-1 to -2 stub_1_49 high" class="gt_row gt_right">−1 <span style="font-size:0.6em;line-height:0.6em;vertical-align:0.45em;">9</span><span style="font-size:0.7em;line-height:0.7em;vertical-align:0.15em;">⁄</span><span style="font-size:0.6em;line-height:0.6em;vertical-align:-0.05em;">10</span></td>
      <td headers="-1 to -2 stub_1_49 halves" class="gt_row gt_right">−2</td>
      <td headers="-1 to -2 stub_1_49 quarters" class="gt_row gt_right">−2</td>
      <td headers="-1 to -2 stub_1_49 eighths" class="gt_row gt_right">−1 <span style="font-size:0.6em;line-height:0.6em;vertical-align:0.45em;">7</span><span style="font-size:0.7em;line-height:0.7em;vertical-align:0.15em;">⁄</span><span style="font-size:0.6em;line-height:0.6em;vertical-align:-0.05em;">8</span></td>
      <td headers="-1 to -2 stub_1_49 sixteenths" class="gt_row gt_right">−1 <span style="font-size:0.6em;line-height:0.6em;vertical-align:0.45em;">14</span><span style="font-size:0.7em;line-height:0.7em;vertical-align:0.15em;">⁄</span><span style="font-size:0.6em;line-height:0.6em;vertical-align:-0.05em;">16</span></td>
      <td headers="-1 to -2 stub_1_49 hundredths" class="gt_row gt_right">−1 <span style="font-size:0.6em;line-height:0.6em;vertical-align:0.45em;">90</span><span style="font-size:0.7em;line-height:0.7em;vertical-align:0.15em;">⁄</span><span style="font-size:0.6em;line-height:0.6em;vertical-align:-0.05em;">100</span></td></tr>
          <tr><th id="stub_1_50" scope="row" class="gt_row gt_right gt_stub">-1.9900</th>
      <td headers="-1 to -2 stub_1_50 low" class="gt_row gt_right">−2</td>
      <td headers="-1 to -2 stub_1_50 med" class="gt_row gt_right">−1 <span style="font-size:0.6em;line-height:0.6em;vertical-align:0.45em;">98</span><span style="font-size:0.7em;line-height:0.7em;vertical-align:0.15em;">⁄</span><span style="font-size:0.6em;line-height:0.6em;vertical-align:-0.05em;">99</span></td>
      <td headers="-1 to -2 stub_1_50 high" class="gt_row gt_right">−1 <span style="font-size:0.6em;line-height:0.6em;vertical-align:0.45em;">99</span><span style="font-size:0.7em;line-height:0.7em;vertical-align:0.15em;">⁄</span><span style="font-size:0.6em;line-height:0.6em;vertical-align:-0.05em;">100</span></td>
      <td headers="-1 to -2 stub_1_50 halves" class="gt_row gt_right">−2</td>
      <td headers="-1 to -2 stub_1_50 quarters" class="gt_row gt_right">−2</td>
      <td headers="-1 to -2 stub_1_50 eighths" class="gt_row gt_right">−2</td>
      <td headers="-1 to -2 stub_1_50 sixteenths" class="gt_row gt_right">−2</td>
      <td headers="-1 to -2 stub_1_50 hundredths" class="gt_row gt_right">−1 <span style="font-size:0.6em;line-height:0.6em;vertical-align:0.45em;">99</span><span style="font-size:0.7em;line-height:0.7em;vertical-align:0.15em;">⁄</span><span style="font-size:0.6em;line-height:0.6em;vertical-align:-0.05em;">100</span></td></tr>
          <tr><th id="stub_1_51" scope="row" class="gt_row gt_right gt_stub">-1.9990</th>
      <td headers="-1 to -2 stub_1_51 low" class="gt_row gt_right">−2</td>
      <td headers="-1 to -2 stub_1_51 med" class="gt_row gt_right">−2</td>
      <td headers="-1 to -2 stub_1_51 high" class="gt_row gt_right">−1 <span style="font-size:0.6em;line-height:0.6em;vertical-align:0.45em;">998</span><span style="font-size:0.7em;line-height:0.7em;vertical-align:0.15em;">⁄</span><span style="font-size:0.6em;line-height:0.6em;vertical-align:-0.05em;">999</span></td>
      <td headers="-1 to -2 stub_1_51 halves" class="gt_row gt_right">−2</td>
      <td headers="-1 to -2 stub_1_51 quarters" class="gt_row gt_right">−2</td>
      <td headers="-1 to -2 stub_1_51 eighths" class="gt_row gt_right">−2</td>
      <td headers="-1 to -2 stub_1_51 sixteenths" class="gt_row gt_right">−2</td>
      <td headers="-1 to -2 stub_1_51 hundredths" class="gt_row gt_right">−2</td></tr>
          <tr><th id="stub_1_52" scope="row" class="gt_row gt_right gt_stub">-1.9999</th>
      <td headers="-1 to -2 stub_1_52 low" class="gt_row gt_right">−2</td>
      <td headers="-1 to -2 stub_1_52 med" class="gt_row gt_right">−2</td>
      <td headers="-1 to -2 stub_1_52 high" class="gt_row gt_right">−2</td>
      <td headers="-1 to -2 stub_1_52 halves" class="gt_row gt_right">−2</td>
      <td headers="-1 to -2 stub_1_52 quarters" class="gt_row gt_right">−2</td>
      <td headers="-1 to -2 stub_1_52 eighths" class="gt_row gt_right">−2</td>
      <td headers="-1 to -2 stub_1_52 sixteenths" class="gt_row gt_right">−2</td>
      <td headers="-1 to -2 stub_1_52 hundredths" class="gt_row gt_right">−2</td></tr>
          <tr class="gt_group_heading_row">
            <th colspan="9" class="gt_group_heading" scope="colgroup" id="Exact Numbers">Exact Numbers</th>
          </tr>
          <tr class="gt_row_group_first"><th id="stub_1_53" scope="row" class="gt_row gt_right gt_stub">-1.0000</th>
      <td headers="Exact Numbers stub_1_53 low" class="gt_row gt_right">−1</td>
      <td headers="Exact Numbers stub_1_53 med" class="gt_row gt_right">−1</td>
      <td headers="Exact Numbers stub_1_53 high" class="gt_row gt_right">−1</td>
      <td headers="Exact Numbers stub_1_53 halves" class="gt_row gt_right">−1</td>
      <td headers="Exact Numbers stub_1_53 quarters" class="gt_row gt_right">−1</td>
      <td headers="Exact Numbers stub_1_53 eighths" class="gt_row gt_right">−1</td>
      <td headers="Exact Numbers stub_1_53 sixteenths" class="gt_row gt_right">−1</td>
      <td headers="Exact Numbers stub_1_53 hundredths" class="gt_row gt_right">−1</td></tr>
          <tr><th id="stub_1_54" scope="row" class="gt_row gt_right gt_stub">0.0000</th>
      <td headers="Exact Numbers stub_1_54 low" class="gt_row gt_right">0</td>
      <td headers="Exact Numbers stub_1_54 med" class="gt_row gt_right">0</td>
      <td headers="Exact Numbers stub_1_54 high" class="gt_row gt_right">0</td>
      <td headers="Exact Numbers stub_1_54 halves" class="gt_row gt_right">0</td>
      <td headers="Exact Numbers stub_1_54 quarters" class="gt_row gt_right">0</td>
      <td headers="Exact Numbers stub_1_54 eighths" class="gt_row gt_right">0</td>
      <td headers="Exact Numbers stub_1_54 sixteenths" class="gt_row gt_right">0</td>
      <td headers="Exact Numbers stub_1_54 hundredths" class="gt_row gt_right">0</td></tr>
          <tr><th id="stub_1_55" scope="row" class="gt_row gt_right gt_stub">1.0000</th>
      <td headers="Exact Numbers stub_1_55 low" class="gt_row gt_right">1</td>
      <td headers="Exact Numbers stub_1_55 med" class="gt_row gt_right">1</td>
      <td headers="Exact Numbers stub_1_55 high" class="gt_row gt_right">1</td>
      <td headers="Exact Numbers stub_1_55 halves" class="gt_row gt_right">1</td>
      <td headers="Exact Numbers stub_1_55 quarters" class="gt_row gt_right">1</td>
      <td headers="Exact Numbers stub_1_55 eighths" class="gt_row gt_right">1</td>
      <td headers="Exact Numbers stub_1_55 sixteenths" class="gt_row gt_right">1</td>
      <td headers="Exact Numbers stub_1_55 hundredths" class="gt_row gt_right">1</td></tr>
          <tr class="gt_group_heading_row">
            <th colspan="9" class="gt_group_heading" scope="colgroup" id="Not Numbers">Not Numbers</th>
          </tr>
          <tr class="gt_row_group_first"><th id="stub_1_56" scope="row" class="gt_row gt_right gt_stub">NA</th>
      <td headers="Not Numbers stub_1_56 low" class="gt_row gt_right">NA</td>
      <td headers="Not Numbers stub_1_56 med" class="gt_row gt_right">NA</td>
      <td headers="Not Numbers stub_1_56 high" class="gt_row gt_right">NA</td>
      <td headers="Not Numbers stub_1_56 halves" class="gt_row gt_right">NA</td>
      <td headers="Not Numbers stub_1_56 quarters" class="gt_row gt_right">NA</td>
      <td headers="Not Numbers stub_1_56 eighths" class="gt_row gt_right">NA</td>
      <td headers="Not Numbers stub_1_56 sixteenths" class="gt_row gt_right">NA</td>
      <td headers="Not Numbers stub_1_56 hundredths" class="gt_row gt_right">NA</td></tr>
          <tr><th id="stub_1_57" scope="row" class="gt_row gt_right gt_stub">NaN</th>
      <td headers="Not Numbers stub_1_57 low" class="gt_row gt_right">NaN</td>
      <td headers="Not Numbers stub_1_57 med" class="gt_row gt_right">NaN</td>
      <td headers="Not Numbers stub_1_57 high" class="gt_row gt_right">NaN</td>
      <td headers="Not Numbers stub_1_57 halves" class="gt_row gt_right">NaN</td>
      <td headers="Not Numbers stub_1_57 quarters" class="gt_row gt_right">NaN</td>
      <td headers="Not Numbers stub_1_57 eighths" class="gt_row gt_right">NaN</td>
      <td headers="Not Numbers stub_1_57 sixteenths" class="gt_row gt_right">NaN</td>
      <td headers="Not Numbers stub_1_57 hundredths" class="gt_row gt_right">NaN</td></tr>
          <tr><th id="stub_1_58" scope="row" class="gt_row gt_right gt_stub">Inf</th>
      <td headers="Not Numbers stub_1_58 low" class="gt_row gt_right">Inf</td>
      <td headers="Not Numbers stub_1_58 med" class="gt_row gt_right">Inf</td>
      <td headers="Not Numbers stub_1_58 high" class="gt_row gt_right">Inf</td>
      <td headers="Not Numbers stub_1_58 halves" class="gt_row gt_right">Inf</td>
      <td headers="Not Numbers stub_1_58 quarters" class="gt_row gt_right">Inf</td>
      <td headers="Not Numbers stub_1_58 eighths" class="gt_row gt_right">Inf</td>
      <td headers="Not Numbers stub_1_58 sixteenths" class="gt_row gt_right">Inf</td>
      <td headers="Not Numbers stub_1_58 hundredths" class="gt_row gt_right">Inf</td></tr>
          <tr><th id="stub_1_59" scope="row" class="gt_row gt_right gt_stub">-Inf</th>
      <td headers="Not Numbers stub_1_59 low" class="gt_row gt_right">-Inf</td>
      <td headers="Not Numbers stub_1_59 med" class="gt_row gt_right">-Inf</td>
      <td headers="Not Numbers stub_1_59 high" class="gt_row gt_right">-Inf</td>
      <td headers="Not Numbers stub_1_59 halves" class="gt_row gt_right">-Inf</td>
      <td headers="Not Numbers stub_1_59 quarters" class="gt_row gt_right">-Inf</td>
      <td headers="Not Numbers stub_1_59 eighths" class="gt_row gt_right">-Inf</td>
      <td headers="Not Numbers stub_1_59 sixteenths" class="gt_row gt_right">-Inf</td>
      <td headers="Not Numbers stub_1_59 hundredths" class="gt_row gt_right">-Inf</td></tr>
        </tbody>
        
      </table>

---

    Code
      cat(render_as_html(gt_tbl))
    Output
      <table class="gt_table" style="table-layout:fixed;width:0px;" data-quarto-disable-processing="false" data-quarto-bootstrap="false">
        <colgroup>
          <col style="width:100px;"/>
          <col style="width:100px;"/>
          <col style="width:100px;"/>
          <col style="width:100px;"/>
          <col style="width:100px;"/>
          <col style="width:100px;"/>
          <col style="width:100px;"/>
          <col style="width:100px;"/>
          <col style="width:100px;"/>
        </colgroup>
        <thead>
          <tr class="gt_col_headings">
            <th class="gt_col_heading gt_columns_bottom_border gt_left" rowspan="1" colspan="1" scope="col" id="a::stub"></th>
            <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id="low">low</th>
            <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id="med">med</th>
            <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id="high">high</th>
            <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id="halves">halves</th>
            <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id="quarters">quarters</th>
            <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id="eighths">eighths</th>
            <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id="sixteenths">sixteenths</th>
            <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id="hundredths">hundredths</th>
          </tr>
        </thead>
        <tbody class="gt_table_body">
          <tr class="gt_group_heading_row">
            <th colspan="9" class="gt_group_heading" scope="colgroup" id="0 to 1">0 to 1</th>
          </tr>
          <tr class="gt_row_group_first"><th id="stub_1_1" scope="row" class="gt_row gt_right gt_stub">0.0001</th>
      <td headers="0 to 1 stub_1_1 low" class="gt_row gt_right">0</td>
      <td headers="0 to 1 stub_1_1 med" class="gt_row gt_right">0</td>
      <td headers="0 to 1 stub_1_1 high" class="gt_row gt_right">0</td>
      <td headers="0 to 1 stub_1_1 halves" class="gt_row gt_right">0</td>
      <td headers="0 to 1 stub_1_1 quarters" class="gt_row gt_right">0</td>
      <td headers="0 to 1 stub_1_1 eighths" class="gt_row gt_right">0</td>
      <td headers="0 to 1 stub_1_1 sixteenths" class="gt_row gt_right">0</td>
      <td headers="0 to 1 stub_1_1 hundredths" class="gt_row gt_right">0</td></tr>
          <tr><th id="stub_1_2" scope="row" class="gt_row gt_right gt_stub">0.0010</th>
      <td headers="0 to 1 stub_1_2 low" class="gt_row gt_right">0</td>
      <td headers="0 to 1 stub_1_2 med" class="gt_row gt_right">0</td>
      <td headers="0 to 1 stub_1_2 high" class="gt_row gt_right">1/999</td>
      <td headers="0 to 1 stub_1_2 halves" class="gt_row gt_right">0</td>
      <td headers="0 to 1 stub_1_2 quarters" class="gt_row gt_right">0</td>
      <td headers="0 to 1 stub_1_2 eighths" class="gt_row gt_right">0</td>
      <td headers="0 to 1 stub_1_2 sixteenths" class="gt_row gt_right">0</td>
      <td headers="0 to 1 stub_1_2 hundredths" class="gt_row gt_right">0</td></tr>
          <tr><th id="stub_1_3" scope="row" class="gt_row gt_right gt_stub">0.0100</th>
      <td headers="0 to 1 stub_1_3 low" class="gt_row gt_right">0</td>
      <td headers="0 to 1 stub_1_3 med" class="gt_row gt_right">1/99</td>
      <td headers="0 to 1 stub_1_3 high" class="gt_row gt_right">1/100</td>
      <td headers="0 to 1 stub_1_3 halves" class="gt_row gt_right">0</td>
      <td headers="0 to 1 stub_1_3 quarters" class="gt_row gt_right">0</td>
      <td headers="0 to 1 stub_1_3 eighths" class="gt_row gt_right">0</td>
      <td headers="0 to 1 stub_1_3 sixteenths" class="gt_row gt_right">0</td>
      <td headers="0 to 1 stub_1_3 hundredths" class="gt_row gt_right">1/100</td></tr>
          <tr><th id="stub_1_4" scope="row" class="gt_row gt_right gt_stub">0.1000</th>
      <td headers="0 to 1 stub_1_4 low" class="gt_row gt_right">1/9</td>
      <td headers="0 to 1 stub_1_4 med" class="gt_row gt_right">1/10</td>
      <td headers="0 to 1 stub_1_4 high" class="gt_row gt_right">1/10</td>
      <td headers="0 to 1 stub_1_4 halves" class="gt_row gt_right">0</td>
      <td headers="0 to 1 stub_1_4 quarters" class="gt_row gt_right">0</td>
      <td headers="0 to 1 stub_1_4 eighths" class="gt_row gt_right">1/8</td>
      <td headers="0 to 1 stub_1_4 sixteenths" class="gt_row gt_right">2/16</td>
      <td headers="0 to 1 stub_1_4 hundredths" class="gt_row gt_right">10/100</td></tr>
          <tr><th id="stub_1_5" scope="row" class="gt_row gt_right gt_stub">0.2500</th>
      <td headers="0 to 1 stub_1_5 low" class="gt_row gt_right">1/4</td>
      <td headers="0 to 1 stub_1_5 med" class="gt_row gt_right">1/4</td>
      <td headers="0 to 1 stub_1_5 high" class="gt_row gt_right">1/4</td>
      <td headers="0 to 1 stub_1_5 halves" class="gt_row gt_right">1/2</td>
      <td headers="0 to 1 stub_1_5 quarters" class="gt_row gt_right">1/4</td>
      <td headers="0 to 1 stub_1_5 eighths" class="gt_row gt_right">2/8</td>
      <td headers="0 to 1 stub_1_5 sixteenths" class="gt_row gt_right">4/16</td>
      <td headers="0 to 1 stub_1_5 hundredths" class="gt_row gt_right">25/100</td></tr>
          <tr><th id="stub_1_6" scope="row" class="gt_row gt_right gt_stub">0.4000</th>
      <td headers="0 to 1 stub_1_6 low" class="gt_row gt_right">2/5</td>
      <td headers="0 to 1 stub_1_6 med" class="gt_row gt_right">2/5</td>
      <td headers="0 to 1 stub_1_6 high" class="gt_row gt_right">2/5</td>
      <td headers="0 to 1 stub_1_6 halves" class="gt_row gt_right">1/2</td>
      <td headers="0 to 1 stub_1_6 quarters" class="gt_row gt_right">2/4</td>
      <td headers="0 to 1 stub_1_6 eighths" class="gt_row gt_right">3/8</td>
      <td headers="0 to 1 stub_1_6 sixteenths" class="gt_row gt_right">6/16</td>
      <td headers="0 to 1 stub_1_6 hundredths" class="gt_row gt_right">40/100</td></tr>
          <tr><th id="stub_1_7" scope="row" class="gt_row gt_right gt_stub">0.5000</th>
      <td headers="0 to 1 stub_1_7 low" class="gt_row gt_right">1/2</td>
      <td headers="0 to 1 stub_1_7 med" class="gt_row gt_right">1/2</td>
      <td headers="0 to 1 stub_1_7 high" class="gt_row gt_right">1/2</td>
      <td headers="0 to 1 stub_1_7 halves" class="gt_row gt_right">1/2</td>
      <td headers="0 to 1 stub_1_7 quarters" class="gt_row gt_right">2/4</td>
      <td headers="0 to 1 stub_1_7 eighths" class="gt_row gt_right">4/8</td>
      <td headers="0 to 1 stub_1_7 sixteenths" class="gt_row gt_right">8/16</td>
      <td headers="0 to 1 stub_1_7 hundredths" class="gt_row gt_right">50/100</td></tr>
          <tr><th id="stub_1_8" scope="row" class="gt_row gt_right gt_stub">0.6000</th>
      <td headers="0 to 1 stub_1_8 low" class="gt_row gt_right">3/5</td>
      <td headers="0 to 1 stub_1_8 med" class="gt_row gt_right">3/5</td>
      <td headers="0 to 1 stub_1_8 high" class="gt_row gt_right">3/5</td>
      <td headers="0 to 1 stub_1_8 halves" class="gt_row gt_right">1/2</td>
      <td headers="0 to 1 stub_1_8 quarters" class="gt_row gt_right">2/4</td>
      <td headers="0 to 1 stub_1_8 eighths" class="gt_row gt_right">5/8</td>
      <td headers="0 to 1 stub_1_8 sixteenths" class="gt_row gt_right">10/16</td>
      <td headers="0 to 1 stub_1_8 hundredths" class="gt_row gt_right">60/100</td></tr>
          <tr><th id="stub_1_9" scope="row" class="gt_row gt_right gt_stub">0.7500</th>
      <td headers="0 to 1 stub_1_9 low" class="gt_row gt_right">3/4</td>
      <td headers="0 to 1 stub_1_9 med" class="gt_row gt_right">3/4</td>
      <td headers="0 to 1 stub_1_9 high" class="gt_row gt_right">3/4</td>
      <td headers="0 to 1 stub_1_9 halves" class="gt_row gt_right">1</td>
      <td headers="0 to 1 stub_1_9 quarters" class="gt_row gt_right">3/4</td>
      <td headers="0 to 1 stub_1_9 eighths" class="gt_row gt_right">6/8</td>
      <td headers="0 to 1 stub_1_9 sixteenths" class="gt_row gt_right">12/16</td>
      <td headers="0 to 1 stub_1_9 hundredths" class="gt_row gt_right">75/100</td></tr>
          <tr><th id="stub_1_10" scope="row" class="gt_row gt_right gt_stub">0.9000</th>
      <td headers="0 to 1 stub_1_10 low" class="gt_row gt_right">8/9</td>
      <td headers="0 to 1 stub_1_10 med" class="gt_row gt_right">9/10</td>
      <td headers="0 to 1 stub_1_10 high" class="gt_row gt_right">9/10</td>
      <td headers="0 to 1 stub_1_10 halves" class="gt_row gt_right">1</td>
      <td headers="0 to 1 stub_1_10 quarters" class="gt_row gt_right">1</td>
      <td headers="0 to 1 stub_1_10 eighths" class="gt_row gt_right">7/8</td>
      <td headers="0 to 1 stub_1_10 sixteenths" class="gt_row gt_right">14/16</td>
      <td headers="0 to 1 stub_1_10 hundredths" class="gt_row gt_right">90/100</td></tr>
          <tr><th id="stub_1_11" scope="row" class="gt_row gt_right gt_stub">0.9900</th>
      <td headers="0 to 1 stub_1_11 low" class="gt_row gt_right">1</td>
      <td headers="0 to 1 stub_1_11 med" class="gt_row gt_right">98/99</td>
      <td headers="0 to 1 stub_1_11 high" class="gt_row gt_right">99/100</td>
      <td headers="0 to 1 stub_1_11 halves" class="gt_row gt_right">1</td>
      <td headers="0 to 1 stub_1_11 quarters" class="gt_row gt_right">1</td>
      <td headers="0 to 1 stub_1_11 eighths" class="gt_row gt_right">1</td>
      <td headers="0 to 1 stub_1_11 sixteenths" class="gt_row gt_right">1</td>
      <td headers="0 to 1 stub_1_11 hundredths" class="gt_row gt_right">99/100</td></tr>
          <tr><th id="stub_1_12" scope="row" class="gt_row gt_right gt_stub">0.9990</th>
      <td headers="0 to 1 stub_1_12 low" class="gt_row gt_right">1</td>
      <td headers="0 to 1 stub_1_12 med" class="gt_row gt_right">1</td>
      <td headers="0 to 1 stub_1_12 high" class="gt_row gt_right">998/999</td>
      <td headers="0 to 1 stub_1_12 halves" class="gt_row gt_right">1</td>
      <td headers="0 to 1 stub_1_12 quarters" class="gt_row gt_right">1</td>
      <td headers="0 to 1 stub_1_12 eighths" class="gt_row gt_right">1</td>
      <td headers="0 to 1 stub_1_12 sixteenths" class="gt_row gt_right">1</td>
      <td headers="0 to 1 stub_1_12 hundredths" class="gt_row gt_right">1</td></tr>
          <tr><th id="stub_1_13" scope="row" class="gt_row gt_right gt_stub">0.9999</th>
      <td headers="0 to 1 stub_1_13 low" class="gt_row gt_right">1</td>
      <td headers="0 to 1 stub_1_13 med" class="gt_row gt_right">1</td>
      <td headers="0 to 1 stub_1_13 high" class="gt_row gt_right">1</td>
      <td headers="0 to 1 stub_1_13 halves" class="gt_row gt_right">1</td>
      <td headers="0 to 1 stub_1_13 quarters" class="gt_row gt_right">1</td>
      <td headers="0 to 1 stub_1_13 eighths" class="gt_row gt_right">1</td>
      <td headers="0 to 1 stub_1_13 sixteenths" class="gt_row gt_right">1</td>
      <td headers="0 to 1 stub_1_13 hundredths" class="gt_row gt_right">1</td></tr>
          <tr class="gt_group_heading_row">
            <th colspan="9" class="gt_group_heading" scope="colgroup" id="0 to -1">0 to -1</th>
          </tr>
          <tr class="gt_row_group_first"><th id="stub_1_14" scope="row" class="gt_row gt_right gt_stub">-0.0001</th>
      <td headers="0 to -1 stub_1_14 low" class="gt_row gt_right">0</td>
      <td headers="0 to -1 stub_1_14 med" class="gt_row gt_right">0</td>
      <td headers="0 to -1 stub_1_14 high" class="gt_row gt_right">0</td>
      <td headers="0 to -1 stub_1_14 halves" class="gt_row gt_right">0</td>
      <td headers="0 to -1 stub_1_14 quarters" class="gt_row gt_right">0</td>
      <td headers="0 to -1 stub_1_14 eighths" class="gt_row gt_right">0</td>
      <td headers="0 to -1 stub_1_14 sixteenths" class="gt_row gt_right">0</td>
      <td headers="0 to -1 stub_1_14 hundredths" class="gt_row gt_right">0</td></tr>
          <tr><th id="stub_1_15" scope="row" class="gt_row gt_right gt_stub">-0.0010</th>
      <td headers="0 to -1 stub_1_15 low" class="gt_row gt_right">0</td>
      <td headers="0 to -1 stub_1_15 med" class="gt_row gt_right">0</td>
      <td headers="0 to -1 stub_1_15 high" class="gt_row gt_right">−1/999</td>
      <td headers="0 to -1 stub_1_15 halves" class="gt_row gt_right">0</td>
      <td headers="0 to -1 stub_1_15 quarters" class="gt_row gt_right">0</td>
      <td headers="0 to -1 stub_1_15 eighths" class="gt_row gt_right">0</td>
      <td headers="0 to -1 stub_1_15 sixteenths" class="gt_row gt_right">0</td>
      <td headers="0 to -1 stub_1_15 hundredths" class="gt_row gt_right">0</td></tr>
          <tr><th id="stub_1_16" scope="row" class="gt_row gt_right gt_stub">-0.0100</th>
      <td headers="0 to -1 stub_1_16 low" class="gt_row gt_right">0</td>
      <td headers="0 to -1 stub_1_16 med" class="gt_row gt_right">−1/99</td>
      <td headers="0 to -1 stub_1_16 high" class="gt_row gt_right">−1/100</td>
      <td headers="0 to -1 stub_1_16 halves" class="gt_row gt_right">0</td>
      <td headers="0 to -1 stub_1_16 quarters" class="gt_row gt_right">0</td>
      <td headers="0 to -1 stub_1_16 eighths" class="gt_row gt_right">0</td>
      <td headers="0 to -1 stub_1_16 sixteenths" class="gt_row gt_right">0</td>
      <td headers="0 to -1 stub_1_16 hundredths" class="gt_row gt_right">−1/100</td></tr>
          <tr><th id="stub_1_17" scope="row" class="gt_row gt_right gt_stub">-0.1000</th>
      <td headers="0 to -1 stub_1_17 low" class="gt_row gt_right">−1/9</td>
      <td headers="0 to -1 stub_1_17 med" class="gt_row gt_right">−1/10</td>
      <td headers="0 to -1 stub_1_17 high" class="gt_row gt_right">−1/10</td>
      <td headers="0 to -1 stub_1_17 halves" class="gt_row gt_right">0</td>
      <td headers="0 to -1 stub_1_17 quarters" class="gt_row gt_right">0</td>
      <td headers="0 to -1 stub_1_17 eighths" class="gt_row gt_right">−1/8</td>
      <td headers="0 to -1 stub_1_17 sixteenths" class="gt_row gt_right">−2/16</td>
      <td headers="0 to -1 stub_1_17 hundredths" class="gt_row gt_right">−10/100</td></tr>
          <tr><th id="stub_1_18" scope="row" class="gt_row gt_right gt_stub">-0.2500</th>
      <td headers="0 to -1 stub_1_18 low" class="gt_row gt_right">−1/4</td>
      <td headers="0 to -1 stub_1_18 med" class="gt_row gt_right">−1/4</td>
      <td headers="0 to -1 stub_1_18 high" class="gt_row gt_right">−1/4</td>
      <td headers="0 to -1 stub_1_18 halves" class="gt_row gt_right">−1/2</td>
      <td headers="0 to -1 stub_1_18 quarters" class="gt_row gt_right">−1/4</td>
      <td headers="0 to -1 stub_1_18 eighths" class="gt_row gt_right">−2/8</td>
      <td headers="0 to -1 stub_1_18 sixteenths" class="gt_row gt_right">−4/16</td>
      <td headers="0 to -1 stub_1_18 hundredths" class="gt_row gt_right">−25/100</td></tr>
          <tr><th id="stub_1_19" scope="row" class="gt_row gt_right gt_stub">-0.4000</th>
      <td headers="0 to -1 stub_1_19 low" class="gt_row gt_right">−2/5</td>
      <td headers="0 to -1 stub_1_19 med" class="gt_row gt_right">−2/5</td>
      <td headers="0 to -1 stub_1_19 high" class="gt_row gt_right">−2/5</td>
      <td headers="0 to -1 stub_1_19 halves" class="gt_row gt_right">−1/2</td>
      <td headers="0 to -1 stub_1_19 quarters" class="gt_row gt_right">−2/4</td>
      <td headers="0 to -1 stub_1_19 eighths" class="gt_row gt_right">−3/8</td>
      <td headers="0 to -1 stub_1_19 sixteenths" class="gt_row gt_right">−6/16</td>
      <td headers="0 to -1 stub_1_19 hundredths" class="gt_row gt_right">−40/100</td></tr>
          <tr><th id="stub_1_20" scope="row" class="gt_row gt_right gt_stub">-0.5000</th>
      <td headers="0 to -1 stub_1_20 low" class="gt_row gt_right">−1/2</td>
      <td headers="0 to -1 stub_1_20 med" class="gt_row gt_right">−1/2</td>
      <td headers="0 to -1 stub_1_20 high" class="gt_row gt_right">−1/2</td>
      <td headers="0 to -1 stub_1_20 halves" class="gt_row gt_right">−1/2</td>
      <td headers="0 to -1 stub_1_20 quarters" class="gt_row gt_right">−2/4</td>
      <td headers="0 to -1 stub_1_20 eighths" class="gt_row gt_right">−4/8</td>
      <td headers="0 to -1 stub_1_20 sixteenths" class="gt_row gt_right">−8/16</td>
      <td headers="0 to -1 stub_1_20 hundredths" class="gt_row gt_right">−50/100</td></tr>
          <tr><th id="stub_1_21" scope="row" class="gt_row gt_right gt_stub">-0.6000</th>
      <td headers="0 to -1 stub_1_21 low" class="gt_row gt_right">−3/5</td>
      <td headers="0 to -1 stub_1_21 med" class="gt_row gt_right">−3/5</td>
      <td headers="0 to -1 stub_1_21 high" class="gt_row gt_right">−3/5</td>
      <td headers="0 to -1 stub_1_21 halves" class="gt_row gt_right">−1/2</td>
      <td headers="0 to -1 stub_1_21 quarters" class="gt_row gt_right">−2/4</td>
      <td headers="0 to -1 stub_1_21 eighths" class="gt_row gt_right">−5/8</td>
      <td headers="0 to -1 stub_1_21 sixteenths" class="gt_row gt_right">−10/16</td>
      <td headers="0 to -1 stub_1_21 hundredths" class="gt_row gt_right">−60/100</td></tr>
          <tr><th id="stub_1_22" scope="row" class="gt_row gt_right gt_stub">-0.7500</th>
      <td headers="0 to -1 stub_1_22 low" class="gt_row gt_right">−3/4</td>
      <td headers="0 to -1 stub_1_22 med" class="gt_row gt_right">−3/4</td>
      <td headers="0 to -1 stub_1_22 high" class="gt_row gt_right">−3/4</td>
      <td headers="0 to -1 stub_1_22 halves" class="gt_row gt_right">−1</td>
      <td headers="0 to -1 stub_1_22 quarters" class="gt_row gt_right">−3/4</td>
      <td headers="0 to -1 stub_1_22 eighths" class="gt_row gt_right">−6/8</td>
      <td headers="0 to -1 stub_1_22 sixteenths" class="gt_row gt_right">−12/16</td>
      <td headers="0 to -1 stub_1_22 hundredths" class="gt_row gt_right">−75/100</td></tr>
          <tr><th id="stub_1_23" scope="row" class="gt_row gt_right gt_stub">-0.9000</th>
      <td headers="0 to -1 stub_1_23 low" class="gt_row gt_right">−8/9</td>
      <td headers="0 to -1 stub_1_23 med" class="gt_row gt_right">−9/10</td>
      <td headers="0 to -1 stub_1_23 high" class="gt_row gt_right">−9/10</td>
      <td headers="0 to -1 stub_1_23 halves" class="gt_row gt_right">−1</td>
      <td headers="0 to -1 stub_1_23 quarters" class="gt_row gt_right">−1</td>
      <td headers="0 to -1 stub_1_23 eighths" class="gt_row gt_right">−7/8</td>
      <td headers="0 to -1 stub_1_23 sixteenths" class="gt_row gt_right">−14/16</td>
      <td headers="0 to -1 stub_1_23 hundredths" class="gt_row gt_right">−90/100</td></tr>
          <tr><th id="stub_1_24" scope="row" class="gt_row gt_right gt_stub">-0.9900</th>
      <td headers="0 to -1 stub_1_24 low" class="gt_row gt_right">−1</td>
      <td headers="0 to -1 stub_1_24 med" class="gt_row gt_right">−98/99</td>
      <td headers="0 to -1 stub_1_24 high" class="gt_row gt_right">−99/100</td>
      <td headers="0 to -1 stub_1_24 halves" class="gt_row gt_right">−1</td>
      <td headers="0 to -1 stub_1_24 quarters" class="gt_row gt_right">−1</td>
      <td headers="0 to -1 stub_1_24 eighths" class="gt_row gt_right">−1</td>
      <td headers="0 to -1 stub_1_24 sixteenths" class="gt_row gt_right">−1</td>
      <td headers="0 to -1 stub_1_24 hundredths" class="gt_row gt_right">−99/100</td></tr>
          <tr><th id="stub_1_25" scope="row" class="gt_row gt_right gt_stub">-0.9990</th>
      <td headers="0 to -1 stub_1_25 low" class="gt_row gt_right">−1</td>
      <td headers="0 to -1 stub_1_25 med" class="gt_row gt_right">−1</td>
      <td headers="0 to -1 stub_1_25 high" class="gt_row gt_right">−998/999</td>
      <td headers="0 to -1 stub_1_25 halves" class="gt_row gt_right">−1</td>
      <td headers="0 to -1 stub_1_25 quarters" class="gt_row gt_right">−1</td>
      <td headers="0 to -1 stub_1_25 eighths" class="gt_row gt_right">−1</td>
      <td headers="0 to -1 stub_1_25 sixteenths" class="gt_row gt_right">−1</td>
      <td headers="0 to -1 stub_1_25 hundredths" class="gt_row gt_right">−1</td></tr>
          <tr><th id="stub_1_26" scope="row" class="gt_row gt_right gt_stub">-0.9999</th>
      <td headers="0 to -1 stub_1_26 low" class="gt_row gt_right">−1</td>
      <td headers="0 to -1 stub_1_26 med" class="gt_row gt_right">−1</td>
      <td headers="0 to -1 stub_1_26 high" class="gt_row gt_right">−1</td>
      <td headers="0 to -1 stub_1_26 halves" class="gt_row gt_right">−1</td>
      <td headers="0 to -1 stub_1_26 quarters" class="gt_row gt_right">−1</td>
      <td headers="0 to -1 stub_1_26 eighths" class="gt_row gt_right">−1</td>
      <td headers="0 to -1 stub_1_26 sixteenths" class="gt_row gt_right">−1</td>
      <td headers="0 to -1 stub_1_26 hundredths" class="gt_row gt_right">−1</td></tr>
          <tr class="gt_group_heading_row">
            <th colspan="9" class="gt_group_heading" scope="colgroup" id="1 to 2">1 to 2</th>
          </tr>
          <tr class="gt_row_group_first"><th id="stub_1_27" scope="row" class="gt_row gt_right gt_stub">1.0001</th>
      <td headers="1 to 2 stub_1_27 low" class="gt_row gt_right">1</td>
      <td headers="1 to 2 stub_1_27 med" class="gt_row gt_right">1</td>
      <td headers="1 to 2 stub_1_27 high" class="gt_row gt_right">1</td>
      <td headers="1 to 2 stub_1_27 halves" class="gt_row gt_right">1</td>
      <td headers="1 to 2 stub_1_27 quarters" class="gt_row gt_right">1</td>
      <td headers="1 to 2 stub_1_27 eighths" class="gt_row gt_right">1</td>
      <td headers="1 to 2 stub_1_27 sixteenths" class="gt_row gt_right">1</td>
      <td headers="1 to 2 stub_1_27 hundredths" class="gt_row gt_right">1</td></tr>
          <tr><th id="stub_1_28" scope="row" class="gt_row gt_right gt_stub">1.0010</th>
      <td headers="1 to 2 stub_1_28 low" class="gt_row gt_right">1</td>
      <td headers="1 to 2 stub_1_28 med" class="gt_row gt_right">1</td>
      <td headers="1 to 2 stub_1_28 high" class="gt_row gt_right">1 1/999</td>
      <td headers="1 to 2 stub_1_28 halves" class="gt_row gt_right">1</td>
      <td headers="1 to 2 stub_1_28 quarters" class="gt_row gt_right">1</td>
      <td headers="1 to 2 stub_1_28 eighths" class="gt_row gt_right">1</td>
      <td headers="1 to 2 stub_1_28 sixteenths" class="gt_row gt_right">1</td>
      <td headers="1 to 2 stub_1_28 hundredths" class="gt_row gt_right">1</td></tr>
          <tr><th id="stub_1_29" scope="row" class="gt_row gt_right gt_stub">1.0100</th>
      <td headers="1 to 2 stub_1_29 low" class="gt_row gt_right">1</td>
      <td headers="1 to 2 stub_1_29 med" class="gt_row gt_right">1 1/99</td>
      <td headers="1 to 2 stub_1_29 high" class="gt_row gt_right">1 1/100</td>
      <td headers="1 to 2 stub_1_29 halves" class="gt_row gt_right">1</td>
      <td headers="1 to 2 stub_1_29 quarters" class="gt_row gt_right">1</td>
      <td headers="1 to 2 stub_1_29 eighths" class="gt_row gt_right">1</td>
      <td headers="1 to 2 stub_1_29 sixteenths" class="gt_row gt_right">1</td>
      <td headers="1 to 2 stub_1_29 hundredths" class="gt_row gt_right">1 1/100</td></tr>
          <tr><th id="stub_1_30" scope="row" class="gt_row gt_right gt_stub">1.1000</th>
      <td headers="1 to 2 stub_1_30 low" class="gt_row gt_right">1 1/9</td>
      <td headers="1 to 2 stub_1_30 med" class="gt_row gt_right">1 1/10</td>
      <td headers="1 to 2 stub_1_30 high" class="gt_row gt_right">1 1/10</td>
      <td headers="1 to 2 stub_1_30 halves" class="gt_row gt_right">1</td>
      <td headers="1 to 2 stub_1_30 quarters" class="gt_row gt_right">1</td>
      <td headers="1 to 2 stub_1_30 eighths" class="gt_row gt_right">1 1/8</td>
      <td headers="1 to 2 stub_1_30 sixteenths" class="gt_row gt_right">1 2/16</td>
      <td headers="1 to 2 stub_1_30 hundredths" class="gt_row gt_right">1 10/100</td></tr>
          <tr><th id="stub_1_31" scope="row" class="gt_row gt_right gt_stub">1.2500</th>
      <td headers="1 to 2 stub_1_31 low" class="gt_row gt_right">1 1/4</td>
      <td headers="1 to 2 stub_1_31 med" class="gt_row gt_right">1 1/4</td>
      <td headers="1 to 2 stub_1_31 high" class="gt_row gt_right">1 1/4</td>
      <td headers="1 to 2 stub_1_31 halves" class="gt_row gt_right">1 1/2</td>
      <td headers="1 to 2 stub_1_31 quarters" class="gt_row gt_right">1 1/4</td>
      <td headers="1 to 2 stub_1_31 eighths" class="gt_row gt_right">1 2/8</td>
      <td headers="1 to 2 stub_1_31 sixteenths" class="gt_row gt_right">1 4/16</td>
      <td headers="1 to 2 stub_1_31 hundredths" class="gt_row gt_right">1 25/100</td></tr>
          <tr><th id="stub_1_32" scope="row" class="gt_row gt_right gt_stub">1.4000</th>
      <td headers="1 to 2 stub_1_32 low" class="gt_row gt_right">1 2/5</td>
      <td headers="1 to 2 stub_1_32 med" class="gt_row gt_right">1 2/5</td>
      <td headers="1 to 2 stub_1_32 high" class="gt_row gt_right">1 2/5</td>
      <td headers="1 to 2 stub_1_32 halves" class="gt_row gt_right">1 1/2</td>
      <td headers="1 to 2 stub_1_32 quarters" class="gt_row gt_right">1 2/4</td>
      <td headers="1 to 2 stub_1_32 eighths" class="gt_row gt_right">1 3/8</td>
      <td headers="1 to 2 stub_1_32 sixteenths" class="gt_row gt_right">1 6/16</td>
      <td headers="1 to 2 stub_1_32 hundredths" class="gt_row gt_right">1 40/100</td></tr>
          <tr><th id="stub_1_33" scope="row" class="gt_row gt_right gt_stub">1.5000</th>
      <td headers="1 to 2 stub_1_33 low" class="gt_row gt_right">1 1/2</td>
      <td headers="1 to 2 stub_1_33 med" class="gt_row gt_right">1 1/2</td>
      <td headers="1 to 2 stub_1_33 high" class="gt_row gt_right">1 1/2</td>
      <td headers="1 to 2 stub_1_33 halves" class="gt_row gt_right">1 1/2</td>
      <td headers="1 to 2 stub_1_33 quarters" class="gt_row gt_right">1 2/4</td>
      <td headers="1 to 2 stub_1_33 eighths" class="gt_row gt_right">1 4/8</td>
      <td headers="1 to 2 stub_1_33 sixteenths" class="gt_row gt_right">1 8/16</td>
      <td headers="1 to 2 stub_1_33 hundredths" class="gt_row gt_right">1 50/100</td></tr>
          <tr><th id="stub_1_34" scope="row" class="gt_row gt_right gt_stub">1.6000</th>
      <td headers="1 to 2 stub_1_34 low" class="gt_row gt_right">1 3/5</td>
      <td headers="1 to 2 stub_1_34 med" class="gt_row gt_right">1 3/5</td>
      <td headers="1 to 2 stub_1_34 high" class="gt_row gt_right">1 3/5</td>
      <td headers="1 to 2 stub_1_34 halves" class="gt_row gt_right">1 1/2</td>
      <td headers="1 to 2 stub_1_34 quarters" class="gt_row gt_right">1 2/4</td>
      <td headers="1 to 2 stub_1_34 eighths" class="gt_row gt_right">1 5/8</td>
      <td headers="1 to 2 stub_1_34 sixteenths" class="gt_row gt_right">1 10/16</td>
      <td headers="1 to 2 stub_1_34 hundredths" class="gt_row gt_right">1 60/100</td></tr>
          <tr><th id="stub_1_35" scope="row" class="gt_row gt_right gt_stub">1.7500</th>
      <td headers="1 to 2 stub_1_35 low" class="gt_row gt_right">1 3/4</td>
      <td headers="1 to 2 stub_1_35 med" class="gt_row gt_right">1 3/4</td>
      <td headers="1 to 2 stub_1_35 high" class="gt_row gt_right">1 3/4</td>
      <td headers="1 to 2 stub_1_35 halves" class="gt_row gt_right">2</td>
      <td headers="1 to 2 stub_1_35 quarters" class="gt_row gt_right">1 3/4</td>
      <td headers="1 to 2 stub_1_35 eighths" class="gt_row gt_right">1 6/8</td>
      <td headers="1 to 2 stub_1_35 sixteenths" class="gt_row gt_right">1 12/16</td>
      <td headers="1 to 2 stub_1_35 hundredths" class="gt_row gt_right">1 75/100</td></tr>
          <tr><th id="stub_1_36" scope="row" class="gt_row gt_right gt_stub">1.9000</th>
      <td headers="1 to 2 stub_1_36 low" class="gt_row gt_right">1 8/9</td>
      <td headers="1 to 2 stub_1_36 med" class="gt_row gt_right">1 9/10</td>
      <td headers="1 to 2 stub_1_36 high" class="gt_row gt_right">1 9/10</td>
      <td headers="1 to 2 stub_1_36 halves" class="gt_row gt_right">2</td>
      <td headers="1 to 2 stub_1_36 quarters" class="gt_row gt_right">2</td>
      <td headers="1 to 2 stub_1_36 eighths" class="gt_row gt_right">1 7/8</td>
      <td headers="1 to 2 stub_1_36 sixteenths" class="gt_row gt_right">1 14/16</td>
      <td headers="1 to 2 stub_1_36 hundredths" class="gt_row gt_right">1 90/100</td></tr>
          <tr><th id="stub_1_37" scope="row" class="gt_row gt_right gt_stub">1.9900</th>
      <td headers="1 to 2 stub_1_37 low" class="gt_row gt_right">2</td>
      <td headers="1 to 2 stub_1_37 med" class="gt_row gt_right">1 98/99</td>
      <td headers="1 to 2 stub_1_37 high" class="gt_row gt_right">1 99/100</td>
      <td headers="1 to 2 stub_1_37 halves" class="gt_row gt_right">2</td>
      <td headers="1 to 2 stub_1_37 quarters" class="gt_row gt_right">2</td>
      <td headers="1 to 2 stub_1_37 eighths" class="gt_row gt_right">2</td>
      <td headers="1 to 2 stub_1_37 sixteenths" class="gt_row gt_right">2</td>
      <td headers="1 to 2 stub_1_37 hundredths" class="gt_row gt_right">1 99/100</td></tr>
          <tr><th id="stub_1_38" scope="row" class="gt_row gt_right gt_stub">1.9990</th>
      <td headers="1 to 2 stub_1_38 low" class="gt_row gt_right">2</td>
      <td headers="1 to 2 stub_1_38 med" class="gt_row gt_right">2</td>
      <td headers="1 to 2 stub_1_38 high" class="gt_row gt_right">1 998/999</td>
      <td headers="1 to 2 stub_1_38 halves" class="gt_row gt_right">2</td>
      <td headers="1 to 2 stub_1_38 quarters" class="gt_row gt_right">2</td>
      <td headers="1 to 2 stub_1_38 eighths" class="gt_row gt_right">2</td>
      <td headers="1 to 2 stub_1_38 sixteenths" class="gt_row gt_right">2</td>
      <td headers="1 to 2 stub_1_38 hundredths" class="gt_row gt_right">2</td></tr>
          <tr><th id="stub_1_39" scope="row" class="gt_row gt_right gt_stub">1.9999</th>
      <td headers="1 to 2 stub_1_39 low" class="gt_row gt_right">2</td>
      <td headers="1 to 2 stub_1_39 med" class="gt_row gt_right">2</td>
      <td headers="1 to 2 stub_1_39 high" class="gt_row gt_right">2</td>
      <td headers="1 to 2 stub_1_39 halves" class="gt_row gt_right">2</td>
      <td headers="1 to 2 stub_1_39 quarters" class="gt_row gt_right">2</td>
      <td headers="1 to 2 stub_1_39 eighths" class="gt_row gt_right">2</td>
      <td headers="1 to 2 stub_1_39 sixteenths" class="gt_row gt_right">2</td>
      <td headers="1 to 2 stub_1_39 hundredths" class="gt_row gt_right">2</td></tr>
          <tr class="gt_group_heading_row">
            <th colspan="9" class="gt_group_heading" scope="colgroup" id="-1 to -2">-1 to -2</th>
          </tr>
          <tr class="gt_row_group_first"><th id="stub_1_40" scope="row" class="gt_row gt_right gt_stub">-1.0001</th>
      <td headers="-1 to -2 stub_1_40 low" class="gt_row gt_right">−1</td>
      <td headers="-1 to -2 stub_1_40 med" class="gt_row gt_right">−1</td>
      <td headers="-1 to -2 stub_1_40 high" class="gt_row gt_right">−1</td>
      <td headers="-1 to -2 stub_1_40 halves" class="gt_row gt_right">−1</td>
      <td headers="-1 to -2 stub_1_40 quarters" class="gt_row gt_right">−1</td>
      <td headers="-1 to -2 stub_1_40 eighths" class="gt_row gt_right">−1</td>
      <td headers="-1 to -2 stub_1_40 sixteenths" class="gt_row gt_right">−1</td>
      <td headers="-1 to -2 stub_1_40 hundredths" class="gt_row gt_right">−1</td></tr>
          <tr><th id="stub_1_41" scope="row" class="gt_row gt_right gt_stub">-1.0010</th>
      <td headers="-1 to -2 stub_1_41 low" class="gt_row gt_right">−1</td>
      <td headers="-1 to -2 stub_1_41 med" class="gt_row gt_right">−1</td>
      <td headers="-1 to -2 stub_1_41 high" class="gt_row gt_right">−1 1/999</td>
      <td headers="-1 to -2 stub_1_41 halves" class="gt_row gt_right">−1</td>
      <td headers="-1 to -2 stub_1_41 quarters" class="gt_row gt_right">−1</td>
      <td headers="-1 to -2 stub_1_41 eighths" class="gt_row gt_right">−1</td>
      <td headers="-1 to -2 stub_1_41 sixteenths" class="gt_row gt_right">−1</td>
      <td headers="-1 to -2 stub_1_41 hundredths" class="gt_row gt_right">−1</td></tr>
          <tr><th id="stub_1_42" scope="row" class="gt_row gt_right gt_stub">-1.0100</th>
      <td headers="-1 to -2 stub_1_42 low" class="gt_row gt_right">−1</td>
      <td headers="-1 to -2 stub_1_42 med" class="gt_row gt_right">−1 1/99</td>
      <td headers="-1 to -2 stub_1_42 high" class="gt_row gt_right">−1 1/100</td>
      <td headers="-1 to -2 stub_1_42 halves" class="gt_row gt_right">−1</td>
      <td headers="-1 to -2 stub_1_42 quarters" class="gt_row gt_right">−1</td>
      <td headers="-1 to -2 stub_1_42 eighths" class="gt_row gt_right">−1</td>
      <td headers="-1 to -2 stub_1_42 sixteenths" class="gt_row gt_right">−1</td>
      <td headers="-1 to -2 stub_1_42 hundredths" class="gt_row gt_right">−1 1/100</td></tr>
          <tr><th id="stub_1_43" scope="row" class="gt_row gt_right gt_stub">-1.1000</th>
      <td headers="-1 to -2 stub_1_43 low" class="gt_row gt_right">−1 1/9</td>
      <td headers="-1 to -2 stub_1_43 med" class="gt_row gt_right">−1 1/10</td>
      <td headers="-1 to -2 stub_1_43 high" class="gt_row gt_right">−1 1/10</td>
      <td headers="-1 to -2 stub_1_43 halves" class="gt_row gt_right">−1</td>
      <td headers="-1 to -2 stub_1_43 quarters" class="gt_row gt_right">−1</td>
      <td headers="-1 to -2 stub_1_43 eighths" class="gt_row gt_right">−1 1/8</td>
      <td headers="-1 to -2 stub_1_43 sixteenths" class="gt_row gt_right">−1 2/16</td>
      <td headers="-1 to -2 stub_1_43 hundredths" class="gt_row gt_right">−1 10/100</td></tr>
          <tr><th id="stub_1_44" scope="row" class="gt_row gt_right gt_stub">-1.2500</th>
      <td headers="-1 to -2 stub_1_44 low" class="gt_row gt_right">−1 1/4</td>
      <td headers="-1 to -2 stub_1_44 med" class="gt_row gt_right">−1 1/4</td>
      <td headers="-1 to -2 stub_1_44 high" class="gt_row gt_right">−1 1/4</td>
      <td headers="-1 to -2 stub_1_44 halves" class="gt_row gt_right">−1 1/2</td>
      <td headers="-1 to -2 stub_1_44 quarters" class="gt_row gt_right">−1 1/4</td>
      <td headers="-1 to -2 stub_1_44 eighths" class="gt_row gt_right">−1 2/8</td>
      <td headers="-1 to -2 stub_1_44 sixteenths" class="gt_row gt_right">−1 4/16</td>
      <td headers="-1 to -2 stub_1_44 hundredths" class="gt_row gt_right">−1 25/100</td></tr>
          <tr><th id="stub_1_45" scope="row" class="gt_row gt_right gt_stub">-1.4000</th>
      <td headers="-1 to -2 stub_1_45 low" class="gt_row gt_right">−1 2/5</td>
      <td headers="-1 to -2 stub_1_45 med" class="gt_row gt_right">−1 2/5</td>
      <td headers="-1 to -2 stub_1_45 high" class="gt_row gt_right">−1 2/5</td>
      <td headers="-1 to -2 stub_1_45 halves" class="gt_row gt_right">−1 1/2</td>
      <td headers="-1 to -2 stub_1_45 quarters" class="gt_row gt_right">−1 2/4</td>
      <td headers="-1 to -2 stub_1_45 eighths" class="gt_row gt_right">−1 3/8</td>
      <td headers="-1 to -2 stub_1_45 sixteenths" class="gt_row gt_right">−1 6/16</td>
      <td headers="-1 to -2 stub_1_45 hundredths" class="gt_row gt_right">−1 40/100</td></tr>
          <tr><th id="stub_1_46" scope="row" class="gt_row gt_right gt_stub">-1.5000</th>
      <td headers="-1 to -2 stub_1_46 low" class="gt_row gt_right">−1 1/2</td>
      <td headers="-1 to -2 stub_1_46 med" class="gt_row gt_right">−1 1/2</td>
      <td headers="-1 to -2 stub_1_46 high" class="gt_row gt_right">−1 1/2</td>
      <td headers="-1 to -2 stub_1_46 halves" class="gt_row gt_right">−1 1/2</td>
      <td headers="-1 to -2 stub_1_46 quarters" class="gt_row gt_right">−1 2/4</td>
      <td headers="-1 to -2 stub_1_46 eighths" class="gt_row gt_right">−1 4/8</td>
      <td headers="-1 to -2 stub_1_46 sixteenths" class="gt_row gt_right">−1 8/16</td>
      <td headers="-1 to -2 stub_1_46 hundredths" class="gt_row gt_right">−1 50/100</td></tr>
          <tr><th id="stub_1_47" scope="row" class="gt_row gt_right gt_stub">-1.6000</th>
      <td headers="-1 to -2 stub_1_47 low" class="gt_row gt_right">−1 3/5</td>
      <td headers="-1 to -2 stub_1_47 med" class="gt_row gt_right">−1 3/5</td>
      <td headers="-1 to -2 stub_1_47 high" class="gt_row gt_right">−1 3/5</td>
      <td headers="-1 to -2 stub_1_47 halves" class="gt_row gt_right">−1 1/2</td>
      <td headers="-1 to -2 stub_1_47 quarters" class="gt_row gt_right">−1 2/4</td>
      <td headers="-1 to -2 stub_1_47 eighths" class="gt_row gt_right">−1 5/8</td>
      <td headers="-1 to -2 stub_1_47 sixteenths" class="gt_row gt_right">−1 10/16</td>
      <td headers="-1 to -2 stub_1_47 hundredths" class="gt_row gt_right">−1 60/100</td></tr>
          <tr><th id="stub_1_48" scope="row" class="gt_row gt_right gt_stub">-1.7500</th>
      <td headers="-1 to -2 stub_1_48 low" class="gt_row gt_right">−1 3/4</td>
      <td headers="-1 to -2 stub_1_48 med" class="gt_row gt_right">−1 3/4</td>
      <td headers="-1 to -2 stub_1_48 high" class="gt_row gt_right">−1 3/4</td>
      <td headers="-1 to -2 stub_1_48 halves" class="gt_row gt_right">−2</td>
      <td headers="-1 to -2 stub_1_48 quarters" class="gt_row gt_right">−1 3/4</td>
      <td headers="-1 to -2 stub_1_48 eighths" class="gt_row gt_right">−1 6/8</td>
      <td headers="-1 to -2 stub_1_48 sixteenths" class="gt_row gt_right">−1 12/16</td>
      <td headers="-1 to -2 stub_1_48 hundredths" class="gt_row gt_right">−1 75/100</td></tr>
          <tr><th id="stub_1_49" scope="row" class="gt_row gt_right gt_stub">-1.9000</th>
      <td headers="-1 to -2 stub_1_49 low" class="gt_row gt_right">−1 8/9</td>
      <td headers="-1 to -2 stub_1_49 med" class="gt_row gt_right">−1 9/10</td>
      <td headers="-1 to -2 stub_1_49 high" class="gt_row gt_right">−1 9/10</td>
      <td headers="-1 to -2 stub_1_49 halves" class="gt_row gt_right">−2</td>
      <td headers="-1 to -2 stub_1_49 quarters" class="gt_row gt_right">−2</td>
      <td headers="-1 to -2 stub_1_49 eighths" class="gt_row gt_right">−1 7/8</td>
      <td headers="-1 to -2 stub_1_49 sixteenths" class="gt_row gt_right">−1 14/16</td>
      <td headers="-1 to -2 stub_1_49 hundredths" class="gt_row gt_right">−1 90/100</td></tr>
          <tr><th id="stub_1_50" scope="row" class="gt_row gt_right gt_stub">-1.9900</th>
      <td headers="-1 to -2 stub_1_50 low" class="gt_row gt_right">−2</td>
      <td headers="-1 to -2 stub_1_50 med" class="gt_row gt_right">−1 98/99</td>
      <td headers="-1 to -2 stub_1_50 high" class="gt_row gt_right">−1 99/100</td>
      <td headers="-1 to -2 stub_1_50 halves" class="gt_row gt_right">−2</td>
      <td headers="-1 to -2 stub_1_50 quarters" class="gt_row gt_right">−2</td>
      <td headers="-1 to -2 stub_1_50 eighths" class="gt_row gt_right">−2</td>
      <td headers="-1 to -2 stub_1_50 sixteenths" class="gt_row gt_right">−2</td>
      <td headers="-1 to -2 stub_1_50 hundredths" class="gt_row gt_right">−1 99/100</td></tr>
          <tr><th id="stub_1_51" scope="row" class="gt_row gt_right gt_stub">-1.9990</th>
      <td headers="-1 to -2 stub_1_51 low" class="gt_row gt_right">−2</td>
      <td headers="-1 to -2 stub_1_51 med" class="gt_row gt_right">−2</td>
      <td headers="-1 to -2 stub_1_51 high" class="gt_row gt_right">−1 998/999</td>
      <td headers="-1 to -2 stub_1_51 halves" class="gt_row gt_right">−2</td>
      <td headers="-1 to -2 stub_1_51 quarters" class="gt_row gt_right">−2</td>
      <td headers="-1 to -2 stub_1_51 eighths" class="gt_row gt_right">−2</td>
      <td headers="-1 to -2 stub_1_51 sixteenths" class="gt_row gt_right">−2</td>
      <td headers="-1 to -2 stub_1_51 hundredths" class="gt_row gt_right">−2</td></tr>
          <tr><th id="stub_1_52" scope="row" class="gt_row gt_right gt_stub">-1.9999</th>
      <td headers="-1 to -2 stub_1_52 low" class="gt_row gt_right">−2</td>
      <td headers="-1 to -2 stub_1_52 med" class="gt_row gt_right">−2</td>
      <td headers="-1 to -2 stub_1_52 high" class="gt_row gt_right">−2</td>
      <td headers="-1 to -2 stub_1_52 halves" class="gt_row gt_right">−2</td>
      <td headers="-1 to -2 stub_1_52 quarters" class="gt_row gt_right">−2</td>
      <td headers="-1 to -2 stub_1_52 eighths" class="gt_row gt_right">−2</td>
      <td headers="-1 to -2 stub_1_52 sixteenths" class="gt_row gt_right">−2</td>
      <td headers="-1 to -2 stub_1_52 hundredths" class="gt_row gt_right">−2</td></tr>
          <tr class="gt_group_heading_row">
            <th colspan="9" class="gt_group_heading" scope="colgroup" id="Exact Numbers">Exact Numbers</th>
          </tr>
          <tr class="gt_row_group_first"><th id="stub_1_53" scope="row" class="gt_row gt_right gt_stub">-1.0000</th>
      <td headers="Exact Numbers stub_1_53 low" class="gt_row gt_right">−1</td>
      <td headers="Exact Numbers stub_1_53 med" class="gt_row gt_right">−1</td>
      <td headers="Exact Numbers stub_1_53 high" class="gt_row gt_right">−1</td>
      <td headers="Exact Numbers stub_1_53 halves" class="gt_row gt_right">−1</td>
      <td headers="Exact Numbers stub_1_53 quarters" class="gt_row gt_right">−1</td>
      <td headers="Exact Numbers stub_1_53 eighths" class="gt_row gt_right">−1</td>
      <td headers="Exact Numbers stub_1_53 sixteenths" class="gt_row gt_right">−1</td>
      <td headers="Exact Numbers stub_1_53 hundredths" class="gt_row gt_right">−1</td></tr>
          <tr><th id="stub_1_54" scope="row" class="gt_row gt_right gt_stub">0.0000</th>
      <td headers="Exact Numbers stub_1_54 low" class="gt_row gt_right">0</td>
      <td headers="Exact Numbers stub_1_54 med" class="gt_row gt_right">0</td>
      <td headers="Exact Numbers stub_1_54 high" class="gt_row gt_right">0</td>
      <td headers="Exact Numbers stub_1_54 halves" class="gt_row gt_right">0</td>
      <td headers="Exact Numbers stub_1_54 quarters" class="gt_row gt_right">0</td>
      <td headers="Exact Numbers stub_1_54 eighths" class="gt_row gt_right">0</td>
      <td headers="Exact Numbers stub_1_54 sixteenths" class="gt_row gt_right">0</td>
      <td headers="Exact Numbers stub_1_54 hundredths" class="gt_row gt_right">0</td></tr>
          <tr><th id="stub_1_55" scope="row" class="gt_row gt_right gt_stub">1.0000</th>
      <td headers="Exact Numbers stub_1_55 low" class="gt_row gt_right">1</td>
      <td headers="Exact Numbers stub_1_55 med" class="gt_row gt_right">1</td>
      <td headers="Exact Numbers stub_1_55 high" class="gt_row gt_right">1</td>
      <td headers="Exact Numbers stub_1_55 halves" class="gt_row gt_right">1</td>
      <td headers="Exact Numbers stub_1_55 quarters" class="gt_row gt_right">1</td>
      <td headers="Exact Numbers stub_1_55 eighths" class="gt_row gt_right">1</td>
      <td headers="Exact Numbers stub_1_55 sixteenths" class="gt_row gt_right">1</td>
      <td headers="Exact Numbers stub_1_55 hundredths" class="gt_row gt_right">1</td></tr>
          <tr class="gt_group_heading_row">
            <th colspan="9" class="gt_group_heading" scope="colgroup" id="Not Numbers">Not Numbers</th>
          </tr>
          <tr class="gt_row_group_first"><th id="stub_1_56" scope="row" class="gt_row gt_right gt_stub">NA</th>
      <td headers="Not Numbers stub_1_56 low" class="gt_row gt_right">NA</td>
      <td headers="Not Numbers stub_1_56 med" class="gt_row gt_right">NA</td>
      <td headers="Not Numbers stub_1_56 high" class="gt_row gt_right">NA</td>
      <td headers="Not Numbers stub_1_56 halves" class="gt_row gt_right">NA</td>
      <td headers="Not Numbers stub_1_56 quarters" class="gt_row gt_right">NA</td>
      <td headers="Not Numbers stub_1_56 eighths" class="gt_row gt_right">NA</td>
      <td headers="Not Numbers stub_1_56 sixteenths" class="gt_row gt_right">NA</td>
      <td headers="Not Numbers stub_1_56 hundredths" class="gt_row gt_right">NA</td></tr>
          <tr><th id="stub_1_57" scope="row" class="gt_row gt_right gt_stub">NaN</th>
      <td headers="Not Numbers stub_1_57 low" class="gt_row gt_right">NaN</td>
      <td headers="Not Numbers stub_1_57 med" class="gt_row gt_right">NaN</td>
      <td headers="Not Numbers stub_1_57 high" class="gt_row gt_right">NaN</td>
      <td headers="Not Numbers stub_1_57 halves" class="gt_row gt_right">NaN</td>
      <td headers="Not Numbers stub_1_57 quarters" class="gt_row gt_right">NaN</td>
      <td headers="Not Numbers stub_1_57 eighths" class="gt_row gt_right">NaN</td>
      <td headers="Not Numbers stub_1_57 sixteenths" class="gt_row gt_right">NaN</td>
      <td headers="Not Numbers stub_1_57 hundredths" class="gt_row gt_right">NaN</td></tr>
          <tr><th id="stub_1_58" scope="row" class="gt_row gt_right gt_stub">Inf</th>
      <td headers="Not Numbers stub_1_58 low" class="gt_row gt_right">Inf</td>
      <td headers="Not Numbers stub_1_58 med" class="gt_row gt_right">Inf</td>
      <td headers="Not Numbers stub_1_58 high" class="gt_row gt_right">Inf</td>
      <td headers="Not Numbers stub_1_58 halves" class="gt_row gt_right">Inf</td>
      <td headers="Not Numbers stub_1_58 quarters" class="gt_row gt_right">Inf</td>
      <td headers="Not Numbers stub_1_58 eighths" class="gt_row gt_right">Inf</td>
      <td headers="Not Numbers stub_1_58 sixteenths" class="gt_row gt_right">Inf</td>
      <td headers="Not Numbers stub_1_58 hundredths" class="gt_row gt_right">Inf</td></tr>
          <tr><th id="stub_1_59" scope="row" class="gt_row gt_right gt_stub">-Inf</th>
      <td headers="Not Numbers stub_1_59 low" class="gt_row gt_right">-Inf</td>
      <td headers="Not Numbers stub_1_59 med" class="gt_row gt_right">-Inf</td>
      <td headers="Not Numbers stub_1_59 high" class="gt_row gt_right">-Inf</td>
      <td headers="Not Numbers stub_1_59 halves" class="gt_row gt_right">-Inf</td>
      <td headers="Not Numbers stub_1_59 quarters" class="gt_row gt_right">-Inf</td>
      <td headers="Not Numbers stub_1_59 eighths" class="gt_row gt_right">-Inf</td>
      <td headers="Not Numbers stub_1_59 sixteenths" class="gt_row gt_right">-Inf</td>
      <td headers="Not Numbers stub_1_59 hundredths" class="gt_row gt_right">-Inf</td></tr>
        </tbody>
        
      </table>

---

    Code
      cat(render_as_html(gt_tbl))
    Output
      <table class="gt_table" style="table-layout:fixed;width:0px;" data-quarto-disable-processing="false" data-quarto-bootstrap="false">
        <colgroup>
          <col style="width:100px;"/>
          <col style="width:100px;"/>
          <col style="width:100px;"/>
          <col style="width:100px;"/>
          <col style="width:100px;"/>
          <col style="width:100px;"/>
          <col style="width:100px;"/>
          <col style="width:100px;"/>
          <col style="width:100px;"/>
        </colgroup>
        <thead>
          <tr class="gt_col_headings">
            <th class="gt_col_heading gt_columns_bottom_border gt_left" rowspan="1" colspan="1" scope="col" id="a::stub"></th>
            <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id="low">low</th>
            <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id="med">med</th>
            <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id="high">high</th>
            <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id="halves">halves</th>
            <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id="quarters">quarters</th>
            <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id="eighths">eighths</th>
            <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id="sixteenths">sixteenths</th>
            <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id="hundredths">hundredths</th>
          </tr>
        </thead>
        <tbody class="gt_table_body">
          <tr class="gt_group_heading_row">
            <th colspan="9" class="gt_group_heading" scope="colgroup" id="0 to 1">0 to 1</th>
          </tr>
          <tr class="gt_row_group_first"><th id="stub_1_1" scope="row" class="gt_row gt_right gt_stub">0.0001</th>
      <td headers="0 to 1 stub_1_1 low" class="gt_row gt_right">0</td>
      <td headers="0 to 1 stub_1_1 med" class="gt_row gt_right">0</td>
      <td headers="0 to 1 stub_1_1 high" class="gt_row gt_right">0</td>
      <td headers="0 to 1 stub_1_1 halves" class="gt_row gt_right">0</td>
      <td headers="0 to 1 stub_1_1 quarters" class="gt_row gt_right">0</td>
      <td headers="0 to 1 stub_1_1 eighths" class="gt_row gt_right">0</td>
      <td headers="0 to 1 stub_1_1 sixteenths" class="gt_row gt_right">0</td>
      <td headers="0 to 1 stub_1_1 hundredths" class="gt_row gt_right">0</td></tr>
          <tr><th id="stub_1_2" scope="row" class="gt_row gt_right gt_stub">0.0010</th>
      <td headers="0 to 1 stub_1_2 low" class="gt_row gt_right">0</td>
      <td headers="0 to 1 stub_1_2 med" class="gt_row gt_right">0</td>
      <td headers="0 to 1 stub_1_2 high" class="gt_row gt_right">1/999</td>
      <td headers="0 to 1 stub_1_2 halves" class="gt_row gt_right">0</td>
      <td headers="0 to 1 stub_1_2 quarters" class="gt_row gt_right">0</td>
      <td headers="0 to 1 stub_1_2 eighths" class="gt_row gt_right">0</td>
      <td headers="0 to 1 stub_1_2 sixteenths" class="gt_row gt_right">0</td>
      <td headers="0 to 1 stub_1_2 hundredths" class="gt_row gt_right">0</td></tr>
          <tr><th id="stub_1_3" scope="row" class="gt_row gt_right gt_stub">0.0100</th>
      <td headers="0 to 1 stub_1_3 low" class="gt_row gt_right">0</td>
      <td headers="0 to 1 stub_1_3 med" class="gt_row gt_right">1/99</td>
      <td headers="0 to 1 stub_1_3 high" class="gt_row gt_right">1/100</td>
      <td headers="0 to 1 stub_1_3 halves" class="gt_row gt_right">0</td>
      <td headers="0 to 1 stub_1_3 quarters" class="gt_row gt_right">0</td>
      <td headers="0 to 1 stub_1_3 eighths" class="gt_row gt_right">0</td>
      <td headers="0 to 1 stub_1_3 sixteenths" class="gt_row gt_right">0</td>
      <td headers="0 to 1 stub_1_3 hundredths" class="gt_row gt_right">1/100</td></tr>
          <tr><th id="stub_1_4" scope="row" class="gt_row gt_right gt_stub">0.1000</th>
      <td headers="0 to 1 stub_1_4 low" class="gt_row gt_right">1/9</td>
      <td headers="0 to 1 stub_1_4 med" class="gt_row gt_right">1/10</td>
      <td headers="0 to 1 stub_1_4 high" class="gt_row gt_right">1/10</td>
      <td headers="0 to 1 stub_1_4 halves" class="gt_row gt_right">0</td>
      <td headers="0 to 1 stub_1_4 quarters" class="gt_row gt_right">0</td>
      <td headers="0 to 1 stub_1_4 eighths" class="gt_row gt_right">1/8</td>
      <td headers="0 to 1 stub_1_4 sixteenths" class="gt_row gt_right">1/8</td>
      <td headers="0 to 1 stub_1_4 hundredths" class="gt_row gt_right">1/10</td></tr>
          <tr><th id="stub_1_5" scope="row" class="gt_row gt_right gt_stub">0.2500</th>
      <td headers="0 to 1 stub_1_5 low" class="gt_row gt_right">1/4</td>
      <td headers="0 to 1 stub_1_5 med" class="gt_row gt_right">1/4</td>
      <td headers="0 to 1 stub_1_5 high" class="gt_row gt_right">1/4</td>
      <td headers="0 to 1 stub_1_5 halves" class="gt_row gt_right">1/2</td>
      <td headers="0 to 1 stub_1_5 quarters" class="gt_row gt_right">1/4</td>
      <td headers="0 to 1 stub_1_5 eighths" class="gt_row gt_right">1/4</td>
      <td headers="0 to 1 stub_1_5 sixteenths" class="gt_row gt_right">1/4</td>
      <td headers="0 to 1 stub_1_5 hundredths" class="gt_row gt_right">1/4</td></tr>
          <tr><th id="stub_1_6" scope="row" class="gt_row gt_right gt_stub">0.4000</th>
      <td headers="0 to 1 stub_1_6 low" class="gt_row gt_right">2/5</td>
      <td headers="0 to 1 stub_1_6 med" class="gt_row gt_right">2/5</td>
      <td headers="0 to 1 stub_1_6 high" class="gt_row gt_right">2/5</td>
      <td headers="0 to 1 stub_1_6 halves" class="gt_row gt_right">1/2</td>
      <td headers="0 to 1 stub_1_6 quarters" class="gt_row gt_right">1/2</td>
      <td headers="0 to 1 stub_1_6 eighths" class="gt_row gt_right">3/8</td>
      <td headers="0 to 1 stub_1_6 sixteenths" class="gt_row gt_right">3/8</td>
      <td headers="0 to 1 stub_1_6 hundredths" class="gt_row gt_right">2/5</td></tr>
          <tr><th id="stub_1_7" scope="row" class="gt_row gt_right gt_stub">0.5000</th>
      <td headers="0 to 1 stub_1_7 low" class="gt_row gt_right">1/2</td>
      <td headers="0 to 1 stub_1_7 med" class="gt_row gt_right">1/2</td>
      <td headers="0 to 1 stub_1_7 high" class="gt_row gt_right">1/2</td>
      <td headers="0 to 1 stub_1_7 halves" class="gt_row gt_right">1/2</td>
      <td headers="0 to 1 stub_1_7 quarters" class="gt_row gt_right">1/2</td>
      <td headers="0 to 1 stub_1_7 eighths" class="gt_row gt_right">1/2</td>
      <td headers="0 to 1 stub_1_7 sixteenths" class="gt_row gt_right">1/2</td>
      <td headers="0 to 1 stub_1_7 hundredths" class="gt_row gt_right">1/2</td></tr>
          <tr><th id="stub_1_8" scope="row" class="gt_row gt_right gt_stub">0.6000</th>
      <td headers="0 to 1 stub_1_8 low" class="gt_row gt_right">3/5</td>
      <td headers="0 to 1 stub_1_8 med" class="gt_row gt_right">3/5</td>
      <td headers="0 to 1 stub_1_8 high" class="gt_row gt_right">3/5</td>
      <td headers="0 to 1 stub_1_8 halves" class="gt_row gt_right">1/2</td>
      <td headers="0 to 1 stub_1_8 quarters" class="gt_row gt_right">1/2</td>
      <td headers="0 to 1 stub_1_8 eighths" class="gt_row gt_right">5/8</td>
      <td headers="0 to 1 stub_1_8 sixteenths" class="gt_row gt_right">5/8</td>
      <td headers="0 to 1 stub_1_8 hundredths" class="gt_row gt_right">3/5</td></tr>
          <tr><th id="stub_1_9" scope="row" class="gt_row gt_right gt_stub">0.7500</th>
      <td headers="0 to 1 stub_1_9 low" class="gt_row gt_right">3/4</td>
      <td headers="0 to 1 stub_1_9 med" class="gt_row gt_right">3/4</td>
      <td headers="0 to 1 stub_1_9 high" class="gt_row gt_right">3/4</td>
      <td headers="0 to 1 stub_1_9 halves" class="gt_row gt_right">1</td>
      <td headers="0 to 1 stub_1_9 quarters" class="gt_row gt_right">3/4</td>
      <td headers="0 to 1 stub_1_9 eighths" class="gt_row gt_right">3/4</td>
      <td headers="0 to 1 stub_1_9 sixteenths" class="gt_row gt_right">3/4</td>
      <td headers="0 to 1 stub_1_9 hundredths" class="gt_row gt_right">3/4</td></tr>
          <tr><th id="stub_1_10" scope="row" class="gt_row gt_right gt_stub">0.9000</th>
      <td headers="0 to 1 stub_1_10 low" class="gt_row gt_right">8/9</td>
      <td headers="0 to 1 stub_1_10 med" class="gt_row gt_right">9/10</td>
      <td headers="0 to 1 stub_1_10 high" class="gt_row gt_right">9/10</td>
      <td headers="0 to 1 stub_1_10 halves" class="gt_row gt_right">1</td>
      <td headers="0 to 1 stub_1_10 quarters" class="gt_row gt_right">1</td>
      <td headers="0 to 1 stub_1_10 eighths" class="gt_row gt_right">7/8</td>
      <td headers="0 to 1 stub_1_10 sixteenths" class="gt_row gt_right">7/8</td>
      <td headers="0 to 1 stub_1_10 hundredths" class="gt_row gt_right">9/10</td></tr>
          <tr><th id="stub_1_11" scope="row" class="gt_row gt_right gt_stub">0.9900</th>
      <td headers="0 to 1 stub_1_11 low" class="gt_row gt_right">1</td>
      <td headers="0 to 1 stub_1_11 med" class="gt_row gt_right">98/99</td>
      <td headers="0 to 1 stub_1_11 high" class="gt_row gt_right">99/100</td>
      <td headers="0 to 1 stub_1_11 halves" class="gt_row gt_right">1</td>
      <td headers="0 to 1 stub_1_11 quarters" class="gt_row gt_right">1</td>
      <td headers="0 to 1 stub_1_11 eighths" class="gt_row gt_right">1</td>
      <td headers="0 to 1 stub_1_11 sixteenths" class="gt_row gt_right">1</td>
      <td headers="0 to 1 stub_1_11 hundredths" class="gt_row gt_right">99/100</td></tr>
          <tr><th id="stub_1_12" scope="row" class="gt_row gt_right gt_stub">0.9990</th>
      <td headers="0 to 1 stub_1_12 low" class="gt_row gt_right">1</td>
      <td headers="0 to 1 stub_1_12 med" class="gt_row gt_right">1</td>
      <td headers="0 to 1 stub_1_12 high" class="gt_row gt_right">998/999</td>
      <td headers="0 to 1 stub_1_12 halves" class="gt_row gt_right">1</td>
      <td headers="0 to 1 stub_1_12 quarters" class="gt_row gt_right">1</td>
      <td headers="0 to 1 stub_1_12 eighths" class="gt_row gt_right">1</td>
      <td headers="0 to 1 stub_1_12 sixteenths" class="gt_row gt_right">1</td>
      <td headers="0 to 1 stub_1_12 hundredths" class="gt_row gt_right">1</td></tr>
          <tr><th id="stub_1_13" scope="row" class="gt_row gt_right gt_stub">0.9999</th>
      <td headers="0 to 1 stub_1_13 low" class="gt_row gt_right">1</td>
      <td headers="0 to 1 stub_1_13 med" class="gt_row gt_right">1</td>
      <td headers="0 to 1 stub_1_13 high" class="gt_row gt_right">1</td>
      <td headers="0 to 1 stub_1_13 halves" class="gt_row gt_right">1</td>
      <td headers="0 to 1 stub_1_13 quarters" class="gt_row gt_right">1</td>
      <td headers="0 to 1 stub_1_13 eighths" class="gt_row gt_right">1</td>
      <td headers="0 to 1 stub_1_13 sixteenths" class="gt_row gt_right">1</td>
      <td headers="0 to 1 stub_1_13 hundredths" class="gt_row gt_right">1</td></tr>
          <tr class="gt_group_heading_row">
            <th colspan="9" class="gt_group_heading" scope="colgroup" id="0 to -1">0 to -1</th>
          </tr>
          <tr class="gt_row_group_first"><th id="stub_1_14" scope="row" class="gt_row gt_right gt_stub">-0.0001</th>
      <td headers="0 to -1 stub_1_14 low" class="gt_row gt_right">0</td>
      <td headers="0 to -1 stub_1_14 med" class="gt_row gt_right">0</td>
      <td headers="0 to -1 stub_1_14 high" class="gt_row gt_right">0</td>
      <td headers="0 to -1 stub_1_14 halves" class="gt_row gt_right">0</td>
      <td headers="0 to -1 stub_1_14 quarters" class="gt_row gt_right">0</td>
      <td headers="0 to -1 stub_1_14 eighths" class="gt_row gt_right">0</td>
      <td headers="0 to -1 stub_1_14 sixteenths" class="gt_row gt_right">0</td>
      <td headers="0 to -1 stub_1_14 hundredths" class="gt_row gt_right">0</td></tr>
          <tr><th id="stub_1_15" scope="row" class="gt_row gt_right gt_stub">-0.0010</th>
      <td headers="0 to -1 stub_1_15 low" class="gt_row gt_right">0</td>
      <td headers="0 to -1 stub_1_15 med" class="gt_row gt_right">0</td>
      <td headers="0 to -1 stub_1_15 high" class="gt_row gt_right">−1/999</td>
      <td headers="0 to -1 stub_1_15 halves" class="gt_row gt_right">0</td>
      <td headers="0 to -1 stub_1_15 quarters" class="gt_row gt_right">0</td>
      <td headers="0 to -1 stub_1_15 eighths" class="gt_row gt_right">0</td>
      <td headers="0 to -1 stub_1_15 sixteenths" class="gt_row gt_right">0</td>
      <td headers="0 to -1 stub_1_15 hundredths" class="gt_row gt_right">0</td></tr>
          <tr><th id="stub_1_16" scope="row" class="gt_row gt_right gt_stub">-0.0100</th>
      <td headers="0 to -1 stub_1_16 low" class="gt_row gt_right">0</td>
      <td headers="0 to -1 stub_1_16 med" class="gt_row gt_right">−1/99</td>
      <td headers="0 to -1 stub_1_16 high" class="gt_row gt_right">−1/100</td>
      <td headers="0 to -1 stub_1_16 halves" class="gt_row gt_right">0</td>
      <td headers="0 to -1 stub_1_16 quarters" class="gt_row gt_right">0</td>
      <td headers="0 to -1 stub_1_16 eighths" class="gt_row gt_right">0</td>
      <td headers="0 to -1 stub_1_16 sixteenths" class="gt_row gt_right">0</td>
      <td headers="0 to -1 stub_1_16 hundredths" class="gt_row gt_right">−1/100</td></tr>
          <tr><th id="stub_1_17" scope="row" class="gt_row gt_right gt_stub">-0.1000</th>
      <td headers="0 to -1 stub_1_17 low" class="gt_row gt_right">−1/9</td>
      <td headers="0 to -1 stub_1_17 med" class="gt_row gt_right">−1/10</td>
      <td headers="0 to -1 stub_1_17 high" class="gt_row gt_right">−1/10</td>
      <td headers="0 to -1 stub_1_17 halves" class="gt_row gt_right">0</td>
      <td headers="0 to -1 stub_1_17 quarters" class="gt_row gt_right">0</td>
      <td headers="0 to -1 stub_1_17 eighths" class="gt_row gt_right">−1/8</td>
      <td headers="0 to -1 stub_1_17 sixteenths" class="gt_row gt_right">−1/8</td>
      <td headers="0 to -1 stub_1_17 hundredths" class="gt_row gt_right">−1/10</td></tr>
          <tr><th id="stub_1_18" scope="row" class="gt_row gt_right gt_stub">-0.2500</th>
      <td headers="0 to -1 stub_1_18 low" class="gt_row gt_right">−1/4</td>
      <td headers="0 to -1 stub_1_18 med" class="gt_row gt_right">−1/4</td>
      <td headers="0 to -1 stub_1_18 high" class="gt_row gt_right">−1/4</td>
      <td headers="0 to -1 stub_1_18 halves" class="gt_row gt_right">−1/2</td>
      <td headers="0 to -1 stub_1_18 quarters" class="gt_row gt_right">−1/4</td>
      <td headers="0 to -1 stub_1_18 eighths" class="gt_row gt_right">−1/4</td>
      <td headers="0 to -1 stub_1_18 sixteenths" class="gt_row gt_right">−1/4</td>
      <td headers="0 to -1 stub_1_18 hundredths" class="gt_row gt_right">−1/4</td></tr>
          <tr><th id="stub_1_19" scope="row" class="gt_row gt_right gt_stub">-0.4000</th>
      <td headers="0 to -1 stub_1_19 low" class="gt_row gt_right">−2/5</td>
      <td headers="0 to -1 stub_1_19 med" class="gt_row gt_right">−2/5</td>
      <td headers="0 to -1 stub_1_19 high" class="gt_row gt_right">−2/5</td>
      <td headers="0 to -1 stub_1_19 halves" class="gt_row gt_right">−1/2</td>
      <td headers="0 to -1 stub_1_19 quarters" class="gt_row gt_right">−1/2</td>
      <td headers="0 to -1 stub_1_19 eighths" class="gt_row gt_right">−3/8</td>
      <td headers="0 to -1 stub_1_19 sixteenths" class="gt_row gt_right">−3/8</td>
      <td headers="0 to -1 stub_1_19 hundredths" class="gt_row gt_right">−2/5</td></tr>
          <tr><th id="stub_1_20" scope="row" class="gt_row gt_right gt_stub">-0.5000</th>
      <td headers="0 to -1 stub_1_20 low" class="gt_row gt_right">−1/2</td>
      <td headers="0 to -1 stub_1_20 med" class="gt_row gt_right">−1/2</td>
      <td headers="0 to -1 stub_1_20 high" class="gt_row gt_right">−1/2</td>
      <td headers="0 to -1 stub_1_20 halves" class="gt_row gt_right">−1/2</td>
      <td headers="0 to -1 stub_1_20 quarters" class="gt_row gt_right">−1/2</td>
      <td headers="0 to -1 stub_1_20 eighths" class="gt_row gt_right">−1/2</td>
      <td headers="0 to -1 stub_1_20 sixteenths" class="gt_row gt_right">−1/2</td>
      <td headers="0 to -1 stub_1_20 hundredths" class="gt_row gt_right">−1/2</td></tr>
          <tr><th id="stub_1_21" scope="row" class="gt_row gt_right gt_stub">-0.6000</th>
      <td headers="0 to -1 stub_1_21 low" class="gt_row gt_right">−3/5</td>
      <td headers="0 to -1 stub_1_21 med" class="gt_row gt_right">−3/5</td>
      <td headers="0 to -1 stub_1_21 high" class="gt_row gt_right">−3/5</td>
      <td headers="0 to -1 stub_1_21 halves" class="gt_row gt_right">−1/2</td>
      <td headers="0 to -1 stub_1_21 quarters" class="gt_row gt_right">−1/2</td>
      <td headers="0 to -1 stub_1_21 eighths" class="gt_row gt_right">−5/8</td>
      <td headers="0 to -1 stub_1_21 sixteenths" class="gt_row gt_right">−5/8</td>
      <td headers="0 to -1 stub_1_21 hundredths" class="gt_row gt_right">−3/5</td></tr>
          <tr><th id="stub_1_22" scope="row" class="gt_row gt_right gt_stub">-0.7500</th>
      <td headers="0 to -1 stub_1_22 low" class="gt_row gt_right">−3/4</td>
      <td headers="0 to -1 stub_1_22 med" class="gt_row gt_right">−3/4</td>
      <td headers="0 to -1 stub_1_22 high" class="gt_row gt_right">−3/4</td>
      <td headers="0 to -1 stub_1_22 halves" class="gt_row gt_right">−1</td>
      <td headers="0 to -1 stub_1_22 quarters" class="gt_row gt_right">−3/4</td>
      <td headers="0 to -1 stub_1_22 eighths" class="gt_row gt_right">−3/4</td>
      <td headers="0 to -1 stub_1_22 sixteenths" class="gt_row gt_right">−3/4</td>
      <td headers="0 to -1 stub_1_22 hundredths" class="gt_row gt_right">−3/4</td></tr>
          <tr><th id="stub_1_23" scope="row" class="gt_row gt_right gt_stub">-0.9000</th>
      <td headers="0 to -1 stub_1_23 low" class="gt_row gt_right">−8/9</td>
      <td headers="0 to -1 stub_1_23 med" class="gt_row gt_right">−9/10</td>
      <td headers="0 to -1 stub_1_23 high" class="gt_row gt_right">−9/10</td>
      <td headers="0 to -1 stub_1_23 halves" class="gt_row gt_right">−1</td>
      <td headers="0 to -1 stub_1_23 quarters" class="gt_row gt_right">−1</td>
      <td headers="0 to -1 stub_1_23 eighths" class="gt_row gt_right">−7/8</td>
      <td headers="0 to -1 stub_1_23 sixteenths" class="gt_row gt_right">−7/8</td>
      <td headers="0 to -1 stub_1_23 hundredths" class="gt_row gt_right">−9/10</td></tr>
          <tr><th id="stub_1_24" scope="row" class="gt_row gt_right gt_stub">-0.9900</th>
      <td headers="0 to -1 stub_1_24 low" class="gt_row gt_right">−1</td>
      <td headers="0 to -1 stub_1_24 med" class="gt_row gt_right">−98/99</td>
      <td headers="0 to -1 stub_1_24 high" class="gt_row gt_right">−99/100</td>
      <td headers="0 to -1 stub_1_24 halves" class="gt_row gt_right">−1</td>
      <td headers="0 to -1 stub_1_24 quarters" class="gt_row gt_right">−1</td>
      <td headers="0 to -1 stub_1_24 eighths" class="gt_row gt_right">−1</td>
      <td headers="0 to -1 stub_1_24 sixteenths" class="gt_row gt_right">−1</td>
      <td headers="0 to -1 stub_1_24 hundredths" class="gt_row gt_right">−99/100</td></tr>
          <tr><th id="stub_1_25" scope="row" class="gt_row gt_right gt_stub">-0.9990</th>
      <td headers="0 to -1 stub_1_25 low" class="gt_row gt_right">−1</td>
      <td headers="0 to -1 stub_1_25 med" class="gt_row gt_right">−1</td>
      <td headers="0 to -1 stub_1_25 high" class="gt_row gt_right">−998/999</td>
      <td headers="0 to -1 stub_1_25 halves" class="gt_row gt_right">−1</td>
      <td headers="0 to -1 stub_1_25 quarters" class="gt_row gt_right">−1</td>
      <td headers="0 to -1 stub_1_25 eighths" class="gt_row gt_right">−1</td>
      <td headers="0 to -1 stub_1_25 sixteenths" class="gt_row gt_right">−1</td>
      <td headers="0 to -1 stub_1_25 hundredths" class="gt_row gt_right">−1</td></tr>
          <tr><th id="stub_1_26" scope="row" class="gt_row gt_right gt_stub">-0.9999</th>
      <td headers="0 to -1 stub_1_26 low" class="gt_row gt_right">−1</td>
      <td headers="0 to -1 stub_1_26 med" class="gt_row gt_right">−1</td>
      <td headers="0 to -1 stub_1_26 high" class="gt_row gt_right">−1</td>
      <td headers="0 to -1 stub_1_26 halves" class="gt_row gt_right">−1</td>
      <td headers="0 to -1 stub_1_26 quarters" class="gt_row gt_right">−1</td>
      <td headers="0 to -1 stub_1_26 eighths" class="gt_row gt_right">−1</td>
      <td headers="0 to -1 stub_1_26 sixteenths" class="gt_row gt_right">−1</td>
      <td headers="0 to -1 stub_1_26 hundredths" class="gt_row gt_right">−1</td></tr>
          <tr class="gt_group_heading_row">
            <th colspan="9" class="gt_group_heading" scope="colgroup" id="1 to 2">1 to 2</th>
          </tr>
          <tr class="gt_row_group_first"><th id="stub_1_27" scope="row" class="gt_row gt_right gt_stub">1.0001</th>
      <td headers="1 to 2 stub_1_27 low" class="gt_row gt_right">1</td>
      <td headers="1 to 2 stub_1_27 med" class="gt_row gt_right">1</td>
      <td headers="1 to 2 stub_1_27 high" class="gt_row gt_right">1</td>
      <td headers="1 to 2 stub_1_27 halves" class="gt_row gt_right">1</td>
      <td headers="1 to 2 stub_1_27 quarters" class="gt_row gt_right">1</td>
      <td headers="1 to 2 stub_1_27 eighths" class="gt_row gt_right">1</td>
      <td headers="1 to 2 stub_1_27 sixteenths" class="gt_row gt_right">1</td>
      <td headers="1 to 2 stub_1_27 hundredths" class="gt_row gt_right">1</td></tr>
          <tr><th id="stub_1_28" scope="row" class="gt_row gt_right gt_stub">1.0010</th>
      <td headers="1 to 2 stub_1_28 low" class="gt_row gt_right">1</td>
      <td headers="1 to 2 stub_1_28 med" class="gt_row gt_right">1</td>
      <td headers="1 to 2 stub_1_28 high" class="gt_row gt_right">1 1/999</td>
      <td headers="1 to 2 stub_1_28 halves" class="gt_row gt_right">1</td>
      <td headers="1 to 2 stub_1_28 quarters" class="gt_row gt_right">1</td>
      <td headers="1 to 2 stub_1_28 eighths" class="gt_row gt_right">1</td>
      <td headers="1 to 2 stub_1_28 sixteenths" class="gt_row gt_right">1</td>
      <td headers="1 to 2 stub_1_28 hundredths" class="gt_row gt_right">1</td></tr>
          <tr><th id="stub_1_29" scope="row" class="gt_row gt_right gt_stub">1.0100</th>
      <td headers="1 to 2 stub_1_29 low" class="gt_row gt_right">1</td>
      <td headers="1 to 2 stub_1_29 med" class="gt_row gt_right">1 1/99</td>
      <td headers="1 to 2 stub_1_29 high" class="gt_row gt_right">1 1/100</td>
      <td headers="1 to 2 stub_1_29 halves" class="gt_row gt_right">1</td>
      <td headers="1 to 2 stub_1_29 quarters" class="gt_row gt_right">1</td>
      <td headers="1 to 2 stub_1_29 eighths" class="gt_row gt_right">1</td>
      <td headers="1 to 2 stub_1_29 sixteenths" class="gt_row gt_right">1</td>
      <td headers="1 to 2 stub_1_29 hundredths" class="gt_row gt_right">1 1/100</td></tr>
          <tr><th id="stub_1_30" scope="row" class="gt_row gt_right gt_stub">1.1000</th>
      <td headers="1 to 2 stub_1_30 low" class="gt_row gt_right">1 1/9</td>
      <td headers="1 to 2 stub_1_30 med" class="gt_row gt_right">1 1/10</td>
      <td headers="1 to 2 stub_1_30 high" class="gt_row gt_right">1 1/10</td>
      <td headers="1 to 2 stub_1_30 halves" class="gt_row gt_right">1</td>
      <td headers="1 to 2 stub_1_30 quarters" class="gt_row gt_right">1</td>
      <td headers="1 to 2 stub_1_30 eighths" class="gt_row gt_right">1 1/8</td>
      <td headers="1 to 2 stub_1_30 sixteenths" class="gt_row gt_right">1 1/8</td>
      <td headers="1 to 2 stub_1_30 hundredths" class="gt_row gt_right">1 1/10</td></tr>
          <tr><th id="stub_1_31" scope="row" class="gt_row gt_right gt_stub">1.2500</th>
      <td headers="1 to 2 stub_1_31 low" class="gt_row gt_right">1 1/4</td>
      <td headers="1 to 2 stub_1_31 med" class="gt_row gt_right">1 1/4</td>
      <td headers="1 to 2 stub_1_31 high" class="gt_row gt_right">1 1/4</td>
      <td headers="1 to 2 stub_1_31 halves" class="gt_row gt_right">1 1/2</td>
      <td headers="1 to 2 stub_1_31 quarters" class="gt_row gt_right">1 1/4</td>
      <td headers="1 to 2 stub_1_31 eighths" class="gt_row gt_right">1 1/4</td>
      <td headers="1 to 2 stub_1_31 sixteenths" class="gt_row gt_right">1 1/4</td>
      <td headers="1 to 2 stub_1_31 hundredths" class="gt_row gt_right">1 1/4</td></tr>
          <tr><th id="stub_1_32" scope="row" class="gt_row gt_right gt_stub">1.4000</th>
      <td headers="1 to 2 stub_1_32 low" class="gt_row gt_right">1 2/5</td>
      <td headers="1 to 2 stub_1_32 med" class="gt_row gt_right">1 2/5</td>
      <td headers="1 to 2 stub_1_32 high" class="gt_row gt_right">1 2/5</td>
      <td headers="1 to 2 stub_1_32 halves" class="gt_row gt_right">1 1/2</td>
      <td headers="1 to 2 stub_1_32 quarters" class="gt_row gt_right">1 1/2</td>
      <td headers="1 to 2 stub_1_32 eighths" class="gt_row gt_right">1 3/8</td>
      <td headers="1 to 2 stub_1_32 sixteenths" class="gt_row gt_right">1 3/8</td>
      <td headers="1 to 2 stub_1_32 hundredths" class="gt_row gt_right">1 2/5</td></tr>
          <tr><th id="stub_1_33" scope="row" class="gt_row gt_right gt_stub">1.5000</th>
      <td headers="1 to 2 stub_1_33 low" class="gt_row gt_right">1 1/2</td>
      <td headers="1 to 2 stub_1_33 med" class="gt_row gt_right">1 1/2</td>
      <td headers="1 to 2 stub_1_33 high" class="gt_row gt_right">1 1/2</td>
      <td headers="1 to 2 stub_1_33 halves" class="gt_row gt_right">1 1/2</td>
      <td headers="1 to 2 stub_1_33 quarters" class="gt_row gt_right">1 1/2</td>
      <td headers="1 to 2 stub_1_33 eighths" class="gt_row gt_right">1 1/2</td>
      <td headers="1 to 2 stub_1_33 sixteenths" class="gt_row gt_right">1 1/2</td>
      <td headers="1 to 2 stub_1_33 hundredths" class="gt_row gt_right">1 1/2</td></tr>
          <tr><th id="stub_1_34" scope="row" class="gt_row gt_right gt_stub">1.6000</th>
      <td headers="1 to 2 stub_1_34 low" class="gt_row gt_right">1 3/5</td>
      <td headers="1 to 2 stub_1_34 med" class="gt_row gt_right">1 3/5</td>
      <td headers="1 to 2 stub_1_34 high" class="gt_row gt_right">1 3/5</td>
      <td headers="1 to 2 stub_1_34 halves" class="gt_row gt_right">1 1/2</td>
      <td headers="1 to 2 stub_1_34 quarters" class="gt_row gt_right">1 1/2</td>
      <td headers="1 to 2 stub_1_34 eighths" class="gt_row gt_right">1 5/8</td>
      <td headers="1 to 2 stub_1_34 sixteenths" class="gt_row gt_right">1 5/8</td>
      <td headers="1 to 2 stub_1_34 hundredths" class="gt_row gt_right">1 3/5</td></tr>
          <tr><th id="stub_1_35" scope="row" class="gt_row gt_right gt_stub">1.7500</th>
      <td headers="1 to 2 stub_1_35 low" class="gt_row gt_right">1 3/4</td>
      <td headers="1 to 2 stub_1_35 med" class="gt_row gt_right">1 3/4</td>
      <td headers="1 to 2 stub_1_35 high" class="gt_row gt_right">1 3/4</td>
      <td headers="1 to 2 stub_1_35 halves" class="gt_row gt_right">2</td>
      <td headers="1 to 2 stub_1_35 quarters" class="gt_row gt_right">1 3/4</td>
      <td headers="1 to 2 stub_1_35 eighths" class="gt_row gt_right">1 3/4</td>
      <td headers="1 to 2 stub_1_35 sixteenths" class="gt_row gt_right">1 3/4</td>
      <td headers="1 to 2 stub_1_35 hundredths" class="gt_row gt_right">1 3/4</td></tr>
          <tr><th id="stub_1_36" scope="row" class="gt_row gt_right gt_stub">1.9000</th>
      <td headers="1 to 2 stub_1_36 low" class="gt_row gt_right">1 8/9</td>
      <td headers="1 to 2 stub_1_36 med" class="gt_row gt_right">1 9/10</td>
      <td headers="1 to 2 stub_1_36 high" class="gt_row gt_right">1 9/10</td>
      <td headers="1 to 2 stub_1_36 halves" class="gt_row gt_right">2</td>
      <td headers="1 to 2 stub_1_36 quarters" class="gt_row gt_right">2</td>
      <td headers="1 to 2 stub_1_36 eighths" class="gt_row gt_right">1 7/8</td>
      <td headers="1 to 2 stub_1_36 sixteenths" class="gt_row gt_right">1 7/8</td>
      <td headers="1 to 2 stub_1_36 hundredths" class="gt_row gt_right">1 9/10</td></tr>
          <tr><th id="stub_1_37" scope="row" class="gt_row gt_right gt_stub">1.9900</th>
      <td headers="1 to 2 stub_1_37 low" class="gt_row gt_right">2</td>
      <td headers="1 to 2 stub_1_37 med" class="gt_row gt_right">1 98/99</td>
      <td headers="1 to 2 stub_1_37 high" class="gt_row gt_right">1 99/100</td>
      <td headers="1 to 2 stub_1_37 halves" class="gt_row gt_right">2</td>
      <td headers="1 to 2 stub_1_37 quarters" class="gt_row gt_right">2</td>
      <td headers="1 to 2 stub_1_37 eighths" class="gt_row gt_right">2</td>
      <td headers="1 to 2 stub_1_37 sixteenths" class="gt_row gt_right">2</td>
      <td headers="1 to 2 stub_1_37 hundredths" class="gt_row gt_right">1 99/100</td></tr>
          <tr><th id="stub_1_38" scope="row" class="gt_row gt_right gt_stub">1.9990</th>
      <td headers="1 to 2 stub_1_38 low" class="gt_row gt_right">2</td>
      <td headers="1 to 2 stub_1_38 med" class="gt_row gt_right">2</td>
      <td headers="1 to 2 stub_1_38 high" class="gt_row gt_right">1 998/999</td>
      <td headers="1 to 2 stub_1_38 halves" class="gt_row gt_right">2</td>
      <td headers="1 to 2 stub_1_38 quarters" class="gt_row gt_right">2</td>
      <td headers="1 to 2 stub_1_38 eighths" class="gt_row gt_right">2</td>
      <td headers="1 to 2 stub_1_38 sixteenths" class="gt_row gt_right">2</td>
      <td headers="1 to 2 stub_1_38 hundredths" class="gt_row gt_right">2</td></tr>
          <tr><th id="stub_1_39" scope="row" class="gt_row gt_right gt_stub">1.9999</th>
      <td headers="1 to 2 stub_1_39 low" class="gt_row gt_right">2</td>
      <td headers="1 to 2 stub_1_39 med" class="gt_row gt_right">2</td>
      <td headers="1 to 2 stub_1_39 high" class="gt_row gt_right">2</td>
      <td headers="1 to 2 stub_1_39 halves" class="gt_row gt_right">2</td>
      <td headers="1 to 2 stub_1_39 quarters" class="gt_row gt_right">2</td>
      <td headers="1 to 2 stub_1_39 eighths" class="gt_row gt_right">2</td>
      <td headers="1 to 2 stub_1_39 sixteenths" class="gt_row gt_right">2</td>
      <td headers="1 to 2 stub_1_39 hundredths" class="gt_row gt_right">2</td></tr>
          <tr class="gt_group_heading_row">
            <th colspan="9" class="gt_group_heading" scope="colgroup" id="-1 to -2">-1 to -2</th>
          </tr>
          <tr class="gt_row_group_first"><th id="stub_1_40" scope="row" class="gt_row gt_right gt_stub">-1.0001</th>
      <td headers="-1 to -2 stub_1_40 low" class="gt_row gt_right">−1</td>
      <td headers="-1 to -2 stub_1_40 med" class="gt_row gt_right">−1</td>
      <td headers="-1 to -2 stub_1_40 high" class="gt_row gt_right">−1</td>
      <td headers="-1 to -2 stub_1_40 halves" class="gt_row gt_right">−1</td>
      <td headers="-1 to -2 stub_1_40 quarters" class="gt_row gt_right">−1</td>
      <td headers="-1 to -2 stub_1_40 eighths" class="gt_row gt_right">−1</td>
      <td headers="-1 to -2 stub_1_40 sixteenths" class="gt_row gt_right">−1</td>
      <td headers="-1 to -2 stub_1_40 hundredths" class="gt_row gt_right">−1</td></tr>
          <tr><th id="stub_1_41" scope="row" class="gt_row gt_right gt_stub">-1.0010</th>
      <td headers="-1 to -2 stub_1_41 low" class="gt_row gt_right">−1</td>
      <td headers="-1 to -2 stub_1_41 med" class="gt_row gt_right">−1</td>
      <td headers="-1 to -2 stub_1_41 high" class="gt_row gt_right">−1 1/999</td>
      <td headers="-1 to -2 stub_1_41 halves" class="gt_row gt_right">−1</td>
      <td headers="-1 to -2 stub_1_41 quarters" class="gt_row gt_right">−1</td>
      <td headers="-1 to -2 stub_1_41 eighths" class="gt_row gt_right">−1</td>
      <td headers="-1 to -2 stub_1_41 sixteenths" class="gt_row gt_right">−1</td>
      <td headers="-1 to -2 stub_1_41 hundredths" class="gt_row gt_right">−1</td></tr>
          <tr><th id="stub_1_42" scope="row" class="gt_row gt_right gt_stub">-1.0100</th>
      <td headers="-1 to -2 stub_1_42 low" class="gt_row gt_right">−1</td>
      <td headers="-1 to -2 stub_1_42 med" class="gt_row gt_right">−1 1/99</td>
      <td headers="-1 to -2 stub_1_42 high" class="gt_row gt_right">−1 1/100</td>
      <td headers="-1 to -2 stub_1_42 halves" class="gt_row gt_right">−1</td>
      <td headers="-1 to -2 stub_1_42 quarters" class="gt_row gt_right">−1</td>
      <td headers="-1 to -2 stub_1_42 eighths" class="gt_row gt_right">−1</td>
      <td headers="-1 to -2 stub_1_42 sixteenths" class="gt_row gt_right">−1</td>
      <td headers="-1 to -2 stub_1_42 hundredths" class="gt_row gt_right">−1 1/100</td></tr>
          <tr><th id="stub_1_43" scope="row" class="gt_row gt_right gt_stub">-1.1000</th>
      <td headers="-1 to -2 stub_1_43 low" class="gt_row gt_right">−1 1/9</td>
      <td headers="-1 to -2 stub_1_43 med" class="gt_row gt_right">−1 1/10</td>
      <td headers="-1 to -2 stub_1_43 high" class="gt_row gt_right">−1 1/10</td>
      <td headers="-1 to -2 stub_1_43 halves" class="gt_row gt_right">−1</td>
      <td headers="-1 to -2 stub_1_43 quarters" class="gt_row gt_right">−1</td>
      <td headers="-1 to -2 stub_1_43 eighths" class="gt_row gt_right">−1 1/8</td>
      <td headers="-1 to -2 stub_1_43 sixteenths" class="gt_row gt_right">−1 1/8</td>
      <td headers="-1 to -2 stub_1_43 hundredths" class="gt_row gt_right">−1 1/10</td></tr>
          <tr><th id="stub_1_44" scope="row" class="gt_row gt_right gt_stub">-1.2500</th>
      <td headers="-1 to -2 stub_1_44 low" class="gt_row gt_right">−1 1/4</td>
      <td headers="-1 to -2 stub_1_44 med" class="gt_row gt_right">−1 1/4</td>
      <td headers="-1 to -2 stub_1_44 high" class="gt_row gt_right">−1 1/4</td>
      <td headers="-1 to -2 stub_1_44 halves" class="gt_row gt_right">−1 1/2</td>
      <td headers="-1 to -2 stub_1_44 quarters" class="gt_row gt_right">−1 1/4</td>
      <td headers="-1 to -2 stub_1_44 eighths" class="gt_row gt_right">−1 1/4</td>
      <td headers="-1 to -2 stub_1_44 sixteenths" class="gt_row gt_right">−1 1/4</td>
      <td headers="-1 to -2 stub_1_44 hundredths" class="gt_row gt_right">−1 1/4</td></tr>
          <tr><th id="stub_1_45" scope="row" class="gt_row gt_right gt_stub">-1.4000</th>
      <td headers="-1 to -2 stub_1_45 low" class="gt_row gt_right">−1 2/5</td>
      <td headers="-1 to -2 stub_1_45 med" class="gt_row gt_right">−1 2/5</td>
      <td headers="-1 to -2 stub_1_45 high" class="gt_row gt_right">−1 2/5</td>
      <td headers="-1 to -2 stub_1_45 halves" class="gt_row gt_right">−1 1/2</td>
      <td headers="-1 to -2 stub_1_45 quarters" class="gt_row gt_right">−1 1/2</td>
      <td headers="-1 to -2 stub_1_45 eighths" class="gt_row gt_right">−1 3/8</td>
      <td headers="-1 to -2 stub_1_45 sixteenths" class="gt_row gt_right">−1 3/8</td>
      <td headers="-1 to -2 stub_1_45 hundredths" class="gt_row gt_right">−1 2/5</td></tr>
          <tr><th id="stub_1_46" scope="row" class="gt_row gt_right gt_stub">-1.5000</th>
      <td headers="-1 to -2 stub_1_46 low" class="gt_row gt_right">−1 1/2</td>
      <td headers="-1 to -2 stub_1_46 med" class="gt_row gt_right">−1 1/2</td>
      <td headers="-1 to -2 stub_1_46 high" class="gt_row gt_right">−1 1/2</td>
      <td headers="-1 to -2 stub_1_46 halves" class="gt_row gt_right">−1 1/2</td>
      <td headers="-1 to -2 stub_1_46 quarters" class="gt_row gt_right">−1 1/2</td>
      <td headers="-1 to -2 stub_1_46 eighths" class="gt_row gt_right">−1 1/2</td>
      <td headers="-1 to -2 stub_1_46 sixteenths" class="gt_row gt_right">−1 1/2</td>
      <td headers="-1 to -2 stub_1_46 hundredths" class="gt_row gt_right">−1 1/2</td></tr>
          <tr><th id="stub_1_47" scope="row" class="gt_row gt_right gt_stub">-1.6000</th>
      <td headers="-1 to -2 stub_1_47 low" class="gt_row gt_right">−1 3/5</td>
      <td headers="-1 to -2 stub_1_47 med" class="gt_row gt_right">−1 3/5</td>
      <td headers="-1 to -2 stub_1_47 high" class="gt_row gt_right">−1 3/5</td>
      <td headers="-1 to -2 stub_1_47 halves" class="gt_row gt_right">−1 1/2</td>
      <td headers="-1 to -2 stub_1_47 quarters" class="gt_row gt_right">−1 1/2</td>
      <td headers="-1 to -2 stub_1_47 eighths" class="gt_row gt_right">−1 5/8</td>
      <td headers="-1 to -2 stub_1_47 sixteenths" class="gt_row gt_right">−1 5/8</td>
      <td headers="-1 to -2 stub_1_47 hundredths" class="gt_row gt_right">−1 3/5</td></tr>
          <tr><th id="stub_1_48" scope="row" class="gt_row gt_right gt_stub">-1.7500</th>
      <td headers="-1 to -2 stub_1_48 low" class="gt_row gt_right">−1 3/4</td>
      <td headers="-1 to -2 stub_1_48 med" class="gt_row gt_right">−1 3/4</td>
      <td headers="-1 to -2 stub_1_48 high" class="gt_row gt_right">−1 3/4</td>
      <td headers="-1 to -2 stub_1_48 halves" class="gt_row gt_right">−2</td>
      <td headers="-1 to -2 stub_1_48 quarters" class="gt_row gt_right">−1 3/4</td>
      <td headers="-1 to -2 stub_1_48 eighths" class="gt_row gt_right">−1 3/4</td>
      <td headers="-1 to -2 stub_1_48 sixteenths" class="gt_row gt_right">−1 3/4</td>
      <td headers="-1 to -2 stub_1_48 hundredths" class="gt_row gt_right">−1 3/4</td></tr>
          <tr><th id="stub_1_49" scope="row" class="gt_row gt_right gt_stub">-1.9000</th>
      <td headers="-1 to -2 stub_1_49 low" class="gt_row gt_right">−1 8/9</td>
      <td headers="-1 to -2 stub_1_49 med" class="gt_row gt_right">−1 9/10</td>
      <td headers="-1 to -2 stub_1_49 high" class="gt_row gt_right">−1 9/10</td>
      <td headers="-1 to -2 stub_1_49 halves" class="gt_row gt_right">−2</td>
      <td headers="-1 to -2 stub_1_49 quarters" class="gt_row gt_right">−2</td>
      <td headers="-1 to -2 stub_1_49 eighths" class="gt_row gt_right">−1 7/8</td>
      <td headers="-1 to -2 stub_1_49 sixteenths" class="gt_row gt_right">−1 7/8</td>
      <td headers="-1 to -2 stub_1_49 hundredths" class="gt_row gt_right">−1 9/10</td></tr>
          <tr><th id="stub_1_50" scope="row" class="gt_row gt_right gt_stub">-1.9900</th>
      <td headers="-1 to -2 stub_1_50 low" class="gt_row gt_right">−2</td>
      <td headers="-1 to -2 stub_1_50 med" class="gt_row gt_right">−1 98/99</td>
      <td headers="-1 to -2 stub_1_50 high" class="gt_row gt_right">−1 99/100</td>
      <td headers="-1 to -2 stub_1_50 halves" class="gt_row gt_right">−2</td>
      <td headers="-1 to -2 stub_1_50 quarters" class="gt_row gt_right">−2</td>
      <td headers="-1 to -2 stub_1_50 eighths" class="gt_row gt_right">−2</td>
      <td headers="-1 to -2 stub_1_50 sixteenths" class="gt_row gt_right">−2</td>
      <td headers="-1 to -2 stub_1_50 hundredths" class="gt_row gt_right">−1 99/100</td></tr>
          <tr><th id="stub_1_51" scope="row" class="gt_row gt_right gt_stub">-1.9990</th>
      <td headers="-1 to -2 stub_1_51 low" class="gt_row gt_right">−2</td>
      <td headers="-1 to -2 stub_1_51 med" class="gt_row gt_right">−2</td>
      <td headers="-1 to -2 stub_1_51 high" class="gt_row gt_right">−1 998/999</td>
      <td headers="-1 to -2 stub_1_51 halves" class="gt_row gt_right">−2</td>
      <td headers="-1 to -2 stub_1_51 quarters" class="gt_row gt_right">−2</td>
      <td headers="-1 to -2 stub_1_51 eighths" class="gt_row gt_right">−2</td>
      <td headers="-1 to -2 stub_1_51 sixteenths" class="gt_row gt_right">−2</td>
      <td headers="-1 to -2 stub_1_51 hundredths" class="gt_row gt_right">−2</td></tr>
          <tr><th id="stub_1_52" scope="row" class="gt_row gt_right gt_stub">-1.9999</th>
      <td headers="-1 to -2 stub_1_52 low" class="gt_row gt_right">−2</td>
      <td headers="-1 to -2 stub_1_52 med" class="gt_row gt_right">−2</td>
      <td headers="-1 to -2 stub_1_52 high" class="gt_row gt_right">−2</td>
      <td headers="-1 to -2 stub_1_52 halves" class="gt_row gt_right">−2</td>
      <td headers="-1 to -2 stub_1_52 quarters" class="gt_row gt_right">−2</td>
      <td headers="-1 to -2 stub_1_52 eighths" class="gt_row gt_right">−2</td>
      <td headers="-1 to -2 stub_1_52 sixteenths" class="gt_row gt_right">−2</td>
      <td headers="-1 to -2 stub_1_52 hundredths" class="gt_row gt_right">−2</td></tr>
          <tr class="gt_group_heading_row">
            <th colspan="9" class="gt_group_heading" scope="colgroup" id="Exact Numbers">Exact Numbers</th>
          </tr>
          <tr class="gt_row_group_first"><th id="stub_1_53" scope="row" class="gt_row gt_right gt_stub">-1.0000</th>
      <td headers="Exact Numbers stub_1_53 low" class="gt_row gt_right">−1</td>
      <td headers="Exact Numbers stub_1_53 med" class="gt_row gt_right">−1</td>
      <td headers="Exact Numbers stub_1_53 high" class="gt_row gt_right">−1</td>
      <td headers="Exact Numbers stub_1_53 halves" class="gt_row gt_right">−1</td>
      <td headers="Exact Numbers stub_1_53 quarters" class="gt_row gt_right">−1</td>
      <td headers="Exact Numbers stub_1_53 eighths" class="gt_row gt_right">−1</td>
      <td headers="Exact Numbers stub_1_53 sixteenths" class="gt_row gt_right">−1</td>
      <td headers="Exact Numbers stub_1_53 hundredths" class="gt_row gt_right">−1</td></tr>
          <tr><th id="stub_1_54" scope="row" class="gt_row gt_right gt_stub">0.0000</th>
      <td headers="Exact Numbers stub_1_54 low" class="gt_row gt_right">0</td>
      <td headers="Exact Numbers stub_1_54 med" class="gt_row gt_right">0</td>
      <td headers="Exact Numbers stub_1_54 high" class="gt_row gt_right">0</td>
      <td headers="Exact Numbers stub_1_54 halves" class="gt_row gt_right">0</td>
      <td headers="Exact Numbers stub_1_54 quarters" class="gt_row gt_right">0</td>
      <td headers="Exact Numbers stub_1_54 eighths" class="gt_row gt_right">0</td>
      <td headers="Exact Numbers stub_1_54 sixteenths" class="gt_row gt_right">0</td>
      <td headers="Exact Numbers stub_1_54 hundredths" class="gt_row gt_right">0</td></tr>
          <tr><th id="stub_1_55" scope="row" class="gt_row gt_right gt_stub">1.0000</th>
      <td headers="Exact Numbers stub_1_55 low" class="gt_row gt_right">1</td>
      <td headers="Exact Numbers stub_1_55 med" class="gt_row gt_right">1</td>
      <td headers="Exact Numbers stub_1_55 high" class="gt_row gt_right">1</td>
      <td headers="Exact Numbers stub_1_55 halves" class="gt_row gt_right">1</td>
      <td headers="Exact Numbers stub_1_55 quarters" class="gt_row gt_right">1</td>
      <td headers="Exact Numbers stub_1_55 eighths" class="gt_row gt_right">1</td>
      <td headers="Exact Numbers stub_1_55 sixteenths" class="gt_row gt_right">1</td>
      <td headers="Exact Numbers stub_1_55 hundredths" class="gt_row gt_right">1</td></tr>
          <tr class="gt_group_heading_row">
            <th colspan="9" class="gt_group_heading" scope="colgroup" id="Not Numbers">Not Numbers</th>
          </tr>
          <tr class="gt_row_group_first"><th id="stub_1_56" scope="row" class="gt_row gt_right gt_stub">NA</th>
      <td headers="Not Numbers stub_1_56 low" class="gt_row gt_right">NA</td>
      <td headers="Not Numbers stub_1_56 med" class="gt_row gt_right">NA</td>
      <td headers="Not Numbers stub_1_56 high" class="gt_row gt_right">NA</td>
      <td headers="Not Numbers stub_1_56 halves" class="gt_row gt_right">NA</td>
      <td headers="Not Numbers stub_1_56 quarters" class="gt_row gt_right">NA</td>
      <td headers="Not Numbers stub_1_56 eighths" class="gt_row gt_right">NA</td>
      <td headers="Not Numbers stub_1_56 sixteenths" class="gt_row gt_right">NA</td>
      <td headers="Not Numbers stub_1_56 hundredths" class="gt_row gt_right">NA</td></tr>
          <tr><th id="stub_1_57" scope="row" class="gt_row gt_right gt_stub">NaN</th>
      <td headers="Not Numbers stub_1_57 low" class="gt_row gt_right">NaN</td>
      <td headers="Not Numbers stub_1_57 med" class="gt_row gt_right">NaN</td>
      <td headers="Not Numbers stub_1_57 high" class="gt_row gt_right">NaN</td>
      <td headers="Not Numbers stub_1_57 halves" class="gt_row gt_right">NaN</td>
      <td headers="Not Numbers stub_1_57 quarters" class="gt_row gt_right">NaN</td>
      <td headers="Not Numbers stub_1_57 eighths" class="gt_row gt_right">NaN</td>
      <td headers="Not Numbers stub_1_57 sixteenths" class="gt_row gt_right">NaN</td>
      <td headers="Not Numbers stub_1_57 hundredths" class="gt_row gt_right">NaN</td></tr>
          <tr><th id="stub_1_58" scope="row" class="gt_row gt_right gt_stub">Inf</th>
      <td headers="Not Numbers stub_1_58 low" class="gt_row gt_right">Inf</td>
      <td headers="Not Numbers stub_1_58 med" class="gt_row gt_right">Inf</td>
      <td headers="Not Numbers stub_1_58 high" class="gt_row gt_right">Inf</td>
      <td headers="Not Numbers stub_1_58 halves" class="gt_row gt_right">Inf</td>
      <td headers="Not Numbers stub_1_58 quarters" class="gt_row gt_right">Inf</td>
      <td headers="Not Numbers stub_1_58 eighths" class="gt_row gt_right">Inf</td>
      <td headers="Not Numbers stub_1_58 sixteenths" class="gt_row gt_right">Inf</td>
      <td headers="Not Numbers stub_1_58 hundredths" class="gt_row gt_right">Inf</td></tr>
          <tr><th id="stub_1_59" scope="row" class="gt_row gt_right gt_stub">-Inf</th>
      <td headers="Not Numbers stub_1_59 low" class="gt_row gt_right">-Inf</td>
      <td headers="Not Numbers stub_1_59 med" class="gt_row gt_right">-Inf</td>
      <td headers="Not Numbers stub_1_59 high" class="gt_row gt_right">-Inf</td>
      <td headers="Not Numbers stub_1_59 halves" class="gt_row gt_right">-Inf</td>
      <td headers="Not Numbers stub_1_59 quarters" class="gt_row gt_right">-Inf</td>
      <td headers="Not Numbers stub_1_59 eighths" class="gt_row gt_right">-Inf</td>
      <td headers="Not Numbers stub_1_59 sixteenths" class="gt_row gt_right">-Inf</td>
      <td headers="Not Numbers stub_1_59 hundredths" class="gt_row gt_right">-Inf</td></tr>
        </tbody>
        
      </table>

---

    Code
      as.character(as_latex(gt_tbl))
    Output
      [1] "\\begingroup\n\\fontsize{12.0pt}{14.0pt}\\selectfont\n\\begin{longtable}{>{\\raggedright\\arraybackslash}p{\\dimexpr 75.00pt -2\\tabcolsep-1.5\\arrayrulewidth}|>{\\raggedleft\\arraybackslash}p{\\dimexpr 75.00pt -2\\tabcolsep-1.5\\arrayrulewidth}>{\\raggedleft\\arraybackslash}p{\\dimexpr 75.00pt -2\\tabcolsep-1.5\\arrayrulewidth}>{\\raggedleft\\arraybackslash}p{\\dimexpr 75.00pt -2\\tabcolsep-1.5\\arrayrulewidth}>{\\raggedleft\\arraybackslash}p{\\dimexpr 75.00pt -2\\tabcolsep-1.5\\arrayrulewidth}>{\\raggedleft\\arraybackslash}p{\\dimexpr 75.00pt -2\\tabcolsep-1.5\\arrayrulewidth}>{\\raggedleft\\arraybackslash}p{\\dimexpr 75.00pt -2\\tabcolsep-1.5\\arrayrulewidth}>{\\raggedleft\\arraybackslash}p{\\dimexpr 75.00pt -2\\tabcolsep-1.5\\arrayrulewidth}>{\\raggedleft\\arraybackslash}p{\\dimexpr 75.00pt -2\\tabcolsep-1.5\\arrayrulewidth}}\n\\toprule\n & low & med & high & halves & quarters & eighths & sixteenths & hundredths \\\\ \n\\midrule\\addlinespace[2.5pt]\n\\multicolumn{9}{>{\\raggedright\\arraybackslash}m{750pt}}{\\parbox{\\linewidth}{0 to 1}} \\\\[2.5pt] \n\\midrule\\addlinespace[2.5pt]\n0.0001 & 0 & 0 & 0 & 0 & 0 & 0 & 0 & 0 \\\\ \n0.0010 & 0 & 0 & \\textsuperscript{1}\\!/\\textsubscript{999} & 0 & 0 & 0 & 0 & 0 \\\\ \n0.0100 & 0 & \\textsuperscript{1}\\!/\\textsubscript{99} & \\textsuperscript{1}\\!/\\textsubscript{100} & 0 & 0 & 0 & 0 & \\textsuperscript{1}\\!/\\textsubscript{100} \\\\ \n0.1000 & \\textsuperscript{1}\\!/\\textsubscript{9} & \\textsuperscript{1}\\!/\\textsubscript{10} & \\textsuperscript{1}\\!/\\textsubscript{10} & 0 & 0 & \\textsuperscript{1}\\!/\\textsubscript{8} & \\textsuperscript{2}\\!/\\textsubscript{16} & \\textsuperscript{10}\\!/\\textsubscript{100} \\\\ \n0.2500 & \\textsuperscript{1}\\!/\\textsubscript{4} & \\textsuperscript{1}\\!/\\textsubscript{4} & \\textsuperscript{1}\\!/\\textsubscript{4} & \\textsuperscript{1}\\!/\\textsubscript{2} & \\textsuperscript{1}\\!/\\textsubscript{4} & \\textsuperscript{2}\\!/\\textsubscript{8} & \\textsuperscript{4}\\!/\\textsubscript{16} & \\textsuperscript{25}\\!/\\textsubscript{100} \\\\ \n0.4000 & \\textsuperscript{2}\\!/\\textsubscript{5} & \\textsuperscript{2}\\!/\\textsubscript{5} & \\textsuperscript{2}\\!/\\textsubscript{5} & \\textsuperscript{1}\\!/\\textsubscript{2} & \\textsuperscript{2}\\!/\\textsubscript{4} & \\textsuperscript{3}\\!/\\textsubscript{8} & \\textsuperscript{6}\\!/\\textsubscript{16} & \\textsuperscript{40}\\!/\\textsubscript{100} \\\\ \n0.5000 & \\textsuperscript{1}\\!/\\textsubscript{2} & \\textsuperscript{1}\\!/\\textsubscript{2} & \\textsuperscript{1}\\!/\\textsubscript{2} & \\textsuperscript{1}\\!/\\textsubscript{2} & \\textsuperscript{2}\\!/\\textsubscript{4} & \\textsuperscript{4}\\!/\\textsubscript{8} & \\textsuperscript{8}\\!/\\textsubscript{16} & \\textsuperscript{50}\\!/\\textsubscript{100} \\\\ \n0.6000 & \\textsuperscript{3}\\!/\\textsubscript{5} & \\textsuperscript{3}\\!/\\textsubscript{5} & \\textsuperscript{3}\\!/\\textsubscript{5} & \\textsuperscript{1}\\!/\\textsubscript{2} & \\textsuperscript{2}\\!/\\textsubscript{4} & \\textsuperscript{5}\\!/\\textsubscript{8} & \\textsuperscript{10}\\!/\\textsubscript{16} & \\textsuperscript{60}\\!/\\textsubscript{100} \\\\ \n0.7500 & \\textsuperscript{3}\\!/\\textsubscript{4} & \\textsuperscript{3}\\!/\\textsubscript{4} & \\textsuperscript{3}\\!/\\textsubscript{4} & 1 & \\textsuperscript{3}\\!/\\textsubscript{4} & \\textsuperscript{6}\\!/\\textsubscript{8} & \\textsuperscript{12}\\!/\\textsubscript{16} & \\textsuperscript{75}\\!/\\textsubscript{100} \\\\ \n0.9000 & \\textsuperscript{8}\\!/\\textsubscript{9} & \\textsuperscript{9}\\!/\\textsubscript{10} & \\textsuperscript{9}\\!/\\textsubscript{10} & 1 & 1 & \\textsuperscript{7}\\!/\\textsubscript{8} & \\textsuperscript{14}\\!/\\textsubscript{16} & \\textsuperscript{90}\\!/\\textsubscript{100} \\\\ \n0.9900 & 1 & \\textsuperscript{98}\\!/\\textsubscript{99} & \\textsuperscript{99}\\!/\\textsubscript{100} & 1 & 1 & 1 & 1 & \\textsuperscript{99}\\!/\\textsubscript{100} \\\\ \n0.9990 & 1 & 1 & \\textsuperscript{998}\\!/\\textsubscript{999} & 1 & 1 & 1 & 1 & 1 \\\\ \n0.9999 & 1 & 1 & 1 & 1 & 1 & 1 & 1 & 1 \\\\ \n\\midrule\\addlinespace[2.5pt]\n\\multicolumn{9}{>{\\raggedright\\arraybackslash}m{750pt}}{\\parbox{\\linewidth}{0 to -1}} \\\\[2.5pt] \n\\midrule\\addlinespace[2.5pt]\n-0.0001 & 0 & 0 & 0 & 0 & 0 & 0 & 0 & 0 \\\\ \n-0.0010 & 0 & 0 & -\\textsuperscript{1}\\!/\\textsubscript{999} & 0 & 0 & 0 & 0 & 0 \\\\ \n-0.0100 & 0 & -\\textsuperscript{1}\\!/\\textsubscript{99} & -\\textsuperscript{1}\\!/\\textsubscript{100} & 0 & 0 & 0 & 0 & -\\textsuperscript{1}\\!/\\textsubscript{100} \\\\ \n-0.1000 & -\\textsuperscript{1}\\!/\\textsubscript{9} & -\\textsuperscript{1}\\!/\\textsubscript{10} & -\\textsuperscript{1}\\!/\\textsubscript{10} & 0 & 0 & -\\textsuperscript{1}\\!/\\textsubscript{8} & -\\textsuperscript{2}\\!/\\textsubscript{16} & -\\textsuperscript{10}\\!/\\textsubscript{100} \\\\ \n-0.2500 & -\\textsuperscript{1}\\!/\\textsubscript{4} & -\\textsuperscript{1}\\!/\\textsubscript{4} & -\\textsuperscript{1}\\!/\\textsubscript{4} & -\\textsuperscript{1}\\!/\\textsubscript{2} & -\\textsuperscript{1}\\!/\\textsubscript{4} & -\\textsuperscript{2}\\!/\\textsubscript{8} & -\\textsuperscript{4}\\!/\\textsubscript{16} & -\\textsuperscript{25}\\!/\\textsubscript{100} \\\\ \n-0.4000 & -\\textsuperscript{2}\\!/\\textsubscript{5} & -\\textsuperscript{2}\\!/\\textsubscript{5} & -\\textsuperscript{2}\\!/\\textsubscript{5} & -\\textsuperscript{1}\\!/\\textsubscript{2} & -\\textsuperscript{2}\\!/\\textsubscript{4} & -\\textsuperscript{3}\\!/\\textsubscript{8} & -\\textsuperscript{6}\\!/\\textsubscript{16} & -\\textsuperscript{40}\\!/\\textsubscript{100} \\\\ \n-0.5000 & -\\textsuperscript{1}\\!/\\textsubscript{2} & -\\textsuperscript{1}\\!/\\textsubscript{2} & -\\textsuperscript{1}\\!/\\textsubscript{2} & -\\textsuperscript{1}\\!/\\textsubscript{2} & -\\textsuperscript{2}\\!/\\textsubscript{4} & -\\textsuperscript{4}\\!/\\textsubscript{8} & -\\textsuperscript{8}\\!/\\textsubscript{16} & -\\textsuperscript{50}\\!/\\textsubscript{100} \\\\ \n-0.6000 & -\\textsuperscript{3}\\!/\\textsubscript{5} & -\\textsuperscript{3}\\!/\\textsubscript{5} & -\\textsuperscript{3}\\!/\\textsubscript{5} & -\\textsuperscript{1}\\!/\\textsubscript{2} & -\\textsuperscript{2}\\!/\\textsubscript{4} & -\\textsuperscript{5}\\!/\\textsubscript{8} & -\\textsuperscript{10}\\!/\\textsubscript{16} & -\\textsuperscript{60}\\!/\\textsubscript{100} \\\\ \n-0.7500 & -\\textsuperscript{3}\\!/\\textsubscript{4} & -\\textsuperscript{3}\\!/\\textsubscript{4} & -\\textsuperscript{3}\\!/\\textsubscript{4} & -1 & -\\textsuperscript{3}\\!/\\textsubscript{4} & -\\textsuperscript{6}\\!/\\textsubscript{8} & -\\textsuperscript{12}\\!/\\textsubscript{16} & -\\textsuperscript{75}\\!/\\textsubscript{100} \\\\ \n-0.9000 & -\\textsuperscript{8}\\!/\\textsubscript{9} & -\\textsuperscript{9}\\!/\\textsubscript{10} & -\\textsuperscript{9}\\!/\\textsubscript{10} & -1 & -1 & -\\textsuperscript{7}\\!/\\textsubscript{8} & -\\textsuperscript{14}\\!/\\textsubscript{16} & -\\textsuperscript{90}\\!/\\textsubscript{100} \\\\ \n-0.9900 & -1 & -\\textsuperscript{98}\\!/\\textsubscript{99} & -\\textsuperscript{99}\\!/\\textsubscript{100} & -1 & -1 & -1 & -1 & -\\textsuperscript{99}\\!/\\textsubscript{100} \\\\ \n-0.9990 & -1 & -1 & -\\textsuperscript{998}\\!/\\textsubscript{999} & -1 & -1 & -1 & -1 & -1 \\\\ \n-0.9999 & -1 & -1 & -1 & -1 & -1 & -1 & -1 & -1 \\\\ \n\\midrule\\addlinespace[2.5pt]\n\\multicolumn{9}{>{\\raggedright\\arraybackslash}m{750pt}}{\\parbox{\\linewidth}{1 to 2}} \\\\[2.5pt] \n\\midrule\\addlinespace[2.5pt]\n1.0001 & 1 & 1 & 1 & 1 & 1 & 1 & 1 & 1 \\\\ \n1.0010 & 1 & 1 & 1\\textsuperscript{1}\\!/\\textsubscript{999} & 1 & 1 & 1 & 1 & 1 \\\\ \n1.0100 & 1 & 1\\textsuperscript{1}\\!/\\textsubscript{99} & 1\\textsuperscript{1}\\!/\\textsubscript{100} & 1 & 1 & 1 & 1 & 1\\textsuperscript{1}\\!/\\textsubscript{100} \\\\ \n1.1000 & 1\\textsuperscript{1}\\!/\\textsubscript{9} & 1\\textsuperscript{1}\\!/\\textsubscript{10} & 1\\textsuperscript{1}\\!/\\textsubscript{10} & 1 & 1 & 1\\textsuperscript{1}\\!/\\textsubscript{8} & 1\\textsuperscript{2}\\!/\\textsubscript{16} & 1\\textsuperscript{10}\\!/\\textsubscript{100} \\\\ \n1.2500 & 1\\textsuperscript{1}\\!/\\textsubscript{4} & 1\\textsuperscript{1}\\!/\\textsubscript{4} & 1\\textsuperscript{1}\\!/\\textsubscript{4} & 1\\textsuperscript{1}\\!/\\textsubscript{2} & 1\\textsuperscript{1}\\!/\\textsubscript{4} & 1\\textsuperscript{2}\\!/\\textsubscript{8} & 1\\textsuperscript{4}\\!/\\textsubscript{16} & 1\\textsuperscript{25}\\!/\\textsubscript{100} \\\\ \n1.4000 & 1\\textsuperscript{2}\\!/\\textsubscript{5} & 1\\textsuperscript{2}\\!/\\textsubscript{5} & 1\\textsuperscript{2}\\!/\\textsubscript{5} & 1\\textsuperscript{1}\\!/\\textsubscript{2} & 1\\textsuperscript{2}\\!/\\textsubscript{4} & 1\\textsuperscript{3}\\!/\\textsubscript{8} & 1\\textsuperscript{6}\\!/\\textsubscript{16} & 1\\textsuperscript{40}\\!/\\textsubscript{100} \\\\ \n1.5000 & 1\\textsuperscript{1}\\!/\\textsubscript{2} & 1\\textsuperscript{1}\\!/\\textsubscript{2} & 1\\textsuperscript{1}\\!/\\textsubscript{2} & 1\\textsuperscript{1}\\!/\\textsubscript{2} & 1\\textsuperscript{2}\\!/\\textsubscript{4} & 1\\textsuperscript{4}\\!/\\textsubscript{8} & 1\\textsuperscript{8}\\!/\\textsubscript{16} & 1\\textsuperscript{50}\\!/\\textsubscript{100} \\\\ \n1.6000 & 1\\textsuperscript{3}\\!/\\textsubscript{5} & 1\\textsuperscript{3}\\!/\\textsubscript{5} & 1\\textsuperscript{3}\\!/\\textsubscript{5} & 1\\textsuperscript{1}\\!/\\textsubscript{2} & 1\\textsuperscript{2}\\!/\\textsubscript{4} & 1\\textsuperscript{5}\\!/\\textsubscript{8} & 1\\textsuperscript{10}\\!/\\textsubscript{16} & 1\\textsuperscript{60}\\!/\\textsubscript{100} \\\\ \n1.7500 & 1\\textsuperscript{3}\\!/\\textsubscript{4} & 1\\textsuperscript{3}\\!/\\textsubscript{4} & 1\\textsuperscript{3}\\!/\\textsubscript{4} & 2 & 1\\textsuperscript{3}\\!/\\textsubscript{4} & 1\\textsuperscript{6}\\!/\\textsubscript{8} & 1\\textsuperscript{12}\\!/\\textsubscript{16} & 1\\textsuperscript{75}\\!/\\textsubscript{100} \\\\ \n1.9000 & 1\\textsuperscript{8}\\!/\\textsubscript{9} & 1\\textsuperscript{9}\\!/\\textsubscript{10} & 1\\textsuperscript{9}\\!/\\textsubscript{10} & 2 & 2 & 1\\textsuperscript{7}\\!/\\textsubscript{8} & 1\\textsuperscript{14}\\!/\\textsubscript{16} & 1\\textsuperscript{90}\\!/\\textsubscript{100} \\\\ \n1.9900 & 2 & 1\\textsuperscript{98}\\!/\\textsubscript{99} & 1\\textsuperscript{99}\\!/\\textsubscript{100} & 2 & 2 & 2 & 2 & 1\\textsuperscript{99}\\!/\\textsubscript{100} \\\\ \n1.9990 & 2 & 2 & 1\\textsuperscript{998}\\!/\\textsubscript{999} & 2 & 2 & 2 & 2 & 2 \\\\ \n1.9999 & 2 & 2 & 2 & 2 & 2 & 2 & 2 & 2 \\\\ \n\\midrule\\addlinespace[2.5pt]\n\\multicolumn{9}{>{\\raggedright\\arraybackslash}m{750pt}}{\\parbox{\\linewidth}{-1 to -2}} \\\\[2.5pt] \n\\midrule\\addlinespace[2.5pt]\n-1.0001 & -1 & -1 & -1 & -1 & -1 & -1 & -1 & -1 \\\\ \n-1.0010 & -1 & -1 & -1\\textsuperscript{1}\\!/\\textsubscript{999} & -1 & -1 & -1 & -1 & -1 \\\\ \n-1.0100 & -1 & -1\\textsuperscript{1}\\!/\\textsubscript{99} & -1\\textsuperscript{1}\\!/\\textsubscript{100} & -1 & -1 & -1 & -1 & -1\\textsuperscript{1}\\!/\\textsubscript{100} \\\\ \n-1.1000 & -1\\textsuperscript{1}\\!/\\textsubscript{9} & -1\\textsuperscript{1}\\!/\\textsubscript{10} & -1\\textsuperscript{1}\\!/\\textsubscript{10} & -1 & -1 & -1\\textsuperscript{1}\\!/\\textsubscript{8} & -1\\textsuperscript{2}\\!/\\textsubscript{16} & -1\\textsuperscript{10}\\!/\\textsubscript{100} \\\\ \n-1.2500 & -1\\textsuperscript{1}\\!/\\textsubscript{4} & -1\\textsuperscript{1}\\!/\\textsubscript{4} & -1\\textsuperscript{1}\\!/\\textsubscript{4} & -1\\textsuperscript{1}\\!/\\textsubscript{2} & -1\\textsuperscript{1}\\!/\\textsubscript{4} & -1\\textsuperscript{2}\\!/\\textsubscript{8} & -1\\textsuperscript{4}\\!/\\textsubscript{16} & -1\\textsuperscript{25}\\!/\\textsubscript{100} \\\\ \n-1.4000 & -1\\textsuperscript{2}\\!/\\textsubscript{5} & -1\\textsuperscript{2}\\!/\\textsubscript{5} & -1\\textsuperscript{2}\\!/\\textsubscript{5} & -1\\textsuperscript{1}\\!/\\textsubscript{2} & -1\\textsuperscript{2}\\!/\\textsubscript{4} & -1\\textsuperscript{3}\\!/\\textsubscript{8} & -1\\textsuperscript{6}\\!/\\textsubscript{16} & -1\\textsuperscript{40}\\!/\\textsubscript{100} \\\\ \n-1.5000 & -1\\textsuperscript{1}\\!/\\textsubscript{2} & -1\\textsuperscript{1}\\!/\\textsubscript{2} & -1\\textsuperscript{1}\\!/\\textsubscript{2} & -1\\textsuperscript{1}\\!/\\textsubscript{2} & -1\\textsuperscript{2}\\!/\\textsubscript{4} & -1\\textsuperscript{4}\\!/\\textsubscript{8} & -1\\textsuperscript{8}\\!/\\textsubscript{16} & -1\\textsuperscript{50}\\!/\\textsubscript{100} \\\\ \n-1.6000 & -1\\textsuperscript{3}\\!/\\textsubscript{5} & -1\\textsuperscript{3}\\!/\\textsubscript{5} & -1\\textsuperscript{3}\\!/\\textsubscript{5} & -1\\textsuperscript{1}\\!/\\textsubscript{2} & -1\\textsuperscript{2}\\!/\\textsubscript{4} & -1\\textsuperscript{5}\\!/\\textsubscript{8} & -1\\textsuperscript{10}\\!/\\textsubscript{16} & -1\\textsuperscript{60}\\!/\\textsubscript{100} \\\\ \n-1.7500 & -1\\textsuperscript{3}\\!/\\textsubscript{4} & -1\\textsuperscript{3}\\!/\\textsubscript{4} & -1\\textsuperscript{3}\\!/\\textsubscript{4} & -2 & -1\\textsuperscript{3}\\!/\\textsubscript{4} & -1\\textsuperscript{6}\\!/\\textsubscript{8} & -1\\textsuperscript{12}\\!/\\textsubscript{16} & -1\\textsuperscript{75}\\!/\\textsubscript{100} \\\\ \n-1.9000 & -1\\textsuperscript{8}\\!/\\textsubscript{9} & -1\\textsuperscript{9}\\!/\\textsubscript{10} & -1\\textsuperscript{9}\\!/\\textsubscript{10} & -2 & -2 & -1\\textsuperscript{7}\\!/\\textsubscript{8} & -1\\textsuperscript{14}\\!/\\textsubscript{16} & -1\\textsuperscript{90}\\!/\\textsubscript{100} \\\\ \n-1.9900 & -2 & -1\\textsuperscript{98}\\!/\\textsubscript{99} & -1\\textsuperscript{99}\\!/\\textsubscript{100} & -2 & -2 & -2 & -2 & -1\\textsuperscript{99}\\!/\\textsubscript{100} \\\\ \n-1.9990 & -2 & -2 & -1\\textsuperscript{998}\\!/\\textsubscript{999} & -2 & -2 & -2 & -2 & -2 \\\\ \n-1.9999 & -2 & -2 & -2 & -2 & -2 & -2 & -2 & -2 \\\\ \n\\midrule\\addlinespace[2.5pt]\n\\multicolumn{9}{>{\\raggedright\\arraybackslash}m{750pt}}{\\parbox{\\linewidth}{Exact Numbers}} \\\\[2.5pt] \n\\midrule\\addlinespace[2.5pt]\n-1.0000 & -1 & -1 & -1 & -1 & -1 & -1 & -1 & -1 \\\\ \n0.0000 & 0 & 0 & 0 & 0 & 0 & 0 & 0 & 0 \\\\ \n1.0000 & 1 & 1 & 1 & 1 & 1 & 1 & 1 & 1 \\\\ \n\\midrule\\addlinespace[2.5pt]\n\\multicolumn{9}{>{\\raggedright\\arraybackslash}m{750pt}}{\\parbox{\\linewidth}{Not Numbers}} \\\\[2.5pt] \n\\midrule\\addlinespace[2.5pt]\nNA & NA & NA & NA & NA & NA & NA & NA & NA \\\\ \nNaN & NaN & NaN & NaN & NaN & NaN & NaN & NaN & NaN \\\\ \nInf & Inf & Inf & Inf & Inf & Inf & Inf & Inf & Inf \\\\ \n-Inf & -Inf & -Inf & -Inf & -Inf & -Inf & -Inf & -Inf & -Inf \\\\ \n\\bottomrule\n\\end{longtable}\n\\endgroup\n"

---

    Code
      as.character(as_latex(gt_tbl))
    Output
      [1] "\\begingroup\n\\fontsize{12.0pt}{14.0pt}\\selectfont\n\\begin{longtable}{>{\\raggedright\\arraybackslash}p{\\dimexpr 75.00pt -2\\tabcolsep-1.5\\arrayrulewidth}|>{\\raggedleft\\arraybackslash}p{\\dimexpr 75.00pt -2\\tabcolsep-1.5\\arrayrulewidth}>{\\raggedleft\\arraybackslash}p{\\dimexpr 75.00pt -2\\tabcolsep-1.5\\arrayrulewidth}>{\\raggedleft\\arraybackslash}p{\\dimexpr 75.00pt -2\\tabcolsep-1.5\\arrayrulewidth}>{\\raggedleft\\arraybackslash}p{\\dimexpr 75.00pt -2\\tabcolsep-1.5\\arrayrulewidth}>{\\raggedleft\\arraybackslash}p{\\dimexpr 75.00pt -2\\tabcolsep-1.5\\arrayrulewidth}>{\\raggedleft\\arraybackslash}p{\\dimexpr 75.00pt -2\\tabcolsep-1.5\\arrayrulewidth}>{\\raggedleft\\arraybackslash}p{\\dimexpr 75.00pt -2\\tabcolsep-1.5\\arrayrulewidth}>{\\raggedleft\\arraybackslash}p{\\dimexpr 75.00pt -2\\tabcolsep-1.5\\arrayrulewidth}}\n\\toprule\n & low & med & high & halves & quarters & eighths & sixteenths & hundredths \\\\ \n\\midrule\\addlinespace[2.5pt]\n\\multicolumn{9}{>{\\raggedright\\arraybackslash}m{750pt}}{\\parbox{\\linewidth}{0 to 1}} \\\\[2.5pt] \n\\midrule\\addlinespace[2.5pt]\n0.0001 & 0 & 0 & 0 & 0 & 0 & 0 & 0 & 0 \\\\ \n0.0010 & 0 & 0 & 1/999 & 0 & 0 & 0 & 0 & 0 \\\\ \n0.0100 & 0 & 1/99 & 1/100 & 0 & 0 & 0 & 0 & 1/100 \\\\ \n0.1000 & 1/9 & 1/10 & 1/10 & 0 & 0 & 1/8 & 2/16 & 10/100 \\\\ \n0.2500 & 1/4 & 1/4 & 1/4 & 1/2 & 1/4 & 2/8 & 4/16 & 25/100 \\\\ \n0.4000 & 2/5 & 2/5 & 2/5 & 1/2 & 2/4 & 3/8 & 6/16 & 40/100 \\\\ \n0.5000 & 1/2 & 1/2 & 1/2 & 1/2 & 2/4 & 4/8 & 8/16 & 50/100 \\\\ \n0.6000 & 3/5 & 3/5 & 3/5 & 1/2 & 2/4 & 5/8 & 10/16 & 60/100 \\\\ \n0.7500 & 3/4 & 3/4 & 3/4 & 1 & 3/4 & 6/8 & 12/16 & 75/100 \\\\ \n0.9000 & 8/9 & 9/10 & 9/10 & 1 & 1 & 7/8 & 14/16 & 90/100 \\\\ \n0.9900 & 1 & 98/99 & 99/100 & 1 & 1 & 1 & 1 & 99/100 \\\\ \n0.9990 & 1 & 1 & 998/999 & 1 & 1 & 1 & 1 & 1 \\\\ \n0.9999 & 1 & 1 & 1 & 1 & 1 & 1 & 1 & 1 \\\\ \n\\midrule\\addlinespace[2.5pt]\n\\multicolumn{9}{>{\\raggedright\\arraybackslash}m{750pt}}{\\parbox{\\linewidth}{0 to -1}} \\\\[2.5pt] \n\\midrule\\addlinespace[2.5pt]\n-0.0001 & 0 & 0 & 0 & 0 & 0 & 0 & 0 & 0 \\\\ \n-0.0010 & 0 & 0 & -1/999 & 0 & 0 & 0 & 0 & 0 \\\\ \n-0.0100 & 0 & -1/99 & -1/100 & 0 & 0 & 0 & 0 & -1/100 \\\\ \n-0.1000 & -1/9 & -1/10 & -1/10 & 0 & 0 & -1/8 & -2/16 & -10/100 \\\\ \n-0.2500 & -1/4 & -1/4 & -1/4 & -1/2 & -1/4 & -2/8 & -4/16 & -25/100 \\\\ \n-0.4000 & -2/5 & -2/5 & -2/5 & -1/2 & -2/4 & -3/8 & -6/16 & -40/100 \\\\ \n-0.5000 & -1/2 & -1/2 & -1/2 & -1/2 & -2/4 & -4/8 & -8/16 & -50/100 \\\\ \n-0.6000 & -3/5 & -3/5 & -3/5 & -1/2 & -2/4 & -5/8 & -10/16 & -60/100 \\\\ \n-0.7500 & -3/4 & -3/4 & -3/4 & -1 & -3/4 & -6/8 & -12/16 & -75/100 \\\\ \n-0.9000 & -8/9 & -9/10 & -9/10 & -1 & -1 & -7/8 & -14/16 & -90/100 \\\\ \n-0.9900 & -1 & -98/99 & -99/100 & -1 & -1 & -1 & -1 & -99/100 \\\\ \n-0.9990 & -1 & -1 & -998/999 & -1 & -1 & -1 & -1 & -1 \\\\ \n-0.9999 & -1 & -1 & -1 & -1 & -1 & -1 & -1 & -1 \\\\ \n\\midrule\\addlinespace[2.5pt]\n\\multicolumn{9}{>{\\raggedright\\arraybackslash}m{750pt}}{\\parbox{\\linewidth}{1 to 2}} \\\\[2.5pt] \n\\midrule\\addlinespace[2.5pt]\n1.0001 & 1 & 1 & 1 & 1 & 1 & 1 & 1 & 1 \\\\ \n1.0010 & 1 & 1 & 1\\ 1/999 & 1 & 1 & 1 & 1 & 1 \\\\ \n1.0100 & 1 & 1\\ 1/99 & 1\\ 1/100 & 1 & 1 & 1 & 1 & 1\\ 1/100 \\\\ \n1.1000 & 1\\ 1/9 & 1\\ 1/10 & 1\\ 1/10 & 1 & 1 & 1\\ 1/8 & 1\\ 2/16 & 1\\ 10/100 \\\\ \n1.2500 & 1\\ 1/4 & 1\\ 1/4 & 1\\ 1/4 & 1\\ 1/2 & 1\\ 1/4 & 1\\ 2/8 & 1\\ 4/16 & 1\\ 25/100 \\\\ \n1.4000 & 1\\ 2/5 & 1\\ 2/5 & 1\\ 2/5 & 1\\ 1/2 & 1\\ 2/4 & 1\\ 3/8 & 1\\ 6/16 & 1\\ 40/100 \\\\ \n1.5000 & 1\\ 1/2 & 1\\ 1/2 & 1\\ 1/2 & 1\\ 1/2 & 1\\ 2/4 & 1\\ 4/8 & 1\\ 8/16 & 1\\ 50/100 \\\\ \n1.6000 & 1\\ 3/5 & 1\\ 3/5 & 1\\ 3/5 & 1\\ 1/2 & 1\\ 2/4 & 1\\ 5/8 & 1\\ 10/16 & 1\\ 60/100 \\\\ \n1.7500 & 1\\ 3/4 & 1\\ 3/4 & 1\\ 3/4 & 2 & 1\\ 3/4 & 1\\ 6/8 & 1\\ 12/16 & 1\\ 75/100 \\\\ \n1.9000 & 1\\ 8/9 & 1\\ 9/10 & 1\\ 9/10 & 2 & 2 & 1\\ 7/8 & 1\\ 14/16 & 1\\ 90/100 \\\\ \n1.9900 & 2 & 1\\ 98/99 & 1\\ 99/100 & 2 & 2 & 2 & 2 & 1\\ 99/100 \\\\ \n1.9990 & 2 & 2 & 1\\ 998/999 & 2 & 2 & 2 & 2 & 2 \\\\ \n1.9999 & 2 & 2 & 2 & 2 & 2 & 2 & 2 & 2 \\\\ \n\\midrule\\addlinespace[2.5pt]\n\\multicolumn{9}{>{\\raggedright\\arraybackslash}m{750pt}}{\\parbox{\\linewidth}{-1 to -2}} \\\\[2.5pt] \n\\midrule\\addlinespace[2.5pt]\n-1.0001 & -1 & -1 & -1 & -1 & -1 & -1 & -1 & -1 \\\\ \n-1.0010 & -1 & -1 & -1\\ 1/999 & -1 & -1 & -1 & -1 & -1 \\\\ \n-1.0100 & -1 & -1\\ 1/99 & -1\\ 1/100 & -1 & -1 & -1 & -1 & -1\\ 1/100 \\\\ \n-1.1000 & -1\\ 1/9 & -1\\ 1/10 & -1\\ 1/10 & -1 & -1 & -1\\ 1/8 & -1\\ 2/16 & -1\\ 10/100 \\\\ \n-1.2500 & -1\\ 1/4 & -1\\ 1/4 & -1\\ 1/4 & -1\\ 1/2 & -1\\ 1/4 & -1\\ 2/8 & -1\\ 4/16 & -1\\ 25/100 \\\\ \n-1.4000 & -1\\ 2/5 & -1\\ 2/5 & -1\\ 2/5 & -1\\ 1/2 & -1\\ 2/4 & -1\\ 3/8 & -1\\ 6/16 & -1\\ 40/100 \\\\ \n-1.5000 & -1\\ 1/2 & -1\\ 1/2 & -1\\ 1/2 & -1\\ 1/2 & -1\\ 2/4 & -1\\ 4/8 & -1\\ 8/16 & -1\\ 50/100 \\\\ \n-1.6000 & -1\\ 3/5 & -1\\ 3/5 & -1\\ 3/5 & -1\\ 1/2 & -1\\ 2/4 & -1\\ 5/8 & -1\\ 10/16 & -1\\ 60/100 \\\\ \n-1.7500 & -1\\ 3/4 & -1\\ 3/4 & -1\\ 3/4 & -2 & -1\\ 3/4 & -1\\ 6/8 & -1\\ 12/16 & -1\\ 75/100 \\\\ \n-1.9000 & -1\\ 8/9 & -1\\ 9/10 & -1\\ 9/10 & -2 & -2 & -1\\ 7/8 & -1\\ 14/16 & -1\\ 90/100 \\\\ \n-1.9900 & -2 & -1\\ 98/99 & -1\\ 99/100 & -2 & -2 & -2 & -2 & -1\\ 99/100 \\\\ \n-1.9990 & -2 & -2 & -1\\ 998/999 & -2 & -2 & -2 & -2 & -2 \\\\ \n-1.9999 & -2 & -2 & -2 & -2 & -2 & -2 & -2 & -2 \\\\ \n\\midrule\\addlinespace[2.5pt]\n\\multicolumn{9}{>{\\raggedright\\arraybackslash}m{750pt}}{\\parbox{\\linewidth}{Exact Numbers}} \\\\[2.5pt] \n\\midrule\\addlinespace[2.5pt]\n-1.0000 & -1 & -1 & -1 & -1 & -1 & -1 & -1 & -1 \\\\ \n0.0000 & 0 & 0 & 0 & 0 & 0 & 0 & 0 & 0 \\\\ \n1.0000 & 1 & 1 & 1 & 1 & 1 & 1 & 1 & 1 \\\\ \n\\midrule\\addlinespace[2.5pt]\n\\multicolumn{9}{>{\\raggedright\\arraybackslash}m{750pt}}{\\parbox{\\linewidth}{Not Numbers}} \\\\[2.5pt] \n\\midrule\\addlinespace[2.5pt]\nNA & NA & NA & NA & NA & NA & NA & NA & NA \\\\ \nNaN & NaN & NaN & NaN & NaN & NaN & NaN & NaN & NaN \\\\ \nInf & Inf & Inf & Inf & Inf & Inf & Inf & Inf & Inf \\\\ \n-Inf & -Inf & -Inf & -Inf & -Inf & -Inf & -Inf & -Inf & -Inf \\\\ \n\\bottomrule\n\\end{longtable}\n\\endgroup\n"

---

    Code
      as.character(as_latex(gt_tbl))
    Output
      [1] "\\begingroup\n\\fontsize{12.0pt}{14.0pt}\\selectfont\n\\begin{longtable}{>{\\raggedright\\arraybackslash}p{\\dimexpr 75.00pt -2\\tabcolsep-1.5\\arrayrulewidth}|>{\\raggedleft\\arraybackslash}p{\\dimexpr 75.00pt -2\\tabcolsep-1.5\\arrayrulewidth}>{\\raggedleft\\arraybackslash}p{\\dimexpr 75.00pt -2\\tabcolsep-1.5\\arrayrulewidth}>{\\raggedleft\\arraybackslash}p{\\dimexpr 75.00pt -2\\tabcolsep-1.5\\arrayrulewidth}>{\\raggedleft\\arraybackslash}p{\\dimexpr 75.00pt -2\\tabcolsep-1.5\\arrayrulewidth}>{\\raggedleft\\arraybackslash}p{\\dimexpr 75.00pt -2\\tabcolsep-1.5\\arrayrulewidth}>{\\raggedleft\\arraybackslash}p{\\dimexpr 75.00pt -2\\tabcolsep-1.5\\arrayrulewidth}>{\\raggedleft\\arraybackslash}p{\\dimexpr 75.00pt -2\\tabcolsep-1.5\\arrayrulewidth}>{\\raggedleft\\arraybackslash}p{\\dimexpr 75.00pt -2\\tabcolsep-1.5\\arrayrulewidth}}\n\\toprule\n & low & med & high & halves & quarters & eighths & sixteenths & hundredths \\\\ \n\\midrule\\addlinespace[2.5pt]\n\\multicolumn{9}{>{\\raggedright\\arraybackslash}m{750pt}}{\\parbox{\\linewidth}{0 to 1}} \\\\[2.5pt] \n\\midrule\\addlinespace[2.5pt]\n0.0001 & 0 & 0 & 0 & 0 & 0 & 0 & 0 & 0 \\\\ \n0.0010 & 0 & 0 & 1/999 & 0 & 0 & 0 & 0 & 0 \\\\ \n0.0100 & 0 & 1/99 & 1/100 & 0 & 0 & 0 & 0 & 1/100 \\\\ \n0.1000 & 1/9 & 1/10 & 1/10 & 0 & 0 & 1/8 & 1/8 & 1/10 \\\\ \n0.2500 & 1/4 & 1/4 & 1/4 & 1/2 & 1/4 & 1/4 & 1/4 & 1/4 \\\\ \n0.4000 & 2/5 & 2/5 & 2/5 & 1/2 & 1/2 & 3/8 & 3/8 & 2/5 \\\\ \n0.5000 & 1/2 & 1/2 & 1/2 & 1/2 & 1/2 & 1/2 & 1/2 & 1/2 \\\\ \n0.6000 & 3/5 & 3/5 & 3/5 & 1/2 & 1/2 & 5/8 & 5/8 & 3/5 \\\\ \n0.7500 & 3/4 & 3/4 & 3/4 & 1 & 3/4 & 3/4 & 3/4 & 3/4 \\\\ \n0.9000 & 8/9 & 9/10 & 9/10 & 1 & 1 & 7/8 & 7/8 & 9/10 \\\\ \n0.9900 & 1 & 98/99 & 99/100 & 1 & 1 & 1 & 1 & 99/100 \\\\ \n0.9990 & 1 & 1 & 998/999 & 1 & 1 & 1 & 1 & 1 \\\\ \n0.9999 & 1 & 1 & 1 & 1 & 1 & 1 & 1 & 1 \\\\ \n\\midrule\\addlinespace[2.5pt]\n\\multicolumn{9}{>{\\raggedright\\arraybackslash}m{750pt}}{\\parbox{\\linewidth}{0 to -1}} \\\\[2.5pt] \n\\midrule\\addlinespace[2.5pt]\n-0.0001 & 0 & 0 & 0 & 0 & 0 & 0 & 0 & 0 \\\\ \n-0.0010 & 0 & 0 & -1/999 & 0 & 0 & 0 & 0 & 0 \\\\ \n-0.0100 & 0 & -1/99 & -1/100 & 0 & 0 & 0 & 0 & -1/100 \\\\ \n-0.1000 & -1/9 & -1/10 & -1/10 & 0 & 0 & -1/8 & -1/8 & -1/10 \\\\ \n-0.2500 & -1/4 & -1/4 & -1/4 & -1/2 & -1/4 & -1/4 & -1/4 & -1/4 \\\\ \n-0.4000 & -2/5 & -2/5 & -2/5 & -1/2 & -1/2 & -3/8 & -3/8 & -2/5 \\\\ \n-0.5000 & -1/2 & -1/2 & -1/2 & -1/2 & -1/2 & -1/2 & -1/2 & -1/2 \\\\ \n-0.6000 & -3/5 & -3/5 & -3/5 & -1/2 & -1/2 & -5/8 & -5/8 & -3/5 \\\\ \n-0.7500 & -3/4 & -3/4 & -3/4 & -1 & -3/4 & -3/4 & -3/4 & -3/4 \\\\ \n-0.9000 & -8/9 & -9/10 & -9/10 & -1 & -1 & -7/8 & -7/8 & -9/10 \\\\ \n-0.9900 & -1 & -98/99 & -99/100 & -1 & -1 & -1 & -1 & -99/100 \\\\ \n-0.9990 & -1 & -1 & -998/999 & -1 & -1 & -1 & -1 & -1 \\\\ \n-0.9999 & -1 & -1 & -1 & -1 & -1 & -1 & -1 & -1 \\\\ \n\\midrule\\addlinespace[2.5pt]\n\\multicolumn{9}{>{\\raggedright\\arraybackslash}m{750pt}}{\\parbox{\\linewidth}{1 to 2}} \\\\[2.5pt] \n\\midrule\\addlinespace[2.5pt]\n1.0001 & 1 & 1 & 1 & 1 & 1 & 1 & 1 & 1 \\\\ \n1.0010 & 1 & 1 & 1\\ 1/999 & 1 & 1 & 1 & 1 & 1 \\\\ \n1.0100 & 1 & 1\\ 1/99 & 1\\ 1/100 & 1 & 1 & 1 & 1 & 1\\ 1/100 \\\\ \n1.1000 & 1\\ 1/9 & 1\\ 1/10 & 1\\ 1/10 & 1 & 1 & 1\\ 1/8 & 1\\ 1/8 & 1\\ 1/10 \\\\ \n1.2500 & 1\\ 1/4 & 1\\ 1/4 & 1\\ 1/4 & 1\\ 1/2 & 1\\ 1/4 & 1\\ 1/4 & 1\\ 1/4 & 1\\ 1/4 \\\\ \n1.4000 & 1\\ 2/5 & 1\\ 2/5 & 1\\ 2/5 & 1\\ 1/2 & 1\\ 1/2 & 1\\ 3/8 & 1\\ 3/8 & 1\\ 2/5 \\\\ \n1.5000 & 1\\ 1/2 & 1\\ 1/2 & 1\\ 1/2 & 1\\ 1/2 & 1\\ 1/2 & 1\\ 1/2 & 1\\ 1/2 & 1\\ 1/2 \\\\ \n1.6000 & 1\\ 3/5 & 1\\ 3/5 & 1\\ 3/5 & 1\\ 1/2 & 1\\ 1/2 & 1\\ 5/8 & 1\\ 5/8 & 1\\ 3/5 \\\\ \n1.7500 & 1\\ 3/4 & 1\\ 3/4 & 1\\ 3/4 & 2 & 1\\ 3/4 & 1\\ 3/4 & 1\\ 3/4 & 1\\ 3/4 \\\\ \n1.9000 & 1\\ 8/9 & 1\\ 9/10 & 1\\ 9/10 & 2 & 2 & 1\\ 7/8 & 1\\ 7/8 & 1\\ 9/10 \\\\ \n1.9900 & 2 & 1\\ 98/99 & 1\\ 99/100 & 2 & 2 & 2 & 2 & 1\\ 99/100 \\\\ \n1.9990 & 2 & 2 & 1\\ 998/999 & 2 & 2 & 2 & 2 & 2 \\\\ \n1.9999 & 2 & 2 & 2 & 2 & 2 & 2 & 2 & 2 \\\\ \n\\midrule\\addlinespace[2.5pt]\n\\multicolumn{9}{>{\\raggedright\\arraybackslash}m{750pt}}{\\parbox{\\linewidth}{-1 to -2}} \\\\[2.5pt] \n\\midrule\\addlinespace[2.5pt]\n-1.0001 & -1 & -1 & -1 & -1 & -1 & -1 & -1 & -1 \\\\ \n-1.0010 & -1 & -1 & -1\\ 1/999 & -1 & -1 & -1 & -1 & -1 \\\\ \n-1.0100 & -1 & -1\\ 1/99 & -1\\ 1/100 & -1 & -1 & -1 & -1 & -1\\ 1/100 \\\\ \n-1.1000 & -1\\ 1/9 & -1\\ 1/10 & -1\\ 1/10 & -1 & -1 & -1\\ 1/8 & -1\\ 1/8 & -1\\ 1/10 \\\\ \n-1.2500 & -1\\ 1/4 & -1\\ 1/4 & -1\\ 1/4 & -1\\ 1/2 & -1\\ 1/4 & -1\\ 1/4 & -1\\ 1/4 & -1\\ 1/4 \\\\ \n-1.4000 & -1\\ 2/5 & -1\\ 2/5 & -1\\ 2/5 & -1\\ 1/2 & -1\\ 1/2 & -1\\ 3/8 & -1\\ 3/8 & -1\\ 2/5 \\\\ \n-1.5000 & -1\\ 1/2 & -1\\ 1/2 & -1\\ 1/2 & -1\\ 1/2 & -1\\ 1/2 & -1\\ 1/2 & -1\\ 1/2 & -1\\ 1/2 \\\\ \n-1.6000 & -1\\ 3/5 & -1\\ 3/5 & -1\\ 3/5 & -1\\ 1/2 & -1\\ 1/2 & -1\\ 5/8 & -1\\ 5/8 & -1\\ 3/5 \\\\ \n-1.7500 & -1\\ 3/4 & -1\\ 3/4 & -1\\ 3/4 & -2 & -1\\ 3/4 & -1\\ 3/4 & -1\\ 3/4 & -1\\ 3/4 \\\\ \n-1.9000 & -1\\ 8/9 & -1\\ 9/10 & -1\\ 9/10 & -2 & -2 & -1\\ 7/8 & -1\\ 7/8 & -1\\ 9/10 \\\\ \n-1.9900 & -2 & -1\\ 98/99 & -1\\ 99/100 & -2 & -2 & -2 & -2 & -1\\ 99/100 \\\\ \n-1.9990 & -2 & -2 & -1\\ 998/999 & -2 & -2 & -2 & -2 & -2 \\\\ \n-1.9999 & -2 & -2 & -2 & -2 & -2 & -2 & -2 & -2 \\\\ \n\\midrule\\addlinespace[2.5pt]\n\\multicolumn{9}{>{\\raggedright\\arraybackslash}m{750pt}}{\\parbox{\\linewidth}{Exact Numbers}} \\\\[2.5pt] \n\\midrule\\addlinespace[2.5pt]\n-1.0000 & -1 & -1 & -1 & -1 & -1 & -1 & -1 & -1 \\\\ \n0.0000 & 0 & 0 & 0 & 0 & 0 & 0 & 0 & 0 \\\\ \n1.0000 & 1 & 1 & 1 & 1 & 1 & 1 & 1 & 1 \\\\ \n\\midrule\\addlinespace[2.5pt]\n\\multicolumn{9}{>{\\raggedright\\arraybackslash}m{750pt}}{\\parbox{\\linewidth}{Not Numbers}} \\\\[2.5pt] \n\\midrule\\addlinespace[2.5pt]\nNA & NA & NA & NA & NA & NA & NA & NA & NA \\\\ \nNaN & NaN & NaN & NaN & NaN & NaN & NaN & NaN & NaN \\\\ \nInf & Inf & Inf & Inf & Inf & Inf & Inf & Inf & Inf \\\\ \n-Inf & -Inf & -Inf & -Inf & -Inf & -Inf & -Inf & -Inf & -Inf \\\\ \n\\bottomrule\n\\end{longtable}\n\\endgroup\n"

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
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85\clbrdrb\brdrs\brdrw20\brdrcf1 \cellx1500
      \intbl {\f0 {\f0\fs20 }}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85\clbrdrb\brdrs\brdrw20\brdrcf1 \cellx3000
      \intbl {\f0 {\f0\fs20 low}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85\clbrdrb\brdrs\brdrw20\brdrcf1 \cellx4500
      \intbl {\f0 {\f0\fs20 med}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85\clbrdrb\brdrs\brdrw20\brdrcf1 \cellx6000
      \intbl {\f0 {\f0\fs20 high}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85\clbrdrb\brdrs\brdrw20\brdrcf1 \cellx7500
      \intbl {\f0 {\f0\fs20 halves}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85\clbrdrb\brdrs\brdrw20\brdrcf1 \cellx9000
      \intbl {\f0 {\f0\fs20 quarters}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85\clbrdrb\brdrs\brdrw20\brdrcf1 \cellx10500
      \intbl {\f0 {\f0\fs20 eighths}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85\clbrdrb\brdrs\brdrw20\brdrcf1 \cellx12000
      \intbl {\f0 {\f0\fs20 sixteenths}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85\clbrdrb\brdrs\brdrw20\brdrcf1 \cellx13500
      \intbl {\f0 {\f0\fs20 hundredths}}\cell
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\ql\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx13500
      \intbl {\f0\fs20 0 to 1}\cell
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx1500
      \intbl {\f0 {\f0\fs20 0.0001}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx3000
      \intbl {\f0 {\f0\fs20 0}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx4500
      \intbl {\f0 {\f0\fs20 0}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx6000
      \intbl {\f0 {\f0\fs20 0}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx7500
      \intbl {\f0 {\f0\fs20 0}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx9000
      \intbl {\f0 {\f0\fs20 0}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx10500
      \intbl {\f0 {\f0\fs20 0}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx12000
      \intbl {\f0 {\f0\fs20 0}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx13500
      \intbl {\f0 {\f0\fs20 0}}\cell
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx1500
      \intbl {\f0 {\f0\fs20 0.0010}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx3000
      \intbl {\f0 {\f0\fs20 0}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx4500
      \intbl {\f0 {\f0\fs20 0}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx6000
      \intbl {\f0 {\f0\fs20 {\super 1}/{\sub 999}}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx7500
      \intbl {\f0 {\f0\fs20 0}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx9000
      \intbl {\f0 {\f0\fs20 0}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx10500
      \intbl {\f0 {\f0\fs20 0}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx12000
      \intbl {\f0 {\f0\fs20 0}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx13500
      \intbl {\f0 {\f0\fs20 0}}\cell
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx1500
      \intbl {\f0 {\f0\fs20 0.0100}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx3000
      \intbl {\f0 {\f0\fs20 0}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx4500
      \intbl {\f0 {\f0\fs20 {\super 1}/{\sub 99}}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx6000
      \intbl {\f0 {\f0\fs20 {\super 1}/{\sub 100}}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx7500
      \intbl {\f0 {\f0\fs20 0}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx9000
      \intbl {\f0 {\f0\fs20 0}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx10500
      \intbl {\f0 {\f0\fs20 0}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx12000
      \intbl {\f0 {\f0\fs20 0}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx13500
      \intbl {\f0 {\f0\fs20 {\super 1}/{\sub 100}}}\cell
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx1500
      \intbl {\f0 {\f0\fs20 0.1000}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx3000
      \intbl {\f0 {\f0\fs20 {\super 1}/{\sub 9}}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx4500
      \intbl {\f0 {\f0\fs20 {\super 1}/{\sub 10}}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx6000
      \intbl {\f0 {\f0\fs20 {\super 1}/{\sub 10}}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx7500
      \intbl {\f0 {\f0\fs20 0}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx9000
      \intbl {\f0 {\f0\fs20 0}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx10500
      \intbl {\f0 {\f0\fs20 {\super 1}/{\sub 8}}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx12000
      \intbl {\f0 {\f0\fs20 {\super 2}/{\sub 16}}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx13500
      \intbl {\f0 {\f0\fs20 {\super 10}/{\sub 100}}}\cell
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx1500
      \intbl {\f0 {\f0\fs20 0.2500}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx3000
      \intbl {\f0 {\f0\fs20 {\super 1}/{\sub 4}}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx4500
      \intbl {\f0 {\f0\fs20 {\super 1}/{\sub 4}}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx6000
      \intbl {\f0 {\f0\fs20 {\super 1}/{\sub 4}}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx7500
      \intbl {\f0 {\f0\fs20 {\super 1}/{\sub 2}}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx9000
      \intbl {\f0 {\f0\fs20 {\super 1}/{\sub 4}}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx10500
      \intbl {\f0 {\f0\fs20 {\super 2}/{\sub 8}}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx12000
      \intbl {\f0 {\f0\fs20 {\super 4}/{\sub 16}}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx13500
      \intbl {\f0 {\f0\fs20 {\super 25}/{\sub 100}}}\cell
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx1500
      \intbl {\f0 {\f0\fs20 0.4000}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx3000
      \intbl {\f0 {\f0\fs20 {\super 2}/{\sub 5}}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx4500
      \intbl {\f0 {\f0\fs20 {\super 2}/{\sub 5}}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx6000
      \intbl {\f0 {\f0\fs20 {\super 2}/{\sub 5}}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx7500
      \intbl {\f0 {\f0\fs20 {\super 1}/{\sub 2}}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx9000
      \intbl {\f0 {\f0\fs20 {\super 2}/{\sub 4}}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx10500
      \intbl {\f0 {\f0\fs20 {\super 3}/{\sub 8}}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx12000
      \intbl {\f0 {\f0\fs20 {\super 6}/{\sub 16}}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx13500
      \intbl {\f0 {\f0\fs20 {\super 40}/{\sub 100}}}\cell
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx1500
      \intbl {\f0 {\f0\fs20 0.5000}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx3000
      \intbl {\f0 {\f0\fs20 {\super 1}/{\sub 2}}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx4500
      \intbl {\f0 {\f0\fs20 {\super 1}/{\sub 2}}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx6000
      \intbl {\f0 {\f0\fs20 {\super 1}/{\sub 2}}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx7500
      \intbl {\f0 {\f0\fs20 {\super 1}/{\sub 2}}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx9000
      \intbl {\f0 {\f0\fs20 {\super 2}/{\sub 4}}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx10500
      \intbl {\f0 {\f0\fs20 {\super 4}/{\sub 8}}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx12000
      \intbl {\f0 {\f0\fs20 {\super 8}/{\sub 16}}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx13500
      \intbl {\f0 {\f0\fs20 {\super 50}/{\sub 100}}}\cell
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx1500
      \intbl {\f0 {\f0\fs20 0.6000}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx3000
      \intbl {\f0 {\f0\fs20 {\super 3}/{\sub 5}}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx4500
      \intbl {\f0 {\f0\fs20 {\super 3}/{\sub 5}}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx6000
      \intbl {\f0 {\f0\fs20 {\super 3}/{\sub 5}}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx7500
      \intbl {\f0 {\f0\fs20 {\super 1}/{\sub 2}}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx9000
      \intbl {\f0 {\f0\fs20 {\super 2}/{\sub 4}}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx10500
      \intbl {\f0 {\f0\fs20 {\super 5}/{\sub 8}}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx12000
      \intbl {\f0 {\f0\fs20 {\super 10}/{\sub 16}}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx13500
      \intbl {\f0 {\f0\fs20 {\super 60}/{\sub 100}}}\cell
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx1500
      \intbl {\f0 {\f0\fs20 0.7500}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx3000
      \intbl {\f0 {\f0\fs20 {\super 3}/{\sub 4}}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx4500
      \intbl {\f0 {\f0\fs20 {\super 3}/{\sub 4}}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx6000
      \intbl {\f0 {\f0\fs20 {\super 3}/{\sub 4}}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx7500
      \intbl {\f0 {\f0\fs20 1}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx9000
      \intbl {\f0 {\f0\fs20 {\super 3}/{\sub 4}}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx10500
      \intbl {\f0 {\f0\fs20 {\super 6}/{\sub 8}}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx12000
      \intbl {\f0 {\f0\fs20 {\super 12}/{\sub 16}}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx13500
      \intbl {\f0 {\f0\fs20 {\super 75}/{\sub 100}}}\cell
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx1500
      \intbl {\f0 {\f0\fs20 0.9000}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx3000
      \intbl {\f0 {\f0\fs20 {\super 8}/{\sub 9}}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx4500
      \intbl {\f0 {\f0\fs20 {\super 9}/{\sub 10}}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx6000
      \intbl {\f0 {\f0\fs20 {\super 9}/{\sub 10}}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx7500
      \intbl {\f0 {\f0\fs20 1}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx9000
      \intbl {\f0 {\f0\fs20 1}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx10500
      \intbl {\f0 {\f0\fs20 {\super 7}/{\sub 8}}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx12000
      \intbl {\f0 {\f0\fs20 {\super 14}/{\sub 16}}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx13500
      \intbl {\f0 {\f0\fs20 {\super 90}/{\sub 100}}}\cell
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx1500
      \intbl {\f0 {\f0\fs20 0.9900}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx3000
      \intbl {\f0 {\f0\fs20 1}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx4500
      \intbl {\f0 {\f0\fs20 {\super 98}/{\sub 99}}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx6000
      \intbl {\f0 {\f0\fs20 {\super 99}/{\sub 100}}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx7500
      \intbl {\f0 {\f0\fs20 1}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx9000
      \intbl {\f0 {\f0\fs20 1}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx10500
      \intbl {\f0 {\f0\fs20 1}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx12000
      \intbl {\f0 {\f0\fs20 1}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx13500
      \intbl {\f0 {\f0\fs20 {\super 99}/{\sub 100}}}\cell
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx1500
      \intbl {\f0 {\f0\fs20 0.9990}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx3000
      \intbl {\f0 {\f0\fs20 1}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx4500
      \intbl {\f0 {\f0\fs20 1}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx6000
      \intbl {\f0 {\f0\fs20 {\super 998}/{\sub 999}}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx7500
      \intbl {\f0 {\f0\fs20 1}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx9000
      \intbl {\f0 {\f0\fs20 1}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx10500
      \intbl {\f0 {\f0\fs20 1}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx12000
      \intbl {\f0 {\f0\fs20 1}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx13500
      \intbl {\f0 {\f0\fs20 1}}\cell
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx1500
      \intbl {\f0 {\f0\fs20 0.9999}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx3000
      \intbl {\f0 {\f0\fs20 1}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx4500
      \intbl {\f0 {\f0\fs20 1}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx6000
      \intbl {\f0 {\f0\fs20 1}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx7500
      \intbl {\f0 {\f0\fs20 1}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx9000
      \intbl {\f0 {\f0\fs20 1}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx10500
      \intbl {\f0 {\f0\fs20 1}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx12000
      \intbl {\f0 {\f0\fs20 1}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx13500
      \intbl {\f0 {\f0\fs20 1}}\cell
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\ql\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx13500
      \intbl {\f0\fs20 0 to -1}\cell
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx1500
      \intbl {\f0 {\f0\fs20 -0.0001}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx3000
      \intbl {\f0 {\f0\fs20 0}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx4500
      \intbl {\f0 {\f0\fs20 0}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx6000
      \intbl {\f0 {\f0\fs20 0}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx7500
      \intbl {\f0 {\f0\fs20 0}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx9000
      \intbl {\f0 {\f0\fs20 0}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx10500
      \intbl {\f0 {\f0\fs20 0}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx12000
      \intbl {\f0 {\f0\fs20 0}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx13500
      \intbl {\f0 {\f0\fs20 0}}\cell
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx1500
      \intbl {\f0 {\f0\fs20 -0.0010}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx3000
      \intbl {\f0 {\f0\fs20 0}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx4500
      \intbl {\f0 {\f0\fs20 0}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx6000
      \intbl {\f0 {\f0\fs20 -{\super 1}/{\sub 999}}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx7500
      \intbl {\f0 {\f0\fs20 0}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx9000
      \intbl {\f0 {\f0\fs20 0}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx10500
      \intbl {\f0 {\f0\fs20 0}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx12000
      \intbl {\f0 {\f0\fs20 0}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx13500
      \intbl {\f0 {\f0\fs20 0}}\cell
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx1500
      \intbl {\f0 {\f0\fs20 -0.0100}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx3000
      \intbl {\f0 {\f0\fs20 0}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx4500
      \intbl {\f0 {\f0\fs20 -{\super 1}/{\sub 99}}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx6000
      \intbl {\f0 {\f0\fs20 -{\super 1}/{\sub 100}}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx7500
      \intbl {\f0 {\f0\fs20 0}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx9000
      \intbl {\f0 {\f0\fs20 0}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx10500
      \intbl {\f0 {\f0\fs20 0}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx12000
      \intbl {\f0 {\f0\fs20 0}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx13500
      \intbl {\f0 {\f0\fs20 -{\super 1}/{\sub 100}}}\cell
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx1500
      \intbl {\f0 {\f0\fs20 -0.1000}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx3000
      \intbl {\f0 {\f0\fs20 -{\super 1}/{\sub 9}}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx4500
      \intbl {\f0 {\f0\fs20 -{\super 1}/{\sub 10}}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx6000
      \intbl {\f0 {\f0\fs20 -{\super 1}/{\sub 10}}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx7500
      \intbl {\f0 {\f0\fs20 0}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx9000
      \intbl {\f0 {\f0\fs20 0}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx10500
      \intbl {\f0 {\f0\fs20 -{\super 1}/{\sub 8}}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx12000
      \intbl {\f0 {\f0\fs20 -{\super 2}/{\sub 16}}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx13500
      \intbl {\f0 {\f0\fs20 -{\super 10}/{\sub 100}}}\cell
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx1500
      \intbl {\f0 {\f0\fs20 -0.2500}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx3000
      \intbl {\f0 {\f0\fs20 -{\super 1}/{\sub 4}}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx4500
      \intbl {\f0 {\f0\fs20 -{\super 1}/{\sub 4}}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx6000
      \intbl {\f0 {\f0\fs20 -{\super 1}/{\sub 4}}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx7500
      \intbl {\f0 {\f0\fs20 -{\super 1}/{\sub 2}}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx9000
      \intbl {\f0 {\f0\fs20 -{\super 1}/{\sub 4}}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx10500
      \intbl {\f0 {\f0\fs20 -{\super 2}/{\sub 8}}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx12000
      \intbl {\f0 {\f0\fs20 -{\super 4}/{\sub 16}}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx13500
      \intbl {\f0 {\f0\fs20 -{\super 25}/{\sub 100}}}\cell
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx1500
      \intbl {\f0 {\f0\fs20 -0.4000}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx3000
      \intbl {\f0 {\f0\fs20 -{\super 2}/{\sub 5}}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx4500
      \intbl {\f0 {\f0\fs20 -{\super 2}/{\sub 5}}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx6000
      \intbl {\f0 {\f0\fs20 -{\super 2}/{\sub 5}}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx7500
      \intbl {\f0 {\f0\fs20 -{\super 1}/{\sub 2}}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx9000
      \intbl {\f0 {\f0\fs20 -{\super 2}/{\sub 4}}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx10500
      \intbl {\f0 {\f0\fs20 -{\super 3}/{\sub 8}}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx12000
      \intbl {\f0 {\f0\fs20 -{\super 6}/{\sub 16}}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx13500
      \intbl {\f0 {\f0\fs20 -{\super 40}/{\sub 100}}}\cell
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx1500
      \intbl {\f0 {\f0\fs20 -0.5000}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx3000
      \intbl {\f0 {\f0\fs20 -{\super 1}/{\sub 2}}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx4500
      \intbl {\f0 {\f0\fs20 -{\super 1}/{\sub 2}}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx6000
      \intbl {\f0 {\f0\fs20 -{\super 1}/{\sub 2}}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx7500
      \intbl {\f0 {\f0\fs20 -{\super 1}/{\sub 2}}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx9000
      \intbl {\f0 {\f0\fs20 -{\super 2}/{\sub 4}}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx10500
      \intbl {\f0 {\f0\fs20 -{\super 4}/{\sub 8}}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx12000
      \intbl {\f0 {\f0\fs20 -{\super 8}/{\sub 16}}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx13500
      \intbl {\f0 {\f0\fs20 -{\super 50}/{\sub 100}}}\cell
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx1500
      \intbl {\f0 {\f0\fs20 -0.6000}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx3000
      \intbl {\f0 {\f0\fs20 -{\super 3}/{\sub 5}}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx4500
      \intbl {\f0 {\f0\fs20 -{\super 3}/{\sub 5}}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx6000
      \intbl {\f0 {\f0\fs20 -{\super 3}/{\sub 5}}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx7500
      \intbl {\f0 {\f0\fs20 -{\super 1}/{\sub 2}}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx9000
      \intbl {\f0 {\f0\fs20 -{\super 2}/{\sub 4}}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx10500
      \intbl {\f0 {\f0\fs20 -{\super 5}/{\sub 8}}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx12000
      \intbl {\f0 {\f0\fs20 -{\super 10}/{\sub 16}}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx13500
      \intbl {\f0 {\f0\fs20 -{\super 60}/{\sub 100}}}\cell
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx1500
      \intbl {\f0 {\f0\fs20 -0.7500}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx3000
      \intbl {\f0 {\f0\fs20 -{\super 3}/{\sub 4}}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx4500
      \intbl {\f0 {\f0\fs20 -{\super 3}/{\sub 4}}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx6000
      \intbl {\f0 {\f0\fs20 -{\super 3}/{\sub 4}}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx7500
      \intbl {\f0 {\f0\fs20 -1}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx9000
      \intbl {\f0 {\f0\fs20 -{\super 3}/{\sub 4}}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx10500
      \intbl {\f0 {\f0\fs20 -{\super 6}/{\sub 8}}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx12000
      \intbl {\f0 {\f0\fs20 -{\super 12}/{\sub 16}}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx13500
      \intbl {\f0 {\f0\fs20 -{\super 75}/{\sub 100}}}\cell
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx1500
      \intbl {\f0 {\f0\fs20 -0.9000}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx3000
      \intbl {\f0 {\f0\fs20 -{\super 8}/{\sub 9}}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx4500
      \intbl {\f0 {\f0\fs20 -{\super 9}/{\sub 10}}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx6000
      \intbl {\f0 {\f0\fs20 -{\super 9}/{\sub 10}}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx7500
      \intbl {\f0 {\f0\fs20 -1}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx9000
      \intbl {\f0 {\f0\fs20 -1}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx10500
      \intbl {\f0 {\f0\fs20 -{\super 7}/{\sub 8}}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx12000
      \intbl {\f0 {\f0\fs20 -{\super 14}/{\sub 16}}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx13500
      \intbl {\f0 {\f0\fs20 -{\super 90}/{\sub 100}}}\cell
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx1500
      \intbl {\f0 {\f0\fs20 -0.9900}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx3000
      \intbl {\f0 {\f0\fs20 -1}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx4500
      \intbl {\f0 {\f0\fs20 -{\super 98}/{\sub 99}}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx6000
      \intbl {\f0 {\f0\fs20 -{\super 99}/{\sub 100}}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx7500
      \intbl {\f0 {\f0\fs20 -1}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx9000
      \intbl {\f0 {\f0\fs20 -1}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx10500
      \intbl {\f0 {\f0\fs20 -1}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx12000
      \intbl {\f0 {\f0\fs20 -1}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx13500
      \intbl {\f0 {\f0\fs20 -{\super 99}/{\sub 100}}}\cell
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx1500
      \intbl {\f0 {\f0\fs20 -0.9990}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx3000
      \intbl {\f0 {\f0\fs20 -1}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx4500
      \intbl {\f0 {\f0\fs20 -1}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx6000
      \intbl {\f0 {\f0\fs20 -{\super 998}/{\sub 999}}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx7500
      \intbl {\f0 {\f0\fs20 -1}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx9000
      \intbl {\f0 {\f0\fs20 -1}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx10500
      \intbl {\f0 {\f0\fs20 -1}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx12000
      \intbl {\f0 {\f0\fs20 -1}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx13500
      \intbl {\f0 {\f0\fs20 -1}}\cell
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx1500
      \intbl {\f0 {\f0\fs20 -0.9999}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx3000
      \intbl {\f0 {\f0\fs20 -1}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx4500
      \intbl {\f0 {\f0\fs20 -1}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx6000
      \intbl {\f0 {\f0\fs20 -1}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx7500
      \intbl {\f0 {\f0\fs20 -1}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx9000
      \intbl {\f0 {\f0\fs20 -1}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx10500
      \intbl {\f0 {\f0\fs20 -1}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx12000
      \intbl {\f0 {\f0\fs20 -1}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx13500
      \intbl {\f0 {\f0\fs20 -1}}\cell
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\ql\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx13500
      \intbl {\f0\fs20 1 to 2}\cell
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx1500
      \intbl {\f0 {\f0\fs20 1.0001}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx3000
      \intbl {\f0 {\f0\fs20 1}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx4500
      \intbl {\f0 {\f0\fs20 1}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx6000
      \intbl {\f0 {\f0\fs20 1}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx7500
      \intbl {\f0 {\f0\fs20 1}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx9000
      \intbl {\f0 {\f0\fs20 1}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx10500
      \intbl {\f0 {\f0\fs20 1}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx12000
      \intbl {\f0 {\f0\fs20 1}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx13500
      \intbl {\f0 {\f0\fs20 1}}\cell
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx1500
      \intbl {\f0 {\f0\fs20 1.0010}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx3000
      \intbl {\f0 {\f0\fs20 1}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx4500
      \intbl {\f0 {\f0\fs20 1}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx6000
      \intbl {\f0 {\f0\fs20 1{\super 1}/{\sub 999}}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx7500
      \intbl {\f0 {\f0\fs20 1}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx9000
      \intbl {\f0 {\f0\fs20 1}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx10500
      \intbl {\f0 {\f0\fs20 1}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx12000
      \intbl {\f0 {\f0\fs20 1}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx13500
      \intbl {\f0 {\f0\fs20 1}}\cell
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx1500
      \intbl {\f0 {\f0\fs20 1.0100}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx3000
      \intbl {\f0 {\f0\fs20 1}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx4500
      \intbl {\f0 {\f0\fs20 1{\super 1}/{\sub 99}}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx6000
      \intbl {\f0 {\f0\fs20 1{\super 1}/{\sub 100}}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx7500
      \intbl {\f0 {\f0\fs20 1}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx9000
      \intbl {\f0 {\f0\fs20 1}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx10500
      \intbl {\f0 {\f0\fs20 1}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx12000
      \intbl {\f0 {\f0\fs20 1}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx13500
      \intbl {\f0 {\f0\fs20 1{\super 1}/{\sub 100}}}\cell
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx1500
      \intbl {\f0 {\f0\fs20 1.1000}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx3000
      \intbl {\f0 {\f0\fs20 1{\super 1}/{\sub 9}}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx4500
      \intbl {\f0 {\f0\fs20 1{\super 1}/{\sub 10}}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx6000
      \intbl {\f0 {\f0\fs20 1{\super 1}/{\sub 10}}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx7500
      \intbl {\f0 {\f0\fs20 1}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx9000
      \intbl {\f0 {\f0\fs20 1}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx10500
      \intbl {\f0 {\f0\fs20 1{\super 1}/{\sub 8}}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx12000
      \intbl {\f0 {\f0\fs20 1{\super 2}/{\sub 16}}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx13500
      \intbl {\f0 {\f0\fs20 1{\super 10}/{\sub 100}}}\cell
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx1500
      \intbl {\f0 {\f0\fs20 1.2500}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx3000
      \intbl {\f0 {\f0\fs20 1{\super 1}/{\sub 4}}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx4500
      \intbl {\f0 {\f0\fs20 1{\super 1}/{\sub 4}}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx6000
      \intbl {\f0 {\f0\fs20 1{\super 1}/{\sub 4}}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx7500
      \intbl {\f0 {\f0\fs20 1{\super 1}/{\sub 2}}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx9000
      \intbl {\f0 {\f0\fs20 1{\super 1}/{\sub 4}}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx10500
      \intbl {\f0 {\f0\fs20 1{\super 2}/{\sub 8}}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx12000
      \intbl {\f0 {\f0\fs20 1{\super 4}/{\sub 16}}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx13500
      \intbl {\f0 {\f0\fs20 1{\super 25}/{\sub 100}}}\cell
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx1500
      \intbl {\f0 {\f0\fs20 1.4000}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx3000
      \intbl {\f0 {\f0\fs20 1{\super 2}/{\sub 5}}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx4500
      \intbl {\f0 {\f0\fs20 1{\super 2}/{\sub 5}}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx6000
      \intbl {\f0 {\f0\fs20 1{\super 2}/{\sub 5}}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx7500
      \intbl {\f0 {\f0\fs20 1{\super 1}/{\sub 2}}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx9000
      \intbl {\f0 {\f0\fs20 1{\super 2}/{\sub 4}}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx10500
      \intbl {\f0 {\f0\fs20 1{\super 3}/{\sub 8}}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx12000
      \intbl {\f0 {\f0\fs20 1{\super 6}/{\sub 16}}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx13500
      \intbl {\f0 {\f0\fs20 1{\super 40}/{\sub 100}}}\cell
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx1500
      \intbl {\f0 {\f0\fs20 1.5000}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx3000
      \intbl {\f0 {\f0\fs20 1{\super 1}/{\sub 2}}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx4500
      \intbl {\f0 {\f0\fs20 1{\super 1}/{\sub 2}}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx6000
      \intbl {\f0 {\f0\fs20 1{\super 1}/{\sub 2}}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx7500
      \intbl {\f0 {\f0\fs20 1{\super 1}/{\sub 2}}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx9000
      \intbl {\f0 {\f0\fs20 1{\super 2}/{\sub 4}}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx10500
      \intbl {\f0 {\f0\fs20 1{\super 4}/{\sub 8}}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx12000
      \intbl {\f0 {\f0\fs20 1{\super 8}/{\sub 16}}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx13500
      \intbl {\f0 {\f0\fs20 1{\super 50}/{\sub 100}}}\cell
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx1500
      \intbl {\f0 {\f0\fs20 1.6000}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx3000
      \intbl {\f0 {\f0\fs20 1{\super 3}/{\sub 5}}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx4500
      \intbl {\f0 {\f0\fs20 1{\super 3}/{\sub 5}}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx6000
      \intbl {\f0 {\f0\fs20 1{\super 3}/{\sub 5}}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx7500
      \intbl {\f0 {\f0\fs20 1{\super 1}/{\sub 2}}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx9000
      \intbl {\f0 {\f0\fs20 1{\super 2}/{\sub 4}}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx10500
      \intbl {\f0 {\f0\fs20 1{\super 5}/{\sub 8}}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx12000
      \intbl {\f0 {\f0\fs20 1{\super 10}/{\sub 16}}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx13500
      \intbl {\f0 {\f0\fs20 1{\super 60}/{\sub 100}}}\cell
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx1500
      \intbl {\f0 {\f0\fs20 1.7500}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx3000
      \intbl {\f0 {\f0\fs20 1{\super 3}/{\sub 4}}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx4500
      \intbl {\f0 {\f0\fs20 1{\super 3}/{\sub 4}}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx6000
      \intbl {\f0 {\f0\fs20 1{\super 3}/{\sub 4}}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx7500
      \intbl {\f0 {\f0\fs20 2}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx9000
      \intbl {\f0 {\f0\fs20 1{\super 3}/{\sub 4}}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx10500
      \intbl {\f0 {\f0\fs20 1{\super 6}/{\sub 8}}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx12000
      \intbl {\f0 {\f0\fs20 1{\super 12}/{\sub 16}}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx13500
      \intbl {\f0 {\f0\fs20 1{\super 75}/{\sub 100}}}\cell
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx1500
      \intbl {\f0 {\f0\fs20 1.9000}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx3000
      \intbl {\f0 {\f0\fs20 1{\super 8}/{\sub 9}}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx4500
      \intbl {\f0 {\f0\fs20 1{\super 9}/{\sub 10}}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx6000
      \intbl {\f0 {\f0\fs20 1{\super 9}/{\sub 10}}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx7500
      \intbl {\f0 {\f0\fs20 2}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx9000
      \intbl {\f0 {\f0\fs20 2}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx10500
      \intbl {\f0 {\f0\fs20 1{\super 7}/{\sub 8}}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx12000
      \intbl {\f0 {\f0\fs20 1{\super 14}/{\sub 16}}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx13500
      \intbl {\f0 {\f0\fs20 1{\super 90}/{\sub 100}}}\cell
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx1500
      \intbl {\f0 {\f0\fs20 1.9900}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx3000
      \intbl {\f0 {\f0\fs20 2}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx4500
      \intbl {\f0 {\f0\fs20 1{\super 98}/{\sub 99}}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx6000
      \intbl {\f0 {\f0\fs20 1{\super 99}/{\sub 100}}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx7500
      \intbl {\f0 {\f0\fs20 2}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx9000
      \intbl {\f0 {\f0\fs20 2}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx10500
      \intbl {\f0 {\f0\fs20 2}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx12000
      \intbl {\f0 {\f0\fs20 2}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx13500
      \intbl {\f0 {\f0\fs20 1{\super 99}/{\sub 100}}}\cell
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx1500
      \intbl {\f0 {\f0\fs20 1.9990}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx3000
      \intbl {\f0 {\f0\fs20 2}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx4500
      \intbl {\f0 {\f0\fs20 2}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx6000
      \intbl {\f0 {\f0\fs20 1{\super 998}/{\sub 999}}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx7500
      \intbl {\f0 {\f0\fs20 2}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx9000
      \intbl {\f0 {\f0\fs20 2}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx10500
      \intbl {\f0 {\f0\fs20 2}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx12000
      \intbl {\f0 {\f0\fs20 2}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx13500
      \intbl {\f0 {\f0\fs20 2}}\cell
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx1500
      \intbl {\f0 {\f0\fs20 1.9999}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx3000
      \intbl {\f0 {\f0\fs20 2}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx4500
      \intbl {\f0 {\f0\fs20 2}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx6000
      \intbl {\f0 {\f0\fs20 2}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx7500
      \intbl {\f0 {\f0\fs20 2}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx9000
      \intbl {\f0 {\f0\fs20 2}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx10500
      \intbl {\f0 {\f0\fs20 2}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx12000
      \intbl {\f0 {\f0\fs20 2}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx13500
      \intbl {\f0 {\f0\fs20 2}}\cell
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\ql\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx13500
      \intbl {\f0\fs20 -1 to -2}\cell
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx1500
      \intbl {\f0 {\f0\fs20 -1.0001}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx3000
      \intbl {\f0 {\f0\fs20 -1}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx4500
      \intbl {\f0 {\f0\fs20 -1}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx6000
      \intbl {\f0 {\f0\fs20 -1}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx7500
      \intbl {\f0 {\f0\fs20 -1}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx9000
      \intbl {\f0 {\f0\fs20 -1}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx10500
      \intbl {\f0 {\f0\fs20 -1}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx12000
      \intbl {\f0 {\f0\fs20 -1}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx13500
      \intbl {\f0 {\f0\fs20 -1}}\cell
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx1500
      \intbl {\f0 {\f0\fs20 -1.0010}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx3000
      \intbl {\f0 {\f0\fs20 -1}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx4500
      \intbl {\f0 {\f0\fs20 -1}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx6000
      \intbl {\f0 {\f0\fs20 -1{\super 1}/{\sub 999}}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx7500
      \intbl {\f0 {\f0\fs20 -1}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx9000
      \intbl {\f0 {\f0\fs20 -1}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx10500
      \intbl {\f0 {\f0\fs20 -1}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx12000
      \intbl {\f0 {\f0\fs20 -1}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx13500
      \intbl {\f0 {\f0\fs20 -1}}\cell
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx1500
      \intbl {\f0 {\f0\fs20 -1.0100}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx3000
      \intbl {\f0 {\f0\fs20 -1}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx4500
      \intbl {\f0 {\f0\fs20 -1{\super 1}/{\sub 99}}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx6000
      \intbl {\f0 {\f0\fs20 -1{\super 1}/{\sub 100}}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx7500
      \intbl {\f0 {\f0\fs20 -1}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx9000
      \intbl {\f0 {\f0\fs20 -1}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx10500
      \intbl {\f0 {\f0\fs20 -1}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx12000
      \intbl {\f0 {\f0\fs20 -1}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx13500
      \intbl {\f0 {\f0\fs20 -1{\super 1}/{\sub 100}}}\cell
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx1500
      \intbl {\f0 {\f0\fs20 -1.1000}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx3000
      \intbl {\f0 {\f0\fs20 -1{\super 1}/{\sub 9}}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx4500
      \intbl {\f0 {\f0\fs20 -1{\super 1}/{\sub 10}}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx6000
      \intbl {\f0 {\f0\fs20 -1{\super 1}/{\sub 10}}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx7500
      \intbl {\f0 {\f0\fs20 -1}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx9000
      \intbl {\f0 {\f0\fs20 -1}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx10500
      \intbl {\f0 {\f0\fs20 -1{\super 1}/{\sub 8}}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx12000
      \intbl {\f0 {\f0\fs20 -1{\super 2}/{\sub 16}}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx13500
      \intbl {\f0 {\f0\fs20 -1{\super 10}/{\sub 100}}}\cell
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx1500
      \intbl {\f0 {\f0\fs20 -1.2500}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx3000
      \intbl {\f0 {\f0\fs20 -1{\super 1}/{\sub 4}}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx4500
      \intbl {\f0 {\f0\fs20 -1{\super 1}/{\sub 4}}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx6000
      \intbl {\f0 {\f0\fs20 -1{\super 1}/{\sub 4}}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx7500
      \intbl {\f0 {\f0\fs20 -1{\super 1}/{\sub 2}}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx9000
      \intbl {\f0 {\f0\fs20 -1{\super 1}/{\sub 4}}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx10500
      \intbl {\f0 {\f0\fs20 -1{\super 2}/{\sub 8}}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx12000
      \intbl {\f0 {\f0\fs20 -1{\super 4}/{\sub 16}}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx13500
      \intbl {\f0 {\f0\fs20 -1{\super 25}/{\sub 100}}}\cell
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx1500
      \intbl {\f0 {\f0\fs20 -1.4000}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx3000
      \intbl {\f0 {\f0\fs20 -1{\super 2}/{\sub 5}}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx4500
      \intbl {\f0 {\f0\fs20 -1{\super 2}/{\sub 5}}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx6000
      \intbl {\f0 {\f0\fs20 -1{\super 2}/{\sub 5}}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx7500
      \intbl {\f0 {\f0\fs20 -1{\super 1}/{\sub 2}}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx9000
      \intbl {\f0 {\f0\fs20 -1{\super 2}/{\sub 4}}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx10500
      \intbl {\f0 {\f0\fs20 -1{\super 3}/{\sub 8}}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx12000
      \intbl {\f0 {\f0\fs20 -1{\super 6}/{\sub 16}}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx13500
      \intbl {\f0 {\f0\fs20 -1{\super 40}/{\sub 100}}}\cell
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx1500
      \intbl {\f0 {\f0\fs20 -1.5000}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx3000
      \intbl {\f0 {\f0\fs20 -1{\super 1}/{\sub 2}}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx4500
      \intbl {\f0 {\f0\fs20 -1{\super 1}/{\sub 2}}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx6000
      \intbl {\f0 {\f0\fs20 -1{\super 1}/{\sub 2}}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx7500
      \intbl {\f0 {\f0\fs20 -1{\super 1}/{\sub 2}}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx9000
      \intbl {\f0 {\f0\fs20 -1{\super 2}/{\sub 4}}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx10500
      \intbl {\f0 {\f0\fs20 -1{\super 4}/{\sub 8}}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx12000
      \intbl {\f0 {\f0\fs20 -1{\super 8}/{\sub 16}}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx13500
      \intbl {\f0 {\f0\fs20 -1{\super 50}/{\sub 100}}}\cell
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx1500
      \intbl {\f0 {\f0\fs20 -1.6000}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx3000
      \intbl {\f0 {\f0\fs20 -1{\super 3}/{\sub 5}}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx4500
      \intbl {\f0 {\f0\fs20 -1{\super 3}/{\sub 5}}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx6000
      \intbl {\f0 {\f0\fs20 -1{\super 3}/{\sub 5}}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx7500
      \intbl {\f0 {\f0\fs20 -1{\super 1}/{\sub 2}}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx9000
      \intbl {\f0 {\f0\fs20 -1{\super 2}/{\sub 4}}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx10500
      \intbl {\f0 {\f0\fs20 -1{\super 5}/{\sub 8}}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx12000
      \intbl {\f0 {\f0\fs20 -1{\super 10}/{\sub 16}}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx13500
      \intbl {\f0 {\f0\fs20 -1{\super 60}/{\sub 100}}}\cell
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx1500
      \intbl {\f0 {\f0\fs20 -1.7500}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx3000
      \intbl {\f0 {\f0\fs20 -1{\super 3}/{\sub 4}}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx4500
      \intbl {\f0 {\f0\fs20 -1{\super 3}/{\sub 4}}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx6000
      \intbl {\f0 {\f0\fs20 -1{\super 3}/{\sub 4}}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx7500
      \intbl {\f0 {\f0\fs20 -2}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx9000
      \intbl {\f0 {\f0\fs20 -1{\super 3}/{\sub 4}}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx10500
      \intbl {\f0 {\f0\fs20 -1{\super 6}/{\sub 8}}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx12000
      \intbl {\f0 {\f0\fs20 -1{\super 12}/{\sub 16}}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx13500
      \intbl {\f0 {\f0\fs20 -1{\super 75}/{\sub 100}}}\cell
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx1500
      \intbl {\f0 {\f0\fs20 -1.9000}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx3000
      \intbl {\f0 {\f0\fs20 -1{\super 8}/{\sub 9}}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx4500
      \intbl {\f0 {\f0\fs20 -1{\super 9}/{\sub 10}}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx6000
      \intbl {\f0 {\f0\fs20 -1{\super 9}/{\sub 10}}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx7500
      \intbl {\f0 {\f0\fs20 -2}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx9000
      \intbl {\f0 {\f0\fs20 -2}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx10500
      \intbl {\f0 {\f0\fs20 -1{\super 7}/{\sub 8}}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx12000
      \intbl {\f0 {\f0\fs20 -1{\super 14}/{\sub 16}}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx13500
      \intbl {\f0 {\f0\fs20 -1{\super 90}/{\sub 100}}}\cell
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx1500
      \intbl {\f0 {\f0\fs20 -1.9900}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx3000
      \intbl {\f0 {\f0\fs20 -2}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx4500
      \intbl {\f0 {\f0\fs20 -1{\super 98}/{\sub 99}}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx6000
      \intbl {\f0 {\f0\fs20 -1{\super 99}/{\sub 100}}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx7500
      \intbl {\f0 {\f0\fs20 -2}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx9000
      \intbl {\f0 {\f0\fs20 -2}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx10500
      \intbl {\f0 {\f0\fs20 -2}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx12000
      \intbl {\f0 {\f0\fs20 -2}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx13500
      \intbl {\f0 {\f0\fs20 -1{\super 99}/{\sub 100}}}\cell
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx1500
      \intbl {\f0 {\f0\fs20 -1.9990}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx3000
      \intbl {\f0 {\f0\fs20 -2}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx4500
      \intbl {\f0 {\f0\fs20 -2}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx6000
      \intbl {\f0 {\f0\fs20 -1{\super 998}/{\sub 999}}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx7500
      \intbl {\f0 {\f0\fs20 -2}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx9000
      \intbl {\f0 {\f0\fs20 -2}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx10500
      \intbl {\f0 {\f0\fs20 -2}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx12000
      \intbl {\f0 {\f0\fs20 -2}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx13500
      \intbl {\f0 {\f0\fs20 -2}}\cell
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx1500
      \intbl {\f0 {\f0\fs20 -1.9999}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx3000
      \intbl {\f0 {\f0\fs20 -2}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx4500
      \intbl {\f0 {\f0\fs20 -2}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx6000
      \intbl {\f0 {\f0\fs20 -2}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx7500
      \intbl {\f0 {\f0\fs20 -2}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx9000
      \intbl {\f0 {\f0\fs20 -2}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx10500
      \intbl {\f0 {\f0\fs20 -2}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx12000
      \intbl {\f0 {\f0\fs20 -2}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx13500
      \intbl {\f0 {\f0\fs20 -2}}\cell
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\ql\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx13500
      \intbl {\f0\fs20 Exact Numbers}\cell
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx1500
      \intbl {\f0 {\f0\fs20 -1.0000}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx3000
      \intbl {\f0 {\f0\fs20 -1}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx4500
      \intbl {\f0 {\f0\fs20 -1}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx6000
      \intbl {\f0 {\f0\fs20 -1}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx7500
      \intbl {\f0 {\f0\fs20 -1}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx9000
      \intbl {\f0 {\f0\fs20 -1}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx10500
      \intbl {\f0 {\f0\fs20 -1}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx12000
      \intbl {\f0 {\f0\fs20 -1}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx13500
      \intbl {\f0 {\f0\fs20 -1}}\cell
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx1500
      \intbl {\f0 {\f0\fs20 0.0000}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx3000
      \intbl {\f0 {\f0\fs20 0}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx4500
      \intbl {\f0 {\f0\fs20 0}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx6000
      \intbl {\f0 {\f0\fs20 0}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx7500
      \intbl {\f0 {\f0\fs20 0}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx9000
      \intbl {\f0 {\f0\fs20 0}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx10500
      \intbl {\f0 {\f0\fs20 0}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx12000
      \intbl {\f0 {\f0\fs20 0}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx13500
      \intbl {\f0 {\f0\fs20 0}}\cell
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx1500
      \intbl {\f0 {\f0\fs20 1.0000}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx3000
      \intbl {\f0 {\f0\fs20 1}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx4500
      \intbl {\f0 {\f0\fs20 1}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx6000
      \intbl {\f0 {\f0\fs20 1}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx7500
      \intbl {\f0 {\f0\fs20 1}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx9000
      \intbl {\f0 {\f0\fs20 1}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx10500
      \intbl {\f0 {\f0\fs20 1}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx12000
      \intbl {\f0 {\f0\fs20 1}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx13500
      \intbl {\f0 {\f0\fs20 1}}\cell
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\ql\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx13500
      \intbl {\f0\fs20 Not Numbers}\cell
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx1500
      \intbl {\f0 {\f0\fs20 NA}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx3000
      \intbl {\f0 {\f0\fs20 NA}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx4500
      \intbl {\f0 {\f0\fs20 NA}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx6000
      \intbl {\f0 {\f0\fs20 NA}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx7500
      \intbl {\f0 {\f0\fs20 NA}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx9000
      \intbl {\f0 {\f0\fs20 NA}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx10500
      \intbl {\f0 {\f0\fs20 NA}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx12000
      \intbl {\f0 {\f0\fs20 NA}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx13500
      \intbl {\f0 {\f0\fs20 NA}}\cell
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx1500
      \intbl {\f0 {\f0\fs20 NaN}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx3000
      \intbl {\f0 {\f0\fs20 NaN}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx4500
      \intbl {\f0 {\f0\fs20 NaN}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx6000
      \intbl {\f0 {\f0\fs20 NaN}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx7500
      \intbl {\f0 {\f0\fs20 NaN}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx9000
      \intbl {\f0 {\f0\fs20 NaN}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx10500
      \intbl {\f0 {\f0\fs20 NaN}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx12000
      \intbl {\f0 {\f0\fs20 NaN}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx13500
      \intbl {\f0 {\f0\fs20 NaN}}\cell
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx1500
      \intbl {\f0 {\f0\fs20 Inf}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx3000
      \intbl {\f0 {\f0\fs20 Inf}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx4500
      \intbl {\f0 {\f0\fs20 Inf}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx6000
      \intbl {\f0 {\f0\fs20 Inf}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx7500
      \intbl {\f0 {\f0\fs20 Inf}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx9000
      \intbl {\f0 {\f0\fs20 Inf}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx10500
      \intbl {\f0 {\f0\fs20 Inf}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx12000
      \intbl {\f0 {\f0\fs20 Inf}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx13500
      \intbl {\f0 {\f0\fs20 Inf}}\cell
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx1500
      \intbl {\f0 {\f0\fs20 -Inf}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx3000
      \intbl {\f0 {\f0\fs20 -Inf}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx4500
      \intbl {\f0 {\f0\fs20 -Inf}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx6000
      \intbl {\f0 {\f0\fs20 -Inf}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx7500
      \intbl {\f0 {\f0\fs20 -Inf}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx9000
      \intbl {\f0 {\f0\fs20 -Inf}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx10500
      \intbl {\f0 {\f0\fs20 -Inf}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx12000
      \intbl {\f0 {\f0\fs20 -Inf}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx13500
      \intbl {\f0 {\f0\fs20 -Inf}}\cell
      
      \row
      
      }

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
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85\clbrdrb\brdrs\brdrw20\brdrcf1 \cellx1500
      \intbl {\f0 {\f0\fs20 }}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85\clbrdrb\brdrs\brdrw20\brdrcf1 \cellx3000
      \intbl {\f0 {\f0\fs20 low}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85\clbrdrb\brdrs\brdrw20\brdrcf1 \cellx4500
      \intbl {\f0 {\f0\fs20 med}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85\clbrdrb\brdrs\brdrw20\brdrcf1 \cellx6000
      \intbl {\f0 {\f0\fs20 high}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85\clbrdrb\brdrs\brdrw20\brdrcf1 \cellx7500
      \intbl {\f0 {\f0\fs20 halves}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85\clbrdrb\brdrs\brdrw20\brdrcf1 \cellx9000
      \intbl {\f0 {\f0\fs20 quarters}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85\clbrdrb\brdrs\brdrw20\brdrcf1 \cellx10500
      \intbl {\f0 {\f0\fs20 eighths}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85\clbrdrb\brdrs\brdrw20\brdrcf1 \cellx12000
      \intbl {\f0 {\f0\fs20 sixteenths}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85\clbrdrb\brdrs\brdrw20\brdrcf1 \cellx13500
      \intbl {\f0 {\f0\fs20 hundredths}}\cell
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\ql\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx13500
      \intbl {\f0\fs20 0 to 1}\cell
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx1500
      \intbl {\f0 {\f0\fs20 0.0001}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx3000
      \intbl {\f0 {\f0\fs20 0}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx4500
      \intbl {\f0 {\f0\fs20 0}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx6000
      \intbl {\f0 {\f0\fs20 0}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx7500
      \intbl {\f0 {\f0\fs20 0}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx9000
      \intbl {\f0 {\f0\fs20 0}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx10500
      \intbl {\f0 {\f0\fs20 0}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx12000
      \intbl {\f0 {\f0\fs20 0}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx13500
      \intbl {\f0 {\f0\fs20 0}}\cell
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx1500
      \intbl {\f0 {\f0\fs20 0.0010}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx3000
      \intbl {\f0 {\f0\fs20 0}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx4500
      \intbl {\f0 {\f0\fs20 0}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx6000
      \intbl {\f0 {\f0\fs20 1/999}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx7500
      \intbl {\f0 {\f0\fs20 0}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx9000
      \intbl {\f0 {\f0\fs20 0}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx10500
      \intbl {\f0 {\f0\fs20 0}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx12000
      \intbl {\f0 {\f0\fs20 0}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx13500
      \intbl {\f0 {\f0\fs20 0}}\cell
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx1500
      \intbl {\f0 {\f0\fs20 0.0100}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx3000
      \intbl {\f0 {\f0\fs20 0}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx4500
      \intbl {\f0 {\f0\fs20 1/99}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx6000
      \intbl {\f0 {\f0\fs20 1/100}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx7500
      \intbl {\f0 {\f0\fs20 0}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx9000
      \intbl {\f0 {\f0\fs20 0}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx10500
      \intbl {\f0 {\f0\fs20 0}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx12000
      \intbl {\f0 {\f0\fs20 0}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx13500
      \intbl {\f0 {\f0\fs20 1/100}}\cell
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx1500
      \intbl {\f0 {\f0\fs20 0.1000}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx3000
      \intbl {\f0 {\f0\fs20 1/9}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx4500
      \intbl {\f0 {\f0\fs20 1/10}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx6000
      \intbl {\f0 {\f0\fs20 1/10}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx7500
      \intbl {\f0 {\f0\fs20 0}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx9000
      \intbl {\f0 {\f0\fs20 0}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx10500
      \intbl {\f0 {\f0\fs20 1/8}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx12000
      \intbl {\f0 {\f0\fs20 2/16}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx13500
      \intbl {\f0 {\f0\fs20 10/100}}\cell
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx1500
      \intbl {\f0 {\f0\fs20 0.2500}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx3000
      \intbl {\f0 {\f0\fs20 1/4}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx4500
      \intbl {\f0 {\f0\fs20 1/4}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx6000
      \intbl {\f0 {\f0\fs20 1/4}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx7500
      \intbl {\f0 {\f0\fs20 1/2}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx9000
      \intbl {\f0 {\f0\fs20 1/4}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx10500
      \intbl {\f0 {\f0\fs20 2/8}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx12000
      \intbl {\f0 {\f0\fs20 4/16}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx13500
      \intbl {\f0 {\f0\fs20 25/100}}\cell
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx1500
      \intbl {\f0 {\f0\fs20 0.4000}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx3000
      \intbl {\f0 {\f0\fs20 2/5}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx4500
      \intbl {\f0 {\f0\fs20 2/5}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx6000
      \intbl {\f0 {\f0\fs20 2/5}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx7500
      \intbl {\f0 {\f0\fs20 1/2}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx9000
      \intbl {\f0 {\f0\fs20 2/4}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx10500
      \intbl {\f0 {\f0\fs20 3/8}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx12000
      \intbl {\f0 {\f0\fs20 6/16}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx13500
      \intbl {\f0 {\f0\fs20 40/100}}\cell
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx1500
      \intbl {\f0 {\f0\fs20 0.5000}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx3000
      \intbl {\f0 {\f0\fs20 1/2}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx4500
      \intbl {\f0 {\f0\fs20 1/2}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx6000
      \intbl {\f0 {\f0\fs20 1/2}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx7500
      \intbl {\f0 {\f0\fs20 1/2}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx9000
      \intbl {\f0 {\f0\fs20 2/4}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx10500
      \intbl {\f0 {\f0\fs20 4/8}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx12000
      \intbl {\f0 {\f0\fs20 8/16}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx13500
      \intbl {\f0 {\f0\fs20 50/100}}\cell
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx1500
      \intbl {\f0 {\f0\fs20 0.6000}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx3000
      \intbl {\f0 {\f0\fs20 3/5}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx4500
      \intbl {\f0 {\f0\fs20 3/5}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx6000
      \intbl {\f0 {\f0\fs20 3/5}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx7500
      \intbl {\f0 {\f0\fs20 1/2}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx9000
      \intbl {\f0 {\f0\fs20 2/4}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx10500
      \intbl {\f0 {\f0\fs20 5/8}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx12000
      \intbl {\f0 {\f0\fs20 10/16}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx13500
      \intbl {\f0 {\f0\fs20 60/100}}\cell
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx1500
      \intbl {\f0 {\f0\fs20 0.7500}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx3000
      \intbl {\f0 {\f0\fs20 3/4}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx4500
      \intbl {\f0 {\f0\fs20 3/4}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx6000
      \intbl {\f0 {\f0\fs20 3/4}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx7500
      \intbl {\f0 {\f0\fs20 1}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx9000
      \intbl {\f0 {\f0\fs20 3/4}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx10500
      \intbl {\f0 {\f0\fs20 6/8}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx12000
      \intbl {\f0 {\f0\fs20 12/16}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx13500
      \intbl {\f0 {\f0\fs20 75/100}}\cell
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx1500
      \intbl {\f0 {\f0\fs20 0.9000}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx3000
      \intbl {\f0 {\f0\fs20 8/9}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx4500
      \intbl {\f0 {\f0\fs20 9/10}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx6000
      \intbl {\f0 {\f0\fs20 9/10}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx7500
      \intbl {\f0 {\f0\fs20 1}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx9000
      \intbl {\f0 {\f0\fs20 1}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx10500
      \intbl {\f0 {\f0\fs20 7/8}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx12000
      \intbl {\f0 {\f0\fs20 14/16}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx13500
      \intbl {\f0 {\f0\fs20 90/100}}\cell
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx1500
      \intbl {\f0 {\f0\fs20 0.9900}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx3000
      \intbl {\f0 {\f0\fs20 1}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx4500
      \intbl {\f0 {\f0\fs20 98/99}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx6000
      \intbl {\f0 {\f0\fs20 99/100}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx7500
      \intbl {\f0 {\f0\fs20 1}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx9000
      \intbl {\f0 {\f0\fs20 1}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx10500
      \intbl {\f0 {\f0\fs20 1}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx12000
      \intbl {\f0 {\f0\fs20 1}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx13500
      \intbl {\f0 {\f0\fs20 99/100}}\cell
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx1500
      \intbl {\f0 {\f0\fs20 0.9990}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx3000
      \intbl {\f0 {\f0\fs20 1}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx4500
      \intbl {\f0 {\f0\fs20 1}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx6000
      \intbl {\f0 {\f0\fs20 998/999}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx7500
      \intbl {\f0 {\f0\fs20 1}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx9000
      \intbl {\f0 {\f0\fs20 1}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx10500
      \intbl {\f0 {\f0\fs20 1}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx12000
      \intbl {\f0 {\f0\fs20 1}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx13500
      \intbl {\f0 {\f0\fs20 1}}\cell
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx1500
      \intbl {\f0 {\f0\fs20 0.9999}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx3000
      \intbl {\f0 {\f0\fs20 1}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx4500
      \intbl {\f0 {\f0\fs20 1}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx6000
      \intbl {\f0 {\f0\fs20 1}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx7500
      \intbl {\f0 {\f0\fs20 1}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx9000
      \intbl {\f0 {\f0\fs20 1}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx10500
      \intbl {\f0 {\f0\fs20 1}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx12000
      \intbl {\f0 {\f0\fs20 1}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx13500
      \intbl {\f0 {\f0\fs20 1}}\cell
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\ql\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx13500
      \intbl {\f0\fs20 0 to -1}\cell
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx1500
      \intbl {\f0 {\f0\fs20 -0.0001}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx3000
      \intbl {\f0 {\f0\fs20 0}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx4500
      \intbl {\f0 {\f0\fs20 0}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx6000
      \intbl {\f0 {\f0\fs20 0}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx7500
      \intbl {\f0 {\f0\fs20 0}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx9000
      \intbl {\f0 {\f0\fs20 0}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx10500
      \intbl {\f0 {\f0\fs20 0}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx12000
      \intbl {\f0 {\f0\fs20 0}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx13500
      \intbl {\f0 {\f0\fs20 0}}\cell
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx1500
      \intbl {\f0 {\f0\fs20 -0.0010}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx3000
      \intbl {\f0 {\f0\fs20 0}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx4500
      \intbl {\f0 {\f0\fs20 0}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx6000
      \intbl {\f0 {\f0\fs20 -1/999}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx7500
      \intbl {\f0 {\f0\fs20 0}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx9000
      \intbl {\f0 {\f0\fs20 0}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx10500
      \intbl {\f0 {\f0\fs20 0}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx12000
      \intbl {\f0 {\f0\fs20 0}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx13500
      \intbl {\f0 {\f0\fs20 0}}\cell
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx1500
      \intbl {\f0 {\f0\fs20 -0.0100}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx3000
      \intbl {\f0 {\f0\fs20 0}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx4500
      \intbl {\f0 {\f0\fs20 -1/99}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx6000
      \intbl {\f0 {\f0\fs20 -1/100}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx7500
      \intbl {\f0 {\f0\fs20 0}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx9000
      \intbl {\f0 {\f0\fs20 0}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx10500
      \intbl {\f0 {\f0\fs20 0}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx12000
      \intbl {\f0 {\f0\fs20 0}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx13500
      \intbl {\f0 {\f0\fs20 -1/100}}\cell
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx1500
      \intbl {\f0 {\f0\fs20 -0.1000}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx3000
      \intbl {\f0 {\f0\fs20 -1/9}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx4500
      \intbl {\f0 {\f0\fs20 -1/10}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx6000
      \intbl {\f0 {\f0\fs20 -1/10}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx7500
      \intbl {\f0 {\f0\fs20 0}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx9000
      \intbl {\f0 {\f0\fs20 0}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx10500
      \intbl {\f0 {\f0\fs20 -1/8}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx12000
      \intbl {\f0 {\f0\fs20 -2/16}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx13500
      \intbl {\f0 {\f0\fs20 -10/100}}\cell
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx1500
      \intbl {\f0 {\f0\fs20 -0.2500}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx3000
      \intbl {\f0 {\f0\fs20 -1/4}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx4500
      \intbl {\f0 {\f0\fs20 -1/4}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx6000
      \intbl {\f0 {\f0\fs20 -1/4}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx7500
      \intbl {\f0 {\f0\fs20 -1/2}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx9000
      \intbl {\f0 {\f0\fs20 -1/4}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx10500
      \intbl {\f0 {\f0\fs20 -2/8}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx12000
      \intbl {\f0 {\f0\fs20 -4/16}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx13500
      \intbl {\f0 {\f0\fs20 -25/100}}\cell
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx1500
      \intbl {\f0 {\f0\fs20 -0.4000}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx3000
      \intbl {\f0 {\f0\fs20 -2/5}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx4500
      \intbl {\f0 {\f0\fs20 -2/5}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx6000
      \intbl {\f0 {\f0\fs20 -2/5}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx7500
      \intbl {\f0 {\f0\fs20 -1/2}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx9000
      \intbl {\f0 {\f0\fs20 -2/4}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx10500
      \intbl {\f0 {\f0\fs20 -3/8}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx12000
      \intbl {\f0 {\f0\fs20 -6/16}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx13500
      \intbl {\f0 {\f0\fs20 -40/100}}\cell
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx1500
      \intbl {\f0 {\f0\fs20 -0.5000}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx3000
      \intbl {\f0 {\f0\fs20 -1/2}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx4500
      \intbl {\f0 {\f0\fs20 -1/2}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx6000
      \intbl {\f0 {\f0\fs20 -1/2}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx7500
      \intbl {\f0 {\f0\fs20 -1/2}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx9000
      \intbl {\f0 {\f0\fs20 -2/4}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx10500
      \intbl {\f0 {\f0\fs20 -4/8}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx12000
      \intbl {\f0 {\f0\fs20 -8/16}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx13500
      \intbl {\f0 {\f0\fs20 -50/100}}\cell
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx1500
      \intbl {\f0 {\f0\fs20 -0.6000}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx3000
      \intbl {\f0 {\f0\fs20 -3/5}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx4500
      \intbl {\f0 {\f0\fs20 -3/5}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx6000
      \intbl {\f0 {\f0\fs20 -3/5}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx7500
      \intbl {\f0 {\f0\fs20 -1/2}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx9000
      \intbl {\f0 {\f0\fs20 -2/4}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx10500
      \intbl {\f0 {\f0\fs20 -5/8}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx12000
      \intbl {\f0 {\f0\fs20 -10/16}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx13500
      \intbl {\f0 {\f0\fs20 -60/100}}\cell
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx1500
      \intbl {\f0 {\f0\fs20 -0.7500}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx3000
      \intbl {\f0 {\f0\fs20 -3/4}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx4500
      \intbl {\f0 {\f0\fs20 -3/4}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx6000
      \intbl {\f0 {\f0\fs20 -3/4}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx7500
      \intbl {\f0 {\f0\fs20 -1}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx9000
      \intbl {\f0 {\f0\fs20 -3/4}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx10500
      \intbl {\f0 {\f0\fs20 -6/8}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx12000
      \intbl {\f0 {\f0\fs20 -12/16}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx13500
      \intbl {\f0 {\f0\fs20 -75/100}}\cell
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx1500
      \intbl {\f0 {\f0\fs20 -0.9000}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx3000
      \intbl {\f0 {\f0\fs20 -8/9}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx4500
      \intbl {\f0 {\f0\fs20 -9/10}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx6000
      \intbl {\f0 {\f0\fs20 -9/10}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx7500
      \intbl {\f0 {\f0\fs20 -1}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx9000
      \intbl {\f0 {\f0\fs20 -1}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx10500
      \intbl {\f0 {\f0\fs20 -7/8}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx12000
      \intbl {\f0 {\f0\fs20 -14/16}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx13500
      \intbl {\f0 {\f0\fs20 -90/100}}\cell
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx1500
      \intbl {\f0 {\f0\fs20 -0.9900}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx3000
      \intbl {\f0 {\f0\fs20 -1}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx4500
      \intbl {\f0 {\f0\fs20 -98/99}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx6000
      \intbl {\f0 {\f0\fs20 -99/100}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx7500
      \intbl {\f0 {\f0\fs20 -1}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx9000
      \intbl {\f0 {\f0\fs20 -1}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx10500
      \intbl {\f0 {\f0\fs20 -1}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx12000
      \intbl {\f0 {\f0\fs20 -1}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx13500
      \intbl {\f0 {\f0\fs20 -99/100}}\cell
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx1500
      \intbl {\f0 {\f0\fs20 -0.9990}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx3000
      \intbl {\f0 {\f0\fs20 -1}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx4500
      \intbl {\f0 {\f0\fs20 -1}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx6000
      \intbl {\f0 {\f0\fs20 -998/999}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx7500
      \intbl {\f0 {\f0\fs20 -1}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx9000
      \intbl {\f0 {\f0\fs20 -1}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx10500
      \intbl {\f0 {\f0\fs20 -1}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx12000
      \intbl {\f0 {\f0\fs20 -1}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx13500
      \intbl {\f0 {\f0\fs20 -1}}\cell
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx1500
      \intbl {\f0 {\f0\fs20 -0.9999}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx3000
      \intbl {\f0 {\f0\fs20 -1}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx4500
      \intbl {\f0 {\f0\fs20 -1}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx6000
      \intbl {\f0 {\f0\fs20 -1}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx7500
      \intbl {\f0 {\f0\fs20 -1}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx9000
      \intbl {\f0 {\f0\fs20 -1}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx10500
      \intbl {\f0 {\f0\fs20 -1}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx12000
      \intbl {\f0 {\f0\fs20 -1}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx13500
      \intbl {\f0 {\f0\fs20 -1}}\cell
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\ql\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx13500
      \intbl {\f0\fs20 1 to 2}\cell
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx1500
      \intbl {\f0 {\f0\fs20 1.0001}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx3000
      \intbl {\f0 {\f0\fs20 1}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx4500
      \intbl {\f0 {\f0\fs20 1}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx6000
      \intbl {\f0 {\f0\fs20 1}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx7500
      \intbl {\f0 {\f0\fs20 1}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx9000
      \intbl {\f0 {\f0\fs20 1}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx10500
      \intbl {\f0 {\f0\fs20 1}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx12000
      \intbl {\f0 {\f0\fs20 1}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx13500
      \intbl {\f0 {\f0\fs20 1}}\cell
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx1500
      \intbl {\f0 {\f0\fs20 1.0010}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx3000
      \intbl {\f0 {\f0\fs20 1}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx4500
      \intbl {\f0 {\f0\fs20 1}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx6000
      \intbl {\f0 {\f0\fs20 1 1/999}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx7500
      \intbl {\f0 {\f0\fs20 1}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx9000
      \intbl {\f0 {\f0\fs20 1}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx10500
      \intbl {\f0 {\f0\fs20 1}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx12000
      \intbl {\f0 {\f0\fs20 1}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx13500
      \intbl {\f0 {\f0\fs20 1}}\cell
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx1500
      \intbl {\f0 {\f0\fs20 1.0100}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx3000
      \intbl {\f0 {\f0\fs20 1}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx4500
      \intbl {\f0 {\f0\fs20 1 1/99}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx6000
      \intbl {\f0 {\f0\fs20 1 1/100}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx7500
      \intbl {\f0 {\f0\fs20 1}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx9000
      \intbl {\f0 {\f0\fs20 1}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx10500
      \intbl {\f0 {\f0\fs20 1}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx12000
      \intbl {\f0 {\f0\fs20 1}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx13500
      \intbl {\f0 {\f0\fs20 1 1/100}}\cell
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx1500
      \intbl {\f0 {\f0\fs20 1.1000}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx3000
      \intbl {\f0 {\f0\fs20 1 1/9}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx4500
      \intbl {\f0 {\f0\fs20 1 1/10}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx6000
      \intbl {\f0 {\f0\fs20 1 1/10}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx7500
      \intbl {\f0 {\f0\fs20 1}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx9000
      \intbl {\f0 {\f0\fs20 1}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx10500
      \intbl {\f0 {\f0\fs20 1 1/8}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx12000
      \intbl {\f0 {\f0\fs20 1 2/16}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx13500
      \intbl {\f0 {\f0\fs20 1 10/100}}\cell
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx1500
      \intbl {\f0 {\f0\fs20 1.2500}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx3000
      \intbl {\f0 {\f0\fs20 1 1/4}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx4500
      \intbl {\f0 {\f0\fs20 1 1/4}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx6000
      \intbl {\f0 {\f0\fs20 1 1/4}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx7500
      \intbl {\f0 {\f0\fs20 1 1/2}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx9000
      \intbl {\f0 {\f0\fs20 1 1/4}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx10500
      \intbl {\f0 {\f0\fs20 1 2/8}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx12000
      \intbl {\f0 {\f0\fs20 1 4/16}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx13500
      \intbl {\f0 {\f0\fs20 1 25/100}}\cell
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx1500
      \intbl {\f0 {\f0\fs20 1.4000}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx3000
      \intbl {\f0 {\f0\fs20 1 2/5}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx4500
      \intbl {\f0 {\f0\fs20 1 2/5}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx6000
      \intbl {\f0 {\f0\fs20 1 2/5}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx7500
      \intbl {\f0 {\f0\fs20 1 1/2}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx9000
      \intbl {\f0 {\f0\fs20 1 2/4}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx10500
      \intbl {\f0 {\f0\fs20 1 3/8}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx12000
      \intbl {\f0 {\f0\fs20 1 6/16}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx13500
      \intbl {\f0 {\f0\fs20 1 40/100}}\cell
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx1500
      \intbl {\f0 {\f0\fs20 1.5000}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx3000
      \intbl {\f0 {\f0\fs20 1 1/2}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx4500
      \intbl {\f0 {\f0\fs20 1 1/2}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx6000
      \intbl {\f0 {\f0\fs20 1 1/2}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx7500
      \intbl {\f0 {\f0\fs20 1 1/2}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx9000
      \intbl {\f0 {\f0\fs20 1 2/4}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx10500
      \intbl {\f0 {\f0\fs20 1 4/8}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx12000
      \intbl {\f0 {\f0\fs20 1 8/16}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx13500
      \intbl {\f0 {\f0\fs20 1 50/100}}\cell
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx1500
      \intbl {\f0 {\f0\fs20 1.6000}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx3000
      \intbl {\f0 {\f0\fs20 1 3/5}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx4500
      \intbl {\f0 {\f0\fs20 1 3/5}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx6000
      \intbl {\f0 {\f0\fs20 1 3/5}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx7500
      \intbl {\f0 {\f0\fs20 1 1/2}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx9000
      \intbl {\f0 {\f0\fs20 1 2/4}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx10500
      \intbl {\f0 {\f0\fs20 1 5/8}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx12000
      \intbl {\f0 {\f0\fs20 1 10/16}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx13500
      \intbl {\f0 {\f0\fs20 1 60/100}}\cell
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx1500
      \intbl {\f0 {\f0\fs20 1.7500}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx3000
      \intbl {\f0 {\f0\fs20 1 3/4}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx4500
      \intbl {\f0 {\f0\fs20 1 3/4}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx6000
      \intbl {\f0 {\f0\fs20 1 3/4}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx7500
      \intbl {\f0 {\f0\fs20 2}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx9000
      \intbl {\f0 {\f0\fs20 1 3/4}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx10500
      \intbl {\f0 {\f0\fs20 1 6/8}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx12000
      \intbl {\f0 {\f0\fs20 1 12/16}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx13500
      \intbl {\f0 {\f0\fs20 1 75/100}}\cell
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx1500
      \intbl {\f0 {\f0\fs20 1.9000}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx3000
      \intbl {\f0 {\f0\fs20 1 8/9}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx4500
      \intbl {\f0 {\f0\fs20 1 9/10}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx6000
      \intbl {\f0 {\f0\fs20 1 9/10}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx7500
      \intbl {\f0 {\f0\fs20 2}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx9000
      \intbl {\f0 {\f0\fs20 2}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx10500
      \intbl {\f0 {\f0\fs20 1 7/8}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx12000
      \intbl {\f0 {\f0\fs20 1 14/16}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx13500
      \intbl {\f0 {\f0\fs20 1 90/100}}\cell
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx1500
      \intbl {\f0 {\f0\fs20 1.9900}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx3000
      \intbl {\f0 {\f0\fs20 2}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx4500
      \intbl {\f0 {\f0\fs20 1 98/99}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx6000
      \intbl {\f0 {\f0\fs20 1 99/100}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx7500
      \intbl {\f0 {\f0\fs20 2}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx9000
      \intbl {\f0 {\f0\fs20 2}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx10500
      \intbl {\f0 {\f0\fs20 2}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx12000
      \intbl {\f0 {\f0\fs20 2}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx13500
      \intbl {\f0 {\f0\fs20 1 99/100}}\cell
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx1500
      \intbl {\f0 {\f0\fs20 1.9990}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx3000
      \intbl {\f0 {\f0\fs20 2}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx4500
      \intbl {\f0 {\f0\fs20 2}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx6000
      \intbl {\f0 {\f0\fs20 1 998/999}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx7500
      \intbl {\f0 {\f0\fs20 2}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx9000
      \intbl {\f0 {\f0\fs20 2}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx10500
      \intbl {\f0 {\f0\fs20 2}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx12000
      \intbl {\f0 {\f0\fs20 2}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx13500
      \intbl {\f0 {\f0\fs20 2}}\cell
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx1500
      \intbl {\f0 {\f0\fs20 1.9999}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx3000
      \intbl {\f0 {\f0\fs20 2}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx4500
      \intbl {\f0 {\f0\fs20 2}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx6000
      \intbl {\f0 {\f0\fs20 2}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx7500
      \intbl {\f0 {\f0\fs20 2}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx9000
      \intbl {\f0 {\f0\fs20 2}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx10500
      \intbl {\f0 {\f0\fs20 2}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx12000
      \intbl {\f0 {\f0\fs20 2}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx13500
      \intbl {\f0 {\f0\fs20 2}}\cell
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\ql\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx13500
      \intbl {\f0\fs20 -1 to -2}\cell
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx1500
      \intbl {\f0 {\f0\fs20 -1.0001}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx3000
      \intbl {\f0 {\f0\fs20 -1}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx4500
      \intbl {\f0 {\f0\fs20 -1}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx6000
      \intbl {\f0 {\f0\fs20 -1}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx7500
      \intbl {\f0 {\f0\fs20 -1}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx9000
      \intbl {\f0 {\f0\fs20 -1}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx10500
      \intbl {\f0 {\f0\fs20 -1}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx12000
      \intbl {\f0 {\f0\fs20 -1}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx13500
      \intbl {\f0 {\f0\fs20 -1}}\cell
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx1500
      \intbl {\f0 {\f0\fs20 -1.0010}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx3000
      \intbl {\f0 {\f0\fs20 -1}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx4500
      \intbl {\f0 {\f0\fs20 -1}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx6000
      \intbl {\f0 {\f0\fs20 -1 1/999}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx7500
      \intbl {\f0 {\f0\fs20 -1}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx9000
      \intbl {\f0 {\f0\fs20 -1}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx10500
      \intbl {\f0 {\f0\fs20 -1}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx12000
      \intbl {\f0 {\f0\fs20 -1}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx13500
      \intbl {\f0 {\f0\fs20 -1}}\cell
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx1500
      \intbl {\f0 {\f0\fs20 -1.0100}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx3000
      \intbl {\f0 {\f0\fs20 -1}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx4500
      \intbl {\f0 {\f0\fs20 -1 1/99}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx6000
      \intbl {\f0 {\f0\fs20 -1 1/100}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx7500
      \intbl {\f0 {\f0\fs20 -1}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx9000
      \intbl {\f0 {\f0\fs20 -1}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx10500
      \intbl {\f0 {\f0\fs20 -1}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx12000
      \intbl {\f0 {\f0\fs20 -1}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx13500
      \intbl {\f0 {\f0\fs20 -1 1/100}}\cell
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx1500
      \intbl {\f0 {\f0\fs20 -1.1000}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx3000
      \intbl {\f0 {\f0\fs20 -1 1/9}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx4500
      \intbl {\f0 {\f0\fs20 -1 1/10}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx6000
      \intbl {\f0 {\f0\fs20 -1 1/10}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx7500
      \intbl {\f0 {\f0\fs20 -1}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx9000
      \intbl {\f0 {\f0\fs20 -1}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx10500
      \intbl {\f0 {\f0\fs20 -1 1/8}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx12000
      \intbl {\f0 {\f0\fs20 -1 2/16}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx13500
      \intbl {\f0 {\f0\fs20 -1 10/100}}\cell
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx1500
      \intbl {\f0 {\f0\fs20 -1.2500}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx3000
      \intbl {\f0 {\f0\fs20 -1 1/4}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx4500
      \intbl {\f0 {\f0\fs20 -1 1/4}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx6000
      \intbl {\f0 {\f0\fs20 -1 1/4}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx7500
      \intbl {\f0 {\f0\fs20 -1 1/2}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx9000
      \intbl {\f0 {\f0\fs20 -1 1/4}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx10500
      \intbl {\f0 {\f0\fs20 -1 2/8}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx12000
      \intbl {\f0 {\f0\fs20 -1 4/16}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx13500
      \intbl {\f0 {\f0\fs20 -1 25/100}}\cell
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx1500
      \intbl {\f0 {\f0\fs20 -1.4000}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx3000
      \intbl {\f0 {\f0\fs20 -1 2/5}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx4500
      \intbl {\f0 {\f0\fs20 -1 2/5}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx6000
      \intbl {\f0 {\f0\fs20 -1 2/5}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx7500
      \intbl {\f0 {\f0\fs20 -1 1/2}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx9000
      \intbl {\f0 {\f0\fs20 -1 2/4}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx10500
      \intbl {\f0 {\f0\fs20 -1 3/8}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx12000
      \intbl {\f0 {\f0\fs20 -1 6/16}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx13500
      \intbl {\f0 {\f0\fs20 -1 40/100}}\cell
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx1500
      \intbl {\f0 {\f0\fs20 -1.5000}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx3000
      \intbl {\f0 {\f0\fs20 -1 1/2}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx4500
      \intbl {\f0 {\f0\fs20 -1 1/2}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx6000
      \intbl {\f0 {\f0\fs20 -1 1/2}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx7500
      \intbl {\f0 {\f0\fs20 -1 1/2}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx9000
      \intbl {\f0 {\f0\fs20 -1 2/4}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx10500
      \intbl {\f0 {\f0\fs20 -1 4/8}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx12000
      \intbl {\f0 {\f0\fs20 -1 8/16}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx13500
      \intbl {\f0 {\f0\fs20 -1 50/100}}\cell
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx1500
      \intbl {\f0 {\f0\fs20 -1.6000}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx3000
      \intbl {\f0 {\f0\fs20 -1 3/5}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx4500
      \intbl {\f0 {\f0\fs20 -1 3/5}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx6000
      \intbl {\f0 {\f0\fs20 -1 3/5}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx7500
      \intbl {\f0 {\f0\fs20 -1 1/2}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx9000
      \intbl {\f0 {\f0\fs20 -1 2/4}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx10500
      \intbl {\f0 {\f0\fs20 -1 5/8}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx12000
      \intbl {\f0 {\f0\fs20 -1 10/16}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx13500
      \intbl {\f0 {\f0\fs20 -1 60/100}}\cell
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx1500
      \intbl {\f0 {\f0\fs20 -1.7500}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx3000
      \intbl {\f0 {\f0\fs20 -1 3/4}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx4500
      \intbl {\f0 {\f0\fs20 -1 3/4}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx6000
      \intbl {\f0 {\f0\fs20 -1 3/4}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx7500
      \intbl {\f0 {\f0\fs20 -2}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx9000
      \intbl {\f0 {\f0\fs20 -1 3/4}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx10500
      \intbl {\f0 {\f0\fs20 -1 6/8}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx12000
      \intbl {\f0 {\f0\fs20 -1 12/16}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx13500
      \intbl {\f0 {\f0\fs20 -1 75/100}}\cell
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx1500
      \intbl {\f0 {\f0\fs20 -1.9000}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx3000
      \intbl {\f0 {\f0\fs20 -1 8/9}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx4500
      \intbl {\f0 {\f0\fs20 -1 9/10}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx6000
      \intbl {\f0 {\f0\fs20 -1 9/10}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx7500
      \intbl {\f0 {\f0\fs20 -2}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx9000
      \intbl {\f0 {\f0\fs20 -2}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx10500
      \intbl {\f0 {\f0\fs20 -1 7/8}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx12000
      \intbl {\f0 {\f0\fs20 -1 14/16}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx13500
      \intbl {\f0 {\f0\fs20 -1 90/100}}\cell
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx1500
      \intbl {\f0 {\f0\fs20 -1.9900}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx3000
      \intbl {\f0 {\f0\fs20 -2}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx4500
      \intbl {\f0 {\f0\fs20 -1 98/99}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx6000
      \intbl {\f0 {\f0\fs20 -1 99/100}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx7500
      \intbl {\f0 {\f0\fs20 -2}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx9000
      \intbl {\f0 {\f0\fs20 -2}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx10500
      \intbl {\f0 {\f0\fs20 -2}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx12000
      \intbl {\f0 {\f0\fs20 -2}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx13500
      \intbl {\f0 {\f0\fs20 -1 99/100}}\cell
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx1500
      \intbl {\f0 {\f0\fs20 -1.9990}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx3000
      \intbl {\f0 {\f0\fs20 -2}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx4500
      \intbl {\f0 {\f0\fs20 -2}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx6000
      \intbl {\f0 {\f0\fs20 -1 998/999}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx7500
      \intbl {\f0 {\f0\fs20 -2}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx9000
      \intbl {\f0 {\f0\fs20 -2}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx10500
      \intbl {\f0 {\f0\fs20 -2}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx12000
      \intbl {\f0 {\f0\fs20 -2}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx13500
      \intbl {\f0 {\f0\fs20 -2}}\cell
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx1500
      \intbl {\f0 {\f0\fs20 -1.9999}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx3000
      \intbl {\f0 {\f0\fs20 -2}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx4500
      \intbl {\f0 {\f0\fs20 -2}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx6000
      \intbl {\f0 {\f0\fs20 -2}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx7500
      \intbl {\f0 {\f0\fs20 -2}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx9000
      \intbl {\f0 {\f0\fs20 -2}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx10500
      \intbl {\f0 {\f0\fs20 -2}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx12000
      \intbl {\f0 {\f0\fs20 -2}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx13500
      \intbl {\f0 {\f0\fs20 -2}}\cell
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\ql\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx13500
      \intbl {\f0\fs20 Exact Numbers}\cell
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx1500
      \intbl {\f0 {\f0\fs20 -1.0000}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx3000
      \intbl {\f0 {\f0\fs20 -1}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx4500
      \intbl {\f0 {\f0\fs20 -1}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx6000
      \intbl {\f0 {\f0\fs20 -1}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx7500
      \intbl {\f0 {\f0\fs20 -1}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx9000
      \intbl {\f0 {\f0\fs20 -1}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx10500
      \intbl {\f0 {\f0\fs20 -1}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx12000
      \intbl {\f0 {\f0\fs20 -1}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx13500
      \intbl {\f0 {\f0\fs20 -1}}\cell
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx1500
      \intbl {\f0 {\f0\fs20 0.0000}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx3000
      \intbl {\f0 {\f0\fs20 0}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx4500
      \intbl {\f0 {\f0\fs20 0}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx6000
      \intbl {\f0 {\f0\fs20 0}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx7500
      \intbl {\f0 {\f0\fs20 0}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx9000
      \intbl {\f0 {\f0\fs20 0}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx10500
      \intbl {\f0 {\f0\fs20 0}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx12000
      \intbl {\f0 {\f0\fs20 0}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx13500
      \intbl {\f0 {\f0\fs20 0}}\cell
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx1500
      \intbl {\f0 {\f0\fs20 1.0000}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx3000
      \intbl {\f0 {\f0\fs20 1}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx4500
      \intbl {\f0 {\f0\fs20 1}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx6000
      \intbl {\f0 {\f0\fs20 1}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx7500
      \intbl {\f0 {\f0\fs20 1}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx9000
      \intbl {\f0 {\f0\fs20 1}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx10500
      \intbl {\f0 {\f0\fs20 1}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx12000
      \intbl {\f0 {\f0\fs20 1}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx13500
      \intbl {\f0 {\f0\fs20 1}}\cell
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\ql\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx13500
      \intbl {\f0\fs20 Not Numbers}\cell
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx1500
      \intbl {\f0 {\f0\fs20 NA}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx3000
      \intbl {\f0 {\f0\fs20 NA}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx4500
      \intbl {\f0 {\f0\fs20 NA}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx6000
      \intbl {\f0 {\f0\fs20 NA}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx7500
      \intbl {\f0 {\f0\fs20 NA}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx9000
      \intbl {\f0 {\f0\fs20 NA}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx10500
      \intbl {\f0 {\f0\fs20 NA}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx12000
      \intbl {\f0 {\f0\fs20 NA}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx13500
      \intbl {\f0 {\f0\fs20 NA}}\cell
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx1500
      \intbl {\f0 {\f0\fs20 NaN}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx3000
      \intbl {\f0 {\f0\fs20 NaN}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx4500
      \intbl {\f0 {\f0\fs20 NaN}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx6000
      \intbl {\f0 {\f0\fs20 NaN}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx7500
      \intbl {\f0 {\f0\fs20 NaN}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx9000
      \intbl {\f0 {\f0\fs20 NaN}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx10500
      \intbl {\f0 {\f0\fs20 NaN}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx12000
      \intbl {\f0 {\f0\fs20 NaN}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx13500
      \intbl {\f0 {\f0\fs20 NaN}}\cell
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx1500
      \intbl {\f0 {\f0\fs20 Inf}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx3000
      \intbl {\f0 {\f0\fs20 Inf}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx4500
      \intbl {\f0 {\f0\fs20 Inf}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx6000
      \intbl {\f0 {\f0\fs20 Inf}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx7500
      \intbl {\f0 {\f0\fs20 Inf}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx9000
      \intbl {\f0 {\f0\fs20 Inf}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx10500
      \intbl {\f0 {\f0\fs20 Inf}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx12000
      \intbl {\f0 {\f0\fs20 Inf}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx13500
      \intbl {\f0 {\f0\fs20 Inf}}\cell
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx1500
      \intbl {\f0 {\f0\fs20 -Inf}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx3000
      \intbl {\f0 {\f0\fs20 -Inf}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx4500
      \intbl {\f0 {\f0\fs20 -Inf}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx6000
      \intbl {\f0 {\f0\fs20 -Inf}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx7500
      \intbl {\f0 {\f0\fs20 -Inf}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx9000
      \intbl {\f0 {\f0\fs20 -Inf}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx10500
      \intbl {\f0 {\f0\fs20 -Inf}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx12000
      \intbl {\f0 {\f0\fs20 -Inf}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx13500
      \intbl {\f0 {\f0\fs20 -Inf}}\cell
      
      \row
      
      }

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
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85\clbrdrb\brdrs\brdrw20\brdrcf1 \cellx1500
      \intbl {\f0 {\f0\fs20 }}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85\clbrdrb\brdrs\brdrw20\brdrcf1 \cellx3000
      \intbl {\f0 {\f0\fs20 low}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85\clbrdrb\brdrs\brdrw20\brdrcf1 \cellx4500
      \intbl {\f0 {\f0\fs20 med}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85\clbrdrb\brdrs\brdrw20\brdrcf1 \cellx6000
      \intbl {\f0 {\f0\fs20 high}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85\clbrdrb\brdrs\brdrw20\brdrcf1 \cellx7500
      \intbl {\f0 {\f0\fs20 halves}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85\clbrdrb\brdrs\brdrw20\brdrcf1 \cellx9000
      \intbl {\f0 {\f0\fs20 quarters}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85\clbrdrb\brdrs\brdrw20\brdrcf1 \cellx10500
      \intbl {\f0 {\f0\fs20 eighths}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85\clbrdrb\brdrs\brdrw20\brdrcf1 \cellx12000
      \intbl {\f0 {\f0\fs20 sixteenths}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85\clbrdrb\brdrs\brdrw20\brdrcf1 \cellx13500
      \intbl {\f0 {\f0\fs20 hundredths}}\cell
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\ql\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx13500
      \intbl {\f0\fs20 0 to 1}\cell
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx1500
      \intbl {\f0 {\f0\fs20 0.0001}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx3000
      \intbl {\f0 {\f0\fs20 0}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx4500
      \intbl {\f0 {\f0\fs20 0}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx6000
      \intbl {\f0 {\f0\fs20 0}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx7500
      \intbl {\f0 {\f0\fs20 0}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx9000
      \intbl {\f0 {\f0\fs20 0}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx10500
      \intbl {\f0 {\f0\fs20 0}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx12000
      \intbl {\f0 {\f0\fs20 0}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx13500
      \intbl {\f0 {\f0\fs20 0}}\cell
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx1500
      \intbl {\f0 {\f0\fs20 0.0010}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx3000
      \intbl {\f0 {\f0\fs20 0}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx4500
      \intbl {\f0 {\f0\fs20 0}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx6000
      \intbl {\f0 {\f0\fs20 1/999}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx7500
      \intbl {\f0 {\f0\fs20 0}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx9000
      \intbl {\f0 {\f0\fs20 0}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx10500
      \intbl {\f0 {\f0\fs20 0}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx12000
      \intbl {\f0 {\f0\fs20 0}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx13500
      \intbl {\f0 {\f0\fs20 0}}\cell
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx1500
      \intbl {\f0 {\f0\fs20 0.0100}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx3000
      \intbl {\f0 {\f0\fs20 0}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx4500
      \intbl {\f0 {\f0\fs20 1/99}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx6000
      \intbl {\f0 {\f0\fs20 1/100}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx7500
      \intbl {\f0 {\f0\fs20 0}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx9000
      \intbl {\f0 {\f0\fs20 0}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx10500
      \intbl {\f0 {\f0\fs20 0}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx12000
      \intbl {\f0 {\f0\fs20 0}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx13500
      \intbl {\f0 {\f0\fs20 1/100}}\cell
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx1500
      \intbl {\f0 {\f0\fs20 0.1000}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx3000
      \intbl {\f0 {\f0\fs20 1/9}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx4500
      \intbl {\f0 {\f0\fs20 1/10}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx6000
      \intbl {\f0 {\f0\fs20 1/10}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx7500
      \intbl {\f0 {\f0\fs20 0}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx9000
      \intbl {\f0 {\f0\fs20 0}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx10500
      \intbl {\f0 {\f0\fs20 1/8}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx12000
      \intbl {\f0 {\f0\fs20 1/8}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx13500
      \intbl {\f0 {\f0\fs20 1/10}}\cell
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx1500
      \intbl {\f0 {\f0\fs20 0.2500}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx3000
      \intbl {\f0 {\f0\fs20 1/4}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx4500
      \intbl {\f0 {\f0\fs20 1/4}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx6000
      \intbl {\f0 {\f0\fs20 1/4}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx7500
      \intbl {\f0 {\f0\fs20 1/2}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx9000
      \intbl {\f0 {\f0\fs20 1/4}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx10500
      \intbl {\f0 {\f0\fs20 1/4}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx12000
      \intbl {\f0 {\f0\fs20 1/4}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx13500
      \intbl {\f0 {\f0\fs20 1/4}}\cell
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx1500
      \intbl {\f0 {\f0\fs20 0.4000}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx3000
      \intbl {\f0 {\f0\fs20 2/5}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx4500
      \intbl {\f0 {\f0\fs20 2/5}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx6000
      \intbl {\f0 {\f0\fs20 2/5}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx7500
      \intbl {\f0 {\f0\fs20 1/2}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx9000
      \intbl {\f0 {\f0\fs20 1/2}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx10500
      \intbl {\f0 {\f0\fs20 3/8}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx12000
      \intbl {\f0 {\f0\fs20 3/8}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx13500
      \intbl {\f0 {\f0\fs20 2/5}}\cell
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx1500
      \intbl {\f0 {\f0\fs20 0.5000}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx3000
      \intbl {\f0 {\f0\fs20 1/2}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx4500
      \intbl {\f0 {\f0\fs20 1/2}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx6000
      \intbl {\f0 {\f0\fs20 1/2}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx7500
      \intbl {\f0 {\f0\fs20 1/2}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx9000
      \intbl {\f0 {\f0\fs20 1/2}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx10500
      \intbl {\f0 {\f0\fs20 1/2}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx12000
      \intbl {\f0 {\f0\fs20 1/2}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx13500
      \intbl {\f0 {\f0\fs20 1/2}}\cell
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx1500
      \intbl {\f0 {\f0\fs20 0.6000}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx3000
      \intbl {\f0 {\f0\fs20 3/5}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx4500
      \intbl {\f0 {\f0\fs20 3/5}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx6000
      \intbl {\f0 {\f0\fs20 3/5}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx7500
      \intbl {\f0 {\f0\fs20 1/2}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx9000
      \intbl {\f0 {\f0\fs20 1/2}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx10500
      \intbl {\f0 {\f0\fs20 5/8}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx12000
      \intbl {\f0 {\f0\fs20 5/8}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx13500
      \intbl {\f0 {\f0\fs20 3/5}}\cell
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx1500
      \intbl {\f0 {\f0\fs20 0.7500}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx3000
      \intbl {\f0 {\f0\fs20 3/4}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx4500
      \intbl {\f0 {\f0\fs20 3/4}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx6000
      \intbl {\f0 {\f0\fs20 3/4}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx7500
      \intbl {\f0 {\f0\fs20 1}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx9000
      \intbl {\f0 {\f0\fs20 3/4}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx10500
      \intbl {\f0 {\f0\fs20 3/4}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx12000
      \intbl {\f0 {\f0\fs20 3/4}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx13500
      \intbl {\f0 {\f0\fs20 3/4}}\cell
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx1500
      \intbl {\f0 {\f0\fs20 0.9000}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx3000
      \intbl {\f0 {\f0\fs20 8/9}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx4500
      \intbl {\f0 {\f0\fs20 9/10}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx6000
      \intbl {\f0 {\f0\fs20 9/10}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx7500
      \intbl {\f0 {\f0\fs20 1}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx9000
      \intbl {\f0 {\f0\fs20 1}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx10500
      \intbl {\f0 {\f0\fs20 7/8}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx12000
      \intbl {\f0 {\f0\fs20 7/8}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx13500
      \intbl {\f0 {\f0\fs20 9/10}}\cell
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx1500
      \intbl {\f0 {\f0\fs20 0.9900}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx3000
      \intbl {\f0 {\f0\fs20 1}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx4500
      \intbl {\f0 {\f0\fs20 98/99}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx6000
      \intbl {\f0 {\f0\fs20 99/100}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx7500
      \intbl {\f0 {\f0\fs20 1}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx9000
      \intbl {\f0 {\f0\fs20 1}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx10500
      \intbl {\f0 {\f0\fs20 1}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx12000
      \intbl {\f0 {\f0\fs20 1}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx13500
      \intbl {\f0 {\f0\fs20 99/100}}\cell
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx1500
      \intbl {\f0 {\f0\fs20 0.9990}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx3000
      \intbl {\f0 {\f0\fs20 1}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx4500
      \intbl {\f0 {\f0\fs20 1}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx6000
      \intbl {\f0 {\f0\fs20 998/999}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx7500
      \intbl {\f0 {\f0\fs20 1}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx9000
      \intbl {\f0 {\f0\fs20 1}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx10500
      \intbl {\f0 {\f0\fs20 1}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx12000
      \intbl {\f0 {\f0\fs20 1}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx13500
      \intbl {\f0 {\f0\fs20 1}}\cell
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx1500
      \intbl {\f0 {\f0\fs20 0.9999}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx3000
      \intbl {\f0 {\f0\fs20 1}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx4500
      \intbl {\f0 {\f0\fs20 1}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx6000
      \intbl {\f0 {\f0\fs20 1}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx7500
      \intbl {\f0 {\f0\fs20 1}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx9000
      \intbl {\f0 {\f0\fs20 1}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx10500
      \intbl {\f0 {\f0\fs20 1}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx12000
      \intbl {\f0 {\f0\fs20 1}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx13500
      \intbl {\f0 {\f0\fs20 1}}\cell
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\ql\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx13500
      \intbl {\f0\fs20 0 to -1}\cell
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx1500
      \intbl {\f0 {\f0\fs20 -0.0001}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx3000
      \intbl {\f0 {\f0\fs20 0}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx4500
      \intbl {\f0 {\f0\fs20 0}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx6000
      \intbl {\f0 {\f0\fs20 0}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx7500
      \intbl {\f0 {\f0\fs20 0}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx9000
      \intbl {\f0 {\f0\fs20 0}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx10500
      \intbl {\f0 {\f0\fs20 0}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx12000
      \intbl {\f0 {\f0\fs20 0}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx13500
      \intbl {\f0 {\f0\fs20 0}}\cell
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx1500
      \intbl {\f0 {\f0\fs20 -0.0010}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx3000
      \intbl {\f0 {\f0\fs20 0}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx4500
      \intbl {\f0 {\f0\fs20 0}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx6000
      \intbl {\f0 {\f0\fs20 -1/999}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx7500
      \intbl {\f0 {\f0\fs20 0}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx9000
      \intbl {\f0 {\f0\fs20 0}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx10500
      \intbl {\f0 {\f0\fs20 0}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx12000
      \intbl {\f0 {\f0\fs20 0}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx13500
      \intbl {\f0 {\f0\fs20 0}}\cell
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx1500
      \intbl {\f0 {\f0\fs20 -0.0100}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx3000
      \intbl {\f0 {\f0\fs20 0}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx4500
      \intbl {\f0 {\f0\fs20 -1/99}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx6000
      \intbl {\f0 {\f0\fs20 -1/100}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx7500
      \intbl {\f0 {\f0\fs20 0}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx9000
      \intbl {\f0 {\f0\fs20 0}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx10500
      \intbl {\f0 {\f0\fs20 0}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx12000
      \intbl {\f0 {\f0\fs20 0}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx13500
      \intbl {\f0 {\f0\fs20 -1/100}}\cell
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx1500
      \intbl {\f0 {\f0\fs20 -0.1000}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx3000
      \intbl {\f0 {\f0\fs20 -1/9}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx4500
      \intbl {\f0 {\f0\fs20 -1/10}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx6000
      \intbl {\f0 {\f0\fs20 -1/10}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx7500
      \intbl {\f0 {\f0\fs20 0}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx9000
      \intbl {\f0 {\f0\fs20 0}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx10500
      \intbl {\f0 {\f0\fs20 -1/8}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx12000
      \intbl {\f0 {\f0\fs20 -1/8}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx13500
      \intbl {\f0 {\f0\fs20 -1/10}}\cell
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx1500
      \intbl {\f0 {\f0\fs20 -0.2500}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx3000
      \intbl {\f0 {\f0\fs20 -1/4}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx4500
      \intbl {\f0 {\f0\fs20 -1/4}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx6000
      \intbl {\f0 {\f0\fs20 -1/4}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx7500
      \intbl {\f0 {\f0\fs20 -1/2}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx9000
      \intbl {\f0 {\f0\fs20 -1/4}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx10500
      \intbl {\f0 {\f0\fs20 -1/4}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx12000
      \intbl {\f0 {\f0\fs20 -1/4}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx13500
      \intbl {\f0 {\f0\fs20 -1/4}}\cell
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx1500
      \intbl {\f0 {\f0\fs20 -0.4000}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx3000
      \intbl {\f0 {\f0\fs20 -2/5}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx4500
      \intbl {\f0 {\f0\fs20 -2/5}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx6000
      \intbl {\f0 {\f0\fs20 -2/5}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx7500
      \intbl {\f0 {\f0\fs20 -1/2}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx9000
      \intbl {\f0 {\f0\fs20 -1/2}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx10500
      \intbl {\f0 {\f0\fs20 -3/8}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx12000
      \intbl {\f0 {\f0\fs20 -3/8}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx13500
      \intbl {\f0 {\f0\fs20 -2/5}}\cell
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx1500
      \intbl {\f0 {\f0\fs20 -0.5000}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx3000
      \intbl {\f0 {\f0\fs20 -1/2}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx4500
      \intbl {\f0 {\f0\fs20 -1/2}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx6000
      \intbl {\f0 {\f0\fs20 -1/2}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx7500
      \intbl {\f0 {\f0\fs20 -1/2}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx9000
      \intbl {\f0 {\f0\fs20 -1/2}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx10500
      \intbl {\f0 {\f0\fs20 -1/2}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx12000
      \intbl {\f0 {\f0\fs20 -1/2}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx13500
      \intbl {\f0 {\f0\fs20 -1/2}}\cell
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx1500
      \intbl {\f0 {\f0\fs20 -0.6000}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx3000
      \intbl {\f0 {\f0\fs20 -3/5}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx4500
      \intbl {\f0 {\f0\fs20 -3/5}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx6000
      \intbl {\f0 {\f0\fs20 -3/5}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx7500
      \intbl {\f0 {\f0\fs20 -1/2}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx9000
      \intbl {\f0 {\f0\fs20 -1/2}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx10500
      \intbl {\f0 {\f0\fs20 -5/8}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx12000
      \intbl {\f0 {\f0\fs20 -5/8}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx13500
      \intbl {\f0 {\f0\fs20 -3/5}}\cell
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx1500
      \intbl {\f0 {\f0\fs20 -0.7500}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx3000
      \intbl {\f0 {\f0\fs20 -3/4}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx4500
      \intbl {\f0 {\f0\fs20 -3/4}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx6000
      \intbl {\f0 {\f0\fs20 -3/4}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx7500
      \intbl {\f0 {\f0\fs20 -1}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx9000
      \intbl {\f0 {\f0\fs20 -3/4}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx10500
      \intbl {\f0 {\f0\fs20 -3/4}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx12000
      \intbl {\f0 {\f0\fs20 -3/4}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx13500
      \intbl {\f0 {\f0\fs20 -3/4}}\cell
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx1500
      \intbl {\f0 {\f0\fs20 -0.9000}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx3000
      \intbl {\f0 {\f0\fs20 -8/9}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx4500
      \intbl {\f0 {\f0\fs20 -9/10}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx6000
      \intbl {\f0 {\f0\fs20 -9/10}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx7500
      \intbl {\f0 {\f0\fs20 -1}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx9000
      \intbl {\f0 {\f0\fs20 -1}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx10500
      \intbl {\f0 {\f0\fs20 -7/8}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx12000
      \intbl {\f0 {\f0\fs20 -7/8}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx13500
      \intbl {\f0 {\f0\fs20 -9/10}}\cell
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx1500
      \intbl {\f0 {\f0\fs20 -0.9900}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx3000
      \intbl {\f0 {\f0\fs20 -1}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx4500
      \intbl {\f0 {\f0\fs20 -98/99}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx6000
      \intbl {\f0 {\f0\fs20 -99/100}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx7500
      \intbl {\f0 {\f0\fs20 -1}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx9000
      \intbl {\f0 {\f0\fs20 -1}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx10500
      \intbl {\f0 {\f0\fs20 -1}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx12000
      \intbl {\f0 {\f0\fs20 -1}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx13500
      \intbl {\f0 {\f0\fs20 -99/100}}\cell
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx1500
      \intbl {\f0 {\f0\fs20 -0.9990}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx3000
      \intbl {\f0 {\f0\fs20 -1}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx4500
      \intbl {\f0 {\f0\fs20 -1}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx6000
      \intbl {\f0 {\f0\fs20 -998/999}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx7500
      \intbl {\f0 {\f0\fs20 -1}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx9000
      \intbl {\f0 {\f0\fs20 -1}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx10500
      \intbl {\f0 {\f0\fs20 -1}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx12000
      \intbl {\f0 {\f0\fs20 -1}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx13500
      \intbl {\f0 {\f0\fs20 -1}}\cell
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx1500
      \intbl {\f0 {\f0\fs20 -0.9999}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx3000
      \intbl {\f0 {\f0\fs20 -1}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx4500
      \intbl {\f0 {\f0\fs20 -1}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx6000
      \intbl {\f0 {\f0\fs20 -1}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx7500
      \intbl {\f0 {\f0\fs20 -1}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx9000
      \intbl {\f0 {\f0\fs20 -1}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx10500
      \intbl {\f0 {\f0\fs20 -1}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx12000
      \intbl {\f0 {\f0\fs20 -1}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx13500
      \intbl {\f0 {\f0\fs20 -1}}\cell
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\ql\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx13500
      \intbl {\f0\fs20 1 to 2}\cell
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx1500
      \intbl {\f0 {\f0\fs20 1.0001}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx3000
      \intbl {\f0 {\f0\fs20 1}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx4500
      \intbl {\f0 {\f0\fs20 1}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx6000
      \intbl {\f0 {\f0\fs20 1}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx7500
      \intbl {\f0 {\f0\fs20 1}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx9000
      \intbl {\f0 {\f0\fs20 1}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx10500
      \intbl {\f0 {\f0\fs20 1}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx12000
      \intbl {\f0 {\f0\fs20 1}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx13500
      \intbl {\f0 {\f0\fs20 1}}\cell
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx1500
      \intbl {\f0 {\f0\fs20 1.0010}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx3000
      \intbl {\f0 {\f0\fs20 1}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx4500
      \intbl {\f0 {\f0\fs20 1}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx6000
      \intbl {\f0 {\f0\fs20 1 1/999}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx7500
      \intbl {\f0 {\f0\fs20 1}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx9000
      \intbl {\f0 {\f0\fs20 1}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx10500
      \intbl {\f0 {\f0\fs20 1}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx12000
      \intbl {\f0 {\f0\fs20 1}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx13500
      \intbl {\f0 {\f0\fs20 1}}\cell
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx1500
      \intbl {\f0 {\f0\fs20 1.0100}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx3000
      \intbl {\f0 {\f0\fs20 1}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx4500
      \intbl {\f0 {\f0\fs20 1 1/99}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx6000
      \intbl {\f0 {\f0\fs20 1 1/100}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx7500
      \intbl {\f0 {\f0\fs20 1}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx9000
      \intbl {\f0 {\f0\fs20 1}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx10500
      \intbl {\f0 {\f0\fs20 1}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx12000
      \intbl {\f0 {\f0\fs20 1}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx13500
      \intbl {\f0 {\f0\fs20 1 1/100}}\cell
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx1500
      \intbl {\f0 {\f0\fs20 1.1000}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx3000
      \intbl {\f0 {\f0\fs20 1 1/9}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx4500
      \intbl {\f0 {\f0\fs20 1 1/10}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx6000
      \intbl {\f0 {\f0\fs20 1 1/10}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx7500
      \intbl {\f0 {\f0\fs20 1}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx9000
      \intbl {\f0 {\f0\fs20 1}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx10500
      \intbl {\f0 {\f0\fs20 1 1/8}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx12000
      \intbl {\f0 {\f0\fs20 1 1/8}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx13500
      \intbl {\f0 {\f0\fs20 1 1/10}}\cell
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx1500
      \intbl {\f0 {\f0\fs20 1.2500}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx3000
      \intbl {\f0 {\f0\fs20 1 1/4}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx4500
      \intbl {\f0 {\f0\fs20 1 1/4}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx6000
      \intbl {\f0 {\f0\fs20 1 1/4}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx7500
      \intbl {\f0 {\f0\fs20 1 1/2}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx9000
      \intbl {\f0 {\f0\fs20 1 1/4}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx10500
      \intbl {\f0 {\f0\fs20 1 1/4}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx12000
      \intbl {\f0 {\f0\fs20 1 1/4}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx13500
      \intbl {\f0 {\f0\fs20 1 1/4}}\cell
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx1500
      \intbl {\f0 {\f0\fs20 1.4000}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx3000
      \intbl {\f0 {\f0\fs20 1 2/5}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx4500
      \intbl {\f0 {\f0\fs20 1 2/5}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx6000
      \intbl {\f0 {\f0\fs20 1 2/5}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx7500
      \intbl {\f0 {\f0\fs20 1 1/2}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx9000
      \intbl {\f0 {\f0\fs20 1 1/2}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx10500
      \intbl {\f0 {\f0\fs20 1 3/8}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx12000
      \intbl {\f0 {\f0\fs20 1 3/8}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx13500
      \intbl {\f0 {\f0\fs20 1 2/5}}\cell
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx1500
      \intbl {\f0 {\f0\fs20 1.5000}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx3000
      \intbl {\f0 {\f0\fs20 1 1/2}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx4500
      \intbl {\f0 {\f0\fs20 1 1/2}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx6000
      \intbl {\f0 {\f0\fs20 1 1/2}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx7500
      \intbl {\f0 {\f0\fs20 1 1/2}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx9000
      \intbl {\f0 {\f0\fs20 1 1/2}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx10500
      \intbl {\f0 {\f0\fs20 1 1/2}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx12000
      \intbl {\f0 {\f0\fs20 1 1/2}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx13500
      \intbl {\f0 {\f0\fs20 1 1/2}}\cell
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx1500
      \intbl {\f0 {\f0\fs20 1.6000}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx3000
      \intbl {\f0 {\f0\fs20 1 3/5}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx4500
      \intbl {\f0 {\f0\fs20 1 3/5}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx6000
      \intbl {\f0 {\f0\fs20 1 3/5}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx7500
      \intbl {\f0 {\f0\fs20 1 1/2}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx9000
      \intbl {\f0 {\f0\fs20 1 1/2}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx10500
      \intbl {\f0 {\f0\fs20 1 5/8}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx12000
      \intbl {\f0 {\f0\fs20 1 5/8}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx13500
      \intbl {\f0 {\f0\fs20 1 3/5}}\cell
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx1500
      \intbl {\f0 {\f0\fs20 1.7500}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx3000
      \intbl {\f0 {\f0\fs20 1 3/4}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx4500
      \intbl {\f0 {\f0\fs20 1 3/4}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx6000
      \intbl {\f0 {\f0\fs20 1 3/4}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx7500
      \intbl {\f0 {\f0\fs20 2}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx9000
      \intbl {\f0 {\f0\fs20 1 3/4}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx10500
      \intbl {\f0 {\f0\fs20 1 3/4}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx12000
      \intbl {\f0 {\f0\fs20 1 3/4}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx13500
      \intbl {\f0 {\f0\fs20 1 3/4}}\cell
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx1500
      \intbl {\f0 {\f0\fs20 1.9000}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx3000
      \intbl {\f0 {\f0\fs20 1 8/9}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx4500
      \intbl {\f0 {\f0\fs20 1 9/10}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx6000
      \intbl {\f0 {\f0\fs20 1 9/10}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx7500
      \intbl {\f0 {\f0\fs20 2}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx9000
      \intbl {\f0 {\f0\fs20 2}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx10500
      \intbl {\f0 {\f0\fs20 1 7/8}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx12000
      \intbl {\f0 {\f0\fs20 1 7/8}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx13500
      \intbl {\f0 {\f0\fs20 1 9/10}}\cell
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx1500
      \intbl {\f0 {\f0\fs20 1.9900}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx3000
      \intbl {\f0 {\f0\fs20 2}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx4500
      \intbl {\f0 {\f0\fs20 1 98/99}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx6000
      \intbl {\f0 {\f0\fs20 1 99/100}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx7500
      \intbl {\f0 {\f0\fs20 2}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx9000
      \intbl {\f0 {\f0\fs20 2}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx10500
      \intbl {\f0 {\f0\fs20 2}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx12000
      \intbl {\f0 {\f0\fs20 2}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx13500
      \intbl {\f0 {\f0\fs20 1 99/100}}\cell
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx1500
      \intbl {\f0 {\f0\fs20 1.9990}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx3000
      \intbl {\f0 {\f0\fs20 2}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx4500
      \intbl {\f0 {\f0\fs20 2}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx6000
      \intbl {\f0 {\f0\fs20 1 998/999}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx7500
      \intbl {\f0 {\f0\fs20 2}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx9000
      \intbl {\f0 {\f0\fs20 2}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx10500
      \intbl {\f0 {\f0\fs20 2}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx12000
      \intbl {\f0 {\f0\fs20 2}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx13500
      \intbl {\f0 {\f0\fs20 2}}\cell
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx1500
      \intbl {\f0 {\f0\fs20 1.9999}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx3000
      \intbl {\f0 {\f0\fs20 2}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx4500
      \intbl {\f0 {\f0\fs20 2}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx6000
      \intbl {\f0 {\f0\fs20 2}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx7500
      \intbl {\f0 {\f0\fs20 2}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx9000
      \intbl {\f0 {\f0\fs20 2}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx10500
      \intbl {\f0 {\f0\fs20 2}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx12000
      \intbl {\f0 {\f0\fs20 2}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx13500
      \intbl {\f0 {\f0\fs20 2}}\cell
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\ql\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx13500
      \intbl {\f0\fs20 -1 to -2}\cell
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx1500
      \intbl {\f0 {\f0\fs20 -1.0001}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx3000
      \intbl {\f0 {\f0\fs20 -1}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx4500
      \intbl {\f0 {\f0\fs20 -1}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx6000
      \intbl {\f0 {\f0\fs20 -1}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx7500
      \intbl {\f0 {\f0\fs20 -1}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx9000
      \intbl {\f0 {\f0\fs20 -1}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx10500
      \intbl {\f0 {\f0\fs20 -1}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx12000
      \intbl {\f0 {\f0\fs20 -1}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx13500
      \intbl {\f0 {\f0\fs20 -1}}\cell
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx1500
      \intbl {\f0 {\f0\fs20 -1.0010}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx3000
      \intbl {\f0 {\f0\fs20 -1}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx4500
      \intbl {\f0 {\f0\fs20 -1}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx6000
      \intbl {\f0 {\f0\fs20 -1 1/999}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx7500
      \intbl {\f0 {\f0\fs20 -1}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx9000
      \intbl {\f0 {\f0\fs20 -1}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx10500
      \intbl {\f0 {\f0\fs20 -1}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx12000
      \intbl {\f0 {\f0\fs20 -1}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx13500
      \intbl {\f0 {\f0\fs20 -1}}\cell
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx1500
      \intbl {\f0 {\f0\fs20 -1.0100}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx3000
      \intbl {\f0 {\f0\fs20 -1}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx4500
      \intbl {\f0 {\f0\fs20 -1 1/99}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx6000
      \intbl {\f0 {\f0\fs20 -1 1/100}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx7500
      \intbl {\f0 {\f0\fs20 -1}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx9000
      \intbl {\f0 {\f0\fs20 -1}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx10500
      \intbl {\f0 {\f0\fs20 -1}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx12000
      \intbl {\f0 {\f0\fs20 -1}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx13500
      \intbl {\f0 {\f0\fs20 -1 1/100}}\cell
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx1500
      \intbl {\f0 {\f0\fs20 -1.1000}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx3000
      \intbl {\f0 {\f0\fs20 -1 1/9}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx4500
      \intbl {\f0 {\f0\fs20 -1 1/10}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx6000
      \intbl {\f0 {\f0\fs20 -1 1/10}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx7500
      \intbl {\f0 {\f0\fs20 -1}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx9000
      \intbl {\f0 {\f0\fs20 -1}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx10500
      \intbl {\f0 {\f0\fs20 -1 1/8}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx12000
      \intbl {\f0 {\f0\fs20 -1 1/8}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx13500
      \intbl {\f0 {\f0\fs20 -1 1/10}}\cell
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx1500
      \intbl {\f0 {\f0\fs20 -1.2500}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx3000
      \intbl {\f0 {\f0\fs20 -1 1/4}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx4500
      \intbl {\f0 {\f0\fs20 -1 1/4}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx6000
      \intbl {\f0 {\f0\fs20 -1 1/4}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx7500
      \intbl {\f0 {\f0\fs20 -1 1/2}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx9000
      \intbl {\f0 {\f0\fs20 -1 1/4}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx10500
      \intbl {\f0 {\f0\fs20 -1 1/4}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx12000
      \intbl {\f0 {\f0\fs20 -1 1/4}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx13500
      \intbl {\f0 {\f0\fs20 -1 1/4}}\cell
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx1500
      \intbl {\f0 {\f0\fs20 -1.4000}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx3000
      \intbl {\f0 {\f0\fs20 -1 2/5}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx4500
      \intbl {\f0 {\f0\fs20 -1 2/5}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx6000
      \intbl {\f0 {\f0\fs20 -1 2/5}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx7500
      \intbl {\f0 {\f0\fs20 -1 1/2}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx9000
      \intbl {\f0 {\f0\fs20 -1 1/2}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx10500
      \intbl {\f0 {\f0\fs20 -1 3/8}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx12000
      \intbl {\f0 {\f0\fs20 -1 3/8}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx13500
      \intbl {\f0 {\f0\fs20 -1 2/5}}\cell
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx1500
      \intbl {\f0 {\f0\fs20 -1.5000}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx3000
      \intbl {\f0 {\f0\fs20 -1 1/2}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx4500
      \intbl {\f0 {\f0\fs20 -1 1/2}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx6000
      \intbl {\f0 {\f0\fs20 -1 1/2}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx7500
      \intbl {\f0 {\f0\fs20 -1 1/2}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx9000
      \intbl {\f0 {\f0\fs20 -1 1/2}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx10500
      \intbl {\f0 {\f0\fs20 -1 1/2}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx12000
      \intbl {\f0 {\f0\fs20 -1 1/2}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx13500
      \intbl {\f0 {\f0\fs20 -1 1/2}}\cell
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx1500
      \intbl {\f0 {\f0\fs20 -1.6000}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx3000
      \intbl {\f0 {\f0\fs20 -1 3/5}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx4500
      \intbl {\f0 {\f0\fs20 -1 3/5}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx6000
      \intbl {\f0 {\f0\fs20 -1 3/5}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx7500
      \intbl {\f0 {\f0\fs20 -1 1/2}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx9000
      \intbl {\f0 {\f0\fs20 -1 1/2}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx10500
      \intbl {\f0 {\f0\fs20 -1 5/8}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx12000
      \intbl {\f0 {\f0\fs20 -1 5/8}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx13500
      \intbl {\f0 {\f0\fs20 -1 3/5}}\cell
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx1500
      \intbl {\f0 {\f0\fs20 -1.7500}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx3000
      \intbl {\f0 {\f0\fs20 -1 3/4}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx4500
      \intbl {\f0 {\f0\fs20 -1 3/4}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx6000
      \intbl {\f0 {\f0\fs20 -1 3/4}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx7500
      \intbl {\f0 {\f0\fs20 -2}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx9000
      \intbl {\f0 {\f0\fs20 -1 3/4}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx10500
      \intbl {\f0 {\f0\fs20 -1 3/4}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx12000
      \intbl {\f0 {\f0\fs20 -1 3/4}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx13500
      \intbl {\f0 {\f0\fs20 -1 3/4}}\cell
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx1500
      \intbl {\f0 {\f0\fs20 -1.9000}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx3000
      \intbl {\f0 {\f0\fs20 -1 8/9}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx4500
      \intbl {\f0 {\f0\fs20 -1 9/10}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx6000
      \intbl {\f0 {\f0\fs20 -1 9/10}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx7500
      \intbl {\f0 {\f0\fs20 -2}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx9000
      \intbl {\f0 {\f0\fs20 -2}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx10500
      \intbl {\f0 {\f0\fs20 -1 7/8}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx12000
      \intbl {\f0 {\f0\fs20 -1 7/8}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx13500
      \intbl {\f0 {\f0\fs20 -1 9/10}}\cell
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx1500
      \intbl {\f0 {\f0\fs20 -1.9900}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx3000
      \intbl {\f0 {\f0\fs20 -2}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx4500
      \intbl {\f0 {\f0\fs20 -1 98/99}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx6000
      \intbl {\f0 {\f0\fs20 -1 99/100}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx7500
      \intbl {\f0 {\f0\fs20 -2}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx9000
      \intbl {\f0 {\f0\fs20 -2}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx10500
      \intbl {\f0 {\f0\fs20 -2}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx12000
      \intbl {\f0 {\f0\fs20 -2}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx13500
      \intbl {\f0 {\f0\fs20 -1 99/100}}\cell
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx1500
      \intbl {\f0 {\f0\fs20 -1.9990}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx3000
      \intbl {\f0 {\f0\fs20 -2}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx4500
      \intbl {\f0 {\f0\fs20 -2}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx6000
      \intbl {\f0 {\f0\fs20 -1 998/999}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx7500
      \intbl {\f0 {\f0\fs20 -2}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx9000
      \intbl {\f0 {\f0\fs20 -2}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx10500
      \intbl {\f0 {\f0\fs20 -2}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx12000
      \intbl {\f0 {\f0\fs20 -2}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx13500
      \intbl {\f0 {\f0\fs20 -2}}\cell
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx1500
      \intbl {\f0 {\f0\fs20 -1.9999}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx3000
      \intbl {\f0 {\f0\fs20 -2}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx4500
      \intbl {\f0 {\f0\fs20 -2}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx6000
      \intbl {\f0 {\f0\fs20 -2}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx7500
      \intbl {\f0 {\f0\fs20 -2}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx9000
      \intbl {\f0 {\f0\fs20 -2}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx10500
      \intbl {\f0 {\f0\fs20 -2}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx12000
      \intbl {\f0 {\f0\fs20 -2}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx13500
      \intbl {\f0 {\f0\fs20 -2}}\cell
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\ql\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx13500
      \intbl {\f0\fs20 Exact Numbers}\cell
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx1500
      \intbl {\f0 {\f0\fs20 -1.0000}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx3000
      \intbl {\f0 {\f0\fs20 -1}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx4500
      \intbl {\f0 {\f0\fs20 -1}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx6000
      \intbl {\f0 {\f0\fs20 -1}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx7500
      \intbl {\f0 {\f0\fs20 -1}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx9000
      \intbl {\f0 {\f0\fs20 -1}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx10500
      \intbl {\f0 {\f0\fs20 -1}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx12000
      \intbl {\f0 {\f0\fs20 -1}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx13500
      \intbl {\f0 {\f0\fs20 -1}}\cell
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx1500
      \intbl {\f0 {\f0\fs20 0.0000}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx3000
      \intbl {\f0 {\f0\fs20 0}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx4500
      \intbl {\f0 {\f0\fs20 0}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx6000
      \intbl {\f0 {\f0\fs20 0}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx7500
      \intbl {\f0 {\f0\fs20 0}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx9000
      \intbl {\f0 {\f0\fs20 0}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx10500
      \intbl {\f0 {\f0\fs20 0}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx12000
      \intbl {\f0 {\f0\fs20 0}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx13500
      \intbl {\f0 {\f0\fs20 0}}\cell
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx1500
      \intbl {\f0 {\f0\fs20 1.0000}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx3000
      \intbl {\f0 {\f0\fs20 1}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx4500
      \intbl {\f0 {\f0\fs20 1}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx6000
      \intbl {\f0 {\f0\fs20 1}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx7500
      \intbl {\f0 {\f0\fs20 1}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx9000
      \intbl {\f0 {\f0\fs20 1}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx10500
      \intbl {\f0 {\f0\fs20 1}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx12000
      \intbl {\f0 {\f0\fs20 1}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx13500
      \intbl {\f0 {\f0\fs20 1}}\cell
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\ql\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx13500
      \intbl {\f0\fs20 Not Numbers}\cell
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx1500
      \intbl {\f0 {\f0\fs20 NA}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx3000
      \intbl {\f0 {\f0\fs20 NA}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx4500
      \intbl {\f0 {\f0\fs20 NA}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx6000
      \intbl {\f0 {\f0\fs20 NA}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx7500
      \intbl {\f0 {\f0\fs20 NA}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx9000
      \intbl {\f0 {\f0\fs20 NA}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx10500
      \intbl {\f0 {\f0\fs20 NA}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx12000
      \intbl {\f0 {\f0\fs20 NA}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx13500
      \intbl {\f0 {\f0\fs20 NA}}\cell
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx1500
      \intbl {\f0 {\f0\fs20 NaN}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx3000
      \intbl {\f0 {\f0\fs20 NaN}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx4500
      \intbl {\f0 {\f0\fs20 NaN}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx6000
      \intbl {\f0 {\f0\fs20 NaN}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx7500
      \intbl {\f0 {\f0\fs20 NaN}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx9000
      \intbl {\f0 {\f0\fs20 NaN}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx10500
      \intbl {\f0 {\f0\fs20 NaN}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx12000
      \intbl {\f0 {\f0\fs20 NaN}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx13500
      \intbl {\f0 {\f0\fs20 NaN}}\cell
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx1500
      \intbl {\f0 {\f0\fs20 Inf}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx3000
      \intbl {\f0 {\f0\fs20 Inf}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx4500
      \intbl {\f0 {\f0\fs20 Inf}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx6000
      \intbl {\f0 {\f0\fs20 Inf}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx7500
      \intbl {\f0 {\f0\fs20 Inf}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx9000
      \intbl {\f0 {\f0\fs20 Inf}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx10500
      \intbl {\f0 {\f0\fs20 Inf}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx12000
      \intbl {\f0 {\f0\fs20 Inf}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx13500
      \intbl {\f0 {\f0\fs20 Inf}}\cell
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx1500
      \intbl {\f0 {\f0\fs20 -Inf}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx3000
      \intbl {\f0 {\f0\fs20 -Inf}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx4500
      \intbl {\f0 {\f0\fs20 -Inf}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx6000
      \intbl {\f0 {\f0\fs20 -Inf}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx7500
      \intbl {\f0 {\f0\fs20 -Inf}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx9000
      \intbl {\f0 {\f0\fs20 -Inf}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx10500
      \intbl {\f0 {\f0\fs20 -Inf}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx12000
      \intbl {\f0 {\f0\fs20 -Inf}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx13500
      \intbl {\f0 {\f0\fs20 -Inf}}\cell
      
      \row
      
      }

