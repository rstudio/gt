# Basic multicolumn stub footnotes render correctly

    Code
      cat(render_as_html(gt_tbl))
    Output
      <table class="gt_table" data-quarto-disable-processing="false" data-quarto-bootstrap="false">
        <thead>
          <tr class="gt_heading">
            <td colspan="6" class="gt_heading gt_title gt_font_normal gt_bottom_border" style>Three-Column Stub with Footnotes</td>
          </tr>
          
          <tr class="gt_col_headings">
            <th class="gt_col_heading gt_columns_bottom_border gt_left" rowspan="1" colspan="1" scope="col" id="a::stub1">Manufacturer</th>
            <th class="gt_col_heading gt_columns_bottom_border gt_left" rowspan="1" colspan="1" scope="col" id="a::stub2">Model</th>
            <th class="gt_col_heading gt_columns_bottom_border gt_left" rowspan="1" colspan="1" scope="col" id="a::stub3">Trim</th>
            <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id="year">year</th>
            <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id="hp">hp</th>
            <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id="msrp">msrp</th>
          </tr>
        </thead>
        <tbody class="gt_table_body">
          <tr><th id="stub_1_1" scope="row" class="gt_row gt_left gt_stub">Ford<span class="gt_footnote_marks" style="white-space:nowrap;font-style:italic;font-weight:normal;line-height:0;"><sup>1</sup></span></th>
      <th id="stub_1_1" scope="row" class="gt_row gt_left gt_stub">GT<span class="gt_footnote_marks" style="white-space:nowrap;font-style:italic;font-weight:normal;line-height:0;"><sup>2</sup></span></th>
      <th id="stub_1_1" scope="row" class="gt_row gt_left gt_stub">Base</th>
      <td headers="stub_1_1 year" class="gt_row gt_right">2017</td>
      <td headers="stub_1_1 hp" class="gt_row gt_right">647</td>
      <td headers="stub_1_1 msrp" class="gt_row gt_right">447000</td></tr>
          <tr><th id="stub_1_2" scope="row" class="gt_row gt_left gt_stub">Ford</th>
      <th id="stub_1_2" scope="row" class="gt_row gt_left gt_stub">F-150</th>
      <th id="stub_1_2" scope="row" class="gt_row gt_left gt_stub">XLT</th>
      <td headers="stub_1_2 year" class="gt_row gt_right">2018</td>
      <td headers="stub_1_2 hp" class="gt_row gt_right">450</td>
      <td headers="stub_1_2 msrp" class="gt_row gt_right">28000</td></tr>
          <tr><th id="stub_1_3" scope="rowgroup" rowspan="2" class="gt_row gt_left gt_stub">BMW</th>
      <th id="stub_1_3" scope="row" class="gt_row gt_left gt_stub">X5</th>
      <th id="stub_1_3" scope="row" class="gt_row gt_left gt_stub">xDrive35i</th>
      <td headers="stub_1_3 year" class="gt_row gt_right">2019</td>
      <td headers="stub_1_3 hp" class="gt_row gt_right">300</td>
      <td headers="stub_1_3 msrp" class="gt_row gt_right">57000</td></tr>
          <tr><th id="stub_1_4" scope="row" class="gt_row gt_left gt_stub">X3</th>
      <th id="stub_1_4" scope="row" class="gt_row gt_left gt_stub">sDrive28i</th>
      <td headers="stub_1_4 stub_3" class="gt_row gt_right">2020</td>
      <td headers="stub_1_4 year" class="gt_row gt_right">228</td>
      <td headers="stub_1_4 hp" class="gt_row gt_right">34000</td></tr>
          <tr><th id="stub_1_5" scope="row" class="gt_row gt_left gt_stub">Audi</th>
      <th id="stub_1_5" scope="row" class="gt_row gt_left gt_stub">A4</th>
      <th id="stub_1_5" scope="row" class="gt_row gt_left gt_stub">Premium</th>
      <td headers="stub_1_5 year" class="gt_row gt_right">2021</td>
      <td headers="stub_1_5 hp" class="gt_row gt_right">261</td>
      <td headers="stub_1_5 msrp" class="gt_row gt_right">37000</td></tr>
        </tbody>
        
        <tfoot class="gt_footnotes">
          <tr>
            <td class="gt_footnote" colspan="6"><span class="gt_footnote_marks" style="white-space:nowrap;font-style:italic;font-weight:normal;line-height:0;"><sup>1</sup></span> Target: Ford</td>
          </tr>
          <tr>
            <td class="gt_footnote" colspan="6"><span class="gt_footnote_marks" style="white-space:nowrap;font-style:italic;font-weight:normal;line-height:0;"><sup>2</sup></span> Target: GT</td>
          </tr>
        </tfoot>
      </table>

---

    Code
      as.character(as_latex(gt_tbl))
    Output
      [1] "\\begin{table}[t]\n\\caption*{\n{\\fontsize{20}{25}\\selectfont  Three-Column Stub with Footnotes\\fontsize{12}{15}\\selectfont }\n} \n\\fontsize{12.0pt}{14.0pt}\\selectfont\n\\begin{tabular*}{\\linewidth}{@{\\extracolsep{\\fill}}l|llrrr}\n\\toprule\nManufacturer & year & hp & msrp \\\\ \n\\midrule\\addlinespace[2.5pt]\nFord\\textsuperscript{\\textit{1}} & GT\\textsuperscript{\\textit{2}} & Base & 2017 & 647 & 447000 \\\\ \nFord & F-150 & XLT & 2018 & 450 & 28000 \\\\ \nBMW & X5 & xDrive35i & 2019 & 300 & 57000 \\\\ \nBMW & X3 & sDrive28i & 2020 & 228 & 34000 \\\\ \nAudi & A4 & Premium & 2021 & 261 & 37000 \\\\ \n\\bottomrule\n\\end{tabular*}\n\\begin{minipage}{\\linewidth}\n\\textsuperscript{\\textit{1}}Target: Ford\\\\\n\\textsuperscript{\\textit{2}}Target: GT\\\\\n\\end{minipage}\n\\end{table}\n"

