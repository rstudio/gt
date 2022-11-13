# the function `cols_merge()` works correctly

    Code
      .
    Output
      [1] "<table class=\"gt_table\">\n  \n  <thead class=\"gt_col_headings\">\n    <tr>\n      <th class=\"gt_col_heading gt_columns_bottom_border gt_left\" rowspan=\"1\" colspan=\"1\" scope=\"col\" id=\"\"></th>\n      <th class=\"gt_col_heading gt_columns_bottom_border gt_left\" rowspan=\"1\" colspan=\"1\" scope=\"col\" id=\"b\">b</th>\n    </tr>\n  </thead>\n  <tbody class=\"gt_table_body\">\n    <tr><th id=\"stub_1_1\" scope=\"row\" class=\"gt_row gt_left gt_stub\">Part 1</th>\n<td headers=\"stub_1_1 b\" class=\"gt_row gt_left\">one</td></tr>\n    <tr><th id=\"stub_1_2\" scope=\"row\" class=\"gt_row gt_left gt_stub\">Part 2</th>\n<td headers=\"stub_1_2 b\" class=\"gt_row gt_left\">two</td></tr>\n    <tr><th id=\"stub_1_3\" scope=\"row\" class=\"gt_row gt_left gt_stub\">Part 3</th>\n<td headers=\"stub_1_3 b\" class=\"gt_row gt_left\">three</td></tr>\n    <tr><th id=\"stub_1_4\" scope=\"row\" class=\"gt_row gt_left gt_stub\">Part 4</th>\n<td headers=\"stub_1_4 b\" class=\"gt_row gt_left\">four</td></tr>\n    <tr><th id=\"stub_1_5\" scope=\"row\" class=\"gt_row gt_left gt_stub\">Part 5</th>\n<td headers=\"stub_1_5 b\" class=\"gt_row gt_left\">five</td></tr>\n  </tbody>\n  \n  \n</table>"

---

    Code
      .
    Output
      [1] "<table class=\"gt_table\">\n  \n  <thead class=\"gt_col_headings\">\n    <tr>\n      <th class=\"gt_col_heading gt_columns_bottom_border gt_left\" rowspan=\"1\" colspan=\"1\" scope=\"col\" id=\"\"></th>\n      <th class=\"gt_col_heading gt_columns_bottom_border gt_right\" rowspan=\"1\" colspan=\"1\" scope=\"col\" id=\"a\">a</th>\n    </tr>\n  </thead>\n  <tbody class=\"gt_table_body\">\n    <tr><th id=\"stub_1_1\" scope=\"row\" class=\"gt_row gt_left gt_stub\">Part one</th>\n<td headers=\"stub_1_1 a\" class=\"gt_row gt_right\">1</td></tr>\n    <tr><th id=\"stub_1_2\" scope=\"row\" class=\"gt_row gt_left gt_stub\">Part two</th>\n<td headers=\"stub_1_2 a\" class=\"gt_row gt_right\">2</td></tr>\n    <tr><th id=\"stub_1_3\" scope=\"row\" class=\"gt_row gt_left gt_stub\">Part three</th>\n<td headers=\"stub_1_3 a\" class=\"gt_row gt_right\">3</td></tr>\n    <tr><th id=\"stub_1_4\" scope=\"row\" class=\"gt_row gt_left gt_stub\">Part four</th>\n<td headers=\"stub_1_4 a\" class=\"gt_row gt_right\">4</td></tr>\n    <tr><th id=\"stub_1_5\" scope=\"row\" class=\"gt_row gt_left gt_stub\">Part five</th>\n<td headers=\"stub_1_5 a\" class=\"gt_row gt_right\">5</td></tr>\n  </tbody>\n  \n  \n</table>"

