# A gt table contains the expected heading components

    Code
      cat(render_as_html(gt_tbl))
    Output
      <table class="gt_table" data-quarto-disable-processing="false" data-quarto-bootstrap="false">
        <thead>
          <tr class="gt_heading">
            <td colspan="11" class="gt_heading gt_title gt_font_normal gt_bottom_border" style>test title</td>
          </tr>
          
          <tr class="gt_col_headings">
            <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id="mpg">mpg</th>
            <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id="cyl">cyl</th>
            <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id="disp">disp</th>
            <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id="hp">hp</th>
            <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id="drat">drat</th>
            <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id="wt">wt</th>
            <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id="qsec">qsec</th>
            <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id="vs">vs</th>
            <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id="am">am</th>
            <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id="gear">gear</th>
            <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id="carb">carb</th>
          </tr>
        </thead>
        <tbody class="gt_table_body">
          <tr><td headers="mpg" class="gt_row gt_right">21.0</td>
      <td headers="cyl" class="gt_row gt_right">6</td>
      <td headers="disp" class="gt_row gt_right">160</td>
      <td headers="hp" class="gt_row gt_right">110</td>
      <td headers="drat" class="gt_row gt_right">3.90</td>
      <td headers="wt" class="gt_row gt_right">2.620</td>
      <td headers="qsec" class="gt_row gt_right">16.46</td>
      <td headers="vs" class="gt_row gt_right">0</td>
      <td headers="am" class="gt_row gt_right">1</td>
      <td headers="gear" class="gt_row gt_right">4</td>
      <td headers="carb" class="gt_row gt_right">4</td></tr>
          <tr><td headers="mpg" class="gt_row gt_right">21.0</td>
      <td headers="cyl" class="gt_row gt_right">6</td>
      <td headers="disp" class="gt_row gt_right">160</td>
      <td headers="hp" class="gt_row gt_right">110</td>
      <td headers="drat" class="gt_row gt_right">3.90</td>
      <td headers="wt" class="gt_row gt_right">2.875</td>
      <td headers="qsec" class="gt_row gt_right">17.02</td>
      <td headers="vs" class="gt_row gt_right">0</td>
      <td headers="am" class="gt_row gt_right">1</td>
      <td headers="gear" class="gt_row gt_right">4</td>
      <td headers="carb" class="gt_row gt_right">4</td></tr>
          <tr><td headers="mpg" class="gt_row gt_right">22.8</td>
      <td headers="cyl" class="gt_row gt_right">4</td>
      <td headers="disp" class="gt_row gt_right">108</td>
      <td headers="hp" class="gt_row gt_right">93</td>
      <td headers="drat" class="gt_row gt_right">3.85</td>
      <td headers="wt" class="gt_row gt_right">2.320</td>
      <td headers="qsec" class="gt_row gt_right">18.61</td>
      <td headers="vs" class="gt_row gt_right">1</td>
      <td headers="am" class="gt_row gt_right">1</td>
      <td headers="gear" class="gt_row gt_right">4</td>
      <td headers="carb" class="gt_row gt_right">1</td></tr>
          <tr><td headers="mpg" class="gt_row gt_right">21.4</td>
      <td headers="cyl" class="gt_row gt_right">6</td>
      <td headers="disp" class="gt_row gt_right">258</td>
      <td headers="hp" class="gt_row gt_right">110</td>
      <td headers="drat" class="gt_row gt_right">3.08</td>
      <td headers="wt" class="gt_row gt_right">3.215</td>
      <td headers="qsec" class="gt_row gt_right">19.44</td>
      <td headers="vs" class="gt_row gt_right">1</td>
      <td headers="am" class="gt_row gt_right">0</td>
      <td headers="gear" class="gt_row gt_right">3</td>
      <td headers="carb" class="gt_row gt_right">1</td></tr>
          <tr><td headers="mpg" class="gt_row gt_right">18.7</td>
      <td headers="cyl" class="gt_row gt_right">8</td>
      <td headers="disp" class="gt_row gt_right">360</td>
      <td headers="hp" class="gt_row gt_right">175</td>
      <td headers="drat" class="gt_row gt_right">3.15</td>
      <td headers="wt" class="gt_row gt_right">3.440</td>
      <td headers="qsec" class="gt_row gt_right">17.02</td>
      <td headers="vs" class="gt_row gt_right">0</td>
      <td headers="am" class="gt_row gt_right">0</td>
      <td headers="gear" class="gt_row gt_right">3</td>
      <td headers="carb" class="gt_row gt_right">2</td></tr>
        </tbody>
        
      </table>

