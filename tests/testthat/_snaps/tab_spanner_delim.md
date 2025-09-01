# tab_spanner_delim() works on higher-order spanning

    Code
      cat(render_as_html(gt_tbl))
    Output
      <table class="gt_table" data-quarto-disable-processing="false" data-quarto-bootstrap="false">
        <thead>
          <tr class="gt_col_headings gt_spanner_row">
            <th class="gt_center gt_columns_top_border gt_column_spanner_outer" rowspan="1" colspan="2" scope="colgroup" id="spanner-span_1.A.X">
              <div class="gt_column_spanner">span_1</div>
            </th>
            <th class="gt_center gt_columns_top_border gt_column_spanner_outer" rowspan="1" colspan="2" scope="colgroup" id="spanner-span_2.A.Y">
              <div class="gt_column_spanner">span_2</div>
            </th>
          </tr>
          <tr class="gt_col_headings gt_spanner_row">
            <th class="gt_center gt_columns_top_border gt_column_spanner_outer" rowspan="1" colspan="1" scope="col" id="spanner-A.X">
              <div class="gt_column_spanner">A</div>
            </th>
            <th class="gt_center gt_columns_top_border gt_column_spanner_outer" rowspan="1" colspan="1" scope="col" id="spanner-B.X">
              <div class="gt_column_spanner">B</div>
            </th>
            <th class="gt_center gt_columns_top_border gt_column_spanner_outer" rowspan="1" colspan="1" scope="col" id="spanner-A.Y">
              <div class="gt_column_spanner">A</div>
            </th>
            <th class="gt_center gt_columns_top_border gt_column_spanner_outer" rowspan="1" colspan="1" scope="col" id="spanner-B.Y">
              <div class="gt_column_spanner">B</div>
            </th>
          </tr>
          <tr class="gt_col_headings">
            <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id="span_1.A.X">X</th>
            <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id="span_1.B.X">X</th>
            <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id="span_2.A.Y">Y</th>
            <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id="span_2.B.Y">Y</th>
          </tr>
        </thead>
        <tbody class="gt_table_body">
          <tr><td headers="span_1.A.X" class="gt_row gt_right">1</td>
      <td headers="span_1.B.X" class="gt_row gt_right">2</td>
      <td headers="span_2.A.Y" class="gt_row gt_right">3</td>
      <td headers="span_2.B.Y" class="gt_row gt_right">4</td></tr>
        </tbody>
        
      </table>

---

    Code
      cat(render_as_html(gt_tbl))
    Output
      <table class="gt_table" data-quarto-disable-processing="false" data-quarto-bootstrap="false">
        <thead>
          <tr class="gt_col_headings gt_spanner_row">
            <th class="gt_center gt_columns_top_border gt_column_spanner_outer" rowspan="1" colspan="2" scope="colgroup" id="spanner-span_1.A.X">
              <div class="gt_column_spanner">span_1</div>
            </th>
            <th class="gt_center gt_columns_top_border gt_column_spanner_outer" rowspan="1" colspan="2" scope="colgroup"></th>
          </tr>
          <tr class="gt_col_headings gt_spanner_row">
            <th class="gt_center gt_columns_top_border gt_column_spanner_outer" rowspan="1" colspan="1" scope="col" id="spanner-A.X">
              <div class="gt_column_spanner">A</div>
            </th>
            <th class="gt_center gt_columns_top_border gt_column_spanner_outer" rowspan="1" colspan="1" scope="col" id="spanner-B.X">
              <div class="gt_column_spanner">B</div>
            </th>
            <th class="gt_center gt_columns_top_border gt_column_spanner_outer" rowspan="1" colspan="1" scope="col" id="spanner-A.Y">
              <div class="gt_column_spanner">A</div>
            </th>
            <th class="gt_center gt_columns_top_border gt_column_spanner_outer" rowspan="1" colspan="1" scope="col" id="spanner-B.Y">
              <div class="gt_column_spanner">B</div>
            </th>
          </tr>
          <tr class="gt_col_headings">
            <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id="span_1.A.X">X</th>
            <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id="span_1.B.X">X</th>
            <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id="A.Y">Y</th>
            <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id="B.Y">Y</th>
          </tr>
        </thead>
        <tbody class="gt_table_body">
          <tr><td headers="span_1.A.X" class="gt_row gt_right">1</td>
      <td headers="span_1.B.X" class="gt_row gt_right">2</td>
      <td headers="A.Y" class="gt_row gt_right">3</td>
      <td headers="B.Y" class="gt_row gt_right">4</td></tr>
        </tbody>
        
      </table>

---

    Code
      cat(render_as_html(gt_tbl))
    Output
      <table class="gt_table" data-quarto-disable-processing="false" data-quarto-bootstrap="false">
        <thead>
          <tr class="gt_col_headings gt_spanner_row">
            <th class="gt_center gt_columns_top_border gt_column_spanner_outer" rowspan="1" colspan="1" scope="col"></th>
            <th class="gt_center gt_columns_top_border gt_column_spanner_outer" rowspan="1" colspan="1" scope="col" id="spanner-span_1.B.X">
              <div class="gt_column_spanner">span_1</div>
            </th>
            <th class="gt_center gt_columns_top_border gt_column_spanner_outer" rowspan="1" colspan="2" scope="colgroup"></th>
          </tr>
          <tr class="gt_col_headings gt_spanner_row">
            <th class="gt_center gt_columns_top_border gt_column_spanner_outer" rowspan="1" colspan="1" scope="col" id="spanner-span_1.A">
              <div class="gt_column_spanner">span_1</div>
            </th>
            <th class="gt_center gt_columns_top_border gt_column_spanner_outer" rowspan="1" colspan="1" scope="col" id="spanner-B.X">
              <div class="gt_column_spanner">B</div>
            </th>
            <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="2" colspan="1" scope="col" id="A">A</th>
            <th class="gt_center gt_columns_top_border gt_column_spanner_outer" rowspan="1" colspan="1" scope="col" id="spanner-B.Y">
              <div class="gt_column_spanner">B</div>
            </th>
          </tr>
          <tr class="gt_col_headings">
            <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id="span_1.A">A</th>
            <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id="span_1.B.X">X</th>
            <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id="B.Y">Y</th>
          </tr>
        </thead>
        <tbody class="gt_table_body">
          <tr><td headers="span_1.A" class="gt_row gt_right">1</td>
      <td headers="span_1.B.X" class="gt_row gt_right">2</td>
      <td headers="A" class="gt_row gt_right">3</td>
      <td headers="B.Y" class="gt_row gt_right">4</td></tr>
        </tbody>
        
      </table>

---

    Code
      cat(render_as_html(gt_tbl))
    Output
      <table class="gt_table" data-quarto-disable-processing="false" data-quarto-bootstrap="false">
        <thead>
          <tr class="gt_col_headings gt_spanner_row">
            <th class="gt_center gt_columns_top_border gt_column_spanner_outer" rowspan="1" colspan="4" scope="colgroup" id="spanner-all.A.W">
              <div class="gt_column_spanner">all</div>
            </th>
          </tr>
          <tr class="gt_col_headings gt_spanner_row">
            <th class="gt_center gt_columns_top_border gt_column_spanner_outer" rowspan="1" colspan="1" scope="col" id="spanner-A.W">
              <div class="gt_column_spanner">A</div>
            </th>
            <th class="gt_center gt_columns_top_border gt_column_spanner_outer" rowspan="1" colspan="1" scope="col" id="spanner-B.X">
              <div class="gt_column_spanner">B</div>
            </th>
            <th class="gt_center gt_columns_top_border gt_column_spanner_outer" rowspan="1" colspan="1" scope="col" id="spanner-A.Y">
              <div class="gt_column_spanner">A</div>
            </th>
            <th class="gt_center gt_columns_top_border gt_column_spanner_outer" rowspan="1" colspan="1" scope="col" id="spanner-B.Z">
              <div class="gt_column_spanner">B</div>
            </th>
          </tr>
          <tr class="gt_col_headings">
            <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id="all.A.W">W</th>
            <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id="all.B.X">X</th>
            <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id="all.A.Y">Y</th>
            <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id="all.B.Z">Z</th>
          </tr>
        </thead>
        <tbody class="gt_table_body">
          <tr><td headers="all.A.W" class="gt_row gt_right">1</td>
      <td headers="all.B.X" class="gt_row gt_right">2</td>
      <td headers="all.A.Y" class="gt_row gt_right">3</td>
      <td headers="all.B.Z" class="gt_row gt_right">4</td></tr>
        </tbody>
        
      </table>

---

    Code
      cat(render_as_html(gt_tbl))
    Output
      <table class="gt_table" data-quarto-disable-processing="false" data-quarto-bootstrap="false">
        <thead>
          <tr class="gt_col_headings gt_spanner_row">
            <th class="gt_center gt_columns_top_border gt_column_spanner_outer" rowspan="1" colspan="4" scope="colgroup" id="spanner-all.W.A">
              <div class="gt_column_spanner">all</div>
            </th>
          </tr>
          <tr class="gt_col_headings gt_spanner_row">
            <th class="gt_center gt_columns_top_border gt_column_spanner_outer" rowspan="1" colspan="1" scope="col" id="spanner-W.A">
              <div class="gt_column_spanner">W</div>
            </th>
            <th class="gt_center gt_columns_top_border gt_column_spanner_outer" rowspan="1" colspan="1" scope="col" id="spanner-X.B">
              <div class="gt_column_spanner">X</div>
            </th>
            <th class="gt_center gt_columns_top_border gt_column_spanner_outer" rowspan="1" colspan="1" scope="col" id="spanner-Y.A">
              <div class="gt_column_spanner">Y</div>
            </th>
            <th class="gt_center gt_columns_top_border gt_column_spanner_outer" rowspan="1" colspan="1" scope="col" id="spanner-Z.B">
              <div class="gt_column_spanner">Z</div>
            </th>
          </tr>
          <tr class="gt_col_headings">
            <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id="all.W.A">A</th>
            <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id="all.X.B">B</th>
            <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id="all.Y.A">A</th>
            <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id="all.Z.B">B</th>
          </tr>
        </thead>
        <tbody class="gt_table_body">
          <tr><td headers="all.W.A" class="gt_row gt_right">1</td>
      <td headers="all.X.B" class="gt_row gt_right">2</td>
      <td headers="all.Y.A" class="gt_row gt_right">3</td>
      <td headers="all.Z.B" class="gt_row gt_right">4</td></tr>
        </tbody>
        
      </table>

---

    Code
      cat(render_as_html(gt_tbl))
    Output
      <table class="gt_table" data-quarto-disable-processing="false" data-quarto-bootstrap="false">
        <thead>
          <tr class="gt_col_headings gt_spanner_row">
            <th class="gt_center gt_columns_top_border gt_column_spanner_outer" rowspan="1" colspan="2" scope="colgroup" id="spanner-all.W.A">
              <div class="gt_column_spanner">all</div>
            </th>
            <th class="gt_center gt_columns_top_border gt_column_spanner_outer" rowspan="1" colspan="2" scope="colgroup"></th>
          </tr>
          <tr class="gt_col_headings gt_spanner_row">
            <th class="gt_center gt_columns_top_border gt_column_spanner_outer" rowspan="1" colspan="1" scope="col" id="spanner-W.A">
              <div class="gt_column_spanner">W</div>
            </th>
            <th class="gt_center gt_columns_top_border gt_column_spanner_outer" rowspan="1" colspan="1" scope="col" id="spanner-X.B">
              <div class="gt_column_spanner">X</div>
            </th>
            <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="2" colspan="1" scope="col" id="all.Y.A">all.Y.A</th>
            <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="2" colspan="1" scope="col" id="all.Z.B">all.Z.B</th>
          </tr>
          <tr class="gt_col_headings">
            <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id="all.W.A">A</th>
            <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id="all.X.B">B</th>
          </tr>
        </thead>
        <tbody class="gt_table_body">
          <tr><td headers="all.W.A" class="gt_row gt_right">1</td>
      <td headers="all.X.B" class="gt_row gt_right">2</td>
      <td headers="all.Y.A" class="gt_row gt_right">3</td>
      <td headers="all.Z.B" class="gt_row gt_right">4</td></tr>
        </tbody>
        
      </table>