---

    Code
      .
    Output
      [1] "<table class=\"gt_table\">\n  \n  <thead class=\"gt_col_headings\">\n    <tr>\n      <th class=\"gt_col_heading gt_columns_bottom_border gt_left\" rowspan=\"1\" colspan=\"1\" scope=\"col\" id=\"\"></th>\n      <th class=\"gt_col_heading gt_columns_bottom_border gt_left\" rowspan=\"1\" colspan=\"1\" scope=\"col\" id=\"b\">b</th>\n    </tr>\n  </thead>\n  <tbody class=\"gt_table_body\">\n    <tr><th id=\"stub_1_1\" scope=\"row\" class=\"gt_row gt_left gt_stub\">Part i</th>\n<td headers=\"stub_1_1 b\" class=\"gt_row gt_left\">one</td></tr>\n    <tr><th id=\"stub_1_2\" scope=\"row\" class=\"gt_row gt_left gt_stub\">Part ii</th>\n<td headers=\"stub_1_2 b\" class=\"gt_row gt_left\">two</td></tr>\n    <tr><th id=\"stub_1_3\" scope=\"row\" class=\"gt_row gt_left gt_stub\">Part iii</th>\n<td headers=\"stub_1_3 b\" class=\"gt_row gt_left\">three</td></tr>\n    <tr><th id=\"stub_1_4\" scope=\"row\" class=\"gt_row gt_left gt_stub\">Part iv</th>\n<td headers=\"stub_1_4 b\" class=\"gt_row gt_left\">four</td></tr>\n    <tr><th id=\"stub_1_5\" scope=\"row\" class=\"gt_row gt_left gt_stub\">Part v</th>\n<td headers=\"stub_1_5 b\" class=\"gt_row gt_left\">five</td></tr>\n  </tbody>\n  \n  \n</table>"

# the `cols_merge_uncert()` function works correctly

    Code
      .
    Output
      [1] "<table class=\"gt_table\">\n  \n  <thead class=\"gt_col_headings\">\n    <tr>\n      <th class=\"gt_col_heading gt_columns_bottom_border gt_left\" rowspan=\"1\" colspan=\"1\" scope=\"col\" id=\"\"></th>\n      <th class=\"gt_col_heading gt_columns_bottom_border gt_left\" rowspan=\"1\" colspan=\"1\" scope=\"col\" id=\"b\">b</th>\n    </tr>\n  </thead>\n  <tbody class=\"gt_table_body\">\n    <tr><th id=\"stub_1_1\" scope=\"row\" class=\"gt_row gt_right gt_stub\">2.3 ± 0.06</th>\n<td headers=\"stub_1_1 b\" class=\"gt_row gt_left\">A</td></tr>\n    <tr><th id=\"stub_1_2\" scope=\"row\" class=\"gt_row gt_right gt_stub\">6.3 ± 0.07</th>\n<td headers=\"stub_1_2 b\" class=\"gt_row gt_left\">B</td></tr>\n    <tr><th id=\"stub_1_3\" scope=\"row\" class=\"gt_row gt_right gt_stub\">2.5 ± 0.08</th>\n<td headers=\"stub_1_3 b\" class=\"gt_row gt_left\">C</td></tr>\n    <tr><th id=\"stub_1_4\" scope=\"row\" class=\"gt_row gt_right gt_stub\">2.4 ± 0.09</th>\n<td headers=\"stub_1_4 b\" class=\"gt_row gt_left\">D</td></tr>\n    <tr><th id=\"stub_1_5\" scope=\"row\" class=\"gt_row gt_right gt_stub\">6.5 ± 0.10</th>\n<td headers=\"stub_1_5 b\" class=\"gt_row gt_left\">E</td></tr>\n  </tbody>\n  \n  \n</table>"