# Multicolumn stub footnotes with visual order priority

    Code
      cat(render_as_html(gt_tbl_1))
    Output
      <table class="gt_table" data-quarto-disable-processing="false" data-quarto-bootstrap="false">
        <thead>
          <tr class="gt_heading">
            <td colspan="6" class="gt_heading gt_title gt_font_normal gt_bottom_border" style>Call Order: Ford First, GT Second</td>
          </tr>
          
          <tr class="gt_col_headings">
            <th class="gt_col_heading gt_columns_bottom_border gt_left" rowspan="1" colspan="1" scope="col" id="a::stub1">Manufacturer</th>
            <th class="gt_col_heading gt_columns_bottom_border gt_left" rowspan="1" colspan="1" scope="col" id="a::stub2">Model</th>
            <th class="gt_col_heading gt_columns_bottom_border gt_left" rowspan="1" colspan="1" scope="col" id="a::stub3">Trim</th>
            <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id="year">year</th>
            <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id="hp">hp</th>
            <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id="msrp">msrp</th>
          </tr>
        </thead>
        <tbody class="gt_table_body">
          <tr><th id="stub_1_1" scope="row" class="gt_row gt_left gt_stub">Ford<span class="gt_footnote_marks" style="white-space:nowrap;font-style:italic;font-weight:normal;line-height:0;"><sup>1</sup></span></th>
      <th id="stub_1_1" scope="row" class="gt_row gt_left gt_stub">GT<span class="gt_footnote_marks" style="white-space:nowrap;font-style:italic;font-weight:normal;line-height:0;"><sup>2</sup></span></th>
      <th id="stub_1_1" scope="row" class="gt_row gt_left gt_stub">Base</th>
      <td headers="stub_1_1 year" class="gt_row gt_right">2017</td>
      <td headers="stub_1_1 hp" class="gt_row gt_right">647</td>
      <td headers="stub_1_1 msrp" class="gt_row gt_right">447000</td></tr>
          <tr><th id="stub_1_2" scope="row" class="gt_row gt_left gt_stub">Ford</th>
      <th id="stub_1_2" scope="row" class="gt_row gt_left gt_stub">F-150</th>
      <th id="stub_1_2" scope="row" class="gt_row gt_left gt_stub">XLT</th>
      <td headers="stub_1_2 year" class="gt_row gt_right">2018</td>
      <td headers="stub_1_2 hp" class="gt_row gt_right">450</td>
      <td headers="stub_1_2 msrp" class="gt_row gt_right">28000</td></tr>
          <tr><th id="stub_1_3" scope="rowgroup" rowspan="2" class="gt_row gt_left gt_stub">BMW</th>
      <th id="stub_1_3" scope="row" class="gt_row gt_left gt_stub">X5</th>
      <th id="stub_1_3" scope="row" class="gt_row gt_left gt_stub">xDrive35i</th>
      <td headers="stub_1_3 year" class="gt_row gt_right">2019</td>
      <td headers="stub_1_3 hp" class="gt_row gt_right">300</td>
      <td headers="stub_1_3 msrp" class="gt_row gt_right">57000</td></tr>
          <tr><th id="stub_1_4" scope="row" class="gt_row gt_left gt_stub">X3</th>
      <th id="stub_1_4" scope="row" class="gt_row gt_left gt_stub">sDrive28i</th>
      <td headers="stub_1_4 stub_3" class="gt_row gt_right">2020</td>
      <td headers="stub_1_4 year" class="gt_row gt_right">228</td>
      <td headers="stub_1_4 hp" class="gt_row gt_right">34000</td></tr>
          <tr><th id="stub_1_5" scope="row" class="gt_row gt_left gt_stub">Audi</th>
      <th id="stub_1_5" scope="row" class="gt_row gt_left gt_stub">A4</th>
      <th id="stub_1_5" scope="row" class="gt_row gt_left gt_stub">Premium</th>
      <td headers="stub_1_5 year" class="gt_row gt_right">2021</td>
      <td headers="stub_1_5 hp" class="gt_row gt_right">261</td>
      <td headers="stub_1_5 msrp" class="gt_row gt_right">37000</td></tr>
        </tbody>
        
        <tfoot class="gt_footnotes">
          <tr>
            <td class="gt_footnote" colspan="6"><span class="gt_footnote_marks" style="white-space:nowrap;font-style:italic;font-weight:normal;line-height:0;"><sup>1</sup></span> Target: Ford</td>
          </tr>
          <tr>
            <td class="gt_footnote" colspan="6"><span class="gt_footnote_marks" style="white-space:nowrap;font-style:italic;font-weight:normal;line-height:0;"><sup>2</sup></span> Target: GT</td>
          </tr>
        </tfoot>
      </table>

---

    Code
      cat(render_as_html(gt_tbl_2))
    Output
      <table class="gt_table" data-quarto-disable-processing="false" data-quarto-bootstrap="false">
        <thead>
          <tr class="gt_heading">
            <td colspan="6" class="gt_heading gt_title gt_font_normal gt_bottom_border" style>Call Order: GT First, Ford Second</td>
          </tr>
          
          <tr class="gt_col_headings">
            <th class="gt_col_heading gt_columns_bottom_border gt_left" rowspan="1" colspan="1" scope="col" id="a::stub1">Manufacturer</th>
            <th class="gt_col_heading gt_columns_bottom_border gt_left" rowspan="1" colspan="1" scope="col" id="a::stub2">Model</th>
            <th class="gt_col_heading gt_columns_bottom_border gt_left" rowspan="1" colspan="1" scope="col" id="a::stub3">Trim</th>
            <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id="year">year</th>
            <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id="hp">hp</th>
            <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id="msrp">msrp</th>
          </tr>
        </thead>
        <tbody class="gt_table_body">
          <tr><th id="stub_1_1" scope="row" class="gt_row gt_left gt_stub">Ford<span class="gt_footnote_marks" style="white-space:nowrap;font-style:italic;font-weight:normal;line-height:0;"><sup>1</sup></span></th>
      <th id="stub_1_1" scope="row" class="gt_row gt_left gt_stub">GT<span class="gt_footnote_marks" style="white-space:nowrap;font-style:italic;font-weight:normal;line-height:0;"><sup>2</sup></span></th>
      <th id="stub_1_1" scope="row" class="gt_row gt_left gt_stub">Base</th>
      <td headers="stub_1_1 year" class="gt_row gt_right">2017</td>
      <td headers="stub_1_1 hp" class="gt_row gt_right">647</td>
      <td headers="stub_1_1 msrp" class="gt_row gt_right">447000</td></tr>
          <tr><th id="stub_1_2" scope="row" class="gt_row gt_left gt_stub">Ford</th>
      <th id="stub_1_2" scope="row" class="gt_row gt_left gt_stub">F-150</th>
      <th id="stub_1_2" scope="row" class="gt_row gt_left gt_stub">XLT</th>
      <td headers="stub_1_2 year" class="gt_row gt_right">2018</td>
      <td headers="stub_1_2 hp" class="gt_row gt_right">450</td>
      <td headers="stub_1_2 msrp" class="gt_row gt_right">28000</td></tr>
          <tr><th id="stub_1_3" scope="rowgroup" rowspan="2" class="gt_row gt_left gt_stub">BMW</th>
      <th id="stub_1_3" scope="row" class="gt_row gt_left gt_stub">X5</th>
      <th id="stub_1_3" scope="row" class="gt_row gt_left gt_stub">xDrive35i</th>
      <td headers="stub_1_3 year" class="gt_row gt_right">2019</td>
      <td headers="stub_1_3 hp" class="gt_row gt_right">300</td>
      <td headers="stub_1_3 msrp" class="gt_row gt_right">57000</td></tr>
          <tr><th id="stub_1_4" scope="row" class="gt_row gt_left gt_stub">X3</th>
      <th id="stub_1_4" scope="row" class="gt_row gt_left gt_stub">sDrive28i</th>
      <td headers="stub_1_4 stub_3" class="gt_row gt_right">2020</td>
      <td headers="stub_1_4 year" class="gt_row gt_right">228</td>
      <td headers="stub_1_4 hp" class="gt_row gt_right">34000</td></tr>
          <tr><th id="stub_1_5" scope="row" class="gt_row gt_left gt_stub">Audi</th>
      <th id="stub_1_5" scope="row" class="gt_row gt_left gt_stub">A4</th>
      <th id="stub_1_5" scope="row" class="gt_row gt_left gt_stub">Premium</th>
      <td headers="stub_1_5 year" class="gt_row gt_right">2021</td>
      <td headers="stub_1_5 hp" class="gt_row gt_right">261</td>
      <td headers="stub_1_5 msrp" class="gt_row gt_right">37000</td></tr>
        </tbody>
        
        <tfoot class="gt_footnotes">
          <tr>
            <td class="gt_footnote" colspan="6"><span class="gt_footnote_marks" style="white-space:nowrap;font-style:italic;font-weight:normal;line-height:0;"><sup>1</sup></span> Target: Ford</td>
          </tr>
          <tr>
            <td class="gt_footnote" colspan="6"><span class="gt_footnote_marks" style="white-space:nowrap;font-style:italic;font-weight:normal;line-height:0;"><sup>2</sup></span> Target: GT</td>
          </tr>
        </tfoot>
      </table>