---

    Code
      cat(render_as_html(gt_tbl))
    Output
      <table class="gt_table" data-quarto-disable-processing="false" data-quarto-bootstrap="false">
        <thead>
          <tr class="gt_col_headings gt_spanner_row">
            <th class="gt_center gt_columns_top_border gt_column_spanner_outer" rowspan="1" colspan="1" scope="col" id="spanner-all.W.A">
              <div class="gt_column_spanner">all</div>
            </th>
            <th class="gt_center gt_columns_top_border gt_column_spanner_outer" rowspan="1" colspan="2" scope="colgroup"></th>
            <th class="gt_center gt_columns_top_border gt_column_spanner_outer" rowspan="1" colspan="1" scope="col" id="spanner-all.Z.B">
              <div class="gt_column_spanner">all</div>
            </th>
          </tr>
          <tr class="gt_col_headings gt_spanner_row">
            <th class="gt_center gt_columns_top_border gt_column_spanner_outer" rowspan="1" colspan="1" scope="col" id="spanner-W.A">
              <div class="gt_column_spanner">W</div>
            </th>
            <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="2" colspan="1" scope="col" id="all.X.B">all.X.B</th>
            <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="2" colspan="1" scope="col" id="all.Y.A">all.Y.A</th>
            <th class="gt_center gt_columns_top_border gt_column_spanner_outer" rowspan="1" colspan="1" scope="col" id="spanner-Z.B">
              <div class="gt_column_spanner">Z</div>
            </th>
          </tr>
          <tr class="gt_col_headings">
            <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id="all.W.A">A</th>
            <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id="all.Z.B">B</th>
          </tr>
        </thead>
        <tbody class="gt_table_body">
          <tr><td headers="all.W.A" class="gt_row gt_right">1</td>
      <td headers="all.X.B" class="gt_row gt_right">2</td>
      <td headers="all.Y.A" class="gt_row gt_right">3</td>
      <td headers="all.Z.B" class="gt_row gt_right">4</td></tr>
        </tbody>
        
      </table>

---

    Code
      cat(render_as_html(gt_tbl))
    Output
      <table class="gt_table" data-quarto-disable-processing="false" data-quarto-bootstrap="false">
        <thead>
          <tr class="gt_col_headings gt_spanner_row">
            <th class="gt_center gt_columns_top_border gt_column_spanner_outer" rowspan="1" colspan="4" scope="colgroup" id="spanner-all__1W__1A">
              <div class="gt_column_spanner">all</div>
            </th>
          </tr>
          <tr class="gt_col_headings gt_spanner_row">
            <th class="gt_center gt_columns_top_border gt_column_spanner_outer" rowspan="1" colspan="1" scope="col" id="spanner-W__1A">
              <div class="gt_column_spanner">W</div>
            </th>
            <th class="gt_center gt_columns_top_border gt_column_spanner_outer" rowspan="1" colspan="1" scope="col" id="spanner-X__1B">
              <div class="gt_column_spanner">X</div>
            </th>
            <th class="gt_center gt_columns_top_border gt_column_spanner_outer" rowspan="1" colspan="1" scope="col" id="spanner-Y__1A">
              <div class="gt_column_spanner">Y</div>
            </th>
            <th class="gt_center gt_columns_top_border gt_column_spanner_outer" rowspan="1" colspan="1" scope="col" id="spanner-Z__1B">
              <div class="gt_column_spanner">Z</div>
            </th>
          </tr>
          <tr class="gt_col_headings">
            <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id="all__1W__1A">A</th>
            <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id="all__1X__1B">B</th>
            <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id="all__1Y__1A">A</th>
            <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id="all__1Z__1B">B</th>
          </tr>
        </thead>
        <tbody class="gt_table_body">
          <tr><td headers="all__1W__1A" class="gt_row gt_right">1</td>
      <td headers="all__1X__1B" class="gt_row gt_right">2</td>
      <td headers="all__1Y__1A" class="gt_row gt_right">3</td>
      <td headers="all__1Z__1B" class="gt_row gt_right">4</td></tr>
        </tbody>
        
      </table>

---

    Code
      cat(render_as_html(gt_tbl))
    Output
      <table class="gt_table" data-quarto-disable-processing="false" data-quarto-bootstrap="false">
        <thead>
          <tr class="gt_col_headings gt_spanner_row">
            <th class="gt_center gt_columns_top_border gt_column_spanner_outer" rowspan="1" colspan="4" scope="colgroup" id="spanner-all__1W__1A">
              <div class="gt_column_spanner">all</div>
            </th>
          </tr>
          <tr class="gt_col_headings gt_spanner_row">
            <th class="gt_center gt_columns_top_border gt_column_spanner_outer" rowspan="1" colspan="1" scope="col" id="spanner-W__1A">
              <div class="gt_column_spanner">W</div>
            </th>
            <th class="gt_center gt_columns_top_border gt_column_spanner_outer" rowspan="1" colspan="1" scope="col" id="spanner-X__1B">
              <div class="gt_column_spanner">X</div>
            </th>
            <th class="gt_center gt_columns_top_border gt_column_spanner_outer" rowspan="1" colspan="1" scope="col" id="spanner-Y__1A">
              <div class="gt_column_spanner">Y</div>
            </th>
            <th class="gt_center gt_columns_top_border gt_column_spanner_outer" rowspan="1" colspan="1" scope="col" id="spanner-Z__1B">
              <div class="gt_column_spanner">Z</div>
            </th>
          </tr>
          <tr class="gt_col_headings">
            <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id="all__1W__1A">A</th>
            <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id="all__1X__1B">B</th>
            <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id="all__1Y__1A">A</th>
            <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id="all__1Z__1B">B</th>
          </tr>
        </thead>
        <tbody class="gt_table_body">
          <tr><td headers="all__1W__1A" class="gt_row gt_right">1</td>
      <td headers="all__1X__1B" class="gt_row gt_right">2</td>
      <td headers="all__1Y__1A" class="gt_row gt_right">3</td>
      <td headers="all__1Z__1B" class="gt_row gt_right">4</td></tr>
        </tbody>
        
      </table>

---

    Code
      cat(render_as_html(gt_tbl))
    Output
      <table class="gt_table" data-quarto-disable-processing="false" data-quarto-bootstrap="false">
        <thead>
          <tr class="gt_col_headings gt_spanner_row">
            <th class="gt_center gt_columns_top_border gt_column_spanner_outer" rowspan="1" colspan="4" scope="colgroup" id="spanner-all__1W__1A">
              <div class="gt_column_spanner">all</div>
            </th>
          </tr>
          <tr class="gt_col_headings">
            <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id="all__1W__1A">W__1A</th>
            <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id="all__1X__1B">X__1B</th>
            <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id="all__1Y__1A">Y__1A</th>
            <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id="all__1Z__1B">Z__1B</th>
          </tr>
        </thead>
        <tbody class="gt_table_body">
          <tr><td headers="all__1W__1A" class="gt_row gt_right">1</td>
      <td headers="all__1X__1B" class="gt_row gt_right">2</td>
      <td headers="all__1Y__1A" class="gt_row gt_right">3</td>
      <td headers="all__1Z__1B" class="gt_row gt_right">4</td></tr>
        </tbody>
        
      </table>

---

    Code
      cat(render_as_html(gt_tbl))
    Output
      <table class="gt_table" data-quarto-disable-processing="false" data-quarto-bootstrap="false">
        <thead>
          <tr class="gt_col_headings gt_spanner_row">
            <th class="gt_center gt_columns_top_border gt_column_spanner_outer" rowspan="1" colspan="4" scope="colgroup" id="spanner-all__1W__1A">
              <div class="gt_column_spanner">all</div>
            </th>
          </tr>
          <tr class="gt_col_headings gt_spanner_row">
            <th class="gt_center gt_columns_top_border gt_column_spanner_outer" rowspan="1" colspan="1" scope="col" id="spanner-W__1A">
              <div class="gt_column_spanner">W</div>
            </th>
            <th class="gt_center gt_columns_top_border gt_column_spanner_outer" rowspan="1" colspan="1" scope="col" id="spanner-X__1B">
              <div class="gt_column_spanner">X</div>
            </th>
            <th class="gt_center gt_columns_top_border gt_column_spanner_outer" rowspan="1" colspan="1" scope="col" id="spanner-Y__1A">
              <div class="gt_column_spanner">Y</div>
            </th>
            <th class="gt_center gt_columns_top_border gt_column_spanner_outer" rowspan="1" colspan="1" scope="col" id="spanner-Z__1B">
              <div class="gt_column_spanner">Z</div>
            </th>
          </tr>
          <tr class="gt_col_headings">
            <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id="all__1W__1A">A</th>
            <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id="all__1X__1B">B</th>
            <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id="all__1Y__1A">A</th>
            <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id="all__1Z__1B">B</th>
          </tr>
        </thead>
        <tbody class="gt_table_body">
          <tr><td headers="all__1W__1A" class="gt_row gt_right">1</td>
      <td headers="all__1X__1B" class="gt_row gt_right">2</td>
      <td headers="all__1Y__1A" class="gt_row gt_right">3</td>
      <td headers="all__1Z__1B" class="gt_row gt_right">4</td></tr>
        </tbody>
        
      </table>

---

    Code
      cat(render_as_html(gt_tbl))
    Output
      <table class="gt_table" data-quarto-disable-processing="false" data-quarto-bootstrap="false">
        <thead>
          <tr class="gt_col_headings gt_spanner_row">
            <th class="gt_center gt_columns_top_border gt_column_spanner_outer" rowspan="1" colspan="1" scope="col" id="spanner-all__1W__1A">
              <div class="gt_column_spanner">all__1W</div>
            </th>
            <th class="gt_center gt_columns_top_border gt_column_spanner_outer" rowspan="1" colspan="1" scope="col" id="spanner-all__1X__1B">
              <div class="gt_column_spanner">all__1X</div>
            </th>
            <th class="gt_center gt_columns_top_border gt_column_spanner_outer" rowspan="1" colspan="1" scope="col" id="spanner-all__1Y__1A">
              <div class="gt_column_spanner">all__1Y</div>
            </th>
            <th class="gt_center gt_columns_top_border gt_column_spanner_outer" rowspan="1" colspan="1" scope="col" id="spanner-all__1Z__1B">
              <div class="gt_column_spanner">all__1Z</div>
            </th>
          </tr>
          <tr class="gt_col_headings">
            <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id="all__1W__1A">A</th>
            <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id="all__1X__1B">B</th>
            <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id="all__1Y__1A">A</th>
            <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id="all__1Z__1B">B</th>
          </tr>
        </thead>
        <tbody class="gt_table_body">
          <tr><td headers="all__1W__1A" class="gt_row gt_right">1</td>
      <td headers="all__1X__1B" class="gt_row gt_right">2</td>
      <td headers="all__1Y__1A" class="gt_row gt_right">3</td>
      <td headers="all__1Z__1B" class="gt_row gt_right">4</td></tr>
        </tbody>
        
      </table>

