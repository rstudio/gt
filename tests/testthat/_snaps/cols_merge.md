# cols_merge() works correctly

    Code
      cat(render_as_html(gt_tbl))
    Output
      <table class="gt_table" data-quarto-disable-processing="false" data-quarto-bootstrap="false">
        <thead>
          <tr class="gt_col_headings">
            <th class="gt_col_heading gt_columns_bottom_border gt_left" rowspan="1" colspan="1" scope="col" id="a::stub"></th>
            <th class="gt_col_heading gt_columns_bottom_border gt_left" rowspan="1" colspan="1" scope="col" id="b">b</th>
          </tr>
        </thead>
        <tbody class="gt_table_body">
          <tr><th id="stub_1_1" scope="row" class="gt_row gt_left gt_stub">Part 1</th>
      <td headers="stub_1_1 b" class="gt_row gt_left">one</td></tr>
          <tr><th id="stub_1_2" scope="row" class="gt_row gt_left gt_stub">Part 2</th>
      <td headers="stub_1_2 b" class="gt_row gt_left">two</td></tr>
          <tr><th id="stub_1_3" scope="row" class="gt_row gt_left gt_stub">Part 3</th>
      <td headers="stub_1_3 b" class="gt_row gt_left">three</td></tr>
          <tr><th id="stub_1_4" scope="row" class="gt_row gt_left gt_stub">Part 4</th>
      <td headers="stub_1_4 b" class="gt_row gt_left">four</td></tr>
          <tr><th id="stub_1_5" scope="row" class="gt_row gt_left gt_stub">Part 5</th>
      <td headers="stub_1_5 b" class="gt_row gt_left">five</td></tr>
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
            <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id="a">a</th>
          </tr>
        </thead>
        <tbody class="gt_table_body">
          <tr><th id="stub_1_1" scope="row" class="gt_row gt_left gt_stub">Part one</th>
      <td headers="stub_1_1 a" class="gt_row gt_right">1</td></tr>
          <tr><th id="stub_1_2" scope="row" class="gt_row gt_left gt_stub">Part two</th>
      <td headers="stub_1_2 a" class="gt_row gt_right">2</td></tr>
          <tr><th id="stub_1_3" scope="row" class="gt_row gt_left gt_stub">Part three</th>
      <td headers="stub_1_3 a" class="gt_row gt_right">3</td></tr>
          <tr><th id="stub_1_4" scope="row" class="gt_row gt_left gt_stub">Part four</th>
      <td headers="stub_1_4 a" class="gt_row gt_right">4</td></tr>
          <tr><th id="stub_1_5" scope="row" class="gt_row gt_left gt_stub">Part five</th>
      <td headers="stub_1_5 a" class="gt_row gt_right">5</td></tr>
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
            <th class="gt_col_heading gt_columns_bottom_border gt_left" rowspan="1" colspan="1" scope="col" id="b">b</th>
          </tr>
        </thead>
        <tbody class="gt_table_body">
          <tr><th id="stub_1_1" scope="row" class="gt_row gt_left gt_stub">Part i</th>
      <td headers="stub_1_1 b" class="gt_row gt_left">one</td></tr>
          <tr><th id="stub_1_2" scope="row" class="gt_row gt_left gt_stub">Part ii</th>
      <td headers="stub_1_2 b" class="gt_row gt_left">two</td></tr>
          <tr><th id="stub_1_3" scope="row" class="gt_row gt_left gt_stub">Part iii</th>
      <td headers="stub_1_3 b" class="gt_row gt_left">three</td></tr>
          <tr><th id="stub_1_4" scope="row" class="gt_row gt_left gt_stub">Part iv</th>
      <td headers="stub_1_4 b" class="gt_row gt_left">four</td></tr>
          <tr><th id="stub_1_5" scope="row" class="gt_row gt_left gt_stub">Part v</th>
      <td headers="stub_1_5 b" class="gt_row gt_left">five</td></tr>
        </tbody>
        
      </table>