---

    Code
      cat(render_as_html(gt_tbl))
    Output
      <table class="gt_table" data-quarto-disable-processing="false" data-quarto-bootstrap="false">
        <thead>
          <tr class="gt_heading">
            <td colspan="11" class="gt_heading gt_title gt_font_normal" style>test title</td>
          </tr>
          <tr class="gt_heading">
            <td colspan="11" class="gt_heading gt_subtitle gt_font_normal gt_bottom_border" style>test subtitle</td>
          </tr>
          <tr class="gt_col_headings">
            <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id="mpg">mpg</th>
            <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id="cyl">cyl</th>
            <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id="disp">disp</th>
            <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id="hp">hp</th>
            <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id="drat">drat</th>
            <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id="wt">wt</th>
            <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id="qsec">qsec</th>
            <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id="vs">vs</th>
            <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id="am">am</th>
            <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id="gear">gear</th>
            <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id="carb">carb</th>
          </tr>
        </thead>
        <tbody class="gt_table_body">
          <tr><td headers="mpg" class="gt_row gt_right">21.0</td>
      <td headers="cyl" class="gt_row gt_right">6</td>
      <td headers="disp" class="gt_row gt_right">160</td>
      <td headers="hp" class="gt_row gt_right">110</td>
      <td headers="drat" class="gt_row gt_right">3.90</td>
      <td headers="wt" class="gt_row gt_right">2.620</td>
      <td headers="qsec" class="gt_row gt_right">16.46</td>
      <td headers="vs" class="gt_row gt_right">0</td>
      <td headers="am" class="gt_row gt_right">1</td>
      <td headers="gear" class="gt_row gt_right">4</td>
      <td headers="carb" class="gt_row gt_right">4</td></tr>
          <tr><td headers="mpg" class="gt_row gt_right">21.0</td>
      <td headers="cyl" class="gt_row gt_right">6</td>
      <td headers="disp" class="gt_row gt_right">160</td>
      <td headers="hp" class="gt_row gt_right">110</td>
      <td headers="drat" class="gt_row gt_right">3.90</td>
      <td headers="wt" class="gt_row gt_right">2.875</td>
      <td headers="qsec" class="gt_row gt_right">17.02</td>
      <td headers="vs" class="gt_row gt_right">0</td>
      <td headers="am" class="gt_row gt_right">1</td>
      <td headers="gear" class="gt_row gt_right">4</td>
      <td headers="carb" class="gt_row gt_right">4</td></tr>
          <tr><td headers="mpg" class="gt_row gt_right">22.8</td>
      <td headers="cyl" class="gt_row gt_right">4</td>
      <td headers="disp" class="gt_row gt_right">108</td>
      <td headers="hp" class="gt_row gt_right">93</td>
      <td headers="drat" class="gt_row gt_right">3.85</td>
      <td headers="wt" class="gt_row gt_right">2.320</td>
      <td headers="qsec" class="gt_row gt_right">18.61</td>
      <td headers="vs" class="gt_row gt_right">1</td>
      <td headers="am" class="gt_row gt_right">1</td>
      <td headers="gear" class="gt_row gt_right">4</td>
      <td headers="carb" class="gt_row gt_right">1</td></tr>
          <tr><td headers="mpg" class="gt_row gt_right">21.4</td>
      <td headers="cyl" class="gt_row gt_right">6</td>
      <td headers="disp" class="gt_row gt_right">258</td>
      <td headers="hp" class="gt_row gt_right">110</td>
      <td headers="drat" class="gt_row gt_right">3.08</td>
      <td headers="wt" class="gt_row gt_right">3.215</td>
      <td headers="qsec" class="gt_row gt_right">19.44</td>
      <td headers="vs" class="gt_row gt_right">1</td>
      <td headers="am" class="gt_row gt_right">0</td>
      <td headers="gear" class="gt_row gt_right">3</td>
      <td headers="carb" class="gt_row gt_right">1</td></tr>
          <tr><td headers="mpg" class="gt_row gt_right">18.7</td>
      <td headers="cyl" class="gt_row gt_right">8</td>
      <td headers="disp" class="gt_row gt_right">360</td>
      <td headers="hp" class="gt_row gt_right">175</td>
      <td headers="drat" class="gt_row gt_right">3.15</td>
      <td headers="wt" class="gt_row gt_right">3.440</td>
      <td headers="qsec" class="gt_row gt_right">17.02</td>
      <td headers="vs" class="gt_row gt_right">0</td>
      <td headers="am" class="gt_row gt_right">0</td>
      <td headers="gear" class="gt_row gt_right">3</td>
      <td headers="carb" class="gt_row gt_right">2</td></tr>
        </tbody>
        
      </table>