---

    Code
      cat(render_as_html(gt_tbl))
    Output
      <table class="gt_table" data-quarto-disable-processing="false" data-quarto-bootstrap="false">
        <thead>
          <tr class="gt_col_headings gt_spanner_row">
            <th class="gt_center gt_columns_top_border gt_column_spanner_outer" rowspan="1" colspan="4" scope="colgroup" id="spanner-all__1W__1A">
              <div class="gt_column_spanner">all</div>
            </th>
          </tr>
          <tr class="gt_col_headings gt_spanner_row">
            <th class="gt_center gt_columns_top_border gt_column_spanner_outer" rowspan="1" colspan="1" scope="col" id="spanner-W__1A">
              <div class="gt_column_spanner">W</div>
            </th>
            <th class="gt_center gt_columns_top_border gt_column_spanner_outer" rowspan="1" colspan="1" scope="col" id="spanner-X__1B">
              <div class="gt_column_spanner">X</div>
            </th>
            <th class="gt_center gt_columns_top_border gt_column_spanner_outer" rowspan="1" colspan="1" scope="col" id="spanner-Y__1A">
              <div class="gt_column_spanner">Y</div>
            </th>
            <th class="gt_center gt_columns_top_border gt_column_spanner_outer" rowspan="1" colspan="1" scope="col" id="spanner-Z__1B">
              <div class="gt_column_spanner">Z</div>
            </th>
          </tr>
          <tr class="gt_col_headings">
            <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id="all__1W__1A">A</th>
            <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id="all__1X__1B">B</th>
            <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id="all__1Y__1A">A</th>
            <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id="all__1Z__1B">B</th>
          </tr>
        </thead>
        <tbody class="gt_table_body">
          <tr><td headers="all__1W__1A" class="gt_row gt_right">1</td>
      <td headers="all__1X__1B" class="gt_row gt_right">2</td>
      <td headers="all__1Y__1A" class="gt_row gt_right">3</td>
      <td headers="all__1Z__1B" class="gt_row gt_right">4</td></tr>
        </tbody>
        
      </table>

---

    Code
      cat(render_as_html(gt_tbl))
    Output
      <table class="gt_table" data-quarto-disable-processing="false" data-quarto-bootstrap="false">
        <thead>
          <tr class="gt_col_headings gt_spanner_row">
            <th class="gt_center gt_columns_top_border gt_column_spanner_outer" rowspan="1" colspan="1" scope="col" id="spanner-A__1W__1all">
              <div class="gt_column_spanner">A</div>
            </th>
            <th class="gt_center gt_columns_top_border gt_column_spanner_outer" rowspan="1" colspan="1" scope="col" id="spanner-B__1X__1all">
              <div class="gt_column_spanner">B</div>
            </th>
            <th class="gt_center gt_columns_top_border gt_column_spanner_outer" rowspan="1" colspan="1" scope="col" id="spanner-A__1Y__1all">
              <div class="gt_column_spanner">A</div>
            </th>
            <th class="gt_center gt_columns_top_border gt_column_spanner_outer" rowspan="1" colspan="1" scope="col" id="spanner-B__1Z__1all">
              <div class="gt_column_spanner">B</div>
            </th>
          </tr>
          <tr class="gt_col_headings gt_spanner_row">
            <th class="gt_center gt_columns_top_border gt_column_spanner_outer" rowspan="1" colspan="1" scope="col" id="spanner-W__1all">
              <div class="gt_column_spanner">W</div>
            </th>
            <th class="gt_center gt_columns_top_border gt_column_spanner_outer" rowspan="1" colspan="1" scope="col" id="spanner-X__1all">
              <div class="gt_column_spanner">X</div>
            </th>
            <th class="gt_center gt_columns_top_border gt_column_spanner_outer" rowspan="1" colspan="1" scope="col" id="spanner-Y__1all">
              <div class="gt_column_spanner">Y</div>
            </th>
            <th class="gt_center gt_columns_top_border gt_column_spanner_outer" rowspan="1" colspan="1" scope="col" id="spanner-Z__1all">
              <div class="gt_column_spanner">Z</div>
            </th>
          </tr>
          <tr class="gt_col_headings">
            <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id="all__1W__1A">all</th>
            <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id="all__1X__1B">all</th>
            <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id="all__1Y__1A">all</th>
            <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id="all__1Z__1B">all</th>
          </tr>
        </thead>
        <tbody class="gt_table_body">
          <tr><td headers="all__1W__1A" class="gt_row gt_right">1</td>
      <td headers="all__1X__1B" class="gt_row gt_right">2</td>
      <td headers="all__1Y__1A" class="gt_row gt_right">3</td>
      <td headers="all__1Z__1B" class="gt_row gt_right">4</td></tr>
        </tbody>
        
      </table>

---

    Code
      cat(render_as_html(gt_tbl))
    Output
      <table class="gt_table" data-quarto-disable-processing="false" data-quarto-bootstrap="false">
        <thead>
          <tr class="gt_col_headings gt_spanner_row">
            <th class="gt_center gt_columns_top_border gt_column_spanner_outer" rowspan="1" colspan="1" scope="col" id="spanner-A__1W__1all">
              <div class="gt_column_spanner">A</div>
            </th>
            <th class="gt_center gt_columns_top_border gt_column_spanner_outer" rowspan="1" colspan="1" scope="col" id="spanner-B__1X__1all">
              <div class="gt_column_spanner">B</div>
            </th>
            <th class="gt_center gt_columns_top_border gt_column_spanner_outer" rowspan="1" colspan="1" scope="col" id="spanner-A__1Y__1all">
              <div class="gt_column_spanner">A</div>
            </th>
            <th class="gt_center gt_columns_top_border gt_column_spanner_outer" rowspan="1" colspan="1" scope="col" id="spanner-B__1Z__1all">
              <div class="gt_column_spanner">B</div>
            </th>
          </tr>
          <tr class="gt_col_headings gt_spanner_row">
            <th class="gt_center gt_columns_top_border gt_column_spanner_outer" rowspan="1" colspan="1" scope="col" id="spanner-W__1all">
              <div class="gt_column_spanner">W</div>
            </th>
            <th class="gt_center gt_columns_top_border gt_column_spanner_outer" rowspan="1" colspan="1" scope="col" id="spanner-X__1all">
              <div class="gt_column_spanner">X</div>
            </th>
            <th class="gt_center gt_columns_top_border gt_column_spanner_outer" rowspan="1" colspan="1" scope="col" id="spanner-Y__1all">
              <div class="gt_column_spanner">Y</div>
            </th>
            <th class="gt_center gt_columns_top_border gt_column_spanner_outer" rowspan="1" colspan="1" scope="col" id="spanner-Z__1all">
              <div class="gt_column_spanner">Z</div>
            </th>
          </tr>
          <tr class="gt_col_headings">
            <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id="all__1W__1A">all</th>
            <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id="all__1X__1B">all</th>
            <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id="all__1Y__1A">all</th>
            <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id="all__1Z__1B">all</th>
          </tr>
        </thead>
        <tbody class="gt_table_body">
          <tr><td headers="all__1W__1A" class="gt_row gt_right">1</td>
      <td headers="all__1X__1B" class="gt_row gt_right">2</td>
      <td headers="all__1Y__1A" class="gt_row gt_right">3</td>
      <td headers="all__1Z__1B" class="gt_row gt_right">4</td></tr>
        </tbody>
        
      </table>

---

    Code
      cat(render_as_html(gt_tbl))
    Output
      <table class="gt_table" data-quarto-disable-processing="false" data-quarto-bootstrap="false">
        <thead>
          <tr class="gt_col_headings gt_spanner_row">
            <th class="gt_center gt_columns_top_border gt_column_spanner_outer" rowspan="1" colspan="1" scope="col" id="spanner-A__1all__1W">
              <div class="gt_column_spanner">A</div>
            </th>
            <th class="gt_center gt_columns_top_border gt_column_spanner_outer" rowspan="1" colspan="1" scope="col" id="spanner-B__1all__1X">
              <div class="gt_column_spanner">B</div>
            </th>
            <th class="gt_center gt_columns_top_border gt_column_spanner_outer" rowspan="1" colspan="1" scope="col" id="spanner-A__1all__1Y">
              <div class="gt_column_spanner">A</div>
            </th>
            <th class="gt_center gt_columns_top_border gt_column_spanner_outer" rowspan="1" colspan="1" scope="col" id="spanner-B__1all__1Z">
              <div class="gt_column_spanner">B</div>
            </th>
          </tr>
          <tr class="gt_col_headings">
            <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id="all__1W__1A">all__1W</th>
            <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id="all__1X__1B">all__1X</th>
            <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id="all__1Y__1A">all__1Y</th>
            <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id="all__1Z__1B">all__1Z</th>
          </tr>
        </thead>
        <tbody class="gt_table_body">
          <tr><td headers="all__1W__1A" class="gt_row gt_right">1</td>
      <td headers="all__1X__1B" class="gt_row gt_right">2</td>
      <td headers="all__1Y__1A" class="gt_row gt_right">3</td>
      <td headers="all__1Z__1B" class="gt_row gt_right">4</td></tr>
        </tbody>
        
      </table>

---

    Code
      cat(render_as_html(gt_tbl))
    Output
      <table class="gt_table" data-quarto-disable-processing="false" data-quarto-bootstrap="false">
        <thead>
          <tr class="gt_col_headings gt_spanner_row">
            <th class="gt_center gt_columns_top_border gt_column_spanner_outer" rowspan="1" colspan="1" scope="col" id="spanner-W__1A__1all">
              <div class="gt_column_spanner">W__1A</div>
            </th>
            <th class="gt_center gt_columns_top_border gt_column_spanner_outer" rowspan="1" colspan="1" scope="col" id="spanner-X__1B__1all">
              <div class="gt_column_spanner">X__1B</div>
            </th>
            <th class="gt_center gt_columns_top_border gt_column_spanner_outer" rowspan="1" colspan="1" scope="col" id="spanner-Y__1A__1all">
              <div class="gt_column_spanner">Y__1A</div>
            </th>
            <th class="gt_center gt_columns_top_border gt_column_spanner_outer" rowspan="1" colspan="1" scope="col" id="spanner-Z__1B__1all">
              <div class="gt_column_spanner">Z__1B</div>
            </th>
          </tr>
          <tr class="gt_col_headings">
            <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id="all__1W__1A">all</th>
            <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id="all__1X__1B">all</th>
            <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id="all__1Y__1A">all</th>
            <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id="all__1Z__1B">all</th>
          </tr>
        </thead>
        <tbody class="gt_table_body">
          <tr><td headers="all__1W__1A" class="gt_row gt_right">1</td>
      <td headers="all__1X__1B" class="gt_row gt_right">2</td>
      <td headers="all__1Y__1A" class="gt_row gt_right">3</td>
      <td headers="all__1Z__1B" class="gt_row gt_right">4</td></tr>
        </tbody>
        
      </table>

---

    Code
      cat(render_as_html(gt_tbl))
    Output
      <table class="gt_table" data-quarto-disable-processing="false" data-quarto-bootstrap="false">
        <thead>
          <tr class="gt_col_headings gt_spanner_row">
            <th class="gt_center gt_columns_top_border gt_column_spanner_outer" rowspan="1" colspan="4" scope="colgroup" id="ALL ABOVE">
              <div class="gt_column_spanner">ALL ABOVE</div>
            </th>
          </tr>
          <tr class="gt_col_headings gt_spanner_row">
            <th class="gt_center gt_columns_top_border gt_column_spanner_outer" rowspan="1" colspan="1" scope="col" id="spanner-all.W.A">
              <div class="gt_column_spanner">all</div>
            </th>
            <th class="gt_center gt_columns_top_border gt_column_spanner_outer" rowspan="1" colspan="2" scope="colgroup"></th>
            <th class="gt_center gt_columns_top_border gt_column_spanner_outer" rowspan="1" colspan="1" scope="col" id="spanner-all.Z.B">
              <div class="gt_column_spanner">all</div>
            </th>
          </tr>
          <tr class="gt_col_headings gt_spanner_row">
            <th class="gt_center gt_columns_top_border gt_column_spanner_outer" rowspan="1" colspan="1" scope="col" id="spanner-W.A">
              <div class="gt_column_spanner">W</div>
            </th>
            <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="2" colspan="1" scope="col" id="all.X.B">all.X.B</th>
            <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="2" colspan="1" scope="col" id="all.Y.A">all.Y.A</th>
            <th class="gt_center gt_columns_top_border gt_column_spanner_outer" rowspan="1" colspan="1" scope="col" id="spanner-Z.B">
              <div class="gt_column_spanner">Z</div>
            </th>
          </tr>
          <tr class="gt_col_headings">
            <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id="all.W.A">A</th>
            <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id="all.Z.B">B</th>
          </tr>
        </thead>
        <tbody class="gt_table_body">
          <tr><td headers="all.W.A" class="gt_row gt_right">1</td>
      <td headers="all.X.B" class="gt_row gt_right">2</td>
      <td headers="all.Y.A" class="gt_row gt_right">3</td>
      <td headers="all.Z.B" class="gt_row gt_right">4</td></tr>
        </tbody>
        
      </table>