---

    Code
      cat(render_as_html(gt_tbl))
    Output
      <table class="gt_table" data-quarto-disable-processing="false" data-quarto-bootstrap="false">
        <thead>
          <tr class="gt_col_headings">
            <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id="mpg">mpg</th>
            <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id="cyl">cyl</th>
            <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id="disp">disp</th>
            <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id="hp">hp</th>
            <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id="drat">drat</th>
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
      <td headers="qsec" class="gt_row gt_right">16.46</td>
      <td headers="vs" class="gt_row gt_right">0</td>
      <td headers="am" class="gt_row gt_right">1</td>
      <td headers="gear" class="gt_row gt_right">4</td>
      <td headers="carb" class="gt_row gt_right">4</td></tr>
          <tr><td headers="mpg" class="gt_row gt_right">21.0</td>
      <td headers="cyl" class="gt_row gt_right">6</td>
      <td headers="disp" class="gt_row gt_right">160</td>
      <td headers="hp" class="gt_row gt_right">110</td>
      <td headers="drat" class="gt_row gt_right">3.90 (2.875)</td>
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
      <td headers="qsec" class="gt_row gt_right">18.61</td>
      <td headers="vs" class="gt_row gt_right">1</td>
      <td headers="am" class="gt_row gt_right">1</td>
      <td headers="gear" class="gt_row gt_right">4</td>
      <td headers="carb" class="gt_row gt_right">1</td></tr>
          <tr><td headers="mpg" class="gt_row gt_right">21.4</td>
      <td headers="cyl" class="gt_row gt_right">6</td>
      <td headers="disp" class="gt_row gt_right">258</td>
      <td headers="hp" class="gt_row gt_right">110</td>
      <td headers="drat" class="gt_row gt_right">3.08 (3.215)</td>
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
      <td headers="qsec" class="gt_row gt_right">17.02</td>
      <td headers="vs" class="gt_row gt_right">0</td>
      <td headers="am" class="gt_row gt_right">0</td>
      <td headers="gear" class="gt_row gt_right">3</td>
      <td headers="carb" class="gt_row gt_right">2</td></tr>
        </tbody>
        
      </table>

# cols_merge_uncert() works with row groups

    Code
      cat(render_as_html(gt_tbl))
    Output
      <table class="gt_table" data-quarto-disable-processing="false" data-quarto-bootstrap="false">
        <thead>
          <tr class="gt_col_headings">
            <th class="gt_col_heading gt_columns_bottom_border gt_left" rowspan="1" colspan="1" scope="col" id="a::stub"></th>
            <th class="gt_col_heading gt_columns_bottom_border gt_left" rowspan="1" colspan="1" scope="col" id="b">b</th>
          </tr>
        </thead>
        <tbody class="gt_table_body">
          <tr><th id="stub_1_1" scope="row" class="gt_row gt_right gt_stub">2.3 ± 0.06</th>
      <td headers="stub_1_1 b" class="gt_row gt_left">A</td></tr>
          <tr><th id="stub_1_2" scope="row" class="gt_row gt_right gt_stub">6.3 ± 0.07</th>
      <td headers="stub_1_2 b" class="gt_row gt_left">B</td></tr>
          <tr><th id="stub_1_3" scope="row" class="gt_row gt_right gt_stub">2.5 ± 0.08</th>
      <td headers="stub_1_3 b" class="gt_row gt_left">C</td></tr>
          <tr><th id="stub_1_4" scope="row" class="gt_row gt_right gt_stub">2.4 ± 0.09</th>
      <td headers="stub_1_4 b" class="gt_row gt_left">D</td></tr>
          <tr><th id="stub_1_5" scope="row" class="gt_row gt_right gt_stub">6.5 ± 0.10</th>
      <td headers="stub_1_5 b" class="gt_row gt_left">E</td></tr>
        </tbody>
        
      </table>

