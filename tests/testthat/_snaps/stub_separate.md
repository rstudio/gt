# stub.separate option works correctly for HTML output

    Code
      cat(render_as_html(gt_tbl))
    Output
      <table class="gt_table" data-quarto-disable-processing="false" data-quarto-bootstrap="false">
        <thead>
          <tr class="gt_col_headings">
            <th class="gt_col_heading gt_columns_bottom_border gt_left" rowspan="1" colspan="1" scope="col" id="a::stub">Item</th>
            <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id="col_a">col_a</th>
            <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id="col_b">col_b</th>
          </tr>
        </thead>
        <tbody class="gt_table_body">
          <tr><th id="stub_1_1" scope="row" class="gt_row gt_left gt_stub">Row 1</th>
      <td headers="stub_1_1 col_a" class="gt_row gt_right">10</td>
      <td headers="stub_1_1 col_b" class="gt_row gt_right">100</td></tr>
          <tr><th id="stub_1_2" scope="row" class="gt_row gt_left gt_stub">Row 2</th>
      <td headers="stub_1_2 col_a" class="gt_row gt_right">20</td>
      <td headers="stub_1_2 col_b" class="gt_row gt_right">200</td></tr>
          <tr><th id="stub_1_3" scope="row" class="gt_row gt_left gt_stub">Row 3</th>
      <td headers="stub_1_3 col_a" class="gt_row gt_right">30</td>
      <td headers="stub_1_3 col_b" class="gt_row gt_right">300</td></tr>
        </tbody>
        
      </table>

---

    Code
      cat(render_as_html(gt_tbl))
    Output
      <table class="gt_table" data-quarto-disable-processing="false" data-quarto-bootstrap="false">
        <thead>
          <tr class="gt_col_headings">
            <th class="gt_col_heading gt_columns_bottom_border gt_left" rowspan="1" colspan="1" scope="col" id="a::stub">Item</th>
            <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id="col_a">col_a</th>
            <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id="col_b">col_b</th>
          </tr>
        </thead>
        <tbody class="gt_table_body">
          <tr><th id="stub_1_1" scope="row" class="gt_row gt_left gt_stub">Row 1</th>
      <td headers="stub_1_1 col_a" class="gt_row gt_right">10</td>
      <td headers="stub_1_1 col_b" class="gt_row gt_right">100</td></tr>
          <tr><th id="stub_1_2" scope="row" class="gt_row gt_left gt_stub">Row 2</th>
      <td headers="stub_1_2 col_a" class="gt_row gt_right">20</td>
      <td headers="stub_1_2 col_b" class="gt_row gt_right">200</td></tr>
          <tr><th id="stub_1_3" scope="row" class="gt_row gt_left gt_stub">Row 3</th>
      <td headers="stub_1_3 col_a" class="gt_row gt_right">30</td>
      <td headers="stub_1_3 col_b" class="gt_row gt_right">300</td></tr>
        </tbody>
        
      </table>

# stub.separate option works correctly for LaTeX output

    Code
      as.character(as_latex(gt_tbl))
    Output
      [1] "\\begin{table}[t]\n\\fontsize{12.0pt}{14.0pt}\\selectfont\n\\begin{tabular*}{\\linewidth}{@{\\extracolsep{\\fill}}l|rr}\n\\toprule\nItem & col\\_a & col\\_b \\\\ \n\\midrule\\addlinespace[2.5pt]\nRow 1 & 10 & 100 \\\\ \nRow 2 & 20 & 200 \\\\ \nRow 3 & 30 & 300 \\\\ \n\\bottomrule\n\\end{tabular*}\n\\end{table}\n"

---

    Code
      as.character(as_latex(gt_tbl))
    Output
      [1] "\\begin{table}[t]\n\\fontsize{12.0pt}{14.0pt}\\selectfont\n\\begin{tabular*}{\\linewidth}{@{\\extracolsep{\\fill}}lrr}\n\\toprule\nItem & col\\_a & col\\_b \\\\ \n\\midrule\\addlinespace[2.5pt]\nRow 1 & 10 & 100 \\\\ \nRow 2 & 20 & 200 \\\\ \nRow 3 & 30 & 300 \\\\ \n\\bottomrule\n\\end{tabular*}\n\\end{table}\n"