---

    Code
      cat(render_as_html(gt_tbl))
    Output
      <table class="gt_table" data-quarto-disable-processing="false" data-quarto-bootstrap="false">
        <thead>
          <tr class="gt_heading">
            <td colspan="11" class="gt_heading gt_title gt_font_normal gt_bottom_border" style>test title</td>
          </tr>
          
          <tr class="gt_col_headings">
            <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id="mpg">mpg</th>
            <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id="cyl">cyl</th>
            <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id="disp">disp</th>
            <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id="hp">hp</th>
            <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id="drat">drat</th>
            <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id="wt">wt</th>
            <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id="qsec">qsec</th>
            <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id="vs">vs</th>
            <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id="am">am</th>
            <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id="gear">gear</th>
            <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id="carb">carb</th>
          </tr>
        </thead>
        <tbody class="gt_table_body">
          <tr><td headers="mpg" class="gt_row gt_right">21.0</td>
      <td headers="cyl" class="gt_row gt_right">6</td>
      <td headers="disp" class="gt_row gt_right">160</td>
      <td headers="hp" class="gt_row gt_right">110</td>
      <td headers="drat" class="gt_row gt_right">3.90</td>
      <td headers="wt" class="gt_row gt_right">2.620</td>
      <td headers="qsec" class="gt_row gt_right">16.46</td>
      <td headers="vs" class="gt_row gt_right">0</td>
      <td headers="am" class="gt_row gt_right">1</td>
      <td headers="gear" class="gt_row gt_right">4</td>
      <td headers="carb" class="gt_row gt_right">4</td></tr>
          <tr><td headers="mpg" class="gt_row gt_right">21.0</td>
      <td headers="cyl" class="gt_row gt_right">6</td>
      <td headers="disp" class="gt_row gt_right">160</td>
      <td headers="hp" class="gt_row gt_right">110</td>
      <td headers="drat" class="gt_row gt_right">3.90</td>
      <td headers="wt" class="gt_row gt_right">2.875</td>
      <td headers="qsec" class="gt_row gt_right">17.02</td>
      <td headers="vs" class="gt_row gt_right">0</td>
      <td headers="am" class="gt_row gt_right">1</td>
      <td headers="gear" class="gt_row gt_right">4</td>
      <td headers="carb" class="gt_row gt_right">4</td></tr>
          <tr><td headers="mpg" class="gt_row gt_right">22.8</td>
      <td headers="cyl" class="gt_row gt_right">4</td>
      <td headers="disp" class="gt_row gt_right">108</td>
      <td headers="hp" class="gt_row gt_right">93</td>
      <td headers="drat" class="gt_row gt_right">3.85</td>
      <td headers="wt" class="gt_row gt_right">2.320</td>
      <td headers="qsec" class="gt_row gt_right">18.61</td>
      <td headers="vs" class="gt_row gt_right">1</td>
      <td headers="am" class="gt_row gt_right">1</td>
      <td headers="gear" class="gt_row gt_right">4</td>
      <td headers="carb" class="gt_row gt_right">1</td></tr>
          <tr><td headers="mpg" class="gt_row gt_right">21.4</td>
      <td headers="cyl" class="gt_row gt_right">6</td>
      <td headers="disp" class="gt_row gt_right">258</td>
      <td headers="hp" class="gt_row gt_right">110</td>
      <td headers="drat" class="gt_row gt_right">3.08</td>
      <td headers="wt" class="gt_row gt_right">3.215</td>
      <td headers="qsec" class="gt_row gt_right">19.44</td>
      <td headers="vs" class="gt_row gt_right">1</td>
      <td headers="am" class="gt_row gt_right">0</td>
      <td headers="gear" class="gt_row gt_right">3</td>
      <td headers="carb" class="gt_row gt_right">1</td></tr>
          <tr><td headers="mpg" class="gt_row gt_right">18.7</td>
      <td headers="cyl" class="gt_row gt_right">8</td>
      <td headers="disp" class="gt_row gt_right">360</td>
      <td headers="hp" class="gt_row gt_right">175</td>
      <td headers="drat" class="gt_row gt_right">3.15</td>
      <td headers="wt" class="gt_row gt_right">3.440</td>
      <td headers="qsec" class="gt_row gt_right">17.02</td>
      <td headers="vs" class="gt_row gt_right">0</td>
      <td headers="am" class="gt_row gt_right">0</td>
      <td headers="gear" class="gt_row gt_right">3</td>
      <td headers="carb" class="gt_row gt_right">2</td></tr>
        </tbody>
        
      </table>