---

    Code
      cat(render_as_html(gt_tbl))
    Output
      <table class="gt_table" data-quarto-disable-processing="false" data-quarto-bootstrap="false">
        <thead>
          <tr class="gt_col_headings gt_spanner_row">
            <th class="gt_center gt_columns_top_border gt_column_spanner_outer" rowspan="1" colspan="4" scope="colgroup" id="ALL ABOVE">
              <div class="gt_column_spanner">ALL ABOVE</div>
            </th>
          </tr>
          <tr class="gt_col_headings gt_spanner_row">
            <th class="gt_center gt_columns_top_border gt_column_spanner_outer" rowspan="1" colspan="1" scope="col" id="spanner-all.W.A">
              <div class="gt_column_spanner">all</div>
            </th>
            <th class="gt_center gt_columns_top_border gt_column_spanner_outer" rowspan="1" colspan="2" scope="colgroup" id="SUSPENDED">
              <div class="gt_column_spanner">SUSPENDED</div>
            </th>
            <th class="gt_center gt_columns_top_border gt_column_spanner_outer" rowspan="1" colspan="1" scope="col" id="spanner-all.Z.B">
              <div class="gt_column_spanner">all</div>
            </th>
          </tr>
          <tr class="gt_col_headings gt_spanner_row">
            <th class="gt_center gt_columns_top_border gt_column_spanner_outer" rowspan="1" colspan="1" scope="col" id="spanner-W.A">
              <div class="gt_column_spanner">W</div>
            </th>
            <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="2" colspan="1" scope="col" id="all.X.B">all.X.B</th>
            <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="2" colspan="1" scope="col" id="all.Y.A">all.Y.A</th>
            <th class="gt_center gt_columns_top_border gt_column_spanner_outer" rowspan="1" colspan="1" scope="col" id="spanner-Z.B">
              <div class="gt_column_spanner">Z</div>
            </th>
          </tr>
          <tr class="gt_col_headings">
            <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id="all.W.A">A</th>
            <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id="all.Z.B">B</th>
          </tr>
        </thead>
        <tbody class="gt_table_body">
          <tr><td headers="all.W.A" class="gt_row gt_right">1</td>
      <td headers="all.X.B" class="gt_row gt_right">2</td>
      <td headers="all.Y.A" class="gt_row gt_right">3</td>
      <td headers="all.Z.B" class="gt_row gt_right">4</td></tr>
        </tbody>
        
      </table>

---

    Code
      cat(render_as_html(gt_tbl))
    Output
      <table class="gt_table" data-quarto-disable-processing="false" data-quarto-bootstrap="false">
        <thead>
          <tr class="gt_col_headings gt_spanner_row">
            <th class="gt_center gt_columns_top_border gt_column_spanner_outer" rowspan="1" colspan="4" scope="colgroup" id="ALL ABOVE">
              <div class="gt_column_spanner">ALL ABOVE</div>
            </th>
          </tr>
          <tr class="gt_col_headings gt_spanner_row">
            <th class="gt_center gt_columns_top_border gt_column_spanner_outer" rowspan="1" colspan="1" scope="col" id="spanner-all.W.A">
              <div class="gt_column_spanner">all</div>
            </th>
            <th class="gt_center gt_columns_top_border gt_column_spanner_outer" rowspan="1" colspan="2" scope="colgroup" id="SUSPENDED">
              <div class="gt_column_spanner">SUSPENDED</div>
            </th>
            <th class="gt_center gt_columns_top_border gt_column_spanner_outer" rowspan="1" colspan="1" scope="col" id="spanner-all.Z.B">
              <div class="gt_column_spanner">all</div>
            </th>
          </tr>
          <tr class="gt_col_headings gt_spanner_row">
            <th class="gt_center gt_columns_top_border gt_column_spanner_outer" rowspan="1" colspan="1" scope="col" id="spanner-W.A">
              <div class="gt_column_spanner">W</div>
            </th>
            <th class="gt_center gt_columns_top_border gt_column_spanner_outer" rowspan="1" colspan="2" scope="colgroup" id="INFILL">
              <div class="gt_column_spanner">INFILL</div>
            </th>
            <th class="gt_center gt_columns_top_border gt_column_spanner_outer" rowspan="1" colspan="1" scope="col" id="spanner-Z.B">
              <div class="gt_column_spanner">Z</div>
            </th>
          </tr>
          <tr class="gt_col_headings">
            <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id="all.W.A">A</th>
            <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id="all.X.B">all.X.B</th>
            <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id="all.Y.A">all.Y.A</th>
            <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id="all.Z.B">B</th>
          </tr>
        </thead>
        <tbody class="gt_table_body">
          <tr><td headers="all.W.A" class="gt_row gt_right">1</td>
      <td headers="all.X.B" class="gt_row gt_right">2</td>
      <td headers="all.Y.A" class="gt_row gt_right">3</td>
      <td headers="all.Z.B" class="gt_row gt_right">4</td></tr>
        </tbody>
        
      </table>

---

    Code
      cat(render_as_html(gt_tbl))
    Output
      <table class="gt_table" data-quarto-disable-processing="false" data-quarto-bootstrap="false">
        <thead>
          <tr class="gt_col_headings gt_spanner_row">
            <th class="gt_center gt_columns_top_border gt_column_spanner_outer" rowspan="1" colspan="4" scope="colgroup" id="**REPLACED**">
              <div class="gt_column_spanner"><span class='gt_from_md'><strong>REPLACED</strong></span></div>
            </th>
          </tr>
          <tr class="gt_col_headings gt_spanner_row">
            <th class="gt_center gt_columns_top_border gt_column_spanner_outer" rowspan="1" colspan="1" scope="col" id="spanner-all.W.A">
              <div class="gt_column_spanner">all</div>
            </th>
            <th class="gt_center gt_columns_top_border gt_column_spanner_outer" rowspan="1" colspan="2" scope="colgroup" id="SUSPENDED">
              <div class="gt_column_spanner">SUSPENDED</div>
            </th>
            <th class="gt_center gt_columns_top_border gt_column_spanner_outer" rowspan="1" colspan="1" scope="col" id="spanner-all.Z.B">
              <div class="gt_column_spanner">all</div>
            </th>
          </tr>
          <tr class="gt_col_headings gt_spanner_row">
            <th class="gt_center gt_columns_top_border gt_column_spanner_outer" rowspan="1" colspan="1" scope="col" id="spanner-W.A">
              <div class="gt_column_spanner">W</div>
            </th>
            <th class="gt_center gt_columns_top_border gt_column_spanner_outer" rowspan="1" colspan="2" scope="colgroup" id="INFILL">
              <div class="gt_column_spanner">INFILL</div>
            </th>
            <th class="gt_center gt_columns_top_border gt_column_spanner_outer" rowspan="1" colspan="1" scope="col" id="spanner-Z.B">
              <div class="gt_column_spanner">Z</div>
            </th>
          </tr>
          <tr class="gt_col_headings">
            <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id="all.W.A">A</th>
            <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id="all.X.B">all.X.B</th>
            <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id="all.Y.A">all.Y.A</th>
            <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id="all.Z.B">B</th>
          </tr>
        </thead>
        <tbody class="gt_table_body">
          <tr><td headers="all.W.A" class="gt_row gt_right">1</td>
      <td headers="all.X.B" class="gt_row gt_right">2</td>
      <td headers="all.Y.A" class="gt_row gt_right">3</td>
      <td headers="all.Z.B" class="gt_row gt_right">4</td></tr>
        </tbody>
        
      </table>

---

    Code
      cat(render_as_html(gt_tbl))
    Output
      <table class="gt_table" data-quarto-disable-processing="false" data-quarto-bootstrap="false">
        <thead>
          <tr class="gt_col_headings gt_spanner_row">
            <th class="gt_center gt_columns_top_border gt_column_spanner_outer" rowspan="1" colspan="4" scope="colgroup" id="**_Above It All_**">
              <div class="gt_column_spanner"><span class='gt_from_md'><strong><em>Above It All</em></strong></span></div>
            </th>
          </tr>
          <tr class="gt_col_headings gt_spanner_row">
            <th class="gt_center gt_columns_top_border gt_column_spanner_outer" rowspan="1" colspan="4" scope="colgroup" id="**REPLACED**">
              <div class="gt_column_spanner"><span class='gt_from_md'><strong>REPLACED</strong></span></div>
            </th>
          </tr>
          <tr class="gt_col_headings gt_spanner_row">
            <th class="gt_center gt_columns_top_border gt_column_spanner_outer" rowspan="1" colspan="1" scope="col" id="spanner-all.W.A">
              <div class="gt_column_spanner">all</div>
            </th>
            <th class="gt_center gt_columns_top_border gt_column_spanner_outer" rowspan="1" colspan="2" scope="colgroup" id="SUSPENDED">
              <div class="gt_column_spanner">SUSPENDED</div>
            </th>
            <th class="gt_center gt_columns_top_border gt_column_spanner_outer" rowspan="1" colspan="1" scope="col" id="spanner-all.Z.B">
              <div class="gt_column_spanner">all</div>
            </th>
          </tr>
          <tr class="gt_col_headings gt_spanner_row">
            <th class="gt_center gt_columns_top_border gt_column_spanner_outer" rowspan="1" colspan="1" scope="col" id="spanner-W.A">
              <div class="gt_column_spanner">W</div>
            </th>
            <th class="gt_center gt_columns_top_border gt_column_spanner_outer" rowspan="1" colspan="2" scope="colgroup" id="INFILL">
              <div class="gt_column_spanner">INFILL</div>
            </th>
            <th class="gt_center gt_columns_top_border gt_column_spanner_outer" rowspan="1" colspan="1" scope="col" id="spanner-Z.B">
              <div class="gt_column_spanner">Z</div>
            </th>
          </tr>
          <tr class="gt_col_headings">
            <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id="all.W.A">A</th>
            <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id="all.X.B">all.X.B</th>
            <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id="all.Y.A">all.Y.A</th>
            <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id="all.Z.B">B</th>
          </tr>
        </thead>
        <tbody class="gt_table_body">
          <tr><td headers="all.W.A" class="gt_row gt_right">1</td>
      <td headers="all.X.B" class="gt_row gt_right">2</td>
      <td headers="all.Y.A" class="gt_row gt_right">3</td>
      <td headers="all.Z.B" class="gt_row gt_right">4</td></tr>
        </tbody>
        
      </table>

---

    Code
      cat(render_as_html(gt_tbl))
    Output
      <table class="gt_table" data-quarto-disable-processing="false" data-quarto-bootstrap="false">
        <thead>
          <tr class="gt_col_headings gt_spanner_row">
            <th class="gt_center gt_columns_top_border gt_column_spanner_outer" rowspan="1" colspan="4" scope="colgroup" id="Data">
              <div class="gt_column_spanner">Data</div>
            </th>
          </tr>
          <tr class="gt_col_headings gt_spanner_row">
            <th class="gt_center gt_columns_top_border gt_column_spanner_outer" rowspan="1" colspan="2" scope="colgroup" id="spanner-span_1.A.X">
              <div class="gt_column_spanner">span_1</div>
            </th>
            <th class="gt_center gt_columns_top_border gt_column_spanner_outer" rowspan="1" colspan="2" scope="colgroup" id="spanner-span_2.A.Y">
              <div class="gt_column_spanner">span_2</div>
            </th>
          </tr>
          <tr class="gt_col_headings gt_spanner_row">
            <th class="gt_center gt_columns_top_border gt_column_spanner_outer" rowspan="1" colspan="1" scope="col" id="spanner-A.X">
              <div class="gt_column_spanner">A</div>
            </th>
            <th class="gt_center gt_columns_top_border gt_column_spanner_outer" rowspan="1" colspan="1" scope="col" id="spanner-B.X">
              <div class="gt_column_spanner">B</div>
            </th>
            <th class="gt_center gt_columns_top_border gt_column_spanner_outer" rowspan="1" colspan="1" scope="col" id="spanner-A.Y">
              <div class="gt_column_spanner">A</div>
            </th>
            <th class="gt_center gt_columns_top_border gt_column_spanner_outer" rowspan="1" colspan="1" scope="col" id="spanner-B.Y">
              <div class="gt_column_spanner">B</div>
            </th>
          </tr>
          <tr class="gt_col_headings">
            <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id="span_1.A.X">X</th>
            <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id="span_1.B.X">X</th>
            <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id="span_2.A.Y">Y</th>
            <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id="span_2.B.Y">Y</th>
          </tr>
        </thead>
        <tbody class="gt_table_body">
          <tr><td headers="span_1.A.X" class="gt_row gt_right">1</td>
      <td headers="span_1.B.X" class="gt_row gt_right">2</td>
      <td headers="span_2.A.Y" class="gt_row gt_right">3</td>
      <td headers="span_2.B.Y" class="gt_row gt_right">4</td></tr>
        </tbody>
        
      </table>

