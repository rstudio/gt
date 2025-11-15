# Decimal alignment works in the basic case

    Code
      cat(render_as_html(gt_tbl))
    Output
      <table class="gt_table" data-quarto-disable-processing="false" data-quarto-bootstrap="false">
        <thead>
          <tr class="gt_col_headings">
            <th class="gt_col_heading gt_columns_bottom_border gt_left" rowspan="1" colspan="1" scope="col" id="char">char</th>
            <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id="num">num</th>
          </tr>
        </thead>
        <tbody class="gt_table_body">
          <tr><td headers="char" class="gt_row gt_left">A</td>
      <td headers="num" class="gt_row gt_right">    1.2  </td></tr>
          <tr><td headers="char" class="gt_row gt_left">B</td>
      <td headers="num" class="gt_row gt_right">  −33.52 </td></tr>
          <tr><td headers="char" class="gt_row gt_left">C</td>
      <td headers="num" class="gt_row gt_right">9,023.2  </td></tr>
          <tr><td headers="char" class="gt_row gt_left">D</td>
      <td headers="num" class="gt_row gt_right"> −283.527</td></tr>
          <tr><td headers="char" class="gt_row gt_left">E</td>
      <td headers="num" class="gt_row gt_right">NA</td></tr>
          <tr><td headers="char" class="gt_row gt_left">F</td>
      <td headers="num" class="gt_row gt_right">    0.401</td></tr>
          <tr><td headers="char" class="gt_row gt_left">G</td>
      <td headers="num" class="gt_row gt_right"> −123.1  </td></tr>
          <tr><td headers="char" class="gt_row gt_left">H</td>
      <td headers="num" class="gt_row gt_right">NA</td></tr>
          <tr><td headers="char" class="gt_row gt_left">I</td>
      <td headers="num" class="gt_row gt_right">   41    </td></tr>
        </tbody>
        
      </table>

---

    Code
      cat(render_as_html(gt_tbl))
    Output
      <table class="gt_table" data-quarto-disable-processing="false" data-quarto-bootstrap="false">
        <thead>
          <tr class="gt_col_headings">
            <th class="gt_col_heading gt_columns_bottom_border gt_left" rowspan="1" colspan="1" scope="col" id="char">char</th>
            <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id="num">num</th>
          </tr>
        </thead>
        <tbody class="gt_table_body">
          <tr><td headers="char" class="gt_row gt_left">A</td>
      <td headers="num" class="gt_row gt_right">    1.2  </td></tr>
          <tr><td headers="char" class="gt_row gt_left">B</td>
      <td headers="num" class="gt_row gt_right">  −33.52 </td></tr>
          <tr><td headers="char" class="gt_row gt_left">C</td>
      <td headers="num" class="gt_row gt_right">9,023.2  </td></tr>
          <tr><td headers="char" class="gt_row gt_left">D</td>
      <td headers="num" class="gt_row gt_right"> −283.527</td></tr>
          <tr><td headers="char" class="gt_row gt_left">E</td>
      <td headers="num" class="gt_row gt_right">NA</td></tr>
          <tr><td headers="char" class="gt_row gt_left">F</td>
      <td headers="num" class="gt_row gt_right">    0.401</td></tr>
          <tr><td headers="char" class="gt_row gt_left">G</td>
      <td headers="num" class="gt_row gt_right"> −123.1  </td></tr>
          <tr><td headers="char" class="gt_row gt_left">H</td>
      <td headers="num" class="gt_row gt_right">NA</td></tr>
          <tr><td headers="char" class="gt_row gt_left">I</td>
      <td headers="num" class="gt_row gt_right">   41.   </td></tr>
        </tbody>
        
      </table>