# the `cols_merge_range()` function works correctly

    Code
      .
    Output
      [1] "<table class=\"gt_table\">\n  \n  <thead class=\"gt_col_headings\">\n    <tr>\n      <th class=\"gt_col_heading gt_columns_bottom_border gt_left\" rowspan=\"1\" colspan=\"1\" scope=\"col\" id=\"\"></th>\n      <th class=\"gt_col_heading gt_columns_bottom_border gt_left\" rowspan=\"1\" colspan=\"1\" scope=\"col\" id=\"b\">b</th>\n    </tr>\n  </thead>\n  <tbody class=\"gt_table_body\">\n    <tr><th id=\"stub_1_1\" scope=\"row\" class=\"gt_row gt_right gt_stub\">1–6</th>\n<td headers=\"stub_1_1 b\" class=\"gt_row gt_left\">one</td></tr>\n    <tr><th id=\"stub_1_2\" scope=\"row\" class=\"gt_row gt_right gt_stub\">2–7</th>\n<td headers=\"stub_1_2 b\" class=\"gt_row gt_left\">two</td></tr>\n    <tr><th id=\"stub_1_3\" scope=\"row\" class=\"gt_row gt_right gt_stub\">3–8</th>\n<td headers=\"stub_1_3 b\" class=\"gt_row gt_left\">three</td></tr>\n    <tr><th id=\"stub_1_4\" scope=\"row\" class=\"gt_row gt_right gt_stub\">4–9</th>\n<td headers=\"stub_1_4 b\" class=\"gt_row gt_left\">four</td></tr>\n    <tr><th id=\"stub_1_5\" scope=\"row\" class=\"gt_row gt_right gt_stub\">5–10</th>\n<td headers=\"stub_1_5 b\" class=\"gt_row gt_left\">five</td></tr>\n  </tbody>\n  \n  \n</table>"

---

    Code
      .
    Output
      [1] "<table class=\"gt_table\">\n  \n  <thead class=\"gt_col_headings\">\n    <tr>\n      <th class=\"gt_col_heading gt_columns_bottom_border gt_left\" rowspan=\"1\" colspan=\"1\" scope=\"col\" id=\"\"></th>\n      <th class=\"gt_col_heading gt_columns_bottom_border gt_right\" rowspan=\"1\" colspan=\"1\" scope=\"col\" id=\"a\">a</th>\n    </tr>\n  </thead>\n  <tbody class=\"gt_table_body\">\n    <tr><th id=\"stub_1_1\" scope=\"row\" class=\"gt_row gt_right gt_stub\">1–one</th>\n<td headers=\"stub_1_1 a\" class=\"gt_row gt_right\">6</td></tr>\n    <tr><th id=\"stub_1_2\" scope=\"row\" class=\"gt_row gt_right gt_stub\">2–two</th>\n<td headers=\"stub_1_2 a\" class=\"gt_row gt_right\">7</td></tr>\n    <tr><th id=\"stub_1_3\" scope=\"row\" class=\"gt_row gt_right gt_stub\">3–three</th>\n<td headers=\"stub_1_3 a\" class=\"gt_row gt_right\">8</td></tr>\n    <tr><th id=\"stub_1_4\" scope=\"row\" class=\"gt_row gt_right gt_stub\">4–four</th>\n<td headers=\"stub_1_4 a\" class=\"gt_row gt_right\">9</td></tr>\n    <tr><th id=\"stub_1_5\" scope=\"row\" class=\"gt_row gt_right gt_stub\">5–five</th>\n<td headers=\"stub_1_5 a\" class=\"gt_row gt_right\">10</td></tr>\n  </tbody>\n  \n  \n</table>"

---

    Code
      .
    Output
      [1] "<table class=\"gt_table\">\n  \n  <thead class=\"gt_col_headings\">\n    <tr>\n      <th class=\"gt_col_heading gt_columns_bottom_border gt_left\" rowspan=\"1\" colspan=\"1\" scope=\"col\" id=\"\"></th>\n      <th class=\"gt_col_heading gt_columns_bottom_border gt_left\" rowspan=\"1\" colspan=\"1\" scope=\"col\" id=\"b\">b</th>\n    </tr>\n  </thead>\n  <tbody class=\"gt_table_body\">\n    <tr><th id=\"stub_1_1\" scope=\"row\" class=\"gt_row gt_right gt_stub\">1–vi</th>\n<td headers=\"stub_1_1 b\" class=\"gt_row gt_left\">one</td></tr>\n    <tr><th id=\"stub_1_2\" scope=\"row\" class=\"gt_row gt_right gt_stub\">2–vii</th>\n<td headers=\"stub_1_2 b\" class=\"gt_row gt_left\">two</td></tr>\n    <tr><th id=\"stub_1_3\" scope=\"row\" class=\"gt_row gt_right gt_stub\">3–viii</th>\n<td headers=\"stub_1_3 b\" class=\"gt_row gt_left\">three</td></tr>\n    <tr><th id=\"stub_1_4\" scope=\"row\" class=\"gt_row gt_right gt_stub\">4–ix</th>\n<td headers=\"stub_1_4 b\" class=\"gt_row gt_left\">four</td></tr>\n    <tr><th id=\"stub_1_5\" scope=\"row\" class=\"gt_row gt_right gt_stub\">5–x</th>\n<td headers=\"stub_1_5 b\" class=\"gt_row gt_left\">five</td></tr>\n  </tbody>\n  \n  \n</table>"