---

    Code
      cat(render_as_html(gt_tbl))
    Output
      <table class="gt_table" data-quarto-disable-processing="false" data-quarto-bootstrap="false">
        <thead>
          <tr class="gt_col_headings">
            <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id="row">row</th>
            <th class="gt_col_heading gt_columns_bottom_border gt_left" rowspan="1" colspan="1" scope="col" id="b">b</th>
          </tr>
        </thead>
        <tbody class="gt_table_body">
          <tr><td headers="row" class="gt_row gt_right">2.3</td>
      <td headers="b" class="gt_row gt_left">A</td></tr>
          <tr><td headers="row" class="gt_row gt_right">6.3 ± 0.07</td>
      <td headers="b" class="gt_row gt_left">B</td></tr>
          <tr><td headers="row" class="gt_row gt_right">2.5</td>
      <td headers="b" class="gt_row gt_left">C</td></tr>
          <tr><td headers="row" class="gt_row gt_right">2.4 ± 0.09</td>
      <td headers="b" class="gt_row gt_left">D</td></tr>
          <tr><td headers="row" class="gt_row gt_right">6.5</td>
      <td headers="b" class="gt_row gt_left">E</td></tr>
        </tbody>
        
      </table>

# cols_merge_uncert() works nicely with different error bounds

    Code
      cat(render_as_html(gt_tbl))
    Output
      <table class="gt_table" data-quarto-disable-processing="false" data-quarto-bootstrap="false">
        <thead>
          <tr class="gt_col_headings">
            <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id="value">value</th>
          </tr>
        </thead>
        <tbody class="gt_table_body">
          <tr><td headers="value" class="gt_row gt_right">34.5<span style="display:inline-block;line-height:1em;text-align:right;font-size:60%;vertical-align:-0.25em;margin-left:0.1em;">+1.8<br>−2.1</span></td></tr>
          <tr><td headers="value" class="gt_row gt_right">29.2</td></tr>
          <tr><td headers="value" class="gt_row gt_right">36.3</td></tr>
          <tr><td headers="value" class="gt_row gt_right">31.6<span style="display:inline-block;line-height:1em;text-align:right;font-size:60%;vertical-align:-0.25em;margin-left:0.1em;">+NA<br>−1.8</span></td></tr>
          <tr><td headers="value" class="gt_row gt_right">28.5</td></tr>
          <tr><td headers="value" class="gt_row gt_right">30.9</td></tr>
          <tr><td headers="value" class="gt_row gt_right">NA</td></tr>
          <tr><td headers="value" class="gt_row gt_right">NA</td></tr>
          <tr><td headers="value" class="gt_row gt_right">Inf</td></tr>
          <tr><td headers="value" class="gt_row gt_right">30.0 ± 0.0</td></tr>
          <tr><td headers="value" class="gt_row gt_right">32.0<span style="display:inline-block;line-height:1em;text-align:right;font-size:60%;vertical-align:-0.25em;margin-left:0.1em;">+0.0<br>−0.1</span></td></tr>
          <tr><td headers="value" class="gt_row gt_right">34.0</td></tr>
          <tr><td headers="value" class="gt_row gt_right">NaN</td></tr>
        </tbody>
        
      </table>

