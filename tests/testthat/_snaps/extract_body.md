# Extraction of the table body works with variation in arguments

    Code
      extract_body(gt(exibble))
    Output
      # A tibble: 8 x 9
        num       char       fctr  date       time  datetime      currency row   group
        <chr>     <chr>      <chr> <chr>      <chr> <chr>         <chr>    <chr> <chr>
      1 1.111e-01 apricot    one   2015-01-15 13:35 2018-01-01 0~ 49.950   row_1 grp_a
      2 2.222e+00 banana     two   2015-02-15 14:40 2018-02-02 1~ 17.950   row_2 grp_a
      3 3.333e+01 coconut    three 2015-03-15 15:45 2018-03-03 0~ 1.390    row_3 grp_a
      4 4.444e+02 durian     four  2015-04-15 16:50 2018-04-04 1~ 65100.0~ row_4 grp_a
      5 5.550e+03 <NA>       five  2015-05-15 17:55 2018-05-05 0~ 1325.810 row_5 grp_b
      6 NA        fig        six   2015-06-15 <NA>  2018-06-06 1~ 13.255   row_6 grp_b
      7 7.770e+05 grapefruit seven <NA>       19:10 2018-07-07 0~ NA       row_7 grp_b
      8 8.880e+06 honeydew   eight 2015-08-15 20:20 <NA>          0.440    row_8 grp_b

---

    Code
      extract_body(gt(exibble, rowname_col = "row", groupname_col = "group"))
    Output
      # A tibble: 8 x 9
        `::group_id::` `::rowname::` num     char  fctr  date  time  datetime currency
        <chr>          <chr>         <chr>   <chr> <chr> <chr> <chr> <chr>    <chr>   
      1 grp_a          row_1         1.111e~ apri~ one   2015~ 13:35 2018-01~ 49.950  
      2 grp_a          row_2         2.222e~ bana~ two   2015~ 14:40 2018-02~ 17.950  
      3 grp_a          row_3         3.333e~ coco~ three 2015~ 15:45 2018-03~ 1.390   
      4 grp_a          row_4         4.444e~ duri~ four  2015~ 16:50 2018-04~ 65100.0~
      5 grp_b          row_5         5.550e~ <NA>  five  2015~ 17:55 2018-05~ 1325.810
      6 grp_b          row_6         NA      fig   six   2015~ <NA>  2018-06~ 13.255  
      7 grp_b          row_7         7.770e~ grap~ seven <NA>  19:10 2018-07~ NA      
      8 grp_b          row_8         8.880e~ hone~ eight 2015~ 20:20 <NA>     0.440   

---

    Code
      extract_body(gt(exibble, rowname_col = "row"))
    Output
      # A tibble: 8 x 9
        `::rowname::` num       char       fctr  date    time  datetime currency group
        <chr>         <chr>     <chr>      <chr> <chr>   <chr> <chr>    <chr>    <chr>
      1 row_1         1.111e-01 apricot    one   2015-0~ 13:35 2018-01~ 49.950   grp_a
      2 row_2         2.222e+00 banana     two   2015-0~ 14:40 2018-02~ 17.950   grp_a
      3 row_3         3.333e+01 coconut    three 2015-0~ 15:45 2018-03~ 1.390    grp_a
      4 row_4         4.444e+02 durian     four  2015-0~ 16:50 2018-04~ 65100.0~ grp_a
      5 row_5         5.550e+03 <NA>       five  2015-0~ 17:55 2018-05~ 1325.810 grp_b
      6 row_6         NA        fig        six   2015-0~ <NA>  2018-06~ 13.255   grp_b
      7 row_7         7.770e+05 grapefruit seven <NA>    19:10 2018-07~ NA       grp_b
      8 row_8         8.880e+06 honeydew   eight 2015-0~ 20:20 <NA>     0.440    grp_b

---

    Code
      extract_body(gt(exibble, groupname_col = "group"))
    Output
      # A tibble: 8 x 9
        `::group_id::` num       char       fctr  date   time  datetime currency row  
        <chr>          <chr>     <chr>      <chr> <chr>  <chr> <chr>    <chr>    <chr>
      1 grp_a          1.111e-01 apricot    one   2015-~ 13:35 2018-01~ 49.950   row_1
      2 grp_a          2.222e+00 banana     two   2015-~ 14:40 2018-02~ 17.950   row_2
      3 grp_a          3.333e+01 coconut    three 2015-~ 15:45 2018-03~ 1.390    row_3
      4 grp_a          4.444e+02 durian     four  2015-~ 16:50 2018-04~ 65100.0~ row_4
      5 grp_b          5.550e+03 <NA>       five  2015-~ 17:55 2018-05~ 1325.810 row_5
      6 grp_b          NA        fig        six   2015-~ <NA>  2018-06~ 13.255   row_6
      7 grp_b          7.770e+05 grapefruit seven <NA>   19:10 2018-07~ NA       row_7
      8 grp_b          8.880e+06 honeydew   eight 2015-~ 20:20 <NA>     0.440    row_8