# Multiple rows with multicolumn stub footnotes

    Code
      cat(render_as_html(gt_tbl))
    Output
      <table class="gt_table" data-quarto-disable-processing="false" data-quarto-bootstrap="false">
        <thead>
          <tr class="gt_heading">
            <td colspan="6" class="gt_heading gt_title gt_font_normal gt_bottom_border" style>Multiple Rows with Footnotes</td>
          </tr>
          
          <tr class="gt_col_headings">
            <th class="gt_col_heading gt_columns_bottom_border gt_left" rowspan="1" colspan="1" scope="col" id="a::stub1">Manufacturer</th>
            <th class="gt_col_heading gt_columns_bottom_border gt_left" rowspan="1" colspan="1" scope="col" id="a::stub2">Model</th>
            <th class="gt_col_heading gt_columns_bottom_border gt_left" rowspan="1" colspan="1" scope="col" id="a::stub3">Trim</th>
            <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id="year">year</th>
            <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id="hp">hp</th>
            <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id="msrp">msrp</th>
          </tr>
        </thead>
        <tbody class="gt_table_body">
          <tr><th id="stub_1_1" scope="row" class="gt_row gt_left gt_stub">Ford<span class="gt_footnote_marks" style="white-space:nowrap;font-style:italic;font-weight:normal;line-height:0;"><sup>1</sup></span></th>
      <th id="stub_1_1" scope="row" class="gt_row gt_left gt_stub">GT<span class="gt_footnote_marks" style="white-space:nowrap;font-style:italic;font-weight:normal;line-height:0;"><sup>2</sup></span></th>
      <th id="stub_1_1" scope="row" class="gt_row gt_left gt_stub">Base</th>
      <td headers="stub_1_1 year" class="gt_row gt_right">2017</td>
      <td headers="stub_1_1 hp" class="gt_row gt_right">647</td>
      <td headers="stub_1_1 msrp" class="gt_row gt_right">447000</td></tr>
          <tr><th id="stub_1_2" scope="row" class="gt_row gt_left gt_stub">Ford</th>
      <th id="stub_1_2" scope="row" class="gt_row gt_left gt_stub">F-150</th>
      <th id="stub_1_2" scope="row" class="gt_row gt_left gt_stub">XLT</th>
      <td headers="stub_1_2 year" class="gt_row gt_right">2018</td>
      <td headers="stub_1_2 hp" class="gt_row gt_right">450</td>
      <td headers="stub_1_2 msrp" class="gt_row gt_right">28000</td></tr>
          <tr><th id="stub_1_3" scope="row" class="gt_row gt_left gt_stub">BMW<span class="gt_footnote_marks" style="white-space:nowrap;font-style:italic;font-weight:normal;line-height:0;"><sup>3</sup></span></th>
      <th id="stub_1_3" scope="row" class="gt_row gt_left gt_stub">X5<span class="gt_footnote_marks" style="white-space:nowrap;font-style:italic;font-weight:normal;line-height:0;"><sup>4</sup></span></th>
      <th id="stub_1_3" scope="row" class="gt_row gt_left gt_stub">xDrive35i</th>
      <td headers="stub_1_3 year" class="gt_row gt_right">2019</td>
      <td headers="stub_1_3 hp" class="gt_row gt_right">300</td>
      <td headers="stub_1_3 msrp" class="gt_row gt_right">57000</td></tr>
          <tr><th id="stub_1_4" scope="row" class="gt_row gt_left gt_stub">BMW</th>
      <th id="stub_1_4" scope="row" class="gt_row gt_left gt_stub">X3</th>
      <th id="stub_1_4" scope="row" class="gt_row gt_left gt_stub">sDrive28i</th>
      <td headers="stub_1_4 year" class="gt_row gt_right">2020</td>
      <td headers="stub_1_4 hp" class="gt_row gt_right">228</td>
      <td headers="stub_1_4 msrp" class="gt_row gt_right">34000</td></tr>
          <tr><th id="stub_1_5" scope="row" class="gt_row gt_left gt_stub">Audi</th>
      <th id="stub_1_5" scope="row" class="gt_row gt_left gt_stub">A4</th>
      <th id="stub_1_5" scope="row" class="gt_row gt_left gt_stub">Premium</th>
      <td headers="stub_1_5 year" class="gt_row gt_right">2021</td>
      <td headers="stub_1_5 hp" class="gt_row gt_right">261</td>
      <td headers="stub_1_5 msrp" class="gt_row gt_right">37000</td></tr>
        </tbody>
        
        <tfoot class="gt_footnotes">
          <tr>
            <td class="gt_footnote" colspan="6"><span class="gt_footnote_marks" style="white-space:nowrap;font-style:italic;font-weight:normal;line-height:0;"><sup>1</sup></span> Ford manufacturer</td>
          </tr>
          <tr>
            <td class="gt_footnote" colspan="6"><span class="gt_footnote_marks" style="white-space:nowrap;font-style:italic;font-weight:normal;line-height:0;"><sup>2</sup></span> GT model</td>
          </tr>
          <tr>
            <td class="gt_footnote" colspan="6"><span class="gt_footnote_marks" style="white-space:nowrap;font-style:italic;font-weight:normal;line-height:0;"><sup>3</sup></span> BMW manufacturer</td>
          </tr>
          <tr>
            <td class="gt_footnote" colspan="6"><span class="gt_footnote_marks" style="white-space:nowrap;font-style:italic;font-weight:normal;line-height:0;"><sup>4</sup></span> X5 model</td>
          </tr>
        </tfoot>
      </table>