# cols_merge_range() produces the correct output

    Code
      cat(render_as_html(gt_tbl))
    Output
      <table class="gt_table" data-quarto-disable-processing="false" data-quarto-bootstrap="false">
        <thead>
          <tr class="gt_col_headings">
            <th class="gt_col_heading gt_columns_bottom_border gt_left" rowspan="1" colspan="1" scope="col" id="a::stub"></th>
            <th class="gt_col_heading gt_columns_bottom_border gt_left" rowspan="1" colspan="1" scope="col" id="b">b</th>
          </tr>
        </thead>
        <tbody class="gt_table_body">
          <tr><th id="stub_1_1" scope="row" class="gt_row gt_right gt_stub">1–6</th>
      <td headers="stub_1_1 b" class="gt_row gt_left">one</td></tr>
          <tr><th id="stub_1_2" scope="row" class="gt_row gt_right gt_stub">2–7</th>
      <td headers="stub_1_2 b" class="gt_row gt_left">two</td></tr>
          <tr><th id="stub_1_3" scope="row" class="gt_row gt_right gt_stub">3–8</th>
      <td headers="stub_1_3 b" class="gt_row gt_left">three</td></tr>
          <tr><th id="stub_1_4" scope="row" class="gt_row gt_right gt_stub">4–9</th>
      <td headers="stub_1_4 b" class="gt_row gt_left">four</td></tr>
          <tr><th id="stub_1_5" scope="row" class="gt_row gt_right gt_stub">5–10</th>
      <td headers="stub_1_5 b" class="gt_row gt_left">five</td></tr>
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
            <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id="a">a</th>
          </tr>
        </thead>
        <tbody class="gt_table_body">
          <tr><th id="stub_1_1" scope="row" class="gt_row gt_right gt_stub">1–one</th>
      <td headers="stub_1_1 a" class="gt_row gt_right">6</td></tr>
          <tr><th id="stub_1_2" scope="row" class="gt_row gt_right gt_stub">2–two</th>
      <td headers="stub_1_2 a" class="gt_row gt_right">7</td></tr>
          <tr><th id="stub_1_3" scope="row" class="gt_row gt_right gt_stub">3–three</th>
      <td headers="stub_1_3 a" class="gt_row gt_right">8</td></tr>
          <tr><th id="stub_1_4" scope="row" class="gt_row gt_right gt_stub">4–four</th>
      <td headers="stub_1_4 a" class="gt_row gt_right">9</td></tr>
          <tr><th id="stub_1_5" scope="row" class="gt_row gt_right gt_stub">5–five</th>
      <td headers="stub_1_5 a" class="gt_row gt_right">10</td></tr>
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
            <th class="gt_col_heading gt_columns_bottom_border gt_left" rowspan="1" colspan="1" scope="col" id="b">b</th>
          </tr>
        </thead>
        <tbody class="gt_table_body">
          <tr><th id="stub_1_1" scope="row" class="gt_row gt_right gt_stub">1–vi</th>
      <td headers="stub_1_1 b" class="gt_row gt_left">one</td></tr>
          <tr><th id="stub_1_2" scope="row" class="gt_row gt_right gt_stub">2–vii</th>
      <td headers="stub_1_2 b" class="gt_row gt_left">two</td></tr>
          <tr><th id="stub_1_3" scope="row" class="gt_row gt_right gt_stub">3–viii</th>
      <td headers="stub_1_3 b" class="gt_row gt_left">three</td></tr>
          <tr><th id="stub_1_4" scope="row" class="gt_row gt_right gt_stub">4–ix</th>
      <td headers="stub_1_4 b" class="gt_row gt_left">four</td></tr>
          <tr><th id="stub_1_5" scope="row" class="gt_row gt_right gt_stub">5–x</th>
      <td headers="stub_1_5 b" class="gt_row gt_left">five</td></tr>
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
            <th class="gt_col_heading gt_columns_bottom_border gt_left" rowspan="1" colspan="1" scope="col" id="b">b</th>
          </tr>
        </thead>
        <tbody class="gt_table_body">
          <tr><th id="stub_1_1" scope="row" class="gt_row gt_right gt_stub">i–6</th>
      <td headers="stub_1_1 b" class="gt_row gt_left">one</td></tr>
          <tr><th id="stub_1_2" scope="row" class="gt_row gt_right gt_stub">ii–7</th>
      <td headers="stub_1_2 b" class="gt_row gt_left">two</td></tr>
          <tr><th id="stub_1_3" scope="row" class="gt_row gt_right gt_stub">iii–8</th>
      <td headers="stub_1_3 b" class="gt_row gt_left">three</td></tr>
          <tr><th id="stub_1_4" scope="row" class="gt_row gt_right gt_stub">iv–9</th>
      <td headers="stub_1_4 b" class="gt_row gt_left">four</td></tr>
          <tr><th id="stub_1_5" scope="row" class="gt_row gt_right gt_stub">v–10</th>
      <td headers="stub_1_5 b" class="gt_row gt_left">five</td></tr>
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
            <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id="a">a</th>
          </tr>
        </thead>
        <tbody class="gt_table_body">
          <tr><th id="stub_1_1" scope="row" class="gt_row gt_right gt_stub">1</th>
      <td headers="stub_1_1 a" class="gt_row gt_right">6</td></tr>
          <tr><th id="stub_1_2" scope="row" class="gt_row gt_right gt_stub">2</th>
      <td headers="stub_1_2 a" class="gt_row gt_right">7–two</td></tr>
          <tr><th id="stub_1_3" scope="row" class="gt_row gt_right gt_stub">3</th>
      <td headers="stub_1_3 a" class="gt_row gt_right">8</td></tr>
          <tr><th id="stub_1_4" scope="row" class="gt_row gt_right gt_stub">4</th>
      <td headers="stub_1_4 a" class="gt_row gt_right">9–four</td></tr>
          <tr><th id="stub_1_5" scope="row" class="gt_row gt_right gt_stub">5</th>
      <td headers="stub_1_5 a" class="gt_row gt_right">10</td></tr>
        </tbody>
        
      </table>