---

    Code
      extract_body(cols_hide(gt(exibble), columns = matches("date")))
    Output
      # A tibble: 8 x 7
        num       char       fctr  time  currency  row   group
        <chr>     <chr>      <chr> <chr> <chr>     <chr> <chr>
      1 1.111e-01 apricot    one   13:35 49.950    row_1 grp_a
      2 2.222e+00 banana     two   14:40 17.950    row_2 grp_a
      3 3.333e+01 coconut    three 15:45 1.390     row_3 grp_a
      4 4.444e+02 durian     four  16:50 65100.000 row_4 grp_a
      5 5.550e+03 <NA>       five  17:55 1325.810  row_5 grp_b
      6 NA        fig        six   <NA>  13.255    row_6 grp_b
      7 7.770e+05 grapefruit seven 19:10 NA        row_7 grp_b
      8 8.880e+06 honeydew   eight 20:20 0.440     row_8 grp_b

---

    Code
      extract_body(cols_hide(gt(exibble, rowname_col = "row", groupname_col = "group"),
      columns = matches("date")))
    Output
      # A tibble: 8 x 7
        `::group_id::` `::rowname::` num       char       fctr  time  currency 
        <chr>          <chr>         <chr>     <chr>      <chr> <chr> <chr>    
      1 grp_a          row_1         1.111e-01 apricot    one   13:35 49.950   
      2 grp_a          row_2         2.222e+00 banana     two   14:40 17.950   
      3 grp_a          row_3         3.333e+01 coconut    three 15:45 1.390    
      4 grp_a          row_4         4.444e+02 durian     four  16:50 65100.000
      5 grp_b          row_5         5.550e+03 <NA>       five  17:55 1325.810 
      6 grp_b          row_6         NA        fig        six   <NA>  13.255   
      7 grp_b          row_7         7.770e+05 grapefruit seven 19:10 NA       
      8 grp_b          row_8         8.880e+06 honeydew   eight 20:20 0.440    

---

    Code
      extract_body(cols_hide(gt(exibble, rowname_col = "row"), columns = matches(
        "date")))
    Output
      # A tibble: 8 x 7
        `::rowname::` num       char       fctr  time  currency  group
        <chr>         <chr>     <chr>      <chr> <chr> <chr>     <chr>
      1 row_1         1.111e-01 apricot    one   13:35 49.950    grp_a
      2 row_2         2.222e+00 banana     two   14:40 17.950    grp_a
      3 row_3         3.333e+01 coconut    three 15:45 1.390     grp_a
      4 row_4         4.444e+02 durian     four  16:50 65100.000 grp_a
      5 row_5         5.550e+03 <NA>       five  17:55 1325.810  grp_b
      6 row_6         NA        fig        six   <NA>  13.255    grp_b
      7 row_7         7.770e+05 grapefruit seven 19:10 NA        grp_b
      8 row_8         8.880e+06 honeydew   eight 20:20 0.440     grp_b

---

    Code
      extract_body(cols_hide(gt(exibble, groupname_col = "group"), columns = matches(
        "date")))
    Output
      # A tibble: 8 x 7
        `::group_id::` num       char       fctr  time  currency  row  
        <chr>          <chr>     <chr>      <chr> <chr> <chr>     <chr>
      1 grp_a          1.111e-01 apricot    one   13:35 49.950    row_1
      2 grp_a          2.222e+00 banana     two   14:40 17.950    row_2
      3 grp_a          3.333e+01 coconut    three 15:45 1.390     row_3
      4 grp_a          4.444e+02 durian     four  16:50 65100.000 row_4
      5 grp_b          5.550e+03 <NA>       five  17:55 1325.810  row_5
      6 grp_b          NA        fig        six   <NA>  13.255    row_6
      7 grp_b          7.770e+05 grapefruit seven 19:10 NA        row_7
      8 grp_b          8.880e+06 honeydew   eight 20:20 0.440     row_8

