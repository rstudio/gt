# create_columns_component_g creates columns and spanners

    Code
      test
    Output
        left right top bottom label
      1    1     1   1      3     S
      2    3     4   1      1    BC
      3    2     3   2      2    AB
      4    2     2   3      3     A
      5    3     3   3      3     B
      6    4     4   3      3     C
                                                                              classes
      1                             gt_col_heading, gt_columns_bottom_border, gt_left
      2 gt_center, gt_column_spanner, gt_columns_top_border, gt_columns_spanner_outer
      3                                                  gt_center, gt_column_spanner
      4                            gt_col_heading, gt_columns_bottom_border, gt_right
      5                            gt_col_heading, gt_columns_bottom_border, gt_right
      6                            gt_col_heading, gt_columns_bottom_border, gt_right
        style         name
      1  <NA>     stubhead
      2  <NA>      spanner
      3  <NA>      spanner
      4  <NA> column_label
      5  <NA> column_label
      6  <NA> column_label

# Styles end up in the correct cells

    Code
      test
    Output
         left right top bottom       label
      1     1     4   1      1       Title
      2     1     4   2      2    Subtitle
      3     1     1   3      5        stub
      4     3     4   3      3          YZ
      5     4     4   5      5           z
      6     3     3   9      9          12
      7     1     1  10     10            
      8     2     2  11     11         2.5
      9     1     4  12     12           Y
      10    1     1  16     16        mean
      11    1     1  17     17         sum
      12    3     3  17     17          91
      13    1     4  19     19 Source note
      14    1     4  18     18    Footnote
      15    1     4   6     17            
      16    1     4   1     19            
                                                                                                 classes
      1                                                             gt_heading, gt_title, gt_font_normal
      2                                        gt_bottom_border, gt_heading, gt_subtitle, gt_font_normal
      3                                                gt_col_heading, gt_columns_bottom_border, gt_left
      4                    gt_center, gt_column_spanner, gt_columns_top_border, gt_columns_spanner_outer
      5                                                gt_col_heading, gt_columns_bottom_border, gt_left
      6                                                                                 gt_right, gt_row
      7                                                                         gt_stub, gt_left, gt_row
      8                gt_summary_row, gt_right, gt_first_summary_row.thick, gt_last_summary_row, gt_row
      9                                                   gt_group_heading, gt_group_heading_row, gt_row
      10       gt_summary_row, gt_stub, gt_left, gt_first_summary_row.thick, gt_last_summary_row, gt_row
      11 gt_grand_summary_row, gt_stub, gt_left, gt_first_grand_summary_row, gt_last_summary_row, gt_row
      12         gt_grand_summary_row, gt_right, gt_first_grand_summary_row, gt_last_summary_row, gt_row
      13                                                                   gt_sourcenotes, gt_sourcenote
      14                                                                       gt_footnotes, gt_footnote
      15                                                                                   gt_table_body
      16                                                                                        gt_table
                                 style          name
      1     background-color: #FF69B4;         title
      2     background-color: #FFD700;      subtitle
      3     background-color: #1E90FF;      stubhead
      4     background-color: #32CD32;       spanner
      5     background-color: #0000FF;  column_label
      6     background-color: #FF0000;     body_cell
      7     background-color: #FF00FF;     body_cell
      8     background-color: #00FF00; group_summary
      9     background-color: #FFFF00; group_heading
      10    background-color: #00FFFF; group_summary
      11    background-color: #FFA500; grand_summary
      12    background-color: #A020F0; grand_summary
      13    background-color: #B03060;  source_notes
      14    background-color: #BEBEBE;     footnotes
      15 background-color: transparent    table_body
      16 background-color: transparent         table

