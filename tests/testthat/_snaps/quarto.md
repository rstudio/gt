# Quarto produces the valid output

    Code
      cat(render_as_html(gt_tbl))
    Output
      <table class="gt_table" data-quarto-disable-processing="false" data-quarto-bootstrap="false">
        <thead>
          <tr class="gt_heading">
            <td colspan="4" class="gt_heading gt_title gt_font_normal gt_bottom_border" style><span data-qmd-base64="W2dvZ10oaHR0cHM6Ly9nb29nbGUuY29tKQ=="><span class='gt_from_md'><a href="https://google.com">gog</a></span></span></td>
          </tr>
          
          <tr class="gt_col_headings gt_spanner_row">
            <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="2" colspan="1" scope="col" id="num">num</th>
            <th class="gt_center gt_columns_top_border gt_column_spanner_outer" rowspan="1" colspan="2" scope="colgroup" id="problem">
              <div class="gt_column_spanner"><span data-qmd-base64="cHJvYmxlbQ=="><span class='gt_from_md'>problem</span></span></div>
            </th>
            <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="2" colspan="1" scope="col" id="x">x</th>
          </tr>
          <tr class="gt_col_headings">
            <th class="gt_col_heading gt_columns_bottom_border gt_left" rowspan="1" colspan="1" scope="col" id="char">char<span class="gt_footnote_marks" style="white-space:nowrap;font-style:italic;font-weight:normal;line-height:0;"><sup>1</sup></span></th>
            <th class="gt_col_heading gt_columns_bottom_border gt_center" rowspan="1" colspan="1" scope="col" id="fctr"><span data-qmd-base64="RmFjdG9y"><span class='gt_from_md'>Factor</span></span><span class="gt_footnote_marks" style="white-space:nowrap;font-style:italic;font-weight:normal;line-height:0;"><sup>2</sup></span></th>
          </tr>
        </thead>
        <tbody class="gt_table_body">
          <tr><td headers="num" class="gt_row gt_right"><span class="gt_footnote_marks" style="white-space:nowrap;font-style:italic;font-weight:normal;line-height:0;"><sup>3</sup></span> <span data-qmd-base64="MC4xMTEx"><span class='gt_from_md'>0.1111</span></span></td>
      <td headers="char" class="gt_row gt_left">apricot</td>
      <td headers="fctr" class="gt_row gt_center">one</td>
      <td headers="x" class="gt_row gt_right">- 1</td></tr>
          <tr><td headers="num" class="gt_row gt_right"><span data-qmd-base64="Mi4yMjI="><span class='gt_from_md'>2.222</span></span></td>
      <td headers="char" class="gt_row gt_left">banana</td>
      <td headers="fctr" class="gt_row gt_center">two</td>
      <td headers="x" class="gt_row gt_right">- 1</td></tr>
          <tr><td headers="num" class="gt_row gt_right"><span data-qmd-base64="MzMuMzM="><span class='gt_from_md'>33.33</span></span></td>
      <td headers="char" class="gt_row gt_left">coconut</td>
      <td headers="fctr" class="gt_row gt_center">three</td>
      <td headers="x" class="gt_row gt_right">- 1</td></tr>
          <tr><td headers="num" class="gt_row gt_right"><span data-qmd-base64="NDQ0LjQ="><span class='gt_from_md'>444.4</span></span></td>
      <td headers="char" class="gt_row gt_left">durian</td>
      <td headers="fctr" class="gt_row gt_center">four</td>
      <td headers="x" class="gt_row gt_right">- 1</td></tr>
          <tr><td headers="num" class="gt_row gt_right"><span data-qmd-base64="NTU1MA=="><span class='gt_from_md'>5550</span></span></td>
      <td headers="char" class="gt_row gt_left">NA</td>
      <td headers="fctr" class="gt_row gt_center">five</td>
      <td headers="x" class="gt_row gt_right">- 1</td></tr>
        </tbody>
        <tfoot>
          <tr class="gt_footnotes">
            <td class="gt_footnote" colspan="4"><span class="gt_footnote_marks" style="white-space:nowrap;font-style:italic;font-weight:normal;line-height:0;"><sup>1</sup></span> Not a problem</td>
          </tr>
          <tr class="gt_footnotes">
            <td class="gt_footnote" colspan="4"><span class="gt_footnote_marks" style="white-space:nowrap;font-style:italic;font-weight:normal;line-height:0;"><sup>2</sup></span> A problem because fctr is labelled with md</td>
          </tr>
          <tr class="gt_footnotes">
            <td class="gt_footnote" colspan="4"><span class="gt_footnote_marks" style="white-space:nowrap;font-style:italic;font-weight:normal;line-height:0;"><sup>3</sup></span> <span data-qmd-base64="UHJvYmxlbSBiZWNhdXNlIG51bSByb3cgMSBpcyBgZm10X21hcmtkb3duKClgICsgYWxzbyB0aGUgZm9vdG5vdGUgaXMgd3JhcHBlZCBpbiBtZC4="><span class='gt_from_md'>Problem because num row 1 is <code>fmt_markdown()</code> + also the footnote is wrapped in md.</span></span></td>
          </tr>
        </tfoot>
      </table>

---

    Code
      as.character(as_latex(gt_tbl))
    Output
      [1] "\\begin{table}\n\\caption*{\n{\\fontsize{20}{25}\\selectfont  \\href{https://google.com}{gog}\\fontsize{12}{15}\\selectfont }\n} \n\\fontsize{12.0pt}{14.0pt}\\selectfont\n\\begin{tabular*}{\\linewidth}{@{\\extracolsep{\\fill}}rlcr}\n\\toprule\n & \\multicolumn{2}{c}{problem} &  \\\\ \n\\cmidrule(lr){2-3}\nnum & char\\textsuperscript{\\textit{1}} & Factor\\textsuperscript{\\textit{2}} & x \\\\ \n\\midrule\\addlinespace[2.5pt]\n0.1111\\textsuperscript{\\textit{3}} & apricot & one & - 1 \\\\ \n2.222 & banana & two & - 1 \\\\ \n33.33 & coconut & three & - 1 \\\\ \n444.4 & durian & four & - 1 \\\\ \n5550 & NA & five & - 1 \\\\ \n\\bottomrule\n\\end{tabular*}\n\\begin{minipage}{\\linewidth}\n\\vspace{.05em}\n\\textsuperscript{\\textit{1}} Not a problem\\\\\n\\textsuperscript{\\textit{2}} A problem because fctr is labelled with md\\\\\n\\textsuperscript{\\textit{3}} Problem because num row 1 is \\texttt{fmt\\_markdown()} + also the footnote is wrapped in md.\\\\\n\\end{minipage}\n\\end{table}\n"