---

    Code
      extract_body(gt(exibble), incl_stub_cols = FALSE)
    Output
      # A tibble: 8 x 9
        num       char       fctr  date       time  datetime      currency row   group
        <chr>     <chr>      <chr> <chr>      <chr> <chr>         <chr>    <chr> <chr>
      1 1.111e-01 apricot    one   2015-01-15 13:35 2018-01-01 0~ 49.950   row_1 grp_a
      2 2.222e+00 banana     two   2015-02-15 14:40 2018-02-02 1~ 17.950   row_2 grp_a
      3 3.333e+01 coconut    three 2015-03-15 15:45 2018-03-03 0~ 1.390    row_3 grp_a
      4 4.444e+02 durian     four  2015-04-15 16:50 2018-04-04 1~ 65100.0~ row_4 grp_a
      5 5.550e+03 <NA>       five  2015-05-15 17:55 2018-05-05 0~ 1325.810 row_5 grp_b
      6 NA        fig        six   2015-06-15 <NA>  2018-06-06 1~ 13.255   row_6 grp_b
      7 7.770e+05 grapefruit seven <NA>       19:10 2018-07-07 0~ NA       row_7 grp_b
      8 8.880e+06 honeydew   eight 2015-08-15 20:20 <NA>          0.440    row_8 grp_b

---

    Code
      extract_body(gt(exibble, rowname_col = "row", groupname_col = "group"),
      incl_stub_cols = FALSE)
    Output
      # A tibble: 8 x 7
        num       char       fctr  date       time  datetime         currency 
        <chr>     <chr>      <chr> <chr>      <chr> <chr>            <chr>    
      1 1.111e-01 apricot    one   2015-01-15 13:35 2018-01-01 02:22 49.950   
      2 2.222e+00 banana     two   2015-02-15 14:40 2018-02-02 14:33 17.950   
      3 3.333e+01 coconut    three 2015-03-15 15:45 2018-03-03 03:44 1.390    
      4 4.444e+02 durian     four  2015-04-15 16:50 2018-04-04 15:55 65100.000
      5 5.550e+03 <NA>       five  2015-05-15 17:55 2018-05-05 04:00 1325.810 
      6 NA        fig        six   2015-06-15 <NA>  2018-06-06 16:11 13.255   
      7 7.770e+05 grapefruit seven <NA>       19:10 2018-07-07 05:22 NA       
      8 8.880e+06 honeydew   eight 2015-08-15 20:20 <NA>             0.440    

---

    Code
      extract_body(gt(exibble, rowname_col = "row"), incl_stub_cols = FALSE)
    Output
      # A tibble: 8 x 8
        num       char       fctr  date       time  datetime         currency  group
        <chr>     <chr>      <chr> <chr>      <chr> <chr>            <chr>     <chr>
      1 1.111e-01 apricot    one   2015-01-15 13:35 2018-01-01 02:22 49.950    grp_a
      2 2.222e+00 banana     two   2015-02-15 14:40 2018-02-02 14:33 17.950    grp_a
      3 3.333e+01 coconut    three 2015-03-15 15:45 2018-03-03 03:44 1.390     grp_a
      4 4.444e+02 durian     four  2015-04-15 16:50 2018-04-04 15:55 65100.000 grp_a
      5 5.550e+03 <NA>       five  2015-05-15 17:55 2018-05-05 04:00 1325.810  grp_b
      6 NA        fig        six   2015-06-15 <NA>  2018-06-06 16:11 13.255    grp_b
      7 7.770e+05 grapefruit seven <NA>       19:10 2018-07-07 05:22 NA        grp_b
      8 8.880e+06 honeydew   eight 2015-08-15 20:20 <NA>             0.440     grp_b

---

    Code
      extract_body(gt(exibble, groupname_col = "group"), incl_stub_cols = FALSE)
    Output
      # A tibble: 8 x 8
        num       char       fctr  date       time  datetime         currency  row  
        <chr>     <chr>      <chr> <chr>      <chr> <chr>            <chr>     <chr>
      1 1.111e-01 apricot    one   2015-01-15 13:35 2018-01-01 02:22 49.950    row_1
      2 2.222e+00 banana     two   2015-02-15 14:40 2018-02-02 14:33 17.950    row_2
      3 3.333e+01 coconut    three 2015-03-15 15:45 2018-03-03 03:44 1.390     row_3
      4 4.444e+02 durian     four  2015-04-15 16:50 2018-04-04 15:55 65100.000 row_4
      5 5.550e+03 <NA>       five  2015-05-15 17:55 2018-05-05 04:00 1325.810  row_5
      6 NA        fig        six   2015-06-15 <NA>  2018-06-06 16:11 13.255    row_6
      7 7.770e+05 grapefruit seven <NA>       19:10 2018-07-07 05:22 NA        row_7
      8 8.880e+06 honeydew   eight 2015-08-15 20:20 <NA>             0.440     row_8