---

    Code
      cat(render_as_html(gt_tbl))
    Output
      <table class="gt_table" data-quarto-disable-processing="false" data-quarto-bootstrap="false">
        <thead>
          <tr class="gt_col_headings gt_spanner_row">
            <th class="gt_center gt_columns_top_border gt_column_spanner_outer" rowspan="1" colspan="4" scope="colgroup" id="Data">
              <div class="gt_column_spanner">Data</div>
            </th>
          </tr>
          <tr class="gt_col_headings gt_spanner_row">
            <th class="gt_center gt_columns_top_border gt_column_spanner_outer" rowspan="1" colspan="2" scope="colgroup" id="spanner-span_1.A.X">
              <div class="gt_column_spanner">span_1</div>
            </th>
            <th class="gt_center gt_columns_top_border gt_column_spanner_outer" rowspan="1" colspan="2" scope="colgroup" id="spanner-span_2.A.Y">
              <div class="gt_column_spanner">span_2</div>
            </th>
          </tr>
          <tr class="gt_col_headings gt_spanner_row">
            <th class="gt_center gt_columns_top_border gt_column_spanner_outer" rowspan="1" colspan="1" scope="col" id="spanner-A.X">
              <div class="gt_column_spanner">A</div>
            </th>
            <th class="gt_center gt_columns_top_border gt_column_spanner_outer" rowspan="1" colspan="1" scope="col" id="spanner-B.X">
              <div class="gt_column_spanner">B</div>
            </th>
            <th class="gt_center gt_columns_top_border gt_column_spanner_outer" rowspan="1" colspan="1" scope="col" id="spanner-A.Y">
              <div class="gt_column_spanner">A</div>
            </th>
            <th class="gt_center gt_columns_top_border gt_column_spanner_outer" rowspan="1" colspan="1" scope="col" id="spanner-B.Y">
              <div class="gt_column_spanner">B</div>
            </th>
          </tr>
          <tr class="gt_col_headings">
            <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id="span_1.A.X">X</th>
            <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id="span_1.B.X">X</th>
            <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id="span_2.A.Y">Y</th>
            <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id="span_2.B.Y">Y</th>
          </tr>
        </thead>
        <tbody class="gt_table_body">
          <tr><td headers="span_1.A.X" class="gt_row gt_right">1</td>
      <td headers="span_1.B.X" class="gt_row gt_right">2</td>
      <td headers="span_2.A.Y" class="gt_row gt_right">3</td>
      <td headers="span_2.B.Y" class="gt_row gt_right">4</td></tr>
        </tbody>
        
      </table>

---

    Code
      cat(render_as_html(gt_tbl))
    Output
      <table class="gt_table" data-quarto-disable-processing="false" data-quarto-bootstrap="false">
        <thead>
          <tr class="gt_col_headings gt_spanner_row">
            <th class="gt_center gt_columns_top_border gt_column_spanner_outer" rowspan="1" colspan="2" scope="colgroup" id="Cut In">
              <div class="gt_column_spanner">Cut In</div>
            </th>
            <th class="gt_center gt_columns_top_border gt_column_spanner_outer" rowspan="1" colspan="2" scope="colgroup" id="Data">
              <div class="gt_column_spanner">Data</div>
            </th>
          </tr>
          <tr class="gt_col_headings gt_spanner_row">
            <th class="gt_center gt_columns_top_border gt_column_spanner_outer" rowspan="1" colspan="2" scope="colgroup" id="spanner-span_1.A.X">
              <div class="gt_column_spanner">span_1</div>
            </th>
            <th class="gt_center gt_columns_top_border gt_column_spanner_outer" rowspan="1" colspan="2" scope="colgroup" id="spanner-span_2.A.Y">
              <div class="gt_column_spanner">span_2</div>
            </th>
          </tr>
          <tr class="gt_col_headings gt_spanner_row">
            <th class="gt_center gt_columns_top_border gt_column_spanner_outer" rowspan="1" colspan="1" scope="col" id="spanner-A.X">
              <div class="gt_column_spanner">A</div>
            </th>
            <th class="gt_center gt_columns_top_border gt_column_spanner_outer" rowspan="1" colspan="1" scope="col" id="spanner-B.X">
              <div class="gt_column_spanner">B</div>
            </th>
            <th class="gt_center gt_columns_top_border gt_column_spanner_outer" rowspan="1" colspan="1" scope="col" id="spanner-A.Y">
              <div class="gt_column_spanner">A</div>
            </th>
            <th class="gt_center gt_columns_top_border gt_column_spanner_outer" rowspan="1" colspan="1" scope="col" id="spanner-B.Y">
              <div class="gt_column_spanner">B</div>
            </th>
          </tr>
          <tr class="gt_col_headings">
            <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id="span_1.A.X">X</th>
            <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id="span_1.B.X">X</th>
            <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id="span_2.A.Y">Y</th>
            <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id="span_2.B.Y">Y</th>
          </tr>
        </thead>
        <tbody class="gt_table_body">
          <tr><td headers="span_1.A.X" class="gt_row gt_right">1</td>
      <td headers="span_1.B.X" class="gt_row gt_right">2</td>
      <td headers="span_2.A.Y" class="gt_row gt_right">3</td>
      <td headers="span_2.B.Y" class="gt_row gt_right">4</td></tr>
        </tbody>
        
      </table>

---

    Code
      cat(render_as_html(gt_tbl))
    Output
      <table class="gt_table" style="table-layout:fixed;width:0px;" data-quarto-disable-processing="false" data-quarto-bootstrap="false">
        <colgroup>
          <col style="width:80px;"/>
          <col style="width:80px;"/>
          <col style="width:80px;"/>
          <col style="width:80px;"/>
        </colgroup>
        <thead>
          <tr class="gt_col_headings gt_spanner_row">
            <th class="gt_center gt_columns_top_border gt_column_spanner_outer" rowspan="1" colspan="1" scope="col"></th>
            <th class="gt_center gt_columns_top_border gt_column_spanner_outer" rowspan="1" colspan="2" scope="colgroup" id="Cut Across">
              <div class="gt_column_spanner">Cut Across</div>
            </th>
            <th class="gt_center gt_columns_top_border gt_column_spanner_outer" rowspan="1" colspan="1" scope="col"></th>
          </tr>
          <tr class="gt_col_headings gt_spanner_row">
            <th class="gt_center gt_columns_top_border gt_column_spanner_outer" rowspan="1" colspan="2" scope="colgroup" id="Cut In">
              <div class="gt_column_spanner">Cut In</div>
            </th>
            <th class="gt_center gt_columns_top_border gt_column_spanner_outer" rowspan="1" colspan="2" scope="colgroup" id="Data">
              <div class="gt_column_spanner">Data</div>
            </th>
          </tr>
          <tr class="gt_col_headings gt_spanner_row">
            <th class="gt_center gt_columns_top_border gt_column_spanner_outer" rowspan="1" colspan="2" scope="colgroup" id="spanner-span_1.A.X">
              <div class="gt_column_spanner">span_1</div>
            </th>
            <th class="gt_center gt_columns_top_border gt_column_spanner_outer" rowspan="1" colspan="2" scope="colgroup" id="spanner-span_2.A.Y">
              <div class="gt_column_spanner">span_2</div>
            </th>
          </tr>
          <tr class="gt_col_headings gt_spanner_row">
            <th class="gt_center gt_columns_top_border gt_column_spanner_outer" rowspan="1" colspan="1" scope="col" id="spanner-A.X">
              <div class="gt_column_spanner">A</div>
            </th>
            <th class="gt_center gt_columns_top_border gt_column_spanner_outer" rowspan="1" colspan="1" scope="col" id="spanner-B.X">
              <div class="gt_column_spanner">B</div>
            </th>
            <th class="gt_center gt_columns_top_border gt_column_spanner_outer" rowspan="1" colspan="1" scope="col" id="spanner-A.Y">
              <div class="gt_column_spanner">A</div>
            </th>
            <th class="gt_center gt_columns_top_border gt_column_spanner_outer" rowspan="1" colspan="1" scope="col" id="spanner-B.Y">
              <div class="gt_column_spanner">B</div>
            </th>
          </tr>
          <tr class="gt_col_headings">
            <th class="gt_col_heading gt_columns_bottom_border gt_center" rowspan="1" colspan="1" scope="col" id="span_1.A.X">X</th>
            <th class="gt_col_heading gt_columns_bottom_border gt_center" rowspan="1" colspan="1" scope="col" id="span_1.B.X">X</th>
            <th class="gt_col_heading gt_columns_bottom_border gt_center" rowspan="1" colspan="1" scope="col" id="span_2.A.Y">Y</th>
            <th class="gt_col_heading gt_columns_bottom_border gt_center" rowspan="1" colspan="1" scope="col" id="span_2.B.Y">Y</th>
          </tr>
        </thead>
        <tbody class="gt_table_body">
          <tr><td headers="span_1.A.X" class="gt_row gt_center">1</td>
      <td headers="span_1.B.X" class="gt_row gt_center">2</td>
      <td headers="span_2.A.Y" class="gt_row gt_center">3</td>
      <td headers="span_2.B.Y" class="gt_row gt_center">4</td></tr>
        </tbody>
        
      </table>

