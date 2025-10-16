# summary_rows() informs to use grand_summary_rows() if no groups are present (#1292).

    Code
      gt::summary_rows(gt::gt(dplyr::select(mtcars_short, gear), rownames_to_stub = TRUE),
      fns = "sum")
    Condition
      Error:
      ! Since gt v0.9.0, `groups = everything()` is deprecated in `summary_rows()` if no row groups are present.
      i Use `grand_summary_rows()` instead or add row groups.

# Using `groups = NULL` in `summary_rows()` is a deprecated option

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
          <tr><th id="stub_1_10" scope="row" class="gt_row gt_right gt_stub">2015-01-16</th>
      <td headers="W03 stub_1_10 open" class="gt_row gt_right">1992.25</td>
      <td headers="W03 stub_1_10 high" class="gt_row gt_right">2020.46</td>
      <td headers="W03 stub_1_10 low" class="gt_row gt_right">1988.12</td>
      <td headers="W03 stub_1_10 close" class="gt_row gt_right">2019.42</td></tr>
          <tr><th id="grand_summary_stub_1" scope="row" class="gt_row gt_left gt_stub gt_grand_summary_row gt_first_grand_summary_row">average</th>
      <td headers="grand_summary_stub_1 open" class="gt_row gt_right gt_grand_summary_row gt_first_grand_summary_row">2027.83099</td>
      <td headers="grand_summary_stub_1 high" class="gt_row gt_right gt_grand_summary_row gt_first_grand_summary_row">—</td>
      <td headers="grand_summary_stub_1 low" class="gt_row gt_right gt_grand_summary_row gt_first_grand_summary_row">—</td>
      <td headers="grand_summary_stub_1 close" class="gt_row gt_right gt_grand_summary_row gt_first_grand_summary_row">—</td></tr>
          <tr><th id="grand_summary_stub_2" scope="row" class="gt_row gt_left gt_stub gt_grand_summary_row">total</th>
      <td headers="grand_summary_stub_2 open" class="gt_row gt_right gt_grand_summary_row">20278.30990</td>
      <td headers="grand_summary_stub_2 high" class="gt_row gt_right gt_grand_summary_row">—</td>
      <td headers="grand_summary_stub_2 low" class="gt_row gt_right gt_grand_summary_row">—</td>
      <td headers="grand_summary_stub_2 close" class="gt_row gt_right gt_grand_summary_row">—</td></tr>
          <tr><th id="grand_summary_stub_3" scope="row" class="gt_row gt_left gt_stub gt_grand_summary_row gt_last_summary_row">std dev</th>
      <td headers="grand_summary_stub_3 open" class="gt_row gt_right gt_grand_summary_row gt_last_summary_row">22.14929</td>
      <td headers="grand_summary_stub_3 high" class="gt_row gt_right gt_grand_summary_row gt_last_summary_row">—</td>
      <td headers="grand_summary_stub_3 low" class="gt_row gt_right gt_grand_summary_row gt_last_summary_row">—</td>
      <td headers="grand_summary_stub_3 close" class="gt_row gt_right gt_grand_summary_row gt_last_summary_row">—</td></tr>
        </tbody>
        
      </table>

---

    Code
      as.character(as_latex(gt_tbl))
    Output
      [1] "\\begingroup\n\\fontsize{12.0pt}{14.0pt}\\selectfont\n\\begin{longtable}{l|rrrr}\n\\toprule\n & open & high & low & close \\\\ \n\\midrule\\addlinespace[2.5pt]\n\\multicolumn{5}{l}{W02} \\\\[2.5pt] \n\\midrule\\addlinespace[2.5pt]\n16440 & 2054.44 & 2054.44 & 2017.34 & 2020.58 \\\\ \n16441 & 2022.15 & 2030.25 & 1992.44 & 2002.61 \\\\ \n16442 & 2005.55 & 2029.61 & 2005.55 & 2025.90 \\\\ \n16443 & 2030.61 & 2064.08 & 2030.61 & 2062.14 \\\\ \n16444 & 2063.45 & 2064.43 & 2038.33 & 2044.81 \\\\ \n\\midrule\\addlinespace[2.5pt]\n\\multicolumn{5}{l}{W03} \\\\[2.5pt] \n\\midrule\\addlinespace[2.5pt]\n16447 & 2046.13 & 2049.30 & 2022.58 & 2028.26 \\\\ \n16448 & 2031.58 & 2056.93 & 2008.25 & 2023.03 \\\\ \n16449 & 2018.40 & 2018.40 & 1988.44 & 2011.27 \\\\ \n16450 & 2013.75 & 2021.35 & 1991.47 & 1992.67 \\\\ \n16451 & 1992.25 & 2020.46 & 1988.12 & 2019.42 \\\\ \n\\midrule \n\\midrule \naverage & 2027.83099 & — & — & — \\\\ \ntotal & 20278.30990 & — & — & — \\\\ \nstd dev & 22.14929 & — & — & — \\\\ \n\\bottomrule\n\\end{longtable}\n\\endgroup\n"

---

    Code
      as_rtf(gt_tbl)
    Output
      {\rtf\ansi\ansicpg1252{\fonttbl{\f0\froman\fcharset0\fprq0 Courier New;}{\f1\froman\fcharset0\fprq0 Times;}}{\colortbl;\red211\green211\blue211;}
      
      \paperw12240\paperh15840\widowctrl\ftnbj\fet0\sectd\linex0
      \lndscpsxn
      \margl1440\margr1440\margt1440\margb1440
      \headery720\footery720\fs20
      
      \trowd\trrh0\trhdr
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85\clbrdrb\brdrs\brdrw20\brdrcf1 \cellx1872
      \intbl {\f0 {\f0\fs20 }}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85\clbrdrb\brdrs\brdrw20\brdrcf1 \cellx3744
      \intbl {\f0 {\f0\fs20 open}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85\clbrdrb\brdrs\brdrw20\brdrcf1 \cellx5616
      \intbl {\f0 {\f0\fs20 high}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85\clbrdrb\brdrs\brdrw20\brdrcf1 \cellx7488
      \intbl {\f0 {\f0\fs20 low}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85\clbrdrb\brdrs\brdrw20\brdrcf1 \cellx9360
      \intbl {\f0 {\f0\fs20 close}}\cell
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\ql\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx9360
      \intbl {\f0\fs20 W02}\cell
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx1872
      \intbl {\f0 {\f0\fs20 16440}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx3744
      \intbl {\f0 {\f0\fs20 2054.44}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx5616
      \intbl {\f0 {\f0\fs20 2054.44}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx7488
      \intbl {\f0 {\f0\fs20 2017.34}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx9360
      \intbl {\f0 {\f0\fs20 2020.58}}\cell
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx1872
      \intbl {\f0 {\f0\fs20 16441}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx3744
      \intbl {\f0 {\f0\fs20 2022.15}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx5616
      \intbl {\f0 {\f0\fs20 2030.25}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx7488
      \intbl {\f0 {\f0\fs20 1992.44}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx9360
      \intbl {\f0 {\f0\fs20 2002.61}}\cell
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx1872
      \intbl {\f0 {\f0\fs20 16442}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx3744
      \intbl {\f0 {\f0\fs20 2005.55}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx5616
      \intbl {\f0 {\f0\fs20 2029.61}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx7488
      \intbl {\f0 {\f0\fs20 2005.55}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx9360
      \intbl {\f0 {\f0\fs20 2025.90}}\cell
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx1872
      \intbl {\f0 {\f0\fs20 16443}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx3744
      \intbl {\f0 {\f0\fs20 2030.61}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx5616
      \intbl {\f0 {\f0\fs20 2064.08}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx7488
      \intbl {\f0 {\f0\fs20 2030.61}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx9360
      \intbl {\f0 {\f0\fs20 2062.14}}\cell
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx1872
      \intbl {\f0 {\f0\fs20 16444}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx3744
      \intbl {\f0 {\f0\fs20 2063.45}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx5616
      \intbl {\f0 {\f0\fs20 2064.43}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx7488
      \intbl {\f0 {\f0\fs20 2038.33}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx9360
      \intbl {\f0 {\f0\fs20 2044.81}}\cell
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\ql\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx9360
      \intbl {\f0\fs20 W03}\cell
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx1872
      \intbl {\f0 {\f0\fs20 16447}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx3744
      \intbl {\f0 {\f0\fs20 2046.13}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx5616
      \intbl {\f0 {\f0\fs20 2049.30}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx7488
      \intbl {\f0 {\f0\fs20 2022.58}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx9360
      \intbl {\f0 {\f0\fs20 2028.26}}\cell
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx1872
      \intbl {\f0 {\f0\fs20 16448}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx3744
      \intbl {\f0 {\f0\fs20 2031.58}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx5616
      \intbl {\f0 {\f0\fs20 2056.93}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx7488
      \intbl {\f0 {\f0\fs20 2008.25}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx9360
      \intbl {\f0 {\f0\fs20 2023.03}}\cell
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx1872
      \intbl {\f0 {\f0\fs20 16449}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx3744
      \intbl {\f0 {\f0\fs20 2018.40}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx5616
      \intbl {\f0 {\f0\fs20 2018.40}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx7488
      \intbl {\f0 {\f0\fs20 1988.44}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx9360
      \intbl {\f0 {\f0\fs20 2011.27}}\cell
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx1872
      \intbl {\f0 {\f0\fs20 16450}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx3744
      \intbl {\f0 {\f0\fs20 2013.75}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx5616
      \intbl {\f0 {\f0\fs20 2021.35}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx7488
      \intbl {\f0 {\f0\fs20 1991.47}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx9360
      \intbl {\f0 {\f0\fs20 1992.67}}\cell
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx1872
      \intbl {\f0 {\f0\fs20 16451}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx3744
      \intbl {\f0 {\f0\fs20 1992.25}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx5616
      \intbl {\f0 {\f0\fs20 2020.46}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx7488
      \intbl {\f0 {\f0\fs20 1988.12}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx9360
      \intbl {\f0 {\f0\fs20 2019.42}}\cell
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx1872
      \intbl {\f0 {\f0\fs20 average}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx3744
      \intbl {\f0 {\f0\fs20 2027.83099}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx5616
      \intbl {\f0 {\f0\fs20 \'97}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx7488
      \intbl {\f0 {\f0\fs20 \'97}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx9360
      \intbl {\f0 {\f0\fs20 \'97}}\cell
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx1872
      \intbl {\f0 {\f0\fs20 total}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx3744
      \intbl {\f0 {\f0\fs20 20278.30990}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx5616
      \intbl {\f0 {\f0\fs20 \'97}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx7488
      \intbl {\f0 {\f0\fs20 \'97}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx9360
      \intbl {\f0 {\f0\fs20 \'97}}\cell
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx1872
      \intbl {\f0 {\f0\fs20 std dev}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx3744
      \intbl {\f0 {\f0\fs20 22.14929}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx5616
      \intbl {\f0 {\f0\fs20 \'97}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx7488
      \intbl {\f0 {\f0\fs20 \'97}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx9360
      \intbl {\f0 {\f0\fs20 \'97}}\cell
      
      \row
      
      }

# Summary rows can be added to the top of any group

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
          <tr><th id="summary_stub_W02_1" scope="row" class="gt_row gt_left gt_stub gt_summary_row gt_first_summary_row thick">min</th>
      <td headers="W02 summary_stub_W02_1 open" class="gt_row gt_right gt_summary_row gt_first_summary_row thick">2005.55</td>
      <td headers="W02 summary_stub_W02_1 high" class="gt_row gt_right gt_summary_row gt_first_summary_row thick">2029.61</td>
      <td headers="W02 summary_stub_W02_1 low" class="gt_row gt_right gt_summary_row gt_first_summary_row thick">1992.44</td>
      <td headers="W02 summary_stub_W02_1 close" class="gt_row gt_right gt_summary_row gt_first_summary_row thick">2002.61</td></tr>
          <tr><th id="summary_stub_W02_2" scope="row" class="gt_row gt_left gt_stub gt_summary_row">max</th>
      <td headers="W02 summary_stub_W02_2 open" class="gt_row gt_right gt_summary_row">2063.45</td>
      <td headers="W02 summary_stub_W02_2 high" class="gt_row gt_right gt_summary_row">2064.43</td>
      <td headers="W02 summary_stub_W02_2 low" class="gt_row gt_right gt_summary_row">2038.33</td>
      <td headers="W02 summary_stub_W02_2 close" class="gt_row gt_right gt_summary_row">2062.14</td></tr>
          <tr><th id="summary_stub_W02_3" scope="row" class="gt_row gt_left gt_stub gt_summary_row gt_last_summary_row">avg</th>
      <td headers="W02 summary_stub_W02_3 open" class="gt_row gt_right gt_summary_row gt_last_summary_row">2035.24</td>
      <td headers="W02 summary_stub_W02_3 high" class="gt_row gt_right gt_summary_row gt_last_summary_row">2048.56</td>
      <td headers="W02 summary_stub_W02_3 low" class="gt_row gt_right gt_summary_row gt_last_summary_row">2016.85</td>
      <td headers="W02 summary_stub_W02_3 close" class="gt_row gt_right gt_summary_row gt_last_summary_row">2031.21</td></tr>
          <tr class="gt_row_group_first"><th id="stub_1_1" scope="row" class="gt_row gt_right gt_stub">2015-01-05</th>
      <td headers="W02 stub_1_1 open" class="gt_row gt_right">2054.44</td>
      <td headers="W02 stub_1_1 high" class="gt_row gt_right">2054.44</td>
      <td headers="W02 stub_1_1 low" class="gt_row gt_right">2017.34</td>
      <td headers="W02 stub_1_1 close" class="gt_row gt_right">2020.58</td></tr>
          <tr><th id="stub_1_2" scope="row" class="gt_row gt_right gt_stub">2015-01-06</th>
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
          <tr><th id="stub_1_10" scope="row" class="gt_row gt_right gt_stub">2015-01-16</th>
      <td headers="W03 stub_1_10 open" class="gt_row gt_right">1992.25</td>
      <td headers="W03 stub_1_10 high" class="gt_row gt_right">2020.46</td>
      <td headers="W03 stub_1_10 low" class="gt_row gt_right">1988.12</td>
      <td headers="W03 stub_1_10 close" class="gt_row gt_right">2019.42</td></tr>
        </tbody>
        
      </table>

---

    Code
      as.character(as_latex(gt_tbl))
    Output
      [1] "\\begingroup\n\\fontsize{12.0pt}{14.0pt}\\selectfont\n\\begin{longtable}{l|rrrr}\n\\toprule\n & open & high & low & close \\\\ \n\\midrule\\addlinespace[2.5pt]\n\\multicolumn{5}{l}{W02} \\\\[2.5pt] \n\\midrule\\addlinespace[2.5pt]\nmin & 2005.55 & 2029.61 & 1992.44 & 2002.61 \\\\ \nmax & 2063.45 & 2064.43 & 2038.33 & 2062.14 \\\\ \navg & 2035.24 & 2048.56 & 2016.85 & 2031.21 \\\\ \n\\midrule \n16440 & 2054.44 & 2054.44 & 2017.34 & 2020.58 \\\\ \n16441 & 2022.15 & 2030.25 & 1992.44 & 2002.61 \\\\ \n16442 & 2005.55 & 2029.61 & 2005.55 & 2025.90 \\\\ \n16443 & 2030.61 & 2064.08 & 2030.61 & 2062.14 \\\\ \n16444 & 2063.45 & 2064.43 & 2038.33 & 2044.81 \\\\ \n\\midrule\\addlinespace[2.5pt]\n\\multicolumn{5}{l}{W03} \\\\[2.5pt] \n\\midrule\\addlinespace[2.5pt]\n16447 & 2046.13 & 2049.30 & 2022.58 & 2028.26 \\\\ \n16448 & 2031.58 & 2056.93 & 2008.25 & 2023.03 \\\\ \n16449 & 2018.40 & 2018.40 & 1988.44 & 2011.27 \\\\ \n16450 & 2013.75 & 2021.35 & 1991.47 & 1992.67 \\\\ \n16451 & 1992.25 & 2020.46 & 1988.12 & 2019.42 \\\\ \n\\bottomrule\n\\end{longtable}\n\\endgroup\n"

---

    Code
      cat(render_as_html(gt_tbl))
    Output
      <table class="gt_table" data-quarto-disable-processing="false" data-quarto-bootstrap="false">
        <thead>
          <tr class="gt_col_headings">
            <th class="gt_col_heading gt_columns_bottom_border gt_left" rowspan="1" colspan="2" scope="colgroup" id="a::stub"></th>
            <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id="open">open</th>
            <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id="high">high</th>
            <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id="low">low</th>
            <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id="close">close</th>
          </tr>
        </thead>
        <tbody class="gt_table_body">
          <tr><td headers="W02" rowspan="8" class="gt_row gt_left gt_stub_row_group" id="W02">W02</td><th id="summary_stub_W02_1" scope="row" class="gt_row gt_left gt_stub gt_summary_row gt_first_summary_row thick">min</th>
      <td headers="W02 summary_stub_W02_1 open" class="gt_row gt_right gt_summary_row gt_first_summary_row thick">2005.55</td>
      <td headers="W02 summary_stub_W02_1 high" class="gt_row gt_right gt_summary_row gt_first_summary_row thick">2029.61</td>
      <td headers="W02 summary_stub_W02_1 low" class="gt_row gt_right gt_summary_row gt_first_summary_row thick">1992.44</td>
      <td headers="W02 summary_stub_W02_1 close" class="gt_row gt_right gt_summary_row gt_first_summary_row thick">2002.61</td></tr>
          <tr><th id="summary_stub_W02_2" scope="row" class="gt_row gt_left gt_stub gt_summary_row">max</th>
      <td headers="W02 summary_stub_W02_2 open" class="gt_row gt_right gt_summary_row">2063.45</td>
      <td headers="W02 summary_stub_W02_2 high" class="gt_row gt_right gt_summary_row">2064.43</td>
      <td headers="W02 summary_stub_W02_2 low" class="gt_row gt_right gt_summary_row">2038.33</td>
      <td headers="W02 summary_stub_W02_2 close" class="gt_row gt_right gt_summary_row">2062.14</td></tr>
          <tr><th id="summary_stub_W02_3" scope="row" class="gt_row gt_left gt_stub gt_summary_row gt_last_summary_row">avg</th>
      <td headers="W02 summary_stub_W02_3 open" class="gt_row gt_right gt_summary_row gt_last_summary_row">2035.24</td>
      <td headers="W02 summary_stub_W02_3 high" class="gt_row gt_right gt_summary_row gt_last_summary_row">2048.56</td>
      <td headers="W02 summary_stub_W02_3 low" class="gt_row gt_right gt_summary_row gt_last_summary_row">2016.85</td>
      <td headers="W02 summary_stub_W02_3 close" class="gt_row gt_right gt_summary_row gt_last_summary_row">2031.21</td></tr>
          <tr class="gt_row_group_first"><th id="stub_2_1" scope="row" class="gt_row gt_right gt_stub">2015-01-05</th>
      <td headers="W02 stub_2_1 open" class="gt_row gt_right">2054.44</td>
      <td headers="W02 stub_2_1 high" class="gt_row gt_right">2054.44</td>
      <td headers="W02 stub_2_1 low" class="gt_row gt_right">2017.34</td>
      <td headers="W02 stub_2_1 close" class="gt_row gt_right">2020.58</td></tr>
          <tr><th id="stub_2_2" scope="row" class="gt_row gt_right gt_stub">2015-01-06</th>
      <td headers="W02 stub_2_2 open" class="gt_row gt_right">2022.15</td>
      <td headers="W02 stub_2_2 high" class="gt_row gt_right">2030.25</td>
      <td headers="W02 stub_2_2 low" class="gt_row gt_right">1992.44</td>
      <td headers="W02 stub_2_2 close" class="gt_row gt_right">2002.61</td></tr>
          <tr><th id="stub_2_3" scope="row" class="gt_row gt_right gt_stub">2015-01-07</th>
      <td headers="W02 stub_2_3 open" class="gt_row gt_right">2005.55</td>
      <td headers="W02 stub_2_3 high" class="gt_row gt_right">2029.61</td>
      <td headers="W02 stub_2_3 low" class="gt_row gt_right">2005.55</td>
      <td headers="W02 stub_2_3 close" class="gt_row gt_right">2025.90</td></tr>
          <tr><th id="stub_2_4" scope="row" class="gt_row gt_right gt_stub">2015-01-08</th>
      <td headers="W02 stub_2_4 open" class="gt_row gt_right">2030.61</td>
      <td headers="W02 stub_2_4 high" class="gt_row gt_right">2064.08</td>
      <td headers="W02 stub_2_4 low" class="gt_row gt_right">2030.61</td>
      <td headers="W02 stub_2_4 close" class="gt_row gt_right">2062.14</td></tr>
          <tr><th id="stub_2_5" scope="row" class="gt_row gt_right gt_stub">2015-01-09</th>
      <td headers="W02 stub_2_5 open" class="gt_row gt_right">2063.45</td>
      <td headers="W02 stub_2_5 high" class="gt_row gt_right">2064.43</td>
      <td headers="W02 stub_2_5 low" class="gt_row gt_right">2038.33</td>
      <td headers="W02 stub_2_5 close" class="gt_row gt_right">2044.81</td></tr>
          <tr class="gt_row_group_first"><td headers="W03 stub_2_6 stub_1" rowspan="5" class="gt_row gt_left gt_stub_row_group">W03</td>
      <th id="stub_2_6" scope="row" class="gt_row gt_right gt_stub">2015-01-12</th>
      <td headers="W03 stub_2_6 open" class="gt_row gt_right">2046.13</td>
      <td headers="W03 stub_2_6 high" class="gt_row gt_right">2049.30</td>
      <td headers="W03 stub_2_6 low" class="gt_row gt_right">2022.58</td>
      <td headers="W03 stub_2_6 close" class="gt_row gt_right">2028.26</td></tr>
          <tr><th id="stub_2_7" scope="row" class="gt_row gt_right gt_stub">2015-01-13</th>
      <td headers="W03 stub_2_7 open" class="gt_row gt_right">2031.58</td>
      <td headers="W03 stub_2_7 high" class="gt_row gt_right">2056.93</td>
      <td headers="W03 stub_2_7 low" class="gt_row gt_right">2008.25</td>
      <td headers="W03 stub_2_7 close" class="gt_row gt_right">2023.03</td></tr>
          <tr><th id="stub_2_8" scope="row" class="gt_row gt_right gt_stub">2015-01-14</th>
      <td headers="W03 stub_2_8 open" class="gt_row gt_right">2018.40</td>
      <td headers="W03 stub_2_8 high" class="gt_row gt_right">2018.40</td>
      <td headers="W03 stub_2_8 low" class="gt_row gt_right">1988.44</td>
      <td headers="W03 stub_2_8 close" class="gt_row gt_right">2011.27</td></tr>
          <tr><th id="stub_2_9" scope="row" class="gt_row gt_right gt_stub">2015-01-15</th>
      <td headers="W03 stub_2_9 open" class="gt_row gt_right">2013.75</td>
      <td headers="W03 stub_2_9 high" class="gt_row gt_right">2021.35</td>
      <td headers="W03 stub_2_9 low" class="gt_row gt_right">1991.47</td>
      <td headers="W03 stub_2_9 close" class="gt_row gt_right">1992.67</td></tr>
          <tr><th id="stub_2_10" scope="row" class="gt_row gt_right gt_stub">2015-01-16</th>
      <td headers="W03 stub_2_10 open" class="gt_row gt_right">1992.25</td>
      <td headers="W03 stub_2_10 high" class="gt_row gt_right">2020.46</td>
      <td headers="W03 stub_2_10 low" class="gt_row gt_right">1988.12</td>
      <td headers="W03 stub_2_10 close" class="gt_row gt_right">2019.42</td></tr>
        </tbody>
        
      </table>

---

    Code
      as.character(as_latex(gt_tbl))
    Output
      [1] "\\begingroup\n\\fontsize{12.0pt}{14.0pt}\\selectfont\n\\begin{longtable}{l|l|rrrr}\n\\toprule\n\\multicolumn{2}{c}{} & open & high & low & close \\\\ \n\\midrule\\addlinespace[2.5pt]\n\\multirow[t]{8}{*}{W02} & \\multicolumn{1}{l|}{min} & 2005.55 & 2029.61 & 1992.44 & 2002.61 \\\\ \n\\multicolumn{1}{l|}{} & \\multicolumn{1}{l|}{max} & 2063.45 & 2064.43 & 2038.33 & 2062.14 \\\\ \n\\multicolumn{1}{l|}{} & \\multicolumn{1}{l|}{avg} & 2035.24 & 2048.56 & 2016.85 & 2031.21 \\\\ \n\\cmidrule(l{-0.05em}r){2-6}\n & 16440 & 2054.44 & 2054.44 & 2017.34 & 2020.58 \\\\ \n & 16441 & 2022.15 & 2030.25 & 1992.44 & 2002.61 \\\\ \n & 16442 & 2005.55 & 2029.61 & 2005.55 & 2025.90 \\\\ \n & 16443 & 2030.61 & 2064.08 & 2030.61 & 2062.14 \\\\ \n & 16444 & 2063.45 & 2064.43 & 2038.33 & 2044.81 \\\\ \n\\midrule\\addlinespace[2.5pt]\n\\multirow[t]{5}{*}{W03} & 16447 & 2046.13 & 2049.30 & 2022.58 & 2028.26 \\\\ \n & 16448 & 2031.58 & 2056.93 & 2008.25 & 2023.03 \\\\ \n & 16449 & 2018.40 & 2018.40 & 1988.44 & 2011.27 \\\\ \n & 16450 & 2013.75 & 2021.35 & 1991.47 & 1992.67 \\\\ \n & 16451 & 1992.25 & 2020.46 & 1988.12 & 2019.42 \\\\ \n\\bottomrule\n\\end{longtable}\n\\endgroup\n"

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
          <tr><th id="summary_stub_W02_1" scope="row" class="gt_row gt_left gt_stub gt_summary_row gt_first_summary_row thick">min</th>
      <td headers="W02 summary_stub_W02_1 open" class="gt_row gt_right gt_summary_row gt_first_summary_row thick">2005.55</td>
      <td headers="W02 summary_stub_W02_1 high" class="gt_row gt_right gt_summary_row gt_first_summary_row thick">2029.61</td>
      <td headers="W02 summary_stub_W02_1 low" class="gt_row gt_right gt_summary_row gt_first_summary_row thick">1992.44</td>
      <td headers="W02 summary_stub_W02_1 close" class="gt_row gt_right gt_summary_row gt_first_summary_row thick">2002.61</td></tr>
          <tr><th id="summary_stub_W02_2" scope="row" class="gt_row gt_left gt_stub gt_summary_row">max</th>
      <td headers="W02 summary_stub_W02_2 open" class="gt_row gt_right gt_summary_row">2063.45</td>
      <td headers="W02 summary_stub_W02_2 high" class="gt_row gt_right gt_summary_row">2064.43</td>
      <td headers="W02 summary_stub_W02_2 low" class="gt_row gt_right gt_summary_row">2038.33</td>
      <td headers="W02 summary_stub_W02_2 close" class="gt_row gt_right gt_summary_row">2062.14</td></tr>
          <tr><th id="summary_stub_W02_3" scope="row" class="gt_row gt_left gt_stub gt_summary_row gt_last_summary_row">avg</th>
      <td headers="W02 summary_stub_W02_3 open" class="gt_row gt_right gt_summary_row gt_last_summary_row">2035.24</td>
      <td headers="W02 summary_stub_W02_3 high" class="gt_row gt_right gt_summary_row gt_last_summary_row">2048.56</td>
      <td headers="W02 summary_stub_W02_3 low" class="gt_row gt_right gt_summary_row gt_last_summary_row">2016.85</td>
      <td headers="W02 summary_stub_W02_3 close" class="gt_row gt_right gt_summary_row gt_last_summary_row">2031.21</td></tr>
          <tr class="gt_row_group_first"><th id="stub_1_1" scope="row" class="gt_row gt_right gt_stub">2015-01-05</th>
      <td headers="W02 stub_1_1 open" class="gt_row gt_right">2054.44</td>
      <td headers="W02 stub_1_1 high" class="gt_row gt_right">2054.44</td>
      <td headers="W02 stub_1_1 low" class="gt_row gt_right">2017.34</td>
      <td headers="W02 stub_1_1 close" class="gt_row gt_right">2020.58</td></tr>
          <tr><th id="stub_1_2" scope="row" class="gt_row gt_right gt_stub">2015-01-06</th>
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
          <tr><th id="stub_1_10" scope="row" class="gt_row gt_right gt_stub">2015-01-16</th>
      <td headers="W03 stub_1_10 open" class="gt_row gt_right">1992.25</td>
      <td headers="W03 stub_1_10 high" class="gt_row gt_right">2020.46</td>
      <td headers="W03 stub_1_10 low" class="gt_row gt_right">1988.12</td>
      <td headers="W03 stub_1_10 close" class="gt_row gt_right">2019.42</td></tr>
          <tr><th id="summary_stub_W03_1" scope="row" class="gt_row gt_left gt_stub gt_summary_row gt_first_summary_row thick">min</th>
      <td headers="W03 summary_stub_W03_1 open" class="gt_row gt_right gt_summary_row gt_first_summary_row thick">1992.25</td>
      <td headers="W03 summary_stub_W03_1 high" class="gt_row gt_right gt_summary_row gt_first_summary_row thick">2018.40</td>
      <td headers="W03 summary_stub_W03_1 low" class="gt_row gt_right gt_summary_row gt_first_summary_row thick">1988.12</td>
      <td headers="W03 summary_stub_W03_1 close" class="gt_row gt_right gt_summary_row gt_first_summary_row thick">1992.67</td></tr>
          <tr><th id="summary_stub_W03_2" scope="row" class="gt_row gt_left gt_stub gt_summary_row">max</th>
      <td headers="W03 summary_stub_W03_2 open" class="gt_row gt_right gt_summary_row">2046.13</td>
      <td headers="W03 summary_stub_W03_2 high" class="gt_row gt_right gt_summary_row">2056.93</td>
      <td headers="W03 summary_stub_W03_2 low" class="gt_row gt_right gt_summary_row">2022.58</td>
      <td headers="W03 summary_stub_W03_2 close" class="gt_row gt_right gt_summary_row">2028.26</td></tr>
          <tr><th id="summary_stub_W03_3" scope="row" class="gt_row gt_left gt_stub gt_summary_row gt_last_summary_row">avg</th>
      <td headers="W03 summary_stub_W03_3 open" class="gt_row gt_right gt_summary_row gt_last_summary_row">2020.42</td>
      <td headers="W03 summary_stub_W03_3 high" class="gt_row gt_right gt_summary_row gt_last_summary_row">2033.29</td>
      <td headers="W03 summary_stub_W03_3 low" class="gt_row gt_right gt_summary_row gt_last_summary_row">1999.77</td>
      <td headers="W03 summary_stub_W03_3 close" class="gt_row gt_right gt_summary_row gt_last_summary_row">2014.93</td></tr>
        </tbody>
        
      </table>

---

    Code
      as.character(as_latex(gt_tbl))
    Output
      [1] "\\begingroup\n\\fontsize{12.0pt}{14.0pt}\\selectfont\n\\begin{longtable}{l|rrrr}\n\\toprule\n & open & high & low & close \\\\ \n\\midrule\\addlinespace[2.5pt]\n\\multicolumn{5}{l}{W02} \\\\[2.5pt] \n\\midrule\\addlinespace[2.5pt]\nmin & 2005.55 & 2029.61 & 1992.44 & 2002.61 \\\\ \nmax & 2063.45 & 2064.43 & 2038.33 & 2062.14 \\\\ \navg & 2035.24 & 2048.56 & 2016.85 & 2031.21 \\\\ \n\\midrule \n16440 & 2054.44 & 2054.44 & 2017.34 & 2020.58 \\\\ \n16441 & 2022.15 & 2030.25 & 1992.44 & 2002.61 \\\\ \n16442 & 2005.55 & 2029.61 & 2005.55 & 2025.90 \\\\ \n16443 & 2030.61 & 2064.08 & 2030.61 & 2062.14 \\\\ \n16444 & 2063.45 & 2064.43 & 2038.33 & 2044.81 \\\\ \n\\midrule\\addlinespace[2.5pt]\n\\multicolumn{5}{l}{W03} \\\\[2.5pt] \n\\midrule\\addlinespace[2.5pt]\n16447 & 2046.13 & 2049.30 & 2022.58 & 2028.26 \\\\ \n16448 & 2031.58 & 2056.93 & 2008.25 & 2023.03 \\\\ \n16449 & 2018.40 & 2018.40 & 1988.44 & 2011.27 \\\\ \n16450 & 2013.75 & 2021.35 & 1991.47 & 1992.67 \\\\ \n16451 & 1992.25 & 2020.46 & 1988.12 & 2019.42 \\\\ \n\\midrule \nmin & 1992.25 & 2018.40 & 1988.12 & 1992.67 \\\\ \nmax & 2046.13 & 2056.93 & 2022.58 & 2028.26 \\\\ \navg & 2020.42 & 2033.29 & 1999.77 & 2014.93 \\\\ \n\\bottomrule\n\\end{longtable}\n\\endgroup\n"

---

    Code
      cat(render_as_html(gt_tbl))
    Output
      <table class="gt_table" data-quarto-disable-processing="false" data-quarto-bootstrap="false">
        <thead>
          <tr class="gt_col_headings">
            <th class="gt_col_heading gt_columns_bottom_border gt_left" rowspan="1" colspan="2" scope="colgroup" id="a::stub"></th>
            <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id="open">open</th>
            <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id="high">high</th>
            <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id="low">low</th>
            <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id="close">close</th>
          </tr>
        </thead>
        <tbody class="gt_table_body">
          <tr><td headers="W02" rowspan="8" class="gt_row gt_left gt_stub_row_group" id="W02">W02</td><th id="summary_stub_W02_1" scope="row" class="gt_row gt_left gt_stub gt_summary_row gt_first_summary_row thick">min</th>
      <td headers="W02 summary_stub_W02_1 open" class="gt_row gt_right gt_summary_row gt_first_summary_row thick">2005.55</td>
      <td headers="W02 summary_stub_W02_1 high" class="gt_row gt_right gt_summary_row gt_first_summary_row thick">2029.61</td>
      <td headers="W02 summary_stub_W02_1 low" class="gt_row gt_right gt_summary_row gt_first_summary_row thick">1992.44</td>
      <td headers="W02 summary_stub_W02_1 close" class="gt_row gt_right gt_summary_row gt_first_summary_row thick">2002.61</td></tr>
          <tr><th id="summary_stub_W02_2" scope="row" class="gt_row gt_left gt_stub gt_summary_row">max</th>
      <td headers="W02 summary_stub_W02_2 open" class="gt_row gt_right gt_summary_row">2063.45</td>
      <td headers="W02 summary_stub_W02_2 high" class="gt_row gt_right gt_summary_row">2064.43</td>
      <td headers="W02 summary_stub_W02_2 low" class="gt_row gt_right gt_summary_row">2038.33</td>
      <td headers="W02 summary_stub_W02_2 close" class="gt_row gt_right gt_summary_row">2062.14</td></tr>
          <tr><th id="summary_stub_W02_3" scope="row" class="gt_row gt_left gt_stub gt_summary_row gt_last_summary_row">avg</th>
      <td headers="W02 summary_stub_W02_3 open" class="gt_row gt_right gt_summary_row gt_last_summary_row">2035.24</td>
      <td headers="W02 summary_stub_W02_3 high" class="gt_row gt_right gt_summary_row gt_last_summary_row">2048.56</td>
      <td headers="W02 summary_stub_W02_3 low" class="gt_row gt_right gt_summary_row gt_last_summary_row">2016.85</td>
      <td headers="W02 summary_stub_W02_3 close" class="gt_row gt_right gt_summary_row gt_last_summary_row">2031.21</td></tr>
          <tr class="gt_row_group_first"><th id="stub_2_1" scope="row" class="gt_row gt_right gt_stub">2015-01-05</th>
      <td headers="W02 stub_2_1 open" class="gt_row gt_right">2054.44</td>
      <td headers="W02 stub_2_1 high" class="gt_row gt_right">2054.44</td>
      <td headers="W02 stub_2_1 low" class="gt_row gt_right">2017.34</td>
      <td headers="W02 stub_2_1 close" class="gt_row gt_right">2020.58</td></tr>
          <tr><th id="stub_2_2" scope="row" class="gt_row gt_right gt_stub">2015-01-06</th>
      <td headers="W02 stub_2_2 open" class="gt_row gt_right">2022.15</td>
      <td headers="W02 stub_2_2 high" class="gt_row gt_right">2030.25</td>
      <td headers="W02 stub_2_2 low" class="gt_row gt_right">1992.44</td>
      <td headers="W02 stub_2_2 close" class="gt_row gt_right">2002.61</td></tr>
          <tr><th id="stub_2_3" scope="row" class="gt_row gt_right gt_stub">2015-01-07</th>
      <td headers="W02 stub_2_3 open" class="gt_row gt_right">2005.55</td>
      <td headers="W02 stub_2_3 high" class="gt_row gt_right">2029.61</td>
      <td headers="W02 stub_2_3 low" class="gt_row gt_right">2005.55</td>
      <td headers="W02 stub_2_3 close" class="gt_row gt_right">2025.90</td></tr>
          <tr><th id="stub_2_4" scope="row" class="gt_row gt_right gt_stub">2015-01-08</th>
      <td headers="W02 stub_2_4 open" class="gt_row gt_right">2030.61</td>
      <td headers="W02 stub_2_4 high" class="gt_row gt_right">2064.08</td>
      <td headers="W02 stub_2_4 low" class="gt_row gt_right">2030.61</td>
      <td headers="W02 stub_2_4 close" class="gt_row gt_right">2062.14</td></tr>
          <tr><th id="stub_2_5" scope="row" class="gt_row gt_right gt_stub">2015-01-09</th>
      <td headers="W02 stub_2_5 open" class="gt_row gt_right">2063.45</td>
      <td headers="W02 stub_2_5 high" class="gt_row gt_right">2064.43</td>
      <td headers="W02 stub_2_5 low" class="gt_row gt_right">2038.33</td>
      <td headers="W02 stub_2_5 close" class="gt_row gt_right">2044.81</td></tr>
          <tr class="gt_row_group_first"><td headers="W03 stub_2_6 stub_1" rowspan="8" class="gt_row gt_left gt_stub_row_group">W03</td>
      <th id="stub_2_6" scope="row" class="gt_row gt_right gt_stub">2015-01-12</th>
      <td headers="W03 stub_2_6 open" class="gt_row gt_right">2046.13</td>
      <td headers="W03 stub_2_6 high" class="gt_row gt_right">2049.30</td>
      <td headers="W03 stub_2_6 low" class="gt_row gt_right">2022.58</td>
      <td headers="W03 stub_2_6 close" class="gt_row gt_right">2028.26</td></tr>
          <tr><th id="stub_2_7" scope="row" class="gt_row gt_right gt_stub">2015-01-13</th>
      <td headers="W03 stub_2_7 open" class="gt_row gt_right">2031.58</td>
      <td headers="W03 stub_2_7 high" class="gt_row gt_right">2056.93</td>
      <td headers="W03 stub_2_7 low" class="gt_row gt_right">2008.25</td>
      <td headers="W03 stub_2_7 close" class="gt_row gt_right">2023.03</td></tr>
          <tr><th id="stub_2_8" scope="row" class="gt_row gt_right gt_stub">2015-01-14</th>
      <td headers="W03 stub_2_8 open" class="gt_row gt_right">2018.40</td>
      <td headers="W03 stub_2_8 high" class="gt_row gt_right">2018.40</td>
      <td headers="W03 stub_2_8 low" class="gt_row gt_right">1988.44</td>
      <td headers="W03 stub_2_8 close" class="gt_row gt_right">2011.27</td></tr>
          <tr><th id="stub_2_9" scope="row" class="gt_row gt_right gt_stub">2015-01-15</th>
      <td headers="W03 stub_2_9 open" class="gt_row gt_right">2013.75</td>
      <td headers="W03 stub_2_9 high" class="gt_row gt_right">2021.35</td>
      <td headers="W03 stub_2_9 low" class="gt_row gt_right">1991.47</td>
      <td headers="W03 stub_2_9 close" class="gt_row gt_right">1992.67</td></tr>
          <tr><th id="stub_2_10" scope="row" class="gt_row gt_right gt_stub">2015-01-16</th>
      <td headers="W03 stub_2_10 open" class="gt_row gt_right">1992.25</td>
      <td headers="W03 stub_2_10 high" class="gt_row gt_right">2020.46</td>
      <td headers="W03 stub_2_10 low" class="gt_row gt_right">1988.12</td>
      <td headers="W03 stub_2_10 close" class="gt_row gt_right">2019.42</td></tr>
          <tr><th id="summary_stub_W03_1" scope="row" class="gt_row gt_left gt_stub gt_summary_row gt_first_summary_row thick">min</th>
      <td headers="W03 summary_stub_W03_1 open" class="gt_row gt_right gt_summary_row gt_first_summary_row thick">1992.25</td>
      <td headers="W03 summary_stub_W03_1 high" class="gt_row gt_right gt_summary_row gt_first_summary_row thick">2018.40</td>
      <td headers="W03 summary_stub_W03_1 low" class="gt_row gt_right gt_summary_row gt_first_summary_row thick">1988.12</td>
      <td headers="W03 summary_stub_W03_1 close" class="gt_row gt_right gt_summary_row gt_first_summary_row thick">1992.67</td></tr>
          <tr><th id="summary_stub_W03_2" scope="row" class="gt_row gt_left gt_stub gt_summary_row">max</th>
      <td headers="W03 summary_stub_W03_2 open" class="gt_row gt_right gt_summary_row">2046.13</td>
      <td headers="W03 summary_stub_W03_2 high" class="gt_row gt_right gt_summary_row">2056.93</td>
      <td headers="W03 summary_stub_W03_2 low" class="gt_row gt_right gt_summary_row">2022.58</td>
      <td headers="W03 summary_stub_W03_2 close" class="gt_row gt_right gt_summary_row">2028.26</td></tr>
          <tr><th id="summary_stub_W03_3" scope="row" class="gt_row gt_left gt_stub gt_summary_row gt_last_summary_row">avg</th>
      <td headers="W03 summary_stub_W03_3 open" class="gt_row gt_right gt_summary_row gt_last_summary_row">2020.42</td>
      <td headers="W03 summary_stub_W03_3 high" class="gt_row gt_right gt_summary_row gt_last_summary_row">2033.29</td>
      <td headers="W03 summary_stub_W03_3 low" class="gt_row gt_right gt_summary_row gt_last_summary_row">1999.77</td>
      <td headers="W03 summary_stub_W03_3 close" class="gt_row gt_right gt_summary_row gt_last_summary_row">2014.93</td></tr>
        </tbody>
        
      </table>

---

    Code
      as.character(as_latex(gt_tbl))
    Output
      [1] "\\begingroup\n\\fontsize{12.0pt}{14.0pt}\\selectfont\n\\begin{longtable}{l|l|rrrr}\n\\toprule\n\\multicolumn{2}{c}{} & open & high & low & close \\\\ \n\\midrule\\addlinespace[2.5pt]\n\\multirow[t]{8}{*}{W02} & \\multicolumn{1}{l|}{min} & 2005.55 & 2029.61 & 1992.44 & 2002.61 \\\\ \n\\multicolumn{1}{l|}{} & \\multicolumn{1}{l|}{max} & 2063.45 & 2064.43 & 2038.33 & 2062.14 \\\\ \n\\multicolumn{1}{l|}{} & \\multicolumn{1}{l|}{avg} & 2035.24 & 2048.56 & 2016.85 & 2031.21 \\\\ \n\\cmidrule(l{-0.05em}r){2-6}\n & 16440 & 2054.44 & 2054.44 & 2017.34 & 2020.58 \\\\ \n & 16441 & 2022.15 & 2030.25 & 1992.44 & 2002.61 \\\\ \n & 16442 & 2005.55 & 2029.61 & 2005.55 & 2025.90 \\\\ \n & 16443 & 2030.61 & 2064.08 & 2030.61 & 2062.14 \\\\ \n & 16444 & 2063.45 & 2064.43 & 2038.33 & 2044.81 \\\\ \n\\midrule\\addlinespace[2.5pt]\n\\multirow[t]{8}{*}{W03} & 16447 & 2046.13 & 2049.30 & 2022.58 & 2028.26 \\\\ \n & 16448 & 2031.58 & 2056.93 & 2008.25 & 2023.03 \\\\ \n & 16449 & 2018.40 & 2018.40 & 1988.44 & 2011.27 \\\\ \n & 16450 & 2013.75 & 2021.35 & 1991.47 & 1992.67 \\\\ \n & 16451 & 1992.25 & 2020.46 & 1988.12 & 2019.42 \\\\ \n\\cmidrule(l{-0.05em}r){2-6}\n\\multicolumn{1}{l|}{} & \\multicolumn{1}{l|}{min} & 1992.25 & 2018.40 & 1988.12 & 1992.67 \\\\ \n\\multicolumn{1}{l|}{} & \\multicolumn{1}{l|}{max} & 2046.13 & 2056.93 & 2022.58 & 2028.26 \\\\ \n\\multicolumn{1}{l|}{} & \\multicolumn{1}{l|}{avg} & 2020.42 & 2033.29 & 1999.77 & 2014.93 \\\\ \n\\bottomrule\n\\end{longtable}\n\\endgroup\n"

# Grand summary rows can be added to the top of a table

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
          <tr><th id="grand_summary_stub_1" scope="row" class="gt_row gt_left gt_stub gt_grand_summary_row gt_grand_summary_row">min</th>
      <td headers="grand_summary_stub_1 open" class="gt_row gt_right gt_grand_summary_row gt_grand_summary_row">1992.25</td>
      <td headers="grand_summary_stub_1 high" class="gt_row gt_right gt_grand_summary_row gt_grand_summary_row">2018.40</td>
      <td headers="grand_summary_stub_1 low" class="gt_row gt_right gt_grand_summary_row gt_grand_summary_row">1988.12</td>
      <td headers="grand_summary_stub_1 close" class="gt_row gt_right gt_grand_summary_row gt_grand_summary_row">1992.67</td></tr>
          <tr><th id="grand_summary_stub_2" scope="row" class="gt_row gt_left gt_stub gt_grand_summary_row">max</th>
      <td headers="grand_summary_stub_2 open" class="gt_row gt_right gt_grand_summary_row">2063.45</td>
      <td headers="grand_summary_stub_2 high" class="gt_row gt_right gt_grand_summary_row">2064.43</td>
      <td headers="grand_summary_stub_2 low" class="gt_row gt_right gt_grand_summary_row">2038.33</td>
      <td headers="grand_summary_stub_2 close" class="gt_row gt_right gt_grand_summary_row">2062.14</td></tr>
          <tr><th id="grand_summary_stub_3" scope="row" class="gt_row gt_left gt_stub gt_grand_summary_row gt_last_grand_summary_row_top">avg</th>
      <td headers="grand_summary_stub_3 open" class="gt_row gt_right gt_grand_summary_row gt_last_grand_summary_row_top">2027.83</td>
      <td headers="grand_summary_stub_3 high" class="gt_row gt_right gt_grand_summary_row gt_last_grand_summary_row_top">2040.92</td>
      <td headers="grand_summary_stub_3 low" class="gt_row gt_right gt_grand_summary_row gt_last_grand_summary_row_top">2008.31</td>
      <td headers="grand_summary_stub_3 close" class="gt_row gt_right gt_grand_summary_row gt_last_grand_summary_row_top">2023.07</td></tr>
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
          <tr><th id="stub_1_10" scope="row" class="gt_row gt_right gt_stub">2015-01-16</th>
      <td headers="W03 stub_1_10 open" class="gt_row gt_right">1992.25</td>
      <td headers="W03 stub_1_10 high" class="gt_row gt_right">2020.46</td>
      <td headers="W03 stub_1_10 low" class="gt_row gt_right">1988.12</td>
      <td headers="W03 stub_1_10 close" class="gt_row gt_right">2019.42</td></tr>
        </tbody>
        
      </table>

---

    Code
      as.character(as_latex(gt_tbl))
    Output
      [1] "\\begingroup\n\\fontsize{12.0pt}{14.0pt}\\selectfont\n\\begin{longtable}{l|rrrr}\n\\toprule\n & open & high & low & close \\\\ \n\\midrule\\addlinespace[2.5pt]\nmin & 1992.25 & 2018.40 & 1988.12 & 1992.67 \\\\ \nmax & 2063.45 & 2064.43 & 2038.33 & 2062.14 \\\\ \navg & 2027.83 & 2040.92 & 2008.31 & 2023.07 \\\\ \n\\midrule \n\\midrule \n\\multicolumn{5}{l}{W02} \\\\[2.5pt] \n\\midrule\\addlinespace[2.5pt]\n16440 & 2054.44 & 2054.44 & 2017.34 & 2020.58 \\\\ \n16441 & 2022.15 & 2030.25 & 1992.44 & 2002.61 \\\\ \n16442 & 2005.55 & 2029.61 & 2005.55 & 2025.90 \\\\ \n16443 & 2030.61 & 2064.08 & 2030.61 & 2062.14 \\\\ \n16444 & 2063.45 & 2064.43 & 2038.33 & 2044.81 \\\\ \n\\midrule\\addlinespace[2.5pt]\n\\multicolumn{5}{l}{W03} \\\\[2.5pt] \n\\midrule\\addlinespace[2.5pt]\n16447 & 2046.13 & 2049.30 & 2022.58 & 2028.26 \\\\ \n16448 & 2031.58 & 2056.93 & 2008.25 & 2023.03 \\\\ \n16449 & 2018.40 & 2018.40 & 1988.44 & 2011.27 \\\\ \n16450 & 2013.75 & 2021.35 & 1991.47 & 1992.67 \\\\ \n16451 & 1992.25 & 2020.46 & 1988.12 & 2019.42 \\\\ \n\\bottomrule\n\\end{longtable}\n\\endgroup\n"

---

    Code
      cat(render_as_html(gt_tbl))
    Output
      <table class="gt_table" data-quarto-disable-processing="false" data-quarto-bootstrap="false">
        <thead>
          <tr class="gt_col_headings">
            <th class="gt_col_heading gt_columns_bottom_border gt_left" rowspan="1" colspan="2" scope="colgroup" id="a::stub"></th>
            <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id="open">open</th>
            <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id="high">high</th>
            <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id="low">low</th>
            <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id="close">close</th>
          </tr>
        </thead>
        <tbody class="gt_table_body">
          <tr><th id="grand_summary_stub_1" scope="row" colspan="2" class="gt_row gt_left gt_stub gt_grand_summary_row gt_grand_summary_row">min</th>
      <td headers="grand_summary_stub_1 open" class="gt_row gt_right gt_grand_summary_row gt_grand_summary_row">1992.25</td>
      <td headers="grand_summary_stub_1 high" class="gt_row gt_right gt_grand_summary_row gt_grand_summary_row">2018.40</td>
      <td headers="grand_summary_stub_1 low" class="gt_row gt_right gt_grand_summary_row gt_grand_summary_row">1988.12</td>
      <td headers="grand_summary_stub_1 close" class="gt_row gt_right gt_grand_summary_row gt_grand_summary_row">1992.67</td></tr>
          <tr><th id="grand_summary_stub_2" scope="row" colspan="2" class="gt_row gt_left gt_stub gt_grand_summary_row">max</th>
      <td headers="grand_summary_stub_2 open" class="gt_row gt_right gt_grand_summary_row">2063.45</td>
      <td headers="grand_summary_stub_2 high" class="gt_row gt_right gt_grand_summary_row">2064.43</td>
      <td headers="grand_summary_stub_2 low" class="gt_row gt_right gt_grand_summary_row">2038.33</td>
      <td headers="grand_summary_stub_2 close" class="gt_row gt_right gt_grand_summary_row">2062.14</td></tr>
          <tr><th id="grand_summary_stub_3" scope="row" colspan="2" class="gt_row gt_left gt_stub gt_grand_summary_row gt_last_grand_summary_row_top">avg</th>
      <td headers="grand_summary_stub_3 open" class="gt_row gt_right gt_grand_summary_row gt_last_grand_summary_row_top">2027.83</td>
      <td headers="grand_summary_stub_3 high" class="gt_row gt_right gt_grand_summary_row gt_last_grand_summary_row_top">2040.92</td>
      <td headers="grand_summary_stub_3 low" class="gt_row gt_right gt_grand_summary_row gt_last_grand_summary_row_top">2008.31</td>
      <td headers="grand_summary_stub_3 close" class="gt_row gt_right gt_grand_summary_row gt_last_grand_summary_row_top">2023.07</td></tr>
          <tr class="gt_row_group_first"><td headers="W02 stub_2_1 stub_1" rowspan="5" class="gt_row gt_left gt_stub_row_group">W02</td>
      <th id="stub_2_1" scope="row" class="gt_row gt_right gt_stub">2015-01-05</th>
      <td headers="W02 stub_2_1 open" class="gt_row gt_right">2054.44</td>
      <td headers="W02 stub_2_1 high" class="gt_row gt_right">2054.44</td>
      <td headers="W02 stub_2_1 low" class="gt_row gt_right">2017.34</td>
      <td headers="W02 stub_2_1 close" class="gt_row gt_right">2020.58</td></tr>
          <tr><th id="stub_2_2" scope="row" class="gt_row gt_right gt_stub">2015-01-06</th>
      <td headers="W02 stub_2_2 open" class="gt_row gt_right">2022.15</td>
      <td headers="W02 stub_2_2 high" class="gt_row gt_right">2030.25</td>
      <td headers="W02 stub_2_2 low" class="gt_row gt_right">1992.44</td>
      <td headers="W02 stub_2_2 close" class="gt_row gt_right">2002.61</td></tr>
          <tr><th id="stub_2_3" scope="row" class="gt_row gt_right gt_stub">2015-01-07</th>
      <td headers="W02 stub_2_3 open" class="gt_row gt_right">2005.55</td>
      <td headers="W02 stub_2_3 high" class="gt_row gt_right">2029.61</td>
      <td headers="W02 stub_2_3 low" class="gt_row gt_right">2005.55</td>
      <td headers="W02 stub_2_3 close" class="gt_row gt_right">2025.90</td></tr>
          <tr><th id="stub_2_4" scope="row" class="gt_row gt_right gt_stub">2015-01-08</th>
      <td headers="W02 stub_2_4 open" class="gt_row gt_right">2030.61</td>
      <td headers="W02 stub_2_4 high" class="gt_row gt_right">2064.08</td>
      <td headers="W02 stub_2_4 low" class="gt_row gt_right">2030.61</td>
      <td headers="W02 stub_2_4 close" class="gt_row gt_right">2062.14</td></tr>
          <tr><th id="stub_2_5" scope="row" class="gt_row gt_right gt_stub">2015-01-09</th>
      <td headers="W02 stub_2_5 open" class="gt_row gt_right">2063.45</td>
      <td headers="W02 stub_2_5 high" class="gt_row gt_right">2064.43</td>
      <td headers="W02 stub_2_5 low" class="gt_row gt_right">2038.33</td>
      <td headers="W02 stub_2_5 close" class="gt_row gt_right">2044.81</td></tr>
          <tr class="gt_row_group_first"><td headers="W03 stub_2_6 stub_1" rowspan="5" class="gt_row gt_left gt_stub_row_group">W03</td>
      <th id="stub_2_6" scope="row" class="gt_row gt_right gt_stub">2015-01-12</th>
      <td headers="W03 stub_2_6 open" class="gt_row gt_right">2046.13</td>
      <td headers="W03 stub_2_6 high" class="gt_row gt_right">2049.30</td>
      <td headers="W03 stub_2_6 low" class="gt_row gt_right">2022.58</td>
      <td headers="W03 stub_2_6 close" class="gt_row gt_right">2028.26</td></tr>
          <tr><th id="stub_2_7" scope="row" class="gt_row gt_right gt_stub">2015-01-13</th>
      <td headers="W03 stub_2_7 open" class="gt_row gt_right">2031.58</td>
      <td headers="W03 stub_2_7 high" class="gt_row gt_right">2056.93</td>
      <td headers="W03 stub_2_7 low" class="gt_row gt_right">2008.25</td>
      <td headers="W03 stub_2_7 close" class="gt_row gt_right">2023.03</td></tr>
          <tr><th id="stub_2_8" scope="row" class="gt_row gt_right gt_stub">2015-01-14</th>
      <td headers="W03 stub_2_8 open" class="gt_row gt_right">2018.40</td>
      <td headers="W03 stub_2_8 high" class="gt_row gt_right">2018.40</td>
      <td headers="W03 stub_2_8 low" class="gt_row gt_right">1988.44</td>
      <td headers="W03 stub_2_8 close" class="gt_row gt_right">2011.27</td></tr>
          <tr><th id="stub_2_9" scope="row" class="gt_row gt_right gt_stub">2015-01-15</th>
      <td headers="W03 stub_2_9 open" class="gt_row gt_right">2013.75</td>
      <td headers="W03 stub_2_9 high" class="gt_row gt_right">2021.35</td>
      <td headers="W03 stub_2_9 low" class="gt_row gt_right">1991.47</td>
      <td headers="W03 stub_2_9 close" class="gt_row gt_right">1992.67</td></tr>
          <tr><th id="stub_2_10" scope="row" class="gt_row gt_right gt_stub">2015-01-16</th>
      <td headers="W03 stub_2_10 open" class="gt_row gt_right">1992.25</td>
      <td headers="W03 stub_2_10 high" class="gt_row gt_right">2020.46</td>
      <td headers="W03 stub_2_10 low" class="gt_row gt_right">1988.12</td>
      <td headers="W03 stub_2_10 close" class="gt_row gt_right">2019.42</td></tr>
        </tbody>
        
      </table>

---

    Code
      as.character(as_latex(gt_tbl))
    Output
      [1] "\\begingroup\n\\fontsize{12.0pt}{14.0pt}\\selectfont\n\\begin{longtable}{l|l|rrrr}\n\\toprule\n\\multicolumn{2}{c}{} & open & high & low & close \\\\ \n\\midrule\\addlinespace[2.5pt]\n\\multicolumn{1}{l|}{} & \\multicolumn{1}{l|}{min} & 1992.25 & 2018.40 & 1988.12 & 1992.67 \\\\ \n\\multicolumn{1}{l|}{} & \\multicolumn{1}{l|}{max} & 2063.45 & 2064.43 & 2038.33 & 2062.14 \\\\ \n\\multicolumn{1}{l|}{} & \\multicolumn{1}{l|}{avg} & 2027.83 & 2040.92 & 2008.31 & 2023.07 \\\\ \n\\midrule \n\\midrule \n\\multirow[t]{5}{*}{W02} & 16440 & 2054.44 & 2054.44 & 2017.34 & 2020.58 \\\\ \n & 16441 & 2022.15 & 2030.25 & 1992.44 & 2002.61 \\\\ \n & 16442 & 2005.55 & 2029.61 & 2005.55 & 2025.90 \\\\ \n & 16443 & 2030.61 & 2064.08 & 2030.61 & 2062.14 \\\\ \n & 16444 & 2063.45 & 2064.43 & 2038.33 & 2044.81 \\\\ \n\\midrule\\addlinespace[2.5pt]\n\\multirow[t]{5}{*}{W03} & 16447 & 2046.13 & 2049.30 & 2022.58 & 2028.26 \\\\ \n & 16448 & 2031.58 & 2056.93 & 2008.25 & 2023.03 \\\\ \n & 16449 & 2018.40 & 2018.40 & 1988.44 & 2011.27 \\\\ \n & 16450 & 2013.75 & 2021.35 & 1991.47 & 1992.67 \\\\ \n & 16451 & 1992.25 & 2020.46 & 1988.12 & 2019.42 \\\\ \n\\bottomrule\n\\end{longtable}\n\\endgroup\n"

# Labels can be intrepreted from Markdown using `md()`

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
          <tr><th id="summary_stub_W02_1" scope="row" class="gt_row gt_left gt_stub gt_summary_row gt_first_summary_row thick"><span class='gt_from_md'><strong>Average</strong></span></th>
      <td headers="W02 summary_stub_W02_1 open" class="gt_row gt_right gt_summary_row gt_first_summary_row thick">2035.23998</td>
      <td headers="W02 summary_stub_W02_1 high" class="gt_row gt_right gt_summary_row gt_first_summary_row thick">2048.56198</td>
      <td headers="W02 summary_stub_W02_1 low" class="gt_row gt_right gt_summary_row gt_first_summary_row thick">2016.8540</td>
      <td headers="W02 summary_stub_W02_1 close" class="gt_row gt_right gt_summary_row gt_first_summary_row thick">2031.2080</td></tr>
          <tr><th id="summary_stub_W02_2" scope="row" class="gt_row gt_left gt_stub gt_summary_row">Sum</th>
      <td headers="W02 summary_stub_W02_2 open" class="gt_row gt_right gt_summary_row">10176.19990</td>
      <td headers="W02 summary_stub_W02_2 high" class="gt_row gt_right gt_summary_row">10242.80990</td>
      <td headers="W02 summary_stub_W02_2 low" class="gt_row gt_right gt_summary_row">10084.2699</td>
      <td headers="W02 summary_stub_W02_2 close" class="gt_row gt_right gt_summary_row">10156.0400</td></tr>
          <tr><th id="summary_stub_W02_3" scope="row" class="gt_row gt_left gt_stub gt_summary_row gt_last_summary_row"><span class='gt_from_md'><em>S.D.</em></span></th>
      <td headers="W02 summary_stub_W02_3 open" class="gt_row gt_right gt_summary_row gt_last_summary_row">23.65756</td>
      <td headers="W02 summary_stub_W02_3 high" class="gt_row gt_right gt_summary_row gt_last_summary_row">17.47612</td>
      <td headers="W02 summary_stub_W02_3 low" class="gt_row gt_right gt_summary_row gt_last_summary_row">18.5372</td>
      <td headers="W02 summary_stub_W02_3 close" class="gt_row gt_right gt_summary_row gt_last_summary_row">22.9171</td></tr>
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
      <td headers="W03 stub_1_10 low" class="gt_row gt_right">1988.12</td>
      <td headers="W03 stub_1_10 close" class="gt_row gt_right">2019.42</td></tr>
        </tbody>
        
      </table>

---

    Code
      as.character(as_latex(gt_tbl))
    Output
      [1] "\\begingroup\n\\fontsize{12.0pt}{14.0pt}\\selectfont\n\\begin{longtable}{l|rrrr}\n\\toprule\n & open & high & low & close \\\\ \n\\midrule\\addlinespace[2.5pt]\n\\multicolumn{5}{l}{W02} \\\\[2.5pt] \n\\midrule\\addlinespace[2.5pt]\n16440 & 2054.44 & 2054.44 & 2017.34 & 2020.58 \\\\ \n16441 & 2022.15 & 2030.25 & 1992.44 & 2002.61 \\\\ \n16442 & 2005.55 & 2029.61 & 2005.55 & 2025.90 \\\\ \n16443 & 2030.61 & 2064.08 & 2030.61 & 2062.14 \\\\ \n16444 & 2063.45 & 2064.43 & 2038.33 & 2044.81 \\\\ \n\\midrule \n\\textbf{Average} & 2035.23998 & 2048.56198 & 2016.8540 & 2031.2080 \\\\ \nSum & 10176.19990 & 10242.80990 & 10084.2699 & 10156.0400 \\\\ \n\\emph{S.D.} & 23.65756 & 17.47612 & 18.5372 & 22.9171 \\\\ \n\\midrule\\addlinespace[2.5pt]\n\\multicolumn{5}{l}{W03} \\\\[2.5pt] \n\\midrule\\addlinespace[2.5pt]\n16447 & 2046.13 & 2049.30 & 2022.58 & 2028.26 \\\\ \n16448 & 2031.58 & 2056.93 & 2008.25 & 2023.03 \\\\ \n16449 & 2018.40 & 2018.40 & 1988.44 & 2011.27 \\\\ \n16450 & 2013.75 & 2021.35 & 1991.47 & 1992.67 \\\\ \n16451 & 1992.25 & 2020.46 & 1988.12 & 2019.42 \\\\ \n\\bottomrule\n\\end{longtable}\n\\endgroup\n"

---

    Code
      as_rtf(gt_tbl)
    Output
      {\rtf\ansi\ansicpg1252{\fonttbl{\f0\froman\fcharset0\fprq0 Courier New;}{\f1\froman\fcharset0\fprq0 Times;}}{\colortbl;\red211\green211\blue211;}
      
      \paperw12240\paperh15840\widowctrl\ftnbj\fet0\sectd\linex0
      \lndscpsxn
      \margl1440\margr1440\margt1440\margb1440
      \headery720\footery720\fs20
      
      \trowd\trrh0\trhdr
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85\clbrdrb\brdrs\brdrw20\brdrcf1 \cellx1872
      \intbl {\f0 {\f0\fs20 }}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85\clbrdrb\brdrs\brdrw20\brdrcf1 \cellx3744
      \intbl {\f0 {\f0\fs20 open}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85\clbrdrb\brdrs\brdrw20\brdrcf1 \cellx5616
      \intbl {\f0 {\f0\fs20 high}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85\clbrdrb\brdrs\brdrw20\brdrcf1 \cellx7488
      \intbl {\f0 {\f0\fs20 low}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85\clbrdrb\brdrs\brdrw20\brdrcf1 \cellx9360
      \intbl {\f0 {\f0\fs20 close}}\cell
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\ql\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx9360
      \intbl {\f0\fs20 W02}\cell
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx1872
      \intbl {\f0 {\f0\fs20 16440}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx3744
      \intbl {\f0 {\f0\fs20 2054.44}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx5616
      \intbl {\f0 {\f0\fs20 2054.44}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx7488
      \intbl {\f0 {\f0\fs20 2017.34}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx9360
      \intbl {\f0 {\f0\fs20 2020.58}}\cell
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx1872
      \intbl {\f0 {\f0\fs20 16441}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx3744
      \intbl {\f0 {\f0\fs20 2022.15}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx5616
      \intbl {\f0 {\f0\fs20 2030.25}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx7488
      \intbl {\f0 {\f0\fs20 1992.44}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx9360
      \intbl {\f0 {\f0\fs20 2002.61}}\cell
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx1872
      \intbl {\f0 {\f0\fs20 16442}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx3744
      \intbl {\f0 {\f0\fs20 2005.55}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx5616
      \intbl {\f0 {\f0\fs20 2029.61}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx7488
      \intbl {\f0 {\f0\fs20 2005.55}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx9360
      \intbl {\f0 {\f0\fs20 2025.90}}\cell
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx1872
      \intbl {\f0 {\f0\fs20 16443}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx3744
      \intbl {\f0 {\f0\fs20 2030.61}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx5616
      \intbl {\f0 {\f0\fs20 2064.08}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx7488
      \intbl {\f0 {\f0\fs20 2030.61}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx9360
      \intbl {\f0 {\f0\fs20 2062.14}}\cell
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx1872
      \intbl {\f0 {\f0\fs20 16444}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx3744
      \intbl {\f0 {\f0\fs20 2063.45}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx5616
      \intbl {\f0 {\f0\fs20 2064.43}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx7488
      \intbl {\f0 {\f0\fs20 2038.33}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx9360
      \intbl {\f0 {\f0\fs20 2044.81}}\cell
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx1872
      \intbl {\f0 {\f0\fs20 {\b Average}}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx3744
      \intbl {\f0 {\f0\fs20 2035.23998}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx5616
      \intbl {\f0 {\f0\fs20 2048.56198}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx7488
      \intbl {\f0 {\f0\fs20 2016.8540}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx9360
      \intbl {\f0 {\f0\fs20 2031.2080}}\cell
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx1872
      \intbl {\f0 {\f0\fs20 Sum}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx3744
      \intbl {\f0 {\f0\fs20 10176.19990}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx5616
      \intbl {\f0 {\f0\fs20 10242.80990}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx7488
      \intbl {\f0 {\f0\fs20 10084.2699}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx9360
      \intbl {\f0 {\f0\fs20 10156.0400}}\cell
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx1872
      \intbl {\f0 {\f0\fs20 {\i S.D.}}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx3744
      \intbl {\f0 {\f0\fs20 23.65756}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx5616
      \intbl {\f0 {\f0\fs20 17.47612}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx7488
      \intbl {\f0 {\f0\fs20 18.5372}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx9360
      \intbl {\f0 {\f0\fs20 22.9171}}\cell
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\ql\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx9360
      \intbl {\f0\fs20 W03}\cell
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx1872
      \intbl {\f0 {\f0\fs20 16447}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx3744
      \intbl {\f0 {\f0\fs20 2046.13}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx5616
      \intbl {\f0 {\f0\fs20 2049.30}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx7488
      \intbl {\f0 {\f0\fs20 2022.58}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx9360
      \intbl {\f0 {\f0\fs20 2028.26}}\cell
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx1872
      \intbl {\f0 {\f0\fs20 16448}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx3744
      \intbl {\f0 {\f0\fs20 2031.58}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx5616
      \intbl {\f0 {\f0\fs20 2056.93}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx7488
      \intbl {\f0 {\f0\fs20 2008.25}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx9360
      \intbl {\f0 {\f0\fs20 2023.03}}\cell
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx1872
      \intbl {\f0 {\f0\fs20 16449}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx3744
      \intbl {\f0 {\f0\fs20 2018.40}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx5616
      \intbl {\f0 {\f0\fs20 2018.40}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx7488
      \intbl {\f0 {\f0\fs20 1988.44}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx9360
      \intbl {\f0 {\f0\fs20 2011.27}}\cell
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx1872
      \intbl {\f0 {\f0\fs20 16450}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx3744
      \intbl {\f0 {\f0\fs20 2013.75}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx5616
      \intbl {\f0 {\f0\fs20 2021.35}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx7488
      \intbl {\f0 {\f0\fs20 1991.47}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx9360
      \intbl {\f0 {\f0\fs20 1992.67}}\cell
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx1872
      \intbl {\f0 {\f0\fs20 16451}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx3744
      \intbl {\f0 {\f0\fs20 1992.25}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx5616
      \intbl {\f0 {\f0\fs20 2020.46}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx7488
      \intbl {\f0 {\f0\fs20 1988.12}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx9360
      \intbl {\f0 {\f0\fs20 2019.42}}\cell
      
      \row
      
      }

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
          <tr><th id="stub_1_10" scope="row" class="gt_row gt_right gt_stub">2015-01-16</th>
      <td headers="W03 stub_1_10 open" class="gt_row gt_right">1992.25</td>
      <td headers="W03 stub_1_10 high" class="gt_row gt_right">2020.46</td>
      <td headers="W03 stub_1_10 low" class="gt_row gt_right">1988.12</td>
      <td headers="W03 stub_1_10 close" class="gt_row gt_right">2019.42</td></tr>
          <tr><th id="grand_summary_stub_1" scope="row" class="gt_row gt_left gt_stub gt_grand_summary_row gt_first_grand_summary_row"><span class='gt_from_md'><strong>Average</strong></span></th>
      <td headers="grand_summary_stub_1 open" class="gt_row gt_right gt_grand_summary_row gt_first_grand_summary_row">2027.83099</td>
      <td headers="grand_summary_stub_1 high" class="gt_row gt_right gt_grand_summary_row gt_first_grand_summary_row">2040.92498</td>
      <td headers="grand_summary_stub_1 low" class="gt_row gt_right gt_grand_summary_row gt_first_grand_summary_row">2008.31298</td>
      <td headers="grand_summary_stub_1 close" class="gt_row gt_right gt_grand_summary_row gt_first_grand_summary_row">2023.06900</td></tr>
          <tr><th id="grand_summary_stub_2" scope="row" class="gt_row gt_left gt_stub gt_grand_summary_row">Sum</th>
      <td headers="grand_summary_stub_2 open" class="gt_row gt_right gt_grand_summary_row">20278.30990</td>
      <td headers="grand_summary_stub_2 high" class="gt_row gt_right gt_grand_summary_row">20409.24980</td>
      <td headers="grand_summary_stub_2 low" class="gt_row gt_right gt_grand_summary_row">20083.12980</td>
      <td headers="grand_summary_stub_2 close" class="gt_row gt_right gt_grand_summary_row">20230.69000</td></tr>
          <tr><th id="grand_summary_stub_3" scope="row" class="gt_row gt_left gt_stub gt_grand_summary_row gt_last_summary_row"><span class='gt_from_md'><em>S.D.</em></span></th>
      <td headers="grand_summary_stub_3 open" class="gt_row gt_right gt_grand_summary_row gt_last_summary_row">22.14929</td>
      <td headers="grand_summary_stub_3 high" class="gt_row gt_right gt_grand_summary_row gt_last_summary_row">18.70516</td>
      <td headers="grand_summary_stub_3 low" class="gt_row gt_right gt_grand_summary_row gt_last_summary_row">18.34602</td>
      <td headers="grand_summary_stub_3 close" class="gt_row gt_right gt_grand_summary_row gt_last_summary_row">19.82022</td></tr>
        </tbody>
        
      </table>

---

    Code
      as.character(as_latex(gt_tbl))
    Output
      [1] "\\begingroup\n\\fontsize{12.0pt}{14.0pt}\\selectfont\n\\begin{longtable}{l|rrrr}\n\\toprule\n & open & high & low & close \\\\ \n\\midrule\\addlinespace[2.5pt]\n\\multicolumn{5}{l}{W02} \\\\[2.5pt] \n\\midrule\\addlinespace[2.5pt]\n16440 & 2054.44 & 2054.44 & 2017.34 & 2020.58 \\\\ \n16441 & 2022.15 & 2030.25 & 1992.44 & 2002.61 \\\\ \n16442 & 2005.55 & 2029.61 & 2005.55 & 2025.90 \\\\ \n16443 & 2030.61 & 2064.08 & 2030.61 & 2062.14 \\\\ \n16444 & 2063.45 & 2064.43 & 2038.33 & 2044.81 \\\\ \n\\midrule\\addlinespace[2.5pt]\n\\multicolumn{5}{l}{W03} \\\\[2.5pt] \n\\midrule\\addlinespace[2.5pt]\n16447 & 2046.13 & 2049.30 & 2022.58 & 2028.26 \\\\ \n16448 & 2031.58 & 2056.93 & 2008.25 & 2023.03 \\\\ \n16449 & 2018.40 & 2018.40 & 1988.44 & 2011.27 \\\\ \n16450 & 2013.75 & 2021.35 & 1991.47 & 1992.67 \\\\ \n16451 & 1992.25 & 2020.46 & 1988.12 & 2019.42 \\\\ \n\\midrule \n\\midrule \n\\textbf{Average} & 2027.83099 & 2040.92498 & 2008.31298 & 2023.06900 \\\\ \nSum & 20278.30990 & 20409.24980 & 20083.12980 & 20230.69000 \\\\ \n\\emph{S.D.} & 22.14929 & 18.70516 & 18.34602 & 19.82022 \\\\ \n\\bottomrule\n\\end{longtable}\n\\endgroup\n"

---

    Code
      as_rtf(gt_tbl)
    Output
      {\rtf\ansi\ansicpg1252{\fonttbl{\f0\froman\fcharset0\fprq0 Courier New;}{\f1\froman\fcharset0\fprq0 Times;}}{\colortbl;\red211\green211\blue211;}
      
      \paperw12240\paperh15840\widowctrl\ftnbj\fet0\sectd\linex0
      \lndscpsxn
      \margl1440\margr1440\margt1440\margb1440
      \headery720\footery720\fs20
      
      \trowd\trrh0\trhdr
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85\clbrdrb\brdrs\brdrw20\brdrcf1 \cellx1872
      \intbl {\f0 {\f0\fs20 }}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85\clbrdrb\brdrs\brdrw20\brdrcf1 \cellx3744
      \intbl {\f0 {\f0\fs20 open}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85\clbrdrb\brdrs\brdrw20\brdrcf1 \cellx5616
      \intbl {\f0 {\f0\fs20 high}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85\clbrdrb\brdrs\brdrw20\brdrcf1 \cellx7488
      \intbl {\f0 {\f0\fs20 low}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85\clbrdrb\brdrs\brdrw20\brdrcf1 \cellx9360
      \intbl {\f0 {\f0\fs20 close}}\cell
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\ql\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx9360
      \intbl {\f0\fs20 W02}\cell
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx1872
      \intbl {\f0 {\f0\fs20 16440}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx3744
      \intbl {\f0 {\f0\fs20 2054.44}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx5616
      \intbl {\f0 {\f0\fs20 2054.44}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx7488
      \intbl {\f0 {\f0\fs20 2017.34}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx9360
      \intbl {\f0 {\f0\fs20 2020.58}}\cell
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx1872
      \intbl {\f0 {\f0\fs20 16441}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx3744
      \intbl {\f0 {\f0\fs20 2022.15}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx5616
      \intbl {\f0 {\f0\fs20 2030.25}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx7488
      \intbl {\f0 {\f0\fs20 1992.44}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx9360
      \intbl {\f0 {\f0\fs20 2002.61}}\cell
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx1872
      \intbl {\f0 {\f0\fs20 16442}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx3744
      \intbl {\f0 {\f0\fs20 2005.55}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx5616
      \intbl {\f0 {\f0\fs20 2029.61}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx7488
      \intbl {\f0 {\f0\fs20 2005.55}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx9360
      \intbl {\f0 {\f0\fs20 2025.90}}\cell
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx1872
      \intbl {\f0 {\f0\fs20 16443}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx3744
      \intbl {\f0 {\f0\fs20 2030.61}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx5616
      \intbl {\f0 {\f0\fs20 2064.08}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx7488
      \intbl {\f0 {\f0\fs20 2030.61}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx9360
      \intbl {\f0 {\f0\fs20 2062.14}}\cell
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx1872
      \intbl {\f0 {\f0\fs20 16444}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx3744
      \intbl {\f0 {\f0\fs20 2063.45}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx5616
      \intbl {\f0 {\f0\fs20 2064.43}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx7488
      \intbl {\f0 {\f0\fs20 2038.33}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx9360
      \intbl {\f0 {\f0\fs20 2044.81}}\cell
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\ql\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx9360
      \intbl {\f0\fs20 W03}\cell
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx1872
      \intbl {\f0 {\f0\fs20 16447}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx3744
      \intbl {\f0 {\f0\fs20 2046.13}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx5616
      \intbl {\f0 {\f0\fs20 2049.30}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx7488
      \intbl {\f0 {\f0\fs20 2022.58}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx9360
      \intbl {\f0 {\f0\fs20 2028.26}}\cell
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx1872
      \intbl {\f0 {\f0\fs20 16448}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx3744
      \intbl {\f0 {\f0\fs20 2031.58}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx5616
      \intbl {\f0 {\f0\fs20 2056.93}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx7488
      \intbl {\f0 {\f0\fs20 2008.25}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx9360
      \intbl {\f0 {\f0\fs20 2023.03}}\cell
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx1872
      \intbl {\f0 {\f0\fs20 16449}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx3744
      \intbl {\f0 {\f0\fs20 2018.40}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx5616
      \intbl {\f0 {\f0\fs20 2018.40}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx7488
      \intbl {\f0 {\f0\fs20 1988.44}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx9360
      \intbl {\f0 {\f0\fs20 2011.27}}\cell
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx1872
      \intbl {\f0 {\f0\fs20 16450}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx3744
      \intbl {\f0 {\f0\fs20 2013.75}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx5616
      \intbl {\f0 {\f0\fs20 2021.35}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx7488
      \intbl {\f0 {\f0\fs20 1991.47}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx9360
      \intbl {\f0 {\f0\fs20 1992.67}}\cell
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx1872
      \intbl {\f0 {\f0\fs20 16451}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx3744
      \intbl {\f0 {\f0\fs20 1992.25}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx5616
      \intbl {\f0 {\f0\fs20 2020.46}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx7488
      \intbl {\f0 {\f0\fs20 1988.12}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx9360
      \intbl {\f0 {\f0\fs20 2019.42}}\cell
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx1872
      \intbl {\f0 {\f0\fs20 {\b Average}}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx3744
      \intbl {\f0 {\f0\fs20 2027.83099}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx5616
      \intbl {\f0 {\f0\fs20 2040.92498}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx7488
      \intbl {\f0 {\f0\fs20 2008.31298}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx9360
      \intbl {\f0 {\f0\fs20 2023.06900}}\cell
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx1872
      \intbl {\f0 {\f0\fs20 Sum}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx3744
      \intbl {\f0 {\f0\fs20 20278.30990}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx5616
      \intbl {\f0 {\f0\fs20 20409.24980}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx7488
      \intbl {\f0 {\f0\fs20 20083.12980}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx9360
      \intbl {\f0 {\f0\fs20 20230.69000}}\cell
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx1872
      \intbl {\f0 {\f0\fs20 {\i S.D.}}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx3744
      \intbl {\f0 {\f0\fs20 22.14929}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx5616
      \intbl {\f0 {\f0\fs20 18.70516}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx7488
      \intbl {\f0 {\f0\fs20 18.34602}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx9360
      \intbl {\f0 {\f0\fs20 19.82022}}\cell
      
      \row
      
      }

# Groups can be formatted selectively with a formatting group directive

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
          <tr><th id="summary_stub_W02_1" scope="row" class="gt_row gt_left gt_stub gt_summary_row gt_first_summary_row thick">average</th>
      <td headers="W02 summary_stub_W02_1 open" class="gt_row gt_right gt_summary_row gt_first_summary_row thick">2,035.240</td>
      <td headers="W02 summary_stub_W02_1 high" class="gt_row gt_right gt_summary_row gt_first_summary_row thick">2,048.562</td>
      <td headers="W02 summary_stub_W02_1 low" class="gt_row gt_right gt_summary_row gt_first_summary_row thick">2,016.854</td>
      <td headers="W02 summary_stub_W02_1 close" class="gt_row gt_right gt_summary_row gt_first_summary_row thick">2,031.208</td></tr>
          <tr><th id="summary_stub_W02_2" scope="row" class="gt_row gt_left gt_stub gt_summary_row">total</th>
      <td headers="W02 summary_stub_W02_2 open" class="gt_row gt_right gt_summary_row">10,176.200</td>
      <td headers="W02 summary_stub_W02_2 high" class="gt_row gt_right gt_summary_row">10,242.810</td>
      <td headers="W02 summary_stub_W02_2 low" class="gt_row gt_right gt_summary_row">10,084.270</td>
      <td headers="W02 summary_stub_W02_2 close" class="gt_row gt_right gt_summary_row">10,156.040</td></tr>
          <tr><th id="summary_stub_W02_3" scope="row" class="gt_row gt_left gt_stub gt_summary_row gt_last_summary_row">std dev</th>
      <td headers="W02 summary_stub_W02_3 open" class="gt_row gt_right gt_summary_row gt_last_summary_row">23.658</td>
      <td headers="W02 summary_stub_W02_3 high" class="gt_row gt_right gt_summary_row gt_last_summary_row">17.476</td>
      <td headers="W02 summary_stub_W02_3 low" class="gt_row gt_right gt_summary_row gt_last_summary_row">18.537</td>
      <td headers="W02 summary_stub_W02_3 close" class="gt_row gt_right gt_summary_row gt_last_summary_row">22.917</td></tr>
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
      <td headers="W03 stub_1_10 low" class="gt_row gt_right">1988.12</td>
      <td headers="W03 stub_1_10 close" class="gt_row gt_right">2019.42</td></tr>
          <tr><th id="summary_stub_W03_1" scope="row" class="gt_row gt_left gt_stub gt_summary_row gt_first_summary_row thick">average</th>
      <td headers="W03 summary_stub_W03_1 open" class="gt_row gt_right gt_summary_row gt_first_summary_row thick">2020.42200</td>
      <td headers="W03 summary_stub_W03_1 high" class="gt_row gt_right gt_summary_row gt_first_summary_row thick">2033.28798</td>
      <td headers="W03 summary_stub_W03_1 low" class="gt_row gt_right gt_summary_row gt_first_summary_row thick">1999.77198</td>
      <td headers="W03 summary_stub_W03_1 close" class="gt_row gt_right gt_summary_row gt_first_summary_row thick">2014.9300</td></tr>
          <tr><th id="summary_stub_W03_2" scope="row" class="gt_row gt_left gt_stub gt_summary_row">total</th>
      <td headers="W03 summary_stub_W03_2 open" class="gt_row gt_right gt_summary_row">10102.11000</td>
      <td headers="W03 summary_stub_W03_2 high" class="gt_row gt_right gt_summary_row">10166.43990</td>
      <td headers="W03 summary_stub_W03_2 low" class="gt_row gt_right gt_summary_row">9998.85990</td>
      <td headers="W03 summary_stub_W03_2 close" class="gt_row gt_right gt_summary_row">10074.6500</td></tr>
          <tr><th id="summary_stub_W03_3" scope="row" class="gt_row gt_left gt_stub gt_summary_row gt_last_summary_row">std dev</th>
      <td headers="W03 summary_stub_W03_3 open" class="gt_row gt_right gt_summary_row gt_last_summary_row">20.17218</td>
      <td headers="W03 summary_stub_W03_3 high" class="gt_row gt_right gt_summary_row gt_last_summary_row">18.33064</td>
      <td headers="W03 summary_stub_W03_3 low" class="gt_row gt_right gt_summary_row gt_last_summary_row">15.20847</td>
      <td headers="W03 summary_stub_W03_3 close" class="gt_row gt_right gt_summary_row gt_last_summary_row">13.8957</td></tr>
        </tbody>
        
      </table>

---

    Code
      as.character(as_latex(gt_tbl))
    Output
      [1] "\\begingroup\n\\fontsize{12.0pt}{14.0pt}\\selectfont\n\\begin{longtable}{l|rrrr}\n\\toprule\n & open & high & low & close \\\\ \n\\midrule\\addlinespace[2.5pt]\n\\multicolumn{5}{l}{W02} \\\\[2.5pt] \n\\midrule\\addlinespace[2.5pt]\n16440 & 2054.44 & 2054.44 & 2017.34 & 2020.58 \\\\ \n16441 & 2022.15 & 2030.25 & 1992.44 & 2002.61 \\\\ \n16442 & 2005.55 & 2029.61 & 2005.55 & 2025.90 \\\\ \n16443 & 2030.61 & 2064.08 & 2030.61 & 2062.14 \\\\ \n16444 & 2063.45 & 2064.43 & 2038.33 & 2044.81 \\\\ \n\\midrule \naverage & 2,035.240 & 2,048.562 & 2,016.854 & 2,031.208 \\\\ \ntotal & 10,176.200 & 10,242.810 & 10,084.270 & 10,156.040 \\\\ \nstd dev & 23.658 & 17.476 & 18.537 & 22.917 \\\\ \n\\midrule\\addlinespace[2.5pt]\n\\multicolumn{5}{l}{W03} \\\\[2.5pt] \n\\midrule\\addlinespace[2.5pt]\n16447 & 2046.13 & 2049.30 & 2022.58 & 2028.26 \\\\ \n16448 & 2031.58 & 2056.93 & 2008.25 & 2023.03 \\\\ \n16449 & 2018.40 & 2018.40 & 1988.44 & 2011.27 \\\\ \n16450 & 2013.75 & 2021.35 & 1991.47 & 1992.67 \\\\ \n16451 & 1992.25 & 2020.46 & 1988.12 & 2019.42 \\\\ \n\\midrule \naverage & 2020.42200 & 2033.28798 & 1999.77198 & 2014.9300 \\\\ \ntotal & 10102.11000 & 10166.43990 & 9998.85990 & 10074.6500 \\\\ \nstd dev & 20.17218 & 18.33064 & 15.20847 & 13.8957 \\\\ \n\\bottomrule\n\\end{longtable}\n\\endgroup\n"

---

    Code
      as_rtf(gt_tbl)
    Output
      {\rtf\ansi\ansicpg1252{\fonttbl{\f0\froman\fcharset0\fprq0 Courier New;}{\f1\froman\fcharset0\fprq0 Times;}}{\colortbl;\red211\green211\blue211;}
      
      \paperw12240\paperh15840\widowctrl\ftnbj\fet0\sectd\linex0
      \lndscpsxn
      \margl1440\margr1440\margt1440\margb1440
      \headery720\footery720\fs20
      
      \trowd\trrh0\trhdr
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85\clbrdrb\brdrs\brdrw20\brdrcf1 \cellx1872
      \intbl {\f0 {\f0\fs20 }}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85\clbrdrb\brdrs\brdrw20\brdrcf1 \cellx3744
      \intbl {\f0 {\f0\fs20 open}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85\clbrdrb\brdrs\brdrw20\brdrcf1 \cellx5616
      \intbl {\f0 {\f0\fs20 high}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85\clbrdrb\brdrs\brdrw20\brdrcf1 \cellx7488
      \intbl {\f0 {\f0\fs20 low}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85\clbrdrb\brdrs\brdrw20\brdrcf1 \cellx9360
      \intbl {\f0 {\f0\fs20 close}}\cell
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\ql\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx9360
      \intbl {\f0\fs20 W02}\cell
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx1872
      \intbl {\f0 {\f0\fs20 16440}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx3744
      \intbl {\f0 {\f0\fs20 2054.44}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx5616
      \intbl {\f0 {\f0\fs20 2054.44}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx7488
      \intbl {\f0 {\f0\fs20 2017.34}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx9360
      \intbl {\f0 {\f0\fs20 2020.58}}\cell
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx1872
      \intbl {\f0 {\f0\fs20 16441}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx3744
      \intbl {\f0 {\f0\fs20 2022.15}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx5616
      \intbl {\f0 {\f0\fs20 2030.25}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx7488
      \intbl {\f0 {\f0\fs20 1992.44}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx9360
      \intbl {\f0 {\f0\fs20 2002.61}}\cell
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx1872
      \intbl {\f0 {\f0\fs20 16442}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx3744
      \intbl {\f0 {\f0\fs20 2005.55}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx5616
      \intbl {\f0 {\f0\fs20 2029.61}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx7488
      \intbl {\f0 {\f0\fs20 2005.55}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx9360
      \intbl {\f0 {\f0\fs20 2025.90}}\cell
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx1872
      \intbl {\f0 {\f0\fs20 16443}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx3744
      \intbl {\f0 {\f0\fs20 2030.61}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx5616
      \intbl {\f0 {\f0\fs20 2064.08}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx7488
      \intbl {\f0 {\f0\fs20 2030.61}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx9360
      \intbl {\f0 {\f0\fs20 2062.14}}\cell
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx1872
      \intbl {\f0 {\f0\fs20 16444}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx3744
      \intbl {\f0 {\f0\fs20 2063.45}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx5616
      \intbl {\f0 {\f0\fs20 2064.43}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx7488
      \intbl {\f0 {\f0\fs20 2038.33}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx9360
      \intbl {\f0 {\f0\fs20 2044.81}}\cell
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx1872
      \intbl {\f0 {\f0\fs20 average}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx3744
      \intbl {\f0 {\f0\fs20 2,035.240}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx5616
      \intbl {\f0 {\f0\fs20 2,048.562}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx7488
      \intbl {\f0 {\f0\fs20 2,016.854}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx9360
      \intbl {\f0 {\f0\fs20 2,031.208}}\cell
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx1872
      \intbl {\f0 {\f0\fs20 total}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx3744
      \intbl {\f0 {\f0\fs20 10,176.200}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx5616
      \intbl {\f0 {\f0\fs20 10,242.810}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx7488
      \intbl {\f0 {\f0\fs20 10,084.270}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx9360
      \intbl {\f0 {\f0\fs20 10,156.040}}\cell
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx1872
      \intbl {\f0 {\f0\fs20 std dev}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx3744
      \intbl {\f0 {\f0\fs20 23.658}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx5616
      \intbl {\f0 {\f0\fs20 17.476}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx7488
      \intbl {\f0 {\f0\fs20 18.537}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx9360
      \intbl {\f0 {\f0\fs20 22.917}}\cell
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\ql\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx9360
      \intbl {\f0\fs20 W03}\cell
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx1872
      \intbl {\f0 {\f0\fs20 16447}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx3744
      \intbl {\f0 {\f0\fs20 2046.13}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx5616
      \intbl {\f0 {\f0\fs20 2049.30}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx7488
      \intbl {\f0 {\f0\fs20 2022.58}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx9360
      \intbl {\f0 {\f0\fs20 2028.26}}\cell
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx1872
      \intbl {\f0 {\f0\fs20 16448}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx3744
      \intbl {\f0 {\f0\fs20 2031.58}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx5616
      \intbl {\f0 {\f0\fs20 2056.93}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx7488
      \intbl {\f0 {\f0\fs20 2008.25}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx9360
      \intbl {\f0 {\f0\fs20 2023.03}}\cell
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx1872
      \intbl {\f0 {\f0\fs20 16449}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx3744
      \intbl {\f0 {\f0\fs20 2018.40}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx5616
      \intbl {\f0 {\f0\fs20 2018.40}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx7488
      \intbl {\f0 {\f0\fs20 1988.44}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx9360
      \intbl {\f0 {\f0\fs20 2011.27}}\cell
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx1872
      \intbl {\f0 {\f0\fs20 16450}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx3744
      \intbl {\f0 {\f0\fs20 2013.75}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx5616
      \intbl {\f0 {\f0\fs20 2021.35}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx7488
      \intbl {\f0 {\f0\fs20 1991.47}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx9360
      \intbl {\f0 {\f0\fs20 1992.67}}\cell
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx1872
      \intbl {\f0 {\f0\fs20 16451}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx3744
      \intbl {\f0 {\f0\fs20 1992.25}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx5616
      \intbl {\f0 {\f0\fs20 2020.46}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx7488
      \intbl {\f0 {\f0\fs20 1988.12}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx9360
      \intbl {\f0 {\f0\fs20 2019.42}}\cell
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx1872
      \intbl {\f0 {\f0\fs20 average}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx3744
      \intbl {\f0 {\f0\fs20 2020.42200}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx5616
      \intbl {\f0 {\f0\fs20 2033.28798}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx7488
      \intbl {\f0 {\f0\fs20 1999.77198}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx9360
      \intbl {\f0 {\f0\fs20 2014.9300}}\cell
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx1872
      \intbl {\f0 {\f0\fs20 total}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx3744
      \intbl {\f0 {\f0\fs20 10102.11000}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx5616
      \intbl {\f0 {\f0\fs20 10166.43990}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx7488
      \intbl {\f0 {\f0\fs20 9998.85990}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx9360
      \intbl {\f0 {\f0\fs20 10074.6500}}\cell
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx1872
      \intbl {\f0 {\f0\fs20 std dev}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx3744
      \intbl {\f0 {\f0\fs20 20.17218}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx5616
      \intbl {\f0 {\f0\fs20 18.33064}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx7488
      \intbl {\f0 {\f0\fs20 15.20847}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx9360
      \intbl {\f0 {\f0\fs20 13.8957}}\cell
      
      \row
      
      }

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
          <tr><th id="summary_stub_W02_1" scope="row" class="gt_row gt_left gt_stub gt_summary_row gt_first_summary_row thick">average</th>
      <td headers="W02 summary_stub_W02_1 open" class="gt_row gt_right gt_summary_row gt_first_summary_row thick">2,035.240</td>
      <td headers="W02 summary_stub_W02_1 high" class="gt_row gt_right gt_summary_row gt_first_summary_row thick">2,048.562</td>
      <td headers="W02 summary_stub_W02_1 low" class="gt_row gt_right gt_summary_row gt_first_summary_row thick">2,016.854</td>
      <td headers="W02 summary_stub_W02_1 close" class="gt_row gt_right gt_summary_row gt_first_summary_row thick">2,031.208</td></tr>
          <tr><th id="summary_stub_W02_2" scope="row" class="gt_row gt_left gt_stub gt_summary_row">total</th>
      <td headers="W02 summary_stub_W02_2 open" class="gt_row gt_right gt_summary_row">10,176.200</td>
      <td headers="W02 summary_stub_W02_2 high" class="gt_row gt_right gt_summary_row">10,242.810</td>
      <td headers="W02 summary_stub_W02_2 low" class="gt_row gt_right gt_summary_row">10,084.270</td>
      <td headers="W02 summary_stub_W02_2 close" class="gt_row gt_right gt_summary_row">10,156.040</td></tr>
          <tr><th id="summary_stub_W02_3" scope="row" class="gt_row gt_left gt_stub gt_summary_row gt_last_summary_row">std dev</th>
      <td headers="W02 summary_stub_W02_3 open" class="gt_row gt_right gt_summary_row gt_last_summary_row">23.658</td>
      <td headers="W02 summary_stub_W02_3 high" class="gt_row gt_right gt_summary_row gt_last_summary_row">17.476</td>
      <td headers="W02 summary_stub_W02_3 low" class="gt_row gt_right gt_summary_row gt_last_summary_row">18.537</td>
      <td headers="W02 summary_stub_W02_3 close" class="gt_row gt_right gt_summary_row gt_last_summary_row">22.917</td></tr>
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
      <td headers="W03 stub_1_10 low" class="gt_row gt_right">1988.12</td>
      <td headers="W03 stub_1_10 close" class="gt_row gt_right">2019.42</td></tr>
          <tr><th id="summary_stub_W03_1" scope="row" class="gt_row gt_left gt_stub gt_summary_row gt_first_summary_row thick">average</th>
      <td headers="W03 summary_stub_W03_1 open" class="gt_row gt_right gt_summary_row gt_first_summary_row thick">$2,020.42</td>
      <td headers="W03 summary_stub_W03_1 high" class="gt_row gt_right gt_summary_row gt_first_summary_row thick">$2,033.29</td>
      <td headers="W03 summary_stub_W03_1 low" class="gt_row gt_right gt_summary_row gt_first_summary_row thick">$1,999.77</td>
      <td headers="W03 summary_stub_W03_1 close" class="gt_row gt_right gt_summary_row gt_first_summary_row thick">$2,014.93</td></tr>
          <tr><th id="summary_stub_W03_2" scope="row" class="gt_row gt_left gt_stub gt_summary_row">total</th>
      <td headers="W03 summary_stub_W03_2 open" class="gt_row gt_right gt_summary_row">$10,102.11</td>
      <td headers="W03 summary_stub_W03_2 high" class="gt_row gt_right gt_summary_row">$10,166.44</td>
      <td headers="W03 summary_stub_W03_2 low" class="gt_row gt_right gt_summary_row">$9,998.86</td>
      <td headers="W03 summary_stub_W03_2 close" class="gt_row gt_right gt_summary_row">$10,074.65</td></tr>
          <tr><th id="summary_stub_W03_3" scope="row" class="gt_row gt_left gt_stub gt_summary_row gt_last_summary_row">std dev</th>
      <td headers="W03 summary_stub_W03_3 open" class="gt_row gt_right gt_summary_row gt_last_summary_row">$20.17</td>
      <td headers="W03 summary_stub_W03_3 high" class="gt_row gt_right gt_summary_row gt_last_summary_row">$18.33</td>
      <td headers="W03 summary_stub_W03_3 low" class="gt_row gt_right gt_summary_row gt_last_summary_row">$15.21</td>
      <td headers="W03 summary_stub_W03_3 close" class="gt_row gt_right gt_summary_row gt_last_summary_row">$13.90</td></tr>
        </tbody>
        
      </table>

---

    Code
      as.character(as_latex(gt_tbl))
    Output
      [1] "\\begingroup\n\\fontsize{12.0pt}{14.0pt}\\selectfont\n\\begin{longtable}{l|rrrr}\n\\toprule\n & open & high & low & close \\\\ \n\\midrule\\addlinespace[2.5pt]\n\\multicolumn{5}{l}{W02} \\\\[2.5pt] \n\\midrule\\addlinespace[2.5pt]\n16440 & 2054.44 & 2054.44 & 2017.34 & 2020.58 \\\\ \n16441 & 2022.15 & 2030.25 & 1992.44 & 2002.61 \\\\ \n16442 & 2005.55 & 2029.61 & 2005.55 & 2025.90 \\\\ \n16443 & 2030.61 & 2064.08 & 2030.61 & 2062.14 \\\\ \n16444 & 2063.45 & 2064.43 & 2038.33 & 2044.81 \\\\ \n\\midrule \naverage & 2,035.240 & 2,048.562 & 2,016.854 & 2,031.208 \\\\ \ntotal & 10,176.200 & 10,242.810 & 10,084.270 & 10,156.040 \\\\ \nstd dev & 23.658 & 17.476 & 18.537 & 22.917 \\\\ \n\\midrule\\addlinespace[2.5pt]\n\\multicolumn{5}{l}{W03} \\\\[2.5pt] \n\\midrule\\addlinespace[2.5pt]\n16447 & 2046.13 & 2049.30 & 2022.58 & 2028.26 \\\\ \n16448 & 2031.58 & 2056.93 & 2008.25 & 2023.03 \\\\ \n16449 & 2018.40 & 2018.40 & 1988.44 & 2011.27 \\\\ \n16450 & 2013.75 & 2021.35 & 1991.47 & 1992.67 \\\\ \n16451 & 1992.25 & 2020.46 & 1988.12 & 2019.42 \\\\ \n\\midrule \naverage & \\$2,020.42 & \\$2,033.29 & \\$1,999.77 & \\$2,014.93 \\\\ \ntotal & \\$10,102.11 & \\$10,166.44 & \\$9,998.86 & \\$10,074.65 \\\\ \nstd dev & \\$20.17 & \\$18.33 & \\$15.21 & \\$13.90 \\\\ \n\\bottomrule\n\\end{longtable}\n\\endgroup\n"

---

    Code
      as_rtf(gt_tbl)
    Output
      {\rtf\ansi\ansicpg1252{\fonttbl{\f0\froman\fcharset0\fprq0 Courier New;}{\f1\froman\fcharset0\fprq0 Times;}}{\colortbl;\red211\green211\blue211;}
      
      \paperw12240\paperh15840\widowctrl\ftnbj\fet0\sectd\linex0
      \lndscpsxn
      \margl1440\margr1440\margt1440\margb1440
      \headery720\footery720\fs20
      
      \trowd\trrh0\trhdr
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85\clbrdrb\brdrs\brdrw20\brdrcf1 \cellx1872
      \intbl {\f0 {\f0\fs20 }}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85\clbrdrb\brdrs\brdrw20\brdrcf1 \cellx3744
      \intbl {\f0 {\f0\fs20 open}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85\clbrdrb\brdrs\brdrw20\brdrcf1 \cellx5616
      \intbl {\f0 {\f0\fs20 high}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85\clbrdrb\brdrs\brdrw20\brdrcf1 \cellx7488
      \intbl {\f0 {\f0\fs20 low}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85\clbrdrb\brdrs\brdrw20\brdrcf1 \cellx9360
      \intbl {\f0 {\f0\fs20 close}}\cell
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\ql\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx9360
      \intbl {\f0\fs20 W02}\cell
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx1872
      \intbl {\f0 {\f0\fs20 16440}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx3744
      \intbl {\f0 {\f0\fs20 2054.44}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx5616
      \intbl {\f0 {\f0\fs20 2054.44}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx7488
      \intbl {\f0 {\f0\fs20 2017.34}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx9360
      \intbl {\f0 {\f0\fs20 2020.58}}\cell
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx1872
      \intbl {\f0 {\f0\fs20 16441}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx3744
      \intbl {\f0 {\f0\fs20 2022.15}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx5616
      \intbl {\f0 {\f0\fs20 2030.25}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx7488
      \intbl {\f0 {\f0\fs20 1992.44}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx9360
      \intbl {\f0 {\f0\fs20 2002.61}}\cell
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx1872
      \intbl {\f0 {\f0\fs20 16442}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx3744
      \intbl {\f0 {\f0\fs20 2005.55}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx5616
      \intbl {\f0 {\f0\fs20 2029.61}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx7488
      \intbl {\f0 {\f0\fs20 2005.55}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx9360
      \intbl {\f0 {\f0\fs20 2025.90}}\cell
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx1872
      \intbl {\f0 {\f0\fs20 16443}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx3744
      \intbl {\f0 {\f0\fs20 2030.61}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx5616
      \intbl {\f0 {\f0\fs20 2064.08}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx7488
      \intbl {\f0 {\f0\fs20 2030.61}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx9360
      \intbl {\f0 {\f0\fs20 2062.14}}\cell
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx1872
      \intbl {\f0 {\f0\fs20 16444}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx3744
      \intbl {\f0 {\f0\fs20 2063.45}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx5616
      \intbl {\f0 {\f0\fs20 2064.43}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx7488
      \intbl {\f0 {\f0\fs20 2038.33}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx9360
      \intbl {\f0 {\f0\fs20 2044.81}}\cell
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx1872
      \intbl {\f0 {\f0\fs20 average}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx3744
      \intbl {\f0 {\f0\fs20 2,035.240}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx5616
      \intbl {\f0 {\f0\fs20 2,048.562}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx7488
      \intbl {\f0 {\f0\fs20 2,016.854}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx9360
      \intbl {\f0 {\f0\fs20 2,031.208}}\cell
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx1872
      \intbl {\f0 {\f0\fs20 total}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx3744
      \intbl {\f0 {\f0\fs20 10,176.200}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx5616
      \intbl {\f0 {\f0\fs20 10,242.810}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx7488
      \intbl {\f0 {\f0\fs20 10,084.270}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx9360
      \intbl {\f0 {\f0\fs20 10,156.040}}\cell
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx1872
      \intbl {\f0 {\f0\fs20 std dev}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx3744
      \intbl {\f0 {\f0\fs20 23.658}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx5616
      \intbl {\f0 {\f0\fs20 17.476}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx7488
      \intbl {\f0 {\f0\fs20 18.537}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx9360
      \intbl {\f0 {\f0\fs20 22.917}}\cell
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\ql\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx9360
      \intbl {\f0\fs20 W03}\cell
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx1872
      \intbl {\f0 {\f0\fs20 16447}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx3744
      \intbl {\f0 {\f0\fs20 2046.13}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx5616
      \intbl {\f0 {\f0\fs20 2049.30}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx7488
      \intbl {\f0 {\f0\fs20 2022.58}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx9360
      \intbl {\f0 {\f0\fs20 2028.26}}\cell
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx1872
      \intbl {\f0 {\f0\fs20 16448}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx3744
      \intbl {\f0 {\f0\fs20 2031.58}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx5616
      \intbl {\f0 {\f0\fs20 2056.93}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx7488
      \intbl {\f0 {\f0\fs20 2008.25}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx9360
      \intbl {\f0 {\f0\fs20 2023.03}}\cell
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx1872
      \intbl {\f0 {\f0\fs20 16449}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx3744
      \intbl {\f0 {\f0\fs20 2018.40}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx5616
      \intbl {\f0 {\f0\fs20 2018.40}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx7488
      \intbl {\f0 {\f0\fs20 1988.44}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx9360
      \intbl {\f0 {\f0\fs20 2011.27}}\cell
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx1872
      \intbl {\f0 {\f0\fs20 16450}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx3744
      \intbl {\f0 {\f0\fs20 2013.75}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx5616
      \intbl {\f0 {\f0\fs20 2021.35}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx7488
      \intbl {\f0 {\f0\fs20 1991.47}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx9360
      \intbl {\f0 {\f0\fs20 1992.67}}\cell
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx1872
      \intbl {\f0 {\f0\fs20 16451}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx3744
      \intbl {\f0 {\f0\fs20 1992.25}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx5616
      \intbl {\f0 {\f0\fs20 2020.46}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx7488
      \intbl {\f0 {\f0\fs20 1988.12}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx9360
      \intbl {\f0 {\f0\fs20 2019.42}}\cell
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx1872
      \intbl {\f0 {\f0\fs20 average}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx3744
      \intbl {\f0 {\f0\fs20 $2,020.42}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx5616
      \intbl {\f0 {\f0\fs20 $2,033.29}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx7488
      \intbl {\f0 {\f0\fs20 $1,999.77}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx9360
      \intbl {\f0 {\f0\fs20 $2,014.93}}\cell
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx1872
      \intbl {\f0 {\f0\fs20 total}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx3744
      \intbl {\f0 {\f0\fs20 $10,102.11}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx5616
      \intbl {\f0 {\f0\fs20 $10,166.44}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx7488
      \intbl {\f0 {\f0\fs20 $9,998.86}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx9360
      \intbl {\f0 {\f0\fs20 $10,074.65}}\cell
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx1872
      \intbl {\f0 {\f0\fs20 std dev}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx3744
      \intbl {\f0 {\f0\fs20 $20.17}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx5616
      \intbl {\f0 {\f0\fs20 $18.33}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx7488
      \intbl {\f0 {\f0\fs20 $15.21}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx9360
      \intbl {\f0 {\f0\fs20 $13.90}}\cell
      
      \row
      
      }

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
          <tr><th id="summary_stub_W02_1" scope="row" class="gt_row gt_left gt_stub gt_summary_row gt_first_summary_row thick">average</th>
      <td headers="W02 summary_stub_W02_1 open" class="gt_row gt_right gt_summary_row gt_first_summary_row thick">$2,035.24</td>
      <td headers="W02 summary_stub_W02_1 high" class="gt_row gt_right gt_summary_row gt_first_summary_row thick">$2,048.56</td>
      <td headers="W02 summary_stub_W02_1 low" class="gt_row gt_right gt_summary_row gt_first_summary_row thick">$2,016.85</td>
      <td headers="W02 summary_stub_W02_1 close" class="gt_row gt_right gt_summary_row gt_first_summary_row thick">$2,031.21</td></tr>
          <tr><th id="summary_stub_W02_2" scope="row" class="gt_row gt_left gt_stub gt_summary_row">total</th>
      <td headers="W02 summary_stub_W02_2 open" class="gt_row gt_right gt_summary_row">$10,176.20</td>
      <td headers="W02 summary_stub_W02_2 high" class="gt_row gt_right gt_summary_row">$10,242.81</td>
      <td headers="W02 summary_stub_W02_2 low" class="gt_row gt_right gt_summary_row">$10,084.27</td>
      <td headers="W02 summary_stub_W02_2 close" class="gt_row gt_right gt_summary_row">$10,156.04</td></tr>
          <tr><th id="summary_stub_W02_3" scope="row" class="gt_row gt_left gt_stub gt_summary_row gt_last_summary_row">std dev</th>
      <td headers="W02 summary_stub_W02_3 open" class="gt_row gt_right gt_summary_row gt_last_summary_row">$23.66</td>
      <td headers="W02 summary_stub_W02_3 high" class="gt_row gt_right gt_summary_row gt_last_summary_row">$17.48</td>
      <td headers="W02 summary_stub_W02_3 low" class="gt_row gt_right gt_summary_row gt_last_summary_row">$18.54</td>
      <td headers="W02 summary_stub_W02_3 close" class="gt_row gt_right gt_summary_row gt_last_summary_row">$22.92</td></tr>
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
      <td headers="W03 stub_1_10 low" class="gt_row gt_right">1988.12</td>
      <td headers="W03 stub_1_10 close" class="gt_row gt_right">2019.42</td></tr>
          <tr><th id="summary_stub_W03_1" scope="row" class="gt_row gt_left gt_stub gt_summary_row gt_first_summary_row thick">average</th>
      <td headers="W03 summary_stub_W03_1 open" class="gt_row gt_right gt_summary_row gt_first_summary_row thick">$2,020.42</td>
      <td headers="W03 summary_stub_W03_1 high" class="gt_row gt_right gt_summary_row gt_first_summary_row thick">$2,033.29</td>
      <td headers="W03 summary_stub_W03_1 low" class="gt_row gt_right gt_summary_row gt_first_summary_row thick">$1,999.77</td>
      <td headers="W03 summary_stub_W03_1 close" class="gt_row gt_right gt_summary_row gt_first_summary_row thick">$2,014.93</td></tr>
          <tr><th id="summary_stub_W03_2" scope="row" class="gt_row gt_left gt_stub gt_summary_row">total</th>
      <td headers="W03 summary_stub_W03_2 open" class="gt_row gt_right gt_summary_row">$10,102.11</td>
      <td headers="W03 summary_stub_W03_2 high" class="gt_row gt_right gt_summary_row">$10,166.44</td>
      <td headers="W03 summary_stub_W03_2 low" class="gt_row gt_right gt_summary_row">$9,998.86</td>
      <td headers="W03 summary_stub_W03_2 close" class="gt_row gt_right gt_summary_row">$10,074.65</td></tr>
          <tr><th id="summary_stub_W03_3" scope="row" class="gt_row gt_left gt_stub gt_summary_row gt_last_summary_row">std dev</th>
      <td headers="W03 summary_stub_W03_3 open" class="gt_row gt_right gt_summary_row gt_last_summary_row">$20.17</td>
      <td headers="W03 summary_stub_W03_3 high" class="gt_row gt_right gt_summary_row gt_last_summary_row">$18.33</td>
      <td headers="W03 summary_stub_W03_3 low" class="gt_row gt_right gt_summary_row gt_last_summary_row">$15.21</td>
      <td headers="W03 summary_stub_W03_3 close" class="gt_row gt_right gt_summary_row gt_last_summary_row">$13.90</td></tr>
        </tbody>
        
      </table>

---

    Code
      as.character(as_latex(gt_tbl))
    Output
      [1] "\\begingroup\n\\fontsize{12.0pt}{14.0pt}\\selectfont\n\\begin{longtable}{l|rrrr}\n\\toprule\n & open & high & low & close \\\\ \n\\midrule\\addlinespace[2.5pt]\n\\multicolumn{5}{l}{W02} \\\\[2.5pt] \n\\midrule\\addlinespace[2.5pt]\n16440 & 2054.44 & 2054.44 & 2017.34 & 2020.58 \\\\ \n16441 & 2022.15 & 2030.25 & 1992.44 & 2002.61 \\\\ \n16442 & 2005.55 & 2029.61 & 2005.55 & 2025.90 \\\\ \n16443 & 2030.61 & 2064.08 & 2030.61 & 2062.14 \\\\ \n16444 & 2063.45 & 2064.43 & 2038.33 & 2044.81 \\\\ \n\\midrule \naverage & \\$2,035.24 & \\$2,048.56 & \\$2,016.85 & \\$2,031.21 \\\\ \ntotal & \\$10,176.20 & \\$10,242.81 & \\$10,084.27 & \\$10,156.04 \\\\ \nstd dev & \\$23.66 & \\$17.48 & \\$18.54 & \\$22.92 \\\\ \n\\midrule\\addlinespace[2.5pt]\n\\multicolumn{5}{l}{W03} \\\\[2.5pt] \n\\midrule\\addlinespace[2.5pt]\n16447 & 2046.13 & 2049.30 & 2022.58 & 2028.26 \\\\ \n16448 & 2031.58 & 2056.93 & 2008.25 & 2023.03 \\\\ \n16449 & 2018.40 & 2018.40 & 1988.44 & 2011.27 \\\\ \n16450 & 2013.75 & 2021.35 & 1991.47 & 1992.67 \\\\ \n16451 & 1992.25 & 2020.46 & 1988.12 & 2019.42 \\\\ \n\\midrule \naverage & \\$2,020.42 & \\$2,033.29 & \\$1,999.77 & \\$2,014.93 \\\\ \ntotal & \\$10,102.11 & \\$10,166.44 & \\$9,998.86 & \\$10,074.65 \\\\ \nstd dev & \\$20.17 & \\$18.33 & \\$15.21 & \\$13.90 \\\\ \n\\bottomrule\n\\end{longtable}\n\\endgroup\n"

---

    Code
      as_rtf(gt_tbl)
    Output
      {\rtf\ansi\ansicpg1252{\fonttbl{\f0\froman\fcharset0\fprq0 Courier New;}{\f1\froman\fcharset0\fprq0 Times;}}{\colortbl;\red211\green211\blue211;}
      
      \paperw12240\paperh15840\widowctrl\ftnbj\fet0\sectd\linex0
      \lndscpsxn
      \margl1440\margr1440\margt1440\margb1440
      \headery720\footery720\fs20
      
      \trowd\trrh0\trhdr
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85\clbrdrb\brdrs\brdrw20\brdrcf1 \cellx1872
      \intbl {\f0 {\f0\fs20 }}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85\clbrdrb\brdrs\brdrw20\brdrcf1 \cellx3744
      \intbl {\f0 {\f0\fs20 open}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85\clbrdrb\brdrs\brdrw20\brdrcf1 \cellx5616
      \intbl {\f0 {\f0\fs20 high}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85\clbrdrb\brdrs\brdrw20\brdrcf1 \cellx7488
      \intbl {\f0 {\f0\fs20 low}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85\clbrdrb\brdrs\brdrw20\brdrcf1 \cellx9360
      \intbl {\f0 {\f0\fs20 close}}\cell
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\ql\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx9360
      \intbl {\f0\fs20 W02}\cell
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx1872
      \intbl {\f0 {\f0\fs20 16440}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx3744
      \intbl {\f0 {\f0\fs20 2054.44}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx5616
      \intbl {\f0 {\f0\fs20 2054.44}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx7488
      \intbl {\f0 {\f0\fs20 2017.34}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx9360
      \intbl {\f0 {\f0\fs20 2020.58}}\cell
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx1872
      \intbl {\f0 {\f0\fs20 16441}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx3744
      \intbl {\f0 {\f0\fs20 2022.15}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx5616
      \intbl {\f0 {\f0\fs20 2030.25}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx7488
      \intbl {\f0 {\f0\fs20 1992.44}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx9360
      \intbl {\f0 {\f0\fs20 2002.61}}\cell
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx1872
      \intbl {\f0 {\f0\fs20 16442}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx3744
      \intbl {\f0 {\f0\fs20 2005.55}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx5616
      \intbl {\f0 {\f0\fs20 2029.61}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx7488
      \intbl {\f0 {\f0\fs20 2005.55}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx9360
      \intbl {\f0 {\f0\fs20 2025.90}}\cell
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx1872
      \intbl {\f0 {\f0\fs20 16443}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx3744
      \intbl {\f0 {\f0\fs20 2030.61}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx5616
      \intbl {\f0 {\f0\fs20 2064.08}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx7488
      \intbl {\f0 {\f0\fs20 2030.61}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx9360
      \intbl {\f0 {\f0\fs20 2062.14}}\cell
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx1872
      \intbl {\f0 {\f0\fs20 16444}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx3744
      \intbl {\f0 {\f0\fs20 2063.45}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx5616
      \intbl {\f0 {\f0\fs20 2064.43}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx7488
      \intbl {\f0 {\f0\fs20 2038.33}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx9360
      \intbl {\f0 {\f0\fs20 2044.81}}\cell
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx1872
      \intbl {\f0 {\f0\fs20 average}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx3744
      \intbl {\f0 {\f0\fs20 $2,035.24}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx5616
      \intbl {\f0 {\f0\fs20 $2,048.56}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx7488
      \intbl {\f0 {\f0\fs20 $2,016.85}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx9360
      \intbl {\f0 {\f0\fs20 $2,031.21}}\cell
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx1872
      \intbl {\f0 {\f0\fs20 total}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx3744
      \intbl {\f0 {\f0\fs20 $10,176.20}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx5616
      \intbl {\f0 {\f0\fs20 $10,242.81}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx7488
      \intbl {\f0 {\f0\fs20 $10,084.27}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx9360
      \intbl {\f0 {\f0\fs20 $10,156.04}}\cell
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx1872
      \intbl {\f0 {\f0\fs20 std dev}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx3744
      \intbl {\f0 {\f0\fs20 $23.66}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx5616
      \intbl {\f0 {\f0\fs20 $17.48}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx7488
      \intbl {\f0 {\f0\fs20 $18.54}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx9360
      \intbl {\f0 {\f0\fs20 $22.92}}\cell
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\ql\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx9360
      \intbl {\f0\fs20 W03}\cell
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx1872
      \intbl {\f0 {\f0\fs20 16447}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx3744
      \intbl {\f0 {\f0\fs20 2046.13}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx5616
      \intbl {\f0 {\f0\fs20 2049.30}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx7488
      \intbl {\f0 {\f0\fs20 2022.58}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx9360
      \intbl {\f0 {\f0\fs20 2028.26}}\cell
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx1872
      \intbl {\f0 {\f0\fs20 16448}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx3744
      \intbl {\f0 {\f0\fs20 2031.58}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx5616
      \intbl {\f0 {\f0\fs20 2056.93}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx7488
      \intbl {\f0 {\f0\fs20 2008.25}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx9360
      \intbl {\f0 {\f0\fs20 2023.03}}\cell
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx1872
      \intbl {\f0 {\f0\fs20 16449}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx3744
      \intbl {\f0 {\f0\fs20 2018.40}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx5616
      \intbl {\f0 {\f0\fs20 2018.40}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx7488
      \intbl {\f0 {\f0\fs20 1988.44}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx9360
      \intbl {\f0 {\f0\fs20 2011.27}}\cell
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx1872
      \intbl {\f0 {\f0\fs20 16450}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx3744
      \intbl {\f0 {\f0\fs20 2013.75}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx5616
      \intbl {\f0 {\f0\fs20 2021.35}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx7488
      \intbl {\f0 {\f0\fs20 1991.47}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx9360
      \intbl {\f0 {\f0\fs20 1992.67}}\cell
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx1872
      \intbl {\f0 {\f0\fs20 16451}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx3744
      \intbl {\f0 {\f0\fs20 1992.25}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx5616
      \intbl {\f0 {\f0\fs20 2020.46}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx7488
      \intbl {\f0 {\f0\fs20 1988.12}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx9360
      \intbl {\f0 {\f0\fs20 2019.42}}\cell
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx1872
      \intbl {\f0 {\f0\fs20 average}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx3744
      \intbl {\f0 {\f0\fs20 $2,020.42}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx5616
      \intbl {\f0 {\f0\fs20 $2,033.29}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx7488
      \intbl {\f0 {\f0\fs20 $1,999.77}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx9360
      \intbl {\f0 {\f0\fs20 $2,014.93}}\cell
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx1872
      \intbl {\f0 {\f0\fs20 total}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx3744
      \intbl {\f0 {\f0\fs20 $10,102.11}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx5616
      \intbl {\f0 {\f0\fs20 $10,166.44}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx7488
      \intbl {\f0 {\f0\fs20 $9,998.86}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx9360
      \intbl {\f0 {\f0\fs20 $10,074.65}}\cell
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx1872
      \intbl {\f0 {\f0\fs20 std dev}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx3744
      \intbl {\f0 {\f0\fs20 $20.17}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx5616
      \intbl {\f0 {\f0\fs20 $18.33}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx7488
      \intbl {\f0 {\f0\fs20 $15.21}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx9360
      \intbl {\f0 {\f0\fs20 $13.90}}\cell
      
      \row
      
      }

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
          <tr><th id="stub_1_10" scope="row" class="gt_row gt_right gt_stub">2015-01-16</th>
      <td headers="W03 stub_1_10 open" class="gt_row gt_right">1992.25</td>
      <td headers="W03 stub_1_10 high" class="gt_row gt_right">2020.46</td>
      <td headers="W03 stub_1_10 low" class="gt_row gt_right">1988.12</td>
      <td headers="W03 stub_1_10 close" class="gt_row gt_right">2019.42</td></tr>
          <tr><th id="grand_summary_stub_1" scope="row" class="gt_row gt_left gt_stub gt_grand_summary_row gt_first_grand_summary_row">average</th>
      <td headers="grand_summary_stub_1 open" class="gt_row gt_right gt_grand_summary_row gt_first_grand_summary_row">2,027.831</td>
      <td headers="grand_summary_stub_1 high" class="gt_row gt_right gt_grand_summary_row gt_first_grand_summary_row">2,040.925</td>
      <td headers="grand_summary_stub_1 low" class="gt_row gt_right gt_grand_summary_row gt_first_grand_summary_row">2,008.313</td>
      <td headers="grand_summary_stub_1 close" class="gt_row gt_right gt_grand_summary_row gt_first_grand_summary_row">2,023.069</td></tr>
          <tr><th id="grand_summary_stub_2" scope="row" class="gt_row gt_left gt_stub gt_grand_summary_row">total</th>
      <td headers="grand_summary_stub_2 open" class="gt_row gt_right gt_grand_summary_row">20,278.310</td>
      <td headers="grand_summary_stub_2 high" class="gt_row gt_right gt_grand_summary_row">20,409.250</td>
      <td headers="grand_summary_stub_2 low" class="gt_row gt_right gt_grand_summary_row">20,083.130</td>
      <td headers="grand_summary_stub_2 close" class="gt_row gt_right gt_grand_summary_row">20,230.690</td></tr>
          <tr><th id="grand_summary_stub_3" scope="row" class="gt_row gt_left gt_stub gt_grand_summary_row gt_last_summary_row">std dev</th>
      <td headers="grand_summary_stub_3 open" class="gt_row gt_right gt_grand_summary_row gt_last_summary_row">22.149</td>
      <td headers="grand_summary_stub_3 high" class="gt_row gt_right gt_grand_summary_row gt_last_summary_row">18.705</td>
      <td headers="grand_summary_stub_3 low" class="gt_row gt_right gt_grand_summary_row gt_last_summary_row">18.346</td>
      <td headers="grand_summary_stub_3 close" class="gt_row gt_right gt_grand_summary_row gt_last_summary_row">19.820</td></tr>
        </tbody>
        
      </table>

---

    Code
      as.character(as_latex(gt_tbl))
    Output
      [1] "\\begingroup\n\\fontsize{12.0pt}{14.0pt}\\selectfont\n\\begin{longtable}{l|rrrr}\n\\toprule\n & open & high & low & close \\\\ \n\\midrule\\addlinespace[2.5pt]\n\\multicolumn{5}{l}{W02} \\\\[2.5pt] \n\\midrule\\addlinespace[2.5pt]\n16440 & 2054.44 & 2054.44 & 2017.34 & 2020.58 \\\\ \n16441 & 2022.15 & 2030.25 & 1992.44 & 2002.61 \\\\ \n16442 & 2005.55 & 2029.61 & 2005.55 & 2025.90 \\\\ \n16443 & 2030.61 & 2064.08 & 2030.61 & 2062.14 \\\\ \n16444 & 2063.45 & 2064.43 & 2038.33 & 2044.81 \\\\ \n\\midrule\\addlinespace[2.5pt]\n\\multicolumn{5}{l}{W03} \\\\[2.5pt] \n\\midrule\\addlinespace[2.5pt]\n16447 & 2046.13 & 2049.30 & 2022.58 & 2028.26 \\\\ \n16448 & 2031.58 & 2056.93 & 2008.25 & 2023.03 \\\\ \n16449 & 2018.40 & 2018.40 & 1988.44 & 2011.27 \\\\ \n16450 & 2013.75 & 2021.35 & 1991.47 & 1992.67 \\\\ \n16451 & 1992.25 & 2020.46 & 1988.12 & 2019.42 \\\\ \n\\midrule \n\\midrule \naverage & 2,027.831 & 2,040.925 & 2,008.313 & 2,023.069 \\\\ \ntotal & 20,278.310 & 20,409.250 & 20,083.130 & 20,230.690 \\\\ \nstd dev & 22.149 & 18.705 & 18.346 & 19.820 \\\\ \n\\bottomrule\n\\end{longtable}\n\\endgroup\n"

---

    Code
      as_rtf(gt_tbl)
    Output
      {\rtf\ansi\ansicpg1252{\fonttbl{\f0\froman\fcharset0\fprq0 Courier New;}{\f1\froman\fcharset0\fprq0 Times;}}{\colortbl;\red211\green211\blue211;}
      
      \paperw12240\paperh15840\widowctrl\ftnbj\fet0\sectd\linex0
      \lndscpsxn
      \margl1440\margr1440\margt1440\margb1440
      \headery720\footery720\fs20
      
      \trowd\trrh0\trhdr
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85\clbrdrb\brdrs\brdrw20\brdrcf1 \cellx1872
      \intbl {\f0 {\f0\fs20 }}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85\clbrdrb\brdrs\brdrw20\brdrcf1 \cellx3744
      \intbl {\f0 {\f0\fs20 open}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85\clbrdrb\brdrs\brdrw20\brdrcf1 \cellx5616
      \intbl {\f0 {\f0\fs20 high}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85\clbrdrb\brdrs\brdrw20\brdrcf1 \cellx7488
      \intbl {\f0 {\f0\fs20 low}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85\clbrdrb\brdrs\brdrw20\brdrcf1 \cellx9360
      \intbl {\f0 {\f0\fs20 close}}\cell
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\ql\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx9360
      \intbl {\f0\fs20 W02}\cell
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx1872
      \intbl {\f0 {\f0\fs20 16440}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx3744
      \intbl {\f0 {\f0\fs20 2054.44}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx5616
      \intbl {\f0 {\f0\fs20 2054.44}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx7488
      \intbl {\f0 {\f0\fs20 2017.34}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx9360
      \intbl {\f0 {\f0\fs20 2020.58}}\cell
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx1872
      \intbl {\f0 {\f0\fs20 16441}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx3744
      \intbl {\f0 {\f0\fs20 2022.15}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx5616
      \intbl {\f0 {\f0\fs20 2030.25}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx7488
      \intbl {\f0 {\f0\fs20 1992.44}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx9360
      \intbl {\f0 {\f0\fs20 2002.61}}\cell
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx1872
      \intbl {\f0 {\f0\fs20 16442}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx3744
      \intbl {\f0 {\f0\fs20 2005.55}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx5616
      \intbl {\f0 {\f0\fs20 2029.61}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx7488
      \intbl {\f0 {\f0\fs20 2005.55}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx9360
      \intbl {\f0 {\f0\fs20 2025.90}}\cell
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx1872
      \intbl {\f0 {\f0\fs20 16443}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx3744
      \intbl {\f0 {\f0\fs20 2030.61}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx5616
      \intbl {\f0 {\f0\fs20 2064.08}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx7488
      \intbl {\f0 {\f0\fs20 2030.61}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx9360
      \intbl {\f0 {\f0\fs20 2062.14}}\cell
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx1872
      \intbl {\f0 {\f0\fs20 16444}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx3744
      \intbl {\f0 {\f0\fs20 2063.45}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx5616
      \intbl {\f0 {\f0\fs20 2064.43}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx7488
      \intbl {\f0 {\f0\fs20 2038.33}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx9360
      \intbl {\f0 {\f0\fs20 2044.81}}\cell
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\ql\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx9360
      \intbl {\f0\fs20 W03}\cell
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx1872
      \intbl {\f0 {\f0\fs20 16447}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx3744
      \intbl {\f0 {\f0\fs20 2046.13}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx5616
      \intbl {\f0 {\f0\fs20 2049.30}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx7488
      \intbl {\f0 {\f0\fs20 2022.58}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx9360
      \intbl {\f0 {\f0\fs20 2028.26}}\cell
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx1872
      \intbl {\f0 {\f0\fs20 16448}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx3744
      \intbl {\f0 {\f0\fs20 2031.58}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx5616
      \intbl {\f0 {\f0\fs20 2056.93}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx7488
      \intbl {\f0 {\f0\fs20 2008.25}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx9360
      \intbl {\f0 {\f0\fs20 2023.03}}\cell
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx1872
      \intbl {\f0 {\f0\fs20 16449}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx3744
      \intbl {\f0 {\f0\fs20 2018.40}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx5616
      \intbl {\f0 {\f0\fs20 2018.40}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx7488
      \intbl {\f0 {\f0\fs20 1988.44}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx9360
      \intbl {\f0 {\f0\fs20 2011.27}}\cell
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx1872
      \intbl {\f0 {\f0\fs20 16450}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx3744
      \intbl {\f0 {\f0\fs20 2013.75}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx5616
      \intbl {\f0 {\f0\fs20 2021.35}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx7488
      \intbl {\f0 {\f0\fs20 1991.47}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx9360
      \intbl {\f0 {\f0\fs20 1992.67}}\cell
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx1872
      \intbl {\f0 {\f0\fs20 16451}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx3744
      \intbl {\f0 {\f0\fs20 1992.25}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx5616
      \intbl {\f0 {\f0\fs20 2020.46}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx7488
      \intbl {\f0 {\f0\fs20 1988.12}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx9360
      \intbl {\f0 {\f0\fs20 2019.42}}\cell
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx1872
      \intbl {\f0 {\f0\fs20 average}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx3744
      \intbl {\f0 {\f0\fs20 2,027.831}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx5616
      \intbl {\f0 {\f0\fs20 2,040.925}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx7488
      \intbl {\f0 {\f0\fs20 2,008.313}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx9360
      \intbl {\f0 {\f0\fs20 2,023.069}}\cell
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx1872
      \intbl {\f0 {\f0\fs20 total}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx3744
      \intbl {\f0 {\f0\fs20 20,278.310}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx5616
      \intbl {\f0 {\f0\fs20 20,409.250}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx7488
      \intbl {\f0 {\f0\fs20 20,083.130}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx9360
      \intbl {\f0 {\f0\fs20 20,230.690}}\cell
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx1872
      \intbl {\f0 {\f0\fs20 std dev}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx3744
      \intbl {\f0 {\f0\fs20 22.149}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx5616
      \intbl {\f0 {\f0\fs20 18.705}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx7488
      \intbl {\f0 {\f0\fs20 18.346}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx9360
      \intbl {\f0 {\f0\fs20 19.820}}\cell
      
      \row
      
      }

# Formatting can be performed on summary cells in certain columns and rows

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
          <tr><th id="summary_stub_W02_1" scope="row" class="gt_row gt_left gt_stub gt_summary_row gt_first_summary_row thick">average</th>
      <td headers="W02 summary_stub_W02_1 open" class="gt_row gt_right gt_summary_row gt_first_summary_row thick"><2,035.24></td>
      <td headers="W02 summary_stub_W02_1 high" class="gt_row gt_right gt_summary_row gt_first_summary_row thick"><2,048.56></td>
      <td headers="W02 summary_stub_W02_1 low" class="gt_row gt_right gt_summary_row gt_first_summary_row thick">2016.85398</td>
      <td headers="W02 summary_stub_W02_1 close" class="gt_row gt_right gt_summary_row gt_first_summary_row thick">2031.2080</td></tr>
          <tr><th id="summary_stub_W02_2" scope="row" class="gt_row gt_left gt_stub gt_summary_row">total</th>
      <td headers="W02 summary_stub_W02_2 open" class="gt_row gt_right gt_summary_row"><10,176.20></td>
      <td headers="W02 summary_stub_W02_2 high" class="gt_row gt_right gt_summary_row"><10,242.81></td>
      <td headers="W02 summary_stub_W02_2 low" class="gt_row gt_right gt_summary_row">10084.26990</td>
      <td headers="W02 summary_stub_W02_2 close" class="gt_row gt_right gt_summary_row">10156.0400</td></tr>
          <tr><th id="summary_stub_W02_3" scope="row" class="gt_row gt_left gt_stub gt_summary_row gt_last_summary_row">std dev</th>
      <td headers="W02 summary_stub_W02_3 open" class="gt_row gt_right gt_summary_row gt_last_summary_row"><23.66></td>
      <td headers="W02 summary_stub_W02_3 high" class="gt_row gt_right gt_summary_row gt_last_summary_row"><17.48></td>
      <td headers="W02 summary_stub_W02_3 low" class="gt_row gt_right gt_summary_row gt_last_summary_row">18.53720</td>
      <td headers="W02 summary_stub_W02_3 close" class="gt_row gt_right gt_summary_row gt_last_summary_row">22.9171</td></tr>
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
      <td headers="W03 stub_1_10 low" class="gt_row gt_right">1988.12</td>
      <td headers="W03 stub_1_10 close" class="gt_row gt_right">2019.42</td></tr>
          <tr><th id="summary_stub_W03_1" scope="row" class="gt_row gt_left gt_stub gt_summary_row gt_first_summary_row thick">average</th>
      <td headers="W03 summary_stub_W03_1 open" class="gt_row gt_right gt_summary_row gt_first_summary_row thick"><2,020.42></td>
      <td headers="W03 summary_stub_W03_1 high" class="gt_row gt_right gt_summary_row gt_first_summary_row thick"><2,033.29></td>
      <td headers="W03 summary_stub_W03_1 low" class="gt_row gt_right gt_summary_row gt_first_summary_row thick">1999.77198</td>
      <td headers="W03 summary_stub_W03_1 close" class="gt_row gt_right gt_summary_row gt_first_summary_row thick">2014.9300</td></tr>
          <tr><th id="summary_stub_W03_2" scope="row" class="gt_row gt_left gt_stub gt_summary_row">total</th>
      <td headers="W03 summary_stub_W03_2 open" class="gt_row gt_right gt_summary_row"><10,102.11></td>
      <td headers="W03 summary_stub_W03_2 high" class="gt_row gt_right gt_summary_row"><10,166.44></td>
      <td headers="W03 summary_stub_W03_2 low" class="gt_row gt_right gt_summary_row">9998.85990</td>
      <td headers="W03 summary_stub_W03_2 close" class="gt_row gt_right gt_summary_row">10074.6500</td></tr>
          <tr><th id="summary_stub_W03_3" scope="row" class="gt_row gt_left gt_stub gt_summary_row gt_last_summary_row">std dev</th>
      <td headers="W03 summary_stub_W03_3 open" class="gt_row gt_right gt_summary_row gt_last_summary_row"><20.17></td>
      <td headers="W03 summary_stub_W03_3 high" class="gt_row gt_right gt_summary_row gt_last_summary_row"><18.33></td>
      <td headers="W03 summary_stub_W03_3 low" class="gt_row gt_right gt_summary_row gt_last_summary_row">15.20847</td>
      <td headers="W03 summary_stub_W03_3 close" class="gt_row gt_right gt_summary_row gt_last_summary_row">13.8957</td></tr>
        </tbody>
        
      </table>

---

    Code
      as.character(as_latex(gt_tbl))
    Output
      [1] "\\begingroup\n\\fontsize{12.0pt}{14.0pt}\\selectfont\n\\begin{longtable}{l|rrrr}\n\\toprule\n & open & high & low & close \\\\ \n\\midrule\\addlinespace[2.5pt]\n\\multicolumn{5}{l}{W02} \\\\[2.5pt] \n\\midrule\\addlinespace[2.5pt]\n16440 & 2054.44 & 2054.44 & 2017.34 & 2020.58 \\\\ \n16441 & 2022.15 & 2030.25 & 1992.44 & 2002.61 \\\\ \n16442 & 2005.55 & 2029.61 & 2005.55 & 2025.90 \\\\ \n16443 & 2030.61 & 2064.08 & 2030.61 & 2062.14 \\\\ \n16444 & 2063.45 & 2064.43 & 2038.33 & 2044.81 \\\\ \n\\midrule \naverage & <2,035.24> & <2,048.56> & 2016.85398 & 2031.2080 \\\\ \ntotal & <10,176.20> & <10,242.81> & 10084.26990 & 10156.0400 \\\\ \nstd dev & <23.66> & <17.48> & 18.53720 & 22.9171 \\\\ \n\\midrule\\addlinespace[2.5pt]\n\\multicolumn{5}{l}{W03} \\\\[2.5pt] \n\\midrule\\addlinespace[2.5pt]\n16447 & 2046.13 & 2049.30 & 2022.58 & 2028.26 \\\\ \n16448 & 2031.58 & 2056.93 & 2008.25 & 2023.03 \\\\ \n16449 & 2018.40 & 2018.40 & 1988.44 & 2011.27 \\\\ \n16450 & 2013.75 & 2021.35 & 1991.47 & 1992.67 \\\\ \n16451 & 1992.25 & 2020.46 & 1988.12 & 2019.42 \\\\ \n\\midrule \naverage & <2,020.42> & <2,033.29> & 1999.77198 & 2014.9300 \\\\ \ntotal & <10,102.11> & <10,166.44> & 9998.85990 & 10074.6500 \\\\ \nstd dev & <20.17> & <18.33> & 15.20847 & 13.8957 \\\\ \n\\bottomrule\n\\end{longtable}\n\\endgroup\n"

---

    Code
      as_rtf(gt_tbl)
    Output
      {\rtf\ansi\ansicpg1252{\fonttbl{\f0\froman\fcharset0\fprq0 Courier New;}{\f1\froman\fcharset0\fprq0 Times;}}{\colortbl;\red211\green211\blue211;}
      
      \paperw12240\paperh15840\widowctrl\ftnbj\fet0\sectd\linex0
      \lndscpsxn
      \margl1440\margr1440\margt1440\margb1440
      \headery720\footery720\fs20
      
      \trowd\trrh0\trhdr
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85\clbrdrb\brdrs\brdrw20\brdrcf1 \cellx1872
      \intbl {\f0 {\f0\fs20 }}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85\clbrdrb\brdrs\brdrw20\brdrcf1 \cellx3744
      \intbl {\f0 {\f0\fs20 open}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85\clbrdrb\brdrs\brdrw20\brdrcf1 \cellx5616
      \intbl {\f0 {\f0\fs20 high}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85\clbrdrb\brdrs\brdrw20\brdrcf1 \cellx7488
      \intbl {\f0 {\f0\fs20 low}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85\clbrdrb\brdrs\brdrw20\brdrcf1 \cellx9360
      \intbl {\f0 {\f0\fs20 close}}\cell
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\ql\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx9360
      \intbl {\f0\fs20 W02}\cell
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx1872
      \intbl {\f0 {\f0\fs20 16440}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx3744
      \intbl {\f0 {\f0\fs20 2054.44}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx5616
      \intbl {\f0 {\f0\fs20 2054.44}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx7488
      \intbl {\f0 {\f0\fs20 2017.34}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx9360
      \intbl {\f0 {\f0\fs20 2020.58}}\cell
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx1872
      \intbl {\f0 {\f0\fs20 16441}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx3744
      \intbl {\f0 {\f0\fs20 2022.15}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx5616
      \intbl {\f0 {\f0\fs20 2030.25}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx7488
      \intbl {\f0 {\f0\fs20 1992.44}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx9360
      \intbl {\f0 {\f0\fs20 2002.61}}\cell
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx1872
      \intbl {\f0 {\f0\fs20 16442}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx3744
      \intbl {\f0 {\f0\fs20 2005.55}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx5616
      \intbl {\f0 {\f0\fs20 2029.61}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx7488
      \intbl {\f0 {\f0\fs20 2005.55}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx9360
      \intbl {\f0 {\f0\fs20 2025.90}}\cell
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx1872
      \intbl {\f0 {\f0\fs20 16443}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx3744
      \intbl {\f0 {\f0\fs20 2030.61}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx5616
      \intbl {\f0 {\f0\fs20 2064.08}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx7488
      \intbl {\f0 {\f0\fs20 2030.61}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx9360
      \intbl {\f0 {\f0\fs20 2062.14}}\cell
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx1872
      \intbl {\f0 {\f0\fs20 16444}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx3744
      \intbl {\f0 {\f0\fs20 2063.45}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx5616
      \intbl {\f0 {\f0\fs20 2064.43}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx7488
      \intbl {\f0 {\f0\fs20 2038.33}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx9360
      \intbl {\f0 {\f0\fs20 2044.81}}\cell
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx1872
      \intbl {\f0 {\f0\fs20 average}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx3744
      \intbl {\f0 {\f0\fs20 <2,035.24>}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx5616
      \intbl {\f0 {\f0\fs20 <2,048.56>}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx7488
      \intbl {\f0 {\f0\fs20 2016.85398}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx9360
      \intbl {\f0 {\f0\fs20 2031.2080}}\cell
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx1872
      \intbl {\f0 {\f0\fs20 total}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx3744
      \intbl {\f0 {\f0\fs20 <10,176.20>}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx5616
      \intbl {\f0 {\f0\fs20 <10,242.81>}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx7488
      \intbl {\f0 {\f0\fs20 10084.26990}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx9360
      \intbl {\f0 {\f0\fs20 10156.0400}}\cell
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx1872
      \intbl {\f0 {\f0\fs20 std dev}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx3744
      \intbl {\f0 {\f0\fs20 <23.66>}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx5616
      \intbl {\f0 {\f0\fs20 <17.48>}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx7488
      \intbl {\f0 {\f0\fs20 18.53720}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx9360
      \intbl {\f0 {\f0\fs20 22.9171}}\cell
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\ql\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx9360
      \intbl {\f0\fs20 W03}\cell
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx1872
      \intbl {\f0 {\f0\fs20 16447}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx3744
      \intbl {\f0 {\f0\fs20 2046.13}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx5616
      \intbl {\f0 {\f0\fs20 2049.30}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx7488
      \intbl {\f0 {\f0\fs20 2022.58}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx9360
      \intbl {\f0 {\f0\fs20 2028.26}}\cell
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx1872
      \intbl {\f0 {\f0\fs20 16448}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx3744
      \intbl {\f0 {\f0\fs20 2031.58}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx5616
      \intbl {\f0 {\f0\fs20 2056.93}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx7488
      \intbl {\f0 {\f0\fs20 2008.25}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx9360
      \intbl {\f0 {\f0\fs20 2023.03}}\cell
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx1872
      \intbl {\f0 {\f0\fs20 16449}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx3744
      \intbl {\f0 {\f0\fs20 2018.40}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx5616
      \intbl {\f0 {\f0\fs20 2018.40}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx7488
      \intbl {\f0 {\f0\fs20 1988.44}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx9360
      \intbl {\f0 {\f0\fs20 2011.27}}\cell
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx1872
      \intbl {\f0 {\f0\fs20 16450}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx3744
      \intbl {\f0 {\f0\fs20 2013.75}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx5616
      \intbl {\f0 {\f0\fs20 2021.35}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx7488
      \intbl {\f0 {\f0\fs20 1991.47}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx9360
      \intbl {\f0 {\f0\fs20 1992.67}}\cell
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx1872
      \intbl {\f0 {\f0\fs20 16451}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx3744
      \intbl {\f0 {\f0\fs20 1992.25}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx5616
      \intbl {\f0 {\f0\fs20 2020.46}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx7488
      \intbl {\f0 {\f0\fs20 1988.12}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx9360
      \intbl {\f0 {\f0\fs20 2019.42}}\cell
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx1872
      \intbl {\f0 {\f0\fs20 average}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx3744
      \intbl {\f0 {\f0\fs20 <2,020.42>}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx5616
      \intbl {\f0 {\f0\fs20 <2,033.29>}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx7488
      \intbl {\f0 {\f0\fs20 1999.77198}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx9360
      \intbl {\f0 {\f0\fs20 2014.9300}}\cell
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx1872
      \intbl {\f0 {\f0\fs20 total}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx3744
      \intbl {\f0 {\f0\fs20 <10,102.11>}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx5616
      \intbl {\f0 {\f0\fs20 <10,166.44>}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx7488
      \intbl {\f0 {\f0\fs20 9998.85990}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx9360
      \intbl {\f0 {\f0\fs20 10074.6500}}\cell
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx1872
      \intbl {\f0 {\f0\fs20 std dev}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx3744
      \intbl {\f0 {\f0\fs20 <20.17>}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx5616
      \intbl {\f0 {\f0\fs20 <18.33>}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx7488
      \intbl {\f0 {\f0\fs20 15.20847}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx9360
      \intbl {\f0 {\f0\fs20 13.8957}}\cell
      
      \row
      
      }

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
          <tr><th id="summary_stub_W02_1" scope="row" class="gt_row gt_left gt_stub gt_summary_row gt_first_summary_row thick">average</th>
      <td headers="W02 summary_stub_W02_1 open" class="gt_row gt_right gt_summary_row gt_first_summary_row thick"><2,035.24></td>
      <td headers="W02 summary_stub_W02_1 high" class="gt_row gt_right gt_summary_row gt_first_summary_row thick"><2,048.56></td>
      <td headers="W02 summary_stub_W02_1 low" class="gt_row gt_right gt_summary_row gt_first_summary_row thick">[2,016.85]</td>
      <td headers="W02 summary_stub_W02_1 close" class="gt_row gt_right gt_summary_row gt_first_summary_row thick">[2,031.21]</td></tr>
          <tr><th id="summary_stub_W02_2" scope="row" class="gt_row gt_left gt_stub gt_summary_row">total</th>
      <td headers="W02 summary_stub_W02_2 open" class="gt_row gt_right gt_summary_row"><10,176.20></td>
      <td headers="W02 summary_stub_W02_2 high" class="gt_row gt_right gt_summary_row"><10,242.81></td>
      <td headers="W02 summary_stub_W02_2 low" class="gt_row gt_right gt_summary_row">[10,084.27]</td>
      <td headers="W02 summary_stub_W02_2 close" class="gt_row gt_right gt_summary_row">[10,156.04]</td></tr>
          <tr><th id="summary_stub_W02_3" scope="row" class="gt_row gt_left gt_stub gt_summary_row gt_last_summary_row">std dev</th>
      <td headers="W02 summary_stub_W02_3 open" class="gt_row gt_right gt_summary_row gt_last_summary_row"><23.66></td>
      <td headers="W02 summary_stub_W02_3 high" class="gt_row gt_right gt_summary_row gt_last_summary_row"><17.48></td>
      <td headers="W02 summary_stub_W02_3 low" class="gt_row gt_right gt_summary_row gt_last_summary_row">[18.54]</td>
      <td headers="W02 summary_stub_W02_3 close" class="gt_row gt_right gt_summary_row gt_last_summary_row">[22.92]</td></tr>
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
      <td headers="W03 stub_1_10 low" class="gt_row gt_right">1988.12</td>
      <td headers="W03 stub_1_10 close" class="gt_row gt_right">2019.42</td></tr>
          <tr><th id="summary_stub_W03_1" scope="row" class="gt_row gt_left gt_stub gt_summary_row gt_first_summary_row thick">average</th>
      <td headers="W03 summary_stub_W03_1 open" class="gt_row gt_right gt_summary_row gt_first_summary_row thick"><2,020.42></td>
      <td headers="W03 summary_stub_W03_1 high" class="gt_row gt_right gt_summary_row gt_first_summary_row thick"><2,033.29></td>
      <td headers="W03 summary_stub_W03_1 low" class="gt_row gt_right gt_summary_row gt_first_summary_row thick">[1,999.77]</td>
      <td headers="W03 summary_stub_W03_1 close" class="gt_row gt_right gt_summary_row gt_first_summary_row thick">[2,014.93]</td></tr>
          <tr><th id="summary_stub_W03_2" scope="row" class="gt_row gt_left gt_stub gt_summary_row">total</th>
      <td headers="W03 summary_stub_W03_2 open" class="gt_row gt_right gt_summary_row"><10,102.11></td>
      <td headers="W03 summary_stub_W03_2 high" class="gt_row gt_right gt_summary_row"><10,166.44></td>
      <td headers="W03 summary_stub_W03_2 low" class="gt_row gt_right gt_summary_row">[9,998.86]</td>
      <td headers="W03 summary_stub_W03_2 close" class="gt_row gt_right gt_summary_row">[10,074.65]</td></tr>
          <tr><th id="summary_stub_W03_3" scope="row" class="gt_row gt_left gt_stub gt_summary_row gt_last_summary_row">std dev</th>
      <td headers="W03 summary_stub_W03_3 open" class="gt_row gt_right gt_summary_row gt_last_summary_row"><20.17></td>
      <td headers="W03 summary_stub_W03_3 high" class="gt_row gt_right gt_summary_row gt_last_summary_row"><18.33></td>
      <td headers="W03 summary_stub_W03_3 low" class="gt_row gt_right gt_summary_row gt_last_summary_row">[15.21]</td>
      <td headers="W03 summary_stub_W03_3 close" class="gt_row gt_right gt_summary_row gt_last_summary_row">[13.90]</td></tr>
        </tbody>
        
      </table>

---

    Code
      as.character(as_latex(gt_tbl))
    Output
      [1] "\\begingroup\n\\fontsize{12.0pt}{14.0pt}\\selectfont\n\\begin{longtable}{l|rrrr}\n\\toprule\n & open & high & low & close \\\\ \n\\midrule\\addlinespace[2.5pt]\n\\multicolumn{5}{l}{W02} \\\\[2.5pt] \n\\midrule\\addlinespace[2.5pt]\n16440 & 2054.44 & 2054.44 & 2017.34 & 2020.58 \\\\ \n16441 & 2022.15 & 2030.25 & 1992.44 & 2002.61 \\\\ \n16442 & 2005.55 & 2029.61 & 2005.55 & 2025.90 \\\\ \n16443 & 2030.61 & 2064.08 & 2030.61 & 2062.14 \\\\ \n16444 & 2063.45 & 2064.43 & 2038.33 & 2044.81 \\\\ \n\\midrule \naverage & <2,035.24> & <2,048.56> & [2,016.85] & [2,031.21] \\\\ \ntotal & <10,176.20> & <10,242.81> & [10,084.27] & [10,156.04] \\\\ \nstd dev & <23.66> & <17.48> & [18.54] & [22.92] \\\\ \n\\midrule\\addlinespace[2.5pt]\n\\multicolumn{5}{l}{W03} \\\\[2.5pt] \n\\midrule\\addlinespace[2.5pt]\n16447 & 2046.13 & 2049.30 & 2022.58 & 2028.26 \\\\ \n16448 & 2031.58 & 2056.93 & 2008.25 & 2023.03 \\\\ \n16449 & 2018.40 & 2018.40 & 1988.44 & 2011.27 \\\\ \n16450 & 2013.75 & 2021.35 & 1991.47 & 1992.67 \\\\ \n16451 & 1992.25 & 2020.46 & 1988.12 & 2019.42 \\\\ \n\\midrule \naverage & <2,020.42> & <2,033.29> & [1,999.77] & [2,014.93] \\\\ \ntotal & <10,102.11> & <10,166.44> & [9,998.86] & [10,074.65] \\\\ \nstd dev & <20.17> & <18.33> & [15.21] & [13.90] \\\\ \n\\bottomrule\n\\end{longtable}\n\\endgroup\n"

---

    Code
      as_rtf(gt_tbl)
    Output
      {\rtf\ansi\ansicpg1252{\fonttbl{\f0\froman\fcharset0\fprq0 Courier New;}{\f1\froman\fcharset0\fprq0 Times;}}{\colortbl;\red211\green211\blue211;}
      
      \paperw12240\paperh15840\widowctrl\ftnbj\fet0\sectd\linex0
      \lndscpsxn
      \margl1440\margr1440\margt1440\margb1440
      \headery720\footery720\fs20
      
      \trowd\trrh0\trhdr
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85\clbrdrb\brdrs\brdrw20\brdrcf1 \cellx1872
      \intbl {\f0 {\f0\fs20 }}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85\clbrdrb\brdrs\brdrw20\brdrcf1 \cellx3744
      \intbl {\f0 {\f0\fs20 open}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85\clbrdrb\brdrs\brdrw20\brdrcf1 \cellx5616
      \intbl {\f0 {\f0\fs20 high}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85\clbrdrb\brdrs\brdrw20\brdrcf1 \cellx7488
      \intbl {\f0 {\f0\fs20 low}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85\clbrdrb\brdrs\brdrw20\brdrcf1 \cellx9360
      \intbl {\f0 {\f0\fs20 close}}\cell
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\ql\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx9360
      \intbl {\f0\fs20 W02}\cell
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx1872
      \intbl {\f0 {\f0\fs20 16440}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx3744
      \intbl {\f0 {\f0\fs20 2054.44}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx5616
      \intbl {\f0 {\f0\fs20 2054.44}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx7488
      \intbl {\f0 {\f0\fs20 2017.34}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx9360
      \intbl {\f0 {\f0\fs20 2020.58}}\cell
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx1872
      \intbl {\f0 {\f0\fs20 16441}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx3744
      \intbl {\f0 {\f0\fs20 2022.15}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx5616
      \intbl {\f0 {\f0\fs20 2030.25}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx7488
      \intbl {\f0 {\f0\fs20 1992.44}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx9360
      \intbl {\f0 {\f0\fs20 2002.61}}\cell
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx1872
      \intbl {\f0 {\f0\fs20 16442}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx3744
      \intbl {\f0 {\f0\fs20 2005.55}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx5616
      \intbl {\f0 {\f0\fs20 2029.61}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx7488
      \intbl {\f0 {\f0\fs20 2005.55}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx9360
      \intbl {\f0 {\f0\fs20 2025.90}}\cell
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx1872
      \intbl {\f0 {\f0\fs20 16443}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx3744
      \intbl {\f0 {\f0\fs20 2030.61}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx5616
      \intbl {\f0 {\f0\fs20 2064.08}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx7488
      \intbl {\f0 {\f0\fs20 2030.61}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx9360
      \intbl {\f0 {\f0\fs20 2062.14}}\cell
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx1872
      \intbl {\f0 {\f0\fs20 16444}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx3744
      \intbl {\f0 {\f0\fs20 2063.45}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx5616
      \intbl {\f0 {\f0\fs20 2064.43}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx7488
      \intbl {\f0 {\f0\fs20 2038.33}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx9360
      \intbl {\f0 {\f0\fs20 2044.81}}\cell
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx1872
      \intbl {\f0 {\f0\fs20 average}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx3744
      \intbl {\f0 {\f0\fs20 <2,035.24>}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx5616
      \intbl {\f0 {\f0\fs20 <2,048.56>}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx7488
      \intbl {\f0 {\f0\fs20 [2,016.85]}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx9360
      \intbl {\f0 {\f0\fs20 [2,031.21]}}\cell
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx1872
      \intbl {\f0 {\f0\fs20 total}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx3744
      \intbl {\f0 {\f0\fs20 <10,176.20>}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx5616
      \intbl {\f0 {\f0\fs20 <10,242.81>}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx7488
      \intbl {\f0 {\f0\fs20 [10,084.27]}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx9360
      \intbl {\f0 {\f0\fs20 [10,156.04]}}\cell
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx1872
      \intbl {\f0 {\f0\fs20 std dev}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx3744
      \intbl {\f0 {\f0\fs20 <23.66>}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx5616
      \intbl {\f0 {\f0\fs20 <17.48>}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx7488
      \intbl {\f0 {\f0\fs20 [18.54]}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx9360
      \intbl {\f0 {\f0\fs20 [22.92]}}\cell
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\ql\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx9360
      \intbl {\f0\fs20 W03}\cell
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx1872
      \intbl {\f0 {\f0\fs20 16447}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx3744
      \intbl {\f0 {\f0\fs20 2046.13}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx5616
      \intbl {\f0 {\f0\fs20 2049.30}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx7488
      \intbl {\f0 {\f0\fs20 2022.58}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx9360
      \intbl {\f0 {\f0\fs20 2028.26}}\cell
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx1872
      \intbl {\f0 {\f0\fs20 16448}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx3744
      \intbl {\f0 {\f0\fs20 2031.58}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx5616
      \intbl {\f0 {\f0\fs20 2056.93}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx7488
      \intbl {\f0 {\f0\fs20 2008.25}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx9360
      \intbl {\f0 {\f0\fs20 2023.03}}\cell
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx1872
      \intbl {\f0 {\f0\fs20 16449}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx3744
      \intbl {\f0 {\f0\fs20 2018.40}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx5616
      \intbl {\f0 {\f0\fs20 2018.40}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx7488
      \intbl {\f0 {\f0\fs20 1988.44}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx9360
      \intbl {\f0 {\f0\fs20 2011.27}}\cell
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx1872
      \intbl {\f0 {\f0\fs20 16450}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx3744
      \intbl {\f0 {\f0\fs20 2013.75}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx5616
      \intbl {\f0 {\f0\fs20 2021.35}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx7488
      \intbl {\f0 {\f0\fs20 1991.47}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx9360
      \intbl {\f0 {\f0\fs20 1992.67}}\cell
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx1872
      \intbl {\f0 {\f0\fs20 16451}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx3744
      \intbl {\f0 {\f0\fs20 1992.25}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx5616
      \intbl {\f0 {\f0\fs20 2020.46}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx7488
      \intbl {\f0 {\f0\fs20 1988.12}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx9360
      \intbl {\f0 {\f0\fs20 2019.42}}\cell
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx1872
      \intbl {\f0 {\f0\fs20 average}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx3744
      \intbl {\f0 {\f0\fs20 <2,020.42>}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx5616
      \intbl {\f0 {\f0\fs20 <2,033.29>}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx7488
      \intbl {\f0 {\f0\fs20 [1,999.77]}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx9360
      \intbl {\f0 {\f0\fs20 [2,014.93]}}\cell
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx1872
      \intbl {\f0 {\f0\fs20 total}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx3744
      \intbl {\f0 {\f0\fs20 <10,102.11>}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx5616
      \intbl {\f0 {\f0\fs20 <10,166.44>}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx7488
      \intbl {\f0 {\f0\fs20 [9,998.86]}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx9360
      \intbl {\f0 {\f0\fs20 [10,074.65]}}\cell
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx1872
      \intbl {\f0 {\f0\fs20 std dev}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx3744
      \intbl {\f0 {\f0\fs20 <20.17>}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx5616
      \intbl {\f0 {\f0\fs20 <18.33>}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx7488
      \intbl {\f0 {\f0\fs20 [15.21]}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx9360
      \intbl {\f0 {\f0\fs20 [13.90]}}\cell
      
      \row
      
      }

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
          <tr><th id="summary_stub_W02_1" scope="row" class="gt_row gt_left gt_stub gt_summary_row gt_first_summary_row thick">average</th>
      <td headers="W02 summary_stub_W02_1 open" class="gt_row gt_right gt_summary_row gt_first_summary_row thick"><2,035.24></td>
      <td headers="W02 summary_stub_W02_1 high" class="gt_row gt_right gt_summary_row gt_first_summary_row thick"><2,048.56></td>
      <td headers="W02 summary_stub_W02_1 low" class="gt_row gt_right gt_summary_row gt_first_summary_row thick">2016.85398</td>
      <td headers="W02 summary_stub_W02_1 close" class="gt_row gt_right gt_summary_row gt_first_summary_row thick">2031.2080</td></tr>
          <tr><th id="summary_stub_W02_2" scope="row" class="gt_row gt_left gt_stub gt_summary_row">total</th>
      <td headers="W02 summary_stub_W02_2 open" class="gt_row gt_right gt_summary_row">10176.19990</td>
      <td headers="W02 summary_stub_W02_2 high" class="gt_row gt_right gt_summary_row">10242.80990</td>
      <td headers="W02 summary_stub_W02_2 low" class="gt_row gt_right gt_summary_row">[10,084.27]</td>
      <td headers="W02 summary_stub_W02_2 close" class="gt_row gt_right gt_summary_row">[10,156.04]</td></tr>
          <tr><th id="summary_stub_W02_3" scope="row" class="gt_row gt_left gt_stub gt_summary_row gt_last_summary_row">std dev</th>
      <td headers="W02 summary_stub_W02_3 open" class="gt_row gt_right gt_summary_row gt_last_summary_row">23.65756</td>
      <td headers="W02 summary_stub_W02_3 high" class="gt_row gt_right gt_summary_row gt_last_summary_row">17.47612</td>
      <td headers="W02 summary_stub_W02_3 low" class="gt_row gt_right gt_summary_row gt_last_summary_row">18.53720</td>
      <td headers="W02 summary_stub_W02_3 close" class="gt_row gt_right gt_summary_row gt_last_summary_row">22.9171</td></tr>
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
      <td headers="W03 stub_1_10 low" class="gt_row gt_right">1988.12</td>
      <td headers="W03 stub_1_10 close" class="gt_row gt_right">2019.42</td></tr>
          <tr><th id="summary_stub_W03_1" scope="row" class="gt_row gt_left gt_stub gt_summary_row gt_first_summary_row thick">average</th>
      <td headers="W03 summary_stub_W03_1 open" class="gt_row gt_right gt_summary_row gt_first_summary_row thick"><2,020.42></td>
      <td headers="W03 summary_stub_W03_1 high" class="gt_row gt_right gt_summary_row gt_first_summary_row thick"><2,033.29></td>
      <td headers="W03 summary_stub_W03_1 low" class="gt_row gt_right gt_summary_row gt_first_summary_row thick">1999.77198</td>
      <td headers="W03 summary_stub_W03_1 close" class="gt_row gt_right gt_summary_row gt_first_summary_row thick">2014.9300</td></tr>
          <tr><th id="summary_stub_W03_2" scope="row" class="gt_row gt_left gt_stub gt_summary_row">total</th>
      <td headers="W03 summary_stub_W03_2 open" class="gt_row gt_right gt_summary_row">10102.11000</td>
      <td headers="W03 summary_stub_W03_2 high" class="gt_row gt_right gt_summary_row">10166.43990</td>
      <td headers="W03 summary_stub_W03_2 low" class="gt_row gt_right gt_summary_row">[9,998.86]</td>
      <td headers="W03 summary_stub_W03_2 close" class="gt_row gt_right gt_summary_row">[10,074.65]</td></tr>
          <tr><th id="summary_stub_W03_3" scope="row" class="gt_row gt_left gt_stub gt_summary_row gt_last_summary_row">std dev</th>
      <td headers="W03 summary_stub_W03_3 open" class="gt_row gt_right gt_summary_row gt_last_summary_row">20.17218</td>
      <td headers="W03 summary_stub_W03_3 high" class="gt_row gt_right gt_summary_row gt_last_summary_row">18.33064</td>
      <td headers="W03 summary_stub_W03_3 low" class="gt_row gt_right gt_summary_row gt_last_summary_row">15.20847</td>
      <td headers="W03 summary_stub_W03_3 close" class="gt_row gt_right gt_summary_row gt_last_summary_row">13.8957</td></tr>
        </tbody>
        
      </table>

---

    Code
      as.character(as_latex(gt_tbl))
    Output
      [1] "\\begingroup\n\\fontsize{12.0pt}{14.0pt}\\selectfont\n\\begin{longtable}{l|rrrr}\n\\toprule\n & open & high & low & close \\\\ \n\\midrule\\addlinespace[2.5pt]\n\\multicolumn{5}{l}{W02} \\\\[2.5pt] \n\\midrule\\addlinespace[2.5pt]\n16440 & 2054.44 & 2054.44 & 2017.34 & 2020.58 \\\\ \n16441 & 2022.15 & 2030.25 & 1992.44 & 2002.61 \\\\ \n16442 & 2005.55 & 2029.61 & 2005.55 & 2025.90 \\\\ \n16443 & 2030.61 & 2064.08 & 2030.61 & 2062.14 \\\\ \n16444 & 2063.45 & 2064.43 & 2038.33 & 2044.81 \\\\ \n\\midrule \naverage & <2,035.24> & <2,048.56> & 2016.85398 & 2031.2080 \\\\ \ntotal & 10176.19990 & 10242.80990 & [10,084.27] & [10,156.04] \\\\ \nstd dev & 23.65756 & 17.47612 & 18.53720 & 22.9171 \\\\ \n\\midrule\\addlinespace[2.5pt]\n\\multicolumn{5}{l}{W03} \\\\[2.5pt] \n\\midrule\\addlinespace[2.5pt]\n16447 & 2046.13 & 2049.30 & 2022.58 & 2028.26 \\\\ \n16448 & 2031.58 & 2056.93 & 2008.25 & 2023.03 \\\\ \n16449 & 2018.40 & 2018.40 & 1988.44 & 2011.27 \\\\ \n16450 & 2013.75 & 2021.35 & 1991.47 & 1992.67 \\\\ \n16451 & 1992.25 & 2020.46 & 1988.12 & 2019.42 \\\\ \n\\midrule \naverage & <2,020.42> & <2,033.29> & 1999.77198 & 2014.9300 \\\\ \ntotal & 10102.11000 & 10166.43990 & [9,998.86] & [10,074.65] \\\\ \nstd dev & 20.17218 & 18.33064 & 15.20847 & 13.8957 \\\\ \n\\bottomrule\n\\end{longtable}\n\\endgroup\n"

---

    Code
      as_rtf(gt_tbl)
    Output
      {\rtf\ansi\ansicpg1252{\fonttbl{\f0\froman\fcharset0\fprq0 Courier New;}{\f1\froman\fcharset0\fprq0 Times;}}{\colortbl;\red211\green211\blue211;}
      
      \paperw12240\paperh15840\widowctrl\ftnbj\fet0\sectd\linex0
      \lndscpsxn
      \margl1440\margr1440\margt1440\margb1440
      \headery720\footery720\fs20
      
      \trowd\trrh0\trhdr
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85\clbrdrb\brdrs\brdrw20\brdrcf1 \cellx1872
      \intbl {\f0 {\f0\fs20 }}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85\clbrdrb\brdrs\brdrw20\brdrcf1 \cellx3744
      \intbl {\f0 {\f0\fs20 open}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85\clbrdrb\brdrs\brdrw20\brdrcf1 \cellx5616
      \intbl {\f0 {\f0\fs20 high}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85\clbrdrb\brdrs\brdrw20\brdrcf1 \cellx7488
      \intbl {\f0 {\f0\fs20 low}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85\clbrdrb\brdrs\brdrw20\brdrcf1 \cellx9360
      \intbl {\f0 {\f0\fs20 close}}\cell
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\ql\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx9360
      \intbl {\f0\fs20 W02}\cell
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx1872
      \intbl {\f0 {\f0\fs20 16440}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx3744
      \intbl {\f0 {\f0\fs20 2054.44}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx5616
      \intbl {\f0 {\f0\fs20 2054.44}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx7488
      \intbl {\f0 {\f0\fs20 2017.34}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx9360
      \intbl {\f0 {\f0\fs20 2020.58}}\cell
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx1872
      \intbl {\f0 {\f0\fs20 16441}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx3744
      \intbl {\f0 {\f0\fs20 2022.15}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx5616
      \intbl {\f0 {\f0\fs20 2030.25}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx7488
      \intbl {\f0 {\f0\fs20 1992.44}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx9360
      \intbl {\f0 {\f0\fs20 2002.61}}\cell
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx1872
      \intbl {\f0 {\f0\fs20 16442}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx3744
      \intbl {\f0 {\f0\fs20 2005.55}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx5616
      \intbl {\f0 {\f0\fs20 2029.61}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx7488
      \intbl {\f0 {\f0\fs20 2005.55}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx9360
      \intbl {\f0 {\f0\fs20 2025.90}}\cell
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx1872
      \intbl {\f0 {\f0\fs20 16443}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx3744
      \intbl {\f0 {\f0\fs20 2030.61}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx5616
      \intbl {\f0 {\f0\fs20 2064.08}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx7488
      \intbl {\f0 {\f0\fs20 2030.61}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx9360
      \intbl {\f0 {\f0\fs20 2062.14}}\cell
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx1872
      \intbl {\f0 {\f0\fs20 16444}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx3744
      \intbl {\f0 {\f0\fs20 2063.45}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx5616
      \intbl {\f0 {\f0\fs20 2064.43}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx7488
      \intbl {\f0 {\f0\fs20 2038.33}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx9360
      \intbl {\f0 {\f0\fs20 2044.81}}\cell
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx1872
      \intbl {\f0 {\f0\fs20 average}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx3744
      \intbl {\f0 {\f0\fs20 <2,035.24>}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx5616
      \intbl {\f0 {\f0\fs20 <2,048.56>}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx7488
      \intbl {\f0 {\f0\fs20 2016.85398}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx9360
      \intbl {\f0 {\f0\fs20 2031.2080}}\cell
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx1872
      \intbl {\f0 {\f0\fs20 total}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx3744
      \intbl {\f0 {\f0\fs20 10176.19990}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx5616
      \intbl {\f0 {\f0\fs20 10242.80990}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx7488
      \intbl {\f0 {\f0\fs20 [10,084.27]}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx9360
      \intbl {\f0 {\f0\fs20 [10,156.04]}}\cell
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx1872
      \intbl {\f0 {\f0\fs20 std dev}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx3744
      \intbl {\f0 {\f0\fs20 23.65756}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx5616
      \intbl {\f0 {\f0\fs20 17.47612}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx7488
      \intbl {\f0 {\f0\fs20 18.53720}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx9360
      \intbl {\f0 {\f0\fs20 22.9171}}\cell
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\ql\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx9360
      \intbl {\f0\fs20 W03}\cell
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx1872
      \intbl {\f0 {\f0\fs20 16447}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx3744
      \intbl {\f0 {\f0\fs20 2046.13}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx5616
      \intbl {\f0 {\f0\fs20 2049.30}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx7488
      \intbl {\f0 {\f0\fs20 2022.58}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx9360
      \intbl {\f0 {\f0\fs20 2028.26}}\cell
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx1872
      \intbl {\f0 {\f0\fs20 16448}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx3744
      \intbl {\f0 {\f0\fs20 2031.58}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx5616
      \intbl {\f0 {\f0\fs20 2056.93}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx7488
      \intbl {\f0 {\f0\fs20 2008.25}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx9360
      \intbl {\f0 {\f0\fs20 2023.03}}\cell
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx1872
      \intbl {\f0 {\f0\fs20 16449}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx3744
      \intbl {\f0 {\f0\fs20 2018.40}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx5616
      \intbl {\f0 {\f0\fs20 2018.40}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx7488
      \intbl {\f0 {\f0\fs20 1988.44}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx9360
      \intbl {\f0 {\f0\fs20 2011.27}}\cell
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx1872
      \intbl {\f0 {\f0\fs20 16450}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx3744
      \intbl {\f0 {\f0\fs20 2013.75}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx5616
      \intbl {\f0 {\f0\fs20 2021.35}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx7488
      \intbl {\f0 {\f0\fs20 1991.47}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx9360
      \intbl {\f0 {\f0\fs20 1992.67}}\cell
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx1872
      \intbl {\f0 {\f0\fs20 16451}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx3744
      \intbl {\f0 {\f0\fs20 1992.25}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx5616
      \intbl {\f0 {\f0\fs20 2020.46}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx7488
      \intbl {\f0 {\f0\fs20 1988.12}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx9360
      \intbl {\f0 {\f0\fs20 2019.42}}\cell
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx1872
      \intbl {\f0 {\f0\fs20 average}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx3744
      \intbl {\f0 {\f0\fs20 <2,020.42>}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx5616
      \intbl {\f0 {\f0\fs20 <2,033.29>}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx7488
      \intbl {\f0 {\f0\fs20 1999.77198}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx9360
      \intbl {\f0 {\f0\fs20 2014.9300}}\cell
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx1872
      \intbl {\f0 {\f0\fs20 total}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx3744
      \intbl {\f0 {\f0\fs20 10102.11000}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx5616
      \intbl {\f0 {\f0\fs20 10166.43990}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx7488
      \intbl {\f0 {\f0\fs20 [9,998.86]}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx9360
      \intbl {\f0 {\f0\fs20 [10,074.65]}}\cell
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx1872
      \intbl {\f0 {\f0\fs20 std dev}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx3744
      \intbl {\f0 {\f0\fs20 20.17218}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx5616
      \intbl {\f0 {\f0\fs20 18.33064}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx7488
      \intbl {\f0 {\f0\fs20 15.20847}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx9360
      \intbl {\f0 {\f0\fs20 13.8957}}\cell
      
      \row
      
      }

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
          <tr><th id="summary_stub_W02_1" scope="row" class="gt_row gt_left gt_stub gt_summary_row gt_first_summary_row thick">average</th>
      <td headers="W02 summary_stub_W02_1 open" class="gt_row gt_right gt_summary_row gt_first_summary_row thick">2035.23998</td>
      <td headers="W02 summary_stub_W02_1 high" class="gt_row gt_right gt_summary_row gt_first_summary_row thick">2048.56198</td>
      <td headers="W02 summary_stub_W02_1 low" class="gt_row gt_right gt_summary_row gt_first_summary_row thick">2016.85398</td>
      <td headers="W02 summary_stub_W02_1 close" class="gt_row gt_right gt_summary_row gt_first_summary_row thick">2031.2080</td></tr>
          <tr><th id="summary_stub_W02_2" scope="row" class="gt_row gt_left gt_stub gt_summary_row">total</th>
      <td headers="W02 summary_stub_W02_2 open" class="gt_row gt_right gt_summary_row">10176.19990</td>
      <td headers="W02 summary_stub_W02_2 high" class="gt_row gt_right gt_summary_row">10242.80990</td>
      <td headers="W02 summary_stub_W02_2 low" class="gt_row gt_right gt_summary_row">10084.26990</td>
      <td headers="W02 summary_stub_W02_2 close" class="gt_row gt_right gt_summary_row">10156.0400</td></tr>
          <tr><th id="summary_stub_W02_3" scope="row" class="gt_row gt_left gt_stub gt_summary_row gt_last_summary_row">std dev</th>
      <td headers="W02 summary_stub_W02_3 open" class="gt_row gt_right gt_summary_row gt_last_summary_row">23.65756</td>
      <td headers="W02 summary_stub_W02_3 high" class="gt_row gt_right gt_summary_row gt_last_summary_row">17.47612</td>
      <td headers="W02 summary_stub_W02_3 low" class="gt_row gt_right gt_summary_row gt_last_summary_row">18.53720</td>
      <td headers="W02 summary_stub_W02_3 close" class="gt_row gt_right gt_summary_row gt_last_summary_row">22.9171</td></tr>
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
      <td headers="W03 stub_1_10 low" class="gt_row gt_right">1988.12</td>
      <td headers="W03 stub_1_10 close" class="gt_row gt_right">2019.42</td></tr>
          <tr><th id="summary_stub_W03_1" scope="row" class="gt_row gt_left gt_stub gt_summary_row gt_first_summary_row thick">average</th>
      <td headers="W03 summary_stub_W03_1 open" class="gt_row gt_right gt_summary_row gt_first_summary_row thick"><2,020.42></td>
      <td headers="W03 summary_stub_W03_1 high" class="gt_row gt_right gt_summary_row gt_first_summary_row thick">2033.28798</td>
      <td headers="W03 summary_stub_W03_1 low" class="gt_row gt_right gt_summary_row gt_first_summary_row thick">1999.77198</td>
      <td headers="W03 summary_stub_W03_1 close" class="gt_row gt_right gt_summary_row gt_first_summary_row thick">2014.9300</td></tr>
          <tr><th id="summary_stub_W03_2" scope="row" class="gt_row gt_left gt_stub gt_summary_row">total</th>
      <td headers="W03 summary_stub_W03_2 open" class="gt_row gt_right gt_summary_row">10102.11000</td>
      <td headers="W03 summary_stub_W03_2 high" class="gt_row gt_right gt_summary_row">10166.43990</td>
      <td headers="W03 summary_stub_W03_2 low" class="gt_row gt_right gt_summary_row">9998.85990</td>
      <td headers="W03 summary_stub_W03_2 close" class="gt_row gt_right gt_summary_row">10074.6500</td></tr>
          <tr><th id="summary_stub_W03_3" scope="row" class="gt_row gt_left gt_stub gt_summary_row gt_last_summary_row">std dev</th>
      <td headers="W03 summary_stub_W03_3 open" class="gt_row gt_right gt_summary_row gt_last_summary_row">20.17218</td>
      <td headers="W03 summary_stub_W03_3 high" class="gt_row gt_right gt_summary_row gt_last_summary_row">18.33064</td>
      <td headers="W03 summary_stub_W03_3 low" class="gt_row gt_right gt_summary_row gt_last_summary_row">15.20847</td>
      <td headers="W03 summary_stub_W03_3 close" class="gt_row gt_right gt_summary_row gt_last_summary_row">13.8957</td></tr>
        </tbody>
        
      </table>

---

    Code
      as.character(as_latex(gt_tbl))
    Output
      [1] "\\begingroup\n\\fontsize{12.0pt}{14.0pt}\\selectfont\n\\begin{longtable}{l|rrrr}\n\\toprule\n & open & high & low & close \\\\ \n\\midrule\\addlinespace[2.5pt]\n\\multicolumn{5}{l}{W02} \\\\[2.5pt] \n\\midrule\\addlinespace[2.5pt]\n16440 & 2054.44 & 2054.44 & 2017.34 & 2020.58 \\\\ \n16441 & 2022.15 & 2030.25 & 1992.44 & 2002.61 \\\\ \n16442 & 2005.55 & 2029.61 & 2005.55 & 2025.90 \\\\ \n16443 & 2030.61 & 2064.08 & 2030.61 & 2062.14 \\\\ \n16444 & 2063.45 & 2064.43 & 2038.33 & 2044.81 \\\\ \n\\midrule \naverage & 2035.23998 & 2048.56198 & 2016.85398 & 2031.2080 \\\\ \ntotal & 10176.19990 & 10242.80990 & 10084.26990 & 10156.0400 \\\\ \nstd dev & 23.65756 & 17.47612 & 18.53720 & 22.9171 \\\\ \n\\midrule\\addlinespace[2.5pt]\n\\multicolumn{5}{l}{W03} \\\\[2.5pt] \n\\midrule\\addlinespace[2.5pt]\n16447 & 2046.13 & 2049.30 & 2022.58 & 2028.26 \\\\ \n16448 & 2031.58 & 2056.93 & 2008.25 & 2023.03 \\\\ \n16449 & 2018.40 & 2018.40 & 1988.44 & 2011.27 \\\\ \n16450 & 2013.75 & 2021.35 & 1991.47 & 1992.67 \\\\ \n16451 & 1992.25 & 2020.46 & 1988.12 & 2019.42 \\\\ \n\\midrule \naverage & <2,020.42> & 2033.28798 & 1999.77198 & 2014.9300 \\\\ \ntotal & 10102.11000 & 10166.43990 & 9998.85990 & 10074.6500 \\\\ \nstd dev & 20.17218 & 18.33064 & 15.20847 & 13.8957 \\\\ \n\\bottomrule\n\\end{longtable}\n\\endgroup\n"

---

    Code
      as_rtf(gt_tbl)
    Output
      {\rtf\ansi\ansicpg1252{\fonttbl{\f0\froman\fcharset0\fprq0 Courier New;}{\f1\froman\fcharset0\fprq0 Times;}}{\colortbl;\red211\green211\blue211;}
      
      \paperw12240\paperh15840\widowctrl\ftnbj\fet0\sectd\linex0
      \lndscpsxn
      \margl1440\margr1440\margt1440\margb1440
      \headery720\footery720\fs20
      
      \trowd\trrh0\trhdr
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85\clbrdrb\brdrs\brdrw20\brdrcf1 \cellx1872
      \intbl {\f0 {\f0\fs20 }}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85\clbrdrb\brdrs\brdrw20\brdrcf1 \cellx3744
      \intbl {\f0 {\f0\fs20 open}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85\clbrdrb\brdrs\brdrw20\brdrcf1 \cellx5616
      \intbl {\f0 {\f0\fs20 high}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85\clbrdrb\brdrs\brdrw20\brdrcf1 \cellx7488
      \intbl {\f0 {\f0\fs20 low}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85\clbrdrb\brdrs\brdrw20\brdrcf1 \cellx9360
      \intbl {\f0 {\f0\fs20 close}}\cell
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\ql\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx9360
      \intbl {\f0\fs20 W02}\cell
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx1872
      \intbl {\f0 {\f0\fs20 16440}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx3744
      \intbl {\f0 {\f0\fs20 2054.44}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx5616
      \intbl {\f0 {\f0\fs20 2054.44}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx7488
      \intbl {\f0 {\f0\fs20 2017.34}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx9360
      \intbl {\f0 {\f0\fs20 2020.58}}\cell
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx1872
      \intbl {\f0 {\f0\fs20 16441}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx3744
      \intbl {\f0 {\f0\fs20 2022.15}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx5616
      \intbl {\f0 {\f0\fs20 2030.25}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx7488
      \intbl {\f0 {\f0\fs20 1992.44}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx9360
      \intbl {\f0 {\f0\fs20 2002.61}}\cell
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx1872
      \intbl {\f0 {\f0\fs20 16442}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx3744
      \intbl {\f0 {\f0\fs20 2005.55}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx5616
      \intbl {\f0 {\f0\fs20 2029.61}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx7488
      \intbl {\f0 {\f0\fs20 2005.55}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx9360
      \intbl {\f0 {\f0\fs20 2025.90}}\cell
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx1872
      \intbl {\f0 {\f0\fs20 16443}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx3744
      \intbl {\f0 {\f0\fs20 2030.61}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx5616
      \intbl {\f0 {\f0\fs20 2064.08}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx7488
      \intbl {\f0 {\f0\fs20 2030.61}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx9360
      \intbl {\f0 {\f0\fs20 2062.14}}\cell
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx1872
      \intbl {\f0 {\f0\fs20 16444}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx3744
      \intbl {\f0 {\f0\fs20 2063.45}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx5616
      \intbl {\f0 {\f0\fs20 2064.43}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx7488
      \intbl {\f0 {\f0\fs20 2038.33}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx9360
      \intbl {\f0 {\f0\fs20 2044.81}}\cell
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx1872
      \intbl {\f0 {\f0\fs20 average}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx3744
      \intbl {\f0 {\f0\fs20 2035.23998}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx5616
      \intbl {\f0 {\f0\fs20 2048.56198}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx7488
      \intbl {\f0 {\f0\fs20 2016.85398}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx9360
      \intbl {\f0 {\f0\fs20 2031.2080}}\cell
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx1872
      \intbl {\f0 {\f0\fs20 total}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx3744
      \intbl {\f0 {\f0\fs20 10176.19990}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx5616
      \intbl {\f0 {\f0\fs20 10242.80990}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx7488
      \intbl {\f0 {\f0\fs20 10084.26990}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx9360
      \intbl {\f0 {\f0\fs20 10156.0400}}\cell
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx1872
      \intbl {\f0 {\f0\fs20 std dev}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx3744
      \intbl {\f0 {\f0\fs20 23.65756}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx5616
      \intbl {\f0 {\f0\fs20 17.47612}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx7488
      \intbl {\f0 {\f0\fs20 18.53720}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx9360
      \intbl {\f0 {\f0\fs20 22.9171}}\cell
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\ql\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx9360
      \intbl {\f0\fs20 W03}\cell
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx1872
      \intbl {\f0 {\f0\fs20 16447}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx3744
      \intbl {\f0 {\f0\fs20 2046.13}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx5616
      \intbl {\f0 {\f0\fs20 2049.30}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx7488
      \intbl {\f0 {\f0\fs20 2022.58}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx9360
      \intbl {\f0 {\f0\fs20 2028.26}}\cell
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx1872
      \intbl {\f0 {\f0\fs20 16448}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx3744
      \intbl {\f0 {\f0\fs20 2031.58}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx5616
      \intbl {\f0 {\f0\fs20 2056.93}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx7488
      \intbl {\f0 {\f0\fs20 2008.25}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx9360
      \intbl {\f0 {\f0\fs20 2023.03}}\cell
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx1872
      \intbl {\f0 {\f0\fs20 16449}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx3744
      \intbl {\f0 {\f0\fs20 2018.40}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx5616
      \intbl {\f0 {\f0\fs20 2018.40}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx7488
      \intbl {\f0 {\f0\fs20 1988.44}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx9360
      \intbl {\f0 {\f0\fs20 2011.27}}\cell
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx1872
      \intbl {\f0 {\f0\fs20 16450}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx3744
      \intbl {\f0 {\f0\fs20 2013.75}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx5616
      \intbl {\f0 {\f0\fs20 2021.35}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx7488
      \intbl {\f0 {\f0\fs20 1991.47}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx9360
      \intbl {\f0 {\f0\fs20 1992.67}}\cell
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx1872
      \intbl {\f0 {\f0\fs20 16451}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx3744
      \intbl {\f0 {\f0\fs20 1992.25}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx5616
      \intbl {\f0 {\f0\fs20 2020.46}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx7488
      \intbl {\f0 {\f0\fs20 1988.12}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx9360
      \intbl {\f0 {\f0\fs20 2019.42}}\cell
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx1872
      \intbl {\f0 {\f0\fs20 average}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx3744
      \intbl {\f0 {\f0\fs20 <2,020.42>}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx5616
      \intbl {\f0 {\f0\fs20 2033.28798}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx7488
      \intbl {\f0 {\f0\fs20 1999.77198}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx9360
      \intbl {\f0 {\f0\fs20 2014.9300}}\cell
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx1872
      \intbl {\f0 {\f0\fs20 total}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx3744
      \intbl {\f0 {\f0\fs20 10102.11000}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx5616
      \intbl {\f0 {\f0\fs20 10166.43990}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx7488
      \intbl {\f0 {\f0\fs20 9998.85990}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx9360
      \intbl {\f0 {\f0\fs20 10074.6500}}\cell
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx1872
      \intbl {\f0 {\f0\fs20 std dev}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx3744
      \intbl {\f0 {\f0\fs20 20.17218}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx5616
      \intbl {\f0 {\f0\fs20 18.33064}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx7488
      \intbl {\f0 {\f0\fs20 15.20847}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx9360
      \intbl {\f0 {\f0\fs20 13.8957}}\cell
      
      \row
      
      }

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
          <tr><th id="summary_stub_W02_1" scope="row" class="gt_row gt_left gt_stub gt_summary_row gt_first_summary_row thick">average</th>
      <td headers="W02 summary_stub_W02_1 open" class="gt_row gt_right gt_summary_row gt_first_summary_row thick">2035.23998</td>
      <td headers="W02 summary_stub_W02_1 high" class="gt_row gt_right gt_summary_row gt_first_summary_row thick">2048.56198</td>
      <td headers="W02 summary_stub_W02_1 low" class="gt_row gt_right gt_summary_row gt_first_summary_row thick">2016.85398</td>
      <td headers="W02 summary_stub_W02_1 close" class="gt_row gt_right gt_summary_row gt_first_summary_row thick">2031.2080</td></tr>
          <tr><th id="summary_stub_W02_2" scope="row" class="gt_row gt_left gt_stub gt_summary_row">total</th>
      <td headers="W02 summary_stub_W02_2 open" class="gt_row gt_right gt_summary_row">10176.19990</td>
      <td headers="W02 summary_stub_W02_2 high" class="gt_row gt_right gt_summary_row">10242.80990</td>
      <td headers="W02 summary_stub_W02_2 low" class="gt_row gt_right gt_summary_row">10084.26990</td>
      <td headers="W02 summary_stub_W02_2 close" class="gt_row gt_right gt_summary_row">10156.0400</td></tr>
          <tr><th id="summary_stub_W02_3" scope="row" class="gt_row gt_left gt_stub gt_summary_row gt_last_summary_row">std dev</th>
      <td headers="W02 summary_stub_W02_3 open" class="gt_row gt_right gt_summary_row gt_last_summary_row">23.65756</td>
      <td headers="W02 summary_stub_W02_3 high" class="gt_row gt_right gt_summary_row gt_last_summary_row">17.47612</td>
      <td headers="W02 summary_stub_W02_3 low" class="gt_row gt_right gt_summary_row gt_last_summary_row">18.53720</td>
      <td headers="W02 summary_stub_W02_3 close" class="gt_row gt_right gt_summary_row gt_last_summary_row">22.9171</td></tr>
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
      <td headers="W03 stub_1_10 low" class="gt_row gt_right">1988.12</td>
      <td headers="W03 stub_1_10 close" class="gt_row gt_right">2019.42</td></tr>
          <tr><th id="summary_stub_W03_1" scope="row" class="gt_row gt_left gt_stub gt_summary_row gt_first_summary_row thick">average</th>
      <td headers="W03 summary_stub_W03_1 open" class="gt_row gt_right gt_summary_row gt_first_summary_row thick"><2,020.42></td>
      <td headers="W03 summary_stub_W03_1 high" class="gt_row gt_right gt_summary_row gt_first_summary_row thick">2033.28798</td>
      <td headers="W03 summary_stub_W03_1 low" class="gt_row gt_right gt_summary_row gt_first_summary_row thick">1999.77198</td>
      <td headers="W03 summary_stub_W03_1 close" class="gt_row gt_right gt_summary_row gt_first_summary_row thick">2014.9300</td></tr>
          <tr><th id="summary_stub_W03_2" scope="row" class="gt_row gt_left gt_stub gt_summary_row">total</th>
      <td headers="W03 summary_stub_W03_2 open" class="gt_row gt_right gt_summary_row"><10,102.11></td>
      <td headers="W03 summary_stub_W03_2 high" class="gt_row gt_right gt_summary_row">10166.43990</td>
      <td headers="W03 summary_stub_W03_2 low" class="gt_row gt_right gt_summary_row">9998.85990</td>
      <td headers="W03 summary_stub_W03_2 close" class="gt_row gt_right gt_summary_row">10074.6500</td></tr>
          <tr><th id="summary_stub_W03_3" scope="row" class="gt_row gt_left gt_stub gt_summary_row gt_last_summary_row">std dev</th>
      <td headers="W03 summary_stub_W03_3 open" class="gt_row gt_right gt_summary_row gt_last_summary_row">20.17218</td>
      <td headers="W03 summary_stub_W03_3 high" class="gt_row gt_right gt_summary_row gt_last_summary_row">18.33064</td>
      <td headers="W03 summary_stub_W03_3 low" class="gt_row gt_right gt_summary_row gt_last_summary_row">15.20847</td>
      <td headers="W03 summary_stub_W03_3 close" class="gt_row gt_right gt_summary_row gt_last_summary_row">13.8957</td></tr>
        </tbody>
        
      </table>

---

    Code
      as.character(as_latex(gt_tbl))
    Output
      [1] "\\begingroup\n\\fontsize{12.0pt}{14.0pt}\\selectfont\n\\begin{longtable}{l|rrrr}\n\\toprule\n & open & high & low & close \\\\ \n\\midrule\\addlinespace[2.5pt]\n\\multicolumn{5}{l}{W02} \\\\[2.5pt] \n\\midrule\\addlinespace[2.5pt]\n16440 & 2054.44 & 2054.44 & 2017.34 & 2020.58 \\\\ \n16441 & 2022.15 & 2030.25 & 1992.44 & 2002.61 \\\\ \n16442 & 2005.55 & 2029.61 & 2005.55 & 2025.90 \\\\ \n16443 & 2030.61 & 2064.08 & 2030.61 & 2062.14 \\\\ \n16444 & 2063.45 & 2064.43 & 2038.33 & 2044.81 \\\\ \n\\midrule \naverage & 2035.23998 & 2048.56198 & 2016.85398 & 2031.2080 \\\\ \ntotal & 10176.19990 & 10242.80990 & 10084.26990 & 10156.0400 \\\\ \nstd dev & 23.65756 & 17.47612 & 18.53720 & 22.9171 \\\\ \n\\midrule\\addlinespace[2.5pt]\n\\multicolumn{5}{l}{W03} \\\\[2.5pt] \n\\midrule\\addlinespace[2.5pt]\n16447 & 2046.13 & 2049.30 & 2022.58 & 2028.26 \\\\ \n16448 & 2031.58 & 2056.93 & 2008.25 & 2023.03 \\\\ \n16449 & 2018.40 & 2018.40 & 1988.44 & 2011.27 \\\\ \n16450 & 2013.75 & 2021.35 & 1991.47 & 1992.67 \\\\ \n16451 & 1992.25 & 2020.46 & 1988.12 & 2019.42 \\\\ \n\\midrule \naverage & <2,020.42> & 2033.28798 & 1999.77198 & 2014.9300 \\\\ \ntotal & <10,102.11> & 10166.43990 & 9998.85990 & 10074.6500 \\\\ \nstd dev & 20.17218 & 18.33064 & 15.20847 & 13.8957 \\\\ \n\\bottomrule\n\\end{longtable}\n\\endgroup\n"

---

    Code
      as_rtf(gt_tbl)
    Output
      {\rtf\ansi\ansicpg1252{\fonttbl{\f0\froman\fcharset0\fprq0 Courier New;}{\f1\froman\fcharset0\fprq0 Times;}}{\colortbl;\red211\green211\blue211;}
      
      \paperw12240\paperh15840\widowctrl\ftnbj\fet0\sectd\linex0
      \lndscpsxn
      \margl1440\margr1440\margt1440\margb1440
      \headery720\footery720\fs20
      
      \trowd\trrh0\trhdr
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85\clbrdrb\brdrs\brdrw20\brdrcf1 \cellx1872
      \intbl {\f0 {\f0\fs20 }}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85\clbrdrb\brdrs\brdrw20\brdrcf1 \cellx3744
      \intbl {\f0 {\f0\fs20 open}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85\clbrdrb\brdrs\brdrw20\brdrcf1 \cellx5616
      \intbl {\f0 {\f0\fs20 high}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85\clbrdrb\brdrs\brdrw20\brdrcf1 \cellx7488
      \intbl {\f0 {\f0\fs20 low}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85\clbrdrb\brdrs\brdrw20\brdrcf1 \cellx9360
      \intbl {\f0 {\f0\fs20 close}}\cell
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\ql\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx9360
      \intbl {\f0\fs20 W02}\cell
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx1872
      \intbl {\f0 {\f0\fs20 16440}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx3744
      \intbl {\f0 {\f0\fs20 2054.44}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx5616
      \intbl {\f0 {\f0\fs20 2054.44}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx7488
      \intbl {\f0 {\f0\fs20 2017.34}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx9360
      \intbl {\f0 {\f0\fs20 2020.58}}\cell
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx1872
      \intbl {\f0 {\f0\fs20 16441}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx3744
      \intbl {\f0 {\f0\fs20 2022.15}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx5616
      \intbl {\f0 {\f0\fs20 2030.25}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx7488
      \intbl {\f0 {\f0\fs20 1992.44}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx9360
      \intbl {\f0 {\f0\fs20 2002.61}}\cell
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx1872
      \intbl {\f0 {\f0\fs20 16442}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx3744
      \intbl {\f0 {\f0\fs20 2005.55}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx5616
      \intbl {\f0 {\f0\fs20 2029.61}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx7488
      \intbl {\f0 {\f0\fs20 2005.55}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx9360
      \intbl {\f0 {\f0\fs20 2025.90}}\cell
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx1872
      \intbl {\f0 {\f0\fs20 16443}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx3744
      \intbl {\f0 {\f0\fs20 2030.61}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx5616
      \intbl {\f0 {\f0\fs20 2064.08}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx7488
      \intbl {\f0 {\f0\fs20 2030.61}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx9360
      \intbl {\f0 {\f0\fs20 2062.14}}\cell
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx1872
      \intbl {\f0 {\f0\fs20 16444}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx3744
      \intbl {\f0 {\f0\fs20 2063.45}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx5616
      \intbl {\f0 {\f0\fs20 2064.43}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx7488
      \intbl {\f0 {\f0\fs20 2038.33}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx9360
      \intbl {\f0 {\f0\fs20 2044.81}}\cell
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx1872
      \intbl {\f0 {\f0\fs20 average}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx3744
      \intbl {\f0 {\f0\fs20 2035.23998}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx5616
      \intbl {\f0 {\f0\fs20 2048.56198}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx7488
      \intbl {\f0 {\f0\fs20 2016.85398}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx9360
      \intbl {\f0 {\f0\fs20 2031.2080}}\cell
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx1872
      \intbl {\f0 {\f0\fs20 total}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx3744
      \intbl {\f0 {\f0\fs20 10176.19990}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx5616
      \intbl {\f0 {\f0\fs20 10242.80990}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx7488
      \intbl {\f0 {\f0\fs20 10084.26990}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx9360
      \intbl {\f0 {\f0\fs20 10156.0400}}\cell
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx1872
      \intbl {\f0 {\f0\fs20 std dev}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx3744
      \intbl {\f0 {\f0\fs20 23.65756}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx5616
      \intbl {\f0 {\f0\fs20 17.47612}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx7488
      \intbl {\f0 {\f0\fs20 18.53720}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx9360
      \intbl {\f0 {\f0\fs20 22.9171}}\cell
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\ql\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx9360
      \intbl {\f0\fs20 W03}\cell
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx1872
      \intbl {\f0 {\f0\fs20 16447}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx3744
      \intbl {\f0 {\f0\fs20 2046.13}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx5616
      \intbl {\f0 {\f0\fs20 2049.30}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx7488
      \intbl {\f0 {\f0\fs20 2022.58}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx9360
      \intbl {\f0 {\f0\fs20 2028.26}}\cell
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx1872
      \intbl {\f0 {\f0\fs20 16448}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx3744
      \intbl {\f0 {\f0\fs20 2031.58}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx5616
      \intbl {\f0 {\f0\fs20 2056.93}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx7488
      \intbl {\f0 {\f0\fs20 2008.25}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx9360
      \intbl {\f0 {\f0\fs20 2023.03}}\cell
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx1872
      \intbl {\f0 {\f0\fs20 16449}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx3744
      \intbl {\f0 {\f0\fs20 2018.40}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx5616
      \intbl {\f0 {\f0\fs20 2018.40}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx7488
      \intbl {\f0 {\f0\fs20 1988.44}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx9360
      \intbl {\f0 {\f0\fs20 2011.27}}\cell
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx1872
      \intbl {\f0 {\f0\fs20 16450}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx3744
      \intbl {\f0 {\f0\fs20 2013.75}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx5616
      \intbl {\f0 {\f0\fs20 2021.35}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx7488
      \intbl {\f0 {\f0\fs20 1991.47}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx9360
      \intbl {\f0 {\f0\fs20 1992.67}}\cell
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx1872
      \intbl {\f0 {\f0\fs20 16451}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx3744
      \intbl {\f0 {\f0\fs20 1992.25}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx5616
      \intbl {\f0 {\f0\fs20 2020.46}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx7488
      \intbl {\f0 {\f0\fs20 1988.12}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx9360
      \intbl {\f0 {\f0\fs20 2019.42}}\cell
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx1872
      \intbl {\f0 {\f0\fs20 average}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx3744
      \intbl {\f0 {\f0\fs20 <2,020.42>}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx5616
      \intbl {\f0 {\f0\fs20 2033.28798}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx7488
      \intbl {\f0 {\f0\fs20 1999.77198}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx9360
      \intbl {\f0 {\f0\fs20 2014.9300}}\cell
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx1872
      \intbl {\f0 {\f0\fs20 total}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx3744
      \intbl {\f0 {\f0\fs20 <10,102.11>}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx5616
      \intbl {\f0 {\f0\fs20 10166.43990}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx7488
      \intbl {\f0 {\f0\fs20 9998.85990}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx9360
      \intbl {\f0 {\f0\fs20 10074.6500}}\cell
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx1872
      \intbl {\f0 {\f0\fs20 std dev}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx3744
      \intbl {\f0 {\f0\fs20 20.17218}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx5616
      \intbl {\f0 {\f0\fs20 18.33064}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx7488
      \intbl {\f0 {\f0\fs20 15.20847}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx9360
      \intbl {\f0 {\f0\fs20 13.8957}}\cell
      
      \row
      
      }

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
          <tr><th id="summary_stub_W02_1" scope="row" class="gt_row gt_left gt_stub gt_summary_row gt_first_summary_row thick">average</th>
      <td headers="W02 summary_stub_W02_1 open" class="gt_row gt_right gt_summary_row gt_first_summary_row thick">2035.23998</td>
      <td headers="W02 summary_stub_W02_1 high" class="gt_row gt_right gt_summary_row gt_first_summary_row thick">2048.56198</td>
      <td headers="W02 summary_stub_W02_1 low" class="gt_row gt_right gt_summary_row gt_first_summary_row thick">2016.85398</td>
      <td headers="W02 summary_stub_W02_1 close" class="gt_row gt_right gt_summary_row gt_first_summary_row thick">2031.2080</td></tr>
          <tr><th id="summary_stub_W02_2" scope="row" class="gt_row gt_left gt_stub gt_summary_row">total</th>
      <td headers="W02 summary_stub_W02_2 open" class="gt_row gt_right gt_summary_row">10176.19990</td>
      <td headers="W02 summary_stub_W02_2 high" class="gt_row gt_right gt_summary_row">10242.80990</td>
      <td headers="W02 summary_stub_W02_2 low" class="gt_row gt_right gt_summary_row">10084.26990</td>
      <td headers="W02 summary_stub_W02_2 close" class="gt_row gt_right gt_summary_row">10156.0400</td></tr>
          <tr><th id="summary_stub_W02_3" scope="row" class="gt_row gt_left gt_stub gt_summary_row gt_last_summary_row">std dev</th>
      <td headers="W02 summary_stub_W02_3 open" class="gt_row gt_right gt_summary_row gt_last_summary_row">23.65756</td>
      <td headers="W02 summary_stub_W02_3 high" class="gt_row gt_right gt_summary_row gt_last_summary_row">17.47612</td>
      <td headers="W02 summary_stub_W02_3 low" class="gt_row gt_right gt_summary_row gt_last_summary_row">18.53720</td>
      <td headers="W02 summary_stub_W02_3 close" class="gt_row gt_right gt_summary_row gt_last_summary_row">22.9171</td></tr>
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
      <td headers="W03 stub_1_10 low" class="gt_row gt_right">1988.12</td>
      <td headers="W03 stub_1_10 close" class="gt_row gt_right">2019.42</td></tr>
          <tr><th id="summary_stub_W03_1" scope="row" class="gt_row gt_left gt_stub gt_summary_row gt_first_summary_row thick">average</th>
      <td headers="W03 summary_stub_W03_1 open" class="gt_row gt_right gt_summary_row gt_first_summary_row thick"><2,020.42></td>
      <td headers="W03 summary_stub_W03_1 high" class="gt_row gt_right gt_summary_row gt_first_summary_row thick">2033.28798</td>
      <td headers="W03 summary_stub_W03_1 low" class="gt_row gt_right gt_summary_row gt_first_summary_row thick">1999.77198</td>
      <td headers="W03 summary_stub_W03_1 close" class="gt_row gt_right gt_summary_row gt_first_summary_row thick">2014.9300</td></tr>
          <tr><th id="summary_stub_W03_2" scope="row" class="gt_row gt_left gt_stub gt_summary_row">total</th>
      <td headers="W03 summary_stub_W03_2 open" class="gt_row gt_right gt_summary_row"><10,102.11></td>
      <td headers="W03 summary_stub_W03_2 high" class="gt_row gt_right gt_summary_row">10166.43990</td>
      <td headers="W03 summary_stub_W03_2 low" class="gt_row gt_right gt_summary_row">9998.85990</td>
      <td headers="W03 summary_stub_W03_2 close" class="gt_row gt_right gt_summary_row">10074.6500</td></tr>
          <tr><th id="summary_stub_W03_3" scope="row" class="gt_row gt_left gt_stub gt_summary_row gt_last_summary_row">std dev</th>
      <td headers="W03 summary_stub_W03_3 open" class="gt_row gt_right gt_summary_row gt_last_summary_row"><20.17></td>
      <td headers="W03 summary_stub_W03_3 high" class="gt_row gt_right gt_summary_row gt_last_summary_row">18.33064</td>
      <td headers="W03 summary_stub_W03_3 low" class="gt_row gt_right gt_summary_row gt_last_summary_row">15.20847</td>
      <td headers="W03 summary_stub_W03_3 close" class="gt_row gt_right gt_summary_row gt_last_summary_row">13.8957</td></tr>
        </tbody>
        
      </table>

---

    Code
      as.character(as_latex(gt_tbl))
    Output
      [1] "\\begingroup\n\\fontsize{12.0pt}{14.0pt}\\selectfont\n\\begin{longtable}{l|rrrr}\n\\toprule\n & open & high & low & close \\\\ \n\\midrule\\addlinespace[2.5pt]\n\\multicolumn{5}{l}{W02} \\\\[2.5pt] \n\\midrule\\addlinespace[2.5pt]\n16440 & 2054.44 & 2054.44 & 2017.34 & 2020.58 \\\\ \n16441 & 2022.15 & 2030.25 & 1992.44 & 2002.61 \\\\ \n16442 & 2005.55 & 2029.61 & 2005.55 & 2025.90 \\\\ \n16443 & 2030.61 & 2064.08 & 2030.61 & 2062.14 \\\\ \n16444 & 2063.45 & 2064.43 & 2038.33 & 2044.81 \\\\ \n\\midrule \naverage & 2035.23998 & 2048.56198 & 2016.85398 & 2031.2080 \\\\ \ntotal & 10176.19990 & 10242.80990 & 10084.26990 & 10156.0400 \\\\ \nstd dev & 23.65756 & 17.47612 & 18.53720 & 22.9171 \\\\ \n\\midrule\\addlinespace[2.5pt]\n\\multicolumn{5}{l}{W03} \\\\[2.5pt] \n\\midrule\\addlinespace[2.5pt]\n16447 & 2046.13 & 2049.30 & 2022.58 & 2028.26 \\\\ \n16448 & 2031.58 & 2056.93 & 2008.25 & 2023.03 \\\\ \n16449 & 2018.40 & 2018.40 & 1988.44 & 2011.27 \\\\ \n16450 & 2013.75 & 2021.35 & 1991.47 & 1992.67 \\\\ \n16451 & 1992.25 & 2020.46 & 1988.12 & 2019.42 \\\\ \n\\midrule \naverage & <2,020.42> & 2033.28798 & 1999.77198 & 2014.9300 \\\\ \ntotal & <10,102.11> & 10166.43990 & 9998.85990 & 10074.6500 \\\\ \nstd dev & <20.17> & 18.33064 & 15.20847 & 13.8957 \\\\ \n\\bottomrule\n\\end{longtable}\n\\endgroup\n"

---

    Code
      as_rtf(gt_tbl)
    Output
      {\rtf\ansi\ansicpg1252{\fonttbl{\f0\froman\fcharset0\fprq0 Courier New;}{\f1\froman\fcharset0\fprq0 Times;}}{\colortbl;\red211\green211\blue211;}
      
      \paperw12240\paperh15840\widowctrl\ftnbj\fet0\sectd\linex0
      \lndscpsxn
      \margl1440\margr1440\margt1440\margb1440
      \headery720\footery720\fs20
      
      \trowd\trrh0\trhdr
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85\clbrdrb\brdrs\brdrw20\brdrcf1 \cellx1872
      \intbl {\f0 {\f0\fs20 }}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85\clbrdrb\brdrs\brdrw20\brdrcf1 \cellx3744
      \intbl {\f0 {\f0\fs20 open}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85\clbrdrb\brdrs\brdrw20\brdrcf1 \cellx5616
      \intbl {\f0 {\f0\fs20 high}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85\clbrdrb\brdrs\brdrw20\brdrcf1 \cellx7488
      \intbl {\f0 {\f0\fs20 low}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85\clbrdrb\brdrs\brdrw20\brdrcf1 \cellx9360
      \intbl {\f0 {\f0\fs20 close}}\cell
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\ql\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx9360
      \intbl {\f0\fs20 W02}\cell
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx1872
      \intbl {\f0 {\f0\fs20 16440}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx3744
      \intbl {\f0 {\f0\fs20 2054.44}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx5616
      \intbl {\f0 {\f0\fs20 2054.44}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx7488
      \intbl {\f0 {\f0\fs20 2017.34}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx9360
      \intbl {\f0 {\f0\fs20 2020.58}}\cell
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx1872
      \intbl {\f0 {\f0\fs20 16441}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx3744
      \intbl {\f0 {\f0\fs20 2022.15}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx5616
      \intbl {\f0 {\f0\fs20 2030.25}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx7488
      \intbl {\f0 {\f0\fs20 1992.44}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx9360
      \intbl {\f0 {\f0\fs20 2002.61}}\cell
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx1872
      \intbl {\f0 {\f0\fs20 16442}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx3744
      \intbl {\f0 {\f0\fs20 2005.55}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx5616
      \intbl {\f0 {\f0\fs20 2029.61}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx7488
      \intbl {\f0 {\f0\fs20 2005.55}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx9360
      \intbl {\f0 {\f0\fs20 2025.90}}\cell
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx1872
      \intbl {\f0 {\f0\fs20 16443}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx3744
      \intbl {\f0 {\f0\fs20 2030.61}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx5616
      \intbl {\f0 {\f0\fs20 2064.08}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx7488
      \intbl {\f0 {\f0\fs20 2030.61}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx9360
      \intbl {\f0 {\f0\fs20 2062.14}}\cell
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx1872
      \intbl {\f0 {\f0\fs20 16444}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx3744
      \intbl {\f0 {\f0\fs20 2063.45}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx5616
      \intbl {\f0 {\f0\fs20 2064.43}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx7488
      \intbl {\f0 {\f0\fs20 2038.33}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx9360
      \intbl {\f0 {\f0\fs20 2044.81}}\cell
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx1872
      \intbl {\f0 {\f0\fs20 average}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx3744
      \intbl {\f0 {\f0\fs20 2035.23998}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx5616
      \intbl {\f0 {\f0\fs20 2048.56198}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx7488
      \intbl {\f0 {\f0\fs20 2016.85398}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx9360
      \intbl {\f0 {\f0\fs20 2031.2080}}\cell
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx1872
      \intbl {\f0 {\f0\fs20 total}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx3744
      \intbl {\f0 {\f0\fs20 10176.19990}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx5616
      \intbl {\f0 {\f0\fs20 10242.80990}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx7488
      \intbl {\f0 {\f0\fs20 10084.26990}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx9360
      \intbl {\f0 {\f0\fs20 10156.0400}}\cell
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx1872
      \intbl {\f0 {\f0\fs20 std dev}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx3744
      \intbl {\f0 {\f0\fs20 23.65756}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx5616
      \intbl {\f0 {\f0\fs20 17.47612}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx7488
      \intbl {\f0 {\f0\fs20 18.53720}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx9360
      \intbl {\f0 {\f0\fs20 22.9171}}\cell
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\ql\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx9360
      \intbl {\f0\fs20 W03}\cell
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx1872
      \intbl {\f0 {\f0\fs20 16447}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx3744
      \intbl {\f0 {\f0\fs20 2046.13}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx5616
      \intbl {\f0 {\f0\fs20 2049.30}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx7488
      \intbl {\f0 {\f0\fs20 2022.58}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx9360
      \intbl {\f0 {\f0\fs20 2028.26}}\cell
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx1872
      \intbl {\f0 {\f0\fs20 16448}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx3744
      \intbl {\f0 {\f0\fs20 2031.58}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx5616
      \intbl {\f0 {\f0\fs20 2056.93}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx7488
      \intbl {\f0 {\f0\fs20 2008.25}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx9360
      \intbl {\f0 {\f0\fs20 2023.03}}\cell
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx1872
      \intbl {\f0 {\f0\fs20 16449}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx3744
      \intbl {\f0 {\f0\fs20 2018.40}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx5616
      \intbl {\f0 {\f0\fs20 2018.40}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx7488
      \intbl {\f0 {\f0\fs20 1988.44}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx9360
      \intbl {\f0 {\f0\fs20 2011.27}}\cell
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx1872
      \intbl {\f0 {\f0\fs20 16450}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx3744
      \intbl {\f0 {\f0\fs20 2013.75}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx5616
      \intbl {\f0 {\f0\fs20 2021.35}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx7488
      \intbl {\f0 {\f0\fs20 1991.47}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx9360
      \intbl {\f0 {\f0\fs20 1992.67}}\cell
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx1872
      \intbl {\f0 {\f0\fs20 16451}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx3744
      \intbl {\f0 {\f0\fs20 1992.25}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx5616
      \intbl {\f0 {\f0\fs20 2020.46}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx7488
      \intbl {\f0 {\f0\fs20 1988.12}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx9360
      \intbl {\f0 {\f0\fs20 2019.42}}\cell
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx1872
      \intbl {\f0 {\f0\fs20 average}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx3744
      \intbl {\f0 {\f0\fs20 <2,020.42>}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx5616
      \intbl {\f0 {\f0\fs20 2033.28798}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx7488
      \intbl {\f0 {\f0\fs20 1999.77198}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx9360
      \intbl {\f0 {\f0\fs20 2014.9300}}\cell
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx1872
      \intbl {\f0 {\f0\fs20 total}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx3744
      \intbl {\f0 {\f0\fs20 <10,102.11>}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx5616
      \intbl {\f0 {\f0\fs20 10166.43990}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx7488
      \intbl {\f0 {\f0\fs20 9998.85990}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx9360
      \intbl {\f0 {\f0\fs20 10074.6500}}\cell
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx1872
      \intbl {\f0 {\f0\fs20 std dev}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx3744
      \intbl {\f0 {\f0\fs20 <20.17>}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx5616
      \intbl {\f0 {\f0\fs20 18.33064}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx7488
      \intbl {\f0 {\f0\fs20 15.20847}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx9360
      \intbl {\f0 {\f0\fs20 13.8957}}\cell
      
      \row
      
      }

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
          <tr><th id="summary_stub_W02_1" scope="row" class="gt_row gt_left gt_stub gt_summary_row gt_first_summary_row thick">average</th>
      <td headers="W02 summary_stub_W02_1 open" class="gt_row gt_right gt_summary_row gt_first_summary_row thick">2035.23998</td>
      <td headers="W02 summary_stub_W02_1 high" class="gt_row gt_right gt_summary_row gt_first_summary_row thick">2048.56198</td>
      <td headers="W02 summary_stub_W02_1 low" class="gt_row gt_right gt_summary_row gt_first_summary_row thick">2016.85398</td>
      <td headers="W02 summary_stub_W02_1 close" class="gt_row gt_right gt_summary_row gt_first_summary_row thick">2031.2080</td></tr>
          <tr><th id="summary_stub_W02_2" scope="row" class="gt_row gt_left gt_stub gt_summary_row">total</th>
      <td headers="W02 summary_stub_W02_2 open" class="gt_row gt_right gt_summary_row">10176.19990</td>
      <td headers="W02 summary_stub_W02_2 high" class="gt_row gt_right gt_summary_row">10242.80990</td>
      <td headers="W02 summary_stub_W02_2 low" class="gt_row gt_right gt_summary_row">10084.26990</td>
      <td headers="W02 summary_stub_W02_2 close" class="gt_row gt_right gt_summary_row">10156.0400</td></tr>
          <tr><th id="summary_stub_W02_3" scope="row" class="gt_row gt_left gt_stub gt_summary_row gt_last_summary_row">std dev</th>
      <td headers="W02 summary_stub_W02_3 open" class="gt_row gt_right gt_summary_row gt_last_summary_row">23.65756</td>
      <td headers="W02 summary_stub_W02_3 high" class="gt_row gt_right gt_summary_row gt_last_summary_row">17.47612</td>
      <td headers="W02 summary_stub_W02_3 low" class="gt_row gt_right gt_summary_row gt_last_summary_row">18.53720</td>
      <td headers="W02 summary_stub_W02_3 close" class="gt_row gt_right gt_summary_row gt_last_summary_row">22.9171</td></tr>
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
      <td headers="W03 stub_1_10 low" class="gt_row gt_right">1988.12</td>
      <td headers="W03 stub_1_10 close" class="gt_row gt_right">2019.42</td></tr>
          <tr><th id="summary_stub_W03_1" scope="row" class="gt_row gt_left gt_stub gt_summary_row gt_first_summary_row thick">average</th>
      <td headers="W03 summary_stub_W03_1 open" class="gt_row gt_right gt_summary_row gt_first_summary_row thick"><2,020.42></td>
      <td headers="W03 summary_stub_W03_1 high" class="gt_row gt_right gt_summary_row gt_first_summary_row thick">2033.28798</td>
      <td headers="W03 summary_stub_W03_1 low" class="gt_row gt_right gt_summary_row gt_first_summary_row thick">1999.77198</td>
      <td headers="W03 summary_stub_W03_1 close" class="gt_row gt_right gt_summary_row gt_first_summary_row thick"><2,014.93></td></tr>
          <tr><th id="summary_stub_W03_2" scope="row" class="gt_row gt_left gt_stub gt_summary_row">total</th>
      <td headers="W03 summary_stub_W03_2 open" class="gt_row gt_right gt_summary_row"><10,102.11></td>
      <td headers="W03 summary_stub_W03_2 high" class="gt_row gt_right gt_summary_row">10166.43990</td>
      <td headers="W03 summary_stub_W03_2 low" class="gt_row gt_right gt_summary_row">9998.85990</td>
      <td headers="W03 summary_stub_W03_2 close" class="gt_row gt_right gt_summary_row"><10,074.65></td></tr>
          <tr><th id="summary_stub_W03_3" scope="row" class="gt_row gt_left gt_stub gt_summary_row gt_last_summary_row">std dev</th>
      <td headers="W03 summary_stub_W03_3 open" class="gt_row gt_right gt_summary_row gt_last_summary_row"><20.17></td>
      <td headers="W03 summary_stub_W03_3 high" class="gt_row gt_right gt_summary_row gt_last_summary_row">18.33064</td>
      <td headers="W03 summary_stub_W03_3 low" class="gt_row gt_right gt_summary_row gt_last_summary_row">15.20847</td>
      <td headers="W03 summary_stub_W03_3 close" class="gt_row gt_right gt_summary_row gt_last_summary_row"><13.90></td></tr>
        </tbody>
        
      </table>

---

    Code
      as.character(as_latex(gt_tbl))
    Output
      [1] "\\begingroup\n\\fontsize{12.0pt}{14.0pt}\\selectfont\n\\begin{longtable}{l|rrrr}\n\\toprule\n & open & high & low & close \\\\ \n\\midrule\\addlinespace[2.5pt]\n\\multicolumn{5}{l}{W02} \\\\[2.5pt] \n\\midrule\\addlinespace[2.5pt]\n16440 & 2054.44 & 2054.44 & 2017.34 & 2020.58 \\\\ \n16441 & 2022.15 & 2030.25 & 1992.44 & 2002.61 \\\\ \n16442 & 2005.55 & 2029.61 & 2005.55 & 2025.90 \\\\ \n16443 & 2030.61 & 2064.08 & 2030.61 & 2062.14 \\\\ \n16444 & 2063.45 & 2064.43 & 2038.33 & 2044.81 \\\\ \n\\midrule \naverage & 2035.23998 & 2048.56198 & 2016.85398 & 2031.2080 \\\\ \ntotal & 10176.19990 & 10242.80990 & 10084.26990 & 10156.0400 \\\\ \nstd dev & 23.65756 & 17.47612 & 18.53720 & 22.9171 \\\\ \n\\midrule\\addlinespace[2.5pt]\n\\multicolumn{5}{l}{W03} \\\\[2.5pt] \n\\midrule\\addlinespace[2.5pt]\n16447 & 2046.13 & 2049.30 & 2022.58 & 2028.26 \\\\ \n16448 & 2031.58 & 2056.93 & 2008.25 & 2023.03 \\\\ \n16449 & 2018.40 & 2018.40 & 1988.44 & 2011.27 \\\\ \n16450 & 2013.75 & 2021.35 & 1991.47 & 1992.67 \\\\ \n16451 & 1992.25 & 2020.46 & 1988.12 & 2019.42 \\\\ \n\\midrule \naverage & <2,020.42> & 2033.28798 & 1999.77198 & <2,014.93> \\\\ \ntotal & <10,102.11> & 10166.43990 & 9998.85990 & <10,074.65> \\\\ \nstd dev & <20.17> & 18.33064 & 15.20847 & <13.90> \\\\ \n\\bottomrule\n\\end{longtable}\n\\endgroup\n"

---

    Code
      as_rtf(gt_tbl)
    Output
      {\rtf\ansi\ansicpg1252{\fonttbl{\f0\froman\fcharset0\fprq0 Courier New;}{\f1\froman\fcharset0\fprq0 Times;}}{\colortbl;\red211\green211\blue211;}
      
      \paperw12240\paperh15840\widowctrl\ftnbj\fet0\sectd\linex0
      \lndscpsxn
      \margl1440\margr1440\margt1440\margb1440
      \headery720\footery720\fs20
      
      \trowd\trrh0\trhdr
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85\clbrdrb\brdrs\brdrw20\brdrcf1 \cellx1872
      \intbl {\f0 {\f0\fs20 }}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85\clbrdrb\brdrs\brdrw20\brdrcf1 \cellx3744
      \intbl {\f0 {\f0\fs20 open}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85\clbrdrb\brdrs\brdrw20\brdrcf1 \cellx5616
      \intbl {\f0 {\f0\fs20 high}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85\clbrdrb\brdrs\brdrw20\brdrcf1 \cellx7488
      \intbl {\f0 {\f0\fs20 low}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85\clbrdrb\brdrs\brdrw20\brdrcf1 \cellx9360
      \intbl {\f0 {\f0\fs20 close}}\cell
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\ql\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx9360
      \intbl {\f0\fs20 W02}\cell
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx1872
      \intbl {\f0 {\f0\fs20 16440}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx3744
      \intbl {\f0 {\f0\fs20 2054.44}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx5616
      \intbl {\f0 {\f0\fs20 2054.44}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx7488
      \intbl {\f0 {\f0\fs20 2017.34}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx9360
      \intbl {\f0 {\f0\fs20 2020.58}}\cell
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx1872
      \intbl {\f0 {\f0\fs20 16441}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx3744
      \intbl {\f0 {\f0\fs20 2022.15}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx5616
      \intbl {\f0 {\f0\fs20 2030.25}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx7488
      \intbl {\f0 {\f0\fs20 1992.44}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx9360
      \intbl {\f0 {\f0\fs20 2002.61}}\cell
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx1872
      \intbl {\f0 {\f0\fs20 16442}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx3744
      \intbl {\f0 {\f0\fs20 2005.55}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx5616
      \intbl {\f0 {\f0\fs20 2029.61}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx7488
      \intbl {\f0 {\f0\fs20 2005.55}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx9360
      \intbl {\f0 {\f0\fs20 2025.90}}\cell
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx1872
      \intbl {\f0 {\f0\fs20 16443}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx3744
      \intbl {\f0 {\f0\fs20 2030.61}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx5616
      \intbl {\f0 {\f0\fs20 2064.08}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx7488
      \intbl {\f0 {\f0\fs20 2030.61}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx9360
      \intbl {\f0 {\f0\fs20 2062.14}}\cell
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx1872
      \intbl {\f0 {\f0\fs20 16444}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx3744
      \intbl {\f0 {\f0\fs20 2063.45}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx5616
      \intbl {\f0 {\f0\fs20 2064.43}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx7488
      \intbl {\f0 {\f0\fs20 2038.33}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx9360
      \intbl {\f0 {\f0\fs20 2044.81}}\cell
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx1872
      \intbl {\f0 {\f0\fs20 average}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx3744
      \intbl {\f0 {\f0\fs20 2035.23998}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx5616
      \intbl {\f0 {\f0\fs20 2048.56198}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx7488
      \intbl {\f0 {\f0\fs20 2016.85398}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx9360
      \intbl {\f0 {\f0\fs20 2031.2080}}\cell
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx1872
      \intbl {\f0 {\f0\fs20 total}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx3744
      \intbl {\f0 {\f0\fs20 10176.19990}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx5616
      \intbl {\f0 {\f0\fs20 10242.80990}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx7488
      \intbl {\f0 {\f0\fs20 10084.26990}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx9360
      \intbl {\f0 {\f0\fs20 10156.0400}}\cell
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx1872
      \intbl {\f0 {\f0\fs20 std dev}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx3744
      \intbl {\f0 {\f0\fs20 23.65756}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx5616
      \intbl {\f0 {\f0\fs20 17.47612}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx7488
      \intbl {\f0 {\f0\fs20 18.53720}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx9360
      \intbl {\f0 {\f0\fs20 22.9171}}\cell
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\ql\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx9360
      \intbl {\f0\fs20 W03}\cell
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx1872
      \intbl {\f0 {\f0\fs20 16447}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx3744
      \intbl {\f0 {\f0\fs20 2046.13}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx5616
      \intbl {\f0 {\f0\fs20 2049.30}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx7488
      \intbl {\f0 {\f0\fs20 2022.58}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx9360
      \intbl {\f0 {\f0\fs20 2028.26}}\cell
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx1872
      \intbl {\f0 {\f0\fs20 16448}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx3744
      \intbl {\f0 {\f0\fs20 2031.58}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx5616
      \intbl {\f0 {\f0\fs20 2056.93}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx7488
      \intbl {\f0 {\f0\fs20 2008.25}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx9360
      \intbl {\f0 {\f0\fs20 2023.03}}\cell
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx1872
      \intbl {\f0 {\f0\fs20 16449}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx3744
      \intbl {\f0 {\f0\fs20 2018.40}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx5616
      \intbl {\f0 {\f0\fs20 2018.40}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx7488
      \intbl {\f0 {\f0\fs20 1988.44}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx9360
      \intbl {\f0 {\f0\fs20 2011.27}}\cell
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx1872
      \intbl {\f0 {\f0\fs20 16450}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx3744
      \intbl {\f0 {\f0\fs20 2013.75}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx5616
      \intbl {\f0 {\f0\fs20 2021.35}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx7488
      \intbl {\f0 {\f0\fs20 1991.47}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx9360
      \intbl {\f0 {\f0\fs20 1992.67}}\cell
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx1872
      \intbl {\f0 {\f0\fs20 16451}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx3744
      \intbl {\f0 {\f0\fs20 1992.25}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx5616
      \intbl {\f0 {\f0\fs20 2020.46}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx7488
      \intbl {\f0 {\f0\fs20 1988.12}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx9360
      \intbl {\f0 {\f0\fs20 2019.42}}\cell
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx1872
      \intbl {\f0 {\f0\fs20 average}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx3744
      \intbl {\f0 {\f0\fs20 <2,020.42>}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx5616
      \intbl {\f0 {\f0\fs20 2033.28798}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx7488
      \intbl {\f0 {\f0\fs20 1999.77198}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx9360
      \intbl {\f0 {\f0\fs20 <2,014.93>}}\cell
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx1872
      \intbl {\f0 {\f0\fs20 total}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx3744
      \intbl {\f0 {\f0\fs20 <10,102.11>}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx5616
      \intbl {\f0 {\f0\fs20 10166.43990}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx7488
      \intbl {\f0 {\f0\fs20 9998.85990}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx9360
      \intbl {\f0 {\f0\fs20 <10,074.65>}}\cell
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx1872
      \intbl {\f0 {\f0\fs20 std dev}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx3744
      \intbl {\f0 {\f0\fs20 <20.17>}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx5616
      \intbl {\f0 {\f0\fs20 18.33064}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx7488
      \intbl {\f0 {\f0\fs20 15.20847}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx9360
      \intbl {\f0 {\f0\fs20 <13.90>}}\cell
      
      \row
      
      }

# Situtations where `rowname` is a column name don't interfere with internals

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
            <th class="gt_col_heading gt_columns_bottom_border gt_left" rowspan="1" colspan="1" scope="col" id="group">group</th>
          </tr>
        </thead>
        <tbody class="gt_table_body">
          <tr><th id="stub_1_1" scope="row" class="gt_row gt_left gt_stub">row_1</th>
      <td headers="stub_1_1 num" class="gt_row gt_right">1.111e-01</td>
      <td headers="stub_1_1 char" class="gt_row gt_left">apricot</td>
      <td headers="stub_1_1 fctr" class="gt_row gt_center">one</td>
      <td headers="stub_1_1 date" class="gt_row gt_right">2015-01-15</td>
      <td headers="stub_1_1 time" class="gt_row gt_right">13:35</td>
      <td headers="stub_1_1 datetime" class="gt_row gt_right">2018-01-01 02:22</td>
      <td headers="stub_1_1 currency" class="gt_row gt_right">49.950</td>
      <td headers="stub_1_1 group" class="gt_row gt_left">grp_a</td></tr>
          <tr><th id="stub_1_2" scope="row" class="gt_row gt_left gt_stub">row_2</th>
      <td headers="stub_1_2 num" class="gt_row gt_right">2.222e+00</td>
      <td headers="stub_1_2 char" class="gt_row gt_left">banana</td>
      <td headers="stub_1_2 fctr" class="gt_row gt_center">two</td>
      <td headers="stub_1_2 date" class="gt_row gt_right">2015-02-15</td>
      <td headers="stub_1_2 time" class="gt_row gt_right">14:40</td>
      <td headers="stub_1_2 datetime" class="gt_row gt_right">2018-02-02 14:33</td>
      <td headers="stub_1_2 currency" class="gt_row gt_right">17.950</td>
      <td headers="stub_1_2 group" class="gt_row gt_left">grp_a</td></tr>
          <tr><th id="stub_1_3" scope="row" class="gt_row gt_left gt_stub">row_3</th>
      <td headers="stub_1_3 num" class="gt_row gt_right">3.333e+01</td>
      <td headers="stub_1_3 char" class="gt_row gt_left">coconut</td>
      <td headers="stub_1_3 fctr" class="gt_row gt_center">three</td>
      <td headers="stub_1_3 date" class="gt_row gt_right">2015-03-15</td>
      <td headers="stub_1_3 time" class="gt_row gt_right">15:45</td>
      <td headers="stub_1_3 datetime" class="gt_row gt_right">2018-03-03 03:44</td>
      <td headers="stub_1_3 currency" class="gt_row gt_right">1.390</td>
      <td headers="stub_1_3 group" class="gt_row gt_left">grp_a</td></tr>
          <tr><th id="stub_1_4" scope="row" class="gt_row gt_left gt_stub">row_4</th>
      <td headers="stub_1_4 num" class="gt_row gt_right">4.444e+02</td>
      <td headers="stub_1_4 char" class="gt_row gt_left">durian</td>
      <td headers="stub_1_4 fctr" class="gt_row gt_center">four</td>
      <td headers="stub_1_4 date" class="gt_row gt_right">2015-04-15</td>
      <td headers="stub_1_4 time" class="gt_row gt_right">16:50</td>
      <td headers="stub_1_4 datetime" class="gt_row gt_right">2018-04-04 15:55</td>
      <td headers="stub_1_4 currency" class="gt_row gt_right">65100.000</td>
      <td headers="stub_1_4 group" class="gt_row gt_left">grp_a</td></tr>
          <tr><th id="stub_1_5" scope="row" class="gt_row gt_left gt_stub">row_5</th>
      <td headers="stub_1_5 num" class="gt_row gt_right">5.550e+03</td>
      <td headers="stub_1_5 char" class="gt_row gt_left">NA</td>
      <td headers="stub_1_5 fctr" class="gt_row gt_center">five</td>
      <td headers="stub_1_5 date" class="gt_row gt_right">2015-05-15</td>
      <td headers="stub_1_5 time" class="gt_row gt_right">17:55</td>
      <td headers="stub_1_5 datetime" class="gt_row gt_right">2018-05-05 04:00</td>
      <td headers="stub_1_5 currency" class="gt_row gt_right">1325.810</td>
      <td headers="stub_1_5 group" class="gt_row gt_left">grp_b</td></tr>
          <tr><th id="stub_1_6" scope="row" class="gt_row gt_left gt_stub">row_6</th>
      <td headers="stub_1_6 num" class="gt_row gt_right">NA</td>
      <td headers="stub_1_6 char" class="gt_row gt_left">fig</td>
      <td headers="stub_1_6 fctr" class="gt_row gt_center">six</td>
      <td headers="stub_1_6 date" class="gt_row gt_right">2015-06-15</td>
      <td headers="stub_1_6 time" class="gt_row gt_right">NA</td>
      <td headers="stub_1_6 datetime" class="gt_row gt_right">2018-06-06 16:11</td>
      <td headers="stub_1_6 currency" class="gt_row gt_right">13.255</td>
      <td headers="stub_1_6 group" class="gt_row gt_left">grp_b</td></tr>
          <tr><th id="stub_1_7" scope="row" class="gt_row gt_left gt_stub">row_7</th>
      <td headers="stub_1_7 num" class="gt_row gt_right">7.770e+05</td>
      <td headers="stub_1_7 char" class="gt_row gt_left">grapefruit</td>
      <td headers="stub_1_7 fctr" class="gt_row gt_center">seven</td>
      <td headers="stub_1_7 date" class="gt_row gt_right">NA</td>
      <td headers="stub_1_7 time" class="gt_row gt_right">19:10</td>
      <td headers="stub_1_7 datetime" class="gt_row gt_right">2018-07-07 05:22</td>
      <td headers="stub_1_7 currency" class="gt_row gt_right">NA</td>
      <td headers="stub_1_7 group" class="gt_row gt_left">grp_b</td></tr>
          <tr><th id="stub_1_8" scope="row" class="gt_row gt_left gt_stub">row_8</th>
      <td headers="stub_1_8 num" class="gt_row gt_right">8.880e+06</td>
      <td headers="stub_1_8 char" class="gt_row gt_left">honeydew</td>
      <td headers="stub_1_8 fctr" class="gt_row gt_center">eight</td>
      <td headers="stub_1_8 date" class="gt_row gt_right">2015-08-15</td>
      <td headers="stub_1_8 time" class="gt_row gt_right">20:20</td>
      <td headers="stub_1_8 datetime" class="gt_row gt_right">NA</td>
      <td headers="stub_1_8 currency" class="gt_row gt_right">0.440</td>
      <td headers="stub_1_8 group" class="gt_row gt_left">grp_b</td></tr>
          <tr><th id="grand_summary_stub_1" scope="row" class="gt_row gt_left gt_stub gt_grand_summary_row gt_first_grand_summary_row">min</th>
      <td headers="grand_summary_stub_1 num" class="gt_row gt_right gt_grand_summary_row gt_first_grand_summary_row">0.11</td>
      <td headers="grand_summary_stub_1 char" class="gt_row gt_left gt_grand_summary_row gt_first_grand_summary_row">—</td>
      <td headers="grand_summary_stub_1 fctr" class="gt_row gt_center gt_grand_summary_row gt_first_grand_summary_row">—</td>
      <td headers="grand_summary_stub_1 date" class="gt_row gt_right gt_grand_summary_row gt_first_grand_summary_row">—</td>
      <td headers="grand_summary_stub_1 time" class="gt_row gt_right gt_grand_summary_row gt_first_grand_summary_row">—</td>
      <td headers="grand_summary_stub_1 datetime" class="gt_row gt_right gt_grand_summary_row gt_first_grand_summary_row">—</td>
      <td headers="grand_summary_stub_1 currency" class="gt_row gt_right gt_grand_summary_row gt_first_grand_summary_row">0.44</td>
      <td headers="grand_summary_stub_1 group" class="gt_row gt_left gt_grand_summary_row gt_first_grand_summary_row">—</td></tr>
          <tr><th id="grand_summary_stub_2" scope="row" class="gt_row gt_left gt_stub gt_grand_summary_row">max</th>
      <td headers="grand_summary_stub_2 num" class="gt_row gt_right gt_grand_summary_row">8,880,000.00</td>
      <td headers="grand_summary_stub_2 char" class="gt_row gt_left gt_grand_summary_row">—</td>
      <td headers="grand_summary_stub_2 fctr" class="gt_row gt_center gt_grand_summary_row">—</td>
      <td headers="grand_summary_stub_2 date" class="gt_row gt_right gt_grand_summary_row">—</td>
      <td headers="grand_summary_stub_2 time" class="gt_row gt_right gt_grand_summary_row">—</td>
      <td headers="grand_summary_stub_2 datetime" class="gt_row gt_right gt_grand_summary_row">—</td>
      <td headers="grand_summary_stub_2 currency" class="gt_row gt_right gt_grand_summary_row">65,100.00</td>
      <td headers="grand_summary_stub_2 group" class="gt_row gt_left gt_grand_summary_row">—</td></tr>
          <tr><th id="grand_summary_stub_3" scope="row" class="gt_row gt_left gt_stub gt_grand_summary_row gt_last_summary_row">avg</th>
      <td headers="grand_summary_stub_3 num" class="gt_row gt_right gt_grand_summary_row gt_last_summary_row">1,380,432.87</td>
      <td headers="grand_summary_stub_3 char" class="gt_row gt_left gt_grand_summary_row gt_last_summary_row">—</td>
      <td headers="grand_summary_stub_3 fctr" class="gt_row gt_center gt_grand_summary_row gt_last_summary_row">—</td>
      <td headers="grand_summary_stub_3 date" class="gt_row gt_right gt_grand_summary_row gt_last_summary_row">—</td>
      <td headers="grand_summary_stub_3 time" class="gt_row gt_right gt_grand_summary_row gt_last_summary_row">—</td>
      <td headers="grand_summary_stub_3 datetime" class="gt_row gt_right gt_grand_summary_row gt_last_summary_row">—</td>
      <td headers="grand_summary_stub_3 currency" class="gt_row gt_right gt_grand_summary_row gt_last_summary_row">9,501.26</td>
      <td headers="grand_summary_stub_3 group" class="gt_row gt_left gt_grand_summary_row gt_last_summary_row">—</td></tr>
        </tbody>
        
      </table>

---

    Code
      as.character(as_latex(gt_tbl))
    Output
      [1] "\\begingroup\n\\fontsize{12.0pt}{14.0pt}\\selectfont\n\\begin{longtable}{l|rlcrrrrl}\n\\toprule\n & num & char & fctr & date & time & datetime & currency & group \\\\ \n\\midrule\\addlinespace[2.5pt]\nrow\\_1 & 1.111e-01 & apricot & one & 2015-01-15 & 13:35 & 2018-01-01 02:22 & 49.950 & grp\\_a \\\\ \nrow\\_2 & 2.222e+00 & banana & two & 2015-02-15 & 14:40 & 2018-02-02 14:33 & 17.950 & grp\\_a \\\\ \nrow\\_3 & 3.333e+01 & coconut & three & 2015-03-15 & 15:45 & 2018-03-03 03:44 & 1.390 & grp\\_a \\\\ \nrow\\_4 & 4.444e+02 & durian & four & 2015-04-15 & 16:50 & 2018-04-04 15:55 & 65100.000 & grp\\_a \\\\ \nrow\\_5 & 5.550e+03 & NA & five & 2015-05-15 & 17:55 & 2018-05-05 04:00 & 1325.810 & grp\\_b \\\\ \nrow\\_6 & NA & fig & six & 2015-06-15 & NA & 2018-06-06 16:11 & 13.255 & grp\\_b \\\\ \nrow\\_7 & 7.770e+05 & grapefruit & seven & NA & 19:10 & 2018-07-07 05:22 & NA & grp\\_b \\\\ \nrow\\_8 & 8.880e+06 & honeydew & eight & 2015-08-15 & 20:20 & NA & 0.440 & grp\\_b \\\\ \n\\midrule \n\\midrule \nmin & 0.11 & — & — & — & — & — & 0.44 & — \\\\ \nmax & 8,880,000.00 & — & — & — & — & — & 65,100.00 & — \\\\ \navg & 1,380,432.87 & — & — & — & — & — & 9,501.26 & — \\\\ \n\\bottomrule\n\\end{longtable}\n\\endgroup\n"

---

    Code
      as_rtf(gt_tbl)
    Output
      {\rtf\ansi\ansicpg1252{\fonttbl{\f0\froman\fcharset0\fprq0 Courier New;}{\f1\froman\fcharset0\fprq0 Times;}}{\colortbl;\red211\green211\blue211;}
      
      \paperw12240\paperh15840\widowctrl\ftnbj\fet0\sectd\linex0
      \lndscpsxn
      \margl1440\margr1440\margt1440\margb1440
      \headery720\footery720\fs20
      
      \trowd\trrh0\trhdr
      
      \pard\plain\uc0\ql\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85\clbrdrb\brdrs\brdrw20\brdrcf1 \cellx1040
      \intbl {\f0 {\f0\fs20 }}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85\clbrdrb\brdrs\brdrw20\brdrcf1 \cellx2080
      \intbl {\f0 {\f0\fs20 num}}\cell
      
      \pard\plain\uc0\ql\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85\clbrdrb\brdrs\brdrw20\brdrcf1 \cellx3120
      \intbl {\f0 {\f0\fs20 char}}\cell
      
      \pard\plain\uc0\qc\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85\clbrdrb\brdrs\brdrw20\brdrcf1 \cellx4160
      \intbl {\f0 {\f0\fs20 fctr}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85\clbrdrb\brdrs\brdrw20\brdrcf1 \cellx5200
      \intbl {\f0 {\f0\fs20 date}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85\clbrdrb\brdrs\brdrw20\brdrcf1 \cellx6240
      \intbl {\f0 {\f0\fs20 time}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85\clbrdrb\brdrs\brdrw20\brdrcf1 \cellx7280
      \intbl {\f0 {\f0\fs20 datetime}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85\clbrdrb\brdrs\brdrw20\brdrcf1 \cellx8320
      \intbl {\f0 {\f0\fs20 currency}}\cell
      
      \pard\plain\uc0\ql\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85\clbrdrb\brdrs\brdrw20\brdrcf1 \cellx9360
      \intbl {\f0 {\f0\fs20 group}}\cell
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\ql\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx1040
      \intbl {\f0 {\f0\fs20 row_1}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx2080
      \intbl {\f0 {\f0\fs20 1.111e-01}}\cell
      
      \pard\plain\uc0\ql\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx3120
      \intbl {\f0 {\f0\fs20 apricot}}\cell
      
      \pard\plain\uc0\qc\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx4160
      \intbl {\f0 {\f0\fs20 one}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx5200
      \intbl {\f0 {\f0\fs20 2015-01-15}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx6240
      \intbl {\f0 {\f0\fs20 13:35}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx7280
      \intbl {\f0 {\f0\fs20 2018-01-01 02:22}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx8320
      \intbl {\f0 {\f0\fs20 49.950}}\cell
      
      \pard\plain\uc0\ql\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx9360
      \intbl {\f0 {\f0\fs20 grp_a}}\cell
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\ql\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx1040
      \intbl {\f0 {\f0\fs20 row_2}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx2080
      \intbl {\f0 {\f0\fs20 2.222e+00}}\cell
      
      \pard\plain\uc0\ql\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx3120
      \intbl {\f0 {\f0\fs20 banana}}\cell
      
      \pard\plain\uc0\qc\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx4160
      \intbl {\f0 {\f0\fs20 two}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx5200
      \intbl {\f0 {\f0\fs20 2015-02-15}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx6240
      \intbl {\f0 {\f0\fs20 14:40}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx7280
      \intbl {\f0 {\f0\fs20 2018-02-02 14:33}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx8320
      \intbl {\f0 {\f0\fs20 17.950}}\cell
      
      \pard\plain\uc0\ql\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx9360
      \intbl {\f0 {\f0\fs20 grp_a}}\cell
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\ql\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx1040
      \intbl {\f0 {\f0\fs20 row_3}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx2080
      \intbl {\f0 {\f0\fs20 3.333e+01}}\cell
      
      \pard\plain\uc0\ql\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx3120
      \intbl {\f0 {\f0\fs20 coconut}}\cell
      
      \pard\plain\uc0\qc\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx4160
      \intbl {\f0 {\f0\fs20 three}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx5200
      \intbl {\f0 {\f0\fs20 2015-03-15}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx6240
      \intbl {\f0 {\f0\fs20 15:45}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx7280
      \intbl {\f0 {\f0\fs20 2018-03-03 03:44}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx8320
      \intbl {\f0 {\f0\fs20 1.390}}\cell
      
      \pard\plain\uc0\ql\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx9360
      \intbl {\f0 {\f0\fs20 grp_a}}\cell
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\ql\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx1040
      \intbl {\f0 {\f0\fs20 row_4}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx2080
      \intbl {\f0 {\f0\fs20 4.444e+02}}\cell
      
      \pard\plain\uc0\ql\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx3120
      \intbl {\f0 {\f0\fs20 durian}}\cell
      
      \pard\plain\uc0\qc\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx4160
      \intbl {\f0 {\f0\fs20 four}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx5200
      \intbl {\f0 {\f0\fs20 2015-04-15}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx6240
      \intbl {\f0 {\f0\fs20 16:50}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx7280
      \intbl {\f0 {\f0\fs20 2018-04-04 15:55}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx8320
      \intbl {\f0 {\f0\fs20 65100.000}}\cell
      
      \pard\plain\uc0\ql\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx9360
      \intbl {\f0 {\f0\fs20 grp_a}}\cell
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\ql\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx1040
      \intbl {\f0 {\f0\fs20 row_5}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx2080
      \intbl {\f0 {\f0\fs20 5.550e+03}}\cell
      
      \pard\plain\uc0\ql\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx3120
      \intbl {\f0 {\f0\fs20 NA}}\cell
      
      \pard\plain\uc0\qc\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx4160
      \intbl {\f0 {\f0\fs20 five}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx5200
      \intbl {\f0 {\f0\fs20 2015-05-15}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx6240
      \intbl {\f0 {\f0\fs20 17:55}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx7280
      \intbl {\f0 {\f0\fs20 2018-05-05 04:00}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx8320
      \intbl {\f0 {\f0\fs20 1325.810}}\cell
      
      \pard\plain\uc0\ql\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx9360
      \intbl {\f0 {\f0\fs20 grp_b}}\cell
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\ql\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx1040
      \intbl {\f0 {\f0\fs20 row_6}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx2080
      \intbl {\f0 {\f0\fs20 NA}}\cell
      
      \pard\plain\uc0\ql\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx3120
      \intbl {\f0 {\f0\fs20 fig}}\cell
      
      \pard\plain\uc0\qc\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx4160
      \intbl {\f0 {\f0\fs20 six}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx5200
      \intbl {\f0 {\f0\fs20 2015-06-15}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx6240
      \intbl {\f0 {\f0\fs20 NA}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx7280
      \intbl {\f0 {\f0\fs20 2018-06-06 16:11}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx8320
      \intbl {\f0 {\f0\fs20 13.255}}\cell
      
      \pard\plain\uc0\ql\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx9360
      \intbl {\f0 {\f0\fs20 grp_b}}\cell
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\ql\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx1040
      \intbl {\f0 {\f0\fs20 row_7}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx2080
      \intbl {\f0 {\f0\fs20 7.770e+05}}\cell
      
      \pard\plain\uc0\ql\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx3120
      \intbl {\f0 {\f0\fs20 grapefruit}}\cell
      
      \pard\plain\uc0\qc\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx4160
      \intbl {\f0 {\f0\fs20 seven}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx5200
      \intbl {\f0 {\f0\fs20 NA}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx6240
      \intbl {\f0 {\f0\fs20 19:10}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx7280
      \intbl {\f0 {\f0\fs20 2018-07-07 05:22}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx8320
      \intbl {\f0 {\f0\fs20 NA}}\cell
      
      \pard\plain\uc0\ql\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx9360
      \intbl {\f0 {\f0\fs20 grp_b}}\cell
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\ql\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx1040
      \intbl {\f0 {\f0\fs20 row_8}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx2080
      \intbl {\f0 {\f0\fs20 8.880e+06}}\cell
      
      \pard\plain\uc0\ql\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx3120
      \intbl {\f0 {\f0\fs20 honeydew}}\cell
      
      \pard\plain\uc0\qc\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx4160
      \intbl {\f0 {\f0\fs20 eight}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx5200
      \intbl {\f0 {\f0\fs20 2015-08-15}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx6240
      \intbl {\f0 {\f0\fs20 20:20}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx7280
      \intbl {\f0 {\f0\fs20 NA}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx8320
      \intbl {\f0 {\f0\fs20 0.440}}\cell
      
      \pard\plain\uc0\ql\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx9360
      \intbl {\f0 {\f0\fs20 grp_b}}\cell
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\ql\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx1040
      \intbl {\f0 {\f0\fs20 min}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx2080
      \intbl {\f0 {\f0\fs20 0.11}}\cell
      
      \pard\plain\uc0\ql\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx3120
      \intbl {\f0 {\f0\fs20 \'97}}\cell
      
      \pard\plain\uc0\qc\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx4160
      \intbl {\f0 {\f0\fs20 \'97}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx5200
      \intbl {\f0 {\f0\fs20 \'97}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx6240
      \intbl {\f0 {\f0\fs20 \'97}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx7280
      \intbl {\f0 {\f0\fs20 \'97}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx8320
      \intbl {\f0 {\f0\fs20 0.44}}\cell
      
      \pard\plain\uc0\ql\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx9360
      \intbl {\f0 {\f0\fs20 \'97}}\cell
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\ql\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx1040
      \intbl {\f0 {\f0\fs20 max}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx2080
      \intbl {\f0 {\f0\fs20 8,880,000.00}}\cell
      
      \pard\plain\uc0\ql\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx3120
      \intbl {\f0 {\f0\fs20 \'97}}\cell
      
      \pard\plain\uc0\qc\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx4160
      \intbl {\f0 {\f0\fs20 \'97}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx5200
      \intbl {\f0 {\f0\fs20 \'97}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx6240
      \intbl {\f0 {\f0\fs20 \'97}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx7280
      \intbl {\f0 {\f0\fs20 \'97}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx8320
      \intbl {\f0 {\f0\fs20 65,100.00}}\cell
      
      \pard\plain\uc0\ql\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx9360
      \intbl {\f0 {\f0\fs20 \'97}}\cell
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\ql\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx1040
      \intbl {\f0 {\f0\fs20 avg}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx2080
      \intbl {\f0 {\f0\fs20 1,380,432.87}}\cell
      
      \pard\plain\uc0\ql\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx3120
      \intbl {\f0 {\f0\fs20 \'97}}\cell
      
      \pard\plain\uc0\qc\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx4160
      \intbl {\f0 {\f0\fs20 \'97}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx5200
      \intbl {\f0 {\f0\fs20 \'97}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx6240
      \intbl {\f0 {\f0\fs20 \'97}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx7280
      \intbl {\f0 {\f0\fs20 \'97}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx8320
      \intbl {\f0 {\f0\fs20 9,501.26}}\cell
      
      \pard\plain\uc0\ql\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx9360
      \intbl {\f0 {\f0\fs20 \'97}}\cell
      
      \row
      
      }

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
            <th class="gt_col_heading gt_columns_bottom_border gt_left" rowspan="1" colspan="1" scope="col" id="group">group</th>
          </tr>
        </thead>
        <tbody class="gt_table_body">
          <tr><th id="stub_1_1" scope="row" class="gt_row gt_left gt_stub">row_1</th>
      <td headers="stub_1_1 num" class="gt_row gt_right">1.111e-01</td>
      <td headers="stub_1_1 char" class="gt_row gt_left">apricot</td>
      <td headers="stub_1_1 fctr" class="gt_row gt_center">one</td>
      <td headers="stub_1_1 date" class="gt_row gt_right">2015-01-15</td>
      <td headers="stub_1_1 time" class="gt_row gt_right">13:35</td>
      <td headers="stub_1_1 datetime" class="gt_row gt_right">2018-01-01 02:22</td>
      <td headers="stub_1_1 currency" class="gt_row gt_right">49.950</td>
      <td headers="stub_1_1 group" class="gt_row gt_left">grp_a</td></tr>
          <tr><th id="stub_1_2" scope="row" class="gt_row gt_left gt_stub">row_2</th>
      <td headers="stub_1_2 num" class="gt_row gt_right">2.222e+00</td>
      <td headers="stub_1_2 char" class="gt_row gt_left">banana</td>
      <td headers="stub_1_2 fctr" class="gt_row gt_center">two</td>
      <td headers="stub_1_2 date" class="gt_row gt_right">2015-02-15</td>
      <td headers="stub_1_2 time" class="gt_row gt_right">14:40</td>
      <td headers="stub_1_2 datetime" class="gt_row gt_right">2018-02-02 14:33</td>
      <td headers="stub_1_2 currency" class="gt_row gt_right">17.950</td>
      <td headers="stub_1_2 group" class="gt_row gt_left">grp_a</td></tr>
          <tr><th id="stub_1_3" scope="row" class="gt_row gt_left gt_stub">row_3</th>
      <td headers="stub_1_3 num" class="gt_row gt_right">3.333e+01</td>
      <td headers="stub_1_3 char" class="gt_row gt_left">coconut</td>
      <td headers="stub_1_3 fctr" class="gt_row gt_center">three</td>
      <td headers="stub_1_3 date" class="gt_row gt_right">2015-03-15</td>
      <td headers="stub_1_3 time" class="gt_row gt_right">15:45</td>
      <td headers="stub_1_3 datetime" class="gt_row gt_right">2018-03-03 03:44</td>
      <td headers="stub_1_3 currency" class="gt_row gt_right">1.390</td>
      <td headers="stub_1_3 group" class="gt_row gt_left">grp_a</td></tr>
          <tr><th id="stub_1_4" scope="row" class="gt_row gt_left gt_stub">row_4</th>
      <td headers="stub_1_4 num" class="gt_row gt_right">4.444e+02</td>
      <td headers="stub_1_4 char" class="gt_row gt_left">durian</td>
      <td headers="stub_1_4 fctr" class="gt_row gt_center">four</td>
      <td headers="stub_1_4 date" class="gt_row gt_right">2015-04-15</td>
      <td headers="stub_1_4 time" class="gt_row gt_right">16:50</td>
      <td headers="stub_1_4 datetime" class="gt_row gt_right">2018-04-04 15:55</td>
      <td headers="stub_1_4 currency" class="gt_row gt_right">65100.000</td>
      <td headers="stub_1_4 group" class="gt_row gt_left">grp_a</td></tr>
          <tr><th id="stub_1_5" scope="row" class="gt_row gt_left gt_stub">row_5</th>
      <td headers="stub_1_5 num" class="gt_row gt_right">5.550e+03</td>
      <td headers="stub_1_5 char" class="gt_row gt_left">NA</td>
      <td headers="stub_1_5 fctr" class="gt_row gt_center">five</td>
      <td headers="stub_1_5 date" class="gt_row gt_right">2015-05-15</td>
      <td headers="stub_1_5 time" class="gt_row gt_right">17:55</td>
      <td headers="stub_1_5 datetime" class="gt_row gt_right">2018-05-05 04:00</td>
      <td headers="stub_1_5 currency" class="gt_row gt_right">1325.810</td>
      <td headers="stub_1_5 group" class="gt_row gt_left">grp_b</td></tr>
          <tr><th id="stub_1_6" scope="row" class="gt_row gt_left gt_stub">row_6</th>
      <td headers="stub_1_6 num" class="gt_row gt_right">NA</td>
      <td headers="stub_1_6 char" class="gt_row gt_left">fig</td>
      <td headers="stub_1_6 fctr" class="gt_row gt_center">six</td>
      <td headers="stub_1_6 date" class="gt_row gt_right">2015-06-15</td>
      <td headers="stub_1_6 time" class="gt_row gt_right">NA</td>
      <td headers="stub_1_6 datetime" class="gt_row gt_right">2018-06-06 16:11</td>
      <td headers="stub_1_6 currency" class="gt_row gt_right">13.255</td>
      <td headers="stub_1_6 group" class="gt_row gt_left">grp_b</td></tr>
          <tr><th id="stub_1_7" scope="row" class="gt_row gt_left gt_stub">row_7</th>
      <td headers="stub_1_7 num" class="gt_row gt_right">7.770e+05</td>
      <td headers="stub_1_7 char" class="gt_row gt_left">grapefruit</td>
      <td headers="stub_1_7 fctr" class="gt_row gt_center">seven</td>
      <td headers="stub_1_7 date" class="gt_row gt_right">NA</td>
      <td headers="stub_1_7 time" class="gt_row gt_right">19:10</td>
      <td headers="stub_1_7 datetime" class="gt_row gt_right">2018-07-07 05:22</td>
      <td headers="stub_1_7 currency" class="gt_row gt_right">NA</td>
      <td headers="stub_1_7 group" class="gt_row gt_left">grp_b</td></tr>
          <tr><th id="stub_1_8" scope="row" class="gt_row gt_left gt_stub">row_8</th>
      <td headers="stub_1_8 num" class="gt_row gt_right">8.880e+06</td>
      <td headers="stub_1_8 char" class="gt_row gt_left">honeydew</td>
      <td headers="stub_1_8 fctr" class="gt_row gt_center">eight</td>
      <td headers="stub_1_8 date" class="gt_row gt_right">2015-08-15</td>
      <td headers="stub_1_8 time" class="gt_row gt_right">20:20</td>
      <td headers="stub_1_8 datetime" class="gt_row gt_right">NA</td>
      <td headers="stub_1_8 currency" class="gt_row gt_right">0.440</td>
      <td headers="stub_1_8 group" class="gt_row gt_left">grp_b</td></tr>
          <tr><th id="grand_summary_stub_1" scope="row" class="gt_row gt_left gt_stub gt_grand_summary_row gt_first_grand_summary_row">min</th>
      <td headers="grand_summary_stub_1 num" class="gt_row gt_right gt_grand_summary_row gt_first_grand_summary_row">0.11</td>
      <td headers="grand_summary_stub_1 char" class="gt_row gt_left gt_grand_summary_row gt_first_grand_summary_row">—</td>
      <td headers="grand_summary_stub_1 fctr" class="gt_row gt_center gt_grand_summary_row gt_first_grand_summary_row">—</td>
      <td headers="grand_summary_stub_1 date" class="gt_row gt_right gt_grand_summary_row gt_first_grand_summary_row">—</td>
      <td headers="grand_summary_stub_1 time" class="gt_row gt_right gt_grand_summary_row gt_first_grand_summary_row">—</td>
      <td headers="grand_summary_stub_1 datetime" class="gt_row gt_right gt_grand_summary_row gt_first_grand_summary_row">—</td>
      <td headers="grand_summary_stub_1 currency" class="gt_row gt_right gt_grand_summary_row gt_first_grand_summary_row">0.44</td>
      <td headers="grand_summary_stub_1 group" class="gt_row gt_left gt_grand_summary_row gt_first_grand_summary_row">—</td></tr>
          <tr><th id="grand_summary_stub_2" scope="row" class="gt_row gt_left gt_stub gt_grand_summary_row">max</th>
      <td headers="grand_summary_stub_2 num" class="gt_row gt_right gt_grand_summary_row">8,880,000.00</td>
      <td headers="grand_summary_stub_2 char" class="gt_row gt_left gt_grand_summary_row">—</td>
      <td headers="grand_summary_stub_2 fctr" class="gt_row gt_center gt_grand_summary_row">—</td>
      <td headers="grand_summary_stub_2 date" class="gt_row gt_right gt_grand_summary_row">—</td>
      <td headers="grand_summary_stub_2 time" class="gt_row gt_right gt_grand_summary_row">—</td>
      <td headers="grand_summary_stub_2 datetime" class="gt_row gt_right gt_grand_summary_row">—</td>
      <td headers="grand_summary_stub_2 currency" class="gt_row gt_right gt_grand_summary_row">65,100.00</td>
      <td headers="grand_summary_stub_2 group" class="gt_row gt_left gt_grand_summary_row">—</td></tr>
          <tr><th id="grand_summary_stub_3" scope="row" class="gt_row gt_left gt_stub gt_grand_summary_row gt_last_summary_row">avg</th>
      <td headers="grand_summary_stub_3 num" class="gt_row gt_right gt_grand_summary_row gt_last_summary_row">1,380,432.87</td>
      <td headers="grand_summary_stub_3 char" class="gt_row gt_left gt_grand_summary_row gt_last_summary_row">—</td>
      <td headers="grand_summary_stub_3 fctr" class="gt_row gt_center gt_grand_summary_row gt_last_summary_row">—</td>
      <td headers="grand_summary_stub_3 date" class="gt_row gt_right gt_grand_summary_row gt_last_summary_row">—</td>
      <td headers="grand_summary_stub_3 time" class="gt_row gt_right gt_grand_summary_row gt_last_summary_row">—</td>
      <td headers="grand_summary_stub_3 datetime" class="gt_row gt_right gt_grand_summary_row gt_last_summary_row">—</td>
      <td headers="grand_summary_stub_3 currency" class="gt_row gt_right gt_grand_summary_row gt_last_summary_row">9,501.26</td>
      <td headers="grand_summary_stub_3 group" class="gt_row gt_left gt_grand_summary_row gt_last_summary_row">—</td></tr>
        </tbody>
        
      </table>

---

    Code
      as.character(as_latex(gt_tbl))
    Output
      [1] "\\begingroup\n\\fontsize{12.0pt}{14.0pt}\\selectfont\n\\begin{longtable}{l|rlcrrrrl}\n\\toprule\n & num & char & fctr & date & time & datetime & currency & group \\\\ \n\\midrule\\addlinespace[2.5pt]\nrow\\_1 & 1.111e-01 & apricot & one & 2015-01-15 & 13:35 & 2018-01-01 02:22 & 49.950 & grp\\_a \\\\ \nrow\\_2 & 2.222e+00 & banana & two & 2015-02-15 & 14:40 & 2018-02-02 14:33 & 17.950 & grp\\_a \\\\ \nrow\\_3 & 3.333e+01 & coconut & three & 2015-03-15 & 15:45 & 2018-03-03 03:44 & 1.390 & grp\\_a \\\\ \nrow\\_4 & 4.444e+02 & durian & four & 2015-04-15 & 16:50 & 2018-04-04 15:55 & 65100.000 & grp\\_a \\\\ \nrow\\_5 & 5.550e+03 & NA & five & 2015-05-15 & 17:55 & 2018-05-05 04:00 & 1325.810 & grp\\_b \\\\ \nrow\\_6 & NA & fig & six & 2015-06-15 & NA & 2018-06-06 16:11 & 13.255 & grp\\_b \\\\ \nrow\\_7 & 7.770e+05 & grapefruit & seven & NA & 19:10 & 2018-07-07 05:22 & NA & grp\\_b \\\\ \nrow\\_8 & 8.880e+06 & honeydew & eight & 2015-08-15 & 20:20 & NA & 0.440 & grp\\_b \\\\ \n\\midrule \n\\midrule \nmin & 0.11 & — & — & — & — & — & 0.44 & — \\\\ \nmax & 8,880,000.00 & — & — & — & — & — & 65,100.00 & — \\\\ \navg & 1,380,432.87 & — & — & — & — & — & 9,501.26 & — \\\\ \n\\bottomrule\n\\end{longtable}\n\\endgroup\n"

---

    Code
      as_rtf(gt_tbl)
    Output
      {\rtf\ansi\ansicpg1252{\fonttbl{\f0\froman\fcharset0\fprq0 Courier New;}{\f1\froman\fcharset0\fprq0 Times;}}{\colortbl;\red211\green211\blue211;}
      
      \paperw12240\paperh15840\widowctrl\ftnbj\fet0\sectd\linex0
      \lndscpsxn
      \margl1440\margr1440\margt1440\margb1440
      \headery720\footery720\fs20
      
      \trowd\trrh0\trhdr
      
      \pard\plain\uc0\ql\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85\clbrdrb\brdrs\brdrw20\brdrcf1 \cellx1040
      \intbl {\f0 {\f0\fs20 }}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85\clbrdrb\brdrs\brdrw20\brdrcf1 \cellx2080
      \intbl {\f0 {\f0\fs20 num}}\cell
      
      \pard\plain\uc0\ql\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85\clbrdrb\brdrs\brdrw20\brdrcf1 \cellx3120
      \intbl {\f0 {\f0\fs20 char}}\cell
      
      \pard\plain\uc0\qc\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85\clbrdrb\brdrs\brdrw20\brdrcf1 \cellx4160
      \intbl {\f0 {\f0\fs20 fctr}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85\clbrdrb\brdrs\brdrw20\brdrcf1 \cellx5200
      \intbl {\f0 {\f0\fs20 date}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85\clbrdrb\brdrs\brdrw20\brdrcf1 \cellx6240
      \intbl {\f0 {\f0\fs20 time}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85\clbrdrb\brdrs\brdrw20\brdrcf1 \cellx7280
      \intbl {\f0 {\f0\fs20 datetime}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85\clbrdrb\brdrs\brdrw20\brdrcf1 \cellx8320
      \intbl {\f0 {\f0\fs20 currency}}\cell
      
      \pard\plain\uc0\ql\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85\clbrdrb\brdrs\brdrw20\brdrcf1 \cellx9360
      \intbl {\f0 {\f0\fs20 group}}\cell
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\ql\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx1040
      \intbl {\f0 {\f0\fs20 row_1}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx2080
      \intbl {\f0 {\f0\fs20 1.111e-01}}\cell
      
      \pard\plain\uc0\ql\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx3120
      \intbl {\f0 {\f0\fs20 apricot}}\cell
      
      \pard\plain\uc0\qc\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx4160
      \intbl {\f0 {\f0\fs20 one}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx5200
      \intbl {\f0 {\f0\fs20 2015-01-15}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx6240
      \intbl {\f0 {\f0\fs20 13:35}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx7280
      \intbl {\f0 {\f0\fs20 2018-01-01 02:22}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx8320
      \intbl {\f0 {\f0\fs20 49.950}}\cell
      
      \pard\plain\uc0\ql\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx9360
      \intbl {\f0 {\f0\fs20 grp_a}}\cell
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\ql\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx1040
      \intbl {\f0 {\f0\fs20 row_2}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx2080
      \intbl {\f0 {\f0\fs20 2.222e+00}}\cell
      
      \pard\plain\uc0\ql\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx3120
      \intbl {\f0 {\f0\fs20 banana}}\cell
      
      \pard\plain\uc0\qc\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx4160
      \intbl {\f0 {\f0\fs20 two}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx5200
      \intbl {\f0 {\f0\fs20 2015-02-15}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx6240
      \intbl {\f0 {\f0\fs20 14:40}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx7280
      \intbl {\f0 {\f0\fs20 2018-02-02 14:33}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx8320
      \intbl {\f0 {\f0\fs20 17.950}}\cell
      
      \pard\plain\uc0\ql\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx9360
      \intbl {\f0 {\f0\fs20 grp_a}}\cell
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\ql\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx1040
      \intbl {\f0 {\f0\fs20 row_3}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx2080
      \intbl {\f0 {\f0\fs20 3.333e+01}}\cell
      
      \pard\plain\uc0\ql\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx3120
      \intbl {\f0 {\f0\fs20 coconut}}\cell
      
      \pard\plain\uc0\qc\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx4160
      \intbl {\f0 {\f0\fs20 three}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx5200
      \intbl {\f0 {\f0\fs20 2015-03-15}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx6240
      \intbl {\f0 {\f0\fs20 15:45}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx7280
      \intbl {\f0 {\f0\fs20 2018-03-03 03:44}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx8320
      \intbl {\f0 {\f0\fs20 1.390}}\cell
      
      \pard\plain\uc0\ql\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx9360
      \intbl {\f0 {\f0\fs20 grp_a}}\cell
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\ql\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx1040
      \intbl {\f0 {\f0\fs20 row_4}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx2080
      \intbl {\f0 {\f0\fs20 4.444e+02}}\cell
      
      \pard\plain\uc0\ql\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx3120
      \intbl {\f0 {\f0\fs20 durian}}\cell
      
      \pard\plain\uc0\qc\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx4160
      \intbl {\f0 {\f0\fs20 four}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx5200
      \intbl {\f0 {\f0\fs20 2015-04-15}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx6240
      \intbl {\f0 {\f0\fs20 16:50}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx7280
      \intbl {\f0 {\f0\fs20 2018-04-04 15:55}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx8320
      \intbl {\f0 {\f0\fs20 65100.000}}\cell
      
      \pard\plain\uc0\ql\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx9360
      \intbl {\f0 {\f0\fs20 grp_a}}\cell
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\ql\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx1040
      \intbl {\f0 {\f0\fs20 row_5}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx2080
      \intbl {\f0 {\f0\fs20 5.550e+03}}\cell
      
      \pard\plain\uc0\ql\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx3120
      \intbl {\f0 {\f0\fs20 NA}}\cell
      
      \pard\plain\uc0\qc\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx4160
      \intbl {\f0 {\f0\fs20 five}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx5200
      \intbl {\f0 {\f0\fs20 2015-05-15}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx6240
      \intbl {\f0 {\f0\fs20 17:55}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx7280
      \intbl {\f0 {\f0\fs20 2018-05-05 04:00}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx8320
      \intbl {\f0 {\f0\fs20 1325.810}}\cell
      
      \pard\plain\uc0\ql\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx9360
      \intbl {\f0 {\f0\fs20 grp_b}}\cell
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\ql\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx1040
      \intbl {\f0 {\f0\fs20 row_6}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx2080
      \intbl {\f0 {\f0\fs20 NA}}\cell
      
      \pard\plain\uc0\ql\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx3120
      \intbl {\f0 {\f0\fs20 fig}}\cell
      
      \pard\plain\uc0\qc\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx4160
      \intbl {\f0 {\f0\fs20 six}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx5200
      \intbl {\f0 {\f0\fs20 2015-06-15}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx6240
      \intbl {\f0 {\f0\fs20 NA}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx7280
      \intbl {\f0 {\f0\fs20 2018-06-06 16:11}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx8320
      \intbl {\f0 {\f0\fs20 13.255}}\cell
      
      \pard\plain\uc0\ql\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx9360
      \intbl {\f0 {\f0\fs20 grp_b}}\cell
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\ql\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx1040
      \intbl {\f0 {\f0\fs20 row_7}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx2080
      \intbl {\f0 {\f0\fs20 7.770e+05}}\cell
      
      \pard\plain\uc0\ql\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx3120
      \intbl {\f0 {\f0\fs20 grapefruit}}\cell
      
      \pard\plain\uc0\qc\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx4160
      \intbl {\f0 {\f0\fs20 seven}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx5200
      \intbl {\f0 {\f0\fs20 NA}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx6240
      \intbl {\f0 {\f0\fs20 19:10}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx7280
      \intbl {\f0 {\f0\fs20 2018-07-07 05:22}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx8320
      \intbl {\f0 {\f0\fs20 NA}}\cell
      
      \pard\plain\uc0\ql\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx9360
      \intbl {\f0 {\f0\fs20 grp_b}}\cell
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\ql\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx1040
      \intbl {\f0 {\f0\fs20 row_8}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx2080
      \intbl {\f0 {\f0\fs20 8.880e+06}}\cell
      
      \pard\plain\uc0\ql\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx3120
      \intbl {\f0 {\f0\fs20 honeydew}}\cell
      
      \pard\plain\uc0\qc\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx4160
      \intbl {\f0 {\f0\fs20 eight}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx5200
      \intbl {\f0 {\f0\fs20 2015-08-15}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx6240
      \intbl {\f0 {\f0\fs20 20:20}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx7280
      \intbl {\f0 {\f0\fs20 NA}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx8320
      \intbl {\f0 {\f0\fs20 0.440}}\cell
      
      \pard\plain\uc0\ql\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx9360
      \intbl {\f0 {\f0\fs20 grp_b}}\cell
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\ql\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx1040
      \intbl {\f0 {\f0\fs20 min}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx2080
      \intbl {\f0 {\f0\fs20 0.11}}\cell
      
      \pard\plain\uc0\ql\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx3120
      \intbl {\f0 {\f0\fs20 \'97}}\cell
      
      \pard\plain\uc0\qc\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx4160
      \intbl {\f0 {\f0\fs20 \'97}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx5200
      \intbl {\f0 {\f0\fs20 \'97}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx6240
      \intbl {\f0 {\f0\fs20 \'97}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx7280
      \intbl {\f0 {\f0\fs20 \'97}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx8320
      \intbl {\f0 {\f0\fs20 0.44}}\cell
      
      \pard\plain\uc0\ql\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx9360
      \intbl {\f0 {\f0\fs20 \'97}}\cell
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\ql\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx1040
      \intbl {\f0 {\f0\fs20 max}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx2080
      \intbl {\f0 {\f0\fs20 8,880,000.00}}\cell
      
      \pard\plain\uc0\ql\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx3120
      \intbl {\f0 {\f0\fs20 \'97}}\cell
      
      \pard\plain\uc0\qc\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx4160
      \intbl {\f0 {\f0\fs20 \'97}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx5200
      \intbl {\f0 {\f0\fs20 \'97}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx6240
      \intbl {\f0 {\f0\fs20 \'97}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx7280
      \intbl {\f0 {\f0\fs20 \'97}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx8320
      \intbl {\f0 {\f0\fs20 65,100.00}}\cell
      
      \pard\plain\uc0\ql\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx9360
      \intbl {\f0 {\f0\fs20 \'97}}\cell
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\ql\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx1040
      \intbl {\f0 {\f0\fs20 avg}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx2080
      \intbl {\f0 {\f0\fs20 1,380,432.87}}\cell
      
      \pard\plain\uc0\ql\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx3120
      \intbl {\f0 {\f0\fs20 \'97}}\cell
      
      \pard\plain\uc0\qc\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx4160
      \intbl {\f0 {\f0\fs20 \'97}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx5200
      \intbl {\f0 {\f0\fs20 \'97}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx6240
      \intbl {\f0 {\f0\fs20 \'97}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx7280
      \intbl {\f0 {\f0\fs20 \'97}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx8320
      \intbl {\f0 {\f0\fs20 9,501.26}}\cell
      
      \pard\plain\uc0\ql\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx9360
      \intbl {\f0 {\f0\fs20 \'97}}\cell
      
      \row
      
      }

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
          <tr><th id="summary_stub_grp_a_1" scope="row" class="gt_row gt_left gt_stub gt_summary_row gt_first_summary_row thick gt_last_summary_row">median</th>
      <td headers="grp_a summary_stub_grp_a_1 num" class="gt_row gt_right gt_summary_row gt_first_summary_row thick gt_last_summary_row">17.78</td>
      <td headers="grp_a summary_stub_grp_a_1 char" class="gt_row gt_left gt_summary_row gt_first_summary_row thick gt_last_summary_row">—</td>
      <td headers="grp_a summary_stub_grp_a_1 fctr" class="gt_row gt_center gt_summary_row gt_first_summary_row thick gt_last_summary_row">—</td>
      <td headers="grp_a summary_stub_grp_a_1 date" class="gt_row gt_right gt_summary_row gt_first_summary_row thick gt_last_summary_row">—</td>
      <td headers="grp_a summary_stub_grp_a_1 time" class="gt_row gt_right gt_summary_row gt_first_summary_row thick gt_last_summary_row">—</td>
      <td headers="grp_a summary_stub_grp_a_1 datetime" class="gt_row gt_right gt_summary_row gt_first_summary_row thick gt_last_summary_row">—</td>
      <td headers="grp_a summary_stub_grp_a_1 currency" class="gt_row gt_right gt_summary_row gt_first_summary_row thick gt_last_summary_row">33.95</td></tr>
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
          <tr><th id="summary_stub_grp_b_1" scope="row" class="gt_row gt_left gt_stub gt_summary_row gt_first_summary_row thick gt_last_summary_row">median</th>
      <td headers="grp_b summary_stub_grp_b_1 num" class="gt_row gt_right gt_summary_row gt_first_summary_row thick gt_last_summary_row">777,000.00</td>
      <td headers="grp_b summary_stub_grp_b_1 char" class="gt_row gt_left gt_summary_row gt_first_summary_row thick gt_last_summary_row">—</td>
      <td headers="grp_b summary_stub_grp_b_1 fctr" class="gt_row gt_center gt_summary_row gt_first_summary_row thick gt_last_summary_row">—</td>
      <td headers="grp_b summary_stub_grp_b_1 date" class="gt_row gt_right gt_summary_row gt_first_summary_row thick gt_last_summary_row">—</td>
      <td headers="grp_b summary_stub_grp_b_1 time" class="gt_row gt_right gt_summary_row gt_first_summary_row thick gt_last_summary_row">—</td>
      <td headers="grp_b summary_stub_grp_b_1 datetime" class="gt_row gt_right gt_summary_row gt_first_summary_row thick gt_last_summary_row">—</td>
      <td headers="grp_b summary_stub_grp_b_1 currency" class="gt_row gt_right gt_summary_row gt_first_summary_row thick gt_last_summary_row">13.26</td></tr>
          <tr><th id="grand_summary_stub_1" scope="row" class="gt_row gt_left gt_stub gt_grand_summary_row gt_first_grand_summary_row">min</th>
      <td headers="grand_summary_stub_1 num" class="gt_row gt_right gt_grand_summary_row gt_first_grand_summary_row">0.11</td>
      <td headers="grand_summary_stub_1 char" class="gt_row gt_left gt_grand_summary_row gt_first_grand_summary_row">—</td>
      <td headers="grand_summary_stub_1 fctr" class="gt_row gt_center gt_grand_summary_row gt_first_grand_summary_row">—</td>
      <td headers="grand_summary_stub_1 date" class="gt_row gt_right gt_grand_summary_row gt_first_grand_summary_row">—</td>
      <td headers="grand_summary_stub_1 time" class="gt_row gt_right gt_grand_summary_row gt_first_grand_summary_row">—</td>
      <td headers="grand_summary_stub_1 datetime" class="gt_row gt_right gt_grand_summary_row gt_first_grand_summary_row">—</td>
      <td headers="grand_summary_stub_1 currency" class="gt_row gt_right gt_grand_summary_row gt_first_grand_summary_row">0.44</td></tr>
          <tr><th id="grand_summary_stub_2" scope="row" class="gt_row gt_left gt_stub gt_grand_summary_row">max</th>
      <td headers="grand_summary_stub_2 num" class="gt_row gt_right gt_grand_summary_row">8,880,000.00</td>
      <td headers="grand_summary_stub_2 char" class="gt_row gt_left gt_grand_summary_row">—</td>
      <td headers="grand_summary_stub_2 fctr" class="gt_row gt_center gt_grand_summary_row">—</td>
      <td headers="grand_summary_stub_2 date" class="gt_row gt_right gt_grand_summary_row">—</td>
      <td headers="grand_summary_stub_2 time" class="gt_row gt_right gt_grand_summary_row">—</td>
      <td headers="grand_summary_stub_2 datetime" class="gt_row gt_right gt_grand_summary_row">—</td>
      <td headers="grand_summary_stub_2 currency" class="gt_row gt_right gt_grand_summary_row">65,100.00</td></tr>
          <tr><th id="grand_summary_stub_3" scope="row" class="gt_row gt_left gt_stub gt_grand_summary_row gt_last_summary_row">avg</th>
      <td headers="grand_summary_stub_3 num" class="gt_row gt_right gt_grand_summary_row gt_last_summary_row">1,380,432.87</td>
      <td headers="grand_summary_stub_3 char" class="gt_row gt_left gt_grand_summary_row gt_last_summary_row">—</td>
      <td headers="grand_summary_stub_3 fctr" class="gt_row gt_center gt_grand_summary_row gt_last_summary_row">—</td>
      <td headers="grand_summary_stub_3 date" class="gt_row gt_right gt_grand_summary_row gt_last_summary_row">—</td>
      <td headers="grand_summary_stub_3 time" class="gt_row gt_right gt_grand_summary_row gt_last_summary_row">—</td>
      <td headers="grand_summary_stub_3 datetime" class="gt_row gt_right gt_grand_summary_row gt_last_summary_row">—</td>
      <td headers="grand_summary_stub_3 currency" class="gt_row gt_right gt_grand_summary_row gt_last_summary_row">9,501.26</td></tr>
        </tbody>
        
      </table>

---

    Code
      as.character(as_latex(gt_tbl))
    Output
      [1] "\\begingroup\n\\fontsize{12.0pt}{14.0pt}\\selectfont\n\\begin{longtable}{l|rlcrrrr}\n\\toprule\n & num & char & fctr & date & time & datetime & currency \\\\ \n\\midrule\\addlinespace[2.5pt]\n\\multicolumn{8}{l}{grp\\_a} \\\\[2.5pt] \n\\midrule\\addlinespace[2.5pt]\nrow\\_1 & 1.111e-01 & apricot & one & 2015-01-15 & 13:35 & 2018-01-01 02:22 & 49.950 \\\\ \nrow\\_2 & 2.222e+00 & banana & two & 2015-02-15 & 14:40 & 2018-02-02 14:33 & 17.950 \\\\ \nrow\\_3 & 3.333e+01 & coconut & three & 2015-03-15 & 15:45 & 2018-03-03 03:44 & 1.390 \\\\ \nrow\\_4 & 4.444e+02 & durian & four & 2015-04-15 & 16:50 & 2018-04-04 15:55 & 65100.000 \\\\ \n\\midrule \nmedian & 17.78 & — & — & — & — & — & 33.95 \\\\ \n\\midrule\\addlinespace[2.5pt]\n\\multicolumn{8}{l}{grp\\_b} \\\\[2.5pt] \n\\midrule\\addlinespace[2.5pt]\nrow\\_5 & 5.550e+03 & NA & five & 2015-05-15 & 17:55 & 2018-05-05 04:00 & 1325.810 \\\\ \nrow\\_6 & NA & fig & six & 2015-06-15 & NA & 2018-06-06 16:11 & 13.255 \\\\ \nrow\\_7 & 7.770e+05 & grapefruit & seven & NA & 19:10 & 2018-07-07 05:22 & NA \\\\ \nrow\\_8 & 8.880e+06 & honeydew & eight & 2015-08-15 & 20:20 & NA & 0.440 \\\\ \n\\midrule \nmedian & 777,000.00 & — & — & — & — & — & 13.26 \\\\ \n\\midrule \n\\midrule \nmin & 0.11 & — & — & — & — & — & 0.44 \\\\ \nmax & 8,880,000.00 & — & — & — & — & — & 65,100.00 \\\\ \navg & 1,380,432.87 & — & — & — & — & — & 9,501.26 \\\\ \n\\bottomrule\n\\end{longtable}\n\\endgroup\n"

---

    Code
      as_rtf(gt_tbl)
    Output
      {\rtf\ansi\ansicpg1252{\fonttbl{\f0\froman\fcharset0\fprq0 Courier New;}{\f1\froman\fcharset0\fprq0 Times;}}{\colortbl;\red211\green211\blue211;}
      
      \paperw12240\paperh15840\widowctrl\ftnbj\fet0\sectd\linex0
      \lndscpsxn
      \margl1440\margr1440\margt1440\margb1440
      \headery720\footery720\fs20
      
      \trowd\trrh0\trhdr
      
      \pard\plain\uc0\ql\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85\clbrdrb\brdrs\brdrw20\brdrcf1 \cellx1170
      \intbl {\f0 {\f0\fs20 }}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85\clbrdrb\brdrs\brdrw20\brdrcf1 \cellx2340
      \intbl {\f0 {\f0\fs20 num}}\cell
      
      \pard\plain\uc0\ql\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85\clbrdrb\brdrs\brdrw20\brdrcf1 \cellx3510
      \intbl {\f0 {\f0\fs20 char}}\cell
      
      \pard\plain\uc0\qc\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85\clbrdrb\brdrs\brdrw20\brdrcf1 \cellx4680
      \intbl {\f0 {\f0\fs20 fctr}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85\clbrdrb\brdrs\brdrw20\brdrcf1 \cellx5850
      \intbl {\f0 {\f0\fs20 date}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85\clbrdrb\brdrs\brdrw20\brdrcf1 \cellx7020
      \intbl {\f0 {\f0\fs20 time}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85\clbrdrb\brdrs\brdrw20\brdrcf1 \cellx8190
      \intbl {\f0 {\f0\fs20 datetime}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85\clbrdrb\brdrs\brdrw20\brdrcf1 \cellx9360
      \intbl {\f0 {\f0\fs20 currency}}\cell
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\ql\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx9360
      \intbl {\f0\fs20 grp_a}\cell
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\ql\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx1170
      \intbl {\f0 {\f0\fs20 row_1}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx2340
      \intbl {\f0 {\f0\fs20 1.111e-01}}\cell
      
      \pard\plain\uc0\ql\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx3510
      \intbl {\f0 {\f0\fs20 apricot}}\cell
      
      \pard\plain\uc0\qc\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx4680
      \intbl {\f0 {\f0\fs20 one}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx5850
      \intbl {\f0 {\f0\fs20 2015-01-15}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx7020
      \intbl {\f0 {\f0\fs20 13:35}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx8190
      \intbl {\f0 {\f0\fs20 2018-01-01 02:22}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx9360
      \intbl {\f0 {\f0\fs20 49.950}}\cell
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\ql\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx1170
      \intbl {\f0 {\f0\fs20 row_2}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx2340
      \intbl {\f0 {\f0\fs20 2.222e+00}}\cell
      
      \pard\plain\uc0\ql\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx3510
      \intbl {\f0 {\f0\fs20 banana}}\cell
      
      \pard\plain\uc0\qc\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx4680
      \intbl {\f0 {\f0\fs20 two}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx5850
      \intbl {\f0 {\f0\fs20 2015-02-15}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx7020
      \intbl {\f0 {\f0\fs20 14:40}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx8190
      \intbl {\f0 {\f0\fs20 2018-02-02 14:33}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx9360
      \intbl {\f0 {\f0\fs20 17.950}}\cell
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\ql\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx1170
      \intbl {\f0 {\f0\fs20 row_3}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx2340
      \intbl {\f0 {\f0\fs20 3.333e+01}}\cell
      
      \pard\plain\uc0\ql\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx3510
      \intbl {\f0 {\f0\fs20 coconut}}\cell
      
      \pard\plain\uc0\qc\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx4680
      \intbl {\f0 {\f0\fs20 three}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx5850
      \intbl {\f0 {\f0\fs20 2015-03-15}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx7020
      \intbl {\f0 {\f0\fs20 15:45}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx8190
      \intbl {\f0 {\f0\fs20 2018-03-03 03:44}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx9360
      \intbl {\f0 {\f0\fs20 1.390}}\cell
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\ql\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx1170
      \intbl {\f0 {\f0\fs20 row_4}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx2340
      \intbl {\f0 {\f0\fs20 4.444e+02}}\cell
      
      \pard\plain\uc0\ql\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx3510
      \intbl {\f0 {\f0\fs20 durian}}\cell
      
      \pard\plain\uc0\qc\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx4680
      \intbl {\f0 {\f0\fs20 four}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx5850
      \intbl {\f0 {\f0\fs20 2015-04-15}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx7020
      \intbl {\f0 {\f0\fs20 16:50}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx8190
      \intbl {\f0 {\f0\fs20 2018-04-04 15:55}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx9360
      \intbl {\f0 {\f0\fs20 65100.000}}\cell
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\ql\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx1170
      \intbl {\f0 {\f0\fs20 median}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx2340
      \intbl {\f0 {\f0\fs20 17.78}}\cell
      
      \pard\plain\uc0\ql\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx3510
      \intbl {\f0 {\f0\fs20 \'97}}\cell
      
      \pard\plain\uc0\qc\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx4680
      \intbl {\f0 {\f0\fs20 \'97}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx5850
      \intbl {\f0 {\f0\fs20 \'97}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx7020
      \intbl {\f0 {\f0\fs20 \'97}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx8190
      \intbl {\f0 {\f0\fs20 \'97}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx9360
      \intbl {\f0 {\f0\fs20 33.95}}\cell
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\ql\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx9360
      \intbl {\f0\fs20 grp_b}\cell
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\ql\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx1170
      \intbl {\f0 {\f0\fs20 row_5}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx2340
      \intbl {\f0 {\f0\fs20 5.550e+03}}\cell
      
      \pard\plain\uc0\ql\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx3510
      \intbl {\f0 {\f0\fs20 NA}}\cell
      
      \pard\plain\uc0\qc\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx4680
      \intbl {\f0 {\f0\fs20 five}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx5850
      \intbl {\f0 {\f0\fs20 2015-05-15}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx7020
      \intbl {\f0 {\f0\fs20 17:55}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx8190
      \intbl {\f0 {\f0\fs20 2018-05-05 04:00}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx9360
      \intbl {\f0 {\f0\fs20 1325.810}}\cell
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\ql\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx1170
      \intbl {\f0 {\f0\fs20 row_6}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx2340
      \intbl {\f0 {\f0\fs20 NA}}\cell
      
      \pard\plain\uc0\ql\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx3510
      \intbl {\f0 {\f0\fs20 fig}}\cell
      
      \pard\plain\uc0\qc\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx4680
      \intbl {\f0 {\f0\fs20 six}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx5850
      \intbl {\f0 {\f0\fs20 2015-06-15}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx7020
      \intbl {\f0 {\f0\fs20 NA}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx8190
      \intbl {\f0 {\f0\fs20 2018-06-06 16:11}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx9360
      \intbl {\f0 {\f0\fs20 13.255}}\cell
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\ql\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx1170
      \intbl {\f0 {\f0\fs20 row_7}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx2340
      \intbl {\f0 {\f0\fs20 7.770e+05}}\cell
      
      \pard\plain\uc0\ql\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx3510
      \intbl {\f0 {\f0\fs20 grapefruit}}\cell
      
      \pard\plain\uc0\qc\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx4680
      \intbl {\f0 {\f0\fs20 seven}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx5850
      \intbl {\f0 {\f0\fs20 NA}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx7020
      \intbl {\f0 {\f0\fs20 19:10}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx8190
      \intbl {\f0 {\f0\fs20 2018-07-07 05:22}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx9360
      \intbl {\f0 {\f0\fs20 NA}}\cell
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\ql\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx1170
      \intbl {\f0 {\f0\fs20 row_8}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx2340
      \intbl {\f0 {\f0\fs20 8.880e+06}}\cell
      
      \pard\plain\uc0\ql\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx3510
      \intbl {\f0 {\f0\fs20 honeydew}}\cell
      
      \pard\plain\uc0\qc\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx4680
      \intbl {\f0 {\f0\fs20 eight}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx5850
      \intbl {\f0 {\f0\fs20 2015-08-15}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx7020
      \intbl {\f0 {\f0\fs20 20:20}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx8190
      \intbl {\f0 {\f0\fs20 NA}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx9360
      \intbl {\f0 {\f0\fs20 0.440}}\cell
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\ql\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx1170
      \intbl {\f0 {\f0\fs20 median}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx2340
      \intbl {\f0 {\f0\fs20 777,000.00}}\cell
      
      \pard\plain\uc0\ql\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx3510
      \intbl {\f0 {\f0\fs20 \'97}}\cell
      
      \pard\plain\uc0\qc\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx4680
      \intbl {\f0 {\f0\fs20 \'97}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx5850
      \intbl {\f0 {\f0\fs20 \'97}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx7020
      \intbl {\f0 {\f0\fs20 \'97}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx8190
      \intbl {\f0 {\f0\fs20 \'97}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx9360
      \intbl {\f0 {\f0\fs20 13.26}}\cell
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\ql\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx1170
      \intbl {\f0 {\f0\fs20 min}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx2340
      \intbl {\f0 {\f0\fs20 0.11}}\cell
      
      \pard\plain\uc0\ql\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx3510
      \intbl {\f0 {\f0\fs20 \'97}}\cell
      
      \pard\plain\uc0\qc\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx4680
      \intbl {\f0 {\f0\fs20 \'97}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx5850
      \intbl {\f0 {\f0\fs20 \'97}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx7020
      \intbl {\f0 {\f0\fs20 \'97}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx8190
      \intbl {\f0 {\f0\fs20 \'97}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx9360
      \intbl {\f0 {\f0\fs20 0.44}}\cell
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\ql\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx1170
      \intbl {\f0 {\f0\fs20 max}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx2340
      \intbl {\f0 {\f0\fs20 8,880,000.00}}\cell
      
      \pard\plain\uc0\ql\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx3510
      \intbl {\f0 {\f0\fs20 \'97}}\cell
      
      \pard\plain\uc0\qc\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx4680
      \intbl {\f0 {\f0\fs20 \'97}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx5850
      \intbl {\f0 {\f0\fs20 \'97}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx7020
      \intbl {\f0 {\f0\fs20 \'97}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx8190
      \intbl {\f0 {\f0\fs20 \'97}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx9360
      \intbl {\f0 {\f0\fs20 65,100.00}}\cell
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\ql\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx1170
      \intbl {\f0 {\f0\fs20 avg}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx2340
      \intbl {\f0 {\f0\fs20 1,380,432.87}}\cell
      
      \pard\plain\uc0\ql\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx3510
      \intbl {\f0 {\f0\fs20 \'97}}\cell
      
      \pard\plain\uc0\qc\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx4680
      \intbl {\f0 {\f0\fs20 \'97}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx5850
      \intbl {\f0 {\f0\fs20 \'97}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx7020
      \intbl {\f0 {\f0\fs20 \'97}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx8190
      \intbl {\f0 {\f0\fs20 \'97}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx9360
      \intbl {\f0 {\f0\fs20 9,501.26}}\cell
      
      \row
      
      }

---

    Code
      cat(render_as_html(gt_tbl))
    Output
      <table class="gt_table" data-quarto-disable-processing="false" data-quarto-bootstrap="false">
        <thead>
          <tr class="gt_col_headings">
            <th class="gt_col_heading gt_columns_bottom_border gt_left" rowspan="1" colspan="1" scope="col" id="a::stub"></th>
            <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id="num">num</th>
            <th class="gt_col_heading gt_columns_bottom_border gt_center" rowspan="1" colspan="1" scope="col" id="fctr">fctr</th>
            <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id="date">date</th>
            <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id="time">time</th>
            <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id="datetime">datetime</th>
            <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id="currency">currency</th>
            <th class="gt_col_heading gt_columns_bottom_border gt_left" rowspan="1" colspan="1" scope="col" id="rowname">rowname</th>
            <th class="gt_col_heading gt_columns_bottom_border gt_left" rowspan="1" colspan="1" scope="col" id="group">group</th>
          </tr>
        </thead>
        <tbody class="gt_table_body">
          <tr><th id="stub_1_1" scope="row" class="gt_row gt_left gt_stub">apricot</th>
      <td headers="stub_1_1 num" class="gt_row gt_right">1.111e-01</td>
      <td headers="stub_1_1 fctr" class="gt_row gt_center">one</td>
      <td headers="stub_1_1 date" class="gt_row gt_right">2015-01-15</td>
      <td headers="stub_1_1 time" class="gt_row gt_right">13:35</td>
      <td headers="stub_1_1 datetime" class="gt_row gt_right">2018-01-01 02:22</td>
      <td headers="stub_1_1 currency" class="gt_row gt_right">49.950</td>
      <td headers="stub_1_1 rowname" class="gt_row gt_left">row_1</td>
      <td headers="stub_1_1 group" class="gt_row gt_left">grp_a</td></tr>
          <tr><th id="stub_1_2" scope="row" class="gt_row gt_left gt_stub">banana</th>
      <td headers="stub_1_2 num" class="gt_row gt_right">2.222e+00</td>
      <td headers="stub_1_2 fctr" class="gt_row gt_center">two</td>
      <td headers="stub_1_2 date" class="gt_row gt_right">2015-02-15</td>
      <td headers="stub_1_2 time" class="gt_row gt_right">14:40</td>
      <td headers="stub_1_2 datetime" class="gt_row gt_right">2018-02-02 14:33</td>
      <td headers="stub_1_2 currency" class="gt_row gt_right">17.950</td>
      <td headers="stub_1_2 rowname" class="gt_row gt_left">row_2</td>
      <td headers="stub_1_2 group" class="gt_row gt_left">grp_a</td></tr>
          <tr><th id="stub_1_3" scope="row" class="gt_row gt_left gt_stub">coconut</th>
      <td headers="stub_1_3 num" class="gt_row gt_right">3.333e+01</td>
      <td headers="stub_1_3 fctr" class="gt_row gt_center">three</td>
      <td headers="stub_1_3 date" class="gt_row gt_right">2015-03-15</td>
      <td headers="stub_1_3 time" class="gt_row gt_right">15:45</td>
      <td headers="stub_1_3 datetime" class="gt_row gt_right">2018-03-03 03:44</td>
      <td headers="stub_1_3 currency" class="gt_row gt_right">1.390</td>
      <td headers="stub_1_3 rowname" class="gt_row gt_left">row_3</td>
      <td headers="stub_1_3 group" class="gt_row gt_left">grp_a</td></tr>
          <tr><th id="stub_1_4" scope="row" class="gt_row gt_left gt_stub">durian</th>
      <td headers="stub_1_4 num" class="gt_row gt_right">4.444e+02</td>
      <td headers="stub_1_4 fctr" class="gt_row gt_center">four</td>
      <td headers="stub_1_4 date" class="gt_row gt_right">2015-04-15</td>
      <td headers="stub_1_4 time" class="gt_row gt_right">16:50</td>
      <td headers="stub_1_4 datetime" class="gt_row gt_right">2018-04-04 15:55</td>
      <td headers="stub_1_4 currency" class="gt_row gt_right">65100.000</td>
      <td headers="stub_1_4 rowname" class="gt_row gt_left">row_4</td>
      <td headers="stub_1_4 group" class="gt_row gt_left">grp_a</td></tr>
          <tr><th id="stub_1_5" scope="row" class="gt_row gt_left gt_stub">NA</th>
      <td headers="stub_1_5 num" class="gt_row gt_right">5.550e+03</td>
      <td headers="stub_1_5 fctr" class="gt_row gt_center">five</td>
      <td headers="stub_1_5 date" class="gt_row gt_right">2015-05-15</td>
      <td headers="stub_1_5 time" class="gt_row gt_right">17:55</td>
      <td headers="stub_1_5 datetime" class="gt_row gt_right">2018-05-05 04:00</td>
      <td headers="stub_1_5 currency" class="gt_row gt_right">1325.810</td>
      <td headers="stub_1_5 rowname" class="gt_row gt_left">row_5</td>
      <td headers="stub_1_5 group" class="gt_row gt_left">grp_b</td></tr>
          <tr><th id="stub_1_6" scope="row" class="gt_row gt_left gt_stub">fig</th>
      <td headers="stub_1_6 num" class="gt_row gt_right">NA</td>
      <td headers="stub_1_6 fctr" class="gt_row gt_center">six</td>
      <td headers="stub_1_6 date" class="gt_row gt_right">2015-06-15</td>
      <td headers="stub_1_6 time" class="gt_row gt_right">NA</td>
      <td headers="stub_1_6 datetime" class="gt_row gt_right">2018-06-06 16:11</td>
      <td headers="stub_1_6 currency" class="gt_row gt_right">13.255</td>
      <td headers="stub_1_6 rowname" class="gt_row gt_left">row_6</td>
      <td headers="stub_1_6 group" class="gt_row gt_left">grp_b</td></tr>
          <tr><th id="stub_1_7" scope="row" class="gt_row gt_left gt_stub">grapefruit</th>
      <td headers="stub_1_7 num" class="gt_row gt_right">7.770e+05</td>
      <td headers="stub_1_7 fctr" class="gt_row gt_center">seven</td>
      <td headers="stub_1_7 date" class="gt_row gt_right">NA</td>
      <td headers="stub_1_7 time" class="gt_row gt_right">19:10</td>
      <td headers="stub_1_7 datetime" class="gt_row gt_right">2018-07-07 05:22</td>
      <td headers="stub_1_7 currency" class="gt_row gt_right">NA</td>
      <td headers="stub_1_7 rowname" class="gt_row gt_left">row_7</td>
      <td headers="stub_1_7 group" class="gt_row gt_left">grp_b</td></tr>
          <tr><th id="stub_1_8" scope="row" class="gt_row gt_left gt_stub">honeydew</th>
      <td headers="stub_1_8 num" class="gt_row gt_right">8.880e+06</td>
      <td headers="stub_1_8 fctr" class="gt_row gt_center">eight</td>
      <td headers="stub_1_8 date" class="gt_row gt_right">2015-08-15</td>
      <td headers="stub_1_8 time" class="gt_row gt_right">20:20</td>
      <td headers="stub_1_8 datetime" class="gt_row gt_right">NA</td>
      <td headers="stub_1_8 currency" class="gt_row gt_right">0.440</td>
      <td headers="stub_1_8 rowname" class="gt_row gt_left">row_8</td>
      <td headers="stub_1_8 group" class="gt_row gt_left">grp_b</td></tr>
          <tr><th id="grand_summary_stub_1" scope="row" class="gt_row gt_left gt_stub gt_grand_summary_row gt_first_grand_summary_row">min</th>
      <td headers="grand_summary_stub_1 num" class="gt_row gt_right gt_grand_summary_row gt_first_grand_summary_row">0.11</td>
      <td headers="grand_summary_stub_1 fctr" class="gt_row gt_center gt_grand_summary_row gt_first_grand_summary_row">—</td>
      <td headers="grand_summary_stub_1 date" class="gt_row gt_right gt_grand_summary_row gt_first_grand_summary_row">—</td>
      <td headers="grand_summary_stub_1 time" class="gt_row gt_right gt_grand_summary_row gt_first_grand_summary_row">—</td>
      <td headers="grand_summary_stub_1 datetime" class="gt_row gt_right gt_grand_summary_row gt_first_grand_summary_row">—</td>
      <td headers="grand_summary_stub_1 currency" class="gt_row gt_right gt_grand_summary_row gt_first_grand_summary_row">0.44</td>
      <td headers="grand_summary_stub_1 rowname" class="gt_row gt_left gt_grand_summary_row gt_first_grand_summary_row">—</td>
      <td headers="grand_summary_stub_1 group" class="gt_row gt_left gt_grand_summary_row gt_first_grand_summary_row">—</td></tr>
          <tr><th id="grand_summary_stub_2" scope="row" class="gt_row gt_left gt_stub gt_grand_summary_row">max</th>
      <td headers="grand_summary_stub_2 num" class="gt_row gt_right gt_grand_summary_row">8,880,000.00</td>
      <td headers="grand_summary_stub_2 fctr" class="gt_row gt_center gt_grand_summary_row">—</td>
      <td headers="grand_summary_stub_2 date" class="gt_row gt_right gt_grand_summary_row">—</td>
      <td headers="grand_summary_stub_2 time" class="gt_row gt_right gt_grand_summary_row">—</td>
      <td headers="grand_summary_stub_2 datetime" class="gt_row gt_right gt_grand_summary_row">—</td>
      <td headers="grand_summary_stub_2 currency" class="gt_row gt_right gt_grand_summary_row">65,100.00</td>
      <td headers="grand_summary_stub_2 rowname" class="gt_row gt_left gt_grand_summary_row">—</td>
      <td headers="grand_summary_stub_2 group" class="gt_row gt_left gt_grand_summary_row">—</td></tr>
          <tr><th id="grand_summary_stub_3" scope="row" class="gt_row gt_left gt_stub gt_grand_summary_row gt_last_summary_row">avg</th>
      <td headers="grand_summary_stub_3 num" class="gt_row gt_right gt_grand_summary_row gt_last_summary_row">1,380,432.87</td>
      <td headers="grand_summary_stub_3 fctr" class="gt_row gt_center gt_grand_summary_row gt_last_summary_row">—</td>
      <td headers="grand_summary_stub_3 date" class="gt_row gt_right gt_grand_summary_row gt_last_summary_row">—</td>
      <td headers="grand_summary_stub_3 time" class="gt_row gt_right gt_grand_summary_row gt_last_summary_row">—</td>
      <td headers="grand_summary_stub_3 datetime" class="gt_row gt_right gt_grand_summary_row gt_last_summary_row">—</td>
      <td headers="grand_summary_stub_3 currency" class="gt_row gt_right gt_grand_summary_row gt_last_summary_row">9,501.26</td>
      <td headers="grand_summary_stub_3 rowname" class="gt_row gt_left gt_grand_summary_row gt_last_summary_row">—</td>
      <td headers="grand_summary_stub_3 group" class="gt_row gt_left gt_grand_summary_row gt_last_summary_row">—</td></tr>
        </tbody>
        
      </table>

---

    Code
      as.character(as_latex(gt_tbl))
    Output
      [1] "\\begingroup\n\\fontsize{12.0pt}{14.0pt}\\selectfont\n\\begin{longtable}{l|rcrrrrll}\n\\toprule\n & num & fctr & date & time & datetime & currency & rowname & group \\\\ \n\\midrule\\addlinespace[2.5pt]\napricot & 1.111e-01 & one & 2015-01-15 & 13:35 & 2018-01-01 02:22 & 49.950 & row\\_1 & grp\\_a \\\\ \nbanana & 2.222e+00 & two & 2015-02-15 & 14:40 & 2018-02-02 14:33 & 17.950 & row\\_2 & grp\\_a \\\\ \ncoconut & 3.333e+01 & three & 2015-03-15 & 15:45 & 2018-03-03 03:44 & 1.390 & row\\_3 & grp\\_a \\\\ \ndurian & 4.444e+02 & four & 2015-04-15 & 16:50 & 2018-04-04 15:55 & 65100.000 & row\\_4 & grp\\_a \\\\ \nNA & 5.550e+03 & five & 2015-05-15 & 17:55 & 2018-05-05 04:00 & 1325.810 & row\\_5 & grp\\_b \\\\ \nfig & NA & six & 2015-06-15 & NA & 2018-06-06 16:11 & 13.255 & row\\_6 & grp\\_b \\\\ \ngrapefruit & 7.770e+05 & seven & NA & 19:10 & 2018-07-07 05:22 & NA & row\\_7 & grp\\_b \\\\ \nhoneydew & 8.880e+06 & eight & 2015-08-15 & 20:20 & NA & 0.440 & row\\_8 & grp\\_b \\\\ \n\\midrule \n\\midrule \nmin & 0.11 & — & — & — & — & 0.44 & — & — \\\\ \nmax & 8,880,000.00 & — & — & — & — & 65,100.00 & — & — \\\\ \navg & 1,380,432.87 & — & — & — & — & 9,501.26 & — & — \\\\ \n\\bottomrule\n\\end{longtable}\n\\endgroup\n"

---

    Code
      as_rtf(gt_tbl)
    Output
      {\rtf\ansi\ansicpg1252{\fonttbl{\f0\froman\fcharset0\fprq0 Courier New;}{\f1\froman\fcharset0\fprq0 Times;}}{\colortbl;\red211\green211\blue211;}
      
      \paperw12240\paperh15840\widowctrl\ftnbj\fet0\sectd\linex0
      \lndscpsxn
      \margl1440\margr1440\margt1440\margb1440
      \headery720\footery720\fs20
      
      \trowd\trrh0\trhdr
      
      \pard\plain\uc0\ql\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85\clbrdrb\brdrs\brdrw20\brdrcf1 \cellx1040
      \intbl {\f0 {\f0\fs20 }}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85\clbrdrb\brdrs\brdrw20\brdrcf1 \cellx2080
      \intbl {\f0 {\f0\fs20 num}}\cell
      
      \pard\plain\uc0\qc\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85\clbrdrb\brdrs\brdrw20\brdrcf1 \cellx3120
      \intbl {\f0 {\f0\fs20 fctr}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85\clbrdrb\brdrs\brdrw20\brdrcf1 \cellx4160
      \intbl {\f0 {\f0\fs20 date}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85\clbrdrb\brdrs\brdrw20\brdrcf1 \cellx5200
      \intbl {\f0 {\f0\fs20 time}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85\clbrdrb\brdrs\brdrw20\brdrcf1 \cellx6240
      \intbl {\f0 {\f0\fs20 datetime}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85\clbrdrb\brdrs\brdrw20\brdrcf1 \cellx7280
      \intbl {\f0 {\f0\fs20 currency}}\cell
      
      \pard\plain\uc0\ql\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85\clbrdrb\brdrs\brdrw20\brdrcf1 \cellx8320
      \intbl {\f0 {\f0\fs20 rowname}}\cell
      
      \pard\plain\uc0\ql\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85\clbrdrb\brdrs\brdrw20\brdrcf1 \cellx9360
      \intbl {\f0 {\f0\fs20 group}}\cell
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\ql\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx1040
      \intbl {\f0 {\f0\fs20 apricot}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx2080
      \intbl {\f0 {\f0\fs20 1.111e-01}}\cell
      
      \pard\plain\uc0\qc\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx3120
      \intbl {\f0 {\f0\fs20 one}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx4160
      \intbl {\f0 {\f0\fs20 2015-01-15}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx5200
      \intbl {\f0 {\f0\fs20 13:35}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx6240
      \intbl {\f0 {\f0\fs20 2018-01-01 02:22}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx7280
      \intbl {\f0 {\f0\fs20 49.950}}\cell
      
      \pard\plain\uc0\ql\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx8320
      \intbl {\f0 {\f0\fs20 row_1}}\cell
      
      \pard\plain\uc0\ql\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx9360
      \intbl {\f0 {\f0\fs20 grp_a}}\cell
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\ql\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx1040
      \intbl {\f0 {\f0\fs20 banana}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx2080
      \intbl {\f0 {\f0\fs20 2.222e+00}}\cell
      
      \pard\plain\uc0\qc\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx3120
      \intbl {\f0 {\f0\fs20 two}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx4160
      \intbl {\f0 {\f0\fs20 2015-02-15}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx5200
      \intbl {\f0 {\f0\fs20 14:40}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx6240
      \intbl {\f0 {\f0\fs20 2018-02-02 14:33}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx7280
      \intbl {\f0 {\f0\fs20 17.950}}\cell
      
      \pard\plain\uc0\ql\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx8320
      \intbl {\f0 {\f0\fs20 row_2}}\cell
      
      \pard\plain\uc0\ql\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx9360
      \intbl {\f0 {\f0\fs20 grp_a}}\cell
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\ql\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx1040
      \intbl {\f0 {\f0\fs20 coconut}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx2080
      \intbl {\f0 {\f0\fs20 3.333e+01}}\cell
      
      \pard\plain\uc0\qc\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx3120
      \intbl {\f0 {\f0\fs20 three}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx4160
      \intbl {\f0 {\f0\fs20 2015-03-15}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx5200
      \intbl {\f0 {\f0\fs20 15:45}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx6240
      \intbl {\f0 {\f0\fs20 2018-03-03 03:44}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx7280
      \intbl {\f0 {\f0\fs20 1.390}}\cell
      
      \pard\plain\uc0\ql\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx8320
      \intbl {\f0 {\f0\fs20 row_3}}\cell
      
      \pard\plain\uc0\ql\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx9360
      \intbl {\f0 {\f0\fs20 grp_a}}\cell
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\ql\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx1040
      \intbl {\f0 {\f0\fs20 durian}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx2080
      \intbl {\f0 {\f0\fs20 4.444e+02}}\cell
      
      \pard\plain\uc0\qc\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx3120
      \intbl {\f0 {\f0\fs20 four}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx4160
      \intbl {\f0 {\f0\fs20 2015-04-15}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx5200
      \intbl {\f0 {\f0\fs20 16:50}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx6240
      \intbl {\f0 {\f0\fs20 2018-04-04 15:55}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx7280
      \intbl {\f0 {\f0\fs20 65100.000}}\cell
      
      \pard\plain\uc0\ql\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx8320
      \intbl {\f0 {\f0\fs20 row_4}}\cell
      
      \pard\plain\uc0\ql\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx9360
      \intbl {\f0 {\f0\fs20 grp_a}}\cell
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\ql\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx1040
      \intbl {\f0 {\f0\fs20 NA}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx2080
      \intbl {\f0 {\f0\fs20 5.550e+03}}\cell
      
      \pard\plain\uc0\qc\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx3120
      \intbl {\f0 {\f0\fs20 five}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx4160
      \intbl {\f0 {\f0\fs20 2015-05-15}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx5200
      \intbl {\f0 {\f0\fs20 17:55}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx6240
      \intbl {\f0 {\f0\fs20 2018-05-05 04:00}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx7280
      \intbl {\f0 {\f0\fs20 1325.810}}\cell
      
      \pard\plain\uc0\ql\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx8320
      \intbl {\f0 {\f0\fs20 row_5}}\cell
      
      \pard\plain\uc0\ql\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx9360
      \intbl {\f0 {\f0\fs20 grp_b}}\cell
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\ql\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx1040
      \intbl {\f0 {\f0\fs20 fig}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx2080
      \intbl {\f0 {\f0\fs20 NA}}\cell
      
      \pard\plain\uc0\qc\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx3120
      \intbl {\f0 {\f0\fs20 six}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx4160
      \intbl {\f0 {\f0\fs20 2015-06-15}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx5200
      \intbl {\f0 {\f0\fs20 NA}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx6240
      \intbl {\f0 {\f0\fs20 2018-06-06 16:11}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx7280
      \intbl {\f0 {\f0\fs20 13.255}}\cell
      
      \pard\plain\uc0\ql\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx8320
      \intbl {\f0 {\f0\fs20 row_6}}\cell
      
      \pard\plain\uc0\ql\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx9360
      \intbl {\f0 {\f0\fs20 grp_b}}\cell
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\ql\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx1040
      \intbl {\f0 {\f0\fs20 grapefruit}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx2080
      \intbl {\f0 {\f0\fs20 7.770e+05}}\cell
      
      \pard\plain\uc0\qc\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx3120
      \intbl {\f0 {\f0\fs20 seven}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx4160
      \intbl {\f0 {\f0\fs20 NA}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx5200
      \intbl {\f0 {\f0\fs20 19:10}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx6240
      \intbl {\f0 {\f0\fs20 2018-07-07 05:22}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx7280
      \intbl {\f0 {\f0\fs20 NA}}\cell
      
      \pard\plain\uc0\ql\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx8320
      \intbl {\f0 {\f0\fs20 row_7}}\cell
      
      \pard\plain\uc0\ql\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx9360
      \intbl {\f0 {\f0\fs20 grp_b}}\cell
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\ql\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx1040
      \intbl {\f0 {\f0\fs20 honeydew}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx2080
      \intbl {\f0 {\f0\fs20 8.880e+06}}\cell
      
      \pard\plain\uc0\qc\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx3120
      \intbl {\f0 {\f0\fs20 eight}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx4160
      \intbl {\f0 {\f0\fs20 2015-08-15}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx5200
      \intbl {\f0 {\f0\fs20 20:20}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx6240
      \intbl {\f0 {\f0\fs20 NA}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx7280
      \intbl {\f0 {\f0\fs20 0.440}}\cell
      
      \pard\plain\uc0\ql\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx8320
      \intbl {\f0 {\f0\fs20 row_8}}\cell
      
      \pard\plain\uc0\ql\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx9360
      \intbl {\f0 {\f0\fs20 grp_b}}\cell
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\ql\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx1040
      \intbl {\f0 {\f0\fs20 min}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx2080
      \intbl {\f0 {\f0\fs20 0.11}}\cell
      
      \pard\plain\uc0\qc\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx3120
      \intbl {\f0 {\f0\fs20 \'97}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx4160
      \intbl {\f0 {\f0\fs20 \'97}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx5200
      \intbl {\f0 {\f0\fs20 \'97}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx6240
      \intbl {\f0 {\f0\fs20 \'97}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx7280
      \intbl {\f0 {\f0\fs20 0.44}}\cell
      
      \pard\plain\uc0\ql\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx8320
      \intbl {\f0 {\f0\fs20 \'97}}\cell
      
      \pard\plain\uc0\ql\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx9360
      \intbl {\f0 {\f0\fs20 \'97}}\cell
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\ql\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx1040
      \intbl {\f0 {\f0\fs20 max}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx2080
      \intbl {\f0 {\f0\fs20 8,880,000.00}}\cell
      
      \pard\plain\uc0\qc\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx3120
      \intbl {\f0 {\f0\fs20 \'97}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx4160
      \intbl {\f0 {\f0\fs20 \'97}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx5200
      \intbl {\f0 {\f0\fs20 \'97}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx6240
      \intbl {\f0 {\f0\fs20 \'97}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx7280
      \intbl {\f0 {\f0\fs20 65,100.00}}\cell
      
      \pard\plain\uc0\ql\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx8320
      \intbl {\f0 {\f0\fs20 \'97}}\cell
      
      \pard\plain\uc0\ql\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx9360
      \intbl {\f0 {\f0\fs20 \'97}}\cell
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\ql\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx1040
      \intbl {\f0 {\f0\fs20 avg}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx2080
      \intbl {\f0 {\f0\fs20 1,380,432.87}}\cell
      
      \pard\plain\uc0\qc\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx3120
      \intbl {\f0 {\f0\fs20 \'97}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx4160
      \intbl {\f0 {\f0\fs20 \'97}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx5200
      \intbl {\f0 {\f0\fs20 \'97}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx6240
      \intbl {\f0 {\f0\fs20 \'97}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx7280
      \intbl {\f0 {\f0\fs20 9,501.26}}\cell
      
      \pard\plain\uc0\ql\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx8320
      \intbl {\f0 {\f0\fs20 \'97}}\cell
      
      \pard\plain\uc0\ql\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx9360
      \intbl {\f0 {\f0\fs20 \'97}}\cell
      
      \row
      
      }

---

    Code
      cat(render_as_html(gt_tbl))
    Output
      <table class="gt_table" data-quarto-disable-processing="false" data-quarto-bootstrap="false">
        <thead>
          <tr class="gt_col_headings">
            <th class="gt_col_heading gt_columns_bottom_border gt_left" rowspan="1" colspan="1" scope="col" id="a::stub"></th>
            <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id="num">num</th>
            <th class="gt_col_heading gt_columns_bottom_border gt_center" rowspan="1" colspan="1" scope="col" id="fctr">fctr</th>
            <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id="date">date</th>
            <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id="time">time</th>
            <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id="datetime">datetime</th>
            <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id="currency">currency</th>
            <th class="gt_col_heading gt_columns_bottom_border gt_left" rowspan="1" colspan="1" scope="col" id="rowname">rowname</th>
          </tr>
        </thead>
        <tbody class="gt_table_body">
          <tr class="gt_group_heading_row">
            <th colspan="8" class="gt_group_heading" scope="colgroup" id="grp_a">grp_a</th>
          </tr>
          <tr class="gt_row_group_first"><th id="stub_1_1" scope="row" class="gt_row gt_left gt_stub">apricot</th>
      <td headers="grp_a stub_1_1 num" class="gt_row gt_right">1.111e-01</td>
      <td headers="grp_a stub_1_1 fctr" class="gt_row gt_center">one</td>
      <td headers="grp_a stub_1_1 date" class="gt_row gt_right">2015-01-15</td>
      <td headers="grp_a stub_1_1 time" class="gt_row gt_right">13:35</td>
      <td headers="grp_a stub_1_1 datetime" class="gt_row gt_right">2018-01-01 02:22</td>
      <td headers="grp_a stub_1_1 currency" class="gt_row gt_right">49.950</td>
      <td headers="grp_a stub_1_1 rowname" class="gt_row gt_left">row_1</td></tr>
          <tr><th id="stub_1_2" scope="row" class="gt_row gt_left gt_stub">banana</th>
      <td headers="grp_a stub_1_2 num" class="gt_row gt_right">2.222e+00</td>
      <td headers="grp_a stub_1_2 fctr" class="gt_row gt_center">two</td>
      <td headers="grp_a stub_1_2 date" class="gt_row gt_right">2015-02-15</td>
      <td headers="grp_a stub_1_2 time" class="gt_row gt_right">14:40</td>
      <td headers="grp_a stub_1_2 datetime" class="gt_row gt_right">2018-02-02 14:33</td>
      <td headers="grp_a stub_1_2 currency" class="gt_row gt_right">17.950</td>
      <td headers="grp_a stub_1_2 rowname" class="gt_row gt_left">row_2</td></tr>
          <tr><th id="stub_1_3" scope="row" class="gt_row gt_left gt_stub">coconut</th>
      <td headers="grp_a stub_1_3 num" class="gt_row gt_right">3.333e+01</td>
      <td headers="grp_a stub_1_3 fctr" class="gt_row gt_center">three</td>
      <td headers="grp_a stub_1_3 date" class="gt_row gt_right">2015-03-15</td>
      <td headers="grp_a stub_1_3 time" class="gt_row gt_right">15:45</td>
      <td headers="grp_a stub_1_3 datetime" class="gt_row gt_right">2018-03-03 03:44</td>
      <td headers="grp_a stub_1_3 currency" class="gt_row gt_right">1.390</td>
      <td headers="grp_a stub_1_3 rowname" class="gt_row gt_left">row_3</td></tr>
          <tr><th id="stub_1_4" scope="row" class="gt_row gt_left gt_stub">durian</th>
      <td headers="grp_a stub_1_4 num" class="gt_row gt_right">4.444e+02</td>
      <td headers="grp_a stub_1_4 fctr" class="gt_row gt_center">four</td>
      <td headers="grp_a stub_1_4 date" class="gt_row gt_right">2015-04-15</td>
      <td headers="grp_a stub_1_4 time" class="gt_row gt_right">16:50</td>
      <td headers="grp_a stub_1_4 datetime" class="gt_row gt_right">2018-04-04 15:55</td>
      <td headers="grp_a stub_1_4 currency" class="gt_row gt_right">65100.000</td>
      <td headers="grp_a stub_1_4 rowname" class="gt_row gt_left">row_4</td></tr>
          <tr><th id="summary_stub_grp_a_1" scope="row" class="gt_row gt_left gt_stub gt_summary_row gt_first_summary_row thick gt_last_summary_row">median</th>
      <td headers="grp_a summary_stub_grp_a_1 num" class="gt_row gt_right gt_summary_row gt_first_summary_row thick gt_last_summary_row">17.78</td>
      <td headers="grp_a summary_stub_grp_a_1 fctr" class="gt_row gt_center gt_summary_row gt_first_summary_row thick gt_last_summary_row">—</td>
      <td headers="grp_a summary_stub_grp_a_1 date" class="gt_row gt_right gt_summary_row gt_first_summary_row thick gt_last_summary_row">—</td>
      <td headers="grp_a summary_stub_grp_a_1 time" class="gt_row gt_right gt_summary_row gt_first_summary_row thick gt_last_summary_row">—</td>
      <td headers="grp_a summary_stub_grp_a_1 datetime" class="gt_row gt_right gt_summary_row gt_first_summary_row thick gt_last_summary_row">—</td>
      <td headers="grp_a summary_stub_grp_a_1 currency" class="gt_row gt_right gt_summary_row gt_first_summary_row thick gt_last_summary_row">33.95</td>
      <td headers="grp_a summary_stub_grp_a_1 rowname" class="gt_row gt_left gt_summary_row gt_first_summary_row thick gt_last_summary_row">—</td></tr>
          <tr class="gt_group_heading_row">
            <th colspan="8" class="gt_group_heading" scope="colgroup" id="grp_b">grp_b</th>
          </tr>
          <tr class="gt_row_group_first"><th id="stub_1_5" scope="row" class="gt_row gt_left gt_stub">NA</th>
      <td headers="grp_b stub_1_5 num" class="gt_row gt_right">5.550e+03</td>
      <td headers="grp_b stub_1_5 fctr" class="gt_row gt_center">five</td>
      <td headers="grp_b stub_1_5 date" class="gt_row gt_right">2015-05-15</td>
      <td headers="grp_b stub_1_5 time" class="gt_row gt_right">17:55</td>
      <td headers="grp_b stub_1_5 datetime" class="gt_row gt_right">2018-05-05 04:00</td>
      <td headers="grp_b stub_1_5 currency" class="gt_row gt_right">1325.810</td>
      <td headers="grp_b stub_1_5 rowname" class="gt_row gt_left">row_5</td></tr>
          <tr><th id="stub_1_6" scope="row" class="gt_row gt_left gt_stub">fig</th>
      <td headers="grp_b stub_1_6 num" class="gt_row gt_right">NA</td>
      <td headers="grp_b stub_1_6 fctr" class="gt_row gt_center">six</td>
      <td headers="grp_b stub_1_6 date" class="gt_row gt_right">2015-06-15</td>
      <td headers="grp_b stub_1_6 time" class="gt_row gt_right">NA</td>
      <td headers="grp_b stub_1_6 datetime" class="gt_row gt_right">2018-06-06 16:11</td>
      <td headers="grp_b stub_1_6 currency" class="gt_row gt_right">13.255</td>
      <td headers="grp_b stub_1_6 rowname" class="gt_row gt_left">row_6</td></tr>
          <tr><th id="stub_1_7" scope="row" class="gt_row gt_left gt_stub">grapefruit</th>
      <td headers="grp_b stub_1_7 num" class="gt_row gt_right">7.770e+05</td>
      <td headers="grp_b stub_1_7 fctr" class="gt_row gt_center">seven</td>
      <td headers="grp_b stub_1_7 date" class="gt_row gt_right">NA</td>
      <td headers="grp_b stub_1_7 time" class="gt_row gt_right">19:10</td>
      <td headers="grp_b stub_1_7 datetime" class="gt_row gt_right">2018-07-07 05:22</td>
      <td headers="grp_b stub_1_7 currency" class="gt_row gt_right">NA</td>
      <td headers="grp_b stub_1_7 rowname" class="gt_row gt_left">row_7</td></tr>
          <tr><th id="stub_1_8" scope="row" class="gt_row gt_left gt_stub">honeydew</th>
      <td headers="grp_b stub_1_8 num" class="gt_row gt_right">8.880e+06</td>
      <td headers="grp_b stub_1_8 fctr" class="gt_row gt_center">eight</td>
      <td headers="grp_b stub_1_8 date" class="gt_row gt_right">2015-08-15</td>
      <td headers="grp_b stub_1_8 time" class="gt_row gt_right">20:20</td>
      <td headers="grp_b stub_1_8 datetime" class="gt_row gt_right">NA</td>
      <td headers="grp_b stub_1_8 currency" class="gt_row gt_right">0.440</td>
      <td headers="grp_b stub_1_8 rowname" class="gt_row gt_left">row_8</td></tr>
          <tr><th id="summary_stub_grp_b_1" scope="row" class="gt_row gt_left gt_stub gt_summary_row gt_first_summary_row thick gt_last_summary_row">median</th>
      <td headers="grp_b summary_stub_grp_b_1 num" class="gt_row gt_right gt_summary_row gt_first_summary_row thick gt_last_summary_row">777,000.00</td>
      <td headers="grp_b summary_stub_grp_b_1 fctr" class="gt_row gt_center gt_summary_row gt_first_summary_row thick gt_last_summary_row">—</td>
      <td headers="grp_b summary_stub_grp_b_1 date" class="gt_row gt_right gt_summary_row gt_first_summary_row thick gt_last_summary_row">—</td>
      <td headers="grp_b summary_stub_grp_b_1 time" class="gt_row gt_right gt_summary_row gt_first_summary_row thick gt_last_summary_row">—</td>
      <td headers="grp_b summary_stub_grp_b_1 datetime" class="gt_row gt_right gt_summary_row gt_first_summary_row thick gt_last_summary_row">—</td>
      <td headers="grp_b summary_stub_grp_b_1 currency" class="gt_row gt_right gt_summary_row gt_first_summary_row thick gt_last_summary_row">13.26</td>
      <td headers="grp_b summary_stub_grp_b_1 rowname" class="gt_row gt_left gt_summary_row gt_first_summary_row thick gt_last_summary_row">—</td></tr>
          <tr><th id="grand_summary_stub_1" scope="row" class="gt_row gt_left gt_stub gt_grand_summary_row gt_first_grand_summary_row">min</th>
      <td headers="grand_summary_stub_1 num" class="gt_row gt_right gt_grand_summary_row gt_first_grand_summary_row">0.11</td>
      <td headers="grand_summary_stub_1 fctr" class="gt_row gt_center gt_grand_summary_row gt_first_grand_summary_row">—</td>
      <td headers="grand_summary_stub_1 date" class="gt_row gt_right gt_grand_summary_row gt_first_grand_summary_row">—</td>
      <td headers="grand_summary_stub_1 time" class="gt_row gt_right gt_grand_summary_row gt_first_grand_summary_row">—</td>
      <td headers="grand_summary_stub_1 datetime" class="gt_row gt_right gt_grand_summary_row gt_first_grand_summary_row">—</td>
      <td headers="grand_summary_stub_1 currency" class="gt_row gt_right gt_grand_summary_row gt_first_grand_summary_row">0.44</td>
      <td headers="grand_summary_stub_1 rowname" class="gt_row gt_left gt_grand_summary_row gt_first_grand_summary_row">—</td></tr>
          <tr><th id="grand_summary_stub_2" scope="row" class="gt_row gt_left gt_stub gt_grand_summary_row">max</th>
      <td headers="grand_summary_stub_2 num" class="gt_row gt_right gt_grand_summary_row">8,880,000.00</td>
      <td headers="grand_summary_stub_2 fctr" class="gt_row gt_center gt_grand_summary_row">—</td>
      <td headers="grand_summary_stub_2 date" class="gt_row gt_right gt_grand_summary_row">—</td>
      <td headers="grand_summary_stub_2 time" class="gt_row gt_right gt_grand_summary_row">—</td>
      <td headers="grand_summary_stub_2 datetime" class="gt_row gt_right gt_grand_summary_row">—</td>
      <td headers="grand_summary_stub_2 currency" class="gt_row gt_right gt_grand_summary_row">65,100.00</td>
      <td headers="grand_summary_stub_2 rowname" class="gt_row gt_left gt_grand_summary_row">—</td></tr>
          <tr><th id="grand_summary_stub_3" scope="row" class="gt_row gt_left gt_stub gt_grand_summary_row gt_last_summary_row">avg</th>
      <td headers="grand_summary_stub_3 num" class="gt_row gt_right gt_grand_summary_row gt_last_summary_row">1,380,432.87</td>
      <td headers="grand_summary_stub_3 fctr" class="gt_row gt_center gt_grand_summary_row gt_last_summary_row">—</td>
      <td headers="grand_summary_stub_3 date" class="gt_row gt_right gt_grand_summary_row gt_last_summary_row">—</td>
      <td headers="grand_summary_stub_3 time" class="gt_row gt_right gt_grand_summary_row gt_last_summary_row">—</td>
      <td headers="grand_summary_stub_3 datetime" class="gt_row gt_right gt_grand_summary_row gt_last_summary_row">—</td>
      <td headers="grand_summary_stub_3 currency" class="gt_row gt_right gt_grand_summary_row gt_last_summary_row">9,501.26</td>
      <td headers="grand_summary_stub_3 rowname" class="gt_row gt_left gt_grand_summary_row gt_last_summary_row">—</td></tr>
        </tbody>
        
      </table>

---

    Code
      as.character(as_latex(gt_tbl))
    Output
      [1] "\\begingroup\n\\fontsize{12.0pt}{14.0pt}\\selectfont\n\\begin{longtable}{l|rcrrrrl}\n\\toprule\n & num & fctr & date & time & datetime & currency & rowname \\\\ \n\\midrule\\addlinespace[2.5pt]\n\\multicolumn{8}{l}{grp\\_a} \\\\[2.5pt] \n\\midrule\\addlinespace[2.5pt]\napricot & 1.111e-01 & one & 2015-01-15 & 13:35 & 2018-01-01 02:22 & 49.950 & row\\_1 \\\\ \nbanana & 2.222e+00 & two & 2015-02-15 & 14:40 & 2018-02-02 14:33 & 17.950 & row\\_2 \\\\ \ncoconut & 3.333e+01 & three & 2015-03-15 & 15:45 & 2018-03-03 03:44 & 1.390 & row\\_3 \\\\ \ndurian & 4.444e+02 & four & 2015-04-15 & 16:50 & 2018-04-04 15:55 & 65100.000 & row\\_4 \\\\ \n\\midrule \nmedian & 17.78 & — & — & — & — & 33.95 & — \\\\ \n\\midrule\\addlinespace[2.5pt]\n\\multicolumn{8}{l}{grp\\_b} \\\\[2.5pt] \n\\midrule\\addlinespace[2.5pt]\nNA & 5.550e+03 & five & 2015-05-15 & 17:55 & 2018-05-05 04:00 & 1325.810 & row\\_5 \\\\ \nfig & NA & six & 2015-06-15 & NA & 2018-06-06 16:11 & 13.255 & row\\_6 \\\\ \ngrapefruit & 7.770e+05 & seven & NA & 19:10 & 2018-07-07 05:22 & NA & row\\_7 \\\\ \nhoneydew & 8.880e+06 & eight & 2015-08-15 & 20:20 & NA & 0.440 & row\\_8 \\\\ \n\\midrule \nmedian & 777,000.00 & — & — & — & — & 13.26 & — \\\\ \n\\midrule \n\\midrule \nmin & 0.11 & — & — & — & — & 0.44 & — \\\\ \nmax & 8,880,000.00 & — & — & — & — & 65,100.00 & — \\\\ \navg & 1,380,432.87 & — & — & — & — & 9,501.26 & — \\\\ \n\\bottomrule\n\\end{longtable}\n\\endgroup\n"

---

    Code
      as_rtf(gt_tbl)
    Output
      {\rtf\ansi\ansicpg1252{\fonttbl{\f0\froman\fcharset0\fprq0 Courier New;}{\f1\froman\fcharset0\fprq0 Times;}}{\colortbl;\red211\green211\blue211;}
      
      \paperw12240\paperh15840\widowctrl\ftnbj\fet0\sectd\linex0
      \lndscpsxn
      \margl1440\margr1440\margt1440\margb1440
      \headery720\footery720\fs20
      
      \trowd\trrh0\trhdr
      
      \pard\plain\uc0\ql\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85\clbrdrb\brdrs\brdrw20\brdrcf1 \cellx1170
      \intbl {\f0 {\f0\fs20 }}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85\clbrdrb\brdrs\brdrw20\brdrcf1 \cellx2340
      \intbl {\f0 {\f0\fs20 num}}\cell
      
      \pard\plain\uc0\qc\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85\clbrdrb\brdrs\brdrw20\brdrcf1 \cellx3510
      \intbl {\f0 {\f0\fs20 fctr}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85\clbrdrb\brdrs\brdrw20\brdrcf1 \cellx4680
      \intbl {\f0 {\f0\fs20 date}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85\clbrdrb\brdrs\brdrw20\brdrcf1 \cellx5850
      \intbl {\f0 {\f0\fs20 time}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85\clbrdrb\brdrs\brdrw20\brdrcf1 \cellx7020
      \intbl {\f0 {\f0\fs20 datetime}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85\clbrdrb\brdrs\brdrw20\brdrcf1 \cellx8190
      \intbl {\f0 {\f0\fs20 currency}}\cell
      
      \pard\plain\uc0\ql\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85\clbrdrb\brdrs\brdrw20\brdrcf1 \cellx9360
      \intbl {\f0 {\f0\fs20 rowname}}\cell
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\ql\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx9360
      \intbl {\f0\fs20 grp_a}\cell
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\ql\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx1170
      \intbl {\f0 {\f0\fs20 apricot}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx2340
      \intbl {\f0 {\f0\fs20 1.111e-01}}\cell
      
      \pard\plain\uc0\qc\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx3510
      \intbl {\f0 {\f0\fs20 one}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx4680
      \intbl {\f0 {\f0\fs20 2015-01-15}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx5850
      \intbl {\f0 {\f0\fs20 13:35}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx7020
      \intbl {\f0 {\f0\fs20 2018-01-01 02:22}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx8190
      \intbl {\f0 {\f0\fs20 49.950}}\cell
      
      \pard\plain\uc0\ql\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx9360
      \intbl {\f0 {\f0\fs20 row_1}}\cell
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\ql\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx1170
      \intbl {\f0 {\f0\fs20 banana}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx2340
      \intbl {\f0 {\f0\fs20 2.222e+00}}\cell
      
      \pard\plain\uc0\qc\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx3510
      \intbl {\f0 {\f0\fs20 two}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx4680
      \intbl {\f0 {\f0\fs20 2015-02-15}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx5850
      \intbl {\f0 {\f0\fs20 14:40}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx7020
      \intbl {\f0 {\f0\fs20 2018-02-02 14:33}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx8190
      \intbl {\f0 {\f0\fs20 17.950}}\cell
      
      \pard\plain\uc0\ql\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx9360
      \intbl {\f0 {\f0\fs20 row_2}}\cell
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\ql\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx1170
      \intbl {\f0 {\f0\fs20 coconut}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx2340
      \intbl {\f0 {\f0\fs20 3.333e+01}}\cell
      
      \pard\plain\uc0\qc\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx3510
      \intbl {\f0 {\f0\fs20 three}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx4680
      \intbl {\f0 {\f0\fs20 2015-03-15}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx5850
      \intbl {\f0 {\f0\fs20 15:45}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx7020
      \intbl {\f0 {\f0\fs20 2018-03-03 03:44}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx8190
      \intbl {\f0 {\f0\fs20 1.390}}\cell
      
      \pard\plain\uc0\ql\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx9360
      \intbl {\f0 {\f0\fs20 row_3}}\cell
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\ql\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx1170
      \intbl {\f0 {\f0\fs20 durian}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx2340
      \intbl {\f0 {\f0\fs20 4.444e+02}}\cell
      
      \pard\plain\uc0\qc\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx3510
      \intbl {\f0 {\f0\fs20 four}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx4680
      \intbl {\f0 {\f0\fs20 2015-04-15}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx5850
      \intbl {\f0 {\f0\fs20 16:50}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx7020
      \intbl {\f0 {\f0\fs20 2018-04-04 15:55}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx8190
      \intbl {\f0 {\f0\fs20 65100.000}}\cell
      
      \pard\plain\uc0\ql\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx9360
      \intbl {\f0 {\f0\fs20 row_4}}\cell
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\ql\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx1170
      \intbl {\f0 {\f0\fs20 median}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx2340
      \intbl {\f0 {\f0\fs20 17.78}}\cell
      
      \pard\plain\uc0\qc\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx3510
      \intbl {\f0 {\f0\fs20 \'97}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx4680
      \intbl {\f0 {\f0\fs20 \'97}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx5850
      \intbl {\f0 {\f0\fs20 \'97}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx7020
      \intbl {\f0 {\f0\fs20 \'97}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx8190
      \intbl {\f0 {\f0\fs20 33.95}}\cell
      
      \pard\plain\uc0\ql\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx9360
      \intbl {\f0 {\f0\fs20 \'97}}\cell
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\ql\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx9360
      \intbl {\f0\fs20 grp_b}\cell
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\ql\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx1170
      \intbl {\f0 {\f0\fs20 NA}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx2340
      \intbl {\f0 {\f0\fs20 5.550e+03}}\cell
      
      \pard\plain\uc0\qc\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx3510
      \intbl {\f0 {\f0\fs20 five}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx4680
      \intbl {\f0 {\f0\fs20 2015-05-15}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx5850
      \intbl {\f0 {\f0\fs20 17:55}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx7020
      \intbl {\f0 {\f0\fs20 2018-05-05 04:00}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx8190
      \intbl {\f0 {\f0\fs20 1325.810}}\cell
      
      \pard\plain\uc0\ql\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx9360
      \intbl {\f0 {\f0\fs20 row_5}}\cell
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\ql\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx1170
      \intbl {\f0 {\f0\fs20 fig}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx2340
      \intbl {\f0 {\f0\fs20 NA}}\cell
      
      \pard\plain\uc0\qc\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx3510
      \intbl {\f0 {\f0\fs20 six}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx4680
      \intbl {\f0 {\f0\fs20 2015-06-15}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx5850
      \intbl {\f0 {\f0\fs20 NA}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx7020
      \intbl {\f0 {\f0\fs20 2018-06-06 16:11}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx8190
      \intbl {\f0 {\f0\fs20 13.255}}\cell
      
      \pard\plain\uc0\ql\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx9360
      \intbl {\f0 {\f0\fs20 row_6}}\cell
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\ql\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx1170
      \intbl {\f0 {\f0\fs20 grapefruit}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx2340
      \intbl {\f0 {\f0\fs20 7.770e+05}}\cell
      
      \pard\plain\uc0\qc\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx3510
      \intbl {\f0 {\f0\fs20 seven}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx4680
      \intbl {\f0 {\f0\fs20 NA}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx5850
      \intbl {\f0 {\f0\fs20 19:10}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx7020
      \intbl {\f0 {\f0\fs20 2018-07-07 05:22}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx8190
      \intbl {\f0 {\f0\fs20 NA}}\cell
      
      \pard\plain\uc0\ql\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx9360
      \intbl {\f0 {\f0\fs20 row_7}}\cell
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\ql\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx1170
      \intbl {\f0 {\f0\fs20 honeydew}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx2340
      \intbl {\f0 {\f0\fs20 8.880e+06}}\cell
      
      \pard\plain\uc0\qc\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx3510
      \intbl {\f0 {\f0\fs20 eight}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx4680
      \intbl {\f0 {\f0\fs20 2015-08-15}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx5850
      \intbl {\f0 {\f0\fs20 20:20}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx7020
      \intbl {\f0 {\f0\fs20 NA}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx8190
      \intbl {\f0 {\f0\fs20 0.440}}\cell
      
      \pard\plain\uc0\ql\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx9360
      \intbl {\f0 {\f0\fs20 row_8}}\cell
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\ql\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx1170
      \intbl {\f0 {\f0\fs20 median}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx2340
      \intbl {\f0 {\f0\fs20 777,000.00}}\cell
      
      \pard\plain\uc0\qc\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx3510
      \intbl {\f0 {\f0\fs20 \'97}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx4680
      \intbl {\f0 {\f0\fs20 \'97}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx5850
      \intbl {\f0 {\f0\fs20 \'97}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx7020
      \intbl {\f0 {\f0\fs20 \'97}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx8190
      \intbl {\f0 {\f0\fs20 13.26}}\cell
      
      \pard\plain\uc0\ql\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx9360
      \intbl {\f0 {\f0\fs20 \'97}}\cell
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\ql\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx1170
      \intbl {\f0 {\f0\fs20 min}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx2340
      \intbl {\f0 {\f0\fs20 0.11}}\cell
      
      \pard\plain\uc0\qc\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx3510
      \intbl {\f0 {\f0\fs20 \'97}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx4680
      \intbl {\f0 {\f0\fs20 \'97}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx5850
      \intbl {\f0 {\f0\fs20 \'97}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx7020
      \intbl {\f0 {\f0\fs20 \'97}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx8190
      \intbl {\f0 {\f0\fs20 0.44}}\cell
      
      \pard\plain\uc0\ql\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx9360
      \intbl {\f0 {\f0\fs20 \'97}}\cell
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\ql\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx1170
      \intbl {\f0 {\f0\fs20 max}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx2340
      \intbl {\f0 {\f0\fs20 8,880,000.00}}\cell
      
      \pard\plain\uc0\qc\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx3510
      \intbl {\f0 {\f0\fs20 \'97}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx4680
      \intbl {\f0 {\f0\fs20 \'97}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx5850
      \intbl {\f0 {\f0\fs20 \'97}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx7020
      \intbl {\f0 {\f0\fs20 \'97}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx8190
      \intbl {\f0 {\f0\fs20 65,100.00}}\cell
      
      \pard\plain\uc0\ql\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx9360
      \intbl {\f0 {\f0\fs20 \'97}}\cell
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\ql\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx1170
      \intbl {\f0 {\f0\fs20 avg}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx2340
      \intbl {\f0 {\f0\fs20 1,380,432.87}}\cell
      
      \pard\plain\uc0\qc\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx3510
      \intbl {\f0 {\f0\fs20 \'97}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx4680
      \intbl {\f0 {\f0\fs20 \'97}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx5850
      \intbl {\f0 {\f0\fs20 \'97}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx7020
      \intbl {\f0 {\f0\fs20 \'97}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx8190
      \intbl {\f0 {\f0\fs20 9,501.26}}\cell
      
      \pard\plain\uc0\ql\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx9360
      \intbl {\f0 {\f0\fs20 \'97}}\cell
      
      \row
      
      }

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
          <tr><th id="summary_stub_grp_a_1" scope="row" class="gt_row gt_left gt_stub gt_summary_row gt_first_summary_row thick gt_last_summary_row">median</th>
      <td headers="grp_a summary_stub_grp_a_1 num" class="gt_row gt_right gt_summary_row gt_first_summary_row thick gt_last_summary_row">17.78</td>
      <td headers="grp_a summary_stub_grp_a_1 char" class="gt_row gt_left gt_summary_row gt_first_summary_row thick gt_last_summary_row">—</td>
      <td headers="grp_a summary_stub_grp_a_1 fctr" class="gt_row gt_center gt_summary_row gt_first_summary_row thick gt_last_summary_row">—</td>
      <td headers="grp_a summary_stub_grp_a_1 date" class="gt_row gt_right gt_summary_row gt_first_summary_row thick gt_last_summary_row">—</td>
      <td headers="grp_a summary_stub_grp_a_1 time" class="gt_row gt_right gt_summary_row gt_first_summary_row thick gt_last_summary_row">—</td>
      <td headers="grp_a summary_stub_grp_a_1 datetime" class="gt_row gt_right gt_summary_row gt_first_summary_row thick gt_last_summary_row">—</td>
      <td headers="grp_a summary_stub_grp_a_1 currency" class="gt_row gt_right gt_summary_row gt_first_summary_row thick gt_last_summary_row">33.95</td></tr>
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
          <tr><th id="summary_stub_grp_b_1" scope="row" class="gt_row gt_left gt_stub gt_summary_row gt_first_summary_row thick gt_last_summary_row">median</th>
      <td headers="grp_b summary_stub_grp_b_1 num" class="gt_row gt_right gt_summary_row gt_first_summary_row thick gt_last_summary_row">777,000.00</td>
      <td headers="grp_b summary_stub_grp_b_1 char" class="gt_row gt_left gt_summary_row gt_first_summary_row thick gt_last_summary_row">—</td>
      <td headers="grp_b summary_stub_grp_b_1 fctr" class="gt_row gt_center gt_summary_row gt_first_summary_row thick gt_last_summary_row">—</td>
      <td headers="grp_b summary_stub_grp_b_1 date" class="gt_row gt_right gt_summary_row gt_first_summary_row thick gt_last_summary_row">—</td>
      <td headers="grp_b summary_stub_grp_b_1 time" class="gt_row gt_right gt_summary_row gt_first_summary_row thick gt_last_summary_row">—</td>
      <td headers="grp_b summary_stub_grp_b_1 datetime" class="gt_row gt_right gt_summary_row gt_first_summary_row thick gt_last_summary_row">—</td>
      <td headers="grp_b summary_stub_grp_b_1 currency" class="gt_row gt_right gt_summary_row gt_first_summary_row thick gt_last_summary_row">13.26</td></tr>
          <tr><th id="grand_summary_stub_1" scope="row" class="gt_row gt_left gt_stub gt_grand_summary_row gt_first_grand_summary_row">min</th>
      <td headers="grand_summary_stub_1 num" class="gt_row gt_right gt_grand_summary_row gt_first_grand_summary_row">0.11</td>
      <td headers="grand_summary_stub_1 char" class="gt_row gt_left gt_grand_summary_row gt_first_grand_summary_row">—</td>
      <td headers="grand_summary_stub_1 fctr" class="gt_row gt_center gt_grand_summary_row gt_first_grand_summary_row">—</td>
      <td headers="grand_summary_stub_1 date" class="gt_row gt_right gt_grand_summary_row gt_first_grand_summary_row">—</td>
      <td headers="grand_summary_stub_1 time" class="gt_row gt_right gt_grand_summary_row gt_first_grand_summary_row">—</td>
      <td headers="grand_summary_stub_1 datetime" class="gt_row gt_right gt_grand_summary_row gt_first_grand_summary_row">—</td>
      <td headers="grand_summary_stub_1 currency" class="gt_row gt_right gt_grand_summary_row gt_first_grand_summary_row">0.44</td></tr>
          <tr><th id="grand_summary_stub_2" scope="row" class="gt_row gt_left gt_stub gt_grand_summary_row">max</th>
      <td headers="grand_summary_stub_2 num" class="gt_row gt_right gt_grand_summary_row">8,880,000.00</td>
      <td headers="grand_summary_stub_2 char" class="gt_row gt_left gt_grand_summary_row">—</td>
      <td headers="grand_summary_stub_2 fctr" class="gt_row gt_center gt_grand_summary_row">—</td>
      <td headers="grand_summary_stub_2 date" class="gt_row gt_right gt_grand_summary_row">—</td>
      <td headers="grand_summary_stub_2 time" class="gt_row gt_right gt_grand_summary_row">—</td>
      <td headers="grand_summary_stub_2 datetime" class="gt_row gt_right gt_grand_summary_row">—</td>
      <td headers="grand_summary_stub_2 currency" class="gt_row gt_right gt_grand_summary_row">65,100.00</td></tr>
          <tr><th id="grand_summary_stub_3" scope="row" class="gt_row gt_left gt_stub gt_grand_summary_row gt_last_summary_row">avg</th>
      <td headers="grand_summary_stub_3 num" class="gt_row gt_right gt_grand_summary_row gt_last_summary_row">1,380,432.87</td>
      <td headers="grand_summary_stub_3 char" class="gt_row gt_left gt_grand_summary_row gt_last_summary_row">—</td>
      <td headers="grand_summary_stub_3 fctr" class="gt_row gt_center gt_grand_summary_row gt_last_summary_row">—</td>
      <td headers="grand_summary_stub_3 date" class="gt_row gt_right gt_grand_summary_row gt_last_summary_row">—</td>
      <td headers="grand_summary_stub_3 time" class="gt_row gt_right gt_grand_summary_row gt_last_summary_row">—</td>
      <td headers="grand_summary_stub_3 datetime" class="gt_row gt_right gt_grand_summary_row gt_last_summary_row">—</td>
      <td headers="grand_summary_stub_3 currency" class="gt_row gt_right gt_grand_summary_row gt_last_summary_row">9,501.26</td></tr>
        </tbody>
        
      </table>

---

    Code
      as.character(as_latex(gt_tbl))
    Output
      [1] "\\begingroup\n\\fontsize{12.0pt}{14.0pt}\\selectfont\n\\begin{longtable}{l|rlcrrrr}\n\\toprule\n & num & char & fctr & date & time & datetime & currency \\\\ \n\\midrule\\addlinespace[2.5pt]\n\\multicolumn{8}{l}{grp\\_a} \\\\[2.5pt] \n\\midrule\\addlinespace[2.5pt]\nrow\\_1 & 1.111e-01 & apricot & one & 2015-01-15 & 13:35 & 2018-01-01 02:22 & 49.950 \\\\ \nrow\\_2 & 2.222e+00 & banana & two & 2015-02-15 & 14:40 & 2018-02-02 14:33 & 17.950 \\\\ \nrow\\_3 & 3.333e+01 & coconut & three & 2015-03-15 & 15:45 & 2018-03-03 03:44 & 1.390 \\\\ \nrow\\_4 & 4.444e+02 & durian & four & 2015-04-15 & 16:50 & 2018-04-04 15:55 & 65100.000 \\\\ \n\\midrule \nmedian & 17.78 & — & — & — & — & — & 33.95 \\\\ \n\\midrule\\addlinespace[2.5pt]\n\\multicolumn{8}{l}{grp\\_b} \\\\[2.5pt] \n\\midrule\\addlinespace[2.5pt]\nrow\\_5 & 5.550e+03 & NA & five & 2015-05-15 & 17:55 & 2018-05-05 04:00 & 1325.810 \\\\ \nrow\\_6 & NA & fig & six & 2015-06-15 & NA & 2018-06-06 16:11 & 13.255 \\\\ \nrow\\_7 & 7.770e+05 & grapefruit & seven & NA & 19:10 & 2018-07-07 05:22 & NA \\\\ \nrow\\_8 & 8.880e+06 & honeydew & eight & 2015-08-15 & 20:20 & NA & 0.440 \\\\ \n\\midrule \nmedian & 777,000.00 & — & — & — & — & — & 13.26 \\\\ \n\\midrule \n\\midrule \nmin & 0.11 & — & — & — & — & — & 0.44 \\\\ \nmax & 8,880,000.00 & — & — & — & — & — & 65,100.00 \\\\ \navg & 1,380,432.87 & — & — & — & — & — & 9,501.26 \\\\ \n\\bottomrule\n\\end{longtable}\n\\endgroup\n"

---

    Code
      as_rtf(gt_tbl)
    Output
      {\rtf\ansi\ansicpg1252{\fonttbl{\f0\froman\fcharset0\fprq0 Courier New;}{\f1\froman\fcharset0\fprq0 Times;}}{\colortbl;\red211\green211\blue211;}
      
      \paperw12240\paperh15840\widowctrl\ftnbj\fet0\sectd\linex0
      \lndscpsxn
      \margl1440\margr1440\margt1440\margb1440
      \headery720\footery720\fs20
      
      \trowd\trrh0\trhdr
      
      \pard\plain\uc0\ql\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85\clbrdrb\brdrs\brdrw20\brdrcf1 \cellx1170
      \intbl {\f0 {\f0\fs20 }}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85\clbrdrb\brdrs\brdrw20\brdrcf1 \cellx2340
      \intbl {\f0 {\f0\fs20 num}}\cell
      
      \pard\plain\uc0\ql\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85\clbrdrb\brdrs\brdrw20\brdrcf1 \cellx3510
      \intbl {\f0 {\f0\fs20 char}}\cell
      
      \pard\plain\uc0\qc\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85\clbrdrb\brdrs\brdrw20\brdrcf1 \cellx4680
      \intbl {\f0 {\f0\fs20 fctr}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85\clbrdrb\brdrs\brdrw20\brdrcf1 \cellx5850
      \intbl {\f0 {\f0\fs20 date}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85\clbrdrb\brdrs\brdrw20\brdrcf1 \cellx7020
      \intbl {\f0 {\f0\fs20 time}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85\clbrdrb\brdrs\brdrw20\brdrcf1 \cellx8190
      \intbl {\f0 {\f0\fs20 datetime}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85\clbrdrb\brdrs\brdrw20\brdrcf1 \cellx9360
      \intbl {\f0 {\f0\fs20 currency}}\cell
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\ql\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx9360
      \intbl {\f0\fs20 grp_a}\cell
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\ql\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx1170
      \intbl {\f0 {\f0\fs20 row_1}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx2340
      \intbl {\f0 {\f0\fs20 1.111e-01}}\cell
      
      \pard\plain\uc0\ql\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx3510
      \intbl {\f0 {\f0\fs20 apricot}}\cell
      
      \pard\plain\uc0\qc\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx4680
      \intbl {\f0 {\f0\fs20 one}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx5850
      \intbl {\f0 {\f0\fs20 2015-01-15}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx7020
      \intbl {\f0 {\f0\fs20 13:35}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx8190
      \intbl {\f0 {\f0\fs20 2018-01-01 02:22}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx9360
      \intbl {\f0 {\f0\fs20 49.950}}\cell
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\ql\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx1170
      \intbl {\f0 {\f0\fs20 row_2}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx2340
      \intbl {\f0 {\f0\fs20 2.222e+00}}\cell
      
      \pard\plain\uc0\ql\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx3510
      \intbl {\f0 {\f0\fs20 banana}}\cell
      
      \pard\plain\uc0\qc\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx4680
      \intbl {\f0 {\f0\fs20 two}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx5850
      \intbl {\f0 {\f0\fs20 2015-02-15}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx7020
      \intbl {\f0 {\f0\fs20 14:40}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx8190
      \intbl {\f0 {\f0\fs20 2018-02-02 14:33}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx9360
      \intbl {\f0 {\f0\fs20 17.950}}\cell
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\ql\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx1170
      \intbl {\f0 {\f0\fs20 row_3}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx2340
      \intbl {\f0 {\f0\fs20 3.333e+01}}\cell
      
      \pard\plain\uc0\ql\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx3510
      \intbl {\f0 {\f0\fs20 coconut}}\cell
      
      \pard\plain\uc0\qc\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx4680
      \intbl {\f0 {\f0\fs20 three}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx5850
      \intbl {\f0 {\f0\fs20 2015-03-15}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx7020
      \intbl {\f0 {\f0\fs20 15:45}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx8190
      \intbl {\f0 {\f0\fs20 2018-03-03 03:44}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx9360
      \intbl {\f0 {\f0\fs20 1.390}}\cell
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\ql\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx1170
      \intbl {\f0 {\f0\fs20 row_4}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx2340
      \intbl {\f0 {\f0\fs20 4.444e+02}}\cell
      
      \pard\plain\uc0\ql\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx3510
      \intbl {\f0 {\f0\fs20 durian}}\cell
      
      \pard\plain\uc0\qc\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx4680
      \intbl {\f0 {\f0\fs20 four}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx5850
      \intbl {\f0 {\f0\fs20 2015-04-15}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx7020
      \intbl {\f0 {\f0\fs20 16:50}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx8190
      \intbl {\f0 {\f0\fs20 2018-04-04 15:55}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx9360
      \intbl {\f0 {\f0\fs20 65100.000}}\cell
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\ql\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx1170
      \intbl {\f0 {\f0\fs20 median}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx2340
      \intbl {\f0 {\f0\fs20 17.78}}\cell
      
      \pard\plain\uc0\ql\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx3510
      \intbl {\f0 {\f0\fs20 \'97}}\cell
      
      \pard\plain\uc0\qc\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx4680
      \intbl {\f0 {\f0\fs20 \'97}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx5850
      \intbl {\f0 {\f0\fs20 \'97}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx7020
      \intbl {\f0 {\f0\fs20 \'97}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx8190
      \intbl {\f0 {\f0\fs20 \'97}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx9360
      \intbl {\f0 {\f0\fs20 33.95}}\cell
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\ql\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx9360
      \intbl {\f0\fs20 grp_b}\cell
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\ql\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx1170
      \intbl {\f0 {\f0\fs20 row_5}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx2340
      \intbl {\f0 {\f0\fs20 5.550e+03}}\cell
      
      \pard\plain\uc0\ql\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx3510
      \intbl {\f0 {\f0\fs20 NA}}\cell
      
      \pard\plain\uc0\qc\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx4680
      \intbl {\f0 {\f0\fs20 five}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx5850
      \intbl {\f0 {\f0\fs20 2015-05-15}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx7020
      \intbl {\f0 {\f0\fs20 17:55}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx8190
      \intbl {\f0 {\f0\fs20 2018-05-05 04:00}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx9360
      \intbl {\f0 {\f0\fs20 1325.810}}\cell
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\ql\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx1170
      \intbl {\f0 {\f0\fs20 row_6}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx2340
      \intbl {\f0 {\f0\fs20 NA}}\cell
      
      \pard\plain\uc0\ql\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx3510
      \intbl {\f0 {\f0\fs20 fig}}\cell
      
      \pard\plain\uc0\qc\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx4680
      \intbl {\f0 {\f0\fs20 six}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx5850
      \intbl {\f0 {\f0\fs20 2015-06-15}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx7020
      \intbl {\f0 {\f0\fs20 NA}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx8190
      \intbl {\f0 {\f0\fs20 2018-06-06 16:11}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx9360
      \intbl {\f0 {\f0\fs20 13.255}}\cell
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\ql\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx1170
      \intbl {\f0 {\f0\fs20 row_7}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx2340
      \intbl {\f0 {\f0\fs20 7.770e+05}}\cell
      
      \pard\plain\uc0\ql\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx3510
      \intbl {\f0 {\f0\fs20 grapefruit}}\cell
      
      \pard\plain\uc0\qc\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx4680
      \intbl {\f0 {\f0\fs20 seven}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx5850
      \intbl {\f0 {\f0\fs20 NA}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx7020
      \intbl {\f0 {\f0\fs20 19:10}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx8190
      \intbl {\f0 {\f0\fs20 2018-07-07 05:22}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx9360
      \intbl {\f0 {\f0\fs20 NA}}\cell
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\ql\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx1170
      \intbl {\f0 {\f0\fs20 row_8}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx2340
      \intbl {\f0 {\f0\fs20 8.880e+06}}\cell
      
      \pard\plain\uc0\ql\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx3510
      \intbl {\f0 {\f0\fs20 honeydew}}\cell
      
      \pard\plain\uc0\qc\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx4680
      \intbl {\f0 {\f0\fs20 eight}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx5850
      \intbl {\f0 {\f0\fs20 2015-08-15}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx7020
      \intbl {\f0 {\f0\fs20 20:20}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx8190
      \intbl {\f0 {\f0\fs20 NA}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx9360
      \intbl {\f0 {\f0\fs20 0.440}}\cell
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\ql\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx1170
      \intbl {\f0 {\f0\fs20 median}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx2340
      \intbl {\f0 {\f0\fs20 777,000.00}}\cell
      
      \pard\plain\uc0\ql\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx3510
      \intbl {\f0 {\f0\fs20 \'97}}\cell
      
      \pard\plain\uc0\qc\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx4680
      \intbl {\f0 {\f0\fs20 \'97}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx5850
      \intbl {\f0 {\f0\fs20 \'97}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx7020
      \intbl {\f0 {\f0\fs20 \'97}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx8190
      \intbl {\f0 {\f0\fs20 \'97}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx9360
      \intbl {\f0 {\f0\fs20 13.26}}\cell
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\ql\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx1170
      \intbl {\f0 {\f0\fs20 min}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx2340
      \intbl {\f0 {\f0\fs20 0.11}}\cell
      
      \pard\plain\uc0\ql\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx3510
      \intbl {\f0 {\f0\fs20 \'97}}\cell
      
      \pard\plain\uc0\qc\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx4680
      \intbl {\f0 {\f0\fs20 \'97}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx5850
      \intbl {\f0 {\f0\fs20 \'97}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx7020
      \intbl {\f0 {\f0\fs20 \'97}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx8190
      \intbl {\f0 {\f0\fs20 \'97}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx9360
      \intbl {\f0 {\f0\fs20 0.44}}\cell
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\ql\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx1170
      \intbl {\f0 {\f0\fs20 max}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx2340
      \intbl {\f0 {\f0\fs20 8,880,000.00}}\cell
      
      \pard\plain\uc0\ql\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx3510
      \intbl {\f0 {\f0\fs20 \'97}}\cell
      
      \pard\plain\uc0\qc\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx4680
      \intbl {\f0 {\f0\fs20 \'97}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx5850
      \intbl {\f0 {\f0\fs20 \'97}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx7020
      \intbl {\f0 {\f0\fs20 \'97}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx8190
      \intbl {\f0 {\f0\fs20 \'97}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx9360
      \intbl {\f0 {\f0\fs20 65,100.00}}\cell
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\ql\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx1170
      \intbl {\f0 {\f0\fs20 avg}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx2340
      \intbl {\f0 {\f0\fs20 1,380,432.87}}\cell
      
      \pard\plain\uc0\ql\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx3510
      \intbl {\f0 {\f0\fs20 \'97}}\cell
      
      \pard\plain\uc0\qc\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx4680
      \intbl {\f0 {\f0\fs20 \'97}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx5850
      \intbl {\f0 {\f0\fs20 \'97}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx7020
      \intbl {\f0 {\f0\fs20 \'97}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx8190
      \intbl {\f0 {\f0\fs20 \'97}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx9360
      \intbl {\f0 {\f0\fs20 9,501.26}}\cell
      
      \row
      
      }

---

    Code
      cat(render_as_html(gt_tbl))
    Output
      <table class="gt_table" data-quarto-disable-processing="false" data-quarto-bootstrap="false">
        <thead>
          <tr class="gt_col_headings">
            <th class="gt_col_heading gt_columns_bottom_border gt_left" rowspan="1" colspan="1" scope="col" id="a::stub"></th>
            <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id="population">population</th>
          </tr>
        </thead>
        <tbody class="gt_table_body">
          <tr class="gt_group_heading_row">
            <th colspan="2" class="gt_group_heading" scope="colgroup" id="1960s">1960s</th>
          </tr>
          <tr class="gt_row_group_first"><th id="stub_1_1" scope="row" class="gt_row gt_right gt_stub">1960</th>
      <td headers="1960s stub_1_1 population" class="gt_row gt_right">93,216,000</td></tr>
          <tr><th id="stub_1_2" scope="row" class="gt_row gt_right gt_stub">1961</th>
      <td headers="1960s stub_1_2 population" class="gt_row gt_right">94,055,000</td></tr>
          <tr><th id="stub_1_3" scope="row" class="gt_row gt_right gt_stub">1962</th>
      <td headers="1960s stub_1_3 population" class="gt_row gt_right">94,933,000</td></tr>
          <tr><th id="stub_1_4" scope="row" class="gt_row gt_right gt_stub">1963</th>
      <td headers="1960s stub_1_4 population" class="gt_row gt_right">95,900,000</td></tr>
          <tr><th id="stub_1_5" scope="row" class="gt_row gt_right gt_stub">1964</th>
      <td headers="1960s stub_1_5 population" class="gt_row gt_right">96,903,000</td></tr>
          <tr><th id="stub_1_6" scope="row" class="gt_row gt_right gt_stub">1965</th>
      <td headers="1960s stub_1_6 population" class="gt_row gt_right">97,952,000</td></tr>
          <tr><th id="stub_1_7" scope="row" class="gt_row gt_right gt_stub">1966</th>
      <td headers="1960s stub_1_7 population" class="gt_row gt_right">98,851,000</td></tr>
          <tr><th id="stub_1_8" scope="row" class="gt_row gt_right gt_stub">1967</th>
      <td headers="1960s stub_1_8 population" class="gt_row gt_right">99,879,000</td></tr>
          <tr><th id="stub_1_9" scope="row" class="gt_row gt_right gt_stub">1968</th>
      <td headers="1960s stub_1_9 population" class="gt_row gt_right">101,011,000</td></tr>
          <tr><th id="stub_1_10" scope="row" class="gt_row gt_right gt_stub">1969</th>
      <td headers="1960s stub_1_10 population" class="gt_row gt_right">102,219,000</td></tr>
          <tr><th id="summary_stub_1960s_1" scope="row" class="gt_row gt_left gt_stub gt_summary_row gt_first_summary_row thick" style="font-weight: bold; text-transform: capitalize; background-color: rgba(173,216,230,0.5);">min</th>
      <td headers="1960s summary_stub_1960s_1 population" class="gt_row gt_right gt_summary_row gt_first_summary_row thick">93,216,000</td></tr>
          <tr><th id="summary_stub_1960s_2" scope="row" class="gt_row gt_left gt_stub gt_summary_row gt_last_summary_row" style="font-weight: bold; text-transform: capitalize; background-color: rgba(173,216,230,0.5);">max</th>
      <td headers="1960s summary_stub_1960s_2 population" class="gt_row gt_right gt_summary_row gt_last_summary_row">102,219,000</td></tr>
        </tbody>
        
      </table>

---

    Code
      as.character(as_latex(gt_tbl))
    Output
      [1] "\\begingroup\n\\fontsize{12.0pt}{14.0pt}\\selectfont\n\\begin{longtable}{l|r}\n\\toprule\n & population \\\\ \n\\midrule\\addlinespace[2.5pt]\n\\multicolumn{2}{l}{1960s} \\\\[2.5pt] \n\\midrule\\addlinespace[2.5pt]\n1960 & 93,216,000 \\\\ \n1961 & 94,055,000 \\\\ \n1962 & 94,933,000 \\\\ \n1963 & 95,900,000 \\\\ \n1964 & 96,903,000 \\\\ \n1965 & 97,952,000 \\\\ \n1966 & 98,851,000 \\\\ \n1967 & 99,879,000 \\\\ \n1968 & 101,011,000 \\\\ \n1969 & 102,219,000 \\\\ \n\\midrule \n{\\bfseries \\cellcolor[HTML]{rgba(173,216,230,0.5)}{min}} & 93,216,000 \\\\ \nmax & 102,219,000 \\\\ \n\\bottomrule\n\\end{longtable}\n\\endgroup\n"

---

    Code
      as_rtf(gt_tbl)
    Output
      {\rtf\ansi\ansicpg1252{\fonttbl{\f0\froman\fcharset0\fprq0 Courier New;}{\f1\froman\fcharset0\fprq0 Times;}}{\colortbl;\red211\green211\blue211;}
      
      \paperw12240\paperh15840\widowctrl\ftnbj\fet0\sectd\linex0
      \lndscpsxn
      \margl1440\margr1440\margt1440\margb1440
      \headery720\footery720\fs20
      
      \trowd\trrh0\trhdr
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85\clbrdrb\brdrs\brdrw20\brdrcf1 \cellx4680
      \intbl {\f0 {\f0\fs20 }}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85\clbrdrb\brdrs\brdrw20\brdrcf1 \cellx9360
      \intbl {\f0 {\f0\fs20 population}}\cell
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\ql\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx9360
      \intbl {\f0\fs20 1960s}\cell
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx4680
      \intbl {\f0 {\f0\fs20 1960}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx9360
      \intbl {\f0 {\f0\fs20 93,216,000}}\cell
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx4680
      \intbl {\f0 {\f0\fs20 1961}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx9360
      \intbl {\f0 {\f0\fs20 94,055,000}}\cell
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx4680
      \intbl {\f0 {\f0\fs20 1962}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx9360
      \intbl {\f0 {\f0\fs20 94,933,000}}\cell
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx4680
      \intbl {\f0 {\f0\fs20 1963}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx9360
      \intbl {\f0 {\f0\fs20 95,900,000}}\cell
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx4680
      \intbl {\f0 {\f0\fs20 1964}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx9360
      \intbl {\f0 {\f0\fs20 96,903,000}}\cell
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx4680
      \intbl {\f0 {\f0\fs20 1965}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx9360
      \intbl {\f0 {\f0\fs20 97,952,000}}\cell
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx4680
      \intbl {\f0 {\f0\fs20 1966}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx9360
      \intbl {\f0 {\f0\fs20 98,851,000}}\cell
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx4680
      \intbl {\f0 {\f0\fs20 1967}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx9360
      \intbl {\f0 {\f0\fs20 99,879,000}}\cell
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx4680
      \intbl {\f0 {\f0\fs20 1968}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx9360
      \intbl {\f0 {\f0\fs20 101,011,000}}\cell
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx4680
      \intbl {\f0 {\f0\fs20 1969}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx9360
      \intbl {\f0 {\f0\fs20 102,219,000}}\cell
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx4680
      \intbl {\f0 {\f0\fs20 min}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx9360
      \intbl {\f0 {\f0\fs20 93,216,000}}\cell
      
      \row
      
      \trowd\trrh0
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx4680
      \intbl {\f0 {\f0\fs20 max}}\cell
      
      \pard\plain\uc0\qr\clvertalc \clpadfl3\clpadl25 \clpadft3\clpadt85 \clpadfb3\clpadb25 \clpadfr3\clpadr85 \cellx9360
      \intbl {\f0 {\f0\fs20 102,219,000}}\cell
      
      \row
      
      }

# Summary rows can be styled comprehensively

    Code
      cat(render_as_html(gt_tbl))
    Output
      <table class="gt_table" data-quarto-disable-processing="false" data-quarto-bootstrap="false">
        <thead>
          <tr class="gt_col_headings">
            <th class="gt_col_heading gt_columns_bottom_border gt_left" rowspan="1" colspan="1" scope="col" id="a::stub"></th>
            <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id="hp">hp</th>
            <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id="trq">trq</th>
          </tr>
        </thead>
        <tbody class="gt_table_body">
          <tr class="gt_group_heading_row">
            <th colspan="3" class="gt_group_heading" scope="colgroup" id="Lamborghini">Lamborghini</th>
          </tr>
          <tr class="gt_row_group_first"><th id="stub_1_1" scope="row" class="gt_row gt_left gt_stub">Aventador</th>
      <td headers="Lamborghini stub_1_1 hp" class="gt_row gt_right">700</td>
      <td headers="Lamborghini stub_1_1 trq" class="gt_row gt_right">507</td></tr>
          <tr><th id="stub_1_2" scope="row" class="gt_row gt_left gt_stub">Huracan</th>
      <td headers="Lamborghini stub_1_2 hp" class="gt_row gt_right">610</td>
      <td headers="Lamborghini stub_1_2 trq" class="gt_row gt_right">413</td></tr>
          <tr><th id="stub_1_3" scope="row" class="gt_row gt_left gt_stub">Gallardo</th>
      <td headers="Lamborghini stub_1_3 hp" class="gt_row gt_right">550</td>
      <td headers="Lamborghini stub_1_3 trq" class="gt_row gt_right">398</td></tr>
          <tr><th id="summary_stub_Lamborghini_1" scope="row" class="gt_row gt_left gt_stub gt_summary_row gt_first_summary_row thick" style="background-color: #DA291C; border-left-width: 4px; border-left-style: solid; border-left-color: #FFC72C; border-right-width: 4px; border-right-style: solid; border-right-color: #FFC72C; border-top-width: 4px; border-top-style: solid; border-top-color: #FFC72C; border-bottom-width: 4px; border-bottom-style: solid; border-bottom-color: #FFC72C; color: #FFFFFF; font-weight: bold;">Minimum</th>
      <td headers="Lamborghini summary_stub_Lamborghini_1 hp" class="gt_row gt_right gt_summary_row gt_first_summary_row thick" style="background-color: #DA291C; border-left-width: 4px; border-left-style: solid; border-left-color: #FFC72C; border-right-width: 4px; border-right-style: solid; border-right-color: #FFC72C; border-top-width: 4px; border-top-style: solid; border-top-color: #FFC72C; border-bottom-width: 4px; border-bottom-style: solid; border-bottom-color: #FFC72C; color: #FFFFFF; font-weight: bold;">550</td>
      <td headers="Lamborghini summary_stub_Lamborghini_1 trq" class="gt_row gt_right gt_summary_row gt_first_summary_row thick" style="background-color: #DA291C; border-left-width: 4px; border-left-style: solid; border-left-color: #FFC72C; border-right-width: 4px; border-right-style: solid; border-right-color: #FFC72C; border-top-width: 4px; border-top-style: solid; border-top-color: #FFC72C; border-bottom-width: 4px; border-bottom-style: solid; border-bottom-color: #FFC72C; color: #FFFFFF; font-weight: bold;">398</td></tr>
          <tr><th id="summary_stub_Lamborghini_2" scope="row" class="gt_row gt_left gt_stub gt_summary_row gt_last_summary_row" style="background-color: #DA291C; border-left-width: 4px; border-left-style: solid; border-left-color: #FFC72C; border-right-width: 4px; border-right-style: solid; border-right-color: #FFC72C; border-top-width: 4px; border-top-style: solid; border-top-color: #FFC72C; border-bottom-width: 4px; border-bottom-style: solid; border-bottom-color: #FFC72C; color: #FFFFFF; font-weight: bold;">Maximum</th>
      <td headers="Lamborghini summary_stub_Lamborghini_2 hp" class="gt_row gt_right gt_summary_row gt_last_summary_row" style="background-color: #DA291C; border-left-width: 4px; border-left-style: solid; border-left-color: #FFC72C; border-right-width: 4px; border-right-style: solid; border-right-color: #FFC72C; border-top-width: 4px; border-top-style: solid; border-top-color: #FFC72C; border-bottom-width: 4px; border-bottom-style: solid; border-bottom-color: #FFC72C; color: #FFFFFF; font-weight: bold;">700</td>
      <td headers="Lamborghini summary_stub_Lamborghini_2 trq" class="gt_row gt_right gt_summary_row gt_last_summary_row" style="background-color: #DA291C; border-left-width: 4px; border-left-style: solid; border-left-color: #FFC72C; border-right-width: 4px; border-right-style: solid; border-right-color: #FFC72C; border-top-width: 4px; border-top-style: solid; border-top-color: #FFC72C; border-bottom-width: 4px; border-bottom-style: solid; border-bottom-color: #FFC72C; color: #FFFFFF; font-weight: bold;">507</td></tr>
          <tr class="gt_group_heading_row">
            <th colspan="3" class="gt_group_heading" scope="colgroup" id="Maserati">Maserati</th>
          </tr>
          <tr class="gt_row_group_first"><th id="stub_1_4" scope="row" class="gt_row gt_left gt_stub">Granturismo</th>
      <td headers="Maserati stub_1_4 hp" class="gt_row gt_right">454</td>
      <td headers="Maserati stub_1_4 trq" class="gt_row gt_right">384</td></tr>
          <tr><th id="stub_1_5" scope="row" class="gt_row gt_left gt_stub">Quattroporte</th>
      <td headers="Maserati stub_1_5 hp" class="gt_row gt_right">404</td>
      <td headers="Maserati stub_1_5 trq" class="gt_row gt_right">406</td></tr>
          <tr><th id="stub_1_6" scope="row" class="gt_row gt_left gt_stub">Ghibli</th>
      <td headers="Maserati stub_1_6 hp" class="gt_row gt_right">345</td>
      <td headers="Maserati stub_1_6 trq" class="gt_row gt_right">369</td></tr>
          <tr><th id="summary_stub_Maserati_1" scope="row" class="gt_row gt_left gt_stub gt_summary_row gt_first_summary_row thick" style="background-color: #DA291C; border-left-width: 4px; border-left-style: solid; border-left-color: #FFC72C; border-right-width: 4px; border-right-style: solid; border-right-color: #FFC72C; border-top-width: 4px; border-top-style: solid; border-top-color: #FFC72C; border-bottom-width: 4px; border-bottom-style: solid; border-bottom-color: #FFC72C; color: #FFFFFF; font-weight: bold;">Minimum</th>
      <td headers="Maserati summary_stub_Maserati_1 hp" class="gt_row gt_right gt_summary_row gt_first_summary_row thick" style="background-color: #DA291C; border-left-width: 4px; border-left-style: solid; border-left-color: #FFC72C; border-right-width: 4px; border-right-style: solid; border-right-color: #FFC72C; border-top-width: 4px; border-top-style: solid; border-top-color: #FFC72C; border-bottom-width: 4px; border-bottom-style: solid; border-bottom-color: #FFC72C; color: #FFFFFF; font-weight: bold;">345</td>
      <td headers="Maserati summary_stub_Maserati_1 trq" class="gt_row gt_right gt_summary_row gt_first_summary_row thick" style="background-color: #DA291C; border-left-width: 4px; border-left-style: solid; border-left-color: #FFC72C; border-right-width: 4px; border-right-style: solid; border-right-color: #FFC72C; border-top-width: 4px; border-top-style: solid; border-top-color: #FFC72C; border-bottom-width: 4px; border-bottom-style: solid; border-bottom-color: #FFC72C; color: #FFFFFF; font-weight: bold;">369</td></tr>
          <tr><th id="summary_stub_Maserati_2" scope="row" class="gt_row gt_left gt_stub gt_summary_row gt_last_summary_row" style="background-color: #DA291C; border-left-width: 4px; border-left-style: solid; border-left-color: #FFC72C; border-right-width: 4px; border-right-style: solid; border-right-color: #FFC72C; border-top-width: 4px; border-top-style: solid; border-top-color: #FFC72C; border-bottom-width: 4px; border-bottom-style: solid; border-bottom-color: #FFC72C; color: #FFFFFF; font-weight: bold;">Maximum</th>
      <td headers="Maserati summary_stub_Maserati_2 hp" class="gt_row gt_right gt_summary_row gt_last_summary_row" style="background-color: #DA291C; border-left-width: 4px; border-left-style: solid; border-left-color: #FFC72C; border-right-width: 4px; border-right-style: solid; border-right-color: #FFC72C; border-top-width: 4px; border-top-style: solid; border-top-color: #FFC72C; border-bottom-width: 4px; border-bottom-style: solid; border-bottom-color: #FFC72C; color: #FFFFFF; font-weight: bold;">454</td>
      <td headers="Maserati summary_stub_Maserati_2 trq" class="gt_row gt_right gt_summary_row gt_last_summary_row" style="background-color: #DA291C; border-left-width: 4px; border-left-style: solid; border-left-color: #FFC72C; border-right-width: 4px; border-right-style: solid; border-right-color: #FFC72C; border-top-width: 4px; border-top-style: solid; border-top-color: #FFC72C; border-bottom-width: 4px; border-bottom-style: solid; border-bottom-color: #FFC72C; color: #FFFFFF; font-weight: bold;">406</td></tr>
          <tr class="gt_group_heading_row">
            <th colspan="3" class="gt_group_heading" scope="colgroup" id="Aston Martin">Aston Martin</th>
          </tr>
          <tr class="gt_row_group_first"><th id="stub_1_7" scope="row" class="gt_row gt_left gt_stub">DB11</th>
      <td headers="Aston Martin stub_1_7 hp" class="gt_row gt_right">608</td>
      <td headers="Aston Martin stub_1_7 trq" class="gt_row gt_right">516</td></tr>
          <tr><th id="stub_1_8" scope="row" class="gt_row gt_left gt_stub">Rapide S</th>
      <td headers="Aston Martin stub_1_8 hp" class="gt_row gt_right">552</td>
      <td headers="Aston Martin stub_1_8 trq" class="gt_row gt_right">465</td></tr>
          <tr><th id="stub_1_9" scope="row" class="gt_row gt_left gt_stub">Vanquish</th>
      <td headers="Aston Martin stub_1_9 hp" class="gt_row gt_right">568</td>
      <td headers="Aston Martin stub_1_9 trq" class="gt_row gt_right">465</td></tr>
          <tr><th id="stub_1_10" scope="row" class="gt_row gt_left gt_stub">Vantage</th>
      <td headers="Aston Martin stub_1_10 hp" class="gt_row gt_right">430</td>
      <td headers="Aston Martin stub_1_10 trq" class="gt_row gt_right">361</td></tr>
          <tr><th id="summary_stub_Aston Martin_1" scope="row" class="gt_row gt_left gt_stub gt_summary_row gt_first_summary_row thick" style="background-color: #DA291C; border-left-width: 4px; border-left-style: solid; border-left-color: #FFC72C; border-right-width: 4px; border-right-style: solid; border-right-color: #FFC72C; border-top-width: 4px; border-top-style: solid; border-top-color: #FFC72C; border-bottom-width: 4px; border-bottom-style: solid; border-bottom-color: #FFC72C; color: #FFFFFF; font-weight: bold;">Minimum</th>
      <td headers="Aston Martin summary_stub_Aston Martin_1 hp" class="gt_row gt_right gt_summary_row gt_first_summary_row thick" style="background-color: #DA291C; border-left-width: 4px; border-left-style: solid; border-left-color: #FFC72C; border-right-width: 4px; border-right-style: solid; border-right-color: #FFC72C; border-top-width: 4px; border-top-style: solid; border-top-color: #FFC72C; border-bottom-width: 4px; border-bottom-style: solid; border-bottom-color: #FFC72C; color: #FFFFFF; font-weight: bold;">430</td>
      <td headers="Aston Martin summary_stub_Aston Martin_1 trq" class="gt_row gt_right gt_summary_row gt_first_summary_row thick" style="background-color: #DA291C; border-left-width: 4px; border-left-style: solid; border-left-color: #FFC72C; border-right-width: 4px; border-right-style: solid; border-right-color: #FFC72C; border-top-width: 4px; border-top-style: solid; border-top-color: #FFC72C; border-bottom-width: 4px; border-bottom-style: solid; border-bottom-color: #FFC72C; color: #FFFFFF; font-weight: bold;">361</td></tr>
          <tr><th id="summary_stub_Aston Martin_2" scope="row" class="gt_row gt_left gt_stub gt_summary_row gt_last_summary_row" style="background-color: #DA291C; border-left-width: 4px; border-left-style: solid; border-left-color: #FFC72C; border-right-width: 4px; border-right-style: solid; border-right-color: #FFC72C; border-top-width: 4px; border-top-style: solid; border-top-color: #FFC72C; border-bottom-width: 4px; border-bottom-style: solid; border-bottom-color: #FFC72C; color: #FFFFFF; font-weight: bold;">Maximum</th>
      <td headers="Aston Martin summary_stub_Aston Martin_2 hp" class="gt_row gt_right gt_summary_row gt_last_summary_row" style="background-color: #DA291C; border-left-width: 4px; border-left-style: solid; border-left-color: #FFC72C; border-right-width: 4px; border-right-style: solid; border-right-color: #FFC72C; border-top-width: 4px; border-top-style: solid; border-top-color: #FFC72C; border-bottom-width: 4px; border-bottom-style: solid; border-bottom-color: #FFC72C; color: #FFFFFF; font-weight: bold;">608</td>
      <td headers="Aston Martin summary_stub_Aston Martin_2 trq" class="gt_row gt_right gt_summary_row gt_last_summary_row" style="background-color: #DA291C; border-left-width: 4px; border-left-style: solid; border-left-color: #FFC72C; border-right-width: 4px; border-right-style: solid; border-right-color: #FFC72C; border-top-width: 4px; border-top-style: solid; border-top-color: #FFC72C; border-bottom-width: 4px; border-bottom-style: solid; border-bottom-color: #FFC72C; color: #FFFFFF; font-weight: bold;">516</td></tr>
          <tr><th id="grand_summary_stub_1" scope="row" class="gt_row gt_left gt_stub gt_grand_summary_row gt_first_grand_summary_row" style="background-color: #DA291C; border-left-width: 4px; border-left-style: solid; border-left-color: #FFC72C; border-right-width: 4px; border-right-style: solid; border-right-color: #FFC72C; border-top-width: 4px; border-top-style: solid; border-top-color: #FFC72C; border-bottom-width: 4px; border-bottom-style: solid; border-bottom-color: #FFC72C; color: #FFFFFF; font-weight: bold;">Minimum</th>
      <td headers="grand_summary_stub_1 hp" class="gt_row gt_right gt_grand_summary_row gt_first_grand_summary_row" style="background-color: #DA291C; border-left-width: 4px; border-left-style: solid; border-left-color: #FFC72C; border-right-width: 4px; border-right-style: solid; border-right-color: #FFC72C; border-top-width: 4px; border-top-style: solid; border-top-color: #FFC72C; border-bottom-width: 4px; border-bottom-style: solid; border-bottom-color: #FFC72C; color: #FFFFFF; font-weight: bold;">345</td>
      <td headers="grand_summary_stub_1 trq" class="gt_row gt_right gt_grand_summary_row gt_first_grand_summary_row" style="background-color: #DA291C; border-left-width: 4px; border-left-style: solid; border-left-color: #FFC72C; border-right-width: 4px; border-right-style: solid; border-right-color: #FFC72C; border-top-width: 4px; border-top-style: solid; border-top-color: #FFC72C; border-bottom-width: 4px; border-bottom-style: solid; border-bottom-color: #FFC72C; color: #FFFFFF; font-weight: bold;">361</td></tr>
          <tr><th id="grand_summary_stub_2" scope="row" class="gt_row gt_left gt_stub gt_grand_summary_row gt_last_summary_row" style="background-color: #DA291C; border-left-width: 4px; border-left-style: solid; border-left-color: #FFC72C; border-right-width: 4px; border-right-style: solid; border-right-color: #FFC72C; border-top-width: 4px; border-top-style: solid; border-top-color: #FFC72C; border-bottom-width: 4px; border-bottom-style: solid; border-bottom-color: #FFC72C; color: #FFFFFF; font-weight: bold;">Maximum</th>
      <td headers="grand_summary_stub_2 hp" class="gt_row gt_right gt_grand_summary_row gt_last_summary_row" style="background-color: #DA291C; border-left-width: 4px; border-left-style: solid; border-left-color: #FFC72C; border-right-width: 4px; border-right-style: solid; border-right-color: #FFC72C; border-top-width: 4px; border-top-style: solid; border-top-color: #FFC72C; border-bottom-width: 4px; border-bottom-style: solid; border-bottom-color: #FFC72C; color: #FFFFFF; font-weight: bold;">700</td>
      <td headers="grand_summary_stub_2 trq" class="gt_row gt_right gt_grand_summary_row gt_last_summary_row" style="background-color: #DA291C; border-left-width: 4px; border-left-style: solid; border-left-color: #FFC72C; border-right-width: 4px; border-right-style: solid; border-right-color: #FFC72C; border-top-width: 4px; border-top-style: solid; border-top-color: #FFC72C; border-bottom-width: 4px; border-bottom-style: solid; border-bottom-color: #FFC72C; color: #FFFFFF; font-weight: bold;">516</td></tr>
        </tbody>
        
      </table>

# Summary rows can use other columns' data

    Code
      cat(render_as_html(gt_tbl))
    Output
      <table class="gt_table" data-quarto-disable-processing="false" data-quarto-bootstrap="false">
        <thead>
          <tr class="gt_col_headings">
            <th class="gt_col_heading gt_columns_bottom_border gt_left" rowspan="1" colspan="1" scope="col" id="a::stub"></th>
            <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id="date">date</th>
            <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id="close">close</th>
            <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id="volume">volume</th>
          </tr>
        </thead>
        <tbody class="gt_table_body">
          <tr><th id="stub_1_1" scope="row" class="gt_row gt_left gt_stub"></th>
      <td headers="stub_1_1 date" class="gt_row gt_right">2015-12-31</td>
      <td headers="stub_1_1 close" class="gt_row gt_right">2043.94</td>
      <td headers="stub_1_1 volume" class="gt_row gt_right">2655330000</td></tr>
          <tr><th id="stub_1_2" scope="row" class="gt_row gt_left gt_stub"></th>
      <td headers="stub_1_2 date" class="gt_row gt_right">2015-12-30</td>
      <td headers="stub_1_2 close" class="gt_row gt_right">2063.36</td>
      <td headers="stub_1_2 volume" class="gt_row gt_right">2367430000</td></tr>
          <tr><th id="stub_1_3" scope="row" class="gt_row gt_left gt_stub"></th>
      <td headers="stub_1_3 date" class="gt_row gt_right">2015-12-29</td>
      <td headers="stub_1_3 close" class="gt_row gt_right">2078.36</td>
      <td headers="stub_1_3 volume" class="gt_row gt_right">2542000000</td></tr>
          <tr><th id="stub_1_4" scope="row" class="gt_row gt_left gt_stub"></th>
      <td headers="stub_1_4 date" class="gt_row gt_right">2015-12-28</td>
      <td headers="stub_1_4 close" class="gt_row gt_right">2056.50</td>
      <td headers="stub_1_4 volume" class="gt_row gt_right">2492510000</td></tr>
          <tr><th id="stub_1_5" scope="row" class="gt_row gt_left gt_stub"></th>
      <td headers="stub_1_5 date" class="gt_row gt_right">2015-12-24</td>
      <td headers="stub_1_5 close" class="gt_row gt_right">2060.99</td>
      <td headers="stub_1_5 volume" class="gt_row gt_right">1411860000</td></tr>
          <tr><th id="stub_1_6" scope="row" class="gt_row gt_left gt_stub"></th>
      <td headers="stub_1_6 date" class="gt_row gt_right">2015-12-23</td>
      <td headers="stub_1_6 close" class="gt_row gt_right">2064.29</td>
      <td headers="stub_1_6 volume" class="gt_row gt_right">3484090000</td></tr>
          <tr><th id="stub_1_7" scope="row" class="gt_row gt_left gt_stub"></th>
      <td headers="stub_1_7 date" class="gt_row gt_right">2015-12-22</td>
      <td headers="stub_1_7 close" class="gt_row gt_right">2038.97</td>
      <td headers="stub_1_7 volume" class="gt_row gt_right">3520860000</td></tr>
          <tr><th id="stub_1_8" scope="row" class="gt_row gt_left gt_stub"></th>
      <td headers="stub_1_8 date" class="gt_row gt_right">2015-12-21</td>
      <td headers="stub_1_8 close" class="gt_row gt_right">2021.15</td>
      <td headers="stub_1_8 volume" class="gt_row gt_right">3760280000</td></tr>
          <tr><th id="stub_1_9" scope="row" class="gt_row gt_left gt_stub"></th>
      <td headers="stub_1_9 date" class="gt_row gt_right">2015-12-18</td>
      <td headers="stub_1_9 close" class="gt_row gt_right">2005.55</td>
      <td headers="stub_1_9 volume" class="gt_row gt_right">6683070000</td></tr>
          <tr><th id="stub_1_10" scope="row" class="gt_row gt_left gt_stub"></th>
      <td headers="stub_1_10 date" class="gt_row gt_right">2015-12-17</td>
      <td headers="stub_1_10 close" class="gt_row gt_right">2041.89</td>
      <td headers="stub_1_10 volume" class="gt_row gt_right">4327390000</td></tr>
          <tr><th id="stub_1_11" scope="row" class="gt_row gt_left gt_stub"></th>
      <td headers="stub_1_11 date" class="gt_row gt_right">2015-12-16</td>
      <td headers="stub_1_11 close" class="gt_row gt_right">2073.07</td>
      <td headers="stub_1_11 volume" class="gt_row gt_right">4635450000</td></tr>
          <tr><th id="stub_1_12" scope="row" class="gt_row gt_left gt_stub"></th>
      <td headers="stub_1_12 date" class="gt_row gt_right">2015-12-15</td>
      <td headers="stub_1_12 close" class="gt_row gt_right">2043.41</td>
      <td headers="stub_1_12 volume" class="gt_row gt_right">4353540000</td></tr>
          <tr><th id="stub_1_13" scope="row" class="gt_row gt_left gt_stub"></th>
      <td headers="stub_1_13 date" class="gt_row gt_right">2015-12-14</td>
      <td headers="stub_1_13 close" class="gt_row gt_right">2021.94</td>
      <td headers="stub_1_13 volume" class="gt_row gt_right">4612440000</td></tr>
          <tr><th id="stub_1_14" scope="row" class="gt_row gt_left gt_stub"></th>
      <td headers="stub_1_14 date" class="gt_row gt_right">2015-12-11</td>
      <td headers="stub_1_14 close" class="gt_row gt_right">2012.37</td>
      <td headers="stub_1_14 volume" class="gt_row gt_right">4301060000</td></tr>
          <tr><th id="stub_1_15" scope="row" class="gt_row gt_left gt_stub"></th>
      <td headers="stub_1_15 date" class="gt_row gt_right">2015-12-10</td>
      <td headers="stub_1_15 close" class="gt_row gt_right">2052.23</td>
      <td headers="stub_1_15 volume" class="gt_row gt_right">3715150000</td></tr>
          <tr><th id="stub_1_16" scope="row" class="gt_row gt_left gt_stub"></th>
      <td headers="stub_1_16 date" class="gt_row gt_right">2015-12-09</td>
      <td headers="stub_1_16 close" class="gt_row gt_right">2047.62</td>
      <td headers="stub_1_16 volume" class="gt_row gt_right">4385250000</td></tr>
          <tr><th id="stub_1_17" scope="row" class="gt_row gt_left gt_stub"></th>
      <td headers="stub_1_17 date" class="gt_row gt_right">2015-12-08</td>
      <td headers="stub_1_17 close" class="gt_row gt_right">2063.59</td>
      <td headers="stub_1_17 volume" class="gt_row gt_right">4173570000</td></tr>
          <tr><th id="stub_1_18" scope="row" class="gt_row gt_left gt_stub"></th>
      <td headers="stub_1_18 date" class="gt_row gt_right">2015-12-07</td>
      <td headers="stub_1_18 close" class="gt_row gt_right">2077.07</td>
      <td headers="stub_1_18 volume" class="gt_row gt_right">4043820000</td></tr>
          <tr><th id="stub_1_19" scope="row" class="gt_row gt_left gt_stub"></th>
      <td headers="stub_1_19 date" class="gt_row gt_right">2015-12-04</td>
      <td headers="stub_1_19 close" class="gt_row gt_right">2091.69</td>
      <td headers="stub_1_19 volume" class="gt_row gt_right">4214910000</td></tr>
          <tr><th id="stub_1_20" scope="row" class="gt_row gt_left gt_stub"></th>
      <td headers="stub_1_20 date" class="gt_row gt_right">2015-12-03</td>
      <td headers="stub_1_20 close" class="gt_row gt_right">2049.62</td>
      <td headers="stub_1_20 volume" class="gt_row gt_right">4306490000</td></tr>
          <tr><th id="stub_1_21" scope="row" class="gt_row gt_left gt_stub"></th>
      <td headers="stub_1_21 date" class="gt_row gt_right">2015-12-02</td>
      <td headers="stub_1_21 close" class="gt_row gt_right">2079.51</td>
      <td headers="stub_1_21 volume" class="gt_row gt_right">3950640000</td></tr>
          <tr><th id="stub_1_22" scope="row" class="gt_row gt_left gt_stub"></th>
      <td headers="stub_1_22 date" class="gt_row gt_right">2015-12-01</td>
      <td headers="stub_1_22 close" class="gt_row gt_right">2102.63</td>
      <td headers="stub_1_22 volume" class="gt_row gt_right">3712120000</td></tr>
          <tr><th id="grand_summary_stub_1" scope="row" class="gt_row gt_left gt_stub gt_grand_summary_row gt_first_grand_summary_row">Average close</th>
      <td headers="grand_summary_stub_1 date" class="gt_row gt_right gt_grand_summary_row gt_first_grand_summary_row">—</td>
      <td headers="grand_summary_stub_1 close" class="gt_row gt_right gt_grand_summary_row gt_first_grand_summary_row">2,054.08</td>
      <td headers="grand_summary_stub_1 volume" class="gt_row gt_right gt_grand_summary_row gt_first_grand_summary_row">—</td></tr>
          <tr><th id="grand_summary_stub_2" scope="row" class="gt_row gt_left gt_stub gt_grand_summary_row">Average volume weighted close</th>
      <td headers="grand_summary_stub_2 date" class="gt_row gt_right gt_grand_summary_row">—</td>
      <td headers="grand_summary_stub_2 close" class="gt_row gt_right gt_grand_summary_row">2,051.51</td>
      <td headers="grand_summary_stub_2 volume" class="gt_row gt_right gt_grand_summary_row">—</td></tr>
          <tr><th id="grand_summary_stub_3" scope="row" class="gt_row gt_left gt_stub gt_grand_summary_row gt_last_summary_row">Sum of `volume` in `close`</th>
      <td headers="grand_summary_stub_3 date" class="gt_row gt_right gt_grand_summary_row gt_last_summary_row">—</td>
      <td headers="grand_summary_stub_3 close" class="gt_row gt_right gt_grand_summary_row gt_last_summary_row">83,649,260,000.00</td>
      <td headers="grand_summary_stub_3 volume" class="gt_row gt_right gt_grand_summary_row gt_last_summary_row">—</td></tr>
        </tbody>
        
      </table>

