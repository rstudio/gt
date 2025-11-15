# fmt_auto() works correctly

    Code
      cat(render_as_html(gt_tbl))
    Output
      <table class="gt_table" data-quarto-disable-processing="false" data-quarto-bootstrap="false">
        <thead>
          <tr class="gt_col_headings">
            <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id="integer">integer</th>
            <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id="amt.usd">amt.usd</th>
            <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id="sold_EUR">sold_EUR</th>
            <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id="real">real</th>
            <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id="real_small">real_small</th>
          </tr>
        </thead>
        <tbody class="gt_table_body">
          <tr><td headers="integer" class="gt_row gt_right">100</td>
      <td headers="amt.usd" class="gt_row gt_right">$23.23</td>
      <td headers="sold_EUR" class="gt_row gt_right">&#8364;3,465.20</td>
      <td headers="real" class="gt_row gt_right">23.45</td>
      <td headers="real_small" class="gt_row gt_right"> 23.45 </td></tr>
          <tr><td headers="integer" class="gt_row gt_right">8,000</td>
      <td headers="amt.usd" class="gt_row gt_right">$632.32</td>
      <td headers="sold_EUR" class="gt_row gt_right">&#8364;8,743.30</td>
      <td headers="real" class="gt_row gt_right">0.23</td>
      <td headers="real_small" class="gt_row gt_right">352.4  </td></tr>
          <tr><td headers="integer" class="gt_row gt_right">4&nbsp;×&nbsp;10<sup style='font-size: 65%;'>6</sup></td>
      <td headers="amt.usd" class="gt_row gt_right">$236.34</td>
      <td headers="sold_EUR" class="gt_row gt_right">&#8364;367.02</td>
      <td headers="real" class="gt_row gt_right">1.000&nbsp;×&nbsp;10<sup style='font-size: 65%;'>−6</sup></td>
      <td headers="real_small" class="gt_row gt_right">  0.013</td></tr>
          <tr><td headers="integer" class="gt_row gt_right">3&nbsp;×&nbsp;10<sup style='font-size: 65%;'>8</sup></td>
      <td headers="amt.usd" class="gt_row gt_right">$12.00</td>
      <td headers="sold_EUR" class="gt_row gt_right">&#8364;23.74</td>
      <td headers="real" class="gt_row gt_right">2.332&nbsp;×&nbsp;10<sup style='font-size: 65%;'>6</sup></td>
      <td headers="real_small" class="gt_row gt_right">263.8  </td></tr>
        </tbody>
        
      </table>

---

    Code
      cat(render_as_html(gt_tbl))
    Output
      <table class="gt_table" data-quarto-disable-processing="false" data-quarto-bootstrap="false">
        <thead>
          <tr class="gt_col_headings">
            <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id="integer">integer</th>
            <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id="amt.usd">amt.usd</th>
            <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id="sold_EUR">sold_EUR</th>
            <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id="real">real</th>
            <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id="real_small">real_small</th>
          </tr>
        </thead>
        <tbody class="gt_table_body">
          <tr><td headers="integer" class="gt_row gt_right">100</td>
      <td headers="amt.usd" class="gt_row gt_right">$23.23</td>
      <td headers="sold_EUR" class="gt_row gt_right">&#8364;3,465.20</td>
      <td headers="real" class="gt_row gt_right">23.45</td>
      <td headers="real_small" class="gt_row gt_right"> 23.45 </td></tr>
          <tr><td headers="integer" class="gt_row gt_right">8,000</td>
      <td headers="amt.usd" class="gt_row gt_right">$632.32</td>
      <td headers="sold_EUR" class="gt_row gt_right">&#8364;8,743.30</td>
      <td headers="real" class="gt_row gt_right">0.23</td>
      <td headers="real_small" class="gt_row gt_right">352.4  </td></tr>
          <tr><td headers="integer" class="gt_row gt_right">4.1M</td>
      <td headers="amt.usd" class="gt_row gt_right">$236.34</td>
      <td headers="sold_EUR" class="gt_row gt_right">&#8364;367.02</td>
      <td headers="real" class="gt_row gt_right">1.000&nbsp;×&nbsp;10<sup style='font-size: 65%;'>−6</sup></td>
      <td headers="real_small" class="gt_row gt_right">  0.013</td></tr>
          <tr><td headers="integer" class="gt_row gt_right">345.4M</td>
      <td headers="amt.usd" class="gt_row gt_right">$12.00</td>
      <td headers="sold_EUR" class="gt_row gt_right">&#8364;23.74</td>
      <td headers="real" class="gt_row gt_right">2.3M</td>
      <td headers="real_small" class="gt_row gt_right">263.8  </td></tr>
        </tbody>
        
      </table>