---

    Code
      cat(render_as_html(gt_tbl))
    Output
      <table class="gt_table" style="table-layout:fixed;width:0px;" data-quarto-disable-processing="false" data-quarto-bootstrap="false">
        <colgroup>
          <col style="width:80px;"/>
          <col style="width:80px;"/>
          <col style="width:80px;"/>
          <col style="width:80px;"/>
        </colgroup>
        <thead>
          <tr class="gt_col_headings gt_spanner_row">
            <th class="gt_center gt_columns_top_border gt_column_spanner_outer" rowspan="1" colspan="1" scope="col" id="Cut Across">
              <div class="gt_column_spanner">Cut Across</div>
            </th>
            <th class="gt_center gt_columns_top_border gt_column_spanner_outer" rowspan="1" colspan="2" scope="colgroup"></th>
            <th class="gt_center gt_columns_top_border gt_column_spanner_outer" rowspan="1" colspan="1" scope="col" id="Cut Across">
              <div class="gt_column_spanner">Cut Across</div>
            </th>
          </tr>
          <tr class="gt_col_headings gt_spanner_row">
            <th class="gt_center gt_columns_top_border gt_column_spanner_outer" rowspan="1" colspan="2" scope="colgroup" id="Data">
              <div class="gt_column_spanner">Data</div>
            </th>
            <th class="gt_center gt_columns_top_border gt_column_spanner_outer" rowspan="1" colspan="2" scope="colgroup" id="Cut In">
              <div class="gt_column_spanner">Cut In</div>
            </th>
          </tr>
          <tr class="gt_col_headings gt_spanner_row">
            <th class="gt_center gt_columns_top_border gt_column_spanner_outer" rowspan="1" colspan="2" scope="colgroup" id="spanner-span_2.A.Y">
              <div class="gt_column_spanner">span_2</div>
            </th>
            <th class="gt_center gt_columns_top_border gt_column_spanner_outer" rowspan="1" colspan="2" scope="colgroup" id="spanner-span_1.A.X">
              <div class="gt_column_spanner">span_1</div>
            </th>
          </tr>
          <tr class="gt_col_headings gt_spanner_row">
            <th class="gt_center gt_columns_top_border gt_column_spanner_outer" rowspan="1" colspan="1" scope="col" id="spanner-A.Y">
              <div class="gt_column_spanner">A</div>
            </th>
            <th class="gt_center gt_columns_top_border gt_column_spanner_outer" rowspan="1" colspan="1" scope="col" id="spanner-B.Y">
              <div class="gt_column_spanner">B</div>
            </th>
            <th class="gt_center gt_columns_top_border gt_column_spanner_outer" rowspan="1" colspan="1" scope="col" id="spanner-A.X">
              <div class="gt_column_spanner">A</div>
            </th>
            <th class="gt_center gt_columns_top_border gt_column_spanner_outer" rowspan="1" colspan="1" scope="col" id="spanner-B.X">
              <div class="gt_column_spanner">B</div>
            </th>
          </tr>
          <tr class="gt_col_headings">
            <th class="gt_col_heading gt_columns_bottom_border gt_center" rowspan="1" colspan="1" scope="col" id="span_2.A.Y">Y</th>
            <th class="gt_col_heading gt_columns_bottom_border gt_center" rowspan="1" colspan="1" scope="col" id="span_2.B.Y">Y</th>
            <th class="gt_col_heading gt_columns_bottom_border gt_center" rowspan="1" colspan="1" scope="col" id="span_1.A.X">X</th>
            <th class="gt_col_heading gt_columns_bottom_border gt_center" rowspan="1" colspan="1" scope="col" id="span_1.B.X">X</th>
          </tr>
        </thead>
        <tbody class="gt_table_body">
          <tr><td headers="span_2.A.Y" class="gt_row gt_center">3</td>
      <td headers="span_2.B.Y" class="gt_row gt_center">4</td>
      <td headers="span_1.A.X" class="gt_row gt_center">1</td>
      <td headers="span_1.B.X" class="gt_row gt_center">2</td></tr>
        </tbody>
        
      </table>

---

    Code
      cat(render_as_html(gt_tbl))
    Output
      <table class="gt_table" data-quarto-disable-processing="false" data-quarto-bootstrap="false">
        <thead>
          <tr class="gt_col_headings gt_spanner_row">
            <th class="gt_center gt_columns_top_border gt_column_spanner_outer" rowspan="1" colspan="2" scope="colgroup" id="spanner-span_1.A.X">
              <div class="gt_column_spanner">span_1</div>
            </th>
            <th class="gt_center gt_columns_top_border gt_column_spanner_outer" rowspan="1" colspan="2" scope="colgroup" id="spanner-span_2.A.Y">
              <div class="gt_column_spanner">span_2</div>
            </th>
          </tr>
          <tr class="gt_col_headings gt_spanner_row">
            <th class="gt_center gt_columns_top_border gt_column_spanner_outer" rowspan="1" colspan="1" scope="col" id="spanner-A.X">
              <div class="gt_column_spanner">A</div>
            </th>
            <th class="gt_center gt_columns_top_border gt_column_spanner_outer" rowspan="1" colspan="1" scope="col" id="spanner-B.X">
              <div class="gt_column_spanner">B</div>
            </th>
            <th class="gt_center gt_columns_top_border gt_column_spanner_outer" rowspan="1" colspan="1" scope="col" id="spanner-A.Y">
              <div class="gt_column_spanner">A</div>
            </th>
            <th class="gt_center gt_columns_top_border gt_column_spanner_outer" rowspan="1" colspan="1" scope="col" id="spanner-B.Y">
              <div class="gt_column_spanner">B</div>
            </th>
          </tr>
          <tr class="gt_col_headings">
            <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id="span_1.A.X">X</th>
            <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id="span_1.B.X">X</th>
            <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id="span_2.A.Y">Y</th>
            <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id="span_2.B.Y">Y</th>
          </tr>
        </thead>
        <tbody class="gt_table_body">
          <tr><td headers="span_1.A.X" class="gt_row gt_right">1</td>
      <td headers="span_1.B.X" class="gt_row gt_right">2</td>
      <td headers="span_2.A.Y" class="gt_row gt_right">3</td>
      <td headers="span_2.B.Y" class="gt_row gt_right">4</td></tr>
        </tbody>
        
      </table>

---

    Code
      cat(render_as_html(gt_tbl))
    Output
      <table class="gt_table" data-quarto-disable-processing="false" data-quarto-bootstrap="false">
        <thead>
          <tr class="gt_col_headings gt_spanner_row">
            <th class="gt_center gt_columns_top_border gt_column_spanner_outer" rowspan="1" colspan="2" scope="colgroup" id="spanner-X.A.span_1">
              <div class="gt_column_spanner">X</div>
            </th>
            <th class="gt_center gt_columns_top_border gt_column_spanner_outer" rowspan="1" colspan="2" scope="colgroup" id="spanner-Y.A.span_2">
              <div class="gt_column_spanner">Y</div>
            </th>
          </tr>
          <tr class="gt_col_headings gt_spanner_row">
            <th class="gt_center gt_columns_top_border gt_column_spanner_outer" rowspan="1" colspan="1" scope="col" id="spanner-A.span_1">
              <div class="gt_column_spanner">A</div>
            </th>
            <th class="gt_center gt_columns_top_border gt_column_spanner_outer" rowspan="1" colspan="1" scope="col" id="spanner-B.span_1">
              <div class="gt_column_spanner">B</div>
            </th>
            <th class="gt_center gt_columns_top_border gt_column_spanner_outer" rowspan="1" colspan="1" scope="col" id="spanner-A.span_2">
              <div class="gt_column_spanner">A</div>
            </th>
            <th class="gt_center gt_columns_top_border gt_column_spanner_outer" rowspan="1" colspan="1" scope="col" id="spanner-B.span_2">
              <div class="gt_column_spanner">B</div>
            </th>
          </tr>
          <tr class="gt_col_headings">
            <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id="X.A.span_1">span_1</th>
            <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id="X.B.span_1">span_1</th>
            <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id="Y.A.span_2">span_2</th>
            <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id="Y.B.span_2">span_2</th>
          </tr>
        </thead>
        <tbody class="gt_table_body">
          <tr><td headers="X.A.span_1" class="gt_row gt_right">1</td>
      <td headers="X.B.span_1" class="gt_row gt_right">2</td>
      <td headers="Y.A.span_2" class="gt_row gt_right">3</td>
      <td headers="Y.B.span_2" class="gt_row gt_right">4</td></tr>
        </tbody>
        
      </table>

---

    Code
      cat(render_as_html(gt_tbl))
    Output
      <table class="gt_table" data-quarto-disable-processing="false" data-quarto-bootstrap="false">
        <thead>
          <tr class="gt_col_headings gt_spanner_row">
            <th class="gt_center gt_columns_top_border gt_column_spanner_outer" rowspan="1" colspan="1" scope="col" id="spanner-A.B.C.D.E">
              <div class="gt_column_spanner">A</div>
            </th>
            <th class="gt_center gt_columns_top_border gt_column_spanner_outer" rowspan="1" colspan="4" scope="colgroup"></th>
          </tr>
          <tr class="gt_col_headings gt_spanner_row">
            <th class="gt_center gt_columns_top_border gt_column_spanner_outer" rowspan="1" colspan="1" scope="col" id="spanner-B.C.D.E">
              <div class="gt_column_spanner">B</div>
            </th>
            <th class="gt_center gt_columns_top_border gt_column_spanner_outer" rowspan="1" colspan="1" scope="col" id="spanner-A.B.C.D">
              <div class="gt_column_spanner">A</div>
            </th>
            <th class="gt_center gt_columns_top_border gt_column_spanner_outer" rowspan="1" colspan="3" scope="colgroup"></th>
          </tr>
          <tr class="gt_col_headings gt_spanner_row">
            <th class="gt_center gt_columns_top_border gt_column_spanner_outer" rowspan="1" colspan="1" scope="col" id="spanner-C.D.E">
              <div class="gt_column_spanner">C</div>
            </th>
            <th class="gt_center gt_columns_top_border gt_column_spanner_outer" rowspan="1" colspan="1" scope="col" id="spanner-B.C.D">
              <div class="gt_column_spanner">B</div>
            </th>
            <th class="gt_center gt_columns_top_border gt_column_spanner_outer" rowspan="1" colspan="1" scope="col" id="spanner-A.B.C">
              <div class="gt_column_spanner">A</div>
            </th>
            <th class="gt_center gt_columns_top_border gt_column_spanner_outer" rowspan="1" colspan="2" scope="colgroup"></th>
          </tr>
          <tr class="gt_col_headings gt_spanner_row">
            <th class="gt_center gt_columns_top_border gt_column_spanner_outer" rowspan="1" colspan="1" scope="col" id="spanner-D.E">
              <div class="gt_column_spanner">D</div>
            </th>
            <th class="gt_center gt_columns_top_border gt_column_spanner_outer" rowspan="1" colspan="1" scope="col" id="spanner-C.D">
              <div class="gt_column_spanner">C</div>
            </th>
            <th class="gt_center gt_columns_top_border gt_column_spanner_outer" rowspan="1" colspan="1" scope="col" id="spanner-B.C">
              <div class="gt_column_spanner">B</div>
            </th>
            <th class="gt_center gt_columns_top_border gt_column_spanner_outer" rowspan="1" colspan="1" scope="col" id="spanner-A.B">
              <div class="gt_column_spanner">A</div>
            </th>
            <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="2" colspan="1" scope="col" id="A">A</th>
          </tr>
          <tr class="gt_col_headings">
            <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id="A.B.C.D.E">E</th>
            <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id="A.B.C.D">D</th>
            <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id="A.B.C">C</th>
            <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id="A.B">B</th>
          </tr>
        </thead>
        <tbody class="gt_table_body">
          <tr><td headers="A.B.C.D.E" class="gt_row gt_right">1</td>
      <td headers="A.B.C.D" class="gt_row gt_right">2</td>
      <td headers="A.B.C" class="gt_row gt_right">3</td>
      <td headers="A.B" class="gt_row gt_right">4</td>
      <td headers="A" class="gt_row gt_right">5</td></tr>
        </tbody>
        
      </table>

