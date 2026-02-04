# complex footnotes with hidden rows render correctly

    Code
      cat(render_as_html(gt_tbl))
    Output
      <table class="gt_table" data-quarto-disable-processing="false" data-quarto-bootstrap="false">
        <thead>
          <tr class="gt_col_headings">
            <th class="gt_col_heading gt_columns_bottom_border gt_left" rowspan="1" colspan="1" scope="col" id="a::stub"></th>
            <th class="gt_col_heading gt_columns_bottom_border gt_left" rowspan="1" colspan="1" scope="col" id="country_name">country_name</th>
            <th class="gt_col_heading gt_columns_bottom_border gt_left" rowspan="1" colspan="1" scope="col" id="country_code_2">country_code_2</th>
            <th class="gt_col_heading gt_columns_bottom_border gt_left" rowspan="1" colspan="1" scope="col" id="country_code_3">country_code_3</th>
            <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id="population">population</th>
          </tr>
        </thead>
        <tbody class="gt_table_body">
          <tr><th id="stub_1_1" scope="row" class="gt_row gt_right gt_stub">2017</th>
      <td headers="stub_1_1 country_name" class="gt_row gt_left">Brazil</td>
      <td headers="stub_1_1 country_code_2" class="gt_row gt_left">BR</td>
      <td headers="stub_1_1 country_code_3" class="gt_row gt_left">BRA</td>
      <td headers="stub_1_1 population" class="gt_row gt_right"><span class="gt_footnote_marks" style="white-space:nowrap;font-style:italic;font-weight:normal;line-height:0;"><sup>1,2</sup></span> 204,703,445</td></tr>
          <tr><th id="stub_1_2" scope="row" class="gt_row gt_right gt_stub">2019</th>
      <td headers="stub_1_2 country_name" class="gt_row gt_left">Brazil</td>
      <td headers="stub_1_2 country_code_2" class="gt_row gt_left">BR</td>
      <td headers="stub_1_2 country_code_3" class="gt_row gt_left">BRA</td>
      <td headers="stub_1_2 population" class="gt_row gt_right"><span class="gt_footnote_marks" style="white-space:nowrap;font-style:italic;font-weight:normal;line-height:0;"><sup>3,4,5</sup></span> 207,455,459</td></tr>
          <tr><th id="stub_1_3" scope="row" class="gt_row gt_right gt_stub">2021</th>
      <td headers="stub_1_3 country_name" class="gt_row gt_left">Brazil</td>
      <td headers="stub_1_3 country_code_2" class="gt_row gt_left">BR</td>
      <td headers="stub_1_3 country_code_3" class="gt_row gt_left">BRA</td>
      <td headers="stub_1_3 population" class="gt_row gt_right"><span class="gt_footnote_marks" style="white-space:nowrap;font-style:italic;font-weight:normal;line-height:0;"><sup>6,7</sup></span> 209,550,294</td></tr>
        </tbody>
        <tfoot>
          <tr class="gt_footnotes">
            <td class="gt_footnote" colspan="5"><span class="gt_footnote_marks" style="white-space:nowrap;font-style:italic;font-weight:normal;line-height:0;"><sup>1</sup></span> 2017</td>
          </tr>
          <tr class="gt_footnotes">
            <td class="gt_footnote" colspan="5"><span class="gt_footnote_marks" style="white-space:nowrap;font-style:italic;font-weight:normal;line-height:0;"><sup>2</sup></span> 2017-2018</td>
          </tr>
          <tr class="gt_footnotes">
            <td class="gt_footnote" colspan="5"><span class="gt_footnote_marks" style="white-space:nowrap;font-style:italic;font-weight:normal;line-height:0;"><sup>3</sup></span> 2019</td>
          </tr>
          <tr class="gt_footnotes">
            <td class="gt_footnote" colspan="5"><span class="gt_footnote_marks" style="white-space:nowrap;font-style:italic;font-weight:normal;line-height:0;"><sup>4</sup></span> 2018-2019</td>
          </tr>
          <tr class="gt_footnotes">
            <td class="gt_footnote" colspan="5"><span class="gt_footnote_marks" style="white-space:nowrap;font-style:italic;font-weight:normal;line-height:0;"><sup>5</sup></span> 2019-2020</td>
          </tr>
          <tr class="gt_footnotes">
            <td class="gt_footnote" colspan="5"><span class="gt_footnote_marks" style="white-space:nowrap;font-style:italic;font-weight:normal;line-height:0;"><sup>6</sup></span> 2021</td>
          </tr>
          <tr class="gt_footnotes">
            <td class="gt_footnote" colspan="5"><span class="gt_footnote_marks" style="white-space:nowrap;font-style:italic;font-weight:normal;line-height:0;"><sup>7</sup></span> 2020-2021</td>
          </tr>
        </tfoot>
      </table>