---

    Code
      cat(render_as_html(gt_tbl))
    Output
      <table class="gt_table" data-quarto-disable-processing="false" data-quarto-bootstrap="false">
        <thead>
          <tr class="gt_col_headings">
            <th class="gt_col_heading gt_columns_bottom_border gt_left" rowspan="1" colspan="1" scope="col" id="char">char</th>
            <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id="num">num</th>
          </tr>
        </thead>
        <tbody class="gt_table_body">
          <tr><td headers="char" class="gt_row gt_left">A</td>
      <td headers="num" class="gt_row gt_right">    1.2%  </td></tr>
          <tr><td headers="char" class="gt_row gt_left">B</td>
      <td headers="num" class="gt_row gt_right">  −33.52% </td></tr>
          <tr><td headers="char" class="gt_row gt_left">C</td>
      <td headers="num" class="gt_row gt_right">9,023.2%  </td></tr>
          <tr><td headers="char" class="gt_row gt_left">D</td>
      <td headers="num" class="gt_row gt_right"> −283.527%</td></tr>
          <tr><td headers="char" class="gt_row gt_left">E</td>
      <td headers="num" class="gt_row gt_right">NA</td></tr>
          <tr><td headers="char" class="gt_row gt_left">F</td>
      <td headers="num" class="gt_row gt_right">    0.401%</td></tr>
          <tr><td headers="char" class="gt_row gt_left">G</td>
      <td headers="num" class="gt_row gt_right"> −123.1%  </td></tr>
          <tr><td headers="char" class="gt_row gt_left">H</td>
      <td headers="num" class="gt_row gt_right">NA</td></tr>
          <tr><td headers="char" class="gt_row gt_left">I</td>
      <td headers="num" class="gt_row gt_right">  41 %   </td></tr>
        </tbody>
        
      </table>

---

    Code
      cat(render_as_html(gt_tbl))
    Output
      <table class="gt_table" data-quarto-disable-processing="false" data-quarto-bootstrap="false">
        <thead>
          <tr class="gt_col_headings">
            <th class="gt_col_heading gt_columns_bottom_border gt_left" rowspan="1" colspan="1" scope="col" id="char">char</th>
            <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id="num">num</th>
          </tr>
        </thead>
        <tbody class="gt_table_body">
          <tr><td headers="char" class="gt_row gt_left">A</td>
      <td headers="num" class="gt_row gt_right">    1.2%  </td></tr>
          <tr><td headers="char" class="gt_row gt_left">B</td>
      <td headers="num" class="gt_row gt_right">  −33.52% </td></tr>
          <tr><td headers="char" class="gt_row gt_left">C</td>
      <td headers="num" class="gt_row gt_right">9,023.2%  </td></tr>
          <tr><td headers="char" class="gt_row gt_left">D</td>
      <td headers="num" class="gt_row gt_right"> −283.527%</td></tr>
          <tr><td headers="char" class="gt_row gt_left">E</td>
      <td headers="num" class="gt_row gt_right">NA</td></tr>
          <tr><td headers="char" class="gt_row gt_left">F</td>
      <td headers="num" class="gt_row gt_right">    0.401%</td></tr>
          <tr><td headers="char" class="gt_row gt_left">G</td>
      <td headers="num" class="gt_row gt_right"> −123.1%  </td></tr>
          <tr><td headers="char" class="gt_row gt_left">H</td>
      <td headers="num" class="gt_row gt_right">NA</td></tr>
          <tr><td headers="char" class="gt_row gt_left">I</td>
      <td headers="num" class="gt_row gt_right">   41.%   </td></tr>
        </tbody>
        
      </table>

---

    Code
      cat(render_as_html(gt_tbl))
    Output
      <table class="gt_table" data-quarto-disable-processing="false" data-quarto-bootstrap="false">
        <thead>
          <tr class="gt_col_headings">
            <th class="gt_col_heading gt_columns_bottom_border gt_left" rowspan="1" colspan="1" scope="col" id="char">char</th>
            <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id="num">num</th>
          </tr>
        </thead>
        <tbody class="gt_table_body">
          <tr><td headers="char" class="gt_row gt_left">A</td>
      <td headers="num" class="gt_row gt_right">    1.2‰  </td></tr>
          <tr><td headers="char" class="gt_row gt_left">B</td>
      <td headers="num" class="gt_row gt_right">  −33.52‰ </td></tr>
          <tr><td headers="char" class="gt_row gt_left">C</td>
      <td headers="num" class="gt_row gt_right">9,023.2‰  </td></tr>
          <tr><td headers="char" class="gt_row gt_left">D</td>
      <td headers="num" class="gt_row gt_right"> −283.527‰</td></tr>
          <tr><td headers="char" class="gt_row gt_left">E</td>
      <td headers="num" class="gt_row gt_right">NA</td></tr>
          <tr><td headers="char" class="gt_row gt_left">F</td>
      <td headers="num" class="gt_row gt_right">    0.401‰</td></tr>
          <tr><td headers="char" class="gt_row gt_left">G</td>
      <td headers="num" class="gt_row gt_right"> −123.1‰  </td></tr>
          <tr><td headers="char" class="gt_row gt_left">H</td>
      <td headers="num" class="gt_row gt_right">NA</td></tr>
          <tr><td headers="char" class="gt_row gt_left">I</td>
      <td headers="num" class="gt_row gt_right">  41 ‰   </td></tr>
        </tbody>
        
      </table>