---

    Code
      cat(render_as_html(gt_tbl))
    Output
      <table class="gt_table" data-quarto-disable-processing="false" data-quarto-bootstrap="false">
        <thead>
          <tr class="gt_col_headings gt_spanner_row">
            <th class="gt_center gt_columns_top_border gt_column_spanner_outer" rowspan="1" colspan="1" scope="col" id="spanner-A.B.C.D.E">
              <div class="gt_column_spanner">A</div>
            </th>
            <th class="gt_center gt_columns_top_border gt_column_spanner_outer" rowspan="1" colspan="4" scope="colgroup"></th>
          </tr>
          <tr class="gt_col_headings gt_spanner_row">
            <th class="gt_center gt_columns_top_border gt_column_spanner_outer" rowspan="1" colspan="1" scope="col" id="spanner-B.C.D.E">
              <div class="gt_column_spanner">B</div>
            </th>
            <th class="gt_center gt_columns_top_border gt_column_spanner_outer" rowspan="1" colspan="1" scope="col" id="spanner-A.B.C.D">
              <div class="gt_column_spanner">A</div>
            </th>
            <th class="gt_center gt_columns_top_border gt_column_spanner_outer" rowspan="1" colspan="3" scope="colgroup"></th>
          </tr>
          <tr class="gt_col_headings gt_spanner_row">
            <th class="gt_center gt_columns_top_border gt_column_spanner_outer" rowspan="1" colspan="1" scope="col" id="spanner-C.D.E">
              <div class="gt_column_spanner">C</div>
            </th>
            <th class="gt_center gt_columns_top_border gt_column_spanner_outer" rowspan="1" colspan="1" scope="col" id="spanner-B.C.D">
              <div class="gt_column_spanner">B</div>
            </th>
            <th class="gt_center gt_columns_top_border gt_column_spanner_outer" rowspan="1" colspan="1" scope="col" id="spanner-A.B.C">
              <div class="gt_column_spanner">A</div>
            </th>
            <th class="gt_center gt_columns_top_border gt_column_spanner_outer" rowspan="1" colspan="2" scope="colgroup"></th>
          </tr>
          <tr class="gt_col_headings gt_spanner_row">
            <th class="gt_center gt_columns_top_border gt_column_spanner_outer" rowspan="1" colspan="1" scope="col" id="spanner-D.E">
              <div class="gt_column_spanner">D</div>
            </th>
            <th class="gt_center gt_columns_top_border gt_column_spanner_outer" rowspan="1" colspan="1" scope="col" id="spanner-C.D">
              <div class="gt_column_spanner">C</div>
            </th>
            <th class="gt_center gt_columns_top_border gt_column_spanner_outer" rowspan="1" colspan="1" scope="col" id="spanner-B.C">
              <div class="gt_column_spanner">B</div>
            </th>
            <th class="gt_center gt_columns_top_border gt_column_spanner_outer" rowspan="1" colspan="1" scope="col" id="spanner-A.B">
              <div class="gt_column_spanner">A</div>
            </th>
            <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="2" colspan="1" scope="col" id="A">A</th>
          </tr>
          <tr class="gt_col_headings">
            <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id="A.B.C.D.E">E</th>
            <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id="A.B.C.D">D</th>
            <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id="A.B.C">C</th>
            <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id="A.B">B</th>
          </tr>
        </thead>
        <tbody class="gt_table_body">
          <tr><td headers="A.B.C.D.E" class="gt_row gt_right">1</td>
      <td headers="A.B.C.D" class="gt_row gt_right">2</td>
      <td headers="A.B.C" class="gt_row gt_right">3</td>
      <td headers="A.B" class="gt_row gt_right">4</td>
      <td headers="A" class="gt_row gt_right">5</td></tr>
        </tbody>
        
      </table>

---

    Code
      cat(render_as_html(gt_tbl))
    Output
      <table class="gt_table" data-quarto-disable-processing="false" data-quarto-bootstrap="false">
        <thead>
          <tr class="gt_col_headings gt_spanner_row">
            <th class="gt_center gt_columns_top_border gt_column_spanner_outer" rowspan="1" colspan="1" scope="col" id="spanner-E.D.C.B.A">
              <div class="gt_column_spanner">E</div>
            </th>
            <th class="gt_center gt_columns_top_border gt_column_spanner_outer" rowspan="1" colspan="4" scope="colgroup"></th>
          </tr>
          <tr class="gt_col_headings gt_spanner_row">
            <th class="gt_center gt_columns_top_border gt_column_spanner_outer" rowspan="1" colspan="2" scope="colgroup" id="spanner-D.C.B.A">
              <div class="gt_column_spanner">D</div>
            </th>
            <th class="gt_center gt_columns_top_border gt_column_spanner_outer" rowspan="1" colspan="3" scope="colgroup"></th>
          </tr>
          <tr class="gt_col_headings gt_spanner_row">
            <th class="gt_center gt_columns_top_border gt_column_spanner_outer" rowspan="1" colspan="3" scope="colgroup" id="spanner-C.B.A">
              <div class="gt_column_spanner">C</div>
            </th>
            <th class="gt_center gt_columns_top_border gt_column_spanner_outer" rowspan="1" colspan="2" scope="colgroup"></th>
          </tr>
          <tr class="gt_col_headings gt_spanner_row">
            <th class="gt_center gt_columns_top_border gt_column_spanner_outer" rowspan="1" colspan="4" scope="colgroup" id="spanner-B.A">
              <div class="gt_column_spanner">B</div>
            </th>
            <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="2" colspan="1" scope="col" id="A">A</th>
          </tr>
          <tr class="gt_col_headings">
            <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id="A.B.C.D.E">A</th>
            <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id="A.B.C.D">A</th>
            <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id="A.B.C">A</th>
            <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id="A.B">A</th>
          </tr>
        </thead>
        <tbody class="gt_table_body">
          <tr><td headers="A.B.C.D.E" class="gt_row gt_right">1</td>
      <td headers="A.B.C.D" class="gt_row gt_right">2</td>
      <td headers="A.B.C" class="gt_row gt_right">3</td>
      <td headers="A.B" class="gt_row gt_right">4</td>
      <td headers="A" class="gt_row gt_right">5</td></tr>
        </tbody>
        
      </table>

---

    Code
      cat(render_as_html(gt_tbl))
    Output
      <table class="gt_table" data-quarto-disable-processing="false" data-quarto-bootstrap="false">
        <thead>
          <tr class="gt_col_headings gt_spanner_row">
            <th class="gt_center gt_columns_top_border gt_column_spanner_outer" rowspan="1" colspan="1" scope="col" id="spanner-A.B.C.D.E">
              <div class="gt_column_spanner">A</div>
            </th>
            <th class="gt_center gt_columns_top_border gt_column_spanner_outer" rowspan="1" colspan="3" scope="colgroup"></th>
            <th class="gt_center gt_columns_top_border gt_column_spanner_outer" rowspan="1" colspan="1" scope="col" id="Z4">
              <div class="gt_column_spanner"><span class='gt_from_md'><strong>Z</strong></span></div>
            </th>
          </tr>
          <tr class="gt_col_headings gt_spanner_row">
            <th class="gt_center gt_columns_top_border gt_column_spanner_outer" rowspan="1" colspan="1" scope="col" id="spanner-B.C.D.E">
              <div class="gt_column_spanner">B</div>
            </th>
            <th class="gt_center gt_columns_top_border gt_column_spanner_outer" rowspan="1" colspan="1" scope="col" id="spanner-A.B.C.D">
              <div class="gt_column_spanner">A</div>
            </th>
            <th class="gt_center gt_columns_top_border gt_column_spanner_outer" rowspan="1" colspan="2" scope="colgroup"></th>
            <th class="gt_center gt_columns_top_border gt_column_spanner_outer" rowspan="1" colspan="1" scope="col" id="Z3">
              <div class="gt_column_spanner"><span class='gt_from_md'><strong>Z</strong></span></div>
            </th>
          </tr>
          <tr class="gt_col_headings gt_spanner_row">
            <th class="gt_center gt_columns_top_border gt_column_spanner_outer" rowspan="1" colspan="1" scope="col" id="spanner-C.D.E">
              <div class="gt_column_spanner">C</div>
            </th>
            <th class="gt_center gt_columns_top_border gt_column_spanner_outer" rowspan="1" colspan="1" scope="col" id="spanner-B.C.D">
              <div class="gt_column_spanner">B</div>
            </th>
            <th class="gt_center gt_columns_top_border gt_column_spanner_outer" rowspan="1" colspan="1" scope="col" id="spanner-A.B.C">
              <div class="gt_column_spanner">A</div>
            </th>
            <th class="gt_center gt_columns_top_border gt_column_spanner_outer" rowspan="1" colspan="1" scope="col"></th>
            <th class="gt_center gt_columns_top_border gt_column_spanner_outer" rowspan="1" colspan="1" scope="col" id="Z2">
              <div class="gt_column_spanner"><span class='gt_from_md'><strong>Z</strong></span></div>
            </th>
          </tr>
          <tr class="gt_col_headings gt_spanner_row">
            <th class="gt_center gt_columns_top_border gt_column_spanner_outer" rowspan="1" colspan="1" scope="col" id="spanner-D.E">
              <div class="gt_column_spanner">D</div>
            </th>
            <th class="gt_center gt_columns_top_border gt_column_spanner_outer" rowspan="1" colspan="1" scope="col" id="spanner-C.D">
              <div class="gt_column_spanner">C</div>
            </th>
            <th class="gt_center gt_columns_top_border gt_column_spanner_outer" rowspan="1" colspan="1" scope="col" id="spanner-B.C">
              <div class="gt_column_spanner">B</div>
            </th>
            <th class="gt_center gt_columns_top_border gt_column_spanner_outer" rowspan="1" colspan="1" scope="col" id="spanner-A.B">
              <div class="gt_column_spanner">A</div>
            </th>
            <th class="gt_center gt_columns_top_border gt_column_spanner_outer" rowspan="1" colspan="1" scope="col" id="Z1">
              <div class="gt_column_spanner"><span class='gt_from_md'><strong>Z</strong></span></div>
            </th>
          </tr>
          <tr class="gt_col_headings">
            <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id="A.B.C.D.E">E</th>
            <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id="A.B.C.D">D</th>
            <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id="A.B.C">C</th>
            <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id="A.B">B</th>
            <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id="A">A</th>
          </tr>
        </thead>
        <tbody class="gt_table_body">
          <tr><td headers="A.B.C.D.E" class="gt_row gt_right">1</td>
      <td headers="A.B.C.D" class="gt_row gt_right">2</td>
      <td headers="A.B.C" class="gt_row gt_right">3</td>
      <td headers="A.B" class="gt_row gt_right">4</td>
      <td headers="A" class="gt_row gt_right">5</td></tr>
        </tbody>
        
      </table>

---

    Code
      cat(render_as_html(gt_tbl))
    Output
      <table class="gt_table" data-quarto-disable-processing="false" data-quarto-bootstrap="false">
        <thead>
          <tr class="gt_col_headings gt_spanner_row">
            <th class="gt_center gt_columns_top_border gt_column_spanner_outer" rowspan="1" colspan="1" scope="col" id="spanner-A.B.C.D.E">
              <div class="gt_column_spanner">A</div>
            </th>
            <th class="gt_center gt_columns_top_border gt_column_spanner_outer" rowspan="1" colspan="3" scope="colgroup"></th>
            <th class="gt_center gt_columns_top_border gt_column_spanner_outer" rowspan="1" colspan="1" scope="col" id="Y4">
              <div class="gt_column_spanner"><span class='gt_from_md'><strong>Y</strong></span></div>
            </th>
          </tr>
          <tr class="gt_col_headings gt_spanner_row">
            <th class="gt_center gt_columns_top_border gt_column_spanner_outer" rowspan="1" colspan="1" scope="col" id="spanner-B.C.D.E">
              <div class="gt_column_spanner">B</div>
            </th>
            <th class="gt_center gt_columns_top_border gt_column_spanner_outer" rowspan="1" colspan="1" scope="col" id="spanner-A.B.C.D">
              <div class="gt_column_spanner">A</div>
            </th>
            <th class="gt_center gt_columns_top_border gt_column_spanner_outer" rowspan="1" colspan="2" scope="colgroup"></th>
            <th class="gt_center gt_columns_top_border gt_column_spanner_outer" rowspan="1" colspan="1" scope="col" id="Z3">
              <div class="gt_column_spanner"><span class='gt_from_md'><strong>Z</strong></span></div>
            </th>
          </tr>
          <tr class="gt_col_headings gt_spanner_row">
            <th class="gt_center gt_columns_top_border gt_column_spanner_outer" rowspan="1" colspan="1" scope="col" id="spanner-C.D.E">
              <div class="gt_column_spanner">C</div>
            </th>
            <th class="gt_center gt_columns_top_border gt_column_spanner_outer" rowspan="1" colspan="1" scope="col" id="spanner-B.C.D">
              <div class="gt_column_spanner">B</div>
            </th>
            <th class="gt_center gt_columns_top_border gt_column_spanner_outer" rowspan="1" colspan="1" scope="col" id="spanner-A.B.C">
              <div class="gt_column_spanner">A</div>
            </th>
            <th class="gt_center gt_columns_top_border gt_column_spanner_outer" rowspan="1" colspan="1" scope="col"></th>
            <th class="gt_center gt_columns_top_border gt_column_spanner_outer" rowspan="1" colspan="1" scope="col" id="Z2">
              <div class="gt_column_spanner"><span class='gt_from_md'><strong>Z</strong></span></div>
            </th>
          </tr>
          <tr class="gt_col_headings gt_spanner_row">
            <th class="gt_center gt_columns_top_border gt_column_spanner_outer" rowspan="1" colspan="1" scope="col" id="spanner-D.E">
              <div class="gt_column_spanner">D</div>
            </th>
            <th class="gt_center gt_columns_top_border gt_column_spanner_outer" rowspan="1" colspan="1" scope="col" id="spanner-C.D">
              <div class="gt_column_spanner">C</div>
            </th>
            <th class="gt_center gt_columns_top_border gt_column_spanner_outer" rowspan="1" colspan="1" scope="col" id="spanner-B.C">
              <div class="gt_column_spanner">B</div>
            </th>
            <th class="gt_center gt_columns_top_border gt_column_spanner_outer" rowspan="1" colspan="1" scope="col" id="spanner-A.B">
              <div class="gt_column_spanner">A</div>
            </th>
            <th class="gt_center gt_columns_top_border gt_column_spanner_outer" rowspan="1" colspan="1" scope="col" id="Z1">
              <div class="gt_column_spanner"><span class='gt_from_md'><strong>Z</strong></span></div>
            </th>
          </tr>
          <tr class="gt_col_headings">
            <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id="A.B.C.D.E">E</th>
            <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id="A.B.C.D">D</th>
            <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id="A.B.C">C</th>
            <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id="A.B">B</th>
            <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id="A">A</th>
          </tr>
        </thead>
        <tbody class="gt_table_body">
          <tr><td headers="A.B.C.D.E" class="gt_row gt_right">1</td>
      <td headers="A.B.C.D" class="gt_row gt_right">2</td>
      <td headers="A.B.C" class="gt_row gt_right">3</td>
      <td headers="A.B" class="gt_row gt_right">4</td>
      <td headers="A" class="gt_row gt_right">5</td></tr>
        </tbody>
        
      </table>