---

    Code
      cat(render_as_html(gt_tbl))
    Output
      <table class="gt_table" data-quarto-disable-processing="false" data-quarto-bootstrap="false">
        <thead>
          <tr class="gt_col_headings">
            <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id="int">int</th>
            <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id="int_like">int_like</th>
            <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id="real">real</th>
          </tr>
        </thead>
        <tbody class="gt_table_body">
          <tr><td headers="int" class="gt_row gt_right">10</td>
      <td headers="int_like" class="gt_row gt_right">10</td>
      <td headers="real" class="gt_row gt_right">10.5</td></tr>
          <tr><td headers="int" class="gt_row gt_right">100</td>
      <td headers="int_like" class="gt_row gt_right">100</td>
      <td headers="real" class="gt_row gt_right">100.5</td></tr>
          <tr><td headers="int" class="gt_row gt_right">1,000</td>
      <td headers="int_like" class="gt_row gt_right">1,000</td>
      <td headers="real" class="gt_row gt_right">1,000.5</td></tr>
          <tr><td headers="int" class="gt_row gt_right">10,000</td>
      <td headers="int_like" class="gt_row gt_right">10,000</td>
      <td headers="real" class="gt_row gt_right">10,000.5</td></tr>
          <tr><td headers="int" class="gt_row gt_right">100,000</td>
      <td headers="int_like" class="gt_row gt_right">100,000</td>
      <td headers="real" class="gt_row gt_right">100,000.5</td></tr>
          <tr><td headers="int" class="gt_row gt_right">1&nbsp;×&nbsp;10<sup style='font-size: 65%;'>6</sup></td>
      <td headers="int_like" class="gt_row gt_right">1&nbsp;×&nbsp;10<sup style='font-size: 65%;'>6</sup></td>
      <td headers="real" class="gt_row gt_right">1.000&nbsp;×&nbsp;10<sup style='font-size: 65%;'>6</sup></td></tr>
          <tr><td headers="int" class="gt_row gt_right">1&nbsp;×&nbsp;10<sup style='font-size: 65%;'>7</sup></td>
      <td headers="int_like" class="gt_row gt_right">1&nbsp;×&nbsp;10<sup style='font-size: 65%;'>7</sup></td>
      <td headers="real" class="gt_row gt_right">1.000&nbsp;×&nbsp;10<sup style='font-size: 65%;'>7</sup></td></tr>
          <tr><td headers="int" class="gt_row gt_right">1&nbsp;×&nbsp;10<sup style='font-size: 65%;'>8</sup></td>
      <td headers="int_like" class="gt_row gt_right">1&nbsp;×&nbsp;10<sup style='font-size: 65%;'>8</sup></td>
      <td headers="real" class="gt_row gt_right">1.000&nbsp;×&nbsp;10<sup style='font-size: 65%;'>8</sup></td></tr>
          <tr><td headers="int" class="gt_row gt_right">1&nbsp;×&nbsp;10<sup style='font-size: 65%;'>9</sup></td>
      <td headers="int_like" class="gt_row gt_right">1&nbsp;×&nbsp;10<sup style='font-size: 65%;'>9</sup></td>
      <td headers="real" class="gt_row gt_right">1.000&nbsp;×&nbsp;10<sup style='font-size: 65%;'>9</sup></td></tr>
        </tbody>
        
      </table>