# cols_merge_n_pct() works correctly

    Code
      cat(render_as_html(gt_tbl))
    Output
      <table class="gt_table" data-quarto-disable-processing="false" data-quarto-bootstrap="false">
        <thead>
          <tr class="gt_col_headings">
            <th class="gt_col_heading gt_columns_bottom_border gt_left" rowspan="1" colspan="1" scope="col" id="a::stub"></th>
            <th class="gt_col_heading gt_columns_bottom_border gt_left" rowspan="1" colspan="1" scope="col" id="b">b</th>
          </tr>
        </thead>
        <tbody class="gt_table_body">
          <tr><th id="stub_1_1" scope="row" class="gt_row gt_right gt_stub">1 (6.00%)</th>
      <td headers="stub_1_1 b" class="gt_row gt_left">A</td></tr>
          <tr><th id="stub_1_2" scope="row" class="gt_row gt_right gt_stub">2 (7.00%)</th>
      <td headers="stub_1_2 b" class="gt_row gt_left">B</td></tr>
          <tr><th id="stub_1_3" scope="row" class="gt_row gt_right gt_stub">3 (8.00%)</th>
      <td headers="stub_1_3 b" class="gt_row gt_left">C</td></tr>
          <tr><th id="stub_1_4" scope="row" class="gt_row gt_right gt_stub">4 (9.00%)</th>
      <td headers="stub_1_4 b" class="gt_row gt_left">D</td></tr>
          <tr><th id="stub_1_5" scope="row" class="gt_row gt_right gt_stub">5 (10.00%)</th>
      <td headers="stub_1_5 b" class="gt_row gt_left">E</td></tr>
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
          <tr><td headers="a" class="gt_row gt_right">1 (7.1%)</td></tr>
          <tr><td headers="a" class="gt_row gt_right">5</td></tr>
          <tr><td headers="a" class="gt_row gt_right">0</td></tr>
          <tr><td headers="a" class="gt_row gt_right">2 (14.3%)</td></tr>
          <tr><td headers="a" class="gt_row gt_right">NA</td></tr>
          <tr><td headers="a" class="gt_row gt_right">6</td></tr>
          <tr><td headers="a" class="gt_row gt_right">5</td></tr>
          <tr><td headers="a" class="gt_row gt_right">NA</td></tr>
          <tr><td headers="a" class="gt_row gt_right">0</td></tr>
          <tr><td headers="a" class="gt_row gt_right">NA</td></tr>
        </tbody>
        
      </table>