---

    Code
      extract_body(cols_hide(gt(exibble), columns = matches("date")), incl_stub_cols = FALSE)
    Output
      # A tibble: 8 x 7
        num       char       fctr  time  currency  row   group
        <chr>     <chr>      <chr> <chr> <chr>     <chr> <chr>
      1 1.111e-01 apricot    one   13:35 49.950    row_1 grp_a
      2 2.222e+00 banana     two   14:40 17.950    row_2 grp_a
      3 3.333e+01 coconut    three 15:45 1.390     row_3 grp_a
      4 4.444e+02 durian     four  16:50 65100.000 row_4 grp_a
      5 5.550e+03 <NA>       five  17:55 1325.810  row_5 grp_b
      6 NA        fig        six   <NA>  13.255    row_6 grp_b
      7 7.770e+05 grapefruit seven 19:10 NA        row_7 grp_b
      8 8.880e+06 honeydew   eight 20:20 0.440     row_8 grp_b

---

    Code
      extract_body(cols_hide(gt(exibble, rowname_col = "row", groupname_col = "group"),
      columns = matches("date")), incl_stub_cols = FALSE)
    Output
      # A tibble: 8 x 5
        num       char       fctr  time  currency 
        <chr>     <chr>      <chr> <chr> <chr>    
      1 1.111e-01 apricot    one   13:35 49.950   
      2 2.222e+00 banana     two   14:40 17.950   
      3 3.333e+01 coconut    three 15:45 1.390    
      4 4.444e+02 durian     four  16:50 65100.000
      5 5.550e+03 <NA>       five  17:55 1325.810 
      6 NA        fig        six   <NA>  13.255   
      7 7.770e+05 grapefruit seven 19:10 NA       
      8 8.880e+06 honeydew   eight 20:20 0.440    

---

    Code
      extract_body(cols_hide(gt(exibble, rowname_col = "row"), columns = matches(
        "date")), incl_stub_cols = FALSE)
    Output
      # A tibble: 8 x 6
        num       char       fctr  time  currency  group
        <chr>     <chr>      <chr> <chr> <chr>     <chr>
      1 1.111e-01 apricot    one   13:35 49.950    grp_a
      2 2.222e+00 banana     two   14:40 17.950    grp_a
      3 3.333e+01 coconut    three 15:45 1.390     grp_a
      4 4.444e+02 durian     four  16:50 65100.000 grp_a
      5 5.550e+03 <NA>       five  17:55 1325.810  grp_b
      6 NA        fig        six   <NA>  13.255    grp_b
      7 7.770e+05 grapefruit seven 19:10 NA        grp_b
      8 8.880e+06 honeydew   eight 20:20 0.440     grp_b

---

    Code
      extract_body(cols_hide(gt(exibble, groupname_col = "group"), columns = matches(
        "date")), incl_stub_cols = FALSE)
    Output
      # A tibble: 8 x 6
        num       char       fctr  time  currency  row  
        <chr>     <chr>      <chr> <chr> <chr>     <chr>
      1 1.111e-01 apricot    one   13:35 49.950    row_1
      2 2.222e+00 banana     two   14:40 17.950    row_2
      3 3.333e+01 coconut    three 15:45 1.390     row_3
      4 4.444e+02 durian     four  16:50 65100.000 row_4
      5 5.550e+03 <NA>       five  17:55 1325.810  row_5
      6 NA        fig        six   <NA>  13.255    row_6
      7 7.770e+05 grapefruit seven 19:10 NA        row_7
      8 8.880e+06 honeydew   eight 20:20 0.440     row_8

---

    Code
      extract_body(gt(exibble), incl_hidden_cols = TRUE)
    Output
      # A tibble: 8 x 9
        num       char       fctr  date       time  datetime      currency row   group
        <chr>     <chr>      <chr> <chr>      <chr> <chr>         <chr>    <chr> <chr>
      1 1.111e-01 apricot    one   2015-01-15 13:35 2018-01-01 0~ 49.950   row_1 grp_a
      2 2.222e+00 banana     two   2015-02-15 14:40 2018-02-02 1~ 17.950   row_2 grp_a
      3 3.333e+01 coconut    three 2015-03-15 15:45 2018-03-03 0~ 1.390    row_3 grp_a
      4 4.444e+02 durian     four  2015-04-15 16:50 2018-04-04 1~ 65100.0~ row_4 grp_a
      5 5.550e+03 <NA>       five  2015-05-15 17:55 2018-05-05 0~ 1325.810 row_5 grp_b
      6 NA        fig        six   2015-06-15 <NA>  2018-06-06 1~ 13.255   row_6 grp_b
      7 7.770e+05 grapefruit seven <NA>       19:10 2018-07-07 0~ NA       row_7 grp_b
      8 8.880e+06 honeydew   eight 2015-08-15 20:20 <NA>          0.440    row_8 grp_b