---

    Code
      cat(render_as_html(gt_tbl))
    Output
      <table class="gt_table" data-quarto-disable-processing="false" data-quarto-bootstrap="false">
        <thead>
          <tr class="gt_col_headings gt_spanner_row">
            <th class="gt_center gt_columns_top_border gt_column_spanner_outer" rowspan="1" colspan="1" scope="col" id="spanner-A.B.C.D.E">
              <div class="gt_column_spanner">A</div>
            </th>
            <th class="gt_center gt_columns_top_border gt_column_spanner_outer" rowspan="1" colspan="4" scope="colgroup"></th>
          </tr>
          <tr class="gt_col_headings gt_spanner_row">
            <th class="gt_center gt_columns_top_border gt_column_spanner_outer" rowspan="1" colspan="1" scope="col" id="spanner-B.C.D.E">
              <div class="gt_column_spanner">B</div>
            </th>
            <th class="gt_center gt_columns_top_border gt_column_spanner_outer" rowspan="1" colspan="1" scope="col" id="spanner-A.B.C.D">
              <div class="gt_column_spanner">A</div>
            </th>
            <th class="gt_center gt_columns_top_border gt_column_spanner_outer" rowspan="1" colspan="3" scope="colgroup"></th>
          </tr>
          <tr class="gt_col_headings gt_spanner_row">
            <th class="gt_center gt_columns_top_border gt_column_spanner_outer" rowspan="1" colspan="1" scope="col" id="spanner-C.D.E">
              <div class="gt_column_spanner">C</div>
            </th>
            <th class="gt_center gt_columns_top_border gt_column_spanner_outer" rowspan="1" colspan="1" scope="col" id="spanner-B.C.D">
              <div class="gt_column_spanner">B</div>
            </th>
            <th class="gt_center gt_columns_top_border gt_column_spanner_outer" rowspan="1" colspan="1" scope="col" id="spanner-A.B.C">
              <div class="gt_column_spanner">A</div>
            </th>
            <th class="gt_center gt_columns_top_border gt_column_spanner_outer" rowspan="1" colspan="2" scope="colgroup"></th>
          </tr>
          <tr class="gt_col_headings gt_spanner_row">
            <th class="gt_center gt_columns_top_border gt_column_spanner_outer" rowspan="1" colspan="1" scope="col" id="spanner-D.E">
              <div class="gt_column_spanner">D</div>
            </th>
            <th class="gt_center gt_columns_top_border gt_column_spanner_outer" rowspan="1" colspan="1" scope="col" id="spanner-C.D">
              <div class="gt_column_spanner">C</div>
            </th>
            <th class="gt_center gt_columns_top_border gt_column_spanner_outer" rowspan="1" colspan="1" scope="col" id="spanner-B.C">
              <div class="gt_column_spanner">B</div>
            </th>
            <th class="gt_center gt_columns_top_border gt_column_spanner_outer" rowspan="1" colspan="1" scope="col" id="spanner-A.B">
              <div class="gt_column_spanner">A</div>
            </th>
            <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="2" colspan="1" scope="col" id="A">A</th>
          </tr>
          <tr class="gt_col_headings">
            <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id="A..B..C..D..E">E</th>
            <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id="A..B..C..D">D</th>
            <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id="A..B..C">C</th>
            <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id="A..B">B</th>
          </tr>
        </thead>
        <tbody class="gt_table_body">
          <tr><td headers="A..B..C..D..E" class="gt_row gt_right">1</td>
      <td headers="A..B..C..D" class="gt_row gt_right">2</td>
      <td headers="A..B..C" class="gt_row gt_right">3</td>
      <td headers="A..B" class="gt_row gt_right">4</td>
      <td headers="A" class="gt_row gt_right">5</td></tr>
        </tbody>
        
      </table>

---

    Code
      cat(render_as_html(gt_tbl))
    Output
      <table class="gt_table" data-quarto-disable-processing="false" data-quarto-bootstrap="false">
        <thead>
          <tr class="gt_col_headings gt_spanner_row">
            <th class="gt_center gt_columns_top_border gt_column_spanner_outer" rowspan="1" colspan="1" scope="col" id="spanner-A.B.C.D.E">
              <div class="gt_column_spanner">A</div>
            </th>
            <th class="gt_center gt_columns_top_border gt_column_spanner_outer" rowspan="1" colspan="4" scope="colgroup"></th>
          </tr>
          <tr class="gt_col_headings gt_spanner_row">
            <th class="gt_center gt_columns_top_border gt_column_spanner_outer" rowspan="1" colspan="1" scope="col" id="spanner-B.C.D.E">
              <div class="gt_column_spanner">B</div>
            </th>
            <th class="gt_center gt_columns_top_border gt_column_spanner_outer" rowspan="1" colspan="1" scope="col" id="spanner-A.B.C.D">
              <div class="gt_column_spanner">A</div>
            </th>
            <th class="gt_center gt_columns_top_border gt_column_spanner_outer" rowspan="1" colspan="3" scope="colgroup"></th>
          </tr>
          <tr class="gt_col_headings gt_spanner_row">
            <th class="gt_center gt_columns_top_border gt_column_spanner_outer" rowspan="1" colspan="1" scope="col" id="spanner-C.D.E">
              <div class="gt_column_spanner">C</div>
            </th>
            <th class="gt_center gt_columns_top_border gt_column_spanner_outer" rowspan="1" colspan="1" scope="col" id="spanner-B.C.D">
              <div class="gt_column_spanner">B</div>
            </th>
            <th class="gt_center gt_columns_top_border gt_column_spanner_outer" rowspan="1" colspan="1" scope="col" id="spanner-A.B.C">
              <div class="gt_column_spanner">A</div>
            </th>
            <th class="gt_center gt_columns_top_border gt_column_spanner_outer" rowspan="1" colspan="2" scope="colgroup"></th>
          </tr>
          <tr class="gt_col_headings gt_spanner_row">
            <th class="gt_center gt_columns_top_border gt_column_spanner_outer" rowspan="1" colspan="1" scope="col" id="spanner-D.E">
              <div class="gt_column_spanner">D</div>
            </th>
            <th class="gt_center gt_columns_top_border gt_column_spanner_outer" rowspan="1" colspan="1" scope="col" id="spanner-C.D">
              <div class="gt_column_spanner">C</div>
            </th>
            <th class="gt_center gt_columns_top_border gt_column_spanner_outer" rowspan="1" colspan="1" scope="col" id="spanner-B.C">
              <div class="gt_column_spanner">B</div>
            </th>
            <th class="gt_center gt_columns_top_border gt_column_spanner_outer" rowspan="1" colspan="1" scope="col" id="spanner-A.B">
              <div class="gt_column_spanner">A</div>
            </th>
            <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="2" colspan="1" scope="col" id="a.A.">A</th>
          </tr>
          <tr class="gt_col_headings">
            <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id="a.A..B..C..D..E.">E</th>
            <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id="a.A..B..C..D.">D</th>
            <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id="a.A..B..C.">C</th>
            <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id="a.A..B.">B</th>
          </tr>
        </thead>
        <tbody class="gt_table_body">
          <tr><td headers=".A..B..C..D..E." class="gt_row gt_right">1</td>
      <td headers=".A..B..C..D." class="gt_row gt_right">2</td>
      <td headers=".A..B..C." class="gt_row gt_right">3</td>
      <td headers=".A..B." class="gt_row gt_right">4</td>
      <td headers=".A." class="gt_row gt_right">5</td></tr>
        </tbody>
        
      </table>

---

    Code
      cat(render_as_html(gt_tbl))
    Output
      <table class="gt_table" data-quarto-disable-processing="false" data-quarto-bootstrap="false">
        <thead>
          <tr class="gt_col_headings gt_spanner_row">
            <th class="gt_center gt_columns_top_border gt_column_spanner_outer" rowspan="1" colspan="1" scope="col"></th>
            <th class="gt_center gt_columns_top_border gt_column_spanner_outer" rowspan="1" colspan="1" scope="col" id="spanner-A_B_C_D">
              <div class="gt_column_spanner">A</div>
            </th>
            <th class="gt_center gt_columns_top_border gt_column_spanner_outer" rowspan="1" colspan="3" scope="colgroup"></th>
          </tr>
          <tr class="gt_col_headings gt_spanner_row">
            <th class="gt_center gt_columns_top_border gt_column_spanner_outer" rowspan="1" colspan="1" scope="col"></th>
            <th class="gt_center gt_columns_top_border gt_column_spanner_outer" rowspan="1" colspan="1" scope="col" id="spanner-B_C_D">
              <div class="gt_column_spanner">B</div>
            </th>
            <th class="gt_center gt_columns_top_border gt_column_spanner_outer" rowspan="1" colspan="1" scope="col" id="spanner-A_B_C">
              <div class="gt_column_spanner">A</div>
            </th>
            <th class="gt_center gt_columns_top_border gt_column_spanner_outer" rowspan="1" colspan="2" scope="colgroup"></th>
          </tr>
          <tr class="gt_col_headings gt_spanner_row">
            <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="2" colspan="1" scope="col" id="__">__</th>
            <th class="gt_center gt_columns_top_border gt_column_spanner_outer" rowspan="1" colspan="1" scope="col" id="spanner-C_D">
              <div class="gt_column_spanner">C</div>
            </th>
            <th class="gt_center gt_columns_top_border gt_column_spanner_outer" rowspan="1" colspan="1" scope="col" id="spanner-B_C">
              <div class="gt_column_spanner">B</div>
            </th>
            <th class="gt_center gt_columns_top_border gt_column_spanner_outer" rowspan="1" colspan="1" scope="col" id="spanner-A_B">
              <div class="gt_column_spanner">A</div>
            </th>
            <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="2" colspan="1" scope="col" id="__A__">A</th>
          </tr>
          <tr class="gt_col_headings">
            <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id="A__B__C__D">D</th>
            <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id="__A__B__C__">C</th>
            <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id="A__B__">B</th>
          </tr>
        </thead>
        <tbody class="gt_table_body">
          <tr><td headers="__" class="gt_row gt_right">1</td>
      <td headers="A__B__C__D" class="gt_row gt_right">2</td>
      <td headers="__A__B__C__" class="gt_row gt_right">3</td>
      <td headers="A__B__" class="gt_row gt_right">4</td>
      <td headers="__A__" class="gt_row gt_right">5</td></tr>
        </tbody>
        
      </table>

