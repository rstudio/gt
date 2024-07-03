# tab_style errors if problems occur

    Code
      data %>% tab_style(style = list(cell_fill(color = "green"), cell_text(color = "white")),
      locations = cells_summary(groups = "Mercs", columns = starts_with("x"), rows = 2))
    Condition
      Error in `tab_style()`:
      ! Failed to style the summary of the table.
      Caused by error in `cells_summary()`:
      ! The location requested could not be resolved.
      * Review the expression provided as `columns`.

---

    Code
      data %>% tab_style(style = list(cell_fill(color = "green"), cell_text(color = "white")),
      locations = cells_summary(groups = "Mercs", columns = starts_with("m"), rows = starts_with(
        "x")))
    Condition
      Error in `tab_style()`:
      ! Failed to style the summary of the table.
      Caused by error in `cells_summary()`:
      ! The location requested could not be resolved.
      * Review the expression provided as `rows`.

---

    Code
      data %>% tab_style(style = list(cell_fill(color = "green"), cell_text(color = "white")),
      locations = cells_column_labels(`non existent`))
    Condition
      Error in `tab_style()`:
      ! Failed to style the column labels of the table.
      Caused by error in `cells_column_labels()`:
      ! Can't select columns that don't exist.
      x Column `non existent` doesn't exist.

---

    Code
      data %>% tab_style(style = list(cell_fill(color = "green"), cell_text(color = "white")),
      locations = cells_column_spanners(2))
    Condition
      Error in `tab_style()`:
      ! Failed to style the column spanners of the table.
      Caused by error in `cells_column_spanners()`:
      ! The following spanner indices do not exist in the data: 2.

# tab style works with grand_summary

    Code
      data %>% tab_style(style = list(cell_fill(color = "red"), cell_text(color = "white")),
      locations = cells_grand_summary(columns = starts_with("x"), rows = 2))
    Condition
      Error in `tab_style()`:
      ! Failed to style the grand summary of the table.
      Caused by error in `cells_grand_summary()`:
      ! The location requested could not be resolved.
      * Review the expression provided as `columns`.

---

    Code
      data %>% tab_style(style = list(cell_fill(color = "red"), cell_text(color = "white")),
      locations = cells_grand_summary(columns = starts_with("m"), rows = starts_with(
        "x")))
    Condition
      Error in `tab_style()`:
      ! Failed to style the grand summary of the table.
      Caused by error in `cells_grand_summary()`:
      ! The location requested could not be resolved.
      * Review the expression provided as `rows`.

# tab_style() works with a single cell

    Code
      data %>% tab_style(style = cell_fill(color = "yellow"), locations = cells_body(
        columns = "disp", rows = "Mazda RX7"))
    Condition
      Error in `tab_style()`:
      ! Failed to style the body of the table.
      Caused by error in `cells_body()`:
      ! Row `Mazda RX7` does not exist in the data.

# tab_row_group warns when others_label is not empty

    Code
      a_gt <- data %>% tab_row_group(others_label = "Others1")
    Condition
      Warning:
      Since gt v0.3.0 the `others_label` argument has been deprecated.
      * Use `tab_options(row_group.default_label = <label>)` to set this label.
      This warning is displayed once every 8 hours.