# Multicolumn stub footnotes with row groups as conventional rows

    Code
      cat(render_as_html(gt_tbl))
    Output
      <table class="gt_table" data-quarto-disable-processing="false" data-quarto-bootstrap="false">
        <thead>
          <tr class="gt_heading">
            <td colspan="6" class="gt_heading gt_title gt_font_normal gt_bottom_border" style>Multicolumn Stub with Row Groups</td>
          </tr>
          
          <tr class="gt_col_headings">
            <th class="gt_col_heading gt_columns_bottom_border gt_left" rowspan="1" colspan="1" scope="col" id="a::stub1">Manufacturer</th>
            <th class="gt_col_heading gt_columns_bottom_border gt_left" rowspan="1" colspan="1" scope="col" id="a::stub2">Model</th>
            <th class="gt_col_heading gt_columns_bottom_border gt_left" rowspan="1" colspan="1" scope="col" id="a::stub3">Trim</th>
            <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id="year">year</th>
            <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id="hp">hp</th>
            <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id="msrp">msrp</th>
          </tr>
        </thead>
        <tbody class="gt_table_body">
          <tr class="gt_group_heading_row">
            <th colspan="6" class="gt_group_heading" scope="colgroup" id="American &amp;amp; German">American &amp; German</th>
          </tr>
          <tr class="gt_row_group_first"><th id="stub_1_1" scope="row" class="gt_row gt_left gt_stub">Ford<span class="gt_footnote_marks" style="white-space:nowrap;font-style:italic;font-weight:normal;line-height:0;"><sup>1</sup></span></th>
      <th id="stub_1_1" scope="row" class="gt_row gt_left gt_stub">GT<span class="gt_footnote_marks" style="white-space:nowrap;font-style:italic;font-weight:normal;line-height:0;"><sup>2</sup></span></th>
      <th id="stub_1_1" scope="row" class="gt_row gt_left gt_stub">Base</th>
      <td headers="American & German stub_1_1 year" class="gt_row gt_right">2017</td>
      <td headers="American & German stub_1_1 hp" class="gt_row gt_right">647</td>
      <td headers="American & German stub_1_1 msrp" class="gt_row gt_right">447000</td></tr>
          <tr><th id="stub_1_2" scope="row" class="gt_row gt_left gt_stub">Ford</th>
      <th id="stub_1_2" scope="row" class="gt_row gt_left gt_stub">F-150</th>
      <th id="stub_1_2" scope="row" class="gt_row gt_left gt_stub">XLT</th>
      <td headers="American & German stub_1_2 year" class="gt_row gt_right">2018</td>
      <td headers="American & German stub_1_2 hp" class="gt_row gt_right">450</td>
      <td headers="American & German stub_1_2 msrp" class="gt_row gt_right">28000</td></tr>
          <tr><th id="stub_1_3" scope="row" class="gt_row gt_left gt_stub">BMW<span class="gt_footnote_marks" style="white-space:nowrap;font-style:italic;font-weight:normal;line-height:0;"><sup>3</sup></span></th>
      <th id="stub_1_3" scope="row" class="gt_row gt_left gt_stub">X5</th>
      <th id="stub_1_3" scope="row" class="gt_row gt_left gt_stub">xDrive35i</th>
      <td headers="American & German stub_1_3 year" class="gt_row gt_right">2019</td>
      <td headers="American & German stub_1_3 hp" class="gt_row gt_right">300</td>
      <td headers="American & German stub_1_3 msrp" class="gt_row gt_right">57000</td></tr>
          <tr><th id="stub_1_4" scope="row" class="gt_row gt_left gt_stub">BMW</th>
      <th id="stub_1_4" scope="row" class="gt_row gt_left gt_stub">X3</th>
      <th id="stub_1_4" scope="row" class="gt_row gt_left gt_stub">sDrive28i</th>
      <td headers="American & German stub_1_4 year" class="gt_row gt_right">2020</td>
      <td headers="American & German stub_1_4 hp" class="gt_row gt_right">228</td>
      <td headers="American & German stub_1_4 msrp" class="gt_row gt_right">34000</td></tr>
          <tr class="gt_group_heading_row">
            <th colspan="6" class="gt_group_heading" scope="colgroup" id="German Premium">German Premium</th>
          </tr>
          <tr class="gt_row_group_first"><th id="stub_1_5" scope="row" class="gt_row gt_left gt_stub">Audi</th>
      <th id="stub_1_5" scope="row" class="gt_row gt_left gt_stub">A4</th>
      <th id="stub_1_5" scope="row" class="gt_row gt_left gt_stub">Premium</th>
      <td headers="German Premium stub_1_5 year" class="gt_row gt_right">2021</td>
      <td headers="German Premium stub_1_5 hp" class="gt_row gt_right">261</td>
      <td headers="German Premium stub_1_5 msrp" class="gt_row gt_right">37000</td></tr>
        </tbody>
        
        <tfoot class="gt_footnotes">
          <tr>
            <td class="gt_footnote" colspan="6"><span class="gt_footnote_marks" style="white-space:nowrap;font-style:italic;font-weight:normal;line-height:0;"><sup>1</sup></span> Ford note</td>
          </tr>
          <tr>
            <td class="gt_footnote" colspan="6"><span class="gt_footnote_marks" style="white-space:nowrap;font-style:italic;font-weight:normal;line-height:0;"><sup>2</sup></span> GT note</td>
          </tr>
          <tr>
            <td class="gt_footnote" colspan="6"><span class="gt_footnote_marks" style="white-space:nowrap;font-style:italic;font-weight:normal;line-height:0;"><sup>3</sup></span> BMW note</td>
          </tr>
        </tfoot>
      </table>

# Multicolumn stub footnotes with row groups as columns

    Code
      cat(render_as_html(gt_tbl))
    Output
      <table class="gt_table" data-quarto-disable-processing="false" data-quarto-bootstrap="false">
        <thead>
          <tr class="gt_heading">
            <td colspan="7" class="gt_heading gt_title gt_font_normal gt_bottom_border" style>Multicolumn Stub with Row Groups as Columns</td>
          </tr>
          
          <tr class="gt_col_headings">
            <th class="gt_col_heading gt_columns_bottom_border gt_left" rowspan="1" colspan="1" scope="col" id="a::stub1">Manufacturer</th>
            <th class="gt_col_heading gt_columns_bottom_border gt_left" rowspan="1" colspan="1" scope="col" id="a::stub2">Model</th>
            <th class="gt_col_heading gt_columns_bottom_border gt_left" rowspan="1" colspan="1" scope="col" id="a::stub3">Trim</th>
            <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id="year">year</th>
            <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id="hp">hp</th>
            <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id="msrp">msrp</th>
          </tr>
        </thead>
        <tbody class="gt_table_body">
          <tr class="gt_row_group_first"><td headers="American & German stub_2_1 stub_1" rowspan="4" class="gt_row gt_left gt_stub_row_group">American &amp; German</td>
      <th id="stub_2_1" scope="row" class="gt_row gt_left gt_stub">Ford<span class="gt_footnote_marks" style="white-space:nowrap;font-style:italic;font-weight:normal;line-height:0;"><sup>1</sup></span></th>
      <th id="stub_2_1" scope="row" class="gt_row gt_left gt_stub">GT<span class="gt_footnote_marks" style="white-space:nowrap;font-style:italic;font-weight:normal;line-height:0;"><sup>2</sup></span></th>
      <td headers="American & German stub_2_1 stub_4" class="gt_row gt_left">Base</td>
      <td headers="American & German stub_2_1 year" class="gt_row gt_right">2017</td>
      <td headers="American & German stub_2_1 hp" class="gt_row gt_right">647</td>
      <td headers="American & German stub_2_1 msrp" class="gt_row gt_right">447000</td></tr>
          <tr><th id="stub_2_2" scope="row" class="gt_row gt_left gt_stub">Ford</th>
      <th id="stub_2_2" scope="row" class="gt_row gt_left gt_stub">F-150</th>
      <td headers="American & German stub_2_2 stub_4" class="gt_row gt_left">XLT</td>
      <td headers="American & German stub_2_2 year" class="gt_row gt_right">2018</td>
      <td headers="American & German stub_2_2 hp" class="gt_row gt_right">450</td>
      <td headers="American & German stub_2_2 msrp" class="gt_row gt_right">28000</td></tr>
          <tr><th id="stub_2_3" scope="row" class="gt_row gt_left gt_stub">BMW<span class="gt_footnote_marks" style="white-space:nowrap;font-style:italic;font-weight:normal;line-height:0;"><sup>3</sup></span></th>
      <th id="stub_2_3" scope="row" class="gt_row gt_left gt_stub">X5</th>
      <td headers="American & German stub_2_3 stub_4" class="gt_row gt_left">xDrive35i</td>
      <td headers="American & German stub_2_3 year" class="gt_row gt_right">2019</td>
      <td headers="American & German stub_2_3 hp" class="gt_row gt_right">300</td>
      <td headers="American & German stub_2_3 msrp" class="gt_row gt_right">57000</td></tr>
          <tr><th id="stub_2_4" scope="row" class="gt_row gt_left gt_stub">BMW</th>
      <th id="stub_2_4" scope="row" class="gt_row gt_left gt_stub">X3</th>
      <td headers="American & German stub_2_4 stub_4" class="gt_row gt_left">sDrive28i</td>
      <td headers="American & German stub_2_4 year" class="gt_row gt_right">2020</td>
      <td headers="American & German stub_2_4 hp" class="gt_row gt_right">228</td>
      <td headers="American & German stub_2_4 msrp" class="gt_row gt_right">34000</td></tr>
          <tr class="gt_row_group_first"><td headers="German Premium stub_2_5 stub_1" rowspan="1" class="gt_row gt_left gt_stub_row_group">German Premium</td>
      <th id="stub_2_5" scope="row" class="gt_row gt_left gt_stub">Audi</th>
      <th id="stub_2_5" scope="row" class="gt_row gt_left gt_stub">A4</th>
      <td headers="German Premium stub_2_5 stub_4" class="gt_row gt_left">Premium</td>
      <td headers="German Premium stub_2_5 year" class="gt_row gt_right">2021</td>
      <td headers="German Premium stub_2_5 hp" class="gt_row gt_right">261</td>
      <td headers="German Premium stub_2_5 msrp" class="gt_row gt_right">37000</td></tr>
        </tbody>
        
        <tfoot class="gt_footnotes">
          <tr>
            <td class="gt_footnote" colspan="7"><span class="gt_footnote_marks" style="white-space:nowrap;font-style:italic;font-weight:normal;line-height:0;"><sup>1</sup></span> Ford note</td>
          </tr>
          <tr>
            <td class="gt_footnote" colspan="7"><span class="gt_footnote_marks" style="white-space:nowrap;font-style:italic;font-weight:normal;line-height:0;"><sup>2</sup></span> GT note</td>
          </tr>
          <tr>
            <td class="gt_footnote" colspan="7"><span class="gt_footnote_marks" style="white-space:nowrap;font-style:italic;font-weight:normal;line-height:0;"><sup>3</sup></span> BMW note</td>
          </tr>
        </tfoot>
      </table>

