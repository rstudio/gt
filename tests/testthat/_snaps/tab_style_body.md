# tab_style_body() works correctly

    Code
      cat(render_as_html(gt_tbl))
    Output
      <table class="gt_table" data-quarto-disable-processing="false" data-quarto-bootstrap="false">
        <thead>
          <tr class="gt_col_headings">
            <th class="gt_col_heading gt_columns_bottom_border gt_left" rowspan="1" colspan="1" scope="col" id="a::stub"></th>
            <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id="open">open</th>
            <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id="high">high</th>
            <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id="low">low</th>
            <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id="close">close</th>
          </tr>
        </thead>
        <tbody class="gt_table_body">
          <tr class="gt_group_heading_row">
            <th colspan="5" class="gt_group_heading" scope="colgroup" id="W02">W02</th>
          </tr>
          <tr class="gt_row_group_first"><th id="stub_1_1" scope="row" class="gt_row gt_right gt_stub">2015-01-05</th>
      <td headers="W02 stub_1_1 open" class="gt_row gt_right">2054.44</td>
      <td headers="W02 stub_1_1 high" class="gt_row gt_right">2054.44</td>
      <td headers="W02 stub_1_1 low" class="gt_row gt_right">2017.34</td>
      <td headers="W02 stub_1_1 close" class="gt_row gt_right">2020.58</td></tr>
          <tr><th id="stub_1_2" scope="row" class="gt_row gt_right gt_stub">2015-01-06</th>
      <td headers="W02 stub_1_2 open" class="gt_row gt_right">2022.15</td>
      <td headers="W02 stub_1_2 high" class="gt_row gt_right" style="background-color: #FFA500;">2030.25</td>
      <td headers="W02 stub_1_2 low" class="gt_row gt_right">1992.44</td>
      <td headers="W02 stub_1_2 close" class="gt_row gt_right">2002.61</td></tr>
          <tr><th id="stub_1_3" scope="row" class="gt_row gt_right gt_stub">2015-01-07</th>
      <td headers="W02 stub_1_3 open" class="gt_row gt_right">2005.55</td>
      <td headers="W02 stub_1_3 high" class="gt_row gt_right">2029.61</td>
      <td headers="W02 stub_1_3 low" class="gt_row gt_right">2005.55</td>
      <td headers="W02 stub_1_3 close" class="gt_row gt_right">2025.90</td></tr>
          <tr><th id="stub_1_4" scope="row" class="gt_row gt_right gt_stub">2015-01-08</th>
      <td headers="W02 stub_1_4 open" class="gt_row gt_right">2030.61</td>
      <td headers="W02 stub_1_4 high" class="gt_row gt_right">2064.08</td>
      <td headers="W02 stub_1_4 low" class="gt_row gt_right">2030.61</td>
      <td headers="W02 stub_1_4 close" class="gt_row gt_right">2062.14</td></tr>
          <tr><th id="stub_1_5" scope="row" class="gt_row gt_right gt_stub">2015-01-09</th>
      <td headers="W02 stub_1_5 open" class="gt_row gt_right">2063.45</td>
      <td headers="W02 stub_1_5 high" class="gt_row gt_right">2064.43</td>
      <td headers="W02 stub_1_5 low" class="gt_row gt_right">2038.33</td>
      <td headers="W02 stub_1_5 close" class="gt_row gt_right">2044.81</td></tr>
          <tr class="gt_group_heading_row">
            <th colspan="5" class="gt_group_heading" scope="colgroup" id="W03">W03</th>
          </tr>
          <tr class="gt_row_group_first"><th id="stub_1_6" scope="row" class="gt_row gt_right gt_stub">2015-01-12</th>
      <td headers="W03 stub_1_6 open" class="gt_row gt_right" style="background-color: #FFA500;">2046.13</td>
      <td headers="W03 stub_1_6 high" class="gt_row gt_right">2049.30</td>
      <td headers="W03 stub_1_6 low" class="gt_row gt_right">2022.58</td>
      <td headers="W03 stub_1_6 close" class="gt_row gt_right" style="background-color: #FFA500;">2028.26</td></tr>
          <tr><th id="stub_1_7" scope="row" class="gt_row gt_right gt_stub">2015-01-13</th>
      <td headers="W03 stub_1_7 open" class="gt_row gt_right">2031.58</td>
      <td headers="W03 stub_1_7 high" class="gt_row gt_right">2056.93</td>
      <td headers="W03 stub_1_7 low" class="gt_row gt_right">2008.25</td>
      <td headers="W03 stub_1_7 close" class="gt_row gt_right">2023.03</td></tr>
          <tr><th id="stub_1_8" scope="row" class="gt_row gt_right gt_stub">2015-01-14</th>
      <td headers="W03 stub_1_8 open" class="gt_row gt_right" style="background-color: #FFA500;">2018.40</td>
      <td headers="W03 stub_1_8 high" class="gt_row gt_right" style="background-color: #FFA500;">2018.40</td>
      <td headers="W03 stub_1_8 low" class="gt_row gt_right">1988.44</td>
      <td headers="W03 stub_1_8 close" class="gt_row gt_right">2011.27</td></tr>
          <tr><th id="stub_1_9" scope="row" class="gt_row gt_right gt_stub">2015-01-15</th>
      <td headers="W03 stub_1_9 open" class="gt_row gt_right">2013.75</td>
      <td headers="W03 stub_1_9 high" class="gt_row gt_right">2021.35</td>
      <td headers="W03 stub_1_9 low" class="gt_row gt_right">1991.47</td>
      <td headers="W03 stub_1_9 close" class="gt_row gt_right">1992.67</td></tr>
          <tr><th id="stub_1_10" scope="row" class="gt_row gt_right gt_stub">2015-01-16</th>
      <td headers="W03 stub_1_10 open" class="gt_row gt_right">1992.25</td>
      <td headers="W03 stub_1_10 high" class="gt_row gt_right">2020.46</td>
      <td headers="W03 stub_1_10 low" class="gt_row gt_right" style="background-color: #FFA500;">1988.12</td>
      <td headers="W03 stub_1_10 close" class="gt_row gt_right">2019.42</td></tr>
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
            <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id="open">open</th>
            <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id="high">high</th>
            <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id="low">low</th>
            <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id="close">close</th>
          </tr>
        </thead>
        <tbody class="gt_table_body">
          <tr class="gt_group_heading_row">
            <th colspan="5" class="gt_group_heading" scope="colgroup" id="W02">W02</th>
          </tr>
          <tr class="gt_row_group_first"><th id="stub_1_1" scope="row" class="gt_row gt_right gt_stub">2015-01-05</th>
      <td headers="W02 stub_1_1 open" class="gt_row gt_right">2054.44</td>
      <td headers="W02 stub_1_1 high" class="gt_row gt_right">2054.44</td>
      <td headers="W02 stub_1_1 low" class="gt_row gt_right">2017.34</td>
      <td headers="W02 stub_1_1 close" class="gt_row gt_right">2020.58</td></tr>
          <tr><th id="stub_1_2" scope="row" class="gt_row gt_right gt_stub">2015-01-06</th>
      <td headers="W02 stub_1_2 open" class="gt_row gt_right">2022.15</td>
      <td headers="W02 stub_1_2 high" class="gt_row gt_right" style="color: #FFFFFF; font-family: Inter; background-color: #FF0000; border-left-width: 4px; border-left-style: solid; border-left-color: steelblue; border-right-width: 4px; border-right-style: solid; border-right-color: steelblue;">2030.25</td>
      <td headers="W02 stub_1_2 low" class="gt_row gt_right">1992.44</td>
      <td headers="W02 stub_1_2 close" class="gt_row gt_right">2002.61</td></tr>
          <tr><th id="stub_1_3" scope="row" class="gt_row gt_right gt_stub">2015-01-07</th>
      <td headers="W02 stub_1_3 open" class="gt_row gt_right">2005.55</td>
      <td headers="W02 stub_1_3 high" class="gt_row gt_right">2029.61</td>
      <td headers="W02 stub_1_3 low" class="gt_row gt_right">2005.55</td>
      <td headers="W02 stub_1_3 close" class="gt_row gt_right">2025.90</td></tr>
          <tr><th id="stub_1_4" scope="row" class="gt_row gt_right gt_stub">2015-01-08</th>
      <td headers="W02 stub_1_4 open" class="gt_row gt_right">2030.61</td>
      <td headers="W02 stub_1_4 high" class="gt_row gt_right">2064.08</td>
      <td headers="W02 stub_1_4 low" class="gt_row gt_right">2030.61</td>
      <td headers="W02 stub_1_4 close" class="gt_row gt_right">2062.14</td></tr>
          <tr><th id="stub_1_5" scope="row" class="gt_row gt_right gt_stub">2015-01-09</th>
      <td headers="W02 stub_1_5 open" class="gt_row gt_right">2063.45</td>
      <td headers="W02 stub_1_5 high" class="gt_row gt_right">2064.43</td>
      <td headers="W02 stub_1_5 low" class="gt_row gt_right">2038.33</td>
      <td headers="W02 stub_1_5 close" class="gt_row gt_right">2044.81</td></tr>
          <tr class="gt_group_heading_row">
            <th colspan="5" class="gt_group_heading" scope="colgroup" id="W03">W03</th>
          </tr>
          <tr class="gt_row_group_first"><th id="stub_1_6" scope="row" class="gt_row gt_right gt_stub">2015-01-12</th>
      <td headers="W03 stub_1_6 open" class="gt_row gt_right" style="color: #FFFFFF; font-family: Inter; background-color: #FF0000; border-left-width: 4px; border-left-style: solid; border-left-color: steelblue; border-right-width: 4px; border-right-style: solid; border-right-color: steelblue;">2046.13</td>
      <td headers="W03 stub_1_6 high" class="gt_row gt_right">2049.30</td>
      <td headers="W03 stub_1_6 low" class="gt_row gt_right">2022.58</td>
      <td headers="W03 stub_1_6 close" class="gt_row gt_right" style="color: #FFFFFF; font-family: Inter; background-color: #FF0000; border-left-width: 4px; border-left-style: solid; border-left-color: steelblue; border-right-width: 4px; border-right-style: solid; border-right-color: steelblue;">2028.26</td></tr>
          <tr><th id="stub_1_7" scope="row" class="gt_row gt_right gt_stub">2015-01-13</th>
      <td headers="W03 stub_1_7 open" class="gt_row gt_right">2031.58</td>
      <td headers="W03 stub_1_7 high" class="gt_row gt_right">2056.93</td>
      <td headers="W03 stub_1_7 low" class="gt_row gt_right">2008.25</td>
      <td headers="W03 stub_1_7 close" class="gt_row gt_right">2023.03</td></tr>
          <tr><th id="stub_1_8" scope="row" class="gt_row gt_right gt_stub">2015-01-14</th>
      <td headers="W03 stub_1_8 open" class="gt_row gt_right" style="color: #FFFFFF; font-family: Inter; background-color: #FF0000; border-left-width: 4px; border-left-style: solid; border-left-color: steelblue; border-right-width: 4px; border-right-style: solid; border-right-color: steelblue;">2018.40</td>
      <td headers="W03 stub_1_8 high" class="gt_row gt_right" style="color: #FFFFFF; font-family: Inter; background-color: #FF0000; border-left-width: 4px; border-left-style: solid; border-left-color: steelblue; border-right-width: 4px; border-right-style: solid; border-right-color: steelblue;">2018.40</td>
      <td headers="W03 stub_1_8 low" class="gt_row gt_right">1988.44</td>
      <td headers="W03 stub_1_8 close" class="gt_row gt_right">2011.27</td></tr>
          <tr><th id="stub_1_9" scope="row" class="gt_row gt_right gt_stub">2015-01-15</th>
      <td headers="W03 stub_1_9 open" class="gt_row gt_right">2013.75</td>
      <td headers="W03 stub_1_9 high" class="gt_row gt_right">2021.35</td>
      <td headers="W03 stub_1_9 low" class="gt_row gt_right">1991.47</td>
      <td headers="W03 stub_1_9 close" class="gt_row gt_right">1992.67</td></tr>
          <tr><th id="stub_1_10" scope="row" class="gt_row gt_right gt_stub">2015-01-16</th>
      <td headers="W03 stub_1_10 open" class="gt_row gt_right">1992.25</td>
      <td headers="W03 stub_1_10 high" class="gt_row gt_right">2020.46</td>
      <td headers="W03 stub_1_10 low" class="gt_row gt_right" style="color: #FFFFFF; font-family: Inter; background-color: #FF0000; border-left-width: 4px; border-left-style: solid; border-left-color: steelblue; border-right-width: 4px; border-right-style: solid; border-right-color: steelblue;">1988.12</td>
      <td headers="W03 stub_1_10 close" class="gt_row gt_right">2019.42</td></tr>
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
            <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id="open">open</th>
            <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id="high">high</th>
            <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id="low">low</th>
            <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id="close">close</th>
          </tr>
        </thead>
        <tbody class="gt_table_body">
          <tr class="gt_group_heading_row">
            <th colspan="5" class="gt_group_heading" scope="colgroup" id="W02">W02</th>
          </tr>
          <tr class="gt_row_group_first"><th id="stub_1_1" scope="row" class="gt_row gt_right gt_stub">2015-01-05</th>
      <td headers="W02 stub_1_1 open" class="gt_row gt_right">2054.44</td>
      <td headers="W02 stub_1_1 high" class="gt_row gt_right">2054.44</td>
      <td headers="W02 stub_1_1 low" class="gt_row gt_right">2017.34</td>
      <td headers="W02 stub_1_1 close" class="gt_row gt_right">2020.58</td></tr>
          <tr><th id="stub_1_2" scope="row" class="gt_row gt_right gt_stub">2015-01-06</th>
      <td headers="W02 stub_1_2 open" class="gt_row gt_right" style="background-color: #FFA500;">2022.15</td>
      <td headers="W02 stub_1_2 high" class="gt_row gt_right" style="background-color: #FFA500;">2030.25</td>
      <td headers="W02 stub_1_2 low" class="gt_row gt_right" style="background-color: #FFA500;">1992.44</td>
      <td headers="W02 stub_1_2 close" class="gt_row gt_right" style="background-color: #FFA500;">2002.61</td></tr>
          <tr><th id="stub_1_3" scope="row" class="gt_row gt_right gt_stub">2015-01-07</th>
      <td headers="W02 stub_1_3 open" class="gt_row gt_right">2005.55</td>
      <td headers="W02 stub_1_3 high" class="gt_row gt_right">2029.61</td>
      <td headers="W02 stub_1_3 low" class="gt_row gt_right">2005.55</td>
      <td headers="W02 stub_1_3 close" class="gt_row gt_right">2025.90</td></tr>
          <tr><th id="stub_1_4" scope="row" class="gt_row gt_right gt_stub">2015-01-08</th>
      <td headers="W02 stub_1_4 open" class="gt_row gt_right">2030.61</td>
      <td headers="W02 stub_1_4 high" class="gt_row gt_right">2064.08</td>
      <td headers="W02 stub_1_4 low" class="gt_row gt_right">2030.61</td>
      <td headers="W02 stub_1_4 close" class="gt_row gt_right">2062.14</td></tr>
          <tr><th id="stub_1_5" scope="row" class="gt_row gt_right gt_stub">2015-01-09</th>
      <td headers="W02 stub_1_5 open" class="gt_row gt_right">2063.45</td>
      <td headers="W02 stub_1_5 high" class="gt_row gt_right">2064.43</td>
      <td headers="W02 stub_1_5 low" class="gt_row gt_right">2038.33</td>
      <td headers="W02 stub_1_5 close" class="gt_row gt_right">2044.81</td></tr>
          <tr class="gt_group_heading_row">
            <th colspan="5" class="gt_group_heading" scope="colgroup" id="W03">W03</th>
          </tr>
          <tr class="gt_row_group_first"><th id="stub_1_6" scope="row" class="gt_row gt_right gt_stub">2015-01-12</th>
      <td headers="W03 stub_1_6 open" class="gt_row gt_right">2046.13</td>
      <td headers="W03 stub_1_6 high" class="gt_row gt_right">2049.30</td>
      <td headers="W03 stub_1_6 low" class="gt_row gt_right">2022.58</td>
      <td headers="W03 stub_1_6 close" class="gt_row gt_right">2028.26</td></tr>
          <tr><th id="stub_1_7" scope="row" class="gt_row gt_right gt_stub">2015-01-13</th>
      <td headers="W03 stub_1_7 open" class="gt_row gt_right">2031.58</td>
      <td headers="W03 stub_1_7 high" class="gt_row gt_right">2056.93</td>
      <td headers="W03 stub_1_7 low" class="gt_row gt_right">2008.25</td>
      <td headers="W03 stub_1_7 close" class="gt_row gt_right">2023.03</td></tr>
          <tr><th id="stub_1_8" scope="row" class="gt_row gt_right gt_stub">2015-01-14</th>
      <td headers="W03 stub_1_8 open" class="gt_row gt_right">2018.40</td>
      <td headers="W03 stub_1_8 high" class="gt_row gt_right">2018.40</td>
      <td headers="W03 stub_1_8 low" class="gt_row gt_right">1988.44</td>
      <td headers="W03 stub_1_8 close" class="gt_row gt_right">2011.27</td></tr>
          <tr><th id="stub_1_9" scope="row" class="gt_row gt_right gt_stub">2015-01-15</th>
      <td headers="W03 stub_1_9 open" class="gt_row gt_right">2013.75</td>
      <td headers="W03 stub_1_9 high" class="gt_row gt_right">2021.35</td>
      <td headers="W03 stub_1_9 low" class="gt_row gt_right">1991.47</td>
      <td headers="W03 stub_1_9 close" class="gt_row gt_right">1992.67</td></tr>
          <tr><th id="stub_1_10" scope="row" class="gt_row gt_right gt_stub">2015-01-16</th>
      <td headers="W03 stub_1_10 open" class="gt_row gt_right" style="background-color: #FFA500;">1992.25</td>
      <td headers="W03 stub_1_10 high" class="gt_row gt_right" style="background-color: #FFA500;">2020.46</td>
      <td headers="W03 stub_1_10 low" class="gt_row gt_right" style="background-color: #FFA500;">1988.12</td>
      <td headers="W03 stub_1_10 close" class="gt_row gt_right" style="background-color: #FFA500;">2019.42</td></tr>
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
            <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id="open">open</th>
            <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id="high">high</th>
            <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id="low">low</th>
            <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id="close">close</th>
          </tr>
        </thead>
        <tbody class="gt_table_body">
          <tr class="gt_group_heading_row">
            <th colspan="5" class="gt_group_heading" scope="colgroup" id="W02">W02</th>
          </tr>
          <tr class="gt_row_group_first"><th id="stub_1_1" scope="row" class="gt_row gt_right gt_stub">2015-01-05</th>
      <td headers="W02 stub_1_1 open" class="gt_row gt_right">2054.44</td>
      <td headers="W02 stub_1_1 high" class="gt_row gt_right" style="background-color: #FFA500;">2054.44</td>
      <td headers="W02 stub_1_1 low" class="gt_row gt_right" style="background-color: #FFA500;">2017.34</td>
      <td headers="W02 stub_1_1 close" class="gt_row gt_right">2020.58</td></tr>
          <tr><th id="stub_1_2" scope="row" class="gt_row gt_right gt_stub">2015-01-06</th>
      <td headers="W02 stub_1_2 open" class="gt_row gt_right">2022.15</td>
      <td headers="W02 stub_1_2 high" class="gt_row gt_right" style="background-color: #FFA500;">2030.25</td>
      <td headers="W02 stub_1_2 low" class="gt_row gt_right" style="background-color: #FFA500;">1992.44</td>
      <td headers="W02 stub_1_2 close" class="gt_row gt_right">2002.61</td></tr>
          <tr><th id="stub_1_3" scope="row" class="gt_row gt_right gt_stub">2015-01-07</th>
      <td headers="W02 stub_1_3 open" class="gt_row gt_right">2005.55</td>
      <td headers="W02 stub_1_3 high" class="gt_row gt_right" style="background-color: #FFA500;">2029.61</td>
      <td headers="W02 stub_1_3 low" class="gt_row gt_right" style="background-color: #FFA500;">2005.55</td>
      <td headers="W02 stub_1_3 close" class="gt_row gt_right">2025.90</td></tr>
          <tr><th id="stub_1_4" scope="row" class="gt_row gt_right gt_stub">2015-01-08</th>
      <td headers="W02 stub_1_4 open" class="gt_row gt_right">2030.61</td>
      <td headers="W02 stub_1_4 high" class="gt_row gt_right" style="background-color: #FFA500;">2064.08</td>
      <td headers="W02 stub_1_4 low" class="gt_row gt_right" style="background-color: #FFA500;">2030.61</td>
      <td headers="W02 stub_1_4 close" class="gt_row gt_right">2062.14</td></tr>
          <tr><th id="stub_1_5" scope="row" class="gt_row gt_right gt_stub">2015-01-09</th>
      <td headers="W02 stub_1_5 open" class="gt_row gt_right">2063.45</td>
      <td headers="W02 stub_1_5 high" class="gt_row gt_right" style="background-color: #FFA500;">2064.43</td>
      <td headers="W02 stub_1_5 low" class="gt_row gt_right" style="background-color: #FFA500;">2038.33</td>
      <td headers="W02 stub_1_5 close" class="gt_row gt_right">2044.81</td></tr>
          <tr class="gt_group_heading_row">
            <th colspan="5" class="gt_group_heading" scope="colgroup" id="W03">W03</th>
          </tr>
          <tr class="gt_row_group_first"><th id="stub_1_6" scope="row" class="gt_row gt_right gt_stub">2015-01-12</th>
      <td headers="W03 stub_1_6 open" class="gt_row gt_right">2046.13</td>
      <td headers="W03 stub_1_6 high" class="gt_row gt_right" style="background-color: #FFA500;">2049.30</td>
      <td headers="W03 stub_1_6 low" class="gt_row gt_right" style="background-color: #FFA500;">2022.58</td>
      <td headers="W03 stub_1_6 close" class="gt_row gt_right">2028.26</td></tr>
          <tr><th id="stub_1_7" scope="row" class="gt_row gt_right gt_stub">2015-01-13</th>
      <td headers="W03 stub_1_7 open" class="gt_row gt_right">2031.58</td>
      <td headers="W03 stub_1_7 high" class="gt_row gt_right" style="background-color: #FFA500;">2056.93</td>
      <td headers="W03 stub_1_7 low" class="gt_row gt_right" style="background-color: #FFA500;">2008.25</td>
      <td headers="W03 stub_1_7 close" class="gt_row gt_right">2023.03</td></tr>
          <tr><th id="stub_1_8" scope="row" class="gt_row gt_right gt_stub">2015-01-14</th>
      <td headers="W03 stub_1_8 open" class="gt_row gt_right">2018.40</td>
      <td headers="W03 stub_1_8 high" class="gt_row gt_right" style="background-color: #FFA500;">2018.40</td>
      <td headers="W03 stub_1_8 low" class="gt_row gt_right" style="background-color: #FFA500;">1988.44</td>
      <td headers="W03 stub_1_8 close" class="gt_row gt_right">2011.27</td></tr>
          <tr><th id="stub_1_9" scope="row" class="gt_row gt_right gt_stub">2015-01-15</th>
      <td headers="W03 stub_1_9 open" class="gt_row gt_right">2013.75</td>
      <td headers="W03 stub_1_9 high" class="gt_row gt_right" style="background-color: #FFA500;">2021.35</td>
      <td headers="W03 stub_1_9 low" class="gt_row gt_right" style="background-color: #FFA500;">1991.47</td>
      <td headers="W03 stub_1_9 close" class="gt_row gt_right">1992.67</td></tr>
          <tr><th id="stub_1_10" scope="row" class="gt_row gt_right gt_stub">2015-01-16</th>
      <td headers="W03 stub_1_10 open" class="gt_row gt_right">1992.25</td>
      <td headers="W03 stub_1_10 high" class="gt_row gt_right" style="background-color: #FFA500;">2020.46</td>
      <td headers="W03 stub_1_10 low" class="gt_row gt_right" style="background-color: #FFA500;">1988.12</td>
      <td headers="W03 stub_1_10 close" class="gt_row gt_right">2019.42</td></tr>
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
            <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id="open">open</th>
            <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id="high">high</th>
            <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id="low">low</th>
            <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id="close">close</th>
          </tr>
        </thead>
        <tbody class="gt_table_body">
          <tr class="gt_group_heading_row">
            <th colspan="5" class="gt_group_heading" scope="colgroup" id="W02">W02</th>
          </tr>
          <tr class="gt_row_group_first"><th id="stub_1_1" scope="row" class="gt_row gt_right gt_stub">2015-01-05</th>
      <td headers="W02 stub_1_1 open" class="gt_row gt_right">2054.44</td>
      <td headers="W02 stub_1_1 high" class="gt_row gt_right" style="background-color: #FFA500;">2054.44</td>
      <td headers="W02 stub_1_1 low" class="gt_row gt_right" style="background-color: #FFA500;">2017.34</td>
      <td headers="W02 stub_1_1 close" class="gt_row gt_right">2020.58</td></tr>
          <tr><th id="stub_1_2" scope="row" class="gt_row gt_right gt_stub">2015-01-06</th>
      <td headers="W02 stub_1_2 open" class="gt_row gt_right" style="background-color: #ADD8E6;">2022.15</td>
      <td headers="W02 stub_1_2 high" class="gt_row gt_right" style="background-color: #ADD8E6;">2030.25</td>
      <td headers="W02 stub_1_2 low" class="gt_row gt_right" style="background-color: #ADD8E6;">1992.44</td>
      <td headers="W02 stub_1_2 close" class="gt_row gt_right" style="background-color: #ADD8E6;">2002.61</td></tr>
          <tr><th id="stub_1_3" scope="row" class="gt_row gt_right gt_stub">2015-01-07</th>
      <td headers="W02 stub_1_3 open" class="gt_row gt_right">2005.55</td>
      <td headers="W02 stub_1_3 high" class="gt_row gt_right" style="background-color: #FFA500;">2029.61</td>
      <td headers="W02 stub_1_3 low" class="gt_row gt_right" style="background-color: #FFA500;">2005.55</td>
      <td headers="W02 stub_1_3 close" class="gt_row gt_right">2025.90</td></tr>
          <tr><th id="stub_1_4" scope="row" class="gt_row gt_right gt_stub">2015-01-08</th>
      <td headers="W02 stub_1_4 open" class="gt_row gt_right">2030.61</td>
      <td headers="W02 stub_1_4 high" class="gt_row gt_right" style="background-color: #FFA500;">2064.08</td>
      <td headers="W02 stub_1_4 low" class="gt_row gt_right" style="background-color: #FFA500;">2030.61</td>
      <td headers="W02 stub_1_4 close" class="gt_row gt_right">2062.14</td></tr>
          <tr><th id="stub_1_5" scope="row" class="gt_row gt_right gt_stub">2015-01-09</th>
      <td headers="W02 stub_1_5 open" class="gt_row gt_right">2063.45</td>
      <td headers="W02 stub_1_5 high" class="gt_row gt_right" style="background-color: #FFA500;">2064.43</td>
      <td headers="W02 stub_1_5 low" class="gt_row gt_right" style="background-color: #FFA500;">2038.33</td>
      <td headers="W02 stub_1_5 close" class="gt_row gt_right">2044.81</td></tr>
          <tr class="gt_group_heading_row">
            <th colspan="5" class="gt_group_heading" scope="colgroup" id="W03">W03</th>
          </tr>
          <tr class="gt_row_group_first"><th id="stub_1_6" scope="row" class="gt_row gt_right gt_stub">2015-01-12</th>
      <td headers="W03 stub_1_6 open" class="gt_row gt_right">2046.13</td>
      <td headers="W03 stub_1_6 high" class="gt_row gt_right" style="background-color: #FFA500;">2049.30</td>
      <td headers="W03 stub_1_6 low" class="gt_row gt_right" style="background-color: #FFA500;">2022.58</td>
      <td headers="W03 stub_1_6 close" class="gt_row gt_right">2028.26</td></tr>
          <tr><th id="stub_1_7" scope="row" class="gt_row gt_right gt_stub">2015-01-13</th>
      <td headers="W03 stub_1_7 open" class="gt_row gt_right">2031.58</td>
      <td headers="W03 stub_1_7 high" class="gt_row gt_right" style="background-color: #FFA500;">2056.93</td>
      <td headers="W03 stub_1_7 low" class="gt_row gt_right" style="background-color: #FFA500;">2008.25</td>
      <td headers="W03 stub_1_7 close" class="gt_row gt_right">2023.03</td></tr>
          <tr><th id="stub_1_8" scope="row" class="gt_row gt_right gt_stub">2015-01-14</th>
      <td headers="W03 stub_1_8 open" class="gt_row gt_right">2018.40</td>
      <td headers="W03 stub_1_8 high" class="gt_row gt_right" style="background-color: #FFA500;">2018.40</td>
      <td headers="W03 stub_1_8 low" class="gt_row gt_right" style="background-color: #FFA500;">1988.44</td>
      <td headers="W03 stub_1_8 close" class="gt_row gt_right">2011.27</td></tr>
          <tr><th id="stub_1_9" scope="row" class="gt_row gt_right gt_stub">2015-01-15</th>
      <td headers="W03 stub_1_9 open" class="gt_row gt_right">2013.75</td>
      <td headers="W03 stub_1_9 high" class="gt_row gt_right" style="background-color: #FFA500;">2021.35</td>
      <td headers="W03 stub_1_9 low" class="gt_row gt_right" style="background-color: #FFA500;">1991.47</td>
      <td headers="W03 stub_1_9 close" class="gt_row gt_right">1992.67</td></tr>
          <tr><th id="stub_1_10" scope="row" class="gt_row gt_right gt_stub">2015-01-16</th>
      <td headers="W03 stub_1_10 open" class="gt_row gt_right" style="background-color: #ADD8E6;">1992.25</td>
      <td headers="W03 stub_1_10 high" class="gt_row gt_right" style="background-color: #ADD8E6;">2020.46</td>
      <td headers="W03 stub_1_10 low" class="gt_row gt_right" style="background-color: #ADD8E6;">1988.12</td>
      <td headers="W03 stub_1_10 close" class="gt_row gt_right" style="background-color: #ADD8E6;">2019.42</td></tr>
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
            <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id="open">open</th>
            <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id="high">high</th>
            <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id="low">low</th>
            <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id="close">close</th>
          </tr>
        </thead>
        <tbody class="gt_table_body">
          <tr class="gt_group_heading_row">
            <th colspan="5" class="gt_group_heading" scope="colgroup" id="W02">W02</th>
          </tr>
          <tr class="gt_row_group_first"><th id="stub_1_1" scope="row" class="gt_row gt_right gt_stub">2015-01-05</th>
      <td headers="W02 stub_1_1 open" class="gt_row gt_right">2054.44</td>
      <td headers="W02 stub_1_1 high" class="gt_row gt_right" style="background-color: #FFA500;">2054.44</td>
      <td headers="W02 stub_1_1 low" class="gt_row gt_right" style="background-color: #FFA500;">2017.34</td>
      <td headers="W02 stub_1_1 close" class="gt_row gt_right">2020.58</td></tr>
          <tr><th id="stub_1_2" scope="row" class="gt_row gt_right gt_stub">2015-01-06</th>
      <td headers="W02 stub_1_2 open" class="gt_row gt_right" style="background-color: #ADD8E6;">2022.15</td>
      <td headers="W02 stub_1_2 high" class="gt_row gt_right" style="background-color: #FFA500;">2030.25</td>
      <td headers="W02 stub_1_2 low" class="gt_row gt_right" style="background-color: #FFA500;">1992.44</td>
      <td headers="W02 stub_1_2 close" class="gt_row gt_right" style="background-color: #ADD8E6;">2002.61</td></tr>
          <tr><th id="stub_1_3" scope="row" class="gt_row gt_right gt_stub">2015-01-07</th>
      <td headers="W02 stub_1_3 open" class="gt_row gt_right">2005.55</td>
      <td headers="W02 stub_1_3 high" class="gt_row gt_right" style="background-color: #FFA500;">2029.61</td>
      <td headers="W02 stub_1_3 low" class="gt_row gt_right" style="background-color: #FFA500;">2005.55</td>
      <td headers="W02 stub_1_3 close" class="gt_row gt_right">2025.90</td></tr>
          <tr><th id="stub_1_4" scope="row" class="gt_row gt_right gt_stub">2015-01-08</th>
      <td headers="W02 stub_1_4 open" class="gt_row gt_right">2030.61</td>
      <td headers="W02 stub_1_4 high" class="gt_row gt_right" style="background-color: #FFA500;">2064.08</td>
      <td headers="W02 stub_1_4 low" class="gt_row gt_right" style="background-color: #FFA500;">2030.61</td>
      <td headers="W02 stub_1_4 close" class="gt_row gt_right">2062.14</td></tr>
          <tr><th id="stub_1_5" scope="row" class="gt_row gt_right gt_stub">2015-01-09</th>
      <td headers="W02 stub_1_5 open" class="gt_row gt_right">2063.45</td>
      <td headers="W02 stub_1_5 high" class="gt_row gt_right" style="background-color: #FFA500;">2064.43</td>
      <td headers="W02 stub_1_5 low" class="gt_row gt_right" style="background-color: #FFA500;">2038.33</td>
      <td headers="W02 stub_1_5 close" class="gt_row gt_right">2044.81</td></tr>
          <tr class="gt_group_heading_row">
            <th colspan="5" class="gt_group_heading" scope="colgroup" id="W03">W03</th>
          </tr>
          <tr class="gt_row_group_first"><th id="stub_1_6" scope="row" class="gt_row gt_right gt_stub">2015-01-12</th>
      <td headers="W03 stub_1_6 open" class="gt_row gt_right">2046.13</td>
      <td headers="W03 stub_1_6 high" class="gt_row gt_right" style="background-color: #FFA500;">2049.30</td>
      <td headers="W03 stub_1_6 low" class="gt_row gt_right" style="background-color: #FFA500;">2022.58</td>
      <td headers="W03 stub_1_6 close" class="gt_row gt_right">2028.26</td></tr>
          <tr><th id="stub_1_7" scope="row" class="gt_row gt_right gt_stub">2015-01-13</th>
      <td headers="W03 stub_1_7 open" class="gt_row gt_right">2031.58</td>
      <td headers="W03 stub_1_7 high" class="gt_row gt_right" style="background-color: #FFA500;">2056.93</td>
      <td headers="W03 stub_1_7 low" class="gt_row gt_right" style="background-color: #FFA500;">2008.25</td>
      <td headers="W03 stub_1_7 close" class="gt_row gt_right">2023.03</td></tr>
          <tr><th id="stub_1_8" scope="row" class="gt_row gt_right gt_stub">2015-01-14</th>
      <td headers="W03 stub_1_8 open" class="gt_row gt_right">2018.40</td>
      <td headers="W03 stub_1_8 high" class="gt_row gt_right" style="background-color: #FFA500;">2018.40</td>
      <td headers="W03 stub_1_8 low" class="gt_row gt_right" style="background-color: #FFA500;">1988.44</td>
      <td headers="W03 stub_1_8 close" class="gt_row gt_right">2011.27</td></tr>
          <tr><th id="stub_1_9" scope="row" class="gt_row gt_right gt_stub">2015-01-15</th>
      <td headers="W03 stub_1_9 open" class="gt_row gt_right">2013.75</td>
      <td headers="W03 stub_1_9 high" class="gt_row gt_right" style="background-color: #FFA500;">2021.35</td>
      <td headers="W03 stub_1_9 low" class="gt_row gt_right" style="background-color: #FFA500;">1991.47</td>
      <td headers="W03 stub_1_9 close" class="gt_row gt_right">1992.67</td></tr>
          <tr><th id="stub_1_10" scope="row" class="gt_row gt_right gt_stub">2015-01-16</th>
      <td headers="W03 stub_1_10 open" class="gt_row gt_right" style="background-color: #ADD8E6;">1992.25</td>
      <td headers="W03 stub_1_10 high" class="gt_row gt_right" style="background-color: #FFA500;">2020.46</td>
      <td headers="W03 stub_1_10 low" class="gt_row gt_right" style="background-color: #FFA500;">1988.12</td>
      <td headers="W03 stub_1_10 close" class="gt_row gt_right" style="background-color: #ADD8E6;">2019.42</td></tr>
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
            <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id="open">open</th>
            <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id="high">high</th>
            <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id="low">low</th>
            <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id="close">close</th>
          </tr>
        </thead>
        <tbody class="gt_table_body">
          <tr class="gt_group_heading_row">
            <th colspan="5" class="gt_group_heading" scope="colgroup" id="W02">W02</th>
          </tr>
          <tr class="gt_row_group_first"><th id="stub_1_1" scope="row" class="gt_row gt_right gt_stub">2015-01-05</th>
      <td headers="W02 stub_1_1 open" class="gt_row gt_right">2054.44</td>
      <td headers="W02 stub_1_1 high" class="gt_row gt_right">2054.44</td>
      <td headers="W02 stub_1_1 low" class="gt_row gt_right">2017.34</td>
      <td headers="W02 stub_1_1 close" class="gt_row gt_right">2020.58</td></tr>
          <tr><th id="stub_1_2" scope="row" class="gt_row gt_right gt_stub">2015-01-06</th>
      <td headers="W02 stub_1_2 open" class="gt_row gt_right">2022.15</td>
      <td headers="W02 stub_1_2 high" class="gt_row gt_right" style="background-color: #FFFF00;">2030.25</td>
      <td headers="W02 stub_1_2 low" class="gt_row gt_right">1992.44</td>
      <td headers="W02 stub_1_2 close" class="gt_row gt_right">2002.61</td></tr>
          <tr><th id="stub_1_3" scope="row" class="gt_row gt_right gt_stub">2015-01-07</th>
      <td headers="W02 stub_1_3 open" class="gt_row gt_right">2005.55</td>
      <td headers="W02 stub_1_3 high" class="gt_row gt_right">2029.61</td>
      <td headers="W02 stub_1_3 low" class="gt_row gt_right">2005.55</td>
      <td headers="W02 stub_1_3 close" class="gt_row gt_right">2025.90</td></tr>
          <tr><th id="stub_1_4" scope="row" class="gt_row gt_right gt_stub">2015-01-08</th>
      <td headers="W02 stub_1_4 open" class="gt_row gt_right">2030.61</td>
      <td headers="W02 stub_1_4 high" class="gt_row gt_right">2064.08</td>
      <td headers="W02 stub_1_4 low" class="gt_row gt_right">2030.61</td>
      <td headers="W02 stub_1_4 close" class="gt_row gt_right">2062.14</td></tr>
          <tr><th id="stub_1_5" scope="row" class="gt_row gt_right gt_stub">2015-01-09</th>
      <td headers="W02 stub_1_5 open" class="gt_row gt_right">2063.45</td>
      <td headers="W02 stub_1_5 high" class="gt_row gt_right">2064.43</td>
      <td headers="W02 stub_1_5 low" class="gt_row gt_right">2038.33</td>
      <td headers="W02 stub_1_5 close" class="gt_row gt_right">2044.81</td></tr>
          <tr class="gt_group_heading_row">
            <th colspan="5" class="gt_group_heading" scope="colgroup" id="W03">W03</th>
          </tr>
          <tr class="gt_row_group_first"><th id="stub_1_6" scope="row" class="gt_row gt_right gt_stub">2015-01-12</th>
      <td headers="W03 stub_1_6 open" class="gt_row gt_right">2046.13</td>
      <td headers="W03 stub_1_6 high" class="gt_row gt_right">2049.30</td>
      <td headers="W03 stub_1_6 low" class="gt_row gt_right">2022.58</td>
      <td headers="W03 stub_1_6 close" class="gt_row gt_right">2028.26</td></tr>
          <tr><th id="stub_1_7" scope="row" class="gt_row gt_right gt_stub">2015-01-13</th>
      <td headers="W03 stub_1_7 open" class="gt_row gt_right">2031.58</td>
      <td headers="W03 stub_1_7 high" class="gt_row gt_right">2056.93</td>
      <td headers="W03 stub_1_7 low" class="gt_row gt_right">2008.25</td>
      <td headers="W03 stub_1_7 close" class="gt_row gt_right">2023.03</td></tr>
          <tr><th id="stub_1_8" scope="row" class="gt_row gt_right gt_stub">2015-01-14</th>
      <td headers="W03 stub_1_8 open" class="gt_row gt_right">2018.40</td>
      <td headers="W03 stub_1_8 high" class="gt_row gt_right">2018.40</td>
      <td headers="W03 stub_1_8 low" class="gt_row gt_right">1988.44</td>
      <td headers="W03 stub_1_8 close" class="gt_row gt_right">2011.27</td></tr>
          <tr><th id="stub_1_9" scope="row" class="gt_row gt_right gt_stub">2015-01-15</th>
      <td headers="W03 stub_1_9 open" class="gt_row gt_right">2013.75</td>
      <td headers="W03 stub_1_9 high" class="gt_row gt_right">2021.35</td>
      <td headers="W03 stub_1_9 low" class="gt_row gt_right">1991.47</td>
      <td headers="W03 stub_1_9 close" class="gt_row gt_right">1992.67</td></tr>
          <tr><th id="stub_1_10" scope="row" class="gt_row gt_right gt_stub">2015-01-16</th>
      <td headers="W03 stub_1_10 open" class="gt_row gt_right">1992.25</td>
      <td headers="W03 stub_1_10 high" class="gt_row gt_right">2020.46</td>
      <td headers="W03 stub_1_10 low" class="gt_row gt_right" style="background-color: #FFFF00;">1988.12</td>
      <td headers="W03 stub_1_10 close" class="gt_row gt_right">2019.42</td></tr>
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
            <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id="open">open</th>
            <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id="high">high</th>
            <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id="low">low</th>
            <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id="close">close</th>
          </tr>
        </thead>
        <tbody class="gt_table_body">
          <tr class="gt_group_heading_row">
            <th colspan="5" class="gt_group_heading" scope="colgroup" id="W02">W02</th>
          </tr>
          <tr class="gt_row_group_first"><th id="stub_1_1" scope="row" class="gt_row gt_right gt_stub">2015-01-05</th>
      <td headers="W02 stub_1_1 open" class="gt_row gt_right">2054.44</td>
      <td headers="W02 stub_1_1 high" class="gt_row gt_right">2054.44</td>
      <td headers="W02 stub_1_1 low" class="gt_row gt_right">2017.34</td>
      <td headers="W02 stub_1_1 close" class="gt_row gt_right">2020.58</td></tr>
          <tr><th id="stub_1_2" scope="row" class="gt_row gt_right gt_stub" style="background-color: #FFFF00;">2015-01-06</th>
      <td headers="W02 stub_1_2 open" class="gt_row gt_right">2022.15</td>
      <td headers="W02 stub_1_2 high" class="gt_row gt_right">2030.25</td>
      <td headers="W02 stub_1_2 low" class="gt_row gt_right">1992.44</td>
      <td headers="W02 stub_1_2 close" class="gt_row gt_right">2002.61</td></tr>
          <tr><th id="stub_1_3" scope="row" class="gt_row gt_right gt_stub">2015-01-07</th>
      <td headers="W02 stub_1_3 open" class="gt_row gt_right">2005.55</td>
      <td headers="W02 stub_1_3 high" class="gt_row gt_right">2029.61</td>
      <td headers="W02 stub_1_3 low" class="gt_row gt_right">2005.55</td>
      <td headers="W02 stub_1_3 close" class="gt_row gt_right">2025.90</td></tr>
          <tr><th id="stub_1_4" scope="row" class="gt_row gt_right gt_stub">2015-01-08</th>
      <td headers="W02 stub_1_4 open" class="gt_row gt_right">2030.61</td>
      <td headers="W02 stub_1_4 high" class="gt_row gt_right">2064.08</td>
      <td headers="W02 stub_1_4 low" class="gt_row gt_right">2030.61</td>
      <td headers="W02 stub_1_4 close" class="gt_row gt_right">2062.14</td></tr>
          <tr><th id="stub_1_5" scope="row" class="gt_row gt_right gt_stub">2015-01-09</th>
      <td headers="W02 stub_1_5 open" class="gt_row gt_right">2063.45</td>
      <td headers="W02 stub_1_5 high" class="gt_row gt_right">2064.43</td>
      <td headers="W02 stub_1_5 low" class="gt_row gt_right">2038.33</td>
      <td headers="W02 stub_1_5 close" class="gt_row gt_right">2044.81</td></tr>
          <tr class="gt_group_heading_row">
            <th colspan="5" class="gt_group_heading" scope="colgroup" id="W03">W03</th>
          </tr>
          <tr class="gt_row_group_first"><th id="stub_1_6" scope="row" class="gt_row gt_right gt_stub">2015-01-12</th>
      <td headers="W03 stub_1_6 open" class="gt_row gt_right">2046.13</td>
      <td headers="W03 stub_1_6 high" class="gt_row gt_right">2049.30</td>
      <td headers="W03 stub_1_6 low" class="gt_row gt_right">2022.58</td>
      <td headers="W03 stub_1_6 close" class="gt_row gt_right">2028.26</td></tr>
          <tr><th id="stub_1_7" scope="row" class="gt_row gt_right gt_stub">2015-01-13</th>
      <td headers="W03 stub_1_7 open" class="gt_row gt_right">2031.58</td>
      <td headers="W03 stub_1_7 high" class="gt_row gt_right">2056.93</td>
      <td headers="W03 stub_1_7 low" class="gt_row gt_right">2008.25</td>
      <td headers="W03 stub_1_7 close" class="gt_row gt_right">2023.03</td></tr>
          <tr><th id="stub_1_8" scope="row" class="gt_row gt_right gt_stub">2015-01-14</th>
      <td headers="W03 stub_1_8 open" class="gt_row gt_right">2018.40</td>
      <td headers="W03 stub_1_8 high" class="gt_row gt_right">2018.40</td>
      <td headers="W03 stub_1_8 low" class="gt_row gt_right">1988.44</td>
      <td headers="W03 stub_1_8 close" class="gt_row gt_right">2011.27</td></tr>
          <tr><th id="stub_1_9" scope="row" class="gt_row gt_right gt_stub">2015-01-15</th>
      <td headers="W03 stub_1_9 open" class="gt_row gt_right">2013.75</td>
      <td headers="W03 stub_1_9 high" class="gt_row gt_right">2021.35</td>
      <td headers="W03 stub_1_9 low" class="gt_row gt_right">1991.47</td>
      <td headers="W03 stub_1_9 close" class="gt_row gt_right">1992.67</td></tr>
          <tr><th id="stub_1_10" scope="row" class="gt_row gt_right gt_stub" style="background-color: #FFFF00;">2015-01-16</th>
      <td headers="W03 stub_1_10 open" class="gt_row gt_right">1992.25</td>
      <td headers="W03 stub_1_10 high" class="gt_row gt_right">2020.46</td>
      <td headers="W03 stub_1_10 low" class="gt_row gt_right">1988.12</td>
      <td headers="W03 stub_1_10 close" class="gt_row gt_right">2019.42</td></tr>
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
            <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id="open">open</th>
            <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id="high">high</th>
            <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id="low">low</th>
            <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id="close">close</th>
          </tr>
        </thead>
        <tbody class="gt_table_body">
          <tr class="gt_group_heading_row">
            <th colspan="5" class="gt_group_heading" scope="colgroup" id="W02">W02</th>
          </tr>
          <tr class="gt_row_group_first"><th id="stub_1_1" scope="row" class="gt_row gt_right gt_stub">2015-01-05</th>
      <td headers="W02 stub_1_1 open" class="gt_row gt_right">2054.44</td>
      <td headers="W02 stub_1_1 high" class="gt_row gt_right">2054.44</td>
      <td headers="W02 stub_1_1 low" class="gt_row gt_right">2017.34</td>
      <td headers="W02 stub_1_1 close" class="gt_row gt_right">2020.58</td></tr>
          <tr><th id="stub_1_2" scope="row" class="gt_row gt_right gt_stub" style="background-color: #FFFF00;">2015-01-06</th>
      <td headers="W02 stub_1_2 open" class="gt_row gt_right" style="background-color: #FFFF00;">2022.15</td>
      <td headers="W02 stub_1_2 high" class="gt_row gt_right" style="background-color: #FFFF00;">2030.25</td>
      <td headers="W02 stub_1_2 low" class="gt_row gt_right" style="background-color: #FFFF00;">1992.44</td>
      <td headers="W02 stub_1_2 close" class="gt_row gt_right" style="background-color: #FFFF00;">2002.61</td></tr>
          <tr><th id="stub_1_3" scope="row" class="gt_row gt_right gt_stub">2015-01-07</th>
      <td headers="W02 stub_1_3 open" class="gt_row gt_right">2005.55</td>
      <td headers="W02 stub_1_3 high" class="gt_row gt_right">2029.61</td>
      <td headers="W02 stub_1_3 low" class="gt_row gt_right">2005.55</td>
      <td headers="W02 stub_1_3 close" class="gt_row gt_right">2025.90</td></tr>
          <tr><th id="stub_1_4" scope="row" class="gt_row gt_right gt_stub">2015-01-08</th>
      <td headers="W02 stub_1_4 open" class="gt_row gt_right">2030.61</td>
      <td headers="W02 stub_1_4 high" class="gt_row gt_right">2064.08</td>
      <td headers="W02 stub_1_4 low" class="gt_row gt_right">2030.61</td>
      <td headers="W02 stub_1_4 close" class="gt_row gt_right">2062.14</td></tr>
          <tr><th id="stub_1_5" scope="row" class="gt_row gt_right gt_stub">2015-01-09</th>
      <td headers="W02 stub_1_5 open" class="gt_row gt_right">2063.45</td>
      <td headers="W02 stub_1_5 high" class="gt_row gt_right">2064.43</td>
      <td headers="W02 stub_1_5 low" class="gt_row gt_right">2038.33</td>
      <td headers="W02 stub_1_5 close" class="gt_row gt_right">2044.81</td></tr>
          <tr class="gt_group_heading_row">
            <th colspan="5" class="gt_group_heading" scope="colgroup" id="W03">W03</th>
          </tr>
          <tr class="gt_row_group_first"><th id="stub_1_6" scope="row" class="gt_row gt_right gt_stub">2015-01-12</th>
      <td headers="W03 stub_1_6 open" class="gt_row gt_right">2046.13</td>
      <td headers="W03 stub_1_6 high" class="gt_row gt_right">2049.30</td>
      <td headers="W03 stub_1_6 low" class="gt_row gt_right">2022.58</td>
      <td headers="W03 stub_1_6 close" class="gt_row gt_right">2028.26</td></tr>
          <tr><th id="stub_1_7" scope="row" class="gt_row gt_right gt_stub">2015-01-13</th>
      <td headers="W03 stub_1_7 open" class="gt_row gt_right">2031.58</td>
      <td headers="W03 stub_1_7 high" class="gt_row gt_right">2056.93</td>
      <td headers="W03 stub_1_7 low" class="gt_row gt_right">2008.25</td>
      <td headers="W03 stub_1_7 close" class="gt_row gt_right">2023.03</td></tr>
          <tr><th id="stub_1_8" scope="row" class="gt_row gt_right gt_stub">2015-01-14</th>
      <td headers="W03 stub_1_8 open" class="gt_row gt_right">2018.40</td>
      <td headers="W03 stub_1_8 high" class="gt_row gt_right">2018.40</td>
      <td headers="W03 stub_1_8 low" class="gt_row gt_right">1988.44</td>
      <td headers="W03 stub_1_8 close" class="gt_row gt_right">2011.27</td></tr>
          <tr><th id="stub_1_9" scope="row" class="gt_row gt_right gt_stub">2015-01-15</th>
      <td headers="W03 stub_1_9 open" class="gt_row gt_right">2013.75</td>
      <td headers="W03 stub_1_9 high" class="gt_row gt_right">2021.35</td>
      <td headers="W03 stub_1_9 low" class="gt_row gt_right">1991.47</td>
      <td headers="W03 stub_1_9 close" class="gt_row gt_right">1992.67</td></tr>
          <tr><th id="stub_1_10" scope="row" class="gt_row gt_right gt_stub" style="background-color: #FFFF00;">2015-01-16</th>
      <td headers="W03 stub_1_10 open" class="gt_row gt_right" style="background-color: #FFFF00;">1992.25</td>
      <td headers="W03 stub_1_10 high" class="gt_row gt_right" style="background-color: #FFFF00;">2020.46</td>
      <td headers="W03 stub_1_10 low" class="gt_row gt_right" style="background-color: #FFFF00;">1988.12</td>
      <td headers="W03 stub_1_10 close" class="gt_row gt_right" style="background-color: #FFFF00;">2019.42</td></tr>
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
            <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id="open">open</th>
            <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id="high">high</th>
            <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id="low">low</th>
            <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id="close">close</th>
          </tr>
        </thead>
        <tbody class="gt_table_body">
          <tr class="gt_group_heading_row">
            <th colspan="5" class="gt_group_heading" scope="colgroup" id="W02">W02</th>
          </tr>
          <tr class="gt_row_group_first"><th id="stub_1_1" scope="row" class="gt_row gt_right gt_stub">2015-01-05</th>
      <td headers="W02 stub_1_1 open" class="gt_row gt_right">2054.44</td>
      <td headers="W02 stub_1_1 high" class="gt_row gt_right">2054.44</td>
      <td headers="W02 stub_1_1 low" class="gt_row gt_right">2017.34</td>
      <td headers="W02 stub_1_1 close" class="gt_row gt_right">2020.58</td></tr>
          <tr><th id="stub_1_2" scope="row" class="gt_row gt_right gt_stub">2015-01-06</th>
      <td headers="W02 stub_1_2 open" class="gt_row gt_right" style="background-color: #FFFF00;">2022.15</td>
      <td headers="W02 stub_1_2 high" class="gt_row gt_right" style="background-color: #FFFF00;">2030.25</td>
      <td headers="W02 stub_1_2 low" class="gt_row gt_right" style="background-color: #FFFF00;">1992.44</td>
      <td headers="W02 stub_1_2 close" class="gt_row gt_right" style="background-color: #FFFF00;">2002.61</td></tr>
          <tr><th id="stub_1_3" scope="row" class="gt_row gt_right gt_stub">2015-01-07</th>
      <td headers="W02 stub_1_3 open" class="gt_row gt_right">2005.55</td>
      <td headers="W02 stub_1_3 high" class="gt_row gt_right">2029.61</td>
      <td headers="W02 stub_1_3 low" class="gt_row gt_right">2005.55</td>
      <td headers="W02 stub_1_3 close" class="gt_row gt_right">2025.90</td></tr>
          <tr><th id="stub_1_4" scope="row" class="gt_row gt_right gt_stub">2015-01-08</th>
      <td headers="W02 stub_1_4 open" class="gt_row gt_right">2030.61</td>
      <td headers="W02 stub_1_4 high" class="gt_row gt_right">2064.08</td>
      <td headers="W02 stub_1_4 low" class="gt_row gt_right">2030.61</td>
      <td headers="W02 stub_1_4 close" class="gt_row gt_right">2062.14</td></tr>
          <tr><th id="stub_1_5" scope="row" class="gt_row gt_right gt_stub">2015-01-09</th>
      <td headers="W02 stub_1_5 open" class="gt_row gt_right">2063.45</td>
      <td headers="W02 stub_1_5 high" class="gt_row gt_right">2064.43</td>
      <td headers="W02 stub_1_5 low" class="gt_row gt_right">2038.33</td>
      <td headers="W02 stub_1_5 close" class="gt_row gt_right">2044.81</td></tr>
          <tr class="gt_group_heading_row">
            <th colspan="5" class="gt_group_heading" scope="colgroup" id="W03">W03</th>
          </tr>
          <tr class="gt_row_group_first"><th id="stub_1_6" scope="row" class="gt_row gt_right gt_stub">2015-01-12</th>
      <td headers="W03 stub_1_6 open" class="gt_row gt_right">2046.13</td>
      <td headers="W03 stub_1_6 high" class="gt_row gt_right">2049.30</td>
      <td headers="W03 stub_1_6 low" class="gt_row gt_right">2022.58</td>
      <td headers="W03 stub_1_6 close" class="gt_row gt_right">2028.26</td></tr>
          <tr><th id="stub_1_7" scope="row" class="gt_row gt_right gt_stub">2015-01-13</th>
      <td headers="W03 stub_1_7 open" class="gt_row gt_right">2031.58</td>
      <td headers="W03 stub_1_7 high" class="gt_row gt_right">2056.93</td>
      <td headers="W03 stub_1_7 low" class="gt_row gt_right">2008.25</td>
      <td headers="W03 stub_1_7 close" class="gt_row gt_right">2023.03</td></tr>
          <tr><th id="stub_1_8" scope="row" class="gt_row gt_right gt_stub">2015-01-14</th>
      <td headers="W03 stub_1_8 open" class="gt_row gt_right">2018.40</td>
      <td headers="W03 stub_1_8 high" class="gt_row gt_right">2018.40</td>
      <td headers="W03 stub_1_8 low" class="gt_row gt_right">1988.44</td>
      <td headers="W03 stub_1_8 close" class="gt_row gt_right">2011.27</td></tr>
          <tr><th id="stub_1_9" scope="row" class="gt_row gt_right gt_stub">2015-01-15</th>
      <td headers="W03 stub_1_9 open" class="gt_row gt_right">2013.75</td>
      <td headers="W03 stub_1_9 high" class="gt_row gt_right">2021.35</td>
      <td headers="W03 stub_1_9 low" class="gt_row gt_right">1991.47</td>
      <td headers="W03 stub_1_9 close" class="gt_row gt_right">1992.67</td></tr>
          <tr><th id="stub_1_10" scope="row" class="gt_row gt_right gt_stub">2015-01-16</th>
      <td headers="W03 stub_1_10 open" class="gt_row gt_right" style="background-color: #FFFF00;">1992.25</td>
      <td headers="W03 stub_1_10 high" class="gt_row gt_right" style="background-color: #FFFF00;">2020.46</td>
      <td headers="W03 stub_1_10 low" class="gt_row gt_right" style="background-color: #FFFF00;">1988.12</td>
      <td headers="W03 stub_1_10 close" class="gt_row gt_right" style="background-color: #FFFF00;">2019.42</td></tr>
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
            <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id="open">open</th>
            <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id="high">high</th>
            <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id="low">low</th>
            <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id="close">close</th>
          </tr>
        </thead>
        <tbody class="gt_table_body">
          <tr class="gt_group_heading_row">
            <th colspan="5" class="gt_group_heading" scope="colgroup" id="W02">W02</th>
          </tr>
          <tr class="gt_row_group_first"><th id="stub_1_1" scope="row" class="gt_row gt_right gt_stub">2015-01-05</th>
      <td headers="W02 stub_1_1 open" class="gt_row gt_right">2054.44</td>
      <td headers="W02 stub_1_1 high" class="gt_row gt_right" style="background-color: #FFFF00;">2054.44</td>
      <td headers="W02 stub_1_1 low" class="gt_row gt_right" style="background-color: #FFFF00;">2017.34</td>
      <td headers="W02 stub_1_1 close" class="gt_row gt_right">2020.58</td></tr>
          <tr><th id="stub_1_2" scope="row" class="gt_row gt_right gt_stub">2015-01-06</th>
      <td headers="W02 stub_1_2 open" class="gt_row gt_right">2022.15</td>
      <td headers="W02 stub_1_2 high" class="gt_row gt_right" style="background-color: #FFFF00;">2030.25</td>
      <td headers="W02 stub_1_2 low" class="gt_row gt_right" style="background-color: #FFFF00;">1992.44</td>
      <td headers="W02 stub_1_2 close" class="gt_row gt_right">2002.61</td></tr>
          <tr><th id="stub_1_3" scope="row" class="gt_row gt_right gt_stub">2015-01-07</th>
      <td headers="W02 stub_1_3 open" class="gt_row gt_right">2005.55</td>
      <td headers="W02 stub_1_3 high" class="gt_row gt_right" style="background-color: #FFFF00;">2029.61</td>
      <td headers="W02 stub_1_3 low" class="gt_row gt_right" style="background-color: #FFFF00;">2005.55</td>
      <td headers="W02 stub_1_3 close" class="gt_row gt_right">2025.90</td></tr>
          <tr><th id="stub_1_4" scope="row" class="gt_row gt_right gt_stub">2015-01-08</th>
      <td headers="W02 stub_1_4 open" class="gt_row gt_right">2030.61</td>
      <td headers="W02 stub_1_4 high" class="gt_row gt_right" style="background-color: #FFFF00;">2064.08</td>
      <td headers="W02 stub_1_4 low" class="gt_row gt_right" style="background-color: #FFFF00;">2030.61</td>
      <td headers="W02 stub_1_4 close" class="gt_row gt_right">2062.14</td></tr>
          <tr><th id="stub_1_5" scope="row" class="gt_row gt_right gt_stub">2015-01-09</th>
      <td headers="W02 stub_1_5 open" class="gt_row gt_right">2063.45</td>
      <td headers="W02 stub_1_5 high" class="gt_row gt_right" style="background-color: #FFFF00;">2064.43</td>
      <td headers="W02 stub_1_5 low" class="gt_row gt_right" style="background-color: #FFFF00;">2038.33</td>
      <td headers="W02 stub_1_5 close" class="gt_row gt_right">2044.81</td></tr>
          <tr class="gt_group_heading_row">
            <th colspan="5" class="gt_group_heading" scope="colgroup" id="W03">W03</th>
          </tr>
          <tr class="gt_row_group_first"><th id="stub_1_6" scope="row" class="gt_row gt_right gt_stub">2015-01-12</th>
      <td headers="W03 stub_1_6 open" class="gt_row gt_right">2046.13</td>
      <td headers="W03 stub_1_6 high" class="gt_row gt_right" style="background-color: #FFFF00;">2049.30</td>
      <td headers="W03 stub_1_6 low" class="gt_row gt_right" style="background-color: #FFFF00;">2022.58</td>
      <td headers="W03 stub_1_6 close" class="gt_row gt_right">2028.26</td></tr>
          <tr><th id="stub_1_7" scope="row" class="gt_row gt_right gt_stub">2015-01-13</th>
      <td headers="W03 stub_1_7 open" class="gt_row gt_right">2031.58</td>
      <td headers="W03 stub_1_7 high" class="gt_row gt_right" style="background-color: #FFFF00;">2056.93</td>
      <td headers="W03 stub_1_7 low" class="gt_row gt_right" style="background-color: #FFFF00;">2008.25</td>
      <td headers="W03 stub_1_7 close" class="gt_row gt_right">2023.03</td></tr>
          <tr><th id="stub_1_8" scope="row" class="gt_row gt_right gt_stub">2015-01-14</th>
      <td headers="W03 stub_1_8 open" class="gt_row gt_right">2018.40</td>
      <td headers="W03 stub_1_8 high" class="gt_row gt_right" style="background-color: #FFFF00;">2018.40</td>
      <td headers="W03 stub_1_8 low" class="gt_row gt_right" style="background-color: #FFFF00;">1988.44</td>
      <td headers="W03 stub_1_8 close" class="gt_row gt_right">2011.27</td></tr>
          <tr><th id="stub_1_9" scope="row" class="gt_row gt_right gt_stub">2015-01-15</th>
      <td headers="W03 stub_1_9 open" class="gt_row gt_right">2013.75</td>
      <td headers="W03 stub_1_9 high" class="gt_row gt_right" style="background-color: #FFFF00;">2021.35</td>
      <td headers="W03 stub_1_9 low" class="gt_row gt_right" style="background-color: #FFFF00;">1991.47</td>
      <td headers="W03 stub_1_9 close" class="gt_row gt_right">1992.67</td></tr>
          <tr><th id="stub_1_10" scope="row" class="gt_row gt_right gt_stub">2015-01-16</th>
      <td headers="W03 stub_1_10 open" class="gt_row gt_right">1992.25</td>
      <td headers="W03 stub_1_10 high" class="gt_row gt_right" style="background-color: #FFFF00;">2020.46</td>
      <td headers="W03 stub_1_10 low" class="gt_row gt_right" style="background-color: #FFFF00;">1988.12</td>
      <td headers="W03 stub_1_10 close" class="gt_row gt_right">2019.42</td></tr>
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
            <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id="num">num</th>
            <th class="gt_col_heading gt_columns_bottom_border gt_left" rowspan="1" colspan="1" scope="col" id="char">char</th>
            <th class="gt_col_heading gt_columns_bottom_border gt_center" rowspan="1" colspan="1" scope="col" id="fctr">fctr</th>
            <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id="date">date</th>
            <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id="time">time</th>
            <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id="datetime">datetime</th>
            <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id="currency">currency</th>
          </tr>
        </thead>
        <tbody class="gt_table_body">
          <tr class="gt_group_heading_row">
            <th colspan="8" class="gt_group_heading" scope="colgroup" id="grp_a">grp_a</th>
          </tr>
          <tr class="gt_row_group_first"><th id="stub_1_1" scope="row" class="gt_row gt_left gt_stub">row_1</th>
      <td headers="grp_a stub_1_1 num" class="gt_row gt_right">1.111e-01</td>
      <td headers="grp_a stub_1_1 char" class="gt_row gt_left">apricot</td>
      <td headers="grp_a stub_1_1 fctr" class="gt_row gt_center">one</td>
      <td headers="grp_a stub_1_1 date" class="gt_row gt_right">2015-01-15</td>
      <td headers="grp_a stub_1_1 time" class="gt_row gt_right">13:35</td>
      <td headers="grp_a stub_1_1 datetime" class="gt_row gt_right">2018-01-01 02:22</td>
      <td headers="grp_a stub_1_1 currency" class="gt_row gt_right">49.950</td></tr>
          <tr><th id="stub_1_2" scope="row" class="gt_row gt_left gt_stub">row_2</th>
      <td headers="grp_a stub_1_2 num" class="gt_row gt_right">2.222e+00</td>
      <td headers="grp_a stub_1_2 char" class="gt_row gt_left" style="background-color: #FFFF00;">banana</td>
      <td headers="grp_a stub_1_2 fctr" class="gt_row gt_center">two</td>
      <td headers="grp_a stub_1_2 date" class="gt_row gt_right">2015-02-15</td>
      <td headers="grp_a stub_1_2 time" class="gt_row gt_right">14:40</td>
      <td headers="grp_a stub_1_2 datetime" class="gt_row gt_right">2018-02-02 14:33</td>
      <td headers="grp_a stub_1_2 currency" class="gt_row gt_right">17.950</td></tr>
          <tr><th id="stub_1_3" scope="row" class="gt_row gt_left gt_stub">row_3</th>
      <td headers="grp_a stub_1_3 num" class="gt_row gt_right">3.333e+01</td>
      <td headers="grp_a stub_1_3 char" class="gt_row gt_left">coconut</td>
      <td headers="grp_a stub_1_3 fctr" class="gt_row gt_center">three</td>
      <td headers="grp_a stub_1_3 date" class="gt_row gt_right">2015-03-15</td>
      <td headers="grp_a stub_1_3 time" class="gt_row gt_right">15:45</td>
      <td headers="grp_a stub_1_3 datetime" class="gt_row gt_right">2018-03-03 03:44</td>
      <td headers="grp_a stub_1_3 currency" class="gt_row gt_right">1.390</td></tr>
          <tr><th id="stub_1_4" scope="row" class="gt_row gt_left gt_stub">row_4</th>
      <td headers="grp_a stub_1_4 num" class="gt_row gt_right">4.444e+02</td>
      <td headers="grp_a stub_1_4 char" class="gt_row gt_left">durian</td>
      <td headers="grp_a stub_1_4 fctr" class="gt_row gt_center">four</td>
      <td headers="grp_a stub_1_4 date" class="gt_row gt_right">2015-04-15</td>
      <td headers="grp_a stub_1_4 time" class="gt_row gt_right">16:50</td>
      <td headers="grp_a stub_1_4 datetime" class="gt_row gt_right">2018-04-04 15:55</td>
      <td headers="grp_a stub_1_4 currency" class="gt_row gt_right">65100.000</td></tr>
          <tr class="gt_group_heading_row">
            <th colspan="8" class="gt_group_heading" scope="colgroup" id="grp_b">grp_b</th>
          </tr>
          <tr class="gt_row_group_first"><th id="stub_1_5" scope="row" class="gt_row gt_left gt_stub">row_5</th>
      <td headers="grp_b stub_1_5 num" class="gt_row gt_right">5.550e+03</td>
      <td headers="grp_b stub_1_5 char" class="gt_row gt_left">NA</td>
      <td headers="grp_b stub_1_5 fctr" class="gt_row gt_center">five</td>
      <td headers="grp_b stub_1_5 date" class="gt_row gt_right">2015-05-15</td>
      <td headers="grp_b stub_1_5 time" class="gt_row gt_right">17:55</td>
      <td headers="grp_b stub_1_5 datetime" class="gt_row gt_right">2018-05-05 04:00</td>
      <td headers="grp_b stub_1_5 currency" class="gt_row gt_right">1325.810</td></tr>
          <tr><th id="stub_1_6" scope="row" class="gt_row gt_left gt_stub">row_6</th>
      <td headers="grp_b stub_1_6 num" class="gt_row gt_right">NA</td>
      <td headers="grp_b stub_1_6 char" class="gt_row gt_left">fig</td>
      <td headers="grp_b stub_1_6 fctr" class="gt_row gt_center">six</td>
      <td headers="grp_b stub_1_6 date" class="gt_row gt_right">2015-06-15</td>
      <td headers="grp_b stub_1_6 time" class="gt_row gt_right">NA</td>
      <td headers="grp_b stub_1_6 datetime" class="gt_row gt_right">2018-06-06 16:11</td>
      <td headers="grp_b stub_1_6 currency" class="gt_row gt_right">13.255</td></tr>
          <tr><th id="stub_1_7" scope="row" class="gt_row gt_left gt_stub">row_7</th>
      <td headers="grp_b stub_1_7 num" class="gt_row gt_right">7.770e+05</td>
      <td headers="grp_b stub_1_7 char" class="gt_row gt_left">grapefruit</td>
      <td headers="grp_b stub_1_7 fctr" class="gt_row gt_center">seven</td>
      <td headers="grp_b stub_1_7 date" class="gt_row gt_right">NA</td>
      <td headers="grp_b stub_1_7 time" class="gt_row gt_right">19:10</td>
      <td headers="grp_b stub_1_7 datetime" class="gt_row gt_right">2018-07-07 05:22</td>
      <td headers="grp_b stub_1_7 currency" class="gt_row gt_right">NA</td></tr>
          <tr><th id="stub_1_8" scope="row" class="gt_row gt_left gt_stub">row_8</th>
      <td headers="grp_b stub_1_8 num" class="gt_row gt_right">8.880e+06</td>
      <td headers="grp_b stub_1_8 char" class="gt_row gt_left" style="background-color: #FFFF00;">honeydew</td>
      <td headers="grp_b stub_1_8 fctr" class="gt_row gt_center">eight</td>
      <td headers="grp_b stub_1_8 date" class="gt_row gt_right">2015-08-15</td>
      <td headers="grp_b stub_1_8 time" class="gt_row gt_right">20:20</td>
      <td headers="grp_b stub_1_8 datetime" class="gt_row gt_right">NA</td>
      <td headers="grp_b stub_1_8 currency" class="gt_row gt_right">0.440</td></tr>
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
            <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id="num">num</th>
            <th class="gt_col_heading gt_columns_bottom_border gt_left" rowspan="1" colspan="1" scope="col" id="char">char</th>
            <th class="gt_col_heading gt_columns_bottom_border gt_center" rowspan="1" colspan="1" scope="col" id="fctr">fctr</th>
            <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id="date">date</th>
            <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id="time">time</th>
            <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id="datetime">datetime</th>
            <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id="currency">currency</th>
          </tr>
        </thead>
        <tbody class="gt_table_body">
          <tr class="gt_group_heading_row">
            <th colspan="8" class="gt_group_heading" scope="colgroup" id="grp_a">grp_a</th>
          </tr>
          <tr class="gt_row_group_first"><th id="stub_1_1" scope="row" class="gt_row gt_left gt_stub">row_1</th>
      <td headers="grp_a stub_1_1 num" class="gt_row gt_right">1.111e-01</td>
      <td headers="grp_a stub_1_1 char" class="gt_row gt_left">apricot</td>
      <td headers="grp_a stub_1_1 fctr" class="gt_row gt_center">one</td>
      <td headers="grp_a stub_1_1 date" class="gt_row gt_right" style="background-color: #90EE90;">2015-01-15</td>
      <td headers="grp_a stub_1_1 time" class="gt_row gt_right">13:35</td>
      <td headers="grp_a stub_1_1 datetime" class="gt_row gt_right">2018-01-01 02:22</td>
      <td headers="grp_a stub_1_1 currency" class="gt_row gt_right">49.950</td></tr>
          <tr><th id="stub_1_2" scope="row" class="gt_row gt_left gt_stub">row_2</th>
      <td headers="grp_a stub_1_2 num" class="gt_row gt_right">2.222e+00</td>
      <td headers="grp_a stub_1_2 char" class="gt_row gt_left">banana</td>
      <td headers="grp_a stub_1_2 fctr" class="gt_row gt_center">two</td>
      <td headers="grp_a stub_1_2 date" class="gt_row gt_right">2015-02-15</td>
      <td headers="grp_a stub_1_2 time" class="gt_row gt_right">14:40</td>
      <td headers="grp_a stub_1_2 datetime" class="gt_row gt_right">2018-02-02 14:33</td>
      <td headers="grp_a stub_1_2 currency" class="gt_row gt_right">17.950</td></tr>
          <tr><th id="stub_1_3" scope="row" class="gt_row gt_left gt_stub">row_3</th>
      <td headers="grp_a stub_1_3 num" class="gt_row gt_right">3.333e+01</td>
      <td headers="grp_a stub_1_3 char" class="gt_row gt_left">coconut</td>
      <td headers="grp_a stub_1_3 fctr" class="gt_row gt_center">three</td>
      <td headers="grp_a stub_1_3 date" class="gt_row gt_right">2015-03-15</td>
      <td headers="grp_a stub_1_3 time" class="gt_row gt_right">15:45</td>
      <td headers="grp_a stub_1_3 datetime" class="gt_row gt_right">2018-03-03 03:44</td>
      <td headers="grp_a stub_1_3 currency" class="gt_row gt_right">1.390</td></tr>
          <tr><th id="stub_1_4" scope="row" class="gt_row gt_left gt_stub">row_4</th>
      <td headers="grp_a stub_1_4 num" class="gt_row gt_right">4.444e+02</td>
      <td headers="grp_a stub_1_4 char" class="gt_row gt_left">durian</td>
      <td headers="grp_a stub_1_4 fctr" class="gt_row gt_center">four</td>
      <td headers="grp_a stub_1_4 date" class="gt_row gt_right">2015-04-15</td>
      <td headers="grp_a stub_1_4 time" class="gt_row gt_right">16:50</td>
      <td headers="grp_a stub_1_4 datetime" class="gt_row gt_right">2018-04-04 15:55</td>
      <td headers="grp_a stub_1_4 currency" class="gt_row gt_right">65100.000</td></tr>
          <tr class="gt_group_heading_row">
            <th colspan="8" class="gt_group_heading" scope="colgroup" id="grp_b">grp_b</th>
          </tr>
          <tr class="gt_row_group_first"><th id="stub_1_5" scope="row" class="gt_row gt_left gt_stub">row_5</th>
      <td headers="grp_b stub_1_5 num" class="gt_row gt_right">5.550e+03</td>
      <td headers="grp_b stub_1_5 char" class="gt_row gt_left">NA</td>
      <td headers="grp_b stub_1_5 fctr" class="gt_row gt_center">five</td>
      <td headers="grp_b stub_1_5 date" class="gt_row gt_right">2015-05-15</td>
      <td headers="grp_b stub_1_5 time" class="gt_row gt_right">17:55</td>
      <td headers="grp_b stub_1_5 datetime" class="gt_row gt_right">2018-05-05 04:00</td>
      <td headers="grp_b stub_1_5 currency" class="gt_row gt_right">1325.810</td></tr>
          <tr><th id="stub_1_6" scope="row" class="gt_row gt_left gt_stub">row_6</th>
      <td headers="grp_b stub_1_6 num" class="gt_row gt_right">NA</td>
      <td headers="grp_b stub_1_6 char" class="gt_row gt_left">fig</td>
      <td headers="grp_b stub_1_6 fctr" class="gt_row gt_center">six</td>
      <td headers="grp_b stub_1_6 date" class="gt_row gt_right">2015-06-15</td>
      <td headers="grp_b stub_1_6 time" class="gt_row gt_right">NA</td>
      <td headers="grp_b stub_1_6 datetime" class="gt_row gt_right">2018-06-06 16:11</td>
      <td headers="grp_b stub_1_6 currency" class="gt_row gt_right">13.255</td></tr>
          <tr><th id="stub_1_7" scope="row" class="gt_row gt_left gt_stub">row_7</th>
      <td headers="grp_b stub_1_7 num" class="gt_row gt_right">7.770e+05</td>
      <td headers="grp_b stub_1_7 char" class="gt_row gt_left">grapefruit</td>
      <td headers="grp_b stub_1_7 fctr" class="gt_row gt_center">seven</td>
      <td headers="grp_b stub_1_7 date" class="gt_row gt_right">NA</td>
      <td headers="grp_b stub_1_7 time" class="gt_row gt_right">19:10</td>
      <td headers="grp_b stub_1_7 datetime" class="gt_row gt_right">2018-07-07 05:22</td>
      <td headers="grp_b stub_1_7 currency" class="gt_row gt_right">NA</td></tr>
          <tr><th id="stub_1_8" scope="row" class="gt_row gt_left gt_stub">row_8</th>
      <td headers="grp_b stub_1_8 num" class="gt_row gt_right">8.880e+06</td>
      <td headers="grp_b stub_1_8 char" class="gt_row gt_left">honeydew</td>
      <td headers="grp_b stub_1_8 fctr" class="gt_row gt_center">eight</td>
      <td headers="grp_b stub_1_8 date" class="gt_row gt_right">2015-08-15</td>
      <td headers="grp_b stub_1_8 time" class="gt_row gt_right">20:20</td>
      <td headers="grp_b stub_1_8 datetime" class="gt_row gt_right">NA</td>
      <td headers="grp_b stub_1_8 currency" class="gt_row gt_right">0.440</td></tr>
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
            <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id="num">num</th>
            <th class="gt_col_heading gt_columns_bottom_border gt_left" rowspan="1" colspan="1" scope="col" id="char">char</th>
            <th class="gt_col_heading gt_columns_bottom_border gt_center" rowspan="1" colspan="1" scope="col" id="fctr">fctr</th>
            <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id="date">date</th>
            <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id="time">time</th>
            <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id="datetime">datetime</th>
            <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id="currency">currency</th>
          </tr>
        </thead>
        <tbody class="gt_table_body">
          <tr class="gt_group_heading_row">
            <th colspan="8" class="gt_group_heading" scope="colgroup" id="grp_a">grp_a</th>
          </tr>
          <tr class="gt_row_group_first"><th id="stub_1_1" scope="row" class="gt_row gt_left gt_stub">row_1</th>
      <td headers="grp_a stub_1_1 num" class="gt_row gt_right">1.111e-01</td>
      <td headers="grp_a stub_1_1 char" class="gt_row gt_left">apricot</td>
      <td headers="grp_a stub_1_1 fctr" class="gt_row gt_center">one</td>
      <td headers="grp_a stub_1_1 date" class="gt_row gt_right">2015-01-15</td>
      <td headers="grp_a stub_1_1 time" class="gt_row gt_right">13:35</td>
      <td headers="grp_a stub_1_1 datetime" class="gt_row gt_right">2018-01-01 02:22</td>
      <td headers="grp_a stub_1_1 currency" class="gt_row gt_right">49.950</td></tr>
          <tr><th id="stub_1_2" scope="row" class="gt_row gt_left gt_stub">row_2</th>
      <td headers="grp_a stub_1_2 num" class="gt_row gt_right">2.222e+00</td>
      <td headers="grp_a stub_1_2 char" class="gt_row gt_left" style="background-color: #90EE90;">banana</td>
      <td headers="grp_a stub_1_2 fctr" class="gt_row gt_center">two</td>
      <td headers="grp_a stub_1_2 date" class="gt_row gt_right">2015-02-15</td>
      <td headers="grp_a stub_1_2 time" class="gt_row gt_right">14:40</td>
      <td headers="grp_a stub_1_2 datetime" class="gt_row gt_right">2018-02-02 14:33</td>
      <td headers="grp_a stub_1_2 currency" class="gt_row gt_right">17.950</td></tr>
          <tr><th id="stub_1_3" scope="row" class="gt_row gt_left gt_stub">row_3</th>
      <td headers="grp_a stub_1_3 num" class="gt_row gt_right">3.333e+01</td>
      <td headers="grp_a stub_1_3 char" class="gt_row gt_left">coconut</td>
      <td headers="grp_a stub_1_3 fctr" class="gt_row gt_center">three</td>
      <td headers="grp_a stub_1_3 date" class="gt_row gt_right">2015-03-15</td>
      <td headers="grp_a stub_1_3 time" class="gt_row gt_right">15:45</td>
      <td headers="grp_a stub_1_3 datetime" class="gt_row gt_right">2018-03-03 03:44</td>
      <td headers="grp_a stub_1_3 currency" class="gt_row gt_right">1.390</td></tr>
          <tr><th id="stub_1_4" scope="row" class="gt_row gt_left gt_stub">row_4</th>
      <td headers="grp_a stub_1_4 num" class="gt_row gt_right">4.444e+02</td>
      <td headers="grp_a stub_1_4 char" class="gt_row gt_left">durian</td>
      <td headers="grp_a stub_1_4 fctr" class="gt_row gt_center">four</td>
      <td headers="grp_a stub_1_4 date" class="gt_row gt_right">2015-04-15</td>
      <td headers="grp_a stub_1_4 time" class="gt_row gt_right">16:50</td>
      <td headers="grp_a stub_1_4 datetime" class="gt_row gt_right">2018-04-04 15:55</td>
      <td headers="grp_a stub_1_4 currency" class="gt_row gt_right">65100.000</td></tr>
          <tr class="gt_group_heading_row">
            <th colspan="8" class="gt_group_heading" scope="colgroup" id="grp_b">grp_b</th>
          </tr>
          <tr class="gt_row_group_first"><th id="stub_1_5" scope="row" class="gt_row gt_left gt_stub">row_5</th>
      <td headers="grp_b stub_1_5 num" class="gt_row gt_right">5.550e+03</td>
      <td headers="grp_b stub_1_5 char" class="gt_row gt_left">NA</td>
      <td headers="grp_b stub_1_5 fctr" class="gt_row gt_center">five</td>
      <td headers="grp_b stub_1_5 date" class="gt_row gt_right">2015-05-15</td>
      <td headers="grp_b stub_1_5 time" class="gt_row gt_right">17:55</td>
      <td headers="grp_b stub_1_5 datetime" class="gt_row gt_right">2018-05-05 04:00</td>
      <td headers="grp_b stub_1_5 currency" class="gt_row gt_right">1325.810</td></tr>
          <tr><th id="stub_1_6" scope="row" class="gt_row gt_left gt_stub">row_6</th>
      <td headers="grp_b stub_1_6 num" class="gt_row gt_right">NA</td>
      <td headers="grp_b stub_1_6 char" class="gt_row gt_left">fig</td>
      <td headers="grp_b stub_1_6 fctr" class="gt_row gt_center">six</td>
      <td headers="grp_b stub_1_6 date" class="gt_row gt_right">2015-06-15</td>
      <td headers="grp_b stub_1_6 time" class="gt_row gt_right">NA</td>
      <td headers="grp_b stub_1_6 datetime" class="gt_row gt_right">2018-06-06 16:11</td>
      <td headers="grp_b stub_1_6 currency" class="gt_row gt_right">13.255</td></tr>
          <tr><th id="stub_1_7" scope="row" class="gt_row gt_left gt_stub">row_7</th>
      <td headers="grp_b stub_1_7 num" class="gt_row gt_right">7.770e+05</td>
      <td headers="grp_b stub_1_7 char" class="gt_row gt_left">grapefruit</td>
      <td headers="grp_b stub_1_7 fctr" class="gt_row gt_center">seven</td>
      <td headers="grp_b stub_1_7 date" class="gt_row gt_right">NA</td>
      <td headers="grp_b stub_1_7 time" class="gt_row gt_right">19:10</td>
      <td headers="grp_b stub_1_7 datetime" class="gt_row gt_right">2018-07-07 05:22</td>
      <td headers="grp_b stub_1_7 currency" class="gt_row gt_right">NA</td></tr>
          <tr><th id="stub_1_8" scope="row" class="gt_row gt_left gt_stub">row_8</th>
      <td headers="grp_b stub_1_8 num" class="gt_row gt_right">8.880e+06</td>
      <td headers="grp_b stub_1_8 char" class="gt_row gt_left">honeydew</td>
      <td headers="grp_b stub_1_8 fctr" class="gt_row gt_center">eight</td>
      <td headers="grp_b stub_1_8 date" class="gt_row gt_right">2015-08-15</td>
      <td headers="grp_b stub_1_8 time" class="gt_row gt_right">20:20</td>
      <td headers="grp_b stub_1_8 datetime" class="gt_row gt_right">NA</td>
      <td headers="grp_b stub_1_8 currency" class="gt_row gt_right">0.440</td></tr>
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
            <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id="num">num</th>
            <th class="gt_col_heading gt_columns_bottom_border gt_left" rowspan="1" colspan="1" scope="col" id="char">char</th>
            <th class="gt_col_heading gt_columns_bottom_border gt_center" rowspan="1" colspan="1" scope="col" id="fctr">fctr</th>
            <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id="date">date</th>
            <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id="time">time</th>
            <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id="datetime">datetime</th>
            <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id="currency">currency</th>
          </tr>
        </thead>
        <tbody class="gt_table_body">
          <tr class="gt_group_heading_row">
            <th colspan="8" class="gt_group_heading" scope="colgroup" id="grp_a">grp_a</th>
          </tr>
          <tr class="gt_row_group_first"><th id="stub_1_1" scope="row" class="gt_row gt_left gt_stub">row_1</th>
      <td headers="grp_a stub_1_1 num" class="gt_row gt_right" style="background-color: #FF8AF3;">1.111e-01</td>
      <td headers="grp_a stub_1_1 char" class="gt_row gt_left">apricot</td>
      <td headers="grp_a stub_1_1 fctr" class="gt_row gt_center">one</td>
      <td headers="grp_a stub_1_1 date" class="gt_row gt_right">2015-01-15</td>
      <td headers="grp_a stub_1_1 time" class="gt_row gt_right">13:35</td>
      <td headers="grp_a stub_1_1 datetime" class="gt_row gt_right">2018-01-01 02:22</td>
      <td headers="grp_a stub_1_1 currency" class="gt_row gt_right" style="background-color: #FF8AF3;">49.950</td></tr>
          <tr><th id="stub_1_2" scope="row" class="gt_row gt_left gt_stub">row_2</th>
      <td headers="grp_a stub_1_2 num" class="gt_row gt_right" style="background-color: #FF8AF3;">2.222e+00</td>
      <td headers="grp_a stub_1_2 char" class="gt_row gt_left">banana</td>
      <td headers="grp_a stub_1_2 fctr" class="gt_row gt_center">two</td>
      <td headers="grp_a stub_1_2 date" class="gt_row gt_right">2015-02-15</td>
      <td headers="grp_a stub_1_2 time" class="gt_row gt_right">14:40</td>
      <td headers="grp_a stub_1_2 datetime" class="gt_row gt_right">2018-02-02 14:33</td>
      <td headers="grp_a stub_1_2 currency" class="gt_row gt_right" style="background-color: #FF8AF3;">17.950</td></tr>
          <tr><th id="stub_1_3" scope="row" class="gt_row gt_left gt_stub">row_3</th>
      <td headers="grp_a stub_1_3 num" class="gt_row gt_right" style="background-color: #FF8AF3;">3.333e+01</td>
      <td headers="grp_a stub_1_3 char" class="gt_row gt_left">coconut</td>
      <td headers="grp_a stub_1_3 fctr" class="gt_row gt_center">three</td>
      <td headers="grp_a stub_1_3 date" class="gt_row gt_right">2015-03-15</td>
      <td headers="grp_a stub_1_3 time" class="gt_row gt_right">15:45</td>
      <td headers="grp_a stub_1_3 datetime" class="gt_row gt_right">2018-03-03 03:44</td>
      <td headers="grp_a stub_1_3 currency" class="gt_row gt_right" style="background-color: #FF8AF3;">1.390</td></tr>
          <tr><th id="stub_1_4" scope="row" class="gt_row gt_left gt_stub">row_4</th>
      <td headers="grp_a stub_1_4 num" class="gt_row gt_right">4.444e+02</td>
      <td headers="grp_a stub_1_4 char" class="gt_row gt_left">durian</td>
      <td headers="grp_a stub_1_4 fctr" class="gt_row gt_center">four</td>
      <td headers="grp_a stub_1_4 date" class="gt_row gt_right">2015-04-15</td>
      <td headers="grp_a stub_1_4 time" class="gt_row gt_right">16:50</td>
      <td headers="grp_a stub_1_4 datetime" class="gt_row gt_right">2018-04-04 15:55</td>
      <td headers="grp_a stub_1_4 currency" class="gt_row gt_right">65100.000</td></tr>
          <tr class="gt_group_heading_row">
            <th colspan="8" class="gt_group_heading" scope="colgroup" id="grp_b">grp_b</th>
          </tr>
          <tr class="gt_row_group_first"><th id="stub_1_5" scope="row" class="gt_row gt_left gt_stub">row_5</th>
      <td headers="grp_b stub_1_5 num" class="gt_row gt_right">5.550e+03</td>
      <td headers="grp_b stub_1_5 char" class="gt_row gt_left">NA</td>
      <td headers="grp_b stub_1_5 fctr" class="gt_row gt_center">five</td>
      <td headers="grp_b stub_1_5 date" class="gt_row gt_right">2015-05-15</td>
      <td headers="grp_b stub_1_5 time" class="gt_row gt_right">17:55</td>
      <td headers="grp_b stub_1_5 datetime" class="gt_row gt_right">2018-05-05 04:00</td>
      <td headers="grp_b stub_1_5 currency" class="gt_row gt_right">1325.810</td></tr>
          <tr><th id="stub_1_6" scope="row" class="gt_row gt_left gt_stub">row_6</th>
      <td headers="grp_b stub_1_6 num" class="gt_row gt_right">NA</td>
      <td headers="grp_b stub_1_6 char" class="gt_row gt_left">fig</td>
      <td headers="grp_b stub_1_6 fctr" class="gt_row gt_center">six</td>
      <td headers="grp_b stub_1_6 date" class="gt_row gt_right">2015-06-15</td>
      <td headers="grp_b stub_1_6 time" class="gt_row gt_right">NA</td>
      <td headers="grp_b stub_1_6 datetime" class="gt_row gt_right">2018-06-06 16:11</td>
      <td headers="grp_b stub_1_6 currency" class="gt_row gt_right" style="background-color: #FF8AF3;">13.255</td></tr>
          <tr><th id="stub_1_7" scope="row" class="gt_row gt_left gt_stub">row_7</th>
      <td headers="grp_b stub_1_7 num" class="gt_row gt_right">7.770e+05</td>
      <td headers="grp_b stub_1_7 char" class="gt_row gt_left">grapefruit</td>
      <td headers="grp_b stub_1_7 fctr" class="gt_row gt_center">seven</td>
      <td headers="grp_b stub_1_7 date" class="gt_row gt_right">NA</td>
      <td headers="grp_b stub_1_7 time" class="gt_row gt_right">19:10</td>
      <td headers="grp_b stub_1_7 datetime" class="gt_row gt_right">2018-07-07 05:22</td>
      <td headers="grp_b stub_1_7 currency" class="gt_row gt_right">NA</td></tr>
          <tr><th id="stub_1_8" scope="row" class="gt_row gt_left gt_stub">row_8</th>
      <td headers="grp_b stub_1_8 num" class="gt_row gt_right">8.880e+06</td>
      <td headers="grp_b stub_1_8 char" class="gt_row gt_left">honeydew</td>
      <td headers="grp_b stub_1_8 fctr" class="gt_row gt_center">eight</td>
      <td headers="grp_b stub_1_8 date" class="gt_row gt_right">2015-08-15</td>
      <td headers="grp_b stub_1_8 time" class="gt_row gt_right">20:20</td>
      <td headers="grp_b stub_1_8 datetime" class="gt_row gt_right">NA</td>
      <td headers="grp_b stub_1_8 currency" class="gt_row gt_right" style="background-color: #FF8AF3;">0.440</td></tr>
        </tbody>
        
      </table>