---

    Code
      extract_body(gt(exibble, rowname_col = "row", groupname_col = "group"),
      incl_hidden_cols = TRUE)
    Output
      # A tibble: 8 x 9
        `::group_id::` `::rowname::` num     char  fctr  date  time  datetime currency
        <chr>          <chr>         <chr>   <chr> <chr> <chr> <chr> <chr>    <chr>   
      1 grp_a          row_1         1.111e~ apri~ one   2015~ 13:35 2018-01~ 49.950  
      2 grp_a          row_2         2.222e~ bana~ two   2015~ 14:40 2018-02~ 17.950  
      3 grp_a          row_3         3.333e~ coco~ three 2015~ 15:45 2018-03~ 1.390   
      4 grp_a          row_4         4.444e~ duri~ four  2015~ 16:50 2018-04~ 65100.0~
      5 grp_b          row_5         5.550e~ <NA>  five  2015~ 17:55 2018-05~ 1325.810
      6 grp_b          row_6         NA      fig   six   2015~ <NA>  2018-06~ 13.255  
      7 grp_b          row_7         7.770e~ grap~ seven <NA>  19:10 2018-07~ NA      
      8 grp_b          row_8         8.880e~ hone~ eight 2015~ 20:20 <NA>     0.440   

---

    Code
      extract_body(gt(exibble, rowname_col = "row"), incl_hidden_cols = TRUE)
    Output
      # A tibble: 8 x 9
        `::rowname::` num       char       fctr  date    time  datetime currency group
        <chr>         <chr>     <chr>      <chr> <chr>   <chr> <chr>    <chr>    <chr>
      1 row_1         1.111e-01 apricot    one   2015-0~ 13:35 2018-01~ 49.950   grp_a
      2 row_2         2.222e+00 banana     two   2015-0~ 14:40 2018-02~ 17.950   grp_a
      3 row_3         3.333e+01 coconut    three 2015-0~ 15:45 2018-03~ 1.390    grp_a
      4 row_4         4.444e+02 durian     four  2015-0~ 16:50 2018-04~ 65100.0~ grp_a
      5 row_5         5.550e+03 <NA>       five  2015-0~ 17:55 2018-05~ 1325.810 grp_b
      6 row_6         NA        fig        six   2015-0~ <NA>  2018-06~ 13.255   grp_b
      7 row_7         7.770e+05 grapefruit seven <NA>    19:10 2018-07~ NA       grp_b
      8 row_8         8.880e+06 honeydew   eight 2015-0~ 20:20 <NA>     0.440    grp_b

---

    Code
      extract_body(gt(exibble, groupname_col = "group"), incl_hidden_cols = TRUE)
    Output
      # A tibble: 8 x 9
        `::group_id::` num       char       fctr  date   time  datetime currency row  
        <chr>          <chr>     <chr>      <chr> <chr>  <chr> <chr>    <chr>    <chr>
      1 grp_a          1.111e-01 apricot    one   2015-~ 13:35 2018-01~ 49.950   row_1
      2 grp_a          2.222e+00 banana     two   2015-~ 14:40 2018-02~ 17.950   row_2
      3 grp_a          3.333e+01 coconut    three 2015-~ 15:45 2018-03~ 1.390    row_3
      4 grp_a          4.444e+02 durian     four  2015-~ 16:50 2018-04~ 65100.0~ row_4
      5 grp_b          5.550e+03 <NA>       five  2015-~ 17:55 2018-05~ 1325.810 row_5
      6 grp_b          NA        fig        six   2015-~ <NA>  2018-06~ 13.255   row_6
      7 grp_b          7.770e+05 grapefruit seven <NA>   19:10 2018-07~ NA       row_7
      8 grp_b          8.880e+06 honeydew   eight 2015-~ 20:20 <NA>     0.440    row_8

---

    Code
      extract_body(cols_hide(gt(exibble), columns = matches("date")),
      incl_hidden_cols = TRUE)
    Output
      # A tibble: 8 x 9
        num       char       fctr  date       time  datetime      currency row   group
        <chr>     <chr>      <chr> <chr>      <chr> <chr>         <chr>    <chr> <chr>
      1 1.111e-01 apricot    one   2015-01-15 13:35 2018-01-01 0~ 49.950   row_1 grp_a
      2 2.222e+00 banana     two   2015-02-15 14:40 2018-02-02 1~ 17.950   row_2 grp_a
      3 3.333e+01 coconut    three 2015-03-15 15:45 2018-03-03 0~ 1.390    row_3 grp_a
      4 4.444e+02 durian     four  2015-04-15 16:50 2018-04-04 1~ 65100.0~ row_4 grp_a
      5 5.550e+03 <NA>       five  2015-05-15 17:55 2018-05-05 0~ 1325.810 row_5 grp_b
      6 NA        fig        six   2015-06-15 <NA>  2018-06-06 1~ 13.255   row_6 grp_b
      7 7.770e+05 grapefruit seven <NA>       19:10 2018-07-07 0~ NA       row_7 grp_b
      8 8.880e+06 honeydew   eight 2015-08-15 20:20 <NA>          0.440    row_8 grp_b