# All stub columns with footnotes

    Code
      cat(render_as_html(gt_tbl))
    Output
      <table class="gt_table" data-quarto-disable-processing="false" data-quarto-bootstrap="false">
        <thead>
          <tr class="gt_heading">
            <td colspan="6" class="gt_heading gt_title gt_font_normal gt_bottom_border" style>All Stub Columns with Footnotes</td>
          </tr>
          
          <tr class="gt_col_headings">
            <th class="gt_col_heading gt_columns_bottom_border gt_left" rowspan="1" colspan="1" scope="col" id="a::stub1">Manufacturer</th>
            <th class="gt_col_heading gt_columns_bottom_border gt_left" rowspan="1" colspan="1" scope="col" id="a::stub2">Model</th>
            <th class="gt_col_heading gt_columns_bottom_border gt_left" rowspan="1" colspan="1" scope="col" id="a::stub3">Trim</th>
            <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id="year">year</th>
            <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id="hp">hp</th>
            <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id="msrp">msrp</th>
          </tr>
        </thead>
        <tbody class="gt_table_body">
          <tr><th id="stub_1_1" scope="row" class="gt_row gt_left gt_stub">Ford<span class="gt_footnote_marks" style="white-space:nowrap;font-style:italic;font-weight:normal;line-height:0;"><sup>1</sup></span></th>
      <th id="stub_1_1" scope="row" class="gt_row gt_left gt_stub">GT<span class="gt_footnote_marks" style="white-space:nowrap;font-style:italic;font-weight:normal;line-height:0;"><sup>2</sup></span></th>
      <th id="stub_1_1" scope="row" class="gt_row gt_left gt_stub">Base<span class="gt_footnote_marks" style="white-space:nowrap;font-style:italic;font-weight:normal;line-height:0;"><sup>3</sup></span></th>
      <td headers="stub_1_1 year" class="gt_row gt_right">2017</td>
      <td headers="stub_1_1 hp" class="gt_row gt_right">647</td>
      <td headers="stub_1_1 msrp" class="gt_row gt_right">447000</td></tr>
          <tr><th id="stub_1_2" scope="row" class="gt_row gt_left gt_stub">Ford</th>
      <th id="stub_1_2" scope="row" class="gt_row gt_left gt_stub">F-150</th>
      <th id="stub_1_2" scope="row" class="gt_row gt_left gt_stub">XLT</th>
      <td headers="stub_1_2 year" class="gt_row gt_right">2018</td>
      <td headers="stub_1_2 hp" class="gt_row gt_right">450</td>
      <td headers="stub_1_2 msrp" class="gt_row gt_right">28000</td></tr>
          <tr><th id="stub_1_3" scope="rowgroup" rowspan="2" class="gt_row gt_left gt_stub">BMW</th>
      <th id="stub_1_3" scope="row" class="gt_row gt_left gt_stub">X5</th>
      <th id="stub_1_3" scope="row" class="gt_row gt_left gt_stub">xDrive35i</th>
      <td headers="stub_1_3 year" class="gt_row gt_right">2019</td>
      <td headers="stub_1_3 hp" class="gt_row gt_right">300</td>
      <td headers="stub_1_3 msrp" class="gt_row gt_right">57000</td></tr>
          <tr><th id="stub_1_4" scope="row" class="gt_row gt_left gt_stub">X3</th>
      <th id="stub_1_4" scope="row" class="gt_row gt_left gt_stub">sDrive28i</th>
      <td headers="stub_1_4 stub_3" class="gt_row gt_right">2020</td>
      <td headers="stub_1_4 year" class="gt_row gt_right">228</td>
      <td headers="stub_1_4 hp" class="gt_row gt_right">34000</td></tr>
          <tr><th id="stub_1_5" scope="row" class="gt_row gt_left gt_stub">Audi</th>
      <th id="stub_1_5" scope="row" class="gt_row gt_left gt_stub">A4</th>
      <th id="stub_1_5" scope="row" class="gt_row gt_left gt_stub">Premium</th>
      <td headers="stub_1_5 year" class="gt_row gt_right">2021</td>
      <td headers="stub_1_5 hp" class="gt_row gt_right">261</td>
      <td headers="stub_1_5 msrp" class="gt_row gt_right">37000</td></tr>
        </tbody>
        
        <tfoot class="gt_footnotes">
          <tr>
            <td class="gt_footnote" colspan="6"><span class="gt_footnote_marks" style="white-space:nowrap;font-style:italic;font-weight:normal;line-height:0;"><sup>1</sup></span> Ford manufacturer</td>
          </tr>
          <tr>
            <td class="gt_footnote" colspan="6"><span class="gt_footnote_marks" style="white-space:nowrap;font-style:italic;font-weight:normal;line-height:0;"><sup>2</sup></span> GT model</td>
          </tr>
          <tr>
            <td class="gt_footnote" colspan="6"><span class="gt_footnote_marks" style="white-space:nowrap;font-style:italic;font-weight:normal;line-height:0;"><sup>3</sup></span> Base trim</td>
          </tr>
        </tfoot>
      </table>