---

    Code
      cat(render_as_html(gt_tbl))
    Output
      <table class="gt_table" data-quarto-disable-processing="false" data-quarto-bootstrap="false">
        <thead>
          <tr class="gt_col_headings">
            <th class="gt_col_heading gt_columns_bottom_border gt_left" rowspan="1" colspan="1" scope="col" id="char">char</th>
            <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id="num">num</th>
          </tr>
        </thead>
        <tbody class="gt_table_body">
          <tr><td headers="char" class="gt_row gt_left">A</td>
      <td headers="num" class="gt_row gt_right">    1.2‰  </td></tr>
          <tr><td headers="char" class="gt_row gt_left">B</td>
      <td headers="num" class="gt_row gt_right">  −33.52‰ </td></tr>
          <tr><td headers="char" class="gt_row gt_left">C</td>
      <td headers="num" class="gt_row gt_right">9,023.2‰  </td></tr>
          <tr><td headers="char" class="gt_row gt_left">D</td>
      <td headers="num" class="gt_row gt_right"> −283.527‰</td></tr>
          <tr><td headers="char" class="gt_row gt_left">E</td>
      <td headers="num" class="gt_row gt_right">NA</td></tr>
          <tr><td headers="char" class="gt_row gt_left">F</td>
      <td headers="num" class="gt_row gt_right">    0.401‰</td></tr>
          <tr><td headers="char" class="gt_row gt_left">G</td>
      <td headers="num" class="gt_row gt_right"> −123.1‰  </td></tr>
          <tr><td headers="char" class="gt_row gt_left">H</td>
      <td headers="num" class="gt_row gt_right">NA</td></tr>
          <tr><td headers="char" class="gt_row gt_left">I</td>
      <td headers="num" class="gt_row gt_right">   41.‰   </td></tr>
        </tbody>
        
      </table>

---

    Code
      cat(render_as_html(gt_tbl))
    Output
      <table class="gt_table" data-quarto-disable-processing="false" data-quarto-bootstrap="false">
        <thead>
          <tr class="gt_col_headings">
            <th class="gt_col_heading gt_columns_bottom_border gt_left" rowspan="1" colspan="1" scope="col" id="char">char</th>
            <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id="num">num</th>
          </tr>
        </thead>
        <tbody class="gt_table_body">
          <tr><td headers="char" class="gt_row gt_left">A</td>
      <td headers="num" class="gt_row gt_right">     1.2 ppm  </td></tr>
          <tr><td headers="char" class="gt_row gt_left">B</td>
      <td headers="num" class="gt_row gt_right">   −33.52 ppm </td></tr>
          <tr><td headers="char" class="gt_row gt_left">C</td>
      <td headers="num" class="gt_row gt_right"> 9,023.2 ppm  </td></tr>
          <tr><td headers="char" class="gt_row gt_left">D</td>
      <td headers="num" class="gt_row gt_right">  −283.527 ppm</td></tr>
          <tr><td headers="char" class="gt_row gt_left">E</td>
      <td headers="num" class="gt_row gt_right">NA</td></tr>
          <tr><td headers="char" class="gt_row gt_left">F</td>
      <td headers="num" class="gt_row gt_right">     0.401 ppm</td></tr>
          <tr><td headers="char" class="gt_row gt_left">G</td>
      <td headers="num" class="gt_row gt_right">  −123.1 ppm  </td></tr>
          <tr><td headers="char" class="gt_row gt_left">H</td>
      <td headers="num" class="gt_row gt_right">NA</td></tr>
          <tr><td headers="char" class="gt_row gt_left">I</td>
      <td headers="num" class="gt_row gt_right">41  ppm   </td></tr>
        </tbody>
        
      </table>