---

    Code
      extract_body(cols_hide(gt(exibble, rowname_col = "row", groupname_col = "group"),
      columns = matches("date")), incl_hidden_cols = TRUE)
    Output
      # A tibble: 8 x 9
        `::group_id::` `::rowname::` num     char  fctr  date  time  datetime currency
        <chr>          <chr>         <chr>   <chr> <chr> <chr> <chr> <chr>    <chr>   
      1 grp_a          row_1         1.111e~ apri~ one   2015~ 13:35 2018-01~ 49.950  
      2 grp_a          row_2         2.222e~ bana~ two   2015~ 14:40 2018-02~ 17.950  
      3 grp_a          row_3         3.333e~ coco~ three 2015~ 15:45 2018-03~ 1.390   
      4 grp_a          row_4         4.444e~ duri~ four  2015~ 16:50 2018-04~ 65100.0~
      5 grp_b          row_5         5.550e~ <NA>  five  2015~ 17:55 2018-05~ 1325.810
      6 grp_b          row_6         NA      fig   six   2015~ <NA>  2018-06~ 13.255  
      7 grp_b          row_7         7.770e~ grap~ seven <NA>  19:10 2018-07~ NA      
      8 grp_b          row_8         8.880e~ hone~ eight 2015~ 20:20 <NA>     0.440   

---

    Code
      extract_body(cols_hide(gt(exibble, rowname_col = "row"), columns = matches(
        "date")), incl_hidden_cols = TRUE)
    Output
      # A tibble: 8 x 9
        `::rowname::` num       char       fctr  date    time  datetime currency group
        <chr>         <chr>     <chr>      <chr> <chr>   <chr> <chr>    <chr>    <chr>
      1 row_1         1.111e-01 apricot    one   2015-0~ 13:35 2018-01~ 49.950   grp_a
      2 row_2         2.222e+00 banana     two   2015-0~ 14:40 2018-02~ 17.950   grp_a
      3 row_3         3.333e+01 coconut    three 2015-0~ 15:45 2018-03~ 1.390    grp_a
      4 row_4         4.444e+02 durian     four  2015-0~ 16:50 2018-04~ 65100.0~ grp_a
      5 row_5         5.550e+03 <NA>       five  2015-0~ 17:55 2018-05~ 1325.810 grp_b
      6 row_6         NA        fig        six   2015-0~ <NA>  2018-06~ 13.255   grp_b
      7 row_7         7.770e+05 grapefruit seven <NA>    19:10 2018-07~ NA       grp_b
      8 row_8         8.880e+06 honeydew   eight 2015-0~ 20:20 <NA>     0.440    grp_b

---

    Code
      extract_body(cols_hide(gt(exibble, groupname_col = "group"), columns = matches(
        "date")), incl_hidden_cols = TRUE)
    Output
      # A tibble: 8 x 9
        `::group_id::` num       char       fctr  date   time  datetime currency row  
        <chr>          <chr>     <chr>      <chr> <chr>  <chr> <chr>    <chr>    <chr>
      1 grp_a          1.111e-01 apricot    one   2015-~ 13:35 2018-01~ 49.950   row_1
      2 grp_a          2.222e+00 banana     two   2015-~ 14:40 2018-02~ 17.950   row_2
      3 grp_a          3.333e+01 coconut    three 2015-~ 15:45 2018-03~ 1.390    row_3
      4 grp_a          4.444e+02 durian     four  2015-~ 16:50 2018-04~ 65100.0~ row_4
      5 grp_b          5.550e+03 <NA>       five  2015-~ 17:55 2018-05~ 1325.810 row_5
      6 grp_b          NA        fig        six   2015-~ <NA>  2018-06~ 13.255   row_6
      7 grp_b          7.770e+05 grapefruit seven <NA>   19:10 2018-07~ NA       row_7
      8 grp_b          8.880e+06 honeydew   eight 2015-~ 20:20 <NA>     0.440    row_8

---

    Code
      extract_body(gt(exibble), incl_stub_cols = FALSE, incl_hidden_cols = TRUE)
    Output
      # A tibble: 8 x 9
        num       char       fctr  date       time  datetime      currency row   group
        <chr>     <chr>      <chr> <chr>      <chr> <chr>         <chr>    <chr> <chr>
      1 1.111e-01 apricot    one   2015-01-15 13:35 2018-01-01 0~ 49.950   row_1 grp_a
      2 2.222e+00 banana     two   2015-02-15 14:40 2018-02-02 1~ 17.950   row_2 grp_a
      3 3.333e+01 coconut    three 2015-03-15 15:45 2018-03-03 0~ 1.390    row_3 grp_a
      4 4.444e+02 durian     four  2015-04-15 16:50 2018-04-04 1~ 65100.0~ row_4 grp_a
      5 5.550e+03 <NA>       five  2015-05-15 17:55 2018-05-05 0~ 1325.810 row_5 grp_b
      6 NA        fig        six   2015-06-15 <NA>  2018-06-06 1~ 13.255   row_6 grp_b
      7 7.770e+05 grapefruit seven <NA>       19:10 2018-07-07 0~ NA       row_7 grp_b
      8 8.880e+06 honeydew   eight 2015-08-15 20:20 <NA>          0.440    row_8 grp_b