# Footnotes on non-first row with multicolumn stub

    Code
      cat(render_as_html(gt_tbl))
    Output
      <table class="gt_table" data-quarto-disable-processing="false" data-quarto-bootstrap="false">
        <thead>
          <tr class="gt_heading">
            <td colspan="6" class="gt_heading gt_title gt_font_normal gt_bottom_border" style>Footnotes on Second Row</td>
          </tr>
          
          <tr class="gt_col_headings">
            <th class="gt_col_heading gt_columns_bottom_border gt_left" rowspan="1" colspan="1" scope="col" id="a::stub1">Manufacturer</th>
            <th class="gt_col_heading gt_columns_bottom_border gt_left" rowspan="1" colspan="1" scope="col" id="a::stub2">Model</th>
            <th class="gt_col_heading gt_columns_bottom_border gt_left" rowspan="1" colspan="1" scope="col" id="a::stub3">Trim</th>
            <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id="year">year</th>
            <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id="hp">hp</th>
            <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id="msrp">msrp</th>
          </tr>
        </thead>
        <tbody class="gt_table_body">
          <tr><th id="stub_1_1" scope="row" class="gt_row gt_left gt_stub">Ford</th>
      <th id="stub_1_1" scope="row" class="gt_row gt_left gt_stub">GT</th>
      <th id="stub_1_1" scope="row" class="gt_row gt_left gt_stub">Base</th>
      <td headers="stub_1_1 year" class="gt_row gt_right">2017</td>
      <td headers="stub_1_1 hp" class="gt_row gt_right">647</td>
      <td headers="stub_1_1 msrp" class="gt_row gt_right">447000</td></tr>
          <tr><th id="stub_1_2" scope="row" class="gt_row gt_left gt_stub">Ford<span class="gt_footnote_marks" style="white-space:nowrap;font-style:italic;font-weight:normal;line-height:0;"><sup>1</sup></span></th>
      <th id="stub_1_2" scope="row" class="gt_row gt_left gt_stub">F-150<span class="gt_footnote_marks" style="white-space:nowrap;font-style:italic;font-weight:normal;line-height:0;"><sup>2</sup></span></th>
      <th id="stub_1_2" scope="row" class="gt_row gt_left gt_stub">XLT</th>
      <td headers="stub_1_2 year" class="gt_row gt_right">2018</td>
      <td headers="stub_1_2 hp" class="gt_row gt_right">450</td>
      <td headers="stub_1_2 msrp" class="gt_row gt_right">28000</td></tr>
          <tr><th id="stub_1_3" scope="rowgroup" rowspan="2" class="gt_row gt_left gt_stub">BMW</th>
      <th id="stub_1_3" scope="row" class="gt_row gt_left gt_stub">X5</th>
      <th id="stub_1_3" scope="row" class="gt_row gt_left gt_stub">xDrive35i</th>
      <td headers="stub_1_3 year" class="gt_row gt_right">2019</td>
      <td headers="stub_1_3 hp" class="gt_row gt_right">300</td>
      <td headers="stub_1_3 msrp" class="gt_row gt_right">57000</td></tr>
          <tr><th id="stub_1_4" scope="row" class="gt_row gt_left gt_stub">X3</th>
      <th id="stub_1_4" scope="row" class="gt_row gt_left gt_stub">sDrive28i</th>
      <td headers="stub_1_4 stub_3" class="gt_row gt_right">2020</td>
      <td headers="stub_1_4 year" class="gt_row gt_right">228</td>
      <td headers="stub_1_4 hp" class="gt_row gt_right">34000</td></tr>
          <tr><th id="stub_1_5" scope="row" class="gt_row gt_left gt_stub">Audi</th>
      <th id="stub_1_5" scope="row" class="gt_row gt_left gt_stub">A4</th>
      <th id="stub_1_5" scope="row" class="gt_row gt_left gt_stub">Premium</th>
      <td headers="stub_1_5 year" class="gt_row gt_right">2021</td>
      <td headers="stub_1_5 hp" class="gt_row gt_right">261</td>
      <td headers="stub_1_5 msrp" class="gt_row gt_right">37000</td></tr>
        </tbody>
        
        <tfoot class="gt_footnotes">
          <tr>
            <td class="gt_footnote" colspan="6"><span class="gt_footnote_marks" style="white-space:nowrap;font-style:italic;font-weight:normal;line-height:0;"><sup>1</sup></span> Ford manufacturer</td>
          </tr>
          <tr>
            <td class="gt_footnote" colspan="6"><span class="gt_footnote_marks" style="white-space:nowrap;font-style:italic;font-weight:normal;line-height:0;"><sup>2</sup></span> F-150 model</td>
          </tr>
        </tfoot>
      </table>

# Mixed stub and data column footnotes

    Code
      cat(render_as_html(gt_tbl))
    Output
      <table class="gt_table" data-quarto-disable-processing="false" data-quarto-bootstrap="false">
        <thead>
          <tr class="gt_heading">
            <td colspan="6" class="gt_heading gt_title gt_font_normal gt_bottom_border" style>Mixed Stub and Data Footnotes</td>
          </tr>
          
          <tr class="gt_col_headings">
            <th class="gt_col_heading gt_columns_bottom_border gt_left" rowspan="1" colspan="1" scope="col" id="a::stub1">Manufacturer</th>
            <th class="gt_col_heading gt_columns_bottom_border gt_left" rowspan="1" colspan="1" scope="col" id="a::stub2">Model</th>
            <th class="gt_col_heading gt_columns_bottom_border gt_left" rowspan="1" colspan="1" scope="col" id="a::stub3">Trim</th>
            <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id="year">year</th>
            <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id="hp">hp</th>
            <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id="msrp">msrp</th>
          </tr>
        </thead>
        <tbody class="gt_table_body">
          <tr><th id="stub_1_1" scope="row" class="gt_row gt_left gt_stub">Ford<span class="gt_footnote_marks" style="white-space:nowrap;font-style:italic;font-weight:normal;line-height:0;"><sup>1</sup></span></th>
      <th id="stub_1_1" scope="row" class="gt_row gt_left gt_stub">GT<span class="gt_footnote_marks" style="white-space:nowrap;font-style:italic;font-weight:normal;line-height:0;"><sup>2</sup></span></th>
      <th id="stub_1_1" scope="row" class="gt_row gt_left gt_stub">Base</th>
      <td headers="stub_1_1 year" class="gt_row gt_right">2017</td>
      <td headers="stub_1_1 hp" class="gt_row gt_right"><span class="gt_footnote_marks" style="white-space:nowrap;font-style:italic;font-weight:normal;line-height:0;"><sup>3</sup></span> 647</td>
      <td headers="stub_1_1 msrp" class="gt_row gt_right"><span class="gt_footnote_marks" style="white-space:nowrap;font-style:italic;font-weight:normal;line-height:0;"><sup>4</sup></span> 447000</td></tr>
          <tr><th id="stub_1_2" scope="row" class="gt_row gt_left gt_stub">Ford</th>
      <th id="stub_1_2" scope="row" class="gt_row gt_left gt_stub">F-150</th>
      <th id="stub_1_2" scope="row" class="gt_row gt_left gt_stub">XLT</th>
      <td headers="stub_1_2 year" class="gt_row gt_right">2018</td>
      <td headers="stub_1_2 hp" class="gt_row gt_right">450</td>
      <td headers="stub_1_2 msrp" class="gt_row gt_right">28000</td></tr>
          <tr><th id="stub_1_3" scope="rowgroup" rowspan="2" class="gt_row gt_left gt_stub">BMW</th>
      <th id="stub_1_3" scope="row" class="gt_row gt_left gt_stub">X5</th>
      <th id="stub_1_3" scope="row" class="gt_row gt_left gt_stub">xDrive35i</th>
      <td headers="stub_1_3 year" class="gt_row gt_right">2019</td>
      <td headers="stub_1_3 hp" class="gt_row gt_right">300</td>
      <td headers="stub_1_3 msrp" class="gt_row gt_right">57000</td></tr>
          <tr><th id="stub_1_4" scope="row" class="gt_row gt_left gt_stub">X3</th>
      <th id="stub_1_4" scope="row" class="gt_row gt_left gt_stub">sDrive28i</th>
      <td headers="stub_1_4 stub_3" class="gt_row gt_right">2020</td>
      <td headers="stub_1_4 year" class="gt_row gt_right">228</td>
      <td headers="stub_1_4 hp" class="gt_row gt_right">34000</td></tr>
          <tr><th id="stub_1_5" scope="row" class="gt_row gt_left gt_stub">Audi</th>
      <th id="stub_1_5" scope="row" class="gt_row gt_left gt_stub">A4</th>
      <th id="stub_1_5" scope="row" class="gt_row gt_left gt_stub">Premium</th>
      <td headers="stub_1_5 year" class="gt_row gt_right">2021</td>
      <td headers="stub_1_5 hp" class="gt_row gt_right">261</td>
      <td headers="stub_1_5 msrp" class="gt_row gt_right">37000</td></tr>
        </tbody>
        
        <tfoot class="gt_footnotes">
          <tr>
            <td class="gt_footnote" colspan="6"><span class="gt_footnote_marks" style="white-space:nowrap;font-style:italic;font-weight:normal;line-height:0;"><sup>1</sup></span> Ford manufacturer</td>
          </tr>
          <tr>
            <td class="gt_footnote" colspan="6"><span class="gt_footnote_marks" style="white-space:nowrap;font-style:italic;font-weight:normal;line-height:0;"><sup>2</sup></span> GT model</td>
          </tr>
          <tr>
            <td class="gt_footnote" colspan="6"><span class="gt_footnote_marks" style="white-space:nowrap;font-style:italic;font-weight:normal;line-height:0;"><sup>3</sup></span> High horsepower</td>
          </tr>
          <tr>
            <td class="gt_footnote" colspan="6"><span class="gt_footnote_marks" style="white-space:nowrap;font-style:italic;font-weight:normal;line-height:0;"><sup>4</sup></span> Premium price</td>
          </tr>
        </tfoot>
      </table>