---

    Code
      cat(render_as_html(gt_tbl))
    Output
      <table class="gt_table" data-quarto-disable-processing="false" data-quarto-bootstrap="false">
        <thead>
          <tr class="gt_col_headings">
            <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id="int">int</th>
            <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id="int_like">int_like</th>
            <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id="real">real</th>
          </tr>
        </thead>
        <tbody class="gt_table_body">
          <tr><td headers="int" class="gt_row gt_right">10</td>
      <td headers="int_like" class="gt_row gt_right">10</td>
      <td headers="real" class="gt_row gt_right">10.5</td></tr>
          <tr><td headers="int" class="gt_row gt_right">100</td>
      <td headers="int_like" class="gt_row gt_right">100</td>
      <td headers="real" class="gt_row gt_right">100.5</td></tr>
          <tr><td headers="int" class="gt_row gt_right">1,000</td>
      <td headers="int_like" class="gt_row gt_right">1,000</td>
      <td headers="real" class="gt_row gt_right">1,000.5</td></tr>
          <tr><td headers="int" class="gt_row gt_right">10,000</td>
      <td headers="int_like" class="gt_row gt_right">10,000</td>
      <td headers="real" class="gt_row gt_right">10,000.5</td></tr>
          <tr><td headers="int" class="gt_row gt_right">100,000</td>
      <td headers="int_like" class="gt_row gt_right">100,000</td>
      <td headers="real" class="gt_row gt_right">100,000.5</td></tr>
          <tr><td headers="int" class="gt_row gt_right">1M</td>
      <td headers="int_like" class="gt_row gt_right">1M</td>
      <td headers="real" class="gt_row gt_right">1M</td></tr>
          <tr><td headers="int" class="gt_row gt_right">10M</td>
      <td headers="int_like" class="gt_row gt_right">10M</td>
      <td headers="real" class="gt_row gt_right">10M</td></tr>
          <tr><td headers="int" class="gt_row gt_right">100M</td>
      <td headers="int_like" class="gt_row gt_right">100M</td>
      <td headers="real" class="gt_row gt_right">100M</td></tr>
          <tr><td headers="int" class="gt_row gt_right">1B</td>
      <td headers="int_like" class="gt_row gt_right">1B</td>
      <td headers="real" class="gt_row gt_right">1B</td></tr>
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
            <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id="volume">volume</th>
            <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id="adj_close">adj_close</th>
          </tr>
        </thead>
        <tbody class="gt_table_body">
          <tr class="gt_group_heading_row">
            <th colspan="7" class="gt_group_heading" scope="colgroup" id="W02">W02</th>
          </tr>
          <tr class="gt_row_group_first"><th id="stub_1_1" scope="row" class="gt_row gt_right gt_stub">2015-01-05</th>
      <td headers="W02 stub_1_1 open" class="gt_row gt_right">2,054.44</td>
      <td headers="W02 stub_1_1 high" class="gt_row gt_right">2,054.44</td>
      <td headers="W02 stub_1_1 low" class="gt_row gt_right">2,017.34</td>
      <td headers="W02 stub_1_1 close" class="gt_row gt_right">2,020.58</td>
      <td headers="W02 stub_1_1 volume" class="gt_row gt_right">4&nbsp;×&nbsp;10<sup style='font-size: 65%;'>9</sup></td>
      <td headers="W02 stub_1_1 adj_close" class="gt_row gt_right">2,020.58</td></tr>
          <tr><th id="stub_1_2" scope="row" class="gt_row gt_right gt_stub">2015-01-06</th>
      <td headers="W02 stub_1_2 open" class="gt_row gt_right">2,022.15</td>
      <td headers="W02 stub_1_2 high" class="gt_row gt_right">2,030.25</td>
      <td headers="W02 stub_1_2 low" class="gt_row gt_right">1,992.44</td>
      <td headers="W02 stub_1_2 close" class="gt_row gt_right">2,002.61</td>
      <td headers="W02 stub_1_2 volume" class="gt_row gt_right">4&nbsp;×&nbsp;10<sup style='font-size: 65%;'>9</sup></td>
      <td headers="W02 stub_1_2 adj_close" class="gt_row gt_right">2,002.61</td></tr>
          <tr><th id="stub_1_3" scope="row" class="gt_row gt_right gt_stub">2015-01-07</th>
      <td headers="W02 stub_1_3 open" class="gt_row gt_right">2,005.55</td>
      <td headers="W02 stub_1_3 high" class="gt_row gt_right">2,029.61</td>
      <td headers="W02 stub_1_3 low" class="gt_row gt_right">2,005.55</td>
      <td headers="W02 stub_1_3 close" class="gt_row gt_right">2,025.9 </td>
      <td headers="W02 stub_1_3 volume" class="gt_row gt_right">4&nbsp;×&nbsp;10<sup style='font-size: 65%;'>9</sup></td>
      <td headers="W02 stub_1_3 adj_close" class="gt_row gt_right">2,025.9 </td></tr>
          <tr><th id="stub_1_4" scope="row" class="gt_row gt_right gt_stub">2015-01-08</th>
      <td headers="W02 stub_1_4 open" class="gt_row gt_right">2,030.61</td>
      <td headers="W02 stub_1_4 high" class="gt_row gt_right">2,064.08</td>
      <td headers="W02 stub_1_4 low" class="gt_row gt_right">2,030.61</td>
      <td headers="W02 stub_1_4 close" class="gt_row gt_right">2,062.14</td>
      <td headers="W02 stub_1_4 volume" class="gt_row gt_right">4&nbsp;×&nbsp;10<sup style='font-size: 65%;'>9</sup></td>
      <td headers="W02 stub_1_4 adj_close" class="gt_row gt_right">2,062.14</td></tr>
          <tr><th id="stub_1_5" scope="row" class="gt_row gt_right gt_stub">2015-01-09</th>
      <td headers="W02 stub_1_5 open" class="gt_row gt_right">2,063.45</td>
      <td headers="W02 stub_1_5 high" class="gt_row gt_right">2,064.43</td>
      <td headers="W02 stub_1_5 low" class="gt_row gt_right">2,038.33</td>
      <td headers="W02 stub_1_5 close" class="gt_row gt_right">2,044.81</td>
      <td headers="W02 stub_1_5 volume" class="gt_row gt_right">3&nbsp;×&nbsp;10<sup style='font-size: 65%;'>9</sup></td>
      <td headers="W02 stub_1_5 adj_close" class="gt_row gt_right">2,044.81</td></tr>
          <tr class="gt_group_heading_row">
            <th colspan="7" class="gt_group_heading" scope="colgroup" id="W03">W03</th>
          </tr>
          <tr class="gt_row_group_first"><th id="stub_1_6" scope="row" class="gt_row gt_right gt_stub">2015-01-12</th>
      <td headers="W03 stub_1_6 open" class="gt_row gt_right">2,046.13</td>
      <td headers="W03 stub_1_6 high" class="gt_row gt_right">2,049.3 </td>
      <td headers="W03 stub_1_6 low" class="gt_row gt_right">2,022.58</td>
      <td headers="W03 stub_1_6 close" class="gt_row gt_right">2,028.26</td>
      <td headers="W03 stub_1_6 volume" class="gt_row gt_right">3&nbsp;×&nbsp;10<sup style='font-size: 65%;'>9</sup></td>
      <td headers="W03 stub_1_6 adj_close" class="gt_row gt_right">2,028.26</td></tr>
          <tr><th id="stub_1_7" scope="row" class="gt_row gt_right gt_stub">2015-01-13</th>
      <td headers="W03 stub_1_7 open" class="gt_row gt_right">2,031.58</td>
      <td headers="W03 stub_1_7 high" class="gt_row gt_right">2,056.93</td>
      <td headers="W03 stub_1_7 low" class="gt_row gt_right">2,008.25</td>
      <td headers="W03 stub_1_7 close" class="gt_row gt_right">2,023.03</td>
      <td headers="W03 stub_1_7 volume" class="gt_row gt_right">4&nbsp;×&nbsp;10<sup style='font-size: 65%;'>9</sup></td>
      <td headers="W03 stub_1_7 adj_close" class="gt_row gt_right">2,023.03</td></tr>
          <tr><th id="stub_1_8" scope="row" class="gt_row gt_right gt_stub">2015-01-14</th>
      <td headers="W03 stub_1_8 open" class="gt_row gt_right">2,018.4 </td>
      <td headers="W03 stub_1_8 high" class="gt_row gt_right">2,018.4 </td>
      <td headers="W03 stub_1_8 low" class="gt_row gt_right">1,988.44</td>
      <td headers="W03 stub_1_8 close" class="gt_row gt_right">2,011.27</td>
      <td headers="W03 stub_1_8 volume" class="gt_row gt_right">4&nbsp;×&nbsp;10<sup style='font-size: 65%;'>9</sup></td>
      <td headers="W03 stub_1_8 adj_close" class="gt_row gt_right">2,011.27</td></tr>
          <tr><th id="stub_1_9" scope="row" class="gt_row gt_right gt_stub">2015-01-15</th>
      <td headers="W03 stub_1_9 open" class="gt_row gt_right">2,013.75</td>
      <td headers="W03 stub_1_9 high" class="gt_row gt_right">2,021.35</td>
      <td headers="W03 stub_1_9 low" class="gt_row gt_right">1,991.47</td>
      <td headers="W03 stub_1_9 close" class="gt_row gt_right">1,992.67</td>
      <td headers="W03 stub_1_9 volume" class="gt_row gt_right">4&nbsp;×&nbsp;10<sup style='font-size: 65%;'>9</sup></td>
      <td headers="W03 stub_1_9 adj_close" class="gt_row gt_right">1,992.67</td></tr>
          <tr><th id="stub_1_10" scope="row" class="gt_row gt_right gt_stub">2015-01-16</th>
      <td headers="W03 stub_1_10 open" class="gt_row gt_right">1,992.25</td>
      <td headers="W03 stub_1_10 high" class="gt_row gt_right">2,020.46</td>
      <td headers="W03 stub_1_10 low" class="gt_row gt_right">1,988.12</td>
      <td headers="W03 stub_1_10 close" class="gt_row gt_right">2,019.42</td>
      <td headers="W03 stub_1_10 volume" class="gt_row gt_right">4&nbsp;×&nbsp;10<sup style='font-size: 65%;'>9</sup></td>
      <td headers="W03 stub_1_10 adj_close" class="gt_row gt_right">2,019.42</td></tr>
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
            <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id="volume">volume</th>
            <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id="adj_close">adj_close</th>
          </tr>
        </thead>
        <tbody class="gt_table_body">
          <tr class="gt_group_heading_row">
            <th colspan="7" class="gt_group_heading" scope="colgroup" id="W02">W02</th>
          </tr>
          <tr class="gt_row_group_first"><th id="stub_1_1" scope="row" class="gt_row gt_right gt_stub">2015-01-05</th>
      <td headers="W02 stub_1_1 open" class="gt_row gt_right">2,054.44</td>
      <td headers="W02 stub_1_1 high" class="gt_row gt_right">2,054.44</td>
      <td headers="W02 stub_1_1 low" class="gt_row gt_right">2,017.34</td>
      <td headers="W02 stub_1_1 close" class="gt_row gt_right">2,020.58</td>
      <td headers="W02 stub_1_1 volume" class="gt_row gt_right">3.8B</td>
      <td headers="W02 stub_1_1 adj_close" class="gt_row gt_right">2,020.58</td></tr>
          <tr><th id="stub_1_2" scope="row" class="gt_row gt_right gt_stub">2015-01-06</th>
      <td headers="W02 stub_1_2 open" class="gt_row gt_right">2,022.15</td>
      <td headers="W02 stub_1_2 high" class="gt_row gt_right">2,030.25</td>
      <td headers="W02 stub_1_2 low" class="gt_row gt_right">1,992.44</td>
      <td headers="W02 stub_1_2 close" class="gt_row gt_right">2,002.61</td>
      <td headers="W02 stub_1_2 volume" class="gt_row gt_right">4.5B</td>
      <td headers="W02 stub_1_2 adj_close" class="gt_row gt_right">2,002.61</td></tr>
          <tr><th id="stub_1_3" scope="row" class="gt_row gt_right gt_stub">2015-01-07</th>
      <td headers="W02 stub_1_3 open" class="gt_row gt_right">2,005.55</td>
      <td headers="W02 stub_1_3 high" class="gt_row gt_right">2,029.61</td>
      <td headers="W02 stub_1_3 low" class="gt_row gt_right">2,005.55</td>
      <td headers="W02 stub_1_3 close" class="gt_row gt_right">2,025.9 </td>
      <td headers="W02 stub_1_3 volume" class="gt_row gt_right">3.8B</td>
      <td headers="W02 stub_1_3 adj_close" class="gt_row gt_right">2,025.9 </td></tr>
          <tr><th id="stub_1_4" scope="row" class="gt_row gt_right gt_stub">2015-01-08</th>
      <td headers="W02 stub_1_4 open" class="gt_row gt_right">2,030.61</td>
      <td headers="W02 stub_1_4 high" class="gt_row gt_right">2,064.08</td>
      <td headers="W02 stub_1_4 low" class="gt_row gt_right">2,030.61</td>
      <td headers="W02 stub_1_4 close" class="gt_row gt_right">2,062.14</td>
      <td headers="W02 stub_1_4 volume" class="gt_row gt_right">3.9B</td>
      <td headers="W02 stub_1_4 adj_close" class="gt_row gt_right">2,062.14</td></tr>
          <tr><th id="stub_1_5" scope="row" class="gt_row gt_right gt_stub">2015-01-09</th>
      <td headers="W02 stub_1_5 open" class="gt_row gt_right">2,063.45</td>
      <td headers="W02 stub_1_5 high" class="gt_row gt_right">2,064.43</td>
      <td headers="W02 stub_1_5 low" class="gt_row gt_right">2,038.33</td>
      <td headers="W02 stub_1_5 close" class="gt_row gt_right">2,044.81</td>
      <td headers="W02 stub_1_5 volume" class="gt_row gt_right">3.4B</td>
      <td headers="W02 stub_1_5 adj_close" class="gt_row gt_right">2,044.81</td></tr>
          <tr class="gt_group_heading_row">
            <th colspan="7" class="gt_group_heading" scope="colgroup" id="W03">W03</th>
          </tr>
          <tr class="gt_row_group_first"><th id="stub_1_6" scope="row" class="gt_row gt_right gt_stub">2015-01-12</th>
      <td headers="W03 stub_1_6 open" class="gt_row gt_right">2,046.13</td>
      <td headers="W03 stub_1_6 high" class="gt_row gt_right">2,049.3 </td>
      <td headers="W03 stub_1_6 low" class="gt_row gt_right">2,022.58</td>
      <td headers="W03 stub_1_6 close" class="gt_row gt_right">2,028.26</td>
      <td headers="W03 stub_1_6 volume" class="gt_row gt_right">3.5B</td>
      <td headers="W03 stub_1_6 adj_close" class="gt_row gt_right">2,028.26</td></tr>
          <tr><th id="stub_1_7" scope="row" class="gt_row gt_right gt_stub">2015-01-13</th>
      <td headers="W03 stub_1_7 open" class="gt_row gt_right">2,031.58</td>
      <td headers="W03 stub_1_7 high" class="gt_row gt_right">2,056.93</td>
      <td headers="W03 stub_1_7 low" class="gt_row gt_right">2,008.25</td>
      <td headers="W03 stub_1_7 close" class="gt_row gt_right">2,023.03</td>
      <td headers="W03 stub_1_7 volume" class="gt_row gt_right">4.1B</td>
      <td headers="W03 stub_1_7 adj_close" class="gt_row gt_right">2,023.03</td></tr>
          <tr><th id="stub_1_8" scope="row" class="gt_row gt_right gt_stub">2015-01-14</th>
      <td headers="W03 stub_1_8 open" class="gt_row gt_right">2,018.4 </td>
      <td headers="W03 stub_1_8 high" class="gt_row gt_right">2,018.4 </td>
      <td headers="W03 stub_1_8 low" class="gt_row gt_right">1,988.44</td>
      <td headers="W03 stub_1_8 close" class="gt_row gt_right">2,011.27</td>
      <td headers="W03 stub_1_8 volume" class="gt_row gt_right">4.4B</td>
      <td headers="W03 stub_1_8 adj_close" class="gt_row gt_right">2,011.27</td></tr>
          <tr><th id="stub_1_9" scope="row" class="gt_row gt_right gt_stub">2015-01-15</th>
      <td headers="W03 stub_1_9 open" class="gt_row gt_right">2,013.75</td>
      <td headers="W03 stub_1_9 high" class="gt_row gt_right">2,021.35</td>
      <td headers="W03 stub_1_9 low" class="gt_row gt_right">1,991.47</td>
      <td headers="W03 stub_1_9 close" class="gt_row gt_right">1,992.67</td>
      <td headers="W03 stub_1_9 volume" class="gt_row gt_right">4.3B</td>
      <td headers="W03 stub_1_9 adj_close" class="gt_row gt_right">1,992.67</td></tr>
          <tr><th id="stub_1_10" scope="row" class="gt_row gt_right gt_stub">2015-01-16</th>
      <td headers="W03 stub_1_10 open" class="gt_row gt_right">1,992.25</td>
      <td headers="W03 stub_1_10 high" class="gt_row gt_right">2,020.46</td>
      <td headers="W03 stub_1_10 low" class="gt_row gt_right">1,988.12</td>
      <td headers="W03 stub_1_10 close" class="gt_row gt_right">2,019.42</td>
      <td headers="W03 stub_1_10 volume" class="gt_row gt_right">4.1B</td>
      <td headers="W03 stub_1_10 adj_close" class="gt_row gt_right">2,019.42</td></tr>
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
          </tr>
        </thead>
        <tbody class="gt_table_body">
          <tr><td headers="num" class="gt_row gt_right">10</td></tr>
          <tr><td headers="num" class="gt_row gt_right">100</td></tr>
          <tr><td headers="num" class="gt_row gt_right">1,000</td></tr>
          <tr><td headers="num" class="gt_row gt_right">10,000</td></tr>
          <tr><td headers="num" class="gt_row gt_right">100,000</td></tr>
          <tr><td headers="num" class="gt_row gt_right">1.000&nbsp;×&nbsp;10<sup style='font-size: 65%;'>6</sup></td></tr>
          <tr><td headers="num" class="gt_row gt_right">1.000&nbsp;×&nbsp;10<sup style='font-size: 65%;'>7</sup></td></tr>
          <tr><td headers="num" class="gt_row gt_right">1.000&nbsp;×&nbsp;10<sup style='font-size: 65%;'>8</sup></td></tr>
          <tr><td headers="num" class="gt_row gt_right">1.000&nbsp;×&nbsp;10<sup style='font-size: 65%;'>9</sup></td></tr>
          <tr><td headers="num" class="gt_row gt_right">1.000&nbsp;×&nbsp;10<sup style='font-size: 65%;'>10</sup></td></tr>
          <tr><td headers="num" class="gt_row gt_right">1.000&nbsp;×&nbsp;10<sup style='font-size: 65%;'>11</sup></td></tr>
          <tr><td headers="num" class="gt_row gt_right">1.000&nbsp;×&nbsp;10<sup style='font-size: 65%;'>12</sup></td></tr>
          <tr><td headers="num" class="gt_row gt_right">1.000&nbsp;×&nbsp;10<sup style='font-size: 65%;'>13</sup></td></tr>
          <tr><td headers="num" class="gt_row gt_right">1.000&nbsp;×&nbsp;10<sup style='font-size: 65%;'>14</sup></td></tr>
          <tr><td headers="num" class="gt_row gt_right">1.000&nbsp;×&nbsp;10<sup style='font-size: 65%;'>15</sup></td></tr>
          <tr><td headers="num" class="gt_row gt_right">1.000&nbsp;×&nbsp;10<sup style='font-size: 65%;'>16</sup></td></tr>
          <tr><td headers="num" class="gt_row gt_right">1.000&nbsp;×&nbsp;10<sup style='font-size: 65%;'>17</sup></td></tr>
          <tr><td headers="num" class="gt_row gt_right">1.000&nbsp;×&nbsp;10<sup style='font-size: 65%;'>18</sup></td></tr>
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
          </tr>
        </thead>
        <tbody class="gt_table_body">
          <tr><td headers="num" class="gt_row gt_right">10</td></tr>
          <tr><td headers="num" class="gt_row gt_right">100</td></tr>
          <tr><td headers="num" class="gt_row gt_right">1,000</td></tr>
          <tr><td headers="num" class="gt_row gt_right">10,000</td></tr>
          <tr><td headers="num" class="gt_row gt_right">100,000</td></tr>
          <tr><td headers="num" class="gt_row gt_right">1M</td></tr>
          <tr><td headers="num" class="gt_row gt_right">10M</td></tr>
          <tr><td headers="num" class="gt_row gt_right">100M</td></tr>
          <tr><td headers="num" class="gt_row gt_right">1B</td></tr>
          <tr><td headers="num" class="gt_row gt_right">10B</td></tr>
          <tr><td headers="num" class="gt_row gt_right">100B</td></tr>
          <tr><td headers="num" class="gt_row gt_right">1T</td></tr>
          <tr><td headers="num" class="gt_row gt_right">10T</td></tr>
          <tr><td headers="num" class="gt_row gt_right">100T</td></tr>
          <tr><td headers="num" class="gt_row gt_right">1.000&nbsp;×&nbsp;10<sup style='font-size: 65%;'>15</sup></td></tr>
          <tr><td headers="num" class="gt_row gt_right">1.000&nbsp;×&nbsp;10<sup style='font-size: 65%;'>16</sup></td></tr>
          <tr><td headers="num" class="gt_row gt_right">1.000&nbsp;×&nbsp;10<sup style='font-size: 65%;'>17</sup></td></tr>
          <tr><td headers="num" class="gt_row gt_right">1.000&nbsp;×&nbsp;10<sup style='font-size: 65%;'>18</sup></td></tr>
        </tbody>
        
      </table>