---

    Code
      cat(render_as_html(gt_tbl))
    Output
      <table class="gt_table" data-quarto-disable-processing="false" data-quarto-bootstrap="false">
        <thead>
          <tr class="gt_col_headings">
            <th class="gt_col_heading gt_columns_bottom_border gt_left" rowspan="1" colspan="1" scope="col" id="char">char</th>
            <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id="num">num</th>
          </tr>
        </thead>
        <tbody class="gt_table_body">
          <tr><td headers="char" class="gt_row gt_left">A</td>
      <td headers="num" class="gt_row gt_right">    1.2 ppm  </td></tr>
          <tr><td headers="char" class="gt_row gt_left">B</td>
      <td headers="num" class="gt_row gt_right">  −33.52 ppm </td></tr>
          <tr><td headers="char" class="gt_row gt_left">C</td>
      <td headers="num" class="gt_row gt_right">9,023.2 ppm  </td></tr>
          <tr><td headers="char" class="gt_row gt_left">D</td>
      <td headers="num" class="gt_row gt_right"> −283.527 ppm</td></tr>
          <tr><td headers="char" class="gt_row gt_left">E</td>
      <td headers="num" class="gt_row gt_right">NA</td></tr>
          <tr><td headers="char" class="gt_row gt_left">F</td>
      <td headers="num" class="gt_row gt_right">    0.401 ppm</td></tr>
          <tr><td headers="char" class="gt_row gt_left">G</td>
      <td headers="num" class="gt_row gt_right"> −123.1 ppm  </td></tr>
          <tr><td headers="char" class="gt_row gt_left">H</td>
      <td headers="num" class="gt_row gt_right">NA</td></tr>
          <tr><td headers="char" class="gt_row gt_left">I</td>
      <td headers="num" class="gt_row gt_right">   41. ppm   </td></tr>
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
      <td headers="currency" class="gt_row gt_right">   49.950</td>
      <td headers="row" class="gt_row gt_left">row_1</td>
      <td headers="group" class="gt_row gt_left">grp_a</td></tr>
          <tr><td headers="num" class="gt_row gt_right">2.222e+00</td>
      <td headers="char" class="gt_row gt_left">banana</td>
      <td headers="fctr" class="gt_row gt_center">two</td>
      <td headers="date" class="gt_row gt_right">2015-02-15</td>
      <td headers="time" class="gt_row gt_right">14:40</td>
      <td headers="datetime" class="gt_row gt_right">2018-02-02 14:33</td>
      <td headers="currency" class="gt_row gt_right">   17.950</td>
      <td headers="row" class="gt_row gt_left">row_2</td>
      <td headers="group" class="gt_row gt_left">grp_a</td></tr>
          <tr><td headers="num" class="gt_row gt_right">3.333e+01</td>
      <td headers="char" class="gt_row gt_left">coconut</td>
      <td headers="fctr" class="gt_row gt_center">three</td>
      <td headers="date" class="gt_row gt_right">2015-03-15</td>
      <td headers="time" class="gt_row gt_right">15:45</td>
      <td headers="datetime" class="gt_row gt_right">2018-03-03 03:44</td>
      <td headers="currency" class="gt_row gt_right">    1.390</td>
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
      <td headers="currency" class="gt_row gt_right"> 1325.810</td>
      <td headers="row" class="gt_row gt_left">row_5</td>
      <td headers="group" class="gt_row gt_left">grp_b</td></tr>
          <tr><td headers="num" class="gt_row gt_right">NA</td>
      <td headers="char" class="gt_row gt_left">fig</td>
      <td headers="fctr" class="gt_row gt_center">six</td>
      <td headers="date" class="gt_row gt_right">2015-06-15</td>
      <td headers="time" class="gt_row gt_right">NA</td>
      <td headers="datetime" class="gt_row gt_right">2018-06-06 16:11</td>
      <td headers="currency" class="gt_row gt_right">   13.255</td>
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
      <td headers="currency" class="gt_row gt_right">    0.440</td>
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
            <th class="gt_col_heading gt_columns_bottom_border gt_left" rowspan="1" colspan="1" scope="col" id="char">char</th>
            <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id="num">num</th>
          </tr>
        </thead>
        <tbody class="gt_table_body">
          <tr><td headers="char" class="gt_row gt_left">A</td>
      <td headers="num" class="gt_row gt_right">    abc1.2%def  </td></tr>
          <tr><td headers="char" class="gt_row gt_left">B</td>
      <td headers="num" class="gt_row gt_right">  abc−33.52%def </td></tr>
          <tr><td headers="char" class="gt_row gt_left">C</td>
      <td headers="num" class="gt_row gt_right">abc9,023.2%def  </td></tr>
          <tr><td headers="char" class="gt_row gt_left">D</td>
      <td headers="num" class="gt_row gt_right"> abc−283.527%def</td></tr>
          <tr><td headers="char" class="gt_row gt_left">E</td>
      <td headers="num" class="gt_row gt_right">NA</td></tr>
          <tr><td headers="char" class="gt_row gt_left">F</td>
      <td headers="num" class="gt_row gt_right">    abc0.401%def</td></tr>
          <tr><td headers="char" class="gt_row gt_left">G</td>
      <td headers="num" class="gt_row gt_right"> abc−123.1%def  </td></tr>
          <tr><td headers="char" class="gt_row gt_left">H</td>
      <td headers="num" class="gt_row gt_right">NA</td></tr>
          <tr><td headers="char" class="gt_row gt_left">I</td>
      <td headers="num" class="gt_row gt_right">   abc41.%def   </td></tr>
        </tbody>
        
      </table>

