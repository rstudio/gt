# Vertical padding across several table parts can be applied

    Code
      cat(render_as_html(gt_tbl))
    Output
      <table class="gt_table" data-quarto-disable-processing="false" data-quarto-bootstrap="false">
        <thead>
          <tr class="gt_heading">
            <td colspan="12" class="gt_heading gt_title gt_font_normal" style>The mtcars Dataset<span class="gt_footnote_marks" style="white-space:nowrap;font-style:italic;font-weight:normal;line-height:0;"><sup>1</sup></span></td>
          </tr>
          <tr class="gt_heading">
            <td colspan="12" class="gt_heading gt_subtitle gt_font_normal gt_bottom_border" style>What a great dataset this is</td>
          </tr>
          <tr class="gt_col_headings gt_spanner_row">
            <th class="gt_col_heading gt_columns_bottom_border gt_left" rowspan="2" colspan="1" scope="col" id="a::stub"></th>
            <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="2" colspan="1" scope="col" id="mpg">mpg</th>
            <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="2" colspan="1" scope="col" id="cyl">cyl</th>
            <th class="gt_center gt_columns_top_border gt_column_spanner_outer" rowspan="1" colspan="3" scope="colgroup" id="performance">
              <div class="gt_column_spanner">performance</div>
            </th>
            <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="2" colspan="1" scope="col" id="wt">wt</th>
            <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="2" colspan="1" scope="col" id="qsec">qsec</th>
            <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="2" colspan="1" scope="col" id="vs">vs</th>
            <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="2" colspan="1" scope="col" id="am">am</th>
            <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="2" colspan="1" scope="col" id="gear">gear</th>
            <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="2" colspan="1" scope="col" id="carb">carb</th>
          </tr>
          <tr class="gt_col_headings">
            <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id="disp">disp</th>
            <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id="hp">hp</th>
            <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id="drat">drat</th>
          </tr>
        </thead>
        <tbody class="gt_table_body">
          <tr><th id="stub_1_1" scope="row" class="gt_row gt_left gt_stub">Mazda RX4</th>
      <td headers="stub_1_1 mpg" class="gt_row gt_right">21.0</td>
      <td headers="stub_1_1 cyl" class="gt_row gt_right">6</td>
      <td headers="stub_1_1 disp" class="gt_row gt_right">160</td>
      <td headers="stub_1_1 hp" class="gt_row gt_right">110</td>
      <td headers="stub_1_1 drat" class="gt_row gt_right">3.90</td>
      <td headers="stub_1_1 wt" class="gt_row gt_right">2.620</td>
      <td headers="stub_1_1 qsec" class="gt_row gt_right">16.46</td>
      <td headers="stub_1_1 vs" class="gt_row gt_right">0</td>
      <td headers="stub_1_1 am" class="gt_row gt_right">1</td>
      <td headers="stub_1_1 gear" class="gt_row gt_right">4</td>
      <td headers="stub_1_1 carb" class="gt_row gt_right">4</td></tr>
          <tr><th id="stub_1_2" scope="row" class="gt_row gt_left gt_stub">Mazda RX4 Wag</th>
      <td headers="stub_1_2 mpg" class="gt_row gt_right">21.0</td>
      <td headers="stub_1_2 cyl" class="gt_row gt_right">6</td>
      <td headers="stub_1_2 disp" class="gt_row gt_right">160</td>
      <td headers="stub_1_2 hp" class="gt_row gt_right">110</td>
      <td headers="stub_1_2 drat" class="gt_row gt_right">3.90</td>
      <td headers="stub_1_2 wt" class="gt_row gt_right">2.875</td>
      <td headers="stub_1_2 qsec" class="gt_row gt_right">17.02</td>
      <td headers="stub_1_2 vs" class="gt_row gt_right">0</td>
      <td headers="stub_1_2 am" class="gt_row gt_right">1</td>
      <td headers="stub_1_2 gear" class="gt_row gt_right">4</td>
      <td headers="stub_1_2 carb" class="gt_row gt_right">4</td></tr>
          <tr><th id="stub_1_3" scope="row" class="gt_row gt_left gt_stub">Datsun 710</th>
      <td headers="stub_1_3 mpg" class="gt_row gt_right">22.8</td>
      <td headers="stub_1_3 cyl" class="gt_row gt_right">4</td>
      <td headers="stub_1_3 disp" class="gt_row gt_right">108</td>
      <td headers="stub_1_3 hp" class="gt_row gt_right">93</td>
      <td headers="stub_1_3 drat" class="gt_row gt_right">3.85</td>
      <td headers="stub_1_3 wt" class="gt_row gt_right">2.320</td>
      <td headers="stub_1_3 qsec" class="gt_row gt_right">18.61</td>
      <td headers="stub_1_3 vs" class="gt_row gt_right">1</td>
      <td headers="stub_1_3 am" class="gt_row gt_right">1</td>
      <td headers="stub_1_3 gear" class="gt_row gt_right">4</td>
      <td headers="stub_1_3 carb" class="gt_row gt_right">1</td></tr>
          <tr><th id="stub_1_4" scope="row" class="gt_row gt_left gt_stub">Hornet 4 Drive</th>
      <td headers="stub_1_4 mpg" class="gt_row gt_right">21.4</td>
      <td headers="stub_1_4 cyl" class="gt_row gt_right">6</td>
      <td headers="stub_1_4 disp" class="gt_row gt_right">258</td>
      <td headers="stub_1_4 hp" class="gt_row gt_right">110</td>
      <td headers="stub_1_4 drat" class="gt_row gt_right">3.08</td>
      <td headers="stub_1_4 wt" class="gt_row gt_right">3.215</td>
      <td headers="stub_1_4 qsec" class="gt_row gt_right">19.44</td>
      <td headers="stub_1_4 vs" class="gt_row gt_right">1</td>
      <td headers="stub_1_4 am" class="gt_row gt_right">0</td>
      <td headers="stub_1_4 gear" class="gt_row gt_right">3</td>
      <td headers="stub_1_4 carb" class="gt_row gt_right">1</td></tr>
          <tr><th id="stub_1_5" scope="row" class="gt_row gt_left gt_stub">Hornet Sportabout</th>
      <td headers="stub_1_5 mpg" class="gt_row gt_right">18.7</td>
      <td headers="stub_1_5 cyl" class="gt_row gt_right">8</td>
      <td headers="stub_1_5 disp" class="gt_row gt_right">360</td>
      <td headers="stub_1_5 hp" class="gt_row gt_right">175</td>
      <td headers="stub_1_5 drat" class="gt_row gt_right">3.15</td>
      <td headers="stub_1_5 wt" class="gt_row gt_right">3.440</td>
      <td headers="stub_1_5 qsec" class="gt_row gt_right">17.02</td>
      <td headers="stub_1_5 vs" class="gt_row gt_right">0</td>
      <td headers="stub_1_5 am" class="gt_row gt_right">0</td>
      <td headers="stub_1_5 gear" class="gt_row gt_right">3</td>
      <td headers="stub_1_5 carb" class="gt_row gt_right">2</td></tr>
        </tbody>
        <tfoot>
          <tr class="gt_footnotes">
            <td class="gt_footnote" colspan="12"><span class="gt_footnote_marks" style="white-space:nowrap;font-style:italic;font-weight:normal;line-height:0;"><sup>1</sup></span> A table footnote</td>
          </tr>
          <tr class="gt_sourcenotes">
            <td class="gt_sourcenote" colspan="12">Dataset is generally available in R</td>
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
            <td colspan="12" class="gt_heading gt_title gt_font_normal" style>The mtcars Dataset<span class="gt_footnote_marks" style="white-space:nowrap;font-style:italic;font-weight:normal;line-height:0;"><sup>1</sup></span></td>
          </tr>
          <tr class="gt_heading">
            <td colspan="12" class="gt_heading gt_subtitle gt_font_normal gt_bottom_border" style>What a great dataset this is</td>
          </tr>
          <tr class="gt_col_headings gt_spanner_row">
            <th class="gt_col_heading gt_columns_bottom_border gt_left" rowspan="2" colspan="1" scope="col" id="a::stub"></th>
            <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="2" colspan="1" scope="col" id="mpg">mpg</th>
            <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="2" colspan="1" scope="col" id="cyl">cyl</th>
            <th class="gt_center gt_columns_top_border gt_column_spanner_outer" rowspan="1" colspan="3" scope="colgroup" id="performance">
              <div class="gt_column_spanner">performance</div>
            </th>
            <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="2" colspan="1" scope="col" id="wt">wt</th>
            <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="2" colspan="1" scope="col" id="qsec">qsec</th>
            <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="2" colspan="1" scope="col" id="vs">vs</th>
            <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="2" colspan="1" scope="col" id="am">am</th>
            <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="2" colspan="1" scope="col" id="gear">gear</th>
            <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="2" colspan="1" scope="col" id="carb">carb</th>
          </tr>
          <tr class="gt_col_headings">
            <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id="disp">disp</th>
            <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id="hp">hp</th>
            <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id="drat">drat</th>
          </tr>
        </thead>
        <tbody class="gt_table_body">
          <tr><th id="stub_1_1" scope="row" class="gt_row gt_left gt_stub">Mazda RX4</th>
      <td headers="stub_1_1 mpg" class="gt_row gt_right">21.0</td>
      <td headers="stub_1_1 cyl" class="gt_row gt_right">6</td>
      <td headers="stub_1_1 disp" class="gt_row gt_right">160</td>
      <td headers="stub_1_1 hp" class="gt_row gt_right">110</td>
      <td headers="stub_1_1 drat" class="gt_row gt_right">3.90</td>
      <td headers="stub_1_1 wt" class="gt_row gt_right">2.620</td>
      <td headers="stub_1_1 qsec" class="gt_row gt_right">16.46</td>
      <td headers="stub_1_1 vs" class="gt_row gt_right">0</td>
      <td headers="stub_1_1 am" class="gt_row gt_right">1</td>
      <td headers="stub_1_1 gear" class="gt_row gt_right">4</td>
      <td headers="stub_1_1 carb" class="gt_row gt_right">4</td></tr>
          <tr><th id="stub_1_2" scope="row" class="gt_row gt_left gt_stub">Mazda RX4 Wag</th>
      <td headers="stub_1_2 mpg" class="gt_row gt_right">21.0</td>
      <td headers="stub_1_2 cyl" class="gt_row gt_right">6</td>
      <td headers="stub_1_2 disp" class="gt_row gt_right">160</td>
      <td headers="stub_1_2 hp" class="gt_row gt_right">110</td>
      <td headers="stub_1_2 drat" class="gt_row gt_right">3.90</td>
      <td headers="stub_1_2 wt" class="gt_row gt_right">2.875</td>
      <td headers="stub_1_2 qsec" class="gt_row gt_right">17.02</td>
      <td headers="stub_1_2 vs" class="gt_row gt_right">0</td>
      <td headers="stub_1_2 am" class="gt_row gt_right">1</td>
      <td headers="stub_1_2 gear" class="gt_row gt_right">4</td>
      <td headers="stub_1_2 carb" class="gt_row gt_right">4</td></tr>
          <tr><th id="stub_1_3" scope="row" class="gt_row gt_left gt_stub">Datsun 710</th>
      <td headers="stub_1_3 mpg" class="gt_row gt_right">22.8</td>
      <td headers="stub_1_3 cyl" class="gt_row gt_right">4</td>
      <td headers="stub_1_3 disp" class="gt_row gt_right">108</td>
      <td headers="stub_1_3 hp" class="gt_row gt_right">93</td>
      <td headers="stub_1_3 drat" class="gt_row gt_right">3.85</td>
      <td headers="stub_1_3 wt" class="gt_row gt_right">2.320</td>
      <td headers="stub_1_3 qsec" class="gt_row gt_right">18.61</td>
      <td headers="stub_1_3 vs" class="gt_row gt_right">1</td>
      <td headers="stub_1_3 am" class="gt_row gt_right">1</td>
      <td headers="stub_1_3 gear" class="gt_row gt_right">4</td>
      <td headers="stub_1_3 carb" class="gt_row gt_right">1</td></tr>
          <tr><th id="stub_1_4" scope="row" class="gt_row gt_left gt_stub">Hornet 4 Drive</th>
      <td headers="stub_1_4 mpg" class="gt_row gt_right">21.4</td>
      <td headers="stub_1_4 cyl" class="gt_row gt_right">6</td>
      <td headers="stub_1_4 disp" class="gt_row gt_right">258</td>
      <td headers="stub_1_4 hp" class="gt_row gt_right">110</td>
      <td headers="stub_1_4 drat" class="gt_row gt_right">3.08</td>
      <td headers="stub_1_4 wt" class="gt_row gt_right">3.215</td>
      <td headers="stub_1_4 qsec" class="gt_row gt_right">19.44</td>
      <td headers="stub_1_4 vs" class="gt_row gt_right">1</td>
      <td headers="stub_1_4 am" class="gt_row gt_right">0</td>
      <td headers="stub_1_4 gear" class="gt_row gt_right">3</td>
      <td headers="stub_1_4 carb" class="gt_row gt_right">1</td></tr>
          <tr><th id="stub_1_5" scope="row" class="gt_row gt_left gt_stub">Hornet Sportabout</th>
      <td headers="stub_1_5 mpg" class="gt_row gt_right">18.7</td>
      <td headers="stub_1_5 cyl" class="gt_row gt_right">8</td>
      <td headers="stub_1_5 disp" class="gt_row gt_right">360</td>
      <td headers="stub_1_5 hp" class="gt_row gt_right">175</td>
      <td headers="stub_1_5 drat" class="gt_row gt_right">3.15</td>
      <td headers="stub_1_5 wt" class="gt_row gt_right">3.440</td>
      <td headers="stub_1_5 qsec" class="gt_row gt_right">17.02</td>
      <td headers="stub_1_5 vs" class="gt_row gt_right">0</td>
      <td headers="stub_1_5 am" class="gt_row gt_right">0</td>
      <td headers="stub_1_5 gear" class="gt_row gt_right">3</td>
      <td headers="stub_1_5 carb" class="gt_row gt_right">2</td></tr>
        </tbody>
        <tfoot>
          <tr class="gt_footnotes">
            <td class="gt_footnote" colspan="12"><span class="gt_footnote_marks" style="white-space:nowrap;font-style:italic;font-weight:normal;line-height:0;"><sup>1</sup></span> A table footnote</td>
          </tr>
          <tr class="gt_sourcenotes">
            <td class="gt_sourcenote" colspan="12">Dataset is generally available in R</td>
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
            <td colspan="12" class="gt_heading gt_title gt_font_normal" style>The mtcars Dataset<span class="gt_footnote_marks" style="white-space:nowrap;font-style:italic;font-weight:normal;line-height:0;"><sup>1</sup></span></td>
          </tr>
          <tr class="gt_heading">
            <td colspan="12" class="gt_heading gt_subtitle gt_font_normal gt_bottom_border" style>What a great dataset this is</td>
          </tr>
          <tr class="gt_col_headings gt_spanner_row">
            <th class="gt_col_heading gt_columns_bottom_border gt_left" rowspan="2" colspan="1" scope="col" id="a::stub"></th>
            <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="2" colspan="1" scope="col" id="mpg">mpg</th>
            <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="2" colspan="1" scope="col" id="cyl">cyl</th>
            <th class="gt_center gt_columns_top_border gt_column_spanner_outer" rowspan="1" colspan="3" scope="colgroup" id="performance">
              <div class="gt_column_spanner">performance</div>
            </th>
            <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="2" colspan="1" scope="col" id="wt">wt</th>
            <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="2" colspan="1" scope="col" id="qsec">qsec</th>
            <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="2" colspan="1" scope="col" id="vs">vs</th>
            <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="2" colspan="1" scope="col" id="am">am</th>
            <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="2" colspan="1" scope="col" id="gear">gear</th>
            <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="2" colspan="1" scope="col" id="carb">carb</th>
          </tr>
          <tr class="gt_col_headings">
            <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id="disp">disp</th>
            <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id="hp">hp</th>
            <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id="drat">drat</th>
          </tr>
        </thead>
        <tbody class="gt_table_body">
          <tr><th id="stub_1_1" scope="row" class="gt_row gt_left gt_stub">Mazda RX4</th>
      <td headers="stub_1_1 mpg" class="gt_row gt_right">21.0</td>
      <td headers="stub_1_1 cyl" class="gt_row gt_right">6</td>
      <td headers="stub_1_1 disp" class="gt_row gt_right">160</td>
      <td headers="stub_1_1 hp" class="gt_row gt_right">110</td>
      <td headers="stub_1_1 drat" class="gt_row gt_right">3.90</td>
      <td headers="stub_1_1 wt" class="gt_row gt_right">2.620</td>
      <td headers="stub_1_1 qsec" class="gt_row gt_right">16.46</td>
      <td headers="stub_1_1 vs" class="gt_row gt_right">0</td>
      <td headers="stub_1_1 am" class="gt_row gt_right">1</td>
      <td headers="stub_1_1 gear" class="gt_row gt_right">4</td>
      <td headers="stub_1_1 carb" class="gt_row gt_right">4</td></tr>
          <tr><th id="stub_1_2" scope="row" class="gt_row gt_left gt_stub">Mazda RX4 Wag</th>
      <td headers="stub_1_2 mpg" class="gt_row gt_right">21.0</td>
      <td headers="stub_1_2 cyl" class="gt_row gt_right">6</td>
      <td headers="stub_1_2 disp" class="gt_row gt_right">160</td>
      <td headers="stub_1_2 hp" class="gt_row gt_right">110</td>
      <td headers="stub_1_2 drat" class="gt_row gt_right">3.90</td>
      <td headers="stub_1_2 wt" class="gt_row gt_right">2.875</td>
      <td headers="stub_1_2 qsec" class="gt_row gt_right">17.02</td>
      <td headers="stub_1_2 vs" class="gt_row gt_right">0</td>
      <td headers="stub_1_2 am" class="gt_row gt_right">1</td>
      <td headers="stub_1_2 gear" class="gt_row gt_right">4</td>
      <td headers="stub_1_2 carb" class="gt_row gt_right">4</td></tr>
          <tr><th id="stub_1_3" scope="row" class="gt_row gt_left gt_stub">Datsun 710</th>
      <td headers="stub_1_3 mpg" class="gt_row gt_right">22.8</td>
      <td headers="stub_1_3 cyl" class="gt_row gt_right">4</td>
      <td headers="stub_1_3 disp" class="gt_row gt_right">108</td>
      <td headers="stub_1_3 hp" class="gt_row gt_right">93</td>
      <td headers="stub_1_3 drat" class="gt_row gt_right">3.85</td>
      <td headers="stub_1_3 wt" class="gt_row gt_right">2.320</td>
      <td headers="stub_1_3 qsec" class="gt_row gt_right">18.61</td>
      <td headers="stub_1_3 vs" class="gt_row gt_right">1</td>
      <td headers="stub_1_3 am" class="gt_row gt_right">1</td>
      <td headers="stub_1_3 gear" class="gt_row gt_right">4</td>
      <td headers="stub_1_3 carb" class="gt_row gt_right">1</td></tr>
          <tr><th id="stub_1_4" scope="row" class="gt_row gt_left gt_stub">Hornet 4 Drive</th>
      <td headers="stub_1_4 mpg" class="gt_row gt_right">21.4</td>
      <td headers="stub_1_4 cyl" class="gt_row gt_right">6</td>
      <td headers="stub_1_4 disp" class="gt_row gt_right">258</td>
      <td headers="stub_1_4 hp" class="gt_row gt_right">110</td>
      <td headers="stub_1_4 drat" class="gt_row gt_right">3.08</td>
      <td headers="stub_1_4 wt" class="gt_row gt_right">3.215</td>
      <td headers="stub_1_4 qsec" class="gt_row gt_right">19.44</td>
      <td headers="stub_1_4 vs" class="gt_row gt_right">1</td>
      <td headers="stub_1_4 am" class="gt_row gt_right">0</td>
      <td headers="stub_1_4 gear" class="gt_row gt_right">3</td>
      <td headers="stub_1_4 carb" class="gt_row gt_right">1</td></tr>
          <tr><th id="stub_1_5" scope="row" class="gt_row gt_left gt_stub">Hornet Sportabout</th>
      <td headers="stub_1_5 mpg" class="gt_row gt_right">18.7</td>
      <td headers="stub_1_5 cyl" class="gt_row gt_right">8</td>
      <td headers="stub_1_5 disp" class="gt_row gt_right">360</td>
      <td headers="stub_1_5 hp" class="gt_row gt_right">175</td>
      <td headers="stub_1_5 drat" class="gt_row gt_right">3.15</td>
      <td headers="stub_1_5 wt" class="gt_row gt_right">3.440</td>
      <td headers="stub_1_5 qsec" class="gt_row gt_right">17.02</td>
      <td headers="stub_1_5 vs" class="gt_row gt_right">0</td>
      <td headers="stub_1_5 am" class="gt_row gt_right">0</td>
      <td headers="stub_1_5 gear" class="gt_row gt_right">3</td>
      <td headers="stub_1_5 carb" class="gt_row gt_right">2</td></tr>
        </tbody>
        <tfoot>
          <tr class="gt_footnotes">
            <td class="gt_footnote" colspan="12"><span class="gt_footnote_marks" style="white-space:nowrap;font-style:italic;font-weight:normal;line-height:0;"><sup>1</sup></span> A table footnote</td>
          </tr>
          <tr class="gt_sourcenotes">
            <td class="gt_sourcenote" colspan="12">Dataset is generally available in R</td>
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
            <td colspan="12" class="gt_heading gt_title gt_font_normal" style>The mtcars Dataset<span class="gt_footnote_marks" style="white-space:nowrap;font-style:italic;font-weight:normal;line-height:0;"><sup>1</sup></span></td>
          </tr>
          <tr class="gt_heading">
            <td colspan="12" class="gt_heading gt_subtitle gt_font_normal gt_bottom_border" style>What a great dataset this is</td>
          </tr>
          <tr class="gt_col_headings gt_spanner_row">
            <th class="gt_col_heading gt_columns_bottom_border gt_left" rowspan="2" colspan="1" scope="col" id="a::stub"></th>
            <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="2" colspan="1" scope="col" id="mpg">mpg</th>
            <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="2" colspan="1" scope="col" id="cyl">cyl</th>
            <th class="gt_center gt_columns_top_border gt_column_spanner_outer" rowspan="1" colspan="3" scope="colgroup" id="performance">
              <div class="gt_column_spanner">performance</div>
            </th>
            <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="2" colspan="1" scope="col" id="wt">wt</th>
            <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="2" colspan="1" scope="col" id="qsec">qsec</th>
            <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="2" colspan="1" scope="col" id="vs">vs</th>
            <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="2" colspan="1" scope="col" id="am">am</th>
            <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="2" colspan="1" scope="col" id="gear">gear</th>
            <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="2" colspan="1" scope="col" id="carb">carb</th>
          </tr>
          <tr class="gt_col_headings">
            <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id="disp">disp</th>
            <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id="hp">hp</th>
            <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id="drat">drat</th>
          </tr>
        </thead>
        <tbody class="gt_table_body">
          <tr><th id="stub_1_1" scope="row" class="gt_row gt_left gt_stub">Mazda RX4</th>
      <td headers="stub_1_1 mpg" class="gt_row gt_right">21.0</td>
      <td headers="stub_1_1 cyl" class="gt_row gt_right">6</td>
      <td headers="stub_1_1 disp" class="gt_row gt_right">160</td>
      <td headers="stub_1_1 hp" class="gt_row gt_right">110</td>
      <td headers="stub_1_1 drat" class="gt_row gt_right">3.90</td>
      <td headers="stub_1_1 wt" class="gt_row gt_right">2.620</td>
      <td headers="stub_1_1 qsec" class="gt_row gt_right">16.46</td>
      <td headers="stub_1_1 vs" class="gt_row gt_right">0</td>
      <td headers="stub_1_1 am" class="gt_row gt_right">1</td>
      <td headers="stub_1_1 gear" class="gt_row gt_right">4</td>
      <td headers="stub_1_1 carb" class="gt_row gt_right">4</td></tr>
          <tr><th id="stub_1_2" scope="row" class="gt_row gt_left gt_stub">Mazda RX4 Wag</th>
      <td headers="stub_1_2 mpg" class="gt_row gt_right">21.0</td>
      <td headers="stub_1_2 cyl" class="gt_row gt_right">6</td>
      <td headers="stub_1_2 disp" class="gt_row gt_right">160</td>
      <td headers="stub_1_2 hp" class="gt_row gt_right">110</td>
      <td headers="stub_1_2 drat" class="gt_row gt_right">3.90</td>
      <td headers="stub_1_2 wt" class="gt_row gt_right">2.875</td>
      <td headers="stub_1_2 qsec" class="gt_row gt_right">17.02</td>
      <td headers="stub_1_2 vs" class="gt_row gt_right">0</td>
      <td headers="stub_1_2 am" class="gt_row gt_right">1</td>
      <td headers="stub_1_2 gear" class="gt_row gt_right">4</td>
      <td headers="stub_1_2 carb" class="gt_row gt_right">4</td></tr>
          <tr><th id="stub_1_3" scope="row" class="gt_row gt_left gt_stub">Datsun 710</th>
      <td headers="stub_1_3 mpg" class="gt_row gt_right">22.8</td>
      <td headers="stub_1_3 cyl" class="gt_row gt_right">4</td>
      <td headers="stub_1_3 disp" class="gt_row gt_right">108</td>
      <td headers="stub_1_3 hp" class="gt_row gt_right">93</td>
      <td headers="stub_1_3 drat" class="gt_row gt_right">3.85</td>
      <td headers="stub_1_3 wt" class="gt_row gt_right">2.320</td>
      <td headers="stub_1_3 qsec" class="gt_row gt_right">18.61</td>
      <td headers="stub_1_3 vs" class="gt_row gt_right">1</td>
      <td headers="stub_1_3 am" class="gt_row gt_right">1</td>
      <td headers="stub_1_3 gear" class="gt_row gt_right">4</td>
      <td headers="stub_1_3 carb" class="gt_row gt_right">1</td></tr>
          <tr><th id="stub_1_4" scope="row" class="gt_row gt_left gt_stub">Hornet 4 Drive</th>
      <td headers="stub_1_4 mpg" class="gt_row gt_right">21.4</td>
      <td headers="stub_1_4 cyl" class="gt_row gt_right">6</td>
      <td headers="stub_1_4 disp" class="gt_row gt_right">258</td>
      <td headers="stub_1_4 hp" class="gt_row gt_right">110</td>
      <td headers="stub_1_4 drat" class="gt_row gt_right">3.08</td>
      <td headers="stub_1_4 wt" class="gt_row gt_right">3.215</td>
      <td headers="stub_1_4 qsec" class="gt_row gt_right">19.44</td>
      <td headers="stub_1_4 vs" class="gt_row gt_right">1</td>
      <td headers="stub_1_4 am" class="gt_row gt_right">0</td>
      <td headers="stub_1_4 gear" class="gt_row gt_right">3</td>
      <td headers="stub_1_4 carb" class="gt_row gt_right">1</td></tr>
          <tr><th id="stub_1_5" scope="row" class="gt_row gt_left gt_stub">Hornet Sportabout</th>
      <td headers="stub_1_5 mpg" class="gt_row gt_right">18.7</td>
      <td headers="stub_1_5 cyl" class="gt_row gt_right">8</td>
      <td headers="stub_1_5 disp" class="gt_row gt_right">360</td>
      <td headers="stub_1_5 hp" class="gt_row gt_right">175</td>
      <td headers="stub_1_5 drat" class="gt_row gt_right">3.15</td>
      <td headers="stub_1_5 wt" class="gt_row gt_right">3.440</td>
      <td headers="stub_1_5 qsec" class="gt_row gt_right">17.02</td>
      <td headers="stub_1_5 vs" class="gt_row gt_right">0</td>
      <td headers="stub_1_5 am" class="gt_row gt_right">0</td>
      <td headers="stub_1_5 gear" class="gt_row gt_right">3</td>
      <td headers="stub_1_5 carb" class="gt_row gt_right">2</td></tr>
        </tbody>
        <tfoot>
          <tr class="gt_footnotes">
            <td class="gt_footnote" colspan="12"><span class="gt_footnote_marks" style="white-space:nowrap;font-style:italic;font-weight:normal;line-height:0;"><sup>1</sup></span> A table footnote</td>
          </tr>
          <tr class="gt_sourcenotes">
            <td class="gt_sourcenote" colspan="12">Dataset is generally available in R</td>
          </tr>
        </tfoot>
      </table>