---

    Code
      cat(render_as_html(gt_tbl))
    Output
      <table class="gt_table" data-quarto-disable-processing="false" data-quarto-bootstrap="false">
        <thead>
          <tr class="gt_heading">
            <td colspan="11" class="gt_heading gt_title gt_font_normal gt_bottom_border" style>test title</td>
          </tr>
          
          <tr class="gt_col_headings">
            <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id="mpg">mpg</th>
            <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id="cyl">cyl</th>
            <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id="disp">disp</th>
            <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id="hp">hp</th>
            <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id="drat">drat</th>
            <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id="wt">wt</th>
            <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id="qsec">qsec</th>
            <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id="vs">vs</th>
            <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id="am">am</th>
            <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id="gear">gear</th>
            <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id="carb">carb</th>
          </tr>
        </thead>
        <tbody class="gt_table_body">
          <tr><td headers="mpg" class="gt_row gt_right">21.0</td>
      <td headers="cyl" class="gt_row gt_right">6</td>
      <td headers="disp" class="gt_row gt_right">160</td>
      <td headers="hp" class="gt_row gt_right">110</td>
      <td headers="drat" class="gt_row gt_right">3.90</td>
      <td headers="wt" class="gt_row gt_right">2.620</td>
      <td headers="qsec" class="gt_row gt_right">16.46</td>
      <td headers="vs" class="gt_row gt_right">0</td>
      <td headers="am" class="gt_row gt_right">1</td>
      <td headers="gear" class="gt_row gt_right">4</td>
      <td headers="carb" class="gt_row gt_right">4</td></tr>
          <tr><td headers="mpg" class="gt_row gt_right">21.0</td>
      <td headers="cyl" class="gt_row gt_right">6</td>
      <td headers="disp" class="gt_row gt_right">160</td>
      <td headers="hp" class="gt_row gt_right">110</td>
      <td headers="drat" class="gt_row gt_right">3.90</td>
      <td headers="wt" class="gt_row gt_right">2.875</td>
      <td headers="qsec" class="gt_row gt_right">17.02</td>
      <td headers="vs" class="gt_row gt_right">0</td>
      <td headers="am" class="gt_row gt_right">1</td>
      <td headers="gear" class="gt_row gt_right">4</td>
      <td headers="carb" class="gt_row gt_right">4</td></tr>
          <tr><td headers="mpg" class="gt_row gt_right">22.8</td>
      <td headers="cyl" class="gt_row gt_right">4</td>
      <td headers="disp" class="gt_row gt_right">108</td>
      <td headers="hp" class="gt_row gt_right">93</td>
      <td headers="drat" class="gt_row gt_right">3.85</td>
      <td headers="wt" class="gt_row gt_right">2.320</td>
      <td headers="qsec" class="gt_row gt_right">18.61</td>
      <td headers="vs" class="gt_row gt_right">1</td>
      <td headers="am" class="gt_row gt_right">1</td>
      <td headers="gear" class="gt_row gt_right">4</td>
      <td headers="carb" class="gt_row gt_right">1</td></tr>
          <tr><td headers="mpg" class="gt_row gt_right">21.4</td>
      <td headers="cyl" class="gt_row gt_right">6</td>
      <td headers="disp" class="gt_row gt_right">258</td>
      <td headers="hp" class="gt_row gt_right">110</td>
      <td headers="drat" class="gt_row gt_right">3.08</td>
      <td headers="wt" class="gt_row gt_right">3.215</td>
      <td headers="qsec" class="gt_row gt_right">19.44</td>
      <td headers="vs" class="gt_row gt_right">1</td>
      <td headers="am" class="gt_row gt_right">0</td>
      <td headers="gear" class="gt_row gt_right">3</td>
      <td headers="carb" class="gt_row gt_right">1</td></tr>
          <tr><td headers="mpg" class="gt_row gt_right">18.7</td>
      <td headers="cyl" class="gt_row gt_right">8</td>
      <td headers="disp" class="gt_row gt_right">360</td>
      <td headers="hp" class="gt_row gt_right">175</td>
      <td headers="drat" class="gt_row gt_right">3.15</td>
      <td headers="wt" class="gt_row gt_right">3.440</td>
      <td headers="qsec" class="gt_row gt_right">17.02</td>
      <td headers="vs" class="gt_row gt_right">0</td>
      <td headers="am" class="gt_row gt_right">0</td>
      <td headers="gear" class="gt_row gt_right">3</td>
      <td headers="carb" class="gt_row gt_right">2</td></tr>
        </tbody>
        
      </table>

# tab_row_group() warns for deprecated args, but respects output.

    Code
      gt_tbl <- tab_row_group(gt(exibble, rowname_col = "row"), label = "group_prioritized",
      group = "group", rows = 1:3)
    Condition
      Warning:
      Since gt v0.3.0 the `group` argument has been deprecated.
      * Use the `label` argument to specify the group label.
      This warning is displayed once every 8 hours.

---

    Code
      gt_tbl <- (tab_row_group(tab_row_group(gt(exibble, rowname_col = "row"), label = "one",
      rows = 1:3), others_label = "foo"))
    Condition
      Warning:
      Since gt v0.3.0 the `others_label` argument has been deprecated.
      * Use `tab_options(row_group.default_label = <label>)` to set this label.
      This warning is displayed once every 8 hours.

# tab_row_group() errors when named rows are supplied (#1535)

    Code
      tab_row_group(gt_tbl, "Mazda", c("Mazda RX4", "Mazda RX4 Wag"))
    Condition
      Error in `tab_row_group()`:
      ! Can't find named rows in the table
      i In gt() (`?gt::gt()`), use `rownames_to_stub = TRUE` or specify `rowname_col` to initialize row names in the table.