# Two-column stub footnotes

    Code
      cat(render_as_html(gt_tbl))
    Output
      <table class="gt_table" data-quarto-disable-processing="false" data-quarto-bootstrap="false">
        <thead>
          <tr class="gt_heading">
            <td colspan="6" class="gt_heading gt_title gt_font_normal gt_bottom_border" style>Two-Column Stub with Footnotes</td>
          </tr>
          
          <tr class="gt_col_headings">
            <th class="gt_col_heading gt_columns_bottom_border gt_left" rowspan="1" colspan="1" scope="col" id="a::stub1">Manufacturer</th>
            <th class="gt_col_heading gt_columns_bottom_border gt_left" rowspan="1" colspan="1" scope="col" id="a::stub2">Model</th>
            <th class="gt_col_heading gt_columns_bottom_border gt_left" rowspan="1" colspan="1" scope="col" id="trim">trim</th>
            <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id="year">year</th>
            <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id="hp">hp</th>
            <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id="msrp">msrp</th>
          </tr>
        </thead>
        <tbody class="gt_table_body">
          <tr><th id="stub_1_1" scope="row" class="gt_row gt_left gt_stub">Ford<span class="gt_footnote_marks" style="white-space:nowrap;font-style:italic;font-weight:normal;line-height:0;"><sup>1</sup></span></th>
      <th id="stub_1_1" scope="row" class="gt_row gt_left gt_stub">GT<span class="gt_footnote_marks" style="white-space:nowrap;font-style:italic;font-weight:normal;line-height:0;"><sup>2</sup></span></th>
      <td headers="stub_1_1 trim" class="gt_row gt_left">Base</td>
      <td headers="stub_1_1 year" class="gt_row gt_right">2017</td>
      <td headers="stub_1_1 hp" class="gt_row gt_right">647</td>
      <td headers="stub_1_1 msrp" class="gt_row gt_right">447000</td></tr>
          <tr><th id="stub_1_2" scope="row" class="gt_row gt_left gt_stub">Ford</th>
      <th id="stub_1_2" scope="row" class="gt_row gt_left gt_stub">F-150</th>
      <td headers="stub_1_2 trim" class="gt_row gt_left">XLT</td>
      <td headers="stub_1_2 year" class="gt_row gt_right">2018</td>
      <td headers="stub_1_2 hp" class="gt_row gt_right">450</td>
      <td headers="stub_1_2 msrp" class="gt_row gt_right">28000</td></tr>
          <tr><th id="stub_1_3" scope="rowgroup" rowspan="2" class="gt_row gt_left gt_stub">BMW</th>
      <th id="stub_1_3" scope="row" class="gt_row gt_left gt_stub">X5</th>
      <td headers="stub_1_3 trim" class="gt_row gt_left">xDrive35i</td>
      <td headers="stub_1_3 year" class="gt_row gt_right">2019</td>
      <td headers="stub_1_3 hp" class="gt_row gt_right">300</td>
      <td headers="stub_1_3 msrp" class="gt_row gt_right">57000</td></tr>
          <tr><th id="stub_1_4" scope="row" class="gt_row gt_left gt_stub">X3</th>
      <td headers="stub_1_4 stub_2" class="gt_row gt_left">sDrive28i</td>
      <td headers="stub_1_4 trim" class="gt_row gt_right">2020</td>
      <td headers="stub_1_4 year" class="gt_row gt_right">228</td>
      <td headers="stub_1_4 hp" class="gt_row gt_right">34000</td></tr>
          <tr><th id="stub_1_5" scope="row" class="gt_row gt_left gt_stub">Audi</th>
      <th id="stub_1_5" scope="row" class="gt_row gt_left gt_stub">A4</th>
      <td headers="stub_1_5 trim" class="gt_row gt_left">Premium</td>
      <td headers="stub_1_5 year" class="gt_row gt_right">2021</td>
      <td headers="stub_1_5 hp" class="gt_row gt_right">261</td>
      <td headers="stub_1_5 msrp" class="gt_row gt_right">37000</td></tr>
        </tbody>
        
        <tfoot class="gt_footnotes">
          <tr>
            <td class="gt_footnote" colspan="6"><span class="gt_footnote_marks" style="white-space:nowrap;font-style:italic;font-weight:normal;line-height:0;"><sup>1</sup></span> Ford manufacturer</td>
          </tr>
          <tr>
            <td class="gt_footnote" colspan="6"><span class="gt_footnote_marks" style="white-space:nowrap;font-style:italic;font-weight:normal;line-height:0;"><sup>2</sup></span> GT model</td>
          </tr>
        </tfoot>
      </table>