---

    Code
      .
    Output
      [1] "<table class=\"gt_table\">\n  \n  <thead class=\"gt_col_headings\">\n    <tr>\n      <th class=\"gt_col_heading gt_columns_bottom_border gt_left\" rowspan=\"1\" colspan=\"1\" scope=\"col\" id=\"\"></th>\n      <th class=\"gt_col_heading gt_columns_bottom_border gt_left\" rowspan=\"1\" colspan=\"1\" scope=\"col\" id=\"b\">b</th>\n    </tr>\n  </thead>\n  <tbody class=\"gt_table_body\">\n    <tr><th id=\"stub_1_1\" scope=\"row\" class=\"gt_row gt_right gt_stub\">i–6</th>\n<td headers=\"stub_1_1 b\" class=\"gt_row gt_left\">one</td></tr>\n    <tr><th id=\"stub_1_2\" scope=\"row\" class=\"gt_row gt_right gt_stub\">ii–7</th>\n<td headers=\"stub_1_2 b\" class=\"gt_row gt_left\">two</td></tr>\n    <tr><th id=\"stub_1_3\" scope=\"row\" class=\"gt_row gt_right gt_stub\">iii–8</th>\n<td headers=\"stub_1_3 b\" class=\"gt_row gt_left\">three</td></tr>\n    <tr><th id=\"stub_1_4\" scope=\"row\" class=\"gt_row gt_right gt_stub\">iv–9</th>\n<td headers=\"stub_1_4 b\" class=\"gt_row gt_left\">four</td></tr>\n    <tr><th id=\"stub_1_5\" scope=\"row\" class=\"gt_row gt_right gt_stub\">v–10</th>\n<td headers=\"stub_1_5 b\" class=\"gt_row gt_left\">five</td></tr>\n  </tbody>\n  \n  \n</table>"

# the `cols_merge_n_pct()` function works correctly

    Code
      .
    Output
      [1] "<table class=\"gt_table\">\n  \n  <thead class=\"gt_col_headings\">\n    <tr>\n      <th class=\"gt_col_heading gt_columns_bottom_border gt_left\" rowspan=\"1\" colspan=\"1\" scope=\"col\" id=\"\"></th>\n      <th class=\"gt_col_heading gt_columns_bottom_border gt_left\" rowspan=\"1\" colspan=\"1\" scope=\"col\" id=\"b\">b</th>\n    </tr>\n  </thead>\n  <tbody class=\"gt_table_body\">\n    <tr><th id=\"stub_1_1\" scope=\"row\" class=\"gt_row gt_right gt_stub\">1 (6.00%)</th>\n<td headers=\"stub_1_1 b\" class=\"gt_row gt_left\">A</td></tr>\n    <tr><th id=\"stub_1_2\" scope=\"row\" class=\"gt_row gt_right gt_stub\">2 (7.00%)</th>\n<td headers=\"stub_1_2 b\" class=\"gt_row gt_left\">B</td></tr>\n    <tr><th id=\"stub_1_3\" scope=\"row\" class=\"gt_row gt_right gt_stub\">3 (8.00%)</th>\n<td headers=\"stub_1_3 b\" class=\"gt_row gt_left\">C</td></tr>\n    <tr><th id=\"stub_1_4\" scope=\"row\" class=\"gt_row gt_right gt_stub\">4 (9.00%)</th>\n<td headers=\"stub_1_4 b\" class=\"gt_row gt_left\">D</td></tr>\n    <tr><th id=\"stub_1_5\" scope=\"row\" class=\"gt_row gt_right gt_stub\">5 (10.00%)</th>\n<td headers=\"stub_1_5 b\" class=\"gt_row gt_left\">E</td></tr>\n  </tbody>\n  \n  \n</table>"