---

    Code
      extract_body(gt(exibble, rowname_col = "row", groupname_col = "group"),
      incl_stub_cols = FALSE, incl_hidden_cols = TRUE)
    Output
      # A tibble: 8 x 7
        num       char       fctr  date       time  datetime         currency 
        <chr>     <chr>      <chr> <chr>      <chr> <chr>            <chr>    
      1 1.111e-01 apricot    one   2015-01-15 13:35 2018-01-01 02:22 49.950   
      2 2.222e+00 banana     two   2015-02-15 14:40 2018-02-02 14:33 17.950   
      3 3.333e+01 coconut    three 2015-03-15 15:45 2018-03-03 03:44 1.390    
      4 4.444e+02 durian     four  2015-04-15 16:50 2018-04-04 15:55 65100.000
      5 5.550e+03 <NA>       five  2015-05-15 17:55 2018-05-05 04:00 1325.810 
      6 NA        fig        six   2015-06-15 <NA>  2018-06-06 16:11 13.255   
      7 7.770e+05 grapefruit seven <NA>       19:10 2018-07-07 05:22 NA       
      8 8.880e+06 honeydew   eight 2015-08-15 20:20 <NA>             0.440    

---

    Code
      extract_body(gt(exibble, rowname_col = "row"), incl_stub_cols = FALSE,
      incl_hidden_cols = TRUE)
    Output
      # A tibble: 8 x 8
        num       char       fctr  date       time  datetime         currency  group
        <chr>     <chr>      <chr> <chr>      <chr> <chr>            <chr>     <chr>
      1 1.111e-01 apricot    one   2015-01-15 13:35 2018-01-01 02:22 49.950    grp_a
      2 2.222e+00 banana     two   2015-02-15 14:40 2018-02-02 14:33 17.950    grp_a
      3 3.333e+01 coconut    three 2015-03-15 15:45 2018-03-03 03:44 1.390     grp_a
      4 4.444e+02 durian     four  2015-04-15 16:50 2018-04-04 15:55 65100.000 grp_a
      5 5.550e+03 <NA>       five  2015-05-15 17:55 2018-05-05 04:00 1325.810  grp_b
      6 NA        fig        six   2015-06-15 <NA>  2018-06-06 16:11 13.255    grp_b
      7 7.770e+05 grapefruit seven <NA>       19:10 2018-07-07 05:22 NA        grp_b
      8 8.880e+06 honeydew   eight 2015-08-15 20:20 <NA>             0.440     grp_b

---

    Code
      extract_body(gt(exibble, groupname_col = "group"), incl_stub_cols = FALSE,
      incl_hidden_cols = TRUE)
    Output
      # A tibble: 8 x 8
        num       char       fctr  date       time  datetime         currency  row  
        <chr>     <chr>      <chr> <chr>      <chr> <chr>            <chr>     <chr>
      1 1.111e-01 apricot    one   2015-01-15 13:35 2018-01-01 02:22 49.950    row_1
      2 2.222e+00 banana     two   2015-02-15 14:40 2018-02-02 14:33 17.950    row_2
      3 3.333e+01 coconut    three 2015-03-15 15:45 2018-03-03 03:44 1.390     row_3
      4 4.444e+02 durian     four  2015-04-15 16:50 2018-04-04 15:55 65100.000 row_4
      5 5.550e+03 <NA>       five  2015-05-15 17:55 2018-05-05 04:00 1325.810  row_5
      6 NA        fig        six   2015-06-15 <NA>  2018-06-06 16:11 13.255    row_6
      7 7.770e+05 grapefruit seven <NA>       19:10 2018-07-07 05:22 NA        row_7
      8 8.880e+06 honeydew   eight 2015-08-15 20:20 <NA>             0.440     row_8