---

    Code
      cat(render_as_html(gt_tbl))
    Output
      <table class="gt_table" data-quarto-disable-processing="false" data-quarto-bootstrap="false">
        <thead>
          <tr class="gt_col_headings">
            <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id="integer">integer</th>
            <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id="amt.usd">amt.usd</th>
            <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id="sold_EUR">sold_EUR</th>
            <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id="real">real</th>
            <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id="real_small">real_small</th>
          </tr>
        </thead>
        <tbody class="gt_table_body">
          <tr><td headers="integer" class="gt_row gt_right">100</td>
      <td headers="amt.usd" class="gt_row gt_right">$23.23</td>
      <td headers="sold_EUR" class="gt_row gt_right">3465.20</td>
      <td headers="real" class="gt_row gt_right">2.345000e+01</td>
      <td headers="real_small" class="gt_row gt_right">23.450</td></tr>
          <tr><td headers="integer" class="gt_row gt_right">8,000</td>
      <td headers="amt.usd" class="gt_row gt_right">$632.32</td>
      <td headers="sold_EUR" class="gt_row gt_right">8743.30</td>
      <td headers="real" class="gt_row gt_right">2.300000e-01</td>
      <td headers="real_small" class="gt_row gt_right">352.400</td></tr>
          <tr><td headers="integer" class="gt_row gt_right">4&nbsp;×&nbsp;10<sup style='font-size: 65%;'>6</sup></td>
      <td headers="amt.usd" class="gt_row gt_right">$236.34</td>
      <td headers="sold_EUR" class="gt_row gt_right">367.02</td>
      <td headers="real" class="gt_row gt_right">1.000000e-06</td>
      <td headers="real_small" class="gt_row gt_right">0.013</td></tr>
          <tr><td headers="integer" class="gt_row gt_right">3&nbsp;×&nbsp;10<sup style='font-size: 65%;'>8</sup></td>
      <td headers="amt.usd" class="gt_row gt_right">$12.00</td>
      <td headers="sold_EUR" class="gt_row gt_right">23.74</td>
      <td headers="real" class="gt_row gt_right">2.332453e+06</td>
      <td headers="real_small" class="gt_row gt_right">263.800</td></tr>
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
          </tr>
        </thead>
        <tbody class="gt_table_body">
          <tr><td headers="num" class="gt_row gt_right">1e+01</td></tr>
          <tr><td headers="num" class="gt_row gt_right">100</td></tr>
          <tr><td headers="num" class="gt_row gt_right">1e+03</td></tr>
          <tr><td headers="num" class="gt_row gt_right">10,000</td></tr>
          <tr><td headers="num" class="gt_row gt_right">1e+05</td></tr>
          <tr><td headers="num" class="gt_row gt_right">1M</td></tr>
          <tr><td headers="num" class="gt_row gt_right">1e+07</td></tr>
          <tr><td headers="num" class="gt_row gt_right">100M</td></tr>
          <tr><td headers="num" class="gt_row gt_right">1e+09</td></tr>
          <tr><td headers="num" class="gt_row gt_right">1e+10</td></tr>
          <tr><td headers="num" class="gt_row gt_right">1e+11</td></tr>
          <tr><td headers="num" class="gt_row gt_right">1e+12</td></tr>
          <tr><td headers="num" class="gt_row gt_right">1e+13</td></tr>
          <tr><td headers="num" class="gt_row gt_right">1e+14</td></tr>
          <tr><td headers="num" class="gt_row gt_right">1e+15</td></tr>
          <tr><td headers="num" class="gt_row gt_right">1e+16</td></tr>
          <tr><td headers="num" class="gt_row gt_right">1e+17</td></tr>
          <tr><td headers="num" class="gt_row gt_right">1e+18</td></tr>
        </tbody>
        
      </table>