# Single stub column footnotes (regression test)

    Code
      cat(render_as_html(gt_tbl))
    Output
      <table class="gt_table" data-quarto-disable-processing="false" data-quarto-bootstrap="false">
        <thead>
          <tr class="gt_heading">
            <td colspan="6" class="gt_heading gt_title gt_font_normal gt_bottom_border" style>Single Stub Column</td>
          </tr>
          
          <tr class="gt_col_headings">
            <th class="gt_col_heading gt_columns_bottom_border gt_left" rowspan="1" colspan="1" scope="col" id="a::stub">Manufacturer</th>
            <th class="gt_col_heading gt_columns_bottom_border gt_left" rowspan="1" colspan="1" scope="col" id="model">model</th>
            <th class="gt_col_heading gt_columns_bottom_border gt_left" rowspan="1" colspan="1" scope="col" id="trim">trim</th>
            <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id="year">year</th>
            <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id="hp">hp</th>
            <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id="msrp">msrp</th>
          </tr>
        </thead>
        <tbody class="gt_table_body">
          <tr><th id="stub_1_1" scope="row" class="gt_row gt_left gt_stub">Ford<span class="gt_footnote_marks" style="white-space:nowrap;font-style:italic;font-weight:normal;line-height:0;"><sup>1</sup></span></th>
      <td headers="stub_1_1 model" class="gt_row gt_left">GT</td>
      <td headers="stub_1_1 trim" class="gt_row gt_left">Base</td>
      <td headers="stub_1_1 year" class="gt_row gt_right">2017</td>
      <td headers="stub_1_1 hp" class="gt_row gt_right">647</td>
      <td headers="stub_1_1 msrp" class="gt_row gt_right">447000</td></tr>
          <tr><th id="stub_1_2" scope="row" class="gt_row gt_left gt_stub">Ford</th>
      <td headers="stub_1_2 model" class="gt_row gt_left">F-150</td>
      <td headers="stub_1_2 trim" class="gt_row gt_left">XLT</td>
      <td headers="stub_1_2 year" class="gt_row gt_right">2018</td>
      <td headers="stub_1_2 hp" class="gt_row gt_right">450</td>
      <td headers="stub_1_2 msrp" class="gt_row gt_right">28000</td></tr>
          <tr><th id="stub_1_3" scope="row" class="gt_row gt_left gt_stub">BMW</th>
      <td headers="stub_1_3 model" class="gt_row gt_left">X5</td>
      <td headers="stub_1_3 trim" class="gt_row gt_left">xDrive35i</td>
      <td headers="stub_1_3 year" class="gt_row gt_right">2019</td>
      <td headers="stub_1_3 hp" class="gt_row gt_right">300</td>
      <td headers="stub_1_3 msrp" class="gt_row gt_right">57000</td></tr>
          <tr><th id="stub_1_4" scope="row" class="gt_row gt_left gt_stub">BMW</th>
      <td headers="stub_1_4 model" class="gt_row gt_left">X3</td>
      <td headers="stub_1_4 trim" class="gt_row gt_left">sDrive28i</td>
      <td headers="stub_1_4 year" class="gt_row gt_right">2020</td>
      <td headers="stub_1_4 hp" class="gt_row gt_right">228</td>
      <td headers="stub_1_4 msrp" class="gt_row gt_right">34000</td></tr>
          <tr><th id="stub_1_5" scope="row" class="gt_row gt_left gt_stub">Audi</th>
      <td headers="stub_1_5 model" class="gt_row gt_left">A4</td>
      <td headers="stub_1_5 trim" class="gt_row gt_left">Premium</td>
      <td headers="stub_1_5 year" class="gt_row gt_right">2021</td>
      <td headers="stub_1_5 hp" class="gt_row gt_right">261</td>
      <td headers="stub_1_5 msrp" class="gt_row gt_right">37000</td></tr>
        </tbody>
        
        <tfoot class="gt_footnotes">
          <tr>
            <td class="gt_footnote" colspan="6"><span class="gt_footnote_marks" style="white-space:nowrap;font-style:italic;font-weight:normal;line-height:0;"><sup>1</sup></span> Ford manufacturer</td>
          </tr>
        </tfoot>
      </table>

# Footnotes with specific row references

    Code
      cat(render_as_html(gt_tbl))
    Output
      <table class="gt_table" data-quarto-disable-processing="false" data-quarto-bootstrap="false">
        <thead>
          <tr class="gt_heading">
            <td colspan="6" class="gt_heading gt_title gt_font_normal gt_bottom_border" style>Specific Row References</td>
          </tr>
          
          <tr class="gt_col_headings">
            <th class="gt_col_heading gt_columns_bottom_border gt_left" rowspan="1" colspan="1" scope="col" id="a::stub1">Manufacturer</th>
            <th class="gt_col_heading gt_columns_bottom_border gt_left" rowspan="1" colspan="1" scope="col" id="a::stub2">Model</th>
            <th class="gt_col_heading gt_columns_bottom_border gt_left" rowspan="1" colspan="1" scope="col" id="a::stub3">Trim</th>
            <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id="year">year</th>
            <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id="hp">hp</th>
            <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id="msrp">msrp</th>
          </tr>
        </thead>
        <tbody class="gt_table_body">
          <tr><th id="stub_1_1" scope="row" class="gt_row gt_left gt_stub">Ford<span class="gt_footnote_marks" style="white-space:nowrap;font-style:italic;font-weight:normal;line-height:0;"><sup>1</sup></span></th>
      <th id="stub_1_1" scope="row" class="gt_row gt_left gt_stub">GT</th>
      <th id="stub_1_1" scope="row" class="gt_row gt_left gt_stub">Base</th>
      <td headers="stub_1_1 year" class="gt_row gt_right">2017</td>
      <td headers="stub_1_1 hp" class="gt_row gt_right">647</td>
      <td headers="stub_1_1 msrp" class="gt_row gt_right">447000</td></tr>
          <tr><th id="stub_1_2" scope="row" class="gt_row gt_left gt_stub">Ford</th>
      <th id="stub_1_2" scope="row" class="gt_row gt_left gt_stub">F-150</th>
      <th id="stub_1_2" scope="row" class="gt_row gt_left gt_stub">XLT</th>
      <td headers="stub_1_2 year" class="gt_row gt_right">2018</td>
      <td headers="stub_1_2 hp" class="gt_row gt_right">450</td>
      <td headers="stub_1_2 msrp" class="gt_row gt_right">28000</td></tr>
          <tr><th id="stub_1_3" scope="row" class="gt_row gt_left gt_stub">BMW<span class="gt_footnote_marks" style="white-space:nowrap;font-style:italic;font-weight:normal;line-height:0;"><sup>2</sup></span></th>
      <th id="stub_1_3" scope="row" class="gt_row gt_left gt_stub">X5</th>
      <th id="stub_1_3" scope="row" class="gt_row gt_left gt_stub">xDrive35i</th>
      <td headers="stub_1_3 year" class="gt_row gt_right">2019</td>
      <td headers="stub_1_3 hp" class="gt_row gt_right">300</td>
      <td headers="stub_1_3 msrp" class="gt_row gt_right">57000</td></tr>
          <tr><th id="stub_1_4" scope="row" class="gt_row gt_left gt_stub">BMW</th>
      <th id="stub_1_4" scope="row" class="gt_row gt_left gt_stub">X3</th>
      <th id="stub_1_4" scope="row" class="gt_row gt_left gt_stub">sDrive28i</th>
      <td headers="stub_1_4 year" class="gt_row gt_right">2020</td>
      <td headers="stub_1_4 hp" class="gt_row gt_right">228</td>
      <td headers="stub_1_4 msrp" class="gt_row gt_right">34000</td></tr>
          <tr><th id="stub_1_5" scope="row" class="gt_row gt_left gt_stub">Audi</th>
      <th id="stub_1_5" scope="row" class="gt_row gt_left gt_stub">A4</th>
      <th id="stub_1_5" scope="row" class="gt_row gt_left gt_stub">Premium</th>
      <td headers="stub_1_5 year" class="gt_row gt_right">2021</td>
      <td headers="stub_1_5 hp" class="gt_row gt_right">261</td>
      <td headers="stub_1_5 msrp" class="gt_row gt_right">37000</td></tr>
        </tbody>
        
        <tfoot class="gt_footnotes">
          <tr>
            <td class="gt_footnote" colspan="6"><span class="gt_footnote_marks" style="white-space:nowrap;font-style:italic;font-weight:normal;line-height:0;"><sup>1</sup></span> Ford note</td>
          </tr>
          <tr>
            <td class="gt_footnote" colspan="6"><span class="gt_footnote_marks" style="white-space:nowrap;font-style:italic;font-weight:normal;line-height:0;"><sup>2</sup></span> BMW note</td>
          </tr>
        </tfoot>
      </table>