---

    Code
      extract_body(cols_hide(gt(exibble), columns = matches("date")), incl_stub_cols = FALSE,
      incl_hidden_cols = TRUE)
    Output
      # A tibble: 8 x 9
        num       char       fctr  date       time  datetime      currency row   group
        <chr>     <chr>      <chr> <chr>      <chr> <chr>         <chr>    <chr> <chr>
      1 1.111e-01 apricot    one   2015-01-15 13:35 2018-01-01 0~ 49.950   row_1 grp_a
      2 2.222e+00 banana     two   2015-02-15 14:40 2018-02-02 1~ 17.950   row_2 grp_a
      3 3.333e+01 coconut    three 2015-03-15 15:45 2018-03-03 0~ 1.390    row_3 grp_a
      4 4.444e+02 durian     four  2015-04-15 16:50 2018-04-04 1~ 65100.0~ row_4 grp_a
      5 5.550e+03 <NA>       five  2015-05-15 17:55 2018-05-05 0~ 1325.810 row_5 grp_b
      6 NA        fig        six   2015-06-15 <NA>  2018-06-06 1~ 13.255   row_6 grp_b
      7 7.770e+05 grapefruit seven <NA>       19:10 2018-07-07 0~ NA       row_7 grp_b
      8 8.880e+06 honeydew   eight 2015-08-15 20:20 <NA>          0.440    row_8 grp_b

---

    Code
      extract_body(cols_hide(gt(exibble, rowname_col = "row", groupname_col = "group"),
      columns = matches("date")), incl_stub_cols = FALSE, incl_hidden_cols = TRUE)
    Output
      # A tibble: 8 x 7
        num       char       fctr  date       time  datetime         currency 
        <chr>     <chr>      <chr> <chr>      <chr> <chr>            <chr>    
      1 1.111e-01 apricot    one   2015-01-15 13:35 2018-01-01 02:22 49.950   
      2 2.222e+00 banana     two   2015-02-15 14:40 2018-02-02 14:33 17.950   
      3 3.333e+01 coconut    three 2015-03-15 15:45 2018-03-03 03:44 1.390    
      4 4.444e+02 durian     four  2015-04-15 16:50 2018-04-04 15:55 65100.000
      5 5.550e+03 <NA>       five  2015-05-15 17:55 2018-05-05 04:00 1325.810 
      6 NA        fig        six   2015-06-15 <NA>  2018-06-06 16:11 13.255   
      7 7.770e+05 grapefruit seven <NA>       19:10 2018-07-07 05:22 NA       
      8 8.880e+06 honeydew   eight 2015-08-15 20:20 <NA>             0.440    

---

    Code
      extract_body(cols_hide(gt(exibble, rowname_col = "row"), columns = matches(
        "date")), incl_stub_cols = FALSE, incl_hidden_cols = TRUE)
    Output
      # A tibble: 8 x 8
        num       char       fctr  date       time  datetime         currency  group
        <chr>     <chr>      <chr> <chr>      <chr> <chr>            <chr>     <chr>
      1 1.111e-01 apricot    one   2015-01-15 13:35 2018-01-01 02:22 49.950    grp_a
      2 2.222e+00 banana     two   2015-02-15 14:40 2018-02-02 14:33 17.950    grp_a
      3 3.333e+01 coconut    three 2015-03-15 15:45 2018-03-03 03:44 1.390     grp_a
      4 4.444e+02 durian     four  2015-04-15 16:50 2018-04-04 15:55 65100.000 grp_a
      5 5.550e+03 <NA>       five  2015-05-15 17:55 2018-05-05 04:00 1325.810  grp_b
      6 NA        fig        six   2015-06-15 <NA>  2018-06-06 16:11 13.255    grp_b
      7 7.770e+05 grapefruit seven <NA>       19:10 2018-07-07 05:22 NA        grp_b
      8 8.880e+06 honeydew   eight 2015-08-15 20:20 <NA>             0.440     grp_b

---

    Code
      extract_body(cols_hide(gt(exibble, groupname_col = "group"), columns = matches(
        "date")), incl_stub_cols = FALSE, incl_hidden_cols = TRUE)
    Output
      # A tibble: 8 x 8
        num       char       fctr  date       time  datetime         currency  row  
        <chr>     <chr>      <chr> <chr>      <chr> <chr>            <chr>     <chr>
      1 1.111e-01 apricot    one   2015-01-15 13:35 2018-01-01 02:22 49.950    row_1
      2 2.222e+00 banana     two   2015-02-15 14:40 2018-02-02 14:33 17.950    row_2
      3 3.333e+01 coconut    three 2015-03-15 15:45 2018-03-03 03:44 1.390     row_3
      4 4.444e+02 durian     four  2015-04-15 16:50 2018-04-04 15:55 65100.000 row_4
      5 5.550e+03 <NA>       five  2015-05-15 17:55 2018-05-05 04:00 1325.810  row_5
      6 NA        fig        six   2015-06-15 <NA>  2018-06-06 16:11 13.255    row_6
      7 7.770e+05 grapefruit seven <NA>       19:10 2018-07-07 05:22 NA        row_7
      8 8.880e+06 honeydew   eight 2015-08-15 20:20 <NA>             0.440     row_8