# Using fonts in `from_column()` works within `cell_*()` fns

    Code
      .
    Output
      [1] "<table class=\"gt_table\" data-quarto-disable-processing=\"false\" data-quarto-bootstrap=\"false\">\n  <thead>\n    <tr class=\"gt_col_headings\">\n      <th class=\"gt_col_heading gt_columns_bottom_border gt_left\" rowspan=\"1\" colspan=\"1\" scope=\"col\" id=\"num\">num</th>\n      <th class=\"gt_col_heading gt_columns_bottom_border gt_left\" rowspan=\"1\" colspan=\"1\" scope=\"col\" id=\"bkg_color\">bkg_color</th>\n      <th class=\"gt_col_heading gt_columns_bottom_border gt_left\" rowspan=\"1\" colspan=\"1\" scope=\"col\" id=\"txt_color\">txt_color</th>\n      <th class=\"gt_col_heading gt_columns_bottom_border gt_left\" rowspan=\"1\" colspan=\"1\" scope=\"col\" id=\"size\">size</th>\n      <th class=\"gt_col_heading gt_columns_bottom_border gt_left\" rowspan=\"1\" colspan=\"1\" scope=\"col\" id=\"align\">align</th>\n      <th class=\"gt_col_heading gt_columns_bottom_border gt_left\" rowspan=\"1\" colspan=\"1\" scope=\"col\" id=\"v_align\">v_align</th>\n      <th class=\"gt_col_heading gt_columns_bottom_border gt_left\" rowspan=\"1\" colspan=\"1\" scope=\"col\" id=\"style\">style</th>\n      <th class=\"gt_col_heading gt_columns_bottom_border gt_left\" rowspan=\"1\" colspan=\"1\" scope=\"col\" id=\"weight\">weight</th>\n      <th class=\"gt_col_heading gt_columns_bottom_border gt_left\" rowspan=\"1\" colspan=\"1\" scope=\"col\" id=\"stretch\">stretch</th>\n      <th class=\"gt_col_heading gt_columns_bottom_border gt_left\" rowspan=\"1\" colspan=\"1\" scope=\"col\" id=\"decorate\">decorate</th>\n      <th class=\"gt_col_heading gt_columns_bottom_border gt_left\" rowspan=\"1\" colspan=\"1\" scope=\"col\" id=\"transform\">transform</th>\n      <th class=\"gt_col_heading gt_columns_bottom_border gt_left\" rowspan=\"1\" colspan=\"1\" scope=\"col\" id=\"whitespace\">whitespace</th>\n      <th class=\"gt_col_heading gt_columns_bottom_border gt_right\" rowspan=\"1\" colspan=\"1\" scope=\"col\" id=\"indent\">indent</th>\n    </tr>\n  </thead>\n  <tbody class=\"gt_table_body\">\n    <tr><td headers=\"num\" class=\"gt_row gt_left\" style=\"background-color: #0000FF; color: #FFFFFF; font-size: 14px; text-align: left; vertical-align: middle; font-style: normal; font-weight: normal; font-stretch: normal; text-decoration: overline; text-transform: uppercase; white-space: normal; text-indent: 0;\">one</td>\n<td headers=\"bkg_color\" class=\"gt_row gt_left\">blue</td>\n<td headers=\"txt_color\" class=\"gt_row gt_left\">white</td>\n<td headers=\"size\" class=\"gt_row gt_left\">14px</td>\n<td headers=\"align\" class=\"gt_row gt_left\">left</td>\n<td headers=\"v_align\" class=\"gt_row gt_left\">middle</td>\n<td headers=\"style\" class=\"gt_row gt_left\">normal</td>\n<td headers=\"weight\" class=\"gt_row gt_left\">normal</td>\n<td headers=\"stretch\" class=\"gt_row gt_left\">normal</td>\n<td headers=\"decorate\" class=\"gt_row gt_left\">overline</td>\n<td headers=\"transform\" class=\"gt_row gt_left\">uppercase</td>\n<td headers=\"whitespace\" class=\"gt_row gt_left\">normal</td>\n<td headers=\"indent\" class=\"gt_row gt_right\">0</td></tr>\n    <tr><td headers=\"num\" class=\"gt_row gt_left\" style=\"background-color: #FF0000; color: #FFFFFF; font-size: 20px; text-align: right; vertical-align: top; font-style: italic; font-weight: bold; font-stretch: semi-expanded; text-decoration: line-through; text-transform: lowercase; white-space: nowrap; text-indent: 4;\">two</td>\n<td headers=\"bkg_color\" class=\"gt_row gt_left\">red</td>\n<td headers=\"txt_color\" class=\"gt_row gt_left\">#FFF</td>\n<td headers=\"size\" class=\"gt_row gt_left\">20px</td>\n<td headers=\"align\" class=\"gt_row gt_left\">right</td>\n<td headers=\"v_align\" class=\"gt_row gt_left\">top</td>\n<td headers=\"style\" class=\"gt_row gt_left\">italic</td>\n<td headers=\"weight\" class=\"gt_row gt_left\">bold</td>\n<td headers=\"stretch\" class=\"gt_row gt_left\">semi-expanded</td>\n<td headers=\"decorate\" class=\"gt_row gt_left\">line-through</td>\n<td headers=\"transform\" class=\"gt_row gt_left\">lowercase</td>\n<td headers=\"whitespace\" class=\"gt_row gt_left\">nowrap</td>\n<td headers=\"indent\" class=\"gt_row gt_right\">4</td></tr>\n    <tr><td headers=\"num\" class=\"gt_row gt_left\" style=\"background-color: #FFFF00; color: #1A1A1A; font-size: 24px; text-align: center; vertical-align: bottom; font-style: oblique; font-weight: lighter; font-stretch: expanded; text-decoration: underline; text-transform: capitalize; white-space: pre; text-indent: 8;\">three</td>\n<td headers=\"bkg_color\" class=\"gt_row gt_left\">yellow</td>\n<td headers=\"txt_color\" class=\"gt_row gt_left\">gray10</td>\n<td headers=\"size\" class=\"gt_row gt_left\">24px</td>\n<td headers=\"align\" class=\"gt_row gt_left\">center</td>\n<td headers=\"v_align\" class=\"gt_row gt_left\">bottom</td>\n<td headers=\"style\" class=\"gt_row gt_left\">oblique</td>\n<td headers=\"weight\" class=\"gt_row gt_left\">lighter</td>\n<td headers=\"stretch\" class=\"gt_row gt_left\">expanded</td>\n<td headers=\"decorate\" class=\"gt_row gt_left\">underline</td>\n<td headers=\"transform\" class=\"gt_row gt_left\">capitalize</td>\n<td headers=\"whitespace\" class=\"gt_row gt_left\">pre</td>\n<td headers=\"indent\" class=\"gt_row gt_right\">8</td></tr>\n    <tr><td headers=\"num\" class=\"gt_row gt_left\" style=\"background-color: #663399; color: rgba(255,255,255,0.93); font-size: 30px; text-align: right; vertical-align: middle; font-style: normal; font-weight: bolder; font-stretch: extra-expanded; text-decoration: underline overline; text-transform: lowercase; white-space: pre-wrap; text-indent: 10;\">four</td>\n<td headers=\"bkg_color\" class=\"gt_row gt_left\">rebeccapurple</td>\n<td headers=\"txt_color\" class=\"gt_row gt_left\">#FFFFFFEE</td>\n<td headers=\"size\" class=\"gt_row gt_left\">30px</td>\n<td headers=\"align\" class=\"gt_row gt_left\">right</td>\n<td headers=\"v_align\" class=\"gt_row gt_left\">middle</td>\n<td headers=\"style\" class=\"gt_row gt_left\">normal</td>\n<td headers=\"weight\" class=\"gt_row gt_left\">bolder</td>\n<td headers=\"stretch\" class=\"gt_row gt_left\">extra-expanded</td>\n<td headers=\"decorate\" class=\"gt_row gt_left\">underline overline</td>\n<td headers=\"transform\" class=\"gt_row gt_left\">lowercase</td>\n<td headers=\"whitespace\" class=\"gt_row gt_left\">pre-wrap</td>\n<td headers=\"indent\" class=\"gt_row gt_right\">10</td></tr>\n  </tbody>\n  \n  \n</table>"