---

    Code
      cat(render_as_html(gt_tbl))
    Output
      <table class="gt_table" data-quarto-disable-processing="false" data-quarto-bootstrap="false">
        <thead>
          <tr class="gt_col_headings">
            <th class="gt_col_heading gt_columns_bottom_border gt_left" rowspan="1" colspan="1" scope="col" id="char">char</th>
            <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id="num">num</th>
          </tr>
        </thead>
        <tbody class="gt_table_body">
          <tr><td headers="char" class="gt_row gt_left">A</td>
      <td headers="num" class="gt_row gt_right">    1.2   </td></tr>
          <tr><td headers="char" class="gt_row gt_left">B</td>
      <td headers="num" class="gt_row gt_right">  (33.52)  </td></tr>
          <tr><td headers="char" class="gt_row gt_left">C</td>
      <td headers="num" class="gt_row gt_right">9,023.2   </td></tr>
          <tr><td headers="char" class="gt_row gt_left">D</td>
      <td headers="num" class="gt_row gt_right"> (283.527) </td></tr>
          <tr><td headers="char" class="gt_row gt_left">E</td>
      <td headers="num" class="gt_row gt_right">NA</td></tr>
          <tr><td headers="char" class="gt_row gt_left">F</td>
      <td headers="num" class="gt_row gt_right">    0.401 </td></tr>
          <tr><td headers="char" class="gt_row gt_left">G</td>
      <td headers="num" class="gt_row gt_right"> (123.1)   </td></tr>
          <tr><td headers="char" class="gt_row gt_left">H</td>
      <td headers="num" class="gt_row gt_right">NA</td></tr>
          <tr><td headers="char" class="gt_row gt_left">I</td>
      <td headers="num" class="gt_row gt_right">   41.    </td></tr>
        </tbody>
        
      </table>

---

    Code
      cat(render_as_html(gt_tbl))
    Output
      <table class="gt_table" data-quarto-disable-processing="false" data-quarto-bootstrap="false">
        <thead>
          <tr class="gt_col_headings">
            <th class="gt_col_heading gt_columns_bottom_border gt_left" rowspan="1" colspan="1" scope="col" id="char">char</th>
            <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id="num">num</th>
          </tr>
        </thead>
        <tbody class="gt_table_body">
          <tr><td headers="char" class="gt_row gt_left">A</td>
      <td headers="num" class="gt_row gt_right">    $1 </td></tr>
          <tr><td headers="char" class="gt_row gt_left">B</td>
      <td headers="num" class="gt_row gt_right"> ($34)</td></tr>
          <tr><td headers="char" class="gt_row gt_left">C</td>
      <td headers="num" class="gt_row gt_right">$9,023 </td></tr>
          <tr><td headers="char" class="gt_row gt_left">D</td>
      <td headers="num" class="gt_row gt_right">($284)</td></tr>
          <tr><td headers="char" class="gt_row gt_left">E</td>
      <td headers="num" class="gt_row gt_right">NA</td></tr>
          <tr><td headers="char" class="gt_row gt_left">F</td>
      <td headers="num" class="gt_row gt_right">    $0 </td></tr>
          <tr><td headers="char" class="gt_row gt_left">G</td>
      <td headers="num" class="gt_row gt_right">($123)</td></tr>
          <tr><td headers="char" class="gt_row gt_left">H</td>
      <td headers="num" class="gt_row gt_right">NA</td></tr>
          <tr><td headers="char" class="gt_row gt_left">I</td>
      <td headers="num" class="gt_row gt_right">   $41 </td></tr>
        </tbody>
        
      </table>

